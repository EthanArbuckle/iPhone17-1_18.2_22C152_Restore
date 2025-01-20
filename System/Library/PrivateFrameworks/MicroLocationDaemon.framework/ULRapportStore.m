@interface ULRapportStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (vector<CLMicroLocationRapportTable::Entry,)_fetchRapportsByAndPredicates:(ULRapportStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationRapportTable::Entry,)fetchAllRecordsWithLimit:(ULRapportStore *)self;
- (vector<CLMicroLocationRapportTable::Entry,)fetchRapportEntriesAtLoiFromTime:(ULRapportStore *)self toTime:(SEL)a3 loiType:(double)a4 loiGroupId:(double)a5;
@end

@implementation ULRapportStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULRapportTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1EF0 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMicroLocationRapportTable,ULRapportMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRapportTable::Entry,)_fetchRapportsByAndPredicates:(ULRapportStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationRapportTable,ULRapportMO>(self, a4, a5, a6, (__n128 *)retstr);
  return result;
}

- (vector<CLMicroLocationRapportTable::Entry,)fetchAllRecordsWithLimit:(ULRapportStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationRapportTable,ULRapportMO>(self, a4, (__n128 *)retstr);
  return result;
}

- (vector<CLMicroLocationRapportTable::Entry,)fetchRapportEntriesAtLoiFromTime:(ULRapportStore *)self toTime:(SEL)a3 loiType:(double)a4 loiGroupId:(double)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  v12 = +[ULDefaultsSingleton shared];
  v13 = [v12 defaultsDictionary];

  v14 = [NSString stringWithUTF8String:"ULDatabaseSelectionLimit"];
  v15 = [v13 objectForKey:v14];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v16 = [v15 unsignedIntValue];
  }
  else {
    unsigned int v16 = [&unk_2704F1F08 unsignedIntValue];
  }
  unsigned int v17 = v16;

  v18 = [MEMORY[0x263EFF980] array];
  if (*((unsigned char *)a6 + 24))
  {
    v19 = (void *)MEMORY[0x263F08A98];
    if (*((char *)a6 + 23) >= 0) {
      v20 = a6;
    }
    else {
      v20 = *(const void **)a6;
    }
    v21 = [NSString stringWithUTF8String:v20];
    v22 = [v19 predicateWithFormat:@"%K=%@", @"loiType", v21];
    [v18 addObject:v22];
  }
  if (*((unsigned char *)a7 + 16))
  {
    id v23 = (id)[(ULStore *)self db][56];
    v24 = v23;
    if (!*((unsigned char *)a7 + 16)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v25 = [v23 getLoiIdsInLoiGroupId:a7];

    v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"loiId", v25];
    [v18 addObject:v26];
  }
  v27 = (void *)MEMORY[0x263F08A98];
  v28 = [NSNumber numberWithDouble:a4];
  v29 = [NSNumber numberWithDouble:a5];
  v30 = [v27 predicateWithFormat:@"%K > %@ && %K <= %@", @"generationTimestamp", v28, @"generationTimestamp", v29];
  [v18 addObject:v30];

  v31 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"generationTimestamp" ascending:0];
  v34[0] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [(ULRapportStore *)self _fetchRapportsByAndPredicates:v18 sortDescriptors:v32 andLimit:v17];

  return result;
}

@end