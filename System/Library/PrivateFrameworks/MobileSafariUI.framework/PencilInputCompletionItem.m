@interface PencilInputCompletionItem
- (BOOL)isEquivalentTo:(id)a3;
- (NSString)parsecDomainIdentifier;
- (NSString)text;
- (NSString)titleForHistoryServiceCompletionList;
- (PencilInputCompletionItem)initWithUserQuery:(id)a3 navigationURL:(id)a4 searchQuery:(id)a5;
- (SFSearchResult)sfSearchResultValue;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4;
- (void)setParsecQueryID:(int64_t)a3;
@end

@implementation PencilInputCompletionItem

- (PencilInputCompletionItem)initWithUserQuery:(id)a3 navigationURL:(id)a4 searchQuery:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PencilInputCompletionItem;
  v12 = [(PencilInputCompletionItem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userQuery, a3);
    objc_storeStrong((id *)&v13->_navigationURL, a4);
    objc_storeStrong((id *)&v13->_searchQuery, a5);
    v13->_parsecQueryID = [(WBSCompletionQuery *)v13->_userQuery queryID];
    v14 = v13;
  }

  return v13;
}

- (NSString)parsecDomainIdentifier
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
    v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    [(SFSearchResult *)self->_sfSearchResultValue setUserInput:self->_searchQuery];
    [(SFSearchResult *)self->_sfSearchResultValue setQueryId:[(WBSCompletionQuery *)self->_userQuery queryID]];
    v7 = [@"com.apple.Safari.CompletionList." stringByAppendingString:@"PencilInput"];
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v7];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v7];
    [(SFSearchResult *)self->_sfSearchResultValue setType:2];
    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (id)completionTableViewCellReuseIdentifier
{
  return @"PencilInputCellIdentifier";
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB1D08]);
  v5 = [(PencilInputCompletionItem *)self completionTableViewCellReuseIdentifier];
  v6 = (void *)[v4 initWithStyle:3 reuseIdentifier:v5];

  return v6;
}

- (NSString)text
{
  navigationURL = self->_navigationURL;
  if (navigationURL)
  {
    id v4 = [(NSURL *)navigationURL safari_userVisibleString];
    v5 = objc_msgSend(v4, "safari_simplifiedUserVisibleURLString");

    v6 = NSString;
    v7 = _WBSLocalizedString();
    v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);
  }
  else
  {
    id v9 = NSString;
    v5 = _WBSLocalizedString();
    v8 = objc_msgSend(v9, "stringWithFormat:", v5, self->_searchQuery);
  }

  return (NSString *)v8;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  id v7 = a3;
  v5 = [(PencilInputCompletionItem *)self text];
  v6 = [v7 textLabel];
  [v6 setText:v5];

  -[UITableViewCell safari_setCompletionIcon:](v7, 7);
  [v7 setAccessibilityIdentifier:@"PencilInput"];
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  if (self->_navigationURL) {
    objc_msgSend(a3, "goToURL:");
  }
  else {
    [a3 search:self->_searchQuery];
  }
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:4 atRank:a3];
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PencilInputCompletionItem *)self text];
    v6 = [v4 text];
    char v7 = WBSIsEqual();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return self->_searchQuery;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_navigationURL, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
}

@end