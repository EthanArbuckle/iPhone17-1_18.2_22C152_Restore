@interface VGDataCoordinator
- (BOOL)shouldUnpairVehicle:(id)a3;
- (NSArray)unpairedVehicles;
- (VGDataCoordinator)initWithApplicationFinder:(id)a3 externalAccessory:(id)a4 delegate:(id)a5;
- (double)_vehicleStateRefreshInterval;
- (id)_applicationForVehicle:(id)a3;
- (id)_applicationRecordForVehicle:(id)a3;
- (id)_oemAppForChargeStreamForVehicle:(id)a3;
- (id)_unpairedOEMVehicles;
- (id)_vehicleStateProviderForVehicle:(id)a3;
- (id)deviceIdentifier;
- (unint64_t)_indexOfVehicleInUnpairedVehicles:(id)a3;
- (void)OEMAppsUpdated:(id)a3;
- (void)_invalidateRefreshTimer;
- (void)_loadAllOEMVehiclesForApps:(id)a3 completion:(id)a4;
- (void)_loadIapVehicles;
- (void)_refreshStateForTrackedVehicles;
- (void)_removeUnpairedIapVehicleIfNeeded;
- (void)_saveOnboardingInfoForVehicle:(id)a3;
- (void)_setupTimerIfNeeded;
- (void)_startChargeStreamForVehicle:(id)a3;
- (void)_stopChargeStreamForVehicle:(id)a3;
- (void)_updateGarageWithVehicle:(id)a3 syncAcrossDevices:(BOOL)a4;
- (void)_updateStateOfChargeForVehicle:(id)a3 syncAcrossDevices:(BOOL)a4 completion:(id)a5;
- (void)accessoryUpdatedWithVehicle:(id)a3;
- (void)dealloc;
- (void)endAllContinuousUpdates;
- (void)finishOnboardingVehicle:(id)a3;
- (void)forceFetchAllVehicles;
- (void)getLatestStateOfVehicle:(id)a3 withReply:(id)a4;
- (void)startContinuousUpdatesForVehicle:(id)a3;
- (void)unpairVehicle:(id)a3;
- (void)vehicleStateUpdated:(id)a3;
@end

@implementation VGDataCoordinator

uint64_t __37__VGDataCoordinator_unpairedVehicles__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x270F9A758]();
}

uint64_t __37__VGDataCoordinator__loadIapVehicles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  if (v3) {
    [*(id *)(a1 + 32) accessoryUpdatedWithVehicle:v3];
  }

  return MEMORY[0x270F9A758]();
}

- (NSArray)unpairedVehicles
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__VGDataCoordinator_unpairedVehicles__block_invoke;
  v5[3] = &unk_2642260A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (VGDataCoordinator)initWithApplicationFinder:(id)a3 externalAccessory:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VGDataCoordinator;
  v12 = [(VGDataCoordinator *)&v24 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("VGDataCoordinator.WorkQueue", v13);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("VGDataCoordinator.DelegateQueue", v16);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v12->_delegate, v11);
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    unpairedVehicles = v12->_unpairedVehicles;
    v12->_unpairedVehicles = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9C0] set];
    observedVehicles = v12->_observedVehicles;
    v12->_observedVehicles = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v12->_applicationFinder, a3);
    [(VGOEMApplicationFinding *)v12->_applicationFinder setDelegate:v12];
    [(VGOEMApplicationFinding *)v12->_applicationFinder findOEMApplications];
    objc_storeStrong((id *)&v12->_accessory, a4);
    [(VGExternalAccessory *)v12->_accessory setAccessoryUpdateDelegate:v12];
    [(VGDataCoordinator *)v12 _loadIapVehicles];
  }

  return v12;
}

- (void)_loadIapVehicles
{
  char BOOL = GEOConfigGetBOOL();
  v4 = VGGetDataCoordinatorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (BOOL)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "_loadIapVehicles: Loading iAP2 vehicles.", buf, 2u);
    }

    accessory = self->_accessory;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__VGDataCoordinator__loadIapVehicles__block_invoke;
    v7[3] = &unk_2642262C8;
    v7[4] = self;
    [(VGExternalAccessory *)accessory listCarsWithCompletion:v7];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "_loadIapVehicles: iap2 onboarding is disabled. Will not load iap2 vehicles.", buf, 2u);
    }
  }
}

- (void)dealloc
{
  [(VGDataCoordinator *)self _invalidateRefreshTimer];
  v3.receiver = self;
  v3.super_class = (Class)VGDataCoordinator;
  [(VGDataCoordinator *)&v3 dealloc];
}

- (id)deviceIdentifier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  deviceIdentifier = self->_deviceIdentifier;
  if (!deviceIdentifier)
  {
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    BOOL v5 = [v4 deviceIdentifierForVendor];
    uint64_t v6 = [v5 UUIDString];

    v7 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_DEFAULT, "loaded device identifier as: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = self->_deviceIdentifier;
    self->_deviceIdentifier = v6;

    deviceIdentifier = self->_deviceIdentifier;
  }

  return deviceIdentifier;
}

- (double)_vehicleStateRefreshInterval
{
  GEOConfigGetDouble();
  return result;
}

- (void)forceFetchAllVehicles
{
  objc_super v3 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "forceFetchAllVehicles: will reload all SI and iAP2 vehicles", (uint8_t *)buf, 2u);
  }

  [(VGDataCoordinator *)self _loadIapVehicles];
  [(VGOEMApplicationFinding *)self->_applicationFinder findOEMApplications];
  objc_initWeak(buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke;
  block[3] = &unk_2642260C8;
  objc_copyWeak(&v6, buf);
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _loadAllOEMVehiclesForApps:WeakRetained[5] completion:&__block_literal_global_1];
  }
  else
  {
    objc_super v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      BOOL v5 = "-[VGDataCoordinator forceFetchAllVehicles]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 128;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

void __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke_7()
{
  v0 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_214A2C000, v0, OS_LOG_TYPE_INFO, "forceFetchAllVehicles: finished reloading vehicles", v1, 2u);
  }
}

