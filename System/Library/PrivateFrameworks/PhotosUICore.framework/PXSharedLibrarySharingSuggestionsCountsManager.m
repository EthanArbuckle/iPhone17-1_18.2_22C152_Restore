@interface PXSharedLibrarySharingSuggestionsCountsManager
+ (id)lastBannerDismissDateAccessor;
+ (id)lastNotificationDateAccessor;
+ (id)lastSeenSuggestionsDateAccessor;
+ (id)mostRecentUserSeenAddedDateAccessor;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedUnreadCounts;
- (BOOL)hasAnySuggestions;
- (BOOL)isAssetUnread:(id)a3;
- (BOOL)isFetchingUnreadSuggestedAssetsFetchResult;
- (BOOL)isSuggestionsEnabled;
- (BOOL)needsParticipantSetup;
- (BOOL)shouldShowNotificationBanner;
- (NSDate)mostRecentAddedDateEverSeen;
- (NSDate)mostRecentUserSeenAddedDate;
- (NSDate)notificationDate;
- (NSDate)priorityDate;
- (OS_dispatch_queue)queue;
- (PHAssetCollection)sharingSuggestionsSmartAlbum;
- (PHFetchResult)mostRecentAssetFetchResult;
- (PHFetchResult)mostRecentSuggestedAssetFetchResult;
- (PHFetchResult)unreadSuggestedAssetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXSharedLibrarySharingSuggestionsCountsManager)init;
- (PXSharedLibrarySharingSuggestionsCountsManager)initWithPhotoLibrary:(id)a3;
- (PXSharedLibraryStatusProvider)libraryStatusProvider;
- (PXUpdater)updater;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_fetchUnreadAssetsAfterDate;
- (void)_handleLastBannerDismissDateDidChange:(id)a3;
- (void)_handleLastNotificationDateDidChange:(id)a3;
- (void)_handleLastSeenAddedDateDidChange:(id)a3;
- (void)_handleLastSeenSuggestionsDateDidChange:(id)a3;
- (void)_handleUnreadSuggestedAssetsFetchResult:(id)a3 forDate:(id)a4;
- (void)_invalidateDetailedUnreadCounts;
- (void)_invalidateHasAnySuggestions;
- (void)_invalidateIsSuggestionsEnabled;
- (void)_invalidateMostRecentAddedDateEverSeen;
- (void)_invalidateMostRecentSeenSuggestedAssetAddedDate;
- (void)_invalidateMostRecentSuggestedAssetFetchResult;
- (void)_invalidateNeedsParticipantSetup;
- (void)_invalidateShouldShowBanner;
- (void)_queue_fetchUnreadAssetsAfterDate:(id)a3;
- (void)_setNeedsUpdate;
- (void)_updateDetailedUnreadCounts;
- (void)_updateHasAnySuggestions;
- (void)_updateIsSuggestionsEnabled;
- (void)_updateMostRecentAddedDateEverSeen;
- (void)_updateMostRecentSeenSuggestedAssetAddedDate;
- (void)_updateMostRecentSuggestedAssetFetchResult;
- (void)_updateNeedsParticipantSetup;
- (void)_updateShouldShowBanner;
- (void)clearStoredDates;
- (void)didPerformChanges;
- (void)markAllSuggestionsAsRead;
- (void)markAnyNotificationsAsRead;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)preferencesDidChange;
- (void)setDetailedUnreadCounts:(id *)a3;
- (void)setHasAnySuggestions:(BOOL)a3;
- (void)setIsFetchingUnreadSuggestedAssetsFetchResult:(BOOL)a3;
- (void)setIsSuggestionsEnabled:(BOOL)a3;
- (void)setMostRecentAddedDateEverSeen:(id)a3;
- (void)setMostRecentAssetFetchResult:(id)a3;
- (void)setMostRecentSuggestedAssetFetchResult:(id)a3;
- (void)setMostRecentUserSeenAddedDate:(id)a3;
- (void)setNeedsParticipantSetup:(BOOL)a3;
- (void)setShouldShowNotificationBanner:(BOOL)a3;
- (void)setUnreadSuggestedAssetsFetchResult:(id)a3;
@end

@implementation PXSharedLibrarySharingSuggestionsCountsManager

- (NSDate)mostRecentUserSeenAddedDate
{
  return self->_mostRecentUserSeenAddedDate;
}

