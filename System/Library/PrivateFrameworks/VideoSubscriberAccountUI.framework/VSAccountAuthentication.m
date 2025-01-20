@interface VSAccountAuthentication
- (BOOL)isSynchronizable;
- (NSString)appBundleIdentifier;
- (NSString)username;
- (VSAccountAuthentication)init;
- (VSOptional)authenticationToken;
- (id)description;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation VSAccountAuthentication

- (VSAccountAuthentication)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSAccountAuthentication;
  v2 = [(VSAccountAuthentication *)&v6 init];
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    authenticationToken = v2->_authenticationToken;
    v2->_authenticationToken = v3;

    v2->_synchronizable = 1;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = NSString;
  v5 = [(VSAccountAuthentication *)self username];
  objc_super v6 = [v4 stringWithFormat:@"%@ = %@", @"username", v5];
  [v3 addObject:v6];

  v7 = NSString;
  v8 = [(VSAccountAuthentication *)self authenticationToken];
  v9 = [v7 stringWithFormat:@"%@ = %@", @"authenticationToken", v8];
  [v3 addObject:v9];

  v10 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)VSAccountAuthentication;
  v11 = [(VSAccountAuthentication *)&v15 description];
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v10 stringWithFormat:@"<%@ %@>", v11, v12];

  return v13;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (VSOptional)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (BOOL)isSynchronizable
{
  return self->_synchronizable;
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end