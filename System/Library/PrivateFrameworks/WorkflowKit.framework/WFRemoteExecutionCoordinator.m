@interface WFRemoteExecutionCoordinator
+ (id)sharedCoordinator;
- (BOOL)allowRunRequests;
- (BOOL)hasPairedDevice;
- (BOOL)messageCameFromPairedDevice:(id)a3;
- (BOOL)sendStopRequest:(id)a3 error:(id *)a4;
- (BOOL)shouldDropMessageDueToStaleness:(id)a3;
- (IDSService)service;
- (NSMapTable)completionsForSessions;
- (NSMutableArray)activeSessions;
- (NSString)pairedDeviceModelIdentifier;
- (OS_dispatch_queue)queue;
- (id)defaultIDSOptions;
- (id)initAndAllowRunRequests:(BOOL)a3;
- (id)pairedDevice;
- (id)sessionFromRequestIdentifier:(id)a3;
- (id)sessionsOfClass:(Class)a3;
- (id)unknownRequestError;
- (id)unknownRequestMessageWithIdentifier:(id)a3;
- (void)cancelAllSessions;
- (void)cancelPendingFileTransfers;
- (void)cancelRequest:(id)a3;
- (void)cancelSessions:(id)a3;
- (void)finishSessionWithRequest:(id)a3;
- (void)handleAceCommandResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAlertRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAlertRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAskWhenRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAskWhenRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleDialogRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleDialogRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleIncomingAceCommand:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleStopRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleUnknownRequestMessage:(id)a3;
- (void)mapSelectorsForIncomingProtobuf;
- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4;
- (void)sendAlertRequest:(id)a3 completion:(id)a4;
- (void)sendAskWhenRunRequest:(id)a3 completion:(id)a4;
- (void)sendDialogRequest:(id)a3 completion:(id)a4;
- (void)sendFileAtURL:(id)a3 transferIdentifier:(id)a4 requestIdentifier:(id)a5 error:(id *)a6;
- (void)sendRunRequest:(id)a3 userInterface:(id)a4 parameterInputProvider:(id)a5 completionHandler:(id)a6;
- (void)sendRunRequestResponse:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)sessionDidFinish:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setCompletionsForSessions:(id)a3;
- (void)setService:(id)a3;
@end

@implementation WFRemoteExecutionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_completionsForSessions, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (BOOL)allowRunRequests
{
  return self->_allowRunRequests;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setService:(id)a3
{
}

- (void)setCompletionsForSessions:(id)a3
{
}

- (NSMapTable)completionsForSessions
{
  return self->_completionsForSessions;
}

- (void)setActiveSessions:(id)a3
{
}

- (NSMutableArray)activeSessions
{
  return self->_activeSessions;
}

- (IDSService)service
{
  service = self->_service;
  if (service) {
    goto LABEL_4;
  }
  v4 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.shortcuts"];
  v5 = self->_service;
  self->_service = v4;

  if (self->_service)
  {
    [(WFRemoteExecutionCoordinator *)self mapSelectorsForIncomingProtobuf];
    v6 = self->_service;
    v7 = [(WFRemoteExecutionCoordinator *)self queue];
    [(IDSService *)v6 addDelegate:self queue:v7];

    service = self->_service;
LABEL_4:
    v8 = service;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_5:
  return v8;
}

- (void)mapSelectorsForIncomingProtobuf
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(WFRemoteExecutionCoordinator *)self service];
  [v3 setProtobufAction:sel_handleRunRequestResponse_service_account_fromID_context_ forIncomingRequestsOfType:2];

  v4 = [(WFRemoteExecutionCoordinator *)self service];
  [v4 setProtobufAction:sel_handleAlertRequest_service_account_fromID_context_ forIncomingRequestsOfType:3];

  v5 = [(WFRemoteExecutionCoordinator *)self service];
  [v5 setProtobufAction:sel_handleAlertRequestResponse_service_account_fromID_context_ forIncomingRequestsOfType:4];

  v6 = [(WFRemoteExecutionCoordinator *)self service];
  [v6 setProtobufAction:sel_handleAskWhenRunRequest_service_account_fromID_context_ forIncomingRequestsOfType:5];

  v7 = [(WFRemoteExecutionCoordinator *)self service];
  [v7 setProtobufAction:sel_handleAskWhenRunRequestResponse_service_account_fromID_context_ forIncomingRequestsOfType:6];

  v8 = [(WFRemoteExecutionCoordinator *)self service];
  [v8 setProtobufAction:sel_handleAceCommandResponse_service_account_fromID_context_ forIncomingRequestsOfType:9];

  v9 = [(WFRemoteExecutionCoordinator *)self service];
  [v9 setProtobufAction:sel_handleStopRequest_service_account_fromID_context_ forIncomingRequestsOfType:7];

  v10 = [(WFRemoteExecutionCoordinator *)self service];
  [v10 setProtobufAction:sel_handleDialogRequest_service_account_fromID_context_ forIncomingRequestsOfType:10];

  v11 = [(WFRemoteExecutionCoordinator *)self service];
  [v11 setProtobufAction:sel_handleDialogRequestResponse_service_account_fromID_context_ forIncomingRequestsOfType:11];

  if ([(WFRemoteExecutionCoordinator *)self allowRunRequests])
  {
    v12 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      v16 = "-[WFRemoteExecutionCoordinator mapSelectorsForIncomingProtobuf]";
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Started listening for run requests", (uint8_t *)&v15, 0xCu);
    }

    v13 = [(WFRemoteExecutionCoordinator *)self service];
    [v13 setProtobufAction:sel_handleRunRequest_service_account_fromID_context_ forIncomingRequestsOfType:1];

    v14 = [(WFRemoteExecutionCoordinator *)self service];
    [v14 setProtobufAction:sel_handleIncomingAceCommand_service_account_fromID_context_ forIncomingRequestsOfType:8];
  }
}

