@interface TPSAppController
+ (id)sharedInstance;
- (BOOL)alwaysShowIntro;
- (BOOL)appInBackground;
- (BOOL)contentHasLoaded;
- (BOOL)hasLocalVariant:(id)a3;
- (BOOL)isAccessoriesSection:(id)a3;
- (BOOL)isAppleWatchSection:(id)a3;
- (BOOL)isExploreHardwareSection:(id)a3;
- (BOOL)updatingContent;
- (NSArray)collectionSections;
- (NSArray)collections;
- (NSArray)tipCollections;
- (NSArray)tips;
- (NSArray)userGuides;
- (NSDictionary)collectionMap;
- (NSDictionary)collectionSectionMap;
- (NSDictionary)tipMap;
- (NSError)lastFetchError;
- (NSHashTable)delegates;
- (NSUUID)networkMonitorToken;
- (NSUserDefaults)appGroupDefaults;
- (TPSAppController)init;
- (TPSAssetSizes)assetSizes;
- (TPSCollection)checklistCollection;
- (TPSCollection)featuredCollection;
- (TPSCollection)savedTipsCollection;
- (TPSFullTipContentManager)fullTipContentManager;
- (TPSSavedTipsManager)savedTipsManager;
- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6;
- (id)collectionForIdentifier:(id)a3;
- (id)collectionIdentifierForTipIdentifier:(id)a3;
- (id)collectionSectionForIdentifier:(id)a3;
- (id)collectionStatusForCollection:(id)a3;
- (id)createSavedTipsCollection:(id)a3;
- (id)delegateEnumerator;
- (id)mainUserGuide;
- (id)tipForCorrelationIdentifier:(id)a3;
- (id)tipForIdentifier:(id)a3;
- (id)tipForIdentifier:(id)a3 includingCorrelation:(BOOL)a4;
- (id)tipForVariantIdentifier:(id)a3;
- (id)tipsForCollection:(id)a3;
- (id)tipsForCollectionIdentifier:(id)a3;
- (id)userGuideWithIdentifier:(id)a3;
- (void)addDelegate:(id)a3;
- (void)collectionIdentifierViewed:(id)a3;
- (void)contentForVariant:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4;
- (void)logInvalidSharedTipDisplayed:(id)a3;
- (void)logSharedTipDisplayed:(id)a3 isEligible:(BOOL)a4;
- (void)networkStateDidChange:(BOOL)a3;
- (void)reloadAppGroupDefaults;
- (void)removeAllContent;
- (void)removeDelegate:(id)a3;
- (void)removeNotificationForIdentifier:(id)a3;
- (void)setAlwaysShowIntro:(BOOL)a3;
- (void)setAppGroupDefaults:(id)a3;
- (void)setAppInBackground:(BOOL)a3;
- (void)setAssetSizes:(id)a3;
- (void)setChecklistCollection:(id)a3;
- (void)setCollectionMap:(id)a3;
- (void)setCollectionSectionMap:(id)a3;
- (void)setCollectionSections:(id)a3;
- (void)setCollections:(id)a3;
- (void)setContentHasLoaded:(BOOL)a3;
- (void)setDelegates:(id)a3;
- (void)setFeaturedCollection:(id)a3;
- (void)setFullTipContentManager:(id)a3;
- (void)setLastFetchError:(id)a3;
- (void)setNetworkMonitorToken:(id)a3;
- (void)setSavedTipsCollection:(id)a3;
- (void)setSavedTipsManager:(id)a3;
- (void)setTipMap:(id)a3;
- (void)setUpdatingContent:(BOOL)a3;
- (void)setUserGuides:(id)a3;
- (void)tipViewed:(id)a3 collectionIdentifier:(id)a4;
- (void)updateContent;
- (void)updateSavedTipsContent;
@end

@implementation TPSAppController

- (id)collectionForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"SavedTips"])
  {
    v5 = self->_savedTipsCollection;
  }
  else
  {
    v6 = [(TPSAppController *)self collectionMap];
    v5 = [v6 objectForKeyedSubscript:v4];
  }
  return v5;
}

- (NSDictionary)collectionMap
{
  return self->_collectionMap;
}

