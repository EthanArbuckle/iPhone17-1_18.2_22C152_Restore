@interface SBWalletPreArmController
+ (SBWalletPreArmController)sharedInstance;
- (BOOL)isPreArmAllowed;
- (BOOL)isPreArmAvailable;
- (BOOL)isPreArmExternallySuppressed;
- (BOOL)isPreArmSuppressed;
- (BOOL)isPreArmTriggeredByHomeButtonDoublePress;
- (BOOL)isPreArmTriggeredByLockButtonDoublePress;
- (NSUserDefaults)_getNFDefaults;
- (SBWalletPreArmController)init;
- (SBWalletPreArmController)initWithWalletPresentation:(id)a3 biometricResource:(id)a4;
- (id)acquireSuppressPreArmAssertionForReason:(id)a3;
- (id)acquireSuppressPreArmAssertionOfType:(int64_t)a3 forReason:(id)a4;
- (int64_t)_computeTriggerSource;
- (int64_t)_contactlessInterfaceSourceForTriggerSource:(int64_t)a3;
- (void)_setNFDefaults:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentPreArmInterfaceForWalletConsumer;
@end

@implementation SBWalletPreArmController

- (id)acquireSuppressPreArmAssertionOfType:(int64_t)a3 forReason:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v8 = MEMORY[0x1E4F14428];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__SBWalletPreArmController_acquireSuppressPreArmAssertionOfType_forReason___block_invoke;
  v25[3] = &unk_1E6B0D900;
  objc_copyWeak(v28, &location);
  v28[1] = (id)a3;
  id v9 = v6;
  id v26 = v9;
  v27 = self;
  v10 = (void *)[v7 initWithIdentifier:@"DisableWalletPreArmAssertion" forReason:v9 queue:MEMORY[0x1E4F14428] invalidationBlock:v25];

  if (v10)
  {
    v11 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = SBWalletPreArmSuppressionAssertionTypeDescription(a3);
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Added disable wallet pre-arm assertion of type %@ for reason: %@", buf, 0x16u);
    }
    BOOL v13 = [(SBWalletPreArmController *)self isPreArmSuppressed];
    [(NSHashTable *)self->_disabledPreArmAssertions addObject:v10];
    disabledPreArmAssertionsByType = self->_disabledPreArmAssertionsByType;
    v15 = [NSNumber numberWithInteger:a3];
    v16 = [(NSMutableDictionary *)disabledPreArmAssertionsByType objectForKeyedSubscript:v15];
    LODWORD(disabledPreArmAssertionsByType) = v16 == 0;

    if (disabledPreArmAssertionsByType)
    {
      v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v18 = self->_disabledPreArmAssertionsByType;
      v19 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];
    }
    v20 = self->_disabledPreArmAssertionsByType;
    v21 = [NSNumber numberWithInteger:a3];
    v22 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v21];
    [v22 addObject:v10];

    if (!v13)
    {
      v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 postNotificationName:@"SBWalletPreArmControllerPreArmSuppressionDidChange" object:self];
    }
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  return v10;
}

- (BOOL)isPreArmSuppressed
{
  return [(NSHashTable *)self->_disabledPreArmAssertions count] != 0;
}

+ (SBWalletPreArmController)sharedInstance
{
  if (sharedInstance_onceToken_55 != -1) {
    dispatch_once(&sharedInstance_onceToken_55, &__block_literal_global_388);
  }
  v2 = (void *)sharedInstance_sharedController;
  return (SBWalletPreArmController *)v2;
}

void __42__SBWalletPreArmController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBWalletPreArmController);
  v1 = (void *)sharedInstance_sharedController;
  sharedInstance_sharedController = (uint64_t)v0;
}

- (SBWalletPreArmController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0A8]);
  v4 = [MEMORY[0x1E4FA7C68] sharedInstance];
  v5 = [(SBWalletPreArmController *)self initWithWalletPresentation:v3 biometricResource:v4];

  return v5;
}

