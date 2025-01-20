@interface MFDAMailAccountSyncConsumer
- (BOOL)moreAvailable;
- (BOOL)refreshFolderHierarchyAndWait:(unint64_t)a3;
- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4;
- (DAMailboxStreamingContentConsumer)streamConsumer;
- (MFDAMailAccountSyncConsumer)initWithCurrentTag:(id)a3 accountID:(id)a4 requests:(id)a5;
- (NSString)tag;
- (id)actionsConsumer;
- (id)originalThreadMonitor;
- (void)accountHierarchyChanged:(id)a3;
- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6;
- (void)didEndStreamingForMailMessage:(id)a3;
- (void)handleSyncResponses:(id)a3;
- (void)partialResultsForMailbox:(id)a3 actions:(id)a4 responses:(id)a5 percentComplete:(double)a6 moreAvailable:(BOOL)a7;
- (void)reset;
- (void)resultsForMailbox:(id)a3 newTag:(id)a4 actions:(id)a5 responses:(id)a6 percentComplete:(double)a7 moreAvailable:(BOOL)a8 sentBytesCount:(unint64_t)a9 receivedBytesCount:(unint64_t)a10;
- (void)setStreamConsumer:(id)a3;
- (void)setTag:(id)a3;
- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5;
@end

@implementation MFDAMailAccountSyncConsumer

- (MFDAMailAccountSyncConsumer)initWithCurrentTag:(id)a3 accountID:(id)a4 requests:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_storeStrong((id *)&self->_requestPairs, a5);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke;
  v22[3] = &unk_1E5D3E318;
  v22[4] = &v23;
  [v10 enumerateObjectsUsingBlock:v22];
  uint64_t v11 = *((unsigned __int8 *)v24 + 24);
  v21.receiver = self;
  v21.super_class = (Class)MFDAMailAccountSyncConsumer;
  v12 = [(MFDAMailAccountConsumer *)&v21 initWithAlwaysReportFailures:v11];
  v13 = v12;
  if (v12)
  {
    [(MFDAMailAccountSyncConsumer *)v12 setTag:v8];
    v13->_firstSyncBatch = 1;
    objc_storeStrong((id *)&v13->_accountID, a4);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke_2;
    v18[3] = &unk_1E5D3E340;
    v14 = v13;
    v19 = v14;
    id v20 = v10;
    [v20 enumerateObjectsUsingBlock:v18];
    uint64_t v15 = +[MFActivityMonitor currentMonitor];
    monitor = v14->_monitor;
    v14->_monitor = (MFActivityMonitor *)v15;
  }
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 first];
  if (objc_msgSend(v3, "mf_alwaysReportFailures")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 second];
  if ([v3 conformsToProtocol:&unk_1EFF71A68])
  {
    v4 = [v10 first];
    v5 = [v4 messageID];
    if (v5)
    {
      v6 = *(void **)(*(void *)(a1 + 32) + 72);
      if (!v6)
      {
        uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(void **)(v8 + 72);
        *(void *)(v8 + 72) = v7;

        v6 = *(void **)(*(void *)(a1 + 32) + 72);
      }
      [v6 setObject:v3 forKeyedSubscript:v5];
    }
  }
}

- (void)reset
{
  self->_moreAvailable = 0;
  self->_firstSyncBatch = 0;
  v2.receiver = self;
  v2.super_class = (Class)MFDAMailAccountSyncConsumer;
  [(MFDAMailAccountConsumer *)&v2 setDone:0];
}

- (id)originalThreadMonitor
{
  return self->_monitor;
}

