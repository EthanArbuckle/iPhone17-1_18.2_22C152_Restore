@interface ULStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)_insertFetchedBatchedObjects:(id)a3 usingBatchSize:(unint64_t)a4 withCancelFunc:(function<BOOL)(;
- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (BOOL)batchTransferManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 intoTargetStore:(id)a8 withCancelFunc:(function<BOOL)(;
- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5;
- (BOOL)commitChangesToStore;
- (BOOL)deleteAllRecords;
- (BOOL)deleteAllRecordsForEntityName:(id)a3;
- (BOOL)deleteOldestRecordsForEntityName:(id)a3 sortProperty:(id)a4 maxRecordsToKeep:(unsigned int)a5;
- (BOOL)deleteOldestRecordsIfFull;
- (BOOL)deleteRecordsForEntityName:(id)a3 sortProperty:(id)a4 olderThan:(double)a5 orNewerThan:(double)a6;
- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4;
- (NSManagedObjectContext)managedObjectContext;
- (ULDatabase)db;
- (ULStore)initWithDb:(ULDatabase *)a3;
- (id)_batchFetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 error:(id *)a8;
- (id)countAllRecordsForEntityName:(id)a3;
- (id)countManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchManagedObjectsForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8;
- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchPropertiesForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 distinctResults:(BOOL)a6 byAndPredicates:(id)a7 sortDescriptors:(id)a8 andLimit:(unint64_t)a9 resetContext:(BOOL)a10;
- (id)fetchPropertyForEntityName:(id)a3 propertyToFetch:(id)a4 distinctResults:(BOOL)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8;
- (unsigned)count;
- (void)_handleDatabaseError:(id)a3;
- (void)setDb:(ULDatabase *)a3;
- (void)setManagedObjectContext:(id)a3;
@end

@implementation ULStore

void __86__ULStore_countManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPredicate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setSortDescriptors:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFetchLimit:*(void *)(a1 + 88)];
  v6 = [*(id *)(a1 + 56) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 countForFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v9;

  v10 = [*(id *)(a1 + 56) managedObjectContext];
  [v10 reset];
}

void __31__ULStore_commitChangesToStore__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v5 + 40);
    [v4 save:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
  }
  v6 = [*(id *)(a1 + 32) managedObjectContext];
  [v6 reset];
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (BOOL)deleteOldestRecordsIfFull
{
  int v3 = (objc_class *)[(id)objc_opt_class() MOClass];
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [(id)objc_opt_class() defaultSortProperty];
  LOBYTE(self) = -[ULStore deleteOldestRecordsForEntityName:sortProperty:maxRecordsToKeep:](self, "deleteOldestRecordsForEntityName:sortProperty:maxRecordsToKeep:", v4, v5, [(id)objc_opt_class() maxEntriesInTable]);

  return (char)self;
}

