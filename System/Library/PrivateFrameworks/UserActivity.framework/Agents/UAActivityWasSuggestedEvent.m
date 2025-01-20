@interface UAActivityWasSuggestedEvent
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (UAActivityWasSuggestedEvent)initWithAnalyticsInfo:(id)a3;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)sendEvent;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation UAActivityWasSuggestedEvent

- (UAActivityWasSuggestedEvent)initWithAnalyticsInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UAActivityWasSuggestedEvent;
  v5 = [(UAActivityWasSuggestedEvent *)&v9 init];
  if (v5)
  {
    v6 = [v4 activityType];
    [(UAActivityWasSuggestedEvent *)v5 setActivityType:v6];

    v7 = [v4 bundleIdentifier];
    [(UAActivityWasSuggestedEvent *)v5 setBundleIdentifier:v7];
  }
  return v5;
}

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasSuggested";
}

- (id)eventPayload
{
  v11[0] = @"activityType";
  uint64_t v3 = [(UAActivityWasSuggestedEvent *)self reportedActivityType];
  id v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = @"-";
  }
  v11[1] = @"bundleIdentifier";
  v12[0] = v5;
  uint64_t v6 = [(UAActivityWasSuggestedEvent *)self bundleIdentifier];
  v7 = (void *)v6;
  CFStringRef v8 = @"?";
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  v12[1] = v8;
  objc_super v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)sendEvent
{
  uint64_t v3 = [(UAActivityWasSuggestedEvent *)self bundleIdentifier];

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)UAActivityWasSuggestedEvent;
    [(UAAnalyticsEvent *)&v4 sendEvent];
  }
}

- (id)reportedActivityType
{
  uint64_t v3 = [(UAActivityWasSuggestedEvent *)self activityType];
  objc_super v4 = [(UAAnalyticsEvent *)self firstPartyActivityTypeOrUnknown:v3];

  return v4;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActivityType:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end