- (id)defaultIDSOptions
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F6AA10];
  v5[0] = *MEMORY[0x1E4F6A880];
  v5[1] = v2;
  v6[0] = MEMORY[0x1E4F1CC38];
  v6[1] = &unk_1F2316698;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a7;
  v12 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v41 = "-[WFRemoteExecutionCoordinator service:account:identifier:didSendWithSuccess:error:]";
    __int16 v42 = 2114;
    id v43 = v10;
    __int16 v44 = 1024;
    BOOL v45 = v8;
    __int16 v46 = 2114;
    id v47 = v11;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s <%{public}@> Sent with success: %i, %{public}@", buf, 0x26u);
  }

  if (v8)
  {
    id v13 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v19 = [v18 idsIdentifier];
          int v20 = [v10 isEqualToString:v19];

          if (v20) {
            [v18 fileSentWithSuccess:1 error:v11];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v15);
    }
  }
  else
  {
    v21 = [(WFRemoteExecutionCoordinator *)self activeSessions];
    v22 = (void *)[v21 copy];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v22;
    uint64_t v23 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v13);
          }
          v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v28 = [v27 idsIdentifier];
          int v29 = [v28 isEqualToString:v10];

          if (v29) {
            [v27 finishWithError:v11];
          }
        }
        uint64_t v24 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v24);
    }
  }
}

- (NSString)pairedDeviceModelIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(WFRemoteExecutionCoordinator *)self service];
  v3 = [v2 devices];
  v4 = [v3 reverseObjectEnumerator];

  v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if [v8 isLocallyPaired] && (objc_msgSend(v8, "isActive"))
        {
          v5 = [v8 modelIdentifier];
          goto LABEL_12;
        }
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (NSString *)v5;
}

