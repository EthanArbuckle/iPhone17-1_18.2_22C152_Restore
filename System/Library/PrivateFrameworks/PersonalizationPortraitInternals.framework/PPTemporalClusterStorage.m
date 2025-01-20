@interface PPTemporalClusterStorage
+ (id)defaultStorage;
+ (id)enrichEntities:(id)a3 mediaRecords:(id)a4;
- (PPTemporalClusterStorage)initWithEventStore:(id)a3 topicStore:(id)a4 entityStore:(id)a5 locationStore:(id)a6 contactStore:(id)a7;
- (id)createTemporalClusterForEvent:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 error:;
- (id)eventsWithStartDate:(id)a3 endDate:(id)a4;
- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
@end

@implementation PPTemporalClusterStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (id)eventsWithStartDate:(id)a3 endDate:(id)a4
{
  eventStore = self->_eventStore;
  id v7 = a4;
  id v8 = a3;
  v9 = [(PPLocalEventStore *)eventStore eventsFromDate:v8 toDate:v7];
  v10 = [(PPLocalEventStore *)self->_eventStore nlEventsFromDate:v8 toDate:v7];

  v11 = [v9 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  id v33 = 0;
  v11 = -[PPTemporalClusterStorage createTemporalClusterForEvent:startDate:endDate:error:](self, 0, v8, v9, &v33);
  id v12 = v33;
  id v27 = v10;
  [v10 addObject:v11];

  v13 = self;
  v24 = v9;
  v25 = v8;
  [(PPTemporalClusterStorage *)self eventsWithStartDate:v8 endDate:v9];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        v18 = v12;
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v20 = [v19 startDate];
        v21 = [v19 endDate];
        id v28 = v18;
        v22 = -[PPTemporalClusterStorage createTemporalClusterForEvent:startDate:endDate:error:](v13, v19, v20, v21, &v28);
        id v12 = v28;

        [v27 addObject:v22];
        if (a5 && v12) {
          *a5 = v12;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  return v27;
}

- (id)createTemporalClusterForEvent:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 error:
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  id v132 = a2;
  id v8 = a3;
  id v9 = a4;
  v134 = v8;
  v135 = v9;
  if (!a1)
  {
    v125 = 0;
    goto LABEL_115;
  }
  id v10 = v9;
  v11 = objc_opt_new();
  [v11 setFromDate:v8];
  [v11 setToDate:v10];
  [v11 setScoringDate:v10];
  [v11 setFilterByRelevanceDate:1];
  v148 = a1;
  id v12 = (void *)a1[2];
  id v196 = 0;
  v131 = v11;
  v13 = [v12 rankedTopicsWithQuery:v11 error:&v196];
  id v14 = v196;
  if (!v13)
  {
    uint64_t v15 = pp_temporal_clusters_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Topics Store query returned nil.", (uint8_t *)&buf, 2u);
    }

    if (v14)
    {
      uint64_t v16 = pp_temporal_clusters_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Topics Store query error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5) {
        *a5 = v14;
      }
    }
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v137 = objc_opt_new();
  [v137 setFromDate:v134];
  [v137 setToDate:v135];
  [v137 setScoringDate:v135];
  v17 = (void *)MEMORY[0x1CB79D060]([v137 setFilterByRelevanceDate:1]);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F256A3E8, 0);
  [v137 setExcludingAlgorithms:v18];

  v19 = (void *)v148[3];
  id v195 = v14;
  id v139 = [v19 rankedNamedEntitiesWithQuery:v137 error:&v195];
  id v20 = v195;

  if (!v139)
  {
    v21 = pp_temporal_clusters_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Named Entities Store query returned nil.", (uint8_t *)&buf, 2u);
    }

    if (v20)
    {
      v22 = pp_temporal_clusters_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Named Entities Store query error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5) {
        *a5 = v20;
      }
    }
    id v139 = (id)MEMORY[0x1E4F1CBF0];
  }
  v136 = objc_opt_new();
  [v136 setFromDate:v134];
  [v136 setToDate:v135];
  [v136 setScoringDate:v135];
  [v136 setFilterByRelevanceDate:1];
  uint64_t v189 = 0;
  v190 = &v189;
  uint64_t v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__26818;
  v193 = __Block_byref_object_dispose__26819;
  id v194 = 0;
  id v194 = (id)objc_opt_new();
  v23 = (void *)v148[4];
  id v188 = v20;
  v187[0] = MEMORY[0x1E4F143A8];
  v187[1] = 3221225472;
  v187[2] = __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke;
  v187[3] = &unk_1E65DC2F0;
  v187[4] = &v189;
  [v23 iterRankedLocationsWithQuery:v136 error:&v188 block:v187];
  id v24 = v188;

  if (![(id)v190[5] count] && v24)
  {
    v25 = pp_temporal_clusters_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_error_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Locations Store query error: %@", (uint8_t *)&buf, 0xCu);
    }

    if (a5) {
      *a5 = v24;
    }
  }
  v26 = objc_opt_new();
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id obj = v13;
  uint64_t v27 = [obj countByEnumeratingWithState:&v183 objects:v203 count:16];
  if (v27)
  {
    uint64_t v142 = *(void *)v184;
    do
    {
      uint64_t v155 = 0;
      uint64_t v145 = v27;
      do
      {
        if (*(void *)v184 != v142) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v183 + 1) + 8 * v155);
        context = (void *)MEMORY[0x1CB79D060]();
        long long v29 = [v28 item];
        long long v30 = [v29 mostRelevantRecord];
        long long v31 = [v30 source];
        long long v32 = [v31 metadata];
        BOOL v33 = [v32 contactHandleCount] == 0;

        if (!v33)
        {
          v34 = (void *)v148[5];
          uint64_t v35 = [v28 item];
          v36 = [v35 mostRelevantRecord];
          v37 = [v36 source];
          id v182 = v24;
          v38 = [v34 contactHandlesForSource:v37 error:&v182];
          id v149 = v182;

          if (!v38)
          {
            v39 = pp_temporal_clusters_log_handle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v149;
              _os_log_error_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          long long v180 = 0u;
          long long v181 = 0u;
          long long v178 = 0u;
          long long v179 = 0u;
          id v40 = v38;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v178 objects:v202 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v179;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v179 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = *(void *)(*((void *)&v178 + 1) + 8 * i);
                v45 = NSNumber;
                v46 = [v26 objectForKeyedSubscript:v44];
                [v46 doubleValue];
                double v48 = v47;
                [v28 score];
                v50 = [v45 numberWithDouble:v48 + v49];
                [v26 setObject:v50 forKeyedSubscript:v44];
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v178 objects:v202 count:16];
            }
            while (v41);
          }

          id v24 = v149;
        }
        ++v155;
      }
      while (v155 != v145);
      uint64_t v27 = [obj countByEnumeratingWithState:&v183 objects:v203 count:16];
    }
    while (v27);
  }

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v140 = v139;
  uint64_t v51 = [v140 countByEnumeratingWithState:&v174 objects:v201 count:16];
  if (v51)
  {
    uint64_t v143 = *(void *)v175;
    do
    {
      uint64_t v156 = 0;
      uint64_t v146 = v51;
      do
      {
        if (*(void *)v175 != v143) {
          objc_enumerationMutation(v140);
        }
        v52 = *(void **)(*((void *)&v174 + 1) + 8 * v156);
        contexta = (void *)MEMORY[0x1CB79D060]();
        v53 = [v52 item];
        v54 = [v53 mostRelevantRecord];
        v55 = [v54 source];
        v56 = [v55 metadata];
        BOOL v57 = [v56 contactHandleCount] == 0;

        if (!v57)
        {
          v58 = (void *)v148[5];
          v59 = [v52 item];
          v60 = [v59 mostRelevantRecord];
          v61 = [v60 source];
          id v173 = v24;
          v62 = [v58 contactHandlesForSource:v61 error:&v173];
          id v150 = v173;

          if (!v62)
          {
            v63 = pp_temporal_clusters_log_handle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v150;
              _os_log_error_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          id v64 = v62;
          uint64_t v65 = [v64 countByEnumeratingWithState:&v169 objects:v200 count:16];
          if (v65)
          {
            uint64_t v66 = *(void *)v170;
            do
            {
              for (uint64_t j = 0; j != v65; ++j)
              {
                if (*(void *)v170 != v66) {
                  objc_enumerationMutation(v64);
                }
                uint64_t v68 = *(void *)(*((void *)&v169 + 1) + 8 * j);
                v69 = NSNumber;
                v70 = [v26 objectForKeyedSubscript:v68];
                [v70 doubleValue];
                double v72 = v71;
                [v52 score];
                v74 = [v69 numberWithDouble:v72 + v73];
                [v26 setObject:v74 forKeyedSubscript:v68];
              }
              uint64_t v65 = [v64 countByEnumeratingWithState:&v169 objects:v200 count:16];
            }
            while (v65);
          }

          id v24 = v150;
        }
        ++v156;
      }
      while (v156 != v146);
      uint64_t v51 = [v140 countByEnumeratingWithState:&v174 objects:v201 count:16];
    }
    while (v51);
  }

  id v75 = v132;
  if (v75)
  {
    v76 = v75;
    if ([v75 suggestedEventCategory] != 8)
    {
      v130 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_91:
      id v75 = v76;
      goto LABEL_92;
    }
    v77 = objc_opt_new();
    v78 = (void *)v148[1];
    v79 = [v76 eventIdentifier];
    v80 = [v78 customObjectForKey:*MEMORY[0x1E4F8A1B0] eventIdentifier:v79];

    if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v89 = 0;
      goto LABEL_82;
    }
    id v81 = v80;
    v82 = [v81 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
    if (v82)
    {
      v83 = [v81 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v85 = [v81 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
        v86 = [v85 firstObject];
        v87 = [v86 objectForKeyedSubscript:@"reservationFor"];

        if (v87)
        {
          v88 = [v86 objectForKeyedSubscript:@"reservationFor"];
          id v89 = [v88 objectForKeyedSubscript:@"name"];

LABEL_81:
LABEL_82:
          if ([v89 length])
          {
            v90 = [v89 lowercaseString];

            v91 = objc_opt_new();
            v92 = (void *)MEMORY[0x1CB79D060]();
            id v93 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            v94 = objc_msgSend(v93, "initWithObjects:", *MEMORY[0x1E4F8A0B0], 0);
            [v91 setMatchingSourceBundleIds:v94];

            v95 = (void *)v148[3];
            id v197 = 0;
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v207 = __53__PPTemporalClusterStorage_fetchRelatedMediaRecords___block_invoke;
            v208 = &unk_1E65DC360;
            id v89 = v90;
            id v209 = v89;
            id v210 = v77;
            LOBYTE(v95) = [v95 iterNamedEntityRecordsWithQuery:v91 error:&v197 block:&buf];
            id v96 = v197;
            if ((v95 & 1) == 0)
            {
              v97 = pp_temporal_clusters_log_handle();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v204 = 138412290;
                id v205 = v96;
                _os_log_error_impl(&dword_1CA9A8000, v97, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage fetchRelatedMediaItems: Entity Store query error: %@", v204, 0xCu);
              }

              v130 = (void *)MEMORY[0x1E4F1CBF0];
              goto LABEL_90;
            }
          }
          else
          {
            id v96 = 0;
          }
          v130 = (void *)[v77 copy];
LABEL_90:

          goto LABEL_91;
        }
      }
    }
    v85 = pp_temporal_clusters_log_handle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v85, OS_LOG_TYPE_DEBUG, "PPTemporalClusterStorage ticketReservationFromMetadata: Couldn't fetch anything from the reservationFor schemaOrg property.", (uint8_t *)&buf, 2u);
    }
    id v89 = 0;
    goto LABEL_81;
  }
  v130 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_92:
  id v127 = v75;

  v129 = objc_msgSend(v130, "_pas_mappedArrayWithTransform:", &__block_literal_global_26825);
  v128 = +[PPTemporalClusterStorage enrichEntities:v140 mediaRecords:v130];
  long long v167 = 0u;
  long long v168 = 0u;
  long long v166 = 0u;
  long long v165 = 0u;
  id v138 = (id)v190[5];
  uint64_t v98 = [v138 countByEnumeratingWithState:&v165 objects:v199 count:16];
  if (v98)
  {
    uint64_t v144 = *(void *)v166;
    do
    {
      uint64_t v157 = 0;
      uint64_t v147 = v98;
      do
      {
        if (*(void *)v166 != v144) {
          objc_enumerationMutation(v138);
        }
        v99 = *(void **)(*((void *)&v165 + 1) + 8 * v157);
        contextb = (void *)MEMORY[0x1CB79D060]();
        v100 = [v99 location];
        v101 = [v100 mostRelevantRecord];
        v102 = [v101 source];
        v103 = [v102 metadata];
        BOOL v104 = [v103 contactHandleCount] == 0;

        if (!v104)
        {
          v105 = (void *)v148[5];
          v106 = [v99 location];
          v107 = [v106 mostRelevantRecord];
          v108 = [v107 source];
          id v164 = v24;
          v109 = [v105 contactHandlesForSource:v108 error:&v164];
          id v151 = v164;

          if (!v109)
          {
            v110 = pp_temporal_clusters_log_handle();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v151;
              _os_log_error_impl(&dword_1CA9A8000, v110, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          id v111 = v109;
          uint64_t v112 = [v111 countByEnumeratingWithState:&v160 objects:v198 count:16];
          if (v112)
          {
            uint64_t v113 = *(void *)v161;
            do
            {
              for (uint64_t k = 0; k != v112; ++k)
              {
                if (*(void *)v161 != v113) {
                  objc_enumerationMutation(v111);
                }
                uint64_t v115 = *(void *)(*((void *)&v160 + 1) + 8 * k);
                v116 = NSNumber;
                v117 = [v26 objectForKeyedSubscript:v115];
                [v117 doubleValue];
                double v119 = v118;
                [v99 score];
                v121 = [v116 numberWithDouble:v119 + v120];
                [v26 setObject:v121 forKeyedSubscript:v115];
              }
              uint64_t v112 = [v111 countByEnumeratingWithState:&v160 objects:v198 count:16];
            }
            while (v112);
          }

          id v24 = v151;
        }
        ++v157;
      }
      while (v157 != v147);
      uint64_t v98 = [v138 countByEnumeratingWithState:&v165 objects:v199 count:16];
    }
    while (v98);
  }

  if (a5) {
    *a5 = v24;
  }
  v122 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_26;
  v158[3] = &unk_1E65DC338;
  id v123 = v122;
  id v159 = v123;
  [v26 enumerateKeysAndObjectsUsingBlock:v158];
  [v123 sortUsingSelector:sel_reverseCompare_];
  id v124 = objc_alloc(MEMORY[0x1E4F89F70]);
  v125 = (void *)[v124 initWithEvent:v127 startDate:v134 endDate:v135 score:obj topics:v128 entities:v190[5] locations:1.0 contacts:MEMORY[0x1E4F1CBF0] contactHandles:v123 mediaItems:v129];

  _Block_object_dispose(&v189, 8);
LABEL_115:

  return v125;
}

uint64_t __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E4F89EF8];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  [v6 doubleValue];
  double v10 = v9;

  id v11 = (id)[v8 initWithContactHandle:v7 score:v10];
  [v4 addObject:v11];
}

