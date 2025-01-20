@interface CCDDeviceUploadRetrieveSoldToIdsRequest
- (DEPDeviceUploadOrganization)organization;
- (id)endpointPath;
- (id)httpMethod;
- (id)requestBody;
- (int64_t)requestType;
- (void)setOrganization:(id)a3;
@end

@implementation CCDDeviceUploadRetrieveSoldToIdsRequest

- (int64_t)requestType
{
  return 2;
}

- (id)httpMethod
{
  return @"POST";
}

- (id)endpointPath
{
  return @"/device/upload/getorgsoldtoid";
}

- (id)requestBody
{
  CFStringRef v6 = @"searchString";
  v2 = [(CCDDeviceUploadRetrieveSoldToIdsRequest *)self organization];
  v3 = [v2 orgId];
  v7 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (DEPDeviceUploadOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (void).cxx_destruct
{
}

@end