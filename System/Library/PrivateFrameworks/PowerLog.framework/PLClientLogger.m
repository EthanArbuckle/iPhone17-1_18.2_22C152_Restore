@interface PLClientLogger
+ (BOOL)isMessageOnDeviceDisabled;
+ (id)sharedInstance;
- (BOOL)batchDropMessages;
- (BOOL)batchedTimerInFlight;
- (BOOL)clientDebug;
- (BOOL)forceBatching;
- (BOOL)talkToPowerlogHelper;
- (NSMutableArray)batchedTaskCache;
- (NSMutableDictionary)dynamicCache;
- (NSMutableDictionary)eventFilterSaved;
- (NSMutableDictionary)pendingTaskCache;
- (NSMutableDictionary)permissionCache;
- (NSSet)batchingClientAllowlist;
- (NSSet)batchingKeysAllowlist;
- (NSSet)curatedBatchingList;
- (NSString)processName;
- (OS_dispatch_queue)adaptivePermissionWorkQueue;
- (OS_dispatch_queue)batchFlushQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_queue)xpcConnectionHelperQueue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (OS_xpc_object)xpcConnection;
- (OS_xpc_object)xpcConnectionHelper;
- (PLClientLogger)init;
- (id)buildMessageForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)cacheForKey:(id)a3;
- (id)pendingTasksForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5;
- (id)queryForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)xpcConnectionWithClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)xpcSendMessageWithReply:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6;
- (int)batchMessagesSentCount;
- (int)batchSizeForClientID:(signed __int16)a3;
- (int)batchedDropMessageCount;
- (int)shouldLogNowForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5 withFilterInterval:(double)a6;
- (signed)blockedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withTimeout:(unint64_t)a6;
- (signed)cachedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5;
- (void)addToBatchedTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6;
- (void)addToPendingTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6;
- (void)batchTasksCacheFlush;
- (void)clearBatchedTaskCache;
- (void)clearBatchedTaskCachePPS;
- (void)clearCache;
- (void)init;
- (void)logForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (void)logLaterForClientID:(signed __int16)a3 withKey:(id)a4 withFilterInterval:(double)a5;
- (void)logStateCaches;
- (void)logWithCurrentDateForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (void)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 completion:(id)a6;
- (void)powerlogStateChanged;
- (void)sendBatchToPPS;
- (void)setAdaptivePermissionWorkQueue:(id)a3;
- (void)setBatchDropMessages:(BOOL)a3;
- (void)setBatchFlushQueue:(id)a3;
- (void)setBatchMessagesSentCount:(int)a3;
- (void)setBatchedDropMessageCount:(int)a3;
- (void)setBatchedTaskCache:(id)a3;
- (void)setBatchedTimerInFlight:(BOOL)a3;
- (void)setCachePermission:(signed __int16)a3 ForClientID:(signed __int16)a4 withKey:(id)a5 withType:(id)a6;
- (void)setClientDebug:(BOOL)a3;
- (void)setDynamicCache:(id)a3;
- (void)setEventFilterSaved:(id)a3;
- (void)setForceBatching:(BOOL)a3;
- (void)setPendingTaskCache:(id)a3;
- (void)setPermissionCache:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setTalkToPowerlogHelper:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcConnectionHelper:(id)a3;
- (void)setXpcConnectionHelperQueue:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)xpcSendMessage:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6;
- (void)xpcSendMessageWithRateLimitingforClient:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
@end

@implementation PLClientLogger

void __32__PLClientLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1A622E6D0]();
  v1 = objc_alloc_init(PLClientLogger);
  v2 = (void *)sharedInstance__clientLogger;
  sharedInstance__clientLogger = (uint64_t)v1;
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:0];
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"shouldLog"];
  v3 = [*(id *)(a1 + 32) xpcSendMessageWithReply:v2 withClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:0];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    v4 = PLLogClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2();
    }
  }
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"shouldLog"];
    uint64_t v6 = [v5 shortValue];

    [*(id *)(a1 + 32) setCachePermission:v6 ForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withType:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setCachePermission:2 ForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withType:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    LODWORD(v6) = 3;
  }
  v7 = [*(id *)(a1 + 32) pendingTasksForType:*(void *)(a1 + 48) forClientID:*(__int16 *)(a1 + 64) forKey:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    v8 = PLLogClientLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *(__int16 *)(a1 + 64);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v27 = v16;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      v31 = v2;
      __int16 v32 = 2112;
      v33 = v3;
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_debug_impl(&dword_1A11A5000, v8, OS_LOG_TYPE_DEBUG, "permissionForClientID:%d withKey:%@ withType:%@\nquery=%@\n\nresult=%@\n\npending=%@", buf, 0x3Au);
    }
  }
  if (v6 == 1)
  {
    if ([*(id *)(a1 + 48) isEqualToString:@"Post"])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v19 = v3;
        v20 = v2;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if ([*(id *)(a1 + 32) clientDebug])
            {
              v15 = PLLogClientLogging();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v27 = v14;
                _os_log_debug_impl(&dword_1A11A5000, v15, OS_LOG_TYPE_DEBUG, "permissionForClientID: logging %@", buf, 0xCu);
              }
            }
            [*(id *)(a1 + 32) logForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
        v3 = v19;
        v2 = v20;
      }
LABEL_30:

      goto LABEL_31;
    }
    if ([*(id *)(a1 + 48) isEqualToString:@"Query"]
      && [*(id *)(a1 + 32) clientDebug])
    {
      v9 = PLLogClientLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1();
      }
      goto LABEL_30;
    }
  }
LABEL_31:
}

- (id)xpcSendMessageWithReply:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(PLClientLogger *)self clientDebug])
  {
    v13 = PLLogClientLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v39 = [(PLClientLogger *)self xpcConnectionWithClientID:v8 withKey:v11 withPayload:v12];
      int v41 = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v39;
      _os_log_debug_impl(&dword_1A11A5000, v13, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithReply: waiting for replay to message %@, xpcConnection=%@", (uint8_t *)&v41, 0x16u);
    }
  }
  uint64_t v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    v15 = [(PLClientLogger *)self xpcConnectionWithClientID:v8 withKey:v11 withPayload:v12];
    int v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

    if ([(PLClientLogger *)self clientDebug])
    {
      uint64_t v17 = PLLogClientLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v40 = [(PLClientLogger *)self xpcConnectionWithClientID:v8 withKey:v11 withPayload:v12];
        int v41 = 138412802;
        id v42 = v14;
        __int16 v43 = 2112;
        v44 = v16;
        __int16 v45 = 2112;
        v46 = v40;
        _os_log_debug_impl(&dword_1A11A5000, v17, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithReply: xpcMessage=%@, xpcResponse=%@, xpcConnection=%@", (uint8_t *)&v41, 0x20u);
      }
    }
    BOOL v18 = [(PLClientLogger *)self clientDebug];
    if (v16)
    {
      if (v18)
      {
        v19 = PLLogClientLogging();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.8();
        }
      }
      v20 = xpc_dictionary_get_value(v16, (const char *)[@"PLXPCConnectionReturnDict" UTF8String]);
      BOOL v21 = [(PLClientLogger *)self clientDebug];
      if (v20)
      {
        if (v21)
        {
          long long v22 = PLLogClientLogging();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.7();
          }
        }
        long long v23 = _CFXPCCreateCFObjectFromXPCMessage();
        long long v24 = [v23 objectForKeyedSubscript:@"PLXPCClientDebug"];

        if (v24)
        {
          v25 = [v23 objectForKeyedSubscript:@"PLXPCClientDebug"];
          uint64_t v26 = [v25 BOOLValue];

          v27 = PLLogClientLogging();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.6(v26, v27, v28, v29, v30, v31, v32, v33);
          }

          [(PLClientLogger *)self setClientDebug:v26];
        }
        BOOL v34 = [(PLClientLogger *)self clientDebug];
        if (v23)
        {
          if (v34)
          {
            v35 = PLLogClientLogging();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.5();
            }
          }
          long long v23 = v23;
          uint64_t v36 = v23;
        }
        else
        {
          if (v34)
          {
            v37 = PLLogClientLogging();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.4();
            }
          }
          uint64_t v36 = 0;
        }
