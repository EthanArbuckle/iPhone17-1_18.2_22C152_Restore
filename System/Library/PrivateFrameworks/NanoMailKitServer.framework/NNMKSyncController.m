@interface NNMKSyncController
- (BOOL)_validateMessage:(id)a3;
- (BOOL)canSyncMailbox:(id)a3;
- (BOOL)canSyncMessage:(id)a3 forMailbox:(id)a4;
- (BOOL)doesMessageBelongToSyncedMailboxes:(id)a3;
- (BOOL)isMessage:(id)a3 fromMailbox:(id)a4;
- (BOOL)isValidMessageStatus:(unint64_t)a3 forMailbox:(id)a4;
- (BOOL)shouldAddsDeletesMessagesByStatusUpdatesForMailbox:(id)a3;
- (NNMKDeviceRegistryHolder)delegate;
- (id)deviceRegistry;
- (id)filterMessages:(id)a3 byAlreadySynced:(BOOL)a4 byMailbox:(id)a5;
- (id)filterMessages:(id)a3 receivedBeforeDate:(id)a4;
- (id)groupMessagesByMailboxId:(id)a3;
- (id)mailboxForMessageWithId:(id)a3;
- (id)mailboxWithId:(id)a3;
- (id)mailboxesToSync;
- (id)messageIdFromWatchMessageId:(id)a3;
- (id)removeInvalidMailboxesFromMailboxSelection:(id)a3;
- (id)watchAttachmentContentIdFromContentId:(id)a3;
- (id)watchMessageIdFromMessageId:(id)a3;
- (void)groupMessagesByMailbox:(id)a3 mailboxes:(id)a4 block:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation NNMKSyncController

- (BOOL)canSyncMailbox:(id)a3
{
  id v3 = a3;
  v4 = [v3 mailboxId];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    v6 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncController canSyncMailbox:](v6, v3);
    }
  }
  int v7 = [v3 shouldFilter] ^ 1;
  if (v5) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_validateMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 messageId];
  if (v4)
  {
    uint64_t v5 = [v3 accountId];
    if (v5)
    {
      v6 = [v3 mailboxId];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)filterMessages:(id)a3 byAlreadySynced:(BOOL)a4 byMailbox:(id)a5
{
  BOOL v6 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = [v8 count];
  v12 = v10;
  v13 = v9;
  id v49 = [v12 arrayWithCapacity:v11];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v52;
    *(void *)&long long v15 = 138543618;
    long long v46 = v15;
    BOOL v47 = v6;
    id v48 = v9;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (-[NNMKSyncController _validateMessage:](self, "_validateMessage:", v19, v46))
        {
          if (v6)
          {
            v20 = [(NNMKSyncController *)self deviceRegistry];
            v21 = [v19 messageId];
            int v22 = [v20 containsSyncedMessageForMessageWithId:v21];

            if (v22)
            {
              v23 = [(NNMKSyncController *)self deviceRegistry];
              v24 = [v19 messageId];
              v25 = [v23 syncedMessageForMessageWithId:v24];

              if ([v19 isThreadSpecific]) {
                int v26 = 0;
              }
              else {
                int v26 = [v25 isThreadSpecific];
              }
              uint64_t v33 = [v19 isSpecialMailboxSpecific];
              uint64_t v34 = [v25 isSpecialMailboxSpecific];
              uint64_t v35 = [v19 status];
              uint64_t v36 = [v25 status];
              if (v33 == v34 && v35 == v36) {
                int v38 = v26;
              }
              else {
                int v38 = 1;
              }
              if (!v38)
              {
                v39 = (void *)qword_26AC21850;
                if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
                {
                  v40 = v39;
                  v41 = [v19 messageId];
                  *(_DWORD *)buf = 138543362;
                  v56 = v41;
                  _os_log_impl(&dword_23D3DF000, v40, OS_LOG_TYPE_INFO, "Dropping message because it already exist. %{public}@", buf, 0xCu);
                }
              }

              BOOL v32 = v38 != 0;
              BOOL v6 = v47;
              v13 = v48;
            }
            else
            {
              BOOL v32 = 1;
            }
            if (!v13)
            {
LABEL_32:
              if (!v32) {
                continue;
              }
LABEL_33:
              [v49 addObject:v19];
              continue;
            }
          }
          else
          {
            BOOL v32 = 1;
            if (!v13) {
              goto LABEL_32;
            }
          }
          if (!v32) {
            goto LABEL_32;
          }
          if ([(NNMKSyncController *)self canSyncMessage:v19 forMailbox:v13]) {
            goto LABEL_33;
          }
          v42 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG))
          {
            v43 = v42;
            v44 = [v19 messageId];
            *(_DWORD *)buf = v46;
            v56 = v44;
            __int16 v57 = 2114;
            v58 = v48;
            _os_log_debug_impl(&dword_23D3DF000, v43, OS_LOG_TYPE_DEBUG, "Dropping message because it does not belong to mailbox. Message: %{public}@, Mailbox: %{public}@", buf, 0x16u);

            v13 = v48;
            BOOL v6 = v47;
          }
        }
        else
        {
          v27 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
          {
            v28 = v27;
            v29 = [v19 messageId];
            v30 = [v19 accountId];
            v31 = [v19 mailboxId];
            *(_DWORD *)buf = 138543874;
            v56 = v29;
            __int16 v57 = 2114;
            v58 = v30;
            __int16 v59 = 2114;
            v60 = v31;
            _os_log_error_impl(&dword_23D3DF000, v28, OS_LOG_TYPE_ERROR, "Dropping message because it is missing identifiers. (id:%{public}@, a-id:%{public}@, ma-id:%{public}@)", buf, 0x20u);
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v16);
  }

  return v49;
}

