@interface PPConnectionsDonationStore
+ (id)defaultStore;
- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4;
@end

@implementation PPConnectionsDonationStore

- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = +[PPConnectionsDuetSource sharedInstance];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F89DB8]) initWithLocationField:1 bundleIdentifier:0];
  v7 = objc_opt_new();
  LOWORD(v10) = 1;
  v8 = objc_msgSend(v5, "locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:", v6, v4, v7, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0, v10, 0);

  return v8;
}

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken2 != -1) {
    dispatch_once(&defaultStore__pasOnceToken2, &__block_literal_global_2878);
  }
  v2 = (void *)defaultStore__pasExprOnceResult;
  return v2;
}

void __42__PPConnectionsDonationStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult;
  defaultStore__pasExprOnceResult = v1;
}

@end