- (TPSCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (NSArray)collections
{
  return self->_collections;
}

- (id)tipsForCollectionIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqual:@"SavedTips"] & 1) == 0)
  {
    v23 = [(TPSAppController *)self collectionMap];
    v5 = [v23 objectForKeyedSubscript:v4];

    if (v5) {
      goto LABEL_3;
    }
LABEL_27:
    id v11 = 0;
    id v12 = 0;
    v7 = 0;
    goto LABEL_30;
  }
  v5 = [(TPSAppController *)self savedTipsCollection];
  if (!v5) {
    goto LABEL_27;
  }
LABEL_3:
  v6 = [v5 tipIdentifiers];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v26 = v5;
    id v27 = v4;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v16 = [(TPSAppController *)self tipMap];
        v17 = [v16 objectForKeyedSubscript:v15];

        if ([v17 isIntro])
        {
          if (!v12) {
            id v12 = v17;
          }
        }
        else if ([v17 isOutro])
        {
          if (!v11) {
            id v11 = v17;
          }
        }
        else if (v17)
        {
          [v7 addObject:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);

    id v4 = v27;
    if (v12)
    {
      v18 = +[TPSCommonDefines sharedInstance];
      v19 = [v18 collectionStatusForCollectionIdentifier:v27];

      uint64_t v20 = [v19 firstViewedDate];
      if (!v20
        || (v21 = (void *)v20, BOOL v22 = [(TPSAppController *)self alwaysShowIntro],
                               v21,
                               v22))
      {
        [v7 insertObject:v12 atIndex:0];
      }
    }
    if (v11) {
      [v7 addObject:v11];
    }
    v5 = v26;
  }
  else
  {

    id v11 = 0;
    id v12 = 0;
  }

LABEL_30:
  v24 = (void *)[v7 copy];

  return v24;
}

- (NSDictionary)tipMap
{
  return self->_tipMap;
}

void __42__TPSAppController_updateSavedTipsContent__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = +[TPSSavedTipsManager sharedInstance];
  v3 = [v2 identifiers];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__TPSAppController_updateSavedTipsContent__block_invoke_2;
  v20[3] = &unk_1E5906B90;
  v20[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_filter:", v20);

  uint64_t v5 = [v4 count];
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = [v6 savedTipsCollection];

    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v9 = [v8 savedTipsCollection];
      [v9 setTipIdentifiers:v4];
    }
    else
    {
      uint64_t v9 = [v8 createSavedTipsCollection:v4];
      [*(id *)(a1 + 32) setSavedTipsCollection:v9];
    }
  }
  else
  {
    [v6 setSavedTipsCollection:0];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "delegateEnumerator", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 appControllerUserUpdatedSavedTips:*(void *)(a1 + 32)];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
}

