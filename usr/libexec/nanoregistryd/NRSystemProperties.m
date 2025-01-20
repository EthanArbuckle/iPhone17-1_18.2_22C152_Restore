@interface NRSystemProperties
+ (NRSystemProperties)sharedInstance;
- (BOOL)internalInstall;
- (BOOL)isBluetoothCapable;
- (BOOL)isCellularCapable;
- (BOOL)isVirtualDevice;
- (NRSystemProperties)init;
- (NSNumber)chipID;
- (NSNumber)encodedSystemVersion;
- (NSString)productType;
@end

@implementation NRSystemProperties

+ (NRSystemProperties)sharedInstance
{
  if (qword_1001A1370 != -1) {
    dispatch_once(&qword_1001A1370, &stru_100168F50);
  }
  v2 = (void *)qword_1001A1368;

  return (NRSystemProperties *)v2;
}

- (NRSystemProperties)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRSystemProperties;
  v2 = [(NRSystemProperties *)&v11 init];
  if (v2)
  {
    uint64_t v3 = MGGetStringAnswer();
    productType = v2->_productType;
    v2->_productType = (NSString *)v3;

    uint64_t v5 = MGCopyAnswer();
    chipID = v2->_chipID;
    v2->_chipID = (NSNumber *)v5;

    v2->_isCellularCapable = MGGetBoolAnswer();
    v2->_isBluetoothCapable = MGGetBoolAnswer();
    v2->_internalInstall = MGGetBoolAnswer();
    v2->_isVirtualDevice = MGGetBoolAnswer();
    v7 = (void *)MGCopyAnswer();
    uint64_t v8 = +[NSNumber numberWithInt:NRRawVersionFromString()];
    encodedSystemVersion = v2->_encodedSystemVersion;
    v2->_encodedSystemVersion = (NSNumber *)v8;
  }
  return v2;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (NSNumber)encodedSystemVersion
{
  return self->_encodedSystemVersion;
}

- (BOOL)isBluetoothCapable
{
  return self->_isBluetoothCapable;
}

- (BOOL)isCellularCapable
{
  return self->_isCellularCapable;
}

- (BOOL)internalInstall
{
  return self->_internalInstall;
}

- (BOOL)isVirtualDevice
{
  return self->_isVirtualDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedSystemVersion, 0);
  objc_storeStrong((id *)&self->_chipID, 0);

  objc_storeStrong((id *)&self->_productType, 0);
}

@end