- (void)_updateGarageWithVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  int v7 = a3;
  uint64_t v8 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v9;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = WeakRetained;
    if (WeakRetained)
    {
      v78 = v7;
      uint64_t v12 = [WeakRetained vehicles];
      int64_t v13 = +[VGVehicleDeduper actionForAddingNewVehicle:&v78 withExistingGarageVehicles:v12 andUnpairedVehicles:self->_unpairedVehicles];
      dispatch_queue_t v14 = v78;

      switch(v13)
      {
        case 0:
          v15 = VGGetDataCoordinatorLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: No action to update the garage with.", buf, 2u);
          }
          break;
        case 1:
          v16 = VGGetDataCoordinatorLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v84 = (const char *)v14;
            _os_log_impl(&dword_214A2C000, v16, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Updating a vehicle in VG :%@.", buf, 0xCu);
          }

          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke;
          block[3] = &unk_2642260F0;
          v74 = v11;
          v75 = self;
          dispatch_queue_t v14 = v14;
          v76 = v14;
          BOOL v77 = a4;
          dispatch_async(delegateQueue, block);

          v15 = v74;
          break;
        case 2:
          unint64_t v18 = [(VGDataCoordinator *)self _indexOfVehicleInUnpairedVehicles:v14];
          uint64_t v19 = VGGetDataCoordinatorLog();
          v15 = v19;
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v84 = (const char *)v14;
              _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Found a new vehicle. Saving vehicle in dataCoordinator until it's onboarded through UI. Vehicle: :%@.", buf, 0xCu);
            }

            [(NSMutableArray *)self->_unpairedVehicles addObject:v14];
            v20 = self->_delegateQueue;
            v67[0] = MEMORY[0x263EF8330];
            v67[1] = 3221225472;
            v67[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_10;
            v67[3] = &unk_264226118;
            v68 = v11;
            v69 = self;
            dispatch_async(v20, v67);
            v15 = v68;
            break;
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            break;
          }
          v40 = self->_unpairedVehicles;
          v41 = v40;
          if (v40)
          {
            if ([(NSMutableArray *)v40 count])
            {
              v65 = v14;
              v42 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v41, "count"));
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              v63 = v41;
              v43 = v41;
              uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v79 objects:buf count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v80;
                do
                {
                  for (uint64_t i = 0; i != v45; ++i)
                  {
                    if (*(void *)v80 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    v48 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                    if (v48)
                    {
                      v49 = NSString;
                      id v50 = v48;
                      v51 = [v49 stringWithFormat:@"%@<%p>", objc_opt_class(), v50];
                    }
                    else
                    {
                      v51 = @"<nil>";
                    }
                    [v42 addObject:v51];
                  }
                  uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v79 objects:buf count:16];
                }
                while (v45);
              }

              v52 = [(NSMutableArray *)v43 componentsJoinedByString:@", "];
              v53 = NSString;
              v54 = v43;
              v55 = [v53 stringWithFormat:@"%@<%p>", objc_opt_class(), v54];

              v39 = [v53 stringWithFormat:@"%@ [%@]", v55, v52];

              dispatch_queue_t v14 = v65;
              v41 = v63;
            }
            else
            {
              v61 = NSString;
              v62 = v41;
              v42 = [v61 stringWithFormat:@"%@<%p>", objc_opt_class(), v62];

              v39 = [v61 stringWithFormat:@"%@ (empty)", v42];
            }
          }
          else
          {
            v39 = @"<nil>";
          }

          *(_DWORD *)buf = 138412546;
          v84 = (const char *)v39;
          __int16 v85 = 2112;
          v86 = v14;
          v60 = "_updateGarageWithVehicle: Tried to add unpaired vehicle, but it already exists in the array: %@, vehicle: %@";
          goto LABEL_60;
        case 3:
          unint64_t v21 = [(VGDataCoordinator *)self _indexOfVehicleInUnpairedVehicles:v14];
          v22 = VGGetDataCoordinatorLog();
          v15 = v22;
          if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              v23 = self->_unpairedVehicles;
              objc_super v24 = v23;
              if (v23)
              {
                if ([(NSMutableArray *)v23 count])
                {
                  v64 = v14;
                  v66 = v11;
                  v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v24, "count"));
                  long long v79 = 0u;
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  v26 = v24;
                  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v79 objects:buf count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v80;
                    do
                    {
                      for (uint64_t j = 0; j != v28; ++j)
                      {
                        if (*(void *)v80 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        v31 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                        if (v31)
                        {
                          v32 = NSString;
                          id v33 = v31;
                          v34 = [v32 stringWithFormat:@"%@<%p>", objc_opt_class(), v33];
                        }
                        else
                        {
                          v34 = @"<nil>";
                        }
                        [v25 addObject:v34];
                      }
                      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v79 objects:buf count:16];
                    }
                    while (v28);
                  }

                  v35 = [(NSMutableArray *)v26 componentsJoinedByString:@", "];
                  v36 = NSString;
                  v37 = v26;
                  v38 = [v36 stringWithFormat:@"%@<%p>", objc_opt_class(), v37];

                  v39 = [v36 stringWithFormat:@"%@ [%@]", v38, v35];

                  dispatch_queue_t v14 = v64;
                  id v11 = v66;
                }
                else
                {
                  v58 = NSString;
                  v59 = v24;
                  v25 = [v58 stringWithFormat:@"%@<%p>", objc_opt_class(), v59];

                  v39 = [v58 stringWithFormat:@"%@ (empty)", v25];
                }
              }
              else
              {
                v39 = @"<nil>";
              }

              *(_DWORD *)buf = 138412546;
              v84 = (const char *)v39;
              __int16 v85 = 2112;
              v86 = v14;
              v60 = "_updateGarageWithVehicle: didn't find an unpaired vehicle to update in _unpairedVehicles array: %@, vehicle: %@";
LABEL_60:
              _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_FAULT, v60, buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v56 = [(NSMutableArray *)self->_unpairedVehicles objectAtIndexedSubscript:v21];
              *(_DWORD *)buf = 138412546;
              v84 = v56;
              __int16 v85 = 2112;
              v86 = v14;
              _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Replacing an upaired vehicle with an updated one. existing vehicle: %@, updated vehicle: %@", buf, 0x16u);
            }
            [(NSMutableArray *)self->_unpairedVehicles replaceObjectAtIndex:v21 withObject:v14];
            v57 = self->_delegateQueue;
            v70[0] = MEMORY[0x263EF8330];
            v70[1] = 3221225472;
            v70[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_9;
            v70[3] = &unk_264226118;
            v71 = v11;
            v72 = self;
            dispatch_async(v57, v70);
            v15 = v71;
          }
          break;
        default:
          goto LABEL_62;
      }
    }
    else
    {
      v15 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v84 = "-[VGDataCoordinator _updateGarageWithVehicle:syncAcrossDevices:]";
        __int16 v85 = 1024;
        LODWORD(v86) = 147;
        _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }
      dispatch_queue_t v14 = v7;
    }

LABEL_62:
  }
  else
  {
    dispatch_queue_t v14 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_INFO, "_updateGarageWithState: tried to update garage with a nil vehicle. No action for the DataCoordinator.", buf, 2u);
    }
  }
}

uint64_t __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataCoordinator:*(void *)(a1 + 40) wantsToUpdateVehicle:*(void *)(a1 + 48) syncAcrossDevices:*(unsigned __int8 *)(a1 + 56)];
}

void __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_9(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(v2 + 56) copy];
  [v1 dataCoordinator:v2 didUpdateUnpairedVehicles:v3];
}

void __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_10(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(v2 + 56) copy];
  [v1 dataCoordinator:v2 didUpdateUnpairedVehicles:v3];
}

