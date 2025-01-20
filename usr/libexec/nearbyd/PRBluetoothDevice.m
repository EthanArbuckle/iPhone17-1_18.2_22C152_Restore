@interface PRBluetoothDevice
- (BOOL)isMobilePhoneModel;
- (BOOL)isUwbCapable;
- (BOOL)isWifiRangingCapable;
- (BOOL)supportsCapabilities:(unsigned int)a3;
- (BOOL)systemKeyRelationship;
- (CBDevice)cbDevice;
- (NIDiscoveryToken)discoveryToken;
- (NSData)discoveryTokenData;
- (NSString)idsDeviceID;
- (NSString)name;
- (PRBluetoothDevice)initWithCBDevice:(id)a3;
- (array<unsigned)btAdvertisingAddress;
- (id)description;
- (unint64_t)u64Identifier;
@end

@implementation PRBluetoothDevice

- (PRBluetoothDevice)initWithCBDevice:(id)a3
{
  id v6 = a3;
  v7 = [v6 btAddressData];

  if (!v7)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRBluetoothDevice.mm", 20, @"Invalid parameter not satisfying: %@", @"cbDevice.btAddressData" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PRBluetoothDevice;
  v8 = [(PRBluetoothDevice *)&v15 init];
  p_isa = (id *)&v8->super.isa;
  if (!v8
    || (objc_storeStrong((id *)&v8->_cbDevice, a3), ([p_isa systemKeyRelationship] & 1) != 0)
    || ([p_isa[1] spatialInteractionTokenData],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v11 = p_isa;
  }
  else
  {
    v13 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041D2C8((uint64_t)v6, v13);
    }
    v11 = 0;
  }

  return v11;
}

- (NSData)discoveryTokenData
{
  v3 = [(CBDevice *)self->_cbDevice spatialInteractionTokenData];

  if (v3)
  {
    uint64_t v4 = [(CBDevice *)self->_cbDevice spatialInteractionTokenData];
  }
  else
  {
    if ([(PRBluetoothDevice *)self systemKeyRelationship])
    {
      v5 = [(PRBluetoothDevice *)self idsDeviceID];

      if (v5)
      {
        id v6 = [(PRBluetoothDevice *)self idsDeviceID];
        v7 = [v6 dataUsingEncoding:4];

        goto LABEL_8;
      }
    }
    +[NSException raise:NSInternalInconsistencyException, @"Device does not have a discovery token nor is it a known device. %@", self->_cbDevice format];
    uint64_t v4 = objc_opt_new();
  }
  v7 = (void *)v4;
LABEL_8:

  return (NSData *)v7;
}

- (NSString)idsDeviceID
{
  return (NSString *)[(CBDevice *)self->_cbDevice idsDeviceID];
}

- (NIDiscoveryToken)discoveryToken
{
  v3 = [NIDiscoveryToken alloc];
  uint64_t v4 = [(PRBluetoothDevice *)self discoveryTokenData];
  v5 = [(NIDiscoveryToken *)v3 initWithBytes:v4];

  return v5;
}

- (array<unsigned)btAdvertisingAddress
{
  v3 = [(CBDevice *)self->_cbDevice btAddressData];
  if (!v3) {
    sub_10041D340();
  }

  uint64_t v4 = [(CBDevice *)self->_cbDevice btAddressData];
  [v4 getBytes:&v10 length:6];

  v5 = (char *)&v11 + 1;
  id v6 = (char *)&v10 + 1;
  do
  {
    char v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }
  while (v6++ < v5);
  return (array<unsigned char, 6UL>)(v10 | ((unint64_t)v11 << 32));
}

- (unint64_t)u64Identifier
{
  v3 = [(CBDevice *)self->_cbDevice btAddressData];
  if (!v3) {
    sub_10041D36C();
  }

  uint64_t v4 = [(CBDevice *)self->_cbDevice btAddressData];
  unint64_t v5 = sub_10000FACC(v4);

  return v5;
}

- (BOOL)systemKeyRelationship
{
  if (([(CBDevice *)self->_cbDevice deviceFlags] & 0x80) != 0
    || ([(CBDevice *)self->_cbDevice deviceFlags] & 0x100) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return ((unint64_t)[(CBDevice *)self->_cbDevice deviceFlags] >> 9) & 1;
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)[(CBDevice *)self->_cbDevice name];
}

- (BOOL)isUwbCapable
{
  return ([(CBDevice *)self->_cbDevice spatialInteractionFlags] >> 3) & 1;
}

- (BOOL)isWifiRangingCapable
{
  return ([(CBDevice *)self->_cbDevice spatialInteractionFlags] >> 4) & 1;
}

- (BOOL)isMobilePhoneModel
{
  BOOL v3 = [(CBDevice *)self->_cbDevice model];
  if (v3)
  {
    uint64_t v4 = [(CBDevice *)self->_cbDevice model];
    unsigned __int8 v5 = [v4 hasPrefix:@"iPhone"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)description
{
  return [(CBDevice *)self->_cbDevice description];
}

- (BOOL)supportsCapabilities:(unsigned int)a3
{
  return ([(CBDevice *)self->_cbDevice spatialInteractionUWBTokenFlags] & a3) != 0;
}

- (CBDevice)cbDevice
{
  return (CBDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end