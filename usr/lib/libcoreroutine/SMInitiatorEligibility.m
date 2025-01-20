@interface SMInitiatorEligibility
+ (BOOL)checkAirplaneModeEnabledWithQueue:(id)a3;
+ (BOOL)checkCellularDataEnabledWithQueue:(id)a3;
+ (BOOL)checkCellularWatchToggleEnabledWithQueue:(id)a3;
+ (BOOL)checkDevicePlatformEnabled;
+ (BOOL)checkHasSimWithQueue:(id)a3;
+ (BOOL)checkIsInternalInstall;
+ (BOOL)checkLocationServicesEnabledWithAuthorizationManager:(id)a3;
+ (BOOL)checkRegulatoryDomainPassedWithQueue:(id)a3;
+ (BOOL)deviceHasBaseband;
+ (BOOL)shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:(id)a3 isHandoff:(BOOL)a4 defaultsManager:(id)a5;
+ (id)_getRegulatoryDomainCountryCodes;
+ (int64_t)cellularEligibilityFailureStatusForPlatform:(id)a3;
+ (void)checkCellularEnabledWithQueue:(id)a3 handler:(id)a4;
+ (void)checkIMessageAccountEnabledWithQueue:(id)a3 handler:(id)a4;
+ (void)checkInitiatorEligibilityWithQueue:(id)a3 authorizationManager:(id)a4 effectivePairedDevice:(id)a5 isHandoff:(BOOL)a6 defaultsManager:(id)a7 platform:(id)a8 appDeletionManager:(id)a9 handler:(id)a10;
+ (void)checkLocationAuthorizationWithQueue:(id)a3 handler:(id)a4;
+ (void)checkManateeEnabledWithQueue:(id)a3 handler:(id)a4;
+ (void)checkNetworkReachabilityWithQueue:(id)a3 handler:(id)a4;
@end

@implementation SMInitiatorEligibility

