@interface SSQueryIntentManager
+ (BOOL)_demoteParsecForIntent:(id)a3 section:(id)a4 config:(id)a5;
+ (BOOL)_hasMapsPOIResults:(id)a3;
+ (BOOL)_isJaJP:(id)a3;
+ (BOOL)_isParsecSection:(id)a3;
+ (BOOL)isEnabled;
+ (BOOL)isPhotosRelatedIntent:(int)a3;
+ (BOOL)isServerResult:(id)a3;
+ (id)_determineIntentAndStrength:(id)a3;
+ (id)_getParsecMapsDetailedIdentifier:(id)a3;
+ (id)_intentForQueryContext:(id)a3 sections:(id)a4;
+ (id)_sectionConfigurationForIntentType:(id)a3 sections:(id)a4 config:(id)a5;
+ (id)_suggestionConfigurationForIntent:(id)a3 queryContext:(id)a4 config:(id)a5;
+ (id)_suggestionConfigurationOverrideForQueryContext:(id)a3 config:(id)a4;
+ (id)applySectionPolicyForQueryContext:(id)a3 sections:(id)a4;
+ (int)_intentForSection:(id)a3 withTopHit:(BOOL)a4;
+ (int)_nextSectionModeling:(id)a3;
+ (int)_postRetrievalModeling:(id)a3;
+ (int)_prefixLengthModeling:(id)a3;
+ (int)_queryUnderstandingModeling:(id)a3 intentHelper:(id)a4;
+ (int)_ruleBasedIntent:(id)a3;
+ (void)_prepareSectionInformation:(id)a3 intentHelper:(id)a4;
+ (void)setQueryIntentForQueryContext:(id)a3 sections:(id)a4 rankingInfo:(id)a5;
@end

@implementation SSQueryIntentManager

+ (BOOL)isEnabled
{
  v2 = +[SSQueryIntentManagerConfig sharedInstance];
  char v3 = [v2 getBoolParameter:@"IntentModelingEnabledMobile"];
  char v4 = SSEnableSpotlightIntentModeling() & v3;

  return v4;
}

+ (void)setQueryIntentForQueryContext:(id)a3 sections:(id)a4 rankingInfo:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  if ([a1 isEnabled])
  {
    v8 = +[SSQueryIntentManagerConfig sharedInstance];
    v9 = [a1 _intentForQueryContext:v13 sections:v7];
    v10 = objc_opt_new();
    objc_msgSend(v10, "setIntentType:", objc_msgSend(v9, "intentType"));
    v11 = [a1 _suggestionConfigurationForIntent:v9 queryContext:v13 config:v8];
    [v10 setSuggestionConfig:v11];

    v12 = [a1 _sectionConfigurationForIntentType:v9 sections:v7 config:v8];
    [v10 setSectionConfig:v12];

    [v13 setQueryIntent:v10];
  }
}

+ (id)applySectionPolicyForQueryContext:(id)a3 sections:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v48 = [MEMORY[0x1E4F1CA48] array];
  v11 = [v5 queryIntent];
  if ([v11 intentType]
    && ([v11 sectionConfig], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v47 = v10;
    v45 = v8;
    id v44 = v5;
    v42 = v11;
    id v13 = [v11 sectionConfig];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = v6;
    obuint64_t j = v6;
    v14 = (void *)v48;
    uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v57;
      v46 = v13;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v57 != v50) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v17 = [v16 bundleIdentifier];
          v18 = [v13 sectionDisplayStrategies];
          v19 = [v18 objectForKeyedSubscript:v17];
          int v20 = [v19 intValue];

          switch(v20)
          {
            case 1:
              v21 = SSGeneralLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1BDB2A000, v21, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Promoting section %@ due to intent.", buf, 0xCu);
              }

              [v16 setIsInitiallyHidden:0];
              v22 = v9;
              break;
            case 2:
              v23 = SSGeneralLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Demoting section %@ due to local intent.", buf, 0xCu);
              }

              v22 = v47;
              break;
            case 3:
              v24 = SSGeneralLog();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1BDB2A000, v24, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Hiding section %@ under show more due to strong local intent.", buf, 0xCu);
              }

              [v16 setIsInitiallyHidden:1];
              v22 = v14;
              break;
            case 5:
              v25 = v9;
              v26 = v7;
              v27 = SSGeneralLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1BDB2A000, v27, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Unhiding section %@ and results due to QU intent match", buf, 0xCu);
              }

              [v16 setIsInitiallyHidden:0];
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              v28 = [v16 resultSet];
              uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v53;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v53 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    v33 = [*(id *)(*((void *)&v52 + 1) + 8 * j) rankingItem];
                    [v33 setShouldHideUnderShowMore:0];
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
                }
                while (v30);
              }

              id v7 = v26;
              v9 = v25;
              v14 = (void *)v48;
              id v13 = v46;
              goto LABEL_28;
            default:
LABEL_28:
              char v34 = [v16 isInitiallyHidden];
              v22 = v14;
              if ((v34 & 1) == 0)
              {
                v35 = [v16 bundleIdentifier];
                if ([v35 isEqualToString:@"com.apple.spotlight.tophits"])
                {

                  v22 = v7;
                }
                else
                {
                  v36 = [v16 bundleIdentifier];
                  int v37 = [v36 isEqualToString:@"com.apple.searchd.suggestions"];

                  if (v37) {
                    v22 = v7;
                  }
                  else {
                    v22 = v45;
                  }
                }
              }
              break;
          }
          [v22 addObject:v16];
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v51);
    }

    [v7 addObjectsFromArray:v9];
    v38 = v13;
    v8 = v45;
    [v7 addObjectsFromArray:v45];
    v10 = v47;
    [v7 addObjectsFromArray:v47];
    [v7 addObjectsFromArray:v14];
    v39 = v14;
    id v40 = v7;

    id v6 = v43;
    id v5 = v44;
    v11 = v42;
  }
  else
  {
    id v40 = v6;
    v39 = (void *)v48;
  }

  return v40;
}

+ (id)_intentForQueryContext:(id)a3 sections:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  +[SSQueryIntentManager _prepareSectionInformation:v6 intentHelper:v8];
  objc_msgSend(v8, "setIntentPrefixLength:", objc_msgSend(a1, "_prefixLengthModeling:", v7));
  uint64_t v9 = [a1 _postRetrievalModeling:v6];

  [v8 setIntentPostRetrieval:v9];
  objc_msgSend(v8, "setIntentNextSection:", objc_msgSend(a1, "_nextSectionModeling:", v8));
  uint64_t v10 = [a1 _queryUnderstandingModeling:v7 intentHelper:v8];

  [v8 setIntentQU:v10];
  v11 = [a1 _determineIntentAndStrength:v8];

  return v11;
}

+ (id)_determineIntentAndStrength:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "setIntentType:", objc_msgSend(a1, "_ruleBasedIntent:", v4));
  if (![v4 intentType])
  {
    if ([v4 intentPostRetrieval])
    {
      uint64_t v5 = [v4 intentPostRetrieval];
    }
    else if ([v4 intentQU])
    {
      uint64_t v5 = [v4 intentQU];
    }
    else if ([v4 intentNextSection])
    {
      uint64_t v5 = [v4 intentNextSection];
    }
    else
    {
      uint64_t v5 = [v4 intentPrefixLength];
    }
    [v4 setIntentType:v5];
  }
  objc_msgSend(v4, "setIntentStrength:", +[SSQueryIntent intentStrength:](SSQueryIntent, "intentStrength:", objc_msgSend(v4, "intentType")));
  id v6 = SSGeneralLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling] %@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (int)_ruleBasedIntent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 topHitResultBundleId];
  if ([v4 isEqualToString:@"com.apple.weather"])
  {
    uint64_t v5 = [v3 retrievedBundleIDs];
    int v6 = [v5 containsObject:@"com.apple.parsec.weather"];

    if (v6) {
      int v7 = 20;
    }
    else {
      int v7 = 0;
    }
  }
  else
  {

    int v7 = 0;
  }

  return v7;
}

