@interface PKPaymentPreferenceCell
- (BOOL)hasError;
- (PKPaymentPreferenceCell)initWithReuseIdentifier:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setHasError:(BOOL)a3;
@end

@implementation PKPaymentPreferenceCell

- (PKPaymentPreferenceCell)initWithReuseIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceCell;
  return [(PKPaymentPreferenceCell *)&v4 initWithStyle:0 reuseIdentifier:a3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPreferenceCell;
  [(PKTableViewCell *)&v3 prepareForReuse];
  [(PKPaymentPreferenceCell *)self setHasError:0];
}

- (void)setHasError:(BOOL)a3
{
  if (self->_hasError == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_hasError = a3;
  if (!self->_errorColor)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    errorColor = self->_errorColor;
    self->_errorColor = v9;

    if (v3) {
      goto LABEL_4;
    }
LABEL_6:
    [(PKPaymentPreferenceCell *)self setAccessoryView:0];
    v11 = [(PKPaymentPreferenceCell *)self detailTextLabel];
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v11 setTextColor:v12];

    id v13 = [(PKPaymentPreferenceCell *)self textLabel];
    v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v13 setTextColor:v6];
    goto LABEL_7;
  }
  if (!a3) {
    goto LABEL_6;
  }
LABEL_4:
  v5 = PKUIImageNamed(@"Payment_AlertAccessory");
  id v13 = [v5 _flatImageWithColor:self->_errorColor];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
  [(PKPaymentPreferenceCell *)self setAccessoryView:v6];
  v7 = [(PKPaymentPreferenceCell *)self detailTextLabel];
  [v7 setTextColor:self->_errorColor];

  v8 = [(PKPaymentPreferenceCell *)self textLabel];
  [v8 setTextColor:self->_errorColor];

LABEL_7:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPreferenceCell;
  [(PKPaymentPreferenceCell *)&v2 dealloc];
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void).cxx_destruct
{
}

@end