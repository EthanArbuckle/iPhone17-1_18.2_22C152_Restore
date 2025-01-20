@interface CACDisplayManager
+ (double)durationToDisplayMessageString:(id)a3;
+ (id)sharedManager;
- (BOOL)_hasModalAlert;
- (BOOL)_hasModalAlertWithTitle:(id)a3;
- (BOOL)carPlayAvailable;
- (BOOL)carPlayConnected;
- (BOOL)carPlayConnectedWirelessly;
- (BOOL)gridDidDrill;
- (BOOL)isDisplayingAnyContentView;
- (BOOL)isDisplayingAnyInteractiveContentInProcess;
- (BOOL)isDisplayingAnyOutOfProcessPresentation;
- (BOOL)isDisplayingAnyOverlay;
- (BOOL)isDisplayingAnyPresentation;
- (BOOL)isDisplayingConfirmationModalAlert;
- (BOOL)isDisplayingCorrections;
- (BOOL)isGridAtTopLevel;
- (BOOL)shouldExpandToCharacters;
- (BOOL)shouldExpandToLines;
- (BOOL)shouldExpandToWords;
- (BOOL)shouldShowTextEditingOverlayInTutorial;
- (BOOL)updateGridLayoutFromPreferences;
- (BOOL)updateGridWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4;
- (BOOL)verifyElementExists:(id)a3;
- (CACDisplayManager)init;
- (CACVoiceOverAnnouncer)voiceOverAnnouncer;
- (CARSessionStatus)sessionStatus;
- (CGPoint)defaultPortraitUpPointForGestures;
- (CGRect)reorientedRect:(CGRect)a3;
- (NSDictionary)carPlayApplications;
- (NSTimer)statusIndicatorAnimationTimer;
- (STVoiceControlStatusDomainPublisher)voiceControlStatusPublisher;
- (UIView)overlayView;
- (UIView)view;
- (_NSRange)targetOverlayRange;
- (id)_carScreenSceneManager;
- (id)_defaultScreenSceneManager;
- (id)_mainScreenSceneManager;
- (id)_sceneForModalAlerts;
- (id)_test_activeEditingOverlayElements;
- (id)_uiPresentingSceneManagers;
- (id)contactDisambiguationPresentationManager;
- (id)contextCluesPresentationManager;
- (id)correctionPresentationManager;
- (id)currentlyDisplayedCorrections:(id)a3;
- (id)currentlyDisplayedOverlayLabels:(id)a3;
- (id)customCommandEditorPresentationManager;
- (id)dictationRecognizerModeOverlayManager;
- (id)elementActionsPresentationManager;
- (id)elementNamesOverlayManager;
- (id)gestureLivePreviewPresentationOverlayManager;
- (id)gridNumberForRect:(CGRect)a3 displayID:(unsigned int)a4;
- (id)labeledElementsForGrid;
- (id)labeledElementsForItemNumbers;
- (id)labeledElementsOverlayManager;
- (id)labeledTextSegmentElements;
- (id)overlayViewForDisplayID:(unsigned int)a3;
- (int64_t)statusIndicatorType;
- (unsigned)carPlayDisplayID;
- (void)_appendCarPlayLayouts:(id)a3;
- (void)_initializeWindows;
- (void)_initializeWindowsWithScene:(id)a3;
- (void)_processCarPlayLayoutResponse:(id)a3 forVehicleID:(id)a4;
- (void)_showBannerViewWithText:(id)a3 type:(int64_t)a4;
- (void)_startVoiceControlServer;
- (void)_trackModalAlert:(id)a3;
- (void)_untrackModalAlert:(id)a3;
- (void)_updateForCurrentStatusIndicatorType;
- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5;
- (void)carPlayDidConnect:(BOOL)a3;
- (void)dealloc;
- (void)deinitializeWindowsWithScene:(id)a3;
- (void)didUpdateOrientation;
- (void)displayMessageString:(id)a3 type:(int64_t)a4;
- (void)displayMessageString:(id)a3 type:(int64_t)a4 announcementCompletion:(id)a5;
- (void)displayReadyToUseWithLanguageMessage;
- (void)enableStatusBarOverride:(BOOL)a3;
- (void)hideAnyInProcessPresentation;
- (void)hideAnyNonInteractiveOverlay;
- (void)hideAnyOverlay;
- (void)hideAnyOverlayAnimated:(BOOL)a3;
- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4;
- (void)hideAnyPresentation;
- (void)hideAnyPresentationAnimated:(BOOL)a3;
- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4;
- (void)hideContactDisambiguation;
- (void)hideCorrections;
- (void)hideDictationRecognizerModeOverlayNow;
- (void)hideLiveRecordingGesturePreview;
- (void)hideObsoletePresentationsIfNeededForElements:(id)a3;
- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 button1Text:(id)a5 button1Style:(int64_t)a6 button2Text:(id)a7 button2Style:(int64_t)a8 object:(id)a9 button1Handler:(id)a10 button2Handler:(id)a11;
- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 okButtonText:(id)a5 cancelButtonText:(id)a6 object:(id)a7 okButtonHandler:(id)a8;
- (void)refreshOverlays;
- (void)removeTrackingForFingerIdentifier:(id)a3;
- (void)resetGrid;
- (void)resetGridIdleTimer;
- (void)setCarPlayAvailable:(BOOL)a3;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCarPlayConnectedWirelessly:(BOOL)a3;
- (void)setGridDidDrill:(BOOL)a3;
- (void)setShouldShowTextEditingOverlayInTutorial:(BOOL)a3;
- (void)setStatusIndicatorAnimationTimer:(id)a3;
- (void)setStatusIndicatorType:(int64_t)a3;
- (void)setTargetOverlayRange:(_NSRange)a3;
- (void)showContactDisambiguationItems:(id)a3;
- (void)showContextCluesViewWithCommands:(id)a3;
- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4;
- (void)showCustomCommandEditorWithGesture:(id)a3;
- (void)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3;
- (void)showCustomCommandEditorWithShortcutsWorkflow:(id)a3;
- (void)showCustomCommandEditorWithTextToInsert:(id)a3;
- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4;
- (void)showLiveRecordingGesturePreview;
- (void)showOverlayForDictiationRecognizerMode;
- (void)speakVoiceOverDescriptionForActiveOverlayIfNeeded;
- (void)startShowingTransientOverlayForType:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5;
- (void)updatePreferencesFromCurrentGridLayoutForRows:(BOOL)a3 forColumns:(BOOL)a4;
- (void)updatePresentationForActiveOverlay;
- (void)willProgrammaticallySelectRange:(_NSRange)a3 forElement:(id)a4;
@end

@implementation CACDisplayManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_610);
  }
  v2 = (void *)sDisplayManager;
  return v2;
}

uint64_t __34__CACDisplayManager_sharedManager__block_invoke()
{
  uint64_t v0 = [objc_allocWithZone((Class)CACDisplayManager) init];
  v1 = (void *)sDisplayManager;
  sDisplayManager = v0;

  v2 = (void *)sDisplayManager;
  return [v2 setShouldShowTextEditingOverlayInTutorial:1];
}

+ (double)durationToDisplayMessageString:(id)a3
{
  +[CACBannerViewPresenter durationToDisplayMessageString:a3];
  return result;
}

- (void)dealloc
{
  [(STVoiceControlStatusDomainPublisher *)self->_voiceControlStatusPublisher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CACDisplayManager;
  [(CACDisplayManager *)&v3 dealloc];
}

- (void)deinitializeWindowsWithScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 session];
  v6 = [v5 role];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F83E38]];

  if (v7)
  {
    [(CACDisplayManager *)self setCarPlayAvailable:0];
    [(CACDisplayManager *)self carPlayDidConnect:0];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_sceneManagers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "scene", (void)v17);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          id v16 = v14;

          v11 = v16;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  [(NSMutableArray *)self->_sceneManagers removeObject:v11];
}

- (void)_initializeWindows
{
}

