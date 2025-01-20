@interface RECoreLocationLocationManager
@end

@implementation RECoreLocationLocationManager

void __62___RECoreLocationLocationManager_initWithEffectiveBundlePath___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc(MEMORY[0x263F00A60]);
    uint64_t v3 = [v2 initWithEffectiveBundlePath:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40) onQueue:MEMORY[0x263EF83A0]];
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F00A60] sharedManager];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setDelegate:");
  }
  v9 = *(NSObject **)(*(void *)(a1 + 40) + 40);
  dispatch_resume(v9);
}

void __41___RECoreLocationLocationManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  v5 = RELogForDomain(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "startLocationUpdates", v8, 2u);
  }

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) _startMonitoringSignificantLocationChangesOfDistance:1 withPowerBudget:1000.0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 8)) {
    return [*(id *)(v7 + 32) requestLocation];
  }
  return result;
}

void __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) currentLocation];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

uint64_t __53___RECoreLocationLocationManager_stopLocationUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = RELogForDomain(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "stopLocationUpdates", v6, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) stopMonitoringSignificantLocationChanges];
  return [*(id *)(*(void *)(a1 + 32) + 32) stopUpdatingLocation];
}

void __69___RECoreLocationLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastObject];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)v3[1];
  id v6 = (id)v2;
  if (v4)
  {
    [v4 distanceFromLocation:v2];
    if (v5 < 0.01) {
      goto LABEL_5;
    }
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v2 = (uint64_t)v6;
  }
  [v3 _updateLocation:v2];
  [*(id *)(a1 + 40) _notifyUpdateHandlersWithError:0];
LABEL_5:
}

uint64_t __67___RECoreLocationLocationManager_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLocation:0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _notifyUpdateHandlersWithError:v3];
}

uint64_t __65___RECoreLocationLocationManager__notifyUpdateHandlersWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentLocation];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }
  return MEMORY[0x270F9A758](v3, v2);
}

@end