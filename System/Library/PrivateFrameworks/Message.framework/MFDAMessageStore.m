@interface MFDAMessageStore
- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (BOOL)allowsAppend;
- (BOOL)backedByVirtualAllSearchMailbox;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)canFetchSearchResults;
- (BOOL)hasMoreFetchableMessages;
- (BOOL)messageCanBeTriaged:(id)a3;
- (BOOL)replayFlagChange:(id)a3 forRemoteIDs:(id)a4 error:(id *)a5 completed:(BOOL *)a6;
- (BOOL)shouldDownloadBodyDataForMessage:(id)a3;
- (BOOL)shouldGrowFetchWindow;
- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3;
- (MFDAMessageStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4;
- (id)_downloadHeadersForMessages:(id)a3;
- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6;
- (id)_fetchBodyDataForNormalMessage:(id)a3 format:(int)a4 part:(id)a5 streamConsumer:(id)a6;
- (id)_fetchBodyDataForSearchResult:(id)a3 folderID:(id)a4 format:(int)a5 streamConsumer:(id)a6;
- (id)bestAlternativeForPart:(id)a3;
- (id)defaultAlternativeForPart:(id)a3;
- (id)fetchBodyDataForRemoteID:(id)a3;
- (id)folderIDForFetching;
- (id)loadMeetingDataForMessage:(id)a3;
- (id)loadMeetingExternalIDForMessage:(id)a3;
- (id)loadMeetingMetadataForMessage:(id)a3;
- (id)messageForRemoteID:(id)a3;
- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7;
- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (unint64_t)fetchWindow;
- (unint64_t)growFetchWindow;
- (void)_remoteIDsMatchingSearchText:(id)a3 predicate:(id)a4 limit:(unsigned int)a5 offset:(id)a6 filterByDate:(BOOL)a7 handler:(id)a8;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)setBackedByVirtualAllSearchMailbox:(BOOL)a3;
@end

@implementation MFDAMessageStore

- (MFDAMessageStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFDAMessageStore;
  v7 = [(MFLibraryStore *)&v11 initWithMailbox:v6 readOnly:v4];
  if (v7)
  {
    v8 = [v6 folderID];
    char v9 = [v8 isEqualToString:@"kDAMailAccountAllMailboxesFolderID"];

    v7->_backedByVirtualAllSearchMailbox = v9;
  }

  return v7;
}

- (id)folderIDForFetching
{
  v3 = +[MFActivityMonitor currentMonitor];
  BOOL v4 = [(MFLibraryStore *)self mailbox];
  [v3 setMailbox:v4];

  v5 = [(MFLibraryStore *)self mailbox];
  id v6 = [v5 folderID];
  if (!v6)
  {
    v7 = [(MFLibraryStore *)self account];
    [v7 fetchMailboxListImplicit];

    id v6 = [v5 folderID];
  }

  return v6;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a4;
  [(MFLibraryStore *)self willFetchMessages];
  char v9 = [(MFDAMessageStore *)self folderIDForFetching];
  if (!v9)
  {
    v21 = [(MFLibraryStore *)self account];
    uint64_t v22 = [v21 finishedInitialMailboxListLoad];

    uint64_t numNewMessages = v22 << 63 >> 63;
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v10 = [(MFLibraryStore *)self mailbox];
  objc_super v11 = objc_alloc_init(_MFDAMSUpdateConsumer);
  objc_storeStrong((id *)&v11->super.store, self);
  objc_storeStrong((id *)&v11->super.mailbox, v10);
  v12 = +[MFActivityMonitor currentMonitor];
  [(_MFDAMSBasicConsumer *)v11 setMonitor:v12];

  v13 = [(MFLibraryStore *)self library];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MFDAMessageStore fetchNumMessages:preservingUID:options:]", "MFDAMessageStore.m", 257, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");
  }

  uint64_t v14 = [(MFLibraryStore *)self library];
  library = v11->super.library;
  v11->super.library = (MFMailMessageLibrary *)v14;

  id v16 = [[_MFDAMessageStoreGetUpdatesRequest alloc] initRequestForBodyFormat:0 withBodySizeLimit:500 isUserRequested:v5 & 1];
  v17 = [(MFLibraryStore *)self account];
  [v17 addRequest:v16 consumer:v11 mailbox:v10];

  if (![(MFBufferedQueue *)v11 isEmpty])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:264 description:@"update consumer queue should be empty at this point."];
  }
  v18 = [(_MFDAMSBasicConsumer *)v11 error];

  if (v18)
  {
    uint64_t numNewMessages = +[MFActivityMonitor currentMonitor];
    v19 = [(_MFDAMSBasicConsumer *)v11 error];
    [(id)numNewMessages setError:v19];

    LODWORD(numNewMessages) = -1;
  }
  else
  {
    uint64_t numNewMessages = v11->super.numNewMessages;
  }

  if ((v5 & 2) != 0)
  {
LABEL_11:
    v23 = [(MFLibraryStore *)self serverSearchResults];
    [(MFLibraryStore *)self compactMessages:v23];
  }
LABEL_12:
  v24 = +[MFActivityMonitor currentMonitor];
  [v24 reset];

  return (int)numNewMessages;
}