- (void)_initializeWindowsWithScene:(id)a3
{
  id v4 = a3;
  v5 = (uint64_t *)MEMORY[0x263F83E38];
  id v49 = v4;
  if (v4)
  {
    v6 = [v4 session];
    int v7 = [v6 role];
    if ([v7 isEqualToString:*MEMORY[0x263F83C68]])
    {
    }
    else
    {
      v8 = [v49 session];
      uint64_t v9 = [v8 role];
      char v10 = [v9 isEqualToString:*v5];

      id v4 = v49;
      if (v10) {
        goto LABEL_7;
      }
      v6 = [MEMORY[0x263F08B88] callStackSymbols];
      _CACAssertionFailed((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCommandAndControl/CommandAndControlFramework/DisplayManager/CACDisplayManager.m", 932, (uint64_t)"-[CACDisplayManager _initializeWindowsWithScene:]", v6, @"Attempted to initialize windows on unexpected scene: %@", v11, v12, v13, (uint64_t)v49);
    }

    id v4 = v49;
  }
LABEL_7:
  v14 = [v4 session];
  id v15 = [v14 role];
  uint64_t v16 = *v5;
  int v17 = [v15 isEqualToString:*v5];

  if (v17)
  {
    [(CACDisplayManager *)self setCarPlayAvailable:1];
    [(CACDisplayManager *)self carPlayDidConnect:1];
  }
  long long v18 = objc_alloc_init(CACSceneManager);
  [(CACSceneManager *)v18 setScene:v49];
  long long v19 = [(CACSceneManager *)v18 scene];
  long long v20 = [v19 screen];
  v21 = [MEMORY[0x263F82B60] mainScreen];
  int v22 = [v20 isEqual:v21];

  sceneManagers = self->_sceneManagers;
  if (v22) {
    [(NSMutableArray *)sceneManagers insertObject:v18 atIndex:0];
  }
  else {
    [(NSMutableArray *)sceneManagers addObject:v18];
  }
  v24 = [v49 session];
  v25 = [v24 role];
  int v26 = [v25 isEqualToString:v16];

  if (v26)
  {
    v27 = [v49 _FBSScene];
    v28 = [v27 settings];

    [v28 safeAreaInsetsPortrait];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
  }
  else
  {
    double v30 = *MEMORY[0x263F834E8];
    double v32 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v34 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v36 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  v37 = objc_alloc_init(CACContainerViewController);
  -[CACContainerViewController setAdditionalSafeAreaInsets:](v37, "setAdditionalSafeAreaInsets:", v30, v32, v34, v36);
  if (v49) {
    v38 = (void *)[objc_alloc(MEMORY[0x263F222A8]) initWithWindowScene:v49];
  }
  else {
    v38 = objc_opt_new();
  }
  v39 = v38;
  [v38 setRootViewController:v37];
  double v40 = *MEMORY[0x263F83C58];
  [v39 setWindowLevel:*MEMORY[0x263F83C58]];
  [v39 makeKeyAndVisible];
  v41 = objc_alloc_init(CACContainerViewController);
  -[CACContainerViewController setAdditionalSafeAreaInsets:](v41, "setAdditionalSafeAreaInsets:", v30, v32, v34, v36);
  if (v49) {
    v42 = (void *)[objc_alloc(MEMORY[0x263F222A0]) initWithWindowScene:v49];
  }
  else {
    v42 = objc_opt_new();
  }
  v43 = v42;
  [v42 setRootViewController:v41];
  [v43 setWindowLevel:v40 + 1.0];
  [v43 setHidden:0];
  [v43 setAccessibilityElementsHidden:1];
  [(CACSceneManager *)v18 setWindowContainerViewController:v37];
  [(CACSceneManager *)v18 setWindow:v39];
  [(CACSceneManager *)v18 setOverlayContainerViewController:v41];
  [(CACSceneManager *)v18 setOverlayWindow:v43];
  v44 = [v49 screen];
  v45 = [MEMORY[0x263F82B60] mainScreen];
  int v46 = [v44 isEqual:v45];

  if (v46)
  {
    v47 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init(MEMORY[0x263F79478]);
    layoutMonitor = self->_layoutMonitor;
    self->_layoutMonitor = v47;

    [(SBSSystemApertureLayoutMonitor *)self->_layoutMonitor addObserver:self];
  }
}

- (CACDisplayManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)CACDisplayManager;
  v2 = [(CACDisplayManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sceneManagers = v2->_sceneManagers;
    v2->_sceneManagers = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    messageDisplayOperationQueue = v2->_messageDisplayOperationQueue;
    v2->_messageDisplayOperationQueue = (NSOperationQueue *)v5;

    [(NSOperationQueue *)v2->_messageDisplayOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F30E50]) initWithOptions:0];
    sessionStatus = v2->_sessionStatus;
    v2->_sessionStatus = (CARSessionStatus *)v7;

    uint64_t v9 = [(CARSessionStatus *)v2->_sessionStatus currentSession];
    char v10 = [v9 configuration];
    v2->_carPlayConnectedWirelessly = [v10 transportType] == 3;

    uint64_t v11 = (STVoiceControlStatusDomainPublisher *)objc_alloc_init(MEMORY[0x263F7C310]);
    voiceControlStatusPublisher = v2->_voiceControlStatusPublisher;
    v2->_voiceControlStatusPublisher = v11;

    [(CACDisplayManager *)v2 _updateForCurrentStatusIndicatorType];
    [(CACDisplayManager *)v2 _startVoiceControlServer];
    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel_refreshOverlays name:@"CACSpokenCommandManagerStartedListening" object:0];

    v2->_programmaticallySelectedRange = (_NSRange)xmmword_238415D90;
  }
  return v2;
}

- (unsigned)carPlayDisplayID
{
  if (!self->_carPlayConnected) {
    return 0;
  }
  v2 = [(CACDisplayManager *)self _carScreenSceneManager];
  uint64_t v3 = [v2 scene];
  id v4 = [v3 screen];
  unsigned int v5 = [v4 _integerDisplayID];

  return v5;
}

- (NSDictionary)carPlayApplications
{
  return self->_carPlayApps;
}

- (void)_appendCarPlayLayouts:(id)a3
{
  id v4 = [(NSDictionary *)self->_carPlayApps bs_dictionaryByAddingEntriesFromDictionary:a3];
  carPlayApps = self->_carPlayApps;
  self->_carPlayApps = v4;

  id v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v6 forceSynchronizeRecognizersForBuiltInLMIdentifier:*MEMORY[0x263F78C38]];
}

- (void)_processCarPlayLayoutResponse:(id)a3 forVehicleID:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  v28 = [MEMORY[0x263EFF9A0] dictionary];
  [v5 objectForKeyedSubscript:*MEMORY[0x263F31310]];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v38;
    uint64_t v6 = *MEMORY[0x263F31298];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
              if ([v14 isEqualToString:v6])
              {
                id v15 = objc_alloc_init(MEMORY[0x263F312C8]);
                v31[0] = MEMORY[0x263EF8330];
                v31[1] = 3221225472;
                v31[2] = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke;
                v31[3] = &unk_264D12688;
                v31[4] = self;
                id v32 = v15;
                id v16 = v15;
                [v16 fetchApplicationIconInformationForBundleIdentifier:v14 vehicleID:v27 showBorder:0 completion:v31];

                goto LABEL_17;
              }
              id v16 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v14];
              int v17 = [v16 localizedNameForContext:@"Car"];
              uint64_t v18 = [v16 localizedNameForContext:0];
              long long v19 = (void *)v18;
              if (!v17)
              {
                if (!v18) {
                  goto LABEL_16;
                }
LABEL_15:
                [v28 setObject:v14 forKeyedSubscript:v19];
                goto LABEL_16;
              }
              [v28 setObject:v14 forKeyedSubscript:v17];
              if (([v17 isEqualToString:v19] & 1) == 0) {
                goto LABEL_15;
              }
LABEL_16:

LABEL_17:
              ++v13;
            }
            while (v11 != v13);
            uint64_t v20 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            uint64_t v11 = v20;
          }
          while (v20);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_3;
  block[3] = &unk_264D117C0;
  block[4] = self;
  id v30 = v28;
  id v21 = v28;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 localizedDisplayName];

  if (v4)
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_2;
    v8 = &unk_264D117C0;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    dispatch_async(MEMORY[0x263EF83A0], &v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v5, v6, v7, v8, v9);
}

void __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) localizedDisplayName];
  id v4 = v2;
  v5[0] = *MEMORY[0x263F31298];
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 _appendCarPlayLayouts:v3];
}

uint64_t __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendCarPlayLayouts:*(void *)(a1 + 40)];
}

- (void)carPlayDidConnect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  int v5 = [(CACDisplayManager *)self carPlayConnected] ^ a3;
  [(CACDisplayManager *)self setCarPlayConnected:v3];
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      self->_dictationRecognizerModeUponCarPlayConnect = [v6 dictationRecognizerMode];

      uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v7 setDictationRecognizerMode:1];

      v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v8 forceElementFetchWithReason:@"CarPlay Connected"];

      uint64_t v9 = +[CACDisplayManager sharedManager];
      [v9 hideAnyOverlayAnimated:1 includeInteractiveOverlays:1];

      id v10 = +[CACDisplayManager sharedManager];
      [v10 refreshOverlays];

      if (_AXSCommandAndControlEnabled())
      {
        uint64_t v11 = NSString;
        uint64_t v12 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.CarPlayInUse"];
        uint64_t v13 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        v14 = [v13 primaryStringForCommandIdentifier:@"System.WakeListeningIPhoneFromCarPlay"];
        id v15 = [v11 stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v16 = self->_sceneManagers;
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              if ([v21 isMainDisplayScene]) {
                [v21 showBannerViewWithText:v15 type:0];
              }
            }
            uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
          }
          while (v18);
        }
      }
    }
    int v22 = [NSDictionary dictionary];
    carPlayApps = self->_carPlayApps;
    self->_carPlayApps = v22;

    uint64_t v24 = [MEMORY[0x263F30EB0] sharedInstance];
    uint64_t v25 = [v24 connectedVehicleAccessories];
    int v26 = [v25 anyObject];

    if (v26)
    {
      id v27 = [(NSMutableArray *)v26 certificateSerialNumber];
      uint64_t v45 = MEMORY[0x263EF8330];
      uint64_t v46 = 3221225472;
      v47 = __39__CACDisplayManager_carPlayDidConnect___block_invoke;
      v48 = &unk_264D126D8;
      id v49 = self;
      CRVehicleIdentifierForCertificateSerial();
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5)
  {
    v28 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v28 setDictationRecognizerMode:self->_dictationRecognizerModeUponCarPlayConnect];

    double v29 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v29 forceElementFetchWithReason:@"CarPlay Disconnected"];
  }
  id v30 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v30 forceSynchronizeRecognizersForBuiltInLMIdentifier:*MEMORY[0x263F78C38]];

  if (_AXSCommandAndControlEnabled() && [(CACDisplayManager *)self carPlayAvailable])
  {
    double v31 = NSString;
    id v32 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ReturnedToPhone"];
    long long v33 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    long long v34 = [v33 primaryStringForCommandIdentifier:@"System.WakeListeningCarPlay"];
    uint64_t v24 = [v31 stringWithValidatedFormat:v32, @"%@", 0, v34 validFormatSpecifiers error];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v26 = self->_sceneManagers;
    uint64_t v35 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v42 != v37) {
            objc_enumerationMutation(v26);
          }
          long long v39 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          if ([v39 isMainDisplayScene]) {
            [v39 showBannerViewWithText:v24 type:0];
          }
        }
        uint64_t v36 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v36);
    }
    goto LABEL_29;
  }
LABEL_30:
  if (v5)
  {
    long long v40 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v40 carPlayConnectedDidChange];
  }
}

void __39__CACDisplayManager_carPlayDidConnect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__CACDisplayManager_carPlayDidConnect___block_invoke_cold_1((uint64_t)v6, v7);
    }
    goto LABEL_6;
  }
  if (v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F312C8]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__CACDisplayManager_carPlayDidConnect___block_invoke_655;
    v9[3] = &unk_264D126B0;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = v8;
    uint64_t v7 = v8;
    [v7 fetchIconStateForVehicleID:v10 completion:v9];

LABEL_6:
  }
}

uint64_t __39__CACDisplayManager_carPlayDidConnect___block_invoke_655(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _processCarPlayLayoutResponse:a2 forVehicleID:*(void *)(a1 + 40)];
  BOOL v3 = *(void **)(a1 + 48);
  return [v3 invalidate];
}