void __33__TPSAppController_updateContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setLastFetchError:v6];
  id v8 = &off_19C980000;
  if (!v6)
  {
    uint64_t v11 = +[TPSCommonDefines sharedInstance];
    uint64_t v10 = [v11 language];

    v40 = [v5 language];
    int v12 = objc_msgSend(v10, "isEqualToString:");
    uint64_t v13 = [v5 collectionMap];
    uint64_t v14 = [v5 tipMap];
    v39 = [v5 featuredCollection];
    v38 = [v5 orderedCollections];
    if (v12)
    {
      uint64_t v15 = [WeakRetained featuredCollection];
      if ([v39 isEqual:v15])
      {
        long long v16 = [WeakRetained collections];
        if ([v38 isEqualToArray:v16])
        {
          long long v17 = [WeakRetained tipMap];
          LODWORD(v37) = [v14 isEqualToDictionary:v17];

          long long v18 = +[TPSNetworkPathMonitor sharedMonitor];
          [v18 stop];

          id v8 = &off_19C980000;
          if (v37)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_14:
          uint64_t v20 = +[TPSLogger default];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19C8DC000, v20, OS_LOG_TYPE_DEFAULT, "Difference found with cache content, refreshing...", buf, 2u);
          }

          v21 = +[TPSAssetCacheController sharedInstance];
          [v21 setLanguageCode:v40];

          [*(id *)(a1 + 32) contentWillUpdate];
          uint64_t v22 = [v5 assetSizes];
          [WeakRetained setAssetSizes:v22];

          [WeakRetained setCollectionMap:v13];
          v23 = [v5 collectionSectionMap];
          [WeakRetained setCollectionSectionMap:v23];

          v37 = v14;
          [WeakRetained setTipMap:v14];
          v24 = +[TPSCommonDefines checklistCollectionIdentifier];
          v25 = [v13 objectForKeyedSubscript:v24];
          [WeakRetained setChecklistCollection:v25];

          [WeakRetained setFeaturedCollection:v39];
          [WeakRetained setCollections:v38];
          v26 = [v5 collectionSections];
          [WeakRetained setCollectionSections:v26];

          id v27 = [v5 userGuides];
          [WeakRetained setUserGuides:v27];

          if (+[TPSCommonDefines isInternalDevice])
          {
            long long v28 = [WeakRetained collectionSections];

            if (!v28)
            {
              long long v29 = [v5 orderedCollections];
              if ([v29 count])
              {
                long long v30 = [[TPSCollectionSection alloc] initWithIdentifier:@"Blank" text:&stru_1EED877F8 collections:v29];
                v50[0] = v30;
                long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
                [WeakRetained setCollectionSections:v31];

                id v8 = &off_19C980000;
              }
            }
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = *((void *)v8 + 56);
          block[2] = __33__TPSAppController_updateContent__block_invoke_23;
          block[3] = &unk_1E59073D0;
          id v43 = v13;
          id v32 = v40;
          uint64_t v34 = *(void *)(a1 + 32);
          uint64_t v33 = *(void *)(a1 + 40);
          id v44 = v32;
          uint64_t v45 = v34;
          id v46 = WeakRetained;
          uint64_t v47 = v33;
          dispatch_async(MEMORY[0x1E4F14428], block);
          [*(id *)(a1 + 32) updateSavedTipsContent];

          goto LABEL_22;
        }

        id v8 = &off_19C980000;
      }
    }
    long long v19 = +[TPSNetworkPathMonitor sharedMonitor];
    [v19 stop];

    goto LABEL_14;
  }
  uint64_t v9 = +[TPSLogger default];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v6;
    _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_DEFAULT, "Tips feed load failed with %@", buf, 0xCu);
  }

  if (+[TPSNetworkPathMonitor isNetworkError:v6])
  {
    uint64_t v10 = +[TPSNetworkPathMonitor sharedMonitor];
    [v10 start];
LABEL_23:
  }
  objc_msgSend(WeakRetained, "setUpdatingContent:", 0, v37);
  [WeakRetained setContentHasLoaded:1];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = *((void *)v8 + 56);
  v41[2] = __33__TPSAppController_updateContent__block_invoke_25;
  v41[3] = &unk_1E59073F8;
  uint64_t v36 = *(void *)(a1 + 32);
  uint64_t v35 = *(void *)(a1 + 40);
  v41[5] = WeakRetained;
  v41[6] = v35;
  v41[4] = v36;
  dispatch_async(MEMORY[0x1E4F14428], v41);
}

- (NSArray)collectionSections
{
  return self->_collectionSections;
}

- (void)updateSavedTipsContent
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TPSAppController_updateSavedTipsContent__block_invoke;
  block[3] = &unk_1E5906740;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setUserGuides:(id)a3
{
}

- (void)setTipMap:(id)a3
{
}

- (void)setSavedTipsCollection:(id)a3
{
}

- (void)setLastFetchError:(id)a3
{
}

- (void)setFeaturedCollection:(id)a3
{
}

- (void)setContentHasLoaded:(BOOL)a3
{
  self->_contentHasLoaded = a3;
}

- (void)setCollections:(id)a3
{
}

- (void)setCollectionSections:(id)a3
{
}

- (void)setCollectionSectionMap:(id)a3
{
}

- (void)setCollectionMap:(id)a3
{
}

- (void)setChecklistCollection:(id)a3
{
}

- (void)setAssetSizes:(id)a3
{
}

