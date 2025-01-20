@interface SMIDSMessenger
+ (int64_t)convertRTPlatformToIDSDeviceType:(id)a3;
- (IDSService)idsService;
- (IDSService)ownAccountIDSService;
- (NSMutableArray)idsMessagesWaitingForAck;
- (OS_dispatch_queue)queue;
- (SMIDSMessenger)initWithQueue:(id)a3;
- (SMMessagingServiceMessengerDelegate)delegate;
- (id)effectivePairedDevice;
- (id)myNearbyDestinationsFromDevices:(id)a3;
- (id)myNearbyDevices;
- (void)_cancelSubscriptionOnNearbyDevicesChanged;
- (void)_startSubscriptionOnNearbyDevicesChanged;
- (void)cancelSubscriptionOnNearbyDevicesChanged;
- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4;
- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 retryCount:(int64_t)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdsMessagesWaitingForAck:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setOwnAccountIDSService:(id)a3;
- (void)setQueue:(id)a3;
- (void)startSubscriptionOnNearbyDevicesChanged;
@end

@implementation SMIDSMessenger

- (SMIDSMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)SMIDSMessenger;
    v6 = [(SMIDSMessenger *)&v19 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      idsMessagesWaitingForAck = v7->_idsMessagesWaitingForAck;
      v7->_idsMessagesWaitingForAck = (NSMutableArray *)v8;

      id v10 = objc_alloc(MEMORY[0x1E4F6AB90]);
      uint64_t v11 = [v10 initWithService:*MEMORY[0x1E4F99A88]];
      idsService = v7->_idsService;
      v7->_idsService = (IDSService *)v11;

      [(IDSService *)v7->_idsService addDelegate:v7 queue:v7->_queue];
      id v13 = objc_alloc(MEMORY[0x1E4F6AB90]);
      uint64_t v14 = [v13 initWithService:*MEMORY[0x1E4F99AB0]];
      ownAccountIDSService = v7->_ownAccountIDSService;
      v7->_ownAccountIDSService = (IDSService *)v14;

      [v7->_ownAccountIDSService addDelegate:v7 queue:v7->_queue];
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)startSubscriptionOnNearbyDevicesChanged
{
  v3 = [(SMIDSMessenger *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SMIDSMessenger_startSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __57__SMIDSMessenger_startSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSubscriptionOnNearbyDevicesChanged];
}

- (void)_startSubscriptionOnNearbyDevicesChanged
{
}

- (void)cancelSubscriptionOnNearbyDevicesChanged
{
  v3 = [(SMIDSMessenger *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SMIDSMessenger_cancelSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __58__SMIDSMessenger_cancelSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSubscriptionOnNearbyDevicesChanged];
}

- (void)_cancelSubscriptionOnNearbyDevicesChanged
{
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
      __int16 v81 = 1024;
      LODWORD(v82) = 159;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
LABEL_3:
      if (v11) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
    __int16 v81 = 1024;
    LODWORD(v82) = 160;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
      __int16 v81 = 1024;
      LODWORD(v82) = 161;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  if (objc_msgSend(MEMORY[0x1E4F998D8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 2)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v53 = [v9 sessionID];
      v54 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v54);
      v56 = NSStringFromSelector(a2);
      v57 = [v9 messageID];
      int v58 = [(id)objc_opt_class() messageType];
      *(_DWORD *)buf = 138413314;
      v80 = v53;
      __int16 v81 = 2112;
      v82 = v55;
      __int16 v83 = 2112;
      v84 = v56;
      __int16 v85 = 2112;
      v86 = v57;
      __int16 v87 = 1024;
      LODWORD(v88) = v58;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", buf, 0x30u);
    }
    v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F5CFE8];
    uint64_t v94 = *MEMORY[0x1E4F28568];
    v95[0] = @"wrong spi used for sending message over IDS";
    v44 = (void *)MEMORY[0x1E4F1C9E8];
    v45 = (__CFString **)v95;
    v46 = &v94;
    goto LABEL_38;
  }
  v15 = [(SMIDSMessenger *)self idsService];

  if (!v15)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v59 = [v9 sessionID];
      v60 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v60);
      v62 = NSStringFromSelector(a2);
      v63 = [v9 messageID];
      *(_DWORD *)buf = 138413058;
      v80 = v59;
      __int16 v81 = 2112;
      v82 = v61;
      __int16 v83 = 2112;
      v84 = v62;
      __int16 v85 = 2112;
      v86 = v63;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);
    }
    v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F5CFE8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    v93 = @"IDSService unavailable";
    v44 = (void *)MEMORY[0x1E4F1C9E8];
    v45 = &v93;
    v46 = &v92;
