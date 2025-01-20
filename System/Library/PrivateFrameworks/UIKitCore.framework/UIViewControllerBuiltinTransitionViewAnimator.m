@interface UIViewControllerBuiltinTransitionViewAnimator
- (BOOL)removeFromView;
- (BOOL)transitionViewShouldUseViewControllerCallbacks;
- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5;
- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (UIView)fromView;
- (UIView)toView;
- (UIViewControllerBuiltinTransitionViewAnimator)initWithTransition:(int)a3;
- (double)durationForTransition:(int)a3;
- (double)transitionDuration:(id)a3;
- (id)delegate;
- (int)transition;
- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4;
- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4;
- (void)animateTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFromView:(id)a3;
- (void)setRemoveFromView:(BOOL)a3;
- (void)setToView:(id)a3;
- (void)setTransition:(int)a3;
- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4;
- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6;
- (void)transitionViewDidStart:(id)a3;
@end

@implementation UIViewControllerBuiltinTransitionViewAnimator

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_2;
  v10 = &unk_1E52D9F98;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = v2;
  uint64_t v12 = v3;
  +[UIView performWithoutAnimation:&v7];
  uint64_t v4 = +[UIView _currentViewAnimationState];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  [v1 addSubview:WeakRetained];
}

uint64_t __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    v1 = *(void **)(*(void *)(result + 32) + 8);
    uint64_t v2 = [*(id *)(result + 40) transitionWasCancelled] ^ 1;
    return [v1 completeTransition:v2];
  }
  return result;
}

- (UIViewControllerBuiltinTransitionViewAnimator)initWithTransition:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerBuiltinTransitionViewAnimator;
  uint64_t v4 = [(UIViewControllerBuiltinTransitionViewAnimator *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_transition = a3;
    v6 = v4;
  }

  return v5;
}

- (double)transitionDuration:(id)a3
{
  [(UIViewControllerBuiltinTransitionViewAnimator *)self durationForTransition:self->_transition];
  return result;
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    +[UITransitionView defaultDurationForTransition:v3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained durationForTransition:v3];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4
{
  id v4 = [a3 containerView];
  [v4 _completeRunningTransition];
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      double v8 = [v7 _toView];
      objc_storeWeak((id *)&self->_toView, v8);

      v9 = [v7 _fromView];
      objc_storeWeak((id *)&self->_fromView, v9);
LABEL_6:

      goto LABEL_7;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toView);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v7 = 0;
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_fromView);

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIViewControllerBuiltinTransitionViewAnimator.m" lineNumber:74 description:@"toView or fromView should be set in order for UIViewControllerBuiltinTransitionViewAnimator to work."];
    goto LABEL_6;
  }
  id v7 = 0;