- (id)actionsConsumer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v2 = self->_requestPairs;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "second", (void)v8);
      if ([v6 conformsToProtocol:&unk_1EFF71800]) {
        break;
      }

      if (v3 == ++v5)
      {
        uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (void)handleSyncResponses:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v22 = [(MFDAMailAccountSyncConsumer *)self actionsConsumer];
  if (v22)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v23;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v9, "status", v22) == 12)
          {
            long long v10 = [v9 message];
            id v11 = objc_alloc(MEMORY[0x1E4F5E808]);
            v12 = [v10 remoteID];
            uint64_t v13 = (void *)[v11 initWithItemChangeType:2 changedItem:v10 serverId:v12];

            [v4 addObject:v13];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }

    if ([v4 count]) {
      [v22 receiveSyncActions:v4];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v23;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        v19 = objc_msgSend(v18, "serverId", v22);
        if (!v19
          || ([(NSMutableDictionary *)self->_syncResponseConsumersByMessageId objectForKeyedSubscript:v19], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if ([(NSArray *)self->_requestPairs count] == 1)
          {
            objc_super v21 = [(NSArray *)self->_requestPairs objectAtIndexedSubscript:0];
            id v20 = [v21 second];
          }
          else
          {
            id v20 = 0;
          }
        }
        if ([v20 conformsToProtocol:&unk_1EFF71A68]) {
          [v20 handleResponse:v18 error:0];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }
}

- (void)partialResultsForMailbox:(id)a3 actions:(id)a4 responses:(id)a5 percentComplete:(double)a6 moreAvailable:(BOOL)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  if (self->_firstSyncBatch && !a7)
  {
    uint64_t v15 = [(MFDAMailAccountSyncConsumer *)self originalThreadMonitor];
    [v15 setPercentDone:a6];
  }
  if ([v13 count])
  {
    uint64_t v16 = [(MFDAMailAccountSyncConsumer *)self actionsConsumer];
    if (!v16)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"MFDAMailAccountSyncConsumer.m", 163, @"we failed to find a sync actions consumer! requests: %@", self->_requestPairs object file lineNumber description];
    }
    if (!self->_receivedFirstItem)
    {
      if (!self->_tag) {
        [v16 drainMailbox];
      }
      v17 = [(MFDAMailAccountSyncConsumer *)self originalThreadMonitor];
      v18 = MFLookupLocalizedString(@"DOWNLOADING_STATUS", @"Downloading", @"Delayed");
      [v17 setDisplayName:v18];

      self->_receivedFirstItem = 1;
    }
    [v16 receiveSyncActions:v13];
  }
  if ([v14 count]) {
    [(MFDAMailAccountSyncConsumer *)self handleSyncResponses:v14];
  }
}

