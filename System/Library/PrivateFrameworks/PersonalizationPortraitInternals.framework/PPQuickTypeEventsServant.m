@interface PPQuickTypeEventsServant
- (BOOL)_shouldTreatAsUnscheduledFreeTime:(void *)a1;
- (PPQuickTypeEventsServant)init;
- (id)_busyEventsFromEvents:(void *)a1 people:(void *)a2 explanationSet:(void *)a3;
- (id)_freeEventsAndGapsFromEvents:(void *)a3 explanationSet:;
- (id)_unscheduledFreeTimeEventFrom:(void *)a3 to:;
- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5;
@end

@implementation PPQuickTypeEventsServant

- (void).cxx_destruct
{
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v143 = a5;
  v145 = v8;
  LODWORD(v8) = [v8 type];
  v9 = pp_quicktype_log_handle();
  v10 = v9;
  if (v8 != 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPQuickTypeEventsServant ignoring request since it doesn't ask for events", buf, 2u);
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeEventsServant", buf, 2u);
  }

  if (!+[PPQuickTypeSettings servantShouldRespondToQuery:self])
  {
    v17 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Events due to settings", buf, 2u);
    }

    [v143 push:47];
LABEL_16:
    v18 = 0;
    goto LABEL_157;
  }
  int v11 = [v145 subtype];
  v12 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11 == 3;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "looking for busy times? %d", buf, 8u);
  }

  v13 = objc_opt_new();
  if ([v145 time] == 1)
  {
    localEventStore = self->_localEventStore;
    v15 = [v13 dateByAddingTimeInterval:-600.0];
    v16 = [v13 dateByAddingTimeInterval:345600.0];
    v141 = [(PPLocalEventStore *)localEventStore eventsFromDate:v15 toDate:v16];
LABEL_9:

    goto LABEL_23;
  }
  if ([v145 time] == 2)
  {
    v19 = self->_localEventStore;
    uint64_t v20 = PPNextMidnight();
  }
  else
  {
    if ([v145 time] == 3)
    {
      v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:172800.0];
      v21 = self->_localEventStore;
      v16 = PPNextMidnight();
      v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v22 startOfDayForDate:v15];
      v24 = v23 = v13;
      v141 = [(PPLocalEventStore *)v21 eventsFromDate:v16 toDate:v24];

      v13 = v23;
      goto LABEL_9;
    }
    v19 = self->_localEventStore;
    uint64_t v20 = [v13 dateByAddingTimeInterval:604800.0];
  }
  v15 = (void *)v20;
  v141 = [(PPLocalEventStore *)v19 eventsFromDate:v13 toDate:v20];
