@interface ICMigrationController
+ (BOOL)didChooseToMigrateLocalAccount;
+ (BOOL)didMigrateLocalAccount;
+ (BOOL)sharedControllerExists;
+ (BOOL)shouldHideICloudIMAPAccount;
+ (id)cloudKitAccountForIdentifier:(id)a3;
+ (id)ensureLegacyAccountIsValid:(id)a3;
+ (id)legacyAccountContext;
+ (id)legacyAccountForAccountIdentifier:(id)a3;
+ (id)legacyAccountForICloudACAccount:(id)a3;
+ (id)legacyAccountForPrimaryICloudAccount;
+ (id)legacyAccountNameForPrimaryICloudAccount;
+ (id)legacyAccountsBeingCopied;
+ (id)legacyLocalAccount;
+ (id)sharedController;
+ (id)stringFromMigrationState:(signed __int16)a3;
+ (signed)currentMigrationStateForAccountID:(id)a3;
+ (void)continueMigrationIfNecessary;
+ (void)initialize;
+ (void)migrateLocalAccountIfNecessary;
+ (void)pushMigrationStateToCloudForAccountID:(id)a3;
+ (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4;
+ (void)setDidChooseToMigrateLocalAccount:(BOOL)a3;
+ (void)setDidMigrateLocalAccount:(BOOL)a3;
+ (void)upgradeEmptyLocalLegacyAccountIfNecessary;
- (BOOL)isInternetReachable;
- (ICMigrationController)init;
- (NSMutableDictionary)currentMigrationStateByAccountID;
- (NSMutableDictionary)numberOfRetriesBySelector;
- (NSOperationQueue)operationQueue;
- (NSTimer)repeatingImportTimer;
- (id)importLegacyNotesForICloudAccountID:(id)a3 withCompletionHandler:(id)a4;
- (id)importNotesFromLegacyAccount:(id)a3 toAccount:(id)a4 renameFolders:(BOOL)a5 isPrimaryAccount:(BOOL)a6 withCompletionHandler:(id)a7;
- (id)legacyAccountObjectIDsBeingCopied;
- (signed)currentMigrationStateForAccountID:(id)a3;
- (unint64_t)numberOfRetriesForSelector:(SEL)a3 accountID:(id)a4;
- (void)accountsDidChange:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)cancelAllOperationsWithCompletionHandler:(id)a3;
- (void)clearRetryCountForSelector:(SEL)a3 accountID:(id)a4;
- (void)continueMigrationForICloudAccountID:(id)a3;
- (void)copyNotesFromLegacyAccount:(id)a3 toAccount:(id)a4;
- (void)dealloc;
- (void)disableLegacyAccount:(id)a3;
- (void)disableNotesForACAccount:(id)a3 inStore:(id)a4;
- (void)handleDarwinNotificationName:(id)a3;
- (void)migrationStateDidChange:(id)a3;
- (void)performFinalImportForICloudAccountID:(id)a3;
- (void)performFinalPushToCloudKitForAccountID:(id)a3;
- (void)performFinalRefreshForICloudAccountID:(id)a3;
- (void)reachabilityChanged:(id)a3;
- (void)refreshFolderContentsForICloudAccountID:(id)a3;
- (void)refreshFolderListForICloudAccountID:(id)a3;
- (void)resetNotificationObservers;
- (void)resetRetryCounts;
- (void)retryRefreshFolderContentsForICloudAccountID:(id)a3;
- (void)retryRefreshFolderListForICloudAccountID:(id)a3;
- (void)retrySelector:(SEL)a3 accountID:(id)a4;
- (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4;
- (void)setCurrentMigrationStateByAccountID:(id)a3;
- (void)setNumberOfRetries:(unint64_t)a3 forSelector:(SEL)a4 accountID:(id)a5;
- (void)setNumberOfRetriesBySelector:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRepeatingImportTimer:(id)a3;
- (void)startICloudImportOperationIfNecessary;
- (void)startMigrationForICloudAccountID:(id)a3;
- (void)startRepeatingImportTimer;
- (void)stopRepeatingImportTimer;
@end

@implementation ICMigrationController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    uint64_t v4 = kICDefaultsKeyDidMigrateLocalAccount;
    v5 = &__kCFBooleanFalse;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

+ (void)continueMigrationIfNecessary
{
  v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7048;
  block[3] = &unk_100627688;
  block[4] = a1;
  dispatch_async(v3, block);
}

+ (id)sharedController
{
  if (qword_1006AA1A0 != -1) {
    dispatch_once(&qword_1006AA1A0, &stru_100627FA0);
  }
  v2 = (void *)qword_1006AA198;

  return v2;
}

+ (BOOL)sharedControllerExists
{
  return qword_1006AA198 != 0;
}

- (ICMigrationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICMigrationController;
  v2 = [(ICMigrationController *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(ICMigrationController *)v2 setOperationQueue:v3];

    uint64_t v4 = [(ICMigrationController *)v2 operationQueue];
    [v4 setName:@"com.apple.notes.migration-queue"];

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(ICMigrationController *)v2 setCurrentMigrationStateByAccountID:v5];

    [(ICMigrationController *)v2 resetRetryCounts];
    [(ICMigrationController *)v2 resetNotificationObservers];
  }
  return v2;
}

- (void)dealloc
{
  [(ICMigrationController *)self stopRepeatingImportTimer];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v5.receiver = self;
  v5.super_class = (Class)ICMigrationController;
  [(ICMigrationController *)&v5 dealloc];
}

+ (BOOL)didMigrateLocalAccount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:kICDefaultsKeyDidMigrateLocalAccount];

  return v3;
}

+ (void)setDidMigrateLocalAccount:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 didMigrateLocalAccount] != a3)
  {
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = ICMigrationStateWillChangeNotification;
    CFStringRef v13 = @"ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey";
    v14 = &__kCFBooleanTrue;
    v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v4 postNotificationName:v5 object:0 userInfo:v6];

    objc_super v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setBool:v3 forKey:kICDefaultsKeyDidMigrateLocalAccount];

    v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = ICMigrationStateDidChangeNotification;
    CFStringRef v11 = @"ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey";
    v12 = &__kCFBooleanTrue;
    v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v10];
  }
}

