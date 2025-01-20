@interface SFToggleWatchListStatusCommand(SearchUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFToggleWatchListStatusCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end