@interface PKPaymentSetupFieldBuiltInState
- (BOOL)isBuiltIn;
- (BOOL)supportsAddressAutofill;
- (PKPaymentSetupFieldBuiltInState)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInState

- (PKPaymentSetupFieldBuiltInState)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInState;
  v4 = [(PKPaymentSetupField *)&v7 initWithIdentifier:@"state" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_State_1.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (BOOL)supportsAddressAutofill
{
  return 1;
}

@end