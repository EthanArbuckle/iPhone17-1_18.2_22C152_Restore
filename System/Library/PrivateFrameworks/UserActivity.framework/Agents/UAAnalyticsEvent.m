@interface UAAnalyticsEvent
- (id)description;
- (id)eventName;
- (id)eventPayload;
- (id)firstPartyActivityTypeOrUnknown:(id)a3;
- (void)sendEvent;
@end

@implementation UAAnalyticsEvent

- (void)sendEvent
{
  v3 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(UAAnalyticsEvent *)self eventName];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sending event: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(UAAnalyticsEvent *)self eventName];
  v6 = [(UAAnalyticsEvent *)self eventPayload];
  AnalyticsSendEvent();
}

- (id)firstPartyActivityTypeOrUnknown:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@":com.apple."] & 1) != 0
    || ([v3 hasPrefix:@"com.apple."] & 1) != 0
    || [v3 isEqualToString:@"NSUserActivityTypeBrowsingWeb"])
  {
    v4 = (__CFString *)v3;
  }
  else
  {
    v4 = @"unknown";
  }
  v5 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138478083;
    id v8 = v3;
    __int16 v9 = 2113;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Metric AT for %{private}@ is %{private}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)eventName
{
  return @"com.apple.UserActivity.baseEvent";
}

- (id)eventPayload
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(UAAnalyticsEvent *)self eventName];
  [v3 appendString:v4];

  [v3 appendString:@" => "];
  v5 = [(UAAnalyticsEvent *)self eventPayload];
  [v3 appendFormat:@"%@", v5];

  return v3;
}

@end