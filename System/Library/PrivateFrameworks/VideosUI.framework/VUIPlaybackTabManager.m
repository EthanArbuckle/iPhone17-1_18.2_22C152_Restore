@interface VUIPlaybackTabManager
+ (id)sharedInstance;
- (BOOL)_isCurrentMediaLive;
- (BOOL)_isCurrentMediaSportingEvent;
- (BOOL)_isInfoHUDButtonPresent:(id)a3;
- (BOOL)_isInsightTabAvailable;
- (BOOL)isCurrentMediaMovie;
- (BOOL)isCurrentMediaTVShow;
- (BOOL)isPlayerTabsEnabled;
- (BOOL)shouldShowMoreInfoButton;
- (BOOL)shouldShowPlayFromBeginningButtonForMediaInfo;
- (NSDate)lastRequestDate;
- (NSDictionary)infoTabImpressions;
- (NSMutableDictionary)hudViewControllers;
- (NSString)moreInfoTitle;
- (NSString)playTitleForFromBeginningAction;
- (UIImage)playImageForFromBeginningAction;
- (VUIPlaybackTabInfo)tabsInfo;
- (VUIPlaybackTabManager)init;
- (VUIPlaybackTabManagerDelegate)delegate;
- (double)playbackFromBeginningTimeOffset;
- (id)_createHudContentViewControllerWithTabId:(id)a3 title:(id)a4 excludingCanonicals:(id)a5 isMultiview:(BOOL)a6 locale:(id)a7 playsFromStart:(BOOL)a8;
- (id)_createPrefetchedDataForPlayerHUDWithTabId:(id)a3 title:(id)a4 excludingCanonicals:(id)a5 isMultiview:(BOOL)a6 locale:(id)a7 playsFromStart:(BOOL)a8;
- (id)_documentRefContextDataForCurrentMediaTypeWithCanonicalID:(id)a3 showCanonicalID:(id)a4;
- (id)_getPageIDForTabName:(id)a3;
- (id)appContext;
- (id)createClickMetricsWithType:(id)a3;
- (id)createHUDViewControllerWithTabInfo:(id)a3 excludingCanonicals:(id)a4 isMultiview:(BOOL)a5 locale:(id)a6 playsFromStart:(BOOL)a7;
- (id)getPageEventDataWithSelectedTab:(id)a3;
- (id)moreInfoViewControllerWithAppContext:(id)a3;
- (int64_t)playbackTabError;
- (void)_addMetadataInfoToEvent:(id)a3;
- (void)_getTabsForCanonicalId:(id)a3 adamId:(id)a4 playablePassThrough:(id)a5 programId:(id)a6 contentId:(id)a7 completion:(id)a8;
- (void)_handleDidShowInfoViewController:(id)a3;
- (void)_updateHUDsForAVPlayerViewController:(id)a3 canonicalId:(id)a4 tabInfo:(id)a5 excludingCanonicals:(id)a6;
- (void)_updateTimedMetadataEligibilityFlagInCurrentMediaItem;
- (void)createImpressionsForInfoTab;
- (void)recordImpressionsForInfoTab;
- (void)recordPageHandler;
- (void)recordPageMetricsForInfoTab;
- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4;
- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4 pageID:(id)a5;
- (void)reportMoreInfoMetrics;
- (void)reportPlayFromBeginningMetrics;
- (void)resetPlayerTabsForPlayerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHudViewControllers:(id)a3;
- (void)setInfoTabImpressions:(id)a3;
- (void)setLastRequestDate:(id)a3;
- (void)setPlaybackTabError:(int64_t)a3;
- (void)setTabsInfo:(id)a3;
- (void)updatePlayerTabsExcludingCanonicals:(id)a3 completion:(id)a4;
- (void)updatePlayerViewSize:(CGSize)a3;
- (void)updatePrefetchedDataOnExistingHUDContentViewController:(id)a3 canonicalId:(id)a4 excludingCanonicals:(id)a5;
@end

@implementation VUIPlaybackTabManager

- (void)recordPageHandler
{
  [(VUIPlaybackTabManager *)self recordPageMetricsForInfoTab];
  [(VUIPlaybackTabManager *)self createImpressionsForInfoTab];
}

- (void)_handleDidShowInfoViewController:(id)a3
{
  v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4F166E8]];

  v5 = v10;
  if (v10 == (id)*MEMORY[0x1E4F16700])
  {
    v6 = +[VUIInterfaceFactory sharedInstance];
    v7 = [v6 playbackMetricsQueueManager];
    [v7 recordPage:self];

    v8 = +[VUIInterfaceFactory sharedInstance];
    v9 = [v8 playbackMetricsQueueManager];
    [v9 recordImpressions:self];

    v5 = v10;
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VUIPlaybackTabManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1) {
    dispatch_once(&sharedInstance_onceToken_20, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_7;
  return v2;
}

void __39__VUIPlaybackTabManager_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.tv.TimedMetadata", "VUIPlaybackTabManager");
  v3 = (void *)sTimedMetadataLogObject;
  sTimedMetadataLogObject = (uint64_t)v2;

  id v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = (uint64_t)v4;
}

- (VUIPlaybackTabManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)VUIPlaybackTabManager;
  os_log_t v2 = [(VUIPlaybackTabManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    hudViewControllers = v2->_hudViewControllers;
    v2->_hudViewControllers = (NSMutableDictionary *)v3;

    v2->_playbackTabError = 0;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleDidShowInfoViewController_ name:*MEMORY[0x1E4F166F0] object:0];
  }
  return v2;
}

- (BOOL)isPlayerTabsEnabled
{
  return 1;
}

