@interface NNMKBatchRequestHandler
- (NNMKBatchRequestHandler)init;
- (NNMKBatchRequestHandlerDelegate)delegate;
- (NNMKResendScheduler)resendScheduler;
- (NNMKSyncController)syncController;
- (NSDate)lastRetryDate;
- (NSMutableDictionary)batchedRequestByMailboxId;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)fetchTimeoutTimer;
- (id)_batchedFetchResultForBatchedRequest:(id)a3 mailbox:(id)a4 diff:(id)a5 localSyncedMessagesByMessageId:(id)a6;
- (id)_checkBatchFetchedMessagesWithMailbox:(id)a3 messageHeadersToFetch:(id *)a4 attemptsFailed:(BOOL *)a5;
- (id)checkBatchFetchedMessages;
- (id)firstMessageIds:(unint64_t)a3 fromBatchedFetchResults:(id)a4;
- (unint64_t)retryCountForRequestingMissingHeadersInBatchedResponse;
- (void)_rescheduleFetchTimeout;
- (void)cancelFetchTimeout;
- (void)handleBatchRequest:(id)a3;
- (void)handleMessageAdded:(id)a3;
- (void)handleMessageDeleted:(id)a3 mailboxId:(id)a4;
- (void)reset;
- (void)setBatchedRequestByMailboxId:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setFetchTimeoutTimer:(id)a3;
- (void)setLastRetryDate:(id)a3;
- (void)setResendScheduler:(id)a3;
- (void)setRetryCountForRequestingMissingHeadersInBatchedResponse:(unint64_t)a3;
- (void)setSyncController:(id)a3;
- (void)startFetchTimeout;
@end

@implementation NNMKBatchRequestHandler

- (NNMKBatchRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)NNMKBatchRequestHandler;
  v2 = [(NNMKBatchRequestHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    batchedRequestByMailboxId = v2->_batchedRequestByMailboxId;
    v2->_batchedRequestByMailboxId = v3;
  }
  return v2;
}

- (void)handleBatchRequest:(id)a3
{
  id v12 = a3;
  if ([v12 wantsBatchedResponse])
  {
    v4 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
    v5 = [v12 mailboxId];
    uint64_t v6 = [(NNMKBatchedRequest *)v4 objectForKeyedSubscript:v5];
    if (v6)
    {
      v7 = (void *)v6;
    }
    else
    {
      v8 = [v12 mailboxId];

      if (!v8)
      {
LABEL_7:
        v9 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
        v10 = [v12 mailboxId];
        v11 = [v9 objectForKeyedSubscript:v10];
        [v11 setLatestFetchRequest:v12];

        goto LABEL_8;
      }
      v4 = objc_alloc_init(NNMKBatchedRequest);
      v5 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
      v7 = [v12 mailboxId];
      [v5 setObject:v4 forKeyedSubscript:v7];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)handleMessageAdded:(id)a3
{
  id v12 = a3;
  v4 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
  v5 = [v12 mailboxId];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
    v8 = [v12 mailboxId];
    v9 = [v7 objectForKeyedSubscript:v8];
    v10 = [v9 messagesToBeSentInBatch];
    v11 = [v12 messageId];
    [v10 setObject:v12 forKeyedSubscript:v11];
  }
}

- (void)handleMessageDeleted:(id)a3 mailboxId:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
    v10 = [v9 objectForKeyedSubscript:v6];
    v11 = [v10 messagesToBeSentInBatch];
    [v11 removeObjectForKey:v12];
  }
}

- (void)startFetchTimeout
{
  v3 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling time out for #FETCH #BATCHED_RESPONSE.", v4, 2u);
  }
  [(NNMKBatchRequestHandler *)self _rescheduleFetchTimeout];
}

