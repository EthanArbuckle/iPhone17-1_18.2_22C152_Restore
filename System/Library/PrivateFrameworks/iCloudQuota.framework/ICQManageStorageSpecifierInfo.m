@interface ICQManageStorageSpecifierInfo
+ (BOOL)supportsSecureCoding;
- (ICQImageURL)iconURL;
- (ICQManageStorageSpecifierInfo)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation ICQManageStorageSpecifierInfo

- (id)initFromDictionary:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQManageStorageSpecifierInfo;
  v5 = [(ICQManageStorageSpecifierInfo *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQManageStorageSpecifierInfo *)v5 setType:v6];
    }
    v7 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQManageStorageSpecifierInfo *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"subTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQManageStorageSpecifierInfo *)v5 setSubtitle:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"iconURLs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [[ICQImageURL alloc] initFromDictionary:v9];
      [(ICQManageStorageSpecifierInfo *)v5 setIconURL:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__ICQManageStorageSpecifierInfo_initFromDictionary___block_invoke;
      v20[3] = &unk_1E6A531A8;
      id v21 = v12;
      id v13 = v12;
      [v11 enumerateObjectsUsingBlock:v20];
      [(ICQManageStorageSpecifierInfo *)v5 setActions:v13];
    }
    v14 = [(ICQManageStorageSpecifierInfo *)v5 actions];
    uint64_t v15 = [v14 count];

    if (!v15)
    {
      id v16 = [[ICQActionInfo alloc] initFromDictionary:v4];
      v17 = v16;
      if (v16)
      {
        v23[0] = v16;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
        [(ICQManageStorageSpecifierInfo *)v5 setActions:v18];
      }
    }
  }
  return v5;
}

void __52__ICQManageStorageSpecifierInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [[ICQActionInfo alloc] initFromDictionary:v4];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"type: %@, title: %@, subtitle: %@, iconURL: %@, actions: %@", self->_type, self->_title, self->_subtitle, self->_iconURL, self->_actions];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQManageStorageSpecifierInfo);
  [(ICQManageStorageSpecifierInfo *)v4 setType:self->_type];
  [(ICQManageStorageSpecifierInfo *)v4 setTitle:self->_title];
  [(ICQManageStorageSpecifierInfo *)v4 setSubtitle:self->_subtitle];
  [(ICQManageStorageSpecifierInfo *)v4 setIconURL:self->_iconURL];
  [(ICQManageStorageSpecifierInfo *)v4 setActions:self->_actions];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subTitle"];
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
}

- (ICQManageStorageSpecifierInfo)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICQManageStorageSpecifierInfo;
  id v5 = [(ICQManageStorageSpecifierInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    id v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;
  }
  return v5;
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
  objc_storeStrong((id *)&self->_type, 0);
}

@end