@interface INInteraction(MTUtilities)
- (void)mtSetIntentDonorFromSource:()MTUtilities;
@end

@implementation INInteraction(MTUtilities)

- (void)mtSetIntentDonorFromSource:()MTUtilities
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v5 processName];
    objc_msgSend(a1, "_setDonatedBySiri:", objc_msgSend(v4, "isEqualToString:", @"assistant_service"));
  }
}

@end