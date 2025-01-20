@interface REMSystemUtilities
+ (BOOL)isInternalInstall;
+ (id)systemBuildVersion;
+ (id)systemVersionDictionary;
@end

@implementation REMSystemUtilities

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_30);
  }
  return isInternalInstall_isInternalBuild;
}

uint64_t __39__REMSystemUtilities_isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalInstall_isInternalBuild = result;
  return result;
}

+ (id)systemVersionDictionary
{
  v2 = (void *)_CFCopyServerVersionDictionary();
  if (!v2) {
    v2 = (void *)_CFCopySystemVersionDictionary();
  }

  return v2;
}

+ (id)systemBuildVersion
{
  v2 = [a1 systemVersionDictionary];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];

  return v3;
}

@end