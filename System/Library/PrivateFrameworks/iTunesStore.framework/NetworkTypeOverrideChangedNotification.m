@interface NetworkTypeOverrideChangedNotification
@end

@implementation NetworkTypeOverrideChangedNotification

uint64_t ____NetworkTypeOverrideChangedNotification_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2) {
    v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v9 = 138412290;
    uint64_t v10 = objc_opt_class();
    LODWORD(v8) = 12;
    uint64_t v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v9, v8);
      free(v6);
      SSFileLog();
    }
  }
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F7BDC8]);
  return [*(id *)(a1 + 32) _reloadNetworkType];
}

@end