@interface SSPommesPhotosRanker
+ (SSPommesPhotosRanker)sharedInstance;
+ (id)PhotosRankingRequiredAttributes;
+ (int64_t)PhotosL1Compare:(id)a3 to:(id)a4;
+ (int64_t)PhotosL2Compare:(id)a3 to:(id)a4;
- (AMLFeaturesConfiguration)amlConfiguration;
- (OS_dispatch_queue)serial_queue;
- (PFSceneTaxonomy)sceneTaxonomy;
- (float)estimatedMaxPommesL1Score;
- (void)donateFeatureDictionaries:(id)a3 sessionId:(id)a4 metadata:(id)a5;
- (void)setAmlConfiguration:(id)a3;
- (void)setEstimatedMaxPommesL1Score:(float)a3;
- (void)setSceneTaxonomy:(id)a3;
- (void)setSerial_queue:(id)a3;
- (void)sortAndFilterRankedPhotosItems:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6;
- (void)sortAndFilterRankedPhotosItemsFilter:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6;
- (void)sortAndFilterRankedPhotosItemsFilterFromSet:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6;
- (void)updatePhotosRankingItemScore:(id)a3 userQuery:(id)a4 currentTime:(double)a5 collectL2Signals:(BOOL)a6 keyboardLanguage:(id)a7 uniqueSessionID:(id)a8 onlyEmbeddingResults:(BOOL)a9 amlInputs:(id)a10;
- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10;
@end

@implementation SSPommesPhotosRanker

