@interface RMSubscribedConfigurationReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReference:(id)a3;
- (NSArray)assets;
- (RMModelDeclarationBase)declaration;
- (RMSubscribedConfigurationReference)initWithCoder:(id)a3;
- (RMSubscribedConfigurationReference)initWithDeclaration:(id)a3 subscriberStore:(id)a4 assets:(id)a5;
- (RMSubscriberStore)store;
- (id)_resolveDynamicDeclaration:(id)a3;
- (id)assetWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMSubscribedConfigurationReference

- (RMSubscribedConfigurationReference)initWithDeclaration:(id)a3 subscriberStore:(id)a4 assets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RMSubscribedConfigurationReference;
  v11 = [(RMSubscribedConfigurationReference *)&v16 init];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(RMSubscribedConfigurationReference *)v11 _resolveDynamicDeclaration:v8];
    declaration = v12->_declaration;
    v12->_declaration = (RMModelDeclarationBase *)v13;

    objc_storeStrong((id *)&v12->_store, a4);
    objc_storeStrong((id *)&v12->_assets, a5);
  }

  return v12;
}

- (id)_resolveDynamicDeclaration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 serializeWithType:0];
    id v12 = 0;
    v5 = [MEMORY[0x263F63660] load:v4 serializationType:0 error:&v12];
    id v6 = v12;
    v7 = [MEMORY[0x263F635B0] subscribedConfigurationReference];
    id v8 = v7;
    if (v5)
    {
      id v9 = v5;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[RMSubscribedConfigurationReference _resolveDynamicDeclaration:]((uint64_t)v5, v8);
        id v9 = v5;
      }
    }
    else
    {
      id v9 = v3;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[RMSubscribedConfigurationReference _resolveDynamicDeclaration:]((uint64_t)v6, v8);
        id v9 = v3;
      }
    }

    id v10 = v9;
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (id)assetWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(RMSubscribedConfigurationReference *)self assets];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 declarationIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMSubscribedConfigurationReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declaration"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"store"];
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"assets"];

  char v11 = [(RMSubscribedConfigurationReference *)self initWithDeclaration:v5 subscriberStore:v6 assets:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMSubscribedConfigurationReference *)self declaration];
  [v4 encodeObject:v5 forKey:@"declaration"];

  id v6 = [(RMSubscribedConfigurationReference *)self store];
  [v4 encodeObject:v6 forKey:@"store"];

  id v7 = [(RMSubscribedConfigurationReference *)self assets];
  [v4 encodeObject:v7 forKey:@"assets"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMSubscribedConfigurationReference *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMSubscribedConfigurationReference *)self isEqualToReference:v4];
  }

  return v5;
}

- (BOOL)isEqualToReference:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMSubscribedConfigurationReference *)self declaration];
  id v6 = [v5 declarationType];
  id v7 = [v4 declaration];
  uint64_t v8 = [v7 declarationType];
  if ([v6 isEqualToString:v8])
  {
    id v9 = [(RMSubscribedConfigurationReference *)self declaration];
    id v10 = [v9 declarationIdentifier];
    char v11 = [v4 declaration];
    id v12 = [v11 declarationIdentifier];
    if ([v10 isEqualToString:v12])
    {
      v24 = v9;
      v27 = [(RMSubscribedConfigurationReference *)self declaration];
      long long v13 = [v27 declarationServerToken];
      v25 = [v4 declaration];
      [v25 declarationServerToken];
      v23 = v26 = v13;
      if (objc_msgSend(v13, "isEqualToString:"))
      {
        long long v14 = [(RMSubscribedConfigurationReference *)self store];
        v21 = [v4 store];
        v22 = v14;
        int v15 = objc_msgSend(v14, "isEqual:");
        id v9 = v24;
        if (v15)
        {
          v20 = [(RMSubscribedConfigurationReference *)self assets];
          uint64_t v16 = [v20 count];
          v19 = [v4 assets];
          BOOL v17 = v16 == [v19 count];
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
        id v9 = v24;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (RMModelDeclarationBase)declaration
{
  return self->_declaration;
}

- (RMSubscriberStore)store
{
  return self->_store;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
}

- (void)_resolveDynamicDeclaration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B003000, a2, OS_LOG_TYPE_ERROR, "Failed to resolve dynamic configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_resolveDynamicDeclaration:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_25B003000, a2, OS_LOG_TYPE_DEBUG, "Resolved dynamic configuration: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end