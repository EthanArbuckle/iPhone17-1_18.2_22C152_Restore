@interface PLDuplicateDetector
+ (BOOL)duplicateDetectorCompletedDateBackgroundMigrationAction:(id)a3;
+ (BOOL)duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:(id)a3 pathManager:(id)a4;
+ (id)duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:(id)a3;
+ (id)duplicateDetectorFilterProcessingStateWithPrefix:(id)a3 processingType:(unint64_t)a4;
+ (id)duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:(id)a3 processingType:(unint64_t)a4 pathManager:(id)a5;
+ (id)predicateFormatToPrependAssetAttributeSubstitutionWithPrefix:(id)a3;
+ (signed)currentSceneAnalysisUmbrellaVersion;
@end

@implementation PLDuplicateDetector

+ (signed)currentSceneAnalysisUmbrellaVersion
{
  return 100;
}

+ (BOOL)duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:(id)a3 pathManager:(id)a4
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = +[PLAdditionalAssetAttributes entityName];
  v11 = (void *)[v9 initWithEntityName:v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v13 = +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:@"asset" processingType:2 pathManager:v7];

  v33[0] = v13;
  v14 = +[PLManagedAsset predicateToExcludeAssetsMissingMasterThumbnailsWithThumbnailIndexKeyPath:@"asset.thumbnailIndex"];
  v33[1] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) = %d", @"asset", @"kind", 0);
  v33[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v17 = [v12 andPredicateWithSubpredicates:v16];
  [v11 setPredicate:v17];

  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sceneAnalysisVersion" ascending:1];
  v32 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v11 setSortDescriptors:v19];

  [v11 setFetchLimit:1];
  id v27 = 0;
  v20 = [v8 executeFetchRequest:v11 error:&v27];

  id v21 = v27;
  if (!v20)
  {
    v25 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = @"sceneAnalysisVersion";
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ min value. Error: %@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  if (![v20 count])
  {
LABEL_7:
    BOOL v24 = 0;
    goto LABEL_8;
  }
  v22 = [v20 objectAtIndexedSubscript:0];
  int v23 = [v22 sceneAnalysisVersion];

  BOOL v24 = v23 == [a1 currentSceneAnalysisUmbrellaVersion];
LABEL_8:

  return v24;
}

+ (BOOL)duplicateDetectorCompletedDateBackgroundMigrationAction:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x19F38C0C0]() & 1) != 0 || (PLIsInternalTool())
  {
    BOOL v4 = 1;
  }
  else if (PLIsAssetsd())
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v3 pathManager];
    BOOL v4 = +[PLBackgroundModelMigration hasCompletedBackgroundActionClass:v6 pathManager:v7];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)predicateFormatToPrependAssetAttributeSubstitutionWithPrefix:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"additionalAssetAttributes"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    [v3 stringByAppendingFormat:@".%@", @"additionalAttributes"];
  }
  else {
  uint64_t v6 = [v3 substringToIndex:v4 + v5];
  }

  return v6;
}

+ (id)duplicateDetectorFilterProcessingStateWithPrefix:(id)a3 processingType:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  switch(a4)
  {
    case 0uLL:
    case 4uLL:
    case 7uLL:
      id v9 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v15 = a4;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Requesting predicate for unsupported detector type: %tu", buf, 0xCu);
      }

      goto LABEL_5;
    case 1uLL:
LABEL_5:
      uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
      goto LABEL_6;
    case 2uLL:
      v12 = (void *)MEMORY[0x1E4F28F60];
      if (v6)
      {
        v13 = [a1 predicateFormatToPrependAssetAttributeSubstitutionWithPrefix:v6];
        id v8 = objc_msgSend(v12, "predicateWithFormat:", @"noindex:(%K.%K) == %ld", v13, @"duplicateDetectorPerceptualProcessingState", 0);
      }
      else
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) == %ld", @"additionalAttributes", @"duplicateDetectorPerceptualProcessingState", 0);
LABEL_6:
        id v8 = (void *)v10;
      }
LABEL_7:

      return v8;
    default:
      goto LABEL_7;
  }
}

+ (id)duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F59898];
  id v4 = a3;
  uint64_t v5 = [v3 fingerprintSchemeForStableHash];
  id v6 = [v5 zeroByteFileFingerprint];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", v4, v6];

  return v7;
}

+ (id)duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:(id)a3 processingType:(unint64_t)a4 pathManager:(id)a5
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:a5];
  uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  if (v9) {
    [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else {
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) = %d", v8, @"activeLibraryScopeParticipationState", 0);
  }
  v21[0] = v11;
  v12 = [a1 duplicateDetectorFilterProcessingStateWithPrefix:v8 processingType:a4];
  v21[1] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) = %d", v8, @"trashedState", 0);
  v21[2] = v13;
  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) = NO", v8, @"hidden");
  v21[3] = v14;
  unint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) != %d", v8, @"avalancheKind", 1);
  v21[4] = v15;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K.%K) != %d", v8, @"cloudLocalState", 4);
  v21[5] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForDuplicateProcessingExclusions"), 0, v8);
  v21[6] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  v19 = [v10 andPredicateWithSubpredicates:v18];

  return v19;
}

@end