@interface NTKFaceSupportNotificationPresentationEvent
- (NSDictionary)ntkfs_analyticsJSONRepresentation;
- (NSString)bundleIdentifier;
- (NSString)ntkfs_analyticsEventName;
- (NTKFaceSupportNotificationPresentationEvent)initWithBundleIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 delayFromServerPush:(double)a6 delayFromBundleUnlock:(double)a7 schedulingErrorCode:(int64_t)a8 optOutSources:(int64_t)a9;
- (double)delayFromBundleUnlock;
- (double)delayFromServerPush;
- (int64_t)artworkUsed;
- (int64_t)optOutSources;
- (int64_t)schedulingErrorCode;
- (int64_t)status;
@end

@implementation NTKFaceSupportNotificationPresentationEvent

- (NTKFaceSupportNotificationPresentationEvent)initWithBundleIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 delayFromServerPush:(double)a6 delayFromBundleUnlock:(double)a7 schedulingErrorCode:(int64_t)a8 optOutSources:(int64_t)a9
{
  id v16 = a3;
  v17 = 0;
  if ([v16 length]
    && (unint64_t)(a4 - 5) >= 0xFFFFFFFFFFFFFFFCLL
    && a6 > 0.0
    && a7 > 0.0
    && (unint64_t)a9 <= 3)
  {
    v22.receiver = self;
    v22.super_class = (Class)NTKFaceSupportNotificationPresentationEvent;
    v18 = [(NTKFaceSupportNotificationPresentationEvent *)&v22 init];
    if (v18)
    {
      uint64_t v19 = [v16 copy];
      bundleIdentifier = v18->_bundleIdentifier;
      v18->_bundleIdentifier = (NSString *)v19;

      v18->_status = a4;
      v18->_artworkUsed = a5;
      v18->_delayFromServerPush = a6;
      v18->_delayFromBundleUnlock = a7;
      v18->_schedulingErrorCode = a8;
      v18->_optOutSources = a9;
    }
    self = v18;
    v17 = self;
  }

  return v17;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)@"com.apple.nanotimekit.facesupport.notification_presentation";
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  v21[7] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKFaceSupportNotificationPresentationEvent *)self bundleIdentifier];
  int64_t v4 = [(NTKFaceSupportNotificationPresentationEvent *)self status];
  int64_t v5 = [(NTKFaceSupportNotificationPresentationEvent *)self artworkUsed];
  [(NTKFaceSupportNotificationPresentationEvent *)self delayFromServerPush];
  double v7 = v6;
  [(NTKFaceSupportNotificationPresentationEvent *)self delayFromBundleUnlock];
  double v9 = v8;
  int64_t v10 = [(NTKFaceSupportNotificationPresentationEvent *)self schedulingErrorCode];
  int64_t v11 = [(NTKFaceSupportNotificationPresentationEvent *)self optOutSources];
  v21[0] = v3;
  v20[0] = @"bundle_identifier";
  v20[1] = @"status";
  v12 = [NSNumber numberWithInteger:v4];
  v21[1] = v12;
  v20[2] = @"artwork_used";
  v13 = [NSNumber numberWithInteger:v5];
  v21[2] = v13;
  v20[3] = @"delay_from_server_push";
  v14 = [NSNumber numberWithDouble:v7];
  v21[3] = v14;
  v20[4] = @"delay_from_bundle_unlock";
  v15 = [NSNumber numberWithDouble:v9];
  v21[4] = v15;
  v20[5] = @"scheduling_error_code";
  id v16 = [NSNumber numberWithInteger:v10];
  v21[5] = v16;
  v20[6] = @"opt_out_sources";
  v17 = [NSNumber numberWithInteger:v11];
  v21[6] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  return (NSDictionary *)v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)artworkUsed
{
  return self->_artworkUsed;
}

- (double)delayFromServerPush
{
  return self->_delayFromServerPush;
}

- (double)delayFromBundleUnlock
{
  return self->_delayFromBundleUnlock;
}

- (int64_t)schedulingErrorCode
{
  return self->_schedulingErrorCode;
}

- (int64_t)optOutSources
{
  return self->_optOutSources;
}

- (void).cxx_destruct
{
}

@end