- (void)_updateStateOfChargeForVehicle:(id)a3 syncAcrossDevices:(BOOL)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = &__block_literal_global_12;
  }
  int v10 = (void (**)(void))MEMORY[0x2166AD0C0](v9);
  id v11 = [(VGDataCoordinator *)self _vehicleStateProviderForVehicle:v8];
  uint64_t v12 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int64_t v13 = (objc_class *)objc_opt_class();
    dispatch_queue_t v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412546;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_INFO, "Will update SoC using %@ for vehicle: %@.", buf, 0x16u);
  }
  if (v11)
  {
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_13;
    v16[3] = &unk_264226168;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = v8;
    uint64_t v19 = v10;
    id v18 = v11;
    BOOL v21 = a4;
    [v18 getStateOfChargeForVehicle:v17 completion:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "Couldn't update SoC for vehicle: %@, because there was no source.", buf, 0xCu);
    }

    v10[2](v10);
  }
}

void __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_14;
    block[3] = &unk_264226140;
    objc_copyWeak(&v17, (id *)(a1 + 56));
    id v12 = v5;
    id v13 = *(id *)(a1 + 32);
    id v14 = v6;
    id v16 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    char v18 = *(unsigned char *)(a1 + 64);
    dispatch_async(v9, block);

    objc_destroyWeak(&v17);
  }
  else
  {
    int v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[VGDataCoordinator _updateStateOfChargeForVehicle:syncAcrossDevices:completion:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 216;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_14(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = VGGetDataCoordinatorLog();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        int v7 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = *(void *)(a1 + 32);
        int v12 = 138412546;
        id v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Received vehicleState and will update vehicle. Source: %@ state: %@.", (uint8_t *)&v12, 0x16u);
      }
      [*(id *)(a1 + 40) _updateWithVehicleState:*(void *)(a1 + 32)];
      [WeakRetained _updateGarageWithVehicle:*(void *)(a1 + 40) syncAcrossDevices:*(unsigned __int8 *)(a1 + 80)];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v10 = *(const char **)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        int v12 = 138412546;
        id v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "Failed to get vehicleState for vehicle: %@. error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v9 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[VGDataCoordinator _updateStateOfChargeForVehicle:syncAcrossDevices:completion:]_block_invoke";
      __int16 v14 = 1024;
      LODWORD(v15) = 218;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (unint64_t)_indexOfVehicleInUnpairedVehicles:(id)a3
{
  id v4 = a3;
  unpairedVehicles = self->_unpairedVehicles;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__VGDataCoordinator__indexOfVehicleInUnpairedVehicles___block_invoke;
  v9[3] = &unk_264225FC8;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)unpairedVehicles indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __55__VGDataCoordinator__indexOfVehicleInUnpairedVehicles___block_invoke(uint64_t a1, void *a2)
{
  return VGVehiclesHaveMatchingVehicleStateProviders(*(void **)(a1 + 32), a2);
}

- (id)_vehicleStateProviderForVehicle:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(VGExternalAccessory *)self->_accessory isConnectedToVehicle:v4])
  {
    id v5 = self->_accessory;
  }
  else
  {
    id v5 = [(VGDataCoordinator *)self _applicationForVehicle:v4];
  }
  id v6 = v5;
  if (v5 && ([(VGExternalAccessory *)v5 conformsToProtocol:&unk_26C59A0C8] & 1) == 0)
  {
    uint64_t v8 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_FAULT, "vehicleStateProvider: %@ does not conform to VGVehicleStateProviding", (uint8_t *)&v12, 0xCu);
    }
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = v6;
  }

  return v7;
}

- (void)finishOnboardingVehicle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke;
  v7[3] = &unk_2642261B8;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(workQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[VGDataCoordinator finishOnboardingVehicle:]_block_invoke";
      __int16 v40 = 1024;
      LODWORD(v41) = 264;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  uint64_t v3 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "finishOnboardingVehicle: will update and remove vehicle: %@ from unpairedVehicles.", buf, 0xCu);
  }

  [*(id *)(a1 + 40) _saveOnboardingInfoForVehicle:*(void *)(a1 + 32)];
  uint64_t v5 = [WeakRetained _indexOfVehicleInUnpairedVehicles:*(void *)(a1 + 32)];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = *(const char **)(a1 + 32);
      id v8 = *((id *)WeakRetained + 7);
      id v9 = v8;
      if (v8)
      {
        if ([v8 count])
        {
          v31 = v7;
          id v32 = WeakRetained;
          id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v30 = v9;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:buf count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v35 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (v16)
                {
                  id v17 = NSString;
                  id v18 = v16;
                  uint64_t v19 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];
                }
                else
                {
                  uint64_t v19 = @"<nil>";
                }
                [v10 addObject:v19];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:buf count:16];
            }
            while (v13);
          }

          id v20 = [v11 componentsJoinedByString:@", "];
          __int16 v21 = NSString;
          id v22 = v11;
          uint64_t v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

          __int16 v24 = [v21 stringWithFormat:@"%@ [%@]", v23, v20];

          id WeakRetained = v32;
          id v9 = v30;
          unint64_t v7 = v31;
        }
        else
        {
          uint64_t v28 = NSString;
          id v29 = v9;
          id v10 = [v28 stringWithFormat:@"%@<%p>", objc_opt_class(), v29];

          __int16 v24 = [v28 stringWithFormat:@"%@ (empty)", v10];
        }
      }
      else
      {
        __int16 v24 = @"<nil>";
      }

      *(_DWORD *)buf = 138412546;
      v39 = v7;
      __int16 v40 = 2112;
      v41 = v24;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "_removeUnpairedVehicle: Tried to remove unpaired vehicle: %@, but _unpairedVehicles don't contain that vehicle. %@", buf, 0x16u);
    }
LABEL_28:

    goto LABEL_29;
  }
  [*((id *)WeakRetained + 7) removeObjectAtIndex:v5];
  id v25 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v26;
    _os_log_impl(&dword_214A2C000, v25, OS_LOG_TYPE_INFO, "_removeUnpairedVehicle: removed vehicle: %@ from unpairedVehicles.", buf, 0xCu);
  }

  uint64_t v27 = *((void *)WeakRetained + 3);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke_64;
  block[3] = &unk_264226190;
  void block[4] = WeakRetained;
  dispatch_async(v27, block);
LABEL_29:
}

void __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)[*(id *)(v2 + 56) copy];
  [WeakRetained dataCoordinator:v2 didUpdateUnpairedVehicles:v3];
}

