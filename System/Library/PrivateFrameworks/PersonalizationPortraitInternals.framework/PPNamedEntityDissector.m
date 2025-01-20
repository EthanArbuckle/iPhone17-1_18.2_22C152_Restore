@interface PPNamedEntityDissector
+ (id)sharedInstance;
- (PPNamedEntityDissector)init;
- (PPNamedEntityDissector)initWithPurgeableGazetteer:(id)a3;
- (id)_collectDataDetectorsWithText:(id)a3 algorithms:(id)a4 isMessagesSource:(BOOL)a5 addNamedEntity:(id)a6;
- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6;
- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6 algorithms:(id)a7;
- (void)_collectAugmentedGazetteerWithText:(id)a3 addNamedEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6;
- (void)_harvestLocationFromEntity:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 enrichment:(id)a6 algorithm:(unsigned __int16)a7;
- (void)_registerForNotifications;
- (void)_resetGazetteer;
- (void)dealloc;
@end

@implementation PPNamedEntityDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardContactsIdentifier, 0);
  objc_storeStrong((id *)&self->_userLanguage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6 algorithms:(id)a7
{
  v142[3] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v78 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = [v12 bundleId];
  v15 = (void *)*MEMORY[0x1E4F8A0A8];
  uint64_t v16 = [(id)*MEMORY[0x1E4F8A0A8] isEqualToString:v14];

  v17 = [v12 bundleId];
  if ([v15 isEqualToString:v17])
  {
  }
  else
  {
    int v18 = [(id)*MEMORY[0x1E4F8A098] isEqualToString:v17];

    double v19 = 0.0;
    if (!v18) {
      goto LABEL_5;
    }
  }
  v20 = +[PPSentiment sharedInstance];
  [v20 sentimentScoreForText:v81];
  double v19 = v21;

LABEL_5:
  v22 = (void *)MEMORY[0x1CB79D060]();
  v141[0] = &unk_1F2568B10;
  v141[1] = &unk_1F2568AF8;
  v142[0] = &unk_1F2568B28;
  v142[1] = &unk_1F2568B40;
  v141[2] = &unk_1F2568B58;
  v142[2] = &unk_1F2568B70;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];
  v24 = +[PPConfiguration sharedInstance];
  v25 = [v12 bundleId];
  v26 = [v12 language];
  v27 = [v24 extractionAlgorithmsForBundleId:v25 sourceLanguage:v26 conservative:0 domain:2];

  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy_;
  v132 = __Block_byref_object_dispose_;
  id v133 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke;
  aBlock[3] = &unk_1E65D4078;
  v124 = &v128;
  id v28 = v12;
  id v119 = v28;
  BOOL v126 = a6;
  char v127 = v16;
  double v125 = v19;
  id v80 = v13;
  id v120 = v80;
  id v74 = v23;
  id v121 = v74;
  id v29 = v27;
  id v122 = v29;
  v123 = self;
  v79 = _Block_copy(aBlock);
  v30 = +[PPConfiguration sharedInstance];
  v31 = [v28 bundleId];
  v32 = [v28 language];
  v33 = [v30 extractionAlgorithmsForBundleId:v31 sourceLanguage:v32 conservative:0 domain:0];

  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_2;
  v111[3] = &unk_1E65D40A0;
  v114 = &v128;
  id v73 = v33;
  id v112 = v73;
  id v34 = v28;
  id v113 = v34;
  BOOL v116 = a6;
  char v117 = v16;
  double v115 = v19;
  v76 = _Block_copy(v111);
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_3;
  v104[3] = &unk_1E65D40C8;
  v107 = &v128;
  id v72 = v29;
  id v105 = v72;
  id v75 = v34;
  id v106 = v75;
  BOOL v109 = a6;
  char v110 = v16;
  double v108 = v19;
  v77 = _Block_copy(v104);
  int v35 = [v80 containsObject:&unk_1F2568AF8];
  v36 = [v75 bundleId];
  LODWORD(v34) = [v36 isEqualToString:*MEMORY[0x1E4F8A0E8]];

  if (!v34)
  {
    if (!v35) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v37 = +[PPConfiguration sharedInstance];
  int v38 = [v37 safariDataDetectorsEnabledForHighMemoryDevices];

  if (v35 & v38) {
LABEL_9:
  }
    id v39 = -[PPNamedEntityDissector _collectDataDetectorsWithText:algorithms:isMessagesSource:addNamedEntity:](self, "_collectDataDetectorsWithText:algorithms:isMessagesSource:addNamedEntity:", v81, v80, v16, v79, v72);
LABEL_10:
  if (v78)
  {
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_4;
    v99[3] = &unk_1E65D40F0;
    v99[4] = self;
    id v100 = v81;
    id v101 = v79;
    id v102 = v76;
    id v103 = v77;
    [v78 enumerateRangesUsingBlock:v99];
  }
  else
  {
    [(PPNamedEntityDissector *)self _collectAugmentedGazetteerWithText:v81 addNamedEntity:v79 addTopic:v76 addLocation:v77];
  }
  id v82 = (id)objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v84 = [&unk_1F256A400 countByEnumeratingWithState:&v95 objects:v140 count:16];
  if (v84)
  {
    uint64_t v83 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v96 != v83) {
          objc_enumerationMutation(&unk_1F256A400);
        }
        v86 = objc_msgSend((id)v129[5], "objectForKeyedSubscript:", *(void *)(*((void *)&v95 + 1) + 8 * i), v72);
        v40 = v86;
        if (v86)
        {
          objc_msgSend(v82, "addObject:");
          v41 = pp_default_log_handle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [v86 entities];
            uint64_t v43 = [v42 count];
            v44 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(v86, "entityAlgorithm"));
            *(_DWORD *)buf = 134218242;
            uint64_t v137 = v43;
            __int16 v138 = 2112;
            v139 = v44;
            _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector: entitiesInPlainText detected %lu entities with algorithm \"%@\".", buf, 0x16u);
          }
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          v45 = [v86 entities];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v91 objects:v135 count:16];
          if (v46)
          {
            uint64_t v47 = *(void *)v92;
            do
            {
              for (uint64_t j = 0; j != v46; ++j)
              {
                if (*(void *)v92 != v47) {
                  objc_enumerationMutation(v45);
                }
                v49 = *(void **)(*((void *)&v91 + 1) + 8 * j);
                v50 = pp_default_log_handle();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  v52 = (void *)MEMORY[0x1E4F89E90];
                  v53 = [v49 item];
                  v54 = objc_msgSend(v52, "describeCategory:", objc_msgSend(v53, "category"));
                  *(_DWORD *)buf = 138739971;
                  uint64_t v137 = (uint64_t)v54;
                  _os_log_debug_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEBUG, "   category: %{sensitive}@", buf, 0xCu);
                }
                v51 = pp_default_log_handle();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  v55 = [v49 item];
                  v56 = [v55 name];
                  *(_DWORD *)buf = 138739971;
                  uint64_t v137 = (uint64_t)v56;
                  _os_log_debug_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_DEBUG, "       name: %{sensitive}@", buf, 0xCu);
                }
              }
              uint64_t v46 = [v45 countByEnumeratingWithState:&v91 objects:v135 count:16];
            }
            while (v46);
          }

          v57 = [v86 topics];
          BOOL v58 = [v57 count] == 0;

          if (!v58)
          {
            v59 = pp_default_log_handle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              v60 = [v86 topics];
              uint64_t v61 = [v60 count];
              v62 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v86, "topicAlgorithm"));
              *(_DWORD *)buf = 134218242;
              uint64_t v137 = v61;
              __int16 v138 = 2112;
              v139 = v62;
              _os_log_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector: entitiesInPlainText detected %lu topics with algorithm \"%@\".", buf, 0x16u);
            }
          }
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          v63 = [v86 topics];
          uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v134 count:16];
          if (v64)
          {
            uint64_t v65 = *(void *)v88;
            do
            {
              for (uint64_t k = 0; k != v64; ++k)
              {
                if (*(void *)v88 != v65) {
                  objc_enumerationMutation(v63);
                }
                v67 = *(void **)(*((void *)&v87 + 1) + 8 * k);
                v68 = pp_default_log_handle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  v69 = [v67 item];
                  v70 = [v69 topicIdentifier];
                  *(_DWORD *)buf = 138739971;
                  uint64_t v137 = (uint64_t)v70;
                  _os_log_debug_impl(&dword_1CA9A8000, v68, OS_LOG_TYPE_DEBUG, "  %{sensitive}@", buf, 0xCu);
                }
              }
              uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v134 count:16];
            }
            while (v64);
          }

          v40 = v86;
        }
      }
      uint64_t v84 = [&unk_1F256A400 countByEnumeratingWithState:&v95 objects:v140 count:16];
    }
    while (v84);
  }

  _Block_object_dispose(&v128, 8);
  return v82;
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  v10 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    v10 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  v14 = [NSNumber numberWithUnsignedInteger:a5];
  v15 = [v10 objectForKeyedSubscript:v14];

  if (!v15)
  {
    v15 = objc_opt_new();
    uint64_t v16 = objc_opt_new();
    [v15 setEntities:v16];

    v17 = objc_opt_new();
    [v15 setTopics:v17];

    [v15 setSource:*(void *)(a1 + 32)];
    [v15 setEntityAlgorithm:a5];
    [v15 setTopicAlgorithm:0];
    [v15 setCloudSync:*(unsigned __int8 *)(a1 + 88)];
    int v18 = (double *)MEMORY[0x1E4F8A188];
    if (!*(unsigned char *)(a1 + 89)) {
      int v18 = (double *)MEMORY[0x1E4F8A180];
    }
    [v15 setDecayRate:*v18];
    [v15 setSentimentScore:*(double *)(a1 + 80)];
    double v19 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v20 = [NSNumber numberWithUnsignedInteger:a5];
    [v19 setObject:v15 forKeyedSubscript:v20];
  }
  float v21 = *(void **)(a1 + 40);
  v22 = [NSNumber numberWithUnsignedInteger:a5];
  LODWORD(v21) = [v21 containsObject:v22];

  if (v21)
  {
    context = (void *)MEMORY[0x1CB79D060]();
    id v23 = objc_alloc(MEMORY[0x1E4F89E90]);
    v24 = [MEMORY[0x1E4F1CA20] currentLocale];
    v25 = [v24 languageCode];
    id v26 = v8;
    v27 = (void *)[v23 initWithName:v8 category:a3 dynamicCategory:v9 language:v25];

    id v28 = [v15 entities];
    id v29 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v27 score:0.0];
    v30 = [v28 arrayByAddingObject:v29];
    [v15 setEntities:v30];

    v31 = [*(id *)(a1 + 48) allKeys];
    v32 = [NSNumber numberWithUnsignedInteger:a5];
    LODWORD(v29) = [v31 containsObject:v32];

    if (v29)
    {
      v33 = *(void **)(a1 + 48);
      id v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a5, context);
      int v35 = [v33 objectForKeyedSubscript:v34];
      unsigned __int16 v36 = [v35 unsignedLongValue];

      v37 = *(void **)(a1 + 56);
      uint64_t v38 = v36;
      id v39 = [NSNumber numberWithUnsignedShort:v38];
      LODWORD(v37) = [v37 containsObject:v39];

      if (v37) {
        [*(id *)(a1 + 64) _harvestLocationFromEntity:v26 category:a3 dynamicCategory:v9 enrichment:v15 algorithm:v38];
      }
    }

    id v8 = v26;
  }

  return v15;
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
  id v13 = [v8 objectForKeyedSubscript:v12];

  v14 = *(void **)(a1 + 32);
  v15 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(v14) = [v14 containsObject:v15];

  if (v14)
  {
    if (!v13)
    {
      id v13 = objc_opt_new();
      uint64_t v16 = objc_opt_new();
      [v13 setEntities:v16];

      v17 = objc_opt_new();
      [v13 setTopics:v17];

      [v13 setSource:*(void *)(a1 + 40)];
      [v13 setEntityAlgorithm:a4];
      [v13 setCloudSync:*(unsigned __int8 *)(a1 + 64)];
      int v18 = (double *)MEMORY[0x1E4F8A188];
      if (!*(unsigned char *)(a1 + 65)) {
        int v18 = (double *)MEMORY[0x1E4F8A180];
      }
      [v13 setDecayRate:*v18];
      [v13 setSentimentScore:*(double *)(a1 + 56)];
      double v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v20 = [NSNumber numberWithUnsignedInteger:a3];
      [v19 setObject:v13 forKeyedSubscript:v20];
    }
    [v13 setTopicAlgorithm:a3];
    float v21 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v7];
    v22 = (void *)MEMORY[0x1CB79D060]();
    id v23 = [v13 topics];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v21 score:0.0];
    v25 = [v23 arrayByAddingObject:v24];

    [v13 setTopics:v25];

    id v26 = v13;
  }
  else
  {
    id v26 = v13;
  }

  return v26;
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  v14 = [NSNumber numberWithUnsignedInteger:a5];
  v15 = [v10 objectForKeyedSubscript:v14];

  uint64_t v16 = *(void **)(a1 + 32);
  v17 = [NSNumber numberWithUnsignedShort:a3];
  LOBYTE(v16) = [v16 containsObject:v17];

  if (v16)
  {
    if (!v15)
    {
      v15 = objc_opt_new();
      int v18 = objc_opt_new();
      [v15 setEntities:v18];

      double v19 = objc_opt_new();
      [v15 setTopics:v19];

      [v15 setSource:*(void *)(a1 + 40)];
      [v15 setEntityAlgorithm:a5];
      [v15 setCloudSync:*(unsigned __int8 *)(a1 + 64)];
      v20 = (double *)MEMORY[0x1E4F8A188];
      if (!*(unsigned char *)(a1 + 65)) {
        v20 = (double *)MEMORY[0x1E4F8A180];
      }
      [v15 setDecayRate:*v20];
      [v15 setSentimentScore:*(double *)(a1 + 56)];
      float v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v22 = [NSNumber numberWithUnsignedShort:a3];
      [v21 setObject:v15 forKeyedSubscript:v22];
    }
    id v23 = +[PPLocalLocationStore scoredLocationFromName:v9 category:a4 score:1.0 sentimentScore:0.0];
    [v15 addLocation:v23 algorithm:a3];
    id v24 = v15;
  }
  else
  {
    id v24 = v15;
  }

  return v24;
}