- (id)pairedDevice
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [(WFRemoteExecutionCoordinator *)self service];
  v3 = [v2 devices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isLocallyPaired] && objc_msgSend(v9, "isActive"))
        {
          long long v10 = (void *)MEMORY[0x1E4F1CAD0];
          long long v11 = (void *)IDSCopyIDForDevice();
          uint64_t v12 = [v10 setWithObject:v11];

          uint64_t v6 = (void *)v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasPairedDevice
{
  uint64_t v2 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldDropMessageDueToStaleness:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (shouldDropMessageDueToStaleness__onceToken != -1) {
    dispatch_once(&shouldDropMessageDueToStaleness__onceToken, &__block_literal_global_220);
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [(id)shouldDropMessageDueToStaleness__calendar components:64 fromDate:v3 toDate:v4 options:0];
  uint64_t v6 = [v5 minute];
  if (v6 >= 2)
  {
    uint64_t v7 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      long long v10 = "-[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:]";
      __int16 v11 = 2114;
      id v12 = v3;
      __int16 v13 = 2114;
      long long v14 = v4;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Dropping message because it was sent more than one minute ago. server received message at %{public}@, it is currently: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  return v6 > 1;
}

void __64__WFRemoteExecutionCoordinator_shouldDropMessageDueToStaleness___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v1 = (void *)shouldDropMessageDueToStaleness__calendar;
  shouldDropMessageDueToStaleness__calendar = v0;
}

- (BOOL)messageCameFromPairedDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFRemoteExecutionCoordinator *)self service];
  uint64_t v6 = [v5 deviceForFromID:v4];

  if [v6 isLocallyPaired] && (objc_msgSend(v6, "isActive"))
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v8 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      __int16 v11 = "-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Dropping message as it did not come from a paired device", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)finishSessionWithRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  uint64_t v6 = (void *)[v5 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int16 v13 = objc_msgSend(v12, "request", (void)v18);
        long long v14 = [v13 identifier];
        uint64_t v15 = [v4 identifier];
        int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v17 = v12;
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v17 finishWithError:0];
          }
          else
          {

            [v17 finish];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)sessionDidFinish:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int16 v11 = "-[WFRemoteExecutionCoordinator sessionDidFinish:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v6 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v6 removeObject:v4];

  id v7 = [(WFRemoteExecutionCoordinator *)self completionsForSessions];
  uint64_t v8 = [v7 objectForKey:v4];

  uint64_t v9 = [(WFRemoteExecutionCoordinator *)self completionsForSessions];
  [v9 removeObjectForKey:v4];

  if (v8) {
    v8[2](v8);
  }
}

- (id)sessionsOfClass:(Class)a3
{
  id v4 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  uint64_t v5 = [v4 objectsMatchingClass:a3];

  return v5;
}

- (void)handleUnknownRequestMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"identifier"];
  uint64_t v5 = [(WFRemoteExecutionCoordinator *)self sessionFromRequestIdentifier:v4];
  uint64_t v6 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [v5 request];
    int v10 = 136315394;
    __int16 v11 = "-[WFRemoteExecutionCoordinator handleUnknownRequestMessage:]";
    __int16 v12 = 2112;
    id v13 = (id)objc_opt_class();
    id v8 = v13;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Remote device did not understand request of class: %@", (uint8_t *)&v10, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(WFRemoteExecutionCoordinator *)self unknownRequestError];
    [v5 finishWithError:v9];
  }
}

- (id)unknownRequestError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  id v3 = WFLocalizedString(@"While running your shortcut remotely, we encountered an unknown request. Please update your device.");
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:@"WFRemoteExecutionCoordinatorErrorDomain" code:1 userInfo:v4];

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v8 = [v9 objectForKey:@"messageType"];
  if ([v8 isEqualToString:@"unknownRequest"]) {
    [(WFRemoteExecutionCoordinator *)self handleUnknownRequestMessage:v9];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if ([v9 type] != 1 && objc_msgSend(v9, "type") != 8)
  {
    __int16 v11 = [v9 data];
    id v24 = 0;
    __int16 v12 = +[WFRemoteExecutionRequest identifierFromData:v11 error:&v24];
    id v13 = v24;

    uint64_t v14 = getWFRemoteExecutionLogObject();
    uint64_t v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = [v9 data];
        int v17 = [v9 type];
        *(_DWORD *)buf = 136315650;
        v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v27 = 2114;
        id v28 = v16;
        __int16 v29 = 1024;
        int v30 = v17;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Received unknown request with data: %{public}@, message type: %i", buf, 0x1Cu);
      }
      uint64_t v15 = [(WFRemoteExecutionCoordinator *)self unknownRequestMessageWithIdentifier:v12];
      long long v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
      long long v19 = [(WFRemoteExecutionCoordinator *)self service];
      long long v20 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      uint64_t v23 = 0;
      char v21 = [v19 sendMessage:v15 toDestinations:v18 priority:300 options:v20 identifier:0 error:&v23];

      if ((v21 & 1) == 0)
      {
        v22 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Received unknown request but failed to send the unknown identifier back to the originating device", buf, 0xCu);
        }
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
      __int16 v27 = 2114;
      id v28 = v13;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Received unknown request but failed to read the identifier from it. %{public}@", buf, 0x16u);
    }
  }
}

