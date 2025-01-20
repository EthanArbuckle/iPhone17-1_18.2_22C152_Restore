@interface SMSessionReceiptZone
- (BOOL)sessionReceiptZoneAvailable;
- (NSMutableArray)sessionReceipts;
- (SMSessionReceiptZone)initWithQueue:(id)a3;
- (id)checkSessionReceiptFieldsAvailibility:(id)a3 sessionID:(id)a4;
- (void)_writeSessionReceiptRecord:(id)a3 completion:(id)a4;
- (void)checkSessionReceiptZoneAvailibilityWithCompletion:(id)a3;
- (void)fetchSessionReceiptRecordWithSessionID:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)setSessionReceiptZoneAvailable:(BOOL)a3;
- (void)setSessionReceipts:(id)a3;
- (void)setupZoneWithQos:(id)a3 completion:(id)a4;
- (void)writeSessionReceiptRecord:(id)a3 completion:(id)a4;
@end

@implementation SMSessionReceiptZone

- (SMSessionReceiptZone)initWithQueue:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);
    }
    id v10 = objc_alloc(MEMORY[0x1E4F1A320]);
    v11 = [v10 initWithZoneName:@"SessionReceiptZone" ownerName:*MEMORY[0x1E4F19C08]];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v11];
    v19.receiver = self;
    v19.super_class = (Class)SMSessionReceiptZone;
    v13 = [(SMCloudKitZone *)&v19 initWithZone:v12 queue:v5];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      sessionReceipts = v13->_sessionReceipts;
      v13->_sessionReceipts = (NSMutableArray *)v14;
    }
    v18.receiver = v13;
    v18.super_class = (Class)SMSessionReceiptZone;
    self = [(SMCloudKitZone *)&v18 initWithZone:v12 queue:v5];

    v16 = self;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (void)setupZoneWithQos:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = [(SMCloudKitZone *)self privateDatabase];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__SMSessionReceiptZone_setupZoneWithQos_completion___block_invoke;
    v11[3] = &unk_1E6B90DD0;
    v11[4] = self;
    SEL v13 = a2;
    id v12 = v8;
    [(SMCloudKitZone *)self saveZoneToDatabase:v9 qos:v7 withCompletion:v11];
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __52__SMSessionReceiptZone_setupZoneWithQos_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      objc_super v18 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,zone saved successfully", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) setSessionReceiptZoneAvailable:1];
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      SEL v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      objc_super v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save zone with error %@", (uint8_t *)&v15, 0x20u);
    }
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (void)checkSessionReceiptZoneAvailibilityWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))a3;
  if (v5)
  {
    if ([(SMSessionReceiptZone *)self sessionReceiptZoneAvailable])
    {
      v5[2](v5, 1, 0);
    }
    else
    {
      id v7 = [(SMCloudKitZone *)self privateDatabase];
      id v8 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke;
      v9[3] = &unk_1E6B90DD0;
      v9[4] = self;
      SEL v11 = a2;
      id v10 = v5;
      [(SMCloudKitZone *)self fetchZoneFromDatabase:v7 qos:v8 withCompletion:v9];
    }
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (v6)
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      __int16 v22 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Session receipt zone does not exist. Setting up Session Receipt Zone", buf, 0x16u);
    }
    id v10 = *(void **)(a1 + 32);
    SEL v11 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke_26;
    v17[3] = &unk_1E6B90DD0;
    v17[4] = *(void *)(a1 + 32);
    long long v16 = *(_OWORD *)(a1 + 40);
    id v12 = (id)v16;
    long long v18 = v16;
    [v10 setupZoneWithQos:v11 completion:v17];
  }
  else
  {
    if (v6)
    {
      SEL v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v20 = v14;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Session Receipt Zone fetch Successful", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setSessionReceiptZoneAvailable:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v10 = (objc_class *)objc_opt_class();
      SEL v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      long long v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Failed to setup Session Receipt Zone with error %@", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) sessionReceiptZoneAvailable], v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v13 = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      long long v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Setup Session Receipt Zone Successful", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) setSessionReceiptZoneAvailable:1];
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) sessionReceiptZoneAvailable], 0);
  }
}

- (void)writeSessionReceiptRecord:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    SEL v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v12 = "Invalid parameter not satisfying: sessionReceipt";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    SEL v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v12 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  id v10 = [(SMSessionReceiptZone *)self sessionReceipts];
  [v10 addObject:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SMSessionReceiptZone_writeSessionReceiptRecord_completion___block_invoke;
  v13[3] = &unk_1E6B94BD8;
  uint64_t v14 = v7;
  __int16 v15 = self;
  SEL v17 = a2;
  id v16 = v9;
  [(SMSessionReceiptZone *)self checkSessionReceiptZoneAvailibilityWithCompletion:v13];

  SEL v11 = v14;
LABEL_7:
}

