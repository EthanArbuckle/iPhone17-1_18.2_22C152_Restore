@interface UIContentUnavailableConstants_CarPlay
+ (id)sharedConstants;
@end

@implementation UIContentUnavailableConstants_CarPlay

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_114;
  if (!sharedConstants___sharedConstants_114)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_114;
    sharedConstants___sharedConstants_114 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_114;
  }
  return v3;
}

@end