LABEL_7:
  p_transitionContext = &self->_transitionContext;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  uint64_t v12 = [v6 containerView];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();

  if (v13 != v14)
  {
    v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2 object:self file:@"UIViewControllerBuiltinTransitionViewAnimator.m" lineNumber:77 description:@"UIViewControllerBuiltinTransitionViewAnimator can only operate on a container view of type UITransitionView."];
  }
  v15 = [v6 containerView];
  [v15 setDelegate:self];
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v16 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextToViewController"];
    v17 = v16;
    int transition = self->_transition;
    if (transition == 17 || transition == 13)
    {
      v19 = [v16 view];
      [v19 layoutIfNeeded];
    }
    [v15 setIgnoresInteractionEvents:0];
    [v15 setShouldNotifyDidCompleteImmediately:1];
    [(UIViewControllerContextTransitioning *)self->_transitionContext finalFrameForViewController:v17];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    p_toView = &self->_toView;
    id v29 = objc_loadWeakRetained((id *)&self->_toView);
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

    int v30 = self->_transition;
    if ((v30 - 10) < 2)
    {
      id v31 = objc_loadWeakRetained((id *)&self->_fromView);
      v32 = [v31 layer];
      char v84 = [v32 isDoubleSided];

      id v33 = objc_loadWeakRetained((id *)&self->_toView);
      v34 = [v33 layer];
      LOBYTE(v32) = [v34 isDoubleSided];

      memset(&v104, 0, sizeof(v104));
      id v35 = objc_loadWeakRetained((id *)&self->_toView);
      v36 = [v35 layer];
      v37 = v36;
      char v83 = (char)v32;
      if (v36) {
        [v36 transform];
      }
      else {
        memset(&v104, 0, sizeof(v104));
      }

      v47 = objc_alloc_init(_UIFlippingView);
      [v15 frame];
      -[UIView setFrame:](v47, "setFrame:");
      [(UIView *)v47 setAutoresizingMask:18];
      id v48 = objc_loadWeakRetained((id *)&self->_toView);
      v49 = [v48 layer];
      [v49 setDoubleSided:0];

      CATransform3D v102 = v104;
      double v50 = 1.0;
      CATransform3DRotate(&v103, &v102, 3.14159265, 0.0, 1.0, 0.0);
      id v51 = objc_loadWeakRetained((id *)&self->_toView);
      v52 = [v51 layer];
      CATransform3D v101 = v103;
      [v52 setTransform:&v101];

      id v53 = objc_loadWeakRetained((id *)&self->_fromView);
      v54 = [v53 layer];
      [v54 setDoubleSided:0];

      [v15 addSubview:v47];
      id v55 = objc_loadWeakRetained((id *)&self->_toView);
      [(UIView *)v47 addSubview:v55];

      id v56 = objc_loadWeakRetained((id *)&self->_fromView);
      [(UIView *)v47 addSubview:v56];

      v57 = [v15 layer];
      long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v96[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v96[3] = v58;
      v96[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      uint64_t v59 = *(void *)(MEMORY[0x1E4F39B10] + 80);
      long long v60 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v96[0] = *MEMORY[0x1E4F39B10];
      v96[1] = v60;
      uint64_t v97 = v59;
      uint64_t v98 = 0x3F4B4E81B4E81B4FLL;
      long long v61 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v99 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v100 = v61;
      [v57 setSublayerTransform:v96];

      int v62 = self->_transition;
      v63 = [(UIView *)v47 layer];
      v64 = v63;
      if (v62 == 10) {
        double v65 = 1.0;
      }
      else {
        double v65 = -1.0;
      }
      if (v62 == 10) {
        double v50 = 0.0;
      }
      [v63 position];
      double v67 = v66;
      [v64 bounds];
      double v69 = v68;
      [v64 anchorPoint];
      double v71 = v67 + v69 * (v50 - v70);
      [v64 position];
      double v73 = v72;
      [v64 bounds];
      double v75 = v74;
      [v64 anchorPoint];
      objc_msgSend(v64, "setPosition:", v71, v73 + v75 * (0.5 - v76));
      objc_msgSend(v64, "setAnchorPoint:", v50, 0.5);

      if ([v6 isInteractive]) {
        uint64_t v77 = 196608;
      }
      else {
        uint64_t v77 = 0;
      }
      if ([v7 _allowUserInteraction]) {
        uint64_t v78 = v77 | 2;
      }
      else {
        uint64_t v78 = v77;
      }
      [(UIViewControllerBuiltinTransitionViewAnimator *)self transitionDuration:v6];
      double v80 = v79;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_5;
      v92[3] = &unk_1E52DD178;
      v93 = v47;
      uint64_t v94 = 0x4072C00000000000;
      double v95 = v65;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_7;
      v85[3] = &unk_1E52EA428;
      v85[4] = self;
      id v86 = v15;
      v87 = v93;
      CATransform3D v89 = v104;
      char v90 = v83;
      char v91 = v84;
      id v88 = v6;
      v45 = v93;
      +[UIView animateKeyframesWithDuration:v78 delay:v92 options:v85 animations:v80 completion:0.0];

LABEL_42:
LABEL_43:

      goto LABEL_44;
    }
    if (v30)
    {
      if ([v6 isInteractive]) {
        [v15 setAnimationTimingCurve:3];
      }
      uint64_t v44 = self->_transition;
      v45 = (_UIFlippingView *)objc_loadWeakRetained((id *)&self->_fromView);
      id v46 = objc_loadWeakRetained((id *)p_toView);
      [v15 transition:v44 fromView:v45 toView:v46 removeFromView:0];

      goto LABEL_42;
    }
    if (v7)
    {
      if ([v7 _isDeferred])
      {
LABEL_22:
        v102.m11 = 0.0;
        *(void *)&v102.m12 = &v102;
        *(void *)&v102.m13 = 0x2020000000;
        LOBYTE(v102.m14) = 0;
        v104.m11 = 0.0;
        *(void *)&v104.m12 = &v104;
        *(void *)&v104.m13 = 0x3032000000;
        *(void *)&v104.m14 = __Block_byref_object_copy__62;
        *(void *)&v104.m21 = __Block_byref_object_dispose__62;
        v104.m22 = 0.0;
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke;
        v110[3] = &unk_1E52E5180;
        id v111 = v15;
        v112 = self;
        v113 = &v104;
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_3;
        v107[3] = &unk_1E52EA3D8;
        v109 = &v102;
        v107[4] = self;
        id v41 = v6;
        id v108 = v41;
        +[UIView animateWithDuration:0 delay:v110 options:v107 animations:0.0 completion:0.0];
        int v42 = [*(id *)(*(void *)&v104.m12 + 40) _didEndCount];
        *(unsigned char *)(*(void *)&v102.m12 + 24) = v42 > 0;
        if (v42 <= 0)
        {
          v43 = (void *)UIApp;
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_4;
          v105[3] = &unk_1E52D9F98;
          v105[4] = self;
          id v106 = v41;
          [v43 _performBlockAfterCATransactionCommits:v105];
        }
        _Block_object_dispose(&v104, 8);

        _Block_object_dispose(&v102, 8);
        goto LABEL_43;
      }
    }
    else if (+[UIViewController _shouldDeferTransitions])
    {
      goto LABEL_22;
    }
    id v81 = objc_loadWeakRetained((id *)&self->_toView);
    [v15 addSubview:v81];

    -[UIViewControllerContextTransitioning completeTransition:](*p_transitionContext, "completeTransition:", [v6 transitionWasCancelled] ^ 1);
    goto LABEL_43;
  }
  uint64_t v38 = self->_transition;
  id v39 = objc_loadWeakRetained((id *)&self->_fromView);
  id v40 = objc_loadWeakRetained((id *)&self->_toView);
  [v15 transition:v38 fromView:v39 toView:v40 removeFromView:self->_removeFromView];

LABEL_44:
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fromView);
  objc_destroyWeak((id *)&self->_toView);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

