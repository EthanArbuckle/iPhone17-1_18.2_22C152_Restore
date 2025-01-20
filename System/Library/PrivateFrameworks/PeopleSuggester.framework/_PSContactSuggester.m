@interface _PSContactSuggester
+ (id)_cascadeContentForContactPriors;
+ (id)_cascadeContentForPriorsArchive:(id)a3;
+ (id)_cascadeContentForPriorsArchive:(id)a3 cascadeContactEnumerator:(id)a4;
+ (id)_filteredContactDictionaryFromCascadeContent:(id)a3 forContactIdentifiers:(id)a4;
+ (id)contactPriorSuggestionsForText:(id)a3;
+ (id)defaultCorrelationsSessionFileForContactPriors;
+ (void)_writeArchiveToCascade:(id)a3;
- (CNContactStore)contactStore;
- (_CDInteractionStore)interactionStore;
- (_PSContactSuggester)init;
- (float)decayForReferenceDate:(id)a3 relativeTo:(id)a4 withTimeConstant:(double)a5;
- (float)sigmoid:(float)a3;
- (id)computeContactPriorsForContactIdentifiers:(id)a3;
- (id)computeContactPriorsForContactIdentifiers:(id)a3 withTimeConstant:(int64_t)a4 withInteractionMechanisms:(id)a5 asOf:(id)a6 overLookbackOf:(int64_t)a7;
- (id)contactAndGroupSuggestionsWithMaxSuggestions:(int64_t)a3 lookBackDays:(int64_t)a4 interactions:(id)a5;
- (id)contactKeysToFetch;
- (id)contactPriorsForContactIdentifiers:(id)a3;
- (id)contactSuggestionsForPeopleWidgetWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 appleUsersOnly:(BOOL)a6;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 interactionHistoryCap:(int64_t)a5;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7 interactionHistoryCap:(int64_t)a8;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7 excludeContactsByIdentifiers:(id)a8;
- (id)contactsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 referenceDate:(id)a6 appleUsersOnly:(BOOL)a7;
- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5;
- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5 includeGroupSuggestions:(BOOL)a6 excludeContactsByIdentifiers:(id)a7;
- (id)getDefaultContactPriorForContactId:(id)a3 withModelName:(id)a4 withModelVersion:(id)a5;
- (void)computeAndSaveContactPriorArchive;
- (void)dealloc;
- (void)gameCenterSuggestionConsumedWithContactHandle:(id)a3;
- (void)gameCenterSuggestionConsumedWithGroupIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)writeArchive:(id)a3;
@end

@implementation _PSContactSuggester

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4
{
  id v6 = a4;
  v7 = [(_PSContactSuggester *)self contactSuggestionsWithMaxSuggestions:a3 excludeContactsByIdentifiers:v6 lookBackDays:+[_PSPrivacyDataRetentionPeriod lookbackDurationInDays] interactions:0 modeAvocado:1];

  return v7;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7
{
  return [(_PSContactSuggester *)self contactSuggestionsWithMaxSuggestions:a3 excludeContactsByIdentifiers:a4 lookBackDays:a5 interactions:a6 modeAvocado:a7 interactionHistoryCap:3000];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->contactResolver, 0);
}

- (_PSContactSuggester)init
{
  v10.receiver = self;
  v10.super_class = (Class)_PSContactSuggester;
  v2 = [(_PSContactSuggester *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v5 = [v4 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v5;

    v7 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v3->_connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v3->_connection resume];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel_computeAndSaveContactPriorArchive name:*MEMORY[0x1E4F5B618] object:0];
  }
  return v3;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7 interactionHistoryCap:(int64_t)a8
{
  BOOL v9 = a7;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v101 = a4;
  id v13 = a6;
  if (!v13 && v9)
  {
    v14 = [(_PSContactSuggester *)self interactionStore];
    v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a5)];
    v16 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF675E58];
    LOBYTE(v92) = 1;
    id v13 = +[_PSInteractionStoreUtils interactionsFromStore:v14 referenceDate:v15 withMechanisms:0 withAccount:0 withBundleIds:0 withTargetBundleIds:0 withDirections:v16 singleRecipient:v92 fetchLimit:a8];
  }
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v104 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v99 = [MEMORY[0x1E4F1CA60] dictionary];
  v19 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v21 = +[_PSLogging generalChannel];
  v102 = v19;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [NSNumber numberWithBool:v9];
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    *(_DWORD *)buf = 138412546;
    v128 = v22;
    __int16 v129 = 2112;
    v130 = v23;
    _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_DEFAULT, "_PSContactSuggester modeAvocado:%@ , interactions returned:%@", buf, 0x16u);
  }
  v111 = (void *)v20;

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id obj = v13;
  uint64_t v24 = [obj countByEnumeratingWithState:&v120 objects:v126 count:16];
  v25 = v101;
  v100 = v17;
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v121;
    float v28 = (float)a5;
    uint64_t v94 = *(void *)v121;
    v107 = v18;
    do
    {
      uint64_t v29 = 0;
      uint64_t v95 = v26;
      do
      {
        if (*(void *)v121 != v27) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v120 + 1) + 8 * v29);
        v31 = (void *)MEMORY[0x1A6243860]();
        if ([v30 mechanism] != 13)
        {
          v97 = v31;
          uint64_t v98 = v29;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v108 = [v30 recipients];
          uint64_t v110 = [v108 countByEnumeratingWithState:&v116 objects:v125 count:16];
          if (v110)
          {
            v32 = v30;
            uint64_t v109 = *(void *)v117;
            v103 = v30;
            do
            {
              for (uint64_t i = 0; i != v110; ++i)
              {
                if (*(void *)v117 != v109) {
                  objc_enumerationMutation(v108);
                }
                v34 = *(void **)(*((void *)&v116 + 1) + 8 * i);
                v35 = [v32 startDate];
                v36 = [v111 startOfDayForDate:v35];
                [v19 addObject:v36];

                v37 = [v34 personId];
                v38 = [v34 identifier];
                if (v38)
                {
                  v39 = [v17 objectForKeyedSubscript:v38];
                  if (v39)
                  {
                  }
                  else if ([v34 personIdType] == 3 && v37 != 0)
                  {
                    [v17 setObject:v37 forKeyedSubscript:v38];
                  }
                  v40 = [v17 objectForKeyedSubscript:v38];
                  if (v40 && ([v25 containsObject:v40] & 1) == 0)
                  {
                    v42 = [v104 objectForKeyedSubscript:v40];
                    if (v42)
                    {
                    }
                    else
                    {
                      v43 = [v32 domainIdentifier];
                      int v44 = [v43 containsString:@"iMessage"];

                      if (v44) {
                        [v104 setObject:v38 forKeyedSubscript:v40];
                      }
                    }
                    v45 = [v18 objectForKeyedSubscript:v40];

                    if (!v45)
                    {
                      v46 = objc_alloc_init(_PSContactSuggestion);
                      [v18 setObject:v46 forKeyedSubscript:v40];
                    }
                    uint64_t v47 = [v32 bundleId];
                    v48 = objc_alloc_init(_PSContactSuggestionHandleAndApp);
                    [(_PSContactSuggestionHandleAndApp *)v48 setHandle:v38];
                    v106 = (void *)v47;
                    [(_PSContactSuggestionHandleAndApp *)v48 setAppBundleId:v47];
                    v49 = v18;
                    v50 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "mechanism"));
                    [(_PSContactSuggestionHandleAndApp *)v48 setInteractionMechanism:v50];

                    v51 = [v18 objectForKeyedSubscript:v40];
                    v52 = [v51 handleAndAppFrequencies];
                    v53 = (void *)[v52 mutableCopy];

                    if (!v53)
                    {
                      v53 = [MEMORY[0x1E4F1CA60] dictionary];
                    }
                    v54 = NSNumber;
                    v55 = [v53 objectForKeyedSubscript:v48];
                    v56 = objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "integerValue") + 1);
                    [v53 setObject:v56 forKeyedSubscript:v48];

                    v57 = [v49 objectForKeyedSubscript:v40];
                    v105 = v53;
                    [v57 setHandleAndAppFrequencies:v53];

                    v58 = [v99 objectForKeyedSubscript:v48];

                    if (!v58)
                    {
                      v59 = [MEMORY[0x1E4F1CA80] set];
                      [v99 setObject:v59 forKeyedSubscript:v48];
                    }
                    v60 = [v99 objectForKeyedSubscript:v48];
                    v61 = [v103 startDate];
                    v62 = [v111 startOfDayForDate:v61];
                    [v60 addObject:v62];

                    v63 = [MEMORY[0x1E4F1CA60] dictionary];
                    v64 = NSNumber;
                    v65 = [v99 objectForKeyedSubscript:v48];
                    *(float *)&double v66 = (float)(unint64_t)[v65 count] / v28;
                    v67 = [v64 numberWithFloat:v66];
                    [v63 setObject:v67 forKeyedSubscript:v48];

                    v68 = [v107 objectForKeyedSubscript:v40];
                    [v68 setHandleAndAppRegularityScores:v63];

                    v69 = [v107 objectForKeyedSubscript:v40];
                    v70 = [v69 daysInteracted];
                    v71 = (void *)[v70 mutableCopy];

                    if (!v71)
                    {
                      v71 = [MEMORY[0x1E4F1CA80] set];
                    }
                    v72 = [v103 startDate];
                    v73 = [v111 startOfDayForDate:v72];
                    [v71 addObject:v73];

                    v74 = [v107 objectForKeyedSubscript:v40];
                    [v74 setDaysInteracted:v71];

                    v17 = v100;
                    v18 = v107;
                    v19 = v102;
                    v32 = v103;
                    v25 = v101;
                  }
                }
                else
                {
                  v40 = 0;
                }
              }
              uint64_t v110 = [v108 countByEnumeratingWithState:&v116 objects:v125 count:16];
            }
            while (v110);
          }

          uint64_t v27 = v94;
          uint64_t v26 = v95;
          v31 = v97;
          uint64_t v29 = v98;
        }
        ++v29;
      }
      while (v29 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v120 objects:v126 count:16];
    }
    while (v26);
  }

  v75 = v18;
  v76 = [v18 allKeys];
  v77 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v78 = v76;
  uint64_t v79 = [v78 countByEnumeratingWithState:&v112 objects:v124 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v113;
LABEL_48:
    uint64_t v82 = 0;
    while (1)
    {
      if (*(void *)v113 != v81) {
        objc_enumerationMutation(v78);
      }
      uint64_t v83 = *(void *)(*((void *)&v112 + 1) + 8 * v82);
      v84 = [v75 objectForKeyedSubscript:v83];
      [v84 setContactIdentifier:v83];
      v85 = [v104 objectForKeyedSubscript:v83];
      [v84 setSuggestedHandle:v85];

      v86 = [v84 handleAndAppFrequencies];
      v87 = [v86 allValues];
      v88 = [v87 valueForKeyPath:@"@sum.self"];
      objc_msgSend(v84, "setTotalFrequency:", objc_msgSend(v88, "integerValue"));

      v89 = [v84 daysInteracted];
      objc_msgSend(v84, "setRegularityScore:", (double)(unint64_t)objc_msgSend(v89, "count") / (double)(unint64_t)objc_msgSend(v102, "count"));

      [v77 addObject:v84];
      unint64_t v90 = [v77 count];

      if (v90 >= a3) {
        break;
      }
      if (v80 == ++v82)
      {
        uint64_t v80 = [v78 countByEnumeratingWithState:&v112 objects:v124 count:16];
        if (v80) {
          goto LABEL_48;
        }
        break;
      }
    }
  }

  return v77;
}

