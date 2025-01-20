@interface ULMeasurementStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 usingDistinctRecords:(BOOL)a5 intoTargetStore:(id)a6 withCancelFunc:(function<BOOL)(;
- (BOOL)deleteMeasurementsFromRecordingUUIDs:(const void *)a3;
- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4;
- (BOOL)insertEntries:(const void *)a3;
- (unsigned)numLocalizationScansFromTime:(double)a3 toTime:(double)a4;
- (unsigned)numRecordingScansFromTime:(double)a3 toTime:(double)a4;
- (vector<CLMicroLocationMeasurementTable::Entry,)_fetchMeasurementEntriesByAndPredicates:(ULMeasurementStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllLocalizingMeasurementsWithLimit:(ULMeasurementStore *)self;
- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllRecordsWithLimit:(ULMeasurementStore *)self;
- (vector<CLMicroLocationMeasurementTable::Entry,)fetchLearningMeasurementsAtLoiGroupId:(ULMeasurementStore *)self fromTime:(SEL)a3 toTime:(const uuid *)a4;
- (vector<CLMicroLocationMeasurementTable::Entry,)fetchMeasurementsForRecordingUUIDs:(ULMeasurementStore *)self;
@end

@implementation ULMeasurementStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULMeasurementTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1938 unsignedIntValue];
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
  return @"scanCFTimestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationMeasurementTable::Entry,)_fetchMeasurementEntriesByAndPredicates:(ULMeasurementStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllRecordsWithLimit:(ULMeasurementStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_48);
  }
  unsigned int v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = [v9 UTF8String];
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Deleting old records for entity: %s", buf, 0xCu);
  }
  v10 = [MEMORY[0x263EFF980] array];
  v11 = objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsOlderThan:orNewerThan:", a3, a4);
  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v11];
  [v10 addObject:v12];

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  BOOL v15 = [(ULStore *)self batchDeleteObjectsWithEntityName:v14 byAndPredicates:v10 sortDescriptors:0 andLimit:0];

  v16 = [MEMORY[0x263EFF980] array];
  v17 = (void *)MEMORY[0x263F08A98];
  v18 = [NSNumber numberWithDouble:a3];
  v19 = [v17 predicateWithFormat:@"%K < %@", @"scanCFTimestamp", v18];
  [v16 addObject:v19];

  v20 = +[ULDefaultsSingleton shared];
  v21 = [v20 defaultsDictionary];

  v22 = [NSString stringWithUTF8String:"ULMeasurementTableMaxOldEntriesToDelete"];
  v23 = [v21 objectForKey:v22];
  if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v24 = [v23 unsignedIntValue];
  }
  else {
    unsigned int v24 = [&unk_2704F1908 unsignedIntValue];
  }
  unsigned int v25 = v24;

  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  BOOL v28 = [(ULStore *)self batchDeleteObjectsWithEntityName:v27 byAndPredicates:v16 sortDescriptors:0 andLimit:v25];

  return v15 && v28;
}