- (BOOL)shouldShowNotificationBanner
{
  return self->_shouldShowNotificationBanner;
}

- (void)_setNeedsUpdate
{
}

uint64_t __70__PXSharedLibrarySharingSuggestionsCountsManager_preferencesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateIsSuggestionsEnabled];
}

- (void)preferencesDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__PXSharedLibrarySharingSuggestionsCountsManager_preferencesDidChange__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:v2];
}

- (void)_invalidateDetailedUnreadCounts
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDetailedUnreadCounts];
}

uint64_t __71__PXSharedLibrarySharingSuggestionsCountsManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateIsSuggestionsEnabled];
  [*(id *)(a1 + 32) _invalidateMostRecentSuggestedAssetFetchResult];
  [*(id *)(a1 + 32) _invalidateHasAnySuggestions];
  [*(id *)(a1 + 32) _invalidateNeedsParticipantSetup];
  [*(id *)(a1 + 32) _invalidateMostRecentAddedDateEverSeen];
  [*(id *)(a1 + 32) _invalidateMostRecentSeenSuggestedAssetAddedDate];
  [*(id *)(a1 + 32) _invalidateDetailedUnreadCounts];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateShouldShowBanner];
}

- (void)_invalidateMostRecentSeenSuggestedAssetAddedDate
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMostRecentSeenSuggestedAssetAddedDate];
}

- (void)_invalidateIsSuggestionsEnabled
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsSuggestionsEnabled];
}

- (void)_invalidateShouldShowBanner
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldShowBanner];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibrarySharingSuggestionsCountsManager;
  [(PXSharedLibrarySharingSuggestionsCountsManager *)&v4 didPerformChanges];
  v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v3 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_invalidateNeedsParticipantSetup
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateNeedsParticipantSetup];
}

- (void)_invalidateMostRecentSuggestedAssetFetchResult
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMostRecentSuggestedAssetFetchResult];
}

- (void)_invalidateMostRecentAddedDateEverSeen
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMostRecentAddedDateEverSeen];
}

- (void)_invalidateHasAnySuggestions
{
  id v2 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHasAnySuggestions];
}

uint64_t __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateShouldShowBanner];
}

uint64_t __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateShouldShowBanner];
}

uint64_t __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateShouldShowBanner];
}

uint64_t __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateMostRecentSeenSuggestedAssetAddedDate];
}

- (PXSharedLibrarySharingSuggestionsCountsManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibrarySharingSuggestionsCountsManager;
  v6 = [(PXSharedLibrarySharingSuggestionsCountsManager *)&v25 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v6 needsUpdateSelector:sel__setNeedsUpdate];
    v8 = (void *)*((void *)v6 + 21);
    *((void *)v6 + 21) = v7;

    [*((id *)v6 + 21) addUpdateSelector:sel__updateIsSuggestionsEnabled];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateMostRecentSuggestedAssetFetchResult];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateHasAnySuggestions];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateNeedsParticipantSetup];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateMostRecentAddedDateEverSeen];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateMostRecentSeenSuggestedAssetAddedDate];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateDetailedUnreadCounts];
    [*((id *)v6 + 21) addUpdateSelector:sel__updateShouldShowBanner];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.sharedLibrary.suggestions-counts-fetch-queue", v9);
    v11 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = v10;

    objc_storeStrong((id *)v6 + 18, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v6);
    uint64_t v12 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v5];
    v13 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v12;

    [*((id *)v6 + 17) registerChangeObserver:v6 context:PXSharedLibraryStatusProviderObservationContext_136861];
    *(_OWORD *)(v6 + 184) = *(_OWORD *)off_1E5DAAEE0;
    *((void *)v6 + 25) = *((void *)off_1E5DAAEE0 + 2);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v6 selector:sel__handleLastSeenAddedDateDidChange_ name:@"PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateDidChangeNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel__handleLastNotificationDateDidChange_ name:@"PFSharedLibrarySuggestionsLastNotificationDateDidChangeNotification" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel__handleLastSeenSuggestionsDateDidChange_ name:@"PFSharedLibrarySuggestionsLastSeenSuggestionsDateDidChangeNotification" object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v6 selector:sel__handleLastBannerDismissDateDidChange_ name:@"PFSharedLibrarySuggestionsLastBannerDismissDateDidChangeNotification" object:0];

    PXRegisterPreferencesObserver(v6);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__PXSharedLibrarySharingSuggestionsCountsManager_initWithPhotoLibrary___block_invoke;
    v23[3] = &unk_1E5DD0FA8;
    v24 = v6;
    [v24 performChanges:v23];
    v18 = [(id)objc_opt_class() mostRecentUserSeenAddedDateAccessor];
    [v18 loadValueAsyncIfNeeded];

    v19 = [(id)objc_opt_class() lastNotificationDateAccessor];
    [v19 loadValueAsyncIfNeeded];

    v20 = [(id)objc_opt_class() lastSeenSuggestionsDateAccessor];
    [v20 loadValueAsyncIfNeeded];

    v21 = [(id)objc_opt_class() lastBannerDismissDateAccessor];
    [v21 loadValueAsyncIfNeeded];
  }
  return (PXSharedLibrarySharingSuggestionsCountsManager *)v6;
}

