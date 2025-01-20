@interface PKGroupsController
- (BOOL)containsExpiredPassWithUniqueID:(id)a3;
- (BOOL)filteringEnabled;
- (BOOL)reorderingEnabled;
- (BOOL)shouldSeparatePaymentPasses;
- (NSArray)expiredSectionPasses;
- (NSArray)filteredPassUniqueIDs;
- (NSMutableDictionary)passAnnotationsByUniqueId;
- (PKCatalog)_copyRemoteCatalog;
- (PKGroupsController)init;
- (PKGroupsController)initWithPassLibrary:(id)a3;
- (PKGroupsController)initWithPassTypeMask:(unint64_t)a3 passFilters:(unint64_t)a4 allowedPassUniqueIDs:(id)a5;
- (PKGroupsControllerDelegate)delegate;
- (PKGroupsControllerSnapshotFetchOptions)snapshotFetchOptions;
- (id)groupAtIndex:(unint64_t)a3;
- (id)groups;
- (id)initLimited;
- (id)passWithUniqueID:(id)a3;
- (id)passes;
- (int64_t)expiredSectionPassesCount;
- (uint64_t)_indexOfGroupID:(uint64_t)a1;
- (unint64_t)_fixIndicesFrom:(void *)a1;
- (unint64_t)groupCount;
- (unint64_t)groupIndexForPassUniqueID:(id)a3;
- (unint64_t)indexOfGroup:(id)a3;
- (unint64_t)indexOfSeparationGroup;
- (void)_fixIndex:(uint64_t)a1;
- (void)_insertGroup:(unint64_t)a3 atIndex:(int)a4 notify:;
- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6;
- (void)_placeGroup:(unint64_t)a3 atIndex:(uint64_t)a4 notify:;
- (void)_removeGroup:(int)a3 notify:;
- (void)_updateStateWithCatalog:(void *)a3 passes:(void *)a4 states:(void *)a5 annotations:(void *)a6 accounts:(unsigned int)a7 notify:;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)addLocalPasses:(id)a3;
- (void)dealloc;
- (void)enableRemoteUpdates;
- (void)handleUserPassDelete:(id)a3;
- (void)handleUserPassRecover:(id)a3;
- (void)handleUserPassesDelete:(id)a3;
- (void)loadGroupsSynchronously;
- (void)loadGroupsWithCompletion:(id)a3;
- (void)moveGroupAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)movePass:(id)a3 inGroup:(id)a4 toIndex:(unint64_t)a5;
- (void)objectSettingsDidChangeNotification:(id)a3;
- (void)passLibrary:(id)a3 receivedUpdatedCatalog:(id)a4 passes:(id)a5 states:(id)a6;
- (void)processFetchedSnapshot:(void *)a3 withOptions:(int)a4 synchronously:(unsigned int)a5 notify:(void *)a6 completion:;
- (void)reloadGroups;
- (void)reloadGroupsWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReorderingEnabled:(BOOL)a3;
- (void)setShouldSeparatePaymentPasses:(BOOL)a3;
- (void)suppressRemoteUpdates:(BOOL)a3;
- (void)updateStateWithSnapshot:(uint64_t)a1 options:(void *)a2 notify:(unsigned int)a3;
@end

@implementation PKGroupsController

- (int64_t)expiredSectionPassesCount
{
  return [(NSArray *)self->_expiredSectionPasses count];
}

- (BOOL)shouldSeparatePaymentPasses
{
  return self->_shouldSeparatePaymentPasses;
}

