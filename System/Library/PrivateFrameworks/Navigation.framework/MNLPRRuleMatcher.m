@interface MNLPRRuleMatcher
- (id)debug_jsonDescriptionOfLastPlate;
- (id)generateMaskedPlateForWaypoints:(id)a3 date:(id)a4 timeZone:(id)a5 error:(id *)a6;
- (id)initForVehicle:(id)a3 withRules:(id)a4;
@end

@implementation MNLPRRuleMatcher

- (id)initForVehicle:(id)a3 withRules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNLPRRuleMatcher;
  v8 = [(MNLPRRuleMatcher *)&v14 self];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = [v7 copy];
    v12 = (void *)v8[2];
    v8[2] = v11;
  }
  return v8;
}

- (id)generateMaskedPlateForWaypoints:(id)a3 date:(id)a4 timeZone:(id)a5 error:(id *)a6
{
  v599[16] = *MEMORY[0x1E4F143B8];
  id v441 = a3;
  id v402 = a4;
  id v400 = a5;
  uint64_t v9 = MNGetMNLPRRuleMatcherLog();
  self->_os_signpost_id_t signpost = os_signpost_id_generate(v9);

  v427 = self;
  lastPlate = self->_lastPlate;
  self = (MNLPRRuleMatcher *)((char *)self + 32);
  self->super.isa = 0;

  locatiouint64_t n = self;
  objc_storeStrong((id *)&self->_vehicle, a4);
  objc_storeStrong((id *)&v427->_lastTimeZone, a5);
  usedRegions = v427->_usedRegions;
  v427->_usedRegions = (NSDictionary *)MEMORY[0x1E4F1CC08];

  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  p_usedRegions = (id *)&v427->_usedRegions;
  v12 = v427->_ruleSets;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v557 objects:v599 count:16];
  if (!v13)
  {
LABEL_9:

    _mnLPRWrappedError(a6, -3, 0, @"Empty rules \"%@\"", v18, v19, v20, v21, (uint64_t)v427->_ruleSets);
    [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"EmptyRules"];
LABEL_35:
    id v52 = 0;
    goto LABEL_367;
  }
  uint64_t v14 = *(void *)v558;
LABEL_3:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v558 != v14) {
      objc_enumerationMutation(v12);
    }
    v16 = [*(id *)(*((void *)&v557 + 1) + 8 * v15) licensePlateRegions];
    BOOL v17 = [v16 count] == 0;

    if (!v17) {
      break;
    }
    if (v13 == ++v15)
    {
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v557 objects:v599 count:16];
      if (!v13) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }

  if (![v441 count])
  {
    _mnLPRWrappedError(a6, -6, 0, @"No waypoints specified \"%@\"", v22, v23, v24, v25, (uint64_t)v441);
    [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"EmptyRegions"];
    goto LABEL_35;
  }
  if (!v427->_vehicle)
  {
    _mnLPRWrappedError(a6, -4, 0, @"Empty vehicle \"%@\"", v22, v23, v24, v25, 0);
    [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"EmptyVehicle"];
    goto LABEL_35;
  }
  v26 = MNGetMNLPRRuleMatcherLog();
  v27 = v26;
  os_signpost_id_t signpost = v427->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    LOWORD(v592.receiver) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "MaskPlate", "", (uint8_t *)&v592, 2u);
  }

  v29 = MNGetMNLPRRuleMatcherLog();
  v30 = v29;
  os_signpost_id_t v31 = v427->_signpost;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    v32 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
    int v33 = [v32 length];
    LODWORD(v592.receiver) = 67109120;
    HIDWORD(v592.receiver) = v33;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PreparePlate", "length=%d", (uint8_t *)&v592, 8u);
  }
  v34 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
  v381 = objc_msgSend(v34, "mnlpr_componentsSeparatedByGlyph");

  if (v381)
  {
    v35 = (void *)MEMORY[0x1E4F1CA48];
    v36 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
    v447 = objc_msgSend(v35, "arrayWithCapacity:", objc_msgSend(v36, "length"));

    long long v556 = 0u;
    long long v555 = 0u;
    long long v554 = 0u;
    long long v553 = 0u;
    id v37 = v381;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v553 objects:v598 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v554;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v554 != v39) {
            objc_enumerationMutation(v37);
          }
          v41 = *(void **)(*((void *)&v553 + 1) + 8 * i);
          v42 = [_MNLPRPlateCharacter alloc];
          id v43 = v41;
          if (v42)
          {
            v592.receiver = v42;
            v592.super_class = (Class)_MNLPRPlateCharacter;
            v44 = [(MNLPRRuleMatcher *)&v592 init];
            v42 = (_MNLPRPlateCharacter *)v44;
            if (v44)
            {
              objc_storeStrong((id *)&v44->_lastPlate, v41);
              valueMappings = v42->_valueMappings;
              v42->_valueMappings = 0;

              uint64_t v46 = [MEMORY[0x1E4F1CA60] dictionary];
              fillTypes = v42->_fillTypes;
              v42->_fillTypes = (NSMutableDictionary *)v46;
            }
          }

          [v447 addObject:v42];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v553 objects:v598 count:16];
      }
      while (v38);
    }

    if (![v447 count])
    {
      v58 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
      _mnLPRWrappedError(a6, -5, 0, @"Failed to generate plate abstraction for license \"%@\"", v59, v60, v61, v62, (uint64_t)v58);

      v63 = MNGetMNLPRRuleMatcherLog();
      v64 = v63;
      os_signpost_id_t v65 = v427->_signpost;
      if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        LOWORD(v592.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v64, OS_SIGNPOST_INTERVAL_END, v65, "PreparePlate", "failed", (uint8_t *)&v592, 2u);
      }

      v66 = MNGetMNLPRRuleMatcherLog();
      v67 = v66;
      os_signpost_id_t v68 = v427->_signpost;
      if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        LOWORD(v592.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v67, OS_SIGNPOST_INTERVAL_END, v68, "MaskPlate", "failed", (uint8_t *)&v592, 2u);
      }

      [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"EmptyLicensePlate"];
      id v52 = 0;