- (BOOL)deleteOldestRecordsForEntityName:(id)a3 sortProperty:(id)a4 maxRecordsToKeep:(unsigned int)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(ULStore *)self countAllRecordsForEntityName:v8];
  v11 = v10;
  if (v10)
  {
    int v12 = [v10 unsignedIntValue] - a5;
    if (v12 < 0)
    {
      BOOL v18 = 1;
    }
    else
    {
      v13 = +[ULDefaultsSingleton shared];
      v14 = [v13 defaultsDictionary];

      v15 = [NSString stringWithUTF8String:"ULDatabaseFreeSpacePercentage"];
      v16 = [v14 objectForKey:v15];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        [v16 floatValue];
      }
      else {
        [&unk_2704F0DE0 floatValue];
      }
      float v19 = v17;

      unsigned int v20 = (float)(v19 * (float)a5);
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
      }
      uint64_t v21 = v12 + v20;
      v22 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = [v8 UTF8String];
        __int16 v29 = 1024;
        int v30 = v21;
        _os_log_impl(&dword_25631F000, v22, OS_LOG_TYPE_DEFAULT, "Freeing up database space for entity: %s, Num Records to delete: %d", buf, 0x12u);
      }

      v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v9 ascending:1];
      v26 = v23;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
      BOOL v18 = [(ULStore *)self batchDeleteObjectsWithEntityName:v8 byAndPredicates:0 sortDescriptors:v24 andLimit:v21];
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)commitChangesToStore
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__4;
  float v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  int v3 = [(ULStore *)self managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __31__ULStore_commitChangesToStore__block_invoke;
  v14[3] = &unk_2653F9558;
  v14[4] = self;
  v14[5] = &v15;
  [v3 performBlockAndWait:v14];

  if (v16[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    v4 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = v16[5];
      v6 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2114;
      uint64_t v26 = v5;
      __int16 v27 = 2113;
      uint64_t v28 = v7;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not save changes to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v8 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v8))
    {
      uint64_t v9 = v16[5];
      v10 = (objc_class *)[(id)objc_opt_class() MOClass];
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2114;
      uint64_t v26 = v9;
      __int16 v27 = 2113;
      uint64_t v28 = v11;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not save changes to store", "{\"msg%{public}.0s\":\"Could not save changes to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    [(ULStore *)self _handleDatabaseError:v16[5]];
    BOOL v12 = v16[5] == 0;
  }
  else
  {
    BOOL v12 = 1;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)countAllRecordsForEntityName:(id)a3
{
  int v3 = [(ULStore *)self countManagedObjectsWithEntityName:a3 byAndPredicates:0 sortDescriptors:0 andLimit:0];
  return v3;
}

- (id)countManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  id v27 = a4;
  id v28 = a5;
  v11 = [(ULStore *)self managedObjectContext];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __86__ULStore_countManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2653F9580;
  v34 = &v42;
  id v12 = v10;
  id v30 = v12;
  id v13 = v27;
  id v31 = v13;
  id v14 = v28;
  v36 = &v48;
  unint64_t v37 = a6;
  id v32 = v14;
  v33 = self;
  v35 = &v38;
  [v11 performBlockAndWait:v29];

  if (v49[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    uint64_t v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = v49[5];
      uint64_t v17 = (objc_class *)[(id)objc_opt_class() MOClass];
      BOOL v18 = NSStringFromClass(v17);
      uint64_t v19 = v43[5];
      uint64_t buf = 68289795;
      __int16 v55 = 2082;
      v56 = "";
      __int16 v57 = 2114;
      uint64_t v58 = v16;
      __int16 v59 = 2113;
      v60 = v18;
      __int16 v61 = 2113;
      uint64_t v62 = v19;
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform count fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v20 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v20))
    {
      uint64_t v21 = v49[5];
      int v22 = (objc_class *)[(id)objc_opt_class() MOClass];
      __int16 v23 = NSStringFromClass(v22);
      uint64_t v24 = v43[5];
      uint64_t buf = 68289795;
      __int16 v55 = 2082;
      v56 = "";
      __int16 v57 = 2114;
      uint64_t v58 = v21;
      __int16 v59 = 2113;
      v60 = v23;
      __int16 v61 = 2113;
      uint64_t v62 = v24;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform count fetch request to store", "{\"msg%{public}.0s\":\"Could not perform count fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    [(ULStore *)self _handleDatabaseError:v49[5]];
  }
  if (v39[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v25 = 0;
  }
  else
  {
    __int16 v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v25;
}

+ (Class)MOClass
{
  return 0;
}

+ (unsigned)maxEntriesInTable
{
  return 0;
}

+ (id)defaultSortProperty
{
  return 0;
}

- (ULStore)initWithDb:(ULDatabase *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ULStore;
  v4 = [(ULStore *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(ULStore *)v4 setDb:a3];
    v6 = objc_msgSend((id)-[ULStore db](v5, "db")[8], "createManagedObjectContext");
    [(ULStore *)v5 setManagedObjectContext:v6];
  }
  return v5;
}

- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = __Block_byref_object_copy__4;
  v54 = __Block_byref_object_dispose__4;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__4;
  uint64_t v48 = __Block_byref_object_dispose__4;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__4;
  uint64_t v42 = __Block_byref_object_dispose__4;
  id v43 = 0;
  id v28 = a5;
  id v12 = [(ULStore *)self managedObjectContext];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __86__ULStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2653F9580;
  v34 = &v38;
  id v13 = v10;
  id v30 = v13;
  id v14 = v11;
  id v31 = v14;
  id v15 = v28;
  v36 = &v50;
  unint64_t v37 = a6;
  id v32 = v15;
  v33 = self;
  v35 = &v44;
  [v12 performBlockAndWait:v29];

  if (v51[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    uint64_t v16 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = v51[5];
      BOOL v18 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v19 = NSStringFromClass(v18);
      uint64_t v20 = v39[5];
      uint64_t buf = 68289795;
      __int16 v57 = 2082;
      uint64_t v58 = "";
      __int16 v59 = 2114;
      uint64_t v60 = v17;
      __int16 v61 = 2113;
      uint64_t v62 = v19;
      __int16 v63 = 2113;
      uint64_t v64 = v20;
      _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    uint64_t v21 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v21))
    {
      uint64_t v22 = v51[5];
      __int16 v23 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v24 = NSStringFromClass(v23);
      uint64_t v25 = v39[5];
      uint64_t buf = 68289795;
      __int16 v57 = 2082;
      uint64_t v58 = "";
      __int16 v59 = 2114;
      uint64_t v60 = v22;
      __int16 v61 = 2113;
      uint64_t v62 = v24;
      __int16 v63 = 2113;
      uint64_t v64 = v25;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform fetch request to store", "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    [(ULStore *)self _handleDatabaseError:v51[5]];
  }
  id v26 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v26;
}

void __86__ULStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPredicate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setSortDescriptors:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFetchLimit:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setResultType:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setReturnsObjectsAsFaults:0];
  v6 = [*(id *)(a1 + 56) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (BOOL)batchTransferManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 intoTargetStore:(id)a8 withCancelFunc:(function<BOOL)(
{
  v36[4] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  var1 = a9->var0.var1;
  if (!var1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if ((*(uint64_t (**)(void *))(*(void *)var1 + 48))(var1))
  {
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v21 = [(ULStore *)self managedObjectContext];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3321888768;
    v28[2] = __132__ULStore_batchTransferManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_intoTargetStore_withCancelFunc___block_invoke;
    v28[3] = &unk_2704DBA30;
    v28[4] = self;
    id v29 = v15;
    id v30 = v16;
    id v22 = v17;
    unint64_t v34 = a6;
    unint64_t v35 = a7;
    id v31 = v22;
    v33 = &v24;
    id v32 = v18;
    std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v36, (uint64_t)a9);
    [v21 performBlockAndWait:v28];

    BOOL v20 = *((unsigned char *)v25 + 24) != 0;
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v36);
  }
  _Block_object_dispose(&v24, 8);

  return v20;
}

void __132__ULStore_batchTransferManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_intoTargetStore_withCancelFunc___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = a1[11];
  id v12 = 0;
  uint64_t v8 = [v2 _batchFetchManagedObjectsWithEntityName:v3 byAndPredicates:v4 sortDescriptors:v5 batchSize:v6 limit:v7 error:&v12];
  id v9 = v12;
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v9 == 0;
  if (!v9 && [v8 count])
  {
    uint64_t v10 = (void *)a1[8];
    uint64_t v11 = a1[10];
    std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 12));
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = [v10 _insertFetchedBatchedObjects:v8 usingBatchSize:v11 withCancelFunc:v13];
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v13);
  }
}

