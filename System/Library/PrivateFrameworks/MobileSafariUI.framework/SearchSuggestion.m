@interface SearchSuggestion
+ (id)relativeDateTimeFormatter;
- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled;
- (BOOL)goesToURL;
- (BOOL)hasBeenSearchedBefore;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)needsSectionHeader;
- (BOOL)restoresSearchState;
- (NSString)description;
- (NSString)parsecDomainIdentifier;
- (NSString)string;
- (NSString)titleForHistoryServiceCompletionList;
- (SFSearchResult)sfSearchResultValue;
- (SearchSuggestion)initWithRecentSearchString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5;
- (SearchSuggestion)initWithSearchEngineSuggestion:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5 isOfflineSearchSuggestion:(BOOL)a6;
- (SearchSuggestion)initWithUserTypedQuery:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (WBSCompletionQuery)query;
- (double)completionTableViewCellCustomHeightForCompletionList:(id)a3;
- (double)lastVisitTimeInterval;
- (id)_initWithString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (void)_accessoryButtonTapped;
- (void)_configureHistoryLastAccessedLabelForTableViewCellIfNeeded:(id)a3;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4;
- (void)setHandlerForActionItem:(id)a3;
- (void)setHasBeenSearchedBefore:(BOOL)a3;
- (void)setLastVisitTimeInterval:(double)a3;
- (void)setParsecQueryID:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation SearchSuggestion

+ (id)relativeDateTimeFormatter
{
  if (relativeDateTimeFormatter_onceToken != -1) {
    dispatch_once(&relativeDateTimeFormatter_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)relativeDateTimeFormatter__relativeDateTimeFormatter;
  return v2;
}

void __45__SearchSuggestion_relativeDateTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28FE0]);
  v1 = (void *)relativeDateTimeFormatter__relativeDateTimeFormatter;
  relativeDateTimeFormatter__relativeDateTimeFormatter = (uint64_t)v0;
}

- (id)_initWithString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchSuggestion;
  v10 = [(SearchSuggestion *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    string = v10->_string;
    v10->_string = (NSString *)v11;

    objc_storeStrong((id *)&v10->_userQuery, a4);
    v10->_parsecQueryID = [(WBSCompletionQuery *)v10->_userQuery queryID];
    v10->_forPrivateBrowsing = a5;
    v13 = v10;
  }

  return v10;
}

- (SearchSuggestion)initWithUserTypedQuery:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 queryString];
  id v8 = [(SearchSuggestion *)self _initWithString:v7 userQuery:v6 forPrivateBrowsing:v4];

  if (v8)
  {
    v8->_asTypedSuggestion = 1;
    id v9 = v8;
  }

  return v8;
}

- (SearchSuggestion)initWithRecentSearchString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  v5 = [(SearchSuggestion *)self _initWithString:a3 userQuery:a4 forPrivateBrowsing:a5];
  id v6 = v5;
  if (v5)
  {
    v5->_recentSearch = 1;
    v7 = v5;
  }

  return v6;
}

- (SearchSuggestion)initWithSearchEngineSuggestion:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5 isOfflineSearchSuggestion:(BOOL)a6
{
  v7 = [(SearchSuggestion *)self _initWithString:a3 userQuery:a4 forPrivateBrowsing:a5];
  id v8 = v7;
  if (v7)
  {
    v7->_searchEngineSuggestion = 1;
    v7->_offlineSearchEngineSuggestion = a6;
    v7->_goesToURL = (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) < 2;
    id v9 = v8;
  }

  return v8;
}

- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled
{
  return [MEMORY[0x1E4F97EA0] isLabelPreviousSearchesInCompletionListEnabled];
}

- (void)setQuery:(id)a3
{
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userQuery, a3);
    if (self->_asTypedSuggestion)
    {
      v5 = [v7 queryString];
      string = self->_string;
      self->_string = v5;
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  if (self->_forPrivateBrowsing) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; string = %@; goes to URL: %d; private = %@>",
    v5,
    self,
    self->_string,
    self->_goesToURL,
  id v8 = v7);

  return (NSString *)v8;
}

- (void)_accessoryButtonTapped
{
  self->_handlingAccessoryButtonTap = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  [WeakRetained searchTextCompletionAccessoryButtonTappedForCompletionItem:self];

  self->_handlingAccessoryButtonTap = 0;
}