- (void)_updateStateWithCatalog:(void *)a3 passes:(void *)a4 states:(void *)a5 annotations:(void *)a6 accounts:(unsigned int)a7 notify:
{
  uint64_t v332 = *MEMORY[0x1E4F143B8];
  id v205 = a2;
  id v202 = a3;
  id v200 = a4;
  id v12 = a5;
  id v201 = a6;
  if (a1)
  {
    id v198 = v12;
    context = (void *)MEMORY[0x192FDC630]();
    uint64_t v227 = a1;
    if (v12)
    {
      id v13 = v202;
      id v232 = v205;
      id v14 = v12;
      v244 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
      id v248 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v241 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (*(void *)(a1 + 24)
        && (id v15 = objc_loadWeakRetained((id *)(a1 + 176)),
            char v16 = objc_opt_respondsToSelector(),
            v15,
            (v16 & 1) != 0))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 176));
        v253 = [WeakRetained groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:a1];
      }
      else
      {
        v253 = 0;
      }
      v18 = _FindAllowedPassUniqueIDs(v232, *(void **)(a1 + 40));
      long long v330 = 0u;
      long long v329 = 0u;
      long long v328 = 0u;
      long long v327 = 0u;
      id v19 = v13;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v327 objects:v331 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v328;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v328 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v327 + 1) + 8 * i);
            v24 = objc_msgSend(v23, "uniqueID", v198, context, v200, v201);
            v25 = [v14 objectForKeyedSubscript:v24];
            unint64_t v26 = *(void *)(v227 + 32);
            if (!v26 || ((v26 >> [v23 passType]) & 1) != 0)
            {
              if ((!v18 || [v18 containsObject:v24])
                && (([v253 containsObject:v24] & 1) != 0
                 || _PassMeetsFilterRequirements(v23, *(void *)(v227 + 24), *(void **)(v227 + 120))))
              {
                if (PKExpiredPassesRefreshEnabled() && v25 && [v25 sortingState] == 1)
                {
                  v27 = [*(id *)(v227 + 80) objectForKey:v24];
                  BOOL v28 = v27 == 0;

                  if (v28)
                  {
                    v29 = [*(id *)(v227 + 72) objectForKey:v24];
                    if (v29)
                    {
                      [*(id *)(v227 + 80) setObject:v29 forKey:v24];
                    }
                    else
                    {
                      v238 = [v232 groups];
                      uint64_t v322 = MEMORY[0x1E4F143A8];
                      uint64_t v323 = 3221225472;
                      uint64_t v324 = (uint64_t)__92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke;
                      v325 = &unk_1E56F4B30;
                      id v234 = v24;
                      id v326 = v234;
                      objc_msgSend(v238, "pk_firstObjectPassingTest:", &v322);
                      id v236 = (id)objc_claimAutoreleasedReturnValue();

                      v32 = v236;
                      if (v236)
                      {
                        v239 = *(void **)(v227 + 80);
                        uint64_t v33 = [v236 groupID];
                        v34 = v239;
                        v240 = (void *)v33;
                        [v34 setObject:v33 forKey:v234];

                        v32 = v236;
                      }
                    }
                  }
                  [v248 addObject:v24];
                  [v241 addObject:v23];
                }
                else
                {
                  [v244 setObject:v23 forKey:v24];
                }
              }
              else
              {
                [v248 addObject:v24];
                int refreshed = PKExpiredPassesRefreshEnabled();
                if (v25) {
                  int v31 = refreshed;
                }
                else {
                  int v31 = 0;
                }
                if (v31 == 1 && [v25 sortingState] == 1) {
                  [v241 addObject:v23];
                }
              }
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v327 objects:v331 count:16];
        }
        while (v20);
      }

      v35 = *(void **)(v227 + 152);
      *(void *)(v227 + 152) = v248;
      id v36 = v248;

      v37 = *(void **)(v227 + 160);
      *(void *)(v227 + 160) = v241;
      id v38 = v241;

      uint64_t v39 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v14];
      v40 = *(void **)(v227 + 168);
      *(void *)(v227 + 168) = v39;

      v41 = *(void **)(v227 + 112);
      *(void *)&long long v318 = MEMORY[0x1E4F143A8];
      *((void *)&v318 + 1) = 3221225472;
      *(void *)&long long v319 = __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke_2;
      *((void *)&v319 + 1) = &unk_1E56F4B08;
      *(void *)&long long v320 = v244;
      id v42 = v244;
      [v41 enumerateObjectsUsingBlock:&v318];
      v43 = (void *)[v42 copy];
    }
    else
    {
      id v44 = v202;
      id v249 = v205;
      v254 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v44, "count"));
      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (*(void *)(a1 + 24)
        && (id v46 = objc_loadWeakRetained((id *)(a1 + 176)),
            char v47 = objc_opt_respondsToSelector(),
            v46,
            (v47 & 1) != 0))
      {
        id v48 = objc_loadWeakRetained((id *)(a1 + 176));
        v49 = [v48 groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:a1];
      }
      else
      {
        v49 = 0;
      }
      v50 = _FindAllowedPassUniqueIDs(v249, *(void **)(a1 + 40));
      long long v330 = 0u;
      long long v329 = 0u;
      long long v328 = 0u;
      long long v327 = 0u;
      id v51 = v44;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v327 objects:v331 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v328;
        do
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            if (*(void *)v328 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = *(void **)(*((void *)&v327 + 1) + 8 * j);
            unint64_t v56 = *(void *)(v227 + 32);
            if (!v56 || ((v56 >> [*(id *)(*((void *)&v327 + 1) + 8 * j) passType]) & 1) != 0)
            {
              v57 = [v55 uniqueID];
              if ((!v50 || [v50 containsObject:v57])
                && ((objc_msgSend(v49, "containsObject:", v57, v198, context, v200, v201) & 1) != 0
                 || _PassMeetsFilterRequirements(v55, *(void *)(v227 + 24), *(void **)(v227 + 120))))
              {
                [v254 setObject:v55 forKey:v57];
              }
              else
              {
                objc_msgSend(v45, "addObject:", v57, v198);
              }
            }
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v327 objects:v331 count:16];
        }
        while (v52);
      }

      v58 = *(void **)(v227 + 152);
      *(void *)(v227 + 152) = v45;
      id v59 = v45;

      v60 = *(void **)(v227 + 112);
      uint64_t v322 = MEMORY[0x1E4F143A8];
      uint64_t v323 = 3221225472;
      uint64_t v324 = (uint64_t)__70__PKGroupsController__displayablePassesDictionaryFromSet_withCatalog___block_invoke;
      v325 = &unk_1E56F4B08;
      id v326 = v254;
      id v61 = v254;
      [v60 enumerateObjectsUsingBlock:&v322];
      v43 = (void *)[v61 copy];
    }
    id v255 = v43;
    [v205 groups];
    long long v317 = 0u;
    long long v316 = 0u;
    long long v315 = 0u;
    long long v314 = 0u;
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v245 = [v62 countByEnumeratingWithState:&v314 objects:&v327 count:16];
    if (v245)
    {
      uint64_t v63 = 0;
      uint64_t v242 = *(void *)v315;
      while (2)
      {
        uint64_t v64 = 0;
        uint64_t v250 = v63;
        v63 += v245;
        do
        {
          if (*(void *)v315 != v242) {
            objc_enumerationMutation(v62);
          }
          v65 = *(void **)(*((void *)&v314 + 1) + 8 * v64);
          v66 = objc_msgSend(v65, "groupID", v198);
          v67 = [*(id *)(v227 + 56) objectForKeyedSubscript:v66];
          v68 = v67;
          if (v67)
          {
            if ([v67 passCount])
            {
              v69 = [v68 passAtIndex:0];
              BOOL v70 = [v69 style] == 6;

              if (!v70)
              {
                v197 = v68;
LABEL_84:

                uint64_t v63 = v250;
                goto LABEL_86;
              }
            }
          }
          else
          {
            long long v313 = 0u;
            long long v312 = 0u;
            long long v311 = 0u;
            long long v310 = 0u;
            v197 = [v65 uniqueIDs];
            uint64_t v71 = [v197 countByEnumeratingWithState:&v310 objects:&v322 count:16];
            if (v71)
            {
              uint64_t v72 = *(void *)v311;
              while (2)
              {
                for (uint64_t k = 0; k != v71; ++k)
                {
                  if (*(void *)v311 != v72) {
                    objc_enumerationMutation(v197);
                  }
                  v74 = [v255 objectForKeyedSubscript:*(void *)(*((void *)&v310 + 1) + 8 * k)];
                  v75 = v74;
                  if (v74 && [v74 style] != 6)
                  {

                    goto LABEL_84;
                  }
                }
                uint64_t v71 = [v197 countByEnumeratingWithState:&v310 objects:&v322 count:16];
                if (v71) {
                  continue;
                }
                break;
              }
            }
          }
          ++v250;
          ++v64;
        }
        while (v64 != v245);
        uint64_t v245 = [v62 countByEnumeratingWithState:&v314 objects:&v327 count:16];
        if (v245) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v63 = 0;
    }
LABEL_86:

    long long v309 = 0u;
    long long v308 = 0u;
    long long v307 = 0u;
    long long v306 = 0u;
    v76 = [MEMORY[0x1E4F1CA48] array];
    long long v321 = 0u;
    long long v320 = 0u;
    long long v319 = 0u;
    long long v318 = 0u;
    id v77 = *(id *)(v227 + 48);
    uint64_t v78 = [v77 countByEnumeratingWithState:&v318 objects:v331 count:16];
    if (v78)
    {
      uint64_t v79 = *(void *)v319;
      do
      {
        for (uint64_t m = 0; m != v78; ++m)
        {
          if (*(void *)v319 != v79) {
            objc_enumerationMutation(v77);
          }
          v81 = *(void **)(*((void *)&v318 + 1) + 8 * m);
          if (objc_msgSend(v81, "passCount", v198))
          {
            v82 = [v81 passAtIndex:0];
            v83 = v82;
            if (v82 && [v82 passType] != 1) {
              [v76 addObject:v81];
            }
          }
          else
          {
            v83 = 0;
          }
        }
        uint64_t v78 = [v77 countByEnumeratingWithState:&v318 objects:v331 count:16];
      }
      while (v78);
    }

    uint64_t v84 = [v76 countByEnumeratingWithState:&v306 objects:v331 count:16];
    if (v84)
    {
      uint64_t v85 = *(void *)v307;
      do
      {
        for (uint64_t n = 0; n != v84; ++n)
        {
          if (*(void *)v307 != v85) {
            objc_enumerationMutation(v76);
          }
          uint64_t v87 = *(void *)(*((void *)&v306 + 1) + 8 * n);
          if (v87 && *(unsigned char *)(v87 + 56))
          {
            v88 = (void *)[*(id *)(v87 + 24) copy];
            if (v63 + n >= (unint64_t)[v62 count]) {
              [v62 addObject:v88];
            }
            else {
              objc_msgSend(v62, "insertObject:atIndex:", v88);
            }
          }
        }
        uint64_t v84 = [v76 countByEnumeratingWithState:&v306 objects:v331 count:16];
        v63 += n;
      }
      while (v84);
    }

    id v207 = v205;
    id v211 = v255;
    id v208 = v200;
    id v209 = v201;
    id v212 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v89 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v90 = [*(id *)(v227 + 72) allKeys];
    v203 = (void *)[v89 initWithArray:v90];

    id v219 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v274 = 0u;
    long long v275 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    id v91 = *(id *)(v227 + 160);
    uint64_t v92 = [v91 countByEnumeratingWithState:&v274 objects:&v306 count:16];
    if (v92)
    {
      uint64_t v93 = *(void *)v275;
      do
      {
        for (iuint64_t i = 0; ii != v92; ++ii)
        {
          if (*(void *)v275 != v93) {
            objc_enumerationMutation(v91);
          }
          v95 = objc_msgSend(*(id *)(*((void *)&v274 + 1) + 8 * ii), "uniqueID", v198);
          [v219 addObject:v95];
        }
        uint64_t v92 = [v91 countByEnumeratingWithState:&v274 objects:&v306 count:16];
      }
      while (v92);
    }

    v96 = [v207 groups];
    v97 = (void *)[v96 copy];

    long long v272 = 0u;
    long long v273 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    obuint64_t j = v97;
    uint64_t v210 = [obj countByEnumeratingWithState:&v270 objects:v305 count:16];
    if (v210)
    {
      uint64_t v206 = *(void *)v271;
      do
      {
        for (juint64_t j = 0; jj != v210; ++jj)
        {
          if (*(void *)v271 != v206) {
            objc_enumerationMutation(obj);
          }
          v214 = *(void **)(*((void *)&v270 + 1) + 8 * jj);
          v216 = objc_msgSend(v214, "groupID", v198);
          v256 = [*(id *)(v227 + 56) objectForKey:v216];
          if (!v256)
          {
            v256 = -[PKGroup initWithCatalogGroup:passes:states:accounts:]((id *)[PKGroup alloc], v214, v211, v208, v209);
            [v212 setObject:v256 forKey:v216];
            goto LABEL_245;
          }
          id v213 = v214;
          id v221 = v211;
          id v220 = v208;
          id v218 = v209;
          id v225 = v219;
          id v98 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v99 = [v256[4] allKeys];
          v222 = (void *)[v98 initWithArray:v99];

          v217 = [v213 uniqueIDs];
          long long v298 = 0u;
          long long v299 = 0u;
          long long v296 = 0u;
          long long v297 = 0u;
          id v223 = (id)[v217 copy];
          uint64_t v226 = [v223 countByEnumeratingWithState:&v296 objects:&v327 count:16];
          if (!v226) {
            goto LABEL_236;
          }
          uint64_t v246 = 0;
          uint64_t v224 = *(void *)v297;
          do
          {
            uint64_t v230 = 0;
            do
            {
              if (*(void *)v297 != v224) {
                objc_enumerationMutation(v223);
              }
              v235 = *(void **)(*((void *)&v296 + 1) + 8 * v230);
              if ((objc_msgSend(v225, "containsObject:") & 1) == 0)
              {
                [v222 removeObject:v235];
                v233 = [v256[4] objectForKey:v235];
                v229 = [v221 objectForKey:v235];
                v231 = [v220 objectForKey:v235];
                if (v233)
                {
                  if (v229)
                  {
                    id v100 = v229;
                    id v251 = v231;
                    v101 = [v100 uniqueID];
                    id v237 = [v256[4] objectForKey:v101];
                    char v102 = [v237 isEqualToPassIncludingMetadata:v100];
                    if ((v102 & 1) == 0) {
                      [v256[4] setObject:v100 forKeyedSubscript:v101];
                    }
                    [v256[5] setObject:v251 forKeyedSubscript:v101];
                    if (a7)
                    {
                      v103 = -[PKGroup observers]((uint64_t)v256);
                      long long v303 = 0u;
                      long long v301 = 0u;
                      long long v302 = 0u;
                      long long v300 = 0u;
                      uint64_t v104 = [v103 countByEnumeratingWithState:&v300 objects:v331 count:16];
                      if (v104)
                      {
                        uint64_t v105 = *(void *)v301;
                        do
                        {
                          for (kuint64_t k = 0; kk != v104; ++kk)
                          {
                            if (*(void *)v301 != v105) {
                              objc_enumerationMutation(v103);
                            }
                            v107 = *(void **)(*((void *)&v300 + 1) + 8 * kk);
                            uint64_t v108 = -[PKGroup _indexOfUniqueID:](v256[3], v101);
                            if (v102)
                            {
                              if (objc_opt_respondsToSelector()) {
                                [v107 group:v256 didUpdatePassState:v251 forPass:v237 atIndex:v108];
                              }
                            }
                            else if (objc_opt_respondsToSelector())
                            {
                              [v107 group:v256 didUpdatePass:v100 withState:v251 atIndex:v108];
                            }
                            else if (objc_opt_respondsToSelector())
                            {
                              [v107 group:v256 didUpdatePass:v100 atIndex:v108];
                            }
                          }
                          uint64_t v104 = [v103 countByEnumeratingWithState:&v300 objects:v331 count:16];
                        }
                        while (v104);
                      }
                    }
                  }
                  else if (v231)
                  {
                    [v256[5] setObject:v231 forKeyedSubscript:v235];
                    if (a7)
                    {
                      v131 = -[PKGroup observers]((uint64_t)v256);
                      long long v294 = 0u;
                      long long v295 = 0u;
                      long long v292 = 0u;
                      long long v293 = 0u;
                      uint64_t v132 = [v131 countByEnumeratingWithState:&v292 objects:&v322 count:16];
                      if (v132)
                      {
                        uint64_t v133 = *(void *)v293;
                        do
                        {
                          for (muint64_t m = 0; mm != v132; ++mm)
                          {
                            if (*(void *)v293 != v133) {
                              objc_enumerationMutation(v131);
                            }
                            v135 = *(void **)(*((void *)&v292 + 1) + 8 * mm);
                            if (objc_opt_respondsToSelector()) {
                              objc_msgSend(v135, "group:didUpdatePassState:forPass:atIndex:", v256, v231, v233, -[PKGroup _indexOfUniqueID:](v256[3], v235));
                            }
                          }
                          uint64_t v132 = [v131 countByEnumeratingWithState:&v292 objects:&v322 count:16];
                        }
                        while (v132);
                      }
                    }
                  }
                  -[PKGroup _moveUniqueID:toIndex:notify:]((uint64_t)v256, v235, v246, a7);
                  goto LABEL_167;
                }
                if (v229)
                {
                  id v109 = v229;
                  id v110 = v231;
                  v111 = [v109 uniqueID];
                  v112 = [v256[3] uniqueIDs];
                  [v112 insertObject:v111 atIndex:v246];

                  [v256[4] setObject:v109 forKeyedSubscript:v111];
                  [v256[5] setObject:v110 forKeyedSubscript:v111];
                  if (a7)
                  {
                    v113 = -[PKGroup observers]((uint64_t)v256);
                    long long v303 = 0u;
                    long long v301 = 0u;
                    long long v302 = 0u;
                    long long v300 = 0u;
                    uint64_t v114 = [v113 countByEnumeratingWithState:&v300 objects:v331 count:16];
                    if (v114)
                    {
                      uint64_t v115 = *(void *)v301;
                      do
                      {
                        for (nuint64_t n = 0; nn != v114; ++nn)
                        {
                          if (*(void *)v301 != v115) {
                            objc_enumerationMutation(v113);
                          }
                          v117 = *(void **)(*((void *)&v300 + 1) + 8 * nn);
                          if (objc_opt_respondsToSelector())
                          {
                            [v117 group:v256 didInsertPass:v109 withState:v110 atIndex:v246];
                          }
                          else if (objc_opt_respondsToSelector())
                          {
                            [v117 group:v256 didInsertPass:v109 atIndex:v246];
                          }
                        }
                        uint64_t v114 = [v113 countByEnumeratingWithState:&v300 objects:v331 count:16];
                      }
                      while (v114);
                    }
                  }
LABEL_167:
                  uint64_t v118 = 1;
                }
                else
                {
                  [v217 removeObject:v235];
                  uint64_t v118 = 0;
                }
                if ([v229 passType] == 1)
                {
                  v119 = [v256[6] objectForKey:v235];
                  v290[0] = MEMORY[0x1E4F143A8];
                  v290[1] = 3221225472;
                  v290[2] = __85__PKGroup_updateWithCatalogGroup_passes_states_accounts_expiredSectionPasses_notify___block_invoke;
                  v290[3] = &unk_1E56F4A18;
                  id v120 = v229;
                  id v291 = v120;
                  uint64_t v121 = objc_msgSend(v218, "pk_anyObjectPassingTest:", v290);
                  v122 = (void *)v121;
                  if (v119 && v121)
                  {
                    char v123 = [v119 isEqual:v121];

                    if ((v123 & 1) == 0)
                    {
                      v124 = v256[6];
                      goto LABEL_181;
                    }
LABEL_175:

                    v246 += v118;
                    goto LABEL_176;
                  }
                  BOOL v125 = v119 == (void *)v121;

                  if (v125)
                  {
                    v122 = v119;
                    goto LABEL_175;
                  }
                  if (!v119)
                  {
                    if (!v122 || ([v256[6] setObject:v122 forKeyedSubscript:v235], !a7))
                    {
                      v119 = 0;
                      goto LABEL_175;
                    }
                    v126 = -[PKGroup observers]((uint64_t)v256);
                    long long v280 = 0u;
                    long long v281 = 0u;
                    long long v278 = 0u;
                    long long v279 = 0u;
                    uint64_t v136 = [v126 countByEnumeratingWithState:&v278 objects:&v310 count:16];
                    if (v136)
                    {
                      uint64_t v137 = *(void *)v279;
                      if (v229) {
                        id v138 = v120;
                      }
                      else {
                        id v138 = v233;
                      }
                      do
                      {
                        for (uint64_t i1 = 0; i1 != v136; ++i1)
                        {
                          if (*(void *)v279 != v137) {
                            objc_enumerationMutation(v126);
                          }
                          v140 = *(void **)(*((void *)&v278 + 1) + 8 * i1);
                          if (objc_opt_respondsToSelector()) {
                            [v140 group:v256 didInsertAssociatedAccount:v122 forPass:v138];
                          }
                        }
                        uint64_t v136 = [v126 countByEnumeratingWithState:&v278 objects:&v310 count:16];
                      }
                      while (v136);
                    }
                    v119 = 0;
                    goto LABEL_234;
                  }
                  v124 = v256[6];
                  if (v122)
                  {
LABEL_181:
                    [v124 setObject:v122 forKeyedSubscript:v235];
                    if (!a7) {
                      goto LABEL_175;
                    }
                    v126 = -[PKGroup observers]((uint64_t)v256);
                    long long v288 = 0u;
                    long long v289 = 0u;
                    long long v286 = 0u;
                    long long v287 = 0u;
                    uint64_t v127 = [v126 countByEnumeratingWithState:&v286 objects:&v318 count:16];
                    if (v127)
                    {
                      uint64_t v128 = *(void *)v287;
                      do
                      {
                        for (uint64_t i2 = 0; i2 != v127; ++i2)
                        {
                          if (*(void *)v287 != v128) {
                            objc_enumerationMutation(v126);
                          }
                          v130 = *(void **)(*((void *)&v286 + 1) + 8 * i2);
                          if (objc_opt_respondsToSelector()) {
                            [v130 group:v256 didUpdateAssociatedAccount:v122 forPass:v120];
                          }
                        }
                        uint64_t v127 = [v126 countByEnumeratingWithState:&v286 objects:&v318 count:16];
                      }
                      while (v127);
                    }
LABEL_234:

                    goto LABEL_175;
                  }
                  [v124 setObject:0 forKeyedSubscript:v235];
                  if (a7)
                  {
                    v126 = -[PKGroup observers]((uint64_t)v256);
                    long long v284 = 0u;
                    long long v285 = 0u;
                    long long v282 = 0u;
                    long long v283 = 0u;
                    uint64_t v141 = [v126 countByEnumeratingWithState:&v282 objects:&v314 count:16];
                    if (v141)
                    {
                      uint64_t v142 = *(void *)v283;
                      if (v229) {
                        id v143 = v120;
                      }
                      else {
                        id v143 = v233;
                      }
                      do
                      {
                        for (uint64_t i3 = 0; i3 != v141; ++i3)
                        {
                          if (*(void *)v283 != v142) {
                            objc_enumerationMutation(v126);
                          }
                          v145 = *(void **)(*((void *)&v282 + 1) + 8 * i3);
                          if (objc_opt_respondsToSelector()) {
                            [v145 group:v256 didRemoveAssociatedAccountForPass:v143];
                          }
                        }
                        uint64_t v141 = [v126 countByEnumeratingWithState:&v282 objects:&v314 count:16];
                      }
                      while (v141);
                    }
                    v122 = 0;
                    goto LABEL_234;
                  }
                }
                else
                {
                  v119 = 0;
                }
                v122 = 0;
                goto LABEL_175;
              }
LABEL_176:
              ++v230;
            }
            while (v230 != v226);
            uint64_t v146 = [v223 countByEnumeratingWithState:&v296 objects:&v327 count:16];
            uint64_t v226 = v146;
          }
          while (v146);
LABEL_236:

          long long v303 = 0u;
          long long v301 = 0u;
          long long v302 = 0u;
          long long v300 = 0u;
          id v147 = v222;
          uint64_t v148 = [v147 countByEnumeratingWithState:&v300 objects:v331 count:16];
          if (v148)
          {
            uint64_t v149 = *(void *)v301;
            do
            {
              for (uint64_t i4 = 0; i4 != v148; ++i4)
              {
                if (*(void *)v301 != v149) {
                  objc_enumerationMutation(v147);
                }
                -[PKGroup _removeUniqueID:notify:](v256, *(void **)(*((void *)&v300 + 1) + 8 * i4), a7);
              }
              uint64_t v148 = [v147 countByEnumeratingWithState:&v300 objects:v331 count:16];
            }
            while (v148);
          }

LABEL_245:
          if (!v256
            || ([v256[3] uniqueIDs],
                v151 = objc_claimAutoreleasedReturnValue(),
                BOOL v152 = [v151 count] == 0,
                v151,
                v152))
          {
            v162 = [v207 groups];
            [v162 removeObject:v214];

            [v212 removeObjectForKey:v216];
          }
          else
          {
            uint64_t v322 = 0;
            uint64_t v323 = (uint64_t)&v322;
            uint64_t v324 = 0x2020000000;
            v325 = 0;
            v262[0] = MEMORY[0x1E4F143A8];
            v262[1] = 3221225472;
            v263 = __86__PKGroupsController__updateAndCreateGroupsWithCatalog_passes_states_accounts_notify___block_invoke;
            v264 = &unk_1E56F4B58;
            id v153 = v219;
            v269 = &v322;
            id v265 = v153;
            uint64_t v266 = v227;
            id v154 = v216;
            id v267 = v154;
            id v268 = v203;
            v155 = v262;
            long long v329 = 0u;
            long long v330 = 0u;
            long long v328 = 0u;
            long long v327 = 0u;
            v156 = [v256[3] uniqueIDs];
            uint64_t v157 = [v156 countByEnumeratingWithState:&v327 objects:v331 count:16];
            if (v157)
            {
              uint64_t v158 = *(void *)v328;
              do
              {
                for (uint64_t i5 = 0; i5 != v157; ++i5)
                {
                  if (*(void *)v328 != v158) {
                    objc_enumerationMutation(v156);
                  }
                  v263((uint64_t)v155, *(void **)(*((void *)&v327 + 1) + 8 * i5));
                }
                uint64_t v157 = [v156 countByEnumeratingWithState:&v327 objects:v331 count:16];
              }
              while (v157);
            }

            uint64_t v160 = *(void *)(v323 + 24);
            if (v160 == [v256 passCount])
            {
              v161 = [v207 groups];
              [v161 removeObject:v214];

              [v212 removeObjectForKey:v154];
            }

            _Block_object_dispose(&v322, 8);
          }
        }
        uint64_t v210 = [obj countByEnumeratingWithState:&v270 objects:v305 count:16];
      }
      while (v210);
    }

    long long v330 = 0u;
    long long v329 = 0u;
    long long v328 = 0u;
    long long v327 = 0u;
    id v163 = v203;
    uint64_t v164 = [v163 countByEnumeratingWithState:&v327 objects:v331 count:16];
    if (v164)
    {
      uint64_t v165 = *(void *)v328;
      do
      {
        for (uint64_t i6 = 0; i6 != v164; ++i6)
        {
          if (*(void *)v328 != v165) {
            objc_enumerationMutation(v163);
          }
          objc_msgSend(*(id *)(v227 + 72), "removeObjectForKey:", *(void *)(*((void *)&v327 + 1) + 8 * i6), v198);
        }
        uint64_t v164 = [v163 countByEnumeratingWithState:&v327 objects:v331 count:16];
      }
      while (v164);
    }

    id v167 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v168 = [*(id *)(v227 + 56) allKeys];
    v169 = (void *)[v167 initWithArray:v168];

    v170 = [v207 allGroupIDs];
    [v169 minusSet:v170];

    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    id v171 = v169;
    uint64_t v172 = [v171 countByEnumeratingWithState:&v258 objects:v304 count:16];
    if (v172)
    {
      uint64_t v173 = *(void *)v259;
      do
      {
        for (uint64_t i7 = 0; i7 != v172; ++i7)
        {
          if (*(void *)v259 != v173) {
            objc_enumerationMutation(v171);
          }
          v175 = objc_msgSend(*(id *)(v227 + 56), "objectForKey:", *(void *)(*((void *)&v258 + 1) + 8 * i7), v198);
          -[PKGroupsController _removeGroup:notify:]((id *)v227, v175, a7);
        }
        uint64_t v172 = [v171 countByEnumeratingWithState:&v258 objects:v304 count:16];
      }
      while (v172);
    }

    v252 = [v207 groups];
    unint64_t v247 = [v252 count];
    if (v247)
    {
      unint64_t v176 = 0;
      do
      {
        unint64_t v177 = v176;
        v178 = [v252 objectAtIndex:v198];
        v257 = [v178 groupID];

        v179 = [(id)v227 groupAtIndex:v177];
        v180 = [v179 groupID];

        if (!v180 || ![v257 isEqualToNumber:v180])
        {
          v181 = [*(id *)(v227 + 56) objectForKey:v257];
          BOOL v182 = v181 == 0;

          if (v182)
          {
            v192 = [v212 objectForKey:v257];
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v192, v177, a7);
          }
          else if (v180)
          {
            unint64_t v243 = -[PKGroupsController _indexOfGroupID:](v227, (uint64_t)v257);
            id v183 = v180;
            id v184 = v252;
            unint64_t v185 = [v184 count];
            unint64_t v186 = v177;
            if (v185 > v177)
            {
              unint64_t v186 = v177;
              unint64_t v187 = v177;
              while (1)
              {
                v188 = [v184 objectAtIndex:v187];
                v189 = [v188 groupID];

                if ([v189 isEqualToNumber:v183]) {
                  break;
                }
                v190 = [*(id *)(v227 + 56) objectForKey:v189];
                BOOL v191 = v190 != 0;

                v186 += v191;
                if (v185 == ++v187) {
                  goto LABEL_288;
                }
              }
            }
LABEL_288:

            v194 = *(void **)(v227 + 56);
            if (v243 <= v186)
            {
              v196 = [v194 objectForKey:v183];
              -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v196, v186, a7);

              goto LABEL_291;
            }
            v195 = [v194 objectForKey:v257];
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v195, v177, a7);
          }
          else
          {
            v193 = [*(id *)(v227 + 56) objectForKey:v257];
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v193, v177, a7);
          }
        }
        ++v177;
