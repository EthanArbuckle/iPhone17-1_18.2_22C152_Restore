@interface SMCloudKitZone
+ (BOOL)shouldRetryCkError:(id)a3;
+ (id)getContainer;
+ (void)acceptShareWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8;
+ (void)acceptShareWithShareMetadata:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8;
+ (void)configureCloudKitQos:(id)a3 configuration:(id *)a4;
+ (void)fetchAllZonesFromContainer:(id)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6;
+ (void)fetchShareMetadataWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8;
+ (void)supportsDeviceToDeviceEncryptionWithCompletion:(id)a3;
- (APSConnection)pushConnection;
- (CKContainer)container;
- (CKDatabase)privateDatabase;
- (CKDatabase)sharedDatabase;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (CKShare)share;
- (NSDictionary)invitationTokenMap;
- (NSString)ownerName;
- (NSString)zoneName;
- (NSString)zoneSubscriptionID;
- (OS_dispatch_queue)queue;
- (SMCloudKitZone)initWithZone:(id)a3 queue:(id)a4;
- (id)apsEnvironmentString;
- (id)createPushConnection;
- (id)zoneUpdateHandler;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)createNewInvitationTokensWithConversation:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteRecords:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6;
- (void)deleteZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5;
- (void)deregisterForZoneUpdates;
- (void)fetchRecord:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6;
- (void)fetchShareParticipantsWithConversation:(id)a3 qos:(id)a4 completion:(id)a5;
- (void)fetchShareWithQos:(id)a3 withCompletion:(id)a4;
- (void)fetchZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5;
- (void)registerForZoneUpdatesWithHandler:(id)a3;
- (void)removeShareParticipantsInConversation:(id)a3 qos:(id)a4 withCompletion:(id)a5;
- (void)saveRecord:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6;
- (void)saveRecords:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6;
- (void)saveRecordsWithRetry:(int64_t)a3 records:(id)a4 toDatabase:(id)a5 qos:(id)a6 withCompletion:(id)a7;
- (void)saveZoneToDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5;
- (void)setInvitationTokenMap:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setShare:(id)a3;
- (void)setZone:(id)a3;
- (void)setZoneUpdateHandler:(id)a3;
- (void)subscribeToZoneChangesInPrivateDatabaseWithQoS:(id)a3 completion:(id)a4;
- (void)updateRecord:(id)a3 inDatabase:(id)a4 qos:(id)a5 usingBlock:(id)a6 withCompletion:(id)a7;
@end

@implementation SMCloudKitZone

- (SMCloudKitZone)initWithZone:(id)a3 queue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: zone";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_9;
  }
  if (!v9)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: queue";
    goto LABEL_12;
  }
  v23.receiver = self;
  v23.super_class = (Class)SMCloudKitZone;
  v11 = [(SMCloudKitZone *)&v23 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zone, a3);
    objc_storeStrong((id *)&v12->_queue, a4);
    uint64_t v13 = +[SMCloudKitZone getContainer];
    container = v12->_container;
    v12->_container = (CKContainer *)v13;

    v15 = [(SMCloudKitZone *)v12 queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__SMCloudKitZone_initWithZone_queue___block_invoke;
    v20[3] = &unk_1E6B91248;
    v21 = v12;
    SEL v22 = a2;
    dispatch_async(v15, v20);
  }
  self = v12;
  v16 = self;
LABEL_10:

  return v16;
}

void __37__SMCloudKitZone_initWithZone_queue___block_invoke(uint64_t a1)
{
  v2 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SMCloudKitZone_initWithZone_queue___block_invoke_2;
  v6[3] = &unk_1E6B93020;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v4 fetchShareWithQos:v2 withCompletion:v6];
}

void __37__SMCloudKitZone_initWithZone_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v12 = 138413058;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,fetched share,%@,error,%@", (uint8_t *)&v12, 0x2Au);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  }
}

- (void)dealloc
{
  [(SMCloudKitZone *)self deregisterForZoneUpdates];
  v3.receiver = self;
  v3.super_class = (Class)SMCloudKitZone;
  [(SMCloudKitZone *)&v3 dealloc];
}

+ (id)getContainer
{
  v2 = objc_opt_new();
  [v2 setUseZoneWidePCS:1];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.SafetyMonitor.SafetyCache" environment:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v3 options:v2];

  return v4;
}

+ (void)supportsDeviceToDeviceEncryptionWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[SMCloudKitZone getContainer];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,calling accountInfoWithCompletionHandler on container %@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SMCloudKitZone_supportsDeviceToDeviceEncryptionWithCompletion___block_invoke;
  v12[3] = &unk_1E6B93048;
  id v14 = a1;
  SEL v15 = a2;
  id v13 = v5;
  id v8 = v5;
  [v6 accountInfoWithCompletionHandler:v12];
}

void __65__SMCloudKitZone_supportsDeviceToDeviceEncryptionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    objc_super v23 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v24 = [v5 description];
    v25 = [v6 description];
    *(_DWORD *)buf = 138413058;
    v32 = v22;
    __int16 v33 = 2112;
    uint64_t v34 = (uint64_t)v23;
    __int16 v35 = 2112;
    v36 = v24;
    __int16 v37 = 2112;
    v38 = v25;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,accountInfoWithCompletionHandler accountInfo %@ error %@", buf, 0x2Au);
  }
  if (v6)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_11:
    v8();
    goto LABEL_12;
  }
  if (v5)
  {
    int v9 = [v5 supportsDeviceToDeviceEncryption];
    v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      int v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = (void *)v13;
      SEL v15 = @"NO";
      *(_DWORD *)buf = 138412802;
      v32 = v12;
      __int16 v33 = 2112;
      if (v9) {
        SEL v15 = @"YES";
      }
      uint64_t v34 = v13;
      __int16 v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,supportsDeviceToDeviceEncryption %@", buf, 0x20u);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_11;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F99A48];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v30 = @"Got nil CKAccountInfo";
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v19 = (void *)[v16 initWithDomain:v17 code:0 userInfo:v18];

  __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    v32 = v27;
    __int16 v33 = 2112;
    uint64_t v34 = (uint64_t)v28;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,got nil account info and nil error", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_12:
}

+ (void)configureCloudKitQos:(id)a3 configuration:(id *)a4
{
  id v9 = a3;
  id v5 = [v9 masqueradeBundleID];

  if (v5)
  {
    id v6 = [v9 masqueradeBundleID];
    [*a4 setApplicationBundleIdentifierOverrideForNetworkAttribution:v6];
  }
  id v7 = [v9 xpcActivity];

  if (v7)
  {
    id v8 = [v9 xpcActivity];
    [*a4 setXPCActivity:v8];
  }
  if ([v9 defaultQos]) {
    [*a4 setQualityOfService:25];
  }
}

+ (void)fetchAllZonesFromContainer:(id)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  SEL v15 = v14;
  if (!v12)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_9;
  }
  if (!v14)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  id v16 = [MEMORY[0x1E4F1A090] fetchAllRecordZonesOperation];
  uint64_t v17 = [v16 configuration];
  [v17 setContainer:v11];

  [v16 setDatabase:v12];
  __int16 v18 = [v16 configuration];
  id v26 = v18;
  [a1 configureCloudKitQos:v13 configuration:&v26];
  id v19 = v26;

  __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    objc_super v23 = NSStringFromSelector(a2);
    v24 = [v16 operationID];
    *(_DWORD *)buf = 138412802;
    v28 = v22;
    __int16 v29 = 2112;
    v30 = v23;
    __int16 v31 = 2112;
    v32 = v24;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);
  }
  [v16 setFetchRecordZonesCompletionBlock:v15];
  [v12 addOperation:v16];

LABEL_9:
}

