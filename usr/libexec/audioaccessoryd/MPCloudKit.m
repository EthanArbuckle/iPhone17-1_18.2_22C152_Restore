@interface MPCloudKit
+ (id)sharedInstance;
- (BOOL)initializedCKAfterFirstUnlockedSinceBoot;
- (BOOL)isAccountActive;
- (BOOL)isFetchInProgress;
- (BOOL)isFetchMasterKeyInProgress;
- (BOOL)isOldContainerResetInProcess;
- (BOOL)isWriteMasterKeysInProgress;
- (BOOL)manateeZoneUpgraded;
- (BOOL)pushReceived;
- (BOOL)reinitAfterBuddy;
- (BOOL)shouldPauseFetch;
- (BTStateWatcher)buddyStateWatcher;
- (CKContainer)cloudKitContainer;
- (CKDatabase)cloudKitDatabase;
- (CKRecordZone)recordZoneAccessoryDatabase;
- (CKRecordZone)recordZoneBlob;
- (CKSubscription)cloudSubscription;
- (MPCloudKit)init;
- (MPCloudKit)initWithRecordZoneName;
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
- (id)hexStringForData:(id)a3;
- (id)readUserPreference:(id)a3;
- (void)_pushTimerFired:(id)a3;
- (void)accountStatusDidChange:(id)a3;
- (void)buddySetupDone;
- (void)checkAccountStatusWithCompletionHandler:(id)a3;
- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4;
- (void)createSubscritionForRecordType:(id)a3;
- (void)dealloc;
- (void)deleteCloudKitAccessoryZone;
- (void)deleteLegacyMasterKey;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)fetchAccountStatusWithCompletion:(id)a3;
- (void)fetchKeyBlob:(unint64_t)a3;
- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4;
- (void)forceAccountStatus;
- (void)getAccountStatus;
- (void)handleAccessoryKeyModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)initializeCloudKit;
- (void)markLegacyNonManateeContainerMigrated;
- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)pushDisable;
- (void)pushEnable;
- (void)removeSubscritionForRecordType:(id)a3;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetOldZones;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCloudKitContainer:(id)a3;
- (void)setCloudKitDatabase:(id)a3;
- (void)setCloudSubscription:(id)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setIsAccountActive:(BOOL)a3;
- (void)setIsFetchInProgress:(BOOL)a3;
- (void)setIsFetchMasterKeyInProgress:(BOOL)a3;
- (void)setIsOldContainerResetInProcess:(BOOL)a3;
- (void)setIsWriteMasterKeysInProgress:(BOOL)a3;
- (void)setMasterBlob:(id)a3;
- (void)setModifyOperationQueue:(id)a3;
- (void)setModifyOperationTimer:(id)a3;
- (void)setPauseErrorReason:(id)a3;
- (void)setPushQueue:(id)a3;
- (void)setPushReceived:(BOOL)a3;
- (void)setPushTimer:(id)a3;
- (void)setRecordZoneAccessoryDatabase:(id)a3;
- (void)setRecordZoneBlob:(id)a3;
- (void)setReinitAfterBuddy:(BOOL)a3;
- (void)setShouldPauseFetch:(BOOL)a3;
- (void)setupSubscriptions;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4;
- (void)updateCloudKitBlobZone:(id)a3;
- (void)upgradeLegacyNonManateeContainerToManatee;
- (void)verifyAndCacheSubscriptionID:(id)a3;
- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
@end

@implementation MPCloudKit

+ (id)sharedInstance
{
  if (qword_100263EE0 != -1) {
    dispatch_once(&qword_100263EE0, &stru_100234BA8);
  }
  v2 = (void *)qword_100263ED8;

  return v2;
}

- (MPCloudKit)init
{
  return [(MPCloudKit *)self initWithRecordZoneName];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCloudKit;
  [(MPCloudKit *)&v4 dealloc];
}

- (NSString)description
{
  v2 = [(MPCloudKit *)self cloudContainerIdentifier];
  v3 = +[NSString stringWithFormat:@"MPCloudKit: Container - %@", v2];

  return (NSString *)v3;
}

- (MPCloudKit)initWithRecordZoneName
{
  v17.receiver = self;
  v17.super_class = (Class)MPCloudKit;
  v2 = [(MPCloudKit *)&v17 init];
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
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MP BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
    }

    v11 = +[CloudXPCService sharedInstance];
    [v11 beginTransaction:@"com.apple.bluetooth.user.services.mpcloudkit.buddysetup"];

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006CEA4;
    v14[3] = &unk_100234688;
    objc_copyWeak(&v15, buf);
    v12 = +[BTStateWatcher monitorBuddyStateWithAction:v14];
    [(MPCloudKit *)v3 setBuddyStateWatcher:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }
  if (v10)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MP BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (![(MPCloudKit *)v3 initializedCKAfterFirstUnlockedSinceBoot]) {
LABEL_12:
  }
    [(MPCloudKit *)v3 initializedCKAfterFirstUnlockedSinceBoot];
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlocked since boot = %{public}@", buf, 0xCu);
  }

  if (v3 == 1)
  {
    v6 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device is already unlocked after boot ", buf, 2u);
    }

    [(MPCloudKit *)self initializeCloudKit];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D08C;
    block[3] = &unk_100232710;
    block[4] = self;
    if (qword_100263EE8 != -1) {
      dispatch_once(&qword_100263EE8, block);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forcing account update to bluetoothd", v5, 2u);
  }

  objc_super v4 = [(MPCloudKit *)self cloudKitContainer];
  [v4 accountStatusWithCompletionHandler:&stru_100234C10];
}

