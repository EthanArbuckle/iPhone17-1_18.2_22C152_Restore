@interface TCCDPlatform
+ (id)allPlatformNames;
+ (id)allTCCEntitlements;
+ (id)currentPlatform;
+ (id)iosFamilyPlatformNames;
+ (id)macOSPlatformNames;
- (BOOL)displayAlert:(id)a3;
- (BOOL)indirectRequestPipelineStalled;
- (BOOL)isChinaSKUDevice;
- (BOOL)isNonAppBundleIdentifierValid:(id)a3;
- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3;
- (BOOL)sendMessageAsync:(id)a3 toTCCDForTargetUID:(unsigned int)a4 withReplyBlock:(id)a5;
- (NSDictionary)configurationDictionary;
- (NSDictionary)servicesByName;
- (NSString)name;
- (NSUUID)bootUUID;
- (TCCDMainSyncController)mainSyncController;
- (TCCDPlatform)initWithName:(id)a3;
- (TCCDProtectedServiceManager)protectedAppManager;
- (TCCDServer)server;
- (TCCDSyncController)syncController;
- (id)appBundleURLContainingExecutableURL:(id)a3;
- (id)bundleURLContainingExecutableURL:(id)a3;
- (id)homeRelativePathToStateDirectory;
- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3;
- (id)sendMessageSync:(id)a3 toTCCDForTargetUID:(unsigned int)a4;
- (id)serviceByName:(id)a3;
- (id)stringForAnalyticsAction:(int64_t)a3;
- (int)indirectRequestsOutstanding;
- (int64_t)promptingPolicyForIdentity:(id)a3 accessingService:(id)a4 withAttributionChain:(id)a5;
- (unint64_t)evaluatePolicyForUsageStringAndPromptingForClient:(id)a3 attributionChain:(id)a4 service:(id)a5 desiredAuth:(unint64_t)a6 resultUsageString:(id *)a7;
- (void)_invalidMethodForPlatform;
- (void)loadConfigurationDictionary;
- (void)sendAnalyticsAsyncWithEventName:(id)a3 fields:(id)a4;
- (void)sendAnalyticsForAction:(int64_t)a3 service:(id)a4 subjectIdentity:(id)a5 indirectObjectIdentity:(id)a6 authValue:(unint64_t)a7 includeV1AuthValue:(BOOL)a8 v1AuthValue:(unint64_t)a9 desiredAuth:(unint64_t)a10 domainReason:(id)a11 promptType:(int64_t)a12;
- (void)sendAnalyticsForEntitlement:(id)a3 withIdentifier:(id)a4 service:(id)a5 function:(id)a6;
- (void)sendAnalyticsForPlugin:(id)a3 service:(id)a4 API:(id)a5;
- (void)sendAnalyticsWithEventName:(id)a3 fields:(id)a4;
- (void)setIndirectRequestsOutstanding:(int)a3;
- (void)setMainSyncController:(id)a3;
- (void)setProtectedAppManager:(id)a3;
- (void)setServer:(id)a3;
- (void)setServicesByName:(id)a3;
- (void)setSyncController:(id)a3;
- (void)updateAnalyticsEvent:(id)a3 fromIdentity:(id)a4 keyPrefix:(id)a5;
@end

@implementation TCCDPlatform

- (id)bundleURLContainingExecutableURL:(id)a3
{
  v3 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  v4 = [v3 absoluteURL];

  return v4;
}

+ (id)allTCCEntitlements
{
  if (qword_1000AC748 != -1) {
    dispatch_once(&qword_1000AC748, &stru_1000966F0);
  }
  v2 = (void *)qword_1000AC750;
  return v2;
}

+ (id)currentPlatform
{
  if (qword_1000AC740 != -1) {
    dispatch_once(&qword_1000AC740, &stru_1000966D0);
  }
  v2 = (void *)qword_1000AC738;
  return v2;
}

- (TCCDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (TCCDServer *)WeakRetained;
}

- (id)serviceByName:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F8C4;
  block[3] = &unk_100094E78;
  block[4] = self;
  uint64_t v4 = qword_1000AC758;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1000AC758, block);
  }
  v6 = [(TCCDPlatform *)self servicesByName];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (NSDictionary)servicesByName
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

+ (id)allPlatformNames
{
  if (qword_1000AC710 != -1) {
    dispatch_once(&qword_1000AC710, &stru_100096670);
  }
  v2 = (void *)qword_1000AC708;
  return v2;
}

