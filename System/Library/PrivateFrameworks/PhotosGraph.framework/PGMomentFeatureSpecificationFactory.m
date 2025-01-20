@interface PGMomentFeatureSpecificationFactory
- (PGMomentFeatureSpecificationFactory)initWithSceneTaxonomy:(id)a3 loggingConnection:(id)a4;
- (id)_CLIPTrendsSpecificationsWithProgress:(id)a3;
- (id)_beachROISpecification;
- (id)_excitementAudioSpecification;
- (id)_foodSpecification;
- (id)_mountainROISpecification;
- (id)_natureROISpecification;
- (id)_peopleSpecification;
- (id)_petPersonSpecification;
- (id)_petSpecification;
- (id)_socialGroupSpecification;
- (id)_trendsSpecifications;
- (id)_urbanROISpecification;
- (id)_waterROISpecification;
- (id)allSupportedFeatureTypes;
- (id)defaultPeopleAssetFilter;
- (id)specificationsForFeatureType:(unint64_t)a3 progressReporter:(id)a4;
@end

@implementation PGMomentFeatureSpecificationFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CLIPTextEncoder, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

- (id)_foodSpecification
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGAssetCollectionFeatureDefinition alloc];
  v3 = +[PGCustomFoodieAssetFilter name];
  v12 = v3;
  v4 = objc_alloc_init(PGCustomFoodieAssetFilter);
  v13[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v6 = [(PGAssetCollectionFeatureDefinition *)v2 initWithAssetFilterByName:v5];

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [(PGAssetCollectionFeatureSpecification *)v7 initWithFeatureType:13 featureLabel:@"Food" featureDefinitions:v8 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];

  return v9;
}

- (id)_excitementAudioSpecification
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:8];
  [v2 addIndex:4];
  [v2 addIndex:1];
  v3 = [[PGAudioAssetFilter alloc] initWithAudioClassifications:v2];
  v4 = [PGAssetCollectionFeatureDefinition alloc];
  v5 = +[PGAudioAssetFilter name];
  v13 = v5;
  v14[0] = v3;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v7 = [(PGAssetCollectionFeatureDefinition *)v4 initWithAssetFilterByName:v6];

  v8 = [PGAssetCollectionFeatureSpecification alloc];
  v12 = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v10 = [(PGAssetCollectionFeatureSpecification *)v8 initWithFeatureType:12 featureLabel:@"ExcitementAudio" featureDefinitions:v9 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];

  return v10;
}

- (id)_petPersonSpecification
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [[PGPeopleAssetFilter alloc] initForPetWithMaximumNumberOfOtherFacesPresent:-1];
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  v4 = +[PGPeopleAssetFilter name];
  v12 = v4;
  v13[0] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v6 = [(PGAssetCollectionFeatureDefinition *)v3 initWithAssetFilterByName:v5];

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [(PGAssetCollectionFeatureSpecification *)v7 initWithFeatureType:11 featureLabel:0 featureDefinitions:v8 shouldRunAtMomentIngest:0 shouldCreateFeatureNodeIfNeeded:0];

  return v9;
}

- (id)_socialGroupSpecification
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(PGSocialGroupAssetFilter);
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  v4 = +[PGSocialGroupAssetFilter name];
  v12 = v4;
  v13[0] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v6 = [(PGAssetCollectionFeatureDefinition *)v3 initWithAssetFilterByName:v5];

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [(PGAssetCollectionFeatureSpecification *)v7 initWithFeatureType:2 featureLabel:0 featureDefinitions:v8 shouldRunAtMomentIngest:0 shouldCreateFeatureNodeIfNeeded:0];

  return v9;
}

- (id)_peopleSpecification
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  v4 = +[PGPeopleAssetFilter name];
  v13 = v4;
  v5 = [(PGMomentFeatureSpecificationFactory *)self defaultPeopleAssetFilter];
  v14[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v7 = [(PGAssetCollectionFeatureDefinition *)v3 initWithAssetFilterByName:v6];

  v8 = [PGAssetCollectionFeatureSpecification alloc];
  v12 = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v10 = [(PGAssetCollectionFeatureSpecification *)v8 initWithFeatureType:1 featureLabel:0 featureDefinitions:v9 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:0];

  return v10;
}

- (id)defaultPeopleAssetFilter
{
  id v2 = [[PGPeopleAssetFilter alloc] initWithMaximumNumberOfOtherFacesPresent:4];
  return v2;
}

