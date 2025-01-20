@interface PREditor
- (BOOL)allowsHitTestingInRootViewController;
- (BOOL)areComplicationsAllowed;
- (BOOL)areComplicationsDisallowed;
- (BOOL)areControlsHidden;
- (BOOL)areViewsSharedBetweenLooks;
- (BOOL)displaysHeaderElements;
- (BOOL)displaysRootViewController;
- (BOOL)displaysSubtitleElement;
- (BOOL)fontAndColorPickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4;
- (BOOL)fontAndContentStylePickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4;
- (BOOL)hasUpdatedLookProperties;
- (BOOL)hasUpdatedLooks;
- (BOOL)isAlternateDateEnabled;
- (BOOL)isComplicationSidebarConfigured;
- (BOOL)isComplicationsRowConfigured;
- (BOOL)isCoveredByHostModalPresentation;
- (BOOL)isDepthEffectDisabled;
- (BOOL)isDepthEffectDisallowed;
- (BOOL)isDepthEffectEffectivelyDisabled;
- (BOOL)isDepthEffectEnabled;
- (BOOL)isDismissingPresentedViewControllerFromTitledViewController;
- (BOOL)isInlineComplicationConfigured;
- (BOOL)isLifecycleTiedToInitiallyPresentedViewController;
- (BOOL)isPerspectiveZoomDisallowed;
- (BOOL)isPerspectiveZoomEnabled;
- (BOOL)isPresentingModalViewController;
- (BOOL)isViewControllerPresentationAnimationAllowed;
- (BOOL)needsCustomViewControllerPresentationManager;
- (BOOL)presentsViewControllersRemotely;
- (BOOL)shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:(id)a3;
- (BOOL)shouldIgnorePreviouslyConfiguredTitleStyleConfiguration;
- (BOOL)usesEditingLayout;
- (CGRect)horizontalTitleBoundingRect;
- (CGRect)leadingTopButtonFrame;
- (CGRect)safeAreaBounds;
- (CGRect)trailingTopButtonFrame;
- (CGRect)verticalTitleBoundingRect;
- (FBSceneWorkspace)sceneWorkspace;
- (NSHashTable)modalPresentationAssertions;
- (NSMapTable)modalPresentationAssertionsByViewController;
- (NSString)debugDescription;
- (NSString)posterRole;
- (NSString)titleString;
- (PREditingDelegate)delegate;
- (PREditingFontAndColorPickerViewController)fontAndColorPickerViewController;
- (PREditingFontAndContentStylePickerViewController)fontAndContentStylePickerViewController;
- (PREditingLook)currentLook;
- (PREditingLook)initialLook;
- (PREditor)initWithDelegate:(id)a3;
- (PREditor)initWithScene:(id)a3;
- (PREditorRootViewController)rootViewController;
- (PRInvalidatable)coveredByHostModalPresentationDisableLookSwitchingAssertion;
- (PRInvalidatable)presentingModalViewControllerDisableLookSwitchingAssertion;
- (PROverridableDateProvider)dateProvider;
- (PRPosterEditingEnvironment)environment;
- (PRPosterEditingPreferences)preferences;
- (PRPosterMutableConfiguredProperties)configuredProperties;
- (UIAction)placeholderAction;
- (UIAction)togglingPerspectiveZoomAction;
- (UIEdgeInsets)editingChromeDodgingInsets;
- (UIMenu)appearanceMenu;
- (UIMenu)depthEffectMenu;
- (UIPopoverPresentationController)popoverPresentationController;
- (UIScene)_scene;
- (UIView)contentOverlayView;
- (UIWindow)remoteViewControllerPresentationWindow;
- (UIWindowScene)scene;
- (double)looksScrollingDecelerationRate;
- (id)_acquireModalPresentationAssertionForReason:(id)a3;
- (id)_contentLuminanceValuesForCurrentLooks;
- (id)_defaultLuminanceValuesForLooks:(id)a3 initialLook:(id)a4 initialLookLuminanceValue:(double)a5;
- (id)_refetchLooks;
- (id)_refetchLooksForProperties;
- (id)_refreshLuminanceValuesForCurrentPerLookLuminanceValues:(id)a3;
- (id)_selectableTimeFontConfigurationForProposedTimeFontConfiguration:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)actionsMenuWithChildren:(id)a3;
- (id)additionalFontConfigurationsForFontAndColorPickerViewController:(id)a3;
- (id)additionalFontConfigurationsForFontAndContentStylePickerViewController:(id)a3;
- (id)coordinatorForContentStyle:(id)a3 forAmbientStylePicker:(id)a4;
- (id)defaultTitleStyleConfigurationForLook:(id)a3;
- (id)delegateSafeForCallbackType:(int64_t)a3;
- (id)disableSwitchingLooksForReason:(id)a3;
- (id)effectiveTitleStyleConfigurationForLook:(id)a3;
- (id)extensionBundle;
- (id)extensionBundleURL;
- (id)homeScreenConfigurationWithPosterProvidedColorConfigurations;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)viewControllerForPresentingViewControllersCreatingIfNecessary:(BOOL)a3;
- (id)viewForMenuElementIdentifier:(id)a3;
- (int64_t)acceptButtonType;
- (int64_t)editingContext;
- (int64_t)focusedComplicationElement;
- (int64_t)focusedQuickActionPosition;
- (int64_t)status;
- (int64_t)variant;
- (unint64_t)backgroundTypeForLuminance:(double)a3;
- (unint64_t)timeViewControllerDisplayedElements;
- (void)_acquireModalPresentationAssertionForViewController:(id)a3;
- (void)_applyStylePropertiesFromConfiguredProperties:(id)a3 toConfiguredProperties:(id)a4 forLook:(id)a5;
- (void)_closeButtonTapped:(id)a3;
- (void)_discardRootViewController;
- (void)_handleTitleStyleEditorChange:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_presentFontAndColorPickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 colorPickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9;
- (void)_presentFontAndContentStylePickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 contentStylePickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9;
- (void)_rebuildRootViewController;
- (void)_refetchLooksAndBuildUI;
- (void)_refetchLooksForProperties;
- (void)_refreshDefaultTitleStyleConfigurationsForLooks:(id)a3 luminanceForLooks:(id)a4 initialLook:(id)a5 configuredTitleStyleConfiguration:(id)a6;
- (void)_togglePerspectiveZoom;
- (void)_updateAppearance:(int64_t)a3;
- (void)_updatePresentingModalViewController;
- (void)ambientEditingTitledViewControllerWantsToClose:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)createColorVariationStoreIfNeeded;
- (void)dealloc;
- (void)didFinishTransitionToLook:(id)a3;
- (void)didPresentViewController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4;
- (void)fontAndColorPickerViewControllerDidFinish:(id)a3;
- (void)fontAndContentStylePickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4;
- (void)fontAndContentStylePickerViewControllerDidFinish:(id)a3;
- (void)handleNotificationForwardAction:(id)a3;
- (void)invalidateAllLookSwitchingAssertions;
- (void)invalidateAllPresentationAssertionsByViewController;
- (void)makeViewControllerForRemoteViewControllerPresentations;
- (void)presentAmbientColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4;
- (void)presentAmbientContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4;
- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4;
- (void)presentColorPickerWithPrompt:(id)a3 suggestedColors:(id)a4 selectedColor:(id)a5 changeHandler:(id)a6;
- (void)presentContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4;
- (void)presentTimeStyleEditor;
- (void)presentTitledViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentedViewControllerDismissalDidEnd:(id)a3;
- (void)presentedViewControllerDismissalWillBegin:(id)a3;
- (void)removeLookSwitchingAssertion:(id)a3;
- (void)requestDismissalWithAction:(int64_t)a3;
- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setAcceptButtonType:(int64_t)a3;
- (void)setAlternateDateEnabled:(BOOL)a3;
- (void)setComplicationSidebarConfigured:(BOOL)a3;
- (void)setComplicationsDisallowed:(BOOL)a3;
- (void)setComplicationsRowConfigured:(BOOL)a3;
- (void)setComplicationsVibrancyConfiguration:(id)a3;
- (void)setConfiguredProperties:(id)a3;
- (void)setControlsHidden:(BOOL)a3;
- (void)setCoveredByHostModalPresentation:(BOOL)a3;
- (void)setCoveredByHostModalPresentationDisableLookSwitchingAssertion:(id)a3;
- (void)setCurrentLook:(id)a3;
- (void)setDepthEffectDisallowed:(BOOL)a3;
- (void)setDepthEffectEnabled:(BOOL)a3;
- (void)setDismissingPresentedViewControllerFromTitledViewController:(BOOL)a3;
- (void)setEditingContext:(int64_t)a3;
- (void)setEditingFocusActive:(BOOL)a3;
- (void)setFocusedComplicationElement:(int64_t)a3;
- (void)setFocusedQuickActionPosition:(int64_t)a3;
- (void)setFontAndColorPickerViewController:(id)a3;
- (void)setFontAndContentStylePickerViewController:(id)a3;
- (void)setHasUpdatedLookProperties:(BOOL)a3;
- (void)setHasUpdatedLooks:(BOOL)a3;
- (void)setHorizontalTitleBoundingRect:(CGRect)a3;
- (void)setInitialLook:(id)a3;
- (void)setInlineComplicationConfigured:(BOOL)a3;
- (void)setLeadingTopButtonFrame:(CGRect)a3;
- (void)setLooksScrollingDecelerationRate:(double)a3;
- (void)setModalPresentationAssertions:(id)a3;
- (void)setModalPresentationAssertionsByViewController:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPerspectiveZoomDisallowed:(BOOL)a3;
- (void)setPerspectiveZoomEnabled:(BOOL)a3;
- (void)setPopoverPresentationController:(id)a3;
- (void)setPosterRole:(id)a3;
- (void)setPresentingModalViewController:(BOOL)a3;
- (void)setPresentingModalViewControllerDisableLookSwitchingAssertion:(id)a3;
- (void)setRemoteViewControllerPresentationWindow:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTitleString:(id)a3;
- (void)setTrailingTopButtonFrame:(CGRect)a3;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)setVariant:(int64_t)a3;
- (void)setVerticalTitleBoundingRect:(CGRect)a3;
- (void)setViewsSharedBetweenLooks:(BOOL)a3;
- (void)toggleDepthEffect;
- (void)updateActions;
- (void)updateLookProperties;
- (void)updateLooks;
- (void)updateLuminanceValuesForLooks;
- (void)updateRootViewControllerMenus;
- (void)updateScrollViewDecelerationRate:(id)a3;
@end

@implementation PREditor

- (PREditor)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREditor;
  v6 = [(PREditor *)&v12 init];
  if (v6)
  {
    uint64_t v7 = PRComplicationsSceneWorkspace();
    sceneWorkspace = v6->_sceneWorkspace;
    v6->_sceneWorkspace = (FBSceneWorkspace *)v7;

    objc_storeStrong((id *)&v6->_delegate, a3);
    v6->_looksScrollingDecelerationRate = *(double *)MEMORY[0x1E4FB2EF0];
    v9 = objc_alloc_init(PROverridableDateProvider);
    dateProvider = v6->_dateProvider;
    v6->_dateProvider = v9;

    objc_storeStrong((id *)&v6->_posterRole, @"PRPosterRoleLockScreen");
    [(id)*MEMORY[0x1E4FB2608] _stopHangTracer];
  }

  return v6;
}

- (void)dealloc
{
  [(PREditor *)self invalidateAllLookSwitchingAssertions];
  [(PREditor *)self invalidateAllPresentationAssertionsByViewController];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PREditor;
  [(PREditor *)&v4 dealloc];
}

- (UIView)contentOverlayView
{
  return [(PREditorRootViewController *)self->_rootViewController contentOverlayView];
}

- (id)viewForMenuElementIdentifier:(id)a3
{
  return [(PREditorRootViewController *)self->_rootViewController viewForMenuElementIdentifier:a3];
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden || [(PREditor *)self variant] == 2;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BSDispatchQueueAssertMain();
  if (!v8)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"viewControllerToPresent != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditor presentViewController:animated:completion:]();
    }
LABEL_11:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1F7B28);
  }
  if (!self->_window)
  {
    v15 = [NSString stringWithFormat:@"this object is invalid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditor presentViewController:animated:completion:]();
    }
    goto LABEL_11;
  }
  if ([(PREditor *)self needsCustomViewControllerPresentationManager])
  {
    [v8 setTransitioningDelegate:self];
    [v8 setModalPresentationStyle:4];
  }
  v10 = [(PREditor *)self rootViewController];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_presentedViewControllerDismissalWillBegin_ name:*MEMORY[0x1E4FB2E68] object:v8];
  [v11 addObserver:self selector:sel_presentedViewControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:v8];
  objc_super v12 = (void *)MEMORY[0x1E4FB1EB0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__PREditor_presentViewController_animated_completion___block_invoke;
  v16[3] = &unk_1E54DAFB8;
  id v17 = v10;
  id v13 = v10;
  [v12 animateWithDuration:v16 animations:0.3];
  [(PREditor *)self _acquireModalPresentationAssertionForViewController:v8];
  v14 = [(PREditor *)self viewControllerForPresentingViewControllersCreatingIfNecessary:1];
  objc_msgSend(v14, "presentViewController:animated:completion:", v8, -[PREditor isViewControllerPresentationAnimationAllowed](self, "isViewControllerPresentationAnimationAllowed") & v6, v9);
  [(PREditor *)self didPresentViewController:v8];
}

uint64_t __54__PREditor_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTopButtonsHidden:1];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v7 = [(PREditor *)self rootViewController];
  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PREditor_dismissViewControllerAnimated_completion___block_invoke;
  v11[3] = &unk_1E54DAFB8;
  id v12 = v7;
  id v9 = v7;
  [v8 animateWithDuration:v11 animations:0.3];
  [(PREditor *)self setEditingFocusActive:0];
  v10 = [(PREditor *)self viewControllerForPresentingViewControllersCreatingIfNecessary:0];
  [v10 dismissViewControllerAnimated:v4 completion:v6];
}

uint64_t __53__PREditor_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTopButtonsHidden:0];
}

- (void)presentedViewControllerDismissalWillBegin:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(PREditor *)self viewControllerForPresentingViewControllersCreatingIfNecessary:0];
  id v6 = [v5 presentedViewController];

  if (v4 == v6)
  {
    uint64_t v7 = [(PREditor *)self rootViewController];

    if (v5 == v7)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__PREditor_presentedViewControllerDismissalWillBegin___block_invoke;
      v11[3] = &unk_1E54DAFB8;
      void v11[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.3];
    }
    id v8 = [(PREditor *)self modalPresentationAssertionsByViewController];
    id v9 = [v8 objectForKey:v4];

    [v9 invalidate];
    v10 = [(PREditor *)self modalPresentationAssertionsByViewController];
    [v10 removeObjectForKey:v4];

    [(PREditor *)self setEditingFocusActive:0];
  }
}

void __54__PREditor_presentedViewControllerDismissalWillBegin___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) rootViewController];
  [v1 setTopButtonsHidden:0];
}

- (void)presentedViewControllerDismissalDidEnd:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(PREditor *)self rootViewController];
  uint64_t v7 = [v6 presentedViewController];

  if (v5 == v7)
  {
    id v8 = [v4 userInfo];
    id v9 = [v8 objectForKey:*MEMORY[0x1E4FB2E58]];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 removeObserver:self name:*MEMORY[0x1E4FB2E68] object:v5];
      [v11 removeObserver:self name:*MEMORY[0x1E4FB2E60] object:v5];
      [(PREditor *)self setEditingFocusActive:0];
    }
    else
    {
      [(PREditor *)self _acquireModalPresentationAssertionForViewController:v5];
      [(PREditor *)self setEditingFocusActive:1];
      id v12 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__PREditor_presentedViewControllerDismissalDidEnd___block_invoke;
      v13[3] = &unk_1E54DAFB8;
      id v14 = v6;
      [v12 animateWithDuration:v13 animations:0.3];
    }
  }
}

uint64_t __51__PREditor_presentedViewControllerDismissalDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTopButtonsHidden:1];
}

- (void)presentTitledViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  if ([(PREditor *)self variant] == 2)
  {
    id v14 = [[PRAmbientEditingTitledViewController alloc] initWithContentViewController:v9];

    [(PRAmbientEditingTitledViewController *)v14 setDelegate:self];
    [(PREditor *)self presentViewController:v14 animated:v5 completion:v8];
  }
  else
  {
    id v14 = (PRAmbientEditingTitledViewController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];

    int v10 = [(PRAmbientEditingTitledViewController *)v14 sheetPresentationController];
    [v10 setPreferredCornerRadius:PRSheetCornerRadius()];
    v11 = [(PRAmbientEditingTitledViewController *)v14 navigationBar];
    id v12 = [v11 topItem];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
    [v12 setRightBarButtonItem:v13];
    [(PREditor *)self presentViewController:v14 animated:v5 completion:v8];

    id v8 = v10;
  }
}

- (void)_closeButtonTapped:(id)a3
{
}

- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3
{
}

