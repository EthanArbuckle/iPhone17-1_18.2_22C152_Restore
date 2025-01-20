@interface CRHungarianTrackingAssociator
+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8;
@end

@implementation CRHungarianTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  BOOL v172 = a4;
  v212[16] = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  id v167 = a5;
  id v152 = a6;
  v156 = (void (**)(id, void *, void *))a7;
  v155 = (char *)a8;
  v169 = [MEMORY[0x1E4F1CA48] array];
  v154 = [MEMORY[0x1E4F1CA48] array];
  v159 = [MEMORY[0x1E4F1CA48] array];
  v168 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2050000000;
  v12 = (void *)_MergedGlobals_23;
  uint64_t v205 = _MergedGlobals_23;
  if (!_MergedGlobals_23)
  {
    v201[0] = MEMORY[0x1E4F143A8];
    v201[1] = 3221225472;
    v201[2] = __getFTBipartiteMatcherClass_block_invoke;
    v201[3] = &unk_1E6CDBAF8;
    v201[4] = &v202;
    __getFTBipartiteMatcherClass_block_invoke((uint64_t)v201);
    v12 = (void *)v203[3];
  }
  v13 = v12;
  _Block_object_dispose(&v202, 8);
  id v153 = objc_alloc_init(v13);
  [v167 count];
  uint64_t v14 = [v160 count];
  uint64_t v151 = (uint64_t)&v151;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v151 - v15;
  if ([v160 count])
  {
    unint64_t v17 = 0;
    do
    {
      v18 = [v160 objectAtIndexedSubscript:v17];
      if ([v167 count])
      {
        unint64_t v19 = 0;
        do
        {
          v20 = [v167 objectAtIndexedSubscript:v19];
          v21 = v20;
          if (v172) {
            [v20 boundingQuadAtOCRDispatch];
          }
          else {
          v22 = [v20 boundingQuad];
          }
          v23 = [v18 boundingQuad];
          [v22 boundingBoxClippedIOUWithQuad:v23];
          double v25 = v24;

          uint64_t v26 = [v167 count];
          float v27 = 1.0 - v25;
          *(float *)&v16[4 * v19 + 4 * v17 * v26] = v27;

          ++v19;
        }
        while (v19 < [v167 count]);
      }

      ++v17;
    }
    while (v17 < [v160 count]);
  }
  if ([v160 count])
  {
    uint64_t v28 = [v160 count];
    uint64_t v29 = [v167 count];
    id v161 = [v153 computeMatchingForCostMatrix:v16 withRowCount:v28 columnCount:v29];
  }
  else
  {
    id v161 = 0;
  }
  id v164 = (id)objc_opt_new();
  id v163 = (id)objc_opt_new();
  double v30 = 0.0;
  if (v161 && [v161 count])
  {
    unint64_t v31 = 0;
    id v162 = v155 + 16;
    do
    {
      v32 = [v160 objectAtIndexedSubscript:v31];
      v33 = [v161 objectAtIndexedSubscript:v31];
      int v34 = [v33 isEqual:&unk_1F3933100];

      if (v34)
      {
        v35 = [MEMORY[0x1E4F29128] UUID];
        [v32 setTrackingID:v35];

        LOBYTE(v201[0]) = 1;
        v156[2](v156, v32, v201);
        if (LOBYTE(v201[0]))
        {
          v36 = [v32 trackingID];
          [v168 addObject:v36];

          [v169 addObject:v32];
          [v164 addObject:v32];
          v37 = [v32 boundingQuad];
          v38 = [v37 denormalizedQuad];
          [v38 area];
          double v40 = v39;

          double v30 = v30 + v40;
        }
      }
      else
      {
        uint64_t v41 = [v167 count];
        v42 = [v161 objectAtIndexedSubscript:v31];
        BOOL v43 = *(float *)&v16[4 * v41 * v31 + 4 * (int)[v42 intValue]] < 0.55;

        v44 = [v161 objectAtIndexedSubscript:v31];
        int v45 = [v44 intValue];
        id v171 = [v167 objectAtIndexedSubscript:v45];

        if (v43)
        {
          v46 = [v171 trackingID];
          [v32 setTrackingID:v46];

          LOBYTE(v201[0]) = 1;
          (*((void (**)(char *, id, void *, void *))v155 + 2))(v155, v171, v32, v201);
          if (!LOBYTE(v201[0]))
          {
            v47 = [v32 originalBoundingQuad];
            [v171 setOriginalBoundingQuad:v47];

            v48 = [v32 boundingQuad];
            [v171 setBoundingQuad:v48];

            [v32 boundingQuadHomography];
            long long v50 = v49;
            HIDWORD(v50) = HIDWORD(v165);
            HIDWORD(v51) = HIDWORD(v166);
            HIDWORD(v52) = HIDWORD(v170);
            long long v165 = v50;
            long long v166 = v51;
            long long v170 = v52;
            [v171 setBoundingQuadHomography:*(double *)&v49];
          }
          v53 = [v171 trackingID];
          [v154 addObject:v53];

          [v169 addObject:v171];
          uint64_t v54 = [v167 count];
          v55 = [v161 objectAtIndexedSubscript:v31];
          float v56 = *(float *)&v16[4 * v54 * v31 + 4 * (int)[v55 intValue]];
          v57 = [v171 boundingQuad];
          v58 = [v57 denormalizedQuad];
          [v58 area];
          double v60 = v59;
          v61 = [v32 boundingQuad];
          v62 = [v61 denormalizedQuad];
          [v62 area];
          double v64 = v63;
        }
        else
        {
          v65 = [MEMORY[0x1E4F29128] UUID];
          [v32 setTrackingID:v65];

          LOBYTE(v201[0]) = 1;
          v156[2](v156, v32, v201);
          if (LOBYTE(v201[0]))
          {
            [v164 addObject:v32];
            v66 = [v32 trackingID];
            [v168 addObject:v66];

            [v169 addObject:v32];
          }
          [v163 addObject:v171];
          v67 = [v171 trackingID];
          [v159 addObject:v67];

          uint64_t v68 = [v167 count];
          v69 = [v161 objectAtIndexedSubscript:v31];
          float v56 = *(float *)&v16[4 * v68 * v31 + 4 * (int)[v69 intValue]];
          v70 = [v171 boundingQuad];
          v71 = [v70 denormalizedQuad];
          [v71 area];
          double v60 = v72;
          v73 = [v32 boundingQuad];
          v74 = [v73 denormalizedQuad];
          [v74 area];
          double v64 = v75;
        }
        double v30 = v30 + (v60 + v64) * v56 * 0.5;
      }

      ++v31;
    }
    while (v31 < [v161 count]);
  }
  if ([v167 count])
  {
    unint64_t v76 = 0;
    do
    {
      v77 = [NSNumber numberWithUnsignedInteger:v76];
      char v78 = [v161 containsObject:v77];

      if ((v78 & 1) == 0)
      {
        v79 = [v167 objectAtIndexedSubscript:v76];
        v80 = [v79 trackingID];
        [v159 addObject:v80];

        v81 = [v167 objectAtIndexedSubscript:v76];
        v82 = [v81 boundingQuad];
        v83 = [v82 denormalizedQuad];
        [v83 area];
        double v85 = v84;

        double v30 = v30 + v85;
      }
      ++v76;
    }
    while (v76 < [v167 count]);
  }
  id v158 = (id)objc_opt_new();
  id v157 = (id)objc_opt_new();
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  *(void *)&long long v165 = v163;
  id v163 = (id)[(id)v165 countByEnumeratingWithState:&v197 objects:v212 count:16];
  if (v163)
  {
    id v162 = *(id *)v198;
    do
    {
      *(void *)&long long v166 = 0;
      do
      {
        if (*(id *)v198 != v162) {
          objc_enumerationMutation((id)v165);
        }
        id v171 = *(id *)(*((void *)&v197 + 1) + 8 * v166);
        *(void *)&long long v170 = objc_opt_new();
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id v86 = v164;
        v87 = 0;
        uint64_t v88 = [v86 countByEnumeratingWithState:&v193 objects:v211 count:16];
        if (v88)
        {
          uint64_t v89 = *(void *)v194;
          do
          {
            for (uint64_t i = 0; i != v88; ++i)
            {
              if (*(void *)v194 != v89) {
                objc_enumerationMutation(v86);
              }
              v91 = *(void **)(*((void *)&v193 + 1) + 8 * i);
              if (v172) {
                [v171 boundingQuadAtOCRDispatch];
              }
              else {
              v92 = [v171 boundingQuad];
              }
              v93 = [v91 boundingQuad];
              int v94 = [v92 overlapsNormalizedQuad:v93];

              if (v94)
              {
                [(id)v170 addObject:v91];
                uint64_t v95 = [v91 boundingQuad];
                v96 = (void *)v95;
                if (v87)
                {
                  [v87 baselineAngle];
                  *(float *)&double v97 = v97;
                  uint64_t v98 = [v87 unionWithNormalizedQuad:v96 baselineAngle:v97];

                  v87 = (void *)v98;
                }
                else
                {
                  v87 = (void *)v95;
                }
              }
            }
            uint64_t v88 = [v86 countByEnumeratingWithState:&v193 objects:v211 count:16];
          }
          while (v88);
        }

        if ((unint64_t)[(id)v170 count] >= 2)
        {
          v99 = [v171 boundingQuad];
          [v99 boundingBoxClippedIOUWithQuad:v87];
          double v101 = v100;

          if (1.0 - v101 <= 0.550000012)
          {
            v102 = objc_msgSend(v171, "boundingQuad", 1.0 - v101);
            v103 = [v102 denormalizedQuad];
            [v103 area];
            double v105 = v104;

            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            id v106 = (id)v170;
            uint64_t v107 = [v106 countByEnumeratingWithState:&v189 objects:v210 count:16];
            double v30 = v30 - v105;
            if (v107)
            {
              uint64_t v108 = *(void *)v190;
              do
              {
                for (uint64_t j = 0; j != v107; ++j)
                {
                  if (*(void *)v190 != v108) {
                    objc_enumerationMutation(v106);
                  }
                  v110 = [*(id *)(*((void *)&v189 + 1) + 8 * j) boundingQuad];
                  v111 = [v110 denormalizedQuad];
                  [v111 area];
                  double v113 = v112;

                  double v30 = v30 - v113;
                }
                uint64_t v107 = [v106 countByEnumeratingWithState:&v189 objects:v210 count:16];
              }
              while (v107);
            }

            [v158 addObject:v171];
            [v169 addObject:v171];
            [v157 addObjectsFromArray:v106];
            v114 = [v171 trackingID];
            [v159 removeObject:v114];

            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            id v115 = v106;
            uint64_t v116 = [v115 countByEnumeratingWithState:&v185 objects:v209 count:16];
            if (v116)
            {
              uint64_t v117 = *(void *)v186;
              do
              {
                for (uint64_t k = 0; k != v116; ++k)
                {
                  if (*(void *)v186 != v117) {
                    objc_enumerationMutation(v115);
                  }
                  v119 = *(void **)(*((void *)&v185 + 1) + 8 * k);
                  [v169 removeObject:v119];
                  v120 = [v119 trackingID];
                  [v168 removeObject:v120];
                }
                uint64_t v116 = [v115 countByEnumeratingWithState:&v185 objects:v209 count:16];
              }
              while (v116);
            }
          }
        }

        *(void *)&long long v166 = v166 + 1;
      }
      while ((id)v166 != v163);
      id v163 = (id)[(id)v165 countByEnumeratingWithState:&v197 objects:v212 count:16];
    }
    while (v163);
  }

  [(id)v165 removeObjectsInArray:v158];
  [v164 removeObjectsInArray:v157];
  [v158 removeAllObjects];
  [v157 removeAllObjects];
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v162 = v164;
  id v164 = (id)[v162 countByEnumeratingWithState:&v181 objects:v208 count:16];
  if (v164)
  {
    id v163 = *(id *)v182;
    do
    {
      *(void *)&long long v166 = 0;
      do
      {
        if (*(id *)v182 != v163) {
          objc_enumerationMutation(v162);
        }
        id v171 = *(id *)(*((void *)&v181 + 1) + 8 * v166);
        *(void *)&long long v170 = objc_opt_new();
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        id v121 = (id)v165;
        v122 = 0;
        uint64_t v123 = [v121 countByEnumeratingWithState:&v177 objects:v207 count:16];
        if (v123)
        {
          uint64_t v124 = *(void *)v178;
          do
          {
            for (uint64_t m = 0; m != v123; ++m)
            {
              if (*(void *)v178 != v124) {
                objc_enumerationMutation(v121);
              }
              v126 = *(void **)(*((void *)&v177 + 1) + 8 * m);
              if (v172) {
                [*(id *)(*((void *)&v177 + 1) + 8 * m) boundingQuadAtOCRDispatch];
              }
              else {
              v127 = [*(id *)(*((void *)&v177 + 1) + 8 * m) boundingQuad];
              }
              v128 = [v171 boundingQuad];
              int v129 = [v127 overlapsNormalizedQuad:v128];

              if (v129)
              {
                [(id)v170 addObject:v126];
                if (v122)
                {
                  [v122 baselineAngle];
                  *(float *)&double v130 = v130;
                  uint64_t v131 = [v122 unionWithNormalizedQuad:v127 baselineAngle:v130];

                  v122 = (void *)v131;
                }
                else
                {
                  v122 = [v126 boundingQuad];
                }
              }
            }
            uint64_t v123 = [v121 countByEnumeratingWithState:&v177 objects:v207 count:16];
          }
          while (v123);
        }

        if ((unint64_t)[(id)v170 count] >= 2)
        {
          v132 = [v171 boundingQuad];
          [v132 boundingBoxClippedIOUWithQuad:v122];
          double v134 = v133;

          if (1.0 - v134 <= 0.550000012)
          {
            v135 = objc_msgSend(v171, "boundingQuad", 1.0 - v134);
            v136 = [v135 denormalizedQuad];
            [v136 area];
            double v138 = v137;

            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            id v139 = (id)v170;
            uint64_t v140 = [v139 countByEnumeratingWithState:&v173 objects:v206 count:16];
            double v30 = v30 - v138;
            if (v140)
            {
              uint64_t v141 = *(void *)v174;
              do
              {
                for (uint64_t n = 0; n != v140; ++n)
                {
                  if (*(void *)v174 != v141) {
                    objc_enumerationMutation(v139);
                  }
                  v143 = [*(id *)(*((void *)&v173 + 1) + 8 * n) boundingQuad];
                  v144 = [v143 denormalizedQuad];
                  [v144 area];
                  double v146 = v145;

                  double v30 = v30 - v146;
                }
                uint64_t v140 = [v139 countByEnumeratingWithState:&v173 objects:v206 count:16];
              }
              while (v140);
            }

            [v169 addObjectsFromArray:v139];
            [v159 removeObjectsInArray:v139];
            [v169 removeObject:v171];
            v147 = [v171 trackingID];
            [v168 removeObject:v147];
          }
        }

        *(void *)&long long v166 = v166 + 1;
      }
      while ((id)v166 != v164);
      id v164 = (id)[v162 countByEnumeratingWithState:&v181 objects:v208 count:16];
    }
    while (v164);
  }

  v148 = [CRTrackingAssociatorResults alloc];
  v149 = -[CRTrackingAssociatorResults initWithTotalError:tracked:updatedRegionIDs:removedRegionIDs:addedRegionIDs:](v148, v169, v154, v159, v168, v30);

  return v149;
}

@end