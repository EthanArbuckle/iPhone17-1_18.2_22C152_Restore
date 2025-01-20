@interface TUPSSimStatusCacheSoftLinking
+ (id)fetchSubscriptionsInUse;
@end

@implementation TUPSSimStatusCacheSoftLinking

+ (id)fetchSubscriptionsInUse
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "%@ fetching current CTXPCServiceSubscriptions in use", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getPSSimStatusCacheClass_softClass;
  uint64_t v12 = getPSSimStatusCacheClass_softClass;
  if (!getPSSimStatusCacheClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v14 = __getPSSimStatusCacheClass_block_invoke;
    v15 = &unk_1E58E5F90;
    v16 = &v9;
    __getPSSimStatusCacheClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  v6 = objc_msgSend(v5, "sharedInstance", v9);
  v7 = [v6 subscriptionsInUse];

  return v7;
}

@end