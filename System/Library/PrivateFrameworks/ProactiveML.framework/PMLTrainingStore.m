@interface PMLTrainingStore
+ (BOOL)_runQueries:(id)a3 andUpdateVersionTo:(unsigned int)a4 inTransactionOnDb:(id)a5 forStore:(id)a6;
+ (double)lastUsedTimestampLimit;
+ (id)_sessionDataToBatchWithNumberOfColumns:(unint64_t)a3 rowsData:(id)a4 labelsData:(id)a5;
+ (id)getSchema:(unint64_t *)a3;
+ (id)inMemoryStoreForTesting;
+ (int64_t)_migrate:(id)a3 forStore:(id)a4;
+ (int64_t)migrate:(id)a3 to:(id)a4 forStore:(id)a5;
+ (void)setLastUsedTimestampLimit:(double)a3;
- (BOOL)_truncateDbIfCorrupted;
- (BOOL)createSnapshot:(id)a3;
- (BOOL)isDbOpen;
- (PMLTrainingStore)initWithPath:(id)a3;
- (PMLTrainingStore)initWithPath:(id)a3 allowSkipSchema:(BOOL)a4;
- (id)dbForTesting;
- (id)getSchema:(unint64_t *)a3;
- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4;
- (id)sessionDimensionsForModel:(id)a3 startingRowId:(unint64_t)a4 onlyAppleInternal:(BOOL)a5 labelFilter:(id)a6;
- (id)sessionStats;
- (id)sessionStatsForSessionDescriptor:(id)a3;
- (int64_t)_openDbIfUnlocked;
- (int64_t)_unsafeOpenDbIfUnlocked;
- (int64_t)migrateTo:(id)a3;
- (unint64_t)numberOfRowsInTable:(id)a3;
- (unint64_t)sessionDescriptorIdFor:(id)a3;
- (void)_loadBatchForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7;
- (void)_loadDataForModel:(id)a3 positiveRowId:(unint64_t)a4 negativeRowId:(unint64_t)a5 excludeItemIdsUsedWithin:(double)a6 limit:(unint64_t)a7 onlyAppleInternal:(BOOL)a8 positiveLabel:(unint64_t)a9 skew:(double)a10 block:(id)a11;
- (void)_loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labelAndStartRows:(id)a5 batchSize:(unint64_t)a6 supportPerLabel:(unint64_t)a7 block:(id)a8;
- (void)_loadDataFromLabelAndTuples:(id)a3 model:(id)a4 numberOfRows:(unint64_t)a5 numberOfColumns:(unint64_t)a6 lastUsedMax:(double)a7 block:(id)a8;
- (void)_registerUnlockHandler;
- (void)_unregisterUnlockHandler;
- (void)closeDbForTesting;
- (void)convertToBagOfIdsVectorForModel:(id)a3;
- (void)dealloc;
- (void)deleteSessionsWithBundleId:(id)a3;
- (void)deleteSessionsWithBundleId:(id)a3 domainId:(id)a4;
- (void)deleteSessionsWithBundleId:(id)a3 itemId:(id)a4;
- (void)enumerateSessionDescriptorsUsingBlock:(id)a3;
- (void)limitSessionsByLastUsedTTL:(double)a3;
- (void)limitSessionsByMaxTimesAccessed;
- (void)limitSessionsForEachLabelWithSessionDescriptor:(id)a3 totalSessionLimit:(unint64_t)a4;
- (void)limitSessionsWithSessionDescriptor:(id)a3 withLabel:(id)a4 limit:(unint64_t)a5;
- (void)loadDataForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9;
- (void)loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7;
- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 block:(id)a7;
- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9;
- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 withSkew:(double)a5 andLimit:(int)a6 block:(id)a7;
- (void)loadSessionsForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7;
- (void)logDbNotOpenEvent;
- (void)setMaxTimesAccessed:(unint64_t)a3;
- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5;
- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5 bundleId:(id)a6 domainId:(id)a7 itemIds:(id)a8 isAppleInternal:(BOOL)a9;
- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4;
- (void)vacuumDbWithDeferralBlock:(id)a3;
@end

@implementation PMLTrainingStore

void __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleIdentifier" toNSString:v3];
  [v4 bindNamedParam:":domainIdentifier" toNSString:*(void *)(a1 + 40)];
}

void __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleIdentifier" toNSString:v3];
  [v4 bindNamedParam:":itemIdentifier" toNSString:*(void *)(a1 + 40)];
}

uint64_t __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundleIdentifier" toNSString:*(void *)(a1 + 32)];
}

- (void)deleteSessionsWithBundleId:(id)a3 domainId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke;
  v14[3] = &unk_26459EE10;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke_2;
  v11[3] = &unk_26459EEB0;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsDomainIds WHERE bundleIdentifier = :bundleIdentifier AND domainIdentifier = :domainIdentifier  UNION ALL SELECT sessionId FROM sessionsDomainIds WHERE bundleIdentifier = :bundleIdentifier AND domainIdentifier >= :domainIdentifier || '.' AND domainIdentifier < :domainIdentifier || '/')" onPrep:v14 onRow:0 onError:v11];
}

- (void)deleteSessionsWithBundleId:(id)a3 itemId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke;
  v14[3] = &unk_26459EE10;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke_2;
  v11[3] = &unk_26459EEB0;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsItemIds WHERE bundleIdentifier = :bundleIdentifier AND itemIdentifier = :itemIdentifier)" onPrep:v14 onRow:0 onError:v11];
}

- (void)deleteSessionsWithBundleId:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke;
  v9[3] = &unk_26459ED28;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke_2;
  v7[3] = &unk_26459EBC0;
  id v8 = v10;
  id v6 = v10;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsItemIds WHERE bundleIdentifier = :bundleIdentifier)" onPrep:v9 onRow:0 onError:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lockStateNotificationToken, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_dbPath, 0);
}

- (void)closeDbForTesting
{
  [(_PASSqliteDatabase *)self->_db closePermanently];
  db = self->_db;
  self->_db = 0;
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = [@"SELECT count(*) FROM " stringByAppendingString:v4];
  db = self->_db;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__PMLTrainingStore_numberOfRowsInTable___block_invoke;
  v10[3] = &unk_26459ED50;
  v10[4] = &v11;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v6 onPrep:0 onRow:v10 onError:0];
  unint64_t v8 = v12[3];

  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __40__PMLTrainingStore_numberOfRowsInTable___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x263F61ED0];
}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 withSkew:(double)a5 andLimit:(int)a6 block:(id)a7
{
}

- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = NSString;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"%d", arc4random_uniform(0x2710u));
  v14[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  LOBYTE(v13) = 1;
  [(PMLTrainingStore *)self storeSession:v10 label:a4 model:v9 bundleId:@"test" domainId:@"foo" itemIds:v12 isAppleInternal:v13];
}

- (BOOL)createSnapshot:(id)a3
{
  return [(_PASSqliteDatabase *)self->_db createSnapshot:a3];
}

- (id)dbForTesting
{
  return self->_db;
}

- (void)logDbNotOpenEvent
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    db = self->_db;
    int v5 = 138412802;
    id v6 = db;
    __int16 v7 = 1024;
    int v8 = [MEMORY[0x263F61E30] isUnlocked];
    __int16 v9 = 1024;
    int v10 = [MEMORY[0x263F61E30] isClassCLocked];
    _os_log_impl(&dword_2212A0000, v3, OS_LOG_TYPE_DEFAULT, "db: %@, isUnlocked: %d, isClassCLocked: %d", (uint8_t *)&v5, 0x18u);
  }
}

- (void)setMaxTimesAccessed:(unint64_t)a3
{
  uint64_t v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_fault_impl(&dword_2212A0000, v3, OS_LOG_TYPE_FAULT, "setMaxTimesAccessed should only be called for testing.", v4, 2u);
  }
}

- (id)getSchema:(unint64_t *)a3
{
  if (getSchema___pasOnceToken417 != -1) {
    dispatch_once(&getSchema___pasOnceToken417, &__block_literal_global_304);
  }
  id v5 = (id)getSchema___pasExprOnceResult;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1067;
  v18 = __Block_byref_object_dispose__1068;
  id v19 = 0;
  id v19 = (id)objc_opt_new();
  db = self->_db;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__PMLTrainingStore_getSchema___block_invoke_2;
  v11[3] = &unk_26459F060;
  id v7 = v5;
  id v12 = v7;
  uint64_t v13 = &v14;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30__PMLTrainingStore_getSchema___block_invoke_3;
  v10[3] = &unk_26459F088;
  v10[4] = &v14;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:v11 onError:v10];
  if (a3) {
    *a3 = [(_PASSqliteDatabase *)self->_db userVersion];
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __30__PMLTrainingStore_getSchema___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  if (([v3 hasPrefix:@"CREATE TABLE integrityCheck"] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @" ");

      uint64_t v3 = (void *)v5;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
  id v6 = (unsigned __int8 *)MEMORY[0x263F61EC8];

  return *v6;
}

uint64_t __30__PMLTrainingStore_getSchema___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Error querying schema: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  return *MEMORY[0x263F61ED0];
}

void __30__PMLTrainingStore_getSchema___block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[ ]{2,}" options:0 error:0];
  v2 = (void *)getSchema___pasExprOnceResult;
  getSchema___pasExprOnceResult = v1;
}

- (BOOL)isDbOpen
{
  return [(_PASSqliteDatabase *)self->_db userVersion] != 0;
}

- (void)convertToBagOfIdsVectorForModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223C7E5C0]();
  db = self->_db;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke;
  v8[3] = &unk_26459F038;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(_PASSqliteDatabase *)db writeTransaction:v8];
}

void __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_2;
  v4[3] = &unk_26459ED28;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_3;
  v3[3] = &unk_26459F1E0;
  v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT s.id, s.sessionDescriptorId, s.covariatesIndices, s.covariatesValues FROM sessions s CROSS JOIN sessionsDescriptors sd ON s.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale", v4, v3, &__block_literal_global_299 onPrep onRow onError];
}

void __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 name];
  [v4 bindNamedParam:":name" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v6];
}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_3(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 getIntegerForColumn:0];
  id v5 = [v3 getNSDataForColumn:2];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  uint64_t v10 = [v3 getNSDataForColumn:3];
  uint64_t v11 = (void *)[v10 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  uint64_t v14 = v13;

  id v15 = v9;
  uint64_t v16 = [v15 mutableBytes];
  id v17 = v14;
  uint64_t v18 = [v17 mutableBytes];
  unint64_t v19 = [v15 length];
  if (v19 >= 4)
  {
    uint64_t v20 = 0;
    do
    {
      *(float *)(v18 + 4 * v20) = (float)*(int *)(v16 + 4 * v20);
      *(_DWORD *)(v16 + 4 * v20) = v20;
      ++v20;
    }
    while (v19 >> 2 != v20);
  }
  v21 = *(void **)(*(void *)(a1 + 32) + 16);
  v27[0] = @"covariatesIndices";
  v22 = (void *)[v15 copy];
  v27[1] = @"covariatesValues";
  v28[0] = v22;
  v23 = (void *)[v17 copy];
  v28[1] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"id = %ld", v4);
  [v21 updateTable:@"sessions" dictionary:v24 whereClause:v25 onError:&__block_literal_global_297];

  return *MEMORY[0x263F61EC8];
}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_5()
{
  return *MEMORY[0x263F61EC8];
}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_4()
{
  return *MEMORY[0x263F61EC8];
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke;
  v11[3] = &unk_26459F010;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASSqliteDatabase *)db writeTransaction:v11];
}

void __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_2;
  v11[3] = &unk_26459ED28;
  id v12 = *(id *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_3;
  v10[3] = &unk_26459ED50;
  v10[4] = &v13;
  [v2 prepAndRunQuery:@"SELECT sd.id FROM sessionsDescriptors sd CROSS JOIN lastFeaturizations lf ON lf.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale" onPrep:v11 onRow:v10 onError:&__block_literal_global_277];
  uint64_t v3 = [*(id *)(a1 + 32) sessionDescriptorIdFor:*(void *)(a1 + 40)];
  v17[0] = @"sessionDescriptorId";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v3];
  v17[1] = @"transformer";
  v18[0] = v4;
  v18[1] = *(void *)(a1 + 48);
  id v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  if (v14[3])
  {
    id v8 = [NSString alloc];
    id v9 = objc_msgSend(v8, "initWithFormat:", @"sessionDescriptorId = %lu", v14[3]);
    [v7 updateTable:@"lastFeaturizations" dictionary:v5 whereClause:v9 onError:&__block_literal_global_289];
  }
  else
  {
    [*(id *)(v6 + 16) insertIntoTable:@"lastFeaturizations" dictionary:v5];
  }

  _Block_object_dispose(&v13, 8);
}

void __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 name];
  [v4 bindNamedParam:":name" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v6];
}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x263F61ED0];
}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_287()
{
  return *MEMORY[0x263F61ED0];
}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "Failed to load last training featurization in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1067;
  v24 = __Block_byref_object_dispose__1068;
  id v25 = 0;
  db = self->_db;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke;
  v17[3] = &unk_26459EE10;
  id v18 = v6;
  id v19 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_2;
  v13[3] = &unk_26459EFE8;
  id v9 = v18;
  id v14 = v9;
  id v10 = v19;
  id v15 = v10;
  uint64_t v16 = &v20;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT sd.version, lf.transformer FROM sessionsDescriptors sd CROSS JOIN lastFeaturizations lf ON lf.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale" onPrep:v17 onRow:v13 onError:&__block_literal_global_272];
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":name" toNSString:v3];
  [v4 bindNamedParam:":locale" toNSString:*(void *)(a1 + 40)];
}

uint64_t __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_2(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 getNSStringForColumn:0];
    if (v5)
    {
      id v6 = +[PMLSessionDescriptor descriptorForName:a1[4] version:v5 locale:a1[5]];
      id v7 = [v4 getNSDataForColumn:1];
      uint64_t v8 = [MEMORY[0x263F61EA8] tupleWithFirst:v6 second:v7];
      uint64_t v9 = *(void *)(a1[6] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *MEMORY[0x263F61ED0];
    }
    else
    {
      uint64_t v13 = PML_LogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        uint64_t v16 = 0;
        _os_log_error_impl(&dword_2212A0000, v13, OS_LOG_TYPE_ERROR, "Row in sessionStats contained unexpected null value, version %@, continuing to iterate as best effort", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v11 = *MEMORY[0x263F61EC8];
    }
  }
  else
  {
    id v12 = PML_LogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_2212A0000, v12, OS_LOG_TYPE_ERROR, "Row returned in lastTrainingFeaturizationForModelName was null, continuing to iterate as best effort", (uint8_t *)&v15, 2u);
    }

    uint64_t v11 = *MEMORY[0x263F61EC8];
  }

  return v11;
}

uint64_t __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_270(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "Failed to load last training featurization in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (int64_t)migrateTo:(id)a3
{
  return +[PMLTrainingStore migrate:to:forStore:](PMLTrainingStore, "migrate:to:forStore:", self->_db, a3);
}

- (void)vacuumDbWithDeferralBlock:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PMLTrainingStore_vacuumDbWithDeferralBlock___block_invoke;
  v7[3] = &unk_26459EF70;
  id v8 = v4;
  id v6 = v4;
  [(_PASSqliteDatabase *)db vacuumWithShouldContinueBlock:v7 error:0];
}

uint64_t __46__PMLTrainingStore_vacuumDbWithDeferralBlock___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_debug_impl(&dword_2212A0000, v3, OS_LOG_TYPE_DEBUG, "%@ deallocating", buf, 0xCu);
  }

  [(PMLTrainingStore *)self _unregisterUnlockHandler];
  [(_PASSqliteDatabase *)self->_db closePermanently];
  v4.receiver = self;
  v4.super_class = (Class)PMLTrainingStore;
  [(PMLTrainingStore *)&v4 dealloc];
}

- (BOOL)_truncateDbIfCorrupted
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F61EA0] isInMemoryPath:self->_dbPath])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_super v4 = [MEMORY[0x263F61EA0] corruptionMarkerPathForPath:self->_dbPath];
    int v5 = [MEMORY[0x263F08850] defaultManager];
    int v3 = [v5 fileExistsAtPath:v4];

    if (v3)
    {
      id v6 = PML_LogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        dbPath = self->_dbPath;
        int v10 = 138412290;
        uint64_t v11 = dbPath;
        _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEFAULT, "PMLTraining db (%@) corrupted. Flushing.", (uint8_t *)&v10, 0xCu);
      }

      [MEMORY[0x263F61EA0] truncateDatabaseAtPath:self->_dbPath];
      id v8 = [MEMORY[0x263F08850] defaultManager];
      [v8 removeItemAtPath:v4 error:0];
    }
  }
  return v3;
}

- (int64_t)_unsafeOpenDbIfUnlocked
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_db) {
    return 0;
  }
  if (![MEMORY[0x263F61E30] isUnlocked]) {
    return 1;
  }
  [(PMLTrainingStore *)self _truncateDbIfCorrupted];
  for (char i = 1; ; char i = 0)
  {
    int v5 = PML_LogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      dbPath = self->_dbPath;
      *(_DWORD *)buf = 138412290;
      int v15 = dbPath;
      _os_log_debug_impl(&dword_2212A0000, v5, OS_LOG_TYPE_DEBUG, "Opening db %@.", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F61EA0] initializeDatabase:self->_dbPath withContentProtection:2 newDatabaseCreated:0 errorHandler:0];
    if (!v6) {
      break;
    }
    uint64_t v7 = (_PASSqliteDatabase *)v6;
    int64_t v2 = +[PMLTrainingStore _migrate:v6 forStore:self];
    if (!v2)
    {
      db = self->_db;
      self->_db = v7;

      [(_PASSqliteDatabase *)self->_db prepAndRunQuery:@"PRAGMA foreign_keys = ON" onPrep:0 onRow:0 onError:&__block_literal_global_258];
      [(PMLTrainingStore *)self _unregisterUnlockHandler];
      return v2;
    }
    id v8 = PML_LogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = self->_dbPath;
      *(_DWORD *)buf = 138412290;
      int v15 = v10;
      _os_log_debug_impl(&dword_2212A0000, v8, OS_LOG_TYPE_DEBUG, "Closing db %@.", buf, 0xCu);
    }

    [(_PASSqliteDatabase *)v7 closePermanently];
    if (v2 == 2)
    {
      [(PMLTrainingStore *)self _unregisterUnlockHandler];
      goto LABEL_21;
    }
    if ((i & 1) == 0 || ![(PMLTrainingStore *)self _truncateDbIfCorrupted]) {
      goto LABEL_21;
    }
  }
  uint64_t v11 = PML_LogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2212A0000, v11, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to open/initialize db.", buf, 2u);
  }

  uint64_t v7 = 0;
  int64_t v2 = 3;
