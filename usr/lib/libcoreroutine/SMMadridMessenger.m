@interface SMMadridMessenger
- (NSMutableArray)madridMessagesWaitingForAck;
- (NSMutableArray)resultsWaitingForProcessing;
- (OS_dispatch_queue)queue;
- (SMMadridMessenger)initWithQueue:(id)a3;
- (SMMessagingServiceMessengerDelegate)delegate;
- (id)createMSMessage:(id)a3 summaryText:(id)a4;
- (id)getIMPluginPayloadFromMSMessage:(id)a3;
- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 retryCount:(int64_t)a5 completion:(id)a6;
- (void)iMessageDeletedFor:(id)a3;
- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5;
- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)processSessionStartMessageSendResultWithMessageUrl:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9;
- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setMadridMessagesWaitingForAck:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultsWaitingForProcessing:(id)a3;
@end

@implementation SMMadridMessenger

- (SMMadridMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)SMMadridMessenger;
    v6 = [(SMMadridMessenger *)&v15 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      madridMessagesWaitingForAck = v7->_madridMessagesWaitingForAck;
      v7->_madridMessagesWaitingForAck = (NSMutableArray *)v8;

      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      resultsWaitingForProcessing = v7->_resultsWaitingForProcessing;
      v7->_resultsWaitingForProcessing = (NSMutableArray *)v10;
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v41 = a4;
  id v14 = a5;
  id v42 = a6;
  id v15 = a7;
  if (v15)
  {
    if (v13)
    {
      if (v14
        && ([v14 receiverHandles],
            v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = [v16 count],
            v16,
            v17))
      {
        *(void *)buf = 0;
        v58 = buf;
        uint64_t v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__16;
        v61 = __Block_byref_object_dispose__16;
        id v62 = 0;
        v18 = dispatch_group_create();
        dispatch_group_enter(v18);
        v19 = [v14 identifier];
        v20 = [(SMMadridMessenger *)self queue];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
        v51[3] = &unk_1E6B91F10;
        v55 = buf;
        id v21 = v13;
        id v52 = v21;
        v53 = self;
        SEL v56 = a2;
        dispatch_group_t group = v18;
        dispatch_group_t v54 = group;
        +[SMMessagingUtilities queryChatWithGroupID:v19 queue:v20 handler:v51];

        v22 = [(SMMadridMessenger *)self createMSMessage:v21 summaryText:v42];
        if (v22)
        {
          v23 = [(SMMadridMessenger *)self queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_127;
          block[3] = &unk_1E6B91F60;
          block[4] = self;
          id v44 = v22;
          id v45 = v21;
          v49 = buf;
          SEL v50 = a2;
          id v46 = v14;
          id v47 = v41;
          id v48 = v15;
          dispatch_group_notify(group, v23, block);
        }
        else
        {
          v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v35 = [v21 sessionID];
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v38 = (id)objc_claimAutoreleasedReturnValue();
            v39 = [v21 messageID];
            *(_DWORD *)v65 = 138413058;
            v66 = v35;
            __int16 v67 = 2112;
            id v68 = v37;
            __int16 v69 = 2112;
            id v70 = v38;
            __int16 v71 = 2112;
            v72 = v39;
            _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to create MSMessage", v65, 0x2Au);
          }
          v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v63 = *MEMORY[0x1E4F28568];
          v64 = @"MSMessage creation failed";
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          v34 = [v32 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v33];
          (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v34);
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v74 = @"nil conversation";
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v26];
        (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v27);
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v76[0] = @"nil message";
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
      v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v29];
      (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v30);
    }
  }
  else
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 guid];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [*(id *)(a1 + 32) sessionID];
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = [*(id *)(a1 + 32) messageID];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v13 = 138413314;
      id v14 = v7;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,found chatGUID,%@", (uint8_t *)&v13, 0x34u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_127(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [*(id *)(a1 + 32) getIMPluginPayloadFromMSMessage:*(void *)(a1 + 40)];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [*(id *)(a1 + 48) sessionID];
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
    v11 = [*(id *)(a1 + 48) messageID];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v57 = v7;
    __int16 v58 = 2112;
    uint64_t v59 = v9;
    __int16 v60 = 2112;
    v61 = v10;
    __int16 v62 = 2112;
    uint64_t v63 = v11;
    __int16 v64 = 2112;
    uint64_t v65 = v12;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to chatGUID,%@", buf, 0x34u);
  }
  int v13 = [v4 data];
  id v14 = [*(id *)(a1 + 56) receiverPrimaryHandles];
  id v53 = *(id *)(a1 + 48);
  id v15 = v3;
  char v16 = IMSPISendMSMessagePayloadWithSummaryTextReturningGUID();

  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [*(id *)(a1 + 48) sessionID];
      v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v23 = [*(id *)(a1 + 48) messageID];
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v24 = *(void *)(a1 + 64);
      uint64_t v26 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      v57 = v19;
      __int16 v58 = 2112;
      uint64_t v59 = v21;
      __int16 v60 = 2112;
      v61 = v22;
      __int16 v62 = 2112;
      uint64_t v63 = v23;
      __int16 v64 = 2112;
      uint64_t v65 = v25;
      __int16 v66 = 2112;
      uint64_t v67 = v24;
      __int16 v68 = 2112;
      uint64_t v69 = v26;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages accepted message to conversation %@,associatedGUID,%@,message,%@", buf, 0x48u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    v27 = [SMMadridMessageWaitingForAck alloc];
    v28 = [*(id *)(a1 + 48) messageID];
    v29 = [v28 UUIDString];
    uint64_t v30 = [(id)objc_opt_class() messageType];
    uint64_t v31 = *(void *)(a1 + 56);
    v32 = (void *)MEMORY[0x1E016DB00](*(void *)(a1 + 72));
    v33 = [(SMMadridMessageWaitingForAck *)v27 initWithIdentifier:v29 messageType:v30 messageSentDate:v5 pendingRetryCount:0 conversation:v31 callback:v32];

    if (v33)
    {
      v34 = [*(id *)(a1 + 32) madridMessagesWaitingForAck];
      [v34 addObject:v33];
    }
    else
    {
      v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        SEL v50 = NSStringFromClass(v49);
        v51 = NSStringFromSelector(*(SEL *)(a1 + 88));
        *(_DWORD *)buf = 138412546;
        v57 = v50;
        __int16 v58 = 2112;
        uint64_t v59 = v51;
        _os_log_fault_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);
      }
      v33 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v41 = [*(id *)(a1 + 48) sessionID];
      id v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      id v44 = NSStringFromSelector(*(SEL *)(a1 + 88));
      id v45 = [*(id *)(a1 + 48) messageID];
      uint64_t v47 = *(void *)(a1 + 56);
      uint64_t v46 = *(void *)(a1 + 64);
      uint64_t v48 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      v57 = v41;
      __int16 v58 = 2112;
      uint64_t v59 = v43;
      __int16 v60 = 2112;
      v61 = v44;
      __int16 v62 = 2112;
      uint64_t v63 = v45;
      __int16 v64 = 2112;
      uint64_t v65 = v47;
      __int16 v66 = 2112;
      uint64_t v67 = v46;
      __int16 v68 = 2112;
      uint64_t v69 = v48;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages rejected message to conversation,%@,associatedGUID,%@,message,%@", buf, 0x48u);
    }
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F5CFE8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55 = @"Messages rejected message";
    id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    v33 = [v35 errorWithDomain:v36 code:0 userInfo:v37];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    uint64_t v38 = [(id)objc_opt_class() messageType];
    [v5 timeIntervalSinceNow];
    double v40 = -v39;
    v34 = [*(id *)(a1 + 56) receiverHandles];
    LOBYTE(v52) = 0;
    +[SMMessagingService submitCAMetricForMessageType:v38 scheduledSend:0 cancelationAttempt:0 attemptNumber:1 wasFinalAttempt:1 timeToSendMessage:v33 sendError:v40 success:v52 numReceivers:[v34 count]];
  }
}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_129(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v6 = [*(id *)(a1 + 32) sessionID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = [*(id *)(a1 + 32) messageID];
    int v11 = 138413058;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    char v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages GUID is nil", (uint8_t *)&v11, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) sessionID];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = [*(id *)(a1 + 32) messageID];
    int v11 = 138413314;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    char v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received GUID:%@", (uint8_t *)&v11, 0x34u);
LABEL_4:
  }
LABEL_6:
}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  uint64_t v23 = (void (**)(void, void, void, void))v22;
  if (!v16)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: message";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_22;
  }
  if (!v17)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_18;
  }
  if (!v19)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: sendDate";
    goto LABEL_18;
  }
  if (!v20)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: conversation";
    goto LABEL_18;
  }
  if (!v22)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Invalid parameter not satisfying: completion";
    goto LABEL_18;
  }
  double v40 = [(SMMadridMessenger *)self createMSMessage:v16 summaryText:v21];
  if (v40)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v59 = __Block_byref_object_copy__16;
    *(void *)&long long v60 = __Block_byref_object_dispose__16;
    *((void *)&v60 + 1) = 0;
    v35 = dispatch_group_create();
    dispatch_group_enter(v35);
    id v37 = [v20 identifier];
    uint64_t v24 = [(SMMadridMessenger *)self queue];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
    v52[3] = &unk_1E6B91F10;
    SEL v56 = buf;
    id v34 = v16;
    id v53 = v34;
    uint64_t v54 = self;
    SEL v57 = a2;
    uint64_t v36 = v35;
    v55 = v36;
    +[SMMessagingUtilities queryChatWithGroupID:v37 queue:v24 handler:v52];

    uint64_t v38 = [(SMMadridMessenger *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_137;
    block[3] = &unk_1E6B91F88;
    block[4] = self;
    uint64_t v25 = v40;
    v43 = v25;
    id v44 = v34;
    SEL v50 = buf;
    SEL v51 = a2;
    id v45 = v20;
    id v46 = v19;
    id v47 = v17;
    id v48 = v18;
    v49 = v23;
    dispatch_group_notify(v36, v38, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v41 = [v16 sessionID];
      uint64_t v31 = (objc_class *)objc_opt_class();
      double v39 = NSStringFromClass(v31);
      NSStringFromSelector(a2);
      v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v33 = [v16 messageID];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v59 = v32;
      LOWORD(v60) = 2112;
      *(void *)((char *)&v60 + 2) = v33;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to create MSMessage", buf, 0x2Au);
    }
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v62[0] = @"MSMessage creation failed";
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    uint64_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v29];
    ((void (**)(void, void, void, void *))v23)[2](v23, 0, 0, v30);

    uint64_t v25 = 0;
  }
