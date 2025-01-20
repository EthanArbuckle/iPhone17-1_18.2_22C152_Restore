@interface TSKCoachingTipUtilities
+ (void)updateCoachingTipContext;
@end

@implementation TSKCoachingTipUtilities

+ (void)updateCoachingTipContext
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 postNotificationName:@"TSKCoachingTipContextChangedNotification" object:a1];
}

@end