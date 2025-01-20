@interface PKListTextFieldContentConfiguration
+ (id)cellConfiguration;
+ (id)valueCellConfiguration;
- (BOOL)_isEqualToListTextFieldContentConfiguration:(id)a3;
- (BOOL)clearsOnBeginEditing;
- (BOOL)clearsOnInsertion;
- (BOOL)focusTextField;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSError)error;
- (NSString)placeholderText;
- (NSString)secondaryText;
- (NSString)text;
- (PKListTextFieldContentConfiguration)initWithBackingConfig:(id)a3;
- (UIColor)errorColor;
- (UIListContentTextProperties)secondaryTextProperties;
- (UIListContentTextProperties)textProperties;
- (double)textToSecondaryTextHorizontalPadding;
- (double)textToSecondaryTextVerticalPadding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hasErrorHandler;
- (id)makeContentView;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (unint64_t)hash;
- (unint64_t)mode;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setClearsOnBeginEditing:(BOOL)a3;
- (void)setClearsOnInsertion:(BOOL)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setError:(id)a3;
- (void)setErrorColor:(id)a3;
- (void)setFocusTextField:(BOOL)a3;
- (void)setHasErrorHandler:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSecondaryText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextToSecondaryTextHorizontalPadding:(double)a3;
- (void)setTextToSecondaryTextVerticalPadding:(double)a3;
@end

@implementation PKListTextFieldContentConfiguration

+ (id)cellConfiguration
{
  v2 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  v3 = [v2 secondaryTextProperties];
  v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v3 setColor:v4];

  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackingConfig:v2];
  [v5 setReturnKeyType:0];
  [v5 setClearsOnBeginEditing:0];
  [v5 setClearsOnInsertion:0];
  [v5 setFocusTextField:1];
  v6 = [v5 textProperties];
  [v6 setNumberOfLines:0];

  v7 = [v5 secondaryTextProperties];
  [v7 setNumberOfLines:0];

  v8 = [MEMORY[0x1E4FB1618] systemRedColor];
  [v5 setErrorColor:v8];

  return v5;
}

+ (id)valueCellConfiguration
{
  v2 = [a1 cellConfiguration];
  [v2 setMode:1];
  [v2 setFocusTextField:0];
  v3 = [v2 textProperties];
  v4 = [v2 secondaryTextProperties];
  v5 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
  [v4 setFont:v5];

  v6 = [v3 color];
  [v4 setColor:v6];

  return v2;
}

- (PKListTextFieldContentConfiguration)initWithBackingConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKListTextFieldContentConfiguration;
  v6 = [(PKListTextFieldContentConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingConfig, a3);
  }

  return v7;
}

- (NSString)text
{
  return [(UIListContentConfiguration *)self->_backingConfig text];
}

- (UIListContentTextProperties)textProperties
{
  return [(UIListContentConfiguration *)self->_backingConfig textProperties];
}

- (NSString)secondaryText
{
  return [(UIListContentConfiguration *)self->_backingConfig secondaryText];
}

- (UIListContentTextProperties)secondaryTextProperties
{
  return [(UIListContentConfiguration *)self->_backingConfig secondaryTextProperties];
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  [(UIListContentConfiguration *)self->_backingConfig directionalLayoutMargins];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)textToSecondaryTextVerticalPadding
{
  [(UIListContentConfiguration *)self->_backingConfig textToSecondaryTextVerticalPadding];
  return result;
}

- (double)textToSecondaryTextHorizontalPadding
{
  [(UIListContentConfiguration *)self->_backingConfig textToSecondaryTextHorizontalPadding];
  return result;
}

- (void)setText:(id)a3
{
}

- (void)setSecondaryText:(id)a3
{
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
}

- (void)setTextToSecondaryTextVerticalPadding:(double)a3
{
}

- (void)setTextToSecondaryTextHorizontalPadding:(double)a3
{
}

- (id)makeContentView
{
  double v2 = [[PKListTextFieldContentView alloc] initWithConfiguration:self];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(UIListContentConfiguration *)self->_backingConfig copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 24), self->_placeholderText);
  *(void *)(v5 + 32) = self->_returnKeyType;
  *(unsigned char *)(v5 + 18) = self->_focusTextField;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PKListTextFieldContentConfiguration *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKListTextFieldContentConfiguration *)self _isEqualToListTextFieldContentConfiguration:v5];

  return v6;
}

- (BOOL)_isEqualToListTextFieldContentConfiguration:(id)a3
{
  double v4 = a3;
  if (v4 && PKEqualObjects())
  {
    uint64_t v5 = (void *)v4[3];
    BOOL v6 = self->_placeholderText;
    v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7) {
        goto LABEL_11;
      }
      int v9 = [(NSString *)v6 isEqualToString:v7];

      if (!v9) {
        goto LABEL_12;
      }
    }
    BOOL v6 = [NSNumber numberWithBool:self->_focusTextField];
    v8 = [NSNumber numberWithBool:*((unsigned __int8 *)v4 + 18)];
    LOBYTE(v9) = PKEqualObjects();
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v9) = 0;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_backingConfig];
  [v3 safelyAddObject:self->_placeholderText];
  double v4 = [NSNumber numberWithBool:self->_focusTextField];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash();
  return v5;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (BOOL)clearsOnBeginEditing
{
  return self->_clearsOnBeginEditing;
}

- (void)setClearsOnBeginEditing:(BOOL)a3
{
  self->_clearsOnBeginEditing = a3;
}

- (BOOL)clearsOnInsertion
{
  return self->_clearsOnInsertion;
}

- (void)setClearsOnInsertion:(BOOL)a3
{
  self->_clearsOnInsertion = a3;
}

- (BOOL)focusTextField
{
  return self->_focusTextField;
}

- (void)setFocusTextField:(BOOL)a3
{
  self->_focusTextField = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (UIColor)errorColor
{
  return self->_errorColor;
}

- (void)setErrorColor:(id)a3
{
}

- (id)hasErrorHandler
{
  return self->_hasErrorHandler;
}

- (void)setHasErrorHandler:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hasErrorHandler, 0);
  objc_storeStrong((id *)&self->_errorColor, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);

  objc_storeStrong((id *)&self->_backingConfig, 0);
}

@end