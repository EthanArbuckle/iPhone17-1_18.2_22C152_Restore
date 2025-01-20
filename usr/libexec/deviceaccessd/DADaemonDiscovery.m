@interface DADaemonDiscovery
- (DADiscovery)discoveryObj;
- (NSMutableDictionary)deviceAppAccessInfoMap;
- (NSMutableDictionary)deviceMap;
- (NSMutableDictionary)statefulDeviceMap;
- (NSMutableSet)discoverySet;
- (void)setDeviceAppAccessInfoMap:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setDiscoveryObj:(id)a3;
- (void)setDiscoverySet:(id)a3;
- (void)setStatefulDeviceMap:(id)a3;
@end

@implementation DADaemonDiscovery

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (DADiscovery)discoveryObj
{
  return self->_discoveryObj;
}

- (void)setDiscoveryObj:(id)a3
{
}

- (NSMutableSet)discoverySet
{
  return self->_discoverySet;
}

- (void)setDiscoverySet:(id)a3
{
}

- (NSMutableDictionary)statefulDeviceMap
{
  return self->_statefulDeviceMap;
}

- (void)setStatefulDeviceMap:(id)a3
{
}

- (NSMutableDictionary)deviceAppAccessInfoMap
{
  return self->_deviceAppAccessInfoMap;
}

- (void)setDeviceAppAccessInfoMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAppAccessInfoMap, 0);
  objc_storeStrong((id *)&self->_statefulDeviceMap, 0);
  objc_storeStrong((id *)&self->_discoverySet, 0);
  objc_storeStrong((id *)&self->_discoveryObj, 0);

  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end