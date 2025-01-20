@interface CRImageReaderTrackingResult
- (CRImageReaderTrackingResult)initWithTrackingLevel:(unint64_t)a3;
- (CRImageReaderTrackingResult)resultByUpdatingWithDocument:(__n128)a3 sceneHomography:(__n128)a4 usesGroupedRegions:(uint64_t)a5;
- (NSArray)addedRegionIDs;
- (NSArray)regionTrackingGroups;
- (NSArray)removedRegionIDs;
- (NSArray)trackedRegions;
- (NSArray)updatedRegionIDs;
- (unint64_t)stabilityLevel;
- (void)markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:(BOOL)a3 ransacReprojError:(float)a4 markedQuadArea:(double)a5;
- (void)setRegionTrackingGroups:(id)a3;
- (void)setRemovedRegionIDs:(id)a3;
- (void)setTrackedRegions:(id)a3;
- (void)setUpdatedRegionIDs:(id)a3;
@end

@implementation CRImageReaderTrackingResult

- (CRImageReaderTrackingResult)initWithTrackingLevel:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CRImageReaderTrackingResult;
  v4 = [(CRImageReaderTrackingResult *)&v13 init];
  v5 = v4;
  if (v4)
  {
    trackedRegions = v4->_trackedRegions;
    v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v4->_trackedRegions = (NSArray *)MEMORY[0x1E4F1CBF0];

    addedRegionIDs = v5->_addedRegionIDs;
    v5->_addedRegionIDs = v7;

    removedRegionIDs = v5->_removedRegionIDs;
    v5->_removedRegionIDs = v7;

    updatedRegionIDs = v5->_updatedRegionIDs;
    v5->_updatedRegionIDs = v7;

    self;
    if (a3 > 2) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = qword_1DD8CEB18[a3];
    }
    v5->_trackedRegionType = v11;
  }
  return v5;
}