- (void)willProgrammaticallySelectRange:(_NSRange)a3 forElement:(id)a4
{
  length = (void *)a3.length;
  id v5 = (void *)a3.location;
  id v7 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CACDisplayManager_willProgrammaticallySelectRange_forElement___block_invoke;
  block[3] = &unk_264D12700;
  objc_copyWeak(v11, &location);
  v11[1] = v5;
  v11[2] = length;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __64__CACDisplayManager_willProgrammaticallySelectRange_forElement___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *((_OWORD *)WeakRetained + 6) = *(_OWORD *)(a1 + 48);
    id v3 = WeakRetained;
    objc_storeStrong((id *)WeakRetained + 11, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double x = *MEMORY[0x263F001A8];
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  double height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * i) CGRectValue];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        v42.origin.double x = x;
        v42.origin.double y = y;
        v42.size.double width = width;
        v42.size.double height = height;
        if (CGRectIsEmpty(v42))
        {
          double height = v20;
          double width = v18;
          double y = v16;
          double x = v14;
        }
        else
        {
          v43.origin.double x = x;
          v43.origin.double y = y;
          v43.size.double width = width;
          v43.size.double height = height;
          v47.origin.double x = v14;
          v47.origin.double y = v16;
          v47.size.double width = v18;
          v47.size.double height = v20;
          CGRect v44 = CGRectUnion(v43, v47);
          double x = v44.origin.x;
          double y = v44.origin.y;
          double width = v44.size.width;
          double height = v44.size.height;
        }
      }
      uint64_t v10 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }
  id v21 = CACLogGeneral();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v46.origin.double x = x;
    v46.origin.double y = y;
    v46.size.double width = width;
    v46.size.double height = height;
    long long v33 = NSStringFromCGRect(v46);
    *(_DWORD *)buf = 138412290;
    long long v39 = v33;
    _os_log_debug_impl(&dword_238377000, v21, OS_LOG_TYPE_DEBUG, "System aperature changed sizes. New size: %@", buf, 0xCu);
  }
  int v22 = [(CACDisplayManager *)self _mainScreenSceneManager];
  objc_msgSend(v22, "setSystemAperatureRect:", x, y, width, height);

  uint64_t v23 = [(CACDisplayManager *)self _mainScreenSceneManager];
  [v23 minimumSystemAperatureRect];
  double v25 = v24;

  int v26 = [(CACDisplayManager *)self _mainScreenSceneManager];
  [v26 minimumSystemAperatureRect];
  double v28 = v27;

  double v29 = [(CACDisplayManager *)self _mainScreenSceneManager];
  [v29 minimumSystemAperatureRect];
  IsEmptdouble y = CGRectIsEmpty(v45);

  if (IsEmpty || height < v25 || (vabdd_f64(v25, height) < 2.22044605e-16 ? (BOOL v31 = width < v28) : (BOOL v31 = 0), v31))
  {
    id v32 = [(CACDisplayManager *)self _mainScreenSceneManager];
    objc_msgSend(v32, "setMinimumSystemAperatureRect:", x, y, width, height);
  }
  [(CACDisplayManager *)self refreshOverlays];
}

- (UIView)view
{
  v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 windowContainerViewController];
  id v4 = [v3 view];

  return (UIView *)v4;
}

- (UIView)overlayView
{
  v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 overlayContainerViewController];
  id v4 = [v3 view];

  return (UIView *)v4;
}

- (void)_showBannerViewWithText:(id)a3 type:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CACDisplayManager *)self carPlayConnected])
  {
    id v7 = [(CACDisplayManager *)self _carScreenSceneManager];
    [(NSMutableArray *)v7 showBannerViewWithText:v6 type:a4];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_sceneManagers;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "showBannerViewWithText:type:", v6, a4, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)displayMessageString:(id)a3 type:(int64_t)a4
{
}

- (void)displayMessageString:(id)a3 type:(int64_t)a4 announcementCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = +[CACDisplayManager sharedManager];
  int v11 = [v10 carPlayConnected];

  if (v11)
  {
    long long v12 = CACLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_238377000, v12, OS_LOG_TYPE_INFO, "CarPlay Connected with Voice Control display message: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if ([v8 length])
    {
      if ((unint64_t)(a4 - 1) <= 2) {
        [(NSOperationQueue *)self->_messageDisplayOperationQueue cancelAllOperations];
      }
      long long v13 = [[CACMessageDisplayOperation alloc] initWithMessageString:v8 type:a4];
      long long v14 = [(NSOperationQueue *)self->_messageDisplayOperationQueue operations];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        CGFloat v16 = [(NSOperationQueue *)self->_messageDisplayOperationQueue operations];
        uint64_t v17 = [v16 lastObject];
        [(CACMessageDisplayOperation *)v13 addDependency:v17];
      }
      [(NSOperationQueue *)self->_messageDisplayOperationQueue addOperation:v13];
      BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      if (a4 != 2 && IsVoiceOverRunning)
      {
        double v19 = [(CACDisplayManager *)self voiceOverAnnouncer];
        [v19 prepareForImmediateAnnouncement];

        CGFloat v20 = [(CACDisplayManager *)self voiceOverAnnouncer];
        [v20 announceMessage:v8 type:a4 completion:v9];
      }
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)displayReadyToUseWithLanguageMessage
{
  id v13 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallFinished"];
  v2 = (void *)MEMORY[0x263EFF960];
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = [v3 bestLocaleIdentifier];
  id v5 = [v2 localeWithLocaleIdentifier:v4];

  id v6 = +[CACPreferences sharedPreferences];
  id v7 = [v6 bestLocaleIdentifier];
  id v8 = [v5 localizedStringForLocaleIdentifier:v7];

  uint64_t v9 = NSString;
  uint64_t v10 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallFinishedMultipleLanguagesFormat"];
  int v11 = [v9 stringWithValidatedFormat:v10, @"%@%@", 0, v13, v8 validFormatSpecifiers error];

  long long v12 = +[CACDisplayManager sharedManager];
  [v12 displayMessageString:v11 type:3];
}

- (id)_sceneForModalAlerts
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(CACDisplayManager *)self carPlayConnected])
  {
    uint64_t v3 = [(CACDisplayManager *)self _carScreenSceneManager];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    CGFloat v16 = self;
    id v4 = self->_sceneManagers;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 scene];
          int v11 = [v10 screen];
          long long v12 = [MEMORY[0x263F82B60] mainScreen];
          char v13 = [v11 isEqual:v12];

          if (v13)
          {
            id v14 = v9;

            goto LABEL_14;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v3 = [(NSMutableArray *)v16->_sceneManagers firstObject];
  }
  id v14 = (id)v3;
LABEL_14:
  return v14;
}

- (void)_trackModalAlert:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  modalAlerts = self->_modalAlerts;
  if (!modalAlerts)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    uint64_t v6 = self->_modalAlerts;
    self->_modalAlerts = v5;

    modalAlerts = self->_modalAlerts;
  }
  [(NSMutableSet *)modalAlerts addObject:v7];
  os_unfair_lock_unlock(&self->_modalAlertsLock);
}

- (void)_untrackModalAlert:(id)a3
{
  p_modalAlertsLock = &self->_modalAlertsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_modalAlertsLock);
  [(NSMutableSet *)self->_modalAlerts removeObject:v5];

  os_unfair_lock_unlock(p_modalAlertsLock);
}

- (BOOL)_hasModalAlert
{
  v2 = self;
  p_modalAlertsLock = &self->_modalAlertsLock;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  LOBYTE(v2) = [(NSMutableSet *)v2->_modalAlerts count] != 0;
  os_unfair_lock_unlock(p_modalAlertsLock);
  return (char)v2;
}

- (BOOL)_hasModalAlertWithTitle:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_modalAlertsLock = &self->_modalAlertsLock;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(NSMutableSet *)self->_modalAlerts allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) title];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_modalAlertsLock);
  return v7;
}

- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 okButtonText:(id)a5 cancelButtonText:(id)a6 object:(id)a7 okButtonHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke;
  block[3] = &unk_264D12750;
  id v27 = v14;
  id v28 = v15;
  double v29 = self;
  id v30 = v17;
  id v32 = v18;
  id v33 = v19;
  id v31 = v16;
  id v20 = v18;
  id v21 = v19;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F82418] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  [*(id *)(a1 + 48) _trackModalAlert:v2];
  uint64_t v3 = (void *)MEMORY[0x263F82400];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_2;
  v23[3] = &unk_264D11620;
  uint64_t v4 = *(void *)(a1 + 56);
  v23[4] = *(void *)(a1 + 48);
  id v5 = v2;
  id v24 = v5;
  uint64_t v6 = [v3 actionWithTitle:v4 style:1 handler:v23];
  [v5 addAction:v6];
  if ([*(id *)(a1 + 64) length])
  {
    uint64_t v7 = (void *)MEMORY[0x263F82400];
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_3;
    id v18 = &unk_264D12728;
    id v22 = *(id *)(a1 + 80);
    id v9 = *(id *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    id v19 = v9;
    uint64_t v20 = v10;
    id v11 = v5;
    id v21 = v11;
    long long v12 = [v7 actionWithTitle:v8 style:2 handler:&v15];
    objc_msgSend(v11, "addAction:", v12, v15, v16, v17, v18);
  }
  long long v13 = [*(id *)(a1 + 48) _sceneForModalAlerts];
  id v14 = [v13 windowContainerViewController];
  [v14 presentViewController:v5 animated:1 completion:0];
}

uint64_t __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _untrackModalAlert:*(void *)(a1 + 40)];
}

uint64_t __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  return [v3 _untrackModalAlert:v4];
}

- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 button1Text:(id)a5 button1Style:(int64_t)a6 button2Text:(id)a7 button2Style:(int64_t)a8 object:(id)a9 button1Handler:(id)a10 button2Handler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke;
  block[3] = &unk_264D12778;
  id v32 = v16;
  id v33 = v17;
  long long v34 = self;
  id v35 = v18;
  id v36 = v20;
  id v37 = v19;
  int64_t v40 = a6;
  int64_t v41 = a8;
  id v38 = v21;
  id v39 = v22;
  id v23 = v22;
  id v24 = v19;
  id v25 = v20;
  id v26 = v21;
  id v27 = v18;
  id v28 = v17;
  id v29 = v16;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F82418] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  [*(id *)(a1 + 48) _trackModalAlert:v2];
  uint64_t v3 = (void *)MEMORY[0x263F82400];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 96);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_2;
  v27[3] = &unk_264D12728;
  id v31 = *(id *)(a1 + 80);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 48);
  id v28 = v6;
  uint64_t v29 = v7;
  id v8 = v2;
  id v30 = v8;
  id v9 = [v3 actionWithTitle:v4 style:v5 handler:v27];
  [v8 addAction:v9];
  if ([*(id *)(a1 + 72) length])
  {
    uint64_t v10 = (void *)MEMORY[0x263F82400];
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 104);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_3;
    id v22 = &unk_264D12728;
    id v26 = *(id *)(a1 + 88);
    id v13 = *(id *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 48);
    id v23 = v13;
    uint64_t v24 = v14;
    id v15 = v8;
    id v25 = v15;
    id v16 = [v10 actionWithTitle:v11 style:v12 handler:&v19];
    objc_msgSend(v15, "addAction:", v16, v19, v20, v21, v22);
  }
  id v17 = [*(id *)(a1 + 48) _sceneForModalAlerts];
  id v18 = [v17 windowContainerViewController];
  [v18 presentViewController:v8 animated:1 completion:0];
}