+ (void)checkInitiatorEligibilityWithQueue:(id)a3 authorizationManager:(id)a4 effectivePairedDevice:(id)a5 isHandoff:(BOOL)a6 defaultsManager:(id)a7 platform:(id)a8 appDeletionManager:(id)a9 handler:(id)a10
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (!v14)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:appDeletionManager:handler:]";
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = 64;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", v52, 0x12u);
    }
  }
  if (!v15)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:appDeletionManager:handler:]";
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = 65;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", v52, 0x12u);
    }
  }
  if (!v20)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:appDeletionManager:handler:]";
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = 66;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v52, 0x12u);
    }
  }
  *(void *)v52 = 0;
  *(void *)&v52[8] = v52;
  *(void *)&v52[16] = 0x2020000000;
  os_signpost_id_t v53 = 0;
  v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v25 = os_signpost_id_generate(v24);

  os_signpost_id_t v53 = v25;
  v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v27 = v26;
  os_signpost_id_t v28 = *(void *)(*(void *)&v52[8] + 24);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v28, "SMCheckInitiatorEligibility", " enableTelemetry=YES ", buf, 2u);
  }

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke;
  v48[3] = &unk_1E6B98B28;
  id v49 = v20;
  v50 = v52;
  id v37 = v20;
  v29 = (void *)MEMORY[0x1E016DB00](v48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_38;
  block[3] = &unk_1E6B98BA0;
  id v45 = v18;
  id v46 = v29;
  id v40 = v19;
  id v41 = v15;
  id v42 = v14;
  id v43 = v16;
  BOOL v47 = a6;
  id v44 = v17;
  id v30 = v18;
  id v31 = v17;
  id v32 = v16;
  v33 = v14;
  id v34 = v15;
  id v35 = v29;
  id v36 = v19;
  dispatch_async(v33, block);

  _Block_object_dispose(v52, 8);
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 134349312;
    BOOL v10 = a2 == 1;
    __int16 v11 = 2050;
    uint64_t v12 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMCheckInitiatorEligibility", " enableTelemetry=YES {initiatorEligibility:error:%{public,signpost.telemetry:number1}ld, error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_38(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMessagesAppInstalled])
  {
    if (+[SMInitiatorEligibility checkDevicePlatformEnabled])
    {
      if (+[SMInitiatorEligibility checkLocationServicesEnabledWithAuthorizationManager:*(void *)(a1 + 40)])
      {
        if (+[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:*(void *)(a1 + 48)])
        {
          v42[0] = 0;
          v42[1] = v42;
          v42[2] = 0x2020000000;
          char v43 = 0;
          v2 = dispatch_group_create();
          dispatch_group_enter(v2);
          uint64_t v3 = *(void *)(a1 + 48);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_2;
          v38[3] = &unk_1E6B98B50;
          id v41 = v42;
          id v40 = *(id *)(a1 + 80);
          v4 = v2;
          v39 = v4;
          +[SMInitiatorEligibility checkNetworkReachabilityWithQueue:v3 handler:v38];
          dispatch_group_enter(v4);
          uint64_t v5 = *(void *)(a1 + 48);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_46;
          v34[3] = &unk_1E6B98B50;
          id v37 = v42;
          id v36 = *(id *)(a1 + 80);
          v6 = v4;
          id v35 = v6;
          +[SMInitiatorEligibility checkIMessageAccountEnabledWithQueue:v5 handler:v34];
          dispatch_group_enter(v6);
          uint64_t v7 = *(void *)(a1 + 48);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_47;
          v30[3] = &unk_1E6B98B50;
          v33 = v42;
          id v32 = *(id *)(a1 + 80);
          os_signpost_id_t v8 = v6;
          id v31 = v8;
          +[SMInitiatorEligibility checkLocationAuthorizationWithQueue:v7 handler:v30];
          dispatch_group_enter(v8);
          uint64_t v9 = *(void *)(a1 + 48);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_48;
          v26[3] = &unk_1E6B98B50;
          v29 = v42;
          id v28 = *(id *)(a1 + 80);
          BOOL v10 = v8;
          v27 = v10;
          +[SMInitiatorEligibility checkManateeEnabledWithQueue:v9 handler:v26];
          if (+[SMInitiatorEligibility shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:*(void *)(a1 + 56) isHandoff:*(unsigned __int8 *)(a1 + 88) defaultsManager:*(void *)(a1 + 64)])
          {
            __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Initiator Eligibility, skipping cellular eligibility checks", buf, 2u);
            }
          }
          else
          {
            dispatch_group_enter(v10);
            uint64_t v13 = *(void *)(a1 + 48);
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_49;
            v21[3] = &unk_1E6B98B78;
            os_signpost_id_t v25 = v42;
            v22 = *(id *)(a1 + 72);
            id v24 = *(id *)(a1 + 80);
            v23 = v10;
            +[SMInitiatorEligibility checkCellularEnabledWithQueue:v13 handler:v21];

            __int16 v11 = v22;
          }

          id v14 = *(NSObject **)(a1 + 48);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_50;
          block[3] = &unk_1E6B912E0;
          id v17 = v10;
          id v19 = v42;
          id v18 = *(id *)(a1 + 80);
          id v15 = v10;
          dispatch_group_notify(v15, v14, block);

          _Block_object_dispose(v42, 8);
          return;
        }
        uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      }
      else
      {
        uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      }
    }
    else
    {
      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    }
  }
  else
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  }

  v12();
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v10 = 138412546;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check network reachability, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_46(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v10 = 138412546;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for iMessages account, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_47(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v10 = 138412546;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for system service, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v10 = 138412546;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for Manatee, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_49(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v11 = 138412546;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check cellular eligibility %@, error, %@", (uint8_t *)&v11, 0x16u);
  }

  if (v5) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    +[SMInitiatorEligibility cellularEligibilityFailureStatusForPlatform:*(void *)(a1 + 32)];
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      initiatorEligiblityStatusToString();
      int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412290;
      __int16 v12 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Initiator Eligibility, cellular eligbility failure status: %@", (uint8_t *)&v11, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __166__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_appDeletionManager_handler___block_invoke_50(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Initiator Eligibility, all checks passed", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

+ (BOOL)shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:(id)a3 isHandoff:(BOOL)a4 defaultsManager:(id)a5
{
  id v5 = a5;
  if (+[SMInitiatorEligibility checkIsInternalInstall]
    && ([v5 objectForKey:@"SMDefaultsInitiatorEligibilitySkipCellularCheck" value:MEMORY[0x1E4F1CC28]], v6 = objc_claimAutoreleasedReturnValue(), int v7 = objc_msgSend(v6, "BOOLValue"), v6, v7))
  {
    char v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Initiator Eligibility, skipping cellular eligibility check due to defaults", v11, 2u);
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)checkDevicePlatformEnabled
{
  v2 = +[RTPlatform currentPlatform];
  BOOL v3 = ([v2 iPhoneDevice] & 1) != 0
    || [MEMORY[0x1E4F99880] zelkovaOnWatchEnabled]
    && ([v2 watchPlatform] & 1) != 0;

  return v3;
}

+ (BOOL)checkIsInternalInstall
{
  v2 = +[RTPlatform currentPlatform];
  char v3 = [v2 internalInstall];

  return v3;
}

+ (int64_t)cellularEligibilityFailureStatusForPlatform:(id)a3
{
  id v3 = a3;
  if ([v3 watchPlatform])
  {
    if (+[SMInitiatorEligibility deviceHasBaseband])
    {
      if ([v3 isTinkerPaired]) {
        int64_t v4 = 5;
      }
      else {
        int64_t v4 = 12;
      }
    }
    else
    {
      int64_t v4 = 11;
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

+ (BOOL)deviceHasBaseband
{
  if (qword_1EBE38878 != -1) {
    dispatch_once(&qword_1EBE38878, &__block_literal_global_73);
  }
  return _MergedGlobals_100;
}

uint64_t __43__SMInitiatorEligibility_deviceHasBaseband__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_100 = result;
  return result;
}

+ (BOOL)checkLocationServicesEnabledWithAuthorizationManager:(id)a3
{
  return [a3 isLocationServicesEnabled];
}

+ (void)checkCellularEnabledWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "+[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:]";
      __int16 v15 = 1024;
      int v16 = 262;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SMInitiatorEligibility_checkCellularEnabledWithQueue_handler___block_invoke;
  v10[3] = &unk_1E6B90CE0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  BOOL v9 = v5;
  dispatch_async(v9, v10);
}

uint64_t __64__SMInitiatorEligibility_checkCellularEnabledWithQueue_handler___block_invoke(uint64_t a1)
{
  if (+[SMInitiatorEligibility checkHasSimWithQueue:*(void *)(a1 + 32)])
  {
    +[SMInitiatorEligibility checkCellularDataEnabledWithQueue:*(void *)(a1 + 32)];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (BOOL)checkHasSimWithQueue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F23A80];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithQueue:v4];

  id v20 = 0;
  id v6 = [v5 getCurrentDataSubscriptionContextSync:&v20];
  id v7 = v20;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = v7;
    int v10 = 0;
  }
  else
  {
    id v19 = 0;
    id v11 = [v5 getSIMStatus:v6 error:&v19];
    id v12 = v19;
    id v9 = v12;
    int v10 = 0;
    if (!v12 && v11)
    {
      if ([v11 isEqualToString:*MEMORY[0x1E4F241F0]])
      {
        int v10 = 0;
        id v9 = 0;
      }
      else
      {
        id v18 = 0;
        __int16 v13 = [v5 getSimLabel:v6 error:&v18];
        id v9 = v18;
        int v10 = 0;
        if (!v9 && v13)
        {
          id v14 = [v13 unique_id];
          int v10 = [v14 isEqualToString:@"00000000-0000-0000-0000-000000000000"] ^ 1;
        }
      }
    }
  }
  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = @"NO";
    if (v10) {
      int v16 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Initiator Eligibility, checking if SIM enabled, %@, error %@", buf, 0x16u);
  }

  return v10;
}

+ (BOOL)checkCellularDataEnabledWithQueue:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (const void *)_CTServerConnectionCreateWithIdentifier();
  int IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  if (v3) {
    CFRelease(v3);
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v8 = @"NO";
    __int16 v9 = 1024;
    int v10 = IsEnabled;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Initiator Eligibility, checking if cellular data enabled, %@, error %d", buf, 0x12u);
  }

  return 0;
}

+ (BOOL)checkAirplaneModeEnabledWithQueue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (const void *)_CTServerConnectionCreateWithIdentifier();
  int CellularDataSettings = _CTServerConnectionGetCellularDataSettings();
  if (v3) {
    CFRelease(v3);
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v8 = "+[SMInitiatorEligibility checkAirplaneModeEnabledWithQueue:]";
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = CellularDataSettings;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s,Checking if Airplane Mode is enabled, %{Bool}d, error %d", buf, 0x18u);
  }

  return 0;
}

