@interface SFCoreSpotlightShareItem(SearchUIShareCommand)
- (void)searchUI_fetchShareableItemWithCompletionHandler:()SearchUIShareCommand;
@end

@implementation SFCoreSpotlightShareItem(SearchUIShareCommand)

- (void)searchUI_fetchShareableItemWithCompletionHandler:()SearchUIShareCommand
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  v6 = [a1 applicationBundleIdentifier];
  v7 = [a1 coreSpotlightIdentifier];
  v8 = [a1 shareProviderTypeIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__SFCoreSpotlightShareItem_SearchUIShareCommand__searchUI_fetchShareableItemWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6E72898;
  id v11 = v4;
  id v9 = v4;
  [v5 provideFileURLForBundle:v6 identifier:v7 type:v8 completionHandler:v10];
}

@end