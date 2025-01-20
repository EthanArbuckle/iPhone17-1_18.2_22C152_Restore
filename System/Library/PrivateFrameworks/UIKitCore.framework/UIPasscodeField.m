@interface UIPasscodeField
+ (Class)textFieldClass;
+ (double)defaultHeight;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)showsOKButton;
- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5;
- (BOOL)textFieldShouldStartEditing:(id)a3;
- (UIPasscodeField)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)stringValue;
- (int)numberOfEntryFields;
- (void)_textDidChange;
- (void)_updateFields;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)deleteLastCharacter;
- (void)okButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4;
- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4 emptyContentReturnKeyType:(int)a5;
- (void)setNumberOfEntryFields:(int)a3;
- (void)setNumberOfEntryFields:(int)a3 opaqueBackground:(BOOL)a4;
- (void)setShowsOKButton:(BOOL)a3;
- (void)setStringValue:(id)a3;
- (void)setTextCentersHorizontally:(BOOL)a3;
- (void)textFieldDidResignFirstResponder:(id)a3;
@end

@implementation UIPasscodeField

+ (double)defaultHeight
{
  v2 = _UIImageWithName(@"UIPasscodeFieldBackground.png");
  [v2 size];
  double v4 = v3;

  return v4;
}

+ (Class)textFieldClass
{
  return (Class)objc_opt_class();
}

- (UIPasscodeField)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIPasscodeField;
  double v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    value = v3->_value;
    v3->_value = v4;

    v3->_centerHorizontally = 1;
    v3->_keyboardType = 11;
    [(UIView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
}

- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4
{
}

- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4 emptyContentReturnKeyType:(int)a5
{
  self->_keyboardType = a3;
  self->_keyboardAppearance = a4;
  self->_emptyContentReturnKeyType = a5;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIPasscodeField;
  [(UIView *)&v4 dealloc];
}

- (void)_updateFields
{
  int v3 = [(NSMutableArray *)self->_entryFields count];
  int v13 = [(NSMutableString *)self->_value length];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v12 = (v3 - 1);
    uint64_t v5 = v3;
    do
    {
      v6 = [(NSMutableArray *)self->_entryFields objectAtIndex:v4];
      objc_super v7 = &stru_1ED0E84C0;
      if (v4 < v13)
      {
        if (!_updateFields___bullet)
        {
          uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 10625);
          v9 = (void *)_updateFields___bullet;
          _updateFields___bullet = v8;
        }
        if (v4 != v12 || v13 - v4 == 1)
        {
          objc_super v7 = (__CFString *)(id)_updateFields___bullet;
        }
        else
        {
          objc_super v7 = [MEMORY[0x1E4F28E78] string];
          int v10 = v13;
          do
          {
            [(__CFString *)v7 appendString:_updateFields___bullet];
            --v10;
          }
          while (v10);
        }
      }
      [v6 setText:v7];

      ++v4;
    }
    while (v4 != v5);
  }
  okButton = self->_okButton;
  if (okButton)
  {
    [(UIButton *)okButton setEnabled:v13 > 0];
  }
}

- (BOOL)showsOKButton
{
  return self->_okButton != 0;
}

- (void)setShowsOKButton:(BOOL)a3
{
  if (a3)
  {
    okButton = self->_okButton;
    if (!okButton)
    {
      uint64_t v5 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
      v6 = +[UIColor colorWithWhite:1.0 alpha:0.4];
      objc_super v7 = [UIButton alloc];
      uint64_t v8 = -[UIButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v9 = self->_okButton;
      self->_okButton = v8;

      [(UIButton *)self->_okButton setTitle:v5 forState:0];
      int v10 = _UIImageWithName(@"UIPasscodeFieldButton.png");
      [v10 size];
      uint64_t v12 = [v10 stretchableImageWithLeftCapWidth:vcvtmd_s64_f64(v11 * 0.5) topCapHeight:0];
      [(UIButton *)self->_okButton setBackgroundImage:v12 forState:0];
      int v13 = _UIImageWithName(@"UIPasscodeFieldButtonPressed.png");
      [v13 size];
      v15 = [v13 stretchableImageWithLeftCapWidth:vcvtmd_s64_f64(v14 * 0.5) topCapHeight:0];
      [(UIButton *)self->_okButton setBackgroundImage:v15 forState:1];
      v16 = [(UIButton *)self->_okButton titleLabel];
      v17 = [off_1E52D39B8 boldSystemFontOfSize:20.0];
      [v16 setFont:v17];

      v18 = self->_okButton;
      v19 = +[UIColor blackColor];
      [(UIButton *)v18 setTitleShadowColor:v19 forState:0];

      [(UIButton *)self->_okButton setTitleColor:v6 forState:2];
      [(UIControl *)self->_okButton addTarget:self action:sel_okButtonClicked_ forControlEvents:64];
      [(UIView *)self->_okButton sizeToFit];
      v20 = self->_okButton;
      [(UIView *)v20 bounds];
      -[UIButton contentRectForBounds:](v20, "contentRectForBounds:");
      -[UIButton titleRectForContentRect:](v20, "titleRectForContentRect:");
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [(UIView *)self->_okButton frame];
      double v30 = v29;
      double v32 = v31;
      v42.origin.x = v22;
      v42.origin.y = v24;
      v42.size.width = v26;
      v42.size.height = v28;
      CGFloat v33 = CGRectGetWidth(v42) + 24.0;
      v43.origin.x = v22;
      v43.origin.y = v24;
      v43.size.width = v26;
      v43.size.height = v28;
      -[UIButton setFrame:](self->_okButton, "setFrame:", v30, v32, v33, CGRectGetHeight(v43) + 16.0);

      okButton = self->_okButton;
    }
    [(UIView *)okButton frame];
    double v35 = v34;
    double v37 = v36;
    [(UIView *)self bounds];
    -[UIButton setFrame:](self->_okButton, "setFrame:", v38 - v35 + -7.0, floor((v39 - v37) * 0.5), v35, v37);
    [(UIPasscodeField *)self setNumberOfEntryFields:[(NSMutableArray *)self->_entryFields count] opaqueBackground:self->_opaqueBackground];
    [(UIView *)self setUserInteractionEnabled:1];
    [(UIView *)self addSubview:self->_okButton];
    [(UIPasscodeField *)self _updateFields];
  }
  else
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    [(UIView *)self->_okButton removeFromSuperview];
    v40 = self->_okButton;
    self->_okButton = 0;
  }
}

