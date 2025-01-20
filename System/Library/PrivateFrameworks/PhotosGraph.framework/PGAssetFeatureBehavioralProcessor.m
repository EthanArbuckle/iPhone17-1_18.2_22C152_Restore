@interface PGAssetFeatureBehavioralProcessor
- (NSDictionary)personFeatures;
- (NSDictionary)sceneFeatures;
- (NSSet)goldAssets;
- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 loggingConnection:(id)a4;
- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 persistedData:(id)a4 loggingConnection:(id)a5;
- (double)similarityScoreNormalizer;
- (float)semanticScoreForAsset:(id)a3;
- (id)_semanticScoreByAssetUUIDForAssets:(id)a3 normalize:(BOOL)a4;
- (id)dataToPersist;
- (id)semanticScoreByAssetUUIDForAssets:(id)a3;
- (void)personAndSceneFeaturesFromGoldAssetsUsingBlock:(id)a3;
- (void)preprocessWithProgressBlock:(id)a3;
- (void)setGoldAssets:(id)a3;
- (void)setPersonFeatures:(id)a3;
- (void)setSceneFeatures:(id)a3;
- (void)setSimilarityScoreNormalizer:(double)a3;
@end

@implementation PGAssetFeatureBehavioralProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneFeatures, 0);
  objc_storeStrong((id *)&self->_personFeatures, 0);
  objc_storeStrong((id *)&self->_goldAssets, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (void)setSimilarityScoreNormalizer:(double)a3
{
  self->_similarityScoreNormalizer = a3;
}

- (double)similarityScoreNormalizer
{
  return self->_similarityScoreNormalizer;
}

- (void)setSceneFeatures:(id)a3
{
}

- (NSDictionary)sceneFeatures
{
  return self->_sceneFeatures;
}

- (void)setPersonFeatures:(id)a3
{
}

- (NSDictionary)personFeatures
{
  return self->_personFeatures;
}

- (void)setGoldAssets:(id)a3
{
}

- (NSSet)goldAssets
{
  return self->_goldAssets;
}

- (id)dataToPersist
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = PGAssetFeatureBehavioralProcessorPeopleFeaturesKey;
  v6[1] = PGAssetFeatureBehavioralProcessorSceneFeaturesKey;
  sceneFeatures = self->_sceneFeatures;
  v7[0] = self->_personFeatures;
  v7[1] = sceneFeatures;
  v6[2] = @"normalizer";
  v3 = [NSNumber numberWithDouble:self->_similarityScoreNormalizer];
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)personAndSceneFeaturesFromGoldAssetsUsingBlock:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void, void *, void *))a3;
  NSUInteger v5 = [(NSSet *)self->_goldAssets count];
  if (v5)
  {
    unint64_t v6 = v5;
    v68 = v4;
    v7 = [(NSSet *)self->_goldAssets allObjects];
    v8 = [v7 firstObject];
    v70 = [v8 photoLibrary];

    v71 = v7;
    v9 = [MEMORY[0x1E4F38EB8] verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:v7];
    v10 = [MEMORY[0x1E4F28BD0] set];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v94 objects:v103 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v95 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v94 + 1) + 8 * i)];
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v90 objects:v102 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v91;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v91 != v19) {
                  objc_enumerationMutation(v16);
                }
                [v10 addObject:*(void *)(*((void *)&v90 + 1) + 8 * j)];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v90 objects:v102 count:16];
            }
            while (v18);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v13);
    }

    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v86 objects:v101 count:16];
    unint64_t v24 = v6;
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v87;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v87 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v86 + 1) + 8 * k);
          unint64_t v29 = [v22 countForObject:v28];
          v30 = [NSNumber numberWithDouble:(double)v29 / (double)v6];
          [v21 setObject:v30 forKeyedSubscript:v28];
        }
        uint64_t v25 = [v22 countByEnumeratingWithState:&v86 objects:v101 count:16];
      }
      while (v25);
    }
    v67 = v21;

    id v31 = objc_alloc(MEMORY[0x1E4F39150]);
    v66 = (void *)[v31 initWithObjects:v71 photoLibrary:v70 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:1];
    v32 = objc_msgSend(MEMORY[0x1E4F39280], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:");
    v33 = [v70 librarySpecificFetchOptions];
    uint64_t v34 = *MEMORY[0x1E4F394E0];
    v100[0] = *MEMORY[0x1E4F39538];
    v100[1] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
    [v33 setFetchPropertySets:v35];

    v36 = (void *)MEMORY[0x1E4F38EB8];
    v69 = v32;
    v37 = [v32 allKeys];
    v65 = v33;
    v38 = [v36 fetchAssetsWithLocalIdentifiers:v37 options:v33];

    id v39 = objc_alloc_init(MEMORY[0x1E4F8E778]);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v38, "count"));
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v38;
    uint64_t v41 = [obj countByEnumeratingWithState:&v82 objects:v99 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v83;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v83 != v43) {
            objc_enumerationMutation(obj);
          }
          v45 = *(void **)(*((void *)&v82 + 1) + 8 * m);
          v46 = [v39 curationModelForAsset:v45];
          v47 = [v45 localIdentifier];
          [v40 setObject:v46 forKeyedSubscript:v47];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v82 objects:v99 count:16];
      }
      while (v42);
    }

    v48 = [MEMORY[0x1E4F28BD0] set];
    v49 = [MEMORY[0x1E4F1CA60] dictionary];
    v50 = [MEMORY[0x1E4F1CA60] dictionary];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __84__PGAssetFeatureBehavioralProcessor_personAndSceneFeaturesFromGoldAssetsUsingBlock___block_invoke;
    v77[3] = &unk_1E68EE020;
    id v64 = v40;
    id v78 = v64;
    id v63 = v50;
    id v79 = v63;
    id v62 = v49;
    id v80 = v62;
    id v51 = v48;
    id v81 = v51;
    [v69 enumerateKeysAndObjectsUsingBlock:v77];
    v52 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v53 = v51;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v73 objects:v98 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v74;
      double v57 = (double)v24;
      do
      {
        for (uint64_t n = 0; n != v55; ++n)
        {
          if (*(void *)v74 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v59 = *(void *)(*((void *)&v73 + 1) + 8 * n);
          unint64_t v60 = [v53 countForObject:v59];
          v61 = [NSNumber numberWithDouble:(double)v60 / v57];
          [v52 setObject:v61 forKeyedSubscript:v59];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v73 objects:v98 count:16];
      }
      while (v55);
    }

    v4 = v68;
    v68[2](v68, v67, v52);
  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E4F1CC08], (void *)MEMORY[0x1E4F1CC08]);
  }
}

