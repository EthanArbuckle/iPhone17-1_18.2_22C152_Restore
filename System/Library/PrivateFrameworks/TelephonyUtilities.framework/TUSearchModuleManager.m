@interface TUSearchModuleManager
+ (NSArray)recentsModuleClasses;
+ (NSArray)searchModuleClasses;
@end

@implementation TUSearchModuleManager

+ (NSArray)recentsModuleClasses
{
  if (recentsModuleClasses_onceToken != -1) {
    dispatch_once(&recentsModuleClasses_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)recentsModuleClasses_sRecentClasses;

  return (NSArray *)v2;
}

void __45__TUSearchModuleManager_recentsModuleClasses__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)recentsModuleClasses_sRecentClasses;
  recentsModuleClasses_sRecentClasses = v0;
}

+ (NSArray)searchModuleClasses
{
  if (searchModuleClasses_onceToken != -1) {
    dispatch_once(&searchModuleClasses_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)searchModuleClasses_sSearchClasses;

  return (NSArray *)v2;
}

void __44__TUSearchModuleManager_searchModuleClasses__block_invoke()
{
  void v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)searchModuleClasses_sSearchClasses;
  searchModuleClasses_sSearchClasses = v0;
}

@end