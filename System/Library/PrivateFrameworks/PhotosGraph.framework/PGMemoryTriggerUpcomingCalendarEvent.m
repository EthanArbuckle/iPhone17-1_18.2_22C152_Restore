@interface PGMemoryTriggerUpcomingCalendarEvent
- (PGMemoryTriggerUpcomingCalendarEvent)initWithServiceManager:(id)a3 locationCache:(id)a4 loggingConnection:(id)a5;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerUpcomingCalendarEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  v179[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 47;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [v8 localDate];
    v141 = v8;
    uint64_t v13 = [v8 timeZone];
    v122 = (void *)v12;
    v121 = [MEMORY[0x1E4F76C68] startOfDayForDate:v12];
    v140 = (void *)v13;
    v14 = objc_msgSend(MEMORY[0x1E4F76C68], "universalDateFromLocalDate:inTimeZone:");
    uint64_t v15 = [v14 dateByAddingTimeInterval:86400.0];
    v120 = v14;
    uint64_t v16 = [v14 dateByAddingTimeInterval:345600.0];
    v129 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:v9];
    id v130 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17 = (void *)MEMORY[0x1E4F76CD0];
    v118 = (void *)v16;
    v119 = (void *)v15;
    v179[0] = v15;
    v179[1] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
    v19 = [v17 clueWithDates:v18 serviceManager:self->_serviceManager];

    v117 = v19;
    [v19 events];
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v170 objects:v178 count:16];
    id v142 = v9;
    id v126 = v20;
    v127 = v10;
    v144 = self;
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v171;
      double v24 = *MEMORY[0x1E4F1E6D8];
      double v25 = *MEMORY[0x1E4F1E6E8] + *MEMORY[0x1E4F1E6E8];
      uint64_t v124 = *(void *)v171;
      while (2)
      {
        uint64_t v26 = 0;
        uint64_t v125 = v22;
        do
        {
          if (*(void *)v171 != v23) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v170 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x1D25FED50]();
          if ([v10 isCancelledWithProgress:0.5])
          {
            id v8 = v141;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 64;
              *(_WORD *)&buf[8] = 2080;
              *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v11 = (void *)MEMORY[0x1E4F1CBF0];
            id v115 = v20;
            goto LABEL_77;
          }
          if (([v27 hasMeetingRoom] & 1) == 0)
          {
            v138 = v28;
            uint64_t v29 = [v27 endDate];
            id v30 = [v130 objectForKeyedSubscript:v29];
            if (!v30)
            {
              id v30 = objc_alloc_init(MEMORY[0x1E4F71E60]);
              [v130 setObject:v30 forKeyedSubscript:v29];
            }
            v136 = (void *)v29;
            id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v32 = [v27 attendees];
            v33 = [v32 valueForKey:@"name"];
            v34 = v33;
            uint64_t v137 = v26;
            id v135 = v30;
            if (v33) {
              id v35 = v33;
            }
            else {
              id v35 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
            }
            v36 = v35;

            v37 = (void *)MEMORY[0x1E4F76CC8];
            v134 = v36;
            v38 = [v36 allObjects];
            v39 = [v37 cluesWithPeoples:v38 serviceManager:self->_serviceManager];

            long long v168 = 0u;
            long long v169 = 0u;
            long long v166 = 0u;
            long long v167 = 0u;
            id v40 = v39;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v166 objects:v177 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v167;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v167 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  v45 = *(void **)(*((void *)&v166 + 1) + 8 * i);
                  [v45 prepareIfNeeded];
                  v46 = [v45 person];
                  v47 = v46;
                  if (v46 && ([v46 isMe] & 1) == 0)
                  {
                    v48 = [v47 CNIdentifier];
                    if (v48)
                    {
                      [v31 addObject:v48];
                    }
                    else
                    {
                      v49 = [(PGMemoryTrigger *)self loggingConnection];
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        v50 = [v45 name];
                        *(_DWORD *)buf = 138477827;
                        *(void *)&buf[4] = v50;
                        _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] person.CNIdentifier found to be nil for person %{private}@", buf, 0xCu);
                      }
                      self = v144;
                    }
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v166 objects:v177 count:16];
              }
              while (v42);
            }

            v51 = v142;
            v52 = +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:v31 inGraph:v142];
            v53 = [v52 momentNodes];
            v54 = [v53 memoryNodes];
            v55 = [v54 collectionByIntersecting:v129];
            v133 = [v55 elementIdentifiers];

            id v131 = objc_alloc_init(MEMORY[0x1E4F71E60]);
            double v165 = 0.0;
            double v164 = 0.0;
            v56 = [v27 location];
            [v56 coordinate];
            double v164 = v57;
            double v165 = v58;

            v59 = -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self->_locationCache, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v164, v165, v24, v25);
            v132 = v59;
            if ([v59 count])
            {
              v128 = v52;
              long long v162 = 0u;
              long long v163 = 0u;
              long long v160 = 0u;
              long long v161 = 0u;
              id v60 = v59;
              uint64_t v61 = [v60 countByEnumeratingWithState:&v160 objects:v176 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                v63 = 0;
                uint64_t v64 = *(void *)v161;
                double v65 = 1.79769313e308;
                do
                {
                  for (uint64_t j = 0; j != v62; ++j)
                  {
                    if (*(void *)v161 != v64) {
                      objc_enumerationMutation(v60);
                    }
                    v67 = *(void **)(*((void *)&v160 + 1) + 8 * j);
                    *(void *)&buf[8] = 0;
                    *(void *)buf = 0;
                    v68 = [v67 location];
                    [v68 coordinate];
                    *(void *)buf = v69;
                    *(void *)&buf[8] = v70;

                    CLLocationCoordinate2DGetDistanceFrom();
                    if (v71 < v65)
                    {
                      double v72 = v71;
                      v73 = v67;

                      double v65 = v72;
                      v63 = v73;
                    }
                  }
                  uint64_t v62 = [v60 countByEnumeratingWithState:&v160 objects:v176 count:16];
                }
                while (v62);
              }
              else
              {
                v63 = 0;
                double v65 = 1.79769313e308;
              }

              v76 = [v63 locality];

              if (v76)
              {
                v77 = [v63 locality];
                id v78 = v142;
                v79 = +[PGGraphNamedLocationNodeCollection locationNodeWithName:v77 inGraph:v142];

                v80 = [v63 administrativeArea];

                if (v80)
                {
                  v81 = [v63 administrativeArea];
                  v80 = +[PGGraphNamedLocationNodeCollection locationNodeWithName:v81 inGraph:v142];
                }
                v82 = [v63 ISOcountryCode];

                if (v82)
                {
                  v83 = [v63 ISOcountryCode];
                  v82 = +[PGGraphNamedLocationNodeCollection locationNodeWithName:v83 inGraph:v142];
                }
                v155[0] = MEMORY[0x1E4F143A8];
                v155[1] = 3221225472;
                v155[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
                v155[3] = &unk_1E68EF1C8;
                BOOL v158 = v80 != 0;
                BOOL v159 = v82 != 0;
                id v156 = v80;
                id v157 = v82;
                id v123 = v80;
                id v84 = v82;
                uint64_t v85 = [v79 filteredCollectionUsingBlock:v155];
                v86 = v79;
                v87 = v85;

                v88 = [v87 momentNodes];
                v89 = [v63 location];
                [v89 coordinate];
                uint64_t v91 = v90;
                uint64_t v93 = v92;

                v149[0] = MEMORY[0x1E4F143A8];
                v149[1] = 3221225472;
                v149[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
                v149[3] = &unk_1E68EF218;
                uint64_t v152 = v91;
                uint64_t v153 = v93;
                double v154 = v65;
                id v150 = v131;
                id v151 = v129;
                [v88 enumerateIdentifiersAsCollectionsWithBlock:v149];

                id v75 = v131;
              }
              else
              {
                v87 = [(PGMemoryTrigger *)self loggingConnection];
                id v78 = v142;
                if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134283777;
                  *(double *)&buf[4] = v164;
                  *(_WORD *)&buf[12] = 2049;
                  *(double *)&buf[14] = v165;
                  _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] closestPlacemark.locality is nil, not going to try matching location for event coordinate (%{private}f, %{private}f)", buf, 0x16u);
                }
                id v75 = v131;
              }
              v51 = v78;

              uint64_t v26 = v137;
              v74 = v135;
              v52 = v128;
            }
            else
            {
              v63 = [(PGMemoryTrigger *)self loggingConnection];
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134283777;
                *(double *)&buf[4] = v164;
                *(_WORD *)&buf[12] = 2049;
                *(double *)&buf[14] = v165;
                _os_log_impl(&dword_1D1805000, v63, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] No placemarks found matching event coordinate (%{private}f, %{private}f)", buf, 0x16u);
              }
              uint64_t v26 = v137;
              v74 = v135;
              id v75 = v131;
            }

            [v133 identifierSetByIntersectingIdentifierSet:v75];
            v95 = v94 = v75;
            uint64_t v96 = [v95 count];
            v97 = v95;
            if (!v96)
            {
              [v74 unionWithIdentifierSet:v133];
              v97 = v94;
            }
            [v74 unionWithIdentifierSet:v97];

            uint64_t v22 = v125;
            id v20 = v126;
            uint64_t v23 = v124;
            v28 = v138;
            id v9 = v51;
            id v10 = v127;
          }
          ++v26;
        }
        while (v26 != v22);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v170 objects:v178 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v98 = v130;
    uint64_t v99 = [v98 countByEnumeratingWithState:&v145 objects:v174 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v139 = *(void *)v146;
      do
      {
        for (uint64_t k = 0; k != v100; ++k)
        {
          if (*(void *)v146 != v139) {
            objc_enumerationMutation(v98);
          }
          v102 = *(void **)(*((void *)&v145 + 1) + 8 * k);
          v103 = [v98 objectForKeyedSubscript:v102];
          v104 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v142 elementIdentifiers:v103];
          v105 = (void *)MEMORY[0x1E4F76C68];
          v106 = [v102 dateByAddingTimeInterval:-259200.0];
          v107 = [v105 localDateFromUniversalDate:v106 inTimeZone:v140];

          v108 = (void *)MEMORY[0x1E4F76C68];
          v109 = [v102 dateByAddingTimeInterval:-86400.0];
          v110 = [v108 localDateFromUniversalDate:v109 inTimeZone:v140];

          v111 = objc_opt_class();
          v112 = [v141 timeZone];
          v113 = [v111 validityIntervalForLocalStartDate:v107 localEndDate:v110 timeZone:v112];

          v114 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v104 withValidityInterval:v113];
          [v143 addObjectsFromArray:v114];
        }
        uint64_t v100 = [v98 countByEnumeratingWithState:&v145 objects:v174 count:16];
      }
      while (v100);
    }

    id v10 = v127;
    if ([v127 isCancelledWithProgress:1.0])
    {
      id v20 = v126;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 178;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E4F1CBF0];
      id v8 = v141;
      id v9 = v142;
      id v115 = v143;
    }
    else
    {
      id v115 = v143;
      v11 = v115;
      id v8 = v141;
      id v9 = v142;
      id v20 = v126;
    }
