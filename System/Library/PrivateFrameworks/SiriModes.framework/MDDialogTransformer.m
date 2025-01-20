@interface MDDialogTransformer
+ (BOOL)_alwaysPrintSiriResponse;
+ (BOOL)_shouldTransformLegacyAddViews;
+ (BOOL)supportsTransformationForAceCommand:(id)a3;
+ (NSDictionary)dialogIdentifiers;
+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4;
+ (id)_analytics;
+ (id)_configurationDictionary;
+ (id)_firstSnippetInViews:(id)a3;
+ (id)_redundantDUCIds;
+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_sayItForDialog:(id)a3;
+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4;
+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5;
+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4;
+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4;
+ (unint64_t)typeOfAddViews:(id)a3;
+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4;
+ (void)setDialogIdentifiers:(id)a3;
@end

@implementation MDDialogTransformer

+ (NSDictionary)dialogIdentifiers
{
  return (NSDictionary *)(id)dialogIdentifiers;
}

+ (void)setDialogIdentifiers:(id)a3
{
}

+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  [a1 _logModeComputationForAceCommand:v7 mode:a4];
  uint64_t v8 = [a1 typeOfAddViews:v7];
  if (v8 == 2)
  {
    v13 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      +[MDDialogTransformer transformAddViews:forMode:](v13, v7);
    }
    v4 = (void *)[v7 copy];
    [v4 setViews:MEMORY[0x263EFFA68]];
  }
  else
  {
    if (v8 == 1)
    {
      v14 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = [v7 aceId];
        int v18 = 136315394;
        v19 = "+[MDDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_22161A000, v15, OS_LOG_TYPE_DEFAULT, "%s #modes Found dialog AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v12 = [a1 _transformDialogAddViews:v7 forMode:a4];
    }
    else
    {
      if (v8) {
        goto LABEL_14;
      }
      v9 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = [v7 aceId];
        int v18 = 136315394;
        v19 = "+[MDDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_22161A000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Found legacy AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v12 = [a1 _transformLegacyAddViews:v7 forMode:a4];
    }
    v4 = (void *)v12;
  }
LABEL_14:

  return v4;
}

+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [a1 _logModeComputationForAceCommand:v6 mode:a4];
  id v7 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [v6 aceId];
    v11 = [v6 dialogs];
    *(_DWORD *)buf = 136315650;
    v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
    __int16 v39 = 2112;
    v40 = v10;
    __int16 v41 = 2048;
    uint64_t v42 = [v11 count];
    _os_log_impl(&dword_22161A000, v9, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) contains %tu dialogs", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v13 = [a1 _alwaysPrintSiriResponse];
  if (v13)
  {
    v14 = *v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
      _os_log_impl(&dword_22161A000, v14, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = objc_msgSend(v6, "dialogs", v6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ((v13 | [v20 spokenOnly] ^ 1) == 1)
        {
          v21 = [a1 _utteranceViewForDialog:v20 mode:a4 printedOnly:1];
          [v12 addObject:v21];
        }
        if (([v20 printedOnly] & 1) == 0 && a4 <= 3 && a4 != 2)
        {
          uint64_t v22 = [a1 _sayItForDialog:v20];
          [v32 addObject:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v17);
  }

  v23 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    v25 = [v31 aceId];
    uint64_t v26 = [v12 count];
    uint64_t v27 = [v32 count];
    *(_DWORD *)buf = 136315906;
    v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
    __int16 v39 = 2112;
    v40 = v25;
    __int16 v41 = 2048;
    uint64_t v42 = v26;
    __int16 v43 = 2048;
    uint64_t v44 = v27;
    _os_log_impl(&dword_22161A000, v24, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) transformed into %tu utterance views and %tu sayIts.", buf, 0x2Au);
  }
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v12 count])
  {
    v29 = [a1 _addViewsForAddDialogs:v31 views:v12];
    [v28 addObject:v29];
  }
  if ([v32 count]) {
    [v28 addObjectsFromArray:v32];
  }

  return v28;
}

