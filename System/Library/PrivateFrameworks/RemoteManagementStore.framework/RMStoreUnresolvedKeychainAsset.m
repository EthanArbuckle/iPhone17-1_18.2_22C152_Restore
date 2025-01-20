@interface RMStoreUnresolvedKeychainAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnresolvedKeychainAsset:(id)a3;
- (BOOL)useSystemKeychain;
- (NSString)keychainDefaultAccessibility;
- (NSString)keychainGroup;
- (RMStoreDeclarationKey)assetKey;
- (RMStoreDeclarationKey)configurationKey;
- (RMStoreUnresolvedKeychainAsset)initWithAsset:(id)a3 assetKey:(id)a4 configurationKey:(id)a5 group:(id)a6 defaultAccessibility:(id)a7;
- (RMStoreUnresolvedKeychainAsset)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMStoreUnresolvedKeychainAsset

- (RMStoreUnresolvedKeychainAsset)initWithAsset:(id)a3 assetKey:(id)a4 configurationKey:(id)a5 group:(id)a6 defaultAccessibility:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v17 = [(RMStoreUnresolvedAsset *)&v20 initWithAsset:a3 queryParameters:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetKey, a4);
    objc_storeStrong((id *)&v18->_configurationKey, a5);
    objc_storeStrong((id *)&v18->_keychainGroup, a6);
    objc_storeStrong((id *)&v18->_keychainDefaultAccessibility, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreUnresolvedKeychainAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v5 = [(RMStoreUnresolvedAsset *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-key"];
    assetKey = v5->_assetKey;
    v5->_assetKey = (RMStoreDeclarationKey *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration-key"];
    configurationKey = v5->_configurationKey;
    v5->_configurationKey = (RMStoreDeclarationKey *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keychain-group"];
    keychainGroup = v5->_keychainGroup;
    v5->_keychainGroup = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keychain-default-accessibility"];
    keychainDefaultAccessibility = v5->_keychainDefaultAccessibility;
    v5->_keychainDefaultAccessibility = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  id v4 = a3;
  [(RMStoreUnresolvedAsset *)&v9 encodeWithCoder:v4];
  v5 = [(RMStoreUnresolvedKeychainAsset *)self assetKey];
  [v4 encodeObject:v5 forKey:@"asset-key"];

  uint64_t v6 = [(RMStoreUnresolvedKeychainAsset *)self configurationKey];
  [v4 encodeObject:v6 forKey:@"configuration-key"];

  v7 = [(RMStoreUnresolvedKeychainAsset *)self keychainGroup];
  [v4 encodeObject:v7 forKey:@"keychain-group"];

  uint64_t v8 = [(RMStoreUnresolvedKeychainAsset *)self keychainDefaultAccessibility];
  [v4 encodeObject:v8 forKey:@"keychain-default-accessibility"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  BOOL v5 = [(RMStoreUnresolvedAsset *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(RMStoreUnresolvedKeychainAsset *)self isEqualToUnresolvedKeychainAsset:v4];

  return v5;
}

- (BOOL)isEqualToUnresolvedKeychainAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMStoreUnresolvedKeychainAsset *)self assetKey];
  uint64_t v6 = [v4 assetKey];
  id v7 = v5;
  id v8 = v6;
  objc_super v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  char v10 = 0;
  v11 = v8;
  id v12 = v7;
  if (!v7 || !v8) {
    goto LABEL_29;
  }
  int v13 = [v7 isEqual:v8];

  if (v13)
  {
LABEL_7:
    id v14 = [(RMStoreUnresolvedKeychainAsset *)self configurationKey];
    objc_super v15 = [v4 configurationKey];
    id v12 = v14;
    id v16 = v15;
    v11 = v16;
    if (v12 == v16)
    {
    }
    else
    {
      char v10 = 0;
      v17 = v16;
      id v18 = v12;
      if (!v12 || !v16) {
        goto LABEL_28;
      }
      int v19 = [v12 isEqual:v16];

      if (!v19)
      {
        char v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    objc_super v20 = [(RMStoreUnresolvedKeychainAsset *)self keychainGroup];
    v21 = [v4 keychainGroup];
    id v18 = v20;
    id v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      char v10 = 0;
      if (v18)
      {
        v23 = v22;
        id v24 = v18;
        if (v22)
        {
          int v25 = [v18 isEqual:v22];

          if (!v25)
          {
            char v10 = 0;
LABEL_27:
            v17 = v30;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v23 = v22;
        id v24 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }

LABEL_19:
    v26 = [(RMStoreUnresolvedKeychainAsset *)self keychainDefaultAccessibility];
    v27 = [v4 keychainDefaultAccessibility];
    id v24 = v26;
    id v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v24 && v28) {
        char v10 = [v24 isEqual:v28];
      }
    }

    goto LABEL_26;
  }
  char v10 = 0;
LABEL_30:

  return v10;
}

- (RMStoreDeclarationKey)assetKey
{
  return self->_assetKey;
}

- (RMStoreDeclarationKey)configurationKey
{
  return self->_configurationKey;
}

- (NSString)keychainGroup
{
  return self->_keychainGroup;
}

- (NSString)keychainDefaultAccessibility
{
  return self->_keychainDefaultAccessibility;
}

- (BOOL)useSystemKeychain
{
  return self->_useSystemKeychain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainDefaultAccessibility, 0);
  objc_storeStrong((id *)&self->_keychainGroup, 0);
  objc_storeStrong((id *)&self->_configurationKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
}

@end