@interface SearchQueryRestorationCompletionItem
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)needsSectionHeader;
- (CompletionGroupListing)listingToRestore;
- (NSString)parsecDomainIdentifier;
- (NSString)titleForHistoryServiceCompletionList;
- (SFSearchResult)sfSearchResultValue;
- (SearchQueryRestorationCompletionItem)initWithQuery:(id)a3;
- (WBSCompletionQuery)queryToRestore;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4;
- (void)setListingToRestore:(id)a3;
- (void)setParsecQueryID:(int64_t)a3;
- (void)setQueryToRestore:(id)a3;
@end

@implementation SearchQueryRestorationCompletionItem

- (SearchQueryRestorationCompletionItem)initWithQuery:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchQueryRestorationCompletionItem;
  v6 = [(SearchQueryRestorationCompletionItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryToRestore, a3);
    v7->_parsecQueryID = [(WBSCompletionQuery *)v7->_queryToRestore queryID];
    v8 = v7;
  }

  return v7;
}

- (id)completionTableViewCellReuseIdentifier
{
  return @"SearchRestoration";
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB1D08]);
  id v5 = [(SearchQueryRestorationCompletionItem *)self completionTableViewCellReuseIdentifier];
  v6 = (void *)[v4 initWithStyle:0 reuseIdentifier:v5];

  return v6;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  id v5 = NSString;
  id v10 = a3;
  v6 = _WBSLocalizedString();
  v7 = [(WBSCompletionQuery *)self->_queryToRestore queryString];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v9 = [v10 textLabel];
  [v9 setText:v8];

  -[UITableViewCell safari_setCompletionIcon:](v10, 4);
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:3 atRank:a3];
}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)@"restoredSearchCompletion";
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return (id)[(WBSCompletionQuery *)self->_queryToRestore queryString];
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
    id v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    v7 = [(SearchQueryRestorationCompletionItem *)self parsecDomainIdentifier];
    v8 = [@"com.apple.Safari.CompletionList." stringByAppendingString:v7];

    v9 = [(WBSCompletionQuery *)self->_queryToRestore queryString];
    [(SFSearchResult *)self->_sfSearchResultValue setUserInput:v9];

    [(SFSearchResult *)self->_sfSearchResultValue setQueryId:[(WBSCompletionQuery *)self->_queryToRestore queryID]];
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v8];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v8];
    id v10 = (void *)MEMORY[0x1E4F9A4C0];
    v11 = [(WBSCompletionQuery *)self->_queryToRestore queryString];
    v12 = [v10 textWithString:v11];
    [(SFSearchResult *)self->_sfSearchResultValue setTitle:v12];

    [(SFSearchResult *)self->_sfSearchResultValue setType:2];
    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 3;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return (NSString *)[(WBSCompletionQuery *)self->_queryToRestore queryString];
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SearchQueryRestorationCompletionItem *)self queryToRestore];
    v6 = [v5 queryString];
    v7 = [v4 queryToRestore];
    v8 = [v7 queryString];
    char v9 = WBSIsEqual();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCompletionQuery)queryToRestore
{
  return self->_queryToRestore;
}

- (void)setQueryToRestore:(id)a3
{
}

- (CompletionGroupListing)listingToRestore
{
  return self->_listingToRestore;
}

- (void)setListingToRestore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listingToRestore, 0);
  objc_storeStrong((id *)&self->_queryToRestore, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end