@interface ICDelegationPlayInfoResponseToken
- (NSData)tokenData;
- (NSDate)expirationDate;
- (NSString)storefrontIdentifier;
- (void)setExpirationDate:(id)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setTokenData:(id)a3;
@end

@implementation ICDelegationPlayInfoResponseToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_tokenData, 0);
}

- (void)setStorefrontIdentifier:(id)a3
{
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setTokenData:(id)a3
{
}

- (NSData)tokenData
{
  return self->_tokenData;
}

@end