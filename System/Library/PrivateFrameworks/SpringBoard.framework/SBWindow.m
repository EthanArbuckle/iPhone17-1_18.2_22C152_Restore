@interface SBWindow
+ (BOOL)sb_autorotates;
+ (BOOL)sb_disableStatusBarHeightChanges;
+ (id)defaultLayoutStrategy;
- (BOOL)_shouldResizeWithScene;
- (BOOL)isActive;
- (NSString)description;
- (NSString)orientationSourceDescription;
- (SBWindow)initWithFrame:(CGRect)a3;
- (SBWindow)initWithWindowScene:(id)a3 layoutStrategy:(id)a4 role:(id)a5 debugName:(id)a6;
- (SBWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5;
- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7;
- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 role:(id)a5 debugName:(id)a6;
- (SBWindowLayoutStrategy)layoutStrategy;
- (TRAParticipant)traitsParticipant;
- (UIView)recycledViewsContainer;
- (id)_traitsParticipant;
- (id)sb_coronaAnimationController;
- (int64_t)activeInterfaceOrientation;
- (void)_addHiddenReason:(id)a3;
- (void)_didDisableSecureRendering:(id)a3;
- (void)_removeHiddenReason:(id)a3;
- (void)_sb_updateAutorotatesFlagAndForceInterfaceOrientationUpdate:(BOOL)a3;
- (void)_setTraitsParticipant:(id)a3;
- (void)_updateHidingForSecureRendering:(BOOL)a3;
- (void)_updateRealIsHidden;
- (void)_willEnableSecureRendering:(id)a3;
- (void)dealloc;
- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4;
- (void)layoutStrategyFrameOnScreenDidChange:(id)a3;
- (void)makeKeyAndVisible;
- (void)moveToWindowSceneIfNeeded:(id)a3;
- (void)sb_updateAutorotatesFlag;
- (void)setAlphaAndObeyBecauseIAmTheWindowManager:(double)a3;
- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4;
- (void)setHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBWindow

- (TRAParticipant)traitsParticipant
{
  return self->_traitsParticipant;
}

- (UIView)recycledViewsContainer
{
  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    v4 = [SBRecycledViewsContainer alloc];
    v5 = -[SBRecycledViewsContainer initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v5;

    [(SBRecycledViewsContainer *)self->_recycledViewsContainerView setHidden:1];
    [(SBRecycledViewsContainer *)self->_recycledViewsContainerView setAlpha:0.0];
    [(SBRecycledViewsContainer *)self->_recycledViewsContainerView setUserInteractionEnabled:0];
    [(SBWindow *)self addSubview:self->_recycledViewsContainerView];
    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return (UIView *)recycledViewsContainerView;
}

- (void)setHidden:(BOOL)a3
{
  self->_requestedHiddenValue = a3;
  [(SBWindow *)self _updateRealIsHidden];
}

- (void)_updateRealIsHidden
{
  BOOL v3 = self->_requestedHiddenValue || [(NSMutableSet *)self->_additionalHiddenReasons count] != 0;
  v4.receiver = self;
  v4.super_class = (Class)SBWindow;
  [(SBFWindow *)&v4 setHidden:v3];
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v4 = [(SBWindow *)self _debugName];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  id v6 = (id)[v3 appendSuper];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)_shouldResizeWithScene
{
  v2 = [(SBWindow *)self screen];
  BOOL v3 = [v2 displayIdentity];
  char v4 = [v3 isMainDisplay] ^ 1;

  return v4;
}

- (id)_traitsParticipant
{
  return self->_traitsParticipant;
}

- (void)_setTraitsParticipant:(id)a3
{
}

- (SBWindow)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  [v5 handleFailureInMethod:a2, self, @"SBWindow.m", 125, @"%s - dont' call this function - %@", "-[SBWindow initWithFrame:]", v6 object file lineNumber description];

  return 0;
}

- (SBWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  return [(SBWindow *)self initWithWindowScene:a3 layoutStrategy:0 role:a4 debugName:a5];
}

- (SBWindow)initWithWindowScene:(id)a3 layoutStrategy:(id)a4 role:(id)a5 debugName:(id)a6
{
  return [(SBWindow *)self initWithWindowScene:a3 rootViewController:0 layoutStrategy:a4 role:a5 debugName:a6];
}

- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 role:(id)a5 debugName:(id)a6
{
  return [(SBWindow *)self initWithWindowScene:a3 rootViewController:a4 layoutStrategy:0 role:a5 debugName:a6];
}

- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v15)
  {
    id v15 = [(id)objc_opt_class() defaultLayoutStrategy];
  }
  [v15 frameWithInterfaceOrientation:1 windowScene:v13];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = SBLogStartup();
  v27 = v26;
  if (v13)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      __int16 v47 = 2114;
      id v48 = v13;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] wiring up with windowScene: %{public}@", buf, 0x16u);
    }
    v44.receiver = self;
    v44.super_class = (Class)SBWindow;
    v29 = (SBWindow *)-[SBWindow _initWithFrame:debugName:windowScene:](&v44, sel__initWithFrame_debugName_windowScene_, v17, v13, v19, v21, v23, v25);
    if (!v29) {
      goto LABEL_27;
    }