void __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  objc_super v4 = [v2 defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8D268];
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateDidChangeNotification" object:0 userInfo:v5];
}

void __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  objc_super v4 = [v2 defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8D260];
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PFSharedLibrarySuggestionsLastSeenSuggestionsDateDidChangeNotification" object:0 userInfo:v5];
}

void __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  objc_super v4 = [v2 defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8D250];
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PFSharedLibrarySuggestionsLastBannerDismissDateDidChangeNotification" object:0 userInfo:v5];
}

void __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  objc_super v4 = [v2 defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8D258];
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PFSharedLibrarySuggestionsLastNotificationDateDidChangeNotification" object:0 userInfo:v5];
}

+ (id)mostRecentUserSeenAddedDateAccessor
{
  if (mostRecentUserSeenAddedDateAccessor_onceToken != -1) {
    dispatch_once(&mostRecentUserSeenAddedDateAccessor_onceToken, &__block_literal_global_136942);
  }
  id v2 = (void *)mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor;
  return v2;
}

+ (id)lastSeenSuggestionsDateAccessor
{
  if (lastSeenSuggestionsDateAccessor_onceToken != -1) {
    dispatch_once(&lastSeenSuggestionsDateAccessor_onceToken, &__block_literal_global_276_136930);
  }
  id v2 = (void *)lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor;
  return v2;
}

+ (id)lastNotificationDateAccessor
{
  if (lastNotificationDateAccessor_onceToken != -1) {
    dispatch_once(&lastNotificationDateAccessor_onceToken, &__block_literal_global_268);
  }
  id v2 = (void *)lastNotificationDateAccessor_lastNotificationDateAccessor;
  return v2;
}

+ (id)lastBannerDismissDateAccessor
{
  if (lastBannerDismissDateAccessor_onceToken != -1) {
    dispatch_once(&lastBannerDismissDateAccessor_onceToken, &__block_literal_global_284_136918);
  }
  id v2 = (void *)lastBannerDismissDateAccessor_lastBannerDismissDateAccessor;
  return v2;
}

- (void)_updateShouldShowBanner
{
  if ([(PXSharedLibrarySharingSuggestionsCountsManager *)self hasAnySuggestions])
  {
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self detailedUnreadCounts];
    id v3 = [(id)objc_opt_class() lastNotificationDateAccessor];
    objc_super v4 = [v3 currentValueIfLoaded];

    id v5 = [(id)objc_opt_class() lastSeenSuggestionsDateAccessor];
    uint64_t v6 = [v5 currentValueIfLoaded];

    if (v4 && v6) {
      [v4 timeIntervalSinceDate:v6];
    }
    v8 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v9 = [v8 sharingSuggestionsBannerUnreadCountThreshold];

    dispatch_queue_t v10 = +[PXSharedLibrarySettings sharedInstance];
    [v10 sharingSuggestionsMinimumTimeSinceLastBannerDismiss];
    double v12 = v11;

    v13 = [(id)objc_opt_class() lastBannerDismissDateAccessor];
    v14 = [v13 currentValueIfLoaded];

    BOOL v15 = 0;
    if ((v9 & 0x8000000000000000) == 0 && v9 <= 0)
    {
      if (v14 && ([v14 timeIntervalSinceNow], fabs(v16) < v12))
      {
        BOOL v15 = 0;
      }
      else
      {
        v17 = +[PXSharedLibrarySettings sharedInstance];
        [v17 sharingSuggestionsMinimumTimeSinceLastAsset];
        double v19 = v18;

        v20 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentAssetFetchResult];
        v21 = [v20 firstObject];
        v22 = [v21 creationDate];

        BOOL v15 = 1;
        if (v22)
        {
          [v22 timeIntervalSinceNow];
          if (fabs(v23) < v19) {
            BOOL v15 = 0;
          }
        }
      }
    }

    BOOL v7 = v15;
  }
  else
  {
    BOOL v7 = 0;
  }
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self setShouldShowNotificationBanner:v7];
}