- (void)resultsForMailbox:(id)a3 newTag:(id)a4 actions:(id)a5 responses:(id)a6 percentComplete:(double)a7 moreAvailable:(BOOL)a8 sentBytesCount:(unint64_t)a9 receivedBytesCount:(unint64_t)a10
{
  id v22 = a4;
  id v16 = a5;
  id v17 = a6;
  [(MFActivityMonitor *)self->_monitor recordBytesWritten:a9];
  [(MFActivityMonitor *)self->_monitor recordBytesRead:a10];
  v18 = [(MFDAMailAccountSyncConsumer *)self actionsConsumer];
  if ([v16 count])
  {
    if (!v18)
    {
      objc_super v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"MFDAMailAccountSyncConsumer.m", 198, @"we failed to find a sync actions consumer! requests: %@", self->_requestPairs object file lineNumber description];
    }
    if (!self->_receivedFirstItem)
    {
      if (!self->_tag) {
        [v18 drainMailbox];
      }
      v19 = [(MFDAMailAccountSyncConsumer *)self originalThreadMonitor];
      id v20 = MFLookupLocalizedString(@"DOWNLOADING_STATUS", @"Downloading", @"Delayed");
      [v19 setDisplayName:v20];

      self->_receivedFirstItem = 1;
    }
    [v18 receiveSyncActions:v16];
  }
  if ([v17 count]) {
    [(MFDAMailAccountSyncConsumer *)self handleSyncResponses:v17];
  }
  [v18 commitSyncActions];
  self->_moreAvailable = a8;
  [(MFDAMailAccountSyncConsumer *)self setTag:v22];
  [(MFDAMailAccountConsumer *)self setDone:1];
}

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  [(MFDAMailAccountSyncConsumer *)self setStreamConsumer:0];
  requestPairs = self->_requestPairs;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__MFDAMailAccountSyncConsumer_shouldBeginStreamingForMailMessage_format___block_invoke;
  v10[3] = &unk_1E5D3E368;
  id v8 = v6;
  id v11 = v8;
  v12 = self;
  id v13 = &v15;
  int v14 = a4;
  [(NSArray *)requestPairs enumerateObjectsUsingBlock:v10];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __73__MFDAMailAccountSyncConsumer_shouldBeginStreamingForMailMessage_format___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 first];
  if ([v6 requestType] == 3)
  {
    uint64_t v7 = [v6 messageID];
    id v8 = [*(id *)(a1 + 32) remoteID];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      long long v10 = [v13 second];
      if (objc_opt_respondsToSelector())
      {
        id v11 = [v10 streamingContentConsumer];
        [*(id *)(a1 + 40) setStreamConsumer:v11];

        v12 = [*(id *)(a1 + 40) streamConsumer];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 shouldBeginStreamingForMailMessage:*(void *)(a1 + 32) format:*(unsigned int *)(a1 + 56)];

        *a4 = 1;
      }
    }
  }
}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v11 = a6;
  long long v10 = [(MFDAMailAccountSyncConsumer *)self streamConsumer];
  [v10 consumeData:a3 length:v7 format:v6 mailMessage:v11];
}

- (void)didEndStreamingForMailMessage:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MFDAMailAccountSyncConsumer *)self streamConsumer];
  [v4 didEndStreamingForMailMessage:v5];
}

- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [a5 userInfo];
  long long v10 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

  if (a4 <= 62)
  {
    id v11 = MFMessageErrorDomain;
    uint64_t v12 = 1033;
    switch(a4)
    {
      case -1:
        uint64_t v12 = 1028;
        goto LABEL_27;
      case 0:
        id v13 = [v10 domain];
        if (![v13 isEqualToString:*MEMORY[0x1E4F289A0]])
        {

          goto LABEL_26;
        }
        uint64_t v14 = [v10 code];

        if (v14 != -1001) {
          goto LABEL_26;
        }
        id v11 = (__CFString **)MEMORY[0x1E4F28798];
        uint64_t v12 = 60;
        goto LABEL_27;
      case 5:
        int serverErrors = self->_serverErrors;
        self->_int serverErrors = serverErrors + 1;
        if (serverErrors <= 0)
        {
          self->_moreAvailable = 1;
        }
        else if (!self->_moreAvailable)
        {
          id v16 = DALoggingwithCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = self->_serverErrors;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v30 = v17;
            *(_WORD *)&v30[4] = 2112;
            *(void *)&v30[6] = v8;
            _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "encounter server error %d times for task %@, giving up.", buf, 0x12u);
          }

          id v11 = MFMessageErrorDomain;
          uint64_t v12 = 1040;
          goto LABEL_27;
        }
        long long v26 = DALoggingwithCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)long long v30 = v8;
          _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "encounter server error for task %@.", buf, 0xCu);
        }
        goto LABEL_33;
      case 6:
      case 9:
        goto LABEL_27;
      case 8:
        -[MFDAMailAccountSyncConsumer setTag:](self, "setTag:", 0, 1033);
        int syncKeyResets = self->_syncKeyResets;
        self->_int syncKeyResets = syncKeyResets + 1;
        self->_moreAvailable = syncKeyResets < 1;
        if (syncKeyResets > 0)
        {
          v19 = DALoggingwithCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = self->_syncKeyResets;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v30 = v20;
            *(_WORD *)&v30[4] = 2112;
            *(void *)&v30[6] = v8;
            _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "server has reset the sync state %d times for task %@ in the same sync attempt, giving up.", buf, 0x12u);
          }

          goto LABEL_24;
        }
        long long v26 = DALoggingwithCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)long long v30 = v8;
          *(_WORD *)&v30[8] = 2048;
          *(void *)&v30[10] = 8;
          _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "server indicated invalid sync state for task %@ (code %ld).  resetting mailbox sync key.", buf, 0x16u);
        }
