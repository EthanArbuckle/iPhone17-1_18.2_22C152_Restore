@interface SSBullseyeTopHitsManager
+ (id)dedupeWebURLSuggestionsFromSections:(id)a3;
- (SFMutableResultSection)bullseyeSectionForTopHit:(uint64_t)a3 initiallyHidden:(int)a4 checkForTopHit:(int)a5 boostSafari:(int)a6 thresholdCounter:(void *)a7 existingResults:(int)a8 allowMultipleTopHits:;
- (SSBullseyeTopHitsManager)initWithQueryId:(int64_t)a3 categoryToResultMapping:(id)a4 currentTopHitSection:(id)a5 queryContext:(id)a6 ranker:(id)a7;
- (id)bullseyeResultSetForTopHit:(int)a3 checkForTopHit:(int)a4 boostSafari:(int)a5 thresholdCounter:(void *)a6 existingResults:(int)a7 allowMultipleTopHits:;
- (id)bullseyeSectionForTopHit:(id)a3 initiallyHidden:(BOOL)a4 checkForTopHit:(BOOL)a5 thresholdCounter:(int)a6;
- (id)bullseyeTopHitSection;
- (id)bullseyeTopHitSections:(id)a3 maxTopHitsCount:(int)a4 minThresholdForBigResult:(double)a5 needExceptionForSafariSection:(BOOL)a6;
- (id)tagOrFilterHiddenSectionsForClient:(id)a3 isCommittedSearch:(BOOL)a4 maxVisibleSections:(int64_t)a5 maxTopHitsCount:(int)a6 minThresholdForBigResult:(double)a7 topHitSection:(id *)a8;
- (void)resetVisibilityCounts;
@end

@implementation SSBullseyeTopHitsManager

- (SSBullseyeTopHitsManager)initWithQueryId:(int64_t)a3 categoryToResultMapping:(id)a4 currentTopHitSection:(id)a5 queryContext:(id)a6 ranker:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SSBullseyeTopHitsManager;
  v17 = [(SSBullseyeTopHitsManager *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_categoryToResultMapping, a4);
    v18->_queryID = a3;
    objc_storeStrong((id *)&v18->_topHitSection, a5);
    objc_storeStrong((id *)&v18->_queryContext, a6);
    objc_storeStrong((id *)&v18->_ranker, a7);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          SSScreenTimeStatusForBundleIDWithCompletionHandler(*(void **)(*((void *)&v25 + 1) + 8 * v23++), 0);
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v21);
    }
  }
  return v18;
}

