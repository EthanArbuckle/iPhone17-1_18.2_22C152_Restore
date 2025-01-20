@interface BAApplicationInfo
+ (BOOL)applicationForIdentifierAllowsBackgroundActivity:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)classesForSerialization;
+ (id)extensionContainingApplicationList;
+ (id)extensionPointQueriesWithPostProcessing:(BOOL)a3;
- (BAApplicationInfo)initWithCoder:(id)a3;
- (BAApplicationInfo)initWithIdentifier:(id)a3;
- (BAApplicationInfo)initWithIdentifier:(id)a3 applicationTeamIdentifier:(id)a4;
- (BAExtensionRuntime)currentRuntime;
- (BOOL)_consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5;
- (BOOL)allowsBackgroundActivity;
- (BOOL)awaitingNetworkConsent;
- (BOOL)consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5;
- (BOOL)hasLaunchedApplication;
- (BOOL)initialRestrictionsAreEnforced;
- (BOOL)isEqual:(id)a3;
- (BOOL)permittedForInitialBackgroundActivity;
- (BOOL)receivedInstalledNotification;
- (BOOL)receivedInstallingNotification;
- (BOOL)setAwaitingNetworkConsent:(BOOL)a3;
- (BOOL)shouldDoPeriodicCheck;
- (BOOL)shouldLaunchExtension;
- (BOOL)userForceQuitApp;
- (NSData)persistentIdentifier;
- (NSDate)lastApplicationLaunchTime;
- (NSDate)lastPeriodicCheckTime;
- (NSMutableArray)allowedDownloadDomainWildcards;
- (NSMutableArray)allowedDownloadDomains;
- (NSMutableArray)extensionRuntimeEvents;
- (NSMutableDictionary)blocksAwaitingNetworkConsent;
- (NSRecursiveLock)appInfoRecursiveLock;
- (NSString)applicationIdentifier;
- (NSString)applicationTeamIdentifier;
- (NSURL)manifestURL;
- (double)extensionRuntime;
- (id)_serializableAllowedDomainInfo;
- (id)applicationSecurityGroups;
- (id)debugDescription;
- (id)extensionIdentity;
- (int64_t)applicationExtensionState;
- (int64_t)applicationState;
- (int64_t)installSource;
- (unint64_t)_remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4;
- (unint64_t)essentialAmountDownloaded;
- (unint64_t)essentialAssetDownloadAllowance;
- (unint64_t)initialBackgroundCellularPolicy;
- (unint64_t)optionalAmountDownloaded;
- (unint64_t)optionalAssetDownloadAllowance;
- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3;
- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4;
- (void)_debugConsumeTime:(double)a3;
- (void)_populateAllowedDomainInfoWithArray:(id)a3;
- (void)applicationInstalled;
- (void)applicationInstallingWithUpdateInstall:(BOOL)a3;
- (void)applicationLaunched;
- (void)applicationPrepareWithDescriptor:(id)a3;
- (void)determineInstallSourceIfUnsetFromAuditToken:(id *)a3;
- (void)donePeriodicCheck;
- (void)encodeWithCoder:(id)a3;
- (void)extensionExited;
- (void)performAfterNetworkConsentProvided:(id)a3 queue:(id)a4;
- (void)resetExtensionRuntime;
- (void)setAllowedDownloadDomainWildcards:(id)a3;
- (void)setAllowedDownloadDomains:(id)a3;
- (void)setAppInfoRecursiveLock:(id)a3;
- (void)setApplicationExtensionState:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationState:(int64_t)a3;
- (void)setApplicationTeamIdentifier:(id)a3;
- (void)setCurrentRuntime:(id)a3;
- (void)setEssentialAmountDownloaded:(unint64_t)a3;
- (void)setEssentialAssetDownloadAllowance:(unint64_t)a3;
- (void)setExtensionRuntimeEvents:(id)a3;
- (void)setHasLaunchedApplication:(BOOL)a3;
- (void)setInitialBackgroundCellularPolicy:(unint64_t)a3;
- (void)setInstallSource:(int64_t)a3;
- (void)setLastApplicationLaunchTime:(id)a3;
- (void)setLastPeriodicCheckTime:(id)a3;
- (void)setManifestURL:(id)a3;
- (void)setOptionalAmountDownloaded:(unint64_t)a3;
- (void)setOptionalAssetDownloadAllowance:(unint64_t)a3;
- (void)setPermittedForInitialBackgroundActivity:(BOOL)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setReceivedInstalledNotification:(BOOL)a3;
- (void)setReceivedInstallingNotification:(BOOL)a3;
- (void)setUserForceQuitApp:(BOOL)a3;
- (void)updateApplicationWithInfoDictionary:(id)a3 applicationRecord:(id)a4 overrides:(id)a5;
- (void)willLaunchExtension;
@end

@implementation BAApplicationInfo

+ (BOOL)applicationForIdentifierAllowsBackgroundActivity:(id)a3
{
  id v3 = a3;
  if (qword_1000695C0 != -1) {
    dispatch_once(&qword_1000695C0, &stru_10005D778);
  }
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because device is in low power mode.", (uint8_t *)&v13, 0xCu);
    }
    BOOL v7 = 0;
  }
  else
  {
    v6 = +[MCProfileConnection sharedConnection];
    if ([v6 isAutomaticAppUpdatesAllowed])
    {
      v8 = [(id)qword_1000695B8 objectForKey:@"KeepAppsUpToDateAppList"];
      v9 = [v8 objectForKey:v3];
      v10 = v9;
      if (v9 && ([v9 BOOLValue] & 1) == 0)
      {
        v11 = sub_100013ABC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          id v14 = v3;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because background app refresh for this app is disabled.", (uint8_t *)&v13, 0xCu);
        }

        BOOL v7 = 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      v8 = sub_100013ABC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because background app refresh is globally disabled.", (uint8_t *)&v13, 0xCu);
      }
      BOOL v7 = 0;
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_1000695D0 != -1) {
    dispatch_once(&qword_1000695D0, &stru_10005D798);
  }
  v2 = (void *)qword_1000695C8;

  return v2;
}

+ (id)extensionPointQueriesWithPostProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[_EXQuery extensionPointIdentifierQuery:@"com.apple.background-asset-downloader-extension"];
  v17 = v4;
  unsigned int v5 = +[NSArray arrayWithObjects:&v17 count:1];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setIncludePostprocessing:v3];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)extensionContainingApplicationList
{
  id v23 = +[NSMutableArray array];
  v22 = [(id)objc_opt_class() extensionPointQueriesWithPostProcessing:1];
  v2 = +[_EXQueryController executeQueries:](_EXQueryController, "executeQueries:");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = &AnalyticsSendEvent_ptr;
    p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
    uint64_t v7 = *(void *)v27;
    uint64_t v24 = *(void *)v27;
    do
    {
      id v8 = 0;
      id v25 = v4;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v8);
        v10 = [v9 containingBundleRecord];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v10 bundleIdentifier];
          if (v11)
          {
            long long v12 = [v9 entitlementNamed:p_class_meths[94] ofClass:objc_opt_class()];
            id v13 = objc_alloc((Class)NSBundle);
            long long v14 = [v10 URL];
            id v15 = [v13 _initUniqueWithURL:v14];

            v16 = [v15 infoDictionary];
            v17 = [[BAApplicationInfo alloc] initWithIdentifier:v11 applicationTeamIdentifier:v12];
            if (v17)
            {
              [v23 addObject:v17];
              if (v16)
              {
                +[BAApplicationConfigurationOverrides overridesForAppBundleIdentifier:v11];
                v18 = v5;
                v20 = v19 = v2;
                [(BAApplicationInfo *)v17 updateApplicationWithInfoDictionary:v16 applicationRecord:v10 overrides:v20];

                v2 = v19;
                unsigned int v5 = v18;
                p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
              }
            }

            uint64_t v7 = v24;
            id v4 = v25;
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v4 != v8);
      id v4 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }

  return v23;
}

- (BAApplicationInfo)initWithIdentifier:(id)a3
{
  return [(BAApplicationInfo *)self initWithIdentifier:a3 applicationTeamIdentifier:0];
}

- (BAApplicationInfo)initWithIdentifier:(id)a3 applicationTeamIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)BAApplicationInfo;
  id v8 = [(BAApplicationInfo *)&v28 init];
  if (!v8) {
    goto LABEL_5;
  }
  if (!v6)
  {
    long long v26 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"identifier can not be nil" userInfo:0];
    [v26 raise];
LABEL_9:

    id v25 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = [v6 _baassets_validUTI];
  unsigned __int8 v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0)
  {
    long long v26 = sub_100013ABC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003B490();
    }
    goto LABEL_9;
  }
  id v11 = objc_alloc_init((Class)NSRecursiveLock);
  [(BAApplicationInfo *)v8 setAppInfoRecursiveLock:v11];

  long long v12 = [(BAApplicationInfo *)v8 appInfoRecursiveLock];
  id v13 = +[NSString stringWithFormat:@"%@ App Info Recursive Lock", v6];
  [v12 setName:v13];

  long long v14 = [(BAApplicationInfo *)v8 appInfoRecursiveLock];
  [v14 lock];

  [(BAApplicationInfo *)v8 setApplicationIdentifier:v6];
  [(BAApplicationInfo *)v8 setOptionalAmountDownloaded:0];
  [(BAApplicationInfo *)v8 setEssentialAmountDownloaded:0];
  [(BAApplicationInfo *)v8 setOptionalAssetDownloadAllowance:0];
  [(BAApplicationInfo *)v8 setEssentialAssetDownloadAllowance:0];
  [(BAApplicationInfo *)v8 setPermittedForInitialBackgroundActivity:0];
  [(BAApplicationInfo *)v8 setInitialBackgroundCellularPolicy:0];
  [(BAApplicationInfo *)v8 setReceivedInstallingNotification:0];
  [(BAApplicationInfo *)v8 setReceivedInstalledNotification:0];
  [(BAApplicationInfo *)v8 setHasLaunchedApplication:0];
  [(BAApplicationInfo *)v8 setApplicationTeamIdentifier:v7];
  [(BAApplicationInfo *)v8 setInstallSource:0];
  id v15 = +[NSMutableArray arrayWithCapacity:10];
  [(BAApplicationInfo *)v8 setExtensionRuntimeEvents:v15];

  v16 = +[NSDate distantPast];
  [(BAApplicationInfo *)v8 setLastPeriodicCheckTime:v16];

  v17 = +[NSDate distantPast];
  [(BAApplicationInfo *)v8 setLastApplicationLaunchTime:v17];

  [(BAApplicationInfo *)v8 setManifestURL:0];
  [(BAApplicationInfo *)v8 setUserForceQuitApp:0];
  v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  allowedDownloadDomains = v8->_allowedDownloadDomains;
  v8->_allowedDownloadDomains = v18;

  v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  allowedDownloadDomainWildcards = v8->_allowedDownloadDomainWildcards;
  v8->_allowedDownloadDomainWildcards = v20;

  v8->_awaitingNetworkConsent = 0;
  uint64_t v22 = +[NSMutableDictionary dictionary];
  blocksAwaitingNetworkConsent = v8->_blocksAwaitingNetworkConsent;
  v8->_blocksAwaitingNetworkConsent = (NSMutableDictionary *)v22;

  uint64_t v24 = [(BAApplicationInfo *)v8 appInfoRecursiveLock];
  [v24 unlock];

LABEL_5:
  id v25 = v8;
LABEL_10:

  return v25;
}