+ (id)_suggestionConfigurationOverrideForQueryContext:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 getIntParameter:@"IntentModelingSuppressSuggestionsUpToPrefixLength"];
  int v9 = [v7 getIntParameter:@"IntentModelingShowSuggestionsAsOfPrefixLength"];
  int v10 = v9;
  if (v8 < 0 && v9 < 0) {
    goto LABEL_18;
  }
  v11 = [v6 searchString];
  int v12 = [v11 length];

  if (v12 < 0
    || (v8 >= 0 ? (BOOL v13 = v8 < v12) : (BOOL v13 = 1),
        v13 ? (int v14 = 0) : (int v14 = 1),
        v10 >= 0 ? (BOOL v15 = v10 <= v12) : (BOOL v15 = 0),
        !v15 ? (int v16 = 0) : (int v16 = 1),
        (v14 & 1) == 0 && !v16))
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  v17 = objc_opt_new();
  objc_msgSend(v17, "setShowWebAsTypedSuggestion:", objc_msgSend(v7, "getBoolParameter:", @"IntentModelingShowWebAsTypedBaseline"));
  objc_msgSend(v17, "setLocalSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", @"IntentModelingLocalSuggestionQuotaLocal"));
  if (![a1 _isJaJP:v6])
  {
    if (!v14) {
      goto LABEL_24;
    }
LABEL_27:
    [v17 setServerSuggestionQuota:0];
    if (!v16) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
  objc_msgSend(v17, "setLocalSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", @"IntentModelingLocalSuggestionQuotaBaseline"));
  if (v14) {
    goto LABEL_27;
  }
LABEL_24:
  if (!v16) {
    goto LABEL_19;
  }
LABEL_28:
  objc_msgSend(v17, "setServerSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", @"IntentModelingServerSuggestionQuotaBaseline"));
LABEL_19:

  return v17;
}

+ (id)_suggestionConfigurationForIntent:(id)a3 queryContext:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _suggestionConfigurationOverrideForQueryContext:v9 config:v10];
  if (!v11)
  {
    v11 = objc_opt_new();
    if ([a1 _isJaJP:v9])
    {
      objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", @"IntentModelingShowWebAsTypedBaseline"));
      objc_msgSend(v11, "setLocalSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", @"IntentModelingLocalSuggestionQuotaBaseline"));
      uint64_t v12 = [v10 getIntParameter:@"IntentModelingServerSuggestionQuotaBaseline"];
      BOOL v13 = v11;
LABEL_4:
      [v13 setServerSuggestionQuota:v12];
      goto LABEL_15;
    }
    objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", @"IntentModelingShowWebAsTypedLocal"));
    objc_msgSend(v11, "setLocalSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", @"IntentModelingLocalSuggestionQuotaLocal"));
    objc_msgSend(v11, "setServerSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", @"IntentModelingServerSuggestionQuotaLocal"));
    if ([v8 intentStrength] == 2)
    {
      objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", @"IntentModelingShowWebAsTypedLocalStrong"));
    }
    else
    {
      unsigned int v14 = [v8 intentType];
      if (v14 <= 0x12 && ((1 << v14) & 0x74008) != 0) {
        objc_msgSend(v11, "setServerSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", @"IntentModelingServerSuggestionQuotaServer"));
      }
      if ([v8 intentType] != 15
        && [v8 resultSetHasAppSectionWithinTop3]
        && ![v11 serverSuggestionQuota]
        && [v10 getBoolParameter:@"IntentModelingServerAppAccelerator"])
      {
        BOOL v13 = v11;
        uint64_t v12 = 1;
        goto LABEL_4;
      }
    }
  }
LABEL_15:
  id v15 = v11;

  return v15;
}

+ (id)_sectionConfigurationForIntentType:(id)a3 sections:(id)a4 config:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v8 = a4;
  id v40 = a5;
  if (_sectionConfigurationForIntentType_sections_config__onceToken != -1) {
    dispatch_once(&_sectionConfigurationForIntentType_sections_config__onceToken, &__block_literal_global_12);
  }
  id v9 = objc_opt_new();
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v9 setSectionDisplayStrategies:v10];
  v11 = v38;
  int v12 = [v38 intentStrength];
  if (v12 == 1)
  {
    BOOL v13 = SSIntentModelingServerSectionDisplayStrategyLocal;
    goto LABEL_7;
  }
  if (v12 == 2)
  {
    BOOL v13 = SSIntentModelingServerSectionDisplayStrategyLocalStrong;
LABEL_7:
    unsigned int v42 = [v40 getIntParameter:*v13];
    goto LABEL_9;
  }
  unsigned int v42 = 0;