+ (id)iosFamilyPlatformNames
{
  if (qword_1000AC720 != -1) {
    dispatch_once(&qword_1000AC720, &stru_100096690);
  }
  v2 = (void *)qword_1000AC718;
  return v2;
}

+ (id)macOSPlatformNames
{
  if (qword_1000AC730 != -1) {
    dispatch_once(&qword_1000AC730, &stru_1000966B0);
  }
  v2 = (void *)qword_1000AC728;
  return v2;
}

- (TCCDPlatform)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCCDPlatform;
  id v5 = [(TCCDPlatform *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;
  }
  return v5;
}

- (void)loadConfigurationDictionary
{
  v3 = [(TCCDPlatform *)self server];
  unsigned int v4 = [v3 allowsInternalSecurityPolicies];

  if (v4)
  {
    id v5 = [(TCCDPlatform *)self server];
    v6 = [v5 stateDirectory];
    v7 = [v6 stringByAppendingPathComponent:@"tccd-config.plist"];

    v8 = +[NSData dataWithContentsOfFile:v7 options:0 error:0];
    if (v8)
    {
      id v18 = 0;
      objc_super v9 = +[NSPropertyListSerialization propertyListWithData:v8 options:0 format:0 error:&v18];
      id v10 = v18;
      configurationDictionary = self->_configurationDictionary;
      self->_configurationDictionary = v9;

      v12 = self->_configurationDictionary;
      v13 = [(TCCDPlatform *)self server];
      v14 = [v13 logHandle];

      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = self->_configurationDictionary;
          *(_DWORD *)buf = 138543618;
          v20 = v7;
          __int16 v21 = 2114;
          v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Using config file at %{public}@: contents:\n%{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_100051328((uint64_t)v7, v10, v14);
      }
    }
  }
  if (!self->_configurationDictionary)
  {
    v16 = (NSDictionary *)objc_opt_new();
    v17 = self->_configurationDictionary;
    self->_configurationDictionary = v16;
  }
}

- (void)_invalidMethodForPlatform
{
}

- (id)homeRelativePathToStateDirectory
{
  return 0;
}

- (NSUUID)bootUUID
{
  bootUUID = self->_bootUUID;
  if (!bootUUID)
  {
    *(_OWORD *)in = 0u;
    memset(v13, 0, sizeof(v13));
    size_t v10 = 37;
    if (!sysctlbyname("kern.bootsessionuuid", in, &v10, 0, 0))
    {
      if (v10 != 37) {
        sub_1000513DC();
      }
      memset(uu, 0, sizeof(uu));
      if (!uuid_parse(in, uu))
      {
        unsigned int v4 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
        id v5 = self->_bootUUID;
        self->_bootUUID = v4;

        v6 = [(TCCDPlatform *)self server];
        v7 = [v6 logHandle];

        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded bootUUID", v9, 2u);
        }
      }
    }
    bootUUID = self->_bootUUID;
  }
  return bootUUID;
}

- (id)sendMessageSync:(id)a3 toTCCDForTargetUID:(unsigned int)a4
{
  return 0;
}

- (BOOL)sendMessageAsync:(id)a3 toTCCDForTargetUID:(unsigned int)a4 withReplyBlock:(id)a5
{
  return 0;
}

- (int64_t)promptingPolicyForIdentity:(id)a3 accessingService:(id)a4 withAttributionChain:(id)a5
{
  return 0;
}

