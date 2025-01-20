@interface PKPaymentSetupFieldBuiltInPrimaryAccountNumber
- (BOOL)hasDisplayFormat;
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInPrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)compactLocalizedDisplayName;
- (id)displayFormatPaddingCharacters;
- (id)stringByApplyingDisplayFormat:(id)a3;
@end

@implementation PKPaymentSetupFieldBuiltInPrimaryAccountNumber

- (PKPaymentSetupFieldBuiltInPrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInPrimaryAccountNumber;
  v4 = [(PKPaymentSetupFieldText *)&v7 initWithIdentifier:@"primaryAccountNumber" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_CardNumber.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupField *)v4 setSubmissionKey:@"primaryAccountNumber"];
    [(PKPaymentSetupField *)v4 setSubmissionDestination:@"eligibility"];
    [(PKPaymentSetupField *)v4 setRequiresSecureSubmission:1];
    [(PKPaymentSetupFieldText *)v4 setMinLength:1];
    [(PKPaymentSetupFieldText *)v4 setMaxLength:64];
    [(PKPaymentSetupFieldText *)v4 setSecureText:1];
    [(PKPaymentSetupFieldText *)v4 setSecureVisibleText:1];
    [(PKPaymentSetupFieldText *)v4 setNumeric:1];
    [(PKPaymentSetupFieldText *)v4 setLuhnCheck:0];
    [(PKPaymentSetupFieldText *)v4 setKeyboardAccessories:&unk_1EE22AC88];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (id)compactLocalizedDisplayName
{
  v3 = [(PKPaymentSetupField *)self rawConfigurationDictionary];
  v4 = [v3 objectForKey:@"localizedDisplayName"];

  if (v4) {
    [(PKPaymentSetupField *)self localizedDisplayName];
  }
  else {
  v5 = PKLocalizedPaymentString(&cfstr_CompactCardNum.isa, 0);
  }
  return v5;
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentSetupField *)self displayFormat];
  uint64_t v6 = [v5 length];

  if (!v4 || v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldBuiltInPrimaryAccountNumber;
    uint64_t v7 = [(PKPaymentSetupFieldText *)&v10 stringByApplyingDisplayFormat:v4];
  }
  else
  {
    uint64_t v7 = PKFormattedStringForPAN(v4);
  }
  v8 = (void *)v7;

  return v8;
}

- (id)displayFormatPaddingCharacters
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@" "];
}

@end