- (void)updatePlayerTabsExcludingCanonicals:(id)a3 completion:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  v6 = (void (**)(void))a4;
  objc_super v7 = [(VUIPlaybackTabManager *)self delegate];
  v8 = [v7 currentMediaItem];

  *((void *)&v57 + 1) = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  *(void *)&long long v57 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  v9 = [v8 mediaItemMetadataForProperty:@"VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"];
  int v10 = [v9 BOOLValue];

  v11 = [v8 mediaItemMetadataForProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];
  v12 = v11;
  if (v11) {
    int v13 = [v11 BOOLValue];
  }
  else {
    int v13 = 1;
  }
  v55 = [v8 mediaItemMetadataForProperty:@"VUIMediaItemMetadataPlayablePassThrough"];
  v54 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F30]];
  v53 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA008]];
  v14 = [v8 mediaItemMetadataForProperty:@"VUIMediaItemMetadataIsEligibleForInfoTab"];
  v15 = v14;
  if (v14) {
    uint64_t v16 = [v14 BOOLValue];
  }
  else {
    uint64_t v16 = 1;
  }
  v17 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  char v18 = [v17 isNetworkReachable];

  if (v18)
  {
    if (v10)
    {
      v19 = [(VUIPlaybackTabManager *)self lastRequestDate];
      if (v19)
      {
        v20 = [(VUIPlaybackTabManager *)self lastRequestDate];
        [v20 timeIntervalSinceNow];
        double v22 = fabs(v21);

        if (v22 < 1.0)
        {
          v23 = VUIDefaultLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Not fetching tabs since we just fetched them a moment ago", buf, 2u);
          }

          if (v6) {
            v6[2](v6);
          }
          goto LABEL_54;
        }
      }
    }
    v28 = [MEMORY[0x1E4F1C9C8] date];
    [(VUIPlaybackTabManager *)self setLastRequestDate:v28];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke;
    aBlock[3] = &unk_1E6DF9760;
    v49 = v6;
    v68 = v49;
    v51 = (void (**)(void *, id, __CFString *))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    if (v13)
    {
      if (v57 != 0)
      {
        v50 = [(VUIPlaybackTabManager *)self delegate];
        id val = [v50 playerViewController];
        if (*((void *)&v57 + 1))
        {
          v29 = [(VUIPlaybackTabManager *)self tabsInfo];
          if (v29)
          {
            v30 = [(VUIPlaybackTabManager *)self tabsInfo];
            v31 = [v30 canonicalId];
            int v47 = [v31 isEqualToString:*((void *)&v57 + 1)];

            if (((v47 ^ 1 | v10) & 1) == 0)
            {
LABEL_47:
              v38 = [(VUIPlaybackTabManager *)self tabsInfo];
              int v39 = [v38 isInfoTabAllowed];

              v40 = VUIDefaultLogObject();
              uint64_t v41 = v39 & v16;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v42 = @"NO";
                if (v41) {
                  v42 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                v70 = v42;
                _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because we already have tabs setAllowInfoTab:%@", buf, 0xCu);
              }

              objc_msgSend(val, "vui_setAllowInfoMetadataSubpanel:", v41);
              v43 = [(VUIPlaybackTabManager *)self tabsInfo];
              v44 = [v43 canonicalId];
              v45 = [(VUIPlaybackTabManager *)self tabsInfo];
              v46 = [v45 tabDetails];
              [(VUIPlaybackTabManager *)self _updateHUDsForAVPlayerViewController:val canonicalId:v44 tabInfo:v46 excludingCanonicals:v56];

              [(VUIPlaybackTabManager *)self _updateTimedMetadataEligibilityFlagInCurrentMediaItem];
              if (!v49) {
                goto LABEL_53;
              }
              goto LABEL_52;
            }
          }
        }
        else
        {
          if (!(void)v57) {
            goto LABEL_47;
          }
          v35 = [(VUIPlaybackTabManager *)self tabsInfo];
          if (v35 || [(VUIPlaybackTabManager *)self playbackTabError] == 2)
          {
            v36 = [(VUIPlaybackTabManager *)self tabsInfo];
            v37 = [v36 adamId];
            char v48 = [v37 isEqualToString:(void)v57];

            if (v48)
            {
              if ([(VUIPlaybackTabManager *)self playbackTabError] == 2)
              {
                v51[2](v51, val, @"VUIPlaybackTabManager:: not fetching tabs as canonical id is missing and we couldn't resolve it using current adam id");
LABEL_53:

                objc_destroyWeak(&location);
                goto LABEL_54;
              }
              goto LABEL_47;
            }
          }
        }
        if ((v10 & 1) == 0) {
          [(VUIPlaybackTabManager *)self resetPlayerTabsForPlayerViewController:val];
        }
        objc_initWeak((id *)buf, val);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke_150;
        v58[3] = &unk_1E6DF9788;
        objc_copyWeak(&v63, &location);
        objc_copyWeak(&v64, (id *)buf);
        id v59 = *((id *)&v57 + 1);
        v61 = v51;
        char v65 = v16;
        v62 = v49;
        id v60 = v56;
        [(VUIPlaybackTabManager *)self _getTabsForCanonicalId:v59 adamId:(void)v57 playablePassThrough:v55 programId:v54 contentId:v53 completion:v58];

        objc_destroyWeak(&v64);
        objc_destroyWeak(&v63);
        objc_destroyWeak((id *)buf);
        goto LABEL_53;
      }
      v50 = [(VUIPlaybackTabManager *)self delegate];
      id val = [v50 playerViewController];
      [(VUIPlaybackTabManager *)self resetPlayerTabsForPlayerViewController:val];
      v33 = VUIDefaultLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = @"NO";
        if (v16) {
          v34 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v70 = v34;
        _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because canonical id is missing setAllowInfoTab:%@", buf, 0xCu);
      }

      objc_msgSend(val, "vui_setAllowInfoMetadataSubpanel:", v16);
      if (!v49) {
        goto LABEL_53;
      }
    }
    else
    {
      v50 = [(VUIPlaybackTabManager *)self delegate];
      id val = [v50 playerViewController];
      v32 = VUIDefaultLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because content is not eligible setAllowInfoMetadataSubpanel:NO", buf, 2u);
      }

      objc_msgSend(val, "vui_setAllowInfoMetadataSubpanel:", 0);
      [(VUIPlaybackTabManager *)self resetPlayerTabsForPlayerViewController:val];
      if (!v49) {
        goto LABEL_53;
      }
    }
