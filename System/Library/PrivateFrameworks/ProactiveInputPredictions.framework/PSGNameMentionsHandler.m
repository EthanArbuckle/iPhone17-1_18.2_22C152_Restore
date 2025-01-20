@interface PSGNameMentionsHandler
+ (id)sharedInstance;
- (id)getNameMentionsTriggerForContext:(id)a3 recipientNames:(id)a4 availableApps:(id)a5 localeIdentifier:(id)a6 explanationSet:(id)a7;
- (id)getPredictedItemsForTrigger:(id)a3 recipientNames:(id)a4 bundleIdentifier:(id)a5 maxItems:(unint64_t)a6;
@end

@implementation PSGNameMentionsHandler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PSGNameMentionsHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_399 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_399, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_400;
  return v2;
}

void __40__PSGNameMentionsHandler_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_400;
  sharedInstance__pasExprOnceResult_400 = v1;
}

- (id)getPredictedItemsForTrigger:(id)a3 recipientNames:(id)a4 bundleIdentifier:(id)a5 maxItems:(unint64_t)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v40 = a5;
  v10 = [v8 triggerAttributes];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F51238]];
  if ([v11 isEqualToString:@"NameMentions"])
  {
    v12 = [v10 objectForKeyedSubscript:@"NamePrefix"];
    v13 = v12;
    if (v12)
    {
      v34 = v11;
      v35 = v10;
      id v37 = v8;
      v33 = v12;
      v14 = [v12 lowercaseString];
      v15 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
      v48 = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      id v36 = v9;
      v17 = [v9 sortedArrayUsingDescriptors:v16];

      v18 = objc_opt_new();
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v17;
      uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        v21 = 0;
        uint64_t v22 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if ([v21 length] && objc_msgSend(v24, "hasPrefix:", v21))
            {
              v25 = psg_default_log_handle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_20A02A000, v25, OS_LOG_TYPE_DEBUG, "Ambiguous name preferred. Skipping more specific name.", buf, 2u);
              }
            }
            else if (![v14 length] {
                   || ([v24 lowercaseString],
            }
                       v26 = objc_claimAutoreleasedReturnValue(),
                       int v27 = [v26 hasPrefix:v14],
                       v26,
                       v27))
            {
              v45[0] = @"name";
              v45[1] = @"bundleID";
              v46[0] = v24;
              v46[1] = @"com.apple.messages.mentions";
              v28 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
              v29 = [[PSGOperationalPredictedItem alloc] initWithItemIdentifier:@"NameMentions" value:v24 bundleIdentifier:v40 operationData:v28];
              [v18 addObject:v29];
              id v30 = v24;

              uint64_t v31 = [v18 count];
              v21 = v30;
              if (v31 == a6) {
                goto LABEL_26;
              }
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
          id v30 = v21;
        }
        while (v20);
      }
      else
      {
        id v30 = 0;
      }
LABEL_26:

      id v9 = v36;
      id v8 = v37;
      v11 = v34;
      v10 = v35;
      v13 = v33;
    }
    else
    {
      v14 = psg_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v8;
        _os_log_fault_impl(&dword_20A02A000, v14, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Name prefix not set in (%@)", buf, 0xCu);
      }
      v18 = 0;
    }
  }
  else
  {
    v13 = psg_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v8;
      _os_log_fault_impl(&dword_20A02A000, v13, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Unexpected trigger (%@) passed into PSGNameMentionsHandler", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (id)getNameMentionsTriggerForContext:(id)a3 recipientNames:(id)a4 availableApps:(id)a5 localeIdentifier:(id)a6 explanationSet:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__once != -1) {
    dispatch_once(&getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__once, &__block_literal_global_422);
  }
  if (![v12 count])
  {
    v34 = psg_default_log_handle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20A02A000, v34, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Empty recipientNames passed in", buf, 2u);
    }
    goto LABEL_34;
  }
  if (([v13 containsObject:@"com.apple.messages.mentions"] & 1) == 0)
  {
    v35 = psg_default_log_handle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v35, OS_LOG_TYPE_ERROR, "[PSGNameMentionsHandler] Mini-app for recipientNames not available", buf, 2u);
    }

    [v15 pushInternalExplanationCode:2];
    goto LABEL_35;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v17)
  {

LABEL_32:
    v34 = psg_default_log_handle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v34, OS_LOG_TYPE_ERROR, "[PSGNameMentionsHandler] All names are empty", buf, 2u);
    }
LABEL_34:

LABEL_35:
    v33 = 0;
    goto LABEL_36;
  }
  uint64_t v18 = v17;
  unint64_t v19 = 0;
  uint64_t v20 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v16);
      }
      unint64_t v22 = [*(id *)(*((void *)&v43 + 1) + 8 * i) length];
      if (v19 <= v22) {
        unint64_t v19 = v22;
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  }
  while (v18);

  if (!v19) {
    goto LABEL_32;
  }
  v23 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v14];
  unint64_t v24 = [v11 length];
  uint64_t v25 = [v11 length];
  if (v24 <= v19) {
    unint64_t v26 = 0;
  }
  else {
    unint64_t v26 = v25 + ~v19;
  }
  if (v24 > v19) {
    uint64_t v27 = v19 + 1;
  }
  else {
    uint64_t v27 = v25;
  }
  uint64_t v28 = objc_msgSend(v11, "rangeOfString:options:range:locale:", @"@", 4, v26, v27, v23);
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  if (v28)
  {
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = psg_default_log_handle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v32, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] No @ symbol found in the input.", buf, 2u);
      }
      v33 = 0;
      goto LABEL_56;
    }
    v32 = objc_msgSend(v11, "substringWithRange:", v28 - 1, 1);
    if ([v32 rangeOfCharacterFromSet:getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet] != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v41 = psg_default_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v32;
        _os_log_debug_impl(&dword_20A02A000, v41, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] Prior is %@, so this @ might be part of an email address", buf, 0xCu);
      }

      v33 = 0;
      goto LABEL_56;
    }
  }
  v32 = [v11 substringFromIndex:v29 + v31];
  if ([v32 length] > v19)
  {
    id v37 = psg_default_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = [v32 length];
      *(_DWORD *)buf = 134218240;
      uint64_t v50 = v38;
      __int16 v51 = 2048;
      unint64_t v52 = v19;
      _os_log_debug_impl(&dword_20A02A000, v37, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] Prefix length %tu > maxLength %tu", buf, 0x16u);
    }
LABEL_54:
    v33 = 0;
    goto LABEL_55;
  }
  if ([v32 length])
  {
    id v37 = [v32 substringToIndex:1];
    v39 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v40 = [v37 rangeOfCharacterFromSet:v39];

    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v42 = psg_default_log_handle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v42, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] First charactrer of prefix is whitespace", buf, 2u);
      }

      goto LABEL_54;
    }
  }
  v47[0] = *MEMORY[0x263F51238];
  v47[1] = @"NamePrefix";
  v48[0] = @"NameMentions";
  v48[1] = v32;
  id v37 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  v33 = [[PSGProactiveTrigger alloc] initWithSourceType:5 category:@"nameMentionsTriggerCategory" attributes:v37];
LABEL_55:

LABEL_56:
LABEL_36:

  return v33;
}

void __120__PSGNameMentionsHandler_getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet___block_invoke()
{
  v0 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v0 addCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  uint64_t v1 = (void *)getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet;
  getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet = (uint64_t)v0;
}

@end