uint64_t __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  return [v3 _untrackModalAlert:v4];
}

uint64_t __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  return [v3 _untrackModalAlert:v4];
}

- (void)startShowingTransientOverlayForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v6 = [v5 transientOverlayType];

  if (!v4 && v6 || ([v6 isEqualToString:v4] & 1) == 0) {
    [(CACDisplayManager *)self hideAnyOverlay];
  }
  uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v7 setTransientOverlayType:v4];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CACDisplayManager_startShowingTransientOverlayForType___block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__CACDisplayManager_startShowingTransientOverlayForType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePresentationForActiveOverlay];
}

- (id)overlayViewForDisplayID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_sceneManagers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(NSMutableArray **)(*((void *)&v14 + 1) + 8 * v9);
      if ([(NSMutableArray *)v10 displayID] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v10 = [(CACDisplayManager *)self _mainScreenSceneManager];
    uint64_t v5 = v10;
  }
  uint64_t v11 = [(NSMutableArray *)v10 overlayContainerViewController];
  uint64_t v12 = [v11 view];

  return v12;
}

- (BOOL)verifyElementExists:(id)a3
{
  id v3 = a3;
  [v3 centerPoint];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [v3 windowContextId];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [MEMORY[0x263F21668] systemWideElement];
    objc_msgSend(v10, "convertPoint:fromContextId:", v9, v5, v7);
    double v5 = v11;
    double v7 = v12;
  }
  id v13 = objc_msgSend(MEMORY[0x263F21668], "elementAtCoordinate:withVisualPadding:", 0, v5, v7);
  char v14 = [v13 isEqual:v3];

  return v14;
}

- (id)_uiPresentingSceneManagers
{
  id v3 = [(NSMutableArray *)self->_sceneManagers indexesOfObjectsPassingTest:&__block_literal_global_684];
  double v4 = [(NSMutableArray *)self->_sceneManagers objectsAtIndexes:v3];

  return v4;
}

uint64_t __47__CACDisplayManager__uiPresentingSceneManagers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCarPlayScene] ^ 1;
}

