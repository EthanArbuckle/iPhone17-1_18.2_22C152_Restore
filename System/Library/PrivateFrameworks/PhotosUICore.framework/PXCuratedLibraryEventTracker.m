@interface PXCuratedLibraryEventTracker
- (NSString)currentAllPhotosZoomStateName;
- (PXCuratedLibraryEventTracker)initWithViewModel:(id)a3 layout:(id)a4;
- (PXCuratedLibraryEventTracker)initWithViewName:(id)a3;
- (PXCuratedLibraryLayout)layout;
- (PXCuratedLibraryViewModel)viewModel;
- (PXSectionedObjectReference)dominantObjectReference;
- (float)analysisProgress;
- (float)firstTimeExperienceAnalysisProgress;
- (int64_t)currentAllPhotosZoomStateSignpost;
- (int64_t)currentZoomLevelSignpost;
- (int64_t)currentlyViewedZoomLevel;
- (int64_t)firstTimeExperienceLibraryItemsCount;
- (int64_t)libraryItemsCount;
- (void)_configureTimerForSlowScrollRegimeUpdatesIfNeeded;
- (void)_invalidateCurrentAllPhotosZoomState;
- (void)_invalidateCurrentlyViewedZoomLevel;
- (void)_invalidateDominantObjectReference;
- (void)_invalidateFirstTimeExperienceReadinessLogging;
- (void)_logDidEndViewingAllPhotosZoomStateName:(id)a3;
- (void)_logDidEndViewingZoomLevel:(int64_t)a3;
- (void)_logDidStartViewingAllPhotosZoomStateName:(id)a3;
- (void)_logDidStartViewingZoomLevel:(int64_t)a3;
- (void)_updateCurrentAllPhotosZoomState;
- (void)_updateCurrentlyViewedZoomLevel;
- (void)_updateDominantObjectReference;
- (void)_updateFirstTimeExperienceReadinessLogging;
- (void)dealloc;
- (void)logAnalysisProgress:(float)a3;
- (void)logLibraryItemsCount:(int64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAnalysisProgress:(float)a3;
- (void)setCurrentAllPhotosZoomStateName:(id)a3;
- (void)setCurrentAllPhotosZoomStateSignpost:(int64_t)a3;
- (void)setCurrentZoomLevelSignpost:(int64_t)a3;
- (void)setCurrentlyViewedZoomLevel:(int64_t)a3;
- (void)setDominantObjectReference:(id)a3;
- (void)setFirstTimeExperienceAnalysisProgress:(float)a3;
- (void)setFirstTimeExperienceLibraryItemsCount:(int64_t)a3;
- (void)setLibraryItemsCount:(int64_t)a3;
@end

@implementation PXCuratedLibraryEventTracker

- (void)logAnalysisProgress:(float)a3
{
  if (a3 >= 0.0)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__PXCuratedLibraryEventTracker_logAnalysisProgress___block_invoke;
    v5[3] = &unk_1E5DCCD70;
    v5[4] = self;
    float v6 = a3;
    [(PXCuratedLibraryEventTracker *)self performChanges:v5];
  }
}

void __61__PXCuratedLibraryEventTracker_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _invalidateCurrentlyViewedZoomLevel];
  }
  if (*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) _invalidateCurrentAllPhotosZoomState];
  }
  if (*(unsigned char *)(a1 + 42)) {
    [*(id *)(a1 + 32) _invalidateDominantObjectReference];
  }
}

- (void)_invalidateDominantObjectReference
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDominantObjectReference];
}

- (void)_invalidateCurrentAllPhotosZoomState
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentAllPhotosZoomState];
}

- (void)_invalidateCurrentlyViewedZoomLevel
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentlyViewedZoomLevel];
}

uint64_t __52__PXCuratedLibraryEventTracker_logAnalysisProgress___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) setAnalysisProgress:a2];
}