+ (BOOL)didChooseToMigrateLocalAccount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:kICDefaultsKeyDidChooseToMigrateLocalAccount];

  return v3;
}

+ (void)setDidChooseToMigrateLocalAccount:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 didChooseToMigrateLocalAccount] != a3)
  {
    uint64_t v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:v3 forKey:kICDefaultsKeyDidChooseToMigrateLocalAccount];

    uint64_t v14 = ICLocalAccountDidChooseToMigrateKey;
    v6 = +[NSNumber numberWithBool:v3];
    v15 = v6;
    objc_super v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:ICLocalAccountDidChooseToMigrateNotification object:a1 userInfo:v7];

    uint64_t v9 = +[ICNoteContext sharedContext];
    v10 = [v9 managedObjectContext];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A7930;
    v12[3] = &unk_100625AF0;
    id v13 = v10;
    id v11 = v10;
    [v11 performBlockAndWait:v12];
  }
}

- (void)resetNotificationObservers
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = kReachabilityChangedNotification;
  objc_super v7 = +[ICReachability sharedReachabilityForInternetConnection];
  [v5 addObserver:self selector:"reachabilityChanged:" name:v6 object:v7];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"migrationStateDidChange:" name:ICMigrationStateDidChangeNotification object:0];

  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)migrationStateDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:ICMigrationStateChangeAccountID];

  id v6 = [v5 length];
  objc_super v7 = +[ICNoteContext sharedContext];
  v8 = [v7 managedObjectContext];
  if (v6)
  {
    uint64_t v9 = +[ICAccount accountWithIdentifier:v5 context:v8];
  }
  else
  {
    uint64_t v9 = +[ICAccount cloudKitAccountInContext:v8];

    [v9 identifier];
    uint64_t v5 = v7 = v5;
  }

  if ([v9 didChooseToMigrate]
    && [(id)objc_opt_class() currentMigrationStateForAccountID:v5] <= 1)
  {
    v10 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1004D93E4();
    }

    [(ICMigrationController *)self startMigrationForICloudAccountID:v5];
  }
}

- (void)accountsDidChange:(id)a3
{
  uint64_t v4 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9418();
  }

  [(ICMigrationController *)self cancelAllOperationsWithCompletionHandler:0];
}

+ (signed)currentMigrationStateForAccountID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ICMigrationController sharedController];
  signed __int16 v5 = (unsigned __int16)[v4 currentMigrationStateForAccountID:v3];

  return v5;
}

+ (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  id v6 = +[ICMigrationController sharedController];
  [v6 setCurrentMigrationState:v4 forAccountID:v5];
}

- (signed)currentMigrationStateForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = +[ICNoteContext sharedContext];
  id v6 = [v5 managedObjectContext];
  objc_super v7 = +[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:v4 context:v6];

  if (v7 && [v7 state])
  {
    signed __int16 v8 = (unsigned __int16)[v7 state];
  }
  else
  {
    uint64_t v9 = [(ICMigrationController *)self currentMigrationStateByAccountID];
    v10 = [v9 objectForKeyedSubscript:v4];

    if (v10)
    {
      id v11 = [(ICMigrationController *)self currentMigrationStateByAccountID];
      v12 = [v11 objectForKeyedSubscript:v4];
      signed __int16 v8 = (unsigned __int16)[v12 shortValue];
    }
    else
    {
      signed __int16 v8 = 0;
    }
  }

  return v8;
}

- (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  objc_super v7 = +[ICNoteContext sharedContext];
  signed __int16 v8 = [v7 managedObjectContext];

  uint64_t v9 = +[ICAccount accountWithIdentifier:v6 context:v8];
  id v10 = +[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:v6 context:v8];
  if ([v10 state] == v4)
  {
    id v11 = [(ICMigrationController *)self currentMigrationStateByAccountID];
    [v11 removeObjectForKey:v6];

    goto LABEL_26;
  }
  v12 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(id)objc_opt_class() stringFromMigrationState:v4];
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting current migration state: %@", buf, 0xCu);
  }
  if (!v10 && v9) {
    id v10 = +[ICDeviceMigrationState newDeviceMigrationStateWithDeviceIdentifier:v6 account:v9];
  }
  if (v10)
  {
    [v10 setState:v4];
    uint64_t v14 = +[NSDate date];
    [v10 setStateModificationDate:v14];

    [v10 updateChangeCountWithReason:@"Set migration state"];
  }
  else
  {
    v15 = +[NSNumber numberWithShort:v4];
    v16 = [(ICMigrationController *)self currentMigrationStateByAccountID];
    [v16 setObject:v15 forKeyedSubscript:v6];
  }
  +[ICNoteContext setLegacyNotesDisabled:0];
  if (v4 == 7)
  {
    if ([v9 didFinishMigration])
    {
      int v17 = 0;
    }
    else
    {
      int v17 = 1;
      [v9 setDidFinishMigration:1];
      [v9 updateChangeCountWithReason:@"Set migration state"];
    }
  }
  else
  {
    int v17 = 0;
    if ((int)v4 < 2) {
      goto LABEL_18;
    }
  }
  if ([v9 didChooseToMigrate])
  {
LABEL_18:
    v18 = +[ICNoteContext sharedContext];
    [v18 addOrDeleteLocalAccountIfNecessary];

    v19 = +[ICNoteContext sharedContext];
    [v19 save];
    goto LABEL_20;
  }
  v20 = +[NSNotificationCenter defaultCenter];
  uint64_t v21 = ICMigrationStateWillChangeNotification;
  uint64_t v22 = ICMigrationStateChangeUserInitiated;
  uint64_t v38 = ICMigrationStateChangeUserInitiated;
  v39 = &__kCFBooleanTrue;
  int v17 = 1;
  v23 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v20 postNotificationName:v21 object:0 userInfo:v23];

  [v9 setDidChooseToMigrate:1];
  [v9 updateChangeCountWithReason:@"Set migration state"];
  v24 = +[ICNoteContext sharedContext];
  [v24 addOrDeleteLocalAccountIfNecessary];

  v25 = +[ICNoteContext sharedContext];
  [v25 save];

  v19 = +[NSNotificationCenter defaultCenter];
  uint64_t v26 = ICMigrationStateDidChangeNotification;
  uint64_t v36 = v22;
  v37 = &__kCFBooleanTrue;
  v27 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  [v19 postNotificationName:v26 object:0 userInfo:v27];