- (BOOL)shouldUnpairVehicle:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 pairedAppIdentifier];

  if (!v5)
  {
    id v10 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: vehicle doesn't have a pairedAppId -> NO", (uint8_t *)&v23, 2u);
    }
    goto LABEL_12;
  }
  id v6 = [(VGDataCoordinator *)self deviceIdentifier];
  unint64_t v7 = [v4 pairedAppInstallDeviceIdentifier];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v10 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v20 = [v4 pairedAppInstallDeviceIdentifier];
      __int16 v21 = [(VGDataCoordinator *)self deviceIdentifier];
      int v23 = 138412546;
      __int16 v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is not the primary device. vehicle.deviceId: %@, self.deviceId: %@ -> NO", (uint8_t *)&v23, 0x16u);
    }
LABEL_12:
    char v14 = 0;
    goto LABEL_16;
  }
  id v9 = [(VGDataCoordinator *)self _applicationRecordForVehicle:v4];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 installSessionIdentifier];
    uint64_t v12 = [v4 pairedAppInstallSessionIdentifier];
    int v13 = [v11 isEqual:v12];
    char v14 = v13 ^ 1;

    uint64_t v15 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v4 pairedAppInstallSessionIdentifier];
      id v17 = [v10 installSessionIdentifier];
      id v18 = @"YES";
      if (v13) {
        id v18 = @"NO";
      }
      uint64_t v19 = v18;
      int v23 = 138412802;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is a primary device, the OEM app is installed, vehicle.installId: %@, oemApp.installId: %@ -> %@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    uint64_t v15 = VGGetDataCoordinatorLog();
    char v14 = 1;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is a primary device and the OEM app is not installed -> YES", (uint8_t *)&v23, 2u);
    }
  }

LABEL_16:
  return v14;
}

- (id)_applicationRecordForVehicle:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 pairedAppIdentifier];

  id v11 = 0;
  unint64_t v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    id v9 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "Failed to load application record with error: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)_saveOnboardingInfoForVehicle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 pairedAppIdentifier];

  if (!v5)
  {
    id v10 = [v4 headUnitIdentifier];
    if ([v10 length])
    {
    }
    else
    {
      uint64_t v12 = [v4 headUnitBluetoothIdentifier];
      uint64_t v13 = [v12 length];

      if (!v13)
      {
        unint64_t v7 = VGGetDataCoordinatorLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v17 = 138412290;
        id v18 = v4;
        uint64_t v14 = "No application associated with vehicle: %@";
        uint64_t v15 = v7;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
    unint64_t v7 = VGGetDataCoordinatorLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v17 = 138412290;
    id v18 = v4;
    uint64_t v14 = "No matching application for vehicle: %@";
    uint64_t v15 = v7;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_12:
    _os_log_impl(&dword_214A2C000, v15, v16, v14, (uint8_t *)&v17, 0xCu);
    goto LABEL_13;
  }
  uint64_t v6 = [(VGDataCoordinator *)self _applicationRecordForVehicle:v4];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = [(VGDataCoordinator *)self deviceIdentifier];
    [v4 setPairedAppInstallDeviceIdentifier:v8];

    id v9 = [v7 installSessionIdentifier];
    [v4 setPairedAppInstallSessionIdentifier:v9];
  }
  else
  {
    id v11 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "Ignoring, OEM Application not installed for vehicle: %@", (uint8_t *)&v17, 0xCu);
    }

    unint64_t v7 = 0;
  }
LABEL_13:
}

- (void)unpairVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 iapIdentifier];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 pairedAppIdentifier],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    uint64_t v13 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "unpairVehicle: Unpairing iAP2 only vehicle. Will reload unpaired iAP vehicles.", (uint8_t *)location, 2u);
    }

    [(VGDataCoordinator *)self _loadIapVehicles];
  }
  else
  {
    uint64_t v8 = [v4 siriIntentsIdentifier];
    if (v8
      && (id v9 = (void *)v8,
          [v4 pairedAppIdentifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_initWeak(location, self);
      workQueue = self->_workQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __35__VGDataCoordinator_unpairVehicle___block_invoke;
      v14[3] = &unk_264226208;
      objc_copyWeak(&v16, location);
      id v15 = v4;
      dispatch_async(workQueue, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v12 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_INFO, "unpairVehicle: Tried to unpair a vehicle without iapIdentifier/siriIdentifier/pairedAppIdentifier -> ignoring the call.", (uint8_t *)location, 2u);
      }
    }
  }
}

void __35__VGDataCoordinator_unpairVehicle___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[5];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __35__VGDataCoordinator_unpairVehicle___block_invoke_66;
    v33[3] = &unk_2642261E0;
    long long v34 = *(id *)(a1 + 32);
    uint64_t v5 = VGFilter(v4, v33);
    uint64_t v6 = [v5 firstObject];
    unint64_t v7 = VGGetDataCoordinatorLog();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v6;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "unpairVehicle: will reload all vehicles for app: %@", buf, 0xCu);
      }

      v39 = v6;
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      [v3 _loadAllOEMVehiclesForApps:v8 completion:0];
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = *(const char **)(a1 + 32);
      id v11 = v3[5];
      uint64_t v12 = v11;
      if (v11)
      {
        id v32 = v11;
        if ([v11 count])
        {
          v30 = v10;
          v31 = v8;
          uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                if (v19)
                {
                  id v20 = NSString;
                  id v21 = v19;
                  id v22 = [v20 stringWithFormat:@"%@<%p>", objc_opt_class(), v21];
                }
                else
                {
                  id v22 = @"<nil>";
                }
                [v13 addObject:v22];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:buf count:16];
            }
            while (v16);
          }

          int v23 = [v14 componentsJoinedByString:@", "];
          __int16 v24 = NSString;
          id v25 = v14;
          uint64_t v26 = [v24 stringWithFormat:@"%@<%p>", objc_opt_class(), v25];

          __int16 v27 = [v24 stringWithFormat:@"%@ [%@]", v26, v23];

          uint64_t v8 = v31;
          uint64_t v6 = 0;
          id v10 = v30;
        }
        else
        {
          uint64_t v28 = NSString;
          id v29 = v12;
          uint64_t v13 = [v28 stringWithFormat:@"%@<%p>", objc_opt_class(), v29];

          __int16 v27 = [v28 stringWithFormat:@"%@ (empty)", v13];
        }

        uint64_t v12 = v32;
      }
      else
      {
        __int16 v27 = @"<nil>";
      }

      *(_DWORD *)buf = 138412546;
      v41 = v10;
      __int16 v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "unpairVehicle: Tried to unpair a vehicle %@, but _applications didn't contain the vehicle's paired app (%@). Not adding it back to unpaired vehicles.", buf, 0x16u);
    }
    id v9 = v34;
  }
  else
  {
    id v9 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[VGDataCoordinator unpairVehicle:]_block_invoke";
      __int16 v42 = 1024;
      LODWORD(v43) = 375;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __35__VGDataCoordinator_unpairVehicle___block_invoke_66(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isEnabled]
    && ([v6 identifier],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) pairedAppIdentifier],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)startContinuousUpdatesForVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__VGDataCoordinator_startContinuousUpdatesForVehicle___block_invoke;
    v7[3] = &unk_264226208;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async(workQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v6 = VGGetAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446722;
      *(void *)&location[4] = "-[VGDataCoordinator startContinuousUpdatesForVehicle:]";
      __int16 v11 = 2082;
      uint64_t v12 = "vehicle == nil";
      __int16 v13 = 2082;
      id v14 = "can't start continuous updates with a nil vehicle.";
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }
  }
}

