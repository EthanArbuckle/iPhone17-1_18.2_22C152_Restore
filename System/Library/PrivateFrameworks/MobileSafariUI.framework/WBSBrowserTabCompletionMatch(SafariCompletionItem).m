@interface WBSBrowserTabCompletionMatch(SafariCompletionItem)
- (PageTitleAndAddressTableViewCell)completionTableViewCellForCompletionList:()SafariCompletionItem;
- (__CFString)completionTableViewCellReuseIdentifier;
- (uint64_t)isEquivalentTo:()SafariCompletionItem;
- (void)acceptCompletionWithActionHandler:()SafariCompletionItem;
- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem;
- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:;
@end

@implementation WBSBrowserTabCompletionMatch(SafariCompletionItem)

- (void)acceptCompletionWithActionHandler:()SafariCompletionItem
{
  id v4 = a3;
  id v7 = [a1 tabUUID];
  v5 = [a1 windowUUID];
  v6 = [a1 tabGroupUUID];
  [v4 switchToTabWithUUID:v7 inWindowWithUUID:v5 forTabGroupWithUUID:v6];
}

- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem
{
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didAcceptCompletionItemOfType:8 atRank:a3];
}

- (PageTitleAndAddressTableViewCell)completionTableViewCellForCompletionList:()SafariCompletionItem
{
  v2 = [PageTitleAndAddressTableViewCell alloc];
  v3 = [a1 completionTableViewCellReuseIdentifier];
  id v4 = [(PageTitleAndAddressTableViewCell *)v2 initWithStyle:3 reuseIdentifier:v3];

  return v4;
}

- (__CFString)completionTableViewCellReuseIdentifier
{
  return @"SwitchToTabCell";
}

- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [a1 url];
  v8 = objc_msgSend(v7, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", 48);

  v9 = [a1 alternativeDisplayTextForURL];
  if ([v9 length])
  {
    id v10 = [a1 alternativeDisplayTextForURL];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;

  v12 = [a1 tabGroupTitle];
  if (v12)
  {
    v13 = NSString;
    v14 = _WBSLocalizedString();
    v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12);
  }
  else
  {
    v15 = _WBSLocalizedString();
  }
  v16 = [a1 title];
  v17 = [v6 query];

  [v26 setTitle:v16 address:v11 prompt:v15 withQuery:v17];
  v18 = +[Application sharedApplication];
  v19 = [v18 browserWindowController];
  v20 = [a1 tabUUID];
  v21 = [v19 tabWithUUID:v20];

  v22 = [v21 tabOverviewItem];
  v23 = [v22 icon];

  if (v23 && ([v23 isSymbolImage] & 1) == 0)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F98BC8], "resizedImage:withSize:", v23, 24.0, 24.0);

    objc_msgSend(v24, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
    v25 = [v26 imageView];
    [v25 setImage:v24];

    v23 = v24;
  }
  else
  {
    -[UITableViewCell safari_setCompletionIcon:](v26, 6);
  }
  [v26 setAccessibilityIdentifier:@"SwitchToTab"];
}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [a1 title];
    id v7 = [v5 title];
    int v8 = WBSIsEqual();

    if (v8)
    {
      v9 = [a1 url];
      id v10 = [v9 absoluteString];
      v11 = [v5 url];
      v12 = [v11 absoluteString];
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

@end