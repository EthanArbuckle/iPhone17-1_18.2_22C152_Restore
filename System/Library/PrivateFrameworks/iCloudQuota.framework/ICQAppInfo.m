@interface ICQAppInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchLocally;
- (ICQActionInfo)action;
- (ICQAppInfo)initWithCoder:(id)a3;
- (ICQImageURL)iconURL;
- (NSArray)bundleIds;
- (NSString)detailLabel;
- (NSString)detailLabelColor;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailLabelColor:(id)a3;
- (void)setFetchLocally:(BOOL)a3;
- (void)setIconURL:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation ICQAppInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQAppInfo;
  v5 = [(ICQAppInfo *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __33__ICQAppInfo_initFromDictionary___block_invoke;
      v19[3] = &unk_1E6A531A8;
      id v20 = v7;
      id v8 = v7;
      [v6 enumerateObjectsUsingBlock:v19];
      [(ICQAppInfo *)v5 setBundleIds:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQAppInfo *)v5 setLabel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"fetchLocally"];
    uint64_t v11 = [v10 BOOLValue];

    [(ICQAppInfo *)v5 setFetchLocally:v11];
    v12 = [v4 objectForKeyedSubscript:@"iconURLs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [[ICQImageURL alloc] initFromDictionary:v12];
      [(ICQAppInfo *)v5 setIconURL:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"detailLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQAppInfo *)v5 setDetailLabel:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"detailLabelColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQAppInfo *)v5 setDetailLabelColor:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [[ICQActionInfo alloc] initFromDictionary:v16];
      [(ICQAppInfo *)v5 setAction:v17];
    }
  }

  return v5;
}

void __33__ICQAppInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"bundleIds: %@, label: %@, fetchLocally: %hhd, iconURL: %@, detailLabel: %@, detailLabelColor: %@, action: %@", self->_bundleIds, self->_label, self->_fetchLocally, self->_iconURL, self->_detailLabel, self->_detailLabelColor, self->_action];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQAppInfo);
  [(ICQAppInfo *)v4 setBundleIds:self->_bundleIds];
  [(ICQAppInfo *)v4 setLabel:self->_label];
  [(ICQAppInfo *)v4 setFetchLocally:self->_fetchLocally];
  [(ICQAppInfo *)v4 setIconURL:self->_iconURL];
  [(ICQAppInfo *)v4 setDetailLabel:self->_detailLabel];
  [(ICQAppInfo *)v4 setDetailLabelColor:self->_detailLabelColor];
  [(ICQAppInfo *)v4 setAction:self->_action];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIds = self->_bundleIds;
  id v5 = a3;
  [v5 encodeObject:bundleIds forKey:@"bundleIds"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeBool:self->_fetchLocally forKey:@"fetchLocally"];
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
  [v5 encodeObject:self->_detailLabel forKey:@"detailLabel"];
  [v5 encodeObject:self->_detailLabelColor forKey:@"detailLabelColor"];
  [v5 encodeObject:self->_action forKey:@"action"];
}

- (ICQAppInfo)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQAppInfo;
  id v5 = [(ICQAppInfo *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bundleIds"];
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v11;

    v5->_fetchLocally = [v4 decodeBoolForKey:@"fetchLocally"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailLabel"];
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailLabelColor"];
    detailLabelColor = v5->_detailLabelColor;
    v5->_detailLabelColor = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (ICQActionInfo *)v19;
  }
  return v5;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)fetchLocally
{
  return self->_fetchLocally;
}

- (void)setFetchLocally:(BOOL)a3
{
  self->_fetchLocally = a3;
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (NSString)detailLabelColor
{
  return self->_detailLabelColor;
}

- (void)setDetailLabelColor:(id)a3
{
}

- (ICQActionInfo)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_detailLabelColor, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end