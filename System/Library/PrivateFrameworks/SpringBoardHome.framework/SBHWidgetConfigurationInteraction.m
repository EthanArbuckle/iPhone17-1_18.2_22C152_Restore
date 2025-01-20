@interface SBHWidgetConfigurationInteraction
- (BSInvalidatable)sourceView;
- (CGRect)_sourceContentFrame;
- (CGRect)_targetContentFrame;
- (CGRect)contentBoundingRect;
- (CGRect)sourceContentFrame;
- (CGRect)targetContentFrame;
- (CHSBaseDescriptor)descriptor;
- (INIntent)configuration;
- (MTMaterialView)backgroundView;
- (SBHIconViewConfigurationInteractionDelegate)delegate;
- (SBHViewControllerTransition)transition;
- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 gridSizeClassDomain:(id)a5 intent:(id)a6 configuredDataSource:(id)a7;
- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 intent:(id)a5 configuredDataSource:(id)a6;
- (SBHWidgetSettings)widgetSettings;
- (SBIconView)referenceView;
- (SBLeafIconDataSource)configuredDataSource;
- (UITapGestureRecognizer)tapToPresentGesture;
- (UIView)backgroundTintView;
- (UIView)containerView;
- (UIView)homeScreenContentView;
- (UIView)targetView;
- (UIView)touchBlockingView;
- (UIViewController)containerViewController;
- (WFWidgetConfigurationOptions)configurationOptions;
- (WFWidgetConfigurationViewController)configurationViewController;
- (id)animatorForTransition:(id)a3;
- (void)_endConfigurationImmediately:(BOOL)a3;
- (void)_handleTapToDismiss:(id)a3;
- (void)_handleTapToPresent:(id)a3;
- (void)_setUpMatchMoveAnimationForBackgroundView:(id)a3;
- (void)beginConfiguration;
- (void)endConfiguration;
- (void)endConfigurationImmediately;
- (void)prepareTransition:(id)a3;
- (void)setBackgroundTintView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationViewController:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContentBoundingRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeScreenContentView:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setSourceContentFrame:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setTapToPresentGesture:(id)a3;
- (void)setTargetContentFrame:(CGRect)a3;
- (void)setTouchBlockingView:(id)a3;
- (void)setTransition:(id)a3;
- (void)transitionDidProgressToEndState:(id)a3;
- (void)transitionDidReturnToBeginningState:(id)a3;
- (void)transitionWillProgressToEndState:(id)a3;
- (void)transitionWillReturnToBeginningState:(id)a3;
- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4;
@end

@implementation SBHWidgetConfigurationInteraction

- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 intent:(id)a5 configuredDataSource:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[SBHIconGridSizeClassDomain globalDomain];
  v15 = [(SBHWidgetConfigurationInteraction *)self initWithDescriptor:v13 gridSizeClass:v12 gridSizeClassDomain:v14 intent:v11 configuredDataSource:v10];

  return v15;
}

