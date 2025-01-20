@interface _UIWindowAnimationController
+ (_UIWindowAnimationController)animationControllerWithWindow:(id)a3;
- (BOOL)shouldCrossfade;
- (UIWindow)window;
- (_UIWindowAnimationController)initWithWindow:(id)a3;
- (double)transitionDuration:(id)a3;
- (void)_performCrossfadeAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4;
- (void)_performLayoutAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4;
- (void)animateTransition:(id)a3;
- (void)setShouldCrossfade:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation _UIWindowAnimationController

+ (_UIWindowAnimationController)animationControllerWithWindow:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWindow:v3];

  return (_UIWindowAnimationController *)v4;
}

- (_UIWindowAnimationController)initWithWindow:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowAnimationController;
  v5 = [(_UIWindowAnimationController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(_UIWindowAnimationController *)v5 setWindow:v4];
    [v4 _setAnimationController:v6];
  }

  return v6;
}

- (void)setWindow:(id)a3
{
  self->_window = (UIWindow *)a3;
}

- (double)transitionDuration:(id)a3
{
  return 0.15;
}

- (void)_performCrossfadeAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_super v8 = [v6 containerView];
  v9 = [UIWindow alloc];
  [v8 frame];
  uint64_t v10 = -[UIWindow initWithFrame:](v9, "initWithFrame:");
  [(id)v10 setHidden:0];
  [v8 level];
  [(id)v10 setLevel:v11 + 1.0];
  v12 = objc_alloc_init(UIViewController);
  if (!_UIAppUseModernRotationAndPresentationBehaviors()) {
    [(UIViewController *)v12 _setAllowsAutorotation:0];
  }
  objc_storeStrong((id *)(v10 + 560), v12);
  objc_storeWeak((id *)(v10 + 440), v12);
  [(id)v10 _updateTransformLayer];
  v13 = *(void **)(v10 + 536);
  v14 = (void *)v8[67];
  if (v14) {
    [v14 affineTransform];
  }
  else {
    memset(v37, 0, sizeof(v37));
  }
  [v13 setAffineTransform:v37];
  [v8 frame];
  objc_msgSend((id)v10, "setFrame:");
  v15 = [v8 snapshotView];
  [v15 setAutoresizingMask:18];
  v16 = [(UIViewController *)v12 view];
  [v16 addSubview:v15];

  v7[2](v7);
  objc_msgSend(v6, "__runAlongsideAnimations");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  [v8 transform];
  CGAffineTransformMakeScale(&v33, 0.0, 0.0);
  [v8 setTransform:&v33];
  v17 = (void *)UIApp;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke;
  v23[3] = &unk_1E52EAA50;
  id v24 = v8;
  id v25 = v15;
  v26 = v12;
  v27 = self;
  id v28 = v6;
  id v29 = (id)v10;
  long long v30 = v34;
  long long v31 = v35;
  long long v32 = v36;
  id v18 = (id)v10;
  id v19 = v6;
  v20 = v12;
  id v21 = v15;
  v22 = v8;
  [v17 _performBlockAfterCATransactionCommits:v23];
}

- (void)_performLayoutAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 containerView];
  [(_UIWindowAnimationController *)self transitionDuration:v8];
  double v11 = v10;
  uint64_t v12 = [v8 _completionCurve] << 16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke;
  v19[3] = &unk_1E52DB330;
  id v21 = v7;
  id v13 = v8;
  id v20 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2;
  v16[3] = &unk_1E52DA660;
  id v17 = v13;
  id v18 = v9;
  id v14 = v9;
  id v15 = v7;
  +[UIView animateWithDuration:v12 delay:v19 options:v16 animations:v11 completion:0.0];
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  [v4 finalFrameForViewController:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v4 containerView];
  if ([v4 isAnimated])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UIWindowAnimationController_animateTransition___block_invoke;
    aBlock[3] = &unk_1E52DA520;
    id v17 = v14;
    double v18 = v7;
    double v19 = v9;
    double v20 = v11;
    double v21 = v13;
    id v15 = _Block_copy(aBlock);
    if ([(_UIWindowAnimationController *)self shouldCrossfade]) {
      [(_UIWindowAnimationController *)self _performCrossfadeAnimationWithContext:v4 windowGeometryUpdatingBlock:v15];
    }
    else {
      [(_UIWindowAnimationController *)self _performLayoutAnimationWithContext:v4 windowGeometryUpdatingBlock:v15];
    }
    [v4 _setTransitionIsInFlight:1];
  }
  else
  {
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
    objc_msgSend(v4, "__runAlongsideAnimations");
    [v4 completeTransition:1];
    [v4 _setAnimator:0];
    [v14 _setAnimationController:0];
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

@end