LABEL_48:

        goto LABEL_49;
      }
      if (v21)
      {
        long long v23 = PLLogClientLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:]();
        }
        uint64_t v36 = 0;
        goto LABEL_48;
      }
LABEL_42:
      uint64_t v36 = 0;
LABEL_49:

      goto LABEL_50;
    }
    if (v18)
    {
      v20 = PLLogClientLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:]();
      }
      goto LABEL_42;
    }
  }
  else
  {
    if (![(PLClientLogger *)self clientDebug])
    {
      uint64_t v36 = 0;
      goto LABEL_51;
    }
    int v16 = PLLogClientLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:]();
    }
  }
  uint64_t v36 = 0;
LABEL_50:

LABEL_51:
  return v36;
}

- (id)pendingTasksForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_sync_enter(@"___CacheSync___");
  id v10 = [NSNumber numberWithShort:v6];
  id v11 = [(PLClientLogger *)self pendingTaskCache];
  id v12 = [v11 objectForKeyedSubscript:v8];
  v13 = [v12 objectForKeyedSubscript:v10];
  uint64_t v14 = [v13 objectForKeyedSubscript:v9];

  v15 = [(PLClientLogger *)self pendingTaskCache];
  int v16 = [v15 objectForKeyedSubscript:v8];
  uint64_t v17 = [v16 objectForKeyedSubscript:v10];
  [v17 removeObjectForKey:v9];

  objc_sync_exit(@"___CacheSync___");
  return v14;
}

- (void)addToPendingTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  v39[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_sync_enter(@"___CacheSync___");
  v13 = [NSNumber numberWithShort:v8];
  uint64_t v14 = [(PLClientLogger *)self pendingTaskCache];
  v15 = [v14 objectForKeyedSubscript:v10];

  if (!v15)
  {
    int v16 = objc_opt_new();
    uint64_t v17 = [(PLClientLogger *)self pendingTaskCache];
    [v17 setObject:v16 forKeyedSubscript:v10];
  }
  BOOL v18 = [(PLClientLogger *)self pendingTaskCache];
  v19 = [v18 objectForKeyedSubscript:v10];
  v20 = [v19 objectForKeyedSubscript:v13];

  if (!v20)
  {
    BOOL v21 = objc_opt_new();
    long long v22 = [(PLClientLogger *)self pendingTaskCache];
    long long v23 = [v22 objectForKeyedSubscript:v10];
    [v23 setObject:v21 forKeyedSubscript:v13];
  }
  long long v24 = [(PLClientLogger *)self pendingTaskCache];
  v25 = [v24 objectForKeyedSubscript:v10];
  uint64_t v26 = [v25 objectForKeyedSubscript:v13];
  v27 = [v26 objectForKeyedSubscript:v11];

  if (!v27)
  {
    uint64_t v28 = objc_opt_new();
    uint64_t v29 = [(PLClientLogger *)self pendingTaskCache];
    uint64_t v30 = [v29 objectForKeyedSubscript:v10];
    uint64_t v31 = [v30 objectForKeyedSubscript:v13];
    [v31 setObject:v28 forKeyedSubscript:v11];
  }
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v12 copyItems:1];
  uint64_t v33 = [(PLClientLogger *)self pendingTaskCache];
  BOOL v34 = [v33 objectForKeyedSubscript:v10];
  v35 = [v34 objectForKeyedSubscript:v13];
  uint64_t v36 = [v35 objectForKeyedSubscript:v11];
  [v36 addObject:v32];

  if ([(PLClientLogger *)self clientDebug])
  {
    v37 = PLLogClientLogging();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = [(PLClientLogger *)self pendingTaskCache];
      -[PLClientLogger addToPendingTaskCacheForType:forClientID:forKey:withPayload:](v38, (uint64_t)v39, v37);
    }
  }
  objc_sync_exit(@"___CacheSync___");
}

- (NSMutableDictionary)pendingTaskCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

uint64_t __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_215(uint64_t a1)
{
  [*(id *)(a1 + 32) batchTasksCacheFlush];
  [*(id *)(a1 + 32) sendBatchToPPS];
  [*(id *)(a1 + 32) clearCache];
  v2 = *(void **)(a1 + 32);
  return [v2 setBatchMessagesSentCount:0];
}

- (void)sendBatchToPPS
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(@"___BatchCacheSync___");
  uint64_t v6 = @"PLXPCBatchedMessage";
  v3 = [(PLClientLogger *)self dynamicCache];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  v5 = [(PLClientLogger *)self buildMessageForClientID:110 withKey:@"PPSBatchedMessages" withPayload:v4];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Post"];
  [(PLClientLogger *)self xpcSendMessage:v5 withClientID:110 withKey:@"PPSBatchedMessages" withPayload:v4];

  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)clearCache
{
  objc_sync_enter(@"___BatchCacheSync___");
  [(PLClientLogger *)self clearBatchedTaskCachePPS];
  [(PLClientLogger *)self clearBatchedTaskCache];
  [(PLClientLogger *)self setBatchedTimerInFlight:0];
  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)clearBatchedTaskCachePPS
{
  objc_sync_enter(@"___BatchCacheSync___");
  v3 = objc_opt_new();
  [(PLClientLogger *)self setDynamicCache:v3];

  v4 = objc_opt_new();
  v5 = [(PLClientLogger *)self dynamicCache];
  [v5 setObject:v4 forKeyedSubscript:@"kPLDefault"];

  uint64_t v6 = objc_opt_new();
  v7 = [(PLClientLogger *)self dynamicCache];
  [v7 setObject:v6 forKeyedSubscript:@"kPLCuratedBatchingListCache"];

  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)setDynamicCache:(id)a3
{
}

- (void)clearBatchedTaskCache
{
  objc_sync_enter(@"___BatchCacheSync___");
  v3 = objc_opt_new();
  [(PLClientLogger *)self setBatchedTaskCache:v3];

  [(PLClientLogger *)self setBatchedDropMessageCount:0];
  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)setBatchedTaskCache:(id)a3
{
}

- (void)batchTasksCacheFlush
{
  v8[2] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(@"___BatchCacheSync___");
  v7[0] = @"PLXPCBatchedMessage";
  v3 = [(PLClientLogger *)self batchedTaskCache];
  v7[1] = @"PLXPCBatchedMessageDropCounts";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  uint64_t v6 = [(PLClientLogger *)self buildMessageForClientID:51 withKey:@"MyEvent" withPayload:v5];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Post"];
  [(PLClientLogger *)self xpcSendMessage:v6 withClientID:51 withKey:@"MyEvent" withPayload:v5];

  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)xpcSendMessage:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(PLClientLogger *)self clientDebug])
  {
    v13 = PLLogClientLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:]();
    }
  }
  uint64_t v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    v15 = [(PLClientLogger *)self xpcConnectionWithClientID:v8 withKey:v11 withPayload:v12];
    xpc_connection_send_notification();