- (SBHWidgetConfigurationInteraction)initWithDescriptor:(id)a3 gridSizeClass:(id)a4 gridSizeClassDomain:(id)a5 intent:(id)a6 configuredDataSource:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)SBHWidgetConfigurationInteraction;
  v17 = [(SBHWidgetConfigurationInteraction *)&v33 init];
  if (v17)
  {
    v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v35 = v17;
      __int16 v36 = 2114;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v15;
      _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initializing configuration interaction for descriptor: %{public}@ -- intent: %@", buf, 0x20u);
    }

    v19 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v20 = [v19 widgetSettings];
    widgetSettings = v17->_widgetSettings;
    v17->_widgetSettings = (SBHWidgetSettings *)v20;

    objc_storeStrong((id *)&v17->_configuration, a6);
    objc_storeStrong((id *)&v17->_configuredDataSource, a7);
    v22 = (WFWidgetConfigurationOptions *)objc_alloc_init(MEMORY[0x1E4FB74D8]);
    configurationOptions = v17->_configurationOptions;
    v17->_configurationOptions = v22;

    [(WFWidgetConfigurationOptions *)v17->_configurationOptions setIntent:v15];
    v24 = v17->_configurationOptions;
    v25 = [v12 displayName];
    [(WFWidgetConfigurationOptions *)v24 setWidgetDisplayName:v25];

    v26 = v17->_configurationOptions;
    v27 = [v12 widgetDescription];
    [(WFWidgetConfigurationOptions *)v26 setWidgetDescription:v27];

    -[WFWidgetConfigurationOptions setWidgetConfigurationType:](v17->_configurationOptions, "setWidgetConfigurationType:", objc_msgSend(v12, "sbh_configurationType"));
    -[WFWidgetConfigurationOptions setFamily:](v17->_configurationOptions, "setFamily:", [v14 chsWidgetFamilyForIconGridSizeClass:v13]);
    uint64_t v28 = [v12 copy];
    descriptor = v17->_descriptor;
    v17->_descriptor = (CHSBaseDescriptor *)v28;

    v30 = objc_alloc_init(SBHViewControllerTransition);
    transition = v17->_transition;
    v17->_transition = v30;

    [(SBHViewControllerTransition *)v17->_transition setDelegate:v17];
  }

  return v17;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)targetView
{
  v2 = [(SBHWidgetConfigurationInteraction *)self configurationViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (void)beginConfiguration
{
  id v2 = [(SBHWidgetConfigurationInteraction *)self transition];
  [v2 progressToEndStateWithAnimation:1];
}

- (void)endConfiguration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(SBHWidgetConfigurationInteraction *)self transition];
  if (([v4 isTransitioning] & 1) == 0)
  {
    v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      int v8 = 138543618;
      v9 = self;
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ calling finishWithCurrentConfiguration", (uint8_t *)&v8, 0x16u);
    }
    v7 = [(SBHWidgetConfigurationInteraction *)self configurationViewController];
    [v7 finishWithCurrentConfiguration];
  }
  [(SBHWidgetConfigurationInteraction *)self _endConfigurationImmediately:0];
}

- (void)endConfigurationImmediately
{
}

- (void)_endConfigurationImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHWidgetConfigurationInteraction *)self transition];
  [v4 returnToBeginningStateWithAnimation:!v3];
}

