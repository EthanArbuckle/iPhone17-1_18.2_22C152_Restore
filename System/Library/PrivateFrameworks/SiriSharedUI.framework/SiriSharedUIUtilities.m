@interface SiriSharedUIUtilities
+ (BOOL)applicationBundleIdentifierIsThirdParty:(id)a3;
+ (BOOL)contentDiffersBetweenItems:(id)a3 andItems:(id)a4;
+ (BOOL)emojiIsValid:(__EmojiTokenWrapper *)a3;
+ (BOOL)reportConcernButtonEnabled;
+ (BOOL)utteranceViewEligibleForLightEffects:(id)a3;
+ (id)_emojisToNotInclude;
+ (id)_ineligibleDialogCategoriesForLightEffects;
+ (id)cardFromSnippet:(id)a3;
+ (id)filterTranscriptItemsForRFPluginContent:(id)a3;
+ (id)filterTranscriptItemsForSAEDialogBoxContent:(id)a3;
+ (id)substringRangesContainingEmojiInString:(id)a3;
+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3;
+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3 isAttending:(BOOL)a4;
@end

@implementation SiriSharedUIUtilities

+ (id)substringRangesContainingEmojiInString:(id)a3
{
  id v3 = a3;
  if (CEMStringContainsEmoji())
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__0;
    v10 = __Block_byref_object_dispose__0;
    id v11 = [MEMORY[0x263EFF980] array];
    [v3 length];
    CEMEnumerateEmojiTokensInStringWithBlock();
    id v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v4 = (id)MEMORY[0x263EFFA68];
  }

  return v4;
}

void __64__SiriSharedUIUtilities_substringRangesContainingEmojiInString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v4 && [*(id *)(a1 + 40) emojiIsValid:a2])
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v9];
  }
}

+ (BOOL)emojiIsValid:(__EmojiTokenWrapper *)a3
{
  BOOL v4 = CEMEmojiTokenGetString();
  v5 = [a1 _emojisToNotInclude];
  char v6 = [v5 containsObject:v4] ^ 1;

  return v6;
}

+ (id)_emojisToNotInclude
{
  if (_emojisToNotInclude_onceToken != -1) {
    dispatch_once(&_emojisToNotInclude_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_emojisToNotInclude_emojis;
  return v2;
}

uint64_t __44__SiriSharedUIUtilities__emojisToNotInclude__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C1AE548];
  uint64_t v1 = _emojisToNotInclude_emojis;
  _emojisToNotInclude_emojis = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return qword_20CA89008[a3];
  }
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    +[SiriSharedUIUtilities orbViewModeForSiriSessionState:](v5, a3);
  }
  return 0;
}

+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3 isAttending:(BOOL)a4
{
  int64_t v4 = a3;
  switch(a3)
  {
    case 0:
    case 3:
      if (a4) {
        int64_t v4 = 1;
      }
      else {
        int64_t v4 = 3;
      }
      break;
    case 1:
      return v4;
    case 2:
      int64_t v4 = 2;
      break;
    default:
      v5 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        +[SiriSharedUIUtilities orbViewModeForSiriSessionState:isAttending:](v5, v4);
      }
      int64_t v4 = 0;
      break;
  }
  return v4;
}

+ (BOOL)applicationBundleIdentifierIsThirdParty:(id)a3
{
  id v3 = a3;
  int64_t v4 = v3;
  BOOL v5 = v3
    && (![v3 hasPrefix:@"com.apple."]
     || [v4 isEqualToString:@"com.apple.siri.Caviar"]);

  return v5;
}

