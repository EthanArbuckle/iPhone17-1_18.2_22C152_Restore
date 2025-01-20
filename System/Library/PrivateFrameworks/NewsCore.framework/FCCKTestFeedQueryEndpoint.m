@interface FCCKTestFeedQueryEndpoint
- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5;
@end

@implementation FCCKTestFeedQueryEndpoint

- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5
{
  uint64_t v301 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v172 = a5;
  v10 = [v8 query];
  objc_opt_class();
  v164 = v10;
  v11 = [v10 predicate];
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  v163 = v13;
  if (v13 && [v13 compoundPredicateType] == 1) {
    goto LABEL_11;
  }
  v14 = MEMORY[0x1E4F14500];
  id v15 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v159 = (id)[[NSString alloc] initWithFormat:@"unexpected feed query predicate type"];
    *(_DWORD *)buf = 136315906;
    v294 = "-[FCCKTestFeedQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    __int16 v295 = 2080;
    v296 = "FCCKTestContentDatabase.m";
    __int16 v297 = 1024;
    int v298 = 587;
    __int16 v299 = 2114;
    id v300 = v159;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (v13)
  {
LABEL_11:
    long long v279 = 0u;
    long long v278 = 0u;
    long long v277 = 0u;
    long long v276 = 0u;
    v16 = [v13 subpredicates];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v276 objects:v292 count:16];
    if (!v17)
    {
      v193 = 0;
      v194 = 0;
      v185 = 0;
      v188 = 0;
      v203 = 0;
      goto LABEL_39;
    }
    uint64_t v18 = v17;
    v193 = 0;
    v194 = 0;
    v185 = 0;
    v188 = 0;
    v203 = 0;
    uint64_t v19 = *(void *)v277;
    v212 = v16;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v277 != v19) {
          objc_enumerationMutation(v16);
        }
        v5 = *(void **)(*((void *)&v276 + 1) + 8 * i);
        objc_opt_class();
        if (!v5 || (objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = 0;
          goto LABEL_35;
        }
        id v21 = v5;
        uint64_t v22 = [v21 predicateOperatorType];
        if (v22 != 99)
        {
          if (v22 != 4) {
            goto LABEL_35;
          }
          v23 = [v21 leftExpression];
          v5 = [v23 keyPath];
          int v24 = [v5 isEqualToString:@"tagField"];

          if (!v24)
          {
LABEL_33:
            v16 = v212;
            goto LABEL_34;
          }
          v5 = [v21 rightExpression];
          uint64_t v25 = [v5 constantValue];
          v26 = v193;
          v193 = (void *)v25;
          goto LABEL_32;
        }
        v23 = [v21 rightExpression];
        if ([v23 expressionType] == 3)
        {
          v27 = [v23 keyPath];
          int v28 = [v27 isEqualToString:@"tagID"];

          if (v28)
          {
            v5 = [v21 leftExpression];
            uint64_t v29 = [v5 constantValue];
            v26 = v203;
            v203 = (void *)v29;
          }
          else
          {
            v30 = [v23 keyPath];
            int v31 = [v30 isEqualToString:@"cursor"];

            if (v31)
            {
              v5 = [v21 leftExpression];
              uint64_t v32 = [v5 constantValue];
              v26 = v194;
              v194 = (void *)v32;
            }
            else
            {
              v33 = [v23 keyPath];
              int v34 = [v33 isEqualToString:@"minOrder"];

              if (v34)
              {
                v5 = [v21 leftExpression];
                uint64_t v35 = [v5 constantValue];
                v26 = v188;
                v188 = (void *)v35;
              }
              else
              {
                v36 = [v23 keyPath];
                v5 = (void *)[v36 isEqualToString:@"hardLimit"];

                if (!v5) {
                  goto LABEL_33;
                }
                v5 = [v21 leftExpression];
                uint64_t v37 = [v5 constantValue];
                v26 = v185;
                v185 = (void *)v37;
              }
            }
          }
LABEL_32:
          v16 = v212;
        }
LABEL_34:

LABEL_35:
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v276 objects:v292 count:16];
      if (!v18)
      {
LABEL_39:

        v38 = v203;
        goto LABEL_41;
      }
    }
  }
  v193 = 0;
  v194 = 0;
  v185 = 0;
  v188 = 0;
  v38 = 0;
