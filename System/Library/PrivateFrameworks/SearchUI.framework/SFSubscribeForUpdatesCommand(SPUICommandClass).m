@interface SFSubscribeForUpdatesCommand(SPUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFSubscribeForUpdatesCommand(SPUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end