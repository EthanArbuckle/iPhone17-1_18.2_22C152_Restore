@interface ULServiceStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)deleteAllServicesWithExceptions:(const void *)a3;
- (BOOL)deleteAllServicesWithUUIDs:()vector<boost:(std::allocator<boost::uuids::uuid>> *)a3 :uuids::uuid;
- (BOOL)deleteOldestsServicesPerClientAboveMaxCount;
- (BOOL)deleteServiceForUUID:(uuid)a3;
- (BOOL)insertEntries:(const void *)a3;
- (BOOL)updateAllServicesWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (BOOL)updateAllServicesWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4;
- (BOOL)updateLastActiveTime:(uint64_t)a3 forService:(uint64_t)a4;
- (BOOL)updateServiceLocationTypes:(uuid)a3 withLocationTypes:(unint64_t)a4;
- (id)getAllServiceUUIDs:(unint64_t)a3;
- (id)getServiceUUIDsWithServiceType:(unsigned int)a3;
- (optional<CLMiLoServiceTable::Entry>)fetchServiceByUUID:()basic_string<char;
- (vector<CLMiLoServiceTable::Entry,)_fetchServicesByAndPredicates:(ULServiceStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMiLoServiceTable::Entry,)fetchAllRecordsWithLimit:(ULServiceStore *)self;
- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForClientId:(ULServiceStore *)self andUserId:(SEL)a3;
- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForServiceType:(ULServiceStore *)self;
- (void)deleteOldestsServicesPerClientAboveMaxCount;
@end

@implementation ULServiceStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULServicesTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F18D8 unsignedIntValue];
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
  return @"lastActiveTimestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMiLoServiceTable,ULServiceMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoServiceTable::Entry,)_fetchServicesByAndPredicates:(ULServiceStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMiLoServiceTable,ULServiceMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllRecordsWithLimit:(ULServiceStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMiLoServiceTable,ULServiceMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteServiceForUUID:(uuid)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uuid v11 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v11];
  unsigned int v6 = [v5 UUIDString];

  unsigned int v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v6];
  [v4 addObject:v7];

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  LOBYTE(self) = [(ULStore *)self batchDeleteObjectsWithEntityName:v9 byAndPredicates:v4 sortDescriptors:0 andLimit:0];

  return (char)self;
}

- (BOOL)deleteAllServicesWithUUIDs:()vector<boost:(std::allocator<boost::uuids::uuid>> *)a3 :uuids::uuid
{
  if (a3->var0 == a3->var1)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
    }
    v10 = logObject_MicroLocation_Default;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs were passed in to delete services", buf, 2u);
      return 0;
    }
  }
  else
  {
    v4 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    v5 = [MEMORY[0x263EFF980] array];
    unsigned int v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"serviceUUID", v4];
    [v5 addObject:v6];

    unsigned int v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    BOOL v9 = [(ULStore *)self batchDeleteObjectsWithEntityName:v8 byAndPredicates:v5 sortDescriptors:0 andLimit:0];
  }
  return v9;
}

- (BOOL)deleteAllServicesWithExceptions:(const void *)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  unsigned int v6 = [MEMORY[0x263EFF980] array];
  unsigned int v7 = *(uint64_t **)a3;
  v8 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    do
    {
      BOOL v9 = v7;
      if (*((char *)v7 + 23) < 0) {
        BOOL v9 = (uint64_t *)*v7;
      }
      v10 = [NSString stringWithUTF8String:v9];
      [v6 addObject:v10];

      v7 += 3;
    }
    while (v7 != v8);
  }
  uuid v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K IN %@)", @"clientId", v6];
  [v5 addObject:v11];

  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  BOOL v14 = [(ULStore *)self batchDeleteObjectsWithEntityName:v13 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v14;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForServiceType:(ULServiceStore *)self
{
  v12[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K=%u", @"serviceType", a4);
  [v7 addObject:v8];

  BOOL v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastActiveTimestamp" ascending:0];
  v12[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(ULServiceStore *)self _fetchServicesByAndPredicates:v7 sortDescriptors:v10 andLimit:v6];

  return result;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForClientId:(ULServiceStore *)self andUserId:(SEL)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  unsigned int v8 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  BOOL v9 = [MEMORY[0x263EFF980] array];
  v10 = (void *)MEMORY[0x263F08A98];
  if (*((char *)a4 + 23) >= 0) {
    uuid v11 = a4;
  }
  else {
    uuid v11 = *(const void **)a4;
  }
  uint64_t v12 = [NSString stringWithUTF8String:v11];
  v13 = [v10 predicateWithFormat:@"%K=%@", @"clientId", v12];
  [v9 addObject:v13];

  BOOL v14 = (void *)MEMORY[0x263F08A98];
  if (*((char *)a5 + 23) >= 0) {
    v15 = a5;
  }
  else {
    v15 = *(const void **)a5;
  }
  v16 = [NSString stringWithUTF8String:v15];
  v17 = [v14 predicateWithFormat:@"%K=%@", @"userId", v16];
  [v9 addObject:v17];

  v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastActiveTimestamp" ascending:0];
  v21[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [(ULServiceStore *)self _fetchServicesByAndPredicates:v9 sortDescriptors:v19 andLimit:v8];

  return result;
}

- (optional<CLMiLoServiceTable::Entry>)fetchServiceByUUID:()basic_string<char
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v22 = v3;
  uint64_t v23 = v4;
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  unsigned int v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v22];
  BOOL v9 = [v8 UUIDString];

  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v9];
  [v7 addObject:v10];

  uuid v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastActiveTimestamp" ascending:0];
  v21 = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [(ULServiceStore *)self _fetchServicesByAndPredicates:v7 sortDescriptors:v12 andLimit:1];

  uint64_t v13 = v19[0];
  if (v19[0] == v19[1])
  {
    char v17 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    long long v14 = *(_OWORD *)(v19[0] + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v19[0];
    *((_OWORD *)&retstr->var0.var2.var0.var0.var0.var1 + 1) = v14;
    *(_OWORD *)&retstr->var0.var2.var0.var1.var0[1] = *(_OWORD *)(v13 + 32);
    *(void *)(v13 + 32) = 0;
    *(void *)(v13 + 40) = 0;
    v15 = *(char **)(v13 + 48);
    unint64_t v16 = *(void *)(v13 + 56);
    *(void *)(v13 + 48) = 0;
    retstr[1].var0.var2.var0.var0.var0.var1.var0 = v15;
    retstr[1].var0.var2.var0.var0.var0.var1.var1 = v16;
    *((_OWORD *)&retstr[1].var0.var2.var0.var0.var0.var1 + 1) = *(_OWORD *)(v13 + 64);
    retstr[1].var0.var2.var0.var1.var0[1] = *(void *)(v13 + 80);
    *(void *)(v13 + 64) = 0;
    *(void *)(v13 + 72) = 0;
    char v17 = 1;
    *(void *)(v13 + 80) = 0;
  }
  LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = v17;
  v20 = (void **)v19;
  std::vector<CLMiLoServiceTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v20);

  return result;
}