LABEL_21:

  return v2;
}

uint64_t __43__PMLTrainingStore__unsafeOpenDbIfUnlocked__block_invoke()
{
  v0 = PML_LogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int64_t v2 = 0;
    _os_log_error_impl(&dword_2212A0000, v0, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to enable foreign keys support.", v2, 2u);
  }

  return *MEMORY[0x263F61ED0];
}

- (int64_t)_openDbIfUnlocked
{
  pthread_mutex_lock(&_openDbIfUnlocked_openDbMutex);
  int64_t v3 = [(PMLTrainingStore *)self _unsafeOpenDbIfUnlocked];
  pthread_mutex_unlock(&_openDbIfUnlocked_openDbMutex);
  return v3;
}

- (void)_unregisterUnlockHandler
{
  if (self->_lockStateNotificationToken)
  {
    objc_msgSend(MEMORY[0x263F61E30], "unregisterForLockStateChangeNotifications:");
    id lockStateNotificationToken = self->_lockStateNotificationToken;
    self->_id lockStateNotificationToken = 0;
  }
}

- (void)_registerUnlockHandler
{
  if (self->_lockStateNotificationToken)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PMLTrainingStore.m", 1005, @"Invalid parameter not satisfying: %@", @"!_lockStateNotificationToken" object file lineNumber description];
  }
  id location = 0;
  objc_initWeak(&location, self);
  int64_t v3 = (void *)MEMORY[0x263F61E30];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__PMLTrainingStore__registerUnlockHandler__block_invoke;
  v8[3] = &unk_26459EF48;
  objc_copyWeak(&v9, &location);
  objc_super v4 = [v3 registerForLockStateChangeNotifications:v8];
  id lockStateNotificationToken = self->_lockStateNotificationToken;
  self->_id lockStateNotificationToken = v4;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__PMLTrainingStore__registerUnlockHandler__block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_debug_impl(&dword_2212A0000, v4, OS_LOG_TYPE_DEBUG, "PMLTrainingStore notified of device lock state change to %d", (uint8_t *)v6, 8u);
  }

  if (a2 == 3 || !a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _openDbIfUnlocked];
  }
}

- (unint64_t)sessionDescriptorIdFor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke;
  v9[3] = &unk_26459EF20;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_PASSqliteDatabase *)db writeTransaction:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x263EF8340];
  int64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_2;
  v10[3] = &unk_26459ED28;
  id v11 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_3;
  v9[3] = &unk_26459ED50;
  void v9[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale" onPrep:v10 onRow:v9 onError:0];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int64_t v3 = *(void **)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v12[0] = @"name";
    int v5 = [v3 name];
    v13[0] = v5;
    v12[1] = @"version";
    id v6 = [*(id *)(a1 + 40) version];
    v13[1] = v6;
    v12[2] = @"locale";
    unint64_t v7 = [*(id *)(a1 + 40) locale];
    v13[2] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    [v4 insertIntoTable:@"sessionsDescriptors" dictionary:v8];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) lastInsertRowId];
  }
}

void __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 name];
  [v4 bindNamedParam:":name" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v7];
}

uint64_t __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x263F61ED0];
}

- (void)enumerateSessionDescriptorsUsingBlock:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__PMLTrainingStore_enumerateSessionDescriptorsUsingBlock___block_invoke_2;
  v7[3] = &unk_26459EEF8;
  id v8 = v4;
  id v6 = v4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT name, version, locale FROM sessionsDescriptors" onPrep:&__block_literal_global_231 onRow:v7 onError:0];
}

uint64_t __58__PMLTrainingStore_enumerateSessionDescriptorsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 getNSStringForColumn:0];
    id v6 = [v4 getNSStringForColumn:1];
    uint64_t v7 = [v4 getNSStringForColumn:2];
    id v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      id v9 = +[PMLSessionDescriptor descriptorForName:v5 version:v6 locale:v7];
      LOBYTE(v14) = 0;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v10 = *MEMORY[0x263F61EC8];
    }
    else
    {
      uint64_t v12 = PML_LogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412802;
        uint64_t v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl(&dword_2212A0000, v12, OS_LOG_TYPE_ERROR, "Row in enumerateSessionDescriptorsUsingBlock contained unexpected null value, name %@, version %@, locale %@, continuing to iterate as best effort", (uint8_t *)&v14, 0x20u);
      }

      uint64_t v10 = *MEMORY[0x263F61EC8];
    }
  }
  else
  {
    id v11 = PML_LogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_2212A0000, v11, OS_LOG_TYPE_ERROR, "Row returned in enumerateSessionDescriptorsUsingBlock was null, continuing to iterate as best effort", (uint8_t *)&v14, 2u);
    }

    uint64_t v10 = *MEMORY[0x263F61EC8];
  }

  return v10;
}

- (id)sessionStatsForSessionDescriptor:(id)a3
{
  id v4 = a3;
  int v5 = [(PMLTrainingStore *)self sessionStats];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)sessionStats
{
  id v3 = objc_opt_new();
  db = self->_db;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __32__PMLTrainingStore_sessionStats__block_invoke;
  v11[3] = &unk_26459ED28;
  void v11[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__PMLTrainingStore_sessionStats__block_invoke_2;
  v9[3] = &unk_26459F1E0;
  id v5 = v3;
  id v10 = v5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT mh.name, mh.version, mh.locale, s.label, count(*) FROM sessions s INNER JOIN sessionsDescriptors mh ON s.sessionDescriptorId = mh.id INNER JOIN sessionsItemIds sii ON s.id = sii.sessionId WHERE sii.timesAccessed < :timesUsedMax GROUP BY s.sessionDescriptorId, s.label ORDER BY s.sessionDescriptorId, s.label" onPrep:v11 onRow:v9 onError:&__block_literal_global_226];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":timesUsedMax" toInteger:*(void *)(*(void *)(a1 + 32) + 40)];
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 getNSStringForColumn:0];
    id v6 = [v4 getNSStringForColumn:1];
    uint64_t v7 = [v4 getNSStringForColumn:2];
    id v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      id v9 = +[PMLSessionDescriptor descriptorForName:v5 version:v6 locale:v7];
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
      if (!v10)
      {
        id v11 = *(void **)(a1 + 32);
        id v10 = objc_opt_new();
        [v11 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v12 = [v4 getIntegerForColumn:3];
      uint64_t v13 = [v4 getIntegerForColumn:4];
      int v14 = (void *)MEMORY[0x263F61EA8];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
      __int16 v16 = [NSNumber numberWithUnsignedInteger:v13];
      uint64_t v17 = [v14 tupleWithFirst:v15 second:v16];
      [v10 addObject:v17];

      uint64_t v18 = *MEMORY[0x263F61EC8];
    }
    else
    {
      uint64_t v20 = PML_LogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412802;
        v23 = v5;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v8;
        _os_log_error_impl(&dword_2212A0000, v20, OS_LOG_TYPE_ERROR, "Row in sessionStats contained unexpected null value, name %@, version %@, locale %@, continuing to iterate as best effort", (uint8_t *)&v22, 0x20u);
      }

      uint64_t v18 = *MEMORY[0x263F61EC8];
    }
  }
  else
  {
    id v19 = PML_LogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_2212A0000, v19, OS_LOG_TYPE_ERROR, "Row returned in sessionStats was null, continuing to iterate as best effort", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = *MEMORY[0x263F61EC8];
  }

  return v18;
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "Failed to load stats about sessions in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

uint64_t __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for bundleId=%@ and domainId=%@. Error: %@", (uint8_t *)&v8, 0x20u);
  }

  return *MEMORY[0x263F61ED0];
}

uint64_t __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for for bundleId=%@ and itemId=%@. Error: %@", (uint8_t *)&v8, 0x20u);
  }

  return *MEMORY[0x263F61ED0];
}

uint64_t __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for bundleId=%@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x263F61ED0];
}

