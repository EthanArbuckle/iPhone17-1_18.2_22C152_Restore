@interface SiriUIKeyboardView
+ (double)_keyboardAccessoryViewHeight;
+ (double)_paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:(BOOL)a3;
+ (double)_textFieldHeight;
+ (id)_textFieldFont;
+ (id)inputAccessoryViewBackgroundColor;
- (BOOL)_showsReportBugButton;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGRect)_defaultFrame;
- (CGSize)intrinsicContentSize;
- (SiriUIKeyboardView)init;
- (SiriUIKeyboardView)initWithDelegate:(id)a3;
- (SiriUIKeyboardView)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4;
- (SiriUIKeyboardViewDelegate)delegate;
- (UIEdgeInsets)safeAreaInsets;
- (UITextField)textField;
- (double)_visibleHeightFromNotification:(id)a3;
- (id)_createHelpButton:(CGRect)a3;
- (id)_createTextFieldWithFrame:(CGRect)a3;
- (void)_audioRouteButtonTapped:(id)a3;
- (void)_configureAudioRoutePickerForAccessibility;
- (void)_configureReportBugButton;
- (void)_configureReportButtonForAccessibility;
- (void)_createReportBugButtonWithTemplateImage:(id)a3;
- (void)_helpButtonLongPressed:(id)a3;
- (void)_helpButtonTapped:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3;
- (void)_reportBugButtonLongPressed;
- (void)_reportBugButtonTapped;
- (void)_undoTextFieldEdit:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShowAudioRoutePicker:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextField:(id)a3;
@end

@implementation SiriUIKeyboardView

+ (id)_textFieldFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "siriui_typedTextInputFont");
}

+ (double)_textFieldHeight
{
  v2 = [a1 _textFieldFont];
  [v2 _scaledValueForValue:36.0];
  UIRoundToViewScale();
  double v4 = v3;

  return v4;
}

+ (double)_keyboardAccessoryViewHeight
{
  [a1 _textFieldHeight];
  return v2 + 20.0;
}

+ (id)inputAccessoryViewBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];
}

- (SiriUIKeyboardView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SiriUIKeyboardView *)self init];
  v6 = v5;
  if (v5) {
    [(SiriUIKeyboardView *)v5 setDelegate:v4];
  }

  return v6;
}

- (SiriUIKeyboardView)init
{
  self->_verticalCompensation = 0.0;
  [(SiriUIKeyboardView *)self _defaultFrame];
  return -[SiriUIKeyboardView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 1);
}

- (SiriUIKeyboardView)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SiriUIKeyboardView;
  id v4 = -[UIInputView initWithFrame:inputViewStyle:](&v16, sel_initWithFrame_inputViewStyle_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = -[SiriUIKeyboardView _createHelpButton:](v4, "_createHelpButton:", *MEMORY[0x263F001A8], v7, v8, v9);
    helpButton = v5->_helpButton;
    v5->_helpButton = (SiriUIHelpButton *)v10;

    uint64_t v12 = -[SiriUIKeyboardView _createTextFieldWithFrame:](v5, "_createTextFieldWithFrame:", v6, v7, v8, v9);
    textField = v5->_textField;
    v5->_textField = (UITextField *)v12;

    [(UITextField *)v5->_textField setInputAccessoryView:v5];
    [(SiriUIKeyboardView *)v5 _configureReportBugButton];
    [(SiriUIKeyboardView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriUIKeyboardView *)v5 addSubview:v5->_helpButton];
    [(SiriUIKeyboardView *)v5 addSubview:v5->_textField];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v5 selector:sel__keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];
    [v14 addObserver:v5 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];
  }
  return v5;
}

- (CGRect)_defaultFrame
{
  [(SiriUIKeyboardView *)self bounds];
  CGFloat Width = CGRectGetWidth(v8);
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = Width;
  result.size.height = v4;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIKeyboardView;
  [(SiriUIKeyboardView *)&v3 safeAreaInsetsDidChange];
  [(SiriUIKeyboardView *)self invalidateIntrinsicContentSize];
}

