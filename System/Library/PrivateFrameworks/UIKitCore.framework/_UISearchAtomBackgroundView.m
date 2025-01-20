@interface _UISearchAtomBackgroundView
- (UIBlurEffect)blurEffect;
- (_UISearchAtomBackgroundView)initWithFrame:(CGRect)a3;
- (int64_t)selectionStyle;
- (void)_transitionFromBlurEffect:(id)a3 toBlurEffect:(id)a4;
- (void)_updateSelectionStyleMask;
- (void)layoutSubviews;
- (void)setBlurEffect:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
@end

@implementation _UISearchAtomBackgroundView

- (_UISearchAtomBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISearchAtomBackgroundView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UISearchAtomBackgroundView *)v3 _updateSelectionStyleMask];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomBackgroundView;
  [(UIView *)&v3 layoutSubviews];
  [(_UISearchAtomBackgroundView *)self _updateSelectionStyleMask];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");
}

- (void)setSelectionStyle:(int64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    [(_UISearchAtomBackgroundView *)self _updateSelectionStyleMask];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setBlurEffect:(id)a3
{
  v4 = (UIBlurEffect *)a3;
  [(_UISearchAtomBackgroundView *)self _transitionFromBlurEffect:self->_blurEffect toBlurEffect:v4];
  blurEffect = self->_blurEffect;
  self->_blurEffect = v4;
}

- (void)_transitionFromBlurEffect:(id)a3 toBlurEffect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 && v7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke;
    v20[3] = &unk_1E52D9F70;
    v20[4] = self;
    +[UIView performWithoutAnimation:v20];
  }
  [(UIVisualEffectView *)self->_visualEffectView setEffect:v6];
  if (v6 && !v8)
  {
    v9 = self->_visualEffectView;
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = 0;

    [(UIVisualEffectView *)v9 setEffect:0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke_2;
    v16 = &unk_1E52DFFB0;
    v17 = self;
    v18 = v9;
    id v19 = v6;
    v11 = v9;
    v12 = (void (**)(void *, uint64_t, void))_Block_copy(&v13);
    if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v13, v14, v15, v16, v17)|| !+[UIView _addCompletionWithPosition:v12])
    {
      v12[2](v12, 1, 0);
    }
  }
}

- (void)_updateSelectionStyleMask
{
  int64_t selectionStyle = self->_selectionStyle;
  if (selectionStyle <= 7)
  {
    if ((unint64_t)selectionStyle < 2)
    {
      uint64_t v4 = 15;
      goto LABEL_12;
    }
    if (selectionStyle == 4)
    {
      uint64_t v4 = 10;
      goto LABEL_12;
    }
LABEL_10:
    NSLog(&cfstr_UnexpectedSele.isa, a2, self->_selectionStyle);
    goto LABEL_11;
  }
  if (selectionStyle == 8)
  {
    uint64_t v4 = 5;
    goto LABEL_12;
  }
  if (selectionStyle != 12) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v4 = 0;
LABEL_12:
  v5 = [(UIView *)self layer];
  [v5 setMaskedCorners:v4];

  visualEffectView = self->_visualEffectView;
  id v11 = [(UIView *)self layer];
  [v11 cornerRadius];
  double v8 = v7;
  v9 = [(UIView *)self layer];
  v10 = [v9 cornerCurve];
  [(UIVisualEffectView *)visualEffectView _setCornerRadius:v10 == (void *)*MEMORY[0x1E4F39EA8] continuous:v4 maskedCorners:v8];
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end