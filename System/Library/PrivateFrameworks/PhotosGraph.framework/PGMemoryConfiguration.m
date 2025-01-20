@interface PGMemoryConfiguration
+ (id)featuredTimePeriodMemoryConfigurationFromDictionary:(id)a3;
+ (id)memoryCategorySubcategoryByOverTimeTypeFromLabels:(id)a3;
+ (id)memoryConfigurationsWithGraph:(id)a3 loggingConnection:(id)a4;
+ (id)memoryFeatureSpecificationsFromDictionaries:(id)a3 memoryConfigurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6;
+ (id)memoryMomentRequirementsFromDictionary:(id)a3;
+ (id)overTheYearsMemoryConfigurationFromDictionary:(id)a3;
+ (id)resolveConfigurationDictionary:(id)a3 configurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6;
+ (unint64_t)memoryCategoryFromMemoryCategoryLabel:(id)a3;
+ (unint64_t)minimumSceneAnalysisVersionForSignalModel:(int64_t)a3;
- (BOOL)intersectRelevantAssetsForFeatures;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (NSArray)memoryFeatureSpecifications;
- (NSDictionary)memoryCategorySubcategoryByOverTimeType;
- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration;
- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration;
- (PGMemoryMomentRequirements)memoryMomentRequirements;
- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration;
- (unint64_t)memoryCategory;
- (unint64_t)minimumSceneAnalysisVersion;
@end

@implementation PGMemoryConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_memoryMomentRequirements, 0);
  objc_storeStrong((id *)&self->_memoryFeatureSpecifications, 0);
  objc_storeStrong((id *)&self->_memoryCategorySubcategoryByOverTimeType, 0);
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (PGMemoryMomentRequirements)memoryMomentRequirements
{
  return self->_memoryMomentRequirements;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (NSArray)memoryFeatureSpecifications
{
  return self->_memoryFeatureSpecifications;
}

- (NSDictionary)memoryCategorySubcategoryByOverTimeType
{
  return self->_memoryCategorySubcategoryByOverTimeType;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

+ (unint64_t)minimumSceneAnalysisVersionForSignalModel:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = (id *)0x1E4F8EB50;
    return [*v3 latestVersion];
  }
  if (a3 == 2)
  {
    v3 = (id *)0x1E4F8EB20;
    return [*v3 latestVersion];
  }
  return 0;
}

+ (id)featuredTimePeriodMemoryConfigurationFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v3];

  v5 = [PGFeaturedTimePeriodMemoryConfigurationBuilder alloc];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(PGConfiguration *)v5 initWithSources:v6 version:1.0];

  v8 = [(PGFeaturedTimePeriodMemoryConfigurationBuilder *)v7 featuredTimePeriodMemoryConfiguration];

  return v8;
}

+ (id)overTheYearsMemoryConfigurationFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v3];

  v5 = [PGOverTheYearsMemoryConfigurationBuilder alloc];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(PGConfiguration *)v5 initWithSources:v6 version:1.0];

  v8 = [(PGOverTheYearsMemoryConfigurationBuilder *)v7 overTheYearsMemoryConfiguration];

  return v8;
}

+ (id)memoryMomentRequirementsFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v3];

  v5 = [PGMemoryMomentRequirementsBuilder alloc];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(PGConfiguration *)v5 initWithSources:v6 version:1.0];

  v8 = [(PGMemoryMomentRequirementsBuilder *)v7 memoryMomentRequirements];

  return v8;
}

+ (id)memoryFeatureSpecificationsFromDictionaries:(id)a3 memoryConfigurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v38 = *(void *)v42;
    uint64_t v37 = *MEMORY[0x1E4F8E8A8];
    uint64_t v17 = *MEMORY[0x1E4F8E898];
    uint64_t v36 = *MEMORY[0x1E4F8E900];
    *(void *)&long long v15 = 138412290;
    long long v32 = v15;
    id v33 = v10;
    id obj = v13;
    log = v11;
    v35 = v12;
    v18 = v11;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v42 != v38) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
      v21 = objc_msgSend(v20, "objectForKeyedSubscript:", v37, v32);
      uint64_t v22 = [v20 objectForKeyedSubscript:v17];
      v23 = (void *)v22;
      if (!v21) {
        break;
      }
      if (!v22)
      {
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          id v46 = v33;
          _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Missing required memoryFeature property combineFeatureNodes for memoryConfiguration %@", buf, 0xCu);
        }
LABEL_24:

LABEL_25:
        id v13 = obj;

        id v30 = 0;
        id v10 = v33;
        v11 = log;
        id v12 = v35;
        goto LABEL_26;
      }
      uint64_t v24 = [v21 integerValue];
      uint64_t v25 = [v23 BOOLValue];
      v26 = [v20 objectForKeyedSubscript:v36];
      if (v26) {
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v26];
      }
      else {
        v27 = 0;
      }
      v28 = [[PGMemoryFeatureSpecification alloc] initWithFeatureType:v24 typeSpecificIdentifiers:v27 combineFeatureNodes:v25 graph:v40 loggingConnection:v18];
      v29 = [(PGMemoryFeatureSpecification *)v28 featureNodes];

      if (v29)
      {
        [v35 addObject:v28];
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v32;
        id v46 = v33;
        _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] nil featureNodes for memoryConfiguration %@", buf, 0xCu);
      }

      if (!v29) {
        goto LABEL_25;
      }
      if (v16 == ++v19)
      {
        id v13 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        id v10 = v33;
        v11 = log;
        id v12 = v35;
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v32;
      id v46 = v33;
      _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Missing required memoryFeature property featureType for memoryConfiguration %@", buf, 0xCu);
    }

    v21 = 0;
    goto LABEL_24;
  }
LABEL_18:

  id v30 = v12;
LABEL_26:

  return v30;
}

+ (id)memoryCategorySubcategoryByOverTimeTypeFromLabels:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PGMemoryConfiguration_memoryCategorySubcategoryByOverTimeTypeFromLabels___block_invoke;
  v8[3] = &unk_1E68E6008;
  char v10 = PGIsAppleInternal_isAppleInternal;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __75__PGMemoryConfiguration_memoryCategorySubcategoryByOverTimeTypeFromLabels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = PGMemoryCategorySubcategoryForLabel(a3);
  if (!v6)
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v6 = 17001;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  id v7 = [NSNumber numberWithUnsignedInteger:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

+ (unint64_t)memoryCategoryFromMemoryCategoryLabel:(id)a3
{
  id v3 = a3;
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  int v4 = PGIsAppleInternal_isAppleInternal;
  unint64_t v5 = +[PGGraphBuilder memoryCategoryForLabel:v3];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 100;
  }
  else {
    return v5;
  }
}