- (UIEdgeInsets)safeAreaInsets
{
  v17.receiver = self;
  v17.super_class = (Class)SiriUIKeyboardView;
  [(SiriUIKeyboardView *)&v17 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (v7 > 0.0)
  {
    v11 = [(SiriUIKeyboardView *)self superview];
    [v11 safeAreaInsets];
    double v8 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  [(SiriUIKeyboardView *)self safeAreaInsets];
  double v4 = v3;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  double v6 = v4 + v5;
  double v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v8 = ceil(v2);
  double v9 = ceil(v6);
  if (v10 < 2.0)
  {
    double v6 = v9;
    double v2 = v8;
  }

  double v11 = v2;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setText:(id)a3
{
}

- (BOOL)becomeFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIKeyboardView;
  [(SiriUIKeyboardView *)&v4 becomeFirstResponder];
  return [(UITextField *)self->_textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  char v3 = [(UITextField *)self->_textField resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)SiriUIKeyboardView;
  [(SiriUIKeyboardView *)&v5 resignFirstResponder];
  return v3;
}

- (void)layoutSubviews
{
  *(void *)&v99.size.height = self;
  v100 = SiriUIKeyboardView;
  [(CGFloat *)(objc_super *)&v99.size.height layoutSubviews];
  [(SiriUIKeyboardView *)self frame];
  CGFloat v4 = v3;
  double v92 = v5;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(SiriUIKeyboardView *)self safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v14 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D260]];
  [v14 scaledValueForValue:10.0];
  double v16 = v15;

  objc_super v17 = [(UITextField *)self->_textField layer];
  [v17 setCornerRadius:v16];

  BOOL v18 = SiriUIIsCompactWidth();
  double v19 = 25.0;
  if (v18) {
    double v19 = 15.0;
  }
  if (v19 < v11) {
    double v19 = v11;
  }
  double v87 = v19;
  [(SiriUIHelpButton *)self->_helpButton frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v90 = v7;
  CGFloat v91 = v4;
  v101.origin.CGFloat x = v4;
  double v28 = v92;
  v101.origin.CGFloat y = v92;
  v101.size.CGFloat width = v7;
  CGFloat v89 = v9;
  v101.size.height = v9;
  double v93 = v13;
  CGFloat v29 = CGRectGetHeight(v101) - v13;
  v102.origin.CGFloat x = v21;
  v102.origin.CGFloat y = v23;
  CGFloat rect_24 = v27;
  CGFloat v86 = v25;
  v102.size.CGFloat width = v25;
  v102.size.height = v27;
  CGFloat v30 = v29 - CGRectGetHeight(v102);
  double rect_16 = self->_verticalCompensation;
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat v32 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v33 = *(double *)(MEMORY[0x263F001A8] + 16);
  audioRoutePickerButton = self->_audioRoutePickerButton;
  double v35 = floor(v30 * 0.5);
  double v36 = v33;
  double v37 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v38 = v32;
  double v39 = *MEMORY[0x263F001A8];
  v99.size.CGFloat width = v37;
  if (audioRoutePickerButton)
  {
    double v96 = v35;
    char v40 = [(SiriUIAudioRoutePickerButton *)audioRoutePickerButton isHidden];
    double v35 = v96;
    double v36 = v33;
    double v38 = v32;
    double v39 = x;
    if ((v40 & 1) == 0)
    {
      [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton frame];
      CGFloat rect = v41;
      CGFloat rect_8a = v42;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      v103.origin.CGFloat y = v92;
      v103.origin.CGFloat x = v91;
      v103.size.CGFloat width = v90;
      v103.size.height = v89;
      v99.origin.CGFloat x = x;
      double MaxX = CGRectGetMaxX(v103);
      v104.origin.CGFloat x = rect;
      v104.origin.CGFloat y = v43;
      v104.size.CGFloat width = v45;
      v104.size.height = v47;
      double v39 = MaxX - CGRectGetWidth(v104) - v87;
      v105.origin.CGFloat x = v91;
      v105.origin.CGFloat y = v92;
      v105.size.CGFloat width = v90;
      v105.size.height = v89;
      CGFloat v49 = CGRectGetHeight(v105) - v93;
      v106.origin.CGFloat x = v39;
      v106.origin.CGFloat y = rect_8a;
      double v36 = v45;
      v106.size.CGFloat width = v45;
      double v37 = v47;
      v106.size.height = v47;
      double v28 = v92;
      double v38 = self->_verticalCompensation + v92 + floor((v49 - CGRectGetHeight(v106)) * 0.5);
      double v35 = v96;
      CGFloat x = v99.origin.x;
    }
  }
  double v50 = v28 + v35;
  reportBugButton = self->_reportBugButton;
  if (reportBugButton)
  {
    double rect_8 = v28 + v35;
    [(SiriUIContentButton *)reportBugButton frame];
    CGFloat v53 = v52;
    v99.size.CGFloat width = v54;
    CGFloat v56 = v55;
    CGFloat v97 = v39;
    CGFloat v58 = v57;
    v107.size.CGFloat width = v90;
    v107.origin.CGFloat x = v91;
    v107.origin.CGFloat y = v28;
    v107.size.height = v89;
    CGFloat v59 = CGRectGetHeight(v107) - v93;
    v108.origin.CGFloat x = v53;
    v108.origin.CGFloat y = v99.size.width;
    double v94 = v56;
    v108.size.CGFloat width = v56;
    v99.size.CGFloat width = v58;
    v108.size.height = v58;
    double v39 = v97;
    double v60 = floor((v59 - CGRectGetHeight(v108)) * 0.5);
    CGFloat v61 = v28;
    double v62 = self->_verticalCompensation + v28 + v60;
    v109.origin.CGFloat x = v97;
    double v63 = v38;
    v109.origin.CGFloat y = v38;
    v109.size.CGFloat width = v36;
    v109.size.height = v37;
    v99.origin.CGFloat y = v62;
    if (CGRectIsEmpty(v109))
    {
      v110.size.CGFloat width = v90;
      v110.origin.CGFloat x = v91;
      v110.origin.CGFloat y = v61;
      v110.size.height = v89;
      CGFloat v33 = v94;
      double v64 = v87;
      v99.origin.CGFloat x = CGRectGetMaxX(v110) - v94 - v87;
    }
    else
    {
      v111.origin.CGFloat x = v97;
      v111.origin.CGFloat y = v38;
      v111.size.CGFloat width = v36;
      v111.size.height = v37;
      CGFloat v66 = CGRectGetMinX(v111) - v87;
      v112.origin.CGFloat x = v53;
      CGFloat v67 = v62;
      double v64 = v87;
      v112.origin.CGFloat y = v67;
      v112.size.CGFloat width = v94;
      v112.size.height = v99.size.width;
      v99.origin.CGFloat x = v66 - CGRectGetWidth(v112);
      CGFloat v33 = v94;
    }
    double v38 = v63;
    double v50 = rect_8;
    double v65 = rect_16;
  }
  else
  {
    v99.origin.CGFloat x = x;
    v99.origin.CGFloat y = v32;
    double v64 = v87;
    double v65 = rect_16;
  }
  double v68 = v65 + v50;
  [(id)objc_opt_class() _textFieldHeight];
  double rect_16a = v69;
  v113.origin.CGFloat x = v39;
  v113.origin.CGFloat y = v38;
  v113.size.CGFloat width = v36;
  v113.size.height = v37;
  double v95 = v33;
  double v98 = v39;
  double v88 = v38;
  if (CGRectIsEmpty(v113))
  {
    v114.origin.CGFloat x = v99.origin.x;
    v114.origin.CGFloat y = v99.origin.y;
    v114.size.CGFloat width = v33;
    v114.size.height = v99.size.width;
    if (CGRectIsEmpty(v114))
    {
      v115.origin.CGFloat x = v91;
      v115.origin.CGFloat y = v92;
      v115.size.height = v89;
      v115.size.CGFloat width = v90;
      double MinX = CGRectGetMaxX(v115);
LABEL_26:
      double v79 = MinX;
      v120.origin.CGFloat x = v64;
      v120.origin.CGFloat y = v68;
      double v74 = rect_24;
      double v73 = v86;
      v120.size.CGFloat width = v86;
      v120.size.height = rect_24;
      double v71 = v79 - CGRectGetMaxX(v120) + v64 * -2.0;
      double v72 = rect_16a;
      goto LABEL_27;
    }
  }
  v116.origin.CGFloat x = v39;
  v116.origin.CGFloat y = v38;
  v116.size.CGFloat width = v36;
  v116.size.height = v37;
  if (!CGRectIsEmpty(v116))
  {
    v117.origin.CGFloat x = v99.origin.x;
    v117.origin.CGFloat y = v99.origin.y;
    v117.size.CGFloat width = v33;
    v117.size.height = v99.size.width;
    if (!CGRectIsEmpty(v117))
    {
      CGFloat v75 = v99.origin.x;
      CGFloat y = v99.origin.y;
      CGFloat v77 = v33;
      CGFloat width = v99.size.width;
      goto LABEL_25;
    }
  }
  v118.origin.CGFloat x = v39;
  v118.origin.CGFloat y = v38;
  v118.size.CGFloat width = v36;
  v118.size.height = v37;
  if (!CGRectIsEmpty(v118))
  {
    CGFloat v75 = v39;
    CGFloat y = v38;
    CGFloat v77 = v36;
    CGFloat width = v37;
LABEL_25:
    double MinX = CGRectGetMinX(*(CGRect *)&v75);
    goto LABEL_26;
  }
  v119.origin.CGFloat x = v99.origin.x;
  v119.origin.CGFloat y = v99.origin.y;
  v119.size.CGFloat width = v33;
  v119.size.height = v99.size.width;
  if (!CGRectIsEmpty(v119))
  {
    CGFloat v75 = v99.origin.x;
    CGFloat y = v99.origin.y;
    CGFloat v77 = v33;
    CGFloat width = v99.size.width;
    goto LABEL_25;
  }
  double v71 = *MEMORY[0x263F001B0];
  double v72 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v74 = rect_24;
  double v73 = v86;
LABEL_27:
  v121.origin.CGFloat x = v64;
  v121.origin.CGFloat y = v68;
  v121.size.CGFloat width = v73;
  v121.size.height = v74;
  -[UITextField setFrame:](self->_textField, "setFrame:", v64 + CGRectGetMaxX(v121), self->_verticalCompensation + 10.0, v71, v72);
  -[SiriUIHelpButton setFrame:](self->_helpButton, "setFrame:", v64, v68, v73, v74);
  -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v99.origin.x, v99.origin.y, v95, v99.size.width);
  -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v98, v88, v36, v37);
}