- (_CDInteractionStore)interactionStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F5B400];
    id v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    v7 = [v5 storeWithDirectory:v6 readOnly:1];
    v8 = self->_interactionStore;
    self->_interactionStore = v7;

    interactionStore = self->_interactionStore;
  }
  BOOL v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  if (connection)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3];
    BOOL v9 = [NSNumber numberWithInteger:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_136;
    v12[3] = &unk_1E5ADEA08;
    v12[4] = &v13;
    [v8 contactSuggestionsWithMaxSuggestions:v9 excludedContactIds:v6 reply:v12];

    id v10 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PSContactSuggester;
  [(_PSContactSuggester *)&v3 dealloc];
}

- (CNContactStore)contactStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    uint64_t v5 = (CNContactStore *)objc_alloc_init((Class)getCNContactStoreClass());
    id v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  v7 = contactStore;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 interactionHistoryCap:(int64_t)a5
{
  id v8 = a4;
  BOOL v9 = [(_PSContactSuggester *)self contactSuggestionsWithMaxSuggestions:a3 excludeContactsByIdentifiers:v8 lookBackDays:+[_PSPrivacyDataRetentionPeriod lookbackDurationInDays] interactions:0 modeAvocado:1 interactionHistoryCap:a5];

  return v9;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5
{
  BOOL v54 = a5;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v56 = a4;
  id v5 = objc_alloc_init((Class)getCNContactStoreClass());
  id v6 = getCNContactIdentifierKey();
  v77[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  id v71 = 0;
  id v8 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v71];
  id v9 = v71;

  id v50 = v9;
  if (v9)
  {
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
    }
  }
  else if (v8)
  {
    char v12 = 1;
    goto LABEL_10;
  }
  v11 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
  }

  char v12 = 0;
  id v8 = 0;
LABEL_10:
  uint64_t v13 = [_PSContactResolver alloc];
  v14 = getCNContactIdentifierKey();
  v76[0] = v14;
  uint64_t v15 = getCNContactGivenNameKey();
  v76[1] = v15;
  v16 = getCNContactFamilyNameKey();
  v76[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
  v52 = v5;
  id v18 = [(_PSContactResolver *)v13 initWithContactStore:v5 keysToFetch:v17];

  v19 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v21 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  unint64_t v22 = a3;
  v58 = v19;
  if ([v19 count] < (unint64_t)a3)
  {
    double v23 = (double)(-86400 * v21);
    char v60 = v12 ^ 1;
    while (1)
    {
      uint64_t v24 = -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:", v22, v56, v20, v54, 0, v50);
      if (![v24 count]) {
        break;
      }
      v57 = (void *)v20;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id obj = v24;
      uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (v62)
      {
        uint64_t v61 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v62; ++i)
          {
            if (*(void *)v68 != v61) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            uint64_t v27 = [v26 contactIdentifier];
            float v28 = [(_PSContactResolver *)v18 contactWithIdentifier:v27];

            if (!v28)
            {
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              uint64_t v29 = [v26 handleAndAppFrequencies];
              uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v74 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                v32 = v8;
                uint64_t v33 = *(void *)v64;
LABEL_21:
                uint64_t v34 = 0;
                while (1)
                {
                  if (*(void *)v64 != v33) {
                    objc_enumerationMutation(v29);
                  }
                  v35 = [*(id *)(*((void *)&v63 + 1) + 8 * v34) handle];
                  float v28 = [(_PSContactResolver *)v18 resolveContactIfPossibleFromContactIdentifierString:v35 pickFirstOfMultiple:1];

                  if (v28) {
                    break;
                  }
                  if (v31 == ++v34)
                  {
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v63 objects:v74 count:16];
                    if (v31) {
                      goto LABEL_21;
                    }
                    float v28 = 0;
                    break;
                  }
                }
                id v8 = v32;
                v19 = v58;
              }
              else
              {
                float v28 = 0;
              }
            }
            if (v28) {
              char v36 = v60;
            }
            else {
              char v36 = 1;
            }
            if ((v36 & 1) != 0
              || ([v8 identifier],
                  v37 = objc_claimAutoreleasedReturnValue(),
                  [v28 identifier],
                  v38 = objc_claimAutoreleasedReturnValue(),
                  char v39 = [v37 isEqualToString:v38] ^ 1,
                  v38,
                  v37,
                  (v39 & 1) == 0))
            {
              if (v28)
              {
                v40 = [v28 givenName];
                [v26 setGivenName:v40];

                v41 = [v28 familyName];
                [v26 setFamilyName:v41];

                [v19 addObject:v26];
              }
            }
          }
          uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
        }
        while (v62);
      }

      v42 = [v57 dateByAddingTimeInterval:v23];

      uint64_t v20 = (uint64_t)v42;
      unint64_t v22 = a3;
      if ([v19 count] >= (unint64_t)a3) {
        goto LABEL_44;
      }
    }
  }
  v42 = (void *)v20;
LABEL_44:
  v43 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    int v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v58, "count"));
    *(_DWORD *)buf = 138412290;
    v73 = v44;
    _os_log_impl(&dword_1A314B000, v43, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts", buf, 0xCu);
  }
  v45 = [v58 array];
  unint64_t v46 = [v58 count];
  if (v46 >= v22) {
    unint64_t v47 = v22;
  }
  else {
    unint64_t v47 = v46;
  }
  v48 = objc_msgSend(v45, "subarrayWithRange:", 0, v47);

  return v48;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 appleUsersOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  char v12 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v14 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  if ([v12 count] < (unint64_t)a3)
  {
    double v15 = (double)(-86400 * v14);
    while (1)
    {
      v16 = [(_PSContactSuggester *)self contactsWithMaxSuggestions:a3 contactKeysTofetch:v10 interactionDomains:v11 referenceDate:v13 appleUsersOnly:v6];
      if (![v16 count]) {
        break;
      }
      [v12 addObjectsFromArray:v16];
      v17 = [v13 dateByAddingTimeInterval:v15];

      uint64_t v13 = v17;
      if ([v12 count] >= (unint64_t)a3) {
        goto LABEL_8;
      }
    }
  }
  v17 = v13;
LABEL_8:
  id v18 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    int v25 = 138412290;
    uint64_t v26 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts", (uint8_t *)&v25, 0xCu);
  }
  uint64_t v20 = [v12 array];
  unint64_t v21 = [v12 count];
  if (v21 >= a3) {
    int64_t v22 = a3;
  }
  else {
    int64_t v22 = v21;
  }
  double v23 = objc_msgSend(v20, "subarrayWithRange:", 0, v22);

  return v23;
}

- (id)contactsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 referenceDate:(id)a6 appleUsersOnly:(BOOL)a7
{
  BOOL v7 = a7;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  uint64_t v13 = [(_PSContactSuggester *)self contactSuggestionsWithMaxSuggestions:a3 interactionDomains:a5 referenceDate:a6 appleUsersOnly:v7 includeGroups:0];
  id v14 = objc_alloc_init((Class)getCNContactStoreClass());
  double v15 = getCNContactIdentifierKey();
  v63[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  id v60 = 0;
  v17 = [v14 _crossPlatformUnifiedMeContactWithKeysToFetch:v16 error:&v60];
  id v18 = v60;

  v45 = v18;
  if (v18)
  {
    v19 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
    }
  }
  else if (v17)
  {
    char v21 = 1;
    int64_t v22 = v17;
    goto LABEL_10;
  }
  uint64_t v20 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
  }

  char v21 = 0;
  int64_t v22 = 0;
