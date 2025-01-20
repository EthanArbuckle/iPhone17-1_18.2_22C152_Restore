@interface SALogNumericEvent
+ (id)logNumericEvent;
- (BOOL)requiresResponse;
- (NSNumber)eventValue;
- (NSString)eventName;
- (NSString)eventOperation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEventName:(id)a3;
- (void)setEventOperation:(id)a3;
- (void)setEventValue:(id)a3;
@end

@implementation SALogNumericEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"LogNumericEvent";
}

+ (id)logNumericEvent
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

- (NSString)eventOperation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"eventOperation"];
}

- (void)setEventOperation:(id)a3
{
}

- (NSNumber)eventValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"eventValue"];
}

- (void)setEventValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end