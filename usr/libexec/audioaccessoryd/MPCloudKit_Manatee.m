@interface MPCloudKit_Manatee
+ (id)sharedInstance;
- (BOOL)initializedCKAfterFirstUnlockedSinceBoot;
- (BOOL)isAccountActive;
- (BOOL)isFetchInProgress;
- (BOOL)isFetchMasterKeyInProgress;
- (BOOL)isWriteMasterKeysInProgress;
- (BOOL)manateeZoneUpgraded;
- (BOOL)reinitAfterBuddy;
- (BOOL)shouldPauseFetch;
- (BTStateWatcher)buddyStateWatcher;
- (CKContainer)cloudKitContainer;
- (CKDatabase)cloudKitDatabase;
- (CKRecordZone)recordZoneAccessoryDatabase;
- (CKRecordZone)recordZoneBlob;
- (CKSubscription)cloudSubscription;
- (MPCloudKit_Manatee)init;
- (MPCloudKit_Manatee)initWithRecordZoneName;
- (NSError)pauseErrorReason;
- (NSMutableData)masterBlob;
- (NSOperationQueue)modifyOperationQueue;
- (NSString)cloudContainerIdentifier;
- (NSString)description;
- (NSTimer)countdownTimer;
- (NSTimer)modifyOperationTimer;
- (NSTimer)pushTimer;
- (OS_dispatch_queue)pushDelegateQueue;
- (OS_dispatch_queue)pushQueue;
- (id)apsEnvironmentString;
- (id)readUserPreference:(id)a3;
- (void)_fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)_fetchKeyBlob:(unint64_t)a3;
- (void)_pushTimerFired:(id)a3;
- (void)_updateMasterZoneBlob:(id)a3 accessoryblob:(id)a4;
- (void)accountStatusDidChange:(id)a3;
- (void)buddySetupDone;
- (void)checkAccountStatusWithCompletionHandler:(id)a3;
- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4;
- (void)createSubscritionForRecordType:(id)a3;
- (void)dealloc;
- (void)deleteCloudKitAccessoryZone;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)fetchAccountStatusWithCompletion:(id)a3;
- (void)fetchKeyBlob:(unint64_t)a3;
- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4;
- (void)forceAccountStatus;
- (void)getAccountStatus;
- (void)handleAccessoryModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)initializeCloudKit;
- (void)manateeZoneAvailable;
- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)pushDisable;
- (void)pushEnable;
- (void)removeSubscritionForRecordType:(id)a3;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetAccessoryZone:(id)a3;
- (void)resetCloudContainerManateeIdentityLost;
- (void)resetMasterZone:(id)a3 accessoryblob:(id)a4;
- (void)resetPushTimer;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCloudKitContainer:(id)a3;
- (void)setCloudKitDatabase:(id)a3;
- (void)setCloudSubscription:(id)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setIsAccountActive:(BOOL)a3;
- (void)setIsFetchInProgress:(BOOL)a3;
- (void)setIsFetchMasterKeyInProgress:(BOOL)a3;
- (void)setIsWriteMasterKeysInProgress:(BOOL)a3;
- (void)setMasterBlob:(id)a3;
- (void)setModifyOperationQueue:(id)a3;
- (void)setModifyOperationTimer:(id)a3;
- (void)setPauseErrorReason:(id)a3;
- (void)setPushQueue:(id)a3;
- (void)setPushTimer:(id)a3;
- (void)setRecordZoneAccessoryDatabase:(id)a3;
- (void)setRecordZoneBlob:(id)a3;
- (void)setReinitAfterBuddy:(BOOL)a3;
- (void)setShouldPauseFetch:(BOOL)a3;
- (void)setupSubscriptions;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4;
- (void)updateCloudKitBlobZone:(id)a3;
- (void)upgradeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)verifyAndCacheSubscriptionID:(id)a3;
- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
@end

@implementation MPCloudKit_Manatee

+ (id)sharedInstance
{
  if (qword_100263F20 != -1) {
    dispatch_once(&qword_100263F20, &stru_100235630);
  }
  v2 = (void *)qword_100263F18;

  return v2;
}

- (MPCloudKit_Manatee)init
{
  return [(MPCloudKit_Manatee *)self initWithRecordZoneName];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCloudKit_Manatee;
  [(MPCloudKit_Manatee *)&v4 dealloc];
}

- (NSString)description
{
  v2 = [(MPCloudKit_Manatee *)self cloudContainerIdentifier];
  v3 = +[NSString stringWithFormat:@"MPCloudKit_Manatee: Container - %@", v2];

  return (NSString *)v3;
}

- (MPCloudKit_Manatee)initWithRecordZoneName
{
  v17.receiver = self;
  v17.super_class = (Class)MPCloudKit_Manatee;
  v2 = [(MPCloudKit_Manatee *)&v17 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  countdownTimer = v2->_countdownTimer;
  if (countdownTimer)
  {
    [(NSTimer *)countdownTimer invalidate];
    v5 = v3->_countdownTimer;
    v3->_countdownTimer = 0;
  }
  v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  modifyOperationQueue = v3->_modifyOperationQueue;
  v3->_modifyOperationQueue = v6;

  [(NSOperationQueue *)v3->_modifyOperationQueue setMaxConcurrentOperationCount:1];
  unsigned int v8 = +[BTSystemConfiguration isBuddyComplete];
  v9 = sub_10006CA04("MagicPairing");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
    }

    v11 = +[CloudXPCService sharedInstance];
    [v11 beginTransaction:@"com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"];

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100089450;
    v14[3] = &unk_100234688;
    objc_copyWeak(&v15, buf);
    v12 = +[BTStateWatcher monitorBuddyStateWithAction:v14];
    [(MPCloudKit_Manatee *)v3 setBuddyStateWatcher:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }
  if (v10)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (![(MPCloudKit_Manatee *)v3 initializedCKAfterFirstUnlockedSinceBoot]) {
LABEL_12:
  }
    [(MPCloudKit_Manatee *)v3 initializedCKAfterFirstUnlockedSinceBoot];
  return v3;
}

