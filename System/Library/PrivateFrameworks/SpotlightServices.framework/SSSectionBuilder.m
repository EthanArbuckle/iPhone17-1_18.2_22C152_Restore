@interface SSSectionBuilder
+ (BOOL)supportsSection:(id)a3;
+ (id)detailedRowCardSectionForCardSection:(id)a3;
+ (id)searchInAppButtonItemWithCommand:(id)a3;
+ (id)searchInAppButtonItemWithCommand:(id)a3 title:(id)a4;
+ (id)supportedBundleId;
+ (id)supportedBundleIds;
+ (id)visibleTextForCardSection:(id)a3 includeDescriptions:(BOOL)a4;
- (BOOL)hasEntities;
- (BOOL)isContactEntitySearch;
- (BOOL)isTopHitSection;
- (BOOL)shouldSkipSection;
- (BOOL)useHorizontallyScrollingCardSectionUI;
- (SFMutableResultSection)section;
- (SPSearchQueryContext)queryContext;
- (id)buildBridgedResult;
- (id)buildButtonItem;
- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4;
- (id)buildCardSections;
- (id)buildCardSectionsWithResult:(id)a3 resultBuilder:(id)a4;
- (id)buildCollectionCardSection;
- (id)buildCollectionStyle;
- (id)buildSection;
- (id)buildTitle;
- (id)bundleId;
- (int64_t)maxCardSections;
- (unint64_t)buildMaxInitiallyVisibleResults;
- (unint64_t)renderState;
- (void)setIsTopHitSection:(BOOL)a3;
- (void)setQueryContext:(id)a3;
- (void)setRenderState:(unint64_t)a3;
- (void)setSection:(id)a3;
@end

@implementation SSSectionBuilder

+ (id)searchInAppButtonItemWithCommand:(id)a3
{
  return (id)[a1 searchInAppButtonItemWithCommand:a3 title:0];
}

+ (id)searchInAppButtonItemWithCommand:(id)a3 title:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setSymbolName:@"arrow.up.forward.app.fill"];
  [v7 setIsTemplate:1];
  v8 = objc_opt_new();
  [v8 setCommand:v6];

  if (v5)
  {
    [v8 setTitle:v5];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"SEARCH_IN_APP_BUTTON_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
    [v8 setTitle:v10];
  }
  [v8 setImage:v7];

  return v8;
}

+ (id)supportedBundleId
{
  return 0;
}

+ (id)supportedBundleIds
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [a1 supportedBundleId];
  if (v3)
  {
    v4 = [a1 supportedBundleId];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSection:(id)a3
{
  id v4 = a3;
  id v5 = [a1 supportedBundleIds];
  id v6 = [v4 bundleIdentifier];
  if ([v5 containsObject:v6])
  {
    char v7 = 1;
  }
  else
  {
    v8 = [a1 supportedBundleIds];
    v9 = [v4 results];
    v10 = [v9 firstObject];
    v11 = [v10 sectionBundleIdentifier];
    char v7 = [v8 containsObject:v11];
  }
  return v7;
}

- (BOOL)isContactEntitySearch
{
  v2 = [(SSSectionBuilder *)self queryContext];
  v3 = [v2 searchEntities];
  id v4 = [v3 firstObject];
  char v5 = [v4 isContactEntitySearch];

  return v5;
}

- (BOOL)shouldSkipSection
{
  return 0;
}

- (id)bundleId
{
  v2 = [(SSSectionBuilder *)self section];
  v3 = [v2 bundleIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(id)objc_opt_class() supportedBundleIds];
    id v5 = [v6 firstObject];
  }
  return v5;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  return 0;
}

