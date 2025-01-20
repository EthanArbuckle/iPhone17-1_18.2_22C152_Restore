@interface PKPaymentSetupFieldBuiltInTransactionLimit
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInTransactionLimit)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInTransactionLimit

- (PKPaymentSetupFieldBuiltInTransactionLimit)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldBuiltInTransactionLimit;
  v4 = [(PKPaymentSetupFieldText *)&v8 initWithIdentifier:@"transactionLimit" type:a4];
  if (v4)
  {
    v5 = PKLocalizedMadisonString(&cfstr_TransactionLim.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupField *)v4 setRequiresSecureSubmission:0];
    [(PKPaymentSetupFieldText *)v4 setMinLength:1];
    [(PKPaymentSetupFieldText *)v4 setMaxLength:15];
    [(PKPaymentSetupFieldText *)v4 setSecureText:0];
    [(PKPaymentSetupFieldText *)v4 setSecureVisibleText:0];
    [(PKPaymentSetupFieldText *)v4 setNumeric:1];
    [(PKPaymentSetupFieldText *)v4 setLuhnCheck:0];
    [(PKPaymentSetupFieldText *)v4 setCurrencyCode:@"USD"];
    [(PKPaymentSetupField *)v4 setOptional:1];
    v6 = PKLocalizedMadisonString(&cfstr_TransactionLim_0.isa, 0);
    [(PKPaymentSetupField *)v4 setLocalizedPlaceholder:v6];
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end