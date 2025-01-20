@interface SBFloatingDockController
+ (BOOL)isFloatingDockSupported;
+ (void)initialize;
- (BOOL)_allowGestureRecognizers;
- (BOOL)_isActiveAssertionInDesiredLevel;
- (BOOL)containsPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handlePromptingUserToUninstallIcon:(id)a3 location:(id)a4;
- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockRootViewController:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isFloatingDockFullyPresented;
- (BOOL)isFloatingDockPresented;
- (BOOL)isGesturePossible;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isInvalidated;
- (BOOL)isLibraryPodIconEnabled;
- (BOOL)isPresentingFolder;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isPresentingLibraryInFloatingDockWindow;
- (BOOL)shouldShowCloseBoxForIconView:(id)a3 proposedValue:(BOOL)a4;
- (BOOL)viewMap:(id)a3 shouldRecycleView:(id)a4;
- (BOOL)wasFloatingDockPresentedByPointer;
- (CGRect)floatingDockScreenFrame;
- (CGRect)floatingDockScreenPresentationFrame;
- (NSSet)presentedIconLocations;
- (NSString)description;
- (SBApplication)requestedSuggestedApplication;
- (SBFZStackParticipant)zStackParticipant;
- (SBFailingSystemGestureRecognizer)dismissFloatingDockSystemGestureRecognizer;
- (SBFloatingDockBehaviorAssertion)activeAssertion;
- (SBFloatingDockController)initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4;
- (SBFloatingDockControllerDelegate)delegate;
- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider;
- (SBFloatingDockViewController)floatingDockViewController;
- (SBFolderController)presentedFolderController;
- (SBIconListView)suggestionsIconListView;
- (SBIconListView)userIconListView;
- (SBIndirectPanGestureRecognizer)presentFloatingDockIndirectPanGestureRecognizer;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (SBWindow)floatingDockWindow;
- (SBWindowScene)windowScene;
- (UIHoverGestureRecognizer)dismissFloatingDockHoverGestureRecognizer;
- (UIViewController)viewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)_dockProgressForHoverTranslation:(double)a3;
- (double)effectiveFloatingDockHeight;
- (double)floatingDockHeight;
- (double)floatingDockHeightForFrame:(CGRect)a3;
- (double)floatingDockViewTopMargin;
- (double)maximumDockContinuousCornerRadius;
- (double)maximumFloatingDockHeight;
- (double)minimumHomeScreenScaleForFloatingDockRootViewController:(id)a3;
- (double)preferredVerticalMargin;
- (double)translationFromFullyPresentedFrame;
- (id)_initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 recentsController:(id)a6 recentsDataStore:(id)a7 layoutStateTransitionCoordinator:(id)a8 appSuggestionManager:(id)a9 analyticsClient:(id)a10;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)floatingDockRootViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4;
- (id)foregroundLibraryContainerViewControllerForFloatingDockRootViewController:(id)a3;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewMap;
- (id)libraryContainerViewControllerForFloatingDockRootViewController:(id)a3;
- (id)recycledViewsContainerProviderForViewMap:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (unint64_t)_indexOfPointerArray:(id)a3 ofObject:(void *)a4;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
- (void)_addFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4;
- (void)_addFloatingDockWindowLevelAssertion:(id)a3;
- (void)_clearGestureAssertion;
- (void)_configureFloatingDockBehaviorAssertionForOpenFolder:(id)a3 atLevel:(unint64_t)a4;
- (void)_deriveActiveAssertion:(id *)a3 dockProgress:(double *)a4;
- (void)_dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_evaluateAssertions:(unint64_t)a3 interactive:(BOOL)a4 withCompletion:(id)a5;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleDismissFloatingDockHoverGesture:(id)a3;
- (void)_handleTransitionForFolder:(id)a3 atLevel:(unint64_t)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6;
- (void)_presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_recalculateWindowLevelForWindowLevelAssertions;
- (void)_removeFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4;
- (void)_removeFloatingDockWindowLevelAssertion:(id)a3;
- (void)_setupStateDumper;
- (void)_updateFloatingDockBehaviorAssertionsInteractive:(BOOL)a3 completion:(id)a4;
- (void)_updateFocusAssertion;
- (void)assistantDidDisappear:(id)a3;
- (void)assistantWillAppear:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissFloatingDockUsingKeyCommandIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5;
- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)floatingDockRootViewController:(id)a3 didChangeToFrame:(CGRect)a4;
- (void)floatingDockRootViewController:(id)a3 floatingDockWantsToBePresented:(BOOL)a4;
- (void)floatingDockRootViewController:(id)a3 modifyProgress:(double)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)floatingDockRootViewController:(id)a3 willChangeToHeight:(double)a4 interactive:(BOOL)a5;
- (void)floatingDockRootViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6;
- (void)floatingDockRootViewControllerDidEndPresentationTransition:(id)a3;
- (void)handlePresentFloatingDockHoverGesture:(id)a3;
- (void)iconManager:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)recycleIconView:(id)a3;
- (void)registerForWindowScene:(id)a3;
- (void)resetRecentsAndSuggestions;
- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5;
- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6;
- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)setActiveAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setRequestedSuggestedApplication:(id)a3;
- (void)setWasFloatingDockPresentedByPointer:(BOOL)a3;
- (void)setZStackParticipant:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBFloatingDockController

+ (BOOL)isFloatingDockSupported
{
  if (isFloatingDockSupported_onceToken != -1) {
    dispatch_once(&isFloatingDockSupported_onceToken, &__block_literal_global_79_0);
  }
  return isFloatingDockSupported___isFloatingDockSupported;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    SBIconLocationGroupAddLocation();
    SBIconLocationGroupAddLocation();
  }
}

- (SBFloatingDockController)initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SBMedusaDomain rootSettings];
  [v8 numberOfRecents];
  *(float *)&double v9 = v9;
  unint64_t v10 = vcvtms_u32_f32(*(float *)&v9);

  v11 = [SBRecentDisplayItemsController alloc];
  v12 = +[SBAppInteractionEventSourceManager sharedInstance];
  v13 = +[SBApplicationController sharedInstance];
  v14 = [(SBRecentDisplayItemsController *)v11 initWithRemovalPersonality:14 movePersonality:15 transitionFromSources:0 maxDisplayItems:v10 eventSource:v12 applicationController:v13];

  v15 = [[SBRecentDisplayItemsDataStore alloc] initWithRecentLayouts:0 fallbackToRecentAppLayouts:0];
  v16 = [v7 layoutStateTransitionCoordinator];
  v17 = +[SBApplicationController sharedInstance];
  v18 = +[SBAppSuggestionManager sharedInstance];
  v19 = [MEMORY[0x1E4FA5E78] sharedInstance];
  v20 = [(SBFloatingDockController *)self _initWithWindowScene:v7 homeScreenContextProvider:v6 applicationController:v17 recentsController:v14 recentsDataStore:v15 layoutStateTransitionCoordinator:v16 appSuggestionManager:v18 analyticsClient:v19];

  return v20;
}