- (BAApplicationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BAApplicationInfo;
  unsigned int v5 = [(BAApplicationInfo *)&v42 init];
  if (!v5)
  {
LABEL_31:
    objc_super v28 = v5;
    goto LABEL_32;
  }
  id v6 = v4;
  id v7 = objc_alloc_init((Class)NSRecursiveLock);
  [(BAApplicationInfo *)v5 setAppInfoRecursiveLock:v7];

  id v8 = [(BAApplicationInfo *)v5 appInfoRecursiveLock];
  [v8 lock];

  uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_1000692F8[0]];
  [(BAApplicationInfo *)v5 setApplicationIdentifier:v9];

  unsigned __int8 v10 = [(BAApplicationInfo *)v5 applicationIdentifier];

  if (v10)
  {
    id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allowedDownloadDomains = v5->_allowedDownloadDomains;
    v5->_allowedDownloadDomains = v11;

    id v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allowedDownloadDomainWildcards = v5->_allowedDownloadDomainWildcards;
    v5->_allowedDownloadDomainWildcards = v13;

    -[BAApplicationInfo setPermittedForInitialBackgroundActivity:](v5, "setPermittedForInitialBackgroundActivity:", [v6 decodeBoolForKey:off_100069340[0]]);
    -[BAApplicationInfo setInitialBackgroundCellularPolicy:](v5, "setInitialBackgroundCellularPolicy:", [v6 decodeIntegerForKey:off_100069348[0]]);
    -[BAApplicationInfo setHasLaunchedApplication:](v5, "setHasLaunchedApplication:", [v6 decodeBoolForKey:off_100069360[0]]);
    id v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069368[0]];
    [(BAApplicationInfo *)v5 setLastApplicationLaunchTime:v15];

    v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069388[0]];
    [(BAApplicationInfo *)v5 setManifestURL:v16];

    v17 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069300[0]];
    [(BAApplicationInfo *)v5 setApplicationTeamIdentifier:v17];

    v18 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069378[0]];
    [(BAApplicationInfo *)v5 setLastPeriodicCheckTime:v18];

    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    v19 = +[NSArray arrayWithObjects:v44 count:2];
    v20 = +[NSSet setWithArray:v19];
    v21 = [v6 decodeObjectOfClasses:v20 forKey:@"extensionRuntimeEvents"];
    id v22 = [v21 mutableCopy];
    [(BAApplicationInfo *)v5 setExtensionRuntimeEvents:v22];

    v5->_awaitingNetworkConsent = 0;
    uint64_t v23 = +[NSMutableDictionary dictionary];
    blocksAwaitingNetworkConsent = v5->_blocksAwaitingNetworkConsent;
    v5->_blocksAwaitingNetworkConsent = (NSMutableDictionary *)v23;

    if ([v6 containsValueForKey:off_100069370[0]]) {
      -[BAApplicationInfo setUserForceQuitApp:](v5, "setUserForceQuitApp:", [v6 decodeBoolForKey:off_100069370[0]]);
    }
    if ([v6 containsValueForKey:off_100069338[0]])
    {
      uint64_t v25 = objc_opt_class();
      long long v26 = off_100069338[0];
    }
    else
    {
      if (![v6 containsValueForKey:off_100069328[0]])
      {
        [(BAApplicationInfo *)v5 setOptionalAssetDownloadAllowance:0];
LABEL_12:
        if ([v6 containsValueForKey:off_100069330[0]])
        {
          v30 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069330[0]];
          -[BAApplicationInfo setEssentialAssetDownloadAllowance:](v5, "setEssentialAssetDownloadAllowance:", [v30 unsignedLongLongValue]);
        }
        if ([v6 containsValueForKey:off_100069320[0]])
        {
          uint64_t v31 = objc_opt_class();
          v32 = off_100069320[0];
        }
        else
        {
          if (![v6 containsValueForKey:off_100069310[0]])
          {
            [(BAApplicationInfo *)v5 setOptionalAmountDownloaded:0];
            goto LABEL_20;
          }
          uint64_t v31 = objc_opt_class();
          v32 = off_100069310[0];
        }
        v33 = [v6 decodeObjectOfClass:v31 forKey:v32];
        -[BAApplicationInfo setOptionalAmountDownloaded:](v5, "setOptionalAmountDownloaded:", [v33 unsignedLongLongValue]);

LABEL_20:
        if ([v6 containsValueForKey:off_100069350[0]]) {
          uint64_t v34 = (uint64_t)[v6 decodeBoolForKey:off_100069350[0]];
        }
        else {
          uint64_t v34 = 1;
        }
        [(BAApplicationInfo *)v5 setReceivedInstallingNotification:v34];
        if ([v6 containsValueForKey:off_100069358[0]]) {
          uint64_t v35 = (uint64_t)[v6 decodeBoolForKey:off_100069358[0]];
        }
        else {
          uint64_t v35 = 1;
        }
        [(BAApplicationInfo *)v5 setReceivedInstalledNotification:v35];
        if ([v6 containsValueForKey:off_100069308[0]])
        {
          v36 = [v6 decodeObjectOfClass:objc_opt_class() forKey:off_100069308[0]];
          [(BAApplicationInfo *)v5 setPersistentIdentifier:v36];
        }
        if ([v6 containsValueForKey:off_100069390]) {
          -[BAApplicationInfo setInstallSource:](v5, "setInstallSource:", [v6 decodeIntegerForKey:off_100069390]);
        }
        v43[0] = objc_opt_class();
        v43[1] = objc_opt_class();
        v37 = +[NSArray arrayWithObjects:v43 count:2];
        v38 = +[NSSet setWithArray:v37];
        v39 = [v6 decodeObjectOfClasses:v38 forKey:off_100069380[0]];

        [(BAApplicationInfo *)v5 _populateAllowedDomainInfoWithArray:v39];
        v40 = [(BAApplicationInfo *)v5 appInfoRecursiveLock];
        [v40 unlock];

        goto LABEL_31;
      }
      uint64_t v25 = objc_opt_class();
      long long v26 = off_100069328[0];
    }
    long long v29 = [v6 decodeObjectOfClass:v25 forKey:v26];
    -[BAApplicationInfo setOptionalAssetDownloadAllowance:](v5, "setOptionalAssetDownloadAllowance:", [v29 unsignedLongLongValue]);

    goto LABEL_12;
  }
  long long v27 = [(BAApplicationInfo *)v5 appInfoRecursiveLock];
  [v27 unlock];

  objc_super v28 = 0;
