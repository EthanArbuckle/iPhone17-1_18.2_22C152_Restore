@interface ULLoggedEventStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventBeforeTime:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr;
- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventForTypes:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr BeforeTime:;
- (vector<CLMicroLocationLoggedEventsTable::Entry,)_fetchLoggedEventsByAndPredicates:(ULLoggedEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchAllRecordsWithLimit:(ULLoggedEventStore *)self;
- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchLoggedEventsForTypes:(ULLoggedEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 limit:(optional<const double>)a5;
@end

@implementation ULLoggedEventStore

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, (uint64_t)a3);
}

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULLoggedEventsTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1D40 unsignedIntValue];
  }
  unsigned int v7 = v6;

  return v7;
}

+ (id)defaultSortProperty
{
  return @"receivedTimestamp";
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)_fetchLoggedEventsByAndPredicates:(ULLoggedEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchAllRecordsWithLimit:(ULLoggedEventStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchLoggedEventsForTypes:(ULLoggedEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 limit:(optional<const double>)a5
{
  unint64_t v7 = a7;
  BOOL var1 = a6.var1;
  double v9 = a6.var0.var1;
  BOOL v10 = a5.var1;
  double v11 = a5.var0.var1;
  v32[1] = *MEMORY[0x263EF8340];
  if (!a7)
  {
    v13 = +[ULDefaultsSingleton shared];
    v14 = [v13 defaultsDictionary];

    v15 = [NSString stringWithUTF8String:"ULDatabaseSelectionLimit"];
    v16 = [v14 objectForKey:v15];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned int v17 = [v16 unsignedIntValue];
    }
    else {
      unsigned int v17 = [&unk_2704F1D28 unsignedIntValue];
    }
    unsigned int v18 = v17;

    unint64_t v7 = v18;
  }
  v19 = [MEMORY[0x263EFF980] array];
  if (v10)
  {
    v20 = (void *)MEMORY[0x263F08A98];
    v21 = [NSNumber numberWithDouble:v11];
    v22 = [v20 predicateWithFormat:@"%K > %@", @"receivedTimestamp", v21];
    [v19 addObject:v22];
  }
  if (var1)
  {
    v23 = (void *)MEMORY[0x263F08A98];
    v24 = [NSNumber numberWithDouble:v9];
    v25 = [v23 predicateWithFormat:@"%K <= %@", @"receivedTimestamp", v24];
    [v19 addObject:v25];
  }
  if (*(void *)a4 != *((void *)a4 + 1))
  {
    v26 = ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
    v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"eventType", v26];
    [v19 addObject:v27];
  }
  v28 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"receivedTimestamp" ascending:0];
  v32[0] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  [(ULLoggedEventStore *)self _fetchLoggedEventsByAndPredicates:v19 sortDescriptors:v29 andLimit:v7];

  return result;
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventBeforeTime:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr
{
  __p = 0;
  double v9 = 0;
  uint64_t v10 = 0;
  -[ULLoggedEventStore fetchLoggedEventsForTypes:fromTime:toTime:limit:](self, "fetchLoggedEventsForTypes:fromTime:toTime:limit:", &__p, 0, 0, v2, 1, 1);
  if (__p)
  {
    double v9 = __p;
    operator delete(__p);
  }
  uint64_t v4 = v11[0];
  if (v11[0] == v11[1])
  {
    char v6 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    long long v5 = *(_OWORD *)v11[0];
    *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)(v11[0] + 12);
    *(_OWORD *)&retstr->var0.var0 = v5;
    CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)(v4 + 32));
    char v6 = 1;
  }
  LOBYTE(retstr[1].var0.var3.var4) = v6;
  __p = v11;
  std::vector<CLMicroLocationLoggedEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return result;
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventForTypes:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr BeforeTime:
{
  -[ULLoggedEventStore fetchLoggedEventsForTypes:fromTime:toTime:limit:](self, "fetchLoggedEventsForTypes:fromTime:toTime:limit:");
  uint64_t v3 = v7[0];
  if (v7[0] == v7[1])
  {
    char v5 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    long long v4 = *(_OWORD *)v7[0];
    *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)(v7[0] + 12);
    *(_OWORD *)&retstr->var0.var0 = v4;
    CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)(v3 + 32));
    char v5 = 1;
  }
  LOBYTE(retstr[1].var0.var3.var4) = v5;
  v8 = (void **)v7;
  std::vector<CLMicroLocationLoggedEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v8);
  return result;
}

@end