+ (BOOL)supportsTransformationForAceCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (unint64_t)typeOfAddViews:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = objc_msgSend(a3, "views", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        v7 |= objc_opt_isKindOfClass();
        v11 = [v10 dialog];
        LODWORD(v10) = v11 != 0;

        v6 |= v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);

    if (v7 & v6)
    {
      id v12 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "+[MDDialogTransformer typeOfAddViews:]";
        _os_log_impl(&dword_22161A000, v12, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews has type: AddViewsTypeMixed", buf, 0xCu);
      }
      return 2;
    }
    if (v6)
    {
      v14 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "+[MDDialogTransformer typeOfAddViews:]";
        _os_log_impl(&dword_22161A000, v14, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews has type: AddViewsTypeDialog", buf, 0xCu);
      }
      return 1;
    }
  }
  else
  {
  }
  v15 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[MDDialogTransformer typeOfAddViews:]";
    _os_log_impl(&dword_22161A000, v15, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews has type: AddViewsTypeLegacy", buf, 0xCu);
  }
  return 0;
}

+ (BOOL)_shouldTransformLegacyAddViews
{
  return 1;
}

+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (([a1 _shouldTransformLegacyAddViews] & 1) == 0) {
    goto LABEL_12;
  }
  if (a4 < 2 || a4 == 3)
  {
    if (![a1 _alwaysPrintSiriResponse])
    {
      id v11 = [a1 _removeUtteranceViewsFromAddViews:v7 forMode:a4];
      goto LABEL_13;
    }
    v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      v15 = "+[MDDialogTransformer _transformLegacyAddViews:forMode:]";
      _os_log_impl(&dword_22161A000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v14, 0xCu);
    }
LABEL_12:
    id v11 = v7;
LABEL_13:
    uint64_t v4 = v11;
    goto LABEL_14;
  }
  if (a4 == 2)
  {
    if ([a1 _alwaysPrintSiriResponse])
    {
      uint64_t v8 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        v15 = "+[MDDialogTransformer _transformLegacyAddViews:forMode:]";
        _os_log_impl(&dword_22161A000, v8, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v14, 0xCu);
      }
      id v9 = v7;
    }
    else
    {
      id v9 = [a1 _removeRedundantUtteranceViewsFromAddViews:v7 forMode:2];
    }
    int v13 = v9;
    uint64_t v4 = [a1 _removeSpeakableTextFromAddViews:v9 forMode:2];
  }
LABEL_14:

  return v4;
}

+ (id)_configurationDictionary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MDDialogTransformer__configurationDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_configurationDictionary_onceToken != -1) {
    dispatch_once(&_configurationDictionary_onceToken, block);
  }
  v2 = (void *)_configurationDictionary_configDictionary;

  return v2;
}

void __47__MDDialogTransformer__configurationDictionary__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"ModesConfiguration" ofType:@"plist"];

  uint64_t v2 = [NSDictionary dictionaryWithContentsOfFile:v1];
  id v3 = (void *)_configurationDictionary_configDictionary;
  _configurationDictionary_configDictionary = v2;

  if (!_configurationDictionary_configDictionary)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __47__MDDialogTransformer__configurationDictionary__block_invoke_cold_1();
    }
    uint64_t v4 = (void *)_configurationDictionary_configDictionary;
    _configurationDictionary_configDictionary = MEMORY[0x263EFFA78];
  }
}

+ (id)_redundantDUCIds
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MDDialogTransformer__redundantDUCIds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_redundantDUCIds_onceToken != -1) {
    dispatch_once(&_redundantDUCIds_onceToken, block);
  }
  uint64_t v2 = (void *)_redundantDUCIds_redundantDUCIds;

  return v2;
}

void __39__MDDialogTransformer__redundantDUCIds__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) _configurationDictionary];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"redundantDUCs"];

  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = (void *)_redundantDUCIds_redundantDUCIds;
  _redundantDUCIds_redundantDUCIds = v3;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)_redundantDUCIds_redundantDUCIds;
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "lowercaseString", (void)v12);
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (BOOL)_alwaysPrintSiriResponse
{
  uint64_t v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 siriResponseShouldAlwaysPrint];

  return v3;
}