- (BOOL)updateLastActiveTime:(uint64_t)a3 forService:(uint64_t)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  v23[0] = a4;
  v23[1] = a5;
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  unsigned int v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v23];
  BOOL v9 = [v8 UUIDString];

  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v9];
  [v7 addObject:v10];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uuid v11 = [a1 managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__ULServiceStore_updateLastActiveTime_forService___block_invoke;
  v15[3] = &unk_2653F9A50;
  v15[4] = a1;
  id v12 = v7;
  double v18 = a2;
  id v16 = v12;
  char v17 = &v19;
  [v11 performBlockAndWait:v15];

  BOOL v13 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __50__ULServiceStore_updateLastActiveTime_forService___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = [v2 fetchManagedObjectsWithEntityName:v4 byAndPredicates:*(void *)(a1 + 40) sortDescriptors:0 andLimit:0];

  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "setLastActiveTimestamp:", *(double *)(a1 + 56), (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) commitChangesToStore];
  }
  else
  {
    v10 = [*(id *)(a1 + 32) managedObjectContext];
    [v10 reset];
  }
}

- (BOOL)updateServiceLocationTypes:(uuid)a3 withLocationTypes:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uuid v21 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v21];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"serviceUUID", v8];
  [v6 addObject:v9];

  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v10 = [(ULStore *)self managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__ULServiceStore_updateServiceLocationTypes_withLocationTypes___block_invoke;
  v13[3] = &unk_2653F9A50;
  v13[4] = self;
  id v11 = v6;
  v15 = &v17;
  unint64_t v16 = a4;
  id v14 = v11;
  [v10 performBlockAndWait:v13];

  LOBYTE(v6) = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

void __63__ULServiceStore_updateServiceLocationTypes_withLocationTypes___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = [v2 fetchManagedObjectsWithEntityName:v4 byAndPredicates:*(void *)(a1 + 40) sortDescriptors:0 andLimit:0];

  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "setLocationTypes:", *(void *)(a1 + 56), (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) commitChangesToStore];
  }
  else
  {
    v10 = [*(id *)(a1 + 32) managedObjectContext];
    [v10 reset];
  }
}

- (id)getServiceUUIDsWithServiceType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K=%u", @"serviceType", v3);
  [v5 addObject:v6];

  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [(ULStore *)self fetchPropertyForEntityName:v8 propertyToFetch:@"serviceUUID" distinctResults:1 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v9;
}

- (id)getAllServiceUUIDs:(unint64_t)a3
{
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [(ULStore *)self fetchPropertyForEntityName:v6 propertyToFetch:@"serviceUUID" distinctResults:1 byAndPredicates:0 sortDescriptors:0 andLimit:a3];

  return v7;
}

