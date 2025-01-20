@interface NPHSharedUtilities
+ (BOOL)isActiveDeviceTinker;
+ (BOOL)isActiveWatchChinaRegionCellular;
+ (BOOL)pairedDeviceHasHomeButton;
@end

@implementation NPHSharedUtilities

+ (BOOL)isActiveDeviceTinker
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F57700] activeDevice];
  int v3 = [v2 isTinker];

  v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[NPHSharedUtilities isActiveDeviceTinker]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s : %d", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

+ (BOOL)pairedDeviceHasHomeButton
{
  if (pairedDeviceHasHomeButton_onceToken != -1) {
    dispatch_once(&pairedDeviceHasHomeButton_onceToken, &__block_literal_global_132);
  }
  return pairedDeviceHasHomeButton_pairedDeviceHasHomeButton;
}

void __47__NPHSharedUtilities_pairedDeviceHasHomeButton__block_invoke()
{
  id v0 = [MEMORY[0x263F57700] activeDevice];
  pairedDeviceHasHomeButton_pairedDeviceHasHomeButton = [v0 hasHomeButton];
}

+ (BOOL)isActiveWatchChinaRegionCellular
{
  v2 = [MEMORY[0x263F57700] activeDevice];
  int v3 = [v2 valueForProperty:*MEMORY[0x263F57588]];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end