- (void)updatePhotosRankingItemScore:(id)a3 userQuery:(id)a4 currentTime:(double)a5 collectL2Signals:(BOOL)a6 keyboardLanguage:(id)a7 uniqueSessionID:(id)a8 onlyEmbeddingResults:(BOOL)a9 amlInputs:(id)a10
{
  BOOL v10 = a9;
  BOOL v180 = a6;
  uint64_t v263 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v185 = a4;
  id v187 = a7;
  id v179 = a8;
  id v183 = a10;
  float v245 = 0.0;
  v192 = v15;
  int Float = SSCompactRankingAttrsGetFloat([v15 attributes], 0x78uLL, &v245);
  float v17 = v245;
  if (!Float) {
    float v17 = 0.0;
  }
  float v177 = v17;
  v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[v15 attributes], 0x20uLL);
  v188 = v18;
  if (v18)
  {
    [v18 timeIntervalSinceReferenceDate];
    float v20 = 1.0 - exp(v19 / -86400.0 * 0.0000152587891);
  }
  else
  {
    float v20 = 0.0;
  }
  float v176 = v20;
  int v21 = SSCompactRankingAttrsGetFloat([v15 attributes], 0x90uLL, &v245);
  float v22 = v245;
  if (!v21) {
    float v22 = 0.0;
  }
  float v175 = v22;
  int v23 = SSCompactRankingAttrsGetFloat([v15 attributes], 0x91uLL, &v245);
  float v24 = v245;
  if (!v23) {
    float v24 = 0.0;
  }
  float v174 = v24;
  v186 = SSCompactRankingAttrsGetValue((int8x8_t *)[v15 attributes], 0x7CuLL);
  if ([v186 containsObject:@"Screenshots"]) {
    double v25 = -10.0;
  }
  else {
    double v25 = 0.0;
  }
  if (!v10)
  {
    v184 = [[SSTokenizedString alloc] initWithString:v185 locale:v187];
    id v33 = v15;
    id v34 = v187;
    v193 = v33;
    v35 = SSCompactRankingAttrsGetValue((int8x8_t *)[v33 attributes], 0x4DuLL);
    v36 = objc_opt_new();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v261 = __Block_byref_object_copy__7;
    *(void *)v262 = __Block_byref_object_dispose__7;
    *(void *)&v262[8] = 0;
    *(void *)v256 = MEMORY[0x1E4F143A8];
    *(void *)&v256[8] = 3221225472;
    *(void *)&long long v257 = __getMatchInfoDictionary_block_invoke;
    *((void *)&v257 + 1) = &unk_1E634D520;
    v259 = buf;
    id v37 = v36;
    id v258 = v37;
    [v35 enumerateObjectsUsingBlock:v256];
    v38 = objc_opt_new();
    uint64_t v246 = MEMORY[0x1E4F143A8];
    uint64_t v247 = 3221225472;
    uint64_t v248 = (uint64_t)__getMatchInfoDictionary_block_invoke_3;
    v249 = (uint8_t *)&unk_1E634D5B8;
    id v39 = v34;
    id v250 = v39;
    id v40 = v38;
    id v251 = v40;
    [v37 enumerateKeysAndObjectsUsingBlock:&v246];
    v41 = v251;
    id v189 = v40;

    _Block_object_dispose(buf, 8);
    v42 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0x6BuLL);
    int v166 = [v42 BOOLValue];

    v173 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F23310]];
    v169 = objc_opt_new();
    v178 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0x80uLL);
    if (v173)
    {
      v43 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0xA1uLL);
      v240[0] = MEMORY[0x1E4F143A8];
      v240[1] = 3221225472;
      v240[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke;
      v240[3] = &unk_1E634D3E8;
      id v241 = v43;
      id v242 = v169;
      id v243 = v178;
      id v44 = v43;
      [v173 enumerateObjectsUsingBlock:v240];
    }
    uint64_t v236 = 0;
    v237 = (double *)&v236;
    uint64_t v238 = 0x2020000000;
    uint64_t v239 = 0;
    uint64_t v232 = 0;
    v233 = (double *)&v232;
    uint64_t v234 = 0x2020000000;
    uint64_t v235 = 0;
    v181 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F232F8]];
    v172 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F23300]];
    v171 = objc_opt_new();
    if (v181)
    {
      unint64_t v45 = [v181 count];
      unint64_t v46 = [v178 count];
      v237[3] = (double)v45 / (double)v46;
      v228[0] = MEMORY[0x1E4F143A8];
      v228[1] = 3221225472;
      v228[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_3;
      v228[3] = &unk_1E634D410;
      v231 = &v232;
      v229 = v184;
      id v230 = v171;
      [v181 enumerateObjectsUsingBlock:v228];
    }
    if (v172)
    {
      v222[0] = MEMORY[0x1E4F143A8];
      v222[1] = 3221225472;
      v222[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_4;
      v222[3] = &unk_1E634D438;
      id v223 = v171;
      v226 = &v236;
      id v224 = v178;
      v227 = &v232;
      v225 = v184;
      [v172 enumerateObjectsUsingBlock:v222];
    }
    uint64_t v218 = 0;
    v219 = (double *)&v218;
    uint64_t v220 = 0x2020000000;
    uint64_t v221 = 0;
    v168 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F232B0]];
    if (v168)
    {
      v47 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0x8AuLL);
      v48 = [v47 tokenizedStringArray:v39];
      v49 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0xC7uLL);
      v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v49];
      v214[0] = MEMORY[0x1E4F143A8];
      v214[1] = 3221225472;
      v214[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_5;
      v214[3] = &unk_1E634D488;
      id v51 = v48;
      id v215 = v51;
      id v216 = v168;
      v217 = &v218;
      [v50 enumerateObjectsUsingBlock:v214];
    }
    uint64_t v170 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F23340]];
    uint64_t v167 = [v189 objectForKeyedSubscript:*MEMORY[0x1E4F23350]];
    if (v170 | v167)
    {
      id v52 = v193;
      v191 = self;
      id v205 = v39;
      id v164 = v185;
      v182 = v52;
      v197 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0x81uLL);
      v194 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0x84uLL);
      v53 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0x85uLL);
      v201 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0xB6uLL);
      v195 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0xB7uLL);
      v203 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0x82uLL);
      v190 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0xB9uLL);
      v209 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0xBAuLL);
      v199 = objc_opt_new();
      if (v201)
      {
        if (v203)
        {
          unint64_t v54 = [v201 count];
          if (v54 < 4 * [v203 count])
          {
            v55 = SSPommesRankerLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v159 = SSRedactString(v164, 0);
              v160 = [v52 identifier];
              uint64_t v161 = [v201 count];
              uint64_t v162 = [v203 count];
              uint64_t v163 = [v197 count];
              *(_DWORD *)buf = 138413570;
              *(void *)&buf[4] = @"com.apple.mobileslideshow";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v159;
              *(_WORD *)&buf[22] = 2112;
              v261 = v160;
              *(_WORD *)v262 = 2048;
              *(void *)&v262[2] = v161;
              *(_WORD *)&v262[10] = 2048;
              *(void *)&v262[12] = v162;
              *(_WORD *)&v262[20] = 2048;
              *(void *)&v262[22] = v163;
              _os_log_error_impl(&dword_1BDB2A000, v55, OS_LOG_TYPE_ERROR, "[bundle:%@][query:\"%@\"] id (%@) Bounding box count (%lu) scene identifiers count (%lu) scene label count (%lu)", buf, 0x3Eu);
            }
          }
        }
      }
      if ([v203 count])
      {
        unint64_t v56 = 0;
        uint64_t v211 = 0;
        do
        {
          unint64_t v207 = v56;
          v57 = objc_opt_new();
          v58 = [v203 objectAtIndexedSubscript:v207];
          [v57 setIdentifier:v58];

          objc_msgSend(v57, "setTotalLabels:", objc_msgSend(v203, "count"));
          [v57 setRankerReference:v191];
          [v57 setSceneReferenceDictionary:v199];
          [v57 setSceneMatchedType:0];
          unint64_t v59 = [v197 count];
          unint64_t v60 = v207;
          if (v59 > v207)
          {
            v61 = objc_msgSend(v197, "objectAtIndexedSubscript:");
            BOOL v62 = [v61 length] == 0;

            unint64_t v60 = v207;
            if (!v62)
            {
              v63 = [SSTokenizedString alloc];
              v64 = [v197 objectAtIndexedSubscript:v207];
              v65 = [v64 lowercaseString];
              v66 = [(SSTokenizedString *)v63 initWithString:v65 locale:v205];
              [v57 setLabel:v66];

              unint64_t v60 = v207;
            }
          }
          v67 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v60];
          int v68 = [v190 containsObject:v67];

          if (v68) {
            [v57 setSceneMatchedType:1];
          }
          if (v195)
          {
            v69 = objc_opt_new();
            v70 = [v195 objectAtIndexedSubscript:v207];
            uint64_t v71 = [v70 unsignedLongValue];

            v72 = objc_opt_new();
            if (v71)
            {
              uint64_t v73 = 0;
              while (1)
              {
                uint64_t v74 = v211 + v73;
                if ([v53 count] > (unint64_t)(v211 + v73))
                {
                  v75 = [v53 objectAtIndexedSubscript:v211 + v73];
                  BOOL v76 = [v75 length] == 0;

                  if (!v76)
                  {
                    v77 = [SSTokenizedString alloc];
                    v78 = [v53 objectAtIndexedSubscript:v74];
                    v79 = [v78 lowercaseString];
                    v80 = [(SSTokenizedString *)v77 initWithString:v79 locale:v205];
                    [v69 addObject:v80];
                  }
                }
                v81 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v74];
                int v82 = [v209 containsObject:v81];

                if (!v82) {
                  goto LABEL_52;
                }
                v83 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v73];
                [v72 addObject:v83];

                if (![v57 sceneMatchedType]) {
                  break;
                }
                if ([v57 sceneMatchedType] == 1)
                {
                  uint64_t v84 = 3;
LABEL_51:
                  [v57 setSceneMatchedType:v84];
                }
LABEL_52:
                if (v71 == ++v73) {
                  goto LABEL_53;
                }
              }
              uint64_t v84 = 2;
              goto LABEL_51;
            }
