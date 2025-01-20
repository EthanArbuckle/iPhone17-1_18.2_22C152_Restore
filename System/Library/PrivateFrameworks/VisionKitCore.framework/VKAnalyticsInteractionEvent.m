@interface VKAnalyticsInteractionEvent
- (BOOL)analysisButtonActive;
- (VKAnalyticsInteractionEvent)initWithEventType:(int64_t)a3 analysis:(id)a4 source:(int64_t)a5 interactionTypes:(unint64_t)a6 buttonActive:(BOOL)a7 customIdentifier:(id)a8;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)ddCount;
- (int64_t)eventType;
- (int64_t)mrcCount;
- (int64_t)source;
- (int64_t)textLength;
- (int64_t)type;
- (int64_t)vsCount;
- (unint64_t)activeInteractionTypes;
- (void)setActiveInteractionTypes:(unint64_t)a3;
- (void)setAnalysisButtonActive:(BOOL)a3;
- (void)setDdCount:(int64_t)a3;
- (void)setEventType:(int64_t)a3;
- (void)setMrcCount:(int64_t)a3;
- (void)setSource:(int64_t)a3;
- (void)setTextLength:(int64_t)a3;
- (void)setVsCount:(int64_t)a3;
@end

@implementation VKAnalyticsInteractionEvent

- (VKAnalyticsInteractionEvent)initWithEventType:(int64_t)a3 analysis:(id)a4 source:(int64_t)a5 interactionTypes:(unint64_t)a6 buttonActive:(BOOL)a7 customIdentifier:(id)a8
{
  id v14 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VKAnalyticsInteractionEvent;
  v15 = [(VKAnalyticsEvent *)&v23 initWithCustomIdentifier:a8];
  v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    v15->_analysisButtonActive = a7;
    v15->_source = a5;
    v15->_activeInteractionTypes = a6;
    v17 = [v14 text];
    v16->_textLength = [v17 length];

    v18 = [v14 textDataDetectorElements];
    v16->_ddCount = [v18 count];

    v19 = [v14 mrcDataDetectorElements];
    v16->_mrcCount = [v19 count];

    v20 = [v14 visualSearchResult];
    v21 = [v20 resultItems];
    v16->_vsCount = [v21 count];
  }
  return v16;
}

- (id)eventKey
{
  return @"InteractionEventOccured";
}

- (int64_t)type
{
  return 8;
}

- (id)coreAnalyticsDictionary
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"eventSource";
  id v14 = VKMUIStringForVKAnalyticsEventSource([(VKAnalyticsInteractionEvent *)self source]);
  v16[0] = v14;
  v15[1] = @"analysisButtonActive";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsInteractionEvent analysisButtonActive](self, "analysisButtonActive"));
  v16[1] = v3;
  v15[2] = @"activeInteractionTypes";
  v4 = VKMUIStringForAnalysisInteractionTypes([(VKAnalyticsInteractionEvent *)self activeInteractionTypes]);
  v16[2] = v4;
  v15[3] = @"eventType";
  v5 = VKMUIStringForVKAnalyticsInteractionEventType([(VKAnalyticsInteractionEvent *)self eventType]);
  v16[3] = v5;
  v15[4] = @"textLength";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent textLength](self, "textLength"));
  v16[4] = v6;
  v15[5] = @"ddCount";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent ddCount](self, "ddCount"));
  v16[5] = v7;
  v15[6] = @"mrcCount";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent mrcCount](self, "mrcCount"));
  v16[6] = v8;
  v15[7] = @"vsCount";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent vsCount](self, "vsCount"));
  v16[7] = v9;
  v15[8] = @"automatedTest";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v16[8] = v10;
  v15[9] = @"bundleIdentifier";
  v11 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v16[9] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v12;
}

- (id)description
{
  id v14 = (id)NSString;
  v17.receiver = self;
  v17.super_class = (Class)VKAnalyticsInteractionEvent;
  v16 = [(VKAnalyticsInteractionEvent *)&v17 description];
  v3 = VKMUIStringForVKAnalyticsInteractionEventType([(VKAnalyticsInteractionEvent *)self eventType]);
  v4 = VKMUIStringForAnalysisInteractionTypes([(VKAnalyticsInteractionEvent *)self activeInteractionTypes]);
  v5 = VKMUIStringForVKAnalyticsEventSource([(VKAnalyticsInteractionEvent *)self source]);
  v13 = VKMUIStringForBool([(VKAnalyticsInteractionEvent *)self analysisButtonActive]);
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent textLength](self, "textLength"));
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent ddCount](self, "ddCount"));
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent mrcCount](self, "mrcCount"));
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsInteractionEvent vsCount](self, "vsCount"));
  v10 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v11 = [(VKAnalyticsEvent *)self bundleIdentifier];
  id v15 = [v14 stringWithFormat:@"%@ \n eventType: %@ \n activeInteractionTypes: %@ \n source: %@ \n analysisButtonActive: %@ \n textLength: %@ \n ddCount: %@ \n mrcCount: %@ \n vsCount: %@ \n automatedTest: %@ \n bundleIdentifier: %@", v16, v3, v4, v5, v13, v6, v7, v8, v9, v10, v11];

  return v15;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)analysisButtonActive
{
  return self->_analysisButtonActive;
}

- (void)setAnalysisButtonActive:(BOOL)a3
{
  self->_analysisButtonActive = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)activeInteractionTypes
{
  return self->_activeInteractionTypes;
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  self->_activeInteractionTypes = a3;
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_textLength = a3;
}

- (int64_t)ddCount
{
  return self->_ddCount;
}

- (void)setDdCount:(int64_t)a3
{
  self->_ddCount = a3;
}

- (int64_t)mrcCount
{
  return self->_mrcCount;
}

- (void)setMrcCount:(int64_t)a3
{
  self->_mrcCount = a3;
}

- (int64_t)vsCount
{
  return self->_vsCount;
}

- (void)setVsCount:(int64_t)a3
{
  self->_vsCount = a3;
}

@end