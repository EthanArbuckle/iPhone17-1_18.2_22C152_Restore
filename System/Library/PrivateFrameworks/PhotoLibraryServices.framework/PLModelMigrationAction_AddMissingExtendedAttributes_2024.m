@interface PLModelMigrationAction_AddMissingExtendedAttributes_2024
+ (int64_t)actionProgressWeight;
- (id)requestWithManagedObjectContext:(id)a3;
- (id)startDate;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (void)updateSleetPropertiesForAsset:(id)a3 metadata:(id)a4;
- (void)updateSpatialPropertiesForAsset:(id)a3 metadata:(id)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributes_2024

- (id)startDate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:1];
  [v2 setMonth:1];
  [v2 setYear:2024];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v5 = [v4 dateFromComponents:v2];

  return v5;
}

- (id)requestWithManagedObjectContext:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v6 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v4, v5);

  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = [(PLModelMigrationAction_AddMissingExtendedAttributes_2024 *)self startDate];
  v13 = [v11 predicateWithFormat:@"%K >= %@", @"dateCreated", v12];
  v23[0] = v13;
  if (v6) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v6];
  }
  else {
  v14 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v23[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v16 = [v10 andPredicateWithSubpredicates:v15];
  [v9 setPredicate:v16];

  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v22 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v9 setSortDescriptors:v18];

  v21[0] = @"master.mediaMetadata";
  v21[1] = @"additionalAttributes.mediaMetadata";
  v21[2] = @"modernResources";
  v21[3] = @"extendedAttributes";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v9 setRelationshipKeyPathsForPrefetching:v19];

  return v9;
}

- (void)updateSpatialPropertiesForAsset:(id)a3 metadata:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (![v8 kind])
  {
    if ([v8 hasAdjustments])
    {
      id v6 = [v8 fullSizeResourceMetadataFromMediaPropertiesOrFullSizeResourceOrOptionalURL:0];
    }
    else
    {
      id v6 = v5;
    }
    id v7 = v6;
    if ([v8 hasAdjustments] && !v7) {
      id v7 = v5;
    }
    [v8 setSpatialTypeFromMetadata:v7];
  }
}

- (void)updateSleetPropertiesForAsset:(id)a3 metadata:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  if (![v15 currentSleetCast])
  {
    if ([v15 hasAdjustments]) {
      [v15 updateAssetPropertiesFromAdjustmentFile];
    }
    else {
      [v15 setCurrentSleetCastFromMetadata:v5];
    }
  }
  if (![v15 kind])
  {
    id v6 = [v15 additionalAttributes];
    int v7 = [v6 sleetIsReversible];

    if (v7 != 1)
    {
      id v8 = [v15 extendedAttributes];
      v9 = [v8 sleetCast];
      uint64_t v10 = [v9 integerValue];

      if (v10 >= 1)
      {
        v11 = [v5 smartStyleIsReversible];

        if (!v11)
        {
          v12 = [v15 primaryStoreOriginalResource];
          v13 = [v12 uniformTypeIdentifier];
          if ([v13 conformsToHEIF])
          {
            v14 = [v15 additionalAttributes];
            [v14 setSleetIsReversible:1];
          }
        }
      }
    }
  }
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(PLModelMigrationAction_AddMissingExtendedAttributes_2024 *)self requestWithManagedObjectContext:v6];
  v14[4] = self;
  id v15 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__PLModelMigrationAction_AddMissingExtendedAttributes_2024_performActionWithManagedObjectContext_error___block_invoke;
  v14[3] = &unk_1E586A1C0;
  int64_t v8 = +[PLModelMigrationActionUtility processManagedObjectWithAction:self managedObjectContext:v6 fetchRequest:v7 useObjectIDResumeMarker:1 error:&v15 processingBlock:v14];

  id v9 = v15;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  id v10 = v9;
  v11 = v10;
  if (v8 != 1 && a4 != 0) {
    *a4 = v10;
  }

  return v8;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end