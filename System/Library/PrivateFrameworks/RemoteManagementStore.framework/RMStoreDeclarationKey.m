@interface RMStoreDeclarationKey
+ (BOOL)assetDifferencesOnlyForOldKey:(id)a3 newKey:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)newDeclarationKey:(id)a3;
+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 reference:(id)a4;
+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5;
+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6;
+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7;
+ (id)newDeclarationKeyWithoutAssets:(id)a3;
+ (void)synchronizeOldKeys:(id)a3 newKeys:(id)a4 returningUnchangedKeys:(id *)a5 returningApplyKeys:(id *)a6 returningRemoveKeys:(id *)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSArray)declarationAssets;
- (NSString)declarationIdentifier;
- (NSString)declarationServerToken;
- (NSString)key;
- (NSString)storeIdentifier;
- (NSString)subscriberIdentifier;
- (RMStoreDeclarationKey)initWithCoder:(id)a3;
- (RMStoreDeclarationKey)initWithDeclarationKey:(id)a3;
- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5 assets:(id)a6;
- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7;
- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assets:(id)a7;
- (RMStoreDeclarationKey)keyWithoutServerToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyByReplacingSubscriberIdentifier:(id)a3;
- (unint64_t)hash;
- (void)_parseDeclarationKey:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMStoreDeclarationKey

+ (id)newDeclarationKey:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreDeclarationKey alloc] initWithDeclarationKey:v3];

  return v4;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[RMStoreDeclarationKey alloc] initWithSubscriberIdentifier:v9 store:v8 declaration:v7 assets:0];

  return v10;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 reference:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 assetReferences];
    if ([v8 count])
    {
      id v21 = v5;
      id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [*(id *)(*((void *)&v22 + 1) + 8 * v14) identifier];
            v16 = [v6 assetWithIdentifier:v15];

            if (v16) {
              [v9 addObject:v16];
            }

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);
      }

      id v5 = v21;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  v17 = [RMStoreDeclarationKey alloc];
  v18 = [v6 store];
  v19 = [(RMStoreDeclarationKey *)v17 initWithSubscriberIdentifier:v5 store:v18 declaration:v7 assets:v9];

  return v19;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[RMStoreDeclarationKey alloc] initWithSubscriberIdentifier:v12 storeIdentifier:v11 declarationIdentifier:v10 declarationServerToken:v9 assets:0];

  return v13;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[RMStoreDeclarationKey alloc] initWithSubscriberIdentifier:v15 storeIdentifier:v14 declarationIdentifier:v13 declarationServerToken:v12 assetKeys:v11];

  return v16;
}

+ (id)newDeclarationKeyWithoutAssets:(id)a3
{
  id v3 = a3;
  v4 = [v3 subscriberIdentifier];
  id v5 = [v3 storeIdentifier];
  id v6 = [v3 declarationIdentifier];
  id v7 = [v3 declarationServerToken];

  id v8 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:v4 storeIdentifier:v5 declarationIdentifier:v6 declarationServerToken:v7];
  return v8;
}

- (RMStoreDeclarationKey)initWithDeclarationKey:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RMStoreDeclarationKey;
  id v6 = [(RMStoreDeclarationKey *)&v25 init];
  id v7 = v6;
  if (v6)
  {
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__RMStoreDeclarationKey_initWithDeclarationKey___block_invoke;
    v18[3] = &unk_26548FBF0;
    v20 = &v21;
    id v8 = v6;
    v19 = v8;
    [(RMStoreDeclarationKey *)v8 _parseDeclarationKey:v5 completionHandler:v18];
    if (*((unsigned char *)v22 + 24))
    {
      objc_storeStrong((id *)&v8->_key, a3);
      id v9 = NSString;
      subscriberIdentifier = v8->_subscriberIdentifier;
      storeIdentifier = v8->_storeIdentifier;
      id v12 = v8->_declarationIdentifier;
      id v13 = [(NSString *)v12 dataUsingEncoding:4];
      id v14 = [v13 base64EncodedStringWithOptions:0];

      uint64_t v15 = [v9 stringWithFormat:@"%@/%@:%@", subscriberIdentifier, storeIdentifier, v14];
      keyWithoutServerToken = v8->_keyWithoutServerToken;
      v8->_keyWithoutServerToken = (NSString *)v15;
    }
    _Block_object_dispose(&v21, 8);
  }

  return v7;
}