LABEL_9:
  id v39 = a1;
  if ([v38 intentType] == 20) {
    int v14 = [v40 getBoolParameter:@"IntentModelingServerWeatherIntent"];
  }
  else {
    int v14 = 0;
  }
  if (objc_msgSend(a1, "isPhotosRelatedIntent:", objc_msgSend(v38, "intentType", v9))) {
    int v15 = [v40 getBoolParameter:@"IntentModelingPhotosIntent"];
  }
  else {
    int v15 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v8;
  uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    int v18 = v14 | v15;
    uint64_t v19 = *(void *)v44;
    do
    {
      uint64_t v20 = 0;
      v21 = v39;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * v20);
        v23 = [v22 bundleIdentifier];
        if (v42
          && [v21 _isParsecSection:v23]
          && [v21 _demoteParsecForIntent:v11 section:v22 config:v40])
        {
          v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v42];
          [v10 setObject:v24 forKeyedSubscript:v23];
        }
        if (v18
          && ([(id)_sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion containsObject:v23]&& objc_msgSend(v11, "intentType") == 20|| objc_msgSend((id)_sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion, "containsObject:", v23)&& objc_msgSend(v21, "isPhotosRelatedIntent:", objc_msgSend(v11, "intentType"))))
        {
          v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1];
          [v10 setObject:v25 forKeyedSubscript:v23];
        }
        v26 = [v10 objectForKeyedSubscript:v23];
        if (v26)
        {
        }
        else
        {
          uint64_t v27 = [v11 quIntentLabel];
          if (v27)
          {
            v28 = (void *)v27;
            uint64_t v29 = [v11 quIntentLabel];
            uint64_t v30 = +[SSRankingManager bundleIDSetsForQUIntent:v29];
            int v31 = [v30 containsObject:v23];

            v21 = v39;
            v11 = v38;

            if (v31) {
              [v10 setObject:&unk_1F1860F80 forKeyedSubscript:v23];
            }
          }
        }

        ++v20;
      }
      while (v17 != v20);
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      uint64_t v17 = v32;
    }
    while (v32);
  }

  if (([v11 resultSetHasTopHits] & 1) == 0 && v42 == 3)
  {
    uint64_t v33 = [v10 count];
    BOOL v34 = v33 == [v38 resultSetSectionCount];
    v11 = v38;
    if (v34)
    {
      v35 = [MEMORY[0x1E4F1CA60] dictionary];
      [v37 setSectionDisplayStrategies:v35];

      v11 = v38;
    }
  }

  return v37;
}

void __75__SSQueryIntentManager__sectionConfigurationForIntentType_sections_config___block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"com.apple.parsec.weather";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)_sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion;
  _sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion = v2;

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = @"com.apple.searchd.syndicatedPhotos";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  id v7 = (void *)_sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion;
  _sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion = v6;
}

+ (int)_intentForSection:(id)a3 withTopHit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 results];
    if (v8)
    {
      id v9 = (void *)v8;
      char v10 = [v7 isInitiallyHidden];

      if ((v10 & 1) == 0)
      {
        BOOL v13 = [v7 bundleIdentifier];
        int v14 = [v7 results];
        int v15 = [v14 firstObject];

        if (v4)
        {
          if (![v13 isEqualToString:@"com.apple.spotlight.tophits"]
            || ![v15 topHit])
          {
            int v11 = 0;
LABEL_33:

            goto LABEL_5;
          }
          uint64_t v16 = [v15 sectionBundleIdentifier];

          BOOL v13 = (void *)v16;
        }
        if (_intentForSection_withTopHit__onceToken != -1) {
          dispatch_once(&_intentForSection_withTopHit__onceToken, &__block_literal_global_90);
        }
        int v17 = [a1 isServerResult:v15];
        int v18 = [(id)_intentForSection_withTopHit___bundleIntents objectForKey:v13];
        uint64_t v19 = v18;
        if (v17)
        {
          if (v18) {
            int v11 = [v18 intValue];
          }
          else {
            int v11 = 14;
          }
          goto LABEL_32;
        }
        if (v18)
        {
          uint64_t v20 = [v7 results];
          v21 = [v20 firstObject];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v21 rankingItem],
                v22 = objc_claimAutoreleasedReturnValue(),
                [v22 likelihood],
                double v24 = v23,
                v22,
                v24 > 0.0500000007))
          {
            int v11 = [v19 intValue];
          }
          else
          {
            int v11 = 0;
          }
        }
        else if ([v13 isEqualToString:@"com.apple.calculation"])
        {
          v21 = [v15 sectionHeader];
          v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v26 = [v25 localizedStringForKey:@"CONVERSION_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
          if ([v21 isEqualToString:v26]) {
            int v11 = 3;
          }
          else {
            int v11 = 2;
          }
        }
        else
        {
          if (![v13 isEqualToString:@"com.apple.mobilesafari"])
          {
            int v11 = 1;
            goto LABEL_32;
          }
          v21 = [v15 resultBundleId];
          if ([v21 isEqualToString:@"com.apple.safari.userTypedURL"]) {
            int v11 = 19;
          }
          else {
            int v11 = 13;
          }
        }

LABEL_32:
        goto LABEL_33;
      }
    }
  }
  int v11 = 0;
