@interface MFFetchResponseQueue
- (BOOL)addItem:(id)a3;
- (BOOL)handleItems:(id)a3;
- (BOOL)shouldAddUID:(unint64_t)a3;
- (MFFetchResponseQueue)init;
- (id)insertMessages:(id)a3;
@end

@implementation MFFetchResponseQueue

- (MFFetchResponseQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFFetchResponseQueue;
  return [(MFBufferedQueue *)&v3 initWithMaximumSize:256 latency:1.0];
}

- (BOOL)shouldAddUID:(unint64_t)a3
{
  return 1;
}

- (id)insertMessages:(id)a3
{
  id v4 = a3;
  v5 = [(MFLibraryStore *)self->_store library];
  v6 = [v5 persistence];
  v7 = [v6 messageChangeManager];

  v8 = [(MFLibraryStore *)self->_store mailbox];
  v9 = [v8 URL];
  v10 = [v7 reflectNewMessages:v4 mailboxURL:v9];

  return v10;
}

- (BOOL)handleItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MFFetchResponseQueue *)self insertMessages:v4];
  v6 = +[MFActivityMonitor currentMonitor];
  if ([v6 gotNewMessagesState])
  {
    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-259200.0];
    [v7 timeIntervalSince1970];
    double v9 = v8;

    unint64_t v10 = [v6 gotNewMessagesState];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v5;
    v20 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v16 = [v15 messageFlags];
          if ((v16 & 1) == 0)
          {
            [v15 dateReceivedAsTimeIntervalSince1970];
            if (v17 > v9)
            {
              if ([v15 conversationFlags])
              {
                unint64_t v10 = 3;
                goto LABEL_16;
              }
              if (((v10 < 2) & HIBYTE(v16)) != 0) {
                unint64_t v10 = 2;
              }
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    v5 = v20;
    [v6 setGotNewMessagesState:v10];
  }
  uint64_t v18 = [v5 count];
  LOBYTE(v18) = [v4 count] == v18;

  return v18;
}

