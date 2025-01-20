@interface PKCloudRecordArrayDatabase
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)cloudRecordByDatabaseZone;
- (PKCloudRecordArrayDatabase)initWithCoder:(id)a3;
- (PKCloudRecordArrayDatabase)initWithIdentifier:(id)a3;
- (id)allItems;
- (id)allObjects;
- (id)allRecordIDs;
- (id)allRecordNames;
- (id)allRecordsWithRecordType:(id)a3;
- (id)countByZoneID;
- (id)description;
- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4;
- (int64_t)count;
- (void)addCloudRecord:(id)a3;
- (void)applyCloudRecordDatabase:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudRecordByDatabaseZone:(id)a3;
@end

@implementation PKCloudRecordArrayDatabase

- (PKCloudRecordArrayDatabase)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudRecordArrayDatabase;
  v6 = [(PKCloudRecordArrayDatabase *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cloudRecordByDatabaseZone = v7->_cloudRecordByDatabaseZone;
    v7->_cloudRecordByDatabaseZone = v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArrayDatabase)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCloudRecordArrayDatabase;
  id v5 = [(PKCloudRecordArrayDatabase *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cloudRecordByDatabaseZone"];
    cloudRecordByDatabaseZone = v5->_cloudRecordByDatabaseZone;
    v5->_cloudRecordByDatabaseZone = (NSMutableDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  id v5 = a3;
  [v5 encodeObject:cloudRecordByDatabaseZone forKey:@"cloudRecordByDatabaseZone"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)description
{
  return [(PKCloudRecordArrayDatabase *)self descriptionWithDetailedOutput:0 includeItem:0];
}

- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __72__PKCloudRecordArrayDatabase_descriptionWithDetailedOutput_includeItem___block_invoke;
  objc_super v15 = &unk_1E56E6200;
  id v16 = v7;
  BOOL v17 = a3;
  BOOL v18 = a4;
  id v9 = v7;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:&v12];
  uint64_t v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

void __72__PKCloudRecordArrayDatabase_descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v7 zoneName];
  id v9 = [v7 ownerName];
  [v5 appendFormat:@"\n####### Begin Zone %@ %@#######\n", v8, v9];

  uint64_t v10 = *(void **)(a1 + 32);
  objc_super v11 = [v6 descriptionWithDetailedOutput:*(unsigned __int8 *)(a1 + 40) includeItem:*(unsigned __int8 *)(a1 + 41)];

  [v10 appendString:v11];
  uint64_t v12 = *(void **)(a1 + 32);
  id v14 = [v7 zoneName];
  uint64_t v13 = [v7 ownerName];

  [v12 appendFormat:@"\n####### End Zone %@ %@#######\n", v14, v13];
}

- (void)applyCloudRecordDatabase:(id)a3
{
  id v4 = [a3 cloudRecordByDatabaseZone];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKCloudRecordArrayDatabase_applyCloudRecordDatabase___block_invoke;
  v5[3] = &unk_1E56E6228;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __55__PKCloudRecordArrayDatabase_applyCloudRecordDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v8];
  if (v6)
  {
    id v7 = v6;
    [v6 applyCloudRecordDatabaseZone:v5];
  }
  else
  {
    id v7 = v5;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKey:v8];
}

- (void)addCloudRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = [v4 records];
    id v6 = [v5 anyObject];

    id v7 = [v6 recordID];
    id v8 = [v7 zoneID];

    if (v8)
    {
      id v9 = [(NSMutableDictionary *)self->_cloudRecordByDatabaseZone objectForKey:v8];
      if (!v9) {
        id v9 = [[PKCloudRecordArrayDatabaseZone alloc] initWithZoneID:v8 databaseIdentifier:self->_identifier];
      }
      [(NSMutableDictionary *)self->_cloudRecordByDatabaseZone setObject:v9 forKey:v8];
      [(PKCloudRecordArrayDatabaseZone *)v9 addCloudRecord:v10];
    }
    id v4 = v10;
  }
}

- (id)allItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PKCloudRecordArrayDatabase_allItems__block_invoke;
  v8[3] = &unk_1E56E6228;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __38__PKCloudRecordArrayDatabase_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allItems];
  [v3 addObjectsFromArray:v4];
}

- (id)allObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PKCloudRecordArrayDatabase_allObjects__block_invoke;
  v8[3] = &unk_1E56E6228;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __40__PKCloudRecordArrayDatabase_allObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __55__PKCloudRecordArrayDatabase_allRecordsWithRecordType___block_invoke;
  id v14 = &unk_1E56E6250;
  id v15 = v5;
  id v16 = v4;
  id v7 = v4;
  id v8 = v5;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __55__PKCloudRecordArrayDatabase_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordsWithRecordType:*(void *)(a1 + 40)];
  [v3 unionSet:v4];
}

- (id)allRecordNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PKCloudRecordArrayDatabase_allRecordNames__block_invoke;
  v8[3] = &unk_1E56E6228;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __44__PKCloudRecordArrayDatabase_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordNames];
  [v3 unionSet:v4];
}

- (id)allRecordIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PKCloudRecordArrayDatabase_allRecordIDs__block_invoke;
  v8[3] = &unk_1E56E6228;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __42__PKCloudRecordArrayDatabase_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordIDs];
  [v3 unionSet:v4];
}

- (int64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PKCloudRecordArrayDatabase_count__block_invoke;
  v5[3] = &unk_1E56E6278;
  v5[4] = &v6;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PKCloudRecordArrayDatabase_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)countByZoneID
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PKCloudRecordArrayDatabase_countByZoneID__block_invoke;
  v8[3] = &unk_1E56E6228;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabaseZone enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __43__PKCloudRecordArrayDatabase_countByZoneID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a3, "count"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKey:v6];
}

- (NSMutableDictionary)cloudRecordByDatabaseZone
{
  return self->_cloudRecordByDatabaseZone;
}

- (void)setCloudRecordByDatabaseZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRecordByDatabaseZone, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end