LABEL_32:

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v27 = a3;
  id v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 lock];

  unsigned int v5 = [(BAApplicationInfo *)self applicationIdentifier];
  [v27 encodeObject:v5 forKey:off_1000692F8[0]];

  id v6 = +[NSNumber numberWithUnsignedLongLong:[(BAApplicationInfo *)self optionalAmountDownloaded]];
  [v27 encodeObject:v6 forKey:off_100069320[0]];

  id v7 = +[NSNumber numberWithUnsignedLongLong:[(BAApplicationInfo *)self essentialAmountDownloaded]];
  [v27 encodeObject:v7 forKey:off_100069318[0]];

  id v8 = +[NSNumber numberWithUnsignedLongLong:[(BAApplicationInfo *)self optionalAssetDownloadAllowance]];
  [v27 encodeObject:v8 forKey:off_100069338[0]];

  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:[(BAApplicationInfo *)self essentialAssetDownloadAllowance]];
  [v27 encodeObject:v9 forKey:off_100069330[0]];

  BOOL v10 = [(BAApplicationInfo *)self permittedForInitialBackgroundActivity];
  [v27 encodeBool:v10 forKey:off_100069340[0]];
  unint64_t v11 = [(BAApplicationInfo *)self initialBackgroundCellularPolicy];
  [v27 encodeInteger:v11 forKey:off_100069348[0]];
  BOOL v12 = [(BAApplicationInfo *)self receivedInstallingNotification];
  [v27 encodeBool:v12 forKey:off_100069350[0]];
  BOOL v13 = [(BAApplicationInfo *)self receivedInstalledNotification];
  [v27 encodeBool:v13 forKey:off_100069358[0]];
  BOOL v14 = [(BAApplicationInfo *)self hasLaunchedApplication];
  [v27 encodeBool:v14 forKey:off_100069360[0]];
  id v15 = [(BAApplicationInfo *)self lastApplicationLaunchTime];
  [v27 encodeObject:v15 forKey:off_100069368[0]];

  BOOL v16 = [(BAApplicationInfo *)self userForceQuitApp];
  [v27 encodeBool:v16 forKey:off_100069370[0]];
  v17 = [(BAApplicationInfo *)self lastPeriodicCheckTime];
  [v27 encodeObject:v17 forKey:off_100069378[0]];

  v18 = [(BAApplicationInfo *)self applicationTeamIdentifier];

  if (v18)
  {
    v19 = [(BAApplicationInfo *)self applicationTeamIdentifier];
    [v27 encodeObject:v19 forKey:off_100069300[0]];
  }
  v20 = [(BAApplicationInfo *)self persistentIdentifier];

  if (v20)
  {
    v21 = [(BAApplicationInfo *)self persistentIdentifier];
    [v27 encodeObject:v21 forKey:off_100069308[0]];
  }
  id v22 = [(BAApplicationInfo *)self _serializableAllowedDomainInfo];
  [v27 encodeObject:v22 forKey:off_100069380[0]];
  uint64_t v23 = [(BAApplicationInfo *)self manifestURL];
  [v27 encodeObject:v23 forKey:off_100069388[0]];

  uint64_t v24 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  [v27 encodeObject:v24 forKey:@"extensionRuntimeEvents"];

  int64_t v25 = [(BAApplicationInfo *)self installSource];
  [v27 encodeInteger:v25 forKey:off_100069390];
  long long v26 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v26 unlock];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BAApplicationInfo *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(BAApplicationInfo *)self applicationIdentifier];
      id v6 = [(BAApplicationInfo *)v4 applicationIdentifier];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (int64_t)applicationState
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  int64_t applicationState = self->_applicationState;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return applicationState;
}

- (void)setApplicationState:(int64_t)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_int64_t applicationState = a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [(BAApplicationInfo *)self applicationLaunched];
  }
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (int64_t)applicationExtensionState
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  int64_t applicationExtensionState = self->_applicationExtensionState;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return applicationExtensionState;
}

- (void)setApplicationExtensionState:(int64_t)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_int64_t applicationExtensionState = a3;
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (BOOL)userForceQuitApp
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  LOBYTE(v3) = self->_userForceQuitApp;
  id v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setUserForceQuitApp:(BOOL)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_userForceQuitApp = a3;
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (int64_t)installSource
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  int64_t installSource = self->_installSource;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return installSource;
}

- (void)setInstallSource:(int64_t)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_int64_t installSource = a3;
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (void)determineInstallSourceIfUnsetFromAuditToken:(id *)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  if (!self->_installSource)
  {
    id v6 = [(BAApplicationInfo *)self applicationIdentifier];
    long long v7 = *(_OWORD *)&a3->var0[4];
    v9[0] = *(_OWORD *)a3->var0;
    v9[1] = v7;
    self->_int64_t installSource = +[BAInstallationSourceUtilities installationSourceFromAuditToken:v9 applicationIdentifier:v6];
  }
  id v8 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v8 unlock];
}

- (NSMutableArray)allowedDownloadDomains
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = [(NSMutableArray *)self->_allowedDownloadDomains copy];
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return (NSMutableArray *)v4;
}

- (void)setAllowedDownloadDomains:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  id v6 = +[NSMutableArray arrayWithArray:v4];

  allowedDownloadDomains = self->_allowedDownloadDomains;
  self->_allowedDownloadDomains = v6;

  id v8 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v8 unlock];
}

- (NSMutableArray)allowedDownloadDomainWildcards
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = [(NSMutableArray *)self->_allowedDownloadDomainWildcards copy];
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return (NSMutableArray *)v4;
}

- (void)setAllowedDownloadDomainWildcards:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  id v6 = +[NSMutableArray arrayWithArray:v4];

  allowedDownloadDomainWildcards = self->_allowedDownloadDomainWildcards;
  self->_allowedDownloadDomainWildcards = v6;

  id v8 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v8 unlock];
}

- (void)applicationPrepareWithDescriptor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  [v4 clientType];
  [(BAApplicationInfo *)self setPermittedForInitialBackgroundActivity:sub_10001995C()];
  id v6 = [v4 cellularPolicy];

  [(BAApplicationInfo *)self setInitialBackgroundCellularPolicy:v6];
  long long v7 = sub_100013ABC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(BAApplicationInfo *)self applicationIdentifier];
    unsigned int v9 = [(BAApplicationInfo *)self permittedForInitialBackgroundActivity];
    CFStringRef v10 = @"NO";
    if (v9) {
      CFStringRef v10 = @"YES";
    }
    int v12 = 138543618;
    BOOL v13 = v8;
    __int16 v14 = 2114;
    CFStringRef v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing app using descriptor for: %{public}@. Permitted for initial background activity: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [(BAApplicationInfo *)self setReceivedInstalledNotification:0];
  unint64_t v11 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v11 unlock];
}

- (BOOL)receivedInstalledNotification
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  LOBYTE(v3) = self->_receivedInstalledNotification;
  id v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setReceivedInstalledNotification:(BOOL)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_receivedInstalledNotification = a3;
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (BOOL)receivedInstallingNotification
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  LOBYTE(v3) = self->_receivedInstallingNotification;
  id v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setReceivedInstallingNotification:(BOOL)a3
{
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  self->_receivedInstallingNotification = a3;
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (BOOL)awaitingNetworkConsent
{
  id v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  LOBYTE(v3) = self->_awaitingNetworkConsent;
  id v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 unlock];

  return (char)v3;
}

- (BOOL)setAwaitingNetworkConsent:(BOOL)a3
{
  int v3 = a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  int awaitingNetworkConsent = self->_awaitingNetworkConsent;
  if (awaitingNetworkConsent == v3)
  {
    unint64_t v11 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v11 unlock];
  }
  else
  {
    long long v7 = sub_100013ABC();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        unsigned int v9 = [(BAApplicationInfo *)self applicationIdentifier];
        int v15 = 138543362;
        BOOL v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "App awaiting network consent: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      id v10 = 0;
      self->_int awaitingNetworkConsent = v3;
    }
    else
    {
      if (v8)
      {
        int v12 = [(BAApplicationInfo *)self applicationIdentifier];
        int v15 = 138543362;
        BOOL v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "App no longer awaiting network consent: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      self->_int awaitingNetworkConsent = 0;
      id v10 = [(NSMutableDictionary *)self->_blocksAwaitingNetworkConsent copy];
      [(NSMutableDictionary *)self->_blocksAwaitingNetworkConsent removeAllObjects];
    }
    BOOL v13 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v13 unlock];

    if (v10)
    {
      [v10 enumerateKeysAndObjectsWithOptions:1 usingBlock:&stru_10005D7D8];
    }
  }
  return awaitingNetworkConsent != v3;
}