- (void)prepareTransition:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 setUserInfo:self];
  id v6 = objc_alloc(MEMORY[0x1E4FB74E0]);
  v7 = [(SBHWidgetConfigurationInteraction *)self configurationOptions];
  int v8 = (void *)[v6 initWithOptions:v7];

  v9 = [(SBHWidgetConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setOverrideUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyleForConfigurationInteraction:", self));
  }
  [v8 setDelegate:self];
  [(SBHWidgetConfigurationInteraction *)self setConfigurationViewController:v8];
  __int16 v10 = [v9 containerViewControllerForConfigurationInteraction:self];
  [(SBHWidgetConfigurationInteraction *)self setContainerViewController:v10];
  id v11 = [v10 view];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v9 containerViewForConfigurationInteraction:self];

    id v11 = (void *)v12;
  }
  [(SBHWidgetConfigurationInteraction *)self setContainerView:v11];
  id v13 = [v9 sourceIconViewForConfigurationInteraction:self];
  [(SBHWidgetConfigurationInteraction *)self setSourceView:v13];
  if (v10 && v11 && v13)
  {
    if (objc_opt_respondsToSelector())
    {
      id v14 = [v9 referenceIconViewForConfigurationInteraction:self];
      [(SBHWidgetConfigurationInteraction *)self setReferenceView:v14];
      [v14 setHighlighted:0];
    }
    if (objc_opt_respondsToSelector())
    {
      id v15 = [v9 homeScreenContentViewForConfigurationInteraction:self];
      [(SBHWidgetConfigurationInteraction *)self setHomeScreenContentView:v15];
    }
    [v13 setUserInteractionEnabled:1];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapToPresent_];
    [(SBHWidgetConfigurationInteraction *)self setTapToPresentGesture:v16];
    [v13 addGestureRecognizer:v16];
    [v11 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    char v25 = objc_opt_respondsToSelector();
    double v26 = v24;
    double v27 = v22;
    double v28 = v20;
    double v29 = v18;
    if (v25) {
      objc_msgSend(v9, "contentBoundingRectForConfigurationInteraction:", self, v18, v20, v22, v24);
    }
    -[SBHWidgetConfigurationInteraction setContentBoundingRect:](self, "setContentBoundingRect:", v29, v28, v27, v26);
    v30 = [(SBHWidgetConfigurationInteraction *)self widgetSettings];
    v63 = (void *)v16;
    id v64 = v5;
    if ([v30 configurationBlursBackground])
    {
      v31 = (void *)MEMORY[0x1E4F743C8];
      v32 = v30;
      objc_super v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = [v31 materialViewWithRecipeNamed:@"widgetConfigurationBackground" inBundle:v33 options:0 initialWeighting:0 scaleAdjustment:0.0];

      v30 = v32;
      objc_msgSend(v34, "setFrame:", v18, v20, v22, v24);
      [v34 setAutoresizingMask:18];
      [v34 setGroupNameBase:@"Widget-Configuration"];
      [v11 addSubview:v34];
      [(SBHWidgetConfigurationInteraction *)self setBackgroundView:v34];
      [(SBHWidgetConfigurationInteraction *)self _setUpMatchMoveAnimationForBackgroundView:v34];
    }
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v18, v20, v22, v24);
    [v35 setAutoresizingMask:18];
    objc_msgSend(v35, "bs_setHitTestingDisabled:", 1);
    [v30 configurationDarkeningTintAlpha];
    v61 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v36];
    objc_msgSend(v35, "setBackgroundColor:");
    [v35 setAlpha:0.0];
    v62 = v30;
    [v30 configurationWidgetTintColorAlpha];
    double v38 = v37;
    if (BSFloatGreaterThanFloat())
    {
      id v39 = [(SBHWidgetConfigurationInteraction *)self descriptor];
      uint64_t v40 = objc_opt_class();
      id v41 = v39;
      if (v40)
      {
        if (objc_opt_isKindOfClass()) {
          v42 = v41;
        }
        else {
          v42 = 0;
        }
      }
      else
      {
        v42 = 0;
      }
      id v44 = v42;

      v45 = [v44 backgroundColor];

      if (v45)
      {
        v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v18, v20, v22, v24);
        [v46 setAutoresizingMask:18];
        v47 = [v45 colorWithAlphaComponent:v38];
        [v46 setBackgroundColor:v47];

        [v35 addSubview:v46];
      }
    }
    [v11 addSubview:v35];
    [(SBHWidgetConfigurationInteraction *)self setBackgroundTintView:v35];
    [(SBHWidgetConfigurationInteraction *)self _setUpMatchMoveAnimationForBackgroundView:v35];
    v48 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapToDismiss_];
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v18, v20, v22, v24);
    [v49 addGestureRecognizer:v48];
    [(SBHWidgetConfigurationInteraction *)self setTouchBlockingView:v49];
    [v11 addSubview:v49];
    objc_msgSend(v10, "bs_addChildViewController:withSuperview:", v8, v11);
    v50 = [v8 view];
    objc_msgSend(v50, "setFrame:", v18, v20, v22, v24);
    [(SBHWidgetConfigurationInteraction *)self _sourceContentFrame];
    -[SBHWidgetConfigurationInteraction setSourceContentFrame:](self, "setSourceContentFrame:");
    [(SBHWidgetConfigurationInteraction *)self _targetContentFrame];
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    -[SBHWidgetConfigurationInteraction setTargetContentFrame:](self, "setTargetContentFrame:");
    v59 = [v8 configurationView];
    objc_msgSend(v59, "setOverridingCardViewFrame:", v52, v54, v56, v58);

    id v5 = v64;
  }
  else
  {
    v43 = SBLogIcon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v60 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544386;
      v66 = self;
      __int16 v67 = 2114;
      v68 = v60;
      __int16 v69 = 2114;
      v70 = v10;
      __int16 v71 = 2114;
      v72 = v11;
      __int16 v73 = 2114;
      v74 = v13;
      _os_log_error_impl(&dword_1D7F0A000, v43, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ failed to create a new presentation for container view controller: %{public}@ -- container view: %{public}@ -- source view: %{public}@", buf, 0x34u);
    }
    [v5 returnToBeginningStateWithAnimation:0];
  }
}