LABEL_23:

  v25 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v141 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v26;
    _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "%tu events matching predicate", buf, 0xCu);
  }

  if ([v141 count])
  {
    uint64_t v27 = [v145 people];
    if (v27)
    {
      v28 = (void *)v27;
      if (objc_opt_respondsToSelector())
      {
        id v142 = v28;
      }
      else
      {
        v182 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v182 count:1];

        id v142 = (id)v29;
      }
    }
    else
    {
      id v142 = 0;
    }
    obuint64_t j = [v145 recipients];
    v157 = objc_opt_new();
    v140 = v13;
    if ([v145 time] == 1 && v11 == 3 && (objc_msgSend(v145, "fields") & 0x30000) != 0)
    {
      if ((!obj || ![obj count]) && (!v142 || !objc_msgSend(v142, "count")))
      {
        v66 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v66, OS_LOG_TYPE_DEFAULT, "shouldAddRecipientToPeopleOfInterest but no recipients", buf, 2u);
        }

        [v143 push:20];
        v18 = 0;
        goto LABEL_155;
      }
      v161 = self;
      v30 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_INFO, "recipient is person of interest", buf, 2u);
      }

      v31 = objc_opt_new();
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __73__PPQuickTypeEventsServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke;
      v167[3] = &unk_1E65D96D0;
      id v32 = v31;
      id v168 = v32;
      [obj enumerateObjectsUsingBlock:v167];
      id v33 = v32;

      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      obuint64_t j = v33;
      uint64_t v34 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v164;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v164 != v36) {
              objc_enumerationMutation(obj);
            }
            v38 = *(void **)(*((void *)&v163 + 1) + 8 * i);
            v39 = objc_opt_new();
            if ([v38 containsString:@"@"]) {
              [v39 setMatchingEmail:v38];
            }
            else {
              [v39 setMatchingPhone:v38];
            }
            v40 = +[PPLocalContactStore defaultStore];
            v41 = [v40 rankedContactsWithQuery:v39 error:0];
            v42 = [v41 firstObject];

            if (v42) {
              v43 = v42;
            }
            else {
              v43 = v38;
            }
            [v157 addObject:v43];
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
        }
        while (v35);
      }

      self = v161;
      int v11 = 3;
    }
    if ([v157 count])
    {
      if (v142 && [v142 count]) {
        [v157 addObjectsFromArray:v142];
      }
      id v44 = v157;

      id v142 = v44;
    }
    v45 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = [v142 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v46;
      _os_log_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_INFO, "%ld people of interest", buf, 0xCu);
    }

    v47 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138739971;
      *(void *)&buf[4] = v142;
      _os_log_debug_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_DEBUG, "people of interest: %{sensitive}@", buf, 0xCu);
    }

    unsigned int v48 = [v145 time];
    int v49 = [v145 fields];
    id v50 = v141;
    id v142 = v142;
    id v51 = v143;
    if (self)
    {
      v52 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v142;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v186) = v11 == 3;
        _os_log_debug_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEBUG, "filtering events for time: %lu: people: %@ busy: %d", buf, 0x1Cu);
      }

      if ((v48 & 0xFFFFFFFD) == 1)
      {
        if (v11 == 3)
        {
          id v53 = v51;
          v54 = v142;
          id v55 = v142;
          v56 = [v50 objectEnumerator];
LABEL_73:
          v57 = v56;
          v58 = -[PPQuickTypeEventsServant _busyEventsFromEvents:people:explanationSet:](v56, v55, v53);

          goto LABEL_86;
        }
        v59 = -[PPQuickTypeEventsServant _freeEventsAndGapsFromEvents:explanationSet:]((uint64_t)self, v50, v51);
        v58 = v59;
        if ((v49 & 0x40000) != 0)
        {
          v60 = [v59 lastObject];
          v61 = [v60 endDate];
          v62 = PPNextMidnight();
          int v63 = [v61 isEqualToDate:v62];

          if (v63)
          {
            uint64_t v64 = objc_msgSend(v58, "subarrayWithRange:", 0, objc_msgSend(v58, "count") - 1);

            v58 = (void *)v64;
          }
        }
        goto LABEL_85;
      }
      if (v48 == 2)
      {
        if (v11 == 3)
        {
          id v53 = v51;
          v54 = v142;
          id v55 = v142;
          v56 = [v50 reverseObjectEnumerator];
          goto LABEL_73;
        }
        v67 = -[PPQuickTypeEventsServant _freeEventsAndGapsFromEvents:explanationSet:]((uint64_t)self, v50, v51);
        v68 = [v67 reverseObjectEnumerator];
        v58 = [v68 allObjects];

LABEL_85:
        v54 = v142;
LABEL_86:

        v69 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          uint64_t v70 = [v58 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v70;
          _os_log_impl(&dword_1CA9A8000, v69, OS_LOG_TYPE_INFO, "%ld events after filtering", buf, 0xCu);
        }

        v71 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138739971;
          *(void *)&buf[4] = v58;
          _os_log_debug_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_DEBUG, "predicted events after filter: %{sensitive}@", buf, 0xCu);
        }

        +[PPQuickTypeMetrics eventsMatches:](PPQuickTypeMetrics, "eventsMatches:", [v58 count]);
        int v72 = [v145 fields];
        v73 = +[PPQuickTypeFormatter formatterWithQuery:v145];
        id v74 = v58;
        id v152 = v73;
        id v138 = v51;
        v139 = v74;
        if (self)
        {
          id v75 = objc_alloc(MEMORY[0x1E4F1CA48]);
          unint64_t v76 = [v74 count];
          if (v76 >= a4) {
            unint64_t v77 = a4;
          }
          else {
            unint64_t v77 = v76;
          }
          v18 = (void *)[v75 initWithCapacity:v77];
          long long v173 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          id v78 = v74;
          v79 = +[PPConfiguration sharedInstance];
          unsigned int v80 = [v79 nextEventsFuzzMinutes];

          v81 = [v78 firstObject];
          v82 = [v81 startDate];

          if ([v78 count] <= a4)
          {
            id v88 = v78;
          }
          else
          {
            uint64_t v83 = 60 * v80;
            v84 = objc_msgSend(v78, "subarrayWithRange:", 0, a4);
            v85 = (void *)[v84 mutableCopy];

            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __58__PPQuickTypeEventsServant__fuzzyNextEvents_minimumCount___block_invoke;
            v186 = &unk_1E65D6710;
            id v187 = v82;
            uint64_t v189 = v83;
            id v86 = v85;
            id v188 = v86;
            [v78 enumerateObjectsUsingBlock:buf];
            v87 = v188;
            id v88 = v86;
          }
          uint64_t v151 = [v88 countByEnumeratingWithState:&v173 objects:v184 count:16];
          if (v151)
          {
            unint64_t v89 = 0;
            uint64_t v146 = *(void *)v174;
            unint64_t v144 = a4;
            v150 = v18;
            int v149 = v72;
            id v147 = v88;
            id v148 = v78;
            do
            {
              uint64_t v90 = 0;
              do
              {
                unint64_t v155 = v89;
                if (*(void *)v174 != v146) {
                  objc_enumerationMutation(v88);
                }
                uint64_t v153 = v90;
                v91 = *(void **)(*((void *)&v173 + 1) + 8 * v90);
                long long v169 = 0u;
                long long v170 = 0u;
                long long v171 = 0u;
                long long v172 = 0u;
                id v92 = v91;
                id v93 = v152;
                id v160 = (id)objc_opt_new();
                id v94 = v92;
                id v95 = v93;
                v96 = objc_opt_new();
                if ((v72 & 0x20000) != 0)
                {
                  v97 = [v94 startDate];
                  v98 = [v95 formattedEventTime:v97];
                  v99 = +[PPQuickTypeLabeledValue labeledValueWithLabel:0 value:v98 scoreBoost:0x20000 fields:0.0];
                  [v96 addObject:v99];

                  if ((v72 & 0x40000) != 0)
                  {
LABEL_107:
                    v100 = [v94 endDate];
                    v101 = [v95 formattedEventTime:v100];
                    v102 = +[PPQuickTypeLabeledValue labeledValueWithLabel:0 value:v101 scoreBoost:0x40000 fields:0.0];
                    [v96 addObject:v102];

                    if ((v72 & 0x8000) == 0) {
                      goto LABEL_112;
                    }
                    goto LABEL_108;
                  }
                }
                else if ((v72 & 0x40000) != 0)
                {
                  goto LABEL_107;
                }
                if ((v72 & 0x8000) == 0) {
                  goto LABEL_112;
                }
LABEL_108:
                v103 = [v94 title];
                if (![v103 length]) {
                  goto LABEL_111;
                }
                char v104 = [v94 representsUnscheduledFreeTime];

                if ((v104 & 1) == 0)
                {
                  v103 = [v94 title];
                  v105 = +[PPQuickTypeLabeledValue labeledValueWithLabel:0 value:v103 scoreBoost:0x8000 fields:0.0];
                  [v96 addObject:v105];

LABEL_111:
                }
LABEL_112:
                if ((v72 & 0x10000) != 0)
                {
                  v106 = [v94 location];
                  uint64_t v107 = [v106 length];

                  if (v107)
                  {
                    v108 = [v94 location];
                    v109 = +[PPQuickTypeLabeledValue labeledValueWithLabel:0 value:v108 scoreBoost:0x10000 fields:0.0];
                    [v96 addObject:v109];
                  }
                }
                v154 = v95;

                v110 = pp_quicktype_log_handle();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v94;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v96;
                  _os_log_debug_impl(&dword_1CA9A8000, v110, OS_LOG_TYPE_DEBUG, "valuesForPrediction event: %@: values: %@", buf, 0x16u);
                }

                long long v179 = 0u;
                long long v180 = 0u;
                long long v177 = 0u;
                long long v178 = 0u;
                id v158 = v96;
                v111 = v160;
                uint64_t v162 = [v158 countByEnumeratingWithState:&v177 objects:buf count:16];
                if (v162)
                {
                  uint64_t v159 = *(void *)v178;
                  do
                  {
                    for (uint64_t j = 0; j != v162; ++j)
                    {
                      if (*(void *)v178 != v159) {
                        objc_enumerationMutation(v158);
                      }
                      v113 = *(void **)(*((void *)&v177 + 1) + 8 * j);
                      v114 = (void *)MEMORY[0x1E4F89EE0];
                      v115 = [v113 value];
                      [v113 fields];
                      v116 = [v113 value];
                      v117 = [v94 title];
                      v118 = [v94 startDate];
                      uint64_t v119 = [v113 fields];
                      if ([v94 representsUnscheduledFreeTime]) {
                        char v120 = 2;
                      }
                      else {
                        char v120 = 0;
                      }
                      [v113 scoreBoost];
                      double v122 = v121;
                      v123 = [v94 eventIdentifier];
                      BYTE2(v137) = 3;
                      BYTE1(v137) = v120;
                      LOBYTE(v137) = 0;
                      v124 = objc_msgSend(v114, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", &stru_1F253DF18, v116, v117, v118, v119, 0, v122, 0, -1, v137, v123);
                      v111 = v160;
                      [v160 addObject:v124];
                    }
                    uint64_t v162 = [v158 countByEnumeratingWithState:&v177 objects:buf count:16];
                  }
                  while (v162);
                }

                uint64_t v125 = [v111 countByEnumeratingWithState:&v169 objects:v183 count:16];
                if (v125)
                {
                  uint64_t v126 = v125;
                  uint64_t v127 = *(void *)v170;
                  v18 = v150;
                  id v78 = v148;
                  unint64_t v89 = v155;
                  while (2)
                  {
                    uint64_t v128 = 0;
                    if (v144 >= v89) {
                      unint64_t v129 = v144 - v89;
                    }
                    else {
                      unint64_t v129 = 0;
                    }
                    do
                    {
                      if (*(void *)v170 != v127) {
                        objc_enumerationMutation(v160);
                      }
                      v130 = *(void **)(*((void *)&v169 + 1) + 8 * v128);
                      v131 = pp_quicktype_log_handle();
                      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)&buf[4] = v130;
                        _os_log_debug_impl(&dword_1CA9A8000, v131, OS_LOG_TYPE_DEBUG, "event item prediction: %@", buf, 0xCu);
                      }

                      if (v129 == v128)
                      {
                        v89 += v128;
                        v133 = v160;
                        goto LABEL_143;
                      }
                      uint64_t v132 = 100 - (v89 + v128);
                      if (v89 + v128 > 0x64) {
                        uint64_t v132 = 0;
                      }
                      [v130 setScore:(double)(unint64_t)v132];
                      [v150 addObject:v130];
                      ++v128;
                    }
                    while (v126 != v128);
                    v89 += v128;
                    v133 = v160;
                    uint64_t v126 = [v160 countByEnumeratingWithState:&v169 objects:v183 count:16];
                    if (v126) {
                      continue;
                    }
                    break;
                  }
LABEL_143:

                  int v72 = v149;
                  id v88 = v147;
                  if (v89 > v144) {
                    goto LABEL_148;
                  }
                }
                else
                {

                  v18 = v150;
                  int v72 = v149;
                  id v88 = v147;
                  id v78 = v148;
                  unint64_t v89 = v155;
                }
                uint64_t v90 = v153 + 1;
              }
              while (v153 + 1 != v151);
              uint64_t v151 = [v88 countByEnumeratingWithState:&v173 objects:v184 count:16];
            }
            while (v151);
          }
