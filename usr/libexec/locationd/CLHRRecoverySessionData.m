@interface CLHRRecoverySessionData
+ (BOOL)supportsSecureCoding;
- (CLHRRecoverySessionData)initWithCoder:(id)a3;
- (CLHRRecoverySessionData)initWithHRRecoverySession:(const HRRecoverySession *)a3;
- (CLHRRecoverySessionData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17;
- (HRRecoverySession)recoverySession;
- (NSUUID)workoutSessionId;
- (double)activityEndTime;
- (double)hrMax;
- (double)hrMinAdjusted;
- (double)hrRecovery;
- (double)hrRecoveryReference;
- (double)lambda;
- (double)peakHR;
- (double)recoveryOnsetTime;
- (double)sessionHrRecovery;
- (double)startTime;
- (double)steadyStateHR;
- (id)description;
- (int)status;
- (int)workoutType;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLHRRecoverySessionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHRRecoverySessionData;
  [(CLHRRecoverySessionData *)&v3 dealloc];
}

- (CLHRRecoverySessionData)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CLHRRecoverySessionData;
  v4 = [(CLHRRecoverySessionData *)&v17 init];
  if (v4)
  {
    v4->_recordId = (unint64_t)[a3 decodeInt64ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"activityEndTime"];
    v4->_activityEndTime = v6;
    v4->_workoutSessionId = (NSUUID *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLHRRecoverySessionCodingKeyWorkoutSessionId"];
    v4->_workoutType = [a3 decodeIntForKey:@"workoutType"];
    [a3 decodeDoubleForKey:@"hrRecovery"];
    v4->_hrRecovery = v7;
    [a3 decodeDoubleForKey:@"lambda"];
    v4->_lambda = v8;
    [a3 decodeDoubleForKey:@"hrMax"];
    v4->_hrMax = v9;
    [a3 decodeDoubleForKey:@"hrMinAdjusted"];
    v4->_hrMinAdjusted = v10;
    [a3 decodeDoubleForKey:@"recoveryOnsetTime"];
    v4->_recoveryOnsetTime = v11;
    [a3 decodeDoubleForKey:@"steadyStateHR"];
    v4->_steadyStateHR = v12;
    v4->_status = [a3 decodeIntForKey:@"status"];
    [a3 decodeDoubleForKey:@"sessionHrRecovery"];
    v4->_sessionHrRecovery = v13;
    [a3 decodeDoubleForKey:@"peakHR"];
    v4->_peakHR = v14;
    [a3 decodeDoubleForKey:@"hrRecoveryReference"];
    v4->_hrRecoveryReference = v15;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_recordId forKey:@"recordId"];
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeDouble:@"activityEndTime" forKey:self->_activityEndTime];
  [a3 encodeObject:self->_workoutSessionId forKey:@"kCLHRRecoverySessionCodingKeyWorkoutSessionId"];
  [a3 encodeInt:self->_workoutType forKey:@"workoutType"];
  [a3 encodeDouble:@"hrRecovery" forKey:self->_hrRecovery];
  [a3 encodeDouble:@"lambda" forKey:self->_lambda];
  [a3 encodeDouble:@"hrMax" forKey:self->_hrMax];
  [a3 encodeDouble:@"hrMinAdjusted" forKey:self->_hrMinAdjusted];
  [a3 encodeDouble:@"recoveryOnsetTime" forKey:self->_recoveryOnsetTime];
  [a3 encodeDouble:@"steadyStateHR" forKey:self->_steadyStateHR];
  [a3 encodeInt:self->_status forKey:@"status"];
  [a3 encodeDouble:@"sessionHrRecovery" forKey:self->_sessionHrRecovery];
  [a3 encodeDouble:@"peakHR" forKey:self->_peakHR];
  double hrRecoveryReference = self->_hrRecoveryReference;

  [a3 encodeDouble:@"hrRecoveryReference" forKey:hrRecoveryReference];
}