- (id)unknownRequestMessageWithIdentifier:(id)a3
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"messageType";
  v7[1] = @"identifier";
  v8[0] = @"unknownRequest";
  v8[1] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [v12 objectForKey:@"transferIdentifier"];
  uint64_t v15 = [v12 objectForKey:@"requestIdentifier"];
  int v16 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
    __int16 v59 = 2114;
    id v60 = v15;
    __int16 v61 = 2114;
    id v62 = v14;
    _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s <%{public}@> Received file with id: %{public}@", buf, 0x20u);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v13])
  {
    id v43 = v15;
    __int16 v42 = [v11 lastPathComponent];
    int v17 = objc_msgSend(MEMORY[0x1E4F5AA28], "proposedSharedTemporaryFileURLForFilename:");
    uint64_t v18 = [v17 URLByDeletingLastPathComponent];
    long long v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v54 = 0;
    v41 = (void *)v18;
    [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v54];
    id v20 = v54;

    if (v20)
    {
      char v21 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
        __int16 v59 = 2114;
        id v60 = v41;
        v22 = v41;
        __int16 v61 = 2114;
        id v62 = v20;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_FAULT, "%s Unable to create directory at URL: %{public}@ for incoming file. error: %{public}@", buf, 0x20u);
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v53 = 0;
      [v23 copyItemAtURL:v11 toURL:v17 error:&v53];
      id v20 = v53;

      if (v20)
      {
        char v21 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
          __int16 v59 = 2114;
          id v60 = v20;
          _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_FAULT, "%s Unable to move incoming file from ids URL to temporary URL with error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        __int16 v44 = v17;
        id v24 = v14;
        id v25 = v12;
        id v39 = v13;
        id v40 = v11;
        char v21 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v26 = [v21 countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v50;
          do
          {
            __int16 v29 = v21;
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v50 != v28) {
                objc_enumerationMutation(v29);
              }
              uint64_t v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              long long v32 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
              long long v33 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
              [v31 handleIncomingFileForRemoteExecutionWithURL:v44 withIdentifier:v24 metadata:v25 destinations:v32 options:v33];
            }
            char v21 = v29;
            uint64_t v27 = [v29 countByEnumeratingWithState:&v49 objects:v56 count:16];
          }
          while (v27);
        }
        long long v34 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
        id v13 = v39;
        id v11 = v40;
        id v12 = v25;
        uint64_t v14 = v24;
        int v17 = v44;
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v46 != v37) {
                objc_enumerationMutation(v34);
              }
              objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * j), "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:metadata:", v44, v14, v12, v39, v40);
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
          }
          while (v36);
        }

        id v20 = 0;
      }
    }
    uint64_t v15 = v43;
    v22 = v41;
    goto LABEL_26;
  }
LABEL_27:
}

- (void)sendFileAtURL:(id)a3 transferIdentifier:(id)a4 requestIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [WFRemoteExecutionOutgoingFileSession alloc];
  uint64_t v14 = [(WFRemoteExecutionCoordinator *)self service];
  int v17 = [(WFRemoteExecutionOutgoingFileSession *)v13 initWithService:v14 fileURL:v12 transferIdentifier:v11 requestIdentifier:v10];

  [(WFRemoteExecutionSession *)v17 setDelegate:self];
  uint64_t v15 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  int v16 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingFileSession *)v17 sendToDestinations:v15 options:v16 error:a6];
}

