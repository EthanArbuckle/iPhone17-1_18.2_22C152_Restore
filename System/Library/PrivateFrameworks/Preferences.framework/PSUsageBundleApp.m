@interface PSUsageBundleApp
+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4;
+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4 andCategories:(id)a5;
- (BOOL)isDeletionRestricted;
- (NSArray)categories;
- (NSString)bundleIdentifier;
- (NSString)name;
- (PSStorageReporting)usageBundleStorageReporter;
- (float)totalSize;
- (id)description;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategories:(id)a3;
- (void)setDeletionRestricted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTotalSize:(float)a3;
- (void)setUsageBundleStorageReporter:(id)a3;
@end

@implementation PSUsageBundleApp

+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4
{
  return (id)objc_msgSend(a1, "usageBundleAppForBundleWithIdentifier:withTotalSize:andCategories:", a3, 0);
}

+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4 andCategories:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = objc_alloc_init(PSUsageBundleApp);
  [(PSUsageBundleApp *)v9 setBundleIdentifier:v7];
  *(float *)&double v10 = a4;
  [(PSUsageBundleApp *)v9 setTotalSize:v10];
  [(PSUsageBundleApp *)v9 setCategories:v8];

  v11 = (void *)MEMORY[0x1E4F223B8];
  v12 = [(PSUsageBundleApp *)v9 bundleIdentifier];
  v13 = [v11 applicationProxyForIdentifier:v12];
  v14 = [v13 localizedName];

  if (!v14)
  {
    if ([v7 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      PS_LocalizedString(@"CONTACTS");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = v7;
    }
    v14 = v15;
  }
  [(PSUsageBundleApp *)v9 setName:v14];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PSUsageBundleApp *)self name];
  v6 = [(PSUsageBundleApp *)self bundleIdentifier];
  id v7 = [(PSUsageBundleApp *)self categories];
  id v8 = [v3 stringWithFormat:@"<%@: %p %@ (%@): %@>", v4, self, v5, v6, v7];

  return v8;
}

- (void)setUsageBundleStorageReporter:(id)a3
{
  id v8 = a3;
  id v4 = [(PSUsageBundleApp *)self usageBundleStorageReporter];

  v5 = v8;
  if (v4 != v8)
  {
    v6 = +[PSWeakReference weakReferenceWithObject:v8];
    storageReporterReference = self->_storageReporterReference;
    self->_storageReporterReference = v6;

    v5 = v8;
  }
}

- (PSStorageReporting)usageBundleStorageReporter
{
  return (PSStorageReporting *)[(PSWeakReference *)self->_storageReporterReference object];
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

- (float)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(float)a3
{
  self->_totalSize = a3;
}

- (BOOL)isDeletionRestricted
{
  return self->_deletionRestricted;
}

- (void)setDeletionRestricted:(BOOL)a3
{
  self->_deletionRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storageReporterReference, 0);
}

@end