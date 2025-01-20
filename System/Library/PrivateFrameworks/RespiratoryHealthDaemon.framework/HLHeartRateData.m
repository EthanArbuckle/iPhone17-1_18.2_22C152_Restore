@interface HLHeartRateData
- (NSDate)timestamp;
- (NSUUID)uuid;
- (double)confidence;
- (double)heartRate;
- (int)context;
- (unint64_t)confidenceLevel;
- (void)setHeartRate:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation HLHeartRateData

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (double)heartRate
{
  return self->_heartRate;
}

- (void)setHeartRate:(double)a3
{
  self->_heartRate = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (int)context
{
  return self->_context;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end