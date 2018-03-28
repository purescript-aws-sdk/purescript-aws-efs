
module AWS.EFS.Types where

import Prelude
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap) as StrMap

import AWS.Request.Types as Types

options :: Options
options = defaultOptions { unwrapSingleConstructors = true }


newtype AwsAccountId = AwsAccountId String
derive instance newtypeAwsAccountId :: Newtype AwsAccountId _
derive instance repGenericAwsAccountId :: Generic AwsAccountId _
instance showAwsAccountId :: Show AwsAccountId where show = genericShow
instance decodeAwsAccountId :: Decode AwsAccountId where decode = genericDecode options
instance encodeAwsAccountId :: Encode AwsAccountId where encode = genericEncode options



-- | <p>Returned if the request is malformed or contains an error such as an invalid parameter value or a missing required parameter.</p>
newtype BadRequest = BadRequest 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeBadRequest :: Newtype BadRequest _
derive instance repGenericBadRequest :: Generic BadRequest _
instance showBadRequest :: Show BadRequest where show = genericShow
instance decodeBadRequest :: Decode BadRequest where decode = genericDecode options
instance encodeBadRequest :: Encode BadRequest where encode = genericEncode options

-- | Constructs BadRequest from required parameters
newBadRequest :: ErrorCode -> BadRequest
newBadRequest _ErrorCode = BadRequest { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs BadRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBadRequest' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> BadRequest
newBadRequest' _ErrorCode customize = (BadRequest <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype CreateFileSystemRequest = CreateFileSystemRequest 
  { "CreationToken" :: (CreationToken)
  , "PerformanceMode" :: NullOrUndefined (PerformanceMode)
  , "Encrypted" :: NullOrUndefined (Encrypted)
  , "KmsKeyId" :: NullOrUndefined (KmsKeyId)
  }
derive instance newtypeCreateFileSystemRequest :: Newtype CreateFileSystemRequest _
derive instance repGenericCreateFileSystemRequest :: Generic CreateFileSystemRequest _
instance showCreateFileSystemRequest :: Show CreateFileSystemRequest where show = genericShow
instance decodeCreateFileSystemRequest :: Decode CreateFileSystemRequest where decode = genericDecode options
instance encodeCreateFileSystemRequest :: Encode CreateFileSystemRequest where encode = genericEncode options

-- | Constructs CreateFileSystemRequest from required parameters
newCreateFileSystemRequest :: CreationToken -> CreateFileSystemRequest
newCreateFileSystemRequest _CreationToken = CreateFileSystemRequest { "CreationToken": _CreationToken, "Encrypted": (NullOrUndefined Nothing), "KmsKeyId": (NullOrUndefined Nothing), "PerformanceMode": (NullOrUndefined Nothing) }

-- | Constructs CreateFileSystemRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateFileSystemRequest' :: CreationToken -> ( { "CreationToken" :: (CreationToken) , "PerformanceMode" :: NullOrUndefined (PerformanceMode) , "Encrypted" :: NullOrUndefined (Encrypted) , "KmsKeyId" :: NullOrUndefined (KmsKeyId) } -> {"CreationToken" :: (CreationToken) , "PerformanceMode" :: NullOrUndefined (PerformanceMode) , "Encrypted" :: NullOrUndefined (Encrypted) , "KmsKeyId" :: NullOrUndefined (KmsKeyId) } ) -> CreateFileSystemRequest
newCreateFileSystemRequest' _CreationToken customize = (CreateFileSystemRequest <<< customize) { "CreationToken": _CreationToken, "Encrypted": (NullOrUndefined Nothing), "KmsKeyId": (NullOrUndefined Nothing), "PerformanceMode": (NullOrUndefined Nothing) }



-- | <p/>
newtype CreateMountTargetRequest = CreateMountTargetRequest 
  { "FileSystemId" :: (FileSystemId)
  , "SubnetId" :: (SubnetId)
  , "IpAddress" :: NullOrUndefined (IpAddress)
  , "SecurityGroups" :: NullOrUndefined (SecurityGroups)
  }
derive instance newtypeCreateMountTargetRequest :: Newtype CreateMountTargetRequest _
derive instance repGenericCreateMountTargetRequest :: Generic CreateMountTargetRequest _
instance showCreateMountTargetRequest :: Show CreateMountTargetRequest where show = genericShow
instance decodeCreateMountTargetRequest :: Decode CreateMountTargetRequest where decode = genericDecode options
instance encodeCreateMountTargetRequest :: Encode CreateMountTargetRequest where encode = genericEncode options

-- | Constructs CreateMountTargetRequest from required parameters
newCreateMountTargetRequest :: FileSystemId -> SubnetId -> CreateMountTargetRequest
newCreateMountTargetRequest _FileSystemId _SubnetId = CreateMountTargetRequest { "FileSystemId": _FileSystemId, "SubnetId": _SubnetId, "IpAddress": (NullOrUndefined Nothing), "SecurityGroups": (NullOrUndefined Nothing) }

-- | Constructs CreateMountTargetRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateMountTargetRequest' :: FileSystemId -> SubnetId -> ( { "FileSystemId" :: (FileSystemId) , "SubnetId" :: (SubnetId) , "IpAddress" :: NullOrUndefined (IpAddress) , "SecurityGroups" :: NullOrUndefined (SecurityGroups) } -> {"FileSystemId" :: (FileSystemId) , "SubnetId" :: (SubnetId) , "IpAddress" :: NullOrUndefined (IpAddress) , "SecurityGroups" :: NullOrUndefined (SecurityGroups) } ) -> CreateMountTargetRequest
newCreateMountTargetRequest' _FileSystemId _SubnetId customize = (CreateMountTargetRequest <<< customize) { "FileSystemId": _FileSystemId, "SubnetId": _SubnetId, "IpAddress": (NullOrUndefined Nothing), "SecurityGroups": (NullOrUndefined Nothing) }



-- | <p/>
newtype CreateTagsRequest = CreateTagsRequest 
  { "FileSystemId" :: (FileSystemId)
  , "Tags" :: (Tags)
  }
derive instance newtypeCreateTagsRequest :: Newtype CreateTagsRequest _
derive instance repGenericCreateTagsRequest :: Generic CreateTagsRequest _
instance showCreateTagsRequest :: Show CreateTagsRequest where show = genericShow
instance decodeCreateTagsRequest :: Decode CreateTagsRequest where decode = genericDecode options
instance encodeCreateTagsRequest :: Encode CreateTagsRequest where encode = genericEncode options

-- | Constructs CreateTagsRequest from required parameters
newCreateTagsRequest :: FileSystemId -> Tags -> CreateTagsRequest
newCreateTagsRequest _FileSystemId _Tags = CreateTagsRequest { "FileSystemId": _FileSystemId, "Tags": _Tags }

-- | Constructs CreateTagsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateTagsRequest' :: FileSystemId -> Tags -> ( { "FileSystemId" :: (FileSystemId) , "Tags" :: (Tags) } -> {"FileSystemId" :: (FileSystemId) , "Tags" :: (Tags) } ) -> CreateTagsRequest
newCreateTagsRequest' _FileSystemId _Tags customize = (CreateTagsRequest <<< customize) { "FileSystemId": _FileSystemId, "Tags": _Tags }



newtype CreationToken = CreationToken String
derive instance newtypeCreationToken :: Newtype CreationToken _
derive instance repGenericCreationToken :: Generic CreationToken _
instance showCreationToken :: Show CreationToken where show = genericShow
instance decodeCreationToken :: Decode CreationToken where decode = genericDecode options
instance encodeCreationToken :: Encode CreationToken where encode = genericEncode options



-- | <p/>
newtype DeleteFileSystemRequest = DeleteFileSystemRequest 
  { "FileSystemId" :: (FileSystemId)
  }
derive instance newtypeDeleteFileSystemRequest :: Newtype DeleteFileSystemRequest _
derive instance repGenericDeleteFileSystemRequest :: Generic DeleteFileSystemRequest _
instance showDeleteFileSystemRequest :: Show DeleteFileSystemRequest where show = genericShow
instance decodeDeleteFileSystemRequest :: Decode DeleteFileSystemRequest where decode = genericDecode options
instance encodeDeleteFileSystemRequest :: Encode DeleteFileSystemRequest where encode = genericEncode options

-- | Constructs DeleteFileSystemRequest from required parameters
newDeleteFileSystemRequest :: FileSystemId -> DeleteFileSystemRequest
newDeleteFileSystemRequest _FileSystemId = DeleteFileSystemRequest { "FileSystemId": _FileSystemId }

-- | Constructs DeleteFileSystemRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteFileSystemRequest' :: FileSystemId -> ( { "FileSystemId" :: (FileSystemId) } -> {"FileSystemId" :: (FileSystemId) } ) -> DeleteFileSystemRequest
newDeleteFileSystemRequest' _FileSystemId customize = (DeleteFileSystemRequest <<< customize) { "FileSystemId": _FileSystemId }



-- | <p/>
newtype DeleteMountTargetRequest = DeleteMountTargetRequest 
  { "MountTargetId" :: (MountTargetId)
  }
derive instance newtypeDeleteMountTargetRequest :: Newtype DeleteMountTargetRequest _
derive instance repGenericDeleteMountTargetRequest :: Generic DeleteMountTargetRequest _
instance showDeleteMountTargetRequest :: Show DeleteMountTargetRequest where show = genericShow
instance decodeDeleteMountTargetRequest :: Decode DeleteMountTargetRequest where decode = genericDecode options
instance encodeDeleteMountTargetRequest :: Encode DeleteMountTargetRequest where encode = genericEncode options

-- | Constructs DeleteMountTargetRequest from required parameters
newDeleteMountTargetRequest :: MountTargetId -> DeleteMountTargetRequest
newDeleteMountTargetRequest _MountTargetId = DeleteMountTargetRequest { "MountTargetId": _MountTargetId }

-- | Constructs DeleteMountTargetRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteMountTargetRequest' :: MountTargetId -> ( { "MountTargetId" :: (MountTargetId) } -> {"MountTargetId" :: (MountTargetId) } ) -> DeleteMountTargetRequest
newDeleteMountTargetRequest' _MountTargetId customize = (DeleteMountTargetRequest <<< customize) { "MountTargetId": _MountTargetId }



-- | <p/>
newtype DeleteTagsRequest = DeleteTagsRequest 
  { "FileSystemId" :: (FileSystemId)
  , "TagKeys" :: (TagKeys)
  }
derive instance newtypeDeleteTagsRequest :: Newtype DeleteTagsRequest _
derive instance repGenericDeleteTagsRequest :: Generic DeleteTagsRequest _
instance showDeleteTagsRequest :: Show DeleteTagsRequest where show = genericShow
instance decodeDeleteTagsRequest :: Decode DeleteTagsRequest where decode = genericDecode options
instance encodeDeleteTagsRequest :: Encode DeleteTagsRequest where encode = genericEncode options

-- | Constructs DeleteTagsRequest from required parameters
newDeleteTagsRequest :: FileSystemId -> TagKeys -> DeleteTagsRequest
newDeleteTagsRequest _FileSystemId _TagKeys = DeleteTagsRequest { "FileSystemId": _FileSystemId, "TagKeys": _TagKeys }

-- | Constructs DeleteTagsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteTagsRequest' :: FileSystemId -> TagKeys -> ( { "FileSystemId" :: (FileSystemId) , "TagKeys" :: (TagKeys) } -> {"FileSystemId" :: (FileSystemId) , "TagKeys" :: (TagKeys) } ) -> DeleteTagsRequest
newDeleteTagsRequest' _FileSystemId _TagKeys customize = (DeleteTagsRequest <<< customize) { "FileSystemId": _FileSystemId, "TagKeys": _TagKeys }



-- | <p>The service timed out trying to fulfill the request, and the client should try the call again.</p>
newtype DependencyTimeout = DependencyTimeout 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeDependencyTimeout :: Newtype DependencyTimeout _
derive instance repGenericDependencyTimeout :: Generic DependencyTimeout _
instance showDependencyTimeout :: Show DependencyTimeout where show = genericShow
instance decodeDependencyTimeout :: Decode DependencyTimeout where decode = genericDecode options
instance encodeDependencyTimeout :: Encode DependencyTimeout where encode = genericEncode options

-- | Constructs DependencyTimeout from required parameters
newDependencyTimeout :: ErrorCode -> DependencyTimeout
newDependencyTimeout _ErrorCode = DependencyTimeout { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs DependencyTimeout's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDependencyTimeout' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> DependencyTimeout
newDependencyTimeout' _ErrorCode customize = (DependencyTimeout <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeFileSystemsRequest = DescribeFileSystemsRequest 
  { "MaxItems" :: NullOrUndefined (MaxItems)
  , "Marker" :: NullOrUndefined (Marker)
  , "CreationToken" :: NullOrUndefined (CreationToken)
  , "FileSystemId" :: NullOrUndefined (FileSystemId)
  }
derive instance newtypeDescribeFileSystemsRequest :: Newtype DescribeFileSystemsRequest _
derive instance repGenericDescribeFileSystemsRequest :: Generic DescribeFileSystemsRequest _
instance showDescribeFileSystemsRequest :: Show DescribeFileSystemsRequest where show = genericShow
instance decodeDescribeFileSystemsRequest :: Decode DescribeFileSystemsRequest where decode = genericDecode options
instance encodeDescribeFileSystemsRequest :: Encode DescribeFileSystemsRequest where encode = genericEncode options

-- | Constructs DescribeFileSystemsRequest from required parameters
newDescribeFileSystemsRequest :: DescribeFileSystemsRequest
newDescribeFileSystemsRequest  = DescribeFileSystemsRequest { "CreationToken": (NullOrUndefined Nothing), "FileSystemId": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing) }

-- | Constructs DescribeFileSystemsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeFileSystemsRequest' :: ( { "MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "CreationToken" :: NullOrUndefined (CreationToken) , "FileSystemId" :: NullOrUndefined (FileSystemId) } -> {"MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "CreationToken" :: NullOrUndefined (CreationToken) , "FileSystemId" :: NullOrUndefined (FileSystemId) } ) -> DescribeFileSystemsRequest
newDescribeFileSystemsRequest'  customize = (DescribeFileSystemsRequest <<< customize) { "CreationToken": (NullOrUndefined Nothing), "FileSystemId": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing) }



newtype DescribeFileSystemsResponse = DescribeFileSystemsResponse 
  { "Marker" :: NullOrUndefined (Marker)
  , "FileSystems" :: NullOrUndefined (FileSystemDescriptions)
  , "NextMarker" :: NullOrUndefined (Marker)
  }
derive instance newtypeDescribeFileSystemsResponse :: Newtype DescribeFileSystemsResponse _
derive instance repGenericDescribeFileSystemsResponse :: Generic DescribeFileSystemsResponse _
instance showDescribeFileSystemsResponse :: Show DescribeFileSystemsResponse where show = genericShow
instance decodeDescribeFileSystemsResponse :: Decode DescribeFileSystemsResponse where decode = genericDecode options
instance encodeDescribeFileSystemsResponse :: Encode DescribeFileSystemsResponse where encode = genericEncode options

-- | Constructs DescribeFileSystemsResponse from required parameters
newDescribeFileSystemsResponse :: DescribeFileSystemsResponse
newDescribeFileSystemsResponse  = DescribeFileSystemsResponse { "FileSystems": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }

-- | Constructs DescribeFileSystemsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeFileSystemsResponse' :: ( { "Marker" :: NullOrUndefined (Marker) , "FileSystems" :: NullOrUndefined (FileSystemDescriptions) , "NextMarker" :: NullOrUndefined (Marker) } -> {"Marker" :: NullOrUndefined (Marker) , "FileSystems" :: NullOrUndefined (FileSystemDescriptions) , "NextMarker" :: NullOrUndefined (Marker) } ) -> DescribeFileSystemsResponse
newDescribeFileSystemsResponse'  customize = (DescribeFileSystemsResponse <<< customize) { "FileSystems": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeMountTargetSecurityGroupsRequest = DescribeMountTargetSecurityGroupsRequest 
  { "MountTargetId" :: (MountTargetId)
  }
derive instance newtypeDescribeMountTargetSecurityGroupsRequest :: Newtype DescribeMountTargetSecurityGroupsRequest _
derive instance repGenericDescribeMountTargetSecurityGroupsRequest :: Generic DescribeMountTargetSecurityGroupsRequest _
instance showDescribeMountTargetSecurityGroupsRequest :: Show DescribeMountTargetSecurityGroupsRequest where show = genericShow
instance decodeDescribeMountTargetSecurityGroupsRequest :: Decode DescribeMountTargetSecurityGroupsRequest where decode = genericDecode options
instance encodeDescribeMountTargetSecurityGroupsRequest :: Encode DescribeMountTargetSecurityGroupsRequest where encode = genericEncode options

-- | Constructs DescribeMountTargetSecurityGroupsRequest from required parameters
newDescribeMountTargetSecurityGroupsRequest :: MountTargetId -> DescribeMountTargetSecurityGroupsRequest
newDescribeMountTargetSecurityGroupsRequest _MountTargetId = DescribeMountTargetSecurityGroupsRequest { "MountTargetId": _MountTargetId }

-- | Constructs DescribeMountTargetSecurityGroupsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeMountTargetSecurityGroupsRequest' :: MountTargetId -> ( { "MountTargetId" :: (MountTargetId) } -> {"MountTargetId" :: (MountTargetId) } ) -> DescribeMountTargetSecurityGroupsRequest
newDescribeMountTargetSecurityGroupsRequest' _MountTargetId customize = (DescribeMountTargetSecurityGroupsRequest <<< customize) { "MountTargetId": _MountTargetId }



newtype DescribeMountTargetSecurityGroupsResponse = DescribeMountTargetSecurityGroupsResponse 
  { "SecurityGroups" :: (SecurityGroups)
  }
derive instance newtypeDescribeMountTargetSecurityGroupsResponse :: Newtype DescribeMountTargetSecurityGroupsResponse _
derive instance repGenericDescribeMountTargetSecurityGroupsResponse :: Generic DescribeMountTargetSecurityGroupsResponse _
instance showDescribeMountTargetSecurityGroupsResponse :: Show DescribeMountTargetSecurityGroupsResponse where show = genericShow
instance decodeDescribeMountTargetSecurityGroupsResponse :: Decode DescribeMountTargetSecurityGroupsResponse where decode = genericDecode options
instance encodeDescribeMountTargetSecurityGroupsResponse :: Encode DescribeMountTargetSecurityGroupsResponse where encode = genericEncode options

-- | Constructs DescribeMountTargetSecurityGroupsResponse from required parameters
newDescribeMountTargetSecurityGroupsResponse :: SecurityGroups -> DescribeMountTargetSecurityGroupsResponse
newDescribeMountTargetSecurityGroupsResponse _SecurityGroups = DescribeMountTargetSecurityGroupsResponse { "SecurityGroups": _SecurityGroups }

-- | Constructs DescribeMountTargetSecurityGroupsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeMountTargetSecurityGroupsResponse' :: SecurityGroups -> ( { "SecurityGroups" :: (SecurityGroups) } -> {"SecurityGroups" :: (SecurityGroups) } ) -> DescribeMountTargetSecurityGroupsResponse
newDescribeMountTargetSecurityGroupsResponse' _SecurityGroups customize = (DescribeMountTargetSecurityGroupsResponse <<< customize) { "SecurityGroups": _SecurityGroups }



-- | <p/>
newtype DescribeMountTargetsRequest = DescribeMountTargetsRequest 
  { "MaxItems" :: NullOrUndefined (MaxItems)
  , "Marker" :: NullOrUndefined (Marker)
  , "FileSystemId" :: NullOrUndefined (FileSystemId)
  , "MountTargetId" :: NullOrUndefined (MountTargetId)
  }
derive instance newtypeDescribeMountTargetsRequest :: Newtype DescribeMountTargetsRequest _
derive instance repGenericDescribeMountTargetsRequest :: Generic DescribeMountTargetsRequest _
instance showDescribeMountTargetsRequest :: Show DescribeMountTargetsRequest where show = genericShow
instance decodeDescribeMountTargetsRequest :: Decode DescribeMountTargetsRequest where decode = genericDecode options
instance encodeDescribeMountTargetsRequest :: Encode DescribeMountTargetsRequest where encode = genericEncode options

-- | Constructs DescribeMountTargetsRequest from required parameters
newDescribeMountTargetsRequest :: DescribeMountTargetsRequest
newDescribeMountTargetsRequest  = DescribeMountTargetsRequest { "FileSystemId": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing), "MountTargetId": (NullOrUndefined Nothing) }

