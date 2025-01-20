@interface UIStatusBar_Base
+ (CGRect)_frameInSceneReferenceSpaceForStyle:(int64_t)a3 orientation:(int64_t)a4 inSceneWithReferenceSize:(CGSize)a5;
+ (Class)_implementationClass;
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6;
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7;
+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4;
+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4;
+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5;
+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5 isAzulBLinked:(BOOL)a6;
+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4;
+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5;
+ (void)_setImplementationClass:(Class)a3;
- ($76E1ED2313895B0F0548B88023B5EA95)localDataOverrides;
- (BOOL)_canShowInOrientation:(int64_t)a3;
- (BOOL)_isTransparent;
- (BOOL)_rectIntersectsTimeItem:(CGRect)a3;
- (BOOL)_shouldSeekHigherPriorityTouchTarget;
- (BOOL)_usesModernBar;
- (BOOL)disablesRasterization;
- (BOOL)foreground;
- (BOOL)hidden;
- (BOOL)homeItemsDisabled;
- (BOOL)isDoubleHeight;
- (BOOL)isHidden;
- (BOOL)isTranslucent;
- (BOOL)persistentAnimationsEnabled;
- (BOOL)registered;
- (BOOL)serverUpdatesDisabled;
- (BOOL)showsContentsOnScreen;
- (BOOL)suppressesHiddenSideEffects;
- (CGAffineTransform)_hiddenTransformForHideAnimationParameters:(SEL)a3;
- (CGRect)avoidanceFrame;
- (CGRect)currentFrame;
- (CGRect)frameForOrientation:(int64_t)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)disabledPartIdentifiers;
- (NSArray)enabledPartIdentifiers;
- (UIColor)foregroundColor;
- (UIFont)clockFont;
- (UIOffset)offsetForPartWithIdentifier:(id)a3;
- (UIStatusBarCarPlayDockDataProviding)dockDataProvider;
- (UIStatusBarManager)manager;
- (UIStatusBarServer)statusBarServer;
- (UIStatusBarStateProvider)inProcessStateProvider;
- (UIStatusBarStyleDelegate)styleDelegate;
- (UIStatusBarStyleRequest)styleRequest;
- (UIStatusBarWindow)statusBarWindow;
- (UIStatusBar_Base)initWithFrame:(CGRect)a3;
- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4;
- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 inProcessStateProvider:(id)a5;
- (UIView)sensorActivityIndicator;
- (UIViewControllerTransitionCoordinator)_transitionCoordinator;
- (double)_hiddenAlphaForHideAnimationParameters:(id)a3;
- (double)alphaForPartWithIdentifier:(id)a3;
- (double)currentHeight;
- (double)defaultDoubleHeight;
- (double)defaultHeight;
- (double)heightForOrientation:(int64_t)a3;
- (double)heightForOrientation:(int64_t)a3 isAzulBLinked:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)activeTintColor;
- (int64_t)_requestStyle;
- (int64_t)currentStyle;
- (int64_t)legibilityStyle;
- (int64_t)mode;
- (int64_t)orientation;
- (int64_t)styleForRequestedStyle:(int64_t)a3;
- (unint64_t)activeStyleOverride;
- (unint64_t)styleOverrides;
- (void)_didEnterBackground:(id)a3;
- (void)_evaluateServerRegistration;
- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5;
- (void)_performAnimations:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3;
- (void)_setDisablesRasterization:(BOOL)a3;
- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)_setRequestedStyle:(int64_t)a3;
- (void)_styleOverridesDidChange:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)dealloc;
- (void)forceUpdateStyleOverrides:(BOOL)a3;
- (void)requestStyle:(int64_t)a3;
- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4 forced:(BOOL)a5;
- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4 forced:(BOOL)a5;
- (void)requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (void)setActiveStyleOverride:(unint64_t)a3;
- (void)setAlpha:(double)a3;
- (void)setAvoidanceFrame:(CGRect)a3;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 isInteractive:(BOOL)a5;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5;
- (void)setDisabledPartIdentifiers:(id)a3;
- (void)setDockDataProvider:(id)a3;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundColor:(id)a3 animationParameters:(id)a4;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHomeItemsDisabled:(BOOL)a3;
- (void)setInProcessStateProvider:(id)a3;
- (void)setLegibilityStyle:(int64_t)a3;
- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)setLocalDataOverrides:(id *)a3;
- (void)setManager:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPersistentAnimationsEnabled:(BOOL)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setSensorActivityIndicator:(id)a3;
- (void)setServerUpdatesDisabled:(BOOL)a3;
- (void)setStatusBarServer:(id)a3;
- (void)setStyleDelegate:(id)a3;
- (void)setStyleRequest:(id)a3;
- (void)setStyleRequest:(id)a3 animationParameters:(id)a4;
- (void)setSuppressesHiddenSideEffects:(BOOL)a3;
- (void)set_transitionCoordinator:(id)a3;
- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4;
@end