- (BOOL)deleteOldestsServicesPerClientAboveMaxCount
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  [(ULServiceStore *)self fetchAllRecordsWithLimit:0];
  if (v88 != v89)
  {
    v87[0] = 0;
    v87[1] = 0;
    v86 = (uint64_t *)v87;
    uint64_t v3 = +[ULDefaultsSingleton shared];
    uint64_t v4 = [v3 defaultsDictionary];

    v5 = [NSString stringWithUTF8String:"ULMaximumNumberOfCreatedUnsupervisedServicesPerClientAfterMaintenance"];
    id v6 = [v4 objectForKey:v5];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v7 = [v6 unsignedLongValue];
    }
    else {
      uint64_t v7 = [&unk_2704F1890 unsignedLongValue];
    }
    uint64_t v8 = v7;

    v91.__r_.__value_.__r.__words[0] = 1;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v8;
    uint64_t v9 = +[ULDefaultsSingleton shared];
    v10 = [v9 defaultsDictionary];

    long long v11 = [NSString stringWithUTF8String:"ULMaximumNumberOfCreatedBinaryRoiServicesPerClientAfterMaintenance"];
    long long v12 = [v10 objectForKey:v11];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v13 = [v12 unsignedLongValue];
    }
    else {
      uint64_t v13 = [&unk_2704F1890 unsignedLongValue];
    }
    uint64_t v14 = v13;

    v91.__r_.__value_.__r.__words[0] = 2;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v14;
    v15 = +[ULDefaultsSingleton shared];
    uint64_t v16 = [v15 defaultsDictionary];

    uint64_t v17 = [NSString stringWithUTF8String:"ULMaximumNumberOfCreatedMulticlassServicesPerClientAfterMaintenance"];
    double v18 = [v16 objectForKey:v17];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v19 = [v18 unsignedLongValue];
    }
    else {
      uint64_t v19 = [&unk_2704F1890 unsignedLongValue];
    }
    uint64_t v20 = v19;

    v91.__r_.__value_.__r.__words[0] = 3;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v20;
    uuid v21 = +[ULDefaultsSingleton shared];
    uint64_t v22 = [v21 defaultsDictionary];

    uint64_t v23 = [NSString stringWithUTF8String:"ULMaximumNumberOfCreatedSimilarityListServicesPerClientAfterMaintenance"];
    uint64_t v24 = [v22 objectForKey:v23];
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v25 = [v24 unsignedLongValue];
    }
    else {
      uint64_t v25 = [&unk_2704F18A8 unsignedLongValue];
    }
    uint64_t v26 = v25;

    v91.__r_.__value_.__r.__words[0] = 4;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v26;
    v85[0] = 0;
    v85[1] = 0;
    v84 = (std::string *)v85;
    uint64_t v27 = v88;
    uint64_t v28 = v89;
    if (v88 == v89) {
      goto LABEL_86;
    }
    v77 = self;
    do
    {
      if (*(char *)(v27 + 55) < 0)
      {
        std::string::__init_copy_ctor_external(&v91, *(const std::string::value_type **)(v27 + 32), *(void *)(v27 + 40));
      }
      else
      {
        long long v29 = *(_OWORD *)(v27 + 32);
        v91.__r_.__value_.__r.__words[2] = *(void *)(v27 + 48);
        *(_OWORD *)&v91.__r_.__value_.__l.__data_ = v29;
      }
      uint64_t v92 = *(void *)v27;
      v81 = &v91;
      v30 = std::__tree<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::__map_value_compare<std::pair<std::string,unsigned long long>,std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::less<std::pair<std::string,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>>>::__emplace_unique_key_args<std::pair<std::string,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::pair<std::string,unsigned long long>&&>,std::tuple<>>((uint64_t **)&v84, (const void **)&v91.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v81);
      unint64_t v31 = v30[9];
      if (v31 >= v30[10])
      {
        uint64_t v32 = std::vector<CLMiLoServiceTable::Entry>::__emplace_back_slow_path<CLMiLoServiceTable::Entry const&>(v30 + 8, v27);
      }
      else
      {
        std::allocator<CLMiLoServiceTable::Entry>::construct[abi:ne180100]<CLMiLoServiceTable::Entry,CLMiLoServiceTable::Entry const&>((uint64_t)(v30 + 10), v31, v27);
        uint64_t v32 = v31 + 88;
        v30[9] = v31 + 88;
      }
      v30[9] = v32;
      if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v91.__r_.__value_.__l.__data_);
      }
      v27 += 88;
    }
    while (v27 != v28);
    v33 = (uint64_t *)v84;
    v81 = 0;
    v82 = 0;
    v83 = 0;
    if (v84 == (std::string *)v85)
    {
LABEL_86:
      char v72 = 1;
    }
    else
    {
      do
      {
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
        }
        v34 = (std::string::size_type *)(v33 + 4);
        v35 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          std::string::size_type v36 = (std::string::size_type)(v33 + 4);
          if (*((char *)v33 + 55) < 0) {
            std::string::size_type v36 = *v34;
          }
          uint64_t v37 = v33[7];
          uint64_t v38 = 0x2E8BA2E8BA2E8BA3 * ((v33[9] - v33[8]) >> 3);
          LODWORD(v91.__r_.__value_.__l.__data_) = 136315650;
          *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v36;
          WORD2(v91.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v91.__r_.__value_.__r.__words[1] + 6) = v38;
          HIWORD(v91.__r_.__value_.__r.__words[2]) = 2048;
          uint64_t v92 = v37;
          _os_log_impl(&dword_25631F000, v35, OS_LOG_TYPE_DEFAULT, "Pre-Maintenance for services: client: %s has: %ld services of serviceType: %llU", (uint8_t *)&v91, 0x20u);
        }
        v39 = (std::string::size_type *)(v33 + 7);
        v40 = v87[0];
        if (!v87[0]) {
          goto LABEL_45;
        }
        std::string::size_type v41 = *v39;
        v42 = v87;
        do
        {
          v43 = v40;
          v44 = v42;
          std::string::size_type v45 = v40[4];
          v46 = v40 + 1;
          if (v45 >= v41)
          {
            v46 = v43;
            v42 = (void **)v43;
          }
          v40 = (void *)*v46;
        }
        while (v40);
        if (v42 == v87) {
          goto LABEL_45;
        }
        if (v45 < v41) {
          v43 = v44;
        }
        if (v41 >= v43[4])
        {
          v90 = v33 + 7;
          unint64_t v52 = std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)v33 + 7, (uint64_t)&std::piecewise_construct, &v90)[5];
          unint64_t v53 = 0x2E8BA2E8BA2E8BA3 * ((v33[9] - v33[8]) >> 3);
          unint64_t v54 = v53 - v52;
          if (v53 > v52)
          {
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
            }
            v55 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
            {
              if (*((char *)v33 + 55) < 0) {
                v34 = (std::string::size_type *)*v34;
              }
              std::string::size_type v56 = *v39;
              LODWORD(v91.__r_.__value_.__l.__data_) = 134218754;
              *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v53 - v52;
              WORD2(v91.__r_.__value_.__r.__words[1]) = 2080;
              *(std::string::size_type *)((char *)&v91.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v34;
              HIWORD(v91.__r_.__value_.__r.__words[2]) = 2048;
              uint64_t v92 = v56;
              __int16 v93 = 2048;
              unint64_t v94 = v52;
              _os_log_impl(&dword_25631F000, v55, OS_LOG_TYPE_DEFAULT, "%ld entries to be deleted for client: %s serviceType: %llU (max allowed: %ld)", (uint8_t *)&v91, 0x2Au);
            }
            v57 = (long long *)v33[8];
            uint64_t v58 = v33[9];
            unint64_t v59 = 126 - 2 * __clz(0x2E8BA2E8BA2E8BA3 * ((v58 - (uint64_t)v57) >> 3));
            if ((long long *)v58 == v57) {
              uint64_t v60 = 0;
            }
            else {
              uint64_t v60 = v59;
            }
            std::__introsort<std::_ClassicAlgPolicy,[(ULServiceStore *)v57 deleteOldestsServicesPerClientAboveMaxCount];
            if (v53 != v52)
            {
              uint64_t v61 = v33[8];
              v62 = v82;
              do
              {
                v63 = (_OWORD *)(v61 + 8);
                if (v62 >= v83)
                {
                  uint64_t v64 = (v62 - (unsigned char *)v81) >> 4;
                  if ((unint64_t)(v64 + 1) >> 60) {
                    std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v65 = (v83 - (unsigned char *)v81) >> 3;
                  if (v65 <= v64 + 1) {
                    unint64_t v65 = v64 + 1;
                  }
                  if ((unint64_t)(v83 - (unsigned char *)v81) >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v66 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v66 = v65;
                  }
                  if (v66) {
                    v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::uuids::uuid>>((uint64_t)&v83, v66);
                  }
                  else {
                    v67 = 0;
                  }
                  v68 = &v67[16 * v64];
                  *(_OWORD *)v68 = *v63;
                  v70 = (char *)v81;
                  v69 = v82;
                  v71 = v68;
                  if (v82 != v81)
                  {
                    do
                    {
                      *((_OWORD *)v71 - 1) = *((_OWORD *)v69 - 1);
                      v71 -= 16;
                      v69 -= 16;
                    }
                    while (v69 != v70);
                    v69 = (char *)v81;
                  }
                  v62 = v68 + 16;
                  v81 = v71;
                  v82 = v68 + 16;
                  v83 = &v67[16 * v66];
                  if (v69) {
                    operator delete(v69);
                  }
                }
                else
                {
                  *(_OWORD *)v62 = *v63;
                  v62 += 16;
                }
                v82 = v62;
                v61 += 88;
              }
              while (v61 != v33[8] + 88 * v54);
            }
          }
        }
        else
        {
LABEL_45:
          if (onceToken_MicroLocation_Default != -1) {
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
          }
          v47 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          {
            std::string::size_type v48 = *v39;
            LODWORD(v91.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v48;
            _os_log_impl(&dword_25631F000, v47, OS_LOG_TYPE_ERROR, "serviceType %llU not handled in delete old services per client", (uint8_t *)&v91, 0xCu);
          }
        }
        v49 = (uint64_t *)v33[1];
        if (v49)
        {
          do
          {
            v50 = v49;
            v49 = (uint64_t *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            v50 = (uint64_t *)v33[2];
            BOOL v51 = *v50 == (void)v33;
            v33 = v50;
          }
          while (!v51);
        }
        v33 = v50;
      }
      while (v50 != (uint64_t *)v85);
      v74 = v82;
      if (v81 == v82)
      {
        char v72 = 1;
        if (!v82) {
          goto LABEL_101;
        }
      }
      else
      {
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
        }
        v75 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v91.__r_.__value_.__l.__data_) = 134217984;
          *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = (v82 - (unsigned char *)v81) >> 4;
          _os_log_impl(&dword_25631F000, v75, OS_LOG_TYPE_DEFAULT, "Deleting total %ld service entries", (uint8_t *)&v91, 0xCu);
        }
        __p = 0;
        v79 = 0;
        uint64_t v80 = 0;
        std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v81, (uint64_t)v82, (v82 - (unsigned char *)v81) >> 4);
        char v72 = [(ULServiceStore *)v77 deleteAllServicesWithUUIDs:&__p];
        if (__p)
        {
          v79 = __p;
          operator delete(__p);
        }
        v74 = (char *)v81;
        if (!v81) {
          goto LABEL_101;
        }
      }
      v82 = v74;
      operator delete(v74);
    }
LABEL_101:
    std::__tree<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::__map_value_compare<std::pair<std::string,unsigned long long>,std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::less<std::pair<std::string,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>>>::destroy((uint64_t)&v84, v85[0]);
    std::__tree<std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>,std::__map_value_compare<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>,std::less<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes>,true>,std::allocator<std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>>>::destroy((uint64_t)&v86, v87[0]);
    goto LABEL_102;
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_45);
  }
  v73 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v91.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_25631F000, v73, OS_LOG_TYPE_DEFAULT, "Pre-Maintenance for services: no services found.", (uint8_t *)&v91, 2u);
  }
  char v72 = 1;
LABEL_102:
  v91.__r_.__value_.__r.__words[0] = (std::string::size_type)&v88;
  std::vector<CLMiLoServiceTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v91);
  return v72;
}

