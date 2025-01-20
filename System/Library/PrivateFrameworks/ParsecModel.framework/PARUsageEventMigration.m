@interface PARUsageEventMigration
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (PARUsageEventMigration)init;
@end

@implementation PARUsageEventMigration

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_223B5DDD0(v9, v10, v11);

  return 1;
}

- (PARUsageEventMigration)init
{
  return (PARUsageEventMigration *)PARUsageEventMigration.init()();
}

@end