LABEL_38:
    v18 = [v44 dictionaryWithObjects:v45 forKeys:v46 count:1];
    v48 = [v42 errorWithDomain:v43 code:5 userInfo:v18];
    v11[2](v11, 0, v48);

    goto LABEL_39;
  }
  aSelector = a2;
  v71 = self;
  v72 = v9;
  v16 = (void *)MEMORY[0x1E4F1CA80];
  v17 = [v10 receiverHandles];
  v18 = [v16 setWithCapacity:[v17 count]];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  objc_super v19 = [v10 receiverHandles];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v73 objects:v91 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v74 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1E4F99888];
        v26 = [v24 primaryHandle];
        uint64_t v27 = [v25 getSMHandleTypeWithHandle:v26];

        if (v27 == 2)
        {
          v28 = [v24 primaryHandle];
          uint64_t v29 = MEMORY[0x1E016C9A0]();
        }
        else
        {
          if (v27 != 1) {
            continue;
          }
          v28 = [v24 primaryHandle];
          uint64_t v29 = IDSCopyIDForPhoneNumber();
        }
        v30 = (void *)v29;
        [v18 addObject:v29];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v73 objects:v91 count:16];
    }
    while (v21);
  }

  uint64_t v31 = [v18 count];
  v32 = [v10 receiverHandles];
  uint64_t v33 = [v32 count];

  v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v35 = v34;
  if (v31 == v33)
  {
    id v9 = v72;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v36 = [v72 sessionID];
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      v39 = NSStringFromSelector(aSelector);
      v40 = [v72 messageID];
      *(_DWORD *)buf = 138413314;
      v80 = v36;
      __int16 v81 = 2112;
      v82 = v38;
      __int16 v83 = 2112;
      v84 = v39;
      __int16 v85 = 2112;
      v86 = v40;
      __int16 v87 = 2112;
      v88 = v18;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to handles,%@", buf, 0x34u);
    }
    [(SMIDSMessenger *)v71 sendMessage:v72 toDestinations:v18 completion:v11];
  }
  else
  {
    id v9 = v72;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v64 = [v72 sessionID];
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      v67 = NSStringFromSelector(aSelector);
      v68 = [v72 messageID];
      v69 = [v10 receiverPrimaryHandles];
      *(_DWORD *)buf = 138413570;
      v80 = v64;
      __int16 v81 = 2112;
      v82 = v66;
      __int16 v83 = 2112;
      v84 = v67;
      __int16 v85 = 2112;
      v86 = v68;
      __int16 v87 = 2112;
      v88 = v69;
      __int16 v89 = 2112;
      v90 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Invalid Handles %@,destinations %@", buf, 0x3Eu);
    }
    v49 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F5CFE8];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78 = @"Invalid Handle";
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    v52 = [v49 errorWithDomain:v50 code:7 userInfo:v51];
    v11[2](v11, 0, v52);
  }
LABEL_39:
}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v58 = 136315394;
    v59 = "-[SMIDSMessenger sendIDSMessageToMyDevices:completion:]";
    __int16 v60 = 1024;
    LODWORD(v61) = 220;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v58, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v58 = 136315394;
      v59 = "-[SMIDSMessenger sendIDSMessageToMyDevices:completion:]";
      __int16 v60 = 1024;
      LODWORD(v61) = 221;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v58, 0x12u);
    }
  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E4F998D8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v37 = [v7 sessionID];
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      v40 = NSStringFromSelector(a2);
      v41 = [v7 messageID];
      int v42 = [(id)objc_opt_class() messageType];
      int v58 = 138413314;
      v59 = v37;
      __int16 v60 = 2112;
      v61 = v39;
      __int16 v62 = 2112;
      v63 = v40;
      __int16 v64 = 2112;
      v65 = v41;
      __int16 v66 = 1024;
      LODWORD(v67) = v42;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", (uint8_t *)&v58, 0x30u);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v75[0] = @"wrong spi used for sending message over IDS";
    uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
    v28 = (__CFString **)v75;
    uint64_t v29 = &v74;
    goto LABEL_23;
  }
  v12 = [(SMIDSMessenger *)self ownAccountIDSService];

  if (!v12)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = [v7 sessionID];
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v46 = NSStringFromSelector(a2);
      v47 = [v7 messageID];
      int v58 = 138413058;
      v59 = v43;
      __int16 v60 = 2112;
      v61 = v45;
      __int16 v62 = 2112;
      v63 = v46;
      __int16 v64 = 2112;
      v65 = v47;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", (uint8_t *)&v58, 0x2Au);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    long long v73 = @"IDSService unavailable";
    uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
    v28 = &v73;
    uint64_t v29 = &v72;
