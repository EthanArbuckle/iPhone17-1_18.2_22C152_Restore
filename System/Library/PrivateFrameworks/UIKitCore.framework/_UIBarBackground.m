@interface _UIBarBackground
- (BOOL)topAligned;
- (CGRect)frameForYOrigin:(double)a3 height:(double)a4;
- (NSString)groupName;
- (UIView)customBackgroundView;
- (_UIBarBackground)initWithCoder:(id)a3;
- (_UIBarBackground)initWithFrame:(CGRect)a3;
- (_UIBarBackgroundLayout)layout;
- (id)_backgroundEffectView;
- (id)_encodableSubviews;
- (id)_shadowView;
- (void)_orderSubviews;
- (void)_setupBackgroundValues;
- (void)_setupShadowView:(id)a3 effect:(id)a4 image:(id)a5 shadowColor:(id)a6 shadowTint:(id)a7 alpha:(double)a8;
- (void)_updateBackgroundViewVisiblity;
- (void)cleanupBackgroundViews;
- (void)layoutSubviews;
- (void)prepareBackgroundViews;
- (void)setCustomBackgroundView:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setLayout:(id)a3;
- (void)setTopAligned:(BOOL)a3;
- (void)set_backgroundEffectView:(id)a3;
- (void)set_shadowView:(id)a3;
- (void)transition:(unint64_t)a3 toLayout:(id)a4;
- (void)transitionBackgroundViews;
- (void)transitionBackgroundViewsAnimated:(BOOL)a3;
- (void)updateBackground;
@end

@implementation _UIBarBackground

- (void)_setupShadowView:(id)a3 effect:(id)a4 image:(id)a5 shadowColor:(id)a6 shadowTint:(id)a7 alpha:(double)a8
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a5;
  v18 = [v13 contentView];
  [v18 setImage:v17];

  [v18 setAlpha:a8];
  if (v14)
  {
    v20[0] = v14;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v13 setContentEffects:v19];

    if (v17)
    {
      [v18 setApplyTintColorToBackgroundColor:0];
      [v18 setBackgroundColor:0];
    }
    else
    {
      [v18 setApplyTintColorToBackgroundColor:1];
    }
  }
  else
  {
    [v13 setContentEffects:MEMORY[0x1E4F1CBF0]];
    [v18 setApplyTintColorToBackgroundColor:0];
    [v18 setBackgroundColor:v15];
    [v18 setTintColor:v16];
  }
}

