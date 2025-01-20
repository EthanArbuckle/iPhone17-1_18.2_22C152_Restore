@interface PPSocialHighlightFeaturizer
+ (double)_intervalForBucketedString:(uint64_t)a1;
+ (id)_feedbackFeaturesForPublisher:(void *)a3 highlights:(void *)a4 features:;
+ (id)_flattenArraysInDictionary:(void *)a3 keyPath:;
+ (id)_lastInteractionsByContactForHighlights:(void *)a3 bundlePredicate:(void *)a4 mechanismPredicate:(void *)a5 interactionStore:;
+ (id)trialSpecifiedFeatures;
- (NSDictionary)featureValues;
- (PPSocialHighlightFeaturizer)initWithFeatureValues:(id)a3;
- (PPSocialHighlightFeaturizer)initWithFeedbackPublisher:(id)a3 topicStore:(id)a4 interactionStore:(id)a5 significantContactHandles:(id)a6 features:(id)a7 highlights:(id)a8;
- (id)featurizeHighlights:(id)a3;
@end

@implementation PPSocialHighlightFeaturizer

- (PPSocialHighlightFeaturizer)initWithFeedbackPublisher:(id)a3 topicStore:(id)a4 interactionStore:(id)a5 significantContactHandles:(id)a6 features:(id)a7 highlights:(id)a8
{
  uint64_t v374 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v280 = a4;
  id v279 = a5;
  id v14 = a7;
  id v15 = a8;
  id v276 = a6;
  v281 = objc_opt_new();
  v278 = v13;
  if (v13)
  {
    v16 = v13;
  }
  else
  {
    v17 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no feedback publisher provided.", buf, 2u);
    }

    v16 = 0;
  }
  v18 = +[PPSocialHighlightFeaturizer _feedbackFeaturesForPublisher:highlights:features:]((uint64_t)PPSocialHighlightFeaturizer, v16, v15, v14);
  [v281 addEntriesFromDictionary:v18];

  id v287 = v14;
  v288 = v15;
  if (v279)
  {
    id v313 = v279;
    id v308 = v15;
    id v19 = v14;
    v20 = off_1E65D3000;
    self;
    v21 = objc_opt_new();
    *(_OWORD *)v359 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    long long v362 = 0u;
    obuint64_t j = v19;
    uint64_t v323 = [obj countByEnumeratingWithState:v359 objects:&v367 count:16];
    if (!v323) {
      goto LABEL_28;
    }
    uint64_t v318 = *(void *)v360;
    uint64_t v298 = *MEMORY[0x1E4F8A0A8];
    v303 = v21;
    while (1)
    {
      for (uint64_t i = 0; i != v323; ++i)
      {
        if (*(void *)v360 != v318) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*(void *)&v359[8] + 8 * i);
        v24 = (void *)MEMORY[0x1CB79D060]();
        if ([v23 isEqualToString:@"lastMessagesInteractionWithSenderSecondsBeforeNow"])
        {
          context = v24;
          id v25 = v308;
          id v26 = v313;
          uint64_t v27 = self;
          v28 = (void *)MEMORY[0x1CB79D060](v27);
          v29 = (void *)MEMORY[0x1E4F28F60];
          *(void *)buf = v298;
          [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          v31 = v30 = v20;
          v32 = [v29 predicateWithFormat:@"bundleId == %@" argumentArray:v31];

          v33 = +[PPSocialHighlightFeaturizer _lastInteractionsByContactForHighlights:bundlePredicate:mechanismPredicate:interactionStore:]((uint64_t)v30[144], v25, v32, 0, v26);
        }
        else
        {
          if (![v23 isEqualToString:@"lastNonMessagesInteractionWithSenderSecondsBeforeNow"])goto LABEL_26; {
          context = v24;
          }
          v34 = v20;
          id v289 = v308;
          id v35 = v313;
          uint64_t v36 = self;
          v37 = (void *)MEMORY[0x1CB79D060](v36);
          v38 = (void *)MEMORY[0x1E4F28F60];
          *(void *)buf = &unk_1F256A748;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          v40 = [v38 predicateWithFormat:@"mechanism in %@" argumentArray:v39];

          v41 = (void *)MEMORY[0x1CB79D060]();
          v42 = (void *)MEMORY[0x1E4F28F60];
          *(void *)&aBlocuint64_t k = v298;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&aBlock count:1];
          v44 = [v42 predicateWithFormat:@"bundleId != %@" argumentArray:v43];

          v33 = +[PPSocialHighlightFeaturizer _lastInteractionsByContactForHighlights:bundlePredicate:mechanismPredicate:interactionStore:]((uint64_t)v34[144], v289, v44, v40, v35);
        }
        v45 = (void *)MEMORY[0x1E4F1CC08];
        if (v33) {
          v45 = v33;
        }
        id v46 = v45;

        id v47 = v46;
        self;
        v48 = objc_opt_new();
        aBlocuint64_t k = 0u;
        long long v364 = 0u;
        long long v365 = 0u;
        long long v366 = 0u;
        id v49 = v47;
        uint64_t v50 = [v49 countByEnumeratingWithState:&aBlock objects:buf count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v364;
          do
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v364 != v52) {
                objc_enumerationMutation(v49);
              }
              uint64_t v54 = *(void *)(*((void *)&aBlock + 1) + 8 * j);
              v55 = NSNumber;
              v56 = [v49 objectForKeyedSubscript:v54];
              [v56 timeIntervalSinceNow];
              v58 = [v55 numberWithDouble:-v57];
              [v48 setObject:v58 forKeyedSubscript:v54];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&aBlock objects:buf count:16];
          }
          while (v51);
        }

        v59 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v48, &__block_literal_global_132);
        v21 = v303;
        [v303 setObject:v59 forKeyedSubscript:v23];

        v20 = off_1E65D3000;
        v24 = context;
LABEL_26:
      }
      uint64_t v323 = [obj countByEnumeratingWithState:v359 objects:&v367 count:16];
      if (!v323)
      {
LABEL_28:

        [v281 addEntriesFromDictionary:v21];
        id v14 = v287;
        goto LABEL_31;
      }
    }
  }
  v21 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no interaction store provided.", buf, 2u);
  }
