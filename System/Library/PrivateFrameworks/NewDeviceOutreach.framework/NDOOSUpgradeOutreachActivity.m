@interface NDOOSUpgradeOutreachActivity
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)uuid;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation NDOOSUpgradeOutreachActivity

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.osupgrade";
}

- (NSString)uuid
{
  return 0;
}

- (BOOL)requiresNetwork
{
  return 1;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446210;
    v12 = "-[NDOOSUpgradeOutreachActivity performActivityForScheduler:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: for upgrade outreach", (uint8_t *)&v11, 0xCu);
  }

  v10 = [(NDOOSUpgradeOutreachActivity *)self identifier];
  [v8 performOutreachActivityForActivityID:v10 withScheduler:v7 andCompletion:v6];
}

@end