- (void)setShouldShowNotificationBanner:(BOOL)a3
{
  if (self->_shouldShowNotificationBanner != a3)
  {
    self->_shouldShowNotificationBanner = a3;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self signalChange:8];
  }
}

- (BOOL)hasAnySuggestions
{
  return self->_hasAnySuggestions;
}

- (void)setIsSuggestionsEnabled:(BOOL)a3
{
  if (self->_isSuggestionsEnabled != a3)
  {
    self->_isSuggestionsEnabled = a3;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateMostRecentSeenSuggestedAssetAddedDate];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateMostRecentSuggestedAssetFetchResult];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateNeedsParticipantSetup];
  }
}

- (void)_updateIsSuggestionsEnabled
{
  id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self libraryStatusProvider];
  int v4 = [v3 hasSharedLibrary];

  if (v4) {
    uint64_t v5 = PLIsSharedLibrarySuggestionsEnabled();
  }
  else {
    uint64_t v5 = 0;
  }
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self setIsSuggestionsEnabled:v5];
}

- (PXSharedLibraryStatusProvider)libraryStatusProvider
{
  return self->_libraryStatusProvider;
}

- (void)_updateNeedsParticipantSetup
{
  if ([(PXSharedLibrarySharingSuggestionsCountsManager *)self isSuggestionsEnabled]
    && ![(PXSharedLibrarySharingSuggestionsCountsManager *)self hasAnySuggestions])
  {
    int v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self libraryStatusProvider];
    uint64_t v5 = [v4 sharedLibrary];
    uint64_t v6 = [v5 rule];

    if ([v6 autoSharePolicy] == 1)
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v7 = [v6 personUUIDs];
      BOOL v3 = [v7 count] == 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self setNeedsParticipantSetup:v3];
}

- (void)_updateMostRecentAddedDateEverSeen
{
  id v9 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentAddedDateEverSeen];
  BOOL v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentSuggestedAssetFetchResult];
  int v4 = [v3 firstObject];
  uint64_t v5 = [v4 curationProperties];
  uint64_t v6 = [v5 addedDate];

  if (v6)
  {
    if (v9)
    {
      id v7 = [v9 laterDate:v6];
    }
    else
    {
      id v7 = v6;
    }
    v8 = v7;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self setMostRecentAddedDateEverSeen:v7];
  }
}

- (NSDate)mostRecentAddedDateEverSeen
{
  return self->_mostRecentAddedDateEverSeen;
}

- (void)_updateHasAnySuggestions
{
  id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentSuggestedAssetFetchResult];
  -[PXSharedLibrarySharingSuggestionsCountsManager setHasAnySuggestions:](self, "setHasAnySuggestions:", [v3 count] != 0);
}

- (void)setHasAnySuggestions:(BOOL)a3
{
  if (self->_hasAnySuggestions != a3)
  {
    self->_hasAnySuggestions = a3;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self signalChange:1];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateShouldShowBanner];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateDetailedUnreadCounts];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateNeedsParticipantSetup];
  }
}

