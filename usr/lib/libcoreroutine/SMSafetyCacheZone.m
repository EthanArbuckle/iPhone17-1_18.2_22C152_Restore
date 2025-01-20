@interface SMSafetyCacheZone
- (CKRecord)accessDataRecord;
- (CKRecord)safetyCacheRecord;
- (CKRecordID)accessDataRecordID;
- (CKRecordID)safetyCacheRecordID;
- (NSData)allowReadToken;
- (NSData)phoneSafetyCache;
- (NSData)watchSafetyCache;
- (NSDate)releaseTime;
- (NSString)token;
- (RTDefaultsManager)defaultsManager;
- (SMSafetyCacheZone)initWithSessionID:(id)a3 ownerName:(id)a4 token:(id)a5 defaultsManager:(id)a6 queue:(id)a7;
- (SMSafetyCacheZone)initWithSessionID:(id)a3 token:(id)a4 defaultsManager:(id)a5 queue:(id)a6;
- (void)createRecordsWithParticipants:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)fetchAccessDataRecordWithQos:(id)a3 completion:(id)a4;
- (void)fetchSafetyCacheRecordWithQos:(id)a3 completion:(id)a4;
- (void)fetchSafetyCacheRecordsWithQos:(id)a3 completion:(id)a4;
- (void)fetchShareParticipantsWithRetryCount:(int64_t)a3 conversation:(id)a4 qos:(id)a5 completion:(id)a6;
- (void)fetchShareWithQos:(id)a3 completion:(id)a4;
- (void)saveZoneToDatabaseWithRetryCount:(int64_t)a3 qos:(id)a4 completion:(id)a5;
- (void)setAccessDataRecord:(id)a3;
- (void)setSafetyCacheRecord:(id)a3;
- (void)setToken:(id)a3;
- (void)setupZoneAndShareWithConversation:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)updateAccessDataRecord:(id *)a3 cacheReleaseTime:(id)a4;
- (void)updateAccessDataRecordWithCacheReleaseTime:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)updateSafetyCacheRecordWithData:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)updateSafetyCacheWithData:(id)a3 cacheReleaseTime:(id)a4 qos:(id)a5 completion:(id)a6;
@end

@implementation SMSafetyCacheZone

- (SMSafetyCacheZone)initWithSessionID:(id)a3 token:(id)a4 defaultsManager:(id)a5 queue:(id)a6
{
  return [(SMSafetyCacheZone *)self initWithSessionID:a3 ownerName:*MEMORY[0x1E4F19C08] token:a4 defaultsManager:a5 queue:a6];
}

- (SMSafetyCacheZone)initWithSessionID:(id)a3 ownerName:(id)a4 token:(id)a5 defaultsManager:(id)a6 queue:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = v17;
  if (!v13)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sessionID";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_19;
  }
  if (!v14)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: ownerName";
    goto LABEL_18;
  }
  if (!v15)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: token";
    goto LABEL_18;
  }
  if (!v17)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: queue";
      goto LABEL_18;
    }
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = id v32 = v16;
    v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v35 = v13;
    __int16 v36 = 2112;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v22;
    __int16 v40 = 2112;
    id v41 = v14;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ownerName,%@", buf, 0x2Au);

    id v16 = v32;
  }

  id v23 = objc_alloc(MEMORY[0x1E4F1A320]);
  v24 = [v13 UUIDString];
  v25 = [v23 initWithZoneName:v24 ownerName:v14];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v25];
  v33.receiver = self;
  v33.super_class = (Class)SMSafetyCacheZone;
  v27 = [(SMCloudKitZone *)&v33 initWithZone:v26 queue:v18];
  p_isa = (id *)&v27->super.super.isa;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_token, a5);
    objc_storeStrong(p_isa + 8, a6);
  }
  self = p_isa;

  v29 = self;
LABEL_20:

  return v29;
}