- (id)fetchManagedObjectsForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  uint64_t v40 = __Block_byref_object_dispose__4;
  id v26 = a7;
  id v41 = [MEMORY[0x263EFF980] array];
  id v18 = [(ULStore *)self managedObjectContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __123__ULStore_fetchManagedObjectsForEntityName_propertiesToFetch_propertiesToGroupBy_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v27[3] = &unk_2653F95A8;
  id v19 = v15;
  id v28 = v19;
  id v29 = self;
  id v20 = v14;
  id v30 = v20;
  id v21 = v16;
  id v31 = v21;
  id v22 = v17;
  id v32 = v22;
  id v23 = v26;
  id v33 = v23;
  unint64_t v34 = &v36;
  unint64_t v35 = a8;
  [v18 performBlockAndWait:v27];

  id v24 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v24;
}

void __123__ULStore_fetchManagedObjectsForEntityName_propertiesToFetch_propertiesToGroupBy_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v13 = (void *)[*(id *)(a1 + 32) mutableCopy];
  if (([v13 containsObject:@"objectID"] & 1) == 0) {
    [v13 addObject:@"objectID"];
  }
  LOBYTE(v12) = 0;
  [*(id *)(a1 + 40) fetchPropertiesForEntityName:*(void *)(a1 + 48) propertiesToFetch:v13 propertiesToGroupBy:*(void *)(a1 + 56) distinctResults:1 byAndPredicates:*(void *)(a1 + 64) sortDescriptors:*(void *)(a1 + 72) andLimit:*(void *)(a1 + 88) resetContext:v12];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v2)
  {
    id v3 = 0;
    uint64_t v4 = *(void *)v17;
    while (2)
    {
      uint64_t v5 = 0;
      uint64_t v6 = v3;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        uint64_t v8 = [*(id *)(a1 + 40) managedObjectContext];
        id v9 = [v7 objectForKeyedSubscript:@"objectID"];
        id v15 = v6;
        uint64_t v10 = [v8 existingObjectWithID:v9 error:&v15];
        id v3 = v15;

        if (v10)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v10];
        }
        else if (v3)
        {
          if (onceToken_MicroLocation_Default != -1) {
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
          }
          uint64_t v11 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            id v21 = v3;
            _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_ERROR, "Conversion of ojbectID to managed object failed with error: %@", buf, 0xCu);
          }
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeAllObjects];
          goto LABEL_19;
        }

        ++v5;
        uint64_t v6 = v3;
      }
      while (v2 != v5);
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v2) {
        continue;
      }
      break;
    }