- (id)_initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 recentsController:(id)a6 recentsDataStore:(id)a7 layoutStateTransitionCoordinator:(id)a8 appSuggestionManager:(id)a9 analyticsClient:(id)a10
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v46 = a5;
  id v47 = a6;
  id v48 = a7;
  id v18 = a8;
  id v49 = a9;
  id v50 = a10;
  v56.receiver = self;
  v56.super_class = (Class)SBFloatingDockController;
  v19 = [(SBFloatingDockController *)&v56 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_windowScene, v16);
    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v17);
    v21 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    dismissFloatingDockSystemGestureRecognizer = v20->_dismissFloatingDockSystemGestureRecognizer;
    v20->_dismissFloatingDockSystemGestureRecognizer = v21;

    [(SBFailingSystemGestureRecognizer *)v20->_dismissFloatingDockSystemGestureRecognizer setAllowedTouchTypes:&unk_1F33480A8];
    [(SBFailingSystemGestureRecognizer *)v20->_dismissFloatingDockSystemGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
    [(SBFailingSystemGestureRecognizer *)v20->_dismissFloatingDockSystemGestureRecognizer setDelegate:v20];
    v23 = [[SBFloatingDockRootViewController alloc] initWithHomeScreenContextProvider:v17 applicationController:v46 recentsController:v47 recentsDataStore:v48 appSuggestionManager:v49 layoutStateTransitionCoordinator:v18 iconViewProvider:v20 analyticsClient:v50];
    viewController = v20->_viewController;
    v20->_viewController = v23;

    [(SBFloatingDockRootViewController *)v20->_viewController loadViewIfNeeded];
    v25 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:v20 action:sel_handlePresentFloatingDockHoverGesture_ edges:4];
    presentFloatingDockIndirectPanGestureRecognizer = v20->_presentFloatingDockIndirectPanGestureRecognizer;
    v20->_presentFloatingDockIndirectPanGestureRecognizer = v25;

    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setName:@"presentFloatingDockIndirectPanGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setDelegate:v20];
    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setActivationRecognitionDistance:25.0];
    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setHysteresis:0 forInputType:35.0];
    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setHysteresis:1 forInputType:10.0];
    [(SBIndirectPanGestureRecognizer *)v20->_presentFloatingDockIndirectPanGestureRecognizer setTranslationAdjustmentBlock:&__block_literal_global_197];
    v45 = [v16 zStackResolver];
    uint64_t v27 = [v45 acquireParticipantWithIdentifier:2 delegate:v20];
    zStackParticipant = v20->_zStackParticipant;
    v20->_zStackParticipant = (SBFZStackParticipant *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v20 action:sel__handleDismissFloatingDockHoverGesture_];
    dismissFloatingDockHoverGestureRecognizer = v20->_dismissFloatingDockHoverGestureRecognizer;
    v20->_dismissFloatingDockHoverGestureRecognizer = (UIHoverGestureRecognizer *)v29;

    [(UIHoverGestureRecognizer *)v20->_dismissFloatingDockHoverGestureRecognizer setDelegate:v20];
    objc_storeWeak((id *)&v20->_layoutStateTransitionCoordinator, v18);
    [v18 addObserver:v20];
    [(SBFloatingDockRootViewController *)v20->_viewController setDelegate:v20];
    v31 = [v17 iconManager];
    [v31 addPageStateObserver:v20];
    [v31 addFolderPresentationObserver:v20];
    v32 = [v16 assistantController];
    [v32 addObserver:v20];

    objc_storeStrong((id *)&v20->_analyticsClient, a10);
    objc_initWeak(&location, v20);
    v33 = +[SBDefaults localDefaults];
    v34 = [v33 appSwitcherDefaults];

    v35 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
    v57[0] = v35;
    v36 = [NSString stringWithUTF8String:"medusaMultitaskingEnabled"];
    v57[1] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    id v38 = MEMORY[0x1E4F14428];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_2;
    v53[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v54, &location);
    id v39 = (id)[v34 observeDefaults:v37 onQueue:MEMORY[0x1E4F14428] withBlock:v53];

    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleFloatingDock"))
    {
      v40 = [(SBWindow *)[SBFloatingDockWindow alloc] initWithWindowScene:v16 role:@"SBTraitsParticipantRoleFloatingDock" debugName:@"FloatingDock"];
      [(SBFloatingDockWindow *)v40 setRootViewController:v20->_viewController];
      [(SBFloatingDockWindow *)v40 setClipsToBounds:0];
    }
    else
    {
      v40 = [(SBMainScreenActiveInterfaceOrientationWindow *)[SBOldFloatingDockWindow alloc] initWithWindowScene:v16 role:@"SBTraitsParticipantRoleFloatingDock" debugName:@"FloatingDock"];
      [(SBFloatingDockWindow *)v40 setContentViewController:v20->_viewController];
      [(SBFloatingDockWindow *)v40 setPassesTouchesThrough:1];
    }
    [(SBFloatingDockWindow *)v40 setOpaque:0];
    [(SBWindow *)v40 setHidden:0];
    [(SBFloatingDockWindow *)v40 setWindowLevel:*MEMORY[0x1E4F43F20] + 5.0 + 20.0];
    objc_storeStrong((id *)&v20->_floatingDockWindow, v40);
    [(SBFloatingDockController *)v20 _setupStateDumper];
    v41 = (void *)MEMORY[0x1E4F941F8];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_3;
    v51[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v52, &location);
    uint64_t v42 = [v41 recipeWithTitle:@"Show Sidecar app in Dock" prepareBlock:0 toggleAction:v51 cleanupBlock:0];
    testRecipe = v20->_testRecipe;
    v20->_testRecipe = (PTToggleTestRecipe *)v42;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v20->_testRecipe];
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
  return v20;
}

void __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFocusAssertion];
}

void __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v3 = +[SBApplicationController sharedInstance];
    v4 = [v3 applicationWithBundleIdentifier:@"com.apple.sidecar"];

    [WeakRetained setRequestedSuggestedApplication:v4];
  }
  else
  {
    [WeakRetained setRequestedSuggestedApplication:0];
  }
}

- (void)invalidate
{
  if (![(SBFloatingDockController *)self isInvalidated])
  {
    [(SBFloatingDockController *)self setInvalidated:1];
    focusAssertion = self->_focusAssertion;
    [(BSInvalidatable *)focusAssertion invalidate];
  }
}

- (void)dealloc
{
  id v3 = [(SBFloatingDockController *)self homeScreenContextProvider];
  v4 = [v3 iconManager];
  [v4 removePageStateObserver:self];

  v5 = [v3 iconManager];
  [v5 removeFolderPresentationObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v7 = [WeakRetained assistantController];
  [v7 removeObserver:self];

  id v8 = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  [v8 removeObserver:self];

  [(BSInvalidatable *)self->_floatingDockStateDumpHandle invalidate];
  [(BSInvalidatable *)self->_floatingDockRecursiveHitTestingStateDumpHandle invalidate];
  [(BSInvalidatable *)self->_focusAssertion invalidate];

  v9.receiver = self;
  v9.super_class = (Class)SBFloatingDockController;
  [(SBFloatingDockController *)&v9 dealloc];
}

- (BOOL)containsPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(SBFloatingDockController *)self isFloatingDockPresented]
    && [(SBFloatingDockController *)self isFloatingDockFullyPresented])
  {
    id v8 = [(SBFloatingDockRootViewController *)self->_viewController viewIfLoaded];
    objc_super v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(SBFloatingDockController *)self floatingDockScreenFrame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v22 = [v9 window];
      v23 = [v22 screen];
      v24 = [v23 fixedCoordinateSpace];
      objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v24, v15, v17, v19, v21);
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;

      v36.origin.double x = v26;
      v36.origin.double y = v28;
      v36.size.width = v30;
      v36.size.height = v32;
      v35.double x = v11;
      v35.double y = v13;
      BOOL v33 = CGRectContainsPoint(v36, v35);
    }
    else
    {
      BOOL v33 = 0;
    }
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

void __51__SBFloatingDockController_isFloatingDockSupported__block_invoke()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  isFloatingDockSupported___isFloatingDockSupported = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)isFloatingDockPresented
{
  return [(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented];
}

- (BOOL)isFloatingDockFullyPresented
{
  return [(SBFloatingDockRootViewController *)self->_viewController isFloatingDockFullyPresented];
}

- (BOOL)isLibraryPodIconEnabled
{
  return [(SBFloatingDockRootViewController *)self->_viewController isLibraryPodIconEnabled];
}

- (BOOL)isGesturePossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  char v3 = [WeakRetained gesturePossible];

  return v3;
}

- (double)maximumFloatingDockHeight
{
  [(SBFloatingDockRootViewController *)self->_viewController maximumFloatingDockHeight];
  return result;
}

- (double)maximumDockContinuousCornerRadius
{
  [(SBFloatingDockRootViewController *)self->_viewController maximumDockContinuousCornerRadius];
  return result;
}

- (double)floatingDockHeight
{
  [(SBFloatingDockRootViewController *)self->_viewController floatingDockHeight];
  return result;
}

