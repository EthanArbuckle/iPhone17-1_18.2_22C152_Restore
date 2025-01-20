@interface ICDServer
+ (ICDServer)server;
- (BOOL)_canCompleteStartupSequence;
- (BOOL)cancelOperationsByClass:(Class)a3;
- (BOOL)hasOperationsOfClass:(Class)a3;
- (BOOL)ignoreAccountChanges;
- (BOOL)isStartupSequenceCompleted;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)switchLibraryManagementPolicy;
- (CloudPushNotificationController)pushNotificationController;
- (CloudUserNotificationController)userNotificationController;
- (ICDAccountManaging)accountManager;
- (ICDBackgroundTaskManaging)backgroundTaskManager;
- (ICDCloudBadgeService)cloudBadgingService;
- (ICDCloudServiceStatusMonitor)cloudServiceStatusMonitor;
- (ICDEnhancedAudioKeyManager)enhancedAudioKeyManager;
- (ICDHandlerCoordinating)handlerCoordinator;
- (ICDNetworkAvailabilityService)networkAvailabilityService;
- (ICDPlaybackPositionService)playbackPositionService;
- (ICDServerNotificationsManager)serverNotificationsManager;
- (ICDServerOperationsManager)serverOperationsManager;
- (ICDelegateAccountStoreServiceListener)delegateAccountStoreListener;
- (ICDelegationProviderService)delegationProviderService;
- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer;
- (NSMutableDictionary)xpcListeners;
- (NSOperationQueue)internalOperationQueue;
- (NSUserDefaults)mediaPlaybackDefaults;
- (OS_dispatch_group)serverStartupGroup;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_queue)startupQueue;
- (OS_dispatch_source)sigtermSource;
- (id)_init;
- (id)_setupXPCListenerForService:(int64_t)a3;
- (id)_stateDump;
- (id)_urlResolutionCacheFilePath;
- (id)daemonOptionsForConfiguration:(id)a3;
- (id)handlerWithType:(int64_t)a3 configuration:(id)a4 error:(id *)a5;
- (int64_t)_ICCloudServerSupportedServiceForXPCListener:(id)a3;
- (int64_t)preferredVideoQuality;
- (unint64_t)stateHandle;
- (unsigned)outputClusterType;
- (void)_completeStartupSequenceIfNeeded;
- (void)_ensureMusicSubscriptionKeysAreAvailableForConfiguration:(id)a3;
- (void)_ensureSubscriptionInformationIsUpToDateForConfiguration:(id)a3;
- (void)_ensureURLResolutionCacheFileExists;
- (void)_handleApplicationRegistrationNotification:(id)a3;
- (void)_handleFamilyContentDeletionEvent:(id)a3;
- (void)_handleFlushPlayActivityEvents;
- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_initializeAncillaryServices;
- (void)_initializeSocialFeaturesAvailabilityIfNeeded;
- (void)_migrateToLatestUserVersionForConfigurations:(id)a3;
- (void)_performPeriodicSubscriptionTasks;
- (void)_precacheHomeProperties;
- (void)_preprocessURLResolutionCacheDictionary:(id)a3;
- (void)_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV;
- (void)_setupInternalQueues;
- (void)_setupKVO;
- (void)_setupMPMediaLibraryFilteringForConfigurations:(id)a3;
- (void)_setupSigtermHandler;
- (void)_startAncillaryServices;
- (void)_stopAncillaryServices;
- (void)_tearDownKVO;
- (void)_transitionAppleTVToParallelMultiUserLibraryManagementPolicy;
- (void)_updateAccountServerCachedData;
- (void)_updateAirPlaySettingsForConfiguration:(id)a3;
- (void)_updateAllowsExplicitContentSettingForConfiguration:(id)a3 automatically:(BOOL)a4;
- (void)_updateEnhancedAudioAvailabilityIfNeeded;
- (void)_updateHTTPCookieStoreForContentRestrictions;
- (void)_updateMediaRemoteCommands:(BOOL)a3;
- (void)_updateSocialFeaturesAvailabilityIfNeededUsingBag:(id)a3;
- (void)_writeURLResolutionCacheFileUsingBag:(id)a3;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)dealloc;
- (void)enumerateBackgroundOperationsUsingBlock:(id)a3;
- (void)enumerateOperationsUsingBlock:(id)a3;
- (void)fetchEnhancedAudioOfflineKeys;
- (void)getListenerEndpointForService:(int64_t)a3 completion:(id)a4;
- (void)listCloudServerOperations;
- (void)notificationsManager:(id)a3 didReceiveActiveUserIdentityDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAllowsExplicitContentDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAllowsMusicVideosDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveApplicationInstallationNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAuthServiceTokenDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveFamilyDeletionEventNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveHandlerCoordinatorFinishedInitializationNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveSubscriptionStatusDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveUserIdentityStoreDidChangeNotification:(id)a4;
- (void)notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveFamilyCircleChangedNotification:(id)a3;
- (void)notificationsManagerDidReceiveFirstUnlockNotification:(id)a3;
- (void)notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveMusicSettingsChangedNotification:(id)a3;
- (void)notificationsManagerDidReceivePhoneNumberChangedNotification:(id)a3;
- (void)notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:(id)a3;
- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processPendingKeyInvalidations;
- (void)refreshEnhancedAudioSharedKeys;
- (void)scheduleBackgroundUpdateType:(int64_t)a3 forConfiguration:(id)a4;
- (void)setIgnoreAccountChanges:(BOOL)a3;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setStartupSequenceCompleted:(BOOL)a3;
- (void)setSwitchLibraryManagementPolicy:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDServer

- (void)addOperation:(id)a3 priority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ICDServer *)self serverOperationsManager];
  [v7 addOperation:v6 priority:v4];
}

- (BOOL)isStartupSequenceCompleted
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICDServer *)self serialQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010DB0;
  v5[3] = &unk_1001BE648;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)_setupXPCListenerForService:(int64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100065380;
  v14 = sub_100065390;
  id v15 = 0;
  uint64_t v6 = [(ICDServer *)self serialQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DAD4;
  v9[3] = &unk_1001BB220;
  v9[6] = a3;
  v9[7] = a2;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)getListenerEndpointForService:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = [(ICDServer *)self _setupXPCListenerForService:a3];
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    char v9 = ICCloudServerSupportedServiceGetName();
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v9;
      __int16 v20 = 2048;
      int64_t v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "ICDServer %p - Unable to get an anonymous listener for %{public}@[%ld] - This usually indicates an attempt to access itunescloudd without the proper entitlements.", buf, 0x20u);
    }

    v11 = +[NSString stringWithFormat:@"Unable to get an anonymous listener for %@[%ld] - This usually indicates an attempt to access itunescloudd without the proper entitlements.", v9, a3, @"description"];
    id v15 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"ICCloudServiceErrorDomain" code:2000 userInfo:v12];
  }
  v13 = [v7 endpoint];
  v6[2](v6, v13, v8);
}