- (BOOL)initializedCKAfterFirstUnlockedSinceBoot
{
  int v3 = MKBDeviceUnlockedSinceBoot();
  objc_super v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"YES";
    if (!v3) {
      CFStringRef v5 = @"NO";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Unlocked since boot = %{public}@", buf, 0xCu);
  }

  if (v3 == 1)
  {
    v6 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: device is already unlocked after boot ", buf, 2u);
    }

    [(MPCloudKit_Manatee *)self initializeCloudKit];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000896CC;
    block[3] = &unk_100232710;
    block[4] = self;
    if (qword_100263F28 != -1) {
      dispatch_once(&qword_100263F28, block);
    }
  }
  return v3 == 1;
}

- (void)getAccountStatus
{
}

- (void)forceAccountStatus
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: Forcing account update to bluetoothd", v5, 2u);
  }

  objc_super v4 = [(MPCloudKit_Manatee *)self cloudKitContainer];
  [v4 accountStatusWithCompletionHandler:&stru_100235650];
}

- (void)buddySetupDone
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: buddySetupDone : reset timer now ", buf, 2u);
  }

  if (self->_reinitAfterBuddy)
  {
    [(MPCloudKit_Manatee *)self initializeCloudKit];
  }
  else
  {
    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

    CFStringRef v5 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: buddySetupDone : re-intt cloud kit not needed", v7, 2u);
    }
  }
  self->_reinitAfterBuddy = 0;
  v6 = +[CloudXPCService sharedInstance];
  [v6 endTransaction:@"com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"];
}

- (void)initializeCloudKit
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: initializeCloudKit : start ", v15, 2u);
  }

  objc_super v4 = +[CKContainer containerWithIdentifier:@"com.apple.securedBluetooth"];
  cloudKitContainer = self->_cloudKitContainer;
  self->_cloudKitContainer = v4;

  v6 = [(CKContainer *)self->_cloudKitContainer privateCloudDatabase];
  cloudKitDatabase = self->_cloudKitDatabase;
  self->_cloudKitDatabase = v6;

  unsigned int v8 = (CKRecordZone *)[objc_alloc((Class)CKRecordZone) initWithZoneName:@"MagicCloudPairingCustomKeyBlobZone"];
  recordZoneBlob = self->_recordZoneBlob;
  self->_recordZoneBlob = v8;

  CFStringRef v10 = (CKRecordZone *)[objc_alloc((Class)CKRecordZone) initWithZoneName:@"MagicCloudPairingCustomAccessoryZone"];
  recordZoneAccessoryDatabase = self->_recordZoneAccessoryDatabase;
  self->_recordZoneAccessoryDatabase = v10;

  self->_isWriteMasterKeysInProgress = 0;
  [(MPCloudKit_Manatee *)self pushEnable];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

  [(MPCloudKit_Manatee *)self accountStatusDidChange:0];
  v13 = [(MPCloudKit_Manatee *)self pushTimer];

  if (v13)
  {
    v14 = [(MPCloudKit_Manatee *)self pushTimer];
    [v14 invalidate];

    [(MPCloudKit_Manatee *)self setPushTimer:0];
  }
}

- (void)fetchAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MPCloudKit_Manatee *)self cloudKitContainer];

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100089DE8;
    v9[3] = &unk_100234C60;
    id v10 = v4;
    [(CKContainer *)cloudKitContainer accountInfoWithCompletionHandler:v9];
    v7 = v10;
LABEL_7:

    goto LABEL_8;
  }
  unsigned int v8 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil", buf, 2u);
  }

  if (v4)
  {
    v7 = +[NSError errorWithDomain:@"CloudKit Account Not Active" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)manateeZoneAvailable
{
  int v3 = +[CloudXPCService sharedInstance];
  id v4 = [v3 networkMonitor];
  unsigned __int8 v5 = [v4 isNetworkUp];

  if ((v5 & 1) == 0)
  {
    v7 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    __int16 v12 = 0;
    unsigned int v8 = "Manatee Upgrade Check: Network is not up";
    v9 = (uint8_t *)&v12;
    goto LABEL_5;
  }
  v6 = [(MPCloudKit_Manatee *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

  if (v6)
  {
    v7 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    __int16 v11 = 0;
    unsigned int v8 = "Manatee Upgrade Check: Master zone has been already upgraded successfully";
    v9 = (uint8_t *)&v11;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_6;
  }
  cloudKitContainer = self->_cloudKitContainer;

  [(CKContainer *)cloudKitContainer accountInfoWithCompletionHandler:&stru_100235690];
}

- (id)readUserPreference:(id)a3
{
  int v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  return v3;
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = (__CFString *)a3;
  id v8 = a4;
  v9 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] prefName %@\n", (uint8_t *)&v11, 0xCu);
  }

  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    id v10 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  CFPreferencesSetValue((CFStringRef)a3, 0, @"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    BOOL v5 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v6, 2u);
    }
  }
}

- (void)accountStatusDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee accountStatusDidChange calling accountStatusWithCompletionHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = [(MPCloudKit_Manatee *)self cloudKitContainer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008A470;
  v7[3] = &unk_1002356D8;
  objc_copyWeak(&v8, buf);
  v7[4] = self;
  [v6 accountStatusWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)setupSubscriptions
{
  [(MPCloudKit_Manatee *)self createSubscritionForRecordType:@"EncryptedMasterKeyBlob"];

  [(MPCloudKit_Manatee *)self createSubscritionForRecordType:@"EncryptedAccessoryBlob"];
}

- (void)resetPushTimer
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MPCloudKit_Manatee *)self pushTimer];
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: resetPushTimer called %@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v5 = [(MPCloudKit_Manatee *)self pushTimer];

  if (v5)
  {
    v6 = [(MPCloudKit_Manatee *)self pushTimer];
    [v6 invalidate];

    [(MPCloudKit_Manatee *)self setPushTimer:0];
  }
  v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_pushTimerFired:" selector:0 userInfo:0 repeats:5.0];
  [(MPCloudKit_Manatee *)self setPushTimer:v7];
}

