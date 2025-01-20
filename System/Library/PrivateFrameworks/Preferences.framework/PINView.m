@interface PINView
- (BOOL)becomeFirstResponder;
- (NSString)optionsButtonTitle;
- (PSPINEntryViewDelegate)delegate;
- (UIButton)optionsButton;
- (double)getCurrentTitleFontSize;
- (id)passcodeOptionsHandler;
- (id)stringValue;
- (void)_layoutBottomSubview:(id)a3 withMinY:(double)a4 withSize:(CGSize)a5;
- (void)hideError;
- (void)hideFailedAttempts;
- (void)layoutBottomSubview:(id)a3 withLabel:(id)a4 withMinY:(double)a5;
- (void)layoutSubviews;
- (void)layoutTopLabel:(id)a3 withMaxY:(double)a4;
- (void)notifyDelegatePINChanged;
- (void)notifyDelegatePINEntered;
- (void)optionsButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setOptionsButton:(id)a3;
- (void)setOptionsButtonTitle:(id)a3;
- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4;
- (void)setPasscodeOptionsHandler:(id)a3;
- (void)setShowsOptionsButton:(BOOL)a3;
- (void)setTitle:(id)a3 font:(id)a4;
- (void)showError:(id)a3 animate:(BOOL)a4;
- (void)showFailedAttempts:(int64_t)a3;
@end

@implementation PINView

- (void)showError:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  errorTitleLabel = self->_errorTitleLabel;
  if (!errorTitleLabel)
  {
    [(UILabel *)self->_titleLabel frame];
    v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v8, v9, v10, v11);
    v13 = self->_errorTitleLabel;
    self->_errorTitleLabel = v12;

    v14 = self->_errorTitleLabel;
    v15 = [(UILabel *)self->_titleLabel font];
    [(UILabel *)v14 setFont:v15];

    [(UILabel *)self->_errorTitleLabel setOpaque:0];
    [(UILabel *)self->_errorTitleLabel setBackgroundColor:0];
    [(UILabel *)self->_errorTitleLabel setTextAlignment:1];
    v16 = self->_errorTitleLabel;
    v17 = [(UILabel *)self->_titleLabel textColor];
    [(UILabel *)v16 setTextColor:v17];

    [(UILabel *)self->_errorTitleLabel accessibilitySetIdentification:@"errorTitleLabel"];
    [(UILabel *)self->_errorTitleLabel setNumberOfLines:0];
    [(UILabel *)self->_errorTitleLabel setAdjustsFontSizeToFitWidth:1];
    [(PINView *)self addSubview:self->_errorTitleLabel];
    [(UILabel *)self->_errorTitleLabel setAlpha:0.0];
    errorTitleLabel = self->_errorTitleLabel;
  }
  [(UILabel *)errorTitleLabel setText:v6];
  [(PINView *)self setStringValue:&stru_1EFB51FD0];
  if (!self->_error)
  {
    self->_error = 1;
    objc_initWeak(&location, self);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __29__PINView_showError_animate___block_invoke;
    v23 = &unk_1E5C600A8;
    objc_copyWeak(&v24, &location);
    uint64_t v18 = MEMORY[0x1AD0BE2A0](&v20);
    v19 = (void *)v18;
    if (v4) {
      objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:", v18, 0.3, v20, v21, v22, v23);
    }
    else {
      (*(void (**)(uint64_t))(v18 + 16))(v18);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __29__PINView_showError_animate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[51] setAlpha:0.0];
  [WeakRetained[52] setAlpha:1.0];
}

- (void)hideError
{
  if (self->_error)
  {
    self->_error = 0;
    [(UILabel *)self->_titleLabel setAlpha:1.0];
    errorTitleLabel = self->_errorTitleLabel;
    [(UILabel *)errorTitleLabel setAlpha:0.0];
  }
}

- (void)setTitle:(id)a3 font:(id)a4
{
  titleLabel = self->_titleLabel;
  id v7 = a4;
  [(UILabel *)titleLabel setText:a3];
  [(UILabel *)self->_titleLabel setFont:v7];
}

- (double)getCurrentTitleFontSize
{
  [(UILabel *)self->_titleLabel _actualScaleFactor];
  double v4 = v3;
  v5 = [(UILabel *)self->_titleLabel font];
  [v5 pointSize];
  double v7 = v4 * v6;

  return v7;
}

- (id)stringValue
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (void)notifyDelegatePINChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      double v8 = [(PINView *)self stringValue];
      [v9 pinView:self pinValueChanged:v8];
    }
  }
}