- (void)_updateMostRecentSuggestedAssetFetchResult
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentSuggestedAssetFetchResult];
  if (v3)
  {
  }
  else if ([(PXSharedLibrarySharingSuggestionsCountsManager *)self isSuggestionsEnabled])
  {
    int v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self photoLibrary];
    uint64_t v5 = [v4 librarySpecificFetchOptions];

    [v5 setFetchLimit:1];
    v16[0] = *MEMORY[0x1E4F39458];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v5 setFetchPropertySets:v6];

    id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
    BOOL v15 = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v5 setInternalSortDescriptors:v8];

    id v9 = (void *)MEMORY[0x1E4F38EB8];
    dispatch_queue_t v10 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self sharingSuggestionsSmartAlbum];
    double v11 = [v9 fetchAssetsInAssetCollection:v10 options:v5];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self setMostRecentSuggestedAssetFetchResult:v11];

    return;
  }
  uint64_t v12 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentSuggestedAssetFetchResult];
  if (v12)
  {
    v13 = (void *)v12;
    BOOL v14 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self isSuggestionsEnabled];

    if (!v14)
    {
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self setMostRecentSuggestedAssetFetchResult:0];
    }
  }
}

- (PHFetchResult)mostRecentSuggestedAssetFetchResult
{
  return self->_mostRecentSuggestedAssetFetchResult;
}

- (void)_updateMostRecentSeenSuggestedAssetAddedDate
{
  if ([(PXSharedLibrarySharingSuggestionsCountsManager *)self isSuggestionsEnabled])
  {
    id v3 = [(id)objc_opt_class() mostRecentUserSeenAddedDateAccessor];
    id v4 = [v3 currentValueIfLoaded];
  }
  else
  {
    id v4 = 0;
  }
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self setMostRecentUserSeenAddedDate:v4];
}

- (BOOL)isSuggestionsEnabled
{
  return self->_isSuggestionsEnabled;
}

- (void)setMostRecentUserSeenAddedDate:(id)a3
{
  id v9 = (NSDate *)a3;
  uint64_t v5 = self->_mostRecentUserSeenAddedDate;
  if (v5 == v9)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(NSDate *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentUserSeenAddedDate, a3);
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateDetailedUnreadCounts];
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self signalChange:4];
      if (v9)
      {
        v8 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];

        if (v8) {
          [(PXSharedLibrarySharingSuggestionsCountsManager *)self _fetchUnreadAssetsAfterDate];
        }
      }
    }
  }
}

- (void)setNeedsParticipantSetup:(BOOL)a3
{
  if (self->_needsParticipantSetup != a3)
  {
    self->_needsParticipantSetup = a3;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self signalChange:16];
  }
}

void __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:*MEMORY[0x1E4F8D258] defaultValueFuture:&__block_literal_global_270_136936 valueFilter:&__block_literal_global_272_136937 changeHandler:&__block_literal_global_274_136938];
  id v2 = (void *)lastNotificationDateAccessor_lastNotificationDateAccessor;
  lastNotificationDateAccessor_lastNotificationDateAccessor = v1;
}

void __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:*MEMORY[0x1E4F8D260] defaultValueFuture:&__block_literal_global_278_136932 valueFilter:&__block_literal_global_280 changeHandler:&__block_literal_global_282_136933];
  id v2 = (void *)lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor;
  lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor = v1;
}

void __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:*MEMORY[0x1E4F8D268] defaultValueFuture:&__block_literal_global_259 valueFilter:&__block_literal_global_262 changeHandler:&__block_literal_global_265_136944];
  id v2 = (void *)mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor;
  mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor = v1;
}

void __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:*MEMORY[0x1E4F8D250] defaultValueFuture:&__block_literal_global_286_136922 valueFilter:&__block_literal_global_288 changeHandler:&__block_literal_global_290_136923];
  id v2 = (void *)lastBannerDismissDateAccessor_lastBannerDismissDateAccessor;
  lastBannerDismissDateAccessor_lastBannerDismissDateAccessor = v1;
}

- (void)_updateDetailedUnreadCounts
{
  id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];

  if (v3)
  {
    id v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];
    v8[0] = [v4 countOfAssetsWithMediaType:1];
    v8[1] = [v4 countOfAssetsWithMediaType:2];
    v8[2] = [v4 countOfAssetsWithMediaType:3];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self setDetailedUnreadCounts:v8];
  }
  else
  {
    uint64_t v5 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentUserSeenAddedDate];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      BOOL v7 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self hasAnySuggestions];

      if (v7)
      {
        [(PXSharedLibrarySharingSuggestionsCountsManager *)self _fetchUnreadAssetsAfterDate];
      }
    }
  }
}

- (PHFetchResult)unreadSuggestedAssetsFetchResult
{
  return self->_unreadSuggestedAssetsFetchResult;
}

