@interface PXGridInlinePlaybackController
- (BOOL)_hasAnyPlaybackRecords;
- (BOOL)active;
- (BOOL)applicationActive;
- (BOOL)autoplaySettingEnabled;
- (BOOL)canCreateRecords;
- (BOOL)canPlayAsset:(id)a3;
- (BOOL)canProvideGeometriesForRecords;
- (BOOL)canUpdatePlayingRecords;
- (BOOL)isContentViewVisible;
- (BOOL)isContextMenuInteractionActive;
- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3;
- (BOOL)isDragSessionActive;
- (BOOL)isOneUpVisible;
- (BOOL)isPlayingDisplayAsset:(id)a3;
- (BOOL)lowPowerModeEnabled;
- (BOOL)playbackEnabled;
- (BOOL)shouldCoalescePlayingRecordsUpdates;
- (BOOL)shouldEnablePlayback;
- (BOOL)shouldPlayOnHover;
- (CGRect)currentVisibleRect;
- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4;
- (NSArray)currentRecords;
- (PXDisplayAsset)currentHoveredDisplayAsset;
- (PXEventCoalescer)playingRecordsEventCoalescer;
- (PXGridInlinePlaybackController)init;
- (UIEdgeInsets)criticallyVisibleEdgeInsets;
- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5 configurationBlock:(id)a6;
- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)filterSortedRecordsToPlay:(id)a3;
- (int64_t)maxNumberOfPlayingItems;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidResignActive:(id)a3;
- (void)_processInfoPowerStateDidChange:(id)a3;
- (void)_startPlaybackForRecords:(id)a3;
- (void)_stopPlaybackForRecords:(id)a3;
- (void)_updateActive;
- (void)_updateCanCreateRecords;
- (void)_updateLowPowerModeEnabled;
- (void)_updatePlaybackEnabled;
- (void)_updatePlayingRecords;
- (void)_updatePlayingRecordsImmediately;
- (void)_updateVisibilityOfRecords;
- (void)checkInPlaybackRecordForDisplayAsset:(id)a3;
- (void)checkInPlaybackRecordForDisplayAssets:(id)a3;
- (void)dealloc;
- (void)invalidatePlaybackEnabled;
- (void)invalidatePlayingRecords;
- (void)preferencesDidChange;
- (void)setActive:(BOOL)a3;
- (void)setApplicationActive:(BOOL)a3;
- (void)setAutoplaySettingEnabled:(BOOL)a3;
- (void)setCanCreateRecords:(BOOL)a3;
- (void)setIsContentViewVisible:(BOOL)a3;
- (void)setIsContextMenuInteractionActive:(BOOL)a3;
- (void)setIsDragSessionActive:(BOOL)a3;
- (void)setIsOneUpVisible:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setNeedsUpdate;
- (void)setPlaybackEnabled:(BOOL)a3;
- (void)visibleRectDidChange;
- (void)willCheckInPlaybackRecordForDisplayAsset:(id)a3;
@end

@implementation PXGridInlinePlaybackController

- (void)visibleRectDidChange
{
}

uint64_t __48__PXGridInlinePlaybackController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) updateIfNeeded];
}

- (void)setAutoplaySettingEnabled:(BOOL)a3
{
  if (self->_autoplaySettingEnabled != a3)
  {
    self->_autoplaySettingEnabled = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateCanCreateRecords];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
  }
}

- (void)preferencesDidChange
{
  BOOL IsVideoAutoplayEnabled = PXPreferencesIsVideoAutoplayEnabled();
  [(PXGridInlinePlaybackController *)self setAutoplaySettingEnabled:IsVideoAutoplayEnabled];
}

- (BOOL)shouldPlayOnHover
{
  return 0;
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)setIsOneUpVisible:(BOOL)a3
{
  if (self->_isOneUpVisible != a3)
  {
    self->_isOneUpVisible = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateActive];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateVisibilityOfRecords];
  }
}

- (void)setIsContentViewVisible:(BOOL)a3
{
  if (self->_isContentViewVisible != a3)
  {
    self->_isContentViewVisible = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateVisibilityOfRecords];
  }
}