- (id)bullseyeResultSetForTopHit:(int)a3 checkForTopHit:(int)a4 boostSafari:(int)a5 thresholdCounter:(void *)a6 existingResults:(int)a7 allowMultipleTopHits:
{
  uint64_t v286 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a6;
  uint64_t v225 = a1;
  if (!a1)
  {
    id v187 = 0;
    goto LABEL_316;
  }
  id v13 = [v11 bundleIdentifier];
  id v14 = [v11 relatedSectionBundleIdentifier];
  v224 = [v11 resultSet];
  uint64_t v229 = [v224 count];
  int v249 = [v13 isEqualToString:@"com.apple.spotlight.tophits"];
  v205 = v13;
  if (v249) {
    goto LABEL_3;
  }
  if ([v13 isEqualToString:@"com.apple.application"])
  {
    int v252 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 1;
    goto LABEL_9;
  }
  if ([v13 isEqualToString:@"com.apple.app-clips"])
  {
    int v252 = 0;
    int v15 = 0;
    int v17 = 0;
    int v16 = 1;
    goto LABEL_9;
  }
  if (([v13 isEqualToString:@"com.apple.MobileAddressBook"] & 1) == 0)
  {
    if ([v13 hasPrefix:@"com.apple.parsec"])
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v252 = 1;
      goto LABEL_9;
    }
    if (([v13 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0
      && ([v13 isEqualToString:@"com.apple.searchd.syndicatedPhotos"] & 1) == 0)
    {
      int v15 = [v13 isEqualToString:@"com.apple.mobiletimer"];
      int v252 = 0;
      goto LABEL_4;
    }
LABEL_3:
    int v252 = 0;
    int v15 = 0;
LABEL_4:
    int v16 = 0;
    int v17 = 0;
LABEL_9:
    int v221 = 1;
    goto LABEL_10;
  }
  int v252 = 0;
  int v15 = 0;
  int v16 = 0;
  int v17 = 0;
  int v221 = 0;
LABEL_10:
  id v18 = v11;
  int v247 = a3;
  v208 = v14;
  BOOL v19 = ([v14 isEqualToString:@"com.apple.application"] & 1) != 0
     || [v14 isEqualToString:@"com.apple.app-clips"];
  unint64_t v248 = [*(id *)(a1 + 64) queryTermLength];
  unint64_t v244 = [*(id *)(a1 + 64) queryTermCount];
  SSMinSpellCorrectedAppTopHitScore();
  uint64_t ImportantBits = PRSRankingQueryImportantBits(0);
  uint64_t v210 = v21;
  uint64_t v211 = ImportantBits;
  int v22 = [*(id *)(a1 + 64) isAltNamePrefixMatchOnlyTopHitExcludedQuery];
  int v23 = [*(id *)(a1 + 64) isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery];
  BOOL v239 = SSEnableSpotlightTopHitPersonalizedRanking();
  if (SSDefaultsGetState(3uLL))
  {
    uint64_t v24 = [*(id *)(a1 + 8) objectForKey:@"com.apple.parsec.dictionary"];
    if (!v24)
    {
      uint64_t v24 = [*(id *)(a1 + 8) objectForKey:@"com.apple.dictionary"];
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v199 = (id)v24;
  if (v229)
  {
    v223 = 0;
    unint64_t v25 = 0;
    int v196 = v22 ^ 1;
    int v191 = v23 ^ 1;
    if (((a5 == 0) & (v16 | v17 | v15 | a7 & ~v221 | v249 & v19)) != 0) {
      int v26 = 0;
    }
    else {
      int v26 = 2;
    }
    int v195 = v26;
    unint64_t v27 = -1;
    float v28 = 1.0;
    id v11 = v18;
    id v197 = v12;
    v198 = v18;
    objc_super v29 = v224;
    uint64_t v30 = v229;
    while (1)
    {
      uint64_t v31 = [v29 objectAtIndexedSubscript:v25];
      v32 = v31;
      if (v27 == -1) {
        int v33 = v252;
      }
      else {
        int v33 = 0;
      }
      if (v33 == 1)
      {
        if ([v31 topHit]) {
          unint64_t v27 = -1;
        }
        else {
          unint64_t v27 = v25;
        }
      }
      if (([v32 forceNoTopHit] & 1) != 0 || objc_msgSend(v12, "containsObject:", v32))
      {
        v34 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int v35 = [v32 topHit];
          int v36 = [v32 forceNoTopHit];
          *(_DWORD *)buf = 134218496;
          *(void *)v254 = v32;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v35;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)&v255[6] = v36;
          _os_log_impl(&dword_1BDB2A000, v34, OS_LOG_TYPE_INFO, "skipping bullseye top hit logic for %p: topHit=%d, forceNoTopHit=%d", buf, 0x18u);
        }

LABEL_35:
        goto LABEL_36;
      }
      if ([v12 containsObject:v32]) {
        goto LABEL_35;
      }
      uint64_t v237 = [v32 score];
      v245 = v37;
      [v32 l2score];
      float v39 = v38;
      v40 = [v32 rankingItem];
      uint64_t v250 = [(PRSRankingItem *)v40 bundleIDType];
      v41 = [(PRSRankingItem *)v40 L2FeatureVector];
      [v41 originalL2Score];
      float v43 = v42;

      BOOL v215 = [(PRSRankingItem *)v40 eligibleForDemotion];
      int v226 = [(PRSRankingItem *)v40 shouldHideUnderShowMore];
      BOOL v222 = [(PRSRankingItem *)v40 recentForTopHit];
      unsigned int v234 = [(PRSRankingItem *)v40 recentForAboveThresholdTopHit];
      v44 = [(PRSRankingItem *)v40 L2FeatureVector];
      [v44 scoreForFeature:2391];
      float v46 = v45;

      v47 = [(PRSRankingItem *)v40 L2FeatureVector];
      [v47 scoreForFeature:2390];
      float v49 = v48;

      v50 = [(PRSRankingItem *)v40 L2FeatureVector];
      [v50 scoreForFeature:2392];
      float v52 = v51;

      v53 = SSDefaultsGetResources();
      int v54 = [v53 BOOLeanForKey:@"ResetResultTopHit"];

      if (v54 && v247 && ([v32 isSafariTopHit] & 1) == 0)
      {
        [v32 setTopHit:0];
        int v55 = 0;
      }
      else
      {
        int v55 = [v32 topHit];
      }
      int v240 = v55;
      id v56 = v12;
      v57 = [v32 title];
      v235 = [v57 text];

      v236 = v40;
      if ((v250 & 0x100) != 0)
      {
        float v232 = v39;
        float v59 = v52;
        float v60 = v43;
        float v61 = v49;
        float v62 = v46;
        v58 = v11;
        v63 = [(PRSRankingItem *)v40 L2FeatureVector];
        [v63 scoreForFeature:1];
        float v230 = v64;

        v65 = [(PRSRankingItem *)v40 L2FeatureVector];
        [v65 scoreForFeature:41];
        float v67 = v66;

        v68 = [(PRSRankingItem *)v40 L2FeatureVector];
        [v68 scoreForFeature:2327];
        float v70 = v69;

        v71 = [(PRSRankingItem *)v40 displayNameInitials];

        v72 = [(PRSRankingItem *)v40 L2FeatureVector];
        [v72 scoreForFeature:1614];
        float v74 = v73;

        v75 = [(PRSRankingItem *)v40 L2FeatureVector];
        [v75 scoreForFeature:189];
        float v77 = v76;

        BOOL v78 = v74 == 0.0;
        BOOL v150 = v77 == 2147500000.0;
        float v28 = 1.0;
        BOOL v79 = !v150 && v74 == 0.0;
        if (v248 <= 4) {
          BOOL v78 = 0;
        }
        BOOL v214 = v78;
        int v80 = v70 == 1.0 || v79;
        BOOL v207 = v71 != 0;
        if (v71) {
          int v80 = 1;
        }
        int v204 = v80 & v196;
        if (v248 <= +[PRSRankingItemRanker spellCorrectedAppMinQueryLen])
        {
          int v219 = 0;
        }
        else
        {
          BOOL v81 = v230 == 1.0;
          if (v67 != 0.0) {
            BOOL v81 = 0;
          }
          int v219 = v81 & v191;
        }
        float v46 = v62;
        float v49 = v61;
        float v43 = v60;
        float v52 = v59;
        float v39 = v232;
      }
      else
      {
        v58 = v11;
        int v204 = 0;
        int v219 = 0;
        BOOL v214 = 0;
        BOOL v207 = 0;
      }
      [v32 isFuzzyMatch];
      int v209 = [v58 domain];
      v82 = +[SSRankingManager defaultKey]();
      v233 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v82, v248, v244, 0);

      v83 = +[SSRankingManager defaultKey]();
      v231 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v83, v248, v244, 1);

      unint64_t v243 = v27;
      if ((v250 & 0x100) != 0 && [v32 isWebClip])
      {
        v84 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, @"com.apple.webclips", v248, v244, 0);
        v85 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, @"com.apple.webclips", v248, v244, 1);
        unint64_t v86 = a5;
        v87 = v56;
      }
      else
      {
        if (v249)
        {
          uint64_t v88 = [(PRSRankingItem *)v40 sectionBundleIdentifier];
          v89 = (void *)v88;
          v90 = v208;
          if (v88) {
            v90 = (void *)v88;
          }
          v91 = v90;

          if (([(PRSRankingItem *)v40 bundleIDType] & 0x10000) != 0)
          {
            v92 = @"com.apple.app-clips";

            v91 = v92;
          }
        }
        else
        {
          v91 = v205;
        }
        unint64_t v86 = a5;
        v87 = v56;
        v84 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v91, v248, v244, 0);
        v85 = +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v91, v248, v244, 1);
      }
      v228 = v84;
      v93 = v245;
      if ([v84 count] > v86
        || (v84 = v85, [v85 count] > v86)
        || (v84 = v233, [v233 count] > v86)
        || (v84 = v231, double v94 = 0.0, [v231 count] > v86))
      {
        v95 = [v84 objectAtIndexedSubscript:v86];
        [v95 doubleValue];
        double v94 = v96;
      }
      v227 = v85;
      v97 = PRSLogCategoryDefault();
      id v11 = v58;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        uint64_t v98 = *(void *)(v225 + 16);
        v99 = [v58 title];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v254 = v98;
        v93 = v245;
        *(_WORD *)&v254[4] = 1024;
        *(_DWORD *)&v254[6] = v25;
        *(_WORD *)v255 = 2112;
        *(void *)&v255[2] = v99;
        *(_WORD *)&v255[10] = 2048;
        double v256 = v94;
        _os_log_impl(&dword_1BDB2A000, v97, OS_LOG_TYPE_INFO, "### [%d] section[%d] title:%@ minTopHitScore:%f ", buf, 0x22u);
      }
      id v12 = v87;
      if (v239)
      {
        v100 = [v32 rankingItem];
        int v101 = [v100 isLocalTopHitCandidate];

        unint64_t v27 = v243;
        uint64_t v102 = v237;
        if (v101)
        {
          [v32 setPreferTopPlatter:1];
          int v240 = SSSetTopHitWithReasonType(1, v32, 24, 0, 1);
        }
      }
      else
      {
        unint64_t v27 = v243;
        uint64_t v102 = v237;
      }
      if (!(v102 | (unint64_t)v93))
      {
        v103 = [v32 resultBundleId];
        if ([v103 isEqualToString:@"com.apple.mobilesafari"]) {
          goto LABEL_89;
        }
        v104 = [v32 resultBundleId];
        if ([v104 isEqualToString:@"com.apple.safari.userTypedURL"]) {
          goto LABEL_88;
        }
        v105 = [v32 resultBundleId];
        if ([v105 isEqualToString:@"com.apple.worldclock"])
        {

          v93 = v245;
LABEL_88:

          uint64_t v102 = v237;
LABEL_89:

          goto LABEL_90;
        }
        v133 = [v32 sectionBundleIdentifier];
        char v134 = [v133 isEqualToString:@"com.apple.datadetector.quick_actions"];

        uint64_t v102 = v237;
        v93 = v245;
        if ((v134 & 1) == 0)
        {
          v135 = PRSLogCategoryDefault();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            int v136 = *(_DWORD *)(v225 + 16);
            v251 = [v32 sectionBundleIdentifier];
            v246 = [v32 applicationBundleIdentifier];
            v137 = [v32 identifier];
            v138 = [v32 sectionBundleIdentifier];
            SSRedactSuggestionIdentifier(v137, v138);
            id v218 = (id)objc_claimAutoreleasedReturnValue();
            v139 = [v32 sectionBundleIdentifier];
            v238 = v137;
            v220 = v138;
            if (v139
              && ([v32 sectionBundleIdentifier],
                  v190 = objc_claimAutoreleasedReturnValue(),
                  ([v190 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0))
            {
              int v217 = 0;
              v140 = @"(private)";
            }
            else
            {
              int v217 = 1;
              SSRedactString(v235, 1);
              v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v189 = v140;
            }
            v174 = [v32 rankingItem];
            v175 = [v32 rankingItem];
            uint64_t v176 = [v175 attributes];
            v177 = [v32 rankingItem];
            uint64_t Count = SSCompactRankingAttrsGetCount([v177 attributes]);
            *(_DWORD *)buf = 67112962;
            *(_DWORD *)v254 = v136;
            *(_WORD *)&v254[4] = 1024;
            *(_DWORD *)&v254[6] = v25;
            *(_WORD *)v255 = 1024;
            *(_DWORD *)&v255[2] = v240;
            *(_WORD *)&v255[6] = 1024;
            *(_DWORD *)&v255[8] = v226;
            LOWORD(v256) = 1024;
            *(_DWORD *)((char *)&v256 + 2) = v215;
            HIWORD(v256) = 1024;
            BOOL v257 = v222;
            __int16 v258 = 1024;
            unsigned int v259 = v234;
            __int16 v260 = 2112;
            v261 = v251;
            __int16 v262 = 2112;
            v263 = v246;
            __int16 v264 = 2112;
            id v265 = v218;
            __int16 v266 = 2048;
            double v267 = v43;
            __int16 v268 = 2048;
            double v269 = v39;
            __int16 v270 = 2112;
            v271 = v140;
            __int16 v272 = 2048;
            uint64_t v273 = (uint64_t)v174;
            __int16 v274 = 2048;
            uint64_t v275 = v176;
            __int16 v276 = 2048;
            uint64_t v277 = Count;
            _os_log_impl(&dword_1BDB2A000, v135, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d] %d %d %d %d %d %@ %@ %@ %f %f %@ (%p, %p, %lu)", buf, 0x86u);

            if (v217) {
            id v11 = v198;
            }
            unint64_t v27 = v243;
            if (v139) {

            }
            id v12 = v197;
          }

          uint64_t v30 = v229;
          int v120 = v249;
          v121 = v236;
          if (v247)
          {
            int v125 = v240;
            if (!v240)
            {
              if (v199 != v11)
              {
                int v125 = 0;
                goto LABEL_312;
              }
              v179 = NSString;
              v180 = [v11 bundleIdentifier];
              v181 = [v179 stringWithFormat:@"Promoting dictionary from %@", v180];
              int v242 = SSSetTopHitWithReasonString(1, v32, v181, 1);

              int v125 = v242;
              int v120 = v249;
            }
          }
          else
          {
            int v125 = v240;
          }
          if (v125 == 1) {
            int v182 = v252;
          }
          else {
            int v182 = 0;
          }
          if (v182 == 1)
          {
            int v183 = v120;
            v184 = [(PRSRankingItem *)v236 L2FeatureVector];
            [v184 scoreForFeature:3233];
            float v186 = v185;

            int v120 = v183;
            int v125 = v186 <= 0.0;
          }
LABEL_312:
          if ((v247 & 1) == 0) {
            goto LABEL_109;
          }
          goto LABEL_236;
        }
      }
LABEL_90:
      *((void *)&v216 + 1) = (unint64_t)v93 & v210;
      *(void *)&long long v216 = v102 & v211;
      v106 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        int v107 = *(_DWORD *)(v225 + 16);
        v213 = [v32 sectionBundleIdentifier];
        v212 = [v32 applicationBundleIdentifier];
        v108 = [v32 identifier];
        v109 = [v32 sectionBundleIdentifier];
        SSRedactSuggestionIdentifier(v108, v109);
        id v110 = (id)objc_claimAutoreleasedReturnValue();
        v111 = [v32 sectionBundleIdentifier];
        v202 = v109;
        v203 = v108;
        v201 = v110;
        if (v111
          && ([v32 sectionBundleIdentifier],
              v194 = objc_claimAutoreleasedReturnValue(),
              ([v194 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0))
        {
          int v112 = v107;
          int v200 = 0;
          v113 = @"(private)";
        }
        else
        {
          int v112 = v107;
          int v200 = 1;
          SSRedactString(v235, 1);
          v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v192 = v113;
        }
        v114 = [v32 rankingItem];
        v115 = [v32 rankingItem];
        uint64_t v116 = [v115 attributes];
        v117 = [v32 rankingItem];
        uint64_t v118 = SSCompactRankingAttrsGetCount([v117 attributes]);
        *(_DWORD *)buf = 67113986;
        *(_DWORD *)v254 = v112;
        *(_WORD *)&v254[4] = 1024;
        *(_DWORD *)&v254[6] = v25;
        *(_WORD *)v255 = 1024;
        *(_DWORD *)&v255[2] = v240;
        *(_WORD *)&v255[6] = 1024;
        *(_DWORD *)&v255[8] = v226;
        LOWORD(v256) = 1024;
        *(_DWORD *)((char *)&v256 + 2) = v215;
        HIWORD(v256) = 1024;
        BOOL v257 = v222;
        __int16 v258 = 1024;
        unsigned int v259 = v234;
        __int16 v260 = 2112;
        v261 = v213;
        __int16 v262 = 2112;
        v263 = v212;
        __int16 v264 = 2112;
        id v265 = v201;
        __int16 v266 = 2048;
        double v267 = v43;
        __int16 v268 = 2048;
        double v269 = v39;
        __int16 v270 = 2048;
        v271 = v245;
        __int16 v272 = 2048;
        uint64_t v273 = v237;
        __int16 v274 = 2048;
        uint64_t v275 = *((void *)&v216 + 1);
        __int16 v276 = 2048;
        uint64_t v277 = v216;
        __int16 v278 = 2112;
        v279 = v113;
        __int16 v280 = 2048;
        v281 = v114;
        __int16 v282 = 2048;
        uint64_t v283 = v116;
        __int16 v284 = 2048;
        uint64_t v285 = v118;
        _os_log_impl(&dword_1BDB2A000, v106, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d] %d %d %d %d %d %@ %@ %@ %f %f 0x%16.16llx%16.16llx 0x%16.16llx%16.16llx %@ (%p, %p, %lu)", buf, 0xAEu);

        if (v200) {
        id v12 = v197;
        }
        id v11 = v198;
        unint64_t v27 = v243;
        if (v111) {
      }
        }
      uint64_t v30 = v229;
      int v120 = v249;
      v121 = v236;
      if (!v247)
      {
        int v125 = v240;
LABEL_109:
        char v126 = v252;
        if (v125) {
          char v126 = 0;
        }
        if (v126)
        {
LABEL_112:
          int v127 = 1;
          goto LABEL_242;
        }
        goto LABEL_237;
      }
      int v122 = v240;
      if (v239)
      {
        int v123 = v219;
        goto LABEL_103;
      }
      int v128 = v226;
      if (v94 >= v43) {
        int v128 = 1;
      }
      int v123 = v219;
      if (v128 == 1)
      {
        if (a4 && ([v32 isSafariTopHit] & 1) != 0) {
          goto LABEL_125;
        }
        int v129 = [(PRSRankingItem *)v236 topHitReason];
        v130 = @"Demoted for low quality/minTopHitScore.";
      }
      else
      {
        if (v234 & 1) != 0 || a4 && ([v32 isSafariTopHit]) {
          goto LABEL_125;
        }
        int v129 = [(PRSRankingItem *)v236 topHitReason];
        v130 = @"Demoted for not RecentForAboveThresholdTopHit.";
      }
      if (v129 != 17) {
        int v122 = SSSetTopHitWithReasonString(0, v32, v130, 1);
      }
LABEL_125:
      if ([v32 isSafariTopHit] && objc_msgSend(v32, "topHit")) {
        [v32 setPreferTopPlatter:1];
      }
      if (!v122)
      {
        int v122 = 0;
        if (v94 >= v43) {
          char v131 = 1;
        }
        else {
          char v131 = v219;
        }
        if ((v131 & 1) == 0 && (v226 & (v204 ^ 1) & 1) == 0 && ((v234 ^ 1) & 1) == 0)
        {
          int v122 = SSSetTopHitWithReasonType(1, v32, 25, 1, 1);
          [v32 setPreferTopPlatter:1];
        }
        if (v122) {
          char v132 = 1;
        }
        else {
          char v132 = v219;
        }
        if ((v132 & 1) == 0)
        {
          int v122 = 0;
          if ((v226 ^ 1 | v204) == 1 && v46 != v28 && v49 == v28 && v52 == v28)
          {
            int v122 = SSSetTopHitWithReasonType(1, v32, 18, 1, 1);
            [v32 setPreferTopPlatter:v234];
          }
        }
LABEL_103:
        if ((v250 & 0x100) != 0 && !v122)
        {
          v124 = [(PRSRankingItem *)v236 L2FeatureVector];
          if ([v124 isAppInDock])
          {

            if ((v123 | v226))
            {
              int v122 = 0;
            }
            else
            {
              int v122 = SSSetTopHitWithReasonType(1, v32, 13, 1, 1);
              [v32 setPreferTopPlatter:v234];
            }
            int v123 = v219;
          }
          else
          {

            int v122 = 0;
          }
        }
        int v141 = v239;
        if (v122) {
          int v141 = 1;
        }
        if (!v141) {
          int v122 = 0;
        }
        if (((v141 | !v207 | v123) & 1) == 0)
        {
          double SpecialThreshold = getSpecialThreshold(@"com.apple.application.initials", v248, v244, a5, 0.1);
          if (SpecialThreshold >= v43)
          {
            int v122 = 0;
          }
          else
          {
            int v122 = SSSetTopHitWithReasonType(1, v32, 14, 1, 1);
            [v32 setPreferTopPlatter:v234];
          }
        }
        if (v122) {
          int v142 = 0;
        }
        else {
          int v142 = v123;
        }
        if (v142 == 1)
        {
          double SpecialThreshold = getSpecialThreshold(@"com.apple.application.corrections", v248, v244, a5, -2.0);
          int v143 = v249;
          if ((v250 & 0x100) != 0 && SpecialThreshold < v43)
          {
            int v122 = SSSetTopHitWithReasonType(1, v32, 1, 1, 1);
            [v32 setPreferTopPlatter:v234];
            goto LABEL_168;
          }
        }
        else
        {
LABEL_168:
          int v143 = v249;
          if (v122) {
            goto LABEL_169;
          }
        }
        int v152 = v209;
        if (((v209 != 3) & ~v143) != 0) {
          goto LABEL_329;
        }
        if (v143)
        {
          int v153 = objc_msgSend(v208, "isEqualToString:", @"com.apple.calculation", SpecialThreshold);
          int v154 = [v208 isEqualToString:@"com.apple.conversion"];
          int v143 = v249;
          int v155 = v154;
          int v152 = v209;
        }
        else
        {
          int v153 = 0;
          int v155 = 0;
        }
        if (v152 != 3 && (v153 & 1) == 0 && !v155) {
          goto LABEL_329;
        }
        if (!v236)
        {
          v121 = [PRSRankingItem alloc];
          [v32 setRankingItem:v121];
          if ((v153 | v155) == 1)
          {
            if (v153) {
              uint64_t v169 = 4096;
            }
            else {
              uint64_t v169 = 0x2000;
            }
            [(PRSRankingItem *)v121 setBundleIDType:[(PRSRankingItem *)v121 bundleIDType] | v169];
          }
        }
        int v122 = SSSetTopHitWithReasonType(1, v32, 7, 1, 1);
        int v143 = v249;
        int v152 = v209;
        if (!v122)
        {
LABEL_329:
          if (((v152 != 9) & ~v143) != 0) {
            goto LABEL_330;
          }
          if (v143)
          {
            int v170 = objc_msgSend(v208, "isEqualToString:", @"com.apple.worldclock", SpecialThreshold);
            int v143 = v249;
            int v171 = v170;
            int v152 = v209;
          }
          else
          {
            int v171 = 0;
          }
          if (v152 != 9 && !v171) {
            goto LABEL_330;
          }
          if (!v121)
          {
            v121 = [PRSRankingItem alloc];
            [v32 setRankingItem:v121];
            if (v171) {
              [(PRSRankingItem *)v121 setBundleIDType:[(PRSRankingItem *)v121 bundleIDType] | 0x40000000];
            }
          }
          int v122 = SSSetTopHitWithReasonType(1, v32, 20, 1, 1);
          int v143 = v249;
          int v152 = v209;
          if (!v122)
          {
LABEL_330:
            if (((v152 != 10) & ~v143) != 0) {
              goto LABEL_285;
            }
            if (v143)
            {
              int v172 = objc_msgSend(v208, "isEqualToString:", @"com.apple.datadetector.quick_actions", SpecialThreshold);
              int v152 = v209;
            }
            else
            {
              int v172 = 0;
            }
            if (v152 != 10 && !v172) {
              goto LABEL_285;
            }
            if (!v121)
            {
              v121 = [PRSRankingItem alloc];
              [v32 setRankingItem:v121];
              if (v172) {
                [(PRSRankingItem *)v121 setBundleIDType:[(PRSRankingItem *)v121 bundleIDType] | 0x80000000];
              }
            }
            int v122 = SSSetTopHitWithReasonType(1, v32, 21, 1, 1);
            if (!v122)
            {
LABEL_285:
              if ((v250 & 0x40000) != 0 && [(PRSRankingItem *)v121 topHitReason] == 16) {
                int v122 = SSSetTopHitWithReasonType(1, v32, 16, 1, 0);
              }
              else {
                int v122 = 0;
              }
              if (!v122 && v216 != 0)
              {
                BOOL v173 = (v250 & 0x200000) == 0;
                if (v94 >= v43) {
                  BOOL v173 = 1;
                }
                if ((v173 | v226)) {
                  int v122 = 0;
                }
                else {
                  int v122 = SSSetTopHitWithReasonType(1, v32, 11, 1, 1);
                }
              }
            }
          }
        }
      }
LABEL_169:
      int v144 = v122;
      v145 = SSDefaultsGetResources();
      int v146 = [v145 BOOLeanForKey:@"EnableRecencyTopHitCheck"];

      if (v146)
      {
        int v148 = v144;
        BOOL v149 = v214;
        uint64_t v30 = v229;
        unint64_t v27 = v243;
        if (!v144)
        {
          if (a5) {
            BOOL v150 = 0;
          }
          else {
            BOOL v150 = v25 == 0;
          }
          BOOL v151 = v222;
          if (!v150) {
            BOOL v151 = 0;
          }
          if (v151)
          {
            *(float *)&double v147 = v43;
            int v148 = 0;
            if (!+[PRSRankingItemRanker isBlendingScoreDemoted:v147]&& (v250 & 0x904) == 0)
            {
              int v148 = SSSetTopHitWithReasonType(1, v32, 6, 1, 1);
            }
          }
          else
          {
            int v148 = 0;
          }
        }
      }
      else
      {
        int v148 = v144;
        BOOL v149 = v214;
        uint64_t v30 = v229;
        unint64_t v27 = v243;
      }
      int v156 = !v149;
      if (v148) {
        int v156 = 1;
      }
      if (!v156) {
        int v148 = 0;
      }
      if ((v156 & 1) == 0 && ((v234 ^ 1) & 1) == 0)
      {
        *(float *)&double v147 = v43;
        if (+[PRSRankingItemRanker isBlendingScoreDemoted:v147])
        {
          if (!v239) {
            goto LABEL_199;
          }
          goto LABEL_212;
        }
        int v148 = SSSetTopHitWithReasonType(1, v32, 9, 1, 1);
      }
      if (!v239)
      {
        if (v148) {
          goto LABEL_216;
        }
LABEL_199:
        if ([(PRSRankingItem *)v121 topHitReason] == 15) {
          int v148 = SSSetTopHitWithReasonType(1, v32, 15, 1, 0);
        }
        else {
          int v148 = 0;
        }
        if (v148) {
          int v157 = 0;
        }
        else {
          int v157 = v249;
        }
        if (v157 == 1)
        {
          if (([(PRSRankingItem *)v121 bundleIDType] & 0x10) != 0
            && [(PRSRankingItem *)v121 hasShortCut])
          {
            int v148 = SSSetTopHitWithReasonType(1, v32, 26, 1, 1);
            goto LABEL_209;
          }
        }
        else
        {
LABEL_209:
          if (v148) {
            goto LABEL_216;
          }
        }
        if ([(PRSRankingItem *)v121 topHitReason] == 17)
        {
          int v148 = SSSetTopHitWithReasonType(1, v32, 17, 1, 0);
          if (v148) {
            goto LABEL_216;
          }
        }
        goto LABEL_212;
      }
      if (v148) {
        goto LABEL_216;
      }
LABEL_212:
      if ((v250 & 0x200000) != 0 && [(PRSRankingItem *)v121 topHitReason] == 19) {
        int v148 = SSSetTopHitWithReasonType(1, v32, 19, 1, 0);
      }
      else {
        int v148 = 0;
      }
LABEL_216:
      if ([(PRSRankingItem *)v121 isNotExecutable]) {
        int v148 = SSSetTopHitWithReasonString(0, v32, @"Demoted RankingItem.isNotExecutable", 1);
      }
      if (!v148)
      {
        int v127 = 1;
LABEL_226:
        int v120 = v249;
        goto LABEL_242;
      }
      if ((v250 & 4) != 0 && v244 == 1)
      {
        v158 = [(PRSRankingItem *)v121 firstMatchedAltName];

        if (!v158
          && (*(unsigned char *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v121) & 0x82) != 0
          && (*(void *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v121) & 0xFFFFFFFFFFFFFF7DLL) == 0)
        {
          int v127 = 1;
          int v148 = SSSetTopHitWithReasonString(0, v32, @"Demoted Contact with 1 query term and no prefix match", 1);
          if (!v148) {
            goto LABEL_226;
          }
        }
      }
      if (([(PRSRankingItem *)v121 bundleIDType] & 0x200000) == 0)
      {
        v159 = [(PRSRankingItem *)v121 L2FeatureVector];
        [v159 scoreForFeature:31];
        float v161 = v160;

        if (v161 == v28)
        {
          int v125 = SSSetTopHitWithReasonString(0, v32, @"Demoted Legacy Donated User Activity with score 1.0", 1);
          int v120 = v249;
        }
        else
        {
          int v241 = v148;
          v162 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)v121 attributes], 0);
          v163 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)v121 attributes], 0xBuLL);
          if ([v162 hasPrefix:@"com.apple.siri.interaction"]
            && [v163 isEqualToString:@"/app/intents"])
          {
            int v241 = SSSetTopHitWithReasonString(0, v32, @"Demoted User Activity donated from com.apple.siri.interaction", 1);
          }

          int v120 = v249;
          int v125 = v241;
        }
