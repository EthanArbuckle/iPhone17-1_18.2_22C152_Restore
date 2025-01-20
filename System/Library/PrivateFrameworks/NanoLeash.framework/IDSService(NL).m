@interface IDSService(NL)
- (id)nl_defaultPairedDeviceIDIncludingTinkerDevices;
- (id)nl_mineTinkerDevices;
@end

@implementation IDSService(NL)

- (id)nl_mineTinkerDevices
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

- (id)nl_defaultPairedDeviceIDIncludingTinkerDevices
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "nl_mineTinkerDevices", 0);
  uint64_t v2 = (void *)[v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) isDefaultPairedDevice])
        {
          uint64_t v2 = (void *)IDSCopyIDForDevice();
          goto LABEL_11;
        }
      }
      uint64_t v2 = (void *)[v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

@end