- (PXGridInlinePlaybackController)init
{
  v21.receiver = self;
  v21.super_class = (Class)PXGridInlinePlaybackController;
  v2 = [(PXGridInlinePlaybackController *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photos.cl-playback-controller.records", 0);
    recordsQueue = v2->_recordsQueue;
    v2->_recordsQueue = (OS_dispatch_queue *)v3;

    v2->_lookupLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lookupLock_recordsByDisplayAsset = v2->_lookupLock_recordsByDisplayAsset;
    v2->_lookupLock_recordsByDisplayAsset = (NSMapTable *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentlyPlayingRecords = v2->_currentlyPlayingRecords;
    v2->_currentlyPlayingRecords = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visibleRecords = v2->_visibleRecords;
    v2->_visibleRecords = v9;

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enableCoalescedPlayingRecordsUpdates", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v12 = AppBooleanValue == 0;
    }
    else {
      BOOL v12 = 0;
    }
    char v13 = !v12;
    v2->_shouldCoalescePlayingRecordsUpdates = v13;
    if ([(PXGridInlinePlaybackController *)v2 shouldCoalescePlayingRecordsUpdates])
    {
      v14 = +[PXCuratedLibrarySettings sharedInstance];
      [v14 playingRecordsUpdateRateLimit];
      double v16 = v15;

      uint64_t v17 = [off_1E5DA62E0 rateLimitingCoalescerWithRate:v16];
      playingRecordsEventCoalescer = v2->_playingRecordsEventCoalescer;
      v2->_playingRecordsEventCoalescer = (PXEventCoalescer *)v17;

      [(PXEventCoalescer *)v2->_playingRecordsEventCoalescer registerObserver:v2];
    }
    v19 = +[PXCuratedLibrarySettings sharedInstance];
    [v19 playbackVisibleRectEdgeInset];

    PXEdgeInsetsMake();
  }
  return 0;
}

- (void)setCanCreateRecords:(BOOL)a3
{
  self->_canCreateRecords = a3;
}

- (void)setApplicationActive:(BOOL)a3
{
  if (self->_applicationActive != a3)
  {
    self->_applicationActive = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayingRecords];
  }
}

- (void)_updateLowPowerModeEnabled
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  -[PXGridInlinePlaybackController setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", [v3 isLowPowerModeEnabled]);
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateCanCreateRecords];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
  }
}

- (void)_updateCanCreateRecords
{
  if ([(PXGridInlinePlaybackController *)self autoplaySettingEnabled]) {
    uint64_t v3 = [(PXGridInlinePlaybackController *)self lowPowerModeEnabled] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(PXGridInlinePlaybackController *)self setCanCreateRecords:v3];
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)_updateVisibilityOfRecords
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  if ([(PXGridInlinePlaybackController *)self isContentViewVisible])
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    v4 = [(NSMapTable *)self->_lookupLock_recordsByDisplayAsset objectEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) prepareForVisible];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v15 = 0uLL;
    long long v16 = 0uLL;
    long long v13 = 0uLL;
    long long v14 = 0uLL;
    v4 = [(NSMapTable *)self->_lookupLock_recordsByDisplayAsset objectEnumerator];
    uint64_t v9 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * j) prepareForInvisible];
        }
        uint64_t v10 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }

  os_unfair_lock_unlock(p_lookupLock);
}

