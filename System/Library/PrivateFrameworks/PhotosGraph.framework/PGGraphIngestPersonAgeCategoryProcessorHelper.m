@interface PGGraphIngestPersonAgeCategoryProcessorHelper
- (PGGraphIngestPersonAgeCategoryProcessorHelper)init;
- (id)ageDescriptionFromAge:(unint64_t)a3;
- (id)confidenceThresholdByAdultSceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdByBabySceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdByChildSceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdByTeenSceneIdentifierWithCurationModel:(id)a3;
- (unint64_t)ageCategoryForPersonNode:(id)a3 ageCategoryCountedSet:(id)a4;
- (unint64_t)ageCategoryFromAssetSamplingScenesForPersonNode:(id)a3 photoLibrary:(id)a4 curationSession:(id)a5;
- (unint64_t)ageCategoryFromBirthdayDateComponents:(id)a3 currentDate:(id)a4;
- (unint64_t)ageCategoryFromBirthdayDateForPersonNode:(id)a3;
- (unint64_t)ageCategoryFromPHFaceAgeType:(unsigned __int16)a3;
- (unint64_t)ageCategoryFromScenesByAssetLocalIdentifier:(id)a3 curationModelByAssetLocalIdentifier:(id)a4 personNode:(id)a5;
- (unint64_t)ageCategoryUsingFaceAttributesForPersonNode:(id)a3 photoLibrary:(id)a4;
- (unsigned)ageTypeFromAgeCategory:(unint64_t)a3;
@end

@implementation PGGraphIngestPersonAgeCategoryProcessorHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adultScenesHelper, 0);
  objc_storeStrong((id *)&self->_teenScenesHelper, 0);
  objc_storeStrong((id *)&self->_childScenesHelper, 0);
  objc_storeStrong((id *)&self->_babyScenesHelper, 0);
}

- (unsigned)ageTypeFromAgeCategory:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return word_1D1F4F988[a3 - 1];
  }
}

- (id)ageDescriptionFromAge:(unint64_t)a3
{
  if (a3 > 5) {
    return @"AgeCategoryUnspecified";
  }
  else {
    return off_1E68EA8F8[a3];
  }
}

