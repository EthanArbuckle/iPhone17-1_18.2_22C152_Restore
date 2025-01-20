@interface PKCloudRecordArray
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)cloudRecordByDatabase;
- (NSMutableDictionary)reportItemsByAccountIdentifier;
- (PKCloudRecordArray)init;
- (PKCloudRecordArray)initWithCoder:(id)a3;
- (id)_descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4;
- (id)allItems;
- (id)allObjects;
- (id)allObjectsByDatabaseIdentifier;
- (id)allRecordIDs;
- (id)allRecordNames;
- (id)allRecordsWithRecordType:(id)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)transactionSyncReportItemsByAccountIdentifier;
- (int64_t)count;
- (int64_t)recordsFetchedCount;
- (void)addCloudRecord:(id)a3 forContainerDatabaseIdentifier:(id)a4;
- (void)addCountToRecordsFetched:(int64_t)a3;
- (void)addTransactionSyncReportItem:(id)a3 forAccountIdentifier:(id)a4;
- (void)addTransactionSyncReportItems:(id)a3 forAccountIdentifier:(id)a4;
- (void)applyCloudRecordArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudRecordByDatabase:(id)a3;
- (void)setRecordsFetchedCount:(int64_t)a3;
- (void)setReportItemsByAccountIdentifier:(id)a3;
@end

@implementation PKCloudRecordArray

- (PKCloudRecordArray)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordArray;
  v2 = [(PKCloudRecordArray *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cloudRecordByDatabase = v2->_cloudRecordByDatabase;
    v2->_cloudRecordByDatabase = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reportItemsByAccountIdentifier = v2->_reportItemsByAccountIdentifier;
    v2->_reportItemsByAccountIdentifier = v5;

    v2->_recordsFetchedCount = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArray)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCloudRecordArray;
  v5 = [(PKCloudRecordArray *)&v20 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cloudRecordByDatabase"];
    cloudRecordByDatabase = v5->_cloudRecordByDatabase;
    v5->_cloudRecordByDatabase = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"reportItemsByAccountIdentifier"];
    reportItemsByAccountIdentifier = v5->_reportItemsByAccountIdentifier;
    v5->_reportItemsByAccountIdentifier = (NSMutableDictionary *)v17;

    v5->_recordsFetchedCount = [v4 decodeIntegerForKey:@"recordsFetchedCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  id v5 = a3;
  [v5 encodeObject:cloudRecordByDatabase forKey:@"cloudRecordByDatabase"];
  [v5 encodeObject:self->_reportItemsByAccountIdentifier forKey:@"reportItemsByAccountIdentifier"];
  [v5 encodeInteger:self->_recordsFetchedCount forKey:@"recordsFetchedCount"];
}

- (id)descriptionWithItem:(BOOL)a3
{
  return [(PKCloudRecordArray *)self _descriptionWithDetailedOutput:1 includeItem:a3];
}

- (id)description
{
  return [(PKCloudRecordArray *)self _descriptionWithDetailedOutput:0 includeItem:0];
}

- (id)_descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke;
  v27[3] = &unk_1E56E60E8;
  id v11 = v7;
  id v28 = v11;
  BOOL v32 = a3;
  BOOL v33 = a4;
  id v12 = v8;
  id v29 = v12;
  id v13 = v9;
  id v30 = v13;
  v31 = &v34;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v27];
  [v11 appendString:@"\n*********************\n"];
  [v11 appendString:@"Stats:\n"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_2;
  v25[3] = &unk_1E56DCAC8;
  id v14 = v11;
  id v26 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v25];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_4;
  v23 = &unk_1E56E6138;
  id v15 = v14;
  id v24 = v15;
  [v12 enumerateKeysAndObjectsUsingBlock:&v20];
  v16 = [NSNumber numberWithInteger:v35[3]];
  [v15 appendFormat:@"Overall record count: %@\n", v16, v20, v21, v22, v23];

  [v15 appendString:@"*********************\n"];
  uint64_t v17 = v24;
  id v18 = v15;

  _Block_object_dispose(&v34, 8);
  return v18;
}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 65);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v8 descriptionWithDetailedOutput:v6 includeItem:v7];
  [v5 appendString:v10];

  uint64_t v11 = [v8 count];
  id v12 = *(void **)(a1 + 40);
  id v13 = [NSNumber numberWithInteger:v11];
  [v12 setObject:v13 forKey:v9];

  id v14 = *(void **)(a1 + 48);
  id v15 = [v8 countByZoneID];

  [v14 setObject:v15 forKey:v9];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v11;
}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_3;
  v7[3] = &unk_1E56E6110;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v7 zoneName];
  id v8 = [v7 ownerName];

  [v4 appendFormat:@"Number of records in database %@, zone %@ %@: %@\n", v5, v9, v8, v6];
}