- (id)removeInvalidMailboxesFromMailboxSelection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v15 = a3;
  v4 = [v15 allMailboxesSyncEnabled];
  id v5 = 0;
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      BOOL v7 = [v4 objectAtIndexedSubscript:v6];
      if (![(NNMKSyncController *)self canSyncMailbox:v7])
      {
        id v8 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v8;
          v10 = [v7 mailboxId];
          *(_DWORD *)buf = 138543362;
          uint64_t v17 = v10;
          _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Received invalid mailbox from mailbox selection. Id: %{public}@", buf, 0xCu);
        }
        if (!v5) {
          id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
        }
        [v5 addIndex:v6];
      }

      ++v6;
    }
    while (v6 < [v4 count]);
  }
  if ([v5 count])
  {
    uint64_t v11 = (void *)[v4 mutableCopy];
    [v11 removeObjectsAtIndexes:v5];
    v12 = [[NNMKMailboxSelection alloc] initWithMailboxes:v11];

    v13 = v15;
  }
  else
  {
    v13 = v15;
    v12 = (NNMKMailboxSelection *)v15;
  }

  return v12;
}

- (id)filterMessages:(id)a3 receivedBeforeDate:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [v13 dateReceived];
          uint64_t v15 = [v14 compare:v6];

          if (v15 == -1)
          {
            uint64_t v16 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = v16;
              uint64_t v18 = [v13 messageId];
              v19 = [v13 dateReceived];
              *(_DWORD *)buf = 138543874;
              id v27 = v6;
              __int16 v28 = 2114;
              v29 = v18;
              __int16 v30 = 2114;
              v31 = v19;
              _os_log_impl(&dword_23D3DF000, v17, OS_LOG_TYPE_INFO, "Dropping message because it is older than %{public}@. Id: %{public}@, Date: %{public}@", buf, 0x20u);
            }
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v10);
    }

    id v5 = v21;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (BOOL)canSyncMessage:(id)a3 forMailbox:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(NNMKSyncController *)self isMessage:v7 fromMailbox:v6];
  if ([v6 filterType] == 64)
  {
    uint64_t v9 = [v7 dateReceived];

    BOOL v10 = v8 & objc_msgSend(v9, "nnmk_isToday");
  }
  else
  {
    uint64_t v11 = [v7 status];

    BOOL v10 = [(NNMKSyncController *)self isValidMessageStatus:v11 forMailbox:v6]
       && v8;
  }

  return v10;
}

- (BOOL)isValidMessageStatus:(unint64_t)a3 forMailbox:(id)a4
{
  __int16 v4 = a3;
  id v5 = a4;
  id v6 = v5;
  if ((v4 & 0x600) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
    if (([v5 hasFilterType:1] & 1) == 0)
    {
      if ([v6 hasCompoundFilters])
      {
        BOOL v7 = 1;
      }
      else
      {
        unint64_t v8 = [v6 hasFilterType:4] & ((v4 & 8) != 0);
        if ([v6 hasFilterType:8]) {
          unint64_t v8 = (v4 & 1 | v8) != 0;
        }
        else {
          unint64_t v8 = v8;
        }
        if ([v6 hasFilterType:2]) {
          unint64_t v8 = (v4 & 0x40 | v8) != 0;
        }
        else {
          unint64_t v8 = v8;
        }
        if ([v6 hasFilterType:16]) {
          unint64_t v9 = (v4 & 0x20 | v8) != 0;
        }
        else {
          unint64_t v9 = v8;
        }
        BOOL v7 = v9;
        if ([v6 hasFilterType:32]) {
          BOOL v7 = (v4 & 0x80 | v9) != 0;
        }
      }
    }
  }

  return v7;
}