LABEL_19:
  }
}

- (id)fetchPropertiesForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 distinctResults:(BOOL)a6 byAndPredicates:(id)a7 sortDescriptors:(id)a8 andLimit:(unint64_t)a9 resetContext:(BOOL)a10
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__4;
  v68 = __Block_byref_object_dispose__4;
  id v69 = 0;
  uint64_t v58 = 0;
  __int16 v59 = &v58;
  uint64_t v60 = 0x3032000000;
  __int16 v61 = __Block_byref_object_copy__4;
  uint64_t v62 = __Block_byref_object_dispose__4;
  id v63 = 0;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  id v57 = 0;
  id v36 = a8;
  long long v19 = [(ULStore *)self managedObjectContext];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __148__ULStore_fetchPropertiesForEntityName_propertiesToFetch_propertiesToGroupBy_distinctResults_byAndPredicates_sortDescriptors_andLimit_resetContext___block_invoke;
  v39[3] = &unk_2653F95D0;
  uint64_t v46 = &v52;
  id v37 = v15;
  id v40 = v37;
  id v20 = v18;
  id v41 = v20;
  id v21 = v36;
  id v42 = v21;
  unint64_t v49 = a9;
  id v22 = v16;
  id v43 = v22;
  id v23 = v17;
  BOOL v50 = a6;
  id v44 = v23;
  v45 = self;
  id v47 = &v58;
  uint64_t v48 = &v64;
  BOOL v51 = a10;
  [v19 performBlockAndWait:v39];

  if (v65[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v24 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      uint64_t v25 = v65[5];
      id v26 = (objc_class *)[(id)objc_opt_class() MOClass];
      char v27 = NSStringFromClass(v26);
      uint64_t v28 = v53[5];
      uint64_t buf = 68289795;
      __int16 v71 = 2082;
      v72 = "";
      __int16 v73 = 2114;
      uint64_t v74 = v25;
      __int16 v75 = 2113;
      v76 = v27;
      __int16 v77 = 2113;
      uint64_t v78 = v28;
      _os_log_impl(&dword_25631F000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v29 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v29))
    {
      uint64_t v30 = v65[5];
      id v31 = (objc_class *)[(id)objc_opt_class() MOClass];
      id v32 = NSStringFromClass(v31);
      uint64_t v33 = v53[5];
      uint64_t buf = 68289795;
      __int16 v71 = 2082;
      v72 = "";
      __int16 v73 = 2114;
      uint64_t v74 = v30;
      __int16 v75 = 2113;
      v76 = v32;
      __int16 v77 = 2113;
      uint64_t v78 = v33;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform fetch request to store", "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    [(ULStore *)self _handleDatabaseError:v65[5]];
  }
  id v34 = (id)v59[5];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v34;
}