LABEL_236:
        if (!v125) {
          goto LABEL_112;
        }
        goto LABEL_237;
      }
      int v120 = v249;
LABEL_237:
      int v164 = v252;
      if (v27 == -1) {
        int v164 = 0;
      }
      if (v27 < v25) {
        int v127 = v164;
      }
      else {
        int v127 = 0;
      }
LABEL_242:
      int v165 = v221 | v120 | v127 & v247 ^ 1;
      if (v165) {
        int v166 = 4;
      }
      else {
        int v166 = 2;
      }
      if ((v127 & 1) != 0 || !v165)
      {
        v168 = v228;
      }
      else
      {
        v167 = v223;
        v168 = v228;
        if (!v223) {
          v167 = objc_opt_new();
        }
        v223 = v167;
        [v167 addObject:v32];
        int v166 = v195;
      }

      objc_super v29 = v224;
      if ((v166 | 4) != 4) {
        goto LABEL_315;
      }
LABEL_36:
      if (v30 == ++v25) {
        goto LABEL_315;
      }
    }
  }
  v223 = 0;
  objc_super v29 = v224;
  id v11 = v18;
LABEL_315:
  id v187 = v223;

LABEL_316:
  return v187;
}

- (SFMutableResultSection)bullseyeSectionForTopHit:(uint64_t)a3 initiallyHidden:(int)a4 checkForTopHit:(int)a5 boostSafari:(int)a6 thresholdCounter:(void *)a7 existingResults:(int)a8 allowMultipleTopHits:
{
  id v15 = a2;
  if (a1)
  {
    int v16 = -[SSBullseyeTopHitsManager bullseyeResultSetForTopHit:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:](a1, v15, a4, a5, a6, a7, a8);
    if (v16)
    {
      int v17 = [[SFMutableResultSection alloc] initWithPrototype:v15];
      id v18 = v17;
      if (a6)
      {
        if ((a3 & 1) == 0 && [(SFResultSection *)v17 maxInitiallyVisibleResults] != 1) {
          [(SFResultSection *)v18 setMaxInitiallyVisibleResults:1];
        }
        if ([(SFResultSection *)v18 isInitiallyHidden] != a3) {
          [(SFResultSection *)v18 setIsInitiallyHidden:a3];
        }
      }
      [(SFMutableResultSection *)v18 setResultSet:v16];
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)bullseyeSectionForTopHit:(id)a3 initiallyHidden:(BOOL)a4 checkForTopHit:(BOOL)a5 thresholdCounter:(int)a6
{
  return -[SSBullseyeTopHitsManager bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:]((uint64_t)self, a3, a4, a5, 0, a6, 0, 1);
}

- (id)bullseyeTopHitSection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(SFMutableResultSection *)self->_topHitSection relatedSectionBundleIdentifier];
  if (v3)
  {
    v4 = [(NSDictionary *)self->_categoryToResultMapping objectForKey:v3];
    if (v4)
    {
      v5 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int64_t queryID = self->_queryID;
        v7 = [v4 title];
        v10[0] = 67109378;
        v10[1] = queryID;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1BDB2A000, v5, OS_LOG_TYPE_INFO, "### [%d] top hit section title:%@", (uint8_t *)v10, 0x12u);
      }
      v8 = [(SSBullseyeTopHitsManager *)self bullseyeSectionForTopHit:v4 initiallyHidden:0 checkForTopHit:0 thresholdCounter:0];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bullseyeTopHitSections:(id)a3 maxTopHitsCount:(int)a4 minThresholdForBigResult:(double)a5 needExceptionForSafariSection:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = +[SSRankingManager getTopHitsContinuationThresholds]();
  char v132 = +[SSRankingManager getForbiddenSecondSections]();
  int v127 = +[SSRankingManager getPoorSecondSections]();
  unint64_t v10 = [v8 count];
  int v129 = v9;
  uint64_t v11 = [v9 count];
  uint64_t v152 = SSMaxSectionsBelowSuggestions();
  id v12 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(float *)buf = 1.5047e-36;
    int v186 = v11;
    __int16 v187 = 2112;
    *(void *)v188 = v129;
    _os_log_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_INFO, "### [%d] %@", buf, 0x12u);
  }

  if (!v11)
  {
    id v13 = 0;
    goto LABEL_188;
  }
  uint64_t v130 = v11;
  unint64_t v148 = v10;
  id v149 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v147 = v8;
  if (v152)
  {
    id v150 = 0;
  }
  else
  {
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v178 objects:v190 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v179;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v179 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v178 + 1) + 8 * i);
          uint64_t v20 = [v19 bundleIdentifier];
          int v21 = [v20 isEqualToString:@"com.apple.searchd.suggestions"];

          if (v21)
          {
            id v150 = v19;
            goto LABEL_17;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v178 objects:v190 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v150 = 0;
LABEL_17:
      id v8 = v147;
      unint64_t v10 = v148;
    }
    else
    {
      id v150 = 0;
    }
  }
  int v142 = 0;
  v140 = 0;
  int v136 = 0;
  uint64_t v22 = 0;
  int v157 = 0;
  int v128 = 0;
  int v126 = !v6;
  char v141 = 1;
  int v151 = a4;
  do
  {
    if (!v10 || (int)v22 >= a4) {
      goto LABEL_173;
    }
    unint64_t v23 = 0;
    char v144 = 0;
    char v158 = 0;
    do
    {
      uint64_t v24 = [v8 objectAtIndexedSubscript:v23];
      unint64_t v25 = [v24 bundleIdentifier];
      int v26 = [v24 domain];
      if (v26 == 2 && (v158 & 1) != 0) {
        goto LABEL_47;
      }
      int v153 = v26;
      v159 = v25;
      unint64_t v27 = [v24 bundleIdentifier];
      id v28 = v24;
      int v29 = [v27 isEqualToString:@"com.apple.spotlight.tophits"];

      uint64_t v160 = v22;
      if (v29)
      {
        uint64_t v30 = objc_opt_new();
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        int v155 = v28;
        uint64_t v31 = [v28 resultSet];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v174 objects:v189 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v175;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v175 != v34) {
                objc_enumerationMutation(v31);
              }
              int v36 = *(void **)(*((void *)&v174 + 1) + 8 * j);
              v37 = [v36 applicationBundleIdentifier];
              char v38 = SSScreenTimeStatusForBundleIDWithCompletionHandler(v37, 0);

              if ((v38 & 1) == 0) {
                [v30 addObject:v36];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v174 objects:v189 count:16];
          }
          while (v33);
        }

        uint64_t v39 = [v30 count];
        char v40 = v39 == 0;
        if (v39)
        {
          id v28 = v155;
          [v155 setResultSet:v30];
          char v40 = 0;
          id v8 = v147;
          a4 = v151;
          unint64_t v10 = v148;
          uint64_t v22 = v160;
        }
        else
        {
          id v8 = v147;
          a4 = v151;
          unint64_t v10 = v148;
          uint64_t v22 = v160;
          id v28 = v155;
        }
      }
      else
      {
        uint64_t v30 = [v28 bundleIdentifier];
        char v40 = SSScreenTimeStatusForBundleIDWithCompletionHandler(v30, 0);
      }

      BOOL v41 = v28 == v150 && v152 == 0;
      uint64_t v24 = v28;
      if (v41) {
        goto LABEL_46;
      }
      if (v40) {
        goto LABEL_46;
      }
      float v42 = [v28 bundleIdentifier];
      char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v42);

      if (IsSyndicatedPhotos) {
        goto LABEL_46;
      }
      v44 = [v24 bundleIdentifier];
      if ([v44 isEqualToString:@"com.apple.spotlight.tophits"])
      {
        float v45 = v24;
        float v46 = [v24 relatedSectionBundleIdentifier];
        char v47 = SSSectionIsSyndicatedPhotos(v46);

        if (v47)
        {
          uint64_t v24 = v45;
          goto LABEL_172;
        }
      }
      else
      {
        float v45 = v24;
      }
      unint64_t v25 = v159;
      if (v141 & 1) == 0 && ([v159 isEqualToString:@"com.apple.application"])
      {
        uint64_t v24 = v45;
        goto LABEL_47;
      }
      uint64_t v24 = v45;
      if ((int)v22 >= 1 && v159 && [v132 containsObject:v159])
      {
        if (![v159 isEqualToString:@"com.apple.Preferences"]) {
          goto LABEL_118;
        }
        float v48 = [v45 resultSet];
        float v49 = [v48 firstObject];

        if (!v49)
        {
          uint64_t v22 = v160;
LABEL_46:
          unint64_t v25 = v159;
          goto LABEL_47;
        }
        v50 = [v49 rankingItem];
        int v51 = [v50 topHitReason] & 0xF;

        unint64_t v25 = v159;
        if (!v51)
        {
LABEL_118:
          uint64_t v22 = v160;
          goto LABEL_47;
        }
      }
      uint64_t v52 = [v45 title];
      v53 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        int64_t queryID = self->_queryID;
        *(float *)buf = 1.5048e-36;
        int v186 = queryID;
        __int16 v187 = 1024;
        *(_DWORD *)v188 = v23;
        *(_WORD *)&v188[4] = 2112;
        *(void *)&v188[6] = v52;
        _os_log_impl(&dword_1BDB2A000, v53, OS_LOG_TYPE_INFO, "### [%d] section[%d] title:%@", buf, 0x18u);
      }

      int v143 = (void *)v52;
      BOOL v55 = v153 == 3 || v153 == 2 || v153 == 10;
      v57 = [v24 bundleIdentifier];
      char v58 = [v57 isEqualToString:@"com.apple.searchd.suggestions"];

      v144 |= v58;
      long long v172 = 0u;
      long long v173 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      int v156 = v24;
      float v59 = [v24 resultSet];
      uint64_t v60 = [v59 countByEnumeratingWithState:&v170 objects:v184 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v171;
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v171 != v62) {
              objc_enumerationMutation(v59);
            }
            float v64 = *(void **)(*((void *)&v170 + 1) + 8 * k);
            int v169 = 3233;
            *(float *)buf = (float)(uint64_t)(v23 - (v144 & 1));
            int v186 = 0;
            v65 = [v64 rankingItem];
            float v66 = v65;
            if (v65)
            {
              float v67 = [v65 L2FeatureVector];
              [v67 setScores:buf forFeatures:&v169 count:1];
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v170 objects:v184 count:16];
        }
        while (v61);
      }

      uint64_t v24 = v156;
      uint64_t v22 = v160;
      v68 = -[SSBullseyeTopHitsManager bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:]((uint64_t)self, v156, 0, !v55, (v142 & 1) == 0, v160, v149, v152 == 0);
      if (!v140) {
        v140 = objc_opt_new();
      }
      a4 = v151;
      unint64_t v10 = v148;
      if (![v68 resultsCount])
      {
        v158 |= v153 == 2;
        unint64_t v25 = v159;
        goto LABEL_171;
      }
      float v69 = [v68 resultSet];
      float v70 = [v69 firstObject];

      if (!v70)
      {
        unint64_t v25 = v159;
        goto LABEL_170;
      }
      v71 = v70;
      int v72 = [v70 isSafariTopHit];
      float v73 = [v71 rankingItem];
      float v74 = [v73 L2FeatureVector];
      [v74 originalL2Score];
      float v76 = v75;

      float v77 = [v71 sectionBundleIdentifier];
      v135 = v71;
      int v78 = [v71 preferTopPlatter];
      char v79 = v78;
      v142 |= v72;
      if (v153 == 2) {
        int v80 = v78;
      }
      else {
        int v80 = 0;
      }
      if (v153 == 2) {
        char v81 = 0;
      }
      else {
        char v81 = v78;
      }
      v133 = v68;
      char v134 = v77;
      if ((int)v160 > 0 || (v81 & 1) != 0 || v80)
      {
        uint64_t v24 = v156;
        if ((int)v160 > 0) {
          goto LABEL_104;
        }
      }
      else
      {
        char v82 = [v77 isEqualToString:@"com.apple.application"];
        uint64_t v24 = v156;
        if ((v82 & 1) == 0 && ([v132 containsObject:v134] & 1) == 0)
        {
          v83 = [v71 rankingItem];
          int v84 = [v83 topHitReason];

          if (!v84)
          {
LABEL_104:
            id v8 = v147;
            if (v152)
            {
LABEL_121:
              int v89 = 0;
            }
            else
            {
              uint64_t v85 = (uint64_t)v136;
              if (!v136) {
                uint64_t v85 = objc_opt_new();
              }
              int v136 = (void *)v85;
              long long v167 = 0u;
              long long v168 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              unint64_t v86 = [v68 resultSet];
              uint64_t v87 = [v86 countByEnumeratingWithState:&v165 objects:v183 count:16];
              if (v87)
              {
                uint64_t v88 = v87;
                int v89 = 0;
                uint64_t v90 = *(void *)v166;
                do
                {
                  for (uint64_t m = 0; m != v88; ++m)
                  {
                    if (*(void *)v166 != v90) {
                      objc_enumerationMutation(v86);
                    }
                    v92 = *(void **)(*((void *)&v165 + 1) + 8 * m);
                    objc_msgSend(v92, "setUsesCompactDisplay:", objc_msgSend(v92, "shouldUseCompactDisplay") | objc_msgSend(v92, "usesCompactDisplay"));
                    if (v157 > v151) {
                      goto LABEL_117;
                    }
                    if (([v149 containsObject:v92] & 1) == 0)
                    {
                      [v136 addObject:v92];
                      ++v157;
                      ++v89;
                      [v149 addObject:v92];
                    }
                  }
                  uint64_t v88 = [v86 countByEnumeratingWithState:&v165 objects:v183 count:16];
                }
                while (v88);
LABEL_117:
                a4 = v151;
                unint64_t v10 = v148;
              }
              else
              {
                int v89 = 0;
              }
              uint64_t v24 = v156;
LABEL_163:
            }
            LODWORD(v22) = v160;
LABEL_165:
            if (v130 <= (int)v22) {
              goto LABEL_167;
            }
            double v112 = v76;
            v113 = [v129 objectAtIndexedSubscript:(int)v22];
            [v113 doubleValue];
            double v115 = v114;

            if (v115 >= v112) {
              goto LABEL_167;
            }

LABEL_172:
            break;
          }
        }
      }
      id v8 = v147;
      if (v79)
      {
        if ([v140 count]) {
          goto LABEL_121;
        }
      }
      else
      {
        unint64_t v86 = [v135 sectionBundleIdentifier];
        if ([v127 containsObject:v86])
        {
          uint64_t v93 = [v140 count];

          if (v93) {
            goto LABEL_121;
          }
        }
        else
        {
          double v94 = [v135 rankingItem];
          if (![v94 topHitReason])
          {

            int v89 = 0;
            goto LABEL_163;
          }
          uint64_t v95 = [v140 count];

          if (v95) {
            goto LABEL_121;
          }
        }
      }
      LODWORD(v22) = v160;
      if ([v159 isEqualToString:@"com.apple.spotlight.tophits"])
      {
        double v96 = [v24 relatedSectionBundleIdentifier];
        char v97 = [v96 isEqualToString:@"com.apple.application"];

        v141 &= v97 ^ 1;
      }
      [v140 addObject:v68];
      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      uint64_t v98 = [v68 resultSet];
      uint64_t v154 = [v98 countByEnumeratingWithState:&v161 objects:v182 count:16];
      int v99 = 0;
      int v89 = 0;
      if (!v154) {
        goto LABEL_156;
      }
      char v145 = 0;
      char v137 = 0;
      char v131 = 0;
      uint64_t v146 = *(void *)v162;
      while (2)
      {
        for (uint64_t n = 0; n != v154; ++n)
        {
          if (*(void *)v162 != v146) {
            objc_enumerationMutation(v98);
          }
          uint64_t v22 = *(void *)(*((void *)&v161 + 1) + 8 * n);
          objc_msgSend((id)v22, "setUsesCompactDisplay:", objc_msgSend((id)v22, "shouldUseCompactDisplay") | objc_msgSend((id)v22, "usesCompactDisplay"));
          [v149 addObject:v22];
          int v101 = [(id)v22 sectionBundleIdentifier];
          if ([v101 isEqualToString:@"com.apple.application"])
          {
            if ((v99 & 1) == 0) {
              int v99 = 1;
            }
            int v102 = v157;
            if ((v145 & 1) == 0) {
              int v102 = v157 + 1;
            }
            int v157 = v102;
            if ((v145 & 1) == 0) {
              ++v89;
            }
            char v145 = 1;
            LODWORD(v22) = v160;
          }
          else
          {
            if (v157 > v151)
            {

              LODWORD(v22) = v160;
              goto LABEL_156;
            }
            if ([v101 isEqualToString:@"com.apple.mobiletimer"])
            {
              int v139 = v99;
              id v103 = v8;
              v104 = v98;
              v105 = [(id)v22 rankingItem];
              v106 = [v105 L2FeatureVector];
              [v106 scoreForFeature:1982];
              float v108 = v107;

              if (v108 == 0.0)
              {
                LODWORD(v22) = v160;
                v137 |= v160 == 0;
                uint64_t v98 = v104;
                id v8 = v103;
              }
              else
              {
                uint64_t v98 = v104;
                if ((v108 != 1.0 || (v137 & 1) == 0) | v131 & 1)
                {
                  LODWORD(v22) = v160;
                  id v8 = v103;
                  int v99 = v139;
                  goto LABEL_151;
                }
                [(id)v22 setUsesCompactDisplay:1];
                v109 = v136;
                id v8 = v103;
                if (!v136) {
                  v109 = objc_opt_new();
                }
                int v136 = v109;
                [v109 addObject:v22];
                [v149 addObject:v22];
                char v131 = 1;
                LODWORD(v22) = v160;
              }
              int v99 = v139;
            }
            else
            {
              LODWORD(v22) = v160;
            }
            ++v157;
            ++v89;
          }
LABEL_151:
        }
        uint64_t v154 = [v98 countByEnumeratingWithState:&v161 objects:v182 count:16];
        if (v154) {
          continue;
        }
        break;
      }
