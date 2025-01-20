@interface CCDEnrollmentProvisionallyEnrollRequest
- (NSString)nonce;
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
- (void)setNonce:(id)a3;
@end

@implementation CCDEnrollmentProvisionallyEnrollRequest

- (int64_t)requestType
{
  return 0;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depProvisionalEnrollmentURLStringWithURLString:@"https://deviceenrollment.apple.com/v2/enroll"];
}

- (id)requestPayload
{
  v3 = objc_opt_new();
  v4 = [(CCDEnrollmentProvisionallyEnrollRequest *)self nonce];

  if (v4)
  {
    v5 = [(CCDEnrollmentProvisionallyEnrollRequest *)self nonce];
    [v3 setNonce:v5];
  }
  else
  {
    v6 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Nonce is NOT provided in %@. Request will probably fail.", (uint8_t *)&v8, 0xCu);
    }
  }

  return v3;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end