LABEL_20:
  v28 = +[ICNoteContext sharedContext];
  v29 = [v28 primaryICloudACAccount];

  if (v17 && v29)
  {
    v30 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_1004D944C();
    }

    id v31 = [v9 didChooseToMigrate];
    id v32 = [v9 didFinishMigration];
    id v33 = [v9 didMigrateOnMac];
    v34 = [v29 accountStore];
    +[ICMigrationUtilities saveDidChooseToMigrate:v31 didFinishMigration:v32 didMigrateOnMac:v33 toACAccount:v29 inStore:v34 completionHandler:0];
  }
  [(id)objc_opt_class() pushMigrationStateToCloudForAccountID:v6];
  v35 = +[NSNotificationCenter defaultCenter];
  [v35 postNotificationName:@"ICCurrentDeviceMigrationStateDidChange" object:v10];

LABEL_26:
}

+ (id)stringFromMigrationState:(signed __int16)a3
{
  return +[ICDeviceMigrationState stringFromMigrationState:a3];
}

+ (BOOL)shouldHideICloudIMAPAccount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:kICInternalSettingsShowICloudIMAPAccountDefaultKey];

  if ((v3 & 1) == 0)
  {
    id v5 = +[ICNoteContext sharedContext];
    id v6 = [v5 managedObjectContext];
    objc_super v7 = +[ICAccount cloudKitAccountInContext:v6];

    if (([v7 didChooseToMigrate] & 1) == 0)
    {
      if (v7)
      {
        BOOL v4 = 0;
LABEL_10:

        return v4;
      }
      signed __int16 v8 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1004D9480();
      }
    }
    BOOL v4 = 1;
    goto LABEL_10;
  }
  return 0;
}

- (void)startMigrationForICloudAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() currentMigrationStateForAccountID:v4];
  id v6 = os_log_create("com.apple.notes", "Migration");
  objc_super v7 = v6;
  if (v5 < 2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1004D94B4();
    }
  }
  else
  {
    signed __int16 v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(id)objc_opt_class() stringFromMigrationState:v5];
      int v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting migration for iCloud account, but the current state is (%@)", (uint8_t *)&v15, 0xCu);
    }
  }

  id v10 = +[ICNoteContext sharedContext];
  id v11 = [v10 managedObjectContext];
  v12 = +[ICAccount localAccountInContext:v11];

  if (v12)
  {
    BOOL v13 = 1;
    if (([v12 hasAnyCustomFoldersIncludingSystem:1] & 1) == 0) {
      BOOL v13 = [v12 visibleNotesIncludingTrashCount] != 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  uint64_t v14 = +[NSNumber numberWithBool:v13];
  +[ICSettingsUtilities setObject:v14 forKey:@"LocalNotes"];

  [(id)objc_opt_class() setCurrentMigrationState:2 forAccountID:v4];
  [(ICMigrationController *)self continueMigrationForICloudAccountID:v4];
}

- (void)continueMigrationForICloudAccountID:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D951C();
  }

  id v6 = +[ICAccountUtilities sharedInstance];
  objc_super v7 = [v6 iCloudACAccountWithIdentifier:v4];

  if (v7
    && [v7 isEnabledForDataclass:ACAccountDataclassNotes]
    && (objc_msgSend(v7, "ic_hasICloudEmailAddress") & 1) == 0)
  {
    id v10 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to continue migration, but there is no iCloud email address. Finishing now.", buf, 2u);
    }

    [(id)objc_opt_class() setCurrentMigrationState:7 forAccountID:v4];
  }
  else
  {
    signed __int16 v8 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v7];

    if (!v8)
    {
      uint64_t v9 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No legacy account when continuing migration", buf, 2u);
      }
    }
  }
  id v11 = [(id)objc_opt_class() currentMigrationStateForAccountID:v4];
  switch((int)v11)
  {
    case 0:
    case 1:
    case 7:
      v12 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(id)objc_opt_class() stringFromMigrationState:v11];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No action to perform for migration state (%@)", buf, 0xCu);
      }
      goto LABEL_20;
    case 2:
    case 3:
    case 4:
      uint64_t v14 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1004D94E8();
      }

      v12 = +[ICCloudContext sharedContext];
      int v15 = +[ICCloudContext notesZoneID];
      v19 = v15;
      v16 = +[NSArray arrayWithObjects:&v19 count:1];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000A8A94;
      v17[3] = &unk_100627FC8;
      v17[4] = self;
      id v18 = v4;
      [v12 fetchRecordZoneChangesForZoneIDs:v16 accountID:v18 reason:@"StartingMigration" completionHandler:v17];

LABEL_20:
      break;
    case 5:
      [(ICMigrationController *)self performFinalImportForICloudAccountID:v4];
      break;
    case 6:
      [(ICMigrationController *)self performFinalPushToCloudKitForAccountID:v4];
      break;
    default:
      break;
  }
}

