@interface PLModelMigrationAction_MoveVersionsToMediaAnalysisAttributes
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (void)moveVersionsToMediaAnalysisAttributes:(id)a3;
- (void)processAsset:(id)a3 withContext:(id)a4;
@end

@implementation PLModelMigrationAction_MoveVersionsToMediaAnalysisAttributes

- (void)moveVersionsToMediaAnalysisAttributes:(id)a3
{
  id v8 = a3;
  v3 = [v8 characterRecognitionAttributes];
  if (v3)
  {
    v4 = +[PLCharacterRecognitionAttributes algorithmVersionKey];
    objc_msgSend(v8, "setCharacterRecognitionVersion:", objc_msgSend(v3, "pl_int16ValueForKey:", v4));
  }
  else
  {
    [v8 setCharacterRecognitionVersion:0];
  }
  v5 = [v8 visualSearchAttributes];
  if (v5)
  {
    v6 = +[PLVisualSearchAttributes algorithmVersionKey];
    objc_msgSend(v8, "setVisualSearchVersion:", objc_msgSend(v5, "pl_int16ValueForKey:", v6));

    v7 = +[PLVisualSearchAttributes stickerConfidenceAlgorithmVersionKey];
    objc_msgSend(v8, "setVisualSearchStickerConfidenceVersion:", objc_msgSend(v5, "pl_int16ValueForKey:", v7));
  }
  else
  {
    [v8 setVisualSearchVersion:0];
    [v8 setVisualSearchStickerConfidenceVersion:0];
  }
}

- (void)processAsset:(id)a3 withContext:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 mediaAnalysisAttributes];
  if (v7)
  {
    id v8 = (void *)v7;
    [(PLModelMigrationAction_MoveVersionsToMediaAnalysisAttributes *)self moveVersionsToMediaAnalysisAttributes:v7];
  }
  else
  {
    id v8 = +[PLManagedObject insertInManagedObjectContext:v10];
    [v6 setMediaAnalysisAttributes:v8];
  }
  v9 = [v6 dateCreated];

  [v8 setAssetDateCreated:v9];
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v20[0] = @"mediaAnalysisAttributes";
  v20[1] = @"mediaAnalysisAttributes.characterRecognitionAttributes";
  v20[2] = @"mediaAnalysisAttributes.visualSearchAttributes";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v9 setRelationshipKeyPathsForPrefetching:v10];

  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__PLModelMigrationAction_MoveVersionsToMediaAnalysisAttributes_performActionWithManagedObjectContext_error___block_invoke;
  v17[3] = &unk_1E586A238;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  int64_t v12 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:self managedObjectContext:v11 fetchRequest:v9 pendingParentUnitCount:0 error:&v19 processingBlock:v17];
  id v13 = v19;
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v14 = v13;
  v15 = v14;
  if (v12 != 1 && a4) {
    *a4 = v14;
  }

  return v12;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end