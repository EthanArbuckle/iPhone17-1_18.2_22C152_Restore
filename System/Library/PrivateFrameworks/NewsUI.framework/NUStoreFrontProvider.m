@interface NUStoreFrontProvider
- (FCAppleAccount)appleAccount;
- (NSString)storeFrontIdentifier;
- (NUStoreFrontProvider)initWithAppleAccount:(id)a3;
@end

@implementation NUStoreFrontProvider

- (NUStoreFrontProvider)initWithAppleAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUStoreFrontProvider;
  v6 = [(NUStoreFrontProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appleAccount, a3);
  }

  return v7;
}

- (NSString)storeFrontIdentifier
{
  v2 = [(NUStoreFrontProvider *)self appleAccount];
  v3 = [v2 contentStoreFrontID];

  return (NSString *)v3;
}

- (FCAppleAccount)appleAccount
{
  return self->_appleAccount;
}

- (void).cxx_destruct
{
}

@end