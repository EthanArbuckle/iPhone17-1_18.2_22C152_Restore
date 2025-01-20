@interface VGVirtualGarage
+ (BOOL)supportsSecureCoding;
- (BOOL)_persisterHasStaleStateForVehicle:(id)a3;
- (BOOL)shouldAssumeFullCharge;
- (NSArray)vehicles;
- (NSString)description;
- (VGVehicle)selectedVehicle;
- (VGVirtualGarage)initWithCoder:(id)a3;
- (VGVirtualGarage)initWithGaragePersister:(id)a3;
- (VGVirtualGarageDelegate)delegate;
- (id)_garageCopy;
- (id)_vehicleWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addVehicle:(id)a3;
- (void)_endContinuousUpdates;
- (void)_executeQueuedCompletionHandlersIfNeeded;
- (void)_forceUpdateWithVehicles:(id)a3;
- (void)_notifyObserversGarageDidUpdateVehicles;
- (void)_onboardVehicle:(id)a3;
- (void)_removeVehicleWithIdentifier:(id)a3;
- (void)_removeVehiclesWithUninstalledAppsIfNeeded;
- (void)_saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4;
- (void)_selectVehicleWithIdentifier:(id)a3;
- (void)_setDataCoordintorRunning:(BOOL)a3;
- (void)_setShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4;
- (void)_startContinuousUpdatesIfNeeded;
- (void)_unpairVehicle:(id)a3;
- (void)_updateDataCoordinatorAvailability;
- (void)dataCoordinator:(id)a3 didUpdateUnpairedVehicles:(id)a4;
- (void)dataCoordinator:(id)a3 wantsToUpdateVehicle:(id)a4 syncAcrossDevices:(BOOL)a5;
- (void)dataCoordinatorDidUpdateInstalledApps:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)garagePersister:(id)a3 wantsToUpdateVehicles:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldAssumeFullCharge:(BOOL)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)virtualGarageForceFetchAllVehicles;
- (void)virtualGarageGetGarageWithReply:(id)a3;
- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5;
- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3;
- (void)virtualGarageRemoveVehicle:(id)a3;
- (void)virtualGarageSaveVehicle:(id)a3;
- (void)virtualGarageSelectVehicle:(id)a3;
@end

@implementation VGVirtualGarage

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_vehicles forKey:@"_vehicles"];
  [v5 encodeObject:v4->_selectedVehicleIdentifier forKey:@"_selectedVehicleIdentifier"];
  objc_sync_exit(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGVirtualGarage)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VGVirtualGarage;
  id v5 = [(VGVirtualGarage *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_vehicles"];
    vehicles = v5->_vehicles;
    v5->_vehicles = (NSMutableArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedVehicleIdentifier"];
    selectedVehicleIdentifier = v5->_selectedVehicleIdentifier;
    v5->_selectedVehicleIdentifier = (NSString *)v11;
  }
  return v5;
}

- (id)_garageCopy
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(VGVirtualGarage *)self copy];
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_DEBUG, "EV Routing not enabled. Will strip EV vehicles from VG.", buf, 2u);
    }

    id v4 = VGFilter(*(void **)(v2 + 8), &__block_literal_global_6);
    uint64_t v5 = [v4 mutableCopy];
    v6 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = v5;

    if (*(void *)(v2 + 16))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = *(id *)(v2 + 8);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "identifier", (void)v15);
          char v13 = [v12 isEqualToString:*(void *)(v2 + 16)];

          if (v13) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
            if (v9) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }
      }
      else
      {
LABEL_13:

        id v7 = *(id *)(v2 + 16);
        *(void *)(v2 + 16) = 0;
      }
    }
  }

  return (id)v2;
}

- (NSArray)vehicles
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableArray *)v2->_vehicles copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableArray *)v6->_vehicles mutableCopyWithZone:a3];
  uint64_t v8 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v7;

  uint64_t v9 = [(NSString *)v6->_selectedVehicleIdentifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  *(unsigned char *)(v5 + 64) = v6->_shouldAssumeFullCharge;
  objc_sync_exit(v6);

  return (id)v5;
}

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  dataCoordinator = self->_dataCoordinator;
  id v5 = a3;
  id v7 = [(VGDataCoordinator *)dataCoordinator unpairedVehicles];
  v6 = (void *)[v7 copy];
  (*((void (**)(id, void *, void))a3 + 2))(v5, v6, 0);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedGetGarageCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedVehicleIdentifier, 0);

  objc_storeStrong((id *)&self->_vehicles, 0);
}

- (VGVirtualGarage)initWithGaragePersister:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  if (v5)
  {
    v28.receiver = self;
    v28.super_class = (Class)VGVirtualGarage;
    v6 = [(VGVirtualGarage *)&v28 init];
    if (v6)
    {
      id v7 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v30 = (const char *)v6;
        __int16 v31 = 2048;
        v32 = v5;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Creating new virtualGarage: %p with persister: %p", buf, 0x16u);
      }

      objc_storeStrong((id *)&v6->_persister, a3);
      [(VGVirtualGaragePersisting *)v6->_persister setDelegate:v6];
      uint64_t v8 = [MEMORY[0x263EFF980] array];
      vehicles = v6->_vehicles;
      v6->_vehicles = (NSMutableArray *)v8;

      uint64_t v10 = [MEMORY[0x263EFF980] array];
      queuedGetGarageCompletionHandlers = v6->_queuedGetGarageCompletionHandlers;
      v6->_queuedGetGarageCompletionHandlers = (NSMutableArray *)v10;

      global_queue = (void *)geo_get_global_queue();
      _GEOConfigAddDelegateListenerForKey();

      char v13 = VGGetPersistingLog();
      objc_super v14 = (char *)os_signpost_id_generate(v13);

      long long v15 = VGGetPersistingLog();
      long long v16 = v15;
      if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "LoadVehicles", "", buf, 2u);
      }

      objc_initWeak((id *)buf, v6);
      persister = v6->_persister;
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __43__VGVirtualGarage_initWithGaragePersister___block_invoke;
      v26 = &unk_264226558;
      objc_copyWeak(v27, (id *)buf);
      v27[1] = v14;
      [(VGVirtualGaragePersisting *)persister loadVehiclesWithCompletion:&v23];
      uint64_t v18 = [(VGVirtualGaragePersisting *)v6->_persister selectedVehicleIdentifier];
      selectedVehicleIdentifier = v6->_selectedVehicleIdentifier;
      v6->_selectedVehicleIdentifier = (NSString *)v18;

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
    }
    self = v6;
    v20 = self;
  }
  else
  {
    uint64_t v21 = VGGetAssertLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v30 = "-[VGVirtualGarage initWithGaragePersister:]";
      __int16 v31 = 2082;
      v32 = "persister == nil";
      __int16 v33 = 2082;
      v34 = "Garage should be initialized with a persister.";
      _os_log_impl(&dword_214A2C000, v21, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }

    v20 = 0;
  }

  return v20;
}

