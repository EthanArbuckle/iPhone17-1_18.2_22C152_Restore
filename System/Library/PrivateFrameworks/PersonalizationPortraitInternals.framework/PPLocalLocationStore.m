@interface PPLocalLocationStore
+ (BOOL)isLocationRelevantNamedEntityCategory:(unint64_t)a3;
+ (id)defaultStore;
+ (id)locationFromMapItem:(id)a3;
+ (id)locationFromMapItemDictionary:(id)a3;
+ (id)locationNamedEntityToPPScoredLocation:(id)a3;
+ (id)scoredLocationFromName:(id)a3 category:(unsigned __int16)a4 score:(double)a5 sentimentScore:(double)a6;
+ (unsigned)namedEntityCategoryToLocationCategory:(unint64_t)a3;
+ (unsigned)routineLOITypeToLocationCategory:(int64_t)a3;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)deleteAllLocationFeedbackCountsOlderThanDate:(id)a3;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8;
- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedLocationFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (BOOL)useScoreInterpreter;
- (PPLocalLocationStore)initWithStorage:(id)a3 trialWrapper:(id)a4;
- (PPLocationStorage)storage;
- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5;
- (id)_init;
- (id)_loadScoringMLModel;
- (id)homeOrWorkAddresses;
- (id)locationForHome;
- (id)locationForWork;
- (id)locationRecordOfCategory:(unsigned __int16)a3;
- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)rankedLocationsWithQuery:(id)a3 clientProcessName:(id)a4 error:(id *)a5;
- (void)processFeedback:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPLocalLocationStore

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v11 = 0;
  unint64_t v10 = 0;
  BOOL v8 = [(PPLocationStorage *)self->_storage deleteAllLocationsFromSourcesWithBundleId:a3 groupIds:a4 atLeastOneLocationRemoved:&v11 deletedCount:&v10 error:a6];
  if (v11)
  {
    [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_232];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v10 = 0;
  unint64_t v9 = 0;
  BOOL v7 = [(PPLocationStorage *)self->_storage deleteAllLocationsFromSourcesWithBundleId:a3 atLeastOneLocationRemoved:&v10 deletedCount:&v9 error:a5];
  if (v10)
  {
    [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_228];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a4) {
    *a4 = v9;
  }
  return v7;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_27332);
  if (!defaultStore_instance_27333)
  {
    uint64_t v3 = [objc_alloc((Class)a1) _init];
    v4 = (void *)defaultStore_instance_27333;
    defaultStore_instance_27333 = v3;

    if (!defaultStore_instance_27333)
    {
      v5 = pp_locations_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPLocalLocationStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v8, 2u);
      }
    }
  }
  id v6 = (id)defaultStore_instance_27333;
  pthread_mutex_unlock(&defaultStore_lock_27332);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (BOOL)useScoreInterpreter
{
  return self->_useScoreInterpreter;
}

- (PPLocationStorage)storage
{
  return self->_storage;
}

