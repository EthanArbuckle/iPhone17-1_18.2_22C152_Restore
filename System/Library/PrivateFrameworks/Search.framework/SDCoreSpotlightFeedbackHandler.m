@interface SDCoreSpotlightFeedbackHandler
+ (id)sharedInstance;
- (BOOL)_isSafari:(id)a3;
- (BOOL)clientRankAndBlend;
- (BOOL)ignoreResultEngagements;
- (NSMutableArray)analyticsItems;
- (NSMutableArray)topAnalyticsItemPerSection;
- (NSString)lastQuery;
- (SDCoreSpotlightFeedbackHandler)init;
- (id)_remapSafariSyntheticBookmarkID:(id)a3;
- (void)deleteEngagementItem:(id)a3 externalIdentifier:(id)a4 protectionClass:(id)a5;
- (void)didEngageResult:(id)a3 engagedAnalyticsItem:(id)a4 atPosition:(unint64_t)a5 withEvent:(unint64_t)a6 forQuery:(id)a7 currentTime:(id)a8;
- (void)didEngageSection:(id)a3;
- (void)didEngageSection:(id)a3 withEvent:(unint64_t)a4;
- (void)didPerformCommand:(id)a3;
- (void)didRankSections:(id)a3;
- (void)didStartSearch:(id)a3;
- (void)indexEngagementItem:(id)a3 currentTime:(id)a4 externalIdentifier:(id)a5 protectionClass:(id)a6 expire:(BOOL)a7 shortcutString:(id)a8 update:(BOOL)a9;
- (void)searchViewDidDisappear:(id)a3;
- (void)setAnalyticsItems:(id)a3;
- (void)setClientRankAndBlend:(BOOL)a3;
- (void)setIgnoreResultEngagements:(BOOL)a3;
- (void)setLastQuery:(id)a3;
- (void)setTopAnalyticsItemPerSection:(id)a3;
- (void)updateRankingSectionItemsForResult:(id)a3 withQuery:(id)a4;
- (void)updateShortcutForResult:(id)a3 withQuery:(id)a4 currentTime:(id)a5;
- (void)updateSpotlightUsageCount;
@end

@implementation SDCoreSpotlightFeedbackHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_handler;

  return v2;
}

uint64_t __48__SDCoreSpotlightFeedbackHandler_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_handler;
  sharedInstance_handler = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (SDCoreSpotlightFeedbackHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDCoreSpotlightFeedbackHandler;
  v2 = [(SDCoreSpotlightFeedbackHandler *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
    -[SDCoreSpotlightFeedbackHandler setIgnoreResultEngagements:](v2, "setIgnoreResultEngagements:", [v3 BOOLForKey:@"ignoreResultEngagements"]);
    [(SDCoreSpotlightFeedbackHandler *)v2 setClientRankAndBlend:_os_feature_enabled_impl()];
  }
  return v2;
}

- (void)didEngageSection:(id)a3
{
  id v4 = a3;
  id v6 = [v4 section];
  uint64_t v5 = [v4 triggerEvent];

  [(SDCoreSpotlightFeedbackHandler *)self didEngageSection:v6 withEvent:v5];
}

- (void)didEngageSection:(id)a3 withEvent:(unint64_t)a4
{
  id v5 = [a3 bundleIdentifier];
  +[SPCoreAnalyticsManager logEngagementWithBundleIdentifier:v5 forEvent:a4];
}

- (void)didStartSearch:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v11;
  if (isKindOfClass)
  {
    id v6 = v11;
    if ([v6 indexType] == 1)
    {
      if ([v6 triggerEvent] == 23)
      {
        v7 = [v6 input];
        if (v7) {
          [MEMORY[0x263F78E30] cacheSearchString:v7];
        }
      }
      v8 = [v6 input];
      [(SDCoreSpotlightFeedbackHandler *)self setLastQuery:v8];

      v9 = (NSMutableArray *)objc_opt_new();
      analyticsItems = self->_analyticsItems;
      self->_analyticsItems = v9;
    }
    id v5 = v11;
  }

  MEMORY[0x270F9A758](isKindOfClass, v5);
}

