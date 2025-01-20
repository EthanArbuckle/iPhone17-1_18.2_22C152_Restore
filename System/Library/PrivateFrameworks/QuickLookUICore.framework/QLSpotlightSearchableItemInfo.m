@interface QLSpotlightSearchableItemInfo
+ (BOOL)supportsSecureCoding;
+ (id)spotlightInfoWithUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5;
- (NSString)applicationBundleIdentifier;
- (NSString)queryString;
- (NSString)searchableItemUniqueIdentifier;
- (QLSpotlightSearchableItemInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setSearchableItemUniqueIdentifier:(id)a3;
@end

@implementation QLSpotlightSearchableItemInfo

+ (id)spotlightInfoWithUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setSearchableItemUniqueIdentifier:v9];

  [v10 setQueryString:v8];
  [v10 setApplicationBundleIdentifier:v7];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  searchableItemUniqueIdentifier = self->_searchableItemUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:searchableItemUniqueIdentifier forKey:@"searchableItemUniqueIdentifier"];
  [v5 encodeObject:self->_queryString forKey:@"queryString"];
  [v5 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
}

- (QLSpotlightSearchableItemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLSpotlightSearchableItemInfo;
  id v5 = [(QLSpotlightSearchableItemInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemUniqueIdentifier"];
    searchableItemUniqueIdentifier = v5->_searchableItemUniqueIdentifier;
    v5->_searchableItemUniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryString"];
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;
  }
  return v5;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (NSString)searchableItemUniqueIdentifier
{
  return self->_searchableItemUniqueIdentifier;
}

- (void)setSearchableItemUniqueIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end