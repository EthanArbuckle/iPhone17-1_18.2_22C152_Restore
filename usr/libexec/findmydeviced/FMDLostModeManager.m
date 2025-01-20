@interface FMDLostModeManager
+ (id)sharedInstance;
- (BOOL)enableLocationServices;
- (BOOL)lockScreenFacetimeCapable;
- (BOOL)lostModeEnabled;
- (BOOL)turnStatusBarIconOffAfterLostMode;
- (CLAssertion)locationServicesAssertion;
- (FMDLostModeManager)init;
- (FMStateCapture)stateCapture;
- (NSString)lockScreenMessage;
- (NSString)lockScreenOwnerNumber;
- (id)initSingleton;
- (void)_loadLostModeInfo;
- (void)_storeLostModeInfo;
- (void)_updateLocationServicesState;
- (void)dealloc;
- (void)disableLostMode;
- (void)enableLostModeWithMessage:(id)a3 ownerNumber:(id)a4 facetimeCapable:(BOOL)a5 enableLocationServices:(BOOL)a6 turnOffStatusBarIconAfterLostMode:(BOOL)a7;
- (void)setEnableLocationServices:(BOOL)a3;
- (void)setLocationServicesAssertion:(id)a3;
- (void)setLockScreenFacetimeCapable:(BOOL)a3;
- (void)setLockScreenMessage:(id)a3;
- (void)setLockScreenOwnerNumber:(id)a3;
- (void)setLostModeEnabled:(BOOL)a3;
- (void)setStateCapture:(id)a3;
- (void)setTurnStatusBarIconOffAfterLostMode:(BOOL)a3;
@end

@implementation FMDLostModeManager

+ (id)sharedInstance
{
  if (qword_10031E6F0 != -1) {
    dispatch_once(&qword_10031E6F0, &stru_1002D96E0);
  }
  v2 = (void *)qword_10031E6E8;
  if (!qword_10031E6E8)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The FMDLostModeManager singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10031E6E8;
  }

  return v2;
}

- (FMDLostModeManager)init
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10023B7F0(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v7.receiver = self;
  v7.super_class = (Class)FMDLostModeManager;
  v2 = [(FMDLostModeManager *)&v7 init];
  if (v2)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10023B834(v3);
    }

    id v4 = objc_alloc_init((Class)FMStateCapture);
    [(FMDLostModeManager *)v2 setStateCapture:v4];

    v5 = [(FMDLostModeManager *)v2 stateCapture];
    [v5 setStateCaptureBlock:&stru_1002D9700];

    [(FMDLostModeManager *)v2 _loadLostModeInfo];
    [(FMDLostModeManager *)v2 _updateLocationServicesState];
    objc_storeStrong((id *)&qword_10031E6E8, v2);
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023AFC4(self, v3);
  }

  id v4 = (void *)qword_10031E6E8;
  qword_10031E6E8 = 0;

  v5.receiver = self;
  v5.super_class = (Class)FMDLostModeManager;
  [(FMDLostModeManager *)&v5 dealloc];
}