- (id)checkBatchFetchedMessages
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [(NNMKBatchRequestHandler *)self cancelFetchTimeout];
  v3 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
  v4 = [v3 allKeys];

  v26 = [MEMORY[0x263EFF980] array];
  v25 = [MEMORY[0x263EFF980] array];
  v24 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    *(void *)&long long v7 = 138543362;
    long long v23 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        id v12 = [(NNMKBatchRequestHandler *)self syncController];
        v13 = [v12 mailboxWithId:v11];

        if (v13 || ([0 syncActive] & 1) != 0)
        {
          buf[0] = 0;
          id v27 = 0;
          v14 = [(NNMKBatchRequestHandler *)self _checkBatchFetchedMessagesWithMailbox:v13 messageHeadersToFetch:&v27 attemptsFailed:buf];
          id v15 = v27;
          if (v14) {
            [v25 addObject:v14];
          }
          if (buf[0]) {
            [v26 addObject:v13];
          }
          if ([v15 count]) {
            [v24 addObjectsFromArray:v15];
          }
          if (v14) {
            BOOL v16 = 0;
          }
          else {
            BOOL v16 = buf[0] == 0;
          }
          if (!v16)
          {
            v17 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
            [v17 removeObjectForKey:v11];

            [(NNMKBatchRequestHandler *)self setRetryCountForRequestingMissingHeadersInBatchedResponse:0];
            [(NNMKBatchRequestHandler *)self setLastRetryDate:0];
          }
        }
        else
        {
          v18 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            uint64_t v33 = v11;
            _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring mailbox for fetch response because it does not exist or is inactive, %{public}@", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  v20 = objc_alloc_init(NNMKBatchRequestHandlerResult);
  [(NNMKBatchRequestHandlerResult *)v20 setFetchResults:v25];
  [(NNMKBatchRequestHandlerResult *)v20 setMailboxesToTriggerFullSync:v26];
  [(NNMKBatchRequestHandlerResult *)v20 setMissingMessageHeaderIds:v24];
  v21 = [(NNMKBatchRequestHandler *)self firstMessageIds:5 fromBatchedFetchResults:v25];
  [(NNMKBatchRequestHandlerResult *)v20 setMessageIdsForRequestingContentDownload:v21];

  return v20;
}