id __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_24(uint64_t a1, void *a2)
{
  v2 = [a2 source];
  v3 = [v2 documentId];

  return v3;
}

void __53__PPTemporalClusterStorage_fetchRelatedMediaRecords___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 entity];
  v4 = [v3 name];
  v5 = [v4 lowercaseString];

  if (([*(id *)(a1 + 32) localizedCaseInsensitiveContainsString:v5] & 1) != 0
    || ([MEMORY[0x1E4F89FC8] jaroSimilarityForString:v5 other:*(void *)(a1 + 32)], v6 > 0.9))
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (PPTemporalClusterStorage)initWithEventStore:(id)a3 topicStore:(id)a4 entityStore:(id)a5 locationStore:(id)a6 contactStore:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PPTemporalClusterStorage;
  v17 = [(PPTemporalClusterStorage *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStore, a3);
    objc_storeStrong((id *)&v18->_topicStore, a4);
    objc_storeStrong((id *)&v18->_entityStore, a5);
    objc_storeStrong((id *)&v18->_locationStore, a6);
    objc_storeStrong((id *)&v18->_contactStore, a7);
  }

  return v18;
}

+ (id)enrichEntities:(id)a3 mediaRecords:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)(*((void *)&v52 + 1) + 8 * i) entity];
        id v13 = [v12 name];
        [v7 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v9);
  }

  id v14 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v43 = v5;
  uint64_t v15 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v43);
        }
        v19 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v20 = (void *)MEMORY[0x1CB79D060]();
        objc_super v21 = [v19 item];
        v22 = [v21 name];
        int v23 = [v7 containsObject:v22];

        if (v23)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F89F00]);
          v25 = [v19 item];
          v26 = (void *)[v24 initWithItem:v25 score:1.0];
          [v14 addObject:v26];

          uint64_t v27 = [v19 item];
          id v28 = [v27 name];
          [v7 removeObject:v28];
        }
        else
        {
          [v14 addObject:v19];
        }
      }
      uint64_t v16 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = obj;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        uint64_t v35 = [v34 entity];
        v36 = [v35 name];
        int v37 = [v7 containsObject:v36];

        if (v37)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F89F00]);
          v39 = [v34 entity];
          id v40 = (void *)[v38 initWithItem:v39 score:1.0];
          [v14 addObject:v40];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v31);
  }

  return v14;
}

