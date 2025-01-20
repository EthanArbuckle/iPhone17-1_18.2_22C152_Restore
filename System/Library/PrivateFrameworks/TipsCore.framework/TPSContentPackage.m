@interface TPSContentPackage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTipContent;
- (NSArray)collectionSections;
- (NSArray)orderedCollectionIdentifiers;
- (NSArray)orderedCollections;
- (NSArray)savedTipIdentifiers;
- (NSArray)userGuides;
- (NSDictionary)collectionMap;
- (NSDictionary)collectionSectionMap;
- (NSDictionary)tipMap;
- (NSString)language;
- (TPSAssetSizes)assetSizes;
- (TPSCollection)featuredCollection;
- (TPSContentPackage)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetSizes:(id)a3;
- (void)setCollectionMap:(id)a3;
- (void)setCollectionSectionMap:(id)a3;
- (void)setCollectionSections:(id)a3;
- (void)setFeaturedCollection:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrderedCollectionIdentifiers:(id)a3;
- (void)setSavedTipIdentifiers:(id)a3;
- (void)setTipMap:(id)a3;
- (void)setUserGuides:(id)a3;
- (void)updateOrderedCollectionIdentifiers;
@end

@implementation TPSContentPackage

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TPSContentPackage *)self orderedCollectionIdentifiers];
  [v4 encodeObject:v5 forKey:@"orderedCollectionIdentifiers"];

  v6 = [(TPSContentPackage *)self language];
  [v4 encodeObject:v6 forKey:@"language"];

  v7 = [(TPSContentPackage *)self collectionMap];
  [v4 encodeObject:v7 forKey:@"collectionMap"];

  v8 = [(TPSContentPackage *)self tipMap];
  [v4 encodeObject:v8 forKey:@"tipMap"];

  v9 = [(TPSContentPackage *)self collectionSections];
  [v4 encodeObject:v9 forKey:@"collectionSections"];

  v10 = [(TPSContentPackage *)self userGuides];
  [v4 encodeObject:v10 forKey:@"userGuides"];

  v11 = [(TPSContentPackage *)self collectionSectionMap];
  [v4 encodeObject:v11 forKey:@"collectionSectionMap"];

  v12 = [(TPSContentPackage *)self assetSizes];
  [v4 encodeObject:v12 forKey:@"assetSizes"];

  id v13 = [(TPSContentPackage *)self featuredCollection];
  [v4 encodeObject:v13 forKey:@"featuredCollection"];
}

- (NSArray)userGuides
{
  return self->_userGuides;
}

- (NSDictionary)tipMap
{
  return self->_tipMap;
}

- (TPSCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (NSArray)savedTipIdentifiers
{
  return self->_savedTipIdentifiers;
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)collectionSections
{
  return self->_collectionSections;
}

- (NSDictionary)collectionSectionMap
{
  return self->_collectionSectionMap;
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (NSArray)orderedCollections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(TPSContentPackage *)self orderedCollectionIdentifiers];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(TPSContentPackage *)self collectionMap];
        v12 = [v11 objectForKeyedSubscript:v10];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];
  return (NSArray *)v13;
}

- (NSDictionary)collectionMap
{
  return self->_collectionMap;
}

- (NSArray)orderedCollectionIdentifiers
{
  return self->_orderedCollectionIdentifiers;
}

- (void)setFeaturedCollection:(id)a3
{
  id v5 = (TPSCollection *)a3;
  p_featuredCollection = &self->_featuredCollection;
  if (self->_featuredCollection != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_featuredCollection, a3);
    p_featuredCollection = (TPSCollection **)[(TPSContentPackage *)self updateOrderedCollectionIdentifiers];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_featuredCollection, v5);
}

- (void)setOrderedCollectionIdentifiers:(id)a3
{
  id v5 = (NSArray *)a3;
  p_orderedCollectionIdentifiers = &self->_orderedCollectionIdentifiers;
  if (self->_orderedCollectionIdentifiers != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_orderedCollectionIdentifiers, a3);
    p_orderedCollectionIdentifiers = (NSArray **)[(TPSContentPackage *)self updateOrderedCollectionIdentifiers];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_orderedCollectionIdentifiers, v5);
}

