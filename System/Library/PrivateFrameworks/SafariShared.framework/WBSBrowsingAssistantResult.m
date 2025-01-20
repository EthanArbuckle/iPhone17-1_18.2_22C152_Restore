@interface WBSBrowsingAssistantResult
- (BOOL)remoteContentAvailableForFetching;
- (BOOL)remoteContentReady;
- (BOOL)tableOfContentsAvailable;
- (NSArray)allResults;
- (NSArray)entityResults;
- (NSArray)tableOfContentsPaths;
- (NSArray)tableOfContentsTitles;
- (NSArray)tableOfContentsTrailingText;
- (NSString)disclaimerText;
- (NSString)summaryText;
- (NSURL)pageURL;
- (SFSearchResult)summaryResult;
- (WBSBrowsingAssistantResult)initWithURL:(id)a3 contentOptions:(unint64_t)a4;
- (id)_extractDisclaimerFromResult:(id)a3;
- (id)_extractSummaryFromResult:(id)a3;
- (int64_t)remoteContentState;
- (unint64_t)contentOptions;
- (void)_clearAllRemoteContent;
- (void)_clearSummaryAndTableOfContents;
- (void)_setUpTableOfContentsDataUsingResult:(id)a3;
- (void)_setUpWithContentOptions:(unint64_t)a3;
- (void)_updateContentOptions:(unint64_t)a3 inMask:(unint64_t)a4;
- (void)setRemoteContentState:(int64_t)a3;
- (void)setTableOfContentsAvailable:(BOOL)a3;
- (void)updateForLocalContentWithOptions:(unint64_t)a3;
- (void)updateForRemoteContentWithOptions:(unint64_t)a3;
- (void)updateWithSearchResults:(id)a3;
@end

@implementation WBSBrowsingAssistantResult

- (WBSBrowsingAssistantResult)initWithURL:(id)a3 contentOptions:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSBrowsingAssistantResult;
  v7 = [(WBSBrowsingAssistantResult *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    pageURL = v7->_pageURL;
    v7->_pageURL = (NSURL *)v8;

    [(WBSBrowsingAssistantResult *)v7 _setUpWithContentOptions:a4];
    v10 = v7;
  }

  return v7;
}

- (void)_setUpWithContentOptions:(unint64_t)a3
{
  -[WBSBrowsingAssistantResult updateForLocalContentWithOptions:](self, "updateForLocalContentWithOptions:");
  [(WBSBrowsingAssistantResult *)self updateForRemoteContentWithOptions:a3];
}

- (void)updateForRemoteContentWithOptions:(unint64_t)a3
{
  char v3 = a3;
  [(WBSBrowsingAssistantResult *)self _updateContentOptions:a3 inMask:31];
  if ((v3 & 0x1F) != 0) {
    self->_remoteContentState = 2;
  }
}

- (void)updateForLocalContentWithOptions:(unint64_t)a3
{
}

- (void)_updateContentOptions:(unint64_t)a3 inMask:(unint64_t)a4
{
  self->_contentOptions |= a4 & a3;
}

- (id)_extractSummaryFromResult:(id)a3
{
  v4 = [a3 inlineCard];
  v5 = [v4 cardSections];
  id v6 = [v5 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 text];
    uint64_t v8 = objc_msgSend(v7, "text_elements");
    v9 = [v8 firstObject];

    v10 = objc_msgSend(v9, "formatted_text");
    v11 = [v10 firstObject];

    if (v11
      && ([v11 text],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 length],
          v12,
          v13))
    {
      v14 = [v11 text];
      v15 = (void *)[v14 copy];
    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[WBSBrowsingAssistantResult _extractSummaryFromResult:]((uint64_t)self, v17);
      }
      [(WBSBrowsingAssistantResult *)self _clearSummaryAndTableOfContents];
      v15 = 0;
    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(WBSBrowsingAssistantResult *)(uint64_t)self _extractSummaryFromResult:v6];
    }
    [(WBSBrowsingAssistantResult *)self _clearSummaryAndTableOfContents];
    v15 = 0;
  }

  return v15;
}

- (id)_extractDisclaimerFromResult:(id)a3
{
  v4 = [a3 inlineCard];
  v5 = [v4 cardSections];
  id v6 = objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_102);
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 text];
    v9 = objc_msgSend(v8, "text_elements");
    v10 = [v9 firstObject];

    v11 = objc_msgSend(v10, "formatted_text");
    objc_super v12 = [v11 firstObject];

    if (v12
      && ([v12 text],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 length],
          v13,
          v14))
    {
      v15 = [v12 text];
      v16 = (void *)[v15 copy];
    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[WBSBrowsingAssistantResult _extractDisclaimerFromResult:]((uint64_t)self, v17);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __59__WBSBrowsingAssistantResult__extractDisclaimerFromResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_setUpTableOfContentsDataUsingResult:(id)a3
{
  v4 = [a3 inlineCard];
  v5 = [v4 cardSections];
  id v6 = [v5 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tableOfContentsTitles = self->_tableOfContentsTitles;
    uint64_t v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    self->_tableOfContentsTitles = (NSArray *)MEMORY[0x1E4F1CBF0];

    tableOfContentsPaths = self->_tableOfContentsPaths;
    self->_tableOfContentsPaths = v8;

    tableOfContentsTrailingText = self->_tableOfContentsTrailingText;
    self->_tableOfContentsTrailingText = v8;

    v11 = [v6 tableOfContentsItems];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__WBSBrowsingAssistantResult__setUpTableOfContentsDataUsingResult___block_invoke;
    v12[3] = &unk_1E5C9FB88;
    v12[4] = self;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __67__WBSBrowsingAssistantResult__setUpTableOfContentsDataUsingResult___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(*(void *)(a1 + 32) + 64);
  id v4 = a2;
  uint64_t v5 = [v4 text];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EFBE3CF8;
  }
  uint64_t v8 = [v3 arrayByAddingObject:v7];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = v8;

  v11 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v12 = [v4 elementPath];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_1EFBE3CF8;
  }
  uint64_t v15 = [v11 arrayByAddingObject:v14];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 72);
  *(void *)(v16 + 72) = v15;

  v18 = *(void **)(*(void *)(a1 + 32) + 80);
  v23 = [v4 trailingText];

  if (v23) {
    v19 = v23;
  }
  else {
    v19 = &stru_1EFBE3CF8;
  }
  uint64_t v20 = [v18 arrayByAddingObject:v19];
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 80);
  *(void *)(v21 + 80) = v20;
}