- (void)processFeedback:(id)a3
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  id v145 = a3;
  id v3 = [v145 feedbackItems];
  v148 = v3;
  if (self)
  {
    v4 = v3;
    v5 = objc_opt_new();
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v180 objects:buf count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v181;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v181 != v8) {
            objc_enumerationMutation(v6);
          }
          char v10 = *(void **)(*((void *)&v180 + 1) + 8 * i);
          char v11 = (void *)MEMORY[0x1CB79D060]();
          v12 = [v10 itemString];
          v13 = [v12 lowercaseString];

          v14 = [v5 objectForKeyedSubscript:v13];
          LODWORD(v12) = v14 == 0;

          if (v12)
          {
            v15 = objc_opt_new();
            [v5 setObject:v15 forKeyedSubscript:v13];
          }
          v16 = [v5 objectForKeyedSubscript:v13];
          [v16 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v180 objects:buf count:16];
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }

  id v17 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v18 = [v5 allKeys];
  v19 = (void *)[v17 initWithArray:v18];

  v20 = objc_opt_new();
  v141 = objc_opt_new();
  v21 = [v145 timestamp];
  [v141 setScoringDate:v21];

  v22 = [v145 timestamp];
  [v141 setToDate:v22];

  v23 = [v145 clientBundleId];
  v24 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v23, 2);
  [v141 setExcludingSourceBundleIds:v24];

  id v160 = 0;
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __40__PPLocalLocationStore_processFeedback___block_invoke;
  v156[3] = &unk_1E65DC780;
  id v133 = v20;
  id v157 = v133;
  id v25 = v5;
  id v158 = v25;
  id v132 = v19;
  id v159 = v132;
  BOOL v26 = [(PPLocalLocationStore *)self iterLocationRecordsWithQuery:v141 error:&v160 block:v156];
  id v128 = v160;
  if (v26)
  {
    if (![v133 count])
    {
LABEL_95:
      v60 = objc_opt_new();
      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id v109 = v132;
      uint64_t v110 = [v109 countByEnumeratingWithState:&v152 objects:v178 count:16];
      if (v110)
      {
        uint64_t v111 = *(void *)v153;
        do
        {
          for (uint64_t j = 0; j != v110; ++j)
          {
            if (*(void *)v153 != v111) {
              objc_enumerationMutation(v109);
            }
            uint64_t v113 = *(void *)(*((void *)&v152 + 1) + 8 * j);
            v114 = (void *)MEMORY[0x1CB79D060]();
            v115 = [v25 objectForKeyedSubscript:v113];
            [v60 addObjectsFromArray:v115];
          }
          uint64_t v110 = [v109 countByEnumeratingWithState:&v152 objects:v178 count:16];
        }
        while (v110);
      }

      if ([v60 count])
      {
        id v116 = objc_alloc(MEMORY[0x1E4F89DA0]);
        v117 = [v145 timestamp];
        v118 = [v145 clientIdentifier];
        v119 = [v145 clientBundleId];
        v120 = [v145 mappingId];
        v121 = (void *)[v116 initWithFeedbackItems:v60 timestamp:v117 clientIdentifier:v118 clientBundleId:v119 mappingId:v120];

        +[PPFeedbackStorage logFeedback:v121 domain:2 domainStatus:1 inBackground:1];
      }
      goto LABEL_104;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F89DA0]);
    v28 = [v145 timestamp];
    v29 = [v145 clientIdentifier];
    v30 = [v145 clientBundleId];
    v31 = [v145 mappingId];
    v32 = (void *)[v27 initWithFeedbackItems:v133 timestamp:v28 clientIdentifier:v29 clientBundleId:v30 mappingId:v31];

    +[PPFeedbackStorage logFeedback:v32 domain:2 domainStatus:2 inBackground:1];
    v33 = [v32 feedbackItems];
    v34 = [v145 clientBundleId];
    v35 = [v145 clientIdentifier];
    +[PPFeedbackUtils recordUserEventsFromFeedback:v145 matchingFeedbackItems:v33 clientBundleId:v34 clientIdentifier:v35 domain:2];

    id v36 = v32;
    v126 = v36;
    if (self)
    {
      v37 = [v36 clientBundleId];
      BOOL v38 = +[PPFeedbackUtils shouldSample:v37];

      if (v38)
      {
        os_log_t oslog = (os_log_t)objc_opt_new();
        [oslog setPredictionType:3];
        v39 = +[PPFeedbackUtils feedbackMetadataForBaseFeedback:v126];
        [oslog setFeedbackMetadata:v39];

        id v131 = v126;
        v40 = objc_opt_new();
        v41 = objc_opt_new();
        long long v172 = 0u;
        long long v173 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        v42 = [v131 feedbackItems];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v170 objects:buf count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v171;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v171 != v44) {
                objc_enumerationMutation(v42);
              }
              v46 = *(void **)(*((void *)&v170 + 1) + 8 * k);
              v47 = [v46 itemString];
              [v40 addObject:v47];

              v48 = [v46 itemString];
              [v41 setObject:v46 forKeyedSubscript:v48];
            }
            uint64_t v43 = [v42 countByEnumeratingWithState:&v170 objects:buf count:16];
          }
          while (v43);
        }

        v49 = [v131 timestamp];
        [v49 timeIntervalSince1970];
        double v51 = v50;
        id v149 = v40;
        v52 = objc_opt_new();
        v53 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v51];
        [v52 setScoringDate:v53];
        [v52 setToDate:v53];
        *(void *)&long long v180 = 0;
        *((void *)&v180 + 1) = &v180;
        *(void *)&long long v181 = 0x3032000000;
        *((void *)&v181 + 1) = __Block_byref_object_copy__27210;
        *(void *)&long long v182 = __Block_byref_object_dispose__27211;
        *((void *)&v182 + 1) = 0;
        *((void *)&v182 + 1) = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v149];
        location[0] = 0;
        location[1] = location;
        *(void *)&long long v167 = 0x3032000000;
        *((void *)&v167 + 1) = __Block_byref_object_copy__27210;
        *(void *)&long long v168 = __Block_byref_object_dispose__27211;
        *((void *)&v168 + 1) = 0;
        *((void *)&v168 + 1) = objc_opt_new();
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)3221225472;
        aBlock[2] = __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke;
        aBlock[3] = &unk_1E65DC7A8;
        aBlock[4] = &v180;
        aBlock[5] = location;
        v54 = _Block_copy(aBlock);
        id v176 = 0;
        v174[0] = MEMORY[0x1E4F143A8];
        v174[1] = 3221225472;
        v174[2] = __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke_2;
        v174[3] = &unk_1E65DC7D0;
        id v55 = v54;
        id v175 = v55;
        BOOL v56 = [(PPLocalLocationStore *)self iterLocationRecordsWithQuery:v52 error:&v176 block:v174];
        id v57 = v176;
        v58 = v57;
        if (v56)
        {
          id v59 = *((id *)location[1] + 5);
          id v146 = 0;
        }
        else
        {
          if (v57) {
            id v146 = v57;
          }
          else {
            id v146 = 0;
          }
          v62 = pp_locations_log_handle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v184 = 138412290;
            v185 = v58;
            _os_log_error_impl(&dword_1CA9A8000, v62, OS_LOG_TYPE_ERROR, "PPLocalLocationStore mapped string matching: error from iterLocationRecordsWithQuery: %@", v184, 0xCu);
          }

          id v59 = 0;
        }

        _Block_object_dispose(location, 8);
        _Block_object_dispose(&v180, 8);

        v63 = objc_opt_new();
        long long v168 = 0u;
        long long v169 = 0u;
        *(_OWORD *)locatiouint64_t n = 0u;
        long long v167 = 0u;
        id v64 = v59;
        uint64_t v65 = [v64 countByEnumeratingWithState:location objects:&v180 count:16];
        if (v65)
        {
          uint64_t v66 = *(void *)v167;
          do
          {
            for (uint64_t m = 0; m != v65; ++m)
            {
              if (*(void *)v167 != v66) {
                objc_enumerationMutation(v64);
              }
              uint64_t v68 = *((void *)location[1] + m);
              v69 = [v64 objectForKeyedSubscript:v68];
              v70 = [v41 objectForKeyedSubscript:v68];
              [v63 setObject:v69 forKeyedSubscript:v70];
            }
            uint64_t v65 = [v64 countByEnumeratingWithState:location objects:&v180 count:16];
          }
          while (v65);
        }

        id v71 = v146;
        v124 = v71;
        if (v63)
        {
          long long v163 = 0u;
          long long v164 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          obuint64_t j = v63;
          uint64_t v129 = [obj countByEnumeratingWithState:&v161 objects:v179 count:16];
          if (v129)
          {
            id v125 = 0;
            v138 = 0;
            v73 = &selRef_scoredEntitiesFromMapsIntent_;
            uint64_t v127 = *(void *)v162;
            *(void *)&long long v72 = 138412546;
            long long v122 = v72;
            do
            {
              uint64_t v74 = 0;
              aSelector = v73[77];
              do
              {
                if (*(void *)v162 != v127)
                {
                  uint64_t v75 = v74;
                  objc_enumerationMutation(obj);
                  uint64_t v74 = v75;
                }
                uint64_t v135 = v74;
                uint64_t v76 = *(void *)(*((void *)&v161 + 1) + 8 * v74);
                v140 = +[PPFeedbackUtils feedbackItemForPPFeedbackItem:](PPFeedbackUtils, "feedbackItemForPPFeedbackItem:", v76, v122);
                v77 = [obj objectForKeyedSubscript:v76];
                v78 = [(PPLocationStorage *)self->_storage decayedFeedbackCountsForClusterIdentifier:v77];
                v137 = [v131 clientBundleId];
                id v144 = v77;
                id v143 = v78;
                self;
                v150 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
                if (v150)
                {
                  self;
                  v147 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
                  if (v147)
                  {
                    uint64_t v79 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v150);
                    v139 = [(PPLocationStorage *)self->_storage sourceStats:+[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v147) | v79 withExcludedAlgorithms:0];
                    v142 = objc_opt_new();
                    v80 = objc_opt_new();
                    [v80 setFuzzyMatchingString:v144];
                    [v80 setScoringDate:v142];
                    *(void *)&long long v170 = 0;
                    v81 = [(PPLocalLocationStore *)self locationRecordsWithQuery:v80 error:&v170];
                    id v82 = (id)v170;
                    v136 = v82;
                    if (v81)
                    {
                      v83 = [PPStreamingLocationScorer alloc];
                      v84 = [v80 scoringDate];
                      v85 = -[PPStreamingLocationScorer initWithScoringDate:sourceStats:trialWrapper:](v83, v84, v139, self->_trialWrapper);

                      id v86 = self;
                      id v87 = self;
                      v88 = [v81 firstObject];
                      -[PPStreamingLocationScorer startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:]((uint64_t)v85, v143, v88);

                      long long v182 = 0u;
                      long long v183 = 0u;
                      long long v180 = 0u;
                      long long v181 = 0u;
                      id v89 = v81;
                      uint64_t v90 = [v89 countByEnumeratingWithState:&v180 objects:buf count:16];
                      if (v90)
                      {
                        uint64_t v91 = *(void *)v181;
                        do
                        {
                          for (uint64_t n = 0; n != v90; ++n)
                          {
                            if (*(void *)v181 != v91) {
                              objc_enumerationMutation(v89);
                            }
                            -[PPStreamingLocationScorer addRecord:]((uint64_t)v85, *(void **)(*((void *)&v180 + 1) + 8 * n));
                          }
                          uint64_t v90 = [v89 countByEnumeratingWithState:&v180 objects:buf count:16];
                        }
                        while (v90);
                      }

                      location[0] = 0;
                      aBlock[0] = 0;
                      float v93 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v85, location, (uint64_t)aBlock);
                      id v94 = objc_alloc(MEMORY[0x1E4F93BB8]);
                      v95 = [NSNumber numberWithDouble:v93];
                      v96 = (void *)[v94 initWithFirst:v95 second:location[0]];
                    }
                    else
                    {
                      id v125 = v82;
                      v85 = pp_locations_log_handle();
                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        v103 = NSStringFromSelector(aSelector);
                        *(_DWORD *)buf = v122;
                        id v187 = v103;
                        __int16 v188 = 2112;
                        id v189 = v125;
                        _os_log_error_impl(&dword_1CA9A8000, v85, OS_LOG_TYPE_ERROR, "error in %@: %@", buf, 0x16u);
                      }
                      v96 = 0;
                    }
                  }
                  else
                  {
                    v96 = 0;
                  }
                }
                else
                {
                  v96 = 0;
                }

                v97 = [v96 second];
                v98 = +[PPFeedbackUtils featuresForScoreDict:v97];
                v99 = (void *)[v98 mutableCopy];

                if (!v138) {
                  v138 = [[PPFeatureRedactor alloc] initWithTrialWrapper:self->_trialWrapper namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
                }
                if (v99)
                {
                  [(PPFeatureRedactor *)v138 transformFeaturesInPlace:v99];
                  v100 = [v96 first];
                  [v100 floatValue];
                  v101 = +[PPFeedbackUtils scoredItemWithFeaturesForFeatureDictionary:score:](PPFeedbackUtils, "scoredItemWithFeaturesForFeatureDictionary:score:", v99);

                  [v101 addFeedbackItems:v140];
                  [oslog addScoredItems:v101];
                }
                else
                {
                  v102 = pp_locations_log_handle();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1CA9A8000, v102, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: unable to fetch feature dictionary.", buf, 2u);
                  }

                  char v165 = 0;
                }

                if (!v99)
                {

                  goto LABEL_84;
                }
                uint64_t v74 = v135 + 1;
              }
              while (v135 + 1 != v129);
              uint64_t v104 = [obj countByEnumeratingWithState:&v161 objects:v179 count:16];
              uint64_t v129 = v104;
              v73 = &selRef_scoredEntitiesFromMapsIntent_;
            }
            while (v104);
          }
          else
          {
            id v125 = 0;
            v138 = 0;
          }

          +[PPFeedbackUtils addBoilerplateToFeedbackLog:oslog];
          v105 = [MEMORY[0x1E4F93728] sharedInstance];
          [v105 logMessage:oslog];

          char v165 = 1;
