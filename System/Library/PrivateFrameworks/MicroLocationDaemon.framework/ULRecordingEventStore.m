@interface ULRecordingEventStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)batchTransferRecordingEventsForRecordingUUIDs:(const void *)a3 withEventTypes:(const void *)a4 batchSize:(unint64_t)a5 andLimit:(unsigned int)a6 intoTargetStore:(id)a7 withCancelFunc:(function<BOOL)(;
- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(;
- (BOOL)deleteRecordingEventsFromRecordingUUIDs:(const void *)a3;
- (BOOL)insertEntries:(const void *)a3;
- (double)getOldestRecordingTimestamp;
- (id)getDistinctRecordingUUIDsWithLimit:(unsigned int)a3;
- (id)getRecordingUUIDsForLocalizationActionsFromTime:(optional<const double>)a3 toTime:(optional<const double>)a4;
- (id)getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:(optional<const boost:(optional<const double>)a4 :(optional<const double>)a5 uuids:(unsigned int)a6 :uuid> *)a3 fromTime:toTime:withLimit:;
- (id)getRecordingUUIDsOlderThan:(double)a3 orNewerThan:(double)a4;
- (id)getTriggerUUIDsForLoiGroupId:(const uuid *)a3;
- (unsigned)countRecordingEventsForLoiGroupId:(const uuid *)a3;
- (unsigned)countRecordingEventsFromTime:(double)a3 toTime:(double)a4 atLoiGroupId:(const uuid *)a5;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventTriggers:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3 fromTime:(const void *)a4 toTime:(const void *)a5 withLimit:(optional<const double>)a6;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventsByAndPredicates:(ULRecordingEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchAllRecordsWithLimit:(ULRecordingEventStore *)self;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsForRecordingUUIDs:(ULRecordingEventStore *)self;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsFromTriggerUUIDs:(ULRecordingEventStore *)self;
- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsWithScanMeasurements:(ULRecordingEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 withLimit:(double)a5;
- (vector<boost::uuids::uuid,)fetchDistinctRecordingEventsFromTime:(ULRecordingEventStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4 withLimit:(double)a5;
- (vector<std::string,)selectAllRecordingLOITypesFromTime:(ULRecordingEventStore *)self andLimit:(SEL)a3;
- (void)fetchMostRecentRecordingForLoiGroupId:(unsigned char *)a3@<X8>;
- (void)fetchRecordingEventTriggersForLearningMeasurements:(uint64_t)a3 atLoiGroupId:(char)a4;
@end

@implementation ULRecordingEventStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULRecordingEventsTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F20D0 unsignedIntValue];
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
  return @"recordingTimestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventsByAndPredicates:(ULRecordingEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchAllRecordsWithLimit:(ULRecordingEventStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteRecordingEventsFromRecordingUUIDs:(const void *)a3
{
  if (*(void *)a3 == *((void *)a3 + 1))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_102);
    }
    v10 = logObject_MicroLocation_Default;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs were passed in to delete recording events", buf, 2u);
      return 0;
    }
  }
  else
  {
    v4 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    v5 = [MEMORY[0x263EFF980] array];
    unsigned int v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v4];
    [v5 addObject:v6];

    unsigned int v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    BOOL v9 = [(ULStore *)self batchDeleteObjectsWithEntityName:v8 byAndPredicates:v5 sortDescriptors:0 andLimit:0];
  }
  return v9;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsFromTriggerUUIDs:(ULRecordingEventStore *)self
{
  v17[1] = *MEMORY[0x263EF8340];
  if (*(void *)a4 == *((void *)a4 + 1))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_102);
    }
    v14 = logObject_MicroLocation_Default;
    result = (vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "#Warning passed empty UUIDs so we can't fetch recording events", buf, 2u);
    }
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    unsigned int v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
    v8 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    BOOL v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"triggerUUID", v8];
    v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
    v17[0] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    v16 = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(ULRecordingEventStore *)self _fetchRecordingEventsByAndPredicates:v11 sortDescriptors:v12 andLimit:v7];
  }
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsForRecordingUUIDs:(ULRecordingEventStore *)self
{
  v17[1] = *MEMORY[0x263EF8340];
  if (*(void *)a4 == *((void *)a4 + 1))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_102);
    }
    v14 = logObject_MicroLocation_Default;
    result = (vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "#Warning passed empty UUIDs so we can't fetch recording events", buf, 2u);
    }
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    unsigned int v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
    v8 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    BOOL v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v8];
    v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
    v17[0] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    v16 = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(ULRecordingEventStore *)self _fetchRecordingEventsByAndPredicates:v11 sortDescriptors:v12 andLimit:v7];
  }
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventTriggers:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3 fromTime:(const void *)a4 toTime:(const void *)a5 withLimit:(optional<const double>)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v43 = *(_OWORD *)a5;
  char v44 = *((unsigned char *)a5 + 16);
  v27 = -[ULRecordingEventStore getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:](self, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", &v43, *(void *)&a6.var0.var1, *(void *)&a6.var1, *(void *)&a7.var0.var1, *(void *)&a7.var1, 0);
  id v11 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v11 setName:@"minRecTimestamp"];
  v12 = (void *)MEMORY[0x263F087F0];
  v13 = [MEMORY[0x263F087F0] expressionForKeyPath:@"recordingTimestamp"];
  v42 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  v15 = [v12 expressionForFunction:@"min:" arguments:v14];
  [v11 setExpression:v15];

  [v11 setExpressionResultType:500];
  v16 = [MEMORY[0x263EFF980] array];
  v26 = ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
  v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"eventType", v26];
  [v16 addObject:v17];

  v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v27];
  [v16 addObject:v18];

  v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:0];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x4812000000;
  v37 = __Block_byref_object_copy__19;
  v38 = __Block_byref_object_dispose__19;
  v39 = &unk_25654E519;
  memset(v40, 0, sizeof(v40));
  v20 = [(ULStore *)self managedObjectContext];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __93__ULRecordingEventStore__fetchRecordingEventTriggers_atLoiGroupId_fromTime_toTime_withLimit___block_invoke;
  v28[3] = &unk_2653F9870;
  v28[4] = self;
  id v21 = v11;
  id v29 = v21;
  id v22 = v16;
  id v30 = v22;
  id v23 = v19;
  unsigned int v33 = a8;
  id v31 = v23;
  v32 = &v34;
  [v20 performBlockAndWait:v28];

  v24 = v35;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__init_with_size[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry*,CLMicroLocationRecordingEventsTable::Entry*>(retstr, (long long *)v24[6], (long long *)v24[7], 0xEF7BDEF7BDEF7BDFLL * ((v24[7] - v24[6]) >> 3));

  _Block_object_dispose(&v34, 8);
  v41 = (void **)v40;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v41);

  return result;
}