- (BOOL)updateAllServicesWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uuid v17 = a3;
  uuid v16 = a4;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v17];
  id v6 = [v5 UUIDString];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v16];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceUUID", v6];
  uint64_t v14 = @"serviceUUID";
  v15 = v8;
  v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  long long v11 = (objc_class *)objc_opt_class();
  long long v12 = NSStringFromClass(v11);
  LOBYTE(self) = [(ULStore *)self batchUpdateObjectsWithEntityName:v12 predicate:v9 propertiesToUpdate:v10];

  return (char)self;
}

- (BOOL)updateAllServicesWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  uint64_t v4 = v3;
  v15[1] = *MEMORY[0x263EF8340];
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  id v6 = [NSString stringWithUTF8String:var0];
  if (*((char *)v4 + 23) < 0) {
    uint64_t v4 = (uint64_t *)*v4;
  }
  uint64_t v7 = [NSString stringWithUTF8String:v4];
  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K CONTAINS %@", @"clientId", v6];
  uint64_t v14 = @"clientId";
  v15[0] = v7;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  BOOL v12 = [(ULStore *)self batchUpdateObjectsWithEntityName:v11 predicate:v8 propertiesToUpdate:v9];

  return v12;
}

- (void)deleteOldestsServicesPerClientAboveMaxCount
{
  uint64_t v8 = (char *)a2;
  uint64_t v9 = a1;
  uint64_t v213 = *MEMORY[0x263EF8340];
  v204 = (char *)a2;
  v205 = a1;
  while (1)
  {
    uint64_t v10 = v8 - (char *)v9;
    unint64_t v11 = 0x2E8BA2E8BA2E8BA3 * ((v8 - (char *)v9) >> 3);
    if (v5 || !v4)
    {
      switch(v11)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          v204 = v8 - 88;
          if (*((double *)v8 - 8) >= *((double *)v9 + 3)) {
            return;
          }
          unint64_t v65 = &v205;
          unint64_t v66 = (uint64_t *)&v204;
          break;
        case 3uLL:
          v204 = v8 - 88;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)v9 deleteOldestsServicesPerClientAboveMaxCount];
          return;
        case 4uLL:
          v204 = v8 - 88;
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(uint64_t)v9 deleteOldestsServicesPerClientAboveMaxCount];
          return;
        case 5uLL:
          v204 = v8 - 88;
          *(void *)&long long v208 = v9;
          *(void *)v212 = (char *)v9 + 88;
          *(void *)v210 = v9 + 11;
          *(void *)v211 = (char *)v9 + 264;
          *(void *)v207 = v8 - 88;
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(uint64_t)v9 deleteOldestsServicesPerClientAboveMaxCount];
          if (*((double *)v8 - 8) >= *((double *)v9 + 36)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((long long **)v211, (uint64_t *)v207);
          if (*(double *)(*(void *)v211 + 24) >= *((double *)v9 + 25)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((long long **)v210, (uint64_t *)v211);
          if (*(double *)(*(void *)v210 + 24) >= *((double *)v9 + 14)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((long long **)v212, (uint64_t *)v210);
          if (*(double *)(*(void *)v212 + 24) >= *((double *)v9 + 3)) {
            return;
          }
          unint64_t v65 = (long long **)&v208;
          unint64_t v66 = (uint64_t *)v212;
          break;
        default:
          JUMPOUT(0);
      }
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>(v65, v66);
      return;
    }
    if (v10 <= 2111) {
      break;
    }
    if (!a3)
    {
      if (v9 != (long long *)v8)
      {
        int64_t v88 = (v11 - 2) >> 1;
        int64_t v89 = v88;
        v201 = v8;
        do
        {
          int64_t v90 = v89;
          if (v88 >= v89)
          {
            uint64_t v91 = (2 * v89) | 1;
            uint64_t v92 = (double *)v9 + 11 * v91;
            if (2 * v90 + 2 < (uint64_t)v11 && *((double *)v9 + 11 * v91 + 3) < v92[14])
            {
              v92 += 11;
              uint64_t v91 = 2 * v90 + 2;
            }
            double v93 = *((double *)v9 + 11 * v90 + 3);
            if (v92[3] >= v93)
            {
              unint64_t v94 = (double *)v9 + 11 * v90;
              long long v95 = *(_OWORD *)v94;
              *(double *)&long long v209 = v94[2];
              long long v208 = v95;
              uint64_t v183 = *((void *)v94 + 4);
              uint64_t v96 = *((void *)v94 + 5);
              *(double *)&v210[7] = *(double *)((char *)v94 + 47);
              *(void *)v210 = v96;
              char v187 = *((unsigned char *)v94 + 55);
              v94[4] = 0.0;
              v94[5] = 0.0;
              v94[6] = 0.0;
              uint64_t v182 = *((void *)v94 + 7);
              char v196 = *((unsigned char *)v94 + 64);
              uint64_t v97 = *(void *)((char *)v94 + 79);
              *(_OWORD *)v212 = *(_OWORD *)((char *)v94 + 65);
              *(void *)&v212[14] = v97;
              char v191 = *((unsigned char *)v94 + 87);
              v94[8] = 0.0;
              v94[9] = 0.0;
              v94[10] = 0.0;
              do
              {
                v98 = v92;
                long long v99 = *((_OWORD *)v92 + 1);
                *(_OWORD *)unint64_t v94 = *(_OWORD *)v92;
                *((_OWORD *)v94 + 1) = v99;
                v100 = (void **)(v94 + 4);
                if (*((char *)v94 + 55) < 0) {
                  operator delete(*v100);
                }
                long long v101 = *((_OWORD *)v98 + 2);
                v94[6] = v98[6];
                *(_OWORD *)v100 = v101;
                *((unsigned char *)v98 + 55) = 0;
                *((unsigned char *)v98 + 32) = 0;
                v94[7] = v98[7];
                v102 = (void **)(v94 + 8);
                if (*((char *)v94 + 87) < 0) {
                  operator delete(*v102);
                }
                long long v103 = *((_OWORD *)v98 + 4);
                v94[10] = v98[10];
                *(_OWORD *)v102 = v103;
                *((unsigned char *)v98 + 87) = 0;
                *((unsigned char *)v98 + 64) = 0;
                if (v88 < v91) {
                  break;
                }
                uint64_t v104 = (2 * v91) | 1;
                uint64_t v92 = (double *)v9 + 11 * v104;
                if (2 * v91 + 2 < (uint64_t)v11 && *((double *)v9 + 11 * v104 + 3) < v92[14])
                {
                  v92 += 11;
                  uint64_t v104 = 2 * v91 + 2;
                }
                unint64_t v94 = v98;
                uint64_t v91 = v104;
              }
              while (v92[3] >= v93);
              long long v105 = v208;
              *((void *)v98 + 2) = v209;
              *(_OWORD *)v98 = v105;
              v98[3] = v93;
              if (*((char *)v98 + 55) < 0)
              {
                operator delete(*((void **)v98 + 4));
                int v107 = *((char *)v98 + 87);
                uint64_t v108 = *(void *)v210;
                *((void *)v98 + 4) = v183;
                *((void *)v98 + 5) = v108;
                *(double *)((char *)v98 + 47) = *(double *)&v210[7];
                *((unsigned char *)v98 + 55) = v187;
                *((void *)v98 + 7) = v182;
                uint64_t v8 = v201;
                if (v107 < 0) {
                  operator delete(*((void **)v98 + 8));
                }
              }
              else
              {
                uint64_t v106 = *(void *)v210;
                *((void *)v98 + 4) = v183;
                *((void *)v98 + 5) = v106;
                *(double *)((char *)v98 + 47) = *(double *)&v210[7];
                *((unsigned char *)v98 + 55) = v187;
                *((void *)v98 + 7) = v182;
                uint64_t v8 = v201;
              }
              *((unsigned char *)v98 + 64) = v196;
              *(_OWORD *)((char *)v98 + 65) = *(_OWORD *)v212;
              *(double *)((char *)v98 + 79) = *(double *)&v212[14];
              *((unsigned char *)v98 + 87) = v191;
            }
          }
          int64_t v89 = v90 - 1;
        }
        while (v90);
        int64_t v109 = v10 / 0x58uLL;
        do
        {
          uint64_t v110 = 0;
          v111 = v8;
          long long v112 = v9[1];
          long long v208 = *v9;
          long long v209 = v112;
          uint64_t v113 = *((void *)v9 + 4);
          *(void *)v207 = *((void *)v9 + 5);
          *(void *)&v207[7] = *(void *)((char *)v9 + 47);
          char v192 = *((unsigned char *)v9 + 55);
          *((void *)v9 + 5) = 0;
          *((void *)v9 + 6) = 0;
          *((void *)v9 + 4) = 0;
          uint64_t v184 = v113;
          uint64_t v188 = *((void *)v9 + 7);
          uint64_t v197 = *((void *)v9 + 8);
          uint64_t v114 = *((void *)v9 + 9);
          *(void *)&v206[7] = *(void *)((char *)v9 + 79);
          *(void *)v206 = v114;
          char v202 = *((unsigned char *)v9 + 87);
          *((void *)v9 + 8) = 0;
          *((void *)v9 + 9) = 0;
          v115 = v9;
          *((void *)v9 + 10) = 0;
          do
          {
            uint64_t v116 = v110 + 1;
            v117 = (char *)v115 + 88 * v110 + 88;
            uint64_t v118 = 2 * v110;
            uint64_t v110 = (2 * v110) | 1;
            int64_t v119 = v118 + 2;
            if (v119 < v109 && *((double *)v115 + 11 * v116 + 3) < *((double *)v117 + 14))
            {
              v117 += 88;
              uint64_t v110 = v119;
            }
            long long v120 = *((_OWORD *)v117 + 1);
            long long *v115 = *(_OWORD *)v117;
            v115[1] = v120;
            v121 = (void **)(v115 + 2);
            if (*((char *)v115 + 55) < 0) {
              operator delete(*v121);
            }
            v122 = (void **)(v117 + 32);
            long long v123 = *((_OWORD *)v117 + 2);
            *((void *)v115 + 6) = *((void *)v117 + 6);
            *(_OWORD *)v121 = v123;
            v117[55] = 0;
            v117[32] = 0;
            *((void *)v115 + 7) = *((void *)v117 + 7);
            v124 = (void **)(v115 + 4);
            if (*((char *)v115 + 87) < 0) {
              operator delete(*v124);
            }
            long long v125 = *((_OWORD *)v117 + 4);
            *((void *)v115 + 10) = *((void *)v117 + 10);
            *(_OWORD *)v124 = v125;
            v117[87] = 0;
            v117[64] = 0;
            v115 = (long long *)v117;
          }
          while (v110 <= (uint64_t)((unint64_t)(v109 - 2) >> 1));
          v126 = (void **)(v117 + 64);
          v8 -= 88;
          if (v117 == v111 - 88)
          {
            long long v130 = v209;
            *(_OWORD *)v117 = v208;
            *((_OWORD *)v117 + 1) = v130;
            if (v117[55] < 0)
            {
              operator delete(*((void **)v117 + 4));
              int v156 = v117[87];
              *((void *)v117 + 4) = v184;
              uint64_t v157 = *(void *)&v207[7];
              *((void *)v117 + 5) = *(void *)v207;
              *(void *)(v117 + 47) = v157;
              v117[55] = v192;
              *((void *)v117 + 7) = v188;
              if (v156 < 0) {
                operator delete(*v126);
              }
            }
            else
            {
              *((void *)v117 + 4) = v184;
              uint64_t v131 = *(void *)v207;
              *(void *)(v117 + 47) = *(void *)&v207[7];
              *((void *)v117 + 5) = v131;
              v117[55] = v192;
              *((void *)v117 + 7) = v188;
            }
            *((void *)v117 + 8) = v197;
            uint64_t v158 = *(void *)v206;
            *(void *)(v117 + 79) = *(void *)&v206[7];
            *((void *)v117 + 9) = v158;
            v117[87] = v202;
          }
          else
          {
            long long v127 = *(_OWORD *)(v111 - 72);
            *(_OWORD *)v117 = *(_OWORD *)v8;
            *((_OWORD *)v117 + 1) = v127;
            if (v117[55] < 0) {
              operator delete(*v122);
            }
            long long v128 = *(_OWORD *)(v111 - 56);
            *((void *)v117 + 6) = *((void *)v111 - 5);
            *(_OWORD *)v122 = v128;
            *(v111 - 33) = 0;
            *(v111 - 56) = 0;
            *((void *)v117 + 7) = *((void *)v111 - 4);
            if (v117[87] < 0) {
              operator delete(*v126);
            }
            long long v129 = *(_OWORD *)(v111 - 24);
            *((void *)v117 + 10) = *((void *)v111 - 1);
            *(_OWORD *)v126 = v129;
            *(v111 - 1) = 0;
            *(v111 - 24) = 0;
            *(_OWORD *)uint64_t v8 = v208;
            *(_OWORD *)(v111 - 72) = v209;
            if (*(v111 - 33) < 0)
            {
              operator delete(*((void **)v111 - 7));
              int v132 = *(v111 - 1);
              *((void *)v111 - 7) = v184;
              *((void *)v111 - 6) = *(void *)v207;
              *(void *)(v111 - 41) = *(void *)&v207[7];
              *(v111 - 33) = v192;
              *((void *)v111 - 4) = v188;
              if (v132 < 0) {
                operator delete(*((void **)v111 - 3));
              }
            }
            else
            {
              *((void *)v111 - 7) = v184;
              *((void *)v111 - 6) = *(void *)v207;
              *(void *)(v111 - 41) = *(void *)&v207[7];
              *(v111 - 33) = v192;
              *((void *)v111 - 4) = v188;
            }
            uint64_t v133 = *(void *)v206;
            *((void *)v111 - 3) = v197;
            *((void *)v111 - 2) = v133;
            *(void *)(v111 - 9) = *(void *)&v206[7];
            *(v111 - 1) = v202;
            uint64_t v134 = v117 + 88 - (char *)v9;
            if (v134 >= 89)
            {
              unint64_t v135 = (v134 / 0x58uLL - 2) >> 1;
              double v136 = *((double *)v117 + 3);
              if (*((double *)v9 + 11 * v135 + 3) < v136)
              {
                long long v137 = *(_OWORD *)v117;
                *(void *)&v212[16] = *((void *)v117 + 2);
                *(_OWORD *)v212 = v137;
                v138 = (void *)*((void *)v117 + 4);
                uint64_t v139 = *((void *)v117 + 5);
                *(void *)&v211[7] = *(void *)(v117 + 47);
                *(void *)v211 = v139;
                char v140 = v117[55];
                *v122 = 0;
                *((void *)v117 + 5) = 0;
                *((void *)v117 + 6) = 0;
                uint64_t v185 = *((void *)v117 + 7);
                v189 = v138;
                char v203 = v117[64];
                uint64_t v141 = *(void *)(v117 + 79);
                *(_OWORD *)v210 = *(_OWORD *)(v117 + 65);
                *(void *)&v210[14] = v141;
                char v193 = v140;
                char v198 = v117[87];
                *v126 = 0;
                *((void *)v117 + 9) = 0;
                *((void *)v117 + 10) = 0;
                do
                {
                  v142 = (char *)v9 + 88 * v135;
                  long long v143 = *((_OWORD *)v142 + 1);
                  *(_OWORD *)v117 = *(_OWORD *)v142;
                  *((_OWORD *)v117 + 1) = v143;
                  v144 = (void **)(v117 + 32);
                  if (v117[55] < 0) {
                    operator delete(*v144);
                  }
                  v145 = (void **)(v142 + 32);
                  long long v146 = *((_OWORD *)v142 + 2);
                  *((void *)v117 + 6) = *((void *)v142 + 6);
                  *(_OWORD *)v144 = v146;
                  v142[55] = 0;
                  v142[32] = 0;
                  v147 = (char *)v9 + 88 * v135;
                  uint64_t v149 = *((void *)v147 + 7);
                  v148 = v147 + 56;
                  *((void *)v117 + 7) = v149;
                  v150 = (void **)(v117 + 64);
                  if (v117[87] < 0) {
                    operator delete(*v150);
                  }
                  v151 = (char *)v9 + 88 * v135;
                  long long v152 = *((_OWORD *)v151 + 4);
                  *((void *)v117 + 10) = *((void *)v151 + 10);
                  *(_OWORD *)v150 = v152;
                  v142[87] = 0;
                  v151[64] = 0;
                  if (!v135) {
                    break;
                  }
                  unint64_t v135 = (v135 - 1) >> 1;
                  v117 = v142;
                }
                while (*((double *)v9 + 11 * v135 + 3) < v136);
                v153 = v151 + 64;
                long long v154 = *(_OWORD *)v212;
                *((void *)v142 + 2) = *(void *)&v212[16];
                *(_OWORD *)v142 = v154;
                *((double *)v142 + 3) = v136;
                if (v142[55] < 0)
                {
                  operator delete(*v145);
                  int v159 = v142[87];
                  *v145 = v189;
                  uint64_t v160 = *(void *)&v211[7];
                  *((void *)v142 + 5) = *(void *)v211;
                  *(void *)(v142 + 47) = v160;
                  v142[55] = v193;
                  void *v148 = v185;
                  if (v159 < 0) {
                    operator delete(*(void **)v153);
                  }
                }
                else
                {
                  *v145 = v189;
                  uint64_t v155 = *(void *)v211;
                  *(void *)(v142 + 47) = *(void *)&v211[7];
                  *((void *)v142 + 5) = v155;
                  v142[55] = v193;
                  void *v148 = v185;
                }
                char *v153 = v203;
                long long v161 = *(_OWORD *)v210;
                *(void *)(v153 + 15) = *(void *)&v210[14];
                *(_OWORD *)(v153 + 1) = v161;
                v153[23] = v198;
              }
            }
          }
        }
        while (v109-- > 2);
      }
      return;
    }
    unint64_t v12 = v11 >> 1;
    uint64_t v13 = (uint64_t)(v8 - 88);
    if ((unint64_t)v10 >= 0x2C01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)v9 deleteOldestsServicesPerClientAboveMaxCount];
      uint64_t v14 = 88 * v12;
      uint64_t v15 = 88 * v12 - 88;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)v205 + 11 deleteOldestsServicesPerClientAboveMaxCount];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)v205 + 22 deleteOldestsServicesPerClientAboveMaxCount];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)((char *)v205 + v15) deleteOldestsServicesPerClientAboveMaxCount];
      *(void *)&long long v208 = (char *)v205 + v14;
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>(&v205, (uint64_t *)&v208);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(double *)v9 + 11 * (v11 >> 1) deleteOldestsServicesPerClientAboveMaxCount];
    }
    uuid v16 = v205;
    uint64_t v199 = a3 - 1;
    if (a4)
    {
      int v194 = a4;
      unint64_t v17 = (unint64_t)v204;
      double v18 = *((double *)v205 + 3);
    }
    else
    {
      double v18 = *((double *)v205 + 3);
      unint64_t v17 = (unint64_t)v204;
      if (*((double *)v205 - 8) >= v18)
      {
        *(void *)v207 = v204;
        long long v208 = *v205;
        *(void *)&long long v209 = *((void *)v205 + 2);
        uint64_t v32 = (void **)(v205 + 2);
        uint64_t v31 = *((void *)v205 + 4);
        *(void *)v210 = *((void *)v205 + 5);
        *(void *)&v210[7] = *(void *)((char *)v205 + 47);
        char v33 = *((unsigned char *)v205 + 55);
        *((void *)v205 + 4) = 0;
        *((void *)v16 + 5) = 0;
        *((void *)v16 + 6) = 0;
        uint64_t v34 = *((void *)v16 + 7);
        std::string::size_type v36 = (void **)(v16 + 4);
        char v35 = *((unsigned char *)v16 + 64);
        long long v37 = *(long long *)((char *)v16 + 65);
        *(void *)&v212[14] = *(void *)((char *)v16 + 79);
        *(_OWORD *)v212 = v37;
        char v38 = *((unsigned char *)v16 + 87);
        *((void *)v16 + 8) = 0;
        *((void *)v16 + 9) = 0;
        *((void *)v16 + 10) = 0;
        if (v18 >= *(double *)(v17 - 64))
        {
          unint64_t v53 = (double *)v16 + 11;
          do
          {
            unint64_t v40 = (unint64_t)v53;
            if ((unint64_t)v53 >= v17) {
              break;
            }
            double v54 = v53[3];
            v53 += 11;
          }
          while (v18 >= v54);
        }
        else
        {
          v39 = v16;
          do
          {
            unint64_t v40 = (unint64_t)v39 + 88;
            double v41 = *((double *)v39 + 14);
            v39 = (long long *)((char *)v39 + 88);
          }
          while (v18 >= v41);
        }
        *(void *)v211 = v40;
        if (v40 < v17)
        {
          do
          {
            double v55 = *(double *)(v17 - 64);
            v17 -= 88;
          }
          while (v18 < v55);
          goto LABEL_55;
        }
        while (v40 < v17)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((long long **)v211, (uint64_t *)v207);
          unint64_t v40 = *(void *)v211;
          do
          {
            double v56 = *(double *)(v40 + 112);
            v40 += 88;
          }
          while (v18 >= v56);
          *(void *)v211 = v40;
          unint64_t v17 = *(void *)v207;
          do
          {
            double v57 = *(double *)(v17 - 64);
            v17 -= 88;
          }
          while (v18 < v57);
LABEL_55:
          *(void *)v207 = v17;
        }
        uint64_t v58 = (long long *)(v40 - 88);
        BOOL v4 = v40 - 88 >= (unint64_t)v16;
        BOOL v5 = v40 - 88 == (void)v16;
        if ((long long *)(v40 - 88) != v16)
        {
          long long v59 = *(_OWORD *)(v40 - 72);
          long long *v16 = *v58;
          v16[1] = v59;
          if (*((char *)v16 + 55) < 0) {
            operator delete(*v32);
          }
          long long v60 = *(_OWORD *)(v40 - 56);
          *((void *)v16 + 6) = *(void *)(v40 - 40);
          *(_OWORD *)uint64_t v32 = v60;
          *(unsigned char *)(v40 - 33) = 0;
          *(unsigned char *)(v40 - 56) = 0;
          *((void *)v16 + 7) = *(void *)(v40 - 32);
          if (*((char *)v16 + 87) < 0) {
            operator delete(*v36);
          }
          long long v61 = *(_OWORD *)(v40 - 24);
          *((void *)v16 + 10) = *(void *)(v40 - 8);
          *(_OWORD *)std::string::size_type v36 = v61;
          *(unsigned char *)(v40 - 1) = 0;
          *(unsigned char *)(v40 - 24) = 0;
        }
        long long v62 = v208;
        *(void *)(v40 - 72) = v209;
        *uint64_t v58 = v62;
        *(double *)(v40 - 64) = v18;
        if (*(char *)(v40 - 33) < 0) {
          operator delete(*(void **)(v40 - 56));
        }
        *(void *)(v40 - 56) = v31;
        uint64_t v63 = *(void *)v210;
        *(void *)(v40 - 41) = *(void *)&v210[7];
        *(void *)(v40 - 48) = v63;
        *(unsigned char *)(v40 - 33) = v33;
        *(void *)(v40 - 32) = v34;
        if (*(char *)(v40 - 1) < 0) {
          operator delete(*(void **)(v40 - 24));
        }
        a4 = 0;
        *(unsigned char *)(v40 - 24) = v35;
        long long v64 = *(_OWORD *)v212;
        *(void *)(v40 - 9) = *(void *)&v212[14];
        *(_OWORD *)(v40 - 23) = v64;
        *(unsigned char *)(v40 - 1) = v38;
        uint64_t v9 = *(long long **)v211;
        v205 = *(long long **)v211;
        a3 = v199;
        goto LABEL_73;
      }
      int v194 = a4;
    }
    uint64_t v19 = 0;
    long long v208 = *v205;
    *(void *)&long long v209 = *((void *)v205 + 2);
    uint64_t v20 = (void **)(v205 + 2);
    uint64_t v186 = *((void *)v205 + 4);
    *(void *)v210 = *((void *)v205 + 5);
    *(void *)&v210[7] = *(void *)((char *)v205 + 47);
    char v21 = *((unsigned char *)v205 + 55);
    *((void *)v205 + 4) = 0;
    *((void *)v16 + 5) = 0;
    *((void *)v16 + 6) = 0;
    uint64_t v22 = *((void *)v16 + 7);
    uint64_t v23 = (void **)(v16 + 4);
    char v190 = *((unsigned char *)v16 + 64);
    long long v24 = *(long long *)((char *)v16 + 65);
    *(void *)&v212[14] = *(void *)((char *)v16 + 79);
    *(_OWORD *)v212 = v24;
    char v25 = *((unsigned char *)v16 + 87);
    *((void *)v16 + 8) = 0;
    *((void *)v16 + 9) = 0;
    *((void *)v16 + 10) = 0;
    do
    {
      double v26 = *(double *)((char *)v16 + v19 + 112);
      v19 += 88;
    }
    while (v26 < v18);
    uint64_t v27 = (char *)v16 + v19;
    *(void *)v211 = (char *)v16 + v19;
    if (v19 == 88)
    {
      while ((unint64_t)v27 < v17)
      {
        unint64_t v28 = v17 - 88;
        double v30 = *(double *)(v17 - 64);
        v17 -= 88;
        if (v30 < v18) {
          goto LABEL_26;
        }
      }
      unint64_t v28 = v17;
    }
    else
    {
      do
      {
        unint64_t v28 = v17 - 88;
        double v29 = *(double *)(v17 - 64);
        v17 -= 88;
      }
      while (v29 >= v18);
    }