- (id)daemonOptionsForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CloudServerOptions);
  v5 = +[ICDeviceInfo currentDeviceInfo];
  if ([v5 isAppleTV])
  {
    os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      [(CloudServerOptions *)v4 setProhibitLibraryUpload:1];
LABEL_10:
      [(CloudServerOptions *)v4 setSupportsAutomaticEnablingiCloudMusicLibrary:1];
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v7 = "Setting options for apple tv.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    goto LABEL_5;
  }
  if ([v5 isAudioAccessory])
  {
    uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting options for audio accessory.", buf, 2u);
    }

    [(CloudServerOptions *)v4 setProhibitLibraryUpload:1];
    [(CloudServerOptions *)v4 setProhibitArtworkPrefetch:1];
    goto LABEL_10;
  }
  if ([v5 isWatch])
  {
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting options for watch.", buf, 2u);
    }

    id v11 = sub_100010724();
    [(CloudServerOptions *)v4 setProhibitLibraryUpload:1];
    [(CloudServerOptions *)v4 setProhibitArtworkPrefetch:v11];
    [(CloudServerOptions *)v4 setSupportsAutomaticEnablingiCloudMusicLibrary:v11 ^ 1];
    uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(CloudServerOptions *)v4 prohibitLibraryUpload];
      unsigned int v14 = [(CloudServerOptions *)v4 prohibitArtworkPrefetch];
      unsigned int v15 = [(CloudServerOptions *)v4 supportsAutomaticEnablingiCloudMusicLibrary];
      *(_DWORD *)buf = 67109888;
      int v24 = (int)v11;
      __int16 v25 = 1024;
      unsigned int v26 = v13;
      __int16 v27 = 1024;
      unsigned int v28 = v14;
      __int16 v29 = 1024;
      unsigned int v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting options for watch. isMediaSyncingSupported=%{BOOL}u, prohibitLibraryUpload=%{BOOL}u, prohibitArtworkPrefetch =%{BOOL}u, supportsAutomaticEnablingiCloudMusicLibrary=%{BOOL}u", buf, 0x1Au);
    }
  }
  else
  {
    if ([v5 isROSDevice])
    {
      os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      id v7 = "Setting options for Vision.";
      goto LABEL_4;
    }
    if ([v5 supportsSideLoadedMediaContent])
    {
      v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting options for phone/ipad/ipod.", buf, 2u);
      }

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100006880;
      v19[3] = &unk_1001BB1F8;
      __int16 v20 = v4;
      id v21 = v3;
      dispatch_semaphore_t v22 = v17;
      __int16 v18 = v17;
      sub_10000A1BC(v21, v19);
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ICDServer *)self _ICCloudServerSupportedServiceForXPCListener:a3];
  if (objc_msgSend(v6, "icd_isConnectionAllowedForService:", v7))
  {
    signed int v8 = [v6 processIdentifier];
    if (v6) {
      [v6 auditToken];
    }
    char v9 = MSVBundleIDForAuditToken();
    ICCloudServerSupportedServiceGetName();
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7 > 7) {
      goto LABEL_25;
    }
    if (((1 << v7) & 0xF5) != 0)
    {
      id v11 = (CloudService *)os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        LOBYTE(self) = 0;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      *(_DWORD *)buf = 134219266;
      CFStringRef v12 = @"unknown";
      id v21 = self;
      __int16 v22 = 2114;
      if (v10) {
        CFStringRef v12 = v10;
      }
      id v23 = v6;
      __int16 v24 = 2114;
      __int16 v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      CFStringRef v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      unsigned int v13 = "ICDServer %p - Refusing XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_ERROR, v13, buf, 0x3Eu);
      goto LABEL_12;
    }
    if (v7 == 1)
    {
      unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        id v21 = self;
        __int16 v22 = 2114;
        id v23 = v6;
        __int16 v24 = 2114;
        __int16 v25 = v9;
        __int16 v26 = 2048;
        uint64_t v27 = v8;
        __int16 v28 = 2114;
        CFStringRef v29 = v10;
        __int16 v30 = 2048;
        uint64_t v31 = 1;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Setting XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].", buf, 0x3Eu);
      }

      id v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCloudServerListenerEndpointServiceProtocol];
      [v6 setExportedInterface:v11];
      [v6 setExportedObject:self];
      [v6 resume];
    }
    else
    {
      if (![(ICDServer *)self isStartupSequenceCompleted])
      {
        [(ICDServer *)self _completeStartupSequenceIfNeeded];
        if (![(ICDServer *)self isStartupSequenceCompleted])
        {
          sub_1000EFDB4();
          id v11 = (CloudService *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 134219266;
          id v21 = self;
          __int16 v22 = 2114;
          id v23 = v6;
          __int16 v24 = 2114;
          __int16 v25 = v9;
          __int16 v26 = 2048;
          uint64_t v27 = v8;
          __int16 v28 = 2114;
          CFStringRef v29 = v10;
          __int16 v30 = 2048;
          uint64_t v31 = 3;
          unsigned int v13 = "ICDServer %p - Refusing XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld]: not ready.";
          goto LABEL_11;
        }
      }
      unsigned int v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        id v21 = self;
        __int16 v22 = 2114;
        id v23 = v6;
        __int16 v24 = 2114;
        __int16 v25 = v9;
        __int16 v26 = 2048;
        uint64_t v27 = v8;
        __int16 v28 = 2114;
        CFStringRef v29 = v10;
        __int16 v30 = 2048;
        uint64_t v31 = 3;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Setting XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].", buf, 0x3Eu);
      }

      id v11 = [[CloudService alloc] initWithHandlerProvider:self];
      [(CloudService *)v11 setRequestingBundleID:v9];
      v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCloudServerProtocol];
      dispatch_semaphore_t v17 = MSVPropertyListDataClasses();
      __int16 v18 = +[NSMutableSet setWithSet:v17];

      [v18 addObject:objc_opt_class()];
      [v16 setClasses:v18 forSelector:"editCollaborationWithPersistentID:configuration:properties:trackEdits:completion:" argumentIndex:3 ofReply:0];
      [v6 setExportedInterface:v16];
      [v6 setExportedObject:v11];
      [v6 resume];
    }
    LOBYTE(self) = 1;
    goto LABEL_24;
  }
  LOBYTE(self) = 0;
LABEL_26:

  return self & 1;
}

- (int64_t)_ICCloudServerSupportedServiceForXPCListener:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100065380;
  v12[4] = sub_100065390;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EF8;
  block[3] = &unk_1001BC800;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = v12;
  dispatch_sync(serialQueue, block);
  int64_t v7 = ICCloudServerSupportedServiceForName();

  _Block_object_dispose(v12, 8);
  return v7;
}

- (id)handlerWithType:(int64_t)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  CFStringRef v29 = self;
  int64_t v7 = [(ICDServer *)self accountManager];
  signed int v8 = [v7 supportedConfigurations];

  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      unsigned int v14 = [v6 userIdentity];
      unsigned int v15 = [v14 accountDSID];
      v16 = [v13 userIdentity];
      dispatch_semaphore_t v17 = [v16 accountDSID];
      uint64_t v18 = (uint64_t)[v15 isEqualToString:v17];

      if (v18) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (a3 == 1)
    {
      __int16 v26 = ArtistImageRequestHandler;
    }
    else
    {
      if (a3) {
        goto LABEL_22;
      }
      __int16 v26 = ICDCloudMusicLibraryRequestHandler;
    }
    uint64_t v18 = [(__objc2_class *)v26 handlerForConfiguration:v6];
  }
  else
  {
LABEL_9:

    v19 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = [v6 userIdentity];
      id v21 = [v20 accountDSID];
      *(_DWORD *)buf = 134218242;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "ICDServer %p - Attempt to retrieve handler for unsupported configuration [returning nil] - Configuration dsid=%@", buf, 0x16u);
    }
    if (a5)
    {
      id v22 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
      if (MSVDeviceOSIsInternalInstall())
      {
        id v23 = [v6 userIdentity];
        __int16 v24 = [v23 accountDSID];
        __int16 v25 = +[NSString stringWithFormat:@"Attempting to retrieve handler for an unsupported configuration [dsid=%@]", v24];
        [v22 setObject:v25 forKeyedSubscript:NSLocalizedDescriptionKey];
      }
      else
      {
        [v22 setObject:@"Attempting to retrieve handler for an unsupported configuration" forKeyedSubscript:NSLocalizedDescriptionKey];
      }
      [v22 setObject:@"An ICCloudClient (or HSCloudClient) instance is using a signed-out user identity." forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
      [v22 setObject:@"Listen to ICActiveUserIdentityDidChangeNotification and either update ICCloudClient with the new active account or recreate it" forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
      id v27 = [v22 copy];
      *a5 = +[NSError ic_cloudClientErrorWithCode:2003 userInfo:v27];
    }
    uint64_t v18 = 0;
  }
LABEL_22:

  return (id)v18;
}

- (ICDAccountManaging)accountManager
{
  return self->_accountManager;
}

