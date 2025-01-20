@interface PSFeatureCache
@end

@implementation PSFeatureCache

void __69___PSFeatureCache_initWithPredictionContext_candidates_caches_store___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Timer has triggered, refreshing cache", v3, 2u);
    }

    [WeakRetained invalidateAndRefreshCache];
  }
}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 candidateForDeduping];
}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 candidateIdentifier];
}

id __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_153(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 candidateForDeduping];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  v8 = [v3 candidateIdentifier];
  v9 = [*(id *)(*(void *)(a1 + 40) + 32) cache];
  v10 = [v9 objectForKeyedSubscript:v8];
  if (v10)
  {

LABEL_7:
    goto LABEL_8;
  }
  v11 = [*(id *)(*(void *)(a1 + 40) + 32) bucketSums];
  v12 = [v11 objectForKeyedSubscript:v8];
  if (v12)
  {

    goto LABEL_7;
  }
  v14 = [*(id *)(*(void *)(a1 + 40) + 32) bucketHasEver];
  v15 = [v14 objectForKeyedSubscript:v8];

  if (!v15)
  {
    id v7 = v8;
    goto LABEL_9;
  }
LABEL_8:
  id v7 = 0;
LABEL_9:

LABEL_10:

  return v7;
}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  if (v4
    && ([v3 timestamp],
        double v6 = v5,
        [*(id *)(a1 + 32) timeIntervalSinceReferenceDate],
        v6 >= v7))
  {
    v9 = *(void **)(a1 + 40);
    v10 = [v4 itemIdentifier];
    uint64_t v8 = [v9 containsObject:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_3(id *a1, void *a2)
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 itemIdentifier];
  if (v4) {
    double v5 = (__CFString *)v4;
  }
  else {
    double v5 = @"self";
  }
  double v6 = [a1[4] objectForKeyedSubscript:v5];
  v111 = a1;
  if (v6)
  {
    double v7 = [a1[5] objectForKeyedSubscript:v6];
    if (v7)
    {
LABEL_6:

      goto LABEL_8;
    }
    uint64_t v8 = [a1[6] objectForKeyedSubscript:v6];

    if (!v8)
    {
      double v7 = objc_opt_new();
      [a1[5] setObject:v7 forKeyedSubscript:v6];
      goto LABEL_6;
    }
  }
LABEL_8:
  v9 = [a1[7] objectForKeyedSubscript:v5];

  if (!v9)
  {
    v10 = objc_opt_new();
    [a1[7] setObject:v10 forKeyedSubscript:v5];
  }
  v11 = [a1[8] objectForKeyedSubscript:v5];

  if (!v11)
  {
    v12 = objc_opt_new();
    [a1[8] setObject:v12 forKeyedSubscript:v5];
  }
  v13 = [a1[9] objectForKeyedSubscript:v5];

  if (!v13)
  {
    v14 = objc_opt_new();
    [a1[9] setObject:v14 forKeyedSubscript:v5];
  }
  v15 = [v3 featureValue];

  if (v15)
  {
    v16 = [v3 featureValue];
    v17 = [v16 histogramValue];

    v114 = v5;
    if (v17)
    {
      [v3 featureName];
      v18 = BMMLSEDurableFeatureStorefeatureNameAsString();
      v19 = +[_PSHistogramFeatures computeFactorNameForFeature:v18];
      v20 = [v111[7] objectForKeyedSubscript:v5];
      v21 = [v20 objectForKeyedSubscript:v19];

      if (!v21)
      {
        v22 = objc_opt_new();
        v23 = [v111[7] objectForKeyedSubscript:v5];
        [v23 setObject:v22 forKeyedSubscript:v19];
      }
      v24 = [v111[8] objectForKeyedSubscript:v5];
      v25 = [v24 objectForKeyedSubscript:v19];

      if (!v25)
      {
        v26 = objc_opt_new();
        v27 = [v111[8] objectForKeyedSubscript:v5];
        [v27 setObject:v26 forKeyedSubscript:v19];
      }
      v28 = [v111[9] objectForKeyedSubscript:v5];
      v29 = [v28 objectForKeyedSubscript:v19];

      if (!v29)
      {
        v30 = objc_opt_new();
        v31 = [v111[9] objectForKeyedSubscript:v5];
        [v31 setObject:v30 forKeyedSubscript:v19];
      }
      v32 = [v111[10] objectForKeyedSubscript:v19];

      if (!v32)
      {
        v33 = objc_opt_new();
        [v111[10] setObject:v33 forKeyedSubscript:v19];
      }
      v34 = [v111[11] objectForKeyedSubscript:v19];

      if (!v34)
      {
        v35 = objc_opt_new();
        [v111[11] setObject:v35 forKeyedSubscript:v19];
      }
      v36 = [v3 featureValue];
      v37 = [v36 histogramValue];
      v38 = [v37 bucketList];

      if (v38)
      {
        v101 = v18;
        v102 = v3;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        v100 = v38;
        id obj = v38;
        v39 = v111;
        uint64_t v106 = [obj countByEnumeratingWithState:&v120 objects:v125 count:16];
        if (v106)
        {
          uint64_t v105 = *(void *)v121;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v121 != v105) {
                objc_enumerationMutation(obj);
              }
              uint64_t v108 = v40;
              v41 = *(void **)(*((void *)&v120 + 1) + 8 * v40);
              v42 = objc_msgSend(v41, "counts", v100, v101, v102);
              v107 = v41;
              uint64_t v43 = [v41 bucketName];
              v44 = [v39[10] objectForKeyedSubscript:v19];
              [v44 addObject:v43];

              v45 = [v39[11] objectForKeyedSubscript:v19];
              v46 = [v45 objectForKeyedSubscript:v43];

              if (!v46)
              {
                v47 = objc_opt_new();
                v48 = [v39[11] objectForKeyedSubscript:v19];
                [v48 setObject:v47 forKeyedSubscript:v43];
              }
              v115 = (void *)v43;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              id v109 = v42;
              uint64_t v112 = [v109 countByEnumeratingWithState:&v116 objects:v124 count:16];
              if (v112)
              {
                uint64_t v110 = *(void *)v117;
                do
                {
                  uint64_t v49 = 0;
                  do
                  {
                    if (*(void *)v117 != v110) {
                      objc_enumerationMutation(v109);
                    }
                    v50 = *(void **)(*((void *)&v116 + 1) + 8 * v49);
                    [v50 interval];
                    v51 = BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString();
                    v52 = [v111[7] objectForKeyedSubscript:v114];
                    v53 = [v52 objectForKeyedSubscript:v19];
                    v54 = [v53 objectForKeyedSubscript:v51];

                    if (!v54)
                    {
                      v55 = objc_opt_new();
                      v56 = [v111[7] objectForKeyedSubscript:v114];
                      v57 = [v56 objectForKeyedSubscript:v19];
                      [v57 setObject:v55 forKeyedSubscript:v51];
                    }
                    v58 = [v111[8] objectForKeyedSubscript:v114];
                    v59 = [v58 objectForKeyedSubscript:v19];
                    v60 = [v59 objectForKey:v51];

                    if (!v60)
                    {
                      v61 = [v111[8] objectForKeyedSubscript:v114];
                      v62 = [v61 objectForKeyedSubscript:v19];
                      [v62 setObject:&unk_1EF6757C8 forKeyedSubscript:v51];
                    }
                    uint64_t v113 = v49;
                    v63 = [v111[11] objectForKeyedSubscript:v19];
                    v64 = [v63 objectForKeyedSubscript:v115];
                    v65 = [v64 objectForKeyedSubscript:v51];

                    if (!v65)
                    {
                      v66 = [v111[11] objectForKeyedSubscript:v19];
                      v67 = [v66 objectForKeyedSubscript:v115];
                      [v67 setObject:&unk_1EF6757C8 forKeyedSubscript:v51];
                    }
                    v68 = NSNumber;
                    v69 = [v111[8] objectForKeyedSubscript:v114];
                    v70 = [v69 objectForKeyedSubscript:v19];
                    v71 = [v70 objectForKeyedSubscript:v51];
                    v72 = objc_msgSend(v68, "numberWithUnsignedInt:", objc_msgSend(v50, "value") + objc_msgSend(v71, "intValue"));
                    v73 = [v111[8] objectForKeyedSubscript:v114];
                    v74 = [v73 objectForKeyedSubscript:v19];
                    [v74 setObject:v72 forKeyedSubscript:v51];

                    v75 = NSNumber;
                    v76 = [v111[11] objectForKeyedSubscript:v19];
                    v77 = [v76 objectForKeyedSubscript:v115];
                    v78 = [v77 objectForKeyedSubscript:v51];
                    v79 = objc_msgSend(v75, "numberWithUnsignedInt:", objc_msgSend(v50, "value") + objc_msgSend(v78, "intValue"));
                    v80 = [v111[11] objectForKeyedSubscript:v19];
                    v81 = [v80 objectForKeyedSubscript:v115];
                    [v81 setObject:v79 forKeyedSubscript:v51];

                    v82 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v50, "value"));
                    v83 = [v111[7] objectForKeyedSubscript:v114];
                    v84 = [v83 objectForKeyedSubscript:v19];
                    v85 = [v84 objectForKeyedSubscript:v51];
                    [v85 setObject:v82 forKeyedSubscript:v115];

                    uint64_t v49 = v113 + 1;
                  }
                  while (v112 != v113 + 1);
                  uint64_t v112 = [v109 countByEnumeratingWithState:&v116 objects:v124 count:16];
                }
                while (v112);
              }

              v86 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v107, "hasEver"));
              v39 = v111;
              double v5 = v114;
              v87 = [v111[9] objectForKeyedSubscript:v114];
              v88 = [v87 objectForKeyedSubscript:v19];
              [v88 setObject:v86 forKeyedSubscript:v115];

              uint64_t v40 = v108 + 1;
            }
            while (v108 + 1 != v106);
            uint64_t v106 = [obj countByEnumeratingWithState:&v120 objects:v125 count:16];
          }
          while (v106);
        }

        id v3 = v102;
        v38 = v100;
        v18 = v101;
      }
    }
    else if (v6)
    {
      v89 = [v111[5] objectForKeyedSubscript:v6];
      if (v89)
      {
        [v3 featureName];
        v90 = BMMLSEDurableFeatureStorefeatureNameAsString();
        v91 = [v3 featureValue];
        int v92 = [v91 hasIntValue];
        v103 = v6;
        v93 = v3;
        if (v92)
        {
          v94 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v91, "intValue"));
        }
        else
        {
          v94 = 0;
        }
        int v95 = [v91 hasDoubleValue];
        if (v95)
        {
          v96 = NSNumber;
          [v91 doubleValue];
          v97 = objc_msgSend(v96, "numberWithDouble:");
        }
        else
        {
          v97 = 0;
        }
        v98 = [v91 stringValue];
        if ([v91 hasBoolValue])
        {
          v99 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v91, "BOOLValue"));
          [v89 addFeatureWithIntValue:v94 doubleValue:v97 stringValue:v98 BOOLValue:v99 timeBucket:0 forKey:v90];
        }
        else
        {
          [v89 addFeatureWithIntValue:v94 doubleValue:v97 stringValue:v98 BOOLValue:0 timeBucket:0 forKey:v90];
        }

        if (v95) {
        if (v92)
        }

        id v3 = v93;
        double v5 = v114;
        double v6 = v103;
      }
    }
  }
}