- (double)floatingDockHeightForFrame:(CGRect)a3
{
  -[SBFloatingDockRootViewController floatingDockHeightForFrame:](self->_viewController, "floatingDockHeightForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)effectiveFloatingDockHeight
{
  [(SBFloatingDockRootViewController *)self->_viewController effectiveFloatingDockHeight];
  return result;
}

- (double)preferredVerticalMargin
{
  [(SBFloatingDockRootViewController *)self->_viewController preferredVerticalMargin];
  return result;
}

- (double)floatingDockViewTopMargin
{
  [(SBFloatingDockRootViewController *)self->_viewController floatingDockViewTopMargin];
  return result;
}

- (double)translationFromFullyPresentedFrame
{
  [(SBFloatingDockRootViewController *)self->_viewController translationFromFullyPresentedFrame];
  return result;
}

- (CGRect)floatingDockScreenFrame
{
  [(SBFloatingDockRootViewController *)self->_viewController floatingDockScreenFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  [(SBFloatingDockRootViewController *)self->_viewController floatingDockScreenPresentationFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return [(SBFloatingDockRootViewController *)self->_viewController legibilitySettings];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (BOOL)isPresentingLibraryInFloatingDockWindow
{
  double v3 = [(SBFloatingDockController *)self floatingDockViewController];
  if ([v3 isPresentingLibrary])
  {
    double v4 = [(SBFloatingDockController *)self windowScene];
    double v5 = [v4 modalLibraryController];
    id v6 = [v5 libraryViewController];
    id v7 = [v6 parentViewController];
    BOOL v8 = v7 == self->_viewController;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentingFolder
{
  return [(SBFloatingDockRootViewController *)self->_viewController isPresentingFolder];
}

- (SBFolderController)presentedFolderController
{
  return [(SBFloatingDockRootViewController *)self->_viewController presentedFolderController];
}

- (SBIconListView)userIconListView
{
  return [(SBFloatingDockRootViewController *)self->_viewController userIconListView];
}

- (SBIconListView)suggestionsIconListView
{
  return [(SBFloatingDockRootViewController *)self->_viewController suggestionsIconListView];
}

- (SBFloatingDockViewController)floatingDockViewController
{
  [(SBFloatingDockRootViewController *)self->_viewController loadViewIfNeeded];
  viewController = self->_viewController;
  return [(SBFloatingDockRootViewController *)viewController floatingDockViewController];
}

- (SBApplication)requestedSuggestedApplication
{
  return [(SBFloatingDockRootViewController *)self->_viewController requestedSuggestedApplication];
}

- (void)setRequestedSuggestedApplication:(id)a3
{
}

- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([(SBFloatingDockController *)self _canPresentFloatingDock])
  {
    [(SBFloatingDockController *)self setWasFloatingDockPresentedByPointer:0];
    [(SBFloatingDockController *)self _presentFloatingDockIfDismissedAnimated:v4 completionHandler:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)dismissFloatingDockUsingKeyCommandIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(SBFloatingDockController *)self homeScreenContextProvider];
  id v7 = [v6 iconManager];
  if ([v7 areAnyIconShareSheetsShowing]) {
    [v7 dismissIconShareSheets];
  }
  [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:v4 completionHandler:v8];
}

- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  double v10 = (void (**)(id, void))a4;
  id v6 = [(SBFloatingDockController *)self homeScreenContextProvider];
  id v7 = [v6 iconManager];
  if (!self->_homeScreenTodayViewTransitioning)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    if ([WeakRetained gesturePossible])
    {
      char v9 = [v7 areAnyIconShareSheetsShowing];

      if ((v9 & 1) == 0)
      {
        [(SBFloatingDockController *)self setWasFloatingDockPresentedByPointer:0];
        if ([v6 areAnyIconViewContextMenusShowing]) {
          [v6 dismissAppIconForceTouchControllers:0];
        }
        [(SBFloatingDockController *)self _dismissFloatingDockIfPresentedAnimated:v4 completionHandler:v10];
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (v10) {
    v10[2](v10, 0);
  }
LABEL_10:
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController iconViewForIcon:a3 location:a4];
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController firstIconViewForIcon:a3 inLocations:a4];
}

- (id)firstIconViewForIcon:(id)a3
{
  return [(SBFloatingDockRootViewController *)self->_viewController firstIconViewForIcon:a3];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController firstIconViewForIcon:a3 excludingLocations:a4];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController isDisplayingIcon:a3 inLocation:a4];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController isDisplayingIcon:a3 inLocations:a4];
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return [(SBFloatingDockRootViewController *)self->_viewController isDisplayingIconView:a3];
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return [(SBFloatingDockRootViewController *)self->_viewController isDisplayingIconView:a3 inLocation:a4];
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return [(SBFloatingDockRootViewController *)self->_viewController isDisplayingIcon:a3];
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [(SBFloatingDockRootViewController *)self->_viewController isPresentingIconLocation:a3];
}

- (NSSet)presentedIconLocations
{
  return [(SBFloatingDockRootViewController *)self->_viewController presentedIconLocations];
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
}

- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
}

- (BOOL)shouldShowCloseBoxForIconView:(id)a3 proposedValue:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 location];
  if ([v7 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
  {
    id v8 = [v6 continuityInfo];

    if (v8)
    {
      a4 = 0;
    }
    else
    {
      char v9 = [v6 icon];
      double v10 = [v9 applicationBundleID];
      CGFloat v11 = [(SBFloatingDockController *)self requestedSuggestedApplication];
      double v12 = [v11 bundleIdentifier];
      char v13 = [v10 isEqualToString:v12];

      a4 = v13 ^ 1;
    }
  }

  return a4;
}

- (BOOL)handlePromptingUserToUninstallIcon:(id)a3 location:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"];
  if (v6)
  {
    id v7 = [v5 application];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v18 = @"SBFloatingDockSuggestionsDeletedNotificationBundleIdentifierKey";
      char v9 = (void *)MEMORY[0x1E4F1CAD0];
      double v10 = [v7 bundleIdentifier];
      CGFloat v11 = objc_msgSend(v9, "setWithObjects:", v10, 0);
      v19[0] = v11;
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v8 postNotificationName:@"SBFloatingDockSuggestionsDeletedNotification" object:0 userInfo:v12];
    }
    else
    {
      if (![v5 isBookmarkIcon])
      {
LABEL_7:

        goto LABEL_8;
      }
      id v8 = [v5 webClip];
      char v13 = [v8 identifier];
      double v10 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v13];

      CGFloat v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v10, 0, @"SBFloatingDockSuggestionsDeletedNotificationWebAppIdentifierKey");
      double v17 = v12;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [v11 postNotificationName:@"SBFloatingDockSuggestionsDeletedNotification" object:0 userInfo:v14];
    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)resetRecentsAndSuggestions
{
  id v2 = [(SBFloatingDockRootViewController *)self->_viewController suggestionsModel];
  [v2 resetRecentsAndSuggestions];
}

- (void)_addFloatingDockWindowLevelAssertion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = &self->super.isa + [v4 priority];
  Class v7 = v5[16];
  int v6 = (id *)(v5 + 16);
  id v8 = v7;
  if (!v8)
  {
    id v8 = (objc_class *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:517];
    objc_storeStrong(v6, v8);
  }
  char v9 = SBLogDock();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "adding floating dock window level assertion: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [(objc_class *)v8 addPointer:v4];
  [(SBFloatingDockController *)self _recalculateWindowLevelForWindowLevelAssertions];
}

- (void)_removeFloatingDockWindowLevelAssertion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 priority];
  floatingDockWindowLevelAssertionsByPrioritdouble y = self->_floatingDockWindowLevelAssertionsByPriority;
  Class v7 = self->_floatingDockWindowLevelAssertionsByPriority[v5];
  if (v7)
  {
    unint64_t v8 = [(SBFloatingDockController *)self _indexOfPointerArray:v7 ofObject:v4];
    char v9 = SBLogDock();
    int v10 = v9;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBFloatingDockController _removeFloatingDockWindowLevelAssertion:]((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543362;
        id v26 = v4;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "removing floating dock window level assertion: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      [(NSPointerArray *)v7 removePointerAtIndex:v8];
      if (![(NSPointerArray *)v7 count])
      {
        v24 = floatingDockWindowLevelAssertionsByPriority[v5];
        floatingDockWindowLevelAssertionsByPriority[v5] = 0;
      }
      [(SBFloatingDockController *)self _recalculateWindowLevelForWindowLevelAssertions];
    }
  }
  else
  {
    double v17 = SBLogDock();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBFloatingDockController _removeFloatingDockWindowLevelAssertion:]((uint64_t)v4, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_clearGestureAssertion
{
  activeGestureFloatingDockBehaviorAssertion = self->_activeGestureFloatingDockBehaviorAssertion;
  if (activeGestureFloatingDockBehaviorAssertion)
  {
    self->_activeGestureFloatingDockBehaviorAssertion = 0;

    id v4 = self->_floatingDockBehaviorAssertionsByLevel[11];
    self->_floatingDockBehaviorAssertionsByLevel[11] = 0;
  }
}

- (void)_addFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = &self->super.isa + [v6 level];
  Class v10 = v8[3];
  char v9 = (id *)(v8 + 3);
  uint64_t v11 = v10;
  if (!v11)
  {
    uint64_t v11 = (objc_class *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:517];
    objc_storeStrong(v9, v11);
  }
  uint64_t v12 = SBLogDock();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "adding floating dock behavior assertion: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  [(objc_class *)v11 addPointer:v6];
  [(SBFloatingDockController *)self _clearGestureAssertion];
  [(SBFloatingDockController *)self _evaluateAssertions:0 interactive:0 withCompletion:v7];
}

- (void)_removeFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 level];
  floatingDockBehaviorAssertionsByLevel = self->_floatingDockBehaviorAssertionsByLevel;
  Class v10 = self->_floatingDockBehaviorAssertionsByLevel[v8];
  if (v10)
  {
    unint64_t v11 = [(SBFloatingDockController *)self _indexOfPointerArray:v10 ofObject:v6];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v12 = v11;
      int v13 = SBLogDock();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        id v23 = v6;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "removing floating dock behavior assertion: %{public}@", (uint8_t *)&v22, 0xCu);
      }

      [(NSPointerArray *)v10 removePointerAtIndex:v12];
      if (![(NSPointerArray *)v10 count])
      {
        id v14 = floatingDockBehaviorAssertionsByLevel[v8];
        floatingDockBehaviorAssertionsByLevel[v8] = 0;
      }
      [(SBFloatingDockController *)self _clearGestureAssertion];
    }
  }
  else
  {
    uint64_t v15 = SBLogDock();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBFloatingDockController _removeFloatingDockBehaviorAssertion:withCompletion:]((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  [(SBFloatingDockController *)self _evaluateAssertions:1 interactive:0 withCompletion:v7];
}

- (void)_updateFloatingDockBehaviorAssertionsInteractive:(BOOL)a3 completion:(id)a4
{
}

- (unint64_t)_indexOfPointerArray:(id)a3 ofObject:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    while ((void *)[v5 pointerAtIndex:v8] != a4)
    {
      if (v7 == ++v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)_deriveActiveAssertion:(id *)a3 dockProgress:(double *)a4
{
  unint64_t v6 = 0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  floatingDockBehaviorAssertionsByLevel = self->_floatingDockBehaviorAssertionsByLevel;
  uint64_t v7 = &stru_1F3084718;
  do
  {
    unint64_t v8 = floatingDockBehaviorAssertionsByLevel[v6];
    char v9 = v8;
    id v23 = v7;
    unint64_t v24 = v6;
    if (v8)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        int v13 = &stru_1F3084718;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            uint64_t v15 = v13;
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            int v13 = [NSString stringWithFormat:@"assertion: %@", v16];

            if (v16)
            {
              if (a4)
              {
                [v16 progress];
                *(void *)a4 = v17;
              }
              if (a3) {
                *a3 = v16;
              }
            }
          }
          uint64_t v11 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v11);
      }
      else
      {
        int v13 = &stru_1F3084718;
      }
    }
    else
    {
      int v13 = [NSString stringWithFormat:@"none"];
    }
    uint64_t v18 = NSString;
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:v24];
    uint64_t v20 = SBFloatingDockBehaviorLevelDescription(v24);
    uint64_t v7 = [v18 stringWithFormat:@"level #%@ (%@) - %@\n%@", v19, v20, v13, v23];

    unint64_t v6 = v24 + 1;
  }
  while (v24 != 12);
  uint64_t v21 = SBLogDock();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CGFloat v30 = v7;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Floating dock behavior assertions...\n%{public}@", buf, 0xCu);
  }
}

