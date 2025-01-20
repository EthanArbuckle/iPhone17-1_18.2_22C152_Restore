@interface UAUserActivityAnalyticsInfo
- (BOOL)isBrowserFallback;
- (BOOL)isCancelled;
- (BOOL)isFromPairedDevice;
- (BOOL)payloadRequested;
- (BOOL)scheduledForSubmission;
- (BOOL)supportsContinuityStreams;
- (BOOL)webToNative;
- (NSError)error;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)remoteDeviceType;
- (NSUUID)uuid;
- (double)transferDuration;
- (double)transferSpeed;
- (unint64_t)interactionType;
- (unint64_t)payloadSize;
- (unint64_t)suggestedActionType;
- (void)setActivityType:(id)a3;
- (void)setBrowserFallback:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFromPairedDevice:(BOOL)a3;
- (void)setInteractionType:(unint64_t)a3;
- (void)setPayloadRequested:(BOOL)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setRemoteDeviceType:(id)a3;
- (void)setScheduledForSubmission:(BOOL)a3;
- (void)setSuggestedActionType:(unint64_t)a3;
- (void)setSupportsContinuityStreams:(BOOL)a3;
- (void)setTransferDuration:(double)a3;
- (void)setTransferSpeed:(double)a3;
- (void)setUuid:(id)a3;
- (void)setWebToNative:(BOOL)a3;
@end

@implementation UAUserActivityAnalyticsInfo

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActivityType:(id)a3
{
}

- (unint64_t)suggestedActionType
{
  return self->_suggestedActionType;
}

- (void)setSuggestedActionType:(unint64_t)a3
{
  self->_suggestedActionType = a3;
}

- (BOOL)isFromPairedDevice
{
  return self->_fromPairedDevice;
}

- (void)setFromPairedDevice:(BOOL)a3
{
  self->_fromPairedDevice = a3;
}

- (BOOL)isBrowserFallback
{
  return self->_browserFallback;
}

- (void)setBrowserFallback:(BOOL)a3
{
  self->_browserFallback = a3;
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
}

- (double)transferSpeed
{
  return self->_transferSpeed;
}

- (void)setTransferSpeed:(double)a3
{
  self->_transferSpeed = a3;
}

- (double)transferDuration
{
  return self->_transferDuration;
}

- (void)setTransferDuration:(double)a3
{
  self->_transferDuration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)webToNative
{
  return self->_webToNative;
}

- (void)setWebToNative:(BOOL)a3
{
  self->_webToNative = a3;
}

- (BOOL)supportsContinuityStreams
{
  return self->_supportsContinuityStreams;
}

- (void)setSupportsContinuityStreams:(BOOL)a3
{
  self->_supportsContinuityStreams = a3;
}

- (NSString)remoteDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoteDeviceType:(id)a3
{
}

- (BOOL)scheduledForSubmission
{
  return self->_scheduledForSubmission;
}

- (void)setScheduledForSubmission:(BOOL)a3
{
  self->_scheduledForSubmission = a3;
}

- (BOOL)payloadRequested
{
  return self->_payloadRequested;
}

- (void)setPayloadRequested:(BOOL)a3
{
  self->_payloadRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end