- (void)limitSessionsWithSessionDescriptor:(id)a3 withLabel:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = @"label = :label AND";
  if (!v9) {
    id v10 = &stru_26D329A58;
  }
  uint64_t v11 = v10;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  __int16 v12 = (void *)[[NSString alloc] initWithFormat:@"SELECT count(*) FROM sessions WHERE %@ UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))", v11];
  db = self->_db;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke;
  v26[3] = &unk_26459EE38;
  v26[4] = self;
  id v14 = v12;
  id v27 = v14;
  id v15 = v8;
  id v28 = v15;
  id v16 = v9;
  id v29 = v16;
  v30 = &v31;
  [(_PASSqliteDatabase *)db readTransaction:v26];
  unint64_t v17 = v32[3];
  uint64_t v18 = v17 - a5;
  if (v17 >= a5)
  {
    id v19 = self->_db;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_200;
    v20[3] = &unk_26459EE88;
    v21 = v11;
    int v22 = self;
    id v23 = v15;
    id v24 = v16;
    uint64_t v25 = v18;
    [(_PASSqliteDatabase *)v19 writeTransaction:v20];
  }
  _Block_object_dispose(&v31, 8);
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2;
  v5[3] = &unk_26459EE10;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3;
  v4[3] = &unk_26459ED50;
  void v4[4] = *(void *)(a1 + 64);
  [v3 prepAndRunQuery:v2 onPrep:v5 onRow:v4 onError:&__block_literal_global_199];
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_200(uint64_t a1)
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM sessions WHERE id IN(  SELECT id FROM sessions   WHERE %@   UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))   ORDER BY RANDOM() LIMIT :limit)", *(void *)(a1 + 32)];
  id v3 = *(void **)(*(void *)(a1 + 40) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2_204;
  v6[3] = &unk_26459EE60;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 prepAndRunQuery:v2 onPrep:v6 onRow:0 onError:&__block_literal_global_207];
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2_204(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) name];
  [v7 bindNamedParam:":name" toNSString:v3];

  id v4 = [*(id *)(a1 + 32) version];
  [v7 bindNamedParam:":version" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) locale];
  [v7 bindNamedParam:":locale" toNSString:v5];

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    objc_msgSend(v7, "bindNamedParam:toInteger:", ":label", objc_msgSend(v6, "integerValue"));
  }
  [v7 bindNamedParam:":limit" toInteger:*(void *)(a1 + 48)];
}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3_205(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) name];
  [v7 bindNamedParam:":name" toNSString:v3];

  id v4 = [*(id *)(a1 + 32) version];
  [v7 bindNamedParam:":version" toNSString:v4];

  int v5 = [*(id *)(a1 + 32) locale];
  [v7 bindNamedParam:":locale" toNSString:v5];

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    objc_msgSend(v7, "bindNamedParam:toInteger:", ":label", objc_msgSend(v6, "integerValue"));
  }
}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x263F61ED0];
}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count labeled sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (void)limitSessionsByMaxTimesAccessed
{
  db = self->_db;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke;
  v3[3] = &unk_26459EDE8;
  v3[4] = self;
  [(_PASSqliteDatabase *)db writeTransaction:v3];
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_2;
  v4[3] = &unk_26459ED28;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"DELETE FROM sessions WHERE (id in (SELECT sessionId from sessionsItemIds WHERE timesAccessed >= :maxTimesAccessed))" onPrep:v4 onRow:0 onError:&__block_literal_global_190];
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":maxTimesAccessed" toInteger:*(void *)(*(void *)(a1 + 32) + 40)];
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete over used sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (void)limitSessionsByLastUsedTTL:(double)a3
{
  int v5 = objc_opt_new();
  [v5 timeIntervalSince1970];
  double v7 = v6;

  db = self->_db;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke;
  v9[3] = &unk_26459EDC0;
  void v9[4] = self;
  *(double *)&void v9[5] = v7 - a3;
  [(_PASSqliteDatabase *)db writeTransaction:v9];
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_2;
  v3[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v3[4] = *(void *)(a1 + 40);
  return [v1 prepAndRunQuery:@"DELETE FROM sessions WHERE creationTimestamp < :lastUsedExpirationDate AND (id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < :lastUsedExpirationDate))" onPrep:v3 onRow:0 onError:&__block_literal_global_184];
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":lastUsedExpirationDate" toDouble:*(double *)(a1 + 32)];
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete unused sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (void)limitSessionsForEachLabelWithSessionDescriptor:(id)a3 totalSessionLimit:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  db = self->_db;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke;
  v33[3] = &unk_26459ED78;
  v33[4] = self;
  uint64_t v34 = @"SELECT count(*) FROM sessions WHERE sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) ";
  id v8 = v6;
  id v35 = v8;
  v36 = &v37;
  [(_PASSqliteDatabase *)db readTransaction:v33];
  if (v38[3] >= a4)
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1067;
    uint64_t v31 = __Block_byref_object_dispose__1068;
    id v32 = 0;
    id v32 = (id)objc_opt_new();
    uint64_t v9 = self->_db;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_172;
    v23[3] = &unk_26459ED78;
    v23[4] = self;
    id v24 = @"SELECT DISTINCT label FROM sessions WHERE UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))";
    id v10 = v8;
    id v25 = v10;
    __int16 v26 = &v27;
    [(_PASSqliteDatabase *)v9 readTransaction:v23];
    unint64_t v11 = a4;
    if ((unint64_t)[(id)v28[5] count] >= 2) {
      unint64_t v11 = (a4 / ([(id)v28[5] count] - 1)) >> 1;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = (id)v28[5];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      unint64_t v15 = a4 >> 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v17, "integerValue", (void)v19)) {
            unint64_t v18 = v11;
          }
          else {
            unint64_t v18 = v15;
          }
          [(PMLTrainingStore *)self limitSessionsWithSessionDescriptor:v10 withLabel:v17 limit:v18];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v41 count:16];
      }
      while (v13);
    }

    _Block_object_dispose(&v27, 8);
  }

  _Block_object_dispose(&v37, 8);
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2;
  v5[3] = &unk_26459ED28;
  id v6 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3;
  v4[3] = &unk_26459ED50;
  void v4[4] = *(void *)(a1 + 56);
  [v3 prepAndRunQuery:v2 onPrep:v5 onRow:v4 onError:&__block_literal_global_167];
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_172(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2_173;
  v5[3] = &unk_26459ED28;
  id v6 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3_174;
  v4[3] = &unk_26459ED50;
  void v4[4] = *(void *)(a1 + 56);
  [v3 prepAndRunQuery:v2 onPrep:v5 onRow:v4 onError:&__block_literal_global_177];
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2_173(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 name];
  [v4 bindNamedParam:":name" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v7];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3_174(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumn:", 0));
  [v2 addObject:v3];

  return *MEMORY[0x263F61EC8];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_4_175(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count labeled sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 name];
  [v4 bindNamedParam:":name" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v7];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x263F61ED0];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PML_LogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_2212A0000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count total sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x263F61ED0];
}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 block:(id)a7
{
}

- (void)_loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labelAndStartRows:(id)a5 batchSize:(unint64_t)a6 supportPerLabel:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  db = self->_db;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke;
  v21[3] = &unk_26459ED00;
  double v26 = a4;
  id v22 = v15;
  id v23 = self;
  unint64_t v27 = a6;
  unint64_t v28 = a7;
  id v24 = v14;
  id v25 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  [(_PASSqliteDatabase *)db writeTransaction:v21];
}

void __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 timeIntervalSince1970];
  double v4 = v3;

  double v5 = v4 - *(double *)(a1 + 64);
  id v6 = objc_opt_new();
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  unint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = *(void *)(a1 + 72);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_2;
  v20[3] = &unk_26459ECB0;
  double v25 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(a1 + 48);
  void v20[4] = *(void *)(a1 + 40);
  id v21 = v8;
  id v23 = &v31;
  id v24 = &v27;
  uint64_t v26 = *(void *)(a1 + 80);
  id v9 = v6;
  id v22 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];
  if (v28[3] || ![v9 count])
  {
    char v17 = 1;
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = v32[3];
    id v12 = objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, void, void *, void, char *))(v10 + 16))(v10, v11, MEMORY[0x263EFFA68], v12, MEMORY[0x263EFFA78], &v17);
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = v32[3];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_3;
    void v18[3] = &unk_26459ECD8;
    id v19 = *(id *)(a1 + 56);
    [v13 _loadDataFromLabelAndTuples:v9 model:v14 numberOfRows:v15 numberOfColumns:v16 lastUsedMax:v18 block:v5];
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

void __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND label = %lu AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) ", objc_msgSend(v19, "unsignedIntegerValue"), *(void *)(a1 + 72), *(void *)(*(void *)(a1 + 32) + 40));
  id v9 = objc_msgSend(*(id *)(a1 + 32), "sessionDimensionsForModel:startingRowId:onlyAppleInternal:labelFilter:", *(void *)(a1 + 40), objc_msgSend(v7, "unsignedIntegerValue"), 0, v8);
  uint64_t v10 = [v9 objectForKeyedSubscript:@"numberOfColumns"];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 unsignedIntegerValue];

  uint64_t v11 = [v9 objectForKeyedSubscript:@"numberOfRows"];
  unint64_t v12 = [v11 unsignedIntegerValue];

  unint64_t v13 = *(void *)(a1 + 80);
  if (v12) {
    BOOL v14 = v12 >= v13;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    if (!v13) {
      unint64_t v13 = v12;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v16 = *(void *)(v15 + 24);
    if (v13 >= v16) {
      unint64_t v17 = *(void *)(v15 + 24);
    }
    else {
      unint64_t v17 = v13;
    }
    *(void *)(v15 + 24) = v16 - v17;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      *a4 = 1;
    }
    id v18 = +[PMLLabelLimitRowId labelLimitRowIdWithLabel:limit:rowId:](PMLLabelLimitRowId, "labelLimitRowIdWithLabel:limit:rowId:", v8, v17, [v7 unsignedIntegerValue]);
    [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v19];
  }
}