void __43__VGVirtualGarage_initWithGaragePersister___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    objc_sync_enter(v9);
    uint64_t v10 = VGGetPersistingLog();
    uint64_t v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "Failed to load virtual garage with error: %@", (uint8_t *)&v18, 0xCu);
      }

      v12 = VGGetPersistingLog();
      char v13 = v12;
      os_signpost_id_t v14 = *(void *)(a1 + 40);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v13, OS_SIGNPOST_INTERVAL_END, v14, "LoadVehicles", "", (uint8_t *)&v18, 2u);
      }

      LOBYTE(v9[6].isa) = 1;
      [v9 _updateDataCoordinatorAvailability];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_INFO, "Garage did finish loading initial vehicles.", (uint8_t *)&v18, 2u);
      }

      [v9 _forceUpdateWithVehicles:v5];
      long long v15 = VGGetPersistingLog();
      long long v16 = v15;
      os_signpost_id_t v17 = *(void *)(a1 + 40);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadVehicles", "", (uint8_t *)&v18, 2u);
      }

      LOBYTE(v9[6].isa) = 1;
      [v9 _updateDataCoordinatorAvailability];
      [v9 _removeVehiclesWithUninstalledAppsIfNeeded];
    }
    [v9 _executeQueuedCompletionHandlersIfNeeded];
    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v9 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      v19 = "-[VGVirtualGarage initWithGaragePersister:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 83;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v18, 0x12u);
    }
  }
}

- (void)_updateDataCoordinatorAvailability
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_finishedLoadingVehicles) {
    uint64_t BOOL = GEOConfigGetBOOL();
  }
  else {
    uint64_t BOOL = 0;
  }
  id v4 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (BOOL) {
      id v5 = @"YES";
    }
    else {
      id v5 = @"NO";
    }
    v6 = v5;
    if (GEOConfigGetBOOL()) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    uint64_t v8 = v7;
    if (self->_finishedLoadingVehicles) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    uint64_t v10 = v9;
    int v11 = 138412802;
    v12 = v6;
    __int16 v13 = 2112;
    os_signpost_id_t v14 = v8;
    __int16 v15 = 2112;
    long long v16 = v10;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "_updateDataCoordinatorAvailability: %@, evRoutingEnabled: %@, vehiclesLoaded: %@", (uint8_t *)&v11, 0x20u);
  }
  [(VGVirtualGarage *)self _setDataCoordintorRunning:BOOL];
}

- (void)_setDataCoordintorRunning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_isDataCoordinatorRunning != v3)
  {
    v4->_isDataCoordinatorRunning = v3;
    if (v3)
    {
      id v5 = [VGDataCoordinator alloc];
      v6 = objc_alloc_init(VGOEMApplicationFinder);
      id v7 = objc_alloc_init(VGExternalAccessory);
      uint64_t v8 = [(VGDataCoordinator *)v5 initWithApplicationFinder:v6 externalAccessory:v7 delegate:v4];
      dataCoordinator = v4->_dataCoordinator;
      v4->_dataCoordinator = (VGDataCoordinator *)v8;

      p_super = VGGetVirtualGarageLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        int v11 = v4->_dataCoordinator;
        int v13 = 138412290;
        os_signpost_id_t v14 = v11;
        _os_log_impl(&dword_214A2C000, p_super, OS_LOG_TYPE_INFO, "Instantiated a new _dataCoordinator %@ for VirtualGarage", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v12 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_INFO, "Will not use dataCoordinator, EV routing isn't enabled", (uint8_t *)&v13, 2u);
      }

      p_super = &v4->_dataCoordinator->super;
      v4->_dataCoordinator = 0;
    }
  }
  objc_sync_exit(v4);
}

- (void)_removeVehiclesWithUninstalledAppsIfNeeded
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!self->_dataCoordinator)
  {
    VGGetVirtualGarageLog();
    BOOL v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315138;
    Name = sel_getName(a2);
    long long v16 = "Tried to use a method (%s) that requires a dataCoordinator.";
    p_super = &v3->super;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 12;
LABEL_21:
    _os_log_impl(&dword_214A2C000, p_super, v18, v16, buf, v19);
    goto LABEL_22;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    VGGetVirtualGarageLog();
    BOOL v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v3->super, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    long long v16 = "Automatic unpairing is disabled. Will not remove vehicles.";
    p_super = &v3->super;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 2;
    goto LABEL_21;
  }
  BOOL v3 = self;
  objc_sync_enter(v3);
  id v4 = [(VGVirtualGarage *)v3 vehicles];
  id v5 = (void *)[v4 copy];

  v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    Name = (const char *)[v5 count];
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "Will check for vehicles (%lu) that no longer have their paired apps.", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v9 = 138412290;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(char **)(*((void *)&v21 + 1) + 8 * i);
        if (-[VGDataCoordinator shouldUnpairVehicle:](self->_dataCoordinator, "shouldUnpairVehicle:", v12, v20, (void)v21))
        {
          int v13 = VGGetVirtualGarageLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            Name = v12;
            _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "The OEM app on the primary device was uninstalled. Will remove vehicle: %@", buf, 0xCu);
          }

          os_signpost_id_t v14 = [v12 identifier];
          [(VGVirtualGarage *)v3 _removeVehicleWithIdentifier:v14];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v3);
