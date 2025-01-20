@interface MLITDBGeniusDatabase
+ (id)sharedGeniusDatabase;
- (BOOL)_copyBlobData:(id *)a3 blobAllocType:(int)a4 table:(id)a5 blobColumn:(id)a6 where:(id)a7;
- (BOOL)_hasAnySongs;
- (BOOL)_hasRowsInTable:(id)a3;
- (BOOL)_readBlobForRowID:(unint64_t)a3 intoData:(id)a4 table:(const char *)a5 blobColumn:(const char *)a6;
- (BOOL)_readBlobIntoData:(id)a3 table:(id)a4 blobColumn:(id)a5 where:(id)a6;
- (BOOL)getGeniusConfigrationDataAndBytesIntoData:(id)a3;
- (BOOL)getGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4;
- (BOOL)getGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4;
- (BOOL)hasGeniusDataAvailable;
- (BOOL)hasGeniusFeatureEnabled;
- (ML3MusicLibrary)musicLibrary;
- (MLITDBGeniusDatabase)init;
- (id)_copyBlobDataAndBytesInTable:(id)a3 blobColumn:(id)a4 where:(id)a5;
- (id)copyGeniusConfigrationDataAndBytes;
- (id)copyGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3;
- (id)copyGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3;
- (unint64_t)_getInt64ValueInTable:(id)a3 column:(id)a4 where:(id)a5 limit:(unsigned int)a6;
- (unint64_t)defaultMinTrackCount;
- (unint64_t)defaultTrackCount;
- (unsigned)_getInt32ValueInTable:(id)a3 column:(id)a4;
- (unsigned)geniusConfigurationVersion;
- (void)performGeniusDatabaseReadWithBlock:(id)a3;
@end

@implementation MLITDBGeniusDatabase

- (BOOL)getGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4
{
  return [(MLITDBGeniusDatabase *)self _readBlobForRowID:a3 intoData:a4 table:"genius_similarities" blobColumn:"data"];
}

- (BOOL)getGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4
{
  return [(MLITDBGeniusDatabase *)self _readBlobForRowID:a3 intoData:a4 table:"genius_metadata" blobColumn:"data"];
}

- (BOOL)getGeniusConfigrationDataAndBytesIntoData:(id)a3
{
  return [(MLITDBGeniusDatabase *)self _readBlobIntoData:a3 table:@"genius_config" blobColumn:@"data" where:0];
}

- (id)copyGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"genius_id = %llu", a3);
  id v5 = [(MLITDBGeniusDatabase *)self _copyBlobDataAndBytesInTable:@"genius_similarities" blobColumn:@"data" where:v4];

  return v5;
}

- (id)copyGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"genius_id = %llu", a3);
  id v5 = [(MLITDBGeniusDatabase *)self _copyBlobDataAndBytesInTable:@"genius_metadata" blobColumn:@"data" where:v4];

  return v5;
}

- (unsigned)geniusConfigurationVersion
{
  return [(MLITDBGeniusDatabase *)self _getInt32ValueInTable:@"genius_config" column:@"version"];
}

- (id)copyGeniusConfigrationDataAndBytes
{
  return [(MLITDBGeniusDatabase *)self _copyBlobDataAndBytesInTable:@"genius_config" blobColumn:@"data" where:0];
}

- (unint64_t)defaultTrackCount
{
  LODWORD(result) = [(MLITDBGeniusDatabase *)self _getInt32ValueInTable:@"genius_config" column:@"default_num_results"];
  if (result) {
    return result;
  }
  else {
    return 25;
  }
}

- (unint64_t)defaultMinTrackCount
{
  LODWORD(result) = [(MLITDBGeniusDatabase *)self _getInt32ValueInTable:@"genius_config" column:@"min_num_results"];
  if (result) {
    return result;
  }
  else {
    return 2;
  }
}

- (BOOL)hasGeniusFeatureEnabled
{
  return [(MLITDBGeniusDatabase *)self _hasRowsInTable:@"genius_config"];
}

- (BOOL)hasGeniusDataAvailable
{
  BOOL v3 = [(MLITDBGeniusDatabase *)self _hasAnySongs];
  if (v3)
  {
    LOBYTE(v3) = [(MLITDBGeniusDatabase *)self _hasRowsInTable:@"genius_metadata"];
  }
  return v3;
}

- (BOOL)_hasAnySongs
{
  BOOL v3 = +[ML3BitMaskPredicate predicateWithProperty:@"media_type" mask:1032 value:8];
  v4 = [(MLITDBGeniusDatabase *)self musicLibrary];
  id v5 = +[ML3Entity queryWithLibrary:v4 predicate:v3 orderingTerms:0];
  char v6 = [v5 hasEntities];

  return v6;
}

- (BOOL)_readBlobForRowID:(unint64_t)a3 intoData:(id)a4 table:(const char *)a5 blobColumn:(const char *)a6
{
  id v10 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MLITDBGeniusDatabase__readBlobForRowID_intoData_table_blobColumn___block_invoke;
  v13[3] = &unk_1E5FB56F0;
  v16 = a5;
  v17 = a6;
  unint64_t v18 = a3;
  id v11 = v10;
  id v14 = v11;
  v15 = &v19;
  [(MLITDBGeniusDatabase *)self performGeniusDatabaseReadWithBlock:v13];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

void __68__MLITDBGeniusDatabase__readBlobForRowID_intoData_table_blobColumn___block_invoke(void *a1, void *a2)
{
  BOOL v3 = NSString;
  uint64_t v4 = a1[6];
  id v5 = a2;
  char v6 = [v3 stringWithUTF8String:v4];
  v7 = [NSString stringWithUTF8String:a1[7]];
  id v8 = [v5 openBlobInTable:v6 column:v7 row:a1[8] readOnly:1];

  if (v8) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(v8, "readData:numberOfBytes:offset:", a1[4], objc_msgSend(v8, "length"), 0) == 0;
  }
}