uint64_t __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loadBatchForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  double v25 = (void (**)(id, uint64_t, uint64_t, uint64_t, unsigned char *))a7;
  uint64_t v15 = objc_opt_new();
  [v15 timeIntervalSince1970];
  double v17 = v16;

  v52[0] = 0;
  id v18 = objc_opt_new();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1067;
  v50 = __Block_byref_object_dispose__1068;
  id v51 = 0;
  id v51 = (id)objc_opt_new();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__1067;
  v43 = __Block_byref_object_dispose__1068;
  id v44 = 0;
  SEL v19 = a2;
  id v44 = (id)objc_opt_new();
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  if (a6)
  {
    uint64_t v20 = 0;
    do
    {
      id v21 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v25);
      [v18 setObject:v21 atIndexedSubscript:v20];

      ++v20;
    }
    while (a6 != v20);
  }
  db = self->_db;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
  v29[3] = &unk_26459EC60;
  unint64_t v33 = a6;
  double v34 = v17 - a4;
  id v30 = v13;
  uint64_t v31 = self;
  id v23 = v14;
  id v32 = v23;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_2;
  void v28[3] = &unk_26459EC88;
  v28[4] = self;
  v28[5] = &v35;
  v28[6] = &v46;
  v28[7] = v45;
  v28[8] = &v39;
  v28[9] = v19;
  v28[10] = a6;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_158;
  v26[3] = &unk_26459EBC0;
  id v24 = v30;
  id v27 = v24;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT sessions.id, sessions.label, sessions.covariatesLength, sessions.covariatesIndices, sessions.covariatesValues, sessionsItemIds.timesAccessed FROM sessions JOIN sessionsItemIds ON sessions.id = sessionsItemIds.sessionId AND sessions.sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND sessionsItemIds.lastUsed <= :lastUsedMax AND sessionsItemIds.timesAccessed < :timesUsedMax AND sessions.label IN _pas_nsarray(:labels) ORDER BY RANDOM() limit :limit" onPrep:v29 onRow:v28 onError:v26];
  v25[2](v25, v36[3], v40[5], v47[5], v52);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);
}

void __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v7 = a2;
  double v4 = [v3 name];
  [v7 bindNamedParam:":name" toNSString:v4];

  double v5 = [*(id *)(a1 + 32) version];
  [v7 bindNamedParam:":version" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) locale];
  [v7 bindNamedParam:":locale" toNSString:v6];

  [v7 bindNamedParam:":limit" toInteger:*(void *)(a1 + 56)];
  [v7 bindNamedParam:":lastUsedMax" toDouble:*(double *)(a1 + 64)];
  [v7 bindNamedParam:":timesUsedMax" toInteger:*(void *)(*(void *)(a1 + 40) + 40)];
  [v7 bindNamedParam:":labels" toNSArray:*(void *)(a1 + 48)];
}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_2(void *a1, void *a2)
{
  v43[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 getIntegerForColumn:0];
  uint64_t v5 = [v3 getIntegerForColumn:5];
  id v6 = *(void **)(a1[4] + 16);
  v42[0] = @"lastUsed";
  id v7 = NSNumber;
  id v8 = objc_opt_new();
  [v8 timeIntervalSince1970];
  double v10 = v9;

  uint64_t v11 = [v7 numberWithDouble:v10];
  v42[1] = @"timesAccessed";
  v43[0] = v11;
  unint64_t v12 = [NSNumber numberWithUnsignedInteger:v5 + 1];
  v43[1] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"sessionId = %ld", v4);
  [v6 updateTable:@"sessionsItemIds" dictionary:v13 whereClause:v14 onError:&__block_literal_global_157];

  uint64_t v15 = [v3 getIntegerForColumn:1];
  unint64_t v16 = [v3 getIntegerForColumn:2];
  double v17 = [v3 getNSDataForColumn:3];
  id v18 = [v3 getNSDataForColumn:4];
  unint64_t v19 = [v17 length];
  unint64_t v20 = v19 >> 2;
  if (v19 >> 2 != (unint64_t)[v18 length] >> 2)
  {
    uint64_t v29 = PML_LogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v37 = v4;
      __int16 v38 = 2048;
      uint64_t v39 = [v17 length];
      __int16 v40 = 2048;
      uint64_t v41 = [v18 length];
      _os_log_error_impl(&dword_2212A0000, v29, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", v4, objc_msgSend(v17, "length"), objc_msgSend(v18, "length"));
    goto LABEL_15;
  }
  uint64_t v21 = *(void *)(a1[5] + 8);
  uint64_t v22 = *(void *)(v21 + 24);
  if (!v22)
  {
    *(void *)(v21 + 24) = v16;
    uint64_t v22 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  if (v16 != v22)
  {
    id v30 = PML_LogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(*(void *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 134218496;
      uint64_t v37 = v4;
      __int16 v38 = 2048;
      uint64_t v39 = v34;
      __int16 v40 = 2048;
      uint64_t v41 = v16;
      _os_log_error_impl(&dword_2212A0000, v30, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", buf, 0x20u);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", v4, *(void *)(*(void *)(a1[5] + 8) + 24), v16 format];
LABEL_15:
    unint64_t v28 = (unsigned __int8 *)MEMORY[0x263F61ED0];
    goto LABEL_16;
  }
  if (v19 >= 4)
  {
    uint64_t v33 = 0;
    if (v20 <= 1) {
      unint64_t v20 = 1;
    }
    do
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v17, "getBytes:range:", buf, v33, 4);
      if ((*(_DWORD *)buf & 0x80000000) != 0 || v16 <= *(int *)buf)
      {
        uint64_t v35 = [MEMORY[0x263F08690] currentHandler];
        [v35 handleFailureInMethod:a1[9], a1[4], @"PMLTrainingStore.m", 623, @"Invalid session from db (row id %lu): idx %d out of bounds [0, %lu." object file lineNumber description], v4, *(unsigned int *)buf, v16);
      }
      v33 += 4;
      --v20;
    }
    while (v20);
  }
  id v23 = [NSNumber numberWithInteger:v15];
  [v23 floatValue];
  int v25 = v24;

  *(_DWORD *)buf = v25;
  [*(id *)(*(void *)(a1[6] + 8) + 40) appendBytes:buf length:4];
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  uint64_t v26 = *(void **)(*(void *)(a1[8] + 8) + 40);
  id v27 = [MEMORY[0x263F61EA8] tupleWithFirst:v17 second:v18];
  [v26 addObject:v27];

  if (*(void *)(*(void *)(a1[7] + 8) + 24) == a1[10]) {
    unint64_t v28 = (unsigned __int8 *)MEMORY[0x263F61ED0];
  }
  else {
    unint64_t v28 = (unsigned __int8 *)MEMORY[0x263F61EC8];
  }
LABEL_16:
  uint64_t v31 = *v28;

  return v31;
}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Failed to load sessions for model %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x263F61ED0];
}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_3()
{
  return *MEMORY[0x263F61EC8];
}

- (void)_loadDataForModel:(id)a3 positiveRowId:(unint64_t)a4 negativeRowId:(unint64_t)a5 excludeItemIdsUsedWithin:(double)a6 limit:(unint64_t)a7 onlyAppleInternal:(BOOL)a8 positiveLabel:(unint64_t)a9 skew:(double)a10 block:(id)a11
{
  id v18 = a3;
  id v19 = a11;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__1067;
  v39[4] = __Block_byref_object_dispose__1068;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  *(double *)&v36[3] = a10;
  db = self->_db;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
  v24[3] = &unk_26459EC38;
  double v30 = a6;
  unint64_t v31 = a9;
  v24[4] = self;
  id v21 = v18;
  BOOL v35 = a8;
  unint64_t v33 = a5;
  unint64_t v34 = a7;
  id v25 = v21;
  id v27 = v36;
  unint64_t v28 = v39;
  unint64_t v32 = a4;
  id v22 = v19;
  id v26 = v22;
  uint64_t v29 = v37;
  [(_PASSqliteDatabase *)db writeTransaction:v24];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

void __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(uint64_t a1)
{
  v50[2] = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  [v2 timeIntervalSince1970];
  double v4 = v3;

  double v5 = v4 - *(double *)(a1 + 80);
  uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND sessions.label = %lu AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) ", *(void *)(a1 + 88), *(void *)&v5, *(void *)(*(void *)(a1 + 32) + 40));
  int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND sessions.label = 0 AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) ", *(void *)&v5, *(void *)(*(void *)(a1 + 32) + 40));
  id v44 = (void *)v6;
  uint64_t v8 = [*(id *)(a1 + 32) sessionDimensionsForModel:*(void *)(a1 + 40) startingRowId:*(void *)(a1 + 96) onlyAppleInternal:*(unsigned __int8 *)(a1 + 120) labelFilter:v6];
  __int16 v9 = [*(id *)(a1 + 32) sessionDimensionsForModel:*(void *)(a1 + 40) startingRowId:*(void *)(a1 + 104) onlyAppleInternal:*(unsigned __int8 *)(a1 + 120) labelFilter:v7];
  id v10 = [v8 objectForKeyedSubscript:@"numberOfColumns"];
  uint64_t v11 = [v10 longValue];

  unint64_t v12 = [v9 objectForKeyedSubscript:@"numberOfColumns"];
  uint64_t v13 = [v12 longValue];

  if (v11 <= v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v11;
  }
  uint64_t v15 = [v8 objectForKeyedSubscript:@"numberOfRows"];
  uint64_t v16 = [v15 longValue];

  double v17 = [v9 objectForKeyedSubscript:@"numberOfRows"];
  uint64_t v18 = [v17 longValue];

  unint64_t v19 = *(void *)(a1 + 112);
  if (v19 && v16 >= 3 && v18 + v16 >= v19 && v18 >= 3)
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    double v21 = *(double *)(v20 + 24);
    if (v21 == 0.0) {
      double v21 = (float)((float)v16 / (float)((float)v16 + (float)v18));
    }
    *(double *)(v20 + 24) = v21;
    int64_t v22 = llround(*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) * (double)v19);
    uint64_t v23 = v19 - v22;
    if (v16 >= v22 && v18 >= v23) {
      goto LABEL_21;
    }
    if (v16 >= v22)
    {
      if (v18 + 1 >= v23)
      {
        int64_t v22 = v19 - v18;
        uint64_t v23 = v18;
        goto LABEL_21;
      }
    }
    else if (v16 + 1 >= v22)
    {
      uint64_t v23 = v19 - v16;
      int64_t v22 = v16;
LABEL_21:
      v36 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
      v49[0] = &unk_26D336260;
      uint64_t v37 = +[PMLLabelLimitRowId labelLimitRowIdWithLabel:v7 limit:v23 rowId:*(void *)(a1 + 104)];
      v49[1] = v36;
      v50[0] = v37;
      char v38 = +[PMLLabelLimitRowId labelLimitRowIdWithLabel:v44 limit:v22 rowId:*(void *)(a1 + 96)];
      v50[1] = v38;
      uint64_t v39 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];

      id v40 = *(void **)(a1 + 32);
      uint64_t v41 = *(void *)(a1 + 40);
      uint64_t v42 = *(void *)(a1 + 112);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke_2;
      v45[3] = &unk_26459EC10;
      id v46 = v36;
      id v47 = &unk_26D336260;
      id v48 = *(id *)(a1 + 48);
      id v43 = v36;
      [v40 _loadDataFromLabelAndTuples:v39 model:v41 numberOfRows:v42 numberOfColumns:v14 lastUsedMax:v45 block:v5];

      goto LABEL_22;
    }
  }
  id v25 = [PMLTrainingStoredSessionBatch alloc];
  id v26 = +[PMLSparseMatrix sparseMatrixWithNumberOfRows:0 numberOfColumns:v14];
  id v27 = [PMLMutableDenseVector alloc];
  unint64_t v28 = objc_opt_new();
  uint64_t v29 = [(PMLDenseVector *)v27 initWithData:v28];
  double v30 = +[PMLModelRegressor modelRegressorFromFloats:v29];
  uint64_t v31 = [(PMLTrainingStoredSessionBatch *)v25 initWithCovariates:v26 outcomes:v30];
  uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v31;

  uint64_t v34 = *(void *)(a1 + 48);
  BOOL v35 = objc_opt_new();
  (*(void (**)(uint64_t, uint64_t, void, void *, void, void, uint64_t))(v34 + 16))(v34, v14, MEMORY[0x263EFFA68], v35, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(*(void *)(a1 + 72) + 8) + 24);