+ (id)defaultStorage
{
  v2 = +[PPLocalEventStore defaultStore];
  v3 = +[PPLocalTopicStore defaultStore];
  v4 = +[PPLocalNamedEntityStore defaultStore];
  id v5 = +[PPLocalLocationStore defaultStore];
  uint64_t v6 = +[PPLocalContactStore defaultStore];
  id v7 = (void *)v6;
  if (!v2)
  {
    uint64_t v9 = pp_temporal_clusters_log_handle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v10 = "PPTemporalClusterStorage: Failed to obtain default Events Store";
LABEL_19:
    _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_20;
  }
  if (!v3)
  {
    uint64_t v9 = pp_temporal_clusters_log_handle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v10 = "PPTemporalClusterStorage: Failed to obtain default Topics Store";
    goto LABEL_19;
  }
  if (!v4)
  {
    uint64_t v9 = pp_temporal_clusters_log_handle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v10 = "PPTemporalClusterStorage: Failed to obtain default Named Entities Store";
    goto LABEL_19;
  }
  if (!v5)
  {
    uint64_t v9 = pp_temporal_clusters_log_handle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v10 = "PPTemporalClusterStorage: Failed to obtain default Locations Store";
    goto LABEL_19;
  }
  if (!v6)
  {
    uint64_t v9 = pp_temporal_clusters_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v10 = "PPTemporalClusterStorage: Failed to obtain default Contacts Store";
      goto LABEL_19;
    }
LABEL_20:
    id v8 = 0;
    goto LABEL_21;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PPTemporalClusterStorage_defaultStorage__block_invoke;
  block[3] = &unk_1E65DC2C8;
  id v13 = v2;
  id v14 = v3;
  id v15 = v4;
  id v16 = v5;
  id v17 = v7;
  if (defaultStorage__pasOnceToken9 != -1) {
    dispatch_once(&defaultStorage__pasOnceToken9, block);
  }
  id v8 = (id)defaultStorage__pasExprOnceResult_26869;

  uint64_t v9 = v13;
LABEL_21:

  return v8;
}

void __42__PPTemporalClusterStorage_defaultStorage__block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  v3 = [[PPTemporalClusterStorage alloc] initWithEventStore:a1[4] topicStore:a1[5] entityStore:a1[6] locationStore:a1[7] contactStore:a1[8]];
  v4 = (void *)defaultStorage__pasExprOnceResult_26869;
  defaultStorage__pasExprOnceResult_26869 = (uint64_t)v3;
}

@end