LABEL_10:

    goto LABEL_11;
  }
  if ([(PLClientLogger *)self clientDebug])
  {
    v15 = PLLogClientLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:]();
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (id)xpcConnectionWithClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 & 0xFFFFFFFD) == 0x30 || [(PLClientLogger *)self talkToPowerlogHelper])
  {
    p_xpcConnectionHelper = &self->_xpcConnectionHelper;
    xpcConnectionHelper = self->_xpcConnectionHelper;
    BOOL v12 = [(PLClientLogger *)self clientDebug];
    if (xpcConnectionHelper)
    {
      if (v12)
      {
        v13 = PLLogClientLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:](v6, v13, v14, v15, v16, v17, v18, v19);
        }
LABEL_33:
      }
    }
    else
    {
      if (v12)
      {
        v20 = PLLogClientLogging();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]((uint64_t)self, v6, v20);
        }
      }
      mach_service = xpc_connection_create_mach_service("com.apple.powerlogHelperd.XPCService.xpc", (dispatch_queue_t)self->_xpcConnectionQueue, 0);
      long long v22 = self->_xpcConnectionHelper;
      self->_xpcConnectionHelper = mach_service;

      long long v23 = self->_xpcConnectionHelper;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke;
      handler[3] = &unk_1E5A460B8;
      handler[4] = self;
      __int16 v52 = v6;
      id v50 = v8;
      id v51 = v9;
      xpc_connection_set_event_handler(v23, handler);
      xpc_connection_activate(self->_xpcConnectionHelper);
      if ([(PLClientLogger *)self clientDebug])
      {
        long long v24 = PLLogClientLogging();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]();
        }
      }
    }
  }
  else
  {
    p_xpcConnectionHelper = &self->_xpcConnection;
    xpcConnection = self->_xpcConnection;
    BOOL v26 = [(PLClientLogger *)self clientDebug];
    if (xpcConnection)
    {
      if (v26)
      {
        v27 = PLLogClientLogging();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.7();
        }
      }
    }
    else
    {
      if (v26)
      {
        uint64_t v28 = PLLogClientLogging();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.6();
        }
      }
      uint64_t v29 = xpc_connection_create_mach_service("com.apple.powerlog.plxpclogger.xpc", (dispatch_queue_t)self->_xpcConnectionQueue, 0);
      uint64_t v30 = self->_xpcConnection;
      self->_xpcConnection = v29;

      uint64_t v31 = self->_xpcConnection;
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      __int16 v43 = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_178;
      v44 = &unk_1E5A460B8;
      __int16 v45 = self;
      __int16 v48 = v6;
      id v46 = v8;
      id v47 = v9;
      xpc_connection_set_event_handler(v31, &v41);
      xpc_connection_activate(self->_xpcConnection);
      if ([(PLClientLogger *)self clientDebug])
      {
        uint64_t v32 = PLLogClientLogging();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.5();
        }
      }
    }
    if ([(PLClientLogger *)self clientDebug])
    {
      v13 = PLLogClientLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.4((uint64_t)p_xpcConnectionHelper, v13, v33, v34, v35, v36, v37, v38);
      }
      goto LABEL_33;
    }
  }
  v39 = *p_xpcConnectionHelper;

  return v39;
}

- (PLClientLogger)init
{
  v54.receiver = self;
  v54.super_class = (Class)PLClientLogger;
  v2 = [(PLClientLogger *)&v54 init];
  v3 = v2;
  if (v2)
  {
    disableMessageOnDevice = 0;
    v2->_talkToPowerlogHelper = 0;
    v4 = PLLogClientLogging();
    v3->_clientDebug = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v7 = dispatch_queue_create("PLClientLoggingWorkQueue", v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("PLClientLoggingAdaptivePermissionWorkQueue", v9);
    adaptivePermissionWorkQueue = v3->_adaptivePermissionWorkQueue;
    v3->_adaptivePermissionWorkQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("PLClientLoggingFlushQueue", v6);
    batchFlushQueue = v3->_batchFlushQueue;
    v3->_batchFlushQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v15 = [v14 processName];
    processName = v3->_processName;
    v3->_processName = (NSString *)v15;

    uint64_t v17 = objc_opt_new();
    permissionCache = v3->_permissionCache;
    v3->_permissionCache = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    pendingTaskCache = v3->_pendingTaskCache;
    v3->_pendingTaskCache = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    batchedTaskCache = v3->_batchedTaskCache;
    v3->_batchedTaskCache = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    dynamicCache = v3->_dynamicCache;
    v3->_dynamicCache = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    [(NSMutableDictionary *)v3->_dynamicCache setObject:v25 forKeyedSubscript:@"kPLDefault"];

    BOOL v26 = objc_opt_new();
    [(NSMutableDictionary *)v3->_dynamicCache setObject:v26 forKeyedSubscript:@"kPLCuratedBatchingListCache"];

    uint64_t v27 = objc_opt_new();
    eventFilterSaved = v3->_eventFilterSaved;
    v3->_eventFilterSaved = (NSMutableDictionary *)v27;

    *(_WORD *)&v3->_batchedTimerInFlight = 0;
    v3->_batchedDropMessageCount = 0;
    v3->_batchDropMessages = 1;
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EF450790, &unk_1EF4507A8, &unk_1EF4507C0, &unk_1EF4507D8, &unk_1EF4507F0, &unk_1EF450808, &unk_1EF450820, &unk_1EF450838, &unk_1EF450850, &unk_1EF450868, &unk_1EF450880, 0);
    batchingClientAllowlist = v3->_batchingClientAllowlist;
    v3->_batchingClientAllowlist = (NSSet *)v29;

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"BackgroundProcessing::FeatureCheckpoint", @"BackgroundProcessing::SystemConditionsBattery", @"BackgroundProcessing::SystemConditionsInUseOrMotion", @"BackgroundProcessing::SystemConditionsNetwork", @"BackgroundProcessing::SystemConditionsOther", @"BackgroundProcessing::SystemConditionsPowerManagement", @"BackgroundProcessing::TaskCheckpoint", @"BackgroundProcessing::TaskWorkload", @"GenerativeFunctionMetrics::SmartReplySession", @"GenerativeFunctionMetrics::Summarization", @"GenerativeFunctionMetrics::appleDiffusion", @"GenerativeFunctionMetrics::assetLoad", @"GenerativeFunctionMetrics::mmExecuteRequest", @"GenerativeFunctionMetrics::tgiExecuteRequest", @"BatteryIntelligence::BatteryHealthDelta", @"XPCMetrics::OngoingRestore", 0);
    curatedBatchingList = v3->_curatedBatchingList;
    v3->_curatedBatchingList = (NSSet *)v31;

    v3->_batchMessagesSentCount = 0;
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ConfigMetrics::BuddyData", @"ApplicationMetrics::RemoteControlSession", @"Button::CaptureButtonAction", @"Button::CaptureButtonConfig", 0);
    batchingKeysAllowlist = v3->_batchingKeysAllowlist;
    v3->_batchingKeysAllowlist = (NSSet *)v33;

    uint64_t v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create("PLCLientLoggingConnectionQueue", v35);
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v36;

    uint64_t v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v39 = dispatch_queue_create("PLCLientLoggingConnectionHelperQueue", v38);
    xpcConnectionHelperQueue = v3->_xpcConnectionHelperQueue;
    v3->_xpcConnectionHelperQueue = (OS_dispatch_queue *)v39;

    int out_token = -1;
    uint64_t v41 = [(PLClientLogger *)v3 workQueue];
    LODWORD(v38) = notify_register_dispatch("com.apple.powerlog.state_changed", &out_token, v41, &__block_literal_global_119);

    if (v38 && [(PLClientLogger *)v3 clientDebug])
    {
      uint64_t v42 = PLLogClientLogging();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init]();
      }
    }
    [NSString stringWithFormat:@"%@.ProcessName.%@", @"com.apple.powerlog.state_changed", v3->_processName];
    int v52 = -1;
    id v43 = objc_claimAutoreleasedReturnValue();
    v44 = (const char *)[v43 UTF8String];
    __int16 v45 = [(PLClientLogger *)v3 workQueue];
    LODWORD(v44) = notify_register_dispatch(v44, &v52, v45, &__block_literal_global_129);

    if (v44 && [(PLClientLogger *)v3 clientDebug])
    {
      id v46 = PLLogClientLogging();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init]();
      }
    }
    int v51 = -1;
    id v47 = [(PLClientLogger *)v3 workQueue];
    uint32_t v48 = notify_register_dispatch("com.apple.powerlog.clientPermissionState", &v51, v47, &__block_literal_global_133);

    if (v48 && [(PLClientLogger *)v3 clientDebug])
    {
      v49 = PLLogClientLogging();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init]();
      }
    }
  }
  return v3;
}