- (void)buddySetupDone
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "buddySetupDone : reset timer now ", buf, 2u);
  }

  if (self->_reinitAfterBuddy)
  {
    [(MPCloudKit *)self initializedCKAfterFirstUnlockedSinceBoot];
  }
  else
  {
    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

    CFStringRef v5 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "buddySetupDone : re-intt cloud kit not needed", v7, 2u);
    }
  }
  self->_reinitAfterBuddy = 0;
  v6 = +[CloudXPCService sharedInstance];
  [v6 endTransaction:@"com.apple.bluetooth.user.services.mpcloudkit.buddysetup"];
}

- (void)initializeCloudKit
{
  int v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "non manatee initializeCloudKit : start ", v13, 2u);
  }

  objc_super v4 = +[CKContainer containerWithIdentifier:@"com.apple.bluetooth"];
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
  [(MPCloudKit *)self pushEnable];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

  [(MPCloudKit *)self accountStatusDidChange:0];
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
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] prefName %@\n", (uint8_t *)&v11, 0xCu);
  }

  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    CFStringRef v10 = sub_10006CA04("MagicPairing");
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
  unsigned int v5 = [(MPCloudKit *)self manateeZoneUpgraded];
  v6 = sub_10006CA04("MagicPairing");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountStatusDidChange check on manatee side", (uint8_t *)buf, 2u);
    }

    id v8 = +[MPCloudKit_Manatee sharedInstance];
    [v8 getAccountStatus];
  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountStatusDidChange calling accountStatusWithCompletionHandler", (uint8_t *)buf, 2u);
    }

    v9 = [(MPCloudKit *)self cloudKitContainer];

    if (!v9)
    {
      CFStringRef v10 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "non-Manatee accountStatusDidChange cloudKitContainer is nil", (uint8_t *)buf, 2u);
      }

      [(MPCloudKit *)self initializeCloudKit];
    }
    objc_initWeak(buf, self);
    int v11 = [(MPCloudKit *)self cloudKitContainer];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006DAB8;
    v12[3] = &unk_100234C38;
    objc_copyWeak(&v13, buf);
    [v11 accountStatusWithCompletionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

- (void)setupSubscriptions
{
  [(MPCloudKit *)self createSubscritionForRecordType:@"EncryptedMasterKeyBlob"];

  [(MPCloudKit *)self createSubscritionForRecordType:@"EncryptedAccessoryBlob"];
}

- (void)fetchAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MPCloudKit *)self cloudKitContainer];

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006E154;
    v9[3] = &unk_100234C60;
    id v10 = v4;
    [(CKContainer *)cloudKitContainer accountInfoWithCompletionHandler:v9];
    BOOL v7 = v10;
LABEL_7:

    goto LABEL_8;
  }
  id v8 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "non-Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil", buf, 2u);
  }

  if (v4)
  {
    BOOL v7 = +[NSError errorWithDomain:@"CloudKit Account Not Active" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_pushTimerFired:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MP Push Timer Fired: %@", buf, 0xCu);
  }

  v6 = [(MPCloudKit *)self pushTimer];

  if (v6)
  {
    BOOL v7 = [(MPCloudKit *)self pushTimer];
    [v7 invalidate];

    [(MPCloudKit *)self setPushTimer:0];
  }
  if ([(MPCloudKit *)self manateeZoneUpgraded])
  {
    id v8 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MP Push Timer fired but we are now upgraded to manatee", buf, 2u);
    }

    v9 = +[MPCloudKit_Manatee sharedInstance];
    [v9 fetchAccessoryKeyBlob:0];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E33C;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)fetchKeyBlob:(unint64_t)a3
{
  unsigned int v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MP fetchKeyBlob: %lu", buf, 0xCu);
  }

  if ([(MPCloudKit *)self manateeZoneUpgraded])
  {
    v6 = +[MPCloudKit_Manatee sharedInstance];
    [v6 fetchKeyBlob:0];
    goto LABEL_24;
  }
  if ([(MPCloudKit *)self isWriteMasterKeysInProgress])
  {
    v6 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    BOOL v7 = "MP already writing new key";
    goto LABEL_8;
  }
  id v10 = [(MPCloudKit *)self masterBlob];
  id v11 = [v10 length];

  if (v11 != (id)33)
  {
    if (a3 >= 5)
    {
      v6 = sub_10006CA04("MagicPairing");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = a3;
      BOOL v7 = "MP Exhausted all retries...: %lu";
      id v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_9;
    }
    if ([(MPCloudKit *)self isFetchMasterKeyInProgress])
    {
      v6 = sub_10006CA04("MagicPairing");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      BOOL v7 = "MP fetchKeyBlob already fetching defer";
    }
    else
    {
      v16 = [(MPCloudKit *)self recordZoneBlob];

      if (v16)
      {
        [(MPCloudKit *)self setIsFetchMasterKeyInProgress:1];
        [(MPCloudKit *)self setMasterBlob:0];
        id v17 = objc_alloc((Class)CKRecordID);
        v18 = [(MPCloudKit *)self recordZoneBlob];
        v19 = [v18 zoneID];
        v6 = [v17 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v19];

        v20 = +[CloudXPCService sharedInstance];
        [v20 beginTransaction:@"fetchKeyBlob"];

        v21 = [(MPCloudKit *)self cloudKitDatabase];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10006E7B4;
        v22[3] = &unk_100234CA8;
        v22[4] = self;
        v22[5] = a3;
        [v21 fetchRecordWithID:v6 completionHandler:v22];

        goto LABEL_24;
      }
      v6 = sub_10006CA04("MagicPairing");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      BOOL v7 = "non-Manatee recordZoneBlob is nil";
    }
LABEL_8:
    id v8 = v6;
    uint32_t v9 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    goto LABEL_24;
  }
  id v12 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(MPCloudKit *)self masterBlob];
    *(_DWORD *)buf = 138412290;
    unint64_t v24 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MP fetchKeyBlob: already have master blob read  %@", buf, 0xCu);
  }
  v6 = +[CloudXPCService sharedInstance];
  v14 = [(MPCloudKit *)self masterBlob];
  id v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v14, @"kMasterKeyBlob", 0];
  [v6 sendCloudKitMsg:@"MasterKeysAvailable" args:v15];

