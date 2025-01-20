@interface CHMoveModeNotificationResponseCoordinator
+ (BOOL)shouldHandleNotificationCategoryIdentifier:(id)a3;
+ (void)handleNotificationResponse:(id)a3 presentingNavigationController:(id)a4 healthStore:(id)a5 formattingManager:(id)a6;
@end

@implementation CHMoveModeNotificationResponseCoordinator

+ (BOOL)shouldHandleNotificationCategoryIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[FCNotificationRequestConstants moveModeNotificationCategory];
  if ([v3 isEqualToString:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v6 = +[FCNotificationRequestConstants moveModeChangeModeNotificationCategory];
    if ([v3 isEqualToString:v6])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      v7 = +[FCNotificationRequestConstants moveModeChangeGoalsNotificationCategory];
      unsigned __int8 v5 = [v3 isEqualToString:v7];
    }
  }

  return v5;
}

+ (void)handleNotificationResponse:(id)a3 presentingNavigationController:(id)a4 healthStore:(id)a5 formattingManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100178968;
  v15[3] = &unk_1008AD8E8;
  id v16 = v9;
  id v17 = a5;
  id v18 = a6;
  id v19 = v10;
  id v11 = v10;
  id v12 = v18;
  id v13 = v17;
  id v14 = v9;
  [v11 dismissViewControllerAnimated:0 completion:v15];
}

@end