- (BOOL)hasEntities
{
  v2 = [(SSSectionBuilder *)self queryContext];
  v3 = [v2 searchEntities];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)buildSection
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(SSSectionBuilder *)self shouldSkipSection])
  {
    v3 = 0;
    goto LABEL_42;
  }
  BOOL v4 = [(SSSectionBuilder *)self section];
  id v5 = [v4 results];
  uint64_t v6 = [v5 count];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  char v7 = objc_msgSend(v4, "results", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = [v12 compactCard];
        if (v13)
        {
        }
        else
        {
          v14 = [v12 inlineCard];

          if (!v14)
          {

            goto LABEL_16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (!v6)
  {
LABEL_16:
    v15 = [v4 mutableDeepCopy];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = v15;
    }
    else if (v15)
    {
      v16 = [[SFMutableResultSection alloc] initWithSection:v15];
    }
    else
    {
      v16 = (SFMutableResultSection *)objc_opt_new();
    }
    v17 = v16;
    v18 = [(SSSectionBuilder *)self buildBridgedResult];
    uint64_t v19 = [v18 queryId];
    if (v19)
    {
      [v18 setQueryId:v19];
    }
    else
    {
      v20 = [(SSSectionBuilder *)self queryContext];
      objc_msgSend(v18, "setQueryId:", objc_msgSend(v20, "queryIdent"));
    }
    v21 = [v4 bundleIdentifier];
    if ([v21 isEqual:@"com.apple.spotlight.tophits"])
    {
      v22 = [v4 results];
      unint64_t v23 = [v22 count];

      if (v23 >= 2)
      {
        [v18 setShouldUseCompactDisplay:1];
        [v18 setUsesCompactDisplay:1];
      }
      if (v18) {
        goto LABEL_28;
      }
    }
    else
    {

      if (v18)
      {
LABEL_28:
        v24 = [(SFResultSection *)v17 bundleIdentifier];
        if (v24)
        {
          [(SFResultSection *)v17 setBundleIdentifier:v24];
        }
        else
        {
          v25 = [(SSSectionBuilder *)self bundleId];
          [(SFResultSection *)v17 setBundleIdentifier:v25];
        }
        v26 = [v18 sectionBundleIdentifier];
        if (v26)
        {
          [v18 setSectionBundleIdentifier:v26];
        }
        else
        {
          v27 = [(SFResultSection *)v17 bundleIdentifier];
          [v18 setSectionBundleIdentifier:v27];
        }
        v28 = [(SFResultSection *)v17 title];
        if (v28)
        {
          [(SFResultSection *)v17 setTitle:v28];
        }
        else
        {
          v29 = [(SSSectionBuilder *)self buildTitle];
          v30 = [v29 text];
          [(SFResultSection *)v17 setTitle:v30];
        }
        v38 = v18;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        [(SFMutableResultSection *)v17 setResults:v31];

        v32 = [(SSSectionBuilder *)self buildButtonItem];
        [(SFResultSection *)v17 setButton:v32];

        [(SFResultSection *)v17 setMaxInitiallyVisibleResults:[(SSSectionBuilder *)self buildMaxInitiallyVisibleResults]];
        v3 = v17;
        goto LABEL_40;
      }
    }
    v3 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v3 = v4;
LABEL_41:

LABEL_42:
  return v3;
}

- (id)buildBridgedResult
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSSectionBuilder *)self queryContext];
  uint64_t v4 = [v3 queryIdent];

  id v5 = [(SSSectionBuilder *)self section];
  uint64_t v6 = [v5 results];
  char v7 = [v6 firstObject];

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v8 inlineCard];
  uint64_t v10 = [v9 cardSections];
  v11 = [v10 firstObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [v8 compactCard];
    v13 = [v12 cardSections];
    uint64_t v14 = [v13 firstObject];

    v11 = (void *)v14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [(SSSectionBuilder *)self buildCollectionCardSection];

    v11 = (void *)v15;
  }
  v16 = [v11 cardSections];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = objc_opt_new();
    v30[0] = v11;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v18 setCardSections:v19];

    [v18 setQueryId:v4];
    [v8 setInlineCard:v18];
    if ([(SSSectionBuilder *)self isContactEntitySearch]) {
      v20 = 0;
    }
    else {
      v20 = v18;
    }
    [v8 setCompactCard:v20];
    [v8 setQueryId:v4];
    v21 = [v7 sectionBundleIdentifier];
    if (v21)
    {
      [v8 setSectionBundleIdentifier:v21];
    }
    else
    {
      unint64_t v23 = [(SSSectionBuilder *)self bundleId];
      [v8 setSectionBundleIdentifier:v23];
    }
    v24 = [v7 resultBundleId];
    if (v24)
    {
      [v8 setResultBundleId:v24];
    }
    else
    {
      v25 = [v8 sectionBundleIdentifier];
      [v8 setResultBundleId:v25];
    }
    v26 = [v7 applicationBundleIdentifier];
    [v8 setApplicationBundleIdentifier:v26];

    v27 = [v5 identifier];
    v28 = [@"bridged_result_" stringByAppendingString:v27];
    [v8 setIdentifier:v28];

    id v22 = v8;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)buildCollectionStyle
{
  if ([(SSSectionBuilder *)self useHorizontallyScrollingCardSectionUI])
  {
    v3 = objc_opt_new();
    [v3 setNumberOfRows:1];
  }
  else
  {
    v3 = objc_opt_new();
    [v3 setDrawPlattersIfNecessary:1];
  }
  objc_msgSend(v3, "setInitiallyVisibleCardSectionCount:", -[SSSectionBuilder buildMaxInitiallyVisibleResults](self, "buildMaxInitiallyVisibleResults"));
  return v3;
}

