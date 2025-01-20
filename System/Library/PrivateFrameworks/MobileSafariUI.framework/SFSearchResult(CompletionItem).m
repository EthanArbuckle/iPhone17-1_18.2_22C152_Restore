@interface SFSearchResult(CompletionItem)
+ (void)prewarmSearchUI;
- (NewsCompletionHeaderView)completionTableHeaderView;
- (__CFString)completionTableHeaderViewReuseIdentifier;
- (__CFString)completionTableViewCellReuseIdentifier;
- (id)completionTableViewCellForCompletionList:()CompletionItem;
- (id)handlerForActionItem;
- (id)originalURLString;
- (id)reflectedStringForUserTypedString:()CompletionItem;
- (id)safari_titleForReflection;
- (id)urlStringForHistoryServiceCompletionList;
- (id)userVisibleURLString;
- (uint64_t)completionCellBackgroundModeInTopSection;
- (uint64_t)isEquivalentTo:()CompletionItem;
- (uint64_t)parsecDomainIdentifier;
- (uint64_t)restoresSearchState;
- (uint64_t)usesDefaultHeaderView;
- (void)acceptCompletionWithActionHandler:()CompletionItem;
- (void)auditAcceptedCompletionWithRank:()CompletionItem;
- (void)configureCompletionTableHeaderView:()CompletionItem forCompletionListGroup:;
- (void)configureCompletionTableViewCell:()CompletionItem forCompletionList:;
- (void)punchoutWithHandler:()CompletionItem;
- (void)safari_configureBackgroundColorForCompletionList:()CompletionItem;
- (void)safari_setCompletionIconForCompactRow:()CompletionItem;
- (void)setHandlerForActionItem:()CompletionItem;
@end

@implementation SFSearchResult(CompletionItem)

- (id)completionTableViewCellForCompletionList:()CompletionItem
{
  id v4 = a3;
  v5 = [getSearchUIClass() rowViewForResult:a1 style:0 feedbackDelegate:v4];

  return v5;
}

+ (void)prewarmSearchUI
{
  if (prewarmSearchUI_onceToken != -1) {
    dispatch_once(&prewarmSearchUI_onceToken, &__block_literal_global_27);
  }
}

- (void)configureCompletionTableViewCell:()CompletionItem forCompletionList:
{
  id v7 = a3;
  objc_msgSend(a1, "safari_configureBackgroundColorForCompletionList:", a4);
  v6 = [a1 resultType];
  [v7 setAccessibilityIdentifier:v6];

  if (objc_opt_respondsToSelector()) {
    [v7 updateWithResult:a1];
  }
}

