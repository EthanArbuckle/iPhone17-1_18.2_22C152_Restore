@interface RCPPlayerDisplayLinkWaiter
+ (void)wait;
- (void)_stop:(id)a3;
- (void)_wait;
@end

@implementation RCPPlayerDisplayLinkWaiter

+ (void)wait
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 _wait];
}

- (void)_wait
{
  id v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__stop_];
  id v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v4 addToRunLoop:v2 forMode:@"RecapDisplayLinkWaitMode"];
  v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 runMode:@"RecapDisplayLinkWaitMode" beforeDate:v3];
}

- (void)_stop:(id)a3
{
}

@end