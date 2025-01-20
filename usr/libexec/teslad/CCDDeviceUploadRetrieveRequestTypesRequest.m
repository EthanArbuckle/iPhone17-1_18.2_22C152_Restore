@interface CCDDeviceUploadRetrieveRequestTypesRequest
- (id)endpointPath;
- (id)httpMethod;
- (int64_t)requestType;
@end

@implementation CCDDeviceUploadRetrieveRequestTypesRequest

- (int64_t)requestType
{
  return 1;
}

- (id)httpMethod
{
  return @"GET";
}

- (id)endpointPath
{
  return @"/device/upload/requesttypes";
}

@end