- (void)addToBatchedTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  uint64_t v9 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_sync_enter(@"___BatchCacheSync___");
  if (v9 != 110)
  {
    uint64_t v14 = [(PLClientLogger *)self batchedTaskCache];
LABEL_5:
    int v15 = [(PLClientLogger *)self batchSizeForClientID:v9];
    if (v9 != 110) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  uint64_t v14 = [(PLClientLogger *)self cacheForKey:v12];
  uint64_t v6 = [(PLClientLogger *)self curatedBatchingList];
  if (([v6 containsObject:v12] & 1) == 0) {
    goto LABEL_5;
  }
  int v15 = 30;
LABEL_6:

  uint64_t v16 = [(PLClientLogger *)self curatedBatchingList];
  int v17 = [v16 containsObject:v12];

  if (v17)
  {
    if ([(PLClientLogger *)self batchDropMessages]
      && [v14 count] >= (unint64_t)v15)
    {
      if ([(PLClientLogger *)self batchMessagesSentCount] < 4)
      {
        uint64_t v23 = PLLogClientLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1A11A5000, v23, OS_LOG_TYPE_INFO, "Dynamic cache reached the limit, flushing cache now", (uint8_t *)&v26, 2u);
        }

        [(PLClientLogger *)self setBatchMessagesSentCount:[(PLClientLogger *)self batchMessagesSentCount] + 1];
        [(PLClientLogger *)self sendBatchToPPS];
        [(PLClientLogger *)self clearBatchedTaskCachePPS];
        [(PLClientLogger *)self cacheForKey:v12];
        uint64_t v14 = v18 = v14;
      }
      else
      {
        uint64_t v18 = [v14 lastObject];
        uint64_t v19 = PLLogClientLogging();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          uint64_t v27 = v18;
          _os_log_impl(&dword_1A11A5000, v19, OS_LOG_TYPE_INFO, "Dynamic cache reached the limit, unable to flush, dropping last event %@", (uint8_t *)&v26, 0xCu);
        }

        if ([v12 isEqualToString:@"XPCMetrics::OngoingRestore"]) {
          AnalyticsSendEventLazy();
        }
        [v14 removeLastObject];
      }
    }
    goto LABEL_27;
  }
LABEL_15:
  if ([(PLClientLogger *)self batchDropMessages]
    && [v14 count] >= (unint64_t)v15)
  {
    v20 = PLLogClientLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v14 lastObject];
      int v26 = 138412290;
      uint64_t v27 = v21;
      _os_log_impl(&dword_1A11A5000, v20, OS_LOG_TYPE_INFO, "Hit the cache limit, dropping last event:  %@", (uint8_t *)&v26, 0xCu);
    }
    [v14 removeLastObject];
    if (v9 == 110) {
      uint64_t v22 = [(PLClientLogger *)self batchedDropMessageCount];
    }
    else {
      uint64_t v22 = [(PLClientLogger *)self batchedDropMessageCount] + 1;
    }
    [(PLClientLogger *)self setBatchedDropMessageCount:v22];
  }
LABEL_27:
  long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v13 copyItems:1];
  v25 = [(PLClientLogger *)self buildMessageForClientID:v9 withKey:v12 withPayload:v24];
  [v25 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Post"];
  [v14 addObject:v25];

  objc_sync_exit(@"___BatchCacheSync___");
}

- (NSSet)curatedBatchingList
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (id)buildMessageForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_sync_enter(@"___BuildMessageSync___");
  dispatch_queue_t v10 = objc_opt_new();
  id v11 = [NSNumber numberWithShort:v6];
  [v10 setObject:v11 forKeyedSubscript:@"clientID"];

  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"event"];
  }
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:@"content"];
  }
  id v12 = [(PLClientLogger *)self processName];
  [v10 setObject:v12 forKeyedSubscript:@"process-name"];

  if ([(PLClientLogger *)self clientDebug])
  {
    id v13 = PLLogClientLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger buildMessageForClientID:withKey:withPayload:]();
    }
  }
  objc_sync_exit(@"___BuildMessageSync___");

  return v10;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)xpcSendMessageWithRateLimitingforClient:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t v10 = [(PLClientLogger *)self batchingClientAllowlist];
  id v11 = [NSNumber numberWithShort:v6];
  int v12 = [v10 containsObject:v11];

  id v13 = [(PLClientLogger *)self batchingKeysAllowlist];
  int v14 = [v13 containsObject:v8];

  BOOL v15 = [(PLClientLogger *)self talkToPowerlogHelper];
  if ([(PLClientLogger *)self forceBatching] || !(v15 | v14 | v12))
  {
    if ([(PLClientLogger *)self clientDebug])
    {
      uint64_t v18 = PLLogClientLogging();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcSendMessageWithRateLimitingforClient:withKey:withPayload:]();
      }
    }
    objc_sync_enter(@"___BatchCacheSync___");
    if (![(PLClientLogger *)self batchedTimerInFlight])
    {
      [(PLClientLogger *)self setBatchedTimerInFlight:1];
      dispatch_time_t v19 = dispatch_time(0, 5000000000);
      v20 = [(PLClientLogger *)self batchFlushQueue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_215;
      v22[3] = &unk_1E5A45DA0;
      v22[4] = self;
      dispatch_after(v19, v20, v22);
    }
    objc_sync_exit(@"___BatchCacheSync___");
    [(PLClientLogger *)self addToBatchedTaskCacheForType:@"Post" forClientID:v6 forKey:v8 withPayload:v9];
  }
  else
  {
    if (v6 == 58)
    {
      uint64_t v16 = [(PLClientLogger *)self getWorkQueueForClientID:58];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke;
      block[3] = &unk_1E5A46158;
      block[4] = self;
      __int16 v30 = 58;
      id v28 = v8;
      id v29 = v9;
      dispatch_async_and_wait(v16, block);

      int v17 = v28;
    }
    else
    {
      uint64_t v21 = [(PLClientLogger *)self getWorkQueueForClientID:v6];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_214;
      v23[3] = &unk_1E5A46158;
      v23[4] = self;
      __int16 v26 = v6;
      id v24 = v8;
      id v25 = v9;
      dispatch_async(v21, v23);

      int v17 = v24;
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance__clientLogger;
  return v2;
}

+ (BOOL)isMessageOnDeviceDisabled
{
  if (isMessageOnDeviceDisabled_onceToken != -1) {
    dispatch_once(&isMessageOnDeviceDisabled_onceToken, &__block_literal_global_4_0);
  }
  return disableMessageOnDevice;
}

- (void)logForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if (v9 && (uint64_t v10 = [v9 count], v8) && v10 && objc_msgSend(v8, "length"))
  {
    if (v6 == 110) {
      goto LABEL_29;
    }
    int v11 = [(PLClientLogger *)self blockedPermissionForClientID:v6 withKey:v8 withType:@"Post" withTimeout:0];
    if (!v11) {
      goto LABEL_17;
    }
    int v12 = v11;
    if (v11 == 1)
    {
LABEL_29:
      if ([(PLClientLogger *)self clientDebug])
      {
        BOOL v15 = PLLogClientLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 67109634;
          int v18 = v6;
          __int16 v19 = 2112;
          *(void *)v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(void *)&v20[10] = v9;
          _os_log_debug_impl(&dword_1A11A5000, v15, OS_LOG_TYPE_DEBUG, "logForClientID: sending xpc message for client id: %d withKey:%@ withPayload:%@ dispatching...", (uint8_t *)&v17, 0x1Cu);
        }
      }
      [(PLClientLogger *)self xpcSendMessageWithRateLimitingforClient:v6 withKey:v8 withPayload:v9];
    }
    else if (v11 == 3)
    {
      if ([(PLClientLogger *)self clientDebug])
      {
        id v13 = PLLogClientLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 67109634;
          int v18 = v6;
          __int16 v19 = 2112;
          *(void *)v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(void *)&v20[10] = v9;
          _os_log_debug_impl(&dword_1A11A5000, v13, OS_LOG_TYPE_DEBUG, "logForClientID: %d withKey:%@ withPayload:%@ caching...", (uint8_t *)&v17, 0x1Cu);
        }
      }
      [(PLClientLogger *)self addToPendingTaskCacheForType:@"Post" forClientID:v6 forKey:v8 withPayload:v9];
    }
    else if ([(PLClientLogger *)self clientDebug])
    {
      uint64_t v16 = PLLogClientLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 67109890;
        int v18 = v12;
        __int16 v19 = 1024;
        *(_DWORD *)v20 = v6;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v8;
        *(_WORD *)&v20[14] = 2112;
        *(void *)&v20[16] = v9;
        _os_log_debug_impl(&dword_1A11A5000, v16, OS_LOG_TYPE_DEBUG, "logForClientID: Unknown Permission %d - for client id:%d withKey:%@ withPayload:%@", (uint8_t *)&v17, 0x22u);
      }
    }
  }
  else
  {
    int v14 = PLLogClientLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger logForClientID:withKey:withPayload:]();
    }
  }