- (void)didRankSections:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  topAnalyticsItemPerSection = self->_topAnalyticsItemPerSection;
  self->_topAnalyticsItemPerSection = 0;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v31 = v4;
  id obj = [v4 sections];
  uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    uint64_t v32 = *(void *)v45;
    v33 = self;
    do
    {
      uint64_t v9 = 0;
      uint64_t v34 = v7;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        id v11 = [v10 section];
        if (!v11) {
          goto LABEL_33;
        }
        uint64_t v37 = v9;
        if (!self->_topAnalyticsItemPerSection)
        {
          v12 = (NSMutableArray *)objc_opt_new();
          v13 = self->_topAnalyticsItemPerSection;
          self->_topAnalyticsItemPerSection = v12;
        }
        v14 = [v10 results];
        v39 = objc_opt_new();
        uint64_t v38 = [v11 maxInitiallyVisibleResults];
        v15 = [v11 bundleIdentifier];
        if (![v15 isEqualToString:@"com.apple.spotlight.tophits"]
          || ([v11 isInitiallyHidden] & 1) != 0)
        {
          goto LABEL_13;
        }
        v16 = [v11 results];
        uint64_t v17 = [v16 count];

        if (v38 != v17)
        {
          v15 = [v11 results];
          uint64_t v38 = [v15 count];
LABEL_13:
        }
        v36 = v11;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v18 = v14;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = 0;
          v22 = 0;
          uint64_t v23 = *(void *)v41;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v18);
              }
              v25 = [*(id *)(*((void *)&v40 + 1) + 8 * i) result];
              [v25 type];
              if ((SSResultTypeIsSuggestion() & 1) == 0)
              {
                v26 = [v25 sectionBundleIdentifier];
                char v27 = [v26 isEqualToString:@"com.apple.spotlightui.search-through"];

                if ((v27 & 1) == 0)
                {
                  v28 = [[SPAnalyticsItem alloc] initWithResult:v25];
                  v29 = v28;
                  if (!v21)
                  {
                    v30 = v28;

                    v22 = v30;
                  }
                  [v39 addObject:v29];
                  ++v21;

                  if (v21 == v38)
                  {

                    goto LABEL_28;
                  }
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v20) {
              continue;
            }
            break;
          }
LABEL_28:

          self = v33;
          if (v22) {
            [(NSMutableArray *)v33->_topAnalyticsItemPerSection addObject:v22];
          }
          uint64_t v8 = v32;
          uint64_t v7 = v34;
        }
        else
        {

          v22 = 0;
        }
        uint64_t v9 = v37;
        [(NSMutableArray *)self->_analyticsItems addObjectsFromArray:v39];

        id v11 = v36;
LABEL_33:

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v7);
  }
}

- (BOOL)_isSafari:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilesafari"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.Safari"];
  }

  return v4;
}