- (void)_pushTimerFired:(id)a3
{
  id v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Push Fetch", buf, 2u);
  }

  BOOL v5 = [(MPCloudKit_Manatee *)self pushTimer];

  if (v5)
  {
    v6 = [(MPCloudKit_Manatee *)self pushTimer];
    [v6 invalidate];

    [(MPCloudKit_Manatee *)self setPushTimer:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008ABD4;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)fetchKeyBlob:(unint64_t)a3
{
  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008AC98;
  v4[3] = &unk_100235700;
  v4[4] = self;
  v4[5] = a3;
  [(CKContainer *)cloudKitContainer accountInfoWithCompletionHandler:v4];
}

- (void)_fetchKeyBlob:(unint64_t)a3
{
  BOOL v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: fetchKeyBlob: retry count -  %lu", buf, 0xCu);
  }

  if (a3 >= 5)
  {
    v6 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = a3;
      v7 = "Manatee: Exhausted all retries...: %lu";
      int v8 = v6;
      uint32_t v9 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ([(MPCloudKit_Manatee *)self isWriteMasterKeysInProgress])
  {
    v6 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v7 = "Manatee: already writing new key";
LABEL_9:
    int v8 = v6;
    uint32_t v9 = 2;
    goto LABEL_10;
  }
  id v10 = [(MPCloudKit_Manatee *)self masterBlob];
  BOOL v11 = [v10 length] == (id)33;

  if (v11)
  {
    __int16 v12 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(MPCloudKit_Manatee *)self masterBlob];
      *(_DWORD *)buf = 138412290;
      unint64_t v30 = (unint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Manatee: fetchKeyBlob: already have master blob read  %@", buf, 0xCu);
    }
    v6 = +[CloudXPCService sharedInstance];
    v14 = [(MPCloudKit_Manatee *)self masterBlob];
    id v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v14, @"kMasterKeyBlob", 0];
    [v6 sendCloudKitMsg:@"MasterKeysAvailable" args:v15];

    goto LABEL_15;
  }
  v16 = [(MPCloudKit_Manatee *)self recordZoneBlob];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    v6 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v7 = "Manatee recordZoneBlob is nil";
    goto LABEL_9;
  }
  v18 = +[CloudXPCService sharedInstance];
  v19 = [v18 deviceManager];
  v20 = [v19 cloudAccountInfo];
  unsigned __int8 v21 = [v20 manateeAvailable];

  if ((v21 & 1) == 0)
  {
    v6 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001B89A4();
    }
    goto LABEL_15;
  }
  if (![(MPCloudKit_Manatee *)self isFetchMasterKeyInProgress])
  {
    [(MPCloudKit_Manatee *)self setIsFetchMasterKeyInProgress:1];
    id v22 = objc_alloc((Class)CKRecordID);
    v23 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    v24 = [v23 zoneID];
    v6 = [v22 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v24];

    v25 = +[CloudXPCService sharedInstance];
    [v25 beginTransaction:@"ManateefetchKeyBlob"];

    objc_initWeak((id *)buf, self);
    v26 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10008B2D8;
    v27[3] = &unk_100235748;
    v27[4] = self;
    v28[1] = (id)a3;
    objc_copyWeak(v28, (id *)buf);
    [v26 fetchRecordWithID:v6 completionHandler:v27];

    objc_destroyWeak(v28);
    objc_destroyWeak((id *)buf);
    goto LABEL_15;
  }
  v6 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Manatee fetchKeyBlob already fetching defer";
    goto LABEL_9;
  }
LABEL_15:
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = sub_10006CA04("MagicPairing");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a4 <= 4)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: checkAccountStatus: %lu", buf, 0xCu);
    }

    uint32_t v9 = +[CloudXPCService sharedInstance];
    [v9 beginTransaction:@"ManateeCheckAccountStatusWithCompletionHandler"];

    objc_initWeak((id *)buf, self);
    id v10 = [(MPCloudKit_Manatee *)self cloudKitContainer];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008C068;
    v11[3] = &unk_100235770;
    objc_copyWeak(v13, (id *)buf);
    id v12 = v6;
    v13[1] = (id)a4;
    [v10 accountStatusWithCompletionHandler:v11];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: Exhausted all retries for: %lu", buf, 0xCu);
    }
  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008C314;
  v4[3] = &unk_100235700;
  v4[4] = self;
  v4[5] = a3;
  [(CKContainer *)cloudKitContainer accountInfoWithCompletionHandler:v4];
}

- (void)_fetchAccessoryKeyBlob:(unint64_t)a3
{
  BOOL v5 = +[CloudXPCService sharedInstance];
  id v6 = [v5 deviceManager];
  v7 = [v6 cloudAccountInfo];
  unsigned __int8 v8 = [v7 manateeAvailable];

  if (v8)
  {
    uint32_t v9 = sub_10006CA04("MagicPairing");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (a3 <= 4)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        v25 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee: fetchAccessoryKeyBlob: %lu", buf, 0xCu);
      }

      if ([(MPCloudKit_Manatee *)self isFetchInProgress])
      {
        uint32_t v9 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v14 = [(MPCloudKit_Manatee *)self isFetchInProgress];
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = v14;
          BOOL v11 = "Manatee: fetchAccessoryKeyBlob already in-progress: %i";
          id v12 = v9;
          uint32_t v13 = 8;
          goto LABEL_16;
        }
      }
      else
      {
        unint64_t v15 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          uint32_t v9 = sub_10006CA04("MagicPairing");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            BOOL v11 = "Manatee: recordZoneAccessoryDatabase is nil";
            id v12 = v9;
            uint32_t v13 = 2;
            goto LABEL_16;
          }
        }
        else
        {
          [(MPCloudKit_Manatee *)self setIsFetchInProgress:1];
          id v17 = objc_alloc((Class)CKRecordID);
          v18 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
          v19 = [v18 zoneID];
          uint32_t v9 = [v17 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v19];

          v20 = +[CloudXPCService sharedInstance];
          [v20 beginTransaction:@"ManateeFetchAccessoryKeyBlob"];

          objc_initWeak((id *)buf, self);
          unsigned __int8 v21 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10008C828;
          v22[3] = &unk_100235748;
          v22[4] = self;
          v23[1] = (id)a3;
          objc_copyWeak(v23, (id *)buf);
          [v21 fetchRecordWithID:v9 completionHandler:v22];

          objc_destroyWeak(v23);
          objc_destroyWeak((id *)buf);
        }
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[MPCloudKit_Manatee _fetchAccessoryKeyBlob:]";
      BOOL v11 = "Manatee: Exhausted all retries...: %s";
      id v12 = v9;
      uint32_t v13 = 12;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  else
  {
    uint32_t v9 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B8A40();
    }
  }
}

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4 = a3;
  if ([(MPCloudKit_Manatee *)self manateeZoneUpgraded])
  {
    unsigned int v5 = [(MPCloudKit_Manatee *)self isWriteMasterKeysInProgress];
    id v6 = sub_10006CA04("MagicPairing");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: updateCloudKitBlobZone already in the process...", buf, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)unsigned __int8 v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: updating CloudKit Blob", v8, 2u);
      }

      [(MPCloudKit_Manatee *)self setIsWriteMasterKeysInProgress:1];
      [(MPCloudKit_Manatee *)self modifyKeyBlob:v4 withRetryCount:0];
    }
  }
}

- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: modifyKeyBlob with retry count: %lu", buf, 0xCu);
  }

  unsigned __int8 v8 = +[CloudXPCService sharedInstance];
  [v8 beginTransaction:@"ManateeModifyKeyBlob"];

  id v9 = objc_alloc((Class)CKRecordID);
  BOOL v10 = [(MPCloudKit_Manatee *)self recordZoneBlob];
  BOOL v11 = [v10 zoneID];
  id v12 = [v9 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v11];

  uint32_t v13 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008D544;
  v15[3] = &unk_100234D40;
  id v16 = v6;
  unint64_t v17 = a4;
  v15[4] = self;
  id v14 = v6;
  [v13 fetchRecordWithID:v12 completionHandler:v15];
}

- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8 || a5 > 3) {
    goto LABEL_48;
  }
  BOOL v10 = [v8 domain];
  if ([v10 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)3
      || [v8 code] == (id)7
      || [v8 code] == (id)4
      || [v8 code] == (id)9)
    {

      goto LABEL_9;
    }
    id v43 = [v8 code];

    if (v43 == (id)6)
    {
LABEL_9:
      BOOL v11 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001B8C24();
      }

      id v12 = [v8 userInfo];
      uint32_t v13 = [v12 objectForKeyedSubscript:CKErrorRetryAfterKey];

      if (v13)
      {
        id v14 = [v8 userInfo];
        unint64_t v15 = [v14 objectForKeyedSubscript:CKErrorRetryAfterKey];
        [v15 doubleValue];
        double v17 = v16;

        v18 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v54 = v8;
          __int16 v55 = 2048;
          unint64_t v56 = a5;
          __int16 v57 = 2048;
          unint64_t v58 = (unint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Manatee: Updating master key failed with error %@, retry count = %lu with time: %lu", buf, 0x20u);
        }

        dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008DEAC;
        block[3] = &unk_100233AA8;
        block[4] = self;
        id v50 = v9;
        unint64_t v51 = a5;
        dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }
  else
  {
  }
  v20 = [v8 domain];
  if ([v20 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)26)
    {

LABEL_44:
      v39 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1001B8C98();
      }

      [(MPCloudKit_Manatee *)self writeKeyBlob:v9 withRetryCount:0];
      goto LABEL_49;
    }
    id v38 = [v8 code];

    if (v38 == (id)11) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned __int8 v21 = [v8 domain];
  if ([v21 isEqualToString:CKErrorDomain])
  {
    id v22 = [v8 code];

    if (v22 == (id)112)
    {
      v23 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone.", buf, 2u);
      }

      v24 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError Reset and recreate zone DONE!", buf, 2u);
      }

      [(MPCloudKit_Manatee *)self resetCloudContainerManateeIdentityLost];
      goto LABEL_49;
    }
  }
  else
  {
  }
  v25 = [v8 domain];
  if (([v25 isEqualToString:CKErrorDomain] & 1) == 0)
  {

    goto LABEL_48;
  }
  v26 = [v8 userInfo];
  v27 = [v26 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  if (!v27)
  {
LABEL_48:
    [(MPCloudKit_Manatee *)self setIsWriteMasterKeysInProgress:0];
    goto LABEL_49;
  }
  id v44 = v9;
  v28 = [v8 userInfo];
  v29 = [v28 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [v30 objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v36 = [v35 domain];
          if ([v36 isEqualToString:CKErrorDomain])
          {
            id v37 = [v35 code];

            if (v37 == (id)112)
            {
              v40 = sub_10006CA04("MagicPairing");
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v54 = v35;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone due to - %@", buf, 0xCu);
              }

              v42 = sub_10006CA04("MagicPairing");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError. Reset and recreate zone DONE!", buf, 2u);
              }

              [(MPCloudKit_Manatee *)self resetCloudContainerManateeIdentityLost];
              goto LABEL_55;
            }
          }
          else
          {
          }
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_55:

  id v9 = v44;
LABEL_49:
}

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(MPCloudKit_Manatee *)self manateeZoneUpgraded])
  {
    BOOL v7 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MPCloudKit_Manatee *)self recordZoneBlob];
      id v9 = [v8 zoneID];
      BOOL v10 = [v9 zoneName];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@", (uint8_t *)&buf, 0xCu);
    }
    id v11 = objc_alloc((Class)CKRecordID);
    id v12 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    uint32_t v13 = [v12 zoneID];
    id v14 = [v11 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v13];

    id v15 = [objc_alloc((Class)CKRecord) initWithRecordType:@"MasterKey" recordID:v14];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000;
    long long v48 = sub_10008E3B8;
    v49 = sub_10008E3C8;
    id v50 = 0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    double v17 = [v15 encryptedValues];
    [v17 setObject:v6 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

    v18 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 138412290;
      id v43 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", v42, 0xCu);
    }

    dispatch_time_t v19 = +[CloudXPCService sharedInstance];
    [v19 beginTransaction:@"ManateeWriteKeyBlob"];

    objc_initWeak(&location, self);
    v20 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    unsigned __int8 v21 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    id v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    uint64_t v33 = sub_10008E3D0;
    v34 = &unk_100235800;
    v40[1] = (id)a4;
    p_long long buf = &buf;
    v35 = self;
    id v36 = v6;
    objc_copyWeak(v40, &location);
    id v22 = v15;
    id v37 = v22;
    v23 = v16;
    id v38 = v23;
    [v20 saveRecordZone:v21 completionHandler:&v31];

    dispatch_time_t v24 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v23, v24);
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0, v31, v32, v33, v34, v35);
    [(MPCloudKit_Manatee *)self setMasterBlob:0];
    v25 = +[CloudXPCService sharedInstance];
    [v25 endTransaction:@"ManateeWriteKeyBlob"];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v26 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(MPCloudKit_Manatee *)self recordZoneBlob];
        v28 = [v27 zoneID];
        v29 = [v28 zoneName];
        uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v42 = 138412546;
        id v43 = v29;
        __int16 v44 = 2112;
        uint64_t v45 = v30;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@ failed with error %@", v42, 0x16u);
      }
    }

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    [(MPCloudKit_Manatee *)self setIsWriteMasterKeysInProgress:0];
  }
}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6 = a3;
  if ([(MPCloudKit_Manatee *)self isAccountActive])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008EF78;
    block[3] = &unk_100234E08;
    BOOL v11 = a4;
    id v9 = v6;
    BOOL v10 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    BOOL v7 = v9;
  }
  else
  {
    BOOL v7 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001B8D00();
    }
  }
}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(MPCloudKit_Manatee *)self manateeZoneUpgraded])
  {
    BOOL v7 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v22 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, ">>> Manatee: modifyAccessoryBlob - %lu", buf, 0xCu);
    }

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = +[CloudXPCService sharedInstance];
    [v9 beginTransaction:@"ManateeModifyAccessoryBlob"];

    id v10 = objc_alloc((Class)CKRecordID);
    BOOL v11 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    id v12 = [v11 zoneID];
    id v13 = [v10 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v12];

    objc_initWeak((id *)buf, self);
    id v14 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008F574;
    v17[3] = &unk_100235828;
    objc_copyWeak(v20, (id *)buf);
    id v18 = v6;
    v20[1] = (id)a4;
    id v15 = v8;
    dispatch_time_t v19 = v15;
    [v14 fetchRecordWithID:v13 completionHandler:v17];

    dispatch_time_t v16 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v15, v16);

    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleAccessoryModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v51 = v8;
    if (a5 >= 5)
    {
      id v9 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001B8EA0();
      }

      goto LABEL_24;
    }
    id v10 = [v7 domain];
    if ([v10 isEqualToString:CKErrorDomain])
    {
      if ([v7 code] == (id)3 || objc_msgSend(v7, "code") == (id)4 || objc_msgSend(v7, "code") == (id)9)
      {

        goto LABEL_11;
      }
      id v27 = [v7 code];

      if (v27 == (id)6)
      {
LABEL_11:
        BOOL v11 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1001B8F08();
        }
LABEL_13:

        id v12 = +[CloudXPCService sharedInstance];
        id v13 = +[NSNumber numberWithBool:0];
        id v14 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v13, @"kUploadStatus", 0];
        [v12 sendCloudKitMsg:@"DeviceInfoUploadStatus" args:v14];