LABEL_11:
    v29->_requestedHiddenValue = [(SBWindow *)v29 isHidden];
    char v31 = [(id)objc_opt_class() _isSecure];
    if ((v31 & 1) == 0)
    {
      v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v32 addObserver:v29 selector:sel__willEnableSecureRendering_ name:*MEMORY[0x1E4FA60E8] object:0];
      [v32 addObserver:v29 selector:sel__didDisableSecureRendering_ name:*MEMORY[0x1E4FA60E0] object:0];
    }
    objc_storeStrong((id *)&v29->_layoutStrategy, v15);
    [(SBWindow *)v29 setClipsToBounds:[(SBWindowLayoutStrategy *)v29->_layoutStrategy shouldClipForWindow:v29]];
    [(SBWindow *)v29 _setWindowInterfaceOrientation:1];
    if (v16) {
      [(SBWindow *)v29 _setRoleHint:v16];
    }
    if (v14)
    {
      uint64_t v33 = [(SBWindow *)v29 isHidden];
      [(SBWindow *)v29 setRootViewController:v14];
      [(SBWindow *)v29 setHidden:0];
      [(SBWindow *)v29 setHidden:v33];
    }
    [(SBWindowLayoutStrategy *)v29->_layoutStrategy addObserver:v29];
    if ((v31 & 1) == 0)
    {
      uint64_t v34 = objc_opt_class();
      id v35 = v13;
      if (v34)
      {
        if (objc_opt_isKindOfClass()) {
          v36 = v35;
        }
        else {
          v36 = 0;
        }
      }
      else
      {
        v36 = 0;
      }
      id v37 = v36;

      v38 = [v37 secureDisplayStateProvider];
      v39 = v38;
      if (v38)
      {
        id v40 = v38;
      }
      else
      {
        id v40 = [(id)SBApp authenticationController];
      }
      v41 = v40;

      -[SBWindow _updateHidingForSecureRendering:](v29, "_updateHidingForSecureRendering:", [v41 isInSecureDisplayMode]);
    }
    goto LABEL_27;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:]((uint64_t)self, (uint64_t)a2, v27);
  }

  v30 = SBMainWindowScene();
  v43.receiver = self;
  v43.super_class = (Class)SBWindow;
  v29 = (SBWindow *)-[SBWindow _initWithFrame:debugName:windowScene:](&v43, sel__initWithFrame_debugName_windowScene_, v17, v30, v19, v21, v23, v25);

  if (v29) {
    goto LABEL_11;
  }
LABEL_27:

  return v29;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA60E8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA60E0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBWindow;
  [(SBFWindow *)&v4 dealloc];
}

- (void)layoutStrategyFrameOnScreenDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWindow *)self interfaceOrientation];
  id v6 = [(SBWindow *)self windowScene];
  [v4 frameWithInterfaceOrientation:v5 windowScene:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15.receiver = self;
  v15.super_class = (Class)SBWindow;
  -[SBWindow setFrame:](&v15, sel_setFrame_, v8, v10, v12, v14);
}