LABEL_365:

      goto LABEL_366;
    }
    v48 = [_MNLPRPlate alloc];
    id v49 = v447;
    if (v48
      && (v592.receiver = v48,
          v592.super_class = (Class)_MNLPRPlate,
          (obuint64_t j = [(MNLPRRuleMatcher *)&v592 init]) != 0))
    {
      uint64_t v50 = [v49 copy];
      vehicle = obj->_vehicle;
      obj->_vehicle = (GEOLPRVehicle *)v50;
    }
    else
    {
      obuint64_t j = 0;
    }

    objc_storeStrong((id *)&location->super.isa, obj);
    v69 = MNGetMNLPRRuleMatcherLog();
    v70 = v69;
    os_signpost_id_t v71 = v427->_signpost;
    if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(v592.receiver) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v70, OS_SIGNPOST_INTERVAL_END, v71, "PreparePlate", "success", (uint8_t *)&v592, 2u);
    }

    v72 = MNGetMNLPRRuleMatcherLog();
    v73 = v72;
    os_signpost_id_t v74 = v427->_signpost;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      LOWORD(v592.receiver) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v74, "FindPlateRegions", "", (uint8_t *)&v592, 2u);
    }

    GEOConfigGetDouble();
    double v76 = v75;
    v77 = [MEMORY[0x1E4F1CA48] array];
    long long v552 = 0u;
    long long v551 = 0u;
    long long v550 = 0u;
    long long v549 = 0u;
    v78 = v427->_ruleSets;
    uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v549 objects:v597 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v550;
      do
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v550 != v80) {
            objc_enumerationMutation(v78);
          }
          v82 = [*(id *)(*((void *)&v549 + 1) + 8 * j) plateRegionsContainingLatLngs:v441 inRadius:v76];
          [v77 addObjectsFromArray:v82];
        }
        uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v549 objects:v597 count:16];
      }
      while (v79);
    }

    v83 = MNGetMNLPRRuleMatcherLog();
    v84 = v83;
    os_signpost_id_t v85 = v427->_signpost;
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
    {
      int v86 = [v77 count];
      LODWORD(v592.receiver) = 67109120;
      HIDWORD(v592.receiver) = v86;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v84, OS_SIGNPOST_INTERVAL_END, v85, "FindPlateRegions", "matched=%d", (uint8_t *)&v592, 8u);
    }

    v87 = [v441 firstObject];
    [v87 coordinate];
    uint64_t v89 = v88;
    uint64_t v91 = v90;

    GEOConfigGetDouble();
    v542[0] = MEMORY[0x1E4F143A8];
    v542[1] = 3221225472;
    v542[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke;
    v542[3] = &unk_1E60F75E0;
    uint64_t v546 = v92;
    id v373 = v402;
    id v543 = v373;
    v544 = v427;
    id v383 = v441;
    id v545 = v383;
    uint64_t v547 = v89;
    uint64_t v548 = v91;
    v385 = (void (**)(void, void))MEMORY[0x1BA99B3A0](v542);
    id v379 = [MEMORY[0x1E4F1CA60] dictionary];
    id v387 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong(p_usedRegions, v379);
    objc_storeStrong((id *)&v427->_usedRegionETAs, v387);
    v592.receiver = 0;
    v592.super_class = (Class)&v592;
    uint64_t v593 = 0x3032000000;
    v594 = __Block_byref_object_copy__5;
    v595 = __Block_byref_object_dispose__5;
    id v596 = 0;
    v375 = [MEMORY[0x1E4F1CA80] set];
    v376 = [MEMORY[0x1E4F1CA48] array];
    v434 = [MEMORY[0x1E4F1CA48] array];
    v374 = [MEMORY[0x1E4F1CA48] array];
    v93 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    v94 = MNGetMNLPRRuleMatcherLog();
    v95 = v94;
    os_signpost_id_t v96 = v427->_signpost;
    if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v96, "FindRules", "", buf, 2u);
    }

    long long v541 = 0u;
    long long v540 = 0u;
    long long v539 = 0u;
    long long v538 = 0u;
    id v382 = v77;
    uint64_t v97 = [v382 countByEnumeratingWithState:&v538 objects:v591 count:16];
    if (v97)
    {
      char v98 = 0;
      char v399 = 0;
      id v392 = (id)v97;
      uint64_t v393 = *(void *)v539;
      do
      {
        id v418 = 0;
        do
        {
          if (*(void *)v539 != v393) {
            objc_enumerationMutation(v382);
          }
          v411 = *(void **)(*((void *)&v538 + 1) + 8 * (void)v418);
          v99 = [v411 plateInfosMatchingVehicle:v427->_vehicle];
          if ([v99 count])
          {
            v398 = v99;
            v100 = [v99 firstObject];
            v421 = [v100 licensePlateStructure];

            v431 = [v421 supportedNumericCharacterSet];
            v428 = [v421 supportedAlphabeticCharacterSet];
            v101 = [v411 restrictionRegionsContainingLatLngs:v383 inRadius:v76];
            BOOL v397 = [v101 count] != 0;
            v408 = [MEMORY[0x1E4F1CA48] array];
            long long v537 = 0u;
            long long v536 = 0u;
            long long v535 = 0u;
            long long v534 = 0u;
            id v413 = v101;
            uint64_t v389 = [v413 countByEnumeratingWithState:&v534 objects:v590 count:16];
            if (v389)
            {
              uint64_t v391 = *(void *)v535;
              while (2)
              {
                for (uint64_t k = 0; k != v389; ++k)
                {
                  if (*(void *)v535 != v391) {
                    objc_enumerationMutation(v413);
                  }
                  v424 = *(void **)(*((void *)&v534 + 1) + 8 * k);
                  v102 = MNGetMNLPRRuleMatcherLog();
                  v103 = v102;
                  os_signpost_id_t v104 = v427->_signpost;
                  if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B542B000, v103, OS_SIGNPOST_INTERVAL_BEGIN, v104, "ExamineRegion", "", buf, 2u);
                  }

                  v105 = v427->_vehicle;
                  v106 = (id *)((char *)v592.super_class + 40);
                  id v533 = (id)*((void *)v592.super_class + 5);
                  id v415 = [v424 plateTypeIndexesMatchingVehicle:v105 error:&v533];
                  objc_storeStrong(v106, v533);
                  v107 = (void *)*((void *)v592.super_class + 5);
                  if (v107)
                  {
                    if (a6) {
                      *a6 = v107;
                    }
                    v211 = MNGetMNLPRRuleMatcherLog();
                    v108 = v211;
                    os_signpost_id_t v212 = v427->_signpost;
                    if (v212 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v211))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B542B000, v108, OS_SIGNPOST_INTERVAL_END, v212, "MaskPlate", "failed", buf, 2u);
                    }
LABEL_200:

                    int v204 = 0;
                    goto LABEL_201;
                  }
                  v108 = ((void (**)(void, void *))v385)[2](v385, v424);
                  v109 = [v424 identifier];
                  [v387 setObject:v108 forKeyedSubscript:v109];

                  long long v532 = 0u;
                  long long v531 = 0u;
                  long long v530 = 0u;
                  long long v529 = 0u;
                  id v403 = [v424 convertRules];
                  uint64_t v386 = [v403 countByEnumeratingWithState:&v529 objects:v589 count:16];
                  if (v386)
                  {
                    uint64_t v390 = *(void *)v530;
                    do
                    {
                      for (uint64_t m = 0; m != v386; ++m)
                      {
                        if (*(void *)v530 != v390) {
                          objc_enumerationMutation(v403);
                        }
                        v110 = *(void **)(*((void *)&v529 + 1) + 8 * m);
                        v111 = MNGetMNLPRRuleMatcherLog();
                        v112 = v111;
                        os_signpost_id_t v113 = v427->_signpost;
                        if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1B542B000, v112, OS_SIGNPOST_INTERVAL_BEGIN, v113, "ExamineRule", "", buf, 2u);
                        }

                        if ([v110 hasValidDateInterval])
                        {
                          long long v528 = 0u;
                          long long v527 = 0u;
                          long long v526 = 0u;
                          long long v525 = 0u;
                          v114 = v108;
                          uint64_t v115 = [v114 countByEnumeratingWithState:&v525 objects:v588 count:16];
                          if (v115)
                          {
                            uint64_t v116 = *(void *)v526;
                            while (2)
                            {
                              for (uint64_t n = 0; n != v115; ++n)
                              {
                                if (*(void *)v526 != v116) {
                                  objc_enumerationMutation(v114);
                                }
                                uint64_t v118 = *(void *)(*((void *)&v525 + 1) + 8 * n);
                                v119 = [v110 validDateInterval];
                                LOBYTE(v118) = [v119 containsDate:v118];

                                if (v118)
                                {

                                  goto LABEL_100;
                                }
                              }
                              uint64_t v115 = [v114 countByEnumeratingWithState:&v525 objects:v588 count:16];
                              if (v115) {
                                continue;
                              }
                              break;
                            }
                          }

                          v120 = MNGetMNLPRRuleMatcherLog();
                          v121 = v120;
                          os_signpost_id_t v122 = v427->_signpost;
                          if (v122 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v121, OS_SIGNPOST_INTERVAL_END, v122, "ExamineRule", "skipped, not valid for date", buf, 2u);
                          }
                        }
                        else
                        {
LABEL_100:
                          v123 = [v424 definedPlateTypes];
                          v401 = [v110 pickupRulesForPlateTypes:v123 atIndexes:v415];

                          v124 = [v424 definedPlateTypes];
                          v125 = [v110 mapRulesForPlateTypes:v124 atIndexes:v415];

                          v126 = [v424 definedPlateTypes];
                          v388 = [v110 fillRulesForPlateTypes:v126 atIndexes:v415];

                          objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v401, "count"));
                          locationa = (id *)objc_claimAutoreleasedReturnValue();
                          v127 = MNGetMNLPRRuleMatcherLog();
                          v128 = v127;
                          os_signpost_id_t v129 = v427->_signpost;
                          if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v128, OS_SIGNPOST_INTERVAL_BEGIN, v129, "ExamineMapRules", "", buf, 2u);
                          }

                          long long v524 = 0u;
                          long long v523 = 0u;
                          long long v522 = 0u;
                          long long v521 = 0u;
                          v404 = v125;
                          uint64_t v130 = [v404 countByEnumeratingWithState:&v521 objects:v587 count:16];
                          if (v130)
                          {
                            id v394 = *(id *)v522;
                            do
                            {
                              for (iuint64_t i = 0; ii != (id)v130; iuint64_t i = (char *)ii + 1)
                              {
                                if (*(id *)v522 != v394) {
                                  objc_enumerationMutation(v404);
                                }
                                v131 = *(void **)(*((void *)&v521 + 1) + 8 * (void)ii);
                                [v131 setMrLicensePlateStructure:v421];
                                long long v520 = 0u;
                                long long v519 = 0u;
                                long long v518 = 0u;
                                long long v517 = 0u;
                                v132 = [v131 targetChars];
                                uint64_t v133 = [v132 countByEnumeratingWithState:&v517 objects:v586 count:16];
                                if (v133)
                                {
                                  uint64_t v134 = *(void *)v518;
                                  while (2)
                                  {
                                    for (juint64_t j = 0; jj != v133; ++jj)
                                    {
                                      if (*(void *)v518 != v134) {
                                        objc_enumerationMutation(v132);
                                      }
                                      v136 = *(void **)(*((void *)&v517 + 1) + 8 * jj);
                                      uint64_t v137 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v136, v428, v431);
                                      if (v137 == 0x7FFFFFFFFFFFFFFFLL)
                                      {
                                        _mnLPRWrappedError(a6, -108, 0, @"unable to locate plate char for map rule target: %@", v138, v139, v140, v141, (uint64_t)v136);
                                        v205 = MNGetMNLPRRuleMatcherLog();
                                        v206 = v205;
                                        os_signpost_id_t v207 = v427->_signpost;
                                        if (v207 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v205))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_signpost_emit_with_name_impl(&dword_1B542B000, v206, OS_SIGNPOST_INTERVAL_END, v207, "MaskPlate", "failed", buf, 2u);
                                        }

                                        [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"NoCharForTarget"];
                                        v395 = v404;
LABEL_199:

                                        char v98 = 1;
                                        goto LABEL_200;
                                      }
                                      v142 = [NSNumber numberWithUnsignedInteger:v137];
                                      v143 = [locationa objectForKeyedSubscript:v142];
                                      BOOL v144 = v143 == 0;

                                      if (v144)
                                      {
                                        v145 = [MEMORY[0x1E4F1CA48] array];
                                        [locationa setObject:v145 forKeyedSubscript:v142];
                                      }
                                      v146 = [locationa objectForKeyedSubscript:v142];
                                      [v146 addObject:v131];
                                    }
                                    uint64_t v133 = [v132 countByEnumeratingWithState:&v517 objects:v586 count:16];
                                    if (v133) {
                                      continue;
                                    }
                                    break;
                                  }
                                }
                              }
                              uint64_t v130 = [v404 countByEnumeratingWithState:&v521 objects:v587 count:16];
                            }
                            while (v130);
                          }

                          v147 = MNGetMNLPRRuleMatcherLog();
                          v148 = v147;
                          os_signpost_id_t v149 = v427->_signpost;
                          if (v149 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v148, OS_SIGNPOST_INTERVAL_END, v149, "ExamineMapRules", "", buf, 2u);
                          }

                          v150 = MNGetMNLPRRuleMatcherLog();
                          v151 = v150;
                          os_signpost_id_t v152 = v427->_signpost;
                          if (v152 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v151, OS_SIGNPOST_INTERVAL_BEGIN, v152, "ExaminePickupRules", "", buf, 2u);
                          }

                          long long v516 = 0u;
                          long long v515 = 0u;
                          long long v514 = 0u;
                          long long v513 = 0u;
                          v395 = v401;
                          v153 = v421;
                          uint64_t v377 = [v395 countByEnumeratingWithState:&v513 objects:v585 count:16];
                          if (v377)
                          {
                            uint64_t v378 = *(void *)v514;
                            do
                            {
                              for (uint64_t kk = 0; kk != v377; ++kk)
                              {
                                if (*(void *)v514 != v378) {
                                  objc_enumerationMutation(v395);
                                }
                                v154 = *(void **)(*((void *)&v513 + 1) + 8 * kk);
                                [v154 setPrLicensePlateStructure:v153];
                                long long v512 = 0u;
                                long long v511 = 0u;
                                long long v510 = 0u;
                                long long v509 = 0u;
                                v155 = [v154 pickupChars];
                                uint64_t v156 = [v155 countByEnumeratingWithState:&v509 objects:v584 count:16];
                                if (v156)
                                {
                                  id v436 = *(id *)v510;
                                  v132 = v155;
                                  while (2)
                                  {
                                    uint64_t v157 = v156;
                                    for (uint64_t mm = 0; mm != v157; ++mm)
                                    {
                                      if (*(id *)v510 != v436) {
                                        objc_enumerationMutation(v155);
                                      }
                                      v159 = *(void **)(*((void *)&v509 + 1) + 8 * mm);
                                      uint64_t v160 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v159, v428, v431);
                                      if (v160 == 0x7FFFFFFFFFFFFFFFLL)
                                      {
                                        _mnLPRWrappedError(a6, -108, 0, @"unable to locate plate char for pickup rule target: %@", v161, v162, v163, v164, (uint64_t)v159);
                                        v208 = MNGetMNLPRRuleMatcherLog();
                                        v209 = v208;
                                        os_signpost_id_t v210 = v427->_signpost;
                                        if (v210 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v208))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_signpost_emit_with_name_impl(&dword_1B542B000, v209, OS_SIGNPOST_INTERVAL_END, v210, "MaskPlate", "failed", buf, 2u);
                                        }

                                        [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"NoCharForTarget"];
                                        goto LABEL_199;
                                      }
                                      v165 = [NSNumber numberWithUnsignedInteger:v160];
                                      v166 = [locationa objectForKeyedSubscript:v165];
                                      BOOL v167 = v166 == 0;

                                      if (v167)
                                      {
                                        id v168 = objc_alloc_init(MEMORY[0x1E4F64610]);
                                        [v168 setMrLicensePlateStructure:v421];
                                        v169 = (void *)[v159 copy];
                                        [v168 addTargetChar:v169];

                                        id v170 = objc_alloc_init(MEMORY[0x1E4F64620]);
                                        v171 = [MEMORY[0x1E4F1CA48] array];
                                        [v170 setMappedValues:v171];

                                        [v168 addValueMapping:v170];
                                        v172 = [MEMORY[0x1E4F1CA48] arrayWithObject:v168];
                                        [locationa setObject:v172 forKeyedSubscript:v165];
                                      }
                                      v155 = v132;
                                    }
                                    uint64_t v156 = [v132 countByEnumeratingWithState:&v509 objects:v584 count:16];
                                    if (v156) {
                                      continue;
                                    }
                                    break;
                                  }
                                }

                                v153 = v421;
                              }
                              uint64_t v377 = [v395 countByEnumeratingWithState:&v513 objects:v585 count:16];
                            }
                            while (v377);
                          }

                          v173 = MNGetMNLPRRuleMatcherLog();
                          v174 = v173;
                          os_signpost_id_t v175 = v427->_signpost;
                          if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v173))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v174, OS_SIGNPOST_INTERVAL_END, v175, "ExaminePickupRules", "", buf, 2u);
                          }

                          long long v508 = 0u;
                          long long v507 = 0u;
                          long long v506 = 0u;
                          long long v505 = 0u;
                          id v437 = v388;
                          uint64_t v176 = [v437 countByEnumeratingWithState:&v505 objects:v583 count:16];
                          if (v176)
                          {
                            uint64_t v177 = *(void *)v506;
                            do
                            {
                              for (nuint64_t n = 0; nn != v176; ++nn)
                              {
                                if (*(void *)v506 != v177) {
                                  objc_enumerationMutation(v437);
                                }
                                [*(id *)(*((void *)&v505 + 1) + 8 * nn) setFrLicensePlateStructure:v421];
                              }
                              uint64_t v176 = [v437 countByEnumeratingWithState:&v505 objects:v583 count:16];
                            }
                            while (v176);
                          }

                          v179 = v395;
                          if ([v395 count]
                            || [locationa count]
                            || [v437 count])
                          {
                            uint64_t v180 = [v424 identifier];
                            v181 = (void *)v180;
                            v182 = @"<unknown>";
                            if (v180) {
                              v182 = (__CFString *)v180;
                            }
                            v183 = v182;

                            if ([v424 hasName])
                            {
                              v371 = [v424 name];
                              uint64_t v184 = [(__CFString *)v183 stringByAppendingFormat:@":%@"];

                              v183 = (__CFString *)v184;
                            }
                            [v375 addObject:v183];
                            [v408 addObject:v183];

                            v179 = v395;
                          }
                          [v376 addObjectsFromArray:v179];
                          long long v504 = 0u;
                          long long v503 = 0u;
                          long long v502 = 0u;
                          long long v501 = 0u;
                          v185 = [locationa allValues];
                          uint64_t v186 = [v185 countByEnumeratingWithState:&v501 objects:v582 count:16];
                          if (v186)
                          {
                            uint64_t v187 = *(void *)v502;
                            do
                            {
                              for (uint64_t i1 = 0; i1 != v186; ++i1)
                              {
                                if (*(void *)v502 != v187) {
                                  objc_enumerationMutation(v185);
                                }
                                v189 = *(void **)(*((void *)&v501 + 1) + 8 * i1);
                                [v434 addObjectsFromArray:v189];
                                long long v500 = 0u;
                                long long v499 = 0u;
                                long long v498 = 0u;
                                long long v497 = 0u;
                                id v190 = v189;
                                uint64_t v191 = [v190 countByEnumeratingWithState:&v497 objects:v581 count:16];
                                if (v191)
                                {
                                  uint64_t v192 = *(void *)v498;
                                  do
                                  {
                                    for (uint64_t i2 = 0; i2 != v191; ++i2)
                                    {
                                      if (*(void *)v498 != v192) {
                                        objc_enumerationMutation(v190);
                                      }
                                      [v93 setObject:v108 forKey:*(void *)(*((void *)&v497 + 1) + 8 * i2)];
                                    }
                                    uint64_t v191 = [v190 countByEnumeratingWithState:&v497 objects:v581 count:16];
                                  }
                                  while (v191);
                                }
                              }
                              uint64_t v186 = [v185 countByEnumeratingWithState:&v501 objects:v582 count:16];
                            }
                            while (v186);
                          }

                          [v374 addObjectsFromArray:v437];
                          v194 = MNGetMNLPRRuleMatcherLog();
                          v195 = v194;
                          os_signpost_id_t v196 = v427->_signpost;
                          if (v196 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v194))
                          {
                            int v197 = [v395 count];
                            int v198 = [locationa count];
                            int v199 = [v437 count];
                            *(_DWORD *)buf = 67109632;
                            *(_DWORD *)&buf[4] = v197;
                            LOWORD(v576) = 1024;
                            *(_DWORD *)((char *)&v576 + 2) = v198;
                            HIWORD(v576) = 1024;
                            LODWORD(v577) = v199;
                            _os_signpost_emit_with_name_impl(&dword_1B542B000, v195, OS_SIGNPOST_INTERVAL_END, v196, "ExamineRule", "pickup=%d, map=%d, fill=%d", buf, 0x14u);
                          }

                          char v98 = 1;
                          v121 = v395;
                        }
                      }
                      uint64_t v386 = [v403 countByEnumeratingWithState:&v529 objects:v589 count:16];
                    }
                    while (v386);
                  }

                  if ([v408 count])
                  {
                    v200 = [v411 identifier];
                    [v379 setObject:v408 forKeyedSubscript:v200];
                  }
                  v201 = MNGetMNLPRRuleMatcherLog();
                  v202 = v201;
                  os_signpost_id_t v203 = v427->_signpost;
                  if (v203 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v201))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B542B000, v202, OS_SIGNPOST_INTERVAL_END, v203, "ExamineRegion", "", buf, 2u);
                  }
                }
                int v204 = 1;
                uint64_t v389 = [v413 countByEnumeratingWithState:&v534 objects:v590 count:16];
                if (v389) {
                  continue;
                }
                break;
              }
            }
            else
            {
              int v204 = 1;
            }
