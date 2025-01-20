@interface VideosExtrasZoomingImageTransitionController
- (BOOL)isInteractive;
- (BOOL)shouldUseSpringAnimation;
- (CGPoint)initialPinchCenter;
- (VideosExtrasBorderedImageView)zoomingImageView;
- (VideosExtrasZoomingImageTransitionController)initWithItemIndex:(unint64_t)a3 forInteractiveTransition:(BOOL)a4;
- (double)_destinationScale;
- (double)_maximumDistanceTravelledForPoints:(CGPoint *)a3 count:(unint64_t)a4 currentTransform:(CGAffineTransform *)a5 finalTransform:(CGAffineTransform *)a6;
- (double)initialPinchScale;
- (double)transitionDuration:(id)a3;
- (float)_desiredSpeedForNonInteractiveAnimationWithDuration:(double)a3 deferredTransform:(CGAffineTransform *)a4 finalTransform:(CGAffineTransform *)a5;
- (unint64_t)itemIndex;
- (void)animateTransition:(id)a3;
- (void)completeInteractiveTransitionWithPinchGestureRecognizer:(id)a3;
- (void)prepareInteractiveTransitionWithPinchGestureRecognizer:(id)a3;
- (void)setInitialPinchCenter:(CGPoint)a3;
- (void)setInitialPinchScale:(double)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setShouldUseSpringAnimation:(BOOL)a3;
- (void)setZoomingImageView:(id)a3;
- (void)updateInteractiveTransitionWithPinchGestureRecognizer:(id)a3;
@end

@implementation VideosExtrasZoomingImageTransitionController

- (VideosExtrasZoomingImageTransitionController)initWithItemIndex:(unint64_t)a3 forInteractiveTransition:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasZoomingImageTransitionController;
  v6 = [(UIPercentDrivenInteractiveTransition *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(VideosExtrasZoomingImageTransitionController *)v6 setItemIndex:a3];
    [(VideosExtrasZoomingImageTransitionController *)v7 setInteractive:v4];
  }
  return v7;
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(VideosExtrasZoomingImageTransitionController *)self shouldUseSpringAnimation];
  double result = 0.2;
  if (v3) {
    return 0.4;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v7 = [v6 view];
  [v4 finalFrameForViewController:v6];
  objc_msgSend(v7, "setFrame:");
  [v5 addSubview:v7];
  [v7 layoutIfNeeded];
  unint64_t v8 = [(VideosExtrasZoomingImageTransitionController *)self itemIndex];
  objc_super v9 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v10 = objc_alloc_init(VideosExtrasBorderedImageView);
  v29 = v5;
  [v5 addSubview:v10];
  [(VideosExtrasZoomingImageTransitionController *)self setZoomingImageView:v10];
  BOOL v11 = [(VideosExtrasZoomingImageTransitionController *)self isInteractive];
  v12 = [[VideosExtrasZoomingImageTransitionContext alloc] initWithZoomingImageView:v10 itemIndex:v8 appearState:1 isInteractive:v11];
  v13 = [[VideosExtrasZoomingImageTransitionContext alloc] initWithZoomingImageView:v10 itemIndex:v8 appearState:0 isInteractive:v11];
  [(VideosExtrasBorderedImageView *)v10 setShouldSkipImageWhenReplicatingState:0];
  [(VideosExtrasBorderedImageView *)v10 setShouldUseTransformWhenReplicatingState:0];
  [v9 prepareZoomingImageTransitionWithContext:v12];
  [v6 prepareZoomingImageTransitionWithContext:v13];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E6DF5EC8;
  v14 = v10;
  v38 = v14;
  BOOL v43 = v11;
  id v15 = v9;
  id v39 = v15;
  v16 = v12;
  v40 = v16;
  id v17 = v6;
  id v41 = v17;
  v18 = v13;
  v42 = v18;
  v19 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke_2;
  v30[3] = &unk_1E6DF5EF0;
  id v20 = v4;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  v22 = v16;
  v33 = v22;
  id v23 = v17;
  id v34 = v23;
  v24 = v18;
  v35 = v24;
  v25 = v14;
  v36 = v25;
  v26 = _Block_copy(v30);
  [(VideosExtrasZoomingImageTransitionController *)self transitionDuration:v20];
  double v28 = v27;
  if ([(VideosExtrasZoomingImageTransitionController *)self shouldUseSpringAnimation]) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v19 usingSpringWithDamping:v26 initialSpringVelocity:v28 options:0.0 animations:0.6 completion:0.0];
  }
  else {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v19 options:v26 animations:v28 completion:0.0];
  }
}