void __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x1CB79D060]();
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _collectAugmentedGazetteerWithText:v8 addNamedEntity:*(void *)(a1 + 48) addTopic:*(void *)(a1 + 56) addLocation:*(void *)(a1 + 64)];
}

- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[PPConfiguration sharedInstance];
  v14 = [v10 bundleId];
  v15 = [v10 language];
  uint64_t v16 = [v13 extractionAlgorithmsForBundleId:v14 sourceLanguage:v15 conservative:0 domain:1];
  v17 = [(PPNamedEntityDissector *)self entitiesInPlainText:v12 eligibleRegions:v11 source:v10 cloudSync:v6 algorithms:v16];

  return v17;
}

- (void)_harvestLocationFromEntity:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 enrichment:(id)a6 algorithm:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a3;
  id v10 = a6;
  if (+[PPLocalLocationStore isLocationRelevantNamedEntityCategory:a4])
  {
    id v11 = +[PPLocalLocationStore scoredLocationFromName:category:score:sentimentScore:](PPLocalLocationStore, "scoredLocationFromName:category:score:sentimentScore:", v12, +[PPLocalLocationStore namedEntityCategoryToLocationCategory:a4], 1.0, 0.0);
    [v10 addLocation:v11 algorithm:v7];
  }
}

- (id)_collectDataDetectorsWithText:(id)a3 algorithms:(id)a4 isMessagesSource:(BOOL)a5 addNamedEntity:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v46 = a4;
  id v42 = a6;
  id v9 = (void *)MEMORY[0x1E4F5DF60];
  id v10 = objc_opt_new();
  uint64_t v43 = v8;
  id v11 = [v9 detectionsInPlainText:v8 baseDate:v10];

  id v40 = (id)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    uint64_t v41 = *(void *)v54;
    do
    {
      uint64_t v15 = 0;
      uint64_t v44 = v13;
      do
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1CB79D060]();
        if ([v16 matchType] == 1
          && [v46 containsObject:&unk_1F2568AF8])
        {
          v45 = v17;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PPNamedEntityDissector__collectDataDetectorsWithText_algorithms_isMessagesSource_addNamedEntity___block_invoke;
          aBlock[3] = &unk_1E65D4050;
          id v52 = v42;
          int v18 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
          double v19 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v20 = [v16 range];
          v22 = objc_msgSend(v43, "substringWithRange:", v20, v21);
          id v23 = SGPostalAddressParse();

          uint64_t v24 = [v23 objectForKeyedSubscript:@"Street"];
          uint64_t v25 = [v23 objectForKeyedSubscript:@"City"];
          id v26 = [v23 objectForKeyedSubscript:@"State"];
          v27 = [v23 objectForKeyedSubscript:@"ZIP"];
          id v28 = [v23 objectForKeyedSubscript:@"Country"];
          uint64_t v29 = v18[2](v18, v24, 8);
          id v30 = (id)((uint64_t (*)(void *, uint64_t, uint64_t))v18[2])(v18, v25, 9);
          id v31 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v26, 10);
          id v32 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v28, 11);
          v49 = (void *)v25;
          v50 = (void *)v24;
          v33 = +[PPNamedEntitySupport fullAddressForStreetAddress:v24 city:v25 state:v26 postalCode:v27 country:v28];
          id v34 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v33, 12);
          v48 = (void *)v29;
          if (v29)
          {
            int v35 = [MEMORY[0x1E4F89E68] placemarkWithLocation:0 name:0 thoroughfare:v50 subthoroughFare:0 locality:v25 subLocality:0 administrativeArea:v26 subAdministrativeArea:0 postalCode:v27 countryCode:0 country:v28 inlandWater:0 ocean:0 areasOfInterest:0];
            unsigned __int16 v36 = v26;
            v37 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v35 category:0 mostRelevantRecord:0];
            uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v37 score:1.0 sentimentScore:0.0];
            [v48 addLocation:v38 algorithm:4];

            id v26 = v36;
          }

          uint64_t v14 = v41;
          uint64_t v13 = v44;
          v17 = v45;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v13);
  }

  return v40;
}