LABEL_22:
}

void __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 guid];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) sessionID];
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v11 = [*(id *)(a1 + 32) messageID];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v13 = 138413314;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,found chatGUID,%@", (uint8_t *)&v13, 0x34u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_137(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) getIMPluginPayloadFromMSMessage:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 48) sessionID];
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 104));
    v9 = [*(id *)(a1 + 48) messageID];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    __int16 v58 = v5;
    __int16 v59 = 2112;
    long long v60 = v7;
    __int16 v61 = 2112;
    __int16 v62 = v8;
    __int16 v63 = 2112;
    __int16 v64 = v9;
    __int16 v65 = 2112;
    uint64_t v66 = v10;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to chatGUID,%@", buf, 0x34u);
  }
  int v11 = [v2 data];
  uint64_t v12 = [*(id *)(a1 + 56) receiverPrimaryHandles];
  char v13 = IMSPIScheduleSendMSMessagePayloadWithSummaryTextAndGUID();

  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  __int16 v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [*(id *)(a1 + 48) sessionID];
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      __int16 v19 = NSStringFromSelector(*(SEL *)(a1 + 104));
      id v20 = [*(id *)(a1 + 48) messageID];
      uint64_t v53 = *(void *)(a1 + 80);
      __int16 v21 = v2;
      uint64_t v22 = v3;
      uint64_t v23 = *(void *)(a1 + 56);
      uint64_t v24 = [*(id *)(a1 + 64) stringFromDate];
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138414082;
      __int16 v58 = v16;
      __int16 v59 = 2112;
      long long v60 = v18;
      __int16 v61 = 2112;
      __int16 v62 = v19;
      __int16 v63 = 2112;
      __int16 v64 = v20;
      __int16 v65 = 2112;
      uint64_t v66 = v23;
      uint64_t v3 = v22;
      v2 = v21;
      __int16 v67 = 2112;
      uint64_t v68 = v53;
      __int16 v69 = 2112;
      uint64_t v70 = v24;
      __int16 v71 = 2112;
      uint64_t v72 = v25;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages accepted message to conversation %@,associatedGUID,%@,sendDate,%@,message,%@", buf, 0x52u);
    }
    uint64_t v26 = [SMMadridMessageWaitingForAck alloc];
    v27 = [*(id *)(a1 + 48) messageID];
    v28 = [v27 UUIDString];
    uint64_t v29 = [(id)objc_opt_class() messageType];
    uint64_t v31 = *(void *)(a1 + 56);
    uint64_t v30 = *(void *)(a1 + 64);
    v32 = (void *)MEMORY[0x1E016DB00](*(void *)(a1 + 88));
    v33 = [(SMMadridMessageWaitingForAck *)v26 initWithIdentifier:v28 messageType:v29 messageSentDate:v30 pendingRetryCount:0 conversation:v31 callback:v32];

    if (v33)
    {
      id v34 = [*(id *)(a1 + 32) madridMessagesWaitingForAck];
      [v34 addObject:v33];
    }
    else
    {
      id v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        SEL v50 = NSStringFromClass(v49);
        SEL v51 = NSStringFromSelector(*(SEL *)(a1 + 104));
        *(_DWORD *)buf = 138412546;
        __int16 v58 = v50;
        __int16 v59 = 2112;
        long long v60 = v51;
        _os_log_fault_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);
      }
      v33 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v41 = [*(id *)(a1 + 48) sessionID];
      id v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      id v44 = NSStringFromSelector(*(SEL *)(a1 + 104));
      id v45 = [*(id *)(a1 + 48) messageID];
      uint64_t v54 = *(void *)(a1 + 80);
      uint64_t v46 = *(void *)(a1 + 56);
      id v47 = [*(id *)(a1 + 64) stringFromDate];
      uint64_t v48 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138414082;
      __int16 v58 = v41;
      __int16 v59 = 2112;
      long long v60 = v43;
      __int16 v61 = 2112;
      __int16 v62 = v44;
      __int16 v63 = 2112;
      __int16 v64 = v45;
      __int16 v65 = 2112;
      uint64_t v66 = v46;
      __int16 v67 = 2112;
      uint64_t v68 = v54;
      __int16 v69 = 2112;
      uint64_t v70 = v47;
      __int16 v71 = 2112;
      uint64_t v72 = v48;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages rejected message to conversation %@,associatedGUID,%@,sendDate,%@,message,%@", buf, 0x52u);
    }
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F5CFE8];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    SEL v56 = @"Messages rejected message";
    id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v33 = [v35 errorWithDomain:v36 code:0 userInfo:v37];

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    uint64_t v38 = [(id)objc_opt_class() messageType];
    [v3 timeIntervalSinceNow];
    double v40 = -v39;
    id v34 = [*(id *)(a1 + 56) receiverHandles];
    LOBYTE(v52) = 0;
    +[SMMessagingService submitCAMetricForMessageType:v38 scheduledSend:1 cancelationAttempt:0 attemptNumber:1 wasFinalAttempt:1 timeToSendMessage:v33 sendError:v40 success:v52 numReceivers:[v34 count]];
  }
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (!v8)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v17 = 0;
    char v13 = "Invalid parameter not satisfying: messageGUID";
    uint64_t v14 = (uint8_t *)&v17;
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v16 = 0;
    char v13 = "Invalid parameter not satisfying: conversation";
    uint64_t v14 = (uint8_t *)&v16;
    goto LABEL_11;
  }
  if (!v10)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = 0;
      char v13 = "Invalid parameter not satisfying: completion";
      uint64_t v14 = (uint8_t *)&v15;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  [(SMMadridMessenger *)self cancelMadridMessageSendForMessageGUID:v8 toConversation:v9 retryCount:2 completion:v10];