- (void)_remoteIDsMatchingSearchText:(id)a3 predicate:(id)a4 limit:(unsigned int)a5 offset:(id)a6 filterByDate:(BOOL)a7 handler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v64 = a4;
  id v60 = a6;
  v61 = (void (**)(id, unint64_t, MFRemoteSearchResults *))a8;
  v65 = [(MFDAMessageStore *)self folderIDForFetching];
  uint64_t v14 = MFLogGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v67 = (uint64_t)v63;
    __int16 v68 = 2112;
    unint64_t v69 = (unint64_t)v64;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "About to process remote ids matching searchtext:%@ predicate: %@", buf, 0x16u);
  }

  if (v65)
  {
    id v59 = [(MFLibraryStore *)self mailbox];
    v15 = objc_alloc_init(_MFDAMSSearchResponseConsumer);
    objc_storeStrong((id *)&v15->super.store, self);
    objc_storeStrong((id *)&v15->super.mailbox, v59);
    id v16 = +[MFActivityMonitor currentMonitor];
    [(_MFDAMSBasicConsumer *)v15 setMonitor:v16];

    v17 = [(MFLibraryStore *)self library];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:]", "MFDAMessageStore.m", 313, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");
    }

    uint64_t v18 = [(MFLibraryStore *)self library];
    library = v15->super.library;
    v15->super.library = (MFMailMessageLibrary *)v18;

    v15->totalCount = 0;
    if (v60)
    {
      id v20 = v60;
      goto LABEL_15;
    }
    if (v9)
    {
      v25 = [(MFLibraryStore *)self dateOfOldestNonIndexedNonSearchResultMessage];
      v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
      int v27 = [v25 isEqualToDate:v26];

      if (!v27)
      {
        id v20 = v25;
LABEL_15:
        v62 = v20;
        -[_MFDAMSSearchResponseConsumer setLatestDateToAdd:](v15, "setLatestDateToAdd:");
        v28 = MFUserAgent();
        [v28 networkActivityStarted:self];

        if ([(MFDAMessageStore *)self backedByVirtualAllSearchMailbox])
        {

          v65 = 0;
        }
        if (v15->super.numNewMessages < a5)
        {
          uint64_t v29 = 0;
          unint64_t v30 = a5;
          while (1)
          {
            v31 = [(_MFDAMSBasicConsumer *)v15 error];
            BOOL v32 = v31 == 0;

            if (!v32) {
              goto LABEL_36;
            }
            v33 = [MEMORY[0x1E4F5E980] mailboxSearchQueryWithSearchString:v63 predicate:v64 consumer:v15];
            [v33 setBodyType:1];
            [v33 setCollectionID:v65];
            [v33 setMIMESupport:0];
            objc_msgSend(v33, "setRange:", v29, 100);
            [v33 setTruncationSize:500];
            [v33 setPriorToDate:v62];
            [v33 setDeepTraversal:1];
            v34 = [(MFLibraryStore *)self account];
            v35 = [v34 accountConduit];

            [v35 performSearchQuery:v33];
            v36 = +[MFActivityMonitor currentMonitor];
            while (1)
            {
              v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:1.0];
              if ([(_MFDAMSSearchResponseConsumer *)v15 waitUntilDoneBeforeDate:v37]) {
                break;
              }
              if ([v36 shouldCancel])
              {
                [v35 cancelSearchQuery:v33];
                [(_MFDAMSSearchResponseConsumer *)v15 waitUntilDone];
                char v39 = 0;
                goto LABEL_30;
              }
            }
            v38 = [(_MFDAMSBasicConsumer *)v15 error];
            if (v38) {
              break;
            }
            if (v29 + 100 >= (unint64_t)v15->totalCount) {
              goto LABEL_29;
            }
            [(_MFDAMSSearchResponseConsumer *)v15 resetDoneCondition];
            char v39 = 0;
            v29 += 100;
LABEL_30:

            if (v15->super.numNewMessages >= v30) {
              char v40 = 1;
            }
            else {
              char v40 = v39;
            }
            if (v40) {
              goto LABEL_36;
            }
          }

LABEL_29:
          char v39 = 1;
          goto LABEL_30;
        }
        uint64_t v29 = 0;
LABEL_36:
        v41 = MFUserAgent();
        [v41 networkActivityEnded:self];

        if (![(MFBufferedQueue *)v15 isEmpty])
        {
          v57 = [MEMORY[0x1E4F28B00] currentHandler];
          [v57 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:377 description:@"update consumer queue should be empty at this point."];
        }
        v42 = [(_MFDAMSBasicConsumer *)v15 error];

        if (!v42) {
          goto LABEL_58;
        }
        v43 = [(_MFDAMSBasicConsumer *)v15 error];
        v44 = [v43 domain];
        int v45 = [v44 isEqualToString:*MEMORY[0x1E4F5E920]];

        v46 = [(_MFDAMSBasicConsumer *)v15 error];
        uint64_t v47 = [v46 code];

        char v48 = v47 == 78 ? v45 : 0;
        if (v48) {
          goto LABEL_58;
        }
        if (v47 == 29) {
          int v49 = v45;
        }
        else {
          int v49 = 0;
        }
        if (v49 == 1)
        {
          v50 = MFLogGeneral();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:]((uint64_t)v64, v50);
          }
        }
        else
        {
          if (v47 == 30) {
            int v51 = v45;
          }
          else {
            int v51 = 0;
          }
          if (v51 != 1)
          {
LABEL_56:
            v52 = [(_MFDAMSBasicConsumer *)v15 error];
            if (v52)
            {
              v53 = +[MFActivityMonitor currentMonitor];
              v54 = [(_MFDAMSBasicConsumer *)v15 error];
              [v53 setError:v54];

              v23 = 0;
              unint64_t numNewMessages = -1;
LABEL_62:

              goto LABEL_63;
            }
LABEL_58:
            v23 = [(_MFDAMSSearchResponseConsumer *)v15 searchResult];
            unint64_t numNewMessages = v15->super.numNewMessages;
            if (numNewMessages < v29 + 100)
            {
              v55 = MFLogGeneral();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                uint64_t v56 = objc_opt_class();
                *(_DWORD *)buf = 138412802;
                uint64_t v67 = v56;
                __int16 v68 = 2048;
                unint64_t v69 = numNewMessages;
                __int16 v70 = 2048;
                uint64_t v71 = v29 + 100;
                _os_log_impl(&dword_1A7EFF000, v55, OS_LOG_TYPE_INFO, "%@ Seems like the server exhausted the search results (%ld of %lu), un-setting a continue offset", buf, 0x20u);
              }

              [(MFRemoteSearchResults *)v23 setContinueOffset:0];
            }
            goto LABEL_62;
          }
          v50 = MFLogGeneral();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:](v50);
          }
        }

        goto LABEL_56;
      }
    }
    id v20 = 0;
    goto LABEL_15;
  }
  v21 = [(MFLibraryStore *)self account];
  char v22 = [v21 finishedInitialMailboxListLoad];

  if (v22)
  {
    v23 = 0;
    v65 = 0;
    unint64_t numNewMessages = -1;
  }
  else
  {
    unint64_t numNewMessages = 0;
    v65 = 0;
    v23 = objc_alloc_init(MFRemoteSearchResults);
  }