void __93__ULRecordingEventStore__fetchRecordingEventTriggers_atLoiGroupId_fromTime_toTime_withLimit___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  v18[0] = @"recordingUUID";
  v18[1] = v5;
  unsigned int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v17 = @"recordingUUID";
  unsigned int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v10 = [v2 fetchManagedObjectsForEntityName:v4 propertiesToFetch:v6 propertiesToGroupBy:v7 byAndPredicates:v8 sortDescriptors:v9 andLimit:*(unsigned int *)(a1 + 72)];

  ULDBUtils::convertManagedObjectsToEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(v10, (uint64_t *)&v13);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__vdeallocate((void **)(v11 + 48));
  *(_OWORD *)(v11 + 48) = v13;
  *(void *)(v11 + 64) = v14;
  uint64_t v14 = 0;
  long long v13 = 0uLL;
  v15 = (void **)&v13;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);
  v12 = [*(id *)(a1 + 32) managedObjectContext];
  [v12 reset];
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsWithScanMeasurements:(ULRecordingEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 withLimit:(double)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  HIBYTE(v8) = 0;
  char v9 = 0;
  LODWORD(v8) = a7;
  return -[ULRecordingEventStore _fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:](self, "_fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:", a4, (char *)&v8 + 7, *(void *)&a5, 1, *(void *)&a6, 1, v8);
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3
{
  char v9 = +[ULDefaultsSingleton shared];
  uint64_t v10 = [v9 defaultsDictionary];

  uint64_t v11 = [NSString stringWithUTF8String:"ULLearningRecordingLimit"];
  v12 = [v10 objectForKey:v11];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v13 = [v12 unsignedIntValue];
  }
  else {
    int v13 = [&unk_2704F20A0 unsignedIntValue];
  }
  int v14 = v13;

  LODWORD(v19) = v14;
  -[ULRecordingEventStore _fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:](self, "_fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:", a4, a5, 0, 0, 0, 0, v19);
  var1 = retstr->var1;
  unint64_t v16 = 126 - 2 * __clz(0xEF7BDEF7BDEF7BDFLL * (((char *)var1 - (char *)retstr->var0) >> 3));
  if (var1 == retstr->var0) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  std::__introsort<std::_ClassicAlgPolicy,[(ULRecordingEventStore *)(unint64_t *)retstr->var0->var0.var0 fetchRecordingEventTriggersForLearningMeasurements:v17 atLoiGroupId:1];
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  v5[16] = 0;
  return [(ULRecordingEventStore *)self fetchRecordingEventTriggersForLearningMeasurements:a4 atLoiGroupId:v5];
}

- (id)getTriggerUUIDsForLoiGroupId:(const uuid *)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a3);
  v15[0] = 0;
  v15[1] = 0;
  unsigned int v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v15];
  uint64_t v8 = [v7 UUIDString];

  char v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K != NIL && %K != %@", @"triggerUUID", @"triggerUUID", v8];
  [v5 addObject:v9];

  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v6];
  [v5 addObject:v10];

  uint64_t v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  int v13 = [(ULStore *)self fetchPropertyForEntityName:v12 propertyToFetch:@"triggerUUID" distinctResults:1 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  return v13;
}

- (unsigned)countRecordingEventsFromTime:(double)a3 toTime:(double)a4 atLoiGroupId:(const uuid *)a5
{
  char v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [NSNumber numberWithDouble:a3];
  v12 = [NSNumber numberWithDouble:a4];
  int v13 = [v10 predicateWithFormat:@"%K > %@ && %K <= %@", @"recordingTimestamp", v11, @"recordingTimestamp", v12];
  [v9 addObject:v13];

  int v14 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a5);
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v14];
  [v9 addObject:v15];

  unint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  v18 = [(ULStore *)self countManagedObjectsWithEntityName:v17 byAndPredicates:v9 sortDescriptors:0 andLimit:0];

  if (v18) {
    unsigned int v19 = [v18 unsignedIntValue];
  }
  else {
    unsigned int v19 = 0;
  }

  return v19;
}

- (vector<boost::uuids::uuid,)fetchDistinctRecordingEventsFromTime:(ULRecordingEventStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4 withLimit:(double)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  int v13 = [MEMORY[0x263EFF980] array];
  int v14 = (void *)MEMORY[0x263F08A98];
  v15 = [NSNumber numberWithDouble:a4];
  unint64_t v16 = [NSNumber numberWithDouble:a5];
  uint64_t v17 = [v14 predicateWithFormat:@"%K > %@ && %K <= %@", @"recordingTimestamp", v15, @"recordingTimestamp", v16];
  [v13 addObject:v17];

  v18 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a6);
  unsigned int v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v18];
  [v13 addObject:v19];

  v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:0];
  id v21 = (objc_class *)objc_opt_class();
  id v22 = NSStringFromClass(v21);
  v26[0] = v20;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v24 = [(ULStore *)self fetchPropertyForEntityName:v22 propertyToFetch:@"recordingUUID" distinctResults:1 byAndPredicates:v13 sortDescriptors:v23 andLimit:a7];

  ULDBUtils::boostUUIDsFromNSStringArray(v24, retstr);
  return result;
}

- (id)getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:(optional<const boost:(optional<const double>)a4 :(optional<const double>)a5 uuids:(unsigned int)a6 :uuid> *)a3 fromTime:toTime:withLimit:
{
  BOOL var1 = a5.var1;
  double v8 = a5.var0.var1;
  BOOL v9 = a4.var1;
  double v10 = a4.var0.var1;
  int v13 = [MEMORY[0x263EFF980] array];
  int v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"eventType", &unk_2704F2040];
  [v13 addObject:v14];

  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"eventSubType", &unk_2704F2058];
  [v13 addObject:v15];

  if (v9 && var1)
  {
    unint64_t v16 = (void *)MEMORY[0x263F08A98];
    uint64_t v17 = [NSNumber numberWithDouble:v10];
    v18 = [NSNumber numberWithDouble:v8];
    unsigned int v19 = [v16 predicateWithFormat:@"%K > %@ && %K <= %@", @"recordingTimestamp", v17, @"recordingTimestamp", v18];
    [v13 addObject:v19];
  }
  if (a3->var1)
  {
    id v20 = (id)[(ULStore *)self db][56];
    id v21 = v20;
    if (!a3->var1) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    id v22 = [v20 getLoiIdsInLoiGroupId:a3];

    id v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v22];
    [v13 addObject:v23];
  }
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v26 = [(ULStore *)self fetchPropertyForEntityName:v25 propertyToFetch:@"recordingUUID" distinctResults:1 byAndPredicates:v13 sortDescriptors:0 andLimit:a6];

  return v26;
}

- (id)getRecordingUUIDsForLocalizationActionsFromTime:(optional<const double>)a3 toTime:(optional<const double>)a4
{
  BOOL var1 = a4.var1;
  double v5 = a4.var0.var1;
  BOOL v6 = a3.var1;
  double v7 = a3.var0.var1;
  BOOL v9 = [MEMORY[0x263EFF980] array];
  double v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K=%@", @"eventType", &unk_2704F2040];
  [v9 addObject:v10];

  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"eventSubType", &unk_2704F24A8];
  [v9 addObject:v11];

  if (v6 && var1)
  {
    v12 = (void *)MEMORY[0x263F08A98];
    int v13 = [NSNumber numberWithDouble:v7];
    int v14 = [NSNumber numberWithDouble:v5];
    v15 = [v12 predicateWithFormat:@"%K > %@ && %K <= %@", @"recordingTimestamp", v13, @"recordingTimestamp", v14];
    [v9 addObject:v15];
  }
  unint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  v18 = [(ULStore *)self fetchPropertyForEntityName:v17 propertyToFetch:@"recordingUUID" distinctResults:1 byAndPredicates:v9 sortDescriptors:0 andLimit:0];

  return v18;
}

- (id)getRecordingUUIDsOlderThan:(double)a3 orNewerThan:(double)a4
{
  double v7 = [MEMORY[0x263EFF980] array];
  double v8 = (void *)MEMORY[0x263F08A98];
  BOOL v9 = [NSNumber numberWithDouble:a3];
  double v10 = [NSNumber numberWithDouble:a4];
  uint64_t v11 = [v8 predicateWithFormat:@"%K < %@ || %K > %@", @"recordingTimestamp", v9, @"recordingTimestamp", v10];
  [v7 addObject:v11];

  v12 = (objc_class *)objc_opt_class();
  int v13 = NSStringFromClass(v12);
  int v14 = [(ULStore *)self fetchPropertyForEntityName:v13 propertyToFetch:@"recordingUUID" distinctResults:1 byAndPredicates:v7 sortDescriptors:0 andLimit:0];

  return v14;
}

