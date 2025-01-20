@interface ICQCloudStorageApps
+ (BOOL)supportsSecureCoding;
- (ICQCloudStorageApps)initWithCoder:(id)a3;
- (NSArray)apps;
- (NSString)genericErrorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
- (void)setGenericErrorMessage:(id)a3;
@end

@implementation ICQCloudStorageApps

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQCloudStorageApps;
  v5 = [(ICQCloudStorageApps *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"apps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__ICQCloudStorageApps_initFromDictionary___block_invoke;
      v11[3] = &unk_1E6A531A8;
      id v12 = v7;
      id v8 = v7;
      [v6 enumerateObjectsUsingBlock:v11];
      [(ICQCloudStorageApps *)v5 setApps:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"genericErrorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQCloudStorageApps *)v5 setGenericErrorMessage:v9];
    }
  }
  return v5;
}

void __42__ICQCloudStorageApps_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[ICQAppInfo alloc] initFromDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"apps: %@, genericErrorMessage: %@", self->_apps, self->_genericErrorMessage];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQCloudStorageApps);
  [(ICQCloudStorageApps *)v4 setApps:self->_apps];
  [(ICQCloudStorageApps *)v4 setGenericErrorMessage:self->_genericErrorMessage];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  apps = self->_apps;
  id v5 = a3;
  [v5 encodeObject:apps forKey:@"apps"];
  [v5 encodeObject:self->_genericErrorMessage forKey:@"genericErrorMessage"];
}

- (ICQCloudStorageApps)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQCloudStorageApps;
  id v5 = [(ICQCloudStorageApps *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"apps"];
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genericErrorMessage"];
    genericErrorMessage = v5->_genericErrorMessage;
    v5->_genericErrorMessage = (NSString *)v11;
  }
  return v5;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (NSString)genericErrorMessage
{
  return self->_genericErrorMessage;
}

- (void)setGenericErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericErrorMessage, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end