- (void)setTextCentersHorizontally:(BOOL)a3
{
  if (self->_centerHorizontally != a3)
  {
    self->_centerHorizontally = a3;
    uint64_t v4 = [(NSMutableArray *)self->_entryFields count];
    BOOL opaqueBackground = self->_opaqueBackground;
    [(UIPasscodeField *)self setNumberOfEntryFields:v4 opaqueBackground:opaqueBackground];
  }
}

- (id)stringValue
{
  v2 = (void *)[(NSMutableString *)self->_value copy];
  return v2;
}

- (void)setStringValue:(id)a3
{
  int v10 = (__CFString *)a3;
  int v4 = [(NSMutableArray *)self->_entryFields count];
  value = self->_value;
  if (v4 < 2)
  {
    if (v10) {
      v9 = v10;
    }
    else {
      v9 = &stru_1ED0E84C0;
    }
    [(NSMutableString *)value setString:v9];
  }
  else
  {
    unint64_t v6 = [(__CFString *)v10 length];
    if (v6 >= v4) {
      unint64_t v7 = v4;
    }
    else {
      unint64_t v7 = v6;
    }
    uint64_t v8 = [(__CFString *)v10 substringToIndex:v7];
    [(NSMutableString *)value setString:v8];
  }
  [(UIPasscodeField *)self _updateFields];
}

- (void)appendString:(id)a3
{
  id v11 = a3;
  int v4 = [(NSMutableArray *)self->_entryFields count];
  value = self->_value;
  if (v4 < 2)
  {
    [(NSMutableString *)value appendString:v11];
  }
  else
  {
    int v6 = v4 - [(NSMutableString *)value length];
    if (v6 >= 1)
    {
      unint64_t v7 = self->_value;
      unint64_t v8 = [v11 length];
      if (v8 >= v6) {
        unint64_t v9 = v6;
      }
      else {
        unint64_t v9 = v8;
      }
      int v10 = [v11 substringToIndex:v9];
      [(NSMutableString *)v7 appendString:v10];
    }
  }
  [(UIPasscodeField *)self _updateFields];
}

- (void)deleteLastCharacter
{
  int v3 = [(NSMutableString *)self->_value length];
  if (v3 >= 1)
  {
    -[NSMutableString deleteCharactersInRange:](self->_value, "deleteCharactersInRange:", (v3 - 1), 1);
    [(UIPasscodeField *)self _updateFields];
  }
}

- (int)numberOfEntryFields
{
  return [(NSMutableArray *)self->_entryFields count];
}

