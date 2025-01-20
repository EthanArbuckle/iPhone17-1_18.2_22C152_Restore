@interface CSDCallProviderManagerDataSource
+ (id)dataForProviders:(id)a3;
- (BOOL)_saveProviders:(id)a3 forKeychainItem:(id)a4 error:(id *)a5;
- (BOOL)isDevicePasscodeLocked;
- (BOOL)isProviderInstalled:(id)a3;
- (BOOL)isRelayCallingGuaranteed;
- (BOOL)isSymbolicLinkAtURL:(id)a3;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3;
- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3 localKeychainItem:(id)a4 pairedHostKeychainItem:(id)a5;
- (CSDCallProviderManagerDataSourceDelegate)delegate;
- (CSDKeychainPersistentStoreProtocol)keychainItem;
- (CSDKeychainPersistentStoreProtocol)pairedHostKeychainItem;
- (CSDSandboxExtensionDirectory)ringtonesSandboxExtensionDirectory;
- (NSDictionary)registeredLocalProvidersByIdentifier;
- (NSDictionary)registeredPairedHostDeviceProvidersByIdentifier;
- (NSSet)providerIdentifiersForExistingCalls;
- (OS_dispatch_queue)queue;
- (id)_providersForKeychainItem:(id)a3;
- (id)_providersForPreferenceKey:(id)a3;
- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4;
- (id)dialAssistedDialRequestForDialRequest:(id)a3;
- (id)preferencesForKeyBlock;
- (void)callsChangedForCallCenterObserver:(id)a3;
- (void)dealloc;
- (void)didChangeRelayCallingAvailability;
- (void)handleApplicationUnregisteredNotification:(id)a3;
- (void)moveExistingPreferencesToKeychain;
- (void)openUserActivity:(id)a3 usingApplicationWithBundleIdentifier:(id)a4 frontBoardOptions:(id)a5 completion:(id)a6;
- (void)removeLinksForFilenamesNotInArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferencesForKeyBlock:(id)a3;
- (void)setProviderIdentifiersForExistingCalls:(id)a3;
- (void)setRegisteredLocalProvidersByIdentifier:(id)a3;
- (void)setRegisteredPairedHostDeviceProvidersByIdentifier:(id)a3;
@end

@implementation CSDCallProviderManagerDataSource

- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3
{
  id v4 = a3;
  v5 = [CSDKeychainPasswordItem alloc];
  v6 = +[CSDKeychainPasswordItem serviceName];
  v7 = +[CSDKeychainPasswordItem accessGroupName];
  v8 = [(CSDKeychainPasswordItem *)v5 initWithService:v6 account:@"registeredProviders" accessGroup:v7];

  v9 = [CSDKeychainPasswordItem alloc];
  v10 = +[CSDKeychainPasswordItem serviceName];
  v11 = +[CSDKeychainPasswordItem accessGroupName];
  v12 = [(CSDKeychainPasswordItem *)v9 initWithService:v10 account:@"registeredRelayProviders" accessGroup:v11];

  v13 = [(CSDCallProviderManagerDataSource *)self initWithSerialQueue:v4 localKeychainItem:v8 pairedHostKeychainItem:v12];
  return v13;
}

- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3 localKeychainItem:(id)a4 pairedHostKeychainItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSDCallProviderManagerDataSource;
  v12 = [(CSDCallProviderManagerDataSource *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    v14 = [(CSDCallProviderManagerDataSource *)v13 queue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001946C4;
    v16[3] = &unk_1005053D0;
    v17 = v13;
    id v18 = v10;
    id v19 = v11;
    id v20 = v9;
    dispatch_async(v14, v16);
  }
  return v13;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDCallProviderManagerDataSource;
  [(CSDCallProviderManagerDataSource *)&v4 dealloc];
}

- (BOOL)isRelayCallingGuaranteed
{
  v2 = +[CSDCallCapabilities sharedInstance];
  v3 = [v2 callCapabilitiesState];
  BOOL v4 = [v3 relayCallingAvailability] == 2;

  return v4;
}

- (NSDictionary)registeredLocalProvidersByIdentifier
{
  v3 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = +[NSMutableDictionary dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v5 = +[TUCallProviderManager defaultProviders];
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v11 = [v10 identifier];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v7);
  }

  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"registeredProvidersVersion", TUBundleIdentifierTelephonyUtilitiesFramework, 0);
  if (AppIntegerValue < 1)
  {
    CFIndex v16 = AppIntegerValue;
    v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      CFIndex v36 = v16;
      __int16 v37 = 1024;
      int v38 = 1;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Not loading registered providers because current registered providers version is %ld and minimum version is %d", buf, 0x12u);
    }
  }
  else
  {
    v13 = [(CSDCallProviderManagerDataSource *)self keychainItem];
    v14 = [(CSDCallProviderManagerDataSource *)self _providersForKeychainItem:v13];

    if ([v14 count])
    {
      v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found local providers from keychain", buf, 2u);
      }
    }
    else
    {
      [(CSDCallProviderManagerDataSource *)self _providersForPreferenceKey:@"registeredProviders"];
      v14 = v15 = v14;
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
          v23 = objc_msgSend(v22, "identifier", (void)v27);
          [v4 setObject:v22 forKeyedSubscript:v23];
        }
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v19);
    }
  }
  v24 = sub_100008DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFIndex v36 = (CFIndex)v4;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "registeredLocalProvidersByIdentifier: %@", buf, 0xCu);
  }

  id v25 = [v4 copy];

  return (NSDictionary *)v25;
}

- (void)setRegisteredLocalProvidersByIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "registeredLocalProvidersByIdentifier: %@", buf, 0xCu);
  }

  id v7 = [v4 allValues];
  uint64_t v8 = [(CSDCallProviderManagerDataSource *)self keychainItem];
  id v12 = 0;
  [(CSDCallProviderManagerDataSource *)self _saveProviders:v7 forKeychainItem:v8 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AFAAC();
    }
  }
  CFStringRef v11 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue(@"registeredProvidersVersion", &off_100523B78, TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v11);
}

- (NSDictionary)registeredPairedHostDeviceProvidersByIdentifier
{
  v3 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSMutableDictionary dictionary];
  v5 = [(CSDCallProviderManagerDataSource *)self pairedHostKeychainItem];
  id v6 = [(CSDCallProviderManagerDataSource *)self _providersForKeychainItem:v5];

  if ([v6 count])
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found paired host providers from keychain", buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = [(CSDCallProviderManagerDataSource *)self _providersForPreferenceKey:@"registeredRelayProviders"];

    id v6 = (void *)v8;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "identifier", (void)v19);
        [v4 setObject:v14 forKeyedSubscript:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }

  CFIndex v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "registeredPairedHostDeviceProvidersByIdentifier: %@", buf, 0xCu);
  }

  id v17 = [v4 copy];

  return (NSDictionary *)v17;
}

- (void)setRegisteredPairedHostDeviceProvidersByIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "registeredPairedHostDeviceProvidersByIdentifier: %@", buf, 0xCu);
  }

  id v7 = [v4 allValues];
  uint64_t v8 = [(CSDCallProviderManagerDataSource *)self pairedHostKeychainItem];
  id v11 = 0;
  [(CSDCallProviderManagerDataSource *)self _saveProviders:v7 forKeychainItem:v8 error:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AFAAC();
    }
  }
}

- (id)dialAssistedDialRequestForDialRequest:(id)a3
{
  return (id)_TUDialAssistedDialRequest(a3, a2);
}

- (BOOL)isDevicePasscodeLocked
{
  v2 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v2);

  int v3 = MKBGetDeviceLockState();
  if (v3 != 1) {
    LOBYTE(v3) = MKBGetDeviceLockState() == 2;
  }
  return v3;
}

- (NSSet)providerIdentifiersForExistingCalls
{
  int v3 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  providerIdentifiersForExistingCalls = self->_providerIdentifiersForExistingCalls;

  return providerIdentifiersForExistingCalls;
}

- (void)openUserActivity:(id)a3 usingApplicationWithBundleIdentifier:(id)a4 frontBoardOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v14);

  v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Opening user activity %@ for bundle identifier %@ with options %@", (uint8_t *)&v20, 0x20u);
  }

  CFIndex v16 = +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:v11];
  id v17 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v17 setFrontBoardOptions:v12];
  if (v16)
  {
    id v18 = +[LSApplicationWorkspace defaultWorkspace];
    [v18 openUserActivity:v10 usingApplicationRecord:v16 configuration:v17 completionHandler:v13];
  }
  else
  {
    long long v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1003AFB14();
    }

    id v18 = +[NSError errorWithDomain:TUBundleIdentifierTelephonyUtilitiesFramework code:1 userInfo:0];
    v13[2](v13, 0, v18);
  }
}

