@interface WFTemperatureUnitProvider
- (OS_dispatch_queue)providerQueue;
- (WFTemperatureUnitProvider)init;
- (int)_providerQueue_changeUnit:(int)a3;
- (int)_providerQueue_readUnit;
- (int)userTemperatureUnit;
- (void)_postDidChangeUnitDefaultsPreference;
- (void)fetchTemperatureUnitWithCompletionHandler:(id)a3;
- (void)replaceUnit:(int)a3;
- (void)replaceUnit:(int)a3 completionHandler:(id)a4;
- (void)setProviderQueue:(id)a3;
@end

@implementation WFTemperatureUnitProvider

- (WFTemperatureUnitProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFTemperatureUnitProvider;
  v2 = [(WFTemperatureUnitProvider *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WeatherFoundation.TemperatureUnitProviderSerialQueue", 0);
    [(WFTemperatureUnitProvider *)v2 setProviderQueue:v3];
  }
  return v2;
}

- (void)fetchTemperatureUnitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(WFTemperatureUnitProvider *)self providerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFTemperatureUnitProvider_fetchTemperatureUnitWithCompletionHandler___block_invoke;
  block[3] = &unk_264432680;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__WFTemperatureUnitProvider_fetchTemperatureUnitWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(WeakRetained, "_providerQueue_readUnit"));
}

- (int)userTemperatureUnit
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 2;
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = [(WFTemperatureUnitProvider *)self providerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WFTemperatureUnitProvider_userTemperatureUnit__block_invoke;
  block[3] = &unk_2644326A8;
  void block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(v3, block);

  LODWORD(v3) = *((_DWORD *)v9 + 6);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (int)v3;
}

void __48__WFTemperatureUnitProvider_userTemperatureUnit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "_providerQueue_readUnit");
}

- (void)replaceUnit:(int)a3
{
  objc_initWeak(&location, self);
  objc_super v5 = [(WFTemperatureUnitProvider *)self providerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFTemperatureUnitProvider_replaceUnit___block_invoke;
  block[3] = &unk_2644326D0;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__WFTemperatureUnitProvider_replaceUnit___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_providerQueue_changeUnit:", *(unsigned int *)(a1 + 40));
}

- (void)replaceUnit:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(WFTemperatureUnitProvider *)self providerQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WFTemperatureUnitProvider_replaceUnit_completionHandler___block_invoke;
  v9[3] = &unk_2644326F8;
  objc_copyWeak(&v11, &location);
  int v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __59__WFTemperatureUnitProvider_replaceUnit_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_providerQueue_changeUnit:", *(unsigned int *)(a1 + 48));

  dispatch_queue_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (int)_providerQueue_readUnit
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  int v3 = objc_msgSend(v2, "wf_temperatureUnit");

  return v3;
}

- (int)_providerQueue_changeUnit:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = [(WFTemperatureUnitProvider *)self _providerQueue_readUnit];
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  objc_msgSend(v6, "setWf_temperatureUnit:", v3);
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE48]);
  [(WFTemperatureUnitProvider *)self _postDidChangeUnitDefaultsPreference];
  id v7 = WFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSLocaleTemperatureUnitFromWFTemperatureUnit(v5);
    id v9 = NSLocaleTemperatureUnitFromWFTemperatureUnit([(WFTemperatureUnitProvider *)self _providerQueue_readUnit]);
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21C988000, v7, OS_LOG_TYPE_DEFAULT, "Temperature unit was changed from %@ to %@", (uint8_t *)&v12, 0x16u);
  }
  int v10 = [(WFTemperatureUnitProvider *)self _providerQueue_readUnit];

  return v10;
}

- (void)_postDidChangeUnitDefaultsPreference
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.weather.temperatureUnitsChangedNotification", 0, 0, 1u);
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

- (void)setProviderQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end