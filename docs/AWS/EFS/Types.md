## Module AWS.EFS.Types

#### `options`

``` purescript
options :: Options
```

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


