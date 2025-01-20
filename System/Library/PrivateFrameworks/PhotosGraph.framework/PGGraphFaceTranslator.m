@interface PGGraphFaceTranslator
+ (BOOL)includesRelationshipChanges;
+ (Class)entityClass;
- (id)_momentChangesForFaceLocalIdentifiers:(id)a3;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphFaceTranslator

+ (BOOL)includesRelationshipChanges
{
  return 1;
}

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)_momentChangesForFaceLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PGGraphEntityTranslator *)self photoLibrary];
  v6 = momentChangesForLocalIdentifiers(v4, v5, &__block_literal_global_425);

  return v6;
}

id __63__PGGraphFaceTranslator__momentChangesForFaceLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F391A0];
  id v5 = a3;
  v6 = [a2 allObjects];
  v7 = [v4 fetchMomentsForFacesWithLocalIdentifiers:v6 options:v5];

  return v7;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v11 = 0.0;
  if (!v10 || (double v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_8:
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v15 = [MEMORY[0x1E4F1CA48] array];
    id v27 = v8;
    v16 = [v8 allKeys];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if ([v9 personRelationshipChangedForFaceWithLocalIdentifier:v21]) {
            [v14 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }
    if (v10)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      v23 = (double *)&unk_1D1F48000;
      if (Current - v11 >= 0.01)
      {
        char v32 = 0;
        v10[2](v10, &v32, 0.5);
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v35 = 786;
            __int16 v36 = 2080;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGGraphEntityTranslator.m";
            v24 = MEMORY[0x1E4F14500];
LABEL_31:
            _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        double v11 = Current;
      }
    }
    else
    {
      v23 = (double *)&unk_1D1F48000;
    }
    if ([v14 count])
    {
      v25 = [(PGGraphFaceTranslator *)self _momentChangesForFaceLocalIdentifiers:v14];
      [v15 addObjectsFromArray:v25];
    }
    if (!v10 || CFAbsoluteTimeGetCurrent() - v11 < v23[87] || (char v32 = 0, v10[2](v10, &v32, 1.0), !v32))
    {
      id v13 = v15;
      goto LABEL_34;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v35 = 795;
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGra"
            "phEntityTranslator.m";
      v24 = MEMORY[0x1E4F14500];
      goto LABEL_31;
    }
LABEL_32:
    id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_34:

    id v8 = v27;
    goto LABEL_35;
  }
  char v32 = 0;
  v10[2](v10, &v32, 0.0);
  if (!v32)
  {
    double v11 = v12;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v35 = 767;
    __int16 v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_35:

  return v13;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Delete %ld faces", (uint8_t *)&v8, 0xCu);
  }
  v6 = [(PGGraphFaceTranslator *)self _momentChangesForFaceLocalIdentifiers:v5];

  return v6;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Insert %ld new faces via moment updates", (uint8_t *)&v8, 0xCu);
  }
  v6 = [(PGGraphFaceTranslator *)self _momentChangesForFaceLocalIdentifiers:v5];

  return v6;
}

@end