LABEL_22:
}

- (void)_forceUpdateWithVehicles:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  v53 = v4;
  if (v4)
  {
    id v5 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    uint64_t v8 = *(void *)v59;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        int v11 = [v10 currentVehicleState];
        v12 = [v11 dateOfUpdate];

        if (!v12) {
          goto LABEL_14;
        }
        int v13 = [v10 identifier];
        os_signpost_id_t v14 = [(VGVirtualGarage *)obj _vehicleWithIdentifier:v13];

        uint64_t v15 = [v14 currentVehicleState];
        long long v16 = [v15 dateOfUpdate];

        if (!v16 || [v16 compare:v12] != 1)
        {

LABEL_14:
          [v5 addObject:v10];
          goto LABEL_15;
        }
        [v5 addObject:v14];
        uint64_t v17 = VGGetVirtualGarageLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_214A2C000, v17, OS_LOG_TYPE_ERROR, "Discarding vehicle with stale charge state: %@ in favor of: %@", buf, 0x16u);
        }

LABEL_15:
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (!v7)
      {
LABEL_17:

        os_log_type_t v18 = VGGetVirtualGarageLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v52 = v18;
          uint32_t v19 = obj->_vehicles;
          v54 = v19;
          if (v19)
          {
            if ([(NSMutableArray *)v19 count])
            {
              long long v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v54, "count"));
              long long v64 = 0u;
              long long v65 = 0u;
              *(_OWORD *)v62 = 0u;
              long long v63 = 0u;
              long long v21 = v54;
              uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:v62 objects:buf count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v22; ++j)
                  {
                    if (*(void *)v63 != v23) {
                      objc_enumerationMutation(v21);
                    }
                    id v25 = *(id *)(*(void *)&v62[8] + 8 * j);
                    if (v25)
                    {
                      v26 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v25];
                    }
                    else
                    {
                      v26 = @"<nil>";
                    }

                    [v20 addObject:v26];
                  }
                  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:v62 objects:buf count:16];
                }
                while (v22);
              }

              v27 = [(NSMutableArray *)v21 componentsJoinedByString:@", "];
              uint64_t v28 = NSString;
              v29 = v21;
              v30 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v29];

              __int16 v31 = [v28 stringWithFormat:@"%@ [%@]", v30, v27];
            }
            else
            {
              v32 = NSString;
              __int16 v33 = v54;
              long long v20 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v33];

              __int16 v31 = [v32 stringWithFormat:@"%@ (empty)", v20];
            }
          }
          else
          {
            __int16 v31 = @"<nil>";
          }

          v51 = v31;
          v34 = v5;
          v55 = v34;
          if (v34)
          {
            if ([v34 count])
            {
              uint64_t v35 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSObject count](v55, "count"));
              long long v64 = 0u;
              long long v65 = 0u;
              *(_OWORD *)v62 = 0u;
              long long v63 = 0u;
              v36 = v55;
              uint64_t v37 = [v36 countByEnumeratingWithState:v62 objects:buf count:16];
              if (v37)
              {
                uint64_t v38 = *(void *)v63;
                do
                {
                  for (uint64_t k = 0; k != v37; ++k)
                  {
                    if (*(void *)v63 != v38) {
                      objc_enumerationMutation(v36);
                    }
                    id v40 = *(id *)(*(void *)&v62[8] + 8 * k);
                    if (v40)
                    {
                      v41 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v40];
                    }
                    else
                    {
                      v41 = @"<nil>";
                    }

                    [v35 addObject:v41];
                  }
                  uint64_t v37 = [v36 countByEnumeratingWithState:v62 objects:buf count:16];
                }
                while (v37);
              }

              v42 = [v36 componentsJoinedByString:@", "];
              v43 = NSString;
              v44 = v36;
              v45 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v44];

              v46 = [v43 stringWithFormat:@"%@ [%@]", v45, v42];
            }
            else
            {
              v47 = NSString;
              v48 = v55;
              uint64_t v35 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v48];

              v46 = [v47 stringWithFormat:@"%@ (empty)", v35];
            }
          }
          else
          {
            v46 = @"<nil>";
          }

          *(_DWORD *)v66 = 138412546;
          v67 = v51;
          __int16 v68 = 2112;
          v69 = v46;
          _os_log_impl(&dword_214A2C000, v52, OS_LOG_TYPE_INFO, "Force updating local vehicles: %@, with following vehicles: %@", v66, 0x16u);

          os_log_type_t v18 = v52;
        }

        objc_storeStrong((id *)&obj->_vehicles, v5);
        if (GEOConfigGetBOOL())
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v72 = 1;
          vehicles = obj->_vehicles;
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 3221225472;
          v57[2] = __44__VGVirtualGarage__forceUpdateWithVehicles___block_invoke;
          v57[3] = &unk_2642265A8;
          v57[4] = obj;
          v57[5] = buf;
          [(NSMutableArray *)vehicles enumerateObjectsUsingBlock:v57];
          if (*(unsigned char *)(*(void *)&buf[8] + 24) && obj->_selectedVehicleIdentifier)
          {
            v50 = VGGetVirtualGarageLog();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v62 = 0;
              _os_log_impl(&dword_214A2C000, v50, OS_LOG_TYPE_INFO, "Forced vehicle update removed the selected vehicle. Will deselect", v62, 2u);
            }

            [(VGVirtualGarage *)obj _selectVehicleWithIdentifier:0];
          }
          _Block_object_dispose(buf, 8);
        }
        [(VGVirtualGarage *)obj _notifyObserversGarageDidUpdateVehicles];
        goto LABEL_61;
      }
    }
  }
  id v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "Tried to update local vehicles with nil vehicles.", buf, 2u);
  }