- (id)animatorForTransition:(id)a3
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  id v4 = off_1E6AABA40;
  if (!IsReduceMotionEnabled) {
    id v4 = off_1E6AABA48;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

- (void)transitionWillProgressToEndState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    __int16 v10 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [(SBHWidgetConfigurationInteraction *)self touchBlockingView];
  [v5 setHidden:0];

  id v6 = [(SBHWidgetConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 configurationInteractionWillBegin:self];
  }
  v7 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_PRESENT", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  int v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v8 postNotificationName:@"SBHWidgetConfigurationWillPresentNotification" object:self];
}

- (void)transitionDidProgressToEndState:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    int v9 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presentation finished", (uint8_t *)&v8, 0xCu);
  }

  id v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_PRESENT", " enableTelemetry=YES ", (uint8_t *)&v8, 2u);
  }

  id v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v6 postNotificationName:@"SBHWidgetConfigurationDidPresentNotification" object:self];

  v7 = [(SBHWidgetConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 configurationInteractionDidBegin:self];
  }
}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [(SBHWidgetConfigurationInteraction *)self touchBlockingView];
  [v5 setHidden:1];

  id v6 = [(SBHWidgetConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 configurationInteractionWillEnd:self];
  }
  v7 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_DISMISS", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  int v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v8 postNotificationName:@"SBHWidgetConfigurationWillDismissNotification" object:self];
}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    double v24 = self;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissal finished", (uint8_t *)&v23, 0xCu);
  }

  id v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_CONFIG_DISMISS", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v7 postNotificationName:@"SBHWidgetConfigurationDidDismissNotification" object:self];

  [v4 setUserInfo:0];
  int v8 = [(SBHWidgetConfigurationInteraction *)self backgroundView];
  [v8 removeFromSuperview];

  int v9 = [(SBHWidgetConfigurationInteraction *)self backgroundTintView];
  [v9 removeFromSuperview];

  [(SBHWidgetConfigurationInteraction *)self setContainerView:0];
  uint64_t v10 = [(SBHWidgetConfigurationInteraction *)self containerViewController];
  uint64_t v11 = [(SBHWidgetConfigurationInteraction *)self configurationViewController];
  objc_msgSend(v10, "bs_removeChildViewController:", v11);

  [(SBHWidgetConfigurationInteraction *)self setContainerViewController:0];
  [(SBHWidgetConfigurationInteraction *)self setConfigurationViewController:0];
  [(SBHWidgetConfigurationInteraction *)self setHomeScreenContentView:0];
  uint64_t v12 = [(SBHWidgetConfigurationInteraction *)self sourceView];
  id v13 = [(SBHWidgetConfigurationInteraction *)self tapToPresentGesture];
  [v12 removeGestureRecognizer:v13];

  [v12 invalidate];
  [(SBHWidgetConfigurationInteraction *)self setSourceView:0];
  [(SBHWidgetConfigurationInteraction *)self setTapToPresentGesture:0];
  id v14 = [(SBHWidgetConfigurationInteraction *)self referenceView];
  id v15 = [v14 customIconImageViewController];
  uint64_t v16 = [v15 view];
  [v16 setHidden:0];

  [v14 setIconLabelAlpha:1.0];
  [v14 setAlpha:1.0];
  [v14 setHidden:0];
  [(SBHWidgetConfigurationInteraction *)self setReferenceView:0];
  [(SBHWidgetConfigurationInteraction *)self setBackgroundView:0];
  [(SBHWidgetConfigurationInteraction *)self setBackgroundTintView:0];
  double v17 = [(SBHWidgetConfigurationInteraction *)self touchBlockingView];
  [v17 removeFromSuperview];

  [(SBHWidgetConfigurationInteraction *)self setTouchBlockingView:0];
  double v18 = *MEMORY[0x1E4F1DB28];
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  -[SBHWidgetConfigurationInteraction setSourceContentFrame:](self, "setSourceContentFrame:", *MEMORY[0x1E4F1DB28], v19, v20, v21);
  -[SBHWidgetConfigurationInteraction setTargetContentFrame:](self, "setTargetContentFrame:", v18, v19, v20, v21);
  -[SBHWidgetConfigurationInteraction setContentBoundingRect:](self, "setContentBoundingRect:", v18, v19, v20, v21);
  double v22 = [(SBHWidgetConfigurationInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v22 configurationInteractionDidEnd:self];
  }
}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SBHWidgetConfigurationInteraction *)self configurationViewController];
  uint64_t v10 = [(SBHWidgetConfigurationInteraction *)self configuration];
  uint64_t v11 = v10;
  if (v9 == v7)
  {
    uint64_t v15 = [v10 _indexingHash];
    uint64_t v16 = [v8 _indexingHash];
    uint64_t v12 = SBLogIcon();
    BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v15 == v16)
    {
      if (v17)
      {
        id v13 = NSStringFromSelector(a2);
        int v19 = 138544130;
        double v20 = self;
        __int16 v21 = 2114;
        double v22 = v13;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v11;
        id v14 = "[%{public}@]: %{public}@ is ignoring new intent: %@ -- equivalent to old intent: %@";
        goto LABEL_7;
      }
    }
    else
    {
      if (v17)
      {
        double v18 = NSStringFromSelector(a2);
        int v19 = 138543874;
        double v20 = self;
        __int16 v21 = 2114;
        double v22 = v18;
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is committing new intent: %@", (uint8_t *)&v19, 0x20u);
      }
      [(SBHWidgetConfigurationInteraction *)self setConfiguration:v8];
      uint64_t v12 = [(SBHWidgetConfigurationInteraction *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v12 configurationInteractionDidCommit:self];
      }
    }
  }
  else
  {
    uint64_t v12 = SBLogIcon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSStringFromSelector(a2);
      int v19 = 138544130;
      double v20 = self;
      __int16 v21 = 2114;
      double v22 = v13;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = v7;
      id v14 = "[%{public}@]: %{public}@ is ignoring new intent: %@ -- for unexpected view controller: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x2Au);
    }
  }

  [(SBHWidgetConfigurationInteraction *)self _endConfigurationImmediately:0];
}

