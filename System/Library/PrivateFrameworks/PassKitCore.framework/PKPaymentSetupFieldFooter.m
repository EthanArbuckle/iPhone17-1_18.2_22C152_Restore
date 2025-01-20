@interface PKPaymentSetupFieldFooter
- (NSAttributedString)body;
- (PKPaymentSetupFieldFooter)initWithIdentifier:(id)a3 body:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fieldType;
- (unint64_t)fontScale;
- (unint64_t)position;
- (void)setBody:(id)a3;
- (void)setFontScale:(unint64_t)a3;
- (void)setPosition:(unint64_t)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldFooter

- (PKPaymentSetupFieldFooter)initWithIdentifier:(id)a3 body:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFieldFooter;
  v7 = [(PKPaymentSetupField *)&v11 initWithIdentifier:a3 type:4];
  v8 = v7;
  if (v7)
  {
    [(PKPaymentSetupFieldFooter *)v7 setBody:v6];
    v9 = [v6 string];
    [(PKPaymentSetupField *)v8 setDefaultValue:v9];
  }
  return v8;
}

- (unint64_t)fieldType
{
  return 4;
}

- (void)updateWithAttribute:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldFooter;
  [(PKPaymentSetupFieldLabel *)&v7 updateWithAttribute:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v5 = [(PKPaymentSetupField *)self defaultValue];
  id v6 = (void *)[v4 initWithString:v5];
  [(PKPaymentSetupFieldFooter *)self setBody:v6];
}

- (void)updateWithConfiguration:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldFooter;
  id v4 = a3;
  [(PKPaymentSetupFieldLabel *)&v10 updateWithConfiguration:v4];
  v5 = [(PKPaymentSetupField *)self defaultValue];
  id v6 = PKAttributedStringByParsingLinksInString(v5, 0);

  [(PKPaymentSetupFieldFooter *)self setBody:v6];
  objc_super v7 = [v6 string];
  [(PKPaymentSetupField *)self setDefaultValue:v7];

  v8 = [v4 PKStringForKey:@"position"];

  if (v8)
  {
    if ([@"sticky" isEqualToString:v8])
    {
      uint64_t v9 = 1;
    }
    else if ([@"inline" isEqualToString:v8])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(PKPaymentSetupFieldFooter *)self setPosition:v9];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldFooter;
  v5 = -[PKPaymentSetupFieldLabel copyWithZone:](&v9, sel_copyWithZone_);
  v5[26] = self->_fontScale;
  uint64_t v6 = [(NSAttributedString *)self->_body copyWithZone:a3];
  objc_super v7 = (void *)v5[27];
  v5[27] = v6;

  v5[28] = self->_position;
  return v5;
}

- (unint64_t)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(unint64_t)a3
{
  self->_fontScale = a3;
}

- (NSAttributedString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end