void __148__ULStore_fetchPropertiesForEntityName_propertiesToFetch_propertiesToGroupBy_distinctResults_byAndPredicates_sortDescriptors_andLimit_resetContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setPredicate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSortDescriptors:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setFetchLimit:*(void *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setResultType:2];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setPropertiesToFetch:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setPropertiesToGroupBy:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setReturnsDistinctResults:*(unsigned __int8 *)(a1 + 112)];
  uint64_t v6 = [*(id *)(a1 + 72) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (*(unsigned char *)(a1 + 113))
  {
    uint64_t v12 = [*(id *)(a1 + 72) managedObjectContext];
    [v12 reset];
  }
}

- (id)fetchPropertyForEntityName:(id)a3 propertyToFetch:(id)a4 distinctResults:(BOOL)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8
{
  BOOL v11 = a5;
  v24[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = (NSArray *)a4;
  id v16 = a6;
  id v17 = a7;
  v24[0] = v15;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  LOBYTE(v23) = 1;
  long long v19 = [(ULStore *)self fetchPropertiesForEntityName:v14 propertiesToFetch:v18 propertiesToGroupBy:0 distinctResults:v11 byAndPredicates:v16 sortDescriptors:v17 andLimit:a8 resetContext:v23];

  id v21 = ULDBUtils::getPropertyAsArray(v19, v15, v20);

  return v21;
}

- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__4;
  id v47 = __Block_byref_object_dispose__4;
  id v48 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__4;
  id v41 = __Block_byref_object_dispose__4;
  id v42 = 0;
  id v13 = [(ULStore *)self managedObjectContext];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__ULStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2653F95F8;
  id v14 = v10;
  id v30 = v14;
  id v15 = v11;
  id v31 = v15;
  id v16 = v12;
  unint64_t v35 = &v43;
  unint64_t v36 = a6;
  id v32 = v16;
  uint64_t v33 = self;
  id v34 = &v37;
  [v13 performBlockAndWait:v29];

  if (v44[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v17 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = v44[5];
      long long v19 = (objc_class *)[(id)objc_opt_class() MOClass];
      id v20 = NSStringFromClass(v19);
      uint64_t v21 = v38[5];
      uint64_t buf = 68289795;
      __int16 v50 = 2082;
      BOOL v51 = "";
      __int16 v52 = 2114;
      uint64_t v53 = v18;
      __int16 v54 = 2113;
      id v55 = v20;
      __int16 v56 = 2113;
      uint64_t v57 = v21;
      _os_log_impl(&dword_25631F000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch delete request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"batchDeleteRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v22 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v22))
    {
      uint64_t v23 = v44[5];
      id v24 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = v38[5];
      uint64_t buf = 68289795;
      __int16 v50 = 2082;
      BOOL v51 = "";
      __int16 v52 = 2114;
      uint64_t v53 = v23;
      __int16 v54 = 2113;
      id v55 = v25;
      __int16 v56 = 2113;
      uint64_t v57 = v26;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch delete request to store", "{\"msg%{public}.0s\":\"Could not perform batch delete request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"batchDeleteRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    [(ULStore *)self _handleDatabaseError:v44[5]];
    BOOL v27 = v44[5] == 0;
  }
  else
  {
    BOOL v27 = 1;
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v27;
}

void __85__ULStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 40)];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:*(void *)(a1 + 48)];
  [v2 setFetchLimit:*(void *)(a1 + 80)];
  uint64_t v4 = [objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 56) managedObjectContext];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = (id)[v7 executeRequest:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  id v11 = [*(id *)(a1 + 56) managedObjectContext];
  [v11 reset];
}

- (BOOL)deleteAllRecordsForEntityName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
  }
  uint64_t v5 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    uint64_t v24 = [v4 UTF8String];
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all records for entity: %s", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v6 = +[ULDefaultsSingleton shared];
  uint64_t v7 = [v6 defaultsDictionary];

  uint64_t v8 = [NSString stringWithUTF8String:"ULBatchDeleteEntriesIterationLimit"];
  uint64_t v9 = [v7 objectForKey:v8];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v10 = [v9 unsignedIntValue];
  }
  else {
    unsigned int v10 = [&unk_2704F1608 unsignedIntValue];
  }
  unsigned int v11 = v10;

  if (v11)
  {
    id v12 = [(ULStore *)self countAllRecordsForEntityName:v4];
    id v13 = v12;
    if (v12)
    {
      if ([v12 integerValue] < 1
        || ((uint64_t v14 = [v13 integerValue],
             uint64_t v15 = v11,
             uint64_t v16 = [v13 integerValue] / v11,
             v14 % v11 <= 0)
          ? (int v17 = v16)
          : (int v17 = v16 + 1),
            v17 < 1))
      {
        BOOL v20 = 1;
      }
      else
      {
        int v18 = 1;
        do
        {
          long long v19 = (void *)MEMORY[0x25A2A6840]();
          BOOL v20 = [(ULStore *)self batchDeleteObjectsWithEntityName:v4 byAndPredicates:0 sortDescriptors:0 andLimit:v15];
        }
        while (v18++ < v17 && v20);
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = [(ULStore *)self batchDeleteObjectsWithEntityName:v4 byAndPredicates:0 sortDescriptors:0 andLimit:0];
  }

  return v20;
}

- (BOOL)deleteRecordsForEntityName:(id)a3 sortProperty:(id)a4 olderThan:(double)a5 orNewerThan:(double)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
  }
  id v12 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 136315138;
    uint64_t v21 = [v10 UTF8String];
    _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_DEFAULT, "Deleting old records for entity: %s", buf, 0xCu);
  }

  id v13 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = (void *)MEMORY[0x263F08A98];
  uint64_t v15 = [NSNumber numberWithDouble:a5];
  uint64_t v16 = [NSNumber numberWithDouble:a6];
  int v17 = [v14 predicateWithFormat:@"%K < %@ || %K > %@", v11, v15, v11, v16];
  [v13 addObject:v17];

  BOOL v18 = [(ULStore *)self batchDeleteObjectsWithEntityName:v10 byAndPredicates:v13 sortDescriptors:0 andLimit:0];
  return v18;
}