LABEL_156:

      id v110 = v133;
      int v111 = v126;
      if ((v99 & 1) == 0) {
        int v111 = 1;
      }
      int v128 = v110;
      a4 = v151;
      unint64_t v10 = v148;
      uint64_t v24 = v156;
      if ((v111 | v142)) {
        goto LABEL_165;
      }
LABEL_167:
      if (v89) {
        unint64_t v23 = 0;
      }
      uint64_t v22 = (v89 + v22);

      unint64_t v25 = v159;
      v68 = v133;
      float v70 = v135;
LABEL_170:

LABEL_171:
LABEL_47:

      ++v23;
    }
    while (v23 < v10 && (int)v22 < a4);
LABEL_173:
    int v116 = v22;
    uint64_t v22 = 1;
  }
  while (!v116);
  if ([v136 count])
  {
    if (v152)
    {
      v117 = v128;
      if (!v117)
      {
        uint64_t v118 = [SFMutableResultSection alloc];
        v119 = [v8 objectAtIndexedSubscript:0];
        v117 = [(SFMutableResultSection *)v118 initWithSection:v119];

        int v120 = [(SFMutableResultSection *)v117 resultSet];
        [v120 removeAllObjects];

        [v140 addObject:v117];
      }
      id v121 = [(SFMutableResultSection *)v117 resultSet];
      [v121 addObjectsFromArray:v136];
    }
    else
    {
      v117 = [v150 results];
      if ([(SFMutableResultSection *)v117 count])
      {
        int v122 = (void *)MEMORY[0x1E4F1CA48];
        int v123 = [(SFMutableResultSection *)v117 firstObject];
        id v121 = [v122 arrayWithObject:v123];

        [v121 addObjectsFromArray:v136];
        if ((unint64_t)[(SFMutableResultSection *)v117 count] >= 2)
        {
          v124 = -[SFMutableResultSection subarrayWithRange:](v117, "subarrayWithRange:", 1, [(SFMutableResultSection *)v117 count] - 1);
          [v121 addObjectsFromArray:v124];
        }
      }
      else
      {
        id v121 = v136;
      }
      [v150 setResults:v121];
    }
  }
  id v13 = v140;