+ (id)resolveConfigurationDictionary:(id)a3 configurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
  long long v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8C8]];
  if (v15)
  {
    uint64_t v16 = [a1 memoryCategoryFromMemoryCategoryLabel:v15];
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v16];
    [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F8E8C0]];

    v18 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8D8]];
    if (v18)
    {
      uint64_t v51 = [a1 memoryCategorySubcategoryByOverTimeTypeFromLabels:v18];
      objc_msgSend(v14, "setObject:forKeyedSubscript:");
      uint64_t v19 = *MEMORY[0x1E4F8E8E0];
      uint64_t v20 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8E0]];
      v52 = (void *)v20;
      if (v20)
      {
        uint64_t v21 = [a1 memoryFeatureSpecificationsFromDictionaries:v20 memoryConfigurationLabel:v11 graph:v12 loggingConnection:v13];
        v50 = (void *)v21;
        if (v21)
        {
          [v14 setObject:v21 forKeyedSubscript:v19];
          uint64_t v22 = *MEMORY[0x1E4F8E8E8];
          uint64_t v23 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8E8]];
          v49 = (void *)v23;
          if (v23)
          {
            uint64_t v24 = [a1 memoryMomentRequirementsFromDictionary:v23];
            uint64_t v48 = (void *)v24;
            if (v24)
            {
              [v14 setObject:v24 forKeyedSubscript:v22];
              uint64_t v25 = *MEMORY[0x1E4F8E8F8];
              uint64_t v26 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8F8]];
              v47 = (void *)v26;
              if (v26)
              {
                uint64_t v27 = [a1 overTheYearsMemoryConfigurationFromDictionary:v26];
                id v46 = (void *)v27;
                if (v27)
                {
                  [v14 setObject:v27 forKeyedSubscript:v25];
                  uint64_t v28 = *MEMORY[0x1E4F8E8B8];
                  uint64_t v29 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8B8]];
                  v45 = (void *)v29;
                  if (v29)
                  {
                    uint64_t v30 = [a1 featuredTimePeriodMemoryConfigurationFromDictionary:v29];
                    long long v44 = (void *)v30;
                    if (v30)
                    {
                      [v14 setObject:v30 forKeyedSubscript:v28];
                      uint64_t v31 = *MEMORY[0x1E4F8E8B0];
                      uint64_t v32 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8B0]];
                      long long v43 = (void *)v32;
                      if (v32)
                      {
                        uint64_t v33 = [a1 featuredTimePeriodMemoryConfigurationFromDictionary:v32];
                        long long v42 = (void *)v33;
                        if (v33)
                        {
                          [v14 setObject:v33 forKeyedSubscript:v31];
                          v34 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8E8A0]];
                          if (v34)
                          {
                            long long v41 = v34;
                            uint64_t v35 = objc_msgSend(a1, "minimumSceneAnalysisVersionForSignalModel:", objc_msgSend(v34, "integerValue"));
                            uint64_t v36 = [NSNumber numberWithUnsignedInteger:v35];
                            [v14 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F8E8F0]];

                            id v37 = v14;
                            uint64_t v38 = v41;
                          }
                          else
                          {
                            uint64_t v38 = 0;
                            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              id v54 = v11;
                              _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil curationSignalModel for memoryConfiguration %@", buf, 0xCu);
                            }
                            id v37 = 0;
                          }
                          v39 = (void *)v51;
                        }
                        else
                        {
                          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            id v54 = v11;
                            _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil seasonMemoryConfiguration for memoryConfiguration %@", buf, 0xCu);
                          }
                          id v37 = 0;
                          v39 = (void *)v51;
                        }
                      }
                      else
                      {
                        v39 = (void *)v51;
                        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v54 = v11;
                          _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil seasonMemoryConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                        }
                        id v37 = 0;
                      }
                    }
                    else
                    {
                      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v54 = v11;
                        _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil featuredYearMemoryConfiguration for memoryConfiguration %@", buf, 0xCu);
                      }
                      id v37 = 0;
                      v39 = (void *)v51;
                    }
                  }
                  else
                  {
                    v39 = (void *)v51;
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v54 = v11;
                      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil featuredYearMemoryConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                    }
                    id v37 = 0;
                  }
                }
                else
                {
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v54 = v11;
                    _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil overTheYearsConfiguration for memoryConfiguration %@", buf, 0xCu);
                  }
                  id v37 = 0;
                  v39 = (void *)v51;
                }
              }
              else
              {
                v39 = (void *)v51;
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v54 = v11;
                  _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil overTheYearsConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                }
                id v37 = 0;
              }
            }
            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v54 = v11;
                _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryMomentRequirements for memoryConfiguration %@", buf, 0xCu);
              }
              id v37 = 0;
              v39 = (void *)v51;
            }
          }
          else
          {
            v39 = (void *)v51;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v54 = v11;
              _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryMomentRequirements dictionary for memoryConfiguration %@", buf, 0xCu);
            }
            id v37 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v54 = v11;
            _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryFeatureSpecifications for memoryConfiguration %@", buf, 0xCu);
          }
          id v37 = 0;
          v39 = (void *)v51;
        }
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v11;
          _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryFeatureSpecification dictionaries defined for memoryConfiguration %@", buf, 0xCu);
        }
        id v37 = 0;
        v39 = (void *)v51;
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v11;
        _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryCategorySubcategoryLabelByOverTimeType defined for memoryConfiguration %@", buf, 0xCu);
      }
      id v37 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v11;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryCategoryLabel defined for memoryConfiguration %@", buf, 0xCu);
    }
    id v37 = 0;
  }

  return v37;
}

+ (id)memoryConfigurationsWithGraph:(id)a3 loggingConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 URLForResource:@"MemoryConfigurations" withExtension:@"plist"];

  id v22 = 0;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9 error:&v22];
  id v11 = v22;
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__PGMemoryConfiguration_memoryConfigurationsWithGraph_loggingConnection___block_invoke;
    v17[3] = &unk_1E68E5FE0;
    id v21 = a1;
    id v18 = v6;
    uint64_t v19 = v7;
    id v13 = v12;
    id v20 = v13;
    [v10 enumerateKeysAndObjectsUsingBlock:v17];
    uint64_t v14 = v20;
    id v15 = v13;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] memoryConfigurations loaded from the plist is nil, failed with error %@", buf, 0xCu);
    }
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

void __73__PGMemoryConfiguration_memoryConfigurationsWithGraph_loggingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = [*(id *)(a1 + 56) resolveConfigurationDictionary:a3 configurationLabel:v7 graph:*(void *)(a1 + 32) loggingConnection:*(void *)(a1 + 40)];
  if (v8)
  {
    id v9 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v8];
    id v10 = [PGMemoryConfiguration alloc];
    id v15 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v12 = [(PGConfiguration *)v10 initWithSources:v11 version:1.0];

    if (v12)
    {
      [*(id *)(a1 + 48) addObject:v12];
    }
    else
    {
      uint64_t v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] memoryConfiguration is nil for memoryConfiguration: %@", buf, 0xCu);
      }
      *a4 = 1;
    }
  }
  else
  {
    id v13 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Resolved memoryConfiguration dictionary is nil for memoryConfiguration: %@", buf, 0xCu);
    }
    *a4 = 1;
  }
}

@end