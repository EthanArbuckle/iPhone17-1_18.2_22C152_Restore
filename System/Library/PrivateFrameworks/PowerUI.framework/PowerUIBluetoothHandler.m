@interface PowerUIBluetoothHandler
- (BOOL)isAccessorySupported:(unsigned int)a3;
- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4;
- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4;
- (PowerUIBluetoothHandler)init;
- (id)getAddressStringForDevice:(BTDeviceImpl *)a3;
- (int)deviceConnectWrapper:(BTDeviceImpl *)a3;
- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7;
- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4;
- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7;
- (unsigned)productIDForDevice:(BTDeviceImpl *)a3;
- (unsigned)protocolForDevice:(BTDeviceImpl *)a3;
@end

@implementation PowerUIBluetoothHandler

- (PowerUIBluetoothHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)PowerUIBluetoothHandler;
  return [(PowerUIBluetoothHandler *)&v3 init];
}

- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4
{
  return MEMORY[0x270F4ABF8](a3, a4);
}

- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7
{
  return MEMORY[0x270F4AB90](a3, a4, a5, a6, a7);
}

- (int)deviceConnectWrapper:(BTDeviceImpl *)a3
{
  return MEMORY[0x270F4AB40](a3, a2);
}

- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7
{
  return MEMORY[0x270F4AAB8](a3, *(void *)&a4, a5, a6, a7);
}

- (id)getAddressStringForDevice:(BTDeviceImpl *)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BTDeviceGetAddressString();
  objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v5);
  return v3;
}

- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4
{
  if (!a3) {
    return 0;
  }
  [a3 UTF8String];
  if (BTDeviceAddressFromString() || BTDeviceFromAddress()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4
{
  return 0;
}

- (BOOL)isAccessorySupported:(unsigned int)a3
{
  return a3 == 8212 || a3 == 8228 || (a3 & 0xFFFFFFFD) == 8217 || a3 == 8222 || a3 == 8224;
}

- (unsigned)protocolForDevice:(BTDeviceImpl *)a3
{
  int v13 = 0;
  int v5 = [(PowerUIBluetoothHandler *)self isAppleAudioDeviceWrapperWithDevice:a3 withBool:&v13];
  unsigned __int8 v6 = 0;
  if (!v5)
  {
    int v12 = 0;
    uint64_t v11 = 0;
    int v10 = 0;
    int v7 = [(PowerUIBluetoothHandler *)self getDeviceIDWrapperWithDevice:a3 withVendorIdSource:&v12 withVendorId:(char *)&v11 + 4 withProductId:&v11 withVersionId:&v10];
    unsigned __int8 v6 = 0;
    if (!v7)
    {
      if (!v13) {
        return -1;
      }
      if ([(PowerUIBluetoothHandler *)self isAccessorySupported:v11])
      {
        if (_os_feature_enabled_impl()) {
          return 3;
        }
        else {
          return 2;
        }
      }
      if (!v13) {
        return -1;
      }
      if (v11 == 8206 || v11 == 8211) {
        return 1;
      }
      else {
        return -1;
      }
    }
  }
  return v6;
}

- (unsigned)productIDForDevice:(BTDeviceImpl *)a3
{
  int v6 = 0;
  int v5 = 0;
  uint64_t v4 = 0;
  if ([(PowerUIBluetoothHandler *)self getDeviceIDWrapperWithDevice:a3 withVendorIdSource:&v6 withVendorId:&v5 withProductId:(char *)&v4 + 4 withVersionId:&v4])
  {
    return 0;
  }
  else
  {
    return HIDWORD(v4);
  }
}

@end