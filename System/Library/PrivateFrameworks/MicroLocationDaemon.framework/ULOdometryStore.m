@interface ULOdometryStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (vector<CLMiLoOdometryTable::Entry,)_fetchOdometryByAndPredicates:(ULOdometryStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMiLoOdometryTable::Entry,)fetchAllRecordsWithLimit:(ULOdometryStore *)self;
- (vector<CLMiLoOdometryTable::Entry,)fetchOdometryASCFromTime:(ULOdometryStore *)self toTime:(SEL)a3;
@end

@implementation ULOdometryStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULOdometryTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F22C8 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMiLoOdometryTable,ULOdometryMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoOdometryTable::Entry,)_fetchOdometryByAndPredicates:(ULOdometryStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMiLoOdometryTable,ULOdometryMO>(self, a4, a5, a6, (uint64_t)retstr);
  return result;
}

- (vector<CLMiLoOdometryTable::Entry,)fetchAllRecordsWithLimit:(ULOdometryStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMiLoOdometryTable,ULOdometryMO>(self, a4, (uint64_t)retstr);
  return result;
}

- (vector<CLMiLoOdometryTable::Entry,)fetchOdometryASCFromTime:(ULOdometryStore *)self toTime:(SEL)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = (void *)MEMORY[0x263F08A98];
  v10 = [NSNumber numberWithDouble:a4];
  v11 = [NSNumber numberWithDouble:a5];
  v12 = [v9 predicateWithFormat:@"%K > %@ && %K <= %@", @"timestamp", v10, @"timestamp", v11];
  [v8 addObject:v12];

  v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:1];
  v16[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(ULOdometryStore *)self _fetchOdometryByAndPredicates:v8 sortDescriptors:v14 andLimit:+[ULOdometryStore maxEntriesInTable]];

  return result;
}

@end