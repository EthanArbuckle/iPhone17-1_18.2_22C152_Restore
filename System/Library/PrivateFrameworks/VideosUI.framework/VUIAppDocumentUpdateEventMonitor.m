@interface VUIAppDocumentUpdateEventMonitor
+ (BOOL)_isAppRefreshEventType:(id)a3;
+ (id)sharedMonitor;
- (NSDate)lastAppDidBecomeActive;
- (NSDate)lastProcesssedPlayActivity;
- (NSMapTable)observerMapTable;
- (VUIAppDocumentUpdateEventMonitor)init;
- (id)_init;
- (int)playbackReportToken;
- (void)_handleAccountDidChangeNotification:(id)a3;
- (void)_handleAppDidBecomeActive:(id)a3;
- (void)_handleAppDidEnterBackgroundNotification:(id)a3;
- (void)_handleAppLibraryDidChangeNotification:(id)a3;
- (void)_handleAppWillEnterForegroundNotification:(id)a3;
- (void)_handleClearFromPlayHistoryRequestDidFinishNotification:(id)a3;
- (void)_handleClearPlayHistoryNotification:(id)a3;
- (void)_handleDeviceDiscoveryDataAvailableNotification:(id)a3;
- (void)_handleEntitlementsDidChangeNotification:(id)a3;
- (void)_handleFamilyUpdate:(id)a3;
- (void)_handleFavoritesRequestDidFinishNotification:(id)a3;
- (void)_handleFavoritesSyncCompleted:(id)a3;
- (void)_handleFederatedAppDidInstallNotification:(id)a3;
- (void)_handleLocationAuthorizationDidChangeNotification:(id)a3;
- (void)_handleLocationDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3;
- (void)_handleNowPlayingDidEndNotification:(id)a3;
- (void)_handleNowPlayingWillStartNotification:(id)a3;
- (void)_handlePlayHistoryUpdatedNotification:(id)a3;
- (void)_handlePlaybackReportNotification:(id)a3;
- (void)_handlePreferredVideoFormatDidChangeNotification:(id)a3;
- (void)_handlePurchaseFlowDidFinishNotification:(id)a3;
- (void)_handleRemoveFromPlayHistoryRequestDidFinishNotification:(id)a3;
- (void)_handleRestrictionsDidChangeNotification:(id)a3;
- (void)_handleSettingsDidChangeNotification:(id)a3;
- (void)_handleSubscriptionDidChangeNotification:(id)a3;
- (void)_handleSyndicationInfoUpdatedNotification:(id)a3;
- (void)_handleTVSubscriptionEntitlementsChanged:(id)a3;
- (void)_handleUTSKDidChangeNotification:(id)a3;
- (void)_handleUpNextLockupArtSettingDidChange:(id)a3;
- (void)_handleUpNextRequestDidFinishNotification:(id)a3;
- (void)_handleVPPADidChangeNotification:(id)a3;
- (void)_handleXPUpNextRequestDidFinishNotification:(id)a3;
- (void)_isPlaybackUIBeingShownDidChange:(id)a3;
- (void)_notifyObserver:(id)a3 ofRefreshEvent:(id)a4;
- (void)_notifyObserversOfEvent:(id)a3;
- (void)_postSubscriptionNotification:(id)a3 interruptedOfferDetails:(id)a4 error:(id)a5;
- (void)addObserver:(id)a3 forEventDescriptors:(id)a4;
- (void)addObserver:(id)a3 forEventDescriptors:(id)a4 viewController:(id)a5;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setLastAppDidBecomeActive:(id)a3;
- (void)setLastProcesssedPlayActivity:(id)a3;
- (void)setObserverMapTable:(id)a3;
- (void)setPlaybackReportToken:(int)a3;
- (void)updateDescriptorsForObserver:(id)a3 eventDescriptors:(id)a4;
@end

@implementation VUIAppDocumentUpdateEventMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor___once != -1) {
    dispatch_once(&sharedMonitor___once, &__block_literal_global_82);
  }
  v2 = (void *)sharedMonitor___sharedInstance;
  return v2;
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)VUIAppDocumentUpdateEventMonitor;
  v3 = [(VUIAppDocumentUpdateEventMonitor *)&v17 self];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = (void *)v3[5];
    v3[5] = v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v7 = (void *)v3[3];
    v3[3] = v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    v10 = +[VUIMediaLibraryManager defaultManager];
    v11 = [v10 deviceMediaLibrary];

    if (+[VUIUtilities isSUIEnabled]) {
      v12 = 0;
    }
    else {
      v12 = v11;
    }
    [v8 addObserver:v3 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v12];
    [v8 addObserver:v3 selector:sel__handleAccountDidChangeNotification_ name:*MEMORY[0x1E4FA83B0] object:0];
    [v8 addObserver:v3 selector:sel__handlePreferredVideoFormatDidChangeNotification_ name:@"VUIPreferredVideoFormatDidChangeNotification" object:0];
    [v9 addObserver:v3 selector:sel__handleFamilyUpdate_ name:*MEMORY[0x1E4F61830] object:0];
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: Listening to ASDSubscriptionEntitlementsTVDidChangeNotification", v16, 2u);
    }

    v14 = [MEMORY[0x1E4F4BCF0] sharedInstance];
    [v8 addObserver:v3 selector:sel__handleTVSubscriptionEntitlementsChanged_ name:*MEMORY[0x1E4F4BBC0] object:v14];
    [v8 addObserver:v3 selector:sel__handleVPPADidChangeNotification_ name:@"VUIVPPADidChangeNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleFederatedAppDidInstallNotification_ name:@"VUIFederatedAppDidInstallNotification" object:0];
    [v9 addObserver:v3 selector:sel__handlePlaybackReportNotification_ name:*MEMORY[0x1E4FB5220] object:0 suspensionBehavior:2];
    [v8 addObserver:v3 selector:sel__handleFavoritesRequestDidFinishNotification_ name:@"VUIFavoritesRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleUpNextRequestDidFinishNotification_ name:@"VUIUpNextRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleRemoveFromPlayHistoryRequestDidFinishNotification_ name:@"VUIRemoveFromPlayHistoryRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleClearFromPlayHistoryRequestDidFinishNotification_ name:@"VUIClearFromPlayHistoryRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handlePlayHistoryUpdatedNotification_ name:@"VUIPlayHistoryUpdatedNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleSettingsDidChangeNotification_ name:*MEMORY[0x1E4FB52A8] object:0];
    [v8 addObserver:v3 selector:sel__handleAppLibraryDidChangeNotification_ name:*MEMORY[0x1E4FB51E0] object:0];
    [v8 addObserver:v3 selector:sel__handlePurchaseFlowDidFinishNotification_ name:@"VUIPurchaseRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleSubscriptionDidChangeNotification_ name:@"VUISubscribeRequestDidFinishNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleUTSKDidChangeNotification_ name:*MEMORY[0x1E4FB5210] object:0];
    [v8 addObserver:v3 selector:sel__handleLocationAuthorizationDidChangeNotification_ name:*MEMORY[0x1E4FB5248] object:0];
    [v8 addObserver:v3 selector:sel__handleLocationDidChangeNotification_ name:*MEMORY[0x1E4FB5250] object:0];
    [v8 addObserver:v3 selector:sel__handleAppWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB3D80] object:0];
    [v8 addObserver:v3 selector:sel__handleAppDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB3D78] object:0];
    [v8 addObserver:v3 selector:sel__handleSyndicationInfoUpdatedNotification_ name:@"SyndicationInfoUpdated" object:0];
    [v8 addObserver:v3 selector:sel__handleRestrictionsDidChangeNotification_ name:@"VUIRestrictionsDidChangeNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleUpNextLockupArtSettingDidChange_ name:@"VUIUpNextLockupArtSettingDidChangeNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleClearPlayHistoryNotification_ name:@"VUIClearPlayHistoryNotification" object:0];
    [v8 addObserver:v3 selector:sel__isPlaybackUIBeingShownDidChange_ name:VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0] object:0];
    [v8 addObserver:v3 selector:sel__handleDeviceDiscoveryDataAvailableNotification_ name:@"VUIDeviceDiscoveryDataNowAvailableNotification" object:0];
    [v8 addObserver:v3 selector:sel__handleFavoritesSyncCompleted_ name:@"VUISportsFavoritesLocalStorageDidChangeNotification" object:0];
  }
  return v3;
}

