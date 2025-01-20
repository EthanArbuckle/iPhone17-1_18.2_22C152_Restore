@interface SFPairedUnlockEvent
+ (NSString)eventName;
- (BOOL)canRelock;
- (BOOL)phoneAutoUnlockEnabled;
- (BOOL)relockedWatch;
- (BOOL)retriedWithEscrowRecord;
- (BOOL)succeeded;
- (BOOL)usingEscrowRecord;
- (NSDictionary)eventPayload;
- (NSString)bannerDismissReason;
- (NSString)watchHardwareModel;
- (NSString)watchSoftwareVersion;
- (int64_t)bannerDismissalCount;
- (int64_t)phoneState;
- (unsigned)attemptHourLocal;
- (unsigned)confirmationDuration;
- (unsigned)failureReason;
- (unsigned)keyExchangeDuration;
- (unsigned)pillDelay;
- (unsigned)totalUnlockDuration;
- (unsigned)totalUnlockProcessDuration;
- (void)setAttemptHourLocal:(unsigned __int16)a3;
- (void)setBannerDismissReason:(id)a3;
- (void)setBannerDismissalCount:(int64_t)a3;
- (void)setCanRelock:(BOOL)a3;
- (void)setConfirmationDuration:(unsigned int)a3;
- (void)setFailureReason:(unsigned __int16)a3;
- (void)setKeyExchangeDuration:(unsigned int)a3;
- (void)setPhoneAutoUnlockEnabled:(BOOL)a3;
- (void)setPhoneState:(int64_t)a3;
- (void)setPillDelay:(unsigned int)a3;
- (void)setRelockedWatch:(BOOL)a3;
- (void)setRetriedWithEscrowRecord:(BOOL)a3;
- (void)setSucceeded:(BOOL)a3;
- (void)setTotalUnlockDuration:(unsigned int)a3;
- (void)setTotalUnlockProcessDuration:(unsigned int)a3;
- (void)setUsingEscrowRecord:(BOOL)a3;
- (void)setWatchHardwareModel:(id)a3;
- (void)setWatchSoftwareVersion:(id)a3;
- (void)submitEvent;
@end

@implementation SFPairedUnlockEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.PairedUnlock.PhoneAttempt";
}

- (NSDictionary)eventPayload
{
  v26[16] = *MEMORY[0x1E4F143B8];
  v25[0] = @"succeeded";
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent succeeded](self, "succeeded"));
  v26[0] = v24;
  v25[1] = @"failureReason";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[SFPairedUnlockEvent failureReason](self, "failureReason"));
  v26[1] = v23;
  v25[2] = @"attemptHourLocal";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[SFPairedUnlockEvent attemptHourLocal](self, "attemptHourLocal"));
  v26[2] = v22;
  v25[3] = @"phoneAutoUnlockEnabled";
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent phoneAutoUnlockEnabled](self, "phoneAutoUnlockEnabled"));
  v26[3] = v21;
  v25[4] = @"canRelock";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent canRelock](self, "canRelock"));
  v26[4] = v20;
  v25[5] = @"relockedWatch";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent relockedWatch](self, "relockedWatch"));
  v26[5] = v19;
  v25[6] = @"phoneState";
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockEvent phoneState](self, "phoneState"));
  v26[6] = v18;
  v25[7] = @"usingEscrowRecord";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent usingEscrowRecord](self, "usingEscrowRecord"));
  v26[7] = v3;
  v25[8] = @"retriedWithEscrowRecord";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockEvent retriedWithEscrowRecord](self, "retriedWithEscrowRecord"));
  v26[8] = v4;
  v25[9] = @"watchSoftwareVersion";
  uint64_t v5 = [(SFPairedUnlockEvent *)self watchSoftwareVersion];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EF9BDC68;
  }
  v26[9] = v7;
  v25[10] = @"watchHardwareModel";
  uint64_t v8 = [(SFPairedUnlockEvent *)self watchHardwareModel];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1EF9BDC68;
  }
  v26[10] = v10;
  v25[11] = @"keyExchangeDurationMs";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockEvent keyExchangeDuration](self, "keyExchangeDuration"));
  v26[11] = v11;
  v25[12] = @"pillDelayMs";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockEvent pillDelay](self, "pillDelay"));
  v26[12] = v12;
  v25[13] = @"confirmationDurationMs";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockEvent confirmationDuration](self, "confirmationDuration"));
  v26[13] = v13;
  v25[14] = @"totalUnlockProcessDurationMs";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockEvent totalUnlockProcessDuration](self, "totalUnlockProcessDuration"));
  v26[14] = v14;
  v25[15] = @"totalUnlockDurationMs";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFPairedUnlockEvent totalUnlockDuration](self, "totalUnlockDuration"));
  v26[15] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:16];

  return (NSDictionary *)v16;
}