LABEL_291:

        unint64_t v176 = v177;
      }
      while (v177 < v247);
    }

    id v12 = v198;
  }
}

- (unint64_t)indexOfGroup:(id)a3
{
  v4 = [a3 groupID];
  unint64_t v5 = -[PKGroupsController _indexOfGroupID:]((uint64_t)self, (uint64_t)v4);

  return v5;
}

- (uint64_t)_indexOfGroupID:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [*(id *)(a1 + 64) objectForKey:a2];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void __86__PKGroupsController__updateAndCreateGroupsWithCatalog_passes_states_accounts_notify___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 72) setObject:*(void *)(a1 + 48) forKey:v3];
    [*(id *)(a1 + 56) removeObject:v3];
  }
}

- (unint64_t)indexOfSeparationGroup
{
  if (!self->_shouldSeparatePaymentPasses) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = [(NSMutableArray *)self->_groups count];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  while (1)
  {
    v6 = [(PKGroupsController *)self groupAtIndex:v5];
    v7 = objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
    uint64_t v8 = [v7 passType];
    uint64_t v9 = [v7 style];

    if (!v7 || v8 != 1 || v9 != 6) {
      break;
    }
    if (v4 == ++v5)
    {
      uint64_t v5 = v4;
      break;
    }
  }
  if (v5) {
    return v5 - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)groupAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_groups count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_groups objectAtIndex:a3];
  }
  return v5;
}

