@interface SFShowSFCardCommand(SearchUICompletion)
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFShowSFCardCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedShowMoreString];
}

@end