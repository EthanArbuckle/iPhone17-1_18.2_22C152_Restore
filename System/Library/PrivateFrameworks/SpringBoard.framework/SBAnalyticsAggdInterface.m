@interface SBAnalyticsAggdInterface
+ (id)sharedInstance;
- (void)addValue:(int64_t)a3 forScalarKey:(id)a4;
- (void)setValue:(int64_t)a3 forScalarKey:(id)a4;
@end

@implementation SBAnalyticsAggdInterface

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_40 != -1) {
    dispatch_once(&sharedInstance_onceToken_40, &__block_literal_global_280);
  }
  v2 = (void *)sharedInstance___interface;
  return v2;
}

void __42__SBAnalyticsAggdInterface_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAnalyticsAggdInterface);
  v1 = (void *)sharedInstance___interface;
  sharedInstance___interface = (uint64_t)v0;
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
}

- (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
}

@end