- (void)makeKeyAndVisible
{
  v3.receiver = self;
  v3.super_class = (Class)SBWindow;
  [(SBWindow *)&v3 makeKeyAndVisible];
  self->_requestedHiddenValue = 0;
  [(SBWindow *)self _updateRealIsHidden];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWindow *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if ([v4 userInterfaceStyle] != v6) {
    [(SBUICoronaAnimationController *)self->_coronaAnimationController coronaDidChange:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBWindow;
  [(SBWindow *)&v7 traitCollectionDidChange:v4];
}

- (id)sb_coronaAnimationController
{
  coronaAnimationController = self->_coronaAnimationController;
  if (!coronaAnimationController)
  {
    id v4 = (SBUICoronaAnimationController *)objc_alloc_init(MEMORY[0x1E4FA79A8]);
    uint64_t v5 = self->_coronaAnimationController;
    self->_coronaAnimationController = v4;

    coronaAnimationController = self->_coronaAnimationController;
  }
  return coronaAnimationController;
}

+ (id)defaultLayoutStrategy
{
  return +[SBWindowDefaultLayoutStrategy clipStrategy];
}

+ (BOOL)sb_disableStatusBarHeightChanges
{
  return 1;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  if ((objc_msgSend((id)objc_opt_class(), "sb_disableStatusBarHeightChanges") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBWindow;
    [(SBWindow *)&v7 handleStatusBarChangeFromHeight:a3 toHeight:a4];
  }
}

+ (BOOL)sb_autorotates
{
  return 0;
}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
}

- (void)sb_updateAutorotatesFlag
{
  int v4 = objc_msgSend((id)objc_opt_class(), "sb_autorotates");
  if (v4)
  {
    v2 = [(SBWindow *)self screen];
    uint64_t v5 = [v2 _isRotatable];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBWindow;
  [(SBWindow *)&v6 setAutorotates:v5 forceUpdateInterfaceOrientation:0];
  if (v4) {
}
  }

- (void)_sb_updateAutorotatesFlagAndForceInterfaceOrientationUpdate:(BOOL)a3
{
  BOOL v4 = a3;
  int v6 = objc_msgSend((id)objc_opt_class(), "sb_autorotates");
  if (v6)
  {
    objc_super v3 = [(SBWindow *)self screen];
    uint64_t v7 = [v3 _isRotatable];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SBWindow;
  [(SBWindow *)&v8 setAutorotates:v7 forceUpdateInterfaceOrientation:v4];
  if (v6) {
}
  }

- (void)moveToWindowSceneIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(SBWindow *)self windowScene];

  uint64_t v5 = v6;
  if (v4 != v6)
  {
    [(SBWindow *)self setWindowScene:v6];
    uint64_t v5 = v6;
  }
}

- (void)_addHiddenReason:(id)a3
{
  id v4 = a3;
  additionalHiddenReasons = self->_additionalHiddenReasons;
  id v8 = v4;
  if (!additionalHiddenReasons)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_additionalHiddenReasons;
    self->_additionalHiddenReasons = v6;

    id v4 = v8;
    additionalHiddenReasons = self->_additionalHiddenReasons;
  }
  [(NSMutableSet *)additionalHiddenReasons addObject:v4];
  [(SBWindow *)self _updateRealIsHidden];
}

- (void)_removeHiddenReason:(id)a3
{
  [(NSMutableSet *)self->_additionalHiddenReasons removeObject:a3];
  [(SBWindow *)self _updateRealIsHidden];
}

- (void)_updateHidingForSecureRendering:(BOOL)a3
{
  if (a3
    && ([(SBWindow *)self screen],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 displayIdentity],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isMainDisplay],
        v5,
        v4,
        v6))
  {
    [(SBWindow *)self _addHiddenReason:@"SBWindowHiddenReasonSecureRendering"];
  }
  else
  {
    [(SBWindow *)self _removeHiddenReason:@"SBWindowHiddenReasonSecureRendering"];
  }
}

- (void)_willEnableSecureRendering:(id)a3
{
}

- (void)_didDisableSecureRendering:(id)a3
{
}

- (int64_t)activeInterfaceOrientation
{
  objc_super v3 = [(SBWindow *)self rootViewController];
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v3 _overrideWindowActiveInterfaceOrientation];
  }
  else {
    uint64_t v4 = [(SBWindow *)self _windowInterfaceOrientation];
  }
  int64_t v5 = v4;

  return v5;
}

- (BOOL)isActive
{
  if ([(SBWindow *)self isHidden]) {
    return 0;
  }
  uint64_t v4 = [(SBWindow *)self rootViewController];
  BOOL v3 = v4 != 0;

  return v3;
}

- (NSString)orientationSourceDescription
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = [(SBWindow *)self _debugName];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  [(SBWindow *)self activeInterfaceOrientation];
  int v6 = BSInterfaceOrientationDescription();
  id v7 = (id)[v3 appendObject:v6 withName:@"orientation"];

  [(SBWindow *)self orientationSourceLevel];
  id v9 = (id)[v3 appendInteger:(uint64_t)v8 withName:@"level"];
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBWindow isActive](self, "isActive"), @"active");
  double v11 = [v3 build];

  return (NSString *)v11;
}

- (SBWindowLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_additionalHiddenReasons, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_coronaAnimationController, 0);
}

- (void)setAlphaAndObeyBecauseIAmTheWindowManager:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBWindow;
  [(SBWindow *)&v3 setAlpha:a3];
}

- (void)initWithWindowScene:(NSObject *)a3 rootViewController:layoutStrategy:role:debugName:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] no windowScene passed in somehow. the caller better wire one up soon", (uint8_t *)&v5, 0xCu);
}

@end