LABEL_188:
  return v13;
}

- (void)resetVisibilityCounts
{
  self->_initiallyVisibleSectionSentuint64_t Count = 0;
  self->_initiallyHiddenSectionSentuint64_t Count = 0;
}

- (id)tagOrFilterHiddenSectionsForClient:(id)a3 isCommittedSearch:(BOOL)a4 maxVisibleSections:(int64_t)a5 maxTopHitsCount:(int)a6 minThresholdForBigResult:(double)a7 topHitSection:(id *)a8
{
  BOOL v12 = a4;
  v326[16] = *MEMORY[0x1E4F143B8];
  id v14 = (__CFString *)a3;
  v263 = self;
  BOOL v235 = v12;
  unint64_t v238 = a5;
  if (v12)
  {
    float v230 = v14;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_76;
  }
  LODWORD(v274) = a6;
  long long v288 = 0u;
  long long v289 = 0u;
  long long v286 = 0u;
  long long v287 = 0u;
  uint64_t v275 = v14;
  uint64_t v18 = [v275 countByEnumeratingWithState:&v286 objects:v326 count:16];
  uint64_t v273 = a8;
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    int v21 = 0;
    *(void *)&long long v277 = *(void *)v287;
    __int16 v276 = @"com.apple.mobilesafari";
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v287 != (void)v277) {
          objc_enumerationMutation(v275);
        }
        unint64_t v23 = *(void **)(*((void *)&v286 + 1) + 8 * i);
        uint64_t v24 = [v23 bundleIdentifier];
        if ([v24 isEqualToString:@"com.apple.application"])
        {
          int v25 = 1;
        }
        else
        {
          int v26 = [v23 relatedSectionBundleIdentifier];
          int v25 = [v26 isEqualToString:@"com.apple.application"];
        }
        v21 |= v25;
        unint64_t v27 = [v23 bundleIdentifier];
        char v28 = [v27 isEqualToString:v276];

        v20 |= v28;
        if (v21 & 1) != 0 && (v20)
        {
          uint64_t v29 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v19 = [v275 countByEnumeratingWithState:&v286 objects:v326 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    uint64_t v29 = 0;
LABEL_17:
    self = v263;
    a8 = v273;
  }
  else
  {
    uint64_t v29 = 0;
  }

  __int16 v276 = (__CFString *)objc_opt_new();
  id v30 = [(SSBullseyeTopHitsManager *)self bullseyeTopHitSections:v275 maxTopHitsCount:v274 minThresholdForBigResult:v29 needExceptionForSafariSection:a7];
  long long v282 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  uint64_t v31 = v275;
  uint64_t v16 = (SFMutableResultSection *)[v31 countByEnumeratingWithState:&v282 objects:v325 count:16];
  id v274 = v30;
  if (!v16)
  {
    BOOL v41 = 0;
    goto LABEL_38;
  }
  uint64_t v32 = 0;
  uint64_t v33 = *(void *)v283;
  while (2)
  {
    for (uint64_t j = 0; j != v16; uint64_t j = (SFMutableResultSection *)((char *)j + 1))
    {
      if (*(void *)v283 != v33) {
        objc_enumerationMutation(v31);
      }
      int v35 = *(void **)(*((void *)&v282 + 1) + 8 * (void)j);
      int v36 = [v35 bundleIdentifier];
      int v37 = [v36 isEqualToString:@"com.apple.searchd.suggestions"];

      if (v37)
      {
        char v38 = v35;

        uint64_t v32 = v38;
      }
      uint64_t v39 = [v35 bundleIdentifier];
      int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v39);

      if (IsSyndicatedPhotos)
      {
        float v42 = [v35 resultSet];
        float v43 = [v42 firstObject];

        v44 = [v43 rankingItem];
        if ([v44 photosMatch])
        {

          id v30 = v274;
        }
        else
        {
          float v45 = [v43 rankingItem];
          int v46 = [v45 photosExactMatch];

          id v30 = v274;
          if (!v46)
          {
            BOOL v41 = 0;
            goto LABEL_36;
          }
        }
        BOOL v41 = v35;
LABEL_36:
        self = v263;

        uint64_t v16 = v32;
        goto LABEL_37;
      }
    }
    uint64_t v16 = (SFMutableResultSection *)[v31 countByEnumeratingWithState:&v282 objects:v325 count:16];
    if (v16) {
      continue;
    }
    break;
  }
  BOOL v41 = 0;
  self = v263;
  uint64_t v16 = v32;
  id v30 = v274;