- (CLHRRecoverySessionData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17
{
  v32.receiver = self;
  v32.super_class = (Class)CLHRRecoverySessionData;
  v29 = [(CLHRRecoverySessionData *)&v32 init];
  v30 = v29;
  if (v29)
  {
    v29->_recordId = a3;
    v29->_startTime = a4;
    v29->_activityEndTime = a5;
    v29->_workoutSessionId = (NSUUID *)a6;
    v30->_hrRecovery = a8;
    v30->_lambda = a9;
    v30->_hrMax = a10;
    v30->_hrMinAdjusted = a11;
    v30->_recoveryOnsetTime = a12;
    v30->_steadyStateHR = a13;
    v30->_workoutType = a7;
    v30->_status = a14;
    v30->_sessionHrRecovery = a15;
    v30->_peakHR = a16;
    v30->_double hrRecoveryReference = a17;
  }
  return v30;
}

- (CLHRRecoverySessionData)initWithHRRecoverySession:(const HRRecoverySession *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLHRRecoverySessionData;
  v4 = [(CLHRRecoverySessionData *)&v9 init];
  if (v4)
  {
    double v5 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:a3->var4];
    v4->_recordId = a3->var0;
    v4->_startTime = a3->var1;
    v4->_activityEndTime = a3->var2;
    v4->_workoutSessionId = v5;
    int64_t var5 = a3->var5;
    v4->_hrRecovery = a3->var6;
    v4->_lambda = a3->var7;
    v4->_hrMax = a3->var8;
    v4->_hrMinAdjusted = a3->var9;
    v4->_recoveryOnsetTime = a3->var10;
    v4->_steadyStateHR = a3->var11;
    int var12 = a3->var12;
    v4->_workoutType = var5;
    v4->_status = var12;
    v4->_sessionHrRecovery = a3->var13;
    v4->_peakHR = a3->var14;
    v4->_double hrRecoveryReference = a3->var15;
  }
  return v4;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(CLHRRecoverySessionData *)self recordId];
  [(CLHRRecoverySessionData *)self startTime];
  uint64_t v30 = v6;
  [(CLHRRecoverySessionData *)self activityEndTime];
  uint64_t v29 = v7;
  double v8 = [(CLHRRecoverySessionData *)self workoutSessionId];
  uint64_t v9 = [(CLHRRecoverySessionData *)self workoutType];
  [(CLHRRecoverySessionData *)self hrRecovery];
  uint64_t v11 = v10;
  [(CLHRRecoverySessionData *)self lambda];
  uint64_t v13 = v12;
  [(CLHRRecoverySessionData *)self hrMax];
  uint64_t v15 = v14;
  [(CLHRRecoverySessionData *)self hrMinAdjusted];
  uint64_t v17 = v16;
  [(CLHRRecoverySessionData *)self recoveryOnsetTime];
  uint64_t v19 = v18;
  [(CLHRRecoverySessionData *)self steadyStateHR];
  uint64_t v21 = v20;
  uint64_t v22 = [(CLHRRecoverySessionData *)self status];
  [(CLHRRecoverySessionData *)self sessionHrRecovery];
  uint64_t v24 = v23;
  [(CLHRRecoverySessionData *)self peakHR];
  uint64_t v26 = v25;
  [(CLHRRecoverySessionData *)self hrRecoveryReference];
  return +[NSString stringWithFormat:@"%@,<recordId %llu, startTime %f, activityEndTime %f, workoutSessionId %@, workoutType %d, hrRecovery %f, lambda %f, hrMax %f, hrMinAdjusted, %f, recoveryOnsetTime, %f, steadyStateHR, %f, status, %d, sessionHrRecovery, %f, peakHR, %f, hrRecoveryReference, %f>", v4, v5, v30, v29, v8, v9, v11, v13, v15, v17, v19, v21, v22, v24, v26, v27];
}

- (HRRecoverySession)recoverySession
{
  retstr->var3 = 0.0;
  *(_OWORD *)&retstr->int64_t var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)((char *)&retstr->var10 + 4) = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var15 = 0u;
  *(_OWORD *)((char *)&retstr->var16 + 2) = 0u;
  retstr->var0 = self->_recordId;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self->_startTime;
  result = (HRRecoverySession *)[(NSUUID *)self->_workoutSessionId getUUIDBytes:retstr->var4];
  int status = self->_status;
  retstr->int64_t var5 = self->_workoutType;
  long long v7 = *(_OWORD *)&self->_hrMax;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_hrRecovery;
  *(_OWORD *)&retstr->var8 = v7;
  long long v8 = *(_OWORD *)&self->_sessionHrRecovery;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->_recoveryOnsetTime;
  retstr->int var12 = status;
  *(_OWORD *)&retstr->var13 = v8;
  retstr->var15 = self->_hrRecoveryReference;
  return result;
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)activityEndTime
{
  return self->_activityEndTime;
}

- (NSUUID)workoutSessionId
{
  return self->_workoutSessionId;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)hrRecovery
{
  return self->_hrRecovery;
}

- (double)lambda
{
  return self->_lambda;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMinAdjusted
{
  return self->_hrMinAdjusted;
}

- (double)recoveryOnsetTime
{
  return self->_recoveryOnsetTime;
}

- (double)steadyStateHR
{
  return self->_steadyStateHR;
}

- (int)status
{
  return self->_status;
}

- (double)sessionHrRecovery
{
  return self->_sessionHrRecovery;
}

- (double)peakHR
{
  return self->_peakHR;
}

- (double)hrRecoveryReference
{
  return self->_hrRecoveryReference;
}

@end