- (void)addObserver:(id)a3 forEventDescriptors:(id)a4 viewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  objc_initWeak(&v20, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke;
  v15 = &unk_1E6DF8AE8;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &v20);
  id v11 = v9;
  id v16 = v11;
  v12 = v13;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v14(v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke(void **a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = objc_loadWeakRetained(a1 + 7);
  if ([a1[4] count])
  {
    v5 = [WeakRetained observerMapTable];
    uint64_t v6 = [v5 objectForKey:v4];
    if (!v6)
    {
      uint64_t v6 = objc_alloc_init(_VUIAppDocumentUpdateEventObserverContext);
      [v5 setObject:v6 forKey:v4];
      objc_initWeak((id *)location, WeakRetained);
      objc_initWeak(&from, v4);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke_140;
      v13[3] = &unk_1E6DF8AC0;
      objc_copyWeak(&v14, (id *)location);
      objc_copyWeak(&v15, &from);
      [(_VUIAppDocumentUpdateEventObserverContext *)v6 setRefreshTimerFiredBlock:v13];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    [(_VUIAppDocumentUpdateEventObserverContext *)v6 setEventDescriptors:a1[4]];
    [(_VUIAppDocumentUpdateEventObserverContext *)v6 setViewController:v3];
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = VUIAppDocumentUpdateEventStringRepresentationForDescriptors(a1[4]);
      *(_DWORD *)id location = 134218242;
      *(void *)&location[4] = v4;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Added observer [%p] for event descriptors [%@]", location, 0x16u);
    }
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(_VUIAppDocumentUpdateEventObserverContext *)v6 refreshTimerByEventDescriptor];
      id v11 = [v10 allKeys];
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v11;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active timers for event descriptors [%@]", location, 0xCu);
    }
  }
  else
  {
    v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 134217984;
      *(void *)&location[4] = v4;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Removed observer [%p] since there were no event descriptors", location, 0xCu);
    }

    [WeakRetained removeObserver:v4];
  }
}

- (NSMapTable)observerMapTable
{
  return self->_observerMapTable;
}

void __49__VUIAppDocumentUpdateEventMonitor_sharedMonitor__block_invoke()
{
  id v0 = [[VUIAppDocumentUpdateEventMonitor alloc] _init];
  v1 = (void *)sharedMonitor___sharedInstance;
  sharedMonitor___sharedInstance = (uint64_t)v0;
}

- (VUIAppDocumentUpdateEventMonitor)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  int playbackReportToken = self->_playbackReportToken;
  if (playbackReportToken)
  {
    notify_cancel(playbackReportToken);
    self->_int playbackReportToken = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIAppDocumentUpdateEventMonitor;
  [(VUIAppDocumentUpdateEventMonitor *)&v6 dealloc];
}

- (void)addObserver:(id)a3 forEventDescriptors:(id)a4
{
}

