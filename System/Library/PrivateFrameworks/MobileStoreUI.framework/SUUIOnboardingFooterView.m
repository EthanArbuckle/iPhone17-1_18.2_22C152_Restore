@interface SUUIOnboardingFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIOnboardingProgressView)progressView;
- (UIButton)leftButton;
- (UIButton)rightButton;
- (id)_newButton;
- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4;
- (void)_showButton:(id)a3 withTitle:(id)a4 animation:(int64_t)a5;
- (void)hideLeftButtonWithAnimation:(int64_t)a3;
- (void)hideRightButtonWithAnimation:(int64_t)a3;
- (void)layoutSubviews;
- (void)setProgressView:(id)a3;
- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4;
- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4;
@end

@implementation SUUIOnboardingFooterView

- (void)hideLeftButtonWithAnimation:(int64_t)a3
{
}

- (void)hideRightButtonWithAnimation:(int64_t)a3
{
}

- (UIButton)leftButton
{
  leftButton = self->_leftButton;
  if (!leftButton)
  {
    v4 = [(SUUIOnboardingFooterView *)self _newButton];
    v5 = self->_leftButton;
    self->_leftButton = v4;

    [(SUUIOnboardingFooterView *)self addSubview:self->_leftButton];
    leftButton = self->_leftButton;
  }
  return leftButton;
}

- (UIButton)rightButton
{
  rightButton = self->_rightButton;
  if (!rightButton)
  {
    v4 = [(SUUIOnboardingFooterView *)self _newButton];
    v5 = self->_rightButton;
    self->_rightButton = v4;

    [(SUUIOnboardingFooterView *)self addSubview:self->_rightButton];
    rightButton = self->_rightButton;
  }
  return rightButton;
}

- (void)setProgressView:(id)a3
{
  v5 = (SUUIOnboardingProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    v7 = v5;
    [(SUUIOnboardingProgressView *)progressView removeFromSuperview];
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView) {
      -[SUUIOnboardingFooterView addSubview:](self, "addSubview:");
    }
    progressView = (SUUIOnboardingProgressView *)[(SUUIOnboardingFooterView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](progressView, v5);
}

- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SUUIOnboardingFooterView *)self leftButton];
  [(SUUIOnboardingFooterView *)self _showButton:v7 withTitle:v6 animation:a4];
}

- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SUUIOnboardingFooterView *)self rightButton];
  [(SUUIOnboardingFooterView *)self _showButton:v7 withTitle:v6 animation:a4];
}