LABEL_61:

  objc_sync_exit(obj);
}

- (void)_notifyObserversGarageDidUpdateVehicles
{
  id v4 = [(VGVirtualGarage *)self _garageCopy];
  BOOL v3 = [(VGVirtualGarage *)self delegate];
  [v3 virtualGarageDidUpdate:v4];
}

- (VGVehicle)selectedVehicle
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(VGVirtualGarage *)v2 _vehicleWithIdentifier:v2->_selectedVehicleIdentifier];
  objc_sync_exit(v2);

  return (VGVehicle *)v3;
}

- (id)_vehicleWithIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  obuint64_t j = (id *)&v5->super.isa;
  if (v4)
  {
    vehicles = v5->_vehicles;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __42__VGVirtualGarage__vehicleWithIdentifier___block_invoke;
    v30[3] = &unk_264225FC8;
    id v28 = v4;
    id v31 = v28;
    unint64_t v7 = [(NSMutableArray *)vehicles indexOfObjectPassingTest:v30];
    if (v7 >= [(NSMutableArray *)v5->_vehicles count])
    {
      long long v9 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        log = v9;
        id v10 = obj[1];
        v27 = v10;
        if (v10)
        {
          if ([v10 count])
          {
            int v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v27, "count"));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v12 = v27;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v33 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  id v16 = *(id *)(*((void *)&v32 + 1) + 8 * i);
                  if (v16)
                  {
                    uint64_t v17 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
                  }
                  else
                  {
                    uint64_t v17 = @"<nil>";
                  }

                  [v11 addObject:v17];
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v13);
            }

            os_log_type_t v18 = [v12 componentsJoinedByString:@", "];
            uint32_t v19 = NSString;
            id v20 = v12;
            long long v21 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v20];

            uint64_t v22 = [v19 stringWithFormat:@"%@ [%@]", v21, v18];
          }
          else
          {
            uint64_t v23 = NSString;
            id v24 = v27;
            int v11 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v24];

            uint64_t v22 = [v23 stringWithFormat:@"%@ (empty)", v11];
          }
        }
        else
        {
          uint64_t v22 = @"<nil>";
        }

        *(_DWORD *)buf = 138412546;
        id v37 = v28;
        __int16 v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_214A2C000, log, OS_LOG_TYPE_ERROR, "Didn't find vehicle with identifier: %@ in vehicles: %@.", buf, 0x16u);

        long long v9 = log;
      }

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [(NSMutableArray *)v5->_vehicles objectAtIndexedSubscript:v7];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_sync_exit(obj);

  return v8;
}

- (VGVirtualGarageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VGVirtualGarageDelegate *)WeakRetained;
}

- (void)_executeQueuedCompletionHandlersIfNeeded
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_queuedGetGarageCompletionHandlers count])
  {
    BOOL v3 = [(VGVirtualGarage *)self _garageCopy];
    id v4 = (void *)[(NSMutableArray *)self->_queuedGetGarageCompletionHandlers copy];
    [(NSMutableArray *)self->_queuedGetGarageCompletionHandlers removeAllObjects];
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = [v4 count];
      __int16 v20 = 2112;
      long long v21 = v3;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Will execute %lu queued completionHandlers with garage: %@.", buf, 0x16u);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    int v11 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend(v6, "count", (void)v13);
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v12;
      _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_INFO, "Finished executing %lu queued completionHandlers", buf, 0xCu);
    }
  }
  else
  {
    BOOL v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_DEBUG, "There are no queued completion handlers, nothing to do.", buf, 2u);
    }
  }
}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_finishedLoadingVehicles)
  {
    id v6 = [(VGVirtualGarage *)v5 _garageCopy];
    v4[2](v4, v6, 0);
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__VGVirtualGarage_virtualGarageGetGarageWithReply___block_invoke;
    v12[3] = &unk_2642265D0;
    long long v13 = v4;
    uint64_t v7 = (void *)MEMORY[0x2166AD0C0](v12);
    queuedGetGarageCompletionHandlers = v5->_queuedGetGarageCompletionHandlers;
    uint64_t v9 = (void *)MEMORY[0x2166AD0C0]();
    [(NSMutableArray *)queuedGetGarageCompletionHandlers addObject:v9];

    uint64_t v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = 0;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Garage hasn't finished loading vehicles from persistor. Once finished, reply block will be executed", (uint8_t *)&v11, 2u);
    }
  }
  objc_sync_exit(v5);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_persister)
  {
    BOOL v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      persister = self->_persister;
      *(_DWORD *)buf = 134218240;
      uint64_t v7 = self;
      __int16 v8 = 2048;
      uint64_t v9 = persister;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "Deallocating virtualGarage: %p with persister: %p", buf, 0x16u);
    }
  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  v5.receiver = self;
  v5.super_class = (Class)VGVirtualGarage;
  [(VGVirtualGarage *)&v5 dealloc];
}

uint64_t __51__VGVirtualGarage_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)description
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v23 = NSString;
  obuint64_t j = v2;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v24 = NSStringFromClass(v3);
  selectedVehicleIdentifier = v2->_selectedVehicleIdentifier;
  id v4 = v2->_vehicles;
  id v25 = v4;
  if (v4)
  {
    if ([(NSMutableArray *)v4 count])
    {
      objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v25, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = v25;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(id *)(*((void *)&v27 + 1) + 8 * i);
            if (v10)
            {
              __int16 v11 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
            }
            else
            {
              __int16 v11 = @"<nil>";
            }

            [v5 addObject:v11];
          }
          uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v7);
      }

      uint64_t v12 = [(NSMutableArray *)v6 componentsJoinedByString:@", "];
      long long v13 = NSString;
      long long v14 = v6;
      long long v15 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v14];

      long long v16 = [v13 stringWithFormat:@"%@ [%@]", v15, v12];
    }
    else
    {
      uint64_t v17 = NSString;
      os_log_type_t v18 = v25;
      uint64_t v19 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v18];

      long long v16 = [v17 stringWithFormat:@"%@ (empty)", v19];
    }
  }
  else
  {
    long long v16 = @"<nil>";
  }

  __int16 v20 = [v23 stringWithFormat:@"<%@:%p,\n _selectedVehicleIdentifier: %@,\n _vehicles: %@\n>", v24, obj, selectedVehicleIdentifier, v16];

  objc_sync_exit(obj);

  return (NSString *)v20;
}

