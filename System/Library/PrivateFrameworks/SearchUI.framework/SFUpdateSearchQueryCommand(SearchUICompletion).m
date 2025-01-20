@interface SFUpdateSearchQueryCommand(SearchUICompletion)
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFUpdateSearchQueryCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedSearchString];
}

@end