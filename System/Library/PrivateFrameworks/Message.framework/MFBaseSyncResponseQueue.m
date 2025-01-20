@interface MFBaseSyncResponseQueue
- (BOOL)handleItems:(id)a3;
- (BOOL)shouldSyncFlags;
- (MFBaseSyncResponseQueue)init;
- (id)sequenceIdentifierForItem:(id)a3;
- (unint64_t)flagsForItem:(id)a3;
- (unint64_t)uidForItem:(id)a3;
@end

@implementation MFBaseSyncResponseQueue

- (MFBaseSyncResponseQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFBaseSyncResponseQueue;
  return [(MFBufferedQueue *)&v3 initWithMaximumSize:256 latency:1.0];
}

- (BOOL)handleItems:(id)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __39__MFBaseSyncResponseQueue_handleItems___block_invoke;
  v71[3] = &unk_1E5D3E070;
  v70 = self;
  v71[4] = self;
  v62 = [v4 sortedArrayUsingComparator:v71];

  unint64_t currentUID = self->_currentUID;
  v6 = [v62 lastObject];
  unint64_t v7 = [(MFBaseSyncResponseQueue *)self uidForItem:v6];

  v70->_unint64_t currentUID = v7;
  if (currentUID + 1 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = currentUID + 1;
  }
  serverMessages = v70->_serverMessages;
  if (serverMessages)
  {
    v69 = serverMessages;
  }
  else
  {
    v10 = [(MFLibraryStore *)v70->_store library];
    v11 = [v10 persistence];
    v12 = [v11 serverMessagePersistenceFactory];
    v13 = [(MFLibraryStore *)v70->_store mailbox];
    v14 = [v13 URL];
    v15 = [v12 serverMessagePersistenceForMailboxURL:v14];

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v8, v7 - v8 + 1);
    v69 = [v15 serverMessagesForIMAPUIDs:v16 limit:*MEMORY[0x1E4F60960] returnLastEntries:0];
  }
  unint64_t v65 = [v62 count];
  v17 = v70;
  unint64_t v66 = [(NSArray *)v69 count];
  if (v65)
  {
    uint64_t v18 = [v62 objectAtIndex:0];
  }
  else
  {
    uint64_t v18 = 0;
  }
  if (v66)
  {
    uint64_t v19 = [(NSArray *)v69 objectAtIndex:0];
  }
  else
  {
    uint64_t v19 = 0;
  }
  v61 = objc_opt_new();
  BOOL v20 = v18 != 0;
  BOOL v21 = v19 != 0;
  if (v18 | v19)
  {
    v63 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    while (1)
    {
      unint64_t v22 = [(MFBaseSyncResponseQueue *)v17 uidForItem:v18];
      unsigned int v23 = [(id)v19 imapUID];
      if (v20 && v69 != 0 && v22 == v23) {
        break;
      }
      if (v20)
      {
        if (!v21 || v22 < v23)
        {
          if (v17->_shouldFetch && ([(MFBaseSyncResponseQueue *)v17 flagsForItem:v18] & 2) == 0)
          {
            missingUIDs = v17->_missingUIDs;
            if (!missingUIDs)
            {
              v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v27 = v17->_missingUIDs;
              v17->_missingUIDs = v26;

              missingUIDs = v17->_missingUIDs;
            }
            v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v22];
            [(NSMutableArray *)missingUIDs addObject:v28];
          }
          if (++v67 >= v65)
          {
            uint64_t v29 = 0;
          }
          else
          {
            uint64_t v29 = objc_msgSend(v62, "objectAtIndex:");
          }
          v51 = (void *)v18;
          goto LABEL_56;
        }
LABEL_40:
        if (v17->_shouldCompact)
        {
          if (!v63)
          {
            v63 = [MEMORY[0x1E4F1CA48] array];
          }
          v49 = [(id)v19 remoteID];
          [v63 addObject:v49];
        }
        if (++v68 < v66)
        {
          uint64_t v50 = -[NSArray objectAtIndex:](v69, "objectAtIndex:");
          v51 = (void *)v19;
          uint64_t v29 = v18;
          goto LABEL_49;
        }
        v51 = (void *)v19;
        uint64_t v29 = v18;
LABEL_53:
        uint64_t v19 = 0;
        goto LABEL_56;
      }
      if (v21) {
        goto LABEL_40;
      }
      uint64_t v29 = 0;
      uint64_t v19 = 0;
LABEL_57:
      BOOL v20 = v29 != 0;
      BOOL v21 = v19 != 0;
      uint64_t v18 = v29;
      if (!(v29 | v19)) {
        goto LABEL_60;
      }
    }
    if ([(MFBaseSyncResponseQueue *)v17 shouldSyncFlags])
    {
      store = v17->_store;
      v31 = MFFlagsObjectForFlags([(MFBaseSyncResponseQueue *)v17 flagsForItem:v18]);
      v32 = store;
      id v33 = (id)v19;
      id v34 = v31;
      v35 = (void *)MEMORY[0x1E4F608B8];
      v64 = v33;
      v36 = [v33 serverFlags];
      v37 = [v35 changeFrom:v36 to:v34];

      if ([v37 hasChanges])
      {
        v60 = [(MFLibraryStore *)v32 library];
        v59 = [v60 persistence];
        v38 = [v59 messageChangeManager];
        v39 = [v64 remoteID];
        v72[0] = v39;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
        v41 = [(MFLibraryStore *)v32 mailbox];
        v42 = [v41 URL];
        [v38 reflectFlagChanges:v37 forMessagesWithRemoteIDs:v40 mailboxURL:v42];
      }
      v17 = v70;
      if (!v70->_isSearching)
      {
        v43 = (void *)MEMORY[0x1E4F28ED0];
        v44 = [v64 messagePersistentID];
        v45 = objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v44, "longLongValue"));
        [v61 addObject:v45];

        v17 = v70;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = [(MFBaseSyncResponseQueue *)v17 sequenceIdentifierForItem:v18];
      if ([v46 length])
      {
        v47 = [(MFLibraryStore *)v70->_store library];
        v48 = [(id)v19 messagePersistentID];
        objc_msgSend(v47, "setSequenceIdentifier:forMessageWithLibraryID:", v46, objc_msgSend(v48, "longLongValue"));
      }
    }
    if (++v67 >= v65)
    {
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = objc_msgSend(v62, "objectAtIndex:");
    }

    if (++v68 >= v66)
    {
      v51 = (void *)v19;
      goto LABEL_53;
    }
    uint64_t v50 = -[NSArray objectAtIndex:](v69, "objectAtIndex:");
    v51 = (void *)v19;