LABEL_13:
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 retryCount:(int64_t)a5 completion:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void (**)(void, void, void))v13;
  if (!v11)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: messageGUID";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v33, buf, 2u);
    goto LABEL_28;
  }
  if (!v12)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: conversation";
    goto LABEL_21;
  }
  if (!v13)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: completion";
    goto LABEL_21;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      SEL v51 = v17;
      __int16 v52 = 2112;
      uint64_t v53 = v18;
      __int16 v54 = 2112;
      id v55 = v11;
      __int16 v56 = 2112;
      id v57 = v12;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,canceling scheduled send for %@ to conversation %@", buf, 0x2Au);
    }
    __int16 v19 = [MEMORY[0x1E4F1C9C8] date];
    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v21 = [v12 receiverPrimaryHandles];
    uint64_t v22 = [v20 setWithArray:v21];

    char v23 = IMSPICancelScheduledMessageWithGUIDAndDestinations();
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v25 = v24;
    if ((v23 & 1) == 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v40 = (objc_class *)objc_opt_class();
        id v41 = NSStringFromClass(v40);
        id v42 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        SEL v51 = v41;
        __int16 v52 = 2112;
        uint64_t v53 = v42;
        __int16 v54 = 2112;
        id v55 = v11;
        __int16 v56 = 2112;
        id v57 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Messages rejected cancel request for %@ to handles %@", buf, 0x2Au);
      }
      id v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F5CFE8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49 = @"Messages rejected cancel request";
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v31 = [v34 errorWithDomain:v35 code:0 userInfo:v36];

      ((void (**)(void, void, SMMadridMessageWaitingForAck *))v14)[2](v14, 0, v31);
      [v19 timeIntervalSinceNow];
      double v38 = -v37;
      double v39 = [v12 receiverHandles];
      LOBYTE(v46) = 0;
      +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 1, 1, v31, v38, v46, [v39 count]);

      goto LABEL_27;
    }
    id v47 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      SEL v51 = v27;
      __int16 v52 = 2112;
      uint64_t v53 = v28;
      __int16 v54 = 2112;
      id v55 = v11;
      __int16 v56 = 2112;
      id v57 = v47;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,Messages accepted cancel request for %@ to handles %@", buf, 0x2Au);
    }
    uint64_t v29 = [SMMadridMessageWaitingForAck alloc];
    uint64_t v30 = (void *)MEMORY[0x1E016DB00](v14);
    uint64_t v31 = [(SMMadridMessageWaitingForAck *)v29 initWithIdentifier:v11 messageType:3 messageSentDate:v19 pendingRetryCount:a5 conversation:v12 callback:v30];

    if (v31)
    {
      v32 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
      [v32 addObject:v31];
    }
    else
    {
      v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      uint64_t v22 = v47;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        goto LABEL_26;
      }
      v43 = (objc_class *)objc_opt_class();
      id v44 = NSStringFromClass(v43);
      id v45 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      SEL v51 = v44;
      __int16 v52 = 2112;
      uint64_t v53 = v45;
      _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);
    }
    uint64_t v22 = v47;
