@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

void __60__NSMutableURLRequest_ICQ__icq_sanitizedHeadersForDynamicUI__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8 = a2;
  id v5 = a3;
  if ([(__CFString *)v8 isEqualToString:@"Authorization"])
  {
    v6 = @"Authorization-iCloud";
    id v7 = v5;
  }
  else
  {
    id v7 = v5;
    v6 = v8;
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 allHTTPHeaderFields];
  v6 = (void *)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  [*(id *)(a1 + 32) setAllHTTPHeaderFields:v6];
  id v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "ams_DSID");

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v12 = objc_msgSend(v9, "ams_DSID");
      v13 = [v12 stringValue];
      [v11 setValue:v13 forHTTPHeaderField:@"X-Apple-Itunes-DSID"];
    }
  }
  if (+[_ICQHelperFunctions defaultKeyExists:@"_ICQPlaceholderResponse"])
  {
    [*(id *)(a1 + 32) setValue:@"true" forHTTPHeaderField:@"x-apple-placeholderReplacement-simulate"];
  }
  if (+[_ICQHelperFunctions defaultKeyExists:@"EnableBundles"])
  {
    [*(id *)(a1 + 32) setValue:@"default" forHTTPHeaderField:@"x-apple-bundleoffer-simulate"];
  }
  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [*(id *)(a1 + 32) allHTTPHeaderFields];
    id v16 = [NSString alloc];
    v17 = [*(id *)(a1 + 32) HTTPBody];
    v18 = (void *)[v16 initWithData:v17 encoding:4];
    *(_DWORD *)buf = 138412546;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", buf, 0x16u);
  }
  v19 = _ICQGetLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_cold_1(v19);
  }

  v20 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_32;
  v21[3] = &unk_1E6A536D8;
  v21[4] = v20;
  id v22 = *(id *)(a1 + 40);
  objc_msgSend(v20, "icq_renewAuthorizationHeadersForAccount:store:completion:", 0, 0, v21);
}

uint64_t __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_32(uint64_t a1, char a2)
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_32_cold_1(a2, a1, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__NSMutableURLRequest_ICQ__icq_renewAuthorizationHeadersForAccount_store_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    v10 = "-[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "%s renew credentials returned with result %lu, error %@", (uint8_t *)&v9, 0x20u);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", *(void *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "ak_addClientInfoHeader");
  }
  int v7 = objc_msgSend(*(id *)(a1 + 32), "icq_hasAuthHeaders");
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 67109120;
    LODWORD(v10) = v7;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "validateAuthorizationHeaders completed renew credentials with success: %d", (uint8_t *)&v9, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "Validating auth headers", v1, 2u);
}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_32_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "Auth headers validated with success: %d request: %@", (uint8_t *)v4, 0x12u);
}

@end