@interface MIBUDeviceBase
- (BOOL)protocolSupported;
- (NSNumber)protocolVersion;
- (NSString)buildVersion;
- (NSString)osVersion;
- (NSString)serialNumber;
@end

@implementation MIBUDeviceBase

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)protocolSupported
{
  return self->_protocolSupported;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

@end