+ (void)acceptShareWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = (void (**)(void, void, void))v20;
  if (!v15)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: invitationToken";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_21;
  }
  if (!v17)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: container";
    goto LABEL_17;
  }
  if (!v18)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: queue";
    goto LABEL_17;
  }
  if (!v20)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: completion";
    goto LABEL_17;
  }
  uint64_t v22 = [v15 shareURL];

  objc_super v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      __int16 v35 = NSStringFromClass(v25);
      id v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      id v46 = v16;
      __int16 v47 = 2112;
      v48 = v35;
      __int16 v49 = 2112;
      v50 = v26;
      __int16 v51 = 2112;
      id v52 = v15;
      __int16 v53 = 2112;
      id v54 = v17;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepting share token,invitationToken,%@,container,%@", buf, 0x34u);
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke;
    v36[3] = &unk_1E6B93098;
    __int16 v37 = v16;
    id v43 = a1;
    SEL v44 = a2;
    id v38 = v15;
    v42 = v21;
    id v39 = v17;
    id v40 = v18;
    id v41 = v19;
    [a1 fetchShareMetadataWithInvitationToken:v38 sessionID:v37 container:v39 queue:v40 qos:v41 withCompletion:v36];

    v27 = v37;
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v32 = (objc_class *)objc_opt_class();
      uint64_t v33 = NSStringFromClass(v32);
      uint64_t v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v46 = v16;
      __int16 v47 = 2112;
      v48 = v33;
      __int16 v49 = 2112;
      v50 = v34;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing invitation token", buf, 0x20u);
    }
    __int16 v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F5CFE8];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = @"nil invitation token or share URL";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    __int16 v31 = [v29 errorWithDomain:v30 code:7 userInfo:v27];
    ((void (**)(void, void, void *))v21)[2](v21, 0, v31);
  }
LABEL_21:
}

void __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    uint64_t v33 = v13;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,Fetch share metadata with error %@ for invitationToken %@", buf, 0x34u);
  }
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v14 = *(void **)(a1 + 80);
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_50;
    v19[3] = &unk_1E6B93070;
    id v20 = v15;
    long long v23 = *(_OWORD *)(a1 + 80);
    id v21 = v6;
    id v22 = *(id *)(a1 + 72);
    [v14 acceptShareWithShareMetadata:v21 sessionID:v20 container:v16 queue:v17 qos:v18 withCompletion:v19];
  }
}

void __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138413314;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept share with error %@ for shareMetadata %@", (uint8_t *)&v17, 0x34u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v11 = *(void **)(a1 + 40);
    int v17 = 138413058;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepted share for shareMetadata %@", (uint8_t *)&v17, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)fetchShareMetadataWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v41 = a4;
  id v16 = a5;
  id v17 = a6;
  id v42 = a7;
  id v40 = a8;
  uint64_t v18 = [v15 shareURL];
  v71[0] = v18;
  SEL v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];

  __int16 v19 = [v15 shareURL];
  v69 = v19;
  id v70 = v15;
  id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];

  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A0C0]) initWithShareURLs:v44 invitationTokensByShareURL:v43];
  __int16 v21 = [v20 configuration];
  [v21 setContainer:v16];

  id v22 = [v20 configuration];
  id v60 = v22;
  [a1 configureCloudKitQos:v42 configuration:&v60];
  id v39 = v60;

  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (objc_class *)objc_opt_class();
    __int16 v25 = NSStringFromClass(v24);
    uint64_t v26 = NSStringFromSelector(a2);
    uint64_t v27 = [v20 operationID:v39];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v68 = v27;
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v68) = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke;
  v52[3] = &unk_1E6B930E8;
  id v28 = v17;
  id v53 = v28;
  id v29 = v41;
  id v54 = v29;
  id v58 = a1;
  SEL v59 = a2;
  id v30 = v15;
  id v55 = v30;
  v57 = buf;
  id v31 = v40;
  id v56 = v31;
  [v20 setPerShareMetadataBlock:v52];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_56;
  v45[3] = &unk_1E6B93138;
  id v32 = v28;
  id v46 = v32;
  __int16 v49 = buf;
  id v33 = v29;
  id v47 = v33;
  id v50 = a1;
  SEL v51 = a2;
  id v34 = v31;
  id v48 = v34;
  [v20 setFetchShareMetadataCompletionBlock:v45];
  __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    id v38 = NSStringFromSelector(a2);
    *(_DWORD *)v61 = 138412802;
    id v62 = v33;
    __int16 v63 = 2112;
    id v64 = v37;
    __int16 v65 = 2112;
    v66 = v38;
    _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetching share data", v61, 0x20u);
  }
  [v16 addOperation:v20];

  _Block_object_dispose(buf, 8);
}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B930C0;
  id v14 = v7;
  id v15 = v6;
  id v8 = *(NSObject **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  long long v19 = *(_OWORD *)(a1 + 72);
  id v17 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 56);
  id v9 = (id)v12;
  long long v18 = v12;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v8, block);
}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 56);
      int v19 = 138413314;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to fetch share metadata with error %@ for invitationToken %@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      *(unsigned char *)(v3 + 24) = 1;
      id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_11:
      v4();
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 56);
      int v19 = 138413314;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetched share metadata %@ for invitationToken %@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    if (!*(unsigned char *)(v12 + 24))
    {
      *(unsigned char *)(v12 + 24) = 1;
      id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      goto LABEL_11;
    }
  }
}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2_57;
  v6[3] = &unk_1E6B93110;
  uint64_t v10 = *(void *)(a1 + 56);
  id v7 = v3;
  id v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2_57(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = *(void *)(v1 + 40);
        id v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        uint64_t v6 = NSStringFromSelector(*(SEL *)(v1 + 72));
        uint64_t v7 = *(void *)(v1 + 32);
        int v8 = 138413058;
        uint64_t v9 = v3;
        __int16 v10 = 2112;
        long long v11 = v5;
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,%@,failed to complete perShareMetadataBlock with error %@", (uint8_t *)&v8, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

+ (void)acceptShareWithShareMetadata:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v40 = a4;
  id v42 = a5;
  id v16 = a6;
  id v41 = a7;
  id v17 = a8;
  id v18 = objc_alloc(MEMORY[0x1E4F19E10]);
  v67[0] = v15;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
  uint64_t v20 = (void *)[v18 initWithShareMetadatas:v19];

  __int16 v21 = [v20 configuration];
  [v21 setContainer:v42];

  id v22 = [v20 configuration];
  id v58 = v22;
  [a1 configureCloudKitQos:v41 configuration:&v58];
  id v39 = v58;

  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (objc_class *)objc_opt_class();
    __int16 v25 = NSStringFromClass(v24);
    uint64_t v26 = NSStringFromSelector(a2);
    __int16 v27 = [v20 operationID:v39, v40];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v66 = v27;
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v66) = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke;
  v50[3] = &unk_1E6B93188;
  id v28 = v16;
  id v51 = v28;
  id v29 = v40;
  id v52 = v29;
  id v56 = a1;
  SEL v57 = a2;
  id v30 = v15;
  id v53 = v30;
  id v55 = buf;
  id v31 = v17;
  id v54 = v31;
  [v20 setPerShareCompletionBlock:v50];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_61;
  v43[3] = &unk_1E6B93138;
  id v32 = v28;
  id v44 = v32;
  id v47 = buf;
  id v33 = v29;
  id v45 = v33;
  id v48 = a1;
  SEL v49 = a2;
  id v34 = v31;
  id v46 = v34;
  [v20 setAcceptSharesCompletionBlock:v43];
  __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    id v38 = NSStringFromSelector(a2);
    *(_DWORD *)SEL v59 = 138412802;
    id v60 = v33;
    __int16 v61 = 2112;
    id v62 = v37;
    __int16 v63 = 2112;
    id v64 = v38;
    _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepting share", v59, 0x20u);
  }
  [v42 addOperation:v20];

  _Block_object_dispose(buf, 8);
}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B93160;
  id v11 = v5;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  long long v15 = *(_OWORD *)(a1 + 72);
  id v13 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      long long v14 = (objc_class *)objc_opt_class();
      long long v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = 138413314;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept share with error %@ for shareMetadata %@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = (objc_class *)objc_opt_class();
      long long v9 = NSStringFromClass(v8);
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      uint64_t v11 = *(void *)(a1 + 48);
      int v19 = 138413058;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepted share for shareMetadata %@", (uint8_t *)&v19, 0x2Au);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(unsigned char *)(v12 + 24))
    {
      *(unsigned char *)(v12 + 24) = 1;
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_10;
    }
  }
}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2_62;
  v6[3] = &unk_1E6B93110;
  uint64_t v10 = *(void *)(a1 + 56);
  id v7 = v3;
  id v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2_62(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = *(void *)(v1 + 40);
        id v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        uint64_t v6 = NSStringFromSelector(*(SEL *)(v1 + 72));
        uint64_t v7 = *(void *)(v1 + 32);
        int v8 = 138413058;
        uint64_t v9 = v3;
        __int16 v10 = 2112;
        long long v11 = v5;
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,%@,failed to complete perShareCompletionBlock with error %@", (uint8_t *)&v8, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)fetchZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = v11;
  if (!v9)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_9;
  }
  if (!v11)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1A090]);
  __int16 v14 = [(SMCloudKitZone *)self zoneID];
  v39[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  uint64_t v16 = [v13 initWithRecordZoneIDs:v15];

  uint64_t v17 = [(SMCloudKitZone *)self container];
  uint64_t v18 = [v16 configuration];
  [v18 setContainer:v17];

  [v16 setDatabase:v9];
  int v19 = [v16 configuration];
  id v36 = v19;
  [(id)objc_opt_class() configureCloudKitQos:v10 configuration:&v36];
  id v27 = v36;

  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    __int16 v23 = NSStringFromSelector(a2);
    id v24 = [v16 operationID];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    id v38 = v24;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v38) = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke;
  v32[3] = &unk_1E6B931B0;
  id v34 = buf;
  SEL v35 = a2;
  v32[4] = self;
  id v25 = v12;
  id v33 = v25;
  [v16 setPerRecordZoneCompletionBlock:v32];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_64;
  v28[3] = &unk_1E6B931D8;
  v28[4] = self;
  id v30 = buf;
  SEL v31 = a2;
  id v29 = v25;
  [v16 setFetchRecordZonesCompletionBlock:v28];
  [v9 addOperation:v16];

  _Block_object_dispose(buf, 8);