+ (id)_firstSnippetInViews:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 views];
  uint64_t v7 = [a1 _firstSnippetInViews:v6];

  if (v7)
  {
    uint64_t v27 = v7;
    v29 = [a1 _redundantDUCIds];
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v9 = [v5 views];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            uint64_t v16 = [v15 dialogIdentifier];
            uint64_t v17 = (void *)v16;
            long long v18 = &stru_26D3A5A48;
            if (v16) {
              long long v18 = (__CFString *)v16;
            }
            long long v19 = v18;

            __int16 v20 = [(__CFString *)v19 lowercaseString];
            int v21 = [v29 containsObject:v20];

            if (v21)
            {
              uint64_t v22 = (void *)*MEMORY[0x263F28348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = v22;
                v24 = MDModeGetName(a4);
                *(_DWORD *)buf = 136315650;
                long long v35 = "+[MDDialogTransformer _removeRedundantUtteranceViewsFromAddViews:forMode:]";
                __int16 v36 = 2112;
                v37 = v19;
                __int16 v38 = 2112;
                __int16 v39 = v24;
                _os_log_impl(&dword_22161A000, v23, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing redundant AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);
              }
            }
            else
            {
              [v8 addObject:v15];
            }
          }
          else
          {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v11);
    }

    id v25 = (id)[v5 copy];
    [v25 setViews:v8];

    uint64_t v7 = v27;
  }
  else
  {
    id v25 = v5;
  }

  return v25;
}

