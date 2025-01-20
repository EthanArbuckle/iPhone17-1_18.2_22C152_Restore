@interface ULMigrationStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (vector<CLMicroLocationMigrationTable::Entry,)_fetchMigrationsByAndPredicates:(ULMigrationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationMigrationTable::Entry,)fetchAllRecordsWithLimit:(ULMigrationStore *)self;
- (vector<CLMicroLocationMigrationTable::Entry,)fetchMigrationEntriesWithStates:(ULMigrationStore *)self limit:(SEL)a3;
@end

@implementation ULMigrationStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULMigrationTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F14D0 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMicroLocationMigrationTable,ULMigrationMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationMigrationTable::Entry,)_fetchMigrationsByAndPredicates:(ULMigrationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationMigrationTable,ULMigrationMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationMigrationTable::Entry,)fetchAllRecordsWithLimit:(ULMigrationStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationMigrationTable,ULMigrationMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationMigrationTable::Entry,)fetchMigrationEntriesWithStates:(ULMigrationStore *)self limit:(SEL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263EFF980] array];
  v10 = *(unsigned int **)a4;
  v11 = (unsigned int *)*((void *)a4 + 1);
  if (*(unsigned int **)a4 != v11)
  {
    do
    {
      v12 = [NSNumber numberWithInt:*v10];
      [v9 addObject:v12];

      ++v10;
    }
    while (v10 != v11);
  }
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"state", v9];
  [v8 addObject:v13];

  v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(ULMigrationStore *)self _fetchMigrationsByAndPredicates:v8 sortDescriptors:v15 andLimit:a5];

  return result;
}

@end