- (void)setupZoneAndShareWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  __int16 v38 = v10;
  if (!v9)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v67 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", v67, 2u);
    }
    goto LABEL_19;
  }
  if (!v11)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v67 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v67, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  *(void *)v67 = 0;
  v68 = v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__114;
  v71 = __Block_byref_object_dispose__114;
  id v72 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  int v66 = 2;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 1;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__114;
  v61[4] = __Block_byref_object_dispose__114;
  id v62 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke;
  v53[3] = &unk_1E6B9A208;
  v57 = v63;
  v58 = v61;
  v56 = v65;
  v53[4] = self;
  v59 = v67;
  SEL v60 = a2;
  id v13 = v10;
  id v54 = v13;
  id v55 = v12;
  __int16 v36 = (void *)MEMORY[0x1E016DB00](v53);
  id v14 = [(SMSafetyCacheZone *)self defaultsManager];
  id v15 = [v14 objectForKey:@"RTDefaultsSafetyCacheCloudKitZoneTTL"];

  if (!v15) {
    id v15 = &unk_1F3451C50;
  }
  id v16 = [(SMCloudKitZone *)self zone];
  [v16 setExpirationAfterTimeInterval:v15];
  v37 = v15;

  id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [(SMCloudKitZone *)self zoneID];
    v19 = [v18 zoneName];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    os_signpost_id_t v74 = (os_signpost_id_t)v22;
    __int16 v75 = 2112;
    v76 = v37;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone TTL set to %@ seconds", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  os_signpost_id_t v74 = 0;
  id v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v24 = os_signpost_id_generate(v23);

  os_signpost_id_t v74 = v24;
  v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v26 = v25;
  os_signpost_id_t v27 = *(void *)(*(void *)&buf[8] + 24);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v46 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "SMInitializationSequenceSetupZoneAndShareSaveZone", " enableTelemetry=YES ", v46, 2u);
  }

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_29;
  v50[3] = &unk_1E6B9A230;
  v52 = buf;
  id v28 = v36;
  id v51 = v28;
  [(SMSafetyCacheZone *)self saveZoneToDatabaseWithRetryCount:2 qos:v13 completion:v50];
  *(void *)v46 = 0;
  v47 = v46;
  uint64_t v48 = 0x2020000000;
  os_signpost_id_t v49 = 0;
  v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v30 = os_signpost_id_generate(v29);

  os_signpost_id_t v49 = v30;
  v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v32 = v31;
  os_signpost_id_t v33 = *((void *)v47 + 3);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SMInitializationSequenceSetupZoneAndShareFetchParticipants", " enableTelemetry=YES ", v45, 2u);
  }

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_30;
  v39[3] = &unk_1E6B9A258;
  uint64_t v42 = v46;
  v43 = v67;
  v39[4] = self;
  SEL v44 = a2;
  id v40 = v9;
  id v34 = v28;
  id v41 = v34;
  [(SMSafetyCacheZone *)self fetchShareParticipantsWithRetryCount:2 conversation:v40 qos:v13 completion:v39];

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

LABEL_20:
}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = a2;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) zoneID];
    v12 = [v11 zoneName];
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 88));
    int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 138413826;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    os_signpost_id_t v33 = (os_signpost_id_t)v15;
    __int16 v34 = 1024;
    int v35 = a2;
    __int16 v36 = 2112;
    v37 = v7;
    __int16 v38 = 1024;
    int v39 = v16;
    __int16 v40 = 1024;
    int v41 = v17;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", buf, 0x3Cu);
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      os_signpost_id_t v33 = 0;
      v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      os_signpost_id_t v19 = os_signpost_id_generate(v18);

      os_signpost_id_t v33 = v19;
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      id v21 = v20;
      os_signpost_id_t v22 = *(void *)(*(void *)&buf[8] + 24);
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v31 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SMInitializationSequenceSetupZoneAndShareCreateRecordsWithParticipants", " enableTelemetry=YES ", v31, 2u);
      }

      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      os_signpost_id_t v24 = *(void **)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_23;
      v26[3] = &unk_1E6B9A1E0;
      v29 = buf;
      char v30 = a2;
      id v27 = v7;
      id v28 = *(id *)(a1 + 48);
      [v24 createRecordsWithParticipants:v23 qos:v25 completion:v26];

      _Block_object_dispose(buf, 8);
    }
  }
}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    id v9 = [*(id *)(a1 + 32) domain];
    uint64_t v10 = [v9 UTF8String];
    uint64_t v11 = [*(id *)(a1 + 32) code];
    int v12 = 134349570;
    uint64_t v13 = v8;
    __int16 v14 = 2082;
    uint64_t v15 = v10;
    __int16 v16 = 2050;
    uint64_t v17 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMInitializationSequenceSetupZoneAndShareCreateRecordsWithParticipants", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_29(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    id v9 = [v5 domain];
    int v10 = 134349570;
    uint64_t v11 = a2;
    __int16 v12 = 2082;
    uint64_t v13 = [v9 UTF8String];
    __int16 v14 = 2050;
    uint64_t v15 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMInitializationSequenceSetupZoneAndShareSaveZone", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_30(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v13 = [v9 domain];
    *(_DWORD *)buf = 134349570;
    unint64_t v23 = a3;
    __int16 v24 = 2082;
    uint64_t v25 = [v13 UTF8String];
    __int16 v26 = 2050;
    uint64_t v27 = [v9 code];
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMInitializationSequenceSetupZoneAndShareFetchParticipants", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", buf, 0x20u);
  }
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [*(id *)(a1 + 32) zoneID];
      uint64_t v15 = [v21 zoneName];
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 72));
      os_signpost_id_t v19 = [*(id *)(a1 + 40) receiverPrimaryHandles];
      v20 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138413314;
      unint64_t v23 = (unint64_t)v15;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v17;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v18;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully identified participants %@ for zoneID %@", buf, 0x34u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)saveZoneToDatabaseWithRetryCount:(int64_t)a3 qos:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (a3 < 0)
  {
    os_signpost_id_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMSafetyCacheZone saveZoneToDatabaseWithRetryCount:qos:completion:]";
      __int16 v21 = 1024;
      int v22 = 188;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pendingRetryCount >= 0 (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_3;
    }
  }
  else if (v9)
  {
LABEL_3:
    uint64_t v11 = [(SMCloudKitZone *)self privateDatabase];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SMSafetyCacheZone_saveZoneToDatabaseWithRetryCount_qos_completion___block_invoke;
    v14[3] = &unk_1E6B9A280;
    v14[4] = self;
    SEL v17 = a2;
    id v16 = v10;
    int64_t v18 = a3;
    id v15 = v9;
    [(SMCloudKitZone *)self saveZoneToDatabase:v11 qos:v15 withCompletion:v14];

    goto LABEL_10;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: qosOptions", buf, 2u);
  }