+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v54 = a3;
  [v54 views];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v66;
    uint64_t v55 = *(void *)v66;
    do
    {
      uint64_t v7 = 0;
      uint64_t v56 = v5;
      do
      {
        if (*(void *)v66 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v65 + 1) + 8 * v7);
        long long v9 = [v8 speakableText];

        if (v9)
        {
          uint64_t v10 = [v8 speakableText];
          uint64_t v11 = [v10 length];

          if (v11)
          {
            uint64_t v12 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              long long v13 = v12;
              uint64_t v14 = [v8 speakableText];
              id v15 = [v8 aceId];
              uint64_t v16 = MDModeGetName(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v14;
              __int16 v74 = 2112;
              v75 = v15;
              __int16 v76 = 2112;
              v77 = v16;
              _os_log_impl(&dword_22161A000, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from view %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v8 setSpeakableText:0];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v8;
          long long v18 = [v17 speakableSuffix];
          uint64_t v19 = [v18 length];

          if (v19)
          {
            __int16 v20 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              int v21 = v20;
              uint64_t v22 = [v17 speakableSuffix];
              uint64_t v23 = [v17 aceId];
              v24 = MDModeGetName(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v22;
              __int16 v74 = 2112;
              v75 = v23;
              __int16 v76 = 2112;
              v77 = v24;
              _os_log_impl(&dword_22161A000, v21, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableSuffix '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v17 setSpeakableSuffix:0];
          id v25 = [v17 speakableDelimiter];
          uint64_t v26 = [v25 length];

          if (v26)
          {
            uint64_t v27 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              id v28 = v27;
              v29 = [v17 speakableDelimiter];
              long long v30 = [v17 aceId];
              long long v31 = MDModeGetName(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v29;
              __int16 v74 = 2112;
              v75 = v30;
              __int16 v76 = 2112;
              v77 = v31;
              _os_log_impl(&dword_22161A000, v28, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          uint64_t v59 = v7;
          [v17 setSpeakableDelimiter:0];
          long long v32 = [v17 speakableFinalDelimiter];
          uint64_t v33 = [v32 length];

          if (v33)
          {
            long long v34 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              long long v35 = v34;
              __int16 v36 = [v17 speakableFinalDelimiter];
              v37 = [v17 aceId];
              __int16 v38 = MDModeGetName(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v36;
              __int16 v74 = 2112;
              v75 = v37;
              __int16 v76 = 2112;
              v77 = v38;
              _os_log_impl(&dword_22161A000, v35, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableFinalDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v17 setSpeakableFinalDelimiter:0];
          v58 = v17;
          __int16 v39 = [v17 items];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v62 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                v45 = [v44 speakableText];
                uint64_t v46 = [v45 length];

                if (v46)
                {
                  v47 = (void *)*MEMORY[0x263F28348];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
                  {
                    v48 = v47;
                    v49 = [v44 speakableText];
                    v50 = [v44 aceId];
                    v51 = MDModeGetName(a4);
                    *(_DWORD *)buf = 136315906;
                    v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
                    __int16 v72 = 2112;
                    v73 = v49;
                    __int16 v74 = 2112;
                    v75 = v50;
                    __int16 v76 = 2112;
                    v77 = v51;
                    _os_log_impl(&dword_22161A000, v48, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from SAUIListItem %@ for current mode: %@", buf, 0x2Au);
                  }
                }
                [v44 setSpeakableText:0];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }
            while (v41);
          }
          [v58 setItems:v39];

          uint64_t v6 = v55;
          uint64_t v5 = v56;
          uint64_t v7 = v59;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v5);
  }
  v52 = (void *)[v54 copy];
  [v52 setViews:obj];

  return v52;
}

+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 views];
  uint64_t v7 = [a1 _firstSnippetInViews:v6];
  if (v7)
  {
    id v38 = a1;
    uint64_t v42 = v5;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v40 = v7;
    long long v9 = [v7 listenAfterSpeaking];
    [v9 BOOLValue];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v41 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v59 count:16];
    uint64_t v44 = v8;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v48;
      int v14 = 1;
      id v15 = v45;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          id v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            uint64_t v19 = [v18 speakableText];

            if (v19)
            {
              __int16 v20 = [v18 speakableText];
              [v8 addObject:v20];

              v14 &= [v18 canUseServerTTS];
            }
            int v21 = objc_msgSend(v18, "dialogIdentifier", v38);

            if (v21)
            {
              uint64_t v22 = [v18 dialogIdentifier];
              [v15 addObject:v22];
            }
            uint64_t v23 = [v18 listenAfterSpeaking];
            [v23 BOOLValue];

            v24 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              id v25 = v24;
              uint64_t v26 = [v18 dialogIdentifier];
              uint64_t v27 = MDModeGetName(a4);
              *(_DWORD *)buf = 136315650;
              id v54 = "+[MDDialogTransformer _removeUtteranceViewsFromAddViews:forMode:]";
              __int16 v55 = 2112;
              uint64_t v56 = v26;
              __int16 v57 = 2112;
              v58 = v27;
              _os_log_impl(&dword_22161A000, v25, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              id v8 = v44;
              id v15 = v45;
            }
          }
          else
          {
            [v46 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v12);
    }
    else
    {
      LOBYTE(v14) = 1;
    }

    uint64_t v7 = v40;
    v29 = [v40 speakableText];

    if (v29)
    {
      long long v30 = [v40 speakableText];
      [v8 addObject:v30];
    }
    if (objc_msgSend(v8, "count", v38))
    {
      long long v31 = [v8 componentsJoinedByString:@"\n"];
      [v40 setSpeakableText:v31];
      [v40 setCanUseServerTTS:v14 & 1];
    }
    if (v45)
    {
      long long v32 = [v40 aceId];

      if (v32)
      {
        uint64_t v33 = (void *)MEMORY[0x263EFF9A0];
        v51[0] = @"snippetAceId";
        long long v34 = [v40 aceId];
        v51[1] = @"dialogIdentifiers";
        v52[0] = v34;
        v52[1] = v45;
        long long v35 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
        __int16 v36 = [v33 dictionaryWithDictionary:v35];
        [v39 setDialogIdentifiers:v36];
      }
    }
    id v5 = v42;
    id v28 = (id)[v42 copy];
    [v28 setViews:v46];

    uint64_t v6 = v41;
  }
  else
  {
    id v28 = v5;
  }

  return v28;
}

+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v35 = v6;
  id v8 = [v6 views];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    __int16 v39 = v8;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        int v14 = [v13 dialog];
        if (!v14)
        {
          [v7 addObject:v13];
          goto LABEL_16;
        }
        if ([a1 _alwaysPrintSiriResponse])
        {
          id v15 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            long long v48 = "+[MDDialogTransformer _transformDialogAddViews:forMode:]";
            _os_log_impl(&dword_22161A000, v15, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
          }
          uint64_t v16 = objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, objc_msgSend(v14, "printedOnly"));
          v52[0] = v16;
          v52[1] = v13;
          id v17 = (void *)MEMORY[0x263EFF8C0];
          id v18 = v52;
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v16 = [a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:0];
          v51[0] = v16;
          v51[1] = v13;
          id v17 = (void *)MEMORY[0x263EFF8C0];
          id v18 = v51;
LABEL_15:
          uint64_t v19 = [v17 arrayWithObjects:v18 count:2];
          [v7 addObjectsFromArray:v19];

          goto LABEL_16;
        }
        if (a4 < 2 || a4 == 3)
        {
          if ([v14 printedOnly])
          {
            id v23 = v13;
            v24 = [a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:1];
            [v7 addObject:v24];
          }
          else
          {
            id v23 = (id)[v13 copy];
            id v25 = [a1 _speakableTextForDialog:v14 mode:a4];
            [v23 setSpeakableText:v25];

            objc_msgSend(v23, "setCanUseServerTTS:", objc_msgSend(v14, "canUseServerTTS"));
            uint64_t v26 = [v14 dialogIdentifier];
            if (v26)
            {
              uint64_t v27 = (void *)v26;
              id v28 = [v23 aceId];

              if (v28)
              {
                v29 = (void *)MEMORY[0x263EFF9A0];
                v45[0] = @"snippetAceId";
                id v38 = [v23 aceId];
                v45[1] = @"dialogIdentifiers";
                v46[0] = v38;
                v37 = [v14 dialogIdentifier];
                uint64_t v44 = v37;
                __int16 v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
                v46[1] = v36;
                long long v30 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
                long long v31 = [v29 dictionaryWithDictionary:v30];
                [a1 setDialogIdentifiers:v31];
              }
              id v8 = v39;
            }
          }
          goto LABEL_34;
        }
        if (a4 == 2)
        {
          if ([v14 spokenOnly])
          {
            __int16 v20 = (void *)*MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              int v21 = v20;
              uint64_t v22 = [v14 dialogIdentifier];
              *(_DWORD *)buf = 136315394;
              long long v48 = "+[MDDialogTransformer _transformDialogAddViews:forMode:]";
              __int16 v49 = 2112;
              long long v50 = v22;
              _os_log_impl(&dword_22161A000, v21, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) for DisplayOnly Mode since it is Spoken Only", buf, 0x16u);

              id v8 = v39;
              goto LABEL_32;
            }
          }
          else
          {
            int v21 = [a1 _utteranceViewForDialog:v14 mode:2 printedOnly:0];
            [v7 addObject:v21];
LABEL_32:
          }
          id v23 = v13;
          goto LABEL_34;
        }
        id v23 = 0;
LABEL_34:
        [v7 addObject:v23];

LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v32 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
      uint64_t v10 = v32;
    }
    while (v32);
  }

  uint64_t v33 = (void *)[v35 copy];
  [v33 setViews:v7];

  return v33;
}