LABEL_37:
  a8 = v273;
LABEL_38:

  char v47 = [*a8 results];
  uint64_t v48 = [v47 count];

  if (v48)
  {
    self->_haveBullseyeTopHitSectiouint64_t n = 1;
    if (![(__CFString *)v276 count]) {
      [(__CFString *)v276 addObject:*a8];
    }
  }
  else if ([v30 count])
  {
    [(__CFString *)v276 addObjectsFromArray:v30];
    float v49 = [v30 firstObject];
    [v49 setBundleIdentifier:@"com.apple.spotlight.tophits"];
    id v50 = v49;
    *a8 = v50;
    self->_haveBullseyeTopHitSectiouint64_t n = 1;
  }
  int v226 = v41;
  if (v16) {
    [(__CFString *)v276 addObject:v16];
  }
  if (!v238)
  {

    uint64_t v60 = v31;
    uint64_t v61 = 0;
    float v230 = (__CFString *)v60;
    uint64_t v17 = v226;
    goto LABEL_215;
  }
  int v51 = (SFMutableResultSection *)*a8;
  uint64_t v52 = [(SFMutableResultSection *)v51 results];
  __int16 v270 = v51;
  if ([v52 count] != 1)
  {

    goto LABEL_55;
  }
  v53 = [(SFMutableResultSection *)v51 results];
  int v54 = [v53 firstObject];

  if (!v54)
  {
LABEL_55:
    uint64_t v275 = 0;
LABEL_56:
    char v58 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v62 = [v58 localizedStringForKey:@"DOMAIN_TOPHIT" value:&stru_1F1824018 table:@"SpotlightServices"];
    float v59 = v270;
    [(SFResultSection *)v270 setTitle:v62];

    goto LABEL_57;
  }
  BOOL v55 = v16;
  id v56 = [v54 sectionBundleIdentifier];
  uint64_t v275 = v54;
  if ([v56 isEqualToString:@"com.apple.datadetector.quick_actions"]) {
    goto LABEL_51;
  }
  v57 = [v54 sectionBundleIdentifier];
  if (![v57 isEqualToString:@"com.apple.calculation"])
  {
    id v218 = [v54 sectionBundleIdentifier];
    char v219 = [v218 isEqualToString:@"com.apple.conversion"];

    if (v219) {
      goto LABEL_52;
    }
    uint64_t v16 = v55;
    goto LABEL_56;
  }

LABEL_51:
LABEL_52:
  char v58 = [v54 sectionHeader];
  float v59 = v270;
  [(SFResultSection *)v270 setTitle:v58];
  uint64_t v16 = v55;
LABEL_57:

  v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  float v64 = [v63 localizedStringForKey:@"SUGGESTIONS" value:&stru_1F1824018 table:@"SpotlightServices"];

  v65 = [(SFMutableResultSection *)v59 results];
  uint64_t v66 = [v65 count];

  uint64_t v15 = v59;
  v227 = v16;
  uint64_t v273 = v64;
  if (v66) {
    [(SFResultSection *)v16 setSubtitle:v64];
  }
  else {
    [(SFResultSection *)v16 setTitle:v64];
  }
  long long v280 = 0u;
  long long v281 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  float v67 = v31;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v278 objects:v324 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v279;
    *(void *)&long long v277 = @"com.apple.searchd.suggestions";
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v279 != v70) {
          objc_enumerationMutation(v67);
        }
        int v72 = *(SFMutableResultSection **)(*((void *)&v278 + 1) + 8 * k);
        if (v72 != v15)
        {
          float v73 = [*(id *)(*((void *)&v278 + 1) + 8 * k) bundleIdentifier];
          if ([v73 isEqualToString:@"com.apple.spotlight.tophits"])
          {
          }
          else
          {
            float v74 = [(SFResultSection *)v72 bundleIdentifier];
            char v75 = [v74 isEqualToString:(void)v277];

            uint64_t v15 = v270;
            if ((v75 & 1) == 0)
            {
              if (!v263->_haveBullseyeTopHitSection) {
                goto LABEL_72;
              }
              float v76 = [(SFMutableResultSection *)v72 resultSet];
              float v77 = [(SFMutableResultSection *)v270 resultSet];
              int v78 = [v76 intersectsOrderedSet:v77];

              uint64_t v15 = v270;
              if (v78)
              {
                char v79 = [(SFMutableResultSection *)v270 resultSet];
                id v80 = [(SFMutableResultSection *)v72 copySectionRemovingResults:v79];

                [(__CFString *)v276 addObject:v80];
                uint64_t v15 = v270;
              }
              else
              {
LABEL_72:
                [(__CFString *)v276 addObject:v72];
              }
            }
          }
        }
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v278 objects:v324 count:16];
    }
    while (v69);
  }

  char v81 = v276;
  float v230 = v81;

  self = v263;
  uint64_t v17 = v226;
  uint64_t v16 = v227;