void __54__VGDataCoordinator_startContinuousUpdatesForVehicle___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 9) addObject:*(void *)(a1 + 32)];
    [v3 _startChargeStreamForVehicle:*(void *)(a1 + 32)];
    if (!v3[8])
    {
      [v3 _refreshStateForTrackedVehicles];
      [v3 _setupTimerIfNeeded];
    }
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[VGDataCoordinator startContinuousUpdatesForVehicle:]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 405;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)endAllContinuousUpdates
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__VGDataCoordinator_endAllContinuousUpdates__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__VGDataCoordinator_endAllContinuousUpdates__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = WeakRetained[9];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "_stopChargeStreamForVehicle:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [v2[9] removeAllObjects];
    [v2 _invalidateRefreshTimer];
  }
  else
  {
    int v8 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[VGDataCoordinator endAllContinuousUpdates]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 421;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

- (void)_refreshStateForTrackedVehicles
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__VGDataCoordinator__refreshStateForTrackedVehicles__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__VGDataCoordinator__refreshStateForTrackedVehicles__block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [WeakRetained[9] allObjects];
      uint64_t v4 = v3;
      if (v3)
      {
        if ([v3 count])
        {
          id v29 = v2;
          id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v28 = v4;
          id v6 = v4;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:buf count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v35 != v9) {
                  objc_enumerationMutation(v6);
                }
                long long v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (v11)
                {
                  long long v12 = NSString;
                  id v13 = v11;
                  id v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];
                }
                else
                {
                  id v14 = @"<nil>";
                }
                [v5 addObject:v14];
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:buf count:16];
            }
            while (v8);
          }

          uint64_t v15 = [v6 componentsJoinedByString:@", "];
          __int16 v16 = NSString;
          id v17 = v6;
          uint64_t v18 = [v16 stringWithFormat:@"%@<%p>", objc_opt_class(), v17];

          uint64_t v19 = [v16 stringWithFormat:@"%@ [%@]", v18, v15];

          uint64_t v4 = v28;
          uint64_t v2 = v29;
        }
        else
        {
          id v21 = NSString;
          id v22 = v4;
          int v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

          uint64_t v19 = [v21 stringWithFormat:@"%@ (empty)", v23];
        }
      }
      else
      {
        uint64_t v19 = @"<nil>";
      }

      *(_DWORD *)buf = 138412290;
      __int16 v40 = (const char *)v19;
      _os_log_impl(&dword_214A2C000, v2, OS_LOG_TYPE_INFO, "Refresh timer ticked, pulling SoC for vehicles: %@", buf, 0xCu);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = WeakRetained[9];
    uint64_t v24 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v20);
          }
          [WeakRetained _updateStateOfChargeForVehicle:*(void *)(*((void *)&v30 + 1) + 8 * j) syncAcrossDevices:1 completion:0];
        }
        uint64_t v25 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }
  }
  else
  {
    id v20 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v40 = "-[VGDataCoordinator _refreshStateForTrackedVehicles]_block_invoke";
      __int16 v41 = 1024;
      int v42 = 436;
      _os_log_impl(&dword_214A2C000, v20, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

- (void)_invalidateRefreshTimer
{
  id v3 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "Invalidating refresh timer.", v5, 2u);
  }

  [(NSTimer *)self->_vehicleStateRefreshTimer invalidate];
  vehicleStateRefreshTimer = self->_vehicleStateRefreshTimer;
  self->_vehicleStateRefreshTimer = 0;
}

- (void)_setupTimerIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!self->_vehicleStateRefreshTimer)
  {
    [(VGDataCoordinator *)self _vehicleStateRefreshInterval];
    double v4 = v3;
    id v5 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = (uint64_t)v4;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Starting refresh timer with interval: %ld", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__refreshStateForTrackedVehicles selector:0 userInfo:1 repeats:v4];
    vehicleStateRefreshTimer = self->_vehicleStateRefreshTimer;
    self->_vehicleStateRefreshTimer = v6;
  }
}

- (id)_applicationForVehicle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_applications;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", (void)v14);
        long long v11 = [v4 pairedAppIdentifier];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_unpairedOEMVehicles
{
  return VGFilter(self->_unpairedVehicles, &__block_literal_global_75_0);
}

BOOL __41__VGDataCoordinator__unpairedOEMVehicles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 pairedAppIdentifier];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v2 siriIntentsIdentifier];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_loadAllOEMVehiclesForApps:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v21 = a4;
  uint64_t v7 = dispatch_group_create();
  id v20 = self;
  objc_initWeak(&location, self);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v12 = VGGetDataCoordinatorLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v11 identifier];
          *(_DWORD *)buf = 138412290;
          long long v35 = v13;
          _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_INFO, "Requesting list of vehicles for %@", buf, 0xCu);
        }
        dispatch_group_enter(v7);
        long long v14 = VGGetDataCoordinatorLog();
        long long v15 = (char *)os_signpost_id_generate(v14);

        long long v16 = VGGetDataCoordinatorLog();
        long long v17 = v16;
        if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_214A2C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "ListCars", "", buf, 2u);
        }

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke;
        v25[3] = &unk_264226278;
        v28[1] = v15;
        uint64_t v26 = v7;
        __int16 v27 = v11;
        objc_copyWeak(v28, &location);
        [v11 listCarsWithCompletion:v25];
        objc_destroyWeak(v28);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v8);
  }

  workQueue = v20->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_2;
  block[3] = &unk_2642262A0;
  id v24 = v21;
  id v19 = v21;
  dispatch_group_notify(v7, workQueue, block);

  objc_destroyWeak(&location);
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VGGetDataCoordinatorLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ListCars", "", buf, 2u);
  }

  if (v6)
  {
    uint64_t v10 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = [v6 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v11;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "Error Listing Cars from Intents: %@", buf, 0xCu);
    }
