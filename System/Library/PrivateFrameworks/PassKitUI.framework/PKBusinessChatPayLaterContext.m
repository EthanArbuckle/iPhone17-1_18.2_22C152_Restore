@interface PKBusinessChatPayLaterContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatPayLaterContext)initWithPayLaterAccount:(id)a3 paymentPass:(id)a4 topic:(id)a5 financingPlan:(id)a6 installment:(id)a7 payment:(id)a8 dispute:(id)a9;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatPayLaterContext

- (PKBusinessChatPayLaterContext)initWithPayLaterAccount:(id)a3 paymentPass:(id)a4 topic:(id)a5 financingPlan:(id)a6 installment:(id)a7 payment:(id)a8 dispute:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PKBusinessChatPayLaterContext;
  v18 = [(PKBusinessChatPayLaterContext *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    objc_storeStrong((id *)&v19->_paymentPass, a4);
    objc_storeStrong((id *)&v19->_topic, a5);
    objc_storeStrong((id *)&v19->_financingPlan, a6);
    objc_storeStrong((id *)&v19->_installment, a7);
    objc_storeStrong((id *)&v19->_payment, a8);
    objc_storeStrong((id *)&v19->_dispute, a9);
  }

  return v19;
}

- (id)businessIdentifier
{
  return (id)[(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKPayLaterBusinessChatTopic *)self->_topic targetDialog];
  [v3 setObject:v4 forKeyedSubscript:@"targetDialog"];

  v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"loanID"];

  v6 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"loanActivityItemID"];
  }
  else
  {
    v7 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"loanActivityItemID"];
    }
    else
    {
      v8 = [(PKPayLaterFinancingPlanDispute *)self->_dispute identifier];
      [v3 setObject:v8 forKeyedSubscript:@"loanActivityItemID"];
    }
  }

  v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  v10 = [v9 displayName];
  [v3 setObject:v10 forKeyedSubscript:@"transactionMerchantName"];

  v11 = (void *)[v3 copy];

  return v11;
}

- (id)groupParameters
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"domain";
  v5[1] = @"origin";
  v6[0] = @"FPP";
  v6[1] = @"Wallet";
  v5[2] = @"page";
  v2 = [(PKPayLaterBusinessChatTopic *)self->_topic page];
  v6[2] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)[(PKPayLaterBusinessChatTopic *)self->_topic messagesBubbleTextWithFinancingPlan:self->_financingPlan installment:self->_installment payment:self->_payment dispute:self->_dispute];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispute, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end