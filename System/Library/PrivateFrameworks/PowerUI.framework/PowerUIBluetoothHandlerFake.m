@interface PowerUIBluetoothHandlerFake
- (BOOL)fakeDeviceConnected;
- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4;
- (BTDeviceImpl)fakeDevice;
- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4;
- (NSString)fakeDeviceAddress;
- (id)getAddressStringForDevice:(BTDeviceImpl *)a3;
- (id)init:(id)a3;
- (int)deviceConnectWrapper:(BTDeviceImpl *)a3;
- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7;
- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4;
- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7;
- (unsigned)productIDForDevice:(BTDeviceImpl *)a3;
- (unsigned)protocolForDevice:(BTDeviceImpl *)a3;
- (void)dealloc;
- (void)setFakeDevice:(BTDeviceImpl *)a3;
- (void)setFakeDeviceAddress:(id)a3;
- (void)setFakeDeviceConnected:(BOOL)a3;
@end

@implementation PowerUIBluetoothHandlerFake

- (id)init:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PowerUIBluetoothHandlerFake;
  v5 = [(PowerUIBluetoothHandler *)&v8 init];
  v5->_fakeDevice = (BTDeviceImpl *)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  fakeDeviceAddress = v5->_fakeDeviceAddress;
  v5->_fakeDeviceAddress = v4;

  v5->_fakeDeviceConnected = 1;
  return v5;
}

- (void)dealloc
{
  free(self->_fakeDevice);
  v3.receiver = self;
  v3.super_class = (Class)PowerUIBluetoothHandlerFake;
  [(PowerUIBluetoothHandlerFake *)&v3 dealloc];
}

- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4
{
  *a4 = -1;
  return 0;
}

- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7
{
  *a6 = 8212;
  return 0;
}

- (int)deviceConnectWrapper:(BTDeviceImpl *)a3
{
  return 0;
}

- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7
{
  return 0;
}

- (id)getAddressStringForDevice:(BTDeviceImpl *)a3
{
  return self->_fakeDeviceAddress;
}

- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4
{
  return self->_fakeDevice;
}

- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4
{
  return self->_fakeDeviceConnected;
}

- (unsigned)protocolForDevice:(BTDeviceImpl *)a3
{
  return 2;
}

- (unsigned)productIDForDevice:(BTDeviceImpl *)a3
{
  return 8212;
}

- (BTDeviceImpl)fakeDevice
{
  return self->_fakeDevice;
}

- (void)setFakeDevice:(BTDeviceImpl *)a3
{
  self->_fakeDevice = a3;
}

- (NSString)fakeDeviceAddress
{
  return self->_fakeDeviceAddress;
}

- (void)setFakeDeviceAddress:(id)a3
{
}

- (BOOL)fakeDeviceConnected
{
  return self->_fakeDeviceConnected;
}

- (void)setFakeDeviceConnected:(BOOL)a3
{
  self->_fakeDeviceConnected = a3;
}

- (void).cxx_destruct
{
}

@end