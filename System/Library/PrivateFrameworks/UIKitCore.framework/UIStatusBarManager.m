@interface UIStatusBarManager
+ (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3;
- (BOOL)_isOverridingStatusBarHidden;
- (BOOL)_updateAlpha;
- (BOOL)_updateStyleForWindow:(id)a3 animationParameters:(id *)a4;
- (BOOL)_updateVisibilityForWindow:(id)a3 targetOrientation:(int64_t)a4 animationParameters:(id *)a5;
- (BOOL)isInStatusBarFadeAnimation;
- (BOOL)isStatusBarHidden;
- (CGPoint)_adjustedLocationForXPosition:(double)a3;
- (CGRect)_statusBarFrameIgnoringVisibility;
- (CGRect)statusBarFrame;
- (CGRect)statusBarFrameForStatusBarHeight:(double)a3;
- (CGRect)statusBarFrameForStatusBarHeight:(double)a3 inOrientation:(int64_t)a4;
- (NSDictionary)statusBarPartStyles;
- (UIScene)_scene;
- (UIStatusBarManager)initWithScene:(id)a3;
- (UIStatusBarStyle)statusBarStyle;
- (UIWindowScene)windowScene;
- (double)defaultStatusBarHeight;
- (double)defaultStatusBarHeightInOrientation:(int64_t)a3;
- (double)statusBarAlpha;
- (double)statusBarHeight;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)_updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4 animationParameters:(id)a5;
- (id)createLocalStatusBar;
- (id)debugMenuHandler;
- (id)updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4;
- (int64_t)statusBarResolvedStyle;
- (void)_handleScrollToTopAtXPosition:(double)a3;
- (void)_setOverridingStatusBarHidden:(BOOL)a3;
- (void)_setOverridingStatusBarHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)_setScene:(id)a3;
- (void)_visibilityChangedWithOriginalOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 animationParameters:(id)a5;
- (void)handleTapAction:(id)a3;
- (void)setDebugMenuHandler:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)updateStatusBarAppearance;
- (void)updateStatusBarAppearanceWithAnimationParameters:(id)a3;
@end

@implementation UIStatusBarManager

uint64_t __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 10) = 0;
  return result;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (double)defaultStatusBarHeight
{
  if ([(id)UIApp _isSpringBoard])
  {
    v3 = [(id)UIApp statusBar];
    [v3 currentHeight];
    double v5 = v4;

    return v5;
  }
  else
  {
    UIInterfaceOrientation v7 = [(UIWindowScene *)self->_windowScene interfaceOrientation];
    [(UIStatusBarManager *)self defaultStatusBarHeightInOrientation:v7];
  }
  return result;
}

- (double)defaultStatusBarHeightInOrientation:(int64_t)a3
{
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v6 = [(UIScene *)self->_windowScene _effectiveUISettings];
    [v6 defaultStatusBarHeightForOrientation:a3];
    goto LABEL_5;
  }
  double v5 = 0.0;
  if (([(id)UIApp _isStatusBarForcedHiddenForOrientation:a3] & 1) == 0)
  {
    v6 = -[UIWindowScene _keyWindow]((id *)&self->_windowScene->super.super.super.isa);
    +[UIStatusBar_Base heightForStyle:0 orientation:a3 inWindow:v6];
LABEL_5:
    double v5 = v7;
  }
  return v5;
}

- (double)statusBarHeight
{
  if ([(UIStatusBarManager *)self isStatusBarHidden]) {
    return 0.0;
  }
  [(UIStatusBarManager *)self defaultStatusBarHeight];
  return result;
}

- (BOOL)isStatusBarHidden
{
  return self->_statusBarHidden;
}

- (BOOL)isInStatusBarFadeAnimation
{
  return self->_inStatusBarFadeAnimation;
}

- (UIStatusBarManager)initWithScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarManager;
  double v5 = [(UIStatusBarManager *)&v10 init];
  [(UIStatusBarManager *)v5 _setScene:v4];
  v5->_statusBarStyle = -1;
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v6 = [v4 _FBSScene];
    double v7 = [v6 uiClientSettings];

    v5->_statusBarHidden = [v7 statusBarHidden];
    [v7 statusBarAlpha];
    v5->_statusBarAlpha = v8;
  }
  return v5;
}

