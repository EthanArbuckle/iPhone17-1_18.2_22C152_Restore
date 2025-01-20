@interface PLModelMigrationAction_FixupTombstonedPeople
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixupTombstonedPeople

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v8 = (void *)MEMORY[0x1E4F1C038];
  v9 = +[PLPerson entityName];
  v10 = [v8 batchUpdateRequestWithEntityName:v9];

  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"verifiedType", 4294967294);
  [v10 setPredicate:v11];

  v24[0] = @"contactMatchingDictionary";
  v12 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v24[1] = @"personUri";
  v25[0] = v12;
  v13 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v25[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v10 setPropertiesToUpdate:v14];

  [v10 setResultType:2];
  id v21 = 0;
  v15 = [v6 executeRequest:v10 error:&v21];

  id v16 = v21;
  if (v15)
  {
    int64_t v17 = 1;
    [v7 setCompletedUnitCount:1];
    v18 = PLMigrationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v15 result];
      *(_DWORD *)buf = 138412290;
      id v23 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Removed contactMatchingDictionary and personUri from %@ persons with PLPersonVerifiedTypeTombstone", buf, 0xCu);

      int64_t v17 = 1;
    }
  }
  else
  {
    v18 = PLMigrationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v16;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to remove contactMatchingDictionary and personUri from persons with PLPersonVerifiedTypeTombstone, error: %@", buf, 0xCu);
    }
    int64_t v17 = 3;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v16;
  }

  return v17;
}

@end