- (id)disableSwitchingLooksForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PREditorLookSwitchingAssertion alloc] initWithEditor:self reason:v4];

  lookSwitchingAssertions = self->_lookSwitchingAssertions;
  if (!lookSwitchingAssertions)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = self->_lookSwitchingAssertions;
    self->_lookSwitchingAssertions = v7;

    lookSwitchingAssertions = self->_lookSwitchingAssertions;
  }
  [(NSHashTable *)lookSwitchingAssertions addObject:v5];
  id v9 = [(PREditor *)self rootViewController];
  int v10 = [v9 scrollView];

  [v10 setScrollEnabled:0];
  return v5;
}

- (void)invalidateAllLookSwitchingAssertions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = (void *)[(NSHashTable *)self->_lookSwitchingAssertions copy];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)invalidateAllPresentationAssertionsByViewController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PREditor *)self modalPresentationAssertionsByViewController];
  uint64_t v3 = (void *)[v2 copy];
  uint64_t v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeLookSwitchingAssertion:(id)a3
{
  [(NSHashTable *)self->_lookSwitchingAssertions removeObject:a3];
  if (![(NSHashTable *)self->_lookSwitchingAssertions count])
  {
    uint64_t v4 = [(PREditor *)self rootViewController];
    id v5 = [v4 scrollView];

    [v5 setScrollEnabled:1];
  }
}

- (void)setLooksScrollingDecelerationRate:(double)a3
{
  if (self->_looksScrollingDecelerationRate != a3)
  {
    self->_looksScrollingDecelerationRate = a3;
    uint64_t v4 = [(PREditor *)self rootViewController];
    id v5 = [v4 scrollView];

    [(PREditor *)self updateScrollViewDecelerationRate:v5];
  }
}

- (void)updateScrollViewDecelerationRate:(id)a3
{
  id v7 = a3;
  [(PREditor *)self looksScrollingDecelerationRate];
  double v5 = v4;
  double v6 = *MEMORY[0x1E4FB2EE8];
  if (v5 != *MEMORY[0x1E4FB2EE8]) {
    double v6 = *MEMORY[0x1E4FB2EF0];
  }
  [v7 setDecelerationRate:v6];
  [v7 setPagingEnabled:v5 != -100.0];
}

- (void)setCurrentLook:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (PREditingLook *)[v7 copy];
    currentLook = self->_currentLook;
    self->_currentLook = v4;

    double v6 = [(PREditor *)self rootViewController];
    [v6 currentLookDidChange];
  }
}

- (void)updateLooks
{
  if ([(PREditor *)self displaysRootViewController])
  {
    [(PREditor *)self setHasUpdatedLooks:1];
    [(PREditor *)self _rebuildRootViewController];
    [(PREditor *)self _refetchLooksAndBuildUI];
  }
}

- (void)updateLookProperties
{
  if ([(PREditor *)self displaysRootViewController])
  {
    [(PREditor *)self setHasUpdatedLookProperties:1];
    uint64_t v3 = [(PREditor *)self _refetchLooksForProperties];
    double v4 = [(PRPosterEditingEnvironment *)self->_environment targetConfiguredProperties];
    double v5 = [v4 titleStyleConfiguration];
    double v6 = [(PREditor *)self _contentLuminanceValuesForCurrentLooks];
    id v7 = [(PREditor *)self initialLook];
    [(PREditor *)self _refreshDefaultTitleStyleConfigurationsForLooks:v3 luminanceForLooks:v6 initialLook:v7 configuredTitleStyleConfiguration:v5];

    uint64_t v8 = [(PREditor *)self currentLook];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__PREditor_updateLookProperties__block_invoke;
    v22[3] = &unk_1E54DB290;
    id v23 = v8;
    id v9 = v8;
    long long v10 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v22);
    long long v11 = [(PREditor *)self configuredProperties];
    long long v12 = v11;
    if (v11)
    {
      id v20 = v9;
      v21 = v4;
      id v13 = [v11 titleStyleConfiguration];
      uint64_t v14 = [v13 titleColor];
      int v15 = [v14 isSuggested];

      if (v15)
      {
        v16 = [(PREditor *)self defaultTitleStyleConfigurationForLook:v10];
        id v17 = (void *)[v13 mutableCopy];
        v18 = [v16 titleColor];
        [v17 setTitleColor:v18];

        [v12 setTitleStyleConfiguration:v17];
      }

      id v9 = v20;
      double v4 = v21;
    }
    [(PREditor *)self setCurrentLook:v10];
    v19 = [(PREditor *)self rootViewController];
    [v19 setLooks:v3 forUpdatingProperties:1];
  }
}

uint64_t __32__PREditor_updateLookProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  double v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_defaultLuminanceValuesForLooks:(id)a3 initialLook:(id)a4 initialLookLuminanceValue:(double)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        double v16 = a5;
        if (v15 != v8) {
          +[PRPosterTitleStyleConfiguration defaultContentsLuminance];
        }
        id v17 = objc_msgSend(NSNumber, "numberWithDouble:", v16, (void)v19);
        [v9 setObject:v17 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)updateLuminanceValuesForLooks
{
  uint64_t v3 = [(PREditor *)self rootViewController];

  if (v3)
  {
    id v18 = [(PREditor *)self _contentLuminanceValuesForCurrentLooks];
    double v4 = -[PREditor _refreshLuminanceValuesForCurrentPerLookLuminanceValues:](self, "_refreshLuminanceValuesForCurrentPerLookLuminanceValues:");
    uint64_t v5 = [(PREditor *)self rootViewController];
    double v6 = [v5 looks];

    id v7 = [(PRPosterEditingEnvironment *)self->_environment targetConfiguredProperties];
    id v8 = [v7 titleStyleConfiguration];
    id v9 = [(PREditor *)self initialLook];
    [(PREditor *)self _refreshDefaultTitleStyleConfigurationsForLooks:v6 luminanceForLooks:v4 initialLook:v9 configuredTitleStyleConfiguration:v8];

    id v10 = [(PREditor *)self configuredProperties];
    uint64_t v11 = [v10 titleStyleConfiguration];
    uint64_t v12 = [(PREditor *)self currentLook];
    uint64_t v13 = [v4 objectForKeyedSubscript:v12];
    [v13 doubleValue];
    double v15 = v14;

    if (v11)
    {
      double v16 = (void *)[v11 mutableCopy];
      [v16 setContentsLuminance:v15];
      [v10 setTitleStyleConfiguration:v16];
    }
    [(PREditingFontAndContentStylePickerViewController *)self->_fontAndContentStylePickerViewController setContentsLuminance:v15];
    [(PREditingFontAndColorPickerViewController *)self->_fontAndColorPickerViewController setContentsLuminance:v15];
    id v17 = [(PREditor *)self rootViewController];
    [v17 lookBackgroundTypesDidChange];
  }
}

- (id)_contentLuminanceValuesForCurrentLooks
{
  uint64_t v3 = [(PREditor *)self rootViewController];
  double v4 = [v3 looks];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PREditor__contentLuminanceValuesForCurrentLooks__block_invoke;
  v8[3] = &unk_1E54DB2B8;
  v8[4] = self;
  uint64_t v5 = objc_msgSend(v4, "bs_map:", v8);
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4];

  return v6;
}

id __50__PREditor__contentLuminanceValuesForCurrentLooks__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) defaultTitleStyleConfigurationForLook:a2];
  uint64_t v3 = NSNumber;
  [v2 contentsLuminance];
  double v4 = objc_msgSend(v3, "numberWithDouble:");

  return v4;
}

- (id)_refreshLuminanceValuesForCurrentPerLookLuminanceValues:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [PREditorElementLayoutController alloc];
    id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v8 = [(PREditorElementLayoutController *)v6 initWithTraitEnvironment:v7];

    id v9 = [(PREditor *)self posterRole];
    int v10 = [v9 isEqualToString:@"PRPosterRoleIncomingCall"];

    v39 = (void *)v8;
    if (v10)
    {
      uint64_t v11 = [(PREditor *)self configuredProperties];
      uint64_t v12 = [v11 titleStyleConfiguration];
      uint64_t v13 = [(PREditor *)self titleString];
      uint64_t v14 = [v12 effectiveTitleLayoutForText:v13];

      double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 bounds];
      double v16 = (void *)v8;
      uint64_t v17 = 1;
      uint64_t v18 = v14;
    }
    else
    {
      double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 bounds];
      double v16 = (void *)v8;
      uint64_t v17 = 15;
      uint64_t v18 = 0;
    }
    long long v20 = objc_msgSend(v16, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", v17, 0, v18);

    v38 = v20;
    [v20 rect];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    long long v19 = (void *)[v4 mutableCopy];
    id v40 = v4;
    v29 = [v4 allKeys];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          objc_msgSend(v5, "editor:luminanceForLook:inRect:", self, v34, v22, v24, v26, v28);
          if (v35 <= 1.0 && v35 >= 0.0)
          {
            v36 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v19 setObject:v36 forKeyedSubscript:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v31);
    }

    id v4 = v40;
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (unint64_t)backgroundTypeForLuminance:(double)a3
{
  PRPosterContentsBackgroundTypeForLuminance(a3);
  return PRPosterContentsBackgroundTypeForLuminance(a3);
}

- (void)updateActions
{
  id v6 = [(PREditor *)self delegateSafeForCallbackType:3];
  uint64_t v3 = [(PREditor *)self rootViewController];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v6 leadingMenuElementsForEditor:self];
  }
  else
  {
    id v4 = 0;
  }
  [v3 setLeadingMenuElements:v4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v6 trailingMenuElementsForEditor:self];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v3 setTrailingMenuElements:v5];
  [v3 _updateMenuElements];
}

- (id)actionsMenuWithChildren:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  uint64_t v5 = [v3 systemImageNamed:@"ellipsis.circle.fill"];
  id v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED9A3120 image:v5 identifier:@"PREditor.ActionsMenu" options:0 children:v4];

  return v6;
}

- (id)defaultTitleStyleConfigurationForLook:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_defaultTitleStyleConfigurationPerLook objectForKey:a3];
  if (!v4)
  {
    uint64_t v5 = PRLogEditing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      defaultTitleStyleConfigurationPerLook = self->_defaultTitleStyleConfigurationPerLook;
      int v8 = 134218240;
      id v9 = defaultTitleStyleConfigurationPerLook;
      __int16 v10 = 2048;
      uint64_t v11 = [(NSMutableDictionary *)defaultTitleStyleConfigurationPerLook count];
      _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "defaultTitleStyleConfigurationForLook: failed. _defaultTitleStyleConfigurationPerLook=%p, count=%lu", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4;
}

- (id)effectiveTitleStyleConfigurationForLook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PREditor *)self configuredProperties];
  id v6 = [v5 titleStyleConfiguration];
  id v7 = [(PREditor *)self defaultTitleStyleConfigurationForLook:v4];

  if (!v6
    || ![(PREditor *)self shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:v6])
  {
    id v10 = v7;
    goto LABEL_13;
  }
  int v8 = [(PREditor *)self delegate];
  if (!v8)
  {
    uint64_t v9 = 1;
LABEL_11:
    uint64_t v14 = 1;
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [v8 editorShouldAllowUserToAdjustTimeColor:self];
  }
  else {
    uint64_t v9 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v11 = [v6 timeFontConfiguration];
  uint64_t v12 = [(PREditor *)self extensionBundleURL];
  uint64_t v13 = [v11 timeFontConfigurationWithExtensionBundleURL:v12];

  uint64_t v14 = [v8 editor:self shouldAllowUserToSelectTimeFontConfiguration:v13];
LABEL_12:
  id v10 = [v6 resolvedWithLookDefaultTitleStyleConfiguration:v7 allowTitleColorUpdates:v9 allowTitleFontUpdates:v14];

LABEL_13:
  return v10;
}

- (void)createColorVariationStoreIfNeeded
{
  if (!self->_colorVariationStore)
  {
    id v7 = [(PREditor *)self configuredProperties];
    uint64_t v3 = [v7 colorVariationsConfiguration];
    id v4 = [v3 variationStorage];
    uint64_t v5 = -[PREditingColorVariationStore initWithVariationStorage:version:]([PREditingColorVariationStore alloc], "initWithVariationStorage:version:", v4, [v3 version]);
    colorVariationStore = self->_colorVariationStore;
    self->_colorVariationStore = v5;
  }
}

- (void)presentColorPickerWithPrompt:(id)a3 suggestedColors:(id)a4 selectedColor:(id)a5 changeHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = objc_alloc_init(PREditorColorPickerConfiguration);
  [(PREditorColorPickerConfiguration *)v14 setPrompt:v13];

  [(PREditorColorPickerConfiguration *)v14 setSelectedColor:v11];
  [(PREditorColorPickerConfiguration *)v14 setSuggestedColors:v12];

  [(PREditor *)self presentColorPickerWithConfiguration:v14 changeHandler:v10];
}

- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PREditor *)self variant] == 2)
  {
    [(PREditor *)self presentAmbientColorPickerWithConfiguration:v6 changeHandler:v7];
  }
  else
  {
    int v8 = [v6 colorPickerSourceItem];
    uint64_t v9 = [v6 prompt];
    id v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v11 = [v10 userInterfaceIdiom] == 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PREditor_presentColorPickerWithConfiguration_changeHandler___block_invoke;
    v12[3] = &unk_1E54DB2E0;
    id v13 = v6;
    id v14 = v7;
    [(PREditor *)self _presentFontAndColorPickerWithPrompt:v9 titleStyleConfiguration:0 colorPickerConfiguration:v13 usingPopoverPresentation:v11 popoverSourceItem:v8 popoverDirection:2 changeHandler:v12];
  }
}

void __62__PREditor_presentColorPickerWithConfiguration_changeHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v11 = [a9 color];
  id v10 = v11;
  if (([*(id *)(a1 + 32) includesObjectsOfTypePRPickerColor] & 1) == 0)
  {
    id v10 = [v11 color];
  }
  if (v10) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)presentContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PREditor *)self variant] == 2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke;
    v15[3] = &unk_1E54DB308;
    id v16 = v7;
    id v8 = v7;
    [(PREditor *)self presentAmbientContentStylePickerWithConfiguration:v6 changeHandler:v15];
    id v9 = v16;
  }
  else
  {
    id v8 = [v6 contentStylePickerSourceItem];
    id v10 = [v6 prompt];
    id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v12 = [v11 userInterfaceIdiom] == 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke_2;
    v13[3] = &unk_1E54DB330;
    id v14 = v7;
    id v9 = v7;
    [(PREditor *)self _presentFontAndContentStylePickerWithPrompt:v10 titleStyleConfiguration:0 contentStylePickerConfiguration:v6 usingPopoverPresentation:v12 popoverSourceItem:v8 popoverDirection:2 changeHandler:v13];
  }
}

uint64_t __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 contentStyle];
  id v4 = [v3 isSuggestedContentStyle];

  (*(void (**)(uint64_t, id, BOOL))(v2 + 16))(v2, v5, v4 != 0);
}