uint64_t __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (void)_placeGroup:(unint64_t)a3 atIndex:(uint64_t)a4 notify:
{
  id v8 = a2;
  if ([a1[6] count] <= a3) {
    a3 = [a1[6] count];
  }
  uint64_t v7 = [a1 indexOfGroup:v8];
  if (v7 != a3)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      -[PKGroupsController _insertGroup:atIndex:notify:]((uint64_t)a1, v8, a3, a4);
    }
    else {
      [a1 _moveGroup:v8 fromIndex:v7 toIndex:a3 notify:a4];
    }
  }
}

- (void)_insertGroup:(unint64_t)a3 atIndex:(int)a4 notify:
{
  id v10 = a2;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 56);
    id v8 = [v10 groupID];
    [v7 setObject:v10 forKey:v8];

    [*(id *)(a1 + 48) insertObject:v10 atIndex:a3];
    -[PKGroupsController _fixIndicesFrom:]((void *)a1, a3);
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 176));
      [WeakRetained groupsController:a1 didInsertGroup:v10 atIndex:a3];
    }
  }
}

- (unint64_t)_fixIndicesFrom:(void *)a1
{
  for (unint64_t result = [a1 groupCount]; a2 < result; unint64_t result = objc_msgSend(a1, "groupCount"))
    -[PKGroupsController _fixIndex:]((uint64_t)a1, a2++);
  return result;
}

