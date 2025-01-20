@interface ICQiCloudDetailsPageInfo
+ (BOOL)supportsSecureCoding;
- (ICQLink)icqLink;
- (ICQiCloudDetailsPageInfo)initWithCoder:(id)a3;
- (NSString)actionType;
- (NSURL)actionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(id)a3;
- (void)setActionURL:(id)a3;
@end

@implementation ICQiCloudDetailsPageInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"actionType: %@, actionURL: %@", self->_actionType, self->_actionURL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQiCloudDetailsPageInfo);
  [(ICQiCloudDetailsPageInfo *)v4 setActionType:self->_actionType];
  [(ICQiCloudDetailsPageInfo *)v4 setActionURL:self->_actionURL];
  return v4;
}

- (ICQLink)icqLink
{
  v3 = [ICQLink alloc];
  v4 = [(ICQiCloudDetailsPageInfo *)self actionType];
  v5 = [(ICQiCloudDetailsPageInfo *)self actionURL];
  v6 = [(ICQLink *)v3 initWithActionString:v4 url:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  actionType = self->_actionType;
  id v5 = a3;
  [v5 encodeObject:actionType forKey:@"actionType"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
}

- (ICQiCloudDetailsPageInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQiCloudDetailsPageInfo;
  id v5 = [(ICQiCloudDetailsPageInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionType"];
    actionType = v5->_actionType;
    v5->_actionType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;
  }
  return v5;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end