- (id)getDistinctRecordingUUIDsWithLimit:(unsigned int)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  double v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:0];
  BOOL v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  v11[0] = v5;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  BOOL v9 = [(ULStore *)self fetchPropertyForEntityName:v7 propertyToFetch:@"recordingUUID" distinctResults:1 byAndPredicates:0 sortDescriptors:v8 andLimit:a3];

  return v9;
}

- (void)fetchMostRecentRecordingForLoiGroupId:(unsigned char *)a3@<X8>
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v6 = [MEMORY[0x263EFF980] array];
  double v7 = objc_msgSend(*(id *)(objc_msgSend(a1, "db") + 56), "getLoiIdsInLoiGroupId:", a2);
  double v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v7];
  [v6 addObject:v8];

  BOOL v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:0];
  v13[0] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [a1 _fetchRecordingEventsByAndPredicates:v6 sortDescriptors:v10 andLimit:1];

  if (v11[0] == v11[1])
  {
    *a3 = 0;
    a3[248] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationRecordingEventsTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((uint64_t)a3, v11[0]);
  }
  v12 = v11;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
}

- (double)getOldestRecordingTimestamp
{
  v8[1] = *MEMORY[0x263EF8340];
  double v2 = cl::chrono::CFAbsoluteTimeClock::now();
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:1];
  v8[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [a1 _fetchRecordingEventsByAndPredicates:0 sortDescriptors:v4 andLimit:1];

  if (v6[1] != v6[0]) {
    double v2 = *(double *)(v6[0] + 16);
  }
  double v7 = (void **)v6;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v7);

  return v2;
}

- (vector<std::string,)selectAllRecordingLOITypesFromTime:(ULRecordingEventStore *)self andLimit:(SEL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v32 = [MEMORY[0x263EFF980] array];
  BOOL v9 = (void *)MEMORY[0x263F08A98];
  double v10 = [NSNumber numberWithDouble:a4];
  uint64_t v11 = [v9 predicateWithFormat:@"%K > %@", @"recordingTimestamp", v10];
  [v32 addObject:v11];

  v12 = (objc_class *)objc_opt_class();
  int v13 = NSStringFromClass(v12);
  int v14 = [(ULStore *)self fetchPropertyForEntityName:v13 propertyToFetch:@"loiType" distinctResults:1 byAndPredicates:v32 sortDescriptors:0 andLimit:a5];

  retstr->var0 = 0;
  retstr->BOOL var1 = 0;
  retstr->var2.var0 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v15);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v35 + 1) + 8 * i) UTF8String]);
        BOOL var1 = (char *)retstr->var1;
        var0 = (char *)retstr->var2.var0;
        if (var1 >= var0)
        {
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
          unint64_t v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
          if (2 * v24 > v23) {
            unint64_t v23 = 2 * v24;
          }
          if (v24 >= 0x555555555555555) {
            unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v25 = v23;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->var2;
          if (v25) {
            v26 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&retstr->var2, v25);
          }
          else {
            v26 = 0;
          }
          v27 = v26 + v22;
          __v.__first_ = v26;
          __v.__begin_ = v27;
          __v.__end_cap_.__value_ = &v26[v25];
          long long v28 = *(_OWORD *)__p;
          v27->__r_.__value_.__r.__words[2] = v34;
          *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
          __p[1] = 0;
          std::string::size_type v34 = 0;
          __p[0] = 0;
          __v.__end_ = v27 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
          id v29 = retstr->var1;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          int v30 = SHIBYTE(v34);
          retstr->BOOL var1 = v29;
          if (v30 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v21 = *(_OWORD *)__p;
          *((void *)var1 + 2) = v34;
          *(_OWORD *)BOOL var1 = v21;
          retstr->BOOL var1 = var1 + 24;
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  return result;
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5 withCancelFunc:(function<BOOL)(
{
  v26[4] = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"recordingTimestamp" ascending:0];
  v12 = [(ULStore *)self managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3321888768;
  v20[2] = __100__ULRecordingEventStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke;
  v20[3] = &unk_2704DB238;
  unint64_t v23 = &v16;
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

void __100__ULRecordingEventStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)a1[4];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v10[0] = a1[5];
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[6];
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)(a1 + 10));
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 batchTransferManagedObjectsWithEntityName:v4 byAndPredicates:0 sortDescriptors:v5 batchSize:v6 limit:v7 intoTargetStore:v8 withCancelFunc:v9];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v9);
}

- (BOOL)batchTransferRecordingEventsForRecordingUUIDs:(const void *)a3 withEventTypes:(const void *)a4 batchSize:(unint64_t)a5 andLimit:(unsigned int)a6 intoTargetStore:(id)a7 withCancelFunc:(function<BOOL)(
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v26 = a7;
  id v14 = [MEMORY[0x263EFF980] array];
  unint64_t v25 = ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
  id v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"recordingUUID", v25];
  [v14 addObject:v15];

  uint64_t v16 = ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
  uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"eventType", v16];
  [v14 addObject:v17];

  uint64_t v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  char v19 = [(ULStore *)self managedObjectContext];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3321888768;
  v31[2] = __136__ULRecordingEventStore_batchTransferRecordingEventsForRecordingUUIDs_withEventTypes_batchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke;
  v31[3] = &unk_2704E15C8;
  long long v35 = &v27;
  v31[4] = self;
  id v20 = v14;
  id v32 = v20;
  id v21 = v18;
  id v33 = v21;
  unint64_t v36 = a5;
  unsigned int v38 = a6;
  id v22 = v26;
  id v34 = v22;
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v37, (uint64_t)a8);
  [v19 performBlockAndWait:v31];

  BOOL v23 = *((unsigned char *)v28 + 24) != 0;
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v37);

  _Block_object_dispose(&v27, 8);
  return v23;
}

void __136__ULRecordingEventStore_batchTransferRecordingEventsForRecordingUUIDs_withEventTypes_batchSize_andLimit_intoTargetStore_withCancelFunc___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  double v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  v11[0] = *(void *)(a1 + 48);
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(unsigned int *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 56);
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v10, a1 + 80);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v2 batchTransferManagedObjectsWithEntityName:v4 byAndPredicates:v5 sortDescriptors:v6 batchSize:v7 limit:v8 intoTargetStore:v9 withCancelFunc:v10];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v10);
}

- (unsigned)countRecordingEventsForLoiGroupId:(const uuid *)a3
{
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a3);
  uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v6];
  [v5 addObject:v7];

  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  id v10 = [(ULStore *)self countManagedObjectsWithEntityName:v9 byAndPredicates:v5 sortDescriptors:0 andLimit:0];

  if (v10) {
    unsigned int v11 = [v10 unsignedIntValue];
  }
  else {
    unsigned int v11 = 0;
  }

  return v11;
}

