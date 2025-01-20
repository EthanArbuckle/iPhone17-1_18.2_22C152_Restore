@interface SAAceClientState
+ (id)aceClientState;
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAceClientState

+ (id)deliveryDeadline
{
  return @"UNDEFINED";
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
  return @"AceClientState";
}

+ (id)aceClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end