- (void)setPersistentIdentifier:(id)a3
{
  id v4 = (NSData *)a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  persistentIdentifier = self->_persistentIdentifier;
  self->_persistentIdentifier = v4;

  id v7 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v7 unlock];
}

- (NSData)persistentIdentifier
{
  int v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = self->_persistentIdentifier;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];

  return v4;
}

- (void)applicationInstallingWithUpdateInstall:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 lock];

  id v6 = sub_100013ABC();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      BOOL v8 = [(BAApplicationInfo *)self applicationIdentifier];
      int v11 = 138543362;
      int v12 = v8;
      unsigned int v9 = "Application is updating: %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    BOOL v8 = [(BAApplicationInfo *)self applicationIdentifier];
    int v11 = 138543362;
    int v12 = v8;
    unsigned int v9 = "Application is installing: %{public}@";
    goto LABEL_6;
  }

  [(BAApplicationInfo *)self setReceivedInstallingNotification:1];
  [(BAApplicationInfo *)self setReceivedInstalledNotification:0];
  [(BAApplicationInfo *)self setHasLaunchedApplication:0];
  [(BAApplicationInfo *)self setOptionalAmountDownloaded:0];
  [(BAApplicationInfo *)self setEssentialAmountDownloaded:0];
  [(BAApplicationInfo *)self resetExtensionRuntime];
  id v10 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v10 unlock];
}

- (void)applicationInstalled
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = sub_100013ABC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(BAApplicationInfo *)self applicationIdentifier];
    int v7 = 138543362;
    BOOL v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Application installed to final location: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(BAApplicationInfo *)self setReceivedInstallingNotification:1];
  [(BAApplicationInfo *)self setReceivedInstalledNotification:1];
  id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (void)updateApplicationWithInfoDictionary:(id)a3 applicationRecord:(id)a4 overrides:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [v8 objectForKey:@"BAInitialDownloadRestrictions"];
  int v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 objectForKey:@"BADownloadDomainAllowList"];
    __int16 v14 = [v12 objectForKey:@"BAEssentialDownloadAllowance"];
    int v15 = [v12 objectForKey:@"BADownloadAllowance"];
  }
  else
  {
    int v15 = 0;
    __int16 v14 = 0;
    BOOL v13 = 0;
  }
  BOOL v16 = [v8 objectForKey:@"BAManifestURL"];
  if (os_variant_has_internal_content())
  {
    id v43 = v10;
    v17 = [v9 essentialDownloadAllowance];

    if (v17)
    {
      v18 = sub_100013ABC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        [(BAApplicationInfo *)self applicationIdentifier];
        v19 = v44 = v14;
        v20 = [v9 essentialDownloadAllowance];
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        __int16 v48 = 2114;
        v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Essential download allowance for %{public}@ overridden to %{public}@", buf, 0x16u);

        __int16 v14 = v44;
      }

      uint64_t v21 = [v9 essentialDownloadAllowance];

      __int16 v14 = (void *)v21;
    }
    id v22 = [v9 downloadAllowance];

    v45 = v14;
    if (v22)
    {
      uint64_t v23 = sub_100013ABC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(BAApplicationInfo *)self applicationIdentifier];
        int64_t v25 = [v9 downloadAllowance];
        *(_DWORD *)buf = 138543618;
        v47 = v24;
        __int16 v48 = 2114;
        v49 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Download allowance for %{public}@ overridden to %{public}@", buf, 0x16u);

        __int16 v14 = v45;
      }

      uint64_t v26 = [v9 downloadAllowance];

      int v15 = (void *)v26;
    }
    id v27 = [v9 manifestURL];

    if (v27)
    {
      objc_super v28 = sub_100013ABC();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [(BAApplicationInfo *)self applicationIdentifier];
        v30 = [v9 manifestURL];
        *(_DWORD *)buf = 138543618;
        v47 = v29;
        __int16 v48 = 2114;
        v49 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Manifest URL overridden for %{public}@ to %{public}@", buf, 0x16u);

        __int16 v14 = v45;
      }

      uint64_t v31 = [v9 manifestURL];

      BOOL v16 = (void *)v31;
    }
    v32 = [v9 domainAllowlist];

    if (v32)
    {
      v33 = sub_100013ABC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [(BAApplicationInfo *)self applicationIdentifier];
        uint64_t v35 = [v9 domainAllowlist];
        [v35 componentsJoinedByString:@","];
        v36 = objc_super v42 = v13;
        *(_DWORD *)buf = 138543618;
        v47 = v34;
        __int16 v48 = 2114;
        v49 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Domain allowlist for %{public}@ overridden to %{public}@", buf, 0x16u);

        __int16 v14 = v45;
        BOOL v13 = v42;
      }

      uint64_t v37 = [v9 domainAllowlist];

      BOOL v13 = (void *)v37;
    }
    id v10 = v43;
  }
  v38 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v38 lock];

  [(BAApplicationInfo *)self _populateAllowedDomainInfoWithArray:v13];
  v39 = [v10 persistentIdentifier];

  [(BAApplicationInfo *)self setPersistentIdentifier:v39];
  -[BAApplicationInfo setOptionalAssetDownloadAllowance:](self, "setOptionalAssetDownloadAllowance:", [v15 unsignedLongLongValue]);
  -[BAApplicationInfo setEssentialAssetDownloadAllowance:](self, "setEssentialAssetDownloadAllowance:", [v14 unsignedLongLongValue]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = +[NSURL URLWithString:v16];
    [(BAApplicationInfo *)self setManifestURL:v40];
  }
  v41 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v41 unlock];
}

