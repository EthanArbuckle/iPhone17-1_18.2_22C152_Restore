@interface SDSUPreferences
+ (id)sharedInstance;
@end

@implementation SDSUPreferences

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SDSUPreferences_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_obj;
  return v2;
}

uint64_t __33__SDSUPreferences_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_obj = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end