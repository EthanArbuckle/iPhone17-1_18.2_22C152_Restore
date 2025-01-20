@interface SANodeIntent
+ (id)nodeIntent;
- (NSArray)matchingSpans;
- (NSArray)privacyPolicy;
- (NSString)name;
- (SAAceSerializable)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMatchingSpans:(id)a3;
- (void)setName:(id)a3;
- (void)setPrivacyPolicy:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SANodeIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"NodeIntent";
}

+ (id)nodeIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)matchingSpans
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"matchingSpans", v3);
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSArray)privacyPolicy
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"privacyPolicy", v3);
}

- (void)setPrivacyPolicy:(id)a3
{
}

- (SAAceSerializable)value
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"value");
}

- (void)setValue:(id)a3
{
}

@end