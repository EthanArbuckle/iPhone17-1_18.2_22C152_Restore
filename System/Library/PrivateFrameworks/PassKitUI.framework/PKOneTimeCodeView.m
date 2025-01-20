@interface PKOneTimeCodeView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disableEntry;
- (BOOL)hasText;
- (BOOL)isFirstResponder;
- (BOOL)isSecureTextEntry;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKOneTimeCodeView)initWithCodeLength:(int64_t)a3 delegate:(id)a4;
- (double)codeLength;
- (double)entrySpacing;
- (id)_firstCodeField;
- (id)currentCode;
- (unint64_t)entryError;
- (void)_passcodeFieldTapped:(id)a3;
- (void)_updateLabels;
- (void)clearCurrentCode;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDisableEntry:(BOOL)a3;
- (void)setEntryError:(unint64_t)a3;
- (void)setEntrySpacing:(double)a3;
@end

@implementation PKOneTimeCodeView

- (PKOneTimeCodeView)initWithCodeLength:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKOneTimeCodeView;
  v7 = -[PKOneTimeCodeView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_codeLength = (double)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    value = v8->_value;
    v8->_value = v9;

    v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v12 = [v11 invertedSet];
    nonNumericCharSet = v8->_nonNumericCharSet;
    v8->_nonNumericCharSet = (NSCharacterSet *)v12;

    v14 = [[PKOneTimeCodeDigitFieldView alloc] initWithIndex:0];
    templateField = v8->_templateField;
    v8->_templateField = v14;

    [(PKOneTimeCodeDigitFieldView *)v8->_templateField setText:@"5"];
    v16 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    invisibleTextField = v8->_invisibleTextField;
    v8->_invisibleTextField = v16;

    [(UITextField *)v8->_invisibleTextField setHidden:1];
    [(UITextField *)v8->_invisibleTextField setDelegate:v8];
    [(UITextField *)v8->_invisibleTextField setKeyboardType:4];
    [(UITextField *)v8->_invisibleTextField setTextContentType:*MEMORY[0x1E4FB2FA8]];
    [(PKOneTimeCodeView *)v8 addSubview:v8->_invisibleTextField];
    v18 = objc_alloc_init(PKIconTextLabel);
    entryErrorLabel = v8->_entryErrorLabel;
    v8->_entryErrorLabel = v18;

    v20 = v8->_entryErrorLabel;
    v21 = [MEMORY[0x1E4FB1618] redColor];
    [(PKIconTextLabel *)v20 setTextColor:v21];

    v22 = v8->_entryErrorLabel;
    v23 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 0, 0);
    [(PKIconTextLabel *)v22 setTextFont:v23];

    [(PKOneTimeCodeView *)v8 addSubview:v8->_entryErrorLabel];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v8->_codeLength > 0.0)
    {
      uint64_t v25 = 0;
      do
      {
        v26 = [[PKOneTimeCodeDigitFieldView alloc] initWithIndex:v25];
        [(PKOneTimeCodeDigitFieldView *)v26 setPrimary:v25 == 0];
        [(PKOneTimeCodeView *)v8 addSubview:v26];
        [v24 addObject:v26];

        ++v25;
      }
      while (v8->_codeLength > (double)v25);
    }
    uint64_t v27 = [v24 copy];
    codeFields = v8->_codeFields;
    v8->_codeFields = (NSArray *)v27;

    [(PKOneTimeCodeView *)v8 setEntrySpacing:8.0];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel__passcodeFieldTapped_];
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v29;

    [(PKOneTimeCodeView *)v8 addGestureRecognizer:v8->_tapGestureRecognizer];
    [(PKOneTimeCodeView *)v8 _updateLabels];
  }
  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9 = (UITextField *)a3;
  id v10 = a5;
  v11 = v10;
  if (self->_invisibleTextField != v9
    || self->_disableEntry
    || ([v10 isEqualToString:@"\n"] & 1) != 0
    || [v11 rangeOfCharacterFromSet:self->_nonNumericCharSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v12 = [(UITextField *)v9 text];
    v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v11);

    double v14 = (double)(unint64_t)[v13 length];
    double codeLength = self->_codeLength;
    BOOL v16 = codeLength >= v14;
    if (codeLength >= v14)
    {
      [(PKOneTimeCodeView *)self setEntryError:0];
      objc_storeStrong((id *)&self->_value, v13);
      [(PKOneTimeCodeView *)self _updateLabels];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = (void *)[(NSString *)self->_value copy];
      [WeakRetained oneTimeCodeView:self didEnterCode:v18];
    }
  }

  return v16;
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_invisibleTextField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(UITextField *)self->_invisibleTextField resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(UITextField *)self->_invisibleTextField isFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return !self->_disableEntry;
}

- (BOOL)isSecureTextEntry
{
  return [(UITextField *)self->_invisibleTextField isSecureTextEntry];
}

- (BOOL)hasText
{
  return [(NSString *)self->_value length] != 0;
}

- (id)currentCode
{
  v2 = (void *)[(NSString *)self->_value copy];

  return v2;
}

- (void)clearCurrentCode
{
  v3 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  value = self->_value;
  self->_value = v3;

  [(PKOneTimeCodeView *)self _updateLabels];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)[(NSString *)self->_value copy];
  [WeakRetained oneTimeCodeView:self didEnterCode:v5];
}

- (void)setEntrySpacing:(double)a3
{
  if (self->_entrySpacing != a3)
  {
    self->_entrySpacing = a3;
    [(PKOneTimeCodeView *)self setNeedsLayout];
  }
}

- (void)setDisableEntry:(BOOL)a3
{
  if (self->_disableEntry != a3) {
    self->_disableEntry = a3;
  }
}

