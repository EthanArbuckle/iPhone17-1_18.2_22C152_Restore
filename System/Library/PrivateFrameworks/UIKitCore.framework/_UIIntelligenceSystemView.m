@interface _UIIntelligenceSystemView
+ (Class)layerClass;
- (_UIIntelligenceSystemView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5;
- (_UISceneHostingController)_sceneHostingController;
- (id)_connectionActionProvider;
- (id)_sceneLayer;
- (id)transitionerForConnectingHostingController:(id)a3;
- (void)_addSceneViewIfNecessary;
- (void)_didMoveToWindowScene;
- (void)_layerCornerCurveDidChange:(id)a3;
- (void)_layerCornerRadiusDidChange:(double)a3;
- (void)_layerMaskedCornersDidChange:(unint64_t)a3;
- (void)_removeSceneViewIfNecessary;
- (void)didMoveToWindow;
- (void)set_connectionActionProvider:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIIntelligenceSystemView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIIntelligenceSystemView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UIIntelligenceSystemView;
  v13 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = [[_UISceneHostingControllerAdvancedConfiguration alloc] initWithProcessIdentity:v11];
    [(_UISceneHostingControllerAdvancedConfiguration *)v14 setSceneSpecification:v12];
    v15 = [[_UISceneHostingController alloc] initWithAdvancedConfiguration:v14];
    sceneHostingController = v13->_sceneHostingController;
    v13->_sceneHostingController = v15;

    v17 = v13->_sceneHostingController;
    if (v17) {
      v17->_fencesDisabled = 1;
    }
    v18 = objc_alloc_init(_UISceneHostingReconnectingActivationController);
    [(_UISceneHostingReconnectingActivationController *)v18 setDelegate:v13];
    [(_UISceneHostingController *)v13->_sceneHostingController setActivationController:v18];
    [(_UIIntelligenceSystemView *)v13 _addSceneViewIfNecessary];
    v19 = [(UIView *)v13 layer];
    [v19 setAllowsHitTesting:0];

    [(UIView *)v13 setUserInteractionEnabled:0];
  }

  return v13;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  v3 = [(_UIIntelligenceSystemView *)self _connectionActionProvider];
  v4 = v3[2]();

  if ([v4 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIIntelligenceSystemView_transitionerForConnectingHostingController___block_invoke;
    aBlock[3] = &unk_1E5311A88;
    id v8 = v4;
    v5 = _Block_copy(aBlock);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)willMoveToWindow:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIIntelligenceSystemView;
  [(UIView *)&v10 willMoveToWindow:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5 = [(_UISceneHostingController *)self->_sceneHostingController activationStateComponent];
  v6 = [v5 foregroundAssertionForReason:@"Light effect flicker avoidance"];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIIntelligenceSystemView_willMoveToWindow___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_UIIntelligenceSystemView;
  [(UIView *)&v5 didMoveToWindow];
  v3 = [(UIView *)self window];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__didMoveToWindowScene name:0x1ED1601E0 object:v3];
  }
  [(_UIIntelligenceSystemView *)self _didMoveToWindowScene];
}

- (void)_didMoveToWindowScene
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UISceneWillEnterForegroundNotification" object:0];
  [v5 removeObserver:self name:@"UISceneDidEnterBackgroundNotification" object:0];
  v3 = [(UIView *)self window];
  v4 = [v3 windowScene];

  if (v4)
  {
    [v5 addObserver:self selector:sel__removeSceneViewIfNecessary name:@"UISceneDidEnterBackgroundNotification" object:v4];
    [v5 addObserver:self selector:sel__addSceneViewIfNecessary name:@"UISceneWillEnterForegroundNotification" object:v4];
    if ((unint64_t)[v4 activationState] > 1) {
      [(_UIIntelligenceSystemView *)self _removeSceneViewIfNecessary];
    }
    else {
      [(_UIIntelligenceSystemView *)self _addSceneViewIfNecessary];
    }
  }
}

- (void)_removeSceneViewIfNecessary
{
  v2 = [(_UIIntelligenceSystemView *)self _sceneHostingController];
  id v4 = [v2 sceneView];

  v3 = [v4 superview];

  if (v3) {
    [v4 removeFromSuperview];
  }
}

- (void)_addSceneViewIfNecessary
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIIntelligenceSystemView *)self _sceneHostingController];
  id v4 = [v3 sceneView];

  id v5 = [v4 superview];

  if (!v5)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self addSubview:v4];
    v24 = (void *)MEMORY[0x1E4F5B268];
    v29 = [v4 widthAnchor];
    v28 = [(UIView *)self widthAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v30[0] = v27;
    v26 = [v4 heightAnchor];
    v25 = [(UIView *)self heightAnchor];
    v6 = [v26 constraintEqualToAnchor:v25];
    v30[1] = v6;
    id v7 = [v4 centerXAnchor];
    id v8 = [(UIView *)self centerXAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8];
    v30[2] = v9;
    objc_super v10 = [v4 centerYAnchor];
    id v11 = [(UIView *)self centerYAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    v30[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v24 activateConstraints:v13];

    v14 = [(UIView *)self layer];
    [v14 cornerRadius];
    double v16 = v15;
    v17 = [v4 layer];
    [v17 setCornerRadius:v16];

    v18 = [(UIView *)self layer];
    v19 = [v18 cornerCurve];
    v20 = [v4 layer];
    [v20 setCornerCurve:v19];

    objc_super v21 = [(UIView *)self layer];
    uint64_t v22 = [v21 maskedCorners];
    v23 = [v4 layer];
    [v23 setMaskedCorners:v22];
  }
}

- (id)_sceneLayer
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 408) sceneView];
    v2 = [v1 layer];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_layerCornerRadiusDidChange:(double)a3
{
  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setCornerRadius:a3];
}

- (void)_layerCornerCurveDidChange:(id)a3
{
  id v4 = a3;
  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setCornerCurve:v4];
}

- (void)_layerMaskedCornersDidChange:(unint64_t)a3
{
  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMaskedCorners:a3];
}

- (_UISceneHostingController)_sceneHostingController
{
  return self->_sceneHostingController;
}

- (id)_connectionActionProvider
{
  return self->__connectionActionProvider;
}

- (void)set_connectionActionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__connectionActionProvider, 0);
  objc_storeStrong((id *)&self->_sceneHostingController, 0);
}

@end