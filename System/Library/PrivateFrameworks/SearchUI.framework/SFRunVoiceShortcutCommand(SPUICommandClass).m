@interface SFRunVoiceShortcutCommand(SPUICommandClass)
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFRunVoiceShortcutCommand(SPUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

@end