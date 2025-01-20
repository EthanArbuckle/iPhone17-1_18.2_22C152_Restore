@interface MOBiomeDonationUtility
+ (int)mapOnboardingFlowCompletion:(unint64_t)a3;
- (MOBiomeDonationUtility)init;
- (NSSet)audioMechanismsSet;
- (NSSet)callLikeMechanismsSet;
- (NSSet)textLikeMechanismsSet;
- (NSSet)videoMechanismsSet;
- (float)distanceToHomeInMilesThresholdFar;
- (float)distanceToHomeInMilesThresholdMedium;
- (float)distanceToHomeInMilesThresholdNearHome;
- (float)kHighBundleQualityScoreThreshold;
- (float)kLowBundleQualityScoreThreshold;
- (float)longCallDurationInSecondsThreshold;
- (float)shortCallDurationInSecondsThreshold;
- (id)convertAction:(id)a3;
- (id)convertClusterMetadata:(id)a3;
- (id)convertEvent:(id)a3;
- (id)convertEventBundle:(id)a3;
- (id)convertMetadataForRankgDictionary:(id)a3;
- (id)convertOutlierMetadata:(id)a3;
- (id)convertPerson:(id)a3;
- (id)convertPlace:(id)a3;
- (id)convertResource:(id)a3;
- (int)mapBurstyInteractionCount:(unint64_t)a3;
- (int)mapCallDurationType:(double)a3;
- (int)mapDistanceToHomeInMiles:(double)a3;
- (int)mapGEOPOICategory:(id)a3;
- (int)mapLabelConfidenceScore:(float)a3;
- (int)mapMediaGenre:(id)a3;
- (int)mapMediaType:(id)a3;
- (int)mapPersonRelationshipTag:(unint64_t)a3;
- (int)mapPhotoMomentInference:(id)a3;
- (int)mapSourceBundleID:(id)a3;
- (int)mapTimeCorrelationScore:(float)a3;
- (int)mapTimeTagType:(unint64_t)a3;
- (int)mapVisitPlaceType:(unint64_t)a3;
- (unint64_t)highBurstyInteractionCountThreshold;
- (unint64_t)lowBurstyInteractionCountThreshold;
- (void)convertMediaEvent:(id)a3 toMediaType:(int *)a4 mediaGenre:(int *)a5 mediaSourceAppType:(int *)a6 numAudioMediaPlaySessionsPerDay:(unint64_t *)a7 numVideoMediaPlaySessionsPerDay:(unint64_t *)a8 numFirstPartyMediaPlaySessionsPerDay:(unint64_t *)a9 numThirdPartyMediaPlaySessionsPerDay:(unint64_t *)a10 durationAudioMediaPlaySessionsPerDay:(double *)a11 durationVideoMediaPlaySessionsPerDay:(double *)a12;
- (void)convertSignificantContactEvent:(id)a3 toContactIDsInConversation:(id)a4 callLikeMechanismIncluded:(BOOL *)a5 textLikeMechanismIncluded:(BOOL *)a6 numAudioLikeInteractions:(unint64_t *)a7 numVideoLikeInteractions:(unint64_t *)a8 numTextLikeInteractions:(unint64_t *)a9 totalDurationOfCallLikeInteractions:(double *)a10 maxDurationOfCallLikeInteractions:(double *)a11 minDurationOfCallLikeInteractions:(double *)a12;
@end

@implementation MOBiomeDonationUtility

- (MOBiomeDonationUtility)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOBiomeDonationUtility;
  v2 = [(MOBiomeDonationUtility *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSSet setWithArray:&off_1002F8F30];
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    uint64_t v5 = +[NSSet setWithArray:&off_1002F8F48];
    v6 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v5;

    uint64_t v7 = +[NSSet setWithArray:&off_1002F8F60];
    v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v7;

    uint64_t v9 = +[NSSet setWithArray:&off_1002F8F78];
    v10 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v9;

    *(_OWORD *)(v2 + 8) = xmmword_1002BB130;
    *(_OWORD *)(v2 + 72) = xmmword_1002BB140;
    *((void *)v2 + 3) = 0x4248000041200000;
    *((_DWORD *)v2 + 8) = 1133903872;
  }
  return (MOBiomeDonationUtility *)v2;
}

- (id)convertEventBundle:(id)a3
{
  id v4 = a3;
  id v211 = [v4 source];
  id v209 = [v4 source];
  id v206 = [v4 source];
  id v204 = [v4 source];
  id v202 = [v4 source];
  id v200 = [v4 source];
  id v198 = [v4 source];
  v227 = objc_opt_new();
  uint64_t v5 = [v4 events];
  id v6 = [v5 count];

  id v219 = v4;
  if (v6)
  {
    long long v259 = 0u;
    long long v258 = 0u;
    long long v257 = 0u;
    long long v256 = 0u;
    uint64_t v7 = [v4 events];
    id v8 = [v7 countByEnumeratingWithState:&v256 objects:v267 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v257;
      int v11 = 2;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v257 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v256 + 1) + 8 * i);
          v14 = [v13 eventIdentifier];
          v15 = [v14 UUIDString];
          [v227 addObject:v15];

          if ([v13 provider] == (id)5) {
            int v11 = 1;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v256 objects:v267 count:16];
      }
      while (v9);
    }
    else
    {
      int v11 = 2;
    }

    id v4 = v219;
  }
  else
  {
    int v11 = 2;
  }
  v16 = [v4 action];
  v218 = [(MOBiomeDonationUtility *)self convertAction:v16];

  v226 = objc_opt_new();
  v17 = [v4 backgroundActions];
  id v18 = [v17 count];

  if (v18)
  {
    long long v255 = 0u;
    long long v254 = 0u;
    long long v253 = 0u;
    long long v252 = 0u;
    v19 = [v4 backgroundActions];
    id v20 = [v19 countByEnumeratingWithState:&v252 objects:v266 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v253;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v253 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [(MOBiomeDonationUtility *)self convertAction:*(void *)(*((void *)&v252 + 1) + 8 * (void)j)];
          [v226 addObject:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v252 objects:v266 count:16];
      }
      while (v21);
    }
  }
  v25 = [v4 metaDataForRank];

  if (!v25)
  {
    unsigned int v190 = 0;
    unsigned int v191 = 0;
    goto LABEL_38;
  }
  v26 = [v4 metaDataForRank];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"LabelConfidence"];
  if (!v27)
  {
    unsigned int v191 = 0;
    goto LABEL_30;
  }
  v28 = (void *)v27;
  v29 = [v4 metaDataForRank];
  v30 = [v29 objectForKeyedSubscript:@"LabelConfidence"];
  objc_opt_class();
  v31 = v4;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v26 = [v31 metaDataForRank];
    v33 = [v26 objectForKeyedSubscript:@"LabelConfidence"];
    [v33 floatValue];
    unsigned int v191 = -[MOBiomeDonationUtility mapLabelConfidenceScore:](self, "mapLabelConfidenceScore:");

    id v4 = v31;
LABEL_30:

    goto LABEL_32;
  }
  unsigned int v191 = 0;
  id v4 = v31;
LABEL_32:
  v34 = [v4 metaDataForRank];
  uint64_t v35 = [v34 objectForKeyedSubscript:@"TimeCorrelationScore"];
  if (!v35)
  {
    unsigned int v190 = 0;
    goto LABEL_36;
  }
  v36 = (void *)v35;
  v37 = [v4 metaDataForRank];
  v38 = [v37 objectForKeyedSubscript:@"TimeCorrelationScore"];
  objc_opt_class();
  v39 = v4;
  char v40 = objc_opt_isKindOfClass();

  if (v40)
  {
    v34 = [v39 metaDataForRank];
    v41 = [v34 objectForKeyedSubscript:@"TimeCorrelationScore"];
    [v41 floatValue];
    unsigned int v190 = -[MOBiomeDonationUtility mapTimeCorrelationScore:](self, "mapTimeCorrelationScore:");

    id v4 = v39;
LABEL_36:

    goto LABEL_38;
  }
  unsigned int v190 = 0;
  id v4 = v39;