- (void)_handleLastSeenSuggestionsDateDidChange:(id)a3
{
}

- (void)_handleLastSeenAddedDateDidChange:(id)a3
{
}

- (void)_handleLastNotificationDateDidChange:(id)a3
{
}

- (void)_handleLastBannerDismissDateDidChange:(id)a3
{
}

uint64_t __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_136861 != a5)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSharedLibrarySharingSuggestionsCountsManager.m" lineNumber:584 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  dispatch_queue_t v10 = v9;
  if ((v6 & 2) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5DD0FA8;
    v13[4] = self;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:v13];
  }
  if ((v6 & 0x10) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke_2;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_unreadSuggestedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_mostRecentAddedDateEverSeen, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_mostRecentUserSeenAddedDate, 0);
  objc_storeStrong((id *)&self->_sharingSuggestionsSmartAlbum, 0);
  objc_storeStrong((id *)&self->_mostRecentAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_mostRecentSuggestedAssetFetchResult, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setIsFetchingUnreadSuggestedAssetsFetchResult:(BOOL)a3
{
  self->_isFetchingUnreadSuggestedAssetsFetchResult = a3;
}

- (BOOL)isFetchingUnreadSuggestedAssetsFetchResult
{
  return self->_isFetchingUnreadSuggestedAssetsFetchResult;
}

- (void)setMostRecentAddedDateEverSeen:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedUnreadCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = *($C8986E5AD9146E03F7E851F39E835596 *)((char *)self + 184);
  return self;
}

- (BOOL)needsParticipantSetup
{
  return self->_needsParticipantSetup;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_mostRecentSuggestedAssetFetchResult)
  {
    v8 = objc_msgSend(v6, "changeDetailsForFetchResult:");
  }
  else
  {
    v8 = 0;
  }
  id v9 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];
  if (v9)
  {
    dispatch_queue_t v10 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];
    double v11 = [v6 changeDetailsForFetchResult:v10];
  }
  else
  {
    double v11 = 0;
  }

  if (self->_mostRecentAssetFetchResult)
  {
    uint64_t v12 = objc_msgSend(v6, "changeDetailsForFetchResult:");
    if (v8) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v8)
    {
LABEL_13:
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __100__PXSharedLibrarySharingSuggestionsCountsManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
      v13[3] = &unk_1E5DBEF80;
      id v14 = v8;
      BOOL v15 = self;
      id v16 = v11;
      id v17 = v12;
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:v13];

      goto LABEL_14;
    }
  }
  if (v11 || v12) {
    goto LABEL_13;
  }
LABEL_14:
}

void __100__PXSharedLibrarySharingSuggestionsCountsManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = [v3 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setMostRecentSuggestedAssetFetchResult:v4];
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = [v5 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setUnreadSuggestedAssetsFetchResult:v6];
  }
  id v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = [v7 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setMostRecentAssetFetchResult:v8];
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self unreadSuggestedAssetsFetchResult];
  if (v5)
  {
    id v6 = [v4 changeDetailsForFetchResult:v5];
    id v7 = [v6 fetchResultAfterChanges];

    [v7 countOfAssetsWithMediaType:1];
  }

  return 0;
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateIsSuggestionsEnabled];
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateNeedsParticipantSetup];
}

- (void)setUnreadSuggestedAssetsFetchResult:(id)a3
{
  v8 = (PHFetchResult *)a3;
  uint64_t v5 = self->_unreadSuggestedAssetsFetchResult;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PHFetchResult *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_unreadSuggestedAssetsFetchResult, a3);
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateDetailedUnreadCounts];
    }
  }
}

- (void)setMostRecentSuggestedAssetFetchResult:(id)a3
{
  v8 = (PHFetchResult *)a3;
  uint64_t v5 = self->_mostRecentSuggestedAssetFetchResult;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PHFetchResult *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentSuggestedAssetFetchResult, a3);
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateHasAnySuggestions];
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateMostRecentAddedDateEverSeen];
    }
  }
}