LABEL_23:
    uint64_t v14 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    v15 = [v25 errorWithDomain:v26 code:5 userInfo:v14];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
    goto LABEL_31;
  }
  id v13 = [(SMIDSMessenger *)self ownAccountIDSService];
  uint64_t v14 = [v13 firstRoutableInternetDestinationForSelf];

  if (v14)
  {
    v15 = (void *)IDSCopyAddressDestinationForDestination();
    v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v7 sessionID];
        objc_super v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        uint64_t v21 = NSStringFromSelector(a2);
        uint64_t v22 = [v7 messageID];
        int v58 = 138413314;
        v59 = v18;
        __int16 v60 = 2112;
        v61 = v20;
        __int16 v62 = 2112;
        v63 = v21;
        __int16 v64 = 2112;
        v65 = v22;
        __int16 v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to my devices,%@", (uint8_t *)&v58, 0x34u);
      }
      v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
      [(SMIDSMessenger *)self sendMessage:v7 toDestinations:v23 completion:v9];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v53 = [v7 sessionID];
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        v56 = NSStringFromSelector(a2);
        v57 = [v7 messageID];
        int v58 = 138413058;
        v59 = v53;
        __int16 v60 = 2112;
        v61 = v55;
        __int16 v62 = 2112;
        v63 = v56;
        __int16 v64 = 2112;
        v65 = v57;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,null destination for self", (uint8_t *)&v58, 0x2Au);
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F5CFE8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v69 = @"null destination for self";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v36 = [v34 errorWithDomain:v35 code:7 userInfo:v23];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v36);

      v15 = 0;
    }
  }
  else
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v48 = [v7 sessionID];
      v49 = (objc_class *)objc_opt_class();
      uint64_t v50 = NSStringFromClass(v49);
      v51 = NSStringFromSelector(a2);
      v52 = [v7 messageID];
      int v58 = 138413058;
      v59 = v48;
      __int16 v60 = 2112;
      v61 = v50;
      __int16 v62 = 2112;
      v63 = v51;
      __int16 v64 = 2112;
      v65 = v52;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,null routable destination for self", (uint8_t *)&v58, 0x2Au);
    }
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v71 = @"null routable destination for self";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v23 = [v32 errorWithDomain:v33 code:7 userInfo:v15];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v23);
  }

LABEL_31:
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v58 = 136315394;
    v59 = "-[SMIDSMessenger sendIDSMessageToPairedDevice:completion:]";
    __int16 v60 = 1024;
    LODWORD(v61) = 275;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v58, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v58 = 136315394;
      v59 = "-[SMIDSMessenger sendIDSMessageToPairedDevice:completion:]";
      __int16 v60 = 1024;
      LODWORD(v61) = 276;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v58, 0x12u);
    }
  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E4F998D8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v42 = [v7 sessionID];
      uint64_t v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = NSStringFromSelector(a2);
      v46 = [v7 messageID];
      int v47 = [(id)objc_opt_class() messageType];
      int v58 = 138413314;
      v59 = v42;
      __int16 v60 = 2112;
      v61 = v44;
      __int16 v62 = 2112;
      v63 = v45;
      __int16 v64 = 2112;
      v65 = v46;
      __int16 v66 = 1024;
      LODWORD(v67) = v47;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", (uint8_t *)&v58, 0x30u);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v75[0] = @"wrong spi used for sending message over IDS";
    uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
    v28 = (__CFString **)v75;
    uint64_t v29 = &v74;
    goto LABEL_23;
  }
  v12 = [(SMIDSMessenger *)self ownAccountIDSService];

  if (!v12)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v48 = [v7 sessionID];
      v49 = (objc_class *)objc_opt_class();
      uint64_t v50 = NSStringFromClass(v49);
      v51 = NSStringFromSelector(a2);
      v52 = [v7 messageID];
      int v58 = 138413058;
      v59 = v48;
      __int16 v60 = 2112;
      v61 = v50;
      __int16 v62 = 2112;
      v63 = v51;
      __int16 v64 = 2112;
      v65 = v52;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", (uint8_t *)&v58, 0x2Au);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    long long v73 = @"IDSService unavailable";
    uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
    v28 = &v73;
    uint64_t v29 = &v72;
LABEL_23:
    uint64_t v14 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    v15 = [v25 errorWithDomain:v26 code:5 userInfo:v14];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
    goto LABEL_31;
  }
  id v13 = [(SMIDSMessenger *)self effectivePairedDevice];
  uint64_t v14 = v13;
  if (v13)
  {
    v15 = [v13 destination];
    v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v7 sessionID];
        objc_super v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        uint64_t v21 = NSStringFromSelector(a2);
        uint64_t v22 = [v7 messageID];
        int v58 = 138413314;
        v59 = v18;
        __int16 v60 = 2112;
        v61 = v20;
        __int16 v62 = 2112;
        v63 = v21;
        __int16 v64 = 2112;
        v65 = v22;
        __int16 v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to paired device,%@", (uint8_t *)&v58, 0x34u);
      }
      v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
      [(SMIDSMessenger *)self sendMessage:v7 toDestinations:v23 completion:v9];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v53 = [v7 sessionID];
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        v56 = NSStringFromSelector(a2);
        v57 = [v7 messageID];
        int v58 = 138413058;
        v59 = v53;
        __int16 v60 = 2112;
        v61 = v55;
        __int16 v62 = 2112;
        v63 = v56;
        __int16 v64 = 2112;
        v65 = v57;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,pairedDevice does not have a destination", (uint8_t *)&v58, 0x2Au);
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F5CFE8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v69 = @"pairedDevice does not have a destination";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v41 = [v39 errorWithDomain:v40 code:0 userInfo:v23];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v41);

      v15 = 0;
    }
  }
  else
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [v7 sessionID];
      uint64_t v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      uint64_t v35 = NSStringFromSelector(a2);
      v36 = [v7 messageID];
      int v58 = 138413058;
      v59 = v32;
      __int16 v60 = 2112;
      v61 = v34;
      __int16 v62 = 2112;
      v63 = v35;
      __int16 v64 = 2112;
      v65 = v36;
      _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,no effectivePairedDevice to send message", (uint8_t *)&v58, 0x2Au);
    }
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F5CFE8];
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v71 = @"No effectivePairedDevice to send message";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v23 = [v37 errorWithDomain:v38 code:5 userInfo:v15];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v23);
  }

