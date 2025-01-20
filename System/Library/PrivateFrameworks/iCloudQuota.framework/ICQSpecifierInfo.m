@interface ICQSpecifierInfo
+ (BOOL)supportsSecureCoding;
- (ICQImageURL)iconURL;
- (ICQLink)icqLink;
- (ICQSpecifierInfo)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSString)identifier;
- (NSString)subTitle;
- (NSString)title;
- (NSString)type;
- (NSURL)actionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setActions:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIcqLink:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation ICQSpecifierInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"ID: %@, Type: %@, title: %@, subTitle: %@, iconURL: %@, actionURL: %@, icqLink: %@, actions: %@", self->_identifier, self->_type, self->_title, self->_subTitle, self->_iconURL, self->_actionURL, self->_icqLink, self->_actions];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQSpecifierInfo);
  [(ICQSpecifierInfo *)v4 setIdentifier:self->_identifier];
  [(ICQSpecifierInfo *)v4 setType:self->_type];
  [(ICQSpecifierInfo *)v4 setTitle:self->_title];
  [(ICQSpecifierInfo *)v4 setSubTitle:self->_subTitle];
  [(ICQSpecifierInfo *)v4 setIconURL:self->_iconURL];
  [(ICQSpecifierInfo *)v4 setActionURL:self->_actionURL];
  [(ICQSpecifierInfo *)v4 setIcqLink:self->_icqLink];
  [(ICQSpecifierInfo *)v4 setActions:self->_actions];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subTitle forKey:@"subTitle"];
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeObject:self->_icqLink forKey:@"icqLink"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
}

- (ICQSpecifierInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICQSpecifierInfo;
  id v5 = [(ICQSpecifierInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icqLink"];
    icqLink = v5->_icqLink;
    v5->_icqLink = (ICQLink *)v18;

    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v20;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end