LABEL_9:
}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B91BA8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v9;
  uint64_t v19 = *(void *)(a1 + 56);
  id v17 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v18 = v13;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, block);
}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      long long v13 = [*(id *)(a1 + 40) zoneID];
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      long long v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to fetch zone with zoneID %@ with error %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v8 = [*(id *)(a1 + 40) zoneID];
      int v15 = 138412802;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      long long v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone fetched successfully for zoneID %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 40) setZone:*(void *)(a1 + 48)];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2_65;
  block[3] = &unk_1E6B91A40;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v4;
  dispatch_async(v5, block);
}

uint64_t __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2_65(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = (objc_class *)objc_opt_class();
        id v4 = NSStringFromClass(v3);
        id v5 = NSStringFromSelector(*(SEL *)(v1 + 64));
        uint64_t v6 = *(void *)(v1 + 32);
        int v7 = 138412802;
        id v8 = v4;
        __int16 v9 = 2112;
        id v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneCompletionBlock with error %@", (uint8_t *)&v7, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)saveZoneToDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: qos";
    goto LABEL_13;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1A180]);
  uint64_t v14 = [(SMCloudKitZone *)self zone];
  v42[0] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v16 = [v13 initWithRecordZonesToSave:v15 recordZoneIDsToDelete:0];

  __int16 v17 = [(SMCloudKitZone *)self container];
  long long v18 = [v16 configuration];
  [v18 setContainer:v17];

  [v16 setDatabase:v9];
  __int16 v19 = [v16 configuration];
  id v37 = v19;
  [(id)objc_opt_class() configureCloudKitQos:v10 configuration:&v37];
  id v28 = v37;

  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v21);
    uint64_t v22 = NSStringFromSelector(a2);
    uint64_t v23 = [(SMCloudKitZone *)self zoneID];
    id v24 = [v16 operationID];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v23;
    __int16 v40 = 2112;
    id v41 = v24;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v39) = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke;
  v33[3] = &unk_1E6B931B0;
  SEL v35 = buf;
  SEL v36 = a2;
  v33[4] = self;
  id v25 = v12;
  id v34 = v25;
  [v16 setPerRecordZoneSaveBlock:v33];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_68;
  v29[3] = &unk_1E6B93200;
  v29[4] = self;
  SEL v31 = buf;
  SEL v32 = a2;
  id v30 = v25;
  [v16 setModifyRecordZonesCompletionBlock:v29];
  [v9 addOperation:v16];

  _Block_object_dispose(buf, 8);
LABEL_14:
}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B91BA8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v9;
  uint64_t v19 = *(void *)(a1 + 56);
  id v17 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v18 = v13;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, block);
}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      long long v13 = [*(id *)(a1 + 40) zoneID];
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      long long v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@ with error %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
      id v8 = [*(id *)(a1 + 40) zoneID];
      int v15 = 138412802;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      long long v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone saved successfully for zoneID %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 40) setZone:*(void *)(a1 + 48)];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2_69;
  block[3] = &unk_1E6B91A40;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v7;
  uint64_t v15 = *(void *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v14 = v10;
  id v9 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2_69(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = (objc_class *)objc_opt_class();
        id v4 = NSStringFromClass(v3);
        id v5 = NSStringFromSelector(*(SEL *)(v1 + 64));
        uint64_t v6 = *(void *)(v1 + 32);
        int v7 = 138412802;
        id v8 = v4;
        __int16 v9 = 2112;
        long long v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneSaveBlock with error %@", (uint8_t *)&v7, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)deleteZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v28 = a4;
  id v10 = a5;
  __int16 v11 = v10;
  if (!v9)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1A180]);
  uint64_t v13 = [(SMCloudKitZone *)self zoneID];
  v42[0] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v15 = [v12 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v14];

  uint64_t v16 = [(SMCloudKitZone *)self container];
  __int16 v17 = [v15 configuration];
  [v17 setContainer:v16];

  [v15 setDatabase:v9];
  long long v18 = [v15 configuration];
  id v37 = v18;
  [(id)objc_opt_class() configureCloudKitQos:v28 configuration:&v37];
  id v27 = v37;

  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = (objc_class *)objc_opt_class();
    __int16 v21 = NSStringFromClass(v20);
    uint64_t v22 = NSStringFromSelector(a2);
    uint64_t v23 = [(SMCloudKitZone *)self zoneID];
    id v24 = [v15 operationID];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v23;
    __int16 v40 = 2112;
    id v41 = v24;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v39) = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke;
  v33[3] = &unk_1E6B93250;
  SEL v35 = buf;
  SEL v36 = a2;
  v33[4] = self;
  id v25 = v11;
  id v34 = v25;
  [v15 setPerRecordZoneDeleteBlock:v33];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_72;
  v29[3] = &unk_1E6B93200;
  v29[4] = self;
  SEL v31 = buf;
  SEL v32 = a2;
  id v30 = v25;
  [v15 setModifyRecordZonesCompletionBlock:v29];
  [v9 addOperation:v15];

  _Block_object_dispose(buf, 8);
LABEL_9:
}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B93228;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v4;
  dispatch_async(v5, block);
}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v8 = [*(id *)(a1 + 40) zoneID];
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138413058;
    long long v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to delete zone with zoneID %@ with error %@", (uint8_t *)&v12, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v10);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v8 = [*(id *)(a1 + 40) zoneID];
    int v12 = 138412802;
    long long v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone deleted successfully for zoneID %@", (uint8_t *)&v12, 0x20u);
  }