- (void)_evaluateAssertions:(unint64_t)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v29 = a5;
  *(double *)&uint64_t v30 = 1.0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__SBFloatingDockController__evaluateAssertions_interactive_withCompletion___block_invoke;
  v28[3] = &unk_1E6AF5AA0;
  v28[4] = self;
  unint64_t v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v28);
  if (a3 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    id v10 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained progress];
      double v12 = *(double *)&v11;
      uint64_t v30 = v11;
      uint64_t v13 = [v10 isAnimated];
    }
    else
    {
      uint64_t v15 = SBLogDock();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](v15);
      }

      [0 progress];
      double v12 = *(double *)&v16;
      uint64_t v30 = v16;
      uint64_t v13 = 1;
    }
    viewController = self->_viewController;
    double v18 = v12;
    goto LABEL_28;
  }
  id v27 = 0;
  [(SBFloatingDockController *)self _deriveActiveAssertion:&v27 dockProgress:&v30];
  id v10 = v27;
  objc_storeWeak((id *)&self->_activeAssertion, v10);
  if (v10)
  {
    uint64_t v14 = [v10 isAnimated];
  }
  else
  {
    uint64_t v19 = SBLogDock();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](v19);
    }

    uint64_t v14 = 1;
  }
  [(SBFloatingDockRootViewController *)self->_viewController presentedProgress];
  double v21 = v20;
  if (a3 == 3)
  {
LABEL_16:
    if ([(SBFloatingDockRootViewController *)self->_viewController isFloatingDockFullyPresented]|| !BSFloatIsOne())
    {
      if (![(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented]|| !BSFloatIsZero())
      {
        goto LABEL_32;
      }
      *(double *)&uint64_t v30 = 0.0;
    }
    else
    {
      *(double *)&uint64_t v30 = 1.0;
    }
    goto LABEL_24;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      if (BSFloatIsOne() & 1) != 0 || (BSFloatIsZero()) {
        goto LABEL_32;
      }
      goto LABEL_24;
    }
    goto LABEL_16;
  }
LABEL_24:
  if (![(SBFloatingDockRootViewController *)self->_viewController isTransitioningPresentation])goto LABEL_27; {
  if (v21 >= 1.0)
  }
    goto LABEL_27;
  int v22 = [(SBFloatingDockRootViewController *)self->_viewController view];
  id v23 = [v22 window];
  uint64_t v24 = [v23 interfaceOrientation];
  uint64_t v25 = [(id)SBApp activeInterfaceOrientation];

  if (v24 == v25)
  {
LABEL_27:
    viewController = self->_viewController;
    double v18 = *(double *)&v30;
    uint64_t v13 = v14;
LABEL_28:
    [(SBFloatingDockRootViewController *)viewController setPresentationProgress:v13 animated:v5 interactive:v8 withCompletion:v18];
    goto LABEL_34;
  }
  long long v26 = SBLogDock();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](v26);
  }

LABEL_32:
  if (v8) {
    v8[2](v8, 1);
  }
LABEL_34:

  [(SBFloatingDockController *)self _updateFocusAssertion];
}

