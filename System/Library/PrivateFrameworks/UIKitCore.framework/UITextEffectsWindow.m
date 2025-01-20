@interface UITextEffectsWindow
+ (BOOL)_isSecure;
+ (BOOL)_shouldSoftAssertOnSetScreen;
+ (id)_canvasForScreen:(id)a3;
+ (id)_sharedTextEffectsWindowforWindowScene:(id)a3 allowHosted:(BOOL)a4 forViewService:(BOOL)a5 matchesStatusBarOrientationOnAccess:(BOOL)a6 shouldCreateIfNecessary:(BOOL)a7;
+ (id)activeTextEffectsWindowForScreen:(id)a3;
+ (id)activeTextEffectsWindowForWindowScene:(id)a3;
+ (id)activeTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4;
+ (id)sharedTextEffectsWindow;
+ (id)sharedTextEffectsWindowForScreen:(id)a3;
+ (id)sharedTextEffectsWindowForWindowScene:(id)a3;
+ (id)sharedTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4;
+ (void)lowerTextEffectsWindowsForHideNotificationCenter;
+ (void)raiseTextEffectsWindowsForShowNotificationCenter;
+ (void)releaseSharedInstances;
- (BOOL)_automaticContainerBackgroundIsGlass;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_isFullscreen;
- (BOOL)_isRemoteKeyboardWindow;
- (BOOL)_isTextEffectsWindow;
- (BOOL)_matchingOptions:(id)a3;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_shouldInstallRootPresentationController;
- (BOOL)_shouldResizeWithScene;
- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3;
- (BOOL)enableRemoteHosting;
- (BOOL)isForViewService;
- (BOOL)isFullscreen;
- (BOOL)isInternalWindow;
- (BOOL)sceneIsResizing;
- (CGPoint)_forHostedProcessConvertPoint:(CGPoint)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5;
- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromWindow:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toWindow:(id)a4;
- (CGPoint)hostedViewOrigin;
- (CGPoint)hostedWindowOffset;
- (CGRect)_forHostedProcessConvertRect:(CGRect)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5;
- (CGRect)_sceneBounds;
- (CGRect)_sceneReferenceBounds;
- (CGRect)actualSceneBounds;
- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3;
- (CGRect)actualSceneFrame;
- (CGRect)actualSceneFrameForOrientation:(int64_t)a3;
- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4;
- (CGRect)convertRect:(CGRect)a3 fromWindow:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toView:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toWindow:(id)a4;
- (CGRect)hostedFrame;
- (CGRect)hostedViewReference;
- (CGSize)hostedViewSize;
- (CGSize)keyboardScreenReferenceSize;
- (NSDictionary)_options;
- (UIEdgeInsets)hostedSafeInsets;
- (UIEditingOverlayViewController)editingOverlayViewController;
- (UITextEffectsWindow)initWithFrame:(CGRect)a3;
- (UIWindowScene)_intendedCanvas;
- (double)defaultWindowLevel;
- (double)keyboardWidthForCurrentDevice;
- (double)slideOverWindowVerticalOffset;
- (id)_initBasicWithCanvas:(id)a3 options:(id)a4;
- (id)_initWithCanvas:(id)a3 options:(id)a4;
- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5;
- (id)rootViewController;
- (int64_t)actualSceneOrientation;
- (int64_t)interfaceOrientation;
- (void)_commonInitWithOptions:(id)a3;
- (void)_commonTextEffectsInit;
- (void)_configureContextOptions:(id)a3;
- (void)_didRemoveSubview:(id)a3;
- (void)_didSnapshot;
- (void)_matchDeviceOrientation;
- (void)_restoreWindowLevel;
- (void)_sceneBoundsDidChange;
- (void)_setWindowLevel:(double)a3;
- (void)_sortSubviewsOfView:(id)a3;
- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight;
- (void)_updateTransformLayer;
- (void)_willSnapshot;
- (void)addBottomPadding:(double)a3;
- (void)addSubview:(id)a3;
- (void)becomeKeyWindow;
- (void)dealloc;
- (void)delayHideWindow;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)resetTransform;
- (void)setDefaultWindowLevel:(double)a3;
- (void)setEnableRemoteHosting:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHostedSafeInsets:(UIEdgeInsets)a3;
- (void)setHostedSceneSize:(CGSize)a3;
- (void)setHostedViewOrigin:(CGPoint)a3;
- (void)setHostedViewReference:(CGRect)a3;
- (void)setHostedViewSize:(CGSize)a3;
- (void)setHostedWindowOffset:(CGPoint)a3;
- (void)sortSubviews;
- (void)updateEditingOverlayContainer;
- (void)updateForOrientation:(int64_t)a3;
- (void)updateForOrientation:(int64_t)a3 forceResetTransform:(BOOL)a4;
- (void)updateLastRemoteView:(BOOL)a3 forView:(id)a4 inContainer:(id)a5;
@end

@implementation UITextEffectsWindow

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)UITextEffectsWindow;
  [(UIView *)&v2 layoutSubviews];
}

- (id)rootViewController
{
  v4.receiver = self;
  v4.super_class = (Class)UITextEffectsWindow;
  objc_super v2 = [(UIWindow *)&v4 rootViewController];
  return v2;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)isInternalWindow
{
  return 0;
}