LABEL_10:
  unint64_t v46 = v14;
  unint64_t v47 = v12;
  double v23 = [[_PSContactResolver alloc] initWithContactStore:v14 keysToFetch:v12];
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v25 = v13;
  uint64_t v51 = [v25 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v51)
  {
    uint64_t v26 = *(void *)v57;
    char v50 = v21 ^ 1;
    uint64_t v48 = *(void *)v57;
    v49 = v24;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(v25);
        }
        float v28 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v29 = [v28 contactIdentifier];
        uint64_t v30 = [(_PSContactResolver *)v23 contactWithIdentifier:v29];

        if (!v30)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v31 = [v28 handleAndAppFrequencies];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            id v34 = v25;
            v35 = v22;
            uint64_t v36 = *(void *)v53;
LABEL_18:
            uint64_t v37 = 0;
            while (1)
            {
              if (*(void *)v53 != v36) {
                objc_enumerationMutation(v31);
              }
              v38 = [*(id *)(*((void *)&v52 + 1) + 8 * v37) handle];
              uint64_t v30 = [(_PSContactResolver *)v23 resolveContactIfPossibleFromContactIdentifierString:v38 pickFirstOfMultiple:1];

              if (v30) {
                break;
              }
              if (v33 == ++v37)
              {
                uint64_t v33 = [v31 countByEnumeratingWithState:&v52 objects:v61 count:16];
                if (v33) {
                  goto LABEL_18;
                }
                uint64_t v30 = 0;
                break;
              }
            }
            int64_t v22 = v35;
            id v25 = v34;
            uint64_t v26 = v48;
            uint64_t v24 = v49;
          }
          else
          {
            uint64_t v30 = 0;
          }
        }
        if (v30) {
          char v39 = v50;
        }
        else {
          char v39 = 1;
        }
        if ((v39 & 1) != 0
          || ([v22 identifier],
              v40 = objc_claimAutoreleasedReturnValue(),
              [v30 identifier],
              v41 = objc_claimAutoreleasedReturnValue(),
              char v42 = [v40 isEqualToString:v41],
              v41,
              v40,
              (v42 & 1) == 0))
        {
          if (v30) {
            [v24 addObject:v30];
          }
        }
      }
      uint64_t v51 = [v25 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v51);
  }

  v43 = (void *)[v24 copy];

  return v43;
}

- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5 includeGroupSuggestions:(BOOL)a6 excludeContactsByIdentifiers:(id)a7
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v102 = a4;
  id v114 = a7;
  id v100 = objc_alloc_init((Class)getCNContactStoreClass());
  id v8 = getCNContactIdentifierKey();
  v164 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
  id v152 = 0;
  id v108 = [v100 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v152];
  id v99 = v152;

  if (v99)
  {
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
    }

    goto LABEL_5;
  }
  if (!v108)
  {
LABEL_5:
    id v11 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:]();
    }

    char v12 = 0;
    id v108 = 0;
    goto LABEL_10;
  }
  char v12 = 1;
LABEL_10:
  uint64_t v13 = [_PSContactResolver alloc];
  id v14 = getCNContactIdentifierKey();
  v163[0] = v14;
  double v15 = getCNContactGivenNameKey();
  v163[1] = v15;
  v16 = getCNContactFamilyNameKey();
  v163[2] = v16;
  v17 = getCNContactPhoneNumbersKey();
  v163[3] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:4];
  long long v121 = [(_PSContactResolver *)v13 initWithContactStore:v100 keysToFetch:v18];

  v107 = [MEMORY[0x1E4F1CA70] orderedSet];
  v111 = [MEMORY[0x1E4F1CA70] orderedSet];
  v104 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v19 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  uint64_t v146 = 0;
  v147 = &v146;
  uint64_t v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__0;
  v150 = __Block_byref_object_dispose__0;
  id v151 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v20 = BiomeLibrary();
  char v21 = [v20 GameCenter];
  uint64_t v98 = [v21 SuggestionFeedback];

  v97 = [v98 publisherWithUseCase:@"GameCenterSuggestionFeedback"];
  v145[0] = MEMORY[0x1E4F143A8];
  v145[1] = 3221225472;
  v145[2] = __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_166;
  v145[3] = &unk_1E5ADEA50;
  v145[4] = &v146;
  id v22 = (id)[v97 sinkWithCompletion:&__block_literal_global_165 receiveInput:v145];
  double v23 = (double)(-86400 * v19);
  char v110 = v12 ^ 1;
  while ([v111 count] < (unint64_t)a3)
  {
    uint64_t v24 = -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:");
    if (![v24 count])
    {

      break;
    }
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id obj = v24;
    uint64_t v113 = [obj countByEnumeratingWithState:&v141 objects:v162 count:16];
    if (!v113) {
      goto LABEL_66;
    }
    uint64_t v112 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v113; ++i)
      {
        if (*(void *)v142 != v112) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        id v119 = [v25 contactIdentifier];
        long long v116 = v25;
        long long v115 = [v25 groupIdentifier];
        if (v119)
        {
          uint64_t v26 = [v25 suggestedHandle];
          uint64_t v27 = [(_PSContactResolver *)v121 contactWithIdentifier:v119];
          if (!v27)
          {
            long long v139 = 0u;
            long long v140 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            float v28 = [v25 handleAndAppFrequencies];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v137 objects:v161 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v138;
LABEL_22:
              uint64_t v31 = 0;
              while (1)
              {
                if (*(void *)v138 != v30) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v32 = [*(id *)(*((void *)&v137 + 1) + 8 * v31) handle];
                uint64_t v27 = [(_PSContactResolver *)v121 resolveContactIfPossibleFromContactIdentifierString:v32 pickFirstOfMultiple:1];

                if (v27) {
                  break;
                }
                if (v29 == ++v31)
                {
                  uint64_t v29 = [v28 countByEnumeratingWithState:&v137 objects:v161 count:16];
                  if (v29) {
                    goto LABEL_22;
                  }
                  goto LABEL_28;
                }
              }
            }
            else
            {
LABEL_28:
              uint64_t v27 = 0;
            }
          }
          if (v27) {
            char v33 = v110;
          }
          else {
            char v33 = 1;
          }
          if (v33)
          {
            if (!v27)
            {
LABEL_63:

              goto LABEL_64;
            }
          }
          else
          {
            id v34 = [v108 identifier];
            v35 = [(_PSSuggestion *)v27 identifier];
            char v36 = [v34 isEqualToString:v35];

            if (v36) {
              goto LABEL_63;
            }
          }
          long long v57 = [_PSRecipient alloc];
          long long v58 = [(_PSSuggestion *)v27 identifier];
          long long v59 = [(_PSRecipient *)v57 initWithIdentifier:v58 handle:v26 contact:0];

          id v60 = [(_PSSuggestion *)v27 givenName];
          [(_PSRecipient *)v59 setGivenName:v60];

          uint64_t v61 = [(_PSSuggestion *)v27 familyName];
          [(_PSRecipient *)v59 setFamilyName:v61];

          uint64_t v62 = [_PSSuggestion alloc];
          v160 = v59;
          long long v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v160 count:1];
          long long v64 = [(_PSSuggestion *)v62 initWithBundleID:0 conversationIdentifier:0 groupName:0 recipients:v63];

          long long v65 = v111;
          if (v26)
          {
            if ([(id)v147[5] containsObject:v26]) {
              long long v65 = v107;
            }
            else {
              long long v65 = v111;
            }
          }
          [v65 addObject:v64];

          goto LABEL_63;
        }
        if (v115)
        {
          uint64_t v37 = [v25 groupRecipients];
          BOOL v38 = [v37 count] == 0;

          if (!v38)
          {
            char v39 = (void *)MEMORY[0x1E4F1CA48];
            v40 = [v116 groupRecipients];
            uint64_t v26 = objc_msgSend(v39, "arrayWithCapacity:", objc_msgSend(v40, "count"));

            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            v41 = [v116 groupRecipients];
            uint64_t v42 = [v41 countByEnumeratingWithState:&v133 objects:v159 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v134;
              do
              {
                for (uint64_t j = 0; j != v42; ++j)
                {
                  if (*(void *)v134 != v43) {
                    objc_enumerationMutation(v41);
                  }
                  v45 = *(void **)(*((void *)&v133 + 1) + 8 * j);
                  unint64_t v46 = [_PSRecipient alloc];
                  unint64_t v47 = [v45 personId];
                  uint64_t v48 = [v45 identifier];
                  v49 = [v45 displayName];
                  char v50 = [(_PSRecipient *)v46 initWithIdentifier:v47 handle:v48 displayName:v49 contact:0];

                  [v26 addObject:v50];
                }
                uint64_t v42 = [v41 countByEnumeratingWithState:&v133 objects:v159 count:16];
              }
              while (v42);
            }

            uint64_t v51 = [_PSSuggestion alloc];
            long long v52 = [v116 groupName];
            uint64_t v27 = [(_PSSuggestion *)v51 initWithBundleID:0 conversationIdentifier:v115 groupName:v52 recipients:v26];

            long long v53 = [v116 imageURL];
            if (v53)
            {
              uint64_t v153 = 0;
              v154 = &v153;
              uint64_t v155 = 0x2050000000;
              long long v54 = (void *)getINImageClass_softClass;
              uint64_t v156 = getINImageClass_softClass;
              if (!getINImageClass_softClass)
              {
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                v166 = __getINImageClass_block_invoke;
                v167 = &unk_1E5ADE858;
                v168 = &v153;
                __getINImageClass_block_invoke((uint64_t)&buf);
                long long v54 = (void *)v154[3];
              }
              id v55 = v54;
              _Block_object_dispose(&v153, 8);
              v106 = [v116 imageURL];
              v105 = [v55 imageWithURL:v106];
              long long v56 = v105;
            }
            else
            {
              long long v56 = 0;
            }
            [(_PSSuggestion *)v27 setImage:v56];
            if (v53)
            {
            }
            long long v66 = [v116 messagesGroupIdentifier];
            [(_PSSuggestion *)v27 setMessagesGroupIdentifier:v66];

            int v67 = [(id)v147[5] containsObject:v115];
            long long v68 = v111;
            if (v67)
            {
              long long v69 = +[_PSLogging generalChannel];
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v115;
                _os_log_impl(&dword_1A314B000, v69, OS_LOG_TYPE_INFO, "Boosting Game Center suggestion with groupIdentifier: %@ due to previous feedback", (uint8_t *)&buf, 0xCu);
              }

              long long v68 = v107;
            }
            [v68 addObject:v27];
            goto LABEL_63;
          }
        }