LABEL_148:

          if ([v78 count])
          {
            uint64_t v134 = [v18 count];
            v135 = v138;
            if ((v72 & 0x10000) != 0 && !v134) {
              [v138 push:24];
            }
            goto LABEL_154;
          }
        }
        else
        {
          v18 = 0;
        }
        v135 = v138;
LABEL_154:
        v13 = v140;

LABEL_155:
        goto LABEL_156;
      }
      v65 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v48;
        _os_log_error_impl(&dword_1CA9A8000, v65, OS_LOG_TYPE_ERROR, "unsupported time criteria: %lu", buf, 0xCu);
      }

      [v51 push:25];
    }
    v58 = 0;
    goto LABEL_85;
  }
  [v143 push:19];
  v18 = 0;
LABEL_156:

LABEL_157:
  return v18;
}

void __73__PPQuickTypeEventsServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 containsString:@":"])
  {
    v3 = (void *)MEMORY[0x1CB79D060]();
    v4 = *(void **)(a1 + 32);
    v5 = [v7 componentsSeparatedByString:@":"];
    v6 = [v5 lastObject];
    [v4 addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __58__PPQuickTypeEventsServant__fuzzyNextEvents_minimumCount___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 startDate];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  if (v4 <= (double)*(unint64_t *)(a1 + 48))
  {
    char v5 = [*(id *)(a1 + 40) containsObject:v6];

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
  else
  {
  }
}

- (id)_freeEventsAndGapsFromEvents:(void *)a3 explanationSet:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v54 = a3;
  v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  char v5 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v67 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([v10 availability] != 1
          && !-[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v10))
        {
          int v11 = [v10 startDate];
          [v11 timeIntervalSinceReferenceDate];
          double v13 = v12;

          v14 = [v10 endDate];
          v15 = [v10 startDate];
          [v14 timeIntervalSinceDate:v15];
          double v17 = v16;

          objc_msgSend(v5, "addIndexesInRange:", (unint64_t)v13, (unint64_t)v17);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v7);
  }

  v18 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v73 = 138412290;
    *(void *)&v73[4] = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: busy ranges: %@", v73, 0xCu);
  }

  if ([v5 count])
  {
    v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "firstIndex"));
    uint64_t v20 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v73 = 138412290;
      *(void *)&v73[4] = v19;
      _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: busy start: %@", v73, 0xCu);
    }

    v56 = objc_opt_new();
    unint64_t v21 = [v5 firstIndex];
    [v56 timeIntervalSinceReferenceDate];
    if ((double)v21 - v22 > 0.0)
    {
      v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v24 = [v23 components:124 fromDate:v56];
      BOOL v25 = [v24 minute] < 30;
      uint64_t v26 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v27 = [v24 minute];
      uint64_t v28 = 60;
      if (v25) {
        uint64_t v28 = 30;
      }
      uint64_t v29 = [v26 dateWithTimeInterval:v56 sinceDate:(double)(60 * (v28 - v27))];
      v30 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v73 = 138412290;
        *(void *)&v73[4] = v29;
        _os_log_debug_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: free start: %@", v73, 0xCu);
      }

      if ([v29 compare:v19] != 1)
      {
        v31 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v73 = 138412546;
          *(void *)&v73[4] = v29;
          *(_WORD *)&v73[12] = 2112;
          *(void *)&v73[14] = v19;
          _os_log_debug_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: initial free added: %@-%@", v73, 0x16u);
        }

        id v32 = -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1, v29, v19);
        [v57 addObject:v32];
      }
    }
    *(void *)v73 = 0;
    *(void *)&v73[8] = v73;
    *(void *)&v73[16] = 0x3032000000;
    id v74 = __Block_byref_object_copy__6947;
    id v75 = __Block_byref_object_dispose__6948;
    id v53 = v19;
    id v76 = v53;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __72__PPQuickTypeEventsServant__freeEventsAndGapsFromEvents_explanationSet___block_invoke;
    v62[3] = &unk_1E65D6738;
    v65 = v73;
    id v33 = v57;
    id v63 = v33;
    uint64_t v64 = a1;
    [v5 enumerateRangesWithOptions:0 usingBlock:v62];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v34 = v6;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v59 != v36) {
            objc_enumerationMutation(v34);
          }
          v38 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          if ([v38 availability] == 1
            && !-[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v38))
          {
            v39 = [v38 startDate];
            [v39 timeIntervalSinceReferenceDate];
            double v41 = v40;

            v42 = [v38 endDate];
            v43 = [v38 startDate];
            [v42 timeIntervalSinceDate:v43];
            double v45 = v44;

            if ((objc_msgSend(v5, "intersectsIndexesInRange:", (unint64_t)v41, (unint64_t)v45) & 1) == 0)
            {
              uint64_t v46 = pp_quicktype_log_handle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v38;
                _os_log_debug_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: adding free event: %@", buf, 0xCu);
              }

              [v33 addObject:v38];
            }
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v35);
    }

    v47 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    unsigned int v48 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*(void *)(*(void *)&v73[8] + 40) sinceDate:86400.0];
    int v49 = [v47 startOfDayForDate:v48];

    id v50 = -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1, *(void **)(*(void *)&v73[8] + 40), v49);
    [v33 addObject:v50];

    if (![v33 count]) {
      [v54 push:22];
    }
    id v51 = [v33 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];

    _Block_object_dispose(v73, 8);
  }
  else
  {
    id v51 = v57;
  }

  return v51;
}