- (void)_updatePlaybackEnabled
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXGridInlinePlaybackController *)self autoplaySettingEnabled]
    && [(PXGridInlinePlaybackController *)self isContentViewVisible]
    && ![(PXGridInlinePlaybackController *)self isContextMenuInteractionActive]
    && ![(PXGridInlinePlaybackController *)self isDragSessionActive]
    && [(PXGridInlinePlaybackController *)self applicationActive]
    && ![(PXGridInlinePlaybackController *)self lowPowerModeEnabled]
    && [(PXGridInlinePlaybackController *)self shouldEnablePlayback];
  [(PXGridInlinePlaybackController *)self setPlaybackEnabled:v3];
  v4 = PLGridInlinePlaybackGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = [(PXGridInlinePlaybackController *)self autoplaySettingEnabled];
    BOOL v6 = [(PXGridInlinePlaybackController *)self isContentViewVisible];
    BOOL v7 = [(PXGridInlinePlaybackController *)self isContextMenuInteractionActive];
    BOOL v8 = [(PXGridInlinePlaybackController *)self isDragSessionActive];
    BOOL v9 = [(PXGridInlinePlaybackController *)self applicationActive];
    BOOL v10 = [(PXGridInlinePlaybackController *)self lowPowerModeEnabled];
    BOOL v11 = [(PXGridInlinePlaybackController *)self shouldEnablePlayback];
    BOOL v12 = [(PXGridInlinePlaybackController *)self debugDescription];
    v13[0] = 67111170;
    v13[1] = v3;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    BOOL v17 = v6;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v9;
    __int16 v24 = 1024;
    BOOL v25 = v10;
    __int16 v26 = 1024;
    BOOL v27 = v11;
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Playback enabled = %d (autoplaySettingEnabled=%d, isContentViewVisible=%d, isContextMenuInteractionActive=%d, isDragSessionActive=%d, applicationActive=%d, lowPowerModeEnabled=%d, shouldEnablePlayback=%d) for %@", (uint8_t *)v13, 0x3Cu);
  }
}

- (BOOL)isContentViewVisible
{
  return self->_isContentViewVisible;
}

- (BOOL)autoplaySettingEnabled
{
  return self->_autoplaySettingEnabled;
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  if (self->_playbackEnabled != a3)
  {
    self->_playbackEnabled = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayingRecords];
  }
}

- (BOOL)shouldCoalescePlayingRecordsUpdates
{
  return self->_shouldCoalescePlayingRecordsUpdates;
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (BOOL)isContextMenuInteractionActive
{
  return self->_isContextMenuInteractionActive;
}

- (BOOL)applicationActive
{
  return self->_applicationActive;
}

- (void)_updatePlayingRecords
{
  if ([(PXGridInlinePlaybackController *)self canUpdatePlayingRecords]
    && ([(PXGridInlinePlaybackController *)self _hasAnyPlaybackRecords]
     || [(NSMutableArray *)self->_currentlyPlayingRecords count])
    && [(PXGridInlinePlaybackController *)self canProvideGeometriesForRecords]
    && [(PXGridInlinePlaybackController *)self active])
  {
    if ([(PXGridInlinePlaybackController *)self playbackEnabled])
    {
      if ([(PXGridInlinePlaybackController *)self shouldCoalescePlayingRecordsUpdates])
      {
        id v4 = [(PXGridInlinePlaybackController *)self playingRecordsEventCoalescer];
        [v4 inputEvent];
      }
      else
      {
        [(PXGridInlinePlaybackController *)self _updatePlayingRecordsImmediately];
      }
    }
    else
    {
      [(PXGridInlinePlaybackController *)self _stopPlaybackForRecords:self->_currentlyPlayingRecords];
      currentlyPlayingRecords = self->_currentlyPlayingRecords;
      [(NSMutableArray *)currentlyPlayingRecords removeAllObjects];
    }
  }
}

- (BOOL)_hasAnyPlaybackRecords
{
  v2 = self;
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(v2) = [(NSMapTable *)v2->_lookupLock_recordsByDisplayAsset count] != 0;
  os_unfair_lock_unlock(p_lookupLock);
  return (char)v2;
}

- (void)setNeedsUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXGridInlinePlaybackController_setNeedsUpdate__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_updateActive
{
  uint64_t v3 = [(PXGridInlinePlaybackController *)self isOneUpVisible] ^ 1;
  [(PXGridInlinePlaybackController *)self setActive:v3];
}

- (BOOL)isOneUpVisible
{
  return self->_isOneUpVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingRecordsEventCoalescer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visibleRecords, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingRecords, 0);
  objc_storeStrong((id *)&self->_lookupLock_recordsByDisplayAsset, 0);
  objc_storeStrong((id *)&self->_recordsQueue, 0);
}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double top = self->_criticallyVisibleEdgeInsets.top;
  double left = self->_criticallyVisibleEdgeInsets.left;
  double bottom = self->_criticallyVisibleEdgeInsets.bottom;
  double right = self->_criticallyVisibleEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXEventCoalescer)playingRecordsEventCoalescer
{
  return self->_playingRecordsEventCoalescer;
}