- (id)_natureROISpecification
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [[PGSceneAssetFilter alloc] initWithPositiveScenes:&unk_1F28D46E0 negativeScenes:&unk_1F28D46F8 sceneTaxonomy:self->_sceneTaxonomy];
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    v5 = +[PGSceneAssetFilter name];
    v15 = v5;
    v16[0] = v3;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v7 = [(PGAssetCollectionFeatureDefinition *)v4 initWithAssetFilterByName:v6];

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v10 = [(PGAssetCollectionFeatureSpecification *)v8 initWithFeatureType:5 featureLabel:0 featureDefinitions:v9 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Nature ROI specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_mountainROISpecification
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [PGSceneAssetFilter alloc];
  v4 = [(PGSceneAssetFilter *)v3 initWithPositiveScenes:&unk_1F28D46C8 negativeScenes:MEMORY[0x1E4F1CBF0] sceneTaxonomy:self->_sceneTaxonomy];
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    v6 = +[PGSceneAssetFilter name];
    v16 = v6;
    v17[0] = v4;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v8 = [(PGAssetCollectionFeatureDefinition *)v5 initWithAssetFilterByName:v7];

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v11 = [(PGAssetCollectionFeatureSpecification *)v9 initWithFeatureType:4 featureLabel:0 featureDefinitions:v10 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Mountain ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_waterROISpecification
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [[PGSceneAssetFilter alloc] initWithPositiveScenes:&unk_1F28D4698 negativeScenes:&unk_1F28D46B0 sceneTaxonomy:self->_sceneTaxonomy];
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    v5 = +[PGSceneAssetFilter name];
    v15 = v5;
    v16[0] = v3;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v7 = [(PGAssetCollectionFeatureDefinition *)v4 initWithAssetFilterByName:v6];

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v10 = [(PGAssetCollectionFeatureSpecification *)v8 initWithFeatureType:7 featureLabel:0 featureDefinitions:v9 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Water ROI specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_urbanROISpecification
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [PGSceneAssetFilter alloc];
  v4 = [(PGSceneAssetFilter *)v3 initWithPositiveScenes:&unk_1F28D4680 negativeScenes:MEMORY[0x1E4F1CBF0] sceneTaxonomy:self->_sceneTaxonomy];
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    v6 = +[PGSceneAssetFilter name];
    v16 = v6;
    v17[0] = v4;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v8 = [(PGAssetCollectionFeatureDefinition *)v5 initWithAssetFilterByName:v7];

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v11 = [(PGAssetCollectionFeatureSpecification *)v9 initWithFeatureType:6 featureLabel:0 featureDefinitions:v10 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Urban ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_beachROISpecification
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [PGSceneAssetFilter alloc];
  v4 = [(PGSceneAssetFilter *)v3 initWithPositiveScenes:&unk_1F28D4668 negativeScenes:MEMORY[0x1E4F1CBF0] sceneTaxonomy:self->_sceneTaxonomy];
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    v6 = +[PGSceneAssetFilter name];
    v16 = v6;
    v17[0] = v4;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v8 = [(PGAssetCollectionFeatureDefinition *)v5 initWithAssetFilterByName:v7];

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v11 = [(PGAssetCollectionFeatureSpecification *)v9 initWithFeatureType:3 featureLabel:0 featureDefinitions:v10 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Beach ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_petSpecification
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [[PGSceneAssetFilter alloc] initWithPositiveScenes:&unk_1F28D4638 negativeScenes:&unk_1F28D4650 sceneTaxonomy:self->_sceneTaxonomy];
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    v5 = +[PGSceneAssetFilter name];
    v15 = v5;
    v16[0] = v3;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v7 = [(PGAssetCollectionFeatureDefinition *)v4 initWithAssetFilterByName:v6];

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v10 = [(PGAssetCollectionFeatureSpecification *)v8 initWithFeatureType:8 featureLabel:@"Pet" featureDefinitions:v9 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Pet specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_CLIPTrendsSpecificationsWithProgress:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v92 = 219;
      *(_WORD *)&v92[4] = 2080;
      *(void *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGMomentFeatureSpecificationFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_58;
  }
  if (!self->_CLIPTextEncoder)
  {
LABEL_58:
    id v63 = 0;
    goto LABEL_71;
  }
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    unint64_t v7 = v6;
    v8 = self->_loggingConnection;
    os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)v8);
    v10 = v8;
    v11 = v10;
    unint64_t v69 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CLIPTrendsMomentFeatureSpecifications", "", buf, 2u);
    }
    os_signpost_id_t spid = v9;
    v71 = v11;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v68 = mach_absolute_time();
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v70 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v86 objects:v97 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      double v15 = 1.0 / (double)v7;
      uint64_t v16 = *(void *)v87;
      double v17 = 0.0;
      id v75 = v12;
      id v76 = v4;
      uint64_t v78 = *(void *)v87;
LABEL_11:
      uint64_t v18 = 0;
      uint64_t v77 = v14;
      while (1)
      {
        if (*(void *)v87 != v16) {
          objc_enumerationMutation(v12);
        }
        v19 = *(void **)(*((void *)&v86 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1D25FED50]();
        v21 = [v19 featureLabel];
        v22 = [v19 positiveQueries];
        v23 = v22;
        if (v21)
        {
          if ([v22 count]) {
            break;
          }
        }
LABEL_47:

        if (++v18 == v14)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v86 objects:v97 count:16];
          if (v14) {
            goto LABEL_11;
          }
          goto LABEL_49;
        }
      }
      v80 = v21;
      v81 = v23;
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v25 = [v19 useAveragedEmbeddingAsNumber];
      int v26 = [v25 BOOLValue];

      context = v20;
      if (v26)
      {
        uint64_t v27 = [MEMORY[0x1E4F8EB20] encodeTextAverage:v81 textEncoder:self->_CLIPTextEncoder];
        if (!v27)
        {
          loggingConnection = self->_loggingConnection;
          v38 = &off_1E68E1000;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] CLIP text encoder failed", buf, 2u);
          }
          id v28 = 0;
          char v36 = 1;
          goto LABEL_34;
        }
        id v28 = (id)v27;
        [v24 addObject:v27];
      }
      else
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v28 = v81;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v96 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v83;
          while (2)
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v83 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v82 + 1) + 8 * i);
              uint64_t v34 = [MEMORY[0x1E4F8EB20] encodeText:v33 textEncoder:self->_CLIPTextEncoder];
              if (!v34)
              {
                v37 = self->_loggingConnection;
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v92 = v33;
                  _os_log_error_impl(&dword_1D1805000, v37, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] CLIP text encoder failed for text query %@", buf, 0xCu);
                }
                char v36 = 1;
                goto LABEL_32;
              }
              v35 = (void *)v34;
              [v24 addObject:v34];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v96 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          char v36 = 0;
