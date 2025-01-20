@interface SAPhoneCallState
+ (id)callState;
- (BOOL)active;
- (BOOL)incoming;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActive:(BOOL)a3;
- (void)setIncoming:(BOOL)a3;
@end

@implementation SAPhoneCallState

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallState";
}

+ (id)callState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)active
{
  return AceObjectBoolForProperty(self, @"active");
}

- (void)setActive:(BOOL)a3
{
}

- (BOOL)incoming
{
  return AceObjectBoolForProperty(self, @"incoming");
}

- (void)setIncoming:(BOOL)a3
{
}

@end