+ (double)_paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = 10.0;
  double v7 = 5.0;
  if (!v3) {
    double v7 = 10.0;
  }
  double v8 = floor(v7);
  if (v5 == 1) {
    return v8;
  }
  return result;
}

- (id)_createHelpButton:(CGRect)a3
{
  CGFloat v4 = +[SiriUIHelpButton buttonWithHelpImageMask];
  [v4 setAlpha:0.0];
  objc_msgSend(v4, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
  [v4 setEmphasized:1];
  uint64_t v5 = [v4 imageView];
  [v5 setContentMode:4];

  double v6 = [v4 layer];
  [v6 setHitTestsAsOpaque:1];

  [v4 sizeToFit];
  [v4 frame];
  double v8 = v7;
  double v10 = v9;
  double v11 = [v4 imageView];
  [v11 size];
  double v13 = v12 + 0.0;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  double v15 = v14;

  objc_msgSend(v4, "setFrame:", v8, v10, v13, v15);
  [v4 addTarget:self action:sel__helpButtonTapped_ forControlEvents:64];
  double v16 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__helpButtonLongPressed_];
  [v4 addGestureRecognizer:v16];

  return v4;
}

- (void)_helpButtonTapped:(id)a3
{
  id v4 = [(SiriUIKeyboardView *)self delegate];
  [v4 keyboardViewDidReceiveHelpButtonAction:self];
}