LABEL_38:
  if ([v4 interfaceType] == (id)4)
  {
    uint64_t v42 = [v4 place];
    if (v42)
    {
      v43 = (void *)v42;
      v44 = [v4 place];
      int v45 = [v44 placeUserType] == (id)1;
    }
    else
    {
      int v45 = 0;
    }
    v46 = [v4 metaDataForRank];

    if (v46)
    {
      v47 = [v4 metaDataForRank];
      v48 = [v47 objectForKeyedSubscript:@"callDuration"];
      [v48 doubleValue];
      double v50 = v49;

      HIDWORD(v188) = [(MOBiomeDonationUtility *)self mapCallDurationType:v50];
      v51 = [v4 metaDataForRank];
      v52 = [v51 objectForKeyedSubscript:@"burstyInteractionCount"];

      if (v52)
      {
        v53 = [v4 metaDataForRank];
        v54 = [v53 objectForKeyedSubscript:@"burstyInteractionCount"];
        LODWORD(v188) = -[MOBiomeDonationUtility mapBurstyInteractionCount:](self, "mapBurstyInteractionCount:", (int)[v54 intValue]);
      }
      else
      {
        LODWORD(v188) = 0;
      }
      v55 = [v4 metaDataForRank];
      v56 = [v55 objectForKeyedSubscript:@"contactLocationWork"];
      unsigned int v57 = [v56 BOOLValue];

      if (v57) {
        int v45 = 2;
      }
      v58 = [v4 metaDataForRank];
      v59 = [v58 objectForKeyedSubscript:@"SigConType"];
      unsigned int v187 = [v59 intValue];
    }
    else
    {
      unsigned int v187 = 0;
      uint64_t v188 = 0;
    }
  }
  else
  {
    unsigned int v187 = 0;
    uint64_t v188 = 0;
    int v45 = 0;
  }
  uint64_t v60 = [v4 place];
  int v189 = v45;
  if (!v60
    || (v61 = (void *)v60,
        [v4 place],
        v62 = objc_claimAutoreleasedReturnValue(),
        [v62 distanceToHomeInMiles],
        double v64 = v63,
        v62,
        v61,
        v64 == 0.0))
  {
    unsigned int v185 = 0;
    unsigned int v186 = 0;
  }
  else
  {
    v65 = [v4 place];
    [v65 distanceToHomeInMiles];
    double v67 = v66;

    if (v67 > 0.0) {
      int v68 = 1;
    }
    else {
      int v68 = 2;
    }
    unsigned int v186 = v68;
    unsigned int v185 = [(MOBiomeDonationUtility *)self mapDistanceToHomeInMiles:v67];
  }
  v223 = objc_opt_new();
  v69 = [v4 subBundleIDs];
  id v70 = [v69 count];

  if (v70)
  {
    long long v251 = 0u;
    long long v250 = 0u;
    long long v249 = 0u;
    long long v248 = 0u;
    v71 = [v4 subBundleIDs];
    id v72 = [v71 countByEnumeratingWithState:&v248 objects:v265 count:16];
    if (v72)
    {
      id v73 = v72;
      uint64_t v74 = *(void *)v249;
      do
      {
        for (k = 0; k != v73; k = (char *)k + 1)
        {
          if (*(void *)v249 != v74) {
            objc_enumerationMutation(v71);
          }
          v76 = *(void **)(*((void *)&v248 + 1) + 8 * (void)k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v223 addObject:v76];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v77 = [v76 UUIDString];
              [v223 addObject:v77];
            }
          }
        }
        id v73 = [v71 countByEnumeratingWithState:&v248 objects:v265 count:16];
      }
      while (v73);
    }

    id v4 = v219;
  }
  v222 = objc_opt_new();
  v78 = [v4 subSuggestionIDs];
  id v79 = [v78 count];

  if (v79)
  {
    long long v247 = 0u;
    long long v246 = 0u;
    long long v245 = 0u;
    long long v244 = 0u;
    v80 = [v4 subSuggestionIDs];
    id v81 = [v80 countByEnumeratingWithState:&v244 objects:v264 count:16];
    if (v81)
    {
      id v82 = v81;
      uint64_t v83 = *(void *)v245;
      do
      {
        for (m = 0; m != v82; m = (char *)m + 1)
        {
          if (*(void *)v245 != v83) {
            objc_enumerationMutation(v80);
          }
          v85 = *(void **)(*((void *)&v244 + 1) + 8 * (void)m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v222 addObject:v85];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v86 = [v85 UUIDString];
              [v222 addObject:v86];
            }
          }
        }
        id v82 = [v80 countByEnumeratingWithState:&v244 objects:v264 count:16];
      }
      while (v82);
    }

    id v4 = v219;
  }
  v225 = objc_opt_new();
  v87 = [v4 resources];
  id v88 = [v87 count];

  if (v88)
  {
    long long v243 = 0u;
    long long v242 = 0u;
    long long v241 = 0u;
    long long v240 = 0u;
    v89 = [v4 resources];
    id v90 = [v89 countByEnumeratingWithState:&v240 objects:v263 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v241;
      do
      {
        for (n = 0; n != v91; n = (char *)n + 1)
        {
          if (*(void *)v241 != v92) {
            objc_enumerationMutation(v89);
          }
          v94 = [(MOBiomeDonationUtility *)self convertResource:*(void *)(*((void *)&v240 + 1) + 8 * (void)n)];
          [v225 addObject:v94];
        }
        id v91 = [v89 countByEnumeratingWithState:&v240 objects:v263 count:16];
      }
      while (v91);
    }
  }
  v224 = objc_opt_new();
  v95 = [v4 persons];
  id v96 = [v95 count];

  if (v96)
  {
    long long v239 = 0u;
    long long v238 = 0u;
    long long v237 = 0u;
    long long v236 = 0u;
    v97 = [v4 persons];
    id v98 = [v97 countByEnumeratingWithState:&v236 objects:v262 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v237;
      do
      {
        for (ii = 0; ii != v99; ii = (char *)ii + 1)
        {
          if (*(void *)v237 != v100) {
            objc_enumerationMutation(v97);
          }
          v102 = [(MOBiomeDonationUtility *)self convertPerson:*(void *)(*((void *)&v236 + 1) + 8 * (void)ii)];
          [v224 addObject:v102];
        }
        id v99 = [v97 countByEnumeratingWithState:&v236 objects:v262 count:16];
      }
      while (v99);
    }
  }
  v103 = [v4 place];
  v217 = [(MOBiomeDonationUtility *)self convertPlace:v103];

  v104 = objc_opt_new();
  v105 = [v4 places];
  id v106 = [v105 count];

  if (v106)
  {
    long long v235 = 0u;
    long long v234 = 0u;
    long long v233 = 0u;
    long long v232 = 0u;
    v107 = [v4 places];
    id v108 = [v107 countByEnumeratingWithState:&v232 objects:v261 count:16];
    if (v108)
    {
      id v109 = v108;
      uint64_t v110 = *(void *)v233;
      do
      {
        for (jj = 0; jj != v109; jj = (char *)jj + 1)
        {
          if (*(void *)v233 != v110) {
            objc_enumerationMutation(v107);
          }
          v112 = [(MOBiomeDonationUtility *)self convertPlace:*(void *)(*((void *)&v232 + 1) + 8 * (void)jj)];
          [v104 addObject:v112];
        }
        id v109 = [v107 countByEnumeratingWithState:&v232 objects:v261 count:16];
      }
      while (v109);
    }

    id v4 = v219;
  }
  v221 = objc_opt_new();
  v113 = [v4 photoTraits];
  id v114 = [v113 count];

  if (v114)
  {
    long long v231 = 0u;
    long long v230 = 0u;
    long long v229 = 0u;
    long long v228 = 0u;
    v115 = [v4 photoTraits];
    id v116 = [v115 countByEnumeratingWithState:&v228 objects:v260 count:16];
    if (v116)
    {
      id v117 = v116;
      uint64_t v118 = *(void *)v229;
      do
      {
        for (kk = 0; kk != v117; kk = (char *)kk + 1)
        {
          if (*(void *)v229 != v118) {
            objc_enumerationMutation(v115);
          }
          v120 = *(void **)(*((void *)&v228 + 1) + 8 * (void)kk);
          v121 = [v120 name];
          id v122 = [v121 length];

          if (v122)
          {
            v123 = [v120 name];
            [v221 addObject:v123];
          }
        }
        id v117 = [v115 countByEnumeratingWithState:&v228 objects:v260 count:16];
      }
      while (v117);
    }

    id v4 = v219;
  }
  v124 = [v4 clusterMetadata];
  v216 = [(MOBiomeDonationUtility *)self convertClusterMetadata:v124];

  v125 = [v4 outlierMetadata];
  v220 = [(MOBiomeDonationUtility *)self convertOutlierMetadata:v125];

  v126 = [v4 rankingDictionary];

  if (v126)
  {
    v127 = [v4 rankingDictionary];
    v128 = [v127 objectForKeyedSubscript:@"bundleGoodnessScore"];

    if (v128)
    {
      v129 = [v4 rankingDictionary];
      v215 = [v129 objectForKeyedSubscript:@"bundleGoodnessScore"];
    }
    else
    {
      v215 = 0;
    }
    v130 = [v4 rankingDictionary];
    v131 = [v130 objectForKeyedSubscript:@"distinctnessScore"];

    if (v131)
    {
      v132 = [v4 rankingDictionary];
      uint64_t v133 = [v132 objectForKeyedSubscript:@"distinctnessScore"];
    }
    else
    {
      uint64_t v133 = 0;
    }
    v134 = [v4 rankingDictionary];
    v135 = [v134 objectForKeyedSubscript:@"richnessScore"];

    if (v135)
    {
      v136 = [v4 rankingDictionary];
      uint64_t v137 = [v136 objectForKeyedSubscript:@"richnessScore"];
    }
    else
    {
      uint64_t v137 = 0;
    }
    v138 = [v4 rankingDictionary];
    v139 = [v138 objectForKeyedSubscript:@"engagementScore"];

    if (v139)
    {
      v140 = [v4 rankingDictionary];
      uint64_t v141 = [v140 objectForKeyedSubscript:@"engagementScore"];
    }
    else
    {
      uint64_t v141 = 0;
    }
    v142 = [v4 rankingDictionary];
    v143 = [v142 objectForKeyedSubscript:@"heuristicsScore"];

    v214 = (void *)v133;
    v208 = (void *)v141;
    v197 = (void *)v137;
    if (v143)
    {
      v144 = [v4 rankingDictionary];
      v213 = [v144 objectForKeyedSubscript:@"heuristicsScore"];

      goto LABEL_139;
    }
  }
  else
  {
    v215 = 0;
    v214 = 0;
    v197 = 0;
    v208 = 0;
  }
  v213 = 0;