LABEL_64:
      }
      uint64_t v113 = [obj countByEnumeratingWithState:&v141 objects:v162 count:16];
    }
    while (v113);
LABEL_66:

    uint64_t v70 = [v104 dateByAddingTimeInterval:v23];

    v104 = (void *)v70;
  }
  id v71 = [v111 array];
  [v107 addObjectsFromArray:v71];

  v72 = objc_opt_new();
  v73 = objc_opt_new();
  v74 = [v107 reverseObjectEnumerator];
  v75 = [v74 allObjects];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_171;
  v130[3] = &unk_1E5ADEA78;
  id v76 = v72;
  id v131 = v76;
  id v77 = v73;
  id v132 = v77;
  id v78 = objc_msgSend(v75, "_pas_filteredArrayWithTest:", v130);

  long long v118 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v120 = v78;
  uint64_t v79 = [v120 countByEnumeratingWithState:&v126 objects:v158 count:16];
  if (v79)
  {
    uint64_t v80 = *(void *)v127;
    do
    {
      for (uint64_t k = 0; k != v79; ++k)
      {
        if (*(void *)v127 != v80) {
          objc_enumerationMutation(v120);
        }
        uint64_t v82 = *(void **)(*((void *)&v126 + 1) + 8 * k);
        uint64_t v83 = [v82 recipients];
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id v84 = v83;
        uint64_t v85 = [v84 countByEnumeratingWithState:&v122 objects:v157 count:16];
        if (v85)
        {
          uint64_t v86 = *(void *)v123;
          while (2)
          {
            for (uint64_t m = 0; m != v85; ++m)
            {
              if (*(void *)v123 != v86) {
                objc_enumerationMutation(v84);
              }
              v88 = [*(id *)(*((void *)&v122 + 1) + 8 * m) identifier];
              char v89 = [v114 containsObject:v88];

              if (v89)
              {

                goto LABEL_83;
              }
            }
            uint64_t v85 = [v84 countByEnumeratingWithState:&v122 objects:v157 count:16];
            if (v85) {
              continue;
            }
            break;
          }
        }

        [v118 addObject:v82];
LABEL_83:
      }
      uint64_t v79 = [v120 countByEnumeratingWithState:&v126 objects:v158 count:16];
    }
    while (v79);
  }

  unint64_t v90 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
  {
    v91 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v118, "count"));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v91;
    _os_log_impl(&dword_1A314B000, v90, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts/groups", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v92 = [v118 array];
  unint64_t v93 = [v118 count];
  if (v93 >= a3) {
    int64_t v94 = a3;
  }
  else {
    int64_t v94 = v93;
  }
  uint64_t v95 = objc_msgSend(v92, "subarrayWithRange:", 0, v94);

  _Block_object_dispose(&v146, 8);

  return v95;
}

- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5
{
  return [(_PSContactSuggester *)self gameCenterSuggestionsWithMaxSuggestions:a3 interactionDomains:a4 appleUsersOnly:a5 includeGroupSuggestions:1 excludeContactsByIdentifiers:0];
}

- (void)gameCenterSuggestionConsumedWithContactHandle:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)getBMGameCenterSuggestionFeedbackClass()) initWithIdentifier:v3];
    id v5 = BiomeLibrary();
    BOOL v6 = [v5 GameCenter];
    BOOL v7 = [v6 SuggestionFeedback];

    id v8 = [v7 source];
    [v8 sendEvent:v4];
  }
  else
  {
    id v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester gameCenterSuggestionConsumedWithContactHandle:]();
    }
  }
}

- (void)gameCenterSuggestionConsumedWithGroupIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)getBMGameCenterSuggestionFeedbackClass()) initWithIdentifier:v3];
    id v5 = BiomeLibrary();
    BOOL v6 = [v5 GameCenter];
    BOOL v7 = [v6 SuggestionFeedback];

    id v8 = [v7 source];
    [v8 sendEvent:v4];
  }
  else
  {
    id v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester gameCenterSuggestionConsumedWithGroupIdentifier:]();
    }
  }
}