- (void)_presentFontAndContentStylePickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 contentStylePickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9
{
  BOOL v71 = a6;
  v81[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v75 = a7;
  id v73 = a9;
  id v72 = a4;
  id v14 = a3;
  double v15 = [(PREditor *)self posterRole];
  if ([v15 isEqual:@"PRPosterRoleIncomingCall"])
  {
    id v16 = [(PREditor *)self titleString];
    if (objc_msgSend(v16, "pr_isSuitableForArabicJustification")) {
      int v17 = _os_feature_enabled_impl();
    }
    else {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 0;
  }

  uint64_t v18 = [(PREditor *)self posterRole];
  if ([v18 isEqual:@"PRPosterRoleIncomingCall"])
  {
    long long v19 = [(PREditor *)self titleString];
    unsigned int v20 = objc_msgSend(v19, "pr_isSuitableForVerticalLayout");
  }
  else
  {
    unsigned int v20 = 0;
  }
  BOOL v21 = a4 != 0;

  double v22 = [(PREditor *)self posterRole];
  int v23 = [v22 isEqual:@"PRPosterRoleIncomingCall"] ^ 1;
  if (v13) {
    BOOL v24 = a4 != 0;
  }
  else {
    BOOL v24 = 1;
  }
  BOOL v25 = (v24 & v23) == 0;
  uint64_t v26 = 2;
  if (v25) {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v26 | v21;
  if (v13) {
    v27 |= 4uLL;
  }
  uint64_t v28 = v27 | 8;
  if (!(v21 & v20)) {
    uint64_t v28 = v27;
  }
  if (v17) {
    v28 |= 0x10uLL;
  }
  if (a4) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = v27;
  }

  uint64_t v30 = [v13 selectedStyle];
  uint64_t v31 = objc_opt_class();
  id v32 = v30;
  if (v31)
  {
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }
  id v34 = v33;

  if (v34
    && [v34 allowsVariation]
    && [v34 needsToResolveVariationFromColorStore])
  {
    [(PREditor *)self createColorVariationStoreIfNeeded];
    v69 = [v13 identifier];
    double v35 = [v34 colors];
    v36 = [v35 firstObject];

    double v78 = 0.0;
    v37 = -[PREditingColorVariationStore baseColorForVariedColor:forContextIdentifier:variation:forDataLayerPicker:](self->_colorVariationStore, "baseColorForVariedColor:forContextIdentifier:variation:forDataLayerPicker:", v36, v69, &v78, [v13 isForTitleStylePicker]);
    if (v37)
    {
      id v68 = v37;
      int v38 = [v34 isVibrant];
      v39 = [PRPosterContentDiscreteColorsStyle alloc];
      if (v38)
      {
        v81[0] = v68;
        uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
        long long v41 = v39;
        long long v42 = (void *)v40;
        uint64_t v43 = [(PRPosterContentDiscreteColorsStyle *)v41 initWithVibrantColors:v40 variation:v78];
      }
      else
      {
        id v80 = v68;
        uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        v45 = v39;
        long long v42 = (void *)v44;
        uint64_t v43 = [(PRPosterContentDiscreteColorsStyle *)v45 initWithOpaqueColors:v44 variation:v78];
      }
      uint64_t v46 = (void *)v43;

      [v13 setSelectedStyle:v46];
      v37 = v68;
    }
  }
  v47 = [PREditingFontAndContentStylePickerViewController alloc];
  v48 = [(PREditor *)self posterRole];
  v49 = [(PREditor *)self titleString];
  v50 = [(PREditingFontAndContentStylePickerViewController *)v47 initWithComponents:v29 role:v48 titleString:v49];

  [(PREditingFontAndContentStylePickerViewController *)v50 setDelegate:self];
  [(PREditingFontAndContentStylePickerViewController *)v50 setTitle:v14];

  [(PREditingFontAndContentStylePickerViewController *)v50 setContentStylePickerConfiguration:v13];
  [(PREditingFontAndContentStylePickerViewController *)v50 setTitleStyleConfiguration:v72];

  v51 = [(PREditor *)self extensionBundleURL];
  [(PREditingFontAndContentStylePickerViewController *)v50 setExtensionBundleURL:v51];

  [(PREditingFontAndContentStylePickerViewController *)v50 setChangeHandler:v73];
  v52 = [(PREditingFontAndContentStylePickerViewController *)v50 navigationItem];
  [v52 _setBackgroundHidden:1];

  v53 = [(PREditor *)self currentLook];
  v54 = [(PREditor *)self effectiveTitleStyleConfigurationForLook:v53];
  [v54 contentsLuminance];
  double v56 = v55;

  [(PREditingFontAndContentStylePickerViewController *)v50 setContentsLuminance:v56];
  objc_storeStrong((id *)&self->_fontAndContentStylePickerViewController, v50);
  v57 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v50];
  v58 = v57;
  v59 = v75;
  if (v75 && v71)
  {
    [v57 setModalPresentationStyle:7];
    v60 = [v58 popoverPresentationController];
    [v60 setSourceItem:v75];
    [v60 setPermittedArrowDirections:a8];
    [v60 popoverLayoutMargins];
    objc_msgSend(v60, "setPopoverLayoutMargins:", 90.0, v61, 5.0, 5.0);
    [v60 setDelegate:v50];
    if (a4) {
      [(PREditor *)self setPopoverPresentationController:v60];
    }
  }
  else
  {
    id v74 = v32;
    v62 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v63 = [v62 userInterfaceIdiom];

    if (v63 == 1) {
      [v58 setModalPresentationStyle:2];
    }
    v60 = [v58 sheetPresentationController];
    v64 = (void *)MEMORY[0x1E4FB1C30];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __186__PREditor__presentFontAndContentStylePickerWithPrompt_titleStyleConfiguration_contentStylePickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke;
    v76[3] = &unk_1E54DB358;
    v65 = v50;
    v77 = v65;
    v66 = [v64 customDetentWithIdentifier:@"FontAndContentStylePickerDodge" resolver:v76];
    v79 = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    [v60 setDetents:v67];

    [v60 setLargestUndimmedDetentIdentifier:@"FontAndContentStylePickerDodge"];
    [v60 setPreferredCornerRadius:PRSheetCornerRadius()];
    [v60 setDelegate:v65];

    id v32 = v74;
    v59 = v75;
  }

  [(PREditor *)self presentViewController:v58 animated:1 completion:0];
}

uint64_t __186__PREditor__presentFontAndContentStylePickerWithPrompt_titleStyleConfiguration_contentStylePickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) desiredDetent];
}

- (void)_presentFontAndColorPickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 colorPickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9
{
  BOOL v53 = a6;
  v58[1] = *MEMORY[0x1E4F143B8];
  id v55 = a7;
  id v54 = a9;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PREditor *)self posterRole];
  if ([v16 isEqual:@"PRPosterRoleIncomingCall"])
  {
    int v17 = [(PREditor *)self titleString];
    if (objc_msgSend(v17, "pr_isSuitableForArabicJustification")) {
      int v18 = _os_feature_enabled_impl();
    }
    else {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  long long v19 = [(PREditor *)self posterRole];
  if ([v19 isEqual:@"PRPosterRoleIncomingCall"])
  {
    unsigned int v20 = [(PREditor *)self titleString];
    unsigned int v21 = objc_msgSend(v20, "pr_isSuitableForVerticalLayout");
  }
  else
  {
    unsigned int v21 = 0;
  }
  BOOL v22 = a4 != 0;

  int v23 = [(PREditor *)self posterRole];
  int v24 = [v23 isEqual:@"PRPosterRoleIncomingCall"] ^ 1;
  if (v13) {
    BOOL v25 = a4 != 0;
  }
  else {
    BOOL v25 = 1;
  }
  BOOL v26 = (v25 & v24) == 0;
  uint64_t v27 = 2;
  if (v26) {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v27 | v22;
  if (v13) {
    v28 |= 4uLL;
  }
  uint64_t v29 = v28 | 8;
  if (!(v22 & v21)) {
    uint64_t v29 = v28;
  }
  if (v18) {
    v29 |= 0x10uLL;
  }
  if (a4) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = v28;
  }

  [(PREditor *)self createColorVariationStoreIfNeeded];
  uint64_t v31 = [PREditingFontAndColorPickerViewController alloc];
  id v32 = [(PREditor *)self posterRole];
  v33 = [(PREditor *)self titleString];
  id v34 = [(PREditingFontAndColorPickerViewController *)v31 initWithComponents:v30 role:v32 titleString:v33];

  [(PREditingFontAndColorPickerViewController *)v34 setDelegate:self];
  [(PREditingFontAndColorPickerViewController *)v34 setTitle:v15];

  [(PREditingFontAndColorPickerViewController *)v34 setColorPickerConfiguration:v13];
  [(PREditingFontAndColorPickerViewController *)v34 setTitleStyleConfiguration:v14];

  double v35 = [(PREditor *)self extensionBundleURL];
  [(PREditingFontAndColorPickerViewController *)v34 setExtensionBundleURL:v35];

  [(PREditingFontAndColorPickerViewController *)v34 setColorVariationStore:self->_colorVariationStore];
  [(PREditingFontAndColorPickerViewController *)v34 setChangeHandler:v54];

  v36 = [(PREditingFontAndColorPickerViewController *)v34 navigationItem];
  [v36 _setBackgroundHidden:1];

  v37 = [(PREditor *)self currentLook];
  int v38 = [(PREditor *)self effectiveTitleStyleConfigurationForLook:v37];
  [v38 contentsLuminance];
  double v40 = v39;

  [(PREditingFontAndColorPickerViewController *)v34 setContentsLuminance:v40];
  objc_storeStrong((id *)&self->_fontAndColorPickerViewController, v34);
  long long v41 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v34];
  long long v42 = v41;
  if (v55 && v53)
  {
    [v41 setModalPresentationStyle:7];
    uint64_t v43 = [v42 popoverPresentationController];
    [v43 setSourceItem:v55];
    [v43 setPermittedArrowDirections:a8];
    [v43 popoverLayoutMargins];
    objc_msgSend(v43, "setPopoverLayoutMargins:", 90.0, v44, 5.0, 5.0);
    [v43 setDelegate:v34];
    if (a4) {
      [(PREditor *)self setPopoverPresentationController:v43];
    }
  }
  else
  {
    v45 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v46 = [v45 userInterfaceIdiom];

    if (v46 == 1) {
      [v42 setModalPresentationStyle:2];
    }
    v47 = [v42 sheetPresentationController];
    v48 = (void *)MEMORY[0x1E4FB1C30];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __172__PREditor__presentFontAndColorPickerWithPrompt_titleStyleConfiguration_colorPickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke;
    v56[3] = &unk_1E54DB358;
    v49 = v34;
    v57 = v49;
    v50 = [v48 customDetentWithIdentifier:@"FontAndColorPickerDodge" resolver:v56];
    v58[0] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    [v47 setDetents:v51];

    [v47 setLargestUndimmedDetentIdentifier:@"FontAndColorPickerDodge"];
    [v47 setPreferredCornerRadius:PRSheetCornerRadius()];
    [v47 setDelegate:v49];
  }
  [(PREditor *)self presentViewController:v42 animated:1 completion:0];
}

uint64_t __172__PREditor__presentFontAndColorPickerWithPrompt_titleStyleConfiguration_colorPickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) desiredDetent];
}

- (void)presentAmbientColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PREditor *)self safeAreaBounds];
  CGRect v16 = CGRectInset(v15, 50.0, 0.0);
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  BOOL v12 = [PREditingAmbientColorPickerViewController alloc];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  id v13 = [(PREditingAmbientColorPickerViewController *)v12 initWithColorPickerConfiguration:v7 width:v6 changeHandler:CGRectGetWidth(v17)];

  [(PREditor *)self presentTitledViewController:v13 animated:1 completion:0];
}

- (void)presentAmbientContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PREditor *)self safeAreaBounds];
  CGRect v16 = CGRectInset(v15, 50.0, 0.0);
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  BOOL v12 = [PREditingAmbientContentStylePickerViewController alloc];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  id v13 = [(PREditingAmbientContentStylePickerViewController *)v12 initWithContentStylePickerConfiguration:v7 width:v6 changeHandler:CGRectGetWidth(v17)];

  [(PREditor *)self presentTitledViewController:v13 animated:1 completion:0];
}

- (void)presentTimeStyleEditor
{
  v54[2] = *MEMORY[0x1E4F143B8];
  if ([(PREditor *)self isCoveredByHostModalPresentation]) {
    return;
  }
  uint64_t v46 = [(PREditor *)self configuredProperties];
  v47 = [(PREditor *)self currentLook];
  v48 = [(PREditor *)self defaultTitleStyleConfigurationForLook:v47];
  id v3 = [v46 titleStyleConfiguration];
  uint64_t v4 = [v3 copy];

  id v50 = (id)v4;
  if (!v4) {
    id v50 = v48;
  }
  v45 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (!v45) {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v45 editorShouldAllowUserToAdjustTimeColor:self])
    {
      goto LABEL_15;
    }
LABEL_10:
    id v5 = [(PREditor *)self delegateSafeForCallbackType:3];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v5 titleContentStylePickerConfigurationForEditor:self];
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v49 = [v5 timeColorPickerConfigurationForEditor:self];
        id v7 = [v49 selectedColor];
        id v8 = [v7 contentStyle];

        id v9 = [v49 colorPalette];
        id v10 = v9;
        if (v9)
        {
          id v11 = [v9 colors];
          BOOL v12 = objc_alloc_init(PRPosterContentVibrantMaterialStyle);
          v54[0] = v12;
          id v13 = objc_alloc_init(PRPosterContentVibrantMonochromeStyle);
          v54[1] = v13;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

          CGRect v15 = objc_msgSend(v11, "bs_map:", &__block_literal_global_13);
          CGRect v16 = [v14 arrayByAddingObjectsFromArray:v15];

          CGRect v17 = [PREditorContentStylePalette alloc];
          int v18 = [v10 localizedName];
          long long v19 = [(PREditorContentStylePalette *)v17 initWithContentStyles:v16 localizedName:v18];
        }
        else
        {
          long long v19 = 0;
        }
        uint64_t v22 = [v49 colorWellDisplayMode];
        if (v22 == 2) {
          uint64_t v23 = 2;
        }
        else {
          uint64_t v23 = v22 == 1;
        }
        int v24 = [PREditorContentStylePickerConfiguration alloc];
        BOOL v25 = [v49 identifier];
        BOOL v26 = [v49 prompt];
        id v6 = [(PREditorContentStylePickerConfiguration *)v24 initWithIdentifier:v25 prompt:v26 selectedStyle:v8 stylePalette:v19 colorWellDisplayMode:v23];

        -[PREditorContentStylePickerConfiguration setShowsSuggestedContentStyleItem:](v6, "setShowsSuggestedContentStyleItem:", [v49 showsSuggestedColorItem]);
        goto LABEL_23;
      }
      id v6 = objc_alloc_init(PREditorContentStylePickerConfiguration);
      [(PREditorContentStylePickerConfiguration *)v6 setColorWellDisplayMode:1];
    }
    v49 = 0;
LABEL_23:
    [(PREditorContentStylePickerConfiguration *)v6 setForTitleStylePicker:1];
    uint64_t v27 = [v48 titleContentStyle];
    if (v27
      && [(PREditorContentStylePickerConfiguration *)v6 showsSuggestedContentStyleItem])
    {
      [(PREditorContentStylePickerConfiguration *)v6 setSuggestedStyle:v27];
    }
    uint64_t v28 = [v50 effectiveTitleContentStyle];
    [(PREditorContentStylePickerConfiguration *)v6 setSelectedStyle:v28];
    uint64_t v29 = [(PREditorContentStylePickerConfiguration *)v6 stylePalette];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      uint64_t v31 = [(PFServerPosterPath *)self->_sourceContents role];
      id v32 = +[PREditorContentStylePalette defaultPaletteForContext:2 role:v31];

      [(PREditorContentStylePickerConfiguration *)v6 setStylePalette:v32];
      [(PREditorContentStylePickerConfiguration *)v6 setIdentifier:@"timeEditor"];
    }
    v33 = PRBundle();
    unsigned int v21 = [v33 localizedStringForKey:@"EDIT_TIME_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];

    goto LABEL_29;
  }
  if ([v45 editorShouldAllowUserToAdjustTitleContentStyle:self]) {
    goto LABEL_10;
  }
LABEL_15:
  unsigned int v20 = PRBundle();
  unsigned int v21 = [v20 localizedStringForKey:@"EDIT_TIME_PROMPT_FONT_ONLY" value:&stru_1ED9A3120 table:@"PosterKit"];

  v49 = 0;
  id v6 = 0;
LABEL_29:
  id v34 = [(PREditor *)self rootViewController];
  double v35 = [v34 titlePopoverLayoutGuide];

  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = 4;
  }
  v37 = [(PREditor *)self rootViewController];
  int v38 = [v37 view];
  double v39 = [v38 window];
  double v40 = [v39 windowScene];
  uint64_t v41 = [v40 interfaceOrientation];

  if ((unint64_t)(v41 - 1) < 2) {
    uint64_t v42 = 1;
  }
  else {
    uint64_t v42 = v36;
  }
  objc_initWeak(&location, self);
  uint64_t v43 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v44 = [v43 userInterfaceIdiom] == 1;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __34__PREditor_presentTimeStyleEditor__block_invoke_2;
  v51[3] = &unk_1E54DB3A0;
  objc_copyWeak(&v52, &location);
  [(PREditor *)self _presentFontAndContentStylePickerWithPrompt:v21 titleStyleConfiguration:v50 contentStylePickerConfiguration:v6 usingPopoverPresentation:v44 popoverSourceItem:v35 popoverDirection:v42 changeHandler:v51];

  [(PREditor *)self setEditingFocusActive:1];
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

id __34__PREditor_presentTimeStyleEditor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 contentStylePreferringVibrancy:1];
  if ([v2 allowsVariation])
  {
    uint64_t v3 = [v2 copyWithVariation:0.0];

    uint64_t v2 = (void *)v3;
  }
  return v2;
}

void __34__PREditor_presentTimeStyleEditor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleTitleStyleEditorChange:v3];
}