void __48__RMStoreDeclarationKey_initWithDeclarationKey___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 24);
  *(void *)(v18 + 24) = v13;
  id v31 = v13;

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 32);
  *(void *)(v20 + 32) = v14;
  id v22 = v14;

  uint64_t v23 = *(void *)(a1 + 32);
  char v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v15;
  id v25 = v15;

  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void **)(v26 + 48);
  *(void *)(v26 + 48) = v16;
  id v28 = v16;

  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 56);
  *(void *)(v29 + 56) = v17;
}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5 assets:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [a4 identifier];
  id v14 = [v11 declarationIdentifier];
  id v15 = [v11 declarationServerToken];

  id v16 = [(RMStoreDeclarationKey *)self initWithSubscriberIdentifier:v12 storeIdentifier:v13 declarationIdentifier:v14 declarationServerToken:v15 assets:v10];
  return v16;
}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assets:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v16 && [v16 count])
  {
    uint64_t v27 = self;
    id v28 = v13;
    uint64_t v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = +[RMStoreAssetKey newAssetKeyWithAsset:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
    }

    id v13 = v28;
    self = v27;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v25 = [(RMStoreDeclarationKey *)self initWithSubscriberIdentifier:v12 storeIdentifier:v13 declarationIdentifier:v14 declarationServerToken:v15 assetKeys:v18];

  return v25;
}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v47 = a5;
  id v15 = a6;
  id v16 = a7;
  v52.receiver = self;
  v52.super_class = (Class)RMStoreDeclarationKey;
  id v17 = [(RMStoreDeclarationKey *)&v52 init];
  uint64_t v18 = v17;
  if (v17)
  {
    id v45 = v14;
    id v46 = v13;
    objc_storeStrong((id *)&v17->_subscriberIdentifier, a3);
    objc_storeStrong((id *)&v18->_storeIdentifier, a4);
    objc_storeStrong((id *)&v18->_declarationIdentifier, a5);
    objc_storeStrong((id *)&v18->_declarationServerToken, a6);
    id v19 = NSString;
    subscriberIdentifier = v18->_subscriberIdentifier;
    storeIdentifier = v18->_storeIdentifier;
    uint64_t v22 = [(NSString *)v18->_declarationIdentifier dataUsingEncoding:4];
    uint64_t v23 = [v22 base64EncodedStringWithOptions:0];

    uint64_t v24 = [v19 stringWithFormat:@"%@/%@:%@", subscriberIdentifier, storeIdentifier, v23];
    keyWithoutServerToken = v18->_keyWithoutServerToken;
    v18->_keyWithoutServerToken = (NSString *)v24;

    if (v16 && [v16 count])
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v27 = v16;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v49;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v49 != v30) {
              objc_enumerationMutation(v27);
            }
            long long v32 = [*(id *)(*((void *)&v48 + 1) + 8 * v31) key];
            [v26 addObject:v32];

            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v29);
      }

      objc_storeStrong((id *)&v18->_declarationAssets, a7);
      v33 = NSString;
      uint64_t v34 = v18->_keyWithoutServerToken;
      v35 = [(NSString *)v18->_declarationServerToken dataUsingEncoding:4];
      v36 = [v35 base64EncodedStringWithOptions:0];

      v37 = [v26 componentsJoinedByString:@"$"];
      uint64_t v38 = [v33 stringWithFormat:@"%@.%@$%@", v34, v36, v37];
      key = v18->_key;
      v18->_key = (NSString *)v38;
    }
    else
    {
      v40 = NSString;
      v41 = v18->_keyWithoutServerToken;
      v42 = [(NSString *)v18->_declarationServerToken dataUsingEncoding:4];
      uint64_t v26 = [v42 base64EncodedStringWithOptions:0];

      uint64_t v43 = [v40 stringWithFormat:@"%@.%@", v41, v26];
      v36 = v18->_key;
      v18->_key = (NSString *)v43;
    }

    id v14 = v45;
    id v13 = v46;
  }

  return v18;
}