LABEL_17:
}

- (signed)blockedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withTimeout:(unint64_t)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  __int16 v22 = 3;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke;
  v16[3] = &unk_1E5A46108;
  int v18 = &v19;
  id v13 = v12;
  int v17 = v13;
  [(PLClientLogger *)self permissionForClientID:v8 withKey:v10 withType:v11 completion:v16];
  dispatch_time_t v14 = dispatch_time(0, a6);
  dispatch_semaphore_wait(v13, v14);
  LOWORD(a6) = *((_WORD *)v20 + 12);

  _Block_object_dispose(&v19, 8);
  return a6;
}

- (void)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(PLClientLogger *)self cachedPermissionForClientID:v8 withKey:v10 withType:v11];
  if ([(PLClientLogger *)self clientDebug])
  {
    dispatch_time_t v14 = PLLogClientLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v29 = v8;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 1024;
      int v35 = v13;
      _os_log_debug_impl(&dword_1A11A5000, v14, OS_LOG_TYPE_DEBUG, "permissionForClientID: permissionForClientId: %hd withKey:%@ withType:%@ returnValue=%hd", buf, 0x22u);
    }
  }
  if (v13 == 2)
  {
    [(PLClientLogger *)self setCachePermission:3 ForClientID:v8 withKey:v10 withType:v11];
    BOOL v15 = [(PLClientLogger *)self adaptivePermissionWorkQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke;
    block[3] = &unk_1E5A460E0;
    block[4] = self;
    __int16 v27 = v8;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    dispatch_async(v15, block);
  }
  else
  {
    if ([(PLClientLogger *)self clientDebug])
    {
      uint64_t v16 = PLLogClientLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger permissionForClientID:withKey:withType:completion:](v13, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v13);
  }
}

- (signed)cachedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [NSNumber numberWithShort:v6];
  objc_sync_enter(@"___CacheSync___");
  if ([(PLClientLogger *)self clientDebug])
  {
    id v11 = PLLogClientLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(PLClientLogger *)self permissionCache];
      -[PLClientLogger cachedPermissionForClientID:withKey:withType:](v12, (uint64_t)v61, v11);
    }
  }
  uint64_t v13 = [(PLClientLogger *)self permissionCache];
  dispatch_time_t v14 = [v13 objectForKeyedSubscript:v9];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = [(PLClientLogger *)self permissionCache];
    [v17 setObject:v16 forKeyedSubscript:v9];
  }
  uint64_t v18 = [(PLClientLogger *)self permissionCache];
  uint64_t v19 = [v18 objectForKeyedSubscript:v9];
  uint64_t v20 = [v19 objectForKeyedSubscript:v10];
  BOOL v21 = v20 == 0;

  if (v21)
  {
    context = (void *)MEMORY[0x1A622E6D0]();
    uint64_t v22 = [NSString stringWithFormat:@"%@.ClientID.%d", @"com.apple.powerlog.state_changed", (int)v6];
    if ([(PLClientLogger *)self clientDebug])
    {
      uint64_t v23 = PLLogClientLogging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:]();
      }
    }
    out_token[0] = -1;
    id v24 = v22;
    id v25 = (const char *)[v24 UTF8String];
    id v26 = [(PLClientLogger *)self workQueue];
    LODWORD(v25) = notify_register_dispatch(v25, out_token, v26, &__block_literal_global_158);

    __int16 v27 = objc_opt_new();
    id v28 = [(PLClientLogger *)self permissionCache];
    int v29 = [v28 objectForKeyedSubscript:v9];
    [v29 setObject:v27 forKeyedSubscript:v10];

    if (v25)
    {
      if (![(PLClientLogger *)self clientDebug])
      {
LABEL_18:

        goto LABEL_19;
      }
      __int16 v30 = PLLogClientLogging();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:]();
      }
    }
    else
    {
      __int16 v30 = [NSNumber numberWithInt:out_token[0]];
      id v31 = [(PLClientLogger *)self permissionCache];
      __int16 v32 = [v31 objectForKeyedSubscript:v9];
      id v33 = [v32 objectForKeyedSubscript:v10];
      [v33 setObject:v30 forKeyedSubscript:@"PLClientPermissionToken"];
    }
    goto LABEL_18;
  }
LABEL_19:
  if ([(PLClientLogger *)self clientDebug])
  {
    __int16 v34 = PLLogClientLogging();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v49 = [(PLClientLogger *)self permissionCache];
      id v50 = [v49 objectForKeyedSubscript:v9];
      int v51 = [v50 objectForKeyedSubscript:v10];
      int v52 = [v51 objectForKeyedSubscript:v8];
      out_token[0] = 67109890;
      out_token[1] = v6;
      __int16 v55 = 2112;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v9;
      __int16 v59 = 2112;
      v60 = v52;
      _os_log_debug_impl(&dword_1A11A5000, v34, OS_LOG_TYPE_DEBUG, "cachePermissionForClientID: %d withKey:%@ withType:%@ - Return=%@", (uint8_t *)out_token, 0x26u);
    }
  }
  int v35 = [(PLClientLogger *)self permissionCache];
  uint64_t v36 = [v35 objectForKeyedSubscript:v9];
  uint64_t v37 = [v36 objectForKeyedSubscript:v10];
  uint64_t v38 = [v37 objectForKeyedSubscript:v8];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    v40 = [(PLClientLogger *)self permissionCache];
    uint64_t v41 = [v40 objectForKeyedSubscript:v9];
    uint64_t v42 = [v41 objectForKeyedSubscript:v10];
    [v42 setObject:&unk_1EF450898 forKeyedSubscript:v8];
  }
  id v43 = [(PLClientLogger *)self permissionCache];
  v44 = [v43 objectForKeyedSubscript:v9];
  __int16 v45 = [v44 objectForKeyedSubscript:v10];
  id v46 = [v45 objectForKeyedSubscript:v8];
  signed __int16 v47 = [v46 shortValue];

  objc_sync_exit(@"___CacheSync___");
  return v47;
}

- (BOOL)clientDebug
{
  return self->_clientDebug;
}

- (NSMutableDictionary)permissionCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

intptr_t __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke(uint64_t a1, __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)talkToPowerlogHelper
{
  return self->_talkToPowerlogHelper;
}

- (BOOL)forceBatching
{
  return self->_forceBatching;
}

- (NSSet)batchingKeysAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (NSSet)batchingClientAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)batchedTimerInFlight
{
  return self->_batchedTimerInFlight;
}

- (BOOL)batchDropMessages
{
  return self->_batchDropMessages;
}

- (int)batchSizeForClientID:(signed __int16)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLClientLogger_batchSizeForClientID___block_invoke;
  block[3] = &__block_descriptor_34_e5_v8__0l;
  signed __int16 v5 = a3;
  if (batchSizeForClientID__onceToken != -1) {
    dispatch_once(&batchSizeForClientID__onceToken, block);
  }
  if (batchSizeForClientID__batchSize) {
    return 60;
  }
  else {
    return 20;
  }
}

- (NSMutableArray)batchedTaskCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (id)cacheForKey:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"___BatchCacheSync___");
  signed __int16 v5 = [(PLClientLogger *)self curatedBatchingList];
  int v6 = [v5 containsObject:v4];

  dispatch_queue_t v7 = [(PLClientLogger *)self dynamicCache];
  if (v6) {
    [v7 objectForKeyedSubscript:@"kPLCuratedBatchingListCache"];
  }
  else {
  id v8 = [v7 objectForKeyedSubscript:@"kPLDefault"];
  }

  objc_sync_exit(@"___BatchCacheSync___");
  return v8;
}