LABEL_84:

          char v61 = v165;
        }
        else
        {
          if (v71) {
            id v125 = v71;
          }
          else {
            id v125 = 0;
          }
          v106 = pp_locations_log_handle();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v187 = v124;
            _os_log_error_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from _feedbackItemToLocationMapForFeedback: %@", buf, 0xCu);
          }

          char v61 = 0;
        }
      }
      else
      {
        pp_default_log_handle();
        os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore: no feedback session log collection being performed due to sampling", buf, 2u);
        }
        id v125 = 0;
        char v61 = 1;
      }

      id v107 = v125;
      if (v61) {
        goto LABEL_94;
      }
    }
    else
    {

      id v107 = 0;
    }
    v108 = pp_locations_log_handle();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v187 = v107;
      _os_log_error_impl(&dword_1CA9A8000, v108, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: encountered error in session logging: %@", buf, 0xCu);
    }

LABEL_94:
    [(PPLocationStorage *)self->_storage donateLocationFeedback:v126];

    goto LABEL_95;
  }
  v60 = pp_locations_log_handle();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v187 = v128;
    _os_log_error_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_ERROR, "processFeedbackItems: error from iterLocationRecordsWithQuery: %@", buf, 0xCu);
  }
LABEL_104:
}

void __40__PPLocalLocationStore_processFeedback___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v18 = a2;
  v5 = [v18 location];
  id v6 = [v5 placemark];
  uint64_t v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    unint64_t v9 = *(void **)(a1 + 40);
    char v10 = [v18 location];
    char v11 = [v10 placemark];
    v12 = [v11 name];
    v13 = [v9 objectForKeyedSubscript:v12];
    [v8 addObjectsFromArray:v13];

    v14 = *(void **)(a1 + 48);
    v15 = [v18 location];
    v16 = [v15 placemark];
    id v17 = [v16 name];
    [v14 removeObject:v17];

    if (![*(id *)(a1 + 48) count]) {
      *a3 = 1;
    }
  }
}

void __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
  {
    id v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1CB79D060](v8);
          objc_msgSend(v5, "rangeOfString:options:", v12, 1, (void)v15);
          if (v14)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:v12];
            [v6 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) minusSet:v6];
  }
  else
  {
    *a3 = 1;
  }
}

void __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = [a2 location];
  id v5 = [v6 clusterIdentifier];
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = pp_locations_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138739971;
    id v11 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "Location feedback received: %{sensitive}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = +[PPInternalFeedback fromBaseFeedback:v5 storeType:3];
  [v8 storePendingFeedback:v9 storeType:3 error:0];

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (BOOL)pruneOrphanedLocationFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return [(PPLocationStorage *)self->_storage pruneOrphanedLocationFeedbackCountRecordsWithLimit:a3 rowOffset:a4 deletedCount:a5 isComplete:a6];
}

- (BOOL)deleteAllLocationFeedbackCountsOlderThanDate:(id)a3
{
  return [(PPLocationStorage *)self->_storage deleteAllLocationFeedbackCountRecordsOlderThanDate:a3];
}

- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v10 = 0;
  unint64_t v9 = 0;
  BOOL v7 = [(PPLocationStorage *)self->_storage deleteAllLocationsOlderThanDate:a3 atLeastOneLocationRemoved:&v10 deletedCount:&v9 error:a5];
  if (v10)
  {
    [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_236];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a4) {
    *a4 = v9;
  }
  return v7;
}

uint64_t __75__PPLocalLocationStore_deleteAllLocationsOlderThanDate_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  char v12 = 0;
  unint64_t v11 = 0;
  BOOL v9 = [(PPLocationStorage *)self->_storage deleteAllLocationsFromSourcesWithBundleId:a3 groupId:a4 olderThanDate:a5 atLeastOneLocationRemoved:&v12 deletedCount:&v11 error:a7];
  if (v12)
  {
    [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_234];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a6) {
    *a6 = v11;
  }
  return v9;
}

uint64_t __103__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThan_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __94__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v11 = 0;
  unint64_t v10 = 0;
  BOOL v8 = [(PPLocationStorage *)self->_storage deleteAllLocationsFromSourcesWithBundleId:a3 documentIds:a4 atLeastOneLocationRemoved:&v11 deletedCount:&v10 error:a6];
  if (v11)
  {
    [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_230];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

uint64_t __97__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __85__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  BOOL v5 = [(PPLocationStorage *)self->_storage clearWithError:a3 deletedCount:a4];
  [(_PASLock *)self->_cache runWithLockAcquired:&__block_literal_global_225];
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  return v5;
}