- (ICDServerOperationsManager)serverOperationsManager
{
  return self->_serverOperationsManager;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

+ (ICDServer)server
{
  if (qword_1001F3868 != -1) {
    dispatch_once(&qword_1001F3868, &stru_1001BB140);
  }
  v2 = (void *)qword_1001F3860;

  return (ICDServer *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_enhancedAudioKeyManager, 0);
  objc_storeStrong((id *)&self->_mediaUserStateCenterServer, 0);
  objc_storeStrong((id *)&self->_userNotificationController, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackDefaults, 0);
  objc_storeStrong((id *)&self->_pushNotificationController, 0);
  objc_storeStrong((id *)&self->_delegationProviderService, 0);
  objc_storeStrong((id *)&self->_delegateAccountStoreListener, 0);
  objc_storeStrong((id *)&self->_backgroundTaskManager, 0);
  objc_storeStrong((id *)&self->_handlerCoordinator, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_serverNotificationsManager, 0);
  objc_storeStrong((id *)&self->_serverOperationsManager, 0);
  objc_storeStrong((id *)&self->_playbackPositionService, 0);
  objc_storeStrong((id *)&self->_networkAvailabilityService, 0);
  objc_storeStrong((id *)&self->_xpcListeners, 0);
  objc_storeStrong((id *)&self->_internalOperationQueue, 0);
  objc_storeStrong((id *)&self->_serverStartupGroup, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusMonitor, 0);

  objc_storeStrong((id *)&self->_cloudBadgingService, 0);
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (ICDEnhancedAudioKeyManager)enhancedAudioKeyManager
{
  return self->_enhancedAudioKeyManager;
}

- (void)setSwitchLibraryManagementPolicy:(BOOL)a3
{
  self->_switchLibraryManagementPolicy = a3;
}

- (BOOL)switchLibraryManagementPolicy
{
  return self->_switchLibraryManagementPolicy;
}

- (unsigned)outputClusterType
{
  return self->_outputClusterType;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer
{
  return self->_mediaUserStateCenterServer;
}

- (CloudUserNotificationController)userNotificationController
{
  return self->_userNotificationController;
}

- (NSUserDefaults)mediaPlaybackDefaults
{
  return self->_mediaPlaybackDefaults;
}

- (CloudPushNotificationController)pushNotificationController
{
  return self->_pushNotificationController;
}

- (ICDelegationProviderService)delegationProviderService
{
  return self->_delegationProviderService;
}

- (ICDelegateAccountStoreServiceListener)delegateAccountStoreListener
{
  return self->_delegateAccountStoreListener;
}

- (ICDBackgroundTaskManaging)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (ICDHandlerCoordinating)handlerCoordinator
{
  return self->_handlerCoordinator;
}

- (ICDServerNotificationsManager)serverNotificationsManager
{
  return self->_serverNotificationsManager;
}

- (ICDPlaybackPositionService)playbackPositionService
{
  return self->_playbackPositionService;
}

- (ICDNetworkAvailabilityService)networkAvailabilityService
{
  return self->_networkAvailabilityService;
}

- (NSMutableDictionary)xpcListeners
{
  return self->_xpcListeners;
}

- (NSOperationQueue)internalOperationQueue
{
  return self->_internalOperationQueue;
}

- (OS_dispatch_group)serverStartupGroup
{
  return self->_serverStartupGroup;
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  self->_preferredVideoQuality = a3;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (void)setIgnoreAccountChanges:(BOOL)a3
{
  self->_ignoreAccountChanges = a3;
}

- (BOOL)ignoreAccountChanges
{
  return self->_ignoreAccountChanges;
}

- (void)_updateAirPlaySettingsForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
    unsigned __int8 v6 = [v5 BOOLForKey:@"isAppleMusicSubscriber"];
    unsigned __int8 v7 = [v5 BOOLForKey:@"cloudLibraryIsOn"];
    signed int v8 = [v4 userIdentityStore];
    id v9 = [v4 userIdentity];
    id v21 = 0;
    id v10 = [v8 getPropertiesForUserIdentity:v9 error:&v21];
    id v11 = v21;

    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "ICDServer %p - Failed to load identity properties. err=%{public}@", buf, 0x16u);
      }

      unsigned __int8 v13 = v7;
    }
    else
    {
      unsigned __int8 v13 = [v10 isActiveLocker];
    }
    unsigned int v15 = +[ICMusicSubscriptionStatusController sharedStatusController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100061ED4;
    v16[3] = &unk_1001BB6E0;
    unsigned __int8 v18 = v6;
    unsigned __int8 v19 = v13;
    unsigned __int8 v20 = v7;
    id v17 = v5;
    unsigned int v14 = v5;
    [v15 getSubscriptionStatusWithCompletionHandler:v16];
  }
  else
  {
    unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _updateAirPlaySettingsForConfiguration - No action [No active configuration]", buf, 0xCu);
    }
  }
}

- (void)_handleFamilyContentDeletionEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDServer *)self accountManager];
  unsigned __int8 v6 = [v5 activeConfiguration];

  if (v6)
  {
    id v21 = v6;
    unsigned __int8 v7 = [v6 userIdentity];
    signed int v8 = +[ML3MusicLibrary musicLibraryForUserAccount:v7];

    id v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v29 = (ICDServer *)[v4 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received %llu account pairs for family content removal.", buf, 0xCu);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v22 = v4;
    id obj = v4;
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      unsigned __int8 v13 = "com.apple.amp.itunescloudd";
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          unsigned int v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = os_log_create(v13, "Accounts");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (ICDServer *)[v15 purchaserAccountID];
            unsigned __int8 v18 = v13;
            id v19 = [v15 downloaderAccountID];
            id v20 = [v15 familyID];
            *(_DWORD *)buf = 134218496;
            CFStringRef v29 = v17;
            __int16 v30 = 2048;
            id v31 = v19;
            unsigned __int8 v13 = v18;
            __int16 v32 = 2048;
            id v33 = v20;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Family content removal (purchaser = %lld, downloader = %lld, family = %lld", buf, 0x20u);
          }

          -[NSObject removeItemsWithFamilyAccountID:purchaserAccountID:downloaderAccountID:](v8, "removeItemsWithFamilyAccountID:purchaserAccountID:downloaderAccountID:", [v15 familyID], objc_msgSend(v15, "purchaserAccountID"), objc_msgSend(v15, "downloaderAccountID"));
        }
        id v11 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v11);
    }

    unsigned __int8 v6 = v21;
    id v4 = v22;
  }
  else
  {
    signed int v8 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _handleFamilyContentDeletionEvent - No action [No active configuration]", buf, 0xCu);
    }
  }
}

- (void)_precacheHomeProperties
{
  if (MSVDeviceSupportsMultipleLibraries())
  {
    v2 = +[ICHomeManager sharedManager];
  }
}

- (void)_updateMediaRemoteCommands:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting media remote commands if needed (force = %{BOOL}u", buf, 0x12u);
  }

  if (v3) {
    goto LABEL_9;
  }
  id v6 = [(ICDAccountManaging *)self->_accountManager stateChange];
  if (([v6 supportedConfigurationsChanged] & 1) != 0
    || [v6 activeConfigurationChanged])
  {
    unsigned __int8 v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting media remote commands because the account state has changed", buf, 0xCu);
    }

LABEL_9:
    signed int v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    id v9 = dispatch_get_global_queue(21, 0);
    id v6 = v8;
    MRMediaRemoteClearDefaultSupportedCommandsForApp();
  }
}

- (void)_updateAccountServerCachedData
{
  BOOL v3 = +[ICMonitoredAccountStore sharedAccountStore];
  id v15 = 0;
  id v4 = [v3 activeStoreAccountWithError:&v15];
  id v5 = v15;

  if (v4)
  {
    id v6 = objc_alloc((Class)AMSAccountIdentity);
    unsigned __int8 v7 = objc_msgSend(v4, "ic_DSID");
    signed int v8 = objc_msgSend(v4, "ic_altDSID");
    id v9 = [v6 initWithDSID:v7 altDSID:v8];

    id v10 = +[AMSAccountCachedServerData sharedInstance];
    id v11 = [v10 BOOLForKey:14 accountID:v9 updateBlock:&stru_1001BB690];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100062860;
    v12[3] = &unk_1001BB6B8;
    id v13 = v4;
    unsigned int v14 = self;
    [v11 resultWithTimeout:v12 completion:5.0];
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - _updateAccountServerCachedData failed to load active account. err=%{public}@", buf, 0x16u);
    }
  }
}

- (void)_handleFlushPlayActivityEvents
{
  id v2 = +[ICPlayActivityServer sharedInstance];
  [v2 flushPendingPlayActivityEventsWithCompletionHandler:0];
}

- (void)_updateHTTPCookieStoreForContentRestrictions
{
  id v2 = +[ICMusicSubscriptionStatusController sharedStatusController];
  [v2 getSubscriptionStatusWithCompletionHandler:&stru_1001BB650];
}

- (void)_updateEnhancedAudioAvailabilityIfNeeded
{
  id v2 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating enhanced audio availability flag", buf, 2u);
  }

  id v3 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_1001BB5F0];
  id v4 = +[ICURLBagProvider sharedBagProvider];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000636B8;
  v6[3] = &unk_1001BC8C0;
  id v7 = v3;
  id v5 = v3;
  [v4 getBagForRequestContext:v5 forceRefetch:0 withCompletionHandler:v6];
}

- (void)_performPeriodicSubscriptionTasks
{
  id v3 = +[ICMusicSubscriptionStatusController sharedStatusController];
  id v4 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_1001BB548];
  id v5 = +[ICURLBagProvider sharedBagProvider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063BD0;
  v7[3] = &unk_1001BF210;
  id v8 = v3;
  id v9 = self;
  id v6 = v3;
  [v5 getBagForRequestContext:v4 forceRefetch:0 withCompletionHandler:v7];
}

- (void)_transitionAppleTVToParallelMultiUserLibraryManagementPolicy
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[ICDeviceInfo currentDeviceInfo];
    int v10 = 134218242;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Transitioning device=%{public}@ to Parallel Multi User", (uint8_t *)&v10, 0x16u);
  }
  id v5 = [(ICDServer *)self accountManager];
  [v5 changeLibraryManagementPolicy:2];

  id v6 = [(ICDServer *)self accountManager];
  [v6 updateState];

  id v7 = [(ICDServer *)self handlerCoordinator];
  id v8 = [(ICDServer *)self accountManager];
  id v9 = [v8 stateChange];
  [v7 changeLibraryManagementPolicy:2 withAccountsStateChange:v9];
}

- (void)_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV
{
  id v4 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v5 = [v4 isAppleTV];

  if ((v5 & 1) == 0)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICDServer.m" lineNumber:1687 description:@"_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV: is only valid for AppleTV."];
  }
  dispatch_time_t v6 = dispatch_time(0x8000000000000000, 300000000000);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064B4C;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_after(v6, serialQueue, block);
}