- (void)handleDialogRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315138;
    id v25 = "-[WFRemoteExecutionCoordinator handleDialogRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming dialog request", (uint8_t *)&v24, 0xCu);
  }

  BOOL v14 = [(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v12];
  if (v14)
  {
    uint64_t v15 = [v11 serverReceivedTime];
    BOOL v16 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v15];

    if (!v16)
    {
      int v17 = [WFRemoteExecutionIncomingDialogRequestSession alloc];
      uint64_t v18 = [(WFRemoteExecutionCoordinator *)self service];
      long long v19 = [(WFRemoteExecutionSession *)v17 initWithService:v18];

      [(WFRemoteExecutionSession *)v19 setDelegate:self];
      id v20 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      char v21 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
      v22 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      [(WFRemoteExecutionIncomingDialogRequestSession *)v19 handleIncomingProtobuf:v10 currentlyActiveSessions:v20 destinations:v21 options:v22];

      uint64_t v23 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [v23 addObject:v19];
    }
  }
}

- (void)handleIncomingAceCommand:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315138;
    int v24 = "-[WFRemoteExecutionCoordinator handleIncomingAceCommand:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ace command", (uint8_t *)&v23, 0xCu);
  }

  BOOL v14 = [(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v12];
  if (v14)
  {
    uint64_t v15 = [v11 serverReceivedTime];
    BOOL v16 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v15];

    if (!v16)
    {
      int v17 = [WFRemoteExecutionIncomingAceCommandSession alloc];
      uint64_t v18 = [(WFRemoteExecutionCoordinator *)self service];
      long long v19 = [(WFRemoteExecutionSession *)v17 initWithService:v18];

      [(WFRemoteExecutionSession *)v19 setDelegate:self];
      id v20 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
      char v21 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      [(WFRemoteExecutionIncomingAceCommandSession *)v19 handleIncomingProtobuf:v10 destinations:v20 options:v21];

      v22 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [v22 addObject:v19];
    }
  }
}

- (void)handleAskWhenRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ask each time response", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      BOOL v16 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      int v17 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v29 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequestResponse:service:account:fromID:context:]";
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "handleIncomingProtobuf:", v10, (void)v23);
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)sendAskWhenRunRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFRemoteExecutionOutgoingAskEachTimeSession alloc];
  id v9 = [(WFRemoteExecutionCoordinator *)self service];
  id v13 = [(WFRemoteExecutionOutgoingAskEachTimeSession *)v8 initWithService:v9 request:v7 completion:v6];

  [(WFRemoteExecutionSession *)v13 setDelegate:self];
  id v10 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v11 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingAskEachTimeSession *)v13 sendToDestinations:v10 options:v11];

  id v12 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v12 addObject:v13];
}

- (void)handleStopRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[WFRemoteExecutionCoordinator handleStopRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming stop request", (uint8_t *)&v21, 0xCu);
  }

  BOOL v14 = [(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v12];
  if (v14)
  {
    BOOL v15 = [v11 serverReceivedTime];
    BOOL v16 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v15];

    if (!v16)
    {
      int v17 = [WFRemoteExecutionIncomingStopSession alloc];
      id v18 = [(WFRemoteExecutionCoordinator *)self service];
      uint64_t v19 = [(WFRemoteExecutionSession *)v17 initWithService:v18];

      uint64_t v20 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [(WFRemoteExecutionIncomingStopSession *)v19 handleIncomingProtobuf:v10 currentlyActiveSessions:v20];
    }
  }
}

- (void)handleAlertRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[WFRemoteExecutionCoordinator handleAlertRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming alert response", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      BOOL v16 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      int v17 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v29 = "-[WFRemoteExecutionCoordinator handleAlertRequestResponse:service:account:fromID:context:]";
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "handleIncomingProtobuf:", v10, (void)v23);
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)sendAlertRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFRemoteExecutionOutgoingAlertSession alloc];
  id v9 = [(WFRemoteExecutionCoordinator *)self service];
  id v13 = [(WFRemoteExecutionOutgoingAlertSession *)v8 initWithService:v9 request:v7 completion:v6];

  [(WFRemoteExecutionSession *)v13 setDelegate:self];
  id v10 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v11 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingAlertSession *)v13 sendToDestinations:v10 options:v11];

  id v12 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v12 addObject:v13];
}

