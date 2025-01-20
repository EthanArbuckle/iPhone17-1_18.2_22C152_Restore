@interface PLSceneClassification
+ (BOOL)isUtilityAssetForSharedLibrary:(id)a3;
+ (id)PLJunkSceneClassificationIDForLabel:(id)a3;
+ (id)entityName;
+ (id)fetchSceneClassificationsForAdditionalAttributes:(id)a3 managedObjectContext:(id)a4;
+ (id)insertIntoPhotoLibrary:(id)a3 asset:(id)a4 sceneIdentifier:(unint64_t)a5 confidence:(double)a6 packedBoundingBoxRect:(int64_t)a7 startTime:(double)a8 duration:(double)a9 classificationType:(int64_t)a10;
+ (unint64_t)_pool_countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
+ (unint64_t)countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 completion:(id)a6;
+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 sceneClassificationTypePredicate:(id)a6 completion:(id)a7;
- (BOOL)_validateInterpropertyValues:(id *)a3;
- (BOOL)isDocumentClassification;
- (BOOL)isScreenshotClassification;
- (BOOL)validateForInsert:(id *)a3;
- (id)debugLogDescription;
- (void)_checkForOrphanedSceneClassification;
- (void)willSave;
@end

@implementation PLSceneClassification

+ (id)entityName
{
  return @"SceneClassification";
}

