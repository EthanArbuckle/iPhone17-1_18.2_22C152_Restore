@interface VSJSResponsePayload
- (BOOL)isSynchronizable;
- (NSArray)clearSubscriptions;
- (NSArray)subscriptions;
- (NSArray)userAccounts;
- (NSArray)userChannelList;
- (NSDate)expirationDate;
- (NSNumber)expectedAction;
- (NSString)appBundleIdentifier;
- (NSString)authN;
- (NSString)authenticationScheme;
- (NSString)logout;
- (NSString)statusCode;
- (NSString)userMetadata;
- (NSString)username;
- (VSJSResponsePayload)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAuthN:(id)a3;
- (void)setAuthenticationScheme:(id)a3;
- (void)setClearSubscriptions:(id)a3;
- (void)setExpectedAction:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setLogout:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setUserAccounts:(id)a3;
- (void)setUserChannelList:(id)a3;
- (void)setUserMetadata:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation VSJSResponsePayload

- (VSJSResponsePayload)init
{
  v3 = [MEMORY[0x263F4B3C8] currentAppContext];
  v9.receiver = self;
  v9.super_class = (Class)VSJSResponsePayload;
  v4 = [(IKJSObject *)&v9 initWithAppContext:v3];

  if (v4)
  {
    authN = v4->_authN;
    v4->_authN = (NSString *)&stru_26F361E90;

    userMetadata = v4->_userMetadata;
    v4->_userMetadata = (NSString *)&stru_26F361E90;

    logout = v4->_logout;
    v4->_logout = (NSString *)&stru_26F361E90;

    objc_storeStrong((id *)&v4->_authenticationScheme, (id)*MEMORY[0x263F1E3F0]);
    v4->_synchronizable = 1;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[VSJSResponsePayload allocWithZone:a3];
  v5 = [(IKJSObject *)self appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  uint64_t v7 = [(NSString *)self->_authN copy];
  authN = v6->_authN;
  v6->_authN = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_username copy];
  username = v6->_username;
  v6->_username = (NSString *)v9;

  uint64_t v11 = [(NSDate *)self->_expirationDate copy];
  expirationDate = v6->_expirationDate;
  v6->_expirationDate = (NSDate *)v11;

  uint64_t v13 = [(NSString *)self->_userMetadata copy];
  userMetadata = v6->_userMetadata;
  v6->_userMetadata = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_logout copy];
  logout = v6->_logout;
  v6->_logout = (NSString *)v15;

  uint64_t v17 = [(NSArray *)self->_userChannelList copy];
  userChannelList = v6->_userChannelList;
  v6->_userChannelList = (NSArray *)v17;

  uint64_t v19 = [(NSString *)self->_authenticationScheme copy];
  authenticationScheme = v6->_authenticationScheme;
  v6->_authenticationScheme = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_statusCode copy];
  statusCode = v6->_statusCode;
  v6->_statusCode = (NSString *)v21;

  uint64_t v23 = [(NSNumber *)self->_expectedAction copy];
  expectedAction = v6->_expectedAction;
  v6->_expectedAction = (NSNumber *)v23;

  uint64_t v25 = [(NSArray *)self->_subscriptions copy];
  subscriptions = v6->_subscriptions;
  v6->_subscriptions = (NSArray *)v25;

  uint64_t v27 = [(NSArray *)self->_clearSubscriptions copy];
  clearSubscriptions = v6->_clearSubscriptions;
  v6->_clearSubscriptions = (NSArray *)v27;

  uint64_t v29 = [(NSArray *)self->_userAccounts copy];
  userAccounts = v6->_userAccounts;
  v6->_userAccounts = (NSArray *)v29;

  uint64_t v31 = [(NSString *)self->_appBundleIdentifier copy];
  appBundleIdentifier = v6->_appBundleIdentifier;
  v6->_appBundleIdentifier = (NSString *)v31;

  return v6;
}

- (NSString)authN
{
  return self->_authN;
}

- (void)setAuthN:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)userMetadata
{
  return self->_userMetadata;
}

- (void)setUserMetadata:(id)a3
{
}

- (NSString)logout
{
  return self->_logout;
}

- (void)setLogout:(id)a3
{
}

- (NSArray)userChannelList
{
  return self->_userChannelList;
}

- (void)setUserChannelList:(id)a3
{
}

- (NSString)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void)setAuthenticationScheme:(id)a3
{
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSNumber)expectedAction
{
  return self->_expectedAction;
}

- (void)setExpectedAction:(id)a3
{
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSArray)clearSubscriptions
{
  return self->_clearSubscriptions;
}

- (void)setClearSubscriptions:(id)a3
{
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void)setUserAccounts:(id)a3
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
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_clearSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_expectedAction, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
  objc_storeStrong((id *)&self->_userChannelList, 0);
  objc_storeStrong((id *)&self->_logout, 0);
  objc_storeStrong((id *)&self->_userMetadata, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_authN, 0);
}

@end