- (void)_setScene:(id)a3
{
  double v5 = (UIWindowScene *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"UIStatusBarManager.m", 237, @"Invalid parameter not satisfying: %@", @"scene == nil || [scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
    }
  }
  windowScene = self->_windowScene;
  self->_windowScene = v5;
}

- (void)updateStatusBarAppearanceWithAnimationParameters:(id)a3
{
  id v3 = [(UIStatusBarManager *)self _updateStatusBarAppearanceWithClientSettings:0 transitionContext:0 animationParameters:a3];
}

- (id)_updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4 animationParameters:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:self->_windowScene];
  if ([(id)UIApp _viewControllerBasedStatusBarAppearance]) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    v14 = 0;
    goto LABEL_56;
  }
  if ([v8 interfaceOrientation])
  {
    uint64_t v13 = [v8 interfaceOrientation];
  }
  else
  {
    v15 = [v11 _orientationTransactionToken];
    uint64_t v16 = [v15 state];

    if ((unint64_t)(v16 - 1) < 2)
    {
      v17 = [(UIStatusBarManager *)self windowScene];
      uint64_t v18 = [v17 interfaceOrientation];

      goto LABEL_12;
    }
    uint64_t v13 = [v11 _windowInterfaceOrientation];
  }
  uint64_t v18 = v13;