LABEL_7:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_18;
  }
  uint64_t v12 = [v5 count];
  uint64_t v10 = VGGetDataCoordinatorLog();
  BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (v13)
    {
      id v19 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v19;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Didn't receive any vehicles from %@, bailing.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (v13)
  {
    long long v14 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Received Vehicles from %@: %@", buf, 0x16u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  long long v16 = WeakRetained;
  if (WeakRetained)
  {
    long long v17 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_76;
    block[3] = &unk_264226250;
    id v21 = v5;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    id v22 = *(id *)(a1 + 32);
    dispatch_async(v17, block);

    objc_destroyWeak(&v23);
    uint64_t v18 = v21;
  }
  else
  {
    uint64_t v18 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[VGDataCoordinator _loadAllOEMVehiclesForApps:completion:]_block_invoke";
      __int16 v26 = 1024;
      LODWORD(v27) = 511;
      _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

LABEL_18:
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_76(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * v5);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        if (!WeakRetained)
        {
          os_signpost_id_t v9 = VGGetVirtualGarageLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v18 = "-[VGDataCoordinator _loadAllOEMVehiclesForApps:completion:]_block_invoke";
            __int16 v19 = 1024;
            int v20 = 514;
            _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
          }

          return;
        }
        uint64_t v8 = WeakRetained;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_77;
        v11[3] = &unk_264226190;
        id v12 = *(id *)(a1 + 40);
        [v8 _updateStateOfChargeForVehicle:v6 syncAcrossDevices:1 completion:v11];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_77(uint64_t a1)
{
}

uint64_t __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_oemAppForChargeStreamForVehicle:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 siriIntentsIdentifier];

  if (v5)
  {
    if (GEOConfigGetBOOL())
    {
      uint64_t v6 = [(VGDataCoordinator *)self _applicationForVehicle:v4];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v5 = v7;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v8 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "Couldn't modify charge stream for vehicle: %@. Underlying app was not found.", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Couldn't modify charge stream for vehicle, because EVRoutingStreamUpdatesDuringNav is false.", (uint8_t *)&v10, 2u);
      }
    }
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void)_startChargeStreamForVehicle:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VGDataCoordinator *)self _oemAppForChargeStreamForVehicle:v4];
  if (v5)
  {
    uint64_t v6 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "Will start charge stream for vehicle: %@.", (uint8_t *)&v7, 0xCu);
    }

    [v5 setChargeStreamingDelegate:self];
    [v5 startSendingChargeUpdatesForVehicle:v4];
  }
}

- (void)_stopChargeStreamForVehicle:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VGDataCoordinator *)self _oemAppForChargeStreamForVehicle:v4];
  if (v5)
  {
    uint64_t v6 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "Will stop charge stream for vehicle: %@.", (uint8_t *)&v7, 0xCu);
    }

    [v5 stopSendingChargeUpdatesForVehicle:v4];
  }
}

- (void)vehicleStateUpdated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__VGDataCoordinator_vehicleStateUpdated___block_invoke;
  block[3] = &unk_264226208;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__VGDataCoordinator_vehicleStateUpdated___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[9];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __41__VGDataCoordinator_vehicleStateUpdated___block_invoke_79;
    v34[3] = &unk_264225FC8;
    long long v35 = *(id *)(a1 + 32);
    uint64_t v5 = VGFilter(v4, v34);
    if ([v5 count])
    {
      id v6 = [v5 firstObject];
      int v7 = [v6 copy];

      id v8 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = *(__CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        __int16 v41 = (const char *)v7;
        __int16 v42 = 2112;
        uint64_t v43 = v9;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "SoC Streaming will update vehicle: %@ with state: %@", buf, 0x16u);
      }

      [v7 _updateWithVehicleState:*(void *)(a1 + 32)];
      [v3 _updateGarageWithVehicle:v7 syncAcrossDevices:0];
    }
    else
    {
      int v7 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v11 = *(const char **)(a1 + 32);
        id v12 = [v3[9] allObjects];
        long long v13 = v12;
        if (v12)
        {
          if ([v12 count])
          {
            long long v31 = v11;
            long long v32 = v5;
            long long v33 = v3;
            long long v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v15 = v13;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:buf count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v37;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v37 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  int v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                  if (v20)
                  {
                    id v21 = NSString;
                    id v22 = v20;
                    id v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];
                  }
                  else
                  {
                    id v23 = @"<nil>";
                  }
                  [v14 addObject:v23];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:buf count:16];
              }
              while (v17);
            }

            id v24 = [v15 componentsJoinedByString:@", "];
            uint64_t v25 = NSString;
            id v26 = v15;
            id v27 = [v25 stringWithFormat:@"%@<%p>", objc_opt_class(), v26];

            uint64_t v28 = [v25 stringWithFormat:@"%@ [%@]", v27, v24];

            uint64_t v5 = v32;
            uint64_t v3 = v33;
            id v11 = v31;
          }
          else
          {
            long long v29 = NSString;
            id v30 = v13;
            long long v14 = [v29 stringWithFormat:@"%@<%p>", objc_opt_class(), v30];

            uint64_t v28 = [v29 stringWithFormat:@"%@ (empty)", v14];
          }
        }
        else
        {
          uint64_t v28 = @"<nil>";
        }

        *(_DWORD *)buf = 138412546;
        __int16 v41 = v11;
        __int16 v42 = 2112;
        uint64_t v43 = v28;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "SoC Streaming couldn't find vehicle for state: %@ in observed vehicles: %@", buf, 0x16u);
      }
    }

    int v10 = v35;
  }
  else
  {
    int v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "-[VGDataCoordinator vehicleStateUpdated:]_block_invoke";
      __int16 v42 = 1024;
      LODWORD(v43) = 589;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __41__VGDataCoordinator_vehicleStateUpdated___block_invoke_79(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 siriIntentsIdentifier];
  int v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = [v6 isEqualToString:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (void)accessoryUpdatedWithVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v14 = v7;
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__VGDataCoordinator_accessoryUpdatedWithVehicle___block_invoke;
  v10[3] = &unk_264226208;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(workQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __49__VGDataCoordinator_accessoryUpdatedWithVehicle___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)WeakRetained + 1);
    if (v4)
    {
      id v5 = v4;
      if (*(void *)(a1 + 32))
      {
        char BOOL = GEOConfigGetBOOL();
        int v7 = VGGetDataCoordinatorLog();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if (BOOL)
        {
          if (v8)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: accessory did update vehicle. Will update garage", buf, 2u);
          }

          [v3 _updateGarageWithVehicle:*(void *)(a1 + 32) syncAcrossDevices:0];
          goto LABEL_35;
        }
        if (v8)
        {
          *(_WORD *)buf = 0;
          id v21 = "accessoryUpdatedWithVehicle: iAP2 onboarding is disabled. The dataCoordinator won't save the iAP2 vehicle.";
LABEL_33:
          _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      int v10 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: not connected to an iAP2 EV vehicle. Will remove any unpaired vehicles if possible", buf, 2u);
      }

      [v3 _removeUnpairedIapVehicleIfNeeded];
      id v11 = VGGetDataCoordinatorLog();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

      if (v12)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v13 = [v5 vehicles];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
LABEL_18:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
            __int16 v19 = (void *)v3[6];
            int v20 = [v18 iapIdentifier];
            LOBYTE(v19) = [v19 isConnectedToAccessoryWithIdentifier:v20];

            if (v19) {
              break;
            }
            if (v15 == ++v17)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
              if (v15) {
                goto LABEL_18;
              }
              goto LABEL_24;
            }
          }
          int v7 = v18;

          if (!v7) {
            goto LABEL_31;
          }
          id v22 = VGGetDataCoordinatorLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214A2C000, v22, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: accessory is connected to a disambiguated non-EV accessory.", buf, 2u);
          }

          goto LABEL_34;
        }