LABEL_33:

        break;
      case 12:
        objc_super v21 = [MEMORY[0x1E4F5E950] sharedConnection];
        [v21 updateFolderListForAccountID:self->_accountID andDataclasses:1 requireChangedFolders:1 isUserRequested:1];

        goto LABEL_24;
      default:
        goto LABEL_26;
    }
    goto LABEL_29;
  }
  if (a4 == 63) {
    goto LABEL_7;
  }
  if (a4 != 67)
  {
    if (a4 == 79)
    {
LABEL_7:
      id v11 = MFMessageErrorDomain;
      uint64_t v12 = 1055;
      goto LABEL_27;
    }
LABEL_26:
    id v11 = MFMessageErrorDomain;
    uint64_t v12 = 1045;
LABEL_27:
    id v23 = +[MFError errorWithDomain:*v11 code:v12 localizedDescription:0];
    if (v23)
    {
      self->_moreAvailable = 0;
      requestPairs = self->_requestPairs;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __59__MFDAMailAccountSyncConsumer_taskFailed_statusCode_error___block_invoke;
      v27[3] = &unk_1E5D3B638;
      id v28 = v23;
      id v25 = v23;
      [(NSArray *)requestPairs enumerateObjectsUsingBlock:v27];
    }
    goto LABEL_29;
  }
  if (![(MFDAMailAccountSyncConsumer *)self refreshFolderHierarchyAndWait:5])
  {
LABEL_24:
    id v11 = MFMessageErrorDomain;
    uint64_t v12 = 1033;
    goto LABEL_27;
  }
  int v22 = self->_serverErrors;
  self->_int serverErrors = v22 + 1;
  if (v22 <= 0) {
    self->_moreAvailable = 1;
  }
LABEL_29:
}

void __59__MFDAMailAccountSyncConsumer_taskFailed_statusCode_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 second];
  [v3 handleResponse:0 error:*(void *)(a1 + 32)];
}

- (void)accountHierarchyChanged:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 object];
  int v5 = [v4 isEqualToString:self->_accountID];

  if (v5)
  {
    [(NSConditionLock *)self->_accountHierarchyLock lock];
    [(NSConditionLock *)self->_accountHierarchyLock unlockWithCondition:1];
  }
}

- (BOOL)refreshFolderHierarchyAndWait:(unint64_t)a3
{
  int v5 = (NSConditionLock *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  accountHierarchyLock = self->_accountHierarchyLock;
  self->_accountHierarchyLock = v5;

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_accountHierarchyChanged_ name:*MEMORY[0x1E4F5E7C8] object:0];

  id v8 = [MEMORY[0x1E4F5E950] sharedConnection];
  [v8 updateFolderListForAccountID:self->_accountID andDataclasses:1 requireChangedFolders:1 isUserRequested:1];

  if (a3)
  {
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      id v11 = self->_accountHierarchyLock;
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      [(NSConditionLock *)v11 lockWhenCondition:1 beforeDate:v12];

      [(NSConditionLock *)self->_accountHierarchyLock unlock];
      if ([(NSConditionLock *)self->_accountHierarchyLock condition] == 1) {
        break;
      }
      id v13 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.01];
      [v13 runUntilDate:v14];

      BOOL v10 = ++v9 < a3;
    }
    while (a3 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (DAMailboxStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
}

- (BOOL)moreAvailable
{
  return self->_moreAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamConsumer, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_accountHierarchyLock, 0);
  objc_storeStrong((id *)&self->_syncResponseConsumersByMessageId, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_requestPairs, 0);
}

@end