- (void)_checkForOrphanedSceneClassification
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSceneClassification *)self assetAttributes];
  if (v3)
  {
  }
  else
  {
    v4 = [(PLSceneClassification *)self assetAttributesForTemporalSceneClassifications];

    if (!v4)
    {
      v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v6 = [(NSManagedObject *)self pl_shortDescription];
        int v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_FAULT, "Detected orphaned scene classification: %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (BOOL)isScreenshotClassification
{
  unint64_t v3 = [(PLSceneClassification *)self sceneIdentifier];
  v4 = +[PLSceneClassification PLJunkSceneClassificationIDForLabel:@"screenshot"];
  if (v3 == [v4 unsignedIntegerValue])
  {
    [(PLSceneClassification *)self confidence];
    BOOL v6 = v5 >= 0.58;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isDocumentClassification
{
  unint64_t v3 = [(PLSceneClassification *)self sceneIdentifier];
  v4 = +[PLSceneClassification PLJunkSceneClassificationIDForLabel:@"hier_text_document"];
  if (v3 == [v4 unsignedIntegerValue])
  {
    [(PLSceneClassification *)self confidence];
    BOOL v6 = v5 >= 0.59;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)willSave
{
  v10.receiver = self;
  v10.super_class = (Class)PLSceneClassification;
  [(PLManagedObject *)&v10 willSave];
  unint64_t v3 = [(PLSceneClassification *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PLSceneClassification *)self changedValues];
    if ([(PLSceneClassification *)self isDeleted])
    {
LABEL_12:

      goto LABEL_13;
    }
    double v5 = [v4 objectForKeyedSubscript:@"sceneIdentifier"];
    if (v5)
    {
    }
    else
    {
      BOOL v6 = [v4 objectForKeyedSubscript:@"confidence"];

      if (!v6) {
        goto LABEL_11;
      }
    }
    if ([(PLSceneClassification *)self isDocumentClassification])
    {
      int v7 = [(PLSceneClassification *)self assetAttributes];
      v8 = v7;
      uint64_t v9 = 16;
LABEL_10:
      [v7 addDuplicateDetectorPerceptualProcessingStates:v9 removeProcessingStates:0];

      goto LABEL_11;
    }
    if ([(PLSceneClassification *)self isScreenshotClassification])
    {
      int v7 = [(PLSceneClassification *)self assetAttributes];
      v8 = v7;
      uint64_t v9 = 64;
      goto LABEL_10;
    }
LABEL_11:
    [(PLSceneClassification *)self _checkForOrphanedSceneClassification];
    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLSceneClassification;
  BOOL v5 = -[PLSceneClassification validateForInsert:](&v7, sel_validateForInsert_);
  if (v5) {
    LOBYTE(v5) = [(PLSceneClassification *)self _validateInterpropertyValues:a3];
  }
  return v5;
}

- (BOOL)_validateInterpropertyValues:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributes"];
  if (![v5 count]) {
    goto LABEL_4;
  }
  BOOL v6 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributesForTemporalSceneClassifications"];
  if ([v6 count] || (-[PLSceneClassification duration](self, "duration"), v26 != 0.0))
  {

LABEL_4:
    goto LABEL_5;
  }
  [(PLSceneClassification *)self startTime];
  double v28 = v27;

  if (v28 == 0.0) {
    return 1;
  }
LABEL_5:
  objc_super v7 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributes"];
  if ([v7 count])
  {
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v9 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributesForTemporalSceneClassifications"];
  if (![v9 count])
  {

    goto LABEL_6;
  }
  [(PLSceneClassification *)self duration];
  double v11 = v10;

  if (v11 > 0.0) {
    return 1;
  }
LABEL_7:
  v8 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributes"];
  if (![v8 count])
  {
    v12 = [(PLSceneClassification *)self objectIDsForRelationshipNamed:@"assetAttributesForTemporalSceneClassifications"];
    uint64_t v13 = [v12 count];

    if (v13) {
      goto LABEL_13;
    }
    [(PLSceneClassification *)self startTime];
    if (v29 < 0.0 || ([(PLSceneClassification *)self duration], v30 <= 0.0))
    {
      [(PLSceneClassification *)self startTime];
      if (v31 != 0.0) {
        goto LABEL_13;
      }
      [(PLSceneClassification *)self duration];
      if (v32 != 0.0) {
        goto LABEL_13;
      }
    }
    return 1;
  }

LABEL_13:
  v14 = NSString;
  v15 = [(PLSceneClassification *)self assetAttributes];
  v16 = [(PLSceneClassification *)self assetAttributesForTemporalSceneClassifications];
  [(PLSceneClassification *)self startTime];
  uint64_t v18 = v17;
  [(PLSceneClassification *)self duration];
  v20 = objc_msgSend(v14, "stringWithFormat:", @"There was a validation issue when attempting to insert PLSceneClassification (assetAttributes: %p, assetAttributesForTemporalSceneClassifications: %p, startTime: %g, duration: %g, classificationType: %d"), v15, v16, v18, v19, (int)-[PLSceneClassification classificationType](self, "classificationType");

  v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  if (a3)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F8C500];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    v34 = v20;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    *a3 = [v22 errorWithDomain:v23 code:46502 userInfo:v24];
  }
  return 0;
}

- (id)debugLogDescription
{
  [(PLSceneClassification *)self packedBoundingBoxRect];
  PLSplitToCGRectFromInt64();
  unint64_t v3 = NSString;
  int v4 = [(PLSceneClassification *)self classificationType];
  unint64_t v5 = [(PLSceneClassification *)self sceneIdentifier];
  [(PLSceneClassification *)self confidence];
  uint64_t v7 = v6;
  v12.origin = 0u;
  v12.size = 0u;
  v8 = NSStringFromRect(v12);
  uint64_t v9 = [v3 stringWithFormat:@"PLSceneClassification: sceneClassificationType: %d, sceneID: %lld, confidence: %f, boundingBox: %@", v4, v5, v7, v8];

  return v9;
}

+ (BOOL)isUtilityAssetForSharedLibrary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 isVideo] & 1) != 0
    || ([v3 additionalAttributes],
        int v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 sceneAnalysisVersion],
        v4,
        v5 < 0x56))
  {
    BOOL v20 = 0;
    goto LABEL_48;
  }
  uint64_t v6 = [v3 additionalAttributes];
  uint64_t v7 = [v6 sceneClassifications];

  double v26 = [v3 uuid];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (!v9)
  {

    char v19 = 0;
    char v11 = 0;
    goto LABEL_40;
  }
  uint64_t v10 = v9;
  id v25 = v3;
  uint64_t v27 = 0;
  char v11 = 0;
  uint64_t v12 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v15 = [v14 sceneIdentifier];
      [v14 confidence];
      double v17 = v16;
      if (v15 <= 2147483643)
      {
        if (v15 == 2147483629)
        {
          if (v16 < 0.59)
          {
            LOBYTE(v27) = 0;
            continue;
          }
          uint64_t v18 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v33 = v26;
            __int16 v34 = 2048;
            double v35 = v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - text document scene: %.3f", buf, 0x16u);
          }
          LOBYTE(v27) = 1;
        }
        else
        {
          if (v15 != 2147483631) {
            continue;
          }
          if (v16 < 0.37)
          {
            char v11 = 0;
            continue;
          }
          uint64_t v18 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v33 = v26;
            __int16 v34 = 2048;
            double v35 = v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - tragic failure scene: %.3f", buf, 0x16u);
          }
          char v11 = 1;
        }
