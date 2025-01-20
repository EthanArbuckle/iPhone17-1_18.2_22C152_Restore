@interface TVRUIAlertAnimationController
- (CGAffineTransform)scaleTransform;
- (TVRMaterialView)backgroundMaterialView;
- (TVRUIAlertAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4;
- (TVRemoteAlertVisualStyleProviding)visualStyle;
- (UIVisualEffectView)foregroundVisualEffectView;
- (double)foregroundBlurRadius;
- (double)transitionDuration:(id)a3;
- (int64_t)animationType;
- (void)_runDismissalAnimationWithTransition:(id)a3;
- (void)_runPresentationAnimationWithTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setBackgroundMaterialView:(id)a3;
- (void)setForegroundBlurRadius:(double)a3;
- (void)setForegroundVisualEffectView:(id)a3;
- (void)setScaleTransform:(CGAffineTransform *)a3;
@end

@implementation TVRUIAlertAnimationController

- (TVRUIAlertAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TVRUIAlertAnimationController;
  v8 = [(TVRUIAlertAnimationController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualStyle, a4);
    v9->_animationType = a3;
    v9->_foregroundBlurRadius = 20.0;
    CGAffineTransformMakeScale(&v12, 1.92, 1.92);
    long long v10 = *(_OWORD *)&v12.c;
    *(_OWORD *)&v9->_scaleTransform.a = *(_OWORD *)&v12.a;
    *(_OWORD *)&v9->_scaleTransform.c = v10;
    *(_OWORD *)&v9->_scaleTransform.tx = *(_OWORD *)&v12.tx;
  }

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([(TVRUIAlertAnimationController *)self animationType]) {
    [(TVRUIAlertAnimationController *)self _runDismissalAnimationWithTransition:v4];
  }
  else {
    [(TVRUIAlertAnimationController *)self _runPresentationAnimationWithTransition:v4];
  }
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)_runPresentationAnimationWithTransition:(id)a3
{
  id v4 = a3;
  v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Animate transition: presenting", buf, 2u);
  }

  v6 = [v4 viewForKey:*MEMORY[0x263F83C18]];
  id v7 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  v8 = [(TVRUIAlertAnimationController *)self backgroundMaterialView];

  if (v8)
  {
    [v7 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(TVRUIAlertAnimationController *)self backgroundMaterialView];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = [(TVRUIAlertAnimationController *)self backgroundMaterialView];
    [v18 setAutoresizingMask:18];

    v19 = [(TVRUIAlertAnimationController *)self backgroundMaterialView];
    [v7 insertSubview:v19 atIndex:0];
  }
  id v20 = objc_alloc(MEMORY[0x263F82E50]);
  v21 = [(TVRUIAlertAnimationController *)self visualStyle];
  v22 = [v21 foregroundVisualEffect];
  v23 = (void *)[v20 initWithEffect:v22];
  [(TVRUIAlertAnimationController *)self setForegroundVisualEffectView:v23];

  [v6 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(TVRUIAlertAnimationController *)self foregroundVisualEffectView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  v33 = [(TVRUIAlertAnimationController *)self foregroundVisualEffectView];
  [v6 addSubview:v33];

  [v6 setAlpha:0.0];
  [(TVRUIAlertAnimationController *)self scaleTransform];
  v45[0] = v45[3];
  v45[1] = v45[4];
  v45[2] = v45[5];
  [v6 setTransform:v45];
  v34 = +[TVRUICubicSpringAnimator standardSpringAnimator];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke;
  v43[3] = &unk_264800638;
  v43[4] = self;
  id v44 = v6;
  id v35 = v6;
  [v34 addAnimations:v43];
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  v39 = __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke_2;
  v40 = &unk_264800660;
  v41 = self;
  id v42 = v4;
  id v36 = v4;
  [v34 addCompletion:&v37];
  objc_msgSend(v34, "startAnimation", v37, v38, v39, v40, v41);
}

uint64_t __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) foregroundVisualEffectView];
  [v2 setEffect:0];

  v3 = [*(id *)(a1 + 32) backgroundMaterialView];
  [v3 setWeighting:1.0];

  [*(id *)(a1 + 40) setAlpha:1.0];
  id v4 = *(void **)(a1 + 40);
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v7[0] = *MEMORY[0x263F000D0];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v4 setTransform:v7];
}

uint64_t __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) foregroundVisualEffectView];
  [v2 removeFromSuperview];

  v3 = *(void **)(a1 + 40);
  return [v3 completeTransition:1];
}

- (void)_runDismissalAnimationWithTransition:(id)a3
{
  id v4 = a3;
  long long v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Animate transition: dismissing", buf, 2u);
  }

  v6 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:0];
  [(TVRUIAlertAnimationController *)self setForegroundVisualEffectView:v7];

  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(TVRUIAlertAnimationController *)self foregroundVisualEffectView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(TVRUIAlertAnimationController *)self foregroundVisualEffectView];
  [v6 addSubview:v17];

  [v6 setAlpha:1.0];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v26[0] = *MEMORY[0x263F000D0];
  v26[1] = v18;
  v26[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v6 setTransform:v26];
  v19 = +[TVRUICubicSpringAnimator standardSpringAnimator];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke;
  v24[3] = &unk_264800638;
  v24[4] = self;
  id v25 = v6;
  id v20 = v6;
  [v19 addAnimations:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke_2;
  v22[3] = &unk_264800688;
  id v23 = v4;
  id v21 = v4;
  [v19 addCompletion:v22];
  [v19 startAnimation];
}

void __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) visualStyle];
  v3 = [v2 foregroundVisualEffect];

  id v4 = [*(id *)(a1 + 32) foregroundVisualEffectView];
  [v4 setEffect:v3];

  long long v5 = [*(id *)(a1 + 32) backgroundMaterialView];
  [v5 setWeighting:0.0];

  [*(id *)(a1 + 40) setAlpha:0.0];
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 scaleTransform];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  id v7 = *(void **)(a1 + 40);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  [v7 setTransform:v8];
}

uint64_t __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (TVRemoteAlertVisualStyleProviding)visualStyle
{
  return self->_visualStyle;
}

- (TVRMaterialView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
}

- (UIVisualEffectView)foregroundVisualEffectView
{
  return self->_foregroundVisualEffectView;
}

- (void)setForegroundVisualEffectView:(id)a3
{
}

- (double)foregroundBlurRadius
{
  return self->_foregroundBlurRadius;
}

- (void)setForegroundBlurRadius:(double)a3
{
  self->_foregroundBlurRadius = a3;
}

- (CGAffineTransform)scaleTransform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setScaleTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_scaleTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_scaleTransform.tx = v4;
  *(_OWORD *)&self->_scaleTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end