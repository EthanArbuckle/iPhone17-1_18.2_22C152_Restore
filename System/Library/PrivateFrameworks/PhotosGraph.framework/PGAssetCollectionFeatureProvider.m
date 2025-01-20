@interface PGAssetCollectionFeatureProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)featureSpecifications;
- (PGAssetCollectionFeatureProvider)initWithCoder:(id)a3;
- (PGAssetCollectionFeatureProvider)initWithFeatureSpecifications:(id)a3;
- (id)description;
- (id)featureInstancesWithMomentNode:(id)a3 atMomentIngest:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PGAssetCollectionFeatureProvider

- (void).cxx_destruct
{
}

- (NSArray)featureSpecifications
{
  return self->_featureSpecifications;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGAssetCollectionFeatureProvider *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_featureSpecifications];
      v6 = (void *)MEMORY[0x1E4F1CAD0];
      v7 = [(PGAssetCollectionFeatureProvider *)v4 featureSpecifications];
      v8 = [v6 setWithArray:v7];

      char v9 = [v5 isEqualToSet:v8];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)PGAssetCollectionFeatureProvider;
  v4 = [(PGAssetCollectionFeatureProvider *)&v8 description];
  v5 = [(NSArray *)self->_featureSpecifications description];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PGAssetCollectionFeatureProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"featureSpecifications"];

  v6 = [(PGAssetCollectionFeatureProvider *)self initWithFeatureSpecifications:v5];
  return v6;
}

- (id)featureInstancesWithMomentNode:(id)a3 atMomentIngest:(BOOL)a4
{
  int v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v8 = self->_featureSpecifications;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "shouldRunAtMomentIngest", (void)v16) == v4)
        {
          v14 = [v13 instanceWithMomentNode:v6];
          if (v14) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (PGAssetCollectionFeatureProvider)initWithFeatureSpecifications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGAssetCollectionFeatureProvider;
  id v6 = [(PGAssetCollectionFeatureProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureSpecifications, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end