LABEL_30:

        continue;
      }
      if (v15 == 2147483646)
      {
        if (v16 < 0.54)
        {
          BYTE4(v27) = 0;
          continue;
        }
        uint64_t v18 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v26;
          __int16 v34 = 2048;
          double v35 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - poor quality scene: %.3f", buf, 0x16u);
        }
        BYTE4(v27) = 1;
        goto LABEL_30;
      }
      if (v15 == 2147483644 && v16 >= 0.31)
      {
        v21 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v26;
          __int16 v34 = 2048;
          double v35 = v17;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Asset %@ - negative utility scene: %.3f", buf, 0x16u);
        }

        BOOL v20 = 0;
        uint64_t v23 = v8;
        id v3 = v25;
        goto LABEL_46;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  id v3 = v25;
  char v19 = BYTE4(v27);
  if (v27) {
    goto LABEL_43;
  }
LABEL_40:
  if (v19 & 1) != 0 || (v11)
  {
LABEL_43:
    uint64_t v23 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v26;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Asset %@ is considered as utility", buf, 0xCu);
    }
    BOOL v20 = 1;
LABEL_46:
  }
  else
  {
    BOOL v20 = 0;
  }

LABEL_48:
  return v20;
}

+ (id)PLJunkSceneClassificationIDForLabel:(id)a3
{
  uint64_t v3 = PLJunkSceneClassificationIDForLabel__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&PLJunkSceneClassificationIDForLabel__once, &__block_literal_global_57442);
  }
  unsigned int v5 = [(id)PLJunkSceneClassificationIDForLabel__mapping objectForKeyedSubscript:v4];

  return v5;
}

void __61__PLSceneClassification_PLJunkSceneClassificationIDForLabel___block_invoke()
{
  v3[21] = *MEMORY[0x1E4F143B8];
  v2[0] = @"hier_text_document";
  v2[1] = @"hier_tragic_failure";
  v3[0] = &unk_1EEBEEC88;
  v3[1] = &unk_1EEBEECA0;
  v2[2] = @"bad_framing";
  v2[3] = @"bad_lighting";
  v3[2] = &unk_1EEBEECB8;
  v3[3] = &unk_1EEBEECD0;
  v2[4] = @"blurry";
  v2[5] = @"food_or_drink";
  v3[4] = &unk_1EEBEECE8;
  v3[5] = &unk_1EEBEED00;
  v2[6] = @"junk_other";
  v2[7] = @"medical_reference";
  v3[6] = &unk_1EEBEED18;
  v3[7] = &unk_1EEBEED30;
  v2[8] = @"negative";
  v2[9] = @"receipt_or_document";
  v3[8] = &unk_1EEBEED48;
  v3[9] = &unk_1EEBEED60;
  v2[10] = @"repair_reference";
  v2[11] = @"screenshot";
  v3[10] = &unk_1EEBEED78;
  v3[11] = &unk_1EEBEED90;
  v2[12] = @"shopping_reference";
  v2[13] = @"utility_reference";
  v3[12] = &unk_1EEBEEDA8;
  v3[13] = &unk_1EEBEEDC0;
  v2[14] = @"junk_negative";
  v2[15] = @"hier_negative";
  v3[14] = &unk_1EEBEEDD8;
  v3[15] = &unk_1EEBEEDD8;
  v2[16] = @"junk_non_memorable";
  v2[17] = @"hier_non_memorable";
  v3[16] = &unk_1EEBEEDF0;
  v3[17] = &unk_1EEBEEDF0;
  v2[18] = @"junk_poor_quality";
  v2[19] = @"hier_poor_quality";
  v3[18] = &unk_1EEBEEE08;
  v3[19] = &unk_1EEBEEE08;
  v2[20] = @"junk";
  v3[20] = &unk_1EEBEEE20;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:21];
  v1 = (void *)PLJunkSceneClassificationIDForLabel__mapping;
  PLJunkSceneClassificationIDForLabel__mapping = v0;
}

