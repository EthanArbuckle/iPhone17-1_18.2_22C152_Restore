@interface PSListController(PIN)
+ (id)st_sharedPINSpecifier;
- (BOOL)st_shouldShowPINSheetForSpecifier:()PIN;
- (uint64_t)st_shouldShowPINSheetForPINSpecifier;
- (uint64_t)st_validatePIN:()PIN forPINController:;
- (void)st_devicePINController:()PIN didAcceptChangedPIN:;
- (void)st_devicePINController:()PIN didAcceptSetPIN:;
- (void)st_devicePINControllerDidDismissPINPane:()PIN;
- (void)st_didAcceptEnteredPIN:()PIN;
- (void)st_didAcceptRemovePIN;
- (void)st_didCancelEnteringPIN;
- (void)st_showPINSheet:()PIN completion:;
- (void)st_showPINSheetWithCompletion:()PIN;
@end

@implementation PSListController(PIN)

+ (id)st_sharedPINSpecifier
{
  if (st_sharedPINSpecifier_oneTime != -1) {
    dispatch_once(&st_sharedPINSpecifier_oneTime, &__block_literal_global_14);
  }
  v0 = (void *)st_sharedPINSpecifier_specifier;

  return v0;
}

- (uint64_t)st_shouldShowPINSheetForPINSpecifier
{
  v2 = objc_msgSend(MEMORY[0x263F5FBC0], "st_sharedPINSpecifier");
  uint64_t v3 = objc_msgSend(a1, "st_shouldShowPINSheetForSpecifier:", v2);

  return v3;
}

- (BOOL)st_shouldShowPINSheetForSpecifier:()PIN
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60228]];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    v10 = [v5 objectForKeyedSubscript:0x26D940308];
    int v11 = [v10 BOOLValue];

    v12 = [v5 objectForKeyedSubscript:0x26D940328];
    char v13 = [v12 BOOLValue];

    v14 = [a1 coordinator];
    v15 = v14;
    BOOL v16 = (v13 & 1) == 0
       && (!v11
        || [v14 isPasscodeEnabled]
        && ([v15 hasAlreadyEnteredPINForSession] & 1) == 0);
  }
  else
  {
LABEL_8:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)st_showPINSheetWithCompletion:()PIN
{
  id v4 = (void *)MEMORY[0x263F5FBC0];
  id v5 = a3;
  objc_msgSend(v4, "st_sharedPINSpecifier");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "st_showPINSheet:completion:", v6, v5);
}

- (void)st_showPINSheet:()PIN completion:
{
  id v7 = a3;
  if (a4)
  {
    id v6 = _Block_copy(a4);
    [v7 setObject:v6 forKeyedSubscript:0x26D93FF08];
  }
  [a1 showPINSheet:v7];
}

- (uint64_t)st_validatePIN:()PIN forPINController:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 specifier];
  int v9 = [v8 objectForKeyedSubscript:0x26D93FEE8];

  if (v9)
  {
    uint64_t v10 = ((uint64_t (**)(void, id, id))v9)[2](v9, v7, v6);
  }
  else
  {
    int v11 = [a1 coordinator];
    uint64_t v10 = [v11 validatePIN:v6];
  }
  return v10;
}

- (void)st_didAcceptEnteredPIN:()PIN
{
  v2 = [a1 presentedViewController];
  id v8 = [v2 specifier];

  uint64_t v3 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60228]];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    id v7 = [a1 coordinator];
    [v7 setHasAlreadyEnteredPINForSession:1];
  }
}

- (void)st_didCancelEnteringPIN
{
  [a1 setShowingSetupController:0];
  [a1 setPendingURLResourceDictionary:0];
  [a1 setSpecifierIDPendingPush:0];
  v2 = [a1 presentedViewController];
  id v5 = [v2 specifier];

  uint64_t v3 = [v5 objectForKeyedSubscript:0x26D940348];
  int v4 = [v3 BOOLValue];

  if (v4) {
    [a1 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)st_didAcceptRemovePIN
{
  objc_initWeak(&location, val);
  v2 = [val coordinator];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__PSListController_PIN__st_didAcceptRemovePIN__block_invoke;
  v3[3] = &unk_2647681E0;
  objc_copyWeak(&v4, &location);
  [v2 setPIN:0 recoveryAltDSID:0 completionHandler:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)st_devicePINController:()PIN didAcceptSetPIN:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 specifier];
  int v9 = [v8 objectForKeyedSubscript:0x26D93FEA8];

  if (v9)
  {
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    id v10 = objc_initWeak(&location, a1);
    int v11 = [a1 coordinator];
    [v11 setPIN:v7 completionHandler:&__block_literal_global_8];

    objc_destroyWeak(&location);
  }
}

- (void)st_devicePINController:()PIN didAcceptChangedPIN:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 specifier];
  int v9 = [v8 objectForKeyedSubscript:0x26D93FEC8];

  if (v9)
  {
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    id v10 = objc_initWeak(&location, a1);
    int v11 = [a1 coordinator];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke;
    v12[3] = &unk_2647681E0;
    objc_copyWeak(&v13, &location);
    [v11 setPIN:v7 completionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)st_devicePINControllerDidDismissPINPane:()PIN
{
  id v4 = a3;
  [a1 setShowingSetupController:0];
  id v10 = [v4 specifier];
  uint64_t v5 = [v4 success];

  if (v5)
  {
    id v6 = [v10 objectForKeyedSubscript:*MEMORY[0x263F60320]];
    int v7 = [v6 unsignedIntValue];

    if (v7 == 3)
    {
      if (([a1 handlePendingURL] & 1) == 0)
      {
        if ([v10 controllerLoadAction]) {
          [v10 performControllerLoadAction];
        }
        if ([v10 buttonAction]) {
          [v10 performButtonAction];
        }
      }
    }
    else if (!v7 && [v10 controllerLoadAction])
    {
      [v10 performControllerLoadAction];
    }
  }
  uint64_t v8 = [v10 objectForKeyedSubscript:0x26D93FF08];
  int v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v5);
    [v10 removePropertyForKey:0x26D93FF08];
  }
}

@end