- (id)_checkBatchFetchedMessagesWithMailbox:(id)a3 messageHeadersToFetch:(id *)a4 attemptsFailed:(BOOL *)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
  uint64_t v10 = [v8 mailboxId];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11) {
    goto LABEL_37;
  }
  v76 = a5;
  v78 = a4;
  id v12 = (void *)MEMORY[0x263F08928];
  uint64_t v13 = objc_opt_class();
  v14 = [v11 latestFetchRequest];
  id v15 = [v14 currentDateForRequestingMoreMessages];
  BOOL v16 = [v12 unarchivedObjectOfClass:v13 fromData:v15 error:0];

  if (!v16)
  {
    v17 = [(NNMKBatchRequestHandler *)self delegate];
    v18 = [v17 currentDeviceRegistry];
    uint64_t v19 = [v8 mailboxId];
    BOOL v16 = [v18 oldestDateReceivedForMailboxId:v19];
  }
  v20 = [(NNMKBatchRequestHandler *)self delegate];
  v21 = [v20 currentDeviceRegistry];
  v22 = [v8 mailboxId];
  uint64_t v23 = [v21 syncedMessagesKeyedByMessageIdAfterDateReceived:v16 mailboxId:v22];

  v24 = [v11 diffFromMessages:v23 maxMessagesToAdd:40];
  v80 = (void *)v23;
  v81 = v8;
  if ([v24 trimed])
  {
    v25 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      id v27 = [v8 mailboxId];
      *(_DWORD *)buf = 138543362;
      uint64_t v88 = (uint64_t)v27;
      _os_log_impl(&dword_23D3DF000, v26, OS_LOG_TYPE_DEFAULT, "Too many new messages to send as a Batch Response to Watch. We're sending only 40 first new messages... %{public}@", buf, 0xCu);
    }
    long long v28 = [v24 messageToAddToWatch];
    long long v29 = [v28 lastObject];
    uint64_t v30 = [v29 dateReceived];

    long long v31 = [MEMORY[0x263F08910] archivedDataWithRootObject:v30 requiringSecureCoding:1 error:0];
    v32 = [v11 latestFetchRequest];
    [v32 setCurrentDateForRequestingMoreMessages:v31];

    uint64_t v33 = [v11 latestFetchRequest];
    [v33 setWillTrimDatabaseAfterResults:1];

    v82 = (void *)v30;
  }
  else
  {
    v82 = v16;
  }
  v34 = (void *)MEMORY[0x263EFF980];
  uint64_t v35 = [v24 messageIdsToAddToWatch];
  v36 = objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v79 = v24;
  v37 = [v24 messageIdsToAddToWatch];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v84 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        v43 = [v11 messagesToBeSentInBatch];
        v44 = [v43 objectForKeyedSubscript:v42];

        if (!v44) {
          [v36 addObject:v42];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v39);
  }

  uint64_t v45 = [v36 count];
  if (v45)
  {
    v46 = [MEMORY[0x263EFF910] date];
    [v46 timeIntervalSince1970];
    double v48 = v47;
    v49 = [(NNMKBatchRequestHandler *)self lastRetryDate];
    [v49 timeIntervalSince1970];
    double v51 = v48 - v50;

    id v8 = v81;
    if (v51 >= 3600.0) {
      [(NNMKBatchRequestHandler *)self setRetryCountForRequestingMissingHeadersInBatchedResponse:0];
    }
    [(NNMKBatchRequestHandler *)self setRetryCountForRequestingMissingHeadersInBatchedResponse:[(NNMKBatchRequestHandler *)self retryCountForRequestingMissingHeadersInBatchedResponse]+ 1];
    v52 = [MEMORY[0x263EFF910] date];
    [(NNMKBatchRequestHandler *)self setLastRetryDate:v52];

    unint64_t v53 = [(NNMKBatchRequestHandler *)self retryCountForRequestingMissingHeadersInBatchedResponse];
    v54 = (void *)qword_26AC21850;
    BOOL v55 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
    if (v53 > 3)
    {
      v56 = v79;
      if (v55)
      {
        v73 = v54;
        v74 = [v81 mailboxId];
        *(_DWORD *)buf = 138543362;
        uint64_t v88 = (uint64_t)v74;
        _os_log_impl(&dword_23D3DF000, v73, OS_LOG_TYPE_DEFAULT, "Exceed attempts to request headers for messages missing it. We're triggering a full sync, so watch gets in sync with companion. Mailbox Id: %{public}@", buf, 0xCu);
      }
      v59 = v82;
      if (v77) {
        unsigned char *v77 = 1;
      }
    }
    else
    {
      v56 = v79;
      if (v55)
      {
        v57 = v54;
        uint64_t v58 = [v36 count];
        v54 = [v81 mailboxId];
        *(_DWORD *)buf = 134218242;
        uint64_t v88 = v58;
        __int16 v89 = 2114;
        v90 = v54;
        _os_log_impl(&dword_23D3DF000, v57, OS_LOG_TYPE_DEFAULT, "Tried to send fetch response, but there are %lu messages that we don't have full headers for. Asking MobileMail for these headers... Mailbox id: %{public}@", buf, 0x16u);
      }
      v59 = v82;
      if (v78) {
        id *v78 = v36;
      }
    }
    v72 = v80;
  }
  else
  {
    v60 = (void *)qword_26AC21850;
    id v8 = v81;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      v62 = [v81 mailboxId];
      *(_DWORD *)buf = 138543362;
      uint64_t v88 = (uint64_t)v62;
      _os_log_impl(&dword_23D3DF000, v61, OS_LOG_TYPE_DEFAULT, "Sending batched response back. (Mailbox id: %{public}@)", buf, 0xCu);
    }
    v63 = [v11 latestFetchRequest];
    int v64 = [v63 willTrimDatabaseAfterResults];

    v56 = v79;
    if (v64)
    {
      v65 = [(NNMKBatchRequestHandler *)self delegate];
      v66 = [v65 currentDeviceRegistry];
      [v66 removeSyncedMessagesBeforeDateReceived:v82 mailbox:v81];

      v67 = [(NNMKBatchRequestHandler *)self resendScheduler];
      v68 = [v81 mailboxId];
      [v67 deletePendingIDSMessagesForMailboxId:v68];

      v69 = [(NNMKBatchRequestHandler *)self delegate];
      v70 = [v69 currentDeviceRegistry];
      v71 = [v81 mailboxId];
      [v70 incrementSyncVersionForMailboxId:v71];
    }
    v72 = v80;
    v54 = [(NNMKBatchRequestHandler *)self _batchedFetchResultForBatchedRequest:v11 mailbox:v81 diff:v79 localSyncedMessagesByMessageId:v80];
    v59 = v82;
  }

  if (v45) {
LABEL_37:
  }
    v54 = 0;

  return v54;
}