- (id)extensionIdentity
{
  v2 = self;
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = [(BAApplicationInfo *)v2 applicationIdentifier];
  id v5 = [v4 copy];

  uint64_t v6 = [(BAApplicationInfo *)v2 receivedInstalledNotification] ^ 1;
  int v7 = [(BAApplicationInfo *)v2 appInfoRecursiveLock];
  [v7 unlock];

  id v8 = [(id)objc_opt_class() extensionPointQueriesWithPostProcessing:v6];
  +[_EXQueryController executeQueries:v8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v37 = v8;
    id v12 = 0;
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      __int16 v14 = 0;
      int v15 = v12;
      id v38 = v11;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v9);
        }
        BOOL v16 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v14);
        v17 = [v16 bundleIdentifier:v37];
        unsigned int v18 = [v17 hasPrefix:v5];

        if (v18)
        {
          id v12 = v16;

          v19 = [(BAApplicationInfo *)v2 persistentIdentifier];
          v20 = [v12 containingBundleRecord];
          uint64_t v21 = v20;
          if (v19)
          {
            if (v20)
            {
              id v22 = [v20 persistentIdentifier];
              uint64_t v23 = v13;
              uint64_t v24 = v2;
              id v25 = v5;
              id v26 = v9;
              uint64_t v27 = _LSPersistentIdentifierCompare();

              BOOL v28 = v27 == 100;
              id v9 = v26;
              id v5 = v25;
              v2 = v24;
              uint64_t v13 = v23;
              id v11 = v38;
              if (v28)
              {
                long long v29 = v12;

                id v8 = v37;
                if (!v29) {
                  goto LABEL_24;
                }
LABEL_19:
                uint64_t v31 = [v29 containingBundleRecord];
                if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v32 = [v31 bundleIdentifier];
                  unsigned __int8 v33 = [v32 isEqualToString:v5];

                  if (v33)
                  {
                    uint64_t v34 = v29;
LABEL_30:

                    goto LABEL_31;
                  }
                  uint64_t v35 = sub_100013B54();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    sub_10003B60C(v31, (uint64_t)v5, v35);
                  }
                }
                else
                {
                  uint64_t v35 = sub_100013B54();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    sub_10003B578(v29, v35);
                  }
                }

                uint64_t v34 = 0;
                goto LABEL_30;
              }
            }
          }

          int v15 = v12;
        }
        else
        {
          id v12 = v15;
        }
        __int16 v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    id v8 = v37;
    if (v12)
    {
      long long v29 = v12;
      v30 = sub_100013B54();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v44 = v5;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Could not find extension identity from persistant identifier, falling back to bundle identifier match. (ID:%{public}@)", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
  else
  {
  }
LABEL_24:
  long long v29 = sub_100013B54();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10003B504();
  }
  uint64_t v34 = 0;
LABEL_31:

  return v34;
}

- (id)applicationSecurityGroups
{
  v2 = [(BAApplicationInfo *)self extensionIdentity];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = objc_alloc((Class)LSApplicationExtensionRecord);
      uint64_t v6 = [v3 url];
      uint64_t v17 = 0;
      id v7 = [v5 initWithURL:v6 requireValid:0 error:&v17];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 groupContainerURLs];
        id v9 = [v8 allKeys];

        id v10 = [v4 groupContainerURLs];
        id v11 = [v10 allKeys];

        if (v9 && v11)
        {
          id v12 = +[NSSet setWithArray:v9];
          uint64_t v13 = +[NSSet setWithArray:v11];
          id v14 = [v13 mutableCopy];

          [v14 intersectSet:v12];
          int v15 = [v14 allObjects];
        }
        else
        {
          int v15 = +[NSArray array];
        }
      }
      else
      {
        int v15 = +[NSArray array];
      }
    }
    else
    {
      int v15 = +[NSArray array];
    }
  }
  else
  {
    int v15 = +[NSArray array];
  }

  return v15;
}

- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3
{
  return [(BAApplicationInfo *)self remainingDownloadAllowanceWithNecessity:a3 isManifest:0];
}

- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v7 lock];

  unint64_t v8 = [(BAApplicationInfo *)self _remainingDownloadAllowanceWithNecessity:a3 isManifest:v4];
  id v9 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v9 unlock];

  return v8;
}

- (unint64_t)_remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4
{
  if (a4)
  {
    unint64_t v5 = [(BAApplicationInfo *)self _remainingDownloadAllowanceWithNecessity:0 isManifest:0];
    return [(BAApplicationInfo *)self _remainingDownloadAllowanceWithNecessity:1 isManifest:0]+ v5;
  }
  else
  {
    if (a3 == 1)
    {
      unint64_t v7 = [(BAApplicationInfo *)self essentialAssetDownloadAllowance];
      if (v7 < [(BAApplicationInfo *)self essentialAmountDownloaded]) {
        [(BAApplicationInfo *)self setEssentialAmountDownloaded:[(BAApplicationInfo *)self essentialAssetDownloadAllowance]];
      }
      unint64_t v8 = [(BAApplicationInfo *)self essentialAssetDownloadAllowance];
      unint64_t v9 = [(BAApplicationInfo *)self essentialAmountDownloaded];
    }
    else
    {
      unint64_t v10 = [(BAApplicationInfo *)self optionalAssetDownloadAllowance];
      if (v10 < [(BAApplicationInfo *)self optionalAmountDownloaded]) {
        [(BAApplicationInfo *)self setOptionalAmountDownloaded:[(BAApplicationInfo *)self optionalAssetDownloadAllowance]];
      }
      unint64_t v8 = [(BAApplicationInfo *)self optionalAssetDownloadAllowance];
      unint64_t v9 = [(BAApplicationInfo *)self optionalAmountDownloaded];
    }
    return v8 - v9;
  }
}

- (BOOL)_consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = [(BAApplicationInfo *)self _remainingDownloadAllowanceWithNecessity:a4 isManifest:0];
  if (a4 != 1)
  {
    if (v9 > a3)
    {
      [(BAApplicationInfo *)self setOptionalAmountDownloaded:(char *)[(BAApplicationInfo *)self optionalAmountDownloaded] + a3];
      return 0;
    }
    [(BAApplicationInfo *)self setOptionalAmountDownloaded:[(BAApplicationInfo *)self optionalAssetDownloadAllowance]];
    return 1;
  }
  if (v9 > a3)
  {
    [(BAApplicationInfo *)self setEssentialAmountDownloaded:(char *)[(BAApplicationInfo *)self essentialAmountDownloaded] + a3];
    return 0;
  }
  if (!v5)
  {
    [(BAApplicationInfo *)self setEssentialAmountDownloaded:[(BAApplicationInfo *)self essentialAssetDownloadAllowance]];
    return 1;
  }

  return [(BAApplicationInfo *)self _consumeAllowanceShouldStopWithAdditionalBytes:a3 downloadNecessity:0 isManifest:1];
}

- (BOOL)consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(BAApplicationInfo *)self hasLaunchedApplication]) {
    return 0;
  }
  unint64_t v10 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v10 lock];

  BOOL v11 = [(BAApplicationInfo *)self _consumeAllowanceShouldStopWithAdditionalBytes:a3 downloadNecessity:a4 isManifest:v5];
  id v12 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v12 unlock];

  return v11;
}

