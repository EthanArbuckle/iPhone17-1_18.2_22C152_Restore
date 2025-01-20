@interface NSDate
@end

@implementation NSDate

void __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 48);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    objc_sync_exit(v3);
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    objc_sync_exit(v3);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  long long v14 = 0u;
  memset(__buf, 0, sizeof(__buf));
  LOBYTE(__buf[0]) = 35;
  int v2 = socket(2, 2, 17);
  if (v2 < 0)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    int v3 = v2;
    uint64_t v4 = objc_alloc_init(WBSScopeExitHandler);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_3;
    v11[3] = &__block_descriptor_36_e5_v8__0l;
    int v12 = v3;
    [(WBSScopeExitHandler *)v4 setHandler:v11];
    memset(&v10, 0, sizeof(v10));
    v10.ai_socktype = 2;
    v9 = 0;
    if (getaddrinfo("time-ios.apple.com", "123", &v10, &v9))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v6 = objc_alloc_init(WBSScopeExitHandler);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_4;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = v9;
      [(WBSScopeExitHandler *)v6 setHandler:v8];
      if (connect(v3, v9->ai_addr, 0x10u) < 0
        || write(v3, __buf, 0x30uLL) < 0
        || read(v3, __buf, 0x30uLL) < 0
        || (*((int8x8_t *)&v14 + 1) = vrev32_s8(*(int8x8_t *)((char *)&v14 + 8)), DWORD2(v14) <= 0xDC13357F))
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(DWORD2(v14) + 2085978496)];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

uint64_t __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_4(uint64_t a1)
{
}

uint64_t __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NSDate_WBSNSDateExtras__safari_filenameFormattedString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)safari_filenameFormattedString_dateFormatter;
  safari_filenameFormattedString_dateFormatter = (uint64_t)v0;

  int v2 = (void *)safari_filenameFormattedString_dateFormatter;
  return [v2 setDateFormat:@"yyyy.MM.dd_HH-mm-ssZZZ"];
}

@end