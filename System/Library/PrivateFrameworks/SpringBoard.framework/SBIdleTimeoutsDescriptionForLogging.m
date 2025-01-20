@interface SBIdleTimeoutsDescriptionForLogging
@end

@implementation SBIdleTimeoutsDescriptionForLogging

id ___SBIdleTimeoutsDescriptionForLogging_block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v4, "identifier"), 0);
  v6 = *(void **)(a1 + 32);
  [v4 duration];
  double v8 = v7;

  return (id)[v6 appendDouble:0 withName:2 decimalPrecision:v8];
}

@end