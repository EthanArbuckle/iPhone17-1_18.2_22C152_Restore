@interface PSGXPCServer
+ (void)registerXPCListeners;
@end

@implementation PSGXPCServer

+ (void)registerXPCListeners
{
  v2 = (void *)MEMORY[0x263F61EB8];
  v3 = objc_opt_new();
  [v2 registerForService:@"com.apple.proactive.input.suggester" delegate:v3];

  v4 = (void *)MEMORY[0x263F61EB8];
  id v5 = (id)objc_opt_new();
  [v4 registerForService:@"com.apple.private.psg.internal" delegate:v5];
}

@end