@implementation UIStatusBar_Base

- (void)setStyleRequest:(id)a3
{
}

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5 isAzulBLinked:(BOOL)a6
{
  [a1 _heightForStyle:a3 orientation:a4 forStatusBarFrame:0 inWindow:a5 isAzulBLinked:a6];
  return result;
}

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5
{
  [a1 heightForStyle:a3 orientation:a4 inWindow:a5 isAzulBLinked:1];
  return result;
}

- (double)heightForOrientation:(int64_t)a3 isAzulBLinked:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_opt_class();
  [v6 heightForStyle:0 orientation:a3 inWindow:0 isAzulBLinked:v4];
  return result;
}

- (double)heightForOrientation:(int64_t)a3
{
  [(UIStatusBar_Base *)self heightForOrientation:a3 isAzulBLinked:1];
  return result;
}

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4
{
  [a1 heightForStyle:a3 orientation:a4 inWindow:0];
  return result;
}

- (void)setActiveStyleOverride:(unint64_t)a3
{
  self->_activeStyleOverride = a3;
}

- (unint64_t)activeStyleOverride
{
  return self->_activeStyleOverride;
}

- (int64_t)styleForRequestedStyle:(int64_t)a3
{
  int64_t v4 = 0;
  [(UIStatusBar_Base *)self _getStyle:&v4 andActiveOverride:0 forRequestedStyle:a3];
  return v4;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (UIStatusBarStyleDelegate)styleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleDelegate);
  return (UIStatusBarStyleDelegate *)WeakRetained;
}

- (void)setHidden:(BOOL)a3
{
}

- (UIStatusBarStyleRequest)styleRequest
{
  return self->_styleRequest;
}

+ (Class)_implementationClass
{
  id v2 = (id)_MergedGlobals_7_6;
  if (!_MergedGlobals_7_6)
  {
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v7 = 0;
      v8 = &v7;
      uint64_t v9 = 0x2050000000;
      v3 = (void *)qword_1EB25D588;
      uint64_t v10 = qword_1EB25D588;
      if (!qword_1EB25D588)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __getSTUIStatusBar_WrapperClass_block_invoke;
        v6[3] = &unk_1E52D9900;
        v6[4] = &v7;
        __getSTUIStatusBar_WrapperClass_block_invoke((uint64_t)v6);
        v3 = (void *)v8[3];
      }
      id v4 = v3;
      _Block_object_dispose(&v7, 8);
    }
    else
    {
      id v4 = (id)objc_opt_class();
    }
    id v2 = v4;
    _MergedGlobals_7_6 = (uint64_t)v2;
  }
  return (Class)v2;
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  self->_avoidanceFrame = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4) {
    v6 = [[UIStatusBarHideAnimationParameters alloc] initWithDefaultParameters];
  }
  else {
    v6 = 0;
  }
  uint64_t v7 = v6;
  [(UIStatusBar_Base *)self setHidden:v4 animationParameters:v6];
}

- (void)_performAnimations:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(UIStatusBar_Base *)self _transitionCoordinator];

  if (v12)
  {
    v13 = (id *)&xmmword_186B92000;
    if (v9)
    {
      v14 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke;
      v21[3] = &unk_1E52DA110;
      v5 = &v22;
      id v22 = v9;
    }
    else
    {
      v14 = 0;
    }
    v15 = _Block_copy(v14);
    if (v11)
    {
      v16 = v19;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke_2;
      v19[3] = &unk_1E52DA110;
      v13 = &v20;
      id v20 = v11;
    }
    else
    {
      v16 = 0;
    }
    v17 = _Block_copy(v16);
    v18 = [(UIStatusBar_Base *)self _transitionCoordinator];
    [v18 animateAlongsideTransitionInView:self animation:v15 completion:v17];

    if (v11) {
    if (v9)
    }
  }
  else
  {
    +[UIStatusBarAnimationParameters animateWithParameters:v10 fromCurrentState:1 animations:v9 completion:v11];
  }
}

- (UIViewControllerTransitionCoordinator)_transitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__transitionCoordinator);
  return (UIViewControllerTransitionCoordinator *)WeakRetained;
}

- (void)setAlpha:(double)a3
{
  uint64_t v5 = [(UIStatusBar_Base *)self manager];
  if (!v5
    || (v6 = (void *)v5,
        [(UIStatusBar_Base *)self manager],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 statusBar:self shouldSetAlpha:a3],
        v7,
        v6,
        v8))
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBar_Base;
    [(UIView *)&v9 setAlpha:a3];
  }
}