-- | Constructs DescribeMountTargetsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeMountTargetsRequest' :: ( { "MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "FileSystemId" :: NullOrUndefined (FileSystemId) , "MountTargetId" :: NullOrUndefined (MountTargetId) } -> {"MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "FileSystemId" :: NullOrUndefined (FileSystemId) , "MountTargetId" :: NullOrUndefined (MountTargetId) } ) -> DescribeMountTargetsRequest
newDescribeMountTargetsRequest'  customize = (DescribeMountTargetsRequest <<< customize) { "FileSystemId": (NullOrUndefined Nothing), "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing), "MountTargetId": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeMountTargetsResponse = DescribeMountTargetsResponse 
  { "Marker" :: NullOrUndefined (Marker)
  , "MountTargets" :: NullOrUndefined (MountTargetDescriptions)
  , "NextMarker" :: NullOrUndefined (Marker)
  }
derive instance newtypeDescribeMountTargetsResponse :: Newtype DescribeMountTargetsResponse _
derive instance repGenericDescribeMountTargetsResponse :: Generic DescribeMountTargetsResponse _
instance showDescribeMountTargetsResponse :: Show DescribeMountTargetsResponse where show = genericShow
instance decodeDescribeMountTargetsResponse :: Decode DescribeMountTargetsResponse where decode = genericDecode options
instance encodeDescribeMountTargetsResponse :: Encode DescribeMountTargetsResponse where encode = genericEncode options