- (BOOL)deleteAllRecords
{
  uint64_t v3 = (objc_class *)[(id)objc_opt_class() MOClass];
  id v4 = NSStringFromClass(v3);
  LOBYTE(self) = [(ULStore *)self deleteAllRecordsForEntityName:v4];

  return (char)self;
}

- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4
{
  uint64_t v7 = (objc_class *)[(id)objc_opt_class() MOClass];
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [(id)objc_opt_class() defaultSortProperty];
  LOBYTE(self) = [(ULStore *)self deleteRecordsForEntityName:v8 sortProperty:v9 olderThan:a3 orNewerThan:a4];

  return (char)self;
}

- (unsigned)count
{
  uint64_t v3 = (objc_class *)[(id)objc_opt_class() MOClass];
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(ULStore *)self countAllRecordsForEntityName:v4];

  if (v5) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)_batchFetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 error:(id *)a8
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  uint64_t v55 = 0;
  __int16 v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__4;
  __int16 v59 = __Block_byref_object_dispose__4;
  id v60 = 0;
  uint64_t v49 = 0;
  __int16 v50 = &v49;
  uint64_t v51 = 0x3032000000;
  __int16 v52 = __Block_byref_object_copy__4;
  uint64_t v53 = __Block_byref_object_dispose__4;
  id v54 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__4;
  id v47 = __Block_byref_object_dispose__4;
  id v48 = 0;
  id v31 = a5;
  uint64_t v15 = [(ULStore *)self managedObjectContext];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __105__ULStore__batchFetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_error___block_invoke;
  v33[3] = &unk_2653F9620;
  uint64_t v38 = &v43;
  id v16 = v13;
  id v34 = v16;
  id v17 = v14;
  id v35 = v17;
  id v18 = v31;
  unint64_t v41 = a7;
  unint64_t v42 = a6;
  id v36 = v18;
  uint64_t v37 = self;
  uint64_t v39 = &v49;
  id v40 = &v55;
  [v15 performBlockAndWait:v33];

  if (v56[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    long long v19 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = v56[5];
      uint64_t v21 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v22 = NSStringFromClass(v21);
      uint64_t v23 = v44[5];
      uint64_t buf = 68289795;
      __int16 v62 = 2082;
      id v63 = "";
      __int16 v64 = 2114;
      uint64_t v65 = v20;
      __int16 v66 = 2113;
      v67 = v22;
      __int16 v68 = 2113;
      uint64_t v69 = v23;
      _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    uint64_t v24 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v24))
    {
      uint64_t v25 = v56[5];
      uint64_t v26 = (objc_class *)[(id)objc_opt_class() MOClass];
      BOOL v27 = NSStringFromClass(v26);
      uint64_t v28 = v44[5];
      uint64_t buf = 68289795;
      __int16 v62 = 2082;
      id v63 = "";
      __int16 v64 = 2114;
      uint64_t v65 = v25;
      __int16 v66 = 2113;
      v67 = v27;
      __int16 v68 = 2113;
      uint64_t v69 = v28;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch fetch request to store", "{\"msg%{public}.0s\":\"Could not perform batch fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (a8) {
      *a8 = (id) v56[5];
    }
    [(ULStore *)self _handleDatabaseError:v56[5]];
  }
  id v29 = (id)v50[5];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v29;
}