- (id)_busyEventsFromEvents:(void *)a1 people:(void *)a2 explanationSet:(void *)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v9 = v5;
  uint64_t v70 = [v9 countByEnumeratingWithState:&v78 objects:v99 count:16];
  if (!v70)
  {

    uint64_t v56 = 23;
LABEL_68:
    [v7 push:v56];
    goto LABEL_69;
  }
  id v58 = v7;
  char v59 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v79;
  v62 = v8;
  id v63 = v6;
  uint64_t v60 = *(void *)v79;
  id v61 = v9;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v79 != v11) {
        objc_enumerationMutation(v9);
      }
      double v13 = *(void **)(*((void *)&v78 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "startDate", v58);
      [v14 timeIntervalSinceNow];
      double v16 = v15;

      if (v16 < -600.0
        || [v13 availability] == 1
        || -[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v13))
      {
        goto LABEL_59;
      }
      if (!v6 || ![v6 count]) {
        goto LABEL_57;
      }
      uint64_t v64 = v13;
      double v17 = [v13 attendees];
      id v18 = v6;
      id v69 = v17;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      v19 = v18;
      uint64_t v67 = [v19 countByEnumeratingWithState:&v95 objects:v103 count:16];
      long long v68 = v19;
      if (!v67) {
        goto LABEL_50;
      }
      uint64_t v65 = *(void *)v96;
      uint64_t v66 = v12;
      while (2)
      {
        uint64_t v20 = 0;
        while (2)
        {
          if (*(void *)v96 != v65) {
            objc_enumerationMutation(v19);
          }
          uint64_t v73 = v20;
          unint64_t v21 = *(void **)(*((void *)&v95 + 1) + 8 * v20);
          id v74 = (void *)MEMORY[0x1CB79D060]();
          double v22 = objc_opt_new();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v21 contact];
            v24 = [v23 localizedFullName];
            if (v24) {
              [v22 addObject:v24];
            }
            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            BOOL v25 = [v23 emailAddresses];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v91 objects:v102 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v92;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v92 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = [*(id *)(*((void *)&v91 + 1) + 8 * i) value];
                  [v22 addObject:v30];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v91 objects:v102 count:16];
              }
              while (v27);
            }
          }
          else
          {
            [v22 addObject:v21];
          }
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v31 = v69;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v87 objects:v101 count:16];
          if (!v32)
          {
LABEL_53:

            id v54 = pp_quicktype_log_handle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_INFO, "one or more person of interest not found in attendees", buf, 2u);
            }

            int v52 = 0;
            id v53 = v68;
            id v51 = v68;
            uint64_t v8 = v62;
            id v6 = v63;
            uint64_t v11 = v60;
            id v9 = v61;
            uint64_t v12 = v66;
            goto LABEL_56;
          }
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v88;
          id v75 = v31;
          uint64_t v71 = *(void *)v88;