- (void)setEntryError:(unint64_t)a3
{
  if (self->_entryError != a3)
  {
    self->_entryError = a3;
    [(PKOneTimeCodeView *)self _updateLabels];
    [(PKOneTimeCodeView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKOneTimeCodeView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKOneTimeCodeView;
  [(PKOneTimeCodeView *)&v3 layoutSubviews];
  [(PKOneTimeCodeView *)self bounds];
  -[PKOneTimeCodeView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  NSUInteger v8 = [(NSArray *)self->_codeFields count];
  double entrySpacing = self->_entrySpacing;
  double v10 = 0.0;
  if ([(NSArray *)self->_codeFields count]) {
    double v10 = (width - fmax(entrySpacing * (double)(v8 - 1), 0.0)) / (double)[(NSArray *)self->_codeFields count];
  }
  if ([(NSArray *)self->_codeFields count])
  {
    unint64_t v11 = 0;
    double v12 = 0.0;
    do
    {
      v13 = [(NSArray *)self->_codeFields objectAtIndexedSubscript:v11];
      [v13 frame];
      double v14 = v10 + v12;
      if (++v11 < [(NSArray *)self->_codeFields count]) {
        double v14 = v14 + self->_entrySpacing;
      }
      if (!a4) {
        objc_msgSend(v13, "setFrame:", v12, y, v10, v10);
      }

      double v12 = v14;
    }
    while (v11 < [(NSArray *)self->_codeFields count]);
  }
  double v15 = v10 + 0.0;
  if ([(PKIconTextLabel *)self->_entryErrorLabel hasContent])
  {
    -[PKIconTextLabel sizeThatFits:](self->_entryErrorLabel, "sizeThatFits:", width, 1.79769313e308);
    PKRectCenteredXInRect();
    double v15 = v15 + v19 + 16.0;
    if (a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!a4) {
LABEL_14:
  }
    -[PKIconTextLabel setFrame:](self->_entryErrorLabel, "setFrame:", v16, v17, v18, v19);
LABEL_15:
  double v20 = width;
  double v21 = v15;
  result.height = v21;
  result.double width = v20;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKOneTimeCodeView;
  [(PKOneTimeCodeView *)&v14 setBackgroundColor:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_codeFields;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setBackgroundColor:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateLabels
{
  objc_super v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
  id v4 = @"INVALID_SMS_OTP_CODE";
  switch(self->_entryError)
  {
    case 0uLL:
    case 1uLL:

      v5 = 0;
      id v23 = 0;
      goto LABEL_11;
    case 2uLL:
      goto LABEL_7;
    case 3uLL:
      id v4 = @"EXPIRED_SMS_OTP_CODE";
      goto LABEL_7;
    case 4uLL:
      id v4 = @"ATTEMPT_LIMIT_REACHED_SMS_OTP_CODE";
      goto LABEL_7;
    case 5uLL:
      id v4 = @"REQUEST_LIMIT_REACHED_SMS_OTP_CODE";
LABEL_7:
      v5 = PKLocalizedPaymentString(&v4->isa);
      break;
    default:
      v5 = 0;
      break;
  }
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v7 = [(PKIconTextLabel *)self->_entryErrorLabel textFont];
    uint64_t v8 = [v6 configurationWithFont:v7 scale:2];

    uint64_t v9 = [v3 imageWithConfiguration:v8];
    long long v10 = [(PKIconTextLabel *)self->_entryErrorLabel textColor];
    long long v11 = [v9 imageWithTintColor:v10];

    id v23 = [v11 imageWithRenderingMode:1];
  }
  else
  {
    id v23 = 0;
  }
LABEL_11:
  entryErrorLabel = self->_entryErrorLabel;
  long long v13 = objc_msgSend(v5, "pk_attributedString", v5);
  [(PKIconTextLabel *)entryErrorLabel setText:v13];

  [(PKIconTextLabel *)self->_entryErrorLabel setIcon:v23];
  if (self->_codeLength > 0.0)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    do
    {
      if (v15 >= [(NSString *)self->_value length])
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = -[NSString substringWithRange:](self->_value, "substringWithRange:", v15, 1);
      }
      double v17 = [(NSArray *)self->_codeFields objectAtIndexedSubscript:v15];
      double v18 = v17;
      unint64_t entryError = self->_entryError;
      if (entryError) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = (v16 == 0) & (v14 ^ 1u);
      }
      if (entryError) {
        int v21 = 0;
      }
      else {
        int v21 = (v16 == 0) & (v14 ^ 1);
      }
      v14 |= v21;
      [v17 setHighligtType:v20];
      [v18 setText:v16];

      ++v15;
    }
    while (self->_codeLength > (double)v15);
  }
  [(PKOneTimeCodeView *)self setNeedsLayout];
}

- (void)_passcodeFieldTapped:(id)a3
{
  if ([(PKOneTimeCodeView *)self canBecomeFirstResponder])
  {
    [(PKOneTimeCodeView *)self becomeFirstResponder];
  }
}

- (id)_firstCodeField
{
  return [(NSArray *)self->_codeFields firstObject];
}

- (double)codeLength
{
  return self->_codeLength;
}

- (double)entrySpacing
{
  return self->_entrySpacing;
}

- (BOOL)disableEntry
{
  return self->_disableEntry;
}

- (unint64_t)entryError
{
  return self->_entryError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNumericCharSet, 0);
  objc_storeStrong((id *)&self->_invisibleTextField, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_entryErrorLabel, 0);
  objc_storeStrong((id *)&self->_templateField, 0);
  objc_storeStrong((id *)&self->_codeFields, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end