- (void)sendRunRequestResponse:(id)a3 completion:(id)a4
{
  id aBlock = a4;
  id v6 = a3;
  id v7 = [WFRemoteExecutionOutgoingRunRequestResponseSession alloc];
  id v8 = [(WFRemoteExecutionCoordinator *)self service];
  id v9 = [(WFRemoteExecutionOutgoingRunRequestResponseSession *)v7 initWithService:v8 responseData:v6];

  [(WFRemoteExecutionSession *)v9 setDelegate:self];
  id v10 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v11 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingRunRequestResponseSession *)v9 sendToDestinations:v10 options:v11];

  id v12 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v12 addObject:v9];

  if (aBlock)
  {
    id v13 = [(WFRemoteExecutionCoordinator *)self completionsForSessions];
    BOOL v14 = _Block_copy(aBlock);
    [v13 setObject:v14 forKey:v9];
  }
}

- (void)handleRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v45 = "-[WFRemoteExecutionCoordinator handleRunRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming run request", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      id v38 = v12;
      BOOL v16 = [WFRemoteExecutionRunRequest alloc];
      int v17 = [v10 data];
      id v18 = [(WFRemoteExecutionRunRequest *)v16 initWithData:v17 error:0];

      id v39 = v18;
      if (v18)
      {
        uint64_t v19 = [(WFRemoteExecutionRequest *)v18 identifier];

        if (v19)
        {
          id v36 = v11;
          id v37 = v10;
          [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v20 = (WFRemoteExecutionIncomingRunRequestSession *)(id)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = [(WFRemoteExecutionIncomingRunRequestSession *)v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v41;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v41 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                long long v26 = objc_msgSend(v25, "request", v36, v37);
                uint64_t v27 = [v26 identifier];
                uint64_t v28 = [(WFRemoteExecutionRequest *)v39 identifier];
                int v29 = [v27 isEqualToString:v28];

                if (v29)
                {
                  uint64_t v35 = getWFRemoteExecutionLogObject();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v45 = "-[WFRemoteExecutionCoordinator handleRunRequest:service:account:fromID:context:]";
                    __int16 v46 = 2112;
                    long long v47 = v25;
                    _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_DEFAULT, "%s Received an incoming run request, however, there is an existing session with the same identifier (%@). Dropping this request.", buf, 0x16u);
                  }

                  uint64_t v32 = v20;
                  id v11 = v36;
                  id v10 = v37;
                  goto LABEL_20;
                }
              }
              uint64_t v22 = [(WFRemoteExecutionIncomingRunRequestSession *)v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          id v11 = v36;
          id v10 = v37;
        }
      }
      __int16 v30 = [WFRemoteExecutionIncomingRunRequestSession alloc];
      uint64_t v31 = [(WFRemoteExecutionCoordinator *)self service];
      uint64_t v32 = [(WFRemoteExecutionSession *)v30 initWithService:v31];

      [(WFRemoteExecutionSession *)v32 setDelegate:self];
      long long v33 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
      long long v34 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      [(WFRemoteExecutionIncomingRunRequestSession *)v32 handleIncomingProtobuf:v10 destinations:v33 options:v34];

      uint64_t v20 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [(WFRemoteExecutionIncomingRunRequestSession *)v20 addObject:v32];
LABEL_20:
      id v12 = v38;
    }
  }
}

- (void)handleDialogRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming dialog request response", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      BOOL v16 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      int v17 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
        __int16 v31 = 2114;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (![v16 count])
      {
        id v18 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v19 = v16;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v25;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (void)v24);
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)sendDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFRemoteExecutionOutgoingDialogRequestSession alloc];
  id v9 = [(WFRemoteExecutionCoordinator *)self service];
  id v13 = [(WFRemoteExecutionOutgoingDialogRequestSession *)v8 initWithService:v9 request:v7 completion:v6];

  [(WFRemoteExecutionSession *)v13 setDelegate:self];
  id v10 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v11 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingDialogRequestSession *)v13 sendToDestinations:v10 options:v11];

  id v12 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v12 addObject:v13];
}