- (NSMutableDictionary)dynamicCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatchedTimerInFlight:(BOOL)a3
{
  self->_batchedTimerInFlight = a3;
}

- (OS_dispatch_queue)batchFlushQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatchedDropMessageCount:(int)a3
{
  self->_batchedDropMessageCount = a3;
}

- (int)batchedDropMessageCount
{
  return self->_batchedDropMessageCount;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachePermission:(signed __int16)a3 ForClientID:(signed __int16)a4 withKey:(id)a5 withType:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if ([(PLClientLogger *)self clientDebug])
  {
    id v12 = PLLogClientLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18[0] = 67109890;
      v18[1] = v8;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_debug_impl(&dword_1A11A5000, v12, OS_LOG_TYPE_DEBUG, "setCachePermission:%d ForClientID:%d withKey:%@ withType:%@", (uint8_t *)v18, 0x22u);
    }
  }
  objc_sync_enter(@"___CacheSync___");
  uint64_t v13 = [NSNumber numberWithShort:v8];
  dispatch_time_t v14 = [(PLClientLogger *)self permissionCache];
  BOOL v15 = [v14 objectForKeyedSubscript:v11];
  uint64_t v16 = [NSNumber numberWithShort:v7];
  uint64_t v17 = [v15 objectForKeyedSubscript:v16];
  [v17 setObject:v13 forKeyedSubscript:v10];

  objc_sync_exit(@"___CacheSync___");
}

- (OS_dispatch_queue)adaptivePermissionWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBatchMessagesSentCount:(int)a3
{
  self->_batchMessagesSentCount = a3;
}

void __43__PLClientLogger_isMessageOnDeviceDisabled__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  disableMessageOnDevice = v1 == -1;
}

uint64_t __39__PLClientLogger_batchSizeForClientID___block_invoke(uint64_t result)
{
  batchSizeForClientID__batchSize = *(unsigned __int16 *)(result + 32) == 28;
  return result;
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_214(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Post"];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    v3 = PLLogClientLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = *(__int16 *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 67109634;
      int v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      BOOL v15 = v2;
      _os_log_debug_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_DEBUG, "XPC Send Message - not batched xpcSendMessageWithRateLimitingforClient: %d withKey:%@ message %@", (uint8_t *)&v10, 0x1Cu);
    }
  }
  [*(id *)(a1 + 32) xpcSendMessage:v2 withClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    id v4 = PLLogClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(__int16 *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(a1 + 48);
      int v10 = 67109634;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      BOOL v15 = v9;
      _os_log_debug_impl(&dword_1A11A5000, v4, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithRateLimitingforClient: %d withKey:%@ withPayload:%@ sent!", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __22__PLClientLogger_init__block_invoke()
{
  id v0 = +[PLClientLogger sharedInstance];
  [v0 powerlogStateChanged];
}

void __22__PLClientLogger_init__block_invoke_127()
{
  id v0 = +[PLClientLogger sharedInstance];
  [v0 powerlogStateChanged];
}

void __22__PLClientLogger_init__block_invoke_131()
{
  id v0 = +[PLClientLogger sharedInstance];
  [v0 logStateCaches];
}

- (void)logStateCaches
{
  v2 = [a1 processName];
  v3 = [a1 permissionCache];
  id v4 = [a1 pendingTaskCache];
  int v5 = [a1 batchedTaskCache];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_11_0(&dword_1A11A5000, v6, v7, "State:%@ ***\npermissionCache=%@\n\npendingTaskCache=%@\n\nbatchedTaskCache=%@\n", v8, v9, v10, v11, v12);
}

- (void)powerlogStateChanged
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "powerlogStateChanged: Powerlog state changed", v2, v3, v4, v5, v6);
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1A622E6D0]();
  if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.ClientID.%@", @"com.apple.powerlog.state_changed", v3];
    uint8_t v6 = PLLogClientLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1();
    }
  }
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"PLClientPermissionToken"];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"PLClientPermissionToken"];
    notify_cancel([v10 intValue]);
  }
}

void __63__PLClientLogger_cachedPermissionForClientID_withKey_withType___block_invoke()
{
  id v0 = +[PLClientLogger sharedInstance];
  [v0 powerlogStateChanged];
}

void *__78__PLClientLogger_addToBatchedTaskCacheForType_forClientID_forKey_withPayload___block_invoke()
{
  return &unk_1EF450B58;
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v4 = PLLogClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [*(id *)(a1 + 32) xpcConnectionWithClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
      v12[0] = 67109378;
      v12[1] = xpc_connection_get_pid(v11);
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_debug_impl(&dword_1A11A5000, v4, OS_LOG_TYPE_DEBUG, "xpcConnectionWithClientID: Event handler fired peerPID=%d %@", (uint8_t *)v12, 0x12u);
    }
  }
  uint64_t v5 = MEMORY[0x1A622EBB0](v3);
  uint64_t v6 = MEMORY[0x1E4F145A8];
  int v7 = [*(id *)(a1 + 32) clientDebug];
  if (v5 == v6)
  {
    if (v7)
    {
      uint64_t v9 = PLLogClientLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2();
      }
    }
    if (v3 == (id)MEMORY[0x1E4F14528])
    {
      if ([*(id *)(a1 + 32) clientDebug])
      {
        uint64_t v10 = PLLogClientLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();
        }
      }
      disableMessageOnDevice = 1;
    }
  }
  else if (v7)
  {
    uint64_t v8 = PLLogClientLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3();
    }
  }
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v4 = PLLogClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [*(id *)(a1 + 32) xpcConnectionWithClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
      v8[0] = 67109378;
      v8[1] = xpc_connection_get_pid(v7);
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_debug_impl(&dword_1A11A5000, v4, OS_LOG_TYPE_DEBUG, "xpcConnectionWithClientID: event handler fired peerPID=%d %@", (uint8_t *)v8, 0x12u);
    }
  }
  if (MEMORY[0x1A622EBB0](v3) == MEMORY[0x1E4F145A8])
  {
    if (v3 == (id)MEMORY[0x1E4F14528])
    {
      if ([*(id *)(a1 + 32) clientDebug])
      {
        uint64_t v6 = PLLogClientLogging();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();
        }
      }
      disableMessageOnDevice = 1;
    }
  }
  else if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v5 = PLLogClientLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_178_cold_2();
    }
  }
}

- (void)logWithCurrentDateForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  if (a4 && a5)
  {
    uint64_t v6 = a3;
    id v8 = a4;
    id v10 = (id)[a5 mutableCopy];
    __int16 v9 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setObject:v9 forKey:@"__pl_internal_timeSensitiveSystemDate"];

    [(PLClientLogger *)self logForClientID:v6 withKey:v8 withPayload:v10];
  }
}

