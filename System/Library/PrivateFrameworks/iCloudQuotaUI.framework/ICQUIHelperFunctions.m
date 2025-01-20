@interface ICQUIHelperFunctions
@end

@implementation ICQUIHelperFunctions

void __57___ICQUIHelperFunctions_addHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 allHTTPHeaderFields];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;

  [v9 addEntriesFromDictionary:v4];
  [*(id *)(a1 + 32) setAllHTTPHeaderFields:v9];
  v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "ams_DSID");

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      v15 = objc_msgSend(v12, "ams_DSID");
      v16 = [v15 stringValue];
      [v14 setValue:v16 forHTTPHeaderField:@"X-Apple-Itunes-DSID"];
    }
  }
  v17 = _ICQGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [*(id *)(a1 + 32) allHTTPHeaderFields];
    id v19 = [NSString alloc];
    v20 = [*(id *)(a1 + 32) HTTPBody];
    v21 = (void *)[v19 initWithData:v20 encoding:4];
    int v22 = 138412546;
    v23 = v18;
    __int16 v24 = 2112;
    v25 = v21;
    _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", (uint8_t *)&v22, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end