LABEL_10:
}

void __69__SMSafetyCacheZone_saveZoneToDatabaseWithRetryCount_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v11 = [*(id *)(a1 + 32) zoneID];
      int v23 = 138412802;
      __int16 v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v10;
      __int16 v27 = 2112;
      __int16 v28 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone saved successfully for zoneID %@", (uint8_t *)&v23, 0x20u);
    }
    goto LABEL_13;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_14;
    }
    os_signpost_id_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    __int16 v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v15 = [*(id *)(a1 + 32) zoneID];
    int v23 = 138413058;
    __int16 v24 = v13;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2112;
    id v30 = v4;
    id v16 = "#SafetyCache,%@,%@,failed to save zone with zoneID %@ with non recoverable error %@";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, 0x2Au);

    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5 <= 0)
  {
    if (!v7) {
      goto LABEL_13;
    }
    int v22 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v22);
    __int16 v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v15 = [*(id *)(a1 + 32) zoneID];
    int v23 = 138413058;
    __int16 v24 = v13;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2112;
    id v30 = v4;
    id v16 = "#SafetyCache,%@,%@,failed to save zone with zoneID %@  after retries with recoverable error %@";
    goto LABEL_16;
  }
  if (v7)
  {
    SEL v17 = (objc_class *)objc_opt_class();
    int64_t v18 = NSStringFromClass(v17);
    os_signpost_id_t v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v20 = [*(id *)(a1 + 32) zoneID];
    uint64_t v21 = *(void *)(a1 + 64);
    int v23 = 138413314;
    __int16 v24 = v18;
    __int16 v25 = 2112;
    __int16 v26 = v19;
    __int16 v27 = 2112;
    __int16 v28 = v20;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 1024;
    int v32 = v21;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@  with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v23, 0x30u);
  }
  [*(id *)(a1 + 32) saveZoneToDatabaseWithRetryCount:*(void *)(a1 + 64) - 1 qos:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_14:
}