- (BOOL)isSymbolicLinkAtURL:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSFileManager defaultManager];
  id v7 = [v4 path];

  id v13 = 0;
  uint64_t v8 = [v6 attributesOfItemAtPath:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:NSFileType];
    unsigned __int8 v11 = [v10 isEqual:NSFileTypeSymbolicLink];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AFB7C();
    }
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDCallProviderManagerDataSource *)self ringtonesSandboxExtensionDirectory];
  id v14 = 0;
  id v10 = [v9 createLinkIfNecessaryWithFilename:v6 toURL:v7 error:&v14];
  id v11 = v14;

  if (!v10)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error creating link to source URL '%@' with filename '%@': %@", buf, 0x20u);
    }
  }

  return v10;
}

- (void)removeLinksForFilenamesNotInArray:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDCallProviderManagerDataSource *)self ringtonesSandboxExtensionDirectory];
  id v10 = 0;
  unsigned __int8 v7 = [v6 removeLinksForFilenamesNotInArray:v4 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AFBE4((uint64_t)v4, (uint64_t)v8, v9);
    }
  }
}

- (BOOL)isProviderInstalled:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 bundleIdentifier];

  if (v6)
  {
    unsigned __int8 v7 = +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  id v8 = [v7 applicationState];
  unsigned __int8 v9 = [v8 isInstalled];

  return v9;
}

- (void)moveExistingPreferencesToKeychain
{
  int v3 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDCallProviderManagerDataSource *)self _providersForPreferenceKey:@"registeredProviders"];
  if ([v4 count])
  {
    v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found local provider data to move into keychain", buf, 2u);
    }

    id v6 = [(CSDCallProviderManagerDataSource *)self keychainItem];
    id v17 = 0;
    [(CSDCallProviderManagerDataSource *)self _saveProviders:v4 forKeychainItem:v6 error:&v17];
    id v7 = v17;

    id v8 = sub_100008DCC();
    unsigned __int8 v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1003AFAAC();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing preferences for local registered providers", buf, 2u);
      }

      CFPreferencesSetAppValue(@"registeredProviders", 0, TUBundleIdentifierTelephonyUtilitiesFramework);
    }
  }
  id v10 = [(CSDCallProviderManagerDataSource *)self _providersForPreferenceKey:@"registeredRelayProviders"];
  if ([v10 count])
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found paired host provider data to move into keychain", buf, 2u);
    }

    id v12 = [(CSDCallProviderManagerDataSource *)self pairedHostKeychainItem];
    id v16 = 0;
    [(CSDCallProviderManagerDataSource *)self _saveProviders:v10 forKeychainItem:v12 error:&v16];
    id v13 = v16;

    id v14 = sub_100008DCC();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003AFAAC();
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing preferences for paired host registered providers", buf, 2u);
      }

      CFPreferencesSetAppValue(@"registeredRelayProviders", 0, TUBundleIdentifierTelephonyUtilitiesFramework);
    }
  }
}

+ (id)dataForProviders:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [[CSDMessagingCallProvider alloc] initWithProvider:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        id v11 = [(CSDMessagingCallProvider *)v10 data];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v17 = 0;
  id v12 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v17];
  id v13 = v17;
  if (v13)
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AFC64();
    }

    id v15 = 0;
  }
  else
  {
    id v15 = v12;
  }

  return v15;
}

- (BOOL)_saveProviders:(id)a3 forKeychainItem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v10);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v8 mutableCopy];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  id v13 = v11;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v21;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
      if (objc_msgSend(v17, "isSuperboxProvider", (void)v20)) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14) {
          goto LABEL_3;
        }
        id v13 = v11;
        goto LABEL_12;
      }
    }
    id v13 = v17;

    if (!v13) {
      goto LABEL_13;
    }
    [v11 removeObject:v13];
  }
LABEL_12:

LABEL_13:
  long long v18 = [(id)objc_opt_class() dataForProviders:v11];
  [v9 saveData:v18 error:a5];

  return a5 == 0;
}

- (id)_providersForKeychainItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableArray array];
  id v37 = 0;
  id v7 = [v4 readDataAndReturnError:&v37];
  id v8 = v37;
  if (v8)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AFD58();
    }
  }
  if (v7)
  {
    id v36 = 0;
    id v10 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&v36];
    id v11 = v36;

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (!v13) {
          goto LABEL_28;
        }
        id v14 = v13;
        id v28 = v11;
        long long v29 = v10;
        long long v30 = v7;
        id v31 = v4;
        uint64_t v15 = *(void *)v33;
        while (1)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v18 = [[CSDMessagingCallProvider alloc] initWithData:v17];
              long long v19 = [(CSDMessagingCallProvider *)v18 provider];

              if (v19)
              {
                [v6 addObject:v19];
                goto LABEL_20;
              }
              long long v21 = sub_100008DCC();
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                goto LABEL_19;
              }
              *(_DWORD *)buf = 138412290;
              v39 = v12;
              long long v22 = v21;
              long long v23 = "Could not deserialize data to TUCallProvider instance: %@";
              uint32_t v24 = 12;
            }
            else
            {
              long long v19 = sub_100008DCC();
              if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                goto LABEL_20;
              }
              long long v20 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v39 = v20;
              __int16 v40 = 2112;
              v41 = v12;
              long long v21 = v20;
              long long v22 = v19;
              long long v23 = "Archived object was of unexpected class %@: %@";
              uint32_t v24 = 22;
            }
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
LABEL_19:

LABEL_20:
            uint64_t v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v25 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
          id v14 = v25;
          if (!v25)
          {
            id v4 = v31;
            id v11 = v28;
            goto LABEL_28;
          }
        }
      }
    }
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1003AFCCC((uint64_t)v10, v12);
    }
LABEL_28:

    id v8 = v11;
  }
  id v26 = objc_msgSend(v6, "copy", v28, v29, v30, v31);

  return v26;
}

- (id)_providersForPreferenceKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableArray array];
  id v7 = [(CSDCallProviderManagerDataSource *)self preferencesForKeyBlock];
  id v8 = ((void (**)(void, id))v7)[2](v7, v4);

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v10) {
        goto LABEL_23;
      }
      id v11 = v10;
      id v25 = v8;
      id v26 = v4;
      uint64_t v12 = *(void *)v28;
      while (1)
      {
        id v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [[CSDMessagingCallProvider alloc] initWithData:v14];
            uint64_t v16 = [(CSDMessagingCallProvider *)v15 provider];

            if (v16)
            {
              [v6 addObject:v16];
              goto LABEL_15;
            }
            long long v18 = sub_100008DCC();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              goto LABEL_14;
            }
            *(_DWORD *)buf = 138412290;
            long long v32 = v9;
            long long v19 = v18;
            long long v20 = "Could not deserialize data to TUCallProvider instance: %@";
            uint32_t v21 = 12;
          }
          else
          {
            uint64_t v16 = sub_100008DCC();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            uint64_t v17 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            long long v32 = v17;
            __int16 v33 = 2112;
            long long v34 = v9;
            long long v18 = v17;
            long long v19 = v16;
            long long v20 = "Archived object was of unexpected class %@: %@";
            uint32_t v21 = 22;
          }
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
LABEL_14:

LABEL_15:
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v22 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        id v11 = v22;
        if (!v22) {
          goto LABEL_23;
        }
      }
    }
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AFCCC((uint64_t)v8, v9);
    }
LABEL_23:
  }
  id v23 = objc_msgSend(v6, "copy", v25, v26);

  return v23;
}

- (void)handleApplicationUnregisteredNotification:(id)a3
{
  id v4 = [(CSDCallProviderManagerDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001965A4;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  id v4 = [(CSDCallProviderManagerDataSource *)self callCenterObserver];
  id v5 = [v4 callContainer];
  id v6 = [v5 currentAudioAndVideoCalls];

  id v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) provider];
        uint64_t v14 = [v13 identifier];

        if ([v14 length]) {
          [v7 addObject:v14];
        }

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [(CSDCallProviderManagerDataSource *)self queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001967F8;
  v17[3] = &unk_100504F10;
  v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  dispatch_async(v15, v17);
}

- (void)didChangeRelayCallingAvailability
{
  id v3 = [(CSDCallProviderManagerDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDCallProviderManagerDataSource *)self delegate];
  [v4 relayCallingStateChangedForDataSource:self];
}

- (CSDCallProviderManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDCallProviderManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)preferencesForKeyBlock
{
  return self->_preferencesForKeyBlock;
}

- (void)setPreferencesForKeyBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDSandboxExtensionDirectory)ringtonesSandboxExtensionDirectory
{
  return self->_ringtonesSandboxExtensionDirectory;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (void)setProviderIdentifiersForExistingCalls:(id)a3
{
}

- (CSDKeychainPersistentStoreProtocol)keychainItem
{
  return self->_keychainItem;
}

- (CSDKeychainPersistentStoreProtocol)pairedHostKeychainItem
{
  return self->_pairedHostKeychainItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedHostKeychainItem, 0);
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_providerIdentifiersForExistingCalls, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);
  objc_storeStrong((id *)&self->_ringtonesSandboxExtensionDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_preferencesForKeyBlock, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end