+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v8 dialogIdentifier];
    uint64_t v12 = MDModeGetName(a4);
    int v36 = 136315650;
    v37 = "+[MDDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    __int16 v38 = 2112;
    __int16 v39 = v11;
    __int16 v40 = 2112;
    long long v41 = v12;
    _os_log_impl(&dword_22161A000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into an Utterance View for current mode: %@", (uint8_t *)&v36, 0x20u);
  }
  id v13 = objc_alloc_init(MEMORY[0x263F64EF0]);
  int v14 = [v8 aceId];
  [v13 setAceId:v14];

  id v15 = [v8 refId];
  [v13 setRefId:v15];

  objc_msgSend(v13, "setCanUseServerTTS:", objc_msgSend(v8, "canUseServerTTS"));
  uint64_t v16 = [v8 configuration];
  id v17 = [v16 context];
  [v13 setContext:v17];

  id v18 = [v8 dialogIdentifier];
  [v13 setDialogIdentifier:v18];

  uint64_t v19 = [v8 metricsContext];
  [v13 setMetricsContext:v19];

  __int16 v20 = [v8 dialogCategory];
  [v13 setDialogCategory:v20];

  if (v5)
  {
    int v21 = [v8 content];
    id v22 = [v21 text];
LABEL_5:

LABEL_6:
    id v23 = 0;
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
        v24 = [v8 content];
        id v22 = [v24 text];

        id v25 = a1;
        id v26 = v8;
        unint64_t v27 = a4;
        break;
      case 1uLL:
        id v28 = [v8 caption];
        v29 = [v28 text];
        long long v30 = v29;
        if (v29)
        {
          id v22 = v29;
        }
        else
        {
          uint64_t v33 = [v8 content];
          id v22 = [v33 text];
        }
        id v25 = a1;
        id v26 = v8;
        unint64_t v27 = 1;
        break;
      case 2uLL:
        int v21 = [v8 caption];
        long long v31 = [v21 text];
        uint64_t v32 = v31;
        if (v31)
        {
          id v22 = v31;
        }
        else
        {
          long long v35 = [v8 content];
          id v22 = [v35 text];
        }
        goto LABEL_5;
      default:
        id v22 = 0;
        goto LABEL_6;
    }
    id v23 = [v25 _speakableTextForDialog:v26 mode:v27];
  }
  [v13 setText:v22];
  [v13 setSpeakableText:v23];

  return v13;
}