- (void)setCurrentlyViewedZoomLevel:(int64_t)a3
{
  int64_t currentlyViewedZoomLevel = self->_currentlyViewedZoomLevel;
  if (currentlyViewedZoomLevel != a3)
  {
    if (currentlyViewedZoomLevel) {
      -[PXCuratedLibraryEventTracker _logDidEndViewingZoomLevel:](self, "_logDidEndViewingZoomLevel:");
    }
    self->_int64_t currentlyViewedZoomLevel = a3;
    if (a3) {
      [(PXCuratedLibraryEventTracker *)self _logDidStartViewingZoomLevel:a3];
    }
    [(PXCuratedLibraryEventTracker *)self _invalidateCurrentAllPhotosZoomState];
  }
}

- (void)_logDidStartViewingZoomLevel:(int64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryEventTracker *)self currentZoomLevelSignpost])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCuratedLibraryEventTracker.m", 205, @"Invalid parameter not satisfying: %@", @"self.currentZoomLevelSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  -[PXCuratedLibraryEventTracker setCurrentZoomLevelSignpost:](self, "setCurrentZoomLevelSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  float v6 = (void *)MEMORY[0x1E4F56658];
  uint64_t v7 = *MEMORY[0x1E4F56480];
  v13[0] = *MEMORY[0x1E4F56560];
  uint64_t v8 = PXCuratedLibraryAnalyticsViewNameForZoomLevel(a3);
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E4F56598];
  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost"));
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v10];
  [v6 sendEvent:v7 withPayload:v11];
}

- (int64_t)currentZoomLevelSignpost
{
  return self->_currentZoomLevelSignpost;
}

- (void)setCurrentZoomLevelSignpost:(int64_t)a3
{
  self->_currentZoomLevelSignpost = a3;
}

- (void)_updateCurrentlyViewedZoomLevel
{
  if ([(PXViewControllerEventTracker *)self isViewVisible])
  {
    id v3 = [(PXCuratedLibraryEventTracker *)self viewModel];
    uint64_t v4 = [v3 zoomLevel];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PXCuratedLibraryEventTracker *)self setCurrentlyViewedZoomLevel:v4];
}

- (void)_updateCurrentAllPhotosZoomState
{
  if ([(PXViewControllerEventTracker *)self isViewVisible]
    && [(PXCuratedLibraryEventTracker *)self currentlyViewedZoomLevel] == 4)
  {
    id v3 = [(PXCuratedLibraryEventTracker *)self viewModel];
    uint64_t v4 = [v3 zoomablePhotosViewModel];
    v5 = v4;
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    if (v4) {
      [v4 zoomState];
    }
    float v6 = 0;
    if (![v3 zoomLevelTransitionPhase] && BYTE11(v14) && !BYTE8(v14))
    {
      if ([v5 isDisplayingIndividualItems])
      {
        uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.photos.CPAnalytics.curatedLibraryAllPhotos%liColumnsDisplayed", (void)v13);
      }
      else
      {
        id v8 = [NSString alloc];
        v9[4] = v15;
        v9[5] = v16;
        uint64_t v10 = v17;
        v9[0] = v11;
        v9[1] = v12;
        v9[2] = v13;
        v9[3] = v14;
        uint64_t v7 = objc_msgSend(v8, "initWithFormat:", @"com.apple.photos.CPAnalytics.curatedLibraryAllPhotosDenseLevel%liDisplayed", objc_msgSend(v5, "denseZoomLevelForZoomState:", v9));
      }
      float v6 = (void *)v7;
    }
  }
  else
  {
    float v6 = 0;
  }
  [(PXCuratedLibraryEventTracker *)self setCurrentAllPhotosZoomStateName:v6];
}

