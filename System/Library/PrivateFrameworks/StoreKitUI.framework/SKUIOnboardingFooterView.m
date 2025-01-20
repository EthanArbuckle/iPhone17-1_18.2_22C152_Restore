@interface SKUIOnboardingFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIOnboardingProgressView)progressView;
- (UIButton)leftButton;
- (UIButton)rightButton;
- (id)_newButton;
- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4;
- (void)_showButton:(id)a3 withTitle:(id)a4 animation:(int64_t)a5;
- (void)hideLeftButtonWithAnimation:(int64_t)a3;
- (void)hideRightButtonWithAnimation:(int64_t)a3;
- (void)layoutSubviews;
- (void)leftButton;
- (void)rightButton;
- (void)setProgressView:(id)a3;
- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4;
- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4;
@end

@implementation SKUIOnboardingFooterView

- (void)hideLeftButtonWithAnimation:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIOnboardingFooterView hideLeftButtonWithAnimation:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIOnboardingFooterView *)self _hideButton:self->_leftButton withAnimation:a3];
}

- (void)hideRightButtonWithAnimation:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIOnboardingFooterView hideRightButtonWithAnimation:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIOnboardingFooterView *)self _hideButton:self->_rightButton withAnimation:a3];
}

- (UIButton)leftButton
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIOnboardingFooterView *)v3 leftButton];
      }
    }
  }
  leftButton = self->_leftButton;
  if (!leftButton)
  {
    uint64_t v12 = [(SKUIOnboardingFooterView *)self _newButton];
    v13 = self->_leftButton;
    self->_leftButton = v12;

    [(SKUIOnboardingFooterView *)self addSubview:self->_leftButton];
    leftButton = self->_leftButton;
  }

  return leftButton;
}

- (UIButton)rightButton
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIOnboardingFooterView *)v3 rightButton];
      }
    }
  }
  rightButton = self->_rightButton;
  if (!rightButton)
  {
    uint64_t v12 = [(SKUIOnboardingFooterView *)self _newButton];
    v13 = self->_rightButton;
    self->_rightButton = v12;

    [(SKUIOnboardingFooterView *)self addSubview:self->_rightButton];
    rightButton = self->_rightButton;
  }

  return rightButton;
}

- (void)setProgressView:(id)a3
{
  uint64_t v5 = (SKUIOnboardingProgressView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIOnboardingFooterView setProgressView:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  progressView = self->_progressView;
  if (progressView != v5)
  {
    [(SKUIOnboardingProgressView *)progressView removeFromSuperview];
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView) {
      -[SKUIOnboardingFooterView addSubview:](self, "addSubview:");
    }
    [(SKUIOnboardingFooterView *)self setNeedsLayout];
  }
}

- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIOnboardingFooterView showLeftButtonWithTitle:animation:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [(SKUIOnboardingFooterView *)self leftButton];
  [(SKUIOnboardingFooterView *)self _showButton:v15 withTitle:v6 animation:a4];
}

- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIOnboardingFooterView showRightButtonWithTitle:animation:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [(SKUIOnboardingFooterView *)self rightButton];
  [(SKUIOnboardingFooterView *)self _showButton:v15 withTitle:v6 animation:a4];
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIOnboardingFooterView sizeThatFits:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v23 = self->_leftButton;
  v24 = self->_rightButton;
  uint64_t v14 = self->_progressView;
  uint64_t v15 = 0;
  v25 = v14;
  double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  do
  {
    -[UIButton sizeThatFits:](*(UIButton **)((char *)&v23 + v15), "sizeThatFits:", v16, v17, v23, v24, v25, v26);
    if (v13 < v19) {
      double v13 = v19;
    }
    double v12 = v12 + v18;
    v15 += 8;
  }
  while (v15 != 24);
  for (uint64_t i = 16; i != -8; i -= 8)

  double v21 = v12;
  double v22 = v13;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && ([v6 isHidden] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke;
    v17[3] = &unk_1E6422020;
    id v9 = v7;
    id v18 = v9;
    [v8 _performWithoutAnimation:v17];
    if (a4 == 2)
    {
      double v12 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3;
      v13[3] = &unk_1E6421FF8;
      v13[4] = self;
      id v14 = v9;
      [v12 animateWithDuration:v13 animations:0.5];
      uint64_t v11 = v14;
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
      uint64_t v10 = (void *)MEMORY[0x1E4FB1EB0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2;
      v15[3] = &unk_1E6422020;
      id v16 = v9;
      [v10 animateWithDuration:v15 animations:0.25];
      uint64_t v11 = v16;
    }

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  double v3 = v2;
  [*(id *)(a1 + 32) setHighlighted:0];
  BOOL v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3(uint64_t a1)
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
  double v2 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
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
      [(SKUIOnboardingFooterView *)self setNeedsLayout];
      break;
    case 2:
      if (self->_progressView)
      {
        [(SKUIOnboardingFooterView *)self bounds];
        double v12 = v11;
        [(UIButton *)v8 frame];
        double v14 = v13;
        double v16 = v15;
        [(SKUIOnboardingProgressView *)self->_progressView frame];
        double v21 = v17;
        if (self->_leftButton == v8) {
          double v21 = CGRectGetMaxX(*(CGRect *)&v17) - v14;
        }
        float v22 = (v12 - v16) * 0.5;
        double v23 = floorf(v22);
        [(UIButton *)v8 setAlpha:0.0];
        -[UIButton setFrame:](v8, "setFrame:", v21, v23, v14, v16);
        [(SKUIOnboardingFooterView *)self sendSubviewToBack:v8];
        v24 = (void *)MEMORY[0x1E4FB1EB0];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2;
        v27[3] = &unk_1E6421FF8;
        v28 = v8;
        v29 = self;
        [v24 animateWithDuration:v27 animations:0.5];
        v25 = v28;
        goto LABEL_11;
      }
LABEL_10:
      [(UIButton *)v8 setAlpha:0.0];
      [(SKUIOnboardingFooterView *)self layoutSubviews];
      uint64_t v26 = (void *)MEMORY[0x1E4FB1EB0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke;
      v30[3] = &unk_1E6422020;
      v31 = v8;
      [v26 animateWithDuration:v30 animations:0.25];
      v25 = v31;
LABEL_11:

      break;
  }
}

uint64_t __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 layoutSubviews];
}

- (SKUIOnboardingProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_leftButton, 0);
}

- (void)hideLeftButtonWithAnimation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hideRightButtonWithAnimation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)leftButton
{
}

- (void)rightButton
{
}

- (void)setProgressView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showLeftButtonWithTitle:(uint64_t)a3 animation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showRightButtonWithTitle:(uint64_t)a3 animation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end