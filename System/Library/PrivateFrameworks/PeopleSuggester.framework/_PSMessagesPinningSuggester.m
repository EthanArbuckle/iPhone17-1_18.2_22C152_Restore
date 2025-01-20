@interface _PSMessagesPinningSuggester
- (BOOL)boostGroups;
- (BOOL)boostIndividualFavorites;
- (BOOL)loadPSConfig;
- (BOOL)outgoingOnly;
- (NSDictionary)psMessagesPinningConfig;
- (NSString)configVersion;
- (_CDInteractionStore)interactionStore;
- (_PSMessagesPinningSuggester)init;
- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10;
- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10 outgoingOnly:(BOOL)a11;
- (double)intensityThreshold;
- (double)intensityWeight;
- (double)lookbackWindow;
- (double)regularityThreshold;
- (double)regularityWeight;
- (id)chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:(int64_t)a3 referenceDate:(id)a4 minimumDaysOfHistory:(int64_t)a5 maxInteractionsForQuery:(int64_t)a6;
- (id)chatGuidsForMessagesPinningWithMaxSuggestions:(int64_t)a3;
- (id)chatGuidsForPinningHeuristicApproachWithMaxSuggestions:(int64_t)a3 forReferenceDate:(id)a4;
- (id)getPayloadOfFeedback:(id)a3;
- (int64_t)minimalInteractions;
- (int64_t)minimalUniqueDaysInteracted;
- (void)dealloc;
- (void)provideMessagesPinningFeedback:(id)a3;
- (void)setBoostGroups:(BOOL)a3;
- (void)setBoostIndividualFavorites:(BOOL)a3;
- (void)setConfigVersion:(id)a3;
- (void)setIntensityThreshold:(double)a3;
- (void)setIntensityWeight:(double)a3;
- (void)setInteractionStore:(id)a3;
- (void)setLookbackWindow:(double)a3;
- (void)setMinimalInteractions:(int64_t)a3;
- (void)setMinimalUniqueDaysInteracted:(int64_t)a3;
- (void)setOutgoingOnly:(BOOL)a3;
- (void)setPsMessagesPinningConfig:(id)a3;
- (void)setRegularityThreshold:(double)a3;
- (void)setRegularityWeight:(double)a3;
- (void)submitMessagesPinningFeedback:(id)a3;
- (void)updateModelProperties:(id)a3;
@end

@implementation _PSMessagesPinningSuggester

- (id)chatGuidsForPinningHeuristicApproachWithMaxSuggestions:(int64_t)a3 forReferenceDate:(id)a4
{
  id v6 = a4;
  v7 = [(_PSMessagesPinningSuggester *)self chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:a3 referenceDate:v6 minimumDaysOfHistory:+[_PSPrivacyDataRetentionPeriod numberOfDaysInMonth] maxInteractionsForQuery:2500];

  return v7;
}

- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10 outgoingOnly:(BOOL)a11
{
  id v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)_PSMessagesPinningSuggester;
  v22 = [(_PSMessagesPinningSuggester *)&v29 init];
  v23 = v22;
  if (v22)
  {
    v22->_regularityThreshold = a3;
    v22->_intensityThreshold = a4;
    v22->_regularityWeight = a5;
    v22->_intensityWeight = a6;
    v22->_minimalInteractions = a7;
    v22->_minimalUniqueDaysInteracted = a8;
    if (v21) {
      objc_storeStrong((id *)&v22->_interactionStore, a9);
    }
    v23->_lookbackWindow = a10;
    v23->_outgoingOnly = a11;
    v23->_lock._os_unfair_lock_opaque = 0;
    id v24 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v25 = [v24 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = v23->_connection;
    v23->_connection = (NSXPCConnection *)v25;

    v27 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v23->_connection setRemoteObjectInterface:v27];

    [(NSXPCConnection *)v23->_connection resume];
    [(_PSMessagesPinningSuggester *)v23 loadPSConfig];
  }

  return v23;
}

- (BOOL)loadPSConfig
{
  v3 = +[_PSConfig messagesPinningConfig];
  psMessagesPinningConfig = self->_psMessagesPinningConfig;
  self->_psMessagesPinningConfig = v3;

  v5 = self->_psMessagesPinningConfig;
  if (v5)
  {
    [(_PSMessagesPinningSuggester *)self updateModelProperties:self->_psMessagesPinningConfig];
    id v6 = +[_PSLogging messagePinningChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, "Loaded psConfig", v8, 2u);
    }
  }
  return v5 != 0;
}

