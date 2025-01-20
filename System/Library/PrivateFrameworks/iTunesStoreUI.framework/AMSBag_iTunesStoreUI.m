@interface AMSBag_iTunesStoreUI
- (AMSBagValue)appleMusicDeviceOfferDeepLink;
- (AMSBagValue)iCloudDeviceOfferDeepLink;
@end

@implementation AMSBag_iTunesStoreUI

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F894B0]);
  v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v4 = (void *)[v2 initWithBagContext:v3];

  [v4 start];
  v5 = [v4 URLBag];
  if (!v5)
  {
    v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)v17 = 138543618;
      *(void *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[AMSBag_iTunesStoreUI appleMusicDeviceOfferDeepLink]";
      id v10 = *(id *)&v17[4];
      LODWORD(v16) = 22;
      v15 = v17;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
      free(v11);
      v15 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v12 = objc_msgSend(v5, "valueForKey:", @"appleMusicDeviceOfferDeepLink", v15);
  v13 = [MEMORY[0x263F27B48] frozenBagValueWithKey:@"appleMusicDeviceOfferDeepLink" value:v12 valueType:5];

  return (AMSBagValue *)v13;
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F894B0]);
  v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v4 = (void *)[v2 initWithBagContext:v3];

  [v4 start];
  v5 = [v4 URLBag];
  if (!v5)
  {
    v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)v17 = 138543618;
      *(void *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[AMSBag_iTunesStoreUI iCloudDeviceOfferDeepLink]";
      id v10 = *(id *)&v17[4];
      LODWORD(v16) = 22;
      v15 = v17;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
      free(v11);
      v15 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v12 = objc_msgSend(v5, "valueForKey:", @"iCloudDeviceOfferDeepLink", v15);
  v13 = [MEMORY[0x263F27B48] frozenBagValueWithKey:@"iCloudDeviceOfferDeepLink" value:v12 valueType:5];

  return (AMSBagValue *)v13;
}

@end