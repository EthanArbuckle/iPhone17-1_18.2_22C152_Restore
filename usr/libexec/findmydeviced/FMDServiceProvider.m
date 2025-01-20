@interface FMDServiceProvider
+ (id)activeServiceProvider;
+ (void)setActiveServiceProvider:(id)a3;
- (BOOL)_handleSecureLocationsPush:(id)a3;
- (BOOL)_isValidIntentAccountId:(id)a3;
- (BOOL)completedStartupRegister;
- (BOOL)enqueueRequest:(id)a3;
- (BOOL)enqueueRequest:(id)a3 account:(id)a4;
- (BOOL)enqueueRequest:(id)a3 forAccessory:(id)a4;
- (BOOL)isActivationLocked;
- (BOOL)supportsAccessory:(id)a3;
- (BOOL)waitingToMakeProviderActive;
- (BOOL)willMakeProviderActive;
- (FMDAccessoryLocationStore)accessoryLocationStore;
- (FMDAccessoryRegistry)accessoryRegistry;
- (FMDAccessoryRegistryDataSource)extAccessoryManager;
- (FMDAccessoryRegistryDelegateAdaptor)accessoryRegistryDelegateAdaptor;
- (FMDAccount)account;
- (FMDAccountStore)accountStore;
- (FMDBluetoothManaging)bluetoothManager;
- (FMDExtConfigurationRegistry)extConfigRegistry;
- (FMDLocator)standardLocator;
- (FMDSecureLocationMonitor)locationMonitor;
- (FMDServerInteractionController)serverInteractionController;
- (FMDServiceProvider)init;
- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry;
- (FMReadWriteLock)accountReadWriteLock;
- (NSData)locationCommandReceived;
- (NSData)locationPayloadReceived;
- (NSMutableDictionary)futuresByCommandId;
- (NSMutableDictionary)serverInteractionControllerByAccessory;
- (NSMutableDictionary)serverInteractionControllerByAccount;
- (NSString)serviceIdentifierInURL;
- (NSString)serviceName;
- (OS_dispatch_queue)serialQueue;
- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4;
- (id)apsToken;
- (id)futureForCommandId:(id)a3;
- (id)newLocationManager;
- (id)serverInteractionControllerForAccessory:(id)a3;
- (id)serverInteractionControllerForAccount:(id)a3;
- (id)urlForRequestType:(id)a3;
- (unint64_t)_accountSecurityLevel;
- (unsigned)authInvalidError;
- (unsigned)essentialServerInfoMissingError;
- (void)_accountDidChangeFrom:(id)a3 to:(id)a4;
- (void)_handleAccessoryDidPairNotification:(id)a3;
- (void)_handleLocateIntent:(id)a3 serverContext:(id)a4;
- (void)_handlePushWithoutIntents:(id)a3;
- (void)_handleQCIntent:(id)a3 serverContext:(id)a4;
- (void)_handleSoundIntent:(id)a3 serverContext:(id)a4;
- (void)_sendStartupRegister;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidPair:(id)a3;
- (void)accessoryDidUnpair:(id)a3;
- (void)accessoryDidUpdate:(id)a3;
- (void)accountAdded;
- (void)accountInfoDidChange;
- (void)accountRemoveRequestedWithCompletion:(id)a3;
- (void)activationLockAuthInfo:(id)a3;
- (void)allowPasscodeModificationChanged:(id)a3;
- (void)clearFutures;
- (void)dealloc;
- (void)deregisterCommonNotifications;
- (void)deviceNameChanged:(id)a3;
- (void)didReceiveAPSMessage:(id)a3;
- (void)didReceiveAPSToken:(id)a3;
- (void)didReceiveAuthFailureForRequest:(id)a3;
- (void)didReceiveServerAlertForRequest:(id)a3;
- (void)localeChanged:(id)a3;
- (void)locationServicesStateChanged:(id)a3;
- (void)makeProviderActive;
- (void)makeProviderInactive;
- (void)passcodeStateChanged:(id)a3;
- (void)petForUserWithCompletion:(id)a3;
- (void)queueAccessoryActionsIfNeeded:(id)a3;
- (void)registerAccessory:(id)a3 completion:(id)a4;
- (void)registerCommonNotifications;
- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4;
- (void)reinitializeProviderWithAccount:(id)a3;
- (void)removeAccount;
- (void)removeAccount:(id)a3 completion:(id)a4;
- (void)removeAccountPreferences;
- (void)removeFutureForCommandId:(id)a3;
- (void)searchPartyBeaconsChanged:(id)a3;
- (void)setAccessoryLocationStore:(id)a3;
- (void)setAccessoryRegistry:(id)a3;
- (void)setAccessoryRegistryDelegateAdaptor:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountReadWriteLock:(id)a3;
- (void)setBluetoothManager:(id)a3;
- (void)setCompletedStartupRegister:(BOOL)a3;
- (void)setExtAccessoryManager:(id)a3;
- (void)setFuture:(id)a3 commandId:(id)a4;
- (void)setFuturesByCommandId:(id)a3;
- (void)setLocationCommandReceived:(id)a3;
- (void)setLocationMonitor:(id)a3;
- (void)setLocationPayloadReceived:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setServerInteractionControllerByAccessory:(id)a3;
- (void)setServerInteractionControllerByAccount:(id)a3;
- (void)setStandardLocator:(id)a3;
- (void)setSupportedAccessoryRegistry:(id)a3;
- (void)setWaitingToMakeProviderActive:(BOOL)a3;
- (void)showAlertFromServerResponse:(id)a3;
- (void)start;
- (void)startLocationMonitoringIfNeeded;
- (void)supportedAccessoryRegistryDidUpdateSupportedAccessories:(id)a3;
- (void)tryToFetchAuthToken;
- (void)unregisterAccessory:(id)a3 completion:(id)a4;
- (void)updateAccount:(id)a3;
@end

@implementation FMDServiceProvider

- (FMDAccount)account
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000A7CCC;
  v11 = sub_1000A7CDC;
  id v12 = 0;
  v3 = [(FMDServiceProvider *)self accountReadWriteLock];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004298;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithReadLock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FMDAccount *)v4;
}

- (FMReadWriteLock)accountReadWriteLock
{
  return self->_accountReadWriteLock;
}

+ (id)activeServiceProvider
{
  return (id)qword_10031EBA8;
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  return self->_accessoryRegistry;
}

- (FMDServiceProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)FMDServiceProvider;
  v2 = [(FMDServiceProvider *)&v14 init];
  if (v2)
  {
    id v3 = +[FMDOperationManager sharedManager];
    dispatch_queue_t v4 = dispatch_queue_create("FMDServiceProvider", 0);
    [(FMDServiceProvider *)v2 setSerialQueue:v4];

    v5 = objc_alloc_init(FMDDirectServerChannel);
    v15[0] = v5;
    v6 = objc_alloc_init(FMDCadmiumServerChannel);
    v15[1] = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:v15 count:2];

    v8 = [[FMDServerInteractionController alloc] initWithChannels:v7 delegate:v2];
    [(FMDServiceProvider *)v2 setServerInteractionController:v8];

    uint64_t v9 = +[NSMutableDictionary dictionary];
    [(FMDServiceProvider *)v2 setServerInteractionControllerByAccessory:v9];

    v10 = +[NSMutableDictionary dictionaryWithCapacity:2];
    [(FMDServiceProvider *)v2 setServerInteractionControllerByAccount:v10];

    id v11 = [objc_alloc((Class)FMReadWriteLock) initWithLockName:@"serviceProvider-accountLock"];
    [(FMDServiceProvider *)v2 setAccountReadWriteLock:v11];

    id v12 = +[ActionManager sharedManager];
  }
  return v2;
}

- (void)dealloc
{
  [(FMDServiceProvider *)self removeObserver:self forKeyPath:@"account"];
  v3.receiver = self;
  v3.super_class = (Class)FMDServiceProvider;
  [(FMDServiceProvider *)&v3 dealloc];
}

+ (void)setActiveServiceProvider:(id)a3
{
}

- (NSString)serviceName
{
  return 0;
}

- (void)start
{
  objc_super v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v4 = [(FMDServiceProvider *)self fm_logID];
    int v18 = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", (uint8_t *)&v18, 0xCu);
  }
  v5 = [(FMDServiceProvider *)self accountStore];
  v6 = [v5 loadAccount];
  [(FMDServiceProvider *)self setAccount:v6];

  if (+[FMDPreferencesMgr wipeState])
  {
    uint64_t v7 = [[WipeAction alloc] initWithProvider:self];
    v8 = +[ActionManager sharedManager];
    id v9 = [v8 enqueueAction:v7];
  }
  else
  {
    v10 = [(FMDServiceProvider *)self account];

    if (v10)
    {
      id v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(FMDServiceProvider *)self account];
        v13 = [v12 username];
        int v18 = 138412290;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found FMIP account %@...", (uint8_t *)&v18, 0xCu);
      }
      [(FMDServiceProvider *)self accountAdded];
    }
  }
  objc_super v14 = [(FMDServiceProvider *)self account];

  if (!v14)
  {
    v15 = sub_100004238();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No FMIP account", (uint8_t *)&v18, 2u);
    }

    v16 = +[FMDDaemon sharedInstance];
    v17 = [v16 apsHandlerForEnvironment:@"production"];

    [v17 registerDelegate:self forTopic:@"com.apple.mobileme.fmip"];
  }
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  v5 = [(FMDServiceProvider *)self account];
  v6 = [(FMDServiceProvider *)self accountReadWriteLock];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A7C84;
  v9[3] = &unk_1002D9C78;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 performWithWriteLock:v9];
}

