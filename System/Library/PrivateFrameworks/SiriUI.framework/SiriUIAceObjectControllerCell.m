@interface SiriUIAceObjectControllerCell
+ (id)reuseIdentifier;
- (SiriUIAceObjectControllerCell)initWithFrame:(CGRect)a3;
- (SiriUIAceObjectViewController)aceViewController;
- (UIView)replacedView;
- (id)_flyInAnimationForAceViewController:(id)a3;
- (int64_t)insertionAnimationType;
- (int64_t)replacementAnimationType;
- (void)_animateInsertionFadeIn;
- (void)_animateInsertionFlyIn;
- (void)_animateReplacementCrossFade;
- (void)_parentPreviousViewInCell;
- (void)_parentViewInCell;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginAnimation;
- (void)configureSubviewsForAnimationType;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAceViewController:(id)a3;
- (void)setInsertionAnimationType:(int64_t)a3;
- (void)setReplacedView:(id)a3;
- (void)setReplacementAnimationType:(int64_t)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation SiriUIAceObjectControllerCell

- (SiriUIAceObjectControllerCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)SiriUIAceObjectControllerCell;
  v7 = -[SiriUIClearBackgroundCell initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", x, y, width, height);
    animationView = v7->_animationView;
    v7->_animationView = (UIView *)v8;

    v10 = [(UIView *)v7->_animationView layer];
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v17[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v17[3] = v11;
    v17[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    uint64_t v12 = *(void *)(MEMORY[0x263F15740] + 80);
    long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v17[0] = *MEMORY[0x263F15740];
    v17[1] = v13;
    uint64_t v18 = v12;
    unint64_t v19 = 0xBF670B6208DEA0E0;
    long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v21 = v14;
    [v10 setSublayerTransform:v17];

    v15 = [(UIView *)v7->_animationView layer];
    objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.6);
  }
  return v7;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIAceObjectControllerCell;
  [(SiriUIAceObjectControllerCell *)&v4 prepareForReuse];
  self->_topPadding = 0.0;
  [(UIView *)self->_animationView removeFromSuperview];
  v3 = [(UIView *)self->_animationView subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  [(SiriUIAceObjectControllerCell *)self setReplacedView:0];
  [(SiriUIAceObjectControllerCell *)self setAceViewController:0];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUIAceObjectControllerCell;
  [(SiriUIAceObjectControllerCell *)&v13 layoutSubviews];
  [(SiriUIAceObjectControllerCell *)self bounds];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_animationView, "setFrame:");
  long long v11 = [(SiriUIAceObjectControllerCell *)self aceViewController];
  uint64_t v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (void)setAceViewController:(id)a3
{
  double v5 = (SiriUIAceObjectViewController *)a3;
  p_aceViewController = &self->_aceViewController;
  aceViewController = self->_aceViewController;
  if (aceViewController != v5)
  {
    uint64_t v12 = v5;
    double v8 = [(SiriUIAceObjectViewController *)aceViewController view];
    double v9 = [v8 layer];
    [v9 removeAllAnimations];

    double v10 = [(SiriUIAceObjectViewController *)*p_aceViewController view];
    long long v11 = [(SiriUIAceObjectControllerCell *)self contentView];
    LODWORD(v9) = [v10 isDescendantOfView:v11];

    if (v9) {
      [v10 removeFromSuperview];
    }
    objc_storeStrong((id *)p_aceViewController, a3);

    double v5 = v12;
  }
  MEMORY[0x270F9A758](aceViewController, v5);
}

- (void)setReplacedView:(id)a3
{
  double v5 = (UIView *)a3;
  p_replacedView = &self->_replacedView;
  replacedView = self->_replacedView;
  if (replacedView != v5)
  {
    long long v11 = v5;
    double v8 = [(UIView *)replacedView superview];
    double v9 = [(SiriUIAceObjectControllerCell *)self contentView];

    if (v8 == v9)
    {
      [(UIView *)*p_replacedView removeFromSuperview];
      double v10 = [(UIView *)*p_replacedView layer];
      [v10 removeAllAnimations];
    }
    objc_storeStrong((id *)p_replacedView, a3);
    double v5 = v11;
  }
  MEMORY[0x270F9A758](replacedView, v5);
}

- (void)configureSubviewsForAnimationType
{
  double v3 = [(UIView *)self->_animationView layer];
  [v3 removeAllAnimations];

  [(UIView *)self->_animationView removeFromSuperview];
  if (*(_OWORD *)&self->_insertionAnimationType == 0)
  {
    [(SiriUIAceObjectControllerCell *)self _parentViewInCell];
  }
  else if (self->_replacedView)
  {
    [(SiriUIAceObjectControllerCell *)self _parentPreviousViewInCell];
  }
  [(SiriUIAceObjectControllerCell *)self setNeedsLayout];
}

- (void)_parentViewInCell
{
  id v4 = [(SiriUIAceObjectControllerCell *)self contentView];
  double v3 = [(SiriUIAceObjectViewController *)self->_aceViewController view];
  [v4 addSubview:v3];
}

- (void)_parentPreviousViewInCell
{
  id v3 = [(SiriUIAceObjectControllerCell *)self contentView];
  [v3 addSubview:self->_replacedView];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  double v5 = [(SiriUIAceObjectViewController *)self->_aceViewController view];
  int v6 = [v5 isDescendantOfView:self->_animationView];

  if (v6) {
    [(SiriUIAceObjectControllerCell *)self _parentViewInCell];
  }
  [(UIView *)self->_animationView removeFromSuperview];
  id v7 = [(UIView *)self->_animationView subviews];
  [v7 makeObjectsPerformSelector:sel_removeFromSuperview];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

- (void)beginAnimation
{
  int64_t insertionAnimationType = self->_insertionAnimationType;
  if (insertionAnimationType == 3)
  {
    [(SiriUIAceObjectControllerCell *)self _animateInsertionFadeIn];
  }
  else if (insertionAnimationType == 1)
  {
    [(SiriUIAceObjectControllerCell *)self _animateInsertionFlyIn];
  }
  else if (self->_replacementAnimationType == 2)
  {
    [(SiriUIAceObjectControllerCell *)self _animateReplacementCrossFade];
  }
}

- (void)_animateInsertionFadeIn
{
  [(SiriUIAceObjectControllerCell *)self _parentViewInCell];
  id v3 = [(SiriUIAceObjectViewController *)self->_aceViewController view];
  [v3 setAlpha:0.0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SiriUIAceObjectControllerCell__animateInsertionFadeIn__block_invoke;
  v4[3] = &unk_26469EFA8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.5];
}

void __56__SiriUIAceObjectControllerCell__animateInsertionFadeIn__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 656) view];
  [v1 setAlpha:1.0];
}