- (void)fetchShareParticipantsWithRetryCount:(int64_t)a3 conversation:(id)a4 qos:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 < 0)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
      __int16 v28 = 1024;
      int v29 = 228;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pendingRetryCount >= 0 (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  else if (v11)
  {
    goto LABEL_3;
  }
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
    __int16 v28 = 1024;
    int v29 = 229;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_11:
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
      __int16 v28 = 1024;
      int v29 = 230;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: qosOptions (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__SMSafetyCacheZone_fetchShareParticipantsWithRetryCount_conversation_qos_completion___block_invoke;
  v20[3] = &unk_1E6B9A2A8;
  v20[4] = self;
  id v21 = v11;
  SEL v24 = a2;
  int64_t v25 = a3;
  id v22 = v12;
  id v23 = v13;
  id v17 = v12;
  id v18 = v13;
  id v19 = v11;
  [(SMCloudKitZone *)self fetchShareParticipantsWithConversation:v19 qos:v17 completion:v20];
}

void __86__SMSafetyCacheZone_fetchShareParticipantsWithRetryCount_conversation_qos_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      id v12 = v31 = v7;
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      __int16 v14 = [*(id *)(a1 + 40) receiverPrimaryHandles];
      id v15 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138413314;
      uint64_t v33 = v10;
      __int16 v34 = 2112;
      int v35 = v12;
      __int16 v36 = 2112;
      v37 = v13;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2112;
      int v41 = v15;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully identified participants %@ for zoneID %@", buf, 0x34u);

      id v7 = v31;
    }

    id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v7])
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
      v16();
      goto LABEL_15;
    }
    v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    id v22 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v23 = [*(id *)(a1 + 32) zoneID];
    *(_DWORD *)buf = 138413058;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    int v35 = v22;
    __int16 v36 = 2112;
    v37 = v23;
    __int16 v38 = 2112;
    id v39 = v7;
    SEL v24 = "#SafetyCache,%@,%@,failed to fetch share participant with zoneID %@ with non recoverable error %@";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v24, buf, 0x2Au);

    goto LABEL_13;
  }
  uint64_t v17 = *(void *)(a1 + 72);
  id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (v17 <= 0)
  {
    if (!v19) {
      goto LABEL_13;
    }
    uint64_t v30 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v30);
    id v22 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v23 = [*(id *)(a1 + 32) zoneID];
    *(_DWORD *)buf = 138413058;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    int v35 = v22;
    __int16 v36 = 2112;
    v37 = v23;
    __int16 v38 = 2112;
    id v39 = v7;
    SEL v24 = "#SafetyCache,%@,%@,failed to fetch share participant with zoneID %@  after retries with recoverable error %@";
    goto LABEL_17;
  }
  if (v19)
  {
    int64_t v25 = (objc_class *)objc_opt_class();
    __int16 v26 = NSStringFromClass(v25);
    __int16 v27 = NSStringFromSelector(*(SEL *)(a1 + 64));
    __int16 v28 = [*(id *)(a1 + 32) zoneID];
    uint64_t v29 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138413314;
    uint64_t v33 = v26;
    __int16 v34 = 2112;
    int v35 = v27;
    __int16 v36 = 2112;
    v37 = v28;
    __int16 v38 = 2112;
    id v39 = v7;
    __int16 v40 = 1024;
    LODWORD(v41) = v29;
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@  with recoverable error %@, pendingRetryCount %d, retrying...", buf, 0x30u);
  }
  [*(id *)(a1 + 32) fetchShareParticipantsWithRetryCount:*(void *)(a1 + 72) - 1 conversation:*(void *)(a1 + 40) qos:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_15:
}

