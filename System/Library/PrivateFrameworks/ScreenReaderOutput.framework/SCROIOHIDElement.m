@interface SCROIOHIDElement
- (BOOL)isBluetoothLowEnergy;
- (NSString)manufacturerName;
- (NSString)productName;
- (SCROIOHIDElement)initWithIOObject:(unsigned int)a3;
- (id)bluetoothAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (int)transport;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)dealloc;
- (void)hidDevice;
@end

@implementation SCROIOHIDElement

- (SCROIOHIDElement)initWithIOObject:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCROIOHIDElement;
  v4 = -[SCROIOElement initWithIOObject:](&v9, sel_initWithIOObject_);
  v5 = v4;
  if (a3
    && v4
    && (!IOObjectConformsTo(a3, "IOHIDDevice")
     || (IOHIDDeviceRef v6 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3), (v5->_hidDevice = v6) == 0)))
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  hidDevice = self->_hidDevice;
  if (hidDevice) {
    CFRelease(hidDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCROIOHIDElement;
  [(SCROIOElement *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCROIOHIDElement;
  objc_super v4 = [(SCROIOElement *)&v7 copyWithZone:a3];
  if (v4)
  {
    hidDevice = self->_hidDevice;
    if (hidDevice) {
      v4[2] = CFRetain(hidDevice);
    }
  }
  return v4;
}

- (void)hidDevice
{
  return self->_hidDevice;
}

- (unsigned)productId
{
  Property = (void *)IOHIDDeviceGetProperty(self->_hidDevice, @"ProductID");

  return [Property intValue];
}

- (unsigned)vendorId
{
  Property = (void *)IOHIDDeviceGetProperty(self->_hidDevice, @"VendorID");

  return [Property intValue];
}

- (NSString)manufacturerName
{
  return (NSString *)IOHIDDeviceGetProperty(self->_hidDevice, @"Manufacturer");
}

- (NSString)productName
{
  return (NSString *)IOHIDDeviceGetProperty(self->_hidDevice, @"Product");
}

- (int)transport
{
  v2 = IOHIDDeviceGetProperty(self->_hidDevice, @"Transport");
  if ([@"USB" isEqualToString:v2])
  {
    int v3 = 4;
  }
  else if ([@"Bluetooth" isEqualToString:v2])
  {
    int v3 = 8;
  }
  else
  {
    int v3 = 8;
    if (([@"BluetoothLowEnergy" isEqualToString:v2] & 1) == 0)
    {
      if ([@"Bluetooth Low Energy" isEqualToString:v2]) {
        int v3 = 8;
      }
      else {
        int v3 = 0;
      }
    }
  }

  return v3;
}

- (BOOL)isBluetoothLowEnergy
{
  v2 = IOHIDDeviceGetProperty(self->_hidDevice, @"Transport");
  if ([@"BluetoothLowEnergy" isEqualToString:v2]) {
    char v3 = 1;
  }
  else {
    char v3 = [@"Bluetooth Low Energy" isEqualToString:v2];
  }

  return v3;
}

- (id)bluetoothAddress
{
  char v3 = IOHIDDeviceGetProperty(self->_hidDevice, @"SerialNumber");
  objc_super v4 = IOHIDDeviceGetProperty(self->_hidDevice, @"PhysicalDeviceUniqueID");
  BOOL v5 = [(SCROIOHIDElement *)self isBluetoothLowEnergy];
  if (v3) {
    int v6 = v5;
  }
  else {
    int v6 = 1;
  }
  if (v6) {
    objc_super v7 = v4;
  }
  else {
    objc_super v7 = v3;
  }
  id v8 = v7;

  return v8;
}

@end