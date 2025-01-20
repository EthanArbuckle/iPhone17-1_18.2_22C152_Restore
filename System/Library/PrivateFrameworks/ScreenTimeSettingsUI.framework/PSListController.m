@interface PSListController
@end

@implementation PSListController

uint64_t __46__PSListController_PIN__st_sharedPINSpecifier__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"PIN", 0, 0, 0, 0, -1, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v1 = (void *)st_sharedPINSpecifier_specifier;
  st_sharedPINSpecifier_specifier = v0;

  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  [(id)st_sharedPINSpecifier_specifier setObject:v3 forKeyedSubscript:*MEMORY[0x263F60228]];

  [(id)st_sharedPINSpecifier_specifier setObject:&unk_26D967198 forKeyedSubscript:*MEMORY[0x263F60320]];
  v4 = (void *)st_sharedPINSpecifier_specifier;
  uint64_t v5 = MEMORY[0x263EFFA88];

  return [v4 setObject:v5 forKeyedSubscript:0x26D940308];
}

void __46__PSListController_PIN__st_didAcceptRemovePIN__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = [WeakRetained coordinator];
    [v12 setHasAlreadyEnteredPINForSession:0];
  }
}

void __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = [WeakRetained coordinator];
    [v12 setHasAlreadyEnteredPINForSession:0];
  }
}

void __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end