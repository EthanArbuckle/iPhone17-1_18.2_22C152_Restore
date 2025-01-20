@interface PSUIDeviceTakeOverController
+ (BOOL)isRatchetFeatureAvailable;
- (BOOL)canGateOperation:(unint64_t)a3;
- (BOOL)isABiometricModifyingIdentifier:(unint64_t)a3;
- (BOOL)isRatchetEnabled;
- (BOOL)isStrictModeEnabled;
- (LAContext)laContext;
- (id)footerDescriptionOfDTORequirements;
- (id)getArmingOptionsDictionaryForIdentifier:(unint64_t)a3;
- (id)getAuthenticationFallbackDescriptionForIdentifier:(unint64_t)a3;
- (id)getInProgressDescriptionForIdentifier:(unint64_t)a3;
- (id)getOperationDeepLinkForIdentifier:(unint64_t)a3;
- (id)getOperationNameForIdentifier:(unint64_t)a3;
- (id)getTitleForIdentifier:(unint64_t)a3;
- (void)dealloc;
- (void)disableRatchetWithCompletion:(id)a3;
- (void)enableRatchetWithCompletion:(id)a3;
- (void)gateWithRatchetForOperation:(unint64_t)a3 forPresentingVC:(id)a4 completion:(id)a5;
- (void)performPreliminaryPreEnableDTOChecksWithCompletion:(id)a3;
- (void)proceedToEnableRatchetWithCompletion:(id)a3;
- (void)proceedToPeformBiometricLivenessIfNeededWithResultDictionary:(id)a3 withCompletion:(id)a4;
- (void)setLaContext:(id)a3;
- (void)showAlertForFailureToGateForOperation:(unint64_t)a3 forPresentingVC:(id)a4;
- (void)toggleToStrictMode:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation PSUIDeviceTakeOverController

- (void)dealloc
{
  laContext = self->_laContext;
  if (laContext) {
    [(LAContext *)laContext invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)PSUIDeviceTakeOverController;
  [(PSUIDeviceTakeOverController *)&v4 dealloc];
}

+ (BOOL)isRatchetFeatureAvailable
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = objc_msgSend(v2, "sf_isiPhone");

  uint64_t v4 = _os_feature_enabled_impl();
  uint64_t v5 = v3 & v4;
  v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:v5];
    v8 = [NSNumber numberWithBool:v3];
    v9 = [NSNumber numberWithBool:v4];
    int v11 = 138412802;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: %@ [isPhone: %@, FeatureEnabled: %@]", (uint8_t *)&v11, 0x20u);
  }
  return v5;
}

- (BOOL)isRatchetEnabled
{
  v2 = [MEMORY[0x263F10488] sharedInstance];
  char v3 = [v2 isFeatureEnabled];

  return v3;
}

- (BOOL)isStrictModeEnabled
{
  v2 = [MEMORY[0x263F10488] sharedInstance];
  char v3 = [v2 isFeatureStrictModeEnabled];

  return v3;
}

- (void)toggleToStrictMode:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F10488] sharedInstance];
  if (v4)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke;
    v14[3] = &unk_264E95AC8;
    v8 = &v15;
    id v15 = v6;
    id v9 = v6;
    [v7 enableFeatureStrictModeWithCompletion:v14];
  }
  else
  {
    v10 = [(PSUIDeviceTakeOverController *)self laContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke_6;
    v12[3] = &unk_264E95AC8;
    v8 = &v13;
    id v13 = v6;
    id v11 = v6;
    [v7 disableFeatureStrictModeWithContext:v10 completion:v12];
  }
}

void __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      uint64_t v5 = [v3 description];
    }
    else
    {
      uint64_t v5 = @"Succeeded";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Ratchet: Turn on Strict Mode - %@", (uint8_t *)&v6, 0xCu);
    if (v3) {
  }
    }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 == 0);
}

void __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      uint64_t v5 = [v3 description];
    }
    else
    {
      uint64_t v5 = @"Succeeded";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Ratchet: Turn off Strict Mode - %@", (uint8_t *)&v6, 0xCu);
    if (v3) {
  }
    }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 == 0);
}