- (CRImageReaderTrackingResult)resultByUpdatingWithDocument:(__n128)a3 sceneHomography:(__n128)a4 usesGroupedRegions:(uint64_t)a5
{
  uint64_t v298 = *MEMORY[0x1E4F143B8];
  id v202 = a6;
  v8 = objc_alloc_init(CRImageReaderTrackingResult);
  if (a1) {
    unint64_t v9 = a1[6];
  }
  else {
    unint64_t v9 = 0;
  }
  v207 = v8;
  v195 = a1;
  if (!v8)
  {
    v192 = a1;
    id v193 = v202;
    goto LABEL_149;
  }
  v8->_trackedRegionType = v9;
  v10 = a1;
  id v11 = v202;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v12 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t spid = os_signpost_id_generate(v12);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  objc_super v13 = (id)CRSignpostLog_signPostOSLog;
  v14 = v13;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "OCRTrackingPerformAssociationTime", "", buf, 2u);
  }

  v203 = [v10 trackedRegions];
  v15 = [v10 regionTrackingGroups];
  LODWORD(v16) = 0.75;
  [v10 markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:1 ransacReprojError:v16 markedQuadArea:0.0];
  if (v207->_trackedRegionType == 4)
  {
    v17 = [v11 contentsWithTypes:2];
    v18 = objc_opt_new();
    long long v274 = 0u;
    long long v275 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v274 objects:v297 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v275;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v275 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v274 + 1) + 8 * i) contentsWithTypes:4];
          [v18 addObjectsFromArray:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v274 objects:v297 count:16];
      }
      while (v21);
    }

    id v25 = v18;
  }
  else
  {
    objc_msgSend(v11, "contentsWithTypes:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v198 = v25;
  uint64_t v26 = [v25 mutableCopy];
  +[CRTrackingFilter filterLowQualityTranscriptRegions:v26];
  v27 = CROSLogForCategory(1);
  v211 = (void *)v26;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [v203 count];
    uint64_t v29 = [v198 count];
    uint64_t v30 = [v211 count];
    uint64_t v31 = [v15 count];
    *(_DWORD *)buf = 134218752;
    uint64_t v288 = v28;
    __int16 v289 = 2048;
    double v290 = *(double *)&v29;
    uint64_t v26 = (uint64_t)v211;
    __int16 v291 = 2048;
    uint64_t v292 = v30;
    __int16 v293 = 2048;
    uint64_t v294 = v31;
    _os_log_impl(&dword_1DD733000, v27, OS_LOG_TYPE_DEFAULT, "Association: START existingR=%ld candidatesR=%ld,%ld existingG=%ld", buf, 0x2Au);
  }

  v268[0] = MEMORY[0x1E4F143A8];
  v268[1] = 3221225472;
  v268[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke;
  v268[3] = &unk_1E6CDC0C8;
  id v201 = v15;
  id v272 = v201;
  v205 = v10;
  id v273 = v205;
  __n128 v269 = a2;
  __n128 v270 = a3;
  __n128 v271 = a4;
  v266[0] = MEMORY[0x1E4F143A8];
  v266[1] = 3221225472;
  v266[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_20;
  v266[3] = &unk_1E6CDC0F0;
  v266[4] = v207;
  char v267 = a7;
  v32 = +[CRTrackingAssociator performAssociationOnCandidates:v26 useRegionsAtOCRDispatchTime:1 existingRegions:v203 newRegionHandler:v268 matchedRegionHandler:v266];
  v33 = CROSLogForCategory(1);
  v206 = v32;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [v32 tracked];
    uint64_t v35 = [v34 count];
    v36 = [v32 updatedRegionIDs];
    uint64_t v37 = [v36 count];
    v38 = [v206 removedRegionIDs];
    uint64_t v39 = [v38 count];
    v40 = [v206 addedRegionIDs];
    uint64_t v41 = [v40 count];
    [v206 totalError];
    *(_DWORD *)buf = 134219008;
    uint64_t v288 = v35;
    __int16 v289 = 2048;
    double v290 = *(double *)&v37;
    __int16 v291 = 2048;
    uint64_t v292 = v39;
    __int16 v293 = 2048;
    uint64_t v294 = v41;
    __int16 v295 = 2048;
    uint64_t v296 = v42;
    _os_log_impl(&dword_1DD733000, v33, OS_LOG_TYPE_DEFAULT, "Association: - REGION tracked=%ld updated=%ld removed=%ld added=%ld error=%f", buf, 0x34u);

    v32 = v206;
  }

  v43 = [v32 tracked];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    v45 = [v32 tracked];
    v46 = +[CRTrackedRegionGroup groupsFromOutputRegions:v45];
  }
  else
  {
    v46 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v47 = CROSLogForCategory(1);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v48 = [v46 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v288 = v48;
    _os_log_impl(&dword_1DD733000, v47, OS_LOG_TYPE_DEFAULT, "Association: - candidateG=%ld", buf, 0xCu);
  }

  v49 = [MEMORY[0x1E4F1CA80] set];
  v50 = [MEMORY[0x1E4F1CA60] dictionary];
  v263[0] = MEMORY[0x1E4F143A8];
  v263[1] = 3221225472;
  v263[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_29;
  v263[3] = &unk_1E6CDC118;
  id v51 = v49;
  id v264 = v51;
  id v217 = v50;
  id v265 = v217;
  v194 = v46;
  v52 = +[CRHungarianTrackingAssociator performAssociationOnCandidates:v46 useRegionsAtOCRDispatchTime:0 existingRegions:v201 fineGrainedResults:v32 newRegionHandler:&__block_literal_global_28_0 matchedRegionHandler:v263];
  v53 = CROSLogForCategory(1);
  v214 = v52;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v225 = [v52 tracked];
    uint64_t v54 = [v225 count];
    v55 = [v52 updatedRegionIDs];
    uint64_t v56 = [v55 count];
    v57 = [v52 removedRegionIDs];
    uint64_t v58 = [v57 count];
    v59 = [v52 addedRegionIDs];
    uint64_t v60 = [v59 count];
    [v214 totalError];
    *(_DWORD *)buf = 134219008;
    uint64_t v288 = v54;
    __int16 v289 = 2048;
    double v290 = *(double *)&v56;
    __int16 v291 = 2048;
    uint64_t v292 = v58;
    __int16 v293 = 2048;
    uint64_t v294 = v60;
    __int16 v295 = 2048;
    uint64_t v296 = v61;
    _os_log_impl(&dword_1DD733000, v53, OS_LOG_TYPE_DEFAULT, "Association: - GROUP tracked=%ld updated=%ld removed=%ld added=%ld error=%f", buf, 0x34u);

    v52 = v214;
  }

  if (!a7) {
    v52 = v32;
  }
  id v197 = [v52 updatedRegionIDs];

  id v196 = [v52 removedRegionIDs];

  id v200 = [v52 addedRegionIDs];

  [v52 totalError];
  double v63 = v62;
  long long v259 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  long long v262 = 0u;
  id v64 = [v52 tracked];

  uint64_t v65 = [v64 countByEnumeratingWithState:&v259 objects:v286 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v260;
    double v68 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v260 != v67) {
          objc_enumerationMutation(v64);
        }
        v70 = [*(id *)(*((void *)&v259 + 1) + 8 * j) boundingQuad];
        v71 = [v70 denormalizedQuad];
        [v71 area];
        double v68 = v68 + v72;
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v259 objects:v286 count:16];
    }
    while (v66);
  }
  else
  {
    double v68 = 0.0;
  }

  double v73 = v63 / v68;
  v74 = CROSLogForCategory(1);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v75 = &stru_1F38EED68;
    if (v68 == 0.0) {
      v75 = @"FIRST_RUN";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v288 = (uint64_t)v75;
    __int16 v289 = 2048;
    double v290 = v73;
    _os_log_impl(&dword_1DD733000, v74, OS_LOG_TYPE_DEFAULT, "Association: END %@ normalizedTotalError=%f", buf, 0x16u);
  }

  long long v257 = 0u;
  long long v258 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  obuint64_t j = v51;
  v76 = v211;
  v77 = v214;
  uint64_t v212 = [obj countByEnumeratingWithState:&v255 objects:v285 count:16];
  if (v212)
  {
    uint64_t v209 = *(void *)v256;
    do
    {
      uint64_t v78 = 0;
      do
      {
        if (*(void *)v256 != v209) {
          objc_enumerationMutation(obj);
        }
        v79 = *(void **)(*((void *)&v255 + 1) + 8 * v78);
        v80 = CROSLogForCategory(1);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v288 = (uint64_t)v79;
          _os_log_impl(&dword_1DD733000, v80, OS_LOG_TYPE_DEFAULT, "Association: - replace homography group %@", buf, 0xCu);
        }

        uint64_t v215 = v78;
        if (v73 < 0.300000012)
        {
          v81 = v207->_regionTrackingGroups;
        }
        else
        {
          v81 = [v77 tracked];
        }
        long long v253 = 0u;
        long long v254 = 0u;
        long long v251 = 0u;
        long long v252 = 0u;
        v82 = v81;
        uint64_t v83 = [(NSArray *)v82 countByEnumeratingWithState:&v251 objects:v284 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v252;
          do
          {
            for (uint64_t k = 0; k != v84; ++k)
            {
              if (*(void *)v252 != v85) {
                objc_enumerationMutation(v82);
              }
              if (v79)
              {
                v87 = *(void **)(*((void *)&v251 + 1) + 8 * k);
                uint64_t v88 = [v87 homographyGroupID];
                if (v88)
                {
                  v89 = (void *)v88;
                  v90 = [v87 homographyGroupID];
                  uint64_t v91 = [v90 integerValue];
                  uint64_t v92 = [v79 integerValue];

                  if (v91 == v92)
                  {
                    v93 = [v87 trackingID];
                    v94 = [v217 objectForKeyedSubscript:v93];

                    if (v94)
                    {
                      v95 = [v94 originalBoundingQuad];
                      [v87 setOriginalBoundingQuad:v95];

                      v96 = [v94 boundingQuad];
                      [v87 setBoundingQuad:v96];

                      [v94 boundingQuadHomography];
                      [v87 setBoundingQuadHomography:v97];
                    }
                  }
                }
              }
            }
            uint64_t v84 = [(NSArray *)v82 countByEnumeratingWithState:&v251 objects:v284 count:16];
          }
          while (v84);
        }

        v77 = v214;
        uint64_t v78 = v215 + 1;
        v76 = v211;
      }
      while (v215 + 1 != v212);
      uint64_t v212 = [obj countByEnumeratingWithState:&v255 objects:v285 count:16];
    }
    while (v212);
  }

  if (v73 >= 0.300000012)
  {
    v98 = [v206 tracked];
    uint64_t v99 = [v98 copy];
    trackedRegions = v207->_trackedRegions;
    v207->_trackedRegions = (NSArray *)v99;

    v101 = [v77 tracked];
    uint64_t v102 = [v101 copy];
    regionTrackingGroups = v207->_regionTrackingGroups;
    v207->_regionTrackingGroups = (NSArray *)v102;

    uint64_t v104 = [v200 copy];
    addedRegionIDs = v207->_addedRegionIDs;
    v207->_addedRegionIDs = (NSArray *)v104;

    uint64_t v106 = [v196 copy];
    removedRegionIDs = v207->_removedRegionIDs;
    v207->_removedRegionIDs = (NSArray *)v106;

    uint64_t v108 = [v197 copy];
    updatedRegionIDs = v207->_updatedRegionIDs;
    v207->_updatedRegionIDs = (NSArray *)v108;
    v110 = v194;
    goto LABEL_143;
  }
  v226 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v200, "count"));
  v216 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v200, "count"));
  id v111 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v112 = [v77 addedRegionIDs];
  v213 = objc_msgSend(v111, "initWithCapacity:", objc_msgSend(v112, "count"));

  id v113 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v114 = v206;
  v115 = [v206 addedRegionIDs];
  v210 = objc_msgSend(v113, "initWithCapacity:", objc_msgSend(v115, "count"));

  long long v249 = 0u;
  long long v250 = 0u;
  long long v247 = 0u;
  long long v248 = 0u;
  v116 = [v77 tracked];
  uint64_t v117 = [v116 countByEnumeratingWithState:&v247 objects:v283 count:16];
  if (v117)
  {
    uint64_t v118 = v117;
    uint64_t v119 = *(void *)v248;
    v222 = v116;
    uint64_t v219 = *(void *)v248;
    do
    {
      for (uint64_t m = 0; m != v118; ++m)
      {
        if (*(void *)v248 != v119) {
          objc_enumerationMutation(v116);
        }
        v121 = *(void **)(*((void *)&v247 + 1) + 8 * m);
        v122 = [v77 addedRegionIDs];
        v123 = [v121 trackingID];
        if ([v122 containsObject:v123])
        {
          v124 = [v121 boundingQuad];
          v125 = [v124 denormalizedQuad];
          [v125 area];
          double v127 = v126;

          if (v127 <= 900.0) {
            goto LABEL_95;
          }
          long long v245 = 0u;
          long long v246 = 0u;
          long long v243 = 0u;
          long long v244 = 0u;
          v122 = [v205 regionTrackingGroups];
          uint64_t v128 = [v122 countByEnumeratingWithState:&v243 objects:v282 count:16];
          if (v128)
          {
            uint64_t v129 = v128;
            uint64_t v130 = *(void *)v244;
LABEL_83:
            uint64_t v131 = 0;
            while (1)
            {
              if (*(void *)v244 != v130) {
                objc_enumerationMutation(v122);
              }
              v132 = *(void **)(*((void *)&v243 + 1) + 8 * v131);
              v133 = [v121 boundingQuad];
              v134 = [v132 boundingQuad];
              char v135 = [v133 overlapsNormalizedQuad:v134];

              if (v135) {
                break;
              }
              if (v129 == ++v131)
              {
                uint64_t v129 = [v122 countByEnumeratingWithState:&v243 objects:v282 count:16];
                if (v129) {
                  goto LABEL_83;
                }
                goto LABEL_89;
              }
            }
          }
          else
          {
LABEL_89:

            v136 = [v121 trackingID];

            if (!v136)
            {
              v137 = [MEMORY[0x1E4F29128] UUID];
              [v121 setTrackingID:v137];
            }
            [(NSArray *)v226 addObject:v121];
            v122 = [v121 trackingID];
            [v213 addObject:v122];
          }
          v114 = v206;
          v116 = v222;
          uint64_t v119 = v219;
        }
        else
        {
        }
LABEL_95:
        v77 = v214;
      }
      uint64_t v118 = [v116 countByEnumeratingWithState:&v247 objects:v283 count:16];
    }
    while (v118);
  }

  long long v241 = 0u;
  long long v242 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  v138 = [v114 tracked];
  uint64_t v139 = [v138 countByEnumeratingWithState:&v239 objects:v281 count:16];
  if (!v139) {
    goto LABEL_120;
  }
  uint64_t v140 = v139;
  uint64_t v141 = *(void *)v240;
  v223 = v138;
  uint64_t v220 = *(void *)v240;
  do
  {
    for (uint64_t n = 0; n != v140; ++n)
    {
      if (*(void *)v240 != v141) {
        objc_enumerationMutation(v138);
      }
      v143 = *(void **)(*((void *)&v239 + 1) + 8 * n);
      v144 = [v114 addedRegionIDs];
      v145 = [v143 trackingID];
      if ([v144 containsObject:v145])
      {
        v146 = [v143 boundingQuad];
        v147 = [v146 denormalizedQuad];
        [v147 area];
        double v149 = v148;

        if (v149 <= 900.0) {
          continue;
        }
        long long v237 = 0u;
        long long v238 = 0u;
        long long v235 = 0u;
        long long v236 = 0u;
        v144 = [v205 trackedRegions];
        uint64_t v150 = [v144 countByEnumeratingWithState:&v235 objects:v280 count:16];
        if (v150)
        {
          uint64_t v151 = v150;
          uint64_t v152 = *(void *)v236;
LABEL_106:
          uint64_t v153 = 0;
          while (1)
          {
            if (*(void *)v236 != v152) {
              objc_enumerationMutation(v144);
            }
            v154 = *(void **)(*((void *)&v235 + 1) + 8 * v153);
            v155 = [v143 boundingQuad];
            v156 = [v154 boundingQuad];
            char v157 = [v155 overlapsNormalizedQuad:v156];

            if (v157) {
              break;
            }
            if (v151 == ++v153)
            {
              uint64_t v151 = [v144 countByEnumeratingWithState:&v235 objects:v280 count:16];
              if (v151) {
                goto LABEL_106;
              }
              goto LABEL_112;
            }
          }
        }
        else
        {
LABEL_112:

          v158 = [v143 trackingID];

          if (!v158)
          {
            v159 = [MEMORY[0x1E4F29128] UUID];
            [v143 setTrackingID:v159];
          }
          [v216 addObject:v143];
          v144 = [v143 trackingID];
          [v210 addObject:v144];
        }
        v114 = v206;
        v138 = v223;
        uint64_t v141 = v220;
      }
      else
      {
      }
    }
    uint64_t v140 = [v138 countByEnumeratingWithState:&v239 objects:v281 count:16];
  }
  while (v140);
