@interface PKBusinessChatPassDetailsContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatPassDetailsContext)initWithPass:(id)a3;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatPassDetailsContext

- (PKBusinessChatPassDetailsContext)initWithPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBusinessChatPassDetailsContext;
  v6 = [(PKBusinessChatPassDetailsContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (id)businessIdentifier
{
  return (id)[(PKPass *)self->_pass businessChatIdentifier];
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"wallet_pass_message" forKeyedSubscript:@"targetDialog"];
  v4 = [(PKPass *)self->_pass uniqueID];
  [v3 setObject:v4 forKeyedSubscript:@"passUniqueId"];

  id v5 = [(PKPass *)self->_pass paymentPass];
  v6 = [v5 associatedAccountServiceAccountIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"accountID"];

  v7 = (void *)[v3 copy];

  return v7;
}

- (id)groupParameters
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"domain";
  v4[1] = @"origin";
  v5[0] = @"apple_pay";
  v5[1] = @"Wallet";
  v4[2] = @"page";
  v5[2] = @"wallet::pass::message";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (void).cxx_destruct
{
}

@end