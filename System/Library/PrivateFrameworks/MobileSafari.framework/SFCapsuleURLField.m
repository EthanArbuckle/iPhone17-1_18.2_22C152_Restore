@interface SFCapsuleURLField
- (BOOL)showsVoiceSearchButton;
- (CGAffineTransform)keyContentTransform;
- (CGAffineTransform)microphoneContentTransform;
- (CGRect)keyContentRect;
- (NSNumber)microphoneContentOriginX;
- (SFCapsuleURLField)initWithTextField:(id)a3;
- (UITextField)textField;
- (_NSRange)rangeOfKeyText;
- (double)nonKeyContentAlpha;
- (id)_newDimmingButtonWithSystemImageNamed:(id)a3 action:(SEL)a4 accessibilityIdentifier:(id)a5;
- (id)buttonPointerStyleProvider;
- (id)voiceSearchTappedAction;
- (void)_clearTextButtonTapped:(id)a3;
- (void)_tap:(id)a3;
- (void)_updateClearButtonVisibility;
- (void)_updatePlaceholderText;
- (void)_voiceSearchAvailabilityDidChange:(id)a3;
- (void)_voiceSearchButtonTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForDeferredRemoval;
- (void)setButtonPointerStyleProvider:(id)a3;
- (void)setKeyContentTransform:(CGAffineTransform *)a3;
- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3;
- (void)setNonKeyContentAlpha:(double)a3;
- (void)setRangeOfKeyText:(_NSRange)a3;
- (void)setShowsVoiceSearchButton:(BOOL)a3;
- (void)setVoiceSearchTappedAction:(id)a3;
- (void)updateConstraints;
@end

@implementation SFCapsuleURLField