LABEL_77:
  }
  return v11;
}

uint64_t __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    v5 = [v3 stateNodes];
    int v6 = [v5 intersectsCollection:*(void *)(a1 + 32)];
  }
  else
  {
    int v6 = 1;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v7 = [v4 countryNodes];
    int v8 = [v7 intersectsCollection:*(void *)(a1 + 40)];
  }
  else
  {
    int v8 = 1;
  }

  return v6 & v8;
}

void __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 cityNodes];
  unint64_t v6 = [v5 count];

  if (v6 <= 1)
  {
    v7 = [v4 addressNodes];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3;
    v8[3] = &unk_1E68EF1F0;
    long long v12 = *(_OWORD *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 64);
    id v9 = *(id *)(a1 + 32);
    id v10 = v4;
    id v11 = *(id *)(a1 + 40);
    [v7 enumerateIdentifiersAsCollectionsWithBlock:v8];
  }
}

void __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  [a3 centroidCoordinate];
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v8 <= *(double *)(a1 + 72) + 0.01)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = objc_msgSend(*(id *)(a1 + 40), "memoryNodes", v13, v14);
    id v11 = [v10 collectionByIntersecting:*(void *)(a1 + 48)];
    long long v12 = [v11 elementIdentifiers];
    [v9 unionWithIdentifierSet:v12];

    *a4 = 1;
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 26;
}

- (PGMemoryTriggerUpcomingCalendarEvent)initWithServiceManager:(id)a3 locationCache:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryTriggerUpcomingCalendarEvent;
  id v11 = [(PGMemoryTrigger *)&v14 initWithLoggingConnection:a5];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceManager, a3);
    objc_storeStrong((id *)&v12->_locationCache, a4);
  }

  return v12;
}

@end