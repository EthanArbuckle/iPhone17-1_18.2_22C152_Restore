@interface _UIControlLongPressClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
- (double)clickTimeoutDuration;
@end

@implementation _UIControlLongPressClickInteractionDriver

+ (BOOL)prefersCancelsTouchesInView
{
  return 0;
}

- (double)clickTimeoutDuration
{
  return 0.5;
}

@end