- (BOOL)doesMessageBelongToSyncedMailboxes:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NNMKSyncController *)self deviceRegistry];
  id v6 = [v5 syncEnabledMailboxes];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[NNMKSyncController isMessage:fromMailbox:](self, "isMessage:fromMailbox:", v4, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {

          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v12 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKSyncController doesMessageBelongToSyncedMailboxes:](v12, v4);
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)shouldAddsDeletesMessagesByStatusUpdatesForMailbox:(id)a3
{
  unint64_t v3 = [a3 filterType];
  return (v3 < 0x21) & (0x100000114uLL >> v3);
}

- (id)watchMessageIdFromMessageId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKSyncController *)self delegate];
  char v6 = [v5 pairedDeviceSupportsMultipleMailboxes];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    objc_msgSend(v4, "nnmk_sanitizedFileNameString");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)messageIdFromWatchMessageId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKSyncController *)self delegate];
  char v6 = [v5 pairedDeviceSupportsMultipleMailboxes];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    uint64_t v8 = [(NNMKSyncController *)self delegate];
    uint64_t v9 = [v8 currentDeviceRegistry];
    uint64_t v10 = [v9 messageIdForSanitizedMessageId:v4];

    uint64_t v11 = v10;
    if (!v10)
    {
      v12 = qword_26AC21850;
      BOOL v13 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR);
      uint64_t v11 = v4;
      if (v13)
      {
        -[NNMKSyncController messageIdFromWatchMessageId:]((uint64_t)v4, v12);
        uint64_t v11 = v4;
      }
    }
    id v7 = v11;
  }
  return v7;
}

- (id)watchAttachmentContentIdFromContentId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKSyncController *)self delegate];
  char v6 = [v5 pairedDeviceSupportsMultipleMailboxes];

  id v7 = v4;
  if ((v6 & 1) == 0)
  {
    id v7 = objc_msgSend(v4, "nnmk_sanitizedFileNameString");
  }
  return v7;
}

- (BOOL)isMessage:(id)a3 fromMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NNMKSyncController *)self delegate];
  if (![v8 pairedDeviceSupportsMultipleMailboxes])
  {
    uint64_t v9 = [v7 accountId];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [v7 mailboxId];

      if (v11) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    long long v17 = [(NNMKSyncController *)self deviceRegistry];
    long long v18 = [v6 mailboxId];
    v12 = [v17 mailboxWithId:v18];

    if (v12) {
      char v16 = [v12 type] == 1;
    }
    else {
      char v16 = 0;
    }
    goto LABEL_13;
  }

LABEL_5:
  v12 = [v6 accountId];
  BOOL v13 = [v7 accountId];
  if ([v12 isEqualToString:v13])
  {
    uint64_t v14 = [v6 mailboxId];
    long long v15 = [v7 mailboxId];
    char v16 = [v14 isEqualToString:v15];
  }
  else
  {
    char v16 = 0;
  }

LABEL_13:
  return v16;
}

- (id)mailboxesToSync
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NNMKSyncController *)self delegate];
  int v4 = [v3 pairedDeviceSupportsMultipleMailboxes];

  if (v4)
  {
    id v5 = [(NNMKSyncController *)self deviceRegistry];
    uint64_t v6 = [v5 syncEnabledMailboxes];
LABEL_5:
    uint64_t v8 = (void *)v6;
    goto LABEL_6;
  }
  uint64_t v7 = [(NNMKSyncController *)self mailboxWithId:@"-1"];
  id v5 = (void *)v7;
  if (v7)
  {
    v10[0] = v7;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (id)deviceRegistry
{
  v2 = [(NNMKSyncController *)self delegate];
  unint64_t v3 = [v2 currentDeviceRegistry];

  return v3;
}

- (id)groupMessagesByMailboxId:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [(NNMKSyncController *)self delegate];
  char v7 = [v6 pairedDeviceSupportsMultipleMailboxes];

  if (!v4 || (v7 & 1) != 0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "mailboxId", (void)v19);
          char v16 = [v5 objectForKeyedSubscript:v15];

          if (!v16)
          {
            char v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
            long long v17 = [v14 mailboxId];
            [v5 setObject:v16 forKeyedSubscript:v17];
          }
          [v16 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v8 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
      -[NNMKSyncController groupMessagesByMailboxId:](v8);
    }
    [v5 setObject:v4 forKeyedSubscript:@"-1"];
  }

  return v5;
}

