@interface CCDEnrollmentRetrieveCloudConfigurationRequest
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
@end

@implementation CCDEnrollmentRetrieveCloudConfigurationRequest

- (int64_t)requestType
{
  return 1;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depConfigurationEnrollmentURLStringWithURLString:@"https://iprofiles.apple.com/v2/profile"];
}

- (id)requestPayload
{
  v2 = objc_opt_new();

  return v2;
}

@end