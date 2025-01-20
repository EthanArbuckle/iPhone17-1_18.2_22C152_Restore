@interface WBSCreditCardImporterDelegateProxy
- (WBSCreditCardImporterDelegateProxy)initWithDelegate:(id)a3;
- (unint64_t)numberOfCreditCardsImported;
- (void)finishWithCompletionHandler:(id)a3;
- (void)importCreditCardDataWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8;
@end

@implementation WBSCreditCardImporterDelegateProxy

- (WBSCreditCardImporterDelegateProxy)initWithDelegate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCreditCardImporterDelegateProxy;
  v6 = [(WBSCreditCardImporterDelegateProxy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = v7;
  }

  return v7;
}

- (void)importCreditCardDataWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8
{
  delegate = self->_delegate;
  ++self->_numberOfCreditCardsImported;
  [(WBSCreditCardImporterDelegate *)delegate importCreditCardDataWithCardNumber:a3 cardName:a4 cardholderName:a5 cardExpirationMonth:a6 cardExpirationYear:a7 lastUsedDate:a8];
}

- (void)finishWithCompletionHandler:(id)a3
{
}

- (unint64_t)numberOfCreditCardsImported
{
  return self->_numberOfCreditCardsImported;
}

- (void).cxx_destruct
{
}

@end