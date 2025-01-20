@interface NTKGreenfieldSystemAppDeprecatedMappings
+ (BOOL)isSystemAppDeprecatedBundleId:(id)a3 itemId:(id)a4;
@end

@implementation NTKGreenfieldSystemAppDeprecatedMappings

+ (BOOL)isSystemAppDeprecatedBundleId:(id)a3 itemId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (isSystemAppDeprecatedBundleId_itemId__onceToken != -1) {
    dispatch_once(&isSystemAppDeprecatedBundleId_itemId__onceToken, &__block_literal_global_41);
  }
  v7 = [(id)isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping objectForKey:v5];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 longValue];
    BOOL v10 = v9 == [v6 longValue];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __81__NTKGreenfieldSystemAppDeprecatedMappings_isSystemAppDeprecatedBundleId_itemId___block_invoke()
{
  v0 = (void *)isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping = (uint64_t)&unk_1F16E8890;
}

@end