@interface ATXUIFeedbackBiomeCorrelateHandler
+ (id)uiFeedbackCorrelateHandler;
- (BOOL)_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:(id)a3 suggestion2:(id)a4;
- (id)boxedExecutableHashForProactiveSuggestion:(id)a3;
- (id)correlateWithCurrentEvent:(id)a3;
- (void)receiveCurrentEvent:(id)a3;
- (void)receivePriorEvent:(id)a3;
- (void)updateMostRecentlySeenBlendingUICacheUpdateUUID:(id)a3;
@end

@implementation ATXUIFeedbackBiomeCorrelateHandler

+ (id)uiFeedbackCorrelateHandler
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = objc_opt_new();
  v4 = (void *)[v2 initWithInitialContext:v3];

  return v4;
}

- (void)updateMostRecentlySeenBlendingUICacheUpdateUUID:(id)a3
{
  id v4 = a3;
  v5 = [(BPSCorrelateHandler *)self context];
  [v5 updatePinnedBlendingModelUICacheUpdateUUID:v4];

  id v6 = [(BPSCorrelateHandler *)self context];
  [v6 pruneContextStateOlderThanBlendingUUID:v4];
}

- (void)receivePriorEvent:(id)a3
{
  id v4 = a3;
  v5 = [(BPSCorrelateHandler *)self context];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 eventBody];
    v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&unk_1F0638E98])
      {
        [v5 addContext:v7];
        v8 = __atxlog_handle_blending_ecosystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:]();
        }
LABEL_13:

        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 addBlendingModelUICacheUpdate:v7];
        v8 = __atxlog_handle_blending_ecosystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:]((uint64_t)self, v7);
        }
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 addClientModelCacheUpdate:v7];
        v8 = __atxlog_handle_blending_ecosystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:]((uint64_t)self, v7);
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_14:
}

- (void)receiveCurrentEvent:(id)a3
{
  v3 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ATXUIFeedbackBiomeCorrelateHandler receiveCurrentEvent:]();
  }
}