- (id)_remapSafariSyntheticBookmarkID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:SyntheticBookmarkPrefix])
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend((id)SyntheticBookmarkPrefix, "length"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)didPerformCommand:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 result];
  if (self->_ignoreResultEngagements)
  {
    NSLog(&cfstr_SkippingFeedba.isa);
  }
  else
  {
    v36 = v4;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v6 = self->_analyticsItems;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        v12 = [v11 identifier];
        v13 = [v5 identifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      uint64_t v16 = [(NSMutableArray *)self->_analyticsItems indexOfObject:v11];
      id v15 = v11;

      if (!v15) {
        goto LABEL_14;
      }
      +[SPCoreAnalyticsManager computeEngagementMatrixForEngagedItem:v15 topAnalyticsItemsPerSection:self->_topAnalyticsItemPerSection];
      char v17 = 0;
    }
    else
    {
LABEL_11:

      id v15 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
      char v17 = 1;
    }
    id v18 = [MEMORY[0x263EFF910] date];
    uint64_t v19 = [v5 applicationBundleIdentifier];
    BOOL v20 = [(SDCoreSpotlightFeedbackHandler *)self _isSafari:v19];

    if (v20)
    {
      uint64_t v21 = [v5 identifier];
      v22 = [(SDCoreSpotlightFeedbackHandler *)self _remapSafariSyntheticBookmarkID:v21];
      [v5 setIdentifier:v22];
    }
    if ((PRSRankingSDEnabledFlagState() & 2) != 0)
    {
      v25 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
      [v25 doubleForKey:@"RankingFeaturesTestFirstQueryTime"];
      double v27 = v26;
      v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"RankingFeaturesTest: RankingFeaturesTestFirstQueryTime = %f", *(void *)&v26);
      NSLog(&stru_26CF87638.isa, v28);

      id v29 = [NSString alloc];
      [v18 timeIntervalSinceReferenceDate];
      v31 = objc_msgSend(v29, "initWithFormat:", @"RankingFeaturesTest: currentTime = %f", v30);
      NSLog(&stru_26CF87638.isa, v31);

      if (v27 == 0.0)
      {
        [v18 timeIntervalSinceReferenceDate];
        objc_msgSend(v25, "setDouble:forKey:", @"RankingFeaturesTestFirstQueryTime");
        NSLog(&cfstr_Rankingfeature_2.isa);
      }
      else
      {
        uint64_t v32 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:v27];

        id v18 = (void *)v32;
        NSLog(&cfstr_Rankingfeature_3.isa);
      }
      id v33 = [NSString alloc];
      [v18 timeIntervalSinceReferenceDate];
      v35 = objc_msgSend(v33, "initWithFormat:", @"RankingFeaturesTest: currentTime = %f", v34);
      NSLog(&stru_26CF87638.isa, v35);
    }
    id v4 = v36;
    if ((v17 & 1) == 0)
    {
      uint64_t v23 = [v36 triggerEvent];
      v24 = [(SDCoreSpotlightFeedbackHandler *)self lastQuery];
      [(SDCoreSpotlightFeedbackHandler *)self didEngageResult:v5 engagedAnalyticsItem:v15 atPosition:v16 withEvent:v23 forQuery:v24 currentTime:v18];
    }
  }
}

- (void)didEngageResult:(id)a3 engagedAnalyticsItem:(id)a4 atPosition:(unint64_t)a5 withEvent:(unint64_t)a6 forQuery:(id)a7 currentTime:(id)a8
{
  id v16 = a3;
  id v14 = a7;
  id v15 = a8;
  +[SPCoreAnalyticsManager logEngagementWithItem:a4 atPosition:a5 forEvent:a6];
  if (a6 != 5)
  {
    [(SDCoreSpotlightFeedbackHandler *)self updateRankingSectionItemsForResult:v16 withQuery:v14];
    [(SDCoreSpotlightFeedbackHandler *)self updateSpotlightUsageCount];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SDCoreSpotlightFeedbackHandler *)self updateShortcutForResult:v16 withQuery:v14 currentTime:v15];
    }
  }
}

- (void)searchViewDidDisappear:(id)a3
{
  self->_analyticsItems = 0;
  MEMORY[0x270F9A758]();
}

- (void)updateSpotlightUsageCount
{
  v2 = dispatch_get_global_queue(17, 0);
  dispatch_async(v2, &__block_literal_global_128_0);
}

void __59__SDCoreSpotlightFeedbackHandler_updateSpotlightUsageCount__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  uint64_t v0 = [v2 objectForKey:@"usedCount"];

  if (v0) {
    uint64_t v1 = [v2 integerForKey:@"usedCount"] + 1;
  }
  else {
    uint64_t v1 = 1;
  }
  [v2 setInteger:v1 forKey:@"usedCount"];
}