- (void)_preprocessURLResolutionCacheDictionary:(id)a3
{
  id v25 = a3;
  [v25 objectForKey:@"p2-url-resolution"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v44;
    CFStringRef v26 = @"Music";
    CFStringRef v27 = @"MusicNS";
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v44 != v4) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = [v6 objectForKey:@"p2-url-section-name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (([v7 isEqualToString:@"AppleMusicSubscriber"] & 1) != 0
             || ([v7 isEqualToString:@"AppleMusicUndecided"] & 1) != 0
             || ([v7 isEqualToString:@"AppleMusicDisabled"] & 1) != 0))
          {

            CFStringRef v8 = @"AppleMusicSubscriber";
            CFStringRef v26 = @"AppleMusicUndecided";
            CFStringRef v27 = @"AppleMusicDisabled";
            goto LABEL_17;
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v3) {
        continue;
      }
      break;
    }
    CFStringRef v8 = @"Music";
  }
  else
  {
    CFStringRef v8 = @"Music";
    CFStringRef v26 = @"Music";
    CFStringRef v27 = @"MusicNS";
  }
LABEL_17:

  CFStringRef v29 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v8, v26, v27, 0);
  if (CFPreferencesGetAppBooleanValue(@"UserRequestedSubscriptionHidden", @"com.apple.mobileipod", 0))
  {
    [v29 removeObject:v27];
  }
  else
  {
    id v9 = objc_alloc((Class)ICStoreRequestContext);
    int v10 = +[ICUserIdentity activeAccount];
    id v11 = [v9 initWithIdentity:v10];

    id v12 = [objc_alloc((Class)ICMusicSubscriptionStatusRequest) initWithStoreRequestContext:v11];
    [v12 setShouldReturnLastKnownStatusOnly:1];
    uint64_t v37 = 0;
    __int16 v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = sub_100065380;
    v41 = sub_100065390;
    id v42 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    unsigned int v14 = +[ICMusicSubscriptionStatusController sharedStatusController];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100065398;
    v34[3] = &unk_1001BB528;
    v36 = &v37;
    id v15 = v13;
    long long v35 = v15;
    [v14 performSubscriptionStatusRequest:v12 withCompletionHandler:v34];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if ([(id)v38[5] statusType] == (id)1) {
      CFStringRef v16 = v8;
    }
    else {
      CFStringRef v16 = v26;
    }
    [v29 removeObject:v16];

    _Block_object_dispose(&v37, 8);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [obj mutableCopy];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = obj;
    id v19 = [v18 countByEnumeratingWithState:&v30 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v31;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = [v22 objectForKey:@"p2-url-section-name"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v29 containsObject:v23]) {
              [v17 removeObject:v22];
            }
          }
        }
        id v19 = [v18 countByEnumeratingWithState:&v30 objects:v47 count:16];
      }
      while (v19);
    }

    id v24 = [v17 count];
    if (v24 != [v18 count]) {
      [v25 setObject:v17 forKey:@"p2-url-resolution"];
    }
  }
}

- (void)_writeURLResolutionCacheFileUsingBag:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Updating resolution cache file", buf, 2u);
  }

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v4 arrayForBagKey:@"p2-url-resolution"];
  [v6 setObject:v7 forKeyedSubscript:@"p2-url-resolution"];

  CFStringRef v8 = [v4 arrayForBagKey:@"p2-launch-host-suffix-whitelist"];
  [v6 setObject:v8 forKeyedSubscript:@"p2-launch-host-suffix-whitelist"];

  id v9 = [v4 arrayForBagKey:@"p2-launch-apple-store-host-patterns"];
  [v6 setObject:v9 forKeyedSubscript:@"p2-launch-apple-store-host-patterns"];

  int v10 = [v4 arrayForBagKey:@"p2-launch-apple-store-path-patterns"];
  [v6 setObject:v10 forKeyedSubscript:@"p2-launch-apple-store-path-patterns"];

  id v11 = [v4 arrayForBagKey:@"p2-launch-appstore-host-patterns"];
  [v6 setObject:v11 forKeyedSubscript:@"p2-launch-appstore-host-patterns"];

  id v12 = [v4 arrayForBagKey:@"p2-launch-appstore-path-patterns"];
  [v6 setObject:v12 forKeyedSubscript:@"p2-launch-appstore-path-patterns"];

  dispatch_semaphore_t v13 = [v4 arrayForBagKey:@"p2-launch-ebookstore-host-patterns"];
  [v6 setObject:v13 forKeyedSubscript:@"p2-launch-ebookstore-host-patterns"];

  unsigned int v14 = [v4 arrayForBagKey:@"p2-launch-ebookstore-path-patterns"];
  [v6 setObject:v14 forKeyedSubscript:@"p2-launch-ebookstore-path-patterns"];

  id v15 = [v4 arrayForBagKey:@"p2-launch-mobilestore-host-patterns"];
  [v6 setObject:v15 forKeyedSubscript:@"p2-launch-mobilestore-host-patterns"];

  CFStringRef v16 = [v4 arrayForBagKey:@"p2-launch-mobilestore-path-patterns"];
  [v6 setObject:v16 forKeyedSubscript:@"p2-launch-mobilestore-path-patterns"];

  id v17 = [v4 stringForBagKey:@"vpp-licensing-invitation-url-pattern"];

  [v6 setObject:v17 forKeyedSubscript:@"vpp-licensing-invitation-url-pattern"];
  [(ICDServer *)self _preprocessURLResolutionCacheDictionary:v6];
  id v18 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Caches/com.apple.itunesstored/url-resolution.plist"];
  id v19 = +[NSFileManager defaultManager];
  if (![v6 count])
  {
    if (([v19 removeItemAtPath:v18 error:0] & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v20 = [v19 attributesOfItemAtPath:v18 error:0];
  id v21 = [v20 objectForKey:NSFileModificationDate];

  if (v21)
  {
    [v21 timeIntervalSinceNow];
    if (v22 >= -60.0)
    {

      goto LABEL_20;
    }
  }
  id v23 = [v18 stringByDeletingLastPathComponent];
  id v37 = 0;
  unsigned int v24 = [v19 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v37];
  id v25 = v37;

  if (v24)
  {
    CFStringRef v26 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];
    id v36 = v25;
    unsigned int v27 = [v26 writeToFile:v18 options:0 error:&v36];
    id v28 = v36;

    id v25 = v28;
  }
  else
  {
    unsigned int v27 = 0;
  }
  CFStringRef v29 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  long long v30 = v29;
  if (v25)
  {
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543362;
    id v39 = v25;
    long long v31 = "Failed to update URL resolution cache file. err=%{public}@";
    long long v32 = v30;
    os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    uint32_t v34 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    long long v31 = "Successfully updated URL resolution cache file";
    long long v32 = v30;
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    uint32_t v34 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v32, v33, v31, buf, v34);
LABEL_18:

  if (v27)
  {
LABEL_19:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.changed-url-resolution", 0, 0, 1u);
  }
LABEL_20:
}

- (void)_ensureURLResolutionCacheFileExists
{
  id v3 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v4 = [v3 isWatch];

  if (v4)
  {
    unsigned __int8 v5 = [(ICDServer *)self _urlResolutionCacheFilePath];
    id v6 = +[NSFileManager defaultManager];
    id v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      dispatch_semaphore_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking if url resolution file exists at path '%{public}@'", buf, 0xCu);
    }

    if (([v6 fileExistsAtPath:v5] & 1) == 0)
    {
      CFStringRef v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "url resolution file is missing - creating now", buf, 2u);
      }

      id v9 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_1001BB500];
      int v10 = +[ICURLBagProvider sharedBagProvider];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100065AEC;
      v11[3] = &unk_1001BC8C0;
      v11[4] = self;
      [v10 getBagForRequestContext:v9 withCompletionHandler:v11];
    }
  }
}

- (id)_urlResolutionCacheFilePath
{
  id v2 = (void *)CPSharedResourcesDirectory();

  return [v2 stringByAppendingPathComponent:@"Library/Caches/com.apple.itunesstored/url-resolution.plist"];
}

- (void)_updateSocialFeaturesAvailabilityIfNeededUsingBag:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = +[ICClientInfo defaultInfo];
    id v6 = [v5 bagProfile];
    id v7 = [v4 profileName];
    unsigned __int8 v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      serialQueue = self->_serialQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100065ED4;
      v12[3] = &unk_1001BECC0;
      dispatch_semaphore_t v13 = v4;
      unsigned int v14 = self;
      dispatch_async(serialQueue, v12);
      int v10 = v13;
    }
    else
    {
      int v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v4 profileName];
        *(_DWORD *)buf = 134218242;
        CFStringRef v16 = self;
        __int16 v17 = 2114;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ICDServer %p _updateSocialFeaturesAvailabilityIfNeededUsingBag: ignoring bag change for profile %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "ICDServer %p _updateSocialFeaturesAvailabilityIfNeededUsingBag: called with nil bag", buf, 0xCu);
    }
  }
}

