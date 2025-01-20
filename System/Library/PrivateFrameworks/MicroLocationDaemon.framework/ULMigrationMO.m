@interface ULMigrationMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationMigrationTable::Entry>)convertToEntry;
@end

@implementation ULMigrationMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULMigrationMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULMigrationMO alloc] initWithContext:v5];
  [(ULMigrationMO *)v6 setTimestamp:*(double *)a3];
  [(ULMigrationMO *)v6 setState:*((unsigned int *)a3 + 2)];

  return v6;
}

- (optional<CLMicroLocationMigrationTable::Entry>)convertToEntry
{
  uint64_t v3 = v1;
  [(ULMigrationMO *)self timestamp];
  uint64_t v8 = v4;
  uint64_t v5 = CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v7, [(ULMigrationMO *)self state], &v8);
  *(_OWORD *)uint64_t v3 = v7;
  *(unsigned char *)(v3 + 16) = 1;
  *((void *)&result.var0.var2 + 1) = v6;
  *(void *)&result.var0.var0 = v5;
  return result;
}

@end