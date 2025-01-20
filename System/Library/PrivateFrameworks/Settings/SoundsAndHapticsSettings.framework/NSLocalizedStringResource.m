@interface NSLocalizedStringResource
@end

@implementation NSLocalizedStringResource

id __76___NSLocalizedStringResource_SHSNavigationComponents__shs_rootPaneComponent__block_invoke()
{
  if (_block_invoke_na_once_token_6 != -1) {
    dispatch_once(&_block_invoke_na_once_token_6, &__block_literal_global_3);
  }
  v0 = (void *)_block_invoke_na_once_object_6;
  return v0;
}

void __76___NSLocalizedStringResource_SHSNavigationComponents__shs_rootPaneComponent__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F08DB0]);
  if (MGGetBoolAnswer()) {
    v1 = @"SOUNDS_AND_HAPTICS";
  }
  else {
    v1 = @"Sounds";
  }
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  v2 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  v3 = [v2 bundleURL];
  uint64_t v4 = [v0 initWithKey:v1 table:@"Sounds" locale:v6 bundleURL:v3];
  v5 = (void *)_block_invoke_na_once_object_6;
  _block_invoke_na_once_object_6 = v4;
}

@end