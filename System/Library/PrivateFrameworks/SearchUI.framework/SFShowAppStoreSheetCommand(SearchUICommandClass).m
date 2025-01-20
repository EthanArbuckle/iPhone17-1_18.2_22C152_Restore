@interface SFShowAppStoreSheetCommand(SearchUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFShowAppStoreSheetCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end