LABEL_139:
  BOOL v145 = v198 == (id)1;
  BOOL v146 = v200 == (id)7;
  BOOL v171 = v202 == (id)16;
  BOOL v193 = v204 == (id)8;
  BOOL v195 = v206 == (id)4;
  BOOL v147 = v209 == (id)2;
  uint64_t v148 = v211 == (id)1;
  v149 = [v4 metaDataForRank];
  v212 = [(MOBiomeDonationUtility *)self convertMetadataForRankgDictionary:v149];

  id v183 = objc_alloc((Class)BMMomentsEventDataEventBundle);
  v184 = [v4 bundleIdentifier];
  v210 = [v184 UUIDString];
  v207 = [v4 startDate];
  v205 = [v4 endDate];
  v203 = [v4 creationDate];
  v201 = [v4 expirationDate];
  id v180 = [v4 interfaceType];
  v199 = +[NSNumber numberWithBool:v148];
  v177 = +[NSNumber numberWithBool:v147];
  v196 = +[NSNumber numberWithBool:v195];
  v176 = +[NSNumber numberWithBool:v193];
  v175 = [v4 promptLanguage];
  v182 = [v4 place];
  unsigned int v174 = [v182 placeType];
  v181 = [v4 place];
  unsigned int v173 = [v181 placeUserType];
  v179 = [v4 time];
  unsigned int v170 = [v179 timeTag];
  v178 = [v4 suggestionID];
  v194 = [v178 UUIDString];
  unsigned int v168 = [v4 photoSource];
  v167 = +[NSNumber numberWithBool:v171];
  v166 = +[NSNumber numberWithBool:v146];
  v165 = +[NSNumber numberWithBool:v145];
  v172 = [v4 persons];
  v164 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v172 count]);
  v169 = [v4 place];
  LODWORD(v148) = [v169 placeType];
  v162 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 filtered]);
  [v4 bundleSuperType];
  [v4 bundleSubType];
  v163 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isAggregatedAndSuppressed]);
  [v4 summarizationGranularity];
  v161 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 includedInSummaryBundleOnly]);
  [v4 firstCreationDate];
  HIDWORD(v159) = v11;
  HIDWORD(v158) = v148;
  v160 = HIDWORD(v157) = v191;
  LODWORD(v159) = 0;
  LODWORD(v157) = 0;
  LODWORD(v156) = 0;
  LODWORD(v155) = 0;
  LODWORD(v154) = 0;
  LODWORD(v153) = 0;
  LODWORD(v152) = v170;
  LODWORD(v151) = 0;
  LODWORD(v158) = 0;
  id v192 = objc_msgSend(v183, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
           v210,
           v207,
           v205,
           v203,
           v201,
           v180,
           v199,
           v177,
           v196,
           v176,
           v175,
           0,
           0,
           __PAIR64__(v173, v174),
           v151,
           v227,
           v218,
           v226,
           0,
           v152,
           0,
           0,
           0,
           0,
           0,
           0,
           v153,
           0,
           0,
           v154,
           0,
           0,
           0,
           0,
           v155,
           0,
           0,
           0,
           0,
           0,
           0,
           v156,
           0,
           0,
           v194,
           v168,
           v167,
           v166,
           v165,
           &__kCFBooleanFalse,
           &__kCFBooleanFalse,
           &__NSArray0__struct,
           v164,
           v157,
           __PAIR64__(HIDWORD(v188), v190),
           __PAIR64__(v187, v188),
           __PAIR64__(v185, v189),
           v186,
           v158,
           v159,
           v162);

  return v192;
}

- (id)convertEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 routineEvent];

  if (v5)
  {
    id v6 = [v4 routineEvent];
    id v7 = [v6 placeUserType];

    if (v7)
    {
      id v8 = [v4 routineEvent];
      unsigned int v62 = [v8 placeUserType];
    }
    else
    {
      unsigned int v62 = 0;
    }
    id v9 = [v4 routineEvent];
    id v10 = [v9 placeType];

    if (v10)
    {
      int v11 = [v4 routineEvent];
      LODWORD(v61) = -[MOBiomeDonationUtility mapVisitPlaceType:](self, "mapVisitPlaceType:", [v11 placeType]);
    }
    else
    {
      LODWORD(v61) = 0;
    }
    objc_super v12 = [v4 routineEvent];
    v13 = [v12 poiCategory];

    if (v13)
    {
      v14 = [v4 routineEvent];
      v15 = [v14 poiCategory];
      HIDWORD(v61) = [(MOBiomeDonationUtility *)self mapGEOPOICategory:v15];
    }
    else
    {
      HIDWORD(v61) = 0;
    }
    v16 = [v4 routineEvent];
    id v17 = [v16 placeDiscovery];

    if (v17)
    {
      id v18 = [v4 routineEvent];
      unsigned int v60 = [v18 placeDiscovery];
    }
    else
    {
      unsigned int v60 = 0;
    }
    v19 = [v4 routineEvent];
    id v20 = [v19 mode];

    if (v20)
    {
      id v21 = [v4 routineEvent];
      unsigned int v59 = [v21 mode];
    }
    else
    {
      unsigned int v59 = 0;
    }
    uint64_t v22 = [v4 routineEvent];
    id v23 = [v22 placeSource];

    if (v23)
    {
      v24 = [v4 routineEvent];
      unsigned int v58 = [v24 placeSource];
    }
    else
    {
      unsigned int v58 = 0;
    }
  }
  else
  {
    unsigned int v60 = 0;
    uint64_t v61 = 0;
    unsigned int v58 = 0;
    unsigned int v59 = 0;
    unsigned int v62 = 0;
  }
  uint64_t v25 = [v4 workoutEvent];
  if (!v25) {
    goto LABEL_24;
  }
  v26 = (void *)v25;
  uint64_t v27 = [v4 workoutEvent];
  v28 = [v27 workoutType];

  if (v28)
  {
    v29 = [v4 workoutEvent];
    unsigned int v57 = [v29 workoutType];
  }
  else
  {
LABEL_24:
    LODWORD(v57) = 0;
  }
  v119[0] = 0;
  int v118 = 0;
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  uint64_t v114 = 0;
  uint64_t v115 = 0;
  double v112 = 0.0;
  double v113 = 0.0;
  v30 = [v4 mediaEvent];
  [(MOBiomeDonationUtility *)self convertMediaEvent:v30 toMediaType:(char *)v119 + 4 mediaGenre:v119 mediaSourceAppType:&v118 numAudioMediaPlaySessionsPerDay:&v117 numVideoMediaPlaySessionsPerDay:&v116 numFirstPartyMediaPlaySessionsPerDay:&v115 numThirdPartyMediaPlaySessionsPerDay:&v114 durationAudioMediaPlaySessionsPerDay:&v113 durationVideoMediaPlaySessionsPerDay:&v112];

  uint64_t v31 = objc_opt_new();
  __int16 v111 = 0;
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  double v107 = 0.0;
  uint64_t v108 = 0;
  double v105 = 1.79769313e308;
  double v106 = 0.0;
  v32 = [v4 significantContactEvent];
  v104 = (void *)v31;
  [(MOBiomeDonationUtility *)self convertSignificantContactEvent:v32 toContactIDsInConversation:v31 callLikeMechanismIncluded:(char *)&v111 + 1 textLikeMechanismIncluded:&v111 numAudioLikeInteractions:&v110 numVideoLikeInteractions:&v109 numTextLikeInteractions:&v108 totalDurationOfCallLikeInteractions:&v107 maxDurationOfCallLikeInteractions:&v106 minDurationOfCallLikeInteractions:&v105];

  id v33 = objc_alloc((Class)BMMomentsEventDataEvent);
  v34 = [v4 eventIdentifier];
  v103 = [v34 UUIDString];
  v102 = [v4 startDate];
  v101 = [v4 endDate];
  uint64_t v100 = [v4 creationDate];
  id v99 = [v4 sourceCreationDate];
  id v98 = [v4 expirationDate];
  unsigned int v35 = [v4 provider];
  unsigned int v36 = [v4 category];
  v97 = [v4 appBundle];
  unsigned int v37 = v119[0];
  unsigned int v75 = HIDWORD(v119[0]);
  v38 = [v4 mediaEvent];
  id v96 = [v38 mediaRepetitions];
  v39 = [v4 mediaEvent];
  v95 = [v39 mediaSumTimePlayed];
  int v73 = v118;
  char v40 = [v4 mediaEvent];
  v94 = [v40 mediaPlayerBundleId];
  uint64_t v80 = v117;
  if (v117)
  {
    id v90 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  else
  {
    id v90 = 0;
  }
  double v41 = v113;
  if (v113 <= 0.0)
  {
    v86 = 0;
  }
  else
  {
    v86 = +[NSNumber numberWithDouble:v113];
  }
  uint64_t v78 = v116;
  if (v116)
  {
    v89 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  else
  {
    v89 = 0;
  }
  double v42 = v112;
  if (v112 <= 0.0)
  {
    v85 = 0;
  }
  else
  {
    v85 = +[NSNumber numberWithDouble:v112];
  }
  uint64_t v74 = v115;
  if (v115)
  {
    id v88 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  else
  {
    id v88 = 0;
  }
  v84 = v34;
  uint64_t v83 = v38;
  id v82 = v39;
  id v81 = v40;
  unsigned int v77 = v36;
  unsigned int v76 = v37;
  uint64_t v72 = v114;
  if (v114)
  {
    v87 = +[NSNumber numberWithUnsignedInteger:v114];
  }
  else
  {
    v87 = 0;
  }
  v71 = [v4 significantContactEvent];
  id v70 = [v71 interactionContacts];
  v65 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v70 count]);
  v69 = [v4 significantContactEvent];
  int v68 = [v69 interactionScoredContact];
  double v67 = [v68 contact];
  v93 = [v67 identifier];
  double v66 = [v4 significantContactEvent];
  uint64_t v92 = [v66 interactionContactScore];
  id v91 = +[NSNumber numberWithBool:v111];
  double v63 = +[NSNumber numberWithBool:HIBYTE(v111)];
  v43 = +[NSNumber numberWithUnsignedInteger:v108];
  double v64 = +[NSNumber numberWithUnsignedInteger:v110];
  v44 = +[NSNumber numberWithUnsignedInteger:v109];
  int v45 = +[NSNumber numberWithDouble:v107];
  v46 = +[NSNumber numberWithDouble:v105];
  v47 = +[NSNumber numberWithDouble:v106];
  v48 = [v4 peopleDiscoveryEvent];
  double v49 = [v48 pCount];
  LODWORD(v52) = v73;
  LODWORD(v51) = v57;
  LODWORD(v56) = 0;
  LODWORD(v55) = 0;
  LODWORD(v54) = 0;
  LODWORD(v53) = 0;
  id v79 = objc_msgSend(v33, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", v103, v102, v101, v100, v99, v98,
          __PAIR64__(v77, v35),
          __PAIR64__(HIDWORD(v61), v62),
          __PAIR64__(v59, v60),
          v51,
          v97,
          __PAIR64__(v75, v76),
          v96,
          v95,
          v52,
          v94,
          v90,
          v86,
          v89,
          v85,
          v88,
          v87,
          v65,
          v104,
          v93,
          v92,
          v91,
          v63,
          v43,
          v64,
          v44,
          v45,
          v46,
          v47,
          v53,
          &__NSArray0__struct,
          &__NSArray0__struct,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          v54,
          0,
          0,
          v55,
          0,
          0,
          0,
          0,
          0,
          v49,
          __PAIR64__(v61, v58),
          v56);

  if (v72) {
  if (v74)
  }

  if (v42 > 0.0) {
  if (v78)
  }

  if (v41 > 0.0) {
  if (v80)
  }

  return v79;
}

