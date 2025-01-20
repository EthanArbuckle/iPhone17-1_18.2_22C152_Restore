@interface UIDictationCommandHandlerManager
+ (id)commandHandlerWithLocale:(id)a3;
+ (id)sharedInstance;
- (NSMutableDictionary)commandHandlers;
- (UIDictationCommandHandlerManager)init;
- (id)_commandHandlerWithLocale:(id)a3;
- (void)setCommandHandlers:(id)a3;
@end

@implementation UIDictationCommandHandlerManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_929 != -1) {
    dispatch_once(&_MergedGlobals_929, block);
  }
  v2 = (void *)qword_1EB25EE20;
  return v2;
}

uint64_t __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UIDictationCommandHandlerManager);
  v3 = (void *)qword_1EB25EE20;
  qword_1EB25EE20 = (uint64_t)v2;

  id SRCSCommandStringsTableClass = getSRCSCommandStringsTableClass();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke_2;
  v6[3] = &__block_descriptor_40_e45___NSDictionary_24__0__NSString_8__NSString_16l;
  v6[4] = *(void *)(a1 + 32);
  return [SRCSCommandStringsTableClass setCommandStringsLoader:v6];
}

id __50__UIDictationCommandHandlerManager_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [@"DictationCommands_" stringByAppendingString:v2];
  v5 = [v3 pathForResource:v4 ofType:@"plist" inDirectory:0];

  if (v5) {
    goto LABEL_3;
  }
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = TIInputModeGetBaseLanguage();
  v8 = [@"DictationCommands_" stringByAppendingString:v7];
  v5 = [v6 pathForResource:v8 ofType:@"plist" inDirectory:0];

  if (v5)
  {
LABEL_3:
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIDictationCommandHandlerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIDictationCommandHandlerManager;
  id v2 = [(UIDictationCommandHandlerManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    commandHandlers = v2->_commandHandlers;
    v2->_commandHandlers = v3;
  }
  return v2;
}

+ (id)commandHandlerWithLocale:(id)a3
{
  id v3 = a3;
  v4 = +[UIDictationCommandHandlerManager sharedInstance];
  v5 = [v4 _commandHandlerWithLocale:v3];

  return v5;
}

- (id)_commandHandlerWithLocale:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_commandHandlers objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = objc_alloc_init(UIDictationCommandHandler);
    objc_super v6 = (void *)[objc_alloc((Class)getSRCSCommandStringsTableClass()) initWithLocaleIdentifier:v4];
    v7 = [v6 supportedCommandIdentifiersForTargetTypes:0];
    if ([v7 count])
    {
      [(UIDictationCommandHandler *)v5 registerCommandIdentifiers:v7 locale:v4];
      [(NSMutableDictionary *)self->_commandHandlers setObject:v5 forKeyedSubscript:v4];
    }
    else
    {

      v5 = 0;
    }
  }
  return v5;
}

- (NSMutableDictionary)commandHandlers
{
  return self->_commandHandlers;
}

- (void)setCommandHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end