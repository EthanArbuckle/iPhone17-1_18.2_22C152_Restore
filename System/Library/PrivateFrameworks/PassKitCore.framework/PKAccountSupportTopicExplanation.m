@interface PKAccountSupportTopicExplanation
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionTitle;
- (PKAccountSupportTopicExplanation)initWithDictionary:(id)a3;
- (PKAccountSupportTopicExplanationContent)content;
- (PKAccountSupportTopicExplanationLink)link;
@end

@implementation PKAccountSupportTopicExplanation

- (PKAccountSupportTopicExplanation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountSupportTopicExplanation;
  v5 = [(PKAccountSupportTopicExplanation *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"headerTitle"];
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"headerSubtitle"];
    headerSubtitle = v5->_headerSubtitle;
    v5->_headerSubtitle = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"primaryActionTitle"];
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"secondaryActionTitle"];
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v12;

    v14 = [[PKAccountSupportTopicExplanationContent alloc] initWithDictionary:v4];
    content = v5->_content;
    v5->_content = v14;

    v16 = [[PKAccountSupportTopicExplanationLink alloc] initWithDictionary:v4];
    link = v5->_link;
    v5->_link = v16;
  }
  return v5;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (PKAccountSupportTopicExplanationContent)content
{
  return self->_content;
}

- (PKAccountSupportTopicExplanationLink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end