LABEL_5:

  return v11;
}

void __53__SSQueryIntentManager__intentForSection_withTopHit___block_invoke()
{
  v3[20] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.parsec.itunes.iosSoftware";
  v2[1] = @"com.apple.parsec.sports";
  v3[0] = &unk_1F1860F98;
  v3[1] = &unk_1F1860FB0;
  v2[2] = @"com.apple.parsec.maps";
  v2[3] = @"com.apple.parsec.kg";
  v3[2] = &unk_1F1860FC8;
  v3[3] = &unk_1F1860FE0;
  v2[4] = @"com.apple.parsec.weather";
  v2[5] = @"com.apple.mobileslideshow";
  v3[4] = &unk_1F1860FF8;
  v3[5] = &unk_1F1861010;
  v2[6] = @"com.apple.mobilenotes";
  v2[7] = @"com.apple.DocumentsApp";
  v3[6] = &unk_1F1861028;
  v3[7] = &unk_1F1861028;
  v2[8] = @"com.apple.mobilemail";
  v2[9] = @"com.apple.MobileSMS";
  v3[8] = &unk_1F1861040;
  v3[9] = &unk_1F1861040;
  v2[10] = @"com.apple.mobilecal";
  v2[11] = @"com.apple.reminders";
  v3[10] = &unk_1F1861058;
  v3[11] = &unk_1F1861058;
  v2[12] = @"com.apple.searchd.syndicatedPhotos";
  v2[13] = @"com.apple.searchd.syndicatedPhotos.MobileSMS";
  v3[12] = &unk_1F1861010;
  v3[13] = &unk_1F1861010;
  v2[14] = @"com.apple.searchd.syndicatedPhotos.mobilenotes";
  v2[15] = @"com.apple.searchd.syndicatedPhotos.mobileslideshow";
  v3[14] = &unk_1F1861010;
  v3[15] = &unk_1F1861010;
  v2[16] = @"com.apple.Preferences";
  v2[17] = @"com.apple.shortcuts";
  v3[16] = &unk_1F1861070;
  v3[17] = &unk_1F1861088;
  v2[18] = @"com.apple.datadetector.quick_actions";
  v2[19] = @"com.apple.application";
  v3[18] = &unk_1F18610A0;
  v3[19] = &unk_1F1860F80;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:20];
  v1 = (void *)_intentForSection_withTopHit___bundleIntents;
  _intentForSection_withTopHit___bundleIntents = v0;
}

+ (int)_postRetrievalModeling:(id)a3
{
  BOOL v4 = [a3 firstObject];
  LODWORD(a1) = [a1 _intentForSection:v4 withTopHit:1];

  return (int)a1;
}

+ (int)_nextSectionModeling:(id)a3
{
  BOOL v4 = [a3 nextSectionForIntent];
  LODWORD(a1) = [a1 _intentForSection:v4 withTopHit:0];

  return (int)a1;
}

+ (int)_prefixLengthModeling:(id)a3
{
  id v3 = [a3 searchString];
  unint64_t v4 = [v3 length];

  if (v4 < 0xB) {
    return 1;
  }
  else {
    return 14;
  }
}

