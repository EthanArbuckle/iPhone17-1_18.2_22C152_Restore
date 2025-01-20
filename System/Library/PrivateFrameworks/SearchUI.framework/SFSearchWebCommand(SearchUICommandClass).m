@interface SFSearchWebCommand(SearchUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFSearchWebCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end