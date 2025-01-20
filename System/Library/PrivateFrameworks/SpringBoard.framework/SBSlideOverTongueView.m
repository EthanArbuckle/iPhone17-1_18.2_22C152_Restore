@interface SBSlideOverTongueView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SBSlideOverTongueView)initWithFrame:(CGRect)a3;
- (SBSlideOverTongueViewDelegate)delegate;
- (unint64_t)direction;
- (unint64_t)state;
- (void)_handleTap:(id)a3;
- (void)_updateContainerPosition;
- (void)_updateContainerTransform;
- (void)_updateSubviewCollapsedExpandedState;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDirection:(unint64_t)a3 state:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation SBSlideOverTongueView

- (SBSlideOverTongueView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SBSlideOverTongueView;
  v3 = -[SBSlideOverTongueView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_direction = 0;
    v3->_state = 0;
    v5 = [MEMORY[0x1E4F42A80] imageNamed:@"SlideOverTongueMask"];
    [v5 size];
    v4->_bitmapMaskSize.width = v6;
    v4->_bitmapMaskSize.height = v7;
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    tongueContainerView = v4->_tongueContainerView;
    v4->_tongueContainerView = (UIView *)v8;

    v10 = [(UIView *)v4->_tongueContainerView layer];
    objc_msgSend(v10, "setAnchorPoint:", 1.0, 0.5);

    [(SBSlideOverTongueView *)v4 addSubview:v4->_tongueContainerView];
    v11 = _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
    v12 = (void *)MEMORY[0x1E4F743C8];
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v12 materialViewWithRecipeNamed:v11 inBundle:v13 options:0 initialWeighting:0 scaleAdjustment:1.0];
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v14;

    -[MTMaterialView setFrame:](v4->_materialView, "setFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    [(UIView *)v4->_tongueContainerView addSubview:v4->_materialView];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    tongueMaskView = v4->_tongueMaskView;
    v4->_tongueMaskView = (UIView *)v16;

    [(UIView *)v4->_tongueMaskView setContentMode:0];
    v18 = [(UIView *)v4->_tongueMaskView layer];
    [v18 setCompositingFilter:*MEMORY[0x1E4F3A098]];

    [(UIView *)v4->_tongueContainerView addSubview:v4->_tongueMaskView];
    v19 = (void *)MEMORY[0x1E4F42A80];
    v20 = [MEMORY[0x1E4F42A98] configurationWithPointSize:44.0];
    v21 = [v19 systemImageNamed:@"chevron.compact.left" withConfiguration:v20];

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v21];
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v22;

    [(UIImageView *)v4->_chevronImageView setSemanticContentAttribute:3];
    v24 = v4->_chevronImageView;
    v25 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)v24 setTintColor:v25];

    [(UIView *)v4->_tongueContainerView addSubview:v4->_chevronImageView];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel__handleTap_];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v26;

    [(UIView *)v4->_tongueContainerView addGestureRecognizer:v4->_tapGestureRecognizer];
    [(SBSlideOverTongueView *)v4 setIsAccessibilityElement:1];
    [(SBSlideOverTongueView *)v4 setAccessibilityIdentifier:@"slide-over-tongue"];
  }
  return v4;
}

- (void)setDirection:(unint64_t)a3 state:(unint64_t)a4 animated:(BOOL)a5
{
  unint64_t direction = self->_direction;
  unint64_t state = self->_state;
  if (direction != a3 || state != a4)
  {
    BOOL v8 = a5;
    self->_unint64_t direction = a3;
    self->_unint64_t state = a4;
    v12 = +[SBAppSwitcherDomain rootSettings];
    v13 = [v12 floatingSwitcherSettings];

    if (direction != a3)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F4F898];
      v15 = [v13 tongueContainerPositionAnimationSettings];
      uint64_t v16 = [v15 BSAnimationSettings];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke;
      v25[3] = &unk_1E6AF4AC0;
      v25[4] = self;
      [v14 animateWithSettings:v16 actions:v25];

      v17 = (void *)MEMORY[0x1E4F4F898];
      v18 = [v13 tongueContainerTransformAnimationSettings];
      v19 = [v18 BSAnimationSettings];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_2;
      v24[3] = &unk_1E6AF4AC0;
      v24[4] = self;
      [v17 animateWithSettings:v19 actions:v24];
    }
    if (state != a4)
    {
      if (v8)
      {
        if (self->_state) {
          [v13 tongueCollapsedToExpandedAnimationSettings];
        }
        else {
        v20 = [v13 tongueExpandedToCollapsedAnimationSettings];
        }
        uint64_t v21 = 3;
      }
      else
      {
        v20 = 0;
        uint64_t v21 = 2;
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_3;
      v23[3] = &unk_1E6AF4AC0;
      v23[4] = self;
      objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v20, v21, v23, 0);
    }
    [(SBSlideOverTongueView *)self setAccessibilityValue:0];
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      if (a3 != 2)
      {
        if (a3 != 1) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }
    }
    else
    {
      if (a3 == 2)
      {
LABEL_22:
        uint64_t v22 = @"Right side view";
        goto LABEL_23;
      }
      if (a3 != 1)
      {
LABEL_24:

        return;
      }
    }
    uint64_t v22 = @"Left side view";