uint64_t __42__VGVirtualGarage__vehicleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)setShouldAssumeFullCharge:(BOOL)a3
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_shouldAssumeFullCharge = a3;
  [(VGVirtualGarage *)obj _notifyObserversGarageDidUpdateVehicles];
  objc_sync_exit(obj);
}

- (BOOL)_persisterHasStaleStateForVehicle:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(VGVirtualGaragePersisting *)self->_persister persistedVehicleForVehicle:v4];
  if (!v5)
  {
    __int16 v20 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_214A2C000, v20, OS_LOG_TYPE_DEBUG, "_persisterHasStaleStateForVehicle: Didn't find persisted vehicle for vehicle: %@", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_9;
  }
  uint64_t v6 = [v4 currentVehicleState];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v5 currentVehicleState],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
LABEL_9:
    char v11 = 1;
    goto LABEL_10;
  }
  uint64_t v9 = [v4 currentVehicleState];
  id v10 = [v5 currentVehicleState];
  char v11 = [v9 isSignificantlyDifferentFromVehicleState:v10];

  GEOConfigGetDouble();
  double v13 = v12;
  long long v14 = [v5 currentVehicleState];
  long long v15 = [v14 dateOfUpdate];
  long long v16 = [v4 currentVehicleState];
  uint64_t v17 = [v16 dateOfUpdate];
  [v15 timeIntervalSinceDate:v17];
  double v19 = fabs(v18);

  if (v19 > v13) {
    char v11 = 1;
  }
LABEL_10:

  return v11;
}

- (void)_addVehicle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableArray *)v5->_vehicles containsObject:v4])
  {
    uint64_t v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "addVehicle: tried to add a vehicle that is already in the garage.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    [(NSMutableArray *)v5->_vehicles addObject:v4];
    [(VGVirtualGaragePersisting *)v5->_persister addVehicle:v4];
    uint64_t v7 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(NSMutableArray *)v5->_vehicles count];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Added vehicle: %@, vehicles.count: %lu", (uint8_t *)&v12, 0x16u);
    }

    if (!v5->_selectedVehicleIdentifier)
    {
      uint64_t v9 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v4 identifier];
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "Default selecting new vehicle: %@", (uint8_t *)&v12, 0xCu);
      }
      char v11 = [v4 identifier];
      [(VGVirtualGarage *)v5 _selectVehicleWithIdentifier:v11];
    }
    [(VGVirtualGarage *)v5 _notifyObserversGarageDidUpdateVehicles];
  }
  objc_sync_exit(v5);
}

- (void)_saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  vehicles = obj->_vehicles;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __50__VGVirtualGarage__saveVehicle_syncAcrossDevices___block_invoke;
  v34[3] = &unk_264225FC8;
  id v33 = v6;
  id v35 = v33;
  uint64_t v8 = [(NSMutableArray *)vehicles indexOfObjectPassingTest:v34];
  uint64_t v9 = VGGetVirtualGarageLog();
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v30 = v10;
      long long v29 = [v33 identifier];
      char v11 = obj->_vehicles;
      id v31 = v11;
      if (v11)
      {
        if ([(NSMutableArray *)v11 count])
        {
          int v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v31, "count"));
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v13 = v31;
          uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:buf count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v37 != v15) {
                  objc_enumerationMutation(v13);
                }
                id v17 = *(id *)(*((void *)&v36 + 1) + 8 * i);
                if (v17)
                {
                  double v18 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v17];
                }
                else
                {
                  double v18 = @"<nil>";
                }

                [v12 addObject:v18];
              }
              uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:buf count:16];
            }
            while (v14);
          }

          double v19 = [(NSMutableArray *)v13 componentsJoinedByString:@", "];
          __int16 v20 = NSString;
          long long v21 = v13;
          int v22 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v21];

          id v23 = [v20 stringWithFormat:@"%@ [%@]", v22, v19];
        }
        else
        {
          long long v27 = NSString;
          long long v28 = v31;
          int v12 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v28];

          id v23 = [v27 stringWithFormat:@"%@ (empty)", v12];
        }
      }
      else
      {
        id v23 = @"<nil>";
      }

      *(_DWORD *)id v40 = 138412546;
      uint64_t v41 = v29;
      __int16 v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_214A2C000, v30, OS_LOG_TYPE_ERROR, "_saveVehicle: Vehicle with ID: %@ wasn't found, it was removed before _save was called. vehicles: %@", v40, 0x16u);

      id v10 = v30;
    }
  }
  else
  {
    uint64_t v24 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v33;
      _os_log_impl(&dword_214A2C000, v24, OS_LOG_TYPE_INFO, "_saveVehicle: Vehicle was found, will replace it in local array: %@", buf, 0xCu);
    }

    [(NSMutableArray *)obj->_vehicles replaceObjectAtIndex:v8 withObject:v33];
    [(VGVirtualGarage *)obj _notifyObserversGarageDidUpdateVehicles];
    BOOL v25 = [(VGVirtualGarage *)obj _persisterHasStaleStateForVehicle:v33];
    if (v25)
    {
      v26 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v33;
        _os_log_impl(&dword_214A2C000, v26, OS_LOG_TYPE_INFO, "_saveVehicle: Will force sync chargeState because persister has stale info for vehicle: %@", buf, 0xCu);
      }
    }
    [(VGVirtualGaragePersisting *)obj->_persister saveVehicle:v33 syncAcrossDevices:v4 | v25];
  }

  objc_sync_exit(obj);
}

