@interface SBIN_FCActivityManager
+ (id)sharedActivityManager;
@end

@implementation SBIN_FCActivityManager

+ (id)sharedActivityManager
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getFCActivityManagerClass_softClass;
  uint64_t v10 = getFCActivityManagerClass_softClass;
  if (!getFCActivityManagerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getFCActivityManagerClass_block_invoke;
    v6[3] = &unk_265525998;
    v6[4] = &v7;
    __getFCActivityManagerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 sharedActivityManager];
  return v4;
}

@end