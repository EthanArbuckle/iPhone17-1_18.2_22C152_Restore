@interface InstallPassSettingsChangedObserverIfNecessary
@end

@implementation InstallPassSettingsChangedObserverIfNecessary

void ___InstallPassSettingsChangedObserverIfNecessary_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v0 = (id)[v1 addObserverForName:@"PKPassSettingsDidChangeNotification" object:0 queue:0 usingBlock:&__block_literal_global_680];
}

void ___InstallPassSettingsChangedObserverIfNecessary_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  id v5 = [v2 defaultCenter];
  v4 = [v3 userInfo];

  [v5 postNotificationName:@"PKPassSettingsDidChangeNotification" object:0 userInfo:v4];
}

@end