LABEL_26:

    v14[2](v14, 1, 0);
LABEL_27:

    goto LABEL_28;
  }
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: retryCount >= 0";
    goto LABEL_21;
  }
LABEL_28:
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    aSelector = a2;
    if (!v12)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v60 = "-[SMMadridMessenger iMessageSendFor:guid:successful:withError:]";
        __int16 v61 = 1024;
        LODWORD(v62) = 436;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID (in %s:%d)", buf, 0x12u);
      }
    }
    __int16 v15 = [MEMORY[0x1E4F998D8] sessionIDFromURL:v11];
    __int16 v16 = [MEMORY[0x1E4F998D8] messageIDFromURL:v11];
    uint64_t v44 = [MEMORY[0x1E4F998D8] messageTypeFromURL:v11];
    uint64_t v55 = 0;
    __int16 v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = -1;
    uint64_t v49 = 0;
    SEL v50 = &v49;
    uint64_t v51 = 0x3032000000;
    __int16 v52 = __Block_byref_object_copy__16;
    uint64_t v53 = __Block_byref_object_dispose__16;
    id v54 = 0;
    __int16 v17 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __63__SMMadridMessenger_iMessageSendFor_guid_successful_withError___block_invoke;
    v45[3] = &unk_1E6B91FB0;
    id v43 = v16;
    id v46 = v43;
    id v47 = &v55;
    uint64_t v48 = &v49;
    [v17 enumerateObjectsUsingBlock:v45];

    if (v56[3] == -1
      || ([(id)v50[5] callback], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v44 != 1)
      {
        v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          double v37 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138413826;
          long long v60 = (const char *)v15;
          __int16 v61 = 2112;
          id v62 = v36;
          __int16 v63 = 2112;
          __int16 v64 = v37;
          __int16 v65 = 2112;
          id v66 = v43;
          __int16 v67 = 2112;
          id v68 = v12;
          __int16 v69 = 1024;
          *(_DWORD *)uint64_t v70 = v7;
          *(_WORD *)&v70[4] = 2112;
          *(void *)&v70[6] = v13;
          _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,index not found or nil callback,GUID,%@,success,%d,error,%@", buf, 0x44u);
        }
        if (v56[3] == -1) {
          goto LABEL_27;
        }
        uint64_t v25 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
        [v25 removeObjectAtIndex:v56[3]];
        goto LABEL_26;
      }
    }
    else
    {

      if (v44 != 1)
      {
LABEL_12:
        __int16 v21 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
        [v21 removeObjectAtIndex:v56[3]];

        uint64_t v22 = [(id)v50[5] messageSentDate];
        [v22 timeIntervalSinceNow];
        double v24 = v23;

        uint64_t v25 = [(id)v50[5] callback];
        if (v7)
        {
          uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v29 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138413314;
            long long v60 = (const char *)v15;
            __int16 v61 = 2112;
            id v62 = v28;
            __int16 v63 = 2112;
            __int16 v64 = v29;
            __int16 v65 = 2112;
            id v66 = v43;
            __int16 v67 = 2112;
            id v68 = v12;
            _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send succeeded,GUID,%@", buf, 0x34u);
          }
          id v30 = 0;
          id v31 = v12;
        }
        else
        {
          uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            double v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            id v39 = (id)objc_claimAutoreleasedReturnValue();
            double v40 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138413570;
            long long v60 = (const char *)v15;
            __int16 v61 = 2112;
            id v62 = v39;
            __int16 v63 = 2112;
            __int16 v64 = v40;
            __int16 v65 = 2112;
            id v66 = v43;
            __int16 v67 = 2112;
            id v68 = v13;
            __int16 v69 = 2112;
            *(void *)uint64_t v70 = v12;
            _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed with error %@,GUID,%@", buf, 0x3Eu);
          }
          id v31 = 0;
          id v30 = v13;
        }

        ((void (**)(void, id, BOOL, id))v25)[2](v25, v31, v7, v30);
        v33 = [(id)v50[5] conversation];
        id v34 = [v33 receiverHandles];
        LOBYTE(v41) = v7;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v44, 0, 0, 1, 1, v13, -v24, v41, [v34 count]);

