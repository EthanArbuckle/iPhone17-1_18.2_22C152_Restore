@interface PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber
- (BOOL)hasDisplayFormat;
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)displayFormatPaddingCharacters;
- (id)stringByApplyingDisplayFormat:(id)a3;
@end

@implementation PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber

- (PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber;
  v4 = [(PKPaymentSetupFieldText *)&v7 initWithIdentifier:@"cardOnFilePrimaryAccountNumber" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_CardOnFile.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupField *)v4 setSubmissionKey:0];
    [(PKPaymentSetupField *)v4 setSubmissionDestination:0];
    [(PKPaymentSetupField *)v4 setRequiresSecureSubmission:0];
    [(PKPaymentSetupFieldText *)v4 setMinLength:0];
    [(PKPaymentSetupFieldText *)v4 setMaxLength:0];
    [(PKPaymentSetupFieldText *)v4 setSecureText:0];
    [(PKPaymentSetupFieldText *)v4 setSecureVisibleText:0];
    [(PKPaymentSetupFieldText *)v4 setNumeric:0];
    [(PKPaymentSetupFieldText *)v4 setLuhnCheck:0];
    [(PKPaymentSetupField *)v4 setDisplayFormat:@"XXXX XXXXX"];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)displayFormatPaddingCharacters
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@" "];
}

@end