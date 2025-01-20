@interface ICQConfirmationInfo
+ (BOOL)supportsSecureCoding;
- (ICQConfirmationInfo)initWithCoder:(id)a3;
- (ICQImageURL)iconURL;
- (NSArray)actions;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQConfirmationInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQConfirmationInfo;
  v5 = [(ICQConfirmationInfo *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQConfirmationInfo *)v5 setTitle:v6];
    }
    v7 = [v4 objectForKeyedSubscript:@"subTitle"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 objectForKeyedSubscript:@"subtitle"];
    }
    v10 = v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQConfirmationInfo *)v5 setSubtitle:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"iconURLs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [[ICQImageURL alloc] initFromDictionary:v11];
      [(ICQConfirmationInfo *)v5 setIconURL:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __42__ICQConfirmationInfo_initFromDictionary___block_invoke;
      v17[3] = &unk_1E6A531A8;
      id v18 = v14;
      id v15 = v14;
      [v13 enumerateObjectsUsingBlock:v17];
      [(ICQConfirmationInfo *)v5 setActions:v15];
    }
  }

  return v5;
}

void __42__ICQConfirmationInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[ICQConfirmationActionInfo alloc] initFromDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"title: %@, subtitle: %@, iconURL: %@, actions: %@", self->_title, self->_subtitle, self->_iconURL, self->_actions];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQConfirmationInfo);
  [(ICQConfirmationInfo *)v4 setTitle:self->_title];
  [(ICQConfirmationInfo *)v4 setSubtitle:self->_subtitle];
  [(ICQConfirmationInfo *)v4 setIconURL:self->_iconURL];
  [(ICQConfirmationInfo *)v4 setActions:self->_actions];
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
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
}

- (ICQConfirmationInfo)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQConfirmationInfo;
  id v5 = [(ICQConfirmationInfo *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v15;
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

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
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
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end