LABEL_24:
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (a4 < 5)
  {
    objc_initWeak((id *)buf, self);
    id v8 = [(MPCloudKit *)self cloudKitContainer];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006F22C;
    v9[3] = &unk_100234CF8;
    objc_copyWeak(v11, (id *)buf);
    void v9[4] = self;
    id v10 = v6;
    v11[1] = (id)a4;
    [v8 accountStatusWithCompletionHandler:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    BOOL v7 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[MPCloudKit checkAccountStatusWithCompletionHandler:withRetryCount:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MP Exhausted all account retries: %s", buf, 0xCu);
    }
  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  if ([(MPCloudKit *)self manateeZoneUpgraded])
  {
    unsigned int v5 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
    }

    id v6 = +[MPCloudKit_Manatee sharedInstance];
    [v6 fetchAccessoryKeyBlob:a3];
LABEL_5:

    return;
  }
  if ([(MPCloudKit *)self shouldPauseFetch])
  {
    BOOL v7 = +[MPCloudKit_Manatee sharedInstance];
    unsigned int v8 = [v7 shouldPauseFetch];

    if (v8)
    {
      uint32_t v9 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(MPCloudKit *)self pauseErrorReason];
        *(_DWORD *)buf = 138412290;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetch is currently paused due to: %@", buf, 0xCu);
      }
LABEL_19:

      return;
    }
  }
  id v11 = sub_10006CA04("MagicPairing");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (a3 < 5)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      v23 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MP fetchAccessoryKeyBlob: %lu", buf, 0xCu);
    }

    if ([(MPCloudKit *)self isFetchInProgress])
    {
      uint32_t v9 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = [(MPCloudKit *)self isFetchInProgress];
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MP fetchAccessoryKeyBlob already in-progress: %i", buf, 8u);
      }
      goto LABEL_19;
    }
    v14 = [(MPCloudKit *)self recordZoneAccessoryDatabase];

    if (!v14)
    {
      id v6 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "non-Manatee recordZoneAccessoryDatabase is nil", buf, 2u);
      }
      goto LABEL_5;
    }
    [(MPCloudKit *)self setIsFetchInProgress:1];
    id v15 = objc_alloc((Class)CKRecordID);
    v16 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
    id v17 = [v16 zoneID];
    id v18 = [v15 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v17];

    v19 = +[CloudXPCService sharedInstance];
    [v19 beginTransaction:@"fetchAccessoryKeyBlob"];

    v20 = [(MPCloudKit *)self cloudKitDatabase];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006F834;
    v21[3] = &unk_100234CA8;
    v21[4] = self;
    v21[5] = a3;
    [v20 fetchRecordWithID:v18 completionHandler:v21];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[MPCloudKit fetchAccessoryKeyBlob:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MP Exhausted all retries...: %s", buf, 0xCu);
    }

    [(MPCloudKit *)self setIsFetchInProgress:0];
  }
}

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4 = a3;
  if (![(MPCloudKit *)self manateeZoneUpgraded])
  {
    unsigned int v5 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

    if (v5)
    {
      id v6 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
      }
    }
    else
    {
      unsigned int v7 = [(MPCloudKit *)self isWriteMasterKeysInProgress];
      unsigned int v8 = sub_10006CA04("MagicPairing");
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateCloudKitBlobZone already in the process...", v11, 2u);
        }
      }
      else
      {
        if (v9)
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updating CloudKit Blob", v10, 2u);
        }

        [(MPCloudKit *)self setIsWriteMasterKeysInProgress:1];
        [(MPCloudKit *)self modifyKeyBlob:v4 withRetryCount:0];
      }
    }
  }
}

- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "modifyKeyBlob with retry count: %lu", buf, 0xCu);
  }

  unsigned int v8 = +[CloudXPCService sharedInstance];
  [v8 beginTransaction:@"modifyKeyBlob"];

  id v9 = objc_alloc((Class)CKRecordID);
  id v10 = [(MPCloudKit *)self recordZoneBlob];
  id v11 = [v10 zoneID];
  id v12 = [v9 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v11];

  unsigned int v13 = [(MPCloudKit *)self cloudKitDatabase];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100070228;
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
    goto LABEL_17;
  }
  id v10 = [v8 domain];
  if ([v10 isEqualToString:CKErrorDomain]
    && ([v8 code] == (id)3
     || [v8 code] == (id)7
     || [v8 code] == (id)4
     || [v8 code] == (id)9
     || [v8 code] == (id)6))
  {

    id v11 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2048;
      unint64_t v28 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating master key failed with error %@, retry count = %lu", buf, 0x16u);
    }

    id v12 = [v8 userInfo];
    unsigned int v13 = [v12 objectForKeyedSubscript:CKErrorRetryAfterKey];

    if (v13)
    {
      id v14 = [v8 userInfo];
      id v15 = [v14 objectForKeyedSubscript:CKErrorRetryAfterKey];
      [v15 doubleValue];
      double v17 = v16;

      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100070900;
      block[3] = &unk_100233AA8;
      block[4] = self;
      id v23 = v9;
      unint64_t v24 = a5;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_18;
    }