LABEL_201:

            if (!v204)
            {

              id v52 = 0;
              goto LABEL_364;
            }
            v399 |= v397;
          }
          else
          {
          }
          id v418 = (char *)v418 + 1;
        }
        while (v418 != v392);
        uint64_t v213 = [v382 countByEnumeratingWithState:&v538 objects:v591 count:16];
        id v392 = (id)v213;
      }
      while (v213);
    }
    else
    {
      char v98 = 0;
      char v399 = 0;
    }

    v214 = MNGetMNLPRRuleMatcherLog();
    v215 = v214;
    os_signpost_id_t v216 = v427->_signpost;
    if (v216 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v214))
    {
      int v217 = [v376 count];
      int v218 = [v434 count];
      int v219 = [v374 count];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v217;
      LOWORD(v576) = 1024;
      *(_DWORD *)((char *)&v576 + 2) = v218;
      HIWORD(v576) = 1024;
      LODWORD(v577) = v219;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v215, OS_SIGNPOST_INTERVAL_END, v216, "FindRules", "pickup=%d, map=%d, fill=%d", buf, 0x14u);
    }

    *(void *)buf = 0;
    v576 = buf;
    uint64_t v577 = 0x3032000000;
    v578 = __Block_byref_object_copy__5;
    v579 = __Block_byref_object_dispose__5;
    id v580 = 0;
    v495[0] = 0;
    v495[1] = v495;
    v495[2] = 0x3032000000;
    v495[3] = __Block_byref_object_copy__5;
    v495[4] = __Block_byref_object_dispose__5;
    id v496 = 0;
    v490[0] = MEMORY[0x1E4F143A8];
    v490[1] = 3221225472;
    v490[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_196;
    v490[3] = &unk_1E60F7608;
    v493 = buf;
    v494 = v495;
    id v491 = v400;
    v492 = v427;
    v220 = (void *)MEMORY[0x1BA99B3A0](v490);
    v221 = MNGetMNLPRRuleMatcherLog();
    v222 = v221;
    os_signpost_id_t v223 = v427->_signpost;
    if (v223 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v221))
    {
      int v224 = [v434 count];
      *(_DWORD *)v565 = 67109120;
      *(_DWORD *)&v565[4] = v224;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v222, OS_SIGNPOST_INTERVAL_BEGIN, v223, "FilterMapRules", "count=%d", v565, 8u);
    }

    v225 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v434, "count"));
    v485[0] = MEMORY[0x1E4F143A8];
    v485[1] = 3221225472;
    v485[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_199;
    v485[3] = &unk_1E60F7658;
    id v486 = v93;
    id v487 = v373;
    id v412 = v220;
    id v489 = v412;
    id v414 = v225;
    id v488 = v414;
    [v434 enumerateObjectsUsingBlock:v485];
    v226 = MNGetMNLPRRuleMatcherLog();
    v227 = v226;
    os_signpost_id_t v228 = v427->_signpost;
    if (v228 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v226))
    {
      int v229 = [v414 count];
      *(_DWORD *)v565 = 67109120;
      *(_DWORD *)&v565[4] = v229;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v227, OS_SIGNPOST_INTERVAL_END, v228, "FilterMapRules", "count=%d", v565, 8u);
    }

    if (![v376 count] || !objc_msgSend(v414, "count") && !objc_msgSend(v374, "count"))
    {
      if (v399)
      {
        if (v98)
        {
          _mnLPRWrappedError(a6, -11, 0, @"No pickup or mapping rules available for provided vehicle", v230, v231, v232, v233, (uint64_t)v371);
          v330 = @"NoRulesForVehicle";
        }
        else
        {
          _mnLPRWrappedError(a6, -12, 0, @"No pickup or mapping rules available for provided time interval", v230, v231, v232, v233, (uint64_t)v371);
          v330 = @"EmptyRulesForTimeRange";
        }
      }
      else
      {
        _mnLPRWrappedError(a6, -10, 0, @"No pickup or mapping rules available for provided regions", v230, v231, v232, v233, (uint64_t)v371);
        v330 = @"NoRulesForRegion";
      }
      [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:v330];
      v331 = MNGetMNLPRRuleMatcherLog();
      v332 = v331;
      os_signpost_id_t v333 = v427->_signpost;
      if (v333 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v331))
      {
        *(_WORD *)v565 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v332, OS_SIGNPOST_INTERVAL_END, v333, "MaskPlate", "failed", v565, 2u);
      }

      id v52 = 0;