- (id)appBundleURLContainingExecutableURL:(id)a3
{
  id v4 = a3;
  v31 = self;
  id v5 = [(TCCDPlatform *)self bundleURLContainingExecutableURL:v4];
  v6 = v5;
  if (v5)
  {
    v30 = v4;
    v7 = [v5 pathComponents];
    v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = +[NSURL fileURLWithPath:v8];

    if ((unint64_t)[v7 count] >= 2)
    {
      unsigned int v11 = 2;
      uint64_t v12 = 1;
      *(void *)&long long v10 = 138412546;
      long long v29 = v10;
      do
      {
        v13 = v9;
        v14 = objc_msgSend(v7, "objectAtIndexedSubscript:", v12, v29);
        id v9 = [v9 URLByAppendingPathComponent:v14];

        if (!v9) {
          break;
        }
        v15 = [v9 pathExtension];
        id v16 = [v15 caseInsensitiveCompare:@"app"];

        if (!v16)
        {
          id v32 = 0;
          id v33 = 0;
          uint64_t v17 = [v9 getResourceValue:&v33 forKey:NSURLIsApplicationKey error:&v32];
          id v18 = v33;
          id v19 = v32;
          if (v17)
          {
            if ([v18 BOOLValue])
            {
              v26 = [(TCCDPlatform *)v31 server];
              v27 = [v26 logHandle];

              BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
              id v4 = v30;
              if (v28) {
                sub_100051408(v30, v9, v27);
              }

              id v9 = v9;
              id v24 = v9;
              goto LABEL_15;
            }
          }
          else
          {
            v20 = [(TCCDPlatform *)v31 server];
            __int16 v21 = [v20 logHandle];

            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = [v9 path];
              *(_DWORD *)buf = v29;
              v35 = v22;
              __int16 v36 = 2114;
              id v37 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Failed to get NSURLIsApplicationKey for %@: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v12 = v11;
      }
      while ((unint64_t)[v7 count] > v11++);
    }
    id v24 = v6;
    id v4 = v30;
LABEL_15:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)stringForAnalyticsAction:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return @"<Invalid Action>";
  }
  else {
    return *(&off_1000967B0 + a3);
  }
}

- (void)updateAnalyticsEvent:(id)a3 fromIdentity:(id)a4 keyPrefix:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "client_type"));
  long long v10 = [v8 stringByAppendingString:@"_ID_type"];
  [v19 setObject:v9 forKeyedSubscript:v10];

  if (!objc_msgSend(v7, "client_type"))
  {
    v14 = [v7 bundle];

    if (v14)
    {
      v15 = [v7 bundle];
      id v16 = [v15 bundleIdentifier];
      uint64_t v17 = [v8 stringByAppendingString:@"_ID"];
      [v19 setObject:v16 forKeyedSubscript:v17];

      uint64_t v12 = [v7 bundle];
      v13 = [v12 bundleVersion];
      id v18 = [v8 stringByAppendingString:@"_bundle_version"];
      [v19 setObject:v13 forKeyedSubscript:v18];

      goto LABEL_7;
    }
  }
  if (objc_msgSend(v7, "client_type") == 1)
  {
    unsigned int v11 = [v7 path];

    if (v11)
    {
      uint64_t v12 = [v7 path];
      v13 = [v8 stringByAppendingString:@"_ID"];
      [v19 setObject:v12 forKeyedSubscript:v13];
LABEL_7:
    }
  }
}

- (void)sendAnalyticsForPlugin:(id)a3 service:(id)a4 API:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (&_AnalyticsSendEventLazy)
  {
    unsigned int v11 = [(TCCDPlatform *)self server];
    uint64_t v12 = [v11 logHandle];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v9 name];
      *(_DWORD *)buf = 138544130;
      CFStringRef v21 = @"com.apple.TCC.management_action";
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sending %{public}@ Analytics Event for plugin=%{public}@, API=%{public}@, service=%{public}@", buf, 0x2Au);
    }
    v16[1] = _NSConcreteStackBlock;
    v16[2] = 3221225472;
    v16[3] = sub_100050398;
    v16[4] = &unk_100096718;
    v14 = &v17;
    id v17 = v9;
    id v18 = v10;
    id v19 = v8;
    AnalyticsSendEventLazy();
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100050434;
    v15[3] = &unk_100094E78;
    v14 = (id *)v16;
    v16[0] = @"com.apple.TCC.management_action";
    if (qword_1000AC760 != -1) {
      dispatch_once(&qword_1000AC760, v15);
    }
  }
}

- (void)sendAnalyticsForEntitlement:(id)a3 withIdentifier:(id)a4 service:(id)a5 function:(id)a6
{
  id v15 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  [v13 setObject:v10 forKeyedSubscript:@"function_name"];

  [v13 setObject:v12 forKeyedSubscript:@"entitlement"];
  [v13 setObject:v11 forKeyedSubscript:@"subject_ID"];

  if (v15)
  {
    v14 = [v15 name];
    [v13 setObject:v14 forKeyedSubscript:@"service"];
  }
  else
  {
    [v13 setObject:&stru_100096EC0 forKeyedSubscript:@"service"];
  }
  [(TCCDPlatform *)self sendAnalyticsAsyncWithEventName:@"com.apple.TCC.entitlement_usage" fields:v13];
}