LABEL_17:
    [(MPCloudKit *)self setIsWriteMasterKeysInProgress:0];
    goto LABEL_18;
  }

  unint64_t v19 = [v8 domain];
  if (![v19 isEqualToString:CKErrorDomain])
  {

    goto LABEL_17;
  }
  if ([v8 code] == (id)26)
  {
  }
  else
  {
    id v20 = [v8 code];

    if (v20 != (id)11) {
      goto LABEL_17;
    }
  }
  v21 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1001B6DC0();
  }

  [(MPCloudKit *)self writeKeyBlob:v9 withRetryCount:0];
LABEL_18:
}

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (![(MPCloudKit *)self manateeZoneUpgraded])
  {
    unsigned int v7 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

    BOOL v8 = v7 == 0;
    id v9 = sub_10006CA04("MagicPairing");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v11 = [(MPCloudKit *)self recordZoneBlob];
        id v12 = [v11 zoneID];
        unsigned int v13 = [v12 zoneName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@", (uint8_t *)&buf, 0xCu);
      }
      id v14 = objc_alloc((Class)CKRecordID);
      id v15 = [(MPCloudKit *)self recordZoneBlob];
      double v16 = [v15 zoneID];
      id v9 = [v14 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v16];

      id v17 = [objc_alloc((Class)CKRecord) initWithRecordType:@"MasterKey" recordID:v9];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v47 = 0x3032000000;
      v48 = sub_100070E24;
      v49 = sub_100070E34;
      id v50 = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      char v41 = 0;
      dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
      unint64_t v19 = [v17 encryptedValues];
      [v19 setObject:v6 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

      id v20 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v42 = 138412290;
        id v43 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", v42, 0xCu);
      }

      v21 = +[CloudXPCService sharedInstance];
      [v21 beginTransaction:@"writeKeyBlob"];

      v22 = [(MPCloudKit *)self cloudKitDatabase];
      id v23 = [(MPCloudKit *)self recordZoneBlob];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100070E3C;
      v33[3] = &unk_100234D90;
      v38 = v40;
      unint64_t v39 = a4;
      p_long long buf = &buf;
      v33[4] = self;
      id v34 = v6;
      id v24 = v17;
      id v35 = v24;
      v25 = v18;
      v36 = v25;
      [v22 saveRecordZone:v23 completionHandler:v33];

      dispatch_time_t v26 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v25, v26);
      [(MPCloudKit *)self setIsWriteMasterKeysInProgress:0];
      __int16 v27 = +[CloudXPCService sharedInstance];
      [v27 endTransaction:@"writeKeyBlob"];

      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        unint64_t v28 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [(MPCloudKit *)self recordZoneBlob];
          v30 = [v29 zoneID];
          v31 = [v30 zoneName];
          uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v42 = 138412546;
          id v43 = v31;
          __int16 v44 = 2112;
          uint64_t v45 = v32;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@ failed with error %@", v42, 0x16u);
        }
      }

      _Block_object_dispose(v40, 8);
      _Block_object_dispose(&buf, 8);
    }
    else if (v10)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6 = a3;
  if (![(MPCloudKit *)self manateeZoneUpgraded])
  {
    unsigned int v7 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

    if (v7)
    {
      BOOL v8 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont update keys to this container", buf, 2u);
      }
    }
    else if ([(MPCloudKit *)self isAccountActive])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100071728;
      block[3] = &unk_100234E08;
      BOOL v12 = a4;
      BOOL v10 = v6;
      id v11 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      BOOL v8 = v10;
    }
    else
    {
      BOOL v8 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001B6E28();
      }
    }
  }
}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " >>> modifyAccessoryBlob - %lu", buf, 0xCu);
  }

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = objc_alloc((Class)CKRecordID);
  BOOL v10 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
  id v11 = [v10 zoneID];
  id v12 = [v9 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v11];

  objc_initWeak((id *)buf, self);
  unsigned int v13 = [(MPCloudKit *)self cloudKitDatabase];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100071CF4;
  v17[3] = &unk_100234E30;
  id v14 = v8;
  dispatch_semaphore_t v18 = v14;
  objc_copyWeak(v20, (id *)buf);
  id v15 = v6;
  id v19 = v15;
  v20[1] = (id)a4;
  [v13 fetchRecordWithID:v12 completionHandler:v17];

  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v14, v16);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

- (void)handleAccessoryKeyModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_37;
  }
  if (a5 >= 5)
  {
    BOOL v10 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001B6FC8();
    }

    goto LABEL_37;
  }
  id v11 = [v8 domain];
  if ([v11 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)3 || objc_msgSend(v8, "code") == (id)4 || objc_msgSend(v8, "code") == (id)9)
    {

      goto LABEL_11;
    }
    id v25 = [v8 code];

    if (v25 == (id)6)
    {
LABEL_11:
      id v12 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001B7030();
      }