uint64_t __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"Total records in database %@: %@\n", a2, a3];
}

- (int64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PKCloudRecordArray_count__block_invoke;
  v5[3] = &unk_1E56E6160;
  v5[4] = &v6;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__PKCloudRecordArray_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)addCloudRecord:(id)a3 forContainerDatabaseIdentifier:(id)a4
{
  if (a3 && a4)
  {
    cloudRecordByDatabase = self->_cloudRecordByDatabase;
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [(NSMutableDictionary *)cloudRecordByDatabase objectForKey:v7];
    if (!v9) {
      uint64_t v9 = [[PKCloudRecordArrayDatabase alloc] initWithIdentifier:v7];
    }
    uint64_t v10 = v9;
    [(NSMutableDictionary *)self->_cloudRecordByDatabase setObject:v9 forKey:v7];

    [(PKCloudRecordArrayDatabase *)v10 addCloudRecord:v8];
  }
}

- (void)applyCloudRecordArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 cloudRecordByDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke;
  v9[3] = &unk_1E56E6188;
  v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v6 = [v4 reportItemsByAccountIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke_2;
  v8[3] = &unk_1E56E61B0;
  v8[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  uint64_t v7 = [v4 recordsFetchedCount];
  self->_recordsFetchedCount += v7;
}

void __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v8];
  if (v6)
  {
    id v7 = v6;
    [v6 applyCloudRecordDatabase:v5];
  }
  else
  {
    id v7 = v5;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKey:v8];
}

uint64_t __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addTransactionSyncReportItems:a3 forAccountIdentifier:a2];
}

- (void)addTransactionSyncReportItem:(id)a3 forAccountIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      id v10 = a3;
      uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = a4;
      id v8 = a3;
      uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

      -[PKCloudRecordArray addTransactionSyncReportItems:forAccountIdentifier:](self, "addTransactionSyncReportItems:forAccountIdentifier:", v9, v7, v10, v11);
    }
  }
}

- (void)addTransactionSyncReportItems:(id)a3 forAccountIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && [v8 count])
  {
    id v7 = [(NSMutableDictionary *)self->_reportItemsByAccountIdentifier objectForKey:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_reportItemsByAccountIdentifier setObject:v7 forKey:v6];
    }
    [v7 addObjectsFromArray:v8];
  }
}

- (void)addCountToRecordsFetched:(int64_t)a3
{
  self->_recordsFetchedCount += a3;
}

- (id)allItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__PKCloudRecordArray_allItems__block_invoke;
  v8[3] = &unk_1E56E6188;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __30__PKCloudRecordArray_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allItems];
  [v3 addObjectsFromArray:v4];
}

- (id)allObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PKCloudRecordArray_allObjects__block_invoke;
  v8[3] = &unk_1E56E6188;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __32__PKCloudRecordArray_allObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (id)allObjectsByDatabaseIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKCloudRecordArray_allObjectsByDatabaseIdentifier__block_invoke;
  v7[3] = &unk_1E56E6188;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __52__PKCloudRecordArray_allObjectsByDatabaseIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allObjects];
  [v4 setObject:v6 forKey:v5];
}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __47__PKCloudRecordArray_allRecordsWithRecordType___block_invoke;
  id v14 = &unk_1E56E61D8;
  id v15 = v5;
  id v16 = v4;
  id v7 = v4;
  id v8 = v5;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __47__PKCloudRecordArray_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordsWithRecordType:*(void *)(a1 + 40)];
  [v3 unionSet:v4];
}

- (id)allRecordNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PKCloudRecordArray_allRecordNames__block_invoke;
  v8[3] = &unk_1E56E6188;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __36__PKCloudRecordArray_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordNames];
  [v3 unionSet:v4];
}

- (id)allRecordIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PKCloudRecordArray_allRecordIDs__block_invoke;
  v8[3] = &unk_1E56E6188;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)cloudRecordByDatabase enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __34__PKCloudRecordArray_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordIDs];
  [v3 unionSet:v4];
}

- (id)transactionSyncReportItemsByAccountIdentifier
{
  return self->_reportItemsByAccountIdentifier;
}

- (int64_t)recordsFetchedCount
{
  return self->_recordsFetchedCount;
}

- (NSMutableDictionary)cloudRecordByDatabase
{
  return self->_cloudRecordByDatabase;
}

- (void)setCloudRecordByDatabase:(id)a3
{
}

- (NSMutableDictionary)reportItemsByAccountIdentifier
{
  return self->_reportItemsByAccountIdentifier;
}

- (void)setReportItemsByAccountIdentifier:(id)a3
{
}

- (void)setRecordsFetchedCount:(int64_t)a3
{
  self->_recordsFetchedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportItemsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudRecordByDatabase, 0);
}

@end