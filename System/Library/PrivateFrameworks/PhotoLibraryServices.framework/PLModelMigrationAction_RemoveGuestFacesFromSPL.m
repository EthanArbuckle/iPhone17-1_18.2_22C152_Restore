@interface PLModelMigrationAction_RemoveGuestFacesFromSPL
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveGuestFacesFromSPL

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F8BA10];
  id v6 = a3;
  int64_t v7 = 1;
  v8 = objc_msgSend(v5, "predicateForIncludeMask:useIndex:keyPathPrefix:", objc_msgSend(v5, "maskForGuestAsset"), 1, @"assetForFace");
  v9 = +[PLDetectedFace entityName];
  id v13 = 0;
  BOOL v10 = +[PLModelMigrator executeBatchDeleteWithEntityName:v9 predicate:v8 managedObjectContext:v6 error:&v13];

  id v11 = v13;
  if (!v10)
  {
    if (a4) {
      *a4 = v11;
    }
    int64_t v7 = 3;
  }

  return v7;
}

@end