- (void)groupMessagesByMailbox:(id)a3 mailboxes:(id)a4 block:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void *))a5;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        long long v17 = [v16 mailboxId];

        if (v17)
        {
          long long v18 = [v16 mailboxId];
          [v11 setObject:v16 forKeyedSubscript:v18];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v13);
  }

  v39 = v8;
  [(NNMKSyncController *)self groupMessagesByMailboxId:v8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v44 = long long v52 = 0u;
  id v42 = [v44 allKeys];
  uint64_t v19 = [v42 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v50;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(v42);
        }
        uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * v22);
        uint64_t v24 = [(NNMKSyncController *)self mailboxWithId:v23];
        long long v25 = v24;
        if (v24)
        {
          int v26 = [v24 mailboxId];
          [v11 removeObjectForKey:v26];

          id v27 = [v44 objectForKeyedSubscript:v23];
          v10[2](v10, v27, v25);
LABEL_17:

          goto LABEL_19;
        }
        __int16 v28 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
        {
          log = v28;
          v40 = [v44 objectForKeyedSubscript:v23];
          v29 = +[NNMKMessage messageIdsFromMessages:v40];
          *(_DWORD *)buf = 138543618;
          uint64_t v59 = v23;
          __int16 v60 = 2114;
          v61 = v29;
          id v27 = log;
          _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Could not find mailbox for messages. (Mailbox: %{public}@, Dropping messages: %{public}@)", buf, 0x16u);

          goto LABEL_17;
        }
LABEL_19:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v30 = [v42 countByEnumeratingWithState:&v49 objects:v62 count:16];
      uint64_t v20 = v30;
    }
    while (v30);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v31 = [v11 allValues];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    uint64_t v35 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        int v38 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
          -[NNMKSyncController groupMessagesByMailbox:mailboxes:block:](buf, &buf[1], v38);
        }
        v10[2](v10, v35, v37);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v33);
  }
}

- (id)mailboxForMessageWithId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKSyncController *)self deviceRegistry];
  uint64_t v6 = [v5 syncedMessageForMessageWithId:v4];

  char v7 = [v6 mailboxId];
  id v8 = [(NNMKSyncController *)self mailboxWithId:v7];

  if (!v8)
  {
    id v9 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncController mailboxForMessageWithId:]((uint64_t)v4, v9);
    }
  }

  return v8;
}

- (id)mailboxWithId:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(NNMKSyncController *)self delegate];
  if ([v5 pairedDeviceSupportsMultipleMailboxes])
  {
    uint64_t v6 = [(__CFString *)v4 length];

    if (v6)
    {
      char v7 = [(NNMKSyncController *)self deviceRegistry];
      id v8 = v7;
      id v9 = v4;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v10 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    [(NNMKSyncController *)v10 mailboxWithId:(uint64_t)v4];
  }
  char v7 = [(NNMKSyncController *)self deviceRegistry];
  id v8 = v7;
  id v9 = @"-1";
LABEL_8:
  uint64_t v11 = [v7 mailboxWithId:v9];

  return v11;
}

- (NNMKDeviceRegistryHolder)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKDeviceRegistryHolder *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)canSyncMailbox:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = [a2 mailboxId];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "It will not sync mailbox because it does not have a valid mailbox id: \"%{public}@\"", (uint8_t *)&v5, 0xCu);
}

- (void)doesMessageBelongToSyncedMailboxes:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = [a2 messageId];
  int v5 = [a2 mailboxId];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEBUG, "Dropping message because it does not belong to synced mailboxes. Id: %{public}@, mailboxId: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)messageIdFromWatchMessageId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Could not find message id for watch message id. Returning watch wessage id... %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)groupMessagesByMailboxId:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEBUG, "Grouping message with default mailbox id. Multiple mailboxes is not supported with paired device", v1, 2u);
}

- (void)groupMessagesByMailbox:(uint8_t *)buf mailboxes:(unsigned char *)a2 block:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEBUG, "Executing block for mailbox without messages", buf, 2u);
}

- (void)mailboxForMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "No mailbox for message id %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)mailboxWithId:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = a1;
  int v6 = [a2 delegate];
  int v7 = 134218242;
  uint64_t v8 = [v6 pairedDeviceSupportsMultipleMailboxes];
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEBUG, "Retrieving default mailbox. (Paired device supports multiple mailboxes: %lu, MailboxId: %{public}@)", (uint8_t *)&v7, 0x16u);
}

@end