LABEL_363:

      _Block_object_dispose(v495, 8);
      _Block_object_dispose(buf, 8);

LABEL_364:
      _Block_object_dispose(&v592, 8);

      goto LABEL_365;
    }
    v234 = MNGetMNLPRRuleMatcherLog();
    v235 = v234;
    os_signpost_id_t v236 = v427->_signpost;
    if (v236 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v234))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v235, OS_SIGNPOST_INTERVAL_BEGIN, v236, "BuildPickupRules", "", v565, 2u);
    }

    long long v483 = 0u;
    long long v484 = 0u;
    long long v481 = 0u;
    long long v482 = 0u;
    id v438 = v376;
    uint64_t v237 = [v438 countByEnumeratingWithState:&v481 objects:v574 count:16];
    if (v237)
    {
      locationb = *(id **)v482;
      do
      {
        for (uint64_t i3 = 0; i3 != v237; ++i3)
        {
          if (*(id **)v482 != locationb) {
            objc_enumerationMutation(v438);
          }
          v239 = *(void **)(*((void *)&v481 + 1) + 8 * i3);
          v240 = [v239 prLicensePlateStructure];
          v241 = [v240 supportedNumericCharacterSet];

          v242 = [v239 prLicensePlateStructure];
          v243 = [v242 supportedAlphabeticCharacterSet];

          long long v479 = 0u;
          long long v480 = 0u;
          long long v477 = 0u;
          long long v478 = 0u;
          v244 = [v239 pickupChars];
          uint64_t v245 = [v244 countByEnumeratingWithState:&v477 objects:v573 count:16];
          if (v245)
          {
            uint64_t v246 = *(void *)v478;
            do
            {
              for (uint64_t i4 = 0; i4 != v245; ++i4)
              {
                if (*(void *)v478 != v246) {
                  objc_enumerationMutation(v244);
                }
                -[_MNLPRPlate charMatching:alphabetics:numerics:](obj, *(void **)(*((void *)&v477 + 1) + 8 * i4), v243, v241);
                v248 = (unsigned char *)objc_claimAutoreleasedReturnValue();
                if (v248) {
                  v248[24] = 1;
                }
              }
              uint64_t v245 = [v244 countByEnumeratingWithState:&v477 objects:v573 count:16];
            }
            while (v245);
          }
        }
        uint64_t v237 = [v438 countByEnumeratingWithState:&v481 objects:v574 count:16];
      }
      while (v237);
    }

    v249 = MNGetMNLPRRuleMatcherLog();
    v250 = v249;
    os_signpost_id_t v251 = v427->_signpost;
    if (v251 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v249))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v250, OS_SIGNPOST_INTERVAL_END, v251, "BuildPickupRules", "", v565, 2u);
    }

    v252 = MNGetMNLPRRuleMatcherLog();
    v253 = v252;
    os_signpost_id_t v254 = v427->_signpost;
    if (v254 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v252))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v253, OS_SIGNPOST_INTERVAL_BEGIN, v254, "BuildMapRules", "", v565, 2u);
    }

    long long v475 = 0u;
    long long v476 = 0u;
    long long v473 = 0u;
    long long v474 = 0u;
    id v255 = v414;
    uint64_t v256 = [v255 countByEnumeratingWithState:&v473 objects:v572 count:16];
    if (v256)
    {
      uint64_t v409 = *(void *)v474;
      id v405 = v255;
      do
      {
        v257 = 0;
        v407 = (char *)v256;
        do
        {
          if (*(void *)v474 != v409) {
            objc_enumerationMutation(v255);
          }
          v416 = v257;
          v422 = *(void **)(*((void *)&v473 + 1) + 8 * (void)v257);
          v258 = [v422 mrLicensePlateStructure];
          v432 = [v258 supportedNumericCharacterSet];

          v259 = [v422 mrLicensePlateStructure];
          v429 = [v259 supportedAlphabeticCharacterSet];

          long long v471 = 0u;
          long long v472 = 0u;
          long long v469 = 0u;
          long long v470 = 0u;
          id v419 = [v422 targetChars];
          v439 = (id *)[v419 countByEnumeratingWithState:&v469 objects:v571 count:16];
          if (v439)
          {
            uint64_t v425 = *(void *)v470;
            do
            {
              for (locationc = 0; locationc != v439; locationc = (id *)((char *)locationc + 1))
              {
                if (*(void *)v470 != v425) {
                  objc_enumerationMutation(v419);
                }
                -[_MNLPRPlate charMatching:alphabetics:numerics:](obj, *(void **)(*((void *)&v469 + 1) + 8 * (void)locationc), v429, v432);
                v260 = (id *)objc_claimAutoreleasedReturnValue();
                if (v260)
                {
                  long long v467 = 0u;
                  long long v468 = 0u;
                  long long v465 = 0u;
                  long long v466 = 0u;
                  v261 = [v422 valueMappings];
                  uint64_t v262 = [v261 countByEnumeratingWithState:&v465 objects:v570 count:16];
                  if (v262)
                  {
                    uint64_t v263 = *(void *)v466;
                    do
                    {
                      for (uint64_t i5 = 0; i5 != v262; ++i5)
                      {
                        if (*(void *)v466 != v263) {
                          objc_enumerationMutation(v261);
                        }
                        v265 = *(void **)(*((void *)&v465 + 1) + 8 * i5);
                        if ([v265 valuesCount])
                        {
                          v266 = [v265 values];
                          id v267 = v260[4];
                          int v268 = [v266 containsObject:v267];

                          if (!v268) {
                            continue;
                          }
                        }
                        id v269 = v265;
                        if ([v269 mappedValuesCount]) {
                          [v269 mappedValues];
                        }
                        else {
                        v270 = [v269 values];
                        }
                        if (v260[1])
                        {
                          id v271 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v270];
                          [v260[1] intersectOrderedSet:v271];
                        }
                        else
                        {
                          uint64_t v272 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v270];
                          id v271 = v260[1];
                          v260[1] = (id)v272;
                        }
                      }
                      uint64_t v262 = [v261 countByEnumeratingWithState:&v465 objects:v570 count:16];
                    }
                    while (v262);
                  }
                }
              }
              v439 = (id *)[v419 countByEnumeratingWithState:&v469 objects:v571 count:16];
            }
            while (v439);
          }

          v257 = v416 + 1;
          id v255 = v405;
        }
        while (v416 + 1 != v407);
        uint64_t v256 = [v405 countByEnumeratingWithState:&v473 objects:v572 count:16];
      }
      while (v256);
    }

    v273 = MNGetMNLPRRuleMatcherLog();
    v274 = v273;
    os_signpost_id_t v275 = v427->_signpost;
    if (v275 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v273))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v274, OS_SIGNPOST_INTERVAL_END, v275, "BuildMapRules", "", v565, 2u);
    }

    v276 = MNGetMNLPRRuleMatcherLog();
    v277 = v276;
    os_signpost_id_t v278 = v427->_signpost;
    if (v278 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v276))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v277, OS_SIGNPOST_INTERVAL_BEGIN, v278, "BuildFillRules", "", v565, 2u);
    }

    long long v463 = 0u;
    long long v464 = 0u;
    long long v461 = 0u;
    long long v462 = 0u;
    id v417 = v374;
    uint64_t v423 = [v417 countByEnumeratingWithState:&v461 objects:v569 count:16];
    if (v423)
    {
      id v420 = *(id *)v462;
      do
      {
        uint64_t v433 = 0;
        do
        {
          if (*(id *)v462 != v420) {
            objc_enumerationMutation(v417);
          }
          v279 = *(void **)(*((void *)&v461 + 1) + 8 * v433);
          v280 = [v279 frLicensePlateStructure];
          v430 = [v280 supportedNumericCharacterSet];

          v281 = [v279 frLicensePlateStructure];
          v426 = [v281 supportedAlphabeticCharacterSet];

          if (obj) {
            uint64_t v282 = [(GEOLPRVehicle *)obj->_vehicle count];
          }
          else {
            uint64_t v282 = 0;
          }
          if ([v279 hasFromChar])
          {
            v283 = [v279 fromChar];
            unint64_t v284 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v283, v426, v430);

            if (v284 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v284 = 0;
            }
          }
          else
          {
            unint64_t v284 = 0;
          }
          v285 = (void *)(v282 - 1);
          if ([v279 hasToChar])
          {
            v286 = [v279 toChar];
            uint64_t v287 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v286, v426, v430);

            if (v287 != 0x7FFFFFFFFFFFFFFFLL) {
              v285 = (void *)v287;
            }
          }
          id v440 = v285;
          if (v284 <= (unint64_t)v285)
          {
            while (obj && [(GEOLPRVehicle *)obj->_vehicle count] > v284)
            {
              uint64_t v288 = [(GEOLPRVehicle *)obj->_vehicle objectAtIndexedSubscript:v284];
              v289 = (void *)v288;
              if (!v288) {
                goto LABEL_312;
              }
              if (!*(unsigned char *)(v288 + 24))
              {
                char locationd = 0;
                goto LABEL_313;
              }
LABEL_329:

              if (++v284 > (unint64_t)v440) {
                goto LABEL_304;
              }
            }
            v289 = 0;
LABEL_312:
            char locationd = 1;
LABEL_313:
            int v290 = [v279 fillType];
            switch(v290)
            {
              case 1:
                v291 = [v279 frLicensePlateStructure];
                v294 = [v291 supportedPlateAlphabetLetters];
                v295 = [v279 frLicensePlateStructure];
                v296 = [v295 supportedPlateNumerics];
                v293 = [v294 stringByAppendingString:v296];

                break;
              case 2:
                v291 = [v279 frLicensePlateStructure];
                uint64_t v292 = [v291 supportedPlateAlphabetLetters];
LABEL_318:
                v293 = (void *)v292;
                break;
              case 3:
                v291 = [v279 frLicensePlateStructure];
                uint64_t v292 = [v291 supportedPlateNumerics];
                goto LABEL_318;
              default:
                v293 = 0;
LABEL_322:
                if (locationd) {
                  v297 = 0;
                }
                else {
                  v297 = (void *)v289[5];
                }
                id v298 = v297;
                v299 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v279, "fillType"));
                v300 = [v298 objectForKeyedSubscript:v299];

                if (v300)
                {
                  v301 = (void *)MEMORY[0x1E4F1CA70];
                  v302 = objc_msgSend(v300, "mnlpr_componentsSeparatedByGlyph");
                  v303 = [v301 orderedSetWithArray:v302];

                  v304 = (void *)MEMORY[0x1E4F1CAA0];
                  v305 = objc_msgSend(v293, "mnlpr_componentsSeparatedByGlyph");
                  v306 = [v304 orderedSetWithArray:v305];

                  [v303 intersectOrderedSet:v306];
                  v307 = [v303 array];
                  uint64_t v308 = [v307 componentsJoinedByString:&stru_1F0E08010];

                  v293 = (void *)v308;
                }
                if (locationd) {
                  v309 = 0;
                }
                else {
                  v309 = (void *)v289[5];
                }
                id v310 = v309;
                v311 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v279, "fillType"));
                [v310 setObject:v293 forKeyedSubscript:v311];

                goto LABEL_329;
            }

            goto LABEL_322;
          }
