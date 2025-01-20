@interface REMXPCStorageClasses
+ (id)remStorageClasses;
@end

@implementation REMXPCStorageClasses

+ (id)remStorageClasses
{
  if (remStorageClasses_onceToken != -1) {
    dispatch_once(&remStorageClasses_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)remStorageClasses___sResult;

  return v2;
}

uint64_t __41__REMXPCStorageClasses_remStorageClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  remStorageClasses___sResult = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

@end