LABEL_31:
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v68 = "-[SMIDSMessenger sendIDSMessageToMyNearbyDevices:completion:]";
    __int16 v69 = 1024;
    LODWORD(v70) = 329;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v68 = "-[SMIDSMessenger sendIDSMessageToMyNearbyDevices:completion:]";
      __int16 v69 = 1024;
      LODWORD(v70) = 330;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E4F998D8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = [v7 sessionID];
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v46 = NSStringFromSelector(a2);
      int v47 = [v7 messageID];
      int v48 = [(id)objc_opt_class() messageType];
      *(_DWORD *)buf = 138413314;
      uint64_t v68 = v43;
      __int16 v69 = 2112;
      uint64_t v70 = v45;
      __int16 v71 = 2112;
      uint64_t v72 = v46;
      __int16 v73 = 2112;
      uint64_t v74 = v47;
      __int16 v75 = 1024;
      int v76 = v48;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", buf, 0x30u);
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    __int16 v66 = @"wrong spi used for sending message over IDS";
    v28 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v29 = &v66;
    v30 = &v65;
    goto LABEL_28;
  }
  v12 = [(SMIDSMessenger *)self ownAccountIDSService];

  if (!v12)
  {
    v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v49 = [v7 sessionID];
      uint64_t v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      v52 = NSStringFromSelector(a2);
      v53 = [v7 messageID];
      *(_DWORD *)buf = 138413058;
      uint64_t v68 = v49;
      __int16 v69 = 2112;
      uint64_t v70 = v51;
      __int16 v71 = 2112;
      uint64_t v72 = v52;
      __int16 v73 = 2112;
      uint64_t v74 = v53;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    uint64_t v63 = *MEMORY[0x1E4F28568];
    __int16 v64 = @"IDSService unavailable";
    v28 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v29 = &v64;
    v30 = &v63;
LABEL_28:
    uint64_t v14 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];
    v15 = [v26 errorWithDomain:v27 code:5 userInfo:v14];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
    goto LABEL_29;
  }
  id v13 = [(SMIDSMessenger *)self myNearbyDevices];
  uint64_t v14 = v13;
  if (v13 && [v13 count])
  {
    v15 = [(SMIDSMessenger *)self myNearbyDestinationsFromDevices:v14];
    uint64_t v16 = [v15 count];
    v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v19 = [v7 sessionID];
        uint64_t v20 = (objc_class *)objc_opt_class();
        uint64_t v21 = NSStringFromClass(v20);
        uint64_t v22 = NSStringFromSelector(a2);
        v23 = [v7 messageID];
        *(_DWORD *)buf = 138413058;
        uint64_t v68 = v19;
        __int16 v69 = 2112;
        uint64_t v70 = v21;
        __int16 v71 = 2112;
        uint64_t v72 = v22;
        __int16 v73 = 2112;
        uint64_t v74 = v23;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to myNearbyDevices", buf, 0x2Au);
      }
      v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      [(SMIDSMessenger *)self sendMessage:v7 toDestinations:v24 completion:v9];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v54 = [v7 sessionID];
        v55 = (objc_class *)objc_opt_class();
        v56 = NSStringFromClass(v55);
        v57 = NSStringFromSelector(a2);
        int v58 = [v7 messageID];
        *(_DWORD *)buf = 138413058;
        uint64_t v68 = v54;
        __int16 v69 = 2112;
        uint64_t v70 = v56;
        __int16 v71 = 2112;
        uint64_t v72 = v57;
        __int16 v73 = 2112;
        uint64_t v74 = v58;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,myNearbyDevices do not have destinations", buf, 0x2Au);
      }
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F5CFE8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      __int16 v60 = @"myNearbyDevices do not have destinations";
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      int v42 = [v40 errorWithDomain:v41 code:0 userInfo:v24];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v42);
    }
  }
  else
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [v7 sessionID];
      uint64_t v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      uint64_t v35 = NSStringFromSelector(a2);
      v36 = [v7 messageID];
      *(_DWORD *)buf = 138413058;
      uint64_t v68 = v32;
      __int16 v69 = 2112;
      uint64_t v70 = v34;
      __int16 v71 = 2112;
      uint64_t v72 = v35;
      __int16 v73 = 2112;
      uint64_t v74 = v36;
      _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,no nearby devices of mine to send a message", buf, 0x2Au);
    }
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F5CFE8];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    __int16 v62 = @"No myNearbyDevices to send message";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v24 = [v37 errorWithDomain:v38 code:5 userInfo:v15];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v24);
  }