- (UIStatusBarManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (UIStatusBarManager *)WeakRetained;
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  id v5 = a3;
  self->_requestedStyle = [v5 style];
  v6 = [v5 foregroundColor];
  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = v6;

  int64_t v8 = [v5 legibilityStyle];
  self->_legibilityStyle = v8;
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4
{
  return -[UIStatusBar_Base initWithFrame:showForegroundView:inProcessStateProvider:](self, "initWithFrame:showForegroundView:inProcessStateProvider:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3
{
  return -[UIStatusBar_Base initWithFrame:showForegroundView:](self, "initWithFrame:showForegroundView:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStyleDelegate:(id)a3
{
}

- (void)setLegibilityStyle:(int64_t)a3
{
}

- (void)setForegroundColor:(id)a3
{
}

- (double)currentHeight
{
  int64_t v3 = [(UIStatusBar_Base *)self orientation];
  [(UIStatusBar_Base *)self heightForOrientation:v3];
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setManager:(id)a3
{
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  self->_legibilityStyle = a3;
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
}

- (void)_evaluateServerRegistration
{
  if (self->_statusBarServer)
  {
    int64_t v3 = [(UIView *)self superview];
    if (self->_hidden && !self->_suppressesHiddenSideEffects || (self->_foreground ? (BOOL v4 = v3 == 0) : (BOOL v4 = 1), v4))
    {
      int v5 = 0;
    }
    else
    {
      id v7 = v3;
      int v5 = ![(UIStatusBar_Base *)self serverUpdatesDisabled];
      int64_t v3 = v7;
    }
    if (self->_registered != v5)
    {
      id v8 = v3;
      -[UIStatusBar_Base setRegistered:](self, "setRegistered:");
      statusBarServer = self->_statusBarServer;
      if (self->_registered)
      {
        [(UIStatusBarServer *)statusBarServer setStatusBar:self];
        [(UIStatusBar_Base *)self forceUpdateData:0];
        [(UIStatusBar_Base *)self forceUpdateStyleOverrides:0];
        [(UIStatusBar_Base *)self forceUpdateDoubleHeightStatus];
        [(UIStatusBar_Base *)self forgetEitherSideHistory];
      }
      else
      {
        [(UIStatusBarServer *)statusBarServer setStatusBar:0];
      }
      int64_t v3 = v8;
    }
  }
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)serverUpdatesDisabled
{
  return self->_serverUpdatesDisabled;
}

- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    id v8 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
  }
  else {
    id v8 = 0;
  }
  objc_super v9 = v8;
  [(UIStatusBar_Base *)self requestStyle:a3 animationParameters:v8 forced:v5];
}

- (void)requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  [(UIStatusBar_Base *)self _setRequestedStyle:a3];
  [(UIStatusBar_Base *)self _requestStyle:a3 partStyles:v11 animationParameters:v10 forced:v6];
}

- (void)_setRequestedStyle:(int64_t)a3
{
  self->_requestedStyle = a3;
}

- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4 forced:(BOOL)a5
{
}

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBar_Base;
  v14 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14->_persistentAnimationsEnabled = 1;
  v14->_requestedStyle = -1;
  v14->_foreground = [(id)UIApp applicationState] != 2;
  objc_storeStrong((id *)&v14->_inProcessStateProvider, a6);
  if (v13)
  {
    [v13 addStatusBarStateObserver:v14];
  }
  else if (v7)
  {
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v14 selector:sel__didEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:UIApp];
    [v15 addObserver:v14 selector:sel__willEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:UIApp];
    [v15 addObserver:v14 selector:sel__styleOverridesDidChange_ name:0x1ED16A160 object:0];
    v14->_styleOverrides = +[UIStatusBarServer getStyleOverrides];
    v16 = [[UIStatusBarServer alloc] initWithStatusBar:0];
    statusBarServer = v14->_statusBarServer;
    v14->_statusBarServer = v16;
  }
  return v14;
}

- (void)forceUpdateStyleOverrides:(BOOL)a3
{
  BOOL v3 = a3;
  self->_styleOverrides = +[UIStatusBarServer getStyleOverrides];
  int64_t v5 = [(UIStatusBar_Base *)self _requestStyle];
  [(UIStatusBar_Base *)self requestStyle:v5 animated:v3 forced:1];
}

- (int64_t)_requestStyle
{
  return self->_requestedStyle;
}

- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_hidden != v4)
  {
    self->_hidden = v4;
    [(UIStatusBar_Base *)self _evaluateServerRegistration];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    [(UIStatusBar_Base *)self _hiddenTransformForHideAnimationParameters:v6];
    [(UIStatusBar_Base *)self _hiddenAlphaForHideAnimationParameters:v6];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke;
    aBlock[3] = &unk_1E5307FE0;
    aBlock[4] = self;
    aBlock[5] = v7;
    long long v17 = v20;
    long long v18 = v21;
    long long v19 = v22;
    id v8 = _Block_copy(aBlock);
    if ([v6 shouldAnimate] && !v4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_2;
      v14[3] = &unk_1E52DA040;
      id v15 = v8;
      +[UIView performWithoutAnimation:v14];
    }
    v10[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_3;
    v11[3] = &unk_1E52E7D78;
    id v12 = v8;
    BOOL v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_4;
    v10[3] = &unk_1E52DC3A0;
    id v9 = v8;
    +[UIStatusBarAnimationParameters animateWithParameters:v6 animations:v11 completion:v10];
  }
}