LABEL_63:
  v61[2](v61, numNewMessages, v23);
}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  if (a7)
  {
    v13 = 0;
  }
  else
  {
    uint64_t v14 = DALoggingwithCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "Searching for criterion: %@", (uint8_t *)&buf, 0xCu);
    }

    v15 = [v11 daSearchPredicate];
    if (v15)
    {
      id v16 = [v11 daBasicSearchString];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__11;
      v24 = __Block_byref_object_dispose__11;
      id v25 = 0;
      if ([v16 length])
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __88__MFDAMessageStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke;
        v20[3] = &unk_1E5D3E3A0;
        v20[4] = &buf;
        [(MFDAMessageStore *)self _remoteIDsMatchingSearchText:v16 predicate:v15 limit:v9 offset:v12 filterByDate:1 handler:v20];
      }
      else
      {
        v17 = DALoggingwithCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Attempted to fetch messages from DA without searchText", v19, 2u);
        }
      }
      v13 = [MEMORY[0x1E4F60D70] futureWithResult:*(void *)(*((void *)&buf + 1) + 40)];
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v16 = DALoggingwithCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "Predicate is not supported, bailing.", (uint8_t *)&buf, 2u);
      }
      v13 = 0;
    }
  }
  return v13;
}

void __88__MFDAMessageStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (BOOL)replayFlagChange:(id)a3 forRemoteIDs:(id)a4 error:(id *)a5 completed:(BOOL *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v7 = a4;
  uint64_t v47 = v7;
  id v8 = DALoggingwithCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "Replaying flag change %@ for remote ids: %@", buf, 0x16u);
  }

  if (a5) {
    *a5 = 0;
  }
  uint64_t v9 = [(MFLibraryStore *)self mailbox];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v73 = 1;
  id v49 = v9;
  v10 = [v9 folderID];

  if (!v10)
  {
    p_super = DALoggingwithCategory();
    BOOL v18 = 1;
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    v19 = objc_msgSend(v49, "ef_publicDescription");
    *(_DWORD *)unint64_t v69 = 138412290;
    id v70 = v19;
    id v20 = p_super;
    _os_log_impl(&dword_1A7EFF000, p_super, OS_LOG_TYPE_INFO, "No folder ID for mailbox: %@", v69, 0xCu);

LABEL_52:
    p_super = v20;
    goto LABEL_53;
  }
  id v11 = [(MFLibraryStore *)self account];
  int v12 = [v11 supportsMessageFlagging];

  int v13 = [v51 readChanged];
  if (v13)
  {
    unsigned int v14 = [v51 read];
    uint64_t v15 = v14;
    uint64_t v16 = v14 ^ 1;
    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if (!v12) {
      goto LABEL_17;
    }
  }
  if ([v51 flaggedChanged])
  {
    if ([v51 flagged]) {
      v15 |= 2uLL;
    }
    else {
      v16 |= 2uLL;
    }
    int v13 = 1;
  }