+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
      id v7 = (void *)*MEMORY[0x263F28348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      id v8 = v7;
      uint64_t v9 = [v6 dialogIdentifier];
      *(_DWORD *)v24 = 136315394;
      *(void *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v9;
      uint64_t v10 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for VoiceOnly Mode";
      goto LABEL_4;
    case 1uLL:
      int v14 = [v5 caption];

      id v15 = (void *)*MEMORY[0x263F28348];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          id v17 = v15;
          id v18 = [v6 dialogIdentifier];
          *(_DWORD *)v24 = 136315394;
          *(void *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v24[12] = 2112;
          *(void *)&v24[14] = v18;
          _os_log_impl(&dword_22161A000, v17, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CAPTION into speakable text for DisplayForward Mode", v24, 0x16u);
        }
        uint64_t v11 = [v6 caption];
        uint64_t v12 = [v11 speakableTextOverride];
        if (v12)
        {
LABEL_11:
          a4 = v12;
          goto LABEL_19;
        }
        id v13 = [v6 caption];
      }
      else
      {
        if (v16)
        {
          id v8 = v15;
          uint64_t v9 = [v6 dialogIdentifier];
          *(_DWORD *)v24 = 136315394;
          *(void *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v24[12] = 2112;
          *(void *)&v24[14] = v9;
          uint64_t v10 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for DisplayForward Mode (Caption is nil)";
LABEL_4:
          _os_log_impl(&dword_22161A000, v8, OS_LOG_TYPE_DEFAULT, v10, v24, 0x16u);
        }
LABEL_5:
        uint64_t v11 = objc_msgSend(v6, "content", *(_OWORD *)v24, *(void *)&v24[16], v25);
        uint64_t v12 = [v11 speakableTextOverride];
        if (v12) {
          goto LABEL_11;
        }
        id v13 = [v6 content];
      }
      id v22 = v13;
      a4 = [v13 text];

LABEL_19:
LABEL_20:

      return (id)a4;
    case 2uLL:
      uint64_t v19 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = v19;
        int v21 = [v6 dialogIdentifier];
        *(_DWORD *)v24 = 136315394;
        *(void *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v24[12] = 2112;
        *(void *)&v24[14] = v21;
        _os_log_impl(&dword_22161A000, v20, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) speakable text for DisplayOnly Mode", v24, 0x16u);
      }
      a4 = 0;
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

+ (id)_sayItForDialog:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 dialogIdentifier];
    int v23 = 136315394;
    v24 = "+[MDDialogTransformer _sayItForDialog:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_22161A000, v5, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into a SayIt", (uint8_t *)&v23, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F65008]);
  id v8 = [v3 aceId];
  [v7 setAceId:v8];

  uint64_t v9 = [v3 refId];
  [v7 setRefId:v9];

  objc_msgSend(v7, "setCanUseServerTTS:", objc_msgSend(v3, "canUseServerTTS"));
  uint64_t v10 = [v3 configuration];
  uint64_t v11 = [v10 context];
  [v7 setContext:v11];

  uint64_t v12 = [v3 dialogIdentifier];
  [v7 setDialogIdentifier:v12];

  id v13 = [v3 configuration];
  int v14 = [v13 gender];
  [v7 setGender:v14];

  id v15 = [v3 configuration];
  BOOL v16 = [v15 languageCode];
  [v7 setLanguageCode:v16];

  id v17 = [v3 content];
  id v18 = [v17 speakableTextOverride];
  if (v18)
  {
    [v7 setMessage:v18];
  }
  else
  {
    uint64_t v19 = [v3 content];
    __int16 v20 = [v19 text];
    [v7 setMessage:v20];
  }
  int v21 = [v3 metricsContext];
  [v7 setMetricsContext:v21];

  return v7;
}

