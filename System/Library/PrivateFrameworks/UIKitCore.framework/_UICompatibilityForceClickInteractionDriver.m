@interface _UICompatibilityForceClickInteractionDriver
- (BOOL)allowsRepeatedClicks;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
@end

@implementation _UICompatibilityForceClickInteractionDriver

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 1;
}

- (BOOL)allowsRepeatedClicks
{
  return 0;
}

@end