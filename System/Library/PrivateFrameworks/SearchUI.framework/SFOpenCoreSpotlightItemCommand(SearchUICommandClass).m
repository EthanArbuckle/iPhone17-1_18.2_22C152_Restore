@interface SFOpenCoreSpotlightItemCommand(SearchUICommandClass)
- (id)_searchUICommandHandlerClass;
@end

@implementation SFOpenCoreSpotlightItemCommand(SearchUICommandClass)

- (id)_searchUICommandHandlerClass
{
  v1 = [a1 applicationBundleIdentifier];
  if (+[SearchUIUtilities isAppInstalledWithBundleId:v1])
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end