LABEL_120:

  v160 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v207->_trackedRegions, "count"));
  v161 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v207->_regionTrackingGroups, "count"));
  if (a7)
  {
    long long v233 = 0u;
    long long v234 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    v162 = v207->_regionTrackingGroups;
    uint64_t v163 = [(NSArray *)v162 countByEnumeratingWithState:&v231 objects:v279 count:16];
    if (v163)
    {
      uint64_t v164 = v163;
      uint64_t v165 = *(void *)v232;
      do
      {
        for (iuint64_t i = 0; ii != v164; ++ii)
        {
          if (*(void *)v232 != v165) {
            objc_enumerationMutation(v162);
          }
          v167 = *(void **)(*((void *)&v231 + 1) + 8 * ii);
          if ([v167 trackNeedsReplacement])
          {
            v168 = [v167 trackingID];
            v169 = v161;
          }
          else
          {
            [(NSArray *)v226 addObject:v167];
            v168 = [v167 trackingID];
            v169 = v160;
          }
          [v169 addObject:v168];
        }
        uint64_t v164 = [(NSArray *)v162 countByEnumeratingWithState:&v231 objects:v279 count:16];
      }
      while (v164);
    }
    v170 = v213;
  }
  else
  {
    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    v162 = [v205 trackedRegions];
    uint64_t v171 = [(NSArray *)v162 countByEnumeratingWithState:&v227 objects:v278 count:16];
    if (v171)
    {
      uint64_t v172 = v171;
      uint64_t v173 = *(void *)v228;
      do
      {
        for (juint64_t j = 0; jj != v172; ++jj)
        {
          if (*(void *)v228 != v173) {
            objc_enumerationMutation(v162);
          }
          v175 = [*(id *)(*((void *)&v227 + 1) + 8 * jj) trackingID];
          [v160 addObject:v175];
        }
        uint64_t v172 = [(NSArray *)v162 countByEnumeratingWithState:&v227 objects:v278 count:16];
      }
      while (v172);
    }
    v170 = v210;
  }

  objc_storeStrong((id *)&v207->_updatedRegionIDs, v160);
  v176 = (NSArray *)(id)[v170 copy];
  v177 = v207->_addedRegionIDs;
  v207->_addedRegionIDs = v176;

  uint64_t v178 = [v161 copy];
  v179 = v207->_removedRegionIDs;
  v207->_removedRegionIDs = (NSArray *)v178;

  v180 = [v205 trackedRegions];
  uint64_t v181 = [v216 arrayByAddingObjectsFromArray:v180];
  v182 = v207->_trackedRegions;
  v207->_trackedRegions = (NSArray *)v181;

  v183 = [v205 regionTrackingGroups];
  uint64_t v184 = [(NSArray *)v226 arrayByAddingObjectsFromArray:v183];
  v185 = v207->_regionTrackingGroups;
  v207->_regionTrackingGroups = (NSArray *)v184;

  v186 = CROSLogForCategory(1);
  if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v187 = [(NSArray *)v207->_removedRegionIDs count];
    uint64_t v188 = [(NSArray *)v207->_addedRegionIDs count];
    *(_DWORD *)buf = 134218240;
    uint64_t v288 = v187;
    __int16 v289 = 2048;
    double v290 = *(double *)&v188;
    _os_log_impl(&dword_1DD733000, v186, OS_LOG_TYPE_DEFAULT, "Association: Removed %lu regions that were marked for replacement and added %lu new regions despite being below the error threshold", buf, 0x16u);
  }

  v76 = v211;
  v110 = v194;
  v77 = v214;
  updatedRegionIDs = v226;
