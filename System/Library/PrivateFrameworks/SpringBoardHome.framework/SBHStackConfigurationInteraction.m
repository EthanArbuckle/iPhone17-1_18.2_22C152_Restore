@interface SBHStackConfigurationInteraction
- (BOOL)showsAddButton;
- (BOOL)showsDoneButton;
- (BOOL)stackConfigurationViewController:(id)a3 allowsRemovalOfIconDataSource:(id)a4;
- (BOOL)stackConfigurationViewController:(id)a3 dragsSupportSystemDragsForIconView:(id)a4;
- (BOOL)stackConfigurationViewControllerShouldDisallowLabelArea:(id)a3;
- (CGRect)_contentBoundingFrame;
- (CGRect)_sourceContentFrame;
- (SBHIconViewConfigurationInteractionDelegate)delegate;
- (SBHStackConfiguration)configuration;
- (SBHStackConfigurationInteraction)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6;
- (SBHStackConfigurationInteractionDelegate)stackConfigurationDelegate;
- (SBHStackConfigurationViewController)configurationViewController;
- (SBHStackConfigurationViewControllerAppearanceDelegate)appearanceDelegate;
- (SBHViewControllerTransition)transition;
- (SBHWidgetSettings)widgetSettings;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconView)iconView;
- (SBIconViewProviding)iconViewProvider;
- (SBLeafIconDataSource)configuredDataSource;
- (UIView)containerView;
- (UIViewController)containerViewController;
- (double)_padApertureOutsetFromWidgetWithGridSize:(id)a3;
- (double)stackConfigurationViewController:(id)a3 iconContentScaleForGridSizeClass:(id)a4;
- (id)animatorForTransition:(id)a3;
- (id)stackConfigurationViewController:(id)a3 dragPreviewForIconView:(id)a4;
- (id)stackConfigurationViewController:(id)a3 draggedIconForIdentifier:(id)a4;
- (id)stackConfigurationViewController:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5;
- (id)stackConfigurationViewController:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)windowForIconDragPreviewsForStackConfigurationViewController:(id)a3 forWindowScene:(id)a4;
- (int64_t)stackConfigurationViewControllerIconViewComponentBackgroundViewType:(id)a3;
- (void)_endConfigurationAnimated:(BOOL)a3;
- (void)_handleTransitionWillProgressToEndState:(BOOL)a3;
- (void)beginConfiguration;
- (void)endConfiguration;
- (void)endConfigurationImmediately;
- (void)iconViewSizeDidChange:(id)a3;
- (void)popConfiguration;
- (void)prepareTransition:(id)a3;
- (void)setAppearanceDelegate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationViewController:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setShowsAddButton:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setStackConfigurationDelegate:(id)a3;
- (void)stackConfigurationViewController:(id)a3 didCommitStackConfiguration:(id)a4;
- (void)stackConfigurationViewController:(id)a3 didRemoveSuggestedWidgetIcon:(id)a4;
- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5;
- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)stackConfigurationViewController:(id)a3 isConsumingDropSession:(id)a4;
- (void)stackConfigurationViewControllerDidReceiveUserTouch:(id)a3;
- (void)stackConfigurationViewControllerDoneButtonTapped:(id)a3;
- (void)stackConfigurationViewControllerRequestsPresentAddWidgetSheet:(id)a3;
- (void)stackConfigurationViewControllerWillAnimateWidgetInsertion:(id)a3;
- (void)transitionDidProgressToEndState:(id)a3;
- (void)transitionDidReturnToBeginningState:(id)a3;
- (void)transitionWillProgressToEndState:(id)a3;
- (void)transitionWillReturnToBeginningState:(id)a3;
@end

@implementation SBHStackConfigurationInteraction