- (void)gateWithRatchetForOperation:(unint64_t)a3 forPresentingVC:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(PSUIDeviceTakeOverController *)self canGateOperation:a3];
  id v11 = PSUILogForCategory(1uLL);
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v21 = a3;
      _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Ratchet: Performing gating check for identifier: %lu", buf, 0xCu);
    }

    id v13 = objc_alloc(MEMORY[0x263F10480]);
    v14 = [(PSUIDeviceTakeOverController *)self getOperationNameForIdentifier:a3];
    id v15 = (void *)[v13 initWithIdentifier:v14];

    objc_initWeak((id *)buf, self);
    v16 = [(PSUIDeviceTakeOverController *)self getArmingOptionsDictionaryForIdentifier:a3];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke;
    v17[3] = &unk_264E95AF0;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v9;
    [v15 armWithOptions:v16 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PSUIDeviceTakeOverController gateWithRatchetForOperation:forPresentingVC:completion:]();
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 2);
    [(PSUIDeviceTakeOverController *)self showAlertForFailureToGateForOperation:a3 forPresentingVC:v8];
  }
}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:&unk_26F113268];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained setLaContext:v7];
      BOOL v10 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Proceeding to perform critical operation as gating was successful", v14, 2u);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v13 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_2();
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v11();
  }
  else
  {
    v12 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_1(v6, (uint64_t)v5, v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)getArmingOptionsDictionaryForIdentifier:(unint64_t)a3
{
  id v5 = objc_opt_new();
  id v6 = [(PSUIDeviceTakeOverController *)self getTitleForIdentifier:a3];
  [v5 setObject:v6 forKey:&unk_26F113280];

  v7 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_BEGIN_DESCRIPTION_DEFAULT");
  [v5 setObject:v7 forKey:&unk_26F113298];

  id v8 = [(PSUIDeviceTakeOverController *)self getInProgressDescriptionForIdentifier:a3];
  [v5 setObject:v8 forKey:&unk_26F1132B0];

  id v9 = [(PSUIDeviceTakeOverController *)self getAuthenticationFallbackDescriptionForIdentifier:a3];
  [v5 setObject:v9 forKey:&unk_26F1132C8];

  BOOL v10 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_NOTIFICATION_DESCRIPTION_DEFAULT");
  [v5 setObject:v10 forKey:&unk_26F113268];

  id v11 = NSURL;
  v12 = [(PSUIDeviceTakeOverController *)self getOperationDeepLinkForIdentifier:a3];
  id v13 = [v11 URLWithString:v12];
  [v5 setObject:v13 forKey:&unk_26F1132E0];

  [v5 setObject:MEMORY[0x263EFFA88] forKey:&unk_26F1132F8];
  if ([(PSUIDeviceTakeOverController *)self isABiometricModifyingIdentifier:a3]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKey:&unk_26F113310];
  }
  v14 = (void *)[v5 copy];

  return v14;
}

- (BOOL)isABiometricModifyingIdentifier:(unint64_t)a3
{
  return (a3 < 0xA) & (0x33Fu >> a3);
}

- (BOOL)canGateOperation:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v4 = [MEMORY[0x263F10488] sharedInstance];
  uint64_t v5 = [v4 isSensorTrusted];

  id v6 = +[PSUIBiometrics sharedInstance];
  v7 = [v6 identitiesForIdentityType:1];

  if (v7) {
    uint64_t v8 = [v7 count];
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8 == 1) {
    unsigned int v9 = v5 ^ 1;
  }
  else {
    unsigned int v9 = 1;
  }
  if (a3) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = v5 ^ 1;
  }
  if (a3 == 4) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [NSNumber numberWithBool:v11];
    v14 = [NSNumber numberWithBool:v5];
    id v15 = [NSNumber numberWithUnsignedInteger:v8];
    int v17 = 138413058;
    id v18 = v13;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck: %@ for identifier: %lu [TrustedSensor:%@ | IdentitiesCount:%@]", (uint8_t *)&v17, 0x2Au);
  }
  return v11;
}

