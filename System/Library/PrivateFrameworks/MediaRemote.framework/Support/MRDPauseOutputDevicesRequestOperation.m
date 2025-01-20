@interface MRDPauseOutputDevicesRequestOperation
- (NSSet)devicesInGroup;
- (NSSet)relevantOutputDeviceUIDs;
- (NSSet)relevantOutputDevices;
- (NSString)reason;
- (int64_t)type;
- (void)setDevicesInGroup:(id)a3;
- (void)setReason:(id)a3;
- (void)setRelevantOutputDevices:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRDPauseOutputDevicesRequestOperation

- (NSSet)relevantOutputDeviceUIDs
{
  id v3 = objc_alloc((Class)NSSet);
  v4 = [(NSSet *)self->_relevantOutputDevices msv_compactMap:&stru_10041A2F0];
  id v5 = [v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSSet)devicesInGroup
{
  return self->_devicesInGroup;
}

- (void)setDevicesInGroup:(id)a3
{
}

- (NSSet)relevantOutputDevices
{
  return self->_relevantOutputDevices;
}

- (void)setRelevantOutputDevices:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_relevantOutputDevices, 0);

  objc_storeStrong((id *)&self->_devicesInGroup, 0);
}

@end