- (SBWalletPreArmController)initWithWalletPresentation:(id)a3 biometricResource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBWalletPreArmController;
  id v9 = [(SBWalletPreArmController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_walletPresentation, a3);
    objc_storeStrong((id *)&v10->_biometricResource, a4);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    disabledPreArmAssertions = v10->_disabledPreArmAssertions;
    v10->_disabledPreArmAssertions = (NSHashTable *)v11;

    BOOL v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    disabledPreArmAssertionsByType = v10->_disabledPreArmAssertionsByType;
    v10->_disabledPreArmAssertionsByType = v13;

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.stockholm.wallet.presentation"];
    [(SBWalletPreArmController *)v10 _setNFDefaults:v15];

    v10->_triggerSource = [(SBWalletPreArmController *)v10 _computeTriggerSource];
  }

  return v10;
}

- (BOOL)isPreArmAvailable
{
  return self->_walletDoublePressConsumerAvailable;
}

- (BOOL)isPreArmAllowed
{
  BOOL v3 = [(SBWalletPreArmController *)self isPreArmAvailable];
  if (v3) {
    LOBYTE(v3) = ![(SBWalletPreArmController *)self isPreArmSuppressed];
  }
  return v3;
}

- (BOOL)isPreArmTriggeredByLockButtonDoublePress
{
  return self->_triggerSource == 2;
}

- (BOOL)isPreArmTriggeredByHomeButtonDoublePress
{
  return self->_triggerSource == 1;
}

- (BOOL)isPreArmExternallySuppressed
{
  v2 = [(NSMutableDictionary *)self->_disabledPreArmAssertionsByType objectForKeyedSubscript:&unk_1F334B6A8];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)acquireSuppressPreArmAssertionForReason:(id)a3
{
  return [(SBWalletPreArmController *)self acquireSuppressPreArmAssertionOfType:1 forReason:a3];
}

void __75__SBWalletPreArmController_acquireSuppressPreArmAssertionOfType_forReason___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (id *)(a1 + 6);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[4] removeObject:v4];
  id v6 = WeakRetained[5];
  id v7 = [NSNumber numberWithInteger:a1[7]];
  id v8 = [v6 objectForKeyedSubscript:v7];
  [v8 removeObject:v4];

  id v9 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = SBWalletPreArmSuppressionAssertionTypeDescription(a1[7]);
    uint64_t v11 = a1[4];
    int v13 = 138412546;
    v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Removed disable wallet pre-arm assertion of type %@ for reason: %@", (uint8_t *)&v13, 0x16u);
  }
  if (([WeakRetained isPreArmSuppressed] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"SBWalletPreArmControllerPreArmSuppressionDidChange" object:a1[5]];
  }
}

- (void)presentPreArmInterfaceForWalletConsumer
{
}

- (int64_t)_computeTriggerSource
{
  int v2 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  BOOL v3 = +[SBDefaults localDefaults];
  id v4 = [v3 miscellaneousDefaults];
  int v5 = [v4 walletPreArmForceLockButton];

  if (v5 | v2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_contactlessInterfaceSourceForTriggerSource:(int64_t)a3
{
  return 0;
}

- (void)_setNFDefaults:(id)a3
{
  int v5 = (NSUserDefaults *)a3;
  if (self->_nfDefaults != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_nfDefaults, a3);
    self->_walletDoublePressConsumerAvailable = [(NSUserDefaults *)self->_nfDefaults BOOLForKey:@"walletDoubleButtonPressedConsumerAvailable"];
    [(NSUserDefaults *)self->_nfDefaults addObserver:self forKeyPath:@"walletDoubleButtonPressedConsumerAvailable" options:1 context:&self->_walletDoublePressConsumerAvailable];
    int v5 = v6;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"walletDoubleButtonPressedConsumerAvailable", a4, a5)) {
    BOOL v8 = &self->_walletDoublePressConsumerAvailable == a6;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    BOOL v9 = [(NSUserDefaults *)self->_nfDefaults BOOLForKey:@"walletDoubleButtonPressedConsumerAvailable"];
    v10 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Wallet pre-arm double-click consumer did become available: %{BOOL}u", (uint8_t *)v11, 8u);
    }

    *(unsigned char *)a6 = v9;
  }
}

- (NSUserDefaults)_getNFDefaults
{
  return self->_nfDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfDefaults, 0);
  objc_storeStrong((id *)&self->_disabledPreArmAssertionsByType, 0);
  objc_storeStrong((id *)&self->_disabledPreArmAssertions, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_walletPresentation, 0);
}

@end