- (BOOL)initialRestrictionsAreEnforced
{
  return ![(BAApplicationInfo *)self hasLaunchedApplication]
      && [(BAApplicationInfo *)self permittedForInitialBackgroundActivity];
}

- (BOOL)allowsBackgroundActivity
{
  BOOL v4 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v4 lock];

  unsigned int v5 = [(BAApplicationInfo *)self hasLaunchedApplication];
  if ((v5 & 1) != 0
    || ![(BAApplicationInfo *)self permittedForInitialBackgroundActivity])
  {
    if ([(BAApplicationInfo *)self userForceQuitApp])
    {
      unint64_t v7 = sub_100013ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [(BAApplicationInfo *)self applicationIdentifier];
        int v13 = 138543362;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Background activity denied for (%{public}@) because the app was terminated by the user.", (uint8_t *)&v13, 0xCu);
      }
      int v6 = 0;
      unsigned __int8 v2 = 0;
    }
    else
    {
      int v6 = 1;
    }
  }
  else
  {
    int v6 = 0;
    unsigned __int8 v2 = 1;
  }
  unint64_t v9 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v9 unlock];

  if (v6)
  {
    if (v5)
    {
      unint64_t v10 = [(BAApplicationInfo *)self applicationIdentifier];
      unsigned __int8 v2 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:v10];
    }
    else
    {
      unint64_t v10 = sub_100013ABC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(BAApplicationInfo *)self applicationIdentifier];
        int v13 = 138543362;
        id v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Background activity denied for (%{public}@) because the user has not launched the app.", (uint8_t *)&v13, 0xCu);
      }
      unsigned __int8 v2 = 0;
    }
  }
  return v2 & 1;
}

- (BOOL)shouldDoPeriodicCheck
{
  BOOL v3 = [(BAApplicationInfo *)self lastPeriodicCheckTime];
  BOOL v4 = [(BAApplicationInfo *)self lastApplicationLaunchTime];
  if (![(BAApplicationInfo *)self hasLaunchedApplication]
    || ![(BAApplicationInfo *)self allowsBackgroundActivity])
  {
    goto LABEL_8;
  }
  [v4 timeIntervalSinceNow];
  if (v5 <= -604800.0)
  {
    if (v5 > -2419200.0)
    {
      double v6 = 604800.0;
      goto LABEL_7;
    }
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  double v6 = 86400.0;
LABEL_7:
  [v3 timeIntervalSinceNow];
  BOOL v8 = v6 <= -v7;
LABEL_9:

  return v8;
}

- (double)extensionRuntime
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  BOOL v4 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  double v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 isMoreThan24HoursAgo])
        {
          [v5 addObject:v12];
        }
        else
        {
          [v12 elapsedTime];
          double v10 = v10 + v13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  id v14 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  [v14 removeObjectsInArray:v5];

  int v15 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v15 unlock];

  return v10;
}

- (void)resetExtensionRuntime
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  BOOL v4 = sub_100013ABC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(BAApplicationInfo *)self applicationIdentifier];
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting extension runtime for: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  double v6 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  [v6 removeAllObjects];

  id v7 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v7 unlock];
}

- (BOOL)shouldLaunchExtension
{
  [(BAApplicationInfo *)self extensionRuntime];
  return v2 + (double)0xAuLL < 600.0;
}

- (void)willLaunchExtension
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  BOOL v4 = [(BAApplicationInfo *)self currentRuntime];

  if (v4) {
    [(BAApplicationInfo *)self extensionExited];
  }
  id v7 = objc_alloc_init(BAExtensionRuntime);
  double v5 = [(BAApplicationInfo *)self extensionRuntimeEvents];
  [v5 addObject:v7];

  [(BAApplicationInfo *)self setCurrentRuntime:v7];
  double v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v6 unlock];
}

- (void)extensionExited
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  BOOL v4 = [(BAApplicationInfo *)self currentRuntime];

  if (v4)
  {
    double v5 = [(BAApplicationInfo *)self currentRuntime];
    [v5 extensionExited];

    double v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(BAApplicationInfo *)self applicationIdentifier];
      int v8 = [(BAApplicationInfo *)self currentRuntime];
      [v8 elapsedTime];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2050;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Extension for app identifier %{public}@ ran for %{public}.1f seconds.", (uint8_t *)&v11, 0x16u);
    }
    [(BAApplicationInfo *)self setCurrentRuntime:0];
  }
  double v10 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v10 unlock];
}

- (void)donePeriodicCheck
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  BOOL v4 = +[NSDate date];
  [(BAApplicationInfo *)self setLastPeriodicCheckTime:v4];

  id v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];
}

- (void)applicationLaunched
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  if ((self->_applicationState & 0xFFFFFFFFFFFFFFFELL) != 4) {
    self->_int64_t applicationState = 5;
  }
  [(BAApplicationInfo *)self setHasLaunchedApplication:1];
  BOOL v4 = +[NSDate date];
  [(BAApplicationInfo *)self setLastApplicationLaunchTime:v4];

  [(BAApplicationInfo *)self setUserForceQuitApp:0];
  id v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v5 unlock];
}

- (void)performAfterNetworkConsentProvided:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v8 lock];

  if (!self->_awaitingNetworkConsent)
  {
    BOOL v16 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v16 unlock];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030C94;
    block[3] = &unk_10005CF48;
    long long v18 = v6;
    dispatch_async(v7, block);

    uint64_t v14 = v18;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v9 = [(BAApplicationInfo *)self blocksAwaitingNetworkConsent];
  id v10 = objc_retainBlock(v6);
  [v9 setObject:v7 forKey:v10];

  int v11 = [(BAApplicationInfo *)self blocksAwaitingNetworkConsent];
  id v12 = [v11 count];

  __int16 v13 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v13 unlock];

  if (v12)
  {
    uint64_t v14 = sub_100013ABC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(BAApplicationInfo *)self applicationIdentifier];
      *(_DWORD *)buf = 134218242;
      id v20 = v12;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "There are %lu blocks enqueued awaiting network for identifier: %{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_debugConsumeTime:(double)a3
{
  id v11 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  if (a3 <= 0.0)
  {
    uint64_t v9 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v9 lock];

    id v10 = [(BAApplicationInfo *)self extensionRuntimeEvents];
    [v10 removeAllObjects];

    id v5 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [(BAExtensionRuntime *)v5 unlock];
  }
  else
  {
    id v5 = [[BAExtensionRuntime alloc] initWithStartDate:v11];
    [(BAExtensionRuntime *)v5 extensionExited];
    id v6 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v6 lock];

    id v7 = [(BAApplicationInfo *)self extensionRuntimeEvents];
    [v7 addObject:v5];

    int v8 = [(BAApplicationInfo *)self appInfoRecursiveLock];
    [v8 unlock];
  }
}