- (id)contactAndGroupSuggestionsWithMaxSuggestions:(int64_t)a3 lookBackDays:(int64_t)a4 interactions:(id)a5
{
  unint64_t v105 = a3;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v108 = [MEMORY[0x1E4F1CA60] dictionary];
  v107 = [MEMORY[0x1E4F1CA60] dictionary];
  v106 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v117 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v118 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v11 = v6;
  long long v115 = v9;
  long long v116 = v7;
  uint64_t v109 = v11;
  long long v123 = v10;
  uint64_t v112 = [v11 countByEnumeratingWithState:&v136 objects:v142 count:16];
  if (v112)
  {
    uint64_t v111 = *(void *)v137;
    float v12 = (float)a4;
    unint64_t v13 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v112; ++i)
      {
        if (*(void *)v137 != v111) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1A6243860]();
        if ([v15 mechanism] != 13)
        {
          char v110 = v16;
          v17 = [v15 bundleId];
          id v18 = +[_PSConstants mobileMessagesBundleId];
          long long v124 = v15;
          uint64_t v113 = i;
          if ([v17 isEqualToString:v18])
          {
            int64_t v19 = [v15 recipients];
            uint64_t v20 = [v19 count];

            uint64_t i = v113;
            BOOL v21 = v20 == 1;
            double v15 = v124;
            if (!v21)
            {
              id v22 = [v124 startDate];
              double v23 = [v10 startOfDayForDate:v22];
              [v118 addObject:v23];

              uint64_t v24 = [v124 domainIdentifier];
              id v25 = [v124 bundleId];
              uint64_t v26 = +[_PSConstants mobileMessagesBundleId];
              int v27 = [v25 isEqualToString:v26];

              if (v27)
              {
                uint64_t v28 = [v124 account];
              }
              else
              {
                uint64_t v28 = 0;
              }
              uint64_t v29 = (void *)v24;
              uint64_t v70 = objc_msgSend(v108, "objectForKeyedSubscript:", v24, v105);

              if (!v70)
              {
                id v71 = [v124 recipients];
                [v108 setObject:v71 forKeyedSubscript:v24];

                v72 = [v124 groupName];
                [v107 setObject:v72 forKeyedSubscript:v24];

                v73 = [v124 contentURL];
                [v106 setObject:v73 forKeyedSubscript:v24];
              }
              v74 = [v8 objectForKeyedSubscript:v24];

              id v11 = v109;
              long long v127 = (void *)v28;
              if (v74)
              {
                v75 = [v8 objectForKeyedSubscript:v29];
                uint64_t v76 = [(_PSContactSuggestion *)v75 totalFrequency] + 1;
                id v77 = v75;
              }
              else
              {
                v75 = objc_alloc_init(_PSContactSuggestion);
                [(_PSContactSuggestion *)v75 setGroupIdentifier:v29];
                [(_PSContactSuggestion *)v75 setMessagesGroupIdentifier:v28];
                id v78 = [v107 objectForKeyedSubscript:v29];
                [(_PSContactSuggestion *)v75 setGroupName:v78];

                uint64_t v79 = [v108 objectForKeyedSubscript:v29];
                [(_PSContactSuggestion *)v75 setGroupRecipients:v79];

                uint64_t v80 = [v106 objectForKeyedSubscript:v29];
                [(_PSContactSuggestion *)v75 setImageURL:v80];

                id v77 = v75;
                uint64_t v76 = 1;
              }
              [(_PSContactSuggestion *)v77 setTotalFrequency:v76];
              [v8 setObject:v75 forKeyedSubscript:v29];

              uint64_t v81 = [v8 objectForKeyedSubscript:v29];
              uint64_t v82 = [v81 daysInteracted];
              uint64_t v83 = (void *)[v82 mutableCopy];

              if (!v83)
              {
                uint64_t v83 = [MEMORY[0x1E4F1CA80] set];
              }
              id v84 = [v124 startDate];
              uint64_t v85 = [v10 startOfDayForDate:v84];
              [v83 addObject:v85];

              uint64_t v86 = [v8 objectForKeyedSubscript:v29];
              [v86 setDaysInteracted:v83];

              goto LABEL_48;
            }
          }
          else
          {
          }
          long long v134 = 0u;
          long long v135 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          uint64_t v29 = objc_msgSend(v15, "recipients", v105);
          uint64_t v120 = [v29 countByEnumeratingWithState:&v132 objects:v141 count:16];
          if (v120)
          {
            uint64_t v119 = *(void *)v133;
            id obj = v29;
            do
            {
              for (uint64_t j = 0; j != v120; ++j)
              {
                if (*(void *)v133 != v119) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v31 = *(void **)(*((void *)&v132 + 1) + 8 * j);
                uint64_t v32 = [v15 startDate];
                char v33 = [v10 startOfDayForDate:v32];
                [v118 addObject:v33];

                uint64_t v34 = [v31 personId];
                long long v126 = [v31 identifier];
                v35 = objc_msgSend(v7, "objectForKeyedSubscript:");
                if (v35 || [v31 personIdType] != 3)
                {
                }
                else if (v34)
                {
                  [v7 setObject:v34 forKeyedSubscript:v126];
                }
                long long v125 = (void *)v34;
                char v36 = [v7 objectForKeyedSubscript:v126];
                if (v36)
                {
                  uint64_t v37 = [v117 objectForKeyedSubscript:v36];
                  if (v37)
                  {
                  }
                  else
                  {
                    BOOL v38 = [v15 domainIdentifier];
                    int v39 = [v38 containsString:@"iMessage"];

                    if (v39) {
                      [v117 setObject:v126 forKeyedSubscript:v36];
                    }
                  }
                  v40 = [v8 objectForKeyedSubscript:v36];

                  if (!v40)
                  {
                    v41 = objc_alloc_init(_PSContactSuggestion);
                    [v8 setObject:v41 forKeyedSubscript:v36];
                  }
                  uint64_t v42 = [v15 bundleId];
                  uint64_t v43 = objc_alloc_init(_PSContactSuggestionHandleAndApp);
                  [(_PSContactSuggestionHandleAndApp *)v43 setHandle:v126];
                  long long v122 = (void *)v42;
                  [(_PSContactSuggestionHandleAndApp *)v43 setAppBundleId:v42];
                  int v44 = objc_msgSend(*(id *)(v13 + 3792), "numberWithInteger:", objc_msgSend(v15, "mechanism"));
                  [(_PSContactSuggestionHandleAndApp *)v43 setInteractionMechanism:v44];

                  v45 = [v8 objectForKeyedSubscript:v36];
                  unint64_t v46 = [v45 handleAndAppFrequencies];
                  unint64_t v47 = (void *)[v46 mutableCopy];

                  if (!v47)
                  {
                    unint64_t v47 = [MEMORY[0x1E4F1CA60] dictionary];
                  }
                  uint64_t v48 = *(void **)(v13 + 3792);
                  v49 = [v47 objectForKeyedSubscript:v43];
                  char v50 = objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "integerValue") + 1);
                  [v47 setObject:v50 forKeyedSubscript:v43];

                  uint64_t v51 = [v8 objectForKeyedSubscript:v36];
                  long long v121 = v47;
                  [v51 setHandleAndAppFrequencies:v47];

                  long long v52 = [v9 objectForKeyedSubscript:v43];

                  if (!v52)
                  {
                    long long v53 = [MEMORY[0x1E4F1CA80] set];
                    [v9 setObject:v53 forKeyedSubscript:v43];
                  }
                  long long v54 = [v9 objectForKeyedSubscript:v43];
                  id v55 = [v124 startDate];
                  long long v56 = [v123 startOfDayForDate:v55];
                  [v54 addObject:v56];

                  long long v57 = [MEMORY[0x1E4F1CA60] dictionary];
                  long long v58 = *(void **)(v13 + 3792);
                  long long v59 = [v9 objectForKeyedSubscript:v43];
                  *(float *)&double v60 = (float)(unint64_t)[v59 count] / v12;
                  uint64_t v61 = [v58 numberWithFloat:v60];
                  [v57 setObject:v61 forKeyedSubscript:v43];

                  uint64_t v62 = [v8 objectForKeyedSubscript:v36];
                  [v62 setHandleAndAppRegularityScores:v57];

                  long long v63 = [v8 objectForKeyedSubscript:v36];
                  [v63 daysInteracted];
                  v65 = long long v64 = v8;
                  long long v66 = (void *)[v65 mutableCopy];

                  if (!v66)
                  {
                    long long v66 = [MEMORY[0x1E4F1CA80] set];
                  }
                  double v15 = v124;
                  int v67 = [v124 startDate];
                  long long v68 = [v123 startOfDayForDate:v67];
                  [v66 addObject:v68];

                  long long v69 = [v64 objectForKeyedSubscript:v36];
                  [v69 setDaysInteracted:v66];

                  id v8 = v64;
                  id v9 = v115;
                  BOOL v7 = v116;
                  id v10 = v123;
                  unint64_t v13 = 0x1E4F28000;
                }
              }
              uint64_t v29 = obj;
              uint64_t v120 = [obj countByEnumeratingWithState:&v132 objects:v141 count:16];
            }
            while (v120);
            id v11 = v109;
LABEL_48:
            uint64_t i = v113;
          }

          v16 = v110;
        }
      }
      uint64_t v112 = [v11 countByEnumeratingWithState:&v136 objects:v142 count:16];
    }
    while (v112);
  }

  v87 = [v8 allKeys];
  v88 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v105];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v89 = v87;
  uint64_t v90 = [v89 countByEnumeratingWithState:&v128 objects:v140 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v129;
LABEL_54:
    uint64_t v93 = 0;
    while (1)
    {
      if (*(void *)v129 != v92) {
        objc_enumerationMutation(v89);
      }
      uint64_t v94 = *(void *)(*((void *)&v128 + 1) + 8 * v93);
      uint64_t v95 = objc_msgSend(v8, "objectForKeyedSubscript:", v94, v105);
      v96 = [v95 groupIdentifier];

      if (!v96)
      {
        [v95 setContactIdentifier:v94];
        v97 = [v117 objectForKeyedSubscript:v94];
        [v95 setSuggestedHandle:v97];

        uint64_t v98 = [v95 handleAndAppFrequencies];
        id v99 = [v98 allValues];
        [v99 valueForKeyPath:@"@sum.self"];
        id v101 = v100 = v8;
        objc_msgSend(v95, "setTotalFrequency:", objc_msgSend(v101, "integerValue"));

        id v8 = v100;
      }
      id v102 = [v95 daysInteracted];
      objc_msgSend(v95, "setRegularityScore:", (double)(unint64_t)objc_msgSend(v102, "count") / (double)(unint64_t)objc_msgSend(v118, "count"));

      [v88 addObject:v95];
      unint64_t v103 = [v88 count];

      if (v103 >= v105) {
        break;
      }
      if (v91 == ++v93)
      {
        uint64_t v91 = [v89 countByEnumeratingWithState:&v128 objects:v140 count:16];
        if (v91) {
          goto LABEL_54;
        }
        break;
      }
    }
  }

  return v88;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7 excludeContactsByIdentifiers:(id)a8
{
  BOOL v74 = a7;
  BOOL v9 = a6;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v80 = a5;
  id v87 = a8;
  context = (void *)MEMORY[0x1A6243860]();
  int64_t v13 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  id v14 = [MEMORY[0x1E4F1CA80] set];
  id v78 = self;
  id v79 = v12;
  uint64_t v81 = v14;
  BOOL v88 = v9;
  int64_t v77 = v13;
  if (!v9)
  {
    if (![v12 count])
    {
      [v14 addObject:&unk_1EF674BF8];
      [v14 addObject:&unk_1EF674C10];
      [v14 addObject:&unk_1EF674C28];
      [v14 addObject:&unk_1EF674C40];
      [v14 addObject:&unk_1EF674C58];
      double v15 = &unk_1EF674BC8;
      goto LABEL_21;
    }
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v107 count:16];
    if (!v17)
    {
LABEL_17:

      id v14 = v81;
LABEL_19:
      int64_t v13 = v77;
      goto LABEL_22;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v99;
LABEL_6:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v99 != v19) {
        objc_enumerationMutation(v16);
      }
      BOOL v21 = *(void **)(*((void *)&v98 + 1) + 8 * v20);
      if (![v21 integerValue])
      {
        id v14 = v81;
        [v81 addObject:&unk_1EF674BF8];
        [v81 addObject:&unk_1EF674C10];
        [v81 addObject:&unk_1EF674C28];
        [v81 addObject:&unk_1EF674C40];
        [v81 addObject:&unk_1EF674C58];
        [v81 addObject:&unk_1EF674BC8];

        goto LABEL_19;
      }
      uint64_t v22 = [v21 integerValue];
      double v23 = &unk_1EF674BF8;
      if (v22 == 1) {
        goto LABEL_14;
      }
      if (objc_msgSend(v21, "integerValue", &unk_1EF674BF8) == 2) {
        break;
      }
      uint64_t v24 = [v21 integerValue];
      double v23 = &unk_1EF674BC8;
      if (v24 == 3) {
        goto LABEL_14;
      }
LABEL_15:
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v98 objects:v107 count:16];
        if (v18) {
          goto LABEL_6;
        }
        goto LABEL_17;
      }
    }
    [v81 addObject:&unk_1EF674C10];
    [v81 addObject:&unk_1EF674C28];
    [v81 addObject:&unk_1EF674C40];
    double v23 = &unk_1EF674C58;
