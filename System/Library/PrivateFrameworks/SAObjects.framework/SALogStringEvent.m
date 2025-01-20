@interface SALogStringEvent
+ (id)logStringEvent;
- (BOOL)requiresResponse;
- (NSString)eventName;
- (NSString)eventValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEventName:(id)a3;
- (void)setEventValue:(id)a3;
@end

@implementation SALogStringEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"LogStringEvent";
}

+ (id)logStringEvent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)eventName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"eventName"];
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"eventValue"];
}

- (void)setEventValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end