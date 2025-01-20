@interface ISSetApplicationBadgeOperation
- (NSString)badgeValue;
- (NSString)bundleIdentifier;
- (id)uniqueKey;
- (void)run;
- (void)setBadgeValue:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation ISSetApplicationBadgeOperation

- (void)run
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(ISSetApplicationBadgeOperation *)self bundleIdentifier];
  v4 = [(ISSetApplicationBadgeOperation *)self badgeValue];
  if (v3)
  {
    v5 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5)
    {
      v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      *(_DWORD *)v13 = 138412802;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v3;
      *(_WORD *)&v13[22] = 2112;
      v14 = v4;
      id v9 = *(id *)&v13[4];
      LODWORD(v12) = 32;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        v11 = [MEMORY[0x263F3F808] sharedService];
        [v11 setBadgeValue:v4 forBundleID:v3];

        [(ISOperation *)self setSuccess:1];
        goto LABEL_14;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16], v14);
      free(v10);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)uniqueKey
{
  return @"com.apple.iTunesStore.set-app-badge";
}

- (NSString)badgeValue
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBadgeValue:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_badgeValue, 0);
}

@end