LABEL_304:

          ++v433;
        }
        while (v433 != v423);
        uint64_t v312 = [v417 countByEnumeratingWithState:&v461 objects:v569 count:16];
        uint64_t v423 = v312;
      }
      while (v312);
    }

    v313 = MNGetMNLPRRuleMatcherLog();
    v314 = v313;
    os_signpost_id_t v315 = v427->_signpost;
    if (v315 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v313))
    {
      *(_WORD *)v565 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v314, OS_SIGNPOST_INTERVAL_END, v315, "BuildFillRules", "", v565, 2u);
    }

    *(void *)v565 = 0;
    v566 = v565;
    uint64_t v567 = 0x2020000000;
    uint64_t v568 = 0;
    uint64_t v457 = 0;
    v458 = &v457;
    uint64_t v459 = 0x2020000000;
    uint64_t v460 = 1;
    v316 = (void *)MEMORY[0x1E4F1CA48];
    if (obj) {
      uint64_t v317 = [(GEOLPRVehicle *)obj->_vehicle count];
    }
    else {
      uint64_t v317 = 0;
    }
    v318 = [v316 arrayWithCapacity:v317];
    v319 = MNGetMNLPRRuleMatcherLog();
    v320 = v319;
    os_signpost_id_t v321 = v427->_signpost;
    if (v321 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v319))
    {
      *(_WORD *)v561 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v320, OS_SIGNPOST_INTERVAL_BEGIN, v321, "ScoreRules", "", v561, 2u);
    }

    v452[0] = MEMORY[0x1E4F143A8];
    v452[1] = 3221225472;
    v452[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_224;
    v452[3] = &unk_1E60F7680;
    v454 = &v592;
    id v322 = v318;
    id v453 = v322;
    v455 = v565;
    v456 = &v457;
    -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)obj, v452);
    v323 = MNGetMNLPRRuleMatcherLog();
    v324 = v323;
    os_signpost_id_t v325 = v427->_signpost;
    if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v323))
    {
      *(_WORD *)v561 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v324, OS_SIGNPOST_INTERVAL_END, v325, "ScoreRules", "", v561, 2u);
    }

    v326 = (void *)*((void *)v592.super_class + 5);
    if (v326)
    {
      if (a6) {
        *a6 = v326;
      }
      v327 = MNGetMNLPRRuleMatcherLog();
      v328 = v327;
      os_signpost_id_t v329 = v427->_signpost;
      if (v329 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v327))
      {
        *(_WORD *)v561 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v328, OS_SIGNPOST_INTERVAL_END, v329, "MaskPlate", "failed", v561, 2u);
      }
      id v52 = 0;
    }
    else
    {
      uint64_t v335 = *((void *)v566 + 3);
      if (obj) {
        uint64_t v336 = [(GEOLPRVehicle *)obj->_vehicle count];
      }
      else {
        uint64_t v336 = 0;
      }
      unint64_t v337 = v458[3];
      if (v335 == v336 || v337 <= 0x3E7)
      {
        v351 = (void *)MEMORY[0x1E4F63E30];
        v352 = [NSNumber numberWithUnsignedLongLong:v337];
        v353 = [v375 allObjects];
        [v351 captureHardStopWithScore:v352 digits:v322 cities:v353];

        if (obj) {
          uint64_t v354 = [(GEOLPRVehicle *)obj->_vehicle count];
        }
        else {
          uint64_t v354 = 0;
        }
        v372 = [v322 componentsJoinedByString:@", "];
        _mnLPRWrappedError(a6, -105, 0, @"Plate has %d chars and rules only allow us to mask chars {%@} for %llu permutation", v355, v356, v357, v358, v354);

        v359 = MNGetMNLPRRuleMatcherLog();
        v360 = v359;
        os_signpost_id_t v361 = v427->_signpost;
        if (v361 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v359))
        {
          *(_WORD *)v561 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B542B000, v360, OS_SIGNPOST_INTERVAL_END, v361, "MaskPlate", "failed", v561, 2u);
        }

        [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"RulesPreventMasking"];
        id v52 = 0;
        goto LABEL_405;
      }
      v338 = MNGetMNLPRRuleMatcherLog();
      v339 = v338;
      os_signpost_id_t v340 = v427->_signpost;
      if (v340 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v338))
      {
        *(_WORD *)v561 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v339, OS_SIGNPOST_INTERVAL_BEGIN, v340, "ApplyRules", "", v561, 2u);
      }

      v341 = (void *)MEMORY[0x1E4F28E78];
      v342 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
      v343 = objc_msgSend(v341, "stringWithCapacity:", objc_msgSend(v342, "length"));

      v449[0] = MEMORY[0x1E4F143A8];
      v449[1] = 3221225472;
      v449[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_232;
      v449[3] = &unk_1E60F76A8;
      v451 = &v592;
      v328 = v343;
      v450 = v328;
      -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)obj, v449);
      v344 = MNGetMNLPRRuleMatcherLog();
      v345 = v344;
      os_signpost_id_t v346 = v427->_signpost;
      if (v346 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v344))
      {
        *(_WORD *)v561 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v345, OS_SIGNPOST_INTERVAL_END, v346, "ApplyRules", "", v561, 2u);
      }

      v347 = (void *)*((void *)v592.super_class + 5);
      if (v347)
      {
        if (a6) {
          *a6 = v347;
        }
        v348 = MNGetMNLPRRuleMatcherLog();
        v349 = v348;
        os_signpost_id_t v350 = v427->_signpost;
        if (v350 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v348))
        {
          *(_WORD *)v561 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B542B000, v349, OS_SIGNPOST_INTERVAL_END, v350, "MaskPlate", "failed", v561, 2u);
        }

        id v52 = 0;
      }
      else
      {
        v362 = MNGetMNLPRRuleMatcherLog();
        v363 = v362;
        os_signpost_id_t v364 = v427->_signpost;
        if (v364 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v362))
        {
          *(_WORD *)v561 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B542B000, v363, OS_SIGNPOST_INTERVAL_END, v364, "MaskPlate", "success", v561, 2u);
        }

        v365 = MNGetMNLPRRuleMatcherLog();
        if (os_log_type_enabled(v365, OS_LOG_TYPE_DEBUG))
        {
          v366 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
          *(_DWORD *)v561 = 138478083;
          v562 = v366;
          __int16 v563 = 2113;
          v564 = v328;
          _os_log_impl(&dword_1B542B000, v365, OS_LOG_TYPE_DEBUG, "Masked plate from \"%{private}@\" -> \"%{private}@\"", v561, 0x16u);
        }
        v367 = MNGetMNLPRRuleMatcherLog();
        if (os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG))
        {
          v368 = (NSMutableDictionary *)*p_usedRegions;
          *(_DWORD *)v561 = 138477827;
          v562 = v368;
          _os_log_impl(&dword_1B542B000, v367, OS_LOG_TYPE_DEBUG, "Used regions: %{private}@", v561, 0xCu);
        }

        v369 = MNGetMNLPRRuleMatcherLog();
        if (os_log_type_enabled(v369, OS_LOG_TYPE_DEBUG))
        {
          usedRegionETAs = v427->_usedRegionETAs;
          *(_DWORD *)v561 = 138477827;
          v562 = usedRegionETAs;
          _os_log_impl(&dword_1B542B000, v369, OS_LOG_TYPE_DEBUG, "Used region ETAs: %{private}@", v561, 0xCu);
        }

        id v52 = [v328 copy];
      }
    }