- (void)updateModelProperties:(id)a3
{
  id v4 = a3;
  [(_PSMessagesPinningSuggester *)self setConfigVersion:@"2"];
  id v8 = [v4 objectForKeyedSubscript:@"2"];

  v5 = [v8 objectForKeyedSubscript:@"_PSMessagesPinningBoostGroups"];
  -[_PSMessagesPinningSuggester setBoostGroups:](self, "setBoostGroups:", [v5 integerValue] != 0);

  id v6 = [v8 objectForKeyedSubscript:@"_PSMessagesPinningOutgoingOnly"];
  -[_PSMessagesPinningSuggester setOutgoingOnly:](self, "setOutgoingOnly:", [v6 integerValue] != 0);

  v7 = [v8 objectForKeyedSubscript:@"_PSMessagesPinningBoostIndividualFavorites"];
  -[_PSMessagesPinningSuggester setBoostIndividualFavorites:](self, "setBoostIndividualFavorites:", [v7 integerValue] != 0);
}

- (void)setOutgoingOnly:(BOOL)a3
{
  self->_outgoingOnly = a3;
}

- (void)setConfigVersion:(id)a3
{
}

- (void)setBoostIndividualFavorites:(BOOL)a3
{
  self->_boostIndividualFavorites = a3;
}

- (void)setBoostGroups:(BOOL)a3
{
  self->_boostGroups = a3;
}

- (id)chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:(int64_t)a3 referenceDate:(id)a4 minimumDaysOfHistory:(int64_t)a5 maxInteractionsForQuery:(int64_t)a6
{
  v203[2] = *MEMORY[0x1E4F143B8];
  id v148 = a4;
  if ([MEMORY[0x1E4F5B3B8] isRunningOnInternalBuild])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PeopleSuggester.MessagesPinning"];
    if ([v9 integerForKey:@"TestModeEnabled"] == 1)
    {
      [(_PSMessagesPinningSuggester *)self setMinimalInteractions:0];
      [(_PSMessagesPinningSuggester *)self setMinimalUniqueDaysInteracted:0];
      a5 = 0;
    }
  }
  v163 = self;
  BOOL v10 = [(_PSMessagesPinningSuggester *)self outgoingOnly];
  v11 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v12 = +[_PSConstants mobileMessagesBundleId];
  v13 = (void *)v12;
  if (v10)
  {
    v203[0] = v12;
    v14 = +[_PSConstants macMessagesBundleId];
    v203[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:2];
    [v11 predicateWithFormat:@"(bundleId IN %@) AND (mechanism == %@) AND (direction IN %@)", v15, &unk_1EF675138, &unk_1EF675FF0];
  }
  else
  {
    v202[0] = v12;
    v14 = +[_PSConstants macMessagesBundleId];
    v202[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:2];
    [v11 predicateWithFormat:@"(bundleId IN %@) AND (mechanism == %@)", v15, &unk_1EF675138, v143];
  v16 = };

  v17 = (void *)MEMORY[0x1E4F28F60];
  v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a5)];
  uint64_t v19 = [v17 predicateWithFormat:@"startDate < %@", v18];

  v20 = (void *)MEMORY[0x1E4F28BA0];
  v201[0] = v16;
  v201[1] = v19;
  v151 = (void *)v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:2];
  uint64_t v22 = [v20 andPredicateWithSubpredicates:v21];

  v23 = [(_PSMessagesPinningSuggester *)v163 interactionStore];
  id v191 = 0;
  v146 = (void *)v22;
  id v24 = [v23 queryInteractionsUsingPredicate:v22 sortDescriptors:0 limit:1 error:&v191];
  id v25 = v191;

  v147 = v25;
  if (v25)
  {
    v26 = +[_PSLogging messagePinningChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_PSMessagesPinningSuggester chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:]();
    }
