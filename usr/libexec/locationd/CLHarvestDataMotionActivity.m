@interface CLHarvestDataMotionActivity
+ (BOOL)supportsSecureCoding;
- (CLHarvestDataMotionActivity)initWithCoder:(id)a3;
- (CLHarvestDataMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3;
- (CLMotionActivity)activity;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(CLMotionActivity *)a3;
@end

@implementation CLHarvestDataMotionActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CLHarvestDataMotionActivity;
  result = [(CLHarvestDataMotionActivity *)&v20 init];
  if (result)
  {
    *(_OWORD *)&result->_activity.type = *(_OWORD *)&a3->type;
    long long v14 = *(_OWORD *)&a3->mountedConfidence;
    long long v15 = *(_OWORD *)&a3->isStanding;
    long long v16 = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->_activity.vehicleType = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&result->_activity.isVehicleConnected = v16;
    *(_OWORD *)&result->_activity.isStanding = v15;
    *(_OWORD *)&result->_activity.mountedConfidence = v14;
    long long v17 = *(_OWORD *)&a3[1].type;
    long long v18 = *(_OWORD *)&a3[1].mountedConfidence;
    long long v19 = *(_OWORD *)&a3[1].isStanding;
    result[1]._activity.timestamp = *(double *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1]._activity.conservativeMountedProbability = v19;
    *(_OWORD *)&result[1]._activity.source = v18;
    *(_OWORD *)&result[1].super.isa = v17;
  }
  return result;
}

- (CLHarvestDataMotionActivity)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLHarvestDataMotionActivity;
  v4 = [(CLHarvestDataMotionActivity *)&v10 init];
  if (v4)
  {
    v4->_activity.type = [a3 decodeIntForKey:@"TypeKey"];
    v4->_activity.confidence = [a3 decodeIntForKey:@"ConfidenceKey"];
    v4->_activity.mountedState = [a3 decodeIntForKey:@"MountedStateKey"];
    v4->_activity.mountedConfidence = [a3 decodeIntForKey:@"MountedConfidenceKey"];
    v4->_activity.isStanding = [a3 decodeBoolForKey:@"StandingKey"];
    [a3 decodeFloatForKey:@"TiltKey"];
    v4->_activity.tilt = v5;
    [a3 decodeDoubleForKey:@"TimestampKey"];
    v4->_activity.timestamp = v6;
    v4->_activity.isVehicleConnected = [a3 decodeBoolForKey:@"VehicleConnectedKey"];
    v4->_activity.exitState = [a3 decodeIntForKey:@"ExitStateKey"];
    [a3 decodeDoubleForKey:@"ExtExitTimeKey"];
    v4->_activity.estExitTime = v7;
    [a3 decodeDoubleForKey:@"StartTimeKey"];
    v4[1].super.isa = v8;
    v4[1]._activity.type = [a3 decodeIntForKey:@"RawTypeKey"];
    v4[1]._activity.confidence = [a3 decodeIntForKey:@"kRawConfidenceKey"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_activity.type forKey:@"TypeKey"];
  [a3 encodeInt:self->_activity.confidence forKey:@"ConfidenceKey"];
  [a3 encodeInt:self->_activity.mountedState forKey:@"MountedStateKey"];
  [a3 encodeInt:self->_activity.mountedConfidence forKey:@"MountedConfidenceKey"];
  [a3 encodeBool:self->_activity.isStanding forKey:@"StandingKey"];
  *(float *)&double v5 = self->_activity.tilt;
  [a3 encodeFloat:@"TiltKey" forKey:v5];
  [a3 encodeDouble:@"TimestampKey" forKey:self->_activity.timestamp];
  [a3 encodeBool:self->_activity.isVehicleConnected forKey:@"VehicleConnectedKey"];
  [a3 encodeInt:self->_activity.exitState forKey:@"ExitStateKey"];
  [a3 encodeDouble:@"ExtExitTimeKey" forKey:self->_activity.estExitTime];
  [a3 encodeDouble:@"StartTimeKey" forKey:*(double *)&self[1].super.isa];
  [a3 encodeInt:self[1]._activity.type forKey:@"RawTypeKey"];
  uint64_t confidence = self[1]._activity.confidence;

  [a3 encodeInt:confidence forKey:@"kRawConfidenceKey"];
}

- (CLMotionActivity)activity
{
  long long v10 = *(_OWORD *)&self[1].source;
  long long v11 = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].conservativeMountedProbability;
  *(_OWORD *)&retstr[1].isStanding = v11;
  *(double *)&retstr[1].isVehicleConnected = self[1].estExitTime;
  long long v12 = *(_OWORD *)&self->conservativeMountedProbability;
  long long v13 = *(_OWORD *)&self->estExitTime;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->timestamp;
  *(_OWORD *)&retstr->isVehicleConnected = v13;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self->fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr[1].type = v10;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->source;
  *(_OWORD *)&retstr->mountedConfidence = v12;
  return self;
}

- (void)setActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_activity.type = *(_OWORD *)&a3->type;
  long long v12 = *(_OWORD *)&a3->mountedConfidence;
  long long v13 = *(_OWORD *)&a3->isStanding;
  long long v14 = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_activity.vehicleType = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_activity.isVehicleConnected = v14;
  *(_OWORD *)&self->_activity.isStanding = v13;
  *(_OWORD *)&self->_activity.mountedConfidence = v12;
  long long v15 = *(_OWORD *)&a3[1].type;
  long long v16 = *(_OWORD *)&a3[1].mountedConfidence;
  long long v17 = *(_OWORD *)&a3[1].isStanding;
  self[1]._activity.timestamp = *(double *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self[1]._activity.conservativeMountedProbability = v17;
  *(_OWORD *)&self[1]._activity.source = v16;
  *(_OWORD *)&self[1].super.isa = v15;
}

@end