LABEL_12:
  id v67 = 0;
  BOOL v19 = [(UIStatusBarManager *)self _updateVisibilityForWindow:v11 targetOrientation:v18 animationParameters:&v67];
  id v20 = v67;
  if (self->_statusBarHidden)
  {
    BOOL v21 = 0;
    BOOL v22 = 0;
    id v23 = 0;
    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
    id v66 = 0;
    BOOL v21 = [(UIStatusBarManager *)self _updateStyleForWindow:v11 animationParameters:&v66];
    id v23 = v66;
    BOOL v22 = [(UIStatusBarManager *)self _updateAlpha];
    if (v19) {
      goto LABEL_19;
    }
  }
  if (v21 || v22)
  {
LABEL_19:
    unint64_t v48 = __PAIR64__(v21, v22);
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v40 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = @"NO";
        int64_t statusBarStyle = self->_statusBarStyle;
        if (v19) {
          v43 = @"YES";
        }
        else {
          v43 = @"NO";
        }
        statusBarPartStyles = self->_statusBarPartStyles;
        double statusBarAlpha = self->_statusBarAlpha;
        if (self->_statusBarHidden) {
          v46 = @"YES";
        }
        else {
          v46 = @"NO";
        }
        *(_DWORD *)buf = 138413826;
        if (HIDWORD(v48)) {
          v47 = @"YES";
        }
        else {
          v47 = @"NO";
        }
        v69 = v43;
        if (v48) {
          v41 = @"YES";
        }
        __int16 v70 = 2112;
        v71 = v46;
        __int16 v72 = 2112;
        v73 = v47;
        __int16 v74 = 2048;
        int64_t v75 = statusBarStyle;
        __int16 v76 = 2112;
        v77 = statusBarPartStyles;
        __int16 v78 = 2112;
        v79 = v41;
        __int16 v80 = 2048;
        double v81 = statusBarAlpha;
        _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "UIStatusBarManager visibilityUpdated: %@ hidden: %@, styleUpdated: %@ style: %ld partStyles: %@, alphaUpdated: %@ alpha: %.2f", buf, 0x48u);
      }
    }
    if (v10)
    {
      if (v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (v23)
        {
LABEL_31:
          v24 = v23;
          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = 0;
LABEL_32:
          id v52 = v9;
          if (v19)
          {
            v27 = [(UIStatusBarManager *)self windowScene];
            uint64_t v28 = [v27 interfaceOrientation];

            if (v8)
            {
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke;
              aBlock[3] = &unk_1E52E05A8;
              aBlock[4] = self;
              uint64_t v64 = v28;
              uint64_t v65 = v18;
              id v63 = v20;
              v29 = _Block_copy(aBlock);
            }
            else
            {
              [(UIStatusBarManager *)self _visibilityChangedWithOriginalOrientation:v28 targetOrientation:v18 animationParameters:v20];
              v29 = 0;
            }
            if ((objc_msgSend((id)UIApp, "_isSpringBoard", v48) & 1) == 0)
            {
LABEL_44:
              id v9 = v52;
LABEL_45:
              if ((objc_msgSend((id)UIApp, "_isSpringBoard", v48) & 1) == 0)
              {
                v57[0] = MEMORY[0x1E4F143A8];
                v57[1] = 3221225472;
                v57[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_2;
                v57[3] = &unk_1E52E05D0;
                BOOL v59 = v19;
                v57[4] = self;
                id v58 = v20;
                char v60 = v50;
                char v61 = v49;
                v34 = _Block_copy(v57);
                v35 = v34;
                if (v8)
                {
                  (*((void (**)(void *, id, id))v34 + 2))(v34, v8, v9);
                }
                else
                {
                  if (v10)
                  {
                    v36 = [v10 bsAnimationSettings];
                    int v51 = [v10 skipFencing] ^ 1;
                  }
                  else
                  {
                    v36 = 0;
                    LOBYTE(v51) = 0;
                  }
                  windowScene = self->_windowScene;
                  v53[0] = MEMORY[0x1E4F143A8];
                  v53[1] = 3221225472;
                  v53[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_3;
                  v53[3] = &unk_1E52E05F8;
                  id v54 = v36;
                  id v55 = v35;
                  char v56 = v51;
                  id v38 = v36;
                  [(UIScene *)windowScene _updateUIClientSettingsWithUITransitionBlock:v53];

                  id v9 = v52;
                }
              }
              v14 = _Block_copy(v29);

              goto LABEL_55;
            }
            v30 = [(id)UIApp statusBar];
            [v30 setHidden:self->_statusBarHidden animationParameters:v20];

            id v9 = v52;
          }
          else
          {
            v29 = 0;
            if (([(id)UIApp _isSpringBoard] & 1) == 0) {
              goto LABEL_45;
            }
          }
          if (HIDWORD(v48))
          {
            v31 = [(id)UIApp statusBar];
            [v31 requestStyle:self->_statusBarResolvedStyle partStyles:self->_statusBarPartStyles animationParameters:v24 forced:0];

            id v9 = v52;
          }
          if (!v48) {
            goto LABEL_45;
          }
          double v32 = self->_statusBarAlpha;
          v33 = [(id)UIApp statusBar];
          [v33 setAlpha:v32];

          goto LABEL_44;
        }
        v26 = v10;
        id v23 = v10;
      }
      else
      {
        v26 = v10;
        id v20 = v10;
      }
    }
    else if (v20)
    {
      v26 = v20;
    }
    else
    {
      v24 = 0;
      id v10 = 0;
      v26 = v23;
      if (!v23) {
        goto LABEL_32;
      }
    }
    id v10 = v26;
    goto LABEL_31;
  }
  v14 = 0;
  v24 = v23;
LABEL_55:

LABEL_56:
  return v14;
}

- (BOOL)_updateVisibilityForWindow:(id)a3 targetOrientation:(int64_t)a4 animationParameters:(id *)a5
{
  id v15 = 0;
  int v7 = +[UIWindow _prefersStatusBarHiddenInWindow:a3 targetOrientation:a4 animationProvider:&v15];
  id v8 = v15;
  id v9 = v8;
  int statusBarHidden = self->_statusBarHidden;
  if (statusBarHidden != v7)
  {
    self->_int statusBarHidden = v7;
    if (a5)
    {
      if (v8)
      {
        v11 = [v8 _preferredStatusBarHideAnimationParameters];
        if (!v11)
        {
          BOOL v12 = objc_opt_class();
          v11 = [v12 _implicitStatusBarAnimationParametersWithClass:objc_opt_class()];
          if (v11) {
            objc_msgSend(v11, "setHideAnimation:", objc_msgSend(v9, "preferredStatusBarUpdateAnimation"));
          }
        }
        id v13 = v11;
        *a5 = v13;
      }
    }
  }

  return statusBarHidden != v7;
}