LABEL_143:

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v189 = (id)CRSignpostLog_signPostOSLog;
  v190 = v189;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v189))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v190, OS_SIGNPOST_INTERVAL_END, spid, "OCRTrackingPerformAssociationTime", "", buf, 2u);
  }

LABEL_149:
  return v207;
}

- (void)markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:(BOOL)a3 ransacReprojError:(float)a4 markedQuadArea:(double)a5
{
  BOOL v38 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_regionTrackingGroups, "count"));
    uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_regionTrackingGroups, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = self->_regionTrackingGroups;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (v38)
          {
            v12 = [*(id *)(*((void *)&v41 + 1) + 8 * i) boundingQuadAtOCRDispatch];
            objc_super v13 = [v12 denormalizedQuad];
          }
          else
          {
            objc_super v13 = [v11 boundingQuadAfterOCR];
          }
          v14 = [CRVCQuad alloc];
          v15 = [MEMORY[0x1E4F29128] UUID];
          double v16 = [(CRVCQuad *)v14 initWithImageSpaceQuad:v13 uuid:v15];

          [v40 addObject:v16];
          v17 = [v11 boundingQuad];
          v18 = [v17 denormalizedQuad];

          id v19 = [CRVCQuad alloc];
          uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v21 = [(CRVCQuad *)v19 initWithImageSpaceQuad:v18 uuid:v20];

          [v39 addObject:v21];
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v8);
    }

    *(float *)&double v22 = a4;
    v23 = [MEMORY[0x1E4FB3F38] quadsConformHomographySrcQuads:v40 destQuads:v39 reprojError:v22];
    if ([(NSArray *)self->_regionTrackingGroups count])
    {
      uint64_t v24 = 0;
      while (1)
      {
        id v25 = [v23 objectAtIndexedSubscript:v24];
        if ([v25 isEqual:&unk_1F39331A8]) {
          break;
        }
        uint64_t v26 = [v23 objectAtIndexedSubscript:v24];
        char v27 = [v26 isEqual:&unk_1F39331C0];

        if (v27) {
          goto LABEL_17;
        }
        v34 = [(NSArray *)self->_regionTrackingGroups objectAtIndexedSubscript:v24];
        [v34 setTrackNeedsReplacement:1];

        v33 = [(NSArray *)self->_regionTrackingGroups objectAtIndexedSubscript:v24];
        uint64_t v35 = [v33 boundingQuad];
        v36 = [v35 denormalizedQuad];
        [v36 area];

LABEL_21:
        if ([(NSArray *)self->_regionTrackingGroups count] <= ++v24) {
          goto LABEL_22;
        }
      }

LABEL_17:
      uint64_t v28 = [(NSArray *)self->_regionTrackingGroups objectAtIndexedSubscript:v24];
      int v29 = [v28 trackNeedsReplacement];

      if (v29)
      {
        uint64_t v30 = [(NSArray *)self->_regionTrackingGroups objectAtIndexedSubscript:v24];
        uint64_t v31 = [v30 boundingQuad];
        v32 = [v31 denormalizedQuad];
        [v32 area];
      }
      v33 = [(NSArray *)self->_regionTrackingGroups objectAtIndexedSubscript:v24];
      [v33 setTrackNeedsReplacement:0];
      goto LABEL_21;
    }