void __61__SMSessionReceiptZone_writeSessionReceiptRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [*(id *)(a1 + 32) sessionID];
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v10 = 138413058;
      SEL v11 = v6;
      __int16 v12 = 2112;
      int v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v10, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) _writeSessionReceiptRecord:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
}

- (void)_writeSessionReceiptRecord:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  int v10 = [v7 sessionID];
  SEL v11 = [v10 UUIDString];
  __int16 v12 = [(SMCloudKitZone *)self zoneID];
  int v13 = (void *)[v9 initWithRecordName:v11 zoneID:v12];

  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"SessionReceiptRecord" recordID:v13];
  __int16 v15 = [v7 receiverHandles];
  __int16 v16 = [v14 encryptedValues];
  [v16 setObject:v15 forKeyedSubscript:@"allReceiverHandlesEncrypted"];

  id v17 = [NSNumber numberWithUnsignedInteger:[v7 sessionType]];
  uint64_t v18 = [v14 encryptedValues];
  [v18 setObject:v17 forKeyedSubscript:@"sessionTypeEncrypted"];

  uint64_t v19 = [v7 startTime];
  id v20 = [v14 encryptedValues];
  [v20 setObject:v19 forKeyedSubscript:@"sessionStartTimeEncrypted"];

  __int16 v21 = [v7 endTime];
  __int16 v22 = [v14 encryptedValues];
  [v22 setObject:v21 forKeyedSubscript:@"sessionEndTimeEncrypted"];

  uint64_t v23 = [NSNumber numberWithBool:[v7 readStatus]];
  uint64_t v24 = [v14 encryptedValues];
  [v24 setObject:v23 forKeyedSubscript:@"safetyCacheReadStatusEncrypted"];

  v25 = [(SMCloudKitZone *)self privateDatabase];
  v26 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __62__SMSessionReceiptZone__writeSessionReceiptRecord_completion___block_invoke;
  v29[3] = &unk_1E6B94C00;
  id v30 = v7;
  v31 = self;
  id v32 = v8;
  SEL v33 = a2;
  id v27 = v8;
  id v28 = v7;
  [(SMCloudKitZone *)self saveRecord:v14 toDatabase:v25 qos:v26 withCompletion:v29];
}

void __62__SMSessionReceiptZone__writeSessionReceiptRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) sessionID];
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v18 = 138413058;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      id v25 = v4;
      SEL v11 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@";
      __int16 v12 = v5;
      uint32_t v13 = 42;
LABEL_6:
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, v13);
    }
  }
  else if (v6)
  {
    id v7 = [*(id *)(a1 + 32) sessionID];
    __int16 v14 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v14);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v18 = 138412802;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    SEL v11 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully";
    __int16 v12 = v5;
    uint32_t v13 = 32;
    goto LABEL_6;
  }

  (*(void (**)(void, BOOL, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4 == 0, v4, v15, v16, v17);
}

- (void)fetchSessionReceiptRecordWithSessionID:(id)a3 qos:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  SEL v11 = (void (**)(id, void *, uint64_t, void))a5;
  if (!v11)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    __int16 v20 = "Invalid parameter not satisfying: completion";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_16;
  }
  if (!v9)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    __int16 v20 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_18;
  }
  SEL v21 = a2;
  __int16 v22 = v10;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v12 = [(SMSessionReceiptZone *)self sessionReceipts];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v18 = [v17 sessionID];
        int v19 = [v18 isEqual:v9];

        if (v19)
        {
          v11[2](v11, v17, 1, 0);
          id v10 = v22;
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke;
  v23[3] = &unk_1E6B94C28;
  __int16 v24 = v9;
  id v25 = self;
  SEL v28 = v21;
  id v27 = v11;
  id v10 = v22;
  id v26 = v22;
  [(SMSessionReceiptZone *)self checkSessionReceiptZoneAvailibilityWithCompletion:v23];

  __int16 v12 = v24;
LABEL_16:
}

void __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      int v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      SEL v28 = v18;
      __int16 v29 = 2112;
      long long v30 = v19;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v7 = [*(id *)(a1 + 32) UUIDString];
    id v8 = [*(id *)(a1 + 40) zoneID];
    id v9 = (void *)[v6 initWithRecordName:v7 zoneID:v8];

    id v10 = *(void **)(a1 + 40);
    SEL v11 = [v10 privateDatabase];
    uint64_t v12 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke_31;
    v21[3] = &unk_1E6B94C00;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v22 = v13;
    uint64_t v23 = v14;
    long long v20 = *(_OWORD *)(a1 + 56);
    id v15 = (id)v20;
    long long v24 = v20;
    [v10 fetchRecord:v9 fromDatabase:v11 qos:v12 withCompletion:v21];
  }
}

