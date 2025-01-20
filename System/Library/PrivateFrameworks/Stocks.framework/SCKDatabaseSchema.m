@interface SCKDatabaseSchema
- (BOOL)requiresDeviceToDeviceEncryption;
- (CKContainerID)containerID;
- (NSArray)zoneIDs;
- (NSArray)zoneSchemas;
- (NSString)name;
- (SCKDatabaseSchema)initWithName:(id)a3 environment:(int64_t)a4 security:(int64_t)a5 zoneSchemas:(id)a6;
- (id)schemaForZoneName:(id)a3;
- (int64_t)environment;
- (int64_t)security;
- (void)setSecurity:(int64_t)a3;
- (void)setZoneSchemas:(id)a3;
@end

@implementation SCKDatabaseSchema

- (SCKDatabaseSchema)initWithName:(id)a3 environment:(int64_t)a4 security:(int64_t)a5 zoneSchemas:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SCKDatabaseSchema;
  v12 = [(SCKDatabaseSchema *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_environment = a4;
    v12->_security = a5;
    uint64_t v15 = [v11 copy];
    zoneSchemas = v12->_zoneSchemas;
    v12->_zoneSchemas = (NSArray *)v15;
  }
  return v12;
}

- (CKContainerID)containerID
{
  if ([(SCKDatabaseSchema *)self environment] == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = objc_alloc(MEMORY[0x263EFD620]);
  v5 = [(SCKDatabaseSchema *)self name];
  v6 = (void *)[v4 initWithContainerIdentifier:v5 environment:v3];

  return (CKContainerID *)v6;
}

- (NSArray)zoneIDs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SCKDatabaseSchema *)self zoneSchemas];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) zoneID];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)requiresDeviceToDeviceEncryption
{
  return [(SCKDatabaseSchema *)self security] != 0;
}

- (id)schemaForZoneName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SCKDatabaseSchema *)self zoneSchemas];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 zoneName];
        int v11 = [v10 isEqualToString:v4];

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

- (NSString)name
{
  return self->_name;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSArray)zoneSchemas
{
  return self->_zoneSchemas;
}

- (void)setZoneSchemas:(id)a3
{
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSchemas, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end