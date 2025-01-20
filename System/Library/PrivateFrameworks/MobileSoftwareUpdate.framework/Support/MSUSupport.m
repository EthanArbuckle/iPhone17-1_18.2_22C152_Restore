@interface MSUSupport
+ (id)sharedSupport;
- (id)MSUSupportGetUpdateInfo:(id)a3 for:(id)a4;
@end

@implementation MSUSupport

+ (id)sharedSupport
{
  if (sharedSupport_onceToken != -1) {
    dispatch_once(&sharedSupport_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sGlobalMSUSupportObject;
  return v2;
}

void __27__MSUSupport_sharedSupport__block_invoke(id a1)
{
  sGlobalMSUSupportObject = objc_alloc_init(MSUSupport);
  _objc_release_x1();
}

- (id)MSUSupportGetUpdateInfo:(id)a3 for:(id)a4
{
  logfunction(", 1, @"MSUSupportGetUpdateInfo: not using USE_LIBPARTITION_2, no update information available.\n\n"", (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

@end