void __105__ULStore__batchFetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPredicate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setSortDescriptors:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFetchLimit:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setResultType:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFetchBatchSize:*(void *)(a1 + 96)];
  unsigned int v6 = [*(id *)(a1 + 56) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (BOOL)_insertFetchedBatchedObjects:(id)a3 usingBatchSize:(unint64_t)a4 withCancelFunc:(function<BOOL)(
{
  v22[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  var1 = a5->var0.var1;
  if (!var1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if ((*(uint64_t (**)(void *))(*(void *)var1 + 48))(var1))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    id v11 = [(ULStore *)self managedObjectContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3321888768;
    v18[2] = __70__ULStore__insertFetchedBatchedObjects_usingBatchSize_withCancelFunc___block_invoke;
    v18[3] = &unk_2704DBA68;
    id v19 = v8;
    uint64_t v21 = &v14;
    std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)a5);
    v22[4] = a4;
    uint64_t v20 = self;
    [v11 performBlockAndWait:v18];

    if (*((unsigned char *)v15 + 24))
    {
      id v12 = a5->var0.var1;
      if (!v12) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      int v10 = (*(uint64_t (**)(void *))(*(void *)v12 + 48))(v12) ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v22);
  }
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __70__ULStore__insertFetchedBatchedObjects_usingBatchSize_withCancelFunc___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) firstObject];
    uint64_t v3 = [v2 entity];
    uint64_t v26 = [v3 name];

    uint64_t v4 = [*(id *)(a1 + 32) count];
    if (v4)
    {
      unint64_t v24 = v4;
      for (unint64_t i = 0; i < v24; i += *(void *)(a1 + 88))
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          break;
        }
        uint64_t v5 = *(void *)(a1 + 80);
        if (!v5) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 48))(v5)) {
          break;
        }
        unint64_t v6 = *(void *)(a1 + 88) + i;
        if (v6 >= v24) {
          unint64_t v6 = v24;
        }
        unint64_t v27 = v6;
        context = (void *)MEMORY[0x25A2A6840]();
        if (i < v27)
        {
          unint64_t v7 = i;
          do
          {
            uint64_t v8 = *(void *)(a1 + 80);
            if (!v8) {
              std::__throw_bad_function_call[abi:ne180100]();
            }
            if ((*(unsigned int (**)(uint64_t))(*(void *)v8 + 48))(v8)) {
              break;
            }
            uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
            int v10 = (void *)MEMORY[0x263EFF240];
            id v11 = [*(id *)(a1 + 40) managedObjectContext];
            id v12 = [v10 insertNewObjectForEntityForName:v26 inManagedObjectContext:v11];

            id v13 = [v9 entity];
            uint64_t v14 = [v13 attributesByName];

            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v29 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
                  uint64_t v20 = [v9 valueForKey:v19];
                  [v12 setValue:v20 forKey:v19];
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
              }
              while (v16);
            }

            ++v7;
          }
          while (v7 != v27);
        }
        uint64_t v21 = *(void *)(a1 + 80);
        if (!v21) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        char v22 = ((*(uint64_t (**)(uint64_t))(*(void *)v21 + 48))(v21) & 1) != 0
            ? 0
            : [*(id *)(a1 + 40) commitChangesToStore];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v22;
      }
    }
  }
}

- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v40 = 0;
  unint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__4;
  id v44 = __Block_byref_object_dispose__4;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__4;
  uint64_t v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  id v11 = [(ULStore *)self managedObjectContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __73__ULStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke;
  v27[3] = &unk_2653F9648;
  id v32 = &v34;
  id v12 = v8;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  id v14 = v10;
  id v30 = v14;
  long long v31 = self;
  uint64_t v33 = &v40;
  [v11 performBlockAndWait:v27];

  if (v41[5])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    id v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = v41[5];
      uint64_t v17 = (objc_class *)[(id)objc_opt_class() MOClass];
      id v18 = NSStringFromClass(v17);
      uint64_t v19 = v35[5];
      uint64_t buf = 68289795;
      __int16 v47 = 2082;
      id v48 = "";
      __int16 v49 = 2114;
      uint64_t v50 = v16;
      __int16 v51 = 2113;
      __int16 v52 = v18;
      __int16 v53 = 2113;
      uint64_t v54 = v19;
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch update request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"updateRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_26);
    }
    uint64_t v20 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v20))
    {
      uint64_t v21 = v41[5];
      char v22 = (objc_class *)[(id)objc_opt_class() MOClass];
      uint64_t v23 = NSStringFromClass(v22);
      uint64_t v24 = v35[5];
      uint64_t buf = 68289795;
      __int16 v47 = 2082;
      id v48 = "";
      __int16 v49 = 2114;
      uint64_t v50 = v21;
      __int16 v51 = 2113;
      __int16 v52 = v23;
      __int16 v53 = 2113;
      uint64_t v54 = v24;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch update request to store", "{\"msg%{public}.0s\":\"Could not perform batch update request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"updateRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
    }
    [(ULStore *)self _handleDatabaseError:v41[5]];
    BOOL v25 = v41[5] == 0;
  }
  else
  {
    BOOL v25 = 1;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

void __73__ULStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF1E0] batchUpdateRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPredicate:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPropertiesToUpdate:*(void *)(a1 + 48)];
  uint64_t v5 = [*(id *)(a1 + 56) managedObjectContext];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = (id)[v5 executeRequest:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  id v9 = [*(id *)(a1 + 56) managedObjectContext];
  [v9 reset];
}

- (void)_handleDatabaseError:(id)a3
{
  id v4 = a3;
  if (ULDatabase::isMainDatabase([(ULStore *)self db])) {
    objc_msgSend((id)-[ULStore db](self, "db")[8], "handleDatabaseError:", v4);
  }
}

- (void)setManagedObjectContext:(id)a3
{
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (void).cxx_destruct
{
}

@end