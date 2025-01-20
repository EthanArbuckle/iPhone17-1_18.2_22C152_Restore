@interface PKPaymentSetupFieldBuiltInPhoneNumber
- (BOOL)hasDisplayFormat;
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInPhoneNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)_submissionStringForValue:(id)a3;
@end

@implementation PKPaymentSetupFieldBuiltInPhoneNumber

- (PKPaymentSetupFieldBuiltInPhoneNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFieldBuiltInPhoneNumber;
  v4 = [(PKPaymentSetupFieldText *)&v11 initWithIdentifier:@"phoneNumber" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_Phone_0.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupField *)v4 setRequiresSecureSubmission:0];
    [(PKPaymentSetupFieldText *)v4 setMinLength:1];
    [(PKPaymentSetupFieldText *)v4 setMaxLength:20];
    [(PKPaymentSetupFieldText *)v4 setSecureText:0];
    [(PKPaymentSetupFieldText *)v4 setSecureVisibleText:0];
    [(PKPaymentSetupFieldText *)v4 setNumeric:1];
    [(PKPaymentSetupFieldText *)v4 setLuhnCheck:0];
    [(PKPaymentSetupFieldText *)v4 setPaddingCharacters:&unk_1EE22ACA0];
    v6 = (void *)MEMORY[0x1E4F28E58];
    v7 = [&unk_1EE22ACA0 componentsJoinedByString:&stru_1EE0F5368];
    v8 = [v6 characterSetWithCharactersInString:v7];

    v9 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    [v8 formUnionWithCharacterSet:v9];

    [v8 addCharactersInString:@"+"];
    [(PKPaymentSetupFieldText *)v4 setAllowedCharacters:v8];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (id)_submissionStringForValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupFieldBuiltInPhoneNumber;
  v4 = [(PKPaymentSetupFieldText *)&v17 _submissionStringForValue:a3];
  v5 = PKBestGuessNormalizedPhoneNumber(v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(PKPaymentSetupFieldText *)self paddingCharacters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      objc_super v11 = v5;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 = [v11 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v13 + 1) + 8 * v10) withString:&stru_1EE0F5368];

        ++v10;
        objc_super v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

@end