LABEL_29:
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
      __int16 v16 = 1024;
      int v17 = 385;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v14, 0x12u);
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
  v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
    __int16 v16 = 1024;
    int v17 = 386;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinations (in %s:%d)", (uint8_t *)&v14, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
      __int16 v16 = 1024;
      int v17 = 387;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
LABEL_14:
  [(SMIDSMessenger *)self sendMessage:v8 toDestinations:v9 retryCount:2 completion:v10];
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 retryCount:(int64_t)a5 completion:(id)a6
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
      __int16 v82 = 1024;
      LODWORD(v83) = 401;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if ((a5 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  int v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
    __int16 v82 = 1024;
    LODWORD(v83) = 402;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinations (in %s:%d)", buf, 0x12u);
  }

  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_4:
    if (v12) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_12:
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
    __int16 v82 = 1024;
    LODWORD(v83) = 403;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: retryCount >= 0 (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_15:
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
      __int16 v82 = 1024;
      LODWORD(v83) = 404;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_18:
  uint64_t v17 = [MEMORY[0x1E4F998D8] interfaceTypeFromMessageType:[objc_opt_class() messageType]];
  if (v17 == 3)
  {
    uint64_t v18 = [(SMIDSMessenger *)self ownAccountIDSService];

    if (!v18) {
      goto LABEL_27;
    }
  }
  else
  {
    objc_super v19 = [(SMIDSMessenger *)self idsService];
    if (!v19)
    {
LABEL_27:
      uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v53 = [v10 sessionID];
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        NSStringFromSelector(a2);
        v57 = v56 = v12;
        int v58 = [v10 messageID];
        *(_DWORD *)buf = 138413058;
        __int16 v81 = v53;
        __int16 v82 = 2112;
        __int16 v83 = v55;
        __int16 v84 = 2112;
        __int16 v85 = v57;
        __int16 v86 = 2112;
        __int16 v87 = v58;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);

        v12 = v56;
      }

      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F5CFE8];
      uint64_t v94 = *MEMORY[0x1E4F28568];
      v95[0] = @"IDSService unavailable";
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
      uint64_t v20 = [v34 errorWithDomain:v35 code:5 userInfo:v36];
      v12[2](v12, 0, v20);
      goto LABEL_44;
    }
  }
  int64_t v69 = a5;
  uint64_t v70 = v12;
  id v73 = v11;
  uint64_t v72 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v20 = [v10 outputToDictionary];
  uint64_t v92 = *MEMORY[0x1E4F6A998];
  uint64_t v93 = MEMORY[0x1E4F1CC38];
  __int16 v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v10 sessionID];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = NSStringFromSelector(a2);
    uint64_t v26 = [v10 messageID];
    *(_DWORD *)buf = 138413570;
    __int16 v81 = v22;
    __int16 v82 = 2112;
    __int16 v83 = v24;
    __int16 v84 = 2112;
    __int16 v85 = v25;
    __int16 v86 = 2112;
    __int16 v87 = v26;
    __int16 v88 = 2112;
    id v89 = v73;
    __int16 v90 = 2112;
    v91 = v20;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to %@,messageDict:%@", buf, 0x3Eu);
  }
  if (v17 == 3)
  {
    uint64_t v27 = [(SMIDSMessenger *)self ownAccountIDSService];
    v28 = v27;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v29 = (id *)&v79;
    v30 = (id *)&v78;
    uint64_t v31 = &v79;
    v32 = &v78;
  }
  else
  {
    uint64_t v27 = [(SMIDSMessenger *)self idsService];
    v28 = v27;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v29 = (id *)&v77;
    v30 = (id *)&v76;
    uint64_t v31 = &v77;
    v32 = &v76;
  }
  id v11 = v73;
  int v37 = [v27 sendMessage:v20 toDestinations:v73 priority:300 options:v75 identifier:v31 error:v32];
  id v38 = *v29;
  id v39 = *v30;

  uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v41 = v40;
  if (!v37 || v39)
  {
    id v74 = v38;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = [v10 sessionID];
      __int16 v60 = (objc_class *)objc_opt_class();
      uint64_t v61 = NSStringFromClass(v60);
      __int16 v62 = NSStringFromSelector(a2);
      uint64_t v63 = [v10 messageID];
      *(_DWORD *)buf = 138413314;
      __int16 v81 = v59;
      __int16 v82 = 2112;
      __int16 v83 = v61;
      __int16 v84 = 2112;
      __int16 v85 = v62;
      __int16 v86 = 2112;
      __int16 v87 = v63;
      __int16 v88 = 2112;
      id v89 = v39;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,send failed with error:%@", buf, 0x34u);
    }
    v12[2](v12, 0, v39);
    uint64_t v51 = [(id)objc_opt_class() messageType];
    v36 = v72;
    [v72 timeIntervalSinceNow];
    LOBYTE(v68) = 0;
    +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v51, 0, 0, 3 - v69, 1, v39, -v52, v68, [v11 count]);
    id v38 = v74;
  }
  else
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = [v10 sessionID];
      uint64_t v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = NSStringFromSelector(a2);
      [v10 messageID];
      v46 = self;
      v48 = id v47 = v38;
      *(_DWORD *)buf = 138413314;
      __int16 v81 = v42;
      __int16 v82 = 2112;
      __int16 v83 = v44;
      __int16 v84 = 2112;
      __int16 v85 = v45;
      __int16 v86 = 2112;
      __int16 v87 = v48;
      __int16 v88 = 2112;
      id v89 = v47;
      _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message sent to IDS with identifier,%@", buf, 0x34u);

      id v38 = v47;
      self = v46;

      id v11 = v73;
    }

    v12 = v70;
    v49 = [[SMIDSMessageWaitingForAck alloc] initWithIdentifier:v38 destinations:v11 message:v10 pendingRetryCount:v69 messageSentDate:v72 callback:v70];
    if (v49)
    {
      uint64_t v50 = [(SMIDSMessenger *)self idsMessagesWaitingForAck];
      [v50 addObject:v49];
    }
    else
    {
      uint64_t v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        __int16 v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        uint64_t v65 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v67 = id v66 = v38;
        *(_DWORD *)buf = 138412546;
        __int16 v81 = v65;
        __int16 v82 = 2112;
        __int16 v83 = v67;
        _os_log_fault_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMIDSMessageWaitingForAck", buf, 0x16u);

        id v38 = v66;
      }
    }
    v36 = v72;
  }