uint64_t __52__PPLocalLocationStore_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = pp_locations_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 limit];
    BOOL v9 = [v6 fromDate];
    unint64_t v10 = [v9 description];
    char v11 = [v6 toDate];
    char v12 = [v11 description];
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "locationRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  v13 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__PPLocalLocationStore_locationRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E65DC710;
  id v19 = v13;
  id v14 = v13;
  if ([(PPLocalLocationStore *)self iterLocationRecordsWithQuery:v6 error:a4 block:v18])
  {
    long long v15 = v14;
  }
  else
  {
    long long v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __55__PPLocalLocationStore_locationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)homeOrWorkAddresses
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__27210;
  unint64_t v10 = __Block_byref_object_dispose__27211;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPLocalLocationStore_homeOrWorkAddresses__block_invoke;
  v5[3] = &unk_1E65DC6E8;
  v5[4] = &v6;
  [(_PASLock *)cache runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__PPLocalLocationStore_homeOrWorkAddresses__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 homeOrWorkAddresses];
  return MEMORY[0x1F41817F8]();
}

- (id)locationForWork
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__27210;
  unint64_t v10 = __Block_byref_object_dispose__27211;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PPLocalLocationStore_locationForWork__block_invoke;
  v5[3] = &unk_1E65DC6E8;
  v5[4] = &v6;
  [(_PASLock *)cache runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __39__PPLocalLocationStore_locationForWork__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 locationForWork];
  return MEMORY[0x1F41817F8]();
}

- (id)locationForHome
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__27210;
  unint64_t v10 = __Block_byref_object_dispose__27211;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PPLocalLocationStore_locationForHome__block_invoke;
  v5[3] = &unk_1E65DC6E8;
  v5[4] = &v6;
  [(_PASLock *)cache runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __39__PPLocalLocationStore_locationForHome__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 locationForHome];
  return MEMORY[0x1F41817F8]();
}

- (id)locationRecordOfCategory:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  BOOL v5 = objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x1CB79D060]([v5 setLimit:1]);
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = [NSNumber numberWithUnsignedShort:v3];
  BOOL v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

  [v5 setMatchingCategories:v9];

  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__27210;
  long long v18 = __Block_byref_object_dispose__27211;
  id v19 = 0;
  storage = self->_storage;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__PPLocalLocationStore_locationRecordOfCategory___block_invoke;
  v13[3] = &unk_1E65DC6C0;
  v13[4] = &v14;
  [(PPLocationStorage *)storage iterLocationRecordsWithQuery:v5 error:0 block:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __49__PPLocalLocationStore_locationRecordOfCategory___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v37 = a5;
  uint64_t v8 = pp_locations_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 limit];
    unint64_t v10 = [v7 fromDate];
    id v11 = [v10 description];
    char v12 = [v7 toDate];
    v13 = [v12 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v69 = v13;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "iterLocationRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  if ([v7 limit])
  {
    uint64_t v14 = objc_opt_new();
    if ([v7 consumer] == 1 || objc_msgSend(v7, "consumer") == 2)
    {
      long long v15 = [(PPLocalLocationStore *)self locationForHome];
      uint64_t v16 = [(PPLocalLocationStore *)self locationForWork];
      if (v15) {
        [v14 addObject:v15];
      }
      if (v16) {
        [v14 addObject:v16];
      }
    }
    long long v17 = (void *)[v7 copy];
    [v17 setLimit:-1];
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    unint64_t v19 = [v7 limit];
    if (v19 >= 0x40) {
      uint64_t v20 = 64;
    }
    else {
      uint64_t v20 = v19;
    }
    uint64_t v21 = (void *)[v18 initWithCapacity:v20];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v69 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    char v63 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E65DC648;
    v60 = v62;
    id v22 = v21;
    id v57 = v22;
    id v59 = v37;
    char v61 = buf;
    id v58 = v7;
    v23 = _Block_copy(aBlock);
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_2;
    v46[3] = &unk_1E65DC670;
    id v24 = v14;
    id v47 = v24;
    id v25 = _Block_copy(v46);
    storage = self->_storage;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_3;
    v38[3] = &unk_1E65DC698;
    uint64_t v43 = &v52;
    id v27 = v24;
    id v39 = v27;
    id v28 = v25;
    id v41 = v28;
    uint64_t v44 = &v48;
    id v29 = v22;
    id v40 = v29;
    v30 = v23;
    id v42 = v30;
    v45 = v62;
    BOOL v31 = [(PPLocationStorage *)storage iterLocationRecordsWithQuery:v17 error:a4 block:v38];
    if (v31) {
      v30[2](v30);
    }
    if (v49[3])
    {
      v32 = pp_locations_log_handle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = v49[3];
        uint64_t v35 = v53[3];
        *(_DWORD *)id v64 = 134218240;
        uint64_t v65 = v34;
        __int16 v66 = 2048;
        uint64_t v67 = v35;
        _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "iterLocationRecordsWithQuery filtered %tu of %tu items due to map UI restriction", v64, 0x16u);
      }
    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(v62, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    LOBYTE(v31) = 1;
  }

  return v31;
}

void __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1CB79D060]();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(unsigned char *)(v8 + 24))
        {
          BOOL v9 = 1;
        }
        else
        {
          unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          BOOL v9 = v10 >= objc_msgSend(*(id *)(a1 + 40), "limit", (void)v11);
          uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        }
        *(unsigned char *)(v8 + 24) = v9;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (void)v11);
}

uint64_t __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (+[PPLocationSupport fuzzyMatchingLocations:and:](PPLocationSupport, "fuzzyMatchingLocations:and:", *(void *)(*((void *)&v9 + 1) + 8 * i), v3, (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v9 = v5;
  if (*(void *)(a1 + 32)
    && (uint64_t v7 = *(void *)(a1 + 48),
        [v5 location],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        id v6 = v9,
        v7))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v6];
    if ([*(id *)(a1 + 40) count] == 64) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
}

- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v7);
        }
        -[PPStreamingLocationScorer addRecord:]((uint64_t)v8, *(void **)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v11);
  }
  id v26 = 0;
  *(float *)&double v14 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v8, 0, (uint64_t)&v26);
  if (v26)
  {
    id v25 = 0;
    long long v15 = objc_msgSend(v9, "predictionFromFeatures:error:", v26, &v25, v14);
    uint64_t v16 = v25;
    if (v15)
    {
      long long v17 = [v15 featureValueForName:@"computed_score"];
      id v18 = [v17 multiArrayValue];

      if (v18)
      {
        unint64_t v19 = [v17 multiArrayValue];
        uint64_t v20 = [v19 objectAtIndexedSubscript:0];
        [v20 doubleValue];
        double v22 = v21;
      }
      else
      {
        [v17 doubleValue];
        double v22 = v23;
      }
    }
    else
    {
      long long v17 = pp_default_log_handle();
      double v22 = -1.0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v16;
        _os_log_fault_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: unable to retrieve prediction %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = pp_default_log_handle();
    double v22 = 0.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: the score interpreter provided a nil final output.", buf, 2u);
    }
  }

  return v22;
}

