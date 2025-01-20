@interface PNDUserNotificationView
+ (void)beginPromptForChangePasscode;
+ (void)showCFUserNotifcationWithSecureTextFieldOptionForState:(int64_t)a3;
+ (void)showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:(id)a3 message:(id)a4;
+ (void)showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:(id)a3 message:(id)a4;
+ (void)showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:(id)a3 message:(id)a4;
@end

@implementation PNDUserNotificationView

+ (void)showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  v10 = MCLocalizedFormat();
  v11 = MCLocalizedFormat();
  +[MCUserNotificationManager sharedManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003A08;
  v17[3] = &unk_100008288;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = a1;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v18;
  [v16 cancelNotificationsWithIdentifier:@"passcodenagd-user-notification-id" completionBlock:v17];
}

+ (void)showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  v10 = MCLocalizedFormat();
  v11 = MCLocalizedFormat();
  +[MCUserNotificationManager sharedManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003D14;
  v17[3] = &unk_100008288;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = a1;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v18;
  [v16 cancelNotificationsWithIdentifier:@"passcodenagd-user-notification-id" completionBlock:v17];
}

+ (void)showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  v10 = MCLocalizedFormat();
  +[MCUserNotificationManager sharedManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003FF8;
  v15[3] = &unk_1000082B0;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = a1;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v16;
  [v14 cancelNotificationsWithIdentifier:@"passcodenagd-user-notification-id" completionBlock:v15];
}

+ (void)beginPromptForChangePasscode
{
  id v7 = +[MCProfileConnection sharedConnection];
  v3 = (void *)qword_10000C360;
  qword_10000C360 = 0;

  v4 = (void *)qword_10000C368;
  qword_10000C368 = 0;

  v5 = (void *)qword_10000C370;
  qword_10000C370 = 0;

  id v6 = (void *)qword_10000C378;
  qword_10000C378 = 0;

  qword_10000C380 = [v7 isPasscodeSet] ^ 1;
  [a1 showCFUserNotifcationWithSecureTextFieldOptionForState:];
}

+ (void)showCFUserNotifcationWithSecureTextFieldOptionForState:(int64_t)a3
{
  v5 = +[MCProfileConnection sharedConnection];
  switch(a3)
  {
    case 2:
      id v6 = MCLocalizedFormat();
      id v8 = 0;
LABEL_11:
      id v9 = MCLocalizedFormat();
      goto LABEL_12;
    case 1:
      id v6 = MCLocalizedFormat();
      if (qword_10000C360)
      {
        id v7 = (id)qword_10000C360;
      }
      else
      {
        id v7 = [v5 localizedDescriptionOfCurrentPasscodeConstraints];
      }
      goto LABEL_10;
    case 0:
      id v6 = MCLocalizedFormat();
      MCLocalizedFormat();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      id v8 = v7;
      goto LABEL_11;
  }
  id v9 = 0;
  id v8 = 0;
  id v6 = 0;
LABEL_12:
  v10 = MCLocalizedFormat();
  id v11 = MCLocalizedFormat();
  +[MCUserNotificationManager sharedManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100004454;
  v19[3] = &unk_100008328;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v6;
  id v22 = v8;
  id v23 = v9;
  id v24 = v11;
  id v25 = v10;
  id v26 = v5;
  int64_t v27 = a3;
  id v28 = a1;
  id v12 = v5;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  id v17 = v6;
  id v18 = v20;
  [v18 cancelNotificationsWithIdentifier:@"passcodenagd-user-notification-id" completionBlock:v19];
}

@end