@interface PLModelMigrationAction_WriteLibraryScopeIsActiveDefaults
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_WriteLibraryScopeIsActiveDefaults

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

@end