- (void)updateAccount:(id)a3
{
  id v4 = a3;
  v5 = [(FMDServiceProvider *)self account];
  if (v5)
  {
    v6 = [v4 authId];
    id v7 = [v5 authId];
    unsigned __int8 v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1002427F0(v5, v4);
      }
    }
    if ([v5 activityState] != 2)
    {
      id v10 = [(FMDServiceProvider *)self account];
      [v10 copyInfoFromAccount:v4];

      id v11 = [(FMDServiceProvider *)self accountStore];
      id v12 = [(FMDServiceProvider *)self account];
      [v11 saveAccount:v12];

      [(FMDServiceProvider *)self accountInfoDidChange];
    }
  }
  else
  {
    v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "updateAccount is adding a new account", v16, 2u);
    }

    [(FMDServiceProvider *)self setAccount:v4];
    objc_super v14 = [(FMDServiceProvider *)self accountStore];
    [v14 saveAccount:v4];

    v15 = +[FMDStartupRegisterManager sharedInstance];
    [v15 eventDidOccur:0];

    [(FMDServiceProvider *)self accountAdded];
  }
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(FMDServiceProvider *)self account];

  if (v8)
  {
    id v9 = [(FMDServiceProvider *)self account];
    [v9 copyInfoFromAccount:v6];

    id v10 = [(FMDServiceProvider *)self accountStore];
    id v11 = [(FMDServiceProvider *)self account];
    [v10 saveAccount:v11];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A80C0;
    v16[3] = &unk_1002DCB30;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(FMDServiceProvider *)self accountRemoveRequestedWithCompletion:v16];
  }
  else
  {
    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100242894(v6, v12);
    }

    uint64_t v13 = kFMDErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"No existing account found";
    objc_super v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v15 = +[NSError errorWithDomain:v13 code:-1 userInfo:v14];

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v15);
    }
  }
}

- (void)removeAccountPreferences
{
  objc_super v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(FMDServiceProvider *)self fm_logID];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to clean prefs %@", (uint8_t *)&v6, 0xCu);
  }
  +[FMPreferencesUtil removeKey:@"needsLostModeExitAuth" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil removeKey:@"LastUpdated" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil removeKey:@"FMIPInfo" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil removeKey:@"LastALCompletionInfo" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil removeKey:@"ClientLostModeInfo" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMPreferencesUtil removeKey:@"FMIPWipeLostModeInfo" inDomain:kFMDNotBackedUpPrefDomain];
  +[FMDPreferencesMgr cleanAccountKeys];
  v5 = +[FMDSPStatusUtil sharedInstance];
  [v5 clearCache];
}

- (void)reinitializeProviderWithAccount:(id)a3
{
  id v5 = a3;
  [(FMDServiceProvider *)self setAccount:0];
  id v4 = [(FMDServiceProvider *)self accountStore];
  [v4 saveAccount:0];

  [(FMDServiceProvider *)self addAccount:v5];
}

- (void)accountInfoDidChange
{
  objc_super v3 = [(FMDServiceProvider *)self account];
  unsigned int v4 = [v3 activityState];

  if (v4 == 1)
  {
    [(FMDServiceProvider *)self registerDeviceWithCause:@"AccountChange" force:0];
  }
  else
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(FMDServiceProvider *)self fm_logID];
      int v7 = 138412290;
      unsigned __int8 v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to start %@ again because account changed", (uint8_t *)&v7, 0xCu);
    }
    [(FMDServiceProvider *)self makeProviderActive];
  }
}

- (void)accountAdded
{
  [(FMDServiceProvider *)self makeProviderInactive];

  [(FMDServiceProvider *)self makeProviderActive];
}

- (void)accountRemoveRequestedWithCompletion:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [(FMDServiceProvider *)self accessoryRegistry];
  id v5 = [v4 allAccessories];
  [v5 enumerateObjectsUsingBlock:&stru_1002DCB70];

  int v6 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
  [v6 clearSupportedAccessoryRegistry];

  [(FMDServiceProvider *)self setSupportedAccessoryRegistry:0];
  int v7 = [(FMDServiceProvider *)self accessoryRegistry];
  [v7 clearAccessoryRegistry];

  [(FMDServiceProvider *)self setAccessoryRegistry:0];
  unsigned __int8 v8 = [(FMDServiceProvider *)self accessoryLocationStore];
  [v8 clearAccessoryLocationStore];

  [(FMDServiceProvider *)self setAccessoryLocationStore:0];
  [(FMDServiceProvider *)self clearFutures];
  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    id v9 = v10;
  }
}

- (void)removeAccount
{
}

- (void)registerAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  unsigned __int8 v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Now Registering Accessory - %@", (uint8_t *)&v21, 0xCu);
  }

  id v9 = [[FMDInternalLocalFindableAccessory alloc] initWithLocalFindableAccessory:v6];
  id v10 = [(FMDServiceProvider *)self accessoryRegistry];
  [v10 updateAccessory:v9];

  id v11 = [AccessoryRegisterAction alloc];
  id v12 = [(FMDServiceProvider *)self account];
  uint64_t v13 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v9];
  objc_super v14 = [(AccessoryRegisterAction *)v11 initWithAccount:v12 accessory:v9 cause:@"deviceDidPair" force:0 serverInteractionController:v13];

  [(AccessoryRegisterAction *)v14 setIncludeDeviceState:1];
  v15 = +[FMDOperationManager sharedManager];
  v16 = [(FMDInternalLocalFindableAccessory *)v9 accessoryIdentifier];
  id v17 = [v16 stringValue];
  unsigned int v18 = [v15 addAction:v14 forIdentifier:v17];

  if (v18)
  {
    v7[2](v7, 0);
  }
  else
  {
    id v19 = objc_alloc((Class)NSError);
    id v20 = [v19 initWithDomain:kFMDErrorDomain code:1 userInfo:0];
    ((void (**)(id, id))v7)[2](v7, v20);
  }
}

- (void)unregisterAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  unsigned __int8 v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Now Unregistering Accessory - %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [[FMDInternalLocalFindableAccessory alloc] initWithLocalFindableAccessory:v6];
  id v10 = [(FMDServiceProvider *)self accessoryRegistry];
  [v10 removeAccessory:v9];

  [(FMDServiceProvider *)self registerDeviceWithCause:@"deviceDidUnpair" force:1];
  v7[2](v7, 0);
}

- (BOOL)isActivationLocked
{
  v2 = +[FMDServiceProvider activeServiceProvider];
  objc_super v3 = [v2 account];

  unsigned int v4 = [v3 lastIdentityTime];

  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v3 lastIdentityTime];
    v8[0] = 67109376;
    v8[1] = v4 != 0;
    __int16 v9 = 2048;
    id v10 = [v6 fm_epoch];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "isActivationLocked returned %i, %lli", (uint8_t *)v8, 0x12u);
  }
  return v4 != 0;
}

- (void)activationLockAuthInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDServiceProvider *)self account];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)FMDActivationLockAuthInfo);
    [v6 setIsFindMyON:1];
    [v6 setIsSignedIntoICloud:1];
    [v6 setIsActivationLockEnabled:-[FMDServiceProvider isActivationLocked](self, "isActivationLocked")];
    unint64_t v7 = [(FMDServiceProvider *)self _accountSecurityLevel];
    if (v7)
    {
      unint64_t v8 = v7;
      __int16 v9 = [(FMDServiceProvider *)self account];
      id v10 = [v9 adsid];

      int v11 = [(FMDServiceProvider *)self account];
      id v12 = [v11 dsid];

      [v6 setDsid:v12];
      [v6 setAltDsid:v10];
      [v6 setIsAccountHSA2:v8 == 4];
      LODWORD(v11) = [v6 isAccountHSA2];
      uint64_t v13 = sub_100004238();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "account is HSA2 - requesting pet", buf, 2u);
        }

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000A8DDC;
        v25[3] = &unk_1002DCB98;
        id v26 = v6;
        id v27 = v4;
        [(FMDServiceProvider *)self petForUserWithCompletion:v25];
      }
      else
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Account is non-HSA2. Not requesting PET - returning immediately", buf, 2u);
        }

        (*((void (**)(id, id, void))v4 + 2))(v4, v6, 0);
      }
    }
    else
    {
      v16 = sub_100004238();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1002429CC(v16, v17, v18, v19, v20, v21, v22, v23);
      }

      id v24 = objc_alloc((Class)NSError);
      id v10 = [v24 initWithDomain:kFMDErrorDomain code:5 userInfo:0];
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v10);
    }
  }
  else
  {
    v15 = sub_100004238();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No FMIP account for authinfo. Returning status as Find My OFF", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)FMDActivationLockAuthInfo);
    [v6 setIsFindMyON:0];
    [v6 setPet:0];
    (*((void (**)(id, id, void))v4 + 2))(v4, v6, 0);
  }
}

