@interface ULLoiStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(;
- (BOOL)insertEntries:(const void *)a3;
- (BOOL)updateLoiIds:(const void *)a3 withLoiGroupId:(const uuid *)a4 andLoiType:(const void *)a5;
- (id)getLoiIdsInLoiGroupId:(const uuid *)a3;
- (optional<boost::uuids::uuid>)getLoiGroupIdForLoi:(SEL)a3;
- (optional<std::string>)getLoiTypeForLoi:(optional<std::string> *__return_ptr)retstr;
- (unsigned)countDistinctLoiGroups;
- (unsigned)countDistinctLoiTypes:(const void *)a3;
- (vector<CLMiLoLoiTable::Entry,)_fetchLoisByAndPredicates:(ULLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMiLoLoiTable::Entry,)fetchAllDistinctLoiGroups;
- (vector<CLMiLoLoiTable::Entry,)fetchAllRecordsWithLimit:(ULLoiStore *)self;
- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesInLoiGroupId:(ULLoiStore *)self;
- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesforLoiGroupIds:(ULLoiStore *)self withLimit:(SEL)a3;
- (vector<boost::uuids::uuid,)getDistinctHomeLoiGroupIdsWithLimit:(ULLoiStore *)self;
- (vector<boost::uuids::uuid,)getLoiGroupIdsForLois:(ULLoiStore *)self;
@end

@implementation ULLoiStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULMiLoLoiTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F14A0 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMiLoLoiTable,ULLoiMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoLoiTable::Entry,)_fetchLoisByAndPredicates:(ULLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMiLoLoiTable,ULLoiMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchAllRecordsWithLimit:(ULLoiStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMiLoLoiTable,ULLoiMO>(self, a4, retstr);
  return result;
}

- (id)getLoiIdsInLoiGroupId:(const uuid *)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  unsigned int v6 = [v5 UUIDString];

  unsigned int v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  if (a3->var0[0])
  {
LABEL_2:
    v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiGroupId", v6];
    v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v19 = v8;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    v18 = v9;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v14 = [(ULStore *)self fetchPropertyForEntityName:v11 propertyToFetch:@"loiId" distinctResults:1 byAndPredicates:v12 sortDescriptors:v13 andLimit:v7];
  }
  else
  {
    uint64_t v15 = 1;
    while (v15 != 16)
    {
      if (a3->var0[v15++])
      {
        if ((unint64_t)(v15 - 2) < 0xF) {
          goto LABEL_2;
        }
        break;
      }
    }
    v20[0] = v6;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  }

  return v14;
}

- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesInLoiGroupId:(ULLoiStore *)self
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  unsigned int v6 = [v5 UUIDString];

  unsigned int v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiGroupId", v6];
  [v8 addObject:v9];

  v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v13[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(ULLoiStore *)self _fetchLoisByAndPredicates:v8 sortDescriptors:v11 andLimit:v7];

  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesforLoiGroupIds:(ULLoiStore *)self withLimit:(SEL)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  unsigned int v7 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"loiGroupId", v7];
  [v8 addObject:v9];

  v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v13[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(ULLoiStore *)self _fetchLoisByAndPredicates:v8 sortDescriptors:v11 andLimit:a5];

  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchAllDistinctLoiGroups
{
  int v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x4812000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = &unk_25654E519;
  memset(v21, 0, sizeof(v21));
  unsigned int v7 = [(ULStore *)self managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__ULLoiStore_fetchAllDistinctLoiGroups__block_invoke;
  v11[3] = &unk_2653F9480;
  v11[4] = self;
  id v8 = v6;
  int v14 = v5;
  id v12 = v8;
  v13 = &v15;
  [v7 performBlockAndWait:v11];

  v9 = v16;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMiLoLoiTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoLoiTable::Entry*,CLMiLoLoiTable::Entry*>(retstr, v9[6], v9[7], (v9[7] - v9[6]) >> 6);

  _Block_object_dispose(&v15, 8);
  v22 = (void **)v21;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v22);

  return result;
}

void __39__ULLoiStore_fetchAllDistinctLoiGroups__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v16[0] = @"loiGroupId";
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  uint64_t v15 = @"loiGroupId";
  unsigned int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  uint64_t v14 = *(void *)(a1 + 40);
  unsigned int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v8 = [v2 fetchManagedObjectsForEntityName:v4 propertiesToFetch:v5 propertiesToGroupBy:v6 byAndPredicates:0 sortDescriptors:v7 andLimit:*(unsigned int *)(a1 + 56)];

  ULDBUtils::convertManagedObjectsToEntries<CLMiLoLoiTable,ULLoiMO>(v8, (uint64_t *)&v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  std::vector<CLMiLoLoiTable::Entry>::__vdeallocate((uint64_t *)(v9 + 48));
  *(_OWORD *)(v9 + 48) = v11;
  *(void *)(v9 + 64) = v12;
  uint64_t v12 = 0;
  long long v11 = 0uLL;
  v13 = (void **)&v11;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v13);
  v10 = [*(id *)(a1 + 32) managedObjectContext];
  [v10 reset];
}