- (BOOL)addItem:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  if ([v54 responseType] == 17)
  {
    v53 = self;
    context = (void *)MEMORY[0x1AD0E3E00]();
    id v4 = [v54 fetchResults];
    BOOL v60 = [(MFIMAPConnection *)self->_connection _isFetchResponseValid:v54];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v5)
    {
      char v58 = 0;
      v62 = 0;
      v63 = 0;
      uint64_t v55 = 0;
      int v56 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v67;
      uint64_t v11 = 0xFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v67 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          switch([v13 type])
          {
            case 2:
              uint64_t v17 = [v13 internalDate];
              unsigned int v16 = v63;
              v63 = (void *)v17;
              goto LABEL_15;
            case 3:
              uint64_t v8 = [v13 messageSize];
              break;
            case 4:
            case 7:
              if (v60)
              {
                v14 = [v13 fetchData];
                v15 = (void *)[v14 mutableCopy];

                objc_msgSend(v15, "mf_convertNetworkLineEndingsToUnix");
                objc_msgSend(v15, "mf_makeImmutable");
                unsigned int v16 = v62;
                v62 = v15;
LABEL_15:
              }
              break;
            case 8:
              uint64_t v6 = [v13 uid];
              int v56 = 1;
              break;
            case 9:
              uint64_t v7 = [v13 uniqueRemoteId];
              break;
            case 10:
              uint64_t v55 = [v13 messageFlags];
              uint64_t v11 = [v13 encoding];
              char v58 = 1;
              break;
            case 11:
              unint64_t v9 = [v13 modSequenceNumber];
              break;
            default:
              continue;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v5);

      if ((v58 & 1) == 0) {
        goto LABEL_38;
      }
      int v18 = v56 ^ 1;
      int v19 = !v60;
      if ([v62 length]
        && (v18 & 1) == 0
        && (v19 & 1) == 0
        && [(MFFetchResponseQueue *)v53 shouldAddUID:v6])
      {
        v61 = (void *)[objc_alloc(MEMORY[0x1E4F73508]) initWithHeaderData:v62 encoding:v11];
        v20 = [[MFIMAPMessageWithCache alloc] initWithFlags:v55 size:v8 uid:v6];
        v59 = v20;
        [v63 timeIntervalSince1970];
        -[MFIMAPMessageWithCache setDateReceivedAsTimeIntervalSince1970:](v20, "setDateReceivedAsTimeIntervalSince1970:");
        if (v11 != -1) {
          [(MFIMAPMessage *)v20 setPreferredEncoding:v11];
        }
        [(MFIMAPMessage *)v20 setUniqueRemoteId:v7];
        [(MFMailMessage *)v20 loadCachedHeaderValuesFromHeaders:v61];
        [(MFIMAPMessageWithCache *)v20 setHeaders:v61];
        [(MFIMAPMessageWithCache *)v20 setMessageStore:v53->_store];
        if (v53->_highestModSequence <= v9) {
          unint64_t highestModSequence = v9;
        }
        else {
          unint64_t highestModSequence = v53->_highestModSequence;
        }
        [(MFMailMessage *)v20 setModSequenceNumber:highestModSequence];
        v65.receiver = v53;
        v65.super_class = (Class)MFFetchResponseQueue;
        BOOL v22 = [(MFBufferedQueue *)&v65 addItem:v20];
        long long v23 = MFLogGeneral();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          long long v24 = [(MFIMAPMessageWithCache *)v59 subject];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v24;
          _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_INFO, "#Power [New Message] subject=%@;", buf, 0xCu);
        }
        unint64_t newMessageCount = v53->_newMessageCount;
        v53->_unint64_t newMessageCount = newMessageCount + 1;
        unint64_t numNewUIDs = v53->_numNewUIDs;
        if (newMessageCount + 1 <= numNewUIDs)
        {
          v29 = +[MFActivityMonitor currentMonitor];
          [v29 setCurrentCount:v53->_newMessageCount];
          if ((v55 & 1) == 0) {
            [v29 setGotNewMessagesState:1];
          }
        }
        else
        {
          BOOL v27 = newMessageCount == numNewUIDs;
          v28 = v59;
          if (!v27) {
            goto LABEL_50;
          }
          v29 = +[MFActivityMonitor currentMonitor];
          [v29 reset];
        }
        goto LABEL_48;
      }
      if ((v18 | v19))
      {
LABEL_38:
        BOOL v22 = 1;
LABEL_52:

        goto LABEL_53;
      }
      v31 = [(MFLibraryIMAPStore *)v53->_store serverMessagePersistence];
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v6];
      v33 = [v31 serverMessagesForIMAPUIDs:v32 limit:*MEMORY[0x1E4F60960] returnLastEntries:0];
      v30 = [v33 firstObject];

      if (v30)
      {
        v34 = MFFlagsObjectForFlags(v55);
        v35 = v53->_store;
        id v36 = v30;
        v37 = v34;
        v38 = (void *)MEMORY[0x1E4F608B8];
        v59 = v37;
        v61 = v36;
        v39 = [v36 serverFlags];
        v40 = [v38 changeFrom:v39 to:v37];

        if ([v40 hasChanges])
        {
          v57 = [(MFLibraryStore *)v35 library];
          v41 = [v57 persistence];
          v42 = [v41 messageChangeManager];
          v43 = [v61 remoteID];
          *(void *)buf = v43;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          v45 = [(MFLibraryStore *)v35 mailbox];
          v46 = [v45 URL];
          [v42 reflectFlagChanges:v40 forMessagesWithRemoteIDs:v44 mailboxURL:v46];
        }
        if (v53->_isSearching)
        {
          BOOL v22 = 1;
LABEL_49:
          v28 = v59;
LABEL_50:

          v30 = v61;
          goto LABEL_51;
        }
        v29 = [(MFLibraryStore *)v53->_store library];
        v47 = (void *)MEMORY[0x1E4F28ED0];
        v48 = [v61 messagePersistentID];
        v49 = objc_msgSend(v47, "numberWithLongLong:", objc_msgSend(v48, "longLongValue"));
        v70 = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
        [v29 clearServerSearchFlagsForMessagesWithLibraryIDs:v50];

        BOOL v22 = 1;
LABEL_48:

        goto LABEL_49;
      }
      BOOL v22 = 1;
    }
    else
    {
      v62 = 0;
      v63 = 0;
      BOOL v22 = 1;
      v30 = obj;
    }
LABEL_51:

    goto LABEL_52;
  }
  BOOL v22 = 1;
LABEL_53:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end