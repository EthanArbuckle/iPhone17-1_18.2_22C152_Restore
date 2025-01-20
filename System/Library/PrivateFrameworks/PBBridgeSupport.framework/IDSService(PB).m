@interface IDSService(PB)
- (id)pb_defaultPairedDeviceIDIncludingTinkerDevices;
- (id)pb_mineTinkerDevices;
@end

@implementation IDSService(PB)

- (id)pb_mineTinkerDevices
{
  uint64_t v2 = [a1 linkedDevicesWithRelationship:1];
  uint64_t v3 = [a1 linkedDevicesWithRelationship:2];
  if (v2 | v3)
  {
    v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)v3, "count") + objc_msgSend((id)v2, "count"));
    v5 = v4;
    if (v2) {
      [v4 addObjectsFromArray:v2];
    }
    if (v3) {
      [v5 addObjectsFromArray:v3];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pb_defaultPairedDeviceIDIncludingTinkerDevices
{
  return (id)*MEMORY[0x263F4A148];
}

@end