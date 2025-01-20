@interface PLModelMigrationAction_PopulateExtendedAttributes
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PopulateExtendedAttributes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  v8 = +[PLManagedAsset entityName];
  v9 = [v6 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes");
  [v9 setPredicate:v10];

  id v14 = 0;
  int64_t v11 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:self managedObjectContext:v7 fetchRequest:v9 useObjectIDResumeMarker:0 error:&v14];

  id v12 = v14;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end