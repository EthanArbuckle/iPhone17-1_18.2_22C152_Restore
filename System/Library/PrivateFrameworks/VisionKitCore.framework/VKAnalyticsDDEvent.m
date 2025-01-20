@interface VKAnalyticsDDEvent
- (VKAnalyticsDDEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)eventType;
- (int64_t)type;
- (unint64_t)dataDetectorTypes;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setEventType:(int64_t)a3;
@end

@implementation VKAnalyticsDDEvent

- (VKAnalyticsDDEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsDDEvent;
  v9 = [(VKAnalyticsEvent *)&v12 initWithCustomIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v9->_eventType = a4;
    v9->_dataDetectorTypes = [v8 dataDetectorTypes];
  }

  return v10;
}

- (id)eventKey
{
  return @"DataDetectorEventOccured";
}

- (int64_t)type
{
  return 3;
}

- (id)coreAnalyticsDictionary
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"types";
  v3 = VKMUIStringForDDTypes([(VKAnalyticsDDEvent *)self dataDetectorTypes]);
  v10[0] = v3;
  v9[1] = @"eventType";
  v4 = VKMUIStringForVKAnalyticsDDEventType([(VKAnalyticsDDEvent *)self eventType]);
  v10[1] = v4;
  v9[2] = @"automatedTest";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v10[2] = v5;
  v9[3] = @"bundleIdentifier";
  v6 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)VKAnalyticsDDEvent;
  v4 = [(VKAnalyticsDDEvent *)&v11 description];
  v5 = VKMUIStringForVKAnalyticsDDEventType([(VKAnalyticsDDEvent *)self eventType]);
  v6 = VKMUIStringForDDTypes([(VKAnalyticsDDEvent *)self dataDetectorTypes]);
  v7 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  id v8 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v9 = [v3 stringWithFormat:@"%@ \n ddEventType: %@ \n ddTypes: %@ \n automatedTest: %@ \n bundleIdentifier %@ ", v4, v5, v6, v7, v8];

  return v9;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

@end