LABEL_405:

    _Block_object_dispose(&v457, 8);
    _Block_object_dispose(v565, 8);
    goto LABEL_363;
  }
  v53 = [(GEOLPRVehicle *)v427->_vehicle licensePlate];
  _mnLPRWrappedError(a6, -101, 0, @"Empty/unsplittable plate \"%@\"", v54, v55, v56, v57, (uint64_t)v53);

  [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"UnableToSplitString"];
  id v52 = 0;
LABEL_366:

LABEL_367:
  return v52;
}

id __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(double *)(a1 + 56) >= 1.0)
  {
    v5 = MNGetMNLPRRuleMatcherLog();
    id v6 = v5;
    os_signpost_id_t v7 = *(void *)(*(void *)(a1 + 40) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CalculateRoughETAs", "", buf, 2u);
    }

    v8 = [v3 mapRegion];
    uint64_t v9 = [v8 mapRegion];

    v10 = [MEMORY[0x1E4F1CA80] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) coordinate];
          if (objc_msgSend(v9, "containsCoordinate:"))
          {
            GEOCalculateDistance();
            BOOL v17 = [*(id *)(a1 + 32) dateByAddingTimeInterval:v16 / *(double *)(a1 + 56)];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v13);
    }

    uint64_t v18 = [v9 intersectionsOnPolyline:*(void *)(a1 + 48)];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * j) coordinate];
          GEOCalculateDistance();
          uint64_t v24 = [*(id *)(a1 + 32) dateByAddingTimeInterval:v23 / *(double *)(a1 + 56)];
          [v10 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v20);
    }
    uint64_t v25 = MNGetMNLPRRuleMatcherLog();
    v26 = v25;
    os_signpost_id_t v27 = *(void *)(*(void *)(a1 + 40) + 24);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v26, OS_SIGNPOST_INTERVAL_END, v27, "CalculateRoughETAs", "success", buf, 2u);
    }

    v4 = [v10 allObjects];
  }
  else
  {
    v40[0] = *(void *)(a1 + 32);
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  }

  return v4;
}