+ (int)_queryUnderstandingModeling:(id)a3 intentHelper:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_40;
  }
  if (_queryUnderstandingModeling_intentHelper__onceToken != -1) {
    dispatch_once(&_queryUnderstandingModeling_intentHelper__onceToken, &__block_literal_global_131);
  }
  uint64_t v8 = [v6 queryUnderstandingOutput];
  unint64_t v9 = [v8 count];

  if (v9 < 2) {
    goto LABEL_40;
  }
  char v10 = [v6 queryUnderstandingOutput];
  int v11 = [v10 objectForKeyedSubscript:@"kQPQUIntentLabels"];

  int v12 = [v6 queryUnderstandingOutput];
  BOOL v13 = [v12 objectForKeyedSubscript:@"kQPQUIntentScores"];

  int v14 = [v6 queryUnderstandingOutput];
  int v15 = [v14 objectForKeyedSubscript:@"kQPQUIntentIds"];

  uint64_t v16 = [v11 firstObject];
  int v17 = [v15 firstObject];
  int v18 = [v17 intValue];

  uint64_t v19 = [v13 firstObject];
  [v19 floatValue];
  float v21 = v20;

  if (v18 < 1 || v21 < 0.9) {
    goto LABEL_38;
  }
  long long v53 = v11;
  [v7 setQuIntentLabel:v16];
  uint64_t v22 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles objectForKeyedSubscript:v16];
  if (v22)
  {
    double v23 = (void *)v22;
    uint64_t v4 = [v7 retrievedBundleIDs];
    double v24 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles objectForKeyedSubscript:v16];
    char v25 = [(id)v4 containsObject:v24];

    if (v25)
    {
      int v26 = 0;
      LODWORD(v4) = 10;
      goto LABEL_39;
    }
  }
  uint64_t v27 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos objectForKeyedSubscript:v16];

  if (v27)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v28 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos objectForKeyedSubscript:v16];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (!v29)
    {
      LODWORD(v4) = 9;
      goto LABEL_37;
    }
    uint64_t v30 = v29;
    long long v52 = v13;
    uint64_t v31 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        BOOL v34 = objc_msgSend(v7, "retrievedBundleIDs", v52);
        LOBYTE(v33) = [v34 containsObject:v33];

        if (v33)
        {

          int v26 = 0;
          LODWORD(v4) = 9;
          goto LABEL_22;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v30) {
        continue;
      }
      break;
    }
    LODWORD(v4) = 9;
LABEL_20:
    BOOL v13 = v52;
LABEL_37:

    int v11 = v53;
LABEL_38:
    int v26 = 1;
    goto LABEL_39;
  }
  if ([v16 isEqualToString:@"INTENT_MAIL_SEARCH"])
  {
    v35 = [v7 retrievedBundleIDs];
    LODWORD(v4) = [v35 containsObject:@"com.apple.mobilemail"];

    if (v4)
    {
      int v26 = 0;
      LODWORD(v4) = 11;
      goto LABEL_39;
    }
  }
  if ([v16 isEqualToString:@"INTENT_MESSAGE_SEARCH"])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v28 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications allValues];
    uint64_t v36 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (!v36)
    {
      LODWORD(v4) = 11;
      goto LABEL_37;
    }
    uint64_t v37 = v36;
    long long v52 = v13;
    uint64_t v38 = *(void *)v55;
    while (2)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v28);
        }
        uint64_t v40 = *(void *)(*((void *)&v54 + 1) + 8 * j);
        v41 = objc_msgSend(v7, "retrievedBundleIDs", v52);
        LOBYTE(v40) = [v41 containsObject:v40];

        if (v40)
        {

          int v26 = 0;
          LODWORD(v4) = 11;
LABEL_22:
          BOOL v13 = v52;
          int v11 = v53;
          goto LABEL_39;
        }
      }
      uint64_t v37 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
      LODWORD(v4) = 11;
      if (v37) {
        continue;
      }
      goto LABEL_20;
    }
  }
  uint64_t v43 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents objectForKeyedSubscript:v16];
  if (!v43) {
    goto LABEL_61;
  }
  long long v44 = (void *)v43;
  uint64_t v4 = [v7 retrievedBundleIDs];
  long long v45 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents objectForKeyedSubscript:v16];
  char v46 = [(id)v4 containsObject:v45];

  if (v46)
  {
    int v26 = 0;
    LODWORD(v4) = 12;
  }
  else
  {
LABEL_61:
    if ([v16 isEqualToString:@"INTENT_SETTINGS_SEARCH"]
      && ([v7 retrievedBundleIDs],
          v47 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v4) = [v47 containsObject:@"com.apple.Preferences"],
          v47,
          (v4 & 1) != 0))
    {
      int v26 = 0;
      LODWORD(v4) = 6;
    }
    else
    {
      uint64_t v48 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric objectForKeyedSubscript:v16];
      if (!v48) {
        goto LABEL_56;
      }
      v49 = (void *)v48;
      uint64_t v4 = [v7 retrievedBundleIDs];
      uint64_t v50 = [(id)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric objectForKeyedSubscript:v16];
      char v51 = [(id)v4 containsObject:v50];

      if (v51)
      {
        int v26 = 0;
        LODWORD(v4) = 1;
      }
      else
      {
LABEL_56:
        if (([v16 hasPrefix:@"INTENT_FLIGHT"] & 1) == 0
          && ([v16 hasPrefix:@"INTENT_HOTEL"] & 1) == 0
          && ![v16 hasPrefix:@"INTENT_RESTAURANT"]
          || [v7 resultSetSectionCount] <= 0)
        {
          goto LABEL_38;
        }
        int v26 = 0;
        LODWORD(v4) = 1;
      }
    }
  }
