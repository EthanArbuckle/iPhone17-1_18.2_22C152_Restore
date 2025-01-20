@interface NTKSimulatedLocationManager
- (NTKSimulatedLocationManager)init;
- (id)companionLocation;
- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4;
- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5;
@end

@implementation NTKSimulatedLocationManager

- (NTKSimulatedLocationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSimulatedLocationManager;
  v2 = [(NTKSimulatedLocationManager *)&v6 init];
  if (v2)
  {
    v3 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKSimulatedLocationManager initialized.", v5, 2u);
    }
  }
  return v2;
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__NTKSimulatedLocationManager_startLocationUpdatesWithIdentifier_handler___block_invoke;
  v8[3] = &unk_1E62C0AE8;
  v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  return &stru_1F1635E90;
}

void __74__NTKSimulatedLocationManager_startLocationUpdatesWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) currentLocation];
  v3 = [*(id *)(a1 + 32) anyLocation];
  (*(void (**)(uint64_t, id, void *, void))(v2 + 16))(v2, v4, v3, 0);
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5
{
  return [(NTKSimulatedLocationManager *)self startLocationUpdatesWithIdentifier:a3 handler:a5];
}

- (id)companionLocation
{
  uint64_t v2 = +[NTKLocationManager fallbackLocation];
  id v3 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v2 coordinate];
  double v5 = v4;
  double v7 = v6;
  [v2 altitude];
  double v9 = v8;
  [v2 horizontalAccuracy];
  double v11 = v10;
  [v2 verticalAccuracy];
  double v13 = v12;
  v14 = +[CLKDate unmodifiedDate];
  v15 = objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v14, v5, v7, v9, v11, v13);

  return v15;
}

@end