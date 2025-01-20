@interface FCCKTestOrderFeedQueryEndpoint
- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5;
@end

@implementation FCCKTestOrderFeedQueryEndpoint

- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5
{
  uint64_t v299 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v173 = a5;
  v11 = [v9 query];
  objc_opt_class();
  v160 = v11;
  v12 = [v11 predicate];
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  v159 = v14;
  if (v14 && [v14 compoundPredicateType] == 1) {
    goto LABEL_11;
  }
  v15 = MEMORY[0x1E4F14500];
  id v16 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t m = (uint64_t)v14;
    id v155 = (id)[[NSString alloc] initWithFormat:@"unexpected feed query predicate type"];
    *(_DWORD *)buf = 136315906;
    v292 = "-[FCCKTestOrderFeedQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    __int16 v293 = 2080;
    v294 = "FCCKTestContentDatabase.m";
    __int16 v295 = 1024;
    int v296 = 910;
    __int16 v297 = 2114;
    id v298 = v155;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (v14)
  {
LABEL_11:
    long long v276 = 0u;
    long long v275 = 0u;
    long long v274 = 0u;
    long long v273 = 0u;
    v17 = [v14 subpredicates];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v273 objects:v290 count:16];
    if (!v18)
    {
      v189 = 0;
      v190 = 0;
      v182 = 0;
      v185 = 0;
      obuint64_t j = 0;
      goto LABEL_39;
    }
    uint64_t v19 = v18;
    v189 = 0;
    v190 = 0;
    v182 = 0;
    v185 = 0;
    obuint64_t j = 0;
    uint64_t m = *(void *)v274;
    v205 = v17;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v274 != m) {
          objc_enumerationMutation(v17);
        }
        v6 = *(void **)(*((void *)&v273 + 1) + 8 * i);
        objc_opt_class();
        if (!v6 || (objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = 0;
          goto LABEL_35;
        }
        id v21 = v6;
        uint64_t v22 = [v21 predicateOperatorType];
        if (v22 != 99)
        {
          if (v22 != 4) {
            goto LABEL_35;
          }
          v23 = [v21 leftExpression];
          v6 = [v23 keyPath];
          int v24 = [v6 isEqualToString:@"fetchFields"];

          if (!v24)
          {
LABEL_33:
            v17 = v205;
            goto LABEL_34;
          }
          v6 = [v21 rightExpression];
          uint64_t v25 = [v6 constantValue];
          v26 = v189;
          v189 = (void *)v25;
          goto LABEL_32;
        }
        v23 = [v21 rightExpression];
        if ([v23 expressionType] == 3)
        {
          v27 = [v23 keyPath];
          int v28 = [v27 isEqualToString:@"tagID"];

          if (v28)
          {
            v6 = [v21 leftExpression];
            uint64_t v29 = [v6 constantValue];
            v26 = obj;
            obuint64_t j = (id)v29;
          }
          else
          {
            v30 = [v23 keyPath];
            int v31 = [v30 isEqualToString:@"maxOrder"];

            if (v31)
            {
              v6 = [v21 leftExpression];
              uint64_t v32 = [v6 constantValue];
              v26 = v190;
              v190 = (void *)v32;
            }
            else
            {
              v33 = [v23 keyPath];
              int v34 = [v33 isEqualToString:@"minOrder"];

              if (v34)
              {
                v6 = [v21 leftExpression];
                uint64_t v35 = [v6 constantValue];
                v26 = v185;
                v185 = (void *)v35;
              }
              else
              {
                v36 = [v23 keyPath];
                v6 = (void *)[v36 isEqualToString:@"hardLimit"];

                if (!v6) {
                  goto LABEL_33;
                }
                v6 = [v21 leftExpression];
                uint64_t v37 = [v6 constantValue];
                v26 = v182;
                v182 = (void *)v37;
              }
            }
          }
LABEL_32:
          v17 = v205;
        }
LABEL_34:

LABEL_35:
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v273 objects:v290 count:16];
      if (!v19)
      {
LABEL_39:

        v38 = obj;
        goto LABEL_41;
      }
    }
  }
  v189 = 0;
  v190 = 0;
  v182 = 0;
  v185 = 0;
  v38 = 0;