- (void)petForUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  if (v5)
  {
    id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    if (v6)
    {
      unint64_t v7 = [(FMDServiceProvider *)self account];
      id v8 = [v7 adsid];

      [v6 setAltDSID:v8];
      [v6 setAuthenticationType:1];
      [v6 setIsUsernameEditable:0];
      [v6 setServiceType:1];
      [v6 setShouldSkipSettingsLaunchAlert:1];
      [v6 setShouldPromptForPasswordOnly:1];
      [v6 setShouldUpdatePersistentServiceTokens:0];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000A9178;
      v13[3] = &unk_1002DB2E8;
      id v14 = v4;
      [v5 authenticateWithContext:v6 completion:v13];
    }
    else
    {
      int v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authContext", buf, 2u);
      }

      id v12 = objc_alloc((Class)NSError);
      id v8 = [v12 initWithDomain:kFMDErrorDomain code:5 userInfo:0];
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v8);
    }
  }
  else
  {
    __int16 v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authController", buf, 2u);
    }

    id v10 = objc_alloc((Class)NSError);
    id v6 = [v10 initWithDomain:kFMDErrorDomain code:5 userInfo:0];
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (unint64_t)_accountSecurityLevel
{
  v2 = [(FMDServiceProvider *)self account];
  objc_super v3 = [v2 adsid];

  if (v3)
  {
    id v4 = +[AKAccountManager sharedInstance];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 authKitAccountWithAltDSID:v3];
      if (v6)
      {
        id v7 = [v5 securityLevelForAccount:v6];
        id v8 = sub_100004238();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 134217984;
          id v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "securityLevel %lu", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        id v8 = sub_100004238();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to retrieve account", (uint8_t *)&v17, 2u);
        }
        id v7 = 0;
      }
    }
    else
    {
      id v6 = sub_100004238();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to instantiate accountManager", (uint8_t *)&v17, 2u);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100242A04(v5, v9, v10, v11, v12, v13, v14, v15);
    }
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (void)makeProviderActive
{
  objc_super v3 = [(FMDServiceProvider *)self account];
  id v4 = v3;
  if (!v3 || [v3 activityState] == 1) {
    goto LABEL_36;
  }
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMDServiceProvider *)self fm_logID];
    *(_DWORD *)buf = 138412290;
    v67 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#start Making %@ active...", buf, 0xCu);
  }
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 username];
    *(_DWORD *)buf = 138412290;
    v67 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#start Found account: %@", buf, 0xCu);
  }
  if ([(FMDServiceProvider *)self willMakeProviderActive])
  {
    [(FMDServiceProvider *)self setWaitingToMakeProviderActive:0];
    uint64_t v9 = +[NSMutableArray array];
    uint64_t v10 = +[NSMutableDictionary dictionary];
    [(FMDServiceProvider *)self setFuturesByCommandId:v10];

    uint64_t v11 = [[FMDSupportedAccessoryRegistry alloc] initWithDelegate:self];
    [(FMDServiceProvider *)self setSupportedAccessoryRegistry:v11];

    uint64_t v12 = [[FMDAccessoryRegistry alloc] initWithSupportDelete:self];
    [(FMDServiceProvider *)self setAccessoryRegistry:v12];

    uint64_t v13 = [FMDAccessoryRegistryDelegateAdaptor alloc];
    uint64_t v14 = [(FMDServiceProvider *)self accessoryRegistry];
    uint64_t v15 = [(FMDAccessoryRegistryDelegateAdaptor *)v13 initWithAccessoryRegistry:v14];
    [(FMDServiceProvider *)self setAccessoryRegistryDelegateAdaptor:v15];

    v16 = objc_alloc_init(FMDBluetoothManager);
    [(FMDServiceProvider *)self setBluetoothManager:v16];

    int v17 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
    id v18 = [(FMDServiceProvider *)self bluetoothManager];
    [v18 setSupportedAccessoryRegistry:v17];

    uint64_t v19 = [(FMDServiceProvider *)self accessoryRegistryDelegateAdaptor];
    uint64_t v20 = [(FMDServiceProvider *)self bluetoothManager];
    [(id)v20 setDelegate:v19];

    uint64_t v21 = [(FMDServiceProvider *)self bluetoothManager];
    [v9 addObject:v21];

    LOBYTE(v20) = +[FMPreferencesUtil BOOLForKey:@"DisableFindkit" inDomain:kFMDNotBackedUpPrefDomain];
    sub_100059878();
    uint64_t v22 = (FMDExtAccessoryManager *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = os_log_type_enabled(&v22->super, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v22->super, OS_LOG_TYPE_DEFAULT, "Findkit Disabled", buf, 2u);
      }
    }
    else
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v22->super, OS_LOG_TYPE_DEFAULT, "Findkit Enabled", buf, 2u);
      }

      id v26 = +[FMDExtConfigurationRegistry sharedInstance];
      uint64_t v22 = objc_alloc_init(FMDExtAccessoryManager);
      id v27 = [(FMDServiceProvider *)self accessoryRegistry];
      [(FMDExtAccessoryManager *)v22 setAccessoryRegistry:v27];

      [(FMDServiceProvider *)self setExtAccessoryManager:v22];
      v28 = [(FMDServiceProvider *)self extAccessoryManager];
      [v9 addObject:v28];
    }
    v29 = [FMDAccessoryLocationStore alloc];
    v30 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
    v31 = [(FMDServiceProvider *)self accessoryRegistry];
    v32 = [(FMDAccessoryLocationStore *)v29 initWithSupportedAccessoryRegistry:v30 accessoryRegistry:v31];
    [(FMDServiceProvider *)self setAccessoryLocationStore:v32];

    v33 = [(FMDServiceProvider *)self accessoryRegistry];
    [v33 registerDelegate:self];

    v34 = [(FMDServiceProvider *)self accessoryRegistry];
    v35 = [(FMDServiceProvider *)self accessoryLocationStore];
    [v34 registerDelegate:v35];

    v36 = [(FMDServiceProvider *)self accessoryRegistryDelegateAdaptor];
    v37 = +[FMDCompanionRegistryFactory companionRegistryWithDelegate:v36];

    [v9 addObject:v37];
    v38 = [(FMDServiceProvider *)self accessoryRegistry];
    [v38 addDataSources:v9];

    v39 = +[FMSystemInfo sharedInstance];
    if ([v39 isInternalBuild])
    {
      unsigned int v40 = +[FMPreferencesUtil BOOLForKey:@"AlertOnAccessoryConnect" inDomain:kFMDNotBackedUpPrefDomain];

      if (!v40)
      {
LABEL_21:
        v42 = +[FMDDaemon sharedInstance];
        v43 = [v4 apsEnvironmentConstant];
        v44 = [v42 apsHandlerForEnvironment:v43];

        [v44 registerDelegate:self forTopic:@"com.apple.mobileme.fmip"];
        v45 = [v44 apsToken];

        if (v45)
        {
          [(FMDServiceProvider *)self _sendStartupRegister];
        }
        else
        {
          v46 = sub_100004238();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "No APS token yet", buf, 2u);
          }

          v47 = +[FMSystemInfo sharedInstance];
          unsigned int v48 = [v47 isInternalBuild];

          if (v48)
          {
            objc_initWeak((id *)buf, self);
            dispatch_time_t v49 = dispatch_time(0, 5000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000A9D0C;
            block[3] = &unk_1002D9238;
            objc_copyWeak(&v65, (id *)buf);
            id v64 = v44;
            dispatch_after(v49, (dispatch_queue_t)&_dispatch_main_q, block);

            objc_destroyWeak(&v65);
            objc_destroyWeak((id *)buf);
          }
        }
        [(FMDServiceProvider *)self didMakeProviderActive];
        v50 = [(FMDServiceProvider *)self account];
        [v50 setActivityState:1];

        uint64_t v51 = [(FMDServiceProvider *)self authInvalidError];
        if (v51 != 1196379972)
        {
          v52 = sub_100004238();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = [(FMDServiceProvider *)self serviceName];
            v54 = [v4 username];
            v55 = +[NSString stringWithFourCC:v51];
            *(_DWORD *)buf = 138412802;
            v67 = v53;
            __int16 v68 = 2112;
            v69 = v54;
            __int16 v70 = 2112;
            v71 = v55;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@: Account %@ is invalid due to '%@'", buf, 0x20u);
          }
          v56 = +[FMSystemInfo sharedInstance];
          unsigned int v57 = [v56 isInternalBuild];

          if (v57)
          {
            v58 = sub_100004238();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              v59 = [(FMDServiceProvider *)self serviceName];
              *(_DWORD *)buf = 138412290;
              v67 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);
            }
          }
          [(FMDServiceProvider *)self tryToFetchAuthToken];
        }
        v60 = +[FMDSPStatusUtil sharedInstance];
        objc_initWeak((id *)buf, self);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000A9DF4;
        v61[3] = &unk_1002D93C8;
        objc_copyWeak(&v62, (id *)buf);
        [v60 setStatsChangeHandler:v61];
        [v60 refreshBeaconStats];
        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)buf);

        goto LABEL_36;
      }
      v39 = +[FMDInternalAccessoryConnectionMonitor sharedMonitor];
      v41 = [(FMDServiceProvider *)self accessoryRegistry];
      [v41 registerDelegate:v39];
    }
    goto LABEL_21;
  }
  id v24 = sub_100004238();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(FMDServiceProvider *)self fm_logID];
    *(_DWORD *)buf = 138412290;
    v67 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not making %@ active now", buf, 0xCu);
  }
  [(FMDServiceProvider *)self setWaitingToMakeProviderActive:1];