- (NewsCompletionHeaderView)completionTableHeaderView
{
  if (-[SFSearchResult _willShowNewsHeader](a1))
  {
    v2 = [NewsCompletionHeaderView alloc];
    v3 = [a1 completionTableHeaderViewReuseIdentifier];
    id v4 = [(NewsCompletionHeaderView *)v2 initWithReuseIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (__CFString)completionTableHeaderViewReuseIdentifier
{
  if (-[SFSearchResult _willShowNewsHeader](a1)) {
    return @"ParsecNewsHeaderView";
  }
  else {
    return 0;
  }
}

- (uint64_t)usesDefaultHeaderView
{
  return -[SFSearchResult _willShowNewsHeader](a1) ^ 1;
}

- (void)configureCompletionTableHeaderView:()CompletionItem forCompletionListGroup:
{
  id v9 = a3;
  id v6 = a4;
  if (-[SFSearchResult _willShowNewsHeader](a1))
  {
    id v7 = v9;
    v8 = [v6 title];
    [v7 setHeaderText:v8];
  }
}

- (void)acceptCompletionWithActionHandler:()CompletionItem
{
  id v12 = a3;
  if (![MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled]
    || (getSearchUIClass(), (objc_opt_respondsToSelector() & 1) == 0)
    || (id v4 = getSearchUIClass(),
        +[WBSParsecDSession sharedPARSession],
        v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 hasValidCommandForResult:a1 feedbackListener:v5],
        v5,
        (v4 & 1) == 0))
  {
    id v6 = [a1 card];
    if (v6)
    {
      id SearchUIClass = getSearchUIClass();
      v8 = [v12 searchUIFeedbackDelegate];
      id v9 = [SearchUIClass cardViewControllerForCard:v6 feedbackDelegate:v8];

      if (v9)
      {
        [v12 presentDetail:v9];
        v10 = [MEMORY[0x1E4F98E20] sharedRecorder];
        v11 = [a1 url];
        [v10 didActualizeImpressionForURL:v11 provenance:1];
      }
      else
      {
        [a1 punchoutWithHandler:v12];
      }
    }
    else
    {
      [a1 punchoutWithHandler:v12];
    }
  }
}

- (void)punchoutWithHandler:()CompletionItem
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v4 = [a1 punchout];
  v5 = [v4 urls];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v62 = *(void *)v69;
    id v57 = v6;
    v55 = a1;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v58 = v8;
      do
      {
        if (*(void *)v69 != v62) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v68 + 1) + 8 * v9);
        v11 = [v10 scheme];
        if (isNewsScheme(v11))
        {
          id v12 = _newsProxy();
          [v12 appState];
          v14 = uint64_t v13 = v9;
          int v15 = [v14 isInstalled];

          uint64_t v9 = v13;
          if (v15) {
            goto LABEL_40;
          }
        }
        else
        {
          if (([v11 isEqualToString:@"weather"] & 1) != 0
            || [v11 isEqualToString:@"stocks"])
          {
LABEL_40:
            v52 = [MEMORY[0x1E4F223E0] defaultWorkspace];
            [v52 openSensitiveURL:v10 withOptions:0];

            v54 = [MEMORY[0x1E4F98E20] sharedRecorder];
            v53 = [v55 url];
            [v54 didActualizeImpressionForURL:v53 provenance:1];

LABEL_41:
            v41 = v6;
            goto LABEL_42;
          }
          if ([v11 isEqualToString:@"app-distr"])
          {
            v61 = v11;
            id v16 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
            [v16 setNumberStyle:1];
            v17 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v10 resolvingAgainstBaseURL:0];
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            v60 = v17;
            id obj = [v17 queryItems];
            uint64_t v18 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
            uint64_t v59 = v9;
            if (v18)
            {
              uint64_t v19 = v18;
              v20 = 0;
              uint64_t v21 = 0;
              uint64_t v22 = 0;
              uint64_t v23 = *(void *)v65;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v65 != v23) {
                    objc_enumerationMutation(obj);
                  }
                  v25 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                  v26 = [v25 name];
                  int v27 = [v26 isEqualToString:@"bundle_id"];

                  if (v27)
                  {
                    uint64_t v28 = [v25 value];

                    uint64_t v22 = v28;
                  }
                  v29 = [v25 name];
                  int v30 = [v29 isEqualToString:@"adam_id"];

                  if (v30)
                  {
                    v31 = [v25 value];
                    uint64_t v32 = [v16 numberFromString:v31];

                    uint64_t v21 = v32;
                  }
                  v33 = [v25 name];
                  int v34 = [v33 isEqualToString:@"ext_version_id"];

                  if (v34)
                  {
                    v35 = [v25 value];
                    uint64_t v36 = [v16 numberFromString:v35];

                    v20 = (void *)v36;
                  }
                }
                uint64_t v19 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
              }
              while (v19);
            }
            else
            {
              v20 = 0;
              uint64_t v21 = 0;
              uint64_t v22 = 0;
            }

            if (v22 | v21)
            {
              v54 = (void *)v22;
              [MEMORY[0x1E4F781B8] handlePunchoutWithBundleID:v22 adamID:v21 externalVersionID:v20];

              id v6 = v57;
              v41 = v57;
              v11 = v61;
              goto LABEL_42;
            }

            id v6 = v57;
            uint64_t v8 = v58;
            v11 = v61;
            uint64_t v9 = v59;
          }
          else
          {
            v37 = [MEMORY[0x1E4FB1438] sharedApplication];
            int v38 = [v37 canOpenURL:v10];

            if (v38)
            {
              v54 = [v10 host];
              if ([v54 isEqualToString:@"maps.apple.com"]
                && !-[SFSearchResult _usesMapsPlacecard](v55)
                || ([v54 isEqualToString:@"itunes.apple.com"] & 1) != 0
                || [v54 isEqualToString:@"weather.apple.com"])
              {
                [v56 openURLInExternalApplication:v10];
              }
              else
              {
                [v56 goToURL:v10];
              }
              goto LABEL_41;
            }
          }
        }

        ++v9;
      }
      while (v9 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v68 objects:v73 count:16];
      a1 = v55;
      if (v8) {
        continue;
      }
      break;
    }
  }

  v39 = [a1 domainName];
  int v40 = [v39 isEqualToString:@"web_answer"];

  if (v40)
  {
    v41 = objc_msgSend(a1, "_sf_punchoutURL");
    if (v41) {
      [v56 goToURL:v41];
    }
    v42 = [a1 inlineCard];
    v43 = [v42 cardSections];
    v11 = [v43 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [v11 cardSections];
      v54 = [v44 firstObject];

      uint64_t v45 = [v54 command];
      if (v45)
      {
        v46 = (void *)v45;
        v47 = [v54 command];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v49 = [v11 command];
          v50 = [v49 punchout];
          v51 = [v50 preferredOpenableURL];
          [v56 goToURL:v51];
        }
      }
LABEL_42:
    }
  }
}