LABEL_24:
        id v8 = v51;
        goto LABEL_25;
      }
    }
    else
    {
    }
    if ([v7 code] == (id)7)
    {
      id v15 = [v7 userInfo];
      dispatch_time_t v16 = CKErrorRetryAfterKey;
      double v17 = [v15 objectForKeyedSubscript:CKErrorRetryAfterKey];
      if (v17)
      {

LABEL_21:
        dispatch_time_t v19 = [v7 userInfo];
        v20 = [v19 objectForKeyedSubscript:v16];
        [v20 doubleValue];
        double v22 = v21;

        v23 = sub_10006CA04("MagicPairing");
        double v24 = v22 + 10.0;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412802;
          id v64 = v7;
          __int16 v65 = 2048;
          unint64_t v66 = a5;
          __int16 v67 = 2048;
          unint64_t v68 = (unint64_t)v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Manatee: modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu", buf, 0x20u);
        }

        dispatch_time_t v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100090444;
        block[3] = &unk_100233AA8;
        void block[4] = self;
        id v60 = v51;
        unint64_t v61 = a5;
        dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_24;
      }
      int IsCode = CKErrorIsCode();

      if (IsCode) {
        goto LABEL_21;
      }
    }
    else if (CKErrorIsCode())
    {
      dispatch_time_t v16 = CKErrorRetryAfterKey;
      goto LABEL_21;
    }
    v26 = [v7 domain];
    if ([v26 isEqualToString:CKErrorDomain])
    {
      if ([v7 code] == (id)26)
      {

LABEL_33:
        v29 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1001B8F70();
        }

        objc_initWeak((id *)buf, self);
        uint64_t v30 = [(MPCloudKit_Manatee *)self modifyOperationQueue];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10009059C;
        v56[3] = &unk_100234E80;
        objc_copyWeak(&v58, (id *)buf);
        id v57 = v51;
        [v30 addOperationWithBlock:v56];

        objc_destroyWeak(&v58);
        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }
      id v28 = [v7 code];

      if (v28 == (id)11) {
        goto LABEL_33;
      }
    }
    else
    {
    }
    id v31 = [v7 domain];
    if ([v31 isEqualToString:CKErrorDomain])
    {
      id v32 = [v7 code];

      if (v32 == (id)112)
      {
        uint64_t v33 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone.", buf, 2u);
        }

        v34 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError Reset and recreate zone DONE!", buf, 2u);
        }

        [(MPCloudKit_Manatee *)self resetCloudContainerManateeIdentityLost];
        goto LABEL_24;
      }
    }
    else
    {
    }
    v35 = [v7 domain];
    if ([v35 isEqualToString:CKErrorDomain])
    {
      id v36 = [v7 userInfo];
      id v37 = [v36 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

      if (v37)
      {
        id v38 = [v7 userInfo];
        v39 = [v38 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v40 = v39;
        id v41 = [v40 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v53;
          while (2)
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v53 != v42) {
                objc_enumerationMutation(v40);
              }
              __int16 v44 = [v40 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * i)];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v45 = [v44 domain];
                if ([v45 isEqualToString:CKErrorDomain])
                {
                  BOOL v46 = [v44 code] == (id)112;

                  if (v46)
                  {
                    uint64_t v47 = sub_10006CA04("MagicPairing");
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v64 = v44;
                      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone due to - %@", buf, 0xCu);
                    }

                    v49 = sub_10006CA04("MagicPairing");
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError. Reset and recreate zone DONE!", buf, 2u);
                    }

                    [(MPCloudKit_Manatee *)self resetCloudContainerManateeIdentityLost];
                    goto LABEL_68;
                  }
                }
                else
                {
                }
              }
            }
            id v41 = [v40 countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }
LABEL_68:

        goto LABEL_24;
      }
    }
    else
    {
    }
    BOOL v11 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001B8FD8();
    }
    goto LABEL_13;
  }
