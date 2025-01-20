@interface CLSubHarvesterAvengerMotion
- (CLMotionActivity)motionActivity;
- (CLSubHarvesterAvengerMotion)initWithMotion:(CLMotionActivity *)a3 timestamp:(double)a4;
- (double)timestamp;
- (void)setTimestamp:(double)a3;
@end

@implementation CLSubHarvesterAvengerMotion

- (CLSubHarvesterAvengerMotion)initWithMotion:(CLMotionActivity *)a3 timestamp:(double)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CLSubHarvesterAvengerMotion;
  result = [(CLSubHarvesterAvengerMotion *)&v21 init];
  if (result)
  {
    *(_OWORD *)&result->_motionActivity.type = *(_OWORD *)&a3->type;
    long long v15 = *(_OWORD *)&a3->mountedConfidence;
    long long v16 = *(_OWORD *)&a3->isStanding;
    long long v17 = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&result->_motionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->_motionActivity.vehicleType = v17;
    *(_OWORD *)&result->_motionActivity.mountedConfidence = v15;
    *(_OWORD *)&result->_motionActivity.isStanding = v16;
    long long v18 = *(_OWORD *)&a3[1].type;
    long long v19 = *(_OWORD *)&a3[1].mountedConfidence;
    long long v20 = *(_OWORD *)&a3[1].isStanding;
    *(void *)&result[1]._motionActivity.isStanding = *(void *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1]._motionActivity.type = v19;
    *(_OWORD *)&result[1]._motionActivity.mountedConfidence = v20;
    *(_OWORD *)&result[1].super.isa = v18;
    result->_timestamp = a4;
  }
  return result;
}

- (CLMotionActivity)motionActivity
{
  long long v10 = *(_OWORD *)&self[1].isVehicleConnected;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].isStanding;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[1].vehicleType;
  long long v11 = *(_OWORD *)&self->vehicleType;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->isVehicleConnected;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  long long v12 = *(_OWORD *)&self[1].mountedConfidence;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].type;
  *(_OWORD *)&retstr[1].type = v12;
  long long v13 = *(_OWORD *)&self->isStanding;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->mountedConfidence;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end