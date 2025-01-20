@interface KTIDStaticKeyStoreEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)valid;
- (KTAccountPublicID)publicKeyID;
- (KTIDStaticKeyStoreEntry)init;
- (KTIDStaticKeyStoreEntry)initWithCoder:(id)a3;
- (NSArray)mappings;
- (NSMutableDictionary)handles;
- (NSString)contactExternalURI;
- (NSString)contactIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactExternalURI:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setHandles:(id)a3;
- (void)setMappings:(id)a3;
- (void)setPublicKeyID:(id)a3;
@end

@implementation KTIDStaticKeyStoreEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTIDStaticKeyStoreEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)KTIDStaticKeyStoreEntry;
  v2 = [(KTIDStaticKeyStoreEntry *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(KTIDStaticKeyStoreEntry *)v2 setHandles:v3];

    v4 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[KTIDStaticKeyStoreEntry allocWithZone:](KTIDStaticKeyStoreEntry, "allocWithZone:") init];
  objc_super v6 = [(KTIDStaticKeyStoreEntry *)self contactIdentifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [(KTIDStaticKeyStoreEntry *)v5 setContactIdentifier:v7];

  v8 = [(KTIDStaticKeyStoreEntry *)self contactExternalURI];
  v9 = (void *)[v8 copyWithZone:a3];
  [(KTIDStaticKeyStoreEntry *)v5 setContactExternalURI:v9];

  v10 = [(KTIDStaticKeyStoreEntry *)self handles];
  v11 = (void *)[v10 copyWithZone:a3];
  [(KTIDStaticKeyStoreEntry *)v5 setHandles:v11];

  v12 = [(KTIDStaticKeyStoreEntry *)self publicKeyID];
  v13 = (void *)[v12 copyWithZone:a3];
  [(KTIDStaticKeyStoreEntry *)v5 setPublicKeyID:v13];

  return v5;
}

- (BOOL)valid
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KTIDStaticKeyStoreEntry *)self contactIdentifier];
  [v4 encodeObject:v5 forKey:@"contactIdentifier"];

  objc_super v6 = [(KTIDStaticKeyStoreEntry *)self contactExternalURI];
  [v4 encodeObject:v6 forKey:@"contactExternalURI"];

  v7 = [(KTIDStaticKeyStoreEntry *)self publicKeyID];
  [v4 encodeObject:v7 forKey:@"publicKeyID"];

  id v8 = [(KTIDStaticKeyStoreEntry *)self handles];
  [v4 encodeObject:v8 forKey:@"handles"];
}

- (KTIDStaticKeyStoreEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(KTIDStaticKeyStoreEntry);
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyID"];
    [(KTIDStaticKeyStoreEntry *)v5 setPublicKeyID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    [(KTIDStaticKeyStoreEntry *)v5 setContactIdentifier:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactExternalURI"];
    [(KTIDStaticKeyStoreEntry *)v5 setContactExternalURI:v8];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"handles"];
    v14 = (void *)[v13 mutableCopy];
    [(KTIDStaticKeyStoreEntry *)v5 setHandles:v14];

    v15 = v5;
  }

  return v5;
}

- (NSArray)mappings
{
  return (NSArray *)[(NSMutableDictionary *)self->handles allKeys];
}

- (void)setMappings:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF9C0];
  objc_super v6 = [(KTIDStaticKeyStoreEntry *)self handles];
  v7 = [v6 allKeys];
  id v8 = [v5 setWithArray:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        [v8 removeObject:v14];
        v15 = [(KTIDStaticKeyStoreEntry *)self handles];
        v16 = [v15 objectForKeyedSubscript:v14];

        if (!v16)
        {
          v16 = objc_alloc_init(KTIDStaticKeyStoreHandle);
          [(KTIDStaticKeyStoreHandle *)v16 setHandle:v14];
          [(KTIDStaticKeyStoreHandle *)v16 setValid:0];
          v17 = [(KTIDStaticKeyStoreEntry *)self handles];
          [v17 setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        v24 = [(KTIDStaticKeyStoreEntry *)self handles];
        [v24 setObject:0 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (KTAccountPublicID)publicKeyID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPublicKeyID:(id)a3
{
}

- (NSMutableDictionary)handles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHandles:(id)a3
{
}

- (NSString)contactExternalURI
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactExternalURI:(id)a3
{
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contactIdentifier, 0);
  objc_storeStrong((id *)&self->contactExternalURI, 0);
  objc_storeStrong((id *)&self->handles, 0);

  objc_storeStrong((id *)&self->publicKeyID, 0);
}

@end