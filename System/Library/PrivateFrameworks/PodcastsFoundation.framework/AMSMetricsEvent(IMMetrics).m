@interface AMSMetricsEvent(IMMetrics)
+ (IMClickAMSMetricsEvent)im_clickEventWithDefaultTopic;
+ (IMPageAMSMetricsEvent)im_pageEventWithDefaultTopic;
+ (id)im_defaultTopicForEvents;
+ (id)im_eventWithDefaultTopic;
+ (id)im_eventWithDefaultTopicAndEventType:()IMMetrics;
+ (id)im_eventWithTopic:()IMMetrics eventType:;
- (id)shortDescription;
- (uint64_t)im_contentIdentifier;
- (uint64_t)im_name;
- (uint64_t)im_setContentIdentifier:()IMMetrics;
- (uint64_t)im_setName:()IMMetrics;
- (uint64_t)im_setToken:()IMMetrics;
- (uint64_t)im_token;
@end

@implementation AMSMetricsEvent(IMMetrics)

- (uint64_t)im_setToken:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, @"token");
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [a1 topic];
  v4 = [a1 propertyForBodyKey:@"eventType"];
  v5 = [a1 propertyForBodyKey:@"pageType"];
  v6 = [v2 stringWithFormat:@"%@, %@, %@", v3, v4, v5];

  return v6;
}

+ (id)im_defaultTopicForEvents
{
  v0 = +[IMMetrics defaultMetricsController];
  v1 = [v0 topic];

  if ([v1 length])
  {
    id v2 = v1;
  }
  else
  {
    v3 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_ERROR, "Error: No default topic has been registered with the registered default controller in IMMetrics", v5, 2u);
    }

    id v2 = 0;
  }

  return v2;
}

- (uint64_t)im_setContentIdentifier:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, @"contentId");
}

- (uint64_t)im_setName:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, @"name");
}

+ (id)im_eventWithDefaultTopic
{
  v0 = +[IMMetrics defaultMetricsController];
  v1 = [v0 topic];

  if ([v1 length])
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F4DD60]) initWithTopic:v1];
  }
  else
  {
    v3 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_ERROR, "Error: No topic has been registered with IMMetrics default controller.", v5, 2u);
    }

    id v2 = 0;
  }

  return v2;
}

+ (IMClickAMSMetricsEvent)im_clickEventWithDefaultTopic
{
  v0 = objc_alloc_init(IMClickAMSMetricsEvent);
  return v0;
}

+ (IMPageAMSMetricsEvent)im_pageEventWithDefaultTopic
{
  v0 = objc_alloc_init(IMPageAMSMetricsEvent);
  return v0;
}

+ (id)im_eventWithDefaultTopicAndEventType:()IMMetrics
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F4DD60], "im_eventWithDefaultTopic");
  v5 = v4;
  if (v4) {
    [v4 setProperty:v3 forBodyKey:@"eventType"];
  }

  return v5;
}

+ (id)im_eventWithTopic:()IMMetrics eventType:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F4DD60];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithTopic:v7];

  if (v8) {
    [v8 setProperty:v5 forBodyKey:@"eventType"];
  }

  return v8;
}

- (uint64_t)im_name
{
  return [a1 propertyForBodyKey:@"name"];
}

- (uint64_t)im_contentIdentifier
{
  return [a1 propertyForBodyKey:@"contentId"];
}

- (uint64_t)im_token
{
  return [a1 propertyForBodyKey:@"token"];
}

@end