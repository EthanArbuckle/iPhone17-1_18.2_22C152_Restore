@interface CHManager(IntentHandler)
+ (id)siriManagerForIntentType:()IntentHandler;
@end

@implementation CHManager(IntentHandler)

+ (id)siriManagerForIntentType:()IntentHandler
{
  id v0 = objc_alloc_init(MEMORY[0x263F30588]);
  return v0;
}

@end