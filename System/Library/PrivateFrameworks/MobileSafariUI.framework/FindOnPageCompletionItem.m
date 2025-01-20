@interface FindOnPageCompletionItem
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)needsSectionHeader;
- (FindOnPageCompletionItem)initWithString:(id)a3 numberOfMatches:(unint64_t)a4 forQueryID:(int64_t)a5;
- (NSString)parsecDomainIdentifier;
- (WBSCompletionQuery)query;
- (id)completionTableViewCellForCompletionList:(id)a3;
- (id)completionTableViewCellReuseIdentifier;
- (id)reflectedStringForUserTypedString:(id)a3;
- (id)string;
- (int64_t)parsecQueryID;
- (unint64_t)engagementDestination;
- (unint64_t)numberOfMatches;
- (void)acceptCompletionWithActionHandler:(id)a3;
- (void)auditAcceptedCompletionWithRank:(unint64_t)a3;
- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4;
- (void)setParsecQueryID:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation FindOnPageCompletionItem

- (FindOnPageCompletionItem)initWithString:(id)a3 numberOfMatches:(unint64_t)a4 forQueryID:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FindOnPageCompletionItem;
  v9 = [(FindOnPageCompletionItem *)&v16 init];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F9A4C0] textWithString:v8];
    [(FindOnPageCompletionItem *)v9 setTitle:v10];

    v11 = [MEMORY[0x1E4F29128] UUID];
    v12 = [v11 UUIDString];
    [(FindOnPageCompletionItem *)v9 setIdentifier:v12];

    [(FindOnPageCompletionItem *)v9 setType:2];
    v13 = [@"com.apple.Safari.CompletionList." stringByAppendingString:@"FindOnPage"];
    [(FindOnPageCompletionItem *)v9 setResultBundleId:v13];
    [(FindOnPageCompletionItem *)v9 setSectionBundleIdentifier:v13];
    v9->_parsecQueryID = a5;
    v9->_numberOfMatches = a4;
    v14 = v9;
  }
  return v9;
}

- (id)completionTableViewCellReuseIdentifier
{
  return @"FindOnPage";
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  v4 = [FindOnPageCompletionTableViewCell alloc];
  uint64_t IsPad = _SFDeviceIsPad();
  v6 = [(FindOnPageCompletionItem *)self completionTableViewCellReuseIdentifier];
  v7 = [(FindOnPageCompletionTableViewCell *)v4 initWithStyle:IsPad reuseIdentifier:v6];

  return v7;
}

- (id)string
{
  v2 = [(FindOnPageCompletionItem *)self title];
  v3 = [v2 text];

  return v3;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  id v19 = a3;
  v5 = NSString;
  v6 = _WBSLocalizedString();
  v7 = [(FindOnPageCompletionItem *)self string];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v9 = [v19 textLabel];
  [v9 setText:v8];

  if (_SFDeviceIsPad())
  {
    unint64_t numberOfMatches = self->_numberOfMatches;
    if (numberOfMatches == *MEMORY[0x1E4F78A00])
    {
      v11 = &stru_1F3C268E8;
    }
    else if (numberOfMatches == 1)
    {
      v12 = NSString;
      v13 = _WBSLocalizedString();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, 1);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (numberOfMatches)
    {
      uint64_t v14 = *MEMORY[0x1E4F3B0D8];
      v15 = NSString;
      if (numberOfMatches >= *MEMORY[0x1E4F3B0D8])
      {
        objc_super v16 = _WBSLocalizedString();
        objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);
      }
      else
      {
        objc_super v16 = _WBSLocalizedString();
        objc_msgSend(v15, "localizedStringWithFormat:", v16, self->_numberOfMatches);
      }
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _WBSLocalizedString();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v17 = [v19 detailTextLabel];
    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [v17 setFont:v18];

    [v17 setText:v11];
  }
  -[UITableViewCell safari_setCompletionIcon:](v19, 8);
  [v19 setAccessibilityIdentifier:@"FindOnPage"];
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  id v9 = a3;
  v4 = [(FindOnPageCompletionItem *)self string];
  v5 = [v9 browserController];
  v6 = [v5 tabController];
  v7 = [v6 activeTabDocument];
  id v8 = [v7 findInteraction];
  [v8 setSearchText:v4];

  [v9 findOnPage];
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:2 atRank:a3];

  id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v5 didFindOnPageWithTrigger:2];
}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F99308];
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
}

- (BOOL)needsSectionHeader
{
  return 1;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(FindOnPageCompletionItem *)self string],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 string],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = WBSIsEqual(),
        v6,
        v5,
        v7))
  {
    unint64_t numberOfMatches = self->_numberOfMatches;
    BOOL v9 = numberOfMatches == [v4 numberOfMatches];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setQuery:(id)a3
{
  id v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    id v5 = (void *)MEMORY[0x1E4F9A4C0];
    v6 = [v8 queryString];
    int v7 = [v5 textWithString:v6];
    [(FindOnPageCompletionItem *)self setTitle:v7];
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

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void).cxx_destruct
{
}

@end