- (BOOL)playbackEnabled
{
  return self->_playbackEnabled;
}

- (BOOL)canCreateRecords
{
  return self->_canCreateRecords;
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)currentRecords
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  id v4 = [(NSMapTable *)self->_lookupLock_recordsByDisplayAsset objectEnumerator];
  BOOL v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_lookupLock);
  return (NSArray *)v5;
}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  id v3 = a3;
  id v4 = +[PXCuratedLibrarySettings sharedInstance];
  if (([v4 forcePlayback] & 1) != 0 || (objc_msgSend(v4, "minAutoplaySuggestionScore"), v5 == 0.0)) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 isEligibleForAutoPlayback];
  }

  return v6;
}

- (void)_stopPlaybackForRecords:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setDesiredPlayState:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_startPlaybackForRecords:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setDesiredPlayState:1];
        [v8 setDiagnosticLog:@"▶ Playing"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_updatePlayingRecordsImmediately
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (_updatePlayingRecordsImmediately_onceToken != -1) {
    dispatch_once(&_updatePlayingRecordsImmediately_onceToken, &__block_literal_global_199170);
  }
  os_unfair_lock_t lock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  v29 = self->_visibleRecords;
  [(NSMutableArray *)v29 removeAllObjects];
  v31 = self;
  if (![(PXGridInlinePlaybackController *)self shouldPlayOnHover])
  {
    [(PXGridInlinePlaybackController *)self currentVisibleRect];
    PXRectGetCenter();
  }
  id v3 = [(PXGridInlinePlaybackController *)self currentHoveredDisplayAsset];
  uint64_t v4 = v3;
  if (v3)
  {
    lookupLock_recordsByDisplayAsset = self->_lookupLock_recordsByDisplayAsset;
    uint64_t v6 = [v3 uuid];
    uint64_t v7 = [(NSMapTable *)lookupLock_recordsByDisplayAsset objectForKey:v6];

    if (v7)
    {
      [(NSMutableArray *)v29 addObject:v7];
    }
  }

  [(NSMutableArray *)v29 sortUsingDescriptors:_updatePlayingRecordsImmediately_recordSortDescriptors];
  long long v8 = [(PXGridInlinePlaybackController *)self filterSortedRecordsToPlay:v29];
  [(NSMutableArray *)self->_currentlyPlayingRecords removeAllObjects];
  uint64_t v9 = [(PXGridInlinePlaybackController *)self maxNumberOfPlayingItems];
  if ([v8 count] && v9 >= 1)
  {
    unint64_t v10 = 1;
    do
    {
      currentlyPlayingRecords = self->_currentlyPlayingRecords;
      long long v12 = [v8 objectAtIndexedSubscript:v10 - 1];
      [(NSMutableArray *)currentlyPlayingRecords addObject:v12];

      if (v10 >= [v8 count]) {
        break;
      }
    }
    while ((uint64_t)v10++ < v9);
  }
  uint64_t v30 = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v14 = [(NSMapTable *)self->_lookupLock_recordsByDisplayAsset objectEnumerator];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        BOOL v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_currentlyPlayingRecords containsObject:v19] & 1) == 0
          && ([v19 isInvalid] & 1) == 0)
        {
          [v19 setDesiredPlayState:0];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v16);
  }

  [(PXGridInlinePlaybackController *)self _startPlaybackForRecords:self->_currentlyPlayingRecords];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v20 = [(NSMapTable *)self->_lookupLock_recordsByDisplayAsset objectEnumerator];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        BOOL v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        __int16 v26 = PLGridInlinePlaybackGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          BOOL v27 = [v25 diagnosticLog];
          buf[0] = 138412546;
          *(void *)&buf[1] = v27;
          LOWORD(buf[3]) = 2112;
          *(void *)((char *)&buf[3] + 2) = v25;
          _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)buf, 0x16u);
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v22);
  }

  [(NSMutableArray *)v29 removeAllObjects];
  os_unfair_lock_unlock(lock);
  [(PXGridInlinePlaybackController *)v31 didUpdatePlayingRecords];
}