LABEL_53:
            [v57 setSynonyms:v69];
            objc_msgSend(v57, "setTotalSynonyms:", objc_msgSend(v53, "count"));
            [v57 setSynonymsIndexes:v72];

            v211 += v71;
          }
          if (v194)
          {
            v85 = [v194 objectAtIndexedSubscript:v207];
            [v85 doubleValue];
            objc_msgSend(v57, "setConfidence:");
          }
          if (v201)
          {
            unint64_t v86 = (4 * v207) | 3;
            if ([v201 count] > v86)
            {
              v87 = [v201 objectAtIndexedSubscript:4 * v207];
              *(void *)buf = v87;
              v88 = [v201 objectAtIndexedSubscript:(4 * v207) | 1];
              *(void *)&buf[8] = v88;
              v89 = [v201 objectAtIndexedSubscript:(4 * v207) | 2];
              *(void *)&buf[16] = v89;
              v90 = [v201 objectAtIndexedSubscript:v86];
              v261 = v90;
              v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:4];
              [v57 setBoundingBox:v91];
            }
          }
          v92 = [v57 identifier];
          [v199 setObject:v57 forKeyedSubscript:v92];

          unint64_t v93 = [v203 count];
          unint64_t v56 = v207 + 1;
        }
        while (v207 + 1 < v93);
      }

      id v94 = v189;
      id v95 = v199;
      v96 = v184;
      id v258 = 0;
      *(_OWORD *)v256 = 0u;
      long long v257 = 0u;
      uint64_t v246 = 0;
      uint64_t v247 = (uint64_t)&v246;
      uint64_t v248 = 0x2020000000;
      v249 = v256;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __computeSceneClassificationSignals_block_invoke;
      v261 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E634D5E0;
      id v97 = v94;
      *(void *)v262 = v97;
      v98 = v96;
      *(void *)&v262[8] = v98;
      *(void *)&v262[16] = &v246;
      [v95 enumerateKeysAndObjectsUsingBlock:buf];
      v99 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
      for (uint64_t i = 0; i != 40; i += 8)
      {
        v101 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)&v256[i]];
        [v99 addObject:v101];
      }
      _Block_object_dispose(&v246, 8);

      v102 = [v99 objectAtIndexedSubscript:4];
      [v102 doubleValue];
      BOOL v104 = fabs(v103 + -1.0) < 0.001;

      if (v104)
      {
        v105 = SSPommesRankerLog();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          v106 = [v182 identifier];
          -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:](v106, v256, v105);
        }
      }
    }
    else
    {
      v99 = &unk_1F18646D0;
    }
    v107 = [v193 interestingDate];
    [v107 timeIntervalSinceReferenceDate];
    double v109 = v108;

    double v165 = v25;
    if (v188)
    {
      [v188 timeIntervalSinceReferenceDate];
      double v109 = v110;
    }
    v212 = SSCompactRankingAttrsGetValue((int8x8_t *)[v193 attributes], 0x69uLL);
    double v196 = v109 - (double)(unint64_t)v109;
    if (([v212 integerValue] & 1) != 0 || (objc_msgSend(v212, "integerValue") & 3) != 0)
    {
      [v193 pommesL1Score];
      float v112 = v111;
      double v113 = v237[3];
      v114 = [v99 objectAtIndexedSubscript:1];
      [v114 doubleValue];
      double v116 = v115;
      v117 = [v99 objectAtIndexedSubscript:0];
      [v117 doubleValue];
      double v119 = v118;
      v120 = [v99 objectAtIndexedSubscript:2];
      [v120 doubleValue];
      double v122 = v121;
      double v123 = v219[3];
      double v124 = v233[3];
      [v193 embeddingSimilarity];
      float v126 = v125;
      [v193 l2Score];
      double v128 = 0.0;
      if (v166) {
        double v128 = -10.0;
      }
      double v129 = v165
           + v128
           + v112 * 0.0532
           + 70.2896
           + v113 * 20.7257
           + v177 * 17.3689
           + v116 * 7.5446
           + v119 * 6.7843
           + v122 * 2.6352
           + v123 * 2.4182
           + v124 * 2.2137
           + v174 * 0.001
           + v175 * 0.001
           + v176 * 0.001
           + v196 * 0.0001
           + v126 * 0.1
           + v127;
      *(float *)&double v129 = v129;
      [v193 setL2Score:v129];
    }
    if ([v212 integerValue] == 2)
    {
      [v193 embeddingSimilarity];
      double v131 = v130;
      double v132 = v131 + -0.15;
      if (v131 + -0.15 < 0.0) {
        double v132 = 0.0;
      }
      float v133 = fmin(v132, 0.2);
      double v134 = v131 + -0.35 + 70.0 + v133 * 150.0;
      *(float *)&double v134 = v134;
      [v193 setL2Score:v134];
    }
    v252[0] = @"L1Score";
    v135 = (void *)MEMORY[0x1E4F28ED0];
    [v193 pommesL1Score];
    v210 = objc_msgSend(v135, "numberWithFloat:");
    v253[0] = v210;
    v252[1] = @"freshness";
    *(float *)&double v136 = v176;
    v208 = [MEMORY[0x1E4F28ED0] numberWithFloat:v136];
    v253[1] = v208;
    v252[2] = @"photosFavorited";
    *(float *)&double v137 = v177;
    v206 = [MEMORY[0x1E4F28ED0] numberWithFloat:v137];
    v253[2] = v206;
    v252[3] = @"aestheticScore";
    *(float *)&double v138 = v174;
    v204 = [MEMORY[0x1E4F28ED0] numberWithFloat:v138];
    v253[3] = v204;
    v252[4] = @"curationScore";
    *(float *)&double v139 = v175;
    v202 = [MEMORY[0x1E4F28ED0] numberWithFloat:v139];
    v253[4] = v202;
    v252[5] = @"peopleMatchPercent";
    v200 = [MEMORY[0x1E4F28ED0] numberWithDouble:v237[3]];
    v253[5] = v200;
    v252[6] = @"peopleQueryCoverage";
    v198 = [MEMORY[0x1E4F28ED0] numberWithDouble:v233[3]];
    v253[6] = v198;
    v252[7] = @"matchedSceneBoundingBox";
    v140 = [v99 objectAtIndexedSubscript:0];
    v253[7] = v140;
    v252[8] = @"matchedSceneConfidence";
    v141 = [v99 objectAtIndexedSubscript:1];
    v253[8] = v141;
    v252[9] = @"matchedSceneLabelRatio";
    v142 = [v99 objectAtIndexedSubscript:2];
    v253[9] = v142;
    v252[10] = @"matchedLocationRatio";
    v143 = [MEMORY[0x1E4F28ED0] numberWithDouble:v219[3]];
    v253[10] = v143;
    v252[11] = @"L2Score";
    v144 = (void *)MEMORY[0x1E4F28ED0];
    [v193 l2Score];
    v145 = objc_msgSend(v144, "numberWithFloat:");
    v253[11] = v145;
    v252[12] = @"embeddingSimilarity";
    v146 = (void *)MEMORY[0x1E4F28ED0];
    [v193 embeddingSimilarity];
    uint64_t v147 = objc_msgSend(v146, "numberWithFloat:");
    v148 = (void *)v147;
    v149 = &unk_1F18640A0;
    if (v147) {
      v149 = (void *)v147;
    }
    v253[12] = v149;
    v252[13] = @"itemTimeMsPart";
    v150 = [MEMORY[0x1E4F28ED0] numberWithDouble:v196];
    v253[13] = v150;
    v252[14] = @"identifier";
    uint64_t v151 = [v193 identifier];
    v152 = (void *)v151;
    v153 = &stru_1F1824018;
    if (v151) {
      v153 = (__CFString *)v151;
    }
    v253[14] = v153;
    v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v253 forKeys:v252 count:15];

    [v183 addObject:v154];
    if (v180)
    {
      id v213 = 0;
      v155 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v154 requiringSecureCoding:1 error:&v213];
      id v156 = v213;
      [v193 setL2Signals:v155];

      if (v156)
      {
        v157 = SSPommesRankerLog();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        {
          v158 = SSRedactString(v185, 0);
          -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:](v158, (uint64_t)v156, buf, v157);
        }
      }
    }

    _Block_object_dispose(&v218, 8);
    _Block_object_dispose(&v232, 8);
    _Block_object_dispose(&v236, 8);

    v32 = v173;
    goto LABEL_90;
  }
  [v15 embeddingSimilarity];
  objc_msgSend(v15, "setL2Score:");
  if (v180)
  {
    v254[0] = @"embeddingSimilarity";
    v26 = (void *)MEMORY[0x1E4F28ED0];
    [v15 embeddingSimilarity];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    v255[0] = v27;
    v254[1] = @"identifier";
    v28 = [v15 identifier];
    v255[1] = v28;
    v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v255 forKeys:v254 count:2];

    id v244 = 0;
    v29 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v184 requiringSecureCoding:1 error:&v244];
    id v189 = v244;
    [v15 setL2Signals:v29];

    v30 = v189;
    if (!v189)
    {
LABEL_91:

      goto LABEL_92;
    }
    v31 = SSPommesRankerLog();
    v32 = v31;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:](v185, (uint64_t)v189, v31);
      v32 = v31;
    }