LABEL_22:
}

void __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = a1[4];
  id v9 = a5;
  id v10 = a4;
  id v13 = a3;
  uint64_t v11 = [v9 objectForKeyedSubscript:v8];
  [v11 unsignedIntegerValue];

  unint64_t v12 = [v9 objectForKeyedSubscript:a1[5]];

  [v12 unsignedIntegerValue];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_loadDataFromLabelAndTuples:(id)a3 model:(id)a4 numberOfRows:(unint64_t)a5 numberOfColumns:(unint64_t)a6 lastUsedMax:(double)a7 block:(id)a8
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v15 = a4;
  uint64_t v16 = (void (**)(id, unint64_t, uint64_t, void *, uint64_t, char *))a8;
  char v62 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__1067;
  v60 = __Block_byref_object_dispose__1068;
  id v61 = 0;
  id v61 = (id)objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__1067;
  v53 = __Block_byref_object_dispose__1068;
  id v54 = 0;
  id v54 = (id)objc_opt_new();
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__1067;
  id v47 = __Block_byref_object_dispose__1068;
  id v48 = 0;
  id v48 = (id)objc_opt_new();
  if (a5)
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v27);
      [(id)v57[5] setObject:v18 atIndexedSubscript:v17];

      ++v17;
    }
    while (a5 != v17);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke;
  v33[3] = &unk_26459EBE8;
  v33[4] = self;
  id v19 = v15;
  double v39 = a7;
  id v34 = v19;
  BOOL v35 = &v49;
  SEL v40 = a2;
  unint64_t v41 = a6;
  v36 = &v56;
  uint64_t v37 = v55;
  char v38 = &v43;
  unint64_t v42 = a5;
  [v27 enumerateKeysAndObjectsUsingBlock:v33];
  uint64_t v20 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = (id)v57[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v29 + 1) + 8 * v24);
        int v28 = 0;
        objc_msgSend(v25, "floatValue", v27);
        int v28 = v26;
        [v20 appendBytes:&v28 length:4];
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v63 count:16];
    }
    while (v22);
  }

  v16[2](v16, a6, v44[5], v20, v50[5], &v62);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v56, 8);
}

void __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 label];
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"SELECT sessions.id, sessions.label, sessions.covariatesLength, sessions.covariatesIndices, sessions.covariatesValues, sessionsItemIds.timesAccessed FROM sessions JOIN sessionsItemIds ON sessions.id = sessionsItemIds.sessionId AND sessions.sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND sessionsItemIds.lastUsed <= :lastUsedMax AND sessionsItemIds.timesAccessed < :timesUsedMax AND sessions.id > :rowId %@ ORDER BY sessions.id limit :limit", v7];
  id v9 = *(void **)(*(void *)(a1 + 32) + 16);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_2;
  v24[3] = &unk_26459EB70;
  id v25 = v6;
  id v10 = *(id *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 32);
  id v26 = v10;
  uint64_t v27 = v11;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v20 = *(_OWORD *)(a1 + 48);
  void v17[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_3;
  v17[3] = &unk_26459EB98;
  void v17[4] = v11;
  id v18 = v5;
  uint64_t v22 = *(void *)(a1 + 88);
  id v19 = v25;
  long long v21 = v12;
  long long v23 = *(_OWORD *)(a1 + 96);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_140;
  v15[3] = &unk_26459EBC0;
  id v16 = *(id *)(a1 + 40);
  id v13 = v25;
  id v14 = v5;
  [v9 prepAndRunQuery:v8 onPrep:v24 onRow:v17 onError:v15];
}

void __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v7 = a2;
  objc_msgSend(v7, "bindNamedParam:toInteger:", ":rowId", objc_msgSend(v3, "rowId"));
  double v4 = [*(id *)(a1 + 40) name];
  [v7 bindNamedParam:":name" toNSString:v4];

  id v5 = [*(id *)(a1 + 40) version];
  [v7 bindNamedParam:":version" toNSString:v5];

  id v6 = [*(id *)(a1 + 40) locale];
  [v7 bindNamedParam:":locale" toNSString:v6];

  objc_msgSend(v7, "bindNamedParam:toInteger:", ":limit", objc_msgSend(*(id *)(a1 + 32), "limit"));
  [v7 bindNamedParam:":lastUsedMax" toDouble:*(double *)(a1 + 56)];
  [v7 bindNamedParam:":timesUsedMax" toInteger:*(void *)(*(void *)(a1 + 48) + 40)];
}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_3(uint64_t a1, void *a2)
{
  v44[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 getIntegerForColumn:0];
  uint64_t v5 = [v3 getIntegerForColumn:5];
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v43[0] = @"lastUsed";
  id v7 = NSNumber;
  uint64_t v8 = objc_opt_new();
  [v8 timeIntervalSince1970];
  double v10 = v9;

  uint64_t v11 = [v7 numberWithDouble:v10];
  v43[1] = @"timesAccessed";
  v44[0] = v11;
  long long v12 = [NSNumber numberWithUnsignedInteger:v5 + 1];
  v44[1] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"sessionId = %ld", v4);
  [v6 updateTable:@"sessionsItemIds" dictionary:v13 whereClause:v14 onError:&__block_literal_global];

  uint64_t v15 = [v3 getIntegerForColumn:1];
  if ([*(id *)(a1 + 40) integerValue] != v15)
  {
    long long v31 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v32 = *(void *)(a1 + 88);
    uint64_t v33 = *(void *)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 40);
    BOOL v35 = [*(id *)(a1 + 48) label];
    [v31 handleFailureInMethod:v32, v33, @"PMLTrainingStore.m", 396, @"Read label %lu while specified %@. Matcher: %@", v15, v34, v35 object file lineNumber description];
  }
  id v16 = [NSNumber numberWithLong:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v16 forKeyedSubscript:*(void *)(a1 + 40)];

  unint64_t v17 = [v3 getIntegerForColumn:2];
  id v18 = [v3 getNSDataForColumn:3];
  id v19 = [v3 getNSDataForColumn:4];
  unint64_t v20 = [v18 length];
  unint64_t v21 = v20 >> 2;
  if (v20 >> 2 != (unint64_t)[v19 length] >> 2)
  {
    id v25 = PML_LogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v38 = v4;
      __int16 v39 = 2048;
      uint64_t v40 = [v18 length];
      __int16 v41 = 2048;
      uint64_t v42 = [v19 length];
      _os_log_error_impl(&dword_2212A0000, v25, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", v4, objc_msgSend(v18, "length"), objc_msgSend(v19, "length"));
    goto LABEL_15;
  }
  if (v17 != *(void *)(a1 + 96))
  {
    id v26 = PML_LogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(a1 + 96);
      *(_DWORD *)buf = 134218496;
      uint64_t v38 = v4;
      __int16 v39 = 2048;
      uint64_t v40 = v30;
      __int16 v41 = 2048;
      uint64_t v42 = v17;
      _os_log_error_impl(&dword_2212A0000, v26, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", buf, 0x20u);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", v4, *(void *)(a1 + 96), v17 format];
LABEL_15:
    uint64_t v24 = (unsigned __int8 *)MEMORY[0x263F61ED0];
    goto LABEL_16;
  }
  if (v20 >= 4)
  {
    uint64_t v28 = 0;
    if (v21 <= 1) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = v21;
    }
    do
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v18, "getBytes:range:", buf, v28, 4);
      if ((*(_DWORD *)buf & 0x80000000) != 0 || v17 <= *(int *)buf)
      {
        v36 = [MEMORY[0x263F08690] currentHandler];
        [v36 handleFailureInMethod:*(void *)(a1 + 88), *(void *)(a1 + 32), @"PMLTrainingStore.m", 419, @"Invalid session from db (row id %lu): idx %d out of bounds [0, %lu." object file lineNumber description], v4, *(unsigned int *)buf, v17);
      }
      v28 += 4;
      --v29;
    }
    while (v29);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:*(void *)(a1 + 40) atIndexedSubscript:(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))++];
  uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  long long v23 = [MEMORY[0x263F61EA8] tupleWithFirst:v18 second:v19];
  [v22 addObject:v23];

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == *(void *)(a1 + 104)) {
    uint64_t v24 = (unsigned __int8 *)MEMORY[0x263F61ED0];
  }
  else {
    uint64_t v24 = (unsigned __int8 *)MEMORY[0x263F61EC8];
  }