void __84__PGAssetFeatureBehavioralProcessor_personAndSceneFeaturesFromGoldAssetsUsingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v25 = v5;
  uint64_t v23 = [a1[4] objectForKeyedSubscript:v5];
  uint64_t v26 = [v23 sceneModel];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v12 extendedSceneIdentifier];
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v12, "extendedSceneIdentifier"));
        v15 = [a1[5] objectForKeyedSubscript:v14];
        uint64_t v16 = [a1[6] objectForKeyedSubscript:v14];
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v18 = v15;
        }
        else
        {
          uint64_t v18 = [v26 taxonomyNodeForSceneIdentifier:v13];

          [a1[5] setObject:v18 forKeyedSubscript:v14];
          uint64_t v19 = [v18 name];
          if ([v19 length])
          {
            uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "isIndexed"));
          }
          else
          {
            uint64_t v17 = (void *)MEMORY[0x1E4F1CC28];
          }
          [a1[6] setObject:v17 forKeyedSubscript:v14];
        }
        if ([v17 BOOLValue])
        {
          [v12 confidence];
          double v21 = v20;
          [v18 graphHighPrecisionThreshold];
          if (v21 >= v22) {
            [a1[7] addObject:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
}

- (id)_semanticScoreByAssetUUIDForAssets:(id)a3 normalize:(BOOL)a4
{
  BOOL v45 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 firstObject];
  id v7 = [v6 photoLibrary];

  if (v7)
  {
    id v48 = [MEMORY[0x1E4F1CA60] dictionary];
    v47 = [MEMORY[0x1E4F38EB8] verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:v5];
    id v8 = objc_alloc(MEMORY[0x1E4F39150]);
    uint64_t v41 = v7;
    v40 = (void *)[v8 initWithObjects:v5 photoLibrary:v7 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:1];
    v46 = objc_msgSend(MEMORY[0x1E4F39280], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:");
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v42 = v5;
    obuint64_t j = v5;
    uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v49)
    {
      uint64_t v44 = *(void *)v63;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v63 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v9;
          uint64_t v10 = *(void **)(*((void *)&v62 + 1) + 8 * v9);
          v52 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v11 = [v10 uuid];
          uint64_t v12 = [v10 localIdentifier];
          id v51 = (void *)v11;
          uint64_t v13 = [v47 objectForKeyedSubscript:v11];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v59;
            float v17 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v59 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v19 = [(NSDictionary *)self->_personFeatures objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * i)];
                double v20 = (void *)v19;
                if (v19) {
                  double v21 = (void *)v19;
                }
                else {
                  double v21 = &unk_1F28D2AA8;
                }
                id v22 = v21;

                [v22 floatValue];
                float v24 = v23;

                float v17 = v17 + v24;
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v58 objects:v67 count:16];
            }
            while (v15);
          }
          else
          {
            float v17 = 0.0;
          }
          v50 = (void *)v12;
          uint64_t v25 = [v46 objectForKeyedSubscript:v12];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v26)
          {
            uint64_t v28 = v26;
            uint64_t v29 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v55 != v29) {
                  objc_enumerationMutation(v25);
                }
                id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * j), "extendedSceneIdentifier"));
                uint64_t v32 = [(NSDictionary *)self->_sceneFeatures objectForKeyedSubscript:v31];
                v33 = (void *)v32;
                if (v32) {
                  uint64_t v34 = (void *)v32;
                }
                else {
                  uint64_t v34 = &unk_1F28D2AA8;
                }
                id v35 = v34;

                [v35 floatValue];
                float v37 = v36;

                float v17 = v17 + v37;
              }
              uint64_t v28 = [v25 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v28);
          }
          if (v45)
          {
            double similarityScoreNormalizer = self->_similarityScoreNormalizer;
            *(float *)&double similarityScoreNormalizer = similarityScoreNormalizer;
            float v17 = v17 / *(float *)&similarityScoreNormalizer;
          }
          *(float *)&double similarityScoreNormalizer = v17;
          v38 = [NSNumber numberWithFloat:similarityScoreNormalizer];
          [v48 setObject:v38 forKeyedSubscript:v51];

          uint64_t v9 = v53 + 1;
        }
        while (v53 + 1 != v49);
        uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v49);
    }

    id v7 = v41;
    id v5 = v42;
  }
  else
  {
    id v48 = (id)MEMORY[0x1E4F1CC08];
  }

  return v48;
}