- (void)setCurrentAllPhotosZoomStateName:(id)a3
{
  id v8 = (NSString *)a3;
  uint64_t v4 = self->_currentAllPhotosZoomStateName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      if (self->_currentAllPhotosZoomStateName) {
        -[PXCuratedLibraryEventTracker _logDidEndViewingAllPhotosZoomStateName:](self, "_logDidEndViewingAllPhotosZoomStateName:");
      }
      float v6 = (NSString *)[(NSString *)v8 copy];
      currentAllPhotosZoomStateName = self->_currentAllPhotosZoomStateName;
      self->_currentAllPhotosZoomStateName = v6;

      if (self->_currentAllPhotosZoomStateName) {
        -[PXCuratedLibraryEventTracker _logDidStartViewingAllPhotosZoomStateName:](self, "_logDidStartViewingAllPhotosZoomStateName:");
      }
    }
  }
}

- (void)_updateDominantObjectReference
{
  id v3 = [(PXCuratedLibraryEventTracker *)self viewModel];
  if ([v3 scrollRegime] || objc_msgSend(v3, "zoomLevelTransitionPhase"))
  {
    [(PXViewControllerEventTracker *)self isViewVisible];
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = [v3 zoomablePhotosViewModel];
    float v6 = v5;
    if (v5)
    {
      [v5 zoomState];
      BOOL v7 = BYTE8(v13) != 0;
    }
    else
    {
      BOOL v7 = 0;
      uint64_t v16 = 0;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
    }

    BOOL v8 = [(PXViewControllerEventTracker *)self isViewVisible];
    uint64_t v4 = 0;
    if (!v7 && v8)
    {
      v9 = [(PXCuratedLibraryEventTracker *)self layout];
      uint64_t v4 = [v9 dominantObjectReference];
    }
  }
  -[PXCuratedLibraryEventTracker setDominantObjectReference:](self, "setDominantObjectReference:", v4, v10, v11, v12, v13, v14, v15, v16);
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setDominantObjectReference:(id)a3
{
  v9 = (PXSectionedObjectReference *)a3;
  BOOL v5 = self->_dominantObjectReference;
  float v6 = v9;
  if (v5 == v9) {
    goto LABEL_10;
  }
  char v7 = [(PXSectionedObjectReference *)v9 isEqual:v5];

  if (v7) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_dominantObjectReference, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v6 = [(PXSectionedObjectReference *)v9 asset];
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    float v6 = 0;
    goto LABEL_8;
  }
  BOOL v8 = [(PXSectionedObjectReference *)v9 assetCollection];
  float v6 = 0;
LABEL_9:
  [(PXMediaViewControllerEventTracker *)self setDisplayedAsset:v6];
  [(PXMediaViewControllerEventTracker *)self setDisplayedAssetCollection:v8];

LABEL_10:
LABEL_11:
}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (int64_t)currentlyViewedZoomLevel
{
  return self->_currentlyViewedZoomLevel;
}

- (void)setCurrentAllPhotosZoomStateSignpost:(int64_t)a3
{
  self->_currentAllPhotosZoomStateSignpost = a3;
}

