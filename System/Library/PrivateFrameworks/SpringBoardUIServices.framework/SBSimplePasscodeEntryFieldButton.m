@interface SBSimplePasscodeEntryFieldButton
- (BOOL)isAnimatingUnreveal;
- (SBSimplePasscodeEntryFieldButton)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4 useLightStyle:(BOOL)a5;
- (void)layoutSubviews;
- (void)setAnimatingUnreveal:(BOOL)a3;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5;
@end

@implementation SBSimplePasscodeEntryFieldButton

- (SBSimplePasscodeEntryFieldButton)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4 useLightStyle:(BOOL)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v26.receiver = self;
  v26.super_class = (Class)SBSimplePasscodeEntryFieldButton;
  v10 = -[SBSimplePasscodeEntryFieldButton initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  if (v10)
  {
    v10->_useLightStyle = a5;
    p_CGFloat top = &v10->_paddingOutsideRing.top;
    v10->_paddingOutsideRing.CGFloat top = top;
    v10->_paddingOutsideRing.CGFloat left = left;
    v10->_paddingOutsideRing.CGFloat bottom = bottom;
    v10->_paddingOutsideRing.CGFloat right = right;
    [(SBSimplePasscodeEntryFieldButton *)v10 setUserInteractionEnabled:0];
    if (v11->_useLightStyle) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    objc_storeStrong((id *)&v11->_color, v13);

    id v14 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBSimplePasscodeEntryFieldButton *)v11 bounds];
    uint64_t v19 = objc_msgSend(v14, "initWithFrame:", v15 + v11->_paddingOutsideRing.left, *p_top + v16, v17 - (v11->_paddingOutsideRing.left + v11->_paddingOutsideRing.right), v18 - (*p_top + v11->_paddingOutsideRing.bottom));
    ringView = v11->_ringView;
    v11->_ringView = (UIView *)v19;

    [(SBSimplePasscodeEntryFieldButton *)v11 addSubview:v11->_ringView];
    v21 = v11->_ringView;
    [(UIView *)v21 frame];
    [(UIView *)v21 _setCornerRadius:v22 * 0.5];
    v23 = [(UIView *)v11->_ringView layer];
    objc_msgSend(v23, "setBorderColor:", -[UIColor cgColor](v11->_color, "cgColor"));

    v24 = [(UIView *)v11->_ringView layer];
    [MEMORY[0x1E4FA5F68] pinFixedDigitEntryFieldIndicatorStrokeSize];
    objc_msgSend(v24, "setBorderWidth:");
  }
  return v11;
}

- (void)layoutSubviews
{
  ringView = self->_ringView;
  [(SBSimplePasscodeEntryFieldButton *)self bounds];
  -[UIView setFrame:](ringView, "setFrame:", v4 + self->_paddingOutsideRing.left, v5 + self->_paddingOutsideRing.top, v6 - (self->_paddingOutsideRing.left + self->_paddingOutsideRing.right), v7 - (self->_paddingOutsideRing.top + self->_paddingOutsideRing.bottom));
  v8 = self->_ringView;
  [(UIView *)v8 frame];
  [(UIView *)v8 _setCornerRadius:v9 * 0.5];
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  if (fabs(a5) < 2.22044605e-16 || self->_revealed != a3)
  {
    self->_revealed = a3;
    BOOL v7 = !a4 || a3;
    if (!v7)
    {
      self->_animatingUnreveal = 1;
      *(_DWORD *)&a3 = self->_revealed;
    }
    BOOL v8 = !v7;
    double v9 = 0.392500013;
    if (a3) {
      double v9 = 0.0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke;
    v12[3] = &unk_1E5CCC580;
    v12[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke_2;
    v10[3] = &unk_1E5CCCDA8;
    BOOL v11 = v8;
    v10[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v12 options:v10 animations:v9 completion:a5];
  }
}

void __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 409))
  {
    id v3 = *(id *)(v2 + 448);
  }
  else
  {
    id v3 = [MEMORY[0x1E4F428B8] clearColor];
  }
  id v4 = v3;
  [*(id *)(*(void *)(a1 + 32) + 456) setBackgroundColor:v3];
}

uint64_t __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    *(unsigned char *)(*(void *)(result + 32) + 464) = 0;
  }
  return result;
}

- (BOOL)isAnimatingUnreveal
{
  return self->_animatingUnreveal;
}

- (void)setAnimatingUnreveal:(BOOL)a3
{
  self->_animatingUnreveal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end