- (id)rankedLocationsWithQuery:(id)a3 clientProcessName:(id)a4 error:(id *)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v64 = a4;
  id v8 = pp_locations_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v69 limit];
    uint64_t v10 = [v69 fromDate];
    uint64_t v11 = [v10 description];
    uint64_t v12 = [v69 toDate];
    long long v13 = [v12 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v85 = v13;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "rankedLocationsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  if (self)
  {
    double v14 = (void *)[v69 copy];
    [v14 setLimit:-1];
    long long v15 = objc_opt_new();
    id v74 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __65__PPLocalLocationStore__unlimitedLocationRecordsWithQuery_error___block_invoke;
    v85 = &unk_1E65DC710;
    uint64_t v16 = v15;
    id v86 = v16;
    BOOL v17 = [(PPLocalLocationStore *)self iterLocationRecordsWithQuery:v14 error:&v74 block:buf];
    id v18 = v74;
    if (v17)
    {
      uint64_t v68 = v16;
      id v19 = 0;
    }
    else
    {
      uint64_t v20 = pp_locations_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v97) = 138412290;
        *(void *)((char *)&v97 + 4) = v18;
        _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "_unlimitedLocationRecordsWithQuery: nil result from iterLocationRecordsWithQuery: %@", (uint8_t *)&v97, 0xCu);
      }

      id v19 = v18;
      uint64_t v68 = 0;
    }
  }
  else
  {
    id v19 = 0;
    uint64_t v68 = 0;
  }
  id v67 = v19;
  if (v68)
  {
    self;
    __int16 v66 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
    self;
    uint64_t v65 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
    uint64_t v21 = 0;
    if (v66 && v65)
    {
      uint64_t v22 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v66);
      uint64_t v21 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v65) | v22;
    }
    double v23 = [v69 scoringDate];
    id v24 = v23;
    if (v23) {
      id v25 = v23;
    }
    else {
      id v25 = (id)objc_opt_new();
    }
    long long v27 = v25;

    long long v28 = [(PPLocationStorage *)self->_storage sourceStats:v21 withExcludedAlgorithms:0];
    long long v29 = v68;
    id v30 = v27;
    id v31 = v28;
    char v63 = v29;
    v32 = +[PPLocationClusterID clustersWithRecords:v29];
    v33 = +[PPLocationClusterID latLongTableWithClusters:v32];
    id v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
    uint64_t v35 = +[PPConfiguration sharedInstance];
    int v36 = [v35 locationScoringUsesHybrid];

    if (v36)
    {
      id v37 = -[PPLocalLocationStore _loadScoringMLModel]((uint64_t)self);
    }
    else
    {
      id v37 = 0;
    }
    uint64_t v70 = 0;
    id v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    BOOL v38 = +[PPConfiguration sharedInstance];
    [v38 scoreThresholdForLocation];
    float v40 = v39;

    *(void *)&long long v97 = 0;
    *((void *)&v97 + 1) = &v97;
    uint64_t v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__27210;
    v100 = __Block_byref_object_dispose__27211;
    id v101 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke;
    v85 = &unk_1E65DC620;
    v95 = sel_scoreLocations_scoringDate_sourceStats_mlModel_;
    id v86 = self;
    id v41 = v33;
    id v87 = v41;
    v92 = &v97;
    id v42 = (PPLocalLocationStore *)v30;
    v88 = v42;
    id v43 = v31;
    id v89 = v43;
    id v44 = v37;
    id v90 = v44;
    float v93 = &v70;
    float v96 = v40;
    id v45 = v34;
    id v91 = v45;
    id v94 = &v74;
    [v32 enumerateKeysAndObjectsUsingBlock:buf];
    v46 = (char *)v75[3];
    uint64_t v47 = [v45 count];
    uint64_t v48 = pp_locations_log_handle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = v75[3];
      if (*((unsigned char *)v71 + 24)) {
        double v50 = 0.0;
      }
      else {
        double v50 = v40;
      }
      *(_DWORD *)v78 = 134218496;
      id v79 = v49;
      __int16 v80 = 2048;
      double v81 = v50;
      __int16 v82 = 2048;
      v83 = &v46[v47];
      _os_log_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: filtered %tu items below threshold of %f out of %tu total.", v78, 0x20u);
    }

    uint64_t v51 = v91;
    id v52 = v45;

    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);

    id v53 = self;
    id v54 = self;
    uint64_t v55 = (void *)[v52 count];
    id v56 = v69;
    id v57 = v64;
    id v58 = +[PPMetricsUtils loggingQueue];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __83__PPLocalLocationStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke;
    v85 = &unk_1E65DC5D8;
    id v59 = (PPLocalLocationStore *)v57;
    id v86 = v59;
    id v89 = v55;
    id v60 = v56;
    LOBYTE(v90) = v67 != 0;
    id v87 = v60;
    v88 = self;
    dispatch_async(v58, buf);

    unint64_t v61 = [v60 limit];
    id v26 = v52;
    self;
    [v26 sortUsingComparator:&__block_literal_global_222_27232];
    if ([v26 count] > v61) {
      objc_msgSend(v26, "removeObjectsInRange:", v61, objc_msgSend(v26, "count") - v61);
    }
  }
  else
  {
    id v26 = 0;
    if (a5) {
      *a5 = v67;
    }
  }

  return v26;
}

uint64_t __51__PPLocalLocationStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

void __83__PPLocalLocationStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke(uint64_t a1)
{
  id v9 = (id)objc_opt_new();
  [v9 setBundleId:*(void *)(a1 + 32)];
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    unint64_t v3 = (unint64_t)log10((double)v2);
  }
  else {
    unint64_t v3 = 0;
  }
  [v9 setResultSizeLog10:v3];
  id v4 = [*(id *)(a1 + 40) scoringDate];
  [v9 setTimeSpec:v4 != 0];

  objc_msgSend(v9, "setLimitHit:", *(void *)(a1 + 56) > (unint64_t)objc_msgSend(*(id *)(a1 + 40), "limit"));
  id v5 = [*(id *)(a1 + 40) fromDate];
  [v9 setTimeLimited:v5 != 0];

  double v6 = [*(id *)(a1 + 40) excludingSourceBundleIds];
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  [v9 setError:*(unsigned __int8 *)(a1 + 64)];
  double v7 = [*(id *)(*(void *)(a1 + 48) + 24) concatenatedTreatmentNames];
  [v9 setActiveTreatments:v7];

  double v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v9];
}

- (id)_loadScoringMLModel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = *(void **)(a1 + 24);
    id v6 = 0;
    unint64_t v2 = [v1 mlModelForModelName:@"PPModel_LOC.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS" error:&v6];
    id v3 = v6;
    if (!v2)
    {
      id v4 = pp_locations_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v8 = v3;
        __int16 v9 = 2112;
        uint64_t v10 = @"PPModel_LOC.mlmodelc";
        __int16 v11 = 2112;
        uint64_t v12 = @"PERSONALIZATION_PORTRAIT_LOCATIONS";
        _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: error %@ in retrieving %@ model with namespace %@", buf, 0x20u);
      }
    }
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2;
}