id __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_196(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      uint64_t v7 = [v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v8 = *(void *)(a1[7] + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v10 = (void *)a1[4];
      if (v10)
      {
        id v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) timeZone];
        char v12 = [v10 isEqualToTimeZone:v11];

        if ((v12 & 1) == 0) {
          [*(id *)(*(void *)(a1[7] + 8) + 40) setTimeZone:a1[4]];
        }
      }
      uint64_t v13 = [*(id *)(*(void *)(a1[7] + 8) + 40) timeZone];
      uint64_t v14 = a1[5];
      uint64_t v15 = *(void **)(v14 + 48);
      *(void *)(v14 + 48) = v13;

      v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
    }
    v4 = [v5 components:528 fromDate:v3];
    double v16 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v18 = *(void *)(a1[6] + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      double v16 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    [v16 setObject:v4 forKeyedSubscript:v3];
  }
  id v20 = v4;

  return v20;
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_199(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F28E60] indexSet];
  v5 = [*(id *)(a1 + 32) objectForKey:v3];
  if (![v5 count])
  {
    id v6 = MNGetMNLPRRuleMatcherLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      id v24 = v3;
      __int16 v25 = 2114;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_FAULT, "Did not find a rough ETA for rule %{private}@ using %{public}@ instead", buf, 0x16u);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

    v5 = (void *)v8;
  }
  uint64_t v9 = [v3 valueMappings];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_200;
  uint64_t v18 = &unk_1E60F7630;
  id v10 = v5;
  id v19 = v10;
  id v21 = *(id *)(a1 + 56);
  id v11 = v4;
  id v20 = v11;
  [v9 enumerateObjectsUsingBlock:&v15];

  if (objc_msgSend(v11, "count", v15, v16, v17, v18))
  {
    unint64_t v12 = [v3 valueMappingsCount];
    if (v12 > [v11 count])
    {
      uint64_t v13 = (void *)[v3 copy];
      uint64_t v14 = [v13 valueMappings];
      [v14 removeObjectsAtIndexes:v11];

      [*(id *)(a1 + 48) addObject:v13];
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_200(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  if (![v30 timeConditionsCount]) {
    goto LABEL_42;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v31 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v31)
  {

LABEL_41:
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3, v26);
    goto LABEL_42;
  }
  uint64_t v26 = a3;
  obuint64_t j = v5;
  char v28 = 0;
  uint64_t v29 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v37 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v8 = [v30 timeConditions];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (objc_msgSend(v13, "dayOfWeeksCount", v26) || objc_msgSend(v13, "dayOfMonthsCount"))
            {
              if (![v13 dayOfWeeksCount]) {
                goto LABEL_45;
              }
              int v14 = [v7 weekday];
              uint64_t v15 = [v13 dayOfWeeks];
              unint64_t v16 = [v13 dayOfWeeksCount];
              if (v16)
              {
                unint64_t v17 = 0;
                do
                  int v18 = *(_DWORD *)(v15 + 4 * v17++);
                while (v17 < v16 && v18 != v14);
                if (v18 == v14)
                {
LABEL_45:
                  if (![v13 dayOfMonthsCount]) {
                    goto LABEL_35;
                  }
                  int v20 = [v7 day];
                  uint64_t v21 = [v13 dayOfMonths];
                  unint64_t v22 = [v13 dayOfMonthsCount];
                  if (v22)
                  {
                    unint64_t v23 = 0;
                    do
                      int v24 = *(_DWORD *)(v21 + 4 * v23++);
                    while (v23 < v22 && v24 != v20);
                    if (v24 == v20)
                    {
LABEL_35:
                      char v28 = 1;
                      goto LABEL_36;
                    }
                  }
                }
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_36:
    }
    uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v31);

  a3 = v26;
  if ((v28 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_42:
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_224(void *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = *(void *)(a1[5] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  unint64_t v7 = -[_MNLPRPlateCharacter validReplacementCount:](a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
  [v8 addObject:v9];

  *a4 = *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
  if (v7 > 1)
  {
    uint64_t v10 = v7;
  }
  else
  {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v10 = 1;
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) *= v10;
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_232(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  id v8 = v10;
  obuint64_t j = v10;
  if (a2)
  {
    uint64_t v11 = -[_MNLPRPlateCharacter _validReplacements:](a2, &obj);
    uint64_t v12 = [v11 count];
    if (v12)
    {
      if (v12 == 1) {
        [v11 firstObject];
      }
      else {
      uint64_t v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v11, "count")));
      }
    }
    else
    {
      uint64_t v13 = 0;
    }

    id v8 = obj;
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_storeStrong(v9, v8);
  uint64_t v14 = *(void *)(a1 + 40);
  if (v13 && !*(void *)(*(void *)(v14 + 8) + 40))
  {
    [*(id *)(a1 + 32) appendString:v13];
    uint64_t v14 = *(void *)(a1 + 40);
  }
  *a4 = *(void *)(*(void *)(v14 + 8) + 40) != 0;
}

- (id)debug_jsonDescriptionOfLastPlate
{
  v38[5] = *MEMORY[0x1E4F143B8];
  lastPlate = self->_lastPlate;
  if (lastPlate && [(NSArray *)lastPlate->_chars count])
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = self->_lastPlate;
    if (v5) {
      uint64_t v6 = [(NSArray *)v5->_chars count];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = [v4 arrayWithCapacity:v6];
    id v8 = self->_lastPlate;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke;
    v33[3] = &unk_1E60F76D0;
    id v9 = v7;
    id v34 = v9;
    -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)v8, v33);
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 1;
    uint64_t v10 = self->_lastPlate;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke_2;
    v24[3] = &unk_1E60F76F8;
    v24[4] = &v29;
    v24[5] = &v25;
    -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)v10, v24);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    [v11 setTimeZone:self->_lastTimeZone];
    uint64_t v12 = [v11 stringFromDate:self->_lastDate];
    uint64_t v13 = [(NSTimeZone *)self->_lastTimeZone name];
    v36[0] = v9;
    v35[0] = @"values";
    v35[1] = @"permutations";
    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v26[3]];
    v36[1] = v14;
    v35[2] = @"unmaskableValues";
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v30[3]];
    v36[2] = v15;
    v35[3] = @"date";
    unint64_t v16 = v12;
    if (!v12)
    {
      unint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    }
    v36[3] = v16;
    v35[4] = @"timeZone";
    unint64_t v17 = v13;
    if (!v13)
    {
      unint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    }
    usedRegions = self->_usedRegions;
    usedRegionETAs = self->_usedRegionETAs;
    v36[4] = v17;
    v36[5] = usedRegions;
    v35[5] = @"usedRegions";
    v35[6] = @"usedRegionETAs";
    v36[6] = usedRegionETAs;
    int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:7];
    if (!v13) {

    }
    if (!v12) {
    _Block_object_dispose(&v25, 8);
    }
    _Block_object_dispose(&v29, 8);
    uint64_t v21 = v34;
  }
  else
  {
    v37[0] = @"values";
    id v9 = [MEMORY[0x1E4F1CA98] null];
    v38[0] = v9;
    v38[1] = &unk_1F0E34F68;
    v37[1] = @"permutations";
    v37[2] = @"unmaskableValues";
    v38[2] = &unk_1F0E34F80;
    v37[3] = @"date";
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
    v38[3] = v21;
    v37[4] = @"timeZone";
    unint64_t v22 = [MEMORY[0x1E4F1CA98] null];
    v38[4] = v22;
    int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
  }
  return v20;
}