- (void)createRecordsWithParticipants:(id)a3 qos:(id)a4 completion:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: fetchedParticipantsToHandlesMap";
LABEL_25:
    _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_28;
  }
  if (!v8)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: qos";
    goto LABEL_25;
  }
  if (!v9)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: completion";
    goto LABEL_25;
  }
  v53 = (void (**)(void, void, void))v9;
  id v11 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v12 = [(SMSafetyCacheZone *)self safetyCacheRecordID];
  id v13 = (void *)[v11 initWithRecordType:@"SafetyCacheRecord" recordID:v12];
  [(SMSafetyCacheZone *)self setSafetyCacheRecord:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v15 = [(SMSafetyCacheZone *)self accessDataRecordID];
  id v16 = (void *)[v14 initWithRecordType:@"AccessDataRecord" recordID:v15];

  id v72 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:7200.0];
  [(SMSafetyCacheZone *)self updateAccessDataRecord:&v72 cacheReleaseTime:v17];
  id v18 = v72;

  v52 = v18;
  [(SMSafetyCacheZone *)self setAccessDataRecord:v18];
  id v19 = objc_alloc(MEMORY[0x1E4F1A390]);
  v20 = [(SMCloudKitZone *)self zoneID];
  id v21 = (void *)[v19 initWithRecordZoneID:v20];
  [(SMCloudKitZone *)self setShare:v21];

  id v54 = v7;
  id v55 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:[v7 count]];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v69;
    id v57 = v22;
    uint64_t v56 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v69 != v25) {
          objc_enumerationMutation(v22);
        }
        __int16 v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v62 = [(SMCloudKitZone *)self zoneID];
          SEL v60 = [v62 zoneName];
          uint64_t v29 = (objc_class *)objc_opt_class();
          uint64_t v30 = NSStringFromClass(v29);
          id v31 = NSStringFromSelector(a2);
          v61 = [v27 userIdentity];
          uint64_t v32 = v24;
          int v33 = [v61 hasiCloudAccount];
          __int16 v34 = [v27 userIdentity];
          int v35 = [v34 publicSharingKey];
          *(_DWORD *)buf = 138413314;
          uint64_t v77 = v60;
          __int16 v78 = 2112;
          v79 = v30;
          __int16 v80 = 2112;
          v81 = v31;
          __int16 v82 = 1024;
          int v83 = v33;
          uint64_t v24 = v32;
          __int16 v84 = 2112;
          v85 = v35;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,share participant,hasiCloudAccount,%d,publicSharingKey,%@", buf, 0x30u);

          uint64_t v25 = v56;
          id v22 = v57;
        }
        __int16 v36 = [v27 userIdentity];
        if ([v36 hasiCloudAccount])
        {
          v37 = [v27 userIdentity];
          __int16 v38 = [v37 publicSharingKey];

          if (v38)
          {
            [v27 setPermission:2];
            id v39 = [(SMCloudKitZone *)self share];
            [v39 addParticipant:v27];

            [v55 addObject:v27];
          }
        }
        else
        {
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v24);
  }

  __int16 v40 = v55;
  if ([v55 count])
  {
    int v41 = [(SMSafetyCacheZone *)self safetyCacheRecord];
    v73[0] = v41;
    uint64_t v42 = [(SMSafetyCacheZone *)self accessDataRecord];
    v73[1] = v42;
    v43 = [(SMCloudKitZone *)self share];
    v73[2] = v43;
    SEL v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    v45 = [(SMCloudKitZone *)self privateDatabase];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke;
    void v63[3] = &unk_1E6B9A2F8;
    v63[4] = self;
    SEL v67 = a2;
    id v10 = v53;
    int v66 = v53;
    id v64 = v22;
    id v65 = v55;
    [(SMCloudKitZone *)self saveRecordsWithRetry:2 records:v44 toDatabase:v45 qos:v8 withCompletion:v63];

    __int16 v40 = v55;
  }
  else
  {
    uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F99A48];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    __int16 v75 = @"All receivers have Manatee/iCloud services disabled";
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    id v51 = [v48 errorWithDomain:v49 code:44 userInfo:v50];
    id v10 = v53;
    ((void (**)(void, void, void *))v53)[2](v53, 0, v51);
  }
  id v7 = v54;
  v46 = v52;
LABEL_28:
}