void __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v6 count])
  {
    id v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:*(void *)(a1 + 104), *(void *)(a1 + 32), @"PPLocalLocationStore.m", 368, @"Location cluster for %@ had 0 records", v5 object file lineNumber description];
  }
  double v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_200];
  id v8 = [v7 lastObject];

  __int16 v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  [v8 supplementFieldsWithClusterID:v5 locationWithLatLong:v9];

  uint64_t v10 = [v8 location];
  __int16 v11 = [v10 clusterIdentifier];

  if (v11)
  {
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v13 = [v8 location];
    double v14 = [v13 clusterIdentifier];
    long long v15 = [v12 decayedFeedbackCountsForClusterIdentifier:v14];
  }
  else
  {
    long long v15 = 0;
  }
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v16)
  {
    BOOL v17 = -[PPStreamingLocationScorer initWithScoringDate:sourceStats:trialWrapper:]([PPStreamingLocationScorer alloc], *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(*(void *)(a1 + 32) + 24));
    uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }
  -[PPStreamingLocationScorer startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:](v16, v15, v8);
  uint64_t v20 = +[PPConfiguration sharedInstance];
  int v21 = [v20 locationScoringUsesHybrid];

  if (!v21)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v24 = v6;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          -[PPStreamingLocationScorer addRecord:](*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void **)(*((void *)&v44 + 1) + 8 * i));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v26);
    }

    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v29) {
      double v30 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:](v29, 0, 0);
    }
    else {
      double v30 = 0.0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    goto LABEL_23;
  }
  uint64_t v22 = *(void **)(a1 + 64);
  if (v22)
  {
    id v23 = v22;
LABEL_22:
    [*(id *)(a1 + 32) finalScoreFromRecordsUsingHybrid:v6 streamingScorer:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) mlModel:v23];
    double v30 = v31;

LABEL_23:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) && v30 > 0.0 || v30 >= *(float *)(a1 + 112))
    {
      id v33 = objc_alloc(MEMORY[0x1E4F89E48]);
      uint64_t v34 = [v8 location];
      uint64_t v35 = [v34 placemark];
      int v36 = [v8 location];
      id v37 = objc_msgSend(v33, "initWithPlacemark:category:mostRelevantRecord:", v35, objc_msgSend(v36, "category"), v8);

      id v38 = objc_alloc(MEMORY[0x1E4F89F10]);
      [v8 sentimentScore];
      float v40 = (void *)[v38 initWithLocation:v37 score:v30 sentimentScore:v39];
      [*(id *)(a1 + 72) addObject:v40];
    }
    else
    {
      v32 = pp_locations_log_handle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        double v42 = *(float *)(a1 + 112);
        *(_DWORD *)buf = 134218240;
        double v49 = v30;
        __int16 v50 = 2048;
        double v51 = v42;
        _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "Scoring: filtering out location with score %f below threshold of %f", buf, 0x16u);
      }

      ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    }
    goto LABEL_30;
  }
  -[PPLocalLocationStore _loadScoringMLModel](*(void *)(a1 + 32));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v23) {
    goto LABEL_22;
  }
  id v41 = pp_locations_log_handle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: unable to locate ML model.", buf, 2u);
  }

LABEL_30:
}

uint64_t __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 location];
  double v7 = [v6 placemark];
  id v8 = [v7 name];
  __int16 v9 = [v8 localizedCapitalizedString];
  uint64_t v10 = [v4 location];
  __int16 v11 = [v10 placemark];
  uint64_t v12 = [v11 name];
  int v27 = [v9 isEqual:v12];

  uint64_t v13 = [v5 location];
  double v14 = [v13 placemark];
  long long v15 = [v14 name];
  uint64_t v16 = [v15 localizedCapitalizedString];
  BOOL v17 = [v5 location];
  uint64_t v18 = [v17 placemark];
  id v19 = [v18 name];
  char v20 = [v16 isEqual:v19];

  if (!v27)
  {
    if (v20)
    {
      uint64_t v21 = -1;
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v22 = [v4 source];
    id v23 = [v22 date];
    id v24 = [v5 source];
    uint64_t v25 = [v24 date];
    uint64_t v21 = [v23 compare:v25];

    goto LABEL_7;
  }
  if (v20) {
    goto LABEL_6;
  }
  uint64_t v21 = 1;
LABEL_7:

  return v21;
}

uint64_t __65__PPLocalLocationStore__unlimitedLocationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, uint64_t, char *))a5;
  __int16 v9 = [(PPLocalLocationStore *)self rankedLocationsWithQuery:a3 clientProcessName:0 error:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        char v18 = 0;
        v8[2](v8, v16, &v18);
        if (v18) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  return v10 != 0;
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  unsigned int v67 = a6;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"PPLocalLocationStore.m", 153, @"Invalid parameter not satisfying: %@", @"locations" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  char v63 = [MEMORY[0x1E4F28B00] currentHandler];
  [v63 handleFailureInMethod:a2, self, @"PPLocalLocationStore.m", 154, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

LABEL_3:
  uint64_t v16 = pp_locations_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v13 count];
    char v18 = [MEMORY[0x1E4F89E60] describeAlgorithm:v67];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    double v81 = v18;
    _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore received a donation of %tu locations from source: %@, algorithm: %@", buf, 0x20u);
  }
  long long v19 = +[PPSettings sharedInstance];
  long long v20 = [v14 bundleId];
  char v21 = [v19 bundleIdentifierIsEnabledForDonation:v20];

  if ((v21 & 1) == 0)
  {
    uint64_t v26 = pp_locations_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v60 = [v14 bundleId];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v60;
      _os_log_debug_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore suppressed location donation from disabled bundleId: %@", buf, 0xCu);
    }
    int v27 = +[PPMetricsUtils loggingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke;
    block[3] = &unk_1E65DC568;
    id v77 = v14;
    v78 = self;
    dispatch_async(v27, block);

    long long v28 = v77;
    goto LABEL_28;
  }
  if (v8)
  {
    long long v22 = +[PPSettings sharedInstance];
    id v23 = [v14 bundleId];
    char v24 = [v22 bundleIdentifierIsEnabledForCloudKit:v23];

    if (v24)
    {
      int v25 = 1;
      goto LABEL_16;
    }
    uint64_t v29 = pp_locations_log_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v61 = [v14 bundleId];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore suppressed location cloudSync on donation from disabled bundleId: %@", buf, 0xCu);
    }
  }
  int v25 = 0;
