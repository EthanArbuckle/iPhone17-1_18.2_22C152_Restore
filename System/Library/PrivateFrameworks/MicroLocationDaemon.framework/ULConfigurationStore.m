@interface ULConfigurationStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(;
- (BOOL)insertEntries:(const void *)a3;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentAnchorAppearancesAtLoi:(int)a3;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForLOIType:(int)a3;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForModelUUID:(int)a3;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(int)a3 atLoiGroupId:(Configuration *)a4 beforeTime:;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(optional<CLMicroLocationConfigurationTable:(ULConfigurationStore *)self :(int)a3 Entry> *__return_ptr)retstr atLoiType:(Configuration *)a4 loiGroupId:beforeTime:;
- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentWifiChannelHistogramAtLoi:(int)a3;
- (vector<CLMicroLocationConfigurationTable::Entry,)_fetchConfigurationsByAndPredicates:(ULConfigurationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsOfType:(ULConfigurationStore *)self loiGroupId:(SEL)a3 withLimit:(optional<const CLMicroLocationProto:(const uuid *)a5 :(unsigned int)a6 ConfigurationType>)a4;
- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsforLoiGroup:(ULConfigurationStore *)self withLimit:(SEL)a3;
- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllRecordsWithLimit:(ULConfigurationStore *)self;
- (vector<CLMicroLocationConfigurationTable::Entry,)fetchLatestConfigurationPerTypeAtLoi:(ULConfigurationStore *)self withLimit:(SEL)a3;
@end

@implementation ULConfigurationStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULConfigurationTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F16E0 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationConfigurationTable::Entry,)_fetchConfigurationsByAndPredicates:(ULConfigurationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllRecordsWithLimit:(ULConfigurationStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, a4, retstr);
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(optional<CLMicroLocationConfigurationTable:(ULConfigurationStore *)self :(int)a3 Entry> *__return_ptr)retstr atLoiType:(Configuration *)a4 loiGroupId:beforeTime:
{
  char v8 = v7;
  double v9 = v6;
  uint64_t v10 = v5;
  v11 = v4;
  v35[1] = *MEMORY[0x263EF8340];
  v14 = [MEMORY[0x263EFF980] array];
  v15 = (void *)MEMORY[0x263F08A98];
  v16 = [NSNumber numberWithUnsignedInt:LODWORD(a4->var0)];
  v17 = [v15 predicateWithFormat:@"%K=%@", @"configurationType", v16];
  [v14 addObject:v17];

  if (*((unsigned char *)v11 + 24))
  {
    v18 = (void *)MEMORY[0x263F08A98];
    if (*((char *)v11 + 23) >= 0) {
      v19 = v11;
    }
    else {
      v19 = (uint64_t *)*v11;
    }
    v20 = [NSString stringWithUTF8String:v19];
    v21 = [v18 predicateWithFormat:@"%K=%@", @"loiType", v20];
    [v14 addObject:v21];
  }
  if (v8)
  {
    v22 = (void *)MEMORY[0x263F08A98];
    v23 = [NSNumber numberWithDouble:v9];
    v24 = [v22 predicateWithFormat:@"%K<=%@", @"generationTimestamp", v23];
    [v14 addObject:v24];
  }
  if (*(unsigned char *)(v10 + 16))
  {
    id v25 = (id)[(ULStore *)self db][56];
    v26 = v25;
    if (!*(unsigned char *)(v10 + 16)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v27 = [v25 getLoiIdsInLoiGroupId:v10];

    v28 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v27];
    [v14 addObject:v28];
  }
  v29 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v35[0] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [(ULConfigurationStore *)self _fetchConfigurationsByAndPredicates:v14 sortDescriptors:v30 andLimit:1];

  if (v33[0] == v33[1])
  {
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, v33[0]);
  }
  v34 = (void **)v33;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v34);

  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(int)a3 atLoiGroupId:(Configuration *)a4 beforeTime:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  LOBYTE(__p) = 0;
  char v9 = 0;
  long long v10 = *v4;
  char v11 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", a4, &__p, &v10, v5, 1);
  if (v9)
  {
    if (v8 < 0) {
      operator delete(__p);
    }
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentAnchorAppearancesAtLoi:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v8 = 1;
  LOBYTE(__p) = 0;
  char v7 = 0;
  long long v9 = *(_OWORD *)&a4->var0;
  char v10 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v8, &__p, &v9, 0, 0);
  if (v7)
  {
    if (v6 < 0) {
      operator delete(__p);
    }
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForModelUUID:(int)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  char v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a4];
  char v7 = [v6 UUIDString];

  int v8 = [MEMORY[0x263EFF980] array];
  long long v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"anchorStatsModelUUID", v7];
  [v8 addObject:v9];

  char v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v15[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(ULConfigurationStore *)self _fetchConfigurationsByAndPredicates:v8 sortDescriptors:v11 andLimit:1];

  if (v13[0] == v13[1])
  {
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, v13[0]);
  }
  v14 = (void **)v13;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v14);

  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForLOIType:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v10 = 2;
  if (SHIBYTE(a4->var2) < 0)
  {
    std::string::__init_copy_ctor_external(&v6, (const std::string::value_type *)a4->var0, *(void *)&a4->var1);
  }
  else
  {
    *(_OWORD *)&v6.__r_.__value_.__l.__data_ = *(_OWORD *)&a4->var0;
    v6.__r_.__value_.__r.__words[2] = (std::string::size_type)a4->var2;
  }
  char v7 = 1;
  std::string __p = v6;
  char v9 = 1;
  v11[0] = 0;
  v11[16] = 0;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v10, &__p, v11, 0, 0, 0, 0, 0);
  if (v9 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v7)
  {
    if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v6.__r_.__value_.__l.__data_);
    }
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentWifiChannelHistogramAtLoi:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v8 = 0;
  LOBYTE(__p) = 0;
  char v7 = 0;
  long long v9 = *(_OWORD *)&a4->var0;
  char v10 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v8, &__p, &v9, 0, 0);
  if (v7)
  {
    if (v6 < 0) {
      operator delete(__p);
    }
  }
  return result;
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(
{
  v26[4] = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  uint64_t v12 = [(ULStore *)self managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3321888768;
  v20[2] = __99__ULConfigurationStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke;
  v20[3] = &unk_2704DB238;
  v23 = &v16;
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

void __99__ULConfigurationStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
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

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchLatestConfigurationPerTypeAtLoi:(ULConfigurationStore *)self withLimit:(SEL)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  v23 = [MEMORY[0x263EFF980] array];
  id v9 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v9 setName:@"maxGenTimestamp"];
  id v10 = (void *)MEMORY[0x263F087F0];
  uint64_t v11 = [MEMORY[0x263F087F0] expressionForKeyPath:@"generationTimestamp"];
  v38[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  id v13 = [v10 expressionForFunction:@"max:" arguments:v12];
  [v9 setExpression:v13];

  [v9 setExpressionResultType:500];
  id v22 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a4);
  id v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v22];
  [v23 addObject:v14];

  v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  v35 = &unk_25654E519;
  memset(v36, 0, sizeof(v36));
  uint64_t v16 = [(ULStore *)self managedObjectContext];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__ULConfigurationStore_fetchLatestConfigurationPerTypeAtLoi_withLimit___block_invoke;
  v24[3] = &unk_2653F9870;
  v24[4] = self;
  id v17 = v9;
  id v25 = v17;
  id v18 = v23;
  id v26 = v18;
  id v19 = v15;
  unsigned int v29 = a5;
  id v27 = v19;
  v28 = &v30;
  [v16 performBlockAndWait:v24];

  v20 = v31;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__init_with_size[abi:ne180100]<CLMicroLocationConfigurationTable::Entry*,CLMicroLocationConfigurationTable::Entry*>(retstr, v20[6], v20[7], 0x6DB6DB6DB6DB6DB7 * ((v20[7] - v20[6]) >> 4));

  _Block_object_dispose(&v30, 8);
  v37 = (void **)v36;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v37);

  return result;
}

