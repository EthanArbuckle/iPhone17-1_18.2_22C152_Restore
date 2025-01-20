@interface SLDCollaborationNoticeService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (BOOL)_connShouldUnrestrictHighlightLookup:(id)a3;
- (id)_applicationIdentifierForConnection:(id)a3;
- (id)_handlesForAttributionIdentifiers:(id)a3 appID:(id)a4;
- (void)_send:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5;
- (void)_sendClearNoticesTransmission:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5;
- (void)sendClearNoticesFor:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5;
- (void)sendHighlightEventData:(id)a3 eventType:(int64_t)a4 forAttributionIdentifiers:(id)a5 reply:(id)a6;
@end

@implementation SLDCollaborationNoticeService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC4BC08;
}

+ (id)sharedService
{
  if (sharedService_onceToken_6 != -1) {
    dispatch_once(&sharedService_onceToken_6, &__block_literal_global_16);
  }
  v2 = (void *)sharedService_sService_6;
  return v2;
}

uint64_t __46__SLDCollaborationNoticeService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCollaborationNoticeService);
  uint64_t v1 = sharedService_sService_6;
  sharedService_sService_6 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)sendClearNoticesFor:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)getIMCollaborationClearTransmissionClass());
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  id v15 = (id)[v11 initWithCollaborationId:v10 date:v12 guidString:v14];

  [(SLDCollaborationNoticeService *)self _sendClearNoticesTransmission:v15 forAttributionIdentifiers:v9 reply:v8];
}

- (void)sendHighlightEventData:(id)a3 eventType:(int64_t)a4 forAttributionIdentifiers:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)getIMCollaborationNoticeTransmissionClass());
  v14 = [MEMORY[0x1E4F29128] UUID];
  id v15 = [v14 UUIDString];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = (id)[v13 initWithEventData:v12 eventType:a4 guidString:v15 date:v16];

  [(SLDCollaborationNoticeService *)self _send:v17 forAttributionIdentifiers:v11 reply:v10];
}

- (void)_sendClearNoticesTransmission:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [MEMORY[0x1E4F29268] currentConnection];
  if ([(SLDCollaborationNoticeService *)self _connShouldUnrestrictHighlightLookup:v11])
  {
    id v12 = @"accessibility";
  }
  else
  {
    id v12 = [(SLDCollaborationNoticeService *)self _applicationIdentifierForConnection:v11];
  }
  if (!getIMCollaborationNoticeDispatcherClass()
    || !getIMCollaborationClearTransmissionClass()
    || ([getIMCollaborationClearTransmissionClass() instancesRespondToSelector:sel_initWithCollaborationId_date_guidString_] & 1) == 0)
  {
    id v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]();
    }

    v10[2](v10, 0);
  }
  v14 = [(SLDCollaborationNoticeService *)self _handlesForAttributionIdentifiers:v9 appID:v12];
  if (!v14)
  {
    id v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]();
    }
    goto LABEL_17;
  }
  if (![getIMCollaborationNoticeDispatcherClass() instancesRespondToSelector:sel_sendClearNotice_toHandles_completion_])
  {
    id v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]();
    }
LABEL_17:

    v10[2](v10, 0);
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke;
  block[3] = &unk_1E58A9C70;
  block[4] = self;
  id v17 = v8;
  id v18 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v10[2](v10, 1);

LABEL_18:
}

void __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v5;
    __int16 v18 = 2080;
    v19 = "-[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]_block_invoke";
    __int16 v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] posting clear notice to imagent. Request UUID: %@", buf, 0x20u);
  }

  id v6 = objc_alloc_init((Class)getIMCollaborationNoticeDispatcherClass());
  uint64_t v7 = a1[5];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:a1[6]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke_55;
  v12[3] = &unk_1E58A9F88;
  uint64_t v9 = a1[4];
  id v13 = v6;
  uint64_t v14 = v9;
  id v15 = v3;
  id v10 = v3;
  id v11 = v6;
  [v11 sendClearNotice:v7 toHandles:v8 completion:v12];
}