- (SBHStackConfigurationInteraction)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBHStackConfigurationInteraction;
  v15 = [(SBHStackConfigurationInteraction *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_iconView, a4);
    objc_storeWeak((id *)&v16->_iconViewProvider, v13);
    objc_storeStrong((id *)&v16->_listLayoutProvider, a6);
    v17 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v18 = [v17 widgetSettings];
    widgetSettings = v16->_widgetSettings;
    v16->_widgetSettings = (SBHWidgetSettings *)v18;

    v20 = objc_alloc_init(SBHViewControllerTransition);
    transition = v16->_transition;
    v16->_transition = v20;

    [(SBHViewControllerTransition *)v16->_transition setDelegate:v16];
  }

  return v16;
}

- (void)setPresenter:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    v5 = [(SBHStackConfigurationInteraction *)self configurationViewController];
    [v5 setPresenter:obj];
  }
}

- (void)beginConfiguration
{
  id v2 = [(SBHStackConfigurationInteraction *)self transition];
  [v2 progressToEndStateWithAnimation:1];
}

- (void)popConfiguration
{
  v3 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  id v4 = [v3 currentConfiguringIconView];

  if (v4) {
    [v4 popConfigurationCard];
  }
  else {
    [(SBHStackConfigurationInteraction *)self _endConfigurationAnimated:1];
  }
}

- (void)endConfiguration
{
  v3 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  id v4 = [v3 currentConfiguringIconView];
  [v4 dismissConfigurationCardImmediately];

  [(SBHStackConfigurationInteraction *)self _endConfigurationAnimated:1];
}

- (void)endConfigurationImmediately
{
  v3 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  id v4 = [v3 currentConfiguringIconView];
  [v4 dismissConfigurationCardImmediately];

  [(SBHStackConfigurationInteraction *)self _endConfigurationAnimated:0];
}

- (void)_endConfigurationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  [v5 willDismiss];

  v6 = [(SBHStackConfigurationInteraction *)self containerViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  id v7 = [(SBHStackConfigurationInteraction *)self transition];
  [v7 returnToBeginningStateWithAnimation:v3];
}

- (void)prepareTransition:(id)a3
{
  id v30 = a3;
  id v4 = [(SBHStackConfigurationInteraction *)self delegate];
  v5 = [v4 containerViewControllerForConfigurationInteraction:self];
  [(SBHStackConfigurationInteraction *)self setContainerViewController:v5];
  v6 = [v5 view];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v4 containerViewForConfigurationInteraction:self];

    v6 = (void *)v7;
  }
  [(SBHStackConfigurationInteraction *)self setContainerView:v6];
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [SBHStackConfigurationViewController alloc];
  v17 = [(SBHStackConfigurationInteraction *)self configuration];
  uint64_t v18 = [(SBHStackConfigurationInteraction *)self iconView];
  v19 = [(SBHStackConfigurationInteraction *)self iconViewProvider];
  v20 = [(SBHStackConfigurationInteraction *)self listLayoutProvider];
  v21 = [(SBHStackConfigurationViewController *)v16 initWithConfiguration:v17 iconView:v18 iconViewProvider:v19 listLayoutProvider:v20 showsAddButton:[(SBHStackConfigurationInteraction *)self showsAddButton] showsDoneButton:[(SBHStackConfigurationInteraction *)self showsDoneButton]];

  v22 = [(SBHStackConfigurationInteraction *)self presenter];
  [(SBHStackConfigurationViewController *)v21 setPresenter:v22];

  [(SBHStackConfigurationViewController *)v21 setDelegate:self];
  [(SBHStackConfigurationInteraction *)self setConfigurationViewController:v21];
  [(SBHStackConfigurationInteraction *)self _contentBoundingFrame];
  -[SBHStackConfigurationViewController setContentBoundingFrame:](v21, "setContentBoundingFrame:");
  objc_super v23 = [(SBHStackConfigurationInteraction *)self iconView];
  [v23 setHighlighted:0];
  [v23 setPaused:1 forReason:4];
  [v23 addObserver:self];
  v24 = [v23 effectiveIconImageStyleConfiguration];
  [(SBHStackConfigurationViewController *)v21 setOverrideIconImageStyleConfiguration:v24];
  v25 = (void *)*MEMORY[0x1E4FB2608];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __54__SBHStackConfigurationInteraction_prepareTransition___block_invoke;
  v31[3] = &unk_1E6AAC810;
  v26 = v21;
  v32 = v26;
  [v25 _performBlockAfterCATransactionCommits:v31];
  v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:self selector:sel__folderExpansionAnimationWillBegin_ name:@"SBIconZoomExpansionAnimationWillBeginNotification" object:0];
  objc_msgSend(v5, "bs_addChildViewController:withSuperview:", v26, v6);
  v28 = [(SBHStackConfigurationViewController *)v26 view];
  objc_msgSend(v28, "setFrame:", v9, v11, v13, v15);
  [v28 layoutIfNeeded];
  if ([v5 shouldAutomaticallyForwardAppearanceMethods]
    && objc_msgSend(v5, "bs_isAppearingOrAppeared")
    && ([(SBHStackConfigurationViewController *)v26 bs_isAppearingOrAppeared] & 1) == 0)
  {
    [(SBHStackConfigurationViewController *)v26 bs_endAppearanceTransition:1];
  }
  v29 = [(SBHStackConfigurationViewController *)v26 animationCoordinator];
  [v30 setUserInfo:v29];
}