uint64_t __75__SBFloatingDockController__evaluateAssertions_interactive_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFocusAssertion];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateFocusAssertion
{
  BOOL v3 = [(SBFloatingDockController *)self _isActiveAssertionInDesiredLevel];
  BOOL v4 = [(SBFloatingDockRootViewController *)self->_viewController isPresentingFolder];
  int v5 = v3 & (v4 | [(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented]);
  id v12 = [(SBFloatingDockController *)self windowScene];
  if (![(SBFloatingDockController *)self isInvalidated] && v5 && !self->_focusAssertion && v12)
  {
    unint64_t v6 = +[SBWorkspace mainWorkspace];
    uint64_t v7 = [v6 keyboardFocusController];
    unint64_t v8 = +[SBKeyboardFocusLockReason floatingDock];
    char v9 = [v7 focusLockSpringBoardWindowScene:v12 forReason:v8];
    focusAssertion = self->_focusAssertion;
    self->_focusAssertion = v9;

LABEL_9:
    goto LABEL_10;
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v11 = self->_focusAssertion;
    if (v11)
    {
      [(BSInvalidatable *)v11 invalidate];
      unint64_t v6 = self->_focusAssertion;
      self->_focusAssertion = 0;
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (BOOL)_isActiveAssertionInDesiredLevel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v4 = [WeakRetained switcherController];

  id v5 = objc_loadWeakRetained((id *)&self->_activeAssertion);
  uint64_t v6 = [v4 windowManagementStyle];
  if (v6 == 2) {
    unint64_t v7 = 11;
  }
  else {
    unint64_t v7 = 5;
  }
  unint64_t v8 = [v5 level];
  BOOL v9 = v8 >= v7;
  if (v6 != 2)
  {
    unint64_t v10 = v8;
    uint64_t v11 = [v4 unlockedEnvironmentMode];
    BOOL v9 = v10 >= v7 || v11 == 3;
  }

  return v9;
}

- (double)_dockProgressForHoverTranslation:(double)a3
{
  [(SBFloatingDockController *)self floatingDockViewTopMargin];
  [(SBFloatingDockController *)self floatingDockHeight];
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (void)_handleDismissFloatingDockHoverGesture:(id)a3
{
  id v16 = a3;
  BOOL v4 = [(SBFloatingDockController *)self isFloatingDockFullyPresented];
  BOOL v5 = [(SBFloatingDockController *)self wasFloatingDockPresentedByPointer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  int v7 = [WeakRetained gesturePossible];

  unint64_t v8 = [(SBFloatingDockController *)self homeScreenContextProvider];
  char v9 = [v8 areAnyIconViewContextMenusShowing];
  if (v4 && v5 && v7 && (v9 & 1) == 0)
  {
    unint64_t v10 = [(SBFloatingDockRootViewController *)self->_viewController view];
    _UISystemGestureLocationInView();
    double v12 = v11;
    [v10 frame];
    double v14 = v13;
    [(SBFloatingDockRootViewController *)self->_viewController maximumFloatingDockHeight];
    if (v12 < v14 + v15 * -1.5) {
      [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
    }
  }
}

- (void)handlePresentFloatingDockHoverGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_viewController;
  uint64_t v6 = [(SBFloatingDockRootViewController *)v5 delegate];
  int v7 = [(SBFloatingDockRootViewController *)v5 view];
  [v4 translationInView:v7];
  double v9 = v8;

  [(SBFloatingDockController *)self _dockProgressForHoverTranslation:v9];
  double v11 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__SBFloatingDockController_handlePresentFloatingDockHoverGesture___block_invoke;
  v16[3] = &unk_1E6AF4E00;
  v16[4] = self;
  id v12 = v6;
  id v17 = v12;
  double v13 = v5;
  double v18 = v13;
  double v14 = (void (**)(void))MEMORY[0x1D948C7A0](v16);
  uint64_t v15 = [v4 state];
  switch(v15)
  {
    case 4:
      if (![(SBFloatingDockRootViewController *)v13 isFloatingDockPresented] || v11 <= 1.0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    case 3:
      if ([v4 endReason] != 3)
      {
        if (![(SBFloatingDockRootViewController *)v13 isFloatingDockPresented] || v11 <= 0.0) {
          break;
        }
        if (v11 < 0.25)
        {
LABEL_13:
          [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
          break;
        }
      }
LABEL_12:
      v14[2](v14);
      break;
    case 2:
      [v12 floatingDockRootViewController:v13 modifyProgress:1 interactive:0 completion:v11];
      break;
  }
}

uint64_t __66__SBFloatingDockController_handlePresentFloatingDockHoverGesture___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasFloatingDockPresentedByPointer:1];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 floatingDockRootViewController:v3 modifyProgress:0 interactive:0 completion:1.0];
}

- (void)registerForWindowScene:(id)a3
{
  id v11 = a3;
  id v4 = [(SBFloatingDockController *)self homeScreenContextProvider];
  BOOL v5 = [v4 iconManager];
  uint64_t v6 = [(SBFloatingDockController *)self floatingDockViewController];
  if ([v11 isMainDisplayWindowScene]) {
    [v5 setFloatingDockViewController:v6];
  }
  else {
    [v5 configureFloatingDockViewController:v6];
  }
  int v7 = [v11 systemGestureManager];
  double v8 = [(SBFloatingDockController *)self dismissFloatingDockSystemGestureRecognizer];
  [v7 addGestureRecognizer:v8 withType:38];

  double v9 = [(SBFloatingDockController *)self presentFloatingDockIndirectPanGestureRecognizer];
  [v7 addGestureRecognizer:v9 withType:39];

  double v10 = [(SBFloatingDockController *)self dismissFloatingDockHoverGestureRecognizer];
  [v7 addGestureRecognizer:v10 withType:40];
}

- (void)_presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  if ([(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented])
  {
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    [(SBFloatingDockController *)self floatingDockRootViewController:self->_viewController modifyProgress:0 interactive:v5 completion:1.0];
  }
}

- (void)_dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  if ([(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented])
  {
    [(SBFloatingDockController *)self floatingDockRootViewController:self->_viewController modifyProgress:0 interactive:v5 completion:0.0];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (BOOL)_allowGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  if ([WeakRetained gesturePossible]) {
    BOOL v4 = !self->_homeScreenTodayViewTransitioning;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)floatingDockRootViewController:(id)a3 willChangeToHeight:(double)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  v13[2] = *MEMORY[0x1E4F143B8];
  double v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  v12[0] = @"SBFloatingDockControllerHeight";
  double v9 = [NSNumber numberWithDouble:a4];
  v12[1] = @"SBFloatingDockControllerHeightChangeInteractive";
  v13[0] = v9;
  double v10 = [NSNumber numberWithBool:v5];
  v13[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v8 postNotificationName:@"SBFloatingDockControllerHeightWillChangeNotification" object:self userInfo:v11];
}

- (void)floatingDockRootViewController:(id)a3 didChangeToFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v13[1] = *MEMORY[0x1E4F143B8];
  double v9 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v12 = @"SBFloatingDockControllerFrame";
  double v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"SBFloatingDockControllerFrameDidChangeNotification" object:self userInfo:v11];
}

- (void)floatingDockRootViewController:(id)a3 floatingDockWantsToBePresented:(BOOL)a4
{
  if (a4) {
    [(SBFloatingDockController *)self presentFloatingDockIfDismissedAnimated:1 completionHandler:0];
  }
  else {
    [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
  }
}

- (void)floatingDockRootViewController:(id)a3 modifyProgress:(double)a4 interactive:(BOOL)a5 completion:(id)a6
{
  activeGestureFloatingDockBehaviorAssertion = self->_activeGestureFloatingDockBehaviorAssertion;
  if (activeGestureFloatingDockBehaviorAssertion)
  {
    BOOL v8 = a5;
    id v16 = (SBFloatingDockBehaviorAssertion *)a6;
    [(SBFloatingDockBehaviorAssertion *)activeGestureFloatingDockBehaviorAssertion modifyProgress:v8 interactive:v16 completion:a4];
    double v9 = v16;
  }
  else
  {
    p_activeAssertion = &self->_activeAssertion;
    id v12 = a6;
    id WeakRetained = objc_loadWeakRetained((id *)p_activeAssertion);
    uint64_t v14 = [WeakRetained gesturePossible];

    uint64_t v15 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:self visibleProgress:1 animated:v14 gesturePossible:11 atLevel:@"active gesture" reason:v12 withCompletion:a4];
    double v9 = self->_activeGestureFloatingDockBehaviorAssertion;
    self->_activeGestureFloatingDockBehaviorAssertion = v15;
  }
}

- (void)floatingDockRootViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
}

- (void)floatingDockRootViewControllerDidEndPresentationTransition:(id)a3
{
}

- (double)minimumHomeScreenScaleForFloatingDockRootViewController:(id)a3
{
  BOOL v4 = [(SBFloatingDockController *)self delegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 minimumHomeScreenScaleForFloatingDockController:self];
    double v5 = v6;
  }

  return v5;
}

- (id)libraryContainerViewControllerForFloatingDockRootViewController:(id)a3
{
  BOOL v4 = [(UIWindow *)self->_floatingDockWindow _sbWindowScene];
  if ([v4 isMainDisplayWindowScene])
  {
    double v5 = [(SBFloatingDockController *)self homeScreenContextProvider];
    double v6 = [v5 homeScreenViewController];
  }
  else
  {
    double v6 = self->_viewController;
  }

  return v6;
}

- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockRootViewController:(id)a3
{
  uint64_t v3 = [(UIWindow *)self->_floatingDockWindow _sbWindowScene];
  if ([v3 isMainDisplayWindowScene])
  {
    BOOL v4 = [v3 switcherController];
    BOOL v5 = [v4 unlockedEnvironmentMode] == 1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)foregroundLibraryContainerViewControllerForFloatingDockRootViewController:(id)a3
{
  return self->_viewController;
}

- (id)floatingDockRootViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SBFloatingDockController *)self homeScreenContextProvider];
  double v9 = [v8 homeScreenViewController];
  double v10 = [v6 floatingDockViewController];
  id v11 = [v10 libraryViewController];
  id v12 = [v11 parentViewController];

  if (v12 == v9)
  {
    uint64_t v24 = [SBFloatingDockWindowLevelAssertion alloc];
    id v23 = [(SBFloatingDockWindowLevelAssertion *)v24 initWithFloatingDockController:self priority:4 level:v7 reason:*MEMORY[0x1E4F43F20] + -2.5];
  }
  else
  {
    double v13 = [v6 floatingDockViewController];
    uint64_t v14 = [v13 view];

    uint64_t v15 = [v14 superview];
    [v15 sendSubviewToBack:v14];

    rootViewControllerOrderingAssertions = self->_rootViewControllerOrderingAssertions;
    if (!rootViewControllerOrderingAssertions)
    {
      id v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      double v18 = self->_rootViewControllerOrderingAssertions;
      self->_rootViewControllerOrderingAssertions = v17;

      rootViewControllerOrderingAssertions = self->_rootViewControllerOrderingAssertions;
    }
    uint64_t v19 = rootViewControllerOrderingAssertions;
    id v20 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    long long v28 = __124__SBFloatingDockController_floatingDockRootViewController_acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason___block_invoke;
    id v29 = &unk_1E6AFD050;
    uint64_t v30 = v19;
    id v31 = v14;
    id v21 = v14;
    int v22 = v19;
    id v23 = (SBFloatingDockWindowLevelAssertion *)[v20 initWithIdentifier:@"SBFloatingDockRootViewController-subview-ordering" forReason:v7 invalidationBlock:&v26];

    -[NSHashTable addObject:](v22, "addObject:", v23, v26, v27, v28, v29);
    id v7 = v21;
  }

  return v23;
}

void __124__SBFloatingDockController_floatingDockRootViewController_acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeObject:a2];
  if (![*(id *)(a1 + 32) count])
  {
    id v3 = [*(id *)(a1 + 40) superview];
    [v3 bringSubviewToFront:*(void *)(a1 + 40)];
  }
}

- (id)iconViewMap
{
  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    BOOL v4 = (SBHReusableViewMap *)[objc_alloc(MEMORY[0x1E4FA6310]) initWithDelegate:self];
    BOOL v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  BOOL v4 = [(SBFloatingDockController *)self iconViewMap];
  BOOL v5 = [v4 dequeueReusableViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockController *)self iconViewMap];
  [v5 recycleView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockController *)self iconViewMap];
  char v6 = [v5 isViewRecycled:v4];

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBFloatingDockController *)self homeScreenContextProvider];
  BOOL v8 = [v9 iconManager];
  [v8 configureIconView:v7 forIcon:v6];
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 3;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  return self->_floatingDockWindow;
}

- (BOOL)viewMap:(id)a3 shouldRecycleView:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(SBFloatingDockController *)self homeScreenContextProvider];
    id v7 = [v6 iconManager];
    char v8 = [v7 shouldRecycleIconView:v5];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)iconManager:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  BOOL v7 = a5;
  id v12 = a4;
  id v9 = a6;
  double v10 = [(UIWindow *)self->_floatingDockWindow _sbWindowScene];
  id v11 = [v12 _sbWindowScene];
  if (v10 == v11) {
    [(SBFloatingDockController *)self _handleTransitionForFolder:v12 atLevel:0 presenting:v7 withTransitionCoordinator:v9];
  }
}

- (void)_handleTransitionForFolder:(id)a3 atLevel:(unint64_t)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v13 = [WeakRetained switcherController];
    [v13 dismissMainSwitcherWithSource:24 animated:1];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__SBFloatingDockController__handleTransitionForFolder_atLevel_presenting_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1E6B046F0;
  BOOL v18 = v7;
  v15[4] = self;
  id v16 = v10;
  unint64_t v17 = a4;
  id v14 = v10;
  [v11 animateAlongsideTransition:v15 completion:0];
}

void __100__SBFloatingDockController__handleTransitionForFolder_atLevel_presenting_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isCancelled];
  char v5 = [v3 isInteractive];

  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    if (v4 == (*(unsigned char *)(a1 + 56) != 0))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      char v8 = *(void **)(a1 + 32);
      [v8 _configureFloatingDockBehaviorAssertionForOpenFolder:0 atLevel:v7];
    }
    else
    {
      id v9 = [*(id *)(a1 + 40) folder];
      [v6 _configureFloatingDockBehaviorAssertionForOpenFolder:v9 atLevel:*(void *)(a1 + 48)];
    }
  }
}