- (void)indexEngagementItem:(id)a3 currentTime:(id)a4 externalIdentifier:(id)a5 protectionClass:(id)a6 expire:(BOOL)a7 shortcutString:(id)a8 update:(BOOL)a9
{
  BOOL v10 = a7;
  v34[3] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = (objc_class *)MEMORY[0x263F02AE0];
  id v20 = a5;
  id v21 = objc_alloc_init(v19);
  [v21 setUniqueIdentifier:v20];

  [v21 setBundleID:v15];
  if (v10)
  {
    v22 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2592000.0];
    [v21 setExpirationDate:v22];
  }
  id v23 = objc_alloc(MEMORY[0x263F02AE8]);
  v33[0] = @"_kMDItemShortcutLastUsedDate";
  v33[1] = @"kMDItemLastUsedDate";
  v34[0] = v16;
  v34[1] = v16;
  v33[2] = @"_kMDItemLaunchString";
  v34[2] = v18;
  v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  v25 = (void *)[v23 initWithAttributes:v24];
  [v21 setAttributeSet:v25];

  if (!a9)
  {
    double v26 = [v21 attributeSet];
    [v26 setDisplayName:v18];
  }
  [v21 setIsUpdate:a9];
  if (self->_clientRankAndBlend)
  {
    double v27 = [MEMORY[0x263F02AD8] defaultSearchableIndex];
    id v32 = v21;
    v28 = (void *)MEMORY[0x263EFF8C0];
    id v29 = &v32;
  }
  else
  {
    double v27 = [MEMORY[0x263F78CC8] sharedInstance];
    id v31 = v21;
    v28 = (void *)MEMORY[0x263EFF8C0];
    id v29 = &v31;
  }
  uint64_t v30 = [v28 arrayWithObjects:v29 count:1];
  [v27 indexSearchableItems:v30 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v17 forBundleID:v15 options:0 completionHandler:0];
}

- (void)deleteEngagementItem:(id)a3 externalIdentifier:(id)a4 protectionClass:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_clientRankAndBlend)
  {
    uint64_t v8 = (void *)MEMORY[0x263F02AD8];
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    v12 = [v8 defaultSearchableIndex];
    v18[0] = v10;
    v13 = (void *)MEMORY[0x263EFF8C0];
    id v14 = (id *)v18;
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F78CC8];
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    v12 = [v15 sharedInstance];
    id v17 = v10;
    v13 = (void *)MEMORY[0x263EFF8C0];
    id v14 = &v17;
  }
  id v16 = [v13 arrayWithObjects:v14 count:1];

  [v12 indexSearchableItems:0 deleteSearchableItemsWithIdentifiers:v16 clientState:0 protectionClass:v9 forBundleID:v11 options:0 completionHandler:0];
}

- (void)updateShortcutForResult:(id)a3 withQuery:(id)a4 currentTime:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  NSLog(&cfstr_Updateshortcut.isa, v7);
  id v10 = [v7 getStableServerResultIdentifier];
  id v11 = [v7 feedbackSectionIdentifier];
  v22 = [MEMORY[0x263F78D20] getSPMLSharedInstance];
  BOOL v12 = [v7 type] == 36 || objc_msgSend(v7, "type") == 37;
  id v13 = [v7 protectionClass];
  if (!_os_feature_enabled_impl())
  {
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  if (([v11 isEqual:*MEMORY[0x263F790B8]] & 1) != 0
    || ([v11 isEqual:*MEMORY[0x263F790B0]] & 1) != 0
    || ([v11 isEqual:*MEMORY[0x263F79078]] & 1) != 0)
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = [v11 isEqual:*MEMORY[0x263F79068]];
    if (!v14) {
      goto LABEL_12;
    }
  }
  if (!v13)
  {
    id v13 = (id)*MEMORY[0x263F08098];
    uint64_t v14 = 1;
  }