+ (void)migrateLocalAccountIfNecessary
{
  if ([a1 didChooseToMigrateLocalAccount])
  {
    if ([a1 didMigrateLocalAccount])
    {
      unsigned __int8 v3 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_1004D9584();
      }
    }
    else
    {
      unsigned __int8 v3 = [a1 legacyLocalAccount];
      os_log_t v4 = os_log_create("com.apple.notes", "Migration");
      os_log_t v5 = v4;
      if (v3)
      {
        id v6 = v4;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          sub_1004D95EC(a1, v3, v6);
        }

        objc_super v7 = +[ICNoteContext sharedContext];
        signed __int16 v8 = [v7 managedObjectContext];
        uint64_t v9 = +[ICAccount localAccountInContext:v8];

        if (v9) {
          goto LABEL_12;
        }
        id v10 = +[NSNotificationCenter defaultCenter];
        uint64_t v11 = ICMigrationStateWillChangeNotification;
        CFStringRef v25 = @"ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey";
        uint64_t v26 = &__kCFBooleanTrue;
        v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        [v10 postNotificationName:v11 object:0 userInfo:v12];

        BOOL v13 = +[ICNoteContext sharedContext];
        uint64_t v14 = [v13 managedObjectContext];
        uint64_t v9 = +[ICAccount newLocalAccountInContext:v14];

        int v15 = +[ICNoteContext sharedContext];
        [v15 save];

        v16 = +[NSNotificationCenter defaultCenter];
        uint64_t v17 = ICMigrationStateDidChangeNotification;
        CFStringRef v23 = @"ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey";
        v24 = &__kCFBooleanTrue;
        id v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v16 postNotificationName:v17 object:0 userInfo:v18];

        if (v9)
        {
LABEL_12:
          v19 = [a1 sharedController];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1000A8F6C;
          v22[3] = &unk_100627FE8;
          v22[4] = a1;
          id v20 = [v19 importNotesFromLegacyAccount:v3 toAccount:v9 renameFolders:0 isPrimaryAccount:1 withCompletionHandler:v22];
        }
        else
        {
          uint64_t v9 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to import the local account because we couldn't create a modern local account", v21, 2u);
          }
        }
      }
      else
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          sub_1004D95B8();
        }

        [a1 setDidMigrateLocalAccount:1];
      }
    }
  }
  else
  {
    unsigned __int8 v3 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1004D96F0();
    }
  }
}

+ (void)upgradeEmptyLocalLegacyAccountIfNecessary
{
  if (([a1 didChooseToMigrateLocalAccount] & 1) == 0)
  {
    id v7 = [a1 legacyAccountContext];
    unsigned __int8 v3 = [a1 legacyLocalAccount];
    os_log_t v4 = ICProtocolCast();

    if (!v4
      || ([v4 objectID],
          os_log_t v5 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v6 = [v7 nonEmptyNoteExistsForLegacyAccountWithObjectID:v5],
          v5,
          (v6 & 1) == 0))
    {
      [a1 setDidChooseToMigrateLocalAccount:1];
      [a1 migrateLocalAccountIfNecessary];
    }
  }
}

- (void)performFinalImportForICloudAccountID:(id)a3
{
  id v4 = a3;
  os_log_t v5 = +[ICAccountUtilities sharedInstance];
  unsigned __int8 v6 = [v5 iCloudACAccountWithIdentifier:v4];

  id v7 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v6];
  signed __int16 v8 = os_log_create("com.apple.notes", "Migration");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      sub_1004D978C();
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A928C;
    v11[3] = &unk_100628010;
    v11[4] = self;
    id v12 = v4;
    id v10 = [(ICMigrationController *)self importLegacyNotesForICloudAccountID:v12 withCompletionHandler:v11];
  }
  else
  {
    if (v9) {
      sub_1004D9758();
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(ICMigrationController *)self retrySelector:"continueMigrationForICloudAccountID:" accountID:v4];
  }
}

- (id)importLegacyNotesForICloudAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  signed __int16 v8 = +[ICAccountUtilities sharedInstance];
  BOOL v9 = [v8 iCloudACAccountWithIdentifier:v6];

  id v10 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v9];
  uint64_t v11 = os_log_create("com.apple.notes", "Migration");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      sub_1004D985C();
    }

    uint64_t v11 = [(id)objc_opt_class() cloudKitAccountForIdentifier:v6];
    BOOL v13 = [(ICMigrationController *)self importNotesFromLegacyAccount:v10 toAccount:v11 renameFolders:0 isPrimaryAccount:1 withCompletionHandler:v7];
  }
  else
  {
    if (v12) {
      sub_1004D9828();
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (id)importNotesFromLegacyAccount:(id)a3 toAccount:(id)a4 renameFolders:(BOOL)a5 isPrimaryAccount:(BOOL)a6 withCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v29 = a7;
  v30 = v12;
  BOOL v13 = 0;
  id v31 = v11;
  if (v11 && v12)
  {
    BOOL v13 = [[ICImportLegacyAccountOperation alloc] initWithLegacyAccount:v11 destinationAccount:v12 renameFolders:v9];
    [(ICImportLegacyAccountOperation *)v13 setCopyingPrimaryAccount:v8];
    if (v13)
    {
      objc_initWeak(&location, v13);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000A9758;
      v36[3] = &unk_100628060;
      objc_copyWeak(&v39, &location);
      id v38 = v29;
      id v14 = v11;
      id v37 = v14;
      [(ICImportLegacyAccountOperation *)v13 setCompletionBlock:v36];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      int v15 = [(ICMigrationController *)self operationQueue];
      v16 = [v15 operations];
      id v17 = [v16 copy];

      id v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v22 = [v21 legacyAccountObjectID];
            CFStringRef v23 = [v14 objectID];
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              [(ICImportLegacyAccountOperation *)v13 addDependency:v21];
              [v21 cancel];
            }
          }
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v18);
      }

      CFStringRef v25 = [(ICMigrationController *)self operationQueue];
      [v25 addOperation:v13];

      uint64_t v26 = v13;
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

- (void)cancelAllOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_log_t v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9998();
  }

  [(ICMigrationController *)self resetNotificationObservers];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  +[NSObject cancelPreviousPerformRequestsWithTarget:objc_opt_class()];
  [(ICMigrationController *)self stopRepeatingImportTimer];
  id v6 = [(ICMigrationController *)self operationQueue];
  [v6 cancelAllOperations];

  id v7 = dispatch_get_global_queue(-2, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A99F4;
  v9[3] = &unk_100625B40;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)startRepeatingImportTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9B48;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopRepeatingImportTimer
{
  unsigned __int8 v3 = [(ICMigrationController *)self repeatingImportTimer];
  [v3 invalidate];

  [(ICMigrationController *)self setRepeatingImportTimer:0];
}