- (CGAffineTransform)_hiddenTransformForHideAnimationParameters:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v7 + 32);
  id v19 = v6;
  int v9 = [v6 hideAnimation];
  if (v9 == 3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass"), "_defaultStatusBarSceneReferenceBounds");
    double v15 = v14;
    double v17 = v16;
    if ((unint64_t)([(UIStatusBar_Base *)self orientation] - 1) >= 2) {
      double v13 = v15;
    }
    else {
      double v13 = v17;
    }
  }
  else
  {
    if (v9 != 2) {
      goto LABEL_8;
    }
    [(UIStatusBar_Base *)self currentHeight];
    double v11 = v10;
    [v19 additionalSlideHeight];
    double v13 = -(v11 + v12);
  }
  CGAffineTransformMakeTranslation(retstr, 0.0, v13);
LABEL_8:

  return result;
}

- (double)_hiddenAlphaForHideAnimationParameters:(id)a3
{
  int v3 = [a3 hideAnimation];
  double result = 0.0;
  if ((v3 & 0xFFFFFFFE) == 2) {
    return 1.0;
  }
  return result;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 inProcessStateProvider:(id)a5
{
  BOOL v5 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  if (v11 || v12 != v13)
  {
    double v14 = (UIStatusBar_Base *)-[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](self, "_initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:", v5, 1, v11, x, y, width, height);
    self = v14;
  }
  else
  {
    double v14 = (UIStatusBar_Base *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_implementationClass")), "_initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:", v5, 1, 0, x, y, width, height);
  }
  double v15 = v14;

  return v15;
}

- ($76E1ED2313895B0F0548B88023B5EA95)localDataOverrides
{
  return self->_localDataOverrides;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4
{
  return [a1 _defaultStyleForRequestedStyle:a3 styleOverrides:a4 activeStyleOverride:0];
}

- (unint64_t)styleOverrides
{
  return self->_styleOverrides;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)_setDisablesRasterization:(BOOL)a3
{
  self->_disablesRasterization = a3;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  if ((unint64_t)(a3 - 108) < 2 || a3 == 306)
  {
    if ((a4 & 0x20000000) != 0)
    {
      unint64_t v6 = 0x20000000;
      int64_t result = 1017;
      goto LABEL_132;
    }
    if ((a4 & 0x800000000) != 0)
    {
      unint64_t v6 = 0x800000000;
      int64_t result = 1018;
      goto LABEL_132;
    }
    if ((a4 & 0x2000) != 0)
    {
      unint64_t v6 = 0x2000;
      int64_t result = 1003;
      goto LABEL_132;
    }
    if ((a4 & 0x100000) != 0)
    {
      unint64_t v6 = 0x100000;
      int64_t result = 1016;
      goto LABEL_132;
    }
    if ((a4 & 0x10000000) != 0)
    {
      unint64_t v6 = 0x10000000;
      int64_t result = 1010;
      goto LABEL_132;
    }
    if ((a4 & 0x8000000) != 0)
    {
      unint64_t v6 = 0x8000000;
      int64_t result = 1011;
      goto LABEL_132;
    }
    if ((a4 & 0x10) != 0)
    {
      unint64_t v6 = 16;
      int64_t result = 1012;
      goto LABEL_132;
    }
    if (a4)
    {
      unint64_t v6 = 1;
      int64_t result = 1013;
      goto LABEL_132;
    }
    if ((a4 & 0x1000000000) != 0)
    {
      unint64_t v6 = 0x1000000000;
      int64_t result = 1023;
      goto LABEL_132;
    }
    if ((a4 & 0x4000000000) != 0)
    {
      unint64_t v6 = 0x4000000000;
      int64_t result = 1026;
      goto LABEL_132;
    }
    if ((a4 & 0x8000000000) != 0)
    {
      unint64_t v6 = 0x8000000000;
      int64_t result = 1025;
      goto LABEL_132;
    }
    if ((a4 & 0x80000) != 0)
    {
      unint64_t v6 = 0x80000;
      int64_t result = 1014;
      goto LABEL_132;
    }
    if ((a4 & 0x40000) != 0)
    {
      unint64_t v6 = 0x40000;
      int64_t result = 1015;
      goto LABEL_132;
    }
    if ((a4 & 8) != 0)
    {
      unint64_t v6 = 8;
      int64_t result = 1001;
      goto LABEL_132;
    }
    if ((a4 & 0x40000000) != 0)
    {
      unint64_t v6 = 0x40000000;
      int64_t result = 1019;
      goto LABEL_132;
    }
    if ((a4 & 0x80000000) != 0)
    {
      unint64_t v6 = 0x80000000;
      int64_t result = 1020;
      goto LABEL_132;
    }
    if ((a4 & 0x20) == 0)
    {
      if ((a4 & 0x10000000000) != 0)
      {
        unint64_t v6 = 0x10000000000;
        int64_t result = 1021;
      }
      else if ((a4 & 0x10000) != 0)
      {
        unint64_t v6 = 0x10000;
        int64_t result = 1005;
      }
      else if ((a4 & 0x20000) != 0)
      {
        unint64_t v6 = 0x20000;
        int64_t result = 1006;
      }
      else if ((a4 & 0x1000000) != 0)
      {
        unint64_t v6 = 0x1000000;
        int64_t result = 1007;
      }
      else if ((a4 & 0x2000000) != 0)
      {
        unint64_t v6 = 0x2000000;
        int64_t result = 1008;
      }
      else if ((a4 & 0x4000000) != 0)
      {
        unint64_t v6 = 0x4000000;
        int64_t result = 1009;
      }
      else if ((a4 & 4) != 0)
      {
        unint64_t v6 = 4;
        int64_t result = 1004;
      }
      else if ((a4 & 0x800) != 0)
      {
        unint64_t v6 = 2048;
        int64_t result = 1002;
      }
      else if ((a4 & 0x20000000000) != 0)
      {
        unint64_t v6 = 0x20000000000;
        int64_t result = 1027;
      }
      else
      {
        if ((a4 & 0x400000000) == 0)
        {
          unint64_t v6 = a4 & 0x2000000000;
          BOOL v5 = (a4 & 0x2000000000) == 0;
          int64_t v7 = 1024;
          goto LABEL_31;
        }
        unint64_t v6 = 0x400000000;
        int64_t result = 1022;
      }
      goto LABEL_132;
    }
    goto LABEL_105;
  }
  if ((a4 & 0x20000000) != 0)
  {
    unint64_t v6 = 0x20000000;
    int64_t result = 222;
    goto LABEL_132;
  }
  if ((a4 & 0x800000000) != 0)
  {
    unint64_t v6 = 0x800000000;
    int64_t result = 223;
    goto LABEL_132;
  }
  if ((a4 & 0x8000) != 0)
  {
    unint64_t v6 = 0x8000;
    int64_t result = 215;
    goto LABEL_132;
  }
  if ((a4 & 0x2000) != 0)
  {
    unint64_t v6 = 0x2000;
    int64_t result = 213;
    goto LABEL_132;
  }
  if ((a4 & 0x4000) != 0)
  {
    unint64_t v6 = 0x4000;
    int64_t result = 214;
    goto LABEL_132;
  }
  if ((a4 & 0x100000) != 0)
  {
    unint64_t v6 = 0x100000;
    int64_t result = 111;
    goto LABEL_132;
  }
  if ((a4 & 0x10000000) != 0)
  {
    unint64_t v6 = 0x10000000;
    int64_t result = 221;
    goto LABEL_132;
  }
  if ((a4 & 0x8000000) != 0)
  {
    unint64_t v6 = 0x8000000;
    int64_t result = 220;
    goto LABEL_132;
  }
  if ((a4 & 0x10) != 0)
  {
    unint64_t v6 = 16;
    int64_t result = 208;
    goto LABEL_132;
  }
  if (a4)
  {
    unint64_t v6 = 1;
    int64_t result = 200;
    goto LABEL_132;
  }
  if ((a4 & 0x1000000000) != 0)
  {
    unint64_t v6 = 0x1000000000;
    int64_t result = 226;
    goto LABEL_132;
  }
  if ((a4 & 0x4000000000) != 0)
  {
    unint64_t v6 = 0x4000000000;
    int64_t result = 228;
    goto LABEL_132;
  }
  if ((a4 & 0x8000000000) != 0)
  {
    unint64_t v6 = 0x8000000000;
    int64_t result = 229;
    goto LABEL_132;
  }
  if ((a4 & 0x40) != 0)
  {
    unint64_t v6 = 64;
    int64_t result = 209;
    goto LABEL_132;
  }
  if ((a4 & 0x80) != 0)
  {
    unint64_t v6 = 128;
    int64_t result = 210;
    goto LABEL_132;
  }
  if ((a4 & 0x10000) != 0)
  {
    unint64_t v6 = 0x10000;
    int64_t result = 217;
    goto LABEL_132;
  }
  if ((a4 & 0x80000) != 0)
  {
    unint64_t v6 = 0x80000;
    int64_t result = 218;
    goto LABEL_132;
  }
  if ((a4 & 0x40000) != 0)
  {
    unint64_t v6 = 0x40000;
    int64_t result = 219;
    goto LABEL_132;
  }
  if ((a4 & 0x20000) != 0)
  {
    unint64_t v6 = 0x20000;
    int64_t result = 202;
    goto LABEL_132;
  }
  if ((a4 & 0x1000000) != 0)
  {
    unint64_t v6 = 0x1000000;
    int64_t result = 203;
    goto LABEL_132;
  }
  if ((a4 & 0x2000000) != 0)
  {
    unint64_t v6 = 0x2000000;
    int64_t result = 204;
    goto LABEL_132;
  }
  if ((a4 & 0x4000000) != 0)
  {
    unint64_t v6 = 0x4000000;
    int64_t result = 205;
    goto LABEL_132;
  }
  if ((a4 & 4) != 0)
  {
    unint64_t v6 = 4;
    int64_t result = 206;
    goto LABEL_132;
  }
  if ((a4 & 0x400) != 0)
  {
    unint64_t v6 = 1024;
    int64_t result = 211;
    goto LABEL_132;
  }
  if ((a4 & 0x200000) != 0)
  {
    unint64_t v6 = 0x200000;
    int64_t result = 216;
    goto LABEL_132;
  }
  if ((a4 & 8) != 0)
  {
    unint64_t v6 = 8;
    int64_t result = 207;
    goto LABEL_132;
  }
  if ((a4 & 0x40000000) != 0)
  {
    unint64_t v6 = 0x40000000;
LABEL_131:
    int64_t result = 224;
    goto LABEL_132;
  }
  if ((a4 & 0x80000000) != 0)
  {
    unint64_t v6 = 0x80000000;
    goto LABEL_131;
  }
  if ((a4 & 0x10000000000) != 0)
  {
    unint64_t v6 = 0x10000000000;
    goto LABEL_131;
  }
  if ((a4 & 0x20) != 0)
  {
LABEL_105:
    unint64_t v6 = 32;
LABEL_106:
    int64_t result = 104;
    goto LABEL_132;
  }
  if ((a4 & 0x200) != 0)
  {
    unint64_t v6 = 512;
    goto LABEL_106;
  }
  if ((a4 & 0x1000) != 0)
  {
    unint64_t v6 = 4096;
    int64_t result = 112;
  }
  else if ((a4 & 0x400000) != 0)
  {
    unint64_t v6 = 0x400000;
    int64_t result = 113;
  }
  else if ((a4 & 0x800000) != 0)
  {
    unint64_t v6 = 0x800000;
    int64_t result = 114;
  }
  else if ((a4 & 0x100) != 0)
  {
    unint64_t v6 = 256;
    int64_t result = 105;
  }
  else if ((a4 & 2) != 0)
  {
    unint64_t v6 = 2;
    int64_t result = 201;
  }
  else if ((a4 & 0x800) != 0)
  {
    unint64_t v6 = 2048;
    int64_t result = 212;
  }
  else if ((a4 & 0x20000000000) != 0)
  {
    unint64_t v6 = 0x20000000000;
    int64_t result = 230;
  }
  else
  {
    if ((a4 & 0x400000000) == 0)
    {
      unint64_t v6 = a4 & 0x2000000000;
      BOOL v5 = (a4 & 0x2000000000) == 0;
      int64_t v7 = 227;
LABEL_31:
      if (v5) {
        int64_t result = a3;
      }
      else {
        int64_t result = v7;
      }
      goto LABEL_132;
    }
    unint64_t v6 = 0x400000000;
    int64_t result = 225;
  }
LABEL_132:
  if (a5) {
    *a5 = v6;
  }
  return result;
}

+ (void)_setImplementationClass:(Class)a3
{
  _MergedGlobals_7_6 = (uint64_t)a3;
}

- (void)dealloc
{
  statusBarServer = self->_statusBarServer;
  if (statusBarServer)
  {
    [(UIStatusBarServer *)statusBarServer setStatusBar:0];
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v4 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v4 removeObserver:self name:0x1ED16A160 object:0];
  }
  inProcessStateProvider = self->_inProcessStateProvider;
  if (inProcessStateProvider) {
    [(UIStatusBarStateProvider *)inProcessStateProvider removeStatusBarStateObserver:self];
  }
  localDataOverrides = self->_localDataOverrides;
  if (localDataOverrides)
  {
    free(localDataOverrides);
    self->_localDataOverrides = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBar_Base;
  [(UIView *)&v7 dealloc];
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6
{
  [a1 _heightForStyle:a3 orientation:a4 forStatusBarFrame:a5 inWindow:a6 isAzulBLinked:1];
  return result;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  return 0.0;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  id v2 = [(id)UIApp _systemNavigationAction];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setServerUpdatesDisabled:(BOOL)a3
{
  if (self->_serverUpdatesDisabled != a3)
  {
    self->_serverUpdatesDisabled = a3;
    [(UIStatusBar_Base *)self _evaluateServerRegistration];
  }
}

- (void)_didEnterBackground:(id)a3
{
  self->_foreground = 0;
  [(UIStatusBar_Base *)self _evaluateServerRegistration];
}

- (void)_willEnterForeground:(id)a3
{
  self->_foreground = 1;
  [(UIStatusBar_Base *)self _evaluateServerRegistration];
}

- (void)_styleOverridesDidChange:(id)a3
{
  int64_t v4 = [(UIStatusBar_Base *)self _requestStyle];
  [(UIStatusBar_Base *)self requestStyle:v4 animated:0];
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  self->_styleOverrides = a4;
}

- (double)defaultHeight
{
  [(UIStatusBar_Base *)self heightForOrientation:1];
  return result;
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (CGSize)intrinsicContentSize
{
  [(UIStatusBar_Base *)self currentHeight];
  double v3 = v2;
  double v4 = -1.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (CGRect)currentFrame
{
  double v3 = [(UIView *)self window];
  [(UIStatusBar_Base *)self frameForOrientation:[(UIStatusBar_Base *)self orientation]];
  objc_msgSend(v3, "_convertRectFromSceneReferenceSpace:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)frameForOrientation:(int64_t)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass"), "_defaultStatusBarSceneReferenceBounds");
  double v6 = v5;
  double v8 = v7;
  double v9 = objc_opt_class();
  int64_t v10 = [(UIStatusBar_Base *)self currentStyle];
  objc_msgSend(v9, "_frameInSceneReferenceSpaceForStyle:orientation:inSceneWithReferenceSize:", v10, a3, v6, v8);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (int64_t)currentStyle
{
  return 0;
}

- (BOOL)isDoubleHeight
{
  return 0;
}

- (BOOL)isTranslucent
{
  return 1;
}

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5
{
  id v15 = [(UIStatusBar_Base *)self styleDelegate];
  double v9 = [(UIStatusBar_Base *)self styleDelegate];
  if (v15)
  {
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v11 = [(id)objc_opt_class() instanceMethodForSelector:sel_statusBar_styleForRequestedStyle_overrides_];
    int v12 = isKindOfClass & (v11 != [(id)objc_opt_class() instanceMethodForSelector:sel_statusBar_styleForRequestedStyle_overrides_]);
    if (objc_opt_respondsToSelector())
    {
      char v13 = objc_opt_respondsToSelector();
      if ((v12 & 1) == 0)
      {
        if ((v13 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_8:
        uint64_t v14 = [v9 overriddenRequestedStyleFromStyle:a5];
        a5 = objc_msgSend((id)objc_opt_class(), "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", v14, objc_msgSend(v9, "statusBar:effectiveStyleOverridesForRequestedStyle:overrides:", self, v14, -[UIStatusBar_Base styleOverrides](self, "styleOverrides")), a4);
        goto LABEL_12;
      }
    }
    else if (!v12)
    {
      goto LABEL_12;
    }
    a5 = objc_msgSend(v15, "statusBar:styleForRequestedStyle:overrides:", self, a5, -[UIStatusBar_Base styleOverrides](self, "styleOverrides"));
    if (a4) {
      *a4 = 0;
    }
  }
  else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    goto LABEL_8;
  }
LABEL_12:
  if (a3) {
    *a3 = a5;
  }
}

- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4
{
}

- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)requestStyle:(int64_t)a3
{
}

- (id)activeTintColor
{
  return 0;
}

- (BOOL)_canShowInOrientation:(int64_t)a3
{
  [(UIStatusBar_Base *)self heightForOrientation:a3];
  return v3 > 0.0;
}

- (void)setSuppressesHiddenSideEffects:(BOOL)a3
{
  if (self->_suppressesHiddenSideEffects != a3)
  {
    self->_suppressesHiddenSideEffects = a3;
    [(UIStatusBar_Base *)self _evaluateServerRegistration];
  }
}

- (void)setLocalDataOverrides:(id *)a3
{
  localDataOverrides = self->_localDataOverrides;
  if (a3)
  {
    if (localDataOverrides
      || (localDataOverrides = ($76E1ED2313895B0F0548B88023B5EA95 *)malloc_type_malloc(0xF68uLL, 0x100004064C31AF5uLL),
          (self->_localDataOverrides = localDataOverrides) != 0))
    {
      memcpy(localDataOverrides, a3, sizeof($76E1ED2313895B0F0548B88023B5EA95));
    }
  }
  else if (localDataOverrides)
  {
    free(localDataOverrides);
    self->_localDataOverrides = 0;
  }
}

- (BOOL)showsContentsOnScreen
{
  double v3 = [(UIStatusBar_Base *)self enabledPartIdentifiers];
  if (v3)
  {
    double v4 = [(UIStatusBar_Base *)self enabledPartIdentifiers];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return 0;
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  return 1.0;
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)_isTransparent
{
  return 0;
}

+ (CGRect)_frameInSceneReferenceSpaceForStyle:(int64_t)a3 orientation:(int64_t)a4 inSceneWithReferenceSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  [a1 heightForStyle:a3 orientation:a4 inWindow:0];
  double v9 = v8;
  switch(a4)
  {
    case 1:
      double v10 = 0.0;
      double height = v8;
      goto LABEL_7;
    case 2:
      double v10 = height - v8;
      double v11 = 0.0;
      double height = v9;
      break;
    case 3:
      double v11 = width - v8;
      double v10 = 0.0;
      double width = v9;
      break;
    case 4:
      double v10 = 0.0;
      double width = v8;
LABEL_7:
      double v11 = 0.0;
      break;
    default:
      double v11 = *MEMORY[0x1E4F1DB28];
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      break;
  }
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v11;
  return result;
}

+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4
{
  [a1 heightForStyle:0 orientation:a3 inWindow:a4];
  return result;
}

- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)setAvoidanceFrame:(CGRect)a3
{
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4
{
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 isInteractive:(BOOL)a5
{
}

- (BOOL)_rectIntersectsTimeItem:(CGRect)a3
{
  return 0;
}

- (BOOL)_usesModernBar
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [v2 isSubclassOfClass:v3];
}

- (void)setSensorActivityIndicator:(id)a3
{
}

- (UIView)sensorActivityIndicator
{
  return +[UIStatusBar_Modern sensorActivityIndicator];
}

- (UIFont)clockFont
{
  return 0;
}

- (UIStatusBarCarPlayDockDataProviding)dockDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dockDataProvider);
  return (UIStatusBarCarPlayDockDataProviding *)WeakRetained;
}

- (void)setDockDataProvider:(id)a3
{
}

- (BOOL)persistentAnimationsEnabled
{
  return self->_persistentAnimationsEnabled;
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  self->_persistentAnimationsEnabled = a3;
}

- (UIStatusBarWindow)statusBarWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
  return (UIStatusBarWindow *)WeakRetained;
}

- (UIStatusBarServer)statusBarServer
{
  return self->_statusBarServer;
}

- (void)setStatusBarServer:(id)a3
{
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)registered
{
  return self->_registered;
}

- (UIStatusBarStateProvider)inProcessStateProvider
{
  return self->_inProcessStateProvider;
}

- (void)setInProcessStateProvider:(id)a3
{
}

- (void)set_transitionCoordinator:(id)a3
{
}

- (BOOL)suppressesHiddenSideEffects
{
  return self->_suppressesHiddenSideEffects;
}

- (BOOL)homeItemsDisabled
{
  return self->_homeItemsDisabled;
}

- (void)setHomeItemsDisabled:(BOOL)a3
{
  self->_homeItemsDisabled = a3;
}

- (BOOL)disablesRasterization
{
  return self->_disablesRasterization;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (void)setDisabledPartIdentifiers:(id)a3
{
}

- (CGRect)avoidanceFrame
{
  double x = self->_avoidanceFrame.origin.x;
  double y = self->_avoidanceFrame.origin.y;
  double width = self->_avoidanceFrame.size.width;
  double height = self->_avoidanceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_styleRequest, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->__transitionCoordinator);
  objc_storeStrong((id *)&self->_inProcessStateProvider, 0);
  objc_storeStrong((id *)&self->_statusBarServer, 0);
  objc_destroyWeak((id *)&self->_statusBarWindow);
  objc_destroyWeak((id *)&self->_dockDataProvider);
  objc_destroyWeak((id *)&self->_styleDelegate);
}

@end