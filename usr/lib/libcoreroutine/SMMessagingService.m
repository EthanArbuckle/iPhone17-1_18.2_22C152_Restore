@interface SMMessagingService
+ (BOOL)isCellularActivated;
+ (BOOL)isStandalone;
+ (void)submitCAMetricForMessageType:(unint64_t)a3 scheduledSend:(BOOL)a4 cancelationAttempt:(BOOL)a5 attemptNumber:(int64_t)a6 wasFinalAttempt:(BOOL)a7 timeToSendMessage:(double)a8 sendError:(id)a9 success:(BOOL)a10 numReceivers:(unint64_t)a11;
- (NSUUID)deviceIdentifier;
- (SMIDSMessenger)idsMessenger;
- (SMMadridMessenger)madridMessenger;
- (SMMessagingService)init;
- (id)effectivePairedDevice;
- (int64_t)convertRTPlatformToIDSDeviceType:(id)a3;
- (void)_cancelSubscriptionOnNearbyDevicesChange;
- (void)_setup;
- (void)_startSubscriptionOnNearbyDevicesChange;
- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)cancelSubscriptionOnNearbyDevicesChanged;
- (void)deletedMessage:(id)a3;
- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4;
- (void)iMessageConversationDeletedFor:(id)a3;
- (void)iMessageDeletedFor:(id)a3;
- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5;
- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)iMessageScheduledSendTriggeredFor:(id)a3;
- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)receivedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionStartMessageSendResultWithMessage:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9;
- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4;
- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7;
- (void)setIdsMessenger:(id)a3;
- (void)setMadridMessenger:(id)a3;
- (void)startSubscriptionOnNearbyDevicesChanged;
@end

@implementation SMMessagingService

- (SMMessagingService)init
{
  v5.receiver = self;
  v5.super_class = (Class)SMMessagingService;
  v2 = [(RTNotifier *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RTService *)v2 setup];
  }
  return v3;
}

- (void)_setup
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v4 = [SMIDSMessenger alloc];
    objc_super v5 = [(RTNotifier *)self queue];
    v6 = [(SMIDSMessenger *)v4 initWithQueue:v5];
    [(SMMessagingService *)self setIdsMessenger:v6];

    v7 = [(SMMessagingService *)self idsMessenger];
    [v7 setDelegate:self];

    v8 = [SMMadridMessenger alloc];
    v9 = [(RTNotifier *)self queue];
    v10 = [(SMMadridMessenger *)v8 initWithQueue:v9];
    [(SMMessagingService *)self setMadridMessenger:v10];

    id v15 = [(SMMessagingService *)self madridMessenger];
    [v15 setDelegate:self];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,feature not enabled", buf, 0x16u);
    }
  }
}

- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SMMessagingService_findObjectForMyAccountFromDict_withHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __65__SMMessagingService_findObjectForMyAccountFromDict_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsMessenger];
  [v2 findObjectForMyAccountFromDict:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (NSUUID)deviceIdentifier
{
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  v3 = (void *)IDSCopyLocalDeviceUniqueID();
  v4 = (void *)[v2 initWithUUIDString:v3];

  return (NSUUID *)v4;
}

- (void)startSubscriptionOnNearbyDevicesChanged
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SMMessagingService_startSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__SMMessagingService_startSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSubscriptionOnNearbyDevicesChange];
}

- (void)_startSubscriptionOnNearbyDevicesChange
{
  id v2 = [(SMMessagingService *)self idsMessenger];
  [v2 startSubscriptionOnNearbyDevicesChanged];
}

- (void)cancelSubscriptionOnNearbyDevicesChanged
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMMessagingService_cancelSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__SMMessagingService_cancelSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSubscriptionOnNearbyDevicesChange];
}

