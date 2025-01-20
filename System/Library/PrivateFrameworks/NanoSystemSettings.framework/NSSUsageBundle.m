@interface NSSUsageBundle
+ (BOOL)supportsSecureCoding;
- (BOOL)isPurgeable;
- (NSArray)categories;
- (NSSUsageBundle)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)name;
- (id)description;
- (unint64_t)totalSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategories:(id)a3;
- (void)setName:(id)a3;
- (void)setPurgeable:(BOOL)a3;
- (void)setTotalSize:(unint64_t)a3;
@end

@implementation NSSUsageBundle

- (unint64_t)totalSize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_categories;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "size", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSSUsageBundle: %p; name: \"%@\", bundleIdentifier: \"%@\", categories: \"%@\", purgeable: \"%d\">",
               self,
               self->_name,
               self->_bundleIdentifier,
               self->_categories,
               self->_purgeable);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_categories forKey:@"categories"];
  [v5 encodeBool:self->_purgeable forKey:@"purgeable"];
}

- (NSSUsageBundle)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NSSUsageBundle;
  id v5 = [(NSSUsageBundle *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    long long v10 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    long long v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v13;

    v5->_purgeable = [v4 decodeBoolForKey:@"purgeable"];
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (void)setPurgeable:(BOOL)a3
{
  self->_purgeable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end