- (void)didAddSubview:(id)a3
{
  if (!*(&self->super._unknownOrientation + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextEffectsWindow;
    [(UIView *)&v4 didAddSubview:a3];
    if (!*(void *)&self->_inDealloc || [(UIView *)self isHidden])
    {
      [(UIWindow *)self setBecomeKeyOnOrderFront:0];
      [(UIWindow *)self orderFront:0];
    }
    [(UITextEffectsWindow *)self sortSubviews];
    ++*(void *)&self->_inDealloc;
  }
}

- (void)_sortSubviewsOfView:(id)a3
{
  id v3 = a3;
  id v6 = [v3 layer];
  objc_super v4 = [v6 sublayers];
  v5 = (void *)[v4 mutableCopy];

  [v5 sortUsingSelector:sel_compareTextEffectsOrdering_];
  [v6 setSublayers:v5];
  [v3 _invalidateSubviewCache];
}

- (void)sortSubviews
{
}

- (int64_t)interfaceOrientation
{
  if (!self->super._unknownOrientation) {
    return self->super._interfaceOrientation;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextEffectsWindow;
  return [(UIWindow *)&v3 interfaceOrientation];
}

+ (id)sharedTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  +[UIWindowScene _keyWindowScene]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7 == v6;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 windows];
    v10 = [v9 firstObject];

    if ([v10 _isRemoteKeyboardWindow]
      && ![v10 _isHostedInAnotherProcess])
    {
      goto LABEL_8;
    }
  }
  if (!v6)
  {
    +[UIWindowScene _keyWindowScene]();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v8 = 1;
  }
  v10 = [a1 _sharedTextEffectsWindowforWindowScene:v6 allowHosted:1 forViewService:v4 matchesStatusBarOrientationOnAccess:v8 shouldCreateIfNecessary:1];
LABEL_8:

  return v10;
}

+ (id)_sharedTextEffectsWindowforWindowScene:(id)a3 allowHosted:(BOOL)a4 forViewService:(BOOL)a5 matchesStatusBarOrientationOnAccess:(BOOL)a6 shouldCreateIfNecessary:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (!v11)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v12 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
    id v11 = (id)[v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v12);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v16 = [v15 keyboardSceneDelegate];

          if (v16)
          {
            id v11 = v15;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  v17 = [v11 session];
  v18 = [v17 role];
  int v19 = [v18 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

  if ([(id)objc_opt_class() _suppressesTextEffectsWindow]) {
    goto LABEL_23;
  }
  if (v10)
  {
    v20 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v11];
    char v21 = [v20 useHostedInstance];

    if (v21) {
      BOOL v9 = 0;
    }
  }
  uint64_t v22 = objc_opt_class();
  if (!v22)
  {
LABEL_23:
    v28 = 0;
  }
  else
  {
    uint64_t v23 = v22;
    uint64_t v24 = v7 & ~v19;
    v34[0] = @"Level";
    v25 = [NSNumber numberWithDouble:10.0];
    v35[0] = v25;
    v35[1] = MEMORY[0x1E4F1CC28];
    v34[1] = @"Opaque";
    v34[2] = @"Fullscreen";
    v35[2] = MEMORY[0x1E4F1CC28];
    v34[3] = @"ViewService";
    v26 = [NSNumber numberWithBool:v9];
    v35[3] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];

    v28 = +[_UIObjectPerCanvas objectOfClass:v23 forCanvas:v11 withOptions:v27 createIfNecessary:v24];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v28 setWindowLevel:-10000003.0];
    }
    if (v8) {
      [v28 _matchDeviceOrientation];
    }
  }
  return v28;
}

- (void)updateForOrientation:(int64_t)a3
{
}

- (void)_matchDeviceOrientation
{
  int64_t v3 = [(UIView *)self _keyboardOrientation];
  [(UITextEffectsWindow *)self updateForOrientation:v3];
}

- (void)updateForOrientation:(int64_t)a3 forceResetTransform:(BOOL)a4
{
  if (self->super._interfaceOrientation == a3 && !self->super._unknownOrientation)
  {
    if (a4)
    {
      [(UIWindow *)self setupForOrientation:a3];
      self->super._unknownOrientation = [(UIWindow *)self inhibitTextEffectsRotation];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextEffectsWindow;
    -[UIAutoRotatingWindow updateForOrientation:](&v7, sel_updateForOrientation_, a3, a4);
    self->super._interfaceOrientation = a3;
    self->super._unknownOrientation = [(UIWindow *)self inhibitTextEffectsRotation];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UITextEffectsWindowDidRotateNotification" object:self];
  }
}

- (UIWindowScene)_intendedCanvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_perCanvasOptions);
  return (UIWindowScene *)WeakRetained;
}

- (BOOL)_matchingOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"Level"];
  id v6 = [v4 objectForKey:@"Fullscreen"];
  objc_super v7 = [v4 objectForKey:@"ViewService"];

  [v5 floatValue];
  double v9 = v8;
  [(UITextEffectsWindow *)self defaultWindowLevel];
  if (v10 == v9
    && ([v7 floatValue], v11 == (float)-[UITextEffectsWindow isForViewService](self, "isForViewService")))
  {
    int v12 = [v6 BOOLValue];
    int v13 = v12 ^ [(UITextEffectsWindow *)self isFullscreen] ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isForViewService
{
  return BYTE1(self->_activeEffectsCount);
}

- (BOOL)isFullscreen
{
  return self->_activeEffectsCount;
}

- (double)defaultWindowLevel
{
  return *(double *)&self->_isFullscreen;
}

- (void)_configureContextOptions:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v5 _configureContextOptions:v4];
  if ([(UIWindow *)self _isHostedInAnotherProcess]) {
    [v4 setObject:*MEMORY[0x1E4F1CFC8] forKey:*MEMORY[0x1E4F39E68]];
  }
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 0;
}