- (id)userVisibleURLString
{
  v1 = [a1 punchout];
  v2 = [v1 urls];
  v3 = [v2 firstObject];
  id v4 = objc_msgSend(v3, "safari_userVisibleString");

  return v4;
}

- (id)originalURLString
{
  v1 = [a1 punchout];
  v2 = [v1 urls];
  v3 = [v2 firstObject];
  id v4 = objc_msgSend(v3, "safari_userVisibleString");

  return v4;
}

- (void)auditAcceptedCompletionWithRank:()CompletionItem
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:10 atRank:a3];
}

- (uint64_t)restoresSearchState
{
  return 1;
}

- (__CFString)completionTableViewCellReuseIdentifier
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getSearchUITableViewCellClass_softClass;
  uint64_t v12 = getSearchUITableViewCellClass_softClass;
  if (!getSearchUITableViewCellClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getSearchUITableViewCellClass_block_invoke;
    v8[3] = &unk_1E6D77CE0;
    v8[4] = &v9;
    __getSearchUITableViewCellClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 reuseIdentifierForResult:a1];
  v5 = v4;
  if (!v4) {
    id v4 = @"SFSearchResultParsec";
  }
  id v6 = v4;

  return v6;
}

- (id)reflectedStringForUserTypedString:()CompletionItem
{
  id v4 = (void *)MEMORY[0x1E4F98DB0];
  id v5 = a3;
  id v6 = [a1 userVisibleURLString];
  uint64_t v7 = [a1 completedQuery];
  LODWORD(v4) = [v4 shouldAutocompleteToURL:v6 fromUserTypedString:v5 withPredictedQueryString:v7];

  if (v4)
  {
    uint64_t v8 = [a1 completedQuery];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (uint64_t)parsecDomainIdentifier
{
  return 0;
}

- (id)handlerForActionItem
{
  return objc_getAssociatedObject(a1, (const void *)actionItemHandlerKey);
}

- (void)setHandlerForActionItem:()CompletionItem
{
}

- (uint64_t)isEquivalentTo:()CompletionItem
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [a1 title];
    uint64_t v7 = [v6 text];
    uint64_t v8 = [v5 title];
    uint64_t v9 = [v8 text];
    int v10 = WBSIsEqual();

    if (v10)
    {
      uint64_t v11 = [a1 userVisibleURLString];
      uint64_t v12 = [v5 userVisibleURLString];
      uint64_t v13 = WBSIsEqual();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (uint64_t)completionCellBackgroundModeInTopSection
{
  v2 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());

  if (v2) {
    return 0;
  }
  id v3 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());

  if (v3) {
    return 0;
  }
  if ([MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled])
  {
    id v5 = [a1 inlineCard];
    id v6 = [v5 backgroundColor];

    if (v6) {
      return 2;
    }
  }
  uint64_t v7 = [a1 inlineCard];
  uint64_t v8 = [v7 cardSections];
  int v9 = objc_msgSend(v8, "safari_containsObjectPassingTest:", &__block_literal_global_85);

  if (v9) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)safari_configureBackgroundColorForCompletionList:()CompletionItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a3 shouldOverrideBackgroundViewForItem:a1])
  {
    id v4 = [a1 inlineCard];
    [v4 setBackgroundColor:0];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(a1, "inlineCard", 0);
    id v6 = [v5 cardSections];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setBackgroundColor:0];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)urlStringForHistoryServiceCompletionList
{
  v1 = [a1 sfSearchResultValue];
  v2 = [v1 userVisibleURLString];

  return v2;
}

- (void)safari_setCompletionIconForCompactRow:()CompletionItem
{
  id v4 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  if (v4)
  {
    id v10 = v4;
    id v5 = [v4 image];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = systemImageNameForCompletionIcon(a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v5 symbolName],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v7 isEqualToString:v6],
            v7,
            (v8 & 1) == 0))
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F9A498]);
        [v9 setSymbolName:v6];
        [v9 setIsTemplate:1];
        [v10 setImage:v9];
      }
    }

    id v4 = v10;
  }
}

- (id)safari_titleForReflection
{
  v2 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 title];
    id v5 = [v4 text];
  }
  else
  {
    id v6 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    id v4 = v6;
    if (v6)
    {
      uint64_t v7 = [v6 leadingText];
      id v5 = [v7 text];
    }
    else
    {
      uint64_t v7 = objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
      char v8 = [v7 title];
      id v5 = [v8 text];
    }
  }

  return v5;
}

@end