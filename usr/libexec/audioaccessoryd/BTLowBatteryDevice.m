@interface BTLowBatteryDevice
- (NSString)deviceAddress;
- (NSString)identifier;
- (NSString)name;
- (double)lastBatteryLevel;
- (double)lastSeenTime;
- (double)reportTime;
- (int64_t)lastBatteryType;
- (unsigned)productID;
- (void)setDeviceAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastBatteryLevel:(double)a3;
- (void)setLastBatteryType:(int64_t)a3;
- (void)setLastSeenTime:(double)a3;
- (void)setName:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setReportTime:(double)a3;
@end

@implementation BTLowBatteryDevice

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)lastBatteryLevel
{
  return self->_lastBatteryLevel;
}

- (void)setLastBatteryLevel:(double)a3
{
  self->_lastBatteryLevel = a3;
}

- (int64_t)lastBatteryType
{
  return self->_lastBatteryType;
}

- (void)setLastBatteryType:(int64_t)a3
{
  self->_lastBatteryType = a3;
}

- (double)lastSeenTime
{
  return self->_lastSeenTime;
}

- (void)setLastSeenTime:(double)a3
{
  self->_lastSeenTime = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (double)reportTime
{
  return self->_reportTime;
}

- (void)setReportTime:(double)a3
{
  self->_reportTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end