LABEL_26:
    *(void *)v207 = v28;
    uint64_t v9 = (long long *)((char *)v16 + v19);
    if ((unint64_t)v27 < v28)
    {
      do
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((long long **)v211, (uint64_t *)v207);
        uint64_t v9 = *(long long **)v211;
        do
        {
          double v42 = *((double *)v9 + 14);
          uint64_t v9 = (long long *)((char *)v9 + 88);
        }
        while (v42 < v18);
        *(void *)v211 = v9;
        unint64_t v43 = *(void *)v207;
        do
        {
          double v44 = *(double *)(v43 - 64);
          v43 -= 88;
        }
        while (v44 >= v18);
        *(void *)v207 = v43;
      }
      while ((unint64_t)v9 < v43);
    }
    std::string::size_type v45 = (long long *)((char *)v9 - 88);
    if ((long long *)((char *)v9 - 88) != v16)
    {
      long long v46 = *(long long *)((char *)v9 - 72);
      long long *v16 = *v45;
      v16[1] = v46;
      if (*((char *)v16 + 55) < 0) {
        operator delete(*v20);
      }
      long long v47 = *(long long *)((char *)v9 - 56);
      *((void *)v16 + 6) = *((void *)v9 - 5);
      *(_OWORD *)uint64_t v20 = v47;
      *((unsigned char *)v9 - 33) = 0;
      *((unsigned char *)v9 - 56) = 0;
      *((void *)v16 + 7) = *((void *)v9 - 4);
      if (*((char *)v16 + 87) < 0) {
        operator delete(*v23);
      }
      long long v48 = *(long long *)((char *)v9 - 24);
      *((void *)v16 + 10) = *((void *)v9 - 1);
      *(_OWORD *)uint64_t v23 = v48;
      *((unsigned char *)v9 - 1) = 0;
      *((unsigned char *)v9 - 24) = 0;
    }
    long long v49 = v208;
    *((void *)v9 - 9) = v209;
    *std::string::size_type v45 = v49;
    *((double *)v9 - 8) = v18;
    if (*((char *)v9 - 33) < 0) {
      operator delete(*((void **)v9 - 7));
    }
    *((void *)v9 - 7) = v186;
    uint64_t v50 = *(void *)v210;
    *(void *)((char *)v9 - 41) = *(void *)&v210[7];
    *((void *)v9 - 6) = v50;
    *((unsigned char *)v9 - 33) = v21;
    *((void *)v9 - 4) = v22;
    if (*((char *)v9 - 1) < 0) {
      operator delete(*((void **)v9 - 3));
    }
    *((unsigned char *)v9 - 24) = v190;
    long long v51 = *(_OWORD *)v212;
    *(void *)((char *)v9 - 9) = *(void *)&v212[14];
    *(long long *)((char *)v9 - 23) = v51;
    *((unsigned char *)v9 - 1) = v25;
    a3 = v199;
    a4 = v194;
    if ((unint64_t)v27 < v28) {
      goto LABEL_43;
    }
    BOOL v52 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(uint64_t)v205 deleteOldestsServicesPerClientAboveMaxCount];
    if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(ULServiceStore *)(uint64_t)v9 deleteOldestsServicesPerClientAboveMaxCount])
    {
      if (!v52)
      {
LABEL_43:
        std::__introsort<std::_ClassicAlgPolicy,[(ULServiceStore *)v205 deleteOldestsServicesPerClientAboveMaxCount];
        a4 = 0;
      }
      v205 = v9;
      goto LABEL_73;
    }
    if (v52) {
      return;
    }
    v204 = (char *)v9 - 88;
    uint64_t v9 = v205;
