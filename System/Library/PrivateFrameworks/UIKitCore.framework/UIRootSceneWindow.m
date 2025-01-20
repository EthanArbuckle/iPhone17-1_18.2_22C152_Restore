@interface UIRootSceneWindow
+ (BOOL)_isSecure;
+ (BOOL)definesDisplayBounds;
- (BOOL)_appearsInLoupe;
- (BOOL)_shouldPrepareScreenForWindow;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)canBecomeKeyWindow;
- (FBSDisplayConfiguration)displayConfiguration;
- (UIMutableTransformer)sceneTransformer;
- (UIRootSceneWindow)initWithDisplay:(id)a3;
- (UIRootSceneWindow)initWithDisplayConfiguration:(id)a3;
- (UIRootSceneWindow)initWithScreen:(id)a3;
- (UIView)_sceneContainerView;
- (id)_focusResponder;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_configureContextOptions:(id)a3;
- (void)_updateTransforms;
- (void)dealloc;
- (void)setFrame:(CGRect)a3;
@end

@implementation UIRootSceneWindow

- (UIRootSceneWindow)initWithDisplay:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIRootSceneWindow.m" lineNumber:34 description:@"you can't call this"];

  return 0;
}

- (UIRootSceneWindow)initWithScreen:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIRootSceneWindow.m" lineNumber:39 description:@"you can't call this"];

  return 0;
}

- (UIRootSceneWindow)initWithDisplayConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIRootSceneWindow;
  v6 = [(_UIRootWindow *)&v15 initWithDisplay:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayConfiguration, a3);
    v8 = objc_alloc_init(UIMutableTransformer);
    sceneTransformer = v7->_sceneTransformer;
    v7->_sceneTransformer = v8;

    [(UIMutableTransformer *)v7->_sceneTransformer _setDelegate:v7];
    v10 = [UIView alloc];
    [(UIView *)v7 bounds];
    uint64_t v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
    sceneContainerView = v7->_sceneContainerView;
    v7->_sceneContainerView = (UIView *)v11;

    [(UIView *)v7->_sceneContainerView setAutoresizingMask:18];
    [(UIView *)v7 addSubview:v7->_sceneContainerView];
    v13 = +[UIColor blackColor];
    [(UIView *)v7 setBackgroundColor:v13];

    [(UIWindow *)v7 setLevel:0.0];
    [(UIView *)v7 setOpaque:1];
  }

  return v7;
}

- (void)dealloc
{
  [(UIMutableTransformer *)self->_sceneTransformer _setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIRootSceneWindow;
  [(_UIRootWindow *)&v3 dealloc];
}

+ (BOOL)definesDisplayBounds
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (id)_focusResponder
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIRootSceneWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (UIRootSceneWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    id v5 = 0;
  }
  else if (v5 == (UIRootSceneWindow *)self->_sceneContainerView)
  {
    id v5 = 0;
  }
  v7 = v5;

  return v7;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v30.receiver = self;
  v30.super_class = (Class)UIRootSceneWindow;
  -[UIWindow setFrame:](&v30, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  v40.origin.double x = v9;
  v40.origin.double y = v11;
  v40.size.double width = v13;
  v40.size.double height = v15;
  v43.origin.double x = v17;
  v43.origin.double y = v19;
  v43.size.double width = v21;
  v43.size.double height = v23;
  if (!CGRectEqualToRect(v40, v43))
  {
    v24 = UIScenePresentationLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v41.origin.double x = v9;
      v41.origin.double y = v11;
      v41.size.double width = v13;
      v41.size.double height = v15;
      v27 = NSStringFromCGRect(v41);
      v42.origin.double x = v17;
      v42.origin.double y = v19;
      v42.size.double width = v21;
      v42.size.double height = v23;
      v28 = NSStringFromCGRect(v42);
      displayConfiguration = self->_displayConfiguration;
      *(_DWORD *)buf = 138544130;
      v32 = v26;
      __int16 v33 = 2114;
      v34 = v27;
      __int16 v35 = 2114;
      v36 = v28;
      __int16 v37 = 2114;
      v38 = displayConfiguration;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_INFO, "[%{public}@] modified frame from %{public}@ to %{public}@ on display: %{public}@", buf, 0x2Au);
    }
  }
}

- (void)_configureContextOptions:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() definesDisplayBounds]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F39E48]];
  }
}

- (void)_updateTransforms
{
  sceneContainerView = self->_sceneContainerView;
  sceneTransformer = self->_sceneTransformer;
  if (sceneTransformer) {
    [(UITransform *)sceneTransformer transform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [(UIView *)sceneContainerView setTransform:v4];
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (UIMutableTransformer)sceneTransformer
{
  return self->_sceneTransformer;
}

- (UIView)_sceneContainerView
{
  return self->_sceneContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTransformer, 0);
  objc_storeStrong((id *)&self->_sceneContainerView, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end