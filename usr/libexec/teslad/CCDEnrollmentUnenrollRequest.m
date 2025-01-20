@interface CCDEnrollmentUnenrollRequest
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
@end

@implementation CCDEnrollmentUnenrollRequest

- (int64_t)requestType
{
  return 3;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depRemoveEnrollmentURLStringWithURLString:@"https://iprofiles.apple.com/v2/unenroll"];
}

- (id)requestPayload
{
  v2 = objc_opt_new();

  return v2;
}

@end