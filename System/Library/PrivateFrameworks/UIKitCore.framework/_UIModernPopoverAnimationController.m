@interface _UIModernPopoverAnimationController
- (BOOL)isPresenting;
- (CGPoint)_anchorPointForArrowDirection:(unint64_t)a3 arrowOfset:(double)a4 popoverSize:(CGSize)a5;
- (CGPoint)_arrowPointForPopoverSize:(CGSize)a3 arrowOffset:(double)a4 arrowDirection:(unint64_t)a5;
- (UIPopoverPresentationController)popoverPresentationController;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setPopoverPresentationController:(id)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation _UIModernPopoverAnimationController

- (double)transitionDuration:(id)a3
{
  v4 = [(_UIModernPopoverAnimationController *)self popoverPresentationController];
  int v5 = [v4 _shouldUseNewPopoverAnimations];

  BOOL v6 = [(_UIModernPopoverAnimationController *)self isPresenting];
  double result = 0.51566;
  if (v6) {
    double result = 0.4937;
  }
  double v8 = 0.35;
  if (v6) {
    double v8 = 0.0;
  }
  if (!v5) {
    return v8;
  }
  return result;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverPresentationController);
  return (UIPopoverPresentationController *)WeakRetained;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  BOOL v6 = [v5 viewForKey:@"UITransitionContextFromView"];
  v7 = [(_UIModernPopoverAnimationController *)self popoverPresentationController];
  char v8 = [v7 _shouldUseNewPopoverAnimations];

  if (v8)
  {
    int v9 = _AXSReduceMotionEnabled();
    BOOL v10 = v9 != 0;
    v11 = [v5 viewControllerForKey:@"UITransitionContextToViewController"];
    v12 = [v5 viewControllerForKey:@"UITransitionContextFromViewController"];
    if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
      v13 = v11;
    }
    else {
      v13 = v12;
    }
    v38 = [(UIViewControllerBuiltinTransitionViewAnimator *)v13 popoverPresentationController];
    v14 = [v5 viewForKey:@"UITransitionContextToView"];
    [(_UIModernPopoverAnimationController *)self isPresenting];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
        v37 = v14;
      }
      else {
        v37 = v6;
      }
      [v36 handleFailureInMethod:a2, self, @"_UIModernPopoverAnimationController.m", 105, @"Expected a popover view, found %@", v37 object file lineNumber description];
    }
    if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
      v15 = v14;
    }
    else {
      v15 = v6;
    }
    id v16 = v15;
    v17 = [v5 containerView];
    if ([(_UIModernPopoverAnimationController *)self isPresenting])
    {
      [v17 addSubview:v14];
      [v16 setChromeHidden:1];
      [v5 finalFrameForViewController:v11];
      objc_msgSend(v16, "_setFrameIgnoringLayerTransform:");
      [v16 layoutIfNeeded];
    }
    if (v9)
    {
      double v18 = *MEMORY[0x1E4F1DB28];
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
        [v16 _frameIgnoringLayerTransform];
      }
      else {
        [v5 initialFrameForViewController:v12];
      }
      double v18 = v24;
      double v19 = v25;
      double v20 = v26;
      double v21 = v27;
      objc_msgSend(v16, "setContentSize:", v26, v27 + 40.0);
      [v16 setAnimationOvershootHeight:40.0];
      if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
        double v28 = 100.0;
      }
      else {
        double v28 = v21;
      }
      objc_msgSend(v16, "_setFrameIgnoringLayerTransform:", v18, v19, v20, v28);
      [v16 layoutIfNeeded];
      [v16 arrowOffset];
      -[_UIModernPopoverAnimationController _arrowPointForPopoverSize:arrowOffset:arrowDirection:](self, "_arrowPointForPopoverSize:arrowOffset:arrowDirection:", [v16 arrowDirection], v20, v21, v29);
      uint64_t v30 = [v16 arrowDirection];
      [v16 arrowOffset];
      -[_UIModernPopoverAnimationController _anchorPointForArrowDirection:arrowOfset:popoverSize:](self, "_anchorPointForArrowDirection:arrowOfset:popoverSize:", v30);
      objc_msgSend(v16, "setAnchorPoint:");
      memset(&v52, 0, sizeof(v52));
      if ([(_UIModernPopoverAnimationController *)self isPresenting])
      {
        CGAffineTransformMakeScale(&v52, 0.01, 0.01);
      }
      else
      {
        long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v52.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v52.c = v31;
        *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      CGAffineTransform v51 = v52;
      [v16 setTransform:&v51];
      if (![(_UIModernPopoverAnimationController *)self isPresenting])
      {
        objc_msgSend(v16, "_setFrameIgnoringLayerTransform:", v18, v19, v20, v21);
        [v16 layoutIfNeeded];
      }
    }
    [(_UIModernPopoverAnimationController *)self transitionDuration:v5];
    double v33 = v32;
    if ([(_UIModernPopoverAnimationController *)self isPresenting]) {
      double v34 = 0.8;
    }
    else {
      double v34 = 0.85;
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_3;
    v44[3] = &unk_1E52DF1E0;
    BOOL v50 = v10;
    v44[4] = self;
    double v46 = v18;
    double v47 = v19;
    double v48 = v20;
    double v49 = v21;
    id v45 = v16;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_4;
    v39[3] = &unk_1E52DAFB8;
    BOOL v43 = v10;
    id v40 = v45;
    v41 = self;
    id v42 = v5;
    id v35 = v45;
    +[UIView animateWithDuration:4 delay:v44 usingSpringWithDamping:v39 initialSpringVelocity:v33 options:0.0 animations:v34 completion:0.0];

    goto LABEL_32;
  }
  if ([(_UIModernPopoverAnimationController *)self isPresenting])
  {
    v11 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:0];
    [(UIViewControllerBuiltinTransitionViewAnimator *)v11 animateTransition:v5];