- (void)notifyDelegatePINEntered
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      double v8 = [(PINView *)self stringValue];
      [v9 pinView:self pinEntered:v8];
    }
  }
}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  pinPolicyLabel = self->_pinPolicyLabel;
  id v16 = v6;
  if (!pinPolicyLabel)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F42B38]);
    id v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v10 = self->_pinPolicyLabel;
    self->_pinPolicyLabel = v9;

    double v11 = self->_pinPolicyLabel;
    v12 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)self->_pinPolicyLabel setOpaque:0];
    [(UILabel *)self->_pinPolicyLabel setNumberOfLines:0];
    [(UILabel *)self->_pinPolicyLabel setBackgroundColor:0];
    [(UILabel *)self->_pinPolicyLabel setTextAlignment:1];
    v13 = self->_pinPolicyLabel;
    v14 = [(UILabel *)self->_titleLabel textColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)self->_pinPolicyLabel setAdjustsFontSizeToFitWidth:1];
    [(PINView *)self addSubview:self->_pinPolicyLabel];
    id v6 = v16;
    pinPolicyLabel = self->_pinPolicyLabel;
  }
  [(UILabel *)pinPolicyLabel setText:v6];
  double v15 = 0.0;
  if (v4) {
    double v15 = 1.0;
  }
  [(UILabel *)self->_pinPolicyLabel setAlpha:v15];
  [(PINView *)self setNeedsLayout];
}

- (void)showFailedAttempts:(int64_t)a3
{
  failureView = self->_failureView;
  if (!failureView)
  {
    id v6 = [FailureBarView alloc];
    [(PINView *)self frame];
    char v7 = -[FailureBarView initWithFrame:](v6, "initWithFrame:");
    id v8 = self->_failureView;
    self->_failureView = v7;

    failureView = self->_failureView;
  }
  [(PINView *)self addSubview:failureView];
  [(FailureBarView *)self->_failureView setFailureCount:a3];
  pinPolicyLabel = self->_pinPolicyLabel;
  if (pinPolicyLabel) {
    [(UILabel *)pinPolicyLabel setHidden:1];
  }
  [(PINView *)self setNeedsLayout];
}