LABEL_30:
          uint64_t v35 = 0;
          uint64_t v72 = v33;
          while (1)
          {
            if (*(void *)v88 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void **)(*((void *)&v87 + 1) + 8 * v35);
            v37 = (void *)MEMORY[0x1CB79D060]();
            if ([v36 status] == 3) {
              goto LABEL_45;
            }
            context = v37;
            v38 = [v36 url];
            v39 = [v38 absoluteString];
            unint64_t v77 = [v39 lowercaseString];

            double v40 = [v36 emailAddress];
            double v41 = [v36 name];
            v42 = [v41 lowercaseString];

            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v43 = v22;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v100 count:16];
            if (v44) {
              break;
            }
LABEL_44:

            uint64_t v33 = v72;
            v37 = context;
LABEL_45:
            if (++v35 == v33)
            {
              uint64_t v33 = [v31 countByEnumeratingWithState:&v87 objects:v101 count:16];
              if (v33) {
                goto LABEL_30;
              }
              goto LABEL_53;
            }
          }
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v84;
LABEL_36:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v84 != v46) {
              objc_enumerationMutation(v43);
            }
            unsigned int v48 = *(void **)(*((void *)&v83 + 1) + 8 * v47);
            int v49 = (void *)MEMORY[0x1CB79D060]();
            id v50 = [v48 lowercaseString];
            if (([v40 containsString:v50] & 1) != 0
              || ([v42 containsString:v50] & 1) != 0
              || [v77 containsString:v50])
            {
              break;
            }

            if (v45 == ++v47)
            {
              uint64_t v45 = [v43 countByEnumeratingWithState:&v83 objects:v100 count:16];
              id v31 = v75;
              uint64_t v34 = v71;
              if (v45) {
                goto LABEL_36;
              }
              goto LABEL_44;
            }
          }

          uint64_t v20 = v73 + 1;
          uint64_t v12 = v66;
          v19 = v68;
          if (v73 + 1 != v67) {
            continue;
          }
          break;
        }
        uint64_t v67 = [v68 countByEnumeratingWithState:&v95 objects:v103 count:16];
        if (v67) {
          continue;
        }
        break;
      }