- (void)fetchRecordingEventTriggersForLearningMeasurements:(uint64_t)a3 atLoiGroupId:(char)a4
{
  uint64_t v251 = *MEMORY[0x263EF8340];
LABEL_2:
  uint64_t v8 = (long long *)a2;
  uint64_t v9 = a2 - 31;
  id v10 = a1;
  while (1)
  {
    a1 = v10;
    uint64_t v11 = (char *)v8 - (char *)v10;
    unint64_t v12 = 0xEF7BDEF7BDEF7BDFLL * (((char *)v8 - (char *)v10) >> 3);
    if (v5 || !v4)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unint64_t v102 = bswap64(*(a2 - 31));
          unint64_t v103 = bswap64(*a1);
          if (v102 != v103 || (unint64_t v102 = bswap64(*(a2 - 30)), v103 = bswap64(a1[1]), v102 != v103))
          {
            if (v102 < v103) {
              int v212 = -1;
            }
            else {
              int v212 = 1;
            }
            if (v212 < 0) {
              std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((long long *)a1, (long long *)(a2 - 31));
            }
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, a1 + 31, v9);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, a1 + 31, a1 + 62, v9);
          break;
        case 5uLL:
          std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *,0>(a1, a1 + 31, a1 + 62, a1 + 93, v9);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v11 <= 5951) {
      break;
    }
    if (!a3)
    {
      if (a1 != (unint64_t *)v8)
      {
        int64_t v127 = (v12 - 2) >> 1;
        int64_t v128 = v127;
        do
        {
          int64_t v129 = v128;
          if (v127 >= v128)
          {
            uint64_t v130 = (2 * v128) | 1;
            v131 = &a1[31 * v130];
            if (2 * v128 + 2 < (uint64_t)v12)
            {
              unint64_t v132 = bswap64(*v131);
              unint64_t v133 = bswap64(v131[31]);
              if (v132 == v133 && (unint64_t v132 = bswap64(v131[1]), v133 = bswap64(v131[32]), v132 == v133)) {
                int v134 = 0;
              }
              else {
                int v134 = v132 < v133 ? -1 : 1;
              }
              if (v134 < 0)
              {
                v131 += 31;
                uint64_t v130 = 2 * v128 + 2;
              }
            }
            v135 = &a1[31 * v128];
            unint64_t v136 = bswap64(*v131);
            unint64_t v137 = bswap64(*v135);
            if (v136 == v137 && (unint64_t v136 = bswap64(v131[1]), v137 = bswap64(v135[1]), v136 == v137)
              || (v136 < v137 ? (int v138 = -1) : (int v138 = 1), (v138 & 0x80000000) == 0))
            {
              long long v139 = *(_OWORD *)v135;
              unint64_t v244 = v135[2];
              long long v243 = v139;
              v140 = &a1[31 * v129];
              long long v141 = *(_OWORD *)(v140 + 3);
              unint64_t v246 = v140[5];
              long long __p = v141;
              v140[4] = 0;
              v140[5] = 0;
              v140[3] = 0;
              long long v142 = *((_OWORD *)v140 + 3);
              *(_OWORD *)((char *)v247 + 12) = *(_OWORD *)((char *)v140 + 60);
              v247[0] = v142;
              CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248, (const CLMicroLocationProto::RecordingEvent *)(v140 + 10));
              v143 = &a1[31 * v129];
              long long v144 = *((_OWORD *)v143 + 14);
              char v250 = *((unsigned char *)v143 + 240);
              long long v249 = v144;
              do
              {
                v145 = v131;
                long long v146 = *(_OWORD *)v131;
                v135[2] = v131[2];
                *(_OWORD *)v135 = v146;
                v147 = (void **)(v135 + 3);
                if (*((char *)v135 + 47) < 0) {
                  operator delete(*v147);
                }
                long long v148 = *(_OWORD *)(v145 + 3);
                v135[5] = v145[5];
                *(_OWORD *)v147 = v148;
                *((unsigned char *)v145 + 47) = 0;
                *((unsigned char *)v145 + 24) = 0;
                long long v149 = *((_OWORD *)v145 + 3);
                *(_OWORD *)((char *)v135 + 60) = *(_OWORD *)((char *)v145 + 60);
                *((_OWORD *)v135 + 3) = v149;
                CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v135 + 10), (const CLMicroLocationProto::RecordingEvent *)(v145 + 10));
                long long v150 = *((_OWORD *)v145 + 14);
                *((unsigned char *)v135 + 240) = *((unsigned char *)v145 + 240);
                *((_OWORD *)v135 + 14) = v150;
                if (v127 < v130) {
                  break;
                }
                v131 = &a1[31 * ((2 * v130) | 1)];
                if (2 * v130 + 2 < (uint64_t)v12)
                {
                  unint64_t v151 = bswap64(*v131);
                  unint64_t v152 = bswap64(v131[31]);
                  if (v151 == v152 && (unint64_t v151 = bswap64(v131[1]), v152 = bswap64(v131[32]), v151 == v152)) {
                    int v153 = 0;
                  }
                  else {
                    int v153 = v151 < v152 ? -1 : 1;
                  }
                  if (v153 >= 0)
                  {
                    uint64_t v130 = (2 * v130) | 1;
                  }
                  else
                  {
                    v131 += 31;
                    uint64_t v130 = 2 * v130 + 2;
                  }
                }
                else
                {
                  uint64_t v130 = (2 * v130) | 1;
                }
                unint64_t v154 = bswap64(*v131);
                unint64_t v155 = bswap64(v243);
                if (v154 == v155
                  && (unint64_t v154 = bswap64(v131[1]), v155 = bswap64(*((unint64_t *)&v243 + 1)), v154 == v155))
                {
                  int v156 = 0;
                }
                else
                {
                  int v156 = v154 < v155 ? -1 : 1;
                }
                v135 = v145;
              }
              while ((v156 & 0x80000000) == 0);
              v157 = (void **)(v145 + 3);
              long long v158 = v243;
              v145[2] = v244;
              *(_OWORD *)v145 = v158;
              if (*((char *)v145 + 47) < 0) {
                operator delete(*v157);
              }
              long long v159 = __p;
              v145[5] = v246;
              *(_OWORD *)v157 = v159;
              HIBYTE(v246) = 0;
              LOBYTE(__p) = 0;
              long long v160 = *(_OWORD *)((char *)v247 + 12);
              *((_OWORD *)v145 + 3) = v247[0];
              *(_OWORD *)((char *)v145 + 60) = v160;
              CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v145 + 10), (const CLMicroLocationProto::RecordingEvent *)v248);
              long long v161 = v249;
              *((unsigned char *)v145 + 240) = v250;
              *((_OWORD *)v145 + 14) = v161;
              CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248);
              if (SHIBYTE(v246) < 0) {
                operator delete((void *)__p);
              }
            }
          }
          int64_t v128 = v129 - 1;
        }
        while (v129);
        int64_t v162 = v11 / 0xF8uLL;
        v231 = (CLMicroLocationProto::RecordingEvent *)(a1 + 3);
        do
        {
          unint64_t v236 = a1[2];
          long long v235 = *(_OWORD *)a1;
          long long v237 = *(_OWORD *)v231;
          unint64_t v238 = a1[5];
          a1[4] = 0;
          a1[5] = 0;
          *(void *)v231 = 0;
          *(_OWORD *)v239 = *((_OWORD *)a1 + 3);
          *(_OWORD *)&v239[12] = *(_OWORD *)((char *)a1 + 60);
          CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v240, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
          uint64_t v163 = 0;
          long long v164 = *((_OWORD *)a1 + 14);
          char v242 = *((unsigned char *)a1 + 240);
          long long v241 = v164;
          uint64_t v165 = (uint64_t)a1;
          do
          {
            uint64_t v166 = v165 + 248 * v163 + 248;
            uint64_t v167 = 2 * v163;
            uint64_t v163 = (2 * v163) | 1;
            if (v167 + 2 < v162)
            {
              unint64_t v168 = bswap64(*(void *)v166);
              unint64_t v169 = bswap64(*(void *)(v166 + 248));
              if (v168 == v169
                && (unint64_t v168 = bswap64(*(void *)(v166 + 8)), v169 = bswap64(*(void *)(v166 + 256)), v168 == v169))
              {
                int v170 = 0;
              }
              else
              {
                int v170 = v168 < v169 ? -1 : 1;
              }
              if (v170 < 0)
              {
                v166 += 248;
                uint64_t v163 = v167 + 2;
              }
            }
            long long v171 = *(_OWORD *)v166;
            *(void *)(v165 + 16) = *(void *)(v166 + 16);
            *(_OWORD *)uint64_t v165 = v171;
            v172 = (void **)(v165 + 24);
            if (*(char *)(v165 + 47) < 0) {
              operator delete(*v172);
            }
            long long v173 = *(_OWORD *)(v166 + 24);
            *(void *)(v165 + 40) = *(void *)(v166 + 40);
            *(_OWORD *)v172 = v173;
            *(unsigned char *)(v166 + 47) = 0;
            *(unsigned char *)(v166 + 24) = 0;
            long long v174 = *(_OWORD *)(v166 + 48);
            *(_OWORD *)(v165 + 60) = *(_OWORD *)(v166 + 60);
            *(_OWORD *)(v165 + 48) = v174;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v165 + 80), (const CLMicroLocationProto::RecordingEvent *)(v166 + 80));
            long long v175 = *(_OWORD *)(v166 + 224);
            *(unsigned char *)(v165 + 240) = *(unsigned char *)(v166 + 240);
            *(_OWORD *)(v165 + 224) = v175;
            uint64_t v165 = v166;
          }
          while (v163 <= (uint64_t)((unint64_t)(v162 - 2) >> 1));
          v176 = (void **)(v166 + 24);
          v177 = (long long *)(v166 + 48);
          v233 = (CLMicroLocationProto::RecordingEvent *)(v166 + 224);
          if ((unint64_t *)v166 == a2 - 31)
          {
            *(void *)(v166 + 16) = v236;
            *(_OWORD *)uint64_t v166 = v235;
            if (*(char *)(v166 + 47) < 0) {
              operator delete(*v176);
            }
            *(void *)(v166 + 40) = v238;
            *(_OWORD *)v176 = v237;
            *(_OWORD *)(v166 + 60) = *(_OWORD *)&v239[12];
            long long *v177 = *(_OWORD *)v239;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v166 + 80), (const CLMicroLocationProto::RecordingEvent *)v240);
            long long v191 = v241;
            *(unsigned char *)(v166 + 240) = v242;
            *(_OWORD *)v233 = v191;
          }
          else
          {
            long long v178 = *(_OWORD *)(a2 - 31);
            *(void *)(v166 + 16) = *(a2 - 29);
            *(_OWORD *)uint64_t v166 = v178;
            if (*(char *)(v166 + 47) < 0) {
              operator delete(*v176);
            }
            long long v179 = *((_OWORD *)a2 - 14);
            *(void *)(v166 + 40) = *(a2 - 26);
            *(_OWORD *)v176 = v179;
            *((unsigned char *)a2 - 201) = 0;
            *((unsigned char *)a2 - 224) = 0;
            long long v180 = *(_OWORD *)(a2 - 25);
            *(_OWORD *)(v166 + 60) = *(_OWORD *)((char *)a2 - 188);
            long long *v177 = v180;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v166 + 80), (const CLMicroLocationProto::RecordingEvent *)(a2 - 21));
            v181 = (void **)(a2 - 28);
            long long v182 = *(_OWORD *)(a2 - 3);
            *(unsigned char *)(v166 + 240) = *((unsigned char *)a2 - 8);
            *(_OWORD *)v233 = v182;
            *(a2 - 29) = v236;
            *(_OWORD *)(a2 - 31) = v235;
            if (*((char *)a2 - 201) < 0) {
              operator delete(*v181);
            }
            v183 = a2 - 25;
            *(a2 - 26) = v238;
            *(_OWORD *)v181 = v237;
            *(_OWORD *)((char *)v183 + 12) = *(_OWORD *)&v239[12];
            *(_OWORD *)v183 = *(_OWORD *)v239;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a2 - 21), (const CLMicroLocationProto::RecordingEvent *)v240);
            v184 = a2 - 3;
            long long v185 = v241;
            *((unsigned char *)v184 + 16) = v242;
            *(_OWORD *)v184 = v185;
            uint64_t v186 = v166 - (void)a1 + 248;
            if (v186 >= 249)
            {
              unint64_t v187 = (v186 / 0xF8uLL - 2) >> 1;
              v188 = &a1[31 * v187];
              unint64_t v189 = bswap64(*v188);
              unint64_t v190 = bswap64(*(void *)v166);
              if (v189 != v190 || (unint64_t v189 = bswap64(v188[1]), v190 = bswap64(*(void *)(v166 + 8)), v189 != v190))
              {
                int v192 = v189 < v190 ? -1 : 1;
                if (v192 < 0)
                {
                  long long v193 = *(_OWORD *)v166;
                  unint64_t v244 = *(void *)(v166 + 16);
                  long long v243 = v193;
                  long long v194 = *(_OWORD *)v176;
                  unint64_t v246 = *(void *)(v166 + 40);
                  long long __p = v194;
                  *(void *)(v166 + 32) = 0;
                  *(void *)(v166 + 40) = 0;
                  *v176 = 0;
                  long long v195 = *v177;
                  *(_OWORD *)((char *)v247 + 12) = *(_OWORD *)(v166 + 60);
                  v247[0] = v195;
                  CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248, (const CLMicroLocationProto::RecordingEvent *)(v166 + 80));
                  long long v196 = *(_OWORD *)v233;
                  char v250 = *(unsigned char *)(v166 + 240);
                  long long v249 = v196;
                  do
                  {
                    uint64_t v197 = (uint64_t)v188;
                    long long v198 = *(_OWORD *)v188;
                    *(void *)(v166 + 16) = v188[2];
                    *(_OWORD *)uint64_t v166 = v198;
                    v199 = (void **)(v166 + 24);
                    if (*(char *)(v166 + 47) < 0) {
                      operator delete(*v199);
                    }
                    long long v200 = *(_OWORD *)(v188 + 3);
                    *(void *)(v166 + 40) = v188[5];
                    *(_OWORD *)v199 = v200;
                    *((unsigned char *)v188 + 47) = 0;
                    *((unsigned char *)v188 + 24) = 0;
                    long long v201 = *((_OWORD *)v188 + 3);
                    *(_OWORD *)(v166 + 60) = *(_OWORD *)((char *)v188 + 60);
                    *(_OWORD *)(v166 + 48) = v201;
                    CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v166 + 80), (const CLMicroLocationProto::RecordingEvent *)(v188 + 10));
                    long long v202 = *((_OWORD *)v188 + 14);
                    *(unsigned char *)(v166 + 240) = *((unsigned char *)v188 + 240);
                    *(_OWORD *)(v166 + 224) = v202;
                    if (!v187) {
                      break;
                    }
                    unint64_t v187 = (v187 - 1) >> 1;
                    v188 = &a1[31 * v187];
                    unint64_t v203 = bswap64(*v188);
                    unint64_t v204 = bswap64(v243);
                    if (v203 == v204
                      && (unint64_t v203 = bswap64(v188[1]), v204 = bswap64(*((unint64_t *)&v243 + 1)), v203 == v204))
                    {
                      int v205 = 0;
                    }
                    else
                    {
                      int v205 = v203 < v204 ? -1 : 1;
                    }
                    uint64_t v166 = v197;
                  }
                  while (v205 < 0);
                  v206 = (void **)(v197 + 24);
                  long long v207 = v243;
                  *(void *)(v197 + 16) = v244;
                  *(_OWORD *)uint64_t v197 = v207;
                  if (*(char *)(v197 + 47) < 0) {
                    operator delete(*v206);
                  }
                  long long v208 = __p;
                  *(void *)(v197 + 40) = v246;
                  *(_OWORD *)v206 = v208;
                  HIBYTE(v246) = 0;
                  LOBYTE(__p) = 0;
                  long long v209 = *(_OWORD *)((char *)v247 + 12);
                  *(_OWORD *)(v197 + 48) = v247[0];
                  *(_OWORD *)(v197 + 60) = v209;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v197 + 80), (const CLMicroLocationProto::RecordingEvent *)v248);
                  long long v210 = v249;
                  *(unsigned char *)(v197 + 240) = v250;
                  *(_OWORD *)(v197 + 224) = v210;
                  CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248);
                  if (SHIBYTE(v246) < 0) {
                    operator delete((void *)__p);
                  }
                }
              }
            }
          }
          CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v240);
          a2 -= 31;
        }
        while (v162-- > 2);
      }
      return;
    }
    unint64_t v13 = v12 >> 1;
    id v14 = &a1[31 * (v12 >> 1)];
    if ((unint64_t)v11 >= 0x7C01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, &a1[31 * (v12 >> 1)], v9);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1 + 31, &a1[31 * v13 - 31], a2 - 62);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1 + 62, &a1[31 * v13 + 31], a2 - 93);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(&a1[31 * v13 - 31], v14, &a1[31 * v13 + 31]);
      std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((long long *)a1, (long long *)v14);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(&a1[31 * (v12 >> 1)], a1, v9);
    }
    --a3;
    if ((a4 & 1) == 0
      && ((v15 = bswap64(*(a1 - 31)), unint64_t v16 = bswap64(*a1), v15 == v16)
       && (v15 = bswap64(*(a1 - 30)), unint64_t v16 = bswap64(a1[1]), v15 == v16)
       || (v15 < v16 ? (int v24 = -1) : (int v24 = 1), (v24 & 0x80000000) == 0)))
    {
      long long v17 = *(_OWORD *)a1;
      unint64_t v244 = a1[2];
      long long v243 = v17;
      unint64_t v18 = a1[5];
      long long __p = *(_OWORD *)(a1 + 3);
      unint64_t v246 = v18;
      a1[4] = 0;
      a1[5] = 0;
      a1[3] = 0;
      long long v19 = *(_OWORD *)((char *)a1 + 60);
      v247[0] = *((_OWORD *)a1 + 3);
      *(_OWORD *)((char *)v247 + 12) = v19;
      CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
      long long v20 = *((_OWORD *)a1 + 14);
      char v250 = *((unsigned char *)a1 + 240);
      long long v249 = v20;
      unint64_t v21 = bswap64(v243);
      unint64_t v22 = bswap64(*v9);
      if (v21 == v22 && (unint64_t v21 = bswap64(*((unint64_t *)&v243 + 1)), v22 = bswap64(*(a2 - 30)), v21 == v22))
      {
        int v23 = 0;
      }
      else if (v21 < v22)
      {
        int v23 = -1;
      }
      else
      {
        int v23 = 1;
      }
      if (v23 < 0)
      {
        v70 = a1;
        id v10 = a1;
        do
        {
          unint64_t v71 = v10[31];
          v10 += 31;
          unint64_t v72 = bswap64(v243);
          unint64_t v73 = bswap64(v71);
          if (v72 == v73 && (unint64_t v72 = bswap64(*((unint64_t *)&v243 + 1)), v73 = bswap64(v70[32]), v72 == v73))
          {
            int v74 = 0;
          }
          else if (v72 < v73)
          {
            int v74 = -1;
          }
          else
          {
            int v74 = 1;
          }
          v70 = v10;
        }
        while ((v74 & 0x80000000) == 0);
      }
      else
      {
        v66 = a1 + 31;
        do
        {
          id v10 = v66;
          if (v66 >= (unint64_t *)v8) {
            break;
          }
          unint64_t v67 = bswap64(v243);
          unint64_t v68 = bswap64(*v10);
          if (v67 == v68 && (unint64_t v67 = bswap64(*((unint64_t *)&v243 + 1)), v68 = bswap64(v10[1]), v67 == v68)) {
            int v69 = 0;
          }
          else {
            int v69 = v67 < v68 ? -1 : 1;
          }
          v66 = v10 + 31;
        }
        while ((v69 & 0x80000000) == 0);
      }
      v75 = v8;
      if (v10 < (unint64_t *)v8)
      {
        v76 = v8;
        v75 = v8;
        do
        {
          unint64_t v77 = *((void *)v75 - 31);
          v75 = (long long *)((char *)v75 - 248);
          unint64_t v78 = bswap64(v243);
          unint64_t v79 = bswap64(v77);
          if (v78 == v79
            && (unint64_t v78 = bswap64(*((unint64_t *)&v243 + 1)), v79 = bswap64(*((void *)v76 - 30)), v78 == v79))
          {
            int v80 = 0;
          }
          else if (v78 < v79)
          {
            int v80 = -1;
          }
          else
          {
            int v80 = 1;
          }
          v76 = v75;
        }
        while (v80 < 0);
      }
      while (v10 < (unint64_t *)v75)
      {
        std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((long long *)v10, v75);
        v81 = v10;
        do
        {
          unint64_t v82 = v10[31];
          v10 += 31;
          unint64_t v83 = bswap64(v243);
          unint64_t v84 = bswap64(v82);
          if (v83 == v84 && (unint64_t v83 = bswap64(*((unint64_t *)&v243 + 1)), v84 = bswap64(v81[32]), v83 == v84))
          {
            int v85 = 0;
          }
          else if (v83 < v84)
          {
            int v85 = -1;
          }
          else
          {
            int v85 = 1;
          }
          v81 = v10;
        }
        while ((v85 & 0x80000000) == 0);
        v86 = v75;
        do
        {
          unint64_t v87 = *((void *)v75 - 31);
          v75 = (long long *)((char *)v75 - 248);
          unint64_t v88 = bswap64(v243);
          unint64_t v89 = bswap64(v87);
          if (v88 == v89
            && (unint64_t v88 = bswap64(*((unint64_t *)&v243 + 1)), v89 = bswap64(*((void *)v86 - 30)), v88 == v89))
          {
            int v90 = 0;
          }
          else if (v88 < v89)
          {
            int v90 = -1;
          }
          else
          {
            int v90 = 1;
          }
          v86 = v75;
        }
        while (v90 < 0);
      }
      v91 = v10 - 31;
      if (v10 - 31 != a1)
      {
        v92 = (void **)(a1 + 3);
        long long v93 = *(_OWORD *)v91;
        a1[2] = *(v10 - 29);
        *(_OWORD *)a1 = v93;
        if (*((char *)a1 + 47) < 0) {
          operator delete(*v92);
        }
        long long v94 = *((_OWORD *)v10 - 14);
        a1[5] = *(v10 - 26);
        *(_OWORD *)v92 = v94;
        *((unsigned char *)v10 - 201) = 0;
        *((unsigned char *)v10 - 224) = 0;
        long long v95 = *(_OWORD *)(v10 - 25);
        *(_OWORD *)((char *)a1 + 60) = *(_OWORD *)((char *)v10 - 188);
        *((_OWORD *)a1 + 3) = v95;
        CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a1 + 10), (const CLMicroLocationProto::RecordingEvent *)(v10 - 21));
        long long v96 = *(_OWORD *)(v10 - 3);
        *((unsigned char *)a1 + 240) = *((unsigned char *)v10 - 8);
        *((_OWORD *)a1 + 14) = v96;
      }
      long long v97 = v243;
      *(v10 - 29) = v244;
      *(_OWORD *)v91 = v97;
      v98 = (void **)(v10 - 28);
      if (*((char *)v10 - 201) < 0) {
        operator delete(*v98);
      }
      long long v99 = __p;
      *(v10 - 26) = v246;
      *(_OWORD *)v98 = v99;
      HIBYTE(v246) = 0;
      LOBYTE(__p) = 0;
      long long v100 = v247[0];
      *(_OWORD *)((char *)v10 - 188) = *(_OWORD *)((char *)v247 + 12);
      *(_OWORD *)(v10 - 25) = v100;
      CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v10 - 21), (const CLMicroLocationProto::RecordingEvent *)v248);
      long long v101 = v249;
      *((unsigned char *)v10 - 8) = v250;
      *(_OWORD *)(v10 - 3) = v101;
      CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248);
      if (SHIBYTE(v246) < 0) {
        operator delete((void *)__p);
      }
