@interface ICQManageStoragePageInfo
+ (BOOL)supportsSecureCoding;
- (ICQManageStoragePageInfo)initWithCoder:(id)a3;
- (NSArray)specifiers;
- (NSArray)tips;
- (NSString)storageGraphFooterText;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStorageGraphFooterText:(id)a3;
- (void)setTips:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQManageStoragePageInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQManageStoragePageInfo;
  v5 = [(ICQManageStoragePageInfo *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"storageGraphFooterText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_storageGraphFooterText, v6);
    }
    v7 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_title, v7);
    }
    v8 = [v4 objectForKeyedSubscript:@"specifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke;
      v20[3] = &unk_1E6A531A8;
      id v21 = v9;
      id v10 = v9;
      [v8 enumerateObjectsUsingBlock:v20];
      [(ICQManageStoragePageInfo *)v5 setSpecifiers:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"tips"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke_2;
      v18 = &unk_1E6A531A8;
      id v19 = v12;
      id v13 = v12;
      [v11 enumerateObjectsUsingBlock:&v15];
      -[ICQManageStoragePageInfo setTips:](v5, "setTips:", v13, v15, v16, v17, v18);
    }
  }

  return v5;
}

void __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[ICQManageStorageSpecifierInfo alloc] initFromDictionary:v5];
    [v3 addObject:v4];
  }
}

void __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[ICQTipInfo alloc] initFromDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"title: %@, thermometer footer text: %@, specifiers: %@, tips: %@", self->_title, self->_storageGraphFooterText, self->_specifiers, self->_tips];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQManageStoragePageInfo);
  [(ICQManageStoragePageInfo *)v4 setStorageGraphFooterText:self->_storageGraphFooterText];
  [(ICQManageStoragePageInfo *)v4 setTitle:self->_title];
  [(ICQManageStoragePageInfo *)v4 setSpecifiers:self->_specifiers];
  [(ICQManageStoragePageInfo *)v4 setTips:self->_tips];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  storageGraphFooterText = self->_storageGraphFooterText;
  id v5 = a3;
  [v5 encodeObject:storageGraphFooterText forKey:@"thermometerFooterText"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_specifiers forKey:@"specifiers"];
  [v5 encodeObject:self->_tips forKey:@"tips"];
}

- (ICQManageStoragePageInfo)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQManageStoragePageInfo;
  id v5 = [(ICQManageStoragePageInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thermometerFooterText"];
    storageGraphFooterText = v5->_storageGraphFooterText;
    v5->_storageGraphFooterText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"specifiers"];
    specifiers = v5->_specifiers;
    v5->_specifiers = (NSArray *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v17 = [v15 setWithArray:v16];

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"tips"];
    tips = v5->_tips;
    v5->_tips = (NSArray *)v18;
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

- (NSString)storageGraphFooterText
{
  return self->_storageGraphFooterText;
}

- (void)setStorageGraphFooterText:(id)a3
{
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_storageGraphFooterText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end