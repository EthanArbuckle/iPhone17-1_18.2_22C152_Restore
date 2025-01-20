@interface EAHIDAccessory
- (EAHIDAccessory)initWithName:(id)a3 HIDDeviceRef:(__IOHIDDevice *)a4;
- (NSString)EAConnectionUUID;
- (NSString)EAEndpointUUID;
- (NSString)EAProtocolString;
- (NSString)hardwareVersion;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSString)serialNumber;
- (__IOHIDDevice)HIDDevice;
- (unsigned)HIDReportID;
- (unsigned)HIDReportSizeInput;
- (unsigned)HIDReportSizeOutput;
- (unsigned)firmwareVersionMajor;
- (unsigned)firmwareVersionMinor;
- (unsigned)firmwareVersionRelease;
- (void)dealloc;
- (void)setEAConnectionUUID:(id)a3;
- (void)setEAEndpointUUID:(id)a3;
- (void)setEAProtocolString:(id)a3;
- (void)setFirmwareVersionMajor:(unsigned __int16)a3;
- (void)setFirmwareVersionMinor:(unsigned __int16)a3;
- (void)setFirmwareVersionRelease:(unsigned __int16)a3;
- (void)setHIDDevice:(__IOHIDDevice *)a3;
- (void)setHIDReportID:(unsigned __int8)a3;
- (void)setHIDReportSizeInput:(unsigned int)a3;
- (void)setHIDReportSizeOutput:(unsigned int)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation EAHIDAccessory

- (EAHIDAccessory)initWithName:(id)a3 HIDDeviceRef:(__IOHIDDevice *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EAHIDAccessory;
  v6 = [(EAHIDAccessory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(EAHIDAccessory *)v6 setName:a3];
    [(EAHIDAccessory *)v7 setHIDDevice:a4];
  }
  return v7;
}

- (void)dealloc
{
  name = self->name;
  if (name) {

  }
  serialNumber = self->serialNumber;
  if (serialNumber) {

  }
  modelNumber = self->modelNumber;
  if (modelNumber) {

  }
  manufacturer = self->manufacturer;
  if (manufacturer) {

  }
  hardwareVersion = self->hardwareVersion;
  if (hardwareVersion) {

  }
  EAProtocolString = self->EAProtocolString;
  if (EAProtocolString) {

  }
  EAConnectionUUID = self->EAConnectionUUID;
  if (EAConnectionUUID) {

  }
  EAEndpointUUID = self->EAEndpointUUID;
  if (EAEndpointUUID) {

  }
  HIDDevice = self->HIDDevice;
  if (HIDDevice)
  {
    IOHIDDeviceClose(HIDDevice, 0);
    CFRelease(self->HIDDevice);
  }
  v12.receiver = self;
  v12.super_class = (Class)EAHIDAccessory;
  [(EAHIDAccessory *)&v12 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)EAProtocolString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEAProtocolString:(id)a3
{
}

- (NSString)EAConnectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEAConnectionUUID:(id)a3
{
}

- (NSString)EAEndpointUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEAEndpointUUID:(id)a3
{
}

- (__IOHIDDevice)HIDDevice
{
  return self->HIDDevice;
}

- (void)setHIDDevice:(__IOHIDDevice *)a3
{
  self->HIDDevice = a3;
}

- (unsigned)firmwareVersionMajor
{
  return self->firmwareVersionMajor;
}

- (void)setFirmwareVersionMajor:(unsigned __int16)a3
{
  self->firmwareVersionMajor = a3;
}

- (unsigned)firmwareVersionMinor
{
  return self->firmwareVersionMinor;
}

- (void)setFirmwareVersionMinor:(unsigned __int16)a3
{
  self->firmwareVersionMinor = a3;
}

- (unsigned)firmwareVersionRelease
{
  return self->firmwareVersionRelease;
}

- (void)setFirmwareVersionRelease:(unsigned __int16)a3
{
  self->firmwareVersionRelease = a3;
}

- (unsigned)HIDReportSizeInput
{
  return self->HIDReportSizeInput;
}

- (void)setHIDReportSizeInput:(unsigned int)a3
{
  self->HIDReportSizeInput = a3;
}

- (unsigned)HIDReportSizeOutput
{
  return self->HIDReportSizeOutput;
}

- (void)setHIDReportSizeOutput:(unsigned int)a3
{
  self->HIDReportSizeOutput = a3;
}

- (unsigned)HIDReportID
{
  return self->HIDReportID;
}

- (void)setHIDReportID:(unsigned __int8)a3
{
  self->HIDReportID = a3;
}

@end