- (void)_helpButtonLongPressed:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UITextField *)self->_textField resignFirstResponder];
    id v4 = [(SiriUIKeyboardView *)self delegate];
    [v4 keyboardViewDidReceiveHelpButtonAction:self];
  }
}

- (id)_createTextFieldWithFrame:(CGRect)a3
{
  id v4 = -[SiriUITextField initWithFrame:]([SiriUITextField alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SiriUITextField *)v4 setDelegate:self];
  [(SiriUITextField *)v4 setDelegate:self];
  [(SiriUITextField *)v4 setKeyboardType:0];
  [(SiriUITextField *)v4 setKeyboardAppearance:1];
  [(SiriUITextField *)v4 setReturnKeyType:9];
  [(SiriUITextField *)v4 setEnablesReturnKeyAutomatically:1];
  [(SiriUITextField *)v4 setEnablesReturnKeyOnNonWhiteSpaceContent:1];
  uint64_t v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
  [(SiriUITextField *)v4 setTextColor:v5];

  double v6 = [(id)objc_opt_class() inputAccessoryViewBackgroundColor];
  [(SiriUITextField *)v4 setBackgroundColor:v6];

  double v7 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightInsertionPointColor");
  [(SiriUITextField *)v4 setInsertionPointColor:v7];

  double v8 = [(id)objc_opt_class() _textFieldFont];
  [(SiriUITextField *)v4 setFont:v8];

  double v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
  double v10 = [v9 siriUILocalizedStringForKey:@"SIRI_TEXTINPUT_PLACEHOLDER" value:@"Type to Siri" table:0];
  [(SiriUITextField *)v4 setPlaceholder:v10];
  double v11 = [(SiriUITextField *)v4 _placeholderLabel];
  double v12 = [(SiriUITextField *)v4 textColor];
  double v13 = [v12 colorWithAlphaComponent:0.45];
  [v11 setTextColor:v13];

  double v14 = [(SiriUITextField *)v4 font];
  [v11 setFont:v14];

  [v11 setAdjustsFontSizeToFitWidth:1];
  [v11 setBaselineAdjustment:1];
  [v11 setMinimumScaleFactor:0.01];
  LODWORD(v15) = 1132068864;
  [(SiriUITextField *)v4 setContentHuggingPriority:0 forAxis:v15];
  LODWORD(v16) = 1132068864;
  [(SiriUITextField *)v4 setContentCompressionResistancePriority:0 forAxis:v16];
  [(SiriUIKeyboardView *)self setClipsToBounds:0];
  if (SiriLanguageIsRTL()) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  [(SiriUITextField *)v4 setTextAlignment:v17];
  [(SiriUITextField *)v4 setAutocorrectionType:0];
  [(SiriUITextField *)v4 setSpellCheckingType:0];
  [(SiriUITextField *)v4 setAutocapitalizationType:2];

  return v4;
}

