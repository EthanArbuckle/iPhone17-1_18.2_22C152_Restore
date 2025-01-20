@interface PLModelMigrationAction_ResetLastCompletePrefetchDate
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetLastCompletePrefetchDate

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v7 = [[PLGlobalValues alloc] initWithManagedObjectContext:v5];

  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  [(PLGlobalValues *)v7 setLastCompletePrefetchDate:v8];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return 1;
}

@end