- (void)showAlertForFailureToGateForOperation:(unint64_t)a3 forPresentingVC:(id)a4
{
  id v4 = a4;
  int v5 = PSSupportsMesa();
  BOOL v6 = v5 == 0;
  if (v5) {
    v7 = @"DTO_ALERT_CANNOT_DELETE_TOUCH_ID_TITLE";
  }
  else {
    v7 = @"DTO_ALERT_CANNOT_RESET_FACE_ID_TITLE";
  }
  if (v6) {
    uint64_t v8 = @"DTO_ALERT_CANNOT_RESET_FACE_ID_MESSAGE";
  }
  else {
    uint64_t v8 = @"DTO_ALERT_CANNOT_DELETE_TOUCH_ID_MESSAGE";
  }
  unsigned int v9 = PSUI_LocalizedStringForPasscodeDimpleKey(v7);
  unsigned int v10 = PSUI_LocalizedStringForPasscodeDimpleKey(v8);
  uint64_t v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
  v12 = (void *)MEMORY[0x263F82400];
  id v13 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_OK_BUTTON");
  v14 = [v12 actionWithTitle:v13 style:0 handler:&__block_literal_global_3];
  [v11 addAction:v14];

  id v15 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v17 = 0;
    _os_log_impl(&dword_23D33A000, v15, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck [Failed] - Alert [Shown]", v17, 2u);
  }

  if (v4)
  {
    [v4 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    v16 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PSUIDeviceTakeOverController showAlertForFailureToGateForOperation:forPresentingVC:]();
    }
  }
}

void __86__PSUIDeviceTakeOverController_showAlertForFailureToGateForOperation_forPresentingVC___block_invoke()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck [Failed] - Alert [Dismissed]", v1, 2u);
  }
}

- (void)performPreliminaryPreEnableDTOChecksWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [MEMORY[0x263F10488] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke;
  v7[3] = &unk_264E95B38;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 checkCanEnableFeatureWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = [WeakRetained isRatchetEnabled];
    }
    else
    {
      uint64_t v11 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_2();
      }

      uint64_t v9 = 0;
    }
    v12 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = [v6 description];
      unint64_t v20 = [NSNumber numberWithBool:v9];
      int v21 = 138412802;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_23D33A000, v12, OS_LOG_TYPE_ERROR, "Ratchet: Preliminary check failed: Error: %@ - %@ [Current Ratchet status: %@]", (uint8_t *)&v21, 0x20u);
    }
    id v13 = [v6 domain];
    char v14 = [v13 isEqualToString:*MEMORY[0x263F10458]];

    if (v14)
    {
      if (v8)
      {
        if ([v6 code] == 4 || objc_msgSend(v6, "code") == 5)
        {
          uint64_t v15 = *(void *)(a1 + 32);
          v16 = [v8 footerDescriptionOfDTORequirements];
          (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v9, v16);
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        int v17 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_1();
        }
      }
    }
    uint64_t v18 = *(void *)(a1 + 32);
    v16 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_DEFAULT");
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v16);
    goto LABEL_21;
  }
  unsigned int v10 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Preliminary check succeeded", (uint8_t *)&v21, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_22:
}

- (id)footerDescriptionOfDTORequirements
{
  if (PSIsPearlAvailable()) {
    v2 = @"DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_FACE_ID";
  }
  else {
    v2 = @"DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_TOUCH_ID";
  }
  id v3 = PSUI_LocalizedStringForPasscodeDimpleKey(v2);
  return v3;
}

