@interface IDSService
- (id)nr_defaultPairedDeviceIDIncludingTinkerDevices;
- (id)nr_mineTinkerDevices;
@end

@implementation IDSService

- (id)nr_mineTinkerDevices
{
  uint64_t v3 = [(IDSService *)self linkedDevicesWithRelationship:1];
  uint64_t v4 = [(IDSService *)self linkedDevicesWithRelationship:2];
  if (v3 | v4)
  {
    v5 = [NSMutableArray arrayWithCapacity:][(char *)[(id)v3 count] + [v4 count]];
    v6 = v5;
    if (v3) {
      [v5 addObjectsFromArray:v3];
    }
    if (v4) {
      [v6 addObjectsFromArray:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nr_defaultPairedDeviceIDIncludingTinkerDevices
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(IDSService *)self nr_mineTinkerDevices];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDefaultPairedDevice])
        {
          id v3 = (id)IDSCopyIDForDevice();
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end