- (unint64_t)ageCategoryFromScenesByAssetLocalIdentifier:(id)a3 curationModelByAssetLocalIdentifier:(id)a4 personNode:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __140__PGGraphIngestPersonAgeCategoryProcessorHelper_ageCategoryFromScenesByAssetLocalIdentifier_curationModelByAssetLocalIdentifier_personNode___block_invoke;
  v24[3] = &unk_1E68EA8D8;
  id v11 = v9;
  id v25 = v11;
  v26 = self;
  v27 = &v38;
  v28 = &v34;
  v29 = &v30;
  [v8 enumerateKeysAndObjectsUsingBlock:v24];
  unint64_t v12 = [v8 count];
  v13 = +[PGLogging sharedLogging];
  v14 = [v13 loggingConnection];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [v10 stringDescription];
    uint64_t v16 = v39[3];
    uint64_t v17 = v35[3];
    uint64_t v18 = v31[3];
    *(_DWORD *)buf = 138478851;
    v43 = v15;
    __int16 v44 = 2048;
    uint64_t v45 = v16;
    __int16 v46 = 2048;
    uint64_t v47 = v17;
    __int16 v48 = 2048;
    uint64_t v49 = v18;
    __int16 v50 = 2048;
    unint64_t v51 = v12;
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ - (baby: %lu, child: %lu, teen: %lu, total: %lu)", buf, 0x34u);
  }
  unint64_t v19 = v39[3];
  double v20 = (double)v12;
  if ((double)v19 / (double)v12 >= 0.6)
  {
    unint64_t v22 = 1;
  }
  else
  {
    unint64_t v21 = v35[3] + v19;
    if ((double)v21 / v20 >= 0.6)
    {
      unint64_t v22 = 2;
    }
    else if ((double)(v31[3] + v21) / v20 >= 0.6)
    {
      unint64_t v22 = 3;
    }
    else
    {
      unint64_t v22 = 0;
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __140__PGGraphIngestPersonAgeCategoryProcessorHelper_ageCategoryFromScenesByAssetLocalIdentifier_curationModelByAssetLocalIdentifier_personNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = [*(id *)(*(void *)(a1 + 40) + 8) confidenceThresholdBySceneIdentifierWithCurationModel:v7];
  id v9 = [*(id *)(*(void *)(a1 + 40) + 16) confidenceThresholdBySceneIdentifierWithCurationModel:v7];
  uint64_t v45 = [*(id *)(*(void *)(a1 + 40) + 24) confidenceThresholdBySceneIdentifierWithCurationModel:v7];
  __int16 v44 = [*(id *)(*(void *)(a1 + 40) + 32) confidenceThresholdBySceneIdentifierWithCurationModel:v7];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v38 = (void *)a1;
    v39 = v7;
    id v40 = v5;
    uint64_t v41 = 0;
    uint64_t v13 = *(void *)v49;
    uint64_t v42 = 0;
    uint64_t v43 = *(void *)v49;
    do
    {
      uint64_t v14 = 0;
      uint64_t v46 = v12;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "extendedSceneIdentifier"));
        uint64_t v18 = [v8 objectForKeyedSubscript:v17];
        if (v18 && ([v15 confidence], double v20 = v19, objc_msgSend(v18, "doubleValue"), v20 >= v21))
        {
          BYTE4(v42) = 1;
        }
        else
        {
          uint64_t v47 = v16;
          unint64_t v22 = objc_msgSend(v9, "objectForKeyedSubscript:", v17, v38);
          if (v22 && ([v15 confidence], double v24 = v23, objc_msgSend(v22, "doubleValue"), v24 >= v25))
          {
            LOBYTE(v42) = 1;
          }
          else
          {
            v26 = [v45 objectForKeyedSubscript:v17];
            if (v26 && ([v15 confidence], double v28 = v27, objc_msgSend(v26, "doubleValue"), v28 >= v29))
            {
              BYTE4(v41) = 1;
            }
            else
            {
              id v30 = v10;
              v31 = v9;
              uint64_t v32 = v8;
              uint64_t v33 = [v44 objectForKeyedSubscript:v17];
              if (v33)
              {
                [v15 confidence];
                double v35 = v34;
                [v33 doubleValue];
                if (v35 >= v36) {
                  LOBYTE(v41) = 1;
                }
              }

              id v8 = v32;
              id v9 = v31;
              id v10 = v30;
              uint64_t v13 = v43;
            }

            uint64_t v12 = v46;
          }

          uint64_t v16 = v47;
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v12);

    v7 = v39;
    id v5 = v40;
    if ((v41 & 1) == 0)
    {
      if ((v42 & 0x100000000) != 0)
      {
        uint64_t v37 = v38[6];
LABEL_31:
        ++*(void *)(*(void *)(v37 + 8) + 24);
        goto LABEL_32;
      }
      if (v42)
      {
        uint64_t v37 = v38[7];
        goto LABEL_31;
      }
      if ((v41 & 0x100000000) != 0)
      {
        uint64_t v37 = v38[8];
        goto LABEL_31;
      }
    }
  }
  else
  {
  }
LABEL_32:
}

- (unint64_t)ageCategoryFromAssetSamplingScenesForPersonNode:(id)a3 photoLibrary:(id)a4 curationSession:(id)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 localIdentifier];
  if ([v11 length])
  {
    uint64_t v12 = *MEMORY[0x1E4F394E0];
    v46[0] = *MEMORY[0x1E4F39538];
    v46[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    uint64_t v14 = +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:v11 photoLibrary:v9 numberOfYearsBack:100 sampleSize:200 fetchPropertySets:v13];

    unint64_t v15 = [v14 count];
    if (v15 < 5)
    {
      unint64_t v30 = v15;
      v31 = +[PGLogging sharedLogging];
      double v20 = [v31 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = [v8 stringDescription];
        *(_DWORD *)buf = 138478083;
        uint64_t v42 = v32;
        __int16 v43 = 2048;
        unint64_t v44 = v30;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ has not enough singleton face assets: %lu", buf, 0x16u);
      }
      unint64_t v29 = 0;
    }
    else
    {
      double v34 = self;
      id v36 = v9;
      id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v17 = [v14 fetchedObjects];
      uint64_t v18 = (void *)[v16 initWithArray:v17];

      id v35 = v10;
      [v10 prepareAssets:v18];
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      double v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v20);
            }
            double v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v26 = [v25 curationModel];
            double v27 = [v25 localIdentifier];
            [v19 setObject:v26 forKeyedSubscript:v27];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v22);
      }

      double v28 = [MEMORY[0x1E4F39280] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v14];
      unint64_t v29 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)v34 ageCategoryFromScenesByAssetLocalIdentifier:v28 curationModelByAssetLocalIdentifier:v19 personNode:v8];

      id v10 = v35;
      id v9 = v36;
    }
  }
  else
  {
    unint64_t v29 = 0;
  }

  return v29;
}

