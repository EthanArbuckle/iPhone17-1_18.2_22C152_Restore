@interface NSLocalizedStringResource
@end

@implementation NSLocalizedStringResource

id __84___NSLocalizedStringResource_GeneralNavigationComponents__general_rootPaneComponent__block_invoke()
{
  if (_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0, &__block_literal_global_3);
  }
  v0 = (void *)_block_invoke_na_once_object_0;
  return v0;
}

void __84___NSLocalizedStringResource_GeneralNavigationComponents__general_rootPaneComponent__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F08DB0]);
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  v1 = PSG_BundleForGeneralSettingsUIFramework();
  v2 = [v1 bundleURL];
  uint64_t v3 = [v0 initWithKey:@"General" table:@"General" locale:v5 bundleURL:v2];
  v4 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = v3;
}

id __85___NSLocalizedStringResource_GeneralNavigationComponents__general_aboutPaneComponent__block_invoke()
{
  if (_block_invoke_2_na_once_token_1 != -1) {
    dispatch_once(&_block_invoke_2_na_once_token_1, &__block_literal_global_9);
  }
  id v0 = (void *)_block_invoke_2_na_once_object_1;
  return v0;
}

void __85___NSLocalizedStringResource_GeneralNavigationComponents__general_aboutPaneComponent__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F08DB0]);
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  v1 = PSG_BundleForGeneralSettingsUIFramework();
  v2 = [v1 bundleURL];
  uint64_t v3 = [v0 initWithKey:@"About" table:@"General" locale:v5 bundleURL:v2];
  v4 = (void *)_block_invoke_2_na_once_object_1;
  _block_invoke_2_na_once_object_1 = v3;
}

@end