LABEL_7:
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v11 + 24))
  {
    *(unsigned char *)(v11 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2_73;
  block[3] = &unk_1E6B91A40;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v7;
  uint64_t v15 = *(void *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v14 = v10;
  id v9 = v5;
  dispatch_async(v6, block);
}

uint64_t __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2_73(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = (objc_class *)objc_opt_class();
        id v4 = NSStringFromClass(v3);
        id v5 = NSStringFromSelector(*(SEL *)(v1 + 64));
        uint64_t v6 = *(void *)(v1 + 32);
        int v7 = 138412802;
        id v8 = v4;
        __int16 v9 = 2112;
        long long v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneDeleteBlock with error %@", (uint8_t *)&v7, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)fetchShareWithQos:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v9 = *MEMORY[0x1E4F19D48];
    long long v10 = [(SMCloudKitZone *)self zoneID];
    __int16 v11 = [v8 initWithRecordName:v9 zoneID:v10];

    uint64_t v12 = [(SMCloudKitZone *)self privateDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__SMCloudKitZone_fetchShareWithQos_withCompletion___block_invoke;
    v13[3] = &unk_1E6B93278;
    id v14 = v7;
    [(SMCloudKitZone *)self fetchRecord:v11 fromDatabase:v12 qos:v6 withCompletion:v13];
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

uint64_t __51__SMCloudKitZone_fetchShareWithQos_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchShareParticipantsWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v54 = a4;
  id v55 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v56 = v7;
  uint64_t v9 = [v7 receiverHandles];
  id v60 = [v8 initWithCapacity:[v9 count]];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = [v7 receiverHandles];
  uint64_t v10 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v70;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v70 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1E4F99888];
        uint64_t v15 = [v13 primaryHandle];
        uint64_t v16 = [v14 getSMHandleTypeWithHandle:v15];

        if (v16 == 2)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F1A488]);
          __int16 v18 = [v13 primaryHandle];
          uint64_t v19 = [v20 initWithEmailAddress:v18];
        }
        else
        {
          if (v16 != 1) {
            goto LABEL_20;
          }
          id v17 = objc_alloc(MEMORY[0x1E4F1A488]);
          __int16 v18 = [v13 primaryHandle];
          uint64_t v19 = [v17 initWithPhoneNumber:v18];
        }
        __int16 v21 = (void *)v19;

        if (!v21)
        {
LABEL_20:
          id v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            id v46 = (objc_class *)objc_opt_class();
            id v47 = NSStringFromClass(v46);
            id v48 = NSStringFromSelector(a2);
            SEL v49 = [v13 primaryHandle];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v47;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v48;
            *(_WORD *)&buf[22] = 2112;
            v80 = v49;
            _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Invalid Handle %@", buf, 0x20u);
          }
          id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v83 = @"Invalid Receiver Handle received";
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v45 = (void *)[v44 initWithDomain:*MEMORY[0x1E4F99A48] code:0 userInfo:v32];
          (*((void (**)(id, void, void, void *))v55 + 2))(v55, 0, 0, v45);

          goto LABEL_23;
        }
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = (objc_class *)objc_opt_class();
          id v24 = NSStringFromClass(v23);
          id v25 = NSStringFromSelector(a2);
          uint64_t v26 = [v13 primaryHandle];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2112;
          v80 = v26;
          LOWORD(v81) = 2112;
          *(void *)((char *)&v81 + 2) = v21;
          _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,Valid Handle %@,%@", buf, 0x2Au);
        }
        [v60 setObject:v21 forKeyedSubscript:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v27 = objc_alloc(MEMORY[0x1E4F1A0D8]);
  id v28 = [v60 allValues];
  id obj = (id)[v27 initWithUserIdentityLookupInfos:v28];

  id v29 = [(SMCloudKitZone *)self container];
  id v30 = [obj configuration];
  [v30 setContainer:v29];

  SEL v31 = [obj configuration];
  id v68 = v31;
  [(id)objc_opt_class() configureCloudKitQos:v54 configuration:&v68];
  id v32 = v68;

  id v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = (objc_class *)objc_opt_class();
    SEL v35 = NSStringFromClass(v34);
    SEL v36 = NSStringFromSelector(a2);
    id v37 = [(SMCloudKitZone *)self zoneID];
    id v38 = [obj operationID];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2112;
    v80 = v37;
    LOWORD(v81) = 2112;
    *(void *)((char *)&v81 + 2) = v38;
    _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v80 = __Block_byref_object_copy__26;
  *(void *)&long long v81 = __Block_byref_object_dispose__26;
  id v39 = objc_alloc(MEMORY[0x1E4F1CA60]);
  __int16 v40 = [v56 receiverHandles];
  *((void *)&v81 + 1) = [v39 initWithCapacity:[v40 count]];

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke;
  v67[3] = &unk_1E6B932C8;
  void v67[4] = self;
  v67[5] = buf;
  v67[6] = a2;
  [obj setPerShareParticipantCompletionBlock:v67];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_84;
  v61[3] = &unk_1E6B93318;
  uint8_t v61[4] = self;
  SEL v66 = a2;
  id v64 = v55;
  id v62 = v56;
  id v63 = v60;
  __int16 v65 = buf;
  [obj setFetchShareParticipantsCompletionBlock:v61];
  id v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    id v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    id v53 = [obj userIdentityLookupInfos];
    *(_DWORD *)v73 = 138412802;
    id v74 = v51;
    __int16 v75 = 2112;
    id v76 = v52;
    __int16 v77 = 2112;
    v78 = v53;
    _os_log_debug_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,adding fetch share participants operation with ID lookups %@", v73, 0x20u);
  }
  id v42 = [(SMCloudKitZone *)self container];
  [v42 addOperation:obj];

  _Block_object_dispose(buf, 8);
LABEL_23:
}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2;
  v15[3] = &unk_1E6B932A0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v11;
  id v18 = v7;
  id v19 = v8;
  long long v20 = *(_OWORD *)(a1 + 40);
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  dispatch_async(v10, v15);
}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [*(id *)(a1 + 40) zoneID];
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138413314;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to identify participant %@ for zoneID %@ with error %@", (uint8_t *)&v16, 0x34u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v8 = *(void *)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) zoneID];
      int v16 = 138413058;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,identified participant %@ for zoneID %@", (uint8_t *)&v16, 0x2Au);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2_85;
  block[3] = &unk_1E6B932F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  uint64_t v16 = *(void *)(a1 + 72);
  id v14 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v15 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2_85(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 code] == 2)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v3 = [*(id *)(a1 + 32) userInfo];
      id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v39 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              uint64_t v11 = (objc_class *)objc_opt_class();
              id v12 = NSStringFromClass(v11);
              id v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
              uint64_t v14 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138413058;
              id v44 = v12;
              __int16 v45 = 2112;
              id v46 = v13;
              __int16 v47 = 2112;
              uint64_t v48 = v9;
              __int16 v49 = 2112;
              uint64_t v50 = v14;
              _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perShareParticipantCompletionBlock for user ID lookup info %@ with error %@", buf, 0x2Au);
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v51 count:16];
        }
        while (v6);
      }
    }
    else
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v30 = (objc_class *)objc_opt_class();
        SEL v31 = NSStringFromClass(v30);
        id v32 = NSStringFromSelector(*(SEL *)(a1 + 80));
        uint64_t v33 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        id v44 = v31;
        __int16 v45 = 2112;
        id v46 = v32;
        __int16 v47 = 2112;
        uint64_t v48 = v33;
        _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete fetching of share participants with error %@", buf, 0x20u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138412546;
      id v44 = v17;
      __int16 v45 = 2112;
      id v46 = v18;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,completed fetch of share participants", buf, 0x16u);
    }
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    __int16 v20 = [*(id *)(a1 + 48) receiverHandles];
    uint64_t v21 = [v19 initWithCapacity:[v20 count]];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    __int16 v22 = [*(id *)(a1 + 48) receiverHandles];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          id v28 = [*(id *)(a1 + 56) objectForKeyedSubscript:v27];
          id v29 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKeyedSubscript:v28];
          [v21 setObject:v27 forKeyedSubscript:v29];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v24);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)saveRecord:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (!v11)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v17 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_12;
  }
  if (!v10)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v17 = "Invalid parameter not satisfying: record";
    goto LABEL_11;
  }
  if (!v13)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v17 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  v21[0] = v10;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__SMCloudKitZone_saveRecord_toDatabase_qos_withCompletion___block_invoke;
  v18[3] = &unk_1E6B92A68;
  id v19 = v14;
  [(SMCloudKitZone *)self saveRecords:v15 toDatabase:v11 qos:v12 withCompletion:v18];

  uint64_t v16 = v19;
