@interface UAActivityBecameCurrentEvent
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation UAActivityBecameCurrentEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.BecameCurrent";
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setActivityType:(id)a3
{
}

- (id)eventPayload
{
  v11[0] = @"activityType";
  uint64_t v3 = [(UAActivityBecameCurrentEvent *)self reportedActivityType];
  v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = @"-";
  }
  v11[1] = @"bundleIdentifier";
  v12[0] = v5;
  uint64_t v6 = [(UAActivityBecameCurrentEvent *)self bundleIdentifier];
  v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = @"-";
  }
  v12[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)reportedActivityType
{
  uint64_t v3 = [(UAActivityBecameCurrentEvent *)self activityType];
  v4 = [(UAAnalyticsEvent *)self firstPartyActivityTypeOrUnknown:v3];

  return v4;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end