- (void)setHandlerForActionItem:(id)a3
{
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_string)
  {
    id v8 = v6;
    BOOL goesToURL = self->_goesToURL;
    v32 = @"destination";
    if (goesToURL) {
      v10 = @"URL";
    }
    else {
      v10 = @"Search";
    }
    v33[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v12 = WBSMakeAccessibilityIdentifier();
    [v8 setAccessibilityIdentifier:v12];

    if (self->_goesToURL)
    {
      v13 = (void *)MEMORY[0x1E4FB1818];
      v14 = systemImageNameForCompletionIcon(5);
      objc_super v15 = [v13 systemImageNamed:v14];
      v16 = [v8 imageView];
      [v16 setImage:v15];

      -[UITableViewCell safari_setLinkedPageTitle:description:](v8, (const char *)self->_string, (uint64_t)&stru_1F3C268E8);
      [v8 setHidesCompletionArrowView:1];
      v17 = [v8 textLabel];
      v18 = (void *)MEMORY[0x1E4FB1618];
      objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = [(NSString *)v19 safari_numberForKey:*MEMORY[0x1E4F78720]];
      v21 = objc_msgSend(v18, "safari_labelColorFromNumber:", v20);
      [v17 setTextColor:v21];
    }
    else
    {
      [v8 setHidesImage:0];
      v17 = [v8 textLabel];
      v23 = [v8 traitCollection];
      v19 = [v23 preferredContentSizeCategory];

      if (UIContentSizeCategoryIsAccessibilityCategory(v19)) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = 2;
      }
      [v17 setNumberOfLines:v24];
      [v8 setSearchSuggestion:self->_string withQuery:self->_userQuery];
      if ([(SearchSuggestion *)self _isLabelPreviousSearchesInCompletionListEnabled])
      {
        [(SearchSuggestion *)self _configureHistoryLastAccessedLabelForTableViewCellIfNeeded:v8];
      }
      v25 = [(WBSCompletionQuery *)self->_userQuery queryString];
      int v26 = [v25 isEqualToString:self->_string];

      if (v26)
      {
        [v8 setHidesCompletionArrowView:1];
      }
      else
      {
        v27 = [v7 browserController];
        v28 = [v27 rootViewController];
        objc_msgSend(v8, "setUsesDownBackwardCompletionArrow:", objc_msgSend(v28, "isUsingBottomCapsule"));

        [v8 setHidesCompletionArrowView:0];
        objc_initWeak(&location, self);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __71__SearchSuggestion_configureCompletionTableViewCell_forCompletionList___block_invoke;
        v29[3] = &unk_1E6D78630;
        objc_copyWeak(&v30, &location);
        [v8 setAccessoryActionHandler:v29];
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SearchSuggestion configureCompletionTableViewCell:forCompletionList:](v22);
    }
  }
}

void __71__SearchSuggestion_configureCompletionTableViewCell_forCompletionList___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessoryButtonTapped];
}

- (void)_configureHistoryLastAccessedLabelForTableViewCellIfNeeded:(id)a3
{
  id v16 = a3;
  if ([(SearchSuggestion *)self hasBeenSearchedBefore]
    && [(SearchSuggestion *)self _isLabelPreviousSearchesInCompletionListEnabled])
  {
    BOOL v4 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v5 = systemImageNameForCompletionIcon(3);
    id v6 = [v4 systemImageNamed:v5];
    id v7 = [v16 imageView];
    [v7 setImage:v6];

    [(SearchSuggestion *)self lastVisitTimeInterval];
    double v9 = v8;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v9 - v10;
    [(SearchSuggestion *)self lastVisitTimeInterval];
    BOOL v13 = v11 > 0.0 || v12 == 0.0;
    if (!v13)
    {
      v14 = +[SearchSuggestion relativeDateTimeFormatter];
      objc_super v15 = [v14 localizedStringFromTimeInterval:v11];
      [v16 setHistoryLastAccessedLabel:v15];
    }
    [v16 setHidesHistoryLastAccessedLabel:v13];
  }
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  string = self->_string;
  if (self->_goesToURL) {
    [a3 goToURLString:string];
  }
  else {
    [a3 search:string];
  }
}