- (SFCapsuleURLField)initWithTextField:(id)a3
{
  v78[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v75.receiver = self;
  v75.super_class = (Class)SFCapsuleURLField;
  v6 = -[SFCapsuleURLField initWithFrame:](&v75, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    id obj = a3;
    v73 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v6 action:sel__tap_];
    -[SFCapsuleURLField addGestureRecognizer:](v6, "addGestureRecognizer:");
    uint64_t v7 = [(SFCapsuleURLField *)v6 _newDimmingButtonWithSystemImageNamed:@"xmark.circle.fill" action:sel__clearTextButtonTapped_ accessibilityIdentifier:@"ClearTextButton"];
    clearTextButton = v6->_clearTextButton;
    v6->_clearTextButton = (_SFDimmingButton *)v7;

    if ([(UIView *)v6 _sf_usesLeftToRightLayout]) {
      double v10 = 0.0;
    }
    else {
      double v10 = 8.0;
    }
    -[_SFDimmingButton setImageEdgeInsets:](v6->_clearTextButton, "setImageEdgeInsets:", 0.0, v10);
    [(_SFDimmingButton *)v6->_clearTextButton setPointerInteractionEnabled:1];
    [(_SFDimmingButton *)v6->_clearTextButton setPointerStyleProvider:&__block_literal_global_43];
    [(SFCapsuleURLField *)v6 addSubview:v6->_clearTextButton];
    v62 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(_SFDimmingButton *)v6->_clearTextButton trailingAnchor];
    v66 = [(SFCapsuleURLField *)v6 trailingAnchor];
    v64 = [v69 constraintEqualToAnchor:v66];
    v78[0] = v64;
    v63 = [(_SFDimmingButton *)v6->_clearTextButton topAnchor];
    v11 = [(SFCapsuleURLField *)v6 topAnchor];
    v12 = [v63 constraintEqualToAnchor:v11];
    v78[1] = v12;
    v13 = [(_SFDimmingButton *)v6->_clearTextButton bottomAnchor];
    [(SFCapsuleURLField *)v6 bottomAnchor];
    v14 = v74 = v5;
    v15 = [v13 constraintEqualToAnchor:v14];
    v78[2] = v15;
    v16 = [(_SFDimmingButton *)v6->_clearTextButton widthAnchor];
    v17 = [v16 constraintEqualToConstant:44.0];
    v78[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
    [v62 activateConstraints:v18];

    if (objc_opt_respondsToSelector()) {
      [v74 setPreserveSelectionOnResignFirstResponder:1];
    }
    p_textField = (id *)&v6->_textField;
    objc_storeStrong((id *)&v6->_textField, obj);
    [(UITextField *)v6->_textField setAutocapitalizationType:0];
    [(UITextField *)v6->_textField setAutocorrectionType:1];
    [(UITextField *)v6->_textField setClearButtonMode:0];
    [(UITextField *)v6->_textField setKeyboardType:10];
    v20 = _WBSLocalizedString();
    [(UITextField *)v6->_textField setPlaceholder:v20];

    [(UITextField *)v6->_textField setSemanticContentAttribute:3];
    [(UITextField *)v6->_textField setSmartDashesType:1];
    [(UITextField *)v6->_textField setSmartQuotesType:1];
    [(UITextField *)v6->_textField setTintAdjustmentMode:1];
    [(UITextField *)v6->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(UITextField *)v6->_textField trailingAnchor];
    v22 = [(_SFDimmingButton *)v6->_clearTextButton leadingAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22];
    textFieldTrailingConstraint = v6->_textFieldTrailingConstraint;
    v6->_textFieldTrailingConstraint = (NSLayoutConstraint *)v23;

    [(UITextField *)v6->_textField setAdjustsFontForContentSizeCategory:1];
    v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UITextField *)v6->_textField setFont:v25];

    [v74 addTarget:v6 action:sel_textFieldDidChange_ forControlEvents:0x20000];
    [(SFCapsuleURLField *)v6 addSubview:v6->_textField];
    if ([(UIView *)v6 _sf_usesLeftToRightLayout]) {
      double v26 = 12.0;
    }
    else {
      double v26 = 4.0;
    }
    v27 = _SFAccessibilityIdentifierForBarItem(4uLL);
    uint64_t v28 = [(SFCapsuleURLField *)v6 _newDimmingButtonWithSystemImageNamed:@"mic.fill" action:sel__voiceSearchButtonTapped_ accessibilityIdentifier:v27];
    voiceSearchButton = v6->_voiceSearchButton;
    v6->_voiceSearchButton = (_SFDimmingButton *)v28;

    [(_SFDimmingButton *)v6->_voiceSearchButton _setDisableDictationTouchCancellation:1];
    [(UIView *)v6->_voiceSearchButton sf_configureLargeContentViewerForBarItem:4];
    v30 = v6->_voiceSearchButton;
    id v31 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(_SFDimmingButton *)v30 addInteraction:v31];

    v32 = [(_SFDimmingButton *)v6->_voiceSearchButton trailingAnchor];
    v33 = [(_SFDimmingButton *)v6->_clearTextButton leadingAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    voiceSearchToClearButtonConstraint = v6->_voiceSearchToClearButtonConstraint;
    v6->_voiceSearchToClearButtonConstraint = (NSLayoutConstraint *)v34;

    v36 = [(_SFDimmingButton *)v6->_voiceSearchButton trailingAnchor];
    v37 = [(SFCapsuleURLField *)v6 trailingAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:-2.0];
    voiceSearchToCapsuleConstraint = v6->_voiceSearchToCapsuleConstraint;
    v6->_voiceSearchToCapsuleConstraint = (NSLayoutConstraint *)v38;

    v70 = [(_SFDimmingButton *)v6->_voiceSearchButton topAnchor];
    v67 = [(SFCapsuleURLField *)v6 topAnchor];
    v65 = [v70 constraintEqualToAnchor:v67];
    v77[0] = v65;
    v40 = [(_SFDimmingButton *)v6->_voiceSearchButton bottomAnchor];
    v41 = [(SFCapsuleURLField *)v6 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v77[1] = v42;
    v43 = [(_SFDimmingButton *)v6->_voiceSearchButton widthAnchor];
    v44 = [v43 constraintEqualToConstant:44.0];
    v77[2] = v44;
    v45 = [(_SFDimmingButton *)v6->_voiceSearchButton leadingAnchor];
    v46 = [*p_textField trailingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v77[3] = v47;
    uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
    voiceSearchButtonConstraints = v6->_voiceSearchButtonConstraints;
    v6->_voiceSearchButtonConstraints = (NSArray *)v48;

    v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v50 addObserver:v6 selector:sel__voiceSearchAvailabilityDidChange_ name:@"SFVoiceSearchAvailabilityDidChangeNotification" object:0];

    [(SFCapsuleURLField *)v6 _voiceSearchAvailabilityDidChange:0];
    v68 = (void *)MEMORY[0x1E4F28DC8];
    v71 = [*p_textField leadingAnchor];
    v51 = [(SFCapsuleURLField *)v6 leadingAnchor];
    v52 = [v71 constraintEqualToAnchor:v51 constant:v26];
    v76[0] = v52;
    v76[1] = v6->_textFieldTrailingConstraint;
    v53 = [*p_textField topAnchor];
    v54 = [(SFCapsuleURLField *)v6 topAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    v76[2] = v55;
    v56 = [*p_textField centerYAnchor];
    v57 = [(SFCapsuleURLField *)v6 centerYAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    v76[3] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
    [v68 activateConstraints:v59];

    id v5 = v74;
    v6->_nonKeyContentAlpha = 1.0;
    v60 = v6;
  }
  return v6;
}

id __39__SFCapsuleURLField_initWithTextField___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 imageView];
  [v3 bounds];
  objc_msgSend(v2, "convertRect:fromView:", v3);
  CGRect v26 = CGRectInset(v25, 1.0, 1.0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
  [v8 setShadowPath:v9];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v2 parameters:v8];
  v11 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v10];
  v12 = [v2 superview];
  objc_msgSend(v12, "convertRect:fromView:", v2, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v27.origin.double x = v14;
  v27.origin.double y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  v21 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v14, v16, v18, v20, CGRectGetHeight(v27) * 0.5);
  v22 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:v21];

  return v22;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleURLField;
  [(SFCapsuleURLField *)&v4 dealloc];
}