LABEL_52:
    v49[2]();
    goto LABEL_53;
  }
  v24 = VUIDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = @"NO";
    if (v16) {
      v25 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v70 = v25;
    _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Network is not reachable, not fetching tabs setAllowInfoMetadataSubpanel:%@", buf, 0xCu);
  }

  v26 = [(VUIPlaybackTabManager *)self delegate];
  v27 = [v26 playerViewController];
  objc_msgSend(v27, "vui_setAllowInfoMetadataSubpanel:", v16);
  if (v6) {
    v6[2](v6);
  }

LABEL_54:
}

uint64_t __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Coudn't fetch tabs, returning early setting setAllowInfoMetadataSubpanel:NO", v6, 2u);
  }

  objc_msgSend(v3, "vui_setAllowInfoMetadataSubpanel:", 0);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke_150(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    int v10 = *(__CFString **)(a1 + 32);
    v11 = [v5 tabDetails];
    uint64_t v12 = [v11 count];
    int v13 = [v5 isInfoTabAllowed];
    [v5 focusedTabIdOnFirstDisplay];
    uint64_t v44 = a1;
    v15 = id v14 = v5;
    *(_DWORD *)buf = 138413314;
    v46 = v10;
    id v7 = v9;
    __int16 v47 = 2048;
    uint64_t v48 = v12;
    __int16 v49 = 1024;
    *(_DWORD *)v50 = v13;
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v15;
    __int16 v51 = 2048;
    uint64_t v52 = a3;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Fetched tabs: %@, count = %lu, isInfoTabAllowed: %d, focusedTabIdOnFirstDisplay: %@, error: %ld", buf, 0x30u);

    id v5 = v14;
    a1 = v44;
  }
  [WeakRetained setPlaybackTabError:a3];
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v16 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    char v17 = [v16 isNetworkReachable];

    if ((v17 & 1) == 0)
    {
      char v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(a1 + 80)) {
          v19 = @"YES";
        }
        else {
          v19 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Network is not reachable setAllowInfoMetadataSubpanel:%@", buf, 0xCu);
      }

      objc_msgSend(v7, "vui_setAllowInfoMetadataSubpanel:", *(unsigned __int8 *)(a1 + 80));
    }
    goto LABEL_39;
  }
  v20 = *(void **)(a1 + 32);
  if (v20)
  {
    double v21 = [v5 canonicalId];
    char v22 = [v20 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_39;
    }
  }
  v23 = [WeakRetained delegate];
  v24 = [v23 currentMediaItem];

  v25 = [v24 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  if (v25)
  {
    v26 = [v5 adamId];
    char v27 = [v25 isEqualToString:v26];

    if ((v27 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_39;
    }
  }

  v28 = [WeakRetained tabsInfo];
  if (([v5 isEqual:v28] & 1) == 0)
  {

    goto LABEL_22;
  }
  v29 = [v7 customInfoViewControllers];
  uint64_t v30 = [v29 count];
  v31 = [v5 tabDetails];
  uint64_t v32 = [v31 count];

  if (v30 != v32)
  {
LABEL_22:
    int v34 = [v5 isInfoTabAllowed];
    if (v34) {
      BOOL v35 = *(unsigned char *)(a1 + 80) != 0;
    }
    else {
      BOOL v35 = 0;
    }
    v36 = VUIDefaultLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = @"NO";
      if (v35) {
        v38 = @"YES";
      }
      else {
        v38 = @"NO";
      }
      int v39 = *(unsigned __int8 *)(a1 + 80);
      if (v34) {
        v40 = @"YES";
      }
      else {
        v40 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v46 = v38;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v40;
      if (v39) {
        v37 = @"YES";
      }
      __int16 v49 = 2112;
      *(void *)v50 = v37;
      _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: using tabs from UTS response setAllowInfoMetadataSubpanel: %@ isInfoTabAllowed = %@, isContentEligibleForInfoTab = %@", buf, 0x20u);
    }

    [WeakRetained setTabsInfo:v5];
    objc_msgSend(v7, "vui_setAllowInfoMetadataSubpanel:", v35);
    uint64_t v41 = [v5 canonicalId];
    v42 = [v5 tabDetails];
    [WeakRetained _updateHUDsForAVPlayerViewController:v7 canonicalId:v41 tabInfo:v42 excludingCanonicals:*(void *)(a1 + 40)];

    [WeakRetained _updateTimedMetadataEligibilityFlagInCurrentMediaItem];
    goto LABEL_37;
  }
  [WeakRetained _updateTimedMetadataEligibilityFlagInCurrentMediaItem];
  v33 = VUIDefaultLogObject();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not updating tabs because the new ones match the existing ones", buf, 2u);
  }

LABEL_37:
  uint64_t v43 = *(void *)(a1 + 56);
  if (v43) {
    (*(void (**)(void))(v43 + 16))();
  }
LABEL_39:
}

- (id)createHUDViewControllerWithTabInfo:(id)a3 excludingCanonicals:(id)a4 isMultiview:(BOOL)a5 locale:(id)a6 playsFromStart:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a4;
  v15 = [v12 tabId];
  uint64_t v16 = [v12 title];
  char v17 = [(VUIPlaybackTabManager *)self _createHudContentViewControllerWithTabId:v15 title:v16 excludingCanonicals:v14 isMultiview:v9 locale:v13 playsFromStart:v7];

  if (v17 && v15)
  {
    char v18 = objc_alloc_init(VUIHUDViewController);
    [(VUIHUDViewController *)v18 setTitle:v16];
    [(VUIHUDViewController *)v18 setHudContentViewController:v17];
    v19 = [v12 tabId];
    [(VUIHUDViewController *)v18 setTabIdentifier:v19];

    [(VUIHUDViewController *)v18 setIsMultiview:v9];
    v20 = [(VUIPlaybackTabManager *)self hudViewControllers];
    [v20 setObject:v18 forKey:v15];
  }
  else
  {
    double v21 = VUIDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Failed to create hud content view controller", v23, 2u);
    }

    char v18 = 0;
  }

  return v18;
}

