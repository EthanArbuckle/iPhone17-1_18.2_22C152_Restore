@interface PKPaymentSetupFieldBuiltInCountryCode
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInCountryCode)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInCountryCode

- (PKPaymentSetupFieldBuiltInCountryCode)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCountryCode;
  v4 = [(PKPaymentSetupField *)&v7 initWithIdentifier:@"countryCode" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_CountryCode.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end