- (void)updateDescriptorsForObserver:(id)a3 eventDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __82__VUIAppDocumentUpdateEventMonitor_updateDescriptorsForObserver_eventDescriptors___block_invoke;
  v12 = &unk_1E6DF65E0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  id v8 = v7;
  id v13 = v8;
  id v9 = v10;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v11(v9);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __82__VUIAppDocumentUpdateEventMonitor_updateDescriptorsForObserver_eventDescriptors___block_invoke(void **a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if ([a1[4] count])
  {
    uint64_t v4 = [WeakRetained observerMapTable];
    v5 = [v4 objectForKey:v3];
    if (v5)
    {
      id v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        id v13 = v3;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: updating descriptors for observer [%p].", (uint8_t *)&v12, 0xCu);
      }

      [v5 updateDescriptorsWithDescriptors:a1[4]];
    }
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = VUIAppDocumentUpdateEventStringRepresentationForDescriptors(a1[4]);
      int v12 = 134218242;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Updated observer [%p] with event descriptors [%@]", (uint8_t *)&v12, 0x16u);
    }
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 refreshTimerByEventDescriptor];
      id v11 = [v10 allKeys];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active timers for event descriptors after update [%@]", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      id v13 = v3;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: No operation for observer during update [%p] since there were no event descriptors", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke_140(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4) {
    [WeakRetained _notifyObserver:v4 ofRefreshEvent:v6];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __51__VUIAppDocumentUpdateEventMonitor_removeObserver___block_invoke;
  id v9 = &unk_1E6DF5440;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v6, v7)) {
    v8((uint64_t)v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__VUIAppDocumentUpdateEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Removing observer [%p]", (uint8_t *)&v7, 0xCu);
  }

  v5 = [WeakRetained observerMapTable];
  uint64_t v6 = [v5 objectForKey:v3];
  [v6 invalidate];
  [v5 removeObjectForKey:v3];
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Media Library contents did change notification received", v6, 2u);
  }

  v5 = +[VUIAppDocumentUpdateEvent purchases];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  id v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isPlaybackUIBeingShown];

  if (v5)
  {
    [(VUIAppDocumentUpdateEventMonitor *)self _handleNowPlayingWillStartNotification:0];
  }
  else
  {
    [(VUIAppDocumentUpdateEventMonitor *)self _handleNowPlayingDidEndNotification:0];
  }
}

- (void)_handlePlaybackReportNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  VUIRequireMainThread();
  int v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] WLK activity notification received", buf, 2u);
  }

  uint64_t v6 = [v4 userInfo];

  int v7 = objc_msgSend(v6, "vui_stringForKey:", *MEMORY[0x1E4FB5228]);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
  if (v8)
  {
    id v16 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v16];
    id v10 = v16;
    if (v9)
    {
      BOOL playbackIsActive = self->_playbackIsActive;
      int v12 = VUIDefaultLogObject();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (playbackIsActive)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Playback activity is pended during playback.", buf, 2u);
        }

        __int16 v14 = v9;
        pendingPlayActivity = self->_pendingPlayActivity;
        self->_pendingPlayActivity = v14;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Notifying observers", buf, 2u);
        }

        pendingPlayActivity = +[VUIAppDocumentUpdateEvent playActivity];
        [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:pendingPlayActivity];
      }
    }
    else
    {
      pendingPlayActivity = VUIDefaultLogObject();
      if (os_log_type_enabled(pendingPlayActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v18 = v10;
        _os_log_impl(&dword_1E2BD7000, pendingPlayActivity, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Failed to decode summary %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] WLK notification lacks data payload", buf, 2u);
    }
  }
}

- (void)_handleNowPlayingWillStartNotification:(id)a3
{
  VUIRequireMainThread();
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Player begin notification received", v5, 2u);
  }

  self->_BOOL playbackIsActive = 1;
}

- (void)_handleNowPlayingDidEndNotification:(id)a3
{
  VUIRequireMainThread();
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Player end notification received", buf, 2u);
  }

  self->_BOOL playbackIsActive = 0;
  pendingPlayActivity = self->_pendingPlayActivity;
  if (pendingPlayActivity)
  {
    if ([(WLKPlaybackSummary *)pendingPlayActivity playbackState] != 1)
    {
      uint64_t v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Notifying observers with pending play activity", v9, 2u);
      }

      int v7 = +[VUIAppDocumentUpdateEvent playActivity];
      [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v7];
    }
    id v8 = self->_pendingPlayActivity;
    self->_pendingPlayActivity = 0;
  }
}