LABEL_90:

    v30 = v189;
    goto LABEL_91;
  }
LABEL_92:
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__7;
  v9[4] = __Block_byref_object_dispose__7;
  id v10 = 0;
  id v10 = [v3 original];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_2;
  v5[3] = &unk_1E634D3C0;
  v8 = v9;
  v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateObjectsUsingBlock:v5];

  _Block_object_dispose(v9, 8);
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 lowercaseString];
  if ([v7 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    v5 = *(void **)(a1 + 32);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedLong:a3];
    [v5 addObject:v6];

    [*(id *)(a1 + 40) objectAtIndex:a3];
  }
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  *(double *)(*(void *)(a1[6] + 8) + 24) = tokenMatchRatio(v4, v3) + *(double *)(*(void *)(a1[6] + 8) + 24);
  v5 = (void *)a1[5];
  id v7 = [v4 original];

  id v6 = [v7 lowercaseString];
  [v5 addObject:v6];
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  v5 = [v3 original];
  id v6 = [v5 lowercaseString];
  LOBYTE(v4) = [v4 containsObject:v6];

  if ((v4 & 1) == 0)
  {
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1.0
                                                                / (double)(unint64_t)[*(id *)(a1 + 40) count];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = tokenMatchRatio(v7, *(void **)(a1 + 48))
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
  }
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7 <= [v6 unsignedLongValue])
  {
    *a4 = 1;
  }
  else
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__7;
    v11[4] = __Block_byref_object_dispose__7;
    id v12 = 0;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedLongValue"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_6;
    v10[3] = &unk_1E634D460;
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = v11;
    v10[5] = v9;
    [v8 enumerateObjectsUsingBlock:v10];
    _Block_object_dispose(v11, 8);
  }
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "tokenMatchForMatchInfoToken:");
  if (v3)
  {
    double matched = tokenMatchRatio(v6, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v5 + 24) >= matched) {
      double matched = *(double *)(v5 + 24);
    }
    *(double *)(v5 + 24) = matched;
  }
}

- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10
{
  BOOL v35 = a8;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v34 = a4;
  id v37 = a5;
  id v15 = a9;
  v16 = [MEMORY[0x1E4F29128] UUID];
  float v17 = [v16 UUIDString];

  v18 = objc_opt_new();
  double v19 = objc_opt_new();
  if ([v14 count])
  {
    unint64_t v20 = 0;
    do
    {
      int v21 = [v14 objectAtIndexedSubscript:v20];
      [(SSPommesPhotosRanker *)self updatePhotosRankingItemScore:v21 userQuery:v37 currentTime:v35 collectL2Signals:v15 keyboardLanguage:v17 uniqueSessionID:a10 onlyEmbeddingResults:a7 amlInputs:v18];

      if (v20 <= 0x13)
      {
        float v22 = SSPommesRankerLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v31 = [v14 objectAtIndexedSubscript:v20];
          v26 = [v31 identifier];
          v32 = [v14 objectAtIndexedSubscript:v20];
          [v32 pommesL1Score];
          double v28 = v27;
          v29 = [v14 objectAtIndexedSubscript:v20];
          [v29 l2Score];
          *(_DWORD *)buf = 134219522;
          unint64_t v39 = v20 + 1;
          __int16 v40 = 2112;
          id v41 = v34;
          __int16 v42 = 2048;
          int64_t v43 = a6;
          __int16 v44 = 2112;
          id v45 = v37;
          __int16 v46 = 2112;
          v47 = v26;
          __int16 v48 = 2048;
          double v49 = v28;
          __int16 v50 = 2048;
          double v51 = v30;
          _os_log_debug_impl(&dword_1BDB2A000, v22, OS_LOG_TYPE_DEBUG, "%lu. [bundle=%@][qid=%lu][query=\"%@\"] item %@: L1Score=%.04f, L2Score=%.04f", buf, 0x48u);
        }
      }
      int v23 = [v14 objectAtIndexedSubscript:v20];
      float v24 = [v23 identifier];
      double v25 = objc_msgSend(NSString, "stringWithFormat:", @"photos-photoId-%tu", v20);
      [v19 setValue:v24 forKey:v25];

      ++v20;
    }
    while (v20 < [v14 count]);
  }
  [(SSPommesPhotosRanker *)self donateFeatureDictionaries:v18 sessionId:v17 metadata:v19];
}

- (void)donateFeatureDictionaries:(id)a3 sessionId:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(21, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SSPommesPhotosRanker_donateFeatureDictionaries_sessionId_metadata___block_invoke;
  v15[3] = &unk_1E634C2C0;
  id v16 = v9;
  id v17 = v10;
  v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __69__SSPommesPhotosRanker_donateFeatureDictionaries_sessionId_metadata___block_invoke(uint64_t a1)
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F49E90]) initWithSessionId:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40)];
  id v2 = objc_alloc(MEMORY[0x1E4F49E88]);
  id v3 = [*(id *)(a1 + 48) amlConfiguration];
  id v4 = (void *)[v2 initWithFeaturesConfiguration:v3];

  id v5 = (id)[v4 donateFeatureDictionaries:*(void *)(a1 + 56) metadata:v6 completionBlock:0];
}

+ (SSPommesPhotosRanker)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SSPommesPhotosRanker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  id v2 = (void *)sharedInstance_pommesRanker;
  return (SSPommesPhotosRanker *)v2;
}

void __38__SSPommesPhotosRanker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v2 = (void *)sharedInstance_pommesRanker;
  sharedInstance_pommesRanker = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("coreml_serial", 0);
  objc_msgSend((id)sharedInstance_pommesRanker, "setSerial_queue:", v3);

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F8CD60]) initWithLatestTaxonomy];
  [(id)sharedInstance_pommesRanker setSceneTaxonomy:v4];

  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v5 bundleIdentifier];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F49E98]) initWithFeatureDictionary:&unk_1F1864970];
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F49E80]) initWithBundleIdentifier:v8 modelName:@"l2LinearRegressor" versionId:@"1.0" expirationPolicy:3 featuresDescription:v6];
  [(id)sharedInstance_pommesRanker setAmlConfiguration:v7];
}

+ (id)PhotosRankingRequiredAttributes
{
  if (PhotosRankingRequiredAttributes_onceToken != -1) {
    dispatch_once(&PhotosRankingRequiredAttributes_onceToken, &__block_literal_global_396);
  }
  id v2 = (void *)PhotosRankingRequiredAttributes_requiredAttributes;
  return v2;
}

void __55__SSPommesPhotosRanker_PhotosRankingRequiredAttributes__block_invoke()
{
  v15[27] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F22B30];
  v15[0] = *MEMORY[0x1E4F22A60];
  v15[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F22C38];
  v15[2] = *MEMORY[0x1E4F22C30];
  v15[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F22F38];
  void v15[4] = *MEMORY[0x1E4F22CA0];
  v15[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F232B0];
  v15[6] = *MEMORY[0x1E4F23290];
  v15[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F232D8];
  v15[8] = *MEMORY[0x1E4F232B8];
  v15[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F23308];
  v15[10] = *MEMORY[0x1E4F232F8];
  v15[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23318];
  v15[12] = *MEMORY[0x1E4F23310];
  v15[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F23330];
  v15[14] = *MEMORY[0x1E4F23328];
  v15[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F23340];
  v15[16] = *MEMORY[0x1E4F23338];
  v15[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F23350];
  v15[18] = *MEMORY[0x1E4F23348];
  v15[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F23360];
  v15[20] = *MEMORY[0x1E4F23358];
  v15[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F23770];
  v15[22] = *MEMORY[0x1E4F23760];
  v15[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F23790];
  v15[24] = *MEMORY[0x1E4F23798];
  v15[25] = v12;
  v15[26] = @"kMDQueryResultHasTextContentMatch";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:27];
  id v14 = (void *)PhotosRankingRequiredAttributes_requiredAttributes;
  PhotosRankingRequiredAttributes_requiredAttributes = v13;
}