LABEL_16:

  return *v24;
}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Failed to load sessions for model %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x263F61ED0];
}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_4()
{
  return *MEMORY[0x263F61EC8];
}

- (id)sessionDimensionsForModel:(id)a3 startingRowId:(unint64_t)a4 onlyAppleInternal:(BOOL)a5 labelFilter:(id)a6
{
  BOOL v7 = a5;
  v34[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  long long v12 = &stru_26D329A58;
  if (v7) {
    long long v12 = @"AND isAppleInternal = 1 ";
  }
  id v13 = v12;
  id v14 = (void *)[[NSString alloc] initWithFormat:@"SELECT covariatesLength, COUNT(*) FROM sessions WHERE sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND id > :rowId %@ %@ ORDER BY id", v13, v11];
  db = self->_db;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke;
  v22[3] = &unk_26459EB20;
  unint64_t v24 = a4;
  id v16 = v10;
  id v23 = v16;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke_2;
  v21[3] = &unk_26459EB48;
  void v21[4] = &v29;
  v21[5] = &v25;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v14 onPrep:v22 onRow:v21 onError:0];
  v33[0] = @"numberOfRows";
  unint64_t v17 = [NSNumber numberWithUnsignedInteger:v26[3]];
  v33[1] = @"numberOfColumns";
  v34[0] = v17;
  id v18 = [NSNumber numberWithUnsignedInteger:v30[3]];
  v34[1] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":rowId" toInteger:v3];
  uint64_t v5 = [*(id *)(a1 + 32) name];
  [v4 bindNamedParam:":name" toNSString:v5];

  uint64_t v6 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) locale];
  [v4 bindNamedParam:":locale" toNSString:v7];
}

uint64_t __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  unint64_t v5 = [v4 getIntegerForColumn:0];
  if (v3 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  uint64_t v7 = [v4 getIntegerForColumn:1];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return *MEMORY[0x263F61EC8];
}

- (void)loadSessionsForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __91__PMLTrainingStore_loadSessionsForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
  v14[3] = &unk_26459EAD0;
  void v14[4] = self;
  id v15 = v12;
  id v13 = v12;
  [(PMLTrainingStore *)self loadDataForModel:a3 privacyBudgetRefreshPeriod:a5 labels:a6 batchSize:v14 block:a4];
}

void __91__PMLTrainingStore_loadSessionsForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() _sessionDataToBatchWithNumberOfColumns:a2 rowsData:v8 labelsData:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v15 = MEMORY[0x263EF8330];
  do
  {
    v17[0] = v15;
    v17[1] = 3221225472;
    void v17[2] = __87__PMLTrainingStore_loadDataForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
    v17[3] = &unk_26459EAF8;
    id v16 = v14;
    id v18 = v16;
    id v19 = &v20;
    [(PMLTrainingStore *)self _loadBatchForModel:v12 privacyBudgetRefreshPeriod:v13 labels:a6 batchSize:v17 block:a4];
  }
  while (*((unsigned char *)v21 + 24));
  _Block_object_dispose(&v20, 8);
}

void __87__PMLTrainingStore_loadDataForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void (**)(uint64_t, uint64_t, id, uint64_t, unsigned char *))(v9 + 16);
  id v11 = a3;
  v10(v9, a2, v11, a4, a5);
  uint64_t v12 = [v11 count];

  if (!v12 || *a5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  BOOL v11 = a6;
  id v16 = a9;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __115__PMLTrainingStore_loadSessionsForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
  void v18[3] = &unk_26459EAD0;
  void v18[4] = self;
  id v19 = v16;
  id v17 = v16;
  [(PMLTrainingStore *)self loadDataForModel:a3 excludeItemIdsUsedWithin:a5 limit:v11 onlyAppleInternal:a7 positiveLabel:v18 skew:a4 block:a8];
}

void __115__PMLTrainingStore_loadSessionsForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() _sessionDataToBatchWithNumberOfColumns:a2 rowsData:v8 labelsData:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)loadDataForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  BOOL v12 = a6;
  id v21 = a3;
  id v16 = a9;
  uint64_t v38 = 0;
  __int16 v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  do
  {
    uint64_t v18 = v39[3];
    uint64_t v19 = v35[3];
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __111__PMLTrainingStore_loadDataForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
    v22[3] = &unk_26459EAA8;
    unint64_t v24 = &v38;
    uint64_t v25 = &v34;
    id v26 = &v30;
    uint64_t v27 = v28;
    id v20 = v16;
    id v23 = v20;
    [(PMLTrainingStore *)self _loadDataForModel:v21 positiveRowId:v18 negativeRowId:v19 excludeItemIdsUsedWithin:a5 limit:v12 onlyAppleInternal:a7 positiveLabel:a4 skew:a8 block:v22];
  }
  while (*((unsigned char *)v31 + 24));
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __111__PMLTrainingStore_loadDataForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, unint64_t a5, unint64_t a6, unsigned char *a7)
{
  id v17 = a3;
  id v12 = a4;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) > a5 && *(void *)(*(void *)(a1[6] + 8) + 24) > a6
    || ![v17 count] && *(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    *a7 = 1;
LABEL_11:
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    goto LABEL_12;
  }
  uint64_t v13 = *(void *)(a1[5] + 8);
  unint64_t v14 = *(void *)(v13 + 24);
  if (v14 <= a5) {
    unint64_t v14 = a5;
  }
  *(void *)(v13 + 24) = v14;
  uint64_t v15 = *(void *)(a1[6] + 8);
  unint64_t v16 = *(void *)(v15 + 24);
  if (v16 <= a6) {
    unint64_t v16 = a6;
  }
  *(void *)(v15 + 24) = v16;
  (*(void (**)(void))(a1[4] + 16))();
  if (*a7) {
    goto LABEL_11;
  }
LABEL_12:
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
}

- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5 bundleId:(id)a6 domainId:(id)a7 itemIds:(id)a8 isAppleInternal:(BOOL)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (![MEMORY[0x263F61E28] isDNUEnabled]) {
    goto LABEL_8;
  }
  if (v16)
  {
    if (v17) {
      goto LABEL_4;
    }
LABEL_10:
    id v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PMLTrainingStore.m", 150, @"Invalid parameter not satisfying: %@", @"sessionDescriptor" object file lineNumber description];

    if (v18) {
      goto LABEL_5;
    }
LABEL_11:
    unint64_t v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PMLTrainingStore.m", 151, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    goto LABEL_5;
  }
  uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PMLTrainingStore.m", 149, @"Invalid parameter not satisfying: %@", @"covariates" object file lineNumber description];

  if (!v17) {
    goto LABEL_10;
  }
LABEL_4:
  if (!v18) {
    goto LABEL_11;
  }
LABEL_5:
  if (!v20)
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PMLTrainingStore.m", 152, @"Invalid parameter not satisfying: %@", @"itemIds" object file lineNumber description];
  }
  db = self->_db;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __87__PMLTrainingStore_storeSession_label_model_bundleId_domainId_itemIds_isAppleInternal___block_invoke;
  v26[3] = &unk_26459EA80;
  void v26[4] = self;
  id v27 = v17;
  int64_t v32 = a4;
  id v28 = v16;
  BOOL v33 = a9;
  id v29 = v19;
  id v30 = v18;
  id v31 = v20;
  [(_PASSqliteDatabase *)db writeTransaction:v26];

LABEL_8:
}