void __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (objc_class *)objc_opt_class();
      SEL v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v9;
      __int16 v38 = 2112;
      v39 = v11;
      __int16 v40 = 2112;
      v41 = v12;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = v13;
      __int16 v38 = 2112;
      v39 = v15;
      __int16 v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", buf, 0x20u);
    }
    uint64_t v17 = [*(id *)(a1 + 40) checkSessionReceiptFieldsAvailibility:v5 sessionID:*(void *)(a1 + 32)];
    int v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    int v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        SEL v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v20;
        __int16 v38 = 2112;
        v39 = v22;
        __int16 v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Fetched all session receipt data successfully", buf, 0x20u);
      }
      long long v24 = [*(id *)(a1 + 40) sessionReceipts];
      [v24 addObject:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        __int16 v31 = (objc_class *)objc_opt_class();
        id v32 = NSStringFromClass(v31);
        uint64_t v33 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v30;
        __int16 v38 = 2112;
        v39 = v32;
        __int16 v40 = 2112;
        v41 = v33;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Failed to fetch session receipt data", buf, 0x20u);
      }
      id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F99A48];
      __int16 v27 = [NSString stringWithFormat:@"Missing Fields of Session Receipt data", *MEMORY[0x1E4F28568]];
      uint64_t v35 = v27;
      SEL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      __int16 v29 = (void *)[v25 initWithDomain:v26 code:7 userInfo:v28];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (id)checkSessionReceiptFieldsAvailibility:(id)a3 sessionID:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v6;
  id v9 = v7;
  id v10 = [v6 encryptedValues];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"sessionStartTimeEncrypted"];
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [v6 encryptedValues];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"sessionEndTimeEncrypted"];
  if (!v14)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  id v15 = (void *)v14;
  uint64_t v16 = [v6 encryptedValues];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"allReceiverHandlesEncrypted"];
  if (!v17)
  {
LABEL_9:

    goto LABEL_10;
  }
  int v18 = (void *)v17;
  aSelector = a2;
  id v48 = v9;
  int v19 = [v6 encryptedValues];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"sessionTypeEncrypted"];
  if (!v20)
  {

    a2 = aSelector;
    goto LABEL_9;
  }
  SEL v21 = (void *)v20;
  [v6 encryptedValues];
  id v22 = v46 = v6;
  uint64_t v23 = [v22 objectForKeyedSubscript:@"safetyCacheReadStatusEncrypted"];

  BOOL v8 = v46;
  a2 = aSelector;
  id v9 = v48;
  if (v23)
  {
    id v42 = objc_alloc(MEMORY[0x1E4F99978]);
    v45 = [v46 encryptedValues];
    uint64_t v44 = [v45 objectForKeyedSubscript:@"sessionTypeEncrypted"];
    uint64_t v24 = [v44 unsignedIntegerValue];
    id v43 = [v46 encryptedValues];
    id v25 = [v43 objectForKeyedSubscript:@"sessionStartTimeEncrypted"];
    uint64_t v26 = [v46 encryptedValues];
    __int16 v27 = [v26 objectForKeyedSubscript:@"sessionEndTimeEncrypted"];
    SEL v28 = [v46 encryptedValues];
    __int16 v29 = [v28 objectForKeyedSubscript:@"allReceiverHandlesEncrypted"];
    uint64_t v30 = [v46 encryptedValues];
    __int16 v31 = [v30 objectForKeyedSubscript:@"safetyCacheReadStatusEncrypted"];
    id v32 = [v42 initWithSessionID:v48 sessionType:v24 sessionStartTime:v25 sessionEndTime:v27 receiverHandles:v29 safetyCacheReadStaus:[v31 BOOLValue]];

    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      v36 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      id v9 = v48;
      id v50 = v48;
      __int16 v51 = 2112;
      v52 = v35;
      __int16 v53 = 2112;
      v54 = v36;
      _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Fetched session receipt data", buf, 0x20u);
    }
    else
    {
      id v9 = v48;
    }
    BOOL v8 = v46;
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    __int16 v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    __int16 v40 = v39 = v8;
    v41 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v50 = v9;
    __int16 v51 = 2112;
    v52 = v40;
    __int16 v53 = 2112;
    v54 = v41;
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Missing fields in session receipt", buf, 0x20u);

    BOOL v8 = v39;
  }
  id v32 = 0;
LABEL_15:

  return v32;
}

- (NSMutableArray)sessionReceipts
{
  return self->_sessionReceipts;
}

- (void)setSessionReceipts:(id)a3
{
}

- (BOOL)sessionReceiptZoneAvailable
{
  return self->_sessionReceiptZoneAvailable;
}

- (void)setSessionReceiptZoneAvailable:(BOOL)a3
{
  self->_sessionReceiptZoneAvailable = a3;
}

- (void).cxx_destruct
{
}

@end