LABEL_50:

      id v51 = pp_quicktype_log_handle();
      int v52 = 1;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_INFO, "all people of interest found in attendees", buf, 2u);
      }
      uint64_t v8 = v62;
      id v6 = v63;
      uint64_t v11 = v60;
      id v9 = v61;
      id v53 = v68;
LABEL_56:

      double v13 = v64;
      if (v52) {
LABEL_57:
      }
        [v8 addObject:v13];
      else {
        char v59 = 1;
      }
      char v10 = 1;
LABEL_59:
      ++v12;
    }
    while (v12 != v70);
    uint64_t v55 = [v9 countByEnumeratingWithState:&v78 objects:v99 count:16];
    uint64_t v70 = v55;
  }
  while (v55);

  if ((v10 & 1) == 0)
  {
    uint64_t v56 = 23;
    id v7 = v58;
    goto LABEL_68;
  }
  id v7 = v58;
  if ((([v6 count] != 0) & v59) == 1)
  {
    uint64_t v56 = 21;
    goto LABEL_68;
  }
LABEL_69:

  return v8;
}

- (BOOL)_shouldTreatAsUnscheduledFreeTime:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 availability] == 1 && (objc_msgSend(v1, "organizerIsCurrentUser") & 1) == 0)
  {
    id v3 = v1;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [v3 attendees];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          char v10 = pp_quicktype_log_handle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v19 = (unint64_t)v9;
            _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "isFreeTime: attendee: %@", buf, 0xCu);
          }

          if ([v9 isCurrentUser])
          {
            uint64_t v11 = pp_quicktype_log_handle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v13 = [v9 status];
              *(_DWORD *)buf = 134217984;
              unint64_t v19 = v13;
              _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "isFreeTime: is current user, status: %ld", buf, 0xCu);
            }

            BOOL v2 = [v9 status] != 255;
            goto LABEL_18;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v2 = 0;