void __66__PXGridInlinePlaybackController__updatePlayingRecordsImmediately__block_invoke()
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F29008];
  v1 = NSStringFromSelector(sel_visibilityScore);
  v2 = [v0 sortDescriptorWithKey:v1 ascending:0];
  id v3 = (void *)MEMORY[0x1E4F29008];
  uint64_t v4 = NSStringFromSelector(sel_cellSizeScore);
  uint64_t v5 = objc_msgSend(v3, "sortDescriptorWithKey:ascending:", v4, 0, v2);
  v17[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F29008];
  uint64_t v7 = NSStringFromSelector(sel_distanceToCenterScore);
  long long v8 = [v6 sortDescriptorWithKey:v7 ascending:1];
  v17[2] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F29008];
  unint64_t v10 = NSStringFromSelector(sel_videoScore);
  long long v11 = [v9 sortDescriptorWithKey:v10 ascending:0];
  v17[3] = v11;
  long long v12 = (void *)MEMORY[0x1E4F29008];
  uint64_t v13 = NSStringFromSelector(sel_curationScore);
  uint64_t v14 = [v12 sortDescriptorWithKey:v13 ascending:0];
  v17[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  uint64_t v16 = (void *)_updatePlayingRecordsImmediately_recordSortDescriptors;
  _updatePlayingRecordsImmediately_recordSortDescriptors = v15;
}

- (void)_applicationDidResignActive:(id)a3
{
}

- (void)_processInfoPowerStateDidChange:(id)a3
{
}

uint64_t __66__PXGridInlinePlaybackController__processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setNeedsUpdateOf:sel__updateLowPowerModeEnabled];
}

- (void)setIsDragSessionActive:(BOOL)a3
{
  if (self->_isDragSessionActive != a3)
  {
    self->_isDragSessionActive = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
  }
}

- (void)setIsContextMenuInteractionActive:(BOOL)a3
{
  if (self->_isContextMenuInteractionActive != a3)
  {
    self->_isContextMenuInteractionActive = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlaybackEnabled];
  }
}

- (int64_t)maxNumberOfPlayingItems
{
  v2 = +[PXCuratedLibrarySettings sharedInstance];
  int64_t v3 = [v2 maxNumberOfPlayingItems];

  return v3;
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  return a3;
}

- (void)invalidatePlayingRecords
{
}

- (BOOL)canUpdatePlayingRecords
{
  return 1;
}

- (BOOL)canPlayAsset:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  long long v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXGridInlinePlaybackController.m", 245, @"Method %s is a responsibility of subclass %@", "-[PXGridInlinePlaybackController canPlayAsset:]", v8 object file lineNumber description];

  abort();
}

- (void)invalidatePlaybackEnabled
{
}

- (BOOL)shouldEnablePlayback
{
  return 1;
}

- (BOOL)canProvideGeometriesForRecords
{
  return 1;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXGridInlinePlaybackController.m", 225, @"Method %s is a responsibility of subclass %@", "-[PXGridInlinePlaybackController frameForPlaybackRecord:minPlayableSize:]", v9 object file lineNumber description];

  abort();
}

- (PXDisplayAsset)currentHoveredDisplayAsset
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGridInlinePlaybackController.m", 221, @"Method %s is a responsibility of subclass %@", "-[PXGridInlinePlaybackController currentHoveredDisplayAsset]", v6 object file lineNumber description];

  abort();
}