-- | Constructs DescribeMountTargetsResponse from required parameters
newDescribeMountTargetsResponse :: DescribeMountTargetsResponse
newDescribeMountTargetsResponse  = DescribeMountTargetsResponse { "Marker": (NullOrUndefined Nothing), "MountTargets": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }

-- | Constructs DescribeMountTargetsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeMountTargetsResponse' :: ( { "Marker" :: NullOrUndefined (Marker) , "MountTargets" :: NullOrUndefined (MountTargetDescriptions) , "NextMarker" :: NullOrUndefined (Marker) } -> {"Marker" :: NullOrUndefined (Marker) , "MountTargets" :: NullOrUndefined (MountTargetDescriptions) , "NextMarker" :: NullOrUndefined (Marker) } ) -> DescribeMountTargetsResponse
newDescribeMountTargetsResponse'  customize = (DescribeMountTargetsResponse <<< customize) { "Marker": (NullOrUndefined Nothing), "MountTargets": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeTagsRequest = DescribeTagsRequest 
  { "MaxItems" :: NullOrUndefined (MaxItems)
  , "Marker" :: NullOrUndefined (Marker)
  , "FileSystemId" :: (FileSystemId)
  }
derive instance newtypeDescribeTagsRequest :: Newtype DescribeTagsRequest _
derive instance repGenericDescribeTagsRequest :: Generic DescribeTagsRequest _
instance showDescribeTagsRequest :: Show DescribeTagsRequest where show = genericShow
instance decodeDescribeTagsRequest :: Decode DescribeTagsRequest where decode = genericDecode options
instance encodeDescribeTagsRequest :: Encode DescribeTagsRequest where encode = genericEncode options