LABEL_36:

      v29 = +[CloudXPCService sharedInstance];
      v30 = +[NSNumber numberWithBool:0];
      v31 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v30, @"kUploadStatus", 0];
      [v29 sendCloudKitMsg:@"DeviceInfoUploadStatus" args:v31];

      goto LABEL_37;
    }
  }
  else
  {
  }
  if ([v8 code] == (id)7)
  {
    unsigned int v13 = [v8 userInfo];
    id v14 = CKErrorRetryAfterKey;
    id v15 = [v13 objectForKeyedSubscript:CKErrorRetryAfterKey];
    if (v15)
    {

LABEL_21:
      id v17 = [v8 userInfo];
      dispatch_semaphore_t v18 = [v17 objectForKeyedSubscript:v14];
      [v18 doubleValue];
      double v20 = v19;

      v21 = sub_10006CA04("MagicPairing");
      double v22 = v20 + 10.0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        id v39 = v8;
        __int16 v40 = 2048;
        unint64_t v41 = a5;
        __int16 v42 = 2048;
        unint64_t v43 = (unint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu", buf, 0x20u);
      }

      dispatch_time_t v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072950;
      block[3] = &unk_100233AA8;
      void block[4] = self;
      id v36 = v9;
      unint64_t v37 = a5;
      dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_37;
    }
    int IsCode = CKErrorIsCode();

    if (IsCode) {
      goto LABEL_21;
    }
  }
  else if (CKErrorIsCode())
  {
    id v14 = CKErrorRetryAfterKey;
    goto LABEL_21;
  }
  id v24 = [v8 domain];
  if (![v24 isEqualToString:CKErrorDomain])
  {

    goto LABEL_34;
  }
  if ([v8 code] != (id)26)
  {
    id v26 = [v8 code];

    if (v26 == (id)11) {
      goto LABEL_31;
    }
LABEL_34:
    id v12 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B7100();
    }
    goto LABEL_36;
  }

LABEL_31:
  __int16 v27 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1001B7098();
  }

  objc_initWeak((id *)buf, self);
  unint64_t v28 = [(MPCloudKit *)self modifyOperationQueue];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100072AA8;
  v32[3] = &unk_100234E80;
  objc_copyWeak(&v34, (id *)buf);
  id v33 = v9;
  [v28 addOperationWithBlock:v32];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
LABEL_37:
}

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (![(MPCloudKit *)self manateeZoneUpgraded])
  {
    unsigned int v7 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

    id v8 = sub_10006CA04("MagicPairing");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
      }
    }
    else
    {
      if (v9)
      {
        BOOL v10 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
        id v11 = [v10 zoneID];
        id v12 = [v11 zoneName];
        *(_DWORD *)long long buf = 138412290;
        id v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " >>> writeAccessoryBlob Record Zone %@", buf, 0xCu);
      }
      id v13 = objc_alloc((Class)CKRecordID);
      id v14 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
      id v15 = [v14 zoneID];
      id v8 = [v13 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v15];

      id v16 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AccessoryDatabase" recordID:v8];
      id v17 = [v16 encryptedValues];
      [v17 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

      dispatch_semaphore_t v18 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch:  encryptedBlob %@", buf, 0xCu);
      }

      double v19 = +[CloudXPCService sharedInstance];
      [v19 beginTransaction:@"WriteAccessoryBlob"];

      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      v21 = [(MPCloudKit *)self cloudKitDatabase];
      double v22 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100072E54;
      v26[3] = &unk_100234ED0;
      v26[4] = self;
      id v27 = v16;
      unint64_t v30 = a4;
      id v28 = v6;
      dispatch_semaphore_t v29 = v20;
      dispatch_time_t v23 = v20;
      id v24 = v16;
      [v21 saveRecordZone:v22 completionHandler:v26];

      dispatch_time_t v25 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v23, v25);
    }
  }
}

- (void)deleteCloudKitAccessoryZone
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
    id v6 = [v5 zoneID];
    unsigned int v7 = [v6 zoneName];
    *(_DWORD *)long long buf = 138412290;
    dispatch_semaphore_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " >>> deleteCloudKitAccessoryZone %@", buf, 0xCu);
  }
  id v8 = objc_alloc((Class)CKRecordID);
  BOOL v9 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
  BOOL v10 = [v9 zoneID];
  id v11 = [v8 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v10];

  id v12 = [(MPCloudKit *)self cloudKitDatabase];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000739D8;
  v17[3] = &unk_100234EF8;
  dispatch_semaphore_t v18 = v3;
  id v13 = v3;
  [v12 deleteRecordWithID:v11 completionHandler:v17];

  dispatch_time_t v14 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v13, v14);
  id v15 = +[CloudXPCService sharedInstance];
  id v16 = [v15 deviceManager];
  [v16 deleteLegacyMagicPairingRecordsWithUserInitiated:1 completion:&stru_100234F18];
}

