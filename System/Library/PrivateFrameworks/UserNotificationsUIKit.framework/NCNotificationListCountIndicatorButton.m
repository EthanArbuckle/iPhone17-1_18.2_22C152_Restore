@interface NCNotificationListCountIndicatorButton
- (BOOL)shouldAllowLongPressInteraction;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListCountIndicatorButton)initWithTitle:(id)a3 symbolName:(id)a4 withFont:(id)a5 legibilitySettings:(id)a6;
- (NCNotificationListCountIndicatorButtonDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (id)_attributedStringWithText:(id)a3 symbolName:(id)a4 withFont:(id)a5;
- (int64_t)numberOfLines;
- (void)_buttonTapped:(id)a3;
- (void)_buttonTouchDown:(id)a3;
- (void)_buttonTouchEnded:(id)a3;
- (void)_configureButtonIfNecessary;
- (void)_configureLabelIfNecessary;
- (void)_layout;
- (void)_setLabelScaled:(BOOL)a3;
- (void)_updateHighlighting:(BOOL)a3;
- (void)_updateLongPressStateIsActiveTouch:(BOOL)a3;
- (void)hideContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setShouldAllowLongPressInteraction:(BOOL)a3;
@end

@implementation NCNotificationListCountIndicatorButton

- (NCNotificationListCountIndicatorButton)initWithTitle:(id)a3 symbolName:(id)a4 withFont:(id)a5 legibilitySettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NCNotificationListCountIndicatorButton;
  v14 = -[NCNotificationListCountIndicatorButton initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v14)
  {
    v15 = (SBUILegibilityLabel *)objc_alloc_init(MEMORY[0x1E4FA7CA0]);
    label = v14->_label;
    v14->_label = v15;

    v17 = [(NCNotificationListCountIndicatorButton *)v14 _attributedStringWithText:v10 symbolName:v11 withFont:v12];
    [(SBUILegibilityLabel *)v14->_label setAttributedText:v17];
    [(SBUILegibilityLabel *)v14->_label setFont:v12];
    [(SBUILegibilityLabel *)v14->_label setNumberOfLines:1];
    [(SBUILegibilityLabel *)v14->_label setLineBreakMode:4];
    [(SBUILegibilityLabel *)v14->_label setTextAlignment:1];
    LODWORD(v18) = 1036831949;
    [(SBUILegibilityLabel *)v14->_label setHyphenationFactor:v18];
    [(SBUILegibilityLabel *)v14->_label setOptions:2];
    [(SBUILegibilityLabel *)v14->_label setUserInteractionEnabled:0];
    [(SBUILegibilityLabel *)v14->_label setAlpha:0.0];
    v19 = [NSString stringWithFormat:@"focus-text-%@", v10];
    [(SBUILegibilityLabel *)v14->_label setAccessibilityIdentifier:v19];
    [(SBUILegibilityLabel *)v14->_label setLegibilitySettings:v13];
  }
  return v14;
}

- (void)hideContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke;
    v14[3] = &unk_1E6A91BB0;
    v14[4] = self;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke_2;
    id v12 = &unk_1E6A92320;
    id v13 = v6;
    [v8 _animateUsingSpringWithTension:1 friction:v14 interactive:&v9 animations:240.0 completion:20.0];
  }
  else if (v6)
  {
    v6[2](v6);
  }
  [(NCNotificationListCountIndicatorButton *)self setNeedsLayout];
}

uint64_t __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

uint64_t __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (int64_t)numberOfLines
{
  return [(SBUILegibilityLabel *)self->_label numberOfLines];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)[(SBUILegibilityLabel *)self->_label legibilitySettings];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCountIndicatorButton;
  [(NCNotificationListCountIndicatorButton *)&v3 layoutSubviews];
  [(NCNotificationListCountIndicatorButton *)self _configureButtonIfNecessary];
  [(NCNotificationListCountIndicatorButton *)self _configureLabelIfNecessary];
  [(NCNotificationListCountIndicatorButton *)self _layout];
}

- (void)_configureLabelIfNecessary
{
  objc_super v3 = [(SBUILegibilityLabel *)self->_label superview];

  if (!v3)
  {
    [(NCNotificationListCountIndicatorButton *)self addSubview:self->_label];
    label = self->_label;
    [(NCNotificationListCountIndicatorButton *)self sendSubviewToBack:label];
  }
}

- (void)_configureButtonIfNecessary
{
  if (!self->_button)
  {
    objc_super v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = self->_button;
    self->_button = v3;

    -[UIButton _setTouchInsets:](self->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
    [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
    [(NCNotificationListCountIndicatorButton *)self addSubview:self->_button];
    [(NCNotificationListCountIndicatorButton *)self bringSubviewToFront:self->_button];
    [(UIButton *)self->_button addTarget:self action:sel__buttonTouchDown_ forControlEvents:1];
    v5 = self->_button;
    [(UIButton *)v5 addTarget:self action:sel__buttonTouchEnded_ forControlEvents:352];
  }
}

- (void)_layout
{
  button = self->_button;
  [(NCNotificationListCountIndicatorButton *)self bounds];
  -[UIButton setFrame:](button, "setFrame:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  label = self->_label;
  if (label)
  {
    [(SBUILegibilityLabel *)label transform];
    label = self->_label;
  }
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v9 = v5;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SBUILegibilityLabel *)label setTransform:&v8];
  v6 = self->_label;
  [(NCNotificationListCountIndicatorButton *)self bounds];
  -[SBUILegibilityLabel setFrame:](v6, "setFrame:");
  [(SBUILegibilityLabel *)self->_label setAlpha:1.0];
  v7 = self->_label;
  long long v8 = v11;
  long long v9 = v12;
  long long v10 = v13;
  [(SBUILegibilityLabel *)v7 setTransform:&v8];
}

- (void)_buttonTapped:(id)a3
{
  double v4 = [(NCNotificationListCountIndicatorButton *)self delegate];
  id v9 = v4;
  if (!self->_longPressStartTime) {
    goto LABEL_5;
  }
  BOOL v5 = [(NCNotificationListCountIndicatorButton *)self shouldAllowLongPressInteraction];
  double v4 = v9;
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceDate:self->_longPressStartTime];
  double v8 = v7;

  double v4 = v9;
  if (v8 > 0.1) {
    [v9 buttonWasLongPressed:self];
  }
  else {
LABEL_5:
  }
    [v4 buttonWasTapped:self];
}

