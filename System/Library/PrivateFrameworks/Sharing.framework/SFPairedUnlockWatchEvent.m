@interface SFPairedUnlockWatchEvent
+ (NSString)eventName;
- (NSDictionary)eventPayload;
- (float)timeSinceBootMin;
- (float)timeSinceLastOnWristSec;
- (float)timeSinceLastWristRaiseSec;
- (int64_t)onWristConfidence;
- (unsigned)motionCheckDurationMs;
- (void)setMotionCheckDurationMs:(unsigned int)a3;
- (void)setOnWristConfidence:(int64_t)a3;
- (void)setTimeSinceBootMin:(float)a3;
- (void)setTimeSinceLastOnWristSec:(float)a3;
- (void)setTimeSinceLastWristRaiseSec:(float)a3;
- (void)submitEvent;
@end

@implementation SFPairedUnlockWatchEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.PairedUnlock.WatchAttempt";
}

- (NSDictionary)eventPayload
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"motionCheckDurationMs";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockWatchEvent motionCheckDurationMs](self, "motionCheckDurationMs"));
  v14[0] = v3;
  v13[1] = @"onWristConfidence";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockWatchEvent onWristConfidence](self, "onWristConfidence"));
  v14[1] = v4;
  v13[2] = @"timeSinceLastWristRaiseSec";
  v5 = NSNumber;
  [(SFPairedUnlockWatchEvent *)self timeSinceLastWristRaiseSec];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  v14[2] = v6;
  v13[3] = @"timeSinceLastOnWristSec";
  v7 = NSNumber;
  [(SFPairedUnlockWatchEvent *)self timeSinceLastOnWristSec];
  v8 = objc_msgSend(v7, "numberWithFloat:");
  v14[3] = v8;
  v13[4] = @"timeSinceBootMin";
  v9 = NSNumber;
  [(SFPairedUnlockWatchEvent *)self timeSinceBootMin];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return (NSDictionary *)v11;
}

- (void)submitEvent
{
  id v4 = +[SFPairedUnlockWatchEvent eventName];
  v3 = [(SFPairedUnlockWatchEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (unsigned)motionCheckDurationMs
{
  return self->_motionCheckDurationMs;
}

- (void)setMotionCheckDurationMs:(unsigned int)a3
{
  self->_motionCheckDurationMs = a3;
}

- (int64_t)onWristConfidence
{
  return self->_onWristConfidence;
}

- (void)setOnWristConfidence:(int64_t)a3
{
  self->_onWristConfidence = a3;
}

- (float)timeSinceLastWristRaiseSec
{
  return self->_timeSinceLastWristRaiseSec;
}

- (void)setTimeSinceLastWristRaiseSec:(float)a3
{
  self->_timeSinceLastWristRaiseSec = a3;
}

- (float)timeSinceLastOnWristSec
{
  return self->_timeSinceLastOnWristSec;
}

- (void)setTimeSinceLastOnWristSec:(float)a3
{
  self->_timeSinceLastOnWristSec = a3;
}

- (float)timeSinceBootMin
{
  return self->_timeSinceBootMin;
}

- (void)setTimeSinceBootMin:(float)a3
{
  self->_timeSinceBootMin = a3;
}

@end