LABEL_12:
}

void __59__SMCloudKitZone_saveRecord_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)saveRecords:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v12)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: database";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_19;
  }
  if (!v11)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: records";
    goto LABEL_18;
  }
  if (!v13)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: qos";
    goto LABEL_18;
  }
  if (!v14)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_18;
  }
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    id v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    long long v40 = v29;
    __int16 v41 = 2112;
    id v42 = v30;
    __int16 v43 = 2112;
    id v44 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,%@,%@,saving records,%@", buf, 0x20u);
  }
  uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v11 recordIDsToDelete:0];
  __int16 v18 = [(SMCloudKitZone *)self container];
  id v19 = [v17 configuration];
  [v19 setContainer:v18];

  [v17 setDatabase:v12];
  [v17 setSavePolicy:1];
  __int16 v20 = [v17 configuration];
  id v38 = v20;
  [(id)objc_opt_class() configureCloudKitQos:v13 configuration:&v38];
  id v33 = v38;

  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = (objc_class *)objc_opt_class();
    SEL v31 = NSStringFromClass(v22);
    NSStringFromSelector(a2);
    uint64_t v23 = v32 = a2;
    uint64_t v24 = [(SMCloudKitZone *)self zoneID];
    uint64_t v25 = [v17 operationID];
    *(_DWORD *)buf = 138413058;
    long long v40 = v31;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2112;
    id v44 = v24;
    __int16 v45 = 2112;
    uint64_t v46 = v25;
    uint64_t v26 = (void *)v25;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    a2 = v32;
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke;
  v37[3] = &unk_1E6B93340;
  v37[4] = self;
  v37[5] = a2;
  [v17 setPerRecordSaveBlock:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_89;
  v34[3] = &unk_1E6B93368;
  v34[4] = self;
  SEL v36 = a2;
  id v35 = v15;
  [v17 setModifyRecordsCompletionBlock:v34];
  [v12 addOperation:v17];

LABEL_19:
}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_2;
  v13[3] = &unk_1E6B917F0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v6;
  uint64_t v17 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, v13);
}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138413058;
      id v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save record with recordID %@ with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v10);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully saved records with recordID %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }
}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_89(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413314;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,modifyRecordsCompletionBlock called, savedRecords, %@, deletedRecordIDs, %@, operationError, %@", buf, 0x34u);
  }
  __int16 v14 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_90;
  block[3] = &unk_1E6B91C48;
  uint64_t v15 = *(void *)(a1 + 32);
  id v21 = v9;
  uint64_t v22 = v15;
  long long v19 = *(_OWORD *)(a1 + 40);
  id v16 = (id)v19;
  long long v24 = v19;
  id v23 = v7;
  id v17 = v7;
  id v18 = v9;
  dispatch_async(v14, block);
}

uint64_t __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_90(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412802;
      int v12 = v6;
      __int16 v13 = 2112;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save records with error %@", (uint8_t *)&v11, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v9);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v11 = 138412546;
    int v12 = v6;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully saved all records", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)saveRecordsWithRetry:(int64_t)a3 records:(id)a4 toDatabase:(id)a5 qos:(id)a6 withCompletion:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = v16;
  if (!v14)
  {
    long long v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: database";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_15;
  }
  if (!v13)
  {
    long long v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: records";
    goto LABEL_14;
  }
  if (!v16)
  {
    long long v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: completion";
    goto LABEL_14;
  }
  if (!v15)
  {
    long long v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "Invalid parameter not satisfying: qos";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  id v18 = [(SMCloudKitZone *)self privateDatabase];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __77__SMCloudKitZone_saveRecordsWithRetry_records_toDatabase_qos_withCompletion___block_invoke;
  v21[3] = &unk_1E6B93390;
  v21[4] = self;
  SEL v25 = a2;
  id v24 = v17;
  int64_t v26 = a3;
  id v22 = v13;
  id v23 = v15;
  [(SMCloudKitZone *)self saveRecords:v22 toDatabase:v18 qos:v23 withCompletion:v21];

LABEL_16:
}

void __77__SMCloudKitZone_saveRecordsWithRetry_records_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v17 = [*(id *)(a1 + 32) zoneID];
      int v29 = 138412802;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,records saved successfully for zoneID %@", (uint8_t *)&v29, 0x20u);
    }
    goto LABEL_13;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v6])
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_14;
    }
    id v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v21 = [*(id *)(a1 + 32) zoneID];
    int v29 = 138413058;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v21;
    __int16 v35 = 2112;
    id v36 = v6;
    id v22 = "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@ with non recoverable error %@";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v29, 0x2Au);

    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7 <= 0)
  {
    if (!v9) {
      goto LABEL_13;
    }
    id v28 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v28);
    uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v21 = [*(id *)(a1 + 32) zoneID];
    int v29 = 138413058;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v21;
    __int16 v35 = 2112;
    id v36 = v6;
    id v22 = "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@  after retries with recoverable error %@";
    goto LABEL_16;
  }
  if (v9)
  {
    id v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    SEL v25 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int64_t v26 = [*(id *)(a1 + 32) zoneID];
    uint64_t v27 = *(void *)(a1 + 72);
    int v29 = 138413314;
    id v30 = v24;
    __int16 v31 = 2112;
    id v32 = v25;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 1024;
    int v38 = v27;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@ with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v29, 0x30u);
  }
  uint64_t v10 = *(void *)(a1 + 72) - 1;
  int v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = [v11 privateDatabase];
  [v11 saveRecordsWithRetry:v10 records:v12 toDatabase:v13 qos:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];

LABEL_14:
}

- (void)fetchRecord:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (!v12)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: recordID";
    goto LABEL_13;
  }
  if (!v14)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  v44[0] = v11;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  id v18 = [v16 initWithRecordIDs:v17];

  long long v19 = [(SMCloudKitZone *)self container];
  uint64_t v20 = [v18 configuration];
  [v20 setContainer:v19];

  [v18 setDatabase:v12];
  id v21 = [v18 configuration];
  id v39 = v21;
  [(id)objc_opt_class() configureCloudKitQos:v13 configuration:&v39];
  id v30 = v39;

  id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = (objc_class *)objc_opt_class();
    int v29 = NSStringFromClass(v23);
    id v28 = NSStringFromSelector(a2);
    id v24 = [(SMCloudKitZone *)self zoneID];
    SEL v25 = [v18 operationID];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2112;
    __int16 v41 = v24;
    __int16 v42 = 2112;
    __int16 v43 = v25;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v41) = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke;
  v35[3] = &unk_1E6B933B8;
  __int16 v37 = buf;
  SEL v38 = a2;
  v35[4] = self;
  id v26 = v15;
  id v36 = v26;
  [v18 setPerRecordCompletionBlock:v35];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_93;
  v31[3] = &unk_1E6B931D8;
  v31[4] = self;
  __int16 v33 = buf;
  SEL v34 = a2;
  id v32 = v26;
  [v18 setFetchRecordsCompletionBlock:v31];
  [v12 addOperation:v18];

  _Block_object_dispose(buf, 8);
LABEL_14:
}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E6B91BA8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v9;
  uint64_t v19 = *(void *)(a1 + 56);
  id v17 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v18 = v13;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, block);
}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    int v13 = 138413058;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch record error %@ for record %@", (uint8_t *)&v13, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v10 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v10);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v11 = *(void *)(a1 + 48);
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully fetch record %@", (uint8_t *)&v13, 0x20u);
  }