uint64_t __54__SBHStackConfigurationInteraction_prepareTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOverrideIconImageStyleConfiguration:0];
}

- (id)animatorForTransition:(id)a3
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  id v4 = off_1E6AAB970;
  if (!IsReduceMotionEnabled) {
    id v4 = off_1E6AAB950;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

- (void)transitionWillProgressToEndState:(id)a3
{
  id v4 = [(SBHStackConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 configurationInteractionWillBegin:self];
  }
  id v5 = [(SBHStackConfigurationInteraction *)self appearanceDelegate];
  v6 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  [v5 stackConfigurationViewControllerWillAppear:v6];

  [(SBHStackConfigurationInteraction *)self _handleTransitionWillProgressToEndState:1];
  uint64_t v7 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_EXPAND", " enableTelemetry=YES ", v9, 2u);
  }

  double v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v8 postNotificationName:@"SBHStackConfigurationWillPresentNotification" object:self];
}

- (void)transitionDidProgressToEndState:(id)a3
{
  id v4 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_EXPAND", " enableTelemetry=YES ", v9, 2u);
  }

  id v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v5 postNotificationName:@"SBHStackConfigurationDidPresentNotification" object:self];

  v6 = [(SBHStackConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 configurationInteractionDidBegin:self];
  }
  uint64_t v7 = [(SBHStackConfigurationInteraction *)self appearanceDelegate];
  double v8 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  [v7 stackConfigurationViewControllerDidAppear:v8];
}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  id v4 = [(SBHStackConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 configurationInteractionWillEnd:self];
  }
  id v5 = [(SBHStackConfigurationInteraction *)self appearanceDelegate];
  v6 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  [v5 stackConfigurationViewControllerWillDisappear:v6];

  [(SBHStackConfigurationInteraction *)self _handleTransitionWillProgressToEndState:0];
  uint64_t v7 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_COLLAPSE", " enableTelemetry=YES ", v9, 2u);
  }

  double v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v8 postNotificationName:@"SBHStackConfigurationWillDismissNotification" object:self];
}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  id v4 = a3;
  id v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)double v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_COLLAPSE", " enableTelemetry=YES ", v15, 2u);
  }

  v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v6 postNotificationName:@"SBHStackConfigurationDidDismissNotification" object:self];

  uint64_t v7 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  double v8 = [v7 parentViewController];
  objc_msgSend(v8, "bs_removeChildViewController:", v7);

  [v4 setUserInfo:0];
  [(SBHStackConfigurationInteraction *)self setContainerView:0];
  [(SBHStackConfigurationInteraction *)self setContainerViewController:0];
  [(SBHStackConfigurationInteraction *)self setConfigurationViewController:0];
  double v9 = [(SBHStackConfigurationInteraction *)self iconView];
  [v9 setPaused:0 forReason:4];
  [v9 removeObserver:self];
  double v10 = [v9 customIconImageViewController];
  double v11 = [v10 view];

  [v11 setHidden:0];
  [v11 setAlpha:1.0];
  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 removeObserver:self name:@"SBIconZoomExpansionAnimationWillBeginNotification" object:0];
  double v13 = [(SBHStackConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 configurationInteractionDidEnd:self];
  }
  double v14 = [(SBHStackConfigurationInteraction *)self appearanceDelegate];
  [v14 stackConfigurationViewControllerDidDisappear:v7];
}