- (void)_logDidStartViewingAllPhotosZoomStateName:(id)a3
{
  if ([(PXCuratedLibraryEventTracker *)self currentAllPhotosZoomStateSignpost])
  {
    float v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryEventTracker.m", 263, @"Invalid parameter not satisfying: %@", @"self.currentAllPhotosZoomStateSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  uint64_t v5 = [MEMORY[0x1E4F56658] startSignpost];
  [(PXCuratedLibraryEventTracker *)self setCurrentAllPhotosZoomStateSignpost:v5];
}

- (int64_t)currentAllPhotosZoomStateSignpost
{
  return self->_currentAllPhotosZoomStateSignpost;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext == a5)
  {
    unint64_t v9 = (a4 >> 2) & 1;
    a5 = (void *)((a4 >> 13) & 1);
    LODWORD(v10) = (a4 & 0x2800) != 0;
    if ((a4 & 0x800) != 0)
    {
      [(PXCuratedLibraryEventTracker *)self _configureTimerForSlowScrollRegimeUpdatesIfNeeded];
      if (((a4 >> 2) & 1) == 0) {
        goto LABEL_10;
      }
LABEL_12:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__PXCuratedLibraryEventTracker_observable_didChange_context___block_invoke;
      v11[3] = &unk_1E5DBBE40;
      char v12 = v9;
      v11[4] = self;
      char v13 = (char)a5;
      char v14 = v10;
      [(PXCuratedLibraryEventTracker *)self performChanges:v11];
      goto LABEL_13;
    }
LABEL_9:
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if ((void *)operator|| == a5)
  {
    LOBYTE(v9) = 0;
    LOBYTE(a5) = a4 & 1;
    LODWORD(v10) = a4 & 1;
    goto LABEL_9;
  }
  if ((void *)EventTrackerObserverContext == a5)
  {
    LOBYTE(a5) = 0;
    unint64_t v10 = (a4 >> 3) & 1;
    LOBYTE(v9) = v10;
    if (((a4 >> 3) & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedLibraryEventTracker;
  [(PXMediaViewControllerEventTracker *)&v15 observable:v8 didChange:a4 context:a5];
  LOBYTE(v9) = 0;
  LOBYTE(a5) = 0;
  LODWORD(v10) = 0;
LABEL_10:
  if ((a5 & 1) != 0 || v10) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_invalidateFirstTimeExperienceReadinessLogging
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFirstTimeExperienceReadinessLogging];
}

- (void)_updateFirstTimeExperienceReadinessLogging
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_loggedFirstTimeExperience)
  {
    [(PXCuratedLibraryEventTracker *)self firstTimeExperienceAnalysisProgress];
    if (v3 >= 0.0
      && ([(PXCuratedLibraryEventTracker *)self firstTimeExperienceLibraryItemsCount] & 0x8000000000000000) == 0)
    {
      self->_loggedFirstTimeExperience = 1;
      [(PXCuratedLibraryEventTracker *)self firstTimeExperienceAnalysisProgress];
      float v5 = v4;
      int64_t v6 = [(PXCuratedLibraryEventTracker *)self firstTimeExperienceLibraryItemsCount];
      char v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v8 = [v7 integerForKey:@"LastCuratedLibraryFirstTimeExperienceReadinessLogged"];

      if (v8 < 1
        || (+[PXCuratedLibrarySettings sharedInstance],
            unint64_t v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 firstTimeExperienceAlwaysLogReadiness],
            v9,
            v10))
      {
        if (v5 <= 0.9) {
          long long v11 = @"com.apple.photos.CPAnalytics.firstTimeExperienceNotReady";
        }
        else {
          long long v11 = @"com.apple.photos.CPAnalytics.firstTimeExperienceReady";
        }
        char v12 = (void *)MEMORY[0x1E4F56658];
        char v13 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:0];
        [v12 sendEvent:v11 withPayload:v13];

        char v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v14 setInteger:1 forKey:@"LastCuratedLibraryFirstTimeExperienceReadinessLogged"];

        objc_super v15 = @"YES";
      }
      else
      {
        objc_super v15 = @"NO";
      }
      uint64_t v16 = PLUIGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = @"NO";
        if (v5 > 0.9) {
          uint64_t v17 = @"YES";
        }
        v18 = v17;
        int v19 = 138412802;
        v20 = v15;
        __int16 v21 = 2112;
        v22 = v18;
        __int16 v23 = 2048;
        int64_t v24 = v6;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryEventTracker]: FTE did log <%@> isReady <%@> for library size <%li>", (uint8_t *)&v19, 0x20u);
      }
    }
  }
}

- (int64_t)firstTimeExperienceLibraryItemsCount
{
  return self->_firstTimeExperienceLibraryItemsCount;
}

- (float)firstTimeExperienceAnalysisProgress
{
  return self->_firstTimeExperienceAnalysisProgress;
}

