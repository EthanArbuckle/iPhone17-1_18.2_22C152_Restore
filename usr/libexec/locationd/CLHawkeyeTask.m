@interface CLHawkeyeTask
- (BOOL)isConfigurationControlPointTask;
- (BOOL)isDebugControlPointTask;
- (BOOL)isNonOwnerControlPointTask;
- (BOOL)isPairedOwnerInformationControlPointTask;
- (BOOL)isPreciseFindingControlPointTask;
- (CBUUID)characteristicUUID;
- (CBUUID)serviceUUID;
- (NSData)hawkeyePayload;
- (NSString)description;
- (id)opcodeDescription;
- (unsigned)hawkeyeOpcode;
- (void)dealloc;
- (void)setCharacteristicUUID:(id)a3;
- (void)setHawkeyeOpcode:(unsigned __int16)a3;
- (void)setHawkeyePayload:(id)a3;
- (void)setServiceUUID:(id)a3;
@end

@implementation CLHawkeyeTask

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHawkeyeTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"HawkeyeTask <%p>, Type:%@, id:%@", self, sub_1015FA474([(CLHawkeyeTask *)self hawkeyeOpcode]), [(CLDurianTask *)self uuid]];
}

- (id)opcodeDescription
{
  int v2 = [(CLHawkeyeTask *)self hawkeyeOpcode];

  return (id)sub_1015FA474(v2);
}

- (BOOL)isConfigurationControlPointTask
{
  unsigned int v3 = [(CBUUID *)self->_serviceUUID isEqual:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
  if (v3)
  {
    characteristicUUID = self->_characteristicUUID;
    id v5 = +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID];
    LOBYTE(v3) = [(CBUUID *)characteristicUUID isEqual:v5];
  }
  return v3;
}

- (BOOL)isNonOwnerControlPointTask
{
  unsigned int v3 = [(CBUUID *)self->_serviceUUID isEqual:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
  if (v3)
  {
    characteristicUUID = self->_characteristicUUID;
    id v5 = +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID];
    LOBYTE(v3) = [(CBUUID *)characteristicUUID isEqual:v5];
  }
  return v3;
}

- (BOOL)isPairedOwnerInformationControlPointTask
{
  unsigned int v3 = [(CBUUID *)self->_serviceUUID isEqual:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
  if (v3)
  {
    characteristicUUID = self->_characteristicUUID;
    id v5 = +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID];
    LOBYTE(v3) = [(CBUUID *)characteristicUUID isEqual:v5];
  }
  return v3;
}

- (BOOL)isDebugControlPointTask
{
  unsigned int v3 = [(CBUUID *)self->_serviceUUID isEqual:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
  if (v3)
  {
    characteristicUUID = self->_characteristicUUID;
    id v5 = +[CBUUID _cl_HawkeyeDebugCharacteristicUUID];
    LOBYTE(v3) = [(CBUUID *)characteristicUUID isEqual:v5];
  }
  return v3;
}

- (BOOL)isPreciseFindingControlPointTask
{
  unsigned int v3 = [(CBUUID *)self->_serviceUUID isEqual:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
  if (v3)
  {
    characteristicUUID = self->_characteristicUUID;
    id v5 = +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID];
    LOBYTE(v3) = [(CBUUID *)characteristicUUID isEqual:v5];
  }
  return v3;
}

- (CBUUID)serviceUUID
{
  return (CBUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setServiceUUID:(id)a3
{
}

- (CBUUID)characteristicUUID
{
  return (CBUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCharacteristicUUID:(id)a3
{
}

- (unsigned)hawkeyeOpcode
{
  return self->_hawkeyeOpcode;
}

- (void)setHawkeyeOpcode:(unsigned __int16)a3
{
  self->_hawkeyeOpcode = a3;
}

- (NSData)hawkeyePayload
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHawkeyePayload:(id)a3
{
}

@end