- (void)_cancelSubscriptionOnNearbyDevicesChange
{
  id v2 = [(SMMessagingService *)self idsMessenger];
  [v2 cancelSubscriptionOnNearbyDevicesChanged];
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (!v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[SMMessagingService sendIDSMessage:toConversation:completion:]";
      __int16 v44 = 1024;
      LODWORD(v45) = 209;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v9)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v43 = v31;
      __int16 v44 = 2112;
      v45 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v57[0] = @"message is nil";
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = (__CFString **)v57;
    v21 = &v56;
    goto LABEL_16;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = v13;
  if (!v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v33 = [v9 sessionID];
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      v36 = NSStringFromSelector(a2);
      v37 = [v9 messageID];
      *(_DWORD *)buf = 138413058;
      v43 = v33;
      __int16 v44 = 2112;
      v45 = v35;
      __int16 v46 = 2112;
      v47 = v36;
      __int16 v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55 = @"conversation is nil";
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = &v55;
    v21 = &v54;
LABEL_16:
    v22 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    v23 = [v17 errorWithDomain:v18 code:7 userInfo:v22];
    v11[2](v11, 0, v23);

    goto LABEL_17;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = [v9 sessionID];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = NSStringFromSelector(a2);
    v28 = [v9 messageID];
    v29 = [v10 receiverHandles];
    *(_DWORD *)buf = 138413570;
    v43 = v24;
    __int16 v44 = 2112;
    v45 = v26;
    __int16 v46 = 2112;
    v47 = v27;
    __int16 v48 = 2112;
    v49 = v28;
    __int16 v50 = 2112;
    v51 = v29;
    __int16 v52 = 2112;
    id v53 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,handles:%@,messsage:%@", buf, 0x3Eu);
  }
  id v15 = [(RTNotifier *)self queue];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __63__SMMessagingService_sendIDSMessage_toConversation_completion___block_invoke;
  v38[3] = &unk_1E6B91490;
  v38[4] = self;
  id v39 = v9;
  id v40 = v10;
  v41 = v11;
  dispatch_async(v15, v38);

LABEL_17:
}

void __63__SMMessagingService_sendIDSMessage_toConversation_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsMessenger];
  [v2 sendIDSMessage:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToMyDevices:completion:]";
      __int16 v30 = 1024;
      LODWORD(v31) = 242;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = [v7 sessionID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(a2);
      v21 = [v7 messageID];
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v21;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);
    }
    id v12 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SMMessagingService_sendIDSMessageToMyDevices_completion___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v26 = v7;
    id v27 = v8;
    dispatch_async(v12, block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"message is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v16 = [v13 errorWithDomain:v14 code:7 userInfo:v15];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
}

void __59__SMMessagingService_sendIDSMessageToMyDevices_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsMessenger];
  [v2 sendIDSMessageToMyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToPairedDevice:completion:]";
      __int16 v30 = 1024;
      LODWORD(v31) = 265;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = [v7 sessionID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(a2);
      v21 = [v7 messageID];
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v21;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);
    }
    id v12 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SMMessagingService_sendIDSMessageToPairedDevice_completion___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v26 = v7;
    id v27 = v8;
    dispatch_async(v12, block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"message is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v16 = [v13 errorWithDomain:v14 code:7 userInfo:v15];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
}

void __62__SMMessagingService_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsMessenger];
  [v2 sendIDSMessageToPairedDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToMyNearbyDevices:completion:]";
      __int16 v30 = 1024;
      LODWORD(v31) = 288;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = [v7 sessionID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(a2);
      v21 = [v7 messageID];
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v21;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);
    }
    id v12 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SMMessagingService_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v26 = v7;
    id v27 = v8;
    dispatch_async(v12, block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"message is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v16 = [v13 errorWithDomain:v14 code:7 userInfo:v15];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
}

void __65__SMMessagingService_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsMessenger];
  [v2 sendIDSMessageToMyNearbyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)effectivePairedDevice
{
  id v2 = [(SMMessagingService *)self idsMessenger];
  v3 = [v2 effectivePairedDevice];

  return v3;
}

- (int64_t)convertRTPlatformToIDSDeviceType:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SMMessagingService *)self idsMessenger];
  int64_t v6 = [(id)objc_opt_class() convertRTPlatformToIDSDeviceType:v4];

  return v6;
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      id v26 = v18;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 1024;
      BOOL v34 = v7;
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageUrl:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);
    }
    id v15 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SMMessagingService_iMessageSendFor_guid_successful_withError___block_invoke;
    block[3] = &unk_1E6B9A580;
    block[4] = self;
    id v21 = v11;
    id v22 = v12;
    BOOL v24 = v7;
    id v23 = v13;
    dispatch_async(v15, block);
  }
  else
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl", buf, 2u);
    }
  }
}

