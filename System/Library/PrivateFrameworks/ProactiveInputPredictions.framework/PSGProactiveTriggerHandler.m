@interface PSGProactiveTriggerHandler
+ (BOOL)_isCheckInSupportedPlatform;
+ (BOOL)_isCurrentLocationSupportedPlatform;
+ (id)sharedInstance;
- (BOOL)_handleOperationalTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 limit:(unint64_t)a8 explanationSet:(id)a9 results:(id)a10;
- (PSGProactiveTriggerHandler)initWithBroker:(id)a3 cache:(id)a4;
- (id)_handlePortraitTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 limit:(unint64_t)a7 timeoutSeconds:(double)a8 explanationSet:(id)a9 results:(id)a10;
- (id)handleTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 recipientNames:(id)a7 availableApps:(id)a8 timeoutSeconds:(double)a9 fetchLimit:(unint64_t)a10 maxSuggestions:(unint64_t)a11 explanationSet:(id)a12 error:(id *)a13;
@end

@implementation PSGProactiveTriggerHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTrigger, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_broker, 0);
}

- (id)handleTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 recipientNames:(id)a7 availableApps:(id)a8 timeoutSeconds:(double)a9 fetchLimit:(unint64_t)a10 maxSuggestions:(unint64_t)a11 explanationSet:(id)a12 error:(id *)a13
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  v22 = a5;
  id v23 = a6;
  id v56 = a7;
  id v57 = a8;
  id v58 = a12;
  v24 = [v20 triggerAttributes];
  v25 = [v24 objectForKeyedSubscript:*MEMORY[0x263F51238]];

  v26 = [v20 triggerAttributes];
  v27 = [v26 objectForKeyedSubscript:*MEMORY[0x263F51220]];

  v53 = v25;
  v54 = v27;
  if (([v25 isEqualToString:@"triggerTypeConnections"] & 1) == 0
    && ([v27 isEqualToString:*MEMORY[0x263F51210]] & 1) == 0
    && ![v27 isEqualToString:*MEMORY[0x263F51208]])
  {
    v28 = [(PSGStructuredInfoSuggestionCache *)self->_cache searchWithTrigger:v20 localeIdentifier:v21 maxSuggestions:a11];
    if ([v28 count])
    {
      v42 = psg_default_log_handle();
      v29 = v23;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v60 = [v28 count];
        _os_log_impl(&dword_20A02A000, v42, OS_LOG_TYPE_INFO, "Returning %tu item(s) from structured info cache.", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_lastTrigger, a3);
      v28 = v28;
      v41 = v28;
    }
    else
    {
      v49 = +[PSGStructuredInfoSuggestionCache emptySuggestionsPlaceholder];

      loga = psg_default_log_handle();
      BOOL v50 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
      v29 = v23;
      if (v28 != v49)
      {
        if (v50)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v20;
          _os_log_impl(&dword_20A02A000, loga, OS_LOG_TYPE_INFO, "Cache lookup returns nothing for %@", buf, 0xCu);
        }

        goto LABEL_7;
      }
      if (v50)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A02A000, loga, OS_LOG_TYPE_INFO, "Returning nil since we get empty placeholder from structured info cache.", buf, 2u);
      }

      objc_storeStrong((id *)&self->_lastTrigger, a3);
      v41 = 0;
    }
    v32 = v56;
    goto LABEL_39;
  }
  v28 = psg_default_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v20;
    _os_log_impl(&dword_20A02A000, v28, OS_LOG_TYPE_INFO, "Skip structured info cache lookup for %@", buf, 0xCu);
  }
  v29 = v23;
