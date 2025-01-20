@interface _MFDAMSSearchResponseConsumer
- (BOOL)handleItems:(id)a3;
- (BOOL)waitUntilDoneBeforeDate:(id)a3;
- (MFRemoteSearchResults)searchResult;
- (NSDate)earliestDateAdded;
- (NSDate)latestDateToAdd;
- (_MFDAMSSearchResponseConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4;
- (void)resetDoneCondition;
- (void)searchQuery:(id)a3 finishedWithError:(id)a4;
- (void)searchQuery:(id)a3 returnedResults:(id)a4;
- (void)searchQuery:(id)a3 returnedTotalCount:(id)a4;
- (void)setLatestDateToAdd:(id)a3;
- (void)waitUntilDone;
@end

@implementation _MFDAMSSearchResponseConsumer

- (_MFDAMSSearchResponseConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_MFDAMSSearchResponseConsumer;
  v4 = [(_MFDAMSBasicConsumer *)&v12 initWithMaximumSize:*(void *)&a3 latency:a4];
  if (v4)
  {
    v4->timeReceivedLastResponse = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"done" condition:0 andDelegate:v4];
    doneCondition = v4->doneCondition;
    v4->doneCondition = (MFConditionLock *)v5;

    v7 = objc_alloc_init(MFRemoteSearchResults);
    searchResult = v4->searchResult;
    v4->searchResult = v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    earliestDateAdded = v4->earliestDateAdded;
    v4->earliestDateAdded = (NSDate *)v9;
  }
  return v4;
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4 = a3;
  int v5 = [(MFConditionLock *)self->doneCondition lockWhenCondition:1 beforeDate:v4];
  if (v5) {
    [(MFConditionLock *)self->doneCondition unlock];
  }

  return v5;
}

- (void)waitUntilDone
{
  [(MFConditionLock *)self->doneCondition lockWhenCondition:1];
  doneCondition = self->doneCondition;
  [(MFConditionLock *)doneCondition unlock];
}

- (void)resetDoneCondition
{
  [(MFConditionLock *)self->doneCondition lock];
  doneCondition = self->doneCondition;
  [(MFConditionLock *)doneCondition unlockWithCondition:0];
}

- (BOOL)handleItems:(id)a3
{
  id v4 = a3;
  int v5 = [(_MFDAMSBasicConsumer *)self error];
  v6 = v5;
  if (!v5
    || (([v5 domain],
         v7 = objc_claimAutoreleasedReturnValue(),
         char v8 = [v7 isEqualToString:*MEMORY[0x1E4F5E920]],
         v7,
         [v6 code] == 78)
      ? (char v9 = v8)
      : (char v9 = 0),
        (v9 & 1) != 0))
  {
    if (![(MFActivityMonitor *)self->super.monitor shouldCancel])
    {
      if ([(MFDAMessageStore *)self->super.store backedByVirtualAllSearchMailbox])
      {
        v10 = objc_msgSend(v4, "ef_groupBy:", &__block_literal_global_28);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __45___MFDAMSSearchResponseConsumer_handleItems___block_invoke_2;
        v13[3] = &unk_1E5D3E410;
        v13[4] = self;
        [v10 enumerateKeysAndObjectsUsingBlock:v13];
      }
      else
      {
        library = self->super.library;
        v10 = [(MFLibraryStore *)self->super.store account];
        self->super.numNewMessages += insertDAMessages(v4, library, v10, self->super.mailbox, 1, 0);
      }
    }
  }

  return 1;
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  self->timeReceivedLastResponse = CFAbsoluteTimeGetCurrent();
  if (![(MFActivityMonitor *)self->super.monitor shouldCancel])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v33;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    v37 = self;
    if (v5)
    {
      uint64_t v35 = *(void *)v39;
      *(void *)&long long v6 = 138412290;
      long long v32 = v6;
      do
      {
        uint64_t v36 = v5;
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(obj);
          }
          char v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          char v9 = objc_msgSend(v8, "date", v32);
          v10 = v9;
          if (!self->latestDateToAdd
            || (objc_msgSend(v9, "earlierDate:"),
                v11 = objc_claimAutoreleasedReturnValue(),
                BOOL v12 = v10 == v11,
                v11,
                self = v37,
                v12))
          {
            v13 = [v8 longID];
            if (!v13)
            {
              v13 = [v8 serverID];
            }
            v14 = self->super.mailbox;
            if ([(MFDAMessageStore *)self->super.store backedByVirtualAllSearchMailbox])
            {
              v15 = [(MFMailboxUid *)self->super.mailbox account];
              v16 = [v8 folderID];
              uint64_t v17 = [v15 mailboxForFolderID:v16];

              v14 = (MFDAMailbox *)v17;
              if (!v17)
              {
                v18 = MFLogGeneral();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v32;
                  v43 = v16;
                  _os_log_error_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_ERROR, "DAMessageStore - allMailboxes searchQuery returned result with invalid folderID: %@", buf, 0xCu);
                }

                v14 = v37->super.mailbox;
              }

              self = v37;
            }
            if (v13 && v14) {
              [(MFRemoteSearchResults *)self->searchResult addRemoteID:v13 mailbox:v14];
            }
            v19 = [(MFDAMessageStore *)self->super.store messageForRemoteID:v13 inMailbox:v14];
            BOOL v20 = v19 == 0;

            if (v20)
            {
              v21 = [[MFDAMessage alloc] initWithDAMailMessage:v8 mailbox:v14];
              [(MFBufferedQueue *)v37 addItem:v21];
              earliestDateAdded = v37->earliestDateAdded;
              v23 = [(MFDAMessage *)v21 dateReceived];
              v24 = v23;
              if (!v23) {
                v24 = v37->earliestDateAdded;
              }
              uint64_t v25 = [(NSDate *)earliestDateAdded earlierDate:v24];
              v26 = v37->earliestDateAdded;
              v37->earliestDateAdded = (NSDate *)v25;
            }
          }

          self = v37;
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v5);
    }

    v27 = v37->earliestDateAdded;
    v28 = [MEMORY[0x1E4F1C9C8] distantFuture];
    BOOL v29 = [(NSDate *)v27 isEqualToDate:v28];

    if (v29)
    {
      v30 = 0;
      v31 = v37;
    }
    else
    {
      v31 = v37;
      v30 = v37->earliestDateAdded;
    }
    [(MFRemoteSearchResults *)v31->searchResult setContinueOffset:v30];
  }
}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    char v8 = [v6 domain];
    char v9 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", v8, [v7 code], 0);
    [(_MFDAMSBasicConsumer *)self setError:v9];
  }
  [(MFBufferedQueue *)self flush];
  [(MFConditionLock *)self->doneCondition lock];
  [(MFConditionLock *)self->doneCondition unlockWithCondition:1];
}

- (void)searchQuery:(id)a3 returnedTotalCount:(id)a4
{
  self->totalCount = objc_msgSend(a4, "unsignedIntValue", a3);
}

- (NSDate)latestDateToAdd
{
  return self->latestDateToAdd;
}

- (void)setLatestDateToAdd:(id)a3
{
}

- (MFRemoteSearchResults)searchResult
{
  return self->searchResult;
}

- (NSDate)earliestDateAdded
{
  return self->earliestDateAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchResult, 0);
  objc_storeStrong((id *)&self->doneCondition, 0);
  objc_storeStrong((id *)&self->earliestDateAdded, 0);
  objc_storeStrong((id *)&self->latestDateToAdd, 0);
}

@end