- (id)_batchedFetchResultForBatchedRequest:(id)a3 mailbox:(id)a4 diff:(id)a5 localSyncedMessagesByMessageId:(id)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v62 = a6;
  uint64_t v13 = objc_alloc_init(NNMKProtoBatchedFetchResult);
  v14 = [(NNMKBatchRequestHandler *)self delegate];
  id v15 = [v14 currentDeviceRegistry];
  -[NNMKProtoBatchedFetchResult setFullSyncVersion:](v13, "setFullSyncVersion:", [v15 fullSyncVersion]);

  BOOL v16 = (void *)MEMORY[0x263F08910];
  v17 = [MEMORY[0x263EFF910] date];
  v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
  [(NNMKProtoBatchedFetchResult *)v13 setDateSynced:v18];

  uint64_t v19 = [v10 latestFetchRequest];
  -[NNMKProtoBatchedFetchResult setShouldTrimDatabase:](v13, "setShouldTrimDatabase:", [v19 willTrimDatabaseAfterResults]);

  v60 = v10;
  v20 = [v10 latestFetchRequest];
  v21 = [v20 currentDateForRequestingMoreMessages];
  [(NNMKProtoBatchedFetchResult *)v13 setDateForRequestingMoreMessages:v21];

  v22 = [v11 mailboxId];
  [(NNMKProtoBatchedFetchResult *)v13 setMailboxId:v22];

  v59 = self;
  uint64_t v23 = [(NNMKBatchRequestHandler *)self delegate];
  v24 = [v23 currentDeviceRegistry];
  v56 = v11;
  v25 = [v11 mailboxId];
  -[NNMKProtoBatchedFetchResult setMailboxSyncVersion:](v13, "setMailboxSyncVersion:", [v24 syncVersionForMailboxId:v25]);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  BOOL v55 = v12;
  obuint64_t j = [v12 messageIdsToAddToWatch];
  uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v61)
  {
    uint64_t v58 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        id v27 = v13;
        if (*(void *)v72 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        long long v29 = [v60 messagesToBeSentInBatch];
        uint64_t v30 = [v29 objectForKeyedSubscript:v28];

        long long v31 = [v62 objectForKeyedSubscript:v28];
        objc_msgSend(v30, "setStatus:", objc_msgSend(v31, "status"));

        v32 = [(NNMKBatchRequestHandler *)v59 delegate];
        uint64_t v33 = [v32 currentDeviceRegistry];
        uint64_t v34 = [v33 organizeByThread];
        uint64_t v35 = [(NNMKBatchRequestHandler *)v59 delegate];
        uint64_t v36 = [v35 pairedDeviceSupportsMultipleMailboxes] ^ 1;
        v37 = [(NNMKBatchRequestHandler *)v59 delegate];
        uint64_t v38 = +[NNMKProtoMessage protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:](NNMKProtoMessage, "protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:", v30, v34, v36, [v37 pairedDeviceSupportsStandaloneMode]);

        uint64_t v13 = v27;
        [(NNMKProtoBatchedFetchResult *)v27 addMessageAddition:v38];
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v61);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v39 = [v55 messageIdsToUpdateOnWatch];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        uint64_t v45 = [v62 objectForKeyedSubscript:v44];
        v46 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
        [(NNMKProtoMessageStatusUpdate *)v46 setMessageId:v44];
        -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v46, "setUpdatedStatus:", [v45 status]);
        -[NNMKProtoMessageStatusUpdate setStatusVersion:](v46, "setStatusVersion:", [v45 statusVersion]);
        [(NNMKProtoBatchedFetchResult *)v13 addMessageUpdate:v46];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v41);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  double v47 = [v55 messageIdsToDeleteFromWatch];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v64 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v63 + 1) + 8 * k);
        unint64_t v53 = objc_alloc_init(NNMKProtoMessageDeletion);
        [(NNMKProtoMessageDeletion *)v53 setMessageId:v52];
        [(NNMKProtoBatchedFetchResult *)v13 addMessageDeletion:v53];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v49);
  }

  return v13;
}