void __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v41 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v6 = v5;
  if (v41)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v35 = [*(id *)(a1 + 32) zoneID];
      __int16 v36 = [v35 zoneName];
      v37 = (objc_class *)objc_opt_class();
      __int16 v38 = NSStringFromClass(v37);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      id v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2112;
      SEL v60 = v39;
      LOWORD(v61) = 2112;
      *(void *)((char *)&v61 + 2) = v41;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) zoneID];
      id v8 = [v7 zoneName];
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      id v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      SEL v60 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,all records saved successfully", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    SEL v60 = __Block_byref_object_copy__114;
    *(void *)&long long v61 = __Block_byref_object_dispose__114;
    *((void *)&v61 + 1) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[*(id *)(a1 + 40) count]];
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v12 = v40;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v17 = [v16 recordID];
          id v18 = [*(id *)(a1 + 32) safetyCacheRecordID];
          int v19 = [v17 isEqual:v18];

          if (v19)
          {
            [*(id *)(a1 + 32) setSafetyCacheRecord:v16];
          }
          else
          {
            v20 = [v16 recordID];
            id v21 = [*(id *)(a1 + 32) accessDataRecordID];
            int v22 = [v20 isEqual:v21];

            if (v22)
            {
              [*(id *)(a1 + 32) setAccessDataRecord:v16];
            }
            else
            {
              uint64_t v23 = [v16 recordID];
              uint64_t v24 = [*(id *)(a1 + 32) share];
              uint64_t v25 = [v24 recordID];
              int v26 = [v23 isEqual:v25];

              if (v26)
              {
                [*(id *)(a1 + 32) setShare:v16];
                __int16 v27 = [*(id *)(a1 + 32) share];
                __int16 v28 = [v27 participants];
                v42[0] = MEMORY[0x1E4F143A8];
                v42[1] = 3221225472;
                v42[2] = __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke_44;
                v42[3] = &unk_1E6B9A2D0;
                uint64_t v29 = *(void *)(a1 + 64);
                v42[4] = *(void *)(a1 + 32);
                uint64_t v47 = v29;
                id v43 = *(id *)(a1 + 48);
                id v44 = *(id *)(a1 + 40);
                v45 = buf;
                v46 = &v52;
                [v28 enumerateObjectsUsingBlock:v42];
              }
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v13);
    }

    if (*((unsigned char *)v53 + 24))
    {
      uint64_t v30 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];
      [*(id *)(a1 + 32) setInvitationTokenMap:v30];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v31 = *(void *)(a1 + 56);
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      id v57 = @"None of the zone share participants have valid invitation tokens";
      int v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      __int16 v34 = [v32 errorWithDomain:*MEMORY[0x1E4F99A48] code:45 userInfo:v33];
      (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v34);
    }
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v26 = [*(id *)(a1 + 32) zoneID];
    uint64_t v17 = [v26 zoneName];
    id v18 = (objc_class *)objc_opt_class();
    int v19 = NSStringFromClass(v18);
    v20 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v21 = [v3 userIdentity];
    int v22 = [v3 invitationToken];
    uint64_t v25 = [v3 invitationTokenStatus];
    uint64_t v23 = [v3 invitationToken];
    uint64_t v24 = [v23 sharingInvitationData];
    *(_DWORD *)buf = 138413826;
    __int16 v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    __int16 v31 = 2112;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    __int16 v34 = v21;
    __int16 v35 = 2112;
    __int16 v36 = v22;
    __int16 v37 = 2048;
    uint64_t v38 = v25;
    __int16 v39 = 2112;
    id v40 = v24;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,share participant ID,%@,invitation token,%@,invitation status,%ld,invitation data,%@", buf, 0x48u);
  }
  if ([*(id *)(a1 + 40) containsObject:v3])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F19F68]);
    id v6 = [v3 invitationToken];
    id v7 = [v6 sharingInvitationData];
    id v8 = [*(id *)(a1 + 32) share];
    id v9 = [v8 URL];
    id v10 = [v3 invitationToken];
    id v11 = [v10 participantID];
    id v12 = (void *)[v5 initWithSharingInvitationData:v7 shareURL:v9 participantID:v11];

    uint64_t v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v15 = [v13 primaryHandle];
    [v14 setObject:v12 forKeyedSubscript:v15];

    id v16 = [v3 invitationToken];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v16 != 0;
  }
}

- (void)updateSafetyCacheWithData:(id)a3 cacheReleaseTime:(id)a4 qos:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (!v11)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v18 = "Invalid parameter not satisfying: safetyCacheData";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_7;
  }
  if (!v14)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_10;
  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  int v38 = 2;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 1;
  *(void *)buf = 0;
  uint64_t v30 = buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__114;
  __int16 v33 = __Block_byref_object_dispose__114;
  id v34 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __79__SMSafetyCacheZone_updateSafetyCacheWithData_cacheReleaseTime_qos_completion___block_invoke;
  int v22 = &unk_1E6B9A320;
  int v26 = v35;
  __int16 v27 = buf;
  uint64_t v25 = v37;
  uint64_t v23 = self;
  SEL v28 = a2;
  id v24 = v14;
  id v16 = (void *)MEMORY[0x1E016DB00](&v19);
  -[SMSafetyCacheZone updateSafetyCacheRecordWithData:qos:completion:](self, "updateSafetyCacheRecordWithData:qos:completion:", v11, v13, v16, v19, v20, v21, v22, v23);
  [(SMSafetyCacheZone *)self updateAccessDataRecordWithCacheReleaseTime:v12 qos:v13 completion:v16];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
LABEL_8:
}