- (void)stackConfigurationViewController:(id)a3 didCommitStackConfiguration:(id)a4
{
  [(SBHStackConfigurationInteraction *)self setConfiguration:a4];
  id v5 = [(SBHStackConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 configurationInteractionDidCommit:self];
  }
}

- (BOOL)stackConfigurationViewController:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  id v5 = a4;
  v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 stackConfigurationInteraction:self allowsRemovalOfIconDataSource:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)stackConfigurationViewController:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  char v7 = [v6 stackConfigurationInteraction:self draggedIconForIdentifier:v5];

  return v7;
}

- (void)stackConfigurationViewController:(id)a3 isConsumingDropSession:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  [v6 stackConfigurationInteraction:self isConsumingDropSession:v5];
}

- (void)stackConfigurationViewController:(id)a3 didRemoveSuggestedWidgetIcon:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  [v6 stackConfigurationInteraction:self noteDidRemoveSuggestedWidgetIcon:v5];
}

- (void)stackConfigurationViewControllerRequestsPresentAddWidgetSheet:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  [v5 stackConfigurationInteraction:self requestsPresentAddWidgetSheetFromPresenter:v4];
}

- (void)stackConfigurationViewControllerWillAnimateWidgetInsertion:(id)a3
{
  id v4 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  [v4 stackConfigurationInteractionWillAnimateWidgetInsertion:self];
}

- (id)stackConfigurationViewController:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  char v7 = [v6 stackConfigurationInteraction:self dragPreviewForIconView:v5];

  return v7;
}

- (id)stackConfigurationViewController:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  double v15 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (objc_opt_respondsToSelector())
  {
    v16 = [v15 stackConfigurationInteraction:self targetedDragPreviewForIconView:v11 item:v12 session:v13 previewParameters:v14];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)windowForIconDragPreviewsForStackConfigurationViewController:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  char v7 = [v6 windowForIconDragPreviewsForStackConfigurationInteraction:self forWindowScene:v5];

  return v7;
}

- (BOOL)stackConfigurationViewController:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 stackConfigurationInteraction:self dragsSupportSystemDragsForIconView:v5];
  }
  else {
    char v7 = [v5 dragsSupportSystemDragsByDefault];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 stackConfigurationInteraction:self iconView:v12 willAnimateDragLiftWithAnimator:v9 session:v10];
  }
}

- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  id v8 = a4;
  char v7 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 stackConfigurationInteraction:self iconView:v8 dragLiftAnimationDidChangeDirection:a5];
  }
}

- (id)stackConfigurationViewController:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  id v10 = [v9 stackConfigurationInteraction:self promoteSuggestedWidget:v8 withinStack:v7];

  return v10;
}

- (double)stackConfigurationViewController:(id)a3 iconContentScaleForGridSizeClass:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  double v7 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v6 stackConfigurationInteraction:self iconContentScaleForGridSizeClass:v5];
    double v7 = v8;
  }

  return v7;
}

