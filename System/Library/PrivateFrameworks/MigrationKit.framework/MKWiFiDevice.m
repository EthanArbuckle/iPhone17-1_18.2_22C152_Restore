@interface MKWiFiDevice
- (id)channel:(__WiFiDeviceClient *)a3;
- (id)currentNetwork;
@end

@implementation MKWiFiDevice

- (id)currentNetwork
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = WiFiManagerClientCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = [(MKWiFiDevice *)self channel:WiFiManagerClientGetDevice()];
    [v3 setObject:v6 forKey:@"en0"];

    CFRelease(v5);
  }
  return v3;
}

- (id)channel:(__WiFiDeviceClient *)a3
{
  if (a3 && WiFiDeviceClientCopyCurrentNetwork())
  {
    id v3 = WiFiNetworkGetChannel();
    uint64_t v4 = v3;
    if (v3) {
      id v5 = v3;
    }
    else {
      id v5 = &unk_26DF7A5F0;
    }
  }
  else
  {
    id v5 = &unk_26DF7A5F0;
  }
  return v5;
}

@end