- (void)resetPlayerTabsForPlayerViewController:(id)a3
{
  id v4 = a3;
  [(VUIPlaybackTabManager *)self setTabsInfo:0];
  [(VUIPlaybackTabManager *)self setLastRequestDate:0];
  id v5 = [(VUIPlaybackTabManager *)self hudViewControllers];
  [v5 removeAllObjects];

  [v4 setCustomInfoViewControllers:MEMORY[0x1E4F1CBF0]];
  [(VUIPlaybackTabManager *)self setPlaybackTabError:0];
  id v7 = +[VUIInterfaceFactory sharedInstance];
  v6 = [v7 playbackMetricsQueueManager];
  [v6 clearQueue];
}

- (void)updatePlayerViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(VUIPlaybackTabManager *)self hudViewControllers];
  id v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = [(VUIPlaybackTabManager *)self hudViewControllers];
        id v14 = [v13 objectForKey:v12];

        objc_msgSend(v14, "setPlayerViewSize:", width, height);
        v15 = [v14 hudContentViewController];
        objc_msgSend(v15, "setPlayerViewSize:", width, height);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_getTabsForCanonicalId:(id)a3 adamId:(id)a4 playablePassThrough:(id)a5 programId:(id)a6 contentId:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [(VUIPlaybackTabManager *)self appContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke;
  v27[3] = &unk_1E6DF97B0;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  [v20 evaluate:v27];
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke(uint64_t a1, void *a2)
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"PlayerTabsInterface"];
  id v4 = [v3 objectForKeyedSubscript:@"getPlayerTabsItemWithParams"];
  char v5 = [v4 isUndefined];

  if (v5)
  {
    v6 = [v3 objectForKeyedSubscript:@"getPlayerTabsItemWithPlayablePassThrough"];
    char v7 = [v6 isUndefined];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = v8;
      if (!v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      }
      v44[0] = v9;
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = v10;
      if (!v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      }
      v44[1] = v11;
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3_181;
      v38 = &unk_1E6DF5FB8;
      id v39 = *(id *)(a1 + 72);
      uint64_t v12 = _Block_copy(&v35);
      v44[2] = v12;
      id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 3, v35, v36, v37, v38);
      id v14 = (id)[v3 invokeMethod:@"getPlayerTabsItem" withArguments:v13];

      if (v10)
      {
        if (v8)
        {
LABEL_9:
          id v15 = v39;
          goto LABEL_31;
        }
      }
      else
      {

        if (v8) {
          goto LABEL_9;
        }
      }

      goto LABEL_9;
    }
    id v26 = *(void **)(a1 + 32);
    char v27 = v26;
    if (!v26)
    {
      char v27 = [MEMORY[0x1E4F1CA98] null];
    }
    v45[0] = v27;
    id v28 = *(void **)(a1 + 40);
    id v29 = v28;
    if (!v28)
    {
      id v29 = [MEMORY[0x1E4F1CA98] null];
    }
    v45[1] = v29;
    id v30 = *(void **)(a1 + 48);
    id v31 = v30;
    if (!v30)
    {
      id v31 = [MEMORY[0x1E4F1CA98] null];
    }
    v45[2] = v31;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3;
    v40[3] = &unk_1E6DF5FB8;
    id v41 = *(id *)(a1 + 72);
    id v32 = _Block_copy(v40);
    v45[3] = v32;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    id v34 = (id)[v3 invokeMethod:@"getPlayerTabsItemWithPlayablePassThrough" withArguments:v33];

    if (v30)
    {
      if (v28) {
        goto LABEL_29;
      }
    }
    else
    {

      if (v28)
      {
LABEL_29:
        if (v26)
        {
LABEL_30:
          id v15 = v41;
          goto LABEL_31;
        }
LABEL_36:

        goto LABEL_30;
      }
    }

    if (v26) {
      goto LABEL_30;
    }
    goto LABEL_36;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = v16;
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    [v16 setObject:v17 forKeyedSubscript:@"canonicalId"];
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    [v15 setObject:v18 forKeyedSubscript:@"adamId"];
  }
  uint64_t v19 = *(void *)(a1 + 48);
  if (v19) {
    [v15 setObject:v19 forKeyedSubscript:@"playablePassThrough"];
  }
  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    [v15 setObject:v20 forKeyedSubscript:@"programId"];
  }
  uint64_t v21 = *(void *)(a1 + 64);
  if (v21) {
    [v15 setObject:v21 forKeyedSubscript:@"contentId"];
  }
  id v22 = (void *)[v15 copy];
  v46[0] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2;
  aBlock[3] = &unk_1E6DF5FB8;
  id v43 = *(id *)(a1 + 72);
  id v23 = _Block_copy(aBlock);
  v46[1] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  id v25 = (id)[v3 invokeMethod:@"getPlayerTabsItemWithParams" withArguments:v24];