- (id)convertResource:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)BMMomentsEventDataEventBundleResource);
    id v5 = [v3 type];
    id v6 = [v3 photoAssetMediaType];
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 photoFaceCount]);
    id v8 = [v3 photoCurationScore];
    [v3 photoOverallAestheticScore];
    int v10 = v9;

    LODWORD(v11) = v10;
    objc_super v12 = +[NSNumber numberWithFloat:v11];
    id v13 = [v4 initWithType:v5 photoAssetMediaType:v6 photoFaceCount:v7 photoCurationScore:v8 photoOverallAestheticScore:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)convertPerson:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v4 personRelationships];
    id v7 = [v6 count];

    if (v7)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v22 = v4;
      id obj = [v4 personRelationships];
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v25;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(obj);
            }
            objc_super v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v13 = -[MOBiomeDonationUtility mapPersonRelationshipTag:](self, "mapPersonRelationshipTag:", [v12 relationship]);
            id v14 = objc_alloc((Class)BMMomentsEventDataEventBundlePersonPersonRelationship);
            [v12 score];
            v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            id v16 = [v14 initWithPersonRelationshipTag:v13 score:v15];

            [v5 addObject:v16];
          }
          id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v9);
      }

      id v4 = v22;
    }
    id v17 = objc_alloc((Class)BMMomentsEventDataEventBundlePerson);
    id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isMePerson]);
    [v4 significanceScore];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v20 = [v17 initWithPersonRelationships:v5 isMEPerson:v18 significanceScore:v19];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)convertAction:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)BMMomentsEventDataAction);
    id v5 = [v3 actionType];
    id v6 = [v3 actionName];
    [v3 actionNameConfidence];
    double v8 = v7;

    id v9 = +[NSNumber numberWithDouble:v8];
    id v10 = [v4 initWithType:v5 actionName:v6 actionNameConfidence:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)convertPlace:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 poiCategory];

    if (v6)
    {
      double v7 = [v5 poiCategory];
      uint64_t v8 = [(MOBiomeDonationUtility *)self mapGEOPOICategory:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v10 = objc_alloc((Class)BMMomentsEventDataEventBundlePlace);
    id v11 = [v5 placeType];
    id v12 = [v5 placeUserType];
    [v5 placeNameConfidence];
    uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 familiarityIndexLOI];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 distanceToHomeInMiles];
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v9 = [v10 initWithPlaceInferencePlaceType:v11 placeInferenceUserSpecificPlaceType:v12 geoPOICategoryType:v8 placeNameConfidence:v13 familiarityIndexLOI:v14 distanceToHomeInMiles:v15];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)convertClusterMetadata:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 phenotype], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [v4 phenotype];
    uint64_t v53 = [v6 objectForKeyedSubscript:@"topLevelActivityType"];

    uint64_t v51 = [v6 objectForKeyedSubscript:@"secondLevelActivityType"];

    double v7 = [v6 objectForKeyedSubscript:@"isWeekend"];

    uint64_t v8 = [v6 objectForKeyedSubscript:@"timeTag"];

    id v9 = [v6 objectForKeyedSubscript:@"dayOfWeek"];

    id v10 = [v6 objectForKeyedSubscript:@"placeName"];

    id v11 = [v6 objectForKeyedSubscript:@"combinedPlaceType"];

    id v12 = [v6 objectForKeyedSubscript:@"enclosingAreaName"];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"persons"];

    id v14 = [v6 objectForKeyedSubscript:@"withFamily"];
    if (v14)
    {
      BOOL v33 = 1;
    }
    else
    {
      id v16 = [v6 objectForKeyedSubscript:@"withCoworker"];
      if (v16)
      {
        BOOL v33 = 1;
      }
      else
      {
        id v17 = [v6 objectForKeyedSubscript:@"withFriend"];
        if (v17)
        {
          BOOL v33 = 1;
        }
        else
        {
          id v18 = [v6 objectForKeyedSubscript:@"withChild"];
          if (v18)
          {
            BOOL v33 = 1;
          }
          else
          {
            v19 = [v6 objectForKeyedSubscript:@"withMyPet"];
            BOOL v33 = v19 != 0;

            id v18 = 0;
          }

          id v17 = 0;
        }

        id v16 = 0;
      }
    }
    BOOL v49 = v10 != 0;
    BOOL v20 = v7 != 0;
    BOOL v21 = v51 != 0;

    id v22 = [v6 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
    BOOL v46 = v22 != 0;

    id v23 = [v6 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
    BOOL v45 = v23 != 0;

    long long v24 = [v6 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
    BOOL v44 = v24 != 0;

    long long v25 = [v6 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
    BOOL v43 = v25 != 0;

    long long v26 = [v6 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
    BOOL v41 = v26 != 0;

    id v42 = objc_alloc((Class)BMMomentsEventDataEventBundleClusterMetadata);
    uint64_t v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isFiltered]);
    uint64_t v54 = +[NSNumber numberWithBool:v53 != 0];
    v38 = +[NSNumber numberWithBool:v21];
    char v40 = +[NSNumber numberWithBool:v20];
    v39 = +[NSNumber numberWithBool:v8 != 0];
    unsigned int v37 = +[NSNumber numberWithBool:v9 != 0];
    double v50 = +[NSNumber numberWithBool:v49];
    v48 = +[NSNumber numberWithBool:v11 != 0];
    unsigned int v36 = +[NSNumber numberWithBool:v12 != 0];
    unsigned int v35 = +[NSNumber numberWithBool:v13 != 0];
    v34 = +[NSNumber numberWithBool:v33];
    long long v27 = +[NSNumber numberWithBool:v46];
    v28 = +[NSNumber numberWithBool:v45];
    +[NSNumber numberWithBool:v44];
    v29 = v47 = v4;
    v30 = +[NSNumber numberWithBool:v43];
    uint64_t v31 = +[NSNumber numberWithBool:v41];
    id v15 = objc_msgSend(v42, "initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:", v52, v54, v38, v40, v39, v37, v50, v48, v36, v35, v34, v27,
            v28,
            v29,
            v30,
            v31,
            0);

    id v4 = v47;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)convertOutlierMetadata:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)BMMomentsEventDataEventBundleOutlierMetadata);
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSignificant]);
    [v3 outlierScore];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    double v7 = [v3 updatedDate];

    id v8 = [v4 initWithIsSignificant:v5 outlierScore:v6 updatedDate:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)convertMetadataForRankgDictionary:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PoiCategory"];
    if (!v5) {
      goto LABEL_4;
    }
    id v6 = (void *)v5;
    double v7 = [v4 objectForKeyedSubscript:@"PoiCategory"];
    id v8 = +[NSNull null];
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v53 = [v4 objectForKeyedSubscript:@"PoiCategory"];
    }
    else
    {
LABEL_4:
      uint64_t v53 = 0;
    }
    id v11 = [v4 objectForKeyedSubscript:@"StateOfMindDomains"];

    id v12 = &__NSArray0__struct;
    if (v11)
    {
      id v12 = [v4 objectForKeyedSubscript:@"StateOfMindDomains"];
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:@"StateOfMindLabels"];

    if (v13)
    {
      uint64_t v14 = [v4 objectForKeyedSubscript:@"StateOfMindLabels"];

      id v12 = (void *)v14;
    }
    id v15 = [v4 objectForKeyedSubscript:@"StateOfMindReflectiveInterval"];

    if (v15)
    {
      uint64_t v16 = [v4 objectForKeyedSubscript:@"StateOfMindReflectiveInterval"];

      id v12 = (void *)v16;
    }
    id v17 = [v4 objectForKeyedSubscript:@"StateOfMindValenceClassification"];

    if (v17)
    {
      uint64_t v18 = [v4 objectForKeyedSubscript:@"StateOfMindValenceClassification"];

      id v12 = (void *)v18;
    }
    v19 = [v4 objectForKeyedSubscript:@"StateOfMindValence"];

    if (v19)
    {
      uint64_t v20 = [v4 objectForKeyedSubscript:@"StateOfMindValence"];

      uint64_t v52 = (void *)v20;
    }
    else
    {
      uint64_t v52 = v12;
    }
    id v34 = objc_alloc((Class)BMMomentsEventDataEventBundleMetadataForRank);
    double v50 = [v4 objectForKeyedSubscript:@"dailyAggregateCallDuration"];
    uint64_t v51 = [v4 objectForKeyedSubscript:@"callDuration"];
    BOOL v49 = [v4 objectForKeyedSubscript:@"burstyInteractionCount"];
    v47 = [v4 objectForKeyedSubscript:@"burstyOutgoingInteractionCount"];
    BOOL v46 = [v4 objectForKeyedSubscript:@"multipleInteractionTypes"];
    BOOL v44 = [v4 objectForKeyedSubscript:@"contactLocationWork"];
    v48 = [v4 objectForKeyedSubscript:@"isFamilyContact"];
    BOOL v45 = [v4 objectForKeyedSubscript:@"isCoworkerContact"];
    BOOL v43 = [v4 objectForKeyedSubscript:@"isRepetitiveContact"];
    char v40 = [v4 objectForKeyedSubscript:@"isGroupConversation"];
    id v42 = [v4 objectForKeyedSubscript:@"PeopleCountWeightedSum"];
    BOOL v33 = [v4 objectForKeyedSubscript:@"PeopleCountWeightedAverage"];
    BOOL v41 = [v4 objectForKeyedSubscript:@"PeopleCountMax"];
    v39 = [v4 objectForKeyedSubscript:@"PeopleDensityWeightedSum"];
    v38 = [v4 objectForKeyedSubscript:@"PeopleDensityWeightedAverage"];
    unsigned int v37 = [v4 objectForKeyedSubscript:@"PeopleDensityMax"];
    v32 = [v4 objectForKeyedSubscript:@"PeopleDensityWeightedConfidenceSum"];
    unsigned int v36 = [v4 objectForKeyedSubscript:@"PeopleDensityWeightedConfidenceAverage"];
    uint64_t v31 = [v4 objectForKeyedSubscript:@"MediaTotalPlayTime"];
    unsigned int v35 = [v4 objectForKeyedSubscript:@"MediaLength"];
    v30 = [v4 objectForKeyedSubscript:@"MediaActionIsRepeat"];
    v29 = [v4 objectForKeyedSubscript:@"TimeAtHomeDuration"];
    v28 = [v4 objectForKeyedSubscript:@"PhotosAtHomeCurationScore"];
    BOOL v21 = [v4 objectForKeyedSubscript:@"WorkoutDuration"];
    long long v27 = [v4 objectForKeyedSubscript:@"MotionActivityWalkSpan"];
    id v22 = [v4 objectForKeyedSubscript:@"VisitDuration"];
    id v23 = [v4 objectForKeyedSubscript:@"FamiliarityIndex"];
    long long v24 = [v4 objectForKeyedSubscript:@"StateOfMindLoggedIn3pApp"];
    long long v25 = [v4 objectForKeyedSubscript:@"StateOfMindLoggedInJournalApp"];
    id v10 = objc_msgSend(v34, "initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:", v50, v51, v49, v47, v46, v44, v48, v45, v43, v40,
            v42,
            v33,
            v41,
            v39,
            v38,
            v37,
            v32,
            v36,
            v31,
            v35,
            v30,
            v29,
            v28,
            v21,
            v27,
            v22,
            v53,
            v23,
            v52,
            &__NSArray0__struct,
            &__NSArray0__struct,
            &__NSArray0__struct,
            &__NSArray0__struct,
            v24,
            v25);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)convertMediaEvent:(id)a3 toMediaType:(int *)a4 mediaGenre:(int *)a5 mediaSourceAppType:(int *)a6 numAudioMediaPlaySessionsPerDay:(unint64_t *)a7 numVideoMediaPlaySessionsPerDay:(unint64_t *)a8 numFirstPartyMediaPlaySessionsPerDay:(unint64_t *)a9 numThirdPartyMediaPlaySessionsPerDay:(unint64_t *)a10 durationAudioMediaPlaySessionsPerDay:(double *)a11 durationVideoMediaPlaySessionsPerDay:(double *)a12
{
  id v16 = a3;
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 mediaType];

    if (v18)
    {
      v19 = [v17 mediaType];
      *a4 = [(MOBiomeDonationUtility *)self mapMediaType:v19];
    }
    uint64_t v20 = [v17 mediaGenre];

    if (v20)
    {
      BOOL v21 = [v17 mediaGenre];
      *a5 = [(MOBiomeDonationUtility *)self mapMediaGenre:v21];
    }
    id v22 = [v17 mediaPlayerBundleId];

    if (v22)
    {
      id v23 = [v17 mediaPlayerBundleId];
      *a6 = [(MOBiomeDonationUtility *)self mapSourceBundleID:v23];
    }
    long long v24 = [v17 mediaPlaySessions];
    id v25 = [v24 count];

    if (v25)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      BOOL v49 = v17;
      id obj = [v17 mediaPlaySessions];
      id v26 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v54;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v54 != v28) {
              objc_enumerationMutation(obj);
            }
            v30 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v31 = [v30 endDate];
            v32 = [v30 startDate];
            [v31 timeIntervalSinceDate:v32];
            double v34 = v33;

            unsigned int v35 = [v30 mediaType];
            unsigned int v36 = [v35 lowercaseString];

            unsigned __int8 v37 = [v36 containsString:@"audio"];
            v38 = a11;
            v39 = a7;
            if ((v37 & 1) != 0
              || (unsigned int v40 = [v36 containsString:@"video"], v38 = a12, v39 = a8, v40))
            {
              double *v38 = v34 + *v38;
              ++*v39;
            }
            BOOL v41 = [v30 bundleId];
            id v42 = [v41 lowercaseString];

            unsigned __int8 v43 = [v42 containsString:@"com.apple."];
            BOOL v44 = a9;
            if (v43) {
              goto LABEL_20;
            }
            uint64_t v45 = [v30 bundleId];
            if (v45)
            {
              BOOL v46 = (void *)v45;
              v47 = [v30 bundleId];
              id v48 = [v47 length];

              BOOL v44 = a10;
              if (v48) {
LABEL_20:
              }
                ++*v44;
            }
          }
          id v27 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v27);
      }

      id v17 = v49;
    }
  }
}