LABEL_25:
}

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(MPCloudKit_Manatee *)self manateeZoneUpgraded])
  {
    id v7 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
      id v9 = [v8 zoneID];
      id v10 = [v9 zoneName];
      *(_DWORD *)long long buf = 138412290;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: >>> writeAccessoryBlob Record Zone %@", buf, 0xCu);
    }
    id v11 = objc_alloc((Class)CKRecordID);
    id v12 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    id v13 = [v12 zoneID];
    id v14 = [v11 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v13];

    id v15 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AccessoryDatabase" recordID:v14];
    dispatch_time_t v16 = [v15 encryptedValues];
    [v16 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

    double v17 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Manatee: writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@", buf, 0xCu);
    }

    id v18 = +[CloudXPCService sharedInstance];
    [v18 beginTransaction:@"ManateeWriteAccessoryBlob"];

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    objc_initWeak((id *)buf, self);
    v20 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    double v21 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100090968;
    v25[3] = &unk_100235850;
    objc_copyWeak(v29, (id *)buf);
    v25[4] = self;
    id v22 = v15;
    id v26 = v22;
    v29[1] = (id)a4;
    id v27 = v6;
    v23 = v19;
    id v28 = v23;
    [v20 saveRecordZone:v21 completionHandler:v25];

    dispatch_time_t v24 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v23, v24);

    objc_destroyWeak(v29);
    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteCloudKitAccessoryZone
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    id v6 = [v5 zoneID];
    id v7 = [v6 zoneName];
    *(_DWORD *)long long buf = 138412290;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: >>> deleteCloudKitAccessoryZone %@", buf, 0xCu);
  }
  id v8 = objc_alloc((Class)CKRecordID);
  id v9 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
  id v10 = [v9 zoneID];
  id v11 = [v8 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v10];

  id v12 = +[CloudXPCService sharedInstance];
  [v12 beginTransaction:@"ManateeDeleteCloudKitAccessoryZone"];

  id v13 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100091860;
  v19[3] = &unk_100234EF8;
  dispatch_semaphore_t v20 = v3;
  id v14 = v3;
  [v13 deleteRecordWithID:v11 completionHandler:v19];

  dispatch_time_t v15 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v14, v15);
  dispatch_time_t v16 = +[CloudXPCService sharedInstance];
  double v17 = [v16 deviceManager];
  [v17 deleteLegacyMagicPairingRecordsWithUserInitiated:1 completion:&stru_100235870];

  id v18 = +[CloudXPCService sharedInstance];
  [v18 endTransaction:@"ManateeDeleteCloudKitAccessoryZone"];
}

- (void)createSubscritionForRecordType:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MPCloudKit_Manatee *)self manateeZoneUpgraded];
  id v6 = sub_10006CA04("MagicPairing");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (!v7) {
      goto LABEL_25;
    }
    *(_WORD *)long long buf = 0;
    id v11 = "Manatee zone not upgraded.";
    id v12 = v6;
    uint32_t v13 = 2;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_25;
  }
  if (v7)
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: createSubscritionForRecordType: %@", buf, 0xCu);
  }

  if ([v4 isEqualToString:@"EncryptedMasterKeyBlob"])
  {
    uint64_t v8 = [(MPCloudKit_Manatee *)self readUserPreference:@"MagicCloudPairingMasterSubscriptionManateeID"];
    if (v8)
    {
      id v6 = v8;
      id v9 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v6;
        id v10 = "Manatee: master subscription already exists: %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    id v15 = objc_alloc((Class)CKRecordZoneSubscription);
    dispatch_time_t v16 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    double v17 = [v16 zoneID];
    id v6 = [v15 initWithZoneID:v17];
    CFStringRef v18 = @"MagicCloudPairingMasterSubscriptionManateeID";
  }
  else
  {
    if (![v4 isEqualToString:@"EncryptedAccessoryBlob"])
    {
LABEL_22:
      id v6 = sub_10006CA04("MagicPairing");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 138412290;
      id v26 = v4;
      id v11 = "Manatee: Unable to create zone subscription key: %@";
      id v12 = v6;
      uint32_t v13 = 12;
      goto LABEL_24;
    }
    uint64_t v14 = [(MPCloudKit_Manatee *)self readUserPreference:@"MagicCloudPairingAccessorySubscriptionManateeID"];
    if (v14)
    {
      id v6 = v14;
      id v9 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v6;
        id v10 = "Manatee: accessory subscription already exists: %@";
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_25;
    }
    id v19 = objc_alloc((Class)CKRecordZoneSubscription);
    dispatch_time_t v16 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    double v17 = [v16 zoneID];
    id v6 = [v19 initWithZoneID:v17];
    CFStringRef v18 = @"MagicCloudPairingAccessorySubscriptionManateeID";
  }

  if (!v6) {
    goto LABEL_22;
  }
  dispatch_semaphore_t v20 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Manatee: Attempting to save subscription for recordType: %@", buf, 0xCu);
  }

  double v21 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100091E08;
  v22[3] = &unk_100234F40;
  v23 = (__CFString *)v18;
  dispatch_time_t v24 = self;
  [v21 saveSubscription:v6 completionHandler:v22];

LABEL_25:
}

- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPCloudKit_Manatee *)self readUserPreference:v7];
  id v9 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    dispatch_semaphore_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee: Verify Fetch cached Subscription ID - %@ for record - %@", buf, 0x16u);
  }

  id v10 = sub_10006CA04("MagicPairing");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138412290;
      dispatch_semaphore_t v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee: Found cached Subscription ID - %@", buf, 0xCu);
    }

    id v12 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    uint32_t v13 = [(MPCloudKit_Manatee *)self readUserPreference:v7];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000922E0;
    v14[3] = &unk_100234F68;
    id v15 = v8;
    dispatch_time_t v16 = self;
    id v17 = v7;
    id v18 = v6;
    [v12 fetchSubscriptionWithID:v13 completionHandler:v14];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee: Subscription cannot be Fetched, create it...", buf, 2u);
    }

    [(MPCloudKit_Manatee *)self createSubscritionForRecordType:v6];
  }
}

- (void)verifyAndCacheSubscriptionID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: verifyAndCacheSubscriptionID - %@", buf, 0xCu);
  }

  id v6 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100092654;
  v8[3] = &unk_100234F40;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 fetchSubscriptionWithID:v7 completionHandler:v8];
}