+ (BOOL)checkCellularWatchToggleEnabledWithQueue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F4BE78];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithQueue:v4];

  if (v5)
  {
    id v10 = 0;
    int v6 = [v5 telephonyStateWithBundleIdentifierOut:&v10];
    id v7 = v10;
    BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      int v12 = v5;
      __int16 v13 = 1024;
      int v14 = v6;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, " radioPreferences: %@ isCellularEnabled toggle: %{BOOL}d", buf, 0x12u);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)checkRegulatoryDomainPassedWithQueue:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F948E8] currentEstimates];
  if (![v4 count])
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      BOOL v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v55 = v7;
      __int16 v56 = 2112;
      v57 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, no current estimates found, falling back to last known estimates", buf, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F948E8] lastKnownEstimates];

    if (![v9 count])
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      BOOL v29 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v35 = (objc_class *)objc_opt_class();
        id v36 = NSStringFromClass(v35);
        id v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v55 = v36;
        __int16 v56 = 2112;
        v57 = v37;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, no last known estimates found, returning success as default fallback behaviour", buf, 0x16u);
      }
      goto LABEL_29;
    }
    id v4 = v9;
  }
  id v10 = [(id)objc_opt_class() _getRegulatoryDomainCountryCodes];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v4;
  uint64_t v39 = [v9 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v39)
  {
    uint64_t v11 = *(void *)v50;
    id v41 = v9;
    id v42 = v3;
    id v40 = v10;
    uint64_t v38 = *(void *)v50;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v49 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1E016D870]();
        int v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = (objc_class *)objc_opt_class();
          int v16 = NSStringFromClass(v15);
          NSStringFromSelector(a2);
          v18 = uint64_t v17 = v10;
          id v19 = [v13 countryCode];
          *(_DWORD *)buf = 138412802;
          v55 = v16;
          __int16 v56 = 2112;
          v57 = v18;
          __int16 v58 = 2112;
          v59 = v19;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, estimate's country code, %@", buf, 0x20u);

          id v10 = v17;
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v20 = v10;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v46 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1E016D870]();
              v27 = [v13 countryCode];
              int v28 = [v27 isEqualToString:v25];

              if (v28)
              {
                id v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  id v31 = (objc_class *)objc_opt_class();
                  id v32 = NSStringFromClass(v31);
                  v33 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412802;
                  v55 = v32;
                  __int16 v56 = 2112;
                  v57 = v33;
                  __int16 v58 = 2112;
                  v59 = v25;
                  _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, estimate's country code is equal to regulated country code, %@", buf, 0x20u);
                }

                BOOL v29 = 0;
                id v9 = v41;
                id v3 = v42;
                id v10 = v40;
                goto LABEL_28;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        ++v12;
        uint64_t v11 = v38;
        id v9 = v41;
        id v3 = v42;
        id v10 = v40;
      }
      while (v12 != v39);
      BOOL v29 = 1;
      uint64_t v39 = [v41 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v39);
  }
  else
  {
    BOOL v29 = 1;
  }