- (void)updateOrderedCollectionIdentifiers
{
  id v6 = (id)[(NSArray *)self->_orderedCollectionIdentifiers mutableCopy];
  v3 = [(TPSDocument *)self->_featuredCollection identifier];
  [v6 removeObject:v3];

  id v4 = (NSArray *)[v6 copy];
  orderedCollectionIdentifiers = self->_orderedCollectionIdentifiers;
  self->_orderedCollectionIdentifiers = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserGuides:(id)a3
{
}

- (void)setTipMap:(id)a3
{
}

- (void)setSavedTipIdentifiers:(id)a3
{
}

- (void)setLanguage:(id)a3
{
}

- (void)setCollectionSections:(id)a3
{
}

- (void)setCollectionSectionMap:(id)a3
{
}

- (void)setCollectionMap:(id)a3
{
}

- (void)setAssetSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_tipMap, 0);
  objc_storeStrong((id *)&self->_collectionMap, 0);
  objc_storeStrong((id *)&self->_collectionSectionMap, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);
  objc_storeStrong((id *)&self->_collectionSections, 0);
  objc_storeStrong((id *)&self->_savedTipIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedCollectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (TPSContentPackage)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TPSContentPackage;
  id v5 = [(TPSContentPackage *)&v49 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"orderedCollectionIdentifiers"];
    orderedCollectionIdentifiers = v5->_orderedCollectionIdentifiers;
    v5->_orderedCollectionIdentifiers = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    long long v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"collectionMap"];
    collectionMap = v5->_collectionMap;
    v5->_collectionMap = (NSDictionary *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"collectionSections"];
    collectionSections = v5->_collectionSections;
    v5->_collectionSections = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"userGuides"];
    userGuides = v5->_userGuides;
    v5->_userGuides = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"collectionSectionMap"];
    collectionSectionMap = v5->_collectionSectionMap;
    v5->_collectionSectionMap = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    v41 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"tipMap"];
    tipMap = v5->_tipMap;
    v5->_tipMap = (NSDictionary *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSizes"];
    assetSizes = v5->_assetSizes;
    v5->_assetSizes = (TPSAssetSizes *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featuredCollection"];
    featuredCollection = v5->_featuredCollection;
    v5->_featuredCollection = (TPSCollection *)v46;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(TPSContentPackage *)self orderedCollectionIdentifiers];
  [v4 setOrderedCollectionIdentifiers:v5];

  id v6 = [(TPSContentPackage *)self language];
  [v4 setLanguage:v6];

  uint64_t v7 = [(TPSContentPackage *)self collectionMap];
  [v4 setCollectionMap:v7];

  uint64_t v8 = [(TPSContentPackage *)self collectionSections];
  [v4 setCollectionSections:v8];

  v9 = [(TPSContentPackage *)self userGuides];
  [v4 setUserGuides:v9];

  uint64_t v10 = [(TPSContentPackage *)self collectionSectionMap];
  [v4 setCollectionSectionMap:v10];

  v11 = [(TPSContentPackage *)self tipMap];
  [v4 setTipMap:v11];

  uint64_t v12 = [(TPSContentPackage *)self assetSizes];
  [v4 setAssetSizes:v12];

  id v13 = [(TPSContentPackage *)self featuredCollection];
  [v4 setFeaturedCollection:v13];

  return v4;
}

- (BOOL)hasTipContent
{
  v3 = [(TPSContentPackage *)self collectionMap];
  if ([v3 count])
  {
    id v4 = [(TPSContentPackage *)self tipMap];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v25.receiver = self;
  v25.super_class = (Class)TPSContentPackage;
  id v4 = [(TPSContentPackage *)&v25 debugDescription];
  BOOL v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSContentPackage *)self orderedCollectionIdentifiers];

  if (v6)
  {
    uint64_t v7 = [(TPSContentPackage *)self orderedCollectionIdentifiers];
    [v5 appendFormat:@"\n  %@ = %@\n", @"orderedCollectionIdentifiers", v7];
  }
  uint64_t v8 = [(TPSContentPackage *)self language];

  if (v8)
  {
    v9 = [(TPSContentPackage *)self language];
    [v5 appendFormat:@"  %@ = %@\n", @"language", v9];
  }
  uint64_t v10 = [(TPSContentPackage *)self collectionMap];

  if (v10)
  {
    v11 = [(TPSContentPackage *)self collectionMap];
    [v5 appendFormat:@"  %@ = %@\n", @"collectionMap", v11];
  }
  uint64_t v12 = [(TPSContentPackage *)self collectionSections];

  if (v12)
  {
    id v13 = [(TPSContentPackage *)self collectionSections];
    [v5 appendFormat:@"  %@ = %@\n", @"collectionSections", v13];
  }
  v14 = [(TPSContentPackage *)self collectionSectionMap];

  if (v14)
  {
    uint64_t v15 = [(TPSContentPackage *)self collectionSectionMap];
    [v5 appendFormat:@"  %@ = %@\n", @"collectionSectionMap", v15];
  }
  uint64_t v16 = [(TPSContentPackage *)self userGuides];

  if (v16)
  {
    uint64_t v17 = [(TPSContentPackage *)self userGuides];
    [v5 appendFormat:@"  %@ = %@\n", @"userGuides", v17];
  }
  long long v18 = [(TPSContentPackage *)self tipMap];

  if (v18)
  {
    uint64_t v19 = [(TPSContentPackage *)self tipMap];
    [v5 appendFormat:@"  %@ = %@\n", @"tipMap", v19];
  }
  uint64_t v20 = [(TPSContentPackage *)self assetSizes];

  if (v20)
  {
    v21 = [(TPSContentPackage *)self assetSizes];
    [v5 appendFormat:@"  %@ = %@", @"assetSizes", v21];
  }
  uint64_t v22 = [(TPSContentPackage *)self featuredCollection];

  if (v22)
  {
    v23 = [(TPSContentPackage *)self featuredCollection];
    [v5 appendFormat:@"  %@ = %@", @"featuredCollection", v23];
  }
  return v5;
}

@end