- (void)_populateAllowedDomainInfoWithArray:(id)a3
{
  id v4 = a3;
  p_allowedDownloadDomainWildcards = &self->_allowedDownloadDomainWildcards;
  [(NSMutableArray *)self->_allowedDownloadDomainWildcards removeAllObjects];
  allowedDownloadDomains = self->_allowedDownloadDomains;
  p_allowedDownloadDomains = &self->_allowedDownloadDomains;
  [(NSMutableArray *)allowedDownloadDomains removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v13, "hasPrefix:", @"*", (void)v18))
        {
          int v15 = [v13 _baassets_validUTI];
          long long v17 = (id *)p_allowedDownloadDomains;
          if (!v15) {
            goto LABEL_12;
          }
LABEL_11:
          [*v17 addObject:v15];
          goto LABEL_12;
        }
        uint64_t v14 = [v13 _baassets_validUTIWithWildcard];
        int v15 = v14;
        if (v14)
        {
          id v16 = [v14 length];
          long long v17 = (id *)p_allowedDownloadDomainWildcards;
          if ((unint64_t)v16 > 1) {
            goto LABEL_11;
          }
        }
LABEL_12:
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)_serializableAllowedDomainInfo
{
  return [(NSMutableArray *)self->_allowedDownloadDomains arrayByAddingObjectsFromArray:self->_allowedDownloadDomainWildcards];
}

- (id)debugDescription
{
  BOOL v3 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v3 lock];

  id v4 = [(BAApplicationInfo *)self applicationIdentifier];
  unint64_t v18 = [(BAApplicationInfo *)self optionalAssetDownloadAllowance];
  unint64_t v17 = [(BAApplicationInfo *)self essentialAssetDownloadAllowance];
  unint64_t v5 = [(BAApplicationInfo *)self optionalAmountDownloaded];
  unint64_t v6 = [(BAApplicationInfo *)self essentialAmountDownloaded];
  CFStringRef v7 = @"YES";
  if ([(BAApplicationInfo *)self receivedInstallingNotification]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if ([(BAApplicationInfo *)self receivedInstalledNotification]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  id v10 = [(BAApplicationInfo *)self _serializableAllowedDomainInfo];
  uint64_t v11 = [(BAApplicationInfo *)self lastPeriodicCheckTime];
  if (![(BAApplicationInfo *)self hasLaunchedApplication]) {
    CFStringRef v7 = @"NO";
  }
  id v12 = [(BAApplicationInfo *)self lastApplicationLaunchTime];
  [(BAApplicationInfo *)self extensionRuntime];
  uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Application Identifier: %@\nInitial (Optional Download Allowance: %llu\nInitial (Essential Download Allowance: %llu\nAmount Downloaded (Optional): %llu\nAmount Downloaded (Essential): %llu\nReceived Installing Notification: %@\nReceived Installed Notification: %@\nAllowed Domains: %@\nLast Check Time: %@\nApp Has Been Launched: %@\nLast Launch Time: %@\nExtension Runtime In Last 24h: %lf"), v4, v18, v17, v5, v6, v8, v9, v10, v11, v7, v12, v13);

  int v15 = [(BAApplicationInfo *)self appInfoRecursiveLock];
  [v15 unlock];

  return v14;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSDate)lastPeriodicCheckTime
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastPeriodicCheckTime:(id)a3
{
}

- (NSDate)lastApplicationLaunchTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastApplicationLaunchTime:(id)a3
{
}

- (BOOL)hasLaunchedApplication
{
  return self->_hasLaunchedApplication;
}

- (void)setHasLaunchedApplication:(BOOL)a3
{
  self->_hasLaunchedApplication = a3;
}

- (BOOL)permittedForInitialBackgroundActivity
{
  return self->_permittedForInitialBackgroundActivity;
}

- (void)setPermittedForInitialBackgroundActivity:(BOOL)a3
{
  self->_permittedForInitialBackgroundActivity = a3;
}

- (unint64_t)initialBackgroundCellularPolicy
{
  return self->_initialBackgroundCellularPolicy;
}

- (void)setInitialBackgroundCellularPolicy:(unint64_t)a3
{
  self->_initialBackgroundCellularPolicy = a3;
}

- (NSString)applicationTeamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplicationTeamIdentifier:(id)a3
{
}

- (unint64_t)optionalAssetDownloadAllowance
{
  return self->_optionalAssetDownloadAllowance;
}

- (void)setOptionalAssetDownloadAllowance:(unint64_t)a3
{
  self->_optionalAssetDownloadAllowance = a3;
}

- (unint64_t)essentialAssetDownloadAllowance
{
  return self->_essentialAssetDownloadAllowance;
}

- (void)setEssentialAssetDownloadAllowance:(unint64_t)a3
{
  self->_essentialAssetDownloadAllowance = a3;
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setManifestURL:(id)a3
{
}

- (unint64_t)optionalAmountDownloaded
{
  return self->_optionalAmountDownloaded;
}

- (void)setOptionalAmountDownloaded:(unint64_t)a3
{
  self->_optionalAmountDownloaded = a3;
}

- (unint64_t)essentialAmountDownloaded
{
  return self->_essentialAmountDownloaded;
}

- (void)setEssentialAmountDownloaded:(unint64_t)a3
{
  self->_essentialAmountDownloaded = a3;
}

- (NSMutableDictionary)blocksAwaitingNetworkConsent
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSRecursiveLock)appInfoRecursiveLock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAppInfoRecursiveLock:(id)a3
{
}

- (NSMutableArray)extensionRuntimeEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setExtensionRuntimeEvents:(id)a3
{
}

- (BAExtensionRuntime)currentRuntime
{
  return (BAExtensionRuntime *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCurrentRuntime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRuntime, 0);
  objc_storeStrong((id *)&self->_extensionRuntimeEvents, 0);
  objc_storeStrong((id *)&self->_appInfoRecursiveLock, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingNetworkConsent, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_applicationTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_lastApplicationLaunchTime, 0);
  objc_storeStrong((id *)&self->_lastPeriodicCheckTime, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedDownloadDomainWildcards, 0);
  objc_storeStrong((id *)&self->_allowedDownloadDomains, 0);

  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

@end