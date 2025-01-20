@interface PKDynamicProvisioningPageLearnMoreContent
- (NSString)body;
- (NSString)businessChatButtonTitle;
- (NSString)businessChatIntentName;
- (NSString)buttonTitle;
- (NSString)subtitle;
- (NSString)termsIdentifier;
- (NSString)title;
- (NSURL)buttonURL;
- (PKDynamicProvisioningPageLearnMoreContent)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBody:(id)a3;
- (void)setBusinessChatButtonTitle:(id)a3;
- (void)setBusinessChatIntentName:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setButtonURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTermsIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKDynamicProvisioningPageLearnMoreContent

- (PKDynamicProvisioningPageLearnMoreContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKDynamicProvisioningPageLearnMoreContent;
  v5 = [(PKDynamicProvisioningPageLearnMoreContent *)&v37 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"buttonTitle"];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [v4 PKStringForKey:@"learnMoreButtonTitle"];
    }
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = v8;

    v10 = [v4 PKURLForKey:@"buttonURL"];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v4 PKURLForKey:@"learnMoreButtonURL"];
    }
    buttonURL = v5->_buttonURL;
    v5->_buttonURL = v12;

    uint64_t v14 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v14;

    v16 = [v4 PKStringForKey:@"title"];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      v18 = [v4 PKStringForKey:@"learnMoreTitle"];
    }
    title = v5->_title;
    v5->_title = v18;

    v20 = [v4 PKStringForKey:@"subtitle"];
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      v22 = [v4 PKStringForKey:@"learnMoreSubtitle"];
    }
    subtitle = v5->_subtitle;
    v5->_subtitle = v22;

    v24 = [v4 PKStringForKey:@"body"];
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v26 = [v4 PKStringForKey:@"learnMoreBody"];
    }
    body = v5->_body;
    v5->_body = v26;

    v28 = [v4 PKStringForKey:@"businessChatButtonTitle"];
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      v30 = [v4 PKStringForKey:@"learnMoreBusinessChatButtonTitle"];
    }
    businessChatButtonTitle = v5->_businessChatButtonTitle;
    v5->_businessChatButtonTitle = v30;

    v32 = [v4 PKStringForKey:@"businessChatIntentName"];
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      v34 = [v4 PKStringForKey:@"learnMoreBusinessChatIntentName"];
    }
    businessChatIntentName = v5->_businessChatIntentName;
    v5->_businessChatIntentName = v34;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKDynamicProvisioningPageLearnMoreContent allocWithZone:](PKDynamicProvisioningPageLearnMoreContent, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_buttonTitle copyWithZone:a3];
  buttonTitle = v5->_buttonTitle;
  v5->_buttonTitle = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_buttonURL copyWithZone:a3];
  buttonURL = v5->_buttonURL;
  v5->_buttonURL = (NSURL *)v8;

  uint64_t v10 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_body copyWithZone:a3];
  body = v5->_body;
  v5->_body = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_businessChatButtonTitle copyWithZone:a3];
  businessChatButtonTitle = v5->_businessChatButtonTitle;
  v5->_businessChatButtonTitle = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_businessChatIntentName copyWithZone:a3];
  businessChatIntentName = v5->_businessChatIntentName;
  v5->_businessChatIntentName = (NSString *)v20;

  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSURL)buttonURL
{
  return self->_buttonURL;
}

- (void)setButtonURL:(id)a3
{
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonURL, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end