- (void)_configureFloatingDockBehaviorAssertionForOpenFolder:(id)a3 atLevel:(unint64_t)a4
{
  id v6 = a3;
  id v12 = v6;
  if (a4 == 1)
  {
    openFolderOverSceneLayoutFloatingDockBehaviorAssertion = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
    if (v6)
    {
      if (openFolderOverSceneLayoutFloatingDockBehaviorAssertion) {
        goto LABEL_14;
      }
      id v11 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:self visibleProgress:1 animated:1 gesturePossible:8 atLevel:@"open folder over scene layout" reason:0 withCompletion:0.0];
      id v9 = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
      self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion = v11;
    }
    else
    {
      if (!openFolderOverSceneLayoutFloatingDockBehaviorAssertion) {
        goto LABEL_14;
      }
      [(SBFloatingDockBehaviorAssertion *)openFolderOverSceneLayoutFloatingDockBehaviorAssertion invalidate];
      id v9 = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
      self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion = 0;
    }
  }
  else
  {
    if (a4) {
      goto LABEL_14;
    }
    openFolderOverHomeScreenFloatingDockBehaviorAssertion = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
    if (v6)
    {
      if (openFolderOverHomeScreenFloatingDockBehaviorAssertion) {
        goto LABEL_14;
      }
      char v8 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:self visibleProgress:1 animated:1 gesturePossible:1 atLevel:@"open folder over homescreen" reason:0 withCompletion:0.0];
      id v9 = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
      self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion = v8;
    }
    else
    {
      if (!openFolderOverHomeScreenFloatingDockBehaviorAssertion) {
        goto LABEL_14;
      }
      [(SBFloatingDockBehaviorAssertion *)openFolderOverHomeScreenFloatingDockBehaviorAssertion invalidate];
      id v9 = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
      self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion = 0;
    }
  }

LABEL_14:
  [(SBFloatingDockController *)self _updateFocusAssertion];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return (id)[(SBFloatingDockRootViewController *)self->_viewController view];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (SBFailingSystemGestureRecognizer *)a3;
  id v7 = a4;
  if (![(SBFloatingDockController *)self _allowGestureRecognizers]) {
    goto LABEL_7;
  }
  if (self->_dismissFloatingDockSystemGestureRecognizer != v6)
  {
    BOOL v8 = 1;
    goto LABEL_8;
  }
  if (![(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented])
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  id v9 = [(SBFloatingDockController *)self homeScreenContextProvider];
  id v10 = [v9 iconManager];
  if ([v10 isShowingLeadingCustomView])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v12 = [(SBFloatingDockRootViewController *)self->_viewController viewIfLoaded];
    if (v12)
    {
      _UISystemGestureLocationForTouchInView();
      double v14 = v13;
      uint64_t v15 = objc_msgSend(v12, "hitTest:withEvent:", 0);
      if (v15) {
        goto LABEL_11;
      }
      id v16 = [v12 window];
      unint64_t v17 = [v16 windowScene];
      uint64_t v15 = [v17 screen];

      if (!v15) {
        goto LABEL_15;
      }
      [(SBFloatingDockRootViewController *)self->_viewController floatingDockScreenFrame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      uint64_t v26 = [v15 fixedCoordinateSpace];
      objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v26, v19, v21, v23, v25);
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;

      v35.origin.double x = v28;
      v35.origin.double y = v30;
      v35.size.double width = v32;
      v35.size.double height = v34;
      if (v14 > CGRectGetMidY(v35)) {
LABEL_11:
      }
        BOOL v8 = 0;
      else {
LABEL_15:
      }
        BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
LABEL_8:

  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_presentFloatingDockIndirectPanGestureRecognizer == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v6 = +[SBCoverSheetPresentationManager sharedInstance];
    int v7 = [v6 isVisible];

    BOOL v8 = +[SBControlCenterController sharedInstance];
    int v9 = [v8 isVisible];

    id v10 = [WeakRetained assistantController];
    int v11 = [v10 isVisible];

    id v12 = +[SBSetupManager sharedInstance];
    int v13 = [v12 isInSetupMode];

    double v14 = [WeakRetained switcherController];
    int v15 = [v14 isFloatingSwitcherVisible];

    if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture])
    {
      if (![(SBFloatingDockRootViewController *)self->_viewController isFloatingDockFullyPresented])
      {
        if ((v7 | v9 | v11 | v13 | v15) != 1)
        {
          BOOL v3 = 1;
          goto LABEL_11;
        }
        id v16 = SBLogDock();
        BOOL v20 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v13)
        {
          if (!v20) {
            goto LABEL_10;
          }
          __int16 v23 = 0;
          unint64_t v17 = "Preventing the indirect present dock gesture because the dock is not allowed in Buddy.";
          double v18 = (uint8_t *)&v23;
        }
        else if (v15)
        {
          if (!v20) {
            goto LABEL_10;
          }
          __int16 v22 = 0;
          unint64_t v17 = "Preventing the indirect present dock gesture because the slide over switcher is visible.";
          double v18 = (uint8_t *)&v22;
        }
        else
        {
          if (!v20) {
            goto LABEL_10;
          }
          __int16 v21 = 0;
          unint64_t v17 = "Preventing the indirect present dock gesture because although the dock owns the home gesture, Cover Shee"
                "t, Control Center, or Siri are still dismissing.";
          double v18 = (uint8_t *)&v21;
        }
        goto LABEL_9;
      }
      id v16 = SBLogDock();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = 0;
        unint64_t v17 = "Preventing the indirect present dock gesture because the floating dock is already presented.";
        double v18 = (uint8_t *)&v24;
LABEL_9:
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
      }
    }
    else
    {
      id v16 = SBLogDock();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        unint64_t v17 = "Preventing the indirect present dock gesture because the dock doesn't own the home gesture.";
        double v18 = buf;
        goto LABEL_9;
      }
    }
LABEL_10:

    BOOL v3 = 0;
