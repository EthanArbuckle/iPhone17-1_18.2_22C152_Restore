@interface VSApplicationControllerRequest
- (NSArray)attributeNames;
- (NSString)SAMLRequest;
- (NSString)authenticationToken;
- (NSString)requestorVerificationToken;
- (int64_t)type;
- (void)setAttributeNames:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setRequestorVerificationToken:(id)a3;
- (void)setSAMLRequest:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VSApplicationControllerRequest

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)SAMLRequest
{
  return self->_SAMLRequest;
}

- (void)setSAMLRequest:(id)a3
{
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void)setAttributeNames:(id)a3
{
}

- (NSString)requestorVerificationToken
{
  return self->_requestorVerificationToken;
}

- (void)setRequestorVerificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestorVerificationToken, 0);
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_SAMLRequest, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
}

@end