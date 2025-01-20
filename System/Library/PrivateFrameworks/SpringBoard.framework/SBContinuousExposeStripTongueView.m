@interface SBContinuousExposeStripTongueView
- (BOOL)isAnimating;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SBContinuousExposeStripTongueView)initWithFrame:(CGRect)a3;
- (SBContinuousExposeStripTongueViewDelegate)delegate;
- (SBSwitcherContinuousExposeStripTongueAttributes)attributes;
- (void)_handleTap:(id)a3;
- (void)_updateContainerPosition;
- (void)_updateContainerTransform;
- (void)_updateSubviewLayoutForCollapsedOrExpandedState;
- (void)_updateSubviewOpacityForCollapsedOrExpandedState;
- (void)layoutSubviews;
- (void)setAttributes:(SBSwitcherContinuousExposeStripTongueAttributes)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBContinuousExposeStripTongueView

- (SBContinuousExposeStripTongueView)initWithFrame:(CGRect)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)SBContinuousExposeStripTongueView;
  v3 = -[SBContinuousExposeStripTongueView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_attributes.state = SBSwitcherContinuousExposeStripTongueAttributesNone();
    v4->_attributes.direction = v5;
    v6 = [MEMORY[0x1E4F42A80] imageNamed:@"SlideOverTongueMask"];
    [v6 size];
    v4->_bitmapMaskSize.width = v7;
    v4->_bitmapMaskSize.height = v8;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    tongueContainerView = v4->_tongueContainerView;
    v4->_tongueContainerView = (UIView *)v9;

    v11 = [(UIView *)v4->_tongueContainerView layer];
    objc_msgSend(v11, "setAnchorPoint:", 1.0, 0.5);

    [(SBContinuousExposeStripTongueView *)v4 addSubview:v4->_tongueContainerView];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:-2];
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v12;

    v14 = [(_UIBackdropView *)v4->_backdropView inputSettings];
    [v14 setBlurRadius:0.0];

    v15 = [(_UIBackdropView *)v4->_backdropView inputSettings];
    [v15 setScale:1.0];

    v16 = [(_UIBackdropView *)v4->_backdropView inputSettings];
    [v16 setBackdropVisible:1];

    [(_UIBackdropView *)v4->_backdropView setGroupName:@"SBContinuousExposeStripTongueBackdropName"];
    [(UIView *)v4->_tongueContainerView addSubview:v4->_backdropView];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v6];
    tongueMaskView = v4->_tongueMaskView;
    v4->_tongueMaskView = (UIView *)v17;

    [(UIView *)v4->_tongueMaskView setContentMode:0];
    v19 = [(UIView *)v4->_tongueMaskView layer];
    [v19 setCompositingFilter:*MEMORY[0x1E4F3A098]];

    [(UIView *)v4->_tongueContainerView addSubview:v4->_tongueMaskView];
    v20 = (void *)MEMORY[0x1E4F42A80];
    v21 = [MEMORY[0x1E4F42A98] configurationWithPointSize:44.0];
    v22 = [v20 systemImageNamed:@"chevron.compact.left" withConfiguration:v21];

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v22];
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v23;

    [(UIImageView *)v4->_chevronImageView setSemanticContentAttribute:3];
    v25 = v4->_chevronImageView;
    v26 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIImageView *)v25 setTintColor:v26];

    v27 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    v34[2] = xmmword_1D8FD3590;
    v34[3] = unk_1D8FD35A0;
    v34[4] = xmmword_1D8FD35B0;
    v34[0] = xmmword_1D8FD3570;
    v34[1] = unk_1D8FD3580;
    v28 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v34];
    [v27 setValue:v28 forKey:@"inputColorMatrix"];

    v29 = [(UIImageView *)v4->_chevronImageView layer];
    v36[0] = v27;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [v29 setFilters:v30];

    [(UIView *)v4->_tongueContainerView addSubview:v4->_chevronImageView];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel__handleTap_];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v31;

    [(UIView *)v4->_tongueContainerView addGestureRecognizer:v4->_tapGestureRecognizer];
    [(SBContinuousExposeStripTongueView *)v4 setIsAccessibilityElement:1];
    [(SBContinuousExposeStripTongueView *)v4 setAccessibilityIdentifier:@"continuous-expose-strip-tongue"];
  }
  return v4;
}