- (void)_configureAudioRoutePickerForAccessibility
{
  [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton setIsAccessibilityElement:1];
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[SiriUIAudioRoutePickerButton sizeThatFits:](self->_audioRoutePickerButton, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v6 = v5 + 0.0;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v3, v4, v6, v7);
  id v8 = [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton imageView];
  [v8 setContentMode:4];
}

- (void)setShowAudioRoutePicker:(BOOL)a3
{
  if (a3 && !self->_audioRoutePickerButton)
  {
    double v5 = [SiriUIAudioRoutePickerButton alloc];
    double v6 = -[SiriUIAudioRoutePickerButton initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = v6;

    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton addTarget:self action:sel__audioRouteButtonTapped_ forControlEvents:64];
    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton setAlpha:0.0];
    -[SiriUIAudioRoutePickerButton _setTouchInsets:](self->_audioRoutePickerButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    [(SiriUIKeyboardView *)self addSubview:self->_audioRoutePickerButton];
    [(SiriUIKeyboardView *)self _configureAudioRoutePickerForAccessibility];
    [(SiriUIKeyboardView *)self setNeedsLayout];
  }
  id v8 = self->_audioRoutePickerButton;
  if (v8)
  {
    double v9 = v8;
    double v10 = (void *)MEMORY[0x263F1CB60];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke;
    v16[3] = &unk_26469F368;
    uint64_t v17 = v9;
    BOOL v18 = a3;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke_2;
    v12[3] = &unk_26469F390;
    BOOL v15 = a3;
    double v13 = v17;
    double v14 = self;
    double v11 = v17;
    [v10 animateWithDuration:v16 animations:v12 completion:0.2];
  }
}

