@interface PLModelMigrationAction_ClearInterruptedMaintenanceTaskLibraries
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ClearInterruptedMaintenanceTaskLibraries

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F8B980];
  v6 = [(PLModelMigrationActionCore *)self pathManager];
  v7 = [v6 libraryURL];
  LODWORD(v5) = [v5 isSystemPhotoLibraryURL:v7];

  if (v5)
  {
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 removeObjectForKey:@"PLIncompleteMaintenanceTaskPaths.periodicmaintenance"];
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  return 1;
}

@end