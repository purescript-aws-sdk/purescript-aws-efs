## Module AWS.EFS

<fullname>Amazon Elastic File System</fullname> <p>Amazon Elastic File System (Amazon EFS) provides simple, scalable file storage for use with Amazon EC2 instances in the AWS Cloud. With Amazon EFS, storage capacity is elastic, growing and shrinking automatically as you add and remove files, so your applications have the storage they need, when they need it. For more information, see the <a href="http://docs.aws.amazon.com/efs/latest/ug/api-reference.html">User Guide</a>.</p>

#### `createFileSystem`

``` purescript
createFileSystem :: forall eff. CreateFileSystemRequest -> Aff (exception :: EXCEPTION | eff) FileSystemDescription
```

<p>Creates a new, empty file system. The operation requires a creation token in the request that Amazon EFS uses to ensure idempotent creation (calling the operation with same creation token has no effect). If a file system does not currently exist that is owned by the caller's AWS account with the specified creation token, this operation does the following:</p> <ul> <li> <p>Creates a new, empty file system. The file system will have an Amazon EFS assigned ID, and an initial lifecycle state <code>creating</code>.</p> </li> <li> <p>Returns with the description of the created file system.</p> </li> </ul> <p>Otherwise, this operation returns a <code>FileSystemAlreadyExists</code> error with the ID of the existing file system.</p> <note> <p>For basic use cases, you can use a randomly generated UUID for the creation token.</p> </note> <p> The idempotent operation allows you to retry a <code>CreateFileSystem</code> call without risk of creating an extra file system. This can happen when an initial call fails in a way that leaves it uncertain whether or not a file system was actually created. An example might be that a transport level timeout occurred or your connection was reset. As long as you use the same creation token, if the initial call had succeeded in creating a file system, the client can learn of its existence from the <code>FileSystemAlreadyExists</code> error.</p> <note> <p>The <code>CreateFileSystem</code> call returns while the file system's lifecycle state is still <code>creating</code>. You can check the file system creation status by calling the <a>DescribeFileSystems</a> operation, which among other things returns the file system state.</p> </note> <p>This operation also takes an optional <code>PerformanceMode</code> parameter that you choose for your file system. We recommend <code>generalPurpose</code> performance mode for most file systems. File systems using the <code>maxIO</code> performance mode can scale to higher levels of aggregate throughput and operations per second with a tradeoff of slightly higher latencies for most file operations. The performance mode can't be changed after the file system has been created. For more information, see <a href="http://docs.aws.amazon.com/efs/latest/ug/performance.html#performancemodes.html">Amazon EFS: Performance Modes</a>.</p> <p>After the file system is fully created, Amazon EFS sets its lifecycle state to <code>available</code>, at which point you can create one or more mount targets for the file system in your VPC. For more information, see <a>CreateMountTarget</a>. You mount your Amazon EFS file system on an EC2 instances in your VPC via the mount target. For more information, see <a href="http://docs.aws.amazon.com/efs/latest/ug/how-it-works.html">Amazon EFS: How it Works</a>. </p> <p> This operation requires permissions for the <code>elasticfilesystem:CreateFileSystem</code> action. </p>

#### `createMountTarget`

``` purescript
createMountTarget :: forall eff. CreateMountTargetRequest -> Aff (exception :: EXCEPTION | eff) MountTargetDescription
```

<p>Creates a mount target for a file system. You can then mount the file system on EC2 instances via the mount target.</p> <p>You can create one mount target in each Availability Zone in your VPC. All EC2 instances in a VPC within a given Availability Zone share a single mount target for a given file system. If you have multiple subnets in an Availability Zone, you create a mount target in one of the subnets. EC2 instances do not need to be in the same subnet as the mount target in order to access their file system. For more information, see <a href="http://docs.aws.amazon.com/efs/latest/ug/how-it-works.html">Amazon EFS: How it Works</a>. </p> <p>In the request, you also specify a file system ID for which you are creating the mount target and the file system's lifecycle state must be <code>available</code>. For more information, see <a>DescribeFileSystems</a>.</p> <p>In the request, you also provide a subnet ID, which determines the following:</p> <ul> <li> <p>VPC in which Amazon EFS creates the mount target</p> </li> <li> <p>Availability Zone in which Amazon EFS creates the mount target</p> </li> <li> <p>IP address range from which Amazon EFS selects the IP address of the mount target (if you don't specify an IP address in the request)</p> </li> </ul> <p>After creating the mount target, Amazon EFS returns a response that includes, a <code>MountTargetId</code> and an <code>IpAddress</code>. You use this IP address when mounting the file system in an EC2 instance. You can also use the mount target's DNS name when mounting the file system. The EC2 instance on which you mount the file system via the mount target can resolve the mount target's DNS name to its IP address. For more information, see <a href="http://docs.aws.amazon.com/efs/latest/ug/how-it-works.html#how-it-works-implementation">How it Works: Implementation Overview</a>. </p> <p>Note that you can create mount targets for a file system in only one VPC, and there can be only one mount target per Availability Zone. That is, if the file system already has one or more mount targets created for it, the subnet specified in the request to add another mount target must meet the following requirements:</p> <ul> <li> <p>Must belong to the same VPC as the subnets of the existing mount targets</p> </li> <li> <p>Must not be in the same Availability Zone as any of the subnets of the existing mount targets</p> </li> </ul> <p>If the request satisfies the requirements, Amazon EFS does the following:</p> <ul> <li> <p>Creates a new mount target in the specified subnet.</p> </li> <li> <p>Also creates a new network interface in the subnet as follows:</p> <ul> <li> <p>If the request provides an <code>IpAddress</code>, Amazon EFS assigns that IP address to the network interface. Otherwise, Amazon EFS assigns a free address in the subnet (in the same way that the Amazon EC2 <code>CreateNetworkInterface</code> call does when a request does not specify a primary private IP address).</p> </li> <li> <p>If the request provides <code>SecurityGroups</code>, this network interface is associated with those security groups. Otherwise, it belongs to the default security group for the subnet's VPC.</p> </li> <li> <p>Assigns the description <code>Mount target <i>fsmt-id</i> for file system <i>fs-id</i> </code> where <code> <i>fsmt-id</i> </code> is the mount target ID, and <code> <i>fs-id</i> </code> is the <code>FileSystemId</code>.</p> </li> <li> <p>Sets the <code>requesterManaged</code> property of the network interface to <code>true</code>, and the <code>requesterId</code> value to <code>EFS</code>.</p> </li> </ul> <p>Each Amazon EFS mount target has one corresponding requester-managed EC2 network interface. After the network interface is created, Amazon EFS sets the <code>NetworkInterfaceId</code> field in the mount target's description to the network interface ID, and the <code>IpAddress</code> field to its address. If network interface creation fails, the entire <code>CreateMountTarget</code> operation fails.</p> </li> </ul> <note> <p>The <code>CreateMountTarget</code> call returns only after creating the network interface, but while the mount target state is still <code>creating</code>, you can check the mount target creation status by calling the <a>DescribeMountTargets</a> operation, which among other things returns the mount target state.</p> </note> <p>We recommend you create a mount target in each of the Availability Zones. There are cost considerations for using a file system in an Availability Zone through a mount target created in another Availability Zone. For more information, see <a href="http://aws.amazon.com/efs/">Amazon EFS</a>. In addition, by always using a mount target local to the instance's Availability Zone, you eliminate a partial failure scenario. If the Availability Zone in which your mount target is created goes down, then you won't be able to access your file system through that mount target. </p> <p>This operation requires permissions for the following action on the file system:</p> <ul> <li> <p> <code>elasticfilesystem:CreateMountTarget</code> </p> </li> </ul> <p>This operation also requires permissions for the following Amazon EC2 actions:</p> <ul> <li> <p> <code>ec2:DescribeSubnets</code> </p> </li> <li> <p> <code>ec2:DescribeNetworkInterfaces</code> </p> </li> <li> <p> <code>ec2:CreateNetworkInterface</code> </p> </li> </ul>