- (void)_animateReplacementCrossFade
{
  [(SiriUIAceObjectControllerCell *)self _parentViewInCell];
  id v3 = self->_aceViewController;
  id v4 = [(SiriUIAceObjectViewController *)v3 view];
  [v4 setAlpha:0.0];

  [(SiriUIAceObjectControllerCell *)self _parentPreviousViewInCell];
  double v5 = self->_replacedView;
  replacedView = self->_replacedView;
  self->_replacedView = 0;

  id v7 = [(UIView *)v5 layer];
  [v7 removeAllAnimations];

  [(UIView *)v5 setAlpha:1.0];
  double v8 = [(UIView *)v5 layer];
  LODWORD(v9) = 1.0;
  [v8 setOpacity:v9];

  double v10 = [(UIView *)v5 layer];
  [v10 setZPosition:0.0];

  long long v11 = (void *)MEMORY[0x263F1CB60];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke;
  v16[3] = &unk_26469F248;
  v17 = v5;
  uint64_t v18 = v3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_4;
  v14[3] = &unk_26469F020;
  v15 = v17;
  uint64_t v12 = v17;
  objc_super v13 = v3;
  [v11 animateKeyframesWithDuration:0 delay:v16 options:v14 animations:0.3 completion:0.0];
}

void __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_2;
  v6[3] = &unk_26469EFA8;
  id v7 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.5];
  id v3 = (void *)MEMORY[0x263F1CB60];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_3;
  v4[3] = &unk_26469EFA8;
  id v5 = *(id *)(a1 + 40);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.25 animations:0.75];
}

uint64_t __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_animateInsertionFlyIn
{
  id v3 = [(SiriUIAceObjectControllerCell *)self contentView];
  [v3 addSubview:self->_animationView];

  animationView = self->_animationView;
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  id v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  -[UIView setFrame:](animationView, "setFrame:", v5, v6);

  double v8 = [(SiriUIAceObjectControllerCell *)self aceViewController];
  id v14 = [v8 view];

  [(UIView *)self->_animationView addSubview:v14];
  [v14 frame];
  objc_msgSend(v14, "setFrame:", v5, v6);
  double v9 = [(SiriUIAceObjectControllerCell *)self aceViewController];
  double v10 = [(SiriUIAceObjectControllerCell *)self _flyInAnimationForAceViewController:v9];

  [v10 setDelegate:self];
  long long v11 = [v14 layer];
  [v11 addAnimation:v10 forKey:@"Insertion Animation"];

  uint64_t v12 = [v14 layer];
  LODWORD(v13) = 1.0;
  [v12 setOpacity:v13];
}

- (id)_flyInAnimationForAceViewController:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F15750];
  id v4 = a3;
  double v5 = [v3 animation];
  [v5 setRemovedOnCompletion:1];
  [MEMORY[0x263F74478] defaultAnimationDuration];
  objc_msgSend(v5, "setDuration:");
  [v5 setBeginTime:CACurrentMediaTime()];
  [v5 setFillMode:*MEMORY[0x263F15AA0]];
  double v6 = [MEMORY[0x263F74478] defaultTimingFunction];
  [v5 setTimingFunction:v6];

  id v7 = [MEMORY[0x263F15890] animation];
  [v7 setKeyPath:@"zPosition"];
  double v8 = NSNumber;
  [v4 _insertionAnimatedZPosition];
  double v10 = v9;

  long long v11 = [v8 numberWithDouble:v10];
  [v7 setFromValue:v11];

  [v7 setToValue:&unk_26D658198];
  [v7 setMass:4.0];
  [v7 setStiffness:600.0];
  [v7 setDamping:800.0];
  uint64_t v12 = [MEMORY[0x263F15890] animation];
  [v12 setKeyPath:@"opacity"];
  [v12 setFromValue:&unk_26D658198];
  [v12 setToValue:&unk_26D6581A8];
  [v12 setMass:4.0];
  [v12 setStiffness:600.0];
  [v12 setDamping:800.0];
  v15[0] = v7;
  v15[1] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v5 setAnimations:v13];

  return v5;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  [(SiriUIAceObjectControllerCell *)self setNeedsLayout];
}

- (SiriUIAceObjectViewController)aceViewController
{
  return self->_aceViewController;
}

- (int64_t)insertionAnimationType
{
  return self->_insertionAnimationType;
}

- (void)setInsertionAnimationType:(int64_t)a3
{
  self->_int64_t insertionAnimationType = a3;
}

- (int64_t)replacementAnimationType
{
  return self->_replacementAnimationType;
}

- (void)setReplacementAnimationType:(int64_t)a3
{
  self->_replacementAnimationType = a3;
}

- (UIView)replacedView
{
  return self->_replacedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedView, 0);
  objc_storeStrong((id *)&self->_aceViewController, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

@end