- (NSArray)tips
{
  v2 = [(TPSAppController *)self tipMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (TPSCollection)savedTipsCollection
{
  return self->_savedTipsCollection;
}

uint64_t __34__TPSAppController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TPSAppController);
  uint64_t v1 = sharedInstance_gTPSAppController;
  sharedInstance_gTPSAppController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __33__TPSAppController_updateContent__block_invoke_23(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [*(id *)(a1 + 32) allKeys];
  id v4 = [v2 setWithArray:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = +[TPSCommonDefines sharedInstance];
  [v6 setLanguage:v5];

  v7 = +[TPSCommonDefines sharedInstance];
  [v7 activatedCollections:v4];

  uint64_t v8 = [*(id *)(a1 + 48) delegateEnumerator];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "appControllerContentUpdated:", *(void *)(a1 + 56), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (TPSAppController)init
{
  v20.receiver = self;
  v20.super_class = (Class)TPSAppController;
  v2 = [(TPSAppController *)&v20 init];
  if (v2)
  {
    v3 = +[TPSCommonDefines sharedInstance];
    int v4 = [v3 tipsAccessAllowed];

    if (v4)
    {
      uint64_t v5 = objc_alloc_init(TPSFullTipContentManager);
      fullTipContentManager = v2->_fullTipContentManager;
      v2->_fullTipContentManager = v5;

      uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
      delegates = v2->_delegates;
      v2->_delegates = (NSHashTable *)v7;

      v2->_alwaysShowIntro = +[TPSDefaultsManager showCollectionIntro];
      objc_initWeak(&location, v2);
      uint64_t v9 = objc_opt_new();
      networkMonitorToken = v2->_networkMonitorToken;
      v2->_networkMonitorToken = (NSUUID *)v9;

      id v11 = +[TPSNetworkPathMonitor sharedMonitor];
      uint64_t v12 = v2->_networkMonitorToken;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      long long v16 = __24__TPSAppController_init__block_invoke;
      long long v17 = &unk_1E59073A8;
      objc_copyWeak(&v18, &location);
      [v11 addObserverForKey:v12 using:&v14];

      [(TPSAppController *)v2 reloadAppGroupDefaults];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)reloadAppGroupDefaults
{
  id v5 = +[TPSCommonDefines sharedInstance];
  v3 = [v5 reloadAppGroupDefaults];
  appGroupDefaults = self->_appGroupDefaults;
  self->_appGroupDefaults = v3;
}

- (NSArray)userGuides
{
  return self->_userGuides;
}

- (BOOL)contentHasLoaded
{
  return self->_contentHasLoaded;
}

- (TPSCollection)checklistCollection
{
  return self->_checklistCollection;
}

void __33__TPSAppController_updateContent__block_invoke_25(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegateEnumerator];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "appController:loadingContent:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "updatingContent", (void)v11));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)updateContent
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(TPSAppController *)self updatingContent])
  {
    [(TPSAppController *)self setUpdatingContent:1];
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = __Block_byref_object_copy__0;
    objc_super v20 = __Block_byref_object_dispose__0;
    id v21 = [(TPSAppController *)self delegateEnumerator];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = (id)v17[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "appController:loadingContent:", self, -[TPSAppController updatingContent](self, "updatingContent"));
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v22 count:16];
      }
      while (v4);
    }

    objc_initWeak(&location, self);
    uint64_t v8 = [(TPSAppController *)self fullTipContentManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__TPSAppController_updateContent__block_invoke;
    v9[3] = &unk_1E5907420;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    v9[5] = &v16;
    [v8 contentWithCompletionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);
  }
}

- (BOOL)updatingContent
{
  return self->_updatingContent;
}

- (void)setUpdatingContent:(BOOL)a3
{
  self->_updatingContent = a3;
}

- (TPSFullTipContentManager)fullTipContentManager
{
  return self->_fullTipContentManager;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppController *)self delegates];
  [v5 addObject:v4];
}

- (id)delegateEnumerator
{
  uint64_t v2 = [(TPSAppController *)self delegates];
  id v3 = [v2 allObjects];
  id v4 = [v3 reverseObjectEnumerator];

  return v4;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_2 != -1) {
    dispatch_once(&sharedInstance_predicate_2, &__block_literal_global_10);
  }
  uint64_t v2 = (void *)sharedInstance_gTPSAppController;
  return v2;
}

- (void)dealloc
{
  id v3 = [(TPSAppController *)self fullTipContentManager];
  [v3 invalidate];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id v4 = +[TPSNetworkPathMonitor sharedMonitor];
  id v5 = [(TPSAppController *)self networkMonitorToken];
  [v4 removeObserverForKey:v5];

  v6.receiver = self;
  v6.super_class = (Class)TPSAppController;
  [(TPSAppController *)&v6 dealloc];
}