LABEL_7:

  v28 = [v20 triggerCategory];
  if (v28 != @"TaggedTextFieldContactsAutocomplete")
  {
LABEL_8:

    goto LABEL_10;
  }
  p_lastTrigger = &self->_lastTrigger;
  v31 = [(PSGProactiveTrigger *)self->_lastTrigger triggerCategory];

  if (v31 != @"TaggedTextFieldContactsAutocomplete")
  {
LABEL_10:
    v28 = objc_opt_new();
    v32 = v56;
    if (![(PSGProactiveTriggerHandler *)self _handleOperationalTrigger:v20 localeIdentifier:v21 bundleIdentifier:v22 recipientNames:v56 availableApps:v57 limit:a10 explanationSet:v58 results:v28])
    {
      v33 = [(PSGProactiveTriggerHandler *)self _handlePortraitTrigger:v20 localeIdentifier:v21 bundleIdentifier:v22 recipients:v29 limit:a10 timeoutSeconds:v58 explanationSet:a9 results:v28];
      v34 = v33;
      if (a13 && v33) {
        *a13 = v33;
      }
    }
    if (![v28 count])
    {
      v35 = [v20 triggerCategory];
      if (v35 == @"TaggedTextFieldContactsAutocomplete")
      {
        char v43 = [v58 hasContactsServingError];

        if ((v43 & 1) == 0)
        {
          [(PSGStructuredInfoSuggestionCache *)self->_cache addEmptyPlaceholderForTrigger:v20 localeIdentifier:v21];
LABEL_35:
          objc_storeStrong((id *)&self->_lastTrigger, a3);
          if ([v28 count] <= a11)
          {
            v45 = v28;
            v28 = v45;
          }
          else
          {
            v45 = [v28 subarrayWithRange:0];
          }
          v41 = v45;
          goto LABEL_39;
        }
      }
      else
      {
      }
    }
    if (-[NSObject count](v28, "count") && [v20 triggerSourceType] != 5)
    {
      [(PSGStructuredInfoSuggestionCache *)self->_cache addStructuredInfoSuggestions:v28 localeIdentifier:v21];
    }
    else
    {
      v44 = [v20 triggerCategory];

      if (v44 != @"TaggedTextFieldContactsAutocomplete") {
        [(PSGStructuredInfoSuggestionCache *)self->_cache invalidate];
      }
    }
    goto LABEL_35;
  }
  os_log_t log = v22;
  v36 = [v20 triggerAttributes];
  v28 = +[PSGProactiveTrigger getSearchTerm:v36];

  v37 = [(PSGProactiveTrigger *)*p_lastTrigger triggerAttributes];
  v38 = +[PSGProactiveTrigger getSearchTerm:v37];

  if ((unint64_t)[v28 length] < 3
    || ![v38 length]
    || ![v28 hasPrefix:v38])
  {
    v47 = psg_default_log_handle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = [v28 length];
      *(_DWORD *)buf = 134217984;
      uint64_t v60 = v48;
      _os_log_impl(&dword_20A02A000, v47, OS_LOG_TYPE_DEFAULT, "Contacts Autocomplete query name length: %tu", buf, 0xCu);
    }

    v22 = log;
    v29 = v23;
    goto LABEL_8;
  }
  v39 = v38;
  v40 = psg_default_log_handle();
  v29 = v23;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A02A000, v40, OS_LOG_TYPE_INFO, "Skipping Portrait XPC: no cached results for long Contacts Autocomplete query.", buf, 2u);
  }

  [v58 pushInternalExplanationCode:6];
  objc_storeStrong((id *)p_lastTrigger, a3);

  v41 = 0;
  v22 = log;
  v32 = v56;
  v25 = v53;
LABEL_39:

  return v41;
}