- (void)startICloudImportOperationIfNecessary
{
  unsigned __int8 v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 workerManagedObjectContext];

  os_log_t v5 = +[ICDeviceMigrationState deviceMigrationStatesByAccountIDInContext:v4];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v6 = [v5 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (!v7)
  {

LABEL_29:
    [(ICMigrationController *)self stopRepeatingImportTimer];
    goto LABEL_30;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v52;
  id v37 = v4;
  v40 = v5;
  v41 = self;
  uint64_t v38 = *(void *)v52;
  id v39 = v6;
  do
  {
    id v11 = 0;
    id v42 = v8;
    do
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v11);
      BOOL v13 = [v5 objectForKeyedSubscript:v12, v37];
      unsigned int v14 = [v13 shortValue];

      if (v14 - 3 > 1)
      {
        id v17 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = v12;
          id v31 = objc_opt_class();
          long long v32 = [v31 stringFromMigrationState:[objc_opt_class() currentMigrationStateForAccountID:v30]];
          *(_DWORD *)buf = 138412290;
          v56 = v32;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "The timer fired to start another iCloud import operation, but we're not in the right state (%@)", buf, 0xCu);
        }
        long long v33 = v17;
      }
      else
      {
        v44 = v11;
        int v15 = +[ICAccountUtilities sharedInstance];
        uint64_t v16 = [v15 iCloudACAccountWithIdentifier:v12];

        v43 = v16;
        id v17 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v16];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v18 = [(ICMigrationController *)self operationQueue];
        uint64_t v19 = [v18 operations];
        id v20 = [v19 copy];

        id v21 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v48;
LABEL_9:
          unsigned int v24 = 0;
          while (1)
          {
            uint64_t v25 = v12;
            if (*(void *)v48 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v24);
            v27 = [v26 legacyAccountObjectID];
            v28 = [v17 objectID];
            unsigned __int8 v29 = [v27 isEqual:v28];

            if (v29) {
              break;
            }
            unsigned int v24 = (char *)v24 + 1;
            uint64_t v12 = v25;
            if (v22 == v24)
            {
              id v22 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
              if (v22) {
                goto LABEL_9;
              }
              goto LABEL_15;
            }
          }
          id v34 = v26;

          os_log_t v5 = v40;
          self = v41;
          uint64_t v10 = v38;
          id v6 = v39;
          id v8 = v42;
          uint64_t v12 = v25;
          id v11 = v44;
          if (v34) {
            goto LABEL_23;
          }
        }
        else
        {
LABEL_15:

          os_log_t v5 = v40;
          self = v41;
          uint64_t v10 = v38;
          id v6 = v39;
          id v8 = v42;
          id v11 = v44;
        }
        long long v35 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_1004D99CC(&v45, v46, v35);
        }

        uint64_t v36 = [(ICMigrationController *)self importLegacyNotesForICloudAccountID:v12 withCompletionHandler:0];
        [v36 setRandomizeImportOrder:1];

        id v34 = 0;
LABEL_23:

        char v9 = 1;
        long long v33 = v43;
      }

      id v11 = (char *)v11 + 1;
    }
    while (v11 != v8);
    id v8 = [v6 countByEnumeratingWithState:&v51 objects:v58 count:16];
  }
  while (v8);

  id v4 = v37;
  if ((v9 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_30:
}

- (void)performFinalPushToCloudKitForAccountID:(id)a3
{
  id v4 = a3;
  os_log_t v5 = +[ICAccountUtilities sharedInstance];
  id v6 = [v5 iCloudACAccountWithIdentifier:v4];

  id v7 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v6];
  id v8 = os_log_create("com.apple.notes", "Migration");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      sub_1004D9A40();
    }

    uint64_t v10 = +[ICCloudContext sharedContext];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AA1EC;
    v11[3] = &unk_100627FC8;
    v11[4] = self;
    id v12 = v4;
    [v10 syncWithReason:@"FinishingMigration" completionHandler:v11];
  }
  else
  {
    if (v9) {
      sub_1004D9A0C();
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(ICMigrationController *)self retrySelector:"continueMigrationForICloudAccountID:" accountID:v4];
  }
}

+ (void)pushMigrationStateToCloudForAccountID:(id)a3
{
  id v3 = a3;
  id v4 = +[ICNoteContext sharedContext];
  os_log_t v5 = [v4 managedObjectContext];
  id v6 = +[ICAccount cloudKitAccountWithIdentifier:v3 context:v5];

  if (!v6)
  {
    id v11 = os_log_create("com.apple.notes", "Migration");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v15 = "Trying to push migration state, but we don't have a CloudKit ICAccount";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_14;
  }
  uint64_t v7 = +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:v6];
  if (!v7)
  {
    id v11 = os_log_create("com.apple.notes", "Migration");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v15 = "Trying to push migration state, but we don't have a device migration state";
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  BOOL v9 = +[ICCloudContext sharedContext];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AA644;
  v21[3] = &unk_100625A00;
  id v10 = v6;
  id v22 = v10;
  id v11 = v8;
  uint64_t v23 = v11;
  id v12 = v9;
  id v24 = v12;
  BOOL v13 = objc_retainBlock(v21);
  unsigned int v14 = [v10 userRecordName];

  if (v14)
  {
    ((void (*)(void *))v13[2])(v13);
  }
  else
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No user record name when changing migration state. Fetching now.", buf, 2u);
    }

    id v17 = [v10 identifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000AAA44;
    v18[3] = &unk_1006280A8;
    id v19 = v10;
    id v20 = v13;
    [v12 fetchUserRecordWithAccountID:v17 completionHandler:v18];
  }
LABEL_14:
}