- (void)removeSubscritionForRecordType:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  unsigned __int8 v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: Attempting to delete Subscription for record type - %@ ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000929A8;
  v8[3] = &unk_100234FE0;
  objc_copyWeak(&v11, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  id v10 = v12;
  [v6 fetchAllSubscriptionsWithCompletionHandler:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v12, 8);
}

- (id)apsEnvironmentString
{
  dispatch_semaphore_t v3 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v19 = 0;
  dispatch_semaphore_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10008E3B8;
  v23 = sub_10008E3C8;
  id v24 = 0;
  if (v3)
  {
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
    unsigned __int8 v5 = (void *)v20[5];
    v20[5] = v4;

    id v6 = (void *)v20[5];
    if (v6)
    {
      if (![v6 compare:CKPushEnvironmentServerPreferred options:1])
      {
        dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
        uint64_t v8 = [(MPCloudKit_Manatee *)self cloudKitContainer];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100093134;
        v16[3] = &unk_100235008;
        id v18 = &v19;
        id v9 = v7;
        id v17 = v9;
        [v8 serverPreferredPushEnvironmentWithCompletionHandler:v16];

        dispatch_time_t v10 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v9, v10))
        {
          id v11 = sub_10006CA04("MagicPairing");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timeout getting server preferred push environment", buf, 2u);
          }
        }
      }
    }
  }
  id v12 = (void *)v20[5];
  if (!v12) {
    id v12 = (void *)APSEnvironmentProduction;
  }
  id v13 = v12;
  uint64_t v14 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)pushEnable
{
  dispatch_semaphore_t v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];

  if (![v4 length])
  {
    unsigned __int8 v5 = +[NSBundle mainBundle];
    id v6 = [v5 executablePath];
    uint64_t v7 = [v6 lastPathComponent];

    uint64_t v4 = (void *)v7;
  }
  uint64_t v8 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: Enable Push Notification Updated for bundle ID: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = +[CloudPushService shared];
  [v9 addWithDelegate:self];
}

- (void)pushDisable
{
  id v3 = +[CloudPushService shared];
  [v3 removeWithDelegate:self];
}

- (BOOL)manateeZoneUpgraded
{
  v2 = [(MPCloudKit_Manatee *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

  if (v2)
  {
    id v3 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: Master zone has been upgraded. Dont generate keys", v5, 2u);
    }
  }
  return v2 != 0;
}

- (void)resetCloudContainerManateeIdentityLost
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000934D4;
  block[3] = &unk_100232710;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)resetMasterZone:(id)a3 accessoryblob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MPCloudKit_Manatee *)self isAccountActive])
  {
    uint64_t v8 = +[CloudXPCService sharedInstance];
    [v8 beginTransaction:@"resetMasterZone"];

    id v9 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(MPCloudKit_Manatee *)self recordZoneBlob];
      id v11 = [v10 zoneID];
      id v12 = [v11 zoneName];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " >>> resetMasterZone Record Zone %@", buf, 0xCu);
    }
    dispatch_time_t v13 = dispatch_time(0, 10000000000);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    dispatch_time_t v16 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    id v17 = [v16 zoneID];
    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    id v26 = sub_100094040;
    id v27 = &unk_100235898;
    dispatch_semaphore_t v28 = v14;
    id v18 = v14;
    [v15 deleteRecordZoneWithID:v17 completionHandler:&v24];

    dispatch_semaphore_wait(v18, v13);
    -[MPCloudKit_Manatee _updateMasterZoneBlob:accessoryblob:](self, "_updateMasterZoneBlob:accessoryblob:", v6, v7, v24, v25, v26, v27);
    uint64_t v19 = +[CloudXPCService sharedInstance];
    [v19 endTransaction:@"resetMasterZone"];
  }
  else
  {
    dispatch_semaphore_t v20 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "resetMasterZone account not active upgrade pref and reload account status", buf, 2u);
    }

    uint64_t v21 = [(MPCloudKit_Manatee *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

    if (!v21)
    {
      [(MPCloudKit_Manatee *)self setuserPreference:@"MagicCloudPairingManateeUpgradedAccount" value:&__kCFBooleanTrue sync:1];
      id v22 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "resetMasterZone Master zone has been upgraded successfully", buf, 2u);
      }

      [(MPCloudKit_Manatee *)self accountStatusDidChange:0];
      dispatch_time_t v23 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100094030;
      block[3] = &unk_100232B98;
      void block[4] = self;
      id v30 = v6;
      id v31 = v7;
      dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updateMasterZoneBlob:(id)a3 accessoryblob:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CloudXPCService sharedInstance];
  [v8 beginTransaction:@"updateMasterZoneBlob"];

  id v9 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(MPCloudKit_Manatee *)self recordZoneBlob];
    id v11 = [v10 zoneID];
    id v12 = [v11 zoneName];
    *(_DWORD *)long long buf = 138412290;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " >>>updateMasterZoneBlob  Record Zone %@", buf, 0xCu);
  }
  id v13 = objc_alloc((Class)CKRecordID);
  dispatch_semaphore_t v14 = [(MPCloudKit_Manatee *)self recordZoneBlob];
  id v15 = [v14 zoneID];
  id v16 = [v13 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v15];

  id v17 = [objc_alloc((Class)CKRecord) initWithRecordType:@"MasterKey" recordID:v16];
  id v18 = [v17 encryptedValues];
  [v18 setObject:v7 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

  uint64_t v19 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updateMasterZoneBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", buf, 0xCu);
  }

  dispatch_semaphore_t v20 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
  uint64_t v21 = [(MPCloudKit_Manatee *)self recordZoneBlob];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000943F8;
  v24[3] = &unk_100235958;
  v24[4] = self;
  id v25 = v17;
  id v26 = v6;
  id v22 = v6;
  id v23 = v17;
  [v20 saveRecordZone:v21 completionHandler:v24];
}