LABEL_31:
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "vui_stringForKey:", @"error");
  if (v4)
  {
    char v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if ([v4 isEqualToString:@"PlaybackTabErrorNoCanonicalOrAdamId"]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_174;
    block[3] = &unk_1E6DF4788;
    id v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    uint64_t v16 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    char v7 = v15;
  }
  else
  {
    uint64_t v8 = [[VUIPlaybackTabInfo alloc] initWithDictionary:v3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_175;
    v10[3] = &unk_1E6DF8D70;
    id v9 = *(id *)(a1 + 32);
    uint64_t v11 = v8;
    id v12 = v9;
    uint64_t v13 = 0;
    char v7 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_174(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_175(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "vui_stringForKey:", @"error");
  if (v4)
  {
    char v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if ([v4 isEqualToString:@"PlaybackTabErrorNoCanonicalOrAdamId"]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_179;
    block[3] = &unk_1E6DF4788;
    id v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    uint64_t v16 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    char v7 = v15;
  }
  else
  {
    uint64_t v8 = [[VUIPlaybackTabInfo alloc] initWithDictionary:v3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_180;
    v10[3] = &unk_1E6DF8D70;
    id v9 = *(id *)(a1 + 32);
    uint64_t v11 = v8;
    id v12 = v9;
    uint64_t v13 = 0;
    char v7 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_180(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3_181(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "vui_stringForKey:", @"error");
  if (v4)
  {
    char v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if ([v4 isEqualToString:@"PlaybackTabErrorNoCanonicalOrAdamId"]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_182;
    block[3] = &unk_1E6DF4788;
    id v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    uint64_t v16 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    char v7 = v15;
  }
  else
  {
    uint64_t v8 = [[VUIPlaybackTabInfo alloc] initWithDictionary:v3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_183;
    v10[3] = &unk_1E6DF8D70;
    id v9 = *(id *)(a1 + 32);
    uint64_t v11 = v8;
    id v12 = v9;
    uint64_t v13 = 0;
    char v7 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_182(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_183(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)_updateHUDsForAVPlayerViewController:(id)a3 canonicalId:(id)a4 tabInfo:(id)a5 excludingCanonicals:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v41 = a4;
  id v11 = a5;
  id v44 = a6;
  id v43 = [(VUIPlaybackTabManager *)self delegate];
  if ([v11 count])
  {
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v38 = v11;
    id obj = v11;
    uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (!v46) {
      goto LABEL_24;
    }
    uint64_t v45 = *(void *)v48;
    id v39 = v10;
    while (1)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v14 = [v13 tabId];
        id v15 = [(VUIPlaybackTabManager *)self hudViewControllers];
        uint64_t v16 = [v15 objectForKey:v14];

        if (v16)
        {
          uint64_t v17 = [v16 hudContentViewController];
          [(VUIPlaybackTabManager *)self updatePrefetchedDataOnExistingHUDContentViewController:v17 canonicalId:v41 excludingCanonicals:v44];
        }
        else
        {
          uint64_t v18 = [v43 currentMediaItem];
          uint64_t v19 = [v18 mediaItemMetadataForProperty:@"VUIContentMetadataBroadcastLocale"];
          uint64_t v20 = [v18 mediaItemMetadataForProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];
          uint64_t v21 = [v20 BOOLValue];

          if ([v14 containsString:@"uts.col.PlayerTabKeyPlays"]
            && (+[VUIInterfaceFactory sharedInstance],
                id v22 = objc_claimAutoreleasedReturnValue(),
                [v22 groupActivitiesManager],
                id v23 = objc_claimAutoreleasedReturnValue(),
                char v24 = [v23 isSessionActive],
                v23,
                v22,
                (v24 & 1) != 0))
          {
            uint64_t v16 = 0;
          }
          else
          {
            uint64_t v16 = [(VUIPlaybackTabManager *)self createHUDViewControllerWithTabInfo:v13 excludingCanonicals:v44 isMultiview:0 locale:v19 playsFromStart:v21];
          }
          id v10 = v39;
          id v25 = [v39 view];
          [v25 bounds];
          objc_msgSend(v16, "setPlayerViewSize:", v26, v27);

          if (!v16) {
            goto LABEL_22;
          }
        }
        id v28 = [v16 hudContentViewController];
        if ([v28 conformsToProtocol:&unk_1F401FB10])
        {
          id v29 = v28;
          id v30 = [v43 nowPlayingControllerDelegate];
          [v29 setNowPlayingTabDelegate:v30];
        }
        id v31 = [v16 title];
        uint64_t v32 = [v31 length];

        if (!v32)
        {
          id v33 = [v13 title];
          [v16 setTitle:v33];
        }
        if (![v14 containsString:@"uts.col.PlayerTabKeyPlays"]
          || (+[VUIInterfaceFactory sharedInstance],
              id v34 = objc_claimAutoreleasedReturnValue(),
              [v34 groupActivitiesManager],
              uint64_t v35 = objc_claimAutoreleasedReturnValue(),
              char v36 = [v35 isSessionActive],
              v35,
              v34,
              (v36 & 1) == 0))
        {
          [v42 addObject:v16];
        }

LABEL_22:
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (!v46)
      {
LABEL_24:

        if ([v42 count]) {
          [v10 setCustomInfoViewControllers:v42];
        }

        id v11 = v38;
        goto LABEL_30;
      }
    }
  }
  v37 = VUIDefaultLogObject();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::No tabs are received, reset existing tabs if available and return early", buf, 2u);
  }

  [(VUIPlaybackTabManager *)self resetPlayerTabsForPlayerViewController:v10];
LABEL_30:
}

- (id)_createHudContentViewControllerWithTabId:(id)a3 title:(id)a4 excludingCanonicals:(id)a5 isMultiview:(BOOL)a6 locale:(id)a7 playsFromStart:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = [(VUIPlaybackTabManager *)self delegate];
  uint64_t v19 = objc_opt_new();
  if ([v14 isEqualToString:@"uts.marker.Spotlight"])
  {
    uint64_t v20 = v16;
    uint64_t v21 = VUIDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Creating timed metadata controller", buf, 2u);
    }

    id v22 = [[VUIDocumentDataSource alloc] initWithDocumentRef:@"TimedMetadata"];
    id v23 = +[VUIInterfaceFactory sharedInstance];
    char v24 = [(VUIPlaybackTabManager *)self appContext];
    id v25 = [(VUIDocumentDataSource *)v23 viewControllerWithDocumentDataSource:v22 appContext:v24];
  }
  else
  {
    id v41 = v15;
    uint64_t v20 = v16;
    id v22 = [(VUIPlaybackTabManager *)self _createPrefetchedDataForPlayerHUDWithTabId:v14 title:v15 excludingCanonicals:v16 isMultiview:v10 locale:v17 playsFromStart:v8];
    uint64_t v26 = [(VUIDocumentDataSource *)v22 jsonData];

    double v27 = VUIDefaultLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(VUIDocumentDataSource *)v22 jsonData];
      *(_DWORD *)buf = 138412290;
      id v43 = v28;
      _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Creating hud content controller with data: [%@]", buf, 0xCu);
    }
    id v23 = [[VUIDocumentDataSource alloc] initWithDocumentRef:@"PlayerHUD"];
    char v24 = [(VUIPlaybackTabManager *)self appContext];
    [(VUIDocumentDataSource *)v23 setDocumentType:@"player"];
    [(VUIDocumentDataSource *)v23 setControllerRef:@"PlayerHUD"];
    [(VUIDocumentDataSource *)v23 setPrefetchData:v22];
    id v29 = +[VUIInterfaceFactory sharedInstance];
    id v25 = [v29 viewControllerWithDocumentDataSource:v23 appContext:v24];

    uint64_t v19 = (void *)v26;
    id v15 = v41;
  }

  if ([v25 conformsToProtocol:&unk_1F401FB10])
  {
    id v30 = v17;
    id v31 = v25;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v32 = [v18 nowPlayingControllerDelegate];
      [v31 setNowPlayingTabDelegate:v32];
    }
    id v33 = v15;
    if (objc_opt_respondsToSelector()) {
      [v31 setNowPlayingTabContextData:v19];
    }
    id v34 = [v18 playerViewController];
    uint64_t v35 = [v34 view];
    [v35 bounds];
    double v37 = v36;
    double v39 = v38;

    objc_msgSend(v31, "setPlayerViewSize:", v37, v39);
    id v15 = v33;
    id v17 = v30;
  }

  return v25;
}

- (id)_createPrefetchedDataForPlayerHUDWithTabId:(id)a3 title:(id)a4 excludingCanonicals:(id)a5 isMultiview:(BOOL)a6 locale:(id)a7 playsFromStart:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(VUIPlaybackTabManager *)self delegate];
  uint64_t v19 = objc_opt_new();
  [v19 setTabId:v17];

  uint64_t v20 = [(VUIPlaybackTabManager *)self tabsInfo];
  uint64_t v21 = [v20 canonicalId];

  if (v21) {
    [v19 setCanonicalId:v21];
  }
  if (v14) {
    [v19 setExcludedCanonicals:v14];
  }
  uint64_t v22 = [v18 multiviewPlayerCount];
  if (v22 == [v18 maxMultiviewPlayerCount])
  {
    [v19 setIncludeMultiviewButton:0];
  }
  else
  {
    id v23 = [(VUIPlaybackTabManager *)self tabsInfo];
    char v24 = [v23 multiviewTabInfo];
    [v19 setIncludeMultiviewButton:v24 != 0];
  }
  [v19 setIsMultiviewPlayer:v10];
  [v19 setPlayFromStart:v8];
  id v25 = [v18 multiviewIdentifiers];
  [v19 setMultiviewIdentifiers:v25];

  [v19 setLocale:v15];
  [v19 setTitle:v16];

  return v19;
}

- (void)updatePrefetchedDataOnExistingHUDContentViewController:(id)a3 canonicalId:(id)a4 excludingCanonicals:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(VUIPlaybackTabManager *)self delegate];
  if ([v20 conformsToProtocol:&unk_1F401FB10])
  {
    id v11 = v20;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v11 getNowPlayingTabContextData];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        id v14 = [[VUIDocumentPreFetchedDataPlayerHUD alloc] initWithDictionary:v12];
        [(VUIDocumentPreFetchedDataPlayerHUD *)v14 setExcludedCanonicals:v9];
        id v15 = [v10 multiviewIdentifiers];
        [(VUIDocumentPreFetchedDataPlayerHUD *)v14 setMultiviewIdentifiers:v15];

        if (v8) {
          [(VUIDocumentPreFetchedDataPlayerHUD *)v14 setCanonicalId:v8];
        }
        uint64_t v16 = [v10 multiviewPlayerCount];
        if (v16 == [v10 maxMultiviewPlayerCount])
        {
          [(VUIDocumentPreFetchedDataPlayerHUD *)v14 setIncludeMultiviewButton:0];
        }
        else
        {
          id v17 = [(VUIPlaybackTabManager *)self tabsInfo];
          uint64_t v18 = [v17 multiviewTabInfo];
          [(VUIDocumentPreFetchedDataPlayerHUD *)v14 setIncludeMultiviewButton:v18 != 0];
        }
        uint64_t v19 = [(VUIDocumentPreFetchedDataPlayerHUD *)v14 jsonData];
        if (objc_opt_respondsToSelector()) {
          [v11 setNowPlayingTabContextData:v19];
        }
      }
    }
  }
}

