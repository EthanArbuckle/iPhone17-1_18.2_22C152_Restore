@interface PKBusinessChatAccountStateContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatAccountStateContext)initWithAccount:(id)a3 paymentPass:(id)a4 eligibleForRecoveryPaymentPlan:(BOOL)a5;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatAccountStateContext

- (PKBusinessChatAccountStateContext)initWithAccount:(id)a3 paymentPass:(id)a4 eligibleForRecoveryPaymentPlan:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKBusinessChatAccountStateContext;
  v11 = [(PKBusinessChatAccountStateContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    objc_storeStrong((id *)&v12->_paymentPass, a4);
    v12->_eligibleForRecoveryPaymentPlan = a5;
  }

  return v12;
}

- (id)businessIdentifier
{
  return (id)[(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
}

- (id)intentParameters
{
  switch([(PKAccount *)self->_account state])
  {
    case 0:
      v3 = @"wallet_account_unknown";
      break;
    case 1:
      v3 = @"wallet_account_active";
      break;
    case 2:
      if ([(PKAccount *)self->_account stateReason] == 1 && self->_eligibleForRecoveryPaymentPlan) {
        v3 = @"wallet_account_delinquent";
      }
      else {
        v3 = @"wallet_account_restricted";
      }
      break;
    case 3:
      v3 = @"wallet_account_locked";
      break;
    case 4:
      if ([(PKAccount *)self->_account stateReason] == 8 && self->_eligibleForRecoveryPaymentPlan) {
        v3 = @"wallet_account_chargedoff";
      }
      else {
        v3 = @"wallet_account_closed";
      }
      break;
    default:
      v3 = 0;
      break;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:v3 forKeyedSubscript:@"targetDialog"];
  v5 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"accountID"];

  v6 = (void *)[v4 copy];

  return v6;
}

- (id)groupParameters
{
  switch([(PKAccount *)self->_account state])
  {
    case 0:
      v3 = @"wallet::account::unknown";
      break;
    case 1:
      v3 = @"wallet::account::active";
      break;
    case 2:
      if ([(PKAccount *)self->_account stateReason] == 1 && self->_eligibleForRecoveryPaymentPlan) {
        v3 = @"wallet::account::delinquent";
      }
      else {
        v3 = @"wallet::account::restricted";
      }
      break;
    case 3:
      v3 = @"wallet::account::locked";
      break;
    case 4:
      if ([(PKAccount *)self->_account stateReason] == 8 && self->_eligibleForRecoveryPaymentPlan) {
        v3 = @"wallet::account::chargedoff";
      }
      else {
        v3 = @"wallet::account::closed";
      }
      break;
    default:
      v3 = 0;
      break;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:@"apple_pay" forKeyedSubscript:@"domain"];
  [v4 setObject:@"Wallet" forKeyedSubscript:@"origin"];
  [v4 setObject:v3 forKeyedSubscript:@"page"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  uint64_t v3 = [(PKAccount *)self->_account state];
  if (v3 == 4)
  {
    if ([(PKAccount *)self->_account stateReason] == 8 && self->_eligibleForRecoveryPaymentPlan) {
      goto LABEL_7;
    }
  }
  else if (v3 == 2 && self->_eligibleForRecoveryPaymentPlan)
  {
LABEL_7:
    id v4 = PKLocalizedFeatureString();
    goto LABEL_9;
  }
  id v4 = PKLocalizedFeatureStringWithDefaultValue();
LABEL_9:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end