LABEL_22:
  }
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 setSignificantTranscriptChange:1];
  if (+[CRTrackingFilter shouldStartTrackingRegion:v5])
  {
    if (![*(id *)(a1 + 80) count]) {
      goto LABEL_8;
    }
    unint64_t v6 = 0;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v32 = *MEMORY[0x1E4F14998];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    float v7 = 3.4028e38;
    do
    {
      uint64_t v8 = objc_msgSend(v5, "boundingQuad", v28, v30, v32);
      uint64_t v9 = [v8 denormalizedQuad];
      v10 = [*(id *)(a1 + 88) regionTrackingGroups];
      id v11 = [v10 objectAtIndexedSubscript:v6];
      v12 = [v11 boundingQuadAtOCRDispatch];
      objc_super v13 = [v12 denormalizedQuad];
      [v9 shortestDistanceFromCornersOfQuad:v13];
      float v15 = v14;

      if (v7 > v15)
      {
        double v16 = [*(id *)(a1 + 88) regionTrackingGroups];
        v17 = [v16 objectAtIndexedSubscript:v6];
        [v17 boundingQuadHomographySinceOCRDispatch];
        long long v30 = v19;
        long long v32 = v18;
        long long v28 = v20;

        float v7 = v15;
        if (v15 == 0.0) {
          break;
        }
      }
      ++v6;
      float v15 = v7;
    }
    while (objc_msgSend(*(id *)(a1 + 80), "count", v28, v30, v32) > v6);
    if (v15 == 3.4028e38)
    {
LABEL_8:
      long long v30 = *(_OWORD *)(a1 + 48);
      long long v32 = *(_OWORD *)(a1 + 32);
      long long v28 = *(_OWORD *)(a1 + 64);
    }
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = &v38;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    uint64_t v21 = objc_msgSend(v5, "boundingQuad", v28, v30, v32);
    double v22 = [v21 denormalizedQuad];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_19;
    v35[3] = &unk_1E6CDC080;
    uint64_t v37 = &v38;
    id v23 = v22;
    id v36 = v23;
    LODWORD(v24) = 4.0;
    objc_msgSend(v5, "applyHomographyTransform:downscaleRate:shouldApply:", v35, v33, v31, v29, v24);
    if (*(unsigned char *)(*((void *)&v38 + 1) + 24))
    {
      id v25 = CROSLogForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v25, OS_LOG_TYPE_DEFAULT, "Association: - filterNewR HG", buf, 2u);
      }

      *a3 = 0;
    }

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    uint64_t v26 = CROSLogForCategory(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      [v5 activationProbability];
      LODWORD(v38) = 134217984;
      *(void *)((char *)&v38 + 4) = v27;
      _os_log_impl(&dword_1DD733000, v26, OS_LOG_TYPE_DEFAULT, "Association: - filterNewR activationProb=%f", (uint8_t *)&v38, 0xCu);
    }

    *a3 = 0;
  }
}

