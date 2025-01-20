@interface MAAutoAssetPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)interestAcrossTermination;
- (BOOL)lockAcrossOTAUpdate;
- (BOOL)lockAcrossReboot;
- (BOOL)lockAcrossTermination;
- (BOOL)lockInhibitsEmergencyRemoval;
- (BOOL)userInitiated;
- (MAAutoAssetPolicy)init;
- (MAAutoAssetPolicy)initWithCoder:(id)a3;
- (NSDictionary)additionalPolicyControl;
- (id)description;
- (id)newSummaryDictionary;
- (id)summary;
- (int64_t)preventGarbageCollectionSecs;
- (int64_t)unlockAfterUsageSecs;
- (int64_t)waitForNewestSecs;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPolicyControl:(id)a3;
- (void)setInterestAcrossTermination:(BOOL)a3;
- (void)setLockAcrossOTAUpdate:(BOOL)a3;
- (void)setLockAcrossReboot:(BOOL)a3;
- (void)setLockAcrossTermination:(BOOL)a3;
- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3;
- (void)setPreventGarbageCollectionSecs:(int64_t)a3;
- (void)setUnlockAfterUsageSecs:(int64_t)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWaitForNewestSecs:(int64_t)a3;
@end

@implementation MAAutoAssetPolicy

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (MAAutoAssetPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAAutoAssetPolicy;
  v2 = [(MAAutoAssetPolicy *)&v6 init];
  v3 = (MAAutoAssetPolicy *)v2;
  if (v2)
  {
    v2[8] = 0;
    *(_DWORD *)(v2 + 9) = 0;
    v2[13] = 0;
    *((void *)v2 + 2) = -1;
    *((void *)v2 + 3) = 0;
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 5) = 0;
  }
  return v3;
}

- (MAAutoAssetPolicy)initWithCoder:(id)a3
{
  v13[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetPolicy;
  v5 = [(MAAutoAssetPolicy *)&v12 init];
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_waitForNewestSecs = [v4 decodeIntegerForKey:@"waitForNewestSecs"];
    v5->_interestAcrossTermination = [v4 decodeBoolForKey:@"interestAcrossTermination"];
    v5->_lockAcrossTermination = [v4 decodeBoolForKey:@"lockAcrossTermination"];
    v5->_lockAcrossReboot = [v4 decodeBoolForKey:@"lockAcrossReboot"];
    v5->_lockAcrossOTAUpdate = [v4 decodeBoolForKey:@"lockAcrossOTAUpdate"];
    v5->_lockInhibitsEmergencyRemoval = [v4 decodeBoolForKey:@"lockInhibitsEmergencyRemoval"];
    v5->_unlockAfterUsageSecs = [v4 decodeIntegerForKey:@"unlockAfterUsageSecs"];
    v5->_preventGarbageCollectionSecs = [v4 decodeIntegerForKey:@"preventGarbageCollectionSecs"];
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"additionalPolicyControl"];
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy userInitiated](self, "userInitiated"), @"userInitiated");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"), @"waitForNewestSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination"), @"interestAcrossTermination");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination"), @"lockAcrossTermination");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot"), @"lockAcrossReboot");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate"), @"lockAcrossOTAUpdate");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"), @"lockInhibitsEmergencyRemoval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"), @"unlockAfterUsageSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"), @"preventGarbageCollectionSecs");
  id v5 = [(MAAutoAssetPolicy *)self additionalPolicyControl];
  [v4 encodeObject:v5 forKey:@"additionalPolicyControl"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [(MAAutoAssetPolicy *)self additionalPolicyControl];

  if (v3)
  {
    id v4 = NSString;
    id v5 = [(MAAutoAssetPolicy *)self summary];
    objc_super v6 = [(MAAutoAssetPolicy *)self additionalPolicyControl];
    v7 = [v4 stringWithFormat:@"%@|additional:\n%@", v5, v6];
  }
  else
  {
    v7 = [(MAAutoAssetPolicy *)self summary];
  }
  return v7;
}

