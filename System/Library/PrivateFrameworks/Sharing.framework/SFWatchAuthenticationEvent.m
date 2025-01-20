@interface SFWatchAuthenticationEvent
+ (NSString)eventName;
- (BOOL)screenOn;
- (BOOL)succeeded;
- (NSDictionary)eventPayload;
- (NSString)remoteHardwareModel;
- (NSString)remoteSoftwareVersion;
- (NSString)watchHardwareModel;
- (NSString)watchSoftwareVersion;
- (double)awdlBringUpDuration;
- (double)discoveryDuration;
- (double)keyExchangeDuration;
- (double)peerFoundDuration;
- (double)rangingDuration;
- (double)timeSinceBoot;
- (double)timeSinceRemoteUnlocked;
- (double)totalDuration;
- (unint64_t)authenticationType;
- (unsigned)failureReason;
- (void)setAuthenticationType:(unint64_t)a3;
- (void)setAwdlBringUpDuration:(double)a3;
- (void)setDiscoveryDuration:(double)a3;
- (void)setFailureReason:(unsigned int)a3;
- (void)setKeyExchangeDuration:(double)a3;
- (void)setPeerFoundDuration:(double)a3;
- (void)setRangingDuration:(double)a3;
- (void)setRemoteHardwareModel:(id)a3;
- (void)setRemoteSoftwareVersion:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setSucceeded:(BOOL)a3;
- (void)setTimeSinceBoot:(double)a3;
- (void)setTimeSinceRemoteUnlocked:(double)a3;
- (void)setTotalDuration:(double)a3;
- (void)setWatchHardwareModel:(id)a3;
- (void)setWatchSoftwareVersion:(id)a3;
- (void)submitEvent;
@end

@implementation SFWatchAuthenticationEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.WatchAuthentication";
}

- (NSDictionary)eventPayload
{
  v30[16] = *MEMORY[0x1E4F143B8];
  v29[0] = @"authenticationType";
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SFWatchAuthenticationEvent authenticationType](self, "authenticationType"));
  v30[0] = v28;
  v29[1] = @"succeeded";
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SFWatchAuthenticationEvent succeeded](self, "succeeded"));
  v30[1] = v27;
  v29[2] = @"failureReason";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFWatchAuthenticationEvent failureReason](self, "failureReason"));
  v30[2] = v26;
  v29[3] = @"screenOn";
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[SFWatchAuthenticationEvent screenOn](self, "screenOn"));
  v30[3] = v25;
  v29[4] = @"discoveryDuration";
  v3 = NSNumber;
  [(SFWatchAuthenticationEvent *)self discoveryDuration];
  v24 = objc_msgSend(v3, "numberWithDouble:");
  v30[4] = v24;
  v29[5] = @"keyExchangeDuration";
  v4 = NSNumber;
  [(SFWatchAuthenticationEvent *)self keyExchangeDuration];
  v23 = objc_msgSend(v4, "numberWithDouble:");
  v30[5] = v23;
  v29[6] = @"awdlBringUpDuration";
  v5 = NSNumber;
  [(SFWatchAuthenticationEvent *)self awdlBringUpDuration];
  v22 = objc_msgSend(v5, "numberWithDouble:");
  v30[6] = v22;
  v29[7] = @"rangingDuration";
  v6 = NSNumber;
  [(SFWatchAuthenticationEvent *)self rangingDuration];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v30[7] = v7;
  v29[8] = @"peerFoundDuration";
  v8 = NSNumber;
  [(SFWatchAuthenticationEvent *)self peerFoundDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v30[8] = v9;
  v29[9] = @"totalDuration";
  v10 = NSNumber;
  [(SFWatchAuthenticationEvent *)self totalDuration];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v30[9] = v11;
  v29[10] = @"timeSinceBoot";
  v12 = NSNumber;
  [(SFWatchAuthenticationEvent *)self timeSinceBoot];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v30[10] = v13;
  v29[11] = @"timeSinceRemoteUnlocked";
  v14 = NSNumber;
  [(SFWatchAuthenticationEvent *)self timeSinceRemoteUnlocked];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v30[11] = v15;
  v29[12] = @"watchHardwareModel";
  v16 = [(SFWatchAuthenticationEvent *)self watchHardwareModel];
  v30[12] = v16;
  v29[13] = @"watchSoftwareVersion";
  v17 = [(SFWatchAuthenticationEvent *)self watchSoftwareVersion];
  v30[13] = v17;
  v29[14] = @"remoteHardwareModel";
  v18 = [(SFWatchAuthenticationEvent *)self remoteHardwareModel];
  v30[14] = v18;
  v29[15] = @"remoteSoftwareVersion";
  v19 = [(SFWatchAuthenticationEvent *)self remoteSoftwareVersion];
  v30[15] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:16];

  return (NSDictionary *)v20;
}

- (void)submitEvent
{
  id v4 = +[SFWatchAuthenticationEvent eventName];
  v3 = [(SFWatchAuthenticationEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (unsigned)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unsigned int)a3
{
  self->_failureReason = a3;
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (double)discoveryDuration
{
  return self->_discoveryDuration;
}

- (void)setDiscoveryDuration:(double)a3
{
  self->_discoveryDuration = a3;
}

- (double)keyExchangeDuration
{
  return self->_keyExchangeDuration;
}

- (void)setKeyExchangeDuration:(double)a3
{
  self->_keyExchangeDuration = a3;
}

- (double)awdlBringUpDuration
{
  return self->_awdlBringUpDuration;
}

- (void)setAwdlBringUpDuration:(double)a3
{
  self->_awdlBringUpDuration = a3;
}

- (double)rangingDuration
{
  return self->_rangingDuration;
}

- (void)setRangingDuration:(double)a3
{
  self->_rangingDuration = a3;
}

- (double)peerFoundDuration
{
  return self->_peerFoundDuration;
}

- (void)setPeerFoundDuration:(double)a3
{
  self->_peerFoundDuration = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (double)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (void)setTimeSinceBoot:(double)a3
{
  self->_timeSinceBoot = a3;
}

- (double)timeSinceRemoteUnlocked
{
  return self->_timeSinceRemoteUnlocked;
}

- (void)setTimeSinceRemoteUnlocked:(double)a3
{
  self->_timeSinceRemoteUnlocked = a3;
}

- (NSString)watchHardwareModel
{
  return self->_watchHardwareModel;
}

- (void)setWatchHardwareModel:(id)a3
{
}

- (NSString)watchSoftwareVersion
{
  return self->_watchSoftwareVersion;
}

- (void)setWatchSoftwareVersion:(id)a3
{
}

- (NSString)remoteHardwareModel
{
  return self->_remoteHardwareModel;
}

- (void)setRemoteHardwareModel:(id)a3
{
}

- (NSString)remoteSoftwareVersion
{
  return self->_remoteSoftwareVersion;
}

- (void)setRemoteSoftwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_remoteHardwareModel, 0);
  objc_storeStrong((id *)&self->_watchSoftwareVersion, 0);

  objc_storeStrong((id *)&self->_watchHardwareModel, 0);
}

@end