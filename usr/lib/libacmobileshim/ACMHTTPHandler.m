@interface ACMHTTPHandler
- (id)components;
- (id)environmentPreferences;
- (id)iForgotURL;
- (id)serverAttemptsDelays;
- (id)serverHosts;
@end

@implementation ACMHTTPHandler

- (id)components
{
  return +[ACMAppleConnectImplComponents components];
}

- (id)environmentPreferences
{
  v3 = [[-[ACMHTTPHandler components](self, "components") preferences];
  uint64_t v4 = [[-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context")) realm];

  return (id)[v3 environmentPreferencesWithRealm:v4];
}

- (id)iForgotURL
{
  id v2 = [(ACMHTTPHandler *)self environmentPreferences];

  return (id)[v2 iForgotURL];
}

- (id)serverHosts
{
  id v2 = [(ACMHTTPHandler *)self environmentPreferences];

  return (id)[v2 serverHosts];
}

- (id)serverAttemptsDelays
{
  id v2 = [(ACMHTTPHandler *)self environmentPreferences];

  return (id)[v2 serverAttemptsDelays];
}

@end