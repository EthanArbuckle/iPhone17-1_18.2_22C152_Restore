@interface PKBusinessChatPhysicalCardContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatPhysicalCardContext)initWithPaymentPass:(id)a3 intent:(int64_t)a4;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatPhysicalCardContext

- (PKBusinessChatPhysicalCardContext)initWithPaymentPass:(id)a3 intent:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBusinessChatPhysicalCardContext;
  v8 = [(PKBusinessChatPhysicalCardContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_paymentPass, a3);
    v9->_intent = a4;
  }

  return v9;
}

- (id)businessIdentifier
{
  return (id)[(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
}

- (id)intentParameters
{
  unint64_t intent = self->_intent;
  if (intent > 7) {
    v4 = 0;
  }
  else {
    v4 = off_1E59CCF40[intent];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:v4 forKeyedSubscript:@"targetDialog"];
  v6 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
  [v5 setObject:v6 forKeyedSubscript:@"accountID"];

  id v7 = (void *)[v5 copy];

  return v7;
}

- (id)groupParameters
{
  v7[3] = *MEMORY[0x1E4F143B8];
  unint64_t intent = self->_intent;
  if (intent > 7) {
    v3 = 0;
  }
  else {
    v3 = off_1E59CCF80[intent];
  }
  v6[0] = @"domain";
  v6[1] = @"origin";
  v7[0] = @"apple_pay";
  v7[1] = @"Wallet";
  v6[2] = @"page";
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)bodyText
{
  v3 = 0;
  switch(self->_intent)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v3 = PKLocalizedFeatureStringWithDefaultValue();
      break;
    default:
      break;
  }

  return v3;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (void).cxx_destruct
{
}

@end