LABEL_7:
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v12 + 24))
  {
    *(unsigned char *)(v12 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2_94;
  block[3] = &unk_1E6B91A40;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v4;
  dispatch_async(v5, block);
}

uint64_t __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2_94(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        id v3 = (objc_class *)objc_opt_class();
        id v4 = NSStringFromClass(v3);
        id v5 = NSStringFromSelector(*(SEL *)(v1 + 64));
        uint64_t v6 = *(void *)(v1 + 32);
        int v7 = 138412802;
        id v8 = v4;
        __int16 v9 = 2112;
        id v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordCompletionBlock with error %@", (uint8_t *)&v7, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)updateRecord:(id)a3 inDatabase:(id)a4 qos:(id)a5 usingBlock:(id)a6 withCompletion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = v17;
  if (!v14)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: database";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_15;
  }
  if (!v13)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: recordID";
    goto LABEL_14;
  }
  if (!v16)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: block";
    goto LABEL_14;
  }
  if (!v17)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "Invalid parameter not satisfying: completion";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke;
  v21[3] = &unk_1E6B93408;
  v21[4] = self;
  SEL v27 = a2;
  id v22 = v13;
  id v25 = v18;
  id v26 = v16;
  id v23 = v14;
  id v24 = v15;
  [(SMCloudKitZone *)self fetchRecord:v22 fromDatabase:v23 qos:v24 withCompletion:v21];

LABEL_16:
}

void __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138413314;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      id v32 = v18;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to fetch record for recordID %@ for zoneID %@ with error %@", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
    id v24 = v5;
    (*(void (**)(void))(v8 + 16))();
    id v9 = v24;

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke_95;
    v19[3] = &unk_1E6B933E0;
    uint64_t v13 = *(void *)(a1 + 80);
    void v19[4] = v10;
    uint64_t v23 = v13;
    id v20 = *(id *)(a1 + 40);
    id v5 = v9;
    id v21 = v5;
    id v22 = *(id *)(a1 + 64);
    [v10 saveRecord:v5 toDatabase:v11 qos:v12 withCompletion:v19];
  }
}

void __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = [*(id *)(a1 + 32) zoneID];
      int v16 = 138413314;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save record for recordID %@ for zoneID %@ with error %@", (uint8_t *)&v16, 0x34u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v14);
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v13 = [*(id *)(a1 + 32) zoneID];
    int v16 = 138413058;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,record %@ saved successfully for zoneID %@", (uint8_t *)&v16, 0x2Au);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deleteRecords:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v12)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "Invalid parameter not satisfying: recordIDs";
    goto LABEL_13;
  }
  if (!v14)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  int v16 = [objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v11];
  uint64_t v17 = [(SMCloudKitZone *)self container];
  __int16 v18 = [v16 configuration];
  [v18 setContainer:v17];

  [v16 setDatabase:v12];
  __int16 v19 = [v16 configuration];
  id v35 = v19;
  [(id)objc_opt_class() configureCloudKitQos:v13 configuration:&v35];
  id v20 = v35;

  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    NSStringFromSelector(a2);
    v24 = id v29 = v13;
    [(SMCloudKitZone *)self zoneID];
    id v25 = v28 = a2;
    [v16 operationID];
    uint64_t v26 = v30 = v20;
    *(_DWORD *)buf = 138413058;
    __int16 v37 = v23;
    __int16 v38 = 2112;
    id v39 = v24;
    __int16 v40 = 2112;
    __int16 v41 = v25;
    __int16 v42 = 2112;
    __int16 v43 = v26;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    id v20 = v30;
    a2 = v28;

    id v13 = v29;
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke;
  v34[3] = &unk_1E6B93430;
  v34[4] = self;
  void v34[5] = a2;
  [v16 setPerRecordDeleteBlock:v34];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_97;
  v31[3] = &unk_1E6B93368;
  v31[4] = self;
  SEL v33 = a2;
  id v32 = v15;
  [v16 setModifyRecordsCompletionBlock:v31];
  [v12 addOperation:v16];

LABEL_14:
}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2;
  v12[3] = &unk_1E6B917F0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  uint64_t v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138413058;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete record with recordID %@ with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v10);
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully deleted record with recordID %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }
}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_97(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2_98;
  block[3] = &unk_1E6B90FA8;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v8, block);
}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2_98(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    long long v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully deleted all records", buf, 0x16u);
    }
    goto LABEL_17;
  }
  if ([v2 code] != 2)
  {
    long long v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete one or more records with error %@", buf, 0x20u);
    }
