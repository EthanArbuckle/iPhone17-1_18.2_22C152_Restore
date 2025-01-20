@interface VKAnalyticsEvent
- (BOOL)cleansesBundleID;
- (BOOL)isPerformingAutomatedTest;
- (NSDate)date;
- (NSString)bundleIdentifier;
- (VKAnalyticsAnalyzerEvent)analyzerEvent;
- (VKAnalyticsDDEvent)ddEvent;
- (VKAnalyticsDataScannerEvent)dataScannerEvent;
- (VKAnalyticsEvent)initWithCustomIdentifier:(id)a3;
- (VKAnalyticsInteractionEvent)interactionEvent;
- (VKAnalyticsMRCEvent)mrcEvent;
- (VKAnalyticsQuickActionEvent)quickActionEvent;
- (VKAnalyticsSubjectEvent)subjectEvent;
- (VKAnalyticsTextEvent)textEvent;
- (VKAnalyticsVisualSearchEvent)visualSearchEvent;
- (id)bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:(id)a3;
- (id)coreAnalyticsDictionary;
- (id)eventKey;
- (int64_t)type;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation VKAnalyticsEvent

- (VKAnalyticsEvent)initWithCustomIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKAnalyticsEvent;
  v5 = [(VKAnalyticsEvent *)&v11 init];
  if (v5)
  {
    v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    date = v5->_date;
    v5->_date = v6;

    uint64_t v8 = [(VKAnalyticsEvent *)v5 bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:v4];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v5->_isPerformingAutomatedTest = +[VKCInternalSettings isPerformingAutomatedTest];
  }

  return v5;
}

- (BOOL)cleansesBundleID
{
  return 0;
}

- (id)bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    if ([(VKAnalyticsEvent *)self cleansesBundleID])
    {
      if ([v7 hasPrefix:@"com.apple."]) {
        v5 = v7;
      }
      else {
        v5 = @"3rdparty";
      }
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)eventKey
{
  return 0;
}

- (id)coreAnalyticsDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (VKAnalyticsAnalyzerEvent)analyzerEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsAnalyzerEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsTextEvent)textEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsTextEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsDDEvent)ddEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsDDEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsMRCEvent)mrcEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsMRCEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsQuickActionEvent)quickActionEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsQuickActionEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsInteractionEvent)interactionEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsInteractionEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsVisualSearchEvent)visualSearchEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsVisualSearchEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsSubjectEvent)subjectEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsSubjectEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsDataScannerEvent)dataScannerEvent
{
  uint64_t v3 = objc_opt_class();
  return (VKAnalyticsDataScannerEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (int64_t)type
{
  return 1;
}

- (NSString)bundleIdentifier
{
  if (self->_bundleIdentifier) {
    return self->_bundleIdentifier;
  }
  else {
    return (NSString *)@"nil";
  }
}

- (BOOL)isPerformingAutomatedTest
{
  return self->_isPerformingAutomatedTest;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end