- (unint64_t)groupCount
{
  return [(NSMutableArray *)self->_groups count];
}

- (void)_fixIndex:(uint64_t)a1
{
  if (a1)
  {
    id v7 = [*(id *)(a1 + 48) objectAtIndex:a2];
    uint64_t v4 = *(void **)(a1 + 64);
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
    v6 = [v7 groupID];
    [v4 setObject:v5 forKey:v6];
  }
}

- (PKGroupsController)init
{
  uint64_t v3 = +[PKPassLibrary sharedInstance];
  uint64_t v4 = [(PKGroupsController *)self initWithPassLibrary:v3];

  return v4;
}

- (PKGroupsController)initWithPassLibrary:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKGroupsController;
  v6 = [(PKGroupsController *)&v25 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_passLibrary, a3);
    [(PKPassLibrary *)v7->_passLibrary addDelegate:v7];
    id v8 = objc_alloc_init(PKPaymentService);
    paymentService = v7->_paymentService;
    v7->_paymentService = v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    groups = v7->_groups;
    v7->_groups = v10;

    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupsByGroupID = v7->_groupsByGroupID;
    v7->_groupsByGroupID = v12;

    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indicesByGroupID = v7->_indicesByGroupID;
    v7->_indicesByGroupID = v14;

    char v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupIDsByPassUniqueID = v7->_groupIDsByPassUniqueID;
    v7->_groupIDsByPassUniqueID = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupIDsByExpiredPassUniqueID = v7->_groupIDsByExpiredPassUniqueID;
    v7->_groupIDsByExpiredPassUniqueID = v18;

    uint64_t v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedUpdates = v7->_enqueuedUpdates;
    v7->_enqueuedUpdates = v20;

    v7->_reorderingEnabled = 1;
    v7->_expressPassesInformationTokeuint64_t n = -1;
    PKObservePassSettingsChanged(v7, (uint64_t)sel_objectSettingsDidChangeNotification_, 0);
    uint64_t v22 = +[PKAccountService sharedInstance];
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v22;

    [(PKAccountService *)v7->_accountService registerObserver:v7];
  }

  return v7;
}