- (void)_handleTitleStyleEditorChange:(id)a3
{
  id v47 = a3;
  uint64_t v4 = [(PREditor *)self configuredProperties];
  if (!v4)
  {
    uint64_t v4 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    [(PREditor *)self setConfiguredProperties:v4];
  }
  id v5 = [(PRPosterConfiguredProperties *)v4 titleStyleConfiguration];
  id v6 = (void *)[v5 mutableCopy];
  if (!v6)
  {
    id v7 = [(PREditor *)self currentLook];
    id v8 = [(PREditor *)self defaultTitleStyleConfigurationForLook:v7];
    id v6 = (void *)[v8 mutableCopy];
  }
  uint64_t v9 = [v47 timeFontIdentifier];
  if (v9)
  {
    id v10 = [v47 isSystemItem];
    uint64_t v11 = [v10 BOOLValue];

    BOOL v12 = [[PRPosterSystemTimeFontConfiguration alloc] initWithTimeFontIdentifier:v9 systemItem:v11];
    [v6 setTimeFontConfiguration:v12];
    [v6 setUserConfigured:1];
  }
  id v13 = [v6 timeFontConfiguration];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      CGRect v16 = v15;
    }
    else {
      CGRect v16 = 0;
    }
  }
  else
  {
    CGRect v16 = 0;
  }
  id v17 = v16;

  int v18 = [v47 fontWeight];
  if (v18 && v17)
  {
    long long v19 = [PRPosterSystemTimeFontConfiguration alloc];
    unsigned int v20 = [v17 timeFontIdentifier];
    [v18 floatValue];
    uint64_t v22 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](v19, "initWithTimeFontIdentifier:weight:systemItem:", v20, [v17 isSystemItem], v21);

    [v6 setTimeFontConfiguration:v22];
    [v6 setUserConfigured:1];
  }
  uint64_t v23 = [(PREditor *)self extensionBundleURL];
  uint64_t v24 = [v47 customFont];
  if (v24)
  {
    BOOL v25 = [[PRPosterCustomTimeFontConfiguration alloc] initWithFont:v24 extensionBundleURL:v23];
    if (v25)
    {
      [v6 setTimeFontConfiguration:v25];
      [v6 setUserConfigured:1];
    }
  }
  BOOL v44 = v18;
  BOOL v26 = [v47 preferredTitleAlignment];
  uint64_t v27 = v26;
  if (v26)
  {
    objc_msgSend(v6, "setPreferredTitleAlignment:", objc_msgSend(v26, "unsignedIntegerValue"));
    [v6 setUserConfigured:1];
  }
  uint64_t v43 = (void *)v24;
  uint64_t v28 = [v47 preferredTitleLayout];
  uint64_t v29 = v28;
  if (v28)
  {
    objc_msgSend(v6, "setPreferredTitleLayout:", objc_msgSend(v28, "unsignedIntegerValue"));
    [v6 setUserConfigured:1];
  }
  v45 = v17;
  BOOL v30 = [v47 numberingSystem];
  if (v30)
  {
    [v6 setTimeNumberingSystem:v30];
    [v6 setUserConfigured:1];
  }
  uint64_t v46 = (void *)v9;
  uint64_t v31 = [v47 contentStyle];
  if (v31)
  {
    [v6 setTitleContentStyle:v31];
    [v6 setUserConfigured:1];
  }
  [(PRPosterConfiguredProperties *)v4 setTitleStyleConfiguration:v6];
  id v32 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    [v6 timeFontConfiguration];
    uint64_t v41 = v4;
    v33 = uint64_t v42 = v5;
    [(PREditor *)self extensionBundleURL];
    double v40 = v30;
    id v34 = v29;
    double v35 = v27;
    v37 = uint64_t v36 = v23;
    [v33 timeFontConfigurationWithExtensionBundleURL:v37];
    v39 = int v38 = self;

    uint64_t v23 = v36;
    uint64_t v27 = v35;
    uint64_t v29 = v34;
    BOOL v30 = v40;
    [v32 editor:v38 didUpdateSelectedTimeFontConfiguration:v39];

    self = v38;
    uint64_t v4 = v41;
    id v5 = v42;
  }
  [(PREditingFontAndContentStylePickerViewController *)self->_fontAndContentStylePickerViewController setTitleStyleConfiguration:v6];
  [(PREditorRootViewController *)self->_rootViewController lookPropertiesDidChange];
}

- (void)requestDismissalWithAction:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = PRLogEditing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"accept";
    if (a3 != 1) {
      id v6 = 0;
    }
    if (!a3) {
      id v6 = @"cancel";
    }
    id v7 = v6;
    int v13 = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "Requesting dismissal with action '%{public}@'", (uint8_t *)&v13, 0xCu);
  }
  if (a3 != 1)
  {
    id v8 = [(PREditor *)self rootViewController];
    goto LABEL_13;
  }
  if ([(PREditor *)self status] == 2)
  {
    id v8 = [(PREditor *)self rootViewController];
    uint64_t v9 = [(PREditor *)self delegateSafeForCallbackType:3];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v9 editorShouldBeginFinalization:self] & 1) == 0)
    {
      PRLogEditing();
      id v10 = (PREditingRequestDismissalAction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18C1C4000, &v10->super.super, OS_LOG_TYPE_DEFAULT, "Canceling dismissal due to delegate", (uint8_t *)&v13, 2u);
      }
      goto LABEL_14;
    }

LABEL_13:
    uint64_t v9 = [v8 scrollView];
    [v9 _forcePanGestureToEndImmediately];
    [v9 setUserInteractionEnabled:0];
    [v8 setIgnoresScrolling:1];
    [v8 forciblyFinishLookTransition];
    id v10 = [[PREditingRequestDismissalAction alloc] initWithUserAcceptedChanges:a3 == 1 completion:0];
    uint64_t v11 = [(UIWindowScene *)self->_scene _FBSScene];
    BOOL v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    [v11 sendActions:v12];

LABEL_14:
    goto LABEL_15;
  }
  id v8 = PRLogEditing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_18C1C4000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to dismiss and accept changes because the UI is not running", (uint8_t *)&v13, 2u);
  }
LABEL_15:
}

- (BOOL)allowsHitTestingInRootViewController
{
  return [(PREditor *)self variant] != 2;
}

- (BOOL)isLifecycleTiedToInitiallyPresentedViewController
{
  return [(PREditor *)self variant] == 2;
}

- (BOOL)presentsViewControllersRemotely
{
  return [(PREditor *)self variant] == 2;
}

- (BOOL)isViewControllerPresentationAnimationAllowed
{
  return ![(PREditor *)self presentsViewControllersRemotely];
}

- (BOOL)needsCustomViewControllerPresentationManager
{
  return [(PREditor *)self variant] == 2;
}

- (id)viewControllerForPresentingViewControllersCreatingIfNecessary:(BOOL)a3
{
  if ([(PREditor *)self presentsViewControllersRemotely])
  {
    uint64_t v4 = [(PREditor *)self remoteViewControllerPresentationWindow];
    id v5 = [v4 rootViewController];

    if (!v5)
    {
      [(PREditor *)self makeViewControllerForRemoteViewControllerPresentations];
      id v6 = [(PREditor *)self remoteViewControllerPresentationWindow];
      id v5 = [v6 rootViewController];
    }
    id v7 = PRLogEditing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "will present view controller remotely", v9, 2u);
    }
  }
  else
  {
    id v5 = [(PREditor *)self rootViewController];
  }
  return v5;
}

- (void)makeViewControllerForRemoteViewControllerPresentations
{
  id v5 = [(PREditor *)self scene];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v5];
  [v3 setWindowLevel:-100.0];
  [v3 setHidden:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [v3 setRootViewController:v4];
  [(PREditor *)self setRemoteViewControllerPresentationWindow:v3];
}

- (void)didPresentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditor *)self remoteViewControllerPresentationWindow];
  if (v5)
  {
    id v6 = [(PREditor *)self scene];
    id v7 = (void *)*MEMORY[0x1E4FB2608];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__PREditor_didPresentViewController___block_invoke;
    v9[3] = &unk_1E54DB3C8;
    id v10 = v4;
    id v11 = v6;
    id v12 = v5;
    id v8 = v6;
    [v7 _performBlockAfterCATransactionCommits:v9];
  }
}

void __37__PREditor_didPresentViewController___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [a1[5] coordinateSpace];
  objc_msgSend(v2, "convertRect:toCoordinateSpace:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = [a1[6] _contextId];
  float v21 = [a1[6] layer];
  uint64_t RenderId = CALayerGetRenderId();

  uint64_t v23 = -[PREditingRequestRemoteViewControllerPresentationAction initWithSourceLayerRenderId:sourceContextId:presentedViewScreenRect:]([PREditingRequestRemoteViewControllerPresentationAction alloc], "initWithSourceLayerRenderId:sourceContextId:presentedViewScreenRect:", RenderId, v20, v13, v15, v17, v19);
  uint64_t v24 = PRLogEditing();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v34.origin.CGFloat x = v13;
    v34.origin.CGFloat y = v15;
    v34.size.CGFloat width = v17;
    v34.size.CGFloat height = v19;
    BOOL v25 = NSStringFromCGRect(v34);
    v28[0] = 67109634;
    v28[1] = v20;
    __int16 v29 = 2048;
    uint64_t v30 = RenderId;
    __int16 v31 = 2114;
    id v32 = v25;
    _os_log_impl(&dword_18C1C4000, v24, OS_LOG_TYPE_DEFAULT, "sending action to PosterBoard to present view contorller remotely with contextId %u and layerRenderId %llu in rect %{public}@", (uint8_t *)v28, 0x1Cu);
  }
  BOOL v26 = [a1[5] _FBSScene];
  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v23];
  [v26 sendActions:v27];
}

- (void)setEditingFocusActive:(BOOL)a3
{
  double v5 = [(PREditorRootViewController *)self->_rootViewController view];
  double v6 = [v5 window];
  double v7 = [v6 windowScene];

  double v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__PREditor_setEditingFocusActive___block_invoke;
  v16[3] = &unk_1E54DB3F0;
  void v16[4] = self;
  BOOL v17 = a3;
  [MEMORY[0x1E4F4F898] animateWithSettings:v8 actions:v16];
  double v9 = [(UIWindowScene *)self->_scene _FBSScene];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__PREditor_setEditingFocusActive___block_invoke_2;
  v12[3] = &unk_1E54DB418;
  BOOL v15 = a3;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 updateClientSettingsWithTransitionBlock:v12];
}

uint64_t __34__PREditor_setEditingFocusActive___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 144) setTitleReticleActive:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
  return [v2 updateReticleVisibilityIfNeeded];
}

id __34__PREditor_setEditingFocusActive___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "pr_setEditingFocusActive:", *(unsigned __int8 *)(a1 + 48));
  double v3 = [MEMORY[0x1E4FB1458] transitionContext];
  double v4 = [*(id *)(a1 + 32) _synchronizedDrawingFence];
  [v3 setAnimationFence:v4];

  [v3 setAnimationSettings:*(void *)(a1 + 40)];
  return v3;
}

- (void)didFinishTransitionToLook:(id)a3
{
  double v4 = [(PREditor *)self effectiveTitleStyleConfigurationForLook:a3];
  [v4 contentsLuminance];
  double v6 = v5;

  fontAndColorPickerViewController = self->_fontAndColorPickerViewController;
  [(PREditingFontAndColorPickerViewController *)fontAndColorPickerViewController setContentsLuminance:v6];
}

- (CGRect)safeAreaBounds
{
  uint64_t v2 = self->_window;
  [(UIWindow *)v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIWindow *)v2 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v6 + v12;
  double v20 = v4 + v14;
  double v21 = v16 - (v6 + v10);
  double v22 = v18 - (v4 + v8);
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (UIEdgeInsets)editingChromeDodgingInsets
{
  [(PREditorRootViewController *)self->_rootViewController editingChromeDodgingInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setDepthEffectDisallowed:(BOOL)a3
{
  if (self->_depthEffectDisallowed != a3)
  {
    BOOL v3 = a3;
    self->_depthEffectDisallowed = a3;
    [(PREditor *)self setDepthEffectEnabled:!a3];
    id v5 = [(PREditor *)self delegateSafeForCallbackType:3];
    if (objc_opt_respondsToSelector()) {
      [v5 editor:self depthEffectDisallowedDidChange:v3];
    }
  }
}

- (BOOL)isDepthEffectEnabled
{
  double v2 = [(UIWindowScene *)self->_scene _FBSScene];
  BOOL v3 = [v2 clientSettings];
  char v4 = objc_msgSend(v3, "pr_isDepthEffectDisabled");

  return v4 ^ 1;
}

- (void)setDepthEffectEnabled:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(UIWindowScene *)self->_scene _FBSScene];
  double v6 = [v5 clientSettings];
  int v7 = objc_msgSend(v6, "pr_isDepthEffectDisabled");

  if (v7 == v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__PREditor_setDepthEffectEnabled___block_invoke;
    v9[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
    char v10 = v3;
    [v5 updateClientSettingsWithBlock:v9];
    double v8 = [(PREditor *)self rootViewController];
    objc_msgSend(v8, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
    [(PREditor *)self updateRootViewControllerMenus];
  }
}

uint64_t __34__PREditor_setDepthEffectEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDepthEffectDisabled:", *(unsigned char *)(a1 + 32) == 0);
}

- (BOOL)isDepthEffectEffectivelyDisabled
{
  int v3 = [(UIWindowScene *)self->_scene _FBSScene];
  char v4 = [v3 clientSettings];
  char v5 = objc_msgSend(v4, "pr_isDepthEffectDisabled");

  BOOL v6 = [(PREditor *)self isDepthEffectDisallowed];
  int v7 = [(PREditor *)self posterRole];
  char v8 = [v7 isEqual:@"PRPosterRoleIncomingCall"];

  double v9 = [(PREditor *)self configuredProperties];
  char v10 = [v9 titleStyleConfiguration];
  char v11 = [v10 prefersVerticalTitleLayout];

  if (v5) {
    char v12 = 1;
  }
  else {
    char v12 = v6 | v8 & v11;
  }

  return v12;
}

- (BOOL)isDepthEffectDisabled
{
  double v2 = [(UIWindowScene *)self->_scene _FBSScene];
  int v3 = [v2 clientSettings];
  char v4 = objc_msgSend(v3, "pr_isDepthEffectDisabled");

  return v4;
}

- (UIMenu)depthEffectMenu
{
  v33[1] = *MEMORY[0x1E4F143B8];
  depthEffectMenu = self->_depthEffectMenu;
  if (!depthEffectMenu)
  {
    char v4 = [(PREditor *)self rootViewController];
    char v5 = [v4 imageForDepthEffectActionTopLevelAction:0];
    BOOL v6 = (void *)MEMORY[0x1E4FB13F0];
    int v7 = PRBundle();
    char v8 = [v7 localizedStringForKey:@"DEPTH_EFFECT_ON" value:&stru_1ED9A3120 table:@"PosterKit"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __27__PREditor_depthEffectMenu__block_invoke;
    v32[3] = &unk_1E54DB460;
    v32[4] = self;
    double v9 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:v32];

    char v10 = (void *)MEMORY[0x1E4FB13F0];
    char v11 = PRBundle();
    char v12 = [v11 localizedStringForKey:@"DEPTH_EFFECT_OFF" value:&stru_1ED9A3120 table:@"PosterKit"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __27__PREditor_depthEffectMenu__block_invoke_2;
    v31[3] = &unk_1E54DB460;
    v31[4] = self;
    double v13 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:v31];

    double v14 = (void *)MEMORY[0x1E4FB16B8];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    BOOL v26 = __27__PREditor_depthEffectMenu__block_invoke_3;
    uint64_t v27 = &unk_1E54DB488;
    uint64_t v28 = self;
    id v29 = v9;
    id v30 = v13;
    id v15 = v13;
    id v16 = v9;
    double v17 = [v14 elementWithUncachedProvider:&v24];
    double v18 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v19 = PREditorDepthEffectActionIdentifier;
    v33[0] = v17;
    double v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1, v24, v25, v26, v27, v28);
    double v21 = [v18 menuWithTitle:&stru_1ED9A3120 image:v5 identifier:v19 options:0 children:v20];
    double v22 = self->_depthEffectMenu;
    self->_depthEffectMenu = v21;

    depthEffectMenu = self->_depthEffectMenu;
  }
  return depthEffectMenu;
}

uint64_t __27__PREditor_depthEffectMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDepthEffectEnabled:1];
}

uint64_t __27__PREditor_depthEffectMenu__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDepthEffectEnabled:0];
}

void __27__PREditor_depthEffectMenu__block_invoke_3(id *a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  char v4 = a2;
  unsigned int v5 = [v3 isDepthEffectDisallowed];
  [a1[5] setAttributes:v5];
  id v6 = a1[5];
  if (v5)
  {
    int v7 = PRBundle();
    char v8 = [v7 localizedStringForKey:@"DEPTH_EFFECT_DISALLOWED" value:&stru_1ED9A3120 table:@"PosterKit"];
    [v6 setSubtitle:v8];
  }
  else
  {
    [a1[5] setSubtitle:0];
  }
  unsigned int v9 = [a1[4] isDepthEffectEnabled];
  [a1[5] setState:v9];
  [a1[6] setState:v9 ^ 1];
  id v10 = a1[5];
  v12[0] = a1[6];
  v12[1] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v4[2](v4, v11);
}

- (void)toggleDepthEffect
{
  uint64_t v3 = [(PREditor *)self isDepthEffectEnabled] ^ 1;
  [(PREditor *)self setDepthEffectEnabled:v3];
}

- (BOOL)isPerspectiveZoomEnabled
{
  double v2 = [(UIWindowScene *)self->_scene _FBSScene];
  uint64_t v3 = [v2 clientSettings];
  char v4 = objc_msgSend(v3, "pr_isParallaxEnabled");

  return v4;
}

- (void)setPerspectiveZoomEnabled:(BOOL)a3
{
  if ([(PREditor *)self isPerspectiveZoomEnabled] != a3)
  {
    [(PREditor *)self _togglePerspectiveZoom];
  }
}

- (BOOL)isPerspectiveZoomDisallowed
{
  double v2 = [(UIWindowScene *)self->_scene _FBSScene];
  uint64_t v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "pr_isParallaxDisallowed");

  return v4;
}

- (UIAction)togglingPerspectiveZoomAction
{
  togglingPerspectiveZoomAction = self->_togglingPerspectiveZoomAction;
  if (!togglingPerspectiveZoomAction)
  {
    BOOL v4 = [(PREditor *)self isPerspectiveZoomEnabled];
    unsigned int v5 = PRBundle();
    id v6 = [v5 localizedStringForKey:@"PERSPECTIVE_ZOOM" value:&stru_1ED9A3120 table:@"PosterKit"];

    int v7 = (void *)MEMORY[0x1E4FB13F0];
    char v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"perspective"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PREditor_togglingPerspectiveZoomAction__block_invoke;
    void v12[3] = &unk_1E54DB460;
    void v12[4] = self;
    unsigned int v9 = [v7 actionWithTitle:v6 image:v8 identifier:@"PREditor.ToggleParallax" handler:v12];
    id v10 = self->_togglingPerspectiveZoomAction;
    self->_togglingPerspectiveZoomAction = v9;

    [(UIAction *)self->_togglingPerspectiveZoomAction setState:v4];
    togglingPerspectiveZoomAction = self->_togglingPerspectiveZoomAction;
  }
  return togglingPerspectiveZoomAction;
}

