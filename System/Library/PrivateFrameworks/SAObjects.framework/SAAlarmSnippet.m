@interface SAAlarmSnippet
+ (id)snippet;
- (NSArray)alarms;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarms:(id)a3;
@end

@implementation SAAlarmSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alarms
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"alarms", v3);
}

- (void)setAlarms:(id)a3
{
}

@end