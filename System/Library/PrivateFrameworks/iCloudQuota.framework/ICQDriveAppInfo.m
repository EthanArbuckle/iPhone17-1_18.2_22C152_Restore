@interface ICQDriveAppInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)excludeOnClient;
- (ICQDriveAppInfo)initWithCoder:(id)a3;
- (NSArray)bundleIds;
- (NSString)containerID;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setExcludeOnClient:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation ICQDriveAppInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQDriveAppInfo;
  v5 = [(ICQDriveAppInfo *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __38__ICQDriveAppInfo_initFromDictionary___block_invoke;
      v14[3] = &unk_1E6A531A8;
      id v15 = v7;
      id v8 = v7;
      [v6 enumerateObjectsUsingBlock:v14];
      [(ICQDriveAppInfo *)v5 setBundleIds:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQDriveAppInfo *)v5 setLabel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"excludeOnClient"];
    uint64_t v11 = [v10 BOOLValue];

    [(ICQDriveAppInfo *)v5 setExcludeOnClient:v11];
    v12 = [v4 objectForKeyedSubscript:@"containerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQDriveAppInfo *)v5 setContainerID:v12];
    }
  }
  return v5;
}

void __38__ICQDriveAppInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"bundleIds: %@, label: %@, excludeOnClient: %hhd, containerID: %@", self->_bundleIds, self->_label, self->_excludeOnClient, self->_containerID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQDriveAppInfo);
  [(ICQDriveAppInfo *)v4 setBundleIds:self->_bundleIds];
  [(ICQDriveAppInfo *)v4 setLabel:self->_label];
  [(ICQDriveAppInfo *)v4 setExcludeOnClient:self->_excludeOnClient];
  [(ICQDriveAppInfo *)v4 setContainerID:self->_containerID];
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
  [v5 encodeBool:self->_excludeOnClient forKey:@"excludeOnClient"];
  [v5 encodeObject:self->_containerID forKey:@"containerId"];
}

- (ICQDriveAppInfo)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQDriveAppInfo;
  id v5 = [(ICQDriveAppInfo *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bundleIds"];
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v11;

    v5->_excludeOnClient = [v4 decodeBoolForKey:@"excludeOnClient"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerId"];
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v13;
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

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (BOOL)excludeOnClient
{
  return self->_excludeOnClient;
}

- (void)setExcludeOnClient:(BOOL)a3
{
  self->_excludeOnClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end