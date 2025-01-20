@interface UAActivityWasDiscoveredEvent
- (NSString)activityType;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)setActivityType:(id)a3;
@end

@implementation UAActivityWasDiscoveredEvent

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasDiscovered";
}

- (id)eventPayload
{
  CFStringRef v7 = @"activityType";
  uint64_t v2 = [(UAActivityWasDiscoveredEvent *)self reportedActivityType];
  v3 = (void *)v2;
  CFStringRef v4 = @"-";
  if (v2) {
    CFStringRef v4 = (const __CFString *)v2;
  }
  CFStringRef v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (id)reportedActivityType
{
  v3 = [(UAActivityWasDiscoveredEvent *)self activityType];
  CFStringRef v4 = [(UAAnalyticsEvent *)self firstPartyActivityTypeOrUnknown:v3];

  return v4;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActivityType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end