LABEL_31:

  if (!v280)
  {
    v102 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v102, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no topic store provided.", buf, 2u);
    }
    v103 = v288;
    goto LABEL_152;
  }
  id v60 = v280;
  id v61 = v288;
  id v62 = v14;
  uint64_t v63 = self;
  v64 = (void *)MEMORY[0x1CB79D060](v63);
  v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"meanTopicScore", @"medianTopicScore", @"topicCount", @"maxTopicScore", @"minTopicScore", 0);
  v274 = v65;
  v275 = v62;
  if (![v65 intersectsSet:v62])
  {
    v102 = MEMORY[0x1E4F1CC08];
    v103 = v288;
    goto LABEL_151;
  }
  id v66 = v61;
  id v284 = v60;
  uint64_t v271 = self;
  v67 = objc_opt_new();
  v273 = objc_opt_new();
  long long v346 = 0u;
  long long v347 = 0u;
  long long v348 = 0u;
  long long v349 = 0u;
  id v68 = v66;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v346 objects:&v367 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v347;
    do
    {
      for (uint64_t k = 0; k != v70; ++k)
      {
        if (*(void *)v347 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v346 + 1) + 8 * k);
        v74 = (void *)MEMORY[0x1CB79D060]();
        v75 = [v73 attributionIdentifier];

        if (v75)
        {
          v76 = [v73 highlightIdentifier];
          v77 = [v73 attributionIdentifier];
          [v67 setObject:v76 forKeyedSubscript:v77];
        }
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v346 objects:&v367 count:16];
    }
    while (v70);
  }

  id v282 = v61;
  id v283 = v60;
  if ([v67 count])
  {
    v78 = objc_opt_new();
    v79 = objc_opt_new();
    id v80 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v81 = [v67 allKeys];
    uint64_t v82 = [v80 initWithArray:v81];
    [v79 setMatchingDocumentIds:v82];

    [v79 setLimit:50];
    id v372 = 0;
    *(void *)&long long v350 = MEMORY[0x1E4F143A8];
    *((void *)&v350 + 1) = 3221225472;
    *(void *)&long long v351 = __79__PPSocialHighlightFeaturizer__topicScoresMatchingSocialHighlights_topicStore___block_invoke;
    *((void *)&v351 + 1) = &unk_1E65D7D80;
    v83 = v78;
    *(void *)&long long v352 = v83;
    id v304 = v273;
    *((void *)&v352 + 1) = v304;
    id v84 = v67;
    *(void *)&long long v353 = v84;
    *((void *)&v353 + 1) = sel__topicScoresMatchingSocialHighlights_topicStore_;
    uint64_t v354 = v271;
    v269 = v79;
    LOBYTE(v82) = [v284 iterTopicRecordsWithQuery:v79 error:&v372 block:&v350];
    v270 = (__CFString *)v372;
    id v14 = v287;
    v272 = v83;
    if (v82)
    {
      if ([v83 count])
      {
        id v309 = v68;
        v299 = v67;
        v85 = v83;
        id v86 = v284;
        uint64_t v87 = self;
        v88 = (void *)MEMORY[0x1CB79D060](v87);
        id v89 = v86;
        v90 = [v86 cachedTopicScores];
        v91 = objc_opt_new();
        aBlocuint64_t k = 0u;
        long long v364 = 0u;
        long long v365 = 0u;
        long long v366 = 0u;
        v92 = v85;
        uint64_t v93 = [v92 countByEnumeratingWithState:&aBlock objects:buf count:16];
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v95 = *(void *)v364;
          while (2)
          {
            for (uint64_t m = 0; m != v94; ++m)
            {
              if (*(void *)v364 != v95) {
                objc_enumerationMutation(v92);
              }
              uint64_t v97 = *(void *)(*((void *)&aBlock + 1) + 8 * m);
              v98 = [v90 objectForKeyedSubscript:v97];

              if (!v98)
              {
                v107 = pp_social_highlights_log_handle();
                v101 = v89;
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v359 = 0;
                  _os_log_impl(&dword_1CA9A8000, v107, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: missing QID overlap with the cache, will rerank.", v359, 2u);
                }

                id v100 = 0;
                id v68 = v309;
                goto LABEL_67;
              }
              v99 = [v90 objectForKeyedSubscript:v97];
              [v91 setObject:v99 forKeyedSubscript:v97];
            }
            uint64_t v94 = [v92 countByEnumeratingWithState:&aBlock objects:buf count:16];
            if (v94) {
              continue;
            }
            break;
          }
        }

        id v100 = v91;
        id v68 = v309;
        v101 = v89;
LABEL_67:

        if (v100)
        {
          id v61 = v282;
        }
        else
        {
          contexta = (void *)MEMORY[0x1CB79D060]();
          v108 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v108, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: topic cache is invalid, performing reranking", buf, 2u);
          }

          id v100 = (id)objc_opt_new();
          uint64_t v109 = objc_opt_new();
          [v269 setMatchingTopicIds:v92];
          [v269 setLimit:50];
          v371 = v270;
          v324 = (void *)v109;
          v110 = [v101 rankedTopicsWithQuery:v109 error:&v371];
          v320 = v371;

          long long v344 = 0u;
          long long v345 = 0u;
          long long v342 = 0u;
          long long v343 = 0u;
          id v111 = v110;
          uint64_t v112 = [v111 countByEnumeratingWithState:&v342 objects:buf count:16];
          id v61 = v282;
          if (v112)
          {
            uint64_t v113 = v112;
            uint64_t v114 = *(void *)v343;
            do
            {
              for (uint64_t n = 0; n != v113; ++n)
              {
                if (*(void *)v343 != v114) {
                  objc_enumerationMutation(v111);
                }
                v116 = *(void **)(*((void *)&v342 + 1) + 8 * n);
                v117 = NSNumber;
                [v116 score];
                v118 = objc_msgSend(v117, "numberWithDouble:");
                v119 = [v116 item];
                v120 = [v119 topicIdentifier];
                [v100 setObject:v118 forKeyedSubscript:v120];
              }
              uint64_t v113 = [v111 countByEnumeratingWithState:&v342 objects:buf count:16];
            }
            while (v113);
          }

          v270 = v320;
          id v68 = v309;
        }
        v121 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v122 = [v84 count];
        uint64_t v123 = objc_msgSend(v121, "_pas_proxyArrayWithObject:repetitions:", MEMORY[0x1E4F1CBF0], v122);
        id v124 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v125 = [v84 allValues];
        v268 = (void *)v123;
        v319 = (void *)[v124 initWithObjects:v123 forKeys:v125];

        long long v340 = 0u;
        long long v341 = 0u;
        long long v338 = 0u;
        long long v339 = 0u;
        v106 = v100;
        v103 = v288;
        id v60 = v283;
        v67 = v299;
        v126 = v304;
        uint64_t v314 = [v106 countByEnumeratingWithState:&v338 objects:&aBlock count:16];
        if (v314)
        {
          uint64_t v127 = *(void *)v339;
          uint64_t v290 = *(void *)v339;
          obja = v106;
          do
          {
            uint64_t v128 = 0;
            do
            {
              if (*(void *)v339 != v127) {
                objc_enumerationMutation(v106);
              }
              uint64_t v325 = v128;
              uint64_t v129 = *(void *)(*((void *)&v338 + 1) + 8 * v128);
              v130 = [v126 objectForKeyedSubscript:v129];
              v131 = [v106 objectForKeyedSubscript:v129];
              contextb = v130;
              if (v131)
              {
                if (v130) {
                  goto LABEL_89;
                }
              }
              else
              {
                v141 = [MEMORY[0x1E4F28B00] currentHandler];
                [v141 handleFailureInMethod:sel__topicScoresMatchingSocialHighlights_topicStore_ object:v271 file:@"PPSocialHighlightFeaturizer.m" lineNumber:525 description:@"Iterating through keys should always result in a value"];

                v130 = contextb;
                if (contextb)
                {
LABEL_89:
                  long long v336 = 0u;
                  long long v337 = 0u;
                  long long v334 = 0u;
                  long long v335 = 0u;
                  v132 = v130;
                  uint64_t v133 = [v132 countByEnumeratingWithState:&v334 objects:v359 count:16];
                  if (v133)
                  {
                    uint64_t v134 = v133;
                    uint64_t v135 = *(void *)v335;
                    do
                    {
                      for (iuint64_t i = 0; ii != v134; ++ii)
                      {
                        if (*(void *)v335 != v135) {
                          objc_enumerationMutation(v132);
                        }
                        uint64_t v137 = *(void *)(*((void *)&v334 + 1) + 8 * ii);
                        v138 = (void *)MEMORY[0x1CB79D060]();
                        v139 = [v319 objectForKeyedSubscript:v137];
                        v140 = [v139 arrayByAddingObject:v131];
                        [v319 setObject:v140 forKeyedSubscript:v137];
                      }
                      uint64_t v134 = [v132 countByEnumeratingWithState:&v334 objects:v359 count:16];
                    }
                    while (v134);
                    v103 = v288;
                    uint64_t v127 = v290;
                    id v61 = v282;
                    id v60 = v283;
                    v67 = v299;
                    v126 = v304;
                    v106 = obja;
                  }
                  goto LABEL_100;
                }
              }
              v132 = pp_social_highlights_log_handle();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v355 = 138739971;
                *(void *)&v355[4] = v129;
                _os_log_debug_impl(&dword_1CA9A8000, v132, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: no highlights found for QID: %{sensitive}@", v355, 0xCu);
              }
LABEL_100:

              uint64_t v128 = v325 + 1;
              id v68 = v309;
            }
            while (v325 + 1 != v314);
            uint64_t v314 = [v106 countByEnumeratingWithState:&v338 objects:&aBlock count:16];
          }
          while (v314);
        }

        v105 = off_1E65D3000;
        id v14 = v287;
      }
      else
      {
        v106 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightRanker: found no QIDs from any highlight.", buf, 2u);
        }
        v319 = (void *)MEMORY[0x1E4F1CC08];
        v105 = off_1E65D3000;
        v103 = v288;
      }
    }
    else
    {
      v106 = pp_social_highlights_log_handle();
      v105 = off_1E65D3000;
      v103 = v288;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v270;
        _os_log_error_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_ERROR, "PPSocialHighlightRanker: error querying topic store: %@", buf, 0xCu);
      }
      v319 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v104 = pp_social_highlights_log_handle();
    id v14 = v287;
    v272 = v104;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v104, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: not performing topic scoring features due to no highlights", buf, 2u);
    }
    v319 = (void *)MEMORY[0x1E4F1CC08];
    v105 = off_1E65D3000;
    v103 = v288;
  }

  v102 = objc_opt_new();
  *(_OWORD *)v359 = 0u;
  long long v360 = 0u;
  long long v361 = 0u;
  long long v362 = 0u;
  id v285 = v275;
  id objb = (id)[v285 countByEnumeratingWithState:v359 objects:buf count:16];
  if (!objb) {
    goto LABEL_150;
  }
  uint64_t v291 = *(void *)v360;
  v286 = v102;
  do
  {
    for (juint64_t j = 0; jj != objb; juint64_t j = (char *)jj + 1)
    {
      if (*(void *)v360 != v291) {
        objc_enumerationMutation(v285);
      }
      v143 = *(void **)(*(void *)&v359[8] + 8 * (void)jj);
      v144 = (void *)MEMORY[0x1CB79D060]();
      v305 = v144;
      id v310 = jj;
      v300 = v143;
      if ([v143 isEqualToString:@"topicCount"])
      {
        v145 = objc_opt_new();
        long long v350 = 0u;
        long long v351 = 0u;
        long long v352 = 0u;
        long long v353 = 0u;
        id v146 = v319;
        uint64_t v147 = [v146 countByEnumeratingWithState:&v350 objects:&v367 count:16];
        if (v147)
        {
          uint64_t v148 = v147;
          uint64_t v149 = *(void *)v351;
          do
          {
            for (kuint64_t k = 0; kk != v148; ++kk)
            {
              if (*(void *)v351 != v149) {
                objc_enumerationMutation(v146);
              }
              uint64_t v151 = *(void *)(*((void *)&v350 + 1) + 8 * kk);
              v152 = NSNumber;
              v153 = [v146 objectForKeyedSubscript:v151];
              v154 = objc_msgSend(v152, "numberWithUnsignedInteger:", objc_msgSend(v153, "count"));
              [v145 setObject:v154 forKeyedSubscript:v151];
            }
            uint64_t v148 = [v146 countByEnumeratingWithState:&v350 objects:&v367 count:16];
          }
          while (v148);
        }

        id v14 = v287;
        v103 = v288;
        v102 = v286;
      }
      else
      {
        if ([v143 isEqualToString:@"meanTopicScore"])
        {
          uint64_t v155 = (uint64_t)v105[144];
          v156 = v319;
          v157 = @"@avg.self";
        }
        else
        {
          if ([v143 isEqualToString:@"medianTopicScore"])
          {
            v145 = objc_opt_new();
            long long v346 = 0u;
            long long v347 = 0u;
            long long v348 = 0u;
            long long v349 = 0u;
            id v158 = v319;
            contextc = (void *)[v158 countByEnumeratingWithState:&v346 objects:&aBlock count:16];
            if (contextc)
            {
              uint64_t v326 = *(void *)v347;
              do
              {
                for (muint64_t m = 0; mm != contextc; muint64_t m = (char *)mm + 1)
                {
                  if (*(void *)v347 != v326) {
                    objc_enumerationMutation(v158);
                  }
                  uint64_t v160 = *(void *)(*((void *)&v346 + 1) + 8 * (void)mm);
                  id v161 = [v158 objectForKeyedSubscript:v160];
                  uint64_t v162 = self;
                  v163 = (void *)MEMORY[0x1CB79D060](v162);
                  if ([v161 count])
                  {
                    if ([v161 count] == 1)
                    {
                      v164 = [v161 objectAtIndexedSubscript:0];
                    }
                    else if ([v161 count] == 2)
                    {
                      v165 = NSNumber;
                      v166 = [v161 objectAtIndexedSubscript:0];
                      [v166 doubleValue];
                      double v168 = v167;
                      v169 = [v161 objectAtIndexedSubscript:1];
                      [v169 doubleValue];
                      v164 = [v165 numberWithDouble:(v168 + v170) * 0.5];
                    }
                    else
                    {
                      v171 = [v161 sortedArrayUsingComparator:&__block_literal_global_147];
                      unint64_t v172 = (unint64_t)[v171 count] >> 1;
                      if ([v171 count])
                      {
                        v164 = [v171 objectAtIndexedSubscript:v172];
                      }
                      else
                      {
                        v315 = NSNumber;
                        v173 = [v171 objectAtIndexedSubscript:v172];
                        [v173 doubleValue];
                        double v175 = v174;
                        v176 = [v171 objectAtIndexedSubscript:v172 - 1];
                        [v176 doubleValue];
                        v164 = [v315 numberWithDouble:(v175 + v177) * 0.5];
                      }
                    }
                  }
                  else
                  {
                    v164 = 0;
                  }

                  if (v164) {
                    v178 = v164;
                  }
                  else {
                    v178 = &unk_1F2569260;
                  }
                  [v145 setObject:v178 forKeyedSubscript:v160];
                }
                contextc = (void *)[v158 countByEnumeratingWithState:&v346 objects:&aBlock count:16];
              }
              while (contextc);
            }

            id v14 = v287;
            v103 = v288;
            id v61 = v282;
            id v60 = v283;
            v102 = v286;
            goto LABEL_147;
          }
          if ([v143 isEqualToString:@"maxTopicScore"])
          {
            uint64_t v155 = (uint64_t)v105[144];
            v156 = v319;
            v157 = @"@max.self";
          }
          else
          {
            if (![v143 isEqualToString:@"minTopicScore"]) {
              goto LABEL_148;
            }
            uint64_t v155 = (uint64_t)v105[144];
            v156 = v319;
            v157 = @"@min.self";
          }
        }
        v145 = +[PPSocialHighlightFeaturizer _flattenArraysInDictionary:keyPath:](v155, v156, v157);
      }
LABEL_147:
      v179 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v145, &__block_literal_global_13268);
      [v102 setObject:v179 forKeyedSubscript:v300];

      v105 = off_1E65D3000;
      v144 = v305;
      juint64_t j = v310;
LABEL_148:
    }
    id objb = (id)[v285 countByEnumeratingWithState:v359 objects:buf count:16];
  }
  while (objb);
