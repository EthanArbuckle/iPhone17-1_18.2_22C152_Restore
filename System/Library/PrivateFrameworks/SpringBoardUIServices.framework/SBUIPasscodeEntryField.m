@interface SBUIPasscodeEntryField
+ (BOOL)_usesTextFieldForFirstResponder;
- (BOOL)_hasAnyCharacters;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)shouldInsertPasscodeText:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)_viewSize;
- (NSString)stringValue;
- (SBUIPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (SBUIPasscodeEntryFieldDelegate)delegate;
- (UIColor)customBackgroundColor;
- (UIFont)font;
- (UITextField)_textField;
- (void)_appendString:(id)a3;
- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3;
- (void)_deleteLastCharacter;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)_setLuminosityBoost:(double)a3;
- (void)appendString:(id)a3;
- (void)notePasscodeFieldDidAcceptEntry;
- (void)notePasscodeFieldTextDidChange;
- (void)reset;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setStringValue:(id)a3;
- (void)textFieldDidResignFirstResponder:(id)a3;
@end

@implementation SBUIPasscodeEntryField

- (SBUIPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SBUIPasscodeEntryField;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v6 = -[SBUIPasscodeEntryField initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    [(SBUIPasscodeEntryField *)v6 _viewSize];
    double v9 = v8;
    double v11 = v10;
    -[SBUIPasscodeEntryField setFrame:](v7, "setFrame:", v4, v5, v8, v10);
    v12 = -[SBUIPasscodeTextField initWithFrame:]([SBUIPasscodeTextField alloc], "initWithFrame:", v4, v5, v9, v11);
    textField = v7->_textField;
    v7->_textField = v12;

    [(SBUIPasscodeTextField *)v7->_textField setBorderStyle:3];
    v14 = v7->_textField;
    if (a3)
    {
      v15 = [MEMORY[0x1E4F428B8] blackColor];
      uint64_t v16 = 0;
    }
    else
    {
      v15 = [MEMORY[0x1E4F428B8] whiteColor];
      uint64_t v16 = 127;
    }
    [(SBUIPasscodeTextField *)v14 setTextColor:v15];

    [(SBUIPasscodeTextField *)v7->_textField setSecureTextEntry:1];
    [(SBUIPasscodeTextField *)v7->_textField setUndoEnabled:0];
    [(SBUIPasscodeTextField *)v7->_textField setHidden:0];
    [(SBUIPasscodeTextField *)v7->_textField setAlpha:1.0];
    [(SBUIPasscodeTextField *)v7->_textField setDelegate:v7];
    [(SBUIPasscodeTextField *)v7->_textField setKeyboardAppearance:v16];
    v17 = v7->_textField;
    if (a3) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v18 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(SBUIPasscodeTextField *)v17 setInsertionPointColor:v18];

    v19 = v7->_textField;
    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUIPasscodeTextField *)v19 setBackgroundColor:v20];

    [(SBUIPasscodeEntryField *)v7 addSubview:v7->_textField];
    v21 = [(SBUIPasscodeTextField *)v7->_textField textInputTraits];
    if (a3) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v22 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [v21 setInsertionPointColor:v22];

    [v21 setKeyboardType:0];
    [v21 setKeyboardAppearance:v16];
    [v21 setAutocorrectionType:1];
    [v21 setTextLoupeVisibility:1];
    [v21 setShortcutConversionType:1];
    [v21 setLearnsCorrections:0];
    [v21 setSecureTextEntry:1];
    [v21 setDevicePasscodeEntry:1];
    [v21 setDisableInputBars:1];
    [(SBUIPasscodeEntryField *)v7 setUserInteractionEnabled:1];
  }
  return v7;
}

- (UIFont)font
{
  return (UIFont *)[(SBUIPasscodeTextField *)self->_textField font];
}

- (void)setFont:(id)a3
{
  [(SBUIPasscodeTextField *)self->_textField setFont:a3];
  [(SBUIPasscodeEntryField *)self setNeedsLayout];
}