LABEL_11:
    v27 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_141;
  }
  if (![v24 count])
  {
    v26 = +[_PSLogging messagePinningChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_DEFAULT, "Minimum Days of History Check Failed", buf, 2u);
    }
    goto LABEL_11;
  }
  [(_PSMessagesPinningSuggester *)v163 lookbackWindow];
  v149 = [v148 dateByAddingTimeInterval:-v28];
  uint64_t v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate >= %@", v149];

  id v162 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v167 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v160 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v161 = [MEMORY[0x1E4F1CA80] set];
  v158 = +[_PSContactResolver handlesForContactFavorites];
  uint64_t v144 = MEMORY[0x1E4F1CBF0];
  unint64_t v150 = a6;
  v151 = (void *)v29;
  v145 = v16;
  v170 = v31;
  v159 = v32;
  v164 = v30;
  while (2)
  {
    v33 = v24;
    context = (void *)MEMORY[0x1A6243860]();
    v34 = (void *)MEMORY[0x1E4F28BA0];
    v200[0] = v16;
    v200[1] = v151;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:2];
    uint64_t v36 = [v34 andPredicateWithSubpredicates:v35];

    uint64_t v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v38 = [(_PSMessagesPinningSuggester *)v163 interactionStore];
    v152 = (void *)v37;
    uint64_t v199 = v37;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v199 count:1];
    id v190 = 0;
    v153 = (void *)v36;
    v40 = [v38 queryInteractionsUsingPredicate:v36 sortDescriptors:v39 limit:a6 error:&v190];
    id v41 = v190;

    v155 = v41;
    v156 = v40;
    if (v41)
    {
      obuint64_t j = +[_PSLogging messagePinningChannel];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v198 = v41;
        _os_log_error_impl(&dword_1A314B000, obj, OS_LOG_TYPE_ERROR, "Error while querying interation store %@", buf, 0xCu);
      }
      id v24 = v40;
      v42 = v164;
LABEL_18:
      v43 = v160;
      goto LABEL_77;
    }
    v44 = [v40 lastObject];
    v45 = [v44 startDate];
    [v149 timeIntervalSinceDate:v45];
    if (v46 < 0.0)
    {
      uint64_t v47 = [v40 count];

      if (v47 != v150)
      {
        v16 = v145;
        v42 = v164;
        goto LABEL_24;
      }
      v48 = (void *)MEMORY[0x1E4F28F60];
      v44 = [v40 lastObject];
      v45 = [v44 startDate];
      uint64_t v49 = [v48 predicateWithFormat:@"((startDate >= %@) AND (startDate < %@))", v149, v45];

      v151 = (void *)v49;
      v16 = v145;
    }
    v42 = v164;