- (void)updatePresentationForActiveOverlay
{
  uint64_t v265 = *MEMORY[0x263EF8340];
  id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  v191 = [v3 focusedElement];

  uint64_t v4 = [v191 selectedTextRange];
  uint64_t v6 = v5;
  BOOL v7 = v5 != 0;
  uint64_t v249 = 0;
  v250 = &v249;
  uint64_t v251 = 0x2020000000;
  uint64_t v252 = 0;
  uint64_t v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v9 = [v8 disambiguationHandler];
  uint64_t v10 = [v9 labeledElements];
  uint64_t v11 = [v10 count];

  v248[0] = MEMORY[0x263EF8330];
  v248[1] = 3221225472;
  v248[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke;
  v248[3] = &unk_264D127E8;
  v248[4] = self;
  v248[5] = &v249;
  v184 = (void (**)(void))MEMORY[0x23EC8F1E0](v248);
  v245[0] = MEMORY[0x263EF8330];
  v245[1] = 3221225472;
  v245[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_3;
  v245[3] = &unk_264D12810;
  BOOL v246 = v7;
  BOOL v247 = v11 != 0;
  v245[4] = self;
  v245[5] = &v249;
  v183 = (void (**)(void))MEMORY[0x23EC8F1E0](v245);
  double v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  LODWORD(v9) = [v12 isActiveOverlayType:@"NumberedElements"];

  if (v9)
  {
    if (!v6
      || ((BOOL v13 = [(CACDisplayManager *)self isDisplayingCorrections], v11)
        ? (char v14 = 1)
        : (char v14 = v13),
          (v14 & 1) != 0))
    {
      v183[2]();
      v184[2]();
      goto LABEL_8;
    }
    v183[2]();
    v184[2]();
    if (_os_feature_enabled_impl())
    {
      if ([(CACDisplayManager *)self shouldShowTextEditingOverlayInTutorial])
      {
        v148 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        if (([v148 doesFocusedElementRequireSecureInput] & 1) == 0
          && self->_programmaticallySelectedRange.location == v4
          && self->_programmaticallySelectedRange.length == v6)
        {
          int v149 = [(AXElement *)self->_programmaticallySelectedElement isEqual:v191];

          if (!v149) {
            goto LABEL_8;
          }
          v150 = [v191 value];
          v148 = objc_msgSend(v150, "substringWithRange:", v4, v6);

          v151 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          id obja = [v148 stringByTrimmingCharactersInSet:v151];

          v152 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          [obja rangeOfCharacterFromSet:v152];
          BOOL v154 = v153 == 0;

          if (v154)
          {
            long long v239 = 0uLL;
            long long v240 = 0uLL;
            long long v237 = 0uLL;
            long long v238 = 0uLL;
            v155 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
            uint64_t v174 = [v155 countByEnumeratingWithState:&v237 objects:v263 count:16];
            if (v174)
            {
              uint64_t v175 = *(void *)v238;
              do
              {
                for (uint64_t i = 0; i != v174; ++i)
                {
                  if (*(void *)v238 != v175) {
                    objc_enumerationMutation(v155);
                  }
                  v177 = *(void **)(*((void *)&v237 + 1) + 8 * i);
                  int v178 = [v177 displayID];
                  if (v178 == [v191 windowDisplayId])
                  {
                    v179 = [v177 editingModeOverlayManager];
                    objc_msgSend(v179, "showCharactersForElement:targetRange:startIndex:", v191, v4, v6, v250[3] + 1);

                    v180 = [v177 editingModeOverlayManager];
                    v181 = [v180 overlayElements];
                    uint64_t v182 = [v181 count];
                    v250[3] += v182;
                  }
                }
                uint64_t v174 = [v155 countByEnumeratingWithState:&v237 objects:v263 count:16];
              }
              while (v174);
            }
          }
          else
          {
            long long v243 = 0uLL;
            long long v244 = 0uLL;
            long long v241 = 0uLL;
            long long v242 = 0uLL;
            v155 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
            uint64_t v156 = [v155 countByEnumeratingWithState:&v241 objects:v264 count:16];
            if (v156)
            {
              uint64_t v157 = *(void *)v242;
              do
              {
                for (uint64_t j = 0; j != v156; ++j)
                {
                  if (*(void *)v242 != v157) {
                    objc_enumerationMutation(v155);
                  }
                  v159 = *(void **)(*((void *)&v241 + 1) + 8 * j);
                  int v160 = [v159 displayID];
                  if (v160 == [v191 windowDisplayId])
                  {
                    v161 = [v159 editingModeOverlayManager];
                    objc_msgSend(v161, "showWordsForElement:targetRange:startIndex:", v191, v4, v6, v250[3] + 1);

                    v162 = [v159 editingModeOverlayManager];
                    v163 = [v162 overlayElements];
                    uint64_t v164 = [v163 count];
                    v250[3] += v164;
                  }
                }
                uint64_t v156 = [v155 countByEnumeratingWithState:&v241 objects:v264 count:16];
              }
              while (v156);
            }
          }
        }
      }
    }
  }
LABEL_8:
  long long v15 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v16 = [v15 isActiveOverlayType:@"NumberedWords"];

  if (v16)
  {
    if (_os_feature_enabled_impl()) {
      v183[2]();
    }
    v184[2]();
    long long v235 = 0u;
    long long v236 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    long long v17 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v233 objects:v262 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v234;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v234 != v19) {
            objc_enumerationMutation(v17);
          }
          id v21 = *(void **)(*((void *)&v233 + 1) + 8 * v20);
          int v22 = [v21 displayID];
          if (v22 == [v191 windowDisplayId])
          {
            id v23 = [v191 value];
            uint64_t v24 = [v191 selectedTextRange];
            uint64_t v26 = v25;
            v232[0] = 0;
            v232[1] = v232;
            v232[2] = 0x2020000000;
            v232[3] = 0;
            v231[0] = 0;
            v231[1] = v231;
            v231[2] = 0x2020000000;
            v231[3] = 0;
            if (v25 || !self->_targetOverlayRange.length || self->_targetOverlayRange.location == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v27 = [v21 editingModeOverlayManager];
              objc_msgSend(v27, "showWordsForElement:targetRange:startIndex:", v191, v24, v26, v250[3]);
            }
            else
            {
              id v27 = [v21 editingModeOverlayManager];
              objc_msgSend(v27, "showWordsForElement:targetRange:startIndex:", v191, self->_targetOverlayRange.location, self->_targetOverlayRange.length, v250[3]);
            }

            _Block_object_dispose(v231, 8);
            _Block_object_dispose(v232, 8);
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v28 = [v17 countByEnumeratingWithState:&v233 objects:v262 count:16];
        uint64_t v18 = v28;
      }
      while (v28);
    }

    uint64_t v29 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v30 = [v29 isActiveOverlayType:@"NumberedLines"];

    if (v30)
    {
      long long v229 = 0u;
      long long v230 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      id v31 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v227 objects:v261 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v228;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v228 != v33) {
              objc_enumerationMutation(v31);
            }
            id v35 = *(void **)(*((void *)&v227 + 1) + 8 * k);
            int v36 = [v35 displayID];
            if (v36 == [v191 windowDisplayId])
            {
              id v37 = [v35 linesEditingModeOverlayManager];
              objc_msgSend(v37, "showLinesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

              id v38 = [v35 editingModeOverlayManager];
              [v38 hide];
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v227 objects:v261 count:16];
        }
        while (v32);
      }
    }
    id v39 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v40 = [v39 isActiveOverlayType:@"NumberedParagraphs"];

    if (v40)
    {
      long long v225 = 0u;
      long long v226 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      int64_t v41 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v223 objects:v260 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v224;
        do
        {
          for (uint64_t m = 0; m != v42; ++m)
          {
            if (*(void *)v224 != v43) {
              objc_enumerationMutation(v41);
            }
            CGRect v45 = *(void **)(*((void *)&v223 + 1) + 8 * m);
            int v46 = [v45 displayID];
            if (v46 == [v191 windowDisplayId])
            {
              CGRect v47 = [v45 linesEditingModeOverlayManager];
              objc_msgSend(v47, "showParagraphsForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);
            }
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v223 objects:v260 count:16];
        }
        while (v42);
      }
    }
    v48 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v49 = [v48 isActiveOverlayType:@"NumberedSentences"];

    if (v49)
    {
      long long v221 = 0u;
      long long v222 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v50 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v51 = [v50 countByEnumeratingWithState:&v219 objects:v259 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v220;
        do
        {
          for (uint64_t n = 0; n != v51; ++n)
          {
            if (*(void *)v220 != v52) {
              objc_enumerationMutation(v50);
            }
            v54 = *(void **)(*((void *)&v219 + 1) + 8 * n);
            int v55 = [v54 displayID];
            if (v55 == [v191 windowDisplayId])
            {
              uint64_t v56 = [v54 linesEditingModeOverlayManager];
              objc_msgSend(v56, "showSentencesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);
            }
          }
          uint64_t v51 = [v50 countByEnumeratingWithState:&v219 objects:v259 count:16];
        }
        while (v51);
      }
    }
    v57 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v58 = [v57 isActiveOverlayType:@"NumberedLines"];

    if (v58)
    {
      long long v217 = 0u;
      long long v218 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      v59 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v60 = [v59 countByEnumeratingWithState:&v215 objects:v258 count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v216;
        do
        {
          for (iuint64_t i = 0; ii != v60; ++ii)
          {
            if (*(void *)v216 != v61) {
              objc_enumerationMutation(v59);
            }
            v63 = *(void **)(*((void *)&v215 + 1) + 8 * ii);
            int v64 = [v63 displayID];
            if (v64 == [v191 windowDisplayId])
            {
              v65 = [v63 linesEditingModeOverlayManager];
              objc_msgSend(v65, "showLinesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

              v66 = [v63 editingModeOverlayManager];
              [v66 hide];
            }
          }
          uint64_t v60 = [v59 countByEnumeratingWithState:&v215 objects:v258 count:16];
        }
        while (v60);
      }
    }
    v67 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v68 = [v67 isActiveOverlayType:@"NumberedCharacters"];

    if (v68)
    {
      v184[2]();
      long long v213 = 0u;
      long long v214 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      v69 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v70 = [v69 countByEnumeratingWithState:&v211 objects:v257 count:16];
      id obj = v69;
      if (v70)
      {
        uint64_t v71 = *(void *)v212;
        do
        {
          for (juint64_t j = 0; jj != v70; ++jj)
          {
            if (*(void *)v212 != v71) {
              objc_enumerationMutation(obj);
            }
            v73 = *(void **)(*((void *)&v211 + 1) + 8 * jj);
            int v74 = [v73 displayID];
            if (v74 == [v191 windowDisplayId])
            {
              v75 = [v191 value];
              uint64_t v76 = [v191 selectedTextRange];
              uint64_t v78 = v77;
              if (v77)
              {
                v79 = [v73 editingModeOverlayManager];
                objc_msgSend(v79, "showCharactersForElement:targetRange:startIndex:", v191, v76, v78, v250[3]);
              }
              else
              {
                uint64_t v80 = [v75 length] - v76;
                v208[0] = MEMORY[0x263EF8330];
                v208[1] = 3221225472;
                v208[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_6;
                v208[3] = &unk_264D11C18;
                v208[4] = v73;
                id v209 = v191;
                v210 = &v249;
                objc_msgSend(v75, "enumerateSubstringsInRange:options:usingBlock:", v76, v80, 3, v208);
              }
            }
          }
          uint64_t v70 = [obj countByEnumeratingWithState:&v211 objects:v257 count:16];
        }
        while (v70);
      }
LABEL_155:
    }
  }
  else
  {
    v81 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v82 = [v81 isActiveOverlayType:@"NamedElements"];

    if (v82)
    {
      v83 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      v84 = [v83 labeledScreenElementsCollection];
      id obj = [v84 collectedElements];

      long long v206 = 0u;
      long long v207 = 0u;
      long long v204 = 0u;
      long long v205 = 0u;
      id v185 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v187 = [v185 countByEnumeratingWithState:&v204 objects:v256 count:16];
      if (v187)
      {
        uint64_t v186 = *(void *)v205;
        do
        {
          for (kuint64_t k = 0; kk != v187; ++kk)
          {
            if (*(void *)v205 != v186) {
              objc_enumerationMutation(v185);
            }
            v85 = *(void **)(*((void *)&v204 + 1) + 8 * kk);
            v86 = objc_opt_new();
            long long v202 = 0u;
            long long v203 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            id v87 = obj;
            uint64_t v88 = [v87 countByEnumeratingWithState:&v200 objects:v255 count:16];
            if (v88)
            {
              uint64_t v89 = *(void *)v201;
              do
              {
                for (muint64_t m = 0; mm != v88; ++mm)
                {
                  if (*(void *)v201 != v89) {
                    objc_enumerationMutation(v87);
                  }
                  v91 = *(void **)(*((void *)&v200 + 1) + 8 * mm);
                  int v92 = [v85 displayID];
                  if (v92 == [v91 displayID])
                  {
                    int v93 = [v91 displayID];
                    v94 = [(CACDisplayManager *)self _mainScreenSceneManager];
                    BOOL v95 = v93 == [v94 displayID];

                    if (!v95) {
                      goto LABEL_102;
                    }
                    [v85 systemAperatureRect];
                    double Height = CGRectGetHeight(v266);
                    [v85 minimumSystemAperatureRect];
                    double v97 = CGRectGetHeight(v267);
                    [v85 systemAperatureRect];
                    CGFloat v99 = v98;
                    CGFloat v101 = v100;
                    CGFloat v103 = v102;
                    CGFloat v105 = v104;
                    [v91 rectangle];
                    v270.origin.double x = v106;
                    v270.origin.double y = v107;
                    v270.size.double width = v108;
                    v270.size.double height = v109;
                    v268.origin.double x = v99;
                    v268.origin.double y = v101;
                    v268.size.double width = v103;
                    v268.size.double height = v105;
                    BOOL v110 = CGRectIntersectsRect(v268, v270);
                    BOOL v111 = Height > v97 + 10.0 && v110;
                    if (!v111
                      || ([v91 element],
                          v112 = objc_claimAutoreleasedReturnValue(),
                          BOOL v113 = [(CACDisplayManager *)self verifyElementExists:v112],
                          v112,
                          v113))
                    {
LABEL_102:
                      [v86 addObject:v91];
                    }
                  }
                }
                uint64_t v88 = [v87 countByEnumeratingWithState:&v200 objects:v255 count:16];
              }
              while (v88);
            }

            [v85 systemAperatureRect];
            if (CGRectIsEmpty(v269))
            {
              v114 = v86;
            }
            else
            {
              v115 = +[CACDisplayManager sharedManager];
              v116 = [v115 _mainScreenSceneManager];
              v117 = [v116 overlayWindow];

              [v85 systemAperatureRect];
              double v122 = CACViewRectFromPortraitUpRect(v117, v118, v119, v120, v121);
              double v124 = v123;
              double v126 = v125;
              double v128 = v127;
              [v85 minimumSystemAperatureRect];
              double v133 = CACViewRectFromPortraitUpRect(v117, v129, v130, v131, v132);
              v137 = +[CACSystemAperatureBorderItem borderItemsForRect:minimumRect:](CACSystemAperatureBorderItem, "borderItemsForRect:minimumRect:", v122, v124, v126, v128, v133, v134, v135, v136);
              v114 = (void *)[v137 mutableCopy];

              [v114 addObjectsFromArray:v86];
            }
            v138 = [v85 elementNamesOverlayManager];
            [v138 showNamesForElements:v114];
          }
          uint64_t v187 = [v185 countByEnumeratingWithState:&v204 objects:v256 count:16];
        }
        while (v187);
      }

      v183[2]();
      goto LABEL_155;
    }
    v139 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v140 = [v139 isActiveOverlayType:@"NumberedGrid"];

    if (v140)
    {
      long long v198 = 0u;
      long long v199 = 0u;
      long long v196 = 0u;
      long long v197 = 0u;
      v141 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v142 = [v141 countByEnumeratingWithState:&v196 objects:v254 count:16];
      if (v142)
      {
        uint64_t v143 = *(void *)v197;
        while (2)
        {
          for (nuint64_t n = 0; nn != v142; ++nn)
          {
            if (*(void *)v197 != v143) {
              objc_enumerationMutation(v141);
            }
            v145 = *(void **)(*((void *)&v196 + 1) + 8 * nn);
            v146 = [v145 labeledGridOverlayManager];
            BOOL v147 = [v146 currentLevel] > 1;

            if (v147)
            {
              id obj = [v145 labeledGridOverlayManager];
              goto LABEL_139;
            }
          }
          uint64_t v142 = [v141 countByEnumeratingWithState:&v196 objects:v254 count:16];
          if (v142) {
            continue;
          }
          break;
        }
      }
      id obj = 0;
LABEL_139:

      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      v165 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
      uint64_t v166 = [v165 countByEnumeratingWithState:&v192 objects:v253 count:16];
      if (v166)
      {
        uint64_t v167 = 0;
        uint64_t v168 = *(void *)v193;
        do
        {
          for (uint64_t i1 = 0; i1 != v166; ++i1)
          {
            if (*(void *)v193 != v168) {
              objc_enumerationMutation(v165);
            }
            v170 = *(void **)(*((void *)&v192 + 1) + 8 * i1);
            id v171 = [v170 labeledGridOverlayManager];
            v172 = v171;
            if (!obj || v171 == obj)
            {
              if ([v171 isShowing])
              {
                if ([v172 needsToBeRedrawn]) {
                  [v172 resetAndDrawAtTopLevelWithStartingNumber:v167 + 1];
                }
              }
              else
              {
                [v172 showOverlayWithStartingNumber:v167 + 1];
              }
              v167 += [v170 numberOfLabelsForGridManager];
            }
            else
            {
              [v171 hide];
            }
          }
          uint64_t v166 = [v165 countByEnumeratingWithState:&v192 objects:v253 count:16];
        }
        while (v166);
      }

      goto LABEL_155;
    }
  }
  v173 = [MEMORY[0x263F08A00] defaultCenter];
  [v173 postNotificationName:@"SOLabeledElementsOverlayDidUpdateElementsNotification" object:0];

  [(CACDisplayManager *)self showOverlayForDictiationRecognizerMode];
  _Block_object_dispose(&v249, 8);
}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v3 = [v2 disambiguationHandler];
  if (v3)
  {
    int v22 = objc_msgSend(v3, "labeledElements", v3, v2);
  }
  else
  {
    uint64_t v4 = objc_msgSend(v2, "labeledScreenElementsCollection", 0, v2);
    int v22 = [v4 collectedElements];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [*(id *)(a1 + 32) _uiPresentingSceneManagers];
  uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v7 = a1;
        uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        uint64_t v8 = objc_opt_new();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = v22;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              int v15 = [v6 displayID];
              if (v15 == [v14 displayID]) {
                [v8 addObject:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v11);
        }

        a1 = v7;
        char v16 = [*(id *)(v7 + 32) isDisplayingCorrections];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_2;
        block[3] = &unk_264D127C0;
        void block[4] = v6;
        id v26 = v8;
        char v28 = v16;
        uint64_t v27 = v24;
        id v17 = v8;
        dispatch_async(MEMORY[0x263EF83A0], block);
        *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 24) += [v17 count];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v23);
  }
}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) labeledElementsOverlayManager];
  [v2 showLabeledElementsOverlayWithLabeledElements:*(void *)(a1 + 40) forceNoArrow:*(unsigned __int8 *)(a1 + 56) startingNumberedLabelsAtIndex:*(void *)(a1 + 48) + 1];
}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (([*(id *)(a1 + 32) isDisplayingCorrections] & 1) == 0
      && !*(unsigned char *)(a1 + 48)
      && !*(unsigned char *)(a1 + 49))
    {
      id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      char v3 = [v2 doesFocusedElementRequireSecureInput];

      if ((v3 & 1) == 0)
      {
        uint64_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        uint64_t v5 = [v4 focusedElement];

        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_uiPresentingSceneManagers", 0);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              int v12 = [v11 displayID];
              if (v12 == [v5 windowDisplayId])
              {
                BOOL v13 = [v11 linesEditingModeOverlayManager];
                objc_msgSend(v13, "showLinesForElement:targetRange:startIndex:", v5, 0x7FFFFFFFFFFFFFFFLL, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1);

                char v14 = [v11 editingModeOverlayManager];
                [v14 hideWithoutAnimation];

                int v15 = [v11 linesEditingModeOverlayManager];
                char v16 = [v15 overlayElements];
                *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v16 count];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v8);
        }
      }
    }
  }
}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v11 = [*(id *)(a1 + 32) editingModeOverlayManager];
  objc_msgSend(v11, "showCharactersForElement:targetRange:startIndex:", *(void *)(a1 + 40), a3, a4, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

  *a7 = 1;
}