- (CGRect)currentVisibleRect
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGridInlinePlaybackController.m", 217, @"Method %s is a responsibility of subclass %@", "-[PXGridInlinePlaybackController currentVisibleRect]", v6 object file lineNumber description];

  abort();
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXGridInlinePlaybackController.m", 213, @"Method %s is a responsibility of subclass %@", "-[PXGridInlinePlaybackController createPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:]", v14 object file lineNumber description];

  abort();
}

- (BOOL)isPlayingDisplayAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if ([(PXGridInlinePlaybackController *)self canPlayAsset:v4])
  {
    recordsQueue = self->_recordsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PXGridInlinePlaybackController_isPlayingDisplayAsset___block_invoke;
    block[3] = &unk_1E5DCCA20;
    block[4] = self;
    id v9 = v4;
    id v10 = &v11;
    dispatch_sync(recordsQueue, block);
  }
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __56__PXGridInlinePlaybackController_isPlayingDisplayAsset___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  int64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v2 objectForKey:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 isPlaying];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (void)checkInPlaybackRecordForDisplayAssets:(id)a3
{
  id v4 = a3;
  recordsQueue = self->_recordsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAssets___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(recordsQueue, v7);
}

void __72__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAssets___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "uuid", (void)v9);
        [v7 removeObjectForKey:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (void)checkInPlaybackRecordForDisplayAsset:(id)a3
{
  id v4 = a3;
  recordsQueue = self->_recordsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAsset___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(recordsQueue, v7);
}

void __71__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAsset___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  [v2 removeObjectForKey:v3];

  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v4);
}

- (void)willCheckInPlaybackRecordForDisplayAsset:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGridInlinePlaybackController.m", 160, @"%s must be called on the main thread", "-[PXGridInlinePlaybackController willCheckInPlaybackRecordForDisplayAsset:]");
  }
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PXGridInlinePlaybackController_willCheckInPlaybackRecordForDisplayAsset___block_invoke;
  block[3] = &unk_1E5DD32A8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(recordsQueue, block);
}

void __75__PXGridInlinePlaybackController_willCheckInPlaybackRecordForDisplayAsset___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v7 = [v2 objectForKey:v3];

  if (v7)
  {
    [v7 setIsInvalid:1];
  }
  else
  {
    id v4 = [[PXGridInlinePlaybackRecord alloc] initWithDisplayAsset:0 mediaProvider:0 geometryReference:0];
    [(PXGridInlinePlaybackRecord *)v4 setIsInvalid:1];
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    id v6 = [*(id *)(a1 + 40) uuid];
    [v5 setObject:v4 forKey:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5 configurationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(PXGridInlinePlaybackController *)self canCreateRecords]
    && [(PXGridInlinePlaybackController *)self canPlayAsset:v10]
    && [(PXGridInlinePlaybackController *)self isDisplayAssetEligibleForAutoPlayback:v10])
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__199316;
    v17[4] = __Block_byref_object_dispose__199317;
    v17[5] = 0;
    recordsQueue = self->_recordsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke;
    block[3] = &unk_1E5DC4078;
    block[4] = self;
    block[9] = v17;
    void block[5] = v10;
    block[6] = v11;
    block[7] = v12;
    block[8] = v13;
    dispatch_sync(recordsQueue, block);
    px_dispatch_on_main_queue();
  }

  return 0;
}

void __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) createPlaybackRecordForDisplayAsset:*(void *)(a1 + 40) mediaProvider:*(void *)(a1 + 48) geometryReference:*(void *)(a1 + 56)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(a1 + 64);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    id v11 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v13 = [*(id *)(a1 + 40) uuid];
    [v11 setObject:v12 forKey:v13];

    uint64_t v14 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_unlock(v14);
  }
}

uint64_t __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setNeedsUpdateOf:sel__updatePlayingRecords];
}

- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  return [(PXGridInlinePlaybackController *)self checkOutPlaybackRecordForDisplayAsset:a3 mediaProvider:a4 geometryReference:a5 configurationBlock:0];
}

- (void)dealloc
{
  PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXGridInlinePlaybackController;
  [(PXGridInlinePlaybackController *)&v3 dealloc];
}

@end