void __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke_55(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disconnectFromDaemon];
  v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v8 = 134218754;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    id v11 = "-[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] post clear notice completion success: %@ request UUID: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)_send:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void))a5;
  id v11 = [MEMORY[0x1E4F29268] currentConnection];
  if ([(SLDCollaborationNoticeService *)self _connShouldUnrestrictHighlightLookup:v11])
  {
    __int16 v12 = @"accessibility";
  }
  else
  {
    __int16 v12 = [(SLDCollaborationNoticeService *)self _applicationIdentifierForConnection:v11];
  }
  if (!getIMCollaborationNoticeDispatcherClass()
    || !getIMCollaborationNoticeTransmissionClass()
    || ([getIMCollaborationNoticeTransmissionClass() instancesRespondToSelector:sel_initWithEventData_eventType_guidString_date_] & 1) == 0)
  {
    id v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]();
    }

    v10[2](v10, 0);
  }
  __int16 v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [(SLDCollaborationNoticeService *)self _handlesForAttributionIdentifiers:v9 appID:v12];
  uint64_t v16 = [v14 setWithArray:v15];

  if (!v16)
  {
    uint64_t v17 = SLDaemonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]();
    }
    goto LABEL_17;
  }
  if (![getIMCollaborationNoticeDispatcherClass() instancesRespondToSelector:sel_sendNotice_toHandles_completion_])
  {
    uint64_t v17 = SLDaemonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]();
    }
LABEL_17:

    v10[2](v10, 0);
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke;
  block[3] = &unk_1E58A9C70;
  block[4] = self;
  id v19 = v8;
  id v20 = v16;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v10[2](v10, 1);

LABEL_18:
}

void __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v5;
    __int16 v18 = 2080;
    id v19 = "-[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]_block_invoke";
    __int16 v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] posting notice to imagent. Request UUID: %@", buf, 0x20u);
  }

  id v6 = objc_alloc_init((Class)getIMCollaborationNoticeDispatcherClass());
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke_67;
  v12[3] = &unk_1E58A9F88;
  uint64_t v9 = a1[4];
  id v13 = v6;
  uint64_t v14 = v9;
  id v15 = v3;
  id v10 = v3;
  id v11 = v6;
  [v11 sendNotice:v7 toHandles:v8 completion:v12];
}

void __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke_67(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disconnectFromDaemon];
  v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v8 = 134218754;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    id v11 = "-[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] post notice completion success: %@ request UUID: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)_handlesForAttributionIdentifiers:(id)a3 appID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  v23 = [[SLHighlightCenter alloc] initWithAppIdentifier:v21];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(SLHighlightCenter *)v23 fetchAttributionForAttributionIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        __int16 v12 = v11;
        if (v11)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = [v11 relatedPersons];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                __int16 v18 = [*(id *)(*((void *)&v24 + 1) + 8 * j) handle];
                [v6 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  id v19 = (void *)[v6 copy];
  return v19;
}

- (BOOL)_connShouldUnrestrictHighlightLookup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F963E8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  id v14 = 0;
  uint64_t v7 = [v5 handleForIdentifier:v6 error:&v14];
  id v8 = v14;

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    __int16 v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_error_impl(&dword_19BE17000, v10, OS_LOG_TYPE_ERROR, "[SLDCollaborationNoticeService: %p] failed to look up a process handle for: %@ error: %@", buf, 0x20u);
    }
    char v12 = 0;
  }
  else
  {
    __int16 v10 = [v7 bundle];
    id v11 = [v10 identifier];
    char v12 = [v11 isEqualToString:@"com.apple.SafariBookmarksSyncAgent"];
  }
  return v12;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1E4F223F8];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  id v13 = 0;
  uint64_t v7 = [v6 bundleRecordForAuditToken:v14 error:&v13];
  id v8 = v13;
  BOOL v9 = [v7 applicationIdentifier];

  if (!v9)
  {
    __int16 v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SLDCollaborationNoticeService *)(uint64_t)self _applicationIdentifierForConnection:v10];
    }
  }
  id v11 = [v7 applicationIdentifier];

  return v11;
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_3_4(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Didn't find any handles for attribution identifiers '%@' Bailing.");
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.2()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Notice dispatch class doesn't respond to the expected selector.", v2, v3, v4, v5, v6);
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.3()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Missing notice dispatch and/or notice transmission classes from IMCore/IMSharedUtilities. Bailing.", v2, v3, v4, v5, v6);
}

- (void)_send:forAttributionIdentifiers:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_3_4(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Didn't find any handles for attribution identifiers '%@' Bailing.");
}

- (void)_send:forAttributionIdentifiers:reply:.cold.2()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Notice dispatch class doesn't respond to the expected selector.", v2, v3, v4, v5, v6);
}

- (void)_send:forAttributionIdentifiers:reply:.cold.3()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Missing notice dispatch and/or notice transmission classes from IMCore/IMSharedUtilities. Bailing.", v2, v3, v4, v5, v6);
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138412802;
  BOOL v9 = v7;
  __int16 v10 = 2048;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v8, 0x20u);
}

@end