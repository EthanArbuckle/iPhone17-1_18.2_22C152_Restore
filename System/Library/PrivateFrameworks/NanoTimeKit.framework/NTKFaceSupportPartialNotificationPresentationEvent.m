@interface NTKFaceSupportPartialNotificationPresentationEvent
- (NSDate)creationDate;
- (NSDate)pushDate;
- (NSString)identifier;
- (NTKFaceSupportPartialNotificationPresentationEvent)initWithIdentifier:(id)a3 pushDate:(id)a4;
- (NTKFaceSupportPartialNotificationPresentationEvent)presentationEventWithStatus:(int64_t)a3 artworkUsed:(int64_t)a4 errorCode:(int64_t)a5 optOutStatus:(int64_t)a6;
@end

@implementation NTKFaceSupportPartialNotificationPresentationEvent

- (NTKFaceSupportPartialNotificationPresentationEvent)initWithIdentifier:(id)a3 pushDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length]
    && ([v6 isEqualToString:@"NTKFaceSupportPartialNotificationPresentationEventInvalidIdentifier"] & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportPartialNotificationPresentationEvent;
    v9 = [(NTKFaceSupportPartialNotificationPresentationEvent *)&v15 init];
    if (v9)
    {
      uint64_t v10 = [v6 copy];
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v10;

      objc_storeStrong((id *)&v9->_pushDate, a4);
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v12;
    }
    self = v9;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NTKFaceSupportPartialNotificationPresentationEvent)presentationEventWithStatus:(int64_t)a3 artworkUsed:(int64_t)a4 errorCode:(int64_t)a5 optOutStatus:(int64_t)a6
{
  if (a3 == 777777)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v12 = [(NTKFaceSupportPartialNotificationPresentationEvent *)self identifier];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = [(NTKFaceSupportPartialNotificationPresentationEvent *)self pushDate];
    objc_super v15 = [(NTKFaceSupportPartialNotificationPresentationEvent *)self creationDate];
    [v13 timeIntervalSinceDate:v14];
    double v17 = v16;
    [v13 timeIntervalSinceDate:v15];
    id v6 = [[NTKFaceSupportNotificationPresentationEvent alloc] initWithBundleIdentifier:v12 status:a3 artworkUsed:a4 delayFromServerPush:a5 delayFromBundleUnlock:a6 schedulingErrorCode:v17 optOutSources:v18];
  }
  return (NTKFaceSupportPartialNotificationPresentationEvent *)v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)pushDate
{
  return self->_pushDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pushDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end