LABEL_17:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  id v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v11 = [v4 objectForKey:v10, v27];

        if (v11)
        {
          uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = (objc_class *)objc_opt_class();
            __int16 v24 = NSStringFromClass(v23);
            id v25 = NSStringFromSelector(*(SEL *)(a1 + 64));
            uint64_t v26 = [v4 objectForKeyedSubscript:v10];
            *(_DWORD *)buf = 138413058;
            id v32 = v24;
            __int16 v33 = 2112;
            id v34 = v25;
            __int16 v35 = 2112;
            uint64_t v36 = v10;
            __int16 v37 = 2112;
            __int16 v38 = v26;
            _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Partial failure - Failed to delete record with record ID %@ with error %@", buf, 0x2Au);
          }
          uint64_t v17 = *(void *)(a1 + 56);
          __int16 v18 = [v4 objectForKeyedSubscript:v10];
          (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

          goto LABEL_21;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (void)removeShareParticipantsInConversation:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  long long v12 = [(SMCloudKitZone *)self share];

  BOOL v13 = v12 == 0;
  id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v27 = (objc_class *)objc_opt_class();
      long long v28 = NSStringFromClass(v27);
      long long v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,CloudKit zone share not set up", buf, 0x16u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v39 = *MEMORY[0x1E4F28568];
    __int16 v24 = [NSString stringWithFormat:@"CloudKit zone share has not been set up"];
    uint64_t v40 = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v26 = (void *)[v23 initWithDomain:*MEMORY[0x1E4F99A48] code:49 userInfo:v25];

    v11[2](v11, 0, v26);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      __int16 v18 = NSStringFromSelector(a2);
      uint64_t v19 = [v9 receiverPrimaryHandles];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      __int16 v42 = v19;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,removing handles from share,%@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v42 = __Block_byref_object_copy__26;
    __int16 v43 = __Block_byref_object_dispose__26;
    id v44 = (id)MEMORY[0x1E4F1CBF0];
    uint64_t v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke;
    v35[3] = &unk_1E6B93458;
    __int16 v37 = buf;
    SEL v38 = a2;
    v35[4] = self;
    uint64_t v21 = v20;
    uint64_t v36 = v21;
    [(SMCloudKitZone *)self fetchShareParticipantsWithConversation:v9 qos:v10 completion:v35];
    uint64_t v22 = [(SMCloudKitZone *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_100;
    block[3] = &unk_1E6B93228;
    void block[4] = self;
    id v31 = v10;
    __int16 v33 = buf;
    SEL v34 = a2;
    id v32 = v11;
    dispatch_group_notify(v21, v22, block);

    _Block_object_dispose(buf, 8);
  }
}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 allKeys];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v11 = 138412802;
    long long v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,found participants to remove from share,%@", (uint8_t *)&v11, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 share];
  uint64_t v4 = [v3 recordID];
  id v5 = [*(id *)(a1 + 32) privateDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_2;
  v12[3] = &unk_1E6B93480;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_102;
  v9[3] = &unk_1E6B934A8;
  v9[4] = v13;
  uint64_t v11 = v8;
  id v10 = *(id *)(a1 + 48);
  [v2 updateRecord:v4 inDatabase:v5 qos:v6 usingBlock:v12 withCompletion:v9];
}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = a1;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      uint64_t v14 = v3;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v11 = (objc_class *)objc_opt_class();
            long long v12 = NSStringFromClass(v11);
            uint64_t v13 = NSStringFromSelector(*(SEL *)(v3 + 48));
            *(_DWORD *)buf = 138412802;
            uint64_t v20 = v12;
            __int16 v21 = 2112;
            uint64_t v22 = v13;
            __int16 v23 = 2112;
            uint64_t v24 = v9;
            _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,removing participant from share,%@", buf, 0x20u);

            uint64_t v3 = v14;
          }

          [*a2 removeParticipant:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", buf, 2u);
    }
  }
}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = a2;
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v11 = 138412802;
      long long v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to remove participants with error,%@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setShare:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createNewInvitationTokensWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke;
  v15[3] = &unk_1E6B93520;
  id v18 = v11;
  SEL v19 = a2;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  [(SMCloudKitZone *)self fetchShareParticipantsWithConversation:v14 qos:v12 completion:v15];
}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = (objc_class *)objc_opt_class();
      long long v27 = NSStringFromClass(v26);
      long long v28 = NSStringFromSelector(*(SEL *)(a1 + 64));
      long long v29 = [*(id *)(a1 + 40) receiverHandles];
      long long v30 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138413314;
      __int16 v43 = v27;
      __int16 v44 = 2112;
      uint64_t v45 = v28;
      __int16 v46 = 2112;
      uint64_t v47 = v29;
      __int16 v48 = 2112;
      __int16 v49 = v30;
      __int16 v50 = 2112;
      id v51 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to identify participants %@ for zoneID %@ with error %@", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v10 = [*(id *)(a1 + 40) receiverHandles];
    id v11 = [v9 initWithCapacity:[v10 count]];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          id v18 = [*(id *)(a1 + 32) share];
          [v18 removeParticipant:v17];

          SEL v19 = [*(id *)(a1 + 32) share];
          [v19 addParticipant:v17];

          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v14);
    }

    uint64_t v20 = *(void **)(a1 + 32);
    __int16 v21 = [v20 share];
    uint64_t v22 = [*(id *)(a1 + 32) privateDatabase];
    uint64_t v23 = *(void *)(a1 + 48);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_108;
    v32[3] = &unk_1E6B934F8;
    v32[4] = *(void *)(a1 + 32);
    long long v31 = *(_OWORD *)(a1 + 56);
    id v24 = (id)v31;
    long long v36 = v31;
    id v33 = *(id *)(a1 + 40);
    id v34 = v11;
    id v35 = v12;
    id v25 = v11;
    [v20 saveRecord:v21 toDatabase:v22 qos:v23 withCompletion:v32];
  }
}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v36 = a2;
  id v35 = a3;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v5 = v4;
  if (v35)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      id v33 = NSStringFromSelector(*(SEL *)(a1 + 72));
      id v34 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      id v51 = v34;
      LOWORD(v52) = 2112;
      *(void *)((char *)&v52 + 2) = v35;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed for zoneID %@ with error %@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
      id v9 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      id v51 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,record saved successfully for zoneID %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v51 = __Block_byref_object_copy__26;
    *(void *)&long long v52 = __Block_byref_object_dispose__26;
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v11 = [*(id *)(a1 + 40) receiverHandles];
    *((void *)&v52 + 1) = [v10 initWithCapacity:[v11 count]];

    id v12 = [v36 participants];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_110;
    v45[3] = &unk_1E6B934D0;
    id v46 = *(id *)(a1 + 48);
    __int16 v48 = buf;
    id v47 = *(id *)(a1 + 40);
    [v12 enumerateObjectsUsingBlock:v45];

    [*(id *)(a1 + 32) setShare:v36];
    id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = [*(id *)(a1 + 40) receiverHandles];
    long long v39 = [v13 initWithCapacity:[v14 count]];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v15)
    {
      uint64_t v38 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v18 = objc_alloc(MEMORY[0x1E4F19F68]);
          SEL v19 = [v17 invitationToken];
          uint64_t v20 = [v19 sharingInvitationData];
          __int16 v21 = [*(id *)(a1 + 32) share];
          uint64_t v22 = [v21 URL];
          uint64_t v23 = [v17 invitationToken];
          id v24 = [v23 participantID];
          id v25 = (void *)[v18 initWithSharingInvitationData:v20 shareURL:v22 participantID:v24];

          uint64_t v26 = [*(id *)(a1 + 56) objectForKeyedSubscript:v17];
          long long v27 = [v26 primaryHandle];
          [v39 setObject:v25 forKeyedSubscript:v27];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v15);
    }

    long long v28 = (void *)[v39 copy];
    [*(id *)(a1 + 32) setInvitationTokenMap:v28];

    uint64_t v29 = *(void *)(a1 + 64);
    long long v30 = [*(id *)(a1 + 32) invitationTokenMap];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v29 + 16))(v29, v30, 1, 0);

    _Block_object_dispose(buf, 8);
  }
}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_110(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    id v7 = [*(id *)(a1 + 40) receiverHandles];
    uint64_t v8 = [v7 count];

    if (v6 == v8) {
      *a4 = 1;
    }
  }
}

- (void)subscribeToZoneChangesInPrivateDatabaseWithQoS:(id)a3 completion:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1A340];
  id v9 = a3;
  id v10 = [v8 alloc];
  id v11 = [(SMCloudKitZone *)self zoneID];
  id v12 = [(SMCloudKitZone *)self zoneSubscriptionID];
  id v13 = (void *)[v10 initWithZoneID:v11 subscriptionID:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
  [v14 setShouldSendContentAvailable:1];
  [v13 setNotificationInfo:v14];
  id v15 = objc_alloc(MEMORY[0x1E4F1A1B8]);
  v45[0] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  uint64_t v17 = (void *)[v15 initWithSubscriptionsToSave:v16 subscriptionIDsToDelete:0];

  id v18 = [v17 configuration];
  id v36 = v18;
  [(id)objc_opt_class() configureCloudKitQos:v9 configuration:&v36];

  id v19 = v36;
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v23 = NSStringFromSelector(a2);
    [(SMCloudKitZone *)self zoneID];
    v24 = id v32 = a2;
    [v17 operationID];
    id v31 = v14;
    id v25 = v19;
    uint64_t v26 = v13;
    long long v28 = v27 = v7;
    *(_DWORD *)buf = 138413058;
    uint64_t v38 = v22;
    __int16 v39 = 2112;
    long long v40 = v23;
    __int16 v41 = 2112;
    long long v42 = v24;
    __int16 v43 = 2112;
    long long v44 = v28;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    id v7 = v27;
    id v13 = v26;
    id v19 = v25;
    id v14 = v31;

    a2 = v32;
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76__SMCloudKitZone_subscribeToZoneChangesInPrivateDatabaseWithQoS_completion___block_invoke;
  v33[3] = &unk_1E6B93368;
  id v34 = v7;
  SEL v35 = a2;
  v33[4] = self;
  id v29 = v7;
  [v17 setModifySubscriptionsCompletionBlock:v33];
  long long v30 = [(SMCloudKitZone *)self privateDatabase];
  [v30 addOperation:v17];
}

