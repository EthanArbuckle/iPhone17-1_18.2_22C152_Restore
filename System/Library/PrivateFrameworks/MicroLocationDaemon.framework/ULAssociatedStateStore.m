@interface ULAssociatedStateStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (vector<CLMicroLocationAssociatedStateTable::Entry,)_fetchAssociatedStatesByAndPredicates:(ULAssociatedStateStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllAssociatedStateBetweenTimes:(ULAssociatedStateStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4;
- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllRecordsWithLimit:(ULAssociatedStateStore *)self;
- (vector<boost::uuids::uuid,)getAllDistinctAssociatedStateLoiIds;
@end

@implementation ULAssociatedStateStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULAssociatedStateTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F2370 unsignedIntValue];
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
  return @"timestamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)_fetchAssociatedStatesByAndPredicates:(ULAssociatedStateStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, a4, a5, a6, (std::string *)retstr);
  return result;
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllRecordsWithLimit:(ULAssociatedStateStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, a4, (std::string *)retstr);
  return result;
}

- (vector<boost::uuids::uuid,)getAllDistinctAssociatedStateLoiIds
{
  unsigned int v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  unsigned int v6 = (objc_class *)objc_opt_class();
  unsigned int v7 = NSStringFromClass(v6);
  id v9 = [(ULStore *)self fetchPropertyForEntityName:v7 propertyToFetch:@"loiId" distinctResults:1 byAndPredicates:0 sortDescriptors:0 andLimit:v5];

  ULDBUtils::boostUUIDsFromNSStringArray(v9, retstr);

  return result;
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllAssociatedStateBetweenTimes:(ULAssociatedStateStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  unsigned int v10 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  v11 = [MEMORY[0x263EFF980] array];
  v12 = (void *)MEMORY[0x263F08A98];
  v13 = [NSNumber numberWithDouble:a4];
  v14 = [NSNumber numberWithDouble:a5];
  v15 = [v12 predicateWithFormat:@"%K > %@ && %K <= %@", @"timestamp", v13, @"timestamp", v14];
  [v11 addObject:v15];

  v16 = objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a6);
  v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v16];
  [v11 addObject:v17];

  v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v21[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [(ULAssociatedStateStore *)self _fetchAssociatedStatesByAndPredicates:v11 sortDescriptors:v19 andLimit:v10];

  return result;
}

@end