- (void)enableLostModeWithMessage:(id)a3 ownerNumber:(id)a4 facetimeCapable:(BOOL)a5 enableLocationServices:(BOOL)a6 turnOffStatusBarIconAfterLostMode:(BOOL)a7
{
  BOOL v8 = a7;
  uint64_t v9 = a6;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = [(FMDLostModeManager *)self lockScreenMessage];
  if (v15 != v13)
  {
    objc_super v7 = [(FMDLostModeManager *)self lockScreenMessage];
    if (![v13 isEqualToString:v7])
    {
      int v16 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  id v17 = [(FMDLostModeManager *)self lockScreenOwnerNumber];
  if (v17 == v14)
  {
    int v16 = 0;
  }
  else
  {
    unsigned int v33 = v9;
    BOOL v18 = v8;
    v19 = [(FMDLostModeManager *)self lockScreenOwnerNumber];
    int v20 = ([v14 isEqualToString:v19] & 1) == 0
       && [(FMDLostModeManager *)self lockScreenFacetimeCapable] == v10;

    int v16 = v20;
    BOOL v8 = v18;
    uint64_t v9 = v33;
  }

  if (v15 != v13) {
    goto LABEL_11;
  }
LABEL_12:

  [(FMDLostModeManager *)self setLostModeEnabled:1];
  [(FMDLostModeManager *)self setLockScreenMessage:v13];
  [(FMDLostModeManager *)self setLockScreenOwnerNumber:v14];
  [(FMDLostModeManager *)self setLockScreenFacetimeCapable:v10];
  [(FMDLostModeManager *)self setEnableLocationServices:v9];
  [(FMDLostModeManager *)self _updateLocationServicesState];
  if (![(FMDLostModeManager *)self turnStatusBarIconOffAfterLostMode]) {
    [(FMDLostModeManager *)self setTurnStatusBarIconOffAfterLostMode:v8];
  }
  [(FMDLostModeManager *)self _storeLostModeInfo];
  v21 = objc_opt_new();
  v22 = [v21 disableBiometricID];

  v23 = sub_100004238();
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10023B900((uint64_t)v22, v24);
    }
  }
  else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Disabled biometric ID after entering lost mode", buf, 2u);
  }

  v25 = +[FMDAppleAccountManager sharedInstance];
  v26 = [v25 iCloudACAccount];

  id v34 = 0;
  v27 = [v26 credentialWithError:&v34];
  id v28 = v34;
  v29 = v28;
  if (!v26 || v28)
  {
    v30 = sub_100004238();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10023B878((uint64_t)v26, (uint64_t)v29, v30);
    }
  }
  else
  {
    [v27 setCredentialItem:0 forKey:ACRawPasswordKey];
  }
  v31 = +[NSNotificationCenter defaultCenter];
  [v31 postNotificationName:@"com.apple.AOSNotification.LostModeInfoChanged" object:0];

  if (v16)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
  }
}

- (void)_updateLocationServicesState
{
  unsigned int v3 = [(FMDLostModeManager *)self enableLocationServices];
  id v4 = [(FMDLostModeManager *)self locationServicesAssertion];

  if (v3)
  {
    if (!v4)
    {
      objc_super v5 = sub_100004238();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accquiring emergency location services assertion", buf, 2u);
      }

      v6 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
      id v7 = +[CLEmergencyEnablementAssertion newAssertionForBundle:v6 withReason:@"LostMode"];
      [(FMDLostModeManager *)self setLocationServicesAssertion:v7];
    }
  }
  else if (v4)
  {
    BOOL v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Releasing the emergency location services assertion", v10, 2u);
    }

    uint64_t v9 = [(FMDLostModeManager *)self locationServicesAssertion];
    [v9 invalidate];

    [(FMDLostModeManager *)self setLocationServicesAssertion:0];
  }
}

- (void)_storeLostModeInfo
{
  if ([(FMDLostModeManager *)self lostModeEnabled])
  {
    v15[0] = @"lostModeEnabled";
    unsigned int v3 = +[NSNumber numberWithBool:[(FMDLostModeManager *)self lostModeEnabled]];
    v16[0] = v3;
    v15[1] = @"lostModeMessage";
    uint64_t v4 = [(FMDLostModeManager *)self lockScreenMessage];
    objc_super v5 = (void *)v4;
    if (v4) {
      CFStringRef v6 = (const __CFString *)v4;
    }
    else {
      CFStringRef v6 = &stru_1002E7428;
    }
    v16[1] = v6;
    v15[2] = @"lostModeOwnerNumber";
    uint64_t v7 = [(FMDLostModeManager *)self lockScreenOwnerNumber];
    BOOL v8 = (void *)v7;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    else {
      CFStringRef v9 = &stru_1002E7428;
    }
    v16[2] = v9;
    v15[3] = @"lostModeFacetimeCapable";
    BOOL v10 = +[NSNumber numberWithBool:[(FMDLostModeManager *)self lockScreenFacetimeCapable]];
    v16[3] = v10;
    v15[4] = off_10031C7D8;
    v11 = +[NSNumber numberWithBool:[(FMDLostModeManager *)self enableLocationServices]];
    v16[4] = v11;
    v15[5] = off_10031C7E0;
    v12 = +[NSNumber numberWithBool:[(FMDLostModeManager *)self turnStatusBarIconOffAfterLostMode]];
    v16[5] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
  }
  else
  {
    id v13 = 0;
  }
  +[FMDPreferencesMgr setLostModeInfo:v13];
  id v14 = +[FMDFMIPSharedStateManager sharedInstance];
  [v14 recalculateLostMode];
}

