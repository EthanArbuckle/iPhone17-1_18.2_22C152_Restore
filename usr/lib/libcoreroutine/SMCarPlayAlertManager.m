@interface SMCarPlayAlertManager
- (OS_dispatch_queue)queue;
- (RTContactsManager)contactsManager;
- (RTDefaultsManager)defaultsManager;
- (RTStarkManager)starkManager;
- (SMCarPlayAlertManager)initWithQueue:(id)a3 defaultsManager:(id)a4 contactsManager:(id)a5 starkManager:(id)a6;
- (id)_getCarPlayDisplayNameFromSessionManagerState:(id)a3 error:(id *)a4;
- (id)_getCarPlayUserInfoForSessionManagerState:(id)a3;
- (void)_postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5;
- (void)postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5;
@end

@implementation SMCarPlayAlertManager

- (SMCarPlayAlertManager)initWithQueue:(id)a3 defaultsManager:(id)a4 contactsManager:(id)a5 starkManager:(id)a6
{
  v10 = (OS_dispatch_queue *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SMCarPlayAlertManager;
  v14 = [(SMCarPlayAlertManager *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_queue = v10;
    objc_storeStrong((id *)&v14->_defaultsManager, a4);
    objc_storeStrong((id *)&v15->_contactsManager, a5);
    objc_storeStrong((id *)&v15->_starkManager, a6);
  }

  return v15;
}

- (void)postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [MEMORY[0x1E4F99908] carPlayNotificationTypeToString:a3];
    id v12 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v8 sessionState]];
    *(_DWORD *)buf = 136315650;
    v22 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]";
    __int16 v23 = 2112;
    v24 = v11;
    __int16 v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, trying to post to CarPlay, notificationType, %@, sessionManagerState, %@", buf, 0x20u);
  }
  id v13 = (void *)[v8 copy];
  v14 = [(SMCarPlayAlertManager *)self starkManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke;
  v17[3] = &unk_1E6B91530;
  v17[4] = self;
  id v18 = v13;
  id v19 = v9;
  unint64_t v20 = a3;
  id v15 = v9;
  id v16 = v13;
  [v14 fetchConnectionStateWithHandler:v17];
}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_2;
  v11[3] = &unk_1E6B91418;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v16 = a2;
  uint64_t v17 = v9;
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v10 = v5;
  dispatch_async(v6, v11);
}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = +[RTStarkManager connectionStateToString:*(void *)(a1 + 64)];
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v12 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]_block_invoke_2";
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, carPlay connected, %@, error, %@", buf, 0x20u);
  }
  if (*(void *)(a1 + 64) == 1)
  {
    uint64_t v5 = *(void *)(a1 + 72);
    v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_18;
    v8[3] = &unk_1E6B90890;
    uint64_t v10 = v5;
    id v9 = *(id *)(a1 + 56);
    [v6 _postCarPlayNotificationForNotificationType:v5 sessionManagerState:v7 handler:v8];
  }
}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [MEMORY[0x1E4F99908] carPlayNotificationTypeToString:*(void *)(a1 + 40)];
    v6 = (void *)v5;
    uint64_t v7 = @"NO";
    int v9 = 136315906;
    uint64_t v10 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]_block_invoke";
    if (!v3) {
      uint64_t v7 = @"YES";
    }
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, posted carplay notification, type, %@, status, %@, error, %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v3 == 0, v3);
  }
}

- (void)_postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = (void (**)(id, id))a5;
  id v47 = 0;
  uint64_t v10 = [(SMCarPlayAlertManager *)self _getCarPlayDisplayNameFromSessionManagerState:v8 error:&v47];
  id v11 = v47;
  if (v11)
  {
    id v12 = v11;
    v9[2](v9, v11);
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x1E4F99908];
    id v14 = [v8 configuration];
    id v46 = 0;
    __int16 v15 = [v13 getCarPlayNotificationTitleForNotificationType:a3 sessionType:[v14 sessionType] contactName:v10 error:&v46];
    id v12 = v46;

    if (v12)
    {
      v9[2](v9, v12);
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F99908];
      uint64_t v17 = [v8 configuration];
      uint64_t v18 = [v17 sessionType];
      id v19 = [v8 cacheReleaseDate];
      id v45 = 0;
      unint64_t v20 = [v16 getCarPlayNotificationMessageForNotificationType:a3 sessionType:v18 contactName:v10 cacheReleaseDate:v19 error:&v45];
      id v12 = v45;

      if (v12)
      {
        v9[2](v9, v12);
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F99908];
        v22 = [v8 configuration];
        id v44 = 0;
        __int16 v23 = [v21 getCarPlayNotificationCategoryForNotificationType:a3 sessionType:[v22 sessionType] error:&v44];
        id v12 = v44;

        if (v12)
        {
          v9[2](v9, v12);
        }
        else
        {
          v24 = (void *)MEMORY[0x1E4F99908];
          __int16 v25 = [v8 configuration];
          id v43 = 0;
          v41 = [v24 getCarPlayButtonActionIdentifierForNotificationType:a3 sessionType:[v25 sessionType] error:&v43];
          id v12 = v43;

          if (v12)
          {
            v9[2](v9, v12);
          }
          else
          {
            v26 = (void *)MEMORY[0x1E4F99908];
            uint64_t v27 = [v8 configuration];
            id v42 = 0;
            v28 = [v26 getCarPlayButtonTitleForNotificationType:a3 sessionType:[v27 sessionType] error:&v42];
            id v12 = v42;

            if (v12)
            {
              v9[2](v9, v12);
            }
            else
            {
              v40 = objc_opt_new();
              if (v41 && v28)
              {
                v29 = [[RTUserNotificationAction alloc] initWithActionIdentifier:v41 title:v28 iconWithSystemImageName:0 handler:0];
                [v40 addObject:v29];
              }
              v39 = v28;
              v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                uint64_t v31 = [v40 count];
                *(_DWORD *)buf = 136316418;
                v49 = "-[SMCarPlayAlertManager _postCarPlayNotificationForNotificationType:sessionManagerState:handler:]";
                __int16 v50 = 2112;
                v51 = v15;
                __int16 v52 = 2112;
                v53 = v20;
                __int16 v54 = 2048;
                uint64_t v55 = v31;
                __int16 v56 = 2112;
                v57 = v41;
                __int16 v58 = 2112;
                v59 = v39;
                _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%s, creating carplay notification with title, %@, message, %@, buttonActions count, %lu, first carPlayButtonActionIdentifier, %@, carPlayButtonTitle, %@", buf, 0x3Eu);
              }

              v37 = [RTUserNotification alloc];
              uint64_t v36 = *MEMORY[0x1E4F99AA8];
              v32 = [MEMORY[0x1E4F29128] UUID];
              v33 = [v32 UUIDString];
              v38 = [(RTUserNotification *)v37 initWithBundleIdentifier:v36 notificationUUIDString:v33];

              LOBYTE(v32) = v41 == (void *)*MEMORY[0x1E4F99A10];
              v34 = [(SMCarPlayAlertManager *)self _getCarPlayUserInfoForSessionManagerState:v8];
              LOWORD(v35) = v32;
              -[RTUserNotification postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:](v38, "postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:", v15, v20, v20, 0, 0, v23, 3, 8, v40, v35, 0, v34, v9);

              v28 = v39;
            }
          }
        }
      }
    }
  }
}