LABEL_76:
  int v82 = [(SPSearchQueryContext *)self->_queryContext queryKind];
  unint64_t v83 = [(SPSearchQueryContext *)self->_queryContext whyQuery];
  int v84 = PRSLogCategoryDefault();
  v227 = v16;
  __int16 v270 = v15;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    int64_t queryID = self->_queryID;
    unint64_t v86 = [(SPSearchQueryContext *)self->_queryContext searchString];
    SSRedactString(v86, 0);
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    int v290 = 67109890;
    *(_DWORD *)v291 = queryID;
    uint64_t v16 = v227;
    *(_WORD *)&v291[4] = 1024;
    *(_DWORD *)&v291[6] = v82;
    *(_WORD *)v292 = 2112;
    *(void *)&v292[2] = v87;
    *(_WORD *)&v292[10] = 2048;
    *(void *)&v292[12] = v83;
    _os_log_impl(&dword_1BDB2A000, v84, OS_LOG_TYPE_INFO, "### [%d] sections %d %@ %lu", (uint8_t *)&v290, 0x22u);

    uint64_t v15 = v270;
    self = v263;
  }

  id v243 = (id)objc_opt_new();
  uint64_t v88 = v230;
  uint64_t v237 = [(__CFString *)v230 count];
  int v89 = [(SFMutableResultSection *)self->_topHitSection relatedSectionBundleIdentifier];
  id v223 = v89;
  if (v89)
  {
    v228 = [(NSDictionary *)self->_categoryToResultMapping objectForKeyedSubscript:v89];
  }
  else
  {
    v228 = 0;
  }
  unint64_t v90 = v238;
  uint64_t ImportantBits = PRSRankingQueryImportantBits(1);
  uint64_t v247 = v92;
  uint64_t v248 = ImportantBits;
  BOOL v222 = &v220;
  uint64_t v93 = v237;
  uint64_t v229 = (char *)&v220 - ((8 * v237 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v221 = 8 * v237;
  bzero(v229, 8 * v237);
  if (v93 < 1) {
    goto LABEL_208;
  }
  uint64_t v239 = 0;
  uint64_t v95 = 0;
  int v241 = 0;
  int v233 = 0;
  uint64_t v96 = 0;
  v246 = @"com.apple.mobilesafari";
  v224 = @"com.apple.parsec.related_search";
  *(void *)&long long v94 = 138412546;
  long long v220 = v94;
  *(void *)&long long v94 = 67109890;
  long long v225 = v94;
  *(void *)&long long v94 = 67113218;
  long long v236 = v94;
  *(void *)&long long v94 = 67114242;
  long long v245 = v94;
  int v226 = v17;
  do
  {
    uint64_t v252 = v96;
    -[__CFString objectAtIndexedSubscript:](v88, "objectAtIndexedSubscript:", v95, v220);
    char v97 = (SFMutableResultSection *)objc_claimAutoreleasedReturnValue();
    uint64_t v98 = v97;
    if (v90 && !v235)
    {
      if (v97 == v15 || v97 == v16)
      {
        int v99 = v97;
        objc_msgSend(v243, "addObject:");
        uint64_t v98 = v99;
        ++v90;
        goto LABEL_195;
      }
LABEL_92:
      int v100 = 0;
      goto LABEL_98;
    }
    if (!v95)
    {
      if (v97 == self->_topHitSection)
      {
        unint64_t v101 = v90;
        int v102 = v228;
        id v103 = v97;
        v104 = v228;

        if (!v102)
        {
          v202 = PRSLogCategoryDefault();
          uint64_t v95 = 0;
          if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
          {
            topHitSectiouint64_t n = self->_topHitSection;
            int v290 = v220;
            *(void *)v291 = v223;
            *(_WORD *)&v291[8] = 2112;
            *(void *)v292 = topHitSection;
            _os_log_impl(&dword_1BDB2A000, v202, OS_LOG_TYPE_DEFAULT, "### missing results section %@ for %@", (uint8_t *)&v290, 0x16u);
          }

          uint64_t v98 = 0;
          unint64_t v90 = v101;
          uint64_t v88 = v230;
          goto LABEL_195;
        }
        int v100 = 1;
        uint64_t v98 = v104;
        unint64_t v90 = v101;
        uint64_t v88 = v230;
        uint64_t v95 = 0;
      }
      else
      {
        int v100 = 1;
      }
LABEL_98:
      if (v17) {
        BOOL v105 = v17 == v98;
      }
      else {
        BOOL v105 = 0;
      }
      int v106 = v105;
      if (v106 & v241)
      {
        int v241 = 1;
        uint64_t v98 = v17;
        goto LABEL_195;
      }
      int v231 = v100;
      unint64_t v244 = v98;
      uint64_t v262 = v95;
      unint64_t v238 = v90;
      float v107 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v108 = self->_queryID;
        v109 = v244;
        int v110 = [(SFResultSection *)v244 maxInitiallyVisibleResults];
        int v111 = [(SFResultSection *)v109 title];
        int v290 = v225;
        *(_DWORD *)v291 = v108;
        uint64_t v15 = v270;
        *(_WORD *)&v291[4] = 1024;
        *(_DWORD *)&v291[6] = v262;
        *(_WORD *)v292 = 1024;
        *(_DWORD *)&v292[2] = v110;
        *(_WORD *)&v292[6] = 2112;
        *(void *)&v292[8] = v111;
        _os_log_impl(&dword_1BDB2A000, v107, OS_LOG_TYPE_DEFAULT, "### [%d] section[%d] maxInitiallyVisibleResults[%d] %@", (uint8_t *)&v290, 0x1Eu);
      }
      double v112 = [SFMutableResultSection alloc];
      v113 = v244;
      double v114 = [(SFMutableResultSection *)v112 initWithPrototype:v244];
      double v115 = objc_opt_new();
      [(SFMutableResultSection *)v114 setResultSet:v115];
      id v269 = [(SFMutableResultSection *)v113 resultSet];
      uint64_t v116 = [v269 count];
      unint64_t v232 = [(SFResultSection *)v113 maxInitiallyVisibleResults];
      uint64_t v268 = v116;
      v253 = v115;
      unsigned int v234 = v114;
      if (v116 < 1)
      {
        unint64_t v171 = [v115 count];
        if ((v231 & 1) == 0) {
          [(SFResultSection *)v234 isInitiallyHidden];
        }
        uint64_t v172 = 1;
        goto LABEL_167;
      }
      uint64_t v117 = 0;
      unint64_t v118 = 0;
      while (1)
      {
        v119 = [v269 objectAtIndex:v117];
        *(void *)&long long v277 = [v119 score];
        id v121 = v120;
        [v119 l2score];
        float v123 = v122;
        v124 = [v119 rankingItem];
        int v125 = [v124 L2FeatureVector];
        [v125 originalL2Score];
        float v127 = v126;

        LODWORD(v274) = [v124 eligibleForDemotion];
        int v128 = [v124 shouldHideUnderShowMore];
        LODWORD(v273) = [v124 recentForTopHit];
        int v272 = [v124 recentForAboveThresholdTopHit];
        if (([v124 bundleIDType] & 0x100) != 0)
        {
          int v129 = v115;
          uint64_t v130 = self;
          [v124 L2FeatureVector];
          v132 = int v131 = v128;
          [v132 scoreForFeature:1];
          float v134 = v133;

          v135 = [v124 L2FeatureVector];
          [v135 scoreForFeature:41];
          float v137 = v136;

          if (v131)
          {
            self = v130;
            unint64_t v138 = [(PRSRankingItemRanker *)v130->_ranker queryTermLength];
            unint64_t v139 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen];
            BOOL v141 = v134 != 1.0 || v138 <= v139;
            if (v137 != 0.0) {
              BOOL v141 = 1;
            }
            LODWORD(v276) = v141;
          }
          else
          {
            LODWORD(v276) = 0;
            self = v130;
          }
          double v115 = v129;
        }
        else
        {
          LODWORD(v276) = v128;
        }
        int v271 = [v119 topHit];
        int v142 = [v119 title];
        int v143 = [v142 text];

        uint64_t v144 = v277 | (unint64_t)v121;
        uint64_t v275 = PRSLogCategoryDefault();
        BOOL v145 = os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT);
        if (v144)
        {
          if (v145)
          {
            uint64_t v257 = (unint64_t)v121 & v247;
            uint64_t v146 = v277 & v248;
            int v256 = self->_queryID;
            id v266 = [v119 sectionBundleIdentifier];
            id v265 = [v119 applicationBundleIdentifier];
            id v147 = [v119 identifier];
            unint64_t v148 = [v119 sectionBundleIdentifier];
            SSRedactSuggestionIdentifier(v147, v148);
            id v264 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v259 = [v119 sectionBundleIdentifier];
            id v260 = v148;
            unint64_t v267 = v118;
            id v261 = v147;
            uint64_t v258 = v146;
            if (v259
              && ([v119 sectionBundleIdentifier],
                  id v251 = (id)objc_claimAutoreleasedReturnValue(),
                  ([v251 isEqualToString:v246] & 1) != 0))
            {
              int v255 = 0;
              v254 = @"(private)";
            }
            else
            {
              int v255 = 1;
              SSRedactString(v143, 1);
              int v249 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v254 = v249;
            }
            int v155 = [v119 rankingItem];
            int v156 = [v119 rankingItem];
            uint64_t v157 = [v156 attributes];
            char v158 = [v119 rankingItem];
            uint64_t Count = SSCompactRankingAttrsGetCount([v158 attributes]);
            int v290 = v245;
            *(_DWORD *)v291 = v256;
            *(_WORD *)&v291[4] = 1024;
            *(_DWORD *)&v291[6] = v262;
            *(_WORD *)v292 = 1024;
            *(_DWORD *)&v292[2] = v117;
            *(_WORD *)&v292[6] = 1024;
            *(_DWORD *)&v292[8] = v271;
            *(_WORD *)&v292[12] = 1024;
            *(_DWORD *)&v292[14] = v276;
            *(_WORD *)&v292[18] = 1024;
            int v293 = (int)v274;
            __int16 v294 = 1024;
            int v295 = (int)v273;
            __int16 v296 = 1024;
            int v297 = v272;
            __int16 v298 = 2112;
            id v299 = v266;
            __int16 v300 = 2112;
            id v301 = v265;
            __int16 v302 = 2112;
            id v303 = v264;
            __int16 v304 = 2048;
            double v305 = v127;
            __int16 v306 = 2048;
            double v307 = v123;
            __int16 v308 = 2048;
            v309 = v121;
            __int16 v310 = 2048;
            v311 = (void *)v277;
            __int16 v312 = 2048;
            uint64_t v313 = v257;
            __int16 v314 = 2048;
            uint64_t v315 = v258;
            __int16 v316 = 2112;
            v317 = v254;
            __int16 v318 = 2048;
            v319 = v155;
            __int16 v320 = 2048;
            uint64_t v321 = v157;
            __int16 v322 = 2048;
            uint64_t v323 = Count;
            uint64_t v154 = v275;
            _os_log_impl(&dword_1BDB2A000, v275, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d,%d] %d %d %d %d %d %@ %@ %@ %f %f 0x%16.16llx%16.16llx 0x%16.16llx%16.16llx %@ (%p, %p, %lu)", (uint8_t *)&v290, 0xB4u);

            if (v255) {
            double v115 = v253;
            }
            unint64_t v118 = v267;
            id v160 = v261;
            long long v161 = (void *)v259;
            if (v259) {

            }
            id v162 = v264;
            id v163 = v266;
LABEL_146:

            self = v263;
            int v153 = (int)v276;
            goto LABEL_147;
          }
        }
        else if (v145)
        {
          int v149 = self->_queryID;
          *(void *)&long long v277 = [v119 sectionBundleIdentifier];
          id v266 = [v119 applicationBundleIdentifier];
          id v150 = [v119 identifier];
          int v151 = [v119 sectionBundleIdentifier];
          SSRedactSuggestionIdentifier(v150, v151);
          id v265 = (id)objc_claimAutoreleasedReturnValue();
          id v260 = [v119 sectionBundleIdentifier];
          id v261 = v151;
          unint64_t v267 = v118;
          uint64_t v250 = v143;
          id v264 = v150;
          if (v260
            && ([v119 sectionBundleIdentifier],
                id v242 = (id)objc_claimAutoreleasedReturnValue(),
                ([v242 isEqualToString:v246] & 1) != 0))
          {
            LODWORD(v259) = 0;
            uint64_t v152 = @"(private)";
          }
          else
          {
            LODWORD(v259) = 1;
            SSRedactString(v143, 1);
            uint64_t v152 = (__CFString *)objc_claimAutoreleasedReturnValue();
            int v240 = v152;
          }
          long long v164 = [v119 rankingItem];
          long long v165 = [v119 rankingItem];
          uint64_t v166 = [v165 attributes];
          long long v167 = [v119 rankingItem];
          uint64_t v168 = SSCompactRankingAttrsGetCount([v167 attributes]);
          int v290 = v236;
          *(_DWORD *)v291 = v149;
          *(_WORD *)&v291[4] = 1024;
          *(_DWORD *)&v291[6] = v262;
          *(_WORD *)v292 = 1024;
          *(_DWORD *)&v292[2] = v117;
          *(_WORD *)&v292[6] = 1024;
          *(_DWORD *)&v292[8] = v271;
          *(_WORD *)&v292[12] = 1024;
          *(_DWORD *)&v292[14] = v276;
          *(_WORD *)&v292[18] = 1024;
          int v293 = (int)v274;
          __int16 v294 = 1024;
          int v295 = (int)v273;
          __int16 v296 = 1024;
          int v297 = v272;
          __int16 v298 = 2112;
          id v299 = (id)v277;
          __int16 v300 = 2112;
          id v301 = v266;
          __int16 v302 = 2112;
          id v303 = v265;
          __int16 v304 = 2048;
          double v305 = v127;
          __int16 v306 = 2048;
          double v307 = v123;
          __int16 v308 = 2112;
          v309 = v152;
          __int16 v310 = 2048;
          v311 = v164;
          __int16 v312 = 2048;
          uint64_t v313 = v166;
          __int16 v314 = 2048;
          uint64_t v315 = v168;
          uint64_t v154 = v275;
          _os_log_impl(&dword_1BDB2A000, v275, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d,%d] %d %d %d %d %d %@ %@ %@ %f %f %@ (%p, %p, %lu)", (uint8_t *)&v290, 0x8Cu);

          if (v259) {
          double v115 = v253;
          }
          unint64_t v118 = v267;
          int v143 = v250;
          id v169 = v264;
          id v170 = v260;
          if (v260) {

          }
          id v162 = v265;
          id v163 = (id)v277;
          goto LABEL_146;
        }
        int v153 = (int)v276;
        uint64_t v154 = v275;
LABEL_147:

        [v115 addObject:v119];
        v118 += v153 ^ 1u;

        if (v268 == ++v117)
        {
          unint64_t v171 = [v115 count];
          if (v231)
          {
            uint64_t v17 = v226;
            uint64_t v16 = v227;
            if (!v118)
            {
              uint64_t v172 = 1;
              goto LABEL_166;
            }
LABEL_156:
            unint64_t v174 = v118;
            initiallyVisibleSectionSentuint64_t Count = self->_initiallyVisibleSectionSentCount;
            uint64_t v176 = [v243 count];
            if (initiallyVisibleSectionSentCount + v239 + v176 >= v238)
            {
              long long v177 = [(SFResultSection *)v234 bundleIdentifier];
              uint64_t v172 = [v177 isEqualToString:v224] ^ 1;
            }
            else
            {
              uint64_t v172 = 0;
            }
            goto LABEL_160;
          }
          BOOL v173 = [(SFResultSection *)v234 isInitiallyHidden];
          uint64_t v17 = v226;
          uint64_t v16 = v227;
          if (!v173 && v118) {
            goto LABEL_156;
          }
          uint64_t v172 = 1;
          unint64_t v174 = v118;
          if (v118)
          {
LABEL_160:
            long long v178 = [(SFResultSection *)v234 bundleIdentifier];
            int v179 = SSSectionIsSyndicatedPhotos(v178);

            unint64_t v180 = v232;
            if (v174 >= v232) {
              unint64_t v181 = v232;
            }
            else {
              unint64_t v181 = v174;
            }
            if (!v179) {
              unint64_t v180 = v181;
            }
            uint64_t v15 = v270;
LABEL_168:
            if (v180 >= v171) {
              unint64_t v182 = 0;
            }
            else {
              unint64_t v182 = v180;
            }
            uint64_t v183 = [v243 count];
            uint64_t v184 = v252;
            if (v17) {
              BOOL v185 = v183 - v252 + self->_initiallyVisibleSectionSentCount == v238 - 1;
            }
            else {
              BOOL v185 = 0;
            }
            int v186 = !v185;
            if ((v186 | v233 | v241))
            {
LABEL_190:
              if (v172)
              {
                uint64_t v198 = v184 + 1;
                id v199 = v234;
                objc_storeStrong((id *)&v229[8 * v184], v234);
                uint64_t v252 = v198;
              }
              else
              {
                id v199 = v234;
              }
              BOOL v200 = v17 == v244;
              [(SFResultSection *)v199 setIsInitiallyHidden:v172];
              [(SFResultSection *)v199 setMaxInitiallyVisibleResults:v182];
              [v243 addObject:v199];
              v233 |= v200;
              uint64_t v95 = v262;
            }
            else
            {
              __int16 v187 = [[SFMutableResultSection alloc] initWithPrototype:v17];
              v188 = objc_opt_new();
              [(SFMutableResultSection *)v187 setResultSet:v188];
              v189 = [(SFMutableResultSection *)v17 resultSet];
              uint64_t v190 = [v189 count];
              if (v190 >= 1)
              {
                uint64_t v191 = v190;
                for (uint64_t m = 0; m != v191; ++m)
                {
                  v193 = [v189 objectAtIndex:m];
                  [v188 addObject:v193];
                }
              }
              [(SFResultSection *)v187 setIsInitiallyHidden:[(SFResultSection *)v17 isInitiallyHidden]];
              [v243 addObject:v187];
              if (v17 == v244) {
                char v194 = 1;
              }
              else {
                char v194 = v172;
              }
              uint64_t v16 = v227;
              double v115 = v253;
              if ((v194 & 1) == 0)
              {
                int64_t v195 = v263->_initiallyVisibleSectionSentCount;
                uint64_t v196 = [v243 count];
                if (v195 + v239 + v196 >= v238)
                {
                  id v197 = [(SFResultSection *)v234 bundleIdentifier];
                  uint64_t v172 = [v197 isEqualToString:v224] ^ 1;
                }
                else
                {
                  uint64_t v172 = 0;
                }
              }

              int v241 = 1;
              if (v17 != v244)
              {
                self = v263;
                uint64_t v15 = v270;
                uint64_t v184 = v252;
                goto LABEL_190;
              }
              int v233 = 0;
              uint64_t v95 = v262;
              self = v263;
              uint64_t v15 = v270;
              id v199 = v234;
            }

            unint64_t v90 = v238;
            uint64_t v88 = v230;
            uint64_t v98 = v244;
            goto LABEL_195;
          }
LABEL_166:
          uint64_t v15 = v270;
LABEL_167:
          unint64_t v180 = v232;
          goto LABEL_168;
        }
      }
    }
    if (v97 == v228)
    {
      uint64_t v98 = v228;
      goto LABEL_195;
    }
    if (!v235 || v97 != self->_topHitSection) {
      goto LABEL_92;
    }