LABEL_11:

    return v3;
  }
  return 1;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_dismissFloatingDockSystemGestureRecognizer == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    int v5 = [WeakRetained gesturePossible];

    if (v5)
    {
      [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
      analyticsClient = self->_analyticsClient;
      [(SBFAnalyticsClient *)analyticsClient emitEvent:27];
    }
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v41 = a4;
  BOOL v38 = [(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented];
  int v5 = [v41 fromLayoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];
  int v7 = [v41 toLayoutState];
  uint64_t v8 = [v7 unlockedEnvironmentMode];
  int v9 = [(SBFloatingDockController *)self homeScreenContextProvider];
  v37 = [(SBFloatingDockController *)self presentedFolderController];
  v40 = [v37 folder];
  if (!v40)
  {
    id v10 = [(SBFloatingDockController *)self windowScene];
    if ([v10 isMainDisplayWindowScene])
    {
      int v11 = [v9 iconManager];
      id v12 = [v11 openedFolderController];
      v40 = [v12 folder];
    }
    else
    {
      v40 = 0;
    }
  }
  id v39 = v9;
  int v13 = [v7 isEqual:v5 withRole:1];
  int v14 = [v7 isEqual:v5 withRole:3];
  int v15 = [v5 bundleIDShowingAppExpose];
  id v16 = [v7 bundleIDShowingAppExpose];
  char v17 = BSEqualStrings();

  BOOL v18 = 0;
  if (v6 == 3 && v8 == 3 && (v17 & 1) == 0)
  {
    double v19 = [v7 bundleIDShowingAppExpose];
    BOOL v18 = v19 != 0;
  }
  BOOL v20 = [v41 applicationTransitionContext];
  if (!v14) {
    goto LABEL_14;
  }
  int v21 = (v8 == 3) & ~v13;
  if (v6 != 3) {
    int v21 = 0;
  }
  if ((v21 | v18) != 1)
  {
    BOOL v23 = [(SBFloatingDockRootViewController *)self->_viewController isFloatingDockPresented];
    uint64_t v22 = v8 == 1 || v23;
  }
  else
  {
LABEL_14:
    [(SBFloatingDockController *)self dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
    [(SBFloatingDockController *)self dismissPresentedFolderAnimated:1 withTransitionContext:v20 completion:0];
    [(SBFloatingDockController *)self dismissPresentedLibraryAnimated:1 withTransitionContext:v20 completion:0];
    uint64_t v22 = 0;
  }
  if (v6 == 2) {
    char v24 = v17;
  }
  else {
    char v24 = 0;
  }
  if (v24)
  {
    if (v8 != 3) {
      goto LABEL_43;
    }
    goto LABEL_32;
  }
  BOOL v26 = v6 == 2 && v8 == 3;
  if (v8 == 2 || v26) {
LABEL_32:
  }
    [(SBFloatingDockController *)self dismissPresentedLibraryAnimated:1 withTransitionContext:v20 completion:0];
  if (v6 == 1 && v8 == 3)
  {
    double v27 = [(SBFloatingDockController *)self windowScene];
    int v28 = [v27 isMainDisplayWindowScene];
    if (v40 && [(SBFloatingDockController *)self isPresentingFolder])
    {
      if (v28)
      {
        double v29 = [v40 icon];
        CGFloat v30 = [(SBFloatingDockController *)self presentedFolderController];
        uint64_t v36 = [v30 currentPageIndex];

        [(SBFloatingDockController *)self dismissPresentedFolderAnimated:0 completion:0];
        double v31 = [v39 _rootFolderController];
        [v31 pushFolderIcon:v29 location:*MEMORY[0x1E4FA66C8] animated:0 completion:0];

        CGFloat v32 = [v39 _rootFolderController];
        double v33 = [v32 folderControllerForFolder:v40];
        [v33 setCurrentPageIndex:v36 animated:0];
      }
      else
      {
        [(SBFloatingDockController *)self dismissPresentedFolderAnimated:0 completion:0];
      }
    }
    else
    {
      CGFloat v34 = [(SBFloatingDockController *)self floatingDockViewController];
      int v35 = [v34 isPresentingLibrary];

      if (((v35 ^ 1 | v28) & 1) == 0) {
        [(SBFloatingDockController *)self dismissPresentedLibraryAnimated:1 withTransitionContext:v20 completion:0];
      }
    }
  }
LABEL_43:
  [(SBFloatingDockController *)self _updateFocusAssertion];
  [(SBFloatingDockRootViewController *)self->_viewController prepareForTransitionToEnvironmentMode:v8 fromDockVisible:v38 toDockVisible:v22];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v23 = a4;
  int v5 = [v23 toLayoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];
  int v7 = v23;
  if (v6 == 1)
  {
    uint64_t v8 = [(SBFloatingDockController *)self homeScreenContextProvider];
    int v9 = [v8 _openFolderController];
    id v10 = v9;
    if (v9
      && [v9 isOpen]
      && ![(SBFloatingDockController *)self isPresentingFolder])
    {
      uint64_t v22 = [v10 folder];
      int v11 = [v22 icon];
      int v21 = [v10 originatingIconLocation];
      id v12 = [v8 model];
      int v13 = [v12 rootFolder];
      int v14 = [v13 dock];
      int v15 = [v14 directlyContainsIcon:v11];

      if (v15)
      {
        id v16 = [v8 _rootFolderController];
        char v17 = [v16 folderControllerForFolder:v22];

        uint64_t v20 = [v17 currentPageIndex];
        BOOL v18 = [v8 _rootFolderController];
        [v18 popFolderAnimated:0 completion:0];

        [(SBFloatingDockController *)self presentFolderForIcon:v11 location:v21 animated:0 completion:0];
        if (v17)
        {
          double v19 = [(SBFloatingDockController *)self presentedFolderController];
          [v19 setCurrentPageIndex:v20 animated:0];
        }
      }
    }
    int v7 = v23;
  }
  if (([v7 isInterrupted] & 1) == 0) {
    [(SBFloatingDockRootViewController *)self->_viewController cleanupAfterTransitionToEnvironmentMode:v6];
  }
}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  uint64_t v8 = [a3 pageState];
  int v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  int v10 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v9 == v10)
  {
    if (a4 != 1 && v8 != 1) {
      return;
    }
    int v13 = [SBFloatingDockBehaviorAssertion alloc];
    double v14 = 1.0;
    if (a4 == 1) {
      double v14 = 0.0;
    }
    int v15 = [(SBFloatingDockBehaviorAssertion *)v13 initWithFloatingDockController:self visibleProgress:1 animated:1 gesturePossible:2 atLevel:@"icon pull started" reason:0 withCompletion:v14];
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
    self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion = v15;
  }
  else
  {
    self->_homeScreenTodayViewTransitioning = 1;
    self->_homeScreenTransitioningToTodayView = v10;
    if (self->_todayViewFloatingDockBehaviorAssertion) {
      return;
    }
    int v11 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:self visibleProgress:1 animated:1 gesturePossible:4 atLevel:@"beginning transition to today view" reason:0 withCompletion:1.0];
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_todayViewFloatingDockBehaviorAssertion;
    self->_todayViewFloatingDockBehaviorAssertion = v11;
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  [a3 pageState];
  int v7 = SBRootFolderPageStateIsOnLeadingCustomPage();
  int v8 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v7 != v8)
  {
    double v9 = 1.0 - a5;
    if (v8) {
      double v9 = a5;
    }
    double v10 = 1.0 - v9;
    if (!self->_homeScreenTransitioningToTodayView)
    {
      [(SBFloatingDockRootViewController *)self->_viewController presentedProgress];
      if (v10 < v11) {
        double v10 = v11;
      }
    }
    todayViewFloatingDockBehaviorAssertion = self->_todayViewFloatingDockBehaviorAssertion;
    [(SBFloatingDockBehaviorAssertion *)todayViewFloatingDockBehaviorAssertion modifyProgress:1 interactive:0 completion:v10];
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  id v18 = a3;
  int v10 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v10 != SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    *(_WORD *)&self->_homeScreenTransitioningToTodayView = 0;
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = [(SBFloatingDockController *)self homeScreenContextProvider];
    id v12 = [iconPullSearchGestureShowingFloatingDockBehaviorAssertion iconManager];
    int v13 = [v12 isShowingOrTransitioningToLeadingCustomView];
    todayViewFloatingDockBehaviorAssertion = self->_todayViewFloatingDockBehaviorAssertion;
    if (v13)
    {
      [(SBFloatingDockBehaviorAssertion *)todayViewFloatingDockBehaviorAssertion modifyProgress:1 interactive:0 completion:0.0];
    }
    else
    {
      [(SBFloatingDockBehaviorAssertion *)todayViewFloatingDockBehaviorAssertion invalidate];
      char v17 = self->_todayViewFloatingDockBehaviorAssertion;
      self->_todayViewFloatingDockBehaviorAssertion = 0;
    }
    goto LABEL_13;
  }
  BOOL v15 = a4 != 1;
  BOOL v16 = !a6;
  if (a4 != 1) {
    BOOL v16 = 0;
  }
  if (a5 == 1) {
    BOOL v15 = a6;
  }
  if (!v15 && !v16)
  {
    [(SBFloatingDockBehaviorAssertion *)self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion invalidate];
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
    self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion = 0;
LABEL_13:
  }
}

- (void)_recalculateWindowLevelForWindowLevelAssertions
{
  BOOL v3 = 0;
  uint64_t v4 = 0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  floatingDockWindowLevelAssertionsByPrioritdouble y = self->_floatingDockWindowLevelAssertionsByPriority;
  do
  {
    uint64_t v6 = floatingDockWindowLevelAssertionsByPriority[v4];
    int v7 = v6;
    if (v6)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            if (v12)
            {
              id v13 = v12;

              BOOL v3 = v13;
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }

    ++v4;
  }
  while (v4 != 5);
  if (v3)
  {
    [v3 level];
    double v15 = v14;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F43F20] + 5.0 + 20.0;
  }
  BOOL v16 = [(SBFloatingDockRootViewController *)self->_viewController view];
  char v17 = [v16 window];
  [v17 setWindowLevel:v15];

  [(SBFloatingDockRootViewController *)self->_viewController updateDisplayLayoutElementWindowLevel:v15];
}

- (void)assistantWillAppear:(id)a3
{
  if (SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutState()
    && !self->_assistantFloatingDockBehaviorAssertion)
  {
    uint64_t v4 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:self visibleProgress:1 animated:0 gesturePossible:6 atLevel:@"assistant" reason:0 withCompletion:0.0];
    assistantFloatingDockBehaviorAssertion = self->_assistantFloatingDockBehaviorAssertion;
    self->_assistantFloatingDockBehaviorAssertion = v4;
  }
}

- (void)assistantDidDisappear:(id)a3
{
  [(SBFloatingDockBehaviorAssertion *)self->_assistantFloatingDockBehaviorAssertion invalidate];
  assistantFloatingDockBehaviorAssertion = self->_assistantFloatingDockBehaviorAssertion;
  self->_assistantFloatingDockBehaviorAssertion = 0;
}