- (void)setShouldSeparatePaymentPasses:(BOOL)a3
{
  self->_shouldSeparatePaymentPasses = a3;
}

void __45__PKGroupsController_loadGroupsSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

- (void)processFetchedSnapshot:(void *)a3 withOptions:(int)a4 synchronously:(unsigned int)a5 notify:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (a1)
  {
    if (a4)
    {
      -[PKGroupsController updateStateWithSnapshot:options:notify:](a1, v11, a5);
      if (v13) {
        v13[2](v13);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__PKGroupsController_processFetchedSnapshot_withOptions_synchronously_notify_completion___block_invoke;
      block[3] = &unk_1E56F4AB8;
      block[4] = a1;
      id v15 = v11;
      id v16 = v12;
      char v18 = a5;
      v17 = v13;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)updateStateWithSnapshot:(uint64_t)a1 options:(void *)a2 notify:(unsigned int)a3
{
  if (a1)
  {
    id v5 = a2;
    id v10 = [v5 catalog];
    v6 = [v5 passes];
    id v7 = [v5 states];
    id v8 = [v5 annotations];
    uint64_t v9 = [v5 accounts];

    -[PKGroupsController _updateStateWithCatalog:passes:states:annotations:accounts:notify:](a1, v10, v6, v7, v8, v9, a3);
  }
}

- (void)setDelegate:(id)a3
{
}

- (id)passes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_groups;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "passes", (void)v12);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];
  return v10;
}

- (void)loadGroupsSynchronously
{
  id v3 = -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PKGroupsController_loadGroupsSynchronously__block_invoke;
  v6[3] = &unk_1E56F4A68;
  v6[4] = self;
  id v4 = v3;
  id v7 = v4;
  uint64_t v5 = v4;
  if (self)
  {
    [(PKPassLibrary *)self->_passLibrary getGroupsControllerSnapshotWithOptions:v4 synchronously:1 handler:v6];
    uint64_t v5 = v7;
  }
}

- (PKGroupsControllerSnapshotFetchOptions)snapshotFetchOptions
{
  if (a1)
  {
    v2 = objc_alloc_init(PKGroupsControllerSnapshotFetchOptions);
    [(PKGroupsControllerSnapshotFetchOptions *)v2 setLimitResults:*(unsigned __int8 *)(a1 + 128)];
    [(PKGroupsControllerSnapshotFetchOptions *)v2 setIncludeAnnotations:PKExpiredPassesRefreshEnabled()];
    [(PKGroupsControllerSnapshotFetchOptions *)v2 setAllowedPassType:*(void *)(a1 + 32)];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (PKGroupsController)initWithPassTypeMask:(unint64_t)a3 passFilters:(unint64_t)a4 allowedPassUniqueIDs:(id)a5
{
  id v9 = a5;
  id v10 = [(PKGroupsController *)self init];
  id v11 = v10;
  if (v10)
  {
    if (a3 == -1) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = a3;
    }
    v10->_passTypeMasuint64_t k = v12;
    if (v12) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v10->_filters == 0;
    }
    v10->_reorderingEnabled = v13;
    v10->_filters = a4;
    objc_storeStrong((id *)&v10->_allowedPassUniqueIDs, a5);
    if ((v11->_filters & 0x10) != 0)
    {
      uint64_t v14 = [(PKPaymentService *)v11->_paymentService expressPassConfigurations];
      expressPassConfigurations = v11->_expressPassConfigurations;
      v11->_expressPassConfigurations = (NSSet *)v14;

      objc_initWeak(&location, v11);
      id v16 = (const char *)[@"com.apple.passkit.expresspassesinformation.changed" UTF8String];
      uint64_t v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __76__PKGroupsController_initWithPassTypeMask_passFilters_allowedPassUniqueIDs___block_invoke;
      v20[3] = &unk_1E56E3FB0;
      objc_copyWeak(&v21, &location);
      notify_register_dispatch(v16, &v11->_expressPassesInformationToken, v17, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

void __76__PKGroupsController_initWithPassTypeMask_passFilters_allowedPassUniqueIDs___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained[2] expressPassConfigurations];
    id v3 = v4[15];
    v4[15] = (id)v2;

    [v4 reloadGroups];
    id WeakRetained = v4;
  }
}

- (id)initLimited
{
  id result = [(PKGroupsController *)self init];
  if (result)
  {
    *((unsigned char *)result + 144) = 0;
    *((unsigned char *)result + 128) = 1;
  }
  return result;
}

- (void)dealloc
{
  PKUnregisterPassSettingsChangedObserver(self, 0);
  [(PKPassLibrary *)self->_passLibrary removeDelegate:self];
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  expressPassesInformationTokeuint64_t n = self->_expressPassesInformationToken;
  if (expressPassesInformationToken != -1) {
    notify_cancel(expressPassesInformationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKGroupsController;
  [(PKGroupsController *)&v4 dealloc];
}

- (void)loadGroupsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PKGroupsController_loadGroupsWithCompletion___block_invoke;
  v9[3] = &unk_1E56F4A40;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v7 = v4;
  id v11 = v7;
  id v8 = v7;
  if (self)
  {
    [(PKPassLibrary *)self->_passLibrary getGroupsControllerSnapshotWithOptions:v6 synchronously:0 handler:v9];
    id v8 = v11;
  }
}

void __47__PKGroupsController_loadGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
}

- (void)reloadGroups
{
}

- (void)reloadGroupsWithCompletion:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PKGroupsController_reloadGroupsAndNotify_completion___block_invoke;
    v8[3] = &unk_1E56F4A90;
    v8[4] = self;
    id v9 = v5;
    char v11 = 1;
    id v10 = v4;
    passLibrary = self->_passLibrary;
    id v7 = v5;
    [(PKPassLibrary *)passLibrary getGroupsControllerSnapshotWithOptions:v7 synchronously:0 handler:v8];
  }
}

void __55__PKGroupsController_reloadGroupsAndNotify_completion___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __89__PKGroupsController_processFetchedSnapshot_withOptions_synchronously_notify_completion___block_invoke(uint64_t a1)
{
  -[PKGroupsController updateStateWithSnapshot:options:notify:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)groups
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_groups copy];
  return v2;
}

- (unint64_t)groupIndexForPassUniqueID:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_groupIDsByPassUniqueID objectForKey:a3];
  unint64_t v5 = -[PKGroupsController _indexOfGroupID:]((uint64_t)self, (uint64_t)v4);

  return v5;
}

- (BOOL)containsExpiredPassWithUniqueID:(id)a3
{
  id v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PKGroupsController_containsExpiredPassWithUniqueID___block_invoke;
  v8[3] = &unk_1E56E1140;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(expiredSectionPasses) = [(NSArray *)expiredSectionPasses pk_containsObjectPassingTest:v8];

  return (char)expiredSectionPasses;
}