LABEL_17:
  int v44 = [v51 deleted];
  if ((v13 | v44) != 1)
  {
    p_super = DALoggingwithCategory();
    BOOL v18 = 1;
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    v41 = objc_msgSend(v51, "ef_publicDescription");
    *(_DWORD *)unint64_t v69 = 138412290;
    id v70 = v41;
    id v20 = p_super;
    _os_log_impl(&dword_1A7EFF000, p_super, OS_LOG_TYPE_INFO, "No request needed for flag change: %@", v69, 0xCu);

    goto LABEL_52;
  }
  v53 = objc_alloc_init(_MFDAMSUpdateConsumer);
  objc_storeStrong((id *)&v53->super.store, self);
  objc_storeStrong((id *)&v53->super.mailbox, v49);
  v21 = +[MFActivityMonitor currentMonitor];
  [(_MFDAMSBasicConsumer *)v53 setMonitor:v21];

  uint64_t v22 = [(MFLibraryStore *)self library];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MFDAMessageStore replayFlagChange:forRemoteIDs:error:completed:]", "MFDAMessageStore.m", 502, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");
  }

  uint64_t v23 = [(MFLibraryStore *)self library];
  library = v53->super.library;
  v53->super.library = (MFMailMessageLibrary *)v23;

  if (v13)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v52 = v47;
    uint64_t v26 = [v52 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v52);
          }
          id v29 = [(DAMailboxSetFlagsRequest *)[_MFDAMessageStoreSetFlagsRequest alloc] initRequestWithSetFlags:v15 unsetFlags:v16 message:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          unint64_t v30 = [MEMORY[0x1E4F60DF0] pairWithFirst:v29 second:v53];
          [v25 addObject:v30];
        }
        uint64_t v26 = [v52 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v26);
    }

    if ([v25 count])
    {
      v31 = DALoggingwithCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)unint64_t v69 = 138412290;
        id v70 = v25;
        _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_INFO, "Adding flag change requests: %@", v69, 0xCu);
      }

      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke;
      v61[3] = &unk_1E5D3E3C8;
      id v63 = buf;
      v61[4] = self;
      id v62 = v49;
      objc_msgSend(v25, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v61);
    }
  }
  if (v44)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v33 = v47;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v58 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = [(DAMailboxDeleteMessageRequest *)[_MFDAMessageStoreDeleteRequest alloc] initRequestWithMessageID:*(void *)(*((void *)&v57 + 1) + 8 * j)];
          v38 = [MEMORY[0x1E4F60DF0] pairWithFirst:v37 second:v53];
          [v32 addObject:v38];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v34);
    }

    if ([v32 count])
    {
      char v39 = DALoggingwithCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)unint64_t v69 = 138412290;
        id v70 = v32;
        _os_log_impl(&dword_1A7EFF000, v39, OS_LOG_TYPE_INFO, "Adding delete requests: %@", v69, 0xCu);
      }

      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke_39;
      v54[3] = &unk_1E5D3E3C8;
      uint64_t v56 = buf;
      v54[4] = self;
      id v55 = v49;
      objc_msgSend(v32, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v54);
    }
  }
  if (![(MFBufferedQueue *)v53 isEmpty])
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:541 description:@"update consumer queue should be empty at this point."];
  }
  p_super = &v53->super.super.super;
  error = v53->super.error;
  BOOL v18 = error == 0;
  if (a5 && error)
  {
    *a5 = error;
    p_super = &v53->super.super.super;
  }
LABEL_53:

  if (a6) {
    *a6 = *(unsigned char *)(*(void *)&buf[8] + 24);
  }
  _Block_object_dispose(buf, 8);

  return v18;
}

void __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  char v5 = [*(id *)(a1 + 32) account];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 addRequests:v6 mailbox:*(void *)(a1 + 40) combine:1];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
}

void __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke_39(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  char v5 = [*(id *)(a1 + 32) account];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 addRequests:v6 mailbox:*(void *)(a1 + 40) combine:1];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
}

- (BOOL)allowsAppend
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  id v4 = a3;
  char v5 = [(MFLibraryStore *)self mailbox];
  id v6 = [(MFDAMessageStore *)self messageForRemoteID:v4 inMailbox:v5];

  return v6;
}

- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFLibraryStore *)self library];
  uint64_t v9 = [v7 URLString];
  v10 = [v8 messageWithRemoteID:v6 inRemoteMailbox:v9];

  [v10 setMessageStore:self];
  return v10;
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(MFLibraryStore *)self mailbox];
  id v8 = [v7 URLString];

  uint64_t v9 = [(MFMailMessageLibrary *)self->super._library messagesForMailbox:v8 olderThanNumberOfDays:v5];
  int v13 = @"MessageIsDeleted";
  v14[0] = MEMORY[0x1E4F1CC38];
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v11 = [(MFLibraryStore *)self setFlagsFromDictionary:v10 forMessages:v9];

  v12.receiver = self;
  v12.super_class = (Class)MFDAMessageStore;
  [(MFLibraryStore *)&v12 deleteMessagesOlderThanNumberOfDays:v5 compact:v4];
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  id v3 = a3;
  if (([v3 messageFlags] & 0x80) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isMessageContentsLocallyAvailable];
  }
  char v5 = v4 ^ 1;

  return v5;
}

- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3
{
  return 0;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFDAMessageStore.m", 596, @"should only have LibraryMessages in %s", "-[MFDAMessageStore loadMeetingExternalIDForMessage:]");
  }
  id v6 = [(MFMailMessageLibrary *)self->super._library loadMeetingExternalIDForMessage:v5];

  return v6;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFDAMessageStore.m", 601, @"should only have LibraryMessages in %s", "-[MFDAMessageStore loadMeetingDataForMessage:]");
  }
  id v6 = [(MFMailMessageLibrary *)self->super._library loadMeetingDataForMessage:v5];

  return v6;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFDAMessageStore.m", 606, @"should only have LibraryMessages in %s", "-[MFDAMessageStore loadMeetingMetadataForMessage:]");
  }
  id v6 = [(MFMailMessageLibrary *)self->super._library loadMeetingMetadataForMessage:v5];

  return v6;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (id)fetchBodyDataForRemoteID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "Fetching body data for remote id: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = objc_alloc_init(MFDAMessageContentConsumer);
  [(MFDAMessageContentConsumer *)v6 setRequestedFormat:1];
  id v7 = objc_alloc_init(_MFDAMessageBodyFetchConsumer);
  [(_MFDAMessageBodyFetchConsumer *)v7 setStreamConsumer:v6];
  id v8 = [(DAMailboxFetchMessageRequest *)[_MFDAMessageStoreFetchUsingRemoteIDRequest alloc] initRequestForBodyFormat:1 withMessageID:v4 withBodySizeLimit:0xFFFFFFFFLL];
  uint64_t v9 = [(MFLibraryStore *)self account];
  v10 = [(MFLibraryStore *)self mailbox];
  [v9 addRequest:v8 consumer:v7 mailbox:v10];

  if ([(_MFDAMessageBodyFetchConsumer *)v7 succeeded])
  {
    id v11 = [(_MFDAMessageBodyFetchConsumer *)v7 data];
  }
  else
  {
    objc_super v12 = DALoggingwithCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_ERROR, "failed to download body for message \"%@\"", (uint8_t *)&v14, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)_fetchBodyDataForSearchResult:(id)a3 folderID:(id)a4 format:(int)a5 streamConsumer:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v35 = (char *)a4;
  id v11 = a6;
  objc_super v12 = DALoggingwithCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = objc_msgSend(v10, "ef_publicDescription");
    *(_DWORD *)long long buf = 138412546;
    v38 = v13;
    __int16 v39 = 2112;
    char v40 = v35;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "Fetching body data for search result %@ in folder %@", buf, 0x16u);
  }
  int v14 = [v10 remoteID];
  if ([v10 isSearchResultWithBogusRemoteId])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F5E858]);
    uint64_t v16 = 0;
    v17 = 0;
    BOOL v18 = v14;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F5E858]);
    BOOL v18 = 0;
    uint64_t v16 = v35;
    v17 = v14;
  }
  v19 = (void *)[v15 initRequestForBodyFormat:v7 withFolderID:v16 withServerID:v17 withLongID:v18 withBodySizeLimit:0xFFFFFFFFLL];
  id v20 = objc_alloc_init(_MFDAMessageStoreSearchResultBodyConsumer);
  [(_MFDAMessageStoreSearchResultBodyConsumer *)v20 setStreamConsumer:v11];
  v21 = [(MFLibraryStore *)self account];
  uint64_t v22 = [v21 accountConduit];

  v36 = v19;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  uint64_t v24 = [v22 performFetchMessageSearchResultRequests:v23 consumer:v20];

  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v26 = +[MFActivityMonitor currentMonitor];
  double v27 = Current + 60.0;
  while (1)
  {
    double v28 = CFAbsoluteTimeGetCurrent();
    if (v28 >= v27) {
      break;
    }
    id v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:1.0];
    if ([(_MFDAMessageStoreSearchResultBodyConsumer *)v20 waitUntilDoneBeforeDate:v29])
    {

      v31 = +[MFNetworkController sharedInstance];
      objc_msgSend(v26, "recordTransportType:", -[NSObject transportType](v31, "transportType"));
      goto LABEL_19;
    }
    if ([v26 shouldCancel])
    {
      [v22 cancelTaskWithID:v24];
      [(_MFDAMessageStoreSearchResultBodyConsumer *)v20 waitUntilDone];

      break;
    }
    if ([v11 didBeginStreaming])
    {
      [v11 timeOfLastActivity];
      double v27 = v30 + 60.0;
    }
  }
  v31 = DALoggingwithCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = "timed out";
    if (v28 < v27) {
      id v32 = "was cancelled";
    }
    *(_DWORD *)long long buf = 138412546;
    v38 = v14;
    __int16 v39 = 2080;
    char v40 = v32;
    _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_INFO, "Search result body fetch for message %@ %s", buf, 0x16u);
  }
LABEL_19:

  id v33 = [v11 data];

  return v33;
}