LABEL_18:
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)_unscheduledFreeTimeEventFrom:(void *)a3 to:
{
  if (a1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F89E00];
    id v5 = a3;
    id v6 = a2;
    id v7 = [v4 alloc];
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"PP-FT-%@-%@", v6, v5];
    id v9 = [MEMORY[0x1E4F25598] temporaryObjectIDWithEntityType:2];
    char v10 = (void *)[objc_alloc(MEMORY[0x1E4F89DA8]) initWithCalendarIdentifier:@"PP-FT" title:@"PP-FT" color:0];
    LOBYTE(v15) = 0;
    LOBYTE(v14) = 3;
    LOBYTE(v13) = 1;
    uint64_t v11 = objc_msgSend(v7, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v8, v9, &stru_1F253DF18, &stru_1F253DF18, v10, v6, v5, v13, 0, MEMORY[0x1E4F1CBF0], &stru_1F253DF18, v14, 0, 0, 0,
                    0,
                    0,
                    v15);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

void __72__PPQuickTypeEventsServant__freeEventsAndGapsFromEvents_explanationSet___block_invoke(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a2];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(a2 + a3)];
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) compare:v6] == -1)
  {
    uint64_t v8 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      long long v17 = v6;
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: adding free block: %@-%@", (uint8_t *)&v14, 0x16u);
    }

    id v9 = (void *)a1[4];
    char v10 = -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1[5], *(void **)(*(void *)(a1[6] + 8) + 40), v6);
    [v9 addObject:v10];
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
}

- (PPQuickTypeEventsServant)init
{
  v16.receiver = self;
  v16.super_class = (Class)PPQuickTypeEventsServant;
  BOOL v2 = [(PPQuickTypeEventsServant *)&v16 init];
  if (v2)
  {
    id v3 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeEventsServant initializing", buf, 2u);
    }

    uint64_t v4 = +[PPLocalEventStore defaultStore];
    localEventStore = v2->_localEventStore;
    v2->_localEventStore = (PPLocalEventStore *)v4;

    id v6 = (void *)MEMORY[0x1E4F89EE8];
    uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v8 = [v7 localeIdentifier];
    id v9 = [v6 quickTypeQueryWithType:0 subtype:0 semanticTag:0 fields:0 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v8 bundleIdentifier:0 recipients:0];
    char v10 = +[PPQuickTypeFormatter formatterWithQuery:v9];

    id v11 = (id)[v10 makeShortEventFormatter];
    id v12 = (id)[v10 makeLongEventFormatter];

    uint64_t v13 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "PPQuickTypeEventsServant initialization complete", buf, 2u);
    }
  }
  return v2;
}

@end