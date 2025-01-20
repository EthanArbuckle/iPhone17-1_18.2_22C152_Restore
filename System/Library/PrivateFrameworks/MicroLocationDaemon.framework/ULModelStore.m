@interface ULModelStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)deleteAllModelsOfDeletedServices;
- (BOOL)deleteModelsForClients:(const void *)a3;
- (BOOL)deleteUnneededModelsWithNumNonLslsModeltoKeep:(unsigned int)a3 numLSLModelsToKeep:(unsigned int)a4;
- (BOOL)insertEntries:(const void *)a3;
- (BOOL)updateAllModelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (BOOL)updateAllModelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4;
- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentMagicalMomentsModelForClient:(uuid)a3 atLoiGroupId:;
- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelForServiceUuid:(uuid)a3 atLoiGroupId:;
- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForClient:atLoiGroupId:;
- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForService:atLoiGroupId:;
- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(uuid)a3 atLoiGroupId:;
- (vector<CLMicroLocationModelTable::Entry,)_fetchModelEntriesByAndPredicates:(ULModelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationModelTable::Entry,)fetchAllRecordsWithLimit:(ULModelStore *)self;
- (vector<CLMicroLocationModelTable::Entry,)fetchModelsAtLoiGroupId:(ULModelStore *)self andLimit:(SEL)a3;
- (vector<CLMicroLocationModelTable::Entry,)fetchMostRecentModels;
@end

@implementation ULModelStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULModelTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F14E8 unsignedIntValue];
  }
  unsigned int v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return @"generationTimestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationModelTable,ULModelMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationModelTable::Entry,)_fetchModelEntriesByAndPredicates:(ULModelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationModelTable,ULModelMO>(self, a4, a5, a6, (CLMicroLocationModelTable::Entry *)retstr);
  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchAllRecordsWithLimit:(ULModelStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationModelTable,ULModelMO>(self, a4, (CLMicroLocationModelTable::Entry *)retstr);
  return result;
}

- (BOOL)deleteUnneededModelsWithNumNonLslsModeltoKeep:(unsigned int)a3 numLSLModelsToKeep:(unsigned int)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_18);
  }
  unsigned int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240448;
    unsigned int v26 = a4;
    __int16 v27 = 1026;
    unsigned int v28 = a3;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEBUG, "Keeping %{public}d models for LSL models, %{public}d models per other types", buf, 0xEu);
  }
  unsigned int v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:1];
  uint64_t v8 = 0;
  char v9 = 1;
  do
  {
    if (v8 == 2) {
      unsigned int v10 = a4;
    }
    else {
      unsigned int v10 = a3;
    }
    v11 = [MEMORY[0x263EFF980] array];
    v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K=%d", @"modelType", v8);
    [v11 addObject:v12];

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v24 = v7;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v16 = [(ULStore *)self countManagedObjectsWithEntityName:v14 byAndPredicates:v11 sortDescriptors:v15 andLimit:0];

    if ([v16 unsignedIntValue] > v10)
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v23 = v7;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      BOOL v20 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v18, v11, v19, [v16 unsignedIntValue] - v10);

      v9 &= v20;
    }

    uint64_t v8 = (v8 + 1);
  }
  while (v8 != 4);

  return v9 & 1;
}

- (BOOL)deleteAllModelsOfDeletedServices
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_18);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all models which refer to deleted services", buf, 2u);
  }
  v4 = +[ULDefaultsSingleton shared];
  v5 = [v4 defaultsDictionary];

  unsigned int v6 = [NSString stringWithUTF8String:"ULDatabaseSelectionLimit"];
  unsigned int v7 = [v5 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v8 = [v7 unsignedIntValue];
  }
  else {
    unsigned int v8 = [&unk_2704F1500 unsignedIntValue];
  }
  unsigned int v9 = v8;

  unsigned int v10 = objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", v9);
  v11 = [MEMORY[0x263EFF980] array];
  v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K!=%d", @"modelType", 0);
  [v11 addObject:v12];

  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K in %@) && %K!=NIL && %K!=''", @"serviceUUID", v10, @"serviceUUID", @"serviceUUID"];
  [v11 addObject:v13];

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  BOOL v16 = [(ULStore *)self batchDeleteObjectsWithEntityName:v15 byAndPredicates:v11 sortDescriptors:0 andLimit:0];

  return v16;
}

