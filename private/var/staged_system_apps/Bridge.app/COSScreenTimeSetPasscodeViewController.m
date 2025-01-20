@interface COSScreenTimeSetPasscodeViewController
- (BOOL)_errorIsUserCanceledSettingPIN:(id)a3;
- (COSScreenTimeSetPasscodeViewController)init;
- (STSMiniFlowControllerDelegate)miniFlowDelegate;
- (id)alternateButtonString;
- (id)detailString;
- (id)imageResource;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_collectThenSetScreenTimePasscodeForFamilyMember:(id)a3 withCompletionHandler:(id)a4;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSScreenTimeSetPasscodeViewController

- (COSScreenTimeSetPasscodeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSScreenTimeSetPasscodeViewController;
  v2 = [(COSScreenTimeSetPasscodeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSScreenTimeSetPasscodeViewController *)v2 setStyle:2];
  }
  return v3;
}

- (id)imageResource
{
  return @"ScreenTime";
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SCREEN_TIME_SET_PASSCODE_TITLE" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];

  return v3;
}

- (id)detailString
{
  v2 = [(COSScreenTimeSetPasscodeViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"SCREEN_TIME_SET_PASSCODE_DETAIL_%@_%@" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3);

  return v6;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SCREEN_TIME_CONTINUE" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];

  return v3;
}

- (id)alternateButtonString
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = sub_10001B118();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[COSScreenTimeSetPasscodeViewController suggestedButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v5 = [(COSScreenTimeSetPasscodeViewController *)self miniFlowDelegate];
  v6 = [v5 familyMember];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070958;
  v7[3] = &unk_100243A08;
  v7[4] = self;
  [(COSScreenTimeSetPasscodeViewController *)self _collectThenSetScreenTimePasscodeForFamilyMember:v6 withCompletionHandler:v7];
}

- (void)_collectThenSetScreenTimePasscodeForFamilyMember:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_10001B118();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 dsid];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[COSScreenTimeSetPasscodeViewController _collectThenSetScreenTimePasscodeForFamilyMember:withC"
                         "ompletionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: familyMember:%@, dsid:%{public}@", buf, 0x20u);
  }
  v9 = [v5 dsid];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v49 = @"Missing familyMember.dsid";
    v30 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v28 = +[NSError errorWithDomain:@"COSScreenTimeSetupErrorDomain" code:1 userInfo:v30];

    v20 = sub_10001B118();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100172738();
    }
    goto LABEL_22;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v11 = (void *)qword_10029B088;
  uint64_t v45 = qword_10029B088;
  if (!qword_10029B088)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000713E8;
    v51 = &unk_1002436A8;
    v52 = &v42;
    sub_1000713E8((uint64_t)buf);
    v11 = (void *)v43[3];
  }
  v12 = v11;
  _Block_object_dispose(&v42, 8);
  v20 = objc_alloc_init(v12);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v21 = (void *)qword_10029B098;
  uint64_t v45 = qword_10029B098;
  if (!qword_10029B098)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000715B0;
    v51 = &unk_1002436A8;
    v52 = &v42;
    sub_1000715B0((uint64_t)buf, v13, v14, v15, v16, v17, v18, v19, v37[0]);
    v21 = (void *)v43[3];
  }
  v22 = v21;
  _Block_object_dispose(&v42, 8);
  id v23 = [v22 alloc];
  v24 = [v5 dsid];
  id v25 = [v23 initWithDSID:v24];

  id v41 = 0;
  v26 = [v20 currentConfigurationForUser:v25 error:&v41];
  id v27 = v41;
  if (v27)
  {
    uint64_t v28 = (uint64_t)v27;
    v29 = sub_10001B118();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100172820();
    }
LABEL_21:

LABEL_22:
    v6[2](v6, v28);
    id v25 = (id)v28;
    goto LABEL_23;
  }
  id v31 = [v26 screenTimeState];
  v32 = sub_10001B118();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[COSScreenTimeSetPasscodeViewController _collectThenSetScreenTimePasscodeForFamilyMember:withC"
                         "ompletionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: currentConfiguration:%{public}@", buf, 0x16u);
  }

  if (v31 != (id)1)
  {
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    CFStringRef v47 = @"Screen Time not enabled";
    v36 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    uint64_t v28 = +[NSError errorWithDomain:@"COSScreenTimeSetupErrorDomain" code:1 userInfo:v36];

    v29 = sub_10001B118();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1001727AC();
    }
    goto LABEL_21;
  }
  v33 = sub_10001B118();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[COSScreenTimeSetPasscodeViewController _collectThenSetScreenTimePasscodeForFamilyMember:withC"
                         "ompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: collecting passcode (async)", buf, 0xCu);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000710C4;
  v37[3] = &unk_100244F08;
  id v38 = v26;
  v39 = v20;
  v40 = v6;
  v34 = v20;
  id v35 = v26;
  [v34 collectPasscodeFromUserWithCompletionHandler:v37];

LABEL_23:
}

- (BOOL)_errorIsUserCanceledSettingPIN:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"STErrorDomain"]) {
    BOOL v5 = [v3 code] == (id)48;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (STSMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (STSMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end