- (id)_newDimmingButtonWithSystemImageNamed:(id)a3 action:(SEL)a4 accessibilityIdentifier:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4FB14D8];
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 plainButtonConfiguration];
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  double v13 = [v11 background];
  [v13 setBackgroundColor:v12];

  objc_msgSend(v11, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  double v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v10];

  [v11 setImage:v14];
  double v15 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
  [v11 setPreferredSymbolConfigurationForImage:v15];

  double v16 = +[_SFDimmingButton buttonWithConfiguration:v11 primaryAction:0];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setNormalImageAlpha:1.0];
  [v16 setHighlightedImageAlpha:0.2];
  double v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v16 setTintColor:v17];

  [v16 setAccessibilityIdentifier:v9];
  [v16 addTarget:self action:a4 forControlEvents:64];
  objc_msgSend(v16, "sf_applyContentSizeCategoryLimitsForToolbarButton");

  return v16;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleURLField;
  [(SFCapsuleURLField *)&v3 layoutSubviews];
  [(SFCapsuleURLField *)self _updatePlaceholderText];
}

- (void)prepareForDeferredRemoval
{
}

- (CGRect)keyContentRect
{
  p_rangeOfKeyText = &self->_rangeOfKeyText;
  NSUInteger v4 = self->_rangeOfKeyText.length + self->_rangeOfKeyText.location;
  id v5 = [(UITextField *)self->_textField text];
  if (v4 <= [v5 length])
  {
    NSUInteger location = p_rangeOfKeyText->location;
    uint64_t length = p_rangeOfKeyText->length;
  }
  else
  {
    v6 = [(UITextField *)self->_textField text];
    uint64_t length = [v6 length];

    NSUInteger location = 0;
  }

  textField = self->_textField;
  id v10 = [(UITextField *)textField beginningOfDocument];
  v11 = [(UITextField *)textField positionFromPosition:v10 offset:location];

  v12 = [(UITextField *)self->_textField positionFromPosition:v11 offset:length];
  double v13 = [(UITextField *)self->_textField textRangeFromPosition:v11 toPosition:v12];
  [(UITextField *)self->_textField firstRectForRange:v13];
  double x = v31.origin.x;
  double y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  if (CGRectIsNull(v31))
  {
    double v18 = self->_textField;
    [(UITextField *)v18 bounds];
    -[UITextField textRectForBounds:](v18, "textRectForBounds:");
    double x = v19;
    double y = v20;
    CGFloat width = v21;
    CGFloat height = v22;
  }
  [(UITextField *)self->_textField ss_untransformedFrame];
  double v24 = x + v23;
  double v26 = y + v25;

  double v27 = v24;
  double v28 = v26;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)setKeyContentTransform:(CGAffineTransform *)a3
{
  p_keyContentTransform = &self->_keyContentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_keyContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_keyContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_keyContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_keyContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_keyContentTransform->tdouble x = v9;
    *(_OWORD *)&p_keyContentTransform->a = v8;
    long long v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    [(UITextField *)self->_textField setTransform:v11];
  }
}