- (void)convertSignificantContactEvent:(id)a3 toContactIDsInConversation:(id)a4 callLikeMechanismIncluded:(BOOL *)a5 textLikeMechanismIncluded:(BOOL *)a6 numAudioLikeInteractions:(unint64_t *)a7 numVideoLikeInteractions:(unint64_t *)a8 numTextLikeInteractions:(unint64_t *)a9 totalDurationOfCallLikeInteractions:(double *)a10 maxDurationOfCallLikeInteractions:(double *)a11 minDurationOfCallLikeInteractions:(double *)a12
{
  id v14 = a3;
  id v15 = a4;
  if (v14)
  {
    id v16 = [v14 interactionContacts];
    id v17 = [v16 count];

    if (v17)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v18 = [v14 interactionContacts];
      id v19 = [v18 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v56;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v56 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = [*(id *)(*((void *)&v55 + 1) + 8 * i) contact];
            long long v24 = [v23 identifier];
            [v15 addObject:v24];
          }
          id v20 = [v18 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v20);
      }
    }
    id v25 = [v14 interactions];
    id v26 = [v25 count];

    if (v26)
    {
      id v44 = v15;
      id v45 = v14;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = [v14 interactions];
      id v27 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v52;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v52 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
            v32 = [v31 endDate];
            double v33 = [v31 startDate];
            [v32 timeIntervalSinceDate:v33];
            double v35 = v34;

            callLikeMechanismsSet = self->_callLikeMechanismsSet;
            unsigned __int8 v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 mechanism]);
            LODWORD(callLikeMechanismsSet) = [(NSSet *)callLikeMechanismsSet containsObject:v37];

            if (callLikeMechanismsSet)
            {
              *a5 = 1;
              *a10 = v35 + *a10;
              if (v35 > *a11) {
                *a11 = v35;
              }
              if (v35 < *a12) {
                *a12 = v35;
              }
            }
            textLikeMechanismsSet = self->_textLikeMechanismsSet;
            v39 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 mechanism]);
            LODWORD(textLikeMechanismsSet) = [(NSSet *)textLikeMechanismsSet containsObject:v39];

            if (textLikeMechanismsSet) {
              *a6 = 1;
            }
            audioMechanismsSet = self->_audioMechanismsSet;
            BOOL v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 mechanism]);
            LODWORD(audioMechanismsSet) = [(NSSet *)audioMechanismsSet containsObject:v41];

            if (audioMechanismsSet) {
              ++*a7;
            }
            videoMechanismsSet = self->_videoMechanismsSet;
            unsigned __int8 v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 mechanism]);
            LODWORD(videoMechanismsSet) = [(NSSet *)videoMechanismsSet containsObject:v43];

            if (videoMechanismsSet) {
              ++*a8;
            }
          }
          id v28 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v28);
      }

      id v15 = v44;
      id v14 = v45;
    }
  }
}

