@interface PDNotificationServiceGetUpdatesResult
- (NSArray)balances;
- (NSArray)notifications;
- (NSArray)plans;
- (NSArray)tileConfigurations;
- (NSString)appLaunchToken;
- (NSString)authenticationToken;
- (NSString)lastUpdatedTag;
- (void)setAppLaunchToken:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setBalances:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setPlans:(id)a3;
- (void)setTileConfigurations:(id)a3;
@end

@implementation PDNotificationServiceGetUpdatesResult

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSArray)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
}

- (NSArray)tileConfigurations
{
  return self->_tileConfigurations;
}

- (void)setTileConfigurations:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)appLaunchToken
{
  return self->_appLaunchToken;
}

- (void)setAppLaunchToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchToken, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_tileConfigurations, 0);
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
}

@end