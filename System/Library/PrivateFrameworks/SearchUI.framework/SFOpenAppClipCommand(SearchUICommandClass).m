@interface SFOpenAppClipCommand(SearchUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFOpenAppClipCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end