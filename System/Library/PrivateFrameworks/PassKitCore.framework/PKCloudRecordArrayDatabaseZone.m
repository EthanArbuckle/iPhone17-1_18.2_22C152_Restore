@interface PKCloudRecordArrayDatabaseZone
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)cloudRecordByZoneRecord;
- (PKCloudRecordArrayDatabaseZone)initWithCoder:(id)a3;
- (PKCloudRecordArrayDatabaseZone)initWithZoneID:(id)a3 databaseIdentifier:(id)a4;
- (id)allItems;
- (id)allObjects;
- (id)allRecordIDs;
- (id)allRecordNames;
- (id)allRecordsWithRecordType:(id)a3;
- (id)description;
- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4;
- (int64_t)count;
- (void)addCloudRecord:(id)a3;
- (void)applyCloudRecordDatabaseZone:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudRecordByZoneRecord:(id)a3;
@end

@implementation PKCloudRecordArrayDatabaseZone

- (PKCloudRecordArrayDatabaseZone)initWithZoneID:(id)a3 databaseIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudRecordArrayDatabaseZone;
  v9 = [(PKCloudRecordArrayDatabaseZone *)&v13 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cloudRecordByZoneRecord = v9->_cloudRecordByZoneRecord;
    v9->_cloudRecordByZoneRecord = v10;

    objc_storeStrong((id *)&v9->_zoneID, a3);
    objc_storeStrong((id *)&v9->_databaseIdentifier, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArrayDatabaseZone)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudRecordArrayDatabaseZone;
  v5 = [(PKCloudRecordArrayDatabaseZone *)&v17 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cloudRecordByZoneRecord"];
    cloudRecordByZoneRecord = v5->_cloudRecordByZoneRecord;
    v5->_cloudRecordByZoneRecord = (NSMutableDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"databaseIdentifier"];
    databaseIdentifier = v5->_databaseIdentifier;
    v5->_databaseIdentifier = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  id v5 = a3;
  [v5 encodeObject:cloudRecordByZoneRecord forKey:@"cloudRecordByZoneRecord"];
  [v5 encodeObject:self->_zoneID forKey:@"zoneID"];
  [v5 encodeObject:self->_databaseIdentifier forKey:@"databaseIdentifier"];
}

- (id)description
{
  return [(PKCloudRecordArrayDatabaseZone *)self descriptionWithDetailedOutput:0 includeItem:0];
}

- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int64_t v20 = 0;
  int64_t v20 = [(PKCloudRecordArrayDatabaseZone *)self count];
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PKCloudRecordArrayDatabaseZone_descriptionWithDetailedOutput_includeItem___block_invoke;
  v12[3] = &unk_1E56E62A0;
  id v9 = v7;
  v15 = v21;
  v16 = v19;
  id v13 = v9;
  uint64_t v14 = self;
  BOOL v17 = a3;
  BOOL v18 = a4;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v10 = (void *)[v9 copy];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  return v10;
}

uint64_t __76__PKCloudRecordArrayDatabaseZone_descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  v6 = NSNumber;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v7 + 24) + 1;
  *(void *)(v7 + 24) = v8;
  id v9 = a3;
  id v10 = a2;
  v11 = [v6 numberWithInteger:v8];
  uint64_t v12 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v5 appendFormat:@"\n-----------(%@ of %@)-----------------\n", v11, v12];

  [*(id *)(a1 + 32) appendFormat:@"identifier: %@\n", v10];
  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 8) zoneName];
  v15 = [*(id *)(*(void *)(a1 + 40) + 8) ownerName];
  [v13 appendFormat:@"zoneName: %@, zoneOwner: %@\n", v14, v15];

  [*(id *)(a1 + 32) appendFormat:@"database: %@\n", *(void *)(*(void *)(a1 + 40) + 16)];
  v16 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    [v9 descriptionWithItem:*(unsigned __int8 *)(a1 + 65)];
  }
  else {
  BOOL v17 = [v9 description];
  }

  [v16 appendString:v17];
  BOOL v18 = *(void **)(a1 + 32);
  return [v18 appendString:@"----------------------------\n"];
}

- (void)addCloudRecord:(id)a3
{
  id v7 = a3;
  id v4 = [v7 primaryIdentifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_cloudRecordByZoneRecord objectForKey:v4];
    if (v5)
    {
      id v6 = v5;
      [v5 applyCloudRecordObject:v7];
    }
    else
    {
      id v6 = v7;
    }
    [(NSMutableDictionary *)self->_cloudRecordByZoneRecord setObject:v6 forKey:v4];
  }
}

- (void)applyCloudRecordDatabaseZone:(id)a3
{
  id v4 = [a3 cloudRecordByZoneRecord];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKCloudRecordArrayDatabaseZone_applyCloudRecordDatabaseZone___block_invoke;
  v5[3] = &unk_1E56E62C8;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __63__PKCloudRecordArrayDatabaseZone_applyCloudRecordDatabaseZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v8];
  if (v6)
  {
    id v7 = v6;
    [v6 applyCloudRecordObject:v5];
  }
  else
  {
    id v7 = v5;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKey:v8];
}

- (id)allItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PKCloudRecordArrayDatabaseZone_allItems__block_invoke;
  v8[3] = &unk_1E56E62C8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __42__PKCloudRecordArrayDatabaseZone_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 item];
  [v3 safelyAddObject:v4];
}

- (id)allObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PKCloudRecordArrayDatabaseZone_allObjects__block_invoke;
  v8[3] = &unk_1E56E62C8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __44__PKCloudRecordArrayDatabaseZone_allObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:");
}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __59__PKCloudRecordArrayDatabaseZone_allRecordsWithRecordType___block_invoke;
  uint64_t v14 = &unk_1E56E62F0;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __59__PKCloudRecordArrayDatabaseZone_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(a3, "records", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 recordType];
        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = v10;
        id v13 = v11;
        if (v12 == v13)
        {

LABEL_15:
          [*(id *)(a1 + 40) addObject:v9];
          continue;
        }
        uint64_t v14 = v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {

          continue;
        }
        int v16 = [v12 isEqualToString:v13];

        if (v16) {
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)allRecordNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PKCloudRecordArrayDatabaseZone_allRecordNames__block_invoke;
  v8[3] = &unk_1E56E62C8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __48__PKCloudRecordArrayDatabaseZone_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(a3, "records", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 32);
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) recordID];
        uint64_t v11 = [v10 recordName];
        [v9 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)allRecordIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PKCloudRecordArrayDatabaseZone_allRecordIDs__block_invoke;
  v8[3] = &unk_1E56E62C8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByZoneRecord enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __46__PKCloudRecordArrayDatabaseZone_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "records", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 32);
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) recordID];
        [v9 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (int64_t)count
{
  return [(NSMutableDictionary *)self->_cloudRecordByZoneRecord count];
}

- (NSMutableDictionary)cloudRecordByZoneRecord
{
  return self->_cloudRecordByZoneRecord;
}

- (void)setCloudRecordByZoneRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRecordByZoneRecord, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end