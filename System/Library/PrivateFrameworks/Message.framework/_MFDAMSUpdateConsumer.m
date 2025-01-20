@interface _MFDAMSUpdateConsumer
- (BOOL)handleItems:(id)a3;
- (void)drainMailbox;
- (void)handleResponse:(id)a3 error:(id)a4;
- (void)receiveSyncActions:(id)a3;
@end

@implementation _MFDAMSUpdateConsumer

- (void)drainMailbox
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1AD0E3E00](self, a2);
  BOOL v4 = self->super.mailbox == 0;
  v5 = DALoggingwithCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v9 = [(MFDAMailbox *)self->super.mailbox folderID];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Failed erasing messages for folderID %@ - no such local mailbox.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v7 = [(MFDAMailbox *)self->super.mailbox folderID];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Erasing locally cached messages for folderID %@", (uint8_t *)&v10, 0xCu);
    }
    library = self->super.library;
    v5 = [(MFMailboxUid *)self->super.mailbox URLString];
    [(MFMailMessageLibrary *)library removeAllMessagesFromMailbox:v5 removeMailbox:0 andNotify:1];
  }
}

- (BOOL)handleItems:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->super.error) {
    goto LABEL_77;
  }
  v45 = v4;
  v44 = (void *)MEMORY[0x1AD0E3E00]();
  v48 = [MEMORY[0x1E4F1CA48] array];
  v49 = [MEMORY[0x1E4F1CA48] array];
  v54 = [MEMORY[0x1E4F1CA48] array];
  v53 = [MEMORY[0x1E4F1CA48] array];
  v52 = [MEMORY[0x1E4F1CA48] array];
  v51 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  v47 = [MEMORY[0x1E4F1CA48] array];
  v46 = [MEMORY[0x1E4F1CA48] array];
  v55 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v6 = v45;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)v61;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v61 != v8) {
        objc_enumerationMutation(v6);
      }
      int v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
      uint64_t v11 = [v10 itemChangeType];
      if (v11 == 2)
      {
        v19 = [v10 message];
        uint64_t v12 = [v19 remoteID];

        v15 = [(MFDAMessageStore *)self->super.store messageForRemoteID:v12];
        if (v15) {
          [v49 addObject:v15];
        }
      }
      else
      {
        if (v11 == 1)
        {
          uint64_t v12 = [v10 message];
          v15 = [v12 remoteID];
          v16 = [(MFDAMessageStore *)self->super.store messageForRemoteID:v15];
          if (v16)
          {
            if ([v12 isDraft])
            {
              v18 = [[MFDAMessage alloc] initWithDAMailMessage:v12 mailbox:self->super.mailbox];
              [(MFDAMessage *)v18 setMessageStore:self->super.store];
              [v48 addObject:v18];
              [v49 addObject:v16];
            }
            else
            {
              [v55 setObject:v12 forKey:v16];
            }
          }
        }
        else
        {
          if (v11) {
            continue;
          }
          uint64_t v12 = [v10 message];
          store = self->super.store;
          v14 = [v12 remoteID];
          v15 = [(MFDAMessageStore *)store messageForRemoteID:v14];

          if (v15)
          {
            DALoggingwithCategory();
            v16 = (MFDAMessage *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v16->super.super.super, OS_LOG_TYPE_DEFAULT))
            {
              v17 = [v12 remoteID];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v17;
              _os_log_impl(&dword_1A7EFF000, &v16->super.super.super, OS_LOG_TYPE_DEFAULT, "received a redundant SyncAddAction for a message with remote-id %@", buf, 0xCu);
            }
          }
          else
          {
            v16 = [[MFDAMessage alloc] initWithDAMailMessage:v12 mailbox:self->super.mailbox];
            [(MFDAMessage *)v16 setMessageStore:self->super.store];
            [v48 addObject:v16];
          }
        }
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
  }
  while (v7);
LABEL_24:

  if ([v55 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v20 = [v55 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (!v21) {
      goto LABEL_49;
    }
    uint64_t v22 = *(void *)v57;
    while (1)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v57 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v56 + 1) + 8 * j);
        v25 = [v55 objectForKey:v24];
        if ([v25 readIsSet])
        {
          if ([v25 read]) {
            v26 = v54;
          }
          else {
            v26 = v53;
          }
          [v26 addObject:v24];
        }
        if ([v25 flaggedIsSet])
        {
          if ([v25 flagged]) {
            v27 = v52;
          }
          else {
            v27 = v51;
          }
          [v27 addObject:v24];
        }
        if ([v25 verbIsSet])
        {
          int v28 = [v25 lastVerb];
          v29 = v50;
          if (v28 == 1) {
            goto LABEL_46;
          }
          if (v28 == 3)
          {
            v29 = v46;
LABEL_46:
            [v29 addObject:v24];
            goto LABEL_47;
          }
          v29 = v47;
          if (v28 == 2) {
            goto LABEL_46;
          }
        }
LABEL_47:
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (!v21)
      {
LABEL_49:

        break;
      }
    }
  }
  if ([v48 count])
  {
    *(void *)buf = 0;
    library = self->super.library;
    v31 = [(MFLibraryStore *)self->super.store account];
    self->super.numNewMessages = insertDAMessages(v48, library, v31, self->super.mailbox, 0, buf);

    if ((buf[0] & 1) != 0 && (buf[0] & 8) != 0 && self->super.numNewMessages)
    {
      uint64_t v32 = 1;
      if ((buf[0] & 2) != 0) {
        uint64_t v32 = 2;
      }
      if ((buf[0] & 4) != 0) {
        uint64_t v33 = 3;
      }
      else {
        uint64_t v33 = v32;
      }
      [(MFActivityMonitor *)self->super.monitor setGotNewMessagesState:v33];
    }
  }
  v34 = [(MFMailMessageLibrary *)self->super.library persistence];
  v35 = [v34 messageChangeManager];

  if ([v53 count])
  {
    v36 = [MEMORY[0x1E4F608B8] clearRead];
    [v35 reflectFlagChanges:v36 forMessages:v53];
  }
  if ([v54 count])
  {
    v37 = [MEMORY[0x1E4F608B8] setRead];
    [v35 reflectFlagChanges:v37 forMessages:v54];
  }
  if ([v51 count])
  {
    v38 = [MEMORY[0x1E4F608B8] clearFlagged];
    [v35 reflectFlagChanges:v38 forMessages:v51];
  }
  if ([v52 count])
  {
    v39 = [MEMORY[0x1E4F608B8] setFlagged];
    [v35 reflectFlagChanges:v39 forMessages:v52];
  }
  if ([v50 count])
  {
    v40 = [MEMORY[0x1E4F608B8] setReplied];
    [v35 reflectFlagChanges:v40 forMessages:v50];
  }
  if ([v47 count])
  {
    v41 = [MEMORY[0x1E4F608B8] setReplied];
    [v35 reflectFlagChanges:v41 forMessages:v47];
  }
  if ([v46 count])
  {
    v42 = [MEMORY[0x1E4F608B8] setForwarded];
    [v35 reflectFlagChanges:v42 forMessages:v46];
  }
  if ([v49 count]) {
    [v35 reflectDeletedMessages:v49];
  }

  v5 = v45;
LABEL_77:

  return 1;
}

- (void)receiveSyncActions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MFBufferedQueue addItem:](self, "addItem:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)handleResponse:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:1730 description:@"should only reach here in the error case."];
  }
  long long v9 = DALoggingwithCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_ERROR, "error syncing folder: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_storeStrong((id *)&self->super.error, a4);
  [(MFBufferedQueue *)self flush];
}

@end