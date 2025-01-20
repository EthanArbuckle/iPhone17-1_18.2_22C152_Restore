@interface UIContentUnavailableConstants_Phone
+ (id)sharedConstants;
@end

@implementation UIContentUnavailableConstants_Phone

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_5;
  if (!sharedConstants___sharedConstants_5)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_5;
    sharedConstants___sharedConstants_5 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_5;
  }
  return v3;
}

@end