+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [v5 aceId];
    int v20 = 136315394;
    int v21 = "+[MDDialogTransformer _addViewsForAddDialogs:views:]";
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl(&dword_22161A000, v8, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming AddDialog (aceId = %@) into an AddViews", (uint8_t *)&v20, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F64ED8]);
  uint64_t v11 = [v5 aceId];
  [v10 setAceId:v11];

  uint64_t v12 = [v5 refId];
  [v10 setRefId:v12];

  id v13 = [v5 metricsContext];
  [v10 setMetricsContext:v13];

  int v14 = [v5 listenAfterSpeaking];

  if (v14)
  {
    id v15 = [v6 lastObject];
    BOOL v16 = [v5 listenAfterSpeaking];
    [v15 setListenAfterSpeaking:v16];

    id v17 = [v6 lastObject];
    id v18 = [v5 listenAfterSpeakingBehavior];
    [v17 setListenAfterSpeakingBehavior:v18];
  }
  [v10 setViews:v6];

  return v10;
}

+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4
{
  id v12 = a3;
  id v6 = [v12 aceId];

  if (v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    id v8 = [v12 aceId];
    [v7 setObject:v8 forKey:@"aceId"];

    uint64_t v9 = MDModeGetNameForAnalytics(a4);
    [v7 setObject:v9 forKey:@"mode"];

    id v10 = [v12 encodedClassName];
    [v7 setObject:v10 forKey:@"aceClass"];

    uint64_t v11 = [a1 _analytics];
    [v11 logEventWithType:5602 context:v7];
  }
}

+ (id)_analytics
{
  return (id)[MEMORY[0x263F283F8] sharedAnalytics];
}

+ (void)transformAddViews:(void *)a1 forMode:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 aceId];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22161A000, v3, OS_LOG_TYPE_ERROR, "%s #modes Invalid AddViews (aceId = %@). Both AssistantUtteranceView and Dialog on the same AddViews is unsupported.", (uint8_t *)v5, 0x16u);
}

void __47__MDDialogTransformer__configurationDictionary__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22161A000, v0, OS_LOG_TYPE_ERROR, "%s #modes Failed to load configuration file: %@", (uint8_t *)v1, 0x16u);
}

@end