@interface SASiriPresentationClientState
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
+ (id)siriPresentationClientState;
- (BOOL)isFullScreen;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIsFullScreen:(BOOL)a3;
@end

@implementation SASiriPresentationClientState

+ (id)deliveryDeadline
{
  return @"BEFORE_FINISH_SPEECH";
}

+ (id)persistencePolicy
{
  return @"UNDEFINED";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SiriPresentationClientState";
}

+ (id)siriPresentationClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)isFullScreen
{
  return AceObjectBoolForProperty(self, @"isFullScreen");
}

- (void)setIsFullScreen:(BOOL)a3
{
}

@end