uint64_t __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldSkipImageWhenReplicatingState:1];
  [*(id *)(a1 + 32) setShouldUseTransformWhenReplicatingState:1];
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) setShouldDeferSettingTransform:1];
  }
  [*(id *)(a1 + 40) performZoomingImageTransitionWithContext:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) performZoomingImageTransitionWithContext:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setShouldSkipImageWhenReplicatingState:0];
  uint64_t result = [*(id *)(a1 + 32) setShouldUseTransformWhenReplicatingState:0];
  if (*(unsigned char *)(a1 + 72))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setShouldDeferSettingTransform:0];
  }
  return result;
}

uint64_t __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transitionWasCancelled] ^ 1;
  [*(id *)(a1 + 40) finalizeZoomingImageTransitionWithContext:*(void *)(a1 + 48) transitionFinished:v2];
  [*(id *)(a1 + 56) finalizeZoomingImageTransitionWithContext:*(void *)(a1 + 64) transitionFinished:v2];
  [*(id *)(a1 + 72) removeFromSuperview];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 completeTransition:v2];
}

- (void)prepareInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  v6 = [v5 superview];
  [v4 locationInView:v6];
  -[VideosExtrasZoomingImageTransitionController setInitialPinchCenter:](self, "setInitialPinchCenter:");

  [v4 scale];
  double v8 = v7;

  double v9 = 1.0;
  if (v8 > 0.00000011920929) {
    double v9 = v8;
  }
  [(VideosExtrasZoomingImageTransitionController *)self setInitialPinchScale:v9];
}

- (void)updateInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  [v4 scale];
  double v6 = v5;
  [(VideosExtrasZoomingImageTransitionController *)self initialPinchScale];
  CGFloat v8 = v6 / v7;
  double v9 = [v4 view];
  v10 = [v9 superview];
  [v4 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  [(VideosExtrasZoomingImageTransitionController *)self initialPinchCenter];
  double v16 = v15;
  double v18 = v17;
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeScale(&v25, v8, v8);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v12 - v16, v14 - v18);
  CGAffineTransform t1 = v25;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransform v21 = v24;
  CGAffineTransformConcat(&v23, &t1, &v21);
  v19 = [(VideosExtrasZoomingImageTransitionController *)self zoomingImageView];
  CGAffineTransform t1 = v23;
  [v19 setTransform:&t1];

  [(VideosExtrasZoomingImageTransitionController *)self _destinationScale];
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  if (v20 < 0.01) {
    double v20 = 0.01;
  }
  [(UIPercentDrivenInteractiveTransition *)self updateInteractiveTransition:fmin(v20, 0.99)];
}

- (void)completeInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  [v4 velocity];
  double v7 = v6;

  if (v5 == 4)
  {
    [(UIPercentDrivenInteractiveTransition *)self percentComplete];
    double v9 = v8;
LABEL_4:
    int v13 = 1;
    goto LABEL_6;
  }
  [(VideosExtrasZoomingImageTransitionController *)self _destinationScale];
  double v11 = v7 * (v10 + -1.0);
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  double v9 = v12;
  if (v11 < 0.0) {
    goto LABEL_4;
  }
  int v13 = 0;
  double v9 = 1.0 - v12;
LABEL_6:
  [(UIPercentDrivenInteractiveTransition *)self duration];
  double v15 = v9 * v14;
  double v16 = [(VideosExtrasZoomingImageTransitionController *)self zoomingImageView];
  double v17 = [v16 window];
  double v18 = [v17 layer];

  [v18 speed];
  int v20 = v19;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  if (v16) {
    [v16 deferredTransform];
  }
  CGAffineTransform v21 = (long long *)MEMORY[0x1E4F1DAB8];
  v22 = &v43;
  if (v13) {
    v22 = (long long *)MEMORY[0x1E4F1DAB8];
  }
  long long v23 = v22[1];
  long long v40 = *v22;
  long long v41 = v23;
  long long v38 = v44;
  long long v39 = v45;
  long long v42 = v22[2];
  v36[0] = v40;
  v36[1] = v23;
  v36[2] = v42;
  long long v37 = v43;
  [(VideosExtrasZoomingImageTransitionController *)self _desiredSpeedForNonInteractiveAnimationWithDuration:&v37 deferredTransform:v36 finalTransform:v15];
  objc_msgSend(v18, "setSpeed:");
  CGAffineTransform v24 = (void *)MEMORY[0x1E4FB1EB0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke;
  v31[3] = &unk_1E6DF5F18;
  id v25 = v16;
  long long v33 = v40;
  long long v34 = v41;
  id v32 = v25;
  long long v35 = v42;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke_2;
  v28[3] = &unk_1E6DF5F40;
  id v29 = v18;
  int v30 = v20;
  id v26 = v18;
  [v24 animateWithDuration:0 delay:v31 options:v28 animations:v15 completion:0.0];
  long long v27 = v21[1];
  long long v37 = *v21;
  long long v38 = v27;
  long long v39 = v21[2];
  [v25 setDeferredTransform:&v37];
  if (v13) {
    [(UIPercentDrivenInteractiveTransition *)self cancelInteractiveTransition];
  }
  else {
    [(UIPercentDrivenInteractiveTransition *)self finishInteractiveTransition];
  }
}