- (void)sendAnalyticsForAction:(int64_t)a3 service:(id)a4 subjectIdentity:(id)a5 indirectObjectIdentity:(id)a6 authValue:(unint64_t)a7 includeV1AuthValue:(BOOL)a8 v1AuthValue:(unint64_t)a9 desiredAuth:(unint64_t)a10 domainReason:(id)a11 promptType:(int64_t)a12
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a11;
  if (&_AnalyticsSendEventLazy)
  {
    __int16 v22 = [(TCCDPlatform *)self server];
    id v23 = [v22 logHandle];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v44 = @"com.apple.TCC.authorization_action";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Analytics Event preparing: %{public}@", buf, 0xCu);
    }

    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    long long v29 = sub_100050840;
    v30 = &unk_100096740;
    v31 = self;
    int64_t v37 = a3;
    id v32 = (__CFString *)v18;
    BOOL v42 = a8;
    unint64_t v38 = a7;
    int64_t v39 = a12;
    unint64_t v40 = a9;
    id v33 = v19;
    id v34 = v20;
    unint64_t v41 = a10;
    id v35 = v21;
    CFStringRef v36 = @"com.apple.TCC.authorization_action";
    AnalyticsSendEventLazy();

    __int16 v24 = v32;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100050B3C;
    block[3] = &unk_100094E78;
    CFStringRef v26 = @"com.apple.TCC.authorization_action";
    if (qword_1000AC768 != -1) {
      dispatch_once(&qword_1000AC768, block);
    }
    __int16 v24 = (__CFString *)v26;
  }
}

- (void)sendAnalyticsWithEventName:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (&_AnalyticsSendEventLazy)
  {
    id v8 = [(TCCDPlatform *)self server];
    id v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Analytics Event preparing: %{public}@", buf, 0xCu);
    }

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100050D6C;
    id v16 = &unk_100096768;
    id v17 = self;
    id v18 = v6;
    id v19 = v7;
    AnalyticsSendEventLazy();

    id v10 = v18;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100050E54;
    v11[3] = &unk_100094E78;
    id v12 = v6;
    if (qword_1000AC770 != -1) {
      dispatch_once(&qword_1000AC770, v11);
    }
    id v10 = v12;
  }
}

- (void)sendAnalyticsAsyncWithEventName:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (&_AnalyticsSendEventLazy)
  {
    id v8 = [(TCCDPlatform *)self server];
    id v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Analytics Event sync preparing: %{public}@", buf, 0xCu);
    }

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100051084;
    id v16 = &unk_100096768;
    id v17 = self;
    id v18 = v6;
    id v19 = v7;
    AnalyticsSendEventLazy();

    id v10 = v18;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005116C;
    v11[3] = &unk_100094E78;
    id v12 = v6;
    if (qword_1000AC778 != -1) {
      dispatch_once(&qword_1000AC778, v11);
    }
    id v10 = v12;
  }
}

- (unint64_t)evaluatePolicyForUsageStringAndPromptingForClient:(id)a3 attributionChain:(id)a4 service:(id)a5 desiredAuth:(unint64_t)a6 resultUsageString:(id *)a7
{
  *a7 = 0;
  return 0;
}

- (BOOL)isNonAppBundleIdentifierValid:(id)a3
{
  return 0;
}

- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3
{
  return 0;
}

- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3
{
  return 0;
}

- (BOOL)displayAlert:(id)a3
{
  return 0;
}

- (BOOL)indirectRequestPipelineStalled
{
  return self->_indirectRequestsOutstanding > 20;
}

- (NSDictionary)configurationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServer:(id)a3
{
}

- (TCCDSyncController)syncController
{
  return (TCCDSyncController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyncController:(id)a3
{
}

- (TCCDMainSyncController)mainSyncController
{
  return (TCCDMainSyncController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainSyncController:(id)a3
{
}

- (TCCDProtectedServiceManager)protectedAppManager
{
  return (TCCDProtectedServiceManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProtectedAppManager:(id)a3
{
}

- (void)setServicesByName:(id)a3
{
}

- (BOOL)isChinaSKUDevice
{
  return self->_isChinaSKUDevice;
}

- (int)indirectRequestsOutstanding
{
  return self->_indirectRequestsOutstanding;
}

- (void)setIndirectRequestsOutstanding:(int)a3
{
  self->_indirectRequestsOutstanding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesByName, 0);
  objc_storeStrong((id *)&self->_protectedAppManager, 0);
  objc_storeStrong((id *)&self->_mainSyncController, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bootUUID, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

@end