void __64__SMMessagingService_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageSendFor:*(void *)(a1 + 40) guid:*(void *)(a1 + 48) successful:*(unsigned __int8 *)(a1 + 64) withError:*(void *)(a1 + 56)];
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_12;
  }
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    __int16 v27 = v19;
    __int16 v28 = 2112;
    __int16 v29 = v20;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 1024;
    BOOL v33 = v7;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@,success:%d,error:%@", buf, 0x30u);
  }
  id v15 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SMMessagingService_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  block[3] = &unk_1E6B9A580;
  block[4] = self;
  id v22 = v11;
  id v23 = v12;
  BOOL v25 = v7;
  id v24 = v13;
  dispatch_async(v15, block);

LABEL_10:
}

void __82__SMMessagingService_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageScheduledSendScheduledFor:*(void *)(a1 + 40) guid:*(void *)(a1 + 48) successful:*(unsigned __int8 *)(a1 + 64) withError:*(void *)(a1 + 56)];
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 1024;
      BOOL v28 = v6;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@,success:%d,error:%@", buf, 0x30u);
    }
    id v12 = [(RTNotifier *)self queue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__SMMessagingService_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
    v17[3] = &unk_1E6B972A0;
    v17[4] = self;
    id v18 = v9;
    BOOL v20 = v6;
    id v19 = v10;
    dispatch_async(v12, v17);
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", buf, 2u);
    }
  }
}

void __74__SMMessagingService_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageScheduledSendCancelFor:*(void *)(a1 + 40) successful:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(a1 + 48)];
}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@", buf, 0x20u);
    }
    BOOL v7 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__SMMessagingService_iMessageScheduledSendTriggeredFor___block_invoke;
    v12[3] = &unk_1E6B90BF0;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", buf, 2u);
    }
  }
}

void __56__SMMessagingService_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageScheduledSendTriggeredFor:*(void *)(a1 + 40)];
}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v15 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v15 = "Invalid parameter not satisfying: handle";
    goto LABEL_12;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    __int16 v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    id v24 = v17;
    __int16 v25 = 2112;
    id v26 = v18;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 1024;
    BOOL v32 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageUrl:%@,handle:%@,fromMe:%d", buf, 0x30u);
  }
  id v13 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__SMMessagingService_iMessageReceived_fromHandle_fromMe___block_invoke;
  v19[3] = &unk_1E6B972A0;
  v19[4] = self;
  id v20 = v9;
  id v21 = v11;
  BOOL v22 = v5;
  dispatch_async(v13, v19);

LABEL_10:
}

void __57__SMMessagingService_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageReceived:*(void *)(a1 + 40) fromHandle:*(void *)(a1 + 48) fromMe:*(unsigned __int8 *)(a1 + 56)];
}

- (void)iMessageDeletedFor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = [v5 count];
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,numMessageUrls,%lu,messsageUrls:%@", buf, 0x2Au);
    }
    id v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__SMMessagingService_iMessageDeletedFor___block_invoke;
    v12[3] = &unk_1E6B90BF0;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrls", buf, 2u);
    }
  }
}

void __41__SMMessagingService_iMessageDeletedFor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 iMessageDeletedFor:*(void *)(a1 + 40)];
}

- (void)iMessageConversationDeletedFor:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5 && [v5 count])
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      uint64_t v37 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,recipients,%@", buf, 0x20u);
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      uint64_t v16 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F99888]) initWithPrimaryHandle:*(void *)(*((void *)&v27 + 1) + 8 * v17) secondaryHandles:v16];
          [v11 addObject:v18];

          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F99838]);
    id v20 = [v11 copy];
    id v21 = (void *)[v19 initWithReceiverHandles:v20 identifier:0 displayName:0];

    uint64_t v22 = [(RTNotifier *)self queue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__SMMessagingService_iMessageConversationDeletedFor___block_invoke;
    v24[3] = &unk_1E6B90BF0;
    id v25 = v21;
    id v26 = self;
    id v23 = v21;
    dispatch_async(v22, v24);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles && receiverHandles.count", buf, 2u);
    }
  }
}

