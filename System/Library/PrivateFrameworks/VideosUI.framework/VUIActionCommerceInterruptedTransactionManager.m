@interface VUIActionCommerceInterruptedTransactionManager
+ (id)sharedInstance;
- (id)getLastInterruptedOfferDetails;
- (void)setLastInterruptedOfferDetails:(id)a3;
@end

@implementation VUIActionCommerceInterruptedTransactionManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VUIActionCommerceInterruptedTransactionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_35 != -1) {
    dispatch_once(&sharedInstance_onceToken_35, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_5;
  return v2;
}

void __64__VUIActionCommerceInterruptedTransactionManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_5;
  sharedInstance___sharedInstance_5 = (uint64_t)v1;
}

- (id)getLastInterruptedOfferDetails
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->interruptedOfferDetails;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLastInterruptedOfferDetails:(id)a3
{
  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  interruptedOfferDetails = obj->interruptedOfferDetails;
  obj->interruptedOfferDetails = v4;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
}

@end