LABEL_39:

  if (v26) {
LABEL_40:
  }
    LODWORD(v4) = 0;

  return v4;
}

void __65__SSQueryIntentManager__queryUnderstandingModeling_intentHelper___block_invoke()
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v22[0] = @"com.apple.mobileslideshow";
  v22[1] = @"com.apple.searchd.syndicatedPhotos";
  v22[2] = @"com.apple.searchd.syndicatedPhotos.MobileSMS";
  v22[3] = @"com.apple.searchd.syndicatedPhotos.mobilenotes";
  v22[4] = @"com.apple.searchd.syndicatedPhotos.mobileslideshow";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  v1 = (void *)_queryUnderstandingModeling_intentHelper___photosBundles;
  _queryUnderstandingModeling_intentHelper___photosBundles = v0;

  v20[0] = @"INTENT_PHOTO_SEARCH";
  v20[1] = @"INTENT_PHOTO_SEARCH_OCR";
  v21[0] = _queryUnderstandingModeling_intentHelper___photosBundles;
  v21[1] = _queryUnderstandingModeling_intentHelper___photosBundles;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v3 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos = v2;

  v18[0] = @"INTENT_NOTES_SEARCH";
  v18[1] = @"INTENT_FILE_SEARCH";
  v19[0] = @"com.apple.mobilenotes";
  v19[1] = @"com.apple.DocumentsApp";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v5 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalFiles = v4;

  v16[0] = @"INTENT_MAIL_SEARCH";
  v16[1] = @"INTENT_MESSAGE_SEARCH";
  v17[0] = @"com.apple.mobilemail";
  v17[1] = @"com.apple.MobileSMS";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v7 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications = v6;

  v14[0] = @"INTENT_CALENDAR_SEARCH";
  v14[1] = @"INTENT_REMINDER_SEARCH";
  v15[0] = @"com.apple.mobilecal";
  v15[1] = @"com.apple.reminders";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  unint64_t v9 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalEvents = v8;

  int v12 = @"INTENT_SAFARI_SEARCH";
  BOOL v13 = @"com.apple.mobilesafari";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  int v11 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric = v10;
}