- (void)handleAceCommandResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ace command response", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      BOOL v16 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      int v17 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
        __int16 v31 = 2114;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (![v16 count])
      {
        id v18 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v19 = v16;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v25;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (void)v24);
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v14 = [[WFRemoteExecutionAceCommandRequest alloc] initWithAceCommandDictionary:v7];

  id v8 = [WFRemoteExecutionOutgoingAceCommandSession alloc];
  id v9 = [(WFRemoteExecutionCoordinator *)self service];
  id v10 = [(WFRemoteExecutionOutgoingAceCommandSession *)v8 initWithService:v9 request:v14 completion:v6];

  [(WFRemoteExecutionSession *)v10 setDelegate:self];
  id v11 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v12 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingAceCommandSession *)v10 sendToDestinations:v11 options:v12];

  id v13 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v13 addObject:v10];
}

- (void)handleAskWhenRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315138;
    long long v25 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ask each time to display", (uint8_t *)&v24, 0xCu);
  }

  BOOL v14 = [(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v12];
  if (v14)
  {
    BOOL v15 = [v11 serverReceivedTime];
    BOOL v16 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v15];

    if (!v16)
    {
      int v17 = [WFRemoteExecutionIncomingAskEachTimeSession alloc];
      id v18 = [(WFRemoteExecutionCoordinator *)self service];
      id v19 = [(WFRemoteExecutionSession *)v17 initWithService:v18];

      [(WFRemoteExecutionSession *)v19 setDelegate:self];
      uint64_t v20 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      uint64_t v21 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
      uint64_t v22 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      [(WFRemoteExecutionIncomingAskEachTimeSession *)v19 handleIncomingProtobuf:v10 currentlyActiveSessions:v20 responseDestinations:v21 responseOptions:v22];

      uint64_t v23 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [v23 addObject:v19];
    }
  }
}

- (BOOL)sendStopRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [WFRemoteExecutionOutgoingStopSession alloc];
  id v8 = [(WFRemoteExecutionCoordinator *)self service];
  id v9 = [(WFRemoteExecutionOutgoingStopSession *)v7 initWithService:v8 request:v6];

  [(WFRemoteExecutionSession *)v9 setDelegate:self];
  id v10 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  id v11 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  LOBYTE(a4) = [(WFRemoteExecutionOutgoingStopSession *)v9 sendToDestinations:v10 options:v11 error:a4];

  id v12 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v12 addObject:v9];

  return (char)a4;
}

- (void)handleAlertRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315138;
    long long v25 = "-[WFRemoteExecutionCoordinator handleAlertRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming alert to display", (uint8_t *)&v24, 0xCu);
  }

  BOOL v14 = [(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v12];
  if (v14)
  {
    BOOL v15 = [v11 serverReceivedTime];
    BOOL v16 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v15];

    if (!v16)
    {
      int v17 = [WFRemoteExecutionIncomingAlertSession alloc];
      id v18 = [(WFRemoteExecutionCoordinator *)self service];
      id v19 = [(WFRemoteExecutionSession *)v17 initWithService:v18];

      [(WFRemoteExecutionSession *)v19 setDelegate:self];
      uint64_t v20 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      uint64_t v21 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
      uint64_t v22 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
      [(WFRemoteExecutionIncomingAlertSession *)v19 handleIncomingProtobuf:v10 currentlyActiveSessions:v20 responseDestinations:v21 options:v22];

      uint64_t v23 = [(WFRemoteExecutionCoordinator *)self activeSessions];
      [v23 addObject:v19];
    }
  }
}

