@interface PKBusinessChatAccountContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatAccountContext)initWithAccount:(id)a3 topic:(id)a4;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatAccountContext

- (PKBusinessChatAccountContext)initWithAccount:(id)a3 topic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBusinessChatAccountContext;
  v9 = [(PKBusinessChatAccountContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)businessIdentifier
{
  if ([(PKAccount *)self->_account type] == 4)
  {
    v3 = PKSavingsBusinessChatIdentifierOverride();
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      v6 = [(PKAccount *)self->_account savingsDetails];
      id v5 = [v6 businessChatIdentifier];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKAccountSupportTopic *)self->_topic businessChatTargetDialog];
  [v3 setObject:v4 forKeyedSubscript:@"targetDialog"];

  id v5 = [(PKAccount *)self->_account accountIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"accountID"];

  v6 = (void *)[v3 copy];

  return v6;
}

- (id)groupParameters
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"domain";
  v5[1] = @"origin";
  v6[0] = @"apple_pay";
  v6[1] = @"Wallet";
  v5[2] = @"page";
  v2 = [(PKAccountSupportTopic *)self->_topic businessChatPage];
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
  return (id)[(PKAccountSupportTopic *)self->_topic bodyText];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end