- (void)_loadLostModeInfo
{
  id v9 = +[FMDPreferencesMgr lostModeInfo];
  unsigned int v3 = [v9 objectForKeyedSubscript:@"lostModeEnabled"];
  -[FMDLostModeManager setLostModeEnabled:](self, "setLostModeEnabled:", [v3 BOOLValue]);

  uint64_t v4 = [v9 objectForKeyedSubscript:@"lockScreenMessage"];
  [(FMDLostModeManager *)self setLockScreenMessage:v4];

  objc_super v5 = [v9 objectForKeyedSubscript:@"lockScreenOwnerNumber"];
  [(FMDLostModeManager *)self setLockScreenOwnerNumber:v5];

  CFStringRef v6 = [v9 objectForKeyedSubscript:@"lostModeFacetimeCapable"];
  -[FMDLostModeManager setLockScreenFacetimeCapable:](self, "setLockScreenFacetimeCapable:", [v6 BOOLValue]);

  uint64_t v7 = [v9 objectForKeyedSubscript:off_10031C7D8];
  -[FMDLostModeManager setEnableLocationServices:](self, "setEnableLocationServices:", [v7 BOOLValue]);

  BOOL v8 = [v9 objectForKeyedSubscript:off_10031C7E0];
  -[FMDLostModeManager setTurnStatusBarIconOffAfterLostMode:](self, "setTurnStatusBarIconOffAfterLostMode:", [v8 BOOLValue]);
}

- (void)disableLostMode
{
  unsigned int v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lost mode is being disabled", buf, 2u);
  }

  if ([(FMDLostModeManager *)self enableLocationServices])
  {
    [(FMDLostModeManager *)self setEnableLocationServices:0];
    [(FMDLostModeManager *)self _updateLocationServicesState];
  }
  if ([(FMDLostModeManager *)self turnStatusBarIconOffAfterLostMode])
  {
    uint64_t v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Turning off status bar icon since it was off before the device entered lost mode", v6, 2u);
    }

    +[CLLocationManager setStatusBarIconEnabled:0 forLocationEntityClass:4];
    [(FMDLostModeManager *)self setTurnStatusBarIconOffAfterLostMode:0];
  }
  [(FMDLostModeManager *)self setLostModeEnabled:0];
  [(FMDLostModeManager *)self _storeLostModeInfo];
  [(FMDLostModeManager *)self _loadLostModeInfo];
  +[FMDMessage stopAllSounds];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002D9720);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
}

- (BOOL)lostModeEnabled
{
  return self->_lostModeEnabled;
}

- (void)setLostModeEnabled:(BOOL)a3
{
  self->_lostModeEnabled = a3;
}

- (NSString)lockScreenMessage
{
  return self->_lockScreenMessage;
}

- (void)setLockScreenMessage:(id)a3
{
}

- (NSString)lockScreenOwnerNumber
{
  return self->_lockScreenOwnerNumber;
}

- (void)setLockScreenOwnerNumber:(id)a3
{
}

- (BOOL)lockScreenFacetimeCapable
{
  return self->_lockScreenFacetimeCapable;
}

- (void)setLockScreenFacetimeCapable:(BOOL)a3
{
  self->_lockScreenFacetimeCapable = a3;
}

- (BOOL)enableLocationServices
{
  return self->_enableLocationServices;
}

- (void)setEnableLocationServices:(BOOL)a3
{
  self->_enableLocationServices = a3;
}

- (BOOL)turnStatusBarIconOffAfterLostMode
{
  return self->_turnStatusBarIconOffAfterLostMode;
}

- (void)setTurnStatusBarIconOffAfterLostMode:(BOOL)a3
{
  self->_turnStatusBarIconOffAfterLostMode = a3;
}

- (CLAssertion)locationServicesAssertion
{
  return self->_locationServicesAssertion;
}

- (void)setLocationServicesAssertion:(id)a3
{
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_locationServicesAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenOwnerNumber, 0);

  objc_storeStrong((id *)&self->_lockScreenMessage, 0);
}

@end