- (id)firstMessageIds:(unint64_t)a3 fromBatchedFetchResults:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3 + 1];
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v25 = v5;
    obuint64_t j = v5;
    uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v38;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v8;
          uint64_t v9 = *(void **)(*((void *)&v37 + 1) + 8 * v8);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          objc_msgSend(v9, "messageAdditions", v25);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v34 != v12) {
                  objc_enumerationMutation(v30);
                }
                v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                id v15 = (void *)MEMORY[0x263F08928];
                uint64_t v16 = objc_opt_class();
                v17 = [v14 dateReceived];
                v18 = [v15 unarchivedObjectOfClass:v16 fromData:v17 error:0];

                uint64_t v19 = [v14 messageId];
                [v7 setObject:v18 forKeyedSubscript:v19];

                v20 = [v14 messageId];
                uint64_t v21 = [v6 count];
                v31[0] = MEMORY[0x263EF8330];
                v31[1] = 3221225472;
                v31[2] = __67__NNMKBatchRequestHandler_firstMessageIds_fromBatchedFetchResults___block_invoke;
                v31[3] = &unk_264E9A158;
                id v32 = v7;
                uint64_t v22 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, v21, 1024, v31);

                if ([v6 count] != a3 || v22 != objc_msgSend(v6, "count"))
                {
                  uint64_t v23 = [v14 messageId];
                  [v6 insertObject:v23 atIndex:v22];

                  if ([v6 count] > a3) {
                    [v6 removeLastObject];
                  }
                }
              }
              uint64_t v11 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v11);
          }

          uint64_t v8 = v29 + 1;
        }
        while (v29 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v28);
    }

    id v5 = v25;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __67__NNMKBatchRequestHandler_firstMessageIds_fromBatchedFetchResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:a3];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)reset
{
  id v2 = [(NNMKBatchRequestHandler *)self batchedRequestByMailboxId];
  [v2 removeAllObjects];
}

- (void)cancelFetchTimeout
{
  v3 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];

  if (v3)
  {
    v4 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];
    dispatch_source_cancel(v4);
  }
}

- (void)_rescheduleFetchTimeout
{
  v3 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];

  if (!v3)
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_executionQueue);
    [(NNMKBatchRequestHandler *)self setFetchTimeoutTimer:v4];

    id v5 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __50__NNMKBatchRequestHandler__rescheduleFetchTimeout__block_invoke;
    handler[3] = &unk_264E99F20;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);

    id v6 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];
    dispatch_resume(v6);
  }
  id v7 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];

  if (v7)
  {
    uint64_t v8 = [(NNMKBatchRequestHandler *)self fetchTimeoutTimer];
    dispatch_time_t v9 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void __50__NNMKBatchRequestHandler__rescheduleFetchTimeout__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 batchRequestHandlerDidTimeoutFetchRequest:*(void *)(a1 + 32)];
}

- (NNMKBatchRequestHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKBatchRequestHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NNMKResendScheduler)resendScheduler
{
  return self->_resendScheduler;
}

- (void)setResendScheduler:(id)a3
{
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (OS_dispatch_source)fetchTimeoutTimer
{
  return self->_fetchTimeoutTimer;
}

- (void)setFetchTimeoutTimer:(id)a3
{
}

- (NSMutableDictionary)batchedRequestByMailboxId
{
  return self->_batchedRequestByMailboxId;
}

- (void)setBatchedRequestByMailboxId:(id)a3
{
}

- (unint64_t)retryCountForRequestingMissingHeadersInBatchedResponse
{
  return self->_retryCountForRequestingMissingHeadersInBatchedResponse;
}

- (void)setRetryCountForRequestingMissingHeadersInBatchedResponse:(unint64_t)a3
{
  self->_retryCountForRequestingMissingHeadersInBatchedResponse = a3;
}

- (NSDate)lastRetryDate
{
  return self->_lastRetryDate;
}

- (void)setLastRetryDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRetryDate, 0);
  objc_storeStrong((id *)&self->_batchedRequestByMailboxId, 0);
  objc_storeStrong((id *)&self->_fetchTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_resendScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end