- (id)_fetchBodyDataForNormalMessage:(id)a3 format:(int)a4 part:(id)a5 streamConsumer:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  int v14 = [_MFDAMessageStoreFetchRequest alloc];
  id v15 = [v11 remoteID];
  uint64_t v16 = [(DAMailboxFetchMessageRequest *)v14 initRequestForBodyFormat:v8 withMessageID:v15 withBodySizeLimit:0xFFFFFFFFLL];

  v17 = DALoggingwithCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    BOOL v18 = objc_msgSend(v11, "ef_publicDescription");
    int v32 = 138412546;
    id v33 = v18;
    __int16 v34 = 1024;
    int v35 = v8;
    _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "Fetching body data for message %@. format: %d", (uint8_t *)&v32, 0x12u);
  }
  objc_storeStrong(v16 + 5, self);
  objc_storeStrong(v16 + 6, a3);
  objc_storeStrong(v16 + 7, a5);
  v19 = objc_alloc_init(_MFDAMessageBodyFetchConsumer);
  [(_MFDAMessageBodyFetchConsumer *)v19 setStreamConsumer:v13];
  objc_storeStrong(v16 + 4, v19);
  id v20 = [(MFLibraryStore *)self account];
  v21 = [(MFLibraryStore *)self mailbox];
  [v20 addRequest:v16 consumer:v19 mailbox:v21];

  if ([(_MFDAMessageBodyFetchConsumer *)v19 succeeded])
  {
    uint64_t v22 = DALoggingwithCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_msgSend(v11, "ef_publicDescription");
      int v32 = 138412546;
      id v33 = v23;
      __int16 v34 = 1024;
      int v35 = v8;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_INFO, "Successfully downloaded body for message: %@. format: %d", (uint8_t *)&v32, 0x12u);
    }
    uint64_t v24 = [(_MFDAMessageBodyFetchConsumer *)v19 data];
  }
  else
  {
    id v25 = DALoggingwithCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v11 remoteID];
      int v32 = 138412290;
      id v33 = v26;
      _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_ERROR, "Failed to download body for message \"%@\"", (uint8_t *)&v32, 0xCu);
    }
    uint64_t v24 = 0;
  }
  double v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[_MFDAMessageBodyFetchConsumer hasLocalCopyOfData](v19, "hasLocalCopyOfData"));
  double v28 = +[MFActivityMonitor currentMonitor];
  id v29 = +[MFNetworkController sharedInstance];
  objc_msgSend(v28, "recordTransportType:", objc_msgSend(v29, "transportType"));

  double v30 = [MEMORY[0x1E4F60DF0] pairWithFirst:v24 second:v27];

  return v30;
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = +[MFActivityMonitor currentMonitor];
  [v11 recordTransportType:1];

  v45.receiver = self;
  v45.super_class = (Class)MFDAMessageStore;
  id v12 = [(MFLibraryStore *)&v45 _fetchBodyDataForMessage:v10 andHeaderDataIfReadilyAvailable:a4 downloadIfNecessary:v7 partial:a6];
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = !v7;
  }
  if (!v13)
  {
    uint64_t v41 = [(MFLibraryStore *)self mailbox];
    v43 = [v41 folderID];
    if (!v43)
    {
      id v12 = 0;
LABEL_38:

      goto LABEL_39;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v10;
    }
    else
    {
      int v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v47 = v10;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "#Warning DAMessageStore: this is not a MFLibraryMessage: %@", buf, 0xCu);
      }

      id v40 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = v10;
    }
    else
    {
      id v15 = MFLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v47 = v10;
        _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "#Warning DAMessageStore: this is not a MFMailMessage: %@", buf, 0xCu);
      }

      id v42 = 0;
    }
    uint64_t v16 = [(MFLibraryStore *)self library];
    __int16 v39 = [v16 dataConsumerForMessage:v40 isPartial:0];

    v17 = objc_alloc_init(MFDAMessageContentConsumer);
    [(MFDAMessageContentConsumer *)v17 setRequestedFormat:1];
    [(MFDAMessageContentConsumer *)v17 setDataConsumer:v39];
    int v44 = objc_alloc_init(_MFDALibraryConsumerFactory);
    BOOL v18 = [(MFLibraryStore *)self library];
    [(_MFDALibraryConsumerFactory *)v44 setLibrary:v18];

    [(_MFDALibraryConsumerFactory *)v44 setMessage:v10];
    [(MFDAMessageContentConsumer *)v17 setConsumerFactory:v44];
    if (([v42 messageFlags] & 0x80) != 0)
    {
      [(MFDAMessageStore *)self _fetchBodyDataForSearchResult:v42 folderID:v43 format:1 streamConsumer:v17];
      v20 = char v22 = 0;
    }
    else
    {
      v19 = [(MFDAMessageStore *)self _fetchBodyDataForNormalMessage:v10 format:1 part:0 streamConsumer:v17];
      id v20 = [v19 first];
      v21 = [v19 second];
      char v22 = [v21 BOOLValue];
    }
    uint64_t v23 = +[MFActivityMonitor currentMonitor];
    uint64_t v24 = +[MFNetworkController sharedInstance];
    objc_msgSend(v23, "recordTransportType:", objc_msgSend(v24, "transportType"));

    id v25 = [(MFDAMessageContentConsumer *)v17 message];
    uint64_t v26 = (void *)MFCreateExternalConversationID(v25);

    if (v26)
    {
      uint64_t v27 = MFStringHashForMessageID();
      if (v20)
      {
LABEL_22:
        if (v22)
        {
          id v12 = v20;
        }
        else
        {
          uint64_t v28 = objc_msgSend(v20, "mf_rangeOfRFC822HeaderData");
          uint64_t v30 = v29;
          uint64_t v38 = v28 + v29;
          if (v28 + v29 <= (unint64_t)[v20 length])
          {
            v31 = objc_msgSend(v20, "mf_subdataWithRange:", v28, v30);
            int v32 = v31;
            if (a4)
            {
              id v33 = v31;
              *a4 = v33;
              __int16 v34 = (void *)[objc_alloc(MEMORY[0x1E4F73508]) initWithHeaderData:v33 encoding:134217984];
              [(MFMailMessageLibrary *)self->super._library updateThreadingInfoForMessage:v40 fromHeaders:v34];
              if ([v41 mailboxType] == 4 && v27) {
                [(MFMailMessageLibrary *)self->super._library updateAdditionalThreadingInfoForSentMessageWithHeaders:v34 externalConversationID:v27];
              }
            }
            objc_msgSend(v20, "mf_subdataWithRange:", v38, objc_msgSend(v20, "length") - v38);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            [(MFMailMessageLibrary *)self->super._library storeRemoteContentLinksFromHeaderData:v32 bodyData:v12 forMessage:v40];
          }
          else
          {
            id v12 = 0;
          }
        }
        int v35 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v12 partial:0 incomplete:0];
        id v36 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v10 valueIfNotPresent:v35];
        if (a6) {
          *a6 = 0;
        }

        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v27 = 0;
      if (v20) {
        goto LABEL_22;
      }
    }
    id v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
LABEL_39:

  return v12;
}

