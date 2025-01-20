@interface REExportedNullValue
+ (id)sharedInstance;
- (unint64_t)type;
@end

@implementation REExportedNullValue

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_32);
  }
  v2 = (void *)sharedInstance_Null;
  return v2;
}

uint64_t __37__REExportedNullValue_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(REExportedNullValue);
  uint64_t v1 = sharedInstance_Null;
  sharedInstance_Null = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (unint64_t)type
{
  return 6;
}

@end