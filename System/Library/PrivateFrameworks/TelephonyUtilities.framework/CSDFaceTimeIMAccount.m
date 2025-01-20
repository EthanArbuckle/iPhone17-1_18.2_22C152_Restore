@interface CSDFaceTimeIMAccount
+ (CSDFaceTimeIMAccount)sharedInstance;
- (BOOL)isIMDaemonConnected;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDFaceTimeIMAccount)init;
- (CSDKeychainPasswordItem)keychainItem;
- (NSString)callerID;
- (OS_dispatch_queue)queue;
- (id)faceTimeIMAccount;
- (void)_initializeLastKnownCallerID;
- (void)_saveLastKnownFaceTimeCallerID;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)displayNameChanged:(id)a3;
- (void)imDaemonDidConnect:(id)a3;
- (void)preferredAccountChanged:(id)a3;
- (void)removeCallerIDFromPreferences;
- (void)setCallerID:(id)a3;
- (void)setIMDaemonConnected:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)updateCallerID:(id)a3;
- (void)updateState;
@end

@implementation CSDFaceTimeIMAccount

+ (CSDFaceTimeIMAccount)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B3520;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C580 != -1) {
    dispatch_once(&qword_10058C580, block);
  }
  v2 = (void *)qword_10058C578;

  return (CSDFaceTimeIMAccount *)v2;
}

- (CSDFaceTimeIMAccount)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSDFaceTimeIMAccount;
  v2 = [(CSDFaceTimeIMAccount *)&v12 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.telephonyutilities.callservicesd.facetimeimaccount"];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"imDaemonDidConnect:" name:IMDaemonDidConnectNotification object:0];

    v7 = +[IMDaemonController sharedInstance];
    [v7 connectToDaemon];

    v8 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B3698;
    block[3] = &unk_100504EC0;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (NSString)callerID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1001B3958;
  v11 = sub_1001B3968;
  id v12 = 0;
  id v3 = [(CSDFaceTimeIMAccount *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B3970;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)updateCallerID:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001B3A1C;
  v4[3] = &unk_100504F10;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)imDaemonDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received IMDaemon connected notification: %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CSDFaceTimeIMAccount *)self setIMDaemonConnected:1];
  [(CSDFaceTimeIMAccount *)self updateState];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"preferredAccountChanged:" name:IMPreferredAccountForServiceChangedNotification object:0];

  IMRegisterForPreferredAccountChangeNotifications();
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"displayNameChanged:" name:IMAccountDisplayNameChangedNotification object:0];
}

- (void)preferredAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received preferred account changed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDFaceTimeIMAccount *)self updateState];
}

- (void)displayNameChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received display name changed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDFaceTimeIMAccount *)self updateState];
}

- (void)_initializeLastKnownCallerID
{
  id v3 = [(CSDFaceTimeIMAccount *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDFaceTimeIMAccount *)self keychainItem];
  id v16 = 0;
  id v5 = [v4 readPasswordAndReturnError:&v16];
  id v6 = v16;

  id v7 = [v5 length];
  int v8 = sub_100008DCC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loaded last known FaceTime caller ID as %@", buf, 0xCu);
    }

    v10 = v5;
LABEL_13:
    id v12 = v10;
    callerID = self->_callerID;
    self->_callerID = v10;
    goto LABEL_14;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find lastKnownFaceTimeCallerID in keychain, error: %@", buf, 0xCu);
  }

  v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Querying Preferences to see if it exists", buf, 2u);
  }

  id v12 = (void *)CFPreferencesCopyAppValue(@"lastKnownFaceTimeCallerID", TUBundleIdentifierTelephonyUtilitiesFramework);
  id v13 = [v12 length];
  callerID = sub_100008DCC();
  BOOL v15 = os_log_type_enabled(callerID, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, callerID, OS_LOG_TYPE_DEFAULT, "Found lastKnownFaceTimeCallerID: %@ in Preferences", buf, 0xCu);
    }

    v10 = v12;
    goto LABEL_13;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, callerID, OS_LOG_TYPE_DEFAULT, "[WARN] lastKnownFaceTimeCallerID not found in Preferences either", buf, 2u);
  }
LABEL_14:

  if ([(NSString *)self->_callerID length])
  {
    [(CSDFaceTimeIMAccount *)self _saveLastKnownFaceTimeCallerID];
    [(CSDFaceTimeIMAccount *)self removeCallerIDFromPreferences];
  }
}

- (void)removeCallerIDFromPreferences
{
  CFStringRef v2 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  id v3 = (void *)CFPreferencesCopyAppValue(@"lastKnownFaceTimeCallerID", TUBundleIdentifierTelephonyUtilitiesFramework);
  if (v3)
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing callerID Preferences value", v5, 2u);
    }

    CFPreferencesSetAppValue(@"lastKnownFaceTimeCallerID", 0, v2);
    CFPreferencesAppSynchronize(v2);
  }
}

- (void)_saveLastKnownFaceTimeCallerID
{
  id v3 = [(CSDFaceTimeIMAccount *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    callerID = self->_callerID;
    *(_DWORD *)buf = 138412290;
    id v12 = callerID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving last known FaceTime caller ID as %@", buf, 0xCu);
  }

  id v6 = [(CSDFaceTimeIMAccount *)self keychainItem];
  id v7 = self->_callerID;
  id v10 = 0;
  [v6 savePassword:v7 error:&v10];
  id v8 = v10;

  if (v8)
  {
    BOOL v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003B0A00((uint64_t)v8, v9);
    }
  }
}

- (id)faceTimeIMAccount
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  CFStringRef v2 = +[IMService facetimeService];
  id v3 = IMPreferredAccountForService();

  return v3;
}

- (void)updateState
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(CSDFaceTimeIMAccount *)self isIMDaemonConnected])
  {
    id v3 = [(CSDFaceTimeIMAccount *)self faceTimeIMAccount];
    id v4 = [v3 displayName];

    id v5 = [(CSDFaceTimeIMAccount *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B4444;
    block[3] = &unk_100504F10;
    void block[4] = self;
    id v9 = v4;
    id v6 = v4;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deferring FaceTime caller ID refresh until connected to IMDaemon", v7, 2u);
    }
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ account %@ aliases changed %@", buf, 0x20u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B46DC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setCallerID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isIMDaemonConnected
{
  return self->_IMDaemonConnected;
}

- (void)setIMDaemonConnected:(BOOL)a3
{
  self->_IMDaemonConnected = a3;
}

- (CSDKeychainPasswordItem)keychainItem
{
  return self->_keychainItem;
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateObserver, 0);
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_callerID, 0);
}

@end