- (id)appContext
{
  os_log_t v2 = +[VUITVAppLauncher sharedInstance];
  id v3 = [v2 appController];
  id v4 = [v3 appContext];

  return v4;
}

- (NSString)playTitleForFromBeginningAction
{
  BOOL v2 = [(VUIPlaybackTabManager *)self _isCurrentMediaSportingEvent];
  id v3 = +[VUILocalizationManager sharedInstance];
  id v4 = v3;
  if (v2) {
    char v5 = @"WATCH_FROM_START";
  }
  else {
    char v5 = @"START_PLAYBACK_FROM_BEGINNING";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5];

  return (NSString *)v6;
}

- (UIImage)playImageForFromBeginningAction
{
  if ([(VUIPlaybackTabManager *)self _isCurrentMediaSportingEvent]) {
    BOOL v2 = @"arrow.counterclockwise";
  }
  else {
    BOOL v2 = @"play.fill";
  }
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:v2];
  return (UIImage *)v3;
}

- (void)recordPageMetricsForInfoTab
{
}

- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VUIPlaybackTabManager *)self _getPageIDForTabName:v6];
  [(VUIPlaybackTabManager *)self recordPageMetricsForSelectedTab:v7 tabName:v6 pageID:v8];
}

- (void)createImpressionsForInfoTab
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(VUIPlaybackTabManager *)self createClickMetricsWithType:@"play"];
  if (v4)
  {
    char v5 = +[VUIMetricsJetEngine convertClickDataToImpressionsData:v4 index:0 ignoreHosted:0];
    [v3 addObject:v5];

    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = [(VUIPlaybackTabManager *)self createClickMetricsWithType:@"navigate"];
  if (v7)
  {
    id v8 = +[VUIMetricsJetEngine convertClickDataToImpressionsData:v7 index:v6 ignoreHosted:0];
    [v3 addObject:v8];
  }
  if ([v3 count])
  {
    BOOL v10 = @"impressions";
    v11[0] = v3;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(VUIPlaybackTabManager *)self setInfoTabImpressions:v9];
  }
}