void __79__SMSafetyCacheZone_updateSafetyCacheWithData_cacheReleaseTime_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = a2;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) zoneID];
    id v12 = [v11 zoneName];
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v18 = 138413826;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 2112;
    __int16 v27 = v7;
    __int16 v28 = 1024;
    int v29 = v16;
    __int16 v30 = 1024;
    int v31 = v17;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", (uint8_t *)&v18, 0x3Cu);
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchSafetyCacheRecordsWithQos:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v8)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    int v31 = 3;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 1;
    *(void *)buf = 0;
    uint64_t v23 = buf;
    uint64_t v24 = 0x3032000000;
    int v25 = __Block_byref_object_copy__114;
    __int16 v26 = __Block_byref_object_dispose__114;
    id v27 = 0;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __63__SMSafetyCacheZone_fetchSafetyCacheRecordsWithQos_completion___block_invoke;
    id v15 = &unk_1E6B9A320;
    uint64_t v19 = v28;
    __int16 v20 = buf;
    int v18 = v30;
    int v16 = self;
    SEL v21 = a2;
    id v17 = v8;
    id v10 = (void *)MEMORY[0x1E016DB00](&v12);
    -[SMSafetyCacheZone fetchSafetyCacheRecordWithQos:completion:](self, "fetchSafetyCacheRecordWithQos:completion:", v7, v10, v12, v13, v14, v15, v16);
    [(SMSafetyCacheZone *)self fetchAccessDataRecordWithQos:v7 completion:v10];
    [(SMSafetyCacheZone *)self fetchShareWithQos:v7 completion:v10];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __63__SMSafetyCacheZone_fetchSafetyCacheRecordsWithQos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = a2;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) zoneID];
    uint64_t v12 = [v11 zoneName];
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v18 = 138413826;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    SEL v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 1024;
    int v29 = v16;
    __int16 v30 = 1024;
    int v31 = v17;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", (uint8_t *)&v18, 0x3Cu);
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (CKRecordID)safetyCacheRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v4 = [(SMCloudKitZone *)self zoneID];
  id v5 = (void *)[v3 initWithRecordName:@"SafetyCache" zoneID:v4];

  return (CKRecordID *)v5;
}

- (void)updateSafetyCacheRecordWithData:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v16 = "Invalid parameter not satisfying: safetyCacheData";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v16 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  uint64_t v13 = [(SMSafetyCacheZone *)self safetyCacheRecordID];
  id v14 = [(SMCloudKitZone *)self privateDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke;
  v20[3] = &unk_1E6B9A348;
  SEL v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke_53;
  v17[3] = &unk_1E6B934A8;
  v17[4] = self;
  SEL v19 = a2;
  id v18 = v12;
  [(SMCloudKitZone *)self updateRecord:v13 inDatabase:v14 qos:v10 usingBlock:v20 withCompletion:v17];

  id v15 = v21;
LABEL_7:
}

void __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v4 = [*a2 encryptedValues];
    [v4 setObject:v2 forKeyedSubscript:@"PhoneSafetyCacheEncryptedData"];
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", buf, 2u);
    }
  }
}

void __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*(id *)(a1 + 32) zoneID];
      id v15 = [v14 zoneName];
      int v16 = (objc_class *)objc_opt_class();
      int v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) setSafetyCacheRecord:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSafetyCacheRecordWithQos:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(SMSafetyCacheZone *)self safetyCacheRecordID];
    id v10 = [(SMCloudKitZone *)self privateDatabase];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__SMSafetyCacheZone_fetchSafetyCacheRecordWithQos_completion___block_invoke;
    v12[3] = &unk_1E6B934A8;
    v12[4] = self;
    SEL v14 = a2;
    id v13 = v8;
    [(SMCloudKitZone *)self fetchRecord:v9 fromDatabase:v10 qos:v7 withCompletion:v12];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __62__SMSafetyCacheZone_fetchSafetyCacheRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      SEL v14 = [*(id *)(a1 + 32) zoneID];
      id v15 = [v14 zoneName];
      int v16 = (objc_class *)objc_opt_class();
      int v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) setSafetyCacheRecord:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSData)phoneSafetyCache
{
  id v3 = [(SMSafetyCacheZone *)self safetyCacheRecord];

  if (v3)
  {
    id v4 = [(SMSafetyCacheZone *)self safetyCacheRecord];
    id v5 = [v4 encryptedValues];
    id v6 = [v5 objectForKeyedSubscript:@"PhoneSafetyCacheEncryptedData"];
  }
  else
  {
    id v6 = 0;
  }

  return (NSData *)v6;
}

- (NSData)watchSafetyCache
{
  id v3 = [(SMSafetyCacheZone *)self safetyCacheRecord];

  if (v3)
  {
    id v4 = [(SMSafetyCacheZone *)self safetyCacheRecord];
    id v5 = [v4 encryptedValues];
    id v6 = [v5 objectForKeyedSubscript:@"WatchSafetyCacheEncryptedData"];
  }
  else
  {
    id v6 = 0;
  }

  return (NSData *)v6;
}