- (void)updateWithSearchResults:(id)a3
{
  id v4 = a3;
  self->_remoteContentState = 4;
  id v12 = v4;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(v12, "safari_firstObjectPassingTest:", &__block_literal_global_13_1);
    if (v5)
    {
      id v6 = [(WBSBrowsingAssistantResult *)self _extractSummaryFromResult:v5];
      summaryText = self->_summaryText;
      self->_summaryText = v6;

      uint64_t v8 = [(WBSBrowsingAssistantResult *)self _extractDisclaimerFromResult:v5];
      disclaimerText = self->_disclaimerText;
      self->_disclaimerText = v8;

      [(WBSBrowsingAssistantResult *)self _setUpTableOfContentsDataUsingResult:v5];
      if (self->_summaryText) {
        objc_storeStrong((id *)&self->_summaryResult, v5);
      }
      objc_msgSend(v12, "safari_arrayByRemovingObject:", v5);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (NSArray *)v12;
    }
    entityResults = self->_entityResults;
    self->_entityResults = v10;
  }
  else
  {
    self->_tableOfContentsAvailable = 0;
    [(WBSBrowsingAssistantResult *)self _clearAllRemoteContent];
  }
}

uint64_t __54__WBSBrowsingAssistantResult_updateWithSearchResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 domainName];
  uint64_t v3 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", @"sba");

  return v3;
}

- (void)_clearSummaryAndTableOfContents
{
  summaryText = self->_summaryText;
  self->_summaryText = 0;

  summaryResult = self->_summaryResult;
  self->_summaryResult = 0;

  tableOfContentsTitles = self->_tableOfContentsTitles;
  self->_tableOfContentsTitles = 0;

  tableOfContentsPaths = self->_tableOfContentsPaths;
  self->_tableOfContentsPaths = 0;

  tableOfContentsTrailingText = self->_tableOfContentsTrailingText;
  self->_tableOfContentsTrailingText = 0;

  self->_tableOfContentsAvailable = 0;
}

- (void)_clearAllRemoteContent
{
  [(WBSBrowsingAssistantResult *)self _clearSummaryAndTableOfContents];
  entityResults = self->_entityResults;
  self->_entityResults = 0;

  self->_contentOptions &= 0xFFFFFFFFFFFFFFE0;
}

- (BOOL)remoteContentAvailableForFetching
{
  return (self->_contentOptions & 0x1F) != 0;
}

- (BOOL)remoteContentReady
{
  return self->_remoteContentState == 4;
}

- (NSArray)allResults
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_summaryResult);
  objc_msgSend(v3, "safari_addObjectsFromArrayUnlessNil:", self->_entityResults);
  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (SFSearchResult)summaryResult
{
  return self->_summaryResult;
}

- (NSArray)entityResults
{
  return self->_entityResults;
}

- (BOOL)tableOfContentsAvailable
{
  return self->_tableOfContentsAvailable;
}

- (void)setTableOfContentsAvailable:(BOOL)a3
{
  self->_tableOfContentsAvailable = a3;
}

- (NSArray)tableOfContentsTitles
{
  return self->_tableOfContentsTitles;
}

- (NSArray)tableOfContentsPaths
{
  return self->_tableOfContentsPaths;
}

- (NSArray)tableOfContentsTrailingText
{
  return self->_tableOfContentsTrailingText;
}

- (int64_t)remoteContentState
{
  return self->_remoteContentState;
}

- (void)setRemoteContentState:(int64_t)a3
{
  self->_remoteContentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContentsTrailingText, 0);
  objc_storeStrong((id *)&self->_tableOfContentsPaths, 0);
  objc_storeStrong((id *)&self->_tableOfContentsTitles, 0);
  objc_storeStrong((id *)&self->_entityResults, 0);
  objc_storeStrong((id *)&self->_summaryResult, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

- (void)_extractSummaryFromResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138739971;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Received empty summary for URL %{sensitive}@", (uint8_t *)&v3, 0xCu);
}

- (void)_extractSummaryFromResult:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = a2;
  id v6 = [a3 type];
  int v7 = 138478083;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Received unexpected summary card section: URL %{private}@, section %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_extractDisclaimerFromResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138739971;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Received an empty disclaimer for URL %{sensitive}@", (uint8_t *)&v3, 0xCu);
}

@end