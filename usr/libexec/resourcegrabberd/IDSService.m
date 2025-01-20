@interface IDSService
- (id)defaultPairedDevice;
- (id)nrg_allDevices;
@end

@implementation IDSService

- (id)nrg_allDevices
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

- (id)defaultPairedDevice
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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