- (int)shouldLogNowForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5 withFilterInterval:(double)a6
{
  int v43 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  uint8_t v12 = [NSString stringWithFormat:@"%d_%@", v43, v9];
  objc_sync_enter(@"___sFilterByIntervalBufferSync___");
  __int16 v13 = [(PLClientLogger *)self eventFilterSaved];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (!v14)
  {
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = [(PLClientLogger *)self eventFilterSaved];
    [v16 setObject:v15 forKeyedSubscript:v12];
  }
  uint64_t v17 = [(PLClientLogger *)self eventFilterSaved];
  uint64_t v18 = [v17 objectForKeyedSubscript:v12];
  __int16 v19 = [v18 objectForKeyedSubscript:@"lastEventDate"];

  if ([(PLClientLogger *)self clientDebug])
  {
    int v20 = PLLogClientLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v46 = v43;
      __int16 v47 = 2112;
      id v48 = v9;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      id v52 = v10;
      _os_log_debug_impl(&dword_1A11A5000, v20, OS_LOG_TYPE_DEBUG, "shouldLogNowForClientID: (PLLogRegisteredEventFilterByInterval) Check(%d, %@ at %@) - %@\n", buf, 0x26u);
    }

    if (!v19)
    {
      if (v10) {
        goto LABEL_20;
      }
LABEL_24:
      if ([(PLClientLogger *)self clientDebug])
      {
        uint64_t v36 = PLLogClientLogging();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          int v46 = v43;
          __int16 v47 = 2112;
          id v48 = v9;
          __int16 v49 = 2112;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = 0;
          _os_log_debug_impl(&dword_1A11A5000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) Drop invalid(%d, %@ at %@) - %@\n", buf, 0x26u);
        }
        int v29 = 3;
        goto LABEL_34;
      }
      int v29 = 3;
      goto LABEL_35;
    }
    __int16 v21 = PLLogClientLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:]();
    }

    id v22 = PLLogClientLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:]();
    }

    __int16 v23 = PLLogClientLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      [v11 timeIntervalSinceDate:v19];
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:](v44, v23, v24, a6);
    }
  }
  if (!v10) {
    goto LABEL_24;
  }
  if (v19)
  {
    [v11 timeIntervalSinceDate:v19];
    if (v25 < a6)
    {
      id v26 = [(PLClientLogger *)self eventFilterSaved];
      __int16 v27 = [v26 objectForKeyedSubscript:v12];
      id v28 = [v27 objectForKeyedSubscript:@"bufferedEventDictionary"];

      if (v28)
      {
        int v29 = 2;
      }
      else
      {
        uint64_t v37 = [(PLClientLogger *)self eventFilterSaved];
        uint64_t v38 = [v37 objectForKeyedSubscript:v12];
        [v38 setObject:v11 forKeyedSubscript:@"bufferedEventDate"];

        int v29 = 1;
      }
      BOOL v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v10 copyItems:1];
      v40 = [(PLClientLogger *)self eventFilterSaved];
      uint64_t v41 = [v40 objectForKeyedSubscript:v12];
      [v41 setObject:v39 forKeyedSubscript:@"bufferedEventDictionary"];

      if ([(PLClientLogger *)self clientDebug])
      {
        uint64_t v36 = PLLogClientLogging();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          int v46 = v43;
          __int16 v47 = 2112;
          id v48 = v9;
          __int16 v49 = 2112;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = v10;
          _os_log_debug_impl(&dword_1A11A5000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) Buffer(%d, %@ at %@) - %@\n", buf, 0x26u);
        }
LABEL_34:

        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
LABEL_20:
  __int16 v30 = [(PLClientLogger *)self eventFilterSaved];
  id v31 = [v30 objectForKeyedSubscript:v12];
  [v31 setObject:v11 forKeyedSubscript:@"lastEventDate"];

  __int16 v32 = [(PLClientLogger *)self eventFilterSaved];
  id v33 = [v32 objectForKeyedSubscript:v12];
  [v33 removeObjectForKey:@"bufferedEventDictionary"];

  __int16 v34 = [(PLClientLogger *)self eventFilterSaved];
  int v35 = [v34 objectForKeyedSubscript:v12];
  [v35 removeObjectForKey:@"bufferedEventDate"];

  if ([(PLClientLogger *)self clientDebug])
  {
    uint64_t v36 = PLLogClientLogging();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v46 = v43;
      __int16 v47 = 2112;
      id v48 = v9;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      id v52 = v10;
      _os_log_debug_impl(&dword_1A11A5000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval)  Log(%d, %@ at %@) - %@\n", buf, 0x26u);
    }
    int v29 = 0;
    goto LABEL_34;
  }
  int v29 = 0;
LABEL_35:

  objc_sync_exit(@"___sFilterByIntervalBufferSync___");
  return v29;
}

- (void)logLaterForClientID:(signed __int16)a3 withKey:(id)a4 withFilterInterval:(double)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  if ([(PLClientLogger *)self clientDebug])
  {
    id v9 = PLLogClientLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger logLaterForClientID:withKey:withFilterInterval:](v9);
    }
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  uint64_t v11 = [(PLClientLogger *)self getWorkQueueForClientID:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke;
  v13[3] = &unk_1E5A46130;
  __int16 v16 = v6;
  v13[4] = self;
  id v14 = v8;
  double v15 = a5;
  id v12 = v8;
  dispatch_after(v10, v11, v13);
}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v2 = PLLogClientLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(v2);
    }
  }
  id v3 = [NSString stringWithFormat:@"%d_%@", *(__int16 *)(a1 + 56), *(void *)(a1 + 40)];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  objc_sync_enter(@"___sFilterByIntervalBufferSync___");
  uint64_t v5 = [*(id *)(a1 + 32) eventFilterSaved];
  uint64_t v6 = [v5 objectForKeyedSubscript:v3];
  int v7 = [v6 objectForKeyedSubscript:@"bufferedEventDictionary"];

  id v8 = [*(id *)(a1 + 32) eventFilterSaved];
  id v9 = [v8 objectForKeyedSubscript:v3];
  dispatch_time_t v10 = [v9 objectForKeyedSubscript:@"bufferedEventDate"];

  if (v7 && v10)
  {
    [v4 timeIntervalSinceDate:v10];
    if (v11 >= *(double *)(a1 + 48))
    {
      id v14 = [*(id *)(a1 + 32) eventFilterSaved];
      double v15 = [v14 objectForKeyedSubscript:v3];
      [v15 removeObjectForKey:@"bufferedEventDictionary"];

      __int16 v16 = [*(id *)(a1 + 32) eventFilterSaved];
      uint64_t v17 = [v16 objectForKeyedSubscript:v3];
      [v17 removeObjectForKey:@"bufferedEventDate"];

      __int16 v13 = [MEMORY[0x1E4F1C9C8] date];
      id v12 = [*(id *)(a1 + 32) eventFilterSaved];
      uint64_t v18 = [v12 objectForKeyedSubscript:v3];
      [v18 setObject:v13 forKeyedSubscript:@"lastEventDate"];
    }
    else
    {
      id v12 = v7;
      __int16 v13 = v10;
      dispatch_time_t v10 = 0;
      int v7 = 0;
    }
  }
  objc_sync_exit(@"___sFilterByIntervalBufferSync___");
  if (v7) {
    BOOL v19 = v10 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  int v21 = [*(id *)(a1 + 32) clientDebug];
  if (v20)
  {
    if (v21)
    {
      id v22 = PLLogClientLogging();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v24 = *(__int16 *)(a1 + 56);
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67109890;
        int v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v25;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        int v35 = v7;
        _os_log_debug_impl(&dword_1A11A5000, v22, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t\t Log Buffered(%d, %@ at %@) - %@\n", buf, 0x26u);
      }
    }
    [*(id *)(a1 + 32) logWithCurrentDateForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:v7];
  }
  else if (v21)
  {
    __int16 v23 = PLLogClientLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v26 = *(__int16 *)(a1 + 56);
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      int v29 = v26;
      __int16 v30 = 2112;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_debug_impl(&dword_1A11A5000, v23, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t\t No Buffered Log(%d, %@ at %@)\n", buf, 0x1Cu);
    }
  }
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Post"];
  [*(id *)(a1 + 32) xpcSendMessage:v2 withClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    id v3 = PLLogClientLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = *(__int16 *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      v7[0] = 67109634;
      v7[1] = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_debug_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithRateLimitingforClient: client id:%d withKey:%@ withPayload:%@ sent!", (uint8_t *)v7, 0x1Cu);
    }
  }
}

- (id)queryForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if ([(PLClientLogger *)self clientDebug])
  {
    __int16 v10 = PLLogClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger queryForClientID:withKey:withPayload:]();
    }
  }
  if (v8 && [v8 length])
  {
    if (v6 == 50)
    {
      uint64_t v12 = PLLogClientLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger queryForClientID:withKey:withPayload:](v12, v13, v14, v15, v16, v17, v18, v19);
      }