-- | Constructs DescribeTagsRequest from required parameters
newDescribeTagsRequest :: FileSystemId -> DescribeTagsRequest
newDescribeTagsRequest _FileSystemId = DescribeTagsRequest { "FileSystemId": _FileSystemId, "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing) }

-- | Constructs DescribeTagsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTagsRequest' :: FileSystemId -> ( { "MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "FileSystemId" :: (FileSystemId) } -> {"MaxItems" :: NullOrUndefined (MaxItems) , "Marker" :: NullOrUndefined (Marker) , "FileSystemId" :: (FileSystemId) } ) -> DescribeTagsRequest
newDescribeTagsRequest' _FileSystemId customize = (DescribeTagsRequest <<< customize) { "FileSystemId": _FileSystemId, "Marker": (NullOrUndefined Nothing), "MaxItems": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeTagsResponse = DescribeTagsResponse 
  { "Marker" :: NullOrUndefined (Marker)
  , "Tags" :: (Tags)
  , "NextMarker" :: NullOrUndefined (Marker)
  }
derive instance newtypeDescribeTagsResponse :: Newtype DescribeTagsResponse _
derive instance repGenericDescribeTagsResponse :: Generic DescribeTagsResponse _
instance showDescribeTagsResponse :: Show DescribeTagsResponse where show = genericShow
instance decodeDescribeTagsResponse :: Decode DescribeTagsResponse where decode = genericDecode options
instance encodeDescribeTagsResponse :: Encode DescribeTagsResponse where encode = genericEncode options

-- | Constructs DescribeTagsResponse from required parameters
newDescribeTagsResponse :: Tags -> DescribeTagsResponse
newDescribeTagsResponse _Tags = DescribeTagsResponse { "Tags": _Tags, "Marker": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }

-- | Constructs DescribeTagsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTagsResponse' :: Tags -> ( { "Marker" :: NullOrUndefined (Marker) , "Tags" :: (Tags) , "NextMarker" :: NullOrUndefined (Marker) } -> {"Marker" :: NullOrUndefined (Marker) , "Tags" :: (Tags) , "NextMarker" :: NullOrUndefined (Marker) } ) -> DescribeTagsResponse
newDescribeTagsResponse' _Tags customize = (DescribeTagsResponse <<< customize) { "Tags": _Tags, "Marker": (NullOrUndefined Nothing), "NextMarker": (NullOrUndefined Nothing) }



newtype Encrypted = Encrypted Boolean
derive instance newtypeEncrypted :: Newtype Encrypted _
derive instance repGenericEncrypted :: Generic Encrypted _
instance showEncrypted :: Show Encrypted where show = genericShow
instance decodeEncrypted :: Decode Encrypted where decode = genericDecode options
instance encodeEncrypted :: Encode Encrypted where encode = genericEncode options



newtype ErrorCode = ErrorCode String
derive instance newtypeErrorCode :: Newtype ErrorCode _
derive instance repGenericErrorCode :: Generic ErrorCode _
instance showErrorCode :: Show ErrorCode where show = genericShow
instance decodeErrorCode :: Decode ErrorCode where decode = genericDecode options
instance encodeErrorCode :: Encode ErrorCode where encode = genericEncode options



newtype ErrorMessage = ErrorMessage String
derive instance newtypeErrorMessage :: Newtype ErrorMessage _
derive instance repGenericErrorMessage :: Generic ErrorMessage _
instance showErrorMessage :: Show ErrorMessage where show = genericShow
instance decodeErrorMessage :: Decode ErrorMessage where decode = genericDecode options
instance encodeErrorMessage :: Encode ErrorMessage where encode = genericEncode options



-- | <p>Returned if the file system you are trying to create already exists, with the creation token you provided.</p>
newtype FileSystemAlreadyExists = FileSystemAlreadyExists 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  , "FileSystemId" :: (FileSystemId)
  }
derive instance newtypeFileSystemAlreadyExists :: Newtype FileSystemAlreadyExists _
derive instance repGenericFileSystemAlreadyExists :: Generic FileSystemAlreadyExists _
instance showFileSystemAlreadyExists :: Show FileSystemAlreadyExists where show = genericShow
instance decodeFileSystemAlreadyExists :: Decode FileSystemAlreadyExists where decode = genericDecode options
instance encodeFileSystemAlreadyExists :: Encode FileSystemAlreadyExists where encode = genericEncode options

-- | Constructs FileSystemAlreadyExists from required parameters
newFileSystemAlreadyExists :: ErrorCode -> FileSystemId -> FileSystemAlreadyExists
newFileSystemAlreadyExists _ErrorCode _FileSystemId = FileSystemAlreadyExists { "ErrorCode": _ErrorCode, "FileSystemId": _FileSystemId, "Message": (NullOrUndefined Nothing) }

-- | Constructs FileSystemAlreadyExists's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemAlreadyExists' :: ErrorCode -> FileSystemId -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) , "FileSystemId" :: (FileSystemId) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) , "FileSystemId" :: (FileSystemId) } ) -> FileSystemAlreadyExists
newFileSystemAlreadyExists' _ErrorCode _FileSystemId customize = (FileSystemAlreadyExists <<< customize) { "ErrorCode": _ErrorCode, "FileSystemId": _FileSystemId, "Message": (NullOrUndefined Nothing) }



-- | <p>Description of the file system.</p>
newtype FileSystemDescription = FileSystemDescription 
  { "OwnerId" :: (AwsAccountId)
  , "CreationToken" :: (CreationToken)
  , "FileSystemId" :: (FileSystemId)
  , "CreationTime" :: (Types.Timestamp)
  , "LifeCycleState" :: (LifeCycleState)
  , "Name" :: NullOrUndefined (TagValue)
  , "NumberOfMountTargets" :: (MountTargetCount)
  , "SizeInBytes" :: (FileSystemSize)
  , "PerformanceMode" :: (PerformanceMode)
  , "Encrypted" :: NullOrUndefined (Encrypted)
  , "KmsKeyId" :: NullOrUndefined (KmsKeyId)
  }
derive instance newtypeFileSystemDescription :: Newtype FileSystemDescription _
derive instance repGenericFileSystemDescription :: Generic FileSystemDescription _
instance showFileSystemDescription :: Show FileSystemDescription where show = genericShow
instance decodeFileSystemDescription :: Decode FileSystemDescription where decode = genericDecode options
instance encodeFileSystemDescription :: Encode FileSystemDescription where encode = genericEncode options

-- | Constructs FileSystemDescription from required parameters
newFileSystemDescription :: Types.Timestamp -> CreationToken -> FileSystemId -> LifeCycleState -> MountTargetCount -> AwsAccountId -> PerformanceMode -> FileSystemSize -> FileSystemDescription
newFileSystemDescription _CreationTime _CreationToken _FileSystemId _LifeCycleState _NumberOfMountTargets _OwnerId _PerformanceMode _SizeInBytes = FileSystemDescription { "CreationTime": _CreationTime, "CreationToken": _CreationToken, "FileSystemId": _FileSystemId, "LifeCycleState": _LifeCycleState, "NumberOfMountTargets": _NumberOfMountTargets, "OwnerId": _OwnerId, "PerformanceMode": _PerformanceMode, "SizeInBytes": _SizeInBytes, "Encrypted": (NullOrUndefined Nothing), "KmsKeyId": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing) }

-- | Constructs FileSystemDescription's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemDescription' :: Types.Timestamp -> CreationToken -> FileSystemId -> LifeCycleState -> MountTargetCount -> AwsAccountId -> PerformanceMode -> FileSystemSize -> ( { "OwnerId" :: (AwsAccountId) , "CreationToken" :: (CreationToken) , "FileSystemId" :: (FileSystemId) , "CreationTime" :: (Types.Timestamp) , "LifeCycleState" :: (LifeCycleState) , "Name" :: NullOrUndefined (TagValue) , "NumberOfMountTargets" :: (MountTargetCount) , "SizeInBytes" :: (FileSystemSize) , "PerformanceMode" :: (PerformanceMode) , "Encrypted" :: NullOrUndefined (Encrypted) , "KmsKeyId" :: NullOrUndefined (KmsKeyId) } -> {"OwnerId" :: (AwsAccountId) , "CreationToken" :: (CreationToken) , "FileSystemId" :: (FileSystemId) , "CreationTime" :: (Types.Timestamp) , "LifeCycleState" :: (LifeCycleState) , "Name" :: NullOrUndefined (TagValue) , "NumberOfMountTargets" :: (MountTargetCount) , "SizeInBytes" :: (FileSystemSize) , "PerformanceMode" :: (PerformanceMode) , "Encrypted" :: NullOrUndefined (Encrypted) , "KmsKeyId" :: NullOrUndefined (KmsKeyId) } ) -> FileSystemDescription
newFileSystemDescription' _CreationTime _CreationToken _FileSystemId _LifeCycleState _NumberOfMountTargets _OwnerId _PerformanceMode _SizeInBytes customize = (FileSystemDescription <<< customize) { "CreationTime": _CreationTime, "CreationToken": _CreationToken, "FileSystemId": _FileSystemId, "LifeCycleState": _LifeCycleState, "NumberOfMountTargets": _NumberOfMountTargets, "OwnerId": _OwnerId, "PerformanceMode": _PerformanceMode, "SizeInBytes": _SizeInBytes, "Encrypted": (NullOrUndefined Nothing), "KmsKeyId": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing) }