- (void)_handleAccountDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active account did change notification received", v6, 2u);
  }

  int v5 = +[VUIAppDocumentUpdateEvent accountChanged];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleRestrictionsDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Restrictions did change notification received", v6, 2u);
  }

  int v5 = +[VUIAppDocumentUpdateEvent restrictions];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleUpNextLockupArtSettingDidChange:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Up next lockup art setting did change notification received", v6, 2u);
  }

  int v5 = +[VUIAppDocumentUpdateEvent upNextLockupArtSettingChanged];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handlePreferredVideoFormatDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Preferred video format did change notification received", v6, 2u);
  }

  int v5 = +[VUIAppDocumentUpdateEvent preferredVideoFormat];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleClearPlayHistoryNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Clear play history notification received", v6, 2u);
  }

  int v5 = +[VUIAppDocumentUpdateEvent clearPlayHistory];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_postSubscriptionNotification:(id)a3 interruptedOfferDetails:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = v10;
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:@"Error"];
  }
  if ([v7 length])
  {
    [v11 setObject:v7 forKeyedSubscript:@"TransactionID"];
    int v12 = [MEMORY[0x1E4FB5088] sharedInstance];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke;
    v13[3] = &unk_1E6DF8B10;
    id v14 = v8;
    id v15 = v11;
    [v12 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:v13];
  }
}

void __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: Failed to fetch init/config. Not presenting successful subscription toast", v5, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke_2;
    block[3] = &unk_1E6DF3F68;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v3 = v7;
  }
}

void __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"notificationTitle"];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = &stru_1F3E921E0;
  }
  id v10 = v4;

  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:@"notificationBody"];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1F3E921E0;
  }
  id v8 = v7;

  +[VUIActionCommerceTransaction displayConfirmationUIWithTitle:v10 andBody:v8];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"VUISubscribeRequestDidFinishNotification" object:0 userInfo:*(void *)(a1 + 40)];
}

- (void)_handleFamilyUpdate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleFamilyUpdate: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x1E4FB5088] sharedInstance];
  [v5 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:&__block_literal_global_154];
}

void __56__VUIAppDocumentUpdateEventMonitor__handleFamilyUpdate___block_invoke()
{
  id v0 = VUIDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E2BD7000, v0, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleFamilyUpdate completion", v1, 2u);
  }
}

- (void)_handleTVSubscriptionEntitlementsChanged:(id)a3
{
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4FB5088] sharedInstance];
  [v4 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:&__block_literal_global_156];
}

void __77__VUIAppDocumentUpdateEventMonitor__handleTVSubscriptionEntitlementsChanged___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged - Successfully refreshed config";
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138412290;
    id v11 = v4;
    id v7 = "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged - Error refreshing config, %@";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)_handleVPPADidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: VPPA state did change notification received", v6, 2u);
  }

  uint64_t v5 = +[VUIAppDocumentUpdateEvent entitlements];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleAppWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App will enter foreground notification received", v6, 2u);
  }

  [(VUIAppDocumentUpdateEventMonitor *)self _handleAppDidBecomeActive:v4];
}

- (void)_handleAppDidBecomeActive:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", a3);
  [v4 setSuspended:0];

  uint64_t v5 = [(VUIAppDocumentUpdateEventMonitor *)self lastAppDidBecomeActive];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = [(VUIAppDocumentUpdateEventMonitor *)self lastAppDidBecomeActive];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 > 5.0)
    {
      id v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Send AppDidBecomeActive notification", v14, 2u);
      }

      uint64_t v12 = +[VUIAppDocumentUpdateEvent appDidBecomeActive];
      [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v12];
    }
  }
  BOOL v13 = [MEMORY[0x1E4F1C9C8] date];
  [(VUIAppDocumentUpdateEventMonitor *)self setLastAppDidBecomeActive:v13];
}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App did enter background", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 setSuspended:1];
}

- (void)_handleSyndicationInfoUpdatedNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Highlights changed notification received", v6, 2u);
  }

  uint64_t v5 = +[VUIAppDocumentUpdateEvent highlightsChanged];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleDeviceDiscoveryDataAvailableNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Device discovery data available notification received", v6, 2u);
  }

  uint64_t v5 = +[VUIAppDocumentUpdateEvent deviceDiscoveryDataAvailable];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleFavoritesRequestDidFinishNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  BOOL v6 = [v4 userInfo];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = v7;
    double v9 = objc_msgSend(v6, "vui_numberForKey:", @"Action");
    uint64_t v10 = [v9 unsignedIntegerValue];
    id v11 = objc_msgSend(v6, "vui_errorForKey:", @"Error");
    uint64_t v12 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"FireBackgroundEvent", 0);
    BOOL v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Sports favorites request did finish notification received [%@], teamId: %@", (uint8_t *)&v15, 0x16u);
    }

    if (v8 || !v11)
    {
      id v14 = [[VUIAppDocumentModifiedFavoritesEvent alloc] initWithAction:v10 entityID:v8 isBackground:v12];
      [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v14];
    }
  }
  else
  {
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Ignoring Sports favorites request did finish notification: missing userInfo", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)_handleFavoritesSyncCompleted:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: WLKSportsFavoritesSyncCompletion notification received", v6, 2u);
  }

  uint64_t v5 = +[VUIAppDocumentUpdateEvent favoritesSyncCompleted];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleSettingsDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Settings did change notification received", v6, 2u);
  }

  uint64_t v5 = +[VUIAppDocumentUpdateEvent settings];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleAppLibraryDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E4FB51F0]);
      id v7 = objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E4FB51E8]);
      uint64_t v8 = objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E4FB51F8]);
      double v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v13 = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App library did change notification received", v13, 2u);
      }

      if (v7) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v8 == 0;
      }
      if (!v10 || v6 != 0)
      {
        uint64_t v12 = +[VUIAppDocumentUpdateEvent entitlements];
        [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v12];
      }
    }
  }
}

- (void)_handlePurchaseFlowDidFinishNotification:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  if (v5)
  {
    BOOL v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"CanonicalIDs"];
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v8 = [v4 userInfo];
  if (v8)
  {
    double v9 = [v4 userInfo];
    BOOL v10 = [v9 objectForKeyedSubscript:@"Error"];
  }
  else
  {
    BOOL v10 = 0;
  }

  id v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    __int16 v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Purchase did finish notification received for canonicals %@, error [%@]", buf, 0x16u);
  }

  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count])
    {
      uint64_t v20 = 0;
      v21 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            __int16 v17 = [[VUIAppDocumentPurchaseEventDescriptor alloc] initWithCanonicalID:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            __int16 v18 = [[VUIAppDocumentPurchaseEvent alloc] initWithPurchaseEventDescriptor:v17];
            [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }

      BOOL v10 = 0;
    }
    uint64_t v19 = +[VUIAppDocumentUpdateEvent purchases];
    [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v19];
  }
}

- (void)_handleSubscriptionDidChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  if (v5)
  {
    BOOL v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"Error"];
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Subscription did finish notification received with error [%@]", (uint8_t *)&v10, 0xCu);
  }

  if (!v7)
  {
    double v9 = +[VUIAppDocumentUpdateEvent entitlements];
    [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v9];
  }
}

- (void)_handleEntitlementsDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Entitlements did change notification received", v6, 2u);
  }

  id v5 = +[VUIAppDocumentUpdateEvent entitlements];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleUTSKDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: UTSK did change notification received", v6, 2u);
  }

  id v5 = +[VUIAppDocumentUpdateEvent utsk];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleLocationAuthorizationDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Location authorization did change notification received", v6, 2u);
  }

  id v5 = +[VUIAppDocumentUpdateEvent locationAuthorizationChanged];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleLocationDidChangeNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Location did change notification received", v8, 2u);
  }

  id v5 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
  BOOL v6 = [v5 lastKnownLocation];

  if (v6)
  {
    id v7 = +[VUIAppDocumentUpdateEvent locationRetrieved];
    [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v7];
  }
}

- (void)_handleXPUpNextRequestDidFinishNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  BOOL v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Upnext *Cross Process* did finish notification received %@", (uint8_t *)&v7, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E4F28C40], "vui_wasSentByDifferentProcess:", v5)) {
    [(VUIAppDocumentUpdateEventMonitor *)self _handleUpNextRequestDidFinishNotification:v4];
  }
}

- (void)_handleUpNextRequestDidFinishNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  BOOL v6 = [v4 userInfo];

  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Upnext request did finish notification received [%@]", (uint8_t *)&v12, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    id v8 = v5;
    uint64_t v9 = objc_msgSend(v6, "vui_errorForKey:", @"Error");
    if (!v9)
    {
      int v10 = objc_msgSend(v6, "vui_numberForKey:", @"Action");
      id v11 = -[VUIAppDocumentModifiedUpNextEvent initWithAction:canonicalID:]([VUIAppDocumentModifiedUpNextEvent alloc], "initWithAction:canonicalID:", [v10 unsignedIntegerValue], v8);
      [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v11];
    }
  }
}

- (void)_handlePlayHistoryUpdatedNotification:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Play history update notification received", v6, 2u);
  }

  id v5 = +[VUIAppDocumentUpdateEvent playHistoryUpdated];
  [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v5];
}

- (void)_handleRemoveFromPlayHistoryRequestDidFinishNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  BOOL v6 = [v4 userInfo];

  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Remove from play history request did finish notification received [%@]", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    id v8 = objc_msgSend(v6, "vui_stringForKey:", @"CanonicalID");
    uint64_t v9 = [VUIAppDocumentRemovePlayHistoryEvent alloc];
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v8, 0);
    id v11 = [(VUIAppDocumentRemovePlayHistoryEvent *)v9 initWithRemovedCanonicalIDs:v10];

    [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v11];
  }
}

- (void)_handleClearFromPlayHistoryRequestDidFinishNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  BOOL v6 = [v4 userInfo];

  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    int v12 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Clear from play history request did finish notification received [%@]", (uint8_t *)&v11, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    id v8 = v5;
    uint64_t v9 = objc_msgSend(v6, "vui_errorForKey:", @"Error");
    if (!v9)
    {
      int v10 = [[VUIAppDocumentModifiedUpNextEvent alloc] initWithAction:1 canonicalID:v8];
      [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v10];
    }
  }
}

- (void)_handleFederatedAppDidInstallNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  BOOL v6 = [v4 userInfo];

  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    int v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Federated app installation successful for %@ changed [%@]", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = +[VUIAppDocumentUpdateEvent federatedAppDidInstall];
    [(VUIAppDocumentUpdateEventMonitor *)self _notifyObserversOfEvent:v8];
  }
}

- (void)_notifyObserver:(id)a3 ofRefreshEvent:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Notifying observer [%p] of refresh event: [%@]", (uint8_t *)&v8, 0x16u);
  }

  [v5 appDocumentDidReceiveEvent:v6];
}

- (void)_notifyObserversOfEvent:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke;
  id v9 = &unk_1E6DF3F68;
  __int16 v10 = self;
  id v11 = v4;
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v7);
  }
}

void __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v38 = [*(id *)(a1 + 32) observerMapTable];
  v1 = [v38 keyEnumerator];
  uint64_t v2 = [v1 allObjects];

  int v35 = [(id)objc_opt_class() _isAppRefreshEventType:*(void *)(a1 + 40)];
  v33 = +[VUIAppDocumentUpdateEvent appRefresh];
  id v3 = [*(id *)(a1 + 40) descriptor];
  id v4 = +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive];
  int v36 = [v3 isEqual:v4];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke_2;
  aBlock[3] = &unk_1E6DF8B58;
  aBlock[4] = &v46;
  v37 = (uint64_t (**)(void *, void *, void *))_Block_copy(aBlock);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v5)
  {
    uint64_t v34 = *(void *)v42;
    *(void *)&long long v6 = 134218242;
    long long v31 = v6;
    do
    {
      uint64_t v39 = v5;
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v9 = objc_msgSend(v38, "objectForKey:", v8, v31);
        int v10 = v37[2](v37, v8, v9);
        int v11 = v10;
        if (v36)
        {
          if (!*((unsigned char *)v47 + 24))
          {
            uint64_t v12 = VUIDefaultLogObject();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              __int16 v52 = 2112;
              uint64_t v53 = v16;
              uint64_t v14 = v12;
              uint64_t v15 = "UPDATE_EVENTS: MONITOR: observer document became active by coming to foreground. Observer: [%p] for event: [%@]";
LABEL_13:
              _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
            }
LABEL_14:

            [v8 appDocumentHasBecomeActive];
            goto LABEL_15;
          }
          if (v10)
          {
            uint64_t v12 = VUIDefaultLogObject();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              __int16 v52 = 2112;
              uint64_t v53 = v13;
              uint64_t v14 = v12;
              uint64_t v15 = "UPDATE_EVENTS: MONITOR: view controller backed observer document became active by coming to foregrou"
                    "nd. Observer: [%p] for event: [%@]";
              goto LABEL_13;
            }
            goto LABEL_14;
          }
        }