uint64_t __99__PPNamedEntityDissector__collectDataDetectorsWithText_algorithms_isMessagesSource_addNamedEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length]) {
    id v4 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return 0;
}

- (void)_collectAugmentedGazetteerWithText:(id)a3 addNamedEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  locuint64_t k = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke;
  v19[3] = &unk_1E65D4028;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(_PASLock *)lock runWithLockAcquired:v19];
}

void __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 purgeableGazetteer];
  id v4 = [v3 result];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_2;
  v10[3] = &unk_1E65D3FB0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_3;
  v8[3] = &unk_1E65D3FD8;
  id v9 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_4;
  v6[3] = &unk_1E65D4000;
  id v7 = *(id *)(a1 + 56);
  [v4 iterExtractionsForText:v5 addEntity:v10 addTopic:v8 addLocation:v6];
}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_2(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_3(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_4(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerForNotifications
{
  id location = 0;
  objc_initWeak(&location, self);
  if (_getNotificationDispatchQueue__pasOnceToken3 != -1) {
    dispatch_once(&_getNotificationDispatchQueue__pasOnceToken3, &__block_literal_global_191);
  }
  id v3 = (id)_getNotificationDispatchQueue__pasExprOnceResult;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__PPNamedEntityDissector__registerForNotifications__block_invoke;
  handler[3] = &unk_1E65D3F88;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.MobileAsset.LinguisticData.ma.new-asset-installed", &self->_linguisticDataNotificationToken, v3, handler);

  id v4 = +[PPTrialWrapper sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PPNamedEntityDissector__registerForNotifications__block_invoke_2;
  v6[3] = &unk_1E65DC540;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v4 addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL" block:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__PPNamedEntityDissector__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resetGazetteer];
    id WeakRetained = v2;
  }
}

void __51__PPNamedEntityDissector__registerForNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resetGazetteer];
    id WeakRetained = v2;
  }
}

