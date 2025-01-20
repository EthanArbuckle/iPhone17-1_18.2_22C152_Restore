@interface W5BluetoothStatus(Strings)
- (id)dictionary;
@end

@implementation W5BluetoothStatus(Strings)

- (id)dictionary
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v3 = objc_msgSend(a1, "devices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v8 += [v11 isConnected];
        v6 += [v11 isPaired];
        v7 += [v11 isCloudPaired];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  v12 = [NSNumber numberWithUnsignedInteger:v8];
  [v2 setValue:v12 forKey:@"bt_connected_devices_count"];

  v13 = [NSNumber numberWithUnsignedInteger:v6];
  [v2 setValue:v13 forKey:@"bt_paired_devices_count"];

  v14 = [NSNumber numberWithUnsignedInteger:v7];
  [v2 setValue:v14 forKey:@"bt_cloud_paired_devices_count"];

  v15 = NSNumber;
  v16 = [a1 devices];
  v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  [v2 setValue:v17 forKey:@"bt_devices_count"];

  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "powerOn"));
  [v2 setValue:v18 forKey:@"bt_is_power_on"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isConnectable"));
  [v2 setValue:v19 forKey:@"bt_is_connectable"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isDiscoverable"));
  [v2 setValue:v20 forKey:@"bt_is_discoverable"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isScanning"));
  [v2 setValue:v21 forKey:@"bt_is_scanning"];

  v22 = [a1 address];

  if (v22)
  {
    v23 = [a1 address];
    [v2 setValue:v23 forKey:@"bt_address"];
  }
  v24 = [NSDictionary dictionaryWithDictionary:v2];

  return v24;
}

@end