- (id)_downloadHeadersForMessages:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = DALoggingwithCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "Downloading headers for messages", buf, 2u);
  }

  id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v26 = [(MFLibraryStore *)self mailbox];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obunint64_t j = v25;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v9 = [_MFDAMessageStoreFetchHeadersRequest alloc];
        id v10 = [v8 remoteID];
        id v11 = [(DAMailboxFetchMessageRequest *)v9 initRequestForBodyFormat:0xFFFFFFFFLL withMessageID:v10 withBodySizeLimit:0xFFFFFFFFLL];

        objc_storeStrong(v11 + 5, self);
        objc_storeStrong(v11 + 6, v8);
        id v12 = objc_alloc_init(_MFDAMessageHeaderFetchConsumer);
        [(_MFDAMessageHeaderFetchConsumer *)v12 setStore:self];
        BOOL v13 = [MEMORY[0x1E4F60DF0] pairWithFirst:v11 second:v12];
        [v29 addObject:v13];
        [v31 addObject:v11];
        [v30 addObject:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v5);
  }

  int v14 = [(MFLibraryStore *)self account];
  [v14 addRequests:v29 mailbox:v26];

  for (unint64_t j = 0; [v31 count] > j; ++j)
  {
    uint64_t v16 = [v31 objectAtIndexedSubscript:j];
    v17 = [v30 objectAtIndexedSubscript:j];
    id v18 = v16[6];
    v19 = [v17 error];

    if (v19)
    {
      id v20 = MFLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v18 remoteID];
        char v22 = [v17 error];
        *(_DWORD *)long long buf = 138412546;
        id v37 = v21;
        __int16 v38 = 2112;
        __int16 v39 = v22;
        _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "#Warning Error while fetching headers for message %@: %@", buf, 0x16u);
      }
    }
    else
    {
      id v20 = [v17 data];
      if (v20)
      {
        uint64_t v23 = -[MFMessageHeaders initWithHeaderData:encoding:]([MFLocalizedMessageHeaders alloc], "initWithHeaderData:encoding:", v20, [v18 preferredEncoding]);
        [v27 setObject:v23 forKeyedSubscript:v18];
      }
    }
  }
  return v27;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v64 = a6;
  id v10 = +[MFActivityMonitor currentMonitor];
  id v11 = [v9 partNumber];
  uint64_t v12 = [v11 isEqual:@"2"];

  if (v12)
  {
    int v13 = 1;
  }
  else
  {
    int v14 = [v9 partNumber];
    int v13 = [v14 isEqual:@"1.1"];
  }
  v61 = [(MFLibraryStore *)self mailbox];
  id v62 = [v61 folderID];
  if (!v62)
  {
    char v22 = 1;
    goto LABEL_34;
  }
  id v15 = [(MFLibraryStore *)self library];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MFDAMessageStore _fetchDataForMimePart:range:isComplete:consumer:]", "MFDAMessageStore.m", 972, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");
  }

  uint64_t v16 = [v9 mimeBody];
  id v63 = [v16 message];

  long long v60 = v10;
  if (v13)
  {
    v17 = objc_alloc_init(MFDAMessageContentConsumer);
    [(MFDAMessageContentConsumer *)v17 setRequestedFormat:v12];
    if (([v63 messageFlags] & 0x80) != 0)
    {
      [(MFDAMessageStore *)self _fetchBodyDataForSearchResult:v63 folderID:v62 format:v12 streamConsumer:v17];
      v19 = int v21 = 0;
    }
    else
    {
      id v18 = [(MFDAMessageStore *)self _fetchBodyDataForNormalMessage:v63 format:v12 part:v9 streamConsumer:v17];
      v19 = [v18 first];
      id v20 = [v18 second];
      int v21 = [v20 BOOLValue];
    }
    [v64 appendData:v19];
    if (((v12 ^ 1 | v21) & 1) == 0)
    {
      uint64_t v31 = objc_msgSend(v19, "mf_rangeOfRFC822HeaderData");
      uint64_t v33 = v32;
      uint64_t v34 = v31 + v32;
      if (v31 + v32 <= (unint64_t)[v19 length])
      {
        long long v35 = objc_msgSend(v19, "mf_subdataWithRange:", v31, v33);
        id v36 = (void *)[objc_alloc(MEMORY[0x1E4F73508]) initWithHeaderData:v35 encoding:134217984];
        [(MFMailMessageLibrary *)self->super._library updateThreadingInfoForMessage:v63 fromHeaders:v36];
        id v37 = objc_msgSend(v19, "mf_subdataWithRange:", v34, objc_msgSend(v19, "length") - v34);
        __int16 v38 = [(MFLibraryStore *)self library];
        [v38 storeRemoteContentLinksFromHeaderData:v35 bodyData:v37 forMessage:v63];
      }
    }

    char v22 = 1;
  }
  else
  {
    uint64_t v23 = [v9 contentID];

    if (!v23)
    {
      __int16 v39 = MFLogGeneral();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v66 = v9;
        _os_log_impl(&dword_1A7EFF000, v39, OS_LOG_TYPE_DEFAULT, "#Warning don't know how to fetch data for mime part %@", buf, 0xCu);
      }

      char v22 = 1;
      goto LABEL_33;
    }
    uint64_t v24 = [[_MFDAMessageFetchAttachmentConsumer alloc] initWithActivityMonitor:v10];
    [v9 range];
    [(_MFDAMessageFetchAttachmentConsumer *)v24 setExpectedLength:v25];
    id v26 = objc_alloc(MEMORY[0x1E4F5E860]);
    id v27 = [v9 contentID];
    uint64_t v28 = [v63 messageID];
    uint64_t v55 = [v26 initWithAttachmentName:v27 andMessageServerID:v28];

    id v29 = [v9 contentTransferEncoding];

    if (v29)
    {
      id v30 = v64;
      id v59 = 0;
    }
    else
    {
      id v59 = objc_alloc_init(MEMORY[0x1E4F734A8]);
      uint64_t v40 = [(_MFDAMessageFetchAttachmentConsumer *)v24 expectedLength];
      long long v57 = (void *)[objc_alloc(MEMORY[0x1E4F73560]) initWithConsumer:v59 expectedSize:v40];
      uint64_t v41 = [v64 progressBlock];
      [v57 setProgressBlock:v41];

      [v64 setProgressBlock:0];
      id v30 = v57;
    }
    -[_MFDAMessageFetchAttachmentConsumer setProgressFilter:](v24, "setProgressFilter:", v30, v55);
    long long v58 = v30;
    id v42 = [(MFLibraryStore *)self account];
    v43 = [v42 accountConduit];
    uint64_t v44 = [v43 performFetchAttachmentRequest:v56 consumer:v24];

    while (1)
    {
      objc_super v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      BOOL v46 = [(MFDAMailAccountConsumer *)v24 waitUntilDoneBeforeDate:v45];

      if (v46) {
        break;
      }
      id v47 = +[MFActivityMonitor currentMonitor];
      int v48 = [v47 shouldCancel];

      if (v48)
      {
        id v49 = [(MailAccount *)self->super._account accountConduit];
        [v49 cancelTaskWithID:v44];

        [(MFDAMailAccountConsumer *)v24 waitUntilDone];
        break;
      }
    }
    char v22 = [(_MFDAMessageFetchAttachmentConsumer *)v24 fetchSucceeded];
    if (!v29)
    {
      [v58 done];
      if ([(_MFDAMessageFetchAttachmentConsumer *)v24 dataWasBase64])
      {
        v50 = (void *)[objc_alloc(MEMORY[0x1E4F73488]) initWithConsumer:v64];
        id v51 = [v59 data];
        [v50 appendData:v51];

        [v50 done];
      }
      else
      {
        v50 = [v59 data];
        [v64 appendData:v50];
      }
    }
    id v52 = +[MFActivityMonitor currentMonitor];
    v53 = +[MFNetworkController sharedInstance];
    objc_msgSend(v52, "recordTransportType:", objc_msgSend(v53, "transportType"));
  }
  id v10 = v60;