LABEL_36:
}

- (BOOL)willMakeProviderActive
{
  return 1;
}

- (void)makeProviderInactive
{
  objc_super v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(FMDServiceProvider *)self fm_logID];
    int v20 = 138412290;
    uint64_t v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Making %@ inactive...", (uint8_t *)&v20, 0xCu);
  }
  id v5 = [(FMDServiceProvider *)self account];
  id v6 = [(FMDServiceProvider *)self account];
  [v6 setActivityState:2];

  [(FMDServiceProvider *)self willMakeProviderInactive];
  id v7 = [(FMDServiceProvider *)self serverInteractionController];
  [v7 cancelAllRequests];

  id v8 = +[ActionManager sharedManager];
  [v8 cancelAllActions];

  uint64_t v9 = [(FMDServiceProvider *)self standardLocator];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(FMDServiceProvider *)self standardLocator];
    unsigned int v12 = [v11 locatorRunning];

    if (v12)
    {
      uint64_t v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Stopping standard locate...", (uint8_t *)&v20, 2u);
      }

      uint64_t v14 = [(FMDServiceProvider *)self standardLocator];
      [v14 stopLocator];

      uint64_t v15 = [(FMDServiceProvider *)self standardLocator];
      [v15 setStoppedLocatorBlock:0];
    }
  }
  [(FMDServiceProvider *)self setStandardLocator:0];
  v16 = +[FMDDaemon sharedInstance];
  int v17 = [v5 apsEnvironmentConstant];
  id v18 = [v16 apsHandlerForEnvironment:v17];

  [v18 deregisterDelegate:self];
  uint64_t v19 = +[FMDSPStatusUtil sharedInstance];
  [v19 setStatsChangeHandler:0];
  [v19 cancelRefresh];
  [(FMDServiceProvider *)self didMakeProviderInactive];
}

- (void)_sendStartupRegister
{
  objc_super v3 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AA180;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)queueAccessoryActionsIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider checking if we need to QC for accessory", (uint8_t *)&v16, 2u);
  }

  if (!v4)
  {
    unsigned int v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider Skipping QC due to nil accessory.", (uint8_t *)&v16, 2u);
    }
    goto LABEL_10;
  }
  id v6 = [v4 commandContext];
  unsigned int v7 = [v6 pendingAction];

  if (v7)
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider QC required for %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v9 = [AccessoryAction alloc];
    uint64_t v10 = [(FMDServiceProvider *)self account];
    uint64_t v11 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v4];
    unsigned int v12 = [(AccessoryAction *)v9 initWithAccount:v10 accessory:v4 requiresConnectivity:1 serverInteractionController:v11];

    uint64_t v13 = [(FMDServiceProvider *)self accessoryRegistry];
    [v13 registerDelegate:v12];

    uint64_t v14 = +[ActionManager sharedManager];
    id v15 = [v14 enqueueAction:v12];

LABEL_10:
  }
}

- (void)registerCommonNotifications
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"deviceNameChanged:" name:@"FMDDeviceNameChangedNotification" object:0];
  [v4 addObserver:self selector:"passcodeStateChanged:" name:@"FMDPasscodeStateChangedNotification" object:0];
  [v4 addObserver:self selector:"allowPasscodeModificationChanged:" name:@"FMDAllowPasscodeModificationChangedNotification" object:0];
  [v4 addObserver:self selector:"locationServicesStateChanged:" name:@"FMDLocationServicesStateChangedNotification" object:0];
  [v4 addObserver:self selector:"localeChanged:" name:@"FMDLocaleChangedNotification" object:0];
  [v4 addObserver:self selector:"searchPartyBeaconsChanged:" name:@"kFMDDeviceSPSelfBeaconChangeNotification" object:0];
  [v4 addObserver:self selector:"_handleAccessoryDidPairNotification:" name:@"kFMDAccessoryDidPairLocalNotification" object:0];
  objc_super v3 = [(FMDServiceProvider *)self accessoryRegistry];
  [v4 addObserver:v3 selector:"refetchBauuids:" name:@"kFMDAccessoryDidPairLocalNotification" object:0];
}

- (void)deregisterCommonNotifications
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"FMDDeviceNameChangedNotification" object:0];
  [v4 removeObserver:self name:@"FMDPasscodeStateChangedNotification" object:0];
  [v4 removeObserver:self name:@"FMDAllowPasscodeModificationChangedNotification" object:0];
  [v4 removeObserver:self name:@"FMDLocationServicesStateChangedNotification" object:0];
  [v4 removeObserver:self name:@"FMDLocaleChangedNotification" object:0];
  [v4 removeObserver:self name:@"kFMDDeviceSPSelfBeaconChangeNotification" object:0];
  [v4 removeObserver:self name:@"kFMDAccessoryDidPairLocalNotification" object:0];
  objc_super v3 = [(FMDServiceProvider *)self accessoryRegistry];
  [v4 removeObserver:v3 name:@"kFMDAccessoryDidPairLocalNotification" object:0];
}