- (void)setAttributes:(SBSwitcherContinuousExposeStripTongueAttributes)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t state = a3.state;
  p_attributes = &self->_attributes;
  unint64_t v8 = self->_attributes.state;
  self->_attributes = a3;
  uint64_t v9 = +[SBAppSwitcherDomain rootSettings];
  v10 = [v9 floatingSwitcherSettings];

  if (v8 != state)
  {
    if (v4)
    {
      if (p_attributes->state == 1) {
        [v10 tongueExpandedToCollapsedAnimationSettings];
      }
      else {
      v11 = [v10 tongueCollapsedToExpandedAnimationSettings];
      }
      uint64_t v12 = 3;
    }
    else
    {
      v11 = 0;
      uint64_t v12 = 2;
    }
    self->_animating = 1;
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4F42FF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke;
    v16[3] = &unk_1E6AF4AC0;
    v16[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke_2;
    v14[3] = &unk_1E6B016A8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v11, v12, v16, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSubviewLayoutForCollapsedOrExpandedState];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateSubviewOpacityForCollapsedOrExpandedState];
}

void __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      *((unsigned char *)WeakRetained + 464) = 0;
      v6 = WeakRetained;
      id v5 = objc_loadWeakRetained((id *)WeakRetained + 59);
      [v5 continuousExposeStripTongueView:v6 didFinishAnimatingToState:v6[60]];

      id WeakRetained = v6;
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeStripTongueView;
  [(SBContinuousExposeStripTongueView *)&v3 layoutSubviews];
  [(SBContinuousExposeStripTongueView *)self _updateContainerPosition];
  [(SBContinuousExposeStripTongueView *)self _updateContainerTransform];
  [(SBContinuousExposeStripTongueView *)self _updateSubviewLayoutForCollapsedOrExpandedState];
}

- (void)_updateContainerPosition
{
  unint64_t direction = self->_attributes.direction;
  [(SBContinuousExposeStripTongueView *)self bounds];
  tongueContainerView = self->_tongueContainerView;
  double v7 = 0.0;
  if (direction != 1) {
    double v7 = v4;
  }
  -[UIView setCenter:](tongueContainerView, "setCenter:", v7, v5 * 0.5);
}

- (void)_updateContainerTransform
{
  unint64_t direction = self->_attributes.direction;
  memset(&v7, 0, sizeof(v7));
  if (direction == 2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v7, -1.0, 1.0);
  }
  tongueContainerView = self->_tongueContainerView;
  CGAffineTransform v6 = v7;
  [(UIView *)tongueContainerView setTransform:&v6];
}

- (void)_updateSubviewLayoutForCollapsedOrExpandedState
{
  memset(&v10, 0, sizeof(v10));
  if (self->_attributes.state == 1)
  {
    CGAffineTransformMakeScale(&v10, 0.0, 1.0);
  }
  else
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10.c = v3;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  backdropView = self->_backdropView;
  CGAffineTransform v9 = v10;
  [(_UIBackdropView *)backdropView setTransform:&v9];
  tongueMaskView = self->_tongueMaskView;
  CGAffineTransform v9 = v10;
  [(UIView *)tongueMaskView setTransform:&v9];
  chevronImageView = self->_chevronImageView;
  CGAffineTransform v9 = v10;
  [(UIImageView *)chevronImageView setTransform:&v9];
  if (self->_attributes.state == 1) {
    double width = self->_bitmapMaskSize.width;
  }
  else {
    double width = self->_bitmapMaskSize.width * 0.5;
  }
  double v8 = floor(self->_bitmapMaskSize.height * 0.5);
  -[_UIBackdropView setCenter:](self->_backdropView, "setCenter:", width, v8);
  -[UIView setCenter:](self->_tongueMaskView, "setCenter:", width, v8);
  -[UIImageView setCenter:](self->_chevronImageView, "setCenter:", width, v8);
}

- (void)_updateSubviewOpacityForCollapsedOrExpandedState
{
  double v2 = 0.0;
  if (self->_attributes.state == 2) {
    double v2 = 1.0;
  }
  [(UIImageView *)self->_chevronImageView setAlpha:v2];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  CGAffineTransform v6 = self;
  tongueContainerView = self->_tongueContainerView;
  id v8 = a4;
  -[SBContinuousExposeStripTongueView convertPoint:toView:](v6, "convertPoint:toView:", tongueContainerView, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](tongueContainerView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)_handleTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained continuousExposeStripTongueViewTapped:self];
}

- (SBContinuousExposeStripTongueViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBContinuousExposeStripTongueViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSwitcherContinuousExposeStripTongueAttributes)attributes
{
  p_attributes = &self->_attributes;
  unint64_t state = self->_attributes.state;
  unint64_t direction = p_attributes->direction;
  result.unint64_t direction = direction;
  result.unint64_t state = state;
  return result;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_tongueMaskView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_tongueContainerView, 0);
}

@end