- (void)_resetGazetteer
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_93];
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector resetting gazetteer based on an asset update.", v3, 2u);
  }
}

void __41__PPNamedEntityDissector__resetGazetteer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F93B60];
  id v3 = a2;
  id v4 = (id)[[v2 alloc] initWithBlock:&__block_literal_global_188 idleTimeout:240.0];
  [v3 setPurgeableGazetteer:v4];
}

- (void)dealloc
{
  int linguisticDataNotificationToken = self->_linguisticDataNotificationToken;
  if (linguisticDataNotificationToken) {
    notify_cancel(linguisticDataNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)PPNamedEntityDissector;
  [(PPNamedEntityDissector *)&v4 dealloc];
}

- (PPNamedEntityDissector)init
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_188 idleTimeout:240.0];
  objc_super v4 = [(PPNamedEntityDissector *)self initWithPurgeableGazetteer:v3];

  return v4;
}

- (PPNamedEntityDissector)initWithPurgeableGazetteer:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PPNamedEntityDissector;
  id v5 = [(PPNamedEntityDissector *)&v19 init];
  BOOL v6 = v5;
  if (v5)
  {
    [(PPNamedEntityDissector *)v5 _registerForNotifications];
    id v7 = objc_opt_new();
    [v7 setPurgeableGazetteer:v4];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v7];
    locuint64_t k = v6->_lock;
    v6->_locuint64_t k = (_PASLock *)v8;

    id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v11 = [v10 languageCode];
    userLanguage = v6->_userLanguage;
    v6->_userLanguage = (NSString *)v11;

    id v13 = +[PPConfiguration sharedInstance];
    v6->_userIsMultilingual = [v13 isMultilingual];

    uint64_t v14 = +[PPLocalContactStore defaultStore];
    id v15 = [v14 meCard];
    uint64_t v16 = [v15 identifier];
    meCardContactsIdentifier = v6->_meCardContactsIdentifier;
    v6->_meCardContactsIdentifier = (NSString *)v16;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __40__PPNamedEntityDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end