LABEL_24:
    long long v188 = 0u;
    long long v189 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    id v24 = v156;
    obuint64_t j = v156;
    uint64_t v173 = [obj countByEnumeratingWithState:&v186 objects:v196 count:16];
    if (!v173) {
      goto LABEL_18;
    }
    uint64_t v172 = *(void *)v187;
    do
    {
      for (uint64_t i = 0; i != v173; ++i)
      {
        if (*(void *)v187 != v172) {
          objc_enumerationMutation(obj);
        }
        v51 = *(void **)(*((void *)&v186 + 1) + 8 * i);
        v52 = (void *)MEMORY[0x1A6243860]();
        v53 = [v51 domainIdentifier];
        v54 = [v53 componentsSeparatedByString:@";"];
        v55 = [v54 lastObject];

        if (v53) {
          BOOL v56 = v55 == 0;
        }
        else {
          BOOL v56 = 1;
        }
        if (v56) {
          goto LABEL_74;
        }
        v57 = [v51 recipients];
        if ([v57 count] != 1 || !objc_msgSend(v51, "direction")) {
          goto LABEL_45;
        }
        v58 = [v51 recipients];
        v59 = [v58 firstObject];
        v60 = [v59 personId];

        if (v60)
        {
          v61 = [v51 recipients];
          v62 = [v61 firstObject];
          v57 = [v62 identifier];

          v63 = [v51 recipients];
          v64 = [v63 firstObject];
          v65 = [v64 personId];

          v66 = [v159 objectForKeyedSubscript:v57];

          if (v66)
          {
            uint64_t v67 = [v159 objectForKeyedSubscript:v57];

            v65 = (void *)v67;
          }
          else
          {
            [v159 setObject:v65 forKeyedSubscript:v57];
          }
          v68 = [v160 objectForKeyedSubscript:v65];

          if (v68)
          {
            v69 = [v160 objectForKeyedSubscript:v65];

            v70 = [v69 componentsSeparatedByString:@";"];
            uint64_t v71 = [v70 lastObject];

            v55 = (void *)v71;
            v53 = v69;
          }
          else
          {
            [v160 setObject:v53 forKeyedSubscript:v65];
          }
          if ([v158 containsObject:v57]) {
            [v161 addObject:v53];
          }

LABEL_45:
        }
        if ([v51 direction] == 1 || objc_msgSend(v51, "direction") == 3)
        {
          v171 = [v51 recipients];
          if ([v171 count] == 1)
          {
            v72 = [v51 recipients];
            v73 = [v72 firstObject];
            v168 = [v73 personId];
            v165 = v73;
            v166 = v72;
            if (!v168)
            {

              v168 = 0;
              id v31 = v170;
              v81 = v171;
              goto LABEL_73;
            }
            int v74 = 1;
          }
          else
          {
            int v74 = 0;
          }
          int v75 = 1;
        }
        else
        {
          int v74 = 0;
          int v75 = 0;
        }
        v76 = [v51 sender];
        v77 = [v76 personId];
        if (v77) {
          BOOL v78 = 0;
        }
        else {
          BOOL v78 = [v51 direction] == 0;
        }

        if (v74)
        {

          id v31 = v170;
          if (v75) {
            goto LABEL_62;
          }
          goto LABEL_59;
        }
        id v31 = v170;
        if (v75)
        {
LABEL_62:

          if (v78) {
            goto LABEL_74;
          }
LABEL_63:
          v79 = [v167 objectForKey:v55];

          if (!v79) {
            [v167 setObject:v53 forKey:v55];
          }
          v80 = [v51 startDate];
          v81 = +[_PSMessagesPinningUtilities startOfDayForDate:v80];

          v82 = [v164 objectForKey:v55];

          if (v82)
          {
            v83 = [v164 objectForKey:v55];
            int v84 = [v83 intValue];

            v85 = [NSNumber numberWithInt:(v84 + 1)];
            [v164 setObject:v85 forKey:v55];
          }
          else
          {
            [v164 setObject:&unk_1EF675180 forKey:v55];
          }
          v86 = [v31 objectForKey:v55];

          if (v86)
          {
            v87 = [v31 objectForKey:v55];
            [v87 addObject:v81];
          }
          else
          {
            v87 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v81, 0);
            [v31 setObject:v87 forKey:v55];
          }

          [v162 addObject:v81];
LABEL_73:

          goto LABEL_74;
        }
LABEL_59:
        if (!v78) {
          goto LABEL_63;
        }
LABEL_74:
      }
      uint64_t v173 = [obj countByEnumeratingWithState:&v186 objects:v196 count:16];
    }
    while (v173);
    v16 = v145;
    id v24 = v156;
    v42 = v164;
    id v32 = v159;
    v43 = v160;
