@interface PKAuthenticatorEvaluationResponse
+ (id)responseWithResult:(int64_t)a3;
+ (id)responseWithResult:(int64_t)a3 biometricMatch:(BOOL)a4 credential:(id)a5;
- (BOOL)biometricMatch;
- (NSData)credential;
- (NSString)kextBlacklistVersion;
- (int64_t)result;
- (void)setKextBlacklistVersion:(id)a3;
@end

@implementation PKAuthenticatorEvaluationResponse

+ (id)responseWithResult:(int64_t)a3
{
  return (id)[a1 responseWithResult:a3 biometricMatch:0 credential:0];
}

+ (id)responseWithResult:(int64_t)a3 biometricMatch:(BOOL)a4 credential:(id)a5
{
  id v8 = a5;
  v9 = objc_alloc_init(PKAuthenticatorEvaluationResponse);
  v10 = v9;
  if (v9)
  {
    v9->_result = a3;
    v9->_biometricMatch = a4;
    objc_storeStrong((id *)&v9->_credential, a5);
  }

  return v10;
}

- (int64_t)result
{
  return self->_result;
}

- (BOOL)biometricMatch
{
  return self->_biometricMatch;
}

- (NSString)kextBlacklistVersion
{
  return self->_kextBlacklistVersion;
}

- (void)setKextBlacklistVersion:(id)a3
{
}

- (NSData)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_kextBlacklistVersion, 0);
}

@end