- (BOOL)shouldExpandToLines
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v7 = [v6 linesEditingModeOverlayManager];
        uint64_t v8 = [v7 overlayElements];
        if ([v8 count])
        {
          uint64_t v9 = [v6 linesEditingModeOverlayManager];
          if ([v9 overlayType] == 2)
          {

LABEL_15:
            LOBYTE(v3) = 1;
            goto LABEL_16;
          }
          uint64_t v10 = [v6 linesEditingModeOverlayManager];
          uint64_t v11 = [v10 overlayType];

          if (v11 == 3) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v3;
}

- (BOOL)shouldExpandToWords
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 linesEditingModeOverlayManager];
        uint64_t v8 = [v7 overlayElements];
        if ([v8 count])
        {
          uint64_t v9 = [v6 linesEditingModeOverlayManager];
          uint64_t v10 = [v9 overlayType];

          if (v10 == 1)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldExpandToCharacters
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 editingModeOverlayManager];
        uint64_t v8 = [v7 overlayElements];
        if ([v8 count])
        {
          uint64_t v9 = [v6 linesEditingModeOverlayManager];
          uint64_t v10 = [v9 overlayType];

          if (!v10)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (id)gridNumberForRect:(CGRect)a3 displayID:(unsigned int)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v10 = +[CACDisplayManager sharedManager];
  objc_msgSend(v10, "reorientedRect:", x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    CGFloat v56 = v14;
    CGFloat v57 = v12;
    double v21 = v14 + v18 * 0.5;
    CGFloat aRect = v16;
    double v22 = v12 + v16 * 0.5;
    uint64_t v23 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v64 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v25, "displayID", *(void *)&aRect, *(void *)&v56, *(void *)&v57) == a4)
        {
          id v26 = [v25 labeledGridOverlayManager];
          uint64_t v27 = [v26 labeledElements];
          uint64_t v28 = [v27 count];

          if (!v28)
          {
            double v29 = 3.0;
            do
            {
              usleep(0x186A0u);
              long long v30 = [v26 labeledElements];
              uint64_t v31 = [v30 count];

              if (v31) {
                break;
              }
              double v29 = v29 + -0.1;
            }
            while (v29 > 0.0);
          }
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v32 = [v26 labeledElements];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v60;
LABEL_13:
            uint64_t v36 = 0;
            while (1)
            {
              if (*(void *)v60 != v35) {
                objc_enumerationMutation(v32);
              }
              id v37 = *(void **)(*((void *)&v59 + 1) + 8 * v36);
              [v37 rectangle];
              double v39 = v38;
              double v41 = v40;
              double v43 = v42;
              double v45 = v44;
              v73.double x = v22;
              v73.double y = v21;
              v75.origin.double x = v39;
              v75.origin.double y = v41;
              v75.size.double width = v43;
              v75.size.double height = v45;
              if (NSPointInRect(v73, v75)) {
                break;
              }
              if (v34 == ++v36)
              {
                uint64_t v34 = [v32 countByEnumeratingWithState:&v59 objects:v69 count:16];
                if (v34) {
                  goto LABEL_13;
                }
                goto LABEL_21;
              }
            }
            int v46 = [v37 label];
            uint64_t v47 = [v46 integerValue];

            if (v47 < 1) {
              goto LABEL_21;
            }
            int v49 = [NSNumber numberWithInteger:v47];
            v74.double x = v39 + v43 * 0.5;
            v74.double y = v41 + v45 * 0.5;
            v76.origin.double y = v56;
            v76.origin.double x = v57;
            v76.size.double width = aRect;
            v76.size.double height = v18;
            BOOL v50 = NSPointInRect(v74, v76);
            uint64_t v51 = @"NO";
            if (v50) {
              uint64_t v51 = @"YES";
            }
            v67[0] = @"number";
            v67[1] = @"isFinal";
            v68[0] = v49;
            v68[1] = v51;
            uint64_t v52 = NSDictionary;
            long long v53 = v51;
            v48 = [v52 dictionaryWithObjects:v68 forKeys:v67 count:2];

            goto LABEL_28;
          }
LABEL_21:
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  v48 = &unk_26EB4D210;
LABEL_28:

  return v48;
}

- (CGRect)reorientedRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 bounds];
  double v9 = v8;

  uint64_t v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 bounds];
  double v12 = v11;

  double v13 = width * 0.5;
  double v14 = height * 0.5;
  double v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 orientation];

  if (v16 == 3)
  {
    double v17 = v12 - y - v13;
    double y = x - v14;
  }
  else
  {
    double v18 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v19 = [v18 orientation];

    if (v19 == 4)
    {
      double v17 = v12 - y - v13;
      double v20 = v9 - x;
    }
    else
    {
      double v21 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v22 = [v21 orientation];

      if (v22 != 2)
      {
        uint64_t v23 = [MEMORY[0x263F82670] currentDevice];
        [v23 orientation];

        double v17 = x;
        goto LABEL_9;
      }
      double v17 = v9 - x - v13;
      double v20 = v12 - y;
    }
    double y = v20 - v14;
  }
LABEL_9:
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v17;
  return result;
}

- (void)speakVoiceOverDescriptionForActiveOverlayIfNeeded
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CACDisplayManager_speakVoiceOverDescriptionForActiveOverlayIfNeeded__block_invoke;
    block[3] = &unk_264D115D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __70__CACDisplayManager_speakVoiceOverDescriptionForActiveOverlayIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v3 = [v2 isActiveOverlayType:@"NumberedElements"];

  if (v3)
  {
    uint64_t v4 = +[CACVoiceOverShortDescriptionGenerator sharedInstance];
    uint64_t v5 = [*(id *)(a1 + 32) labeledElementsOverlayManager];
    uint64_t v6 = [v5 labeledElementsCopy];
    uint64_t v7 = [v4 shortDescriptionsForItems:v6 style:0];

LABEL_5:
    goto LABEL_7;
  }
  double v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v9 = [v8 isActiveOverlayType:@"NamedElements"];

  if (v9)
  {
    uint64_t v4 = [*(id *)(a1 + 32) elementNamesOverlayManager];
    uint64_t v7 = [v4 voiceOverDescriptions];
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "voiceOverAnnouncer", (void)v17);
        [v16 announceMessage:v15 type:0 completion:0];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)refreshOverlays
{
  int v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 showUIAsListening];

  if (v4)
  {
    uint64_t v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if (([v5 userIsTouching] & 1) == 0)
    {
      uint64_t v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      if (![v6 isSynchronizingRecognizers])
      {
        int v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        char v10 = [v9 isFetchingElements];

        if ((v10 & 1) == 0)
        {
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __36__CACDisplayManager_refreshOverlays__block_invoke_2;
          id v11[3] = &unk_264D115D0;
          v11[4] = self;
          uint64_t v7 = MEMORY[0x263EF83A0];
          double v8 = v11;
          goto LABEL_7;
        }
LABEL_6:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __36__CACDisplayManager_refreshOverlays__block_invoke;
        block[3] = &unk_264D115D0;
        void block[4] = self;
        uint64_t v7 = MEMORY[0x263EF83A0];
        double v8 = block;
LABEL_7:
        dispatch_async(v7, v8);
        return;
      }
    }
    goto LABEL_6;
  }
  [(CACDisplayManager *)self hideAnyOverlay];
}

uint64_t __36__CACDisplayManager_refreshOverlays__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_refreshOverlays object:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel_refreshOverlays withObject:0 afterDelay:0.25];
}

uint64_t __36__CACDisplayManager_refreshOverlays__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePresentationForActiveOverlay];
}

- (void)hideAnyOverlay
{
}

- (void)hideAnyNonInteractiveOverlay
{
}

- (void)hideAnyOverlayAnimated:(BOOL)a3
{
}

- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(CACDisplayManager *)self setGridDidDrill:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) hideAnyOverlayAnimated:v5 includeInteractiveOverlays:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)hideObsoletePresentationsIfNeededForElements:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self correctionPresentationManager];
  [v5 hideIfNeededForElements:v4];
}

- (void)hideAnyInProcessPresentation
{
}

- (void)hideAnyPresentation
{
}

- (void)hideAnyPresentationAnimated:(BOOL)a3
{
}

- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) hideAnyPresentationAnimated:v5 includingOutOfProcessPresentations:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)hideDictationRecognizerModeOverlayNow
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) hideDictationRecognizerModeOverlayNow];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isDisplayingAnyContentView
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDisplayingAnyContentView])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyPresentation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDisplayingAnyPresentation])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingCorrections
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDisplayingCorrections])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyInteractiveContentInProcess
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) isDisplayingAnyInteractiveContentInProcess])
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(CACDisplayManager *)self _hasModalAlert];
}

