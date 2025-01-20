@interface PKPaymentSetupFieldBuiltInCitizenship
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInCitizenship)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInCitizenship

- (PKPaymentSetupFieldBuiltInCitizenship)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldBuiltInCitizenship;
  v9 = [(PKPaymentSetupField *)&v12 initWithIdentifier:@"citizenship" type:a4];
  if (v9)
  {
    v10 = PKLocalizedFeatureString(@"CITIZENSHIP", 2, 0, v4, v5, v6, v7, v8, (uint64_t)v12.receiver);
    [(PKPaymentSetupField *)v9 _setLocalizedDisplayName:v10];

    [(PKPaymentSetupField *)v9 setRequiresSecureSubmission:1];
  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end