LABEL_77:

    if (!v155)
    {
      a6 = v150;
      if ([v24 count] < v150)
      {
        v88 = [v42 allKeys];
        long long v182 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v182 objects:v195 count:16];
        if (v89)
        {
          uint64_t v90 = v89;
          uint64_t v91 = *(void *)v183;
          do
          {
            for (uint64_t j = 0; j != v90; ++j)
            {
              if (*(void *)v183 != v91) {
                objc_enumerationMutation(v88);
              }
              uint64_t v93 = *(void *)(*((void *)&v182 + 1) + 8 * j);
              v94 = [v164 objectForKey:v93];
              v95 = [v31 objectForKey:v93];
              uint64_t v96 = [v95 count];

              LODWORD(v95) = [v94 intValue];
              if ([(_PSMessagesPinningSuggester *)v163 minimalInteractions] > (int)v95
                || v96 < [(_PSMessagesPinningSuggester *)v163 minimalUniqueDaysInteracted])
              {
                [v164 removeObjectForKey:v93];
                [v31 removeObjectForKey:v93];
              }
            }
            uint64_t v90 = [v88 countByEnumeratingWithState:&v182 objects:v195 count:16];
          }
          while (v90);
        }
        v97 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
        uint64_t v98 = [v162 count];
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v99 = v164;
        uint64_t v100 = [v99 countByEnumeratingWithState:&v178 objects:v194 count:16];
        if (v100)
        {
          uint64_t v101 = v100;
          uint64_t v102 = *(void *)v179;
          double v103 = (double)v98;
          do
          {
            for (uint64_t k = 0; k != v101; ++k)
            {
              if (*(void *)v179 != v102) {
                objc_enumerationMutation(v99);
              }
              uint64_t v105 = *(void *)(*((void *)&v178 + 1) + 8 * k);
              v106 = [v170 objectForKey:v105];
              double v107 = (double)(unint64_t)[v106 count] / v103;

              v108 = [v99 objectForKey:v105];
              double v109 = (double)(int)[v108 intValue] / v103;

              v110 = [v167 objectForKey:v105];
              char v111 = [v161 containsObject:v110];
              if ([(_PSMessagesPinningSuggester *)v163 boostIndividualFavorites]
                && (v111 & 1) != 0
                || ([(_PSMessagesPinningSuggester *)v163 regularityThreshold], v107 >= v117)
                && ([(_PSMessagesPinningSuggester *)v163 intensityThreshold], v109 >= v118))
              {
                [(_PSMessagesPinningSuggester *)v163 regularityWeight];
                double v113 = v112;
                [(_PSMessagesPinningSuggester *)v163 intensityWeight];
                v193[0] = v105;
                v115 = [NSNumber numberWithDouble:v109 * v114 + v107 * v113];
                v193[1] = v115;
                v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];

                if ([v97 count]) {
                  objc_msgSend(v97, "insertObject:atIndex:", v116, objc_msgSend(v97, "indexOfObject:inSortedRange:options:usingComparator:", v116, 0, objc_msgSend(v97, "count"), 1024, &__block_literal_global_211));
                }
                else {
                  [v97 addObject:v116];
                }
              }
            }
            uint64_t v101 = [v99 countByEnumeratingWithState:&v178 objects:v194 count:16];
          }
          while (v101);
        }

        v119 = [MEMORY[0x1E4F1CA70] orderedSet];
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        id v120 = v97;
        uint64_t v121 = [v120 countByEnumeratingWithState:&v174 objects:v192 count:16];
        if (v121)
        {
          uint64_t v122 = v121;
          int v123 = 0;
          uint64_t v124 = *(void *)v175;
          do
          {
            for (uint64_t m = 0; m != v122; ++m)
            {
              if (*(void *)v175 != v124) {
                objc_enumerationMutation(v120);
              }
              v126 = [*(id *)(*((void *)&v174 + 1) + 8 * m) firstObject];
              v127 = [v167 objectForKey:v126];
              [v119 addObject:v127];
              if ([v126 containsString:@"chat"]) {
                v123 |= [v119 count] <= (unint64_t)a3;
              }
            }
            uint64_t v122 = [v120 countByEnumeratingWithState:&v174 objects:v192 count:16];
          }
          while (v122);
        }
        else
        {
          int v123 = 0;
        }

        if ([(_PSMessagesPinningSuggester *)v163 boostIndividualFavorites])
        {
          v128 = (void *)[v119 copy];
          uint64_t v129 = [v119 count];
          if (v129 - 1 >= 0)
          {
            uint64_t v130 = v129;
            do
            {
              v131 = [v128 objectAtIndexedSubscript:--v130];
              if ([v161 containsObject:v131])
              {
                [v119 removeObject:v131];
                [v119 insertObject:v131 atIndex:0];
              }
            }
            while (v130 > 0);
          }
        }
        v132 = [v119 array];
        unint64_t v133 = [v119 count];
        if (v133 >= a3) {
          int64_t v134 = a3;
        }
        else {
          int64_t v134 = v133;
        }
        v135 = objc_msgSend(v132, "subarrayWithRange:", 0, v134);
        v136 = (void *)[v135 mutableCopy];

        if ([(_PSMessagesPinningSuggester *)v163 boostGroups]
          && (([(_PSMessagesPinningSuggester *)v163 boostIndividualFavorites] | v123) & 1) == 0
          && (unint64_t)[v120 count] >= 4
          && (unint64_t)[v120 count] >= 4)
        {
          unint64_t v137 = 3;
          while (1)
          {
            v138 = [v120 objectAtIndexedSubscript:v137];
            v139 = [v138 firstObject];

            if ([v139 containsString:@"chat"]) {
              break;
            }

            unint64_t v140 = [v120 count];
            if (v137 <= 3 && ++v137 < v140) {
              continue;
            }
            goto LABEL_139;
          }
          v141 = [v167 objectForKey:v139];
          [v136 removeLastObject];
          [v136 addObject:v141];
        }