- (unint64_t)buildMaxInitiallyVisibleResults
{
  v3 = [(SSSectionBuilder *)self section];
  unint64_t v4 = [v3 maxInitiallyVisibleResults];

  if ([(SSSectionBuilder *)self useHorizontallyScrollingCardSectionUI]) {
    return 0;
  }
  if ([(SSSectionBuilder *)self hasEntities] || !v4 && !isMacOS()) {
    return 3;
  }
  return v4;
}

+ (id)detailedRowCardSectionForCardSection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)visibleTextForCardSection:(id)a3 includeDescriptions:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 detailedRowCardSectionForCardSection:a3];
  uint64_t v6 = [v5 title];
  char v7 = [v6 text];

  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = &stru_1F1824018;
  }
  uint64_t v10 = (void *)[v8 initWithString:v9];
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = objc_msgSend(v5, "descriptions", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v17 = [v16 text];

          if (v17)
          {
            v18 = [v16 text];
            [v10 appendString:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
  }
  uint64_t v19 = (void *)[v10 copy];

  return v19;
}

- (id)buildCollectionCardSection
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSSectionBuilder *)self section];
  BOOL v4 = [v3 button];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(SSSectionBuilder *)self buildButtonItem];
  }
  char v7 = v6;

  id v8 = objc_opt_new();
  uint64_t v9 = [(SSSectionBuilder *)self buildCollectionStyle];
  [v8 setCollectionStyle:v9];

  [v8 setButtonItem:v7];
  uint64_t v10 = [(SSSectionBuilder *)self buildTitle];
  [v8 setTitle:v10];

  v11 = [v8 collectionStyle];
  unint64_t v12 = [v11 initiallyVisibleCardSectionCount];

  uint64_t v13 = [(SSSectionBuilder *)self buildCardSections];
  uint64_t v14 = v13;
  if (v12)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v16)
    {
      v20 = v15;
      goto LABEL_20;
    }
    uint64_t v17 = v16;
    v31 = v14;
    v32 = v8;
    v33 = v7;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    v20 = 0;
    uint64_t v21 = *(void *)v36;
    while (2)
    {
      uint64_t v22 = 0;
      uint64_t v34 = v18 + v17;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v15);
        }
        long long v23 = [*(id *)(*((void *)&v35 + 1) + 8 * v22) spotlightBackingResult];
        long long v24 = [v23 identifier];

        if (([v20 isEqualToString:v24] & 1) == 0)
        {
          if (v19 == v12)
          {

            uint64_t v26 = v18 + v22;
            goto LABEL_17;
          }
          ++v19;
          id v25 = v24;

          v20 = v25;
        }

        ++v22;
      }
      while (v17 != v22);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v26 = v34;
      uint64_t v18 = v34;
      if (v17) {
        continue;
      }
      break;
    }
LABEL_17:

    char v7 = v33;
    uint64_t v14 = v31;
    id v8 = v32;
    if (v20)
    {
      v27 = [v32 collectionStyle];
      [v27 setInitiallyVisibleCardSectionCount:v26];

LABEL_20:
    }
  }
  if ([v14 count])
  {
    if (v7 && v12 && [v14 count] > v12)
    {
      uint64_t v28 = objc_msgSend(v14, "subarrayWithRange:", 0, v12);

      uint64_t v14 = (void *)v28;
    }
    [v8 setCardSections:v14];
    [(id)objc_opt_class() disambiguateUIIfNecessary:v14];
    id v29 = v8;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)buildTitle
{
  v2 = [(SSSectionBuilder *)self section];
  id v3 = [v2 title];
  if ([v3 length])
  {
    BOOL v4 = (void *)MEMORY[0x1E4F9A378];
    id v5 = [v2 title];
    id v6 = [v4 textWithString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)buildCardSections
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSSectionBuilder *)self section];
  v30 = [(SSSectionBuilder *)v2 queryContext];
  v31 = v3;
  BOOL v4 = [v3 resultSet];
  id v5 = [v4 array];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if ([(SSSectionBuilder *)v2 maxCardSections] < 1) {
    uint64_t v6 = [(SSSectionBuilder *)v2 buildMaxInitiallyVisibleResults];
  }
  else {
    uint64_t v6 = [(SSSectionBuilder *)v2 maxCardSections];
  }
  uint64_t v26 = v6;
  char v7 = [v3 button];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(SSSectionBuilder *)v2 buildButtonItem];
    BOOL v8 = v9 != 0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v29 = *(void *)v38;
    BOOL v12 = v26 > 0 && v8;
    BOOL v28 = v12;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v15 = [v31 bundleIdentifier];
        uint64_t v16 = [v15 isEqual:@"com.apple.spotlight.tophits"];

        uint64_t v17 = +[SSResultBuilder resultBuilderWithResult:v14 preferAppVendedView:v16];
        [v17 setQueryContext:v30];
        [v17 setIsTopHit:v16];
        uint64_t v18 = [(SSSectionBuilder *)v2 buildCardSectionsWithResult:v14 resultBuilder:v17];
        if ([v18 count])
        {
          uint64_t v19 = v2;
          [v32 addObjectsFromArray:v18];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v20 = v18;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v34 != v23) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v33 + 1) + 8 * j) setSpotlightBackingResult:v14];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v22);
          }

          v2 = v19;
        }
        if (v28 && [v32 count] >= v26)
        {

          goto LABEL_30;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_30:

  return v32;
}