LABEL_26:
        goto LABEL_27;
      }
    }
    [(SMMadridMessenger *)self processSessionStartMessageSendResultWithMessageUrl:v11 guid:v12 successful:v7 withError:v13];
    __int16 v19 = [(id)v50[5] callback];
    BOOL v20 = v19 == 0;

    if (v20)
    {
LABEL_27:

      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v55, 8);

      goto LABEL_28;
    }
    goto LABEL_12;
  }
  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl", buf, 2u);
  }
LABEL_28:
}

void __63__SMMadridMessenger_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = [v11 identifier];
  id v9 = [*(id *)(a1 + 32) UUIDString];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    double v24 = "Invalid parameter not satisfying: messageUrl";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_23;
  }
  if (!v12)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    double v24 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_13;
  }
  BOOL v41 = v7;
  uint64_t v14 = [MEMORY[0x1E4F998D8] sessionIDFromURL:v11];
  __int16 v15 = [MEMORY[0x1E4F998D8] messageIDFromURL:v11];
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = -1;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  SEL v50 = __Block_byref_object_copy__16;
  uint64_t v51 = __Block_byref_object_dispose__16;
  id v52 = 0;
  __int16 v16 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __81__SMMadridMessenger_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v43[3] = &unk_1E6B91FB0;
  id v42 = v15;
  id v44 = v42;
  id v45 = &v53;
  id v46 = &v47;
  [v16 enumerateObjectsUsingBlock:v43];

  if (v54[3] == -1)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413826;
      uint64_t v58 = v14;
      __int16 v59 = 2112;
      id v60 = v26;
      __int16 v61 = 2112;
      id v62 = v27;
      __int16 v63 = 2112;
      id v64 = v42;
      __int16 v65 = 2112;
      id v66 = v12;
      __int16 v67 = 1024;
      BOOL v68 = v41;
      __int16 v69 = 2112;
      id v70 = v13;
      _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,index not found,GUID,%@,success,%d,error,%@", buf, 0x44u);
    }
  }
  else
  {
    __int16 v17 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
    [v17 removeObjectAtIndex:v54[3]];

    id v18 = [(id)v48[5] callback];
    LODWORD(v17) = v18 == 0;

    if (v17)
    {
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        id v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        id v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        uint64_t v58 = v14;
        __int16 v59 = 2112;
        id v60 = v29;
        __int16 v61 = 2112;
        id v62 = v30;
        __int16 v63 = 2112;
        id v64 = v42;
        _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,nil callback", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v19 = [(id)v48[5] callback];
      if (v41)
      {
        BOOL v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          double v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          uint64_t v58 = v14;
          __int16 v59 = 2112;
          id v60 = v22;
          __int16 v61 = 2112;
          id v62 = v23;
          __int16 v63 = 2112;
          id v64 = v42;
          _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,scheduled successfully", buf, 0x2Au);
        }
        (*(void (**)(uint64_t, id, uint64_t, void))(v19 + 16))(v19, v12, 1, 0);
      }
      else
      {
        id v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          double v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          id v39 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413314;
          uint64_t v58 = v14;
          __int16 v59 = 2112;
          id v60 = v38;
          __int16 v61 = 2112;
          id v62 = v39;
          __int16 v63 = 2112;
          id v64 = v42;
          __int16 v65 = 2112;
          id v66 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to schedule with error %@", buf, 0x34u);
        }
        (*(void (**)(uint64_t, void, void, id))(v19 + 16))(v19, 0, 0, v13);
      }
      v32 = [(id)v48[5] messageSentDate];
      [v32 timeIntervalSinceNow];
      double v34 = v33;
      uint64_t v35 = [(id)v48[5] conversation];
      id v36 = [v35 receiverHandles];
      LOBYTE(v40) = v41;
      +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 0, 1, 1, v13, -v34, v40, [v36 count]);
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

