@interface SFPairedUnlockDailyEvent
+ (NSString)eventName;
- (BOOL)phoneAutoUnlockEnabled;
- (NSDictionary)eventPayload;
- (NSString)phoneHardwareModel;
- (NSString)phoneSoftwareVersion;
- (int64_t)failedAttempts;
- (int64_t)passcodeUnlocks;
- (int64_t)successfulAttempts;
- (int64_t)totalAttempts;
- (int64_t)totalUnlocks;
- (void)setFailedAttempts:(int64_t)a3;
- (void)setPasscodeUnlocks:(int64_t)a3;
- (void)setPhoneAutoUnlockEnabled:(BOOL)a3;
- (void)setPhoneHardwareModel:(id)a3;
- (void)setPhoneSoftwareVersion:(id)a3;
- (void)setSuccessfulAttempts:(int64_t)a3;
- (void)setTotalAttempts:(int64_t)a3;
- (void)setTotalUnlocks:(int64_t)a3;
- (void)submitEvent;
@end

@implementation SFPairedUnlockDailyEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.PairedUnlock.Daily";
}

- (NSDictionary)eventPayload
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v17[0] = @"successfulAttempts";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockDailyEvent successfulAttempts](self, "successfulAttempts"));
  v18[0] = v3;
  v17[1] = @"failedAttempts";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockDailyEvent failedAttempts](self, "failedAttempts"));
  v18[1] = v4;
  v17[2] = @"totalAttempts";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockDailyEvent totalAttempts](self, "totalAttempts"));
  v18[2] = v5;
  v17[3] = @"passcodeUnlocks";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockDailyEvent passcodeUnlocks](self, "passcodeUnlocks"));
  v18[3] = v6;
  v17[4] = @"totalUnlocks";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFPairedUnlockDailyEvent totalUnlocks](self, "totalUnlocks"));
  v18[4] = v7;
  v17[5] = @"phoneSoftwareVersion";
  uint64_t v8 = [(SFPairedUnlockDailyEvent *)self phoneSoftwareVersion];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1EF9BDC68;
  }
  v18[5] = v10;
  v17[6] = @"phoneHardwareModel";
  uint64_t v11 = [(SFPairedUnlockDailyEvent *)self phoneHardwareModel];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1EF9BDC68;
  }
  v18[6] = v13;
  v17[7] = @"phoneAutoUnlockEnabled";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SFPairedUnlockDailyEvent phoneAutoUnlockEnabled](self, "phoneAutoUnlockEnabled"));
  v18[7] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:8];

  return (NSDictionary *)v15;
}

- (void)submitEvent
{
  id v4 = +[SFPairedUnlockDailyEvent eventName];
  v3 = [(SFPairedUnlockDailyEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (int64_t)successfulAttempts
{
  return self->_successfulAttempts;
}

- (void)setSuccessfulAttempts:(int64_t)a3
{
  self->_successfulAttempts = a3;
}

- (int64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (void)setFailedAttempts:(int64_t)a3
{
  self->_failedAttempts = a3;
}

- (int64_t)totalAttempts
{
  return self->_totalAttempts;
}

- (void)setTotalAttempts:(int64_t)a3
{
  self->_totalAttempts = a3;
}

- (int64_t)passcodeUnlocks
{
  return self->_passcodeUnlocks;
}

- (void)setPasscodeUnlocks:(int64_t)a3
{
  self->_passcodeUnlocks = a3;
}

- (int64_t)totalUnlocks
{
  return self->_totalUnlocks;
}

- (void)setTotalUnlocks:(int64_t)a3
{
  self->_totalUnlocks = a3;
}

- (BOOL)phoneAutoUnlockEnabled
{
  return self->_phoneAutoUnlockEnabled;
}

- (void)setPhoneAutoUnlockEnabled:(BOOL)a3
{
  self->_phoneAutoUnlockEnabled = a3;
}

- (NSString)phoneHardwareModel
{
  return self->_phoneHardwareModel;
}

- (void)setPhoneHardwareModel:(id)a3
{
}

- (NSString)phoneSoftwareVersion
{
  return self->_phoneSoftwareVersion;
}

- (void)setPhoneSoftwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneSoftwareVersion, 0);

  objc_storeStrong((id *)&self->_phoneHardwareModel, 0);
}

@end