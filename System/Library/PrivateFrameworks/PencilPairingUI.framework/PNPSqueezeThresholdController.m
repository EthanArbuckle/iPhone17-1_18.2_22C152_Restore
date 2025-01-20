@interface PNPSqueezeThresholdController
+ (double)defaultThreshold;
+ (id)sharedController;
- (BOOL)autoCalibrationInProgress;
- (BOOL)squeezeOnboardingModeEnabled;
- (BOOL)startAutoCalibrationIfNecessary;
- (NSNumber)squeezeThreshold;
- (id)opaqueTouchSenderDescriptor;
- (void)disableAutoCalibrationIfNecessary;
- (void)disableSqueezeOnboardingMode;
- (void)initializeToDefaultThreshold;
- (void)initializeToDefaultThresholdIfUninitialized;
- (void)resetAutoCalibration;
- (void)setAutoCalibrationInProgress:(BOOL)a3;
- (void)setSqueezeOnboardingModeEnabled:(BOOL)a3;
- (void)setSqueezeThreshold:(id)a3;
- (void)synchronizeSqueezeThresholdToBackboard;
@end

@implementation PNPSqueezeThresholdController

+ (double)defaultThreshold
{
  return 200.0;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedController_sController;
  return v2;
}

uint64_t __49__PNPSqueezeThresholdController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PNPSqueezeThresholdController);
  uint64_t v1 = sharedController_sController;
  sharedController_sController = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)opaqueTouchSenderDescriptor
{
  return (id)[MEMORY[0x263F29868] build:&__block_literal_global_11_0];
}

uint64_t __60__PNPSqueezeThresholdController_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:65376 primaryUsage:4096];
}

- (BOOL)startAutoCalibrationIfNecessary
{
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "startAutoCalibrationIfNecessary", v6, 2u);
  }

  BOOL v4 = [(PNPSqueezeThresholdController *)self autoCalibrationInProgress];
  if (!v4)
  {
    [(PNPSqueezeThresholdController *)self setAutoCalibrationInProgress:1];
    [(PNPSqueezeThresholdController *)self setSqueezeOnboardingModeEnabled:1];
  }
  return !v4;
}

- (void)resetAutoCalibration
{
  [(PNPSqueezeThresholdController *)self setAutoCalibrationInProgress:0];
  [(PNPSqueezeThresholdController *)self setSqueezeOnboardingModeEnabled:0];
}

- (void)disableSqueezeOnboardingMode
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "Disabling squeeze onboarding mode", (uint8_t *)&v12, 2u);
  }

  if ([(PNPSqueezeThresholdController *)self squeezeOnboardingModeEnabled])
  {
    [(PNPSqueezeThresholdController *)self setSqueezeOnboardingModeEnabled:0];
    BOOL v4 = getOpaqueTouchValue(@"SqueezeThreshold");
    v5 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      double v13 = *(double *)&v4;
      _os_log_impl(&dword_2397CD000, v5, OS_LOG_TYPE_DEFAULT, "Current squeeze threshold %@", (uint8_t *)&v12, 0xCu);
    }

    [v4 doubleValue];
    if (v6 >= 9999.0)
    {
      [(id)objc_opt_class() defaultThreshold];
      double v9 = v8;
      v10 = os_log_create("com.apple.pencilpairingui", "");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        double v13 = v9;
        _os_log_impl(&dword_2397CD000, v10, OS_LOG_TYPE_DEFAULT, "Auto-calibration not done, setting default value: %g", (uint8_t *)&v12, 0xCu);
      }

      v11 = [NSNumber numberWithDouble:v9];
      [(PNPSqueezeThresholdController *)self setSqueezeThreshold:v11];
    }
    else
    {
      v7 = os_log_create("com.apple.pencilpairingui", "");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        double v13 = *(double *)&v4;
        _os_log_impl(&dword_2397CD000, v7, OS_LOG_TYPE_DEFAULT, "Setting new auto-calibrated value: %@", (uint8_t *)&v12, 0xCu);
      }

      [(PNPSqueezeThresholdController *)self setSqueezeThreshold:v4];
    }
  }
}

- (void)initializeToDefaultThreshold
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "initializeToDefaultThreshold", (uint8_t *)&v8, 2u);
  }

  [(id)objc_opt_class() defaultThreshold];
  double v5 = v4;
  double v6 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_2397CD000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing squeeze threshold to default value: %g", (uint8_t *)&v8, 0xCu);
  }

  v7 = [NSNumber numberWithDouble:v5];
  [(PNPSqueezeThresholdController *)self setSqueezeThreshold:v7];
}