- (id)correlateWithCurrentEvent:(id)a3
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v92 = (id)objc_opt_new();
  id v5 = v4;
  id v6 = [(BPSCorrelateHandler *)self context];
  v7 = [v6 context];
  v8 = [v5 sessionEndDate];
  [v7 updateTimeContextWithDate:v8];

  v100 = objc_opt_new();
  v99 = objc_opt_new();
  v98 = objc_opt_new();
  v9 = [v5 blendingUICacheUpdateUUID];
  v10 = [v6 clientModelCacheUpdatesForUICacheUpdateUUID:v9];

  v93 = v5;
  v11 = [v5 blendingUICacheUpdateUUID];
  v91 = v6;
  v12 = [v6 blendingModelUICacheUpdateForUUID:v11];

  if ([v10 count] && v12)
  {
    v90 = v12;
    v88 = v7;
    v13 = objc_opt_new();
    context = (void *)MEMORY[0x1B3E6F520]();
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v87 = v10;
    obuint64_t j = v10;
    uint64_t v14 = [obj countByEnumeratingWithState:&v145 objects:v158 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v107 = *(void *)v146;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v146 != v107) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v145 + 1) + 8 * i);
          long long v141 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          v18 = [v17 suggestions];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v141 objects:v157 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v142;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v142 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v141 + 1) + 8 * j);
                v24 = [v23 uuid];
                [v13 setObject:v23 forKeyedSubscript:v24];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v141 objects:v157 count:16];
            }
            while (v20);
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v145 objects:v158 count:16];
      }
      while (v15);
    }

    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    v25 = [v93 engagedUUIDs];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v137 objects:v156 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v138;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v138 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v137 + 1) + 8 * k)];
          if (v30) {
            [v99 addObject:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v137 objects:v156 count:16];
      }
      while (v27);
    }

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v31 = [v93 shownUUIDs];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v133 objects:v155 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v134;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v134 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v133 + 1) + 8 * m)];
          if (v36) {
            [v100 addObject:v36];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v133 objects:v155 count:16];
      }
      while (v33);
    }

    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v37 = [v93 rejectedUUIDs];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v129 objects:v154 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v130;
      do
      {
        for (uint64_t n = 0; n != v39; ++n)
        {
          if (*(void *)v130 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v129 + 1) + 8 * n)];
          if (v42) {
            [v98 addObject:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v129 objects:v154 count:16];
      }
      while (v39);
    }

    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v89 = obj;
    uint64_t v95 = [v89 countByEnumeratingWithState:&v125 objects:v153 count:16];
    if (v95)
    {
      uint64_t v94 = *(void *)v126;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v126 != v94) {
            objc_enumerationMutation(v89);
          }
          uint64_t v102 = v43;
          v44 = *(void **)(*((void *)&v125 + 1) + 8 * v43);
          v101 = (void *)MEMORY[0x1B3E6F520]();
          contexta = objc_opt_new();
          uint64_t v45 = objc_opt_new();
          id obja = (id)objc_opt_new();
          v46 = objc_opt_new();
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          v97 = v44;
          v47 = [v44 suggestions];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v121 objects:v152 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v122;
            do
            {
              for (iuint64_t i = 0; ii != v49; ++ii)
              {
                if (*(void *)v122 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void *)(*((void *)&v121 + 1) + 8 * ii);
                v53 = [(ATXUIFeedbackBiomeCorrelateHandler *)self boxedExecutableHashForProactiveSuggestion:v52];
                [v46 setObject:v52 forKey:v53];
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v121 objects:v152 count:16];
            }
            while (v49);
          }
          v108 = (void *)v45;

          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v54 = v100;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v117 objects:v151 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v118;
            do
            {
              for (juint64_t j = 0; jj != v56; ++jj)
              {
                if (*(void *)v118 != v57) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v59 = *(void *)(*((void *)&v117 + 1) + 8 * jj);
                v60 = [(ATXUIFeedbackBiomeCorrelateHandler *)self boxedExecutableHashForProactiveSuggestion:v59];
                v61 = [v46 objectForKey:v60];
                if (v61
                  && [(ATXUIFeedbackBiomeCorrelateHandler *)self _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:v59 suggestion2:v61])
                {
                  [contexta addObject:v61];
                }
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v117 objects:v151 count:16];
            }
            while (v56);
          }

          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v62 = v99;
          uint64_t v63 = [v62 countByEnumeratingWithState:&v113 objects:v150 count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            uint64_t v65 = *(void *)v114;
            do
            {
              for (kuint64_t k = 0; kk != v64; ++kk)
              {
                if (*(void *)v114 != v65) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v67 = *(void *)(*((void *)&v113 + 1) + 8 * kk);
                v68 = [(ATXUIFeedbackBiomeCorrelateHandler *)self boxedExecutableHashForProactiveSuggestion:v67];
                v69 = [v46 objectForKey:v68];
                if (v69
                  && [(ATXUIFeedbackBiomeCorrelateHandler *)self _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:v67 suggestion2:v69])
                {
                  [v108 addObject:v69];
                }
              }
              uint64_t v64 = [v62 countByEnumeratingWithState:&v113 objects:v150 count:16];
            }
            while (v64);
          }

          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v70 = v98;
          uint64_t v71 = [v70 countByEnumeratingWithState:&v109 objects:v149 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v110;
            do
            {
              for (muint64_t m = 0; mm != v72; ++mm)
              {
                if (*(void *)v110 != v73) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v75 = *(void *)(*((void *)&v109 + 1) + 8 * mm);
                v76 = [(ATXUIFeedbackBiomeCorrelateHandler *)self boxedExecutableHashForProactiveSuggestion:v75];
                v77 = [v46 objectForKey:v76];
                if (v77
                  && [(ATXUIFeedbackBiomeCorrelateHandler *)self _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:v75 suggestion2:v77])
                {
                  [obja addObject:v77];
                }
              }
              uint64_t v72 = [v70 countByEnumeratingWithState:&v109 objects:v149 count:16];
            }
            while (v72);
          }

          v79 = obja;
          v78 = v108;
          if ([contexta count])
          {
            v96 = [ATXProactiveSuggestionUIFeedbackResult alloc];
            v80 = [contexta array];
            v81 = [v108 array];
            v82 = [obja array];
            uint64_t v83 = [v93 consumerSubType];
            v84 = [v91 context];
            v79 = obja;
            v85 = [(ATXProactiveSuggestionUIFeedbackResult *)v96 initWithShownSuggestions:v80 engagedSuggestions:v81 rejectedSuggestions:v82 session:v93 consumerSubType:v83 clientCacheUpdate:v97 uiCacheUpdate:v90 context:v84];

            v78 = v108;
            [v92 addObject:v85];
          }
          uint64_t v43 = v102 + 1;
        }
        while (v102 + 1 != v95);
        uint64_t v95 = [v89 countByEnumeratingWithState:&v125 objects:v153 count:16];
      }
      while (v95);
    }

    v10 = v87;
    v7 = v88;
    v12 = v90;
  }
  else
  {
    v13 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      [(ATXUIFeedbackBiomeCorrelateHandler *)(uint64_t)self correlateWithCurrentEvent:v13];
    }
  }

  return v92;
}

- (id)boxedExecutableHashForProactiveSuggestion:(id)a3
{
  v3 = [a3 executableSpecification];
  uint64_t v4 = [v3 executableObjectHash];

  id v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v4];
  return v5;
}

- (BOOL)_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:(id)a3 suggestion2:(id)a4
{
  id v5 = a4;
  id v6 = [a3 executableSpecification];
  v7 = [v5 executableSpecification];

  LOBYTE(v5) = [v6 fuzzyIsEqualToExecutableSpecification:v7];
  return (char)v5;
}

- (void)receivePriorEvent:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_1(&dword_1AE67F000, v2, v3, "%@ - received new prior context event", v4, v5, v6, v7, 2u);
}

- (void)receivePriorEvent:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 uuid];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1AE67F000, v6, v7, "%@ - received new prior context event with blending ui cache uuid: %@", v8, v9, v10, v11, v12);
}

- (void)receivePriorEvent:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 clientModelId];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1AE67F000, v6, v7, "%@ - received new prior context event for clientModelId: %@", v8, v9, v10, v11, v12);
}

- (void)receiveCurrentEvent:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_1(&dword_1AE67F000, v2, v3, "%@ - received new current (feedback session) event", v4, v5, v6, v7, 2u);
}

- (void)correlateWithCurrentEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(a2, "consumerSubType"));
  OUTLINED_FUNCTION_0_6();
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find any client caches for session with consumerSubType: %@", v8, 0x16u);
}

@end