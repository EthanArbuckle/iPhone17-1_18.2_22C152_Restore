@interface PRBTRssiMeasurement
- (NSUUID)uuid;
- (PRBTRssiMeasurement)initWithTime:(double)a3 rssi:(int)a4 channel:(unint64_t)a5 uuid:(id)a6;
- (double)timestamp;
- (int)rssi;
- (unint64_t)channel;
@end

@implementation PRBTRssiMeasurement

- (PRBTRssiMeasurement)initWithTime:(double)a3 rssi:(int)a4 channel:(unint64_t)a5 uuid:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PRBTRssiMeasurement;
  v12 = [(PRBTRssiMeasurement *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_timestamp = a3;
    v12->_rssi = a4;
    v12->_channel = a5;
    objc_storeStrong((id *)&v12->_uuid, a6);
  }

  return v13;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)rssi
{
  return self->_rssi;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end