- (void)setNonKeyContentAlpha:(double)a3
{
  if (self->_nonKeyContentAlpha != a3)
  {
    self->_nonKeyContentAlpha = a3;
    -[_SFDimmingButton setAlpha:](self->_voiceSearchButton, "setAlpha:");
    [(SFCapsuleURLField *)self _updateClearButtonVisibility];
  }
}

- (NSNumber)microphoneContentOriginX
{
  objc_super v3 = [(_SFDimmingButton *)self->_voiceSearchButton imageView];
  if ([(SFCapsuleURLField *)self showsVoiceSearchButton])
  {
    NSUInteger v4 = NSNumber;
    [v3 frame];
    -[SFCapsuleURLField convertRect:fromView:](self, "convertRect:fromView:", self->_voiceSearchButton);
    id v5 = [v4 numberWithDouble:CGRectGetMinX(v8)];
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3
{
  p_microphoneContentTransform = &self->_microphoneContentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_microphoneContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_microphoneContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_microphoneContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_microphoneContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_microphoneContentTransform->tdouble x = v9;
    *(_OWORD *)&p_microphoneContentTransform->a = v8;
    long long v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    [(_SFDimmingButton *)self->_voiceSearchButton setTransform:v11];
  }
}

- (id)buttonPointerStyleProvider
{
  return (id)[(_SFDimmingButton *)self->_voiceSearchButton pointerStyleProvider];
}

- (void)setButtonPointerStyleProvider:(id)a3
{
}

- (BOOL)showsVoiceSearchButton
{
  id v2 = [(_SFDimmingButton *)self->_voiceSearchButton superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SFDimmingButton *)self->_voiceSearchButton superview];
  char v6 = (v5 == 0) ^ v3;

  if ((v6 & 1) == 0)
  {
    if (v3) {
      [(SFCapsuleURLField *)self addSubview:self->_voiceSearchButton];
    }
    else {
      [(_SFDimmingButton *)self->_voiceSearchButton removeFromSuperview];
    }
    [(SFCapsuleURLField *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)SFCapsuleURLField;
  [(SFCapsuleURLField *)&v6 updateConstraints];
  BOOL v3 = [(_SFDimmingButton *)self->_voiceSearchButton superview];
  BOOL v4 = v3 != 0;
  BOOL v5 = v3 == 0;

  [(NSLayoutConstraint *)self->_textFieldTrailingConstraint setActive:v5];
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_voiceSearchButtonConstraints, v4);
  [(SFCapsuleURLField *)self _updateClearButtonVisibility];
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  BOOL v4 = +[SFVoiceSearchManager sharedManager];
  uint64_t v5 = [v4 availability];

  [(SFCapsuleURLField *)self setShowsVoiceSearchButton:v5 != 0];
  [(_SFDimmingButton *)self->_voiceSearchButton setEnabled:v5 == 1];
  if (v5 == 1) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }
  [(_SFDimmingButton *)self->_voiceSearchButton setTintColor:v6];
}

- (void)_tap:(id)a3
{
}