uint64_t __54__PKGroupsController_containsExpiredPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)passWithUniqueID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PKGroupsController *)self groupAtIndex:[(PKGroupsController *)self groupIndexForPassUniqueID:v4]];
    id v6 = (void *)v5;
    if (v5)
    {
      id v7 = [*(id *)(v5 + 32) objectForKey:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)handleUserPassesDelete:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    expiredSectionPasses = self->_expiredSectionPasses;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__PKGroupsController_handleUserPassesDelete___block_invoke;
    v21[3] = &unk_1E56E1140;
    id v6 = v4;
    id v22 = v6;
    id v7 = [(NSArray *)expiredSectionPasses pk_createArrayByRemovingObjectsPassingTest:v21];
    uint64_t v8 = self->_expiredSectionPasses;
    self->_expiredSectionPasses = v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary removeObjectForKey:](self->_passAnnotationsByUniqueId, "removeObjectForKey:", v14, (void)v17);
          long long v15 = [(NSMutableDictionary *)self->_groupIDsByPassUniqueID objectForKey:v14];
          if (v15)
          {
            [(NSMutableDictionary *)self->_groupIDsByPassUniqueID removeObjectForKey:v14];
            id v16 = [(NSMutableDictionary *)self->_groupsByGroupID objectForKey:v15];
            if (-[PKGroup containsPassesInAdditionToUniqueID:]((uint64_t)v16, v14))
            {
              if (v16) {
                -[PKGroup _removeUniqueID:notify:](v16, v14, 1);
              }
            }
            else
            {
              -[PKGroupsController _removeGroup:notify:]((id *)&self->super.isa, v16, 1);
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_groupIDsByExpiredPassUniqueID removeObjectForKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v11);
    }

    [(PKPassLibrary *)self->_passLibrary removePassesWithUniqueIDs:v9 diagnosticReason:@"User Deleted Passes"];
  }
}

BOOL __45__PKGroupsController_handleUserPassesDelete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueID];
  BOOL v4 = [v2 indexOfObject:v3] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)_removeGroup:(int)a3 notify:
{
  id v5 = a2;
  if (a1)
  {
    id v9 = v5;
    unint64_t v6 = [a1 indexOfGroup:v5];
    [a1[6] removeObjectAtIndex:v6];
    -[PKGroupsController _fixIndicesFrom:](a1, v6);
    id v7 = [v9 groupID];
    [a1[8] removeObjectForKey:v7];
    [a1[7] removeObjectForKey:v7];
    if (a3)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 22);
      [WeakRetained groupsController:a1 didRemoveGroup:v9 atIndex:v6];
    }
    id v5 = v9;
  }
}

- (void)handleUserPassDelete:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_groupIDsByPassUniqueID objectForKey:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_groupIDsByPassUniqueID removeObjectForKey:v4];
      unint64_t v6 = [(NSMutableDictionary *)self->_groupsByGroupID objectForKey:v5];
      if (-[PKGroup containsPassesInAdditionToUniqueID:]((uint64_t)v6, v4))
      {
        if (v6) {
          -[PKGroup _removeUniqueID:notify:](v6, v4, 1);
        }
      }
      else
      {
        -[PKGroupsController _removeGroup:notify:]((id *)&self->super.isa, v6, 1);
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_groupIDsByExpiredPassUniqueID removeObjectForKey:v4];
    }
    expiredSectionPasses = self->_expiredSectionPasses;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__PKGroupsController_handleUserPassDelete___block_invoke;
    v12[3] = &unk_1E56F4AE0;
    id v8 = v4;
    id v13 = v8;
    uint64_t v9 = [(NSArray *)expiredSectionPasses indexOfObjectPassingTest:v12];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [(NSArray *)self->_expiredSectionPasses pk_createArrayByRemovingObjectAtIndex:v9];
      uint64_t v11 = self->_expiredSectionPasses;
      self->_expiredSectionPasses = v10;

      [(NSMutableDictionary *)self->_passAnnotationsByUniqueId removeObjectForKey:v8];
    }
    [(PKPassLibrary *)self->_passLibrary removePassWithUniqueID:v8 diagnosticReason:@"User Deleted Pass"];
  }
}

uint64_t __43__PKGroupsController_handleUserPassDelete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)handleUserPassRecover:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    expiredSectionPasses = self->_expiredSectionPasses;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__PKGroupsController_handleUserPassRecover___block_invoke;
    v14[3] = &unk_1E56F4AE0;
    id v7 = v4;
    id v15 = v7;
    uint64_t v8 = [(NSArray *)expiredSectionPasses indexOfObjectPassingTest:v14];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [(NSArray *)self->_expiredSectionPasses pk_createArrayByRemovingObjectAtIndex:v8];
      uint64_t v10 = self->_expiredSectionPasses;
      self->_expiredSectionPasses = v9;

      uint64_t v11 = [(NSArray *)self->_filteredPassUniqueIDs pk_arrayByRemovingObject:v7];
      filteredPassUniqueIDs = self->_filteredPassUniqueIDs;
      self->_filteredPassUniqueIDs = v11;

      [(NSMutableDictionary *)self->_groupIDsByExpiredPassUniqueID removeObjectForKey:v7];
      [(NSMutableDictionary *)self->_passAnnotationsByUniqueId removeObjectForKey:v7];
      id v13 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Attempting pass recovery with unique id:%@", buf, 0xCu);
      }

      [(PKPassLibrary *)self->_passLibrary recoverPassWithUniqueID:v7];
    }
  }
}

uint64_t __44__PKGroupsController_handleUserPassRecover___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)filteringEnabled
{
  if (self->_filters)
  {
    LOBYTE(refreshed) = 1;
  }
  else
  {
    int refreshed = PKExpiredPassesRefreshEnabled();
    if (refreshed) {
      LOBYTE(refreshed) = [(NSArray *)self->_expiredSectionPasses count] != 0;
    }
  }
  return refreshed;
}

- (void)suppressRemoteUpdates:(BOOL)a3
{
  self->_suppressRemoteUpdates = 1;
  self->_enqueueRemoteUpdates = a3;
  uint64_t v4 = -[PKGroupsController _copyRemoteCatalog]((uint64_t)self);
  catalogBeforeReordering = self->_catalogBeforeReordering;
  self->_catalogBeforeReordering = v4;
}

- (PKCatalog)_copyRemoteCatalog
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_alloc_init(PKCatalog);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v14;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        if (*(unsigned char *)(v8 + 56)) {
          goto LABEL_11;
        }
        uint64_t v9 = objc_msgSend(*(id *)(v8 + 24), "copy", (void)v13);
      }
      else
      {
        uint64_t v9 = 0;
      }
      uint64_t v10 = [(PKCatalog *)v2 groups];
      [v10 addObject:v9];

LABEL_11:
      ++v7;
    }
    while (v5 != v7);
    uint64_t v11 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    uint64_t v5 = v11;
  }
  while (v11);
LABEL_15:

  return v2;
}

- (void)moveGroupAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[PKGroupsController groupAtIndex:](self, "groupAtIndex:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PKGroupsController *)self _moveGroup:v7 fromIndex:a3 toIndex:a4 notify:0];
}

- (void)movePass:(id)a3 inGroup:(id)a4 toIndex:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_groups;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v21 = a5;
    uint64_t v13 = *(void *)v23;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
      long long v16 = [v15 groupID];
      id v17 = [v9 groupID];
      char v18 = [v16 isEqualToNumber:v17];

      if (v18) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    long long v19 = v15;

    if (!v19) {
      goto LABEL_13;
    }
    long long v20 = [v8 uniqueID];
    -[PKGroup _moveUniqueID:toIndex:notify:]((uint64_t)v19, v20, v21, 0);

    uint64_t v10 = v19;
  }
LABEL_12:

LABEL_13:
}

