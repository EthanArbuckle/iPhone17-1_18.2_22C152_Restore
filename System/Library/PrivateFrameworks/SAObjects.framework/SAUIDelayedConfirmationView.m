@interface SAUIDelayedConfirmationView
+ (id)delayedConfirmationView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)autoConfirmDelay;
- (void)setAutoConfirmDelay:(int64_t)a3;
@end

@implementation SAUIDelayedConfirmationView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DelayedConfirmationView";
}

+ (id)delayedConfirmationView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)autoConfirmDelay
{
  return AceObjectIntegerForProperty(self, @"autoConfirmDelay");
}

- (void)setAutoConfirmDelay:(int64_t)a3
{
}

@end