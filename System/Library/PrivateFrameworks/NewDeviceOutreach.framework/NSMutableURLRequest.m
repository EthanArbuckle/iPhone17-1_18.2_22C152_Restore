@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

void __112__NSMutableURLRequest_AccountHeaders__ndo_setDeviceListRequestBodyWithSerialNumber_localDevices_primaryAccount___block_invoke(uint64_t a1, void *a2)
{
  v11[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v10[0] = @"serialNumber";
  v4 = [v3 serialNumber];
  v11[0] = v4;
  v10[1] = @"modelInfo";
  v5 = [v3 productID];
  v11[1] = v5;
  v10[2] = @"deviceName";
  v6 = [v3 name];
  v11[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  if ([v3 colorCode])
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v3, "colorCode"));
    [v8 setObject:v9 forKeyedSubscript:@"color"];

    v7 = v8;
  }
  [*(id *)(a1 + 32) addObject:v7];
}

void __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke_cold_1((uint64_t)v5, a2, v6);
    }
  }
  else
  {
    v7 = [*(id *)(a1 + 32) credentialForAccount:*(void *)(a1 + 40) serviceID:@"com.apple.gs.supportapp.auth"];
    uint64_t v8 = [v7 token];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  if (v4)
  {
    id v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "No way to sign request with GS token because renewal of GS credential failed: %ld, %@", (uint8_t *)&v3, 0x16u);
}

void __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end