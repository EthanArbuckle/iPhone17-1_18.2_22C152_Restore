@interface _LSUserActivityWasContinuedInfo
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
- (double)transferDuration;
- (double)transferSpeed;
- (id)description;
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
- (void)setWebToNative:(BOOL)a3;
- (void)submit;
@end

@implementation _LSUserActivityWasContinuedInfo

- (void)submit
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_submitted)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_submitted = 1;
    objc_sync_exit(obj);
  }
}

- (id)description
{
  v21.receiver = self;
  v21.super_class = (Class)_LSUserActivityWasContinuedInfo;
  v20 = [(_LSUserActivityWasContinuedInfo *)&v21 description];
  v19 = [(_LSUserActivityWasContinuedInfo *)self bundleIdentifier];
  v3 = [(_LSUserActivityWasContinuedInfo *)self activityType];
  if ([(_LSUserActivityWasContinuedInfo *)self isBrowserFallback]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  unint64_t v5 = [(_LSUserActivityWasContinuedInfo *)self payloadSize];
  [(_LSUserActivityWasContinuedInfo *)self transferSpeed];
  double v7 = v6;
  [(_LSUserActivityWasContinuedInfo *)self transferDuration];
  uint64_t v9 = v8;
  v10 = [(_LSUserActivityWasContinuedInfo *)self error];
  if ([(_LSUserActivityWasContinuedInfo *)self isCancelled]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  unint64_t v12 = [(_LSUserActivityWasContinuedInfo *)self interactionType];
  unsigned int v13 = [(_LSUserActivityWasContinuedInfo *)self webToNative];
  unsigned int v14 = [(_LSUserActivityWasContinuedInfo *)self supportsContinuityStreams];
  if (v13) {
    CFStringRef v15 = @"YES";
  }
  else {
    CFStringRef v15 = @"NO";
  }
  if (v14) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  v17 = +[NSString stringWithFormat:@"%@(%@ %@ browserFallback=%@ %ld/%.2fk/%.4f sec %@ %@ %lx w2n=%@ scs=%@)", v20, v19, v3, v4, v5, v7 * 0.0009765625, v9, v10, v11, v12, v15, v16];

  return v17;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
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
  return (NSError *)objc_getProperty(self, a2, 64, 1);
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
  return (NSString *)objc_getProperty(self, a2, 80, 1);
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
}

@end