- (id)urlForRequestType:(id)a3
{
  id v4 = a3;
  id v5 = +[FMDServerConfig sharedInstance];
  id v6 = [v5 urlTemplateForRequestType:v4];

  if (v6)
  {
    unsigned int v7 = +[FMDSystemConfig sharedInstance];
    id v8 = [v7 deviceUDID];

    uint64_t v9 = objc_alloc_init(RequestTemplateURL);
    uint64_t v10 = [(FMDServiceProvider *)self account];
    uint64_t v11 = [(RequestTemplateURL *)v9 urlFromTemplate:v6 account:v10 udid:v8];
  }
  else
  {
    unsigned int v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Did not find a url template for request type : %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)serverInteractionControllerForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessoryIdentifier];
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_1000A7CCC;
    int v16 = sub_1000A7CDC;
    id v17 = 0;
    id v6 = [(FMDServiceProvider *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AAAAC;
    block[3] = &unk_1002D9990;
    p_long long buf = &buf;
    void block[4] = self;
    id v11 = v5;
    dispatch_sync(v6, block);

    id v7 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to get serverInteractionController by accessory since accessoryIdentifier was nil. Accessory: %@.", (uint8_t *)&buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)serverInteractionControllerForAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 authId], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    *(void *)long long buf = 0;
    id v15 = buf;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_1000A7CCC;
    id v18 = sub_1000A7CDC;
    id v19 = 0;
    id v7 = [(FMDServiceProvider *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AADC8;
    block[3] = &unk_1002D9990;
    uint64_t v13 = buf;
    void block[4] = self;
    id v12 = v5;
    dispatch_sync(v7, block);

    id v8 = *((id *)v15 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unable to get serverinteractioncontroller by account since account or authID (DSID) was nil", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = [[RegisterAction alloc] initWithReason:v6 force:v4 provider:self];

  id v7 = +[ActionManager sharedManager];
  id v8 = [v7 enqueueAction:v9];
}

- (unsigned)essentialServerInfoMissingError
{
  unsigned int v3 = [(FMDServiceProvider *)self authInvalidError];
  if (v3 == 1196379972)
  {
    BOOL v4 = +[FMDDaemon sharedInstance];
    id v5 = [(FMDServiceProvider *)self account];
    id v6 = [v5 apsEnvironmentConstant];
    id v7 = [v4 apsHandlerForEnvironment:v6];

    id v8 = [v7 apsToken];

    if (v8) {
      unsigned int v3 = 1196379972;
    }
    else {
      unsigned int v3 = 1480675411;
    }
  }
  return v3;
}

- (unsigned)authInvalidError
{
  unsigned int v3 = [(FMDServiceProvider *)self account];

  if (!v3) {
    return 1480672067;
  }
  BOOL v4 = [(FMDServiceProvider *)self account];
  id v5 = [v4 username];
  id v6 = [v5 length];

  if (!v6) {
    return 1481986898;
  }
  id v7 = [(FMDServiceProvider *)self account];
  id v8 = [v7 authToken];
  id v9 = [v8 length];

  if (!v9) {
    return 1481920331;
  }
  uint64_t v10 = [(FMDServiceProvider *)self account];
  id v11 = [v10 authId];
  id v12 = [v11 length];

  if (v12) {
    return 1196379972;
  }
  else {
    return 1482639684;
  }
}

- (void)tryToFetchAuthToken
{
  id v3 = [(FMDServiceProvider *)self account];
  v2 = [v3 authToken];
  [v2 length];
}

- (id)newLocationManager
{
  v2 = +[FMDLocationManagerFactory sharedInstance];
  id v3 = [v2 newLocationManager];

  return v3;
}

- (void)showAlertFromServerResponse:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100242A3C();
  }

  id v5 = [v3 objectForKeyedSubscript:@"title"];
  id v6 = [v3 objectForKeyedSubscript:@"text"];
  id v7 = [v3 objectForKeyedSubscript:@"okButtonTitle"];
  id v8 = [v3 objectForKeyedSubscript:@"okButtonURL"];
  id v9 = [v3 objectForKeyedSubscript:@"okButtonAction"];
  uint64_t v10 = [v3 objectForKeyedSubscript:@"cancelButtonTitle"];
  id v11 = [v3 objectForKeyedSubscript:@"cancelButtonURL"];
  id v12 = [v3 objectForKeyedSubscript:@"cancelButtonAction"];
  uint64_t v13 = [v3 objectForKeyedSubscript:@"delay"];
  [v13 doubleValue];
  double v15 = v14;

  if (v5)
  {
    v33 = v10;
    uint64_t v16 = v7;
    unsigned __int8 v17 = +[FMDPreferencesMgr accessibilityFontSizeEnabled];
    id v18 = objc_alloc_init((Class)FMAlert);
    [v18 setCategory:2];
    if (v17)
    {
      id v19 = [v5 fm_stringByReplacingNonBreakingSpaces];
      [v18 setMsgTitle:v19];

      int v20 = [v6 fm_stringByReplacingNonBreakingSpaces];
      [v18 setMsgText:v20];
    }
    else
    {
      [v18 setMsgTitle:v5];
      [v18 setMsgText:v6];
    }
    [v18 setShowMsgInLockScreen:1];
    [v18 setDismissMsgOnUnlock:0];
    [v18 setDismissMsgOnLock:0];
    id v7 = v16;
    [v18 setDefaultButtonTitle:v16];
    if (v8) {
      BOOL v21 = v9 == 0;
    }
    else {
      BOOL v21 = 0;
    }
    if (v21) {
      id v9 = @"open-url";
    }
    if (v11) {
      BOOL v22 = v12 == 0;
    }
    else {
      BOOL v22 = 0;
    }
    if (v22) {
      id v12 = @"open-url";
    }
    if (v9)
    {
      BOOL v23 = [(FMDServiceProvider *)self alertActionInfoForAction:v9 andURL:v8];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000AB798;
      v39[3] = &unk_1002D93F0;
      unsigned int v40 = v9;
      id v41 = v23;
      id v24 = v23;
      [v18 setDefaultButtonAction:v39];

      id v7 = v16;
    }
    [v18 setAlternateButtonTitle:v33];
    if (v12)
    {
      v25 = [(FMDServiceProvider *)self alertActionInfoForAction:v12 andURL:v11];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000AB850;
      v36[3] = &unk_1002D93F0;
      v37 = v12;
      id v38 = v25;
      id v26 = v25;
      [v18 setAlternateButtonAction:v36];
    }
    id v27 = [v18 defaultButtonTitle];
    if (!v27)
    {
      v28 = [v18 alternateButtonTitle];

      if (v28) {
        goto LABEL_24;
      }
      id v27 = [@"FMD_DEFAULT_ALERT_BUTTON" fmd_localizedString];
      [v18 setDefaultButtonTitle:v27];
    }

LABEL_24:
    if (v15 <= 0.0)
    {
      v31 = +[FMAlertManager sharedInstance];
      [v31 activateAlert:v18];
    }
    else
    {
      v29 = sub_100004238();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        double v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      dispatch_time_t v30 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AB908;
      block[3] = &unk_1002D9378;
      id v35 = v18;
      dispatch_after(v30, (dispatch_queue_t)&_dispatch_main_q, block);
      v31 = v35;
    }

    uint64_t v10 = v33;
  }
}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  return 0;
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  BOOL v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(FMDServiceProvider *)self serviceName];
    id v6 = [(FMDServiceProvider *)self account];
    id v7 = [v6 username];
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - Auth failure received for account %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)didReceiveServerAlertForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 alertFromServerResponse];

  if (v5)
  {
    id v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100242AA4(v4, v6);
    }

    id v7 = [v4 alertFromServerResponse];
    [(FMDServiceProvider *)self showAlertFromServerResponse:v7];
  }
}

- (void)deviceNameChanged:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Register for device name change", v5, 2u);
  }

  [(FMDServiceProvider *)self registerDeviceWithCause:@"DeviceNameChanged" force:0];
}

- (void)passcodeStateChanged:(id)a3
{
}

- (void)allowPasscodeModificationChanged:(id)a3
{
}

- (void)locationServicesStateChanged:(id)a3
{
  [(FMDServiceProvider *)self registerDeviceWithCause:@"LocationServicesStateChanged" force:0];
  id v4 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v5 = [v4 isLocationServicesEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(FMDServiceProvider *)self accessoryLocationStore];
    [v6 clearAccessoryLocationStore];
  }
}

- (void)localeChanged:(id)a3
{
}

- (void)searchPartyBeaconsChanged:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Register for search Party Beacons Changed", buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ABD14;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleAccessoryDidPairNotification:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_handleAccessoryDidPairNotification", v6, 2u);
  }

  dispatch_time_t v5 = [(FMDServiceProvider *)self accessoryRegistry];
  [v5 reloadData];
}

- (void)accessoryDidUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 category] == (id)1 || objc_msgSend(v4, "category") == (id)3)
  {
    dispatch_time_t v5 = sub_1000596B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100242B58();
    }

    id v6 = [AccessoryRegisterAction alloc];
    id v7 = [(FMDServiceProvider *)self account];
    int v8 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v4];
    id v9 = [(AccessoryRegisterAction *)v6 initWithAccount:v7 accessory:v4 cause:@"accessoryRegistryUpdate" force:0 serverInteractionController:v8];

    [(AccessoryRegisterAction *)v9 setIncludeDeviceState:1];
    __int16 v10 = +[FMDOperationManager sharedManager];
    id v11 = [v4 accessoryIdentifier];
    id v12 = [v11 stringValue];
    [v10 addAction:v9 forIdentifier:v12];
  }
}

- (void)accessoryDidConnect:(id)a3
{
}

- (void)accessoryDidPair:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory did pair : sending a register: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
  [v6 resetSupportedAccessoriesVersion];

  [(FMDServiceProvider *)self registerDeviceWithCause:@"deviceDidPair" force:0];
  +[AccessoryRegisterAction cleanupContextForAccessory:v4];
  unsigned int v7 = [v4 conformsToProtocol:&OBJC_PROTOCOL___FMDAudioAccessory];
  int v8 = sub_100004238();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Audio Accessory did pair", (uint8_t *)&v13, 2u);
    }

    __int16 v10 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
    id v11 = [v10 assetsForAccessory:v4];

    id v12 = [(FMDServiceProvider *)self accessoryRegistry];
    [v12 updateAccessory:v4 assets:v11];
  }
  else
  {
    if (v9)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Internal Accessory did pair", (uint8_t *)&v13, 2u);
    }

    id v11 = [(FMDServiceProvider *)self accessoryRegistry];
    [v11 forceUpdateAccessory:v4];
  }
}

- (void)accessoryDidUnpair:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory did un-pair : sending a register.", v7, 2u);
  }

  [(FMDServiceProvider *)self registerDeviceWithCause:@"deviceDidUnpair" force:0];
  id v6 = [v4 commandContext];
  [v6 cleanupContexts];

  +[AccessoryRegisterAction cleanupContextForAccessory:v4];
}

- (BOOL)supportsAccessory:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100242BC0();
  }

  id v6 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
  unsigned __int8 v7 = [v6 isAccessorySupported:v4];

  return v7;
}

- (void)supportedAccessoryRegistryDidUpdateSupportedAccessories:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(FMDServiceProvider *)self accessoryRegistry];
  id v6 = [v5 allAccessories];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1000AC2D8;
  v8[3] = &unk_1002DCBC0;
  id v9 = v4;
  __int16 v10 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (BOOL)enqueueRequest:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(FMDServiceProvider *)self account];
  LOBYTE(self) = [(FMDServiceProvider *)self enqueueRequest:v4 account:v5];

  return (char)self;
}