+ (int64_t)PhotosL2Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 l2Score];
  float v8 = v7;
  [v6 l2Score];
  if (v8 > v9)
  {
LABEL_5:
    int64_t v13 = -1;
    goto LABEL_6;
  }
  [v5 l2Score];
  float v11 = v10;
  [v6 l2Score];
  if (v11 >= v12)
  {
    [v5 pommesL1Score];
    float v15 = v14;
    [v6 pommesL1Score];
    if (v15 <= v16)
    {
      [v5 pommesL1Score];
      float v19 = v18;
      [v6 pommesL1Score];
      int64_t v13 = v19 < v20;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v13 = 1;
LABEL_6:

  return v13;
}

+ (int64_t)PhotosL1Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 pommesL1Score];
  float v8 = v7;
  [v6 pommesL1Score];
  if (v8 <= v9)
  {
    [v5 pommesL1Score];
    float v12 = v11;
    [v6 pommesL1Score];
    if (v12 >= v13)
    {
      float v14 = [v5 interestingDate];
      [v14 timeIntervalSinceReferenceDate];
      double v16 = v15;

      id v17 = [v6 interestingDate];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = v18;

      if (v16 <= v19) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = -1;
      }
    }
    else
    {
      int64_t v10 = 1;
    }
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (void)sortAndFilterRankedPhotosItems:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  float v9 = SSPommesRankerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    SSRedactString(v8, 1);
    double v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138412802;
    double v127 = v10;
    __int16 v128 = 2048;
    *(double *)&unint64_t v129 = COERCE_DOUBLE([v7 count]);
    __int16 v130 = 2048;
    unint64_t v131 = a4;
    _os_log_impl(&dword_1BDB2A000, v9, OS_LOG_TYPE_DEFAULT, "[query: %@] Filtering %lu items, maxCount: %ld", buf, 0x20u);
  }
  if (![v7 count])
  {
    float v24 = SSPommesRankerLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_93;
    }
    *(_WORD *)buf = 0;
    double v25 = "Skipping ranking of items (Reason: no items to rank)";
LABEL_21:
    v26 = v24;
    uint32_t v27 = 2;
LABEL_47:
    _os_log_impl(&dword_1BDB2A000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_93;
  }
  if (*(double *)&a4 == 0.0)
  {
    float v24 = SSPommesRankerLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_93;
    }
    *(_WORD *)buf = 0;
    double v25 = "Skipping ranking of items (ERROR: requested to rank zero items)";
    goto LABEL_21;
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v104 = v7;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v119 objects:v125 count:16];
  unint64_t v13 = 0x1E4F28000uLL;
  id v14 = v11;
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v120;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v120 != v16) {
          objc_enumerationMutation(v11);
        }
        double v18 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        double v19 = [v18 rankingItem];
        [v19 pommesL1Score];
        if (v20 < 10.0)
        {
        }
        else
        {
          int v21 = [v18 rankingItem];
          [v21 pommesL1Score];
          float v23 = v22;

          if (v23 != 100.0)
          {
            id v28 = v8;

            unint64_t v13 = 0x1E4F28000uLL;
            id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            if ([v11 count])
            {
              unint64_t v29 = 0;
              do
              {
                float v30 = [v11 objectAtIndexedSubscript:v29];
                v31 = [v30 rankingItem];
                v32 = SSCompactRankingAttrsGetValue((int8x8_t *)[v31 attributes], 0x69uLL);

                if (([v32 integerValue] & 2) == 0)
                {
                  id v33 = [v11 objectAtIndexedSubscript:v29];
                  id v34 = [v33 rankingItem];
                  [v34 pommesL1Score];
                  float v36 = v35;

                  if (v36 < 10.0)
                  {
                    id v37 = [v11 objectAtIndexedSubscript:v29];
                    v38 = [v37 rankingItem];
                    [v38 setL2Score:0.0];

                    [v14 addIndex:v29];
                  }
                }

                ++v29;
              }
              while (v29 < [v11 count]);
            }
            [v11 removeObjectsAtIndexes:v14];
            unint64_t v39 = SSPommesRankerLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              double v40 = COERCE_DOUBLE([v11 count]);
              *(double *)&uint64_t v41 = COERCE_DOUBLE([v14 count]);
              *(_DWORD *)buf = 134218496;
              double v127 = v40;
              __int16 v128 = 2048;
              unint64_t v129 = v41;
              __int16 v130 = 2048;
              unint64_t v131 = 0x4024000000000000;
              _os_log_impl(&dword_1BDB2A000, v39, OS_LOG_TYPE_DEFAULT, "Ranking only %lu items. Rejected %lu items that are below L1 thresh of %f)", buf, 0x20u);
            }

            id v8 = v28;
            goto LABEL_31;
          }
        }
      }
      uint64_t v15 = [v11 countByEnumeratingWithState:&v119 objects:v125 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    id v14 = v11;
    unint64_t v13 = 0x1E4F28000uLL;
  }
