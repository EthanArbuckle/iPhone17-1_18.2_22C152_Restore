@interface ReservationInputCell
- ($C9619C9B71239767CB6E25A81D0F9A71)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4;
- (BOOL)required;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)placeholderText;
- (NSString)text;
- (UITextField)textField;
- (id)detailTextColor;
- (int64_t)type;
- (void)configureTextField;
- (void)doneButtonTapped:(id)a3;
- (void)loadDetailView;
- (void)setDetailTextColor:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextField:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateTextColorForText:(id)a3;
@end

@implementation ReservationInputCell

- (void)loadDetailView
{
  id v3 = objc_alloc_init((Class)UITextField);
  [(ReservationInputCell *)self setTextField:v3];

  v4 = +[UIColor clearColor];
  v5 = [(ReservationInputCell *)self textField];
  [v5 setBackgroundColor:v4];

  v6 = [(ReservationTableViewCell *)self titleLabel];
  v7 = [v6 font];
  v8 = [(ReservationInputCell *)self textField];
  [v8 setFont:v7];

  v9 = [(ReservationInputCell *)self textField];
  [v9 setDelegate:self];

  v10 = [(ReservationInputCell *)self textField];
  [v10 setTextAlignment:2];

  v11 = [(ReservationInputCell *)self textField];
  [v11 setReturnKeyType:9];

  v12 = [(ReservationInputCell *)self textField];
  v13 = [v12 textInputTraits];
  [v13 setContentsIsSingleValue:1];

  v14 = [(ReservationInputCell *)self textField];
  LODWORD(v15) = 1132068864;
  [v14 setContentHuggingPriority:0 forAxis:v15];

  v16 = [(ReservationTableViewCell *)self titleLabel];
  LODWORD(v17) = 1148846080;
  [v16 setContentHuggingPriority:0 forAxis:v17];

  [(ReservationInputCell *)self configureTextField];
  id v18 = [(ReservationInputCell *)self textField];
  [(ReservationTableViewCell *)self setDetailView:v18];
}

- (void)configureTextField
{
  switch([(ReservationInputCell *)self type])
  {
    case 0:
      id v3 = [(ReservationInputCell *)self textField];
      [v3 setAutocorrectionType:1];

      v4 = [(ReservationInputCell *)self textField];
      [v4 setKeyboardType:5];

      id v20 = [(ReservationInputCell *)self textField];
      [v20 setTextContentType:UITextContentTypeTelephoneNumber];
      goto LABEL_9;
    case 1:
      v5 = [(ReservationInputCell *)self textField];
      [v5 setAutocorrectionType:1];

      v6 = [(ReservationInputCell *)self textField];
      [v6 setAutocapitalizationType:0];

      v7 = [(ReservationInputCell *)self textField];
      [v7 setTextContentType:UITextContentTypeEmailAddress];

      v8 = [(ReservationInputCell *)self textField];
      id v20 = v8;
      uint64_t v9 = 7;
      goto LABEL_7;
    case 2:
      v10 = [(ReservationInputCell *)self textField];
      [v10 setAutocorrectionType:1];

      v11 = [(ReservationInputCell *)self textField];
      [v11 setAutocapitalizationType:1];

      v12 = &UITextContentTypeGivenName;
      goto LABEL_6;
    case 3:
      v13 = [(ReservationInputCell *)self textField];
      [v13 setAutocorrectionType:1];

      v14 = [(ReservationInputCell *)self textField];
      [v14 setAutocapitalizationType:1];

      v12 = &UITextContentTypeFamilyName;
LABEL_6:
      UITextContentType v15 = *v12;
      v16 = [(ReservationInputCell *)self textField];
      [v16 setTextContentType:v15];

      v8 = [(ReservationInputCell *)self textField];
      id v20 = v8;
      uint64_t v9 = 0;
LABEL_7:
      [v8 setKeyboardType:v9];
      goto LABEL_9;
    case 4:
      double v17 = [(ReservationInputCell *)self textField];
      [v17 setAutocorrectionType:2];

      id v18 = [(ReservationInputCell *)self textField];
      [v18 setAutocapitalizationType:2];

      v19 = [(ReservationInputCell *)self textField];
      [v19 setKeyboardType:0];

      id v20 = [(ReservationInputCell *)self textField];
      [v20 setTextSuggestionDelegate:0];
LABEL_9:

      break;
    default:
      return;
  }
}

