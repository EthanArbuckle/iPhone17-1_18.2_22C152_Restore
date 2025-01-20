@interface NSOrderedSet(SBFloatingDockSuggestions)
- (BOOL)sb_containsFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions;
- (uint64_t)sb_indexOfFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions;
@end

@implementation NSOrderedSet(SBFloatingDockSuggestions)

- (BOOL)sb_containsFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions
{
  return objc_msgSend(a1, "sb_indexOfFloatingDockSuggestionDisplayItem:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)sb_indexOfFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__NSOrderedSet_SBFloatingDockSuggestions__sb_indexOfFloatingDockSuggestionDisplayItem___block_invoke;
  v8[3] = &unk_1E6AF83F0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v8];

  return v6;
}

@end