LABEL_31:

  if ([v11 count] > a4)
  {
    id v103 = v8;
    __int16 v42 = [MEMORY[0x1E4F1CA80] set];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    unint64_t v43 = 0x1E4F28000uLL;
    uint64_t v106 = [&unk_1F18646E8 countByEnumeratingWithState:&v115 objects:v124 count:16];
    if (v106)
    {
      uint64_t v105 = *(void *)v116;
LABEL_34:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v116 != v105) {
          objc_enumerationMutation(&unk_1F18646E8);
        }
        *(double *)&unint64_t v45 = COERCE_DOUBLE([*(id *)(*((void *)&v115 + 1) + 8 * v44) unsignedLongValue]);
        if ([v11 count])
        {
          unint64_t v46 = 0;
          do
          {
            v47 = [v11 objectAtIndexedSubscript:v46];
            __int16 v48 = [v47 rankingItem];
            double v49 = [v48 interestingDate];
            [v49 timeIntervalSinceReferenceDate];
            unint64_t v51 = (unint64_t)(v50 / (double)v45);

            uint64_t v52 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v51];
            [v42 addObject:v52];

            ++v46;
          }
          while (v46 < [v11 count]);
        }
        if ([v42 count] >= a4) {
          break;
        }
        [v42 removeAllObjects];
        if (++v44 == v106)
        {
          uint64_t v106 = [&unk_1F18646E8 countByEnumeratingWithState:&v115 objects:v124 count:16];
          if (v106) {
            goto LABEL_34;
          }
          unint64_t v45 = 300;
          break;
        }
      }
      unint64_t v13 = 0x1E4F28000;
      unint64_t v43 = 0x1E4F28000;
    }
    else
    {
      unint64_t v45 = 300;
    }

    unint64_t v54 = SSPommesRankerLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v127 = *(double *)&v45;
      _os_log_impl(&dword_1BDB2A000, v54, OS_LOG_TYPE_DEFAULT, "Setting timeWindow: %lu sec", buf, 0xCu);
    }

    float v24 = objc_alloc_init(*(Class *)(v13 + 3680));
    v55 = objc_opt_new();
    if ([v11 count])
    {
      unint64_t v56 = 0;
      double v57 = (double)v45;
      v107 = v24;
      do
      {
        v58 = [v11 objectAtIndexedSubscript:v56];
        unint64_t v59 = [v58 rankingItem];
        unint64_t v60 = [v59 interestingDate];
        [v60 timeIntervalSinceReferenceDate];
        unint64_t v62 = (unint64_t)(v61 / v57);

        v63 = [*(id *)(v43 + 3792) numberWithUnsignedInteger:v62];
        v64 = [v55 objectForKey:v63];

        if (v64)
        {
          v65 = [v55 objectForKeyedSubscript:v63];
          uint64_t v66 = [v65 unsignedLongValue];

          v67 = [v11 objectAtIndexedSubscript:v56];
          int v68 = [v67 rankingItem];
          v69 = [v11 objectAtIndexedSubscript:v66];
          [v69 rankingItem];
          uint64_t v71 = v70 = v55;
          int64_t v72 = +[SSPommesPhotosRanker PhotosL2Compare:v68 to:v71];

          float v24 = v107;
          if (v72 == -1)
          {
            [v107 addIndex:v66];
            unint64_t v43 = 0x1E4F28000uLL;
            uint64_t v74 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v56];
            [v70 setObject:v74 forKeyedSubscript:v63];

            v55 = v70;
          }
          else
          {
            [v107 addIndex:v56];
            v55 = v70;
            unint64_t v43 = 0x1E4F28000;
          }
        }
        else
        {
          uint64_t v73 = [*(id *)(v43 + 3792) numberWithUnsignedInteger:v56];
          [v55 setObject:v73 forKeyedSubscript:v63];
        }
        ++v56;
      }
      while (v56 < [v11 count]);
    }
    v75 = SSPommesRankerLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      double v76 = COERCE_DOUBLE([v55 count]);
      *(_DWORD *)buf = 134217984;
      double v127 = v76;
      _os_log_impl(&dword_1BDB2A000, v75, OS_LOG_TYPE_DEFAULT, "Found %ld distinct items based on bucketing logic", buf, 0xCu);
    }

    id v8 = v103;
    if ([v55 count] >= a4)
    {
      v87 = SSPommesRankerLog();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        double v88 = COERCE_DOUBLE([v24 count]);
        *(double *)&uint64_t v89 = COERCE_DOUBLE([v55 count]);
        *(_DWORD *)buf = 134218496;
        double v127 = v88;
        __int16 v128 = 2048;
        unint64_t v129 = v89;
        __int16 v130 = 2048;
        unint64_t v131 = a4;
        _os_log_impl(&dword_1BDB2A000, v87, OS_LOG_TYPE_DEFAULT, "Filtering done early by rejecting %lu items (Reason: buckets(%ld) >= maxCount(%ld))", buf, 0x20u);
      }

      v113[0] = MEMORY[0x1E4F143A8];
      v113[1] = 3221225472;
      v113[2] = __86__SSPommesPhotosRanker_sortAndFilterRankedPhotosItems_maxCount_userQuery_currentTime___block_invoke;
      v113[3] = &unk_1E634D4B0;
      v114 = v11;
      [v24 enumerateIndexesUsingBlock:v113];
      v90 = v114;
      goto LABEL_92;
    }
    if ([v11 count])
    {
      v77 = v55;
      unint64_t v78 = 0;
      float v79 = 0.0;
      float v80 = 3.4028e38;
      do
      {
        int v81 = [v24 containsIndex:v78];
        int v82 = [v11 objectAtIndexedSubscript:v78];
        v83 = [v82 rankingItem];
        [v83 l2Score];
        float v85 = v84;

        if (v80 < v85) {
          int v86 = 1;
        }
        else {
          int v86 = v81;
        }
        if (!v86) {
          float v80 = v85;
        }
        if ((v81 & (v79 < v85)) != 0) {
          float v79 = v85;
        }
        ++v78;
      }
      while (v78 < [v11 count]);
      if (v79 >= v80)
      {
        float v92 = (float)(v79 - v80) + 0.1;
        unint64_t v93 = SSPommesRankerLog();
        v55 = v77;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          double v94 = COERCE_DOUBLE([v77 count]);
          *(_DWORD *)buf = 134218240;
          double v127 = v94;
          __int16 v128 = 2048;
          *(double *)&unint64_t v129 = v92;
          _os_log_impl(&dword_1BDB2A000, v93, OS_LOG_TYPE_DEFAULT, "Increasing l2 scores of %lu bucket-top-items by delta: %f", buf, 0x16u);
        }

        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        v91 = [v77 allValues];
        uint64_t v95 = [v91 countByEnumeratingWithState:&v109 objects:v123 count:16];
        if (v95)
        {
          uint64_t v96 = v95;
          uint64_t v97 = *(void *)v110;
          do
          {
            for (uint64_t j = 0; j != v96; ++j)
            {
              if (*(void *)v110 != v97) {
                objc_enumerationMutation(v91);
              }
              v99 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v109 + 1) + 8 * j), "unsignedIntValue"));
              v100 = [v99 rankingItem];
              [v100 l2Score];
              *(float *)&double v102 = v101 + v92;
              [v100 setL2Score:v102];
            }
            uint64_t v96 = [v91 countByEnumeratingWithState:&v109 objects:v123 count:16];
          }
          while (v96);
          id v8 = v103;
          v55 = v77;
        }
        goto LABEL_90;
      }
      v55 = v77;
    }
    else
    {
      float v79 = 0.0;
      float v80 = 3.4028e38;
    }
    v91 = SSPommesRankerLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v127 = v80;
      __int16 v128 = 2048;
      *(double *)&unint64_t v129 = v79;
      _os_log_impl(&dword_1BDB2A000, v91, OS_LOG_TYPE_DEFAULT, "No score calibration needed (Reason: minBucketTopL2Score(%f) > bestRemainingL2Score(%f))", buf, 0x16u);
    }