LABEL_150:

LABEL_151:
  [v281 addEntriesFromDictionary:v102];
LABEL_152:

  id objc = v103;
  id contextd = v276;
  id v180 = v14;
  self;
  v316 = objc_opt_new();
  long long v367 = 0u;
  long long v368 = 0u;
  long long v369 = 0u;
  long long v370 = 0u;
  id v311 = v180;
  uint64_t v181 = [v311 countByEnumeratingWithState:&v367 objects:buf count:16];
  if (!v181) {
    goto LABEL_188;
  }
  uint64_t v182 = v181;
  uint64_t v183 = *(void *)v368;
  while (2)
  {
    uint64_t v184 = 0;
    while (2)
    {
      if (*(void *)v368 != v183) {
        objc_enumerationMutation(v311);
      }
      v185 = *(void **)(*((void *)&v367 + 1) + 8 * v184);
      v186 = (void *)MEMORY[0x1CB79D060]();
      id v187 = v185;
      id v188 = contextd;
      self;
      *(void *)&aBlocuint64_t k = MEMORY[0x1E4F143A8];
      *((void *)&aBlock + 1) = 3221225472;
      *(void *)&long long v364 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke;
      *((void *)&v364 + 1) = &unk_1E65D7EC0;
      id v189 = v187;
      *(void *)&long long v365 = v189;
      v190 = _Block_copy(&aBlock);
      *(void *)v359 = MEMORY[0x1E4F143A8];
      *(void *)&v359[8] = 3221225472;
      *(void *)&long long v360 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_2;
      *((void *)&v360 + 1) = &unk_1E65D7EC0;
      id v191 = v189;
      *(void *)&long long v361 = v191;
      v192 = _Block_copy(v359);
      if ([v191 isEqualToString:@"creationDateSecondsBeforeNow"])
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_273;
        goto LABEL_167;
      }
      if ([v191 isEqualToString:@"highlightDateSecondsBeforeNow"])
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_276;
        goto LABEL_167;
      }
      if ([v191 isEqualToString:@"isManuallySyndicated"])
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_278;
        goto LABEL_167;
      }
      if ([v191 hasPrefix:@"creationDateInInterval"])
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = v190;
        goto LABEL_167;
      }
      if (![v191 hasPrefix:@"highlightDateInInterval"])
      {
        *(void *)&long long v350 = MEMORY[0x1E4F143A8];
        *((void *)&v350 + 1) = 3221225472;
        *(void *)&long long v351 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_286;
        *((void *)&v351 + 1) = &unk_1E65D7EC0;
        *(void *)&long long v352 = v188;
        v196 = _Block_copy(&v350);
        v306 = v196;
        if ([v191 isEqualToString:@"messagesThreadHasDisplayName"])
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_281;
        }
        else if ([v191 isEqualToString:@"messagesThreadHasGroupPhoto"])
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_283;
        }
        else if ([v191 isEqualToString:@"messagesConversationAutoDonating"])
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_285;
        }
        else if ([v191 isEqualToString:@"isContactSignificant"])
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = v196;
        }
        else if ([v191 isEqualToString:@"sentFromMe"])
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_288;
        }
        else
        {
          if (![v191 isEqualToString:@"isCollaboration"])
          {
            v195 = 0;
            goto LABEL_185;
          }
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_290_13274;
        }
        v195 = -[PPSocialHighlightPropertyValueProvider initWithProvidingBlock:](v197, v198);
