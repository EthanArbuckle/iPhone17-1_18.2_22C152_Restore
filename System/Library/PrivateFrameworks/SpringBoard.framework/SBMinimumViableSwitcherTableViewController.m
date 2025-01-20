@interface SBMinimumViableSwitcherTableViewController
- (BOOL)canInterruptActiveTransition;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isAsyncRenderingDisabled;
- (BOOL)isShowingModifierTimeline;
- (BOOL)isStatusBarHiddenForAppLayout:(id)a3;
- (BOOL)isWindowVisible;
- (BOOL)shouldAcceleratedHomeButtonPressBegin;
- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 transitionCompleted:(BOOL)a5;
- (BOOL)shouldAnimateInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BSAnimationSettings)defaultTransitionAnimationSettings;
- (SBBestAppSuggestion)bestAppSuggestion;
- (SBSwitcherContentViewControllerDataSource)dataSource;
- (SBSwitcherContentViewControllerDelegate)delegate;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)contentAspectRatio;
- (double)minimumHomeScreenScale;
- (double)snapshotScaleForSceneHandle:(id)a3;
- (double)switcherCardScale;
- (id)_appLayouts;
- (id)_statusBarStyleRequestForDefaultStyle;
- (id)animationControllerForTransitionRequest:(id)a3;
- (id)foregroundAppLayouts;
- (id)iconForAppLayout:(id)a3;
- (id)liveContentOverlayForAppLayout:(id)a3;
- (id)liveOverlayForSceneHandle:(id)a3;
- (id)liveOverlayForSceneIdentityToken:(id)a3;
- (id)liveScenesIdentityTokens;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)contentOrientation;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)noteAppLayoutsDidChange;
- (void)noteModelDidMutateForInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 willAnimate:(BOOL)a5;
- (void)performAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 completion:(id)a5;
- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeLayoutRole:(int64_t)a3 inSpace:(id)a4 mutationBlock:(id)a5 reason:(int64_t)a6;
- (void)setAsyncRenderingDisabled:(BOOL)a3;
- (void)setBestAppSuggestion:(id)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation SBMinimumViableSwitcherTableViewController

- (double)snapshotScaleForSceneHandle:(id)a3
{
  return 0.5;
}

- (double)switcherCardScale
{
  return 0.5;
}

- (double)minimumHomeScreenScale
{
  return 1.0;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 transitionCompleted:(BOOL)a5
{
  return 1;
}

- (BOOL)isWindowVisible
{
  v2 = [(UIViewController *)self _sbWindowScene];
  v3 = [v2 switcherController];

  if (!v3)
  {
    v4 = SBLogCommon();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5) {
      NSLog(&cfstr_ExpectedASwitc.isa);
    }
  }
  BOOL v6 = [v3 unlockedEnvironmentMode] == 2;

  return v6;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (BOOL)isStatusBarHiddenForAppLayout:(id)a3
{
  return 0;
}

- (id)liveScenesIdentityTokens
{
  return 0;
}

- (id)liveOverlayForSceneHandle:(id)a3
{
  return 0;
}

- (id)liveOverlayForSceneIdentityToken:(id)a3
{
  return 0;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (id)_appLayouts
{
  v3 = [(SBMinimumViableSwitcherTableViewController *)self dataSource];
  v4 = [v3 appLayoutsForSwitcherContentController:self];

  return v4;
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = [a3 layoutState];
  uint64_t v10 = [v9 unlockedEnvironmentMode];

  if (v10 == 2)
  {
    v11 = [(SBMinimumViableSwitcherTableViewController *)self tableView];
    [v11 reloadData];
  }
  double v12 = 0.4;
  v13[1] = 3221225472;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[2] = __95__SBMinimumViableSwitcherTableViewController_performTransitionWithContext_animated_completion___block_invoke;
  v13[3] = &unk_1E6AF5D38;
  if (!v5) {
    double v12 = 0.0;
  }
  BOOL v14 = v10 == 2;
  v13[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:v8 completion:v12];
}

void __95__SBMinimumViableSwitcherTableViewController_performTransitionWithContext_animated_completion___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setAlpha:v2];
}

- (BOOL)canInterruptActiveTransition
{
  return 1;
}

- (BSAnimationSettings)defaultTransitionAnimationSettings
{
  return (BSAnimationSettings *)[MEMORY[0x1E4F4F680] settingsWithDuration:0.4];
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  return 0;
}

