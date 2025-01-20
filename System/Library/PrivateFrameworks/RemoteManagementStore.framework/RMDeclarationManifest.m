@interface RMDeclarationManifest
+ (BOOL)supportsSecureCoding;
+ (id)declarationManifestWithDeclarations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToManifest:(id)a3;
- (NSArray)activations;
- (NSArray)assets;
- (NSArray)configurations;
- (NSArray)management;
- (RMDeclarationManifest)initWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6;
- (RMDeclarationManifest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMDeclarationManifest

+ (id)declarationManifestWithDeclarations:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v28 = objc_opt_new();
  v27 = objc_opt_new();
  v25 = objc_opt_new();
  v23 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = *MEMORY[0x263F636B0];
    uint64_t v9 = *MEMORY[0x263F636C0];
    uint64_t v26 = *MEMORY[0x263F636B8];
    uint64_t v24 = *MEMORY[0x263F636C8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "declarationClassType", v23);
        if ([v12 isEqualToString:v8])
        {
          v13 = [RMDeclarationManifestItem alloc];
          v14 = [v11 declarationIdentifier];
          v15 = [v11 declarationServerToken];
          v16 = [(RMDeclarationManifestItem *)v13 initWithIdentifier:v14 version:v15];
          v17 = v28;
        }
        else if ([v12 isEqualToString:v9])
        {
          v18 = [RMDeclarationManifestItem alloc];
          v14 = [v11 declarationIdentifier];
          v15 = [v11 declarationServerToken];
          v16 = [(RMDeclarationManifestItem *)v18 initWithIdentifier:v14 version:v15];
          v17 = v27;
        }
        else if ([v12 isEqualToString:v26])
        {
          v19 = [RMDeclarationManifestItem alloc];
          v14 = [v11 declarationIdentifier];
          v15 = [v11 declarationServerToken];
          v16 = [(RMDeclarationManifestItem *)v19 initWithIdentifier:v14 version:v15];
          v17 = v25;
        }
        else
        {
          if (![v12 isEqualToString:v24]) {
            goto LABEL_15;
          }
          v20 = [RMDeclarationManifestItem alloc];
          v14 = [v11 declarationIdentifier];
          v15 = [v11 declarationServerToken];
          v16 = [(RMDeclarationManifestItem *)v20 initWithIdentifier:v14 version:v15];
          v17 = v23;
        }
        [v17 addObject:v16];

LABEL_15:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  v21 = [[RMDeclarationManifest alloc] initWithActivations:v28 configurations:v27 assets:v25 management:v23];
  return v21;
}

- (RMDeclarationManifest)initWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RMDeclarationManifest;
  v14 = [(RMDeclarationManifest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    activations = v14->_activations;
    v14->_activations = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    configurations = v14->_configurations;
    v14->_configurations = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    assets = v14->_assets;
    v14->_assets = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    management = v14->_management;
    v14->_management = (NSArray *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationManifest)initWithCoder:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v3, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"activations"];

  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"configurations"];

  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"assets"];

  uint64_t v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v23 = [v4 decodeObjectOfClasses:v22 forKey:@"management"];

  objc_super v24 = [(RMDeclarationManifest *)self initWithActivations:v8 configurations:v13 assets:v18 management:v23];
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RMDeclarationManifest *)self activations];
  [v4 encodeObject:v5 forKey:@"activations"];

  uint64_t v6 = [(RMDeclarationManifest *)self configurations];
  [v4 encodeObject:v6 forKey:@"configurations"];

  uint64_t v7 = [(RMDeclarationManifest *)self assets];
  [v4 encodeObject:v7 forKey:@"assets"];

  id v8 = [(RMDeclarationManifest *)self management];
  [v4 encodeObject:v8 forKey:@"management"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMDeclarationManifest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMDeclarationManifest *)self isEqualToManifest:v4];
  }

  return v5;
}

- (BOOL)isEqualToManifest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMDeclarationManifest *)self activations];
  uint64_t v6 = [v4 activations];
  if ([v5 isEqualToArray:v6])
  {
    uint64_t v7 = [(RMDeclarationManifest *)self configurations];
    id v8 = [v4 configurations];
    if ([v7 isEqualToArray:v8])
    {
      uint64_t v9 = [(RMDeclarationManifest *)self assets];
      uint64_t v10 = [v4 assets];
      if ([v9 isEqualToArray:v10])
      {
        uint64_t v11 = [(RMDeclarationManifest *)self management];
        id v12 = [v4 management];
        char v13 = [v11 isEqualToArray:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSArray)activations
{
  return self->_activations;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSArray)management
{
  return self->_management;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_management, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_activations, 0);
}

@end