- (id)_handlePortraitTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 limit:(unint64_t)a7 timeoutSeconds:(double)a8 explanationSet:(id)a9 results:(id)a10
{
  v73[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v50 = a4;
  id v52 = a5;
  id v53 = a6;
  id v51 = a9;
  id v18 = a10;
  v19 = [v17 triggerCategory];
  LODWORD(a6) = [v19 isEqualToString:@"TaggedTextFieldContactsAutocomplete"];

  if (!a6)
  {
    v28 = (void *)MEMORY[0x263F5D4E8];
    v29 = [v17 triggerAttributes];
    v27 = [v28 quickTypeQueryFromLMTokens:v29 localeIdentifier:v50 recipients:v53 bundleIdentifier:v52];

    if ([v17 triggerSourceType] == 1 || objc_msgSend(v17, "triggerSourceType") == 4) {
      [v27 setTimeoutSeconds:&unk_26BE13358];
    }
LABEL_7:
    *(void *)v62 = 0;
    v63 = v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__327;
    v66 = __Block_byref_object_dispose__328;
    id v67 = 0;
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    v31 = psg_default_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A02A000, v31, OS_LOG_TYPE_DEFAULT, "Kicking off Portrait XPC", buf, 2u);
    }

    broker = self->_broker;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke;
    v58[3] = &unk_263FCFA70;
    uint64_t v61 = v62;
    id v33 = v51;
    id v59 = v33;
    v34 = v30;
    uint64_t v60 = v34;
    [(PPQuickTypeBroker *)broker quickTypeItemsWithQuery:v27 limit:a7 completion:v58];
    v35 = [MEMORY[0x263EFF9D0] null];
    v36 = [v17 triggerAttributes];
    v37 = [v36 objectForKeyedSubscript:*MEMORY[0x263F511B8]];
    int v38 = [v35 isEqual:v37];

    if (v38)
    {
      v39 = psg_default_log_handle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v39, OS_LOG_TYPE_DEBUG, "Handling a priming token. Skip waiting for async call.", buf, 2u);
      }

      [v33 pushInternalExplanationCode:3];
      goto LABEL_13;
    }
    if ([MEMORY[0x263F61E38] waitForSemaphore:v34 timeoutSeconds:a8] == 1)
    {
      id v41 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%.3f", *(void *)&a8);
      v42 = psg_default_log_handle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v41;
        _os_log_error_impl(&dword_20A02A000, v42, OS_LOG_TYPE_ERROR, "Portrait timeout (threshold: %@ s)", buf, 0xCu);
      }

      [v33 pushInternalExplanationCode:1];
      char v43 = (void *)MEMORY[0x263F087E8];
      v69 = @"thresholdSecs";
      id v70 = v41;
      v44 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v40 = [v43 errorWithDomain:@"PSGErrorDomain" code:1 userInfo:v44];
    }
    else
    {
      if (![*((id *)v63 + 5) count])
      {
LABEL_13:
        v40 = 0;
LABEL_27:

        _Block_object_dispose(v62, 8);
        id v21 = v27;
        goto LABEL_28;
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v41 = *((id *)v63 + 5);
      v40 = (void *)[v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (v40)
      {
        uint64_t v45 = *(void *)v55;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v55 != v45) {
              objc_enumerationMutation(v41);
            }
            v47 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v17 portraitItem:*(void *)(*((void *)&v54 + 1) + 8 * i) operationalItem:0];
            [v18 addObject:v47];
          }
          v40 = (void *)[v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
        }
        while (v40);
      }
    }

    goto LABEL_27;
  }
  id v20 = [v17 triggerAttributes];
  id v21 = [v20 objectForKeyedSubscript:@"SearchField"];

  uint64_t v22 = [v21 unsignedIntegerValue];
  id v23 = [v17 triggerAttributes];
  v24 = [v23 objectForKeyedSubscript:@"SearchTerm"];

  if ([v24 length])
  {
    v25 = (void *)MEMORY[0x263F5D4E8];
    v73[0] = v24;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:1];
    v27 = [v25 quickTypeQueryWithType:1 subtype:12 semanticTag:0 fields:v22 time:0 subFields:0 label:0 people:v26 localeIdentifier:v50 bundleIdentifier:v52 recipients:v53];

    [v27 setTimeoutSeconds:&unk_26BE13348];
    goto LABEL_7;
  }
  v49 = psg_default_log_handle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v62 = 0;
    _os_log_fault_impl(&dword_20A02A000, v49, OS_LOG_TYPE_FAULT, "Search term not specified for Contacts Autocomplete trigger.", v62, 2u);
  }

  v40 = [MEMORY[0x263F087E8] errorWithDomain:@"PSGErrorDomain" code:2 userInfo:0];

LABEL_28:
  return v40;
}

void __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = psg_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v14 = [v5 count];
    __int16 v15 = 2048;
    uint64_t v16 = [v6 count];
    _os_log_impl(&dword_20A02A000, v7, OS_LOG_TYPE_DEFAULT, "Portrait XPC returns %tu item(s) and %tu explanation(s)", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke_85;
  v11[3] = &unk_263FCFA48;
  id v12 = *(id *)(a1 + 32);
  [v6 enumerateWithBlock:v11];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke_85(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = psg_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [MEMORY[0x263F5D4D8] stringFromExplanation:a2];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_20A02A000, v4, OS_LOG_TYPE_DEFAULT, "Portrait Exp Code: %@", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) pushPortraitExplanationCode:a2];
}

