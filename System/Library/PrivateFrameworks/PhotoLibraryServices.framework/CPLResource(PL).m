@interface CPLResource(PL)
+ (id)imageDerivativeTypes;
+ (id)videoDerivativeTypes;
- (uint64_t)deleteAfterUpload;
- (void)setDeleteAfterUpload:()PL;
@end

@implementation CPLResource(PL)

- (uint64_t)deleteAfterUpload
{
  v1 = objc_getAssociatedObject(a1, @"deleteAfterUpload");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setDeleteAfterUpload:()PL
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"deleteAfterUpload", v2, (void *)1);
}

+ (id)imageDerivativeTypes
{
  if (imageDerivativeTypes_s_onceToken != -1) {
    dispatch_once(&imageDerivativeTypes_s_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)imageDerivativeTypes_s_types;
  return v0;
}

+ (id)videoDerivativeTypes
{
  if (videoDerivativeTypes_s_onceToken != -1) {
    dispatch_once(&videoDerivativeTypes_s_onceToken, &__block_literal_global_75346);
  }
  v0 = (void *)videoDerivativeTypes_s_types;
  return v0;
}

@end