- (BOOL)_readBlobIntoData:(id)a3 table:(id)a4 blobColumn:(id)a5 where:(id)a6
{
  id v13 = a3;
  id v10 = a3;
  LOBYTE(a6) = [(MLITDBGeniusDatabase *)self _copyBlobData:&v13 blobAllocType:1 table:a4 blobColumn:a5 where:a6];
  id v11 = v13;

  return (char)a6;
}

- (id)_copyBlobDataAndBytesInTable:(id)a3 blobColumn:(id)a4 where:(id)a5
{
  id v7 = 0;
  [(MLITDBGeniusDatabase *)self _copyBlobData:&v7 blobAllocType:0 table:a3 blobColumn:a4 where:a5];
  id v5 = v7;

  return v5;
}

- (BOOL)_copyBlobData:(id *)a3 blobAllocType:(int)a4 table:(id)a5 blobColumn:(id)a6 where:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if ([v12 length]) {
    id v13 = (__CFString *)[[NSString alloc] initWithFormat:@" WHERE %@", v12];
  }
  else {
    id v13 = &stru_1F08D4D70;
  }
  id v14 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@%@ LIMIT 1", v11, v10, v13];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__12527;
  v36[4] = __Block_byref_object_dispose__12528;
  if (a3) {
    id v15 = *a3;
  }
  else {
    id v15 = 0;
  }
  id v37 = v15;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__12527;
  v34[4] = __Block_byref_object_dispose__12528;
  id v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__12527;
  v32 = __Block_byref_object_dispose__12528;
  id v33 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke;
  v21[3] = &unk_1E5FB56C8;
  id v16 = v14;
  id v22 = v16;
  v23 = v34;
  int v27 = a4;
  v24 = v36;
  v25 = &v38;
  v26 = &v28;
  [(MLITDBGeniusDatabase *)self performGeniusDatabaseReadWithBlock:v21];
  if (a3) {
    *a3 = (id) v29[5];
  }
  char v17 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v17;
}

void __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 executeQuery:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke_2;
  v5[3] = &unk_1E5FB77B8;
  v5[4] = *(void *)(a1 + 40);
  [v3 enumerateRowsWithBlock:v5];
  int v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else if (!v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                           + 40) != 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

uint64_t __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 dataForColumnIndex:0];

  return MEMORY[0x1F41817F8]();
}

- (unint64_t)_getInt64ValueInTable:(id)a3 column:(id)a4 where:(id)a5 limit:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6) {
    id v13 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" LIMIT %d", v6);
  }
  else {
    id v13 = &stru_1F08D4D70;
  }
  if ([v12 length]) {
    id v14 = (__CFString *)[[NSString alloc] initWithFormat:@" WHERE %@", v12];
  }
  else {
    id v14 = &stru_1F08D4D70;
  }
  id v15 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@%@%@", v11, v10, v14, v13];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke;
  v19[3] = &unk_1E5FB7640;
  id v16 = v15;
  id v20 = v16;
  uint64_t v21 = &v22;
  [(MLITDBGeniusDatabase *)self performGeniusDatabaseReadWithBlock:v19];
  unint64_t v17 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 executeQuery:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke_2;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = *(void *)(a1 + 40);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64ForColumnIndex:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unsigned)_getInt32ValueInTable:(id)a3 column:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  id v8 = [NSString stringWithFormat:@"SELECT %@ FROM %@ LIMIT 1", v7, v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke;
  v11[3] = &unk_1E5FB7640;
  id v9 = v8;
  id v12 = v9;
  id v13 = &v14;
  [(MLITDBGeniusDatabase *)self performGeniusDatabaseReadWithBlock:v11];
  LODWORD(self) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return self;
}

void __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 executeQuery:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke_2;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = *(void *)(a1 + 40);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 intForColumnIndex:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)_hasRowsInTable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [NSString stringWithFormat:@"SELECT COUNT() FROM %@ LIMIT 1", v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke;
  v8[3] = &unk_1E5FB7640;
  id v6 = v5;
  id v9 = v6;
  id v10 = &v11;
  [(MLITDBGeniusDatabase *)self performGeniusDatabaseReadWithBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 executeQuery:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke_2;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = *(void *)(a1 + 40);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend(a2, "intForColumnIndex:");
    *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = (int)result > 0;
  }
  return result;
}

- (void)performGeniusDatabaseReadWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MLITDBGeniusDatabase *)self musicLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MLITDBGeniusDatabase_performGeniusDatabaseReadWithBlock___block_invoke;
  v7[3] = &unk_1E5FB56A0;
  id v8 = v4;
  id v6 = v4;
  [v5 databaseConnectionAllowingWrites:0 withBlock:v7];
}

uint64_t __59__MLITDBGeniusDatabase_performGeniusDatabaseReadWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ML3MusicLibrary)musicLibrary
{
  return +[ML3MusicLibrary autoupdatingSharedLibrary];
}

- (MLITDBGeniusDatabase)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLITDBGeniusDatabase;
  return [(MLITDBGeniusDatabase *)&v3 init];
}

+ (id)sharedGeniusDatabase
{
  v2 = (void *)sharedGeniusDatabase_instance;
  if (!sharedGeniusDatabase_instance)
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    id v4 = (void *)sharedGeniusDatabase_instance;
    sharedGeniusDatabase_instance = (uint64_t)v3;

    v2 = (void *)sharedGeniusDatabase_instance;
  }

  return v2;
}

@end