- (BOOL)isDisplayingAnyOutOfProcessPresentation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDisplayingAnyOutOfProcessPresentation])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyOverlay
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDisplayingAnyOverlay])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingConfirmationModalAlert
{
  uint64_t v3 = +[CACLocaleUtilities localizedUIStringForKey:@"ConfirmationAlertTitle.ExecuteThisCommand"];
  LOBYTE(self) = [(CACDisplayManager *)self _hasModalAlertWithTitle:v3];

  return (char)self;
}

- (void)didUpdateOrientation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) redrawGridIfExists];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CACDisplayManager *)self refreshOverlays];
}

- (void)enableStatusBarOverride:(BOOL)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [(CACDisplayManager *)self voiceControlStatusPublisher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = __45__CACDisplayManager_enableStatusBarOverride___block_invoke;
  long long v11 = &unk_264D12838;
  BOOL v13 = a3;
  uint64_t v7 = v5;
  uint64_t v12 = v7;
  [v6 updateDataWithBlock:&v8];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (!a3) {
    objc_msgSend(MEMORY[0x263F08B88], "sleepForTimeInterval:", 0.25, v8, v9, v10, v11);
  }
}

intptr_t __45__CACDisplayManager_enableStatusBarOverride___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setVoiceControlActive:v3];
  [v4 setListeningState:0];

  dispatch_semaphore_t v5 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v5);
}

- (void)_startVoiceControlServer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Failed to start CACVoiceControlServer %@", (uint8_t *)&v2, 0xCu);
}

- (id)currentlyDisplayedCorrections:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACDisplayManager *)self correctionPresentationManager];
  uint64_t v4 = [v3 currentlyDisplayedCorrections];
  dispatch_semaphore_t v5 = (void *)v4;
  uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v9 = +[CACVoiceControlServer _currentDisplayedCorrectionsCommand];
  BOOL v13 = @"result";
  v14[0] = v7;
  long long v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  long long v11 = (void *)[v8 initWithKey:v9 payload:v10];
  return v11;
}

- (id)currentlyDisplayedOverlayLabels:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v51;
    unint64_t v8 = 0x264D10000uLL;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        long long v11 = [*(id *)(v8 + 3416) sharedCACSpokenCommandManager];
        int v12 = [v11 isActiveOverlayType:@"NumberedElements"];

        if (v12)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          BOOL v13 = [v10 labeledElementsOverlayManager];
          uint64_t v14 = [v13 labeledElementsCopy];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v57 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                long long v20 = [v19 label];

                if (v20)
                {
                  double v21 = [v19 numberedLabel];
                  [v4 addObject:v21];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v57 count:16];
            }
            while (v16);
            goto LABEL_16;
          }
          goto LABEL_19;
        }
        uint64_t v22 = [*(id *)(v8 + 3416) sharedCACSpokenCommandManager];
        int v23 = [v22 isActiveOverlayType:@"NamedElements"];

        if (v23)
        {
          uint64_t v14 = [v10 elementNamesOverlayManager];
          double v24 = [v14 voiceOverDescriptions];
          [v4 addObjectsFromArray:v24];

          goto LABEL_19;
        }
        double v25 = [*(id *)(v8 + 3416) sharedCACSpokenCommandManager];
        int v26 = [v25 isActiveOverlayType:@"NumberedGrid"];

        if (v26)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v27 = [v10 labeledGridOverlayManager];
          uint64_t v14 = [v27 labeledElements];

          uint64_t v28 = [v14 countByEnumeratingWithState:&v42 objects:v56 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v43 != v30) {
                  objc_enumerationMutation(v14);
                }
                long long v32 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                uint64_t v33 = [v32 label];

                if (v33)
                {
                  uint64_t v34 = [v32 label];
                  [v4 addObject:v34];
                }
              }
              uint64_t v29 = [v14 countByEnumeratingWithState:&v42 objects:v56 count:16];
            }
            while (v29);
LABEL_16:
            unint64_t v8 = 0x264D10000;
          }
LABEL_19:
        }
        ++v9;
      }
      while (v9 != v6);
      uint64_t v35 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v6 = v35;
    }
    while (v35);
  }

  id v36 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v37 = +[CACVoiceControlServer _currentlyDisplayedOverlayLabelsCommand];
  v54 = @"result";
  int v55 = v4;
  double v38 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  double v39 = (void *)[v36 initWithKey:v37 payload:v38];

  return v39;
}

- (void)_updateForCurrentStatusIndicatorType
{
  int64_t v3 = [(CACDisplayManager *)self statusIndicatorType];
  if (v3 == 3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3 == 2;
  }
  uint64_t v5 = [(CACDisplayManager *)self voiceControlStatusPublisher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CACDisplayManager__updateForCurrentStatusIndicatorType__block_invoke;
  v6[3] = &__block_descriptor_40_e47_v16__0__STMutableVoiceControlStatusDomainData_8l;
  v6[4] = v4;
  [v5 updateDataWithBlock:v6];
}

uint64_t __57__CACDisplayManager__updateForCurrentStatusIndicatorType__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setListeningState:*(void *)(a1 + 32)];
}

- (void)setStatusIndicatorType:(int64_t)a3
{
  if (self->_statusIndicatorType != a3)
  {
    self->_statusIndicatorType = a3;
    [(CACDisplayManager *)self _updateForCurrentStatusIndicatorType];
  }
}

- (id)_defaultScreenSceneManager
{
  if ([(CACDisplayManager *)self carPlayConnected]) {
    [(CACDisplayManager *)self _carScreenSceneManager];
  }
  else {
  int64_t v3 = [(NSMutableArray *)self->_sceneManagers firstObject];
  }
  return v3;
}

- (id)_carScreenSceneManager
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v2 = self->_sceneManagers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x263F83E38];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "scene", (void)v15);
        long long v10 = [v9 session];
        long long v11 = [v10 role];
        char v12 = [v11 isEqual:v6];

        if (v12)
        {
          id v13 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)_mainScreenSceneManager
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v2 = self->_sceneManagers;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "scene", (void)v12);
        unint64_t v8 = [v7 screen];
        uint64_t v9 = [MEMORY[0x263F82B60] mainScreen];
        char v10 = [v8 isEqual:v9];

        if (v10)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CGPoint)defaultPortraitUpPointForGestures
{
  int v2 = [(CACDisplayManager *)self _defaultScreenSceneManager];
  id v3 = [v2 labeledGridOverlayManager];
  int v4 = [v3 isShowing];

  if (v4)
  {
    uint64_t v5 = [v2 labeledGridOverlayManager];
    [v5 portraitUpCenterPoint];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    uint64_t v5 = [v2 scene];
    char v10 = [v5 screen];
    [v10 bounds];
    AX_CGRectGetCenter();
    double v7 = v11;
    double v9 = v12;
  }
  double v13 = v7;
  double v14 = v9;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)labeledElementsOverlayManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 labeledElementsOverlayManager];

  return v3;
}

- (id)elementNamesOverlayManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 elementNamesOverlayManager];

  return v3;
}

- (id)gestureLivePreviewPresentationOverlayManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 gestureLivePreviewPresentationOverlayManager];

  return v3;
}

- (id)elementActionsPresentationManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 elementActionsPresentationManager];

  return v3;
}

- (id)correctionPresentationManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 correctionPresentationManager];

  return v3;
}

- (id)customCommandEditorPresentationManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 customCommandEditorPresentationManager];

  return v3;
}

- (id)dictationRecognizerModeOverlayManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 dictationRecognizerModeOverlayManager];

  return v3;
}

- (id)contactDisambiguationPresentationManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 contactDisambiguationPresentationManager];

  return v3;
}

- (id)contextCluesPresentationManager
{
  int v2 = [(CACDisplayManager *)self _mainScreenSceneManager];
  id v3 = [v2 contextCluesPresentationManager];

  return v3;
}

- (CACVoiceOverAnnouncer)voiceOverAnnouncer
{
  voiceOverAnnouncer = self->_voiceOverAnnouncer;
  if (!voiceOverAnnouncer)
  {
    int v4 = objc_alloc_init(CACVoiceOverAnnouncer);
    uint64_t v5 = self->_voiceOverAnnouncer;
    self->_voiceOverAnnouncer = v4;

    voiceOverAnnouncer = self->_voiceOverAnnouncer;
  }
  return voiceOverAnnouncer;
}

- (id)labeledElementsForItemNumbers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) labeledElementsOverlayManager];
        char v10 = [v9 labeledElementsCopy];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)labeledTextSegmentElements
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  int v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v5 = [v4 focusedElement];

  if (v5
    && (+[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager"), v6 = objc_claimAutoreleasedReturnValue(), [v6 disambiguationHandler], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v6, !v7))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [(CACDisplayManager *)self _uiPresentingSceneManagers];
    uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v53;
      uint64_t v9 = MEMORY[0x263EFFA68];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v53 != v40) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v42 = v11;
          uint64_t v43 = v10;
          long long v12 = [v11 editingModeOverlayManager];
          long long v13 = [v12 overlayElements];

          uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v49 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                long long v19 = [CACLabeledElement alloc];
                [v18 axFrame];
                uint64_t v20 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v19, "initWithElement:recognitionStrings:rectangle:", v5, v9);
                uint64_t v21 = [v18 range];
                int v23 = +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v21, v22);
                [(CACLabeledElement *)v20 setTextMarkerRange:v23];

                double v24 = [v18 label];
                [(CACLabeledElement *)v20 setNumberedLabel:v24];

                [v3 addObject:v20];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v15);
          }

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          double v25 = [v42 linesEditingModeOverlayManager];
          int v26 = [v25 overlayElements];

          uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v45 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                long long v32 = [CACLabeledElement alloc];
                [v31 axFrame];
                uint64_t v33 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v32, "initWithElement:recognitionStrings:rectangle:", v5, v9);
                uint64_t v34 = [v31 range];
                id v36 = +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v34, v35);
                [(CACLabeledElement *)v33 setTextMarkerRange:v36];

                uint64_t v37 = [v31 label];
                [(CACLabeledElement *)v33 setNumberedLabel:v37];

                [v3 addObject:v33];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
            }
            while (v28);
          }

          uint64_t v10 = v43 + 1;
        }
        while (v43 + 1 != v41);
        uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v41);
    }

    id v8 = v3;
  }
  else
  {
    id v8 = (id)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)labeledElementsForGrid
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) labeledGridOverlayManager];
        uint64_t v10 = [v9 labeledElements];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __87__CACDisplayManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows___block_invoke;
  v5[3] = &unk_264D12638;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  BOOL v6 = a5;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __87__CACDisplayManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = objc_msgSend(*(id *)(a1 + 32), "_uiPresentingSceneManagers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateGridLayoutWithNumberOfRows:*(void *)(a1 + 40) numberOfColumns:*(void *)(a1 + 48) shouldPreferRows:*(unsigned __int8 *)(a1 + 56) startingNumber:v5 + 1];
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)updateGridLayoutFromPreferences
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) updateGridLayoutFromPreferences];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)updatePreferencesFromCurrentGridLayoutForRows:(BOOL)a3 forColumns:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v11 = +[CACPreferences sharedPreferences];
  [v11 setGridOverlayCustomColumnsEnabled:v4];
  if (v4)
  {
    uint64_t v7 = [(CACDisplayManager *)self _mainScreenSceneManager];
    long long v8 = [v7 labeledGridOverlayManager];
    objc_msgSend(v11, "setGridOverlayCustomColumnsCount:", objc_msgSend(v8, "currentNumberOfColumns"));
  }
  [v11 setGridOverlayCustomRowsEnabled:v5];
  if (v5)
  {
    long long v9 = [(CACDisplayManager *)self _mainScreenSceneManager];
    long long v10 = [v9 labeledGridOverlayManager];
    objc_msgSend(v11, "setGridOverlayCustomRowsCount:", objc_msgSend(v10, "currentNumberOfRows"));
  }
}