LABEL_44:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  id v13 = [(SMIDSMessenger *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_1E6B90F58;
  id v17 = v11;
  uint64_t v18 = self;
  BOOL v21 = a6;
  id v19 = v12;
  SEL v20 = a2;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(v13, block);
}

void __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v78 = 0;
    uint64_t v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = -1;
    uint64_t v72 = 0;
    id v73 = &v72;
    uint64_t v74 = 0x3032000000;
    __int16 v75 = __Block_byref_object_copy__5;
    uint64_t v76 = __Block_byref_object_dispose__5;
    id v77 = 0;
    v2 = [*(id *)(a1 + 40) idsMessagesWaitingForAck];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke_97;
    v68[3] = &unk_1E6B90F30;
    id v69 = *(id *)(a1 + 32);
    uint64_t v70 = &v78;
    __int16 v71 = &v72;
    [v2 enumerateObjectsUsingBlock:v68];

    if (v79[3] == -1)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
        v25 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        id v83 = v23;
        __int16 v84 = 2112;
        id v85 = v24;
        __int16 v86 = 2112;
        id v87 = v25;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message not found for identifier %@", buf, 0x20u);
      }
    }
    else
    {
      v3 = [*(id *)(a1 + 40) idsMessagesWaitingForAck];
      [v3 removeObjectAtIndex:v79[3]];

      if (*(unsigned char *)(a1 + 64))
      {
        v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = [(id)v73[5] message];
          v6 = [v5 sessionID];
          id v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          id v10 = [(id)v73[5] message];
          id v11 = [v10 messageID];
          *(_DWORD *)buf = 138413058;
          id v83 = v6;
          __int16 v84 = 2112;
          id v85 = v8;
          __int16 v86 = 2112;
          id v87 = v9;
          __int16 v88 = 2112;
          id v89 = v11;
          _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send succeeded", buf, 0x2Au);
        }
        id v12 = [(id)v73[5] callback];
        v12[2](v12, 1, 0);

        uint64_t v13 = [(id)v73[5] pendingRetryCount];
        id v14 = [(id)v73[5] message];
        uint64_t v15 = [(id)objc_opt_class() messageType];
        uint64_t v16 = [(id)v73[5] pendingRetryCount];
        id v17 = [(id)v73[5] messageSentDate];
        [v17 timeIntervalSinceNow];
        double v19 = v18;
        SEL v20 = [(id)v73[5] destinations];
        LOBYTE(v67) = 1;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v15, 0, 0, 3 - v13, v16 == 0, 0, -v19, v67, [v20 count]);
      }
      else if ([(id)v73[5] pendingRetryCount])
      {
        uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = [(id)v73[5] message];
          uint64_t v51 = [v50 sessionID];
          double v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          id v53 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v54 = (id)objc_claimAutoreleasedReturnValue();
          v55 = [(id)v73[5] message];
          v56 = [v55 messageID];
          int v57 = [(id)v73[5] pendingRetryCount];
          uint64_t v58 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413570;
          id v83 = v51;
          __int16 v84 = 2112;
          id v85 = v53;
          __int16 v86 = 2112;
          id v87 = v54;
          __int16 v88 = 2112;
          id v89 = v56;
          __int16 v90 = 1024;
          *(_DWORD *)v91 = v57;
          *(_WORD *)&v91[4] = 2112;
          *(void *)&v91[6] = v58;
          _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed with %d retries left with error %@", buf, 0x3Au);
        }
        uint64_t v27 = *(void **)(a1 + 40);
        v28 = [(id)v73[5] message];
        uint64_t v29 = [(id)v73[5] destinations];
        uint64_t v30 = [(id)v73[5] pendingRetryCount];
        uint64_t v31 = [(id)v73[5] callback];
        [v27 sendMessage:v28 toDestinations:v29 retryCount:v30 - 1 completion:v31];

        id v14 = [(id)v73[5] message];
        uint64_t v32 = [(id)objc_opt_class() messageType];
        uint64_t v33 = [(id)v73[5] pendingRetryCount];
        v34 = [(id)v73[5] messageSentDate];
        [v34 timeIntervalSinceNow];
        double v36 = v35;
        uint64_t v37 = *(void *)(a1 + 48);
        id v38 = [(id)v73[5] destinations];
        LOBYTE(v67) = 0;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v32, 0, 0, 3 - v33, 0, v37, -v36, v67, [v38 count]);
      }
      else
      {
        id v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v59 = [(id)v73[5] message];
          __int16 v60 = [v59 sessionID];
          uint64_t v61 = (objc_class *)objc_opt_class();
          NSStringFromClass(v61);
          id v62 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v63 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v64 = [(id)v73[5] message];
          uint64_t v65 = [v64 messageID];
          uint64_t v66 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413314;
          id v83 = v60;
          __int16 v84 = 2112;
          id v85 = v62;
          __int16 v86 = 2112;
          id v87 = v63;
          __int16 v88 = 2112;
          id v89 = v65;
          __int16 v90 = 2112;
          *(void *)v91 = v66;
          _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed on last retry with error %@", buf, 0x34u);
        }
        uint64_t v40 = [(id)v73[5] callback];
        v40[2](v40, 0, *(void *)(a1 + 48));

        id v14 = [(id)v73[5] message];
        uint64_t v41 = [(id)objc_opt_class() messageType];
        int v42 = [(id)v73[5] messageSentDate];
        [v42 timeIntervalSinceNow];
        double v44 = v43;
        uint64_t v45 = *(void *)(a1 + 48);
        v46 = [(id)v73[5] destinations];
        LOBYTE(v67) = 0;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v41, 0, 0, 3, 1, v45, -v44, v67, [v46 count]);
      }
    }

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v78, 8);
  }
  else
  {
    BOOL v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v47 = (objc_class *)objc_opt_class();
      int v48 = NSStringFromClass(v47);
      v49 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v83 = v48;
      __int16 v84 = 2112;
      id v85 = v49;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,nil identifier", buf, 0x16u);
    }
  }
}