void __53___PSFeatureCache_replaceEphemeralFeaturesWithCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v9 = [a2 candidateForDeduping];
  double v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  double v7 = v6;
  if (!v6) {
    double v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v8 = (void *)[v6 mutableCopy];

  [v8 addEntriesFromDictionary:v5];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "Saving features to virtual feature store", buf, 2u);
  }

  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 56));
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) sessionID];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 56));
  id v5 = [*(id *)(a1 + 32) deviceIdentifier];
  double v6 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v5;
    _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "Fetched device identifier %{private}@", buf, 0xCu);
  }

  double v7 = +[_PSCandidate selfCandidate];
  uint64_t v8 = [v3 objectForKeyedSubscript:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37___PSFeatureCache_saveToVirtualStore__block_invoke_186;
  v13[3] = &unk_1E5AE0CD0;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v9;
  uint64_t v15 = v10;
  id v11 = v4;
  id v16 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_DEFAULT, "Finished saving to virtual feature store", buf, 2u);
  }
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_186(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = +[_PSCandidate selfCandidate];
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1A6243860]();
    uint64_t v10 = [[_PSFeatureDictionary alloc] initWithDictionary:v6];
    [(_PSFeatureDictionary *)v10 addEntriesFromDictionary:a1[4] overwrite:0];
    id v11 = objc_opt_new();
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __37___PSFeatureCache_saveToVirtualStore__block_invoke_2;
    v21 = &unk_1E5AE0CA8;
    uint64_t v22 = a1[5];
    id v12 = v11;
    id v23 = v12;
    [(_PSFeatureDictionary *)v10 enumerateKeysAndObjectsUsingBlock:&v18];
    id v13 = objc_alloc(MEMORY[0x1E4F4FED8]);
    id v14 = objc_msgSend(v5, "candidateIdentifier", v18, v19, v20, v21, v22);
    uint64_t v15 = [(id)a1[5] deviceIdentifier];
    id v16 = (void *)[v13 initWithItemIdentifier:v14 featureVersion:0 featureVector:v12 deviceIdentifier:v15 shareSessionIdentifier:a1[6]];

    [*(id *)(a1[5] + 168) sendEvent:v16];
    v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_186_cold_1((uint64_t)v5, v17);
    }
  }
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1A6243860]();
  uint64_t v8 = BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString();
  if (!v8)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_2((uint64_t)v5, v9);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [*(id *)(a1 + 32) privacyMitigateFeatures:v6];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4FEE0]) initWithFeatureName:v8 featureValue:v10 featureItselfVersion:0 featureFreshnessInHours:0 eventVolumeToComputeFeature:0 timeSpentToComputeFeature:0];
    [*(id *)(a1 + 40) addObject:v11];
  }
  else
  {
    uint64_t v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_1((uint64_t)v5, v10);
    }
  }
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_186_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "Sent data to virtual feature store about candidate %@", (uint8_t *)&v2, 0xCu);
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "There is a feature with incorrect type being computed, %@", (uint8_t *)&v2, 0xCu);
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "Unknown feature: %@", (uint8_t *)&v2, 0xCu);
}

@end