+ (id)filterTranscriptItemsForRFPluginContent:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x263F65130];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "aceObject", (void)v17);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v12 = [v9 aceObject];
          v13 = (void *)[v12 copy];

          v14 = [v13 itemType];
          char v15 = [v14 isEqualToString:v7];

          if (v15) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (BOOL)reportConcernButtonEnabled
{
  int v2 = AFDeviceSupportsSystemAssistantExperience();
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];
    char v4 = [v3 BOOLForKey:@"reportConcernButtonEnabled"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)utteranceViewEligibleForLightEffects:(id)a3
{
  id v3 = a3;
  char v4 = [v3 dialogCategory];

  BOOL v8 = 1;
  if (v4)
  {
    uint64_t v5 = [v3 dialogCategory];
    uint64_t v6 = [(id)objc_opt_class() _ineligibleDialogCategoriesForLightEffects];
    char v7 = [v6 containsObject:v5];

    if (v7) {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (id)_ineligibleDialogCategoriesForLightEffects
{
  if (_ineligibleDialogCategoriesForLightEffects_onceToken != -1) {
    dispatch_once(&_ineligibleDialogCategoriesForLightEffects_onceToken, &__block_literal_global_37);
  }
  int v2 = (void *)_ineligibleDialogCategoriesForLightEffects_ineligibleCategories;
  return v2;
}

uint64_t __67__SiriSharedUIUtilities__ineligibleDialogCategoriesForLightEffects__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26C1AE560];
  uint64_t v1 = _ineligibleDialogCategoriesForLightEffects_ineligibleCategories;
  _ineligibleDialogCategoriesForLightEffects_ineligibleCategories = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)cardFromSnippet:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "siriui_card_compact");
  uint64_t v5 = [v4 backingCard];
  uint64_t v6 = [v5 cardSections];
  if (v6) {
    objc_msgSend(v3, "siriui_card_compact");
  }
  else {
  char v7 = objc_msgSend(v3, "siriui_card");
  }

  BOOL v8 = [v7 backingCard];

  return v8;
}

+ (BOOL)contentDiffersBetweenItems:(id)a3 andItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 == [v7 count])
  {
    if ([v6 count])
    {
      uint64_t v9 = 0;
      id v31 = v7;
      v32 = v6;
      while (1)
      {
        v10 = [v6 objectAtIndex:v9];
        id v11 = [v10 aceObject];

        v12 = [v7 objectAtIndex:v9];
        v13 = [v12 aceObject];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          goto LABEL_13;
        }
        id v14 = v11;
        id v15 = v13;
        v16 = [v14 sash];
        long long v17 = [v16 applicationBundleIdentifier];
        long long v18 = [v15 sash];
        long long v19 = [v18 applicationBundleIdentifier];
        if (![v17 isEqualToString:v19]) {
          break;
        }
        uint64_t v33 = v9;
        id v20 = a1;
        [v14 sash];
        v21 = v35 = v16;
        uint64_t v22 = [v21 title];
        v23 = [v15 sash];
        v24 = [v23 title];
        int v34 = [v22 isEqualToString:v24];

        if (!v34) {
          goto LABEL_16;
        }
        a1 = v20;
        [(id)objc_opt_class() cardFromSnippet:v14];
        v26 = v25 = v14;
        v27 = [(id)objc_opt_class() cardFromSnippet:v15];
        char v28 = objc_msgSend(v26, "afui_hasContentEqualTo:", v27);

        id v7 = v31;
        id v6 = v32;
        if (v28)
        {
          uint64_t v9 = v33 + 1;
          if ([v32 count] > (unint64_t)(v33 + 1)) {
            continue;
          }
        }
        char v29 = v28 ^ 1;
        goto LABEL_14;
      }

LABEL_16:
      char v29 = 1;
      id v7 = v31;
      id v6 = v32;
    }
    else
    {
      char v29 = 0;
    }
  }
  else
  {
LABEL_13:
    char v29 = 1;
  }
LABEL_14:

  return v29;
}