- (id)buildCardSectionsWithResult:(id)a3 resultBuilder:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SSSectionBuilder *)self buildCardSectionWithResult:v6 resultBuilder:v7];
  if (v8) {
    goto LABEL_4;
  }
  if ([(SSSectionBuilder *)self useHorizontallyScrollingCardSectionUI])
  {
    uint64_t v8 = [v7 buildHorizontallyScrollingCardSection];
LABEL_4:
    uint64_t v9 = (void *)v8;
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v18 = [v6 inlineCard];
  uint64_t v10 = [v18 cardSections];

  if ([v10 count])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v19 = [v7 buildInlineCardSections];

    uint64_t v9 = 0;
    uint64_t v10 = (void *)v19;
  }
LABEL_5:
  uint64_t v11 = [v10 count];
  BOOL v12 = v10;
  if (v11)
  {
LABEL_6:
    id v13 = v12;
    goto LABEL_9;
  }
  if (!v9)
  {
    BOOL v12 = 0;
    goto LABEL_6;
  }
  v20[0] = v9;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
LABEL_9:
  uint64_t v14 = v13;

  id v15 = [v7 buildPreviewButtonItems];
  uint64_t v16 = [v14 firstObject];
  [v16 setPreviewButtonItems:v15];

  return v14;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return 0;
}

- (id)buildButtonItem
{
  id v3 = [(SSSectionBuilder *)self section];
  BOOL v4 = [v3 button];
  id v5 = [v3 results];
  id v6 = [v5 firstObject];
  id v7 = [v6 moreResultsPunchout];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [v5 lastObject];
    id v9 = [v10 moreResultsPunchout];
  }
  if (!v4)
  {
    uint64_t v11 = [(SSSectionBuilder *)self queryContext];
    BOOL v12 = [v11 searchEntities];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [(SSSectionBuilder *)self queryContext];
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = [v14 searchEntities];
      uint64_t v17 = [v16 firstObject];
      uint64_t v18 = [v17 displayString];
    }
    else
    {
      uint64_t v18 = [v14 searchString];
    }

    if (v9)
    {
      uint64_t v19 = [v9 userActivityData];
      id v20 = [v19 activityType];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F229D8]];

      if (v21)
      {
        uint64_t v22 = objc_opt_new();
        uint64_t v23 = [(SSSectionBuilder *)self section];
        long long v24 = [v23 preMergeBundleIdentifier];
        if (v24)
        {
          [v22 setApplicationBundleIdentifier:v24];
        }
        else
        {
          id v25 = [(SSSectionBuilder *)self section];
          uint64_t v26 = [v25 bundleIdentifier];
          [v22 setApplicationBundleIdentifier:v26];
        }
        [v22 setSearchString:v18];
      }
      else
      {
        uint64_t v22 = objc_opt_new();
        [v22 setPunchout:v9];
      }
      BOOL v4 = [(id)objc_opt_class() searchInAppButtonItemWithCommand:v22];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (int64_t)maxCardSections
{
  return -1;
}

- (SFMutableResultSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  return (SFMutableResultSection *)WeakRetained;
}

- (void)setSection:(id)a3
{
}

- (SPSearchQueryContext)queryContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryContext);
  return (SPSearchQueryContext *)WeakRetained;
}

- (void)setQueryContext:(id)a3
{
}

- (unint64_t)renderState
{
  return self->_renderState;
}

- (void)setRenderState:(unint64_t)a3
{
  self->_renderState = a3;
}

- (BOOL)isTopHitSection
{
  return self->_isTopHitSection;
}

- (void)setIsTopHitSection:(BOOL)a3
{
  self->_isTopHitSection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queryContext);
  objc_destroyWeak((id *)&self->_section);
}

@end