- (BOOL)_handleOperationalTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 limit:(unint64_t)a8 explanationSet:(id)a9 results:(id)a10
{
  v132[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v118 = a4;
  id v120 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  v19 = [v14 triggerAttributes];
  id v20 = [v19 valueForKey:*MEMORY[0x263F51238]];

  id v21 = [v14 triggerAttributes];
  uint64_t v22 = [v21 valueForKey:*MEMORY[0x263F51220]];

  id v23 = [v14 triggerAttributes];
  v117 = [v23 objectForKeyedSubscript:@"pov"];

  v24 = [v14 triggerAttributes];
  v119 = [v24 valueForKey:*MEMORY[0x263F51200]];

  unint64_t v25 = [v15 count];
  if ([v20 isEqualToString:*MEMORY[0x263F511E8]]
    && [v22 isEqualToString:*MEMORY[0x263F511B0]]
    && [(id)objc_opt_class() _isCurrentLocationSupportedPlatform])
  {
    if ([v16 containsObject:@"com.apple.messages.currentLocation"])
    {
      v112 = objc_opt_new();
      [v112 setObject:@"com.apple.messages.currentLocation" forKey:@"bundleID"];
      int v26 = [v117 containsString:@"mirrored"];
      v27 = @"currentLocation";
      if (v26) {
        v27 = @"requestLocation";
      }
      v115 = v27;
      int v28 = [v117 containsString:@"mirrored"];
      v29 = psg_default_log_handle();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A02A000, v29, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Preparing prediction for requesting location.", buf, 2u);
        }

        if (v25 < 2)
        {
          v87 = +[PSGUtilities sharedInstance];
          v88 = [v87 localizedStringForKey:@"REQUEST_LOCATION_BUTTON_CAPTION" withLocale:v118];
          uint64_t v110 = _PASValidatedFormat(v88, v89, v90, v91, v92, v93, v94, v95, @"");

          v96 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:v115 value:v110 bundleIdentifier:v120 operationData:v112];
          v132[0] = v96;
          v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:1];

          v86 = v115;
          v34 = (void *)v110;
          id v33 = v112;
          goto LABEL_39;
        }
        v31 = psg_default_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A02A000, v31, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Request location predictions are not allowed for group chats", buf, 2u);
        }
        v32 = 0;
        id v33 = v112;
        v34 = v31;
      }
      else
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A02A000, v29, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Preparing prediction for sharing location.", buf, 2u);
        }

        v76 = +[PSGUtilities sharedInstance];
        v77 = [v76 localizedStringForKey:@"SEND_CURRENT_LOCATION_BUTTON_CAPTION" withLocale:v118];
        uint64_t v109 = _PASValidatedFormat(v77, v78, v79, v80, v81, v82, v83, v84, @"");

        id v33 = v112;
        v85 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:v115 value:v109 bundleIdentifier:v120 operationData:v112];
        v131 = v85;
        v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];

        v34 = (void *)v109;
      }
      v86 = v115;
LABEL_39:

LABEL_44:
      BOOL v116 = 1;
      goto LABEL_45;
    }