- (CGRect)_sceneBounds
{
  int64_t v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  if (v5)
  {
    v24.receiver = self;
    v24.super_class = (Class)UITextEffectsWindow;
    [(UIWindow *)&v24 _sceneBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      int64_t viewOrientation = self->super.super.super._viewOrientation;
      if ([(UIWindow *)self _isHostedInAnotherProcess]) {
        int64_t viewOrientation = self->super._interfaceOrientation;
      }
      v15 = [(UIWindow *)self screen];
      [v15 _boundsForInterfaceOrientation:viewOrientation];
    }
    else
    {
      v15 = [(UIWindow *)self screen];
      [v15 bounds];
    }
    double v7 = v16;
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
  }
  double v20 = v7;
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_shouldResizeWithScene
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard isInputSystemUI])
  {
    int v3 = 1;
  }
  else
  {
    id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int v5 = [v4 visualModeManager];
    int v3 = [v5 windowingModeEnabled];
  }
  [(UIView *)self frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14 = [(UIWindow *)self screen];
  [v14 bounds];
  v32.origin.x = v15;
  v32.origin.y = v16;
  v32.size.width = v17;
  v32.size.height = v18;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  int v19 = (CGRectEqualToRect(v31, v32) | v3) ^ 1;

  if ((v3 & 1) != 0 || v19)
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextEffectsWindow;
    BOOL v20 = [(UIWindow *)&v23 _shouldResizeWithScene];
  }
  else
  {
    BOOL v20 = 0;
  }
  double v21 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    BOOL v25 = v20;
    __int16 v26 = 1024;
    int v27 = v3;
    __int16 v28 = 1024;
    int v29 = v19;
    _os_log_debug_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEBUG, "TEW _shouldResizeWithScene %d (windowingModeEnabled: %d, resizeFor: %d)", buf, 0x14u);
  }

  return v20;
}

- (BOOL)_shouldInstallRootPresentationController
{
  return 0;
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  int v5 = [v4 superview];
  if (v5 == self)
  {
  }
  else
  {
    double v6 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      ++self->__intendedWindowScene;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UITextEffectsWindow *)self updateLastRemoteView:1 forView:v4 inContainer:self];
  }
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindow;
  [(UIView *)&v8 addSubview:v4];
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if ([(id)UIApp _isSpringBoard]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  return [(UIApplicationRotationFollowingWindow *)&v6 _shouldAutorotateToInterfaceOrientation:a3];
}

- (CGRect)_sceneReferenceBounds
{
  int v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextEffectsWindow;
    [(UIWindow *)&v23 _sceneReferenceBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v14 = [(UIWindow *)self screen];
    [v14 _referenceBounds];
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (id)activeTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  +[UIWindowScene _keyWindowScene]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7 == v6;

  if (!v6)
  {
    +[UIWindowScene _keyWindowScene]();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v8 = 1;
  }
  double v9 = [a1 _sharedTextEffectsWindowforWindowScene:v6 allowHosted:1 forViewService:v4 matchesStatusBarOrientationOnAccess:v8 shouldCreateIfNecessary:0];

  return v9;
}

+ (id)activeTextEffectsWindowForWindowScene:(id)a3
{
  return (id)[a1 activeTextEffectsWindowForWindowScene:a3 forViewService:0];
}

- (BOOL)_isTextEffectsWindow
{
  return 1;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(UITextEffectsWindow *)self _initBasicWithCanvas:v6 options:v7];
  double v9 = v8;
  if (v8)
  {
    objc_storeWeak(v8 + 122, v6);
    objc_storeStrong(v9 + 121, a4);
    double v10 = [v7 objectForKey:@"Fullscreen"];
    *((unsigned char *)v9 + 936) = [v10 BOOLValue];

    double v11 = [v7 objectForKey:@"ViewService"];
    *((unsigned char *)v9 + 937) = [v11 BOOLValue];

    [v9 _commonInitWithOptions:v7];
    double v12 = v9;
  }

  return v9;
}

- (id)_initBasicWithCanvas:(id)a3 options:(id)a4
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v7 = a3;
  BOOL v8 = [v7 coordinateSpace];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  id v13 = -[UITextEffectsWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", 0, v7, v5, v6, v10, v12);
  id v14 = v13;
  double v15 = v14;
  if (v14)
  {
    [v14 setPriorityLevel:5];
    [v15 _adjustFramePositionIfNecessary];
  }

  return v15;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22[2] = *MEMORY[0x1E4F143B8];
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)UITextEffectsWindow;
  -[UIWindow setFrame:](&v20, sel_setFrame_, x, y, width, height);
  v23.origin.double x = v9;
  v23.origin.double y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  if (!CGRectEqualToRect(v23, v24))
  {
    double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v21[0] = @"UITextEffectsWindowFrameDidChangeNotificationFromFrame";
    double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v9, v11, v13, v15);
    v21[1] = @"UITextEffectsWindowFrameDidChangeNotificationToFrame";
    v22[0] = v17;
    double v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    v22[1] = v18;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v16 postNotificationName:@"UITextEffectsWindowFrameDidChangeNotification" object:self userInfo:v19];
  }
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindow;
  id v5 = -[UIAutoRotatingWindow _initWithFrame:debugName:windowScene:](&v8, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5) {
    [v5 _commonTextEffectsInit];
  }
  return v6;
}

- (void)_commonTextEffectsInit
{
  *(void *)&self->_inDealloc = 0;
  *(void *)&self->_isFullscreen = 0x4024000000000000;
  [(UIApplicationRotationFollowingWindow *)self setLimitToWindowLevel:1];
}

