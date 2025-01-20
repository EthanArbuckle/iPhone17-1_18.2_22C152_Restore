@interface PKAccountPostProvisioningContent
- (NSString)body;
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (NSString)subTitle;
- (NSString)title;
- (PKAccountPostProvisioningContent)initWithDictionary:(id)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountPostProvisioningContent

- (PKAccountPostProvisioningContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPostProvisioningContent;
  v5 = [(PKAccountPostProvisioningContent *)&v19 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    if ([v6 isEqualToString:@"makeDefaultCard"])
    {
      uint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"applePayEducation"])
    {
      uint64_t v7 = 2;
    }
    else
    {
      if (![v6 isEqualToString:@"orderPhysicalCard"])
      {
        v5->_type = 0;
        goto LABEL_9;
      }
      uint64_t v7 = 3;
    }
    v5->_type = v7;
LABEL_9:
    uint64_t v8 = [v4 PKStringForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"subTitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"primaryButtonTitle"];
    primaryButtonTitle = v5->_primaryButtonTitle;
    v5->_primaryButtonTitle = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"secondaryButtonTitle"];
    secondaryButtonTitle = v5->_secondaryButtonTitle;
    v5->_secondaryButtonTitle = (NSString *)v16;
  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end