LABEL_185:

        goto LABEL_168;
      }
      v193 = [PPSocialHighlightPropertyValueProvider alloc];
      v194 = v192;
LABEL_167:
      v195 = -[PPSocialHighlightPropertyValueProvider initWithProvidingBlock:](v193, v194);
LABEL_168:

      if (v195) {
        [v316 setObject:v195 forKeyedSubscript:v191];
      }

      if (v182 != ++v184) {
        continue;
      }
      break;
    }
    uint64_t v199 = [v311 countByEnumeratingWithState:&v367 objects:buf count:16];
    uint64_t v182 = v199;
    if (v199) {
      continue;
    }
    break;
  }
LABEL_188:

  [v281 addEntriesFromDictionary:v316];
  id v200 = objc;
  id v201 = v311;
  self;
  v317 = objc_opt_new();
  long long v346 = 0u;
  long long v347 = 0u;
  long long v348 = 0u;
  long long v349 = 0u;
  id objd = v201;
  id v312 = (id)[objd countByEnumeratingWithState:&v346 objects:buf count:16];
  if (v312)
  {
    uint64_t v307 = *(void *)v347;
    id v292 = v200;
    do
    {
      for (nuint64_t n = 0; nn != v312; nuint64_t n = (char *)nn + 1)
      {
        if (*(void *)v347 != v307) {
          objc_enumerationMutation(objd);
        }
        v203 = *(void **)(*((void *)&v346 + 1) + 8 * (void)nn);
        v204 = (void *)MEMORY[0x1CB79D060]();
        if ([v203 isEqualToString:@"countDistinctHighlights"])
        {
          id v205 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          v206 = objc_msgSend(v200, "_pas_mappedArrayWithTransform:", &__block_literal_global_182);
          v207 = (void *)[v205 initWithArray:v206];

          v208 = [PPSocialHighlightStaticFeatureProvider alloc];
          v371 = &stru_1F253DF18;
          v209 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v207, "count"));
          id v372 = v209;
          v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v372 forKeys:&v371 count:1];
          v211 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:](v208, v210, &__block_literal_global_125);
          [v317 setObject:v211 forKeyedSubscript:v203];
        }
        if ([v203 isEqualToString:@"countThreadsWithHighlightIdentifier"])
        {
          v321 = nn;
          v327 = v204;
          v212 = objc_opt_new();
          long long v342 = 0u;
          long long v343 = 0u;
          long long v344 = 0u;
          long long v345 = 0u;
          id v213 = v200;
          id v214 = v200;
          uint64_t v215 = [v214 countByEnumeratingWithState:&v342 objects:&v367 count:16];
          if (v215)
          {
            uint64_t v216 = v215;
            uint64_t v217 = *(void *)v343;
            do
            {
              for (uint64_t i1 = 0; i1 != v216; ++i1)
              {
                if (*(void *)v343 != v217) {
                  objc_enumerationMutation(v214);
                }
                v219 = *(void **)(*((void *)&v342 + 1) + 8 * i1);
                v220 = [v219 highlightIdentifier];

                if (v220)
                {
                  v221 = [v219 highlightIdentifier];
                  v222 = [v212 objectForKeyedSubscript:v221];

                  if (!v222)
                  {
                    v223 = objc_opt_new();
                    v224 = [v219 highlightIdentifier];
                    [v212 setObject:v223 forKeyedSubscript:v224];
                  }
                  v225 = [v219 domainIdentifier];

                  if (v225)
                  {
                    v226 = [v219 highlightIdentifier];
                    v227 = [v212 objectForKeyedSubscript:v226];
                    v228 = [v219 domainIdentifier];
                    [v227 addObject:v228];
                  }
                }
              }
              uint64_t v216 = [v214 countByEnumeratingWithState:&v342 objects:&v367 count:16];
            }
            while (v216);
          }

          v229 = objc_opt_new();
          long long v338 = 0u;
          long long v339 = 0u;
          long long v340 = 0u;
          long long v341 = 0u;
          id v230 = v212;
          uint64_t v231 = [v230 countByEnumeratingWithState:&v338 objects:&aBlock count:16];
          if (v231)
          {
            uint64_t v232 = v231;
            uint64_t v233 = *(void *)v339;
            do
            {
              for (uint64_t i2 = 0; i2 != v232; ++i2)
              {
                if (*(void *)v339 != v233) {
                  objc_enumerationMutation(v230);
                }
                uint64_t v235 = *(void *)(*((void *)&v338 + 1) + 8 * i2);
                v236 = NSNumber;
                v237 = [v230 objectForKeyedSubscript:v235];
                v238 = objc_msgSend(v236, "numberWithUnsignedInteger:", objc_msgSend(v237, "count"));
                [v229 setObject:v238 forKeyedSubscript:v235];
              }
              uint64_t v232 = [v230 countByEnumeratingWithState:&v338 objects:&aBlock count:16];
            }
            while (v232);
          }

          v239 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v229, &__block_literal_global_13268);
          [v317 setObject:v239 forKeyedSubscript:v203];

          nuint64_t n = v321;
          id v200 = v213;
        }
        else if ([v203 isEqualToString:@"countManualHighlightsFromSender"])
        {
          v301 = v203;
          v322 = nn;
          v327 = v204;
          id v230 = (id)objc_opt_new();
          long long v334 = 0u;
          long long v335 = 0u;
          long long v336 = 0u;
          long long v337 = 0u;
          id contexte = v200;
          uint64_t v240 = [contexte countByEnumeratingWithState:&v334 objects:v359 count:16];
          if (v240)
          {
            uint64_t v241 = v240;
            uint64_t v242 = *(void *)v335;
            do
            {
              for (uint64_t i3 = 0; i3 != v241; ++i3)
              {
                if (*(void *)v335 != v242) {
                  objc_enumerationMutation(contexte);
                }
                v244 = *(void **)(*((void *)&v334 + 1) + 8 * i3);
                if ([v244 highlightType] == 2)
                {
                  v245 = [v244 sender];
                  v246 = [v245 handle];

                  if (v246)
                  {
                    v247 = NSNumber;
                    v248 = [v244 sender];
                    v249 = [v248 handle];
                    v250 = [v230 objectForKeyedSubscript:v249];
                    v251 = objc_msgSend(v247, "numberWithInteger:", objc_msgSend(v250, "integerValue") + 1);
                    v252 = [v244 sender];
                    v253 = [v252 handle];
                    [v230 setObject:v251 forKeyedSubscript:v253];
                  }
                }
              }
              uint64_t v241 = [contexte countByEnumeratingWithState:&v334 objects:v359 count:16];
            }
            while (v241);
          }

          v229 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v230, &__block_literal_global_132);
          [v317 setObject:v229 forKeyedSubscript:v301];
          id v200 = v292;
          nuint64_t n = v322;
        }
        else
        {
          if (![v203 isEqualToString:@"countManualHighlightsFromThread"]) {
            goto LABEL_241;
          }
          v302 = v203;
          v327 = v204;
          id v230 = (id)objc_opt_new();
          *(_OWORD *)v355 = 0u;
          long long v356 = 0u;
          long long v357 = 0u;
          long long v358 = 0u;
          id v254 = v200;
          uint64_t v255 = [v254 countByEnumeratingWithState:v355 objects:&v350 count:16];
          if (v255)
          {
            uint64_t v256 = v255;
            uint64_t v257 = *(void *)v356;
            do
            {
              for (uint64_t i4 = 0; i4 != v256; ++i4)
              {
                if (*(void *)v356 != v257) {
                  objc_enumerationMutation(v254);
                }
                v259 = *(void **)(*(void *)&v355[8] + 8 * i4);
                if ([v259 highlightType] == 2)
                {
                  v260 = [v259 domainIdentifier];

                  if (v260)
                  {
                    v261 = NSNumber;
                    v262 = [v259 domainIdentifier];
                    v263 = [v230 objectForKeyedSubscript:v262];
                    v264 = objc_msgSend(v261, "numberWithInteger:", objc_msgSend(v263, "integerValue") + 1);
                    v265 = [v259 domainIdentifier];
                    [v230 setObject:v264 forKeyedSubscript:v265];
                  }
                }
              }
              uint64_t v256 = [v254 countByEnumeratingWithState:v355 objects:&v350 count:16];
            }
            while (v256);
          }

          v229 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v230, &__block_literal_global_130);
          [v317 setObject:v229 forKeyedSubscript:v302];
          id v200 = v292;
        }

        v204 = v327;