+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 sceneClassificationTypePredicate:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __158__PLSceneClassification_batchFetchScenesByAssetObjectIDWithAssetObjectIDs_library_includeTemporalClassifications_sceneClassificationTypePredicate_completion___block_invoke;
  v19[3] = &unk_1E586BBD8;
  id v20 = v12;
  id v21 = v11;
  BOOL v24 = a5;
  id v22 = v13;
  id v23 = v14;
  id v15 = v11;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [v18 performBlockAndWait:v19];
}

void __158__PLSceneClassification_batchFetchScenesByAssetObjectIDWithAssetObjectIDs_library_includeTemporalClassifications_sceneClassificationTypePredicate_completion___block_invoke(uint64_t a1)
{
  v90[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLAdditionalAssetAttributes entityName];
  unsigned int v5 = [v3 fetchRequestWithEntityName:v4];

  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", *(void *)(a1 + 40)];
  [v5 setPredicate:v6];
  [v5 setResultType:2];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v7 setName:@"assetObjectID"];
  v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"asset"];
  [v7 setExpression:v8];

  [v7 setExpressionResultType:2000];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v9 setName:@"additionalAttributes"];
  uint64_t v10 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v9 setExpression:v10];

  [v9 setExpressionResultType:2000];
  v90[0] = v7;
  v90[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  [v5 setPropertiesToFetch:v11];

  id v82 = 0;
  id v12 = [v2 executeFetchRequest:v5 error:&v82];
  id v13 = v82;
  if (v13)
  {
    id v14 = v13;
    id v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Batch fetching scenes error: %@", buf, 0xCu);
    }

    id v16 = v14;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v65 = v9;
    id v66 = v7;
    uint64_t v70 = a1;
    v71 = v2;
    v67 = v6;
    v68 = v5;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v18 = id v17 = v12;
    char v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v64 = v17;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v79 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          double v26 = [v25 objectForKeyedSubscript:@"additionalAttributes"];
          uint64_t v27 = [v25 objectForKeyedSubscript:@"assetObjectID"];
          [v19 setObject:v27 forKey:v26];
          [v18 addObject:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
      }
      while (v22);
    }

    long long v28 = (void *)MEMORY[0x1E4F1C0D0];
    long long v29 = +[PLSceneClassification entityName];
    long long v30 = [v28 fetchRequestWithEntityName:v29];

    long long v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetAttributes", v18];
    if (*(unsigned char *)(v70 + 64))
    {
      double v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetAttributesForTemporalSceneClassifications", v18];
      uint64_t v33 = v31;
      __int16 v34 = (void *)MEMORY[0x1E4F28BA0];
      v86[0] = v33;
      v86[1] = v32;
      double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
      long long v31 = [v34 orPredicateWithSubpredicates:v35];
    }
    uint64_t v36 = *(void *)(v70 + 48);
    if (v36)
    {
      uint64_t v37 = (void *)MEMORY[0x1E4F28BA0];
      v85[0] = v31;
      v85[1] = v36;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
      v39 = v38 = v31;
      uint64_t v40 = [v37 andPredicateWithSubpredicates:v39];

      long long v31 = (void *)v40;
    }
    id v41 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v41 setName:@"assetAttributes"];
    v42 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"assetAttributes"];
    [v41 setExpression:v42];

    [v41 setExpressionResultType:2000];
    id v43 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v43 setName:@"assetAttributesForTemporalSceneClassifications"];
    v44 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"assetAttributesForTemporalSceneClassifications"];
    [v43 setExpression:v44];

    [v43 setExpressionResultType:2000];
    v62 = v43;
    v63 = v41;
    v84[0] = v41;
    v84[1] = v43;
    v84[2] = @"confidence";
    v84[3] = @"sceneIdentifier";
    v84[4] = @"packedBoundingBoxRect";
    v84[5] = @"startTime";
    v84[6] = @"duration";
    v84[7] = @"classificationType";
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:8];
    [v30 setPropertiesToFetch:v45];

    [v30 setResultType:2];
    [v30 setPredicate:v31];
    v46 = [MEMORY[0x1E4F1CA60] dictionary];
    id v77 = 0;
    v2 = v71;
    v47 = [v71 executeFetchRequest:v30 error:&v77];
    id v69 = v77;
    v61 = v47;
    if (v69)
    {
      v48 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v69;
        _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Batch fetching scenes error: %@", buf, 0xCu);
      }

      id v16 = v69;
      (*(void (**)(void))(*(void *)(v70 + 56) + 16))();
    }
    else
    {
      v59 = v31;
      v60 = v30;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      obuint64_t j = v47;
      uint64_t v49 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v74 != v51) {
              objc_enumerationMutation(obj);
            }
            v53 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            v54 = [v53 objectForKeyedSubscript:@"assetAttributes"];
            if (v54
              || ([v53 objectForKeyedSubscript:@"assetAttributesForTemporalSceneClassifications"],
                  (v54 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v55 = [v19 objectForKey:v54];
              uint64_t v56 = [v46 objectForKey:v55];
              if (v56) {
                BOOL v57 = 1;
              }
              else {
                BOOL v57 = v55 == 0;
              }
              if (v57)
              {
                v58 = (void *)v56;
              }
              else
              {
                v58 = [MEMORY[0x1E4F1CA48] array];
                [v46 setObject:v58 forKeyedSubscript:v55];
              }
            }
            else
            {
              v55 = 0;
              v58 = 0;
            }
            [v58 addObject:v53];
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
        }
        while (v50);
      }

      (*(void (**)(void))(*(void *)(v70 + 56) + 16))();
      v2 = v71;
      long long v31 = v59;
      long long v30 = v60;
      id v16 = 0;
    }

    uint64_t v6 = v67;
    unsigned int v5 = v68;
    id v9 = v65;
    id v7 = v66;
    id v12 = v64;
  }
}