LABEL_32:
          id v12 = v75;
          id v4 = v76;
          uint64_t v14 = v77;
          goto LABEL_33;
        }
      }
      char v36 = 0;
LABEL_33:
      v38 = &off_1E68E1000;
LABEL_34:

      double v17 = v15 + v17;
      if ([v4 isCancelledWithProgress:v17])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v92 = 269;
          *(_WORD *)&v92[4] = 2080;
          *(void *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMomentFeatureSpecificationFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        id v63 = 0;
        v5 = v70;
        v60 = v71;
        goto LABEL_69;
      }
      if ((v36 & 1) == 0)
      {
        v39 = [v19 cosineSimilarityThresholdByVersion];
        v40 = (void *)[objc_alloc((Class)v38[191]) initWithPositiveQueryEmbeddings:v24 cosineSimilarityThresholdByVersion:v39];
        if (v40)
        {
          v74 = v39;
          uint64_t v41 = [v19 positiveScenes];
          uint64_t v42 = [v19 negativeScenes];
          v43 = [PGSceneAssetFilter alloc];
          uint64_t v66 = v42;
          v73 = (void *)v42;
          v44 = (void *)v41;
          uint64_t v45 = [(PGSceneAssetFilter *)v43 initWithPositiveScenes:v41 positiveSceneCustomSignalModelBlock:&__block_literal_global_208 secondaryPositiveScenes:MEMORY[0x1E4F1CBF0] positiveDominantScenes:MEMORY[0x1E4F1CBF0] positiveDominantSceneCustomSignalModelBlock:&__block_literal_global_208 positiveSemDevScenes:MEMORY[0x1E4F1CBF0] negativeScenes:v66 sceneTaxonomy:self->_sceneTaxonomy];
          v46 = [PGAssetCollectionFeatureDefinition alloc];
          v47 = [v38[191] name];
          v94[0] = v47;
          v95[0] = v40;
          v48 = (void *)v45;
          v49 = +[PGSceneAssetFilter name];
          v94[1] = v49;
          v95[1] = v45;
          v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
          v51 = [(PGAssetCollectionFeatureDefinition *)v46 initWithAssetFilterByName:v50];

          v52 = [PGAssetCollectionFeatureSpecification alloc];
          v93 = v51;
          v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
          v54 = [(PGAssetCollectionFeatureSpecification *)v52 initWithFeatureType:10 featureLabel:v80 featureDefinitions:v53 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];

          if (v54) {
            [v72 addObject:v54];
          }

          v39 = v74;
          id v12 = v75;
          id v4 = v76;
        }
        else
        {
          v56 = self->_loggingConnection;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v92 = v80;
            _os_log_fault_impl(&dword_1D1805000, v56, OS_LOG_TYPE_FAULT, "Trend configuration '%@' has an invalid CLIP asset filter, disabling", buf, 0xCu);
          }
        }

        uint64_t v14 = v77;
      }

      uint64_t v16 = v78;
      v20 = context;
      v21 = v80;
      v23 = v81;
      goto LABEL_47;
    }