- (id)completionTableViewCellReuseIdentifier
{
  v3 = @"Suggestion";
  if ([(SearchSuggestion *)self hasBeenSearchedBefore]
    && [(SearchSuggestion *)self _isLabelPreviousSearchesInCompletionListEnabled])
  {
    v3 = @"Historic Suggestion";
  }
  return v3;
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  if ([(SearchSuggestion *)self hasBeenSearchedBefore])
  {
    if ([(SearchSuggestion *)self _isLabelPreviousSearchesInCompletionListEnabled])
    {
      uint64_t v4 = 3;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [SearchSuggestionTableViewCell alloc];
  id v6 = [(SearchSuggestion *)self completionTableViewCellReuseIdentifier];
  id v7 = [(SearchSuggestionTableViewCell *)v5 initWithStyle:v4 reuseIdentifier:v6];

  return v7;
}

- (double)completionTableViewCellCustomHeightForCompletionList:(id)a3
{
  return +[UITableViewCell safari_defaultHeightOfTrivialInstance]();
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  if (self->_recentSearch)
  {
    uint64_t v4 = 1;
  }
  else if (self->_searchEngineSuggestion)
  {
    if (self->_goesToURL) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v5 didAcceptSearchSuggestionOfType:v4];

  id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v6 didAcceptCompletionItemOfType:6 atRank:a3];
}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (BOOL)restoresSearchState
{
  return 1;
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return self->_string;
}

- (BOOL)needsSectionHeader
{
  return 1;
}

- (SFSearchResult)sfSearchResultValue
{
  sfSearchResultValue = self->_sfSearchResultValue;
  if (sfSearchResultValue)
  {
    v3 = sfSearchResultValue;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F9A3C0], "safari_sfSearchResultWithUniqueIdentifier");
    uint64_t v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    id v7 = [(WBSCompletionQuery *)self->_userQuery queryString];
    [(SFSearchResult *)self->_sfSearchResultValue setUserInput:v7];

    [(SFSearchResult *)self->_sfSearchResultValue setQueryId:[(WBSCompletionQuery *)self->_userQuery queryID]];
    double v8 = [MEMORY[0x1E4F9A4C0] textWithString:self->_string];
    [(SFSearchResult *)self->_sfSearchResultValue setTitle:v8];

    [(SFSearchResult *)self->_sfSearchResultValue setType:2];
    if (self->_searchEngineSuggestion) {
      double v9 = @"SearchEngineSuggestion";
    }
    else {
      double v9 = @"UserTypedString";
    }
    if (self->_recentSearch) {
      double v10 = @"RecentSearch";
    }
    else {
      double v10 = v9;
    }
    double v11 = [@"com.apple.Safari.CompletionList." stringByAppendingString:v10];
    double v12 = v11;
    if (self->_offlineSearchEngineSuggestion)
    {

      double v12 = @"SafariCompletionListOfflineSearchEngineSuggestion";
    }
    if (self->_searchEngineSuggestion || self->_recentSearch)
    {
      BOOL v13 = [MEMORY[0x1E4F3B060] sharedInstance];
      v14 = [v13 defaultSearchEngineForPrivateBrowsing:self->_forPrivateBrowsing];
      -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", [v14 parsecSearchResultType]);
    }
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v12];
    objc_super v15 = [@"com.apple.Safari.CompletionList." stringByAppendingString:@"SearchSuggestionProvider"];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v15];

    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  if (self->_handlingAccessoryButtonTap) {
    return 10;
  }
  else {
    return 2;
  }
}

- (NSString)titleForHistoryServiceCompletionList
{
  return self->_string;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SearchSuggestion *)self string];
    id v6 = [v4 string];
    char v7 = WBSIsEqual();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCompletionQuery)query
{
  return self->_userQuery;
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)goesToURL
{
  return self->_goesToURL;
}

- (BOOL)hasBeenSearchedBefore
{
  return self->_hasBeenSearchedBefore;
}

- (void)setHasBeenSearchedBefore:(BOOL)a3
{
  self->_hasBeenSearchedBefore = a3;
}

- (double)lastVisitTimeInterval
{
  return self->_lastVisitTimeInterval;
}

- (void)setLastVisitTimeInterval:(double)a3
{
  self->_lastVisitTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

- (void)configureCompletionTableViewCell:(os_log_t)log forCompletionList:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Could not configure Search Suggestion cell because search string is nil", v1, 2u);
}

@end