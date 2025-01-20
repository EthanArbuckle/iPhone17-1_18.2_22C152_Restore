@interface VKAnalyticsSubjectEvent
- (BOOL)cleansesBundleID;
- (BOOL)subjectFound;
- (VKAnalyticsSubjectEvent)initWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6 customIdentifier:(id)a7;
- (double)processingDuration;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)eventType;
- (int64_t)interactionType;
- (int64_t)type;
- (void)setEventType:(int64_t)a3;
- (void)setInteractionType:(int64_t)a3;
- (void)setProcessingDuration:(double)a3;
- (void)setSubjectFound:(BOOL)a3;
@end

@implementation VKAnalyticsSubjectEvent

- (VKAnalyticsSubjectEvent)initWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6 customIdentifier:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsSubjectEvent;
  result = [(VKAnalyticsEvent *)&v12 initWithCustomIdentifier:a7];
  if (result)
  {
    result->_eventType = a3;
    result->_subjectFound = a5;
    result->_processingDuration = a6;
    result->_interactionType = a4;
  }
  return result;
}

- (BOOL)cleansesBundleID
{
  return 1;
}

- (id)eventKey
{
  return @"subjectEventOccurred";
}

- (int64_t)type
{
  return 7;
}

- (id)coreAnalyticsDictionary
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = @"eventType";
  v3 = VKMUIStringForVKAnalyticsSubjectEventType([(VKAnalyticsSubjectEvent *)self eventType]);
  v13[0] = v3;
  v12[1] = @"interactionType";
  v4 = VKMUIStringForVKAnalyticsSubjectInteractionType([(VKAnalyticsSubjectEvent *)self interactionType]);
  v13[1] = v4;
  v12[2] = @"subjectFound";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsSubjectEvent subjectFound](self, "subjectFound"));
  v13[2] = v5;
  v12[3] = @"processingDuration";
  v6 = NSNumber;
  [(VKAnalyticsSubjectEvent *)self processingDuration];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v13[3] = v7;
  v12[4] = @"automatedTest";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v13[4] = v8;
  v12[5] = @"bundleId";
  v9 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v13[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)VKAnalyticsSubjectEvent;
  v4 = [(VKAnalyticsSubjectEvent *)&v14 description];
  v5 = VKMUIStringForVKAnalyticsSubjectEventType([(VKAnalyticsSubjectEvent *)self eventType]);
  v6 = VKMUIStringForVKAnalyticsSubjectInteractionType([(VKAnalyticsSubjectEvent *)self interactionType]);
  v7 = VKMUIStringForBool([(VKAnalyticsSubjectEvent *)self subjectFound]);
  [(VKAnalyticsSubjectEvent *)self processingDuration];
  uint64_t v9 = v8;
  v10 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v11 = [(VKAnalyticsEvent *)self bundleIdentifier];
  objc_super v12 = [v3 stringWithFormat:@"%@ \n eventType: %@ \n interactionType: %@ \n subjectFound: %@ \n processingDuration: %f \n automatedTest: %@ \n bundleId: %@ ", v4, v5, v6, v7, v9, v10, v11];

  return v12;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)subjectFound
{
  return self->_subjectFound;
}

- (void)setSubjectFound:(BOOL)a3
{
  self->_subjectFound = a3;
}

- (double)processingDuration
{
  return self->_processingDuration;
}

- (void)setProcessingDuration:(double)a3
{
  self->_processingDuration = a3;
}

@end