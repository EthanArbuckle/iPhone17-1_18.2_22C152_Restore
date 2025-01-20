@interface ULHomeSlamAnalyticEventMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)convertToEntry;
@end

@implementation ULHomeSlamAnalyticEventMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULHomeSlamAnalyticEventMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULHomeSlamAnalyticEventMO alloc] initWithContext:v5];
  [(ULHomeSlamAnalyticEventMO *)v6 setEvent:*((__int16 *)a3 + 4)];
  [(ULHomeSlamAnalyticEventMO *)v6 setTimestamp:*(double *)a3];

  return v6;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)convertToEntry
{
  uint64_t v3 = v1;
  __int16 v4 = [(ULHomeSlamAnalyticEventMO *)self event];
  [(ULHomeSlamAnalyticEventMO *)self timestamp];
  uint64_t v6 = CLMiLoHomeSlamAnalyticEventTable::Entry::Entry((uint64_t)&v8, v4, v5);
  *(_OWORD *)uint64_t v3 = v8;
  *(unsigned char *)(v3 + 16) = 1;
  *((void *)&result.var0.var2 + 1) = v7;
  *(void *)&result.var0.var0 = v6;
  return result;
}

@end