- (BOOL)isValid
{
  v2 = [(RMStoreDeclarationKey *)self key];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)keyByReplacingSubscriberIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStoreDeclarationKey *)self storeIdentifier];
  id v6 = [(RMStoreDeclarationKey *)self declarationIdentifier];
  id v7 = [(RMStoreDeclarationKey *)self declarationServerToken];
  id v8 = [(RMStoreDeclarationKey *)self declarationAssets];
  id v9 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:v4 storeIdentifier:v5 declarationIdentifier:v6 declarationServerToken:v7 assetKeys:v8];

  return v9;
}

+ (BOOL)assetDifferencesOnlyForOldKey:(id)a3 newKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 keyWithoutServerToken];
  id v8 = [v6 keyWithoutServerToken];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [v5 declarationServerToken];
    id v10 = [v6 declarationServerToken];
    int v11 = [v9 isEqualToString:v10];

    if (!v11)
    {
      LOBYTE(v21) = 0;
      goto LABEL_13;
    }
    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [v5 declarationAssets];
    id v14 = (void *)v13;
    uint64_t v15 = MEMORY[0x263EFFA68];
    if (v13) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = MEMORY[0x263EFFA68];
    }
    id v7 = [v12 setWithArray:v16];

    id v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = [v6 declarationAssets];
    id v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v15;
    }
    id v8 = [v17 setWithArray:v20];

    int v21 = [v7 isEqualToSet:v8] ^ 1;
  }
  else
  {
    LOBYTE(v21) = 0;
  }

LABEL_13:
  return v21;
}

+ (void)synchronizeOldKeys:(id)a3 newKeys:(id)a4 returningUnchangedKeys:(id *)a5 returningApplyKeys:(id *)a6 returningRemoveKeys:(id *)a7
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  int v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v64 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v18 = [v17 keyWithoutServerToken];
        [v11 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v14);
  }

  id v19 = v9;
  uint64_t v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        id v27 = [v26 keyWithoutServerToken];
        [v20 setObject:v26 forKeyedSubscript:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v23);
  }

  uint64_t v28 = (void *)MEMORY[0x263EFFA08];
  uint64_t v29 = [v20 allKeys];
  uint64_t v30 = [v28 setWithArray:v29];

  v53 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v21, "count"));
  objc_super v52 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v21, "count"));
  long long v51 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v12, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v21;
  uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v60 != v33) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v59 + 1) + 8 * k);
        if ([v12 containsObject:v35])
        {
          [v53 addObject:v35];
        }
        else
        {
          v36 = [v35 keyWithoutServerToken];
          v37 = [v11 objectForKeyedSubscript:v36];
          if (v37) {
            id v38 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithUpdateKey:v35 replaceKey:v37];
          }
          else {
            id v38 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithNewKey:v35];
          }
          v39 = v38;
          [v52 addObject:v38];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v32);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v40 = v12;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v42; ++m)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v40);
        }
        id v45 = *(void **)(*((void *)&v55 + 1) + 8 * m);
        id v46 = [v45 keyWithoutServerToken];
        char v47 = [v30 containsObject:v46];

        if ((v47 & 1) == 0) {
          [v51 addObject:v45];
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v42);
  }

  *a5 = (id)[v53 copy];
  *a6 = (id)[v52 copy];
  *a7 = (id)[v51 copy];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreDeclarationKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declaration-key"];

  id v6 = [(RMStoreDeclarationKey *)self initWithDeclarationKey:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStoreDeclarationKey *)self key];
  [v4 encodeObject:v5 forKey:@"declaration-key"];
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(RMStoreDeclarationKey *)self subscriberIdentifier];
  id v7 = [(RMStoreDeclarationKey *)self storeIdentifier];
  id v8 = [(RMStoreDeclarationKey *)self declarationIdentifier];
  id v9 = [(RMStoreDeclarationKey *)self declarationServerToken];
  id v10 = [v3 stringWithFormat:@"<%@: %p { subscriber = %@, store = %@, identifier = %@, serverToken = %@ }>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMStoreDeclarationKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(RMStoreDeclarationKey *)self key];
      id v6 = [(RMStoreDeclarationKey *)v4 key];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(RMStoreDeclarationKey *)self key];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v3 = [(RMStoreDeclarationKey *)self key];
  id v4 = +[RMStoreDeclarationKey newDeclarationKey:v3];

  return v4;
}