void __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  uint64_t v3 = (uint64_t)v2;
  v4 = (void *)MEMORY[0x1E4F1CA48];
  if (v2) {
    id v5 = (void *)v2[5];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (v3) {
    id v8 = *(void **)(v3 + 40);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) intValue];
        if ((v14 - 1) >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
          uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v15 = off_1E60F7718[(int)v14 - 1];
        }
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v11);
  }

  uint64_t v26 = *(void **)(a1 + 32);
  v33[0] = @"glyph";
  if (v3) {
    unint64_t v16 = *(void **)(v3 + 32);
  }
  else {
    unint64_t v16 = 0;
  }
  id v28 = v16;
  v34[0] = v28;
  v33[1] = @"isPickup";
  if (v3) {
    BOOL v17 = *(unsigned char *)(v3 + 24) != 0;
  }
  else {
    BOOL v17 = 0;
  }
  int v18 = [NSNumber numberWithBool:v17];
  v34[1] = v18;
  v33[2] = @"mappings";
  id v19 = -[_MNLPRPlateCharacter valueMappings]((id *)v3);
  if ([v19 count]) {
    -[_MNLPRPlateCharacter valueMappings]((id *)v3);
  }
  else {
  int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[2] = v20;
  v33[3] = @"fills";
  uint64_t v21 = [v7 count];
  unint64_t v22 = v7;
  if (!v21)
  {
    unint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[3] = v22;
  void v33[4] = @"replacements";
  unint64_t v23 = -[_MNLPRPlateCharacter _validReplacements:](v3, 0);
  int v24 = v23;
  if (!v23)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[4] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
  [v26 addObject:v25];

  if (!v23) {
  if (!v21)
  }
}

unint64_t __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t result = -[_MNLPRPlateCharacter validReplacementCount:](a2, 0);
  if (result > 1)
  {
    uint64_t v4 = result;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v4 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) *= v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedRegionETAs, 0);
  objc_storeStrong((id *)&self->_usedRegions, 0);
  objc_storeStrong((id *)&self->_lastTimeZone, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_lastPlate, 0);
  objc_storeStrong((id *)&self->_ruleSets, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end