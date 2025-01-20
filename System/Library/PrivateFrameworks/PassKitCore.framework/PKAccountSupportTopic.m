@interface PKAccountSupportTopic
- (BOOL)supportsBusinessChat;
- (NSString)bodyText;
- (NSString)businessChatPage;
- (NSString)businessChatTargetDialog;
- (NSString)title;
- (PKAccountSupportTopic)initWithBeneficiaryTopicForAccount:(id)a3;
- (PKAccountSupportTopic)initWithDictionary:(id)a3;
- (PKAccountSupportTopic)initWithOtherTopicForAccount:(id)a3;
- (PKAccountSupportTopic)initWithUnavailableFundingSourceTopicForAccount:(id)a3;
- (PKAccountSupportTopicExplanation)explanation;
- (unint64_t)issueType;
@end

@implementation PKAccountSupportTopic

- (PKAccountSupportTopic)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountSupportTopic;
  v5 = [(PKAccountSupportTopic *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"bodyText"];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"page"];
    businessChatPage = v5->_businessChatPage;
    v5->_businessChatPage = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"targetDialogue"];
    businessChatTargetDialog = v5->_businessChatTargetDialog;
    v5->_businessChatTargetDialog = (NSString *)v12;

    v14 = [v4 PKDictionaryForKey:@"explanation"];
    id v15 = [v4 PKStringForKey:@"issueType"];
    if ([v15 isEqualToString:@"dispute"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"fraud"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"mapsFeedback"])
    {
      uint64_t v16 = 4;
    }
    else
    {
      uint64_t v16 = 0;
    }

    v5->_issueType = v16;
    if (v14)
    {
      v17 = [[PKAccountSupportTopicExplanation alloc] initWithDictionary:v14];
      explanation = v5->_explanation;
      v5->_explanation = v17;
    }
  }

  return v5;
}

- (PKAccountSupportTopic)initWithOtherTopicForAccount:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKAccountSupportTopic;
    v9 = [(PKAccountSupportTopic *)&v12 init];
    self = v9;
    if (v9)
    {
      businessChatPage = v9->_businessChatPage;
      v9->_businessChatPage = (NSString *)@"wallet::transaction::generalcontact";

      businessChatTargetDialog = self->_businessChatTargetDialog;
      uint64_t v8 = @"wallet_transaction_generalcontact";
      goto LABEL_7;
    }
  }
  else if (v4 == 4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKAccountSupportTopic;
    v5 = [(PKAccountSupportTopic *)&v13 init];
    self = v5;
    if (v5)
    {
      uint64_t v6 = v5->_businessChatPage;
      v5->_businessChatPage = (NSString *)@"wallet::savings::other";

      businessChatTargetDialog = self->_businessChatTargetDialog;
      uint64_t v8 = @"wallet_savings_other";
LABEL_7:
      self->_businessChatTargetDialog = &v8->isa;
    }
  }
  return self;
}

- (PKAccountSupportTopic)initWithUnavailableFundingSourceTopicForAccount:(id)a3
{
  if ([a3 type] == 4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAccountSupportTopic;
    uint64_t v4 = [(PKAccountSupportTopic *)&v10 init];
    v5 = v4;
    if (v4)
    {
      businessChatPage = v4->_businessChatPage;
      v4->_businessChatPage = (NSString *)@"wallet::savings::unavailablefundingsource";

      businessChatTargetDialog = v5->_businessChatTargetDialog;
      v5->_businessChatTargetDialog = (NSString *)@"wallet_savings_unavailablefundingsource";
    }
    self = v5;
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PKAccountSupportTopic)initWithBeneficiaryTopicForAccount:(id)a3
{
  if ([a3 type] == 4)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKAccountSupportTopic;
    uint64_t v4 = [(PKAccountSupportTopic *)&v17 init];
    v5 = v4;
    if (v4)
    {
      businessChatPage = v4->_businessChatPage;
      v4->_businessChatPage = (NSString *)@"wallet::savings::beneficiary";

      businessChatTargetDialog = v5->_businessChatTargetDialog;
      v5->_businessChatTargetDialog = (NSString *)@"wallet_savings_beneficiary";

      uint64_t v13 = PKLocalizedFeatureString(@"ADD_BENEFICIARY_MESSAGE_BODY", 5, 0, v8, v9, v10, v11, v12, (uint64_t)v17.receiver);
      bodyText = v5->_bodyText;
      v5->_bodyText = (NSString *)v13;
    }
    self = v5;
    id v15 = self;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)supportsBusinessChat
{
  return self->_businessChatPage
      && self->_businessChatTargetDialog
      && [(PKAccountSupportTopic *)self issueType] != 4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)businessChatTargetDialog
{
  return self->_businessChatTargetDialog;
}

- (NSString)businessChatPage
{
  return self->_businessChatPage;
}

- (unint64_t)issueType
{
  return self->_issueType;
}

- (PKAccountSupportTopicExplanation)explanation
{
  return self->_explanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_businessChatPage, 0);
  objc_storeStrong((id *)&self->_businessChatTargetDialog, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end