@interface SectionL3Scores
+ (float)normalizeLegacyScore:(float)a3;
+ (void)getComparableL3Score:(id)a3 sectionMapping:(id)a4 bundleId1:(id)a5 bundleId2:(id)a6 score1:(float *)a7 score2:(float *)a8 usePommesScore:(BOOL)a9 useLegacyScore:(BOOL)a10;
+ (void)getComparableModelL3Score:(id)a3 bundleId1:(id)a4 bundleId2:(id)a5 score1:(float *)a6 score2:(float *)a7;
- (BOOL)computeScore:(id)a3 rankingConfig:(id)a4 hasGoodLocalResult:(BOOL)a5 pos:(int)a6 queryContext:(id)a7;
- (NSMutableDictionary)features;
- (SectionL3Scores)init;
- (float)getL3Score:(int)a3 isLegacy:(BOOL)a4;
- (float)getResultScore:(id)a3 section:(id)a4 isLegacy:(BOOL)a5;
- (float)iFunScore;
- (float)modelScore;
- (float)serverRelevanceScore;
- (id)getIFunScore:(id)a3 rankingConfig:(id)a4 isLocal:(BOOL)a5 result:(id)a6 queryContext:(id)a7 isQUIntent:(BOOL *)a8;
- (void)setFeatures:(id)a3;
- (void)setIFunScore:(float)a3;
- (void)setModelScore:(float)a3;
- (void)setServerRelevanceScore:(float)a3;
@end

@implementation SectionL3Scores

- (SectionL3Scores)init
{
  v12.receiver = self;
  v12.super_class = (Class)SectionL3Scores;
  v2 = [(SectionL3Scores *)&v12 init];
  v3 = v2;
  if (v2)
  {
    memset_pattern16(v2->l3Score, &unk_1BDC5D330, 0xCuLL);
    memset_pattern16(v3->l3ScoreLegacy, &unk_1BDC5D330, 0xCuLL);
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)&v3->_iFunScore = _D0;
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:67];
    features = v3->_features;
    v3->_features = (NSMutableDictionary *)v9;

    v3->_modelScore = -1.0;
  }
  return v3;
}

- (float)getL3Score:(int)a3 isLegacy:(BOOL)a4
{
  uint64_t v4 = 8;
  if (a4) {
    uint64_t v4 = 20;
  }
  return *(float *)((char *)&self->super.isa + 4 * a3 + v4);
}

+ (float)normalizeLegacyScore:(float)a3
{
  return 1.0 / (expf(-a3) + 1.0);
}

- (float)getResultScore:(id)a3 section:(id)a4 isLegacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v5)
  {
    if ([v8 domain] == 2)
    {
      [v7 l2score];
    }
    else
    {
      v16 = [v7 rankingItem];
      v17 = [v16 L2FeatureVector];

      if (!v17)
      {
        float v12 = -1.0;
        goto LABEL_17;
      }
      v18 = [v7 rankingItem];
      v19 = [v18 L2FeatureVector];
      [v19 originalL2Score];
      float v21 = v20;

      if (v21 < -1000.0)
      {
        v22 = [v7 rankingItem];
        [v22 keywordMatchScore];
        float v24 = v23;

        if (v24 > 0.05)
        {
          [v7 l2score];
          float v21 = *(float *)&v10;
        }
      }
      *(float *)&double v10 = v21;
    }
    +[SectionL3Scores normalizeLegacyScore:v10];
    float v12 = v25;
  }
  else
  {
    uint64_t v11 = [v7 rankingItem];
    float v12 = -1.0;
    if (v11)
    {
      v13 = (void *)v11;
      v14 = [v7 rankingItem];
      [v14 keywordMatchScore];
      if (v15 >= 0.0)
      {
        v26 = [v7 rankingItem];
        [v26 likelihood];
        double v28 = v27;

        if (v28 <= 0.0) {
          goto LABEL_17;
        }
        v13 = [v7 rankingItem];
        [v13 likelihood];
        float v12 = v29;
      }
      else
      {
      }
    }
  }
LABEL_17:

  return v12;
}