newtype FileSystemDescriptions = FileSystemDescriptions (Array FileSystemDescription)
derive instance newtypeFileSystemDescriptions :: Newtype FileSystemDescriptions _
derive instance repGenericFileSystemDescriptions :: Generic FileSystemDescriptions _
instance showFileSystemDescriptions :: Show FileSystemDescriptions where show = genericShow
instance decodeFileSystemDescriptions :: Decode FileSystemDescriptions where decode = genericDecode options
instance encodeFileSystemDescriptions :: Encode FileSystemDescriptions where encode = genericEncode options



newtype FileSystemId = FileSystemId String
derive instance newtypeFileSystemId :: Newtype FileSystemId _
derive instance repGenericFileSystemId :: Generic FileSystemId _
instance showFileSystemId :: Show FileSystemId where show = genericShow
instance decodeFileSystemId :: Decode FileSystemId where decode = genericDecode options
instance encodeFileSystemId :: Encode FileSystemId where encode = genericEncode options



-- | <p>Returned if a file system has mount targets.</p>
newtype FileSystemInUse = FileSystemInUse 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeFileSystemInUse :: Newtype FileSystemInUse _
derive instance repGenericFileSystemInUse :: Generic FileSystemInUse _
instance showFileSystemInUse :: Show FileSystemInUse where show = genericShow
instance decodeFileSystemInUse :: Decode FileSystemInUse where decode = genericDecode options
instance encodeFileSystemInUse :: Encode FileSystemInUse where encode = genericEncode options

