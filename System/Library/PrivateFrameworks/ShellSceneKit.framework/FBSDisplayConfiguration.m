@interface FBSDisplayConfiguration
@end

@implementation FBSDisplayConfiguration

id __83__FBSDisplayConfiguration_SSKDisplayMonitorCallbackLogging___flbLoggingDescription__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) hardwareIdentifier];
  [v2 appendString:v3 withName:@"hardwareIdentifier"];

  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) identity];
  id v6 = (id)[v4 appendObject:v5 withName:@"identity"];

  v7 = *(void **)(a1 + 32);
  v8 = [*(id *)(a1 + 40) name];
  [v7 appendString:v8 withName:@"name"];

  v9 = *(void **)(a1 + 32);
  v10 = [*(id *)(a1 + 40) deviceName];
  [v9 appendString:v10 withName:@"deviceName"];

  v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(a1 + 40) CADisplay];
  id v13 = (id)[v11 appendObject:v12 withName:@"CADisplay"];

  v14 = *(void **)(a1 + 32);
  v15 = [*(id *)(a1 + 40) immutableCADisplay];
  id v16 = (id)[v14 appendObject:v15 withName:@"immutableCADisplay"];

  v17 = *(void **)(a1 + 32);
  v18 = [*(id *)(a1 + 40) currentMode];
  id v19 = (id)[v17 appendObject:v18 withName:@"currentMode"];

  v20 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  id v21 = (id)objc_msgSend(v20, "appendRect:withName:", @"bounds");
  v22 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) pixelSize];
  return (id)objc_msgSend(v22, "appendSize:withName:", @"pixelSize");
}

@end