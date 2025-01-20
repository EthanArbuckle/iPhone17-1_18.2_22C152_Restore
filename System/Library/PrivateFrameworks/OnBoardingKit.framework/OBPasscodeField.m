@interface OBPasscodeField
- (BOOL)becomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)isSecureTextEntry;
- (NSArray)dotViews;
- (NSMutableString)value;
- (NSString)stringValue;
- (OBPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3;
- (OBPasscodeFieldDelegate)delegate;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)keyboardType;
- (unint64_t)numberOfEntryFields;
- (void)_updateDots;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDotViews:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNumberOfEntryFields:(unint64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation OBPasscodeField

- (OBPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OBPasscodeField;
  v4 = -[OBPasscodeField initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    value = v4->_value;
    v4->_value = v5;

    v4->_numberOfEntryFields = a3;
    v4->_enabled = 1;
    for (i = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]); a3; --a3)
    {
      v8 = objc_alloc_init(OBPasscodeFieldDot);
      [(OBPasscodeFieldDot *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(NSArray *)i addObject:v8];
      [(OBPasscodeField *)v4 addArrangedSubview:v8];
    }
    dotViews = v4->_dotViews;
    v4->_dotViews = i;
    v10 = i;

    [(OBPasscodeField *)v4 setSpacing:28.0];
    [(OBPasscodeField *)v4 setSemanticContentAttribute:3];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__passcodeFieldTapped_];

    [(OBPasscodeField *)v4 addGestureRecognizer:v11];
  }
  return v4;
}

- (NSString)stringValue
{
  v2 = [(OBPasscodeField *)self value];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  id v4 = a3;
  v5 = [(OBPasscodeField *)self value];
  [v5 setString:v4];

  [(OBPasscodeField *)self _updateDots];
  v6 = [(OBPasscodeField *)self value];
  uint64_t v7 = [v6 length];
  unint64_t v8 = [(OBPasscodeField *)self numberOfEntryFields];

  if (v7 == v8)
  {
    id v11 = [(OBPasscodeField *)self delegate];
    v9 = [(OBPasscodeField *)self value];
    v10 = (void *)[v9 copy];
    [v11 passcodeField:self enteredPasscode:v10];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PASSCODE" value:&stru_1EEC28768 table:@"Localizable"];

  return v3;
}

- (id)accessibilityValue
{
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PASSCODE_VALUES" value:&stru_1EEC28768 table:@"Localizable"];
  v6 = [(OBPasscodeField *)self value];
  uint64_t v7 = objc_msgSend(v3, "localizedStringWithFormat:", v5, objc_msgSend(v6, "length"), -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields"));

  return v7;
}

- (void)_updateDots
{
  if ([(OBPasscodeField *)self numberOfEntryFields])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [(OBPasscodeField *)self dotViews];
      v5 = [v4 objectAtIndex:v3];

      v6 = [(OBPasscodeField *)self stringValue];
      objc_msgSend(v5, "setFilled:", v3 < objc_msgSend(v6, "length"));

      ++v3;
    }
    while (v3 < [(OBPasscodeField *)self numberOfEntryFields]);
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeField;
  BOOL v2 = [(OBPasscodeField *)&v5 becomeFirstResponder];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v3 setReturnKeyEnabled:0];
  }
  return v2;
}

- (int64_t)keyboardType
{
  BOOL v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 11;
  }
  else {
    return 127;
  }
}

- (BOOL)hasText
{
  BOOL v2 = [(OBPasscodeField *)self stringValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  id v14 = a3;
  if ([(OBPasscodeField *)self isEnabled])
  {
    id v4 = [(OBPasscodeField *)self stringValue];
    uint64_t v5 = [v4 length];
    unint64_t v6 = [(OBPasscodeField *)self numberOfEntryFields];

    if (v5 != v6 && ([v14 isEqualToString:@"\n"] & 1) == 0)
    {
      if ([v14 length])
      {
        uint64_t v7 = [(OBPasscodeField *)self value];
        [v7 appendString:v14];

        [(OBPasscodeField *)self _updateDots];
        unint64_t v8 = [(OBPasscodeField *)self stringValue];
        uint64_t v9 = [v8 length];
        unint64_t v10 = [(OBPasscodeField *)self numberOfEntryFields];

        if (v9 == v10)
        {
          id v11 = [(OBPasscodeField *)self delegate];
          v12 = [(OBPasscodeField *)self value];
          objc_super v13 = (void *)[v12 copy];
          [v11 passcodeField:self enteredPasscode:v13];
        }
      }
    }
  }
}

- (void)deleteBackward
{
  BOOL v3 = [(OBPasscodeField *)self stringValue];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(OBPasscodeField *)self value];
    unint64_t v6 = [(OBPasscodeField *)self stringValue];
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    [(OBPasscodeField *)self _updateDots];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OBPasscodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OBPasscodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  self->_numberOfEntryFields = a3;
}

- (NSMutableString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (void)setDotViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end