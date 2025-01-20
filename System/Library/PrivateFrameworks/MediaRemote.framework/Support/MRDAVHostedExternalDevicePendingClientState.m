@interface MRDAVHostedExternalDevicePendingClientState
- (MRAVDistantEndpoint)endpoint;
- (MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications)outputDeviceModifications;
- (MRDeviceInfo)deviceInfo;
- (MRGroupSessionToken)groupSessionToken;
- (NSError)connectionStateError;
- (NSMutableDictionary)discoverySessionConfigurationsResults;
- (NSMutableDictionary)outputDeviceMute;
- (NSMutableDictionary)outputDeviceVolume;
- (NSMutableDictionary)outputDeviceVolumeCapabilities;
- (NSNumber)isMuted;
- (NSNumber)volume;
- (NSNumber)volumeCapabilities;
- (id)description;
- (unsigned)connectionState;
- (void)setConnectionState:(unsigned int)a3;
- (void)setConnectionStateError:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoverySessionConfigurationsResults:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setGroupSessionToken:(id)a3;
- (void)setIsMuted:(id)a3;
- (void)setOutputDeviceModifications:(id)a3;
- (void)setOutputDeviceMute:(id)a3;
- (void)setOutputDeviceVolume:(id)a3;
- (void)setOutputDeviceVolumeCapabilities:(id)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeCapabilities:(id)a3;
@end

@implementation MRDAVHostedExternalDevicePendingClientState

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@ %p{\n", objc_opt_class(), self];
  [v3 appendFormat:@" hasConnected"];
  if (self->_connectionState)
  {
    v4 = (void *)MRExternalDeviceConnectionStateCopyDescription();
    [v3 appendFormat:@"    connectionState=%@\n", v4];
  }
  if (self->_connectionStateError) {
    [v3 appendFormat:@"    connectionStateError=%@\n", self->_connectionStateError];
  }
  if (self->_deviceInfo) {
    [v3 appendFormat:@"    deviceInfo = %@\n", self->_deviceInfo];
  }
  if (self->_endpoint) {
    [v3 appendFormat:@"    endpoint = %@\n", self->_endpoint];
  }
  volume = self->_volume;
  if (volume)
  {
    [(NSNumber *)volume floatValue];
    objc_msgSend(v3, "appendFormat:", @"    volume = %f\n", v6);
  }
  volumeCapabilities = self->_volumeCapabilities;
  if (volumeCapabilities)
  {
    [(NSNumber *)volumeCapabilities unsignedIntValue];
    v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    [v3 appendFormat:@"    volumeCapabilities = %@\n", v8];
  }
  if ([(NSMutableDictionary *)self->_outputDeviceVolume count])
  {
    v9 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    outputDeviceVolumes = %@\n", v9];
  }
  if ([(NSMutableDictionary *)self->_outputDeviceVolumeCapabilities count])
  {
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_outputDeviceVolumeCapabilities, "count"));
    outputDeviceVolumeCapabilities = self->_outputDeviceVolumeCapabilities;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100050554;
    v19[3] = &unk_100417990;
    id v20 = v10;
    id v12 = v10;
    [(NSMutableDictionary *)outputDeviceVolumeCapabilities enumerateKeysAndObjectsUsingBlock:v19];
    v13 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    outputDeviceVolumeCapabilities = %@\n", v13];
  }
  if ([(NSMutableDictionary *)self->_outputDeviceVolume count])
  {
    v14 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    outputDeviceMutes = %@\n", v14];
  }
  if (self->_outputDeviceModifications)
  {
    v15 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    modifications = %@\n", v15];
  }
  if ([(NSMutableDictionary *)self->_discoverySessionConfigurationsResults count])
  {
    v16 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    discoveryResults = %@\n", v16];
  }
  if (self->_groupSessionToken)
  {
    v17 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    groupSessionToken = %@\n", v17];
  }
  [v3 appendFormat:@"}>\n"];

  return v3;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unsigned int)a3
{
  self->_connectionState = a3;
}

- (NSError)connectionStateError
{
  return self->_connectionStateError;
}

- (void)setConnectionStateError:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (MRAVDistantEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (NSNumber)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (void)setVolumeCapabilities:(id)a3
{
}

- (NSNumber)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(id)a3
{
}

- (NSMutableDictionary)outputDeviceVolume
{
  return self->_outputDeviceVolume;
}

- (void)setOutputDeviceVolume:(id)a3
{
}

- (NSMutableDictionary)outputDeviceVolumeCapabilities
{
  return self->_outputDeviceVolumeCapabilities;
}

- (void)setOutputDeviceVolumeCapabilities:(id)a3
{
}

- (NSMutableDictionary)outputDeviceMute
{
  return self->_outputDeviceMute;
}

- (void)setOutputDeviceMute:(id)a3
{
}

- (MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications)outputDeviceModifications
{
  return self->_outputDeviceModifications;
}

- (void)setOutputDeviceModifications:(id)a3
{
}

- (NSMutableDictionary)discoverySessionConfigurationsResults
{
  return self->_discoverySessionConfigurationsResults;
}

- (void)setDiscoverySessionConfigurationsResults:(id)a3
{
}

- (MRGroupSessionToken)groupSessionToken
{
  return self->_groupSessionToken;
}

- (void)setGroupSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSessionToken, 0);
  objc_storeStrong((id *)&self->_discoverySessionConfigurationsResults, 0);
  objc_storeStrong((id *)&self->_outputDeviceModifications, 0);
  objc_storeStrong((id *)&self->_outputDeviceMute, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeCapabilities, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolume, 0);
  objc_storeStrong((id *)&self->_isMuted, 0);
  objc_storeStrong((id *)&self->_volumeCapabilities, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_connectionStateError, 0);
}

@end