- (void)_initializeSocialFeaturesAvailabilityIfNeeded
{
  id v3 = +[ICDefaults standardDefaults];
  id v4 = [v3 cachedSharedControlsCapability];

  if (!v4)
  {
    unsigned __int8 v5 = [(ICDServer *)self accountManager];
    id v6 = [v5 activeConfiguration];

    id v7 = [v6 userIdentity];
    if (v7)
    {
      id v8 = [objc_alloc((Class)ICStoreRequestContext) initWithIdentity:v7];
      id v9 = +[ICURLBagProvider sharedBagProvider];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100066208;
      v10[3] = &unk_1001BC8C0;
      v10[4] = self;
      [v9 getBagForRequestContext:v8 withCompletionHandler:v10];
    }
  }
}

- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling updated bag notification", v10, 2u);
  }

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:ICURLBagProviderDidUpdateBagNotificationURLBagUserInfoKey];

  id v8 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v9 = [v8 isWatch];

  if (v9 && v7) {
    [(ICDServer *)self _writeURLResolutionCacheFileUsingBag:v7];
  }
  [(ICDServer *)self _updateSocialFeaturesAvailabilityIfNeededUsingBag:v7];
  [(ICDServer *)self _updateEnhancedAudioAvailabilityIfNeeded];
}

- (void)_handleApplicationRegistrationNotification:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"ICDServerNotificationsManagerApplicationRegistrationBundleIDsKey"];
    id v7 = [v5 objectForKeyedSubscript:@"ICDServerNotificationsManagerIsApplicationRegistrationKey"];
    id v8 = [v7 integerValue];

    unsigned int v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"uninstalled";
      if (v8 == (id)1) {
        CFStringRef v10 = @"installed";
      }
      *(_DWORD *)buf = 138543618;
      CFStringRef v26 = v6;
      __int16 v27 = 2114;
      CFStringRef v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handling app install changed notification - apps=%{public}@, registration=%{public}@", buf, 0x16u);
    }

    id v11 = ICBundleIdentifierForSystemApplicationType();
    unsigned int v12 = [(ICDServer *)v6 containsObject:v11];

    if (v12)
    {
      if (v8 == (id)1)
      {
        dispatch_semaphore_t v13 = [(ICDServer *)self accountManager];
        unsigned int v14 = [v13 supportedConfigurations];
        [v14 enumerateObjectsUsingBlock:&stru_1001BB480];

        id v15 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
        [v15 handleMusicAppInstalled];
      }
      else
      {
        CFStringRef v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v26 = self;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ [Music App Removal] Clearing music preferences", buf, 0xCu);
        }

        id v15 = CFPreferencesCopyKeyList(@"com.apple.Music", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
        if ([v15 count]) {
          CFPreferencesSetMultiple(0, (CFArrayRef)v15, @"com.apple.Music", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
        }
        __int16 v17 = [(ICDServer *)self accountManager];
        id v18 = [v17 supportedConfigurations];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100066750;
        v24[3] = &unk_1001BB2B0;
        v24[4] = self;
        [v18 enumerateObjectsUsingBlock:v24];

        id v19 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
        [v19 handleMusicAppRemoved];
      }
    }
    uint64_t v20 = ICBundleIdentifierForSystemApplicationType();
    unsigned int v21 = [(ICDServer *)v6 containsObject:v20];

    if (v21)
    {
      double v22 = [(ICDServer *)self accountManager];
      id v23 = [v22 supportedConfigurations];
      [v23 enumerateObjectsUsingBlock:&stru_1001BB4C0];
    }
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self _canCompleteStartupSequence];
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      unsigned int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Account change - Not ready]", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_DWORD *)buf = 134217984;
    unsigned int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Account change]", buf, 0xCu);
  }

  if ([(ICDServer *)self isStartupSequenceCompleted])
  {
    unsigned __int8 v5 = [(ICDServer *)self internalOperationQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006722C;
    v7[3] = &unk_1001BEC20;
    void v7[4] = self;
    [v5 addOperationWithBlock:v7];
LABEL_8:

    return;
  }
  [(ICDServer *)self _completeStartupSequenceIfNeeded];
}

- (void)_ensureMusicSubscriptionKeysAreAvailableForConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _ensureMusicSubscriptionKeysAreAvailableForConfiguration - No action [No active configuration]", buf, 0xCu);
    }
    goto LABEL_9;
  }
  unsigned __int8 v5 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v6 = [v5 isMac];

  if ((v6 & 1) == 0)
  {
    id v7 = +[ICDeviceInfo currentDeviceInfo];
    if (([v7 isAppleTV] & 1) == 0
      && ([v7 isAudioAccessory] & 1) == 0
      && (byte_1001F3870 & 1) == 0)
    {
      byte_1001F3870 = 1;
      id v8 = objc_alloc((Class)ICAsyncBlockOperation);
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      dispatch_semaphore_t v13 = sub_100067680;
      unsigned int v14 = &unk_1001BB440;
      id v15 = v4;
      CFStringRef v16 = self;
      id v9 = [v8 initWithStartHandler:&v11];
      objc_msgSend(v9, "setName:", @"com.apple.itunescloudd.CloudServer.keyRefreshOperation", v11, v12, v13, v14);
      CFStringRef v10 = [(ICDServer *)self serverOperationsManager];
      [v10 addOperation:v9 priority:1];
    }
LABEL_9:
  }
}

- (void)_ensureSubscriptionInformationIsUpToDateForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = +[ICMusicSubscriptionStatusController sharedStatusController];
    unsigned __int8 v6 = [v4 userIdentity];
    [v5 getSubscriptionStatusForUserIdentity:v6 bypassingCache:0 withCompletionHandler:&stru_1001BB3A0];

    [(ICDServer *)self _ensureMusicSubscriptionKeysAreAvailableForConfiguration:v4];
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _ensureSubscriptionInformationIsUpToDateForConfiguration - No action [No active configuration]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_updateAllowsExplicitContentSettingForConfiguration:(id)a3 automatically:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [sub_100062E30() sharedRestrictionsMonitor];
    id v8 = [v7 allowsExplicitContent];

    uint64_t v42 = 0;
    long long v43 = &v42;
    uint64_t v44 = 0x2050000000;
    id v9 = (void *)qword_1001F3898;
    uint64_t v45 = qword_1001F3898;
    if (!qword_1001F3898)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_100068720;
      v47 = &unk_1001BE9E8;
      v48 = &v42;
      sub_100068720((uint64_t)buf);
      id v9 = (void *)v43[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v42, 8);
    if ([v10 isCurrentDeviceValidHomeAccessory])
    {
      uint64_t v42 = 0;
      long long v43 = &v42;
      uint64_t v44 = 0x2050000000;
      id v11 = (void *)qword_1001F38A0;
      uint64_t v45 = qword_1001F38A0;
      if (!qword_1001F38A0)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000687E8;
        v47 = &unk_1001BE9E8;
        v48 = &v42;
        sub_1000687E8((uint64_t)buf);
        id v11 = (void *)v43[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v42, 8);
      dispatch_semaphore_t v13 = [v6 userIdentity];
      unsigned int v14 = [v6 userIdentityStore];
      id v15 = [v12 userMonitorWithUserIdentity:v13 fromUserIdentityStore:v14];

      CFStringRef v16 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      __int16 v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v6 userIdentity];
          id v19 = [v18 accountDSID];
          *(_DWORD *)buf = 134218755;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2113;
          v47 = v19;
          LOWORD(v48) = 1024;
          *(_DWORD *)((char *)&v48 + 2) = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "ICDServer %p - _updateAllowsExplicitContentSettingAutomatically: userMonitor=%p for dsid=%{private}@ allowExplicit=%{BOOL}u", buf, 0x26u);
        }
        id v8 = [v15 isExplicitSettingEnabled];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "ICDServer %p - _updateAllowsExplicitContentSettingAutomatically - userMonitor=nil", buf, 0xCu);
        }
      }
    }
    id v21 = objc_alloc((Class)ICStoreRequestContext);
    double v22 = [v6 userIdentity];
    id v23 = [v21 initWithIdentity:v22];

    unsigned int v24 = [v6 userIdentity];
    id v25 = +[ML3MusicLibrary musicLibraryForUserAccount:v24];

    CFStringRef v26 = [v25 valueForDatabaseProperty:@"MPExplicitContentAllowedBoolean"];
    os_log_t v20 = v26;
    if (!v26 || v8 != [v26 BOOLValue])
    {
      __int16 v27 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v28 = [v25 accountDSID];
        unsigned int v29 = [v20 BOOLValue];
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v29;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "updating explicit content. dsid=%{private}@, lastWrittenValue=%{BOOL}u, setting allowsExplicitContent=%{BOOL}u", buf, 0x18u);
      }
      long long v30 = +[NSNumber numberWithBool:v8];
      [v25 setValue:v30 forDatabaseProperty:@"MPExplicitContentAllowedBoolean"];
    }
    long long v31 = +[ICMusicSubscriptionStatusController sharedStatusController];
    long long v32 = [v6 userIdentity];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000688B0;
    v35[3] = &unk_1001BB380;
    char v40 = (char)v8;
    id v36 = v25;
    id v37 = v23;
    BOOL v41 = a4;
    __int16 v38 = self;
    id v39 = v6;
    id v33 = v23;
    id v34 = v25;
    [v31 getSubscriptionStatusForUserIdentity:v32 withCompletionHandler:v35];
  }
  else
  {
    os_log_t v20 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _updateServerAllowsExplicitContentSettingAutomatically - No action [No active configuration]", buf, 0xCu);
    }
  }
}

