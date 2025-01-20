@interface QuickWebsiteSearchCompletionItem
- (BOOL)isEquivalentTo:(id)a3;
- (NSString)parsecDomainIdentifier;
- (NSString)titleForHistoryServiceCompletionList;
- (QuickWebsiteSearchCompletionItem)initWithProvider:(id)a3 query:(id)a4 forQueryID:(int64_t)a5;
- (QuickWebsiteSearchQuery)searchQuery;
- (SFSearchResult)sfSearchResultValue;
- (WBSCompletionQuery)query;
- (WBSQuickWebsiteSearchProvider)searchProvider;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4;
- (void)setParsecQueryID:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation QuickWebsiteSearchCompletionItem

- (QuickWebsiteSearchCompletionItem)initWithProvider:(id)a3 query:(id)a4 forQueryID:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)QuickWebsiteSearchCompletionItem;
  v11 = [(QuickWebsiteSearchCompletionItem *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchProvider, a3);
    objc_storeStrong((id *)&v12->_searchQuery, a4);
    v12->_parsecQueryID = a5;
    v13 = v12;
  }

  return v12;
}

- (id)completionTableViewCellReuseIdentifier
{
  return @"WebsiteSpecificSearchCell";
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  v4 = [SearchSuggestionTableViewCell alloc];
  v5 = [(QuickWebsiteSearchCompletionItem *)self completionTableViewCellReuseIdentifier];
  v6 = [(SearchSuggestionTableViewCell *)v4 initWithStyle:0 reuseIdentifier:v5];

  return v6;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  id v12 = a3;
  v5 = [v12 textLabel];
  [v5 setLineBreakMode:4];

  v6 = [v12 textLabel];
  v7 = NSString;
  v8 = _WBSLocalizedString();
  id v9 = [(WBSQuickWebsiteSearchProvider *)self->_searchProvider displayName];
  id v10 = [(QuickWebsiteSearchQuery *)self->_searchQuery searchTerms];
  v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
  [v6 setText:v11];

  -[UITableViewCell safari_setCompletionIcon:](v12, 4);
  [v12 setAccessibilityIdentifier:@"QuickWebsiteSearch"];
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F98D50];
  id v5 = a3;
  v6 = [v4 sharedController];
  [v6 didPerformSearchWithProvider:self->_searchProvider];

  id v9 = [(WBSQuickWebsiteSearchProvider *)self->_searchProvider searchURLTemplate];
  v7 = [(QuickWebsiteSearchQuery *)self->_searchQuery searchTerms];
  v8 = [v9 URLWithSearchTerms:v7];
  [v5 goToURL:v8];
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:7 atRank:a3];
}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F99310];
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
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
    id v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    v7 = (void *)MEMORY[0x1E4F9A4C0];
    v8 = [(QuickWebsiteSearchQuery *)self->_searchQuery searchTerms];
    id v9 = [v7 textWithString:v8];
    [(SFSearchResult *)self->_sfSearchResultValue setTitle:v9];

    id v10 = [@"com.apple.Safari.CompletionList." stringByAppendingString:@"QuickWebsiteSearch"];
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v10];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v10];
    [(SFSearchResult *)self->_sfSearchResultValue setType:1];
    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return [(QuickWebsiteSearchQuery *)self->_searchQuery searchTerms];
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(QuickWebsiteSearchCompletionItem *)self searchProvider];
    v7 = [v6 displayName];
    v8 = [v5 searchProvider];
    id v9 = [v8 displayName];
    int v10 = WBSIsEqual();

    if (v10)
    {
      v11 = [(QuickWebsiteSearchCompletionItem *)self searchQuery];
      id v12 = [v11 searchTerms];
      v13 = [v5 searchQuery];
      v14 = [v13 searchTerms];
      char v15 = WBSIsEqual();
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (WBSCompletionQuery)query
{
  return [(QuickWebsiteSearchQuery *)self->_searchQuery completionQuery];
}

- (void)setQuery:(id)a3
{
  id v8 = a3;
  id v4 = [(QuickWebsiteSearchQuery *)self->_searchQuery completionQuery];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    v6 = [[QuickWebsiteSearchQuery alloc] initWithUserEnteredQuery:v8];
    searchQuery = self->_searchQuery;
    self->_searchQuery = v6;
  }
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSQuickWebsiteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (QuickWebsiteSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end