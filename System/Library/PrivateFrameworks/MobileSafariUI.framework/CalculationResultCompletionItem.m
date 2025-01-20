@interface CalculationResultCompletionItem
- (BOOL)isEquivalentTo:(id)a3;
- (CalculationResultCompletionItem)initWithQuery:(id)a3 calculationResult:(id)a4;
- (NSString)parsecDomainIdentifier;
- (NSString)titleForHistoryServiceCompletionList;
- (SFSearchResult)sfSearchResultValue;
- (WBSCalculationResult)calculationResult;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (int64_t)completionCellBackgroundModeInTopSection;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)setParsecQueryID:(int64_t)a3;
@end

@implementation CalculationResultCompletionItem

- (CalculationResultCompletionItem)initWithQuery:(id)a3 calculationResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CalculationResultCompletionItem;
  v9 = [(CalculationResultCompletionItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_parsecQueryID = [v7 queryID];
    objc_storeStrong((id *)&v10->_calculationResult, a4);
    v11 = v10;
  }

  return v10;
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  id v5 = a3;
  if ([(WBSCalculationResult *)self->_calculationResult isCurrencyConversion])
  {
    [v5 goToURLString:*MEMORY[0x1E4F997D0]];
  }
  else
  {
    v4 = [(WBSCalculationResult *)self->_calculationResult formattedExpression];
    [v5 search:v4];
  }
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:1 atRank:a3];
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)getSearchUIClass_softClass;
  uint64_t v16 = getSearchUIClass_softClass;
  if (!getSearchUIClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getSearchUIClass_block_invoke;
    v12[3] = &unk_1E6D77CE0;
    v12[4] = &v13;
    __getSearchUIClass_block_invoke((uint64_t)v12);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = [(CalculationResultCompletionItem *)self sfSearchResultValue];
  v17[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v9 = [v6 rowViewsForResults:v8 feedbackDelegate:v4];
  v10 = [v9 firstObject];

  return v10;
}

- (id)completionTableViewCellReuseIdentifier
{
  return @"CalculationResultCell";
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return (id)[(WBSCalculationResult *)self->_calculationResult reflectedStringForQueryString:a3];
}

- (SFSearchResult)sfSearchResultValue
{
  v51[1] = *MEMORY[0x1E4F143B8];
  sfSearchResultValue = self->_sfSearchResultValue;
  if (sfSearchResultValue)
  {
    v3 = sfSearchResultValue;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F9A3C0], "safari_sfSearchResultWithUniqueIdentifier");
    id v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    id v7 = [(WBSCompletionQuery *)self->_query queryString];
    [(SFSearchResult *)self->_sfSearchResultValue setUserInput:v7];

    [(SFSearchResult *)self->_sfSearchResultValue setQueryId:[(WBSCompletionQuery *)self->_query queryID]];
    id v8 = [@"com.apple.Safari.CompletionList." stringByAppendingString:@"CalculationResult"];
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v8];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v8];
    v9 = (void *)MEMORY[0x1E4F9A4C0];
    p_calculationResult = &self->_calculationResult;
    v11 = [(WBSCalculationResult *)self->_calculationResult formattedEquation];
    v12 = [v9 textWithString:v11];
    [(SFSearchResult *)self->_sfSearchResultValue setTitle:v12];

    if ([(WBSCalculationResult *)self->_calculationResult isCalculation]) {
      uint64_t v13 = 6;
    }
    else {
      uint64_t v13 = 7;
    }
    [(SFSearchResult *)self->_sfSearchResultValue setType:v13];
    id v14 = objc_alloc_init(MEMORY[0x1E4F9A380]);
    uint64_t v15 = NSString;
    uint64_t v16 = [(WBSCalculationResult *)*p_calculationResult formattedExpression];
    v17 = [v15 stringWithFormat:@"%@ =", v16];
    [v14 setTitle:v17];

    v18 = [(WBSCalculationResult *)*p_calculationResult formattedResult];
    [v14 setSubtitle:v18];

    [v14 setSubtitleIsEmphasized:1];
    if (objc_opt_respondsToSelector())
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F9A4E0]);
      v20 = [(WBSCalculationResult *)self->_calculationResult formattedResult];
      [v19 setCopyableString:v20];

      id v21 = objc_alloc_init(MEMORY[0x1E4F99FE8]);
      [v21 setCopyableItem:v19];
      id v22 = objc_alloc_init(MEMORY[0x1E4F99FB0]);
      [v22 setCommand:v21];
      v51[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      [v14 setButtonItems:v23];
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v24 = (void *)getSFCardClass_softClass;
    uint64_t v47 = getSFCardClass_softClass;
    if (!getSFCardClass_softClass)
    {
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __getSFCardClass_block_invoke;
      v42 = &unk_1E6D77CE0;
      v43 = &v44;
      __getSFCardClass_block_invoke((uint64_t)&v39);
      v24 = (void *)v45[3];
    }
    v25 = v24;
    _Block_object_dispose(&v44, 8);
    v26 = (void *)[[v25 alloc] init];
    if ([(WBSCalculationResult *)self->_calculationResult isCurrencyConversion])
    {
      [v14 setSeparatorStyle:1];
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2050000000;
      v27 = (void *)getSFLocalImageClass_softClass;
      uint64_t v47 = getSFLocalImageClass_softClass;
      if (!getSFLocalImageClass_softClass)
      {
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __getSFLocalImageClass_block_invoke;
        v42 = &unk_1E6D77CE0;
        v43 = &v44;
        __getSFLocalImageClass_block_invoke((uint64_t)&v39);
        v27 = (void *)v45[3];
      }
      v28 = v27;
      _Block_object_dispose(&v44, 8);
      v29 = (void *)[[v28 alloc] init];
      [v29 setLocalImageType:3];
      objc_msgSend(v29, "setSize:", 78.0, 12.0);
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2050000000;
      v30 = (void *)getSFRichTextClass_softClass;
      uint64_t v47 = getSFRichTextClass_softClass;
      if (!getSFRichTextClass_softClass)
      {
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __getSFRichTextClass_block_invoke;
        v42 = &unk_1E6D77CE0;
        v43 = &v44;
        __getSFRichTextClass_block_invoke((uint64_t)&v39);
        v30 = (void *)v45[3];
      }
      v31 = v30;
      _Block_object_dispose(&v44, 8);
      v32 = (void *)[[v31 alloc] init];
      v50 = v29;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      [v32 setIcons:v33];

      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2050000000;
      v34 = (void *)getSFAttributionFooterCardSectionClass_softClass;
      uint64_t v47 = getSFAttributionFooterCardSectionClass_softClass;
      if (!getSFAttributionFooterCardSectionClass_softClass)
      {
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __getSFAttributionFooterCardSectionClass_block_invoke;
        v42 = &unk_1E6D77CE0;
        v43 = &v44;
        __getSFAttributionFooterCardSectionClass_block_invoke((uint64_t)&v39);
        v34 = (void *)v45[3];
      }
      v35 = v34;
      _Block_object_dispose(&v44, 8);
      v36 = (void *)[[v35 alloc] init];
      [v36 setTrailingAttribution:v32];
      v49[0] = v14;
      v49[1] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      [v26 setCardSections:v37];
    }
    else
    {
      id v48 = v14;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      [v26 setCardSections:v29];
    }

    [(SFSearchResult *)self->_sfSearchResultValue setInlineCard:v26];
    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return (NSString *)[(WBSCalculationResult *)self->_calculationResult formattedResult];
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WBSCalculationResult *)self->_calculationResult formattedExpression];
    id v6 = [v4[4] formattedExpression];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)completionCellBackgroundModeInTopSection
{
  return 1;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCalculationResult)calculationResult
{
  return self->_calculationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculationResult, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end