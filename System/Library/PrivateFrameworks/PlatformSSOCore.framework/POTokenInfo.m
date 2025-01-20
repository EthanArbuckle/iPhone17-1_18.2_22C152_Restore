@interface POTokenInfo
- (BOOL)canLogin;
- (NSData)keyHash;
- (NSData)wrapHash;
- (NSString)name;
- (NSString)tokenId;
- (void)setCanLogin:(BOOL)a3;
- (void)setKeyHash:(id)a3;
- (void)setName:(id)a3;
- (void)setTokenId:(id)a3;
- (void)setWrapHash:(id)a3;
@end

@implementation POTokenInfo

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)tokenId
{
  return self->_tokenId;
}

- (void)setTokenId:(id)a3
{
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
}

- (NSData)wrapHash
{
  return self->_wrapHash;
}

- (void)setWrapHash:(id)a3
{
}

- (BOOL)canLogin
{
  return self->_canLogin;
}

- (void)setCanLogin:(BOOL)a3
{
  self->_canLogin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapHash, 0);
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_tokenId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end