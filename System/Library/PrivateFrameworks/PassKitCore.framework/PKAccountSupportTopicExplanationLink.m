@interface PKAccountSupportTopicExplanationLink
- (NSString)confirmationTitle;
- (NSString)text;
- (NSURL)url;
- (PKAccountSupportTopicExplanationLink)initWithDictionary:(id)a3;
- (unint64_t)action;
@end

@implementation PKAccountSupportTopicExplanationLink

- (PKAccountSupportTopicExplanationLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountSupportTopicExplanationLink;
  v5 = [(PKAccountSupportTopicExplanationLink *)&v16 init];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [v4 PKStringForKey:@"linkTitle"];
  text = v5->_text;
  v5->_text = (NSString *)v6;

  v8 = [v4 PKStringForKey:@"linkAction"];
  if ([v8 isEqualToString:@"openURL"]) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = [v8 isEqualToString:@"showMerchantDetails"];
  }
  v5->_action = v9;

  if (v5->_action)
  {
LABEL_9:
    uint64_t v13 = [v4 PKStringForKey:@"linkConfirmationTitle"];
    confirmationTitle = v5->_confirmationTitle;
    v5->_confirmationTitle = (NSString *)v13;

LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
  v10 = [v4 PKStringForKey:@"linkURL"];
  PKAccountSupportTopicURLFromActionString(v10);
  v11 = (PKAccountSupportTopicExplanationLink *)objc_claimAutoreleasedReturnValue();

  if (v11
    || ([v4 PKURLForKey:@"linkURL"],
        (v11 = (PKAccountSupportTopicExplanationLink *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end