LABEL_14:
    [v81 addObject:v23];
    goto LABEL_15;
  }
  double v15 = &unk_1EF674BF8;
LABEL_21:
  [v14 addObject:v15];
LABEL_22:
  id v25 = [(_PSContactSuggester *)self interactionStore];
  id v71 = [v80 dateByAddingTimeInterval:(double)(-86400 * v13)];
  long long v69 = (void *)[v14 copy];
  uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
  id obja = +[_PSConstants mobileMessagesBundleId];
  v106[0] = obja;
  uint64_t v82 = +[_PSConstants macMessagesBundleId];
  v106[1] = v82;
  v72 = +[_PSConstants mobileMailBundleId];
  v106[2] = v72;
  uint64_t v70 = +[_PSConstants macMailBundleId];
  v106[3] = v70;
  int v27 = +[_PSConstants mobilePhoneBundleId];
  v106[4] = v27;
  uint64_t v28 = +[_PSConstants mobileFacetimeBundleId];
  v106[5] = v28;
  uint64_t v29 = +[_PSConstants macFacetimeBundleId];
  v106[6] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:7];
  uint64_t v31 = [v26 setWithArray:v30];
  uint64_t v32 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF675E70];
  LOBYTE(v68) = 0;
  char v33 = +[_PSInteractionStoreUtils interactionsFromStore:v25 startDate:v71 tillDate:v80 withMechanisms:v69 withAccount:0 withBundleIds:v31 withTargetBundleIds:0 withDirections:v32 singleRecipient:v68 fetchLimit:3000];

  uint64_t v34 = &off_1E5ADE000;
  v35 = +[_PSLogging generalChannel];
  char v36 = &qword_1A3265000;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
    *(_DWORD *)long long buf = 138412290;
    unint64_t v105 = v37;
    _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "_PSContactSuggester: interactions returned: %@", buf, 0xCu);

    uint64_t v34 = &off_1E5ADE000;
  }

  BOOL v38 = (void *)0x1E4F1C000;
  int v39 = [MEMORY[0x1E4F1CA48] array];
  v40 = v79;
  v41 = v87;
  if (!v88)
  {
    uint64_t v52 = [v33 copy];
    uint64_t v51 = v39;
    int v39 = (void *)v52;
    goto LABEL_43;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v33;
  uint64_t v42 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
  if (!v42) {
    goto LABEL_41;
  }
  uint64_t v43 = v42;
  uint64_t v83 = v39;
  v73 = v33;
  uint64_t v89 = *(void *)v95;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v95 != v89) {
        objc_enumerationMutation(obj);
      }
      v45 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      unint64_t v46 = [v45 bundleId];
      unint64_t v47 = +[_PSConstants mobileMessagesBundleId];
      char v48 = [v46 isEqualToString:v47];
      if ((v48 & 1) == 0)
      {
        BOOL v38 = [v45 bundleId];
        v40 = +[_PSConstants macMessagesBundleId];
        if (![v38 isEqualToString:v40])
        {
          LOBYTE(v50) = 0;
LABEL_36:

          if ((v50 & 1) == 0) {
            continue;
          }
LABEL_37:
          [v83 addObject:v45];
          continue;
        }
      }
      v49 = [v45 domainIdentifier];
      int v50 = [v49 containsString:@"iMessage"];

      if ((v48 & 1) == 0) {
        goto LABEL_36;
      }

      if (v50) {
        goto LABEL_37;
      }
    }
    uint64_t v43 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
  }
  while (v43);
  v40 = v79;
  v41 = v87;
  char v33 = v73;
  int v39 = v83;
  char v36 = &qword_1A3265000;
  uint64_t v34 = &off_1E5ADE000;
LABEL_41:
  uint64_t v51 = obj;
LABEL_43:

  long long v53 = [v34[172] generalChannel];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    long long v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
    *(_DWORD *)long long buf = *v36;
    unint64_t v105 = v54;
    _os_log_impl(&dword_1A314B000, v53, OS_LOG_TYPE_INFO, "_PSContactSuggester: Filtered interactions returned: %@", buf, 0xCu);
  }
  if (v74)
  {
    id v55 = (id)objc_opt_new();
    long long v56 = [(_PSContactSuggester *)v78 contactAndGroupSuggestionsWithMaxSuggestions:a3 lookBackDays:v77 interactions:v39];
    if ([v41 count])
    {
      id v84 = v39;
      long long v57 = v33;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v58 = v55;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v90 objects:v102 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v91;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v91 != v61) {
              objc_enumerationMutation(v58);
            }
            long long v63 = *(void **)(*((void *)&v90 + 1) + 8 * j);
            long long v64 = [v63 contactIdentifier];
            char v65 = [v87 containsObject:v64];

            if ((v65 & 1) == 0) {
              [v58 addObject:v63];
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v90 objects:v102 count:16];
        }
        while (v60);
      }

      id v55 = v58;
      long long v56 = v55;
      v41 = v87;
      char v33 = v57;
      int v39 = v84;
    }
  }
  else
  {
    id v55 = (id)[v39 copy];
    long long v56 = [(_PSContactSuggester *)v78 contactSuggestionsWithMaxSuggestions:a3 excludeContactsByIdentifiers:v41 lookBackDays:v77 interactions:v55 modeAvocado:0];
  }

  long long v66 = [v56 sortedArrayUsingComparator:&__block_literal_global_189];

  return v66;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7
{
  return [(_PSContactSuggester *)self contactSuggestionsWithMaxSuggestions:a3 interactionDomains:a4 referenceDate:a5 appleUsersOnly:a6 includeGroups:a7 excludeContactsByIdentifiers:0];
}

- (id)computeContactPriorsForContactIdentifiers:(id)a3 withTimeConstant:(int64_t)a4 withInteractionMechanisms:(id)a5 asOf:(id)a6 overLookbackOf:(int64_t)a7
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_PSContactSuggester *)self interactionStore];
  double v15 = [v13 dateByAddingTimeInterval:(double)(-86400 * a7)];
  id v71 = v12;
  id v16 = (void *)[v12 copy];
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF675E88];
  LOBYTE(v70) = 0;
  id v80 = v13;
  uint64_t v18 = +[_PSInteractionStoreUtils interactionsFromStore:v14 startDate:v15 tillDate:v13 withMechanisms:v16 withAccount:0 withBundleIds:0 withTargetBundleIds:0 withDirections:v17 singleRecipient:v70 fetchLimit:3000];

  uint64_t v19 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    *(_DWORD *)long long buf = 138412290;
    id v102 = v20;
    _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "_PSContactSuggester: interactions returned: %@", buf, 0xCu);
  }
  BOOL v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v18;
  uint64_t v75 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v75)
  {
    uint64_t v74 = *(void *)v94;
    double v22 = (double)a4;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v94 != v74) {
          objc_enumerationMutation(obj);
        }
        uint64_t v79 = v23;
        uint64_t v24 = *(void **)(*((void *)&v93 + 1) + 8 * v23);
        context = (void *)MEMORY[0x1A6243860]();
        int64_t v77 = [v24 sender];
        uint64_t v25 = [v77 personId];
        if (v25)
        {
          uint64_t v26 = [v21 objectForKeyedSubscript:v25];

          if (!v26)
          {
            int v27 = [(_PSContactSuggester *)self getDefaultContactPriorForContactId:v25 withModelName:@"PSContactSuggester" withModelVersion:@"0"];
            [v21 setObject:v27 forKeyedSubscript:v25];
          }
          uint64_t v28 = [v21 objectForKeyedSubscript:v25];
          uint64_t v29 = [v24 startDate];
          [(_PSContactSuggester *)self decayForReferenceDate:v29 relativeTo:v80 withTimeConstant:v22];
          float v31 = v30;
          [v28 priorScore];
          *(float *)&double v33 = v31 + v32;
          [v28 setPriorScore:v33];
        }
        uint64_t v76 = (void *)v25;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        uint64_t v34 = [v24 recipients];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v89 objects:v99 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v90 != v37) {
                objc_enumerationMutation(v34);
              }
              int v39 = [*(id *)(*((void *)&v89 + 1) + 8 * i) personId];
              if (v39)
              {
                v40 = [v21 objectForKeyedSubscript:v39];

                if (!v40)
                {
                  v41 = [(_PSContactSuggester *)self getDefaultContactPriorForContactId:v39 withModelName:@"PSContactSuggester" withModelVersion:@"0"];
                  [v21 setObject:v41 forKeyedSubscript:v39];
                }
                uint64_t v42 = [v21 objectForKeyedSubscript:v39];
                uint64_t v43 = [v24 startDate];
                [(_PSContactSuggester *)self decayForReferenceDate:v43 relativeTo:v80 withTimeConstant:v22];
                float v45 = v44;
                [v42 priorScore];
                *(float *)&double v47 = v45 + v46;
                [v42 setPriorScore:v47];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v89 objects:v99 count:16];
          }
          while (v36);
        }

        uint64_t v23 = v79 + 1;
      }
      while (v79 + 1 != v75);
      uint64_t v75 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v75);
  }

  char v48 = [v21 keysSortedByValueUsingComparator:&__block_literal_global_203];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v86;
    uint64_t v52 = 1;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v86 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v54 = *(void *)(*((void *)&v85 + 1) + 8 * j);
        id v55 = [v21 objectForKeyedSubscript:v54];
        [v55 priorScore];
        float v57 = v56;

        if (v57 != 0.0)
        {
          id v58 = [v21 objectForKeyedSubscript:v54];
          [v58 setRank:v52];

          uint64_t v52 = (v52 + 1);
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v85 objects:v98 count:16];
    }
    while (v50);
  }
  uint64_t v59 = v72;
  if ([v72 count])
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v61 = v72;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v81 objects:v97 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v82;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v82 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = *(void *)(*((void *)&v81 + 1) + 8 * k);
          int v67 = [v21 objectForKeyedSubscript:v66];
          if (!v67)
          {
            int v67 = [(_PSContactSuggester *)self getDefaultContactPriorForContactId:v66 withModelName:@"PSContactSuggester" withModelVersion:@"0"];
          }
          [v60 setObject:v67 forKeyedSubscript:v66];
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v81 objects:v97 count:16];
      }
      while (v63);
    }

    uint64_t v68 = (void *)[v60 copy];
    uint64_t v59 = v72;
  }
  else
  {
    uint64_t v68 = (void *)[v21 copy];
  }

  return v68;
}

