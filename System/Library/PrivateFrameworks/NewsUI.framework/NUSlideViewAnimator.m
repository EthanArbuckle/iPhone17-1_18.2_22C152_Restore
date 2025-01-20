@interface NUSlideViewAnimator
- (BOOL)isAnimating;
- (CAMediaTimingFunction)mediaTimingFunction;
- (CGAffineTransform)fromViewTransformForDirection:(SEL)a3;
- (CGAffineTransform)toViewTransformForDirection:(SEL)a3;
- (CGRect)bounds;
- (NUAnimationFactory)animationFactory;
- (NUSlideViewAnimator)initWithBounds:(CGRect)a3;
- (double)duration;
- (double)translateBoundsPadding;
- (unint64_t)animationOptionsForAnimationFactory:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationFactory:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDuration:(double)a3;
- (void)setMediaTimingFunction:(id)a3;
- (void)setTranslateBoundsPadding:(double)a3;
- (void)translateFromView:(id)a3 toView:(id)a4 direction:(unint64_t)a5 completion:(id)a6;
@end

@implementation NUSlideViewAnimator

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setMediaTimingFunction:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v4 = [[NUAnimationFactory alloc] initWithMediaTimingFunction:v5];
    [(NUSlideViewAnimator *)self setAnimationFactory:v4];
  }
  else
  {
    [(NUSlideViewAnimator *)self setAnimationFactory:0];
  }
}

- (void)setAnimationFactory:(id)a3
{
}

- (NUSlideViewAnimator)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)NUSlideViewAnimator;
  result = [(NUSlideViewAnimator *)&v8 init];
  if (result)
  {
    result->_animating = 0;
    result->_duration = 0.75;
    result->_bounds.origin.CGFloat x = x;
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
    result->_translateBoundsPadding = 1.0;
  }
  return result;
}

- (void)translateFromView:(id)a3 toView:(id)a4 direction:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [MEMORY[0x263F08B88] isMainThread];
  [(NUSlideViewAnimator *)self setAnimating:1];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  [(NUSlideViewAnimator *)self toViewTransformForDirection:a5];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  [(NUSlideViewAnimator *)self fromViewTransformForDirection:a5];
  v32[0] = v36;
  v32[1] = v37;
  v32[2] = v38;
  [v11 setTransform:v32];
  v13 = [(NUSlideViewAnimator *)self animationFactory];
  unint64_t v14 = [(NUSlideViewAnimator *)self animationOptionsForAnimationFactory:v13];

  v15 = (void *)MEMORY[0x263F1CB60];
  [(NUSlideViewAnimator *)self duration];
  double v17 = v16;
  v18 = [(NUSlideViewAnimator *)self animationFactory];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke;
  v26[3] = &unk_2645FE3F8;
  id v27 = v11;
  id v28 = v10;
  long long v29 = v33;
  long long v30 = v34;
  long long v31 = v35;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke_2;
  v22[3] = &unk_2645FE420;
  v24 = self;
  id v25 = v12;
  id v23 = v28;
  id v19 = v12;
  id v20 = v28;
  id v21 = v11;
  [v15 _animateWithDuration:v14 delay:v18 options:v26 factory:v22 animations:v17 completion:0.0];
}

uint64_t __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v7[0] = *MEMORY[0x263F000D0];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v7];
  long long v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 80);
  return [*(id *)(a1 + 40) setTransform:v6];
}

uint64_t __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v6[0] = *MEMORY[0x263F000D0];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v6];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return [*(id *)(a1 + 40) setAnimating:0];
}

- (CGAffineTransform)fromViewTransformForDirection:(SEL)a3
{
  [(NUSlideViewAnimator *)self bounds];
  double Height = CGRectGetHeight(v16);
  [(NUSlideViewAnimator *)self translateBoundsPadding];
  double v9 = v8;
  [(NUSlideViewAnimator *)self bounds];
  double Width = CGRectGetWidth(v17);
  result = (CGAffineTransform *)[(NUSlideViewAnimator *)self translateBoundsPadding];
  double v12 = Height + v9;
  double v14 = Width + v13;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
      double v12 = -v12;
LABEL_3:
      double v14 = 0.0;
      goto LABEL_6;
    case 2uLL:
      double v14 = -v14;
      goto LABEL_5;
    case 3uLL:
LABEL_5:
      double v12 = 0.0;
LABEL_6:
      result = CGAffineTransformMakeTranslation(retstr, v14, v12);
      break;
    default:
      return result;
  }
  return result;
}

- (CGAffineTransform)toViewTransformForDirection:(SEL)a3
{
  [(NUSlideViewAnimator *)self bounds];
  double Height = CGRectGetHeight(v16);
  [(NUSlideViewAnimator *)self translateBoundsPadding];
  double v9 = v8;
  [(NUSlideViewAnimator *)self bounds];
  double Width = CGRectGetWidth(v17);
  result = (CGAffineTransform *)[(NUSlideViewAnimator *)self translateBoundsPadding];
  double v12 = Height + v9;
  double v14 = Width + v13;
  switch(a4)
  {
    case 0uLL:
      double v12 = -v12;
      goto LABEL_3;
    case 1uLL:
LABEL_3:
      double v14 = 0.0;
      goto LABEL_6;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      double v14 = -v14;
LABEL_5:
      double v12 = 0.0;
LABEL_6:
      result = CGAffineTransformMakeTranslation(retstr, v14, v12);
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)animationOptionsForAnimationFactory:(id)a3
{
  if (a3) {
    return 393216;
  }
  else {
    return 0;
  }
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)translateBoundsPadding
{
  return self->_translateBoundsPadding;
}

- (void)setTranslateBoundsPadding:(double)a3
{
  self->_translateBoundsPadding = a3;
}

- (NUAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFactory, 0);

  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
}

@end