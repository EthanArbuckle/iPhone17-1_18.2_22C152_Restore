@interface SATimerTimerShow
+ (id)timerShow;
- (BOOL)requiresResponse;
- (NSArray)actions;
- (NSArray)timerIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActions:(id)a3;
- (void)setTimerIds:(id)a3;
@end

@implementation SATimerTimerShow

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"TimerShow";
}

+ (id)timerShow
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

- (NSArray)timerIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"timerIds");
}

- (void)setTimerIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end