- (BOOL)enqueueRequest:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    id v9 = [v7 authId];
    __int16 v10 = [(FMDServiceProvider *)self account];
    id v11 = [v10 authId];
    id v12 = [v9 localizedCaseInsensitiveCompare:v11];

    if (v12) {
      [(FMDServiceProvider *)self serverInteractionControllerForAccount:v8];
    }
    else {
    uint64_t v16 = [(FMDServiceProvider *)self serverInteractionController];
    }
    unsigned __int8 v15 = [v16 enqueueRequest:v6];
  }
  else
  {
    int v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 fm_logID];
      int v18 = 138412290;
      id v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not sending request %@ to server since there is no account. This seems like a stray request that escaped the deinitialization process", (uint8_t *)&v18, 0xCu);
    }
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)enqueueRequest:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(FMDServiceProvider *)self account];

  if (!v8)
  {
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 fm_logID];
      int v15 = 138412290;
      uint64_t v16 = v12;
      int v13 = "Not sending request %@ to server since there is no account. This seems like a stray request that escaped the"
            " deinitialization process";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }
LABEL_9:

    unsigned __int8 v10 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 fm_logID];
      int v15 = 138412290;
      uint64_t v16 = v12;
      int v13 = "Not sending request %@ to server since there is no accessory. This seems like a stray request that escaped t"
            "he deinitialization process";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v9 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v7];
  unsigned __int8 v10 = [v9 enqueueRequest:v6];

LABEL_10:
  return v10;
}

- (void)didReceiveAPSMessage:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)v58 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Push message received %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKey:@"fmipIntents"];
  uint64_t v7 = [v4 objectForKey:@"fmipAccessoryIntents"];
  int v8 = [v4 objectForKey:@"fmipId"];
  v50 = [v4 objectForKeyedSubscript:@"serverContext"];
  id v9 = +[FMSystemInfo sharedInstance];
  if ([v9 isInternalBuild])
  {
    unsigned int v10 = +[FMDPreferencesMgr disablePush];

    if (v10)
    {
      id v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Pushes are disabled", buf, 2u);
      }
LABEL_14:

      goto LABEL_65;
    }
  }
  else
  {
  }
  if (![(FMDServiceProvider *)self _handleSecureLocationsPush:v4])
  {
    id v12 = [(FMDServiceProvider *)self account];

    if (!v12)
    {
      id v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100242C28(v11, v15, v16, v17, v18, v19, v20, v21);
      }
      goto LABEL_14;
    }
    int v13 = +[FMSystemInfo sharedInstance];
    if ([v13 isInternalBuild]) {
      unsigned int v14 = +[FMDPreferencesMgr disableIntents];
    }
    else {
      unsigned int v14 = 0;
    }

    if (v6 | v7 && v14)
    {
      BOOL v22 = sub_100004238();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Intents are disabled", buf, 2u);
      }
    }
    if ((((v6 | v7) == 0) | v14) == 1)
    {
      [(FMDServiceProvider *)self _handlePushWithoutIntents:v50];
    }
    else
    {
      unsigned int v23 = [(FMDServiceProvider *)self _isValidIntentAccountId:v8];
      id v24 = sub_100004238();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)v58 = v23;
        *(_WORD *)&v58[4] = 2112;
        *(void *)&v58[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "isValidIntentAccount %d for intentAccountId %@", buf, 0x12u);
      }

      if (v23)
      {
        uint64_t v51 = +[NSMutableSet set];
        if (v7)
        {
          v45 = v8;
          uint64_t v46 = v7;
          uint64_t v47 = v6;
          id v48 = v4;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id obj = (id)v7;
          id v25 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v53;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v53 != v27) {
                  objc_enumerationMutation(obj);
                }
                v29 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                dispatch_time_t v30 = [v29 objectForKey:@"id"];
                v31 = [v29 objectForKey:@"type"];
                if ([v31 isEqualToString:@"SND"])
                {
                  [(FMDServiceProvider *)self _handleSoundIntent:v29 serverContext:v50];
                }
                else if ([v31 isEqualToString:@"LOC"])
                {
                  [(FMDServiceProvider *)self _handleLocateIntent:v29 serverContext:v50];
                }
                else if ([v31 isEqualToString:@"QC"])
                {
                  [(FMDServiceProvider *)self _handleQCIntent:v29 serverContext:v50];
                }
                [v51 addObject:v30];
              }
              id v26 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
            }
            while (v26);
          }

          uint64_t v6 = v47;
          id v4 = v48;
          int v8 = v45;
          uint64_t v7 = v46;
        }
        if (v6)
        {
          v32 = [(id)v6 objectForKey:@"SND"];
          v33 = v32;
          if (v32)
          {
            v34 = [v32 objectForKey:@"id"];
            if ([v51 containsObject:v34])
            {
              id v35 = sub_100004238();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                sub_100242C60();
              }
            }
            else
            {
              [(FMDServiceProvider *)self _handleSoundIntent:v33 serverContext:v50];
            }
          }
          v36 = self;
          v37 = [(id)v6 objectForKey:@"LOC"];
          id v38 = v37;
          if (v37)
          {
            v39 = [v37 objectForKey:@"id"];
            if ([v51 containsObject:v39])
            {
              unsigned int v40 = sub_100004238();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                sub_100242C60();
              }
            }
            else
            {
              [(FMDServiceProvider *)v36 _handleLocateIntent:v38 serverContext:v50];
            }
          }
          id v41 = [(id)v6 objectForKey:@"QC"];
          v42 = v41;
          if (v41)
          {
            double v43 = [v41 objectForKey:@"id"];
            if ([v51 containsObject:v43])
            {
              v44 = sub_100004238();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
                sub_100242C60();
              }
            }
            else
            {
              [(FMDServiceProvider *)v36 _handleQCIntent:v42 serverContext:v50];
            }
          }
        }
      }
    }
  }
LABEL_65:
}

- (void)didReceiveAPSToken:(id)a3
{
  if ([(FMDServiceProvider *)self completedStartupRegister])
  {
    [(FMDServiceProvider *)self registerDeviceWithCause:@"APSTokenReceived" force:0];
  }
  else
  {
    [(FMDServiceProvider *)self _sendStartupRegister];
  }
}

- (void)_handlePushWithoutIntents:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling push without intent %@", buf, 0xCu);
  }

  uint64_t v6 = [(FMDServiceProvider *)self essentialServerInfoMissingError];
  if (v6 == 1196379972)
  {
    uint64_t v7 = [FMDActingRequestDecorator alloc];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AD0C0;
    v23[3] = &unk_1002D9458;
    v23[4] = self;
    uint64_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_1000AD13C;
    uint64_t v21 = &unk_1002D9458;
    id v22 = v4;
    int v8 = [(FMDActingRequestDecorator *)v7 initWithDeviceContextGenerator:&stru_1002DCBE0 deviceInfoGenerator:v23 serverContextGenerator:&v18 requestHeaderGenerator:0];
    id v9 = [QCAction alloc];
    unsigned int v10 = [(FMDServiceProvider *)self account];
    id v11 = [(FMDServiceProvider *)self serverInteractionController];
    id v12 = [(QCAction *)v9 initWithAccount:v10 shutdownActivityPending:0 serverInteractionController:v11];

    [(QCAction *)v12 setRequestDecorator:v8];
    int v13 = +[ActionManager sharedManager];
    id v14 = [v13 enqueueAction:v12];
  }
  else
  {
    uint64_t v15 = v6;
    uint64_t v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = +[NSString stringWithFourCC:v15];
      *(_DWORD *)long long buf = 138412290;
      id v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignoring APS message since some essential server info is missing - '%@'", buf, 0xCu);
    }
    [(FMDServiceProvider *)self tryToFetchAuthToken];
  }
}

- (void)_handleLocateIntent:(id)a3 serverContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 objectForKey:@"id"];
  if (v8)
  {
    id v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Locate command intent found", (uint8_t *)&v24, 2u);
    }

    unsigned int v10 = [v6 objectForKey:@"udid"];
    id v11 = [v10 fm_nullToNil];

    if ([v11 length])
    {
      id v12 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v11];
      int v13 = [(FMDServiceProvider *)self accessoryRegistry];
      id v14 = [v13 accessoryForIdentifier:v12];

      if (v14)
      {
        uint64_t v15 = [v14 commandContext];
        [v15 setPendingActionIntent:v6];

        uint64_t v16 = sub_100004238();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412546;
          id v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", (uint8_t *)&v24, 0x16u);
        }

        uint64_t v17 = [AccessoryAction alloc];
        uint64_t v18 = [(FMDServiceProvider *)self account];
        uint64_t v19 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v14];
        uint64_t v20 = [(AccessoryAction *)v17 initWithAccount:v18 accessory:v14 requiresConnectivity:0 serverInteractionController:v19];

        uint64_t v21 = [(FMDServiceProvider *)self accessoryRegistry];
        [v21 registerDelegate:v20];

        id v22 = +[ActionManager sharedManager];
        id v23 = [v22 enqueueAction:v20];
      }
    }
    else
    {
      [(FMDServiceProvider *)self _handlePushWithoutIntents:v7];
    }
  }
}