uint64_t __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) setSpeed:a2];
}

- (float)_desiredSpeedForNonInteractiveAnimationWithDuration:(double)a3 deferredTransform:(CGAffineTransform *)a4 finalTransform:(CGAffineTransform *)a5
{
  v31[8] = *MEMORY[0x1E4F143B8];
  double v9 = [(VideosExtrasZoomingImageTransitionController *)self zoomingImageView];
  [v9 bounds];
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  CGFloat MinX = CGRectGetMinX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  *(CGFloat *)id v31 = MinX;
  v31[1] = CGRectGetMinY(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  *(CGFloat *)&v31[2] = MaxX;
  v31[3] = CGRectGetMinY(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat v16 = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  *(CGFloat *)&void v31[4] = v16;
  v31[5] = CGRectGetMaxY(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat v17 = CGRectGetMinX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  *(CGFloat *)&v31[6] = v17;
  v31[7] = CGRectGetMaxY(v39);
  if (v9) {
    [v9 transform];
  }
  else {
    memset(v30, 0, sizeof(v30));
  }
  long long v18 = *(_OWORD *)&a5->c;
  long long v27 = *(_OWORD *)&a5->a;
  long long v28 = v18;
  long long v29 = *(_OWORD *)&a5->tx;
  [(VideosExtrasZoomingImageTransitionController *)self _maximumDistanceTravelledForPoints:v31 count:4 currentTransform:v30 finalTransform:&v27];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v27 = *MEMORY[0x1E4F1DAB8];
  long long v28 = v19;
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v20 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v20;
  v26[2] = *(_OWORD *)&a4->tx;
  [(VideosExtrasZoomingImageTransitionController *)self _maximumDistanceTravelledForPoints:v31 count:4 currentTransform:&v27 finalTransform:v26];
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  double v22 = v21;
  [(UIPercentDrivenInteractiveTransition *)self duration];
  double v24 = v23;

  return a3 / (v24 * fmin(v22, 1.0));
}

- (double)_destinationScale
{
  long long v2 = [(VideosExtrasZoomingImageTransitionController *)self zoomingImageView];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 deferredTransform];
    double v4 = (0.0 + 0.0) * 0.5;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (double)_maximumDistanceTravelledForPoints:(CGPoint *)a3 count:(unint64_t)a4 currentTransform:(CGAffineTransform *)a5 finalTransform:(CGAffineTransform *)a6
{
  if (!a4) {
    return 2.22507386e-308;
  }
  p_CGFloat y = &a3->y;
  double result = 2.22507386e-308;
  do
  {
    double v8 = *(p_y - 1);
    CGFloat v9 = a6->tx + *p_y * a6->c + a6->a * v8 - (a5->tx + *p_y * a5->c + a5->a * v8);
    CGFloat v10 = a6->ty + *p_y * a6->d + a6->b * v8 - (a5->ty + *p_y * a5->d + a5->b * v8);
    double v11 = sqrt(v10 * v10 + v9 * v9);
    if (result < v11) {
      double result = v11;
    }
    p_y += 2;
    --a4;
  }
  while (a4);
  return result;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndeCGFloat x = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)shouldUseSpringAnimation
{
  return self->_shouldUseSpringAnimation;
}

- (void)setShouldUseSpringAnimation:(BOOL)a3
{
  self->_shouldUseSpringAnimation = a3;
}

- (CGPoint)initialPinchCenter
{
  double x = self->_initialPinchCenter.x;
  double y = self->_initialPinchCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialPinchCenter:(CGPoint)a3
{
  self->_initialPinchCenter = a3;
}

- (double)initialPinchScale
{
  return self->_initialPinchScale;
}

- (void)setInitialPinchScale:(double)a3
{
  self->_initialPinchScale = a3;
}

- (VideosExtrasBorderedImageView)zoomingImageView
{
  return self->_zoomingImageView;
}

- (void)setZoomingImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end