uint64_t __41__PREditor_togglingPerspectiveZoomAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _togglePerspectiveZoom];
}

- (void)_togglePerspectiveZoom
{
  id v3 = [(UIWindowScene *)self->_scene _FBSScene];
  [v3 updateClientSettingsWithBlock:&__block_literal_global_152];
  [(UIAction *)self->_togglingPerspectiveZoomAction setState:[(PREditor *)self isPerspectiveZoomEnabled]];
  [(PREditor *)self updateRootViewControllerMenus];
}

void __34__PREditor__togglePerspectiveZoom__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "pr_setParallaxEnabled:", objc_msgSend(v2, "pr_isParallaxEnabled") ^ 1);
}

- (UIMenu)appearanceMenu
{
  v37[1] = *MEMORY[0x1E4F143B8];
  appearanceMenu = self->_appearanceMenu;
  if (!appearanceMenu)
  {
    BOOL v4 = PRBundle();
    id v29 = [v4 localizedStringForKey:@"APPEARANCE" value:&stru_1ED9A3120 table:@"PosterKit"];

    unsigned int v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appearance"];
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    int v7 = PRBundle();
    char v8 = [v7 localizedStringForKey:@"AUTOMATIC" value:&stru_1ED9A3120 table:@"PosterKit"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __26__PREditor_appearanceMenu__block_invoke;
    v36[3] = &unk_1E54DB460;
    v36[4] = self;
    unsigned int v9 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:v36];

    id v10 = (void *)MEMORY[0x1E4FB13F0];
    char v11 = PRBundle();
    char v12 = [v11 localizedStringForKey:@"LIGHT" value:&stru_1ED9A3120 table:@"PosterKit"];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __26__PREditor_appearanceMenu__block_invoke_2;
    v35[3] = &unk_1E54DB460;
    v35[4] = self;
    double v13 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:v35];

    double v14 = (void *)MEMORY[0x1E4FB13F0];
    id v15 = PRBundle();
    id v16 = [v15 localizedStringForKey:@"DARK" value:&stru_1ED9A3120 table:@"PosterKit"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __26__PREditor_appearanceMenu__block_invoke_3;
    v34[3] = &unk_1E54DB460;
    v34[4] = self;
    double v17 = [v14 actionWithTitle:v16 image:0 identifier:0 handler:v34];

    double v18 = (void *)MEMORY[0x1E4FB16B8];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __26__PREditor_appearanceMenu__block_invoke_4;
    v30[3] = &unk_1E54DB4D0;
    v30[4] = self;
    id v31 = v9;
    id v32 = v13;
    id v33 = v17;
    id v19 = v17;
    id v20 = v13;
    id v21 = v9;
    double v22 = [v18 elementWithUncachedProvider:v30];
    uint64_t v23 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v24 = PREditorAppearanceMenuIdentifier;
    v37[0] = v22;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    BOOL v26 = [v23 menuWithTitle:v29 image:v5 identifier:v24 options:0 children:v25];
    uint64_t v27 = self->_appearanceMenu;
    self->_appearanceMenu = v26;

    appearanceMenu = self->_appearanceMenu;
  }
  return appearanceMenu;
}

uint64_t __26__PREditor_appearanceMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearance:0];
}

uint64_t __26__PREditor_appearanceMenu__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearance:1];
}

uint64_t __26__PREditor_appearanceMenu__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearance:2];
}

void __26__PREditor_appearanceMenu__block_invoke_4(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = a2;
  unsigned int v5 = [v3 delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 activeAppearanceMenuSelectionForEditor:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setState:v6 == 0];
    [*(id *)(a1 + 48) setState:v6 == 1];
    [*(id *)(a1 + 56) setState:v6 == 2];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = *(void *)(a1 + 56);
  v10[1] = v7;
  v10[2] = v8;
  unsigned int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v4[2](v4, v9);
}

- (void)_updateAppearance:(int64_t)a3
{
  id v5 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector()) {
    [v5 editor:self appearanceMenuDidChangeSelectedStyle:a3];
  }
}

- (UIAction)placeholderAction
{
  return (UIAction *)[MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1ED9A3120 image:0 identifier:PREditorPlaceholderActionIdentifier handler:&__block_literal_global_173];
}

- (void)setComplicationsVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(UIWindowScene *)self->_scene _FBSScene];
  uint64_t v6 = [v5 clientSettings];
  uint64_t v7 = objc_msgSend(v6, "pr_vibrancyConfiguration");

  if ((BSEqualObjects() & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PREditor_setComplicationsVibrancyConfiguration___block_invoke;
    v8[3] = &unk_1E54DB518;
    id v9 = v4;
    [v5 updateClientSettingsWithBlock:v8];
  }
}

uint64_t __50__PREditor_setComplicationsVibrancyConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVibrancyConfiguration:", *(void *)(a1 + 32));
}

- (void)_discardRootViewController
{
}

- (void)_rebuildRootViewController
{
  BOOL v3 = [(PREditor *)self allowsHitTestingInRootViewController];
  [(UIWindow *)self->_window setUserInteractionEnabled:v3];
  id v4 = [(UIWindow *)self->_window layer];
  [v4 setAllowsHitTesting:v3];

  if ([(PREditor *)self displaysRootViewController])
  {
    id v10 = [(PREditor *)self rootViewController];
    [(PREditor *)self areViewsSharedBetweenLooks];
    id v5 = objc_alloc_init((Class)self);
    [v5 setEditor:self];
    uint64_t v6 = [(PREditor *)self dateProvider];
    [v5 setDateProvider:v6];
    objc_msgSend(v5, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
    objc_msgSend(v5, "setUsesEditingLayout:", -[PREditor usesEditingLayout](self, "usesEditingLayout"));
    objc_msgSend(v5, "setControlsHidden:", -[PREditor areControlsHidden](self, "areControlsHidden"));
    objc_msgSend(v5, "setComplicationsRowConfigured:", -[PREditor isComplicationsRowConfigured](self, "isComplicationsRowConfigured"));
    objc_msgSend(v5, "setComplicationSidebarConfigured:", -[PREditor isComplicationSidebarConfigured](self, "isComplicationSidebarConfigured"));
    objc_msgSend(v5, "setFocusedComplicationElement:", -[PREditor focusedComplicationElement](self, "focusedComplicationElement"));
    objc_msgSend(v5, "setSubtitleHidden:", -[PREditor isInlineComplicationConfigured](self, "isInlineComplicationConfigured"));
    objc_msgSend(v5, "setFocusedQuickActionPosition:", -[PREditor focusedQuickActionPosition](self, "focusedQuickActionPosition"));
    [(PREditor *)self setRootViewController:v5];
    uint64_t v7 = [v10 contentOverlayView];
    if (v7) {
      [v5 setContentOverlayView:v7];
    }
    [v5 loadViewIfNeeded];
    uint64_t v8 = [v5 scrollView];
    [(PREditor *)self updateScrollViewDecelerationRate:v8];
    [(UIWindow *)self->_window setRootViewController:v5];
    id v9 = [(UIWindow *)self->_window _rootSheetPresentationController];
    [v9 _setShouldScaleDownBehindDescendantSheets:0];
  }
  else
  {
    [(UIWindow *)self->_window setRootViewController:0];
    [(PREditor *)self setRootViewController:0];
  }
}

- (id)_refetchLooks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PREditor *)self delegateSafeForCallbackType:3];
  id v4 = [v3 looksForEditor:self];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "identifier", (void)v19);
        if ([v5 containsObject:v13])
        {
          id v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = *MEMORY[0x1E4F1C3C8];
          double v17 = @"Look identifiers must be unique";
          goto LABEL_15;
        }
        [v5 addObject:v13];
        if ([v6 containsObject:v12])
        {
          id v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = *MEMORY[0x1E4F1C3C8];
          double v17 = @"Looks must be unique";
LABEL_15:
          id v18 = [v15 exceptionWithName:v16 reason:v17 userInfo:0];
          objc_exception_throw(v18);
        }
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)_refetchLooksForProperties
{
  BOOL v3 = [(PREditor *)self _refetchLooks];
  id v4 = [(PREditor *)self rootViewController];
  id v5 = [v4 looks];

  uint64_t v6 = [v3 count];
  uint64_t v25 = v5;
  if (v6 != [v5 count])
  {
    uint64_t v23 = [NSString stringWithFormat:@"count of updated looks for updating properties does not match count of current looks"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditor _refetchLooksForProperties]();
    }
    goto LABEL_22;
  }
  uint64_t v7 = [v3 count];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [v3 objectAtIndexedSubscript:v9];
      char v11 = [v25 objectAtIndexedSubscript:v9];
      char v12 = [v10 identifier];
      double v13 = [v11 identifier];
      char v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) == 0) {
        break;
      }
      id v15 = [v10 displayName];
      uint64_t v16 = [v11 displayName];
      char v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0)
      {
        uint64_t v24 = [NSString stringWithFormat:@"updated look display name does not match existing look"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PREditor _refetchLooksForProperties]();
        }
        [v24 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18C1FD71CLL);
      }
      id v18 = (void *)[v11 mutableCopy];
      long long v19 = [v10 initialTimeFontConfiguration];
      if (v19) {
        [v18 setInitialTimeFontConfiguration:v19];
      }
      long long v20 = [v10 initialTitleColor];
      if (v20) {
        [v18 setInitialTitleColor:v20];
      }
      long long v21 = (void *)[v18 copy];
      [v8 addObject:v21];

      if (v7 == ++v9) {
        goto LABEL_11;
      }
    }
    uint64_t v23 = [NSString stringWithFormat:@"updated look identifier does not match existing look"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditor _refetchLooksForProperties]();
    }
LABEL_22:
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1FD6C8);
  }
LABEL_11:

  return v8;
}

- (void)_refreshDefaultTitleStyleConfigurationsForLooks:(id)a3 luminanceForLooks:(id)a4 initialLook:(id)a5 configuredTitleStyleConfiguration:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v48 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(PREditor *)self shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:v12];
  BOOL v14 = [(PREditor *)self shouldIgnorePreviouslyConfiguredTitleStyleConfiguration];
  uint64_t v42 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (v42)
  {
    uint64_t v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  else
  {
    uint64_t v43 = 0;
  }
  uint64_t v46 = (void *)[(NSMutableDictionary *)self->_defaultTitleStyleConfigurationPerLook mutableCopy];
  defaultTitleStyleConfigurationPerLook = self->_defaultTitleStyleConfigurationPerLook;
  uint64_t v16 = PRLogEditing();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (defaultTitleStyleConfigurationPerLook)
  {
    if (v17)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = [v10 count];
      _os_log_impl(&dword_18C1C4000, v16, OS_LOG_TYPE_INFO, "Rebuilding _defaultTitleStyleConfigurationPerLook for %lu looks", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_defaultTitleStyleConfigurationPerLook removeAllObjects];
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = [v10 count];
      _os_log_impl(&dword_18C1C4000, v16, OS_LOG_TYPE_INFO, "Building _defaultTitleStyleConfigurationPerLook for %lu looks", buf, 0xCu);
    }

    id v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v19 = self->_defaultTitleStyleConfigurationPerLook;
    self->_defaultTitleStyleConfigurationPerLook = v18;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v10;
  uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v47 = *(void *)v50;
    int v45 = v13 || v14;
    id v22 = v11;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v49 + 1) + 8 * v23);
        uint64_t v25 = [v48 objectForKeyedSubscript:v24];
        [v25 doubleValue];
        double v27 = v26;

        if (!v11) {
          goto LABEL_20;
        }
        int v28 = [v24 isEqual:v11] ^ 1;
        if (!v12) {
          int v28 = 1;
        }
        if ((v28 | v45))
        {
LABEL_20:
          id v29 = [v46 objectForKey:v24];
          if (v29 && (!v12 || [v12 isEqual:v29]))
          {
            id v30 = v29;
            goto LABEL_24;
          }
          id v32 = [v24 initialTimeFontConfiguration];
          if (v32)
          {

            goto LABEL_27;
          }
          double v40 = [v24 initialTitleColor];

          if (!v12 || v40)
          {
LABEL_27:
            id v33 = [v12 timeNumberingSystem];
            id v31 = [v24 titleStyleConfigurationWithExtensionBundle:v43 luminance:v33 timeNumberingSystem:v27];
          }
          else
          {
            id v30 = v12;
LABEL_24:
            id v31 = v30;
          }

          goto LABEL_30;
        }
        id v31 = v12;
LABEL_30:
        CGRect v34 = (void *)[v31 mutableCopy];
        double v35 = [v31 timeFontConfiguration];
        uint64_t v36 = [(PREditor *)self _selectableTimeFontConfigurationForProposedTimeFontConfiguration:v35];
        [v34 setTimeFontConfiguration:v36];

        v37 = [v34 groupName];

        if (!v37)
        {
          int v38 = [v24 groupName];
          [v34 setGroupName:v38];
        }
        [v34 setContentsLuminance:v27];
        double v39 = (void *)[v34 copy];

        [(NSMutableDictionary *)self->_defaultTitleStyleConfigurationPerLook setObject:v39 forKey:v24];
        ++v23;
        id v11 = v22;
      }
      while (v21 != v23);
      uint64_t v41 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      uint64_t v21 = v41;
    }
    while (v41);
  }
}

- (id)_selectableTimeFontConfigurationForProposedTimeFontConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditor *)self delegateSafeForCallbackType:3];
  uint64_t v6 = [(PREditor *)self posterRole];
  uint64_t v7 = +[PREditingFontAndColorPickerViewController defaultFontIdentifiersForRole:v6 titleString:self->_titleString];

  uint64_t v8 = objc_msgSend(v7, "bs_map:", &__block_literal_global_197);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_2;
  v43[3] = &unk_1E54DB560;
  id v9 = v5;
  id v44 = v9;
  int v45 = self;
  id v10 = objc_msgSend(v8, "bs_filter:", v43);

  id v11 = [(PREditor *)self posterRole];
  char v12 = [v11 isEqualToString:@"PRPosterRoleIncomingCall"];

  id v32 = v9;
  CGRect v34 = v7;
  if ((v12 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v13 = objc_msgSend(v9, "additionalTimeFontConfigurationsForEditor:", self, v9, v7);
  }
  BOOL v14 = [(PREditor *)self extensionBundleURL];
  id v15 = [v4 timeFontConfigurationWithExtensionBundleURL:v14];

  uint64_t v16 = [v10 arrayByAddingObjectsFromArray:v13];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_3;
  v39[3] = &unk_1E54DB588;
  id v17 = v15;
  id v40 = v17;
  id v18 = v13;
  id v41 = v18;
  id v19 = v4;
  id v42 = v19;
  uint64_t v20 = objc_msgSend(v16, "bs_firstObjectPassingTest:", v39);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_4;
  void v37[3] = &unk_1E54DB5B0;
  id v21 = v17;
  id v38 = v21;
  objc_msgSend(v16, "bs_firstObjectPassingTest:", v37);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22) {
    goto LABEL_7;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_5;
  v35[3] = &unk_1E54DB5B0;
  id v23 = v21;
  id v36 = v23;
  objc_msgSend(v16, "bs_firstObjectPassingTest:", v35);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
LABEL_7:
    int v24 = [v18 containsObject:v22];
LABEL_8:
    uint64_t v25 = v24 ^ 1u;
    goto LABEL_9;
  }
  id v22 = [v16 firstObject];
  int v24 = [v18 containsObject:v22];
  if (v22) {
    goto LABEL_8;
  }
  id v22 = v23;
  uint64_t v25 = 0;
LABEL_9:
  if ([v10 containsObject:v22])
  {
    double v26 = [PRTimeFontConfiguration alloc];
    double v27 = [v22 timeFontIdentifier];
    [v21 weight];
    uint64_t v28 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](v26, "initWithTimeFontIdentifier:weight:", v27);

    id v22 = (id)v28;
  }
  id v29 = [(PREditor *)self extensionBundleURL];
  id v30 = +[PRPosterTimeFontConfiguration configurationWithTimeFontConfiguration:v22 extensionBundleURL:v29 systemItem:v25];

  return v30;
}

PRTimeFontConfiguration *__77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[PRTimeFontConfiguration alloc] initWithTimeFontIdentifier:v2];

  return v3;
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = [*(id *)(a1 + 32) editor:*(void *)(a1 + 40) shouldAllowUserToSelectTimeFontConfiguration:v3];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = BSEqualObjects();
  [*(id *)(a1 + 40) containsObject:v3];

  [*(id *)(a1 + 48) isSystemItem];
  return v4 & BSEqualBools();
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_4()
{
  return BSEqualObjects();
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 timeFontIdentifier];
  int v4 = [*(id *)(a1 + 32) timeFontIdentifier];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

