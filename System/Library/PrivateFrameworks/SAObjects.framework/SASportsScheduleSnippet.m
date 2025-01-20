@interface SASportsScheduleSnippet
+ (id)scheduleSnippet;
- (NSArray)matchups;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMatchups:(id)a3;
@end

@implementation SASportsScheduleSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"ScheduleSnippet";
}

+ (id)scheduleSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)matchups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"matchups", v3);
}

- (void)setMatchups:(id)a3
{
}

@end