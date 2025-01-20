@interface ICQInlineTipAction
+ (BOOL)supportsSecureCoding;
- (ICQInlineTipAction)initWithCoder:(id)a3;
- (ICQLink)link;
- (NSString)actionName;
- (NSString)buttonTitle;
- (NSURL)actionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionName:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setLink:(id)a3;
@end

@implementation ICQInlineTipAction

- (id)description
{
  return (id)[NSString stringWithFormat:@"buttonTitle: %@, actionName: %@, actionURL: %@, link: %@", self->_buttonTitle, self->_actionName, self->_actionURL, self->_link];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQInlineTipAction);
  [(ICQInlineTipAction *)v4 setButtonTitle:self->_buttonTitle];
  [(ICQInlineTipAction *)v4 setActionName:self->_actionName];
  [(ICQInlineTipAction *)v4 setActionURL:self->_actionURL];
  [(ICQInlineTipAction *)v4 setLink:self->_link];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  buttonTitle = self->_buttonTitle;
  id v5 = a3;
  [v5 encodeObject:buttonTitle forKey:@"buttonTitle"];
  [v5 encodeObject:self->_actionName forKey:@"actionName"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeObject:self->_link forKey:@"link"];
}

- (ICQInlineTipAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQInlineTipAction;
  id v5 = [(ICQInlineTipAction *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonTitle"];
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionName"];
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link"];
    link = v5->_link;
    v5->_link = (ICQLink *)v12;
  }
  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end