- (int)transition
{
  return self->_transition;
}

uint64_t __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [*(id *)(a1 + 40) transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layer];
  [v2 position];
  uint64_t v4 = v3;

  double v5 = *(double *)(a1 + 40);
  if (v5 >= 0.0)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    double v7 = 0.0;
    int v8 = 1;
    do
    {
      double v9 = v7 / v5;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_6;
      v11[3] = &unk_1E52EA400;
      int v16 = v8 - 1;
      double v13 = v5;
      double v10 = 1.0 / v5;
      id v12 = *(id *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = v4;
      +[UIView addKeyframeWithRelativeStartTime:v11 relativeDuration:v9 animations:v10];

      double v7 = (double)v8;
      double v5 = *(double *)(a1 + 40);
      ++v8;
    }
    while (v5 >= v7);
  }
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_6(uint64_t a1)
{
  long double v2 = (double)*(int *)(a1 + 64) / *(double *)(a1 + 40) * 3.14159265;
  [*(id *)(a1 + 32) bounds];
  long double v4 = (1.0 - cos(v2)) * (v3 * 0.5);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeRotation(&v13, -(*(double *)(a1 + 48) * v2), 0.0, 1.0, 0.0);
  CATransform3D v12 = v13;
  double v5 = [*(id *)(a1 + 32) layer];
  CATransform3D v11 = v12;
  [v5 setTransform:&v11];

  long double v6 = *(double *)(a1 + 56) + v4 * *(double *)(a1 + 48);
  double v7 = [*(id *)(a1 + 32) layer];
  [v7 position];
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v10, "setPosition:", (double)v6, v9);
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [*(id *)(a1 + 40) addSubview:v3];
  [WeakRetained removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  long long v4 = *(_OWORD *)(a1 + 144);
  v19[4] = *(_OWORD *)(a1 + 128);
  v19[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 176);
  v19[6] = *(_OWORD *)(a1 + 160);
  v19[7] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v19[0] = *(_OWORD *)(a1 + 64);
  v19[1] = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  v19[2] = *(_OWORD *)(a1 + 96);
  v19[3] = v7;
  double v8 = [v3 layer];
  [v8 setTransform:v19];

  uint64_t v9 = *(unsigned __int8 *)(a1 + 192);
  double v10 = [v3 layer];
  [v10 setDoubleSided:v9];

  CATransform3D v11 = [*(id *)(a1 + 40) layer];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v18[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v18[5] = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v18[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v18[7] = v13;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v18[0] = *MEMORY[0x1E4F39B10];
  v18[1] = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v18[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v18[3] = v15;
  [v11 setSublayerTransform:v18];

  uint64_t v16 = *(unsigned __int8 *)(a1 + 193);
  v17 = [WeakRetained layer];
  [v17 setDoubleSided:v16];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "completeTransition:", objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled") ^ 1);
}

- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v12 = a4;
  [(id)objc_opt_class() durationForTransition:v4];
  double v6 = v5;
  long long v7 = [v12 keyboardSceneDelegate];
  if ((UIKeyboardAutomaticIsOffScreen() & 1) == 0)
  {
    double v8 = [v7 responder];
    int v9 = [v12 _containsResponder:v8];

    if (v9)
    {
      [v7 _beginIgnoringReloadInputViews];
      [v7 setAutomaticAppearanceInternalEnabled:0];
      [v12 endEditing:1];
      [v7 setAutomaticAppearanceInternalEnabled:1];
      [v7 _endIgnoringReloadInputViews];
      uint64_t v10 = +[UIViewController _keyboardDirectionForTransition:v4];
      if ([v7 currentState] != 2) {
        [v7 forceOrderOutAutomaticToDirection:v10 withDuration:v6];
      }
    }
  }
  if (v4)
  {
    CATransform3D v11 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", 1, +[UIViewController _keyboardDirectionForTransition:v4], v6);
    [v7 pushAnimationStyle:v11];
  }
}

- (void)transitionViewDidStart:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained performSelector:sel_transitionDidStart withObject:0 afterDelay:0.0];
    }
  }
  else
  {
    [WeakRetained transitionViewDidStart:v5];
  }
}

- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained transitionView:v7 startCustomTransitionWithDuration:a4];
  }
}

- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5
{
  if ((a5 - 1) >= 2)
  {
    if (((1 << a5) & 0x1C1388) == 0) {
      a4.x = result.x;
    }
    if (a5 <= 0x14) {
      result.x = a4.x;
    }
    a4.double y = result.y;
  }
  double y = a4.y;
  result.double y = y;
  return result;
}

- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v8 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    [v12 frame];
    -[UIViewControllerBuiltinTransitionViewAnimator _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v13, v14);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:endOriginForFromView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    double v16 = v20;
    double v18 = v21;
  }
  double v22 = v16;
  double v23 = v18;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v8 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:beginOriginForToView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    goto LABEL_9;
  }
  id WeakRetained = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextToViewController"];
  [(UIViewControllerContextTransitioning *)self->_transitionContext finalFrameForViewController:WeakRetained];
  double v16 = v14;
  double v17 = v15;
  unsigned int transition = self->_transition;
  BOOL v19 = transition > 0x14;
  int v20 = (1 << transition) & 0x137E40;
  if (v19 || v20 == 0)
  {
    -[UIViewControllerBuiltinTransitionViewAnimator _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v14, v15);
LABEL_9:
    double v16 = v22;
    double v17 = v23;
  }

  double v24 = v16;
  double v25 = v17;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v8 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    id WeakRetained = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextToViewController"];
    [(UIViewControllerContextTransitioning *)self->_transitionContext finalFrameForViewController:WeakRetained];
    if (v14 != 1.79769313e308 || v15 != 1.79769313e308)
    {
      double x = v14;
      double y = v15;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:endOriginForToView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    double x = v16;
    double y = v17;
  }

  double v18 = x;
  double v19 = y;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  transitionContext = self->_transitionContext;
  uint64_t v7 = [(UIViewControllerContextTransitioning *)transitionContext transitionWasCancelled] ^ 1;
  [(UIViewControllerContextTransitioning *)transitionContext completeTransition:v7];
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (UIView)toView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toView);
  return (UIView *)WeakRetained;
}

- (void)setToView:(id)a3
{
}

- (UIView)fromView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromView);
  return (UIView *)WeakRetained;
}

- (void)setFromView:(id)a3
{
}

- (BOOL)removeFromView
{
  return self->_removeFromView;
}

- (void)setRemoveFromView:(BOOL)a3
{
  self->_removeFromView = a3;
}

- (void)setTransition:(int)a3
{
  self->_unsigned int transition = a3;
}

@end