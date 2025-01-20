@interface MXMOSLogDeviceStore_Internal
+ (MXMOSLogDeviceStore_Internal)shared;
- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7;
- (MXMOSLogDeviceStore_Internal)init;
- (MXMProbeableDevice)hostDevice;
- (NSMutableDictionary)devices;
@end

@implementation MXMOSLogDeviceStore_Internal

+ (MXMOSLogDeviceStore_Internal)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)shared__internalStore;
  return (MXMOSLogDeviceStore_Internal *)v2;
}

- (MXMOSLogDeviceStore_Internal)init
{
  v13.receiver = self;
  v13.super_class = (Class)MXMOSLogDeviceStore_Internal;
  v2 = [(MXMOSLogDeviceStore_Internal *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v5 = (OSActivityStream *)objc_alloc_init(MEMORY[0x263F52728]);
    stream = v2->_stream;
    v2->_stream = v5;

    [(OSActivityStream *)v2->_stream setDeviceDelegate:v2];
    v7 = [MXMOSLogDevice_Internal alloc];
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [(MXMOSLogDevice_Internal *)v7 initWithName:@"Unknown" identifier:v9];
    hostDevice = v2->_hostDevice;
    v2->_hostDevice = (MXMProbeableDevice *)v10;
  }
  return v2;
}

- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v9];

  if (!v11)
  {
    v12 = [[MXMOSLogDevice_Internal alloc] initWithOSLogDevice:v10];
    [(NSMutableDictionary *)self->_devices setObject:v12 forKeyedSubscript:v9];
  }
  objc_super v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 postNotificationName:@"kMXMOSLogProbeDidUpdateConnectedDevicesList" object:0];

  return 1;
}

- (MXMProbeableDevice)hostDevice
{
  return self->_hostDevice;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_hostDevice, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end