- (BOOL)deleteMeasurementsFromRecordingUUIDs:(const void *)a3
{
  if (*(void *)a3 == *((void *)a3 + 1))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_48);
    }
    v11 = logObject_MicroLocation_Default;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs are passed in to delete measurements entries", buf, 2u);
      return 0;
    }
  }
  else
  {
    v5 = [MEMORY[0x263EFF980] array];
    unsigned int v6 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    unsigned int v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v6];
    [v5 addObject:v7];

    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    BOOL v10 = [(ULStore *)self batchDeleteObjectsWithEntityName:v9 byAndPredicates:v5 sortDescriptors:0 andLimit:0];
  }
  return v10;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchMeasurementsForRecordingUUIDs:(ULMeasurementStore *)self
{
  v13[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v7 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
  v8 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v7];
  [v8 addObject:v9];

  BOOL v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanCFTimestamp" ascending:0];
  v13[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(ULMeasurementStore *)self _fetchMeasurementEntriesByAndPredicates:v8 sortDescriptors:v11 andLimit:v6];

  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchLearningMeasurementsAtLoiGroupId:(ULMeasurementStore *)self fromTime:(SEL)a3 toTime:(const uuid *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v10 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  v11 = [MEMORY[0x263EFF980] array];
  v12 = (void *)[(ULStore *)self db][88];
  uuid v19 = *a4;
  char v20 = 1;
  v13 = objc_msgSend(v12, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", &v19, *(void *)&a5, 1, *(void *)&a6, 1, 0);
  v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v13];
  [v11 addObject:v14];

  BOOL v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanCFTimestamp" ascending:0];
  v18 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [(ULMeasurementStore *)self _fetchMeasurementEntriesByAndPredicates:v11 sortDescriptors:v16 andLimit:v10];

  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllLocalizingMeasurementsWithLimit:(ULMeasurementStore *)self
{
  v12[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = [MEMORY[0x263EFF980] array];
  unsigned int v7 = objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsForLocalizationActionsFromTime:toTime:", 0, 0, 0, 0);
  v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v7];
  [v6 addObject:v8];

  id v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanCFTimestamp" ascending:0];
  v12[0] = v9;
  unsigned int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(ULMeasurementStore *)self _fetchMeasurementEntriesByAndPredicates:v6 sortDescriptors:v10 andLimit:a4];

  return result;
}

- (unsigned)numRecordingScansFromTime:(double)a3 toTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  v8 = (void *)[(ULStore *)self db][88];
  v18[0] = 0;
  v18[16] = 0;
  id v9 = objc_msgSend(v8, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", v18, *(void *)&a3, 1, *(void *)&a4, 1, 0);
  unsigned int v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v9];
  [v7 addObject:v10];

  v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanMCTimestamp" ascending:0];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v17 = v11;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  BOOL v15 = [(ULStore *)self fetchPropertyForEntityName:v13 propertyToFetch:@"scanMCTimestamp" distinctResults:1 byAndPredicates:v7 sortDescriptors:v14 andLimit:0];

  LODWORD(self) = [v15 count];
  return self;
}

- (unsigned)numLocalizationScansFromTime:(double)a3 toTime:(double)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  unsigned int v7 = [MEMORY[0x263EFF980] array];
  v8 = objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsForLocalizationActionsFromTime:toTime:", *(void *)&a3, 1, *(void *)&a4, 1);
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v8];
  [v7 addObject:v9];

  unsigned int v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanMCTimestamp" ascending:0];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v16[0] = v10;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v14 = [(ULStore *)self fetchPropertyForEntityName:v12 propertyToFetch:@"scanMCTimestamp" distinctResults:1 byAndPredicates:v7 sortDescriptors:v13 andLimit:0];

  LODWORD(self) = [v14 count];
  return self;
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 usingDistinctRecords:(BOOL)a5 intoTargetStore:(id)a6 withCancelFunc:(function<BOOL)(
{
  BOOL v8 = a5;
  v34[4] = *MEMORY[0x263EF8340];
  id v12 = a6;
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v13 = [MEMORY[0x263EFF980] array];
  if (v8)
  {
    v14 = objc_msgSend((id)-[ULStore db](self, "db")[88], "getDistinctRecordingUUIDsWithLimit:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
    BOOL v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v14];
    [v13 addObject:v15];
  }
  v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"scanCFTimestamp" ascending:0];
  v17 = [(ULStore *)self managedObjectContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3321888768;
  v27[2] = __118__ULMeasurementStore_batchTransferRecordsUsingBatchSize_andLimit_usingDistinctRecords_intoTargetStore_withCancelFunc___block_invoke;
  v27[3] = &unk_2704DC6A8;
  uint64_t v31 = &v23;
  v27[4] = self;
  id v18 = v13;
  id v28 = v18;
  id v19 = v16;
  id v29 = v19;
  unint64_t v32 = a3;
  unint64_t v33 = a4;
  id v20 = v12;
  id v30 = v20;
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v34, (uint64_t)a7);
  [v17 performBlockAndWait:v27];

  BOOL v21 = *((unsigned char *)v24 + 24) != 0;
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v34);

  _Block_object_dispose(&v23, 8);
  return v21;
}

void __118__ULMeasurementStore_batchTransferRecordsUsingBatchSize_andLimit_usingDistinctRecords_intoTargetStore_withCancelFunc___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = a1[5];
  v11[0] = a1[6];
  unsigned int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[10];
  uint64_t v9 = a1[7];
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)(a1 + 11));
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v2 batchTransferManagedObjectsWithEntityName:v4 byAndPredicates:v5 sortDescriptors:v6 batchSize:v7 limit:v8 intoTargetStore:v9 withCancelFunc:v10];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v10);
}

@end