- (PHAssetCollection)sharingSuggestionsSmartAlbum
{
  sharingSuggestionsSmartAlbum = self->_sharingSuggestionsSmartAlbum;
  if (!sharingSuggestionsSmartAlbum)
  {
    id v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self photoLibrary];
    uint64_t v5 = [v4 librarySpecificFetchOptions];

    [v5 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
    id v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000214 options:v5];
    char v7 = [v6 firstObject];
    v8 = self->_sharingSuggestionsSmartAlbum;
    self->_sharingSuggestionsSmartAlbum = v7;

    sharingSuggestionsSmartAlbum = self->_sharingSuggestionsSmartAlbum;
  }
  return sharingSuggestionsSmartAlbum;
}

- (void)_handleUnreadSuggestedAssetsFetchResult:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self setIsFetchingUnreadSuggestedAssetsFetchResult:0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __98__PXSharedLibrarySharingSuggestionsCountsManager__handleUnreadSuggestedAssetsFetchResult_forDate___block_invoke;
  BOOL v15 = &unk_1E5DD0328;
  id v16 = self;
  id v17 = v6;
  id v8 = v6;
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:&v12];
  id v9 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentUserSeenAddedDate];
  if (v9 == v7)
  {
  }
  else
  {
    dispatch_queue_t v10 = v9;
    char v11 = [v9 isEqual:v7];

    if ((v11 & 1) == 0) {
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _fetchUnreadAssetsAfterDate];
    }
  }
}

uint64_t __98__PXSharedLibrarySharingSuggestionsCountsManager__handleUnreadSuggestedAssetsFetchResult_forDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUnreadSuggestedAssetsFetchResult:*(void *)(a1 + 40)];
}

- (void)_queue_fetchUnreadAssetsAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];

  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"addedDate > %@", *(void *)(a1 + 40)];
  [v3 setInternalPredicate:v4];

  [v3 setInternalSortDescriptors:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = (void *)MEMORY[0x1E4F38EB8];
  id v6 = [*(id *)(a1 + 32) sharingSuggestionsSmartAlbum];
  id v7 = [v5 fetchAssetsInAssetCollection:v6 options:v3];

  [v7 countOfAssetsWithMediaType:1];
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke_2;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v12, &location);
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleUnreadSuggestedAssetsFetchResult:*(void *)(a1 + 32) forDate:*(void *)(a1 + 40)];
}

- (void)_fetchUnreadAssetsAfterDate
{
  if (![(PXSharedLibrarySharingSuggestionsCountsManager *)self isFetchingUnreadSuggestedAssetsFetchResult])
  {
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self setIsFetchingUnreadSuggestedAssetsFetchResult:1];
    objc_initWeak(&location, self);
    id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentUserSeenAddedDate];
    id v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXSharedLibrarySharingSuggestionsCountsManager__fetchUnreadAssetsAfterDate__block_invoke;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    id v5 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __77__PXSharedLibrarySharingSuggestionsCountsManager__fetchUnreadAssetsAfterDate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_fetchUnreadAssetsAfterDate:", *(void *)(a1 + 32));
}

- (void)setMostRecentAssetFetchResult:(id)a3
{
  id v8 = (PHFetchResult *)a3;
  id v5 = self->_mostRecentAssetFetchResult;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PHFetchResult *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentAssetFetchResult, a3);
      [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateShouldShowBanner];
    }
  }
}

- (PHFetchResult)mostRecentAssetFetchResult
{
  v11[1] = *MEMORY[0x1E4F143B8];
  mostRecentAssetFetchResult = self->_mostRecentAssetFetchResult;
  if (!mostRecentAssetFetchResult)
  {
    id v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    [v5 setFetchLimit:1];
    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v11[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 setSortDescriptors:v7];

    id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v5];
    id v9 = self->_mostRecentAssetFetchResult;
    self->_mostRecentAssetFetchResult = v8;

    mostRecentAssetFetchResult = self->_mostRecentAssetFetchResult;
  }
  return mostRecentAssetFetchResult;
}

- (BOOL)isAssetUnread:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 curationProperties];
    id v6 = [v5 addedDate];

    char v7 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentUserSeenAddedDate];
    id v8 = [v7 laterDate:v6];
    char v9 = [v8 isEqualToDate:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDate)notificationDate
{
  id v2 = [(id)objc_opt_class() lastNotificationDateAccessor];
  id v3 = [v2 currentValue];

  return (NSDate *)v3;
}

