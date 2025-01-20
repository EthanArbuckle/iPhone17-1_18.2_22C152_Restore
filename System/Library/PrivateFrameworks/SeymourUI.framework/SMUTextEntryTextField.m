@interface SMUTextEntryTextField
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (SMUTextEntryTextField)initWithFrame:(CGRect)a3;
- (_NSRange)_filteredRangeForText:(id)a3;
- (id)text;
- (unint64_t)maxLength;
- (void)insertText:(id)a3;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation SMUTextEntryTextField

- (SMUTextEntryTextField)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryTextField;
  result = -[SMUTextEntryTextField initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_allowsFocus = 0;
  }
  return result;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (void)setMaxLength:(unint64_t)a3
{
  if (self->_maxLength != a3)
  {
    self->_maxLength = a3;
    objc_super v4 = [(SMUTextEntryTextField *)self text];
    uint64_t v5 = [(SMUTextEntryTextField *)self _filteredRangeForText:v4];
    v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    v8.receiver = self;
    v8.super_class = (Class)SMUTextEntryTextField;
    [(SMUTextEntryTextField *)&v8 setText:v7];
  }
}

- (id)text
{
  if ([(SMUTextEntryTextField *)self isSecureTextEntry])
  {
    v8.receiver = self;
    v8.super_class = (Class)SMUTextEntryTextField;
    v3 = [(SMUTextEntryTextField *)&v8 text];
  }
  else
  {
    if (!text_tabCharacterSet)
    {
      uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\t"];
      uint64_t v5 = (void *)text_tabCharacterSet;
      text_tabCharacterSet = v4;
    }
    v9.receiver = self;
    v9.super_class = (Class)SMUTextEntryTextField;
    uint64_t v6 = [(SMUTextEntryTextField *)&v9 text];
    v3 = [v6 stringByTrimmingCharactersInSet:text_tabCharacterSet];
  }

  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMUTextEntryTextField *)self _filteredRangeForText:v4];
  v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  v8.receiver = self;
  v8.super_class = (Class)SMUTextEntryTextField;
  [(SMUTextEntryTextField *)&v8 setText:v7];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMUTextEntryTextField *)self _filteredRangeForText:v4];
  v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  v8.receiver = self;
  v8.super_class = (Class)SMUTextEntryTextField;
  [(SMUTextEntryTextField *)&v8 insertText:v7];
}

- (_NSRange)_filteredRangeForText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  uint64_t v6 = [(SMUTextEntryTextField *)self text];
  if ([(SMUTextEntryTextField *)self maxLength])
  {
    uint64_t v7 = [v6 length];
    unint64_t v8 = [v4 length] + v7;
    if (v8 > [(SMUTextEntryTextField *)self maxLength])
    {
      unint64_t v9 = [(SMUTextEntryTextField *)self maxLength];
      uint64_t v5 = v9 - [v6 length];
    }
  }

  NSUInteger v10 = 0;
  NSUInteger v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

@end