- (void)_handleQCIntent:(id)a3 serverContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 objectForKey:@"id"];
  id v9 = [v6 objectForKey:@"udid"];
  unsigned int v10 = [v9 fm_nullToNil];

  id v11 = [v6 objectForKey:@"waitForConnect"];
  id v12 = [v11 BOOLValue];

  if (v8)
  {
    int v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "QC intent found", buf, 2u);
    }

    if ([v10 length])
    {
      id v14 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v10];
      uint64_t v15 = [(FMDServiceProvider *)self accessoryRegistry];
      uint64_t v16 = [v15 accessoryForIdentifier:v14];

      if (v16)
      {
        id v26 = v14;
        uint64_t v17 = [v16 commandContext];
        [v17 setPendingActionIntent:v6];

        uint64_t v18 = sub_100004238();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          v28 = v16;
          __int16 v29 = 2112;
          dispatch_time_t v30 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", buf, 0x16u);
        }

        uint64_t v19 = [AccessoryAction alloc];
        uint64_t v20 = [(FMDServiceProvider *)self account];
        uint64_t v21 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v16];
        id v22 = [(AccessoryAction *)v19 initWithAccount:v20 accessory:v16 requiresConnectivity:v12 serverInteractionController:v21];

        id v23 = [(FMDServiceProvider *)self accessoryRegistry];
        [v23 registerDelegate:v22];

        int v24 = +[ActionManager sharedManager];
        id v25 = [v24 enqueueAction:v22];

        id v14 = v26;
      }
    }
    else
    {
      [(FMDServiceProvider *)self _handlePushWithoutIntents:v7];
    }
  }
}

- (id)futureForCommandId:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(FMDServiceProvider *)self futuresByCommandId];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setFuture:(id)a3 commandId:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(FMDServiceProvider *)self futuresByCommandId];
    [v8 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)removeFutureForCommandId:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(FMDServiceProvider *)self futuresByCommandId];
    [v5 removeObjectForKey:v4];
  }
}

- (void)clearFutures
{
  id v2 = [(FMDServiceProvider *)self futuresByCommandId];
  [v2 removeAllObjects];
}

- (void)_handleSoundIntent:(id)a3 serverContext:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"id"];
  id v7 = [v5 objectForKey:@"maxDurationInSeconds"];
  id v8 = [v5 objectForKey:@"udid"];
  id v9 = [v8 fm_nullToNil];

  if (v6)
  {
    unsigned int v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v7 doubleValue];
      *(_DWORD *)long long buf = 134217984;
      v73 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Play sound intent found, playing sound for %f seconds...", buf, 0xCu);
    }

    if ([v9 length])
    {
      id v12 = [v5 objectForKey:@"rampUpDurationInSeconds"];
      int v13 = [v5 objectForKey:@"rampDownDurationInSeconds"];
      __int16 v68 = [v5 objectForKey:@"channels"];
      id v14 = [v5 objectForKey:@"userConfirmedSafetyWarning"];
      unsigned int v61 = [v14 BOOLValue];

      uint64_t v15 = [v5 objectForKey:@"forceConnection"];
      unsigned int v60 = [v15 BOOLValue];

      uint64_t v16 = [v5 objectForKeyedSubscript:@"scanDurationInSeconds"];
      v71 = [v5 objectForKey:@"intentEpochTime"];
      __int16 v70 = [v5 objectForKey:@"intentExpiryInSeconds"];
      v69 = [v5 objectForKey:@"delayIntervalInSeconds"];
      v67 = [v5 objectForKey:@"inEarDetectionTimeout"];
      id v17 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v9];
      uint64_t v18 = [(FMDServiceProvider *)self accessoryRegistry];
      v66 = v17;
      uint64_t v19 = [v18 accessoryForIdentifier:v17];

      uint64_t v20 = sub_100004238();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        id v65 = v7;
        if (v21)
        {
          *(_DWORD *)long long buf = 138412546;
          v73 = v19;
          __int16 v74 = 2112;
          v75 = v9;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", buf, 0x16u);
        }

        id v22 = [v19 commandContext];
        [v22 setPendingActionIntent:v5];

        id v23 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
        [v23 downloadAssetsIfNeededForAccessory:v19];

        int v24 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
        id v59 = [v24 defaultTimeoutAudioSafetyStatusForAccessory:v19];

        uint64_t v20 = +[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", [v71 integerValue]);
        v63 = v16;
        id v64 = v13;
        id v62 = v12;
        if (!v70) {
          goto LABEL_11;
        }
        [v70 doubleValue];
        if (v25 <= 0.0) {
          goto LABEL_11;
        }
        [v70 doubleValue];
        id v26 = -[NSObject dateByAddingTimeInterval:](v20, "dateByAddingTimeInterval:");
        uint64_t v27 = +[NSDate date];
        [v27 timeIntervalSinceReferenceDate];
        double v29 = v28;
        [v26 timeIntervalSinceReferenceDate];
        double v31 = v30;

        if (v29 < v31)
        {
LABEL_11:
          v32 = [(FMDServiceProvider *)self futureForCommandId:v6];

          if (v32)
          {
            v33 = sub_100004238();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider handling for command id has already started", buf, 2u);
            }
          }
          else
          {
            [(FMDServiceProvider *)self clearFutures];
            v58 = objc_alloc_init((Class)FMFuture);
            [(FMDServiceProvider *)self setFuture:v58 commandId:v6];
            id v35 = [(FMDServiceProvider *)self supportedAccessoryRegistry];
            uint64_t v36 = [v35 playbackChannelNamesForAccessory:v19 commandChannels:v68];

            v37 = [FMDAccessoryPlaySoundAction alloc];
            [(FMDServiceProvider *)self accessoryRegistry];
            v39 = id v38 = v12;
            unsigned int v40 = [(FMDAccessoryPlaySoundAction *)v37 initWithAccessory:v19 accessoryRegistry:v39 channels:v36];

            [(FMDAccessoryPlaySoundAction *)v40 setDuration:v65];
            [(FMDAccessoryPlaySoundAction *)v40 setTimeout:v63];
            id v41 = v38;
            v33 = v58;
            [(FMDAccessoryPlaySoundAction *)v40 setRampUpDuration:v41];
            [(FMDAccessoryPlaySoundAction *)v40 setRampDownDuration:v64];
            [(FMDAccessoryPlaySoundAction *)v40 setDefaultAudioSafetyStatus:v59];
            [(FMDAccessoryPlaySoundAction *)v40 setFuture:v58];
            [(FMDAccessoryPlaySoundAction *)v40 setForceConnection:v60];
            [(FMDAccessoryPlaySoundAction *)v40 setBypassInEarCheck:v61];
            [(FMDAccessoryPlaySoundAction *)v40 setInEarDetectionTimeout:v67];
            v42 = [(FMDServiceProvider *)self bluetoothManager];
            [(FMDAccessoryPlaySoundAction *)v40 setBluetoothManager:v42];

            double v43 = [(FMDServiceProvider *)self accessoryRegistry];
            [v43 registerDelegate:v40];

            v44 = +[ActionManager sharedManager];
            id v45 = [v44 enqueueAction:v40];

            __int16 v68 = (void *)v36;
          }
        }
        uint64_t v46 = [AccessoryAction alloc];
        uint64_t v47 = [(FMDServiceProvider *)self account];
        id v48 = [(FMDServiceProvider *)self serverInteractionControllerForAccessory:v19];
        dispatch_time_t v49 = [(AccessoryAction *)v46 initWithAccount:v47 accessory:v19 requiresConnectivity:0 serverInteractionController:v48];

        v50 = [(FMDServiceProvider *)self accessoryRegistry];
        [v50 registerDelegate:v49];

        [v69 doubleValue];
        if (v51 <= 0.0)
        {
          long long v54 = +[ActionManager sharedManager];
          id v57 = [(TimedWaitAction *)v54 enqueueAction:v49];
        }
        else
        {
          long long v52 = [TimedWaitAction alloc];
          [v69 doubleValue];
          long long v53 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
          long long v54 = [(TimedWaitAction *)v52 initWithAction:v49 executeAt:v53];

          long long v55 = +[ActionManager sharedManager];
          id v56 = [v55 enqueueAction:v54];
        }
        int v13 = v64;
        id v7 = v65;
        id v12 = v62;

        uint64_t v16 = v63;
      }
      else if (v21)
      {
        *(_DWORD *)long long buf = 138412290;
        v73 = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No accessory found with id %@. Ignoring the push", buf, 0xCu);
      }
    }
    else
    {
      v34 = +[FMDStartupRegisterManager sharedInstance];
      [v34 eventDidOccur:4];

      id v12 = +[NSString stringWithFormat:@"command-%@-id", @"message"];
      +[FMPreferencesUtil setString:v6 forKey:v12 inDomain:kFMDPrefDomain];
      +[FMPreferencesUtil setString:v6 forKey:@"lastCommandId" inDomain:kFMDNotBackedUpPrefDomain];
    }
  }
}

