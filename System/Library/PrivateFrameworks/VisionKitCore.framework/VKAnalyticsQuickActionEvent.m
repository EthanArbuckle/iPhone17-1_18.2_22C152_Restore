@interface VKAnalyticsQuickActionEvent
- (NSString)quickActionType;
- (VKAnalyticsQuickActionEvent)initWithQuickActionType:(id)a3 quickActionsCount:(int64_t)a4 textLength:(int64_t)a5 eventType:(int64_t)a6 customIdentifier:(id)a7;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)eventType;
- (int64_t)quickActionsCount;
- (int64_t)textLength;
- (int64_t)type;
- (void)setEventType:(int64_t)a3;
- (void)setQuickActionType:(id)a3;
- (void)setQuickActionsCount:(int64_t)a3;
- (void)setTextLength:(int64_t)a3;
@end

@implementation VKAnalyticsQuickActionEvent

- (VKAnalyticsQuickActionEvent)initWithQuickActionType:(id)a3 quickActionsCount:(int64_t)a4 textLength:(int64_t)a5 eventType:(int64_t)a6 customIdentifier:(id)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKAnalyticsQuickActionEvent;
  v14 = [(VKAnalyticsEvent *)&v17 initWithCustomIdentifier:a7];
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a6;
    v14->_quickActionsCount = a4;
    objc_storeStrong((id *)&v14->_quickActionType, a3);
    v15->_textLength = a5;
  }

  return v15;
}

- (id)eventKey
{
  return @"quickActionEventOccurred";
}

- (int64_t)type
{
  return 5;
}

- (id)coreAnalyticsDictionary
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  v3 = VKMUIStringForVKAnalyticsQAEventType([(VKAnalyticsQuickActionEvent *)self eventType]);
  v14[0] = v3;
  v13[1] = @"types";
  uint64_t v4 = [(VKAnalyticsQuickActionEvent *)self quickActionType];
  v5 = (void *)v4;
  v6 = &stru_1F35566F8;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v14[1] = v6;
  v13[2] = @"textLength";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsQuickActionEvent textLength](self, "textLength"));
  v14[2] = v7;
  v13[3] = @"numberOfQuickActions";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsQuickActionEvent quickActionsCount](self, "quickActionsCount"));
  v14[3] = v8;
  v13[4] = @"automatedTest";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v14[4] = v9;
  v13[5] = @"bundleIdentifier";
  v10 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v14[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)VKAnalyticsQuickActionEvent;
  uint64_t v4 = [(VKAnalyticsQuickActionEvent *)&v15 description];
  v5 = VKMUIStringForVKAnalyticsQAEventType([(VKAnalyticsQuickActionEvent *)self eventType]);
  uint64_t v6 = [(VKAnalyticsQuickActionEvent *)self quickActionType];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F35566F8;
  }
  int64_t v9 = [(VKAnalyticsQuickActionEvent *)self textLength];
  int64_t v10 = [(VKAnalyticsQuickActionEvent *)self quickActionsCount];
  v11 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v12 = [(VKAnalyticsEvent *)self bundleIdentifier];
  id v13 = [v3 stringWithFormat:@"%@ \n eventType: %@ \n types: %@ \n textLength: %lu \n numberOfQuickActions: %lu \n automatedTest: %@ \n bundleIdentifier: %@ ", v4, v5, v8, v9, v10, v11, v12];

  return v13;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (int64_t)quickActionsCount
{
  return self->_quickActionsCount;
}

- (void)setQuickActionsCount:(int64_t)a3
{
  self->_quickActionsCount = a3;
}

- (NSString)quickActionType
{
  return self->_quickActionType;
}

- (void)setQuickActionType:(id)a3
{
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_textLength = a3;
}

- (void).cxx_destruct
{
}

@end