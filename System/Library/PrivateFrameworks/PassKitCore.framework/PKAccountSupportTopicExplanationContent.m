@interface PKAccountSupportTopicExplanationContent
- (NSString)subtitle;
- (NSString)systemImageName;
- (NSString)title;
- (PKAccountSupportTopicExplanationContent)initWithDictionary:(id)a3;
@end

@implementation PKAccountSupportTopicExplanationContent

- (PKAccountSupportTopicExplanationContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountSupportTopicExplanationContent;
  v5 = [(PKAccountSupportTopicExplanationContent *)&v14 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 PKStringForKey:@"contentTitle"];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"contentBody"];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  uint64_t v10 = [v4 PKStringForKey:@"contentSystemImageName"];
  systemImageName = v5->_systemImageName;
  v5->_systemImageName = (NSString *)v10;

  if (v5->_title || v5->_subtitle) {
LABEL_4:
  }
    v12 = v5;
  else {
    v12 = 0;
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end