void __76__SMCloudKitZone_subscribeToZoneChangesInPrivateDatabaseWithQoS_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v15 = [*(id *)(a1 + 32) zoneID];
      int v16 = 138413058;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v15;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed for zoneID %@ with error %@", (uint8_t *)&v16, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v11 = [*(id *)(a1 + 32) zoneID];
    int v16 = 138413058;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = 0;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,succeeded for zoneID %@ with error %@", (uint8_t *)&v16, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)shouldRetryCkError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];

  BOOL v7 = 1;
  if (v5)
  {
    if ((unint64_t v6 = [v3 code], v6 <= 0x24) && ((1 << v6) & 0x1BFFAF5FA2) != 0 || v6 - 110 < 3) {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (CKRecordZoneID)zoneID
{
  uint64_t v2 = [(SMCloudKitZone *)self zone];
  id v3 = [v2 zoneID];

  return (CKRecordZoneID *)v3;
}

- (NSString)zoneName
{
  uint64_t v2 = [(SMCloudKitZone *)self zoneID];
  id v3 = [v2 zoneName];

  return (NSString *)v3;
}

- (NSString)zoneSubscriptionID
{
  uint64_t v2 = [(SMCloudKitZone *)self zoneName];
  id v3 = [@"SMCloudKitSubscription-" stringByAppendingString:v2];

  return (NSString *)v3;
}

- (NSString)ownerName
{
  uint64_t v2 = [(SMCloudKitZone *)self zoneID];
  id v3 = [v2 ownerName];

  return (NSString *)v3;
}

- (CKDatabase)privateDatabase
{
  uint64_t v2 = [(SMCloudKitZone *)self container];
  id v3 = [v2 privateCloudDatabase];

  return (CKDatabase *)v3;
}

- (CKDatabase)sharedDatabase
{
  uint64_t v2 = [(SMCloudKitZone *)self container];
  id v3 = [v2 sharedCloudDatabase];

  return (CKDatabase *)v3;
}

- (id)apsEnvironmentString
{
  v54[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)xpc_copy_entitlement_for_self();
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__26;
  long long v44 = __Block_byref_object_dispose__26;
  id v45 = 0;
  if (v4)
  {
    uint64_t v5 = _CFXPCCreateCFObjectFromXPCObject();
    unint64_t v6 = (void *)v41[5];
    v41[5] = v5;

    BOOL v7 = (void *)v41[5];
    if (v7)
    {
      if (![v7 compare:*MEMORY[0x1E4F19CE0] options:1])
      {
        *(void *)id v51 = 0;
        *(void *)&v51[8] = v51;
        *(void *)&v51[16] = 0x3032000000;
        long long v52 = __Block_byref_object_copy__26;
        *(void *)&long long v53 = __Block_byref_object_dispose__26;
        *((void *)&v53 + 1) = dispatch_semaphore_create(0);
        uint64_t v8 = [(SMCloudKitZone *)self container];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __38__SMCloudKitZone_apsEnvironmentString__block_invoke;
        v39[3] = &unk_1E6B93548;
        void v39[4] = self;
        v39[5] = &v40;
        v39[6] = v51;
        v39[7] = a2;
        [v8 serverPreferredPushEnvironmentWithCompletionHandler:v39];

        id v9 = *(id *)(*(void *)&v51[8] + 40);
        id v10 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v11 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v9, v11)) {
          goto LABEL_9;
        }
        uint64_t v38 = [MEMORY[0x1E4F1C9C8] now];
        [v38 timeIntervalSinceDate:v10];
        double v13 = v12;
        id v14 = objc_opt_new();
        id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_21];
        int v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
        __int16 v18 = [v17 firstObject];

        [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
        id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v20 = (void *)MEMORY[0x1E4F28C58];
        v54[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v54 count:1];
        __int16 v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

        if (v22)
        {
          id v23 = v22;
        }
        else
        {
LABEL_9:
          id v23 = 0;
        }

        id v24 = v23;
        if (v24)
        {
          id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            id v29 = [(SMCloudKitZone *)self zoneName];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v27;
            __int16 v47 = 2112;
            id v48 = v28;
            __int16 v49 = 2112;
            __int16 v50 = v29;
            _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Timeout getting server preferred push environment", buf, 0x20u);
          }
        }
        _Block_object_dispose(v51, 8);
      }
    }
  }
  long long v30 = (void *)v41[5];
  if (!v30) {
    long long v30 = (void *)*MEMORY[0x1E4F4E1D0];
  }
  id v31 = v30;
  id v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v36 = [(SMCloudKitZone *)self zoneName];
    *(_DWORD *)id v51 = 138413058;
    *(void *)&v51[4] = v34;
    *(_WORD *)&v51[12] = 2112;
    *(void *)&v51[14] = v35;
    *(_WORD *)&v51[22] = 2112;
    long long v52 = v36;
    LOWORD(v53) = 2112;
    *(void *)((char *)&v53 + 2) = v31;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Using push environment %@", v51, 0x2Au);
  }
  _Block_object_dispose(&v40, 8);

  return v31;
}

void __38__SMCloudKitZone_apsEnvironmentString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      dispatch_time_t v11 = [*(id *)(a1 + 32) zoneName];
      int v15 = 138413058;
      int v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Error getting server preferred push environment %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
  id v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (id)createPushConnection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    id v6 = [(SMCloudKitZone *)self apsEnvironmentString];
    uint64_t v7 = *MEMORY[0x1E4F999E8];
    uint64_t v8 = [(SMCloudKitZone *)self queue];
    id v9 = (APSConnection *)[v5 initWithEnvironmentName:v6 namedDelegatePort:v7 queue:v8];
    id v10 = self->_pushConnection;
    self->_pushConnection = v9;

    [(APSConnection *)self->_pushConnection setDelegate:self];
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      dispatch_time_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        double v13 = NSStringFromClass(v12);
        id v14 = NSStringFromSelector(a2);
        int v15 = [(SMCloudKitZone *)self zoneName];
        int v17 = 138412802;
        __int16 v18 = v13;
        __int16 v19 = 2112;
        __int16 v20 = v14;
        __int16 v21 = 2112;
        id v22 = v15;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Couldn't create push connection", (uint8_t *)&v17, 0x20u);
      }
      pushConnection = self->_pushConnection;
    }
  }

  return pushConnection;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    dispatch_time_t v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(a2);
    double v13 = [(SMCloudKitZone *)self zoneName];
    int v14 = 138413314;
    int v15 = v11;
    __int16 v16 = 2112;
    int v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Received public token \"%@\" on connection %@", (uint8_t *)&v14, 0x34u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  int v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = (objc_class *)objc_opt_class();
    int v17 = NSStringFromClass(v16);
    __int16 v18 = NSStringFromSelector(a2);
    __int16 v19 = [(SMCloudKitZone *)self zoneName];
    int v20 = 138413826;
    id v21 = v17;
    __int16 v22 = 2112;
    id v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@", (uint8_t *)&v20, 0x48u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 userInfo];
  id v8 = [MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:v7];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    id v13 = [(SMCloudKitZone *)self zoneName];
    id v14 = [v6 topic];
    int v21 = 138413314;
    __int16 v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    __int16 v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v14;
    __int16 v29 = 2112;
    __int16 v30 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,\nAPS Push received: %@ %@", (uint8_t *)&v21, 0x34u);
  }
  int v15 = [v8 subscriptionID];
  __int16 v16 = [(SMCloudKitZone *)self zoneSubscriptionID];
  int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    __int16 v18 = [(SMCloudKitZone *)self zoneUpdateHandler];

    if (v18)
    {
      __int16 v19 = [(SMCloudKitZone *)self zoneUpdateHandler];
      int v20 = [(SMCloudKitZone *)self zoneName];
      ((void (**)(void, void *))v19)[2](v19, v20);
    }
  }
}

- (void)registerForZoneUpdatesWithHandler:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  id v7 = [v5 mainBundle];
  id v8 = [v7 bundleIdentifier];

  if (![v8 length])
  {
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
    id v10 = [v9 executablePath];
    uint64_t v11 = [v10 lastPathComponent];

    id v8 = (void *)v11;
  }
  id v12 = [@"com.apple.icloud-container." stringByAppendingString:v8];
  id v13 = [(SMCloudKitZone *)self createPushConnection];
  v26[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [(APSConnection *)self->_pushConnection _setOpportunisticTopics:v14];

  [(SMCloudKitZone *)self setZoneUpdateHandler:v6];
  int v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = (objc_class *)objc_opt_class();
    int v17 = NSStringFromClass(v16);
    __int16 v18 = NSStringFromSelector(a2);
    __int16 v19 = [(SMCloudKitZone *)self zoneName];
    int v20 = 138412802;
    int v21 = v17;
    __int16 v22 = 2112;
    __int16 v23 = v18;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@", (uint8_t *)&v20, 0x20u);
  }
}

- (void)deregisterForZoneUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    [(APSConnection *)pushConnection _setOpportunisticTopics:0];
    [(APSConnection *)self->_pushConnection shutdown];
    id v5 = self->_pushConnection;
    self->_pushConnection = 0;

    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      id v10 = [(SMCloudKitZone *)self zoneName];
      int v11 = 138412802;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@", (uint8_t *)&v11, 0x20u);
    }
  }
  [(SMCloudKitZone *)self setZoneUpdateHandler:0];
}

- (NSDictionary)invitationTokenMap
{
  return self->_invitationTokenMap;
}

- (void)setInvitationTokenMap:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (id)zoneUpdateHandler
{
  return self->_zoneUpdateHandler;
}

- (void)setZoneUpdateHandler:(id)a3
{
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong(&self->_zoneUpdateHandler, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_invitationTokenMap, 0);
}

@end