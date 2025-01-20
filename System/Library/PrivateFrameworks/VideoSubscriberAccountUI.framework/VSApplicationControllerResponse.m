@interface VSApplicationControllerResponse
- (NSArray)applicationUserAccounts;
- (NSArray)subscriptionsToAdd;
- (NSArray)subscriptionsToRemoveByBundleID;
- (NSNumber)expectedAction;
- (NSSet)accountChannelIDs;
- (NSString)authenticationScheme;
- (NSString)responseStatusCode;
- (NSString)responseString;
- (VSAccountAuthentication)accountAuthentication;
- (id)description;
- (void)setAccountAuthentication:(id)a3;
- (void)setAccountChannelIDs:(id)a3;
- (void)setApplicationUserAccounts:(id)a3;
- (void)setAuthenticationScheme:(id)a3;
- (void)setExpectedAction:(id)a3;
- (void)setResponseStatusCode:(id)a3;
- (void)setResponseString:(id)a3;
- (void)setSubscriptionsToAdd:(id)a3;
- (void)setSubscriptionsToRemoveByBundleID:(id)a3;
@end

@implementation VSApplicationControllerResponse

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = NSString;
  v5 = [(VSApplicationControllerResponse *)self authenticationScheme];
  v6 = [v4 stringWithFormat:@"%@ = %@", @"authenticationScheme", v5];
  [v3 addObject:v6];

  v7 = NSString;
  v8 = [(VSApplicationControllerResponse *)self responseStatusCode];
  v9 = [v7 stringWithFormat:@"%@ = %@", @"responseStatusCode", v8];
  [v3 addObject:v9];

  v10 = NSString;
  v11 = [(VSApplicationControllerResponse *)self responseString];
  v12 = [v10 stringWithFormat:@"%@ = %@", @"responseString", v11];
  [v3 addObject:v12];

  v13 = NSString;
  v14 = [(VSApplicationControllerResponse *)self expectedAction];
  v15 = [v13 stringWithFormat:@"%@ = %@", @"expectedAction", v14];
  [v3 addObject:v15];

  v16 = NSString;
  v17 = [(VSApplicationControllerResponse *)self accountAuthentication];
  v18 = [v16 stringWithFormat:@"%@ = %@", @"accountAuthentication", v17];
  [v3 addObject:v18];

  v19 = NSString;
  v20 = [(VSApplicationControllerResponse *)self accountChannelIDs];
  v21 = [v19 stringWithFormat:@"%@ = %@", @"accountChannelIDs", v20];
  [v3 addObject:v21];

  v22 = NSString;
  v23 = [(VSApplicationControllerResponse *)self subscriptionsToAdd];
  v24 = [v22 stringWithFormat:@"%@ = %@", @"subscriptionsToAdd", v23];
  [v3 addObject:v24];

  v25 = NSString;
  v26 = [(VSApplicationControllerResponse *)self subscriptionsToRemoveByBundleID];
  v27 = [v25 stringWithFormat:@"%@ = %@", @"subscriptionsToRemoveByBundleID", v26];
  [v3 addObject:v27];

  v28 = NSString;
  v29 = [(VSApplicationControllerResponse *)self applicationUserAccounts];
  v30 = [v28 stringWithFormat:@"%@ = %@", @"applicationUserAccounts", v29];
  [v3 addObject:v30];

  v31 = NSString;
  v36.receiver = self;
  v36.super_class = (Class)VSApplicationControllerResponse;
  v32 = [(VSApplicationControllerResponse *)&v36 description];
  v33 = [v3 componentsJoinedByString:@", "];
  v34 = [v31 stringWithFormat:@"<%@ %@>", v32, v33];

  return v34;
}

- (NSString)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void)setAuthenticationScheme:(id)a3
{
}

- (NSString)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(id)a3
{
}

- (NSString)responseString
{
  return self->_responseString;
}

- (void)setResponseString:(id)a3
{
}

- (NSNumber)expectedAction
{
  return self->_expectedAction;
}

- (void)setExpectedAction:(id)a3
{
}

- (VSAccountAuthentication)accountAuthentication
{
  return self->_accountAuthentication;
}

- (void)setAccountAuthentication:(id)a3
{
}

- (NSSet)accountChannelIDs
{
  return self->_accountChannelIDs;
}

- (void)setAccountChannelIDs:(id)a3
{
}

- (NSArray)subscriptionsToAdd
{
  return self->_subscriptionsToAdd;
}

- (void)setSubscriptionsToAdd:(id)a3
{
}

- (NSArray)subscriptionsToRemoveByBundleID
{
  return self->_subscriptionsToRemoveByBundleID;
}

- (void)setSubscriptionsToRemoveByBundleID:(id)a3
{
}

- (NSArray)applicationUserAccounts
{
  return self->_applicationUserAccounts;
}

- (void)setApplicationUserAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUserAccounts, 0);
  objc_storeStrong((id *)&self->_subscriptionsToRemoveByBundleID, 0);
  objc_storeStrong((id *)&self->_subscriptionsToAdd, 0);
  objc_storeStrong((id *)&self->_accountChannelIDs, 0);
  objc_storeStrong((id *)&self->_accountAuthentication, 0);
  objc_storeStrong((id *)&self->_expectedAction, 0);
  objc_storeStrong((id *)&self->_responseString, 0);
  objc_storeStrong((id *)&self->_responseStatusCode, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
}

@end