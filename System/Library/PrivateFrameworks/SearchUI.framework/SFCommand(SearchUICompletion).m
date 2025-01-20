@interface SFCommand(SearchUICompletion)
- (uint64_t)_searchui_completionImage;
- (uint64_t)_searchui_overriddenBridgeStringWithCompletion:()SearchUICompletion;
- (uint64_t)_searchui_overriddenExtensionString;
- (uint64_t)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFCommand(SearchUICompletion)

- (uint64_t)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return 0;
}

- (uint64_t)_searchui_completionImage
{
  return 0;
}

- (uint64_t)_searchui_overriddenExtensionString
{
  return 0;
}

- (uint64_t)_searchui_overriddenBridgeStringWithCompletion:()SearchUICompletion
{
  return 0;
}

@end