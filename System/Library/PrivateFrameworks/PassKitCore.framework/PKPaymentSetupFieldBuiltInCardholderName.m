@interface PKPaymentSetupFieldBuiltInCardholderName
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInCardholderName)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInCardholderName

- (PKPaymentSetupFieldBuiltInCardholderName)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCardholderName;
  v4 = [(PKPaymentSetupFieldText *)&v7 initWithIdentifier:@"cardholderName" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_Name_0.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupField *)v4 setSubmissionKey:@"name"];
    [(PKPaymentSetupField *)v4 setSubmissionDestination:@"eligibility"];
    [(PKPaymentSetupField *)v4 setRequiresSecureSubmission:1];
    [(PKPaymentSetupFieldText *)v4 setMinLength:1];
    [(PKPaymentSetupFieldText *)v4 setMaxLength:64];
    [(PKPaymentSetupFieldText *)v4 setSecureText:0];
    [(PKPaymentSetupFieldText *)v4 setSecureVisibleText:0];
    [(PKPaymentSetupFieldText *)v4 setNumeric:0];
    [(PKPaymentSetupFieldText *)v4 setLuhnCheck:0];
    [(PKPaymentSetupField *)v4 setDisplayFormat:&stru_1EE0F5368];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end