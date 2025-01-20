@interface EPDynamicTransactionContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)notUnrollable;
- (BOOL)persistWhilePending;
- (BOOL)resumeEnabled;
- (EPDynamicTransactionContainer)initWithCoder:(id)a3;
- (EPRoutingSlip)routingSlip;
- (EPRoutingSlipEntry)entry;
- (NSDate)transactionStartTimestamp;
- (NSObject)userInfo;
- (NSString)operationType;
- (NSUUID)targetPairingID;
- (id)description;
- (id)didEnd;
- (id)transactionName;
- (id)willBegin;
- (unint64_t)runningStatusCode;
- (void)encodeWithCoder:(id)a3;
- (void)setDidEnd:(id)a3;
- (void)setEntry:(id)a3;
- (void)setNotUnrollable:(BOOL)a3;
- (void)setOperationType:(id)a3;
- (void)setPersistWhilePending:(BOOL)a3;
- (void)setResumeEnabled:(BOOL)a3;
- (void)setRunningStatusCode:(unint64_t)a3;
- (void)setTargetPairingID:(id)a3;
- (void)setTransactionStartTimestamp:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setWillBegin:(id)a3;
@end

@implementation EPDynamicTransactionContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(EPDynamicTransactionContainer *)self routingSlip];
  [v5 encodeObject:v4 forKey:@"routingSlip"];

  [v5 encodeInteger:self->_runningStatusCode forKey:@"runningStatusCode"];
  [v5 encodeObject:self->_operationType forKey:@"operationType"];
  [v5 encodeObject:self->_targetPairingID forKey:@"targetPairingID"];
  [v5 encodeObject:self->_transactionStartTimestamp forKey:@"transactionStartTimestamp"];
}

- (EPDynamicTransactionContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPDynamicTransactionContainer *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingSlip"];
    routingSlip = v5->_routingSlip;
    v5->_routingSlip = (EPRoutingSlip *)v6;

    v5->_runningStatusCode = (unint64_t)[v4 decodeIntegerForKey:@"runningStatusCode"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationType"];
    operationType = v5->_operationType;
    v5->_operationType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetPairingID"];
    targetPairingID = v5->_targetPairingID;
    v5->_targetPairingID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionStartTimestamp"];
    transactionStartTimestamp = v5->_transactionStartTimestamp;
    v5->_transactionStartTimestamp = (NSDate *)v12;
  }
  return v5;
}

- (id)transactionName
{
  v2 = [(EPDynamicTransactionContainer *)self routingSlip];
  v3 = [v2 currentEntry];
  id v4 = [v3 printableName];

  return v4;
}

- (EPRoutingSlip)routingSlip
{
  routingSlip = self->_routingSlip;
  if (!routingSlip)
  {
    if (self->_entry)
    {
      id v4 = [EPRoutingSlip alloc];
      entry = self->_entry;
      id v5 = +[NSArray arrayWithObjects:&entry count:1];
      uint64_t v6 = [(EPRoutingSlip *)v4 initWithRoutingSlipEntries:v5];
      v7 = self->_routingSlip;
      self->_routingSlip = v6;

      [(EPRoutingSlip *)self->_routingSlip setPersistWhilePending:self->_persistWhilePending];
      [(EPRoutingSlip *)self->_routingSlip setNotUnrollable:self->_notUnrollable];
      [(EPRoutingSlip *)self->_routingSlip setResumeEnabled:self->_resumeEnabled];
      routingSlip = self->_routingSlip;
    }
    else
    {
      routingSlip = 0;
    }
  }

  return routingSlip;
}

- (BOOL)persistWhilePending
{
  routingSlip = self->_routingSlip;
  if (routingSlip) {
    LOBYTE(v4) = [(EPRoutingSlip *)routingSlip persistWhilePending];
  }
  else {
    return self->_persistWhilePending;
  }
  return v4;
}

- (BOOL)notUnrollable
{
  routingSlip = self->_routingSlip;
  if (routingSlip) {
    LOBYTE(v4) = [(EPRoutingSlip *)routingSlip notUnrollable];
  }
  else {
    return self->_notUnrollable;
  }
  return v4;
}

- (BOOL)resumeEnabled
{
  routingSlip = self->_routingSlip;
  if (routingSlip) {
    LOBYTE(v4) = [(EPRoutingSlip *)routingSlip resumeEnabled];
  }
  else {
    return self->_resumeEnabled;
  }
  return v4;
}

- (void)setPersistWhilePending:(BOOL)a3
{
  if (self->_routingSlip) {
    [(EPRoutingSlip *)self->_routingSlip setPersistWhilePending:a3];
  }
  else {
    self->_persistWhilePending = a3;
  }
}

- (void)setNotUnrollable:(BOOL)a3
{
  if (self->_routingSlip) {
    [(EPRoutingSlip *)self->_routingSlip setNotUnrollable:a3];
  }
  else {
    self->_notUnrollable = a3;
  }
}

- (void)setResumeEnabled:(BOOL)a3
{
  if (self->_routingSlip) {
    [(EPRoutingSlip *)self->_routingSlip setResumeEnabled:a3];
  }
  else {
    self->_resumeEnabled = a3;
  }
}

- (id)description
{
  v3 = [(EPDynamicTransactionContainer *)self transactionName];
  BOOL v4 = +[NSString stringWithFormat:@"EPDynamicTransactionContainer %@: %@ [%@]", v3, self->_routingSlip, self->_transactionStartTimestamp];

  return v4;
}

- (EPRoutingSlipEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (unint64_t)runningStatusCode
{
  return self->_runningStatusCode;
}

- (void)setRunningStatusCode:(unint64_t)a3
{
  self->_runningStatusCode = a3;
}

- (NSObject)userInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInfo);

  return WeakRetained;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (NSUUID)targetPairingID
{
  return self->_targetPairingID;
}

- (void)setTargetPairingID:(id)a3
{
}

- (id)willBegin
{
  return self->_willBegin;
}

- (void)setWillBegin:(id)a3
{
}

- (id)didEnd
{
  return self->_didEnd;
}

- (void)setDidEnd:(id)a3
{
}

- (NSDate)transactionStartTimestamp
{
  return self->_transactionStartTimestamp;
}

- (void)setTransactionStartTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStartTimestamp, 0);
  objc_storeStrong(&self->_didEnd, 0);
  objc_storeStrong(&self->_willBegin, 0);
  objc_storeStrong((id *)&self->_targetPairingID, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_destroyWeak((id *)&self->_userInfo);
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_routingSlip, 0);
}

@end