- (void)stackConfigurationViewControllerDoneButtonTapped:(id)a3
{
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 stackConfigurationDoneButtonTapped:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (int64_t)stackConfigurationViewControllerIconViewComponentBackgroundViewType:(id)a3
{
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    int64_t v5 = [v4 stackConfigurationInteractionIconViewComponentBackgroundViewType:self];
  }
  else {
    int64_t v5 = 4;
  }

  return v5;
}

- (void)stackConfigurationViewControllerDidReceiveUserTouch:(id)a3
{
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (v4)
  {
    int64_t v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 stackConfigurationInteractionDidReceiveUserTouch:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (BOOL)stackConfigurationViewControllerShouldDisallowLabelArea:(id)a3
{
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self stackConfigurationDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v4 stackConfigurationInteractionShouldDisallowLabelArea:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)iconViewSizeDidChange:(id)a3
{
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self transition];
  uint64_t v5 = [v4 targetEndpoint];

  if (!v5)
  {
    [(SBHStackConfigurationInteraction *)self endConfigurationImmediately];
  }
}

- (CGRect)_sourceContentFrame
{
  BOOL v3 = [(SBHStackConfigurationInteraction *)self iconView];
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self containerView];
  [v3 iconImageFrame];
  objc_msgSend(v3, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_contentBoundingFrame
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHStackConfigurationInteraction *)self delegate];
  [(SBHStackConfigurationInteraction *)self _sourceContentFrame];
  uint64_t v4 = [(SBHStackConfigurationInteraction *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  double v13 = [(SBHStackConfigurationInteraction *)self iconView];
  double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  double v16 = v12;
  CGFloat v49 = v6;
  double v50 = v10;
  CGFloat v47 = v12;
  CGFloat v48 = v8;
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (objc_opt_respondsToSelector()) {
      [v3 contentBoundingRectForConfigurationInteraction:self];
    }
    v17 = [(SBHStackConfigurationInteraction *)self listLayoutProvider];
    uint64_t v18 = [v17 layoutForIconLocation:@"SBIconLocationTodayView"];

    v19 = [v13 icon];
    v20 = [v19 gridSizeClass];

    SBHIconListLayoutIconImageInfoForGridSizeClass(v18, @"SBHIconGridSizeClassMedium");
    SBHIconListLayoutIconImageInfoForGridSizeClass(v18, v20);
    [(SBHStackConfigurationInteraction *)self _padApertureOutsetFromWidgetWithGridSize:v20];
    UIEdgeInsetsMakeWithEdges();
    [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationContentHeightRatio];
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v21 = [v13 location];
    LODWORD(v19) = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v21);

    if (v19)
    {
      uint64_t v44 = 0;
      UIRectCenteredXInRectScale();
    }
    else
    {
      [(SBHWidgetSettings *)self->_widgetSettings configurationFractionBetweenSourceAndContainerX];
      [(SBHWidgetSettings *)self->_widgetSettings configurationFractionBetweenSourceAndContainerY];
      UIRectGetCenter();
      UIRectCenteredAboutPointScale();
    }
    double v8 = v23;
    CGFloat v10 = v24;
    double v16 = v25;
    double v26 = fmax(v22, 0.0);
    if (v50 - v24 <= v26) {
      double v6 = v50 - v24;
    }
    else {
      double v6 = v26;
    }
  }
  double v45 = v12 + v16 * 0.1;
  CGFloat rect = v8;
  UIRectContainInRect();
  CGFloat x = v60.origin.x;
  CGFloat y = v60.origin.y;
  CGFloat width = v60.size.width;
  CGFloat height = v60.size.height;
  if (CGRectIsEmpty(v60))
  {
    v31 = SBLogIcon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      v61.origin.CGFloat x = v6;
      v61.origin.CGFloat y = rect;
      v61.size.CGFloat width = v10;
      v61.size.CGFloat height = v16;
      v41 = NSStringFromCGRect(v61);
      v62.origin.CGFloat x = v6;
      v62.origin.CGFloat y = -(v16 * 0.1);
      v62.size.CGFloat width = v10;
      v62.size.CGFloat height = v45;
      v42 = NSStringFromCGRect(v62);
      v63.origin.CGFloat y = v48;
      v63.origin.CGFloat x = v49;
      v63.size.CGFloat width = v50;
      v63.size.CGFloat height = v47;
      v43 = NSStringFromCGRect(v63);
      *(_DWORD *)buf = 138544130;
      v52 = v41;
      __int16 v53 = 2114;
      v54 = v42;
      __int16 v55 = 2114;
      v56 = v43;
      __int16 v57 = 2114;
      v58 = v4;
      _os_log_fault_impl(&dword_1D7F0A000, v31, OS_LOG_TYPE_FAULT, "Stack Configuration target content frame is empty with preferredContentRect(%{public}@), allowableRect(%{public}@), containerBounds(%{public}@), containerView(%{public}@).", buf, 0x2Au);
    }
    if (v13) {
      [v13 window];
    }
    else {
    v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
    }
    objc_msgSend(v32, "bounds", v44);
    CGFloat x = v33;
    CGFloat y = v34;
    CGFloat width = v35;
    CGFloat height = v36;
  }
  double v37 = x;
  double v38 = y;
  double v39 = width;
  double v40 = height;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (double)_padApertureOutsetFromWidgetWithGridSize:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  uint64_t v4 = v3;
  double v5 = 23.0;
  if (@"SBHIconGridSizeClassMedium" != v3 && (-[__CFString isEqualToString:](v3, "isEqualToString:") & 1) == 0)
  {
    if (@"SBHIconGridSizeClassLarge" == v4
      || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0
      || @"SBHIconGridSizeClassExtraLarge" == v4
      || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0
      || @"SBHIconGridSizeClassNewsLargeTall" == v4)
    {
      double v5 = 38.0;
    }
    else if (-[__CFString isEqualToString:](v4, "isEqualToString:"))
    {
      double v5 = 38.0;
    }
    else
    {
      double v5 = 15.0;
    }
  }

  return v5;
}

