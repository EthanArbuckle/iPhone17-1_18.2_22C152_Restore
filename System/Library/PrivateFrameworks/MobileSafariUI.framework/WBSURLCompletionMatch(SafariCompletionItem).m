@interface WBSURLCompletionMatch(SafariCompletionItem)
+ (id)_relativeDateTimeFormatter;
- (PageTitleAndAddressTableViewCell)completionTableViewCellForCompletionList:()SafariCompletionItem;
- (__CFString)_promptString;
- (__CFString)completionTableViewCellReuseIdentifier;
- (id)_addressString;
- (id)reflectedStringForUserTypedString:()SafariCompletionItem;
- (id)subtextForHistoryServiceCompletionList;
- (uint64_t)_completionIcon;
- (uint64_t)completionTableViewCellCustomHeightForCompletionList:()SafariCompletionItem;
- (uint64_t)isEquivalentTo:()SafariCompletionItem;
- (void)_promptString;
- (void)acceptCompletionWithActionHandler:()SafariCompletionItem;
- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem;
- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:;
@end

@implementation WBSURLCompletionMatch(SafariCompletionItem)

+ (id)_relativeDateTimeFormatter
{
  if (+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::onceToken != -1) {
    dispatch_once(&+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::onceToken, &__block_literal_global_55);
  }
  v0 = (void *)+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::formatter;
  return v0;
}

- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 rewrittenQuery];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 query];
  }
  v11 = v10;

  v12 = [a1 title];
  v13 = [a1 _addressString];
  v14 = [a1 _promptString];
  [v6 setTitle:v12 address:v13 prompt:v14 withQuery:v11];

  v15 = [v7 faviconCache];
  v16 = [a1 originalURLString];
  v17 = [v15 objectForKey:v16];

  int v18 = [a1 isTopHit];
  if (v17) {
    int v19 = v18;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
    v20 = [v6 imageView];
    [v20 setImage:v17];
  }
  else
  {
    -[UITableViewCell safari_setCompletionIcon:](v6, [a1 _completionIcon]);
  }
  if (([a1 onlyContainsCloudTab] & 1) == 0) {
    [a1 containsBookmark];
  }
  v25 = @"isTopHit";
  int v21 = [a1 isTopHit];
  v22 = @"false";
  if (v21) {
    v22 = @"true";
  }
  v26[0] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v24 = WBSMakeAccessibilityIdentifier();
  [v6 setAccessibilityIdentifier:v24];
}

- (id)_addressString
{
  int v2 = [a1 isTopHit];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [a1 userVisibleURLString];
  v5 = objc_msgSend(v3, "safari_URLWithUserTypedString:", v4);
  if (v2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 48;
  }

  id v7 = objc_msgSend(v5, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", v6);

  return v7;
}

- (__CFString)_promptString
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a1 isTopHit] & 1) != 0 || (objc_msgSend(a1, "containsBookmark")) {
    goto LABEL_3;
  }
  if ([a1 onlyContainsCloudTab])
  {
    v4 = [a1 cloudTabDeviceName];

    if (v4)
    {
      v5 = NSString;
      uint64_t v6 = _WBSLocalizedString();
      id v7 = [a1 cloudTabDeviceName];
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    int v18 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = [a1 userVisibleURLString];
      [(WBSURLCompletionMatch(SafariCompletionItem) *)v20 _promptString];
    }
LABEL_15:

LABEL_3:
    int v2 = &stru_1F3C268E8;
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  [a1 lastVisitTimeInterval];
  double v11 = v10;
  [a1 lastVisitTimeInterval];
  if (v12 == 0.0 || (double v13 = v9 - v11, v13 < 0.0))
  {
    int v18 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = [a1 userVisibleURLString];
      [(WBSURLCompletionMatch(SafariCompletionItem) *)v19 _promptString];
    }
    goto LABEL_15;
  }
  v14 = [MEMORY[0x1E4F98F68] _relativeDateTimeFormatter];
  v15 = [v14 localizedStringFromTimeInterval:-v13];

  v16 = NSString;
  v17 = _WBSLocalizedString();
  objc_msgSend(v16, "stringWithFormat:", v17, v15);
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  return v2;
}

- (uint64_t)_completionIcon
{
  if ([a1 isTopHit]) {
    return 7;
  }
  if ([a1 containsReadingListItem]) {
    return 2;
  }
  if ([a1 containsBookmark]) {
    return 0;
  }
  if ([a1 onlyContainsCloudTab]) {
    return 1;
  }
  return 3;
}

- (void)acceptCompletionWithActionHandler:()SafariCompletionItem
{
  id v5 = a3;
  v4 = [a1 userVisibleURLString];
  [v5 goToURLString:v4];
}

- (__CFString)completionTableViewCellReuseIdentifier
{
  return @"URL";
}

- (PageTitleAndAddressTableViewCell)completionTableViewCellForCompletionList:()SafariCompletionItem
{
  int v2 = [PageTitleAndAddressTableViewCell alloc];
  v3 = [a1 completionTableViewCellReuseIdentifier];
  v4 = [(PageTitleAndAddressTableViewCell *)v2 initWithStyle:3 reuseIdentifier:v3];

  return v4;
}

- (uint64_t)completionTableViewCellCustomHeightForCompletionList:()SafariCompletionItem
{
  return +[PageTitleAndAddressTableViewCell defaultHeight];
}

- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem
{
  if ([a1 isTopHit]) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v5 didAcceptCompletionItemOfType:v4 atRank:a3];
}

- (id)reflectedStringForUserTypedString:()SafariCompletionItem
{
  v1 = objc_msgSend(a1, "matchingStringWithUserTypedPrefix:");
  return v1;
}

- (id)subtextForHistoryServiceCompletionList
{
  v1 = [a1 _promptString];
  int v2 = [@" · " stringByAppendingString:v1];

  return v2;
}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [a1 title];
    id v7 = [v5 title];
    char v8 = WBSIsEqual();

    if (v8)
    {
      double v9 = [a1 userVisibleURLString];
      double v10 = [v5 userVisibleURLString];
      uint64_t v11 = WBSIsEqual();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_promptString
{
  *(_DWORD *)buf = 138739971;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Invalid last visit time for history item: %{sensitive}@", buf, 0xCu);
}

@end