LABEL_23:
}

void __81__SMMadridMessenger_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = [v11 identifier];
  id v9 = [*(id *)(a1 + 32) UUIDString];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    uint64_t v60 = 0;
    __int16 v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = -1;
    *(void *)id v54 = 0;
    uint64_t v55 = v54;
    uint64_t v56 = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__16;
    uint64_t v58 = __Block_byref_object_dispose__16;
    id v59 = 0;
    id v11 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __73__SMMadridMessenger_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
    v50[3] = &unk_1E6B91FB0;
    id v12 = v9;
    id v51 = v12;
    id v52 = &v60;
    uint64_t v53 = v54;
    [v11 enumerateObjectsUsingBlock:v50];

    if (v61[3] == -1)
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        id v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        id v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v65 = v29;
        __int16 v66 = 2112;
        id v67 = v30;
        __int16 v68 = 2112;
        id v69 = v12;
        _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message not found for messageGUID %@", buf, 0x20u);
      }
    }
    else
    {
      id v13 = [(SMMadridMessenger *)self madridMessagesWaitingForAck];
      [v13 removeObjectAtIndex:v61[3]];

      uint64_t v14 = [*((id *)v55 + 5) callback];
      LODWORD(v13) = v14 == 0;

      if (v13)
      {
        uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          id v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          double v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          id v65 = v32;
          __int16 v66 = 2112;
          id v67 = v33;
          __int16 v68 = 2112;
          id v69 = v12;
          _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,nil callback for %@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v15 = [*((id *)v55 + 5) callback];
        if (v6)
        {
          __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v65 = v18;
            __int16 v66 = 2112;
            id v67 = v19;
            __int16 v68 = 2112;
            id v69 = v12;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,cancel suceeded for %@", buf, 0x20u);
          }
          (*(void (**)(uint64_t, uint64_t, void))(v15 + 16))(v15, 1, 0);
          uint64_t v20 = [*((id *)v55 + 5) pendingRetryCount];
          uint64_t v21 = [*((id *)v55 + 5) pendingRetryCount];
          id v22 = [*((id *)v55 + 5) messageSentDate];
          [v22 timeIntervalSinceNow];
          double v24 = v23;
          uint64_t v25 = [*((id *)v55 + 5) conversation];
          id v26 = [v25 receiverHandles];
          LOBYTE(v49) = 1;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3 - v20, v21 == 0, 0, -v24, v49, [v26 count]);
        }
        else if ([*((id *)v55 + 5) pendingRetryCount])
        {
          double v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            id v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v44 = (id)objc_claimAutoreleasedReturnValue();
            int v45 = [*((id *)v55 + 5) pendingRetryCount];
            *(_DWORD *)buf = 138413314;
            id v65 = v43;
            __int16 v66 = 2112;
            id v67 = v44;
            __int16 v68 = 2112;
            id v69 = v12;
            __int16 v70 = 2112;
            id v71 = v10;
            __int16 v72 = 1024;
            int v73 = v45;
            _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,cancel failed for %@ with error %@ retries left %d", buf, 0x30u);
          }
          uint64_t v35 = [*((id *)v55 + 5) conversation];
          -[SMMadridMessenger cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:](self, "cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:", v12, v35, [*((id *)v55 + 5) pendingRetryCount] - 1, v15);

          uint64_t v36 = [*((id *)v55 + 5) pendingRetryCount];
          id v22 = [*((id *)v55 + 5) messageSentDate];
          [v22 timeIntervalSinceNow];
          double v38 = v37;
          uint64_t v25 = [*((id *)v55 + 5) conversation];
          id v26 = [v25 receiverHandles];
          LOBYTE(v49) = 0;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3 - v36, 0, v10, -v38, v49, [v26 count]);
        }
        else
        {
          id v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v48 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            id v65 = v47;
            __int16 v66 = 2112;
            id v67 = v48;
            __int16 v68 = 2112;
            id v69 = v12;
            __int16 v70 = 2112;
            id v71 = v10;
            _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,cancel failed for %@ with error %@", buf, 0x2Au);
          }
          (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v10);
          id v22 = [*((id *)v55 + 5) messageSentDate];
          [v22 timeIntervalSinceNow];
          double v41 = v40;
          uint64_t v25 = [*((id *)v55 + 5) conversation];
          id v26 = [v25 receiverHandles];
          LOBYTE(v49) = 0;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3, 1, v10, -v41, v49, [v26 count]);
        }
      }
    }

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v54 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", v54, 2u);
    }
  }
}