- (void)_refetchLooksAndBuildUI
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if ([(PREditor *)self status] != 2)
  {
    int v4 = PRLogEditing();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    id v11 = "Ignoring call to refetch looks because the UI is not running";
LABEL_15:
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_37;
  }
  if (![(PREditor *)self displaysRootViewController])
  {
    int v4 = PRLogEditing();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    id v11 = "Ignoring call to refetch looks because we will never see the UI";
    goto LABEL_15;
  }
  int v4 = [(PREditor *)self rootViewController];
  uint64_t v5 = [(PREditor *)self _refetchLooks];
  if (![v5 count])
  {
    long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2 object:self file:@"PREditor.m" lineNumber:1890 description:@"Need more than one look!"];
  }
  uint64_t v6 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 initialLookIdentifierForEditor:self];
    if (!v7)
    {
      BOOL v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:a2 object:self file:@"PREditor.m" lineNumber:1895 description:@"nil should not be returned from initialLookIdentifierForEditor:"];
    }
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __35__PREditor__refetchLooksAndBuildUI__block_invoke;
    v68[3] = &unk_1E54DB5D8;
    id v8 = v7;
    id v69 = v8;
    uint64_t v9 = [v5 indexOfObjectPassingTest:v68];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2 object:self file:@"PREditor.m" lineNumber:1899 description:@"initial look not found in looks array"];
    }
    id v10 = [v5 objectAtIndex:v9];
  }
  else
  {
    id v10 = [v5 firstObject];
  }
  [(PREditor *)self setInitialLook:v10];
  [(PREditor *)self setCurrentLook:v10];
  char v12 = [(PRPosterEditingEnvironment *)self->_environment targetConfiguredProperties];
  BOOL v13 = [v12 titleStyleConfiguration];
  uint64_t v14 = [v12 colorVariationsConfiguration];
  BOOL v15 = [(PREditor *)self shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:v13];
  double v61 = (void *)v14;
  if (v13 && v15)
  {
    uint64_t v16 = (PRPosterMutableConfiguredProperties *)[v12 mutableCopy];
  }
  else if (v14)
  {
    id v17 = [PRPosterMutableConfiguredProperties alloc];
    id v18 = [v12 colorVariationsConfiguration];
    uint64_t v16 = [(PRPosterConfiguredProperties *)v17 initWithTitleStyleConfiguration:0 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:v18 quickActionsConfiguration:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v13 contentsLuminance];
  v60 = -[PREditor _defaultLuminanceValuesForLooks:initialLook:initialLookLuminanceValue:](self, "_defaultLuminanceValuesForLooks:initialLook:initialLookLuminanceValue:", v5, v10);
  id v19 = -[PREditor _refreshLuminanceValuesForCurrentPerLookLuminanceValues:](self, "_refreshLuminanceValuesForCurrentPerLookLuminanceValues:");
  [(PREditor *)self _refreshDefaultTitleStyleConfigurationsForLooks:v5 luminanceForLooks:v19 initialLook:v10 configuredTitleStyleConfiguration:v13];
  v62 = v12;
  uint64_t v20 = [v12 titleStyleConfiguration];
  v59 = v19;
  uint64_t v63 = v16;
  if (v20)
  {
    v57 = [(PREditor *)self currentLook];
    id v21 = [v19 objectForKeyedSubscript:v57];
    [v21 doubleValue];
    double v23 = v22;

    int v24 = (void *)[v20 mutableCopy];
    [v24 setContentsLuminance:v23];
    uint64_t v25 = [v20 timeFontConfiguration];
    [(PREditor *)self _selectableTimeFontConfigurationForProposedTimeFontConfiguration:v25];
    double v26 = v10;
    double v27 = v5;
    v29 = uint64_t v28 = v13;

    [v24 setTimeFontConfiguration:v29];
    [(PRPosterConfiguredProperties *)v63 setTitleStyleConfiguration:v24];

    BOOL v13 = v28;
    uint64_t v5 = v27;
    id v10 = v26;

    uint64_t v16 = v63;
  }
  v58 = v20;
  [(PREditor *)self setConfiguredProperties:v16];
  [v4 setLooks:v5];
  [(PREditor *)self leadingTopButtonFrame];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [(PREditor *)self trailingTopButtonFrame];
  -[NSObject updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:](v4, "updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:", v31, v33, v35, v37, v38, v39, v40, v41);
  id v42 = [v4 view];
  [v42 layoutIfNeeded];

  [(PREditor *)self updateActions];
  if ([(PREditor *)self areViewsSharedBetweenLooks])
  {
    id v43 = [v4 views];
    [v6 editor:self populateViews:v43 forLook:v10];
    int v45 = v61;
    id v44 = v62;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v43 = v5;
    uint64_t v46 = [v43 countByEnumeratingWithState:&v64 objects:v71 count:16];
    int v45 = v61;
    id v44 = v62;
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v55 = v13;
      uint64_t v56 = v5;
      uint64_t v48 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v65 != v48) {
            objc_enumerationMutation(v43);
          }
          uint64_t v50 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          long long v51 = [v4 viewsForLook:v50];
          [v6 editor:self populateViews:v51 forLook:v50];
        }
        uint64_t v47 = [v43 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v47);
      BOOL v13 = v55;
      uint64_t v5 = v56;
      int v45 = v61;
      id v44 = v62;
    }
    uint64_t v16 = v63;
  }

  [v4 scrollToLook:v10 animated:0];
  [v4 beginLookInteractionHinting];

LABEL_37:
}

uint64_t __35__PREditor__refetchLooksAndBuildUI__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_applyStylePropertiesFromConfiguredProperties:(id)a3 toConfiguredProperties:(id)a4 forLook:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = [(PREditor *)self defaultTitleStyleConfigurationForLook:a5];
  id v10 = [v16 titleStyleConfiguration];
  [v9 contentsLuminance];
  double v12 = v11;
  [v10 contentsLuminance];
  if (v12 != v13)
  {
    uint64_t v14 = (void *)[v10 mutableCopy];
    [v9 contentsLuminance];
    objc_msgSend(v14, "setContentsLuminance:");

    id v10 = v14;
  }
  [v8 setTitleStyleConfiguration:v10];
  BOOL v15 = [v16 colorVariationsConfiguration];
  [v8 setColorVariationsConfiguration:v15];
}

- (BOOL)shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:(id)a3
{
  id v4 = a3;
  if ([(PREditor *)self editingContext]) {
    char v5 = [v4 isUserConfigured];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)shouldIgnorePreviouslyConfiguredTitleStyleConfiguration
{
  if ([(PREditor *)self editingContext] == 2 || [(PREditor *)self hasUpdatedLooks]) {
    return 1;
  }
  return [(PREditor *)self hasUpdatedLookProperties];
}

- (void)updateRootViewControllerMenus
{
  id v2 = [(PREditor *)self rootViewController];
  [v2 _updateMenuElements];
}

- (void)setRootViewController:(id)a3
{
  char v5 = (PREditorRootViewController *)a3;
  rootViewController = self->_rootViewController;
  p_rootViewController = &self->_rootViewController;
  uint64_t v6 = rootViewController;
  if (rootViewController != v5)
  {
    uint64_t v9 = v5;
    [(PREditorRootViewController *)v6 invalidate];
    objc_storeStrong((id *)p_rootViewController, a3);
    char v5 = v9;
  }
  MEMORY[0x1F41817F8](v6, v5);
}

- (void)setInlineComplicationConfigured:(BOOL)a3
{
  if (self->_inlineComplicationConfigured != a3)
  {
    BOOL v3 = a3;
    self->_inlineComplicationConfigured = a3;
    id v4 = [(PREditor *)self rootViewController];
    [v4 setSubtitleHidden:v3];
  }
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  if (self->_alternateDateEnabled != a3)
  {
    BOOL v3 = a3;
    self->_alternateDateEnabled = a3;
    char v5 = [(PREditor *)self configuredProperties];
    if (!v5)
    {
      id v10 = objc_alloc_init(PRPosterMutableConfiguredProperties);
      [(PREditor *)self setConfiguredProperties:v10];
      char v5 = v10;
    }
    id v11 = v5;
    uint64_t v6 = [v5 titleStyleConfiguration];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (!v7)
    {
      id v8 = [(PREditor *)self currentLook];
      uint64_t v9 = [(PREditor *)self defaultTitleStyleConfigurationForLook:v8];
      uint64_t v7 = (void *)[v9 mutableCopy];
    }
    [v7 setAlternateDateEnabled:v3];
    [v11 setTitleStyleConfiguration:v7];
    [(PREditorRootViewController *)self->_rootViewController lookPropertiesDidChange];
  }
}

- (void)setCoveredByHostModalPresentation:(BOOL)a3
{
  if (self->_coveredByHostModalPresentation != a3)
  {
    BOOL v3 = a3;
    char v5 = [(PREditor *)self coveredByHostModalPresentationDisableLookSwitchingAssertion];
    [v5 invalidate];

    [(PREditor *)self setCoveredByHostModalPresentationDisableLookSwitchingAssertion:0];
    self->_coveredByHostModalPresentation = v3;
    if (v3)
    {
      id v6 = [(PREditor *)self disableSwitchingLooksForReason:@"CoveredByHostModalPresentation"];
      [(PREditor *)self setCoveredByHostModalPresentationDisableLookSwitchingAssertion:v6];
    }
  }
}

- (void)_acquireModalPresentationAssertionForViewController:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_modalPresentationAssertionsByViewController)
  {
    char v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    modalPresentationAssertionsByViewController = self->_modalPresentationAssertionsByViewController;
    self->_modalPresentationAssertionsByViewController = v5;

    id v4 = v10;
  }
  uint64_t v7 = [NSString stringWithFormat:@"ViewControllerPresentation: %@", v4];
  id v8 = self->_modalPresentationAssertionsByViewController;
  uint64_t v9 = [(PREditor *)self _acquireModalPresentationAssertionForReason:v7];
  [(NSMapTable *)v8 setObject:v9 forKey:v10];
}

- (id)_acquireModalPresentationAssertionForReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_modalPresentationAssertions)
  {
    char v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    modalPresentationAssertions = self->_modalPresentationAssertions;
    self->_modalPresentationAssertions = v5;
  }
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__PREditor__acquireModalPresentationAssertionForReason___block_invoke;
  v15[3] = &unk_1E54DB600;
  id v10 = v4;
  id v16 = v10;
  objc_copyWeak(&v17, &location);
  id v11 = (void *)[v7 initWithIdentifier:v9 forReason:v10 invalidationBlock:v15];

  double v12 = PRLogEditing();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2048;
    double v22 = v11;
    _os_log_impl(&dword_18C1C4000, v12, OS_LOG_TYPE_DEFAULT, "Acquiring modal presentation assertion for reason %{public}@, assertion %p", buf, 0x16u);
  }

  double v13 = [(PREditor *)self modalPresentationAssertions];
  [v13 addObject:v11];

  [(PREditor *)self _updatePresentingModalViewController];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v11;
}

void __56__PREditor__acquireModalPresentationAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PRLogEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    id v12 = v3;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated modal presentation assertion for reason %{public}@: %p", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained modalPresentationAssertions];
    [v8 removeObject:v3];

    [v7 _updatePresentingModalViewController];
  }
}

- (void)_updatePresentingModalViewController
{
  id v3 = [(PREditor *)self modalPresentationAssertions];
  BOOL v4 = [v3 count] != 0;

  [(PREditor *)self setPresentingModalViewController:v4];
}

- (void)setPresentingModalViewController:(BOOL)a3
{
  if (self->_presentingModalViewController != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = [(PREditor *)self presentingModalViewControllerDisableLookSwitchingAssertion];
    [v5 invalidate];

    [(PREditor *)self setPresentingModalViewControllerDisableLookSwitchingAssertion:0];
    self->_presentingModalViewController = v3;
    id v6 = [(UIWindowScene *)self->_scene _FBSScene];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__PREditor_setPresentingModalViewController___block_invoke;
    v11[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
    BOOL v12 = v3;
    [v6 updateClientSettingsWithBlock:v11];

    id v7 = [(PREditor *)self rootViewController];
    [v7 setPresentingModalViewController:v3];
    if (v3)
    {
      id v8 = [(PREditor *)self disableSwitchingLooksForReason:@"PresentingModalViewController"];
      [(PREditor *)self setPresentingModalViewControllerDisableLookSwitchingAssertion:v8];
    }
    else if ([(PREditor *)self isLifecycleTiedToInitiallyPresentedViewController])
    {
      if ([(PREditor *)self isDismissingPresentedViewControllerFromTitledViewController])
      {
        int v9 = [(PFServerPosterPath *)self->_sourceContents serverIdentity];
        if ((unint64_t)([v9 type] - 1) >= 2) {
          uint64_t v10 = [v9 isIncomingConfiguration] ^ 1;
        }
        else {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 1;
      }
      [(PREditor *)self requestDismissalWithAction:v10];
    }
  }
}

uint64_t __45__PREditor_setPresentingModalViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setContentsCoveredByModalPresentation:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setTitleString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    BOOL v4 = (NSString *)[v7 copy];
    titleString = self->_titleString;
    self->_titleString = v4;

    id v6 = [(PREditor *)self rootViewController];
    [v6 updateForChangedTitleString];
  }
}

- (void)setOverrideDate:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(PREditor *)self dateProvider];
  uint64_t v5 = [v4 overrideDate];
  char v6 = [v5 isEqualToDate:v8];

  if ((v6 & 1) == 0)
  {
    [v4 setOverrideDate:v8];
    id v7 = [(PREditor *)self rootViewController];
    [v7 updateForChangedOverrideDate];
  }
}

- (void)setHorizontalTitleBoundingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_horizontalTitleBoundingRect))
  {
    self->_horizontalTitleBoundingRect.origin.double x = x;
    self->_horizontalTitleBoundingRect.origin.double y = y;
    self->_horizontalTitleBoundingRect.size.double width = width;
    self->_horizontalTitleBoundingRect.size.double height = height;
    +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 2, x, y, width, height);
    id v8 = [(PREditor *)self posterRole];
    int v9 = [v8 isEqual:@"PRPosterRoleIncomingCall"];

    if (v9)
    {
      v12.origin.double x = x;
      v12.origin.double y = y;
      v12.size.double width = width;
      v12.size.double height = height;
      CGRect v13 = CGRectInset(v12, -8.0, -8.0);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 3, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 0, x, y, width, height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 1, x, y, width, height);
    }
    id v10 = [(PREditor *)self rootViewController];
    [v10 updateReticleViewFrames];
  }
}

- (void)setVerticalTitleBoundingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_verticalTitleBoundingRect))
  {
    self->_verticalTitleBoundingRect.origin.double x = x;
    self->_verticalTitleBoundingRect.origin.double y = y;
    self->_verticalTitleBoundingRect.size.double width = width;
    self->_verticalTitleBoundingRect.size.double height = height;
    +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 2, x, y, width, height);
    id v8 = [(PREditor *)self posterRole];
    int v9 = [v8 isEqual:@"PRPosterRoleIncomingCall"];

    if (v9)
    {
      v12.origin.double x = x;
      v12.origin.double y = y;
      v12.size.double width = width;
      v12.size.double height = height;
      CGRect v13 = CGRectInset(v12, -12.0, -20.0);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 3, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 0, x, y, width, height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 1, x, y, width, height);
    }
    id v10 = [(PREditor *)self rootViewController];
    [v10 updateReticleViewFrames];
  }
}

- (BOOL)displaysHeaderElements
{
  return [(PREditor *)self variant] == 0;
}

- (BOOL)displaysSubtitleElement
{
  id v2 = [(PREditor *)self posterRole];
  char v3 = [v2 isEqual:@"PRPosterRoleIncomingCall"] ^ 1;

  return v3;
}

- (BOOL)areComplicationsAllowed
{
  if ([(PREditor *)self variant]) {
    return 0;
  }
  else {
    return ![(PREditor *)self areComplicationsDisallowed];
  }
}

- (unint64_t)timeViewControllerDisplayedElements
{
  if ([(PREditor *)self areComplicationsAllowed]) {
    return 33;
  }
  if ([(PREditor *)self displaysSubtitleElement]) {
    return 35;
  }
  return 33;
}

- (BOOL)displaysRootViewController
{
  if ([(PREditor *)self variant] != 2) {
    return 1;
  }
  uint64_t v3 = [(PREditor *)self editingContext];
  return PREditingContextIsSavedConfiguration(v3);
}

- (id)extensionBundle
{
  id v2 = [(PREditor *)self delegate];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return v3;
}

- (id)extensionBundleURL
{
  id v2 = [(PREditor *)self extensionBundle];
  uint64_t v3 = [v2 bundleURL];

  return v3;
}

- (id)delegateSafeForCallbackType:(int64_t)a3
{
  uint64_t v5 = [(PREditor *)self delegate];
  int64_t v6 = [(PREditor *)self status];
  if (a3 == 3)
  {
    if (v6 != 2)
    {

      uint64_t v5 = 0;
    }
    if (![(PREditor *)self displaysRootViewController]) {
      goto LABEL_4;
    }
  }
  else if (a3 == 2 && v6 != 2)
  {
LABEL_4:

    uint64_t v5 = 0;
  }
  return v5;
}