uint64_t __50__VGVirtualGarage__saveVehicle_syncAcrossDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 identifier];
  objc_super v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)_removeVehicleWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(VGVirtualGarage *)v5 _vehicleWithIdentifier:v4];
  if (v6)
  {
    uint64_t v7 = [(VGVirtualGarage *)v5 selectedVehicle];
    int v8 = [v6 isEqual:v7];

    if (v8) {
      [(VGVirtualGarage *)v5 _endContinuousUpdates];
    }
    [(NSMutableArray *)v5->_vehicles removeObject:v6];
    [(VGVirtualGaragePersisting *)v5->_persister removeVehicle:v6];
    uint64_t v9 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(NSMutableArray *)v5->_vehicles count];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "Removed vehicle: %@, vehicles.count: %lu", (uint8_t *)&v12, 0x16u);
    }

    [(VGVirtualGarage *)v5 _unpairVehicle:v6];
    [(VGVirtualGarage *)v5 _notifyObserversGarageDidUpdateVehicles];
  }
  else
  {
    char v11 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "removeVehicle: tried to remove a vehicle that is not in the garage.", (uint8_t *)&v12, 2u);
    }
  }
  objc_sync_exit(v5);
}

- (void)_selectVehicleWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (([v5 isEqualToString:v6->_selectedVehicleIdentifier] & 1) == 0)
  {
    uint64_t v7 = [(VGVirtualGarage *)v6 _vehicleWithIdentifier:v5];
    int v8 = (void *)v7;
    if (!v5 || v7)
    {
      objc_storeStrong((id *)&v6->_selectedVehicleIdentifier, a3);
      [(VGVirtualGaragePersisting *)v6->_persister setSelectedVehicleIdentifier:v5];
      uint64_t v10 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        int v12 = v8;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Selected vehicle: %@", (uint8_t *)&v11, 0xCu);
      }

      [(VGVirtualGarage *)v6 _notifyObserversGarageDidUpdateVehicles];
    }
    else
    {
      uint64_t v9 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "selectVehicle: tried to select a vehicle that is not in the garage.", (uint8_t *)&v11, 2u);
      }
    }
  }
  objc_sync_exit(v6);
}

- (void)_onboardVehicle:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v31 = a3;
  if (self->_dataCoordinator)
  {
    obuint64_t j = self;
    objc_sync_enter(obj);
    long long v27 = self;
    id v5 = [(VGDataCoordinator *)self->_dataCoordinator unpairedVehicles];
    uint64_t v6 = (void *)MEMORY[0x263F08A98];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __35__VGVirtualGarage__onboardVehicle___block_invoke;
    v32[3] = &unk_264226580;
    id v30 = v31;
    id v33 = v30;
    uint64_t v7 = [v6 predicateWithBlock:v32];
    long long v29 = [v5 filteredArrayUsingPredicate:v7];

    if ([v29 count] != 1)
    {
      int v8 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = v29;
        v26 = v9;
        if (v9)
        {
          if ([v9 count])
          {
            uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v26, "count"));
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v11 = v26;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:buf count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v35 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  id v15 = *(id *)(*((void *)&v34 + 1) + 8 * i);
                  if (v15)
                  {
                    uint64_t v16 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
                  }
                  else
                  {
                    uint64_t v16 = @"<nil>";
                  }

                  [v10 addObject:v16];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:buf count:16];
              }
              while (v12);
            }

            id v17 = [v11 componentsJoinedByString:@", "];
            double v18 = NSString;
            id v19 = v11;
            __int16 v20 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v19];

            long long v21 = [v18 stringWithFormat:@"%@ [%@]", v20, v17];
          }
          else
          {
            id v23 = NSString;
            id v24 = v26;
            uint64_t v10 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v24];

            long long v21 = [v23 stringWithFormat:@"%@ (empty)", v10];
          }
        }
        else
        {
          long long v21 = @"<nil>";
        }

        *(_DWORD *)long long v38 = 138412546;
        id v39 = v30;
        __int16 v40 = 2112;
        uint64_t v41 = v21;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "_onboardVehicle will onboard vehicle %@, but we didn't find exactly one match in unpairedVehicles: %@", v38, 0x16u);
      }
    }
    BOOL v25 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      Name = (const char *)v30;
      _os_log_impl(&dword_214A2C000, v25, OS_LOG_TYPE_INFO, "Onboarding vehicle: %@ in virtual garage.", buf, 0xCu);
    }

    [(VGDataCoordinator *)v27->_dataCoordinator finishOnboardingVehicle:v30];
    [(VGVirtualGarage *)obj _addVehicle:v30];

    p_super = &obj->super;
    objc_sync_exit(obj);
  }
  else
  {
    p_super = VGGetVirtualGarageLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_214A2C000, p_super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", buf, 0xCu);
    }
  }
}

uint64_t __35__VGVirtualGarage__onboardVehicle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)_unpairVehicle:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  if (self->_dataCoordinator)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      Name = v5;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Unpairing vehicle: %@", (uint8_t *)&v8, 0xCu);
    }

    [(VGDataCoordinator *)self->_dataCoordinator unpairVehicle:v5];
    objc_sync_exit(v6);
  }
  else
  {
    VGGetVirtualGarageLog();
    uint64_t v6 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_214A2C000, &v6->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_setShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  int v8 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    uint64_t v10 = v9;
    int v14 = 138412546;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "setShouldUsePreferredNetworks: %@ for vehicle: %@", (uint8_t *)&v14, 0x16u);
  }
  id v11 = [v6 identifier];
  uint64_t v12 = [(VGVirtualGarage *)v7 _vehicleWithIdentifier:v11];

  uint64_t v13 = [v12 _vehicleByUpdatingUsesPreferredNetworksForRouting:v4];
  [(VGVirtualGarage *)v7 _saveVehicle:v13 syncAcrossDevices:1];

  objc_sync_exit(v7);
}