LABEL_41:
  v174 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v269 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v269 objects:v289 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v270;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v270 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t m = *(void *)(*((void *)&v269 + 1) + 8 * j);
        v44 = (void *)MEMORY[0x1E4F1CA48];
        v6 = FCSortedFeedItemRecordsForFeedID(v10, (void *)m);
        v45 = [v44 arrayWithArray:v6];
        [v174 setObject:v45 forKeyedSubscript:m];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v269 objects:v289 count:16];
    }
    while (v41);
  }

  long long v268 = 0u;
  long long v267 = 0u;
  long long v266 = 0u;
  long long v265 = 0u;
  id v46 = v39;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v265 objects:v288 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    v6 = *(void **)v266;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void **)v266 != v6) {
          objc_enumerationMutation(v46);
        }
        uint64_t v50 = *(void *)(*((void *)&v265 + 1) + 8 * k);
        uint64_t m = [v174 objectForKeyedSubscript:v50];
        if ([v173 containsObject:v50]) {
          id v51 = (id)objc_msgSend((id)m, "fc_popLastObject");
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v265 objects:v288 count:16];
    }
    while (v48);
  }

  v262[0] = MEMORY[0x1E4F143A8];
  v262[1] = 3221225472;
  v262[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v262[3] = &unk_1E5B57F10;
  id v52 = v46;
  id v263 = v52;
  id v158 = v190;
  id v264 = v158;
  v168 = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke((uint64_t)v262);
  v259[0] = MEMORY[0x1E4F143A8];
  v259[1] = 3221225472;
  v259[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v259[3] = &unk_1E5B57F10;
  id v53 = v52;
  id v260 = v53;
  id v157 = v185;
  id v261 = v157;
  v184 = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2((uint64_t)v259);
  v256[0] = MEMORY[0x1E4F143A8];
  v256[1] = 3221225472;
  v256[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3;
  v256[3] = &unk_1E5B57F10;
  id v54 = v53;
  id v257 = v54;
  id v156 = v182;
  id v258 = v156;
  v183 = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3((uint64_t)v256);
  long long v252 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  id obja = v54;
  uint64_t v206 = [obja countByEnumeratingWithState:&v252 objects:v287 count:16];
  if (v206)
  {
    uint64_t v202 = *(void *)v253;
    do
    {
      for (uint64_t m = 0; m != v206; ++m)
      {
        if (*(void *)v253 != v202) {
          objc_enumerationMutation(obja);
        }
        uint64_t v55 = *(void *)(*((void *)&v252 + 1) + 8 * m);
        v56 = objc_msgSend(v168, "objectForKeyedSubscript:", v55, v156, v157, v158, v159);
        v57 = [v174 objectForKeyedSubscript:v55];
        v6 = v57;
        while ([v57 count])
        {
          v58 = [v6 firstObject];
          v59 = [v58 objectForKeyedSubscript:@"order"];
          if ([v59 compare:v56] == 1)
          {
          }
          else
          {
            v60 = [v6 firstObject];
            v61 = [v60 objectForKeyedSubscript:@"subOrder"];
            uint64_t v62 = [v61 compare:v56];

            if (v62 != 1) {
              break;
            }
          }
          objc_msgSend(v6, "fc_removeFirstObject");
          v57 = v6;
        }
      }
      uint64_t v206 = [obja countByEnumeratingWithState:&v252 objects:v287 count:16];
    }
    while (v206);
  }

  v172 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  id v162 = obja;
  uint64_t v63 = [v162 countByEnumeratingWithState:&v248 objects:v286 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    v6 = *(void **)v249;
    do
    {
      for (uint64_t n = 0; n != v64; ++n)
      {
        if (*(void **)v249 != v6) {
          objc_enumerationMutation(v162);
        }
        uint64_t v66 = *(void *)(*((void *)&v248 + 1) + 8 * n);
        v67 = objc_msgSend(v174, "objectForKeyedSubscript:", v66, v156);
        v68 = [v67 firstObject];

        uint64_t v69 = [v68 objectForKeyedSubscript:@"order"];
        uint64_t m = v69;
        if (v69) {
          v70 = (void *)v69;
        }
        else {
          v70 = &unk_1EF8D8088;
        }
        [v172 setObject:v70 forKeyedSubscript:v66];
      }
      uint64_t v64 = [v162 countByEnumeratingWithState:&v248 objects:v286 count:16];
    }
    while (v64);
  }

  v71 = [MEMORY[0x1E4F1CA48] array];
  v175 = [MEMORY[0x1E4F28BD0] set];
  id v165 = (id)*MEMORY[0x1E4F19CE8];
  v169 = v71;
  while (2)
  {
    unint64_t v72 = objc_msgSend(v71, "count", v156);
    if (v72 >= [v9 resultsLimit] && (id)objc_msgSend(v9, "resultsLimit") != v165) {
      goto LABEL_115;
    }
    long long v246 = 0u;
    long long v247 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    id v73 = v174;
    uint64_t v191 = [v73 countByEnumeratingWithState:&v244 objects:v285 count:16];
    if (!v191) {
      goto LABEL_114;
    }
    v176 = 0;
    id v179 = v73;
    v194 = 0;
    id v186 = *(id *)v245;
    do
    {
      uint64_t v74 = 0;
      do
      {
        v203 = (void *)m;
        v207 = v6;
        if (*(id *)v245 != v186) {
          objc_enumerationMutation(v73);
        }
        v75 = *(void **)(*((void *)&v244 + 1) + 8 * v74);
        v76 = [v73 objectForKeyedSubscript:v75];
        v77 = [v76 firstObject];

        uint64_t v78 = [v184 objectForKeyedSubscript:v75];
        v79 = [v183 objectForKeyedSubscript:v75];
        id objb = (id)v78;
        if (!v77) {
          goto LABEL_106;
        }
        v80 = [v77 objectForKeyedSubscript:@"order"];
        if ([v80 compare:v78] == -1)
        {

          goto LABEL_95;
        }
        if (v194)
        {
          v6 = [v77 objectForKeyedSubscript:@"order"];
          uint64_t m = [v194 objectForKeyedSubscript:@"order"];
          if ([v6 compare:m] != 1)
          {

            goto LABEL_101;
          }
          v203 = (void *)m;
          v207 = v6;
          if (![v79 unsignedLongLongValue])
          {

LABEL_102:
            goto LABEL_104;
          }
        }
        else if (![v79 unsignedLongLongValue])
        {
          goto LABEL_102;
        }
        unint64_t v81 = [v175 countForObject:v75];
        unint64_t v82 = [v79 unsignedLongLongValue];
        if (v194)
        {

          id v73 = v179;
          if (v81 >= v82) {
            goto LABEL_106;
          }
          goto LABEL_105;
        }

        if (v81 >= v82)
        {
          v194 = 0;
LABEL_95:
          uint64_t m = (uint64_t)v203;
          v6 = v207;
LABEL_101:
          id v73 = v179;
          goto LABEL_107;
        }
LABEL_104:
        id v73 = v179;
LABEL_105:
        id v83 = v77;

        id v84 = v75;
        [v175 addObject:v84];
        v176 = v84;
        v194 = v83;
LABEL_106:
        uint64_t m = (uint64_t)v203;
        v6 = v207;
LABEL_107:

        ++v74;
      }
      while (v191 != v74);
      uint64_t v85 = [v73 countByEnumeratingWithState:&v244 objects:v285 count:16];
      uint64_t v191 = v85;
    }
    while (v85);

    if (v176)
    {
      v71 = v169;
      [v169 addObject:v194];
      v86 = [v73 objectForKeyedSubscript:v176];
      objc_msgSend(v86, "fc_removeFirstObject");

      continue;
    }
    break;
  }
  id v73 = v194;
  v71 = v169;
LABEL_114:

LABEL_115:
  id v166 = [MEMORY[0x1E4F1CA48] array];
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  id v161 = v71;
  uint64_t v170 = [v161 countByEnumeratingWithState:&v240 objects:v284 count:16];
  if (v170)
  {
    id v163 = *(id *)v241;
    do
    {
      uint64_t v87 = 0;
      do
      {
        if (*(id *)v241 != v163) {
          objc_enumerationMutation(v161);
        }
        uint64_t v180 = v87;
        v88 = *(void **)(*((void *)&v240 + 1) + 8 * v87);
        v89 = [v88 objectForKeyedSubscript:@"articleID"];
        v238[0] = MEMORY[0x1E4F143A8];
        v238[1] = 3221225472;
        v238[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_4;
        v238[3] = &unk_1E5B4D118;
        id v177 = v89;
        id v239 = v177;
        v90 = objc_msgSend(v10, "fc_firstObjectPassingTest:", v238);
        id objc = (id)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"FeedItemAndArticle"];
        long long v234 = 0u;
        long long v235 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        v91 = [v88 changedKeys];
        uint64_t v92 = [v91 countByEnumeratingWithState:&v234 objects:v283 count:16];
        if (v92)
        {
          uint64_t v93 = v92;
          uint64_t v94 = *(void *)v235;
          do
          {
            for (iuint64_t i = 0; ii != v93; ++ii)
            {
              if (*(void *)v235 != v94) {
                objc_enumerationMutation(v91);
              }
              uint64_t v96 = *(void *)(*((void *)&v234 + 1) + 8 * ii);
              v97 = [v88 objectForKeyedSubscript:v96];
              if (v97) {
                [objc setObject:v97 forKeyedSubscript:v96];
              }
            }
            uint64_t v93 = [v91 countByEnumeratingWithState:&v234 objects:v283 count:16];
          }
          while (v93);
        }

        long long v232 = 0u;
        long long v233 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        id v187 = [v90 changedKeys];
        uint64_t v195 = [v187 countByEnumeratingWithState:&v230 objects:v282 count:16];
        if (v195)
        {
          uint64_t v192 = *(void *)v231;
          do
          {
            uint64_t v98 = 0;
            do
            {
              if (*(void *)v231 != v192) {
                objc_enumerationMutation(v187);
              }
              uint64_t v208 = v98;
              uint64_t v99 = *(void *)(*((void *)&v230 + 1) + 8 * v98);
              uint64_t v100 = [v90 objectForKeyedSubscript:v99];
              if (v100) {
                [objc setObject:v100 forKeyedSubscript:v99];
              }
              v204 = (void *)v100;
              long long v228 = 0u;
              long long v229 = 0u;
              long long v226 = 0u;
              long long v227 = 0u;
              id v101 = v189;
              uint64_t v102 = [v101 countByEnumeratingWithState:&v226 objects:v281 count:16];
              if (v102)
              {
                uint64_t v103 = v102;
                uint64_t v104 = *(void *)v227;
                do
                {
                  for (juint64_t j = 0; jj != v103; ++jj)
                  {
                    if (*(void *)v227 != v104) {
                      objc_enumerationMutation(v101);
                    }
                    v106 = [v90 objectForKeyedSubscript:*(void *)(*((void *)&v226 + 1) + 8 * jj)];
                    if (v106)
                    {
                      v107 = FCLookupRecordByName(v10, v106);
                      if (v107)
                      {
                        v108 = [v9 recordFetchedBlock];
                        ((void (**)(void, void *))v108)[2](v108, v107);
                      }
                    }
                  }
                  uint64_t v103 = [v101 countByEnumeratingWithState:&v226 objects:v281 count:16];
                }
                while (v103);
              }

              uint64_t v98 = v208 + 1;
            }
            while (v208 + 1 != v195);
            uint64_t v195 = [v187 countByEnumeratingWithState:&v230 objects:v282 count:16];
          }
          while (v195);
        }

        v109 = [v9 desiredKeys];

        if (v109)
        {
          v110 = (void *)MEMORY[0x1E4F1CAD0];
          v111 = [v9 desiredKeys];
          v112 = [v110 setWithArray:v111];

          long long v224 = 0u;
          long long v225 = 0u;
          long long v222 = 0u;
          long long v223 = 0u;
          v113 = [objc changedKeys];
          uint64_t v114 = [v113 countByEnumeratingWithState:&v222 objects:v280 count:16];
          if (v114)
          {
            uint64_t v115 = v114;
            uint64_t v116 = *(void *)v223;
            do
            {
              for (kuint64_t k = 0; kk != v115; ++kk)
              {
                if (*(void *)v223 != v116) {
                  objc_enumerationMutation(v113);
                }
                uint64_t v118 = *(void *)(*((void *)&v222 + 1) + 8 * kk);
                if (([v112 containsObject:v118] & 1) == 0) {
                  [objc setObject:0 forKeyedSubscript:v118];
                }
              }
              uint64_t v115 = [v113 countByEnumeratingWithState:&v222 objects:v280 count:16];
            }
            while (v115);
          }
        }
        [objc setObject:v177 forKeyedSubscript:@"articleID"];
        v119 = [v90 recordChangeTag];
        [objc setObject:v119 forKeyedSubscript:@"articleETag"];

        v120 = [v90 creationDate];
        [objc setObject:v120 forKeyedSubscript:@"articleCreationDate"];

        v121 = [v90 modificationDate];
        [objc setObject:v121 forKeyedSubscript:@"articleModDate"];

        [v166 addObject:objc];
        uint64_t v87 = v180 + 1;
      }
      while (v180 + 1 != v170);
      uint64_t v170 = [v161 countByEnumeratingWithState:&v240 objects:v284 count:16];
    }
    while (v170);
  }

  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v167 = v166;
  uint64_t v122 = [v167 countByEnumeratingWithState:&v218 objects:v279 count:16];
  if (v122)
  {
    uint64_t v123 = v122;
    uint64_t v124 = *(void *)v219;
    do
    {
      for (muint64_t m = 0; mm != v123; ++mm)
      {
        if (*(void *)v219 != v124) {
          objc_enumerationMutation(v167);
        }
        uint64_t v126 = *(void *)(*((void *)&v218 + 1) + 8 * mm);
        v127 = [v9 recordFetchedBlock];
        v127[2](v127, v126);
      }
      uint64_t v123 = [v167 countByEnumeratingWithState:&v218 objects:v279 count:16];
    }
    while (v123);
  }

  v196 = [MEMORY[0x1E4F1CA48] array];
  v193 = [MEMORY[0x1E4F1CA48] array];
  id v188 = [MEMORY[0x1E4F1CA48] array];
  v181 = [MEMORY[0x1E4F1CA48] array];
  v178 = [MEMORY[0x1E4F1CA48] array];
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v164 = v162;
  id objd = (id)[v164 countByEnumeratingWithState:&v214 objects:v278 count:16];
  if (objd)
  {
    uint64_t v171 = *(void *)v215;
    do
    {
      for (nuint64_t n = 0; nn != objd; nuint64_t n = (char *)nn + 1)
      {
        if (*(void *)v215 != v171) {
          objc_enumerationMutation(v164);
        }
        uint64_t v129 = *(void *)(*((void *)&v214 + 1) + 8 * (void)nn);
        v130 = [v174 objectForKeyedSubscript:v129];
        v131 = [v172 objectForKeyedSubscript:v129];
        unsigned int v209 = [v173 containsObject:v129];
        if ([v130 count])
        {
          v132 = [v184 objectForKeyedSubscript:v129];
          v133 = [v130 firstObject];
          v134 = [v133 objectForKeyedSubscript:@"order"];
          BOOL v135 = [v134 compare:v132] == -1;

          BOOL v136 = [v130 count] == 0;
          v137 = [v130 firstObject];
          v138 = [v137 objectForKeyedSubscript:@"order"];
        }
        else
        {
          BOOL v135 = 0;
          BOOL v136 = 1;
          v138 = &unk_1EF8D8088;
        }
        v139 = [NSNumber numberWithBool:(v209 ^ 1) & v135];
        [v196 addObject:v139];

        v140 = [NSNumber numberWithBool:(v209 ^ 1) & v136];
        [v193 addObject:v140];

        [v188 addObject:v131];
        [v181 addObject:v138];
        v141 = [NSNumber numberWithBool:v209];
        [v178 addObject:v141];
      }
      id objd = (id)[v164 countByEnumeratingWithState:&v214 objects:v278 count:16];
    }
    while (objd);
  }

  v142 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Results"];
  [v142 setObject:v196 forKeyedSubscript:@"reachedMinOrder"];
  [v142 setObject:v193 forKeyedSubscript:@"reachedEnd"];
  [v142 setObject:v188 forKeyedSubscript:@"topOrder"];
  [v142 setObject:v181 forKeyedSubscript:@"bottomOrder"];
  [v142 setObject:v178 forKeyedSubscript:@"feedDropped"];
  v143 = [v9 desiredKeys];

  if (v143)
  {
    v144 = (void *)MEMORY[0x1E4F1CAD0];
    v145 = [v9 desiredKeys];
    v146 = [v144 setWithArray:v145];

    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    v147 = [v142 changedKeys];
    uint64_t v148 = [v147 countByEnumeratingWithState:&v210 objects:v277 count:16];
    if (v148)
    {
      uint64_t v149 = v148;
      uint64_t v150 = *(void *)v211;
      do
      {
        for (uint64_t i1 = 0; i1 != v149; ++i1)
        {
          if (*(void *)v211 != v150) {
            objc_enumerationMutation(v147);
          }
          uint64_t v152 = *(void *)(*((void *)&v210 + 1) + 8 * i1);
          if (([v146 containsObject:v152] & 1) == 0) {
            [v142 setObject:0 forKeyedSubscript:v152];
          }
        }
        uint64_t v149 = [v147 countByEnumeratingWithState:&v210 objects:v277 count:16];
      }
      while (v149);
    }
  }
  v153 = [v9 recordFetchedBlock];
  ((void (**)(void, void *))v153)[2](v153, v142);

  v154 = [v9 queryCompletionBlock];
  v154[2](v154, 0, 0);
}

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1)
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

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1)
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

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3(uint64_t a1)
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

uint64_t __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_4(uint64_t a1, void *a2)
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