- (void)_handleTapToPresent:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting due to user tap", (uint8_t *)&v5, 0xCu);
  }

  [(SBHWidgetConfigurationInteraction *)self beginConfiguration];
}

- (void)_handleTapToDismiss:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing due to user tap", (uint8_t *)&v5, 0xCu);
  }

  [(SBHWidgetConfigurationInteraction *)self _endConfigurationImmediately:0];
}

- (CGRect)_sourceContentFrame
{
  BOOL v3 = [(SBHWidgetConfigurationInteraction *)self referenceView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBHWidgetConfigurationInteraction *)self sourceView];
  }
  id v6 = v5;

  [v6 iconImageFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(SBHWidgetConfigurationInteraction *)self containerView];
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_targetContentFrame
{
  BOOL v3 = [(SBHWidgetConfigurationInteraction *)self widgetSettings];
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  uint64_t v52 = v5;

  [(SBHWidgetConfigurationInteraction *)self contentBoundingRect];
  double v54 = v6;
  if (([v3 configurationMaximizesCardHeight] & 1) == 0)
  {
    double v7 = [(SBHWidgetConfigurationInteraction *)self configurationViewController];
    [v7 preferredContentSize];
    BSRectWithSize();
  }
  [(SBHWidgetConfigurationInteraction *)self sourceContentFrame];
  UIRectGetCenter();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_5:
      UIRectGetCenter();
      goto LABEL_10;
    }
  }
  else
  {
    double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 != 1) {
      goto LABEL_5;
    }
  }
  UIRectCenteredAboutPointScale();
  double v10 = [(SBHWidgetConfigurationInteraction *)self sourceView];
  double v11 = [v10 location];
  int v12 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v11);

  if (v12)
  {
    uint64_t v51 = v52;
    UIRectCenteredXInRectScale();
    goto LABEL_11;
  }
  [(SBHWidgetSettings *)self->_widgetSettings configurationFractionBetweenSourceAndContainerX];
  [(SBHWidgetSettings *)self->_widgetSettings configurationFractionBetweenSourceAndContainerY];
  UIRectGetCenter();
LABEL_10:
  UIRectCenteredAboutPointScale();