- (void)createSubscritionForRecordType:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MPCloudKit *)self manateeZoneUpgraded];
  id v6 = sub_10006CA04("MagicPairing");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setup manatee zone for push notifications", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v7)
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "createSubscritionForRecordType: %@", buf, 0xCu);
  }

  if ([v4 isEqualToString:@"EncryptedMasterKeyBlob"])
  {
    id v8 = objc_alloc((Class)CKRecordZoneSubscription);
    BOOL v9 = [(MPCloudKit *)self recordZoneBlob];
    BOOL v10 = [v9 zoneID];
    id v6 = [v8 initWithZoneID:v10];

    uint64_t v11 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingMasterSubscriptionID"];
    if (v11)
    {
      id v12 = v11;
      id v13 = sub_10006CA04("MagicPairing");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Master subscription already exists: %@", buf, 0xCu);
      }

      goto LABEL_22;
    }
    id v16 = objc_alloc((Class)CKRecordZoneSubscription);
    id v17 = [(MPCloudKit *)self recordZoneBlob];
    dispatch_semaphore_t v18 = [v17 zoneID];
    double v19 = [v16 initWithZoneID:v18];

    CFStringRef v20 = @"MagicCloudPairingMasterSubscriptionID";
    id v6 = v19;
    goto LABEL_18;
  }
  if (![v4 isEqualToString:@"EncryptedAccessoryBlob"])
  {
LABEL_20:
    id v6 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    id v12 = [(MPCloudKit *)self recordZoneBlob];
    dispatch_time_t v23 = [v12 zoneID];
    id v24 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
    dispatch_time_t v25 = [v24 zoneID];
    *(_DWORD *)long long buf = 138412546;
    unint64_t v30 = v23;
    __int16 v31 = 2112;
    id v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to create zone subscription key %@ or Accessory %@", buf, 0x16u);

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v14 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingAccessorySubscriptionID"];
  if (!v14)
  {
    id v21 = objc_alloc((Class)CKRecordZoneSubscription);
    id v17 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
    dispatch_semaphore_t v18 = [v17 zoneID];
    id v6 = [v21 initWithZoneID:v18];
    CFStringRef v20 = @"MagicCloudPairingAccessorySubscriptionID";
LABEL_18:

    if (v6)
    {
      double v22 = [(MPCloudKit *)self cloudKitDatabase];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100073FE0;
      v26[3] = &unk_100234F40;
      id v27 = (__CFString *)v20;
      id v28 = self;
      [v22 saveSubscription:v6 completionHandler:v26];

      goto LABEL_23;
    }
    goto LABEL_20;
  }
  id v6 = v14;
  id v15 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Accessory subscription already exists: %@", buf, 0xCu);
  }

LABEL_23:
}

- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPCloudKit *)self readUserPreference:v7];
  BOOL v9 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Verify Fetch cached Subscription ID - %@ for record - %@", buf, 0x16u);
  }

  BOOL v10 = sub_10006CA04("MagicPairing");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found cached Subscription ID - %@", buf, 0xCu);
    }

    id v12 = [(MPCloudKit *)self cloudKitDatabase];
    id v13 = [(MPCloudKit *)self readUserPreference:v7];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000744A4;
    v14[3] = &unk_100234F68;
    id v15 = v8;
    id v16 = self;
    id v17 = v7;
    id v18 = v6;
    [v12 fetchSubscriptionWithID:v13 completionHandler:v14];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Subscription cannot be Fetched, create it...", buf, 2u);
    }

    [(MPCloudKit *)self createSubscritionForRecordType:v6];
  }
}

- (void)verifyAndCacheSubscriptionID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "verifyAndCacheSubscriptionID - %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(MPCloudKit *)self cloudKitDatabase];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100074870;
  v8[3] = &unk_100234F90;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [v6 fetchSubscriptionWithID:v7 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)removeSubscritionForRecordType:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  unsigned int v5 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to delete Subscription for record type - %@ ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(MPCloudKit *)self cloudKitDatabase];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100074C08;
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
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100070E24;
  dispatch_time_t v23 = sub_100070E34;
  id v24 = 0;
  if (v3)
  {
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
    unsigned int v5 = (void *)v20[5];
    v20[5] = v4;

    id v6 = (void *)v20[5];
    if (v6)
    {
      if (![v6 compare:CKPushEnvironmentServerPreferred options:1])
      {
        dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
        id v8 = [(MPCloudKit *)self cloudKitContainer];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100075394;
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
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, ">>>>> Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)hexStringForData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableString string];
  uint64_t v5 = (uint64_t)[v3 length];
  id v6 = v3;
  dispatch_semaphore_t v7 = (unsigned __int8 *)[v6 bytes];
  if (v5 >= 1)
  {
    id v8 = v7;
    do
    {
      unsigned int v9 = *v8++;
      [v4 appendFormat:@"%02X", v9];
      --v5;
    }
    while (v5);
  }
  id v10 = [v4 copy];

  return v10;
}

- (void)pushEnable
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];

  if (![v4 length])
  {
    uint64_t v5 = +[NSBundle mainBundle];
    id v6 = [v5 executablePath];
    uint64_t v7 = [v6 lastPathComponent];

    uint64_t v4 = (void *)v7;
  }
  id v8 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enable Push Notification Updated for bundle ID: %@", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v9 = +[CloudPushService shared];
  [v9 addWithDelegate:self];
}

- (void)pushDisable
{
  id v3 = +[CloudPushService shared];
  [v3 removeWithDelegate:self];
}