- (void)_parseDeclarationKey:(id)a3 completionHandler:(id)a4
{
  id v33 = a3;
  id v5 = (void (**)(id, void, __CFString *, __CFString *, __CFString *, __CFString *, void *))a4;
  uint64_t v6 = [v33 rangeOfString:@"/"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v7 = 0;
    uint64_t v8 = 0;
    id v9 = &stru_2708C6930;
    id v10 = &stru_2708C6930;
    int v11 = &stru_2708C6930;
    id v12 = &stru_2708C6930;
  }
  else
  {
    uint64_t v13 = v6;
    id v12 = [v33 substringToIndex:v6];
    uint64_t v14 = [v33 substringFromIndex:v13 + 1];
    uint64_t v15 = [v14 componentsSeparatedByString:@":"];
    if ([v15 count] == 2)
    {
      int v11 = [v15 objectAtIndexedSubscript:0];
      uint64_t v16 = [v15 objectAtIndexedSubscript:1];
      id v17 = [v16 componentsSeparatedByString:@"$"];

      uint64_t v18 = [v17 firstObject];
      id v19 = [v18 componentsSeparatedByString:@"."];
      uint64_t v20 = [v19 count];
      uint64_t v8 = v20 == 2;
      BOOL v32 = v20 == 2;
      uint64_t v30 = v19;
      uint64_t v31 = v18;
      if (v20 == 2)
      {
        uint64_t v28 = [v19 objectAtIndexedSubscript:0];
        id v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v28 options:0];
        id v10 = (__CFString *)[[NSString alloc] initWithData:v21 encoding:4];

        uint64_t v22 = [v19 objectAtIndexedSubscript:1];
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v22 options:0];
        id v9 = (__CFString *)[[NSString alloc] initWithData:v23 encoding:4];

        uint64_t v8 = v32;
      }
      else
      {
        id v9 = &stru_2708C6930;
        id v10 = &stru_2708C6930;
      }
      if ((unint64_t)[v17 count] < 2)
      {
        char v7 = 0;
      }
      else
      {
        char v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "count") - 1);
        if ((unint64_t)[v17 count] >= 2)
        {
          id v27 = v15;
          uint64_t v29 = v12;
          unint64_t v24 = 1;
          do
          {
            id v25 = [v17 objectAtIndexedSubscript:v24];
            id v26 = +[RMStoreAssetKey newAssetKey:v25];
            [v7 addObject:v26];

            ++v24;
          }
          while (v24 < [v17 count]);
          id v12 = v29;
          uint64_t v15 = v27;
        }
        uint64_t v8 = v32;
      }
    }
    else
    {
      char v7 = 0;
      uint64_t v8 = 0;
      id v9 = &stru_2708C6930;
      id v10 = &stru_2708C6930;
      int v11 = &stru_2708C6930;
    }
  }
  v5[2](v5, v8, v12, v11, v10, v9, v7);
}

- (NSString)key
{
  return self->_key;
}

- (RMStoreDeclarationKey)keyWithoutServerToken
{
  return (RMStoreDeclarationKey *)self->_keyWithoutServerToken;
}

- (NSString)subscriberIdentifier
{
  return self->_subscriberIdentifier;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (NSArray)declarationAssets
{
  return self->_declarationAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationAssets, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifier, 0);
  objc_storeStrong((id *)&self->_keyWithoutServerToken, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end