void __87__PMLTrainingStore_storeSession_label_model_bundleId_domainId_itemIds_isAppleInternal___block_invoke(uint64_t a1)
{
  v44[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) sessionDescriptorIdFor:*(void *)(a1 + 40)];
  id obja = *(id *)(*(void *)(a1 + 32) + 16);
  v43[0] = @"creationTimestamp";
  unint64_t v3 = NSNumber;
  id v4 = objc_opt_new();
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = [v3 numberWithDouble:v6];
  v44[0] = v7;
  v43[1] = @"sessionDescriptorId";
  id v8 = [NSNumber numberWithUnsignedInteger:v2];
  v44[1] = v8;
  void v43[2] = @"label";
  id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  v44[2] = v9;
  void v43[3] = @"covariatesLength";
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "length"));
  void v44[3] = v10;
  v43[4] = @"covariatesIndices";
  BOOL v11 = [*(id *)(a1 + 48) indicesData];
  v44[4] = v11;
  v43[5] = @"covariatesValues";
  id v12 = [*(id *)(a1 + 48) valuesData];
  v44[5] = v12;
  v43[6] = @"isAppleInternal";
  uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
  v44[6] = v13;
  unint64_t v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:7];
  [obja insertIntoTable:@"sessions" dictionary:v14];

  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 16) lastInsertRowId];
  id v16 = @"sessionId";
  if (*(void *)(a1 + 56))
  {
    id v17 = *(void **)(*(void *)(a1 + 32) + 16);
    v41[0] = @"sessionId";
    id v18 = [NSNumber numberWithUnsignedInteger:v15];
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 64);
    v42[0] = v18;
    v42[1] = v19;
    v41[1] = @"bundleIdentifier";
    v41[2] = @"domainIdentifier";
    void v42[2] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
    [v17 insertIntoTable:@"sessionsDomainIds" dictionary:v21];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 72);
  uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * v25);
        id v27 = *(void **)(*(void *)(a1 + 32) + 16);
        v38[0] = v16;
        [NSNumber numberWithUnsignedInteger:v15];
        v29 = id v28 = v16;
        uint64_t v30 = *(void *)(a1 + 64);
        v39[0] = v29;
        v39[1] = v30;
        v38[1] = @"bundleIdentifier";
        v38[2] = @"itemIdentifier";
        v39[2] = v26;
        v39[3] = &unk_26D336260;
        v38[3] = @"lastUsed";
        v38[4] = @"timesAccessed";
        v39[4] = &unk_26D336260;
        id v31 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
        [v27 insertIntoTable:@"sessionsItemIds" dictionary:v31];

        id v16 = v28;
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v23);
  }
}

- (PMLTrainingStore)initWithPath:(id)a3
{
  return [(PMLTrainingStore *)self initWithPath:a3 allowSkipSchema:1];
}

- (PMLTrainingStore)initWithPath:(id)a3 allowSkipSchema:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMLTrainingStore;
  id v8 = [(PMLTrainingStore *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dbPath, a3);
    v9->_allowSkipSchema = a4;
    v9->_maxTimesAccessed = 1;
    [(PMLTrainingStore *)v9 _registerUnlockHandler];
    [(PMLTrainingStore *)v9 _openDbIfUnlocked];
  }

  return v9;
}

+ (id)inMemoryStoreForTesting
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = [MEMORY[0x263F61EA0] randomlyNamedInMemoryPathWithBaseName:@"training_sessions"];
  id v4 = (void *)[v2 initWithPath:v3];

  return v4;
}

+ (void)setLastUsedTimestampLimit:(double)a3
{
  double v6 = [MEMORY[0x263F08AB0] processInfo];
  id v8 = [v6 processName];

  if (([v8 isEqualToString:@"python"] & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PMLTrainingStore.m", 1401, @"Process name %@ is not python", v8 object file lineNumber description];
  }
  kLastUsedTimestampLimit = *(void *)&a3;
}

+ (double)lastUsedTimestampLimit
{
  return *(double *)&kLastUsedTimestampLimit;
}

+ (id)getSchema:(unint64_t *)a3
{
  double v5 = [MEMORY[0x263F61EA0] randomlyNamedInMemoryPathWithBaseName:@"training_db_schema"];
  double v6 = (void *)[objc_alloc((Class)a1) initWithPath:v5 allowSkipSchema:0];
  id v7 = [v6 getSchema:a3];

  return v7;
}

+ (BOOL)_runQueries:(id)a3 andUpdateVersionTo:(unsigned int)a4 inTransactionOnDb:(id)a5 forStore:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke;
  v16[3] = &unk_26459EFC0;
  id v17 = v9;
  id v18 = v11;
  id v19 = v10;
  unsigned int v20 = a4;
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  LOBYTE(v9) = [v12 frailWriteTransaction:v16];

  return (char)v9;
}

uint64_t __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v20 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      id v8 = v7;
      id v9 = [v8 objectForKey:@"migrationFunction"];
      if (!v9) {
        break;
      }
      id v10 = v9;
      ((void (*)(void, void))[v9 pointerValue])(*(void *)(a1 + 40), *(void *)(a1 + 48));

LABEL_11:
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

LABEL_10:
    id v11 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke_2;
    v15[3] = &unk_26459EF98;
    id v12 = v11;
    int v18 = *(_DWORD *)(a1 + 56);
    id v16 = v12;
    id v17 = v7;
    int v13 = [v12 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v15];

    if (!v13)
    {

      return 0;
    }
    goto LABEL_11;
  }
LABEL_13:

  [*(id *)(a1 + 48) setUserVersion:*(unsigned int *)(a1 + 56)];
  return 1;
}

uint64_t __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = PML_LogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 32) filename];
    uint64_t v7 = *(unsigned int *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138413058;
    id v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Migration encountered error during migration of %@: versions %lu, query: %@, error: %@", (uint8_t *)&v9, 0x2Au);
  }
  return *MEMORY[0x263F61ED0];
}

+ (int64_t)migrate:(id)a3 to:(id)a4 forStore:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 migrations];
  unsigned int v11 = [v8 maxVersion];
  unsigned int v12 = [v7 userVersion];
  if (v12 != v11)
  {
    LODWORD(v13) = v12;
    if (v12 > v11)
    {
      uint64_t v14 = PML_LogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = v13;
        _os_log_impl(&dword_2212A0000, v14, OS_LOG_TYPE_DEFAULT, "Future database version detected (%lu). Giving up on migration.", (uint8_t *)&v19, 0xCu);
      }
      int64_t v15 = 2;
LABEL_13:

      goto LABEL_14;
    }
    if (v12 < v11)
    {
      while (1)
      {
        uint64_t v13 = (v13 + 1);
        id v16 = [NSNumber numberWithUnsignedInt:v13];
        uint64_t v14 = [v10 objectForKeyedSubscript:v16];

        if (!+[PMLTrainingStore _runQueries:v14 andUpdateVersionTo:v13 inTransactionOnDb:v7 forStore:v9])break; {
        if (v11 == v13)
        }
          goto LABEL_9;
      }
      uint64_t v17 = PML_LogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_2212A0000, v17, OS_LOG_TYPE_ERROR, "PMLTrainingStore db failed to migrate but migration is needed.", (uint8_t *)&v19, 2u);
      }

      int64_t v15 = 4;
      goto LABEL_13;
    }
  }
LABEL_9:
  int64_t v15 = 0;
LABEL_14:

  return v15;
}

+ (int64_t)_migrate:(id)a3 forStore:(id)a4
{
  id v5 = a3;
  uint64_t v6 = a4;
  if (!v6[32] || [v5 userVersion])
  {
LABEL_8:
    id v10 = objc_opt_new();
    int64_t v8 = +[PMLTrainingStore migrate:v5 to:v10 forStore:v6];

    goto LABEL_9;
  }
  unsigned int v13 = 0;
  id v7 = +[PMLTrainingDatabaseMigrations skipFromZeroSchema:&v13];
  if (!+[PMLTrainingStore _runQueries:v7 andUpdateVersionTo:v13 inTransactionOnDb:v5 forStore:v6])
  {
    id v9 = PML_LogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v12 = 0;
      _os_log_error_impl(&dword_2212A0000, v9, OS_LOG_TYPE_ERROR, "PMLTrainingStore db failed to create new database with skip queries.", v12, 2u);
    }

    goto LABEL_8;
  }

  int64_t v8 = 0;
LABEL_9:

  return v8;
}

+ (id)_sessionDataToBatchWithNumberOfColumns:(unint64_t)a3 rowsData:(id)a4 labelsData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 count];
  unint64_t v12 = (unint64_t)[v10 length] >> 2;
  if (v12 != v11)
  {
    id v29 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PMLTrainingStore.m", 108, @"Number of labels %lu does not match number of rows specified %lu", v12, v11);
  }
  unsigned int v13 = +[PMLSparseMatrix sparseMatrixWithNumberOfRows:v11 numberOfColumns:a3];
  if (v11)
  {
    for (sparse_index i = 0; i != v11; ++i)
    {
      int64_t v15 = [v9 objectAtIndexedSubscript:i];
      id v16 = [v15 first];

      uint64_t v17 = [v9 objectAtIndexedSubscript:i];
      int v18 = [v17 second];

      unint64_t v19 = [v16 length];
      if (v19 >= 4)
      {
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        unint64_t v22 = v19 >> 2;
        do
        {
          LODWORD(j) = 0;
          objc_msgSend(v16, "getBytes:range:", &j, v20, 4);
          float val = 0.0;
          objc_msgSend(v18, "getBytes:range:", &val, v20, 4);
          uint64_t v23 = (sparse_m_float *)[v13 matrix];
          sparse_insert_entry_float(v23, val, i, (int)j);
          if ((v21 & 0x1FFF) == 0) {
            sparse_commit((void *)[v13 matrix]);
          }
          ++v21;
          v20 += 4;
        }
        while (v22 != v21);
      }
    }
  }
  sparse_commit((void *)[v13 matrix]);
  uint64_t v24 = [PMLTrainingStoredSessionBatch alloc];
  uint64_t v25 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithData:v10];
  uint64_t v26 = +[PMLModelRegressor modelRegressorFromFloats:v25];
  id v27 = [(PMLTrainingStoredSessionBatch *)v24 initWithCovariates:v13 outcomes:v26];

  return v27;
}

@end