@interface NCNotificationSummaryOnboardingButton
- (void)_configureBackgroundViewIfNecessary;
- (void)_layoutBackgroundView;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NCNotificationSummaryOnboardingButton

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryOnboardingButton;
  [(NCNotificationSummaryOnboardingButton *)&v3 layoutSubviews];
  [(NCNotificationSummaryOnboardingButton *)self _configureBackgroundViewIfNecessary];
  [(NCNotificationSummaryOnboardingButton *)self _layoutBackgroundView];
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = self->_backgroundView;
    v7 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)self->_backgroundView setAlpha:0.25];
    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_backgroundView _setContinuousCornerRadius:8.0];
    v8 = self->_backgroundView;
    [(NCNotificationSummaryOnboardingButton *)self insertSubview:v8 atIndex:0];
  }
}

- (void)_layoutBackgroundView
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(NCNotificationSummaryOnboardingButton *)self bounds];
    -[UIView setFrame:](backgroundView, "setFrame:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryOnboardingButton;
  -[NCNotificationSummaryOnboardingButton setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
  {
    [(UIView *)self->_backgroundView setAlpha:0.1];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__NCNotificationSummaryOnboardingButton_setHighlighted___block_invoke;
    v5[3] = &unk_1E6A91BB0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.1];
  }
}

uint64_t __56__NCNotificationSummaryOnboardingButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 744) setAlpha:0.25];
}

- (void).cxx_destruct
{
}

@end