- (BOOL)computeScore:(id)a3 rankingConfig:(id)a4 hasGoodLocalResult:(BOOL)a5 pos:(int)a6 queryContext:(id)a7
{
  BOOL v193 = a5;
  uint64_t v221 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v184 = a4;
  id v12 = a7;
  if ([v11 resultsCount])
  {
    int v182 = a6;
    v13 = [v11 resultsAtIndex:0];
    int v14 = [v11 domain];
    if (v14 == 2)
    {
      v16 = [v13 sectionBundleIdentifier];
    }
    else
    {
      float v15 = [v13 rankingItem];
      v16 = [v15 sectionBundleIdentifier];
    }
    char v207 = 0;
    v185 = [(SectionL3Scores *)self getIFunScore:v16 rankingConfig:v184 isLocal:v14 != 2 result:v13 queryContext:v12 isQUIntent:&v207];
    id v183 = v12;
    if (v207)
    {
      v18 = v13;
      v19 = v16;
      float v20 = self;
      long long v205 = 0u;
      long long v206 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      float v21 = [v11 resultSet];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v203 objects:v220 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v204;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v204 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v203 + 1) + 8 * i);
            double v27 = [v26 rankingItem];

            if (v27)
            {
              double v28 = [v26 rankingItem];
              [v28 setShouldHideUnderShowMore:0];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v203 objects:v220 count:16];
        }
        while (v23);
      }

      self = v20;
      v16 = v19;
      v13 = v18;
    }
    int v29 = [v11 resultsCount];
    unint64_t v218 = 0xBF800000BF800000;
    int v219 = -1082130432;
    unint64_t v216 = 0xBF800000BF800000;
    int v217 = -1082130432;
    if (v29 >= 1)
    {
      uint64_t v30 = 0;
      if (v29 >= 3) {
        int v31 = 3;
      }
      else {
        int v31 = v29;
      }
      if (v31 <= 1) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = v31;
      }
      do
      {
        uint64_t v33 = [v11 resultsAtIndex:v30];

        v13 = (void *)v33;
        [(SectionL3Scores *)self getResultScore:v33 section:v11 isLegacy:1];
        *((_DWORD *)&v218 + v30) = v34;
        [(SectionL3Scores *)self getResultScore:v33 section:v11 isLegacy:0];
        *((_DWORD *)&v216 + v30++) = v35;
      }
      while (v32 != v30);
      l3ScoreLegacy = self->l3ScoreLegacy;
      v37 = (float *)&v216;
      v38 = (float *)&v218;
      v39 = (float *)&computeScore_rankingConfig_hasGoodLocalResult_pos_queryContext__positionDiscount;
      float v40 = 1.0;
      float v41 = 1.0;
      v42 = v185;
      do
      {
        if (*v38 >= 0.0)
        {
          float v41 = (1.0 - (float)(*v38 * *v39)) * v41;
          float *l3ScoreLegacy = 1.0 - v41;
        }
        if (*v37 >= 0.0)
        {
          float v40 = (1.0 - (float)(*v37 * *v39)) * v40;
          *(l3ScoreLegacy - 3) = 1.0 - v40;
        }
        if (v42)
        {
          [v42 floatValue];
          self->_iFunScore = v43;
          if (*l3ScoreLegacy > 0.0) {
            float *l3ScoreLegacy = v43 * *l3ScoreLegacy;
          }
          float v44 = *(l3ScoreLegacy - 3);
          v42 = v185;
          if (v44 > 0.0) {
            *(l3ScoreLegacy - 3) = v44 * self->_iFunScore;
          }
        }
        ++l3ScoreLegacy;
        ++v39;
        ++v37;
        ++v38;
        --v32;
      }
      while (v32);
      v13 = (void *)v33;
    }
    if ([v11 domain] == 2)
    {
      uint64_t v45 = [v184 serverRelevanceScores];
      if (v45)
      {
        v46 = (void *)v45;
        int v47 = [v16 isEqualToString:@"com.apple.parsec.web_index"];

        if (v47)
        {
          v48 = v13;
          long long v201 = 0u;
          long long v202 = 0u;
          long long v199 = 0u;
          long long v200 = 0u;
          v49 = [v11 results];
          uint64_t v50 = [v49 countByEnumeratingWithState:&v199 objects:v215 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            v179 = v16;
            v180 = v11;
            v52 = self;
            int v53 = 0;
            uint64_t v54 = *(void *)v200;
            id v55 = v48;
            while (2)
            {
              uint64_t v56 = 0;
              uint64_t v57 = v53;
              int v191 = v53 + v51;
              v58 = v55;
              do
              {
                if (*(void *)v200 != v54) {
                  objc_enumerationMutation(v49);
                }
                id v55 = *(id *)(*((void *)&v199 + 1) + 8 * v56);

                v59 = [v184 serverRelevanceScores];
                v60 = [v55 identifier];
                v61 = [v59 objectForKey:v60];

                if (v61)
                {
                  if (!v57)
                  {
                    [v61 floatValue];
                    v52->_serverRelevanceScore = v62;
                  }
                  [v61 floatValue];
                  float v64 = v63;
                  [v184 serverRelevanceScoreThreshold];
                  if (v64 < v65 && v193)
                  {
                    self = v52;
                    memset_pattern16(v52->l3Score, &unk_1BDC5D320, 0xCuLL);
                    *(void *)v52->l3ScoreLegacy = 0x80000000800000;
                    v52->l3ScoreLegacy[2] = -3.4028e38;
                    id v11 = v180;
                    v67 = [v180 results];
                    uint64_t v68 = [v67 count] - v57;

                    v69 = [v180 resultSet];
                    objc_msgSend(v69, "removeObjectsInRange:", v57, v68);

                    v70 = SSGeneralLog();
                    BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
                    v48 = v61;
                    if (v71)
                    {
                      [v184 serverRelevanceScoreThreshold];
                      *(_DWORD *)buf = 138412802;
                      v210 = v61;
                      __int16 v211 = 2048;
                      double v212 = v72;
                      __int16 v213 = 1024;
                      int v214 = v57;
                      _os_log_impl(&dword_1BDB2A000, v70, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: website relevance score %@ < threshold %f, filter results starting from index %i", buf, 0x1Cu);
                    }

                    goto LABEL_59;
                  }
                }

                ++v56;
                ++v57;
                v58 = v55;
              }
              while (v51 != v56);
              uint64_t v51 = [v49 countByEnumeratingWithState:&v199 objects:v215 count:16];
              int v53 = v191;
              if (v51) {
                continue;
              }
              break;
            }
            v48 = v55;
            id v55 = 0;
            id v11 = v180;
            self = v52;
LABEL_59:
            v16 = v179;
          }
          else
          {
            id v55 = 0;
          }

          v13 = v55;
        }
      }
    }
    [(NSMutableDictionary *)self->_features setObject:v16 forKeyedSubscript:@"section_bundle_id"];
    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    id obj = [v11 resultSet];
    uint64_t v192 = [obj countByEnumeratingWithState:&v195 objects:v208 count:16];
    if (v192)
    {
      v178 = v13;
      id v181 = v11;
      uint64_t v73 = 0;
      int v74 = 0;
      int v194 = 0;
      uint64_t v189 = *(void *)v196;
      uint64_t v190 = 0;
      float v75 = 0.0;
      float v76 = 0.0;
      float v77 = 0.0;
      float v78 = 0.0;
      do
      {
        uint64_t v79 = 0;
        uint64_t v186 = v73;
        do
        {
          if (*(void *)v196 != v189) {
            objc_enumerationMutation(obj);
          }
          uint64_t v80 = v73 + v79;
          v81 = *(void **)(*((void *)&v195 + 1) + 8 * v79);
          if ((int)v73 + (int)v79 <= 2)
          {
            if ([*(id *)(*((void *)&v195 + 1) + 8 * v79) topHit]) {
              v82 = &unk_1F1860EF0;
            }
            else {
              v82 = &unk_1F1860F08;
            }
            int v188 = v74;
            v83 = self;
            features = self->_features;
            v85 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_is_tophit_%d", v73 + v79);
            [(NSMutableDictionary *)features setObject:v82 forKeyedSubscript:v85];

            if ([v81 topHit]) {
              int v86 = 1;
            }
            else {
              int v86 = HIDWORD(v190);
            }
            HIDWORD(v190) = v86;
            v87 = (void *)MEMORY[0x1E4F28ED0];
            v88 = [v81 rankingItem];
            [v88 l2Score];
            v89 = objc_msgSend(v87, "numberWithFloat:");
            v90 = v83->_features;
            v91 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_pommesL2Score_%d", v80);
            [(NSMutableDictionary *)v90 setObject:v89 forKeyedSubscript:v91];

            v92 = (void *)MEMORY[0x1E4F28ED0];
            v93 = [v81 rankingItem];
            [v93 keywordMatchScore];
            v94 = objc_msgSend(v92, "numberWithFloat:");
            v95 = v83->_features;
            v96 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_topicalityScore_%d", v80);
            [(NSMutableDictionary *)v95 setObject:v94 forKeyedSubscript:v96];

            v97 = (void *)MEMORY[0x1E4F28ED0];
            v98 = [v81 rankingItem];
            [v98 freshnessScore];
            *(float *)&double v99 = v99;
            v100 = [v97 numberWithFloat:v99];
            v101 = v83->_features;
            v102 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_freshness_%d", v80);
            [(NSMutableDictionary *)v101 setObject:v100 forKeyedSubscript:v102];

            v103 = (void *)MEMORY[0x1E4F28ED0];
            v104 = [v81 rankingItem];
            [v104 engagementScore];
            *(float *)&double v105 = v105;
            v106 = [v103 numberWithFloat:v105];
            v107 = v83->_features;
            v108 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_engagementScore_%d", v80);
            [(NSMutableDictionary *)v107 setObject:v106 forKeyedSubscript:v108];

            v109 = (void *)MEMORY[0x1E4F28ED0];
            v110 = [v81 rankingItem];
            [v110 likelihood];
            *(float *)&double v111 = v111;
            v112 = [v109 numberWithFloat:v111];
            v113 = v83->_features;
            v114 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_predictedLikelihoodOfEngagement_%d", v80);
            [(NSMutableDictionary *)v113 setObject:v112 forKeyedSubscript:v114];

            v115 = (void *)MEMORY[0x1E4F28ED0];
            int v116 = [v81 topHit];
            double v117 = 1.0;
            if (!v116) {
              double v117 = 0.0;
            }
            v118 = [v115 numberWithDouble:v117];
            v119 = v83->_features;
            v120 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_wasNominatedAsTopHit_%d", v80);
            [(NSMutableDictionary *)v119 setObject:v118 forKeyedSubscript:v120];

            v121 = (void *)MEMORY[0x1E4F28ED0];
            v122 = [v81 rankingItem];
            if ([v122 exactMatchedLaunchString]) {
              *(float *)&double v123 = 1.0;
            }
            else {
              *(float *)&double v123 = 0.0;
            }
            v124 = [v121 numberWithFloat:v123];
            v125 = v83->_features;
            v126 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_isExactMatchOfLaunchString_%d", v80);
            [(NSMutableDictionary *)v125 setObject:v124 forKeyedSubscript:v126];

            v127 = (void *)MEMORY[0x1E4F28ED0];
            v128 = [v81 rankingItem];
            if ([v128 wasEngagedInSpotlight]) {
              *(float *)&double v129 = 1.0;
            }
            else {
              *(float *)&double v129 = 0.0;
            }
            v130 = [v127 numberWithFloat:v129];
            v131 = v83->_features;
            v132 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_wasEngagedInSpotlight_%d", v80);
            [(NSMutableDictionary *)v131 setObject:v130 forKeyedSubscript:v132];

            v133 = (void *)MEMORY[0x1E4F28ED0];
            v134 = [v81 rankingItem];
            v135 = [v134 L2FeatureVector];
            [v135 originalL2Score];
            v136 = objc_msgSend(v133, "numberWithFloat:");
            v137 = v83->_features;
            v138 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_originalL2Score_%d", v80);
            v139 = v137;
            uint64_t v73 = v186;
            [(NSMutableDictionary *)v139 setObject:v136 forKeyedSubscript:v138];

            self = v83;
            int v74 = v188;

            v140 = (void *)MEMORY[0x1E4F28ED0];
            [v81 l2score];
            v141 = objc_msgSend(v140, "numberWithFloat:");
            v142 = self->_features;
            v143 = objc_msgSend(NSString, "stringWithFormat:", @"results_top3_l2Score_%d", v80);
            [(NSMutableDictionary *)v142 setObject:v141 forKeyedSubscript:v143];
          }
          if ([v81 topHit] == 1)
          {
            ++v74;
          }
          else
          {
            int v144 = [v81 topHit];
            int v145 = v190;
            if (v144 == 2) {
              int v145 = v190 + 1;
            }
            LODWORD(v190) = v145;
          }
          v194 += +[SSTopHitNominationManager passLikelihoodForTopHitCandidate:v81];
          v146 = [v81 rankingItem];
          [v146 likelihood];
          double v148 = v147;

          if (v148 > v75) {
            float v75 = v148;
          }
          v149 = [v81 rankingItem];
          [v149 keywordMatchScore];
          float v151 = v150;

          if (v76 < v151) {
            float v76 = v151;
          }
          v152 = [v81 rankingItem];
          v153 = [v152 L2FeatureVector];
          [v153 originalL2Score];
          float v155 = v154;

          if (v77 < v155) {
            float v77 = v155;
          }
          [v81 l2score];
          if (v78 < v156) {
            float v78 = v156;
          }
          ++v79;
        }
        while (v192 != v79);
        uint64_t v73 = (v73 + v79);
        uint64_t v192 = [obj countByEnumeratingWithState:&v195 objects:v208 count:16];
      }
      while (v192);
      float v157 = (float)v194;
      id v11 = v181;
      v13 = v178;
    }
    else
    {
      uint64_t v190 = 0;
      int v74 = 0;
      float v157 = 0.0;
      float v75 = 0.0;
      float v76 = 0.0;
      float v77 = 0.0;
      float v78 = 0.0;
    }

    id v12 = v183;
    if ([v11 domain] == 2)
    {
      *(float *)&double v158 = (float)v182;
      v159 = [MEMORY[0x1E4F28ED0] numberWithFloat:v158];
      [(NSMutableDictionary *)self->_features setObject:v159 forKeyedSubscript:@"server_section_dpos"];
    }
    *(float *)&double v158 = (float)SHIDWORD(v190);
    v160 = [MEMORY[0x1E4F28ED0] numberWithFloat:v158];
    [(NSMutableDictionary *)self->_features setObject:v160 forKeyedSubscript:@"section_is_tophit"];

    *(float *)&double v161 = (float)v74;
    v162 = [MEMORY[0x1E4F28ED0] numberWithFloat:v161];
    [(NSMutableDictionary *)self->_features setObject:v162 forKeyedSubscript:@"section_tophit_should_be_count"];

    *(float *)&double v163 = (float)(int)v190;
    v164 = [MEMORY[0x1E4F28ED0] numberWithFloat:v163];
    [(NSMutableDictionary *)self->_features setObject:v164 forKeyedSubscript:@"section_tophit_must_be_count"];

    *(float *)&double v165 = v157;
    v166 = [MEMORY[0x1E4F28ED0] numberWithFloat:v165];
    [(NSMutableDictionary *)self->_features setObject:v166 forKeyedSubscript:@"score_over_th_threshold_count"];

    *(float *)&double v167 = v75;
    v168 = [MEMORY[0x1E4F28ED0] numberWithFloat:v167];
    [(NSMutableDictionary *)self->_features setObject:v168 forKeyedSubscript:@"max_likelihood"];

    *(float *)&double v169 = v76;
    v170 = [MEMORY[0x1E4F28ED0] numberWithFloat:v169];
    [(NSMutableDictionary *)self->_features setObject:v170 forKeyedSubscript:@"max_topicality"];

    *(float *)&double v171 = v77;
    v172 = [MEMORY[0x1E4F28ED0] numberWithFloat:v171];
    [(NSMutableDictionary *)self->_features setObject:v172 forKeyedSubscript:@"max_original_l2_score"];

    *(float *)&double v173 = v78;
    v174 = [MEMORY[0x1E4F28ED0] numberWithFloat:v173];
    [(NSMutableDictionary *)self->_features setObject:v174 forKeyedSubscript:@"max_l2_score"];

    v175 = (void *)MEMORY[0x1E4F28ED0];
    [v185 floatValue];
    v176 = objc_msgSend(v175, "numberWithFloat:");
    [(NSMutableDictionary *)self->_features setObject:v176 forKeyedSubscript:@"ifun_score"];

    BOOL v17 = v207 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)getIFunScore:(id)a3 rankingConfig:(id)a4 isLocal:(BOOL)a5 result:(id)a6 queryContext:(id)a7 isQUIntent:(BOOL *)a8
{
  BOOL v11 = a5;
  v13 = (__CFString *)a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (([(__CFString *)v13 isEqualToString:@"com.apple.spotlight.contacts"] & 1) != 0
    || ([(__CFString *)v13 isEqualToString:@"com.apple.contacts"] & 1) != 0)
  {
    BOOL v17 = @"com.apple.MobileAddressBook";
LABEL_4:

    v13 = v17;
    goto LABEL_5;
  }
  if ([(__CFString *)v13 isEqualToString:@"com.apple.calculation"])
  {
    BOOL v17 = @"com.apple.calculator";
    goto LABEL_4;
  }
  if ([(__CFString *)v13 isEqualToString:@"com.apple.DocumentsApp"])
  {
    BOOL v17 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
    goto LABEL_4;
  }
LABEL_5:
  if (isQUIntentMatchBundle([v16 intentFromQU], v13))
  {
    *a8 = 1;
    v18 = &unk_1F1863FE0;
    goto LABEL_200;
  }
  v19 = v13;
  if ([(__CFString *)v19 compare:@"com.apple.unknown" options:3])
  {
    if ([(__CFString *)v19 compare:@"com.apple.applications" options:3])
    {
      if ([(__CFString *)v19 compare:@"com.apple.bookmarks" options:3])
      {
        uint64_t v20 = 3;
        if ([(__CFString *)v19 compare:@"com.apple.calculator" options:3])
        {
          if ([(__CFString *)v19 compare:@"com.apple.calendar" options:3])
          {
            if ([(__CFString *)v19 compare:@"com.apple.coresuggestions" options:3])
            {
              if ([(__CFString *)v19 compare:@"com.apple.developer" options:3])
              {
                if ([(__CFString *)v19 compare:@"com.apple.dictionary" options:3])
                {
                  if ([(__CFString *)v19 compare:@"com.apple.directories" options:3])
                  {
                    if ([(__CFString *)v19 compare:@"com.apple.documents" options:3])
                    {
                      if ([(__CFString *)v19 compare:@"com.apple.ibooks" options:3])
                      {
                        if ([(__CFString *)v19 compare:@"com.apple.keynote" options:3])
                        {
                          if ([(__CFString *)v19 compare:@"com.apple.mail" options:3])
                          {
                            if ([(__CFString *)v19 compare:@"com.apple.mobiletimer" options:3])
                            {
                              if ([(__CFString *)v19 compare:@"com.apple.news" options:3])
                              {
                                if ([(__CFString *)v19 compare:@"com.apple.numbers" options:3])
                                {
                                  if ([(__CFString *)v19 compare:@"com.apple.other" options:3])
                                  {
                                    if ([(__CFString *)v19 compare:@"com.apple.pdfs" options:3])
                                    {
                                      if ([(__CFString *)v19 compare:@"com.apple.photos" options:3])
                                      {
                                        if ([(__CFString *)v19 compare:@"com.apple.reminders" options:3])
                                        {
                                          if ([(__CFString *)v19 compare:@"com.apple.settings" options:3])
                                          {
                                            if ([(__CFString *)v19 compare:@"com.apple.voicememos" options:3])
                                            {
                                              if ([(__CFString *)v19 compare:@"com.apple.application" options:3])
                                              {
                                                if ([(__CFString *)v19 compare:@"com.apple.parsec.itunes.iossoftware" options:3])
                                                {
                                                  if ([(__CFString *)v19 compare:@"com.getdropbox.dropbox" options:3])
                                                  {
                                                    if ([(__CFString *)v19 compare:@"com.apple.parsec.flights" options:3])
                                                    {
                                                      if ([(__CFString *)v19 compare:@"com.giphy.giphyformessenger" options:3])
                                                      {
                                                        if ([(__CFString *)v19 compare:@"com.google.chrome.ios" options:3])
                                                        {
                                                          if ([(__CFString *)v19 compare:@"com.google.maps" options:3])
                                                          {
                                                            if ([(__CFString *)v19 compare:@"com.google.photos" options:3])
                                                            {
                                                              if ([(__CFString *)v19 compare:@"com.groupon.grouponapp" options:3])
                                                              {
                                                                if ([(__CFString *)v19 compare:@"com.apple.parsec.kg" options:3])
                                                                {
                                                                  if ([(__CFString *)v19 compare:@"com.linkedin.linkedin" options:3])
                                                                  {
                                                                    if ([(__CFString *)v19 compare:@"com.apple.maps" options:3])
                                                                    {
                                                                      if ([(__CFString *)v19 compare:@"com.apple.parsec.maps" options:3])
                                                                      {
                                                                        if ([(__CFString *)v19 compare:@"com.apple.parsec.itunes.artist" options:3])
                                                                        {
                                                                          if ([(__CFString *)v19 compare:@"com.microsoft.office.outlook" options:3])
                                                                          {
                                                                            if ([(__CFString *)v19 compare:@"com.mlb.atbatuniversal" options:3])
                                                                            {
                                                                              if ([(__CFString *)v19 compare:@"com.apple.mobileaddressbook" options:3])
                                                                              {
                                                                                if ([(__CFString *)v19 compare:@"com.apple.mobilecal" options:3])
                                                                                {
                                                                                  if ([(__CFString *)v19 compare:@"com.apple.clouddocs.mobiledocumentsfileprovider" options:3])
                                                                                  {
                                                                                    if ([(__CFString *)v19 compare:@"com.apple.mobilemail" options:3])
                                                                                    {
                                                                                      if ([(__CFString *)v19 compare:@"com.apple.mobilenotes" options:3])
                                                                                      {
                                                                                        if ([(__CFString *)v19 compare:@"com.apple.mobilesafari" options:3])
                                                                                        {
                                                                                          if ([(__CFString *)v19 compare:@"com.apple.mobilesms" options:3])
                                                                                          {
                                                                                            if ([(__CFString *)v19 compare:@"com.apple.parsec.movies" options:3])
                                                                                            {
                                                                                              if ([(__CFString *)v19 compare:@"com.apple.music" options:3])
                                                                                              {
                                                                                                if ([(__CFString *)v19 compare:@"com.apple.parsec.news" options:3])
                                                                                                {
                                                                                                  if ([(__CFString *)v19 compare:@"com.apple.other:search_app_store" options:3])
                                                                                                  {
                                                                                                    if ([(__CFString *)v19 compare:@"com.apple.other:search_maps" options:3])
                                                                                                    {
                                                                                                      if ([(__CFString *)v19 compare:@"com.apple.other:search_web" options:3])
                                                                                                      {
                                                                                                        if ([(__CFString *)v19 compare:@"com.apple.other:taptoradar" options:3])
                                                                                                        {
                                                                                                          if ([(__CFString *)v19 compare:@"com.pandora" options:3])
                                                                                                          {
                                                                                                            if ([(__CFString *)v19 compare:@"pinterest" options:3])
                                                                                                            {
                                                                                                              if ([(__CFString *)v19 compare:@"com.apple.podcasts" options:3])
                                                                                                              {
                                                                                                                if ([(__CFString *)v19 compare:@"com.apple.preferences" options:3])
                                                                                                                {
                                                                                                                  if ([(__CFString *)v19 compare:@"com.apple.spotlight.related_search" options:3])
                                                                                                                  {
                                                                                                                    if ([(__CFString *)v19 compare:@"com.riffsy.riffsykeyboard" options:3])
                                                                                                                    {
                                                                                                                      if ([(__CFString *)v19 compare:@"com.apple.parsec.sports" options:3])
                                                                                                                      {
                                                                                                                        if ([(__CFString *)v19 compare:@"com.apple.spotlight.suggestionlist.contact" options:3])
                                                                                                                        {
                                                                                                                          if ([(__CFString *)v19 compare:@"com.apple.spotlight.suggestionlist.local" options:3])
                                                                                                                          {
                                                                                                                            if ([(__CFString *)v19 compare:@"com.apple.spotlight.suggestionlist.usertypedstring" options:3])
                                                                                                                            {
                                                                                                                              if ([(__CFString *)v19 compare:@"com.apple.stocks" options:3])
                                                                                                                              {
                                                                                                                                if ([(__CFString *)v19 compare:@"com.apple.parsec.stocks" options:3])
                                                                                                                                {
                                                                                                                                  if ([(__CFString *)v19 compare:@"com.stubhub.stubhub" options:3])
                                                                                                                                  {
                                                                                                                                    if ([(__CFString *)v19 compare:@"com.apple.searchd.suggestions" options:3])
                                                                                                                                    {
                                                                                                                                      if ([(__CFString *)v19 compare:@"com.apple.spotlight.suggestionlist.parsec" options:3])
                                                                                                                                      {
                                                                                                                                        if ([(__CFString *)v19 compare:@"com.apple.taptoradar" options:3])
                                                                                                                                        {
                                                                                                                                          if ([(__CFString *)v19 compare:@"com.apple.parsec.tv.tvshow" options:3])
                                                                                                                                          {
                                                                                                                                            if ([(__CFString *)v19 compare:@"com.atebits.tweetie2" options:3])
                                                                                                                                            {
                                                                                                                                              if ([(__CFString *)v19 compare:@"tv.twitch" options:3])
                                                                                                                                              {
                                                                                                                                                if ([(__CFString *)v19 compare:@"com.apple.weather" options:3])
                                                                                                                                                {
                                                                                                                                                  if ([(__CFString *)v19 compare:@"com.apple.parsec.weather" options:3])
                                                                                                                                                  {
                                                                                                                                                    if ([(__CFString *)v19 compare:@"com.apple.parsec.web_answer" options:3])
                                                                                                                                                    {
                                                                                                                                                      if ([(__CFString *)v19 compare:@"com.apple.parsec.web_images" options:3])
                                                                                                                                                      {
                                                                                                                                                        if ([(__CFString *)v19 compare:@"com.apple.parsec.web_index" options:3])
                                                                                                                                                        {
                                                                                                                                                          if ([(__CFString *)v19 compare:@"com.google.ios.youtube" options:3])
                                                                                                                                                          {
                                                                                                                                                            if ([(__CFString *)v19 compare:@"net.whatsapp.whatsapp" options:3])
                                                                                                                                                            {
                                                                                                                                                              if ([(__CFString *)v19 compare:@"com.yahoo.aerogram" options:3])
                                                                                                                                                              {
                                                                                                                                                                if ([(__CFString *)v19 compare:@"com.yelp.yelpiphone" options:3])
                                                                                                                                                                {
                                                                                                                                                                  if ([(__CFString *)v19 compare:@"com.google.ios.youtube" options:3])
                                                                                                                                                                  {
                                                                                                                                                                    if ([(__CFString *)v19 compare:@"com.zillow.zillowmap" options:3])
                                                                                                                                                                    {
                                                                                                                                                                      if ([(__CFString *)v19 compare:@"com.apple.parsec.dictionary" options:3])
                                                                                                                                                                      {
                                                                                                                                                                        if ([(__CFString *)v19 compare:@"com.apple.shortcuts" options:3])
                                                                                                                                                                        {
                                                                                                                                                                          if ([(__CFString *)v19 compare:@"com.apple.tips" options:3])
                                                                                                                                                                          {
                                                                                                                                                                            if ([(__CFString *)v19 compare:@"com.apple.health" options:3])
                                                                                                                                                                            {
                                                                                                                                                                              if ([(__CFString *)v19 compare:@"com.apple.systempreferences" options:3])
                                                                                                                                                                              {
                                                                                                                                                                                if ([(__CFString *)v19 compare:@"com.apple.conversion" options:3]) {
                                                                                                                                                                                  uint64_t v20 = 0;
                                                                                                                                                                                }
                                                                                                                                                                                else {
                                                                                                                                                                                  uint64_t v20 = 87;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                uint64_t v20 = 86;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              uint64_t v20 = 85;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            uint64_t v20 = 84;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          uint64_t v20 = 83;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        uint64_t v20 = 82;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      uint64_t v20 = 81;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    uint64_t v20 = 80;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  uint64_t v20 = 79;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                uint64_t v20 = 78;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              uint64_t v20 = 77;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            uint64_t v20 = 76;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          uint64_t v20 = 75;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        uint64_t v20 = 74;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      uint64_t v20 = 73;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    uint64_t v20 = 72;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  uint64_t v20 = 71;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                uint64_t v20 = 70;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              uint64_t v20 = 69;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            uint64_t v20 = 68;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          uint64_t v20 = 67;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        uint64_t v20 = 66;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      uint64_t v20 = 65;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    uint64_t v20 = 64;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  uint64_t v20 = 63;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                uint64_t v20 = 62;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              uint64_t v20 = 61;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            uint64_t v20 = 60;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          uint64_t v20 = 59;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        uint64_t v20 = 58;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      uint64_t v20 = 57;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    uint64_t v20 = 56;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  uint64_t v20 = 55;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                uint64_t v20 = 54;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              uint64_t v20 = 53;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            uint64_t v20 = 52;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          uint64_t v20 = 51;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        uint64_t v20 = 50;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      uint64_t v20 = 49;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    uint64_t v20 = 48;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  uint64_t v20 = 47;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                uint64_t v20 = 46;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              uint64_t v20 = 45;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            uint64_t v20 = 44;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          uint64_t v20 = 43;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        uint64_t v20 = 42;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      uint64_t v20 = 41;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v20 = 40;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  uint64_t v20 = 39;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v20 = 38;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              uint64_t v20 = 37;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            uint64_t v20 = 36;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v20 = 35;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        uint64_t v20 = 34;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v20 = 33;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    uint64_t v20 = 32;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v20 = 31;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                uint64_t v20 = 30;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              uint64_t v20 = 29;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            uint64_t v20 = 28;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          uint64_t v20 = 27;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v20 = 26;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v20 = 25;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v20 = 24;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v20 = 23;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t v20 = 22;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v20 = 21;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v20 = 20;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v20 = 19;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v20 = 18;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v20 = 17;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v20 = 16;
                                  }
                                }
                                else
                                {
                                  uint64_t v20 = 15;
                                }
                              }
                              else
                              {
                                uint64_t v20 = 14;
                              }
                            }
                            else
                            {
                              uint64_t v20 = 13;
                            }
                          }
                          else
                          {
                            uint64_t v20 = 12;
                          }
                        }
                        else
                        {
                          uint64_t v20 = 11;
                        }
                      }
                      else
                      {
                        uint64_t v20 = 10;
                      }
                    }
                    else
                    {
                      uint64_t v20 = 9;
                    }
                  }
                  else
                  {
                    uint64_t v20 = 8;
                  }
                }
                else
                {
                  uint64_t v20 = 7;
                }
              }
              else
              {
                uint64_t v20 = 6;
              }
            }
            else
            {
              uint64_t v20 = 5;
            }
          }
          else
          {
            uint64_t v20 = 4;
          }
        }
      }
      else
      {
        uint64_t v20 = 2;
      }
    }
    else
    {
      uint64_t v20 = 1;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  float v21 = [v14 iFunScores];
  uint64_t v22 = [v21 domainScores];
  uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v20];
  v18 = [v22 objectForKey:v23];

  if (!v18)
  {
    if (v11)
    {
      uint64_t v24 = [v15 rankingItem];
      if (v24)
      {
        float v25 = (void *)v24;
        v26 = [v15 rankingItem];
        [v26 keywordMatchScore];
        if (v27 <= 0.0)
        {
        }
        else
        {
          double v28 = [v15 rankingItem];
          int v29 = [v28 sectionBundleIdentifier];
          char v30 = [v29 isEqualToString:@"com.apple.tips"];

          if ((v30 & 1) == 0)
          {
            int v31 = [v14 iFunScores];
            uint64_t v32 = [v31 localScore];

            if (v32)
            {
              uint64_t v33 = [v14 iFunScores];
              v18 = [v33 localScore];

              goto LABEL_200;
            }
            goto LABEL_198;
          }
        }
      }
    }
    int v34 = [v14 iFunScores];

    if (v34)
    {
      if (v20 != 34) {
        goto LABEL_198;
      }
      int v35 = [v14 iFunScores];
      v36 = [v35 domainScores];
      v18 = [v36 objectForKey:&unk_1F1860F20];

      if (!v18) {
LABEL_198:
      }
        v18 = &unk_1F1864260;
    }
    else
    {
      v18 = 0;
    }
  }
LABEL_200:

  return v18;
}

+ (void)getComparableL3Score:(id)a3 sectionMapping:(id)a4 bundleId1:(id)a5 bundleId2:(id)a6 score1:(float *)a7 score2:(float *)a8 usePommesScore:(BOOL)a9 useLegacyScore:(BOOL)a10
{
  id v36 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (SSEnableSpotlightFullPageRanking())
  {
    v18 = [v36 objectForKey:v16];
    uint64_t v19 = [v36 objectForKey:v17];
    uint64_t v20 = (void *)v19;
    if (!v18 || !v19) {
      goto LABEL_21;
    }
    int v34 = a8;
    float v21 = [v15 objectForKey:v16];
    uint64_t v22 = [v15 objectForKey:v17];
    int v35 = v22;
    if ([v21 resultsCount] && objc_msgSend(v22, "resultsCount"))
    {
      uint64_t v23 = [v21 resultsCount];
      uint64_t v33 = v21;
      uint64_t v24 = a7;
      unint64_t v25 = v23;
      unint64_t v26 = [v22 resultsCount];
      if (v25 >= v26) {
        unint64_t v27 = v26;
      }
      else {
        unint64_t v27 = v25;
      }
      a7 = v24;
      float v21 = v33;
      if (v27 >= 3) {
        LODWORD(v27) = 3;
      }
      uint64_t v28 = (v27 - 1);
      if (!a9) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v28 = 0;
      if (!a9) {
        goto LABEL_16;
      }
    }
    [v18 getL3Score:v28 isLegacy:0];
    float v30 = v29;
    [v20 getL3Score:v28 isLegacy:0];
    if (v30 >= 0.0 && v31 >= 0.0)
    {
LABEL_19:
      *a7 = v30;
      *int v34 = v31;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
LABEL_16:
    if (!a10) {
      goto LABEL_20;
    }
    [v18 getL3Score:v28 isLegacy:1];
    float v30 = v32;
    [v20 getL3Score:v28 isLegacy:1];
    if (v30 < 0.0 || v31 < 0.0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_22:
}

+ (void)getComparableModelL3Score:(id)a3 bundleId1:(id)a4 bundleId2:(id)a5 score1:(float *)a6 score2:(float *)a7
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a5;
  if (SSEnableSpotlightFullPageRanking())
  {
    v13 = [v20 objectForKey:v11];
    uint64_t v14 = [v20 objectForKey:v12];
    id v15 = (void *)v14;
    if (v13)
    {
      if (v14)
      {
        [v13 modelScore];
        if (v16 >= 0.0)
        {
          [v15 modelScore];
          if (v17 >= 0.0)
          {
            [v13 modelScore];
            *(_DWORD *)a6 = v18;
            [v15 modelScore];
            *(_DWORD *)a7 = v19;
          }
        }
      }
    }
  }
}

- (float)iFunScore
{
  return self->_iFunScore;
}

- (void)setIFunScore:(float)a3
{
  self->_iFunScore = a3;
}

- (float)serverRelevanceScore
{
  return self->_serverRelevanceScore;
}

- (void)setServerRelevanceScore:(float)a3
{
  self->_serverRelevanceScore = a3;
}

- (NSMutableDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (float)modelScore
{
  return self->_modelScore;
}

- (void)setModelScore:(float)a3
{
  self->_modelScore = a3;
}

- (void).cxx_destruct
{
}

@end