- (void)_commonInitWithOptions:(id)a3
{
  id v19 = a3;
  BOOL v4 = [v19 objectForKey:@"Level"];
  [v4 floatValue];
  double v6 = v5;

  id v7 = [v19 objectForKey:@"Opaque"];
  [(UIView *)self setUserInteractionEnabled:1];
  [(UIWindow *)self setWindowLevel:v6];
  [(UITextEffectsWindow *)self setDefaultWindowLevel:v6];
  if (v7) {
    -[UIView setOpaque:](self, "setOpaque:", [v7 BOOLValue]);
  }
  [(UIWindow *)self setHidden:0];
  objc_super v8 = objc_alloc_init(UIInputWindowController);
  double v9 = [v19 objectForKey:@"Notify"];
  double v10 = v9;
  if (v9) {
    -[UIInputWindowController setShouldNotifyRemoteKeyboards:](v8, "setShouldNotifyRemoteKeyboards:", [v9 BOOLValue]);
  }
  [(UIWindow *)self setRootViewController:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_perCanvasOptions);
  double v12 = [WeakRetained screen];
  uint64_t v13 = [v12 _userInterfaceIdiom];

  if (v13 != 3 && !BYTE1(self->_activeEffectsCount))
  {
    double v14 = objc_opt_class();
    if (([v14 isEqual:objc_opt_class()] & 1) != 0
      || (double v15 = objc_opt_class(), [v15 isEqual:objc_opt_class()]))
    {
      double v16 = objc_alloc_init(UIEditingOverlayViewController);
      double v17 = *(void **)&self->_manualHostingOverride;
      *(void *)&self->_manualHostingOverride = v16;

      double v18 = [(UITextEffectsWindow *)self rootViewController];
      [v18 presentViewController:*(void *)&self->_manualHostingOverride];
    }
  }
}

- (void)setDefaultWindowLevel:(double)a3
{
  *(double *)&self->_isFullscreen = a3;
}

- (void)_sceneBoundsDidChange
{
  LOBYTE(self->_bottomConstraint) = 1;
  v12.receiver = self;
  v12.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v12 _sceneBoundsDidChange];
  int v3 = [(UITextEffectsWindow *)self rootViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    float v5 = [(UITextEffectsWindow *)self rootViewController];
    [v5 hostAppSceneBoundsChanged];
  }
  [(UITextEffectsWindow *)self _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight];
  [(UITextEffectsWindow *)self updateEditingOverlayContainer];
  double v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v7 = [v6 visualModeManager];
  int v8 = [v7 windowingModeEnabled];

  if (v8)
  {
    double v9 = [(UITextEffectsWindow *)self rootViewController];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(UITextEffectsWindow *)self rootViewController];
      [v11 hostAppSceneBoundsChanged];
    }
  }
  LOBYTE(self->_bottomConstraint) = 0;
}

- (void)_updateTransformLayer
{
  int v3 = [(UIView *)self layer];
  char v4 = [v3 superlayer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  v21.receiver = self;
  v21.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v21 _updateTransformLayer];
  double v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v10 = [v9 visualModeManager];
  char v11 = [v10 windowingModeEnabled];

  if ((v11 & 1) == 0)
  {
    objc_super v12 = [(UIView *)self layer];
    uint64_t v13 = [v12 superlayer];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;

    if (v6 != v15 || v8 != v17)
    {
      double v18 = [(UITextEffectsWindow *)self rootViewController];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        objc_super v20 = [(UITextEffectsWindow *)self rootViewController];
        [v20 hostAppSceneBoundsChanged];
      }
    }
  }
  [(UITextEffectsWindow *)self updateEditingOverlayContainer];
}

- (void)updateEditingOverlayContainer
{
  id v6 = [(UIWindow *)self traitCollection];
  if ([v6 userInterfaceIdiom] == 3)
  {
  }
  else
  {
    int v3 = objc_opt_class();
    if ([v3 isEqual:objc_opt_class()])
    {
    }
    else
    {
      uint64_t v4 = objc_opt_class();
      LOBYTE(v4) = [(id)v4 isEqual:objc_opt_class()];

      if ((v4 & 1) == 0) {
        return;
      }
    }
    double v5 = *(void **)&self->_manualHostingOverride;
    if (v5)
    {
      [v5 updateEditingOverlayContainer];
    }
  }
}

+ (BOOL)_isSecure
{
  return 1;
}

- (CGRect)actualSceneBounds
{
  [(UITextEffectsWindow *)self actualSceneFrame];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.size.double height = v3;
  result.size.double width = v2;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight
{
  if (([(id)UIApp _isClassic] & 1) == 0)
  {
    id v16 = [(UITextEffectsWindow *)self rootViewController];
    if (![(UIWindow *)self _isHostedInAnotherProcess]
      || (objc_opt_respondsToSelector() & 1) == 0
      || ([v16 isRotating] & 1) == 0)
    {
      [(UITextEffectsWindow *)self actualSceneFrameForOrientation:[(UITextEffectsWindow *)self interfaceOrientation]];
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
      if (!CGRectIsEmpty(v18))
      {
        double v7 = [(UIWindow *)self _keyboardSceneSettings];

        if (v7)
        {
          double v8 = +[UIDevice currentDevice];
          uint64_t v9 = [v8 userInterfaceIdiom];

          if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            char v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
            char v11 = [v10 visualModeManager];
            char v12 = [v11 shouldShowWithinAppWindow];

            double v13 = 0.0;
            if ((v12 & 1) == 0)
            {
              v19.origin.CGFloat x = x;
              v19.origin.CGFloat y = y;
              v19.size.CGFloat width = width;
              v19.size.CGFloat height = height;
              double MinY = CGRectGetMinY(v19);
              [(UITextEffectsWindow *)self _sceneBounds];
              double MaxY = CGRectGetMaxY(v20);
              v21.origin.CGFloat x = x;
              v21.origin.CGFloat y = y;
              v21.size.CGFloat width = width;
              v21.size.CGFloat height = height;
              double v13 = MinY + MaxY - CGRectGetMaxY(v21);
            }
            [(UITextEffectsWindow *)self addBottomPadding:v13];
          }
        }
      }
    }
  }
}