- (BOOL)updateGridWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v24 = self;
  id obj = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v27)
  {
    char v25 = 0;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v12 = [v11 labeledGridOverlayManager];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v13 = [v12 labeledElements];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = [*(id *)(*((void *)&v28 + 1) + 8 * j) label];
              char v19 = [v18 isEqualToString:v9];

              if (v19)
              {
                uint64_t v20 = [v11 labeledGridOverlayManager];
                [v20 setStartingNumber:1];

                uint64_t v21 = [v11 labeledGridOverlayManager];
                char v25 = objc_msgSend(v21, "updateOverlayWithPortraitUpRect:gridContainingLabel:", v9, x, y, width, height);

                [(CACDisplayManager *)v24 setGridDidDrill:[(CACDisplayManager *)v24 gridDidDrill] ^ 1];
                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = [v11 labeledGridOverlayManager];
        [v13 hide];
LABEL_16:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v27);
  }
  else
  {
    char v25 = 0;
  }

  return v25 & 1;
}

- (void)resetGrid
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [v8 labeledGridOverlayManager];
        [v9 resetAndDrawAtTopLevelWithStartingNumber:v5 + 1];

        v5 += [v8 numberOfLabelsForGridManager];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)resetGridIdleTimer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) labeledGridOverlayManager];
        [v7 resetIdleTimer];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)isGridAtTopLevel
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v2 = [(CACDisplayManager *)self _uiPresentingSceneManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) labeledGridOverlayManager];
        uint64_t v8 = [v7 currentLevel];

        if (v8 > 1)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  if (+[CACElementActionsPresentationManager canShowElementActionsForElement:](CACElementActionsPresentationManager, "canShowElementActionsForElement:"))
  {
    BOOL v9 = [(CACDisplayManager *)self elementActionsPresentationManager];
    objc_msgSend(v9, "showElementActionsForElement:usingPortraitUpRect:", v10, x, y, width, height);
  }
  else
  {
    BOOL v9 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.NoElementActionsAvailable"];
    [(CACDisplayManager *)self displayMessageString:v9 type:0];
  }
}

- (void)showContactDisambiguationItems:(id)a3
{
  id v4 = a3;
  id v6 = [(CACDisplayManager *)self contactDisambiguationPresentationManager];
  uint64_t v5 = +[CACLocaleUtilities localizedUIStringForKey:@"DialMessage.DisambiguationTitle"];
  [v6 showWithDisambiguationItems:v4 alertTitle:v5];
}

- (void)hideContactDisambiguation
{
  id v2 = [(CACDisplayManager *)self contactDisambiguationPresentationManager];
  [v2 hideWithoutAnimation];
}

- (void)showOverlayForDictiationRecognizerMode
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v4 = [v3 focusedElement];

  if (!v4)
  {
LABEL_8:
    id v10 = (void *)MEMORY[0x263F8C6D0];
    long long v11 = [(CACDisplayManager *)self dictationRecognizerModeOverlayManager];
    [v10 cancelPreviousPerformRequestsWithTarget:v11 selector:sel_showOverlayForDictiationRecognizerMode object:0];

    id v12 = [(CACDisplayManager *)self dictationRecognizerModeOverlayManager];
    [v12 hideWithoutAnimation];
    goto LABEL_9;
  }
  if ([(CACDisplayManager *)self isDisplayingCorrections])
  {
LABEL_7:
    if (![(CACDisplayManager *)self isDisplayingCorrections]) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if (![v5 dictationRecognizerMode])
  {

    goto LABEL_7;
  }
  id v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v7 = [v6 currentInteractionLevel];

  if (v7) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)MEMORY[0x263F8C6D0];
  BOOL v9 = [(CACDisplayManager *)self dictationRecognizerModeOverlayManager];
  [v8 cancelPreviousPerformRequestsWithTarget:v9 selector:sel_showOverlayForDictiationRecognizerMode object:0];

  id v12 = [(CACDisplayManager *)self dictationRecognizerModeOverlayManager];
  [v12 performSelector:sel_showOverlayForDictiationRecognizerMode withObject:0 afterDelay:2.5];
LABEL_9:
}

- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CACDisplayManager_showCorrectionsForElement_nBestStrings___block_invoke;
  block[3] = &unk_264D11850;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CACDisplayManager_showCorrectionsForElement_nBestStrings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) correctionPresentationManager];
  [v2 showCorrectionsForElement:*(void *)(a1 + 40) nBestStrings:*(void *)(a1 + 48)];
}

- (void)hideCorrections
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CACDisplayManager_hideCorrections__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __36__CACDisplayManager_hideCorrections__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) correctionPresentationManager];
  [v1 hideAnimated:1 completion:0];
}

- (void)showCustomCommandEditorWithGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACDisplayManager *)self customCommandEditorPresentationManager];
  char v6 = [v5 showCustomCommandEditorWithGesture:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.RecordedEmptyGesture"];
    [(CACDisplayManager *)self displayMessageString:v7 type:1];
  }
}

- (void)showCustomCommandEditorWithTextToInsert:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self customCommandEditorPresentationManager];
  [v5 showCustomCommandEditorWithTextToInsert:v4];
}

- (void)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self customCommandEditorPresentationManager];
  char v6 = [v5 showCustomCommandEditorWithRecordedUserActionFlow:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.RecordedEmptyUserActionFlow"];
    [(CACDisplayManager *)self displayMessageString:v7 type:1];
  }
}

- (void)showCustomCommandEditorWithShortcutsWorkflow:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self customCommandEditorPresentationManager];
  char v6 = [v5 showCustomCommandEditorWithShortcutsWorkflow:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.MissingShortcutsWorkflow"];
    [(CACDisplayManager *)self displayMessageString:v7 type:1];
  }
}

- (void)showContextCluesViewWithCommands:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self contextCluesPresentationManager];
  [v5 showWithCommands:v4];
}

- (void)showLiveRecordingGesturePreview
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "== Showing Gesture Live Preview", v1, 2u);
}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CACDisplayManager *)self gestureLivePreviewPresentationOverlayManager];
  [v10 addPointsToLiveRecordingGesturePreviewByFingerIdentifier:v9 forces:v8 atTime:a5];
}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisplayManager *)self gestureLivePreviewPresentationOverlayManager];
  [v5 removeTrackingForFingerIdentifier:v4];
}

- (void)hideLiveRecordingGesturePreview
{
  id v2 = [(CACDisplayManager *)self gestureLivePreviewPresentationOverlayManager];
  [v2 hideAnimated:1 completion:&__block_literal_global_770];
}

void __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke()
{
  uint64_t v0 = CACLogGestureRecording();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke_cold_1(v0);
  }
}

- (id)_test_activeEditingOverlayElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_sceneManagers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "linesEditingModeOverlayManager", (void)v17);
        id v11 = [v9 editingModeOverlayManager];
        id v12 = [v10 viewController];

        if (v12)
        {
          long long v13 = [v10 overlayElements];
          [v3 addObjectsFromArray:v13];
        }
        long long v14 = [v11 viewController];

        if (v14)
        {
          uint64_t v15 = [v11 overlayElements];
          [v3 addObjectsFromArray:v15];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v3;
}

- (_NSRange)targetOverlayRange
{
  objc_copyStruct(v4, &self->_targetOverlayRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.id location = v2;
  return result;
}

- (void)setTargetOverlayRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_targetOverlayRange, &v3, 16, 1, 0);
}

- (BOOL)shouldShowTextEditingOverlayInTutorial
{
  return self->_shouldShowTextEditingOverlayInTutorial;
}

- (void)setShouldShowTextEditingOverlayInTutorial:(BOOL)a3
{
  self->_shouldShowTextEditingOverlayInTutorial = a3;
}

- (BOOL)carPlayAvailable
{
  return self->_carPlayAvailable;
}

- (void)setCarPlayAvailable:(BOOL)a3
{
  self->_carPlayAvailable = a3;
}

- (BOOL)carPlayConnected
{
  return self->_carPlayConnected;
}

- (void)setCarPlayConnected:(BOOL)a3
{
  self->_carPlayConnected = a3;
}

- (BOOL)carPlayConnectedWirelessly
{
  return self->_carPlayConnectedWirelessly;
}

- (void)setCarPlayConnectedWirelessly:(BOOL)a3
{
  self->_carPlayConnectedWirelessldouble y = a3;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (BOOL)gridDidDrill
{
  return self->_gridDidDrill;
}

- (void)setGridDidDrill:(BOOL)a3
{
  self->_gridDidDrill = a3;
}

- (NSTimer)statusIndicatorAnimationTimer
{
  return self->_statusIndicatorAnimationTimer;
}

- (void)setStatusIndicatorAnimationTimer:(id)a3
{
}

- (STVoiceControlStatusDomainPublisher)voiceControlStatusPublisher
{
  return self->_voiceControlStatusPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_programmaticallySelectedElement, 0);
  objc_storeStrong((id *)&self->_carPlayApps, 0);
  objc_storeStrong((id *)&self->_voiceControlServer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_voiceControlStatusPublisher, 0);
  objc_storeStrong((id *)&self->_voiceOverAnnouncer, 0);
  objc_storeStrong((id *)&self->_modalAlerts, 0);
  objc_storeStrong((id *)&self->_messageDisplayOperationQueue, 0);
  objc_storeStrong((id *)&self->_sceneManagers, 0);
}

void __39__CACDisplayManager_carPlayDidConnect___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Failed to get the vehicle certificate to process CarPlay layout: %@", (uint8_t *)&v2, 0xCu);
}

void __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "== Hiding Gesture Live Preview", v1, 2u);
}

@end