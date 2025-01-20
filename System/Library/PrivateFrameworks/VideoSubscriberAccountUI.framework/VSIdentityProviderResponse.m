@interface VSIdentityProviderResponse
- (BOOL)didCreateAccount;
- (VSAccount)account;
- (VSAccountMetadata)accountMetadata;
- (VSIdentityProviderResponse)init;
- (VSOptional)logoLoadOperation;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setAccountMetadata:(id)a3;
- (void)setDidCreateAccount:(BOOL)a3;
- (void)setLogoLoadOperation:(id)a3;
@end

@implementation VSIdentityProviderResponse

- (VSIdentityProviderResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderResponse;
  v2 = [(VSIdentityProviderResponse *)&v6 init];
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    logoLoadOperation = v2->_logoLoadOperation;
    v2->_logoLoadOperation = v3;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = NSString;
  v5 = [(VSIdentityProviderResponse *)self accountMetadata];
  objc_super v6 = [v4 stringWithFormat:@"%@ = %@", @"accountMetadata", v5];
  [v3 addObject:v6];

  v7 = NSString;
  v8 = [(VSIdentityProviderResponse *)self account];
  v9 = [v7 stringWithFormat:@"%@ = %@", @"account", v8];
  [v3 addObject:v9];

  v10 = NSString;
  v11 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSIdentityProviderResponse didCreateAccount](self, "didCreateAccount"));
  v12 = [v10 stringWithFormat:@"%@ = %@", @"didCreateAccount", v11];
  [v3 addObject:v12];

  v13 = NSString;
  v14 = [(VSIdentityProviderResponse *)self logoLoadOperation];
  v15 = [v13 stringWithFormat:@"%@ = %@", @"logoLoadOperation", v14];
  [v3 addObject:v15];

  v16 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)VSIdentityProviderResponse;
  v17 = [(VSIdentityProviderResponse *)&v21 description];
  v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v16 stringWithFormat:@"<%@ %@>", v17, v18];

  return v19;
}

- (VSAccountMetadata)accountMetadata
{
  return self->_accountMetadata;
}

- (void)setAccountMetadata:(id)a3
{
}

- (VSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)didCreateAccount
{
  return self->_didCreateAccount;
}

- (void)setDidCreateAccount:(BOOL)a3
{
  self->_didCreateAccount = a3;
}

- (VSOptional)logoLoadOperation
{
  return self->_logoLoadOperation;
}

- (void)setLogoLoadOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoLoadOperation, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountMetadata, 0);
}

@end