- (CGRect)actualSceneFrameForOrientation:(int64_t)a3
{
  double v5 = [(UIWindow *)self _keyboardSceneSettings];
  id v6 = v5;
  if (v5)
  {
    [v5 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(UIWindow *)self screen];
    [v15 _referenceBounds];
    double v17 = v16;
    double v19 = v18;

    double v20 = v8;
    double v21 = v12;
    switch(a3)
    {
      case 0:
      case 1:
        break;
      case 2:
        double v20 = v17 - (v8 + v12);
        double v10 = v19 - (v10 + v14);
        double v21 = v12;
        break;
      case 3:
        double v20 = v10;
        double v10 = v17 - (v8 + v12);
        goto LABEL_14;
      case 4:
        double v20 = v19 - (v10 + v14);
        double v10 = v8;
LABEL_14:
        double v21 = v14;
        double v14 = v12;
        break;
      default:
        double v20 = *MEMORY[0x1E4F1DB20];
        double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        break;
    }
  }
  else if (![(UIWindow *)self _isHostedInAnotherProcess] {
         || (([(UITextEffectsWindow *)self hostedViewSize], v23 == *MEMORY[0x1E4F1DB30])
  }
           ? (BOOL v24 = v22 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
           : (BOOL v24 = 0),
             v24))
  {
    [(UIView *)self bounds];
    double v20 = v29;
    double v10 = v30;
    double v21 = v31;
    double v14 = v32;
  }
  else
  {
    [(UITextEffectsWindow *)self hostedSafeInsets];
    double v20 = v25;
    [(UITextEffectsWindow *)self hostedSafeInsets];
    double v10 = v26;
    [(UITextEffectsWindow *)self hostedViewSize];
    double v21 = v27;
    [(UITextEffectsWindow *)self hostedViewSize];
    double v14 = v28;
  }

  double v33 = v20;
  double v34 = v10;
  double v35 = v21;
  double v36 = v14;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (CGRect)actualSceneFrame
{
  int64_t v3 = [(UITextEffectsWindow *)self actualSceneOrientation];
  [(UITextEffectsWindow *)self actualSceneFrameForOrientation:v3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (int64_t)actualSceneOrientation
{
  if (![(id)UIApp _isSpringBoard])
  {
    double v6 = [(UIWindow *)self _keyboardSceneSettings];
    id v5 = v6;
LABEL_8:
    int64_t v8 = [v6 interfaceOrientation];
    goto LABEL_10;
  }
  int64_t v3 = [(id)UIApp keyWindow];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v7 = [(UITextEffectsWindow *)self rootViewController];
    -[UIViewController _windowForAutorotationBelowWindow:](v7, self);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([v5 _windowOwnsInterfaceOrientation])
  {
    double v6 = v5;
    goto LABEL_8;
  }
  double v9 = [v5 _keyboardSceneSettings];
  int64_t v8 = [v9 interfaceOrientation];

LABEL_10:
  if (v8) {
    return v8;
  }
  return [(UITextEffectsWindow *)self interfaceOrientation];
}

- (NSDictionary)_options
{
  return (NSDictionary *)*(id *)&self->_hostedViewOrigin.y;
}

- (CGPoint)hostedWindowOffset
{
  int64_t v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  if (v5)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(UITextEffectsWindow *)self hostedViewOrigin];
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (void)setHostedSafeInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_hostedSceneSize.CGFloat height = a3;
  [(UIView *)self _updateSafeAreaInsets];
  id v4 = [(UITextEffectsWindow *)self rootViewController];
  [v4 _updateContentOverlayInsetsForSelfAndChildren];
}

- (void)setHostedViewOrigin:(CGPoint)a3
{
  if (a3.x != self->_defaultWindowLevel || a3.y != self->_hostedViewOrigin.x)
  {
    *(CGPoint *)&self->_defaultWindowLevel = a3;
    id v4 = [(UITextEffectsWindow *)self rootViewController];
    [v4 hostedOriginDidUpdate];
  }
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UITextEffectsWindow;
  id v4 = -[UIAutoRotatingWindow _initWithFrame:attached:](&v7, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v5 = v4;
  if (v4) {
    [v4 _commonTextEffectsInit];
  }
  return v5;
}

- (UITextEffectsWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  int64_t v3 = -[UIWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(UITextEffectsWindow *)v3 _commonTextEffectsInit];
  }
  return v4;
}

- (void)dealloc
{
  *(&self->super._unknownOrientation + 1) = 1;
  v2.receiver = self;
  v2.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v2 dealloc];
}

- (BOOL)enableRemoteHosting
{
  return LOBYTE(self->_hostedViewSize.height)
      || [(UIWindow *)self _isHostedInAnotherProcess];
}

- (void)setEnableRemoteHosting:(BOOL)a3
{
  LOBYTE(self->_hostedViewSize.height) = a3;
}

+ (BOOL)_shouldSoftAssertOnSetScreen
{
  return 0;
}

- (void)_setWindowLevel:(double)a3
{
  [(UIWindow *)self windowLevel];
  if (v5 != a3)
  {
    if (self->__intendedWindowScene && (unint64_t v6 = self->_activeRemoteViewCount, v6 != 5))
    {
      if (v6 <= 4)
      {
        [(UIWindow *)self windowLevel];
        unint64_t activeRemoteViewCount = self->_activeRemoteViewCount;
        self->_unint64_t activeRemoteViewCount = activeRemoteViewCount + 1;
        *(&self->_windowLevelCount + activeRemoteViewCount) = v8;
      }
    }
    else
    {
      self->_unint64_t activeRemoteViewCount = 0;
    }
    [(UIWindow *)self setWindowLevel:a3];
  }
}

- (void)_restoreWindowLevel
{
  double v2 = 10.0;
  if (self->__intendedWindowScene)
  {
    unint64_t activeRemoteViewCount = self->_activeRemoteViewCount;
    if (activeRemoteViewCount)
    {
      unint64_t v4 = activeRemoteViewCount - 1;
      self->_unint64_t activeRemoteViewCount = v4;
      double v2 = *((double *)&self->_windowLevelCount + v4);
    }
  }
  [(UIWindow *)self setWindowLevel:v2];
}

- (void)addBottomPadding:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_editingOverlayViewController = &self->_editingOverlayViewController;
  editingOverlayViewController = self->_editingOverlayViewController;
  if (!editingOverlayViewController)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v6 = [(UIView *)self constraints];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v11 firstAttribute] == 4) {
            objc_storeStrong((id *)p_editingOverlayViewController, v11);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    editingOverlayViewController = *p_editingOverlayViewController;
  }
  [(UIEditingOverlayViewController *)editingOverlayViewController setConstant:-a3];
}