LABEL_139:
        uint64_t v144 = [v136 copy];

        v16 = v145;
        id v24 = v156;
        v42 = v164;
        id v31 = v170;
        id v32 = v159;
        v43 = v160;
        break;
      }
      continue;
    }
    break;
  }

  v26 = v149;
  v27 = (void *)v144;
LABEL_141:

  return v27;
}

- (BOOL)outgoingOnly
{
  return self->_outgoingOnly;
}

- (_CDInteractionStore)interactionStore
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    v5 = (void *)MEMORY[0x1E4F5B400];
    id v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    v7 = [v5 storeWithDirectory:v6 readOnly:1];
    id v8 = self->_interactionStore;
    self->_interactionStore = v7;

    interactionStore = self->_interactionStore;
  }
  v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)chatGuidsForMessagesPinningWithMaxSuggestions:(int64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  connection = self->_connection;
  if (connection)
  {
    id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_13];
    v7 = [NSNumber numberWithInteger:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke_164;
    v12[3] = &unk_1E5ADEA08;
    v12[4] = &v13;
    [v6 rankedMessagesPinsWithMaxSuggestions:v7 reply:v12];

    if ([(id)v14[5] count]) {
      id v8 = (void *)v14[5];
    }
    else {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v9 = v8;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [(_PSMessagesPinningSuggester *)self chatGuidsForPinningHeuristicApproachWithMaxSuggestions:a3 forReferenceDate:v6];
  }
  BOOL v10 = v9;

  _Block_object_dispose(&v13, 8);

  return v10;
}

- (_PSMessagesPinningSuggester)init
{
  return [(_PSMessagesPinningSuggester *)self initWithRegularityThreshold:2 intensityThreshold:2 regularityWeight:0 intensityWeight:1 minimalInteration:0.1 minimalUniqueDaysInteracted:0.0 interactionStore:0.95 lookbackWindow:0.1 outgoingOnly:5184000.0];
}

- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10
{
  return [(_PSMessagesPinningSuggester *)self initWithRegularityThreshold:a7 intensityThreshold:a8 regularityWeight:a9 intensityWeight:1 minimalInteration:a3 minimalUniqueDaysInteracted:a4 interactionStore:a5 lookbackWindow:a6 outgoingOnly:a10];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PSMessagesPinningSuggester;
  [(_PSMessagesPinningSuggester *)&v3 dealloc];
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  connection = self->_connection;
  id v7 = a3;
  if (connection)
  {
    v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_217_0];
    [v5 provideMessagesPinningFeedback:v7];

    id v6 = v5;
  }
  else
  {
    [(_PSMessagesPinningSuggester *)self submitMessagesPinningFeedback:v7];
    id v6 = v7;
  }
}

- (void)submitMessagesPinningFeedback:(id)a3
{
  id v4 = a3;
  v5 = [[_PS_TPSDiscoverabilitySignal alloc] initWithIdentifier:@"com.apple.messages.pinningUIShown"];
  [(_PS_TPSDiscoverabilitySignal *)v5 donateSignalWithCompletion:&__block_literal_global_223];
  uint64_t v6 = [v4 actionType];
  if (v6 == 1)
  {
    id v7 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v8 = "Feedback for messages pinning onboarding: Acceptance";
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    id v7 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v8 = "Feedback for messages pinning onboarding: unknown action type";
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v8 = "Feedback for messages pinning onboarding: Skip";
LABEL_9:
      _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
  }

  BOOL v10 = [(_PSMessagesPinningSuggester *)self getPayloadOfFeedback:v4];
  id v9 = v10;
  AnalyticsSendEventLazy();
}

