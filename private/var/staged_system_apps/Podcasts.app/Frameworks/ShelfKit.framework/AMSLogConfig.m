@interface AMSLogConfig
+ (id)ask_generalLogConfig;
@end

@implementation AMSLogConfig

+ (id)ask_generalLogConfig
{
  if (ask_generalLogConfig_onceToken != -1) {
    dispatch_once(&ask_generalLogConfig_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)ask_generalLogConfig_logConfig;

  return v2;
}

void __46__AMSLogConfig_ShelfKit__ask_generalLogConfig__block_invoke(id a1)
{
  id v3 = objc_alloc_init((Class)AMSMutableLogConfig);
  [v3 setSubsystem:@"com.apple.ShelfKit"];
  [v3 setCategory:@"ASK General"];
  id v1 = [v3 copy];
  v2 = (void *)ask_generalLogConfig_logConfig;
  ask_generalLogConfig_logConfig = (uint64_t)v1;
}

@end