- (void)_handleTransitionWillProgressToEndState:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(SBHStackConfigurationInteraction *)self configurationViewController];
  double v5 = [v12 view];
  objc_msgSend(v5, "bs_setHitTestingDisabled:", v3 ^ 1);

  if (!v3)
  {
    double v6 = [v12 visiblyActiveDataSource];
    double v7 = [(SBHStackConfigurationInteraction *)self iconView];
    double v8 = v7;
    if (v6)
    {
      double v9 = [v7 icon];
      [v9 setActiveDataSource:v6];
      CGFloat v10 = [v8 customIconImageViewController];
      double v11 = [v10 view];
      [v11 layoutIfNeeded];
    }
    else
    {
      [v7 setHidden:1];
    }
  }
  [v12 setEditingIcons:v3];
}

- (SBHStackConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SBLeafIconDataSource)configuredDataSource
{
  return self->_configuredDataSource;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (SBHIconViewConfigurationInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconViewConfigurationInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHStackConfigurationInteractionDelegate)stackConfigurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackConfigurationDelegate);
  return (SBHStackConfigurationInteractionDelegate *)WeakRetained;
}

- (void)setStackConfigurationDelegate:(id)a3
{
}

- (SBHStackConfigurationViewControllerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (SBHStackConfigurationViewControllerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsAddButton
{
  return self->_showsAddButton;
}

- (void)setShowsAddButton:(BOOL)a3
{
  self->_showsAddButton = a3;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (SBHStackConfigurationViewController)configurationViewController
{
  return self->_configurationViewController;
}

- (void)setConfigurationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_destroyWeak((id *)&self->_stackConfigurationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_configuredDataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end