LABEL_12:
  unsigned int v15 = [v7 type];
  if (v8)
  {
    id v16 = v8;
    goto LABEL_15;
  }
  id v16 = [v7 userInput];
  if (v16)
  {
LABEL_15:
    int v17 = [v11 isEqual:*MEMORY[0x263F79110]];
    if (v15 == 20) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    if (v10 && v11 && v13)
    {
      char v19 = v15 == 2 || v12;
      if ((v19 & 1) != 0 || v15 <= 7 && ((1 << v15) & 0xD0) != 0 || (v14 | v18) == 1)
      {
        [v22 addCategoryAndGroupNameToTrainCategories:v11 groupName:v11];
        LOBYTE(v20) = 1;
        [(SDCoreSpotlightFeedbackHandler *)self indexEngagementItem:v11 currentTime:v9 externalIdentifier:v10 protectionClass:v13 expire:v14 shortcutString:v16 update:v20];
      }
    }
    if (updateShortcutForResult_withQuery_currentTime__onceToken == -1)
    {
      if (!v11) {
        goto LABEL_39;
      }
    }
    else
    {
      dispatch_once(&updateShortcutForResult_withQuery_currentTime__onceToken, &__block_literal_global_153);
      if (!v11) {
        goto LABEL_39;
      }
    }
    if ([(id)updateShortcutForResult_withQuery_currentTime__priorityBundleIds containsObject:v11])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        __int16 v25 = 2112;
        id v26 = v16;
        _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Clear non-priority engagement for %@ (%@)", buf, 0x16u);
      }
      [(SDCoreSpotlightFeedbackHandler *)self deleteEngagementItem:@"com.apple.searchd.engagement" externalIdentifier:v16 protectionClass:@"Priority"];
LABEL_42:

      goto LABEL_43;
    }
LABEL_39:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Capture non-priority engagement for %@ (%@)", buf, 0x16u);
    }
    LOBYTE(v20) = 0;
    [(SDCoreSpotlightFeedbackHandler *)self indexEngagementItem:@"com.apple.searchd.engagement" currentTime:v9 externalIdentifier:v16 protectionClass:@"Priority" expire:1 shortcutString:v16 update:v20];
    goto LABEL_42;
  }
LABEL_43:
}

uint64_t __80__SDCoreSpotlightFeedbackHandler_updateShortcutForResult_withQuery_currentTime___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CF8F260];
  uint64_t v1 = updateShortcutForResult_withQuery_currentTime__priorityBundleIds;
  updateShortcutForResult_withQuery_currentTime__priorityBundleIds = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)updateRankingSectionItemsForResult:(id)a3 withQuery:(id)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 feedbackSectionIdentifier];
  id v9 = [v7 sectionBundleIdentifier];

  if (([v9 isEqualToString:@"com.apple.application"] & 1) != 0 || !v8)
  {
  }
  else
  {

    if (v6)
    {
      if (self->_clientRankAndBlend)
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke;
        v26[3] = &unk_2644B2B18;
        id v27 = v6;
        id v10 = &v28;
        id v11 = v8;
        BOOL v12 = &v29;
        id v28 = v11;
        id v29 = @"com.apple.spotlight.category";
        id v13 = (void *)MEMORY[0x223C2C030](v26);
        uint64_t v14 = [MEMORY[0x263F02AD8] defaultSearchableIndex];
        uint64_t v15 = *MEMORY[0x263F02750];
        v33[0] = *MEMORY[0x263F02758];
        v33[1] = v15;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
        uint64_t v17 = *MEMORY[0x263F08080];
        id v32 = v11;
        int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        uint64_t v19 = v17;
        uint64_t v20 = &v27;
        [v14 slowFetchAttributes:v16 protectionClass:v19 bundleID:@"com.apple.spotlight.category" identifiers:v18 completionHandler:v13];
      }
      else
      {
        id v13 = [MEMORY[0x263F78CC8] sharedInstance];
        uint64_t v21 = *MEMORY[0x263F08080];
        uint64_t v22 = *MEMORY[0x263F02750];
        v31[0] = *MEMORY[0x263F02758];
        v31[1] = v22;
        uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
        uint64_t v30 = v8;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        uint64_t v20 = &v23;
        id v23 = v8;
        id v10 = &v24;
        BOOL v12 = &v25;
        id v24 = v6;
        __int16 v25 = @"com.apple.spotlight.category";
        objc_msgSend(v13, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:completion:", v21, v14);
      }
    }
  }
}

