@interface CCDEnrollmentUploadPushTokenRequest
- (NSData)pushToken;
- (NSString)pushTopic;
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
@end

@implementation CCDEnrollmentUploadPushTokenRequest

- (int64_t)requestType
{
  return 4;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures deviceRegisterURLStringWithURLString:@"https://iprofiles.apple.com/deviceRegister"];
}

- (id)requestPayload
{
  v3 = objc_opt_new();
  v4 = [(CCDEnrollmentUploadPushTokenRequest *)self pushToken];
  [v3 setPushToken:v4];

  v5 = [(CCDEnrollmentUploadPushTokenRequest *)self pushTopic];
  [v3 setPushTopic:v5];

  return v3;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end