- (void)setAnalysisProgress:(float)a3
{
  if (self->_analysisProgress != a3)
  {
    self->_analysisProgress = a3;
    if (self->_firstTimeExperienceAnalysisProgress < 0.0)
    {
      self->_firstTimeExperienceAnalysisProgress = a3;
      [(PXCuratedLibraryEventTracker *)self _invalidateFirstTimeExperienceReadinessLogging];
    }
  }
}

- (PXCuratedLibraryEventTracker)initWithViewModel:(id)a3 layout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryEventTracker;
  unint64_t v9 = [(PXMediaViewControllerEventTracker *)&v14 initWithViewName:@"CuratedLibrary"];
  int v10 = v9;
  if (v9)
  {
    [(PXCuratedLibraryEventTracker *)v9 registerChangeObserver:v9 context:EventTrackerObserverContext];
    v10->_libraryItemsCount = -1;
    v10->_analysisProgress = -1.0;
    v10->_firstTimeExperienceAnalysisProgress = -1.0;
    v10->_firstTimeExperienceLibraryItemsCount = -1;
    objc_storeStrong((id *)&v10->_viewModel, a3);
    [(PXCuratedLibraryViewModel *)v10->_viewModel registerChangeObserver:v10 context:CuratedLibraryViewModelObserverContext];
    long long v11 = [(PXCuratedLibraryViewModel *)v10->_viewModel zoomablePhotosViewModel];
    [v11 registerChangeObserver:v10 context:operator||];

    objc_storeStrong((id *)&v10->_layout, a4);
    char v12 = [(PXUserInterfaceElementEventTracker *)v10 updater];
    [v12 addUpdateSelector:sel__updateFirstTimeExperienceReadinessLogging];
    [v12 addUpdateSelector:sel__updateCurrentlyViewedZoomLevel];
    [v12 addUpdateSelector:sel__updateCurrentAllPhotosZoomState];
    [v12 addUpdateSelector:sel__updateDominantObjectReference];
  }
  return v10;
}

uint64_t __53__PXCuratedLibraryEventTracker_logLibraryItemsCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLibraryItemsCount:*(void *)(a1 + 40)];
}

- (void)setLibraryItemsCount:(int64_t)a3
{
  if (a3 < 0)
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryEventTracker.m", 117, @"Invalid parameter not satisfying: %@", @"libraryItemsCount >= 0" object file lineNumber description];
  }
  if (self->_libraryItemsCount != a3)
  {
    self->_libraryItemsCount = a3;
    if (self->_firstTimeExperienceLibraryItemsCount < 0)
    {
      self->_firstTimeExperienceLibraryItemsCount = a3;
      [(PXCuratedLibraryEventTracker *)self _invalidateFirstTimeExperienceReadinessLogging];
    }
  }
}

- (void)logLibraryItemsCount:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PXCuratedLibraryEventTracker_logLibraryItemsCount___block_invoke;
  v3[3] = &unk_1E5DD09C8;
  v3[4] = self;
  v3[5] = a3;
  [(PXCuratedLibraryEventTracker *)self performChanges:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantObjectReference, 0);
  objc_storeStrong((id *)&self->_currentAllPhotosZoomStateName, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_slowScrollRegimeTimer, 0);
}

- (void)setFirstTimeExperienceLibraryItemsCount:(int64_t)a3
{
  self->_firstTimeExperienceLibraryItemsCount = a3;
}

- (void)setFirstTimeExperienceAnalysisProgress:(float)a3
{
  self->_firstTimeExperienceAnalysisProgress = a3;
}

- (float)analysisProgress
{
  return self->_analysisProgress;
}

- (int64_t)libraryItemsCount
{
  return self->_libraryItemsCount;
}

- (PXSectionedObjectReference)dominantObjectReference
{
  return self->_dominantObjectReference;
}