BOOL __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_19(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", a2, *(void *)(a1 + 32));
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_20(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v10 = v8;
  if (v7)
  {
    if (qword_1EB58CDF8 != -1) {
      dispatch_once(&qword_1EB58CDF8, &__block_literal_global_37);
    }
    id v11 = [v9 text];
    v12 = [v11 lowercaseString];
    objc_super v13 = [v12 _crStringByReplacingCharactersInSet:_MergedGlobals_33 withString:&stru_1F38EED68];

    double v14 = [v10 text];
    float v15 = [v14 lowercaseString];
    double v16 = [v15 _crStringByReplacingCharactersInSet:_MergedGlobals_33 withString:&stru_1F38EED68];

    uint64_t v17 = [v13 isEqualToString:v16] ^ 1;
  }
  else
  {
    uint64_t v17 = 0;
  }

  [v10 setSignificantTranscriptChange:v17];
  [v9 boundingQuadHomographySinceOCRDispatch];
  double v23 = v19;
  double v24 = v18;
  double v22 = v20;

  LODWORD(v21) = 4.0;
  objc_msgSend(v10, "applyHomographyTransform:downscaleRate:shouldApply:", &__block_literal_global_22_0, v24, v23, v22, v21);

  *a4 = *(unsigned char *)(a1 + 40) ^ 1;
}

uint64_t __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_2()
{
  return 1;
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_26(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (+[CRTrackingFilter shouldStartTrackingGroup:v4])
  {
    id v5 = [v4 boundingQuad];
    [v5 normalizationSize];
    double v7 = v6;
    double v9 = v8;

    id v10 = [v4 boundingQuad];
    id v11 = [v10 denormalizedQuad];
    char v12 = objc_msgSend(v11, "intersectsImageMargin:imageSize:", fmin(v7, v9) * 0.0399999991, v7, v9);

    if ((v12 & 1) == 0)
    {
      objc_super v13 = [v4 estimatedPerspectiveQuad];
      if (v13)
      {
        double v14 = [v4 boundingQuad];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          double v16 = [v13 denormalizedQuad];
          [v16 orthogonalityScore];
          objc_msgSend(v4, "setInitialOrthogonalityScore:");

          [v4 initialOrthogonalityScore];
          if (v17 < 0.300000012)
          {
            double v18 = CROSLogForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              [v4 initialOrthogonalityScore];
              int v21 = 134217984;
              uint64_t v22 = v19;
              _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_DEFAULT, "Association: - filterNewG orthogonalityScore=%f", (uint8_t *)&v21, 0xCu);
            }

            *a3 = 0;
          }
        }
      }
    }
  }
  else
  {
    double v20 = CROSLogForCategory(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEFAULT, "Association: - filterNewG", (uint8_t *)&v21, 2u);
    }

    *a3 = 0;
  }
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_29(uint64_t a1, void *a2, void *a3, unsigned __int8 *a4)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [v7 lastOriginalBoundingQuadUpdateTime];
  if (Current - v10 > 120.0)
  {
    id v11 = CROSLogForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_DEFAULT, "Association: - replaceG timeout", buf, 2u);
    }

    *a4 = 0;
  }
  char v12 = [v8 boundingQuad];
  [v12 normalizationSize];
  double v14 = v13;
  double v16 = v15;

  double v17 = [v8 boundingQuad];
  double v18 = [v17 denormalizedQuad];
  char v19 = objc_msgSend(v18, "intersectsImageMargin:imageSize:", fmin(v14, v16) * 0.0399999991, v14, v16);

  double v20 = [v7 boundingQuadAtOCRDispatch];
  int v21 = [v20 denormalizedQuad];
  [v21 area];
  double v23 = v22 * 0.930000007;
  double v24 = [v7 boundingQuad];
  id v25 = [v24 denormalizedQuad];
  [v25 area];
  BOOL v27 = v23 > v26;
  if (v23 <= v26)
  {

    double v33 = 0;
  }
  else
  {
    long long v28 = a4;
    uint64_t v29 = a1;
    v70 = v28;
    int v30 = *v28;

    char v31 = v19;
    if (v30) {
      char v32 = v19;
    }
    else {
      char v32 = 1;
    }
    if (v32)
    {
      double v33 = 0;
      BOOL v27 = 0;
LABEL_22:
      a1 = v29;
      a4 = v70;
      goto LABEL_23;
    }
    double v33 = [v7 estimatedPerspectiveQuad];
    v34 = [v33 denormalizedQuad];
    [v34 orthogonalityScore];
    double v36 = v35;

    BOOL v38 = v36 <= 0.899999976 || v33 == 0;
    if (v33 && v38)
    {
      BOOL v27 = 1;
      goto LABEL_22;
    }
    uint64_t v60 = CROSLogForCategory(1);
    a1 = v29;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v61 = [v7 boundingQuad];
      v69 = [v61 denormalizedQuad];
      [v69 area];
      double v63 = v62;
      id v64 = [v7 boundingQuadAtOCRDispatch];
      uint64_t v65 = [v64 denormalizedQuad];
      [v65 area];
      *(_DWORD *)buf = 134218240;
      double v72 = v36;
      __int16 v73 = 2048;
      double v74 = v63 / v66;
      _os_log_impl(&dword_1DD733000, v60, OS_LOG_TYPE_DEFAULT, "Association: - replaceG orthogonalityScore=%f areaRatio=%f", buf, 0x16u);
    }
    a4 = v70;
    unsigned __int8 *v70 = 0;
    uint64_t v67 = [v7 homographyGroupID];

    char v19 = v31;
    if (!v67)
    {
      BOOL v27 = 1;
      goto LABEL_23;
    }
    double v68 = *(void **)(a1 + 32);
    double v20 = [v7 homographyGroupID];
    [v68 addObject:v20];
  }