LABEL_241:
      }
      id v312 = (id)[objd countByEnumeratingWithState:&v346 objects:buf count:16];
    }
    while (v312);
  }

  [v281 addEntriesFromDictionary:v317];
  v266 = [(PPSocialHighlightFeaturizer *)self initWithFeatureValues:v281];

  return v266;
}

+ (id)_flattenArraysInDictionary:(void *)a3 keyPath:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v18);
        uint64_t v14 = [v13 valueForKeyPath:v5];
        id v15 = (void *)v14;
        if (v14) {
          v16 = (void *)v14;
        }
        else {
          v16 = &unk_1F2569260;
        }
        [v6 setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)_lastInteractionsByContactForHighlights:(void *)a3 bundlePredicate:(void *)a4 mechanismPredicate:(void *)a5 interactionStore:
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v71 = a3;
  id v70 = a4;
  id v69 = a5;
  self;
  id v9 = v8;
  self;
  uint64_t v10 = objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v87 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E4F5B3B0];
        v17 = [v15 sender];
        long long v18 = [v17 handle];
        long long v19 = [v16 normalizedStringFromContactString:v18];

        if (v19)
        {
          [v10 addObject:v19];
        }
        else
        {
          long long v20 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            long long v21 = [v15 highlightIdentifier];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v21;
            _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: no contact for highlight %@, will be unresponsive to recency.", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v12);
  }

  v22 = [v10 allObjects];

  if ([v22 count])
  {
    uint64_t v23 = (void *)MEMORY[0x1CB79D060]();
    v24 = (void *)MEMORY[0x1E4F28F60];
    v85 = v22;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v26 = id v25 = v22;
    uint64_t v27 = [v24 predicateWithFormat:@"sender.identifier in %@" argumentArray:v26];

    v28 = (void *)MEMORY[0x1E4F28F60];
    v67 = v25;
    id v84 = v25;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    v30 = [v28 predicateWithFormat:@"ANY recipients.identifier in %@" argumentArray:v29];

    id v31 = objc_alloc(MEMORY[0x1E4F28BA0]);
    v83[0] = v27;
    v83[1] = v30;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    v33 = (void *)[v31 initWithType:2 subpredicates:v32];

    v82[0] = v71;
    v82[1] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    id v35 = (void *)[v34 mutableCopy];

    if (v70) {
      objc_msgSend(v35, "addObject:");
    }
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v35];

    v37 = (void *)MEMORY[0x1CB79D060]();
    v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v81 = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];

    id v76 = 0;
    id v66 = (void *)v36;
    v40 = [v69 queryInteractionsUsingPredicate:v36 sortDescriptors:v39 limit:50 error:&v76];
    v41 = v76;
    v42 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 138412290;
      v91 = v40;
      _os_log_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: found results %@", v90, 0xCu);
    }

    id v68 = v40;
    if (v40)
    {
      if (![obj count] || -[NSObject count](v40, "count"))
      {

        v43 = v40;
        self;
        v44 = objc_opt_new();
        long long buf = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        v72 = v43;
        uint64_t v74 = [v72 countByEnumeratingWithState:&buf objects:v90 count:16];
        if (v74)
        {
          uint64_t v73 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v74; ++j)
            {
              if (*(void *)v93 != v73) {
                objc_enumerationMutation(v72);
              }
              id v46 = *(void **)(*((void *)&buf + 1) + 8 * j);
              id v47 = [v46 startDate];

              if (v47)
              {
                v48 = [v46 sender];
                id v49 = [v48 identifier];

                uint64_t v50 = [v46 recipients];
                uint64_t v51 = objc_msgSend(v50, "_pas_mappedArrayWithTransform:", &__block_literal_global_201);

                if (v49)
                {
                  uint64_t v52 = [v44 objectForKeyedSubscript:v49];

                  if (!v52)
                  {
                    v53 = [v46 startDate];
                    [v44 setObject:v53 forKeyedSubscript:v49];
                  }
                }
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                id v54 = v51;
                uint64_t v55 = [v54 countByEnumeratingWithState:&v77 objects:&v86 count:16];
                if (v55)
                {
                  uint64_t v56 = v55;
                  uint64_t v57 = *(void *)v78;
                  do
                  {
                    for (uint64_t k = 0; k != v56; ++k)
                    {
                      if (*(void *)v78 != v57) {
                        objc_enumerationMutation(v54);
                      }
                      uint64_t v59 = *(void *)(*((void *)&v77 + 1) + 8 * k);
                      id v60 = [v44 objectForKeyedSubscript:v59];

                      if (!v60)
                      {
                        id v61 = [v46 startDate];
                        [v44 setObject:v61 forKeyedSubscript:v59];
                      }
                    }
                    uint64_t v56 = [v54 countByEnumeratingWithState:&v77 objects:&v86 count:16];
                  }
                  while (v56);
                }
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&buf objects:v90 count:16];
          }
          while (v74);
        }

        id v62 = v70;
        goto LABEL_52;
      }
      v64 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v90 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v64, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: interaction store returned no interactions, but highlights should be included in interactions.", v90, 2u);
      }
      id v62 = v70;
    }
    else
    {
      v64 = pp_social_highlights_log_handle();
      id v62 = v70;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138412290;
        v91 = v41;
        _os_log_error_impl(&dword_1CA9A8000, v64, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: interaction store query failed %@", v90, 0xCu);
      }
    }

    v44 = 0;
