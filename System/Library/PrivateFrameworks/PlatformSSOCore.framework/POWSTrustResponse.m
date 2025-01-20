@interface POWSTrustResponse
- (BOOL)isCredentialFault;
- (BOOL)isFault;
- (NSDate)created;
- (NSDate)expires;
- (NSDate)tokenExpires;
- (NSString)assertion;
- (NSString)endpointURN;
- (NSString)faultCodeValue;
- (NSString)faultReason;
- (NSString)faultSubCodeValue;
- (NSString)keyIdentifier;
- (NSString)nonce;
- (NSString)securityExtensionPrefix;
- (NSString)tokenType;
- (void)setAssertion:(id)a3;
- (void)setCreated:(id)a3;
- (void)setEndpointURN:(id)a3;
- (void)setExpires:(id)a3;
- (void)setFault:(BOOL)a3;
- (void)setFaultCodeValue:(id)a3;
- (void)setFaultReason:(id)a3;
- (void)setFaultSubCodeValue:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSecurityExtensionPrefix:(id)a3;
- (void)setTokenExpires:(id)a3;
- (void)setTokenType:(id)a3;
@end

@implementation POWSTrustResponse

- (BOOL)isCredentialFault
{
  if (![(POWSTrustResponse *)self isFault]) {
    return 0;
  }
  v3 = [(POWSTrustResponse *)self faultSubCodeValue];
  v4 = NSString;
  v5 = [(POWSTrustResponse *)self securityExtensionPrefix];
  v6 = [v4 stringWithFormat:@"%@:FailedAuthentication", v5];
  if ([v3 isEqualToString:v6])
  {
    char v7 = 1;
  }
  else
  {
    v8 = [(POWSTrustResponse *)self faultSubCodeValue];
    char v7 = [v8 hasSuffix:@"FailedAuthentication"];
  }
  return v7;
}

- (BOOL)isFault
{
  return self->_fault;
}

- (void)setFault:(BOOL)a3
{
  self->_fault = a3;
}

- (NSString)faultReason
{
  return self->_faultReason;
}

- (void)setFaultReason:(id)a3
{
}

- (NSString)faultCodeValue
{
  return self->_faultCodeValue;
}

- (void)setFaultCodeValue:(id)a3
{
}

- (NSString)faultSubCodeValue
{
  return self->_faultSubCodeValue;
}

- (void)setFaultSubCodeValue:(id)a3
{
}

- (NSString)endpointURN
{
  return self->_endpointURN;
}

- (void)setEndpointURN:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSString)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
}

- (NSDate)tokenExpires
{
  return self->_tokenExpires;
}

- (void)setTokenExpires:(id)a3
{
}

- (NSString)securityExtensionPrefix
{
  return self->_securityExtensionPrefix;
}

- (void)setSecurityExtensionPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityExtensionPrefix, 0);
  objc_storeStrong((id *)&self->_tokenExpires, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_endpointURN, 0);
  objc_storeStrong((id *)&self->_faultSubCodeValue, 0);
  objc_storeStrong((id *)&self->_faultCodeValue, 0);
  objc_storeStrong((id *)&self->_faultReason, 0);
}

@end