- (CKRecordID)accessDataRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v4 = [(SMCloudKitZone *)self zoneID];
  id v5 = (void *)[v3 initWithRecordName:@"AccessData" zoneID:v4];

  return (CKRecordID *)v5;
}

- (void)updateAccessDataRecordWithCacheReleaseTime:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = [(SMSafetyCacheZone *)self accessDataRecordID];
    id v13 = [(SMCloudKitZone *)self privateDatabase];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke;
    v18[3] = &unk_1E6B9A370;
    v18[4] = self;
    id v19 = v9;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke_55;
    v15[3] = &unk_1E6B934A8;
    v15[4] = self;
    SEL v17 = a2;
    id v16 = v11;
    [(SMCloudKitZone *)self updateRecord:v12 inDatabase:v13 qos:v10 usingBlock:v18 withCompletion:v15];
  }
  else
  {
    SEL v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 32);
    [v3 updateAccessDataRecord:a2 cacheReleaseTime:v2];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", v5, 2u);
    }
  }
}

void __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      SEL v14 = [*(id *)(a1 + 32) zoneID];
      id v15 = [v14 zoneName];
      id v16 = (objc_class *)objc_opt_class();
      SEL v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) setAccessDataRecord:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchAccessDataRecordWithQos:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(SMSafetyCacheZone *)self accessDataRecordID];
    id v10 = [(SMCloudKitZone *)self privateDatabase];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SMSafetyCacheZone_fetchAccessDataRecordWithQos_completion___block_invoke;
    v12[3] = &unk_1E6B934A8;
    v12[4] = self;
    SEL v14 = a2;
    id v13 = v8;
    [(SMCloudKitZone *)self fetchRecord:v9 fromDatabase:v10 qos:v7 withCompletion:v12];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __61__SMSafetyCacheZone_fetchAccessDataRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      SEL v14 = [*(id *)(a1 + 32) zoneID];
      id v15 = [v14 zoneName];
      id v16 = (objc_class *)objc_opt_class();
      SEL v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) setAccessDataRecord:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchShareWithQos:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SMSafetyCacheZone_fetchShareWithQos_completion___block_invoke;
    v10[3] = &unk_1E6B9A398;
    v10[4] = self;
    SEL v12 = a2;
    id v11 = v7;
    [(SMCloudKitZone *)self fetchShareWithQos:a3 withCompletion:v10];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __50__SMSafetyCacheZone_fetchShareWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      SEL v14 = [*(id *)(a1 + 32) zoneID];
      id v15 = [v14 zoneName];
      id v16 = (objc_class *)objc_opt_class();
      SEL v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) zoneID];
      id v10 = [v9 zoneName];
      id v11 = (objc_class *)objc_opt_class();
      SEL v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) setShare:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAccessDataRecord:(id *)a3 cacheReleaseTime:(id)a4
{
  id v7 = a4;
  id v6 = [(SMSafetyCacheZone *)self token];
  [*a3 setObject:v6 forKeyedSubscript:@"Token"];

  [*a3 setObject:v7 forKeyedSubscript:@"CacheReleaseTime"];
}

- (NSData)allowReadToken
{
  uint64_t v3 = [(SMSafetyCacheZone *)self accessDataRecord];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  id v5 = [(SMSafetyCacheZone *)self accessDataRecord];
  id v6 = [v5 objectForKeyedSubscript:@"Token"];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v8 = [(SMSafetyCacheZone *)self accessDataRecord];
    id v9 = [v8 objectForKeyedSubscript:@"Token"];
    id v10 = (void *)[v7 initWithBase64EncodedString:v9 options:0];
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }

  return (NSData *)v10;
}

- (NSDate)releaseTime
{
  uint64_t v3 = [(SMSafetyCacheZone *)self accessDataRecord];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  id v5 = [(SMSafetyCacheZone *)self accessDataRecord];
  id v6 = [v5 objectForKeyedSubscript:@"CacheReleaseTime"];

  if (v6)
  {
    id v7 = [(SMSafetyCacheZone *)self accessDataRecord];
    id v8 = [v7 objectForKeyedSubscript:@"CacheReleaseTime"];
  }
  else
  {
LABEL_4:
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  }

  return (NSDate *)v8;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (CKRecord)safetyCacheRecord
{
  return self->_safetyCacheRecord;
}

- (void)setSafetyCacheRecord:(id)a3
{
}

- (CKRecord)accessDataRecord
{
  return self->_accessDataRecord;
}

- (void)setAccessDataRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessDataRecord, 0);
  objc_storeStrong((id *)&self->_safetyCacheRecord, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end