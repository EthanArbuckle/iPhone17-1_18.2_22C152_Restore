@interface SMActivityManager
+ (BOOL)hasActivity;
+ (id)shared;
+ (void)endActivities;
+ (void)startActivityWithState:(id)a3 localState:(id)a4;
+ (void)updateActivityWithState:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5;
@end

@implementation SMActivityManager

+ (id)shared
{
  return +[SMActivityManagerInternal shared];
}

+ (void)startActivityWithState:(id)a3 localState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SMActivityManager shared];
  [v7 startActivityWith:v6 localState:v5];
}

+ (void)updateActivityWithState:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SMActivityManager shared];
  [v9 updateActivityWith:v8 localState:v7 shouldNotify:v5];
}

+ (void)endActivities
{
  id v2 = +[SMActivityManager shared];
  [v2 endActivities];
}

+ (BOOL)hasActivity
{
  id v2 = +[SMActivityManager shared];
  char v3 = [v2 hasActivity];

  return v3;
}

@end