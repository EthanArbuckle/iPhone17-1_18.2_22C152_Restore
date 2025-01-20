@interface ICQAppsSyncingToDrive
+ (BOOL)supportsSecureCoding;
- (ICQAppsSyncingToDrive)initWithCoder:(id)a3;
- (NSArray)apps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
@end

@implementation ICQAppsSyncingToDrive

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQAppsSyncingToDrive;
  v5 = [(ICQAppsSyncingToDrive *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"apps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44__ICQAppsSyncingToDrive_initFromDictionary___block_invoke;
      v10[3] = &unk_1E6A531A8;
      id v11 = v7;
      id v8 = v7;
      [v6 enumerateObjectsUsingBlock:v10];
      [(ICQAppsSyncingToDrive *)v5 setApps:v8];
    }
  }

  return v5;
}

void __44__ICQAppsSyncingToDrive_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[ICQDriveAppInfo alloc] initFromDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"apps: %@", self->_apps];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQAppsSyncingToDrive);
  [(ICQAppsSyncingToDrive *)v4 setApps:self->_apps];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICQAppsSyncingToDrive)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQAppsSyncingToDrive;
  id v5 = [(ICQAppsSyncingToDrive *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"apps"];
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;
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

- (void).cxx_destruct
{
}

@end