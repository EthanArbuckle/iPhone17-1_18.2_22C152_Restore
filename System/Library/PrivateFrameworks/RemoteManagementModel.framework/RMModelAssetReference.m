@interface RMModelAssetReference
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssetReference:(id)a3;
- (NSArray)assetTypes;
- (NSString)identifier;
- (RMModelAssetReference)initWithIdentifier:(id)a3 assetTypes:(id)a4;
@end

@implementation RMModelAssetReference

- (RMModelAssetReference)initWithIdentifier:(id)a3 assetTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMModelAssetReference;
  v8 = [(RMModelAssetReference *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    assetTypes = v8->_assetTypes;
    v8->_assetTypes = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RMModelAssetReference *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMModelAssetReference *)self isEqualToAssetReference:v4];
  }

  return v5;
}

- (BOOL)isEqualToAssetReference:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMModelAssetReference *)self identifier];
  id v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(RMModelAssetReference *)self assetTypes];
    v8 = [v4 assetTypes];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)assetTypes
{
  return self->_assetTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end