void __24__TPSAppController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained networkStateDidChange:a2];
}

- (NSArray)tipCollections
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(TPSAppController *)self collections];
  id v5 = [v3 arrayWithArray:v4];

  objc_super v6 = [(TPSAppController *)self featuredCollection];

  if (v6)
  {
    uint64_t v7 = [(TPSAppController *)self featuredCollection];
    [v5 addObject:v7];
  }
  if ([v5 count]) {
    uint64_t v8 = (void *)[v5 copy];
  }
  else {
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppController *)self delegates];
  [v5 removeObject:v4];
}

- (id)tipsForCollection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 tipIdentifiers];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [(TPSAppController *)self tipMap];
        long long v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  id v6 = 0;
  if (a3 && a4)
  {
    id v10 = a6;
    id v11 = a4;
    id v12 = a3;
    id v6 = [[TPSAssetsConfiguration alloc] initWithAssets:v12 language:v11 userInterfaceStyle:a5 assetFileInfoManager:v10];
  }
  return v6;
}

- (void)removeAllContent
{
  [(TPSAppController *)self setCollectionMap:0];
  [(TPSAppController *)self setCollectionSectionMap:0];
  [(TPSAppController *)self setTipMap:0];
  [(TPSAppController *)self setChecklistCollection:0];
  [(TPSAppController *)self setFeaturedCollection:0];
  [(TPSAppController *)self setCollections:0];
  [(TPSAppController *)self setCollectionSections:0];
  [(TPSAppController *)self setUserGuides:0];
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TPSAppController *)self fullTipContentManager];
  [v8 contentForVariant:v7 completionHandler:v6];
}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TPSAppController *)self fullTipContentManager];
  [v8 fetchAssetsWithAssetsConfiguration:v7 completionHandler:v6];
}

- (id)mainUserGuide
{
  uint64_t v2 = [(TPSAppController *)self userGuides];
  id v3 = [v2 firstObject];

  return v3;
}

- (id)userGuideWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__0;
    long long v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    id v5 = [(TPSAppController *)self userGuides];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__TPSAppController_userGuideWithIdentifier___block_invoke;
    v8[3] = &unk_1E5907448;
    id v9 = v4;
    id v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __44__TPSAppController_userGuideWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 containsString:*(void *)(a1 + 32)];

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)collectionIdentifierForTipIdentifier:(id)a3
{
  id v3 = [(TPSAppController *)self tipForIdentifier:a3];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = +[TPSCommonDefines sharedInstance];
  id v5 = [v3 collectionIdentifiers];
  id v6 = [v4 collectionIdentifierToUseForCollectionIdentifiers:v5];

  if (!v6) {
LABEL_3:
  }
    id v6 = @"Unknown";

  return v6;
}

- (id)tipForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppController *)self tipMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)tipForIdentifier:(id)a3 includingCorrelation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TPSAppController *)self tipForIdentifier:v6];
  if (!v7 && v4)
  {
    id v7 = [(TPSAppController *)self tipForCorrelationIdentifier:v6];
  }

  return v7;
}

- (id)tipForCorrelationIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(TPSAppController *)self tipMap];
    id v6 = [v5 allValues];

    id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 correlationID];
          char v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tipForVariantIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(TPSAppController *)self tipMap];
  id v6 = [v5 allValues];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 variantID];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)collectionStatusForCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSCommonDefines sharedInstance];
  id v5 = [v3 identifier];

  id v6 = [v4 collectionStatusForCollectionIdentifier:v5];

  return v6;
}

- (id)createSavedTipsCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSCommonDefines tipsCoreFrameworkBundle];
  id v5 = [v4 localizedStringForKey:@"SAVED_COLLECTION_TITLE" value:0 table:0];
  id v6 = [v4 localizedStringForKey:@"SAVED_COLLECTION_TEXT" value:0 table:0];
  id v7 = objc_opt_new();
  uint64_t v8 = [[TPSMetadata alloc] initWithDictionary:v7];
  id v9 = [[TPSAssets alloc] initWithSymbolId:@"bookmark.fill" symbolColor:0 symbolSize:0 alt:0 gradientColorStrings:0];
  id v10 = [[TPSAssets alloc] initWithSymbolId:@"bookmark" symbolColor:0 symbolSize:0 alt:0 gradientColorStrings:&unk_1EED9B030];
  uint64_t v11 = [[TPSCollection alloc] initWithIdentifier:@"SavedTips" title:v5 text:v6 metadata:v8 tocAssets:v9 collectionAssets:v10 tipIdentifiers:v3];

  return v11;
}