- (void)enableRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x263F10488] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke;
  v7[3] = &unk_264E95B38;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 checkCanEnableFeatureWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_2(v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained proceedToPeformBiometricLivenessIfNeededWithResultDictionary:v5 withCompletion:*(void *)(a1 + 32)];
    }
    else
    {
      unsigned int v10 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)proceedToPeformBiometricLivenessIfNeededWithResultDictionary:(id)a3 withCompletion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:&unk_26F113328];
  int v9 = [v8 BOOLValue];

  unsigned int v10 = PSUILogForCategory(1uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Biometric liveness confirmed already", (uint8_t *)&buf, 2u);
    }

    [(PSUIDeviceTakeOverController *)self proceedToEnableRatchetWithCompletion:v7];
  }
  else
  {
    if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Confirming Biometric liveness", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    id v12 = objc_alloc_init(MEMORY[0x263F10468]);
    int v21 = &unk_26F1132E0;
    id v13 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_BIOMETRIC_LIVENESS_NEEDED_REASON");
    v22[0] = v13;
    char v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke;
    v16[3] = &unk_264E95B60;
    id v15 = v12;
    id v17 = v15;
    id v18 = v7;
    objc_copyWeak(&v19, &buf);
    [v15 evaluatePolicy:1 options:v14 reply:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = PSUILogForCategory(1uLL);
  id v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: Confirming Biometric liveness: Succeeded", v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained proceedToEnableRatchetWithCompletion:*(void *)(a1 + 40)];
    }
    else
    {
      int v9 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)proceedToEnableRatchetWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F10488] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke;
  v6[3] = &unk_264E95B88;
  id v7 = v3;
  id v5 = v3;
  [v4 enableFeatureWithReply:v6];
}

void __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke_cold_1(v4);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: Enabled successfully", v8, 2u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (void)disableRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F10488] sharedInstance];
  id v6 = [(PSUIDeviceTakeOverController *)self laContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke;
  v8[3] = &unk_264E95AC8;
  id v9 = v4;
  id v7 = v4;
  [v5 disableFeatureWithContext:v6 completion:v8];
}

void __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PSUILogForCategory(1uLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke_cold_1(v3);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Ratchet: Disabled successfully", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (id)getOperationDeepLinkForIdentifier:(unint64_t)a3
{
  if (a3 > 0xA)
  {
    id v5 = @"settings-navigation://com.apple.Settings.Passcode";
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"%@%@", @"settings-navigation://com.apple.Settings.Passcode#", off_264E95BA8[a3], v3];
  }
  return v5;
}

- (id)getOperationNameForIdentifier:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Default";
  }
  else {
    return off_264E95C00[a3];
  }
}

- (id)getTitleForIdentifier:(unint64_t)a3
{
  uint64_t v4 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_BEGIN_TITLE_DEFAULT");
  id v5 = @"DTO_BEGIN_TITLE_ENROLL_FACE_ID";
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      id v5 = @"DTO_BEGIN_TITLE_CHANGE_FACE_ID";
      goto LABEL_10;
    case 1uLL:
      goto LABEL_10;
    case 4uLL:
      id v5 = @"DTO_BEGIN_TITLE_CHANGE_TOUCH_ID";
      goto LABEL_10;
    case 5uLL:
      id v5 = @"DTO_BEGIN_TITLE_ENROLL_TOUCH_ID";
      goto LABEL_10;
    case 6uLL:
    case 0xAuLL:
      id v5 = @"DTO_BEGIN_TITLE_CHANGE_STOLEN_DEVICE_PROTECTION";
      goto LABEL_10;
    case 7uLL:
      id v5 = @"DTO_BEGIN_TITLE_CHANGE_PASSCODE";
      goto LABEL_10;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable()) {
        id v5 = @"DTO_BEGIN_TITLE_CHANGE_FACE_ID";
      }
      else {
        id v5 = @"DTO_BEGIN_TITLE_CHANGE_TOUCH_ID";
      }
LABEL_10:
      uint64_t v6 = PSUI_LocalizedStringForPasscodeDimpleKey(v5);

      uint64_t v4 = (void *)v6;
      break;
    default:
      break;
  }
  return v4;
}

