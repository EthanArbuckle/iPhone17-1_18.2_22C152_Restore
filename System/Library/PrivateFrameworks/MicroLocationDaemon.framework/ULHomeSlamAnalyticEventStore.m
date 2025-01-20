@interface ULHomeSlamAnalyticEventStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchFirstEvent;
- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchLatestAnalyticEventType:(ULHomeSlamAnalyticEventStore *)self beforeTime:;
- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)_fetchAnalyticEventsByAndPredicates:(ULHomeSlamAnalyticEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAllRecordsWithLimit:(ULHomeSlamAnalyticEventStore *)self;
- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAnalyticEventsASCFromTime:(ULHomeSlamAnalyticEventStore *)self toTime:(SEL)a3;
@end

@implementation ULHomeSlamAnalyticEventStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULAnalyticEventsTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1B48 unsignedIntValue];
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
  return ULDBUtils::insertEntries<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)_fetchAnalyticEventsByAndPredicates:(ULHomeSlamAnalyticEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAllRecordsWithLimit:(ULHomeSlamAnalyticEventStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, a4, retstr);
  return result;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAnalyticEventsASCFromTime:(ULHomeSlamAnalyticEventStore *)self toTime:(SEL)a3
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
  [(ULHomeSlamAnalyticEventStore *)self _fetchAnalyticEventsByAndPredicates:v8 sortDescriptors:v14 andLimit:+[ULHomeSlamAnalyticEventStore maxEntriesInTable]];

  return result;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchLatestAnalyticEventType:(ULHomeSlamAnalyticEventStore *)self beforeTime:
{
  double v4 = v3;
  v5 = v1;
  uint64_t v7 = v2;
  v23[1] = *MEMORY[0x263EF8340];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263EFF980] array];
  v10 = *v5;
  v11 = v5[1];
  if (*v5 != v11)
  {
    do
    {
      v12 = [NSNumber numberWithShort:*v10];
      [v9 addObject:v12];

      ++v10;
    }
    while (v10 != v11);
  }
  v13 = (void *)MEMORY[0x263F08A98];
  v14 = [NSNumber numberWithDouble:v4];
  v15 = [v13 predicateWithFormat:@"%K <= %@", @"timestamp", v14];
  [v8 addObject:v15];

  v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"event", v9];
  [v8 addObject:v16];

  v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v23[0] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [(ULHomeSlamAnalyticEventStore *)self _fetchAnalyticEventsByAndPredicates:v8 sortDescriptors:v18 andLimit:1];

  if (v21 != v22)
  {
    *(_OWORD *)uint64_t v7 = *v21;
    *(unsigned char *)(v7 + 16) = 1;
LABEL_6:
    operator delete(v21);
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 16) = 0;
  if (v21) {
    goto LABEL_6;
  }
LABEL_7:

  *((void *)&result.var0.var2 + 1) = v20;
  *(void *)&result.var0.var0 = v19;
  return result;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchFirstEvent
{
  uint64_t v3 = v1;
  v12[1] = *MEMORY[0x263EF8340];
  double v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:1];
  v12[0] = v5;
  unsigned int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(ULHomeSlamAnalyticEventStore *)self _fetchAnalyticEventsByAndPredicates:v4 sortDescriptors:v6 andLimit:1];

  uint64_t v7 = v10;
  if (v10 != v11)
  {
    *(_OWORD *)uint64_t v3 = *v10;
    *(unsigned char *)(v3 + 16) = 1;
LABEL_4:
    v11 = v7;
    operator delete(v7);
    goto LABEL_5;
  }
  *(unsigned char *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 16) = 0;
  if (v7) {
    goto LABEL_4;
  }
LABEL_5:

  *((void *)&result.var0.var2 + 1) = v9;
  *(void *)&result.var0.var0 = v8;
  return result;
}

@end