void __53__SMMessagingService_iMessageConversationDeletedFor___block_invoke(uint64_t a1)
{
  id v2 = [[SMConversationDeletedNotification alloc] initWithConversation:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) postNotification:v2];
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v17)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[SMMessagingService sendMadridMessage:associatedGUID:toConversation:summaryText:completion:]";
      __int16 v52 = 1024;
      LODWORD(v53) = 433;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v13)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      __int16 v36 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v51 = v36;
      __int16 v52 = 2112;
      id v53 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F5CFE8];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    v67[0] = @"message is nil";
    id v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = (__CFString **)v67;
    long long v27 = &v66;
    goto LABEL_16;
  }
  id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v20 = v19;
  if (!v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = [v13 sessionID];
      id v39 = (objc_class *)objc_opt_class();
      id v40 = NSStringFromClass(v39);
      v41 = NSStringFromSelector(a2);
      v42 = [v13 messageID];
      *(_DWORD *)buf = 138413058;
      v51 = v38;
      __int16 v52 = 2112;
      id v53 = v40;
      __int16 v54 = 2112;
      v55 = v41;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v42;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);
    }
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F5CFE8];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    v65 = @"conversation is nil";
    id v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = &v65;
    long long v27 = &v64;
LABEL_16:
    long long v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
    long long v29 = [v23 errorWithDomain:v24 code:7 userInfo:v28];
    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v29);

    goto LABEL_17;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    long long v30 = [v13 sessionID];
    __int16 v31 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v31);
    BOOL v32 = NSStringFromSelector(a2);
    uint64_t v33 = [v13 messageID];
    *(_DWORD *)buf = 138413826;
    v51 = v30;
    __int16 v52 = 2112;
    id v53 = v43;
    __int16 v54 = 2112;
    v55 = v32;
    __int16 v56 = 2112;
    uint64_t v57 = v33;
    __int16 v34 = (void *)v33;
    __int16 v58 = 2112;
    id v59 = v15;
    __int16 v60 = 2112;
    id v61 = v14;
    __int16 v62 = 2112;
    id v63 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation:%@,associatedGUID:%@,messsage:%@", buf, 0x48u);
  }
  id v21 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SMMessagingService_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E6B91818;
  block[4] = self;
  id v45 = v13;
  id v46 = v14;
  id v47 = v15;
  id v48 = v16;
  id v49 = v17;
  dispatch_async(v21, block);

LABEL_17:
}

