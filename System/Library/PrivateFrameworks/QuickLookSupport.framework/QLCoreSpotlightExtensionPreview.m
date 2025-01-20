@interface QLCoreSpotlightExtensionPreview
+ (BOOL)supportsSecureCoding;
- (NSString)query;
- (NSString)searchableItemTitle;
- (NSString)searchableItemUniqueIdentifier;
- (NSURL)searchableItemURL;
- (QLCoreSpotlightExtensionPreview)initWithCoder:(id)a3;
- (QLCoreSpotlightExtensionPreview)initWithQuery:(id)a3 searchableItemURL:(id)a4 searchableItemTitle:(id)a5 searchableItemUUID:(id)a6 description:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchableItemTitle:(id)a3;
- (void)setSearchableItemURL:(id)a3;
- (void)setSearchableItemUniqueIdentifier:(id)a3;
@end

@implementation QLCoreSpotlightExtensionPreview

- (QLCoreSpotlightExtensionPreview)initWithQuery:(id)a3 searchableItemURL:(id)a4 searchableItemTitle:(id)a5 searchableItemUUID:(id)a6 description:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLCoreSpotlightExtensionPreview;
  v16 = [(QLExtensionPreview *)&v19 initWithDescription:a7];
  v17 = v16;
  if (v16)
  {
    [(QLCoreSpotlightExtensionPreview *)v16 setQuery:v12];
    [(QLCoreSpotlightExtensionPreview *)v17 setSearchableItemURL:v13];
    [(QLCoreSpotlightExtensionPreview *)v17 setSearchableItemTitle:v14];
    [(QLCoreSpotlightExtensionPreview *)v17 setSearchableItemUniqueIdentifier:v15];
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)QLCoreSpotlightExtensionPreview;
  id v4 = a3;
  [(QLExtensionPreview *)&v9 encodeWithCoder:v4];
  v5 = [(QLCoreSpotlightExtensionPreview *)self searchableItemUniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"searchableItemUniqueIdentifier"];

  v6 = [(QLCoreSpotlightExtensionPreview *)self query];
  [v4 encodeObject:v6 forKey:@"query"];

  v7 = [(QLCoreSpotlightExtensionPreview *)self searchableItemTitle];
  [v4 encodeObject:v7 forKey:@"searchableItemTitle"];

  v8 = [(QLCoreSpotlightExtensionPreview *)self searchableItemURL];
  [v4 encodeObject:v8 forKey:@"searchableItemURL"];
}

- (QLCoreSpotlightExtensionPreview)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLCoreSpotlightExtensionPreview;
  v5 = [(QLExtensionPreview *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemUniqueIdentifier"];
    [(QLCoreSpotlightExtensionPreview *)v5 setSearchableItemUniqueIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    [(QLCoreSpotlightExtensionPreview *)v5 setQuery:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemTitle"];
    [(QLCoreSpotlightExtensionPreview *)v5 setSearchableItemTitle:v8];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemURL"];
    [(QLCoreSpotlightExtensionPreview *)v5 setSearchableItemURL:v9];
  }
  return v5;
}

- (NSString)searchableItemUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchableItemUniqueIdentifier:(id)a3
{
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQuery:(id)a3
{
}

- (NSString)searchableItemTitle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchableItemTitle:(id)a3
{
}

- (NSURL)searchableItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchableItemURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItemURL, 0);
  objc_storeStrong((id *)&self->_searchableItemTitle, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
}

@end