LABEL_52:

    v22 = v67;
    goto LABEL_53;
  }
  uint64_t v63 = pp_social_highlights_log_handle();
  id v68 = v63;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v90 = 0;
    _os_log_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no handles found.", v90, 2u);
  }
  v44 = 0;
  id v62 = v70;
LABEL_53:

  return v44;
}

- (PPSocialHighlightFeaturizer)initWithFeatureValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSocialHighlightFeaturizer;
  v6 = [(PPSocialHighlightFeaturizer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureValues, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

+ (id)_feedbackFeaturesForPublisher:(void *)a3 highlights:(void *)a4 features:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = self;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__13340;
  uint64_t v55 = __Block_byref_object_dispose__13341;
  id v56 = 0;
  id v56 = (id)objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v48;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
        id v13 = v11;
        id v14 = v6;
        self;
        if ([v13 isEqualToString:@"countHiddenFromThread"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 2;
          goto LABEL_14;
        }
        if ([v13 isEqualToString:@"countEngagedFromThread"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 1;
          goto LABEL_14;
        }
        if ([v13 isEqualToString:@"countOfferedFromThread"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 0;
          goto LABEL_14;
        }
        if ([v13 isEqualToString:@"countEngagedAppFromThread"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 3;
LABEL_14:
          v17 = &__block_literal_global_261;
          long long v18 = &__block_literal_global_130;
LABEL_15:
          long long v19 = [(PPSocialHighlightEngagementProvider *)v15 initWithFeedbackType:v16 feedbackGroupByBlock:v17 highlightKeyBlock:v18 highlights:v14];
LABEL_16:
          long long v20 = v19;
          goto LABEL_17;
        }
        if ([v13 isEqualToString:@"countHiddenFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 2;
LABEL_31:
          v17 = &__block_literal_global_263;
          long long v18 = &__block_literal_global_132;
          goto LABEL_15;
        }
        if ([v13 isEqualToString:@"countEngagedFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 1;
          goto LABEL_31;
        }
        if ([v13 isEqualToString:@"countOfferedFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 0;
          goto LABEL_31;
        }
        if ([v13 isEqualToString:@"countEngagedAppFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 3;
          goto LABEL_31;
        }
        if ([v13 isEqualToString:@"countHiddenMatchingDomain"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 2;
LABEL_38:
          v17 = &__block_literal_global_265;
          long long v18 = &__block_literal_global_134;
          goto LABEL_15;
        }
        if ([v13 isEqualToString:@"countEngagedMatchingDomain"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 1;
          goto LABEL_38;
        }
        if ([v13 isEqualToString:@"countOfferedMatchingDomain"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 0;
          goto LABEL_38;
        }
        if ([v13 isEqualToString:@"countHiddenMatchingDomainFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 2;
LABEL_45:
          v17 = &__block_literal_global_267;
          long long v18 = &__block_literal_global_136;
          goto LABEL_15;
        }
        if ([v13 isEqualToString:@"countEngagedMatchingDomainFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 1;
          goto LABEL_45;
        }
        if ([v13 isEqualToString:@"countOfferedMatchingDomainFromSender"])
        {
          id v15 = [PPSocialHighlightEngagementProvider alloc];
          uint64_t v16 = 0;
          goto LABEL_45;
        }
        if ([v13 hasPrefix:@"countHiddenInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 2;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countEngagedInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 1;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countOfferedInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 0;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countStartedConsumptionInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 5;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countFinishedConsumptionInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 6;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countItemDetailViewedInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 7;
          goto LABEL_60;
        }
        if ([v13 hasPrefix:@"countParentViewedInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 8;
LABEL_60:
          id v25 = &__block_literal_global_257;
          id v26 = &__block_literal_global_13268;
LABEL_61:
          long long v19 = [(PPSocialHighlightEngagementProvider *)v22 initWithFeedbackType:v24 feedbackGroupByBlock:v25 highlightKeyBlock:v26 intervalSinceNow:v14 highlights:v23];
          goto LABEL_16;
        }
        if ([v13 hasPrefix:@"countAppButtonInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 3;
LABEL_66:
          id v25 = &__block_literal_global_259;
          id v26 = &__block_literal_global_123;
          goto LABEL_61;
        }
        if ([v13 hasPrefix:@"countActivityButtonInInterval"])
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          double v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          uint64_t v24 = 4;
          goto LABEL_66;
        }
        uint64_t v27 = [v13 isEqualToString:@"mostRecentEngagementSecondsBeforeNow"];
        if ((v27 & 1) != 0
          || [v13 isEqualToString:@"earliestEngagementSecondsBeforeNow"])
        {
          long long v19 = [[PPSocialHighlightTimeSinceEngagementProvider alloc] initWithFeedbackType:1 feedbackGroupByBlock:&__block_literal_global_257 highlightKeyBlock:&__block_literal_global_13268 mostRecent:v27 highlights:v14];
          goto LABEL_16;
        }
        if ([v13 isEqualToString:@"fractionEngagedToOfferedFromSender"])
        {
          v28 = [PPSocialHighlightFractionalEngagementProvider alloc];
          v29 = &__block_literal_global_263;
          v30 = &__block_literal_global_132;
LABEL_74:
          long long v19 = [(PPSocialHighlightFractionalEngagementProvider *)v28 initWithFeedbackGroupByBlock:v29 highlightKeyBlock:v30 highlights:v14];
          goto LABEL_16;
        }
        if ([v13 isEqualToString:@"fractionEngagedToOfferedFromThread"])
        {
          v28 = [PPSocialHighlightFractionalEngagementProvider alloc];
          v29 = &__block_literal_global_261;
          v30 = &__block_literal_global_130;
          goto LABEL_74;
        }
        long long v20 = 0;
LABEL_17:

        if (v20)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:sel__feedbackFeaturesForPublisher_highlights_features_, v40, @"PPSocialHighlightFeaturizer.m", 197, @"Invalid parameter not satisfying: %@", @"[featureProvider respondsToSelector:@selector(applyFeedback:)]" object file lineNumber description];
          }
          [(id)v52[5] setObject:v20 forKeyedSubscript:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v31 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      uint64_t v8 = v31;
    }
    while (v31);
  }

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  id v32 = objc_alloc(MEMORY[0x1E4F501F0]);
  uint64_t v33 = v52[5];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke;
  v45[3] = &unk_1E65D7CC8;
  v45[4] = v46;
  v34 = (void *)[v32 initWithAccumulator:v33 closure:v45];
  id v35 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v36 = [v41 reduce:v34];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_2;
  v44[3] = &unk_1E65DAFD0;
  v44[4] = v46;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_179;
  v43[3] = &unk_1E65D7CF0;
  v43[4] = &v51;
  id v37 = (id)[v36 sinkWithCompletion:v44 receiveInput:v43];

  id v38 = (id)v52[5];

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v51, 8);

  return v38;
}

+ (double)_intervalForBucketedString:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 componentsSeparatedByString:@":"];

  id v4 = [v3 lastObject];
  [v4 doubleValue];
  double v6 = v5 * 3600.0;

  return v6;
}

void __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_179(uint64_t a1, void *a2)
{
}

- (id)featurizeHighlights:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPSocialHighlightFeaturizer_featurizeHighlights___block_invoke;
  v5[3] = &unk_1E65D7D38;
  v5[4] = self;
  v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

+ (id)trialSpecifiedFeatures
{
  id v2 = +[PPTrialWrapper sharedInstance];
  v3 = [v2 plistForFactorName:@"social_highlight_ranker.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"];

  id v4 = [v3 objectForKeyedSubscript:@"*"];
  if (v4)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  }
  else
  {
    double v6 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: unable to load ranker from Trial.", v8, 2u);
    }

    double v5 = 0;
  }

  return v5;
}

void __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  double v5 = pp_social_highlights_log_handle();
  double v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: failed to process feedback: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: successfully processed entire feedback stream.", (uint8_t *)&v10, 2u);
  }

  uint64_t v8 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: completed processing with %tu items passed to aggregator.", (uint8_t *)&v10, 0xCu);
  }
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

id __51__PPSocialHighlightFeaturizer_featurizeHighlights___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 highlightIdentifier];

  if (v4)
  {
    double v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 valueForHighlight:v3];

          id v13 = objc_opt_new();
          [v13 setName:v10];
          [v12 doubleValue];
          objc_msgSend(v13, "setValue:");
          [v5 addObject:v13];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setCalculatedFeatures:v5];
    id v14 = v3;
  }
  else
  {
    double v5 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: encountered highlight without an identifier.", buf, 2u);
    }
    id v14 = 0;
  }

  return v14;
}

uint64_t __78__PPSocialHighlightFeaturizer__globalHighlightFeaturesForHighlights_features___block_invoke(uint64_t a1, void *a2)
{
  return [a2 highlightIdentifier];
}

void __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v2);
  domainAndSenderKey_block_invoke_14(v4, v3);
}