LABEL_49:
    uint64_t v19 = v50;
LABEL_56:

    v17 = v70;
    goto LABEL_57;
  }
  v63 = 0;
LABEL_60:
  if ([v61 count])
  {
    v52 = [(MFLibraryStore *)v70->_store library];
    [v52 clearServerSearchFlagsForMessagesWithLibraryIDs:v61];
  }
  if (v63)
  {
    v53 = [(MFLibraryStore *)v70->_store library];
    v54 = [v53 persistence];
    v55 = [v54 messageChangeManager];
    v56 = [(MFLibraryStore *)v70->_store mailbox];
    v57 = [v56 URL];
    [v55 reflectDeletedMessagesWithRemoteIDs:v63 mailboxURL:v57];
  }
  return 1;
}

uint64_t __39__MFBaseSyncResponseQueue_handleItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [*(id *)(a1 + 32) uidForItem:a2];
  unint64_t v7 = [*(id *)(a1 + 32) uidForItem:v5];
  uint64_t v8 = -1;
  if (v6 >= v7) {
    uint64_t v8 = 1;
  }
  if (v6 == v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

- (unint64_t)uidForItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "type", (void)v10) == 8)
        {
          unint64_t v8 = [v7 uid];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v8;
}

- (unint64_t)flagsForItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "type", (void)v9) == 10)
        {
          unint64_t v4 = [v7 messageFlags];
          goto LABEL_11;
        }
      }
      unint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)sequenceIdentifierForItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MFBaseSyncResponseQueue sequenceIdentifierForItem:]", "MFBaseSyncResponseQueue.m", 167, "[item isKindOfClass:[NSArray class]]");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      unint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if ([v8 type] == 11) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    uint64_t v9 = [v8 modSequenceNumber];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    long long v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v9);
  }
  else
  {
LABEL_10:

LABEL_12:
    long long v10 = 0;
  }

  return v10;
}

- (BOOL)shouldSyncFlags
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMessages, 0);
  objc_storeStrong((id *)&self->_missingUIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end