- (void)computeAndSaveContactPriorArchive
{
  id v3 = [MEMORY[0x1E4F5B600] standardInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___PSContactSuggester_computeAndSaveContactPriorArchive__block_invoke;
  v4[3] = &unk_1E5ADE940;
  v4[4] = self;
  [v3 performNoMoreOftenInSecondsThan:@"com.apple.coreduetd.contactPriorGeneration" name:v4 activityBlock:21600.0];
}

- (id)computeContactPriorsForContactIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v4 set];
  [v6 addObject:&unk_1EF674BF8];
  [v6 addObject:&unk_1EF674C10];
  [v6 addObject:&unk_1EF674C28];
  [v6 addObject:&unk_1EF674C40];
  [v6 addObject:&unk_1EF674C58];
  BOOL v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [(_PSContactSuggester *)self computeContactPriorsForContactIdentifiers:v5 withTimeConstant:43200 withInteractionMechanisms:v6 asOf:v7 overLookbackOf:+[_PSPrivacyDataRetentionPeriod lookbackDurationInDays]];

  return v8;
}

+ (id)_cascadeContentForContactPriors
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v2 = [MEMORY[0x1E4F57FB8] setEnumeratorWithUseCase:@"PeopleSuggesterContactPriors"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___PSContactSuggester__cascadeContentForContactPriors__block_invoke;
  v5[3] = &unk_1E5ADEB08;
  v5[4] = &v6;
  [v2 enumerateAllSets:0 itemType:40568 usingBlock:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_filteredContactDictionaryFromCascadeContent:(id)a3 forContactIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_220);
  BOOL v9 = (void *)[v7 initWithArray:v8];

  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  id v11 = [v5 sourceSharedIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90___PSContactSuggester__filteredContactDictionaryFromCascadeContent_forContactIdentifiers___block_invoke_2;
  v22[3] = &unk_1E5ADEB50;
  id v12 = v9;
  id v23 = v12;
  id v13 = v10;
  id v24 = v13;
  uint64_t v25 = &v26;
  [v11 enumerateInt64ValuesWithBlock:v22];

  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
  if ([v13 count])
  {
    *((_DWORD *)v27 + 6) = 0;
    double v15 = [v5 priorScore];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90___PSContactSuggester__filteredContactDictionaryFromCascadeContent_forContactIdentifiers___block_invoke_3;
    v17[3] = &unk_1E5ADEB78;
    id v18 = v13;
    BOOL v21 = &v26;
    id v19 = v14;
    id v20 = v5;
    [v15 enumerateFloatValuesWithBlock:v17];
  }
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)contactPriorsForContactIdentifiers:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A314B000, "Duet: _PSContactSuggester Prior Generation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [MEMORY[0x1E4F5B418] interactionSignpost];
  if (os_signpost_enabled(v6))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSContactPriorsForContactIdentifiers", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v8 = [(id)objc_opt_class() defaultCorrelationsSessionFileForContactPriors];
  id v41 = 0;
  BOOL v9 = (void *)[v7 initWithContentsOfFile:v8 options:1 error:&v41];
  id v10 = v41;

  if (v10)
  {
    id v11 = 0;
    id v12 = 0;
LABEL_5:
    id v13 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester contactPriorsForContactIdentifiers:]();
    }

    if ([v4 count]) {
      id v14 = v4;
    }
    else {
      id v14 = 0;
    }
    double v15 = [(_PSContactSuggester *)self computeContactPriorsForContactIdentifiers:v14];

    goto LABEL_11;
  }
  id v40 = 0;
  uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v40];
  id v10 = v40;
  id v11 = [v17 contactPriorDictionary];
  id v12 = [v17 archiveDate];

  if (!v11 || !v12) {
    goto LABEL_5;
  }
  if (v4)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke_229;
    v38[3] = &unk_1E5ADE9A8;
    id v39 = v11;
    uint64_t v18 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v38);

    id v4 = (id)v18;
  }
  else
  {
    id v4 = [v11 allKeys];
  }
  id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke_2;
  v36[3] = &unk_1E5ADEBA0;
  id v20 = v11;
  id v37 = v20;
  BOOL v21 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v36);
  double v22 = (void *)[v19 initWithObjects:v21 forKeys:v4];

  id v23 = [MEMORY[0x1E4F1C9C8] date];
  [(_PSContactSuggester *)self decayForReferenceDate:v12 relativeTo:v23 withTimeConstant:43200.0];
  float v25 = v24;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v22;
  uint64_t v26 = [v10 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v10);
        }
        int v29 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
        [v29 priorScore];
        *(float *)&double v31 = v25 * v30;
        [(_PSContactSuggester *)self sigmoid:v31];
        objc_msgSend(v29, "setPriorScore:");
      }
      uint64_t v26 = [v10 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v26);
  }
  double v15 = v10;
LABEL_11:

  __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke();

  return v15;
}

- (id)contactSuggestionsForPeopleWidgetWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(_PSContactSuggesterForPeopleWidget);
  id v7 = [(_PSContactSuggesterForPeopleWidget *)v6 contactSuggestionsWithMaxSuggestions:a3 excludeContactsWithIdentifiers:v5];

  return v7;
}

+ (id)contactPriorSuggestionsForText:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2050000000;
  id v4 = (void *)getCKVocabularySearcherClass_softClass;
  uint64_t v51 = (void *)getCKVocabularySearcherClass_softClass;
  if (!getCKVocabularySearcherClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    uint64_t v41 = (uint64_t)__getCKVocabularySearcherClass_block_invoke;
    uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5ADE858;
    uint64_t v43 = (void (*)(uint64_t))buf;
    CoreKnowledgeLibraryCore();
    *(void *)(*(void *)&buf[8] + 24) = objc_getClass("CKVocabularySearcher");
    getCKVocabularySearcherClass_softClass = *(void *)(*((void *)v43 + 1) + 24);
    id v4 = *(void **)(*(void *)&buf[8] + 24);
  }
  id v5 = v4;
  _Block_object_dispose(buf, 8);
  id v6 = [v5 makeSearcher];
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("CKVocabularySearcher matchSpansOfString:", v7);

  uint64_t v39 = 0;
  uint64_t v40 = (uint64_t)&v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__0;
  uint64_t v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___PSContactSuggester_contactPriorSuggestionsForText___block_invoke;
  block[3] = &unk_1E5ADEBC8;
  BOOL v38 = &v39;
  id v27 = v6;
  id v36 = v27;
  id v28 = v3;
  id v37 = v28;
  dispatch_async(queue, block);
  dispatch_sync(queue, &__block_literal_global_236);
  uint64_t v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(v40 + 40);
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "For text %@ found spans %@", buf, 0x16u);
  }

  id v10 = *(void **)(v40 + 40);
  if (v10 && [v10 count])
  {
    float v30 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = *(id *)(v40 + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v49 count:16];
    if (!v12) {
      goto LABEL_21;
    }
    uint64_t v13 = *(void *)v32;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v16 = [v15 ontologyLabel];
        if (![v16 isEqual:@"personFullName"]) {
          goto LABEL_18;
        }
        uint64_t v17 = [v15 originAppId];
        uint64_t v45 = 0;
        float v46 = &v45;
        uint64_t v47 = 0x2020000000;
        uint64_t v18 = (id *)getCKVAppIdContactsSymbolLoc_ptr;
        uint64_t v48 = getCKVAppIdContactsSymbolLoc_ptr;
        if (!getCKVAppIdContactsSymbolLoc_ptr)
        {
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCKVAppIdContactsSymbolLoc_block_invoke;
          uint64_t v51 = &unk_1E5ADE858;
          uint64_t v52 = &v45;
          __getCKVAppIdContactsSymbolLoc_block_invoke((uint64_t)buf);
          uint64_t v18 = (id *)v46[3];
        }
        _Block_object_dispose(&v45, 8);
        if (!v18)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        id v19 = *v18;
        char v20 = [v17 isEqual:v19];

        if (v20)
        {
          BOOL v21 = [v15 metadata];
          id v16 = [v21 priorInfo];

          double v22 = objc_opt_new();
          id v23 = [v15 itemId];
          [v22 setContactIdentifier:v23];

          [v16 score];
          objc_msgSend(v22, "setPriorScore:");
          objc_msgSend(v22, "setRank:", objc_msgSend(v16, "ordinality"));
          [v30 addObject:v22];

LABEL_18:
          continue;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v49 count:16];
      if (!v12)
      {
LABEL_21:

        if ([v30 count])
        {
          float v24 = v30;
          id v25 = v30;
        }
        else
        {
          id v25 = 0;
          float v24 = v30;
        }

        goto LABEL_26;
      }
    }
  }
  id v25 = 0;