LABEL_73:
    uint64_t v8 = v204;
  }
  v67 = (char *)v9 + 88;
  BOOL v69 = v9 == (long long *)v8 || v67 == v8;
  if (a4)
  {
    if (!v69)
    {
      uint64_t v70 = 0;
      v71 = v9;
      v200 = v8;
      do
      {
        char v72 = v67;
        if (*((double *)v71 + 14) < *((double *)v71 + 3))
        {
          long long v73 = *(_OWORD *)v67;
          *(void *)&long long v209 = *((void *)v67 + 2);
          long long v208 = v73;
          double v74 = *((double *)v67 + 3);
          uint64_t v75 = *((void *)v71 + 15);
          *(void *)v210 = *((void *)v71 + 16);
          *(void *)&v210[7] = *(void *)((char *)v71 + 135);
          char v76 = *((unsigned char *)v71 + 143);
          *((void *)v71 + 15) = 0;
          *((void *)v71 + 16) = 0;
          *((void *)v71 + 17) = 0;
          uint64_t v77 = *((void *)v71 + 18);
          char v195 = *((unsigned char *)v71 + 152);
          long long v78 = *(long long *)((char *)v71 + 153);
          *(void *)&v212[14] = *(void *)((char *)v71 + 167);
          char v79 = *((unsigned char *)v71 + 175);
          *((void *)v71 + 19) = 0;
          *((void *)v71 + 20) = 0;
          *((void *)v71 + 21) = 0;
          uint64_t v80 = v70;
          *(_OWORD *)v212 = v78;
          while (1)
          {
            v81 = (char *)v9 + v80;
            long long v82 = *(long long *)((char *)v9 + v80 + 16);
            *(_OWORD *)(v81 + 88) = *(long long *)((char *)v9 + v80);
            *(_OWORD *)(v81 + 104) = v82;
            v83 = (void **)((char *)v9 + v80 + 120);
            if (*((char *)v9 + v80 + 143) < 0) {
              operator delete(*v83);
            }
            *(_OWORD *)v83 = *((_OWORD *)v81 + 2);
            *(void *)((char *)v9 + v80 + 136) = *((void *)v81 + 6);
            v81[55] = 0;
            v81[32] = 0;
            *((void *)v81 + 18) = *((void *)v81 + 7);
            v84 = v81 + 152;
            if (v81[175] < 0) {
              operator delete(*(void **)v84);
            }
            v85 = (char *)v9 + v80;
            *(_OWORD *)v84 = *(long long *)((char *)v9 + v80 + 64);
            *((void *)v84 + 2) = *(void *)((char *)v9 + v80 + 80);
            v85[87] = 0;
            v85[64] = 0;
            if (!v80) {
              break;
            }
            v80 -= 88;
            if (v74 >= *((double *)v85 - 8))
            {
              uint64_t v86 = (uint64_t)v9 + v80 + 88;
              goto LABEL_104;
            }
          }
          uint64_t v86 = (uint64_t)v9;
LABEL_104:
          long long v87 = v208;
          *(void *)(v86 + 16) = v209;
          *(_OWORD *)uint64_t v86 = v87;
          *(double *)(v86 + 24) = v74;
          if (*(char *)(v86 + 55) < 0) {
            operator delete(*((void **)v85 + 4));
          }
          *((void *)v85 + 4) = v75;
          *(void *)(v86 + 40) = *(void *)v210;
          *(void *)(v86 + 47) = *(void *)&v210[7];
          *(unsigned char *)(v86 + 55) = v76;
          *(void *)(v86 + 56) = v77;
          uint64_t v8 = v200;
          if (*(char *)(v86 + 87) < 0) {
            operator delete(*((void **)v85 + 8));
          }
          v85[64] = v195;
          *(_OWORD *)(v86 + 65) = *(_OWORD *)v212;
          *(void *)(v86 + 79) = *(void *)&v212[14];
          *(unsigned char *)(v86 + 87) = v79;
        }
        v67 = v72 + 88;
        v70 += 88;
        v71 = (long long *)v72;
      }
      while (v72 + 88 != v8);
    }
  }
  else if (!v69)
  {
    v163 = (char *)v9 + 175;
    do
    {
      v164 = (long long *)v67;
      if (*((double *)v9 + 14) < *((double *)v9 + 3))
      {
        long long v165 = *(_OWORD *)v67;
        *(void *)&long long v209 = *((void *)v67 + 2);
        long long v208 = v165;
        double v166 = *((double *)v67 + 3);
        uint64_t v167 = *((void *)v9 + 15);
        *(void *)v210 = *((void *)v9 + 16);
        *(void *)&v210[7] = *(void *)((char *)v9 + 135);
        char v168 = *((unsigned char *)v9 + 143);
        *((void *)v9 + 15) = 0;
        *((void *)v9 + 16) = 0;
        *((void *)v9 + 17) = 0;
        uint64_t v169 = *((void *)v9 + 18);
        char v170 = *((unsigned char *)v9 + 152);
        long long v171 = *(long long *)((char *)v9 + 153);
        *(void *)&v212[14] = *(void *)((char *)v9 + 167);
        char v172 = *((unsigned char *)v9 + 175);
        *((void *)v9 + 19) = 0;
        *((void *)v9 + 20) = 0;
        *((void *)v9 + 21) = 0;
        v173 = v163;
        *(_OWORD *)v212 = v171;
        do
        {
          *(_OWORD *)(v173 - 87) = *(_OWORD *)(v173 - 175);
          *(_OWORD *)(v173 - 71) = *(_OWORD *)(v173 - 159);
          v174 = (void **)(v173 - 55);
          if ((char)*(v173 - 32) < 0) {
            operator delete(*v174);
          }
          *(_OWORD *)v174 = *(_OWORD *)(v173 - 143);
          *(void *)(v173 - 39) = *(void *)(v173 - 127);
          *(v173 - 120) = 0;
          *(v173 - 143) = 0;
          *(void *)(v173 - 31) = *(void *)(v173 - 119);
          v175 = v173 - 23;
          if ((char)*v173 < 0) {
            operator delete(*(void **)v175);
          }
          uint64_t v176 = *(void *)(v173 - 95);
          *(v173 - 88) = 0;
          v173 -= 88;
          *((void *)v175 + 2) = v176;
          *(_OWORD *)v175 = *(_OWORD *)(v173 - 23);
          *(v173 - 23) = 0;
        }
        while (v166 < *(double *)(v173 - 151));
        long long v177 = v208;
        *(void *)(v173 - 71) = v209;
        *(_OWORD *)(v173 - 87) = v177;
        *(double *)(v173 - 63) = v166;
        if ((char)*(v173 - 32) < 0)
        {
          operator delete(*(void **)(v173 - 55));
          int v179 = (char)*v173;
          *(void *)(v173 - 55) = v167;
          uint64_t v180 = *(void *)&v210[7];
          *(void *)(v173 - 47) = *(void *)v210;
          *((void *)v173 - 5) = v180;
          *(v173 - 32) = v168;
          *(void *)(v173 - 31) = v169;
          if (v179 < 0) {
            operator delete(*(void **)(v173 - 23));
          }
        }
        else
        {
          *(void *)(v173 - 55) = v167;
          uint64_t v178 = *(void *)v210;
          *((void *)v173 - 5) = *(void *)&v210[7];
          *(void *)(v173 - 47) = v178;
          *(v173 - 32) = v168;
          *(void *)(v173 - 31) = v169;
        }
        *(v173 - 23) = v170;
        long long v181 = *(_OWORD *)v212;
        *((void *)v173 - 1) = *(void *)&v212[14];
        *(_OWORD *)(v173 - 22) = v181;
        unsigned char *v173 = v172;
      }
      v67 = (char *)v164 + 88;
      v163 += 88;
      uint64_t v9 = v164;
    }
    while ((char *)v164 + 88 != v8);
  }
}

@end