- (void)_setupMPMediaLibraryFilteringForConfigurations:(id)a3
{
  id v3 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v4 = (void *)qword_1001F3888;
  uint64_t v25 = qword_1001F3888;
  if (!qword_1001F3888)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100068FF4;
    CFStringRef v28 = &unk_1001BE9E8;
    unsigned int v29 = &v22;
    sub_100068FF4((uint64_t)buf);
    id v4 = (void *)v23[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v22, 8);
  [v5 setFilteringDisabled:1];
  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _setupMPMediaLibraryFilteringForConfigurations - setting filtering type for default media library]", buf, 0xCu);
    }

    id v7 = [sub_1000690BC() defaultMediaLibrary];
    [v7 setCloudFilteringType:1];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        dispatch_semaphore_t v13 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _setupMPMediaLibraryFilteringForConfigurations - setting filtering type for configuration=%{public}@]", buf, 0x16u);
        }

        id v14 = sub_1000690BC();
        id v15 = [v12 userIdentity];
        CFStringRef v16 = [v14 deviceMediaLibraryWithUserIdentity:v15];
        [v16 setCloudFilteringType:1];
      }
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)_migrateToLatestUserVersionForConfigurations:(id)a3
{
  id v3 = a3;
  id v4 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v5 = [v4 isMac];

  if ((v5 & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v15 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_semaphore_t v13 = [v11 userIdentity];
            id v14 = [v13 accountDSID];
            *(_DWORD *)buf = 134218242;
            uint64_t v22 = self;
            __int16 v23 = 2112;
            uint64_t v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICDServer %p - _migrateToLatestUserVersion - Migrating library [dsid=%@]", buf, 0x16u);
          }
          sub_100035570(v11);
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }

    id v3 = v15;
  }
}

- (void)_completeStartupSequenceIfNeeded
{
  if ([(ICDServer *)self _canCompleteStartupSequence])
  {
    id v3 = [(ICDServer *)self startupQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006955C;
    block[3] = &unk_1001BEC20;
    block[4] = self;
    dispatch_sync(v3, block);
  }
  else
  {
    id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ICDServer %p - _completeStartupSequenceIfNeeded - Nothing to do [blocked]", buf, 0xCu);
    }
  }
}

- (BOOL)_canCompleteStartupSequence
{
  id v3 = +[ICDeviceSetupStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 isDeviceSetupComplete];

  unsigned __int8 v5 = +[ICSecurityInfo sharedSecurityInfo];
  unsigned int v6 = [v5 isDeviceClassCUnlocked];

  id v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218752;
    uint64_t v10 = self;
    __int16 v11 = 1024;
    int v12 = v6 & v4;
    __int16 v13 = 1026;
    unsigned int v14 = v6;
    __int16 v15 = 1026;
    unsigned int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ICDServer %p - Can complete startup sequence [%{BOOL}u] - deviceUnlocked=%{public}u - deviceSetupComplete=%{public}u", (uint8_t *)&v9, 0x1Eu);
  }

  return v6 & v4;
}

- (void)setStartupSequenceCompleted:(BOOL)a3
{
  unsigned __int8 v5 = [(ICDServer *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100069EB0;
  v6[3] = &unk_1001BDD48;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (ICDCloudServiceStatusMonitor)cloudServiceStatusMonitor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (!cloudServiceStatusMonitor)
  {
    unsigned int v4 = objc_alloc_init(ICDCloudServiceStatusMonitor);
    unsigned __int8 v5 = self->_cloudServiceStatusMonitor;
    self->_cloudServiceStatusMonitor = v4;

    cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  }

  return cloudServiceStatusMonitor;
}

- (ICDCloudBadgeService)cloudBadgingService
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  cloudBadgingService = self->_cloudBadgingService;
  if (!cloudBadgingService)
  {
    unsigned int v4 = objc_alloc_init(ICDCloudBadgeService);
    unsigned __int8 v5 = self->_cloudBadgingService;
    self->_cloudBadgingService = v4;

    cloudBadgingService = self->_cloudBadgingService;
  }

  return cloudBadgingService;
}

- (void)_tearDownKVO
{
}

- (void)_setupKVO
{
}

- (void)_stopAncillaryServices
{
  id v3 = +[MediaLibraryAccessRevocationController sharedController];
  [v3 stopObservingRevocations];

  unsigned int v4 = +[AppleMusicAPITokenIDSService sharedService];
  [v4 stop];

  unsigned __int8 v5 = +[CloudRemoteRequestOperationExecutionServiceListener sharedRemoteRequestOperationExecutionServiceListener];
  [v5 stop];

  unsigned int v6 = +[ICLibraryAuthServiceClientTokenProvider sharedProvider];
  [v6 stopService];

  BOOL v7 = +[ICPlayActivityServer sharedInstance];
  [v7 stop];

  id v8 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
  [v8 stop];

  int v9 = +[ICInAppMessageManager sharedManager];
  [v9 stopSystemService];

  id v10 = [(ICDServer *)self mediaUserStateCenterServer];
  [v10 stop];
}

- (void)_startAncillaryServices
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices begin", buf, 0xCu);
  }

  unsigned int v4 = [(ICDServer *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A80C;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(v4, block);

  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 2", buf, 0xCu);
  }

  unsigned int v6 = +[MediaLibraryAccessRevocationController sharedController];
  [v6 startObservingRevocations];

  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 3", buf, 0xCu);
  }

  id v8 = +[AppleMusicAPITokenIDSService sharedService];
  [v8 start];

  int v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 4", buf, 0xCu);
  }

  id v10 = [(ICDServer *)self backgroundTaskManager];
  [v10 startPeriodicPolling];

  __int16 v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 5", buf, 0xCu);
  }

  int v12 = +[CloudRemoteRequestOperationExecutionServiceListener sharedRemoteRequestOperationExecutionServiceListener];
  [v12 start];

  __int16 v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 6", buf, 0xCu);
  }

  [(ICDServer *)self _performPeriodicSubscriptionTasks];
  unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 7", buf, 0xCu);
  }

  __int16 v15 = +[ICLibraryAuthServiceClientTokenProvider sharedProvider];
  [v15 startService];

  unsigned int v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 8", buf, 0xCu);
  }

  long long v17 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v18 = [v17 isWatch];

  if (v18)
  {
    long long v19 = +[ICDeviceSetupStatusMonitor sharedMonitor];
    [v19 performBlockAfterDeviceSetup:&stru_1001BB330];
  }
  else
  {
    long long v20 = +[ICPlayActivityServer sharedInstance];
    [v20 start];

    long long v21 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 9", buf, 0xCu);
    }

    uint64_t v22 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
    [v22 start];

    long long v19 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 10", buf, 0xCu);
    }
  }

  __int16 v23 = +[ICInAppMessageManager sharedManager];
  [v23 startSystemService];

  uint64_t v24 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 11", buf, 0xCu);
  }

  uint64_t v25 = +[ICDeviceInfo currentDeviceInfo];
  if (([v25 isIPhone] & 1) != 0 || objc_msgSend(v25, "isIPod"))
  {
    CFStringRef v26 = +[ICMusicLibraryRecommendationController sharedLibraryRecommendationController];
    [v26 startSystemService];
  }
  __int16 v27 = [(ICDServer *)self mediaUserStateCenterServer];
  [v27 start];

  CFStringRef v28 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 12", buf, 0xCu);
  }

  unsigned int v29 = [(ICDServer *)self playbackPositionService];
  [v29 start];

  long long v30 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices... 13", buf, 0xCu);
  }

  [(ICDServer *)self _updateMediaRemoteCommands:0];
  [(ICDServer *)self _precacheHomeProperties];
  long long v31 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "ICDServer %p - _startAncillaryServices finished", buf, 0xCu);
  }
}