- (void)hideFailedAttempts
{
  [(FailureBarView *)self->_failureView removeFromSuperview];
  pinPolicyLabel = self->_pinPolicyLabel;
  if (pinPolicyLabel) {
    [(UILabel *)pinPolicyLabel setHidden:0];
  }
  [(PINView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PINView;
  [(PINView *)&v26 layoutSubviews];
  double v3 = [(PINView *)self passcodeOptionsHandler];

  if (v3)
  {
    [(PINView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    v12 = [(PINView *)self optionsButton];
    v13 = (void *)MEMORY[0x1E4F42A30];
    v14 = [(UIButton *)self->_optionsButton titleLabel];
    double v15 = [v14 font];
    id v16 = [v15 fontDescriptor];
    [(PINView *)self getCurrentTitleFontSize];
    v17 = objc_msgSend(v13, "fontWithDescriptor:size:", v16);
    uint64_t v18 = [v12 titleLabel];
    [v18 setFont:v17];

    [v12 sizeToFit];
    [v12 frame];
    double v20 = v19;
    double v22 = v21;
    [(PINView *)self bounds];
    if (v20 >= v23 + -30.0) {
      double v20 = v23 + -30.0;
    }
    float v24 = (v9 - v20) * 0.5;
    double v25 = floorf(v24);
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    -[UIButton setFrame:](self->_optionsButton, "setFrame:", v25, CGRectGetMaxY(v27) - v22 + -10.0, v20, v22);
  }
}

- (UIButton)optionsButton
{
  optionsButton = self->_optionsButton;
  if (!optionsButton)
  {
    double v4 = objc_alloc_init(PINOptionsButton);
    CGFloat v5 = self->_optionsButton;
    self->_optionsButton = &v4->super;

    double v6 = self->_optionsButton;
    CGFloat v7 = [(PINView *)self optionsButtonTitle];
    if (v7)
    {
      [(UIButton *)v6 setTitle:v7 forState:0];
    }
    else
    {
      double v8 = PS_LocalizedStringForPINEntry(@"PASSCODE_OPTIONS");
      [(UIButton *)v6 setTitle:v8 forState:0];
    }
    [(UIButton *)self->_optionsButton addTarget:self action:sel_optionsButtonTapped forControlEvents:64];
    [(PINView *)self addSubview:self->_optionsButton];
    [(PINView *)self setNeedsLayout];
    optionsButton = self->_optionsButton;
  }
  return optionsButton;
}

- (void)setOptionsButtonTitle:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_optionsButtonTitle != (NSString *)v4)
  {
    CGFloat v11 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v11;
    if ((v4 & 1) == 0)
    {
      double v6 = (NSString *)[v11 copy];
      optionsButtonTitle = self->_optionsButtonTitle;
      self->_optionsButtonTitle = v6;

      optionsButton = self->_optionsButton;
      double v9 = self->_optionsButtonTitle;
      if (v9)
      {
        [(UIButton *)self->_optionsButton setTitle:v9 forState:0];
      }
      else
      {
        double v10 = PS_LocalizedStringForPINEntry(@"PASSCODE_OPTIONS");
        [(UIButton *)optionsButton setTitle:v10 forState:0];
      }
      uint64_t v4 = [(PINView *)self setNeedsLayout];
      uint64_t v5 = (uint64_t)v11;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setPasscodeOptionsHandler:(id)a3
{
  if (self->_passcodeOptionsHandler != a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    id passcodeOptionsHandler = self->_passcodeOptionsHandler;
    self->_id passcodeOptionsHandler = v4;

    [(PINView *)self setNeedsLayout];
  }
}

- (void)optionsButtonTapped
{
  id passcodeOptionsHandler = (void (**)(id, UIButton *))self->_passcodeOptionsHandler;
  if (passcodeOptionsHandler) {
    passcodeOptionsHandler[2](passcodeOptionsHandler, self->_optionsButton);
  }
}

- (void)setShowsOptionsButton:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v4 = [(PINView *)self optionsButton];
  }
  else
  {
    uint64_t v4 = self->_optionsButton;
  }
  uint64_t v5 = v4;
  [(UIButton *)v4 setHidden:!v3];
}

- (void)layoutTopLabel:(id)a3 withMaxY:(double)a4
{
  id v18 = a3;
  [(PINView *)self bounds];
  double v6 = a4 + -22.0;
  objc_msgSend(v18, "sizeThatFits:", v7 + -30.0, a4 + -22.0);
  if (v8 <= a4 + -22.0) {
    double v6 = v8;
  }
  PSRoundToPixel(a4 - v6);
  UIRectCenteredXInRect();
  double v9 = [MEMORY[0x1E4F42D90] mainScreen];
  [v9 scale];
  UIRectIntegralWithScale();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
}

- (void)layoutBottomSubview:(id)a3 withLabel:(id)a4 withMinY:(double)a5
{
  id v37 = a3;
  id v8 = a4;
  double v9 = (void *)MEMORY[0x1E4F42A30];
  double v10 = [v8 font];
  double v11 = [v10 fontDescriptor];
  double v12 = [v8 font];
  [v12 pointSize];
  double v14 = v13;

  [(PINView *)self getCurrentTitleFontSize];
  if (v14 < v15) {
    double v15 = v14;
  }
  double v16 = [v9 fontWithDescriptor:v11 size:v15];
  [v8 setFont:v16];

  [(PINView *)self bounds];
  double v17 = v39.size.width + -30.0;
  double v18 = CGRectGetMaxY(v39) + -10.0 - a5;
  objc_msgSend(v37, "sizeThatFits:", v17, v18);
  if (v20 <= v18) {
    double v21 = v20;
  }
  else {
    double v21 = v18;
  }
  if (v20 <= v18) {
    double v17 = v19;
  }
  -[PINView _layoutBottomSubview:withMinY:withSize:](self, "_layoutBottomSubview:withMinY:withSize:", v37, a5, v17, v21);
  optionsButton = self->_optionsButton;
  if (optionsButton)
  {
    if (([(UIButton *)optionsButton isHidden] & 1) == 0)
    {
      [v37 frame];
      double MaxY = CGRectGetMaxY(v40);
      [(UIButton *)self->_optionsButton frame];
      if (MaxY > CGRectGetMinY(v41) + -10.0)
      {
        float v24 = [(UIButton *)self->_optionsButton titleLabel];
        double v25 = [v24 text];
        double v26 = (double)(unint64_t)[v25 length];
        CGRect v27 = [v8 text];
        double v28 = v26 / (double)(unint64_t)[v27 length];

        if (v28 > 0.0 && v28 < 1.0)
        {
          [(UIButton *)self->_optionsButton frame];
          double v31 = v30;
          double v33 = v32;
          double v34 = PSRoundToPixel((v18 + -10.0) * v28 / (v28 + 1.0));
          [(PINView *)self frame];
          CGFloat v35 = CGRectGetMaxY(v42);
          double v36 = PSRoundToPixel(v35 - v34 + -10.0);
          -[UIButton setFrame:](self->_optionsButton, "setFrame:", v31, v36, v33, v34);
          v43.origin.x = v31;
          v43.origin.y = v36;
          v43.size.width = v33;
          v43.size.height = v34;
          -[PINView _layoutBottomSubview:withMinY:withSize:](self, "_layoutBottomSubview:withMinY:withSize:", v37, a5, v17, CGRectGetMinY(v43) + -10.0 - a5);
        }
      }
    }
  }
}

- (void)_layoutBottomSubview:(id)a3 withMinY:(double)a4 withSize:(CGSize)a5
{
  id v16 = a3;
  [(PINView *)self bounds];
  PSRoundToPixel(a4);
  UIRectCenteredXInRect();
  double v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  UIRectIntegralWithScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (PSPINEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSPINEntryViewDelegate *)WeakRetained;
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setOptionsButton:(id)a3
{
}

- (NSString)optionsButtonTitle
{
  return self->_optionsButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsButtonTitle, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinPolicyLabel, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end