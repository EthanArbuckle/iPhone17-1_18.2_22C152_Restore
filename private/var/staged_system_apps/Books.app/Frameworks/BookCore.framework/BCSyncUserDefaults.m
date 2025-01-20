@interface BCSyncUserDefaults
+ (BOOL)_isICloudDriveSyncOptedIn;
+ (BOOL)_q_archivedICloudDriveSyncOptedInBeforeInitialTCCSync;
+ (BOOL)archivedICloudDriveSyncOptedInBeforeInitialTCCSync;
+ (BOOL)isCloudKitSyncOptedIn;
+ (BOOL)isCollectionSyncOptedIn;
+ (BOOL)isGlobalICloudDriveSyncOptedIn;
+ (BOOL)isICloudDriveEnabledForBooks;
+ (BOOL)isICloudDriveSyncOptedIn;
+ (BOOL)isReadingNowSyncOptedIn;
+ (BOOL)isSignedIntoICloud;
+ (NSArray)userDefaultsKeysUsedForSyncing;
+ (id)makeOSStateHandler;
+ (void)initialize;
+ (void)syncDefaultsWithTCC;
+ (void)waitForPendingSyncIfNeeded;
@end

@implementation BCSyncUserDefaults

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v9[0] = @"BKLibrary.ReadingNow";
    v9[1] = @"BCSyncICloudDrive";
    v10[0] = &__kCFBooleanTrue;
    v10[1] = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 registerDefaults:v3];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iBooks.BCSyncUserDefaults", v6);
    v8 = (void *)qword_345CF8;
    qword_345CF8 = (uint64_t)v7;
  }
}

+ (BOOL)isSignedIntoICloud
{
  uint64_t v2 = +[BUAccountsProvider sharedProvider];
  unsigned int v3 = [v2 isUserSignedInToiCloud];

  v4 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isSignedIntoICloud = %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

+ (BOOL)isCloudKitSyncOptedIn
{
  +[BCSyncUserDefaults waitForPendingSyncIfNeeded];
  uint64_t v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isPrimaryAccountManagedAppleID];

  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"BCSyncCloudKit"];

  return v3 | v5;
}

+ (BOOL)isGlobalICloudDriveSyncOptedIn
{
  uint64_t v2 = +[BUAccountsProvider sharedProvider];
  unsigned int v3 = [v2 isGlobalICloudDriveSyncOptedIn];

  v4 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isGlobalICloudDriveSyncOptedIn = %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

+ (BOOL)isICloudDriveSyncOptedIn
{
  +[BCSyncUserDefaults waitForPendingSyncIfNeeded];

  return +[BCSyncUserDefaults _isICloudDriveSyncOptedIn];
}

+ (BOOL)_isICloudDriveSyncOptedIn
{
  uint64_t v2 = +[BUAccountsProvider sharedProvider];
  unsigned int v3 = [v2 isPrimaryAccountManagedAppleID];

  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"BCSyncICloudDrive"];

  v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"BCSyncCloudKit"];

  CFStringRef v8 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = @"NO";
    if (v3) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    int v13 = 138412802;
    CFStringRef v14 = v10;
    __int16 v15 = 2112;
    CFStringRef v16 = v11;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    __int16 v17 = 2112;
    CFStringRef v18 = v9;
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isICloudDriveSyncOptedIn isPrimaryAccountManagedAppleID = %@ isBCSyncICloudDriveUserDefaults = %@ isBCSyncCloudKitUserDefaults = %@", (uint8_t *)&v13, 0x20u);
  }

  return v3 | v5 & v7;
}

+ (BOOL)archivedICloudDriveSyncOptedInBeforeInitialTCCSync
{
  if (qword_345D08 != -1) {
    dispatch_once(&qword_345D08, &stru_2C9018);
  }
  return byte_345D00;
}

+ (BOOL)_q_archivedICloudDriveSyncOptedInBeforeInitialTCCSync
{
  if (qword_345D18 != -1) {
    dispatch_once(&qword_345D18, &stru_2C9058);
  }
  return byte_345D10;
}

+ (BOOL)isICloudDriveEnabledForBooks
{
  uint64_t v2 = +[BCICloudIdentityToken tokenForCurrentIdentityIfICloudDriveEnabled];

  unsigned int v3 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isICloudDriveEnabledForBooks = %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 != 0;
}

+ (BOOL)isCollectionSyncOptedIn
{
  return 1;
}

+ (BOOL)isReadingNowSyncOptedIn
{
  uint64_t v2 = +[BUAccountsProvider sharedProvider];
  if ([v2 isPrimaryAccountManagedAppleID])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    CFStringRef v4 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v4 BOOLForKey:@"BKLibrary.ReadingNow"];
  }
  return v3;
}

+ (void)waitForPendingSyncIfNeeded
{
}

+ (void)syncDefaultsWithTCC
{
  uint64_t v2 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl(&def_7D91C, v2, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: syncDefaultsWithTCC", v3, 2u);
  }

  dispatch_async((dispatch_queue_t)qword_345CF8, &stru_2C9098);
}

+ (NSArray)userDefaultsKeysUsedForSyncing
{
  if (qword_345D30 != -1) {
    dispatch_once(&qword_345D30, &stru_2C90F8);
  }
  uint64_t v2 = (void *)qword_345D28;

  return (NSArray *)v2;
}

+ (id)makeOSStateHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E82B0;
  v4[3] = &unk_2C9118;
  v4[4] = a1;
  id v2 = [objc_alloc((Class)BUOSStateHandler) initWithTitle:@"BCSyncUserDefaults" block:v4];

  return v2;
}

@end