uint64_t __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    uint64_t v2 = *(void *)(a1 + 40);
    double v3 = *(void **)(v2 + 632);
    if (v3 == *(void **)(a1 + 32))
    {
      *(void *)(v2 + 632) = 0;
    }
  }
  double v4 = *(void **)(a1 + 40);
  return [v4 setNeedsLayout];
}

- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3
{
}

- (void)_audioRouteButtonTapped:(id)a3
{
  id v4 = [(SiriUIKeyboardView *)self delegate];
  [v4 keyboardViewDidReceiveAudioRouteAction:self];
}

- (void)_reportBugButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardViewDidReceiveReportBugAction:self];
}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardViewDidReceiveBugButtonLongPress:self];
}

- (BOOL)_showsReportBugButton
{
  uint64_t v2 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v2 debugButtonIsEnabled]) {
    char v3 = AFIsInternalInstall();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)_configureReportBugButton
{
  if (!self->_reportBugButton)
  {
    if ([(SiriUIKeyboardView *)self _showsReportBugButton])
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __47__SiriUIKeyboardView__configureReportBugButton__block_invoke;
      v3[3] = &unk_26469F3B8;
      objc_copyWeak(&v4, &location);
      [(SiriUIKeyboardView *)self _loadReportBugButtonTemplateImageInBackgroundWithCompletion:v3];
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __47__SiriUIKeyboardView__configureReportBugButton__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SiriUIKeyboardView__configureReportBugButton__block_invoke_2;
  v5[3] = &unk_26469F0D0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __47__SiriUIKeyboardView__configureReportBugButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createReportBugButtonWithTemplateImage:*(void *)(a1 + 32)];
}

- (void)_configureReportButtonForAccessibility
{
  id v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
  id v3 = [v10 siriUILocalizedStringForKey:@"SIRI_TEXTINPUT_REPORTBUGBUTTON_TITLE" value:@"Report" table:0];
  [(SiriUIContentButton *)self->_reportBugButton setAccessibilityLabel:v3];
  [(SiriUIContentButton *)self->_reportBugButton setIsAccessibilityElement:1];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[SiriUIContentButton sizeThatFits:](self->_reportBugButton, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v7 = v6 + 0.0;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v4, v5, v7, v8);
  double v9 = [(SiriUIContentButton *)self->_reportBugButton imageView];
  [v9 setContentMode:4];
}