- (void)handleNotificationForwardAction:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 notificationName];
  BOOL v4 = PRLogEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification from host: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:v3 object:0];
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __28__PREditor_debugDescription__block_invoke;
  id v10 = &unk_1E54DAA08;
  __int16 v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __28__PREditor_debugDescription__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_window)
  {
    __int16 v21 = [NSString stringWithFormat:@"already have a scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditor scene:willConnectToSession:options:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v12 = v11;
    CGRect v13 = PRLogEditing();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v22 = 0;
      _os_log_impl(&dword_18C1C4000, v13, OS_LOG_TYPE_DEFAULT, "Scene did connect", v22, 2u);
    }

    [(PREditor *)self setStatus:1];
    objc_storeStrong((id *)&self->_scene, a3);
    [v9 setDelegate:self];
    [v9 _registerSceneComponent:self forKey:@"PREditor"];
    uint64_t v14 = (UIWindow *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v9];
    window = self->_window;
    self->_window = v14;

    [(UIWindow *)self->_window setUserInteractionEnabled:1];
    id v16 = [(UIWindow *)self->_window layer];
    [v16 setAllowsHitTesting:1];

    id v17 = [v9 _FBSScene];
    id v18 = [v17 settings];

    -[PREditor setUsesEditingLayout:](self, "setUsesEditingLayout:", objc_msgSend(v18, "pr_usesEditingLayout"));
    -[PREditor setAcceptButtonType:](self, "setAcceptButtonType:", objc_msgSend(v18, "pr_editingAcceptButtonType"));
    -[PREditor setComplicationsRowConfigured:](self, "setComplicationsRowConfigured:", objc_msgSend(v18, "pui_isComplicationRowConfigured"));
    -[PREditor setComplicationSidebarConfigured:](self, "setComplicationSidebarConfigured:", objc_msgSend(v18, "pui_isComplicationSidebarConfigured"));
    if ([(PREditor *)self displaysRootViewController])
    {
      id v19 = [(PREditor *)self delegateSafeForCallbackType:1];
      if (objc_opt_respondsToSelector()) {
        uint64_t v20 = [v19 looksShareBaseAppearanceForEditor:self];
      }
      else {
        uint64_t v20 = 0;
      }
      [(PREditor *)self setViewsSharedBetweenLooks:v20];
      [(PREditor *)self _rebuildRootViewController];
    }
    [(UIWindow *)self->_window setHidden:0];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  if (!self->_disconnected)
  {
    self->_disconnected = 1;
    id v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Scene is disconnecting", buf, 2u);
    }

    uint64_t v5 = [(PREditor *)self delegateSafeForCallbackType:0];
    [v5 editorDidInvalidate:self];
    int v6 = PRLogEditing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "Scene did disconnect", v12, 2u);
    }
  }
  [(PRPosterConfiguration *)self->_targetConfig _invalidate];
  targetConfig = self->_targetConfig;
  self->_targetConfig = 0;

  sourceContents = self->_sourceContents;
  self->_sourceContents = 0;

  [(UIWindow *)self->_window setHidden:1];
  [(PREditor *)self _discardRootViewController];
  window = self->_window;
  self->_window = 0;

  scene = self->_scene;
  self->_scene = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  [(PREditor *)self setStatus:0];
}

- (PREditor)initWithScene:(id)a3
{
  id v5 = a3;
  int v6 = [NSString stringWithFormat:@"this should not be called"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = @"PREditor.m";
    __int16 v19 = 1024;
    int v20 = 2361;
    __int16 v21 = 2114;
    double v22 = v6;
    _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  UIEdgeInsets result = (PREditor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (UIScene)_scene
{
  return (UIScene *)self->_scene;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a4;
  uint64_t v13 = (uint64_t)a5;
  unint64_t v14 = (unint64_t)a6;
  id v15 = a7;
  BOOL v133 = v14 == 0;
  id v16 = objc_opt_new();
  if (PUIDynamicRotationIsActive()
    && ([v15 animationSettings], __int16 v17 = objc_claimAutoreleasedReturnValue(),
                                                v17,
                                                v17))
  {
    id v18 = (void *)MEMORY[0x1E4F4F680];
    __int16 v19 = [v15 animationSettings];
    [v19 duration];
    double v21 = v20;
    double v22 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    uint64_t v23 = [v18 settingsWithDuration:v22 timingFunction:v21];
  }
  else
  {
    uint64_t v23 = [v15 animationSettings];
  }
  [v16 setAnimationSettings:v23];

  int v24 = [v15 actions];
  uint64_t v25 = [v24 allObjects];
  [v16 setActions:v25];

  double v26 = [v12 settings];
  if (!(v13 | v14))
  {
    uint64_t v13 = [MEMORY[0x1E4F62A80] diffFromSettings:0 toSettings:v26];
  }
  v132 = [(PREditor *)self rootViewController];
  unsigned int v27 = objc_msgSend(v26, "pr_usesEditingLayout");
  unsigned int v28 = objc_msgSend(v26, "pui_isComplicationRowConfigured");
  unsigned int v29 = objc_msgSend(v26, "pui_isComplicationSidebarConfigured");
  uint64_t v136 = objc_msgSend(v26, "pr_focusedComplicationElement");
  v139 = objc_msgSend(v26, "pr_titleString");
  v138 = objc_msgSend(v26, "pr_overrideDate");
  objc_msgSend(v26, "pr_horizontalTitleBoundingRect");
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  objc_msgSend(v26, "pr_verticalTitleBoundingRect");
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  uint64_t v46 = objc_msgSend(v26, "pr_focusedQuickActionElementPosition");
  v140 = v16;
  v141 = (void *)v14;
  v135 = v12;
  v131 = (void *)v13;
  v142 = v15;
  unsigned int v137 = v27;
  if (v13)
  {
    uint64_t v125 = v46;
    unsigned int v129 = v28;
    uint64_t v47 = objc_msgSend(v26, "pui_posterContents");
    char v48 = BSEqualObjects();

    unsigned int v126 = v29;
    if (v48) {
      goto LABEL_22;
    }
    objc_msgSend(v26, "pui_posterContents");
    long long v49 = (PFServerPosterPath *)objc_claimAutoreleasedReturnValue();
    sourceContents = self->_sourceContents;
    self->_sourceContents = v49;

    long long v51 = [(PFServerPosterPath *)self->_sourceContents role];
    long long v52 = +[PRMutablePosterConfiguration mutableConfigurationWithRole:v51];
    targetConfig = self->_targetConfig;
    self->_targetConfig = v52;

    id v54 = self->_sourceContents;
    v146[0] = 0;
    uint64_t v55 = [(PFServerPosterPath *)v54 loadUserInfoWithError:v146];
    id v56 = v146[0];
    if (v56)
    {
      uint64_t v57 = v13;
      v58 = PRLogEditing();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[PREditor _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:]((uint64_t)v56, v58);
      }
    }
    else
    {
      if (![v55 count])
      {
LABEL_21:

LABEL_22:
        scene = self->_scene;
        uint64_t v63 = objc_opt_class();
        long long v64 = scene;
        if (v63)
        {
          if (objc_opt_isKindOfClass()) {
            long long v65 = v64;
          }
          else {
            long long v65 = 0;
          }
        }
        else
        {
          long long v65 = 0;
        }
        long long v66 = v65;

        long long v67 = [(UIWindowScene *)v66 traitCollection];

        id v68 = (void *)[v26 mutableCopy];
        objc_msgSend(v68, "pui_setDeviceOrientation:", -[UIWindow interfaceOrientation](self->_window, "interfaceOrientation"));
        id v69 = [PRPosterEnvironmentImpl alloc];
        v70 = self->_targetConfig;
        BOOL v71 = [(PREditor *)self extensionBundleURL];
        uint64_t v72 = [(PRPosterEnvironmentImpl *)v69 initWithSceneSettings:v68 traitCollection:v67 targetConfig:v70 extensionBundleURL:v71];
        environment = self->_environment;
        self->_environment = v72;

        [v140 setSettingsDiff:v13];
        -[PREditor setCoveredByHostModalPresentation:](self, "setCoveredByHostModalPresentation:", objc_msgSend(v26, "pr_isCoveredByModalPresentation"));
        -[PREditor setInlineComplicationConfigured:](self, "setInlineComplicationConfigured:", objc_msgSend(v26, "pui_isInlineComplicationConfigured"));
        -[PREditor setAlternateDateEnabled:](self, "setAlternateDateEnabled:", objc_msgSend(v26, "pr_isAlternateDateEnabled"));
        uint64_t v74 = objc_msgSend(v26, "pr_editingVariant");
        double v127 = v41;
        double v128 = v39;
        double v123 = v45;
        double v124 = v43;
        if (v74 == [(PREditor *)self variant])
        {
          int v75 = 0;
        }
        else
        {
          [(PREditor *)self setVariant:v74];
          int v75 = v133;
        }
        double v76 = v37;
        double v77 = v35;
        double v78 = v33;
        double v79 = v31;
        uint64_t v80 = objc_msgSend(v26, "pr_editingContext");
        if (v80 != [(PREditor *)self editingContext]) {
          [(PREditor *)self setEditingContext:v80];
        }
        objc_msgSend(v26, "pr_leadingTopButtonFrame");
        double v82 = v81;
        double v84 = v83;
        double v86 = v85;
        double v88 = v87;
        [(PREditor *)self leadingTopButtonFrame];
        v149.origin.double x = v89;
        v149.origin.double y = v90;
        v149.size.double width = v91;
        v149.size.double height = v92;
        v147.origin.double x = v82;
        v147.origin.double y = v84;
        v147.size.double width = v86;
        v147.size.double height = v88;
        if (!CGRectEqualToRect(v147, v149)) {
          -[PREditor setLeadingTopButtonFrame:](self, "setLeadingTopButtonFrame:", v82, v84, v86, v88);
        }
        objc_msgSend(v26, "pr_trailingTopButtonFrame");
        double v94 = v93;
        double v96 = v95;
        double v98 = v97;
        double v100 = v99;
        [(PREditor *)self trailingTopButtonFrame];
        v150.origin.double x = v101;
        v150.origin.double y = v102;
        v150.size.double width = v103;
        v150.size.double height = v104;
        v148.origin.double x = v94;
        v148.origin.double y = v96;
        v148.size.double width = v98;
        v148.size.double height = v100;
        if (!CGRectEqualToRect(v148, v150)) {
          -[PREditor setTrailingTopButtonFrame:](self, "setTrailingTopButtonFrame:", v94, v96, v98, v100);
        }
        uint64_t v105 = objc_msgSend(v26, "pr_isDepthEffectDisallowed");
        if (v105 != [(PREditor *)self isDepthEffectDisallowed])
        {
          [(PREditor *)self setDepthEffectDisallowed:v105];
          objc_msgSend(v132, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
          [(PREditor *)self updateRootViewControllerMenus];
        }
        uint64_t v106 = objc_msgSend(v26, "pr_areComplicationsDisallowed");
        if (v106 != [(PREditor *)self areComplicationsDisallowed])
        {
          [(PREditor *)self setComplicationsDisallowed:v106];
          int v75 = 1;
        }
        v107 = [(PRPosterEditingEnvironment *)self->_environment role];
        v108 = [(PREditor *)self posterRole];
        char v109 = [v108 isEqual:v107];

        if (v109)
        {
          if (!v75) {
            goto LABEL_45;
          }
        }
        else
        {
          [(PREditor *)self setPosterRole:v107];
        }
        [(PREditor *)self _rebuildRootViewController];
LABEL_45:
        uint64_t v110 = objc_msgSend(v26, "pr_areControlsHidden");
        [(PREditor *)self setTitleString:v139];
        [(PREditor *)self setOverrideDate:v138];
        -[PREditor setHorizontalTitleBoundingRect:](self, "setHorizontalTitleBoundingRect:", v79, v78, v77, v76);
        -[PREditor setVerticalTitleBoundingRect:](self, "setVerticalTitleBoundingRect:", v128, v127, v124, v123);
        [(PREditor *)self setUsesEditingLayout:v137];
        [(PREditor *)self setControlsHidden:v110];
        [(PREditor *)self setFocusedComplicationElement:v136];
        [(PREditor *)self setComplicationsRowConfigured:v129];
        [(PREditor *)self setComplicationSidebarConfigured:v126];
        [(PREditor *)self setFocusedQuickActionPosition:v125];

        unint64_t v14 = (unint64_t)v141;
        goto LABEL_46;
      }
      uint64_t v57 = v13;
      v59 = self->_targetConfig;
      id v145 = 0;
      [(PRMutablePosterConfiguration *)v59 storeUserInfo:v55 error:&v145];
      v58 = v145;
      v60 = PRLogEditing();
      double v61 = v60;
      if (v58)
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[PREditor _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:]((uint64_t)v58, v61);
        }
      }
      else if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C1C4000, v61, OS_LOG_TYPE_DEFAULT, "Successfully migrated source user info to target user info.", buf, 2u);
      }
    }
    uint64_t v13 = v57;
    goto LABEL_21;
  }
LABEL_46:
  if (v14) {
    uint64_t v111 = 2;
  }
  else {
    uint64_t v111 = 1;
  }
  v112 = [(PREditor *)self delegateSafeForCallbackType:v111];
  v113 = [(PREditor *)self delegateSafeForCallbackType:2];
  v114 = [(PREditor *)self delegateSafeForCallbackType:1];
  v115 = self->_environment;
  v130 = self->_window;
  id v134 = v114;
  v116 = v115;
  id v117 = v132;
  v143 = v117;
  id v118 = v140;
  id v119 = v113;
  id v120 = v112;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  if (!v14) {
    [v135 updateClientSettingsWithBlock:&__block_literal_global_259];
  }
  if (objc_msgSend(v26, "pui_isInvalidated"))
  {
    id v121 = v117;
    v122 = PRLogEditing();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C1C4000, v122, OS_LOG_TYPE_DEFAULT, "faking sceneDidDisconnect for pui_isInvalidated", buf, 2u);
    }

    [(PREditor *)self sceneDidDisconnect:self->_scene];
    id v117 = v121;
  }
}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 120))
  {
    if ([*(id *)(a1 + 64) isDisconnected]) {
      [*(id *)(a1 + 64) reconnect];
    }
    if (*(unsigned char *)(a1 + 121) || *(unsigned char *)(a1 + 122) || *(unsigned char *)(a1 + 123))
    {
      [*(id *)(a1 + 32) _refetchLooksAndBuildUI];
    }
    else if (*(unsigned char *)(a1 + 124))
    {
      [*(id *)(a1 + 32) leadingTopButtonFrame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      [*(id *)(a1 + 32) trailingTopButtonFrame];
      objc_msgSend(*(id *)(a1 + 64), "updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:", v35, v37, v39, v41, v42, v43, v44, v45);
    }
    uint64_t v2 = [*(id *)(a1 + 32) areControlsHidden];
    [*(id *)(a1 + 64) setUsesEditingLayout:*(unsigned __int8 *)(a1 + 125)];
    [*(id *)(a1 + 64) setFocusedComplicationElement:*(void *)(a1 + 104)];
    [*(id *)(a1 + 64) setComplicationsRowConfigured:*(unsigned __int8 *)(a1 + 126)];
    [*(id *)(a1 + 64) setComplicationSidebarConfigured:*(unsigned __int8 *)(a1 + 127)];
    [*(id *)(a1 + 64) setControlsHidden:v2];
    [*(id *)(a1 + 64) setFocusedQuickActionPosition:*(void *)(a1 + 112)];
    [*(id *)(a1 + 64) updateReticleVisibilityIfNeeded];
    id v3 = [*(id *)(a1 + 72) settingsDiff];

    if (v3)
    {
      id v4 = PRLogEditing();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Sending environment update to delegate", buf, 2u);
      }

      [*(id *)(a1 + 80) editor:*(void *)(a1 + 32) didUpdateEnvironment:*(void *)(a1 + 56) withTransition:*(void *)(a1 + 72)];
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v5 = [*(id *)(a1 + 72) actions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (!v6)
    {
LABEL_48:

      return;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    uint64_t v46 = *(void *)v56;
    uint64_t v47 = v5;
LABEL_19:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v56 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v21 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [*(id *)(a1 + 32) handleNotificationForwardAction:v10];
        }
        goto LABEL_46;
      }
      id v11 = v10;
      if ([v11 userAcceptedChanges])
      {
        if (*(void *)(a1 + 88))
        {
          id v12 = [*(id *)(a1 + 32) configuredProperties];
          uint64_t v13 = [*(id *)(a1 + 32) currentLook];
          uint64_t v14 = [*(id *)(a1 + 32) effectiveTitleStyleConfigurationForLook:v13];
          id v49 = (id)v14;
          if (v12)
          {
            id v15 = (void *)v14;
            id v16 = [v12 titleStyleConfiguration];

            if (v16)
            {
              __int16 v17 = [v12 titleStyleConfiguration];
              char v18 = [v15 isVisiblyEqualToTitleStyleConfiguration:v17];

              if ((v18 & 1) == 0)
              {
                id v19 = (id)[v12 mutableCopy];
                [v19 setTitleStyleConfiguration:v15];
                double v20 = (PRPosterConfiguredProperties *)[v19 copy];
                goto LABEL_41;
              }
LABEL_42:
              unsigned int v28 = [*(id *)(a1 + 56) targetConfiguredProperties];
              [*(id *)(a1 + 32) _applyStylePropertiesFromConfiguredProperties:v12 toConfiguredProperties:v28 forLook:v13];
              unsigned int v29 = [*(id *)(a1 + 32) homeScreenConfigurationWithPosterProvidedColorConfigurations];
              [v28 setHomeScreenConfiguration:v29];
              double v30 = PRLogEditing();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18C1C4000, v30, OS_LOG_TYPE_DEFAULT, "Sending finalize to delegate", buf, 2u);
              }

              uint64_t v31 = *(void *)(a1 + 32);
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_253;
              v52[3] = &unk_1E54DB3C8;
              v52[4] = v11;
              double v32 = *(void **)(a1 + 48);
              id v53 = *(id *)(a1 + 56);
              id v54 = v28;
              id v33 = v28;
              [v32 editor:v31 finalizeWithCompletion:v52];
              [*(id *)(a1 + 32) setStatus:3];

              uint64_t v8 = v46;
              id v5 = v47;
              goto LABEL_45;
            }
            id v19 = (id)[v12 mutableCopy];
            uint64_t v27 = [*(id *)(a1 + 32) defaultTitleStyleConfigurationForLook:v13];
            [v19 setTitleStyleConfiguration:v27];
            double v20 = (PRPosterConfiguredProperties *)[v19 copy];

            id v12 = (void *)v27;
          }
          else
          {
            id v19 = *(id *)(*(void *)(a1 + 32) + 64);
            id v12 = [*(id *)(a1 + 32) defaultTitleStyleConfigurationForLook:v13];
            if (v19)
            {
              int v24 = [PRPosterColorVariationsConfiguration alloc];
              uint64_t v25 = [v19 dictionaryRepresentation];
              double v26 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](v24, "initWithVariationStorage:version:", v25, [(id)objc_opt_class() version]);
            }
            else
            {
              double v26 = 0;
            }
            double v20 = [[PRPosterConfiguredProperties alloc] initWithTitleStyleConfiguration:v12 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:v26 quickActionsConfiguration:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];
          }
LABEL_41:

          id v12 = v20;
          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E4FB08E0], "pr_clearCachesForInvalidation");
        uint64_t v23 = PRSLogPosterContents();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_cold_1(&v50, v51, v23);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4FB08E0], "pr_clearCachesForInvalidation");
      }
      [v11 invalidate];