LABEL_43:
    [v17 pushInternalExplanationCode:2];
    v32 = 0;
    goto LABEL_44;
  }
  if ([v20 isEqualToString:*MEMORY[0x263F64280]])
  {
    if ([v16 containsObject:@"com.apple.messages.surf"])
    {
      v113 = v22;
      v35 = v20;
      id v36 = v17;
      id v37 = v16;
      int v38 = [MEMORY[0x263EFF9A0] dictionary];
      [v38 setObject:@"com.apple.messages.surf" forKey:@"bundleID"];
      v39 = [v119 objectForKey:@"Currency"];
      if (v39)
      {
        [v38 setObject:v39 forKey:@"Currency"];
        v40 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:@"surf" value:@"Pay" bundleIdentifier:v120 operationData:v38];
        v130 = v40;
        v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v130 count:1];
      }
      else
      {
        v32 = 0;
      }

      BOOL v116 = 1;
      id v16 = v37;
      id v17 = v36;
      id v20 = v35;
      uint64_t v22 = v113;
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  if ([v20 isEqualToString:*MEMORY[0x263F64290]])
  {
    if ([v16 containsObject:@"com.apple.messages.photos"])
    {
      id v41 = (void *)MEMORY[0x263EFF9A0];
      v42 = [v14 triggerAttributes];
      [v41 dictionaryWithDictionary:v42];
      char v43 = v106 = v16;

      [v43 setObject:@"com.apple.messages.photos" forKey:@"bundleID"];
      v44 = +[PSGUtilities sharedInstance];
      uint64_t v45 = [v44 localizedStringForKey:@"CHOOSE_PHOTOS_CAPTION" withLocale:v118];
      _PASValidatedFormat(v45, v46, v47, v48, v49, v50, v51, v52, @"");
      v54 = id v53 = v22;

      long long v55 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:@"choosePhotos" value:v54 bundleIdentifier:v120 operationData:v43];
      v129 = v55;
      BOOL v116 = 1;
      v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];

      uint64_t v22 = v53;
      long long v56 = v120;
      long long v57 = v118;

      id v16 = v106;
      goto LABEL_46;
    }
    goto LABEL_43;
  }
  if ([v20 isEqualToString:@"event"])
  {
    long long v56 = v120;
    long long v57 = v118;
    if (![v22 isEqualToString:@"traveling home"]
      || ![(id)objc_opt_class() _isCheckInSupportedPlatform])
    {
      BOOL v116 = 0;
      v32 = 0;
      goto LABEL_46;
    }
    id v58 = psg_default_log_handle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A02A000, v58, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: text input has a match", buf, 2u);
    }

    if ([v16 containsObject:@"com.apple.SafetyMonitorApp.SafetyMonitorMessages"])
    {
      id v108 = v17;
      id v59 = v16;
      uint64_t v60 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v61 = [v14 triggerAttributes];
      v62 = [v60 dictionaryWithDictionary:v61];

      v63 = (void *)[@"com.apple.SafetyMonitorApp.SafetyMonitorMessages" copy];
      [v62 setObject:v63 forKeyedSubscript:@"bundleID"];

      uint64_t v64 = +[PSGUtilities sharedInstance];
      v65 = [v64 localizedStringForKey:@"START_CHECK_IN_SESSION_CAPTION" withLocale:v118];
      v73 = _PASValidatedFormat(v65, v66, v67, v68, v69, v70, v71, v72, @"");

      v74 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:@"start check-in" value:v73 bundleIdentifier:v120 operationData:v62];
      v128 = v74;
      v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v128 count:1];

      v75 = psg_default_log_handle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A02A000, v75, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: predicted item formed", buf, 2u);
      }

      BOOL v116 = 1;
      id v16 = v59;
      id v17 = v108;
      goto LABEL_45;
    }
    v97 = psg_default_log_handle();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v127 = @"com.apple.SafetyMonitorApp.SafetyMonitorMessages";
      _os_log_impl(&dword_20A02A000, v97, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: ignoring the trigger -- %@ not supported", buf, 0xCu);
    }

    goto LABEL_43;
  }
  BOOL v116 = 0;
  v32 = 0;
LABEL_45:
  long long v56 = v120;
  long long v57 = v118;
LABEL_46:
  if ([v32 count])
  {
    id v111 = v17;
    v114 = v22;
    v105 = v20;
    id v107 = v16;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v98 = v32;
    uint64_t v99 = [v98 countByEnumeratingWithState:&v121 objects:v125 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v100; ++i)
        {
          if (*(void *)v122 != v101) {
            objc_enumerationMutation(v98);
          }
          v103 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v14 portraitItem:0 operationalItem:*(void *)(*((void *)&v121 + 1) + 8 * i)];
          [v18 addObject:v103];
        }
        uint64_t v100 = [v98 countByEnumeratingWithState:&v121 objects:v125 count:16];
      }
      while (v100);
    }

    long long v56 = v120;
    id v16 = v107;
    id v17 = v111;
    id v20 = v105;
    uint64_t v22 = v114;
  }

  return v116;
}

- (PSGProactiveTriggerHandler)initWithBroker:(id)a3 cache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGProactiveTriggerHandler;
  uint64_t v9 = [(PSGProactiveTriggerHandler *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_broker, a3);
    objc_storeStrong((id *)&v10->_cache, a4);
  }

  return v10;
}

+ (BOOL)_isCheckInSupportedPlatform
{
  return 1;
}

+ (BOOL)_isCurrentLocationSupportedPlatform
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_384 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_384, &__block_literal_global_385);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_386;
  return v2;
}

void __44__PSGProactiveTriggerHandler_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  v1 = [PSGProactiveTriggerHandler alloc];
  v2 = [MEMORY[0x263F5D4D0] sharedInstance];
  v3 = +[PSGStructuredInfoSuggestionCache sharedInstance];
  uint64_t v4 = [(PSGProactiveTriggerHandler *)v1 initWithBroker:v2 cache:v3];
  id v5 = (void *)sharedInstance__pasExprOnceResult_386;
  sharedInstance__pasExprOnceResult_386 = v4;
}

@end