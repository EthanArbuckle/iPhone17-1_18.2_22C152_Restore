@interface SFPerformEntityQueryCommand(SearchUICompletion)
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFPerformEntityQueryCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedShowMoreString];
}

@end