void __73__SMMadridMessenger_iMessageScheduledSendCancelFor_successful_withError___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v22 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v22 = "Invalid parameter not satisfying: handle";
    goto LABEL_12;
  }
  uint64_t v12 = [MEMORY[0x1E4F998D8] messageTypeFromURL:v9];
  if ([MEMORY[0x1E4F998D8] interfaceTypeFromMessageType:v12] == 1)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F99888]);
    uint64_t v14 = [v13 initWithPrimaryHandle:v11 secondaryHandles:MEMORY[0x1E4F1CBF0]];
    uint64_t v15 = [MEMORY[0x1E4F998D8] createMessageFromURL:v9];
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    __int16 v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v15 sessionID];
        uint64_t v19 = (objc_class *)objc_opt_class();
        id v29 = NSStringFromClass(v19);
        uint64_t v20 = NSStringFromSelector(a2);
        [v15 messageID];
        *(_DWORD *)buf = 138413570;
        id v31 = v18;
        __int16 v32 = 2112;
        double v33 = v29;
        __int16 v34 = 2112;
        uint64_t v35 = v20;
        uint64_t v37 = v36 = 2112;
        uint64_t v21 = (void *)v37;
        __int16 v38 = 2112;
        id v39 = v11;
        __int16 v40 = 2112;
        double v41 = v15;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from %@,message,%@", buf, 0x3Eu);
      }
      __int16 v17 = [(SMMadridMessenger *)self delegate];
      [v17 receivedMessage:v15 fromHandle:v14 fromMe:v5];
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      id v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v31 = v27;
      __int16 v32 = 2112;
      double v33 = v28;
      __int16 v34 = 2112;
      uint64_t v35 = v11;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v9;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received message from %@ could not be converted to SMMessage,messageUrl,%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v23 = (objc_class *)objc_opt_class();
      double v24 = NSStringFromClass(v23);
      uint64_t v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v31 = v24;
      __int16 v32 = 2112;
      double v33 = v25;
      __int16 v34 = 1024;
      LODWORD(v35) = v12;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received unsupported message type %d over Madrid", buf, 0x1Cu);
    }
  }
LABEL_18:
}