- (BOOL)deleteModelsForClients:(const void *)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  unsigned int v6 = [MEMORY[0x263EFF980] array];
  unsigned int v7 = *(uint64_t **)a3;
  unsigned int v8 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    do
    {
      unsigned int v9 = v7;
      if (*((char *)v7 + 23) < 0) {
        unsigned int v9 = (uint64_t *)*v7;
      }
      unsigned int v10 = [NSString stringWithUTF8String:v9];
      [v6 addObject:v10];

      v7 += 3;
    }
    while (v7 != v8);
  }
  v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"clientId", v6];
  [v5 addObject:v11];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  BOOL v14 = [(ULStore *)self batchDeleteObjectsWithEntityName:v13 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v14;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForClient:atLoiGroupId:
{
  uint64_t v5 = v4;
  unsigned int v6 = v3;
  uint64_t v7 = *(void *)&a3.var0[8];
  v26[1] = *MEMORY[0x263EF8340];
  unsigned int v10 = [MEMORY[0x263EFF980] array];
  v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K=%d", @"modelType", v7);
  [v10 addObject:v11];

  v12 = (void *)MEMORY[0x263F08A98];
  if (*((char *)v6 + 23) >= 0) {
    v13 = v6;
  }
  else {
    v13 = (uint64_t *)*v6;
  }
  BOOL v14 = [NSString stringWithUTF8String:v13];
  v15 = [v12 predicateWithFormat:@"%K=%@", @"clientId", v14];
  [v10 addObject:v15];

  if (*(unsigned char *)(v5 + 16))
  {
    id v16 = (id)[(ULStore *)self db][56];
    v17 = v16;
    if (!*(unsigned char *)(v5 + 16)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v18 = [v16 getLoiIdsInLoiGroupId:v5];

    v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v18];
    [v10 addObject:v19];
  }
  BOOL v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v26[0] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [(ULModelStore *)self _fetchModelEntriesByAndPredicates:v10 sortDescriptors:v21 andLimit:1];

  if (v24[0] == v24[1])
  {
    char v22 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v24[0]);
    char v22 = 1;
  }
  *((unsigned char *)&retstr[1].var0.var4 + 96) = v22;
  v25 = (void **)v24;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v25);

  return result;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForService:atLoiGroupId:
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = *(void *)&a3.var0[8];
  v26[1] = *MEMORY[0x263EF8340];
  unsigned int v10 = [MEMORY[0x263EFF980] array];
  v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K=%d", @"modelType", v7);
  [v10 addObject:v11];

  if (*(unsigned char *)(v6 + 16))
  {
    id v12 = objc_alloc(MEMORY[0x263F08C38]);
    if (!*(unsigned char *)(v6 + 16)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v13 = (void *)[v12 initWithUUIDBytes:v6];
    BOOL v14 = [v13 UUIDString];

    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v14];
    [v10 addObject:v15];
  }
  if (*(unsigned char *)(v5 + 16))
  {
    id v16 = (id)[(ULStore *)self db][56];
    v17 = v16;
    if (!*(unsigned char *)(v5 + 16)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v18 = [v16 getLoiIdsInLoiGroupId:v5];

    v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v18];
    [v10 addObject:v19];
  }
  BOOL v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v26[0] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [(ULModelStore *)self _fetchModelEntriesByAndPredicates:v10 sortDescriptors:v21 andLimit:1];

  if (v24[0] == v24[1])
  {
    char v22 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v24[0]);
    char v22 = 1;
  }
  *((unsigned char *)&retstr[1].var0.var4 + 96) = v22;
  v25 = (void **)v24;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v25);

  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchModelsAtLoiGroupId:(ULModelStore *)self andLimit:(SEL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uuid v14 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  unsigned int v8 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", &v14);
  unsigned int v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v8];
  [v7 addObject:v9];

  unsigned int v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v13 = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [(ULModelStore *)self _fetchModelEntriesByAndPredicates:v7 sortDescriptors:v11 andLimit:a5];

  return result;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(uuid)a3 atLoiGroupId:
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v7[0] = 0;
  v7[16] = 0;
  long long v5 = *v3;
  char v6 = *((unsigned char *)v3 + 16);
  return [(ULModelStore *)self fetchMostRecentModelOfModelType:*(void *)&a3.var0[8] ForService:v7 atLoiGroupId:&v5];
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentMagicalMomentsModelForClient:(uuid)a3 atLoiGroupId:
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = v3;
  uint64_t v7 = v4;
  char v8 = 1;
  return [(ULModelStore *)self fetchMostRecentModelOfModelType:0 ForClient:*(void *)&a3.var0[8] atLoiGroupId:&v6];
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelForServiceUuid:(uuid)a3 atLoiGroupId:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v23 = *(void *)&a3.var0[8];
  uint64_t v24 = v3;
  uint64_t v21 = v4;
  uint64_t v22 = v5;
  char v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v23];
  unsigned int v10 = [v9 UUIDString];

  v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v10];
  [v8 addObject:v11];

  id v12 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", &v21);
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v12];
  [v8 addObject:v13];

  uuid v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  BOOL v20 = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  [(ULModelStore *)self _fetchModelEntriesByAndPredicates:v8 sortDescriptors:v15 andLimit:1];

  if (v18[0] == v18[1])
  {
    char v16 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v18[0]);
    char v16 = 1;
  }
  *((unsigned char *)&retstr[1].var0.var4 + 96) = v16;
  v19 = (void **)v18;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v19);

  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchMostRecentModels
{
  uint64_t v5 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  do
  {
    __int16 v10 = 0;
    char v11 = 0;
    v9[0] = 0;
    [(ULModelStore *)self fetchMostRecentModelOfModelType:v5 ForService:(char *)&v10 + 1 atLoiGroupId:v9];
    if (v12[312])
    {
      var1 = retstr->var1;
      if (var1 >= retstr->var2.var0)
      {
        uint64_t v7 = (Entry *)std::vector<CLMicroLocationModelTable::Entry>::__push_back_slow_path<CLMicroLocationModelTable::Entry const&>((uint64_t *)retstr, (const CLMicroLocationModelTable::Entry *)v12);
      }
      else
      {
        CLMicroLocationModelTable::Entry::Entry((CLMicroLocationModelTable::Entry *)retstr->var1, (const CLMicroLocationModelTable::Entry *)v12);
        uint64_t v7 = (Entry *)((char *)var1 + 312);
        retstr->var1 = (Entry *)((char *)var1 + 312);
      }
      retstr->var1 = v7;
    }
    result = (vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *)std::__optional_destruct_base<CLMicroLocationModelTable::Entry,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v12);
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 4);
  return result;
}

- (BOOL)updateAllModelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uuid v17 = a3;
  uuid v16 = a4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v17];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v16];
  char v8 = [v7 UUIDString];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceUUID", v6];
  uuid v14 = @"serviceUUID";
  uint64_t v15 = v8;
  __int16 v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  char v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  LOBYTE(self) = [(ULStore *)self batchUpdateObjectsWithEntityName:v12 predicate:v9 propertiesToUpdate:v10];

  return (char)self;
}

- (BOOL)updateAllModelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  uint64_t v4 = v3;
  v15[1] = *MEMORY[0x263EF8340];
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  uint64_t v6 = [NSString stringWithUTF8String:var0];
  if (*((char *)v4 + 23) < 0) {
    uint64_t v4 = (uint64_t *)*v4;
  }
  uint64_t v7 = [NSString stringWithUTF8String:v4];
  char v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K CONTAINS %@", @"clientId", v6];
  uuid v14 = @"clientId";
  v15[0] = v7;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  __int16 v10 = (objc_class *)objc_opt_class();
  char v11 = NSStringFromClass(v10);
  BOOL v12 = [(ULStore *)self batchUpdateObjectsWithEntityName:v11 predicate:v8 propertiesToUpdate:v9];

  return v12;
}

@end