LABEL_26:

  _Block_object_dispose(&v39, 8);

  return v25;
}

- (float)sigmoid:(float)a3
{
  if (a3 >= 0.0)
  {
    double v4 = exp((float)-a3);
    double v5 = 1.0;
  }
  else
  {
    float v3 = exp(a3);
    double v4 = v3;
    double v5 = v4;
  }
  return v5 / (v4 + 1.0);
}

+ (id)defaultCorrelationsSessionFileForContactPriors
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  float v3 = [v2 firstObject];

  double v4 = [v3 stringByAppendingPathComponent:@"PeopleSuggester/contactpriors.archive"];

  return v4;
}

+ (id)_cascadeContentForPriorsArchive:(id)a3 cascadeContactEnumerator:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  long long v31 = v5;
  id v7 = [v5 contactPriorDictionary];
  uint64_t v8 = malloc_type_calloc([v7 count], 0x10uLL, 0x1000040D9A13B51uLL);
  if (!v8)
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v9 = v8;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __80___PSContactSuggester__cascadeContentForPriorsArchive_cascadeContactEnumerator___block_invoke;
  v42[3] = &__block_descriptor_40_e5_v8__0l;
  v42[4] = v8;
  id v10 = (void (**)(void))MEMORY[0x1A6243AD0](v42);
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __80___PSContactSuggester__cascadeContentForPriorsArchive_cascadeContactEnumerator___block_invoke_2;
  v34[3] = &unk_1E5ADEBF0;
  id v11 = v7;
  id v36 = &v38;
  id v37 = v9;
  id v35 = v11;
  v6[2](v6, v34);
  qsort_b(v9, v39[3], 0x10uLL, &__block_literal_global_250);
  uint64_t v12 = objc_opt_new();
  if (v39[3])
  {
    unint64_t v13 = 0;
    id v14 = (uint64_t *)v9;
    do
    {
      uint64_t v15 = *v14;
      v14 += 2;
      [v12 appendInt64Value:v15];
      ++v13;
    }
    while (v13 < v39[3]);
  }
  id v16 = objc_opt_new();
  if (v39[3])
  {
    unint64_t v18 = 0;
    id v19 = v9 + 2;
    do
    {
      LODWORD(v17) = *v19;
      [v16 appendFloatValue:v17];
      ++v18;
      v19 += 4;
    }
    while (v18 < v39[3]);
  }
  memset(v33, 0, sizeof(v33));
  id v20 = v11;
  if ([v20 countByEnumeratingWithState:v33 objects:v43 count:16])
  {
    BOOL v21 = [v20 objectForKeyedSubscript:**((void **)&v33[0] + 1)];
    double v22 = [v21 modelName];
    id v23 = [v21 modelVersion];
  }
  else
  {
    double v22 = 0;
    id v23 = 0;
  }

  id v24 = objc_alloc(MEMORY[0x1E4F70AE8]);
  id v25 = NSNumber;
  uint64_t v26 = [v31 archiveDate];
  [v26 timeIntervalSinceReferenceDate];
  id v27 = objc_msgSend(v25, "numberWithDouble:");
  uint64_t v32 = 0;
  id v28 = (void *)[v24 initWithVersion:&unk_1EF674C88 minVersion:&unk_1EF674C88 sourceSharedIdentifier:v12 priorScore:v16 modelName:v22 modelVersion:v23 referenceDate:v27 error:&v32];

  _Block_object_dispose(&v38, 8);
  if (v10) {
    v10[2](v10);
  }

  return v28;
}

+ (id)_cascadeContentForPriorsArchive:(id)a3
{
  return (id)[a1 _cascadeContentForPriorsArchive:a3 cascadeContactEnumerator:&__block_literal_global_259];
}

+ (void)_writeArchiveToCascade:(id)a3
{
  float v3 = +[_PSContactSuggester _cascadeContentForPriorsArchive:a3];
  id v13 = 0;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F70AF0]) initWithSourceItemIdentifier:@"priors_v0" error:&v13];
  id v5 = v13;
  id v12 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F57F98]) initWithContent:v3 metaContent:v4 error:&v12];
  id v7 = v12;
  uint64_t v8 = (void *)MEMORY[0x1E4F57FD8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46___PSContactSuggester__writeArchiveToCascade___block_invoke;
  v10[3] = &unk_1E5ADECA8;
  id v11 = v6;
  id v9 = v6;
  [v8 fullSetDonationWithItemType:40568 descriptors:MEMORY[0x1E4F1CBF0] completion:v10];
}

- (void)writeArchive:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[_PSContactSuggester _writeArchiveToCascade:v3];
  double v4 = [(id)objc_opt_class() defaultCorrelationsSessionFileForContactPriors];
  if (v3)
  {
    id v13 = 0;
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v13];
    id v6 = v13;
    if (!v6)
    {
      id v7 = [v4 stringByDeletingLastPathComponent];
      uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v12 = 0;
      [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v12];
      id v6 = v12;

      if (!v6)
      {
        id v11 = 0;
        [v5 writeToFile:v4 options:1 error:&v11];
        id v6 = v11;
        id v9 = +[_PSLogging generalChannel];
        id v10 = v9;
        if (v6)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[_PSContactSuggester writeArchive:]();
          }
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v15 = v4;
            _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Successfully persisted contact prior scores to file: %@", buf, 0xCu);
          }
          id v6 = 0;
        }
      }
    }
  }
  else
  {
    id v6 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggester writeArchive:]();
    }
  }
}

- (float)decayForReferenceDate:(id)a3 relativeTo:(id)a4 withTimeConstant:(double)a5
{
  [a4 timeIntervalSinceDate:a3];
  return exp(v6 * -0.693147181 / a5);
}

- (id)getDefaultContactPriorForContactId:(id)a3 withModelName:(id)a4 withModelVersion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(_PSContactPrior);
  [(_PSContactPrior *)v10 setContactIdentifier:v9];

  [(_PSContactPrior *)v10 setPriorScore:0.0];
  [(_PSContactPrior *)v10 setRank:0xFFFFFFFFLL];
  [(_PSContactPrior *)v10 setModelName:v8];

  [(_PSContactPrior *)v10 setModelVersion:v7];

  return v10;
}

- (id)contactKeysToFetch
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = getCNContactIdentifierKey();
  v25[0] = v2;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v3 = (id *)getCNContactRelationsKeySymbolLoc_ptr;
  uint64_t v24 = getCNContactRelationsKeySymbolLoc_ptr;
  if (!getCNContactRelationsKeySymbolLoc_ptr)
  {
    double v4 = (void *)ContactsLibrary();
    v22[3] = (uint64_t)dlsym(v4, "CNContactRelationsKey");
    getCNContactRelationsKeySymbolLoc_ptr = v22[3];
    id v3 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v3) {
    goto LABEL_16;
  }
  id v5 = *v3;
  v25[1] = v5;
  double v6 = getCNContactGivenNameKey();
  v25[2] = v6;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v7 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr;
  uint64_t v24 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    id v8 = (void *)ContactsLibrary();
    v22[3] = (uint64_t)dlsym(v8, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr = v22[3];
    id v7 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v7) {
    goto LABEL_16;
  }
  id v9 = *v7;
  v25[3] = v9;
  id v10 = getCNContactFamilyNameKey();
  v25[4] = v10;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v11 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v24 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    id v12 = (void *)ContactsLibrary();
    v22[3] = (uint64_t)dlsym(v12, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr = v22[3];
    id v11 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v11) {
    goto LABEL_16;
  }
  id v13 = *v11;
  v25[5] = v13;
  id v14 = getCNContactPhoneNumbersKey();
  v25[6] = v14;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v15 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  uint64_t v24 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    uint64_t v16 = (void *)ContactsLibrary();
    v22[3] = (uint64_t)dlsym(v16, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr = v22[3];
    uint64_t v15 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v15)
  {
LABEL_16:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v26 = *v15;
  double v17 = (void *)MEMORY[0x1E4F1C978];
  id v18 = v26;
  id v19 = [v17 arrayWithObjects:v25 count:8];

  return v19;
}

- (void)setInteractionStore:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to resolve \"Me\" contact id in _PSContactSuggester", v2, v3, v4, v5, v6);
}

- (void)contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error fetching me contact from store in _PSContactSuggester: %@", v2, v3, v4, v5, v6);
}

- (void)gameCenterSuggestionConsumedWithContactHandle:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Nil handle passed to Game Center Feedback", v2, v3, v4, v5, v6);
}

- (void)gameCenterSuggestionConsumedWithGroupIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Nil groupIdentifier passed to Game Center Feedback", v2, v3, v4, v5, v6);
}

- (void)contactPriorsForContactIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Persisted file corrupt, or does not exist. Using on-demand compute instead: %@", v2, v3, v4, v5, v6);
}

- (void)writeArchive:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Empty archive or filePath when trying to persist contact priors", v2, v3, v4, v5, v6);
}

- (void)writeArchive:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error when trying to persist contact prior scores: %@", v2, v3, v4, v5, v6);
}

@end