LABEL_79:
      a4 = 0;
    }
    else
    {
      long long v25 = *(_OWORD *)a1;
      unint64_t v244 = a1[2];
      long long v243 = v25;
      unint64_t v26 = a1[5];
      long long __p = *(_OWORD *)(a1 + 3);
      unint64_t v246 = v26;
      a1[4] = 0;
      a1[5] = 0;
      a1[3] = 0;
      long long v27 = *(_OWORD *)((char *)a1 + 60);
      v247[0] = *((_OWORD *)a1 + 3);
      *(_OWORD *)((char *)v247 + 12) = v27;
      CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
      uint64_t v28 = 0;
      uint64_t v29 = (void **)(a1 + 3);
      long long v30 = *((_OWORD *)a1 + 14);
      char v250 = *((unsigned char *)a1 + 240);
      long long v249 = v30;
      do
      {
        unint64_t v31 = bswap64(a1[v28 + 31]);
        unint64_t v32 = bswap64(v243);
        if (v31 == v32 && (unint64_t v31 = bswap64(a1[v28 + 32]), v32 = bswap64(*((unint64_t *)&v243 + 1)), v31 == v32))
        {
          int v33 = 0;
        }
        else if (v31 < v32)
        {
          int v33 = -1;
        }
        else
        {
          int v33 = 1;
        }
        v28 += 31;
      }
      while (v33 < 0);
      id v34 = &a1[v28];
      long long v35 = v8;
      if (v28 == 31)
      {
        v40 = a2;
        while (v34 < v40)
        {
          unint64_t v36 = (long long *)(v40 - 31);
          unint64_t v41 = bswap64(*(v40 - 31));
          unint64_t v42 = bswap64(v243);
          if (v41 == v42 && (unint64_t v41 = bswap64(*(v40 - 30)), v42 = bswap64(*((unint64_t *)&v243 + 1)), v41 == v42))
          {
            int v43 = 0;
          }
          else if (v41 < v42)
          {
            int v43 = -1;
          }
          else
          {
            int v43 = 1;
          }
          v40 -= 31;
          if (v43 < 0) {
            goto LABEL_47;
          }
        }
        unint64_t v36 = (long long *)v40;
      }
      else
      {
        do
        {
          unint64_t v36 = (long long *)((char *)v35 - 248);
          unint64_t v37 = bswap64(*((void *)v35 - 31));
          unint64_t v38 = bswap64(v243);
          if (v37 == v38
            && (unint64_t v37 = bswap64(*((void *)v35 - 30)), v38 = bswap64(*((unint64_t *)&v243 + 1)), v37 == v38))
          {
            int v39 = 0;
          }
          else if (v37 < v38)
          {
            int v39 = -1;
          }
          else
          {
            int v39 = 1;
          }
          long long v35 = (long long *)((char *)v35 - 248);
        }
        while ((v39 & 0x80000000) == 0);
      }
LABEL_47:
      id v10 = v34;
      if (v34 < (unint64_t *)v36)
      {
        char v44 = v36;
        do
        {
          std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((long long *)v10, v44);
          uint64_t v45 = v10;
          do
          {
            unint64_t v46 = v10[31];
            v10 += 31;
            unint64_t v47 = bswap64(v46);
            unint64_t v48 = bswap64(v243);
            if (v47 == v48 && (unint64_t v47 = bswap64(v45[32]), v48 = bswap64(*((unint64_t *)&v243 + 1)), v47 == v48))
            {
              int v49 = 0;
            }
            else if (v47 < v48)
            {
              int v49 = -1;
            }
            else
            {
              int v49 = 1;
            }
            uint64_t v45 = v10;
          }
          while (v49 < 0);
          v50 = v44;
          do
          {
            unint64_t v51 = *((void *)v44 - 31);
            char v44 = (long long *)((char *)v44 - 248);
            unint64_t v52 = bswap64(v51);
            unint64_t v53 = bswap64(v243);
            if (v52 == v53
              && (unint64_t v52 = bswap64(*((void *)v50 - 30)), v53 = bswap64(*((unint64_t *)&v243 + 1)), v52 == v53))
            {
              int v54 = 0;
            }
            else if (v52 < v53)
            {
              int v54 = -1;
            }
            else
            {
              int v54 = 1;
            }
            v50 = v44;
          }
          while ((v54 & 0x80000000) == 0);
        }
        while (v10 < (unint64_t *)v44);
      }
      v55 = v10 - 31;
      if (v10 - 31 != a1)
      {
        long long v56 = *(_OWORD *)v55;
        a1[2] = *(v10 - 29);
        *(_OWORD *)a1 = v56;
        if (*((char *)a1 + 47) < 0) {
          operator delete(*v29);
        }
        long long v57 = *((_OWORD *)v10 - 14);
        a1[5] = *(v10 - 26);
        *(_OWORD *)uint64_t v29 = v57;
        *((unsigned char *)v10 - 201) = 0;
        *((unsigned char *)v10 - 224) = 0;
        long long v58 = *(_OWORD *)(v10 - 25);
        *(_OWORD *)((char *)a1 + 60) = *(_OWORD *)((char *)v10 - 188);
        *((_OWORD *)a1 + 3) = v58;
        CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a1 + 10), (const CLMicroLocationProto::RecordingEvent *)(v10 - 21));
        long long v59 = *(_OWORD *)(v10 - 3);
        *((unsigned char *)a1 + 240) = *((unsigned char *)v10 - 8);
        *((_OWORD *)a1 + 14) = v59;
      }
      long long v60 = v243;
      *(v10 - 29) = v244;
      *(_OWORD *)v55 = v60;
      v61 = (void **)(v10 - 28);
      if (*((char *)v10 - 201) < 0) {
        operator delete(*v61);
      }
      long long v62 = __p;
      *(v10 - 26) = v246;
      *(_OWORD *)v61 = v62;
      HIBYTE(v246) = 0;
      LOBYTE(__p) = 0;
      long long v63 = v247[0];
      *(_OWORD *)((char *)v10 - 188) = *(_OWORD *)((char *)v247 + 12);
      *(_OWORD *)(v10 - 25) = v63;
      CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v10 - 21), (const CLMicroLocationProto::RecordingEvent *)v248);
      long long v64 = v249;
      *((unsigned char *)v10 - 8) = v250;
      *(_OWORD *)(v10 - 3) = v64;
      CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248);
      if (SHIBYTE(v246) < 0) {
        operator delete((void *)__p);
      }
      BOOL v4 = v34 >= (unint64_t *)v36;
      uint64_t v8 = (long long *)a2;
      if (!v4) {
        goto LABEL_78;
      }
      BOOL v65 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, v10 - 31);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *>(v10, a2))
      {
        a2 = v10 - 31;
        if (v65) {
          return;
        }
        goto LABEL_2;
      }
      if (!v65)
      {
LABEL_78:
        std::__introsort<std::_ClassicAlgPolicy,[(ULRecordingEventStore *)a1 fetchRecordingEventTriggersForLearningMeasurements:a3 atLoiGroupId:a4 & 1];
        goto LABEL_79;
      }
    }
  }
  if ((a4 & 1) == 0)
  {
    if (a1 == (unint64_t *)v8) {
      return;
    }
    v213 = a1 + 31;
    if (a1 + 31 == a2) {
      return;
    }
    for (uint64_t i = a1 - 31; ; i += 31)
    {
      v215 = v213;
      unint64_t v216 = bswap64(a1[31]);
      unint64_t v217 = bswap64(*a1);
      if (v216 != v217) {
        break;
      }
      unint64_t v216 = bswap64(v215[1]);
      unint64_t v217 = bswap64(a1[1]);
      v218 = a2;
      if (v216 != v217) {
        goto LABEL_280;
      }
LABEL_298:
      v213 = v215 + 31;
      a1 = v215;
      if (v215 + 31 == v218) {
        return;
      }
    }
    v218 = a2;
LABEL_280:
    if (v216 < v217) {
      int v219 = -1;
    }
    else {
      int v219 = 1;
    }
    if (v219 < 0)
    {
      long long v220 = *(_OWORD *)v215;
      unint64_t v244 = v215[2];
      long long v243 = v220;
      long long __p = *((_OWORD *)a1 + 17);
      unint64_t v246 = a1[36];
      a1[34] = 0;
      a1[35] = 0;
      a1[36] = 0;
      v247[0] = *(_OWORD *)(a1 + 37);
      *(_OWORD *)((char *)v247 + 12) = *(_OWORD *)((char *)a1 + 308);
      CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248, (const CLMicroLocationProto::RecordingEvent *)(a1 + 41));
      char v250 = *((unsigned char *)a1 + 488);
      long long v249 = *(_OWORD *)(a1 + 59);
      v221 = i;
      do
      {
        *((_OWORD *)v221 + 31) = *(_OWORD *)(v221 + 31);
        v221[64] = v221[33];
        v222 = (void **)(v221 + 65);
        if (*((char *)v221 + 543) < 0) {
          operator delete(*v222);
        }
        *(_OWORD *)v222 = *((_OWORD *)v221 + 17);
        v221[67] = v221[36];
        *((unsigned char *)v221 + 295) = 0;
        *((unsigned char *)v221 + 272) = 0;
        *((_OWORD *)v221 + 34) = *(_OWORD *)(v221 + 37);
        *(_OWORD *)((char *)v221 + 556) = *(_OWORD *)((char *)v221 + 308);
        CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v221 + 72), (const CLMicroLocationProto::RecordingEvent *)(v221 + 41));
        *((unsigned char *)v221 + 736) = *((unsigned char *)v221 + 488);
        *((_OWORD *)v221 + 45) = *(_OWORD *)(v221 + 59);
        unint64_t v223 = bswap64(v243);
        unint64_t v224 = bswap64(*v221);
        if (v223 == v224 && (unint64_t v223 = bswap64(*((unint64_t *)&v243 + 1)), v224 = bswap64(v221[1]), v223 == v224))
        {
          int v225 = 0;
        }
        else if (v223 < v224)
        {
          int v225 = -1;
        }
        else
        {
          int v225 = 1;
        }
        v221 -= 31;
      }
      while (v225 < 0);
      long long v226 = v243;
      v221[64] = v244;
      *((_OWORD *)v221 + 31) = v226;
      v227 = (void **)(v221 + 65);
      if (*((char *)v221 + 543) < 0) {
        operator delete(*v227);
      }
      long long v228 = __p;
      v221[67] = v246;
      *(_OWORD *)v227 = v228;
      HIBYTE(v246) = 0;
      LOBYTE(__p) = 0;
      long long v229 = v247[0];
      *(_OWORD *)((char *)v221 + 556) = *(_OWORD *)((char *)v247 + 12);
      *((_OWORD *)v221 + 34) = v229;
      CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v221 + 72), (const CLMicroLocationProto::RecordingEvent *)v248);
      long long v230 = v249;
      *((unsigned char *)v221 + 736) = v250;
      *((_OWORD *)v221 + 45) = v230;
      CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v248);
      v218 = a2;
      if (SHIBYTE(v246) < 0) {
        operator delete((void *)__p);
      }
    }
    goto LABEL_298;
  }
  if (a1 != (unint64_t *)v8)
  {
    v104 = a1 + 31;
    if (a1 + 31 != a2)
    {
      uint64_t v105 = 0;
      v106 = (CLMicroLocationProto::RecordingEvent *)v248;
      v107 = a1;
      do
      {
        v108 = v104;
        unint64_t v109 = bswap64(v107[31]);
        unint64_t v110 = bswap64(*v107);
        if (v109 != v110 || (unint64_t v109 = bswap64(v108[1]), v110 = bswap64(v107[1]), v109 != v110))
        {
          int v111 = v109 < v110 ? -1 : 1;
          if (v111 < 0)
          {
            long long v112 = *(_OWORD *)v108;
            unint64_t v244 = v108[2];
            long long v243 = v112;
            long long __p = *((_OWORD *)v107 + 17);
            unint64_t v246 = v107[36];
            v107[34] = 0;
            v107[35] = 0;
            v107[36] = 0;
            v247[0] = *(_OWORD *)(v107 + 37);
            *(_OWORD *)((char *)v247 + 12) = *(_OWORD *)((char *)v107 + 308);
            v113 = v106;
            CLMicroLocationProto::RecordingEvent::RecordingEvent(v106, (const CLMicroLocationProto::RecordingEvent *)(v107 + 41));
            char v250 = *((unsigned char *)v107 + 488);
            long long v249 = *(_OWORD *)(v107 + 59);
            uint64_t v114 = v105;
            while (1)
            {
              v115 = (char *)a1 + v114;
              *(_OWORD *)(v115 + 248) = *(_OWORD *)((char *)a1 + v114);
              *((void *)v115 + 33) = *(unint64_t *)((char *)a1 + v114 + 16);
              v116 = (void **)((char *)a1 + v114 + 272);
              if (*((char *)a1 + v114 + 295) < 0) {
                operator delete(*v116);
              }
              *(_OWORD *)v116 = *(_OWORD *)(v115 + 24);
              *(unint64_t *)((char *)a1 + v114 + 288) = *((void *)v115 + 5);
              v115[47] = 0;
              v115[24] = 0;
              *(_OWORD *)(v115 + 296) = *((_OWORD *)v115 + 3);
              *(_OWORD *)(v115 + 308) = *(_OWORD *)(v115 + 60);
              CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v115 + 328), (const CLMicroLocationProto::RecordingEvent *)(v115 + 80));
              v117 = (char *)a1 + v114;
              *(_OWORD *)((char *)a1 + v114 + 472) = *(_OWORD *)((char *)a1 + v114 + 224);
              *((unsigned char *)a1 + v114 + 488) = *((unsigned char *)a1 + v114 + 240);
              if (!v114) {
                break;
              }
              unint64_t v118 = bswap64(v243);
              unint64_t v119 = bswap64(*((void *)v117 - 31));
              if (v118 == v119
                && (unint64_t v118 = bswap64(*((unint64_t *)&v243 + 1)),
                    unint64_t v119 = bswap64(*((void *)v117 - 30)),
                    v118 == v119))
              {
                int v120 = 0;
              }
              else if (v118 < v119)
              {
                int v120 = -1;
              }
              else
              {
                int v120 = 1;
              }
              v114 -= 248;
              if ((v120 & 0x80000000) == 0)
              {
                uint64_t v121 = (uint64_t)a1 + v114 + 248;
                goto LABEL_169;
              }
            }
            uint64_t v121 = (uint64_t)a1;
LABEL_169:
            long long v122 = v243;
            *(void *)(v121 + 16) = v244;
            *(_OWORD *)uint64_t v121 = v122;
            v123 = (void **)(v117 + 24);
            if (*(char *)(v121 + 47) < 0) {
              operator delete(*v123);
            }
            long long v124 = __p;
            *((void *)v117 + 5) = v246;
            *(_OWORD *)v123 = v124;
            HIBYTE(v246) = 0;
            LOBYTE(__p) = 0;
            long long v125 = v247[0];
            *(_OWORD *)(v117 + 60) = *(_OWORD *)((char *)v247 + 12);
            *((_OWORD *)v117 + 3) = v125;
            v106 = v113;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v117 + 80), v113);
            long long v126 = v249;
            v117[240] = v250;
            *((_OWORD *)v117 + 14) = v126;
            CLMicroLocationProto::RecordingEvent::~RecordingEvent(v113);
            if (SHIBYTE(v246) < 0) {
              operator delete((void *)__p);
            }
          }
        }
        v104 = v108 + 31;
        v105 += 248;
        v107 = v108;
      }
      while (v108 + 31 != a2);
    }
  }
}

@end