+ (id)legacyAccountsBeingCopied
{
  if ([a1 sharedControllerExists])
  {
    id v3 = +[NSMutableArray array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [a1 sharedController];
    os_log_t v5 = [v4 legacyAccountObjectIDsBeingCopied];

    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v20;
      *(void *)&long long v7 = 138412546;
      long long v17 = v7;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
          id v12 = [a1 legacyAccountContext:v17];
          id v18 = 0;
          BOOL v13 = [v12 existingObjectWithID:v11 error:&v18];
          id v14 = v18;

          if (v14)
          {
            int v15 = os_log_create("com.apple.notes", "Migration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              uint64_t v24 = v11;
              __int16 v25 = 2112;
              id v26 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error fetching account being copied (%@): %@", buf, 0x16u);
            }
          }
          if (v13) {
            [v3 addObject:v13];
          }

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return v3;
}

- (id)legacyAccountObjectIDsBeingCopied
{
  id v3 = [(id)objc_opt_class() legacyAccountForPrimaryICloudAccount];
  long long v20 = [(id)objc_opt_class() legacyLocalAccount];
  long long v19 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(ICMigrationController *)self operationQueue];
  os_log_t v5 = [v4 operations];
  id v6 = [v5 copy];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [v11 legacyAccountObjectID];
        BOOL v13 = [v3 objectID];
        if ([v12 isEqual:v13])
        {
        }
        else
        {
          id v14 = [v11 legacyAccountObjectID];
          int v15 = [v20 objectID];
          unsigned __int8 v16 = [v14 isEqual:v15];

          if (v16) {
            continue;
          }
          id v12 = [v11 legacyAccountObjectID];
          [v19 addObject:v12];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  id v17 = [v19 copy];

  return v17;
}

- (void)copyNotesFromLegacyAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned __int8 v16 = sub_1000AB210;
  id v17 = sub_1000AB220;
  id v18 = [(id)objc_opt_class() ensureLegacyAccountIsValid:v6];
  id v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(id)v14[5] objectIdentifier];
    sub_1004D9B90(v9, buf, v8);
  }

  uint64_t v10 = v14[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AB228;
  v12[3] = &unk_1006280D0;
  void v12[4] = self;
  v12[5] = &v13;
  id v11 = [(ICMigrationController *)self importNotesFromLegacyAccount:v10 toAccount:v7 renameFolders:1 isPrimaryAccount:0 withCompletionHandler:v12];
  _Block_object_dispose(&v13, 8);
}

+ (id)ensureLegacyAccountIsValid:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v5 = [v3 objectID];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  objc_opt_class();
  id v7 = ICCheckedDynamicCast();
  unsigned int v8 = [v7 isDeleted];

  if (!v8)
  {
    id v12 = [v4 managedObjectContext];

    if (v12)
    {
      id v10 = v4;
    }
    else
    {
      uint64_t v13 = +[NotesApp sharedNotesApp];
      id v14 = [v13 noteContext];
      uint64_t v15 = [v14 managedObjectContext];

      unsigned __int8 v16 = [v4 objectID];
      id v10 = [v15 objectWithID:v16];
    }
  }
  else
  {
LABEL_4:
    uint64_t v9 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trying to ensure a legacy account is valid, but it's not", v17, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

- (void)reachabilityChanged:(id)a3
{
  unsigned int v4 = [(ICMigrationController *)self isInternetReachable];
  uint64_t v5 = os_log_create("com.apple.notes", "Migration");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      sub_1004D9C78();
    }

    [(ICMigrationController *)self resetRetryCounts];
    id v7 = +[ICNoteContext sharedContext];
    unsigned int v8 = [v7 snapshotManagedObjectContext];

    uint64_t v9 = +[ICDeviceMigrationState deviceMigrationStatesByAccountIDInContext:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [v9 allKeys];
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unsigned __int8 v16 = [v9 objectForKeyedSubscript:v15];
          unsigned int v17 = [v16 shortValue];

          if (v17 - 2 <= 4) {
            [(ICMigrationController *)self continueMigrationForICloudAccountID:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    if (v6) {
      sub_1004D9CAC();
    }

    [(ICMigrationController *)self stopRepeatingImportTimer];
  }
}

- (BOOL)isInternetReachable
{
  v2 = +[ICReachability sharedReachabilityForInternetConnection];
  id v3 = [v2 currentReachabilityStatus];

  return v3 != 0;
}

- (void)retrySelector:(SEL)a3 accountID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ICMigrationController *)self numberOfRetriesForSelector:a3 accountID:v6];
  [(ICMigrationController *)self setNumberOfRetries:v7 + 1 forSelector:a3 accountID:v6];
  double v8 = pow(3.0, (double)v7);
  if (v8 <= 300.0) {
    double v9 = v8;
  }
  else {
    double v9 = 300.0;
  }
  id v10 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9CE0(a3, v10, v9);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:a3 object:v6];
  [(ICMigrationController *)self performSelector:a3 withObject:v6 afterDelay:v9];
}

- (void)clearRetryCountForSelector:(SEL)a3 accountID:(id)a4
{
  id v6 = a4;
  id v9 = [(ICMigrationController *)self numberOfRetriesBySelector];
  unint64_t v7 = NSStringFromSelector(a3);
  double v8 = [v9 objectForKeyedSubscript:v7];
  [v8 removeObjectForKey:v6];
}

- (void)resetRetryCounts
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(ICMigrationController *)self setNumberOfRetriesBySelector:v3];
}

- (unint64_t)numberOfRetriesForSelector:(SEL)a3 accountID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ICMigrationController *)self numberOfRetriesBySelector];
  double v8 = NSStringFromSelector(a3);
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [v9 objectForKeyedSubscript:v6];

  id v11 = [v10 unsignedIntegerValue];
  return (unint64_t)v11;
}

- (void)setNumberOfRetries:(unint64_t)a3 forSelector:(SEL)a4 accountID:(id)a5
{
  id v8 = a5;
  id v9 = [(ICMigrationController *)self numberOfRetriesBySelector];
  id v10 = NSStringFromSelector(a4);
  id v14 = [v9 objectForKeyedSubscript:v10];

  if (!v14)
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = [(ICMigrationController *)self numberOfRetriesBySelector];
    id v12 = NSStringFromSelector(a4);
    [v11 setObject:v14 forKeyedSubscript:v12];
  }
  uint64_t v13 = +[NSNumber numberWithUnsignedInteger:a3];
  [v14 setObject:v13 forKeyedSubscript:v8];
}

+ (id)legacyAccountForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 legacyAccountContext];
  id v6 = +[ICLegacyAccountUtilities accountForAccountIdentifier:v4 context:v5];

  return v6;
}

