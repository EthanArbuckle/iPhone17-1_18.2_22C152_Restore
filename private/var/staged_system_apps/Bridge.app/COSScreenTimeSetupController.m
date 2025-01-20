@interface COSScreenTimeSetupController
+ (BOOL)_screenTimeEnabledWithoutPasscodeForFamilyMember:(id)a3;
+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3;
- (COSScreenTimeSetPasscodeViewController)firstController;
- (COSScreenTimeSetupController)init;
- (id)familyMember;
- (id)familyMemberFirstName;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
- (void)setFirstController:(id)a3;
@end

@implementation COSScreenTimeSetupController

- (COSScreenTimeSetupController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSScreenTimeSetupController;
  v2 = [(COSScreenTimeSetupController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(COSScreenTimeSetPasscodeViewController);
    firstController = v2->_firstController;
    v2->_firstController = v3;

    [(COSScreenTimeSetPasscodeViewController *)v2->_firstController setMiniFlowDelegate:v2];
  }
  return v2;
}

- (id)viewController
{
  return self->_firstController;
}

- (void)miniFlowStepComplete:(id)a3
{
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  if (a4)
  {
    id v5 = objc_alloc_init(a4);
    [v5 setMiniFlowDelegate:self];
    [(COSScreenTimeSetupController *)self pushController:v5 animated:1];
  }
  else
  {
    id v5 = [(COSScreenTimeSetupController *)self delegate];
    [v5 buddyControllerDone:self];
  }
}

- (id)familyMember
{
  v2 = [(COSScreenTimeSetupController *)self delegate];
  v3 = [v2 setupFlowUserInfo];
  v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  return v4;
}

- (id)familyMemberFirstName
{
  v2 = [(COSScreenTimeSetupController *)self familyMember];
  v3 = [v2 firstName];

  return v3;
}

+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3
{
  id v3 = a3;
  v4 = [v3 setupFlowUserInfo];
  id v5 = [v4 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  if (v5)
  {
    unsigned int v6 = [(id)objc_opt_class() _screenTimeEnabledWithoutPasscodeForFamilyMember:v5];
  }
  else
  {
    v7 = sub_10001B118();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10017164C();
    }

    unsigned int v6 = 0;
  }
  v8 = sub_10001B118();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "+[COSScreenTimeSetupController controllerNeedsToRunForBuddyControllerDelegate:]";
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s => %d", (uint8_t *)&v10, 0x12u);
  }

  return v6;
}

+ (BOOL)_screenTimeEnabledWithoutPasscodeForFamilyMember:(id)a3
{
  id v3 = a3;
  v4 = sub_10001B118();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 dsid];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "+[COSScreenTimeSetupController _screenTimeEnabledWithoutPasscodeForFamilyMember:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2114;
    CFStringRef v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: familyMember:%@, dsid:%{public}@", buf, 0x20u);
  }
  unsigned int v6 = [v3 dsid];

  if (v6)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v7 = (void *)qword_10029AEB8;
    uint64_t v27 = qword_10029AEB8;
    if (!qword_10029AEB8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10001B904;
      CFStringRef v29 = (const __CFString *)&unk_1002436A8;
      v30 = &v24;
      sub_10001B904((uint64_t)buf);
      v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    unsigned int v6 = objc_opt_new();
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v9 = (void *)qword_10029AEC8;
    uint64_t v27 = qword_10029AEC8;
    if (!qword_10029AEC8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10001BACC;
      CFStringRef v29 = (const __CFString *)&unk_1002436A8;
      v30 = &v24;
      sub_10001BACC((uint64_t)buf);
      v9 = (void *)v25[3];
    }
    int v10 = v9;
    _Block_object_dispose(&v24, 8);
    id v11 = [v10 alloc];
    __int16 v12 = [v3 dsid];
    id v13 = [v11 initWithDSID:v12];

    id v23 = 0;
    v14 = [v6 currentConfigurationForUser:v13 error:&v23];
    id v15 = v23;
    if (v15)
    {
      v16 = sub_10001B118();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001716CC();
      }
      BOOL v17 = 0;
    }
    else
    {
      if ([v14 screenTimeState] == (id)1)
      {
        v18 = [v14 passcode];
        BOOL v17 = v18 == 0;
      }
      else
      {
        BOOL v17 = 0;
      }
      v16 = sub_10001B118();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [v14 screenTimeState];
        v20 = [v14 passcode];
        CFStringRef v21 = @"YES";
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "+[COSScreenTimeSetupController _screenTimeEnabledWithoutPasscodeForFamilyMember:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v19;
        if (!v20) {
          CFStringRef v21 = @"NO";
        }
        *(_WORD *)&buf[22] = 2112;
        CFStringRef v29 = v21;
        LOWORD(v30) = 1024;
        *(_DWORD *)((char *)&v30 + 2) = v17;
        HIWORD(v30) = 2114;
        v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: screenTimeState:%zd hasPasscode:%@ => enabledWithoutPasscode:%d; currentConfiguration:%{public}@",
          buf,
          0x30u);
      }
    }

    LOBYTE(v6) = v17;
  }

  return (char)v6;
}

- (COSScreenTimeSetPasscodeViewController)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end