LABEL_23:
    [(SBSlideOverTongueView *)self setAccessibilityValue:v22];
    goto LABEL_24;
  }
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContainerPosition];
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContainerTransform];
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSubviewCollapsedExpandedState];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSlideOverTongueView;
  [(SBSlideOverTongueView *)&v3 layoutSubviews];
  [(SBSlideOverTongueView *)self _updateContainerPosition];
  [(SBSlideOverTongueView *)self _updateContainerTransform];
  [(SBSlideOverTongueView *)self _updateSubviewCollapsedExpandedState];
}

- (void)_updateContainerPosition
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    BOOL v3 = self->_direction != 1;
  }
  else {
    BOOL v3 = self->_direction == 1;
  }
  [(SBSlideOverTongueView *)self bounds];
  tongueContainerView = self->_tongueContainerView;
  double v7 = 0.0;
  if (!v3) {
    double v7 = v4;
  }
  -[UIView setCenter:](tongueContainerView, "setCenter:", v7, v5 * 0.5);
}

- (void)_updateContainerTransform
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  unint64_t direction = self->_direction;
  memset(&v8, 0, sizeof(v8));
  if (v3 != 1)
  {
    if (direction == 1) {
      goto LABEL_3;
    }
LABEL_5:
    CGAffineTransformMakeScale(&v8, -1.0, 1.0);
    goto LABEL_6;
  }
  if (direction == 1) {
    goto LABEL_5;
  }
LABEL_3:
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
LABEL_6:
  tongueContainerView = self->_tongueContainerView;
  CGAffineTransform v7 = v8;
  [(UIView *)tongueContainerView setTransform:&v7];
}

- (void)_updateSubviewCollapsedExpandedState
{
  memset(&v11, 0, sizeof(v11));
  if (self->_state)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v3;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v11, 0.0, 1.0);
  }
  materialView = self->_materialView;
  CGAffineTransform v10 = v11;
  [(MTMaterialView *)materialView setTransform:&v10];
  tongueMaskView = self->_tongueMaskView;
  CGAffineTransform v10 = v11;
  [(UIView *)tongueMaskView setTransform:&v10];
  chevronImageView = self->_chevronImageView;
  CGAffineTransform v10 = v11;
  [(UIImageView *)chevronImageView setTransform:&v10];
  if (self->_state) {
    double width = self->_bitmapMaskSize.width * 0.5;
  }
  else {
    double width = self->_bitmapMaskSize.width;
  }
  double v8 = floor(self->_bitmapMaskSize.height * 0.5);
  -[MTMaterialView setCenter:](self->_materialView, "setCenter:", width, v8);
  -[UIView setCenter:](self->_tongueMaskView, "setCenter:", width, v8);
  -[UIImageView setCenter:](self->_chevronImageView, "setCenter:", width, v8);
  double v9 = 0.0;
  if (self->_state == 1) {
    double v9 = 1.0;
  }
  [(UIImageView *)self->_chevronImageView setAlpha:v9];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSlideOverTongueView;
  if (-[SBSlideOverTongueView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    tongueContainerView = self->_tongueContainerView;
    -[SBSlideOverTongueView convertPoint:toView:](self, "convertPoint:toView:", tongueContainerView, x, y);
    char v8 = -[UIView pointInside:withEvent:](tongueContainerView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (void)_handleTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained slideOverTongueViewTapped:self];
}

- (SBSlideOverTongueViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSlideOverTongueViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)direction
{
  return self->_direction;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_tongueMaskView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_tongueContainerView, 0);
}

@end