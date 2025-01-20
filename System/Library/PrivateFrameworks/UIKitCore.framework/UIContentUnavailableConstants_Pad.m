@interface UIContentUnavailableConstants_Pad
+ (id)sharedConstants;
@end

@implementation UIContentUnavailableConstants_Pad

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_96;
  if (!sharedConstants___sharedConstants_96)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_96;
    sharedConstants___sharedConstants_96 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_96;
  }
  return v3;
}

@end