#### `createTags`

``` purescript
createTags :: forall eff. CreateTagsRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Creates or overwrites tags associated with a file system. Each tag is a key-value pair. If a tag key specified in the request already exists on the file system, this operation overwrites its value with the value provided in the request. If you add the <code>Name</code> tag to your file system, Amazon EFS returns it in the response to the <a>DescribeFileSystems</a> operation. </p> <p>This operation requires permission for the <code>elasticfilesystem:CreateTags</code> action.</p>

#### `deleteFileSystem`

``` purescript
deleteFileSystem :: forall eff. DeleteFileSystemRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes a file system, permanently severing access to its contents. Upon return, the file system no longer exists and you can't access any contents of the deleted file system.</p> <p> You can't delete a file system that is in use. That is, if the file system has any mount targets, you must first delete them. For more information, see <a>DescribeMountTargets</a> and <a>DeleteMountTarget</a>. </p> <note> <p>The <code>DeleteFileSystem</code> call returns while the file system state is still <code>deleting</code>. You can check the file system deletion status by calling the <a>DescribeFileSystems</a> operation, which returns a list of file systems in your account. If you pass file system ID or creation token for the deleted file system, the <a>DescribeFileSystems</a> returns a <code>404 FileSystemNotFound</code> error.</p> </note> <p>This operation requires permissions for the <code>elasticfilesystem:DeleteFileSystem</code> action.</p>

#### `deleteMountTarget`

``` purescript
deleteMountTarget :: forall eff. DeleteMountTargetRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes the specified mount target.</p> <p>This operation forcibly breaks any mounts of the file system via the mount target that is being deleted, which might disrupt instances or applications using those mounts. To avoid applications getting cut off abruptly, you might consider unmounting any mounts of the mount target, if feasible. The operation also deletes the associated network interface. Uncommitted writes may be lost, but breaking a mount target using this operation does not corrupt the file system itself. The file system you created remains. You can mount an EC2 instance in your VPC via another mount target.</p> <p>This operation requires permissions for the following action on the file system:</p> <ul> <li> <p> <code>elasticfilesystem:DeleteMountTarget</code> </p> </li> </ul> <note> <p>The <code>DeleteMountTarget</code> call returns while the mount target state is still <code>deleting</code>. You can check the mount target deletion by calling the <a>DescribeMountTargets</a> operation, which returns a list of mount target descriptions for the given file system. </p> </note> <p>The operation also requires permissions for the following Amazon EC2 action on the mount target's network interface:</p> <ul> <li> <p> <code>ec2:DeleteNetworkInterface</code> </p> </li> </ul>

#### `deleteTags`

``` purescript
deleteTags :: forall eff. DeleteTagsRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes the specified tags from a file system. If the <code>DeleteTags</code> request includes a tag key that does not exist, Amazon EFS ignores it and doesn't cause an error. For more information about tags and related restrictions, see <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Tag Restrictions</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p> <p>This operation requires permissions for the <code>elasticfilesystem:DeleteTags</code> action.</p>

#### `describeFileSystems`

``` purescript
describeFileSystems :: forall eff. DescribeFileSystemsRequest -> Aff (exception :: EXCEPTION | eff) DescribeFileSystemsResponse
```

<p>Returns the description of a specific Amazon EFS file system if either the file system <code>CreationToken</code> or the <code>FileSystemId</code> is provided. Otherwise, it returns descriptions of all file systems owned by the caller's AWS account in the AWS Region of the endpoint that you're calling.</p> <p> When retrieving all file system descriptions, you can optionally specify the <code>MaxItems</code> parameter to limit the number of descriptions in a response. If more file system descriptions remain, Amazon EFS returns a <code>NextMarker</code>, an opaque token, in the response. In this case, you should send a subsequent request with the <code>Marker</code> request parameter set to the value of <code>NextMarker</code>. </p> <p>To retrieve a list of your file system descriptions, this operation is used in an iterative process, where <code>DescribeFileSystems</code> is called first without the <code>Marker</code> and then the operation continues to call it with the <code>Marker</code> parameter set to the value of the <code>NextMarker</code> from the previous response until the response has no <code>NextMarker</code>. </p> <p>The implementation may return fewer than <code>MaxItems</code> file system descriptions while still including a <code>NextMarker</code> value. </p> <p> The order of file systems returned in the response of one <code>DescribeFileSystems</code> call and the order of file systems returned across the responses of a multi-call iteration is unspecified. </p> <p> This operation requires permissions for the <code>elasticfilesystem:DescribeFileSystems</code> action. </p>

#### `describeMountTargetSecurityGroups`

``` purescript
describeMountTargetSecurityGroups :: forall eff. DescribeMountTargetSecurityGroupsRequest -> Aff (exception :: EXCEPTION | eff) DescribeMountTargetSecurityGroupsResponse
```

<p>Returns the security groups currently in effect for a mount target. This operation requires that the network interface of the mount target has been created and the lifecycle state of the mount target is not <code>deleted</code>.</p> <p>This operation requires permissions for the following actions:</p> <ul> <li> <p> <code>elasticfilesystem:DescribeMountTargetSecurityGroups</code> action on the mount target's file system. </p> </li> <li> <p> <code>ec2:DescribeNetworkInterfaceAttribute</code> action on the mount target's network interface. </p> </li> </ul>

#### `describeMountTargets`

``` purescript
describeMountTargets :: forall eff. DescribeMountTargetsRequest -> Aff (exception :: EXCEPTION | eff) DescribeMountTargetsResponse
```

<p>Returns the descriptions of all the current mount targets, or a specific mount target, for a file system. When requesting all of the current mount targets, the order of mount targets returned in the response is unspecified.</p> <p>This operation requires permissions for the <code>elasticfilesystem:DescribeMountTargets</code> action, on either the file system ID that you specify in <code>FileSystemId</code>, or on the file system of the mount target that you specify in <code>MountTargetId</code>.</p>

#### `describeTags`

``` purescript
describeTags :: forall eff. DescribeTagsRequest -> Aff (exception :: EXCEPTION | eff) DescribeTagsResponse
```

<p>Returns the tags associated with a file system. The order of tags returned in the response of one <code>DescribeTags</code> call and the order of tags returned across the responses of a multi-call iteration (when using pagination) is unspecified. </p> <p> This operation requires permissions for the <code>elasticfilesystem:DescribeTags</code> action. </p>

#### `modifyMountTargetSecurityGroups`

``` purescript
modifyMountTargetSecurityGroups :: forall eff. ModifyMountTargetSecurityGroupsRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Modifies the set of security groups in effect for a mount target.</p> <p>When you create a mount target, Amazon EFS also creates a new network interface. For more information, see <a>CreateMountTarget</a>. This operation replaces the security groups in effect for the network interface associated with a mount target, with the <code>SecurityGroups</code> provided in the request. This operation requires that the network interface of the mount target has been created and the lifecycle state of the mount target is not <code>deleted</code>. </p> <p>The operation requires permissions for the following actions:</p> <ul> <li> <p> <code>elasticfilesystem:ModifyMountTargetSecurityGroups</code> action on the mount target's file system. </p> </li> <li> <p> <code>ec2:ModifyNetworkInterfaceAttribute</code> action on the mount target's network interface. </p> </li> </ul>

#### `AwsAccountId`

``` purescript
newtype AwsAccountId
  = AwsAccountId String