- (BOOL)_updateStyleForWindow:(id)a3 animationParameters:(id *)a4
{
  id v20 = 0;
  int64_t v21 = 0;
  id v19 = 0;
  int64_t v6 = +[UIWindow _preferredStatusBarStyleInWindow:a3 resolvedStyle:&v21 withPartStyles:&v20 animationProvider:&v19];
  id v7 = v20;
  id v8 = v20;
  id v9 = v19;
  if (v21 == self->_statusBarResolvedStyle && v6 == self->_statusBarStyle)
  {
    statusBarPartStyles = self->_statusBarPartStyles;
    v11 = (NSDictionary *)v8;
    BOOL v12 = statusBarPartStyles;
    if (v11 == v12)
    {

      BOOL v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v13 = v12;
    if (v11 && v12)
    {
      char v14 = [(NSDictionary *)v11 isEqual:v12];

      if (v14)
      {
        BOOL v15 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  self->_statusBarResolvedStyle = v21;
  self->_int64_t statusBarStyle = v6;
  objc_storeStrong((id *)&self->_statusBarPartStyles, v7);
  BOOL v15 = 1;
  if (a4 && v9)
  {
    uint64_t v16 = [v9 _preferredStatusBarStyleAnimationParameters];
    if (!v16)
    {
      v17 = objc_opt_class();
      uint64_t v16 = [v17 _implicitStatusBarAnimationParametersWithClass:objc_opt_class()];
      [v16 setStyleAnimation:1];
    }
    v11 = v16;
    *a4 = v11;
    BOOL v15 = 1;
    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (BOOL)_updateAlpha
{
  char v3 = [(id)UIApp _isSpringBoard];
  double v4 = 1.0;
  if ((v3 & 1) == 0)
  {
    double v4 = 0.0;
    if (!self->_overriddingStatusBarHidden) {
      double v4 = 1.0;
    }
  }
  double statusBarAlpha = self->_statusBarAlpha;
  if (v4 != statusBarAlpha) {
    self->_double statusBarAlpha = v4;
  }
  return v4 != statusBarAlpha;
}

- (void)updateStatusBarAppearance
{
}

+ (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3
{
  double v4 = +[UIView _currentAnimationAttributes];
  if (v4)
  {
    double v5 = (void *)[[a3 alloc] initWithDefaultParameters];
    [v4 _duration];
    objc_msgSend(v5, "setDuration:");
    [v4 _delay];
    objc_msgSend(v5, "setDelay:");
    objc_msgSend(v5, "setCurve:", objc_msgSend(v4, "_curve"));
  }
  else
  {
    double v5 = [(objc_class *)a3 fencingAnimation];
  }

  return v5;
}

- (void)setDebugMenuHandler:(id)a3
{
}

uint64_t __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  int64_t v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  [v7 setAnimationSettings:*(void *)(a1 + 32)];

  return *(unsigned __int8 *)(a1 + 48);
}

void __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    [v7 setStatusBarHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];
    int64_t v6 = *(void **)(a1 + 40);
    if (v6) {
      objc_msgSend(v5, "setStatusBarAnimation:", objc_msgSend(v6, "hideAnimation"));
    }
  }
  if (*(unsigned char *)(a1 + 49))
  {
    [v7 setStatusBarStyle:*(void *)(*(void *)(a1 + 32) + 16)];
    [v7 setStatusBarModernStyle:*(void *)(*(void *)(a1 + 32) + 32)];
    [v7 setStatusBarPartStyles:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  if (*(unsigned char *)(a1 + 50)) {
    [v7 setStatusBarAlpha:*(double *)(*(void *)(a1 + 32) + 48)];
  }
}

- (void)_visibilityChangedWithOriginalOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 animationParameters:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [(UIStatusBarManager *)self defaultStatusBarHeightInOrientation:a3];
  uint64_t v10 = v9;
  [(UIStatusBarManager *)self defaultStatusBarHeightInOrientation:a4];
  uint64_t v12 = v11;
  self->_inStatusBarFadeAnimation = [v8 hideAnimation] == 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke;
  v21[3] = &unk_1E52E05A8;
  v21[4] = self;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  id v13 = v8;
  id v22 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke_2;
  v20[3] = &unk_1E52DC3A0;
  v20[4] = self;
  +[UIStatusBarAnimationParameters animateWithParameters:v13 animations:v21 completion:v20];
  if (([(id)UIApp _isSpringBoard] & 1) == 0 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    char v14 = [(UIStatusBarManager *)self windowScene];
    BOOL v15 = [v14 _systemAppearanceManager];
    [v15 updateScreenEdgesDeferringSystemGestures];
  }
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v17 = UIApp;
  v25 = @"statusBarIsHidden";
  uint64_t v18 = [NSNumber numberWithBool:self->_statusBarHidden];
  v26[0] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v16 postNotificationName:@"_UIApplicationStatusBarHiddenStateChangedNotification" object:v17 userInfo:v19];
}

- (CGRect)statusBarFrame
{
  if ([(UIStatusBarManager *)self isStatusBarHidden])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(UIStatusBarManager *)self statusBarHeight];
    -[UIStatusBarManager statusBarFrameForStatusBarHeight:](self, "statusBarFrameForStatusBarHeight:");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)statusBarFrameForStatusBarHeight:(double)a3
{
  double v4 = [(UIWindowScene *)self->_windowScene coordinateSpace];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v6;
  double v12 = v8;
  double v13 = v10;
  double v14 = a3;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke(double *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned char *)*((void *)a1 + 4);
  if (v2[9])
  {
    double v3 = a1[6];
    double v4 = 0.0;
  }
  else
  {
    double v4 = a1[7];
    double v3 = 0.0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = objc_msgSend(v2, "windowScene", 0);
  double v6 = [v5 _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v11 _isStatusBarWindow] & 1) == 0) {
          [v11 handleStatusBarChangeFromHeight:v3 toHeight:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  double v12 = (void *)*((void *)a1 + 5);
  if (!v12 || ([v12 duration], v13 == 0.0))
  {
    uint64_t v16 = 0;
  }
  else
  {
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v15 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v16 = [v14 dictionaryWithObject:v15 forKey:@"UIApplicationStatusBarHeightChangedDurationKey"];
  }
  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"UIApplicationStatusBarHeightChangedNotification" object:UIApp userInfo:v16];
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)_setOverridingStatusBarHidden:(BOOL)a3
{
  if (self->_overriddingStatusBarHidden != a3)
  {
    self->_overriddingStatusBarHidden = a3;
    [(UIStatusBarManager *)self updateStatusBarAppearanceWithAnimationParameters:0];
  }
}

- (void)_setOverridingStatusBarHidden:(BOOL)a3 animationParameters:(id)a4
{
  if (self->_overriddingStatusBarHidden != a3)
  {
    self->_overriddingStatusBarHidden = a3;
    [(UIStatusBarManager *)self updateStatusBarAppearanceWithAnimationParameters:a4];
  }
}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (CGRect)statusBarFrameForStatusBarHeight:(double)a3 inOrientation:(int64_t)a4
{
  [(UIWindowScene *)self->_windowScene _referenceBoundsForOrientation:a4];
  double v8 = a3;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_statusBarFrameIgnoringVisibility
{
  [(UIStatusBarManager *)self defaultStatusBarHeight];
  -[UIStatusBarManager statusBarFrameForStatusBarHeight:](self, "statusBarFrameForStatusBarHeight:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [[UIStatusBarAnimationParameters alloc] initWithDefaultParameters];
  uint64_t v9 = [v6 animationSettings];
  [v9 duration];
  -[UIStatusBarAnimationParameters setDuration:](v8, "setDuration:");

  double v10 = [(UIStatusBarManager *)self _updateStatusBarAppearanceWithClientSettings:v7 transitionContext:v6 animationParameters:v8];

  return v10;
}

uint64_t __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _visibilityChangedWithOriginalOrientation:*(void *)(a1 + 48) targetOrientation:*(void *)(a1 + 56) animationParameters:*(void *)(a1 + 40)];
}

- (id)createLocalStatusBar
{
  return 0;
}

- (void)handleTapAction:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 type];
  if (v4 == 1)
  {
    debugMenuHandler = (void (**)(void))self->_debugMenuHandler;
    if (debugMenuHandler) {
      debugMenuHandler[2]();
    }
  }
  else if (!v4)
  {
    [v6 xPosition];
    -[UIStatusBarManager _handleScrollToTopAtXPosition:](self, "_handleScrollToTopAtXPosition:");
  }
}

- (CGPoint)_adjustedLocationForXPosition:(double)a3
{
  [(UIStatusBarManager *)self statusBarFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
LABEL_2:
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    double v13 = CGRectGetHeight(v23) + 1.0;
  }
  else
  {
    BOOL v15 = [(UIWindowScene *)self->_windowScene screen];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    switch([(UIWindowScene *)self->_windowScene interfaceOrientation])
    {
      case UIInterfaceOrientationPortrait:
        goto LABEL_2;
      case UIInterfaceOrientationPortraitUpsideDown:
        v24.origin.x = v6;
        v24.origin.y = v8;
        v24.size.width = v10;
        v24.size.height = v12;
        double v13 = v19 - (CGRectGetHeight(v24) + 1.0);
        break;
      case UIInterfaceOrientationLandscapeRight:
        v25.origin.x = v6;
        v25.origin.y = v8;
        v25.size.width = v10;
        v25.size.height = v12;
        CGFloat Width = CGRectGetWidth(v25);
        double v13 = a3;
        a3 = v17 - (Width + 1.0);
        break;
      case UIInterfaceOrientationLandscapeLeft:
        v26.origin.x = v6;
        v26.origin.y = v8;
        v26.size.width = v10;
        v26.size.height = v12;
        CGFloat v21 = CGRectGetWidth(v26);
        double v13 = a3;
        a3 = v21 + 1.0;
        break;
      default:
        double v13 = a3;
        break;
    }
  }
  double v14 = a3;
  result.y = v13;
  result.x = v14;
  return result;
}

- (void)_handleScrollToTopAtXPosition:(double)a3
{
  double v5 = -[UIWindowScene _keyWindow]((id *)&self->_windowScene->super.super.super.isa);
  if (v5) {
    goto LABEL_3;
  }
  CGFloat v6 = [(UIWindowScene *)self->_windowScene screen];
  windowScene = self->_windowScene;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__UIStatusBarManager__handleScrollToTopAtXPosition___block_invoke;
  v9[3] = &unk_1E52E0620;
  id v10 = v6;
  id v8 = v6;
  double v5 = [(UIWindowScene *)windowScene _topVisibleWindowPassingTest:v9];

  if (v5)
  {
LABEL_3:
    [(UIStatusBarManager *)self _adjustedLocationForXPosition:a3];
    objc_msgSend(v5, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", 0);
  }
}

uint64_t __52__UIStatusBarManager__handleScrollToTopAtXPosition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _canActAsKeyWindowForScreen:*(void *)(a1 + 32)];
}

- (BOOL)_isOverridingStatusBarHidden
{
  return self->_overriddingStatusBarHidden;
}

- (UIStatusBarStyle)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setWindowScene:(id)a3
{
}

- (int64_t)statusBarResolvedStyle
{
  return self->_statusBarResolvedStyle;
}

- (NSDictionary)statusBarPartStyles
{
  return self->_statusBarPartStyles;
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (id)debugMenuHandler
{
  return self->_debugMenuHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debugMenuHandler, 0);
  objc_storeStrong((id *)&self->_statusBarPartStyles, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end