- (int)mapGEOPOICategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:GEOPOICategoryAirport])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAmusementPark])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAnimalService])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAquarium])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:GEOPOICategoryATM])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAutomotiveRepair])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBakery])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBank])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBaseball])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBasketball])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBeach])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBeauty])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBowling])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:GEOPOICategoryBrewery])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:GEOPOICategoryCafe])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:GEOPOICategoryCampground])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:GEOPOICategoryCarRental])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:GEOPOICategoryCastle])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:GEOPOICategoryConventionCenter])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:GEOPOICategoryDistillery])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:GEOPOICategoryEVCharger])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFairground])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFireStation])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFishing])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFitnessCenter])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFoodMarket])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:GEOPOICategoryFortress])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:GEOPOICategoryGasStation])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:GEOPOICategoryGolf])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:GEOPOICategoryGoKart])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:GEOPOICategoryHiking])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:GEOPOICategoryHospital])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:GEOPOICategoryHotel])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:GEOPOICategoryKayaking])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:GEOPOICategoryLandmark])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:GEOPOICategoryLaundry])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:GEOPOICategoryLibrary])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMailbox])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMarina])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMiniGolf])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMovieTheater])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMuseum])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:GEOPOICategoryMusicVenue])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:GEOPOICategoryNationalMonument])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:GEOPOICategoryNationalPark])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:GEOPOICategoryNightlife])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPark])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:GEOPOICategoryParking])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPharmacy])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPlanetarium])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPolice])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPostOffice])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPublicTransport])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:GEOPOICategoryRestaurant])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:GEOPOICategoryRestroom])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:GEOPOICategoryRockClimbing])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:GEOPOICategoryRVPark])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:GEOPOICategorySchool])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:GEOPOICategorySkatePark])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:GEOPOICategorySkating])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:GEOPOICategorySkiing])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:GEOPOICategorySoccer])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:GEOPOICategorySpa])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:GEOPOICategoryStadium])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:GEOPOICategoryStore])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:GEOPOICategorySurfing])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:GEOPOICategorySwimming])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:GEOPOICategoryTennis])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:GEOPOICategoryTheater])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:GEOPOICategoryUniversity])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:GEOPOICategoryVolleyball])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:GEOPOICategoryWinery])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:GEOPOICategoryZoo])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAirportGate])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:GEOPOICategoryAirportTerminal])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:GEOPOICategoryPlayground])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:GEOPOICategoryReligiousSite])
  {
    int v4 = 33;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)mapPersonRelationshipTag:(unint64_t)a3
{
  if (a3 == 1) {
    int v3 = 0;
  }
  else {
    int v3 = a3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 1;
  }
}