LABEL_28:

LABEL_29:
  return v29;
}

+ (id)_getRegulatoryDomainCountryCodes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F99AB8];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (void)checkNetworkReachabilityWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "+[SMInitiatorEligibility checkNetworkReachabilityWithQueue:handler:]";
      __int16 v13 = 1024;
      int v14 = 410;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SMInitiatorEligibility_checkNetworkReachabilityWithQueue_handler___block_invoke;
  block[3] = &unk_1E6B90868;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v5, block);
}

uint64_t __68__SMInitiatorEligibility_checkNetworkReachabilityWithQueue_handler___block_invoke(uint64_t a1)
{
  v2 = +[SMNetworkReachabilityObserver sharedNetworkReachabilityObserver];
  [v2 isNetworkReachable];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

+ (void)checkIMessageAccountEnabledWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "+[SMInitiatorEligibility checkIMessageAccountEnabledWithQueue:handler:]";
      __int16 v17 = 1024;
      int v18 = 422;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v8 = [MEMORY[0x1E4F6BC98] sharedInstance];
  id v9 = [v8 multiplexedConnectionWithLabel:@"com.apple.routined.SafetyMonitor.SMInitiatorEligibility.iMessage" capabilities:512 context:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke;
  v12[3] = &unk_1E6B90CE0;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v9 connectWithCompletion:v12];
}

void __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke_2;
  block[3] = &unk_1E6B90868;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6BDC0] serviceWithName:@"iMessage"];
  id v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  id v4 = [v3 accountsForService:v2];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "isActive", (void)v9)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)checkLocationAuthorizationWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v12 = "+[SMInitiatorEligibility checkLocationAuthorizationWithQueue:handler:]";
      __int16 v13 = 1024;
      int v14 = 452;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SMInitiatorEligibility_checkLocationAuthorizationWithQueue_handler___block_invoke;
  block[3] = &unk_1E6B90868;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v5, block);
}

uint64_t __70__SMInitiatorEligibility_checkLocationAuthorizationWithQueue_handler___block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F1E600] authorizationStatusForBundlePath:*MEMORY[0x1E4F99A90]] == 3;
  id v3 = *(uint64_t (**)(uint64_t, BOOL, void))(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(void *)(a1 + 32);

  return v3(v4, v2, 0);
}

+ (void)checkManateeEnabledWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v14 = "+[SMInitiatorEligibility checkManateeEnabledWithQueue:handler:]";
      __int16 v15 = 1024;
      int v16 = 463;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke;
  v10[3] = &unk_1E6B918B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[SMCloudKitZone supportsDeviceToDeviceEncryptionWithCompletion:v10];
}

void __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke_2;
  block[3] = &unk_1E6B98BC8;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end