LABEL_45:
      [*(id *)(a1 + 64) disconnect];

LABEL_46:
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (!v7) {
          goto LABEL_48;
        }
        goto LABEL_19;
      }
    }
  }
  [*(id *)(a1 + 32) setStatus:2];
  [*(id *)(a1 + 40) layoutIfNeeded];
  [*(id *)(a1 + 48) editor:*(void *)(a1 + 32) didInitializeWithEnvironment:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _refetchLooksAndBuildUI];
  if ([*(id *)(a1 + 32) isLifecycleTiedToInitiallyPresentedViewController]
    && ([*(id *)(a1 + 32) isPresentingModalViewController] & 1) == 0)
  {
    id v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 32) file:@"PREditor.m" lineNumber:2549 description:@"Need to present a view controller (including color picker) in -editor:didInitializeWithEnvironment:"];
  }
}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_253(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "pr_clearCachesForInvalidation");
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) targetConfiguration];
  id v3 = (void *)[*(id *)(a1 + 48) copy];
  [v2 sendResponseWithUpdatedConfiguration:v4 updatedProperties:v3];
}

uint64_t __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_257(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setDidFinishInitialization:", 1);
}

- (id)homeScreenConfigurationWithPosterProvidedColorConfigurations
{
  id v3 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (v3
    && ((v4 = objc_opt_respondsToSelector(), char v5 = objc_opt_respondsToSelector(), v6 = v5, (v4 & 1) != 0) || (v5 & 1) != 0))
  {
    if (v4)
    {
      uint64_t v8 = [v3 solidColorHomeScreenColorPickerConfigurationForEditor:self];
    }
    else
    {
      uint64_t v8 = objc_alloc_init(PREditorColorPickerConfiguration);
    }
    uint64_t v9 = v8;
    id v10 = [[PRPosterSolidColorHomeScreenAppearance alloc] initWithColor:0 colorPickerConfiguration:v8];
    if (v6)
    {
      id v11 = [v3 gradientHomeScreenColorPickerConfigurationForEditor:self];
    }
    else
    {
      id v11 = objc_alloc_init(PREditorColorPickerConfiguration);
    }
    id v12 = v11;
    uint64_t v13 = [[PRPosterGradientHomeScreenAppearance alloc] initWithColor:0 colorPickerConfiguration:v11];
    uint64_t v14 = [PRPosterHomeScreenConfiguration alloc];
    id v15 = [[PRPosterLockPosterHomeScreenAppearance alloc] initWithLegibilityBlurEnabled:0 allowsModifyingLegibilityBlur:1];
    id v16 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    __int16 v17 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
    uint64_t v7 = [(PRPosterHomeScreenConfiguration *)v14 initWithSelectedAppearanceType:0 lockPosterAppearance:v15 solidColorAppearance:v10 gradientAppearance:v13 homePosterAppearance:v16 customizationConfiguration:v17];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)additionalFontConfigurationsForFontAndContentStylePickerViewController:(id)a3
{
  char v4 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    char v5 = [v4 additionalTimeFontConfigurationsForEditor:self];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)fontAndContentStylePickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4
{
  id v5 = a4;
  char v6 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 editor:self shouldAllowUserToSelectTimeFontConfiguration:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)fontAndContentStylePickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  id v5 = [(PREditorRootViewController *)self->_rootViewController view];
  [v5 layoutIfNeeded];

  char v6 = [(PREditorRootViewController *)self->_rootViewController presentedViewController];
  char v7 = [v6 sheetPresentationController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PREditor_fontAndContentStylePickerViewController_didUpdateDesiredDetent___block_invoke;
  v8[3] = &unk_1E54DAFB8;
  void v8[4] = self;
  [v7 animateChanges:v8];
}

void __75__PREditor_fontAndContentStylePickerViewController_didUpdateDesiredDetent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 144) presentedViewController];
  id v1 = [v2 sheetPresentationController];
  [v1 invalidateDetents];
}

- (void)fontAndContentStylePickerViewControllerDidFinish:(id)a3
{
  id v5 = [(PREditor *)self configuredProperties];
  if (!v5)
  {
    id v5 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:");
  }
  [(PREditor *)self setEditingFocusActive:0];
  fontAndColorPickerViewController = self->_fontAndColorPickerViewController;
  self->_fontAndColorPickerViewController = 0;
}

- (id)additionalFontConfigurationsForFontAndColorPickerViewController:(id)a3
{
  char v4 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 additionalTimeFontConfigurationsForEditor:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)fontAndColorPickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4
{
  id v5 = a4;
  char v6 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 editor:self shouldAllowUserToSelectTimeFontConfiguration:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  id v5 = [(PREditorRootViewController *)self->_rootViewController view];
  [v5 layoutIfNeeded];

  char v6 = [(PREditorRootViewController *)self->_rootViewController presentedViewController];
  char v7 = [v6 sheetPresentationController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PREditor_fontAndColorPickerViewController_didUpdateDesiredDetent___block_invoke;
  v8[3] = &unk_1E54DAFB8;
  void v8[4] = self;
  [v7 animateChanges:v8];
}

void __68__PREditor_fontAndColorPickerViewController_didUpdateDesiredDetent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 144) presentedViewController];
  id v1 = [v2 sheetPresentationController];
  [v1 invalidateDetents];
}

- (void)fontAndColorPickerViewControllerDidFinish:(id)a3
{
  uint64_t v8 = [(PREditor *)self configuredProperties];
  if (!v8)
  {
    uint64_t v8 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:");
  }
  char v4 = [PRPosterColorVariationsConfiguration alloc];
  id v5 = [(PREditingColorVariationStore *)self->_colorVariationStore dictionaryRepresentation];
  char v6 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](v4, "initWithVariationStorage:version:", v5, [(id)objc_opt_class() version]);

  [(PRPosterConfiguredProperties *)v8 setColorVariationsConfiguration:v6];
  [(PREditor *)self setEditingFocusActive:0];
  fontAndColorPickerViewController = self->_fontAndColorPickerViewController;
  self->_fontAndColorPickerViewController = 0;
}

- (id)coordinatorForContentStyle:(id)a3 forAmbientStylePicker:(id)a4
{
  id v5 = a3;
  char v6 = [(PREditor *)self delegateSafeForCallbackType:3];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v7 = [v6 coordinatorForContentStyle:v5 forEditor:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PREditorRemoteViewPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)ambientEditingTitledViewControllerWantsToClose:(id)a3
{
  [(PREditor *)self setDismissingPresentedViewControllerFromTitledViewController:1];
  [(PREditor *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v14 = a3;
  char v4 = [(PREditor *)self delegate];
  id v5 = (id)[v14 appendObject:v4 withName:@"delegate"];

  unint64_t v6 = [(PREditor *)self status];
  if (v6 > 3) {
    id v7 = 0;
  }
  else {
    id v7 = off_1E54DB908[v6];
  }
  id v8 = (id)[v14 appendObject:v7 withName:@"status"];
  id v9 = (id)[v14 appendObject:self->_scene withName:@"scene"];
  id v10 = [(PREditor *)self rootViewController];
  id v11 = (id)[v14 appendObject:v10 withName:@"rootViewController"];

  id v12 = [(PREditor *)self currentLook];
  id v13 = (id)[v14 appendObject:v12 withName:@"currentLook"];
}

- (PRPosterEditingEnvironment)environment
{
  return self->_environment;
}

- (PRPosterEditingPreferences)preferences
{
  return self->_preferences;
}

- (PREditingLook)currentLook
{
  return self->_currentLook;
}

- (double)looksScrollingDecelerationRate
{
  return self->_looksScrollingDecelerationRate;
}

- (BOOL)isDepthEffectDisallowed
{
  return self->_depthEffectDisallowed;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (BOOL)areViewsSharedBetweenLooks
{
  return self->_viewsSharedBetweenLooks;
}

- (void)setViewsSharedBetweenLooks:(BOOL)a3
{
  self->_viewsSharedBetweenLooks = a3;
}

- (PREditorRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (NSString)posterRole
{
  return self->_posterRole;
}

- (void)setPosterRole:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (PREditingLook)initialLook
{
  return self->_initialLook;
}

- (void)setInitialLook:(id)a3
{
}

- (PREditingDelegate)delegate
{
  return self->_delegate;
}

- (PROverridableDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (int64_t)editingContext
{
  return self->_editingContext;
}

- (void)setEditingContext:(int64_t)a3
{
  self->_editingContext = a3;
}

- (int64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (void)setAcceptButtonType:(int64_t)a3
{
  self->_acceptButtonType = a3;
}

- (CGRect)leadingTopButtonFrame
{
  double x = self->_leadingTopButtonFrame.origin.x;
  double y = self->_leadingTopButtonFrame.origin.y;
  double width = self->_leadingTopButtonFrame.size.width;
  double height = self->_leadingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLeadingTopButtonFrame:(CGRect)a3
{
  self->_leadingTopButtonFrame = a3;
}

- (CGRect)trailingTopButtonFrame
{
  double x = self->_trailingTopButtonFrame.origin.x;
  double y = self->_trailingTopButtonFrame.origin.y;
  double width = self->_trailingTopButtonFrame.size.width;
  double height = self->_trailingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrailingTopButtonFrame:(CGRect)a3
{
  self->_trailingTopButtonFrame = a3;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x = self->_horizontalTitleBoundingRect.origin.x;
  double y = self->_horizontalTitleBoundingRect.origin.y;
  double width = self->_horizontalTitleBoundingRect.size.width;
  double height = self->_horizontalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x = self->_verticalTitleBoundingRect.origin.x;
  double y = self->_verticalTitleBoundingRect.origin.y;
  double width = self->_verticalTitleBoundingRect.size.width;
  double height = self->_verticalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setPerspectiveZoomDisallowed:(BOOL)a3
{
  self->_perspectiveZoomDisallowed = a3;
}

- (PRPosterMutableConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (void)setConfiguredProperties:(id)a3
{
}

- (BOOL)isInlineComplicationConfigured
{
  return self->_inlineComplicationConfigured;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (BOOL)isCoveredByHostModalPresentation
{
  return self->_coveredByHostModalPresentation;
}

- (PRInvalidatable)coveredByHostModalPresentationDisableLookSwitchingAssertion
{
  return self->_coveredByHostModalPresentationDisableLookSwitchingAssertion;
}

- (void)setCoveredByHostModalPresentationDisableLookSwitchingAssertion:(id)a3
{
}

- (BOOL)isPresentingModalViewController
{
  return self->_presentingModalViewController;
}

- (PRInvalidatable)presentingModalViewControllerDisableLookSwitchingAssertion
{
  return self->_presentingModalViewControllerDisableLookSwitchingAssertion;
}

- (void)setPresentingModalViewControllerDisableLookSwitchingAssertion:(id)a3
{
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  self->_usesEditingLayout = a3;
}

- (void)setControlsHidden:(BOOL)a3
{
  self->_controlsHidden = a3;
}

- (BOOL)isComplicationsRowConfigured
{
  return self->_complicationsRowConfigured;
}

- (void)setComplicationsRowConfigured:(BOOL)a3
{
  self->_complicationsRowConfigured = a3;
}

- (BOOL)isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (void)setComplicationSidebarConfigured:(BOOL)a3
{
  self->_complicationSidebarConfigured = a3;
}

- (int64_t)focusedComplicationElement
{
  return self->_focusedComplicationElement;
}

- (void)setFocusedComplicationElement:(int64_t)a3
{
  self->_focusedComplicationElement = a3;
}

- (int64_t)focusedQuickActionPosition
{
  return self->_focusedQuickActionPosition;
}

- (void)setFocusedQuickActionPosition:(int64_t)a3
{
  self->_focusedQuickActionPosition = a3;
}

- (BOOL)areComplicationsDisallowed
{
  return self->_complicationsDisallowed;
}

- (void)setComplicationsDisallowed:(BOOL)a3
{
  self->_complicationsDisallowed = a3;
}

- (BOOL)hasUpdatedLooks
{
  return self->_hasUpdatedLooks;
}

- (void)setHasUpdatedLooks:(BOOL)a3
{
  self->_hasUpdatedLooks = a3;
}

- (BOOL)hasUpdatedLookProperties
{
  return self->_hasUpdatedLookProperties;
}

- (void)setHasUpdatedLookProperties:(BOOL)a3
{
  self->_hasUpdatedLookProperties = a3;
}

- (UIWindow)remoteViewControllerPresentationWindow
{
  return self->_remoteViewControllerPresentationWindow;
}

- (void)setRemoteViewControllerPresentationWindow:(id)a3
{
}

- (BOOL)isDismissingPresentedViewControllerFromTitledViewController
{
  return self->_dismissingPresentedViewControllerFromTitledViewController;
}

- (void)setDismissingPresentedViewControllerFromTitledViewController:(BOOL)a3
{
  self->_dismissingPresentedViewControllerFromTitledViewController = a3;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (void)setPopoverPresentationController:(id)a3
{
}

- (PREditingFontAndContentStylePickerViewController)fontAndContentStylePickerViewController
{
  return self->_fontAndContentStylePickerViewController;
}

- (void)setFontAndContentStylePickerViewController:(id)a3
{
}

- (PREditingFontAndColorPickerViewController)fontAndColorPickerViewController
{
  return self->_fontAndColorPickerViewController;
}

- (void)setFontAndColorPickerViewController:(id)a3
{
}

- (NSHashTable)modalPresentationAssertions
{
  return self->_modalPresentationAssertions;
}

- (void)setModalPresentationAssertions:(id)a3
{
}

- (NSMapTable)modalPresentationAssertionsByViewController
{
  return self->_modalPresentationAssertionsByViewController;
}

- (void)setModalPresentationAssertionsByViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresentationAssertionsByViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationAssertions, 0);
  objc_storeStrong((id *)&self->_fontAndColorPickerViewController, 0);
  objc_storeStrong((id *)&self->_fontAndContentStylePickerViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerPresentationWindow, 0);
  objc_storeStrong((id *)&self->_presentingModalViewControllerDisableLookSwitchingAssertion, 0);
  objc_storeStrong((id *)&self->_coveredByHostModalPresentationDisableLookSwitchingAssertion, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_initialLook, 0);
  objc_storeStrong((id *)&self->_posterRole, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_currentLook, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_appearanceMenu, 0);
  objc_storeStrong((id *)&self->_togglingPerspectiveZoomAction, 0);
  objc_storeStrong((id *)&self->_depthEffectMenu, 0);
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
  objc_storeStrong((id *)&self->_defaultTitleStyleConfigurationPerLook, 0);
  objc_storeStrong((id *)&self->_lookSwitchingAssertions, 0);
  objc_storeStrong((id *)&self->_targetConfig, 0);
  objc_storeStrong((id *)&self->_sourceContents, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)presentViewController:animated:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)presentViewController:animated:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_refetchLooksForProperties
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:willConnectToSession:options:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_performActionsForUIScene:(uint64_t)a1 withUpdatedFBSScene:(NSObject *)a2 settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Error storing source user info in target user info: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_performActionsForUIScene:(uint64_t)a1 withUpdatedFBSScene:(NSObject *)a2 settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Error loading source user info: %@", (uint8_t *)&v2, 0xCu);
}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "PREditingDidDismissAction doesn't have a delegate - bail the save", buf, 2u);
}

@end