- (void)submitEvent
{
  id v4 = +[SFPairedUnlockEvent eventName];
  v3 = [(SFPairedUnlockEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
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

- (void)setFailureReason:(unsigned __int16)a3
{
  self->_failureReason = a3;
}

- (unsigned)attemptHourLocal
{
  return self->_attemptHourLocal;
}

- (void)setAttemptHourLocal:(unsigned __int16)a3
{
  self->_attemptHourLocal = a3;
}

- (BOOL)phoneAutoUnlockEnabled
{
  return self->_phoneAutoUnlockEnabled;
}

- (void)setPhoneAutoUnlockEnabled:(BOOL)a3
{
  self->_phoneAutoUnlockEnabled = a3;
}

- (BOOL)canRelock
{
  return self->_canRelock;
}

- (void)setCanRelock:(BOOL)a3
{
  self->_canRelock = a3;
}

- (BOOL)relockedWatch
{
  return self->_relockedWatch;
}

- (void)setRelockedWatch:(BOOL)a3
{
  self->_relockedWatch = a3;
}

- (NSString)bannerDismissReason
{
  return self->_bannerDismissReason;
}

- (void)setBannerDismissReason:(id)a3
{
  self->_bannerDismissReason = (NSString *)a3;
}

- (int64_t)bannerDismissalCount
{
  return self->_bannerDismissalCount;
}

- (void)setBannerDismissalCount:(int64_t)a3
{
  self->_bannerDismissalCount = a3;
}

- (int64_t)phoneState
{
  return self->_phoneState;
}

- (void)setPhoneState:(int64_t)a3
{
  self->_phoneState = a3;
}

- (BOOL)usingEscrowRecord
{
  return self->_usingEscrowRecord;
}

- (void)setUsingEscrowRecord:(BOOL)a3
{
  self->_usingEscrowRecord = a3;
}

- (BOOL)retriedWithEscrowRecord
{
  return self->_retriedWithEscrowRecord;
}

- (void)setRetriedWithEscrowRecord:(BOOL)a3
{
  self->_retriedWithEscrowRecord = a3;
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

- (unsigned)keyExchangeDuration
{
  return self->_keyExchangeDuration;
}

- (void)setKeyExchangeDuration:(unsigned int)a3
{
  self->_keyExchangeDuration = a3;
}

- (unsigned)pillDelay
{
  return self->_pillDelay;
}

- (void)setPillDelay:(unsigned int)a3
{
  self->_pillDelay = a3;
}

- (unsigned)confirmationDuration
{
  return self->_confirmationDuration;
}

- (void)setConfirmationDuration:(unsigned int)a3
{
  self->_confirmationDuration = a3;
}

- (unsigned)totalUnlockProcessDuration
{
  return self->_totalUnlockProcessDuration;
}

- (void)setTotalUnlockProcessDuration:(unsigned int)a3
{
  self->_totalUnlockProcessDuration = a3;
}

- (unsigned)totalUnlockDuration
{
  return self->_totalUnlockDuration;
}

- (void)setTotalUnlockDuration:(unsigned int)a3
{
  self->_totalUnlockDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchSoftwareVersion, 0);

  objc_storeStrong((id *)&self->_watchHardwareModel, 0);
}

@end