LABEL_16:
  double v30 = self;
  if (![v13 count])
  {
    float v40 = +[PPMetricsUtils loggingQueue];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_182;
    v73[3] = &unk_1E65DC568;
    id v74 = v14;
    uint64_t v75 = self;
    dispatch_async(v40, v73);

    long long v28 = v74;
LABEL_28:

    LOBYTE(v41) = 1;
    goto LABEL_36;
  }
  unsigned int v64 = v25;
  id v65 = v15;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v31 = v13;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v70;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v70 != v34) {
          objc_enumerationMutation(v31);
        }
        int v36 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v37 = [v36 location];
        if ([v37 category] == 6)
        {

LABEL_30:
          [(_PASLock *)v30->_cache runWithLockAcquired:&__block_literal_global_27269];
          goto LABEL_31;
        }
        id v38 = [v36 location];
        int v39 = [v38 category];

        if (v39 == 5) {
          goto LABEL_30;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v69 objects:v79 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

LABEL_31:
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_3;
  v68[3] = &unk_1E65DC5B0;
  v68[4] = v30;
  double v42 = objc_msgSend(v31, "_pas_filteredArrayWithTest:", v68);
  uint64_t v43 = [v31 count];
  uint64_t v44 = [v42 count];
  long long v45 = pp_locations_log_handle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v46 = v43 - v44;
    uint64_t v47 = [v31 count];
    uint64_t v48 = [v14 bundleId];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v46;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2112;
    double v81 = v48;
    _os_log_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: filtered %tu URLs of (of %tu) from %@", buf, 0x20u);
  }
  id v15 = v65;
  BOOL v41 = [(PPLocationStorage *)v30->_storage donateLocations:v42 source:v14 contextualNamedEntities:v65 algorithm:v67 cloudSync:v64 error:a8];
  if (v41)
  {
    double v49 = [v14 bundleId];
    __int16 v50 = [v14 groupId];
    id v51 = v42;
    id v52 = v49;
    id v53 = v50;
    id v54 = +[PPMetricsUtils loggingQueue];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __76__PPLocalLocationStore__logDonationForLocations_bundleId_algorithm_groupId___block_invoke;
    double v81 = &unk_1E65DC758;
    id v55 = v52;
    id v82 = v55;
    id v56 = v53;
    id v15 = v65;
    id v57 = v56;
    id v83 = v56;
    v84 = v30;
    id v58 = v51;
    id v85 = v58;
    dispatch_async(v54, buf);

    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsDidChangeMeaningfully");
  }

LABEL_36:
  return v41;
}

void __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setReason:1];
  unint64_t v2 = [*(id *)(a1 + 32) bundleId];
  [v5 setBundleId:v2];

  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) concatenatedTreatmentNames];
  [v5 setActiveTreatments:v3];

  id v4 = [MEMORY[0x1E4F93728] sharedInstance];
  [v4 trackScalarForMessage:v5];
}

void __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_182(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setReason:0];
  unint64_t v2 = [*(id *)(a1 + 32) bundleId];
  [v5 setBundleId:v2];

  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) concatenatedTreatmentNames];
  [v5 setActiveTreatments:v3];

  id v4 = [MEMORY[0x1E4F93728] sharedInstance];
  [v4 trackScalarForMessage:v5];
}

uint64_t __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 location];
  id v5 = [v4 placemark];
  id v6 = [v5 name];

  if ([v6 length])
  {
    if (*(void *)(a1 + 32))
    {
      double v7 = (objc_class *)MEMORY[0x1E4F1CB10];
      id v8 = v6;
      __int16 v9 = (void *)[[v7 alloc] initWithString:v8];

      if (v9)
      {
        uint64_t v10 = [v9 host];
        if (v10)
        {
          id v11 = [v9 scheme];
          BOOL v12 = v11 != 0;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    unsigned int v13 = !v12;
  }
  else
  {
    unsigned int v13 = 1;
  }
  id v14 = [v3 location];
  id v15 = [v14 clusterIdentifier];
  uint64_t v16 = [v15 length];

  if (v16) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 0;
  }

  return v17;
}

void __76__PPLocalLocationStore__logDonationForLocations_bundleId_algorithm_groupId___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  unint64_t v2 = +[PPMetricsUtils filterGroupIdAllowance:*(void *)(a1 + 40)];
  [v5 setGroupId:v2];

  id v3 = [*(id *)(*(void *)(a1 + 48) + 24) concatenatedTreatmentNames];
  [v5 setActiveTreatments:v3];

  id v4 = [MEMORY[0x1E4F93728] sharedInstance];
  objc_msgSend(v4, "trackDistributionForMessage:value:", v5, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 56), "count"));
}

uint64_t __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)_init
{
  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    id v4 = [[PPLocationStorage alloc] initWithDatabase:v3];
    if (v4)
    {
      id v5 = +[PPTrialWrapper sharedInstance];
      self = [(PPLocalLocationStore *)self initWithStorage:v4 trialWrapper:v5];

      id v6 = self;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PPLocalLocationStore)initWithStorage:(id)a3 trialWrapper:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPLocalLocationStore.m", 85, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)PPLocalLocationStore;
  uint64_t v10 = [(PPLocalLocationStore *)&v27 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storage, a3);
    locatiouint64_t n = 0;
    objc_initWeak(&location, v11);
    id v12 = objc_alloc(MEMORY[0x1E4F93B70]);
    unsigned int v13 = [PPLocationCache alloc];
    id v14 = objc_loadWeakRetained(&location);
    id v15 = [(PPLocationCache *)v13 initWithLocationStore:v14];
    uint64_t v16 = [v12 initWithGuardedData:v15];
    cache = v11->_cache;
    v11->_cache = (_PASLock *)v16;

    uint64_t v18 = objc_opt_new();
    modelCache = v11->_modelCache;
    v11->_modelCache = (NSCache *)v18;

    objc_storeStrong((id *)&v11->_trialWrapper, a4);
    trialWrapper = v11->_trialWrapper;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__PPLocalLocationStore_initWithStorage_trialWrapper___block_invoke;
    v24[3] = &unk_1E65DC540;
    objc_copyWeak(&v25, &location);
    id v21 = [(PPTrialWrapper *)trialWrapper addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS" block:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __53__PPLocalLocationStore_initWithStorage_trialWrapper___block_invoke(uint64_t a1)
{
  unint64_t v2 = pp_locations_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPLocalLocationStore: refreshing model cache due to prompt from Trial.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] removeAllObjects];
  }
}

+ (id)scoredLocationFromName:(id)a3 category:(unsigned __int16)a4 score:(double)a5 sentimentScore:(double)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  [v10 setObject:v9 forKeyedSubscript:@"Name"];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E630]) initWithLocation:0 addressDictionary:v10 region:0 areasOfInterest:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v11 category:v8 mostRelevantRecord:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v12 score:a5 sentimentScore:a6];

  return v13;
}

+ (unsigned)routineLOITypeToLocationCategory:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return 5;
  }
  else {
    return word_1CAB7BE2C[a3 + 1];
  }
}

+ (unsigned)namedEntityCategoryToLocationCategory:(unint64_t)a3
{
  if (a3 > 0x15) {
    return 2;
  }
  else {
    return word_1CAB7BE00[a3];
  }
}

+ (BOOL)isLocationRelevantNamedEntityCategory:(unint64_t)a3
{
  return (a3 < 0xE) & (0x3F38u >> a3);
}

