@interface PLModelMigrationAction_ResetDuplicateProcessingValue
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetDuplicateProcessingValue

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[PLGlobalValues alloc] initWithManagedObjectContext:v5];
  v7 = [(PLModelMigrationActionCore *)self pathManager];
  BOOL v8 = +[PLDuplicateDetector duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:v5 pathManager:v7];

  if (!v8) {
    [(PLGlobalValues *)v6 setLastInitialDuplicateDetectorProcessingCompletedToken:0];
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return 1;
}

@end