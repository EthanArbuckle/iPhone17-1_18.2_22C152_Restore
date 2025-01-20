@interface _HKRPOxygenSaturationAvailabilityDataSource
- (BOOL)deviceIsSupported;
- (_HKRPOxygenSaturationAvailabilityDataSource)initWithDevice:(id)a3;
@end

@implementation _HKRPOxygenSaturationAvailabilityDataSource

- (_HKRPOxygenSaturationAvailabilityDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKRPOxygenSaturationAvailabilityDataSource;
  v6 = [(_HKRPOxygenSaturationAvailabilityDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (BOOL)deviceIsSupported
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  device = self->_device;
  if (device)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
    int v5 = [(NRDevice *)device supportsCapability:v4];

    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = objc_opt_class();
      objc_super v9 = @"false";
      if (v5) {
        objc_super v9 = @"true";
      }
      int v20 = 138543618;
      v21 = v8;
      __int16 v22 = 2114;
      v23 = v9;
      id v10 = v8;
      v11 = "[%{public}@] Paired device supports Scandium: %{public}@";
LABEL_11:
      _os_log_impl(&dword_21D42F000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    v13 = [MEMORY[0x263F0A980] sharedBehavior];
    int v14 = [v13 isAppleWatch];

    if (v14)
    {
      int v5 = MGGetBoolAnswer();
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v15;
        v16 = objc_opt_class();
        v17 = @"false";
        if (v5) {
          v17 = @"true";
        }
        int v20 = 138543618;
        v21 = v16;
        __int16 v22 = 2114;
        v23 = v17;
        id v10 = v16;
        v11 = "[%{public}@] Device supports Scandium: %{public}@";
        goto LABEL_11;
      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
        [(_HKRPWatchAppInstallabilityDataSource *)v18 isDeviceSupported];
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end