- (void)_startContinuousUpdatesIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_dataCoordinator)
  {
    id v3 = self;
    objc_sync_enter(v3);
    BOOL v4 = [(VGVirtualGarage *)v3 selectedVehicle];
    id v5 = VGGetVirtualGarageLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        int v8 = 138412290;
        Name = v4;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Garage will start continuous updates for vehicle: %@", (uint8_t *)&v8, 0xCu);
      }

      [(VGDataCoordinator *)self->_dataCoordinator startContinuousUpdatesForVehicle:v4];
    }
    else
    {
      if (v6)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Garage will not start continuous updates, because there is no selected vehicle", (uint8_t *)&v8, 2u);
      }
    }
    objc_sync_exit(v3);
  }
  else
  {
    VGGetVirtualGarageLog();
    id v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_214A2C000, &v3->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_endContinuousUpdates
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_dataCoordinator)
  {
    id v3 = self;
    objc_sync_enter(v3);
    BOOL v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "Garage will end continuous updates.", (uint8_t *)&v6, 2u);
    }

    [(VGDataCoordinator *)self->_dataCoordinator endAllContinuousUpdates];
    objc_sync_exit(v3);
  }
  else
  {
    VGGetVirtualGarageLog();
    id v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_214A2C000, &v3->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __30__VGVirtualGarage__garageCopy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPureElectricVehicle] ^ 1;
}

void __44__VGVirtualGarage__forceUpdateWithVehicles___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 identifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)garagePersister:(id)a3 wantsToUpdateVehicles:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char BOOL = GEOConfigGetBOOL();
  id v9 = VGGetVirtualGarageLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (BOOL)
  {
    if (v10)
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138412546;
      int v14 = v12;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "garagePersister: %@ wants to update vehicles with vehicles: %@", (uint8_t *)&v13, 0x16u);
    }
    [(VGVirtualGarage *)self _forceUpdateWithVehicles:v7];
    [(VGVirtualGarage *)self _removeVehiclesWithUninstalledAppsIfNeeded];
  }
  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "GeoConfig_EVRoutingUseMapsSyncLiveUpdates is not set, we're ignoring live updates.", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3.var0 == *MEMORY[0x263F41700] && a3.var1 == *(void **)(MEMORY[0x263F41700] + 8))
  {
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int BOOL = GEOConfigGetBOOL();
      id v7 = @"NO";
      if (BOOL) {
        id v7 = @"YES";
      }
      uint64_t v8 = v7;
      int v9 = 138412290;
      BOOL v10 = v8;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "GEOConfigs changed, isEVRoutingEnabled: %@", (uint8_t *)&v9, 0xCu);
    }
    [(VGVirtualGarage *)self _updateDataCoordinatorAvailability];
  }
}

- (void)dataCoordinator:(id)a3 wantsToUpdateVehicle:(id)a4 syncAcrossDevices:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "DataCoordinator wants to save vehicle: %@", (uint8_t *)&v9, 0xCu);
  }

  [(VGVirtualGarage *)self _saveVehicle:v7 syncAcrossDevices:v5];
}

- (void)dataCoordinator:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5 = a4;
  id v6 = [(VGVirtualGarage *)self delegate];
  [v6 virtualGarage:self didUpdateUnpairedVehicles:v5];
}

- (void)dataCoordinatorDidUpdateInstalledApps:(id)a3
{
  BOOL v4 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "DataCoordinator updated installed apps. Will try to remove vehicles that have no OEM app.", v5, 2u);
  }

  [(VGVirtualGarage *)self _removeVehiclesWithUninstalledAppsIfNeeded];
}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  id v4 = [a3 identifier];
  [(VGVirtualGarage *)self _removeVehicleWithIdentifier:v4];
}

- (void)virtualGarageSelectVehicle:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(VGVirtualGarage *)self selectedVehicle];
  id v6 = [v4 identifier];
  [(VGVirtualGarage *)self _selectVehicleWithIdentifier:v6];

  if ([v4 isPureElectricVehicle])
  {
    id v7 = [v5 identifier];
    uint64_t v8 = [v4 identifier];
    int v9 = [v7 isEqualToString:v8];

    if (!v9
      || ([v5 currentVehicleState],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v4 currentVehicleState],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v10 isSignificantlyDifferentFromVehicleState:v11],
          v11,
          v10,
          v12))
    {
      int v13 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [v4 identifier];
        int v16 = 138412290;
        uint64_t v17 = v14;
        _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "Will fetch SoC for vehicle: (%@) after it's been selected.", (uint8_t *)&v16, 0xCu);
      }
      __int16 v15 = [v4 identifier];
      [(VGVirtualGarage *)self virtualGarageGetLatestStateOfVehicleWithIdentifier:v15 syncAcrossDevices:1 withReply:&__block_literal_global_25_0];
    }
  }
}

void __46__VGVirtualGarage_virtualGarageSelectVehicle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = VGGetVirtualGarageLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 identifier];
      int v13 = 138412546;
      int v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      int v9 = "Failed fetching SoC for newly selected vehicle: (%@) with error: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_214A2C000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 identifier];
    int v13 = 138412290;
    int v14 = v8;
    int v9 = "Did finish fetching SoC for vehicle: (%@) after it's been selected.";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)virtualGarageSaveVehicle:(id)a3
{
}