- (void)enableRemoteUpdates
{
  id v8 = -[PKGroupsController _copyRemoteCatalog]((uint64_t)self);
  if (-[PKCatalog isEquivalentToCatalog:](self->_catalogBeforeReordering, "isEquivalentToCatalog:"))
  {
    uint64_t v3 = [(NSMutableArray *)self->_enqueuedUpdates count];
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = [(NSMutableArray *)self->_enqueuedUpdates objectAtIndex:i];
        v6[2]();
      }
    }
  }
  else
  {
    [(PKPassLibrary *)self->_passLibrary sendUserEditedCatalog:v8];
  }
  [(NSMutableArray *)self->_enqueuedUpdates removeAllObjects];
  catalogBeforeReordering = self->_catalogBeforeReordering;
  self->_catalogBeforeReordering = 0;

  self->_suppressRemoteUpdates = 0;
}

- (void)addLocalPasses:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_storeStrong((id *)&self->_localPasses, a3);
  id v7 = objc_alloc_init(PKCatalogGroup);
  id v8 = PKUniqueNumber();
  [(PKCatalogGroup *)v7 setGroupID:v8];

  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v16 = [v15 uniqueID];
        id v17 = [(PKCatalogGroup *)v7 uniqueIDs];
        [v17 addObject:v16];

        [v9 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  char v18 = [PKGroup alloc];
  v30 = v7;
  long long v19 = -[PKGroup initWithCatalogGroup:passes:states:accounts:]((id *)&v18->super.isa, v7, v9, MEMORY[0x1E4F1CC08], 0);
  long long v20 = v19;
  if (v19) {
    *((unsigned char *)v19 + 56) = 1;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v21 = objc_msgSend(v9, "allKeys", v10);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        groupIDsByPassUniqueID = v6->_groupIDsByPassUniqueID;
        BOOL v28 = [v20 groupID];
        [(NSMutableDictionary *)groupIDsByPassUniqueID setObject:v28 forKey:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  -[PKGroupsController _insertGroup:atIndex:notify:]((uint64_t)v6, v20, 0, 1);
}

- (void)passLibrary:(id)a3 receivedUpdatedCatalog:(id)a4 passes:(id)a5 states:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!self->_limitedMode)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke;
    v12[3] = &unk_1E56DB988;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v10;
    id v15 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke_2;
  id v11 = &unk_1E56DB988;
  uint64_t v12 = v2;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  uint64_t v3 = &v8;
  uint64_t v4 = v3;
  if (v2)
  {
    if (*(unsigned char *)(v2 + 88))
    {
      if (*(unsigned char *)(v2 + 89))
      {
        id v5 = *(void **)(v2 + 104);
        uint64_t v6 = objc_msgSend(v3, "copy", v8, v9);
        id v7 = _Block_copy(v6);
        [v5 addObject:v7];
      }
    }
    else
    {
      v10((uint64_t)v3);
    }
  }
}

void __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke_2(uint64_t a1)
{
}

- (void)objectSettingsDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKGroupsController_objectSettingsDidChangeNotification___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __58__PKGroupsController_objectSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"PKPassLibraryUniqueIDUserInfo"];
  uint64_t v3 = [*(id *)(a1 + 40) passWithUniqueID:v2];
  id v4 = [v5 objectForKeyedSubscript:@"PKPassLibrarySettingsUserInfo"];
  objc_msgSend(v3, "setSettingsWithoutUpdatingDataAccessor:", objc_msgSend(v4, "unsignedIntegerValue"));
}

void __70__PKGroupsController__displayablePassesDictionaryFromSet_withCatalog___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueID];
  [v2 removeObjectForKey:v3];
}

void __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueID];
  [v2 removeObjectForKey:v3];
}

- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  [(NSMutableArray *)self->_groups removeObjectAtIndex:a4];
  [(NSMutableArray *)self->_groups insertObject:v13 atIndex:a5];
  if (a4 >= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = a4;
  }
  if (a4 <= a5) {
    unint64_t v11 = a5;
  }
  else {
    unint64_t v11 = a4;
  }
  do
    -[PKGroupsController _fixIndex:]((uint64_t)self, v10++);
  while (v10 <= v11);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained groupsController:self didMoveGroup:v13 fromIndex:a4 toIndex:a5];
  }
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PKGroupsController_accountAdded___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __35__PKGroupsController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        -[PKGroup updateAssociatedAccount:](*(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PKGroupsController_accountChanged___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __37__PKGroupsController_accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        -[PKGroup updateAssociatedAccount:](*(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PKGroupsController_accountRemoved___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __37__PKGroupsController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v2 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v3 = *(id *)(a1 + 40);
        if (v2)
        {
          uint64_t v29 = i;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v4 = *(id *)(v2 + 32);
          uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v5)
          {
            uint64_t v6 = v5;
            uint64_t v7 = *(void *)v39;
            while (2)
            {
              for (uint64_t j = 0; j != v6; ++j)
              {
                if (*(void *)v39 != v7) {
                  objc_enumerationMutation(v4);
                }
                long long v9 = [*(id *)(v2 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * j)];
                if ([v9 passType] == 1)
                {
                  long long v10 = [v9 associatedAccountServiceAccountIdentifier];
                  unint64_t v11 = [v3 accountIdentifier];
                  id v12 = v10;
                  id v13 = v11;
                  if (v12 == v13)
                  {

LABEL_25:
                    id v17 = *(void **)(v2 + 48);
                    char v18 = [v9 uniqueID];
                    [v17 removeObjectForKey:v18];

                    long long v19 = -[PKGroup observers](v2);
                    long long v34 = 0u;
                    long long v35 = 0u;
                    long long v36 = 0u;
                    long long v37 = 0u;
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
                    if (v20)
                    {
                      uint64_t v21 = v20;
                      uint64_t v22 = *(void *)v35;
                      do
                      {
                        for (uint64_t k = 0; k != v21; ++k)
                        {
                          if (*(void *)v35 != v22) {
                            objc_enumerationMutation(v19);
                          }
                          uint64_t v24 = *(void **)(*((void *)&v34 + 1) + 8 * k);
                          if (objc_opt_respondsToSelector()) {
                            [v24 group:v2 didRemoveAssociatedAccountForPass:v9];
                          }
                        }
                        uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
                      }
                      while (v21);
                    }

                    goto LABEL_35;
                  }
                  id v14 = v13;
                  if (v12) {
                    BOOL v15 = v13 == 0;
                  }
                  else {
                    BOOL v15 = 1;
                  }
                  if (v15)
                  {
                  }
                  else
                  {
                    char v16 = [v12 isEqualToString:v13];

                    if (v16) {
                      goto LABEL_25;
                    }
                  }
                }
              }
              uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }
LABEL_35:

          uint64_t i = v29;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v28);
  }
}

- (BOOL)reorderingEnabled
{
  return self->_reorderingEnabled;
}

- (void)setReorderingEnabled:(BOOL)a3
{
  self->_reorderingEnabled = a3;
}

- (NSArray)filteredPassUniqueIDs
{
  return self->_filteredPassUniqueIDs;
}

- (NSArray)expiredSectionPasses
{
  return self->_expiredSectionPasses;
}

- (NSMutableDictionary)passAnnotationsByUniqueId
{
  return self->_passAnnotationsByUniqueId;
}

- (PKGroupsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKGroupsControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passAnnotationsByUniqueId, 0);
  objc_storeStrong((id *)&self->_expiredSectionPasses, 0);
  objc_storeStrong((id *)&self->_filteredPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_localPasses, 0);
  objc_storeStrong((id *)&self->_enqueuedUpdates, 0);
  objc_storeStrong((id *)&self->_catalogBeforeReordering, 0);
  objc_storeStrong((id *)&self->_groupIDsByExpiredPassUniqueID, 0);
  objc_storeStrong((id *)&self->_groupIDsByPassUniqueID, 0);
  objc_storeStrong((id *)&self->_indicesByGroupID, 0);
  objc_storeStrong((id *)&self->_groupsByGroupID, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_allowedPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end