void __93__SMMessagingService_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 sendMadridMessage:*(void *)(a1 + 40) associatedGUID:*(void *)(a1 + 48) toConversation:*(void *)(a1 + 56) summaryText:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!v22)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v73 = "-[SMMessagingService scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:"
            "summaryText:completion:]";
      __int16 v74 = 1024;
      LODWORD(v75) = 473;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v16)
  {
    long long v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      uint64_t v38 = (char *)objc_claimAutoreleasedReturnValue();
      id v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v73 = v38;
      __int16 v74 = 2112;
      v75 = v39;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);
    }
    long long v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F5CFE8];
    uint64_t v96 = *MEMORY[0x1E4F28568];
    v97[0] = @"message is nil";
    long long v30 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v31 = (__CFString **)v97;
    BOOL v32 = &v96;
    goto LABEL_24;
  }
  if (!v17)
  {
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v60 = [v16 sessionID];
      id v40 = (objc_class *)objc_opt_class();
      __int16 v56 = NSStringFromClass(v40);
      v41 = NSStringFromSelector(a2);
      uint64_t v42 = [v16 messageID];
      *(_DWORD *)buf = 138413058;
      v73 = v60;
      __int16 v74 = 2112;
      v75 = v56;
      __int16 v76 = 2112;
      v77 = v41;
      __int16 v78 = 2112;
      uint64_t v79 = v42;
      v43 = (void *)v42;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messageGUID is nil", buf, 0x2Au);
    }
    long long v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F5CFE8];
    uint64_t v94 = *MEMORY[0x1E4F28568];
    v95 = @"messageGUID is nil";
    long long v30 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v31 = &v95;
    BOOL v32 = &v94;
    goto LABEL_24;
  }
  if (!v20)
  {
    __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v62 = [v16 sessionID];
      id v46 = (objc_class *)objc_opt_class();
      __int16 v58 = NSStringFromClass(v46);
      id v47 = NSStringFromSelector(a2);
      uint64_t v48 = [v16 messageID];
      *(_DWORD *)buf = 138413058;
      v73 = v62;
      __int16 v74 = 2112;
      v75 = v58;
      __int16 v76 = 2112;
      v77 = v47;
      __int16 v78 = 2112;
      uint64_t v79 = v48;
      id v49 = (void *)v48;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);
    }
    long long v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F5CFE8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    v93 = @"conversation is nil";
    long long v30 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v31 = &v93;
    BOOL v32 = &v92;
    goto LABEL_24;
  }
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v25 = v24;
  if (!v19)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v63 = [v16 sessionID];
      __int16 v50 = (objc_class *)objc_opt_class();
      id v59 = NSStringFromClass(v50);
      v51 = NSStringFromSelector(a2);
      uint64_t v52 = [v16 messageID];
      *(_DWORD *)buf = 138413058;
      v73 = v63;
      __int16 v74 = 2112;
      v75 = v59;
      __int16 v76 = 2112;
      v77 = v51;
      __int16 v78 = 2112;
      uint64_t v79 = v52;
      id v53 = (void *)v52;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sendDate is nil", buf, 0x2Au);
    }
    long long v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F5CFE8];
    uint64_t v90 = *MEMORY[0x1E4F28568];
    v91 = @"sendDate is nil";
    long long v30 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v31 = &v91;
    BOOL v32 = &v90;
LABEL_24:
    id v35 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
    __int16 v36 = [v28 errorWithDomain:v29 code:7 userInfo:v35];
    (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v36);

    goto LABEL_25;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v57 = [v16 sessionID];
    __int16 v44 = (objc_class *)objc_opt_class();
    id v61 = NSStringFromClass(v44);
    v55 = NSStringFromSelector(a2);
    id v45 = [v16 messageID];
    __int16 v54 = [v19 stringFromDate];
    *(_DWORD *)buf = 138414338;
    v73 = v57;
    __int16 v74 = 2112;
    v75 = v61;
    __int16 v76 = 2112;
    v77 = v55;
    __int16 v78 = 2112;
    uint64_t v79 = (uint64_t)v45;
    __int16 v80 = 2112;
    id v81 = v17;
    __int16 v82 = 2112;
    v83 = v54;
    __int16 v84 = 2112;
    id v85 = v20;
    __int16 v86 = 2112;
    id v87 = v18;
    __int16 v88 = 2112;
    id v89 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messageGUID:%@,sendDate:%@,conversation:%@,associatedGUID:%@,message:%@", buf, 0x5Cu);
  }
  id v26 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__SMMessagingService_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E6B9A5A8;
  block[4] = self;
  id v65 = v16;
  id v66 = v17;
  id v67 = v18;
  id v68 = v19;
  id v69 = v20;
  id v70 = v21;
  id v71 = v22;
  dispatch_async(v26, block);

LABEL_25:
}