- (void)recordImpressionsForInfoTab
{
  id v3 = [(VUIPlaybackTabManager *)self infoTabImpressions];

  if (v3)
  {
    id v4 = +[VUIMetricsController sharedInstance];
    char v5 = [(VUIPlaybackTabManager *)self infoTabImpressions];
    [v4 recordImpressions:v5];

    [(VUIPlaybackTabManager *)self setInfoTabImpressions:0];
  }
}

- (id)getPageEventDataWithSelectedTab:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = @"pageContext";
  v12[0] = @"player";
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if ([v4 isEqualToString:*MEMORY[0x1E4F16700]])
  {
    uint64_t v6 = [(VUIPlaybackTabManager *)self delegate];
    id v7 = [v6 currentMediaItem];

    id v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
    id v9 = +[VUIMetricsPageEventData createWithPageId:v8 andPageType:@"Player" andEventData:v5];
  }
  else
  {
    id v7 = [(VUIPlaybackTabManager *)self _getPageIDForTabName:v4];
    if ([v7 length])
    {
      id v9 = +[VUIMetricsPageEventData createWithPageId:v7 andPageType:@"Player" andEventData:v5];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4 pageID:(id)a5
{
  -[VUIPlaybackTabManager getPageEventDataWithSelectedTab:](self, "getPageEventDataWithSelectedTab:", a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = +[VUIMetricsController sharedInstance];
  [v5 recordPage:v6];
}

- (id)_getPageIDForTabName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Continue Watching"])
  {
    id v4 = @"UpNext";
LABEL_9:
    char v5 = (void *)[(__CFString *)v4 copy];
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"Live Sports"])
  {
    id v4 = @"LiveSports";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"Key Plays"])
  {
    id v4 = @"keyPlays";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"InSight"])
  {
    id v4 = @"insight";
    goto LABEL_9;
  }
  char v5 = 0;
LABEL_10:

  return v5;
}

- (BOOL)_isCurrentMediaSportingEvent
{
  BOOL v2 = [(VUIPlaybackTabManager *)self delegate];
  id v3 = [v2 currentMediaItem];

  LOBYTE(v2) = [v3 hasTrait:VUIMediaItemTraitIsSportingEvent];
  return (char)v2;
}

- (BOOL)isCurrentMediaMovie
{
  BOOL v2 = [(VUIPlaybackTabManager *)self delegate];
  id v3 = [v2 currentMediaItem];

  id v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA1E8]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:*MEMORY[0x1E4FAA1F8]];
  }

  return v5;
}

- (BOOL)isCurrentMediaTVShow
{
  BOOL v2 = [(VUIPlaybackTabManager *)self delegate];
  id v3 = [v2 currentMediaItem];

  id v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4FAA200]];

  return v5;
}

- (BOOL)_isCurrentMediaLive
{
  BOOL v2 = [(VUIPlaybackTabManager *)self delegate];
  id v3 = [v2 currentMediaItem];

  LOBYTE(v2) = [v3 hasTrait:*MEMORY[0x1E4FAA180]];
  return (char)v2;
}

- (BOOL)_isInsightTabAvailable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id v3 = [(VUIPlaybackTabManager *)self tabsInfo];
  id v4 = [v3 tabDetails];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "tabId", (void)v14);
        char v11 = [v10 isEqualToString:@"uts.marker.Spotlight"];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)_updateTimedMetadataEligibilityFlagInCurrentMediaItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackTabManager *)self delegate];
  id v4 = [v3 currentMediaItem];

  BOOL v5 = [(VUIPlaybackTabManager *)self _isInsightTabAvailable];
  uint64_t v6 = sTimedMetadataLogObject;
  if (os_log_type_enabled((os_log_t)sTimedMetadataLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v5) {
      uint64_t v7 = @"YES";
    }
    int v9 = 138412546;
    BOOL v10 = v7;
    __int16 v11 = 2112;
    BOOL v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Setting isEligibleForTimedMetadata - %@ for title - %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  [v4 setMediaItemMetadata:v8 forProperty:@"isEligibleForTimedMetadata"];
}

- (BOOL)shouldShowMoreInfoButton
{
  id v3 = [(VUIPlaybackTabManager *)self delegate];
  id v4 = [v3 currentMediaItem];

  BOOL v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  uint64_t v6 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
  if (([(VUIPlaybackTabManager *)self isCurrentMediaMovie]
     || [(VUIPlaybackTabManager *)self _isCurrentMediaSportingEvent])
    && [v5 length])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = +[VUIPlaybackTabManager sharedInstance];
    if ([v8 isCurrentMediaTVShow]) {
      BOOL v7 = [v6 length] != 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)shouldShowPlayFromBeginningButtonForMediaInfo
{
  uint64_t v3 = [(VUIPlaybackTabManager *)self delegate];
  char v4 = [(id)v3 mediaSupportsStartOver];

  LOBYTE(v3) = [(VUIPlaybackTabManager *)self _isCurrentMediaSportingEvent];
  BOOL v5 = [(VUIPlaybackTabManager *)self _isCurrentMediaLive];
  return (v3 | v5) & v4 | (v3 | v5) ^ 1;
}

- (NSString)moreInfoTitle
{
  BOOL v2 = +[VUIPlaybackTabManager sharedInstance];
  int v3 = [v2 _isCurrentMediaSportingEvent];
  char v4 = +[VUILocalizationManager sharedInstance];
  BOOL v5 = v4;
  if (v3) {
    uint64_t v6 = @"MORE_INFO";
  }
  else {
    uint64_t v6 = @"DETAILS";
  }
  BOOL v7 = [v4 localizedStringForKey:v6];

  return (NSString *)v7;
}

- (id)_documentRefContextDataForCurrentMediaTypeWithCanonicalID:(id)a3 showCanonicalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VUIPlaybackTabManager *)self isCurrentMediaMovie]
    || [(VUIPlaybackTabManager *)self _isCurrentMediaSportingEvent])
  {
    if ([v6 length])
    {
      uint64_t v8 = [[VUIDocumentContextDataMovie alloc] initWithMovieID:v6];
LABEL_5:
      int v9 = v8;
      goto LABEL_10;
    }
  }
  else if (-[VUIPlaybackTabManager isCurrentMediaTVShow](self, "isCurrentMediaTVShow") && [v7 length])
  {
    uint64_t v8 = [[VUIDocumentContextDataTVShow alloc] initWithShowID:v7 episodeID:v6];
    goto LABEL_5;
  }
  int v9 = 0;
