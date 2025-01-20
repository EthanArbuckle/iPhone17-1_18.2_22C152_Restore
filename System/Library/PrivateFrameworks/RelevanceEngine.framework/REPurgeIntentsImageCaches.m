@interface REPurgeIntentsImageCaches
@end

@implementation REPurgeIntentsImageCaches

void ___REPurgeIntentsImageCaches__49165157_block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"UIApplicationDidEnterBackgroundNotification" object:0];
}

@end