void __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count]
    && ([v3 objectAtIndexedSubscript:0], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v11 = v6;
              goto LABEL_16;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      id v11 = 0;
LABEL_16:
    }
    else
    {
      id v11 = 0;
    }

    if (v11)
    {
      uint64_t v12 = [v11 firstObject];
      uint64_t v13 = [v11 objectAtIndex:1];
      uint64_t v14 = objc_opt_new();
      uint64_t v15 = objc_opt_new();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 addObjectsFromArray:v12];
        [v15 addObjectsFromArray:v13];
      }
      id v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
      [v14 addObject:a1[4]];
      [v15 addObject:v26];
      id v27 = (void *)v13;
      id v16 = objc_opt_new();
      [v16 setUniqueIdentifier:a1[5]];
      [v16 setBundleID:a1[6]];
      id v17 = objc_alloc(MEMORY[0x263F02AE8]);
      uint64_t v18 = *MEMORY[0x263F02750];
      v33[0] = *MEMORY[0x263F02758];
      v33[1] = v18;
      v34[0] = v14;
      v34[1] = v15;
      [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      uint64_t v19 = v25 = (void *)v12;
      uint64_t v20 = (void *)[v17 initWithAttributes:v19];
      [v16 setAttributeSet:v20];

      uint64_t v21 = [MEMORY[0x263F02AD8] defaultSearchableIndex];
      id v32 = v16;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      uint64_t v23 = *MEMORY[0x263F08080];
      id v24 = [v16 bundleID];
      [v21 indexSearchableItems:v22 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v23 forBundleID:v24 options:0 completionHandler:0];
    }
  }
  else
  {
    id v5 = 0;
  }
}

void __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke_2(void *a1, void *a2)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = [a2 valueForKey:a1[4]];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v3 objectAtIndex:1];
  id v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 addObjectsFromArray:v4];
    [v7 addObjectsFromArray:v5];
  }
  [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  uint64_t v8 = v18 = (void *)v5;
  [v6 addObject:a1[5]];
  [v7 addObject:v8];
  uint64_t v9 = objc_opt_new();
  [v9 setUniqueIdentifier:a1[4]];
  [v9 setBundleID:a1[6]];
  id v10 = objc_alloc(MEMORY[0x263F02AE8]);
  uint64_t v11 = *MEMORY[0x263F02750];
  v20[0] = *MEMORY[0x263F02758];
  v20[1] = v11;
  v21[0] = v6;
  v21[1] = v7;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v13 = (void *)[v10 initWithAttributes:v12];
  [v9 setAttributeSet:v13];

  uint64_t v14 = [MEMORY[0x263F78CC8] sharedInstance];
  uint64_t v19 = v9;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  uint64_t v16 = *MEMORY[0x263F08080];
  id v17 = [v9 bundleID];
  [v14 indexSearchableItems:v15 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v16 forBundleID:v17 options:0 completionHandler:0];
}

- (NSMutableArray)analyticsItems
{
  return self->_analyticsItems;
}

- (void)setAnalyticsItems:(id)a3
{
}

- (NSMutableArray)topAnalyticsItemPerSection
{
  return self->_topAnalyticsItemPerSection;
}

- (void)setTopAnalyticsItemPerSection:(id)a3
{
}

- (NSString)lastQuery
{
  return self->_lastQuery;
}

- (void)setLastQuery:(id)a3
{
}

- (BOOL)ignoreResultEngagements
{
  return self->_ignoreResultEngagements;
}

- (void)setIgnoreResultEngagements:(BOOL)a3
{
  self->_ignoreResultEngagements = a3;
}

- (BOOL)clientRankAndBlend
{
  return self->_clientRankAndBlend;
}

- (void)setClientRankAndBlend:(BOOL)a3
{
  self->_clientRankAndBlend = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_topAnalyticsItemPerSection, 0);

  objc_storeStrong((id *)&self->_analyticsItems, 0);
}

@end