void __71__ULConfigurationStore_fetchLatestConfigurationPerTypeAtLoi_withLimit___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  v18[0] = @"configurationType";
  v18[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  id v17 = @"configurationType";
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  id v10 = [v2 fetchManagedObjectsForEntityName:v4 propertiesToFetch:v6 propertiesToGroupBy:v7 byAndPredicates:v8 sortDescriptors:v9 andLimit:*(unsigned int *)(a1 + 72)];

  ULDBUtils::convertManagedObjectsToEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(v10, (uint64_t *)&v13);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  std::vector<CLMicroLocationConfigurationTable::Entry>::__vdeallocate((void **)(v11 + 48));
  *(_OWORD *)(v11 + 48) = v13;
  *(void *)(v11 + 64) = v14;
  uint64_t v14 = 0;
  long long v13 = 0uLL;
  v15 = (void **)&v13;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);
  uint64_t v12 = [*(id *)(a1 + 32) managedObjectContext];
  [v12 reset];
}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsforLoiGroup:(ULConfigurationStore *)self withLimit:(SEL)a3
{
  return [(ULConfigurationStore *)self fetchAllConfigurationsOfType:0 loiGroupId:a4 withLimit:*(void *)&a5];
}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsOfType:(ULConfigurationStore *)self loiGroupId:(SEL)a3 withLimit:(optional<const CLMicroLocationProto:(const uuid *)a5 :(unsigned int)a6 ConfigurationType>)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v10 = [MEMORY[0x263EFF980] array];
  if ((*(void *)&a4 & 0xFF00000000) != 0)
  {
    uint64_t v11 = (void *)MEMORY[0x263F08A98];
    uint64_t v12 = [NSNumber numberWithUnsignedInt:a4];
    long long v13 = [v11 predicateWithFormat:@"%K=%@", @"configurationType", v12];
    [v10 addObject:v13];
  }
  uint64_t v14 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a5);
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v14];
  [v10 addObject:v15];

  uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v19[0] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [(ULConfigurationStore *)self _fetchConfigurationsByAndPredicates:v10 sortDescriptors:v17 andLimit:a6];

  return result;
}

- (void)fetchMostRecentClusterAnchorValueStatisticsForLOIType:(unsigned char *)a1 .cold.1(unsigned char *a1, uint64_t a2)
{
  if (*a1)
  {
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
  }
}

@end