LABEL_195:

    ++v95;
    uint64_t v96 = v252;
    uint64_t v239 = -v252;
  }
  while (v95 != v237);
  if (!v252)
  {
LABEL_208:
    uint64_t v252 = 0;
    goto LABEL_209;
  }
  if ((unint64_t)(self->_initiallyHiddenSectionSentCount + v252) <= 1)
  {
    uint64_t v204 = 0;
    *(void *)&long long v201 = 134218498;
    long long v277 = v201;
    do
    {
      v205 = *(void **)&v229[8 * v204];
      [v205 setIsInitiallyHidden:0];
      v206 = SSGeneralLog();
      if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v207 = [v205 bundleIdentifier];
        int v290 = v277;
        *(void *)v291 = v204;
        *(_WORD *)&v291[8] = 2112;
        *(void *)v292 = v207;
        *(_WORD *)&v292[8] = 1024;
        *(_DWORD *)&v292[10] = 2;
        _os_log_impl(&dword_1BDB2A000, v206, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Unhiding section (%lu) %@ due to minimum hiding quota (%d)", (uint8_t *)&v290, 0x1Cu);
      }
      ++v204;
    }
    while (v252 != v204);
    uint64_t v252 = 0;
    self = v263;
    uint64_t v16 = v227;
  }
LABEL_209:
  unint64_t v208 = [v243 count];
  unint64_t v209 = v208;
  if (!self->_initiallyVisibleSectionSentCount
    && !self->_initiallyHiddenSectionSentCount
    && (!v16 && v252 == v208 || v16 && v252 == v208 - 1))
  {
    unint64_t v214 = 2;
    if (v16) {
      unint64_t v214 = 3;
    }
    unint64_t v215 = v208 >= v214 ? v214 : v208;
    if (v215)
    {
      for (uint64_t n = 0; v215 != n; ++n)
      {
        int v217 = [v243 objectAtIndexedSubscript:n];
        if ([v217 isInitiallyHidden])
        {
          [v217 setIsInitiallyHidden:0];
          --v252;
        }
        else if (!v16 || n)
        {

          break;
        }
      }
    }
  }
  int64_t v210 = self->_initiallyHiddenSectionSentCount + v252;
  self->_initiallyVisibleSectionSentCount += v209 - v252;
  self->_initiallyHiddenSectionSentuint64_t Count = v210;
  uint64_t v60 = +[SSBullseyeTopHitsManager dedupeWebURLSuggestionsFromSections:v243];
  uint64_t v211 = v221;
  if (v237)
  {
    v212 = v229 - 8;
    do
    {

      v211 -= 8;
    }
    while (v211);
  }

  uint64_t v61 = v270;
LABEL_215:

  return v60;
}

+ (id)dedupeWebURLSuggestionsFromSections:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    BOOL v55 = objc_opt_new();
    v4 = [v3 firstObject];
    v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.spotlight.tophits"];

    if (v6)
    {
      id v49 = v3;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v7 = v4;
      id v8 = [v4 results];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v61 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            id v14 = [v13 url];
            uint64_t v15 = v14;
            if (v14)
            {
              id v16 = v14;
            }
            else
            {
              uint64_t v17 = [v13 punchout];
              uint64_t v18 = [v17 urls];
              id v16 = [v18 firstObject];
            }
            uint64_t v19 = [v13 contentURL];
            char v20 = v19;
            if (v19)
            {
              id v21 = v19;
            }
            else
            {
              id v21 = [v16 absoluteString];
            }
            uint64_t v22 = v21;

            unint64_t v23 = strippedURL(v22);
            if (v23) {
              [v55 addObject:v23];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v10);
      }

      id v3 = v49;
      v4 = v7;
    }
    uint64_t v24 = [v3 objectAtIndex:1];
    if ([v55 count])
    {
      int v25 = [v24 bundleIdentifier];
      int v26 = [v25 isEqualToString:@"com.apple.searchd.suggestions"];

      if (v26)
      {
        uint64_t v48 = v4;
        id v50 = v3;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        int v51 = v24;
        unint64_t v27 = [v24 results];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v57;
          uint64_t v52 = *(void *)v57;
          v53 = v27;
          do
          {
            uint64_t v31 = 0;
            uint64_t v54 = v29;
            do
            {
              if (*(void *)v57 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void **)(*((void *)&v56 + 1) + 8 * v31);
              uint64_t v33 = [v32 compactCard];
              uint64_t v34 = v33;
              if (v33)
              {
                id v35 = v33;
              }
              else
              {
                id v35 = [v32 inlineCard];
              }
              int v36 = v35;

              int v37 = [v36 cardSections];
              char v38 = [v37 firstObject];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v39 = v38;
                char v40 = [v39 suggestionText];
                BOOL v41 = [v40 text];
                float v42 = v41;
                if (v41)
                {
                  id v43 = v41;
                }
                else
                {
                  v44 = [v40 formattedTextPieces];
                  float v45 = [v44 firstObject];
                  id v43 = [v45 text];

                  unint64_t v27 = v53;
                  uint64_t v30 = v52;
                }

                if ([v55 containsObject:v43]
                  && [v39 suggestionType] == 4)
                {
                  [v51 removeResults:v32];
                }

                uint64_t v29 = v54;
              }

              ++v31;
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
          }
          while (v29);
        }

        uint64_t v24 = v51;
        if ([v51 resultsCount])
        {
          id v3 = v50;
        }
        else
        {
          int v46 = (void *)[v50 mutableCopy];
          [v46 removeObject:v51];

          id v3 = v46;
        }
        v4 = v48;
      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_topHitSection, 0);
  objc_storeStrong((id *)&self->_categoryToResultMapping, 0);
}

@end