void __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke_97(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = [v10 identifier];
  int v9 = [v8 isEqualToString:a1[4]];

  if (v9)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v13)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    double v18 = "Invalid parameter not satisfying: messageDict";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_7;
  }
  if (!v14)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    double v18 = "Invalid parameter not satisfying: fromID";
    goto LABEL_10;
  }
  uint64_t v16 = [(SMIDSMessenger *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SMIDSMessenger_service_account_incomingMessage_fromID___block_invoke;
  block[3] = &unk_1E6B90F80;
  void block[4] = self;
  id v20 = v15;
  id v21 = v13;
  id v22 = v11;
  SEL v23 = a2;
  dispatch_async(v16, block);

LABEL_8:
}

void __57__SMIDSMessenger_service_account_incomingMessage_fromID___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) idsService];
  v3 = [v2 deviceForFromID:*(void *)(a1 + 40)];

  v4 = (void *)IDSCopyRawAddressForDestination();
  uint64_t v5 = [MEMORY[0x1E4F998D8] messageTypeFromDict:*(void *)(a1 + 48)];
  uint64_t v6 = [MEMORY[0x1E4F998D8] interfaceTypeFromMessageType:v5];
  if (v3)
  {
    if (v6 != 3) {
      goto LABEL_11;
    }
    id v7 = [*(id *)(a1 + 56) serviceIdentifier];
    id v8 = v7;
    int v9 = (void *)MEMORY[0x1E4F99AB0];
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_11;
    }
    id v7 = [*(id *)(a1 + 56) serviceIdentifier];
    id v8 = v7;
    int v9 = (void *)MEMORY[0x1E4F99A88];
  }
  char v10 = [v7 isEqualToString:*v9];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F998D8] createMessageFromDict:*(void *)(a1 + 48)];
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F99888]);
      id v13 = [v12 initWithPrimaryHandle:v4 secondaryHandles:MEMORY[0x1E4F1CBF0]];
      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v11 sessionID];
        uint64_t v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        double v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
        double v19 = [v11 messageID];
        *(_DWORD *)buf = 138413826;
        uint64_t v30 = v15;
        __int16 v31 = 2112;
        uint64_t v32 = v17;
        __int16 v33 = 2112;
        *(void *)v34 = v18;
        *(_WORD *)&v34[8] = 2112;
        double v35 = v19;
        __int16 v36 = 2112;
        uint64_t v37 = v4;
        __int16 v38 = 1024;
        BOOL v39 = v3 != 0;
        __int16 v40 = 2112;
        uint64_t v41 = v11;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from %@,fromMe,%d,message,%@", buf, 0x44u);
      }
      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 receivedMessage:v11 fromHandle:v13 fromMe:v3 != 0];
    }
    else
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 64));
        v28 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        uint64_t v30 = v26;
        __int16 v31 = 2112;
        uint64_t v32 = v27;
        __int16 v33 = 2112;
        *(void *)v34 = v4;
        *(_WORD *)&v34[8] = 2112;
        double v35 = v28;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received message from %@ could not be converted to SMMessage,messageDict,%@", buf, 0x2Au);
      }
    }

    goto LABEL_16;
  }