- (void)initializeToDefaultThresholdIfUninitialized
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "initializeToDefaultThresholdIfUninitialized", (uint8_t *)&v6, 2u);
  }

  double v4 = [(PNPSqueezeThresholdController *)self squeezeThreshold];
  if (v4)
  {
    double v5 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2397CD000, v5, OS_LOG_TYPE_DEFAULT, "Squeeze threshold already set in backboard: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [(PNPSqueezeThresholdController *)self initializeToDefaultThreshold];
  }
}

- (void)synchronizeSqueezeThresholdToBackboard
{
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "synchronizeSqueezeThresholdToBackboard", v4, 2u);
  }

  [(PNPSqueezeThresholdController *)self initializeToDefaultThresholdIfUninitialized];
}

- (void)disableAutoCalibrationIfNecessary
{
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "disableAutoCalibrationIfNecessary", v4, 2u);
  }

  if ([(PNPSqueezeThresholdController *)self autoCalibrationInProgress])
  {
    [(PNPSqueezeThresholdController *)self setAutoCalibrationInProgress:0];
    [(PNPSqueezeThresholdController *)self synchronizeSqueezeThresholdToBackboard];
  }
  if ([(PNPSqueezeThresholdController *)self squeezeOnboardingModeEnabled]) {
    [(PNPSqueezeThresholdController *)self setSqueezeOnboardingModeEnabled:0];
  }
}

- (void)setAutoCalibrationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  double v5 = objc_msgSend(NSNumber, "numberWithBool:");
  int v12 = @"SqueezeAutoCalibrationEnabled";
  v13[0] = v5;
  int v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v7 = [(PNPSqueezeThresholdController *)self opaqueTouchSenderDescriptor];
  BKSHIDServicesSetPersistentServiceProperties();

  uint64_t v8 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v3;
    __int16 v10 = 1024;
    BOOL v11 = [(PNPSqueezeThresholdController *)self autoCalibrationInProgress];
    _os_log_impl(&dword_2397CD000, v8, OS_LOG_TYPE_DEFAULT, "setAutoCalibrationInProgress: %d (readback: %d)", (uint8_t *)v9, 0xEu);
  }
}

- (BOOL)autoCalibrationInProgress
{
  v2 = getOpaqueTouchValue(@"SqueezeAutoCalibrationEnabled");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSqueezeOnboardingModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  double v5 = objc_msgSend(NSNumber, "numberWithBool:");
  int v12 = @"SqueezeOnboardingModeEnabled";
  v13[0] = v5;
  int v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v7 = [(PNPSqueezeThresholdController *)self opaqueTouchSenderDescriptor];
  BKSHIDServicesSetPersistentServiceProperties();

  uint64_t v8 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v3;
    __int16 v10 = 1024;
    BOOL v11 = [(PNPSqueezeThresholdController *)self squeezeOnboardingModeEnabled];
    _os_log_impl(&dword_2397CD000, v8, OS_LOG_TYPE_DEFAULT, "setSqueezeOnboardingModeEnabled: %d (readback: %d)", (uint8_t *)v9, 0xEu);
  }
}

- (BOOL)squeezeOnboardingModeEnabled
{
  v2 = getOpaqueTouchValue(@"SqueezeOnboardingModeEnabled");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)squeezeThreshold
{
  v2 = [(PNPSqueezeThresholdController *)self opaqueTouchSenderDescriptor];
  char v3 = [MEMORY[0x263EFFA08] setWithObject:@"SqueezeThreshold"];
  double v4 = BKSHIDServicesGetPersistentServiceProperties();

  double v5 = [v4 objectForKeyedSubscript:@"SqueezeThreshold"];

  return (NSNumber *)v5;
}

- (void)setSqueezeThreshold:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    double v5 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2397CD000, v5, OS_LOG_TYPE_DEFAULT, "Setting squeeze threshold: %@", buf, 0xCu);
    }

    uint64_t v8 = @"SqueezeThreshold";
    id v9 = v4;
    int v6 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v7 = [(PNPSqueezeThresholdController *)self opaqueTouchSenderDescriptor];
    BKSHIDServicesSetPersistentServiceProperties();
  }
}

@end