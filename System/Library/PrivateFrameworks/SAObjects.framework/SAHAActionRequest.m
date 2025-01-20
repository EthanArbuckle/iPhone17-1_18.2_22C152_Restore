@interface SAHAActionRequest
+ (id)actionRequest;
- (NSArray)actions;
- (SAHAFilter)filter;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)executionOrder;
- (void)setActions:(id)a3;
- (void)setExecutionOrder:(int64_t)a3;
- (void)setFilter:(id)a3;
@end

@implementation SAHAActionRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"ActionRequest";
}

+ (id)actionRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)actions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"actions", v3);
}

- (void)setActions:(id)a3
{
}

- (int64_t)executionOrder
{
  return AceObjectIntegerForProperty(self, @"executionOrder");
}

- (void)setExecutionOrder:(int64_t)a3
{
}

- (SAHAFilter)filter
{
  return (SAHAFilter *)AceObjectAceObjectForProperty(self, @"filter");
}

- (void)setFilter:(id)a3
{
}

@end