LABEL_49:

    uint64_t v57 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v60 = v71;
    v61 = v71;
    v62 = v61;
    if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v62, OS_SIGNPOST_INTERVAL_END, spid, "CLIPTrendsMomentFeatureSpecifications", "", buf, 2u);
    }

    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v92 = "CLIPTrendsMomentFeatureSpecifications";
      *(_WORD *)&v92[8] = 2048;
      *(double *)&v92[10] = (float)((float)((float)((float)(v57 - v68) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if ([v4 isCancelledWithProgress:1.0])
    {
      v5 = v70;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v92 = 302;
        *(_WORD *)&v92[4] = 2080;
        *(void *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGMomentFeatureSpecificationFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v63 = 0;
    }
    else
    {
      id v63 = v72;
      v5 = v70;
    }
LABEL_69:
  }
  else
  {
    v64 = self->_loggingConnection;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v64, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] No CLIP Trends configurations returned", buf, 2u);
    }
    if ([v4 isCancelledWithProgress:1.0]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v92 = 231;
      *(_WORD *)&v92[4] = 2080;
      *(void *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGMomentFeatureSpecificationFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v63 = 0;
  }

LABEL_71:
  return v63;
}

uint64_t __77__PGMomentFeatureSpecificationFactory__CLIPTrendsSpecificationsWithProgress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 trendsSceneModel];
}

- (id)_trendsSpecifications
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  +[PGTrendsMemoryGenerator trendsConfigurations];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v44;
    id v2 = off_1E68E2000;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v5 = [v4 featureLabel];
        uint64_t v6 = [v4 positiveScenes];
        unint64_t v7 = (void *)v6;
        v8 = (void *)MEMORY[0x1E4F1CBF0];
        if (v6) {
          os_signpost_id_t v9 = (void *)v6;
        }
        else {
          os_signpost_id_t v9 = (void *)MEMORY[0x1E4F1CBF0];
        }
        id v10 = v9;

        uint64_t v11 = [v4 secondaryPositiveScenes];
        id v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = (void *)v11;
        }
        else {
          uint64_t v13 = v8;
        }
        id v14 = v13;

        uint64_t v15 = [v4 positiveDominantScenes];
        uint64_t v16 = (void *)v15;
        if (v15) {
          double v17 = (void *)v15;
        }
        else {
          double v17 = v8;
        }
        id v18 = v17;

        uint64_t v19 = [v4 positiveSemDevScenes];
        v20 = (void *)v19;
        if (v19) {
          v21 = (void *)v19;
        }
        else {
          v21 = v8;
        }
        id v22 = v21;

        uint64_t v23 = [v4 negativeScenes];
        id v24 = (void *)v23;
        if (v23) {
          v25 = (void *)v23;
        }
        else {
          v25 = v8;
        }
        id v26 = v25;

        uint64_t v42 = v22;
        uint64_t v27 = (void *)[objc_alloc(v2[462]) initWithPositiveScenes:v10 positiveSceneCustomSignalModelBlock:&__block_literal_global_50753 secondaryPositiveScenes:v14 positiveDominantScenes:v18 positiveDominantSceneCustomSignalModelBlock:&__block_literal_global_50753 positiveSemDevScenes:v22 negativeScenes:v26 sceneTaxonomy:self->_sceneTaxonomy];

        if (v27)
        {
          id v28 = [PGAssetCollectionFeatureDefinition alloc];
          uint64_t v29 = [(__objc2_class *)v2[462] name];
          v48 = v29;
          v49 = v27;
          uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v31 = [(PGAssetCollectionFeatureDefinition *)v28 initWithAssetFilterByName:v30];

          v32 = [PGAssetCollectionFeatureSpecification alloc];
          v47 = v31;
          uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
          uint64_t v34 = [(PGAssetCollectionFeatureSpecification *)v32 initWithFeatureType:9 featureLabel:v5 featureDefinitions:v33 shouldRunAtMomentIngest:1 shouldCreateFeatureNodeIfNeeded:1];

          [v38 addObject:v34];
          id v2 = off_1E68E2000;
        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v5;
            _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Trend configuration '%@' has an invalid scene asset filter, disabling", buf, 0xCu);
          }
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v40);
  }

  return v38;
}