+ (void)_prepareSectionInformation:(id)a3 intentHelper:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
  [v6 setResultSetHasTopHits:0];
  [v6 setResultSetHasSuggestions:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      uint64_t v29 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        BOOL v13 = objc_msgSend(v12, "bundleIdentifier", v29);
        [v31 addObject:v13];

        int v14 = [v12 bundleIdentifier];
        if ([v14 isEqualToString:@"com.apple.spotlight.tophits"])
        {
          int v15 = [v12 results];
          uint64_t v16 = [v15 count];

          if (v16)
          {
            [v6 setResultSetHasTopHits:1];
            int v17 = [v12 results];
            int v18 = [v17 firstObject];
            uint64_t v19 = [v18 resultBundleId];
            [v6 setTopHitResultBundleId:v19];

            goto LABEL_15;
          }
        }
        else
        {
        }
        float v20 = [v12 bundleIdentifier];
        int v21 = [v20 isEqualToString:@"com.apple.searchd.suggestions"];

        if (v21)
        {
          [v6 setResultSetHasSuggestions:1];
        }
        else
        {
          uint64_t v22 = [v12 bundleIdentifier];
          int v23 = [v22 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"];

          if (v23 && (int)v29 + (int)v11 <= 2) {
            [v6 setResultSetHasAppSectionWithinTop3:1];
          }
        }
LABEL_15:
        double v24 = [v6 nextSectionForIntent];
        if (v24 || ([v6 resultSetHasSuggestions] & 1) == 0)
        {
        }
        else
        {
          char v25 = [v12 bundleIdentifier];
          char v26 = [v25 isEqualToString:@"com.apple.searchd.suggestions"];

          if ((v26 & 1) == 0) {
            [v6 setNextSectionForIntent:v12];
          }
        }
        ++v11;
      }
      while (v8 != v11);
      unsigned int v9 = v29 + v8;
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v31];
  [v6 setRetrievedBundleIDs:v27];

  v28 = [v6 retrievedBundleIDs];
  objc_msgSend(v6, "setResultSetSectionCount:", objc_msgSend(v28, "count") - objc_msgSend(v6, "resultSetHasSuggestions"));
}

+ (BOOL)_demoteParsecForIntent:(id)a3 section:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 bundleIdentifier];
  uint64_t v12 = [v10 serverDomainDemotionExclusionSet];
  BOOL v16 = (!v12
      || (BOOL v13 = (void *)v12,
          [v10 serverDomainDemotionExclusionSet],
          int v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 containsObject:v11],
          v14,
          v13,
          (v15 & 1) == 0))
     && (!objc_msgSend(a1, "isPhotosRelatedIntent:", objc_msgSend(v8, "intentType"))
      || ([v11 isEqualToString:@"com.apple.parsec.web_images"] & 1) == 0)
     && [v8 intentType] != 20
     && (![v11 isEqualToString:@"com.apple.parsec.maps"]
      || ![v10 getBoolParameter:@"IntentModelingMapsPoiIntent"]
      || ([a1 _hasMapsPOIResults:v9] & 1) == 0);

  return v16;
}

+ (BOOL)_hasMapsPOIResults:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.parsec.maps"];

  if (v6)
  {
    if (_hasMapsPOIResults__onceToken != -1) {
      dispatch_once(&_hasMapsPOIResults__onceToken, &__block_literal_global_181);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(v4, "results", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [a1 _getParsecMapsDetailedIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (([v12 hasPrefix:_hasMapsPOIResults__mapsCategoryPrefix] & 1) != 0
            || ([v12 hasPrefix:_hasMapsPOIResults__mapsChainBizPrefix] & 1) != 0)
          {

            BOOL v13 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v13 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
LABEL_17:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __43__SSQueryIntentManager__hasMapsPOIResults___block_invoke()
{
  uint64_t v0 = (void *)_hasMapsPOIResults__mapsCategoryPrefix;
  _hasMapsPOIResults__mapsCategoryPrefix = @"m:category:";

  v1 = (void *)_hasMapsPOIResults__mapsChainBizPrefix;
  _hasMapsPOIResults__mapsChainBizPrefix = @"m:chainBusiness:";
}

+ (id)_getParsecMapsDetailedIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 inlineCard];
  id v5 = [v4 cardSections];
  if (!v5) {
    goto LABEL_4;
  }
  int v6 = [v3 inlineCard];
  uint64_t v7 = [v6 cardSections];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v3 inlineCard];
    uint64_t v10 = [v9 cardSections];
    id v4 = [v10 firstObject];

    id v5 = [v4 resultIdentifier];
LABEL_4:

    goto LABEL_6;
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

+ (BOOL)_isParsecSection:(id)a3
{
  return [a3 hasPrefix:@"com.apple.parsec"];
}

+ (BOOL)isServerResult:(id)a3
{
  id v4 = a3;
  if (SSResultTypeIsServer([v4 type]))
  {
    char v5 = 1;
  }
  else
  {
    int v6 = [v4 resultBundleId];
    char v5 = [a1 _isParsecSection:v6];
  }
  return v5;
}

+ (BOOL)isPhotosRelatedIntent:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 8;
}

+ (BOOL)_isJaJP:(id)a3
{
  id v3 = [a3 keyboardPrimaryLanguage];
  char v4 = [v3 isEqualToString:@"ja-JP"];

  return v4;
}

@end