- (id)summary
{
  v3 = [(MAAutoAssetPolicy *)self additionalPolicyControl];
  id v4 = @"(w/additional)";
  if (!v3) {
    id v4 = &stru_1F0A75970;
  }
  id v5 = v4;

  if ([(MAAutoAssetPolicy *)self interestAcrossTermination]
    && [(MAAutoAssetPolicy *)self lockAcrossTermination]
    && [(MAAutoAssetPolicy *)self lockAcrossReboot]
    && [(MAAutoAssetPolicy *)self lockAcrossOTAUpdate]
    && [(MAAutoAssetPolicy *)self lockInhibitsEmergencyRemoval])
  {
    objc_super v6 = @"allOtherBool:Y";
  }
  else if ([(MAAutoAssetPolicy *)self interestAcrossTermination] {
         || [(MAAutoAssetPolicy *)self lockAcrossTermination]
  }
         || [(MAAutoAssetPolicy *)self lockAcrossReboot]
         || [(MAAutoAssetPolicy *)self lockAcrossOTAUpdate]
         || [(MAAutoAssetPolicy *)self lockInhibitsEmergencyRemoval])
  {
    id v7 = [NSString alloc];
    if ([(MAAutoAssetPolicy *)self interestAcrossTermination]) {
      v8 = @"Y";
    }
    else {
      v8 = @"N";
    }
    if ([(MAAutoAssetPolicy *)self lockAcrossTermination]) {
      uint64_t v9 = @"Y";
    }
    else {
      uint64_t v9 = @"N";
    }
    if ([(MAAutoAssetPolicy *)self lockAcrossReboot]) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
    if ([(MAAutoAssetPolicy *)self lockAcrossOTAUpdate]) {
      v11 = @"Y";
    }
    else {
      v11 = @"N";
    }
    if ([(MAAutoAssetPolicy *)self lockInhibitsEmergencyRemoval]) {
      objc_super v12 = @"Y";
    }
    else {
      objc_super v12 = @"N";
    }
    objc_super v6 = (__CFString *)[v7 initWithFormat:@"interestAcrossTerm:%@|lock(AcrossTerm:%@|AcrossReboot:%@|AcrossOTA:%@|InhibitsRemoval:%@)", v8, v9, v10, v11, v12];
  }
  else
  {
    objc_super v6 = @"allOtherBool:N";
  }
  v13 = NSString;
  if ([(MAAutoAssetPolicy *)self userInitiated]) {
    v14 = @"Y";
  }
  else {
    v14 = @"N";
  }
  v15 = [v13 stringWithFormat:@"user:%@|waitNewestSecs:%ld|%@|unlockAfterSecs:%ld|preventGCSecs:%ld%@", v14, -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"), v6, -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"), -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"), v5];

  return v15;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MAAutoAssetPolicy *)self userInitiated]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 setSafeObject:v4 forKey:@"userInitiated"];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"));
  [v3 setSafeObject:v5 forKey:@"waitForNewestSecs"];

  if ([(MAAutoAssetPolicy *)self interestAcrossTermination]) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  [v3 setSafeObject:v6 forKey:@"interestAcrossTermination"];
  if ([(MAAutoAssetPolicy *)self lockAcrossTermination]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v3 setSafeObject:v7 forKey:@"lockAcrossTermination"];
  if ([(MAAutoAssetPolicy *)self lockAcrossReboot]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 setSafeObject:v8 forKey:@"lockAcrossReboot"];
  if ([(MAAutoAssetPolicy *)self lockAcrossOTAUpdate]) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"lockAcrossOTAUpdate"];
  if ([(MAAutoAssetPolicy *)self lockInhibitsEmergencyRemoval]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 setSafeObject:v10 forKey:@"lockInhibitsEmergencyRemoval"];
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"));
  [v3 setSafeObject:v11 forKey:@"unlockAfterUsageSecs"];

  objc_super v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"));
  [v3 setSafeObject:v12 forKey:@"preventGarbageCollectionSecs"];

  v13 = [(MAAutoAssetPolicy *)self additionalPolicyControl];
  if (v13) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v3 setSafeObject:v14 forKey:@"additionalPolicyControl"];

  return v3;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (int64_t)waitForNewestSecs
{
  return self->_waitForNewestSecs;
}

- (void)setWaitForNewestSecs:(int64_t)a3
{
  self->_waitForNewestSecs = a3;
}

- (BOOL)interestAcrossTermination
{
  return self->_interestAcrossTermination;
}

- (void)setInterestAcrossTermination:(BOOL)a3
{
  self->_interestAcrossTermination = a3;
}

- (BOOL)lockAcrossTermination
{
  return self->_lockAcrossTermination;
}

- (void)setLockAcrossTermination:(BOOL)a3
{
  self->_lockAcrossTermination = a3;
}

- (BOOL)lockAcrossReboot
{
  return self->_lockAcrossReboot;
}

- (void)setLockAcrossReboot:(BOOL)a3
{
  self->_lockAcrossReboot = a3;
}

- (BOOL)lockAcrossOTAUpdate
{
  return self->_lockAcrossOTAUpdate;
}

- (void)setLockAcrossOTAUpdate:(BOOL)a3
{
  self->_lockAcrossOTAUpdate = a3;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (int64_t)unlockAfterUsageSecs
{
  return self->_unlockAfterUsageSecs;
}

- (void)setUnlockAfterUsageSecs:(int64_t)a3
{
  self->_unlockAfterUsageSecs = a3;
}

- (int64_t)preventGarbageCollectionSecs
{
  return self->_preventGarbageCollectionSecs;
}

- (void)setPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_preventGarbageCollectionSecs = a3;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
}

- (void)setAdditionalPolicyControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end