- (NSString)currentAllPhotosZoomStateName
{
  return self->_currentAllPhotosZoomStateName;
}

- (void)_configureTimerForSlowScrollRegimeUpdatesIfNeeded
{
  float v3 = [(PXCuratedLibraryEventTracker *)self viewModel];
  uint64_t v4 = [v3 scrollRegime];

  slowScrollRegimeTimer = self->_slowScrollRegimeTimer;
  if (v4 == 1)
  {
    if (!slowScrollRegimeTimer)
    {
      objc_initWeak(&location, self);
      int64_t v6 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      char v13 = __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke;
      objc_super v14 = &unk_1E5DCD920;
      objc_copyWeak(&v15, &location);
      id v7 = [v6 timerWithTimeInterval:1 repeats:&v11 block:0.45];
      id v8 = self->_slowScrollRegimeTimer;
      self->_slowScrollRegimeTimer = v7;

      unint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v11, v12, v13, v14);
      [v9 addTimer:self->_slowScrollRegimeTimer forMode:*MEMORY[0x1E4F1C4B0]];
      [v9 addTimer:self->_slowScrollRegimeTimer forMode:*MEMORY[0x1E4FB30B0]];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(NSTimer *)slowScrollRegimeTimer invalidate];
    int v10 = self->_slowScrollRegimeTimer;
    self->_slowScrollRegimeTimer = 0;
  }
}

void __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke_2;
  v6[3] = &unk_1E5DBBE18;
  objc_copyWeak(&v7, v4);
  [WeakRetained performChanges:v6];

  objc_destroyWeak(&v7);
}

void __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDominantObjectReference];
}

- (void)_logDidEndViewingAllPhotosZoomStateName:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F56658];
  id v5 = a3;
  int64_t v6 = [(PXCuratedLibraryEventTracker *)self currentAllPhotosZoomStateSignpost];
  uint64_t v7 = *MEMORY[0x1E4F56440];
  uint64_t v10 = *MEMORY[0x1E4F56580];
  v11[0] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  unint64_t v9 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v8];
  [v4 endSignpost:v6 forEventName:v7 withPayload:v9];

  [(PXCuratedLibraryEventTracker *)self setCurrentAllPhotosZoomStateSignpost:0];
}

- (void)_logDidEndViewingZoomLevel:(int64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PXCuratedLibraryAnalyticsViewNameForZoomLevel(a3);
  id v5 = (void *)MEMORY[0x1E4F56658];
  int64_t v6 = [(PXCuratedLibraryEventTracker *)self currentZoomLevelSignpost];
  uint64_t v7 = *MEMORY[0x1E4F565C0];
  uint64_t v19 = *MEMORY[0x1E4F56560];
  uint64_t v8 = v19;
  v20[0] = v4;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v10 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v9];
  [v5 endSignpost:v6 forEventName:v7 withPayload:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F56658];
  uint64_t v12 = *MEMORY[0x1E4F56488];
  uint64_t v13 = *MEMORY[0x1E4F56598];
  v17[0] = v8;
  v17[1] = v13;
  v18[0] = v4;
  objc_super v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost"));
  v18[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v16 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v15];
  [v11 sendEvent:v12 withPayload:v16];

  [(PXCuratedLibraryEventTracker *)self setCurrentZoomLevelSignpost:0];
}

- (void)dealloc
{
  [(NSTimer *)self->_slowScrollRegimeTimer invalidate];
  slowScrollRegimeTimer = self->_slowScrollRegimeTimer;
  self->_slowScrollRegimeTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryEventTracker;
  [(PXCuratedLibraryEventTracker *)&v4 dealloc];
}

- (PXCuratedLibraryEventTracker)initWithViewName:(id)a3
{
  id v5 = a3;
  int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryEventTracker.m", 80, @"%s is not available as initializer", "-[PXCuratedLibraryEventTracker initWithViewName:]");

  abort();
}

@end