@interface ICQConfirmationActionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefault;
- (BOOL)isDestructive;
- (ICQConfirmationActionInfo)initWithCoder:(id)a3;
- (ICQLink)icqLink;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)actionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setIcqLink:(id)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQConfirmationActionInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICQConfirmationActionInfo;
  v5 = [(ICQConfirmationActionInfo *)&v23 init];
  if (!v5) {
    goto LABEL_23;
  }
  v6 = [v4 objectForKeyedSubscript:@"isDefault"];
  uint64_t v7 = [v6 BOOLValue];

  [(ICQConfirmationActionInfo *)v5 setIsDefault:v7];
  v8 = [v4 objectForKeyedSubscript:@"isDestructive"];
  uint64_t v9 = [v8 BOOLValue];

  [(ICQConfirmationActionInfo *)v5 setIsDestructive:v9];
  v10 = [v4 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQConfirmationActionInfo *)v5 setTitle:v10];
  }
  v11 = [v4 objectForKeyedSubscript:@"subTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQConfirmationActionInfo *)v5 setSubtitle:v11];
  }
  v12 = [v4 objectForKeyedSubscript:@"actionURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    if (v13) {
      [(ICQConfirmationActionInfo *)v5 setActionURL:v13];
    }
  }
  v14 = [v4 objectForKeyedSubscript:@"actionType"];
  v15 = [v4 objectForKeyedSubscript:@"actionParameters"];
  if (v14)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v15)
    {
      v17 = [v15 objectForKeyedSubscript:@"purchaseAttribution"];
      v18 = [v15 objectForKeyedSubscript:@"route"];
      if (v17) {
        [v16 setObject:v17 forKeyedSubscript:@"purchaseAttribution"];
      }
      if (v18) {
        [v16 setObject:v18 forKeyedSubscript:@"route"];
      }
    }
    if (v12)
    {
      [v16 setObject:v12 forKeyedSubscript:@"URL"];
      [v16 setObject:v12 forKeyedSubscript:@"openURL"];
    }
    v19 = [[ICQLink alloc] initWithText:v10 action:_ICQActionForServerActionString(v14) parameters:v16];

    [(ICQConfirmationActionInfo *)v5 setIcqLink:v19];
  }
  else
  {
    _ICQGetLogSystem();
    v19 = (ICQLink *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D5851000, &v19->super, OS_LOG_TYPE_DEFAULT, "Parsing manage storage confirmation action, no action type found", v22, 2u);
    }
  }

  if (!v14) {
    v20 = 0;
  }
  else {
LABEL_23:
  }
    v20 = v5;

  return v20;
}

- (id)description
{
  if (self->_isDestructive) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"title: %@, subtitle: %@, actionURL: %@, icqLink: %@, isDefault: %hhd, isDestructive: %@", *(_OWORD *)&self->_title, self->_actionURL, self->_icqLink, self->_isDefault, v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQConfirmationActionInfo);
  [(ICQConfirmationActionInfo *)v4 setTitle:self->_title];
  [(ICQConfirmationActionInfo *)v4 setSubtitle:self->_subtitle];
  [(ICQConfirmationActionInfo *)v4 setIcqLink:self->_icqLink];
  [(ICQConfirmationActionInfo *)v4 setActionURL:self->_actionURL];
  [(ICQConfirmationActionInfo *)v4 setIsDefault:self->_isDefault];
  [(ICQConfirmationActionInfo *)v4 setIsDestructive:self->_isDestructive];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subTitle"];
  [v5 encodeObject:self->_icqLink forKey:@"icqLink"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeBool:self->_isDefault forKey:@"isDefault"];
  [v5 encodeBool:self->_isDestructive forKey:@"isDestructive"];
}

- (ICQConfirmationActionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQConfirmationActionInfo;
  id v5 = [(ICQConfirmationActionInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icqLink"];
    icqLink = v5->_icqLink;
    v5->_icqLink = (ICQLink *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v12;

    v5->_isDefault = [v4 decodeBoolForKey:@"isDefault"];
    v5->_isDestructive = [v4 decodeBoolForKey:@"isDestructive"];
  }

  return v5;
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

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end