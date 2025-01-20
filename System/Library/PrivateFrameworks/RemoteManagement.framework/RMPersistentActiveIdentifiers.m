@interface RMPersistentActiveIdentifiers
+ (BOOL)supportsSecureCoding;
- (NSDictionary)uniqueIdentifiersByConfigurationType;
- (RMPersistentActiveIdentifiers)initWithCoder:(id)a3;
- (RMPersistentActiveIdentifiers)initWithConfigurationPayloads:(id)a3;
- (RMPersistentActiveIdentifiers)initWithUniqueIdentifiersByConfigurationType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUniqueIdentifiersByConfigurationType:(id)a3;
@end

@implementation RMPersistentActiveIdentifiers

- (RMPersistentActiveIdentifiers)initWithConfigurationPayloads:(id)a3
{
  v20 = self;
  id v3 = a3;
  v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "declarationType", v20);
        v8 = [v4 objectForKeyedSubscript:v7];
        if (!v8)
        {
          v8 = objc_opt_new();
          [v4 setObject:v8 forKeyedSubscript:v7];
        }
        v9 = [[RMDeclarationUniqueIdentifier alloc] initWithDeclarationPayload:v6];
        [v8 addObject:v9];

        v10 = [v6 assetReferences];
        v11 = [v10 valueForKey:@"asset"];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [[RMDeclarationUniqueIdentifier alloc] initWithDeclarationPayload:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
              [v8 addObject:v17];
            }
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
      }
      id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  v18 = [(RMPersistentActiveIdentifiers *)v20 initWithUniqueIdentifiersByConfigurationType:v4];
  return v18;
}

- (RMPersistentActiveIdentifiers)initWithUniqueIdentifiersByConfigurationType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMPersistentActiveIdentifiers;
  v5 = [(RMPersistentActiveIdentifiers *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    uniqueIdentifiersByConfigurationType = v5->_uniqueIdentifiersByConfigurationType;
    v5->_uniqueIdentifiersByConfigurationType = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPersistentActiveIdentifiers)initWithCoder:(id)a3
{
  id v4 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v10 count:4];
  v6 = +[NSSet setWithArray:v5];

  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"uniqueIdentifiersByConfigurationType"];

  if (v7)
  {
    self = [(RMPersistentActiveIdentifiers *)self initWithUniqueIdentifiersByConfigurationType:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMPersistentActiveIdentifiers *)self uniqueIdentifiersByConfigurationType];
  [v4 encodeObject:v5 forKey:@"uniqueIdentifiersByConfigurationType"];
}

- (NSDictionary)uniqueIdentifiersByConfigurationType
{
  return self->_uniqueIdentifiersByConfigurationType;
}

- (void)setUniqueIdentifiersByConfigurationType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end