- (id)confidenceThresholdByAdultSceneIdentifierWithCurationModel:(id)a3
{
  return (id)[(CLSSceneConfidenceThresholdHelper *)self->_adultScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:a3];
}

- (id)confidenceThresholdByTeenSceneIdentifierWithCurationModel:(id)a3
{
  return (id)[(CLSSceneConfidenceThresholdHelper *)self->_teenScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:a3];
}

- (id)confidenceThresholdByChildSceneIdentifierWithCurationModel:(id)a3
{
  return (id)[(CLSSceneConfidenceThresholdHelper *)self->_childScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:a3];
}

- (id)confidenceThresholdByBabySceneIdentifierWithCurationModel:(id)a3
{
  return (id)[(CLSSceneConfidenceThresholdHelper *)self->_babyScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:a3];
}

- (unint64_t)ageCategoryFromBirthdayDateForPersonNode:(id)a3
{
  v4 = [a3 birthdayDateComponents];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F76C68] currentLocalDate];
    unint64_t v6 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self ageCategoryFromBirthdayDateComponents:v4 currentDate:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)ageCategoryFromBirthdayDateComponents:(id)a3 currentDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 year];
  unint64_t v8 = 0;
  if (v5 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x1E4F76C68] dateFromComponents:v5 inTimeZone:0];
    [v6 timeIntervalSinceDate:v9];
    if (v10 >= 94672800.0)
    {
      if (v10 >= 410248800.0)
      {
        if (v10 >= 978285600.0)
        {
          if (v10 >= 1925013600.0) {
            unint64_t v8 = 5;
          }
          else {
            unint64_t v8 = 4;
          }
        }
        else
        {
          unint64_t v8 = 3;
        }
      }
      else
      {
        unint64_t v8 = 2;
      }
    }
    else
    {
      unint64_t v8 = 1;
    }
  }
  return v8;
}

- (unint64_t)ageCategoryFromPHFaceAgeType:(unsigned __int16)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1D1F4F960[(unsigned __int16)(a3 - 1)];
  }
}

- (unint64_t)ageCategoryForPersonNode:(id)a3 ageCategoryCountedSet:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![&unk_1F28D45A8 count]) {
    goto LABEL_7;
  }
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v11 = [&unk_1F28D45A8 objectAtIndexedSubscript:v9];
    unint64_t v12 = [v7 countForObject:v11];
    if (v12 >= v8 && v12 > 4)
    {
      unint64_t v8 = v12;
      uint64_t v10 = v9;
    }

    ++v9;
  }
  while (v9 < [&unk_1F28D45A8 count]);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    uint64_t v13 = +[PGLogging sharedLogging];
    uint64_t v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unint64_t v15 = [v6 stringDescription];
      *(_DWORD *)buf = 138477827;
      __int16 v43 = v15;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ has no age bracket that hits minimum criteria", buf, 0xCu);
    }
