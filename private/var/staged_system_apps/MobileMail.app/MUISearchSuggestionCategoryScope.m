@interface MUISearchSuggestionCategoryScope
+ (id)genericSpotlightScope;
@end

@implementation MUISearchSuggestionCategoryScope

+ (id)genericSpotlightScope
{
  id v2 = objc_alloc_init((Class)MUISearchSuggestionCategoryScope);
  [v2 setPredicateApplier:&stru_10060D348];
  [v2 setParsecScope:MSSearchScopeMessage];

  return v2;
}

@end