- (void)_initializeAncillaryServices
{
  id v3 = [(ICDServer *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A944;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_setupSigtermHandler
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up sigterm handler", (uint8_t *)buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  unsigned int v4 = dispatch_get_global_queue(21, 0);
  unsigned __int8 v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v5;

  objc_initWeak(buf, self);
  BOOL v7 = self->_sigtermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10006AD70;
  handler[3] = &unk_1001BDCA8;
  objc_copyWeak(&v9, buf);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_setupInternalQueues
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned int v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  unsigned __int8 v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServer.serial.queue", v4);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v5;

  BOOL v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServer.startup.queue", v7);
  startupQueue = self->_startupQueue;
  self->_startupQueue = v8;

  id v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  internalOperationQueue = self->_internalOperationQueue;
  self->_internalOperationQueue = v10;

  [(NSOperationQueue *)self->_internalOperationQueue setName:@"com.apple.itunescloudd.ICDServer.internal.operation.queue"];
  int v12 = self->_internalOperationQueue;

  [(NSOperationQueue *)v12 setMaxConcurrentOperationCount:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  __int16 v11 = (NSUserDefaults *)a4;
  id v12 = a5;
  if (self->_mediaPlaybackDefaults == v11
    && [v10 isEqualToString:@"MPCPlaybackPrivateListeningEnabled"])
  {
    __int16 v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Private listening changed, notifying assistant.", buf, 2u);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICDServer;
    [(ICDServer *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)notificationsManagerDidReceiveFamilyCircleChangedNotification:(id)a3
{
  if ([(ICDServer *)self _canCompleteStartupSequence])
  {
    [(ICDServer *)self _completeStartupSequenceIfNeeded];
    unsigned int v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Family Circle Changed]", (uint8_t *)&v7, 0xCu);
    }

    unsigned __int8 v5 = +[ICMusicSubscriptionStatusController sharedStatusController];
    [v5 invalidateCachedSubscriptionStatusWithCompletionHandler:&stru_1001BB2F0];
    unsigned int v6 = +[ICUserIdentity activeAccount];
    [v5 getSubscriptionStatusForUserIdentity:v6 bypassingCache:1 withCompletionHandler:&stru_1001BB310];
  }
  else
  {
    unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Family Circle Changed - Not ready]", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self isStartupSequenceCompleted];
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Flush Play Activity events request]", (uint8_t *)&v7, 0xCu);
    }

    [(ICDServer *)self _handleFlushPlayActivityEvents];
  }
  else
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Flush Play Activity events request - Not ready]", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)notificationsManagerDidReceiveMusicSettingsChangedNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self _canCompleteStartupSequence];
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Music settings changed]", (uint8_t *)&v7, 0xCu);
    }

    [(ICDServer *)self _updateHTTPCookieStoreForContentRestrictions];
  }
  else
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Music settings changed - Not ready]", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)notificationsManagerDidReceivePhoneNumberChangedNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self _canCompleteStartupSequence];
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Phone number changed]", (uint8_t *)&v9, 0xCu);
    }

    id v7 = +[ICMusicSubscriptionStatusController sharedStatusController];
    id v8 = +[ICMusicSubscriptionStatusCache sharedCache];
    [v8 updateBaseCacheKey];

    [(ICDServer *)self _completeStartupSequenceIfNeeded];
  }
  else
  {
    if (v6)
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Phone number changed - Not ready]", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)notificationsManagerDidReceiveFirstUnlockNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self _canCompleteStartupSequence];
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [First unlock]", (uint8_t *)&v7, 0xCu);
    }

    [(ICDServer *)self _completeStartupSequenceIfNeeded];
  }
  else
  {
    if (v6)
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [First unlock - Not ready]", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveApplicationInstallationNotification:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(ICDServer *)self isStartupSequenceCompleted];
  int v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Application install/removal]", (uint8_t *)&v9, 0xCu);
    }

    [(ICDServer *)self _handleApplicationRegistrationNotification:v5];
  }
  else
  {
    if (v8)
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Application install/removal - Not ready]", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveFamilyDeletionEventNotification:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(ICDServer *)self isStartupSequenceCompleted];
  int v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v10 = 134217984;
      __int16 v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Family deletion event]", (uint8_t *)&v10, 0xCu);
    }

    int v7 = [v5 userInfo];
    int v9 = [v7 objectForKeyedSubscript:@"ICDServerNotificationsManagerFamilyEventKey"];
    [(ICDServer *)self _handleFamilyContentDeletionEvent:v9];
  }
  else if (v8)
  {
    int v10 = 134217984;
    __int16 v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Family deletion event - Not ready]", (uint8_t *)&v10, 0xCu);
  }
}

- (void)notificationsManager:(id)a3 didReceiveAuthServiceTokenDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = [(ICDServer *)self isStartupSequenceCompleted];
  unsigned __int8 v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Auth service token]", (uint8_t *)&v8, 0xCu);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
  }
  else
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Auth service token - Not ready]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveSubscriptionStatusDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = [(ICDServer *)self isStartupSequenceCompleted];
  unsigned __int8 v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Subscription status]", (uint8_t *)&v9, 0xCu);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
    int v8 = [(ICDServer *)self accountManager];
    unsigned __int8 v6 = [v8 activeConfiguration];

    [(ICDServer *)self _updateAirPlaySettingsForConfiguration:v6];
    [(ICDServer *)self _updateAllowsExplicitContentSettingForConfiguration:v6 automatically:1];
    [(ICDServer *)self _ensureMusicSubscriptionKeysAreAvailableForConfiguration:v6];
    [(ICDServer *)self _updateHTTPCookieStoreForContentRestrictions];
    [(ICDServer *)self _updateEnhancedAudioAvailabilityIfNeeded];
    [(ICDServer *)self _updateMediaRemoteCommands:1];
  }
  else if (v7)
  {
    int v9 = 134217984;
    int v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Subscription status - Not ready]", (uint8_t *)&v9, 0xCu);
  }
}

- (void)notificationsManager:(id)a3 didReceiveAllowsMusicVideosDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = [(ICDServer *)self isStartupSequenceCompleted];
  unsigned __int8 v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Allows music videos]", (uint8_t *)&v8, 0xCu);
    }

    [(ICDServer *)self _updateHTTPCookieStoreForContentRestrictions];
  }
  else
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Allows music videos - Not ready]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveAllowsExplicitContentDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = [(ICDServer *)self isStartupSequenceCompleted];
  unsigned __int8 v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      objc_super v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Allows explicit content]", buf, 0xCu);
    }

    uint64_t v8 = [(ICDServer *)self accountManager];
    int v9 = [(id)v8 supportedConfigurations];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006BD8C;
    v12[3] = &unk_1001BB2B0;
    void v12[4] = self;
    [v9 enumerateObjectsUsingBlock:v12];

    [(ICDServer *)self _updateHTTPCookieStoreForContentRestrictions];
    int v10 = [sub_100062E30() sharedRestrictionsMonitor];
    LOBYTE(v8) = [v10 allowsExplicitContent];

    if ((v8 & 1) == 0)
    {
      id v11 = objc_alloc_init((Class)CSSearchableIndex);
      [v11 deleteInteractionsWithGroupIdentifiers:&off_1001CCC40 bundleID:@"com.apple.Music" protectionClass:0 completionHandler:&stru_1001BB2D0];
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      objc_super v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Allows explicit content - Not ready]", buf, 0xCu);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveHandlerCoordinatorFinishedInitializationNotification:(id)a4
{
  unsigned __int8 v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL switchLibraryManagementPolicy = self->_switchLibraryManagementPolicy;
    BOOL startupSequenceCompleted = self->_startupSequenceCompleted;
    *(_DWORD *)buf = 134218496;
    __int16 v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = switchLibraryManagementPolicy;
    __int16 v18 = 1024;
    BOOL v19 = startupSequenceCompleted;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Handler Coordinator Did Initialize], should switch library management policy = %{BOOL}u, BOOL startupSequenceCompleted = %{BOOL}u", buf, 0x18u);
  }

  if ([(ICDServer *)self isStartupSequenceCompleted])
  {
    uint64_t v8 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v9 = [v8 isAppleTV];

    if (!v9) {
      return;
    }
    int v10 = [(ICDServer *)self internalOperationQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006C0EC;
    v12[3] = &unk_1001BEC20;
    void v12[4] = self;
    [v10 addOperationWithBlock:v12];
  }
  else
  {
    serverStartupGroup = self->_serverStartupGroup;
    int v10 = [(ICDServer *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C030;
    block[3] = &unk_1001BEC20;
    block[4] = self;
    dispatch_group_notify(serverStartupGroup, v10, block);
  }
}

- (void)notificationsManager:(id)a3 didReceiveUserIdentityStoreDidChangeNotification:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [User identity store changed]", (uint8_t *)&v7, 0xCu);
  }

  [(ICDServer *)self _handleUserIdentityStoreDidChangeNotification:v5];
}

- (void)notificationsManager:(id)a3 didReceiveActiveUserIdentityDidChangeNotification:(id)a4
{
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Active user identity changed]", (uint8_t *)&v7, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, ICCloudClientActiveUserIdentityDidChangeNotification, 0, 0, 1u);
  [(ICDServer *)self _updateEnhancedAudioAvailabilityIfNeeded];
  [(ICDServer *)self _updateAccountServerCachedData];
}