- (BOOL)_isValidIntentAccountId:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDServiceProvider *)self account];
  id v6 = [v5 adsid];

  id v7 = [v6 dataUsingEncoding:4];
  CC_SHA256([v7 bytes], (CC_LONG)[v7 length], md);
  id v8 = +[NSData dataWithBytes:md length:32];
  id v9 = [v8 base64EncodedStringWithOptions:0];
  unsigned int v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Comparing ADSIDs (_isValidIntentAccountId) %@ : %@", (uint8_t *)&v13, 0x16u);
  }

  unsigned __int8 v11 = [v4 isEqualToString:v9];
  return v11;
}

- (void)_accountDidChangeFrom:(id)a3 to:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  if (v13 && !v5)
  {
    id v6 = +[FMDStartupRegisterManager sharedInstance];
    id v7 = v6;
    uint64_t v8 = 1;
LABEL_8:
    [v6 eventDidOccur:v8];

    goto LABEL_9;
  }
  if (v13)
  {
    if (v5)
    {
      id v9 = [v13 authId];
      unsigned int v10 = [v5 authId];
      unsigned __int8 v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = +[FMDStartupRegisterManager sharedInstance];
        [v12 eventDidOccur:1];

        id v6 = +[FMDStartupRegisterManager sharedInstance];
        id v7 = v6;
        uint64_t v8 = 0;
        goto LABEL_8;
      }
    }
  }
LABEL_9:
}

- (BOOL)_handleSecureLocationsPush:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"findmyws"];
  if (v4)
  {
    id v5 = +[FMXPCTransactionManager sharedInstance];
    [v5 beginTransaction:@"MDSecureLocationsHandlePushTransaction"];

    id v6 = [v4 objectForKey:@"locationPayload"];
    id v7 = [v4 objectForKey:@"cmd"];
    id v23 = 0;
    uint64_t v8 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v23];
    id v9 = v23;
    BOOL v10 = v9 == 0;
    if (v9)
    {
      sub_1000599A8();
      unsigned __int8 v11 = (_TtC13findmydeviced19FindMyLocateWrapper *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "Error creating json data to send to searchparty %@", buf, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        id v12 = sub_1000599A8();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received Location Payload Push %@", buf, 0xCu);
        }

        unsigned __int8 v11 = objc_alloc_init(_TtC13findmydeviced19FindMyLocateWrapper);
        int v13 = _os_feature_enabled_impl();
        id v14 = sub_1000599A8();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)long long buf = 138412290;
            id v25 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending processLocationPayload payload to FML %@", buf, 0xCu);
          }

          [(FindMyLocateWrapper *)v11 processLocationPayload:v8 completion:&stru_1002DCC00];
          goto LABEL_27;
        }
        if (v15)
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending processLocationPayload payload to SearchParty %@", buf, 0xCu);
        }

        id v20 = objc_alloc_init((Class)SPSecureLocationsManager);
        [v20 receivedLocationPayload:v8 completion:&stru_1002DCC20];
      }
      else
      {
        if (!v7)
        {
LABEL_28:
          BOOL v21 = +[FMXPCTransactionManager sharedInstance];
          [v21 endTransaction:@"MDSecureLocationsHandlePushTransaction"];

          goto LABEL_29;
        }
        uint64_t v16 = sub_1000599A8();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received Location Command Push %@", buf, 0xCu);
        }

        unsigned __int8 v11 = objc_alloc_init(_TtC13findmydeviced19FindMyLocateWrapper);
        int v17 = _os_feature_enabled_impl();
        uint64_t v18 = sub_1000599A8();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            *(_DWORD *)long long buf = 138412290;
            id v25 = v8;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending processLocationCommandPayload payload to FML %@", buf, 0xCu);
          }

          [(FindMyLocateWrapper *)v11 processLocationCommandPayload:v8 completion:&stru_1002DCC40];
          goto LABEL_27;
        }
        if (v19)
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending processLocationCommandPayload payload to SearchParty %@", buf, 0xCu);
        }

        id v20 = objc_alloc_init((Class)SPSecureLocationsManager);
        [v20 receivedLocationCommand:v8 completion:&stru_1002DCC60];
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  BOOL v10 = 0;
LABEL_29:

  return v10;
}

- (void)startLocationMonitoringIfNeeded
{
  id v3 = [(FMDServiceProvider *)self locationMonitor];

  if (!v3)
  {
    id v4 = objc_alloc_init(FMDSecureLocationMonitor);
    [(FMDServiceProvider *)self setLocationMonitor:v4];
  }
  id v5 = [(FMDServiceProvider *)self locationMonitor];
  [v5 startLocationMonitorAfterRestart];
}

- (id)apsToken
{
  id v3 = [(FMDServiceProvider *)self account];

  id v4 = +[FMDDaemon sharedInstance];
  id v5 = v4;
  if (v3)
  {
    id v6 = [(FMDServiceProvider *)self account];
    id v7 = [v6 apsEnvironmentConstant];
    uint64_t v8 = [v5 apsHandlerForEnvironment:v7];

    id v9 = [v8 apsToken];
  }
  else
  {
    BOOL v10 = [v4 apsHandlerForEnvironment:@"production"];

    id v9 = [v10 apsToken];
    unsigned __int8 v11 = sub_1000599A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No FMIP account. Defaulting to aps token for PROD env", v13, 2u);
    }
  }

  return v9;
}

- (FMDAccountStore)accountStore
{
  return self->_accountStore;
}

- (FMDLocator)standardLocator
{
  return self->_standardLocator;
}

- (void)setStandardLocator:(id)a3
{
}

- (BOOL)waitingToMakeProviderActive
{
  return self->_waitingToMakeProviderActive;
}

- (void)setWaitingToMakeProviderActive:(BOOL)a3
{
  self->_waitingToMakeProviderActive = a3;
}

- (NSString)serviceIdentifierInURL
{
  return self->_serviceIdentifierInURL;
}

- (void)setAccessoryRegistry:(id)a3
{
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return self->_supportedAccessoryRegistry;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
}

- (FMDAccessoryLocationStore)accessoryLocationStore
{
  return self->_accessoryLocationStore;
}

- (void)setAccessoryLocationStore:(id)a3
{
}

- (FMDAccessoryRegistryDataSource)extAccessoryManager
{
  return self->_extAccessoryManager;
}

- (void)setExtAccessoryManager:(id)a3
{
}

- (FMDExtConfigurationRegistry)extConfigRegistry
{
  return self->_extConfigRegistry;
}

- (FMDBluetoothManaging)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDSecureLocationMonitor)locationMonitor
{
  return self->_locationMonitor;
}

- (void)setLocationMonitor:(id)a3
{
}

- (NSData)locationPayloadReceived
{
  return self->_locationPayloadReceived;
}

- (void)setLocationPayloadReceived:(id)a3
{
}

- (NSData)locationCommandReceived
{
  return self->_locationCommandReceived;
}

- (void)setLocationCommandReceived:(id)a3
{
}

- (BOOL)completedStartupRegister
{
  return self->_completedStartupRegister;
}

- (void)setCompletedStartupRegister:(BOOL)a3
{
  self->_completedStartupRegister = a3;
}

- (void)setAccountReadWriteLock:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)serverInteractionControllerByAccessory
{
  return self->_serverInteractionControllerByAccessory;
}

- (void)setServerInteractionControllerByAccessory:(id)a3
{
}

- (NSMutableDictionary)serverInteractionControllerByAccount
{
  return self->_serverInteractionControllerByAccount;
}

- (void)setServerInteractionControllerByAccount:(id)a3
{
}

- (NSMutableDictionary)futuresByCommandId
{
  return self->_futuresByCommandId;
}

- (void)setFuturesByCommandId:(id)a3
{
}

- (FMDAccessoryRegistryDelegateAdaptor)accessoryRegistryDelegateAdaptor
{
  return self->_accessoryRegistryDelegateAdaptor;
}

- (void)setAccessoryRegistryDelegateAdaptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRegistryDelegateAdaptor, 0);
  objc_storeStrong((id *)&self->_futuresByCommandId, 0);
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccount, 0);
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccessory, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accountReadWriteLock, 0);
  objc_storeStrong((id *)&self->_locationCommandReceived, 0);
  objc_storeStrong((id *)&self->_locationPayloadReceived, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_extConfigRegistry, 0);
  objc_storeStrong((id *)&self->_extAccessoryManager, 0);
  objc_storeStrong((id *)&self->_accessoryLocationStore, 0);
  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, 0);
  objc_storeStrong((id *)&self->_accessoryRegistry, 0);
  objc_storeStrong((id *)&self->_serviceIdentifierInURL, 0);
  objc_storeStrong((id *)&self->_standardLocator, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end