LABEL_23:
  [v7 initialOrthogonalityScore];
  if (v39 < 0.800000012)
  {
    char v40 = *a4 ? v19 : 1;
    if ((v40 & 1) == 0)
    {
      if (!v27)
      {
        uint64_t v41 = [v8 estimatedPerspectiveQuad];

        double v33 = (void *)v41;
      }
      if (v33)
      {
        long long v42 = [v8 boundingQuad];
        char v43 = [v33 isEqual:v42];

        if ((v43 & 1) == 0)
        {
          long long v44 = [v33 denormalizedQuad];
          [v44 orthogonalityScore];
          double v46 = v45;

          if (v46 > 0.800000012)
          {
            v47 = CROSLogForCategory(1);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              [v7 initialOrthogonalityScore];
              *(_DWORD *)buf = 134218240;
              double v72 = v48;
              __int16 v73 = 2048;
              double v74 = v46;
              _os_log_impl(&dword_1DD733000, v47, OS_LOG_TYPE_DEFAULT, "Association: - replaceG initialOrthogonalityScore=%f orthogonalityScore=%f", buf, 0x16u);
            }

            [v7 setInitialOrthogonalityScore:v46];
            *a4 = 0;
            v49 = [v7 homographyGroupID];

            if (v49)
            {
              v50 = *(void **)(a1 + 32);
              id v51 = [v7 homographyGroupID];
              [v50 addObject:v51];
            }
          }
        }
      }
    }
  }
  if ([v7 trackNeedsReplacement])
  {
    *a4 = 0;
    [v7 setTrackNeedsReplacement:0];
  }
  if (*a4)
  {
    [v7 initialOrthogonalityScore];
    objc_msgSend(v8, "setInitialOrthogonalityScore:");
  }
  objc_msgSend(v8, "setTextAlignment:", objc_msgSend(v7, "textAlignment"));
  v52 = NSNumber;
  v53 = [v7 vcQuad];
  uint64_t v54 = objc_msgSend(v52, "numberWithInt:", objc_msgSend(v53, "homographyGroupID"));
  [v8 setHomographyGroupID:v54];

  v55 = [v7 vcQuad];
  uint64_t v56 = [v55 homographyGroupID];
  v57 = [v8 vcQuad];
  [v57 setHomographyGroupID:v56];

  uint64_t v58 = *(void **)(a1 + 40);
  v59 = [v7 trackingID];
  [v58 setObject:v8 forKeyedSubscript:v59];
}

void __82__CRImageReaderTrackingResult__significantTranscriptChangeBetweenRegion1_region2___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  id v4 = (id)[v0 mutableCopy];

  v1 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v4 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v2;
}

- (unint64_t)stabilityLevel
{
  return self->_stabilityLevel;
}

- (NSArray)trackedRegions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrackedRegions:(id)a3
{
}

- (NSArray)updatedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedRegionIDs:(id)a3
{
}

- (NSArray)addedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)removedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemovedRegionIDs:(id)a3
{
}

- (NSArray)regionTrackingGroups
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegionTrackingGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionTrackingGroups, 0);
  objc_storeStrong((id *)&self->_removedRegionIDs, 0);
  objc_storeStrong((id *)&self->_addedRegionIDs, 0);
  objc_storeStrong((id *)&self->_updatedRegionIDs, 0);
  objc_storeStrong((id *)&self->_trackedRegions, 0);
}

@end