- (void)notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self isStartupSequenceCompleted];
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134217984;
      unsigned int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Cloud authentication]", (uint8_t *)&v8, 0xCu);
    }

    id v5 = [(ICDServer *)self accountManager];
    int v7 = [v5 activeConfiguration];
    [(ICDServer *)self _updateAirPlaySettingsForConfiguration:v7];
  }
  else if (v6)
  {
    int v8 = 134217984;
    unsigned int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Cloud authentication - Not ready]", (uint8_t *)&v8, 0xCu);
  }
}

- (void)notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self _canCompleteStartupSequence];
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      __int16 v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Cellular restriction]", buf, 0xCu);
    }

    [(ICDServer *)self _completeStartupSequenceIfNeeded];
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0);
    int v8 = [(ICDServer *)self accountManager];
    id v5 = [v8 activeConfiguration];

    if (AppBooleanValue && v5)
    {
      unsigned int v9 = [v5 userIdentity];
      int v10 = +[ML3MusicLibrary musicLibraryForUserAccount:v9];

      id v11 = [v5 userIdentityStore];
      id v12 = [v5 userIdentity];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10006C6F4;
      v14[3] = &unk_1001BEB60;
      id v15 = v10;
      id v5 = v5;
      __int16 v16 = v5;
      id v13 = v10;
      [v11 getPropertiesForUserIdentity:v12 completionHandler:v14];
    }
  }
  else if (v6)
  {
    *(_DWORD *)buf = 134217984;
    __int16 v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Cellular restriction - Not ready]", buf, 0xCu);
  }
}

- (void)notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:(id)a3
{
  unsigned __int8 v4 = [(ICDServer *)self isStartupSequenceCompleted];
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v12 = 134217984;
      id v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Processing notification [Import finished]", (uint8_t *)&v12, 0xCu);
    }

    int v7 = [(ICDServer *)self accountManager];
    int v8 = [v7 activeConfiguration];
    id v5 = +[BaseRequestHandler handlerForConfiguration:v8];

    if (v5)
    {
      unsigned int v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received library import did finish notification, triggering artist hero update.", (uint8_t *)&v12, 2u);
      }

      int v10 = [v5 configuration];
      id v11 = [v10 clientIdentity];
      [v5 updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:v11];
    }
  }
  else if (v6)
  {
    int v12 = 134217984;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDServer %p - Ignoring notification [Import finished - Not ready]", (uint8_t *)&v12, 0xCu);
  }
}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 134217984;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CloudService %p Handling notification request that device setup has finished", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = +[ICDeviceSetupStatusMonitor sharedMonitor];
  [v6 setSetupAssistantComplete:1];

  [(ICDServer *)self _completeStartupSequenceIfNeeded];
  v4[2](v4, 0);
}

- (void)scheduleBackgroundUpdateType:(int64_t)a3 forConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = [(ICDServer *)self backgroundTaskManager];
  [v7 scheduleTaskOfType:a3 forConfiguration:v6];
}

- (void)listCloudServerOperations
{
  id v3 = [(ICDServer *)self serverOperationsManager];
  id v2 = [v3 listCloudServerOperations];
}

- (void)processPendingKeyInvalidations
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "processing pending key invalidations", v5, 2u);
  }

  unsigned __int8 v4 = [(ICDServer *)self enhancedAudioKeyManager];
  [v4 processPendingKeyInvalidations];
}

- (void)fetchEnhancedAudioOfflineKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching enhanced-audio offline keys", v5, 2u);
  }

  unsigned __int8 v4 = [(ICDServer *)self enhancedAudioKeyManager];
  [v4 fetchMissingOfflineKeys];
}

- (void)refreshEnhancedAudioSharedKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing enhanced-audio shared keys", v5, 2u);
  }

  unsigned __int8 v4 = [(ICDServer *)self enhancedAudioKeyManager];
  [v4 refreshSharedKeys];
}

- (void)enumerateBackgroundOperationsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDServer *)self serverOperationsManager];
  [v5 enumerateBackgroundOperationsUsingBlock:v4];
}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDServer *)self serverOperationsManager];
  [v5 enumerateOperationsUsingBlock:v4];
}

- (BOOL)hasOperationsOfClass:(Class)a3
{
  id v4 = [(ICDServer *)self serverOperationsManager];
  LOBYTE(a3) = [v4 hasOperationsOfClass:a3];

  return (char)a3;
}

- (BOOL)cancelOperationsByClass:(Class)a3
{
  id v4 = [(ICDServer *)self serverOperationsManager];
  LOBYTE(a3) = [v4 cancelOperationsByClass:a3];

  return (char)a3;
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ICDServer *)self serverOperationsManager];
  [v7 addBackgroundOperation:v6 priority:v4];
}

- (void)stop
{
  id v3 = +[NSDate date];
  uint64_t v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping server...", buf, 2u);
  }

  id v5 = [(ICDServer *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D168;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSDate date];
    [v7 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped server in %f seconds.", buf, 0xCu);
  }
}

- (void)start
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006D39C;
  v9[3] = &unk_1001BB190;
  v9[4] = self;
  self->_stateHandle = sub_10006D39C((uint64_t)v9);
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting server...", buf, 2u);
  }

  id v4 = [(ICDServer *)self _setupXPCListenerForService:1];
  id v5 = +[CloudMusicSubscriptionStatusServiceListener sharedMusicSubscriptionStatusServiceListener];
  [v5 start];

  id v6 = +[ICDeviceSetupStatusMonitor sharedMonitor];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006D480;
  v7[3] = &unk_1001BEC20;
  void v7[4] = self;
  [v6 performBlockAfterDeviceSetup:v7];

  notify_post("com.apple.itunescloudd.launched");
}

- (id)_stateDump
{
  id v2 = [(ICDServer *)self serverOperationsManager];
  id v3 = [v2 listCloudServerOperations];

  return v3;
}

- (void)dealloc
{
  [(ICDServer *)self stop];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = 0;

  serverOperationsManager = self->_serverOperationsManager;
  self->_serverOperationsManager = 0;

  networkAvailabilityService = self->_networkAvailabilityService;
  self->_networkAvailabilityService = 0;

  mediaUserStateCenterServer = self->_mediaUserStateCenterServer;
  self->_mediaUserStateCenterServer = 0;

  playbackPositionService = self->_playbackPositionService;
  self->_playbackPositionService = 0;

  v9.receiver = self;
  v9.super_class = (Class)ICDServer;
  [(ICDServer *)&v9 dealloc];
}

- (id)_init
{
  v24.receiver = self;
  v24.super_class = (Class)ICDServer;
  id v2 = [(ICDServer *)&v24 init];
  if (v2)
  {
    +[ICUserIdentityStore _claimSingleWriterStatus];
    [(ICDServer *)v2 _setupInternalQueues];
    [(ICDServer *)v2 _setupSigtermHandler];
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    xpcListeners = v2->_xpcListeners;
    v2->_xpcListeners = v3;

    dispatch_group_t v5 = dispatch_group_create();
    serverStartupGroup = v2->_serverStartupGroup;
    v2->_serverStartupGroup = (OS_dispatch_group *)v5;

    id v7 = [[ICDServerNotificationsManager alloc] initWithDelegate:v2];
    serverNotificationsManager = v2->_serverNotificationsManager;
    v2->_serverNotificationsManager = v7;

    objc_super v9 = objc_alloc_init(ICDNetworkAvailabilityService);
    networkAvailabilityService = v2->_networkAvailabilityService;
    v2->_networkAvailabilityService = v9;

    uint64_t v11 = objc_alloc_init(ICDServerOperationsManager);
    serverOperationsManager = v2->_serverOperationsManager;
    v2->_serverOperationsManager = v11;

    id v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaplaybackcore"];
    mediaPlaybackDefaults = v2->_mediaPlaybackDefaults;
    v2->_mediaPlaybackDefaults = v13;

    id v15 = objc_alloc_init(ICDMediaUserStateCenterServer);
    mediaUserStateCenterServer = v2->_mediaUserStateCenterServer;
    v2->_mediaUserStateCenterServer = (ICMediaUserStateCenterServerProtocol *)v15;

    v2->_outputClusterType = 0;
    [(ICDServer *)v2 _setupKVO];
    BOOL v17 = objc_alloc_init(ICDEnhancedAudioKeyManager);
    enhancedAudioKeyManager = v2->_enhancedAudioKeyManager;
    v2->_enhancedAudioKeyManager = v17;

    internalOperationQueue = v2->_internalOperationQueue;
    long long v20 = +[CloudArtworkImportSetupOperation sharedSetupOperation];
    [(NSOperationQueue *)internalOperationQueue addOperation:v20];

    long long v21 = objc_alloc_init(ICDPlaybackPositionService);
    playbackPositionService = v2->_playbackPositionService;
    v2->_playbackPositionService = v21;
  }
  return v2;
}

@end