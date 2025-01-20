@interface NNMKAccountAuthenticationState
- (NSString)accountId;
- (NSString)displayName;
- (NSString)emailAddressToken;
- (NSString)subsectionId;
- (unint64_t)state;
- (void)setAccountId:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressToken:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubsectionId:(id)a3;
@end

@implementation NNMKAccountAuthenticationState

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)subsectionId
{
  return self->_subsectionId;
}

- (void)setSubsectionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsectionId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end