- (void)iMessageDeletedFor:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = v4;
  if (v4)
  {
    BOOL v5 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v29;
      unint64_t v10 = 0x1E4F99000uLL;
      *(void *)&long long v7 = 138412802;
      long long v25 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v13 = [*(id *)(v10 + 2264) createMessageFromURL:v12, v25];
          uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          uint64_t v15 = v14;
          if (v13)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              __int16 v16 = [v13 sessionID];
              __int16 v17 = (objc_class *)objc_opt_class();
              id v18 = NSStringFromClass(v17);
              uint64_t v19 = NSStringFromSelector(a2);
              uint64_t v20 = [v13 messageID];
              *(_DWORD *)buf = 138413314;
              double v33 = v16;
              __int16 v34 = 2112;
              uint64_t v35 = v18;
              __int16 v36 = 2112;
              uint64_t v37 = v19;
              __int16 v38 = 2112;
              id v39 = v20;
              __int16 v40 = 2112;
              double v41 = v13;
              _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,deleted message,%@", buf, 0x34u);

              BOOL v5 = v26;
              unint64_t v10 = 0x1E4F99000;
            }
            uint64_t v15 = [(SMMadridMessenger *)self delegate];
            [v15 deletedMessage:v13];
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = (objc_class *)objc_opt_class();
            id v22 = NSStringFromClass(v21);
            double v23 = NSStringFromSelector(a2);
            *(_DWORD *)buf = v25;
            double v33 = v22;
            __int16 v34 = 2112;
            uint64_t v35 = v23;
            __int16 v36 = 2112;
            uint64_t v37 = v12;
            _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@, deleted message could not be converted to SMMessage,messageUrl,%@", buf, 0x20u);

            unint64_t v10 = 0x1E4F99000;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v42 count:16];
      }
      while (v8);
    }
  }
  else
  {
    double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrls", buf, 2u);
    }

    BOOL v5 = 0;
  }
}

- (id)createMSMessage:(id)a3 summaryText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F35160]);
    [v7 setCaption:v6];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F35158]) initWithAlternateLayout:v7];
    id v9 = objc_alloc(MEMORY[0x1E4F35150]);
    id v10 = objc_alloc(MEMORY[0x1E4F35168]);
    id v11 = [v5 sessionID];
    uint64_t v12 = (void *)[v10 initWithIdentifier:v11];
    id v13 = (void *)[v9 initWithSession:v12];

    [v13 setLayout:v8];
    uint64_t v14 = [v5 outputToURLComponents];
    uint64_t v15 = [v14 URL];
    [v13 setURL:v15];

    [v13 setSummaryText:v6];
    [v13 setRequiresValidation:1];
  }
  else
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", v18, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)getIMPluginPayloadFromMSMessage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Messages/iMessageApps/SafetyMonitorMessages.bundle"];
    id v5 = [v4 pathForResource:@"CheckInMessagesAppIcon_32" ofType:@"png"];
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
    id v7 = [v3 _pluginPayloadWithAppIconData:v6 appName:@"Check In" allowDataPayloads:1];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: msMessage", v10, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

- (void)processSessionStartMessageSendResultWithMessageUrl:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    double v23 = "Invalid parameter not satisfying: messageUrl";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    double v23 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_13;
  }
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F99990]) initWithURL:v11];
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  __int16 v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = [v14 sessionID];
      id v18 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v18);
      uint64_t v19 = NSStringFromSelector(a2);
      long long v28 = (void *)v19;
      v27 = [v14 messageID];
      uint64_t v20 = [[MEMORY[0x1E4F99850] convertLowPowerModeWarningStateToString:-[NSObject lowPowerModeWarningState](v14, "lowPowerModeWarningState")];
      *(_DWORD *)buf = 138414082;
      uint64_t v21 = @"failed";
      long long v31 = v17;
      if (v7) {
        uint64_t v21 = @"succeeded";
      }
      __int16 v32 = 2112;
      double v33 = v29;
      __int16 v34 = 2112;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      uint64_t v39 = v20;
      id v22 = (void *)v20;
      __int16 v40 = 2112;
      double v41 = v21;
      __int16 v42 = 2112;
      id v43 = v12;
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@, lowPowerModeWarningState, %@, start message send %@,GUID,%@,error,%@", buf, 0x52u);
    }
    __int16 v16 = [(SMMadridMessenger *)self delegate];
    [v16 receivedSessionStartMessageSendResultWithMessage:v14 guid:v12 successful:v7 withError:v13];
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    double v24 = (objc_class *)objc_opt_class();
    long long v25 = NSStringFromClass(v24);
    id v26 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    long long v31 = v25;
    __int16 v32 = 2112;
    double v33 = v26;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v11;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to create SMSessionStartMessage from URL %@", buf, 0x20u);
  }
LABEL_17:
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

- (NSMutableArray)madridMessagesWaitingForAck
{
  return self->_madridMessagesWaitingForAck;
}

- (void)setMadridMessagesWaitingForAck:(id)a3
{
}

- (NSMutableArray)resultsWaitingForProcessing
{
  return self->_resultsWaitingForProcessing;
}

- (void)setResultsWaitingForProcessing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsWaitingForProcessing, 0);
  objc_storeStrong((id *)&self->_madridMessagesWaitingForAck, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end