+ (id)legacyAccountForICloudACAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_1000AB210;
    unsigned __int8 v16 = sub_1000AB220;
    id v17 = 0;
    uint64_t v5 = [a1 legacyAccountContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000ABC7C;
    v8[3] = &unk_1006280F8;
    id v10 = &v12;
    id v9 = v4;
    id v11 = a1;
    [v5 performBlockAndWait:v8];

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)legacyAccountForPrimaryICloudAccount
{
  v2 = [a1 legacyAccountContext];
  id v3 = +[ICLegacyAccountUtilities legacyAccountForPrimaryICloudAccountWithContext:v2];

  return v3;
}

+ (id)legacyAccountNameForPrimaryICloudAccount
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 primaryICloudACAccount];

  uint64_t v5 = [v4 username];
  if (![(__CFString *)v5 length])
  {
    id v6 = [a1 legacyAccountForPrimaryICloudAccount];
    uint64_t v7 = [v6 emailAddress];

    uint64_t v5 = (__CFString *)v7;
  }
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = &stru_10063F3D8;
  }
  id v9 = v8;

  return v9;
}

+ (id)cloudKitAccountForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ICAccountUtilities sharedInstance];
  uint64_t v5 = [v4 accountStore];

  id v6 = [v5 accountWithIdentifier:v3];
  uint64_t v7 = [v6 parentAccountIdentifier];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v3;
  }
  id v10 = v9;

  id v11 = +[ICNoteContext sharedContext];
  uint64_t v12 = [v11 managedObjectContext];
  uint64_t v13 = +[ICAccount cloudKitAccountWithIdentifier:v10 context:v12];

  return v13;
}

- (void)disableNotesForACAccount:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9D8C(v5);
  }

  [v5 setEnabled:0 forDataclass:ACAccountDataclassNotes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AC01C;
  v9[3] = &unk_100627628;
  id v10 = v5;
  id v8 = v5;
  [v6 saveAccount:v8 withCompletionHandler:v9];
}

+ (id)legacyAccountContext
{
  v2 = +[NotesApp sharedNotesApp];
  id v3 = [v2 noteContext];

  return v3;
}

- (void)handleDarwinNotificationName:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (char *)[(__CFString *)v4 rangeOfString:@"-"];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(__CFString *)v4 substringFromIndex:&v5[v6]];
    objc_opt_class();
    id v8 = [(id)objc_opt_class() legacyAccountForAccountIdentifier:v7];
    id v9 = ICCheckedDynamicCast();

    id v10 = +[ICAccountUtilities sharedInstance];
    id v11 = [v10 accountStore];

    uint64_t v12 = [v11 accountWithIdentifier:v7];
    uint64_t v13 = [v12 parentAccountIdentifier];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
    if (!v9)
    {
      long long v20 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1004D9FB4();
      }

      goto LABEL_34;
    }
    uint64_t v15 = [@"IMAPNotesAccountFolderHierarchySyncCompleteNotification-" stringByAppendingString:v7];
    unsigned int v16 = [(__CFString *)v4 isEqualToString:v15];

    if (v16)
    {
      unsigned int v17 = [(ICMigrationController *)self isInternetReachable];
      long long v18 = os_log_create("com.apple.notes", "Migration");
      long long v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1004D9FE8();
        }

        [(ICMigrationController *)self clearRetryCountForSelector:"refreshFolderListForICloudAccountID:" accountID:v13];
        [(id)objc_opt_class() setCurrentMigrationState:4 forAccountID:v13];
        [(ICMigrationController *)self refreshFolderContentsForICloudAccountID:v13];
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      __int16 v36 = 0;
      long long v24 = "Received a legacy folder hierarchy sync complete notification, but we're not connected to the internet.";
      long long v25 = (uint8_t *)&v36;
    }
    else
    {
      long long v21 = [@"IMAPNotesAccountFolderHierarchySyncFailedNotification-" stringByAppendingString:v7];
      unsigned int v22 = [(__CFString *)v4 isEqualToString:v21];

      if (v22)
      {
        long long v23 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to refresh legacy folder list for iCloud account", buf, 2u);
        }

        if ([(ICMigrationController *)self isInternetReachable]) {
          [(ICMigrationController *)self retryRefreshFolderListForICloudAccountID:v13];
        }
        goto LABEL_34;
      }
      id v26 = [@"IMAPNotesAccountContentSyncCompleteNotification-" stringByAppendingString:v7];
      unsigned int v27 = [(__CFString *)v4 isEqualToString:v26];

      if (!v27)
      {
        uint64_t v30 = [@"IMAPNotesAccountContentSyncFailedNotification-" stringByAppendingString:v7];
        unsigned int v31 = [(__CFString *)v4 isEqualToString:v30];

        if (v31)
        {
          long long v32 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to refresh legacy content for iCloud account", (uint8_t *)v33, 2u);
          }

          if ([(ICMigrationController *)self isInternetReachable]) {
            [(ICMigrationController *)self retryRefreshFolderContentsForICloudAccountID:v13];
          }
        }
        goto LABEL_34;
      }
      unsigned int v28 = [(ICMigrationController *)self isInternetReachable];
      unsigned __int8 v29 = os_log_create("com.apple.notes", "Migration");
      long long v19 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_1004DA01C();
        }

        [(ICMigrationController *)self clearRetryCountForSelector:"refreshFolderContentsForICloudAccountID:" accountID:v13];
        [(id)objc_opt_class() setCurrentMigrationState:5 forAccountID:v13];
        [(ICMigrationController *)self stopRepeatingImportTimer];
        [(ICMigrationController *)self performFinalImportForICloudAccountID:v13];
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_WORD *)id v34 = 0;
      long long v24 = "Received a legacy content sync complete notification, but we're not connected to the internet. Something is wrong.";
      long long v25 = v34;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
    goto LABEL_33;
  }
  uint64_t v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9F40();
  }
LABEL_35:
}

+ (id)legacyLocalAccount
{
  v2 = +[NotesApp sharedNotesApp];
  id v3 = [v2 noteContext];
  id v4 = [v3 localAccount];

  return v4;
}