LABEL_32:

    goto LABEL_33;
  }
  [(_UIModernPopoverAnimationController *)self transitionDuration:v5];
  double v23 = v22;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke;
  v55[3] = &unk_1E52D9F70;
  id v56 = v6;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_2;
  v53[3] = &unk_1E52DC3A0;
  id v54 = v5;
  +[UIView animateWithDuration:0 delay:v55 options:v53 animations:v23 completion:0.0];

LABEL_33:
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void)setPopoverPresentationController:(id)a3
{
}

- (CGPoint)_arrowPointForPopoverSize:(CGSize)a3 arrowOffset:(double)a4 arrowDirection:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  double v7 = 0.0;
  double v8 = 0.0;
  switch(a5)
  {
    case 1uLL:
      double v7 = width * 0.5 + a4;
      break;
    case 2uLL:
      double v7 = width * 0.5 + a4;
      double v8 = height;
      break;
    case 4uLL:
      double v8 = height * 0.5 + a4;
      break;
    case 8uLL:
      double v8 = height * 0.5 + a4;
      double v7 = width;
      break;
    default:
      break;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_anchorPointForArrowDirection:(unint64_t)a3 arrowOfset:(double)a4 popoverSize:(CGSize)a5
{
  double width = a5.width;
  double v7 = 0.5;
  double v8 = 0.5;
  switch(a3)
  {
    case 1uLL:
      if (width > 0.0)
      {
        double v7 = a4 / width + 0.5;
        double v8 = 0.0;
      }
      break;
    case 2uLL:
      if (width > 0.0)
      {
        double v7 = a4 / width + 0.5;
        double v8 = 1.0;
      }
      break;
    case 4uLL:
      if (a5.height > 0.0)
      {
        double v8 = a4 / a5.height + 0.5;
        double v7 = 0.0;
      }
      break;
    case 8uLL:
      if (a5.height > 0.0)
      {
        double v8 = a4 / a5.height + 0.5;
        double v7 = 1.0;
      }
      break;
    default:
      break;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (void).cxx_destruct
{
}

@end