LABEL_41:
  v180 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v272 = 0u;
  long long v273 = 0u;
  long long v274 = 0u;
  long long v275 = 0u;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v272 objects:v291 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v273;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v273 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v272 + 1) + 8 * j);
        v45 = (void *)MEMORY[0x1E4F1CA48];
        v5 = FCSortedFeedItemRecordsForFeedID(v9, v44);
        v46 = [v45 arrayWithArray:v5];
        [v180 setObject:v46 forKeyedSubscript:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v272 objects:v291 count:16];
    }
    while (v41);
  }

  v269[0] = MEMORY[0x1E4F143A8];
  v269[1] = 3221225472;
  v269[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v269[3] = &unk_1E5B57F10;
  id v47 = v39;
  id v270 = v47;
  id v162 = v194;
  id v271 = v162;
  v171 = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke((uint64_t)v269);
  v266[0] = MEMORY[0x1E4F143A8];
  v266[1] = 3221225472;
  v266[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v266[3] = &unk_1E5B57F10;
  id v48 = v47;
  id v267 = v48;
  id v161 = v188;
  id v268 = v161;
  v187 = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2((uint64_t)v266);
  v263[0] = MEMORY[0x1E4F143A8];
  v263[1] = 3221225472;
  v263[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3;
  v263[3] = &unk_1E5B57F10;
  id v49 = v48;
  id v264 = v49;
  id v160 = v185;
  id v265 = v160;
  v186 = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3((uint64_t)v263);
  long long v259 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  long long v262 = 0u;
  obuint64_t j = v49;
  v50 = @"order";
  uint64_t v199 = [obj countByEnumeratingWithState:&v259 objects:v290 count:16];
  if (v199)
  {
    uint64_t v195 = *(void *)v260;
    do
    {
      for (id k = 0; k != (id)v199; id k = (char *)k + 1)
      {
        if (*(void *)v260 != v195) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = *(void *)(*((void *)&v259 + 1) + 8 * (void)k);
        v53 = objc_msgSend(v171, "objectForKeyedSubscript:", v52, v160, v161, v162, v163);
        if ([v53 length])
        {
          id v208 = k;
          v5 = [v180 objectForKeyedSubscript:v52];
          v204 = v53;
          v54 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v53 error:0];
          while ([v5 count])
          {
            v55 = [v5 firstObject];
            v56 = [v55 objectForKeyedSubscript:@"order"];
            v57 = [v54 order];
            if ([v56 compare:v57] == 1)
            {
            }
            else
            {
              v58 = [v5 firstObject];
              v59 = [v58 objectForKeyedSubscript:@"subOrder"];
              v60 = [v54 subOrder];
              uint64_t v213 = [v59 compare:v60];

              v50 = @"order";
              if (v213 != 1) {
                break;
              }
            }
            objc_msgSend(v5, "fc_removeFirstObject");
          }

          v53 = v204;
          id k = v208;
        }
      }
      uint64_t v199 = [obj countByEnumeratingWithState:&v259 objects:v290 count:16];
    }
    while (v199);
  }

  v179 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v255 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  id v166 = obj;
  uint64_t v61 = [v166 countByEnumeratingWithState:&v255 objects:v289 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    v5 = *(void **)v256;
    do
    {
      for (uint64_t m = 0; m != v62; ++m)
      {
        if (*(void **)v256 != v5) {
          objc_enumerationMutation(v166);
        }
        uint64_t v64 = *(void *)(*((void *)&v255 + 1) + 8 * m);
        v65 = objc_msgSend(v180, "objectForKeyedSubscript:", v64, v160);
        v66 = [v65 firstObject];

        uint64_t v67 = [v66 objectForKeyedSubscript:@"order"];
        v50 = (__CFString *)v67;
        if (v67) {
          v68 = (void *)v67;
        }
        else {
          v68 = &unk_1EF8D8088;
        }
        [v179 setObject:v68 forKeyedSubscript:v64];
      }
      uint64_t v62 = [v166 countByEnumeratingWithState:&v255 objects:v289 count:16];
    }
    while (v62);
  }

  v69 = [MEMORY[0x1E4F1CA48] array];
  v184 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v173 = *MEMORY[0x1E4F19CE8];
  v176 = v69;
  while (2)
  {
    unint64_t v70 = objc_msgSend(v69, "count", v160);
    if (v70 >= [v8 resultsLimit] && objc_msgSend(v8, "resultsLimit") != v173) {
      goto LABEL_108;
    }
    long long v253 = 0u;
    long long v254 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    id v71 = v180;
    uint64_t v205 = [v71 countByEnumeratingWithState:&v251 objects:v288 count:16];
    if (!v205) {
      goto LABEL_107;
    }
    id obja = 0;
    id v72 = 0;
    id v196 = v71;
    uint64_t v200 = *(void *)v252;
    do
    {
      uint64_t v73 = 0;
      do
      {
        v214 = v72;
        if (*(void *)v252 != v200) {
          objc_enumerationMutation(v71);
        }
        v74 = *(void **)(*((void *)&v251 + 1) + 8 * v73);
        v75 = [v71 objectForKeyedSubscript:v74];
        v76 = [v75 firstObject];

        v77 = [v187 objectForKeyedSubscript:v74];
        v78 = [v186 objectForKeyedSubscript:v74];
        if (!v76)
        {
          id v72 = v214;
          goto LABEL_100;
        }
        id v209 = v78;
        v79 = [v76 objectForKeyedSubscript:@"order"];
        if ([v79 compare:v77] == -1) {
          goto LABEL_93;
        }
        if (v214)
        {
          v5 = [v76 objectForKeyedSubscript:@"order"];
          v50 = [v214 objectForKeyedSubscript:@"order"];
          if ([v5 compare:v50] != 1)
          {

LABEL_93:
            goto LABEL_94;
          }
          if (![v209 unsignedLongLongValue])
          {

LABEL_95:
            goto LABEL_97;
          }
        }
        else if (![v209 unsignedLongLongValue])
        {
          goto LABEL_95;
        }
        unint64_t v80 = [v184 countForObject:v74];
        unint64_t v181 = [v209 unsignedLongLongValue];
        if (!v214)
        {

          if (v80 >= v181)
          {
            id v72 = 0;
            goto LABEL_98;
          }
LABEL_97:
          id v81 = v76;

          id v82 = v74;
          [v184 addObject:v82];
          id obja = v82;
          id v72 = v81;
LABEL_98:
          id v71 = v196;
          goto LABEL_99;
        }

        if (v80 < v181) {
          goto LABEL_97;
        }
LABEL_94:
        id v71 = v196;
        id v72 = v214;
LABEL_99:
        v78 = v209;
LABEL_100:

        ++v73;
      }
      while (v205 != v73);
      uint64_t v83 = [v71 countByEnumeratingWithState:&v251 objects:v288 count:16];
      uint64_t v205 = v83;
    }
    while (v83);

    if (obja)
    {
      v69 = v176;
      v84 = v72;
      [v176 addObject:v72];
      v85 = [v71 objectForKeyedSubscript:obja];
      objc_msgSend(v85, "fc_removeFirstObject");

      continue;
    }
    break;
  }
  id v71 = v72;
  v69 = v176;
LABEL_107:

LABEL_108:
  id v169 = [MEMORY[0x1E4F1CA48] array];
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  id v165 = v69;
  uint64_t v174 = [v165 countByEnumeratingWithState:&v247 objects:v287 count:16];
  if (v174)
  {
    uint64_t v167 = *(void *)v248;
    do
    {
      uint64_t v86 = 0;
      do
      {
        if (*(void *)v248 != v167) {
          objc_enumerationMutation(v165);
        }
        uint64_t v182 = v86;
        v87 = *(void **)(*((void *)&v247 + 1) + 8 * v86);
        v88 = [v87 objectForKeyedSubscript:@"articleID"];
        v245[0] = MEMORY[0x1E4F143A8];
        v245[1] = 3221225472;
        v245[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_174;
        v245[3] = &unk_1E5B4D118;
        id v177 = v88;
        id v246 = v177;
        v89 = objc_msgSend(v9, "fc_firstObjectPassingTest:", v245);
        v206 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"FeedItemAndArticle"];
        long long v241 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        long long v244 = 0u;
        v90 = [v87 changedKeys];
        uint64_t v91 = [v90 countByEnumeratingWithState:&v241 objects:v286 count:16];
        if (v91)
        {
          uint64_t v92 = v91;
          uint64_t v93 = *(void *)v242;
          do
          {
            for (uint64_t n = 0; n != v92; ++n)
            {
              if (*(void *)v242 != v93) {
                objc_enumerationMutation(v90);
              }
              uint64_t v95 = *(void *)(*((void *)&v241 + 1) + 8 * n);
              v96 = [v87 objectForKeyedSubscript:v95];
              if (v96) {
                [v206 setObject:v96 forKeyedSubscript:v95];
              }
            }
            uint64_t v92 = [v90 countByEnumeratingWithState:&v241 objects:v286 count:16];
          }
          while (v92);
        }

        long long v239 = 0u;
        long long v240 = 0u;
        long long v237 = 0u;
        long long v238 = 0u;
        id objb = [v89 changedKeys];
        uint64_t v201 = [objb countByEnumeratingWithState:&v237 objects:v285 count:16];
        if (v201)
        {
          uint64_t v197 = *(void *)v238;
          do
          {
            uint64_t v97 = 0;
            do
            {
              if (*(void *)v238 != v197) {
                objc_enumerationMutation(objb);
              }
              uint64_t v215 = v97;
              uint64_t v98 = *(void *)(*((void *)&v237 + 1) + 8 * v97);
              uint64_t v99 = [v89 objectForKeyedSubscript:v98];
              if (v99) {
                [v206 setObject:v99 forKeyedSubscript:v98];
              }
              id v210 = (id)v99;
              long long v235 = 0u;
              long long v236 = 0u;
              long long v233 = 0u;
              long long v234 = 0u;
              id v100 = v193;
              uint64_t v101 = [v100 countByEnumeratingWithState:&v233 objects:v284 count:16];
              if (v101)
              {
                uint64_t v102 = v101;
                uint64_t v103 = *(void *)v234;
                do
                {
                  for (iuint64_t i = 0; ii != v102; ++ii)
                  {
                    if (*(void *)v234 != v103) {
                      objc_enumerationMutation(v100);
                    }
                    v105 = [v89 objectForKeyedSubscript:*(void *)(*((void *)&v233 + 1) + 8 * ii)];
                    if (v105)
                    {
                      v106 = FCLookupRecordByName(v9, v105);
                      if (v106)
                      {
                        v107 = [v8 recordFetchedBlock];
                        ((void (**)(void, void *))v107)[2](v107, v106);
                      }
                    }
                  }
                  uint64_t v102 = [v100 countByEnumeratingWithState:&v233 objects:v284 count:16];
                }
                while (v102);
              }

              uint64_t v97 = v215 + 1;
            }
            while (v215 + 1 != v201);
            uint64_t v201 = [objb countByEnumeratingWithState:&v237 objects:v285 count:16];
          }
          while (v201);
        }

        v108 = [v8 desiredKeys];

        if (v108)
        {
          v109 = (void *)MEMORY[0x1E4F1CAD0];
          v110 = [v8 desiredKeys];
          v111 = [v109 setWithArray:v110];

          long long v231 = 0u;
          long long v232 = 0u;
          long long v229 = 0u;
          long long v230 = 0u;
          v112 = [v206 changedKeys];
          uint64_t v113 = [v112 countByEnumeratingWithState:&v229 objects:v283 count:16];
          if (v113)
          {
            uint64_t v114 = v113;
            uint64_t v115 = *(void *)v230;
            do
            {
              for (juint64_t j = 0; jj != v114; ++jj)
              {
                if (*(void *)v230 != v115) {
                  objc_enumerationMutation(v112);
                }
                uint64_t v117 = *(void *)(*((void *)&v229 + 1) + 8 * jj);
                if (([v111 containsObject:v117] & 1) == 0) {
                  [v206 setObject:0 forKeyedSubscript:v117];
                }
              }
              uint64_t v114 = [v112 countByEnumeratingWithState:&v229 objects:v283 count:16];
            }
            while (v114);
          }
        }
        [v206 setObject:v177 forKeyedSubscript:@"articleID"];
        v118 = [v89 recordChangeTag];
        [v206 setObject:v118 forKeyedSubscript:@"articleETag"];

        v119 = [v89 creationDate];
        [v206 setObject:v119 forKeyedSubscript:@"articleCreationDate"];

        v120 = [v89 modificationDate];
        [v206 setObject:v120 forKeyedSubscript:@"articleModDate"];

        [v169 addObject:v206];
        uint64_t v86 = v182 + 1;
      }
      while (v182 + 1 != v174);
      uint64_t v174 = [v165 countByEnumeratingWithState:&v247 objects:v287 count:16];
    }
    while (v174);
  }

  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id v121 = v169;
  uint64_t v122 = [v121 countByEnumeratingWithState:&v225 objects:v282 count:16];
  if (v122)
  {
    uint64_t v123 = v122;
    uint64_t v124 = *(void *)v226;
    do
    {
      for (kid k = 0; kk != v123; ++kk)
      {
        if (*(void *)v226 != v124) {
          objc_enumerationMutation(v121);
        }
        uint64_t v126 = *(void *)(*((void *)&v225 + 1) + 8 * kk);
        v127 = [v8 recordFetchedBlock];
        v127[2](v127, v126);
      }
      uint64_t v123 = [v121 countByEnumeratingWithState:&v225 objects:v282 count:16];
    }
    while (v123);
  }
  v168 = v121;

  v202 = [MEMORY[0x1E4F1CA48] array];
  v198 = [MEMORY[0x1E4F1CA48] array];
  id objc = [MEMORY[0x1E4F1CA48] array];
  v183 = [MEMORY[0x1E4F1CA48] array];
  v178 = [MEMORY[0x1E4F1CA48] array];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  id v170 = v166;
  v128 = v187;
  uint64_t v207 = [v170 countByEnumeratingWithState:&v221 objects:v281 count:16];
  if (v207)
  {
    uint64_t v175 = *(void *)v222;
    do
    {
      for (muint64_t m = 0; mm != v207; ++mm)
      {
        if (*(void *)v222 != v175) {
          objc_enumerationMutation(v170);
        }
        uint64_t v130 = *(void *)(*((void *)&v221 + 1) + 8 * mm);
        v131 = [v180 objectForKeyedSubscript:v130];
        v216 = [v179 objectForKeyedSubscript:v130];
        unsigned int v211 = [v172 containsObject:v130];
        if ([v131 count])
        {
          v132 = [v128 objectForKeyedSubscript:v130];
          v133 = [v131 firstObject];
          v134 = [v133 objectForKeyedSubscript:@"order"];
          BOOL v135 = [v134 compare:v132] == -1;

          BOOL v136 = [v131 count] == 0;
          v137 = objc_alloc_init(FCCKTestContentDatabaseFeedCursor);
          v138 = [v131 firstObject];
          v139 = [v138 objectForKeyedSubscript:@"order"];
          [(FCCKTestContentDatabaseFeedCursor *)v137 setOrder:v139];

          v140 = [v131 firstObject];
          v141 = [v140 objectForKeyedSubscript:@"subOrder"];
          [(FCCKTestContentDatabaseFeedCursor *)v137 setSubOrder:v141];

          v128 = v187;
          v142 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v137 requiringSecureCoding:1 error:0];
        }
        else
        {
          v142 = [MEMORY[0x1E4F1C9B8] data];
          BOOL v135 = 0;
          BOOL v136 = 1;
        }
        v143 = [NSNumber numberWithBool:v135];
        [v202 addObject:v143];

        v144 = [NSNumber numberWithBool:v136];
        [v198 addObject:v144];

        [v183 addObject:v216];
        [objc addObject:v142];
        v145 = [NSNumber numberWithBool:v211];
        [v178 addObject:v145];
      }
      uint64_t v207 = [v170 countByEnumeratingWithState:&v221 objects:v281 count:16];
    }
    while (v207);
  }

  v146 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Results"];
  [v146 setObject:v202 forKeyedSubscript:@"reachedMinOrder"];
  [v146 setObject:v198 forKeyedSubscript:@"reachedEnd"];
  [v146 setObject:objc forKeyedSubscript:@"cursor"];
  [v146 setObject:v183 forKeyedSubscript:@"topOrder"];
  [v146 setObject:v178 forKeyedSubscript:@"feedDropped"];
  v147 = [v8 desiredKeys];

  if (v147)
  {
    v148 = (void *)MEMORY[0x1E4F1CAD0];
    v149 = [v8 desiredKeys];
    v150 = [v148 setWithArray:v149];

    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    v151 = [v146 changedKeys];
    uint64_t v152 = [v151 countByEnumeratingWithState:&v217 objects:v280 count:16];
    if (v152)
    {
      uint64_t v153 = v152;
      uint64_t v154 = *(void *)v218;
      do
      {
        for (nuint64_t n = 0; nn != v153; ++nn)
        {
          if (*(void *)v218 != v154) {
            objc_enumerationMutation(v151);
          }
          uint64_t v156 = *(void *)(*((void *)&v217 + 1) + 8 * nn);
          if (([v150 containsObject:v156] & 1) == 0) {
            [v146 setObject:0 forKeyedSubscript:v156];
          }
        }
        uint64_t v153 = [v151 countByEnumeratingWithState:&v217 objects:v280 count:16];
      }
      while (v153);
    }

    v128 = v187;
  }
  v157 = [v8 recordFetchedBlock];
  ((void (**)(void, void *))v157)[2](v157, v146);

  v158 = [v8 queryCompletionBlock];
  v158[2](v158, 0, 0);
}

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      [v2 setObject:v7 forKeyedSubscript:v6];
    }
  }
  return v2;
}

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      [v2 setObject:v7 forKeyedSubscript:v6];
    }
  }
  return v2;
}

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      [v2 setObject:v7 forKeyedSubscript:v6];
    }
  }
  return v2;
}

uint64_t __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_174(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:@"Article"])
  {
    v5 = [v3 recordID];
    v6 = [v5 recordName];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end