LABEL_22:
    unint64_t v38 = 0;
    goto LABEL_23;
  }
  id v16 = [&unk_1F28D45A8 objectAtIndexedSubscript:v10];
  uint64_t v17 = [v16 unsignedIntValue];

  uint64_t v18 = +[PGLogging sharedLogging];
  id v19 = [v18 loggingConnection];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    double v20 = [v6 stringDescription];
    uint64_t v21 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self ageDescriptionFromAge:v17];
    *(_DWORD *)buf = 138478339;
    __int16 v43 = v20;
    __int16 v44 = 2112;
    uint64_t v45 = v21;
    __int16 v46 = 2048;
    unint64_t v47 = v8;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ most represented age bracket is %@ (%lu faces)", buf, 0x20u);
  }
  uint64_t v41 = self;

  uint64_t v22 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v17];
  uint64_t v14 = [v22 arrayWithObject:v23];

  unint64_t v24 = v10 + 1;
  if (v24 < [&unk_1F28D45A8 count])
  {
    double v26 = (double)v8;
    *(void *)&long long v25 = 138478339;
    long long v40 = v25;
    while (1)
    {
      double v27 = objc_msgSend(&unk_1F28D45A8, "objectAtIndexedSubscript:", v24, v40);
      unint64_t v28 = [v7 countForObject:v27];
      if (v28 < 5) {
        break;
      }
      unint64_t v29 = v28;
      if ((double)v28 / v26 < 0.3) {
        break;
      }
      unint64_t v30 = [&unk_1F28D45A8 objectAtIndexedSubscript:v24];
      uint64_t v31 = [v30 unsignedIntValue];

      uint64_t v32 = [NSNumber numberWithUnsignedInteger:v31];
      [v14 addObject:v32];

      uint64_t v33 = +[PGLogging sharedLogging];
      double v34 = [v33 loggingConnection];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = [v6 stringDescription];
        id v36 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)v41 ageDescriptionFromAge:v31];
        *(_DWORD *)buf = v40;
        __int16 v43 = v35;
        __int16 v44 = 2112;
        uint64_t v45 = v36;
        __int16 v46 = 2048;
        unint64_t v47 = v29;
        _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ possible age bracket %@ (%lu faces)", buf, 0x20u);
      }
      if (++v24 >= [&unk_1F28D45A8 count]) {
        goto LABEL_20;
      }
    }
  }
LABEL_20:
  if (![v14 count]) {
    goto LABEL_22;
  }
  long long v37 = [v14 lastObject];
  unint64_t v38 = [v37 unsignedIntValue];

LABEL_23:
  return v38;
}

- (unint64_t)ageCategoryUsingFaceAttributesForPersonNode:(id)a3 photoLibrary:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 localIdentifier];
  if ([v8 length])
  {
    unint64_t v9 = +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:v8 photoLibrary:v7 numberOfYearsBack:5 sampleSize:200 fetchPropertySets:0];
    unint64_t v10 = 0;
    if ((unint64_t)[v9 count] >= 5)
    {
      uint64_t v11 = [v7 librarySpecificFetchOptions];
      uint64_t v12 = *MEMORY[0x1E4F39640];
      v33[0] = *MEMORY[0x1E4F39628];
      v33[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v11 setFetchPropertySets:v13];

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ageType != %lu", 0);
      [v11 setInternalPredicate:v14];

      unint64_t v15 = [MEMORY[0x1E4F28BD0] set];
      id v16 = [MEMORY[0x1E4F39050] fetchFacesInAssets:v9 options:v11];
      unint64_t v10 = 0;
      if ((unint64_t)[v16 count] >= 5)
      {
        double v26 = v11;
        id v27 = v7;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v25 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              unint64_t v22 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromPHFaceAgeType:](self, "ageCategoryFromPHFaceAgeType:", [*(id *)(*((void *)&v28 + 1) + 8 * i) ageType]);
              uint64_t v23 = [NSNumber numberWithUnsignedInteger:v22];
              [v15 addObject:v23];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v19);
        }

        unint64_t v10 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self ageCategoryForPersonNode:v6 ageCategoryCountedSet:v15];
        id v7 = v27;
        id v16 = v25;
        uint64_t v11 = v26;
      }
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (PGGraphIngestPersonAgeCategoryProcessorHelper)init
{
  v12.receiver = self;
  v12.super_class = (Class)PGGraphIngestPersonAgeCategoryProcessorHelper;
  v2 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D4548 thresholdType:1];
    babyScenesHelper = v2->_babyScenesHelper;
    v2->_babyScenesHelper = (CLSSceneConfidenceThresholdHelper *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D4560 thresholdType:1];
    childScenesHelper = v2->_childScenesHelper;
    v2->_childScenesHelper = (CLSSceneConfidenceThresholdHelper *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D4578 thresholdType:1];
    teenScenesHelper = v2->_teenScenesHelper;
    v2->_teenScenesHelper = (CLSSceneConfidenceThresholdHelper *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D4590 thresholdType:1];
    adultScenesHelper = v2->_adultScenesHelper;
    v2->_adultScenesHelper = (CLSSceneConfidenceThresholdHelper *)v9;
  }
  return v2;
}

@end