- (void)doneButtonTapped:(id)a3
{
  id v3 = [(ReservationInputCell *)self textField];
  [v3 resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(ReservationInputCell *)self textField];

  if (v5 == v4) {
    [(ReservationInputCell *)self doneButtonTapped:v4];
  }

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if (![v10 length]
    || [(ReservationInputCell *)self type]
    || ([v10 isEqualToString:@" "] & 1) != 0)
  {
    goto LABEL_8;
  }
  v11 = [v9 text];
  v12 = [v11 stringByReplacingCharactersInRange:location length:length withString:v10];

  if (![v12 length])
  {

    goto LABEL_8;
  }
  v13 = +[CNPhoneNumber phoneNumberWithStringValue:v12];
  v14 = [v13 formattedStringValue];
  id v15 = [v14 length];

  if (v15)
  {
LABEL_8:
    double v17 = [v9 text];
    id v18 = [v17 stringByReplacingCharactersInRange:location length:length withString:v10];

    [(ReservationInputCell *)self updateTextColorForText:v18];
    BOOL v16 = 1;
    goto LABEL_9;
  }
  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- ($C9619C9B71239767CB6E25A81D0F9A71)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  id v5 = a3;
  v6 = +[CNPhoneNumber defaultCountryCode];
  v7 = +[CNPhoneNumber phoneNumberWithDigits:v5 countryCode:v6];

  uint64_t v8 = [v7 formattedStringValue];
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v16 = v8;
    id v10 = +[NSArray arrayWithObjects:&v16 count:1];
    id v11 = [v9 length];
    v12 = (NSString *)[v9 copy];
    previousValue = self->_previousValue;
    self->_previousValue = v12;
  }
  else
  {
    id v10 = 0;
    id v11 = 0;
  }

  v14 = v10;
  unint64_t v15 = (unint64_t)v11;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)updateTextColorForText:(id)a3
{
  id v6 = a3;
  if (-[ReservationInputCell required](self, "required") && ![v6 length])
  {
    uint64_t v4 = +[UIColor redColor];
  }
  else
  {
    uint64_t v4 = +[UIColor labelColor];
  }
  id v5 = (void *)v4;
  [(ReservationTableViewCell *)self setTitleTextColor:v4];
}

- (void)setPlaceholderText:(id)a3
{
  id v4 = a3;
  id v5 = [(ReservationInputCell *)self textField];
  [v5 setPlaceholder:v4];
}

- (NSString)placeholderText
{
  v2 = [(ReservationInputCell *)self textField];
  id v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  id v4 = [(ReservationInputCell *)self textField];
  [v4 setText:v5];

  [(ReservationInputCell *)self updateTextColorForText:v5];
}

- (void)setDetailTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(ReservationInputCell *)self textField];
  [v5 setTextColor:v4];
}

- (id)detailTextColor
{
  v2 = [(ReservationInputCell *)self textField];
  id v3 = [v2 textColor];

  return v3;
}

- (NSString)text
{
  v2 = [(ReservationInputCell *)self textField];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(ReservationInputCell *)self configureTextField];
  }
}

- (void)setRequired:(BOOL)a3
{
  if (((!self->_required ^ a3) & 1) == 0)
  {
    self->_required = a3;
    id v4 = [(ReservationInputCell *)self text];
    [(ReservationInputCell *)self updateTextColorForText:v4];
  }
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)required
{
  return self->_required;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_previousValue, 0);
}

@end