- (BOOL)isShowingModifierTimeline
{
  return 0;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (id)iconForAppLayout:(id)a3
{
  return 0;
}

- (id)liveContentOverlayForAppLayout:(id)a3
{
  return 0;
}

- (double)contentAspectRatio
{
  double v2 = [(SBMinimumViableSwitcherTableViewController *)self viewIfLoaded];
  [v2 bounds];
  if (v2) {
    double v5 = v3 / v4;
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

- (id)foregroundAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4
{
  return 0;
}

- (void)noteModelDidMutateForInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 willAnimate:(BOOL)a5
{
  BOOL v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__SBMinimumViableSwitcherTableViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke;
  v11[3] = &unk_1E6AFCD30;
  id v12 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v11];

  uint64_t v10 = [(SBMinimumViableSwitcherTableViewController *)self tableView];
  [v10 insertRowsAtIndexPaths:v9 withRowAnimation:100];
}

void __111__SBMinimumViableSwitcherTableViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  [v3 addObject:v4];
}

- (void)performAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
  }
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (void)removeLayoutRole:(int64_t)a3 inSpace:(id)a4 mutationBlock:(id)a5 reason:(int64_t)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
  uint64_t v9 = [v8 indexOfObject:v7];

  uint64_t v10 = [(SBMinimumViableSwitcherTableViewController *)self tableView];
  v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:0];
  v13[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v10 deleteRowsAtIndexPaths:v12 withRowAnimation:100];
}

- (void)noteAppLayoutsDidChange
{
  id v2 = [(SBMinimumViableSwitcherTableViewController *)self tableView];
  [v2 reloadData];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SBMinimumViableSwitcherTableViewController;
  [(SBMinimumViableSwitcherTableViewController *)&v6 viewDidLoad];
  double v3 = [(SBMinimumViableSwitcherTableViewController *)self view];
  [v3 setAlpha:0.0];

  id v4 = [(SBMinimumViableSwitcherTableViewController *)self tableView];
  double v5 = self;
  [v4 registerClass:v5 forCellReuseIdentifier:@"Identifier"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_bestAppSuggestion) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
  int64_t v7 = [v6 count];

  if (self->_bestAppSuggestion) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:v6];
  BOOL v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setBackgroundColor:v8];

  if (self->_bestAppSuggestion && ![v6 section])
  {
    v15 = NSString;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [(SBBestAppSuggestion *)self->_bestAppSuggestion bundleIdentifier];
    uint64_t v10 = [v15 stringWithFormat:@"%@ - %@", v17, v18];

    v13 = [v7 textLabel];
    [v13 setText:v10];
  }
  else
  {
    uint64_t v9 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v11 = [v10 allItems];
    id v12 = objc_msgSend(v11, "bs_map:", &__block_literal_global_93);
    v13 = [v12 componentsJoinedByString:@", "];

    BOOL v14 = [v7 textLabel];
    [v14 setText:v13];
  }
  return v7;
}

id __78__SBMinimumViableSwitcherTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = SBLegacyDisplayItemTypeFromType([v2 type]);
  id v4 = NSString;
  double v5 = [v2 uniqueIdentifier];

  id v6 = [v4 stringWithFormat:@"%@ - %@", v3, v5];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SBMinimumViableSwitcherTableViewController *)self delegate];
  if (self->_bestAppSuggestion && ![v7 section])
  {
    if (objc_opt_respondsToSelector()) {
      [v8 switcherContentController:self activatedBestAppSuggestion:self->_bestAppSuggestion];
    }
  }
  else
  {
    uint64_t v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
      v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      int v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Tapped: %@", (uint8_t *)&v15, 0xCu);
    }
    id v12 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    BOOL v14 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v13];
    [v8 switcherContentController:self performTransitionWithRequest:v14 gestureInitiated:0];

    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_bestAppSuggestion && ![v7 section])
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "row"));

    BOOL v11 = [v10 type] == 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = a5;
    BOOL v8 = [(SBMinimumViableSwitcherTableViewController *)self _appLayouts];
    uint64_t v9 = [v7 row];

    id v13 = [v8 objectAtIndex:v9];

    uint64_t v10 = [(SBMinimumViableSwitcherTableViewController *)self delegate];
    BOOL v11 = [v13 allItems];
    id v12 = [v11 firstObject];
    [v10 switcherContentController:self deletedDisplayItem:v12 inAppLayout:v13 forReason:1];
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return @"Kill";
}

- (id)_statusBarStyleRequestForDefaultStyle
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:0 foregroundColor:0];
  return v2;
}

- (SBSwitcherContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSwitcherContentViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBSwitcherContentViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SBBestAppSuggestion)bestAppSuggestion
{
  return self->_bestAppSuggestion;
}

- (void)setBestAppSuggestion:(id)a3
{
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

- (BOOL)isAsyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (void)setAsyncRenderingDisabled:(BOOL)a3
{
  self->_asyncRenderingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_bestAppSuggestion, 0);
  objc_storeStrong((id *)&self->_temporarySideAppView, 0);
  objc_storeStrong((id *)&self->_temporaryAppView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end