void __132__SMMessagingService_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 scheduleMadridMessageSendForMessage:*(void *)(a1 + 40) messageGUID:*(void *)(a1 + 48) associatedGUID:*(void *)(a1 + 56) sendDate:*(void *)(a1 + 64) toConversation:*(void *)(a1 + 72) summaryText:*(void *)(a1 + 80) completion:*(void *)(a1 + 88)];
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "-[SMMessagingService cancelMadridMessageSendForMessageGUID:toConversation:completion:]";
      __int16 v43 = 1024;
      LODWORD(v44) = 529;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (char *)objc_claimAutoreleasedReturnValue();
    id v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v42 = v15;
    __int16 v43 = 2112;
    __int16 v44 = v16;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,nil messageGUID", buf, 0x16u);
  }
  id v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = *MEMORY[0x1E4F5CFE8];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v52[0] = @"messageGUID is nil";
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  id v20 = [v17 errorWithDomain:v18 code:7 userInfo:v19];
  v11[2](v11, 0, v20);

  if (!v10)
  {
LABEL_11:
    id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v23;
      __int16 v43 = 2112;
      __int16 v44 = v24;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,nil conversation", buf, 0x16u);
    }
    id v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    __int16 v50 = @"conversation is nil";
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    long long v28 = [v25 errorWithDomain:v26 code:7 userInfo:v27];
    v11[2](v11, 0, v28);
  }
LABEL_14:
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    __int16 v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    id v35 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v36 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    __int16 v44 = v36;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messageGUID:%@,conversation:%@", buf, 0x2Au);
  }
  long long v30 = [(RTNotifier *)self queue];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __86__SMMessagingService_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  v37[3] = &unk_1E6B91490;
  v37[4] = self;
  id v38 = v9;
  id v39 = v10;
  id v40 = v11;
  __int16 v31 = v11;
  id v32 = v10;
  id v33 = v9;
  dispatch_async(v30, v37);
}

void __86__SMMessagingService_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) madridMessenger];
  [v2 cancelMadridMessageSendForMessageGUID:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)receivedSessionStartMessageSendResultWithMessage:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v15 = (SMSessionStartMessageSendResultNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v22) = 0;
    id v16 = "Invalid parameter not satisfying: message";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, &v15->super.super, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v15 = (SMSessionStartMessageSendResultNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v22) = 0;
    id v16 = "Invalid parameter not satisfying: guid";
    goto LABEL_11;
  }
  id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v11 sessionID];
    uint64_t v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = NSStringFromSelector(a2);
    id v21 = [v11 messageID];
    int v22 = 138414082;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v19;
    __int16 v26 = 2112;
    long long v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 1024;
    BOOL v33 = v7;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received session start message send result,guid,%@,success,%d,error,%@,message,%@", (uint8_t *)&v22, 0x4Eu);
  }
  id v15 = [[SMSessionStartMessageSendResultNotification alloc] initWithSessionStartMessage:v11 messageGUID:v12 success:v7 error:v13];
  [(RTNotifier *)self postNotification:v15];
LABEL_9:
}

- (void)receivedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v13 = (SMMessageReceivedNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v20) = 0;
    id v14 = "Invalid parameter not satisfying: message";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, &v13->super.super, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v13 = (SMMessageReceivedNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v20) = 0;
    id v14 = "Invalid parameter not satisfying: fromHandle";
    goto LABEL_11;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [v9 sessionID];
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    uint64_t v18 = NSStringFromSelector(a2);
    id v19 = [v9 messageID];
    int v20 = 138413826;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v18;
    __int16 v26 = 2112;
    long long v27 = v19;
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from handle %@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x44u);
  }
  id v13 = [[SMMessageReceivedNotification alloc] initWithMessage:v9 fromHandle:v11 fromMe:v5];
  [(RTNotifier *)self postNotification:v13];
LABEL_9:
}

- (void)deletedMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v5 sessionID];
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(a2);
      id v12 = [v5 messageID];
      int v13 = 138413314;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      int v20 = v12;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,deleted message,%@", (uint8_t *)&v13, 0x34u);
    }
    BOOL v7 = [[SMMessageDeletedNotification alloc] initWithMessage:v5];
    [(RTNotifier *)self postNotification:v7];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    BOOL v7 = (SMMessageDeletedNotification *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v7->super.super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", (uint8_t *)&v13, 2u);
    }
  }
}