- (void)setNumberOfEntryFields:(int)a3 opaqueBackground:(BOOL)a4
{
  if (a4) {
    unint64_t v7 = @"UIPasscodeFieldBackground_Opaque.png";
  }
  else {
    unint64_t v7 = @"UIPasscodeFieldBackground.png";
  }
  _UIImageWithName(v7);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  [v32 size];
  double v34 = [v32 stretchableImageWithLeftCapWidth:vcvtmd_s64_f64(v8 * 0.5) topCapHeight:0];
  [v34 size];
  double v10 = v9;
  [(UIView *)self bounds];
  double v12 = v11;
  double v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
  self->_BOOL opaqueBackground = a4;
  okButton = self->_okButton;
  if (okButton)
  {
    [(UIView *)okButton frame];
    double v15 = v12 - v14 + 0.0;
  }
  else
  {
    double v15 = 0.0;
  }
  double v16 = -0.5;
  if (a3 == 1)
  {
    if (self->_centerHorizontally)
    {
      double v16 = -0.5;
    }
    else
    {
      double v15 = v15 + -10.0;
      double v16 = 4.5;
    }
  }
  if (self->_entryFields)
  {
    [v35 removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:0];
    [(NSMutableArray *)self->_entryFields makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->_entryFields removeAllObjects];
    [(NSMutableArray *)self->_entryBackgrounds removeAllObjects];
  }
  else
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entryFields = self->_entryFields;
    self->_entryFields = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entryBackgrounds = self->_entryBackgrounds;
    self->_entryBackgrounds = v19;
  }
  double v21 = 72.0;
  if (a3 == 1) {
    double v21 = 31.0;
  }
  CGFloat v33 = [off_1E52D39B8 fontWithFamilyName:@"Helvetica" traits:0 size:v21];
  if (a3 >= 1)
  {
    double v22 = floor((v12 + (double)(a3 - 1) * -10.0) / (double)a3);
    if (a3 == 1) {
      double v23 = 3.0;
    }
    else {
      double v23 = 5.0;
    }
    double v24 = v22 - v15;
    double v25 = 0.0;
    int v26 = a3;
    do
    {
      double v27 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v25, 0.0, v22, v10);
      CGFloat v28 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "textFieldClass")), "initWithFrame:", v16, v23, v24, v10 + -8.0);
      [(UIButton *)v27 setAutosizesToFit:0];
      [(UIButton *)v27 setBackgroundImage:v34 forState:0];
      [(UIButton *)v27 setAdjustsImageWhenDisabled:0];
      [(UIButton *)v27 setEnabled:0];
      [(UIView *)self addSubview:v27];
      [(UIView *)v27 addSubview:v28];
      [v28 setUndoEnabled:0];
      double v29 = +[UIColor blackColor];
      [v28 setTextColor:v29];

      [v28 setTextCentersVertically:1];
      [v28 setTextCentersHorizontally:self->_centerHorizontally];
      [v28 setFont:v33];
      [v28 setDelegate:self];
      [(NSMutableArray *)self->_entryFields addObject:v28];
      [(NSMutableArray *)self->_entryBackgrounds addObject:v27];
      double v30 = [v28 textInputTraits];
      double v31 = v30;
      if (a3 != 1) {
        [v30 setInsertionPointColor:0];
      }
      [v31 setKeyboardType:self->_keyboardType];
      [v31 setKeyboardAppearance:self->_keyboardAppearance];
      [v31 setEmptyContentReturnKeyType:self->_emptyContentReturnKeyType];
      [v31 setAutocorrectionType:1];
      [v31 setTextLoupeVisibility:1];
      [v31 setShortcutConversionType:1];
      [v31 setLearnsCorrections:0];
      if (a3 == 1) {
        [v28 setSecureTextEntry:1];
      }
      [v35 addObserver:self selector:sel__textDidChange name:@"UITextFieldTextDidChangeNotification" object:v28];
      double v25 = v22 + 10.0 + v25;

      --v26;
    }
    while (v26);
  }
}

- (void)setNumberOfEntryFields:(int)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return [(NSMutableArray *)self->_entryFields count] == 1;
}

- (BOOL)becomeFirstResponder
{
  if ([(NSMutableArray *)self->_entryFields count] != 1) {
    return 0;
  }
  int v3 = [(NSMutableArray *)self->_entryFields objectAtIndex:0];
  char v4 = [v3 becomeFirstResponder];

  return v4;
}

- (BOOL)isFirstResponder
{
  if ([(NSMutableArray *)self->_entryFields count] == 1)
  {
    int v3 = [(NSMutableArray *)self->_entryFields objectAtIndex:0];
    char v4 = [v3 isFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasscodeField;
    return [(UIView *)&v6 isFirstResponder];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_textDidChange
{
  if ([(NSMutableArray *)self->_entryFields count] == 1)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      value = self->_value;
      char v4 = [(NSMutableArray *)self->_entryFields objectAtIndex:0];
      uint64_t v5 = [v4 text];
      [(NSMutableString *)value setString:v5];

      okButton = self->_okButton;
      if (okButton) {
        [(UIButton *)okButton setEnabled:[(NSMutableString *)self->_value length] != 0];
      }
      [WeakRetained passcodeFieldTextDidChange:self];
    }
  }
}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = [WeakRetained passcodeField:self shouldInsertText:v6];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)textFieldShouldStartEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  if ([(NSMutableArray *)self->_entryFields count] == 1)
  {
    [(UIPasscodeField *)self _updateFields];
  }
}

- (void)okButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeFieldDidAcceptEntry:self];
  }
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIPasscodeField;
  -[UIView hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (UIPasscodeField *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    if (self->_okButton)
    {
      uint64_t v5 = self;
    }
    else
    {

      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_entryBackgrounds, 0);
  objc_storeStrong((id *)&self->_entryFields, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end