LABEL_10:

  return v9;
}

- (id)moreInfoViewControllerWithAppContext:(id)a3
{
  BOOL v5 = @"MovieCanonical";
  id v6 = a3;
  id v7 = [(VUIPlaybackTabManager *)self delegate];
  uint64_t v8 = [v7 currentMediaItem];

  int v9 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  BOOL v10 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
  __int16 v11 = +[VUIPlaybackTabManager sharedInstance];
  char v12 = [v11 _isCurrentMediaSportingEvent];

  if (v12)
  {
    uint64_t v13 = VUIDocumentRefSportsCanonical;
  }
  else
  {
    long long v14 = +[VUIPlaybackTabManager sharedInstance];
    int v15 = [v14 isCurrentMediaTVShow];

    if (!v15) {
      goto LABEL_6;
    }
    id v16 = v10;

    uint64_t v13 = VUIDocumentRefTVShowCanonical;
    int v9 = v16;
  }
  long long v17 = *v13;

  BOOL v5 = v17;
LABEL_6:
  uint64_t v18 = [[VUIDocumentDataSource alloc] initWithDocumentRef:v5];
  [(VUIDocumentDataSource *)v18 setDocumentType:@"canonical"];
  [(VUIDocumentDataSource *)v18 setControllerRef:v5];
  uint64_t v19 = objc_alloc_init(VUIDocumentUIConfiguration);
  [(VUIDocumentUIConfiguration *)v19 setViewControllerDocumentIdentifier:v9];
  [(VUIDocumentDataSource *)v18 setUiConfiguration:v19];
  id v20 = [(VUIPlaybackTabManager *)self _documentRefContextDataForCurrentMediaTypeWithCanonicalID:v9 showCanonicalID:v10];
  [(VUIDocumentDataSource *)v18 setContextData:v20];

  uint64_t v21 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v22 = [v21 viewControllerWithDocumentDataSource:v18 appContext:v6];

  return v22;
}

- (BOOL)_isInfoHUDButtonPresent:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"play"])
  {
    BOOL v5 = [(VUIPlaybackTabManager *)self shouldShowPlayFromBeginningButtonForMediaInfo];
  }
  else
  {
    if (![v4 isEqualToString:@"navigate"])
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    BOOL v5 = [(VUIPlaybackTabManager *)self shouldShowMoreInfoButton];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (id)createClickMetricsWithType:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(VUIPlaybackTabManager *)self _isInfoHUDButtonPresent:v4])
  {
    v9[0] = @"targetType";
    v9[1] = @"actionType";
    v10[0] = @"button";
    v10[1] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    BOOL v6 = (void *)[v5 mutableCopy];

    [(VUIPlaybackTabManager *)self _addMetadataInfoToEvent:v6];
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addMetadataInfoToEvent:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(VUIPlaybackTabManager *)self delegate];
  BOOL v6 = [v5 currentMediaItem];

  id v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
  if (v7) {
    [v4 setObject:v7 forKey:@"brandId"];
  }
  uint64_t v8 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  int v9 = v8;
  if (v8)
  {
    int v10 = [v8 isEqualToString:*MEMORY[0x1E4FAA200]];
    __int16 v11 = VUIMetricsMediaContentTypeEpisode;
    if (!v10) {
      __int16 v11 = VUIMetricsMediaContentTypeMovie;
    }
    [v4 setObject:*v11 forKey:@"contentType"];
  }
  char v12 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  if (v12) {
    [v4 setObject:v12 forKey:@"targetId"];
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"actionType"];
  if ([v13 length])
  {
    if ([v13 isEqualToString:@"play"])
    {
      uint64_t v14 = [(VUIPlaybackTabManager *)self playTitleForFromBeginningAction];
    }
    else
    {
      if (![v13 isEqualToString:@"navigate"])
      {
        int v15 = 0;
        goto LABEL_16;
      }
      uint64_t v14 = [(VUIPlaybackTabManager *)self moreInfoTitle];
    }
    int v15 = (void *)v14;
LABEL_16:
    if ([v15 length])
    {
      long long v17 = @"name";
      v18[0] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [v4 setObject:v16 forKey:@"actionDetails"];
    }
  }
}

- (void)reportPlayFromBeginningMetrics
{
  id v3 = [(VUIPlaybackTabManager *)self createClickMetricsWithType:@"play"];
  BOOL v2 = +[VUIMetricsController sharedInstance];
  [v2 recordClick:v3];
}

- (void)reportMoreInfoMetrics
{
  id v3 = [(VUIPlaybackTabManager *)self createClickMetricsWithType:@"navigate"];
  BOOL v2 = +[VUIMetricsController sharedInstance];
  [v2 recordClick:v3];
}

- (VUIPlaybackTabManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIPlaybackTabManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIPlaybackTabInfo)tabsInfo
{
  return self->_tabsInfo;
}

- (void)setTabsInfo:(id)a3
{
}

- (int64_t)playbackTabError
{
  return self->_playbackTabError;
}

- (void)setPlaybackTabError:(int64_t)a3
{
  self->_playbackTabError = a3;
}

- (double)playbackFromBeginningTimeOffset
{
  return self->_playbackFromBeginningTimeOffset;
}

- (NSMutableDictionary)hudViewControllers
{
  return self->_hudViewControllers;
}

- (void)setHudViewControllers:(id)a3
{
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
}

- (NSDictionary)infoTabImpressions
{
  return self->_infoTabImpressions;
}

- (void)setInfoTabImpressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoTabImpressions, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_hudViewControllers, 0);
  objc_storeStrong((id *)&self->_tabsInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end