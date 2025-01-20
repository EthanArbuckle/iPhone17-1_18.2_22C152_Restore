@interface SFPlayMediaCommand(SPUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFPlayMediaCommand(SPUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end