- (void)performFinalRefreshForICloudAccountID:(id)a3
{
  id v4 = a3;
  id v5 = +[ICAccountUtilities sharedInstance];
  uint64_t v6 = [v5 iCloudACAccountWithIdentifier:v4];

  uint64_t v7 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v6];
  if (v7)
  {
    unsigned __int8 v8 = [(ICMigrationController *)self isInternetReachable];
    id v9 = os_log_create("com.apple.notes", "Migration");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        sub_1004DA084();
      }

      id v11 = [(id)objc_opt_class() currentMigrationStateForAccountID:v4];
      switch((int)v11)
      {
        case 0:
        case 1:
        case 5:
        case 6:
        case 7:
          id v9 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [(id)objc_opt_class() stringFromMigrationState:v11];
            int v14 = 138412290;
            uint64_t v15 = v12;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trying to perform the final refresh for the iCloud account, but our migration state is (%@)", (uint8_t *)&v14, 0xCu);
          }
          goto LABEL_14;
        case 2:
          [(id)objc_opt_class() setCurrentMigrationState:3 forAccountID:v4];
          goto LABEL_17;
        case 3:
LABEL_17:
          [(ICMigrationController *)self refreshFolderListForICloudAccountID:v4];
          break;
        case 4:
          [(ICMigrationController *)self refreshFolderContentsForICloudAccountID:v4];
          break;
        default:
          break;
      }
    }
    else
    {
      if (v10) {
        sub_1004DA0B8();
      }
LABEL_14:
    }
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1004DA050();
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(ICMigrationController *)self retrySelector:"continueMigrationForICloudAccountID:" accountID:v4];
  }
}

- (void)refreshFolderListForICloudAccountID:(id)a3
{
  id v4 = a3;
  id v5 = +[ICAccountUtilities sharedInstance];
  uint64_t v6 = [v5 iCloudACAccountWithIdentifier:v4];

  objc_opt_class();
  uint64_t v7 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v6];
  unsigned __int8 v8 = ICCheckedDynamicCast();

  id v9 = [v8 accountIdentifier];
  [(ICMigrationController *)self resetNotificationObservers];
  if (v9)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v11 = [@"IMAPNotesAccountFolderHierarchySyncCompleteNotification-" stringByAppendingString:v9];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000ACB04, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v13 = [@"IMAPNotesAccountFolderHierarchySyncFailedNotification-" stringByAppendingString:v9];
    CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)sub_1000ACB04, (CFStringRef)v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    int v14 = [sub_1000ACB0C() sharedConnection];
    LOBYTE(v13) = [v14 updateFolderListForAccountID:v9 andDataclasses:32 isUserRequested:1];

    uint64_t v15 = os_log_create("com.apple.notes", "Migration");
    unsigned int v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1004DA120();
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to refresh folder list from DataAccess iCloud account. DataAccess returned NO.", v18, 2u);
      }

      [(ICMigrationController *)self retryRefreshFolderListForICloudAccountID:v4];
    }
  }
  else
  {
    unsigned int v17 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1004DA0EC();
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(ICMigrationController *)self retrySelector:"continueMigrationForICloudAccountID:" accountID:v4];
  }
}

- (void)retryRefreshFolderListForICloudAccountID:(id)a3
{
}

- (void)refreshFolderContentsForICloudAccountID:(id)a3
{
  id v4 = a3;
  id v5 = +[ICAccountUtilities sharedInstance];
  uint64_t v6 = [v5 iCloudACAccountWithIdentifier:v4];

  objc_opt_class();
  uint64_t v7 = [(id)objc_opt_class() legacyAccountForICloudACAccount:v6];
  unsigned __int8 v8 = ICCheckedDynamicCast();

  id v9 = [v8 accountIdentifier];
  [(ICMigrationController *)self resetNotificationObservers];
  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v11 = [@"IMAPNotesAccountContentSyncCompleteNotification-" stringByAppendingString:v9];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000ACB04, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v13 = [@"IMAPNotesAccountContentSyncFailedNotification-" stringByAppendingString:v9];
    CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)sub_1000ACB04, (CFStringRef)v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    int v14 = [sub_1000ACB0C() sharedConnection];
    LOBYTE(v13) = [v14 updateContentsOfAllFoldersForAccountID:v9 andDataclasses:32 isUserRequested:1];

    uint64_t v15 = os_log_create("com.apple.notes", "Migration");
    unsigned int v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1004DA188();
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to refresh folder contents from DataAccess iCloud account. DataAccess returned NO.", v18, 2u);
      }

      [(ICMigrationController *)self retryRefreshFolderContentsForICloudAccountID:v4];
    }
  }
  else
  {
    unsigned int v17 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1004DA154();
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(ICMigrationController *)self retrySelector:"continueMigrationForICloudAccountID:" accountID:v4];
  }
}

- (void)retryRefreshFolderContentsForICloudAccountID:(id)a3
{
}

- (void)disableLegacyAccount:(id)a3
{
  id v4 = a3;
  id v11 = +[ACAccountStore defaultStore];
  id v5 = [v4 accountIdentifier];

  uint64_t v6 = [v11 accountWithIdentifier:v5];

  uint64_t v7 = [v6 displayAccount];
  unsigned __int8 v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  if (v10) {
    [(ICMigrationController *)self disableNotesForACAccount:v10 inStore:v11];
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 beginBackgroundTaskWithName:@"Cancel Migration" expirationHandler:&stru_100628118];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AD078;
  v6[3] = &unk_100627688;
  v6[4] = v5;
  [(ICMigrationController *)self cancelAllOperationsWithCompletionHandler:v6];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = objc_opt_class();

  [v3 performSelector:"continueMigrationIfNecessary" withObject:0 afterDelay:3.0];
}

- (NSMutableDictionary)currentMigrationStateByAccountID
{
  return self->_currentMigrationStateByAccountID;
}

- (void)setCurrentMigrationStateByAccountID:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSMutableDictionary)numberOfRetriesBySelector
{
  return self->_numberOfRetriesBySelector;
}

- (void)setNumberOfRetriesBySelector:(id)a3
{
}

- (NSTimer)repeatingImportTimer
{
  return self->_repeatingImportTimer;
}

- (void)setRepeatingImportTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingImportTimer, 0);
  objc_storeStrong((id *)&self->_numberOfRetriesBySelector, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_currentMigrationStateByAccountID, 0);
}

@end