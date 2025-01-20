@interface NSUbiquitousKeyValueStore(SBKnownKeyFiltering)
+ (void)load;
- (void)sb_setObject:()SBKnownKeyFiltering forKey:;
@end

@implementation NSUbiquitousKeyValueStore(SBKnownKeyFiltering)

+ (void)load
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NSUbiquitousKeyValueStore_SBKnownKeyFiltering__load__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (load_onceToken != -1) {
    dispatch_once(&load_onceToken, block);
  }
}

- (void)sb_setObject:()SBKnownKeyFiltering forKey:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F29130] defaultStore];

  if (v8 == a1)
  {
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NSUbiquitousKeyValueStore(SBKnownKeyFiltering) sb_setObject:forKey:]((uint64_t)v7, v9);
    }
  }
  objc_msgSend(a1, "sb_setObject:forKey:", v6, v7);
}

- (void)sb_setObject:()SBKnownKeyFiltering forKey:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "NSUbiquitousKeyValueStore setObject: with invalid key: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end