- (id)_getCarPlayUserInfoForSessionManagerState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v4 setObject:*MEMORY[0x1E4F99A20] forKeyedSubscript:*MEMORY[0x1E4F99A18]];
  uint64_t v5 = [v3 configuration];

  v6 = [v5 sessionID];
  uint64_t v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F99A28]];

  return v4;
}

- (id)_getCarPlayDisplayNameFromSessionManagerState:(id)a3 error:(id *)a4
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 configuration];
  v6 = [v5 conversation];
  uint64_t v7 = [v6 receiverPrimaryHandles];

  if ([v7 count] != 1)
  {
    v28 = [v4 configuration];
    v29 = [v28 conversation];
    v30 = [v29 displayName];

    if (v30)
    {
      id v31 = v30;
    }
    else
    {
      id v31 = [MEMORY[0x1E4F99908] carPlayGroupFallbackName];
    }
    id v38 = v31;

    goto LABEL_29;
  }
  id v8 = [v7 firstObject];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__77;
  v72 = __Block_byref_object_dispose__77;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__77;
  v66 = __Block_byref_object_dispose__77;
  id v67 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = [(SMCarPlayAlertManager *)self contactsManager];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __77__SMCarPlayAlertManager__getCarPlayDisplayNameFromSessionManagerState_error___block_invoke;
  v58[3] = &unk_1E6B905F0;
  uint64_t v60 = &v68;
  v61 = &v62;
  id v11 = v9;
  v59 = v11;
  [v10 fetchContactsFromEmailOrPhoneNumberString:v8 handler:v58];
  __int16 v56 = v8;

  id v12 = v11;
  __int16 v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_9;
  }
  __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  uint64_t v18 = objc_opt_new();
  id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_63];
  unint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  v21 = [v20 filteredArrayUsingPredicate:v19];
  v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E4F28C58];
  v79[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v79 count:1];
  v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_9:
    id v27 = 0;
  }

  id v32 = v27;
  v33 = v32;
  if (a4 && v32)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      v49 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v48;
      __int16 v75 = 2112;
      v76 = v49;
      __int16 v77 = 2112;
      v78 = v33;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v35 = v33;
LABEL_20:
    char v37 = 0;
    id v38 = v56;
    *a4 = v35;
    goto LABEL_28;
  }
  if (a4 && v63[5])
  {
    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v52 = NSStringFromSelector(a2);
      v53 = (void *)v63[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v51;
      __int16 v75 = 2112;
      v76 = v52;
      __int16 v77 = 2112;
      v78 = v53;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v35 = (id) v63[5];
    goto LABEL_20;
  }
  if ([(id)v69[5] count])
  {
    v39 = [MEMORY[0x1E4F28F30] sharedNameComponents];
    v40 = [(id)v69[5] firstObject];
    v41 = [v40 givenName];
    [v39 setGivenName:v41];

    id v42 = [(id)v69[5] firstObject];
    id v43 = [v42 familyName];
    [v39 setFamilyName:v43];

    id v44 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v39 style:1 options:0];
    id v38 = v56;
    if ([v44 length])
    {
      id v38 = v44;
    }
    char v37 = 1;
  }
  else
  {
    char v37 = 1;
    id v38 = v56;
  }
LABEL_28:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  if (v37)
  {
LABEL_29:
    id v38 = v38;
    id v45 = v38;
    goto LABEL_31;
  }
  id v45 = 0;
LABEL_31:

  return v45;
}

void __77__SMCarPlayAlertManager__getCarPlayDisplayNameFromSessionManagerState_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end