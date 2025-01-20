@interface NSArray(MRAVAdditions)
- (id)mr_replaceEndpointsWithEndpoints:()MRAVAdditions;
- (id)mr_replaceOutputDevicesWithOutputDevices:()MRAVAdditions;
- (uint64_t)mr_allOutputDevices;
- (uint64_t)mr_arrayByRemovingLocalEndpoint;
- (uint64_t)mr_containsVideoOutputDevice;
- (uint64_t)mr_distantEndpoints;
- (uint64_t)mr_distantOutputDevices;
- (uint64_t)mr_isEqualToOutputDevicesArray:()MRAVAdditions;
- (uint64_t)mr_redactClusterMembers;
@end

@implementation NSArray(MRAVAdditions)

- (id)mr_replaceEndpointsWithEndpoints:()MRAVAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "uniqueIdentifier", (void)v16);
        v13 = [v4 objectForKeyedSubscript:v12];

        if (v13) {
          v14 = v13;
        }
        else {
          v14 = v11;
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)mr_distantEndpoints
{
  return objc_msgSend(a1, "msv_map:", &__block_literal_global_11_0);
}

- (uint64_t)mr_distantOutputDevices
{
  return objc_msgSend(a1, "msv_map:", &__block_literal_global_14_0);
}

- (id)mr_replaceOutputDevicesWithOutputDevices:()MRAVAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "uid", (void)v16);
        v13 = [v4 objectForKeyedSubscript:v12];

        if (v13) {
          v14 = v13;
        }
        else {
          v14 = v11;
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)mr_containsVideoOutputDevice
{
  return objc_msgSend(a1, "mr_any:", &__block_literal_global_17_1);
}

- (uint64_t)mr_allOutputDevices
{
  return objc_msgSend(a1, "msv_flatMap:", &__block_literal_global_3_2);
}

- (uint64_t)mr_isEqualToOutputDevicesArray:()MRAVAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = NSStringFromSelector("uid");
  uint64_t v7 = [a1 valueForKeyPath:v6];
  uint64_t v8 = [v4 setWithArray:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = NSStringFromSelector("uid");
  v11 = [v5 valueForKeyPath:v10];

  v12 = [v9 setWithArray:v11];

  uint64_t v13 = [v8 isEqualToSet:v12];
  return v13;
}

- (uint64_t)mr_arrayByRemovingLocalEndpoint
{
  return objc_msgSend(a1, "mr_filter:", &__block_literal_global_65);
}

- (uint64_t)mr_redactClusterMembers
{
  return objc_msgSend(a1, "msv_map:", &__block_literal_global_7_0);
}

@end