+ (int)mapOnboardingFlowCompletion:(unint64_t)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (int)mapTimeTagType:(unint64_t)a3
{
  int result = 0;
  if ((uint64_t)a3 > 1999)
  {
    if ((uint64_t)a3 <= 9999)
    {
      if (a3 == 2002) {
        int v4 = 2002;
      }
      else {
        int v4 = 0;
      }
      if (a3 == 2001) {
        int v5 = 2001;
      }
      else {
        int v5 = v4;
      }
      if (a3 == 2000) {
        return 2000;
      }
      else {
        return v5;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2710uLL:
          int result = 12;
          break;
        case 0x2711uLL:
          int result = 13;
          break;
        case 0x2712uLL:
          int result = 14;
          break;
        case 0x2713uLL:
          int result = 15;
          break;
        case 0x2714uLL:
          int result = 16;
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        int result = 100;
        break;
      case 'e':
        int result = 101;
        break;
      case 'f':
        int result = 102;
        break;
      case 'g':
        int result = 103;
        break;
      case 'h':
        int result = 104;
        break;
      case 'i':
        int result = 105;
        break;
      case 'j':
        int result = 106;
        break;
      case 'k':
        int result = 107;
        break;
      case 'l':
        int result = 108;
        break;
      case 'm':
        int result = 109;
        break;
      case 'n':
        int result = 110;
        break;
      case 'o':
        int result = 111;
        break;
      case 'p':
        int result = 112;
        break;
      case 'q':
        int result = 113;
        break;
      case 'r':
        int result = 114;
        break;
      default:
        switch(a3)
        {
          case 1uLL:
            int result = 1;
            break;
          case 2uLL:
            int result = 2;
            break;
          case 3uLL:
            int result = 17;
            break;
          case 4uLL:
            int result = 3;
            break;
          case 5uLL:
            int result = 18;
            break;
          case 6uLL:
            int result = 4;
            break;
          case 7uLL:
            int result = 5;
            break;
          case 8uLL:
            int result = 6;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

- (int)mapMediaGenre:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3 && [v3 length])
  {
    int v5 = [v4 lowercaseString];
    id v6 = [@"##_GENRE" lowercaseString];
    unsigned __int8 v7 = [v5 containsString:v6];

    if (v7)
    {
      int v8 = 1;
    }
    else
    {
      unsigned __int8 v9 = [@"##_GENRE" lowercaseString];
      unsigned __int8 v10 = [v5 containsString:v9];

      if (v10)
      {
        int v8 = 2;
      }
      else
      {
        id v11 = [@"##_GENRE" lowercaseString];
        unsigned __int8 v12 = [v5 containsString:v11];

        if (v12)
        {
          int v8 = 3;
        }
        else
        {
          uint64_t v13 = [@"##_GENRE" lowercaseString];
          unsigned __int8 v14 = [v5 containsString:v13];

          if (v14)
          {
            int v8 = 4;
          }
          else
          {
            id v15 = [@"##_GENRE" lowercaseString];
            unsigned __int8 v16 = [v5 containsString:v15];

            if (v16)
            {
              int v8 = 5;
            }
            else
            {
              id v17 = [@"##_GENRE" lowercaseString];
              unsigned __int8 v18 = [v5 containsString:v17];

              if (v18)
              {
                int v8 = 6;
              }
              else
              {
                id v19 = [@"##_GENRE" lowercaseString];
                unsigned __int8 v20 = [v5 containsString:v19];

                if (v20)
                {
                  int v8 = 7;
                }
                else
                {
                  uint64_t v21 = [@"##_GENRE" lowercaseString];
                  unsigned __int8 v22 = [v5 containsString:v21];

                  if (v22)
                  {
                    int v8 = 8;
                  }
                  else
                  {
                    id v23 = [@"##_GENRE" lowercaseString];
                    unsigned __int8 v24 = [v5 containsString:v23];

                    if (v24)
                    {
                      int v8 = 9;
                    }
                    else
                    {
                      id v25 = [@"##_GENRE" lowercaseString];
                      unsigned __int8 v26 = [v5 containsString:v25];

                      if (v26)
                      {
                        int v8 = 10;
                      }
                      else
                      {
                        id v27 = [@"##_GENRE" lowercaseString];
                        unsigned __int8 v28 = [v5 containsString:v27];

                        if (v28)
                        {
                          int v8 = 11;
                        }
                        else
                        {
                          uint64_t v29 = [@"##_GENRE" lowercaseString];
                          unsigned __int8 v30 = [v5 containsString:v29];

                          if (v30)
                          {
                            int v8 = 12;
                          }
                          else
                          {
                            uint64_t v31 = [@"##_GENRE" lowercaseString];
                            unsigned __int8 v32 = [v5 containsString:v31];

                            if (v32)
                            {
                              int v8 = 13;
                            }
                            else
                            {
                              double v33 = [@"##_GENRE" lowercaseString];
                              unsigned __int8 v34 = [v5 containsString:v33];

                              if (v34)
                              {
                                int v8 = 14;
                              }
                              else
                              {
                                double v35 = [@"##_GENRE" lowercaseString];
                                unsigned __int8 v36 = [v5 containsString:v35];

                                if (v36)
                                {
                                  int v8 = 15;
                                }
                                else
                                {
                                  unsigned __int8 v37 = [@"##_GENRE" lowercaseString];
                                  unsigned __int8 v38 = [v5 containsString:v37];

                                  if (v38)
                                  {
                                    int v8 = 16;
                                  }
                                  else
                                  {
                                    v39 = [@"##_GENRE" lowercaseString];
                                    unsigned __int8 v40 = [v5 containsString:v39];

                                    if (v40)
                                    {
                                      int v8 = 17;
                                    }
                                    else
                                    {
                                      BOOL v41 = [@"##_GENRE" lowercaseString];
                                      unsigned __int8 v42 = [v5 containsString:v41];

                                      if (v42)
                                      {
                                        int v8 = 18;
                                      }
                                      else
                                      {
                                        unsigned __int8 v43 = [@"##_GENRE" lowercaseString];
                                        unsigned __int8 v44 = [v5 containsString:v43];

                                        if (v44)
                                        {
                                          int v8 = 19;
                                        }
                                        else
                                        {
                                          id v45 = [@"##_GENRE" lowercaseString];
                                          unsigned __int8 v46 = [v5 containsString:v45];

                                          if (v46)
                                          {
                                            int v8 = 20;
                                          }
                                          else
                                          {
                                            v47 = [@"##_GENRE" lowercaseString];
                                            unsigned __int8 v48 = [v5 containsString:v47];

                                            if (v48)
                                            {
                                              int v8 = 21;
                                            }
                                            else
                                            {
                                              BOOL v49 = [@"##_GENRE" lowercaseString];
                                              unsigned __int8 v50 = [v5 containsString:v49];

                                              if (v50)
                                              {
                                                int v8 = 22;
                                              }
                                              else
                                              {
                                                long long v51 = [@"##_GENRE" lowercaseString];
                                                unsigned __int8 v52 = [v5 containsString:v51];

                                                if (v52)
                                                {
                                                  int v8 = 23;
                                                }
                                                else
                                                {
                                                  long long v53 = [@"##_GENRE" lowercaseString];
                                                  unsigned __int8 v54 = [v5 containsString:v53];

                                                  if (v54)
                                                  {
                                                    int v8 = 24;
                                                  }
                                                  else
                                                  {
                                                    long long v55 = [@"##_GENRE" lowercaseString];
                                                    unsigned __int8 v56 = [v5 containsString:v55];

                                                    if (v56)
                                                    {
                                                      int v8 = 25;
                                                    }
                                                    else
                                                    {
                                                      long long v57 = [@"##_GENRE" lowercaseString];
                                                      unsigned __int8 v58 = [v5 containsString:v57];

                                                      if (v58)
                                                      {
                                                        int v8 = 26;
                                                      }
                                                      else
                                                      {
                                                        unsigned int v59 = [@"##_GENRE" lowercaseString];
                                                        unsigned __int8 v60 = [v5 containsString:v59];

                                                        if (v60)
                                                        {
                                                          int v8 = 27;
                                                        }
                                                        else
                                                        {
                                                          uint64_t v61 = [@"##_GENRE" lowercaseString];
                                                          [v5 containsString:v61];

                                                          int v8 = 28;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)mapMediaType:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3 && [v3 length])
  {
    int v5 = [v4 lowercaseString];
    if ([v5 containsString:@"music"])
    {
      int v6 = 1;
    }
    else if ([v5 containsString:@"podcast"])
    {
      int v6 = 2;
    }
    else if ([v5 containsString:@"audio"])
    {
      if ([v5 containsString:@"book"]) {
        int v6 = 3;
      }
      else {
        int v6 = 6;
      }
    }
    else if ([v5 containsString:@"itune"])
    {
      if ([v5 containsString:@"radio"]) {
        int v6 = 5;
      }
      else {
        int v6 = 4;
      }
    }
    else if ([v5 containsString:@"video"])
    {
      int v6 = 7;
    }
    else
    {
      int v6 = 8;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)mapSourceBundleID:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 containsString:@"com.apple."]) {
    return 1;
  }
  return 3;
}

- (int)mapVisitPlaceType:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    int v3 = 3;
  }
  else {
    int v3 = 0;
  }
  if (a3 == 3) {
    int v3 = 2;
  }
  if (a3 == 2) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if (a3 >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (int)mapPhotoMomentInference:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    int v4 = [v3 lowercaseString];
    int v5 = [@"##_PHOTO_INFERENCE" lowercaseString];
    unsigned __int8 v6 = [v4 containsString:v5];

    if (v6)
    {
      int v7 = 1;
    }
    else
    {
      int v8 = [v3 lowercaseString];
      unsigned __int8 v9 = [@"##_PHOTO_INFERENCE" lowercaseString];
      unsigned __int8 v10 = [v8 containsString:v9];

      if (v10)
      {
        int v7 = 2;
      }
      else
      {
        id v11 = [v3 lowercaseString];
        unsigned __int8 v12 = [@"##_PHOTO_INFERENCE" lowercaseString];
        unsigned __int8 v13 = [v11 containsString:v12];

        if (v13)
        {
          int v7 = 3;
        }
        else
        {
          unsigned __int8 v14 = [v3 lowercaseString];
          id v15 = [@"##_PHOTO_INFERENCE" lowercaseString];
          unsigned __int8 v16 = [v14 containsString:v15];

          if (v16)
          {
            int v7 = 4;
          }
          else
          {
            id v17 = [v3 lowercaseString];
            unsigned __int8 v18 = [@"##_PHOTO_INFERENCE" lowercaseString];
            unsigned __int8 v19 = [v17 containsString:v18];

            if (v19)
            {
              int v7 = 5;
            }
            else
            {
              unsigned __int8 v20 = [v3 lowercaseString];
              uint64_t v21 = [@"##_PHOTO_INFERENCE" lowercaseString];
              unsigned __int8 v22 = [v20 containsString:v21];

              if (v22)
              {
                int v7 = 6;
              }
              else
              {
                id v23 = [v3 lowercaseString];
                unsigned __int8 v24 = [@"##_PHOTO_INFERENCE" lowercaseString];
                unsigned __int8 v25 = [v23 containsString:v24];

                if (v25)
                {
                  int v7 = 7;
                }
                else
                {
                  unsigned __int8 v26 = [v3 lowercaseString];
                  id v27 = [@"##_PHOTO_INFERENCE" lowercaseString];
                  unsigned __int8 v28 = [v26 containsString:v27];

                  if (v28)
                  {
                    int v7 = 8;
                  }
                  else
                  {
                    uint64_t v29 = [v3 lowercaseString];
                    unsigned __int8 v30 = [@"##_PHOTO_INFERENCE" lowercaseString];
                    unsigned __int8 v31 = [v29 containsString:v30];

                    if (v31)
                    {
                      int v7 = 9;
                    }
                    else
                    {
                      unsigned __int8 v32 = [v3 lowercaseString];
                      double v33 = [@"##_PHOTO_INFERENCE" lowercaseString];
                      unsigned __int8 v34 = [v32 containsString:v33];

                      if (v34)
                      {
                        int v7 = 10;
                      }
                      else
                      {
                        double v35 = [v3 lowercaseString];
                        unsigned __int8 v36 = [@"##_PHOTO_INFERENCE" lowercaseString];
                        unsigned __int8 v37 = [v35 containsString:v36];

                        if (v37)
                        {
                          int v7 = 11;
                        }
                        else
                        {
                          unsigned __int8 v38 = [v3 lowercaseString];
                          v39 = [@"##_PHOTO_INFERENCE" lowercaseString];
                          unsigned __int8 v40 = [v38 containsString:v39];

                          if (v40)
                          {
                            int v7 = 12;
                          }
                          else
                          {
                            BOOL v41 = [v3 lowercaseString];
                            unsigned __int8 v42 = [@"##_PHOTO_INFERENCE" lowercaseString];
                            unsigned __int8 v43 = [v41 containsString:v42];

                            if (v43)
                            {
                              int v7 = 13;
                            }
                            else
                            {
                              unsigned __int8 v44 = [v3 lowercaseString];
                              id v45 = [@"##_PHOTO_INFERENCE" lowercaseString];
                              unsigned __int8 v46 = [v44 containsString:v45];

                              if (v46)
                              {
                                int v7 = 14;
                              }
                              else
                              {
                                v47 = [v3 lowercaseString];
                                unsigned __int8 v48 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                unsigned __int8 v49 = [v47 containsString:v48];

                                if (v49)
                                {
                                  int v7 = 15;
                                }
                                else
                                {
                                  unsigned __int8 v50 = [v3 lowercaseString];
                                  long long v51 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                  unsigned __int8 v52 = [v50 containsString:v51];

                                  if (v52)
                                  {
                                    int v7 = 16;
                                  }
                                  else
                                  {
                                    long long v53 = [v3 lowercaseString];
                                    unsigned __int8 v54 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                    unsigned __int8 v55 = [v53 containsString:v54];

                                    if (v55)
                                    {
                                      int v7 = 17;
                                    }
                                    else
                                    {
                                      unsigned __int8 v56 = [v3 lowercaseString];
                                      long long v57 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                      unsigned __int8 v58 = [v56 containsString:v57];

                                      if (v58)
                                      {
                                        int v7 = 18;
                                      }
                                      else
                                      {
                                        unsigned int v59 = [v3 lowercaseString];
                                        unsigned __int8 v60 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                        unsigned __int8 v61 = [v59 containsString:v60];

                                        if (v61)
                                        {
                                          int v7 = 19;
                                        }
                                        else
                                        {
                                          unsigned int v62 = [v3 lowercaseString];
                                          double v63 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                          unsigned __int8 v64 = [v62 containsString:v63];

                                          if (v64)
                                          {
                                            int v7 = 20;
                                          }
                                          else
                                          {
                                            v65 = [v3 lowercaseString];
                                            double v66 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                            unsigned __int8 v67 = [v65 containsString:v66];

                                            if (v67)
                                            {
                                              int v7 = 21;
                                            }
                                            else
                                            {
                                              int v68 = [v3 lowercaseString];
                                              v69 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                              unsigned __int8 v70 = [v68 containsString:v69];

                                              if (v70)
                                              {
                                                int v7 = 22;
                                              }
                                              else
                                              {
                                                v71 = [v3 lowercaseString];
                                                uint64_t v72 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                unsigned __int8 v73 = [v71 containsString:v72];

                                                if (v73)
                                                {
                                                  int v7 = 23;
                                                }
                                                else
                                                {
                                                  uint64_t v74 = [v3 lowercaseString];
                                                  unsigned int v75 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                  unsigned __int8 v76 = [v74 containsString:v75];

                                                  if (v76)
                                                  {
                                                    int v7 = 24;
                                                  }
                                                  else
                                                  {
                                                    unsigned int v77 = [v3 lowercaseString];
                                                    uint64_t v78 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                    unsigned __int8 v79 = [v77 containsString:v78];

                                                    if (v79)
                                                    {
                                                      int v7 = 25;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v80 = [v3 lowercaseString];
                                                      id v81 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                      unsigned __int8 v82 = [v80 containsString:v81];

                                                      if (v82)
                                                      {
                                                        int v7 = 26;
                                                      }
                                                      else
                                                      {
                                                        uint64_t v83 = [v3 lowercaseString];
                                                        v84 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                        unsigned __int8 v85 = [v83 containsString:v84];

                                                        if (v85)
                                                        {
                                                          int v7 = 27;
                                                        }
                                                        else
                                                        {
                                                          v86 = [v3 lowercaseString];
                                                          v87 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                          unsigned __int8 v88 = [v86 containsString:v87];

                                                          if (v88)
                                                          {
                                                            int v7 = 28;
                                                          }
                                                          else
                                                          {
                                                            v89 = [v3 lowercaseString];
                                                            id v90 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                            unsigned __int8 v91 = [v89 containsString:v90];

                                                            if (v91)
                                                            {
                                                              int v7 = 29;
                                                            }
                                                            else
                                                            {
                                                              uint64_t v92 = [v3 lowercaseString];
                                                              v93 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                              unsigned __int8 v94 = [v92 containsString:v93];

                                                              if (v94)
                                                              {
                                                                int v7 = 30;
                                                              }
                                                              else
                                                              {
                                                                v95 = [v3 lowercaseString];
                                                                id v96 = [@"##_PHOTO_INFERENCE" lowercaseString];
                                                                unsigned int v97 = [v95 containsString:v96];

                                                                if (v97) {
                                                                  int v7 = 31;
                                                                }
                                                                else {
                                                                  int v7 = 0;
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (int)mapTimeCorrelationScore:(float)a3
{
  if (self->_kLowBundleQualityScoreThreshold > a3) {
    return 1;
  }
  if (self->_kHighBundleQualityScoreThreshold <= a3) {
    return 3;
  }
  return 2;
}

- (int)mapLabelConfidenceScore:(float)a3
{
  if (self->_kLowBundleQualityScoreThreshold > a3) {
    return 1;
  }
  if (self->_kHighBundleQualityScoreThreshold <= a3) {
    return 3;
  }
  return 2;
}

- (int)mapCallDurationType:(double)a3
{
  double shortCallDurationInSecondsThreshold = self->_shortCallDurationInSecondsThreshold;
  if (a3 > 0.0 && shortCallDurationInSecondsThreshold >= a3) {
    return 1;
  }
  double longCallDurationInSecondsThreshold = self->_longCallDurationInSecondsThreshold;
  if (shortCallDurationInSecondsThreshold < a3 && longCallDurationInSecondsThreshold >= a3) {
    return 2;
  }
  if (longCallDurationInSecondsThreshold >= a3) {
    return 0;
  }
  return 3;
}

- (int)mapBurstyInteractionCount:(unint64_t)a3
{
  if (self->_lowBurstyInteractionCountThreshold >= a3) {
    return 1;
  }
  if (self->_highBurstyInteractionCountThreshold >= a3) {
    return 2;
  }
  return 3;
}

- (int)mapDistanceToHomeInMiles:(double)a3
{
  double distanceToHomeInMilesThresholdNearHome = self->_distanceToHomeInMilesThresholdNearHome;
  if (a3 >= 0.0 && distanceToHomeInMilesThresholdNearHome > a3) {
    return 1;
  }
  double distanceToHomeInMilesThresholdMedium = self->_distanceToHomeInMilesThresholdMedium;
  if (distanceToHomeInMilesThresholdNearHome <= a3 && distanceToHomeInMilesThresholdMedium > a3) {
    return 2;
  }
  double distanceToHomeInMilesThresholdFar = self->_distanceToHomeInMilesThresholdFar;
  if (distanceToHomeInMilesThresholdMedium > a3 || distanceToHomeInMilesThresholdFar <= a3) {
    return 4 * (distanceToHomeInMilesThresholdFar <= a3);
  }
  else {
    return 3;
  }
}

- (NSSet)callLikeMechanismsSet
{
  return self->_callLikeMechanismsSet;
}

- (NSSet)textLikeMechanismsSet
{
  return self->_textLikeMechanismsSet;
}

- (NSSet)audioMechanismsSet
{
  return self->_audioMechanismsSet;
}

- (NSSet)videoMechanismsSet
{
  return self->_videoMechanismsSet;
}

- (float)kLowBundleQualityScoreThreshold
{
  return self->_kLowBundleQualityScoreThreshold;
}

- (float)kHighBundleQualityScoreThreshold
{
  return self->_kHighBundleQualityScoreThreshold;
}

- (float)shortCallDurationInSecondsThreshold
{
  return self->_shortCallDurationInSecondsThreshold;
}

- (float)longCallDurationInSecondsThreshold
{
  return self->_longCallDurationInSecondsThreshold;
}

- (unint64_t)lowBurstyInteractionCountThreshold
{
  return self->_lowBurstyInteractionCountThreshold;
}

- (unint64_t)highBurstyInteractionCountThreshold
{
  return self->_highBurstyInteractionCountThreshold;
}

- (float)distanceToHomeInMilesThresholdNearHome
{
  return self->_distanceToHomeInMilesThresholdNearHome;
}

- (float)distanceToHomeInMilesThresholdMedium
{
  return self->_distanceToHomeInMilesThresholdMedium;
}

- (float)distanceToHomeInMilesThresholdFar
{
  return self->_distanceToHomeInMilesThresholdFar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMechanismsSet, 0);
  objc_storeStrong((id *)&self->_audioMechanismsSet, 0);
  objc_storeStrong((id *)&self->_textLikeMechanismsSet, 0);

  objc_storeStrong((id *)&self->_callLikeMechanismsSet, 0);
}

@end