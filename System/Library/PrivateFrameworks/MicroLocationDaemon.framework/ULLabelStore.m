@interface ULLabelStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)deleteAllLabelsOfDeletedServices;
- (BOOL)deleteRecordingLabelsForClients:(const void *)a3;
- (BOOL)deleteSimilarityListLabelsOlderThan:(double)a3 orNewerThan:(double)a4;
- (BOOL)insertEntries:(const void *)a3;
- (BOOL)updateAllLabelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (BOOL)updateAllLabelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4;
- (vector<CLMicroLocationRecordingLabelsTable::Entry,)_fetchLabelsByAndPredicates:(ULLabelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchAllRecordsWithLimit:(ULLabelStore *)self;
- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForClient:(ULLabelStore *)self limit:(SEL)a3;
- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForServiceUuid:(ULLabelStore *)self atLoiGroupID:(SEL)a3 fromTime:(const uuid *)a4 limit:(const uuid *)a5;
- (vector<std::string,)getAllRecordingLabelsClientIds;
@end

@implementation ULLabelStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULRecordingLabelsTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1158 unsignedIntValue];
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
  return @"receivedTimestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)_fetchLabelsByAndPredicates:(ULLabelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchAllRecordsWithLimit:(ULLabelStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteSimilarityListLabelsOlderThan:(double)a3 orNewerThan:(double)a4
{
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  v8 = (void *)MEMORY[0x263F08A98];
  v9 = [NSNumber numberWithDouble:a3];
  v10 = [NSNumber numberWithDouble:a4];
  v11 = [v8 predicateWithFormat:@"%K < %@ || %K > %@", @"receivedTimestamp", v9, @"receivedTimestamp", v10];
  [v7 addObject:v11];

  v12 = objc_msgSend((id)-[ULStore db](self, "db")[96], "getServiceUUIDsWithServiceType:", 4);
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"serviceUUID", v12];
  [v7 addObject:v13];

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  LOBYTE(self) = [(ULStore *)self batchDeleteObjectsWithEntityName:v15 byAndPredicates:v7 sortDescriptors:0 andLimit:0];

  return (char)self;
}

- (BOOL)deleteRecordingLabelsForClients:(const void *)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  unsigned int v6 = [MEMORY[0x263EFF980] array];
  unsigned int v7 = *(uint64_t **)a3;
  v8 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    do
    {
      v9 = v7;
      if (*((char *)v7 + 23) < 0) {
        v9 = (uint64_t *)*v7;
      }
      v10 = [NSString stringWithUTF8String:v9];
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

- (BOOL)deleteAllLabelsOfDeletedServices
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_3);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all labels which refer to deleted services", buf, 2u);
  }
  v4 = objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
  v5 = [MEMORY[0x263EFF980] array];
  unsigned int v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K in %@)", @"serviceUUID", v4];
  [v5 addObject:v6];

  unsigned int v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  BOOL v9 = [(ULStore *)self batchDeleteObjectsWithEntityName:v8 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v9;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForClient:(ULLabelStore *)self limit:(SEL)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v8 = [MEMORY[0x263EFF980] array];
  BOOL v9 = (void *)MEMORY[0x263F08A98];
  if (*((char *)a4 + 23) >= 0) {
    v10 = a4;
  }
  else {
    v10 = *(const void **)a4;
  }
  v11 = [NSString stringWithUTF8String:v10];
  v12 = [v9 predicateWithFormat:@"%K=%@", @"clientId", v11];
  [v8 addObject:v12];

  v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
  v16[0] = v13;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(ULLabelStore *)self _fetchLabelsByAndPredicates:v8 sortDescriptors:v14 andLimit:a5];

  return result;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForServiceUuid:(ULLabelStore *)self atLoiGroupID:(SEL)a3 fromTime:(const uuid *)a4 limit:(const uuid *)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  v12 = [MEMORY[0x263EFF980] array];
  v13 = objc_msgSend((id)-[ULStore db](self, "db")[88], "getTriggerUUIDsForLoiGroupId:", a5);
  BOOL v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  v15 = [v14 UUIDString];

  v16 = (void *)MEMORY[0x263F08A98];
  v17 = [NSNumber numberWithDouble:*(double *)a6];
  v18 = [v16 predicateWithFormat:@"%K > %@", @"receivedTimestamp", v17];
  [v12 addObject:v18];

  v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v15];
  [v12 addObject:v19];

  v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"triggerUUID", v13];
  [v12 addObject:v20];

  v21 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
  v24[0] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [(ULLabelStore *)self _fetchLabelsByAndPredicates:v12 sortDescriptors:v22 andLimit:a7];

  return result;
}

- (vector<std::string,)getAllRecordingLabelsClientIds
{
  v25[1] = *MEMORY[0x263EF8340];
  unsigned int v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K!=NIL AND %K!=''", @"clientId", @"clientId");
  unsigned int v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v25[0] = v6;
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v10 = [(ULStore *)self fetchPropertyForEntityName:v8 propertyToFetch:@"clientId" distinctResults:1 byAndPredicates:v9 sortDescriptors:0 andLimit:v5];

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::vector<std::string>::reserve((std::vector<std::string> *)retstr, [v10 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (char *)[*(id *)(*((void *)&v19 + 1) + 8 * v14) UTF8String];
        v23 = v15;
        var1 = (char *)retstr->var1;
        if (var1 >= retstr->var2.var0)
        {
          v17 = (void *)std::vector<std::string>::__emplace_back_slow_path<char const*>((uint64_t *)retstr, &v23);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>((void *)retstr->var1, v15);
          v17 = var1 + 24;
          retstr->var1 = var1 + 24;
        }
        retstr->var1 = v17;
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v12);
  }

  return result;
}

- (BOOL)updateAllLabelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uuid v17 = a3;
  uuid v16 = a4;
  unsigned int v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v17];
  unsigned int v6 = [v5 UUIDString];

  unsigned int v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v16];
  v8 = [v7 UUIDString];

  BOOL v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceUUID", v6];
  uint64_t v14 = @"serviceUUID";
  v15 = v8;
  v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  LOBYTE(self) = [(ULStore *)self batchUpdateObjectsWithEntityName:v12 predicate:v9 propertiesToUpdate:v10];

  return (char)self;
}

- (BOOL)updateAllLabelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  v4 = v3;
  v15[1] = *MEMORY[0x263EF8340];
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  unsigned int v6 = [NSString stringWithUTF8String:var0];
  if (*((char *)v4 + 23) < 0) {
    v4 = (uint64_t *)*v4;
  }
  unsigned int v7 = [NSString stringWithUTF8String:v4];
  v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K CONTAINS %@", @"clientId", v6];
  uint64_t v14 = @"clientId";
  v15[0] = v7;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  BOOL v12 = [(ULStore *)self batchUpdateObjectsWithEntityName:v11 predicate:v8 propertiesToUpdate:v9];

  return v12;
}

@end