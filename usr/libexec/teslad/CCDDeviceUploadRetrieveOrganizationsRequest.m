@interface CCDDeviceUploadRetrieveOrganizationsRequest
- (id)endpointPath;
- (id)httpMethod;
- (int64_t)requestType;
@end

@implementation CCDDeviceUploadRetrieveOrganizationsRequest

- (int64_t)requestType
{
  return 0;
}

- (id)httpMethod
{
  return @"GET";
}

- (id)endpointPath
{
  return @"/device/upload/orgs";
}

@end