-- | Constructs FileSystemInUse from required parameters
newFileSystemInUse :: ErrorCode -> FileSystemInUse
newFileSystemInUse _ErrorCode = FileSystemInUse { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs FileSystemInUse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemInUse' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> FileSystemInUse
newFileSystemInUse' _ErrorCode customize = (FileSystemInUse <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if the AWS account has already created maximum number of file systems allowed per account.</p>
newtype FileSystemLimitExceeded = FileSystemLimitExceeded 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeFileSystemLimitExceeded :: Newtype FileSystemLimitExceeded _
derive instance repGenericFileSystemLimitExceeded :: Generic FileSystemLimitExceeded _
instance showFileSystemLimitExceeded :: Show FileSystemLimitExceeded where show = genericShow
instance decodeFileSystemLimitExceeded :: Decode FileSystemLimitExceeded where decode = genericDecode options
instance encodeFileSystemLimitExceeded :: Encode FileSystemLimitExceeded where encode = genericEncode options

-- | Constructs FileSystemLimitExceeded from required parameters
newFileSystemLimitExceeded :: ErrorCode -> FileSystemLimitExceeded
newFileSystemLimitExceeded _ErrorCode = FileSystemLimitExceeded { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs FileSystemLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemLimitExceeded' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> FileSystemLimitExceeded
newFileSystemLimitExceeded' _ErrorCode customize = (FileSystemLimitExceeded <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if the specified <code>FileSystemId</code> does not exist in the requester's AWS account.</p>
newtype FileSystemNotFound = FileSystemNotFound 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeFileSystemNotFound :: Newtype FileSystemNotFound _
derive instance repGenericFileSystemNotFound :: Generic FileSystemNotFound _
instance showFileSystemNotFound :: Show FileSystemNotFound where show = genericShow
instance decodeFileSystemNotFound :: Decode FileSystemNotFound where decode = genericDecode options
instance encodeFileSystemNotFound :: Encode FileSystemNotFound where encode = genericEncode options

-- | Constructs FileSystemNotFound from required parameters
newFileSystemNotFound :: ErrorCode -> FileSystemNotFound
newFileSystemNotFound _ErrorCode = FileSystemNotFound { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs FileSystemNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemNotFound' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> FileSystemNotFound
newFileSystemNotFound' _ErrorCode customize = (FileSystemNotFound <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Latest known metered size (in bytes) of data stored in the file system, in its <code>Value</code> field, and the time at which that size was determined in its <code>Timestamp</code> field. Note that the value does not represent the size of a consistent snapshot of the file system, but it is eventually consistent when there are no writes to the file system. That is, the value will represent the actual size only if the file system is not modified for a period longer than a couple of hours. Otherwise, the value is not necessarily the exact size the file system was at any instant in time.</p>
newtype FileSystemSize = FileSystemSize 
  { "Value" :: (FileSystemSizeValue)
  , "Timestamp" :: NullOrUndefined (Types.Timestamp)
  }
derive instance newtypeFileSystemSize :: Newtype FileSystemSize _
derive instance repGenericFileSystemSize :: Generic FileSystemSize _
instance showFileSystemSize :: Show FileSystemSize where show = genericShow
instance decodeFileSystemSize :: Decode FileSystemSize where decode = genericDecode options
instance encodeFileSystemSize :: Encode FileSystemSize where encode = genericEncode options

-- | Constructs FileSystemSize from required parameters
newFileSystemSize :: FileSystemSizeValue -> FileSystemSize
newFileSystemSize _Value = FileSystemSize { "Value": _Value, "Timestamp": (NullOrUndefined Nothing) }

-- | Constructs FileSystemSize's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newFileSystemSize' :: FileSystemSizeValue -> ( { "Value" :: (FileSystemSizeValue) , "Timestamp" :: NullOrUndefined (Types.Timestamp) } -> {"Value" :: (FileSystemSizeValue) , "Timestamp" :: NullOrUndefined (Types.Timestamp) } ) -> FileSystemSize
newFileSystemSize' _Value customize = (FileSystemSize <<< customize) { "Value": _Value, "Timestamp": (NullOrUndefined Nothing) }



newtype FileSystemSizeValue = FileSystemSizeValue Number
derive instance newtypeFileSystemSizeValue :: Newtype FileSystemSizeValue _
derive instance repGenericFileSystemSizeValue :: Generic FileSystemSizeValue _
instance showFileSystemSizeValue :: Show FileSystemSizeValue where show = genericShow
instance decodeFileSystemSizeValue :: Decode FileSystemSizeValue where decode = genericDecode options
instance encodeFileSystemSizeValue :: Encode FileSystemSizeValue where encode = genericEncode options



-- | <p>Returned if the file system's life cycle state is not "created".</p>
newtype IncorrectFileSystemLifeCycleState = IncorrectFileSystemLifeCycleState 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeIncorrectFileSystemLifeCycleState :: Newtype IncorrectFileSystemLifeCycleState _
derive instance repGenericIncorrectFileSystemLifeCycleState :: Generic IncorrectFileSystemLifeCycleState _
instance showIncorrectFileSystemLifeCycleState :: Show IncorrectFileSystemLifeCycleState where show = genericShow
instance decodeIncorrectFileSystemLifeCycleState :: Decode IncorrectFileSystemLifeCycleState where decode = genericDecode options
instance encodeIncorrectFileSystemLifeCycleState :: Encode IncorrectFileSystemLifeCycleState where encode = genericEncode options

-- | Constructs IncorrectFileSystemLifeCycleState from required parameters
newIncorrectFileSystemLifeCycleState :: ErrorCode -> IncorrectFileSystemLifeCycleState
newIncorrectFileSystemLifeCycleState _ErrorCode = IncorrectFileSystemLifeCycleState { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs IncorrectFileSystemLifeCycleState's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newIncorrectFileSystemLifeCycleState' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> IncorrectFileSystemLifeCycleState
newIncorrectFileSystemLifeCycleState' _ErrorCode customize = (IncorrectFileSystemLifeCycleState <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if the mount target is not in the correct state for the operation.</p>
newtype IncorrectMountTargetState = IncorrectMountTargetState 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeIncorrectMountTargetState :: Newtype IncorrectMountTargetState _
derive instance repGenericIncorrectMountTargetState :: Generic IncorrectMountTargetState _
instance showIncorrectMountTargetState :: Show IncorrectMountTargetState where show = genericShow
instance decodeIncorrectMountTargetState :: Decode IncorrectMountTargetState where decode = genericDecode options
instance encodeIncorrectMountTargetState :: Encode IncorrectMountTargetState where encode = genericEncode options

-- | Constructs IncorrectMountTargetState from required parameters
newIncorrectMountTargetState :: ErrorCode -> IncorrectMountTargetState
newIncorrectMountTargetState _ErrorCode = IncorrectMountTargetState { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs IncorrectMountTargetState's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newIncorrectMountTargetState' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> IncorrectMountTargetState
newIncorrectMountTargetState' _ErrorCode customize = (IncorrectMountTargetState <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if an error occurred on the server side.</p>
newtype InternalServerError = InternalServerError 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeInternalServerError :: Newtype InternalServerError _
derive instance repGenericInternalServerError :: Generic InternalServerError _
instance showInternalServerError :: Show InternalServerError where show = genericShow
instance decodeInternalServerError :: Decode InternalServerError where decode = genericDecode options
instance encodeInternalServerError :: Encode InternalServerError where encode = genericEncode options

-- | Constructs InternalServerError from required parameters
newInternalServerError :: ErrorCode -> InternalServerError
newInternalServerError _ErrorCode = InternalServerError { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs InternalServerError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalServerError' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> InternalServerError
newInternalServerError' _ErrorCode customize = (InternalServerError <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype IpAddress = IpAddress String
derive instance newtypeIpAddress :: Newtype IpAddress _
derive instance repGenericIpAddress :: Generic IpAddress _
instance showIpAddress :: Show IpAddress where show = genericShow
instance decodeIpAddress :: Decode IpAddress where decode = genericDecode options
instance encodeIpAddress :: Encode IpAddress where encode = genericEncode options



-- | <p>Returned if the request specified an <code>IpAddress</code> that is already in use in the subnet.</p>
newtype IpAddressInUse = IpAddressInUse 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeIpAddressInUse :: Newtype IpAddressInUse _
derive instance repGenericIpAddressInUse :: Generic IpAddressInUse _
instance showIpAddressInUse :: Show IpAddressInUse where show = genericShow
instance decodeIpAddressInUse :: Decode IpAddressInUse where decode = genericDecode options
instance encodeIpAddressInUse :: Encode IpAddressInUse where encode = genericEncode options

-- | Constructs IpAddressInUse from required parameters
newIpAddressInUse :: ErrorCode -> IpAddressInUse
newIpAddressInUse _ErrorCode = IpAddressInUse { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs IpAddressInUse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newIpAddressInUse' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> IpAddressInUse
newIpAddressInUse' _ErrorCode customize = (IpAddressInUse <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype KmsKeyId = KmsKeyId String
derive instance newtypeKmsKeyId :: Newtype KmsKeyId _
derive instance repGenericKmsKeyId :: Generic KmsKeyId _
instance showKmsKeyId :: Show KmsKeyId where show = genericShow
instance decodeKmsKeyId :: Decode KmsKeyId where decode = genericDecode options
instance encodeKmsKeyId :: Encode KmsKeyId where encode = genericEncode options



newtype LifeCycleState = LifeCycleState String
derive instance newtypeLifeCycleState :: Newtype LifeCycleState _
derive instance repGenericLifeCycleState :: Generic LifeCycleState _
instance showLifeCycleState :: Show LifeCycleState where show = genericShow
instance decodeLifeCycleState :: Decode LifeCycleState where decode = genericDecode options
instance encodeLifeCycleState :: Encode LifeCycleState where encode = genericEncode options



newtype Marker = Marker String
derive instance newtypeMarker :: Newtype Marker _
derive instance repGenericMarker :: Generic Marker _
instance showMarker :: Show Marker where show = genericShow
instance decodeMarker :: Decode Marker where decode = genericDecode options
instance encodeMarker :: Encode Marker where encode = genericEncode options



newtype MaxItems = MaxItems Int
derive instance newtypeMaxItems :: Newtype MaxItems _
derive instance repGenericMaxItems :: Generic MaxItems _
instance showMaxItems :: Show MaxItems where show = genericShow
instance decodeMaxItems :: Decode MaxItems where decode = genericDecode options
instance encodeMaxItems :: Encode MaxItems where encode = genericEncode options



-- | <p/>
newtype ModifyMountTargetSecurityGroupsRequest = ModifyMountTargetSecurityGroupsRequest 
  { "MountTargetId" :: (MountTargetId)
  , "SecurityGroups" :: NullOrUndefined (SecurityGroups)
  }
derive instance newtypeModifyMountTargetSecurityGroupsRequest :: Newtype ModifyMountTargetSecurityGroupsRequest _
derive instance repGenericModifyMountTargetSecurityGroupsRequest :: Generic ModifyMountTargetSecurityGroupsRequest _
instance showModifyMountTargetSecurityGroupsRequest :: Show ModifyMountTargetSecurityGroupsRequest where show = genericShow
instance decodeModifyMountTargetSecurityGroupsRequest :: Decode ModifyMountTargetSecurityGroupsRequest where decode = genericDecode options
instance encodeModifyMountTargetSecurityGroupsRequest :: Encode ModifyMountTargetSecurityGroupsRequest where encode = genericEncode options

-- | Constructs ModifyMountTargetSecurityGroupsRequest from required parameters
newModifyMountTargetSecurityGroupsRequest :: MountTargetId -> ModifyMountTargetSecurityGroupsRequest
newModifyMountTargetSecurityGroupsRequest _MountTargetId = ModifyMountTargetSecurityGroupsRequest { "MountTargetId": _MountTargetId, "SecurityGroups": (NullOrUndefined Nothing) }

-- | Constructs ModifyMountTargetSecurityGroupsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newModifyMountTargetSecurityGroupsRequest' :: MountTargetId -> ( { "MountTargetId" :: (MountTargetId) , "SecurityGroups" :: NullOrUndefined (SecurityGroups) } -> {"MountTargetId" :: (MountTargetId) , "SecurityGroups" :: NullOrUndefined (SecurityGroups) } ) -> ModifyMountTargetSecurityGroupsRequest
newModifyMountTargetSecurityGroupsRequest' _MountTargetId customize = (ModifyMountTargetSecurityGroupsRequest <<< customize) { "MountTargetId": _MountTargetId, "SecurityGroups": (NullOrUndefined Nothing) }



-- | <p>Returned if the mount target would violate one of the specified restrictions based on the file system's existing mount targets.</p>
newtype MountTargetConflict = MountTargetConflict 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeMountTargetConflict :: Newtype MountTargetConflict _
derive instance repGenericMountTargetConflict :: Generic MountTargetConflict _
instance showMountTargetConflict :: Show MountTargetConflict where show = genericShow
instance decodeMountTargetConflict :: Decode MountTargetConflict where decode = genericDecode options
instance encodeMountTargetConflict :: Encode MountTargetConflict where encode = genericEncode options

-- | Constructs MountTargetConflict from required parameters
newMountTargetConflict :: ErrorCode -> MountTargetConflict
newMountTargetConflict _ErrorCode = MountTargetConflict { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs MountTargetConflict's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newMountTargetConflict' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> MountTargetConflict
newMountTargetConflict' _ErrorCode customize = (MountTargetConflict <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype MountTargetCount = MountTargetCount Int
derive instance newtypeMountTargetCount :: Newtype MountTargetCount _
derive instance repGenericMountTargetCount :: Generic MountTargetCount _
instance showMountTargetCount :: Show MountTargetCount where show = genericShow
instance decodeMountTargetCount :: Decode MountTargetCount where decode = genericDecode options
instance encodeMountTargetCount :: Encode MountTargetCount where encode = genericEncode options



-- | <p>Provides a description of a mount target.</p>
newtype MountTargetDescription = MountTargetDescription 
  { "OwnerId" :: NullOrUndefined (AwsAccountId)
  , "MountTargetId" :: (MountTargetId)
  , "FileSystemId" :: (FileSystemId)
  , "SubnetId" :: (SubnetId)
  , "LifeCycleState" :: (LifeCycleState)
  , "IpAddress" :: NullOrUndefined (IpAddress)
  , "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId)
  }
derive instance newtypeMountTargetDescription :: Newtype MountTargetDescription _
derive instance repGenericMountTargetDescription :: Generic MountTargetDescription _
instance showMountTargetDescription :: Show MountTargetDescription where show = genericShow
instance decodeMountTargetDescription :: Decode MountTargetDescription where decode = genericDecode options
instance encodeMountTargetDescription :: Encode MountTargetDescription where encode = genericEncode options

-- | Constructs MountTargetDescription from required parameters
newMountTargetDescription :: FileSystemId -> LifeCycleState -> MountTargetId -> SubnetId -> MountTargetDescription
newMountTargetDescription _FileSystemId _LifeCycleState _MountTargetId _SubnetId = MountTargetDescription { "FileSystemId": _FileSystemId, "LifeCycleState": _LifeCycleState, "MountTargetId": _MountTargetId, "SubnetId": _SubnetId, "IpAddress": (NullOrUndefined Nothing), "NetworkInterfaceId": (NullOrUndefined Nothing), "OwnerId": (NullOrUndefined Nothing) }

-- | Constructs MountTargetDescription's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newMountTargetDescription' :: FileSystemId -> LifeCycleState -> MountTargetId -> SubnetId -> ( { "OwnerId" :: NullOrUndefined (AwsAccountId) , "MountTargetId" :: (MountTargetId) , "FileSystemId" :: (FileSystemId) , "SubnetId" :: (SubnetId) , "LifeCycleState" :: (LifeCycleState) , "IpAddress" :: NullOrUndefined (IpAddress) , "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId) } -> {"OwnerId" :: NullOrUndefined (AwsAccountId) , "MountTargetId" :: (MountTargetId) , "FileSystemId" :: (FileSystemId) , "SubnetId" :: (SubnetId) , "LifeCycleState" :: (LifeCycleState) , "IpAddress" :: NullOrUndefined (IpAddress) , "NetworkInterfaceId" :: NullOrUndefined (NetworkInterfaceId) } ) -> MountTargetDescription
newMountTargetDescription' _FileSystemId _LifeCycleState _MountTargetId _SubnetId customize = (MountTargetDescription <<< customize) { "FileSystemId": _FileSystemId, "LifeCycleState": _LifeCycleState, "MountTargetId": _MountTargetId, "SubnetId": _SubnetId, "IpAddress": (NullOrUndefined Nothing), "NetworkInterfaceId": (NullOrUndefined Nothing), "OwnerId": (NullOrUndefined Nothing) }



newtype MountTargetDescriptions = MountTargetDescriptions (Array MountTargetDescription)
derive instance newtypeMountTargetDescriptions :: Newtype MountTargetDescriptions _
derive instance repGenericMountTargetDescriptions :: Generic MountTargetDescriptions _
instance showMountTargetDescriptions :: Show MountTargetDescriptions where show = genericShow
instance decodeMountTargetDescriptions :: Decode MountTargetDescriptions where decode = genericDecode options
instance encodeMountTargetDescriptions :: Encode MountTargetDescriptions where encode = genericEncode options



newtype MountTargetId = MountTargetId String
derive instance newtypeMountTargetId :: Newtype MountTargetId _
derive instance repGenericMountTargetId :: Generic MountTargetId _
instance showMountTargetId :: Show MountTargetId where show = genericShow
instance decodeMountTargetId :: Decode MountTargetId where decode = genericDecode options
instance encodeMountTargetId :: Encode MountTargetId where encode = genericEncode options



-- | <p>Returned if there is no mount target with the specified ID found in the caller's account.</p>
newtype MountTargetNotFound = MountTargetNotFound 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeMountTargetNotFound :: Newtype MountTargetNotFound _
derive instance repGenericMountTargetNotFound :: Generic MountTargetNotFound _
instance showMountTargetNotFound :: Show MountTargetNotFound where show = genericShow
instance decodeMountTargetNotFound :: Decode MountTargetNotFound where decode = genericDecode options
instance encodeMountTargetNotFound :: Encode MountTargetNotFound where encode = genericEncode options

-- | Constructs MountTargetNotFound from required parameters
newMountTargetNotFound :: ErrorCode -> MountTargetNotFound
newMountTargetNotFound _ErrorCode = MountTargetNotFound { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs MountTargetNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newMountTargetNotFound' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> MountTargetNotFound
newMountTargetNotFound' _ErrorCode customize = (MountTargetNotFound <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype NetworkInterfaceId = NetworkInterfaceId String
derive instance newtypeNetworkInterfaceId :: Newtype NetworkInterfaceId _
derive instance repGenericNetworkInterfaceId :: Generic NetworkInterfaceId _
instance showNetworkInterfaceId :: Show NetworkInterfaceId where show = genericShow
instance decodeNetworkInterfaceId :: Decode NetworkInterfaceId where decode = genericDecode options
instance encodeNetworkInterfaceId :: Encode NetworkInterfaceId where encode = genericEncode options



-- | <p> The calling account has reached the ENI limit for the specific AWS region. Client should try to delete some ENIs or get its account limit raised. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a> in the Amazon Virtual Private Cloud User Guide (see the Network interfaces per VPC entry in the table). </p>
newtype NetworkInterfaceLimitExceeded = NetworkInterfaceLimitExceeded 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeNetworkInterfaceLimitExceeded :: Newtype NetworkInterfaceLimitExceeded _
derive instance repGenericNetworkInterfaceLimitExceeded :: Generic NetworkInterfaceLimitExceeded _
instance showNetworkInterfaceLimitExceeded :: Show NetworkInterfaceLimitExceeded where show = genericShow
instance decodeNetworkInterfaceLimitExceeded :: Decode NetworkInterfaceLimitExceeded where decode = genericDecode options
instance encodeNetworkInterfaceLimitExceeded :: Encode NetworkInterfaceLimitExceeded where encode = genericEncode options

-- | Constructs NetworkInterfaceLimitExceeded from required parameters
newNetworkInterfaceLimitExceeded :: ErrorCode -> NetworkInterfaceLimitExceeded
newNetworkInterfaceLimitExceeded _ErrorCode = NetworkInterfaceLimitExceeded { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs NetworkInterfaceLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNetworkInterfaceLimitExceeded' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> NetworkInterfaceLimitExceeded
newNetworkInterfaceLimitExceeded' _ErrorCode customize = (NetworkInterfaceLimitExceeded <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if <code>IpAddress</code> was not specified in the request and there are no free IP addresses in the subnet.</p>
newtype NoFreeAddressesInSubnet = NoFreeAddressesInSubnet 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeNoFreeAddressesInSubnet :: Newtype NoFreeAddressesInSubnet _
derive instance repGenericNoFreeAddressesInSubnet :: Generic NoFreeAddressesInSubnet _
instance showNoFreeAddressesInSubnet :: Show NoFreeAddressesInSubnet where show = genericShow
instance decodeNoFreeAddressesInSubnet :: Decode NoFreeAddressesInSubnet where decode = genericDecode options
instance encodeNoFreeAddressesInSubnet :: Encode NoFreeAddressesInSubnet where encode = genericEncode options

-- | Constructs NoFreeAddressesInSubnet from required parameters
newNoFreeAddressesInSubnet :: ErrorCode -> NoFreeAddressesInSubnet
newNoFreeAddressesInSubnet _ErrorCode = NoFreeAddressesInSubnet { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs NoFreeAddressesInSubnet's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNoFreeAddressesInSubnet' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> NoFreeAddressesInSubnet
newNoFreeAddressesInSubnet' _ErrorCode customize = (NoFreeAddressesInSubnet <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype PerformanceMode = PerformanceMode String
derive instance newtypePerformanceMode :: Newtype PerformanceMode _
derive instance repGenericPerformanceMode :: Generic PerformanceMode _
instance showPerformanceMode :: Show PerformanceMode where show = genericShow
instance decodePerformanceMode :: Decode PerformanceMode where decode = genericDecode options
instance encodePerformanceMode :: Encode PerformanceMode where encode = genericEncode options



newtype SecurityGroup = SecurityGroup String
derive instance newtypeSecurityGroup :: Newtype SecurityGroup _
derive instance repGenericSecurityGroup :: Generic SecurityGroup _
instance showSecurityGroup :: Show SecurityGroup where show = genericShow
instance decodeSecurityGroup :: Decode SecurityGroup where decode = genericDecode options
instance encodeSecurityGroup :: Encode SecurityGroup where encode = genericEncode options



-- | <p>Returned if the size of <code>SecurityGroups</code> specified in the request is greater than five.</p>
newtype SecurityGroupLimitExceeded = SecurityGroupLimitExceeded 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeSecurityGroupLimitExceeded :: Newtype SecurityGroupLimitExceeded _
derive instance repGenericSecurityGroupLimitExceeded :: Generic SecurityGroupLimitExceeded _
instance showSecurityGroupLimitExceeded :: Show SecurityGroupLimitExceeded where show = genericShow
instance decodeSecurityGroupLimitExceeded :: Decode SecurityGroupLimitExceeded where decode = genericDecode options
instance encodeSecurityGroupLimitExceeded :: Encode SecurityGroupLimitExceeded where encode = genericEncode options

-- | Constructs SecurityGroupLimitExceeded from required parameters
newSecurityGroupLimitExceeded :: ErrorCode -> SecurityGroupLimitExceeded
newSecurityGroupLimitExceeded _ErrorCode = SecurityGroupLimitExceeded { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs SecurityGroupLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSecurityGroupLimitExceeded' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> SecurityGroupLimitExceeded
newSecurityGroupLimitExceeded' _ErrorCode customize = (SecurityGroupLimitExceeded <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>Returned if one of the specified security groups does not exist in the subnet's VPC.</p>
newtype SecurityGroupNotFound = SecurityGroupNotFound 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeSecurityGroupNotFound :: Newtype SecurityGroupNotFound _
derive instance repGenericSecurityGroupNotFound :: Generic SecurityGroupNotFound _
instance showSecurityGroupNotFound :: Show SecurityGroupNotFound where show = genericShow
instance decodeSecurityGroupNotFound :: Decode SecurityGroupNotFound where decode = genericDecode options
instance encodeSecurityGroupNotFound :: Encode SecurityGroupNotFound where encode = genericEncode options

-- | Constructs SecurityGroupNotFound from required parameters
newSecurityGroupNotFound :: ErrorCode -> SecurityGroupNotFound
newSecurityGroupNotFound _ErrorCode = SecurityGroupNotFound { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs SecurityGroupNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSecurityGroupNotFound' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> SecurityGroupNotFound
newSecurityGroupNotFound' _ErrorCode customize = (SecurityGroupNotFound <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



newtype SecurityGroups = SecurityGroups (Array SecurityGroup)
derive instance newtypeSecurityGroups :: Newtype SecurityGroups _
derive instance repGenericSecurityGroups :: Generic SecurityGroups _
instance showSecurityGroups :: Show SecurityGroups where show = genericShow
instance decodeSecurityGroups :: Decode SecurityGroups where decode = genericDecode options
instance encodeSecurityGroups :: Encode SecurityGroups where encode = genericEncode options



newtype SubnetId = SubnetId String
derive instance newtypeSubnetId :: Newtype SubnetId _
derive instance repGenericSubnetId :: Generic SubnetId _
instance showSubnetId :: Show SubnetId where show = genericShow
instance decodeSubnetId :: Decode SubnetId where decode = genericDecode options
instance encodeSubnetId :: Encode SubnetId where encode = genericEncode options



-- | <p>Returned if there is no subnet with ID <code>SubnetId</code> provided in the request.</p>
newtype SubnetNotFound = SubnetNotFound 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeSubnetNotFound :: Newtype SubnetNotFound _
derive instance repGenericSubnetNotFound :: Generic SubnetNotFound _
instance showSubnetNotFound :: Show SubnetNotFound where show = genericShow
instance decodeSubnetNotFound :: Decode SubnetNotFound where decode = genericDecode options
instance encodeSubnetNotFound :: Encode SubnetNotFound where encode = genericEncode options

-- | Constructs SubnetNotFound from required parameters
newSubnetNotFound :: ErrorCode -> SubnetNotFound
newSubnetNotFound _ErrorCode = SubnetNotFound { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs SubnetNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSubnetNotFound' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> SubnetNotFound
newSubnetNotFound' _ErrorCode customize = (SubnetNotFound <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }



-- | <p>A tag is a key-value pair. Allowed characters: letters, whitespace, and numbers, representable in UTF-8, and the following characters:<code> + - = . _ : /</code> </p>
newtype Tag = Tag 
  { "Key" :: (TagKey)
  , "Value" :: (TagValue)
  }
derive instance newtypeTag :: Newtype Tag _
derive instance repGenericTag :: Generic Tag _
instance showTag :: Show Tag where show = genericShow
instance decodeTag :: Decode Tag where decode = genericDecode options
instance encodeTag :: Encode Tag where encode = genericEncode options

-- | Constructs Tag from required parameters
newTag :: TagKey -> TagValue -> Tag
newTag _Key _Value = Tag { "Key": _Key, "Value": _Value }

-- | Constructs Tag's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTag' :: TagKey -> TagValue -> ( { "Key" :: (TagKey) , "Value" :: (TagValue) } -> {"Key" :: (TagKey) , "Value" :: (TagValue) } ) -> Tag
newTag' _Key _Value customize = (Tag <<< customize) { "Key": _Key, "Value": _Value }



newtype TagKey = TagKey String
derive instance newtypeTagKey :: Newtype TagKey _
derive instance repGenericTagKey :: Generic TagKey _
instance showTagKey :: Show TagKey where show = genericShow
instance decodeTagKey :: Decode TagKey where decode = genericDecode options
instance encodeTagKey :: Encode TagKey where encode = genericEncode options



newtype TagKeys = TagKeys (Array TagKey)
derive instance newtypeTagKeys :: Newtype TagKeys _
derive instance repGenericTagKeys :: Generic TagKeys _
instance showTagKeys :: Show TagKeys where show = genericShow
instance decodeTagKeys :: Decode TagKeys where decode = genericDecode options
instance encodeTagKeys :: Encode TagKeys where encode = genericEncode options



newtype TagValue = TagValue String
derive instance newtypeTagValue :: Newtype TagValue _
derive instance repGenericTagValue :: Generic TagValue _
instance showTagValue :: Show TagValue where show = genericShow
instance decodeTagValue :: Decode TagValue where decode = genericDecode options
instance encodeTagValue :: Encode TagValue where encode = genericEncode options



newtype Tags = Tags (Array Tag)
derive instance newtypeTags :: Newtype Tags _
derive instance repGenericTags :: Generic Tags _
instance showTags :: Show Tags where show = genericShow
instance decodeTags :: Decode Tags where decode = genericDecode options
instance encodeTags :: Encode Tags where encode = genericEncode options



-- | <p/>
newtype UnsupportedAvailabilityZone = UnsupportedAvailabilityZone 
  { "ErrorCode" :: (ErrorCode)
  , "Message" :: NullOrUndefined (ErrorMessage)
  }
derive instance newtypeUnsupportedAvailabilityZone :: Newtype UnsupportedAvailabilityZone _
derive instance repGenericUnsupportedAvailabilityZone :: Generic UnsupportedAvailabilityZone _
instance showUnsupportedAvailabilityZone :: Show UnsupportedAvailabilityZone where show = genericShow
instance decodeUnsupportedAvailabilityZone :: Decode UnsupportedAvailabilityZone where decode = genericDecode options
instance encodeUnsupportedAvailabilityZone :: Encode UnsupportedAvailabilityZone where encode = genericEncode options

-- | Constructs UnsupportedAvailabilityZone from required parameters
newUnsupportedAvailabilityZone :: ErrorCode -> UnsupportedAvailabilityZone
newUnsupportedAvailabilityZone _ErrorCode = UnsupportedAvailabilityZone { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

-- | Constructs UnsupportedAvailabilityZone's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newUnsupportedAvailabilityZone' :: ErrorCode -> ( { "ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } -> {"ErrorCode" :: (ErrorCode) , "Message" :: NullOrUndefined (ErrorMessage) } ) -> UnsupportedAvailabilityZone
newUnsupportedAvailabilityZone' _ErrorCode customize = (UnsupportedAvailabilityZone <<< customize) { "ErrorCode": _ErrorCode, "Message": (NullOrUndefined Nothing) }