- (NSString)description
{
  return (NSString *)[(SBFloatingDockController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBFloatingDockController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBFloatingDockController *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(SBFloatingDockController *)self succinctDescriptionBuilder];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E6AF4E00;
  id v6 = v5;
  id v12 = v6;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [v6 appendBodySectionWithName:0 multilinePrefix:v7 block:v11];
  uint64_t v8 = v14;
  id v9 = v6;

  return v9;
}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"floating dock view controller"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 312) withName:@"dismiss floating dock system gesture recognizer"];
  id v4 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 328));
  id v6 = (id)[v4 appendObject:WeakRetained withName:@"current active assertion"];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v14[3] = &unk_1E6AF4E00;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v9.i64[0];
  int8x16_t v15 = vextq_s8(v9, v9, 8uLL);
  id v16 = *(id *)(a1 + 48);
  [v7 appendBodySectionWithName:@"floatingDockBehaviorByAssertionLevel" multilinePrefix:&stru_1F3084718 block:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v11[3] = &unk_1E6AF4E00;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  id v13 = *(id *)(a1 + 48);
  [v8 appendBodySectionWithName:@"_floatingDockWindowLevelAssertionsByPriority" multilinePrefix:&stru_1F3084718 block:v11];
}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_2(void *a1)
{
  for (uint64_t i = 3; i != 16; ++i)
  {
    id v3 = *(void **)(a1[4] + 8 * i);
    if (v3)
    {
      id v4 = (void *)a1[5];
      id v5 = v3;
      id v6 = [v5 allObjects];
      id v7 = NSString;
      id v8 = [NSNumber numberWithUnsignedInteger:i - 3];
      int8x16_t v9 = [v8 description];
      int8x16_t v10 = SBFloatingDockBehaviorLevelDescription(i - 3);
      uint64_t v11 = [v7 stringWithFormat:@"%@ - (%@)", v9, v10];
      [v4 appendArraySection:v6 withName:v11 multilinePrefix:a1[6] skipIfEmpty:0];
    }
  }
}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_3(void *a1)
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v3 = *(void **)(a1[4] + 8 * i + 128);
    if (v3)
    {
      id v4 = (void *)a1[5];
      id v5 = v3;
      id v6 = [v5 allObjects];
      id v7 = NSString;
      id v8 = [NSNumber numberWithUnsignedInteger:i];
      int8x16_t v9 = [v8 description];
      int8x16_t v10 = SBFloatingDockWindowLevelPriorityDescription(i);
      uint64_t v11 = [v7 stringWithFormat:@"%@ - (%@)", v9, v10];
      [v4 appendArraySection:v6 withName:v11 multilinePrefix:a1[6] skipIfEmpty:0];
    }
  }
}

- (void)_setupStateDumper
{
  if (!self->_floatingDockStateDumpHandle)
  {
    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      objc_initWeak(&location, self);
      id v3 = MEMORY[0x1E4F14428];
      v17[1] = (id)MEMORY[0x1E4F143A8];
      v17[2] = (id)3221225472;
      v17[3] = __45__SBFloatingDockController__setupStateDumper__block_invoke;
      v17[4] = &unk_1E6AF76A8;
      objc_copyWeak(&v18, &location);
      BSLogAddStateCaptureBlockWithTitle();
      id v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      floatingDockStateDumpHandle = self->_floatingDockStateDumpHandle;
      self->_floatingDockStateDumpHandle = v4;

      uint64_t v12 = 0;
      id v13 = (id *)&v12;
      uint64_t v14 = 0x3042000000;
      int8x16_t v15 = __Block_byref_object_copy__65;
      id v16 = __Block_byref_object_dispose__65;
      v17[0] = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_179;
      v11[3] = &unk_1E6B04740;
      void v11[4] = &v12;
      id v6 = (void *)MEMORY[0x1D948C7A0](v11);
      objc_storeWeak(v13 + 5, v6);
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      BSLogAddStateCaptureBlockWithTitle();
      id v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      floatingDockRecursiveHitTestingStateDumpHandle = self->_floatingDockRecursiveHitTestingStateDumpHandle;
      self->_floatingDockRecursiveHitTestingStateDumpHandle = v7;

      objc_destroyWeak(&v10);
      _Block_object_dispose(&v12, 8);
      objc_destroyWeak(v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

id __45__SBFloatingDockController__setupStateDumper__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[1];
    id v4 = [v2 descriptionBuilderWithMultilinePrefix:0];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __45__SBFloatingDockController__setupStateDumper__block_invoke_2;
    uint64_t v12 = &unk_1E6AF5290;
    id v13 = v4;
    id v14 = v3;
    id v5 = v3;
    id v6 = v4;
    [v6 appendBodySectionWithName:@"floating dock presentation state" multilinePrefix:&stru_1F3084718 block:&v9];
    id v7 = objc_msgSend(v6, "build", v9, v10, v11, v12);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFloatingDockPresented"), @"isFloatingDockPresented");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFloatingDockFullyPresented"), @"isFloatingDockFullyPresented");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) floatingDockScreenFrame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"floatingDockScreenFrame");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) floatingDockScreenPresentationFrame];
  id v7 = (id)objc_msgSend(v6, "appendRect:withName:", @"floatingDockScreenPresentationFrame");
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) view];
  uint64_t v10 = [v9 window];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_1F3084718;
  }
  id v13 = (id)[v8 appendObject:v12 withName:@"floatingDockWindow"];

  id v14 = NSNumber;
  int8x16_t v15 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) view];
  id v16 = [v19 window];
  [v16 windowLevel];
  char v17 = objc_msgSend(v14, "numberWithDouble:");
  id v18 = (id)[v15 appendObject:v17 withName:@"floatingDockWindowLevel"];
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_179(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_opt_new();
  id v13 = (void *)v12;
  if (a5)
  {
    uint64_t v14 = a5;
    do
    {
      int8x16_t v15 = [v13 stringByAppendingString:@"\t"];

      id v13 = v15;
      --v14;
    }
    while (v14);
  }
  else
  {
    int8x16_t v15 = (void *)v12;
  }
  id v16 = (objc_class *)objc_opt_class();
  char v17 = NSStringFromClass(v16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_2_183;
  v22[3] = &unk_1E6B04718;
  id v23 = v11;
  id v24 = v9;
  uint64_t v18 = *(void *)(a1 + 32);
  id v25 = v10;
  uint64_t v26 = v18;
  uint64_t v27 = a5;
  id v19 = v10;
  id v20 = v9;
  id v21 = v11;
  [v21 appendBodySectionWithName:v17 multilinePrefix:v15 block:v22];
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_2_183(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInteractionEnabled"), @"isUserInteractionEnabled");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "bs_isHitTestingDisabled"), @"bs_isHitTestingDisabled");
  id v14 = [*(id *)(a1 + 40) subviews];
  if ([v14 count])
  {
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      char v5 = [v4 evaluateWithObject:*(void *)(a1 + 40)];

      if ((v5 & 1) == 0) {
        return;
      }
    }
    else
    {
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [*(id *)(a1 + 40) subviews];
    id v7 = [v6 reverseObjectEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
          (*((void (**)(id, uint64_t, void, void, uint64_t))WeakRetained + 2))(WeakRetained, v12, *(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 64) + 1);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
  }
}

id __45__SBFloatingDockController__setupStateDumper__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained descriptionBuilderWithMultilinePrefix:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_4;
    v9[3] = &unk_1E6AF5A00;
    id v5 = *(id *)(a1 + 32);
    id v10 = v4;
    id v11 = v5;
    v9[4] = v3;
    id v6 = v4;
    [v6 appendBodySectionWithName:@"floating dock user interface interaction enabled" multilinePrefix:&stru_1F3084718 block:v9];
    id v7 = [v6 build];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_4(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(a1[4] + 304);
  id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_200];
  (*(void (**)(uint64_t, uint64_t, id, void, void))(v2 + 16))(v2, v3, v4, a1[5], 0);
}

BOOL __45__SBFloatingDockController__setupStateDumper__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (SBFloatingDockControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)viewController
{
  return &self->_viewController->super.super;
}

- (BOOL)wasFloatingDockPresentedByPointer
{
  return self->_wasFloatingDockPresentedByPointer;
}

- (void)setWasFloatingDockPresentedByPointer:(BOOL)a3
{
  self->_wasFloatingDockPresentedByPointer = a3;
}

- (SBIndirectPanGestureRecognizer)presentFloatingDockIndirectPanGestureRecognizer
{
  return self->_presentFloatingDockIndirectPanGestureRecognizer;
}

- (UIHoverGestureRecognizer)dismissFloatingDockHoverGestureRecognizer
{
  return self->_dismissFloatingDockHoverGestureRecognizer;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBWindow)floatingDockWindow
{
  return self->_floatingDockWindow;
}

- (SBFailingSystemGestureRecognizer)dismissFloatingDockSystemGestureRecognizer
{
  return self->_dismissFloatingDockSystemGestureRecognizer;
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
  return (SBFloatingDockHomeScreenContextProviding *)WeakRetained;
}

- (SBFloatingDockBehaviorAssertion)activeAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  return (SBFloatingDockBehaviorAssertion *)WeakRetained;
}

- (void)setActiveAssertion:(id)a3
{
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  return (SBLayoutStateTransitionCoordinator *)WeakRetained;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_destroyWeak((id *)&self->_activeAssertion);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_dismissFloatingDockSystemGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_floatingDockWindow, 0);
  objc_storeStrong((id *)&self->_dismissFloatingDockHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentFloatingDockIndirectPanGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_focusAssertion, 0);
  objc_storeStrong((id *)&self->_floatingDockRecursiveHitTestingStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_floatingDockStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
  objc_storeStrong((id *)&self->_rootViewControllerOrderingAssertions, 0);
  objc_storeStrong((id *)&self->_assistantFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_activeGestureFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_todayViewFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  for (uint64_t i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_floatingDockWindowLevelAssertionsByPriority[i + 4], 0);
  for (uint64_t j = 120; j != 16; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)_removeFloatingDockWindowLevelAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_removeFloatingDockBehaviorAssertion:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_evaluateAssertions:(os_log_t)log interactive:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Found a nil activeAssertion when attempting to evaluate SBFloatingDockBehaviorAssertion assertions. At least one should always exist.", v1, 2u);
}

- (void)_evaluateAssertions:(os_log_t)log interactive:withCompletion:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "ignoring dock behavior assertion change temporarily during interface orientation mismatch", v1, 2u);
}

@end