uint64_t __60__PGMomentFeatureSpecificationFactory__trendsSpecifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 trendsSceneModel];
}

- (id)specificationsForFeatureType:(unint64_t)a3 progressReporter:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(a3)
  {
    case 0uLL:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Attempting to get specification for unknown feature type", v15, 2u);
      }
      break;
    case 1uLL:
      uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)self _peopleSpecification];
      goto LABEL_22;
    case 2uLL:
      uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)self _socialGroupSpecification];
      goto LABEL_22;
    case 3uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _beachROISpecification];
      goto LABEL_12;
    case 4uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _mountainROISpecification];
      goto LABEL_12;
    case 5uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _natureROISpecification];
      goto LABEL_12;
    case 6uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _urbanROISpecification];
      goto LABEL_12;
    case 7uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _waterROISpecification];
      goto LABEL_12;
    case 8uLL:
      uint64_t v10 = [(PGMomentFeatureSpecificationFactory *)self _petSpecification];
LABEL_12:
      uint64_t v11 = (void *)v10;
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_23;
    case 9uLL:
      id v12 = [(PGMomentFeatureSpecificationFactory *)self _trendsSpecifications];
      if (v12)
      {
        uint64_t v13 = [(PGMomentFeatureSpecificationFactory *)self _trendsSpecifications];
        [v7 addObjectsFromArray:v13];
      }
      break;
    case 0xAuLL:
      uint64_t v11 = [(PGMomentFeatureSpecificationFactory *)self _CLIPTrendsSpecificationsWithProgress:v6];
      if (v11) {
        [v7 addObjectsFromArray:v11];
      }
      goto LABEL_24;
    case 0xBuLL:
      uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)self _petPersonSpecification];
      goto LABEL_22;
    case 0xCuLL:
      uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)self _excitementAudioSpecification];
      goto LABEL_22;
    case 0xDuLL:
      uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)self _foodSpecification];
LABEL_22:
      uint64_t v11 = (void *)v9;
LABEL_23:
      [v7 addObject:v11];
LABEL_24:

      break;
    default:
      break;
  }

  return v7;
}

- (id)allSupportedFeatureTypes
{
  id v2 = [MEMORY[0x1E4F28E60] indexSet];
  [v2 addIndex:1];
  [v2 addIndex:2];
  [v2 addIndex:3];
  [v2 addIndex:4];
  [v2 addIndex:5];
  [v2 addIndex:7];
  [v2 addIndex:8];
  [v2 addIndex:13];
  [v2 addIndex:9];
  [v2 addIndex:10];
  [v2 addIndex:11];
  [v2 addIndex:12];
  return v2;
}

- (PGMomentFeatureSpecificationFactory)initWithSceneTaxonomy:(id)a3 loggingConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PGMomentFeatureSpecificationFactory;
  uint64_t v9 = [(PGMomentFeatureSpecificationFactory *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneTaxonomy, a3);
    p_loggingConnection = (NSObject **)&v10->_loggingConnection;
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    id v22 = 0;
    id v12 = objc_msgSend(MEMORY[0x1E4F5D058], "CLIPTextEncoderV3ConfigurationForRevision:error:", objc_msgSend(MEMORY[0x1E4F8EB20], "requiredCSUCLIPTextEncoderRevision"), &v22);
    id v13 = v22;
    if (v13)
    {
      id v14 = *p_loggingConnection;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      uint64_t v15 = "[PGMomentFeatureSpecificationFactory] CLIP model CSUCLIPTextEncoderV3Configuration creation failed with error %@";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
    }
    else
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F5D050]) initWithConfiguration:v12];
      CLIPTextEncoder = v10->_CLIPTextEncoder;
      v10->_CLIPTextEncoder = (CSUCLIPTextEncoderV3 *)v18;

      if (v10->_CLIPTextEncoder) {
        goto LABEL_8;
      }
      v20 = *p_loggingConnection;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      uint64_t v15 = "[PGMomentFeatureSpecificationFactory] CLIP model from CSUCLIPTextEncoderV3 is nil";
      uint64_t v16 = v20;
      uint32_t v17 = 2;
    }
    _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

@end