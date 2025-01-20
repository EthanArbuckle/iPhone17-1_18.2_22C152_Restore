@interface SATimerSnippet
+ (id)snippet;
- (NSArray)timers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimers:(id)a3;
@end

@implementation SATimerSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
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

- (NSArray)timers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"timers", v3);
}

- (void)setTimers:(id)a3
{
}

@end