+ (id)filterTranscriptItemsForSAEDialogBoxContent:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (!v3) {
    goto LABEL_39;
  }
  uint64_t v5 = v3;
  uint64_t v6 = *(void *)v52;
  *(void *)&long long v4 = 136315394;
  long long v35 = v4;
  uint64_t v37 = *(void *)v52;
  do
  {
    uint64_t v7 = 0;
    uint64_t v38 = v5;
    do
    {
      if (*(void *)v52 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v8, "aceObject", v35);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_37;
      }
      v39 = v8;
      v43 = [v8 aceObject];
      id v11 = +[SiriSharedUIUtilities cardFromSnippet:](SiriSharedUIUtilities, "cardFromSnippet:");
      v44 = (void *)[v11 copy];
      id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v45 = v11;
      v13 = [v11 cardSections];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v59 count:16];
      BOOL v42 = v14 != 0;
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v41 = v7;
        char v16 = 0;
        uint64_t v17 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v48 != v17) {
              objc_enumerationMutation(v13);
            }
            long long v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            int v20 = [v19 shouldShowInSmartDialog];
            objc_opt_class();
            char v21 = objc_opt_isKindOfClass();
            if (v20)
            {
              if (v21)
              {
                uint64_t v22 = [v19 cardSections];
                [v12 addObjectsFromArray:v22];
              }
              else
              {
                [v12 addObject:v19];
              }
              char v16 = 1;
            }
            else if (v21)
            {
              id v23 = v19;
              v24 = [v23 cardSections];
              uint64_t v25 = [v24 count];

              if (v25)
              {
                v26 = [v23 cardSections];
                v27 = [v26 objectAtIndexedSubscript:0];

                if ([v27 shouldShowInSmartDialog])
                {
                  char v28 = [v23 cardSections];
                  [v12 addObjectsFromArray:v28];

                  char v16 = 1;
                }
              }
            }
            else
            {
              [v46 addObject:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v15);

        if ((v16 & 1) == 0)
        {
          BOOL v33 = 0;
          uint64_t v6 = v37;
          uint64_t v5 = v38;
          uint64_t v7 = v41;
          v30 = v43;
          goto LABEL_36;
        }
        char v29 = *MEMORY[0x263F28348];
        uint64_t v7 = v41;
        v30 = v43;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v35;
          v56 = "+[SiriSharedUIUtilities filterTranscriptItemsForSAEDialogBoxContent:]";
          __int16 v57 = 2112;
          id v58 = v46;
          _os_log_impl(&dword_20C9D5000, v29, OS_LOG_TYPE_DEFAULT, "%s #dialogbox found card content for dialog box: %@", buf, 0x16u);
        }
        [v45 setCardSections:v46];
        v13 = (void *)[v43 copy];
        id v31 = (void *)[objc_alloc(MEMORY[0x263F67B20]) initWithFacade:v45];
        v32 = [v31 data];
        [v13 setCardData:v32];

        if ([v46 count]) {
          [v45 setCardSections:v46];
        }
        else {
          [v39 setViewController:0];
        }
        uint64_t v6 = v37;
        uint64_t v5 = v38;
        [v44 setCardSections:v12];
        id v36 = v44;
      }
      else
      {
        v30 = v43;
      }

      BOOL v33 = v42;
LABEL_36:

      if (v33) {
        goto LABEL_40;
      }
LABEL_37:
      ++v7;
    }
    while (v7 != v5);
    uint64_t v5 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  }
  while (v5);
LABEL_39:
  id v36 = 0;
LABEL_40:

  return v36;
}

+ (void)orbViewModeForSiriSessionState:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = [v3 numberWithInteger:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C9D5000, v6, v7, "%s unhandled siri session state: %@. Falling back to SUICOrbViewModeOff", v8, v9, v10, v11, 2u);
}

+ (void)orbViewModeForSiriSessionState:(void *)a1 isAttending:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = [v3 numberWithInteger:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C9D5000, v6, v7, "%s unhandled siri session state: %@. Falling back to SUICOrbViewModeOff", v8, v9, v10, v11, 2u);
}

@end