- (void)_createReportBugButtonWithTemplateImage:(id)a3
{
  if (!self->_reportBugButton)
  {
    double v4 = +[SiriUIContentButton buttonWithImageTemplate:a3 style:0];
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = v4;

    -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    [(SiriUIContentButton *)self->_reportBugButton setAlpha:1.0];
    [(SiriUIContentButton *)self->_reportBugButton addTarget:self action:sel__reportBugButtonTapped forControlEvents:64];
    id v6 = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__reportBugButtonLongPressed];
    [(SiriUIContentButton *)self->_reportBugButton addGestureRecognizer:v6];
    [(SiriUIKeyboardView *)self addSubview:self->_reportBugButton];
    [(SiriUIKeyboardView *)self _configureReportButtonForAccessibility];
    [(SiriUIContentButton *)self->_reportBugButton setHidden:0];
    [(SiriUIKeyboardView *)self setNeedsLayout];
  }
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3 = a3;
  double v4 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__SiriUIKeyboardView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_26469F3E0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __82__SiriUIKeyboardView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
  if (objc_claimAutoreleasedReturnValue())
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"radarBug");
    id v3 = [v2 imageWithRenderingMode:2];

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)_undoTextFieldEdit:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SiriUIKeyboardView *)self undoManager];
  int v5 = [v4 isUndoRegistrationEnabled];

  if (v5)
  {
    id v6 = [(SiriUIKeyboardView *)self undoManager];
    id v7 = [(UITextField *)self->_textField text];
    [v6 registerUndoWithTarget:self selector:sel__undoTextFieldEdit_ object:v7];

    [(UITextField *)self->_textField setText:v8];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  int v5 = [(SiriUIKeyboardView *)self undoManager];
  int v6 = [v5 isUndoRegistrationEnabled];

  if (v6)
  {
    id v7 = [(SiriUIKeyboardView *)self undoManager];
    id v8 = [v4 text];
    [v7 registerUndoWithTarget:self selector:sel__undoTextFieldEdit_ object:v8];
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if (!a4.location && a4.length == 1)
  {
    int v5 = objc_msgSend(MEMORY[0x263F283F8], "sharedAnalytics", a3);
    [v5 logEventWithType:1446 machAbsoluteTime:mach_absolute_time() context:0];
  }
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F283F8];
  id v4 = a3;
  int v5 = [v3 sharedAnalytics];
  uint64_t v6 = mach_absolute_time();
  id v10 = @"text";
  id v7 = [v4 text];

  v11[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 logEventWithType:1448 machAbsoluteTime:v6 context:v8];

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F283F8];
  id v5 = a3;
  uint64_t v6 = [v4 sharedAnalytics];
  uint64_t v7 = mach_absolute_time();
  double v13 = @"text";
  id v8 = [v5 text];
  v14[0] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v6 logEventWithType:1447 machAbsoluteTime:v7 context:v9];

  id v10 = [(SiriUIKeyboardView *)self delegate];
  double v11 = [v5 text];

  [v10 keyboardView:self didReceiveText:v11];
  return 1;
}

- (void)_keyboardWillShow:(id)a3
{
  [(SiriUIKeyboardView *)self _visibleHeightFromNotification:a3];
  double v5 = v4;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  if (v5 > v6)
  {
    [(id)objc_opt_class() _paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:0];
    self->_interKeyboardAccessoryViewPadding = v7;
    id v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];
    double v10 = 0.0;
    if (v9 == 1) {
      double v10 = floor(self->_interKeyboardAccessoryViewPadding * 0.5);
    }
    self->_verticalCompensation = v10;

    [(SiriUIKeyboardView *)self setNeedsLayout];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  [(SiriUIKeyboardView *)self _visibleHeightFromNotification:a3];
  double v5 = v4;
  [(id)objc_opt_class() _keyboardAccessoryViewHeight];
  if (v5 == v6)
  {
    [(id)objc_opt_class() _paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:1];
    self->_interKeyboardAccessoryViewPadding = floor(v7);
    self->_verticalCompensation = 0.0;
    [(SiriUIKeyboardView *)self setNeedsLayout];
  }
}

- (double)_visibleHeightFromNotification:(id)a3
{
  id v3 = [a3 userInfo];
  double v4 = [v3 objectForKey:*MEMORY[0x263F1D428]];
  [v4 CGRectValue];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 bounds];
  double MaxY = CGRectGetMaxY(v21);

  v22.origin.CGFloat x = v6;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v10;
  v22.size.height = v12;
  if (CGRectGetHeight(v22) == 0.0
    || (v23.origin.CGFloat x = v6, v23.origin.y = v8, v23.size.width = v10, v23.size.height = v12, CGRectGetMaxY(v23) >= MaxY))
  {
    v24.origin.CGFloat x = v6;
    v24.origin.CGFloat y = v8;
    v24.size.CGFloat width = v10;
    v24.size.height = v12;
    return MaxY - CGRectGetMinY(v24);
  }
  else
  {
    CGFloat v15 = v6;
    CGFloat v16 = v8;
    CGFloat v17 = v10;
    CGFloat v18 = v12;
    return CGRectGetHeight(*(CGRect *)&v15);
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D488] object:0];

  double v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D480] object:0];

  v5.receiver = self;
  v5.super_class = (Class)SiriUIKeyboardView;
  [(SiriUIKeyboardView *)&v5 dealloc];
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (SiriUIKeyboardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIKeyboardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_originalInstalledLanguageIdentifiers, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_audioRoutePickerButton, 0);
  objc_storeStrong((id *)&self->_helpButton, 0);
}

@end