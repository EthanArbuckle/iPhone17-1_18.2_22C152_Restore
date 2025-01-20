@interface AMSBag(Quota)
+ (id)quotaBag;
@end

@implementation AMSBag(Quota)

+ (id)quotaBag
{
  if (quotaBag_onceToken != -1) {
    dispatch_once(&quotaBag_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)quotaBag_quotaBag;
  return v0;
}

@end