+ (BOOL)isCellularActivated
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  __int16 v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = dispatch_get_global_queue(2, 0);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  BOOL v31 = __41__SMMessagingService_isCellularActivated__block_invoke;
  __int16 v32 = &unk_1E6B979A8;
  uint64_t v34 = &v35;
  id v5 = v3;
  id v33 = v5;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:v4 handler:&v29];

  BOOL v6 = v5;
  BOOL v7 = [MEMORY[0x1E4F1C9C8] now:v29, v30, v31, v32];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v6, v8)) {
    goto LABEL_6;
  }
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSinceDate:v7];
  double v11 = v10;
  id v12 = objc_opt_new();
  int v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_94];
  id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v15 = [v14 filteredArrayUsingPredicate:v13];
  id v16 = [v15 firstObject];

  [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  v44[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v44 count:1];
  int v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v19];

  if (v20)
  {
    id v21 = v20;
  }
  else
  {
LABEL_6:
    id v21 = 0;
  }

  id v22 = v21;
  if (v22)
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v40 = 2112;
      v41 = v28;
      __int16 v42 = 2112;
      id v43 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,sema error,%@", buf, 0x20u);
    }
  }
  BOOL v24 = *((unsigned char *)v36 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  return v24;
}

intptr_t __41__SMMessagingService_isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isStandalone
{
  id v2 = objc_alloc(MEMORY[0x1E4F99850]);
  dispatch_semaphore_t v3 = dispatch_get_global_queue(2, 0);
  id v4 = (void *)[v2 initWithQueue:v3];

  LOBYTE(v3) = [v4 isEffectivePairedDeviceNearby] ^ 1;
  return (char)v3;
}

+ (void)submitCAMetricForMessageType:(unint64_t)a3 scheduledSend:(BOOL)a4 cancelationAttempt:(BOOL)a5 attemptNumber:(int64_t)a6 wasFinalAttempt:(BOOL)a7 timeToSendMessage:(double)a8 sendError:(id)a9 success:(BOOL)a10 numReceivers:(unint64_t)a11
{
  BOOL v12 = a7;
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v33 = a9;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v19 = [NSNumber numberWithDouble:a8];
  [v18 setValue:v19 forKey:@"timeToSendMessage"];

  int v20 = [NSNumber numberWithInteger:a6];
  [v18 setValue:v20 forKey:@"attemptNumber"];

  id v21 = [NSNumber numberWithUnsignedInteger:[MEMORY[0x1E4F998D8] interfaceTypeFromMessageType:a3]];
  [v18 setValue:v21 forKey:@"interfaceType"];

  id v22 = [NSNumber numberWithBool:v15];
  [v18 setValue:v22 forKey:@"isScheduledSend"];

  uint64_t v23 = [NSNumber numberWithBool:v14];
  [v18 setValue:v23 forKey:@"isCancelationAttempt"];

  BOOL v24 = [NSNumber numberWithUnsignedInteger:a3];
  [v18 setValue:v24 forKey:@"messageType"];

  if (v33)
  {
    id v25 = NSString;
    __int16 v26 = [v33 domain];
    id v27 = [v25 stringWithFormat:@"%@:%d", v26, [v33 code]];
    [v18 setValue:v27 forKey:@"sendError"];
  }
  __int16 v28 = [NSNumber numberWithBool:v12];
  [v18 setValue:v28 forKey:@"wasFinalAttempt"];

  uint64_t v29 = [NSNumber numberWithBool:a10];
  [v18 setValue:v29 forKey:@"wasSuccessful"];

  uint64_t v30 = [NSNumber numberWithBool:[a1 isCellularActivated]];
  [v18 setValue:v30 forKey:@"isCellularActivated"];

  BOOL v31 = [NSNumber numberWithBool:[a1 isStandalone]];
  [v18 setValue:v31 forKey:@"isStandalone"];

  __int16 v32 = [NSNumber numberWithUnsignedInteger:a11];
  [v18 setValue:v32 forKey:@"numReceivers"];

  AnalyticsSendEvent();
}

- (SMIDSMessenger)idsMessenger
{
  return self->_idsMessenger;
}

- (void)setIdsMessenger:(id)a3
{
}

- (SMMadridMessenger)madridMessenger
{
  return self->_madridMessenger;
}

- (void)setMadridMessenger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madridMessenger, 0);

  objc_storeStrong((id *)&self->_idsMessenger, 0);
}

@end