- (void)_updateHighlighting:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationListCountIndicatorButton *)self shouldAllowLongPressInteraction];
  if (!v3 || v5)
  {
    if (!v3)
    {
      [(SBUILegibilityLabel *)self->_label alpha];
      if (v7 < 1.0)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __62__NCNotificationListCountIndicatorButton__updateHighlighting___block_invoke;
        v8[3] = &unk_1E6A91BB0;
        v8[4] = self;
        [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:1 friction:v8 interactive:0 animations:240.0 completion:20.0];
      }
    }
  }
  else
  {
    label = self->_label;
    [(SBUILegibilityLabel *)label setAlpha:0.2];
  }
}

uint64_t __62__NCNotificationListCountIndicatorButton__updateHighlighting___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (void)_buttonTouchDown:(id)a3
{
  [(NCNotificationListCountIndicatorButton *)self _updateLongPressStateIsActiveTouch:1];

  [(NCNotificationListCountIndicatorButton *)self _updateHighlighting:1];
}

- (void)_buttonTouchEnded:(id)a3
{
  [(NCNotificationListCountIndicatorButton *)self _updateLongPressStateIsActiveTouch:0];

  [(NCNotificationListCountIndicatorButton *)self _updateHighlighting:0];
}

- (void)_updateLongPressStateIsActiveTouch:(BOOL)a3
{
  longPressStartTime = self->_longPressStartTime;
  if (a3)
  {
    if (longPressStartTime
      || ![(NCNotificationListCountIndicatorButton *)self shouldAllowLongPressInteraction])
    {
      return;
    }
    BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
    v6 = self->_longPressStartTime;
    self->_longPressStartTime = v5;

    double v7 = self;
    uint64_t v8 = 1;
  }
  else
  {
    self->_longPressStartTime = 0;

    double v7 = self;
    uint64_t v8 = 0;
  }

  [(NCNotificationListCountIndicatorButton *)v7 _setLabelScaled:v8];
}

- (void)_setLabelScaled:(BOOL)a3
{
  memset(&v10, 0, sizeof(v10));
  if (a3)
  {
    CGAffineTransformMakeScale(&v10, 1.15, 1.15);
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  label = self->_label;
  if (label) {
    [(SBUILegibilityLabel *)label transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v10;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    CGAffineTransform v7 = v10;
    v6[2] = __58__NCNotificationListCountIndicatorButton__setLabelScaled___block_invoke;
    v6[3] = &unk_1E6A931F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:1 friction:v6 interactive:0 animations:240.0 completion:20.0];
  }
}

uint64_t __58__NCNotificationListCountIndicatorButton__setLabelScaled___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

- (id)_attributedStringWithText:(id)a3 symbolName:(id)a4 withFont:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    if (v8)
    {
      id v15 = 0;
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  long long v11 = [MEMORY[0x1E4FB1830] configurationWithFont:v10];
  long long v12 = [MEMORY[0x1E4FB1818] _systemImageNamed:v9 withConfiguration:v11];
  long long v13 = [v12 imageWithRenderingMode:2];

  id v14 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v14 setImage:v13];
  id v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];

  if (v8 && v15)
  {
    int v16 = [(NCNotificationListCountIndicatorButton *)self _shouldReverseLayoutDirection];
    id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v18 = v17;
    if (v16)
    {
      v19 = [NSString stringWithFormat:@"%@ ", v8];
      v20 = (void *)[v18 initWithString:v19];

      [v20 appendAttributedString:v15];
    }
    else
    {
      v20 = (void *)[v17 initWithAttributedString:v15];
      id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
      v22 = [NSString stringWithFormat:@" %@", v8];
      v23 = (void *)[v21 initWithString:v22];
      [v20 appendAttributedString:v23];
    }
    goto LABEL_11;
  }
  if (v8)
  {
LABEL_9:
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
LABEL_11:

    id v15 = v20;
    goto LABEL_12;
  }
  if (!v15) {
LABEL_16:
  }
    id v15 = objc_alloc_init(MEMORY[0x1E4F28B18]);
LABEL_12:

  return v15;
}

- (BOOL)shouldAllowLongPressInteraction
{
  return self->_shouldAllowLongPressInteraction;
}

- (void)setShouldAllowLongPressInteraction:(BOOL)a3
{
  self->_shouldAllowLongPressInteraction = a3;
}

- (NCNotificationListCountIndicatorButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListCountIndicatorButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressStartTime, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end