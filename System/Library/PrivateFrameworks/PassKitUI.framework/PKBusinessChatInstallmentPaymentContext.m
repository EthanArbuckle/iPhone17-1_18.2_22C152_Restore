@interface PKBusinessChatInstallmentPaymentContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatInstallmentPaymentContext)initWithAccount:(id)a3 paymentPass:(id)a4;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatInstallmentPaymentContext

- (PKBusinessChatInstallmentPaymentContext)initWithAccount:(id)a3 paymentPass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBusinessChatInstallmentPaymentContext;
  v9 = [(PKBusinessChatInstallmentPaymentContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_paymentPass, a4);
  }

  return v10;
}

- (id)businessIdentifier
{
  return (id)[(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"wallet_installments_payment" forKeyedSubscript:@"targetDialog"];
  v4 = [(PKPaymentPass *)self->_paymentPass uniqueID];
  [v3 setObject:v4 forKeyedSubscript:@"passUniqueId"];

  v5 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"accountID"];

  v6 = (void *)[v3 copy];

  return v6;
}

- (id)groupParameters
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"domain";
  v4[1] = @"origin";
  v5[0] = @"apple_pay";
  v5[1] = @"Wallet";
  v4[2] = @"page";
  v5[2] = @"wallet::installments::payment";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)PKLocalizedBeekmanString(&cfstr_BillPaymentMul.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end