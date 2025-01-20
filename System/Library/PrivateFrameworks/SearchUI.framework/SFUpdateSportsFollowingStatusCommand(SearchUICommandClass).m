@interface SFUpdateSportsFollowingStatusCommand(SearchUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFUpdateSportsFollowingStatusCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end