void __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v2);
  domainAndSenderKey_block_invoke_15(v4, v3);
}

double __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_286(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sender];
  double v5 = [v4 handle];
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 sender];
    uint64_t v8 = [v7 handle];
    if ([v6 containsObject:v8]) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

uint64_t __46__PPSocialHighlightFeaturizer__medianOfArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __79__PPSocialHighlightFeaturizer__topicScoresMatchingSocialHighlights_topicStore___block_invoke(void *a1, void *a2)
{
  id v24 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = (void *)a1[4];
  double v5 = [v24 topic];
  uint64_t v6 = [v5 topicIdentifier];
  [v4 addObject:v6];

  uint64_t v7 = (void *)a1[5];
  uint64_t v8 = [v24 topic];
  double v9 = [v8 topicIdentifier];
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = (void *)a1[5];
    id v13 = [v24 topic];
    id v14 = [v13 topicIdentifier];
    [v12 setObject:v11 forKeyedSubscript:v14];
  }
  id v15 = (void *)a1[6];
  uint64_t v16 = [v24 source];
  long long v17 = [v16 documentId];
  long long v18 = [v15 objectForKeyedSubscript:v17];

  if (!v18)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a1[7] object:a1[8] file:@"PPSocialHighlightFeaturizer.m" lineNumber:495 description:@"Querying for a documents matching the keys of a dictionary should always return topics complying with those keys."];
  }
  long long v19 = (void *)a1[5];
  long long v20 = [v24 topic];
  long long v21 = [v20 topicIdentifier];
  v22 = [v19 objectForKeyedSubscript:v21];
  [v22 addObject:v18];
}

uint64_t __80__PPSocialHighlightFeaturizer__latestInteractionDatesForDescendingInteractions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x1CB79D060]();
        id v14 = [v7 objectForKeyedSubscript:v12];
        id v15 = [v14 applyFeedback:v5];
        [v6 setObject:v15 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return v6;
}

@end