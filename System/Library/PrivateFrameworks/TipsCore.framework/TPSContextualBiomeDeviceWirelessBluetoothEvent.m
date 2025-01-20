@interface TPSContextualBiomeDeviceWirelessBluetoothEvent
- (id)_filteringPredicate;
- (id)filterHandler;
- (id)filterParametersForBiomeQuery;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation TPSContextualBiomeDeviceWirelessBluetoothEvent

- (id)publisherFromStartTime:(double)a3
{
  v4 = BiomeLibrary();
  v5 = [v4 Device];
  v6 = [v5 Wireless];
  v7 = [v6 Bluetooth];

  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v9 = objc_alloc(MEMORY[0x1E4F503E8]);
  v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = (void *)[v9 initWithStartDate:v8 endDate:v10 maxEvents:0 lastN:0 reversed:0];

  v12 = [v7 publisherWithUseCase:@"FeatureDiscoverability" options:v11];

  return v12;
}

- (id)filterHandler
{
  v2 = [(TPSContextualBiomeDeviceWirelessBluetoothEvent *)self _filteringPredicate];
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__TPSContextualBiomeDeviceWirelessBluetoothEvent_filterHandler__block_invoke;
    aBlock[3] = &unk_1E5906CF8;
    id v7 = v2;
    v4 = _Block_copy(aBlock);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __63__TPSContextualBiomeDeviceWirelessBluetoothEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) evaluateWithObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)filterParametersForBiomeQuery
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    v30.receiver = self;
    v30.super_class = (Class)TPSContextualBiomeDeviceWirelessBluetoothEvent;
    uint64_t v4 = [(TPSContextualBiomeEvent *)&v30 filterParametersForBiomeQuery];
    v5 = (void *)[v4 mutableCopy];
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    id v9 = v7;

    v10 = [(TPSContextualBiomeEvent *)self filterInfo];
    v11 = [v10 TPSSafeObjectForKey:@"appleAudioDevice"];

    if (v11)
    {
      v12 = NSNumber;
      v13 = [(TPSContextualBiomeEvent *)self filterInfo];
      v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "TPSSafeBoolForKey:", @"appleAudioDevice"));
      [v9 setObject:v14 forKeyedSubscript:@"appleAudioDevice"];
    }
    v15 = [(TPSContextualBiomeEvent *)self filterInfo];
    v16 = [v15 TPSSafeObjectForKey:@"deviceType"];

    if (v16)
    {
      v17 = NSNumber;
      v18 = [(TPSContextualBiomeEvent *)self filterInfo];
      v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "TPSSafeIntForKey:", @"deviceType"));
      [v9 setObject:v19 forKeyedSubscript:@"deviceType"];
    }
    v20 = [(TPSContextualBiomeEvent *)self filterInfo];
    v21 = [v20 TPSSafeObjectForKey:@"productIDs"];

    if (v21)
    {
      v22 = [(TPSContextualBiomeEvent *)self filterInfo];
      v23 = [v22 TPSSafeArrayForKey:@"productIDs"];
      [v9 setObject:v23 forKeyedSubscript:@"productID"];
    }
    v24 = [(TPSContextualBiomeEvent *)self filterInfo];
    v25 = [v24 TPSSafeObjectForKey:@"userWearing"];

    if (v25)
    {
      v26 = NSNumber;
      v27 = [(TPSContextualBiomeEvent *)self filterInfo];
      v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "TPSSafeBoolForKey:", @"userWearing"));
      [v9 setObject:v28 forKeyedSubscript:@"userWearing"];
    }
    v8 = (void *)[v9 copy];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_filteringPredicate
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(TPSContextualBiomeEvent *)self filterInfo];
    v6 = [v5 TPSSafeObjectForKey:@"appleAudioDevice"];

    if (v6)
    {
      id v7 = [(TPSContextualBiomeEvent *)self filterInfo];
      char v8 = [v7 TPSSafeBoolForKey:@"appleAudioDevice"];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke;
      v34[3] = &__block_descriptor_33_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
      char v35 = v8;
      id v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v34];
      [v4 addObject:v9];
    }
    v10 = [(TPSContextualBiomeEvent *)self filterInfo];
    v11 = [v10 TPSSafeObjectForKey:@"deviceType"];

    if (v11)
    {
      v12 = [(TPSContextualBiomeEvent *)self filterInfo];
      uint64_t v13 = (int)[v12 TPSSafeIntForKey:@"deviceType"];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_2;
      v33[3] = &__block_descriptor_40_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
      v33[4] = v13;
      v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:v33];
      [v4 addObject:v14];
    }
    v15 = [(TPSContextualBiomeEvent *)self filterInfo];
    v16 = [v15 TPSSafeObjectForKey:@"productIDs"];

    if (v16)
    {
      v17 = [(TPSContextualBiomeEvent *)self filterInfo];
      v18 = [v17 TPSSafeArrayForKey:@"productIDs"];

      v19 = (void *)MEMORY[0x1E4F28F60];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_3;
      v31[3] = &unk_1E5906D60;
      id v32 = v18;
      id v20 = v18;
      v21 = [v19 predicateWithBlock:v31];
      [v4 addObject:v21];
    }
    v22 = [(TPSContextualBiomeEvent *)self filterInfo];
    v23 = [v22 TPSSafeObjectForKey:@"userWearing"];

    if (v23)
    {
      v24 = [(TPSContextualBiomeEvent *)self filterInfo];
      char v25 = [v24 TPSSafeBoolForKey:@"userWearing"];

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_4;
      v29[3] = &__block_descriptor_33_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
      char v30 = v25;
      v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:v29];
      [v4 addObject:v26];
    }
    if ([v4 count])
    {
      v27 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  return v27;
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == [a2 appleAudioDevice];
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 deviceType];
}

uint64_t __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "productID"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == [a2 userWearing];
}

@end