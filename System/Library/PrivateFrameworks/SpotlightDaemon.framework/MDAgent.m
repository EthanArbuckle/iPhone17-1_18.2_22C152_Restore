@interface MDAgent
+ (id)sharedAgent;
- (MDAgent)init;
- (void)handleLogOut;
@end

@implementation MDAgent

+ (id)sharedAgent
{
  if (sharedAgent_onceToken != -1) {
    dispatch_once(&sharedAgent_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedAgent_sMDAgent;
  return v2;
}

uint64_t __22__MDAgent_sharedAgent__block_invoke()
{
  sharedAgent_sMDAgent = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)handleLogOut
{
}

- (MDAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)MDAgent;
  return [(MDAgent *)&v3 init];
}

@end