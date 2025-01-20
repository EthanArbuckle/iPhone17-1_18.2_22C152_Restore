@interface _TVRMAlertControllerTransitioning
- (BOOL)isPresentation;
- (UIView)contentView;
- (UIView)dimmingView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setIsPresentation:(BOOL)a3;
@end

@implementation _TVRMAlertControllerTransitioning

- (double)transitionDuration:(id)a3
{
  return 0.404;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = (_OWORD *)MEMORY[0x263F000D0];
  if (self->_isPresentation
    && ([v4 viewForKey:*MEMORY[0x263F83C18]],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v5 addSubview:v7],
        [v5 layoutIfNeeded],
        v7,
        BOOL isPresentation = self->_isPresentation,
        memset(&v24, 0, sizeof(v24)),
        isPresentation))
  {
    CGAffineTransformMakeScale(&v24, 1.2, 1.2);
    double v9 = 1.0;
    double v10 = 0.0;
  }
  else
  {
    long long v11 = v6[1];
    *(_OWORD *)&v24.a = *v6;
    *(_OWORD *)&v24.c = v11;
    *(_OWORD *)&v24.tx = v6[2];
    double v9 = 0.0;
    double v10 = 1.0;
  }
  contentView = self->_contentView;
  CGAffineTransform v23 = v24;
  [(UIView *)contentView setTransform:&v23];
  [(UIView *)self->_contentView setAlpha:v10];
  [(UIView *)self->_dimmingView setAlpha:v10];
  v13 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  long long v14 = v6[1];
  long long v19 = *v6;
  v18[2] = __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke;
  v18[3] = &unk_2648000F8;
  v18[4] = self;
  long long v20 = v14;
  long long v21 = v6[2];
  double v22 = v9;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke_2;
  v16[3] = &unk_264800120;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v13 animateWithDuration:6 delay:v18 usingSpringWithDamping:v16 initialSpringVelocity:0.404 options:0.0 animations:600.0 completion:0.0];
}

- (BOOL)isPresentation
{
  return self->_isPresentation;
}

- (void)setIsPresentation:(BOOL)a3
{
  self->_BOOL isPresentation = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end