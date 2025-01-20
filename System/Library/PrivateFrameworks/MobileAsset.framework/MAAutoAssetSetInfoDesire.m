@interface MAAutoAssetSetInfoDesire
+ (BOOL)supportsSecureCoding;
- (BOOL)awaitDownloadingOfDiscovered;
- (BOOL)downloadProgressDesired;
- (MAAutoAssetSetInfoDesire)initWithCoder:(id)a3;
- (MAAutoAssetSetPolicy)clientAssetSetPolicy;
- (NSString)desireReason;
- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8;
- (id)summary;
- (int64_t)checkWaitTimeoutSecs;
- (int64_t)lockWaitTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoDesire

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desireReason, 0);
  objc_storeStrong((id *)&self->_clientAssetSetPolicy, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAutoAssetSetInfoDesire)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetSetInfoDesire;
  v5 = [(MAAutoAssetSetInfoDesire *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetSetPolicy"];
    clientAssetSetPolicy = v5->_clientAssetSetPolicy;
    v5->_clientAssetSetPolicy = (MAAutoAssetSetPolicy *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desireReason"];
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v8;

    v5->_awaitDownloadingOfDiscovered = [v4 decodeBoolForKey:@"awaitDownloadingOfDiscovered"];
    v5->_checkWaitTimeoutSecs = [v4 decodeIntegerForKey:@"checkWaitTimeoutSecs"];
    v5->_lockWaitTimeoutSecs = [v4 decodeIntegerForKey:@"lockWaitTimeoutSecs"];
    v5->_downloadProgressDesired = [v4 decodeBoolForKey:@"downloadProgressDesired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(MAAutoAssetSetInfoDesire *)self clientAssetSetPolicy];
  [v6 encodeObject:v4 forKey:@"clientAssetSetPolicy"];

  v5 = [(MAAutoAssetSetInfoDesire *)self desireReason];
  [v6 encodeObject:v5 forKey:@"desireReason"];

  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"), @"awaitDownloadingOfDiscovered");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"), @"checkWaitTimeoutSecs");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"), @"lockWaitTimeoutSecs");
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"), @"downloadProgressDesired");
}

- (id)summary
{
  id v4 = [(MAAutoAssetSetInfoDesire *)self clientAssetSetPolicy];
  if (v4)
  {
  }
  else
  {
    v5 = [(MAAutoAssetSetInfoDesire *)self desireReason];

    if (!v5)
    {
      objc_super v11 = @"byPolicy";
      goto LABEL_13;
    }
  }
  id v6 = [NSString alloc];
  v7 = [(MAAutoAssetSetInfoDesire *)self clientAssetSetPolicy];
  if (v7)
  {
    v2 = [(MAAutoAssetSetInfoDesire *)self clientAssetSetPolicy];
    uint64_t v8 = [v2 summary];
  }
  else
  {
    uint64_t v8 = @"N";
  }
  v9 = [(MAAutoAssetSetInfoDesire *)self desireReason];
  if (v9)
  {
    v10 = [(MAAutoAssetSetInfoDesire *)self desireReason];
    objc_super v11 = (__CFString *)[v6 initWithFormat:@"clientAssetSetPolicy:%@|desireReason:%@", v8, v10];
  }
  else
  {
    objc_super v11 = (__CFString *)[v6 initWithFormat:@"clientAssetSetPolicy:%@|desireReason:%@", v8, @"N"];
  }

  if (v7)
  {
  }
LABEL_13:
  v12 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  v13 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if ([(MAAutoAssetSetInfoDesire *)self checkWaitTimeoutSecs])
  {
    if ([(MAAutoAssetSetInfoDesire *)self checkWaitTimeoutSecs] != -2) {
      goto LABEL_18;
    }
    v14 = @"DEFAULT";
  }
  else
  {
    v14 = @"NO_WAIT";
  }

  v12 = v14;
LABEL_18:
  if (![(MAAutoAssetSetInfoDesire *)self lockWaitTimeoutSecs])
  {
    v15 = @"NO_WAIT";
    goto LABEL_24;
  }
  if ([(MAAutoAssetSetInfoDesire *)self lockWaitTimeoutSecs] == -2)
  {
    v15 = @"DEFAULT";
LABEL_24:

    v13 = v15;
    goto LABEL_25;
  }
  if ([(MAAutoAssetSetInfoDesire *)self lockWaitTimeoutSecs] == -3)
  {
    v15 = @"NO_WAIT_NOT_PERSISTED";
    goto LABEL_24;
  }
LABEL_25:
  if ([(MAAutoAssetSetInfoDesire *)self checkWaitTimeoutSecs] == -101
    && [(MAAutoAssetSetInfoDesire *)self lockWaitTimeoutSecs] == -101)
  {
    v16 = NSString;
    if ([(MAAutoAssetSetInfoDesire *)self awaitDownloadingOfDiscovered]) {
      v17 = @"Y";
    }
    else {
      v17 = @"N";
    }
    if ([(MAAutoAssetSetInfoDesire *)self downloadProgressDesired]) {
      v18 = @"Y";
    }
    else {
      v18 = @"N";
    }
    [v16 stringWithFormat:@"%@|awaitDowload:%@|progressDesired:%@", v11, v17, v18, v28, v29];
  }
  else if ([(MAAutoAssetSetInfoDesire *)self checkWaitTimeoutSecs] == -101)
  {
    v19 = NSString;
    if ([(MAAutoAssetSetInfoDesire *)self awaitDownloadingOfDiscovered]) {
      v20 = @"Y";
    }
    else {
      v20 = @"N";
    }
    if ([(MAAutoAssetSetInfoDesire *)self downloadProgressDesired]) {
      v21 = @"Y";
    }
    else {
      v21 = @"N";
    }
    [v19 stringWithFormat:@"%@|awaitDowload:%@|lockSecs:%@,progressDesired:%@", v11, v20, v13, v21, v29];
  }
  else
  {
    int64_t v22 = [(MAAutoAssetSetInfoDesire *)self lockWaitTimeoutSecs];
    v23 = NSString;
    if ([(MAAutoAssetSetInfoDesire *)self awaitDownloadingOfDiscovered]) {
      v24 = @"Y";
    }
    else {
      v24 = @"N";
    }
    if ([(MAAutoAssetSetInfoDesire *)self downloadProgressDesired]) {
      v25 = @"Y";
    }
    else {
      v25 = @"N";
    }
    if (v22 == -101) {
      [v23 stringWithFormat:@"%@|awaitDowload:%@|checkSecs:%@,progressDesired:%@", v11, v24, v12, v25, v29];
    }
    else {
      [v23 stringWithFormat:@"%@|awaitDowload:%@|checkSecs:%@,lockSecs:%@,progressDesired:%@", v11, v24, v12, v13, v25];
    }
  v26 = };

  return v26;
}

- (int64_t)lockWaitTimeoutSecs
{
  return self->_lockWaitTimeoutSecs;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
}

- (MAAutoAssetSetPolicy)clientAssetSetPolicy
{
  return self->_clientAssetSetPolicy;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (BOOL)downloadProgressDesired
{
  return self->_downloadProgressDesired;
}

- (BOOL)awaitDownloadingOfDiscovered
{
  return self->_awaitDownloadingOfDiscovered;
}

- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetInfoDesire;
  v17 = [(MAAutoAssetSetInfoDesire *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientAssetSetPolicy, a3);
    objc_storeStrong((id *)&v18->_desireReason, a4);
    v18->_awaitDownloadingOfDiscovered = a5;
    v18->_checkWaitTimeoutSecs = a6;
    v18->_lockWaitTimeoutSecs = a7;
    v18->_downloadProgressDesired = a8;
  }

  return v18;
}

@end