LABEL_11:
  CGFloat rect = v13;
  CGFloat rect_8 = v14;
  CGFloat v17 = v15;
  double v18 = v16;
  double v19 = [(SBHWidgetConfigurationInteraction *)self containerView];
  [v19 bounds];
  double v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;

  CGFloat v53 = v21;
  if ([v3 configurationUsesPercentVerticalMargin])
  {
    double v28 = [(SBHWidgetConfigurationInteraction *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v28 verticalMarginPercentageForConfigurationInteraction:self];
    }
    if (BSFloatLessThanFloat()) {
      [v3 configurationPercentVerticalMargin];
    }
    UICeilToScale();
    double v30 = v29;
  }
  else
  {
    [v3 configurationAbsoluteVerticalMargin];
    double v30 = v31;
  }
  if (v54 <= v27 - v30 - v30) {
    double v32 = v54;
  }
  else {
    double v32 = v27 - v30 - v30;
  }
  if ([v3 configurationEnforcesMaxCardHeight])
  {
    [v3 configurationMaxCardHeight];
    if (v32 > v33) {
      double v32 = v33;
    }
  }
  CGFloat v34 = rect;
  if (v18 > v32) {
    double v18 = v32;
  }
  CGFloat v35 = rect_8;
  CGFloat v36 = v17;
  double v37 = v18;
  double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
  v57.origin.x = v53;
  v57.origin.y = v23;
  v57.size.width = v25;
  v57.size.height = v27;
  if (MaxX > CGRectGetWidth(v57))
  {
    v58.origin.x = v53;
    v58.origin.y = v23;
    v58.size.width = v25;
    v58.size.height = v27;
    CGRectGetWidth(v58);
    v59.origin.x = rect;
    v59.origin.y = rect_8;
    v59.size.width = v17;
    v59.size.height = v18;
    CGRectGetWidth(v59);
  }
  UIRectContainInRect();
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = v40;
  double v48 = v42;
  double v49 = v44;
  double v50 = v46;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (void)_setUpMatchMoveAnimationForBackgroundView:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FA5E88];
  id v5 = a3;
  double v6 = [(SBHWidgetConfigurationInteraction *)self containerView];
  double v7 = [v6 window];
  id v8 = [v4 matchMoveAnimationForPinningToView:v7];

  [v5 addAnimation:v8 forKey:@"SBHWidgetConfigurationBackgroundMatchMoveAnimation"];
}

- (INIntent)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SBHIconViewConfigurationInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconViewConfigurationInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBLeafIconDataSource)configuredDataSource
{
  return self->_configuredDataSource;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (WFWidgetConfigurationOptions)configurationOptions
{
  return self->_configurationOptions;
}

- (WFWidgetConfigurationViewController)configurationViewController
{
  return self->_configurationViewController;
}

- (void)setConfigurationViewController:(id)a3
{
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (void)setContainerView:(id)a3
{
}

- (CGRect)sourceContentFrame
{
  double x = self->_sourceContentFrame.origin.x;
  double y = self->_sourceContentFrame.origin.y;
  double width = self->_sourceContentFrame.size.width;
  double height = self->_sourceContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (CGRect)targetContentFrame
{
  double x = self->_targetContentFrame.origin.x;
  double y = self->_targetContentFrame.origin.y;
  double width = self->_targetContentFrame.size.width;
  double height = self->_targetContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentFrame:(CGRect)a3
{
  self->_targetContentFrame = a3;
}

- (CGRect)contentBoundingRect
{
  double x = self->_contentBoundingRect.origin.x;
  double y = self->_contentBoundingRect.origin.y;
  double width = self->_contentBoundingRect.size.width;
  double height = self->_contentBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBoundingRect:(CGRect)a3
{
  self->_contentBoundingRect = a3;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (void)setHomeScreenContentView:(id)a3
{
}

- (BSInvalidatable)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (SBIconView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (void)setBackgroundTintView:(id)a3
{
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
}

- (UITapGestureRecognizer)tapToPresentGesture
{
  return self->_tapToPresentGesture;
}

- (void)setTapToPresentGesture:(id)a3
{
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
}

- (CHSBaseDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_tapToPresentGesture, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_configuredDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end