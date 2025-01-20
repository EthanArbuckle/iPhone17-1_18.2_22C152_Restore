@interface WebBookmark(Suggestions)
- (id)historyItem;
- (uint64_t)suggestionIdentifier;
- (void)setHistoryItem:()Suggestions;
@end

@implementation WebBookmark(Suggestions)

- (uint64_t)suggestionIdentifier
{
  return 0;
}

- (id)historyItem
{
  return objc_getAssociatedObject(a1, &webBookmarkHistoryItemKey);
}

- (void)setHistoryItem:()Suggestions
{
}

@end