- (void)appendString:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(SBUIPasscodeEntryField *)self shouldInsertPasscodeText:v4];
    uint64_t v5 = v6;
    if (v4)
    {
      uint64_t v4 = [(SBUIPasscodeEntryField *)self _appendString:v6];
      uint64_t v5 = v6;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (NSString)stringValue
{
  return (NSString *)[(SBUIPasscodeTextField *)self->_textField text];
}

- (void)setStringValue:(id)a3
{
  textField = self->_textField;
  id v5 = a3;
  [(SBUIPasscodeTextField *)textField setText:0];
  [(SBUIPasscodeEntryField *)self appendString:v5];
}

- (void)reset
{
  self->_ignoreCallbacks = 1;
  v3 = [(SBUIPasscodeEntryField *)self stringValue];
  uint64_t v4 = [v3 length];

  [(SBUIPasscodeTextField *)self->_textField setText:0];
  self->_ignoreCallbacks = 0;
  if (v4)
  {
    [(SBUIPasscodeEntryField *)self notePasscodeFieldTextDidChange];
  }
}

- (BOOL)canBecomeFirstResponder
{
  if ([(id)objc_opt_class() _usesTextFieldForFirstResponder])
  {
    if (self->_resigningFirstResponder)
    {
      return 0;
    }
    else
    {
      textField = self->_textField;
      return [(SBUIPasscodeTextField *)textField canBecomeFirstResponder];
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUIPasscodeEntryField;
    return [(SBUIPasscodeEntryField *)&v5 canBecomeFirstResponder];
  }
}

- (BOOL)isFirstResponder
{
  if ([(id)objc_opt_class() _usesTextFieldForFirstResponder])
  {
    textField = self->_textField;
    return [(SBUIPasscodeTextField *)textField isFirstResponder];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUIPasscodeEntryField;
    return [(SBUIPasscodeEntryField *)&v5 isFirstResponder];
  }
}

- (BOOL)becomeFirstResponder
{
  v3 = [(SBUIPasscodeEntryField *)self delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v3 passcodeEntryFieldShouldShowSystemKeyboard:self];
  }
  else {
    uint64_t v4 = 0;
  }
  [(SBUIPasscodeTextField *)self->_textField setShowsSystemKeyboard:v4];
  if ([(id)objc_opt_class() _usesTextFieldForFirstResponder])
  {
    if (![(SBUIPasscodeEntryField *)self canBecomeFirstResponder])
    {
      BOOL v6 = 0;
      goto LABEL_10;
    }
    unsigned __int8 v5 = [(SBUIPasscodeTextField *)self->_textField becomeFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBUIPasscodeEntryField;
    unsigned __int8 v5 = [(SBUIPasscodeEntryField *)&v8 becomeFirstResponder];
  }
  BOOL v6 = v5;
LABEL_10:

  return v6;
}

- (BOOL)resignFirstResponder
{
  if ([(id)objc_opt_class() _usesTextFieldForFirstResponder])
  {
    self->_resigningFirstResponder = 1;
    BOOL result = [(SBUIPasscodeTextField *)self->_textField resignFirstResponder];
    self->_resigningFirstResponder = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBUIPasscodeEntryField;
    return [(SBUIPasscodeEntryField *)&v4 resignFirstResponder];
  }
  return result;
}

- (void)_setLuminosityBoost:(double)a3
{
}

- (void)_appendString:(id)a3
{
  [(SBUIPasscodeTextField *)self->_textField insertText:a3];
  [(SBUIPasscodeEntryField *)self notePasscodeFieldTextDidChange];
}

- (void)_deleteLastCharacter
{
  [(SBUIPasscodeTextField *)self->_textField deleteBackward];
  [(SBUIPasscodeEntryField *)self notePasscodeFieldTextDidChange];
}

- (BOOL)_hasAnyCharacters
{
  v2 = [(SBUIPasscodeEntryField *)self _textField];
  v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  if (a3) {
    [(SBUIPasscodeEntryField *)self reset];
  }
}

- (UITextField)_textField
{
  return (UITextField *)self->_textField;
}

+ (BOOL)_usesTextFieldForFirstResponder
{
  return 1;
}

- (CGSize)_viewSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)shouldInsertPasscodeText:(id)a3
{
  id v4 = a3;
  if (self->_ignoreCallbacks)
  {
    char v5 = 0;
  }
  else
  {
    BOOL v6 = [(SBUIPasscodeEntryField *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 passcodeEntryField:self shouldInsertText:v4];
    }
    else {
      char v5 = 1;
    }
  }
  return v5;
}

- (void)notePasscodeFieldTextDidChange
{
  if (!self->_ignoreCallbacks)
  {
    id v3 = [(SBUIPasscodeEntryField *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 passcodeEntryFieldTextDidChange:self];
    }
  }
}

- (void)notePasscodeFieldDidAcceptEntry
{
  if (self->_ignoreCallbacks) {
    return;
  }
  v7 = [(SBUIPasscodeEntryField *)self delegate];
  id v3 = [(SBUIPasscodeEntryField *)self stringValue];
  uint64_t v4 = [v3 length];

  if ((objc_opt_respondsToSelector() & 1) != 0 && !v4)
  {
    uint64_t v5 = [v7 passcodeEntryFieldDidCancelEntry:self];
LABEL_8:
    BOOL v6 = v7;
    goto LABEL_9;
  }
  uint64_t v5 = objc_opt_respondsToSelector();
  BOOL v6 = v7;
  if ((v5 & 1) != 0 && v4)
  {
    uint64_t v5 = [v7 passcodeEntryFieldDidAcceptEntry:self];
    goto LABEL_8;
  }
LABEL_9:
  MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  double v9 = [(SBUIPasscodeEntryField *)self stringValue];
  uint64_t v10 = [v9 length];
  uint64_t v11 = [v8 length];
  if (v11 && location == v10 && !length)
  {
    [(SBUIPasscodeEntryField *)self appendString:v8];
  }
  else if (!v11 && location == v10 - 1 && length == 1)
  {
    [(SBUIPasscodeEntryField *)self deleteLastCharacter];
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  id v4 = [(SBUIPasscodeEntryField *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 passcodeEntryFieldDidResignFirstResponder:self];
  }
}

- (SBUIPasscodeEntryFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPasscodeEntryFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_numericTrimmingSet, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end