- (BOOL)manateeZoneUpgraded
{
  v2 = [(MPCloudKit *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

  if (v2)
  {
    id v3 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Master zone has been upgraded. Dont generate keys", v5, 2u);
    }
  }
  return v2 != 0;
}

- (void)markLegacyNonManateeContainerMigrated
{
  id v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(MPCloudKit *)self recordZoneBlob];
    uint64_t v5 = [v4 zoneID];
    id v6 = [v5 zoneName];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " >>>markLegacyNonManateeContainerMigrated  Record Zone %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = self->_cloudKitDatabase;
  id v8 = objc_alloc((Class)CKRecordID);
  unsigned int v9 = [(MPCloudKit *)self recordZoneBlob];
  int v10 = [v9 zoneID];
  id v11 = [v8 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v10];

  id v12 = objc_alloc((Class)CKRecordID);
  id v13 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
  uint64_t v14 = [v13 zoneID];
  id v15 = [v12 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v14];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x3032000000;
  v49 = sub_100070E24;
  id v50 = sub_100070E34;
  id v51 = [objc_alloc((Class)CKRecord) initWithRecordType:@"MasterKey" recordID:v11];
  uint64_t v40 = 0;
  unint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  unint64_t v43 = sub_100070E24;
  __int16 v44 = sub_100070E34;
  id v45 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AccessoryDatabase" recordID:v15];
  __int16 v39 = -1;
  id v16 = +[NSData dataWithBytes:&v39 length:2];
  id v17 = [*(id *)(*((void *)&buf + 1) + 40) encryptedValues];
  [v17 setObject:v16 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

  int v38 = -1;
  id v18 = +[NSData dataWithBytes:&v38 length:4];
  uint64_t v19 = [(id)v41[5] encryptedValues];
  [v19 setObject:v18 forKeyedSubscript:@"EncryptedAccessoryBlob"];

  id v20 = objc_alloc((Class)CKFetchRecordsOperation);
  v46[0] = v11;
  v46[1] = v15;
  uint64_t v21 = +[NSArray arrayWithObjects:v46 count:2];
  id v22 = [v20 initWithRecordIDs:v21];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100075C44;
  v33[3] = &unk_100235030;
  id v23 = v11;
  id v34 = v23;
  p_long long buf = &buf;
  id v24 = v15;
  id v35 = v24;
  unint64_t v37 = &v40;
  [v22 setPerRecordCompletionBlock:v33];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100075EB0;
  v27[3] = &unk_1002350A8;
  __int16 v31 = &buf;
  v27[4] = self;
  id v25 = v23;
  id v28 = v25;
  id v32 = &v40;
  id v26 = v24;
  id v29 = v26;
  unint64_t v30 = v7;
  [v22 setCompletionBlock:v27];
  [(CKDatabase *)v7 addOperation:v22];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)upgradeLegacyNonManateeContainerToManatee
{
  if ([(MPCloudKit *)self manateeZoneUpgraded])
  {
    sub_10006CA04("MagicPairing");
    uint64_t v7 = (CKDatabase *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      sub_1001B76F8();
    }
  }
  else
  {
    id v3 = +[CloudXPCService sharedInstance];
    uint64_t v4 = [v3 networkMonitor];
    unsigned __int8 v5 = [v4 isNetworkUp];

    id v6 = sub_10006CA04("MagicPairing");
    uint64_t v7 = (CKDatabase *)v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(MPCloudKit *)self recordZoneBlob];
        unsigned int v9 = [v8 zoneID];
        int v10 = [v9 zoneName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_DEFAULT, " >>>upgradeLegacyNonManateeContainerToManatee Record Zone %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v7 = self->_cloudKitDatabase;
      id v11 = +[MPCloudKit_Manatee sharedInstance];
      id v12 = [v11 cloudKitDatabase];

      if (v12)
      {
        id v13 = objc_alloc((Class)CKRecordID);
        uint64_t v14 = [(MPCloudKit *)self recordZoneBlob];
        id v15 = [v14 zoneID];
        id v16 = [v13 initWithRecordName:@"EncryptedMasterKeyBlob" zoneID:v15];

        id v17 = objc_alloc((Class)CKRecordID);
        id v18 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
        uint64_t v19 = [v18 zoneID];
        id v20 = [v17 initWithRecordName:@"EncryptedAccessoryBlob" zoneID:v19];

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v47 = 0x3032000000;
        uint64_t v48 = sub_100070E24;
        v49 = sub_100070E34;
        id v50 = [objc_alloc((Class)CKRecord) initWithRecordType:@"MasterKey" recordID:v16];
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x3032000000;
        v43[3] = sub_100070E24;
        v43[4] = sub_100070E34;
        id v44 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AccessoryDatabase" recordID:v20];
        id v21 = objc_alloc((Class)CKFetchRecordsOperation);
        v45[0] = v16;
        v45[1] = v20;
        id v22 = +[NSArray arrayWithObjects:v45 count:2];
        id v23 = [v21 initWithRecordIDs:v22];

        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100076B50;
        v38[3] = &unk_100235030;
        id v24 = v16;
        id v39 = v24;
        p_long long buf = &buf;
        id v25 = v20;
        id v40 = v25;
        uint64_t v42 = v43;
        [v23 setPerRecordCompletionBlock:v38];
        id v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        unint64_t v30 = sub_100076DBC;
        __int16 v31 = &unk_100235120;
        id v36 = &buf;
        unint64_t v37 = v43;
        id v26 = v24;
        id v32 = v26;
        id v27 = v25;
        id v33 = v27;
        id v34 = self;
        id v35 = v12;
        [v23 setCompletionBlock:&v28];
        -[CKDatabase addOperation:](v7, "addOperation:", v23, v28, v29, v30, v31);

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        id v26 = sub_10006CA04("MagicPairing");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1001B772C();
        }
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1001B7760();
    }
  }
}