- (void)virtualGarageForceFetchAllVehicles
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(VGDataCoordinator *)obj->_dataCoordinator forceFetchAllVehicles];
  objc_sync_exit(obj);
}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      os_log_type_t v11 = self;
      objc_sync_enter(v11);
      uint32_t v12 = VGGetDataCoordinatorLog();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      int v14 = VGGetDataCoordinatorLog();
      __int16 v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GetVehicleState", "", buf, 2u);
      }

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
      v36[3] = &unk_264226618;
      os_signpost_id_t v38 = v13;
      id v37 = v10;
      id v16 = (void (**)(void, void, void))MEMORY[0x2166AD0C0](v36);
      if ([v8 isEqualToString:v11->_selectedVehicleIdentifier]) {
        [(VGVirtualGarage *)v11 selectedVehicle];
      }
      else {
      uint64_t v17 = [(VGVirtualGarage *)v11 _vehicleWithIdentifier:v8];
      }
      uint64_t v18 = v17;
      if (v17)
      {
        if ([v17 isPureElectricVehicle])
        {
          objc_initWeak((id *)buf, v11);
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_38;
          v32[3] = &unk_264226668;
          objc_copyWeak(&v34, (id *)buf);
          id v19 = v18;
          id v33 = v19;
          BOOL v35 = a4;
          __int16 v20 = (void (**)(void, void, void))MEMORY[0x2166AD0C0](v32);
          int BOOL = GEOConfigGetBOOL();
          int v22 = VGGetVirtualGarageLog();
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if (BOOL)
          {
            if (v23)
            {
              *(_WORD *)id v31 = 0;
              _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_INFO, "EVRoutingSynchronousVehicleStateUpdate is on, will fetch SOC and wait before calling completion block.", v31, 2u);
            }

            id v24 = v16;
          }
          else
          {
            if (v23)
            {
              *(_WORD *)id v31 = 0;
              _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_INFO, "EVRoutingSynchronousVehicleStateUpdate is off, getting latest SoC from what is currently in the garage.", v31, 2u);
            }

            ((void (**)(void, id, void))v16)[2](v16, v19, 0);
            id v24 = 0;
          }
          ((void (**)(void, id, void))v20)[2](v20, v19, v24);

          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);
LABEL_29:

          objc_sync_exit(v11);
          goto LABEL_30;
        }
        BOOL v25 = @"Fetched vehicle is not an EV vehicle.";
      }
      else
      {
        BOOL v25 = @"Could not fetch a vehicle.";
      }
      v26 = (void *)MEMORY[0x263F087E8];
      long long v27 = GEOErrorDomain();
      uint64_t v39 = *MEMORY[0x263F08320];
      __int16 v40 = v25;
      long long v28 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      long long v29 = [v26 errorWithDomain:v27 code:-8 userInfo:v28];

      id v30 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v42 = v29;
        _os_log_impl(&dword_214A2C000, v30, OS_LOG_TYPE_ERROR, "Unable to fetch a state for vehicle. Error: %@", buf, 0xCu);
      }

      ((void (**)(void, void, char *))v16)[2](v16, 0, v29);
      goto LABEL_29;
    }
    VGGetAssertLog();
    os_log_type_t v11 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v42 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
      __int16 v43 = 2082;
      uint64_t v44 = "reply == nil";
      __int16 v45 = 2082;
      uint64_t v46 = "reply block cannot be nil";
      goto LABEL_12;
    }
  }
  else
  {
    VGGetAssertLog();
    os_log_type_t v11 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v42 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
      __int16 v43 = 2082;
      uint64_t v44 = "identifier == nil";
      __int16 v45 = 2082;
      uint64_t v46 = "vehicleIdentifier cannot be nil";
LABEL_12:
      _os_log_impl(&dword_214A2C000, &v11->super, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
  }
LABEL_30:
}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = VGGetDataCoordinatorLog();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v8, OS_SIGNPOST_INTERVAL_END, v9, "GetVehicleState", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    os_signpost_id_t v9 = (void *)*((void *)WeakRetained + 4);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_39;
    v11[3] = &unk_264226640;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v12 = *(id *)(a1 + 32);
    char v15 = *(unsigned char *)(a1 + 48);
    id v13 = v6;
    [v9 getLatestStateOfVehicle:v5 withReply:v11];

    objc_destroyWeak(&v14);
  }
  else
  {
    id v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 737;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v8 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v14 = *(const char **)(a1 + 32);
        int v20 = 138412546;
        long long v21 = v14;
        __int16 v22 = 2112;
        id v23 = v6;
        os_signpost_id_t v9 = "Failed to get the latest state of vehicle: %@. with error: %@";
        id v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
        goto LABEL_12;
      }
    }
    else if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v8 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        long long v21 = v5;
        os_signpost_id_t v9 = "Updated vehicle: %@ is the same as the existing one. Not saving the state.";
        id v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_INFO;
        uint32_t v12 = 12;
LABEL_12:
        _os_log_impl(&dword_214A2C000, v10, v11, v9, (uint8_t *)&v20, v12);
      }
    }
    else
    {
      uint64_t v17 = [v5 identifier];
      id v8 = [WeakRetained _vehicleWithIdentifier:v17];

      if (v8)
      {
        uint64_t v15 = [v8 _vehicleByUpdatingWithVehicle:v5];

        __int16 v18 = VGGetVirtualGarageLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          long long v21 = (const char *)v15;
          _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_INFO, "Received the latest state of vehicle: %@ through virtualGarageGetLatestStateOfVehicle. Will save the state.", (uint8_t *)&v20, 0xCu);
        }

        [WeakRetained _saveVehicle:v15 syncAcrossDevices:*(unsigned __int8 *)(a1 + 56)];
        goto LABEL_14;
      }
      int v19 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        long long v21 = v5;
        _os_log_impl(&dword_214A2C000, v19, OS_LOG_TYPE_INFO, "Received the latest state of vehicle: %@ through virtualGarageGetLatestStateOfVehicle, but the underlying vehicle was removed from the garage before the callback returned.", (uint8_t *)&v20, 0xCu);
      }

      id v8 = 0;
    }
    uint64_t v15 = (uint64_t)v5;
LABEL_14:

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, v15, v6);
    }
    id v5 = (char *)v15;
    goto LABEL_17;
  }
  id v13 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315394;
    long long v21 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]_block_invoke";
    __int16 v22 = 1024;
    LODWORD(v23) = 740;
    _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v20, 0x12u);
  }

LABEL_17:
}

- (BOOL)shouldAssumeFullCharge
{
  return self->_shouldAssumeFullCharge;
}

@end