LABEL_24:

LABEL_31:
        int v7 = VGGetDataCoordinatorLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v21 = "accessoryUpdatedWithVehicle: accessory is connected to a vehicle that is not an EV and was not disambiguated. ";
          goto LABEL_33;
        }
LABEL_34:
      }
    }
    else
    {
      id v9 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v29 = "-[VGDataCoordinator accessoryUpdatedWithVehicle:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 622;
        _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }

      id v5 = 0;
    }
  }
  else
  {
    id v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v29 = "-[VGDataCoordinator accessoryUpdatedWithVehicle:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 621;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
LABEL_35:
}

- (void)_removeUnpairedIapVehicleIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_unpairedVehicles;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 iapIdentifier];

        if (v9)
        {
          int v10 = VGGetDataCoordinatorLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v8;
            _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "Will remove an existing unpaired iap2 vehicle: %@", buf, 0xCu);
          }

          [(NSMutableArray *)self->_unpairedVehicles removeObject:v8];
          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __54__VGDataCoordinator__removeUnpairedIapVehicleIfNeeded__block_invoke;
          block[3] = &unk_264226190;
          void block[4] = self;
          dispatch_async(delegateQueue, block);
          goto LABEL_14;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  VGGetDataCoordinatorLog();
  uint64_t v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A2C000, &v3->super.super, OS_LOG_TYPE_INFO, "Haven't found any iAP2 unpaired vehicles upon disconnecting from iAP2.", buf, 2u);
  }
LABEL_14:
}

void __54__VGDataCoordinator__removeUnpairedIapVehicleIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)[*(id *)(v2 + 56) copy];
  [WeakRetained dataCoordinator:v2 didUpdateUnpairedVehicles:v3];
}

- (void)OEMAppsUpdated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke;
  block[3] = &unk_264226208;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__VGDataCoordinator_OEMAppsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 1);
    if (v4)
    {
      uint64_t v5 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = v3[5];
        int v7 = v6;
        uint64_t v83 = v1;
        if (v6)
        {
          if ([v6 count])
          {
            BOOL v77 = v5;
            id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            v75 = v7;
            id v9 = v7;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v92 objects:buf count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v93;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v93 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  long long v14 = *(void **)(*((void *)&v92 + 1) + 8 * i);
                  if (v14)
                  {
                    long long v15 = NSString;
                    id v16 = v14;
                    uint64_t v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
                  }
                  else
                  {
                    uint64_t v17 = @"<nil>";
                  }
                  [v8 addObject:v17];
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v92 objects:buf count:16];
              }
              while (v11);
            }

            uint64_t v18 = [v9 componentsJoinedByString:@", "];
            __int16 v19 = NSString;
            id v20 = v9;
            id v21 = [v19 stringWithFormat:@"%@<%p>", objc_opt_class(), v20];

            id v22 = [v19 stringWithFormat:@"%@ [%@]", v21, v18];

            int v7 = v75;
            uint64_t v5 = v77;
          }
          else
          {
            long long v24 = NSString;
            id v25 = v7;
            long long v26 = [v24 stringWithFormat:@"%@<%p>", objc_opt_class(), v25];

            id v22 = [v24 stringWithFormat:@"%@ (empty)", v26];
          }
        }
        else
        {
          id v22 = @"<nil>";
        }

        id v27 = v22;
        uint64_t v1 = v83;
        id v28 = *(id *)(v83 + 32);
        long long v29 = v28;
        if (v28)
        {
          if ([v28 count])
          {
            v76 = v27;
            v78 = v5;
            long long v80 = v4;
            __int16 v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v29, "count"));
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            id v31 = v29;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v92 objects:buf count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v93;
              do
              {
                for (uint64_t j = 0; j != v33; ++j)
                {
                  if (*(void *)v93 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  long long v36 = *(void **)(*((void *)&v92 + 1) + 8 * j);
                  if (v36)
                  {
                    long long v37 = NSString;
                    id v38 = v36;
                    long long v39 = [v37 stringWithFormat:@"%@<%p>", objc_opt_class(), v38];
                  }
                  else
                  {
                    long long v39 = @"<nil>";
                  }
                  [v30 addObject:v39];
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v92 objects:buf count:16];
              }
              while (v33);
            }

            __int16 v40 = [v31 componentsJoinedByString:@", "];
            __int16 v41 = NSString;
            id v42 = v31;
            uint64_t v43 = [v41 stringWithFormat:@"%@<%p>", objc_opt_class(), v42];

            uint64_t v44 = [v41 stringWithFormat:@"%@ [%@]", v43, v40];

            id v4 = v80;
            id v27 = v76;
            uint64_t v5 = v78;
          }
          else
          {
            uint64_t v45 = NSString;
            id v46 = v29;
            __int16 v30 = [v45 stringWithFormat:@"%@<%p>", objc_opt_class(), v46];

            uint64_t v44 = [v45 stringWithFormat:@"%@ (empty)", v30];
          }

          uint64_t v1 = v83;
        }
        else
        {
          uint64_t v44 = @"<nil>";
        }

        *(_DWORD *)buf = 138412546;
        v97 = (const char *)v27;
        __int16 v98 = 2112;
        v99 = v44;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "OEMAppsUpdated, reseting unpairedVehicles, updating apps from %@ to %@.", buf, 0x16u);
      }
      objc_storeStrong(v3 + 5, *(id *)(v1 + 32));
      v47 = (void *)[v3[7] mutableCopy];
      v48 = [v3 _unpairedOEMVehicles];
      [v47 removeObjectsInArray:v48];

      objc_storeStrong(v3 + 7, v47);
      v49 = v3[3];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_80;
      block[3] = &unk_2642262F0;
      v89 = v4;
      v90 = v3;
      long long v23 = v47;
      v91 = v23;
      dispatch_async(v49, block);
      id v50 = VGGetDataCoordinatorLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v51 = *(id *)(v1 + 32);
        v52 = v51;
        if (v51)
        {
          uint64_t v84 = v1;
          if ([v51 count])
          {
            long long v79 = v23;
            long long v81 = v4;
            long long v82 = v3;
            v53 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v52, "count"));
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            id v54 = v52;
            uint64_t v55 = [v54 countByEnumeratingWithState:&v92 objects:buf count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v57 = *(void *)v93;
              do
              {
                for (uint64_t k = 0; k != v56; ++k)
                {
                  if (*(void *)v93 != v57) {
                    objc_enumerationMutation(v54);
                  }
                  v59 = *(void **)(*((void *)&v92 + 1) + 8 * k);
                  if (v59)
                  {
                    v60 = NSString;
                    id v61 = v59;
                    v62 = [v60 stringWithFormat:@"%@<%p>", objc_opt_class(), v61];
                  }
                  else
                  {
                    v62 = @"<nil>";
                  }
                  [v53 addObject:v62];
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v92 objects:buf count:16];
              }
              while (v56);
            }

            v63 = [v54 componentsJoinedByString:@", "];
            v64 = NSString;
            id v65 = v54;
            v66 = [v64 stringWithFormat:@"%@<%p>", objc_opt_class(), v65];

            v67 = [v64 stringWithFormat:@"%@ [%@]", v66, v63];

            id v4 = v81;
            uint64_t v3 = v82;
            long long v23 = v79;
          }
          else
          {
            v68 = NSString;
            id v69 = v52;
            v53 = [v68 stringWithFormat:@"%@<%p>", objc_opt_class(), v69];

            v67 = [v68 stringWithFormat:@"%@ (empty)", v53];
          }

          uint64_t v1 = v84;
        }
        else
        {
          v67 = @"<nil>";
        }

        *(_DWORD *)buf = 138412290;
        v97 = (const char *)v67;
        _os_log_impl(&dword_214A2C000, v50, OS_LOG_TYPE_INFO, "Started pulling all vehicles for apps: %@.", buf, 0xCu);
      }
      v70 = VGGetDataCoordinatorLog();
      os_signpost_id_t v71 = os_signpost_id_generate(v70);

      v72 = VGGetDataCoordinatorLog();
      v73 = v72;
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_214A2C000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v71, "PullAllVehicles", "", buf, 2u);
      }

      v74 = *(void **)(v1 + 32);
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_81;
      v85[3] = &unk_264226318;
      os_signpost_id_t v87 = v71;
      id v86 = v74;
      [v3 _loadAllOEMVehiclesForApps:v86 completion:v85];
    }
    else
    {
      long long v23 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v97 = "-[VGDataCoordinator OEMAppsUpdated:]_block_invoke";
        __int16 v98 = 1024;
        LODWORD(v99) = 698;
        _os_log_impl(&dword_214A2C000, v23, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }
    }
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[VGDataCoordinator OEMAppsUpdated:]_block_invoke";
      __int16 v98 = 1024;
      LODWORD(v99) = 697;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_80(uint64_t a1)
{
  [*(id *)(a1 + 32) dataCoordinator:*(void *)(a1 + 40) didUpdateUnpairedVehicles:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 dataCoordinatorDidUpdateInstalledApps:v3];
}

