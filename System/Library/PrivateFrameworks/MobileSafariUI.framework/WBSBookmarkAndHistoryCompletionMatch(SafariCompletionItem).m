@interface WBSBookmarkAndHistoryCompletionMatch(SafariCompletionItem)
- (uint64_t)isEquivalentTo:()SafariCompletionItem;
- (uint64_t)shouldPrefetchWithMatchLength:()SafariCompletionItem;
@end

@implementation WBSBookmarkAndHistoryCompletionMatch(SafariCompletionItem)

- (uint64_t)shouldPrefetchWithMatchLength:()SafariCompletionItem
{
  uint64_t v2 = [a1 shouldPreload];
  if (v2) {
    [a1 weight];
  }
  return v2;
}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [a1 title];
    v7 = [v5 title];
    char v8 = WBSIsEqual();

    if (v8)
    {
      v9 = [a1 userVisibleURLString];
      v10 = [v5 userVisibleURLString];
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

@end