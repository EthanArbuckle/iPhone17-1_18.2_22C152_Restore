@interface PSYSyncSessionActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinishedSending;
- (BOOL)sawADropout;
- (NSError)error;
- (PSYActivityInfo)activityInfo;
- (PSYSyncSessionActivity)initWithActivityInfo:(id)a3 progress:(double)a4 error:(id)a5 state:(unint64_t)a6 finishedSending:(BOOL)a7 interruptionCount:(int64_t)a8 startDropoutCount:(unint64_t)a9 sawADropout:(BOOL)a10;
- (PSYSyncSessionActivity)initWithCoder:(id)a3;
- (double)activityProgress;
- (id)syncSessionActivityByUpdatingProgress:(double)a3;
- (int64_t)interruptionCount;
- (unint64_t)activityState;
- (unint64_t)hash;
- (unint64_t)startDropoutCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSYSyncSessionActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)syncSessionActivityByUpdatingProgress:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_sawADropout;
  v6 = (void *)[v5 initWithActivityInfo:self->_activityInfo progress:self->_error error:self->_activityState state:self->_finishedSending finishedSending:self->_interruptionCount interruptionCount:self->_startDropoutCount startDropoutCount:a3 sawADropout:v8];

  return v6;
}

- (PSYSyncSessionActivity)initWithActivityInfo:(id)a3 progress:(double)a4 error:(id)a5 state:(unint64_t)a6 finishedSending:(BOOL)a7 interruptionCount:(int64_t)a8 startDropoutCount:(unint64_t)a9 sawADropout:(BOOL)a10
{
  id v17 = a3;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PSYSyncSessionActivity;
  v19 = [(PSYSyncSessionActivity *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_activityInfo, a3);
    v20->_activityProgress = a4;
    objc_storeStrong((id *)&v20->_error, a5);
    v20->_activityState = a6;
    v20->_interruptionCount = a8;
    v20->_startDropoutCount = a9;
    v20->_sawADropout = a10;
  }

  return v20;
}

- (PSYSyncSessionActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSYSyncSessionActivity;
  id v5 = [(PSYSyncSessionActivity *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityInfo"];
    activityInfo = v5->_activityInfo;
    v5->_activityInfo = (PSYActivityInfo *)v6;

    [v4 decodeDoubleForKey:@"activityProgress"];
    v5->_activityProgress = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v9;

    v5->_activityState = [v4 decodeIntegerForKey:@"activityState"];
    v5->_finishedSending = [v4 decodeBoolForKey:@"finishedSending"];
    v5->_interruptionCount = [v4 decodeIntegerForKey:@"interruptionCount"];
    v5->_startDropoutCount = [v4 decodeInt64ForKey:@"startDropoutCount"];
    v5->_sawADropout = [v4 decodeBoolForKey:@"sawADropout"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activityInfo = self->_activityInfo;
  id v5 = a3;
  [v5 encodeObject:activityInfo forKey:@"activityInfo"];
  [v5 encodeDouble:@"activityProgress" forKey:self->_activityProgress];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeInteger:self->_activityState forKey:@"activityState"];
  [v5 encodeBool:self->_finishedSending forKey:@"finishedSending"];
  [v5 encodeInteger:self->_interruptionCount forKey:@"interruptionCount"];
  [v5 encodeInt64:self->_startDropoutCount forKey:@"startDropoutCount"];
  [v5 encodeBool:self->_sawADropout forKey:@"sawADropout"];
}

- (unint64_t)hash
{
  v2 = [(PSYActivityInfo *)self->_activityInfo label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSYSyncSessionActivity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = v5->_activityInfo == self->_activityInfo
        && v5->_error == self->_error
        && v5->_activityState == self->_activityState
        && v5->_finishedSending == self->_finishedSending
        && vabdd_f64(v5->_activityProgress, self->_activityProgress) < 0.00000011920929
        && v5->_interruptionCount == self->_interruptionCount
        && v5->_startDropoutCount == self->_startDropoutCount
        && v5->_sawADropout == self->_sawADropout;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (PSYActivityInfo)activityInfo
{
  return self->_activityInfo;
}

- (double)activityProgress
{
  return self->_activityProgress;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFinishedSending
{
  return self->_finishedSending;
}

- (unint64_t)activityState
{
  return self->_activityState;
}

- (int64_t)interruptionCount
{
  return self->_interruptionCount;
}

- (unint64_t)startDropoutCount
{
  return self->_startDropoutCount;
}

- (BOOL)sawADropout
{
  return self->_sawADropout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_activityInfo, 0);
}

@end