+ (id)locationFromMapItem:(id)a3
{
  id v3 = a3;
  uint64_t v29 = [v3 geoAddress];
  id v4 = [v29 structuredAddress];
  [v3 coordinate];
  BOOL v7 = v6 >= -180.0;
  if (v6 > 180.0) {
    BOOL v7 = 0;
  }
  if (v5 < -90.0) {
    BOOL v7 = 0;
  }
  BOOL v8 = v5 <= 90.0 && v7;
  uint64_t v26 = (void *)MEMORY[0x1E4F89E68];
  BOOL v28 = v8;
  if (v8)
  {
    id v9 = NSNumber;
    [v3 coordinate];
    id v31 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v10 = NSNumber;
    [v3 coordinate];
    double v30 = [v10 numberWithDouble:v11];
  }
  else
  {
    double v30 = 0;
    id v31 = 0;
  }
  uint64_t v32 = [v3 name];
  id v25 = [v4 thoroughfare];
  char v24 = [v4 subThoroughfare];
  id v23 = [v4 locality];
  long long v22 = [v4 subLocality];
  id v21 = [v4 administrativeArea];
  long long v20 = [v4 subAdministrativeArea];
  id v12 = [v4 postCode];
  unsigned int v13 = [v4 countryCode];
  id v14 = [v4 country];
  id v15 = [v4 inlandWater];
  uint64_t v16 = [v4 ocean];
  uint64_t v17 = [v4 areaOfInterests];
  objc_super v27 = [v26 placemarkWithLatitudeDegrees:v31 longitudeDegrees:v30 name:v32 thoroughfare:v25 subthoroughFare:v24 locality:v23 subLocality:v22 administrativeArea:v21 subAdministrativeArea:v20 postalCode:v12 countryCode:v13 country:v14 inlandWater:v15 ocean:v16 areasOfInterest:v17];

  if (v28)
  {
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v27 category:0 mostRelevantRecord:0];

  return v18;
}

+ (id)locationNamedEntityToPPScoredLocation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F89E68];
  id v4 = NSNumber;
  id v5 = a3;
  char v24 = [v5 location];
  [v24 coordinate];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  BOOL v7 = NSNumber;
  id v23 = [v5 location];
  [v23 coordinate];
  id v9 = [v7 numberWithDouble:v8];
  uint64_t v10 = [v5 locationName];
  double v11 = [v5 streetAddress];
  id v12 = [v5 city];
  unsigned int v13 = [v5 stateOrProvince];
  id v14 = [v5 postalCode];
  id v15 = [v5 country];
  uint64_t v16 = [v3 placemarkWithLatitudeDegrees:v6 longitudeDegrees:v9 name:v10 thoroughfare:v11 subthoroughFare:0 locality:v12 subLocality:0 administrativeArea:v13 subAdministrativeArea:0 postalCode:v14 countryCode:0 country:v15 inlandWater:0 ocean:0 areasOfInterest:0];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v16 category:0 mostRelevantRecord:0];
  id v18 = objc_alloc(MEMORY[0x1E4F89F10]);
  [v5 score];
  double v20 = v19;

  id v21 = (void *)[v18 initWithLocation:v17 score:v20 sentimentScore:0.0];
  return v21;
}

+ (id)locationFromMapItemDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"MKMapItemGEOMapItem"];
  if (v3)
  {
    id v4 = [objc_alloc(MEMORY[0x1E4F646E0]) initWithData:v3];
    id v5 = v4;
    if (v4)
    {
      double v6 = [v4 name];
      if (![v6 length])
      {
        BOOL v7 = pp_locations_log_handle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing a name.", buf, 2u);
        }
      }
      double v8 = [v5 geoAddress];
      id v9 = [v8 structuredAddress];

      if (!v9)
      {
        uint64_t v10 = pp_locations_log_handle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v42 = 0;
          _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing a structured address.", v42, 2u);
        }
      }
      [v5 coordinate];
      if (v11 == 0.0)
      {
        [v5 coordinate];
        if (v12 == 0.0)
        {
          unsigned int v13 = pp_locations_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v41 = 0;
            _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing coordinates.", v41, 2u);
          }
        }
      }
      BOOL v28 = v3;
      id v38 = (void *)MEMORY[0x1E4F89E68];
      id v14 = NSNumber;
      [v5 coordinate];
      uint64_t v35 = objc_msgSend(v14, "numberWithDouble:");
      id v15 = NSNumber;
      [v5 coordinate];
      id v37 = [v15 numberWithDouble:v16];
      int v36 = [v9 thoroughfare];
      uint64_t v34 = [v9 subThoroughfare];
      uint64_t v33 = [v9 locality];
      uint64_t v32 = [v9 subLocality];
      id v31 = [v9 administrativeArea];
      [v9 subAdministrativeArea];
      v30 = float v40 = v5;
      uint64_t v29 = [v9 postCode];
      uint64_t v17 = [v9 countryCode];
      id v18 = [v9 country];
      double v19 = [v9 inlandWater];
      double v20 = [v9 ocean];
      id v21 = [v9 areaOfInterests];
      uint64_t v39 = [v38 placemarkWithLatitudeDegrees:v35 longitudeDegrees:v37 name:v6 thoroughfare:v36 subthoroughFare:v34 locality:v33 subLocality:v32 administrativeArea:v31 subAdministrativeArea:v30 postalCode:v29 countryCode:v17 country:v18 inlandWater:v19 ocean:v20 areasOfInterest:v21];

      id v5 = v40;
      id v22 = objc_alloc(MEMORY[0x1E4F89E48]);
      id v23 = [v40 _poiCategory];
      self;
      if ([v23 length])
      {
        id v3 = v28;
        char v24 = (void *)v39;
        if (([v23 isEqualToString:*MEMORY[0x1E4F63F50]] & 1) != 0
          || ([v23 isEqualToString:*MEMORY[0x1E4F63F60]] & 1) != 0
          || ([v23 isEqualToString:*MEMORY[0x1E4F63F90]] & 1) != 0
          || ([v23 isEqualToString:*MEMORY[0x1E4F64088]] & 1) != 0
          || ([v23 isEqualToString:*MEMORY[0x1E4F640A0]] & 1) != 0
          || ([v23 isEqualToString:*MEMORY[0x1E4F64190]] & 1) != 0)
        {
          unsigned __int16 v25 = 4;
        }
        else if (([v23 isEqualToString:*MEMORY[0x1E4F63FF0]] & 1) != 0 {
               || ([v23 isEqualToString:*MEMORY[0x1E4F64038]] & 1) != 0
        }
               || ([v23 isEqualToString:*MEMORY[0x1E4F640D8]] & 1) != 0
               || ([v23 isEqualToString:*MEMORY[0x1E4F640E0]] & 1) != 0
               || ([v23 isEqualToString:*MEMORY[0x1E4F64178]] & 1) != 0)
        {
          unsigned __int16 v25 = 1;
        }
        else if ([v23 isEqualToString:*MEMORY[0x1E4F63F70]])
        {
          unsigned __int16 v25 = 2;
        }
        else
        {
          unsigned __int16 v25 = 2;
          if (([v23 isEqualToString:*MEMORY[0x1E4F63FB0]] & 1) == 0)
          {
            if ([v23 isEqualToString:*MEMORY[0x1E4F64100]]) {
              unsigned __int16 v25 = 2;
            }
            else {
              unsigned __int16 v25 = 3;
            }
          }
        }
      }
      else
      {
        unsigned __int16 v25 = 0;
        id v3 = v28;
        char v24 = (void *)v39;
      }

      uint64_t v26 = (void *)[v22 initWithPlacemark:v24 category:v25 mostRelevantRecord:0];
    }
    else
    {
      double v6 = pp_locations_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItemStorage initWithData failed.", v44, 2u);
      }
      uint64_t v26 = 0;
    }
  }
  else
  {
    id v5 = pp_locations_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v45 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: no geo data.", v45, 2u);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

@end