- (void)deleteLegacyMasterKey
{
  unsigned __int8 v3 = [(MPCloudKit *)self isAccountActive];
  uint64_t v4 = sub_10006CA04("MagicPairing");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [(MPCloudKit *)self recordZoneBlob];
      uint64_t v7 = [v6 zoneID];
      id v8 = [v7 zoneName];
      *(_DWORD *)long long buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " >>>deleteLegacyMasterKey  Record Zone %@", buf, 0xCu);
    }
    id v9 = objc_alloc((Class)CKRecordID);
    int v10 = [(MPCloudKit *)self recordZoneBlob];
    id v11 = [v10 zoneID];
    uint64_t v4 = [v9 initWithRecordName:@"KeyBlob" zoneID:v11];

    id v12 = [(MPCloudKit *)self cloudKitDatabase];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100077C84;
    v13[3] = &unk_100234EF8;
    v13[4] = self;
    [v12 deleteRecordWithID:v4 completionHandler:v13];
  }
  else if (v5)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No Active Account", buf, 2u);
  }
}

- (void)resetOldZones
{
  unsigned __int8 v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(MPCloudKit *)self recordZoneBlob];
    BOOL v5 = [v4 zoneID];
    id v6 = [v5 zoneName];
    int v38 = 138412290;
    id v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Key Record Zone %@", (uint8_t *)&v38, 0xCu);
  }
  uint64_t v7 = [(MPCloudKit *)self cloudKitDatabase];
  id v8 = [(MPCloudKit *)self recordZoneBlob];
  id v9 = [v8 zoneID];
  [v7 deleteRecordZoneWithID:v9 completionHandler:&stru_100235160];

  int v10 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
    id v12 = [v11 zoneID];
    id v13 = [v12 zoneName];
    int v38 = 138412290;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Accessory Record Zone %@", (uint8_t *)&v38, 0xCu);
  }
  uint64_t v14 = [(MPCloudKit *)self cloudKitDatabase];
  id v15 = [(MPCloudKit *)self recordZoneAccessoryDatabase];
  id v16 = [v15 zoneID];
  [v14 deleteRecordZoneWithID:v16 completionHandler:&stru_100235180];

  id v17 = +[MPCloudKit_Manatee sharedInstance];

  if (v17)
  {
    id v18 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = +[MPCloudKit_Manatee sharedInstance];
      id v20 = [v19 recordZoneBlob];
      id v21 = [v20 zoneID];
      id v22 = [v21 zoneName];
      int v38 = 138412290;
      id v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Key Record Zone %@", (uint8_t *)&v38, 0xCu);
    }
    id v23 = +[MPCloudKit_Manatee sharedInstance];
    id v24 = [v23 cloudKitDatabase];
    id v25 = +[MPCloudKit_Manatee sharedInstance];
    id v26 = [v25 recordZoneBlob];
    id v27 = [v26 zoneID];
    [v24 deleteRecordZoneWithID:v27 completionHandler:&stru_1002351A0];

    id v28 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = +[MPCloudKit_Manatee sharedInstance];
      unint64_t v30 = [v29 recordZoneBlob];
      __int16 v31 = [v30 zoneID];
      id v32 = [v31 zoneName];
      int v38 = 138412290;
      id v39 = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " >>> resetOldZones Accessory Record Zone %@", (uint8_t *)&v38, 0xCu);
    }
    id v33 = +[MPCloudKit_Manatee sharedInstance];
    id v34 = [v33 cloudKitDatabase];
    id v35 = +[MPCloudKit_Manatee sharedInstance];
    id v36 = [v35 recordZoneAccessoryDatabase];
    unint64_t v37 = [v36 zoneID];
    [v34 deleteRecordZoneWithID:v37 completionHandler:&stru_1002351C0];
  }
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)@"com.apple.bluetooth";
}

- (OS_dispatch_queue)pushDelegateQueue
{
  unsigned __int8 v3 = [(MPCloudKit *)self pushQueue];

  if (!v3)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v4);
    [(MPCloudKit *)self setPushQueue:v5];
  }

  return [(MPCloudKit *)self pushQueue];
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4 = a3;
  if ([(MPCloudKit *)self manateeZoneUpgraded])
  {
    dispatch_queue_t v5 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "*****>>>> Push received for non-manatee but we have upgraded reset this container...", buf, 2u);
    }

    [(MPCloudKit *)self markLegacyNonManateeContainerMigrated];
  }
  else
  {
    id v6 = [v4 userInfo];
    uint64_t v7 = +[CKNotification notificationFromRemoteNotificationDictionary:v6];
    id v8 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 topic];
      *(_DWORD *)long long buf = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "***** APS Push received: %@ \n %@ \n", buf, 0x16u);
    }
    int v10 = [v7 containerIdentifier];
    unsigned int v11 = [v10 isEqualToString:@"com.apple.bluetooth"];

    if (v11)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100078764;
      void v12[3] = &unk_100232A10;
      id v13 = v7;
      uint64_t v14 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    }
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
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received public token \"%@\" on connection", (uint8_t *)&v6, 0xCu);
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
    int v10 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [v7 base64EncodedStringWithOptions:0];
      int v12 = 138412802;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection", (uint8_t *)&v12, 0x20u);
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

- (BOOL)isOldContainerResetInProcess
{
  return self->_isOldContainerResetInProcess;
}

- (void)setIsOldContainerResetInProcess:(BOOL)a3
{
  self->_isOldContainerResetInProcess = a3;
}

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
}

- (BOOL)pushReceived
{
  return self->_pushReceived;
}

- (void)setPushReceived:(BOOL)a3
{
  self->_pushReceived = a3;
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