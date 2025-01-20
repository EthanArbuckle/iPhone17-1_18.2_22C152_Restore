@interface SBDefaults
+ (id)externalDefaults;
+ (id)localDefaults;
@end

@implementation SBDefaults

+ (id)localDefaults
{
  if (localDefaults___once != -1) {
    dispatch_once(&localDefaults___once, &__block_literal_global_389);
  }
  v2 = (void *)localDefaults___instance;
  return v2;
}

void __27__SBDefaults_localDefaults__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA60A8]);
  v1 = (void *)localDefaults___instance;
  localDefaults___instance = (uint64_t)v0;
}

+ (id)externalDefaults
{
  if (externalDefaults___once != -1) {
    dispatch_once(&externalDefaults___once, &__block_literal_global_2_2);
  }
  v2 = (void *)externalDefaults___instance;
  return v2;
}

void __30__SBDefaults_externalDefaults__block_invoke()
{
  id v0 = objc_alloc_init(SBExternalDefaults);
  v1 = (void *)externalDefaults___instance;
  externalDefaults___instance = (uint64_t)v0;
}

@end