LABEL_11:
      *(void *)buf = 0;
      *(void *)int v35 = buf;
      *(void *)&v35[8] = 0x3032000000;
      *(void *)&v35[16] = __Block_byref_object_copy__0;
      *(void *)&v35[24] = __Block_byref_object_dispose__0;
      id v36 = 0;
      int v20 = [(PLClientLogger *)self getWorkQueueForClientID:v6];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke;
      block[3] = &unk_1E5A46180;
      void block[4] = self;
      __int16 v33 = v6;
      id v30 = v8;
      id v31 = v9;
      __int16 v32 = buf;
      dispatch_async_and_wait(v20, block);

      id v21 = *(id *)(*(void *)v35 + 40);
      _Block_object_dispose(buf, 8);

      goto LABEL_15;
    }
    int v24 = 0;
    *(void *)&long long v11 = 67110146;
    long long v28 = v11;
    do
    {
      int v25 = [(PLClientLogger *)self blockedPermissionForClientID:v6, v8, @"Query", 2000000000, v28 withKey withType withTimeout];
      int v26 = v25;
      if (!v25)
      {
        id v21 = &unk_1EF450B80;
        goto LABEL_15;
      }
      if ((unsigned __int16)v25 == 1) {
        goto LABEL_11;
      }
      if ([(PLClientLogger *)self clientDebug])
      {
        uint64_t v27 = PLLogClientLogging();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v28;
          *(_DWORD *)&uint8_t buf[4] = v6;
          *(_WORD *)int v35 = 2112;
          *(void *)&v35[2] = v8;
          *(_WORD *)&v35[10] = 2112;
          *(void *)&v35[12] = v9;
          *(_WORD *)&v35[20] = 1024;
          *(_DWORD *)&v35[22] = v26;
          *(_WORD *)&v35[26] = 1024;
          *(_DWORD *)&v35[28] = v24;
          _os_log_debug_impl(&dword_1A11A5000, v27, OS_LOG_TYPE_DEBUG, "queryForClientID:%d withKey:%@ withPayload%@ - keyPermission=%d, retry=%d", buf, 0x28u);
        }
      }
      ++v24;
    }
    while (v24 != 5);
    if (v26 != 3) {
      goto LABEL_11;
    }
    id v21 = &unk_1EF450BA8;
  }
  else
  {
    id v22 = PLLogClientLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger queryForClientID:withKey:withPayload:]();
    }

    id v21 = 0;
  }
LABEL_15:

  return v21;
}

void __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Query"];
  uint64_t v3 = [*(id *)(a1 + 32) xpcSendMessageWithReply:v2 withClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) clientDebug])
  {
    uint64_t v6 = PLLogClientLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(__int16 *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v11[0] = 67110146;
      v11[1] = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v2;
      _os_log_debug_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_DEBUG, "queryForClientID:%d withKey:%@ withPayload:%@ result=%@, message=%@", (uint8_t *)v11, 0x30u);
    }
  }
}

- (void)setClientDebug:(BOOL)a3
{
  self->_clientDebug = a3;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setBatchFlushQueue:(id)a3
{
}

- (void)setProcessName:(id)a3
{
}

- (void)setPermissionCache:(id)a3
{
}

- (void)setPendingTaskCache:(id)a3
{
}

- (NSMutableDictionary)eventFilterSaved
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEventFilterSaved:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setXpcConnectionHelperQueue:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnectionHelper
{
  return self->_xpcConnectionHelper;
}

- (void)setXpcConnectionHelper:(id)a3
{
}

- (void)setTalkToPowerlogHelper:(BOOL)a3
{
  self->_talkToPowerlogHelper = a3;
}

- (void)setForceBatching:(BOOL)a3
{
  self->_forceBatching = a3;
}

- (void)setBatchDropMessages:(BOOL)a3
{
  self->_batchDropMessages = a3;
}

- (int)batchMessagesSentCount
{
  return self->_batchMessagesSentCount;
}

- (void)setAdaptivePermissionWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptivePermissionWorkQueue, 0);
  objc_storeStrong((id *)&self->_batchingKeysAllowlist, 0);
  objc_storeStrong((id *)&self->_curatedBatchingList, 0);
  objc_storeStrong((id *)&self->_batchingClientAllowlist, 0);
  objc_storeStrong((id *)&self->_xpcConnectionHelper, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionHelperQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_eventFilterSaved, 0);
  objc_storeStrong((id *)&self->_dynamicCache, 0);
  objc_storeStrong((id *)&self->_batchedTaskCache, 0);
  objc_storeStrong((id *)&self->_pendingTaskCache, 0);
  objc_storeStrong((id *)&self->_permissionCache, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_batchFlushQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_12_0();
  _os_log_debug_impl(&dword_1A11A5000, v0, OS_LOG_TYPE_DEBUG, "Notification %s registration failed : %d", (uint8_t *)v1, 0x12u);
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "powerlogStateChanged: Unregistering for %@ notification", v2, v3, v4, v5, v6);
}

- (void)buildMessageForClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_1A11A5000, v0, v1, "buildMessageForClientID: %d message:%@");
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_1A11A5000, v0, v1, "cachedPermissionForClientID: notification %@ registration failed : %d");
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "cachedPermissionForClientID: Registering for %@ notification", v2, v3, v4, v5, v6);
}

- (void)cachedPermissionForClientID:(void *)a1 withKey:(uint64_t)a2 withType:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a3, (uint64_t)a3, "permissionCache: %@", (uint8_t *)a2);
}

- (void)addToPendingTaskCacheForType:(NSObject *)a3 forClientID:forKey:withPayload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a3, (uint64_t)a3, "addToPendingTaskCacheForType: Current cached payloads = %@", (uint8_t *)a2);
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: connection created", v2, v3, v4, v5, v6);
}

- (void)xpcConnectionWithClientID:(uint64_t)a1 withKey:(uint64_t)a2 withPayload:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = *(void *)(a1 + 96);
  OUTLINED_FUNCTION_5_0(&dword_1A11A5000, a2, a3, "xpcConnectionWithClientID: Client (%d) is creating connection to powerlogHelperd, using queue %@!", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A11A5000, a2, a3, "xpcConnectionWithClientID: _xpcConnection=%@", a5, a6, a7, a8, 2u);
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: connection created!", v2, v3, v4, v5, v6);
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: creating connection to powerlog!", v2, v3, v4, v5, v6);
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: Reusing connection to powerlog!", v2, v3, v4, v5, v6);
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: Received XPC_ERROR_CONNECTION_INVALID", v2, v3, v4, v5, v6);
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID error : %@", v2, v3, v4, v5, v6);
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID error: %@", v2, v3, v4, v5, v6);
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_178_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcConnectionWithClientID: XPC Connection back? %@", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcSendMessage: no xpcMessage", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcSendMessage: sending message %@", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: no xpcMessage", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: no xpcResponse", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: no xpcReturnDict", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: no response", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: response=%@", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:(uint64_t)a3 withClientID:(uint64_t)a4 withKey:(uint64_t)a5 withPayload:(uint64_t)a6 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: xpcReturnDict=%@", v2, v3, v4, v5, v6);
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "xpcSendMessageWithReply: xpcResponse=%@", v2, v3, v4, v5, v6);
}

- (void)permissionForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withType:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_1A11A5000, a2, a3, "permissionForClientID: returnValue=%hd", a5, a6, a7, a8, 0);
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "permissionForClientID: query!", v2, v3, v4, v5, v6);
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
}

- (void)logForClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)shouldLogNowForClientID:(uint8_t *)buf withKey:(NSObject *)a2 withPayload:(double)a3 withFilterInterval:(double)a4 .cold.1(uint8_t *buf, NSObject *a2, double a3, double a4)
{
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t interval = %f, minInterval = %f\n", buf, 0x16u);
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "(PLLogRegisteredEventFilterByInterval) \t lastEventDate = %@\n", v2, v3, v4, v5, v6);
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "(PLLogRegisteredEventFilterByInterval) \t currentEventDate = %@\n", v2, v3, v4, v5, v6);
}

- (void)logLaterForClientID:(NSObject *)a1 withKey:withFilterInterval:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Set Timer at %@\n", v4);
}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Timer Fired at %@\n", v4);
}

- (void)xpcSendMessageWithRateLimitingforClient:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_1A11A5000, v0, v1, "XPC Send Message - Batching enabled xpcSendMessageWithRateLimitingforClient: %d withKey:%@");
}

- (void)queryForClientID:withKey:withPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "queryForClientID: no query key! %@", v2, v3, v4, v5, v6);
}

- (void)queryForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)queryForClientID:withKey:withPayload:.cold.3()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x22u);
}

@end