- (void)layoutSubviews
{
  [(SUUIOnboardingFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  progressView = self->_progressView;
  if (progressView)
  {
    [(SUUIOnboardingProgressView *)progressView frame];
    -[SUUIOnboardingProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v9 = v8;
    CGFloat v11 = v10;
    *(float *)&double v8 = (v4 - v8) * 0.5;
    double v12 = floorf(*(float *)&v8);
    *(float *)&double v8 = (v6 - v10) * 0.5;
    CGFloat v13 = floorf(*(float *)&v8);
    -[SUUIOnboardingProgressView setFrame:](self->_progressView, "setFrame:", v12, v13, v9, v10);
    v30.origin.x = v12;
    v30.origin.y = v13;
    v30.size.width = v9;
    v30.size.height = v11;
    double MaxX = CGRectGetMaxX(v30);
    double v15 = v4 - MaxX;
  }
  else
  {
    double v12 = v3 * 0.5;
    double MaxX = v3 * 0.5;
    double v15 = v3 * 0.5;
  }
  leftButton = self->_leftButton;
  if (leftButton && ([(UIButton *)leftButton isHidden] & 1) == 0)
  {
    [(UIButton *)self->_leftButton frame];
    float v18 = (v12 - v17) * 0.5;
    float v20 = (v6 - v19) * 0.5;
    -[UIButton setFrame:](self->_leftButton, "setFrame:", floorf(v18), floorf(v20));
  }
  rightButton = self->_rightButton;
  if (rightButton && ([(UIButton *)rightButton isHidden] & 1) == 0)
  {
    [(UIButton *)self->_rightButton frame];
    float v23 = MaxX + (v15 - v22) * 0.5;
    double v24 = floorf(v23);
    float v26 = (v6 - v25) * 0.5;
    v27 = self->_rightButton;
    double v28 = floorf(v26);
    -[UIButton setFrame:](v27, "setFrame:", v24, v28);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v15 = self->_leftButton;
  v16 = self->_rightButton;
  double v6 = self->_progressView;
  uint64_t v7 = 0;
  double v17 = v6;
  double v8 = *(double *)(MEMORY[0x263F00190] + 16);
  double v9 = *(double *)(MEMORY[0x263F00190] + 24);
  do
  {
    -[UIButton sizeThatFits:](*(UIButton **)((char *)&v15 + v7), "sizeThatFits:", v8, v9, v15, v16, v17, v18);
    if (v5 < v11) {
      double v5 = v11;
    }
    double v4 = v4 + v10;
    v7 += 8;
  }
  while (v7 != 24);
  for (uint64_t i = 16; i != -8; i -= 8)

  double v13 = v4;
  double v14 = v5;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && ([v6 isHidden] & 1) == 0)
  {
    double v8 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke;
    v17[3] = &unk_265400980;
    id v9 = v7;
    id v18 = v9;
    [v8 _performWithoutAnimation:v17];
    if (a4 == 2)
    {
      double v12 = (void *)MEMORY[0x263F82E00];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3;
      v13[3] = &unk_265400890;
      v13[4] = self;
      id v14 = v9;
      [v12 animateWithDuration:v13 animations:0.5];
      double v11 = v14;
    }
    else
    {
      if (a4 == 1)
      {
        [v9 setHidden:1];
        goto LABEL_10;
      }
      if (a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      double v10 = (void *)MEMORY[0x263F82E00];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2;
      v15[3] = &unk_265400980;
      id v16 = v9;
      [v10 animateWithDuration:v15 animations:0.25];
      double v11 = v16;
    }

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  double v3 = v2;
  [*(id *)(a1 + 32) setHighlighted:0];
  double v4 = *(void **)(a1 + 32);
  return [v4 setAlpha:v3];
}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 416))
  {
    [*(id *)(a1 + 40) frame];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    [*(id *)(*(void *)(a1 + 32) + 416) frame];
    double v12 = *(void **)(a1 + 40);
    if (v12 == *(void **)(*(void *)(a1 + 32) + 408))
    {
      CGFloat v8 = CGRectGetMaxX(*(CGRect *)&v8) - v5;
      double v12 = *(void **)(a1 + 40);
    }
    objc_msgSend(v12, "setFrame:", v8, v3, v5, v7);
  }
  double v13 = *(void **)(a1 + 40);
  return [v13 setAlpha:0.0];
}

- (id)_newButton
{
  double v2 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v2 setHidden:1];
  return v2;
}

- (void)_showButton:(id)a3 withTitle:(id)a4 animation:(int64_t)a5
{
  CGFloat v8 = (UIButton *)a3;
  id v9 = a4;
  [(UIButton *)v8 setEnabled:1];
  [(UIButton *)v8 setTitle:v9 forState:0];

  [(UIButton *)v8 sizeToFit];
  if (([(UIButton *)v8 isHidden] & 1) == 0)
  {
    [(UIButton *)v8 alpha];
    if (v10 > 0.00000011920929) {
      goto LABEL_13;
    }
  }
  [(UIButton *)v8 setHidden:0];
  switch(a5)
  {
    case 0:
      goto LABEL_10;
    case 1:
      [(UIButton *)v8 setAlpha:1.0];
LABEL_13:
      [(SUUIOnboardingFooterView *)self setNeedsLayout];
      break;
    case 2:
      if (self->_progressView)
      {
        [(SUUIOnboardingFooterView *)self bounds];
        double v12 = v11;
        [(UIButton *)v8 frame];
        double v14 = v13;
        double v16 = v15;
        [(SUUIOnboardingProgressView *)self->_progressView frame];
        double v21 = v17;
        if (self->_leftButton == v8) {
          double v21 = CGRectGetMaxX(*(CGRect *)&v17) - v14;
        }
        float v22 = (v12 - v16) * 0.5;
        double v23 = floorf(v22);
        [(UIButton *)v8 setAlpha:0.0];
        -[UIButton setFrame:](v8, "setFrame:", v21, v23, v14, v16);
        [(SUUIOnboardingFooterView *)self sendSubviewToBack:v8];
        double v24 = (void *)MEMORY[0x263F82E00];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2;
        v27[3] = &unk_265400890;
        double v28 = v8;
        v29 = self;
        [v24 animateWithDuration:v27 animations:0.5];
        double v25 = v28;
        goto LABEL_11;
      }
LABEL_10:
      [(UIButton *)v8 setAlpha:0.0];
      [(SUUIOnboardingFooterView *)self layoutSubviews];
      float v26 = (void *)MEMORY[0x263F82E00];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke;
      v30[3] = &unk_265400980;
      v31 = v8;
      [v26 animateWithDuration:v30 animations:0.25];
      double v25 = v31;
LABEL_11:

      break;
  }
}

uint64_t __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 40);
  return [v2 layoutSubviews];
}

- (SUUIOnboardingProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end