- (vector<boost::uuids::uuid,)getDistinctHomeLoiGroupIdsWithLimit:(ULLoiStore *)self
{
  v20[1] = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  id v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = [NSString stringWithUTF8String:"home"];
  v10 = [v8 predicateWithFormat:@"%K=%@", @"loiType", v9];
  [v7 addObject:v10];

  long long v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v20[0] = v11;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v15 = [(ULStore *)self fetchPropertyForEntityName:v13 propertyToFetch:@"loiGroupId" distinctResults:1 byAndPredicates:v7 sortDescriptors:v14 andLimit:a4];

  ULDBUtils::boostUUIDsFromNSStringArray(v15, &v18);
  v16 = v19;
  *(_OWORD *)&retstr->var0 = v18;
  retstr->var2.var0 = v16;

  return result;
}

- (unsigned)countDistinctLoiGroups
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [(ULStore *)self fetchPropertyForEntityName:v4 propertyToFetch:@"loiGroupId" distinctResults:1 byAndPredicates:0 sortDescriptors:0 andLimit:0];

  LODWORD(v4) = [v5 count];
  return v4;
}

- (unsigned)countDistinctLoiTypes:(const void *)a3
{
  int v5 = [MEMORY[0x263EFF980] array];
  if (*((char *)a3 + 23) >= 0) {
    unsigned int v6 = a3;
  }
  else {
    unsigned int v6 = *(const void **)a3;
  }
  unsigned int v7 = [NSString stringWithUTF8String:v6];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiType", v7];
  [v5 addObject:v8];

  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  long long v11 = [(ULStore *)self fetchPropertyForEntityName:v10 propertyToFetch:@"loiGroupId" distinctResults:1 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  LODWORD(v10) = [v11 count];
  return v10;
}

- (optional<boost::uuids::uuid>)getLoiGroupIdForLoi:(SEL)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  unsigned int v7 = [v6 UUIDString];

  id v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiId", v7];
  [v8 addObject:v9];

  v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v16[0] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(ULLoiStore *)self _fetchLoisByAndPredicates:v8 sortDescriptors:v11 andLimit:1];

  if (v14[0] == v14[1])
  {
    BOOL v12 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    retstr->var0 = *($D4ADB2EC67BC4596D722686DA11A5CAB *)(v14[0] + 24);
    BOOL v12 = 1;
  }
  retstr->var1 = v12;
  uint64_t v15 = (void **)v14;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);

  return result;
}

- (optional<std::string>)getLoiTypeForLoi:(optional<std::string> *__return_ptr)retstr
{
  v3 = v1;
  v16[1] = *MEMORY[0x263EF8340];
  int v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v2];
  unsigned int v6 = [v5 UUIDString];

  unsigned int v7 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"loiId", v6];
  [v7 addObject:v8];

  uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v16[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v3 _fetchLoisByAndPredicates:v7 sortDescriptors:v10 andLimit:1];

  long long v11 = (void *)v14[0];
  if (v14[0] == v14[1])
  {
    char v12 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)(v14[0] + 40);
    *((void *)&retstr->var0.var1.var0.var0.var0.var1 + 2) = v11[7];
    v11[6] = 0;
    v11[7] = 0;
    void v11[5] = 0;
    char v12 = 1;
  }
  LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = v12;
  uint64_t v15 = (void **)v14;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);

  return result;
}

- (vector<boost::uuids::uuid,)getLoiGroupIdsForLois:(ULLoiStore *)self
{
  v20[1] = *MEMORY[0x263EF8340];
  result = (vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *)ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (*(void *)a4 != *((void *)a4 + 1))
  {
    unsigned int v8 = result;
    uint64_t v9 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    v10 = [MEMORY[0x263EFF980] array];
    long long v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"loiId", v9];
    [v10 addObject:v11];

    char v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
    v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    v20[0] = v12;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v16 = [(ULStore *)self fetchPropertyForEntityName:v14 propertyToFetch:@"loiGroupId" distinctResults:1 byAndPredicates:v10 sortDescriptors:v15 andLimit:v8];

    ULDBUtils::boostUUIDsFromNSStringArray(v16, &v18);
    uint64_t v17 = v19;
    *(_OWORD *)&retstr->var0 = v18;
    retstr->var2.var0 = v17;
  }
  return result;
}