- (float)semanticScoreForAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v13 count:1];
  id v7 = -[PGAssetFeatureBehavioralProcessor _semanticScoreByAssetUUIDForAssets:normalize:](self, "_semanticScoreByAssetUUIDForAssets:normalize:", v6, 1, v13, v14);

  id v8 = [v5 uuid];

  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  [v9 floatValue];
  float v11 = v10;

  return v11;
}

- (id)semanticScoreByAssetUUIDForAssets:(id)a3
{
  return [(PGAssetFeatureBehavioralProcessor *)self _semanticScoreByAssetUUIDForAssets:a3 normalize:1];
}

- (void)preprocessWithProgressBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void (**)(void *, uint8_t *, double))_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    id v8 = self->_loggingConnection;
    os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)v8);
    float v10 = v8;
    float v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "BehavioralSemanticMap", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v12 = mach_absolute_time();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke;
    v23[3] = &unk_1E68EDFD0;
    v23[4] = self;
    [(PGAssetFeatureBehavioralProcessor *)self personAndSceneFeaturesFromGoldAssetsUsingBlock:v23];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        v25[0] = 0;
        v5[2](v5, v25, 0.5);
        if (v25[0])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 76;
            LOWORD(v28) = 2080;
            *(void *)((char *)&v28 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_27:

          goto LABEL_28;
        }
        double v6 = Current;
      }
    }
    *(void *)buf = 0;
    *(void *)&long long v28 = buf;
    *((void *)&v28 + 1) = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v14 = [(NSSet *)self->_goldAssets allObjects];
    uint64_t v15 = [(PGAssetFeatureBehavioralProcessor *)self _semanticScoreByAssetUUIDForAssets:v14 normalize:0];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke_240;
    v22[3] = &unk_1E68EDFF8;
    v22[4] = buf;
    [v15 enumerateKeysAndObjectsUsingBlock:v22];
    self->_double similarityScoreNormalizer = *(double *)(v28 + 24);
    uint64_t v16 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    uint64_t v19 = v11;
    double v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v9, "BehavioralSemanticMap", "", v25, 2u);
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v25 = 136315394;
      *(void *)uint64_t v26 = "BehavioralSemanticMap";
      *(_WORD *)&v26[8] = 2048;
      *(double *)&v26[10] = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v25, 0x16u);
    }
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v21 = 0;
        v5[2](v5, (uint8_t *)&v21, 1.0);
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v25 = 67109378;
            *(_DWORD *)uint64_t v26 = 93;
            *(_WORD *)&v26[4] = 2080;
            *(void *)&v26[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v25, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_27;
  }
  v25[0] = 0;
  v5[2](v5, v25, 0.0);
  if (!v25[0])
  {
    double v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 67;
    LOWORD(v28) = 2080;
    *(void *)((char *)&v28 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_28:
}

void __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = (void *)[a2 copy];
  [*(id *)(a1 + 32) setPersonFeatures:v6];

  id v7 = (id)[v5 copy];
  [*(id *)(a1 + 32) setSceneFeatures:v7];
}