- (void)transitionBackgroundViewsAnimated:(BOOL)a3
{
  if (a3
    && (v6[0] = MEMORY[0x1E4F143A8],
        v6[1] = 3221225472,
        v6[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke,
        v6[3] = &unk_1E52DC3A0,
        v6[4] = self,
        +[UIView _addCompletion:v6]))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_2;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
    [(_UIBarBackground *)self updateBackground];
    [(UIView *)self layoutIfNeeded];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_3;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

- (void)transitionBackgroundViews
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  [(_UIBarBackground *)self transitionBackgroundViewsAnimated:v3];
}

- (_UIBarBackgroundLayout)layout
{
  return (_UIBarBackgroundLayout *)self->_customBackgroundView;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)_UIBarBackground;
  [(UIView *)&v33 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[objc_class setFrame:](self[1].super.super.super.isa, "setFrame:");
  if ([(UIView *)self->_customBackgroundView shouldUseExplicitGeometry])
  {
    [(UIView *)self->_customBackgroundView backgroundHeight1];
    self->_double bg1LastLayoutHeight = v7;
    int v8 = [(UIView *)self->_customBackgroundView bg2Enabled];
    double v9 = 0.0;
    if (v8)
    {
      double bg1LastLayoutHeight = self->_bg1LastLayoutHeight;
      [(UIView *)self->_customBackgroundView backgroundHeight2];
      double v9 = bg1LastLayoutHeight + v11;
    }
  }
  else
  {
    self->_double bg1LastLayoutHeight = v6;
    double v9 = v6;
  }
  self->_double bg2LastLayoutHeight = v9;
  v12 = [(UIView *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  if (LOBYTE(self->_groupName))
  {
    [(UIView *)self->_customBackgroundView bgInset];
    double v16 = v15;
    double v17 = 0.0;
    -[UIView setFrame:](self->_topInsetView, "setFrame:", 0.0, 0.0, v4, v15);
    -[UIView setFrame:](self->_effectView1, "setFrame:", 0.0, 0.0, v4, self->_bg1LastLayoutHeight);
    -[UIImageView setFrame:](self->_colorAndImageView1, "setFrame:", 0.0, v16, v4, self->_bg1LastLayoutHeight - v16);
    double v18 = 0.0;
    if ([(UIView *)self->_customBackgroundView bg1HasShadow])
    {
      v19 = [(UIView *)self->_customBackgroundView bg1ShadowImage];
      v20 = v19;
      if (v19)
      {
        [v19 size];
        double v18 = v21;
      }
      else if (v14 <= 1.0)
      {
        double v18 = 1.0;
      }
      else
      {
        double v18 = 1.0 / v14;
      }
    }
    -[UIView setFrame:](self->_shadowView1, "setFrame:", 0.0, self->_bg1LastLayoutHeight, v4, v18);
    -[UIView setFrame:](self->_effectView2, "setFrame:", 0.0, 0.0, v4, self->_bg2LastLayoutHeight);
    -[UIImageView setFrame:](self->_colorAndImageView2, "setFrame:", 0.0, 0.0, v4, self->_bg2LastLayoutHeight);
    if ([(UIView *)self->_customBackgroundView bg2HasShadow])
    {
      v26 = [(UIView *)self->_customBackgroundView bg2ShadowImage];
      v27 = v26;
      if (v26)
      {
        [v26 size];
        double v17 = v28;
      }
      else if (v14 <= 1.0)
      {
        double v17 = 1.0;
      }
      else
      {
        double v17 = 1.0 / v14;
      }
    }
    double bg2LastLayoutHeight = self->_bg2LastLayoutHeight;
  }
  else
  {
    double v17 = 0.0;
    -[UIView setFrame:](self->_topInsetView, "setFrame:", 0.0, v6, v4, 0.0);
    -[UIView setFrame:](self->_effectView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight, v4);
    -[UIImageView setFrame:](self->_colorAndImageView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight, v4);
    double v22 = 0.0;
    if ([(UIView *)self->_customBackgroundView bg1HasShadow])
    {
      v23 = [(UIView *)self->_customBackgroundView bg1ShadowImage];
      v24 = v23;
      if (v23)
      {
        [v23 size];
        double v22 = v25;
      }
      else if (v14 > 1.0)
      {
        double v22 = 1.0 / v14;
      }
      else
      {
        double v22 = 1.0;
      }
    }
    -[UIView setFrame:](self->_shadowView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight - v22, v4, v22);
    -[UIView setFrame:](self->_effectView2, "setFrame:", 0.0, v6 - self->_bg2LastLayoutHeight, v4);
    -[UIImageView setFrame:](self->_colorAndImageView2, "setFrame:", 0.0, v6 - self->_bg2LastLayoutHeight, v4);
    if ([(UIView *)self->_customBackgroundView bg2HasShadow])
    {
      v30 = [(UIView *)self->_customBackgroundView bg2ShadowImage];
      v31 = v30;
      if (v30)
      {
        [v30 size];
        double v17 = v32;
      }
      else if (v14 > 1.0)
      {
        double v17 = 1.0 / v14;
      }
      else
      {
        double v17 = 1.0;
      }
    }
    double bg2LastLayoutHeight = v6 - self->_bg2LastLayoutHeight - v17;
  }
  -[UIView setFrame:](self->_shadowView2, "setFrame:", 0.0, bg2LastLayoutHeight, v4, v17);
}

- (void)cleanupBackgroundViews
{
  id v8 = [(UIView *)self->_customBackgroundView bg1Effects];
  if (![v8 count])
  {
    [(UIView *)self->_effectView1 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~2u;
  }
  uint64_t v3 = [(UIView *)self->_customBackgroundView bg1Image];
  uint64_t v4 = [(UIView *)self->_customBackgroundView bg1Color];
  if (!(v3 | v4))
  {
    [(UIView *)self->_topInsetView removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~1u;
    [(UIView *)self->_colorAndImageView1 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~4u;
  }
  if (([(UIView *)self->_customBackgroundView bg1HasShadow] & 1) == 0)
  {
    [(UIView *)self->_shadowView1 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~8u;
  }
  if ([(UIView *)self->_customBackgroundView bg2Enabled])
  {
    double v5 = [(UIView *)self->_customBackgroundView bg2Effects];
    if (![v5 count])
    {
      [(UIView *)self->_effectView2 removeFromSuperview];
      *(unsigned char *)&self->_backgroundFlags &= ~0x10u;
    }
    uint64_t v6 = [(UIView *)self->_customBackgroundView bg2Image];
    uint64_t v7 = [(UIView *)self->_customBackgroundView bg2Color];
    if (!(v6 | v7))
    {
      [(UIView *)self->_colorAndImageView2 removeFromSuperview];
      *(unsigned char *)&self->_backgroundFlags &= ~0x20u;
    }
    if (([(UIView *)self->_customBackgroundView bg2HasShadow] & 1) == 0)
    {
      [(UIView *)self->_shadowView2 removeFromSuperview];
      *(unsigned char *)&self->_backgroundFlags &= ~0x40u;
    }
  }
  else
  {
    [(UIView *)self->_effectView2 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~0x10u;
    [(UIView *)self->_colorAndImageView2 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~0x20u;
    [(UIView *)self->_shadowView2 removeFromSuperview];
    *(unsigned char *)&self->_backgroundFlags &= ~0x40u;
  }
}

- (void)prepareBackgroundViews
{
  id v32 = [(UIView *)self->_customBackgroundView bg1Effects];
  if ([v32 count])
  {
    if (!self->_effectView1)
    {
      uint64_t v3 = [UIVisualEffectView alloc];
      [(_UIBarBackground *)self frameForYOrigin:0.0 height:self->_bg1LastLayoutHeight];
      uint64_t v4 = -[UIVisualEffectView initWithFrame:](v3, "initWithFrame:");
      effectView1 = self->_effectView1;
      self->_effectView1 = v4;

      [(UIVisualEffectView *)self->_effectView1 _setGroupName:self->_layout];
    }
    *(unsigned char *)&self->_backgroundFlags |= 2u;
  }
  uint64_t v6 = [(UIView *)self->_customBackgroundView bg1Image];
  uint64_t v7 = [(UIView *)self->_customBackgroundView bg1Color];
  if (v6 | v7)
  {
    if (LOBYTE(self->_groupName))
    {
      [(UIView *)self->_customBackgroundView bgInset];
      double v9 = v8;
      if (v6 && v8 > 0.0)
      {
        if (!self->_topInsetView)
        {
          v10 = [UIView alloc];
          [(_UIBarBackground *)self frameForYOrigin:0.0 height:v9];
          double v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
          topInsetView = self->_topInsetView;
          self->_topInsetView = v11;

          double v13 = +[UIColor blackColor];
          [(UIView *)self->_topInsetView setBackgroundColor:v13];
        }
        *(unsigned char *)&self->_backgroundFlags |= 1u;
      }
    }
    else
    {
      double v9 = 0.0;
    }
    if (!self->_colorAndImageView1)
    {
      double v14 = [UIImageView alloc];
      [(_UIBarBackground *)self frameForYOrigin:v9 height:self->_bg1LastLayoutHeight - v9];
      double v15 = -[UIImageView initWithFrame:](v14, "initWithFrame:");
      colorAndImageView1 = self->_colorAndImageView1;
      self->_colorAndImageView1 = v15;
    }
    *(unsigned char *)&self->_backgroundFlags |= 4u;
  }
  if ([(UIView *)self->_customBackgroundView bg1HasShadow])
  {
    if (!self->_shadowView1)
    {
      double v17 = [_UIBarBackgroundShadowView alloc];
      [(_UIBarBackground *)self frameForYOrigin:self->_bg1LastLayoutHeight height:0.0];
      double v18 = -[UIVisualEffectView initWithFrame:](v17, "initWithFrame:");
      shadowView1 = self->_shadowView1;
      self->_shadowView1 = v18;
    }
    *(unsigned char *)&self->_backgroundFlags |= 8u;
  }
  if ([(UIView *)self->_customBackgroundView bg2Enabled])
  {
    v20 = [(UIView *)self->_customBackgroundView bg2Effects];
    if ([v20 count])
    {
      if (!self->_effectView2)
      {
        double v21 = [UIVisualEffectView alloc];
        [(_UIBarBackground *)self frameForYOrigin:self->_bg1LastLayoutHeight height:self->_bg2LastLayoutHeight - self->_bg1LastLayoutHeight];
        double v22 = -[UIVisualEffectView initWithFrame:](v21, "initWithFrame:");
        effectView2 = self->_effectView2;
        self->_effectView2 = v22;

        [(UIVisualEffectView *)self->_effectView2 _setGroupName:self->_layout];
      }
      *(unsigned char *)&self->_backgroundFlags |= 0x10u;
    }
    uint64_t v24 = [(UIView *)self->_customBackgroundView bg2Image];
    uint64_t v25 = [(UIView *)self->_customBackgroundView bg2Color];
    if (v24 | v25)
    {
      if (!self->_colorAndImageView2)
      {
        v26 = [UIImageView alloc];
        [(_UIBarBackground *)self frameForYOrigin:self->_bg1LastLayoutHeight height:self->_bg2LastLayoutHeight - self->_bg1LastLayoutHeight];
        v27 = -[UIImageView initWithFrame:](v26, "initWithFrame:");
        colorAndImageView2 = self->_colorAndImageView2;
        self->_colorAndImageView2 = v27;
      }
      *(unsigned char *)&self->_backgroundFlags |= 0x20u;
    }
    if ([(UIView *)self->_customBackgroundView bg2HasShadow])
    {
      if (!self->_shadowView2)
      {
        v29 = [_UIBarBackgroundShadowView alloc];
        [(_UIBarBackground *)self frameForYOrigin:self->_bg2LastLayoutHeight height:0.0];
        v30 = -[UIVisualEffectView initWithFrame:](v29, "initWithFrame:");
        shadowView2 = self->_shadowView2;
        self->_shadowView2 = v30;
      }
      *(unsigned char *)&self->_backgroundFlags |= 0x40u;
    }
  }
  [(_UIBarBackground *)self _orderSubviews];
}

- (void)updateBackground
{
  [(UIView *)self->_customBackgroundView bg1Alpha];
  double v4 = v3;
  double v5 = [(UIView *)self->_customBackgroundView bg1Effects];
  [(UIVisualEffectView *)self->_effectView1 setBackgroundEffects:v5];

  [(UIView *)self->_effectView1 setAlpha:v4];
  uint64_t v6 = [(UIView *)self->_customBackgroundView bg1Color];
  [(UIImageView *)self->_colorAndImageView1 setBackgroundColor:v6];

  uint64_t v7 = [(UIView *)self->_customBackgroundView bg1Image];
  [(UIImageView *)self->_colorAndImageView1 setImage:v7];

  [(UIImageView *)self->_colorAndImageView1 setContentMode:[(UIView *)self->_customBackgroundView bg1ImageMode]];
  [(UIView *)self->_customBackgroundView bg1ImageAlpha];
  [(UIView *)self->_colorAndImageView1 setAlpha:v4 * v8];
  shadowView1 = self->_shadowView1;
  v10 = [(UIView *)self->_customBackgroundView bg1ShadowEffect];
  double v11 = [(UIView *)self->_customBackgroundView bg1ShadowImage];
  v12 = [(UIView *)self->_customBackgroundView bg1ShadowColor];
  double v13 = [(UIView *)self->_customBackgroundView bg1ShadowTint];
  [(UIView *)self->_customBackgroundView bg1ShadowAlpha];
  -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", shadowView1, v10, v11, v12, v13);

  if ([(UIView *)self->_customBackgroundView bg2Enabled])
  {
    [(UIView *)self->_customBackgroundView bg2Alpha];
    double v15 = v14;
    double v16 = [(UIView *)self->_customBackgroundView bg2Effects];
    [(UIVisualEffectView *)self->_effectView2 setBackgroundEffects:v16];

    [(UIView *)self->_effectView2 setAlpha:v15];
    double v17 = [(UIView *)self->_customBackgroundView bg2Color];
    [(UIImageView *)self->_colorAndImageView2 setBackgroundColor:v17];

    double v18 = [(UIView *)self->_customBackgroundView bg2Image];
    [(UIImageView *)self->_colorAndImageView2 setImage:v18];

    [(UIImageView *)self->_colorAndImageView2 setContentMode:[(UIView *)self->_customBackgroundView bg2ImageMode]];
    [(UIView *)self->_colorAndImageView2 setAlpha:v15];
    v19 = [(UIView *)self->_customBackgroundView bg1Color];
    v20 = [(UIView *)self->_colorAndImageView1 traitCollection];
    double v21 = [v19 resolvedColorWithTraitCollection:v20];
    [v21 alphaComponent];
    double v23 = v22;

    uint64_t v24 = [(UIView *)self->_customBackgroundView bg2Color];
    uint64_t v25 = [(UIView *)self->_colorAndImageView2 traitCollection];
    v26 = [v24 resolvedColorWithTraitCollection:v25];
    [v26 alphaComponent];
    double v28 = v27;

    double v30 = v15 * v28;
    if (v30 == 1.0)
    {
      double v29 = v4 * v23;
      if (v4 * v23 == 1.0) {
        uint64_t v31 = 1;
      }
      else {
        uint64_t v31 = +[UIView _isInAnimationBlockWithAnimationsEnabled] ^ 1;
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
    -[UIView setHidden:](self->_effectView1, "setHidden:", v31, v29);
    [(UIView *)self->_effectView2 setHidden:v30 == 1.0];
    shadowView2 = self->_shadowView2;
    id v37 = [(UIView *)self->_customBackgroundView bg2ShadowEffect];
    v34 = [(UIView *)self->_customBackgroundView bg2ShadowImage];
    v35 = [(UIView *)self->_customBackgroundView bg2ShadowColor];
    v36 = [(UIView *)self->_customBackgroundView bg2ShadowTint];
    [(UIView *)self->_customBackgroundView bg2ShadowAlpha];
    -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", shadowView2, v37, v34, v35, v36);
  }
  else
  {
    [(UIView *)self->_effectView1 setHidden:0];
    [(UIView *)self->_effectView2 setHidden:0];
    [(UIVisualEffectView *)self->_effectView2 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
    [(UIImageView *)self->_colorAndImageView2 setBackgroundColor:0];
    [(UIImageView *)self->_colorAndImageView2 setImage:0];
    id v32 = self->_shadowView2;
    id v37 = [(UIVisualEffectView *)v32 contentView];
    [v37 alpha];
    -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", v32, 0, 0, 0, 0);
  }
}

- (void)_orderSubviews
{
  v16[9] = *MEMORY[0x1E4F143B8];
  char v3 = dyld_program_sdk_at_least();
  shadowView1 = 0;
  char backgroundFlags = (char)self->_backgroundFlags;
  if ((backgroundFlags & 8) != 0 && (v3 & 1) == 0) {
    shadowView1 = self->_shadowView1;
  }
  v16[0] = shadowView1;
  if ((backgroundFlags & 2) != 0) {
    effectView1 = self->_effectView1;
  }
  else {
    effectView1 = 0;
  }
  v16[1] = effectView1;
  if ((backgroundFlags & 4) != 0) {
    colorAndImageView1 = self->_colorAndImageView1;
  }
  else {
    colorAndImageView1 = 0;
  }
  v16[2] = colorAndImageView1;
  if (backgroundFlags) {
    topInsetView = self->_topInsetView;
  }
  else {
    topInsetView = 0;
  }
  v16[3] = topInsetView;
  if ((backgroundFlags & 0x40) != 0) {
    char v9 = v3;
  }
  else {
    char v9 = 1;
  }
  if (v9) {
    shadowView2 = 0;
  }
  else {
    shadowView2 = self->_shadowView2;
  }
  v16[4] = shadowView2;
  if ((backgroundFlags & 0x10) != 0) {
    effectView2 = self->_effectView2;
  }
  else {
    effectView2 = 0;
  }
  v16[5] = effectView2;
  if ((backgroundFlags & 0x20) != 0) {
    colorAndImageView2 = self->_colorAndImageView2;
  }
  else {
    colorAndImageView2 = 0;
  }
  double v13 = 0;
  v16[6] = colorAndImageView2;
  if ((backgroundFlags & 8) != 0 && ((v3 ^ 1) & 1) == 0) {
    double v13 = self->_shadowView1;
  }
  v16[7] = v13;
  if ((backgroundFlags & 0x40) != 0) {
    char v14 = v3 ^ 1;
  }
  else {
    char v14 = 1;
  }
  if (v14) {
    double v15 = 0;
  }
  else {
    double v15 = self->_shadowView2;
  }
  v16[8] = v15;
  [(UIView *)self _ensureViewsAreInstalledInRelativeOrder:v16 viewCount:9 insertionStartIndex:0];
}

- (CGRect)frameForYOrigin:(double)a3 height:(double)a4
{
  [(UIView *)self bounds];
  double v10 = v9 - a4 - a3;
  if (LOBYTE(self->_groupName)) {
    double v10 = a3;
  }
  double v11 = a4;
  result.size.height = v11;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v7;
  return result;
}

- (void)setTopAligned:(BOOL)a3
{
  LOBYTE(self->_groupName) = a3;
}

- (_UIBarBackground)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackground;
  char v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(_UIBarBackground *)v3 _setupBackgroundValues];
  }
  return v4;
}

- (void)_setupBackgroundValues
{
  [(UIView *)self setUserInteractionEnabled:0];
  [(UIView *)self bounds];
  self->_double bg2LastLayoutHeight = v3;
  self->_double bg1LastLayoutHeight = v3;
}

- (void)setLayout:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    double v5 = v6;
  }
}

- (void)setCustomBackgroundView:(id)a3
{
  Class v5 = (Class)a3;
  objc_super v6 = self + 1;
  Class isa = self[1].super.super.super.isa;
  if (isa != v5)
  {
    Class v8 = v5;
    [(objc_class *)isa removeFromSuperview];
    objc_storeStrong((id *)&self[1].super.super.super.isa, a3);
    if (v6->super.super.super.isa)
    {
      [(UIView *)self insertSubview:v6->super.super.super.isa atIndex:0];
      [(UIView *)self bounds];
      -[objc_class setFrame:](v6->super.super.super.isa, "setFrame:");
    }
    [(_UIBarBackground *)self _updateBackgroundViewVisiblity];
    Class v5 = v8;
  }
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  Class v5 = self->_layout;
  objc_super v6 = (_UIBarBackgroundLayout *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(_UIBarBackgroundLayout *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    Class v8 = (_UIBarBackgroundLayout *)[(_UIBarBackgroundLayout *)v10 copy];
    layout = self->_layout;
    self->_layout = v8;

    [(UIVisualEffectView *)self->_effectView1 _setGroupName:self->_layout];
    [(UIVisualEffectView *)self->_effectView2 _setGroupName:self->_layout];
  }
LABEL_9:
}

- (void)_updateBackgroundViewVisiblity
{
  Class isa = self[1].super.super.super.isa;
  int v4 = [(UIView *)self->_customBackgroundView bg2Enabled];
  BOOL v5 = isa == 0;
  BOOL v6 = isa != 0;
  if (v5) {
    uint64_t v7 = v4 ^ 1u;
  }
  else {
    uint64_t v7 = 1;
  }
  [(UIView *)self->_effectView1 setHidden:v6];
  [(UIImageView *)self->_colorAndImageView1 setHidden:v6];
  [(UIView *)self->_shadowView1 setHidden:v6];
  [(UIView *)self->_effectView2 setHidden:v7];
  [(UIImageView *)self->_colorAndImageView2 setHidden:v7];
  shadowView2 = self->_shadowView2;
  [(UIView *)shadowView2 setHidden:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_topInsetView, 0);
  objc_storeStrong((id *)&self->_shadowView2, 0);
  objc_storeStrong((id *)&self->_colorAndImageView2, 0);
  objc_storeStrong((id *)&self->_effectView2, 0);
  objc_storeStrong((id *)&self->_shadowView1, 0);
  objc_storeStrong((id *)&self->_colorAndImageView1, 0);
  objc_storeStrong((id *)&self->_effectView1, 0);
}

- (UIView)customBackgroundView
{
  return (UIView *)self[1].super.super.super.isa;
}

- (_UIBarBackground)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackground;
  double v3 = [(UIView *)&v6 initWithCoder:a3];
  int v4 = v3;
  if (v3) {
    [(_UIBarBackground *)v3 _setupBackgroundValues];
  }
  return v4;
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)transition:(unint64_t)a3 toLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"_UIBarBackground.m" lineNumber:263 description:@"Not yet implemented"];

  Class v8 = self->_customBackgroundView;
  id v9 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40___UIBarBackground_transition_toLayout___block_invoke;
  v11[3] = &unk_1E52DAF68;
  v11[4] = self;
  id v12 = v9;
  double v10 = v8;
  double v13 = v10;
  if (!+[UIView _addCompletion:v11]) {
    [(_UIBarBackground *)self setLayout:v9];
  }
}

- (id)_backgroundEffectView
{
  return 0;
}

- (void)set_backgroundEffectView:(id)a3
{
}

- (id)_shadowView
{
  return 0;
}

- (void)set_shadowView:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)&self->_layout->super.isa;
}

- (BOOL)topAligned
{
  return (BOOL)self->_groupName;
}

@end