- (id)getPayloadOfFeedback:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = +[_PSMessagesPinningUtilities actionTypeToString:](_PSMessagesPinningUtilities, "actionTypeToString:", [v3 actionType]);
  v35 = (void *)v5;
  if (v5)
  {
    [v4 setObject:v5 forKeyedSubscript:@"actionType"];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v6 forKeyedSubscript:@"actionType"];
  }
  id v7 = [v3 actualPinnings];
  uint64_t v8 = +[_PSMessagesPinningUtilities suggestionsToString:v7];

  v34 = (void *)v8;
  if (v8)
  {
    [v4 setObject:v8 forKeyedSubscript:@"actualPinnings"];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v9 forKeyedSubscript:@"actualPinnings"];
  }
  BOOL v10 = [v3 onboardingSuggestions];
  uint64_t v11 = +[_PSMessagesPinningUtilities suggestionsToString:v10];

  v33 = (void *)v11;
  if (v11)
  {
    [v4 setObject:v11 forKeyedSubscript:@"onboardingSuggestions"];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v12 forKeyedSubscript:@"onboardingSuggestions"];
  }
  uint64_t v13 = [v3 actualPinnings];
  uint64_t v14 = [v13 count];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:v14];
  [v4 setObject:v15 forKeyedSubscript:@"numOfActualPinnings"];

  v16 = [v3 onboardingSuggestions];
  uint64_t v17 = [v16 count];

  id v18 = [NSNumber numberWithUnsignedInteger:v17];
  [v4 setObject:v18 forKeyedSubscript:@"numOfSuggestions"];

  uint64_t v19 = [v3 actualPinnings];
  v20 = +[_PSMessagesPinningUtilities chatGuidsFromSuggestions:v19];

  id v21 = [v3 onboardingSuggestions];
  uint64_t v22 = +[_PSMessagesPinningUtilities chatGuidsFromSuggestions:v21];

  v23 = +[_PSMessagesPinningUtilities intersectionsOfActualPinnings:v20 fromTopN:3 suggestions:v22];
  if (v23)
  {
    [v4 setObject:v23 forKeyedSubscript:@"numOfGoodSuggestionsInTop3"];
  }
  else
  {
    id v24 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v24 forKeyedSubscript:@"numOfGoodSuggestionsInTop3"];
  }
  id v25 = +[_PSMessagesPinningUtilities intersectionsOfActualPinnings:v20 fromTopN:9 suggestions:v22];
  if (v25)
  {
    [v4 setObject:v25 forKeyedSubscript:@"numOfGoodSuggestionsInTop9"];
  }
  else
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v26 forKeyedSubscript:@"numOfGoodSuggestionsInTop9"];
  }
  v27 = [v3 eventDate];
  double v28 = +[_PSMessagesPinningUtilities dateToString:v27];

  if (v28)
  {
    [v4 setObject:v28 forKeyedSubscript:@"eventDate"];
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v29 forKeyedSubscript:@"eventDate"];
  }
  id v30 = +[_PSMessagesPinningUtilities interactionMethodToString:](_PSMessagesPinningUtilities, "interactionMethodToString:", [v3 interactionMethod]);
  if (v30)
  {
    [v4 setObject:v30 forKeyedSubscript:@"trialId"];
  }
  else
  {
    id v31 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v31 forKeyedSubscript:@"trialId"];
  }

  return v4;
}

- (void)setInteractionStore:(id)a3
{
}

- (NSDictionary)psMessagesPinningConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPsMessagesPinningConfig:(id)a3
{
}

- (double)regularityThreshold
{
  return self->_regularityThreshold;
}

- (void)setRegularityThreshold:(double)a3
{
  self->_regularityThreshold = a3;
}

- (double)intensityThreshold
{
  return self->_intensityThreshold;
}

- (void)setIntensityThreshold:(double)a3
{
  self->_intensityThreshold = a3;
}

- (double)regularityWeight
{
  return self->_regularityWeight;
}

- (void)setRegularityWeight:(double)a3
{
  self->_regularityWeight = a3;
}

- (double)intensityWeight
{
  return self->_intensityWeight;
}

- (void)setIntensityWeight:(double)a3
{
  self->_intensityWeight = a3;
}

- (int64_t)minimalInteractions
{
  return self->_minimalInteractions;
}

- (void)setMinimalInteractions:(int64_t)a3
{
  self->_minimalInteractions = a3;
}

- (int64_t)minimalUniqueDaysInteracted
{
  return self->_minimalUniqueDaysInteracted;
}

- (void)setMinimalUniqueDaysInteracted:(int64_t)a3
{
  self->_minimalUniqueDaysInteracted = a3;
}

- (double)lookbackWindow
{
  return self->_lookbackWindow;
}

- (void)setLookbackWindow:(double)a3
{
  self->_lookbackWindow = a3;
}

- (BOOL)boostGroups
{
  return self->_boostGroups;
}

- (BOOL)boostIndividualFavorites
{
  return self->_boostIndividualFavorites;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_psMessagesPinningConfig, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error while querying interation store for minimumDaysOfHistoryCheck %@", v2, v3, v4, v5, v6);
}

@end