- (id)getInProgressDescriptionForIdentifier:(unint64_t)a3
{
  uint64_t v4 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_IN_PROGRESS_DESCRIPTION_DEFAULT");
  id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID";
  switch(a3)
  {
    case 0uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_RESET_FACE_ID";
      goto LABEL_13;
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID_WITH_MASK";
      goto LABEL_13;
    case 3uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID_WITH_GLASSES";
      goto LABEL_13;
    case 4uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_DELETE_FINGERPRINT";
      goto LABEL_13;
    case 5uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_ADD_FINGERPRINT";
      goto LABEL_13;
    case 6uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_TURN_OFF_STOLEN_DEVICE_PROTECTION";
      goto LABEL_13;
    case 7uLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_TURN_OFF_PASSCODE";
      goto LABEL_13;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable()) {
        id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_DISABLE_USING_FACE_ID_FOR_FEATURES";
      }
      else {
        id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_DISABLE_USING_TOUCH_ID_FOR_FEATURES";
      }
      goto LABEL_13;
    case 0xAuLL:
      id v5 = @"DTO_IN_PROGRESS_DESCRIPTION_DOWNGRADE_SECURITY_FAMILIAR_ONLY";
LABEL_13:
      uint64_t v6 = PSUI_LocalizedStringForPasscodeDimpleKey(v5);

      uint64_t v4 = (void *)v6;
      break;
    default:
      break;
  }
  return v4;
}

- (id)getAuthenticationFallbackDescriptionForIdentifier:(unint64_t)a3
{
  uint64_t v4 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DEFAULT");
  id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID";
  switch(a3)
  {
    case 0uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_RESET_FACE_ID";
      goto LABEL_14;
    case 1uLL:
      goto LABEL_14;
    case 2uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID_WITH_MASK";
      goto LABEL_14;
    case 3uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID_WITH_GLASSES";
      goto LABEL_14;
    case 4uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DELETE_FINGERPRINT";
      goto LABEL_14;
    case 5uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_ADD_FINGERPRINT";
      goto LABEL_14;
    case 6uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_TURN_OFF_STOLEN_DEVICE_PROTECTION";
      goto LABEL_14;
    case 7uLL:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_TURN_OFF_PASSCODE";
      goto LABEL_14;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable()) {
        uint64_t v6 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DISABLE_USING_FACE_ID_FOR_FEATURES";
      }
      else {
        uint64_t v6 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DISABLE_USING_TOUCH_ID_FOR_FEATURES";
      }
      uint64_t v7 = PSUI_LocalizedStringForPasscodeDimpleKey(v6);

      uint64_t v4 = (void *)v7;
      goto LABEL_6;
    case 0xAuLL:
LABEL_6:
      id v5 = @"DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DOWNGRADE_SECURITY_FAMILIAR_ONLY";
LABEL_14:
      uint64_t v8 = PSUI_LocalizedStringForPasscodeDimpleKey(v5);

      uint64_t v4 = (void *)v8;
      break;
    default:
      break;
  }
  return v4;
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)gateWithRatchetForOperation:forPresentingVC:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23D33A000, v0, OS_LOG_TYPE_ERROR, "Ratchet: Cannot perform gating check for identifier: %lu", v1, 0xCu);
}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_23D33A000, a3, OS_LOG_TYPE_ERROR, "Ratchet: Cannot proceed to perform critical operation as gating failed - Error: %@ - %@", v6, 0x16u);
}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Cannot proceed to perform critical operation as gating was successful but we are missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)showAlertForFailureToGateForOperation:forPresentingVC:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Gating precheck [Failed] - Alert [Not shown - missing presenting VC]", v2, v3, v4, v5, v6);
}

void __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Preliminary check failed: No instance (self)", v2, v3, v4, v5, v6);
}

void __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Preliminary check could not find current ratchet status: No instance (self)", v2, v3, v4, v5, v6);
}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Cannot perform Biometric Livenes check as we are missing instance (self)", v2, v3, v4, v5, v6);
}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23D33A000, v2, v3, "Ratchet: Failed to enable - Initial check failed: Error: %@", v4, v5, v6, v7, v8);
}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Cannot proceed to enable Ratchet as we are missing instance (self)", v2, v3, v4, v5, v6);
}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Ratchet: Confirming Biometric liveness: Failed", v2, v3, v4, v5, v6);
}

void __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23D33A000, v2, v3, "Ratchet: Failed to enable - Error: %@", v4, v5, v6, v7, v8);
}

void __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23D33A000, v2, v3, "Ratchet: Failed to disable - Error: %@", v4, v5, v6, v7, v8);
}

@end