LABEL_90:

    v90 = SSPommesRankerLog();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v90, OS_LOG_TYPE_DEFAULT, "Done sorting and filtering", buf, 2u);
    }
LABEL_92:

    id v7 = v104;
    goto LABEL_93;
  }
  float v24 = SSPommesRankerLog();
  id v7 = v104;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    double v53 = COERCE_DOUBLE([v11 count]);
    *(_DWORD *)buf = 134218240;
    double v127 = v53;
    __int16 v128 = 2048;
    unint64_t v129 = a4;
    double v25 = "Filtering done early (Reason: numItems(%ld) <= maxCount(%ld))";
    v26 = v24;
    uint32_t v27 = 22;
    goto LABEL_47;
  }
LABEL_93:
}

void __86__SSPommesPhotosRanker_sortAndFilterRankedPhotosItems_maxCount_userQuery_currentTime___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v2 = [v3 rankingItem];
  [v2 setL2Score:0.0];
}

- (void)sortAndFilterRankedPhotosItemsFilter:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  id v24 = a3;
  [(SSPommesPhotosRanker *)self sortAndFilterRankedPhotosItems:v24 maxCount:a4 userQuery:a5 currentTime:a6];
  if ([v24 count] && objc_msgSend(v24, "count"))
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v24 objectAtIndexedSubscript:v10];
      unint64_t v13 = [v12 rankingItem];
      [v13 l2Score];
      float v15 = v14;

      if (v15 != 0.0) {
        ++v11;
      }
      ++v10;
    }
    while (v10 < [v24 count]);
    if (v11)
    {
      [v24 sortUsingComparator:&__block_literal_global_413];
      id v16 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if ([v24 count])
      {
        unint64_t v17 = 0;
        unint64_t v18 = 0;
        do
        {
          double v19 = [v24 objectAtIndexedSubscript:v17];
          float v20 = [v19 rankingItem];
          [v20 l2Score];
          float v22 = v21;

          if (v22 == 0.0 || v18 >= a4) {
            [v16 addIndex:v17];
          }
          else {
            ++v18;
          }
          ++v17;
        }
        while (v17 < [v24 count]);
      }
      [v24 removeObjectsAtIndexes:v16];
    }
  }
}

int64_t __92__SSPommesPhotosRanker_sortAndFilterRankedPhotosItemsFilter_maxCount_userQuery_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 rankingItem];
  id v6 = [v4 rankingItem];

  int64_t v7 = +[SSPommesPhotosRanker PhotosL2Compare:v5 to:v6];
  return v7;
}

- (void)sortAndFilterRankedPhotosItemsFilterFromSet:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * v16++), (void)v19);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  unint64_t v17 = +[SSPommesPhotosRanker sharedInstance];
  [v17 sortAndFilterRankedPhotosItemsFilter:v11 maxCount:a4 userQuery:v10 currentTime:a6];

  unint64_t v18 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v11];
}

- (OS_dispatch_queue)serial_queue
{
  return self->_serial_queue;
}

- (void)setSerial_queue:(id)a3
{
}

- (float)estimatedMaxPommesL1Score
{
  return self->_estimatedMaxPommesL1Score;
}

- (void)setEstimatedMaxPommesL1Score:(float)a3
{
  self->_estimatedMaxPommesL1Score = a3;
}

- (PFSceneTaxonomy)sceneTaxonomy
{
  return self->_sceneTaxonomy;
}

- (void)setSceneTaxonomy:(id)a3
{
}

- (AMLFeaturesConfiguration)amlConfiguration
{
  return self->_amlConfiguration;
}

- (void)setAmlConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amlConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_serial_queue, 0);
}

- (void)updatePhotosRankingItemScore:(NSObject *)a3 userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = SSRedactString(a1, 0);
  int v6 = 138412802;
  int64_t v7 = @"com.apple.mobileslideshow";
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_ERROR, "[bundle:%@][query:\"%@\"] Failed to archive l2 signals dictionary to NSData with error %@", (uint8_t *)&v6, 0x20u);
}

- (void)updatePhotosRankingItemScore:(uint8_t *)buf userQuery:(os_log_t)log currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = @"com.apple.mobileslideshow";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "[bundle:%@][query:\"%@\"] Failed to archive l2 signals dictionary to NSData with error %@", buf, 0x20u);
}

- (void)updatePhotosRankingItemScore:(os_log_t)log userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "Scene exact match photo boosted [%@]", buf, 0xCu);
}

@end