- (void)handleRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received incoming run request response", buf, 0xCu);
  }

  if ([(WFRemoteExecutionCoordinator *)self messageCameFromPairedDevice:v11])
  {
    BOOL v14 = [v12 serverReceivedTime];
    BOOL v15 = [(WFRemoteExecutionCoordinator *)self shouldDropMessageDueToStaleness:v14];

    if (!v15)
    {
      BOOL v16 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
      int v17 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
        __int16 v31 = 2114;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (![v16 count])
      {
        id v18 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v19 = v16;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v25;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (void)v24);
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)sendRunRequest:(id)a3 userInterface:(id)a4 parameterInputProvider:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = [WFRemoteExecutionOutgoingRunRequestSession alloc];
  BOOL v15 = [(WFRemoteExecutionCoordinator *)self service];
  id v19 = [(WFRemoteExecutionOutgoingRunRequestSession *)v14 initWithService:v15 request:v13 userInterface:v12 parameterInputProvider:v11 coordinator:self completion:v10];

  [(WFRemoteExecutionSession *)v19 setDelegate:self];
  BOOL v16 = [(WFRemoteExecutionCoordinator *)self pairedDevice];
  int v17 = [(WFRemoteExecutionCoordinator *)self defaultIDSOptions];
  [(WFRemoteExecutionOutgoingRunRequestSession *)v19 sendToDestinations:v16 options:v17];

  id v18 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [v18 addObject:v19];
}

- (id)sessionFromRequestIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  id v6 = (void *)[v5 copy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL v14 = objc_msgSend(v13, "request", (void)v19);
        BOOL v15 = [v14 identifier];
        int v16 = [v15 isEqualToString:v4];

        if (v16)
        {
          id v17 = v13;

          id v10 = v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)cancelRequest:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = [a3 identifier];
    uint64_t v5 = [(WFRemoteExecutionCoordinator *)self sessionFromRequestIdentifier:v4];

    if (v5)
    {
      v7[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [(WFRemoteExecutionCoordinator *)self cancelSessions:v6];
    }
  }
}

- (void)cancelSessions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 136315650;
    long long v17 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = [(WFRemoteExecutionCoordinator *)self completionsForSessions];
        [v11 removeObjectForKey:v10];

        id v12 = [(WFRemoteExecutionCoordinator *)self service];
        id v13 = [v10 idsIdentifier];
        id v18 = 0;
        char v14 = [v12 cancelIdentifier:v13 error:&v18];
        id v15 = v18;

        if ((v14 & 1) == 0)
        {
          int v16 = getWFRemoteExecutionLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            uint64_t v24 = "-[WFRemoteExecutionCoordinator cancelSessions:]";
            __int16 v25 = 2114;
            long long v26 = v10;
            __int16 v27 = 2114;
            id v28 = v15;
            _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Cancelling session: %{public}@ failed with error: %{public}@", buf, 0x20u);
          }
        }
        [v10 finish];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v7);
  }
}

- (void)cancelPendingFileTransfers
{
  id v3 = [(WFRemoteExecutionCoordinator *)self sessionsOfClass:objc_opt_class()];
  [(WFRemoteExecutionCoordinator *)self cancelSessions:v3];
}

- (void)cancelAllSessions
{
  id v3 = [(WFRemoteExecutionCoordinator *)self activeSessions];
  [(WFRemoteExecutionCoordinator *)self cancelSessions:v3];
}

- (id)initAndAllowRunRequests:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionCoordinator;
  id v4 = [(WFRemoteExecutionCoordinator *)&v17 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_allowRunRequests = a3;
    long long v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.shortcuts.remote-execution", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeSessions = v5->_activeSessions;
    v5->_activeSessions = v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    completionsForSessions = v5->_completionsForSessions;
    v5->_completionsForSessions = (NSMapTable *)v12;

    id v14 = [(WFRemoteExecutionCoordinator *)v5 service];
    id v15 = v5;
  }
  return v5;
}

+ (id)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_14173);
  }
  uint64_t v2 = (void *)sharedCoordinator_sharedCoordinator;
  return v2;
}

void __49__WFRemoteExecutionCoordinator_sharedCoordinator__block_invoke()
{
  id v0 = [[WFRemoteExecutionCoordinator alloc] initAndAllowRunRequests:0];
  v1 = (void *)sharedCoordinator_sharedCoordinator;
  sharedCoordinator_sharedCoordinator = (uint64_t)v0;
}

@end