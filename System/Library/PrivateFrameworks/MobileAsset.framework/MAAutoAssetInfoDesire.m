@interface MAAutoAssetInfoDesire
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadProgressDesired;
- (MAAutoAssetInfoDesire)initWithCoder:(id)a3;
- (MAAutoAssetInfoDesire)initWithDesiredCategory:(id)a3 forClientAssetPolicy:(id)a4 reasonDesired:(id)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8;
- (MAAutoAssetPolicy)clientAssetPolicy;
- (NSString)desireReason;
- (NSString)updateCategoryDesiredByClient;
- (id)summary;
- (int64_t)checkWaitTimeoutSecs;
- (int64_t)lockWaitTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoDesire

- (MAAutoAssetInfoDesire)initWithDesiredCategory:(id)a3 forClientAssetPolicy:(id)a4 reasonDesired:(id)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MAAutoAssetInfoDesire;
  v18 = [(MAAutoAssetInfoDesire *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_updateCategoryDesiredByClient, a3);
    objc_storeStrong((id *)&v19->_clientAssetPolicy, a4);
    objc_storeStrong((id *)&v19->_desireReason, a5);
    v19->_checkWaitTimeoutSecs = a6;
    v19->_lockWaitTimeoutSecs = a7;
    v19->_downloadProgressDesired = a8;
  }

  return v19;
}

- (MAAutoAssetInfoDesire)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAAutoAssetInfoDesire;
  v5 = [(MAAutoAssetInfoDesire *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetPolicy"];
    clientAssetPolicy = v5->_clientAssetPolicy;
    v5->_clientAssetPolicy = (MAAutoAssetPolicy *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desireReason"];
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v10;

    v5->_checkWaitTimeoutSecs = [v4 decodeIntegerForKey:@"checkWaitTimeoutSecs"];
    v5->_lockWaitTimeoutSecs = [v4 decodeIntegerForKey:@"lockWaitTimeoutSecs"];
    v5->_downloadProgressDesired = [v4 decodeBoolForKey:@"downloadProgressDesired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MAAutoAssetInfoDesire *)self updateCategoryDesiredByClient];
  [v7 encodeObject:v4 forKey:@"updateCategoryDesiredByClient"];

  v5 = [(MAAutoAssetInfoDesire *)self clientAssetPolicy];
  [v7 encodeObject:v5 forKey:@"clientAssetPolicy"];

  uint64_t v6 = [(MAAutoAssetInfoDesire *)self desireReason];
  [v7 encodeObject:v6 forKey:@"desireReason"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"), @"checkWaitTimeoutSecs");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"), @"lockWaitTimeoutSecs");
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"), @"downloadProgressDesired");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F0A75970];
  id v4 = [(MAAutoAssetInfoDesire *)self updateCategoryDesiredByClient];
  if (v4
    || ([(MAAutoAssetInfoDesire *)self clientAssetPolicy],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v14 = [(MAAutoAssetInfoDesire *)self desireReason];

    if (!v14)
    {
      [v3 appendString:@"byPolicy"];
      goto LABEL_17;
    }
  }
  v5 = [(MAAutoAssetInfoDesire *)self updateCategoryDesiredByClient];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(MAAutoAssetInfoDesire *)self clientAssetPolicy];

    if (!v6)
    {
      objc_super v13 = [(MAAutoAssetInfoDesire *)self desireReason];
      [v3 appendString:v13];
      goto LABEL_16;
    }
  }
  id v7 = [(MAAutoAssetInfoDesire *)self updateCategoryDesiredByClient];

  if (v7)
  {
    uint64_t v8 = [(MAAutoAssetInfoDesire *)self updateCategoryDesiredByClient];
    [v3 appendFormat:@"categ:%@", v8];
  }
  v9 = [(MAAutoAssetInfoDesire *)self clientAssetPolicy];

  if (v9)
  {
    uint64_t v10 = [(MAAutoAssetInfoDesire *)self clientAssetPolicy];
    v11 = [v10 summary];
    [v3 appendFormat:@"policy:%@", v11];
  }
  v12 = [(MAAutoAssetInfoDesire *)self desireReason];

  if (v12)
  {
    objc_super v13 = [(MAAutoAssetInfoDesire *)self desireReason];
    [v3 appendFormat:@"|%@", v13];
LABEL_16:
  }
LABEL_17:
  id v15 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  id v16 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if ([(MAAutoAssetInfoDesire *)self checkWaitTimeoutSecs])
  {
    if ([(MAAutoAssetInfoDesire *)self checkWaitTimeoutSecs] != -2) {
      goto LABEL_22;
    }
    id v17 = @"DEFAULT";
  }
  else
  {
    id v17 = @"NO_WAIT";
  }

  id v15 = v17;
LABEL_22:
  if ([(MAAutoAssetInfoDesire *)self lockWaitTimeoutSecs])
  {
    if ([(MAAutoAssetInfoDesire *)self lockWaitTimeoutSecs] != -2) {
      goto LABEL_27;
    }
    v18 = @"DEFAULT";
  }
  else
  {
    v18 = @"NO_WAIT";
  }

  id v16 = v18;
LABEL_27:
  v19 = NSString;
  BOOL v20 = [(MAAutoAssetInfoDesire *)self downloadProgressDesired];
  objc_super v21 = @"N";
  if (v20) {
    objc_super v21 = @"Y";
  }
  v22 = [v19 stringWithFormat:@"%@|checkSecs:%@,lockSecs:%@,prog:%@", v3, v15, v16, v21];

  return v22;
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetPolicy)clientAssetPolicy
{
  return self->_clientAssetPolicy;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (int64_t)lockWaitTimeoutSecs
{
  return self->_lockWaitTimeoutSecs;
}

- (BOOL)downloadProgressDesired
{
  return self->_downloadProgressDesired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desireReason, 0);
  objc_storeStrong((id *)&self->_clientAssetPolicy, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
}

@end