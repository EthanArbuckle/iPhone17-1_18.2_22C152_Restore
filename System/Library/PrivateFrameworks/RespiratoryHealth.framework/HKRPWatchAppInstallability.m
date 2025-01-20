@interface HKRPWatchAppInstallability
- (BOOL)shouldInstallWatchApp;
- (HKRPWatchAppInstallability)init;
- (HKRPWatchAppInstallability)initWithDataSource:(id)a3;
- (HKRPWatchAppInstallability)initWithDevice:(id)a3;
@end

@implementation HKRPWatchAppInstallability

- (HKRPWatchAppInstallability)init
{
  v3 = objc_alloc_init(_HKRPWatchAppInstallabilityDataSource);
  v4 = [(HKRPWatchAppInstallability *)self initWithDataSource:v3];

  return v4;
}

- (HKRPWatchAppInstallability)initWithDevice:(id)a3
{
  id v4 = a3;
  v5 = [[_HKRPWatchAppInstallabilityDataSource alloc] initWithDevice:v4];

  v6 = [(HKRPWatchAppInstallability *)self initWithDataSource:v5];
  return v6;
}

- (HKRPWatchAppInstallability)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRPWatchAppInstallability;
  v6 = [(HKRPWatchAppInstallability *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (BOOL)shouldInstallWatchApp
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(HKRPWatchAppInstallabilityDataSource *)self->_dataSource isBloodOxygenSaturationEnabled])
  {
    if ([(HKRPWatchAppInstallabilityDataSource *)self->_dataSource isTinkerModeEnabled])
    {
      _HKInitializeLogging();
      v3 = (void *)*MEMORY[0x263F09950];
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (v4)
      {
        v6 = v3;
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v7 = v18;
        v8 = "[%{public}@] -> 0 (Not allowed in Satellite Pairing Mode)";
LABEL_7:
        _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, 0xCu);

        LOBYTE(v5) = 0;
      }
    }
    else
    {
      char v11 = [(HKRPWatchAppInstallabilityDataSource *)self->_dataSource isDeviceSupported];
      char v12 = [(HKRPWatchAppInstallabilityDataSource *)self->_dataSource shouldForceAppInstall];
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x263F09950];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) == 0 && (v12 & 1) == 0)
      {
        if (!v5) {
          return v5;
        }
        v6 = v13;
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v7 = v18;
        v8 = "[%{public}@] -> 0 (Device hardware not supported)";
        goto LABEL_7;
      }
      if (v5)
      {
        v14 = v13;
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v15 = v18;
        _os_log_impl(&dword_21D42F000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] -> 1 (App installation not restricted)", (uint8_t *)&v17, 0xCu);
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    objc_super v9 = (void *)*MEMORY[0x263F09950];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v5) = 0;
    if (v10)
    {
      v6 = v9;
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v7 = v18;
      v8 = "[%{public}@] -> 0 (Not allowed when feature is disabled)";
      goto LABEL_7;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end