LABEL_11:
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v21 = v3 != 0;
    id v22 = (objc_class *)objc_opt_class();
    SEL v23 = NSStringFromClass(v22);
    v24 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138413058;
    uint64_t v30 = v23;
    __int16 v31 = 2112;
    uint64_t v32 = v24;
    __int16 v33 = 1024;
    *(_DWORD *)v34 = v5;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v21;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received unexpected message type %d when fromMe:%d", buf, 0x22u);
  }
LABEL_16:
}

- (id)effectivePairedDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SMIDSMessenger *)self ownAccountIDSService];
  v3 = [v2 devices];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice] && objc_msgSend(v7, "relationship") == 1)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

+ (int64_t)convertRTPlatformToIDSDeviceType:(id)a3
{
  id v3 = a3;
  if [v3 iPhoneDevice] && (objc_msgSend(v3, "iPhonePlatform"))
  {
    int64_t v4 = 2;
  }
  else if ([v3 watchPlatform])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = [v3 macOSPlatform];
  }

  return v4;
}

- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v9 = [(SMIDSMessenger *)self idsService];
  long long v10 = [v9 accounts];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    uint64_t v34 = *(void *)v41;
    id v35 = v8;
    uint64_t v32 = self;
    aSelector = a2;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v16 = [v15 vettedAliases:v32];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v37;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v37 != v19) {
                objc_enumerationMutation(v16);
              }
              BOOL v21 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              uint64_t v22 = [v7 objectForKey:v21];
              if (v22)
              {
                v24 = (void *)v22;
                v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v26 = (objc_class *)objc_opt_class();
                  uint64_t v27 = NSStringFromClass(v26);
                  v28 = NSStringFromSelector(aSelector);
                  *(_DWORD *)buf = 138413058;
                  uint64_t v45 = v27;
                  __int16 v46 = 2112;
                  id v47 = v28;
                  __int16 v48 = 2112;
                  id v49 = v21;
                  __int16 v50 = 2112;
                  uint64_t v51 = v24;
                  _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,found handle %@ in dict with object %@", buf, 0x2Au);
                }
                id v8 = v35;
                (*((void (**)(id, void *, void *))v35 + 2))(v35, v21, v24);

                goto LABEL_22;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v52 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = v34;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
      id v8 = v35;
      a2 = aSelector;
    }
    while (v12);
  }

  SEL v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = (objc_class *)objc_opt_class();
    uint64_t v30 = NSStringFromClass(v29);
    __int16 v31 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = v30;
    __int16 v46 = 2112;
    id v47 = v31;
    __int16 v48 = 2112;
    id v49 = v7;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,did not find handle for this account in dict %@", buf, 0x20u);
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
LABEL_22:
}

- (id)myNearbyDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v4 = [(SMIDSMessenger *)self ownAccountIDSService];
  uint64_t v5 = [v4 devices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 relationship] == 1 && objc_msgSend(v10, "isNearby")) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)myNearbyDestinationsFromDevices:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v7 = 138412802;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v12 = [v11 destination:v19];
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          long long v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            long long v14 = (objc_class *)objc_opt_class();
            long long v15 = NSStringFromClass(v14);
            uint64_t v16 = NSStringFromSelector(a2);
            uint64_t v17 = [v11 description];
            *(_DWORD *)buf = v19;
            uint64_t v26 = v15;
            __int16 v27 = 2112;
            v28 = v16;
            __int16 v29 = 2112;
            uint64_t v30 = v17;
            _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,my nearby device missing destination,device: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v7 = [(SMIDSMessenger *)self effectivePairedDevice];
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    long long v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    int v14 = 138413058;
    long long v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    long long v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,effectivePairedDevice %@, devices %@", (uint8_t *)&v14, 0x2Au);
  }
  if (v7)
  {
    long long v12 = [[SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification alloc] initWithIDSDevice:v7];
    long long v13 = [(SMIDSMessenger *)self delegate];
    [v13 postNotification:v12];
  }
}

- (SMMessagingServiceMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SMMessagingServiceMessengerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)ownAccountIDSService
{
  return self->_ownAccountIDSService;
}

- (void)setOwnAccountIDSService:(id)a3
{
}

- (NSMutableArray)idsMessagesWaitingForAck
{
  return self->_idsMessagesWaitingForAck;
}

- (void)setIdsMessagesWaitingForAck:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsMessagesWaitingForAck, 0);
  objc_storeStrong((id *)&self->_ownAccountIDSService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end