@interface SAWristDetectionStatusClientState
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
+ (id)wristDetectionStatusClientState;
- (BOOL)wristDetected;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWristDetected:(BOOL)a3;
@end

@implementation SAWristDetectionStatusClientState

+ (id)deliveryDeadline
{
  return @"BEFORE_FINISH_SPEECH";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_USER_DATA";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"WristDetectionStatusClientState";
}

+ (id)wristDetectionStatusClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)wristDetected
{
  return AceObjectBoolForProperty(self, @"wristDetected");
}

- (void)setWristDetected:(BOOL)a3
{
}

@end