uint64_t __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke_240(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 floatValue];
  double v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v7 + 24) < v6) {
    *(double *)(v7 + 24) = v6;
  }
  return result;
}

- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 persistedData:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGAssetFeatureBehavioralProcessor;
  uint64_t v12 = [(PGAssetFeatureBehavioralProcessor *)&v21 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_goldAssets, a3);
    uint64_t v14 = [v10 objectForKeyedSubscript:PGAssetFeatureBehavioralProcessorPeopleFeaturesKey];
    personFeatures = v13->_personFeatures;
    v13->_personFeatures = (NSDictionary *)v14;

    uint64_t v16 = [v10 objectForKeyedSubscript:PGAssetFeatureBehavioralProcessorSceneFeaturesKey];
    sceneFeatures = v13->_sceneFeatures;
    v13->_sceneFeatures = (NSDictionary *)v16;

    uint64_t v18 = [v10 objectForKeyedSubscript:@"normalizer"];
    [v18 doubleValue];
    v13->_double similarityScoreNormalizer = v19;

    objc_storeStrong((id *)&v13->_loggingConnection, a5);
  }

  return v13;
}

- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 loggingConnection:(id)a4
{
  return [(PGAssetFeatureBehavioralProcessor *)self initWithGoldAssets:a3 persistedData:MEMORY[0x1E4F1CC08] loggingConnection:a4];
}

@end