- (id)collectionSectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppController *)self collectionSectionMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

BOOL __42__TPSAppController_updateSavedTipsContent__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 tipMap];
  id v5 = [v4 objectForKeyedSubscript:v3];

  return v5 != 0;
}

- (BOOL)isAccessoriesSection:(id)a3
{
  id v3 = [a3 identifier];
  char v4 = [&unk_1EED9B048 containsObject:v3];

  return v4;
}

- (BOOL)isExploreHardwareSection:(id)a3
{
  id v3 = [a3 identifier];
  char v4 = [&unk_1EED9B060 containsObject:v3];

  return v4;
}

- (BOOL)isAppleWatchSection:(id)a3
{
  id v3 = [a3 identifier];
  char v4 = [&unk_1EED9B078 containsObject:v3];

  return v4;
}

- (void)tipViewed:(id)a3 collectionIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [(TPSAppController *)self fullTipContentManager];
    [v8 markTipViewed:v6];

    id v9 = [(TPSAppController *)self fullTipContentManager];
    [v9 removeNotificationForIdentifier:v6];

    id v10 = [(TPSAppController *)self delegateEnumerator];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 appControllerTipViewed:self tipIdentifier:v6 collectionIdentifier:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)collectionIdentifierViewed:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    char v4 = +[TPSCommonDefines sharedInstance];
    [v4 viewedCollection:v6];

    id v5 = [(TPSAppController *)self fullTipContentManager];
    [v5 removeNotificationForIdentifier:v6];
  }
}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    char v4 = [(TPSAppController *)self fullTipContentManager];
    [v4 removeNotificationForIdentifier:v5];
  }
}

- (void)networkStateDidChange:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(TPSAppController *)self updateContent];
    char v4 = [(TPSAppController *)self delegateEnumerator];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 appControllerNetworkStateDidChangeToReachable:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)alwaysShowIntro
{
  return self->_alwaysShowIntro;
}

- (void)setAlwaysShowIntro:(BOOL)a3
{
  self->_alwaysShowIntro = a3;
}

- (BOOL)appInBackground
{
  return self->_appInBackground;
}

- (void)setAppInBackground:(BOOL)a3
{
  self->_appInBackground = a3;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

- (void)setAppGroupDefaults:(id)a3
{
}

- (void)setFullTipContentManager:(id)a3
{
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (NSError)lastFetchError
{
  return self->_lastFetchError;
}

- (NSDictionary)collectionSectionMap
{
  return self->_collectionSectionMap;
}

- (TPSSavedTipsManager)savedTipsManager
{
  return self->_savedTipsManager;
}

- (void)setSavedTipsManager:(id)a3
{
}

- (void)setDelegates:(id)a3
{
}

- (NSUUID)networkMonitorToken
{
  return self->_networkMonitorToken;
}

- (void)setNetworkMonitorToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorToken, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_savedTipsManager, 0);
  objc_storeStrong((id *)&self->_tipMap, 0);
  objc_storeStrong((id *)&self->_collectionSectionMap, 0);
  objc_storeStrong((id *)&self->_collectionMap, 0);
  objc_storeStrong((id *)&self->_lastFetchError, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);
  objc_storeStrong((id *)&self->_collectionSections, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_savedTipsCollection, 0);
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_checklistCollection, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_fullTipContentManager, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
}

- (BOOL)hasLocalVariant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_correlationID);
  if (v6)
  {
    id v7 = [(TPSAppController *)v5 tipForCorrelationIdentifier:v6];

    LOBYTE(v6) = v7 != 0;
  }

  return (char)v6;
}

- (void)logSharedTipDisplayed:(id)a3 isEligible:(BOOL)a4
{
  id v6 = (TPSTip *)a3;
  id v7 = self;
  TPSAppController.logSharedTipDisplayed(tip:isEligible:)(v6, a4);
}

- (void)logInvalidSharedTipDisplayed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _sSo16TPSAppControllerC8TipsCoreE28logInvalidSharedTipDisplayed3tipySo6TPSTipC_tF_0(v4);
}

@end