```

##### Instances
``` purescript
Newtype AwsAccountId _
Generic AwsAccountId _
Show AwsAccountId
Decode AwsAccountId
Encode AwsAccountId
```

#### `BadRequest`

``` purescript
newtype BadRequest
  = BadRequest { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the request is malformed or contains an error such as an invalid parameter value or a missing required parameter.</p>

##### Instances
``` purescript
Newtype BadRequest _
Generic BadRequest _
Show BadRequest
Decode BadRequest
Encode BadRequest
```

#### `newBadRequest`

``` purescript
newBadRequest :: ErrorCode -> BadRequest
```

Constructs BadRequest from required parameters

#### `newBadRequest'`

``` purescript
newBadRequest' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> BadRequest
```

Constructs BadRequest's fields from required parameters

#### `CreateFileSystemRequest`

``` purescript
newtype CreateFileSystemRequest
  = CreateFileSystemRequest { "CreationToken" :: CreationToken, "PerformanceMode" :: NullOrUndefined (PerformanceMode), "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) }
```

##### Instances
``` purescript
Newtype CreateFileSystemRequest _
Generic CreateFileSystemRequest _
Show CreateFileSystemRequest
Decode CreateFileSystemRequest
Encode CreateFileSystemRequest
```

#### `newCreateFileSystemRequest`

``` purescript
newCreateFileSystemRequest :: CreationToken -> CreateFileSystemRequest
```

Constructs CreateFileSystemRequest from required parameters

#### `newCreateFileSystemRequest'`

``` purescript
newCreateFileSystemRequest' :: CreationToken -> ({ "CreationToken" :: CreationToken, "PerformanceMode" :: NullOrUndefined (PerformanceMode), "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) } -> { "CreationToken" :: CreationToken, "PerformanceMode" :: NullOrUndefined (PerformanceMode), "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) }) -> CreateFileSystemRequest
```

Constructs CreateFileSystemRequest's fields from required parameters

#### `CreateMountTargetRequest`

``` purescript
newtype CreateMountTargetRequest
  = CreateMountTargetRequest { "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "IpAddress" :: NullOrUndefined (IpAddress), "SecurityGroups" :: NullOrUndefined (SecurityGroups) }
```

<p/>

##### Instances
``` purescript
Newtype CreateMountTargetRequest _
Generic CreateMountTargetRequest _
Show CreateMountTargetRequest
Decode CreateMountTargetRequest
Encode CreateMountTargetRequest
```

#### `newCreateMountTargetRequest`

``` purescript
newCreateMountTargetRequest :: FileSystemId -> SubnetId -> CreateMountTargetRequest
```

Constructs CreateMountTargetRequest from required parameters

#### `newCreateMountTargetRequest'`

``` purescript
newCreateMountTargetRequest' :: FileSystemId -> SubnetId -> ({ "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "IpAddress" :: NullOrUndefined (IpAddress), "SecurityGroups" :: NullOrUndefined (SecurityGroups) } -> { "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "IpAddress" :: NullOrUndefined (IpAddress), "SecurityGroups" :: NullOrUndefined (SecurityGroups) }) -> CreateMountTargetRequest
```

Constructs CreateMountTargetRequest's fields from required parameters

#### `CreateTagsRequest`

``` purescript
newtype CreateTagsRequest
  = CreateTagsRequest { "FileSystemId" :: FileSystemId, "Tags" :: Tags }
```

<p/>

##### Instances
``` purescript
Newtype CreateTagsRequest _
Generic CreateTagsRequest _
Show CreateTagsRequest
Decode CreateTagsRequest
Encode CreateTagsRequest
```

#### `newCreateTagsRequest`

``` purescript
newCreateTagsRequest :: FileSystemId -> Tags -> CreateTagsRequest
```

Constructs CreateTagsRequest from required parameters

#### `newCreateTagsRequest'`

``` purescript
newCreateTagsRequest' :: FileSystemId -> Tags -> ({ "FileSystemId" :: FileSystemId, "Tags" :: Tags } -> { "FileSystemId" :: FileSystemId, "Tags" :: Tags }) -> CreateTagsRequest
```

Constructs CreateTagsRequest's fields from required parameters

#### `CreationToken`

``` purescript
newtype CreationToken
  = CreationToken String
```

##### Instances
``` purescript
Newtype CreationToken _
Generic CreationToken _
Show CreationToken
Decode CreationToken
Encode CreationToken
```

#### `DeleteFileSystemRequest`

``` purescript
newtype DeleteFileSystemRequest
  = DeleteFileSystemRequest { "FileSystemId" :: FileSystemId }
```

<p/>

##### Instances
``` purescript
Newtype DeleteFileSystemRequest _
Generic DeleteFileSystemRequest _
Show DeleteFileSystemRequest
Decode DeleteFileSystemRequest
Encode DeleteFileSystemRequest
```

#### `newDeleteFileSystemRequest`

``` purescript
newDeleteFileSystemRequest :: FileSystemId -> DeleteFileSystemRequest
```

Constructs DeleteFileSystemRequest from required parameters

#### `newDeleteFileSystemRequest'`

``` purescript
newDeleteFileSystemRequest' :: FileSystemId -> ({ "FileSystemId" :: FileSystemId } -> { "FileSystemId" :: FileSystemId }) -> DeleteFileSystemRequest
```

Constructs DeleteFileSystemRequest's fields from required parameters

#### `DeleteMountTargetRequest`

``` purescript
newtype DeleteMountTargetRequest
  = DeleteMountTargetRequest { "MountTargetId" :: MountTargetId }
```

<p/>

##### Instances
``` purescript
Newtype DeleteMountTargetRequest _
Generic DeleteMountTargetRequest _
Show DeleteMountTargetRequest
Decode DeleteMountTargetRequest
Encode DeleteMountTargetRequest
```

#### `newDeleteMountTargetRequest`

``` purescript
newDeleteMountTargetRequest :: MountTargetId -> DeleteMountTargetRequest
```

Constructs DeleteMountTargetRequest from required parameters

#### `newDeleteMountTargetRequest'`

``` purescript
newDeleteMountTargetRequest' :: MountTargetId -> ({ "MountTargetId" :: MountTargetId } -> { "MountTargetId" :: MountTargetId }) -> DeleteMountTargetRequest
```

Constructs DeleteMountTargetRequest's fields from required parameters

#### `DeleteTagsRequest`

``` purescript
newtype DeleteTagsRequest
  = DeleteTagsRequest { "FileSystemId" :: FileSystemId, "TagKeys" :: TagKeys }
```

<p/>

##### Instances
``` purescript
Newtype DeleteTagsRequest _
Generic DeleteTagsRequest _
Show DeleteTagsRequest
Decode DeleteTagsRequest
Encode DeleteTagsRequest
```

#### `newDeleteTagsRequest`

``` purescript
newDeleteTagsRequest :: FileSystemId -> TagKeys -> DeleteTagsRequest
```

Constructs DeleteTagsRequest from required parameters

#### `newDeleteTagsRequest'`

``` purescript
newDeleteTagsRequest' :: FileSystemId -> TagKeys -> ({ "FileSystemId" :: FileSystemId, "TagKeys" :: TagKeys } -> { "FileSystemId" :: FileSystemId, "TagKeys" :: TagKeys }) -> DeleteTagsRequest
```

Constructs DeleteTagsRequest's fields from required parameters

#### `DependencyTimeout`

``` purescript
newtype DependencyTimeout
  = DependencyTimeout { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>The service timed out trying to fulfill the request, and the client should try the call again.</p>

##### Instances
``` purescript
Newtype DependencyTimeout _
Generic DependencyTimeout _
Show DependencyTimeout
Decode DependencyTimeout
Encode DependencyTimeout
```

#### `newDependencyTimeout`

``` purescript
newDependencyTimeout :: ErrorCode -> DependencyTimeout
```

Constructs DependencyTimeout from required parameters

#### `newDependencyTimeout'`

``` purescript
newDependencyTimeout' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> DependencyTimeout
```

Constructs DependencyTimeout's fields from required parameters

#### `DescribeFileSystemsRequest`

``` purescript
newtype DescribeFileSystemsRequest
  = DescribeFileSystemsRequest { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "CreationToken" :: NullOrUndefined (CreationToken), "FileSystemId" :: NullOrUndefined (FileSystemId) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeFileSystemsRequest _
Generic DescribeFileSystemsRequest _
Show DescribeFileSystemsRequest
Decode DescribeFileSystemsRequest
Encode DescribeFileSystemsRequest
```

#### `newDescribeFileSystemsRequest`

``` purescript
newDescribeFileSystemsRequest :: DescribeFileSystemsRequest
```

Constructs DescribeFileSystemsRequest from required parameters

#### `newDescribeFileSystemsRequest'`

``` purescript
newDescribeFileSystemsRequest' :: ({ "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "CreationToken" :: NullOrUndefined (CreationToken), "FileSystemId" :: NullOrUndefined (FileSystemId) } -> { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "CreationToken" :: NullOrUndefined (CreationToken), "FileSystemId" :: NullOrUndefined (FileSystemId) }) -> DescribeFileSystemsRequest
```

Constructs DescribeFileSystemsRequest's fields from required parameters

#### `DescribeFileSystemsResponse`

``` purescript
newtype DescribeFileSystemsResponse
  = DescribeFileSystemsResponse { "Marker" :: NullOrUndefined (Marker), "FileSystems" :: NullOrUndefined (FileSystemDescriptions), "NextMarker" :: NullOrUndefined (Marker) }
```

##### Instances
``` purescript
Newtype DescribeFileSystemsResponse _
Generic DescribeFileSystemsResponse _
Show DescribeFileSystemsResponse
Decode DescribeFileSystemsResponse
Encode DescribeFileSystemsResponse
```

#### `newDescribeFileSystemsResponse`

``` purescript
newDescribeFileSystemsResponse :: DescribeFileSystemsResponse
```

Constructs DescribeFileSystemsResponse from required parameters

#### `newDescribeFileSystemsResponse'`

``` purescript
newDescribeFileSystemsResponse' :: ({ "Marker" :: NullOrUndefined (Marker), "FileSystems" :: NullOrUndefined (FileSystemDescriptions), "NextMarker" :: NullOrUndefined (Marker) } -> { "Marker" :: NullOrUndefined (Marker), "FileSystems" :: NullOrUndefined (FileSystemDescriptions), "NextMarker" :: NullOrUndefined (Marker) }) -> DescribeFileSystemsResponse
```

Constructs DescribeFileSystemsResponse's fields from required parameters

#### `DescribeMountTargetSecurityGroupsRequest`

``` purescript
newtype DescribeMountTargetSecurityGroupsRequest
  = DescribeMountTargetSecurityGroupsRequest { "MountTargetId" :: MountTargetId }
```

<p/>

##### Instances
``` purescript
Newtype DescribeMountTargetSecurityGroupsRequest _
Generic DescribeMountTargetSecurityGroupsRequest _
Show DescribeMountTargetSecurityGroupsRequest
Decode DescribeMountTargetSecurityGroupsRequest
Encode DescribeMountTargetSecurityGroupsRequest
```

#### `newDescribeMountTargetSecurityGroupsRequest`

``` purescript
newDescribeMountTargetSecurityGroupsRequest :: MountTargetId -> DescribeMountTargetSecurityGroupsRequest
```

Constructs DescribeMountTargetSecurityGroupsRequest from required parameters

#### `newDescribeMountTargetSecurityGroupsRequest'`

``` purescript
newDescribeMountTargetSecurityGroupsRequest' :: MountTargetId -> ({ "MountTargetId" :: MountTargetId } -> { "MountTargetId" :: MountTargetId }) -> DescribeMountTargetSecurityGroupsRequest
```

Constructs DescribeMountTargetSecurityGroupsRequest's fields from required parameters

#### `DescribeMountTargetSecurityGroupsResponse`

``` purescript
newtype DescribeMountTargetSecurityGroupsResponse
  = DescribeMountTargetSecurityGroupsResponse { "SecurityGroups" :: SecurityGroups }
```

##### Instances
``` purescript
Newtype DescribeMountTargetSecurityGroupsResponse _
Generic DescribeMountTargetSecurityGroupsResponse _
Show DescribeMountTargetSecurityGroupsResponse
Decode DescribeMountTargetSecurityGroupsResponse
Encode DescribeMountTargetSecurityGroupsResponse
```

#### `newDescribeMountTargetSecurityGroupsResponse`

``` purescript
newDescribeMountTargetSecurityGroupsResponse :: SecurityGroups -> DescribeMountTargetSecurityGroupsResponse
```

Constructs DescribeMountTargetSecurityGroupsResponse from required parameters

#### `newDescribeMountTargetSecurityGroupsResponse'`

``` purescript
newDescribeMountTargetSecurityGroupsResponse' :: SecurityGroups -> ({ "SecurityGroups" :: SecurityGroups } -> { "SecurityGroups" :: SecurityGroups }) -> DescribeMountTargetSecurityGroupsResponse
```

Constructs DescribeMountTargetSecurityGroupsResponse's fields from required parameters

#### `DescribeMountTargetsRequest`

``` purescript
newtype DescribeMountTargetsRequest
  = DescribeMountTargetsRequest { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: NullOrUndefined (FileSystemId), "MountTargetId" :: NullOrUndefined (MountTargetId) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeMountTargetsRequest _
Generic DescribeMountTargetsRequest _
Show DescribeMountTargetsRequest
Decode DescribeMountTargetsRequest
Encode DescribeMountTargetsRequest
```

#### `newDescribeMountTargetsRequest`

``` purescript
newDescribeMountTargetsRequest :: DescribeMountTargetsRequest
```

Constructs DescribeMountTargetsRequest from required parameters

#### `newDescribeMountTargetsRequest'`

``` purescript
newDescribeMountTargetsRequest' :: ({ "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: NullOrUndefined (FileSystemId), "MountTargetId" :: NullOrUndefined (MountTargetId) } -> { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: NullOrUndefined (FileSystemId), "MountTargetId" :: NullOrUndefined (MountTargetId) }) -> DescribeMountTargetsRequest
```

Constructs DescribeMountTargetsRequest's fields from required parameters

#### `DescribeMountTargetsResponse`

``` purescript
newtype DescribeMountTargetsResponse
  = DescribeMountTargetsResponse { "Marker" :: NullOrUndefined (Marker), "MountTargets" :: NullOrUndefined (MountTargetDescriptions), "NextMarker" :: NullOrUndefined (Marker) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeMountTargetsResponse _
Generic DescribeMountTargetsResponse _
Show DescribeMountTargetsResponse
Decode DescribeMountTargetsResponse
Encode DescribeMountTargetsResponse
```

#### `newDescribeMountTargetsResponse`

``` purescript
newDescribeMountTargetsResponse :: DescribeMountTargetsResponse
```

Constructs DescribeMountTargetsResponse from required parameters

#### `newDescribeMountTargetsResponse'`

``` purescript
newDescribeMountTargetsResponse' :: ({ "Marker" :: NullOrUndefined (Marker), "MountTargets" :: NullOrUndefined (MountTargetDescriptions), "NextMarker" :: NullOrUndefined (Marker) } -> { "Marker" :: NullOrUndefined (Marker), "MountTargets" :: NullOrUndefined (MountTargetDescriptions), "NextMarker" :: NullOrUndefined (Marker) }) -> DescribeMountTargetsResponse
```

Constructs DescribeMountTargetsResponse's fields from required parameters

#### `DescribeTagsRequest`

``` purescript
newtype DescribeTagsRequest
  = DescribeTagsRequest { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: FileSystemId }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTagsRequest _
Generic DescribeTagsRequest _
Show DescribeTagsRequest
Decode DescribeTagsRequest
Encode DescribeTagsRequest
```

#### `newDescribeTagsRequest`

``` purescript
newDescribeTagsRequest :: FileSystemId -> DescribeTagsRequest
```

Constructs DescribeTagsRequest from required parameters

#### `newDescribeTagsRequest'`

``` purescript
newDescribeTagsRequest' :: FileSystemId -> ({ "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: FileSystemId } -> { "MaxItems" :: NullOrUndefined (MaxItems), "Marker" :: NullOrUndefined (Marker), "FileSystemId" :: FileSystemId }) -> DescribeTagsRequest
```

Constructs DescribeTagsRequest's fields from required parameters

#### `DescribeTagsResponse`

``` purescript
newtype DescribeTagsResponse
  = DescribeTagsResponse { "Marker" :: NullOrUndefined (Marker), "Tags" :: Tags, "NextMarker" :: NullOrUndefined (Marker) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTagsResponse _
Generic DescribeTagsResponse _
Show DescribeTagsResponse
Decode DescribeTagsResponse
Encode DescribeTagsResponse
```

#### `newDescribeTagsResponse`

``` purescript
newDescribeTagsResponse :: Tags -> DescribeTagsResponse
```

Constructs DescribeTagsResponse from required parameters

#### `newDescribeTagsResponse'`

``` purescript
newDescribeTagsResponse' :: Tags -> ({ "Marker" :: NullOrUndefined (Marker), "Tags" :: Tags, "NextMarker" :: NullOrUndefined (Marker) } -> { "Marker" :: NullOrUndefined (Marker), "Tags" :: Tags, "NextMarker" :: NullOrUndefined (Marker) }) -> DescribeTagsResponse
```

Constructs DescribeTagsResponse's fields from required parameters

#### `Encrypted`

``` purescript
newtype Encrypted
  = Encrypted Boolean
```

##### Instances
``` purescript
Newtype Encrypted _
Generic Encrypted _
Show Encrypted
Decode Encrypted
Encode Encrypted
```

#### `ErrorCode`

``` purescript
newtype ErrorCode
  = ErrorCode String
```

##### Instances
``` purescript
Newtype ErrorCode _
Generic ErrorCode _
Show ErrorCode
Decode ErrorCode
Encode ErrorCode
```

#### `ErrorMessage`

``` purescript
newtype ErrorMessage
  = ErrorMessage String
```

##### Instances
``` purescript
Newtype ErrorMessage _
Generic ErrorMessage _
Show ErrorMessage
Decode ErrorMessage
Encode ErrorMessage
```

#### `FileSystemAlreadyExists`

``` purescript
newtype FileSystemAlreadyExists
  = FileSystemAlreadyExists { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage), "FileSystemId" :: FileSystemId }
```

<p>Returned if the file system you are trying to create already exists, with the creation token you provided.</p>

##### Instances
``` purescript
Newtype FileSystemAlreadyExists _
Generic FileSystemAlreadyExists _
Show FileSystemAlreadyExists
Decode FileSystemAlreadyExists
Encode FileSystemAlreadyExists
```

#### `newFileSystemAlreadyExists`

``` purescript
newFileSystemAlreadyExists :: ErrorCode -> FileSystemId -> FileSystemAlreadyExists
```

Constructs FileSystemAlreadyExists from required parameters

#### `newFileSystemAlreadyExists'`

``` purescript
newFileSystemAlreadyExists' :: ErrorCode -> FileSystemId -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage), "FileSystemId" :: FileSystemId } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage), "FileSystemId" :: FileSystemId }) -> FileSystemAlreadyExists
```

Constructs FileSystemAlreadyExists's fields from required parameters

#### `FileSystemDescription`

``` purescript
newtype FileSystemDescription
  = FileSystemDescription { "OwnerId" :: AwsAccountId, "CreationToken" :: CreationToken, "FileSystemId" :: FileSystemId, "CreationTime" :: Timestamp, "LifeCycleState" :: LifeCycleState, "Name" :: NullOrUndefined (TagValue), "NumberOfMountTargets" :: MountTargetCount, "SizeInBytes" :: FileSystemSize, "PerformanceMode" :: PerformanceMode, "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) }
```

<p>Description of the file system.</p>

##### Instances
``` purescript
Newtype FileSystemDescription _
Generic FileSystemDescription _
Show FileSystemDescription
Decode FileSystemDescription
Encode FileSystemDescription
```

#### `newFileSystemDescription`

``` purescript
newFileSystemDescription :: Timestamp -> CreationToken -> FileSystemId -> LifeCycleState -> MountTargetCount -> AwsAccountId -> PerformanceMode -> FileSystemSize -> FileSystemDescription
```

Constructs FileSystemDescription from required parameters

#### `newFileSystemDescription'`

``` purescript
newFileSystemDescription' :: Timestamp -> CreationToken -> FileSystemId -> LifeCycleState -> MountTargetCount -> AwsAccountId -> PerformanceMode -> FileSystemSize -> ({ "OwnerId" :: AwsAccountId, "CreationToken" :: CreationToken, "FileSystemId" :: FileSystemId, "CreationTime" :: Timestamp, "LifeCycleState" :: LifeCycleState, "Name" :: NullOrUndefined (TagValue), "NumberOfMountTargets" :: MountTargetCount, "SizeInBytes" :: FileSystemSize, "PerformanceMode" :: PerformanceMode, "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) } -> { "OwnerId" :: AwsAccountId, "CreationToken" :: CreationToken, "FileSystemId" :: FileSystemId, "CreationTime" :: Timestamp, "LifeCycleState" :: LifeCycleState, "Name" :: NullOrUndefined (TagValue), "NumberOfMountTargets" :: MountTargetCount, "SizeInBytes" :: FileSystemSize, "PerformanceMode" :: PerformanceMode, "Encrypted" :: NullOrUndefined (Encrypted), "KmsKeyId" :: NullOrUndefined (KmsKeyId) }) -> FileSystemDescription
```

Constructs FileSystemDescription's fields from required parameters

#### `FileSystemDescriptions`

``` purescript
newtype FileSystemDescriptions
  = FileSystemDescriptions (Array FileSystemDescription)
```

##### Instances
``` purescript
Newtype FileSystemDescriptions _
Generic FileSystemDescriptions _
Show FileSystemDescriptions
Decode FileSystemDescriptions
Encode FileSystemDescriptions
```

#### `FileSystemId`

``` purescript
newtype FileSystemId
  = FileSystemId String
```

##### Instances
``` purescript
Newtype FileSystemId _
Generic FileSystemId _
Show FileSystemId
Decode FileSystemId
Encode FileSystemId
```

#### `FileSystemInUse`

``` purescript
newtype FileSystemInUse
  = FileSystemInUse { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if a file system has mount targets.</p>

##### Instances
``` purescript
Newtype FileSystemInUse _
Generic FileSystemInUse _
Show FileSystemInUse
Decode FileSystemInUse
Encode FileSystemInUse
```

#### `newFileSystemInUse`

``` purescript
newFileSystemInUse :: ErrorCode -> FileSystemInUse
```

Constructs FileSystemInUse from required parameters

#### `newFileSystemInUse'`

``` purescript
newFileSystemInUse' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> FileSystemInUse
```

Constructs FileSystemInUse's fields from required parameters

#### `FileSystemLimitExceeded`

``` purescript
newtype FileSystemLimitExceeded
  = FileSystemLimitExceeded { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the AWS account has already created maximum number of file systems allowed per account.</p>

##### Instances
``` purescript
Newtype FileSystemLimitExceeded _
Generic FileSystemLimitExceeded _
Show FileSystemLimitExceeded
Decode FileSystemLimitExceeded
Encode FileSystemLimitExceeded
```

#### `newFileSystemLimitExceeded`

``` purescript
newFileSystemLimitExceeded :: ErrorCode -> FileSystemLimitExceeded
```

Constructs FileSystemLimitExceeded from required parameters

#### `newFileSystemLimitExceeded'`

``` purescript
newFileSystemLimitExceeded' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> FileSystemLimitExceeded
```

Constructs FileSystemLimitExceeded's fields from required parameters

#### `FileSystemNotFound`

``` purescript
newtype FileSystemNotFound
  = FileSystemNotFound { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the specified <code>FileSystemId</code> does not exist in the requester's AWS account.</p>

##### Instances
``` purescript
Newtype FileSystemNotFound _
Generic FileSystemNotFound _
Show FileSystemNotFound
Decode FileSystemNotFound
Encode FileSystemNotFound
```

#### `newFileSystemNotFound`

``` purescript
newFileSystemNotFound :: ErrorCode -> FileSystemNotFound
```

Constructs FileSystemNotFound from required parameters

#### `newFileSystemNotFound'`

``` purescript
newFileSystemNotFound' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> FileSystemNotFound
```

Constructs FileSystemNotFound's fields from required parameters

#### `FileSystemSize`

``` purescript
newtype FileSystemSize
  = FileSystemSize { "Value" :: FileSystemSizeValue, "Timestamp" :: NullOrUndefined (Timestamp) }
```

<p>Latest known metered size (in bytes) of data stored in the file system, in its <code>Value</code> field, and the time at which that size was determined in its <code>Timestamp</code> field. Note that the value does not represent the size of a consistent snapshot of the file system, but it is eventually consistent when there are no writes to the file system. That is, the value will represent the actual size only if the file system is not modified for a period longer than a couple of hours. Otherwise, the value is not necessarily the exact size the file system was at any instant in time.</p>

##### Instances
``` purescript
Newtype FileSystemSize _
Generic FileSystemSize _
Show FileSystemSize
Decode FileSystemSize
Encode FileSystemSize
```

#### `newFileSystemSize`

``` purescript
newFileSystemSize :: FileSystemSizeValue -> FileSystemSize
```

Constructs FileSystemSize from required parameters

#### `newFileSystemSize'`

``` purescript
newFileSystemSize' :: FileSystemSizeValue -> ({ "Value" :: FileSystemSizeValue, "Timestamp" :: NullOrUndefined (Timestamp) } -> { "Value" :: FileSystemSizeValue, "Timestamp" :: NullOrUndefined (Timestamp) }) -> FileSystemSize
```

Constructs FileSystemSize's fields from required parameters

#### `FileSystemSizeValue`

``` purescript
newtype FileSystemSizeValue
  = FileSystemSizeValue Number
```

##### Instances
``` purescript
Newtype FileSystemSizeValue _
Generic FileSystemSizeValue _
Show FileSystemSizeValue
Decode FileSystemSizeValue
Encode FileSystemSizeValue
```

#### `IncorrectFileSystemLifeCycleState`

``` purescript
newtype IncorrectFileSystemLifeCycleState
  = IncorrectFileSystemLifeCycleState { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the file system's life cycle state is not "created".</p>

##### Instances
``` purescript
Newtype IncorrectFileSystemLifeCycleState _
Generic IncorrectFileSystemLifeCycleState _
Show IncorrectFileSystemLifeCycleState
Decode IncorrectFileSystemLifeCycleState
Encode IncorrectFileSystemLifeCycleState
```

#### `newIncorrectFileSystemLifeCycleState`

``` purescript
newIncorrectFileSystemLifeCycleState :: ErrorCode -> IncorrectFileSystemLifeCycleState
```

Constructs IncorrectFileSystemLifeCycleState from required parameters

#### `newIncorrectFileSystemLifeCycleState'`

``` purescript
newIncorrectFileSystemLifeCycleState' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> IncorrectFileSystemLifeCycleState
```

Constructs IncorrectFileSystemLifeCycleState's fields from required parameters

#### `IncorrectMountTargetState`

``` purescript
newtype IncorrectMountTargetState
  = IncorrectMountTargetState { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the mount target is not in the correct state for the operation.</p>

##### Instances
``` purescript
Newtype IncorrectMountTargetState _
Generic IncorrectMountTargetState _
Show IncorrectMountTargetState
Decode IncorrectMountTargetState
Encode IncorrectMountTargetState
```

#### `newIncorrectMountTargetState`

``` purescript
newIncorrectMountTargetState :: ErrorCode -> IncorrectMountTargetState
```

Constructs IncorrectMountTargetState from required parameters

#### `newIncorrectMountTargetState'`

``` purescript
newIncorrectMountTargetState' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> IncorrectMountTargetState
```

Constructs IncorrectMountTargetState's fields from required parameters

#### `InternalServerError`

``` purescript
newtype InternalServerError
  = InternalServerError { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if an error occurred on the server side.</p>

##### Instances
``` purescript
Newtype InternalServerError _
Generic InternalServerError _
Show InternalServerError
Decode InternalServerError
Encode InternalServerError
```

#### `newInternalServerError`

``` purescript
newInternalServerError :: ErrorCode -> InternalServerError
```

Constructs InternalServerError from required parameters

#### `newInternalServerError'`

``` purescript
newInternalServerError' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> InternalServerError
```

Constructs InternalServerError's fields from required parameters

#### `IpAddress`

``` purescript
newtype IpAddress
  = IpAddress String
```

##### Instances
``` purescript
Newtype IpAddress _
Generic IpAddress _
Show IpAddress
Decode IpAddress
Encode IpAddress
```

#### `IpAddressInUse`

``` purescript
newtype IpAddressInUse
  = IpAddressInUse { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the request specified an <code>IpAddress</code> that is already in use in the subnet.</p>

##### Instances
``` purescript
Newtype IpAddressInUse _
Generic IpAddressInUse _
Show IpAddressInUse
Decode IpAddressInUse
Encode IpAddressInUse
```

#### `newIpAddressInUse`

``` purescript
newIpAddressInUse :: ErrorCode -> IpAddressInUse
```

Constructs IpAddressInUse from required parameters

#### `newIpAddressInUse'`

``` purescript
newIpAddressInUse' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> IpAddressInUse
```

Constructs IpAddressInUse's fields from required parameters

#### `KmsKeyId`

``` purescript
newtype KmsKeyId
  = KmsKeyId String
```

##### Instances
``` purescript
Newtype KmsKeyId _
Generic KmsKeyId _
Show KmsKeyId
Decode KmsKeyId
Encode KmsKeyId
```

#### `LifeCycleState`

``` purescript
newtype LifeCycleState
  = LifeCycleState String
```

##### Instances
``` purescript
Newtype LifeCycleState _
Generic LifeCycleState _
Show LifeCycleState
Decode LifeCycleState
Encode LifeCycleState
```

#### `Marker`

``` purescript
newtype Marker
  = Marker String
```

##### Instances
``` purescript
Newtype Marker _
Generic Marker _
Show Marker
Decode Marker
Encode Marker
```

#### `MaxItems`

``` purescript
newtype MaxItems
  = MaxItems Int
```

##### Instances
``` purescript
Newtype MaxItems _
Generic MaxItems _
Show MaxItems
Decode MaxItems
Encode MaxItems
```

#### `ModifyMountTargetSecurityGroupsRequest`

``` purescript
newtype ModifyMountTargetSecurityGroupsRequest
  = ModifyMountTargetSecurityGroupsRequest { "MountTargetId" :: MountTargetId, "SecurityGroups" :: NullOrUndefined (SecurityGroups) }
```

<p/>

##### Instances
``` purescript
Newtype ModifyMountTargetSecurityGroupsRequest _
Generic ModifyMountTargetSecurityGroupsRequest _
Show ModifyMountTargetSecurityGroupsRequest
Decode ModifyMountTargetSecurityGroupsRequest
Encode ModifyMountTargetSecurityGroupsRequest
```

#### `newModifyMountTargetSecurityGroupsRequest`

``` purescript
newModifyMountTargetSecurityGroupsRequest :: MountTargetId -> ModifyMountTargetSecurityGroupsRequest
```

Constructs ModifyMountTargetSecurityGroupsRequest from required parameters

#### `newModifyMountTargetSecurityGroupsRequest'`

``` purescript
newModifyMountTargetSecurityGroupsRequest' :: MountTargetId -> ({ "MountTargetId" :: MountTargetId, "SecurityGroups" :: NullOrUndefined (SecurityGroups) } -> { "MountTargetId" :: MountTargetId, "SecurityGroups" :: NullOrUndefined (SecurityGroups) }) -> ModifyMountTargetSecurityGroupsRequest
```

Constructs ModifyMountTargetSecurityGroupsRequest's fields from required parameters

#### `MountTargetConflict`

``` purescript
newtype MountTargetConflict
  = MountTargetConflict { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the mount target would violate one of the specified restrictions based on the file system's existing mount targets.</p>

##### Instances
``` purescript
Newtype MountTargetConflict _
Generic MountTargetConflict _
Show MountTargetConflict
Decode MountTargetConflict
Encode MountTargetConflict
```

#### `newMountTargetConflict`

``` purescript
newMountTargetConflict :: ErrorCode -> MountTargetConflict
```

Constructs MountTargetConflict from required parameters

#### `newMountTargetConflict'`

``` purescript
newMountTargetConflict' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> MountTargetConflict
```

Constructs MountTargetConflict's fields from required parameters

#### `MountTargetCount`

``` purescript
newtype MountTargetCount
  = MountTargetCount Int
```

##### Instances
``` purescript
Newtype MountTargetCount _
Generic MountTargetCount _
Show MountTargetCount
Decode MountTargetCount
Encode MountTargetCount
```

#### `MountTargetDescription`

``` purescript
newtype MountTargetDescription
  = MountTargetDescription { "OwnerId" :: NullOrUndefined (AwsAccountId), "MountTargetId" :: MountTargetId, "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "LifeCycleState" :: LifeCycleState, "IpAddress" :: NullOrUndefined (IpAddress), "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId) }
```

<p>Provides a description of a mount target.</p>

##### Instances
``` purescript
Newtype MountTargetDescription _
Generic MountTargetDescription _
Show MountTargetDescription
Decode MountTargetDescription
Encode MountTargetDescription
```

#### `newMountTargetDescription`

``` purescript
newMountTargetDescription :: FileSystemId -> LifeCycleState -> MountTargetId -> SubnetId -> MountTargetDescription
```

Constructs MountTargetDescription from required parameters

#### `newMountTargetDescription'`

``` purescript
newMountTargetDescription' :: FileSystemId -> LifeCycleState -> MountTargetId -> SubnetId -> ({ "OwnerId" :: NullOrUndefined (AwsAccountId), "MountTargetId" :: MountTargetId, "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "LifeCycleState" :: LifeCycleState, "IpAddress" :: NullOrUndefined (IpAddress), "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId) } -> { "OwnerId" :: NullOrUndefined (AwsAccountId), "MountTargetId" :: MountTargetId, "FileSystemId" :: FileSystemId, "SubnetId" :: SubnetId, "LifeCycleState" :: LifeCycleState, "IpAddress" :: NullOrUndefined (IpAddress), "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId) }) -> MountTargetDescription
```

Constructs MountTargetDescription's fields from required parameters

#### `MountTargetDescriptions`

``` purescript
newtype MountTargetDescriptions
  = MountTargetDescriptions (Array MountTargetDescription)
```

##### Instances
``` purescript
Newtype MountTargetDescriptions _
Generic MountTargetDescriptions _
Show MountTargetDescriptions
Decode MountTargetDescriptions
Encode MountTargetDescriptions
```

#### `MountTargetId`

``` purescript
newtype MountTargetId
  = MountTargetId String
```

##### Instances
``` purescript
Newtype MountTargetId _
Generic MountTargetId _
Show MountTargetId
Decode MountTargetId
Encode MountTargetId
```

#### `MountTargetNotFound`

``` purescript
newtype MountTargetNotFound
  = MountTargetNotFound { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if there is no mount target with the specified ID found in the caller's account.</p>

##### Instances
``` purescript
Newtype MountTargetNotFound _
Generic MountTargetNotFound _
Show MountTargetNotFound
Decode MountTargetNotFound
Encode MountTargetNotFound
```

#### `newMountTargetNotFound`

``` purescript
newMountTargetNotFound :: ErrorCode -> MountTargetNotFound
```

Constructs MountTargetNotFound from required parameters

#### `newMountTargetNotFound'`

``` purescript
newMountTargetNotFound' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> MountTargetNotFound
```

Constructs MountTargetNotFound's fields from required parameters

#### `NetworkInterfaceId`

``` purescript
newtype NetworkInterfaceId
  = NetworkInterfaceId String
```

##### Instances
``` purescript
Newtype NetworkInterfaceId _
Generic NetworkInterfaceId _
Show NetworkInterfaceId
Decode NetworkInterfaceId
Encode NetworkInterfaceId
```

#### `NetworkInterfaceLimitExceeded`

``` purescript
newtype NetworkInterfaceLimitExceeded
  = NetworkInterfaceLimitExceeded { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p> The calling account has reached the ENI limit for the specific AWS region. Client should try to delete some ENIs or get its account limit raised. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a> in the Amazon Virtual Private Cloud User Guide (see the Network interfaces per VPC entry in the table). </p>

##### Instances
``` purescript
Newtype NetworkInterfaceLimitExceeded _
Generic NetworkInterfaceLimitExceeded _
Show NetworkInterfaceLimitExceeded
Decode NetworkInterfaceLimitExceeded
Encode NetworkInterfaceLimitExceeded
```

#### `newNetworkInterfaceLimitExceeded`

``` purescript
newNetworkInterfaceLimitExceeded :: ErrorCode -> NetworkInterfaceLimitExceeded
```

Constructs NetworkInterfaceLimitExceeded from required parameters

#### `newNetworkInterfaceLimitExceeded'`

``` purescript
newNetworkInterfaceLimitExceeded' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> NetworkInterfaceLimitExceeded
```

Constructs NetworkInterfaceLimitExceeded's fields from required parameters

#### `NoFreeAddressesInSubnet`

``` purescript
newtype NoFreeAddressesInSubnet
  = NoFreeAddressesInSubnet { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if <code>IpAddress</code> was not specified in the request and there are no free IP addresses in the subnet.</p>

##### Instances
``` purescript
Newtype NoFreeAddressesInSubnet _
Generic NoFreeAddressesInSubnet _
Show NoFreeAddressesInSubnet
Decode NoFreeAddressesInSubnet
Encode NoFreeAddressesInSubnet
```

#### `newNoFreeAddressesInSubnet`

``` purescript
newNoFreeAddressesInSubnet :: ErrorCode -> NoFreeAddressesInSubnet
```

Constructs NoFreeAddressesInSubnet from required parameters

#### `newNoFreeAddressesInSubnet'`

``` purescript
newNoFreeAddressesInSubnet' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> NoFreeAddressesInSubnet
```

Constructs NoFreeAddressesInSubnet's fields from required parameters

#### `PerformanceMode`

``` purescript
newtype PerformanceMode
  = PerformanceMode String
```

##### Instances
``` purescript
Newtype PerformanceMode _
Generic PerformanceMode _
Show PerformanceMode
Decode PerformanceMode
Encode PerformanceMode
```

#### `SecurityGroup`

``` purescript
newtype SecurityGroup
  = SecurityGroup String
```

##### Instances
``` purescript
Newtype SecurityGroup _
Generic SecurityGroup _
Show SecurityGroup
Decode SecurityGroup
Encode SecurityGroup
```

#### `SecurityGroupLimitExceeded`

``` purescript
newtype SecurityGroupLimitExceeded
  = SecurityGroupLimitExceeded { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if the size of <code>SecurityGroups</code> specified in the request is greater than five.</p>

##### Instances
``` purescript
Newtype SecurityGroupLimitExceeded _
Generic SecurityGroupLimitExceeded _
Show SecurityGroupLimitExceeded
Decode SecurityGroupLimitExceeded
Encode SecurityGroupLimitExceeded
```

#### `newSecurityGroupLimitExceeded`

``` purescript
newSecurityGroupLimitExceeded :: ErrorCode -> SecurityGroupLimitExceeded
```

Constructs SecurityGroupLimitExceeded from required parameters

#### `newSecurityGroupLimitExceeded'`

``` purescript
newSecurityGroupLimitExceeded' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> SecurityGroupLimitExceeded
```

Constructs SecurityGroupLimitExceeded's fields from required parameters

#### `SecurityGroupNotFound`

``` purescript
newtype SecurityGroupNotFound
  = SecurityGroupNotFound { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if one of the specified security groups does not exist in the subnet's VPC.</p>

##### Instances
``` purescript
Newtype SecurityGroupNotFound _
Generic SecurityGroupNotFound _
Show SecurityGroupNotFound
Decode SecurityGroupNotFound
Encode SecurityGroupNotFound
```

#### `newSecurityGroupNotFound`

``` purescript
newSecurityGroupNotFound :: ErrorCode -> SecurityGroupNotFound
```

Constructs SecurityGroupNotFound from required parameters

#### `newSecurityGroupNotFound'`

``` purescript
newSecurityGroupNotFound' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> SecurityGroupNotFound
```

Constructs SecurityGroupNotFound's fields from required parameters

#### `SecurityGroups`

``` purescript
newtype SecurityGroups
  = SecurityGroups (Array SecurityGroup)
```

##### Instances
``` purescript
Newtype SecurityGroups _
Generic SecurityGroups _
Show SecurityGroups
Decode SecurityGroups
Encode SecurityGroups
```

#### `SubnetId`

``` purescript
newtype SubnetId
  = SubnetId String
```

##### Instances
``` purescript
Newtype SubnetId _
Generic SubnetId _
Show SubnetId
Decode SubnetId
Encode SubnetId
```

#### `SubnetNotFound`

``` purescript
newtype SubnetNotFound
  = SubnetNotFound { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Returned if there is no subnet with ID <code>SubnetId</code> provided in the request.</p>

##### Instances
``` purescript
Newtype SubnetNotFound _
Generic SubnetNotFound _
Show SubnetNotFound
Decode SubnetNotFound
Encode SubnetNotFound
```

#### `newSubnetNotFound`

``` purescript
newSubnetNotFound :: ErrorCode -> SubnetNotFound
```

Constructs SubnetNotFound from required parameters

#### `newSubnetNotFound'`

``` purescript
newSubnetNotFound' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> SubnetNotFound
```

Constructs SubnetNotFound's fields from required parameters

#### `Tag`

``` purescript
newtype Tag
  = Tag { "Key" :: TagKey, "Value" :: TagValue }
```

<p>A tag is a key-value pair. Allowed characters: letters, whitespace, and numbers, representable in UTF-8, and the following characters:<code> + - = . _ : /</code> </p>

##### Instances
``` purescript
Newtype Tag _
Generic Tag _
Show Tag
Decode Tag
Encode Tag
```

#### `newTag`

``` purescript
newTag :: TagKey -> TagValue -> Tag
```

Constructs Tag from required parameters

#### `newTag'`

``` purescript
newTag' :: TagKey -> TagValue -> ({ "Key" :: TagKey, "Value" :: TagValue } -> { "Key" :: TagKey, "Value" :: TagValue }) -> Tag
```

Constructs Tag's fields from required parameters

#### `TagKey`

``` purescript
newtype TagKey
  = TagKey String
```

##### Instances
``` purescript
Newtype TagKey _
Generic TagKey _
Show TagKey
Decode TagKey
Encode TagKey
```

#### `TagKeys`

``` purescript
newtype TagKeys
  = TagKeys (Array TagKey)
```

##### Instances
``` purescript
Newtype TagKeys _
Generic TagKeys _
Show TagKeys
Decode TagKeys
Encode TagKeys
```

#### `TagValue`

``` purescript
newtype TagValue
  = TagValue String
```

##### Instances
``` purescript
Newtype TagValue _
Generic TagValue _
Show TagValue
Decode TagValue
Encode TagValue
```

#### `Tags`

``` purescript
newtype Tags
  = Tags (Array Tag)
```

##### Instances
``` purescript
Newtype Tags _
Generic Tags _
Show Tags
Decode Tags
Encode Tags
```

#### `UnsupportedAvailabilityZone`

``` purescript
newtype UnsupportedAvailabilityZone
  = UnsupportedAvailabilityZone { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }
```

<p/>

##### Instances
``` purescript
Newtype UnsupportedAvailabilityZone _
Generic UnsupportedAvailabilityZone _
Show UnsupportedAvailabilityZone
Decode UnsupportedAvailabilityZone
Encode UnsupportedAvailabilityZone
```

#### `newUnsupportedAvailabilityZone`

``` purescript
newUnsupportedAvailabilityZone :: ErrorCode -> UnsupportedAvailabilityZone
```

Constructs UnsupportedAvailabilityZone from required parameters

#### `newUnsupportedAvailabilityZone'`

``` purescript
newUnsupportedAvailabilityZone' :: ErrorCode -> ({ "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) } -> { "ErrorCode" :: ErrorCode, "Message" :: NullOrUndefined (ErrorMessage) }) -> UnsupportedAvailabilityZone
```

Constructs UnsupportedAvailabilityZone's fields from required parameters