- (CGRect)hostedFrame
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UITextEffectsWindow *)self enableRemoteHosting])
  {
    [(UITextEffectsWindow *)self hostedViewOrigin];
    double v10 = v10 - v11;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGPoint)_forHostedProcessConvertPoint:(CGPoint)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  if (([a4 _isTextEffectsWindow] & 1) == 0)
  {
    [(UITextEffectsWindow *)self hostedViewOrigin];
    double v10 = v9;
    [(UITextEffectsWindow *)self hostedViewOrigin];
    double v12 = -v11;
    double v13 = -v10;
    if (v5) {
      double v13 = v10;
    }
    double x = x + v13;
    if (v5) {
      double v12 = v11;
    }
    double y = y + v12;
  }
  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGRect)_forHostedProcessConvertRect:(CGRect)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", a4, a5, a3.origin.x, a3.origin.y);
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromWindow:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", v7, 1, x, y);
  v14.receiver = self;
  v14.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertPoint:fromWindow:](&v14, sel_convertPoint_fromWindow_, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toWindow:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", v7, 0, x, y);
  v14.receiver = self;
  v14.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertPoint:toWindow:](&v14, sel_convertPoint_toWindow_, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [v7 _window];
  double v9 = v8;
  if (!v7 || v8 == self)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITextEffectsWindow;
    -[UIView convertPoint:toView:](&v22, sel_convertPoint_toView_, v7, x, y);
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v10 = [(UIWindow *)v9 _hostingWindow];
      double v11 = (void *)v10;
      if (v10) {
        double v12 = (void *)v10;
      }
      else {
        double v12 = v9;
      }
      double v13 = v12;
    }
    else
    {
      double v13 = v9;
    }
    -[UITextEffectsWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v9, x, y);
    -[UITextEffectsWindow convertPoint:toView:](v13, "convertPoint:toView:", v7);
    double v15 = v18;
    double v17 = v19;
  }
  double v20 = v15;
  double v21 = v17;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [v7 _window];
  double v9 = v8;
  if (!v7 || v8 == self)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITextEffectsWindow;
    -[UIView convertPoint:fromView:](&v22, sel_convertPoint_fromView_, v7, x, y);
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v10 = [(UIWindow *)v9 _hostingWindow];
      double v11 = (void *)v10;
      if (v10) {
        double v12 = (void *)v10;
      }
      else {
        double v12 = v9;
      }
      double v13 = v12;
    }
    else
    {
      double v13 = v9;
    }
    -[UITextEffectsWindow convertPoint:fromView:](v9, "convertPoint:fromView:", v7, x, y);
    -[UITextEffectsWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v13);
    double v15 = v18;
    double v17 = v19;
  }
  double v20 = v15;
  double v21 = v17;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromWindow:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if ([(id)UIApp _isSpringBoard])
  {
    uint64_t v10 = [v9 _hostingWindow];
    double v11 = (void *)v10;
    if (v10) {
      double v12 = (void *)v10;
    }
    else {
      double v12 = v9;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = v9;
  }
  -[UITextEffectsWindow _forHostedProcessConvertRect:forWindow:wasFromWindow:](self, "_forHostedProcessConvertRect:forWindow:wasFromWindow:", v13, 1, x, y, width, height);
  v26.receiver = self;
  v26.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertRect:fromWindow:](&v26, sel_convertRect_fromWindow_, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toWindow:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if ([(id)UIApp _isSpringBoard])
  {
    uint64_t v10 = [v9 _hostingWindow];
    double v11 = (void *)v10;
    if (v10) {
      double v12 = (void *)v10;
    }
    else {
      double v12 = v9;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = v9;
  }
  -[UITextEffectsWindow _forHostedProcessConvertRect:forWindow:wasFromWindow:](self, "_forHostedProcessConvertRect:forWindow:wasFromWindow:", v13, 0, x, y, width, height);
  v26.receiver = self;
  v26.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertRect:toWindow:](&v26, sel_convertRect_toWindow_, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = [v9 _window];
  double v11 = v10;
  if (!v9 || v10 == self)
  {
    v32.receiver = self;
    v32.super_class = (Class)UITextEffectsWindow;
    -[UIView convertRect:toView:](&v32, sel_convertRect_toView_, v9, x, y, width, height);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v12 = [(UIWindow *)v11 _hostingWindow];
      id v13 = (void *)v12;
      if (v12) {
        double v14 = (void *)v12;
      }
      else {
        double v14 = v11;
      }
      double v15 = v14;
    }
    else
    {
      double v15 = v11;
    }
    -[UITextEffectsWindow convertRect:toWindow:](self, "convertRect:toWindow:", v15, x, y, width, height);
    -[UITextEffectsWindow convertRect:toView:](v11, "convertRect:toView:", v9);
    double v17 = v24;
    double v19 = v25;
    double v21 = v26;
    double v23 = v27;
  }
  double v28 = v17;
  double v29 = v19;
  double v30 = v21;
  double v31 = v23;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = [v9 _window];
  double v11 = v10;
  if (!v9 || v10 == self)
  {
    v32.receiver = self;
    v32.super_class = (Class)UITextEffectsWindow;
    -[UIView convertRect:fromView:](&v32, sel_convertRect_fromView_, v9, x, y, width, height);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v12 = [(UIWindow *)v11 _hostingWindow];
      id v13 = (void *)v12;
      if (v12) {
        double v14 = (void *)v12;
      }
      else {
        double v14 = v11;
      }
      double v15 = v14;
    }
    else
    {
      double v15 = v11;
    }
    -[UITextEffectsWindow convertRect:fromView:](v11, "convertRect:fromView:", v9, x, y, width, height);
    -[UITextEffectsWindow convertRect:fromWindow:](self, "convertRect:fromWindow:", v15);
    double v17 = v24;
    double v19 = v25;
    double v21 = v26;
    double v23 = v27;
  }
  double v28 = v17;
  double v29 = v19;
  double v30 = v21;
  double v31 = v23;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGSize)keyboardScreenReferenceSize
{
  double v2 = [(UIWindow *)self screen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)keyboardWidthForCurrentDevice
{
  [(UIView *)self bounds];
  return v2;
}

- (void)becomeKeyWindow
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    double v5 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    double v6 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "UITextEffectsWindow should not become key. Please file a bug to Keyboard | iOS with this call stack: %@", buf, 0xCu);
LABEL_4:

LABEL_5:
    goto LABEL_6;
  }
  double v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &becomeKeyWindow___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    double v4 = (void *)MEMORY[0x1E4F29060];
    double v5 = v3;
    double v6 = [v4 callStackSymbols];
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "UITextEffectsWindow should not become key. Please file a bug to Keyboard | iOS with this call stack: %@", buf, 0xCu);
    goto LABEL_4;
  }
LABEL_6:
  v7.receiver = self;
  v7.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v7 becomeKeyWindow];
}

- (void)delayHideWindow
{
  if (!*(void *)&self->_inDealloc) {
    [(UIWindow *)self setHidden:1];
  }
}

- (void)updateLastRemoteView:(BOOL)a3 forView:(id)a4 inContainer:(id)a5
{
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([(id)UIApp _isSpringBoard])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(v8, "subviews", 0);
    uint64_t v10 = [v9 reverseObjectEnumerator];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v16 + 1) + 8 * i);
          if (v15 != v7)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v15 setHidden:v6];
              goto LABEL_13;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)_didRemoveSubview:(id)a3
{
  id v4 = a3;
  if (!*(&self->super._unknownOrientation + 1))
  {
    v6.receiver = self;
    v6.super_class = (Class)UITextEffectsWindow;
    [(UIAutoRotatingWindow *)&v6 _didRemoveSubview:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      --self->__intendedWindowScene;
      [(UITextEffectsWindow *)self updateLastRemoteView:0 forView:v4 inContainer:self];
    }
    uint64_t v5 = *(void *)&self->_inDealloc - 1;
    *(void *)&self->_inDealloc = v5;
    if (!v5 && ![(UIWindow *)self _isHostedInAnotherProcess]) {
      [(UITextEffectsWindow *)self performSelector:sel_delayHideWindow withObject:0 afterDelay:0.1];
    }
  }
}

- (void)resetTransform
{
  int64_t v3 = [(UIView *)self _keyboardOrientation];
  [(UITextEffectsWindow *)self updateForOrientation:v3 forceResetTransform:1];
}

+ (id)sharedTextEffectsWindowForWindowScene:(id)a3
{
  return (id)[a1 sharedTextEffectsWindowForWindowScene:a3 forViewService:0];
}

+ (id)sharedTextEffectsWindow
{
  return (id)[a1 sharedTextEffectsWindowForScreen:0];
}

+ (id)_canvasForScreen:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[UIScreen mainScreen];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 screen];

        if (v9 == v3)
        {
          id v5 = v8;
          goto LABEL_13;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

+ (id)sharedTextEffectsWindowForScreen:(id)a3
{
  id v4 = a3;
  id v5 = +[UIScreen mainScreen];
  BOOL v6 = v5 == v4;

  if (!v4)
  {
    id v4 = +[UIScreen mainScreen];
    BOOL v6 = 1;
  }
  id v7 = [a1 _canvasForScreen:v4];
  id v8 = [a1 _sharedTextEffectsWindowforWindowScene:v7 allowHosted:1 forViewService:0 matchesStatusBarOrientationOnAccess:v6 shouldCreateIfNecessary:1];

  return v8;
}

+ (id)activeTextEffectsWindowForScreen:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  BOOL v6 = [a1 _canvasForScreen:v4];

  id v7 = [v5 _sharedTextEffectsWindowforWindowScene:v6 allowHosted:1 forViewService:0 matchesStatusBarOrientationOnAccess:0 shouldCreateIfNecessary:0];

  return v7;
}

- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UITextEffectsWindow *)self actualSceneFrameForOrientation:v3];
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (double)slideOverWindowVerticalOffset
{
  double v3 = 0.0;
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    if ([(UITextEffectsWindow *)self _isTextEffectsWindow])
    {
      double v4 = -[UIWindow _fbsScene]((id *)&self->super.super.super.super.super.super.isa);

      if (v4)
      {
        [(UITextEffectsWindow *)self actualSceneFrame];
        double v6 = v5;
        double v8 = v7;
        if (UIRectIsDiscrete(v9, v5, v10, v7))
        {
          long long v11 = [(UIWindow *)self screen];
          objc_msgSend(v11, "_boundsForInterfaceOrientation:", -[UITextEffectsWindow actualSceneOrientation](self, "actualSceneOrientation"));
          double v13 = v12;

          return v13 - (v6 + v8);
        }
      }
    }
  }
  return v3;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 0;
}

- (BOOL)_automaticContainerBackgroundIsGlass
{
  return 0;
}

+ (void)releaseSharedInstances
{
}

+ (void)raiseTextEffectsWindowsForShowNotificationCenter
{
  id v2 = [a1 sharedTextEffectsWindowForWindowScene:0];
  [v2 setWindowLevel:1060.0];
}

+ (void)lowerTextEffectsWindowsForHideNotificationCenter
{
  id v2 = [a1 sharedTextEffectsWindowForWindowScene:0];
  [v2 setWindowLevel:10.0];
}

- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3
{
  id v4 = a3;
  if ([(UITextEffectsWindow *)self enableRemoteHosting])
  {
    BOOL v5 = 1;
  }
  else if ([(id)UIApp _isSpringBoard])
  {
    double v6 = [v4 _window];
    double v7 = [v6 _hostingWindow];
    BOOL v5 = v7 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_isFullscreen
{
  double v3 = -[UIWindow _fbsScene]((id *)&self->super.super.super.super.super.super.isa);
  id v4 = [v3 settings];

  if (v4)
  {
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(UIWindow *)self screen];
    [v9 _referenceBounds];
    BOOL v12 = v8 == v11 && v6 == v10;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_willSnapshot
{
  double v3 = [(UITextEffectsWindow *)self rootViewController];
  int v4 = [v3 conformsToProtocol:&unk_1ED5DBDA0];

  if (v4)
  {
    double v5 = [(UITextEffectsWindow *)self rootViewController];
    [v5 willSnapshot];
  }
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v6 _willSnapshot];
}

- (void)_didSnapshot
{
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  [(UIWindow *)&v6 _didSnapshot];
  double v3 = [(UITextEffectsWindow *)self rootViewController];
  int v4 = [v3 conformsToProtocol:&unk_1ED5DBDA0];

  if (v4)
  {
    double v5 = [(UITextEffectsWindow *)self rootViewController];
    [v5 didSnapshot];
  }
}

- (CGPoint)hostedViewOrigin
{
  double defaultWindowLevel = self->_defaultWindowLevel;
  double x = self->_hostedViewOrigin.x;
  result.double y = x;
  result.double x = defaultWindowLevel;
  return result;
}

- (CGSize)hostedViewSize
{
  double v2 = self->_windowLevelStack[4];
  double width = self->_hostedViewSize.width;
  result.double height = width;
  result.double width = v2;
  return result;
}

- (void)setHostedViewSize:(CGSize)a3
{
  *(CGSize *)&self->_windowLevelStack[4] = a3;
}

- (UIEdgeInsets)hostedSafeInsets
{
  double height = self->_hostedSceneSize.height;
  double top = self->_hostedSafeInsets.top;
  double left = self->_hostedSafeInsets.left;
  double bottom = self->_hostedSafeInsets.bottom;
  result.right = bottom;
  result.double bottom = left;
  result.double left = top;
  result.double top = height;
  return result;
}

- (CGRect)hostedViewReference
{
  double right = self->_hostedSafeInsets.right;
  double x = self->_hostedViewReference.origin.x;
  double y = self->_hostedViewReference.origin.y;
  double width = self->_hostedViewReference.size.width;
  result.size.double height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = right;
  return result;
}

- (void)setHostedViewReference:(CGRect)a3
{
  *(CGRect *)&self->_hostedSafeInsets.double right = a3;
}

- (void)setHostedWindowOffset:(CGPoint)a3
{
  *(CGPoint *)&self->_sceneIsResizing = a3;
}

- (void)setHostedSceneSize:(CGSize)a3
{
  *(CGSize *)&self->_hostedWindowOffset.double y = a3;
}

- (BOOL)sceneIsResizing
{
  return (BOOL)self->_bottomConstraint;
}

- (UIEditingOverlayViewController)editingOverlayViewController
{
  return *(UIEditingOverlayViewController **)&self->_manualHostingOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingOverlayViewController, 0);
  objc_storeStrong((id *)&self->_manualHostingOverride, 0);
  objc_destroyWeak((id *)&self->_perCanvasOptions);
  objc_storeStrong((id *)&self->_hostedViewOrigin.y, 0);
}

@end