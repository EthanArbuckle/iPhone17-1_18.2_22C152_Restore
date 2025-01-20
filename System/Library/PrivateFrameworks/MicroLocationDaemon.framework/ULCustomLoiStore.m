@interface ULCustomLoiStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)addServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4;
- (BOOL)deleteAllCustomLoiOfDeletedServices;
- (BOOL)insertEntries:(const void *)a3;
- (BOOL)removeServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4;
- (BOOL)updateAllCustomLoiIdsWithMatchingServiceUUID:(const uuid *)a3 withNewServiceUUID:(const uuid *)a4;
- (vector<CLMiLoCustomLoiTable::Entry,)_fetchCustomLoisByAndPredicates:(ULCustomLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMiLoCustomLoiTable::Entry,)fetchAllRecordsWithLimit:(ULCustomLoiStore *)self;
- (vector<boost::uuids::uuid,)getAllCustomLoiIdsForServiceId:(ULCustomLoiStore *)self;
- (vector<boost::uuids::uuid,)getAllDistinctCustomLoiIds;
- (vector<boost::uuids::uuid,)getAllServicesEnabledAtCustomLoiId:(ULCustomLoiStore *)self;
@end

@implementation ULCustomLoiStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULMiLoCustomLoiTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1E60 unsignedIntValue];
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
  return @"lastSeenTimeStamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoCustomLoiTable::Entry,)_fetchCustomLoisByAndPredicates:(ULCustomLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoCustomLoiTable::Entry,)fetchAllRecordsWithLimit:(ULCustomLoiStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, a4, retstr);
  return result;
}

- (BOOL)removeServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4
{
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  v9 = [v8 UUIDString];

  v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v11 = [v10 UUIDString];

  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiId", v9];
  [v7 addObject:v12];

  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceId", v11];
  [v7 addObject:v13];

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  LOBYTE(self) = [(ULStore *)self batchDeleteObjectsWithEntityName:v15 byAndPredicates:v7 sortDescriptors:0 andLimit:0];

  return (char)self;
}

- (BOOL)addServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!-[ULCustomLoiStore removeServiceToCustomLoiMapping:loiId:](self, "removeServiceToCustomLoiMapping:loiId:")) {
    return 0;
  }
  __p = 0;
  v27 = 0;
  v28 = 0;
  uint64_t v7 = *(void *)a3->var0;
  uint64_t v8 = *(void *)&a3->var0[8];
  uint64_t v9 = *(void *)a4->var0;
  uint64_t v10 = *(void *)&a4->var0[8];
  double v11 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMiLoCustomLoiTable::Entry::Entry((uint64_t)buf, v7, v8, v9, v10, v11);
  v12 = std::__allocate_at_least[abi:ne180100]<std::allocator<CLMiLoCustomLoiTable::Entry>>((uint64_t)&v28, 1uLL);
  v13 = 0;
  v15 = (char *)v12 + 40 * v14;
  uint64_t v16 = v31;
  long long v17 = v30;
  _OWORD *v12 = *(_OWORD *)buf;
  v12[1] = v17;
  *((void *)v12 + 4) = v16;
  v18 = (char *)v12 + 40;
  v19 = (char *)__p;
  if (__p)
  {
    v20 = v12;
    do
    {
      long long v21 = *(_OWORD *)(v13 - 40);
      long long v22 = *(_OWORD *)(v13 - 24);
      v12 = (_OWORD *)((char *)v20 - 40);
      *((void *)v20 - 1) = *((void *)v13 - 1);
      *(_OWORD *)((char *)v20 - 24) = v22;
      *(_OWORD *)((char *)v20 - 40) = v21;
      v13 -= 40;
      v20 = (_OWORD *)((char *)v20 - 40);
    }
    while (v13 != v19);
  }
  __p = v12;
  v27 = v18;
  v28 = v15;
  if (v19) {
    operator delete(v19);
  }
  v27 = v18;
  BOOL v23 = [(ULCustomLoiStore *)self insertEntries:&__p];
  if (!v23)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_89);
    }
    v24 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v24, OS_LOG_TYPE_ERROR, "#Warning Failed to add Service Id to LOI Id mapping", buf, 2u);
    }
  }
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
  return v23;
}

- (vector<boost::uuids::uuid,)getAllServicesEnabledAtCustomLoiId:(ULCustomLoiStore *)self
{
  id v14 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiId", v8];
  [v14 addObject:v9];

  uint64_t v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  v12 = [(ULStore *)self fetchPropertyForEntityName:v11 propertyToFetch:@"serviceId" distinctResults:0 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  ULDBUtils::boostUUIDsFromNSStringArray(v12, retstr);

  return result;
}

- (vector<boost::uuids::uuid,)getAllCustomLoiIdsForServiceId:(ULCustomLoiStore *)self
{
  id v14 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceId", v8];
  [v14 addObject:v9];

  uint64_t v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  v12 = [(ULStore *)self fetchPropertyForEntityName:v11 propertyToFetch:@"loiId" distinctResults:0 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  ULDBUtils::boostUUIDsFromNSStringArray(v12, retstr);

  return result;
}

- (vector<boost::uuids::uuid,)getAllDistinctCustomLoiIds
{
  v12[1] = *MEMORY[0x263EF8340];
  unsigned int v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v12[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v10 = [(ULStore *)self fetchPropertyForEntityName:v8 propertyToFetch:@"loiId" distinctResults:1 byAndPredicates:0 sortDescriptors:v9 andLimit:v5];

  ULDBUtils::boostUUIDsFromNSStringArray(v10, retstr);
  return result;
}

- (BOOL)updateAllCustomLoiIdsWithMatchingServiceUUID:(const uuid *)a3 withNewServiceUUID:(const uuid *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  uint64_t v7 = [v6 UUIDString];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  uint64_t v9 = [v8 UUIDString];

  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceId", v7];
  v15 = @"serviceId";
  v16[0] = v9;
  double v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  LOBYTE(self) = [(ULStore *)self batchUpdateObjectsWithEntityName:v13 predicate:v10 propertiesToUpdate:v11];

  return (char)self;
}

- (BOOL)deleteAllCustomLoiOfDeletedServices
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_89);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all Custom Lois which refer to deleted services", buf, 2u);
  }
  v4 = objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
  unsigned int v5 = [MEMORY[0x263EFF980] array];
  unsigned int v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K in %@)", @"serviceId", v4];
  [v5 addObject:v6];

  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  BOOL v9 = [(ULStore *)self batchDeleteObjectsWithEntityName:v8 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v9;
}

@end