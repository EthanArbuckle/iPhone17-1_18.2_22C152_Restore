@interface NRDeviceEndpoint
- (id)description;
@end

@implementation NRDeviceEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTypeToIntfName, 0);
  objc_storeStrong((id *)&self->_linkTypeToEndpoint, 0);
  objc_storeStrong((id *)&self->_rpIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_cbUUID, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_localIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_remoteIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"NRDeviceEndpoint["];
  v4 = v3;
  if (self->_name) {
    [v3 appendFormat:@"name:%@ ", self->_name];
  }
  if (self->_model) {
    [v4 appendFormat:@"model:%@ ", self->_model];
  }
  if (self->_serviceName) {
    [v4 appendFormat:@"svc:%@", self->_serviceName];
  }
  [v4 appendString:@"]"];

  return v4;
}

@end