- (NSDate)priorityDate
{
  if ([(PXSharedLibrarySharingSuggestionsCountsManager *)self shouldShowNotificationBanner])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    id v4 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentAddedDateEverSeen];
    id v5 = [(id)objc_opt_class() lastNotificationDateAccessor];
    id v6 = [v5 currentValue];

    if (v4)
    {
      id v7 = [v6 laterDate:v4];
    }
    else
    {
      id v7 = v6;
    }
    id v3 = v7;
  }
  return (NSDate *)v3;
}

- (void)setDetailedUnreadCounts:(id *)a3
{
  if (self->_detailedUnreadCounts.photosCount != a3->var0
    || self->_detailedUnreadCounts.videosCount != a3->var1
    || self->_detailedUnreadCounts.othersCount != a3->var2)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    self->_detailedUnreadCounts.othersCount = a3->var2;
    *(_OWORD *)&self->_detailedUnreadCounts.photosCount = v6;
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self signalChange:2];
    [(PXSharedLibrarySharingSuggestionsCountsManager *)self _invalidateShouldShowBanner];
  }
}

- (void)clearStoredDates
{
  id v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v3 = [(id)objc_opt_class() mostRecentUserSeenAddedDateAccessor];
  [v3 setCurrentValue:v2];

  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v5 = [(id)objc_opt_class() lastSeenSuggestionsDateAccessor];
  [v5 setCurrentValue:v4];

  long long v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = [(id)objc_opt_class() lastNotificationDateAccessor];
  [v7 setCurrentValue:v6];

  id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v8 = [(id)objc_opt_class() lastBannerDismissDateAccessor];
  [v8 setCurrentValue:v9];
}

- (void)markAnyNotificationsAsRead
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    long long v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(id)objc_opt_class() lastSeenSuggestionsDateAccessor];
  [v9 setCurrentValue:v8];

  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(id)objc_opt_class() lastBannerDismissDateAccessor];
  [v11 setCurrentValue:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PXSharedLibrarySharingSuggestionsCountsManager_markAnyNotificationsAsRead__block_invoke;
  v12[3] = &unk_1E5DD0FA8;
  v12[4] = self;
  [(PXSharedLibrarySharingSuggestionsCountsManager *)self performChanges:v12];
}

uint64_t __76__PXSharedLibrarySharingSuggestionsCountsManager_markAnyNotificationsAsRead__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldShowNotificationBanner:0];
}

- (void)markAllSuggestionsAsRead
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXSharedLibrarySharingSuggestionsCountsManager *)self mostRecentAddedDateEverSeen];
  id v4 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    long long v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(a2);
    int v16 = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@ mostRecentAddedDate:%@", (uint8_t *)&v16, 0x20u);
  }
  if (v3)
  {
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Updating PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateKey with date:%@", (uint8_t *)&v16, 0xCu);
    }

    id v9 = [(id)objc_opt_class() mostRecentUserSeenAddedDateAccessor];
    id v10 = [v9 currentValue];
    id v11 = v10;
    if (v10 == v3)
    {
    }
    else
    {
      char v12 = [v10 isEqual:v3];

      if ((v12 & 1) == 0)
      {
        if (v11
          && ([v11 laterDate:v3],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isEqualToDate:v11],
              v13,
              v14))
        {
          __int16 v15 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 138412546;
            id v17 = v11;
            __int16 v18 = 2112;
            id v19 = v3;
            _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Exisitng PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateKey %@ is newer or the same as the one being set %@, ignoring.", (uint8_t *)&v16, 0x16u);
          }
        }
        else
        {
          [v9 setCurrentValue:v3];
        }
      }
    }
  }
}

- (PXSharedLibrarySharingSuggestionsCountsManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibrarySharingSuggestionsCountsManager.m", 63, @"%s is not available as initializer", "-[PXSharedLibrarySharingSuggestionsCountsManager init]");

  abort();
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (a2 == a3) {
    return 0;
  }
  else {
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
  }
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] distantPast];
}

uint64_t __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (a2 == a3) {
    return 0;
  }
  else {
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
  }
}

uint64_t __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] distantPast];
}

uint64_t __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (a2 == a3) {
    return 0;
  }
  else {
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
  }
}

uint64_t __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] distantPast];
}

uint64_t __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (a2 == a3) {
    return 0;
  }
  else {
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
  }
}

uint64_t __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] distantPast];
}

@end