+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 completion:(id)a6
{
}

+ (unint64_t)_pool_countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = +[PLSceneClassification entityName];
  uint64_t v10 = [v7 fetchRequestWithEntityName:v9];

  id v11 = (void *)MEMORY[0x1E4F28BA0];
  id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"assetAttributes");
  id v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"assetAttributesForTemporalSceneClassifications", v12);
  v19[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  [v10 setFetchLimit:a3];
  [v10 setResultType:1];
  id v16 = [v8 executeFetchRequest:v10 error:a5];

  if (v16) {
    unint64_t v17 = [v16 count];
  }
  else {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

+ (unint64_t)countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x19F38D3B0]();
  id v13 = 0;
  unint64_t v10 = objc_msgSend(a1, "_pool_countOfOrphanedSceneClassificationsWithLimit:inContext:error:", a3, v8, &v13);
  id v11 = v13;
  if (a5) {
    *a5 = v11;
  }

  return v10;
}

+ (id)insertIntoPhotoLibrary:(id)a3 asset:(id)a4 sceneIdentifier:(unint64_t)a5 confidence:(double)a6 packedBoundingBoxRect:(int64_t)a7 startTime:(double)a8 duration:(double)a9 classificationType:(int64_t)a10
{
  id v19 = a3;
  id v20 = a4;
  if (!v19)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLSceneClassification.m", 170, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  uint64_t v21 = [v19 managedObjectContext];
  if (v20)
  {
    uint64_t v22 = [a1 entityName];
    uint64_t v23 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v22, (uint64_t)v21, 0);

    [v23 setSceneIdentifier:a5];
    [v23 setConfidence:a6];
    [v23 setPackedBoundingBoxRect:a7];
    [v23 setStartTime:a8];
    [v23 setDuration:a9];
    [v23 setClassificationType:(__int16)a10];
    BOOL v24 = [v20 additionalAttributes];
    if ((unint64_t)a10 <= 7)
    {
      if (((1 << a10) & 0xF3) != 0) {
        [v23 setAssetAttributes:v24];
      }
      else {
        [v23 setAssetAttributesForTemporalSceneClassifications:v24];
      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v25 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Unable to insert PLSceneClassification for a nil asset.", buf, 2u);
      }
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)fetchSceneClassificationsForAdditionalAttributes:(id)a3 managedObjectContext:(id)a4
{
  unsigned int v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PLSceneClassification entityName];
  id v9 = [v5 fetchRequestWithEntityName:v8];

  unint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ OR %K == %@", @"assetAttributes", v7, @"assetAttributesForTemporalSceneClassifications", v7];

  [v9 setPredicate:v10];
  id v15 = 0;
  id v11 = [v6 executeFetchRequest:v9 error:&v15];

  id v12 = v15;
  if (v11) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v11];
  }
  else {
  id v13 = [MEMORY[0x1E4F8B9B8] failureWithError:v12];
  }

  return v13;
}

@end