- (void)resetAccessoryZone:(id)a3
{
  id v4 = a3;
  if ([(MPCloudKit_Manatee *)self isAccountActive])
  {
    unsigned __int8 v5 = +[CloudXPCService sharedInstance];
    [v5 beginTransaction:@"resetAccessoryZone"];

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    uint64_t v8 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    id v9 = [v8 zoneID];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000949E8;
    v15[3] = &unk_100235898;
    int v10 = v6;
    id v16 = v10;
    [v7 deleteRecordZoneWithID:v9 completionHandler:v15];

    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v10, v11);
    id v12 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "resetAccessoryZone record", v14, 2u);
    }

    [(MPCloudKit_Manatee *)self upgradeAccessoryBlob:v4 withRetryCount:4];
    id v13 = +[CloudXPCService sharedInstance];
    [v13 endTransaction:@"resetAccessoryZone"];
  }
}

- (void)upgradeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(MPCloudKit_Manatee *)self isAccountActive])
  {
    id v7 = +[CloudXPCService sharedInstance];
    [v7 beginTransaction:@"upgradeAccessoryBlob"];

    uint64_t v8 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
      int v10 = [v9 zoneID];
      dispatch_time_t v11 = [v10 zoneName];
      *(_DWORD *)long long buf = 138412290;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: upgradeAccessoryBlob:  Creating Record Zone %@", buf, 0xCu);
    }
    id v12 = objc_alloc((Class)CKRecordID);
    id v13 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    dispatch_semaphore_t v14 = [v13 zoneID];
    id v15 = [v12 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v14];

    id v16 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AccessoryDatabase" recordID:v15];
    id v17 = [v16 encryptedValues];
    [v17 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

    id v18 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Manatee: upgradeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@", buf, 0xCu);
    }

    uint64_t v19 = [(MPCloudKit_Manatee *)self cloudKitDatabase];
    dispatch_semaphore_t v20 = [(MPCloudKit_Manatee *)self recordZoneAccessoryDatabase];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100094D98;
    v22[3] = &unk_100235980;
    unint64_t v25 = a4;
    void v22[4] = self;
    id v23 = v6;
    id v24 = v16;
    id v21 = v16;
    [v19 saveRecordZone:v20 completionHandler:v22];
  }
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)@"com.apple.securedBluetooth";
}

- (OS_dispatch_queue)pushDelegateQueue
{
  id v3 = [(MPCloudKit_Manatee *)self pushQueue];

  if (!v3)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v4);
    [(MPCloudKit_Manatee *)self setPushQueue:v5];
  }

  return [(MPCloudKit_Manatee *)self pushQueue];
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 userInfo];
  id v6 = +[CKNotification notificationFromRemoteNotificationDictionary:v5];
  id v7 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 topic];
    *(_DWORD *)long long buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: ***** APS Push received: %@ \n %@ \n", buf, 0x16u);
  }
  id v9 = [v6 containerIdentifier];
  unsigned int v10 = [v9 isEqualToString:@"com.apple.securedBluetooth"];

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000957F4;
    v11[3] = &unk_100232A10;
    id v12 = v6;
    id v13 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v3 = a3;
  if (IsAppleInternalBuild())
  {
    id v4 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v5 = [v3 base64EncodedStringWithOptions:0];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Received public token \"%@\" on connection", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IsAppleInternalBuild())
  {
    unsigned int v10 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v11 = [v7 base64EncodedStringWithOptions:0];
      int v12 = 138412802;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee: Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)isAccountActive
{
  return self->_isAccountActive;
}

- (void)setIsAccountActive:(BOOL)a3
{
  self->_isAccountActive = a3;
}

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
}

- (BOOL)reinitAfterBuddy
{
  return self->_reinitAfterBuddy;
}

- (void)setReinitAfterBuddy:(BOOL)a3
{
  self->_reinitAfterBuddy = a3;
}

- (CKContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(id)a3
{
}

- (CKDatabase)cloudKitDatabase
{
  return self->_cloudKitDatabase;
}

- (void)setCloudKitDatabase:(id)a3
{
}

- (CKRecordZone)recordZoneBlob
{
  return self->_recordZoneBlob;
}

- (void)setRecordZoneBlob:(id)a3
{
}

- (CKRecordZone)recordZoneAccessoryDatabase
{
  return self->_recordZoneAccessoryDatabase;
}

- (void)setRecordZoneAccessoryDatabase:(id)a3
{
}

- (CKSubscription)cloudSubscription
{
  return self->_cloudSubscription;
}

- (void)setCloudSubscription:(id)a3
{
}

- (NSTimer)countdownTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCountdownTimer:(id)a3
{
}

- (NSTimer)pushTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPushTimer:(id)a3
{
}

- (NSMutableData)masterBlob
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMasterBlob:(id)a3
{
}

- (NSError)pauseErrorReason
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPauseErrorReason:(id)a3
{
}

- (BOOL)shouldPauseFetch
{
  return self->_shouldPauseFetch;
}

- (void)setShouldPauseFetch:(BOOL)a3
{
  self->_shouldPauseFetch = a3;
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
}

- (BOOL)isFetchInProgress
{
  return self->_isFetchInProgress;
}

- (void)setIsFetchInProgress:(BOOL)a3
{
  self->_isFetchInProgress = a3;
}

- (BOOL)isFetchMasterKeyInProgress
{
  return self->_isFetchMasterKeyInProgress;
}

- (void)setIsFetchMasterKeyInProgress:(BOOL)a3
{
  self->_isFetchMasterKeyInProgress = a3;
}

- (OS_dispatch_queue)pushQueue
{
  return self->_pushQueue;
}

- (void)setPushQueue:(id)a3
{
}

- (NSOperationQueue)modifyOperationQueue
{
  return self->_modifyOperationQueue;
}

- (void)setModifyOperationQueue:(id)a3
{
}

- (NSTimer)modifyOperationTimer
{
  return self->_modifyOperationTimer;
}

- (void)setModifyOperationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifyOperationTimer, 0);
  objc_storeStrong((id *)&self->_modifyOperationQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_buddyStateWatcher, 0);
  objc_storeStrong((id *)&self->_pauseErrorReason, 0);
  objc_storeStrong((id *)&self->_masterBlob, 0);
  objc_storeStrong((id *)&self->_pushTimer, 0);
  objc_storeStrong((id *)&self->_countdownTimer, 0);
  objc_storeStrong((id *)&self->_cloudSubscription, 0);
  objc_storeStrong((id *)&self->_recordZoneAccessoryDatabase, 0);
  objc_storeStrong((id *)&self->_recordZoneBlob, 0);
  objc_storeStrong((id *)&self->_cloudKitDatabase, 0);

  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
}

@end