- (void)_updateClearButtonVisibility
{
  BOOL v3 = [(UITextField *)self->_textField text];
  BOOL v4 = [v3 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_1EDA07C28];
  uint64_t v5 = [v4 length];

  id v6 = [(_SFDimmingButton *)self->_voiceSearchButton superview];

  if (v5)
  {
    uint64_t v7 = 1;
    double v8 = 1.0;
  }
  else
  {
    uint64_t v7 = [(UIView *)self _sf_usesLeftToRightLayout] ^ 1;
    double v8 = 0.2;
  }
  [(_SFDimmingButton *)self->_clearTextButton setHidden:v7 ^ 1];
  [(_SFDimmingButton *)self->_clearTextButton setAlpha:v8 * self->_nonKeyContentAlpha];
  [(_SFDimmingButton *)self->_clearTextButton setUserInteractionEnabled:v5 != 0];
  if (v6)
  {
    [(NSLayoutConstraint *)self->_voiceSearchToClearButtonConstraint setActive:v7];
    voiceSearchToCapsuleConstraint = self->_voiceSearchToCapsuleConstraint;
    [(NSLayoutConstraint *)voiceSearchToCapsuleConstraint setActive:v7 ^ 1];
  }
}

- (void)_updatePlaceholderText
{
  v15[1] = *MEMORY[0x1E4F143B8];
  textField = self->_textField;
  [(UITextField *)textField bounds];
  -[UITextField placeholderRectForBounds:](textField, "placeholderRectForBounds:");
  CGFloat Width = CGRectGetWidth(v16);
  if (Width != self->_lastPlaceholderWidth)
  {
    uint64_t v5 = _WBSLocalizedString();
    uint64_t v14 = *MEMORY[0x1E4FB06F8];
    id v6 = [(UITextField *)self->_textField _placeholderLabel];
    uint64_t v7 = [v6 font];
    v15[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v5 sizeWithAttributes:v8];
    double v10 = v9;

    if (v10 <= Width)
    {
      [(UITextField *)self->_textField setPlaceholder:v5];
    }
    else
    {
      v11 = _WBSLocalizedString();
      [(UITextField *)self->_textField setPlaceholder:v11];
    }
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v13 = [(UITextField *)self->_textField _placeholderLabel];
    [v13 setTextColor:v12];

    self->_lastPlaceholderCGFloat Width = Width;
  }
}

- (void)_clearTextButtonTapped:(id)a3
{
  [(UITextField *)self->_textField setText:&stru_1EDA07C28];
  textField = self->_textField;

  [(UITextField *)textField sendActionsForControlEvents:0x20000];
}

- (void)_voiceSearchButtonTapped:(id)a3
{
  voiceSearchTappedAction = (void (**)(void))self->_voiceSearchTappedAction;
  if (voiceSearchTappedAction) {
    voiceSearchTappedAction[2]();
  }
}

- (CGAffineTransform)keyContentTransform
{
  long long v3 = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[11].b;
  return self;
}

- (CGAffineTransform)microphoneContentTransform
{
  long long v3 = *(_OWORD *)&self[11].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[12].b;
  return self;
}

- (double)nonKeyContentAlpha
{
  return self->_nonKeyContentAlpha;
}

- (UITextField)textField
{
  return self->_textField;
}

- (id)voiceSearchTappedAction
{
  return self->_voiceSearchTappedAction;
}

- (void)setVoiceSearchTappedAction:(id)a3
{
}

- (_NSRange)rangeOfKeyText
{
  p_rangeOfKeyText = &self->_rangeOfKeyText;
  NSUInteger location = self->_rangeOfKeyText.location;
  NSUInteger length = p_rangeOfKeyText->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfKeyText:(_NSRange)a3
{
  self->_rangeOfKeyText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_voiceSearchTappedAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_voiceSearchButtonConstraints, 0);
  objc_storeStrong((id *)&self->_voiceSearchButton, 0);
  objc_storeStrong((id *)&self->_voiceSearchToCapsuleConstraint, 0);
  objc_storeStrong((id *)&self->_voiceSearchToClearButtonConstraint, 0);
  objc_storeStrong((id *)&self->_clearTextButton, 0);

  objc_storeStrong((id *)&self->_textFieldTrailingConstraint, 0);
}

@end