void __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_81(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = VGGetDataCoordinatorLog();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PullAllVehicles", "", buf, 2u);
  }

  uint64_t v5 = VGGetDataCoordinatorLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *(id *)(a1 + 32);
    int v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        id v25 = v5;
        id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if (v14)
              {
                long long v15 = NSString;
                id v16 = v14;
                uint64_t v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
              }
              else
              {
                uint64_t v17 = @"<nil>";
              }
              [v8 addObject:v17];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:buf count:16];
          }
          while (v11);
        }

        uint64_t v18 = [v9 componentsJoinedByString:@", "];
        __int16 v19 = NSString;
        id v20 = v9;
        id v21 = [v19 stringWithFormat:@"%@<%p>", objc_opt_class(), v20];

        id v22 = [v19 stringWithFormat:@"%@ [%@]", v21, v18];

        uint64_t v5 = v25;
      }
      else
      {
        long long v23 = NSString;
        id v24 = v7;
        id v8 = [v23 stringWithFormat:@"%@<%p>", objc_opt_class(), v24];

        id v22 = [v23 stringWithFormat:@"%@ (empty)", v8];
      }
    }
    else
    {
      id v22 = @"<nil>";
    }

    *(_DWORD *)buf = 138412290;
    id v31 = v22;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Finished pulling all vehicles for apps: %@.", buf, 0xCu);
  }
}

- (void)getLatestStateOfVehicle:(id)a3 withReply:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, id, NSObject *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (!WeakRetained)
  {
    long long v13 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]";
      __int16 v25 = 1024;
      int v26 = 726;
      _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", location, 0x12u);
    }
    goto LABEL_9;
  }
  uint64_t v10 = [WeakRetained vehicles];
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    long long v14 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_ERROR, "Tried to get SoC for vehicle, that is not saved in the garage.", location, 2u);
    }

    long long v15 = (void *)MEMORY[0x263F087E8];
    id v16 = GEOErrorDomain();
    uint64_t v22 = *MEMORY[0x263F08320];
    long long v23 = @"Could not get latest state of vehicle.";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    long long v13 = [v15 errorWithDomain:v16 code:-10 userInfo:v17];

    v7[2](v7, v6, v13);
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke;
  block[3] = &unk_264226390;
  objc_copyWeak(&v21, (id *)location);
  id v19 = v6;
  id v20 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)location);
LABEL_10:
}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  os_signpost_id_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _vehicleStateProviderForVehicle:a1[4]];
    id v6 = VGGetDataCoordinatorLog();
    int v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = (char *)objc_opt_class();
        id v8 = v22;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "getLatestStateOfVehicle: using %@ to fetch SoC.", buf, 0xCu);
      }
      id v9 = a1[4];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_88;
      v15[3] = &unk_264226368;
      objc_copyWeak(&v18, v2);
      id v16 = a1[4];
      id v17 = a1[5];
      [v5 getStateOfChargeForVehicle:v9 completion:v15];

      objc_destroyWeak(&v18);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = (char *)a1[4];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v10;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "getLatestStateOfVehicle: called for a vehicle (%@) that doesn't have a stateProvider. Make sure that the paired app is installed, otherwise there might be an issue in the VG logic.", buf, 0xCu);
      }

      char v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = GEOErrorDomain();
      uint64_t v19 = *MEMORY[0x263F08320];
      id v20 = @"Could not get latest state of vehicle, because the provider was nil.";
      long long v13 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      long long v14 = [v11 errorWithDomain:v12 code:-10 userInfo:v13];

      (*((void (**)(void))a1[5] + 2))();
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 740;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_88(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[2];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_89;
    v11[3] = &unk_264226340;
    uint64_t v12 = v5;
    id v13 = a1[4];
    id v14 = v6;
    id v15 = a1[5];
    dispatch_async(v9, v11);

    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v10 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 754;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_89(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
    [v2 _updateWithVehicleState:*(void *)(a1 + 32)];
    uint64_t v3 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "getLatestStateOfVehicle: Fetched latest vehicle state: %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = VGGetDataCoordinatorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "getLatestStateOfVehicle: Tried to fetch SoC for %@, but failed with error: %@.", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_observedVehicles, 0);
  objc_storeStrong((id *)&self->_vehicleStateRefreshTimer, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_applicationFinder, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end