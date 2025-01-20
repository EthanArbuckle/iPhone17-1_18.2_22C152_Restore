@interface POWSTrustRequest
- (NSMutableData)password;
- (NSString)action;
- (NSString)endpointURN;
- (NSString)nonce;
- (NSString)to;
- (NSString)userName;
- (void)setAction:(id)a3;
- (void)setEndpointURN:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPassword:(id)a3;
- (void)setTo:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation POWSTrustRequest

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
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

- (NSString)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSMutableData)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_endpointURN, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end