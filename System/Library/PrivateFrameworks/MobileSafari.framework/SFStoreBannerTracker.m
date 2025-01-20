@interface SFStoreBannerTracker
+ (id)sharedTracker;
- (BOOL)canUpdateProductID:(id)a3 forHost:(id)a4 time:(id)a5;
- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4;
- (id)categoryName;
- (int64_t)basis;
- (void)blockProductBanner:(id)a3;
- (void)isProductBannerBlocked:(id)a3 forHost:(id)a4 completion:(id)a5;
@end

@implementation SFStoreBannerTracker

- (id)categoryName
{
  return @"StoreBannerTracker";
}

void __37__SFStoreBannerTracker_sharedTracker__block_invoke()
{
  v0 = objc_alloc_init(SFStoreBannerTracker);
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;
}

+ (id)sharedTracker
{
  if (sharedTracker_once != -1) {
    dispatch_once(&sharedTracker_once, &__block_literal_global_23);
  }
  v2 = (void *)sharedTracker_sharedTracker;

  return v2;
}

- (int64_t)basis
{
  return 1;
}

- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  if (a4 != 1) {
    return 1;
  }
  v4 = (objc_class *)MEMORY[0x1E4F223C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 integerValue];

  v8 = (void *)[v6 initWithStoreItemIdentifier:v7 error:0];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 applicationState];
    if ([v10 isInstalled]) {
      char v11 = [v10 isRestricted];
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)isProductBannerBlocked:(id)a3 forHost:(id)a4 completion:(id)a5
{
  id v14 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a4;
  char v11 = [v9 now];
  BOOL v12 = [(SFStoreBannerTracker *)self canUpdateProductID:v14 forHost:v10 time:v11];

  if (v12)
  {
    v13 = [v14 stringValue];
    [(WBSBannerTracker *)self isBannerBlockedForIdentifier:v13 completion:v8];
  }
  else
  {
    v8[2](v8, 1);
  }
}

- (void)blockProductBanner:(id)a3
{
  id v4 = [a3 stringValue];
  [(WBSBannerTracker *)self blockBannerForIdentifier:v4];
}

- (BOOL)canUpdateProductID:(id)a3 forHost:(id)a4 time:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  hostToBannerRecordMap = self->_hostToBannerRecordMap;
  if (!hostToBannerRecordMap)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = self->_hostToBannerRecordMap;
    self->_hostToBannerRecordMap = v12;

    hostToBannerRecordMap = self->_hostToBannerRecordMap;
  }
  id v14 = [(NSMutableDictionary *)hostToBannerRecordMap objectForKeyedSubscript:v9];
  if (v14)
  {
    v15 = v14;
    char v16 = [(SFBannerRecord *)v14 updateProductID:v8 time:v10];
  }
  else
  {
    v15 = [[SFBannerRecord alloc] initWithProductID:v8 time:v10];
    [(NSMutableDictionary *)self->_hostToBannerRecordMap setObject:v15 forKeyedSubscript:v9];
    char v16 = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end