LABEL_33:

LABEL_34:
  if (a5) {
    *a5 = v22;
  }

  return v22;
}

- (id)defaultAlternativeForPart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFDAMessageStore *)self decryptedTopLevelPartForPart:v4];

  uint64_t v6 = [v5 type];
  LODWORD(v4) = [v6 isEqualToString:@"multipart"];

  if (v4)
  {
    BOOL v7 = (void *)MEMORY[0x1AD0E3E00]();
    v12.receiver = self;
    v12.super_class = (Class)MFDAMessageStore;
    id v8 = [(MFDAMessageStore *)&v12 defaultAlternativeForPart:v5];
    id v9 = (void *)[v8 copyBodyDataToOffset:1 resultOffset:0 downloadIfNecessary:0];
    if (!v9)
    {
      uint64_t v10 = [v5 alternativeAtIndex:0];

      id v8 = (id)v10;
    }
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)bestAlternativeForPart:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDAMessageStore;
  uint64_t v5 = [(MFDAMessageStore *)&v13 bestAlternativeForPart:v4];
  uint64_t v6 = [v5 partNumber];
  if ([v6 isEqualToString:@"2"])
  {
    int v7 = [v5 isGenerated];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1AD0E3E00]();
      id v9 = (void *)[v5 copyBodyDataToOffset:1 resultOffset:0 downloadIfNecessary:0];
      uint64_t v10 = v9;
      if (v9 && ![v9 length])
      {
        uint64_t v11 = [v4 alternativeAtIndex:0];

        uint64_t v5 = (void *)v11;
      }
    }
  }
  else
  {
  }
  return v5;
}

- (BOOL)canFetchSearchResults
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(MFLibraryStore *)self account];
  int v3 = [v2 supportsServerSearch];

  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"No";
    if (v3 != 2) {
      uint64_t v5 = @"Yes";
    }
    v7[0] = 67240450;
    v7[1] = v3;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "Account search capability: %{public}u. canFetchSearchResults: %{public}@", (uint8_t *)v7, 0x12u);
  }

  return v3 != 2;
}

- (BOOL)hasMoreFetchableMessages
{
  return 0;
}

- (unint64_t)fetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)shouldGrowFetchWindow
{
  return 0;
}

- (unint64_t)growFetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 isSearchResultWithBogusRemoteId] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 partNumber];
  if (![v10 isEqualToString:@"2"])
  {

    goto LABEL_7;
  }
  int v11 = [v9 isHTML];

  if (!v11)
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)MFDAMessageStore;
    id v13 = [(MFLibraryStore *)&v16 storeData:v8 forMimePart:v9 isComplete:v5];
    goto LABEL_8;
  }
  objc_super v12 = MFPersistenceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[MFDAMessageStore storeData:forMimePart:isComplete:](v12);
  }

  id v13 = v8;
LABEL_8:
  int v14 = v13;

  return v14;
}

- (BOOL)backedByVirtualAllSearchMailbox
{
  return self->_backedByVirtualAllSearchMailbox;
}

- (void)setBackedByVirtualAllSearchMailbox:(BOOL)a3
{
  self->_backedByVirtualAllSearchMailbox = a3;
}

- (void).cxx_destruct
{
}

- (void)_remoteIDsMatchingSearchText:(uint64_t)a1 predicate:(NSObject *)a2 limit:offset:filterByDate:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Invalid search returned for predicate: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_remoteIDsMatchingSearchText:(os_log_t)log predicate:limit:offset:filterByDate:handler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Received a protocol mismatch error when peforming search", v1, 2u);
}

- (void)storeData:(os_log_t)log forMimePart:isComplete:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Attempting to store text/html data as message part 2", v1, 2u);
}

@end