- (BOOL)updateLoiIds:(const void *)a3 withLoiGroupId:(const uuid *)a4 andLoiType:(const void *)a5
{
  int v5 = *(const void **)a3;
  uint64_t v6 = *((void *)a3 + 1);
  if (v5 == (const void *)v6) {
    return 1;
  }
  memset(v50, 0, sizeof(v50));
  __p = 0;
  v48 = 0;
  unint64_t v49 = 0;
  std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v5, v6, (v6 - (uint64_t)v5) >> 4);
  v10 = v48;
  if ((unint64_t)v48 >= v49)
  {
    int64_t v13 = (v48 - (unsigned char *)__p) >> 4;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v49 - (void)__p;
    if ((uint64_t)(v49 - (void)__p) >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::uuids::uuid>>((uint64_t)&v49, v16);
    }
    else {
      uint64_t v17 = 0;
    }
    long long v18 = (uuid *)&v17[16 * v13];
    v19 = &v17[16 * v16];
    uuid *v18 = *a4;
    long long v11 = v18 + 1;
    v21 = (uuid *)__p;
    v20 = (uuid *)v48;
    if (v48 != __p)
    {
      do
      {
        v18[-1] = v20[-1];
        --v18;
        --v20;
      }
      while (v20 != v21);
      v20 = (uuid *)__p;
    }
    __p = v18;
    v48 = (char *)v11;
    unint64_t v49 = (unint64_t)v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *(uuid *)v48 = *a4;
    long long v11 = (uuid *)(v10 + 16);
  }
  unint64_t v22 = 126 - 2 * __clz(((char *)v11 - (unsigned char *)__p) >> 4);
  v48 = (char *)v11;
  if (v11 == __p) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v22;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,boost::uuids::uuid *,false>((unint64_t *)__p, (unint64_t *)v11->var0, (uint64_t)&v51, v23, 1);
  v24 = (char *)std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<boost::uuids::uuid *>,std::__wrap_iter<boost::uuids::uuid *>,std::__equal_to &>(__p, v48);
  if (v48 != v24) {
    v48 = v24;
  }
  id v25 = objc_alloc(MEMORY[0x263EFF980]);
  v26 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)&__p);
  v27 = (void *)[v25 initWithArray:v26];

  v28 = [MEMORY[0x263EFF980] array];
  v29 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"loiId", v27];
  [v28 addObject:v29];

  v30 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v31 = [(ULStore *)self managedObjectContext];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __53__ULLoiStore_updateLoiIds_withLoiGroupId_andLoiType___block_invoke;
  v36[3] = &unk_2653F94A8;
  v36[4] = self;
  id v32 = v28;
  id v37 = v32;
  id v33 = v30;
  id v38 = v33;
  v41 = a4;
  v42 = a5;
  id v34 = v27;
  id v39 = v34;
  v40 = &v43;
  [v31 performBlockAndWait:v36];

  BOOL v12 = *((unsigned char *)v44 + 24) != 0;
  _Block_object_dispose(&v43, 8);

  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
  v43 = (void **)v50;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v43);
  return v12;
}

void __53__ULLoiStore_updateLoiIds_withLoiGroupId_andLoiType___block_invoke(uint64_t a1)
{
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  v41[0] = *(void *)(a1 + 48);
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  v28 = [v2 fetchManagedObjectsWithEntityName:v4 byAndPredicates:v5 sortDescriptors:v6 andLimit:0];

  double v7 = cl::chrono::CFAbsoluteTimeClock::now();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v28;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v11 setLastSeenTimeStamp:v7];
        BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:*(void *)(a1 + 72)];
        int64_t v13 = [v12 UUIDString];
        [v11 setLoiGroupId:v13];

        unint64_t v14 = *(uint64_t **)(a1 + 80);
        if (*((char *)v14 + 23) < 0) {
          unint64_t v14 = (uint64_t *)*v14;
        }
        uint64_t v15 = [NSString stringWithUTF8String:v14];
        [v11 setLoiType:v15];

        unint64_t v16 = *(void **)(a1 + 56);
        uint64_t v17 = [v11 loiId];
        [v16 removeObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v29 = *(id *)(a1 + 56);
  uint64_t v18 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v29);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        unint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:*(void *)(a1 + 72)];
        uint64_t v23 = [v22 UUIDString];
        v24 = *(uint64_t **)(a1 + 80);
        if (*((char *)v24 + 23) < 0) {
          v24 = (uint64_t *)*v24;
        }
        id v25 = [NSString stringWithUTF8String:v24];
        v26 = [*(id *)(a1 + 32) managedObjectContext];
        id v27 = +[ULLoiMO createWithLastSeenTimeStamp:v21 loiId:v23 loiGroupId:v25 loiType:v26 inManagedObjectContext:v7];
      }
      uint64_t v18 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) commitChangesToStore];
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(
{
  v26[4] = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  long long v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  BOOL v12 = [(ULStore *)self managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3321888768;
  void v20[2] = __89__ULLoiStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke;
  v20[3] = &unk_2704DB238;
  uint64_t v23 = &v16;
  v20[4] = self;
  id v13 = v11;
  id v21 = v13;
  unint64_t v24 = a3;
  unint64_t v25 = a4;
  id v14 = v10;
  id v22 = v14;
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v26, (uint64_t)a6);
  [v12 performBlockAndWait:v20];

  LOBYTE(v10) = *((unsigned char *)v17 + 24) != 0;
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v26);

  _Block_object_dispose(&v16, 8);
  return (char)v10;
}

void __89__ULLoiStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v10[0] = a1[5];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[6];
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)(a1 + 10));
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 batchTransferManagedObjectsWithEntityName:v4 byAndPredicates:0 sortDescriptors:v5 batchSize:v6 limit:v7 intoTargetStore:v8 withCancelFunc:v9];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v9);
}

@end