LABEL_15:
        __int16 v17 = [v9 eventDescriptors];
        __int16 v18 = [*(id *)(a1 + 40) descriptor];
        if (v35
          && ([v9 eventDescriptors],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              [v33 descriptor],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              int v21 = [v19 containsObject:v20],
              v20,
              v19,
              v21))
        {
          id v22 = v33;
        }
        else
        {
          if (![v17 containsObject:v18])
          {
            id v22 = 0;
            goto LABEL_29;
          }
          long long v23 = [v17 member:v18];
          objc_msgSend(v18, "setAnimated:", objc_msgSend(v23, "animated"));
          id v22 = *(id *)(a1 + 40);
        }
        if (v22)
        {
          long long v24 = [*(id *)(a1 + 40) descriptor];
          long long v25 = +[VUIAppDocumentUpdateEventDescriptor utsk];
          int v26 = [v24 isEqual:v25];

          if ((v26 & v11) != 0)
          {
            v27 = VUIDefaultLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              __int16 v52 = 2112;
              uint64_t v53 = v28;
              _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Ignoring observer [%p] for event: [%@]", buf, 0x16u);
            }
          }
          else
          {
            __int16 v29 = VUIDefaultLogObject();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              __int16 v52 = 2112;
              uint64_t v53 = v30;
              _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Notifying observer [%p] of event: [%@]", buf, 0x16u);
            }

            [v8 appDocumentDidReceiveEvent:v22];
          }
        }
LABEL_29:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v46, 8);
}

uint64_t __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = 0;
      goto LABEL_15;
    }
    id v7 = [v6 viewController];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7 != 0;
    if (!v7)
    {
LABEL_15:
      uint64_t v10 = 0;
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  id v8 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v8) {
    BOOL v9 = v8 == v7;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = v9;

LABEL_16:
  return v10;
}

+ (BOOL)_isAppRefreshEventType:(id)a3
{
  id v3 = [a3 descriptor];
  id v4 = +[VUIAppDocumentUpdateEventDescriptor utsk];
  if ([v3 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = +[VUIAppDocumentUpdateEventDescriptor restrictions];
    if ([v3 isEqual:v6])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = +[VUIAppDocumentUpdateEventDescriptor accountChanged];
      if ([v3 isEqual:v7])
      {
        char v5 = 1;
      }
      else
      {
        id v8 = +[VUIAppDocumentUpdateEventDescriptor entitlements];
        char v5 = [v3 isEqual:v8];
      }
    }
  }
  return v5;
}

- (void)setObserverMapTable:(id)a3
{
}

- (int)playbackReportToken
{
  return self->_playbackReportToken;
}

- (void)setPlaybackReportToken:(int)a3
{
  self->_int playbackReportToken = a3;
}

- (NSDate)lastProcesssedPlayActivity
{
  return self->_lastProcesssedPlayActivity;
}

- (void)setLastProcesssedPlayActivity:(id)a3
{
}

- (NSDate)lastAppDidBecomeActive
{
  return self->_lastAppDidBecomeActive;
}

- (void)setLastAppDidBecomeActive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppDidBecomeActive, 0);
  objc_storeStrong((id *)&self->_lastProcesssedPlayActivity, 0);
  objc_storeStrong((id *)&self->_observerMapTable, 0);
  objc_storeStrong((id *)&self->_pendingPlayActivity, 0);
}

@end