@interface NWStatisticsManager
- (BOOL)addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5 pid:(int)a6 uuid:(unsigned __int8 *)(a7;
- (BOOL)addAllRoute;
- (BOOL)addAllRoute:(unint64_t)a3;
- (BOOL)addAllTCP:(unint64_t)a3;
- (BOOL)addAllTCP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6;
- (BOOL)addAllUDP:(unint64_t)a3;
- (BOOL)addAllUDP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6;
- (BOOL)addSource:(id)a3 request:(nstat_msg_add_src *)a4 length:(unint64_t)a5;
- (BOOL)handleCompletion:(unint64_t)a3 message:(nstat_msg_hdr *)a4 length:(unsigned int)a5;
- (BOOL)handleCompletionMessage:(nstat_msg_hdr *)a3 length:(unsigned int)a4;
- (BOOL)isInvalidated;
- (BOOL)isReading;
- (BOOL)performQuery:(unsigned int)a3 sourceRef:(unint64_t)a4 completion:(id)a5;
- (BOOL)queryAll:(id)a3;
- (BOOL)sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (NSMutableDictionary)_internalSources;
- (NSMutableDictionary)currentQueries;
- (NSMutableDictionary)queuedQueryAlls;
- (NSSet)sources;
- (NWStatisticsManager)init;
- (NWStatisticsManager)initWithQueue:(id)a3;
- (NWStatisticsManagerDelegate)delegate;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)readSource;
- (char)readBuffer;
- (id)strongDelegate;
- (int)interfaceSourceFd;
- (int)interfaceTraceFd;
- (int)sockfd;
- (unint64_t)_nextReferenceForTarget:(unint64_t)a3 command:(unsigned int)a4;
- (unint64_t)currentQueryAllReference;
- (unint64_t)querySequenceNumber;
- (unsigned)commandFromReference:(unint64_t)a3;
- (unsigned)filter;
- (unsigned)mgrflags;
- (void)dealloc;
- (void)dispatchDidAddSource:(id)a3;
- (void)dispatchDidReceiveCounts:(id)a3 fromUpdate:(BOOL)a4;
- (void)dispatchDidReceiveDescription:(id)a3;
- (void)dispatchDidReceiveType:(unsigned int)a3 source:(id)a4;
- (void)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)handleReadEvent;
- (void)handleSystemInformationCounts:(nstat_sysinfo_counts *)a3;
- (void)invalidate;
- (void)performAllCompletions:(id)a3;
- (void)queryAllCounts:(id)a3;
- (void)queryAllDescriptions:(id)a3;
- (void)querySource:(id)a3 completion:(id)a4;
- (void)removeSource:(id)a3;
- (void)removeSourceInternal:(unint64_t)a3 isFromClient:(BOOL)a4;
- (void)reportInternalCounts;
- (void)sendRemoveSourceInternal:(unint64_t)a3;
- (void)sendRequestMessage:(int)a3 sourceRef:(unint64_t)a4;
- (void)setCurrentQueries:(id)a3;
- (void)setCurrentQueryAllReference:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceSourceFd:(int)a3;
- (void)setInterfaceTraceFd:(int)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMgrflags:(unsigned int)a3;
- (void)setQuerySequenceNumber:(unint64_t)a3;
- (void)setQueuePriority:(int64_t)a3;
- (void)setQueuedQueryAlls:(id)a3;
- (void)setReadBuffer:(char *)a3;
- (void)setReadSource:(id)a3;
- (void)setReading:(BOOL)a3;
- (void)setSockfd:(int)a3;
- (void)setStrongDelegate:(id)a3;
- (void)set_internalSources:(id)a3;
- (void)startQueuedQuery;
- (void)subscribeToSystemInformation;
- (void)trace:(char *)a3;
- (void)traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5;
@end

@implementation NWStatisticsManager

- (void)handleReadEvent
{
  v3 = (void *)MEMORY[0x21D4A8280](self, a2);
  ssize_t v4 = recv([(NWStatisticsManager *)self sockfd], [(NWStatisticsManager *)self readBuffer], 0x1000uLL, 0);
  if (v4 >= 1)
  {
    for (ssize_t i = v4;
          i > 0;
          ssize_t i = recv([(NWStatisticsManager *)self sockfd], [(NWStatisticsManager *)self readBuffer], 0x1000uLL, 0))
    {
      v6 = [(NWStatisticsManager *)self readBuffer];
      if ((unint64_t)i >= 0x10)
      {
        v7 = v6;
        do
        {
          unint64_t v8 = *((unsigned __int16 *)v7 + 6);
          if (v8 < 0x10 || i < (uint64_t)v8) {
            break;
          }
          if ((self->_interfaceTraceFd & 0x80000000) == 0 && self->_iftracebuf) {
            [(NWStatisticsManager *)self traceMemoryBuf:v7 length:*((unsigned __int16 *)v7 + 6) tag:"Input"];
          }
          if (!*(void *)v7
            || ![(NWStatisticsManager *)self handleCompletionMessage:v7 length:v8])
          {
            [(NWStatisticsManager *)self handleMessage:v7 length:v8];
          }
          v7 += v8;
          i -= v8;
        }
        while ((unint64_t)i > 0xF);
      }
    }
  }
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (int)sockfd
{
  return self->_sockfd;
}

- (BOOL)handleCompletionMessage:(nstat_msg_hdr *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  v7 = [(NWStatisticsManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if (!a3->context) {
    return 0;
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    unint64_t v8 = NStatGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t context = a3->context;
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = context;
      _os_log_impl(&dword_21C4BC000, v8, OS_LOG_TYPE_DEBUG, "Manager %p: completion message with context %lld", buf, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(self, "%s Manager %p: completion message with context %lld", v10, v11, v12, v13, v14, v15, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  }
  if (self->_currentQueryAllReference != a3->context) {
    return [(NWStatisticsManager *)self handleCompletion:a3->context message:a3 length:v4];
  }
  if ((a3->flags & 2) == 0 || a3->type || self->_continuationCount > 0x27)
  {
    self->_continuationCount = 0;
    self->_currentQueryAllReference = 0;
    if ([(NSMutableDictionary *)self->_queuedQueryAlls count])
    {
      if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
      {
        v25 = NStatGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v26 = [(NSMutableDictionary *)self->_queuedQueryAlls description];
          uint64_t v27 = [v26 UTF8String];
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v27;
          _os_log_impl(&dword_21C4BC000, v25, OS_LOG_TYPE_DEBUG, "Manager %p: found queued queries %s", buf, 0x16u);
        }
      }
      if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
      {
        id v28 = [(NSMutableDictionary *)self->_queuedQueryAlls description];
        [v28 UTF8String];
        NStatMgrTraceF(self, "%s Manager %p: found queued queries %s", v29, v30, v31, v32, v33, v34, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
      }
      [(NWStatisticsManager *)self startQueuedQuery];
    }
    return [(NWStatisticsManager *)self handleCompletion:a3->context message:a3 length:v4];
  }
  *(void *)&buf[8] = 0;
  *(_DWORD *)&buf[8] = -[NWStatisticsManager commandFromReference:](self, "commandFromReference:");
  *(void *)buf = a3->context;
  *(void *)&buf[16] = -1;
  *(_WORD *)&buf[14] = 2;
  ++self->_continuationCount;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    v16 = NStatGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = a3->context;
      *(_DWORD *)v35 = 134218240;
      v36 = self;
      __int16 v37 = 2048;
      unint64_t v38 = v17;
      _os_log_impl(&dword_21C4BC000, v16, OS_LOG_TYPE_DEBUG, "Manager %p: sent continuation for completion message with context %lld", v35, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(self, "%s Manager %p: sent continuation for completion message with context %lld", v18, v19, v20, v21, v22, v23, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  }
  return [(NWStatisticsManager *)self sendMessage:buf length:24];
}

- (BOOL)queryAll:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x21D4A8470](v4);
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = self;
      __int16 v18 = 2048;
      uint64_t v19 = v6;
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all update, completion %p", buf, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    uint64_t v15 = (void *)MEMORY[0x21D4A8470](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all update, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAll:]");
  }
  if ([(NWStatisticsManager *)self isInvalidated])
  {
    if (v4) {
      v4[2](v4);
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [(NWStatisticsManager *)self performQuery:1007 sourceRef:-1 completion:v4];
  }

  return v13;
}

- (BOOL)performQuery:(unsigned int)a3 sourceRef:(unint64_t)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    uint64_t v9 = NStatGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = "NSTAT_MSG_TYPE_GET_SRC_DESC";
      uint64_t v11 = "UNKNOWN -???";
      if (a3 == 1007) {
        uint64_t v11 = "NSTAT_MSG_TYPE_GET_UPDATE";
      }
      if (a3 != 1005) {
        uint64_t v10 = v11;
      }
      if (a3 == 1004) {
        uint64_t v12 = "NSTAT_MSG_TYPE_QUERY_SRC";
      }
      else {
        uint64_t v12 = v10;
      }
      BOOL v13 = (void *)MEMORY[0x21D4A8470](v8);
      *(_DWORD *)buf = 134218754;
      unint64_t v38 = self;
      __int16 v39 = 2080;
      uint64_t v40 = v12;
      __int16 v41 = 2048;
      unint64_t v42 = a4;
      __int16 v43 = 2048;
      v44 = v13;
      _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_DEBUG, "Manager %p: Entry command %s  source ref %llu completion %p", buf, 0x2Au);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    v25 = (void *)MEMORY[0x21D4A8470](v8);
    NStatMgrTraceF(self, "%s Manager %p: Entry command %s  source ref %llu completion %p", v14, v15, v16, v17, v18, v19, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]");
  }
  uint64_t v20 = [(NWStatisticsManager *)self internalQueue];
  dispatch_assert_queue_not_V2(v20);

  if (a4 == -1 || v8)
  {
    uint64_t v22 = [(NWStatisticsManager *)self internalQueue];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2;
    v26[3] = &unk_264405050;
    v26[4] = self;
    unint64_t v29 = a4;
    unsigned int v30 = a3;
    id v27 = v8;
    id v28 = &v33;
    dispatch_sync(v22, v26);
  }
  else
  {
    uint64_t v21 = [(NWStatisticsManager *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke;
    block[3] = &unk_264404FD8;
    unsigned int v32 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_async(v21, block);

    *((unsigned char *)v34 + 24) = 1;
  }
  BOOL v23 = *((unsigned char *)v34 + 24) != 0;
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (BOOL)handleCompletion:(unint64_t)a3 message:(nstat_msg_hdr *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  uint64_t v10 = [(NSMutableDictionary *)self->_currentQueries objectForKey:v9];
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    uint64_t v11 = NStatGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = (void *)MEMORY[0x21D4A8470](v10);
      *(_DWORD *)buf = 134218496;
      unint64_t v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      __int16 v45 = 2048;
      uint64_t v46 = (uint64_t)v12;
      _os_log_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_DEBUG, "Manager %p: Called with reference %lld find completion %p", buf, 0x20u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    uint64_t v40 = (void *)MEMORY[0x21D4A8470](v10);
    NStatMgrTraceF(self, "%s Manager %p: Called with reference %lld find completion %p", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsManager handleCompletion:message:length:]");
  }
  if (v10)
  {
    char v19 = ((uint64_t (**)(void, nstat_msg_hdr *, uint64_t))v10)[2](v10, a4, v5);
    [(NSMutableDictionary *)self->_currentQueries removeObjectForKey:v9];
    if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
    {
      uint64_t v20 = NStatGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [(NSMutableDictionary *)self->_currentQueries description];
        uint64_t v22 = [v21 UTF8String];
        *(_DWORD *)buf = 134218242;
        unint64_t v42 = self;
        __int16 v43 = 2080;
        unint64_t v44 = v22;
        _os_log_impl(&dword_21C4BC000, v20, OS_LOG_TYPE_DEBUG, "Manager %p: after remove currentQueries %s", buf, 0x16u);
      }
    }
    if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
    {
      id v23 = [(NSMutableDictionary *)self->_currentQueries description];
      [v23 UTF8String];
      NStatMgrTraceF(self, "%s Manager %p: after remove currentQueries %s", v24, v25, v26, v27, v28, v29, (char)"-[NWStatisticsManager handleCompletion:message:length:]");
LABEL_19:
    }
  }
  else
  {
    unsigned int v30 = NStatGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [(NSMutableDictionary *)self->_currentQueries description];
      uint64_t v32 = [v31 UTF8String];
      *(_DWORD *)buf = 134218498;
      unint64_t v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      __int16 v45 = 2080;
      uint64_t v46 = v32;
      _os_log_impl(&dword_21C4BC000, v30, OS_LOG_TYPE_ERROR, "Manager %p: can't find completion for key %lld, queries are %s", buf, 0x20u);
    }
    if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
    {
      id v23 = [(NSMutableDictionary *)self->_currentQueries description];
      [v23 UTF8String];
      NStatMgrTraceF(self, "%s Manager %p: can't find completion for key %lld, queries are %s", v33, v34, v35, v36, v37, v38, (char)"-[NWStatisticsManager handleCompletion:message:length:]");
      char v19 = 0;
      goto LABEL_19;
    }
    char v19 = 0;
  }

  return v19;
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    v6 = NStatGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x21D4A8470](*(void *)(a1 + 40));
      *(_DWORD *)buf = 134219008;
      uint64_t v42 = v8;
      __int16 v43 = 2048;
      uint64_t v44 = v7;
      __int16 v45 = 2048;
      uint64_t v46 = a2;
      __int16 v47 = 1024;
      int v48 = a3;
      __int16 v49 = 2048;
      v50 = v9;
      _os_log_impl(&dword_21C4BC000, v6, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p", buf, 0x30u);
    }
  }
  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v38 = (void *)MEMORY[0x21D4A8470](*(void *)(a1 + 40));
    NStatMgrTraceF(v10, "%s Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }
  uint64_t v17 = [*(id *)(a1 + 32) clientQueue];
  if (!v17) {
    goto LABEL_23;
  }
  if (a2 && *(_DWORD *)(a2 + 8) > 1u)
  {
    uint64_t v28 = NStatGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v29;
      __int16 v43 = 1024;
      LODWORD(v44) = v30;
      _os_log_impl(&dword_21C4BC000, v28, OS_LOG_TYPE_ERROR, "Manager %p: Outer completion block called, type mismatch %d", buf, 0x12u);
    }

    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
      NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: Outer completion block called, type mismatch %d", v31, v32, v33, v34, v35, v36, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
LABEL_23:
    uint64_t v27 = 0;
    goto LABEL_24;
  }
  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    uint64_t v18 = NStatGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v19;
      __int16 v43 = 2048;
      uint64_t v44 = a2;
      _os_log_impl(&dword_21C4BC000, v18, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block ready to dispatch async to inner block, msg %p", buf, 0x16u);
    }
  }
  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: Outer completion block ready to dispatch async to inner block, msg %p", v20, v21, v22, v23, v24, v25, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }
  uint64_t v26 = *(void **)(a1 + 40);
  if (v26)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47;
    block[3] = &unk_264405000;
    block[4] = *(void *)(a1 + 32);
    id v40 = v26;
    dispatch_async(v17, block);
  }
  uint64_t v27 = 1;
LABEL_24:

  return v27;
}

void __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _nextReferenceForTarget:*(void *)(a1 + 56) command:*(unsigned int *)(a1 + 64)];
  v3 = [NSNumber numberWithUnsignedLongLong:v2];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3;
  v74[3] = &unk_264405028;
  uint64_t v4 = *(void **)(a1 + 40);
  v74[4] = *(void *)(a1 + 32);
  uint64_t v76 = v2;
  id v75 = v4;
  uint64_t v5 = (void *)MEMORY[0x21D4A8470](v74);
  v6 = (void *)MEMORY[0x21D4A8470]();
  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    uint64_t v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(id **)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x21D4A8470](v5);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218752;
      v78 = v8;
      __int16 v79 = 2048;
      *(void *)v80 = v9;
      *(_WORD *)&v80[8] = 2048;
      *(void *)&v80[10] = v2;
      *(_WORD *)&v80[18] = 2048;
      *(void *)&v80[20] = v10;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block %p for ref %lld  src %llu", buf, 0x2Au);
    }
  }
  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = (void *)MEMORY[0x21D4A8470](v5);
    NStatMgrTraceF(v11, "%s Manager %p: Outer completion block %p for ref %lld  src %llu", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }
  if (*(void *)(a1 + 56) != -1) {
    goto LABEL_8;
  }
  uint64_t v51 = [*(id *)(a1 + 32) currentQueryAllReference];
  v52 = *(void **)(a1 + 32);
  if (!v51)
  {
    [v52 setCurrentQueryAllReference:v2];
    v69 = *(void **)(*(void *)(a1 + 32) + 248);
    v70 = (void *)MEMORY[0x21D4A8470](v6);
    [v69 setObject:v70 forKey:v3];

LABEL_8:
    if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
    {
      uint64_t v19 = NStatGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *(void **)(a1 + 32);
        uint64_t v21 = [v20 currentQueryAllReference];
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v24 = *(void *)(v22 + 248);
        uint64_t v23 = *(void *)(v22 + 256);
        *(_DWORD *)buf = 134218754;
        v78 = (id *)v20;
        __int16 v79 = 2048;
        *(void *)v80 = v21;
        *(_WORD *)&v80[8] = 2112;
        *(void *)&v80[10] = v24;
        *(_WORD *)&v80[18] = 2112;
        *(void *)&v80[20] = v23;
        _os_log_impl(&dword_21C4BC000, v19, OS_LOG_TYPE_DEBUG, "Manager %p: currentQueryAllReference %llu current %@, pending %@", buf, 0x2Au);
      }
    }
    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
    {
      uint64_t v25 = *(void **)(a1 + 32);
      [v25 currentQueryAllReference];
      NStatMgrTraceF(v25, "%s Manager %p: currentQueryAllReference %llu current %@, pending %@", v26, v27, v28, v29, v30, v31, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
    if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
    {
      uint64_t v32 = NStatGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = *(id **)(a1 + 32);
        int v34 = *(_DWORD *)(a1 + 64);
        uint64_t v35 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134219008;
        v78 = v33;
        __int16 v79 = 1024;
        *(_DWORD *)v80 = v34;
        *(_WORD *)&v80[4] = 2048;
        *(void *)&v80[6] = v2;
        *(_WORD *)&v80[14] = 2048;
        *(void *)&v80[16] = v35;
        *(_WORD *)&v80[24] = 1024;
        *(_DWORD *)&v80[26] = 0;
        _os_log_impl(&dword_21C4BC000, v32, OS_LOG_TYPE_DEBUG, "Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d", buf, 0x2Cu);
      }
    }
    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
      NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d", v36, v37, v38, v39, v40, v41, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
    unsigned int v42 = *(_DWORD *)(a1 + 64);
    uint64_t v71 = v2;
    uint64_t v72 = v42;
    uint64_t v73 = *(void *)(a1 + 56);
    if (v73 == -1)
    {
      HIWORD(v72) = 2;
      if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
      {
        __int16 v43 = NStatGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = *(id **)(a1 + 32);
          *(_DWORD *)buf = 134218752;
          v78 = v44;
          __int16 v79 = 1024;
          *(_DWORD *)v80 = v42;
          *(_WORD *)&v80[4] = 2048;
          *(void *)&v80[6] = v2;
          *(_WORD *)&v80[14] = 2048;
          *(void *)&v80[16] = -1;
          _os_log_impl(&dword_21C4BC000, v43, OS_LOG_TYPE_DEBUG, "Manager %p: about to send message %x context %lld srcef %llu", buf, 0x26u);
        }
      }
      if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
        NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: about to send message %x context %lld srcef %llu", v45, v46, v47, v48, v49, v50, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:&v71 length:24];
    goto LABEL_36;
  }
  v53 = (void *)v52[32];
  v54 = (void *)MEMORY[0x21D4A8470](v6);
  [v53 setObject:v54 forKey:v3];

  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    v55 = NStatGetLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      v56 = *(id **)(a1 + 32);
      int v57 = *(_DWORD *)(a1 + 64);
      uint64_t v58 = *(void *)(a1 + 56);
      id v59 = [v56[32] description];
      uint64_t v60 = [v59 UTF8String];
      *(_DWORD *)buf = 134219010;
      v78 = v56;
      __int16 v79 = 1024;
      *(_DWORD *)v80 = v57;
      *(_WORD *)&v80[4] = 2048;
      *(void *)&v80[6] = v2;
      *(_WORD *)&v80[14] = 2048;
      *(void *)&v80[16] = v58;
      *(_WORD *)&v80[24] = 2080;
      *(void *)&v80[26] = v60;
      _os_log_impl(&dword_21C4BC000, v55, OS_LOG_TYPE_DEBUG, "Manager %p: set pended for message %x context %lld srcef %llu dictionary %s", buf, 0x30u);
    }
  }
  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    v61 = *(id **)(a1 + 32);
    id v62 = [v61[32] description];
    [v62 UTF8String];
    NStatMgrTraceF(v61, "%s Manager %p: set pended for message %x context %lld srcef %llu dictionary %s", v63, v64, v65, v66, v67, v68, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_36:
}

- (unsigned)mgrflags
{
  return self->_mgrflags;
}

void __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removing] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = (void *)MEMORY[0x21D4A8280]();
      [v3 sourceDidReceiveCounts:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInvalidated];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removing] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = (void *)MEMORY[0x21D4A8280]();
      [v3 sourceDidReceiveDescription:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleReadEvent];
}

- (void)setCurrentQueryAllReference:(unint64_t)a3
{
  self->_currentQueryAllReference = a3;
}

- (BOOL)sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v7 = [(NWStatisticsManager *)self readSource];

  if (v7)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if ((self->_interfaceTraceFd & 0x80000000) == 0 && self->_iftracebuf) {
      [(NWStatisticsManager *)self traceMemoryBuf:a3 length:a4 tag:"Output"];
    }
    if (send([(NWStatisticsManager *)self sockfd], a3, a4, 0) == a4) {
      return 1;
    }
    if (a3->context) {
      [(NWStatisticsManager *)self handleCompletion:a3->context message:0 length:0];
    }
  }
  return 0;
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  unsigned int type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        unsigned int mgrflags = self->_mgrflags;
        if ((mgrflags & 0x20) != 0)
        {
          ++self->_numSourceAddsSkipped;
          if ((mgrflags & 0x40) != 0)
          {
            ++self->_numSourcesQueried;
            [(NWStatisticsManager *)self sendRequestMessage:1007 sourceRef:a3[1].context];
          }
        }
        else
        {
          uint64_t v21 = +[NWStatisticsSource createSourceForProvider:a3[1].type srcRef:a3[1].context manager:self];
          if (v21)
          {
            uint64_t v22 = [(NWStatisticsManager *)self _internalSources];
            uint64_t v23 = [NSNumber numberWithUnsignedLongLong:a3[1].context];
            [v22 setObject:v21 forKey:v23];

            ++self->_numSourcesInserted;
            [(NWStatisticsManager *)self dispatchDidAddSource:v21];
          }
          else
          {
            [(NWStatisticsManager *)self sendRemoveSourceInternal:a3[1].context];
          }
        }
      }
      unint64_t v48 = self->_numSourceAddsReceived + 1;
      self->_numSourceAddsReceived = v48;
      if ((self->_mgrflags & 0x10) != 0 && !(v48 % 0x64))
      {
        [(NWStatisticsManager *)self reportInternalCounts];
      }
      return;
    case 0x2712u:
    case 0x2713u:
    case 0x2714u:
    case 0x2716u:
      if ((unint64_t)a4 < 0x18) {
        return;
      }
      unint64_t context = a3[1].context;
      uint64_t v9 = [(NWStatisticsManager *)self _internalSources];
      uint64_t v10 = [NSNumber numberWithUnsignedLongLong:context];
      v55 = [v9 objectForKey:v10];

      unsigned int v11 = a3->type;
      if (v11 == 10002)
      {
        if (v55) {
          [(NWStatisticsManager *)self removeSourceInternal:context isFromClient:0];
        }
      }
      else if (v55)
      {
        if (([v55 removing] & 1) == 0
          && [v55 handleMessage:a3 length:a4])
        {
          if ((self->_mgrflags & 8) != 0 && (a3->flags & 4) != 0)
          {
            ++self->_numUpdatesSkipped;
          }
          else
          {
            ++self->_numUpdatesDispatched;
            [(NWStatisticsManager *)self dispatchDidReceiveType:a3->type source:v55];
          }
        }
      }
      else
      {
        if (v11 == 10003)
        {
          uint64_t v41 = a3 + 2;
        }
        else
        {
          if (v11 != 10006) {
            goto LABEL_66;
          }
          uint64_t v41 = a3 + 9;
        }
        uint64_t context_low = LODWORD(v41->context);
        if ((context_low - 11) >= 0xFFFFFFF6
          && ((self->_providerFilters[context_low] & 0x100000) != 0 || (self->_mgrflags & 0x20) != 0))
        {
          uint64_t v44 = +[NWStatisticsSource createSourceForProvider:srcRef:manager:](NWStatisticsSource, "createSourceForProvider:srcRef:manager:");
          if (v44)
          {
            uint64_t v45 = [(NWStatisticsManager *)self _internalSources];
            uint64_t v46 = [NSNumber numberWithUnsignedLongLong:context];
            [v45 setObject:v44 forKey:v46];

            ++self->_numSourcesInserted;
            int v47 = [v44 handleMessage:a3 length:a4];
            [(NWStatisticsManager *)self dispatchDidAddSource:v44];
            if (v47)
            {
              if ((self->_mgrflags & 8) != 0 && (a3->flags & 4) != 0)
              {
                ++self->_numUpdatesLazySkipped;
              }
              else
              {
                ++self->_numUpdatesLazyDispatched;
                [(NWStatisticsManager *)self dispatchDidReceiveType:a3->type source:v44];
              }
            }
          }
        }
      }
LABEL_66:
      MEMORY[0x270F9A758]();
      return;
    case 0x2715u:
      if ((unint64_t)a4 < 0x1C)
      {
        int v34 = NStatGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          int v57 = self;
          __int16 v58 = 2048;
          *(void *)id v59 = a4;
          _os_log_impl(&dword_21C4BC000, v34, OS_LOG_TYPE_ERROR, "Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len", buf, 0x16u);
        }

        if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0) {
          NStatMgrTraceF(self, "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len", v35, v36, v37, v38, v39, v40, (char)"-[NWStatisticsManager handleMessage:length:]");
        }
      }
      else
      {
        p_unsigned int type = &a3[1].type;
        if ((unint64_t)a3[1].type + 24 <= a4)
        {
          unsigned int v42 = &a3[1].type;
          [(NWStatisticsManager *)self handleSystemInformationCounts:v42];
        }
        else
        {
          uint64_t v25 = NStatGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = *p_type + 24;
            *(_DWORD *)buf = 134218496;
            int v57 = self;
            __int16 v58 = 2048;
            *(void *)id v59 = a4;
            *(_WORD *)&v59[8] = 2048;
            *(void *)&v59[10] = v26;
            _os_log_impl(&dword_21C4BC000, v25, OS_LOG_TYPE_ERROR, "Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd", buf, 0x20u);
          }

          if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0) {
            NStatMgrTraceF(self, "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd", v27, v28, v29, v30, v31, v32, (char)"-[NWStatisticsManager handleMessage:length:]");
          }
        }
      }
      return;
    default:
      if (type == 1)
      {
        if ((unint64_t)a4 < 0x28)
        {
          uint64_t v33 = NStatGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            -[NWStatisticsManager handleMessage:length:]((uint64_t)a3, v33);
          }
        }
        else
        {
          if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
          {
            uint64_t v12 = NStatGetLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              int v13 = a3[1].context;
              uint64_t v14 = *(void *)&a3[1].type;
              int v15 = a3[2].context;
              uint64_t v16 = msgTypeToString(v15);
              int v17 = WORD2(a3[2].context);
              int context_high = HIWORD(a3[2].context);
              if ((unint64_t)a4 < 0x30) {
                uint64_t v19 = 0;
              }
              else {
                uint64_t v19 = *(void *)&a3[2].type;
              }
              *(_DWORD *)buf = 134219778;
              int v57 = self;
              __int16 v58 = 1024;
              *(_DWORD *)id v59 = v13;
              *(_WORD *)&v59[4] = 2048;
              *(void *)&v59[6] = v14;
              *(_WORD *)&v59[14] = 1024;
              *(_DWORD *)&v59[16] = v15;
              __int16 v60 = 2080;
              v61 = v16;
              __int16 v62 = 1024;
              int v63 = v17;
              __int16 v64 = 1024;
              int v65 = context_high;
              __int16 v66 = 2048;
              uint64_t v67 = v19;
              _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_DEBUG, "Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}", buf, 0x42u);
            }
          }
          if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
          {
            msgTypeToString(a3[2].context);
            NStatMgrTraceF(self, "%s Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}", v49, v50, v51, v52, v53, v54, (char)"-[NWStatisticsManager handleMessage:length:]");
          }
        }
      }
      return;
  }
}

- (void)dispatchDidReceiveType:(unsigned int)a3 source:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 10003)
  {
    id v11 = v6;
    id v6 = (id)[(NWStatisticsManager *)self dispatchDidReceiveDescription:v6];
  }
  else
  {
    if (a3 == 10004)
    {
      uint64_t v8 = self;
      id v11 = v7;
      id v9 = v7;
      uint64_t v10 = 0;
    }
    else
    {
      if (a3 != 10006) {
        goto LABEL_9;
      }
      id v11 = v6;
      [(NWStatisticsManager *)self dispatchDidReceiveDescription:v6];
      uint64_t v8 = self;
      id v9 = v11;
      uint64_t v10 = 1;
    }
    id v6 = (id)[(NWStatisticsManager *)v8 dispatchDidReceiveCounts:v9 fromUpdate:v10];
  }
  id v7 = v11;
LABEL_9:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)dispatchDidReceiveDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NWStatisticsManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke;
  block[3] = &unk_264404EE8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)dispatchDidReceiveCounts:(id)a3 fromUpdate:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(NWStatisticsManager *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke;
  block[3] = &unk_264404EE8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (unint64_t)currentQueryAllReference
{
  return self->_currentQueryAllReference;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 296, 1);
}

- (unint64_t)_nextReferenceForTarget:(unint64_t)a3 command:(unsigned int)a4
{
  unint64_t v4 = self->_querySequenceNumber + 1;
  self->_querySequenceNumber = v4;
  unint64_t v5 = 4 * v4;
  unint64_t v6 = v5 | 2;
  uint64_t v7 = v5 | 1;
  uint64_t v8 = v5 | 3;
  if (a4 != 1007) {
    uint64_t v8 = v5;
  }
  if (a4 != 1005) {
    uint64_t v7 = v8;
  }
  if (a4 != 1004) {
    unint64_t v6 = v7;
  }
  if (a3 == -1) {
    return v6;
  }
  else {
    return v5;
  }
}

- (NSMutableDictionary)_internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ((v8->_interfaceTraceFd & 0x80000000) == 0 && v8->_iftracebuf)
  {
    v15.tv_sec = 0;
    *(void *)&v15.tv_usec = 0;
    gettimeofday(&v15, 0);
    __snprintf_chk(v8->_iftracebuf, 0x1100uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%ld.%06d %s len %zu\n", v15.tv_sec, v15.tv_usec, a5, a4);
    size_t v9 = strlen(v8->_iftracebuf) + 1;
    size_t v10 = v9 + a4;
    if ((v9 + a4) >> 8 > 0x10)
    {
      id v11 = NStatGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[NWStatisticsManager traceMemoryBuf:length:tag:]((uint64_t)a5, a4, v11);
      }
      goto LABEL_9;
    }
    memcpy(&v8->_iftracebuf[v9], a3, a4);
    if (write(v8->_interfaceTraceFd, v8->_iftracebuf, v10) < 0)
    {
      id v11 = NStatGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = *__error();
        int v13 = __error();
        uint64_t v14 = strerror(*v13);
        *(_DWORD *)buf = 136315650;
        int v17 = a5;
        __int16 v18 = 1024;
        int v19 = v12;
        __int16 v20 = 2080;
        uint64_t v21 = v14;
        _os_log_debug_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_DEBUG, "save %s failed: %d - %s", buf, 0x1Cu);
      }
LABEL_9:
    }
  }
  objc_sync_exit(v8);
}

- (void)trace:(char *)a3
{
  if (a3 && (self->_interfaceTraceFd & 0x80000000) == 0)
  {
    size_t v5 = strlen(a3) + 1;
    [(NWStatisticsManager *)self traceMemoryBuf:a3 length:v5 tag:"Trace"];
  }
}

- (void)handleSystemInformationCounts:(nstat_sysinfo_counts *)a3
{
  size_t v5 = [(NWStatisticsManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && (int)(((unint64_t)a3->var0 - 8) / 0x28) >= 1)
  {
    uint64_t v6 = (((unint64_t)a3->var0 - 8) / 0x28);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v6];
    p_var3 = &a3->var2[0].var3;
    while (1)
    {
      uint64_t v9 = *(p_var3 - 8);
      if (!v9) {
        goto LABEL_15;
      }
      int v10 = *(p_var3 - 7);
      if (v10) {
        break;
      }
      if ((v10 & 2) != 0)
      {
        uint64_t v12 = [NSNumber numberWithDouble:*((double *)p_var3 - 3)];
LABEL_12:
        id v11 = (void *)v12;
        if (v12) {
          goto LABEL_13;
        }
        goto LABEL_15;
      }
      if ((v10 & 4) != 0)
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:p_var3 - 6 length:*p_var3];
        if (v11)
        {
LABEL_13:
          int v13 = [NSNumber numberWithUnsignedInt:v9];
          [v7 setObject:v11 forKeyedSubscript:v13];
        }
      }
LABEL_15:
      p_var3 += 10;
      if (!--v6)
      {
        if ([v7 count])
        {
          uint64_t v14 = [(NWStatisticsManager *)self clientQueue];
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke;
          v16[3] = &unk_264404EC0;
          v16[4] = self;
          id v17 = v7;
          id v15 = v7;
          dispatch_async(v14, v16);
        }
        else
        {
        }
        goto LABEL_19;
      }
    }
    uint64_t v12 = [NSNumber numberWithLongLong:*((void *)p_var3 - 3)];
    goto LABEL_12;
  }
LABEL_19:
}

void __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = (void *)MEMORY[0x21D4A8280]();
      [v3 statisticsManager:*(void *)(a1 + 32) didReceiveDirectSystemInformation:*(void *)(a1 + 40)];
    }
  }
}

- (void)reportInternalCounts
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = NStatGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t numSourceAddsReceived = self->_numSourceAddsReceived;
    unint64_t numSourcesInserted = self->_numSourcesInserted;
    unint64_t numSourcesRemoved = self->_numSourcesRemoved;
    uint64_t v7 = [(NSMutableDictionary *)self->__internalSources count];
    unint64_t numSourceAddsSkipped = self->_numSourceAddsSkipped;
    unint64_t numSourcesQueried = self->_numSourcesQueried;
    unint64_t numUpdatesDispatched = self->_numUpdatesDispatched;
    unint64_t numUpdatesSkipped = self->_numUpdatesSkipped;
    unint64_t numUpdatesLazyDispatched = self->_numUpdatesLazyDispatched;
    unint64_t numUpdatesLazySkipped = self->_numUpdatesLazySkipped;
    *(_DWORD *)buf = 134220544;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = numSourceAddsReceived;
    __int16 v24 = 2048;
    unint64_t v25 = numSourcesInserted;
    __int16 v26 = 2048;
    unint64_t v27 = numSourcesRemoved;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    __int16 v30 = 2048;
    unint64_t v31 = numSourceAddsSkipped;
    __int16 v32 = 2048;
    unint64_t v33 = numSourcesQueried;
    __int16 v34 = 2048;
    unint64_t v35 = numUpdatesDispatched;
    __int16 v36 = 2048;
    unint64_t v37 = numUpdatesSkipped;
    __int16 v38 = 2048;
    unint64_t v39 = numUpdatesLazyDispatched;
    __int16 v40 = 2048;
    unint64_t v41 = numUpdatesLazySkipped;
    _os_log_impl(&dword_21C4BC000, v3, OS_LOG_TYPE_DEBUG, "Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispatched %lld skipped %lld lazy %lld lazy skip %lld", buf, 0x70u);
  }

  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    [(NSMutableDictionary *)self->__internalSources count];
    NStatMgrTraceF(self, "%s Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispatched %lld skipped %lld lazy %lld lazy skip %lld", v14, v15, v16, v17, v18, v19, (char)"-[NWStatisticsManager reportInternalCounts]");
  }
}

- (void)dispatchDidAddSource:(id)a3
{
  id v4 = a3;
  size_t v5 = [(NWStatisticsManager *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__NWStatisticsManager_dispatchDidAddSource___block_invoke;
  v7[3] = &unk_264404EC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__NWStatisticsManager_dispatchDidAddSource___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)MEMORY[0x21D4A8280]();
    [v3 statisticsManager:*(void *)(a1 + 32) didAddSource:*(void *)(a1 + 40)];
  }
}

- (void)sendRequestMessage:(int)a3 sourceRef:(unint64_t)a4
{
  uint64_t v7 = [(NWStatisticsManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if (a4 == -1) {
    -[NWStatisticsManager sendRequestMessage:sourceRef:]();
  }
  if (![(NWStatisticsManager *)self isInvalidated])
  {
    v8[0] = 0;
    v8[1] = a3;
    v8[2] = a4;
    [(NWStatisticsManager *)self sendMessage:v8 length:24];
  }
}

- (void)startQueuedQuery
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(NSMutableDictionary *)self->_queuedQueryAlls allKeys];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    size_t v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v4 description];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v6 UTF8String];
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: found keys %s", buf, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    id v7 = [v4 description];
    [v7 UTF8String];
    NStatMgrTraceF(self, "%s Manager %p: found keys %s", v8, v9, v10, v11, v12, v13, (char)"-[NWStatisticsManager startQueuedQuery]");
  }
  if (v4 && [v4 count])
  {
    uint64_t v14 = [v4 objectAtIndexedSubscript:0];
    uint64_t v15 = [(NSMutableDictionary *)self->_queuedQueryAlls objectForKeyedSubscript:v14];
    uint64_t v16 = (void *)MEMORY[0x21D4A8470]();

    if (v16)
    {
      [(NSMutableDictionary *)self->_queuedQueryAlls removeObjectForKey:v14];
      currentQueries = self->_currentQueries;
      uint64_t v18 = (void *)MEMORY[0x21D4A8470](v16);
      [(NSMutableDictionary *)currentQueries setObject:v18 forKey:v14];

      unint64_t v19 = [v14 unsignedLongLongValue];
      self->_currentQueryAllReference = v19;
      *(void *)&buf[8] = 0;
      *(_DWORD *)&buf[8] = [(NWStatisticsManager *)self commandFromReference:v19];
      *(void *)buf = v19;
      *(void *)&buf[16] = -1;
      *(_WORD *)&buf[14] = 2;
      if (![(NWStatisticsManager *)self sendMessage:buf length:24])
      {
        [(NWStatisticsManager *)self handleCompletion:v19 message:0 length:0];
        __int16 v20 = NStatGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v27 = 134218240;
          __int16 v28 = self;
          __int16 v29 = 2048;
          unint64_t v30 = v19;
          _os_log_impl(&dword_21C4BC000, v20, OS_LOG_TYPE_ERROR, "Manager %p: Failure to send message with reference %llu", v27, 0x16u);
        }

        if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0) {
          NStatMgrTraceF(self, "%s Manager %p: Failure to send message with reference %llu", v21, v22, v23, v24, v25, v26, (char)"-[NWStatisticsManager startQueuedQuery]");
        }
      }
    }
  }
}

- (BOOL)addSource:(id)a3 request:(nstat_msg_add_src *)a4 length:(unint64_t)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  if (v9)
  {
    dispatch_semaphore_t v10 = v9;
    a4->var0.unint64_t context = 0;
    uint64_t v11 = [(NWStatisticsManager *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke;
    block[3] = &unk_264404F38;
    void block[4] = self;
    id v12 = v8;
    id v18 = v12;
    uint64_t v13 = v10;
    unint64_t v19 = v13;
    __int16 v20 = a4;
    unint64_t v21 = a5;
    dispatch_sync(v11, block);

    if (a4->var0.context)
    {
      dispatch_time_t v14 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v13, v14);
    }

    BOOL v15 = [v12 reference] != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __48__NWStatisticsManager_addSource_request_length___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) readSource];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _nextReferenceForTarget:0 command:1001];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke_2;
    v12[3] = &unk_264404F10;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v13 = v4;
    uint64_t v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v6 = (void *)MEMORY[0x21D4A8470](v12);
    id v7 = (void *)MEMORY[0x21D4A8470]();
    id v8 = [NSNumber numberWithUnsignedLongLong:v3];
    dispatch_semaphore_t v9 = *(void **)(*(void *)(a1 + 32) + 248);
    dispatch_semaphore_t v10 = (void *)MEMORY[0x21D4A8470](v7);
    [v9 setObject:v10 forKey:v8];

    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)(v11 + 8) = 1001;
    *(void *)uint64_t v11 = v3;
    objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:");
  }
}

uint64_t __48__NWStatisticsManager_addSource_request_length___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 >= 0x20 && *(_DWORD *)(a2 + 8) == 10001)
  {
    [*(id *)(a1 + 32) setReference:*(void *)(a2 + 16)];
    id v4 = [*(id *)(a1 + 40) _internalSources];
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "reference"));
    [v4 setObject:v5 forKey:v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 1;
}

- (void)sendRemoveSourceInternal:(unint64_t)a3
{
  v3[0] = 0;
  v3[1] = 1003;
  v3[2] = a3;
  [(NWStatisticsManager *)self sendMessage:v3 length:24];
}

- (void)removeSourceInternal:(unint64_t)a3 isFromClient:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  id v7 = [(NWStatisticsManager *)self _internalSources];
  id v8 = [v7 objectForKey:v6];

  if (!v8) {
    goto LABEL_13;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 40;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 56;
LABEL_7:
      uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + v9);
      -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", [v8 reference]);
      if ((v10 & 0x100000) != 0)
      {
        [v8 setRemoving:1];
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", [v8 reference]);
  }
LABEL_10:
  uint64_t v11 = [(NWStatisticsManager *)self _internalSources];
  [v11 removeObjectForKey:v6];

  ++self->_numSourcesRemoved;
  id v12 = [(NWStatisticsManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(NWStatisticsManager *)self clientQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke;
    v14[3] = &unk_264404EC0;
    v14[4] = self;
    id v15 = v8;
    dispatch_async(v13, v14);
  }
LABEL_13:
}

void __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)MEMORY[0x21D4A8280]();
    [v3 statisticsManager:*(void *)(a1 + 32) didRemoveSource:*(void *)(a1 + 40)];
  }
}

- (void)subscribeToSystemInformation
{
  id v3 = [(NWStatisticsManager *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke;
  block[3] = &unk_264404EE8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    long long v2 = xmmword_21C4F59C0;
    return [*(id *)(result + 32) sendMessage:&v2 length:16];
  }
  return result;
}

- (BOOL)addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5 pid:(int)a6 uuid:(unsigned __int8 *)(a7
{
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if ((a3 - 2) >= 4 && a3 != 8) {
    __assert_rtn("-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]", "NWStatisticsManager.m", 869, "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDER_UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND)");
  }
  id v13 = [(NWStatisticsManager *)self internalQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke;
  v16[3] = &unk_264404F60;
  v16[6] = a4;
  v16[7] = a5;
  int v17 = a3;
  int v18 = a6;
  v16[8] = a7;
  v16[4] = self;
  void v16[5] = &v19;
  dispatch_sync(v13, v16);

  char v14 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v14;
}

void __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke(uint64_t a1)
{
  v24[7] = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)uint64_t v24 = 0u;
  LODWORD(v24[1]) = 1002;
  *(_OWORD *)&v24[2] = v2;
  memset(&v24[4], 0, 24);
  uint64_t v3 = *(void *)(a1 + 72);
  v24[4] = v3;
  BOOL v4 = *(_OWORD **)(a1 + 64);
  if (v4) {
    *(_OWORD *)&v24[5] = *v4;
  }
  *(void *)(*(void *)(a1 + 32) + 8 * (int)v3 + 24) = v2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:v24 length:56];
  uint64_t v5 = NStatGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      uint64_t v9 = "success";
    }
    else {
      uint64_t v9 = "failure";
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v17 = v8;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2080;
    uint64_t v23 = v9;
    _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_INFO, "Manager %p: add all for provider %d filter 0x%llx returns %s", buf, 0x26u);
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: add all for provider %d filter 0x%llx returns %s", v10, v11, v12, v13, v14, v15, (char)"-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]_block_invoke");
  }
}

- (BOOL)addAllTCP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8 = -805306369;
  if (!a5) {
    uint64_t v8 = -855638017;
  }
  unint64_t v9 = v8 & a3;
  if (a6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v9 & 0xFFFFFFFFC3FFFFFFLL;
  }
  if (a6) {
    BOOL v11 = (a3 & 0xC000000) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a6;
  }
  if (a5) {
    BOOL v13 = (a3 & 0x3000000) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = a5;
  }
  if ((a3 & 0x30000000) != 0) {
    unint64_t v15 = a3 & 0x30000000;
  }
  else {
    unint64_t v15 = 805306368;
  }
  BOOL v16 = (v15 & 0x10000000) == 0
     || [(NWStatisticsManager *)self addAllForProvider:2 filter:v10 events:a4 pid:v14 uuid:v12];
  if (v15 >> 29 && v16)
  {
    LOBYTE(v16) = [(NWStatisticsManager *)self addAllForProvider:3 filter:v10 events:a4 pid:v14 uuid:v12];
  }
  return v16;
}

- (BOOL)addAllUDP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8 = -1879048193;
  if (!a5) {
    uint64_t v8 = -1929379841;
  }
  unint64_t v9 = v8 & a3;
  if (a6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v9 & 0xFFFFFFFF83FFFFFFLL;
  }
  if (a6) {
    BOOL v11 = (a3 & 0xC000000) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a6;
  }
  if (a5) {
    BOOL v13 = (a3 & 0x3000000) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = a5;
  }
  if ((a3 & 0x70000000) != 0) {
    unint64_t v15 = a3 & 0x70000000;
  }
  else {
    unint64_t v15 = 1879048192;
  }
  if ((v15 & 0x10000000) != 0)
  {
    BOOL v16 = [(NWStatisticsManager *)self addAllForProvider:4 filter:v10 events:a4 pid:v14 uuid:v12];
    if ((v15 & 0x20000000) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v16 = 1;
    if ((v15 & 0x20000000) == 0) {
      goto LABEL_27;
    }
  }
  if (v16) {
    BOOL v16 = [(NWStatisticsManager *)self addAllForProvider:5 filter:v10 events:a4 pid:v14 uuid:v12];
  }
LABEL_27:
  if (v15 >> 30 && v16)
  {
    LOBYTE(v16) = [(NWStatisticsManager *)self addAllForProvider:8 filter:v10 events:a4 pid:v14 uuid:v12];
  }
  return v16;
}

- (BOOL)addAllTCP:(unint64_t)a3
{
  return [(NWStatisticsManager *)self addAllTCP:a3 events:0 pid:0 uuid:0];
}

- (BOOL)addAllUDP:(unint64_t)a3
{
  return [(NWStatisticsManager *)self addAllUDP:a3 events:0 pid:0 uuid:0];
}

- (BOOL)addAllRoute:(unint64_t)a3
{
  BOOL v4 = self;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(NWStatisticsManager *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NWStatisticsManager_addAllRoute___block_invoke;
  block[3] = &unk_264404F88;
  void block[5] = &v8;
  void block[6] = a3;
  void block[4] = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

void __35__NWStatisticsManager_addAllRoute___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  uint64_t v18 = 0;
  DWORD2(v15) = 1002;
  LODWORD(v17) = 1;
  *(void *)&long long v16 = *(void *)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:&v15 length:56];
  long long v2 = NStatGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      BOOL v4 = "success";
    }
    else {
      BOOL v4 = "failure";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v3;
    __int16 v13 = 2080;
    uint64_t v14 = v4;
    _os_log_impl(&dword_21C4BC000, v2, OS_LOG_TYPE_DEBUG, "Manager %p: add all routes returns %s", buf, 0x16u);
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: add all routes returns %s", v5, v6, v7, v8, v9, v10, (char)"-[NWStatisticsManager addAllRoute:]_block_invoke");
  }
}

- (BOOL)addAllRoute
{
  return [(NWStatisticsManager *)self addAllRoute:0];
}

- (void)removeSource:(id)a3
{
  uint64_t v4 = [a3 reference];
  uint64_t v5 = [(NWStatisticsManager *)self internalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__NWStatisticsManager_removeSource___block_invoke;
  v6[3] = &unk_264404FB0;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(v5, v6);
}

uint64_t __36__NWStatisticsManager_removeSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSourceInternal:*(void *)(a1 + 40) isFromClient:1];
}

- (unsigned)commandFromReference:(unint64_t)a3
{
  if ((a3 & 3) == 2) {
    unsigned int v3 = 1004;
  }
  else {
    unsigned int v3 = 1007;
  }
  if ((a3 & 3) == 1) {
    return 1005;
  }
  else {
    return v3;
  }
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRequestMessage:*(unsigned int *)(a1 + 48) sourceRef:*(void *)(a1 + 40)];
}

- (void)queryAllCounts:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    uint64_t v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (void *)MEMORY[0x21D4A8470](v4);
      *(_DWORD *)buf = 134218240;
      long long v15 = self;
      __int16 v16 = 2048;
      long long v17 = v6;
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all counts, completion %p", buf, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    __int16 v13 = (void *)MEMORY[0x21D4A8470](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all counts, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAllCounts:]");
  }
  if ([(NWStatisticsManager *)self isInvalidated])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    [(NWStatisticsManager *)self performQuery:1004 sourceRef:-1 completion:v4];
  }
}

- (void)queryAllDescriptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    uint64_t v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (void *)MEMORY[0x21D4A8470](v4);
      *(_DWORD *)buf = 134218240;
      long long v15 = self;
      __int16 v16 = 2048;
      long long v17 = v6;
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all descriptions, completion %p", buf, 0x16u);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    __int16 v13 = (void *)MEMORY[0x21D4A8470](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all descriptions, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAllDescriptions:]");
  }
  if ([(NWStatisticsManager *)self isInvalidated])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    [(NWStatisticsManager *)self performQuery:1005 sourceRef:-1 completion:v4];
  }
}

- (void)querySource:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (([(NWStatisticsManager *)self mgrflags] & 0x10) != 0)
  {
    uint64_t v8 = NStatGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v6 reference];
      uint64_t v10 = (void *)MEMORY[0x21D4A8470](v7);
      *(_DWORD *)buf = 134218752;
      uint64_t v19 = self;
      __int16 v20 = 2048;
      id v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl(&dword_21C4BC000, v8, OS_LOG_TYPE_DEBUG, "Manager %p: Query Source for %p, %llu  completion %p", buf, 0x2Au);
    }
  }
  if (([(NWStatisticsManager *)self mgrflags] & 0x80) != 0)
  {
    [v6 reference];
    long long v17 = (void *)MEMORY[0x21D4A8470](v7);
    NStatMgrTraceF(self, "%s Manager %p: Query Source for %p, %llu  completion %p", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsManager querySource:completion:]");
  }
  if ([(NWStatisticsManager *)self isInvalidated])
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:](self, "performQuery:sourceRef:completion:", 1007, [v6 reference], v7);
  }
}

- (void)setQueuePriority:(int64_t)a3
{
  unsigned int v3 = NStatGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[NWStatisticsManager setQueuePriority:]();
  }
}

- (void)setMgrflags:(unsigned int)a3
{
  uint64_t v5 = [(NWStatisticsManager *)self internalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__NWStatisticsManager_setMgrflags___block_invoke;
  v6[3] = &unk_264405078;
  unsigned int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __35__NWStatisticsManager_setMgrflags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 204)) {
    *(_DWORD *)(v2 + 204) = defaultMgrFlags | v1;
  }
  return result;
}

- (void)setInterfaceTraceFd:(int)a3
{
  uint64_t v5 = [(NWStatisticsManager *)self internalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke;
  v6[3] = &unk_264405078;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 112))
  {
    *(void *)(*(void *)(a1 + 32) + 112) = malloc_type_malloc(0x1000uLL, 0x1B1A54B4uLL);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v3 = *(_DWORD *)(v2 + 208);
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 208) = *(_DWORD *)(a1 + 40);
  objc_sync_exit(obj);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NWStatisticsManager *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__NWStatisticsManager_setDelegate___block_invoke;
  v7[3] = &unk_264404EC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __35__NWStatisticsManager_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 224), *(id *)(a1 + 40));
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 subscribeToSystemInformation];
  }
  return result;
}

- (unsigned)filter
{
  return self->_filter;
}

- (NSSet)sources
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  int v3 = [(NWStatisticsManager *)self internalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__NWStatisticsManager_sources__block_invoke;
  v6[3] = &unk_2644050A0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __30__NWStatisticsManager_sources__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  id v7 = [*(id *)(a1 + 32) _internalSources];
  int v3 = [v7 allValues];
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)performAllCompletions:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke;
  v4[3] = &unk_2644050F0;
  v4[4] = self;
  id v3 = a3;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  [v3 removeAllObjects];
}

void __45__NWStatisticsManager_performAllCompletions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)MEMORY[0x21D4A8470](a3);
  uint64_t v5 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke_2;
  block[3] = &unk_2644050C8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __45__NWStatisticsManager_performAllCompletions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v3 = [(NWStatisticsManager *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsManager_invalidate__block_invoke;
  block[3] = &unk_264404EE8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __33__NWStatisticsManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) readSource];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) readSource];
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setReadSource:0];
  }
  uint64_t v4 = [*(id *)(a1 + 32) currentQueries];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 currentQueries];
    [v5 performAllCompletions:v6];
  }
  [*(id *)(a1 + 32) setCurrentQueries:0];
  id v7 = [*(id *)(a1 + 32) queuedQueryAlls];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v8 queuedQueryAlls];
    [v8 performAllCompletions:v9];
  }
  [*(id *)(a1 + 32) setQueuedQueryAlls:0];
  while (1)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _internalSources];
    uint64_t v11 = [v10 count];

    if (!v11) {
      break;
    }
    id v12 = [*(id *)(a1 + 32) _internalSources];
    uint64_t v13 = [v12 allKeys];

    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    objc_msgSend(*(id *)(a1 + 32), "removeSourceInternal:isFromClient:", objc_msgSend(v14, "unsignedLongLongValue"), 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "set_internalSources:", 0);
  uint64_t v15 = *(_DWORD **)(a1 + 32);
  if ((v15[52] & 0x80000000) == 0)
  {
    uint64_t v16 = v15;
    objc_sync_enter(v16);
    *(_DWORD *)(*(void *)(a1 + 32) + 208) = -1;
    long long v17 = *(void **)(*(void *)(a1 + 32) + 112);
    if (v17)
    {
      free(v17);
      *(void *)(*(void *)(a1 + 32) + 112) = 0;
    }
    objc_sync_exit(v16);

    uint64_t v15 = *(_DWORD **)(a1 + 32);
  }
  return [v15 setInvalidated:1];
}

- (void)dealloc
{
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    uint64_t v4 = self->_readSource;
    self->_readSource = 0;
  }
  readBuffer = self->_readBuffer;
  if (readBuffer) {
    free(readBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)NWStatisticsManager;
  [(NWStatisticsManager *)&v6 dealloc];
}

- (NWStatisticsManager)initWithQueue:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)NWStatisticsManager;
  objc_super v6 = [(NWStatisticsManager *)&v69 init];
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v9 = NStatGetLog();
    int v10 = socket(32, 2, 2);
    if (v10 == -1)
    {
LABEL_10:
      v7->_int sockfd = -1;
      uint64_t v13 = NStatGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:]();
      }

LABEL_13:
      id v8 = 0;
      goto LABEL_14;
    }
    int v11 = v10;
    int v77 = 0;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    *(_OWORD *)__str = 0u;
    long long v72 = 0u;
    __strlcpy_chk();
    if (ioctl(v11, 0xC0644E03uLL, __str) == -1)
    {
LABEL_9:
      close(v11);
      goto LABEL_10;
    }
    *(_OWORD *)&v78[12] = 0uLL;
    *(_DWORD *)v78 = 139296;
    *(void *)&v78[4] = *(unsigned int *)__str;
    int v79 = 0;
    if (connect(v11, (const sockaddr *)v78, 0x20u))
    {
      id v12 = NStatGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.7();
      }
LABEL_8:

      goto LABEL_9;
    }
    int relative_priority_ptr = 0x20000;
    if (setsockopt(v11, 0xFFFF, 4098, &relative_priority_ptr, 4u) == -1)
    {
      id v12 = NStatGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:]();
      }
      goto LABEL_8;
    }
    int v15 = fcntl(v11, 3, 0);
    if (fcntl(v11, 4, v15 | 4u) == -1)
    {
      id v12 = NStatGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:]();
      }
      goto LABEL_8;
    }
    v7->_int sockfd = v11;
    uint64_t v16 = (char *)malloc_type_malloc(0x1000uLL, 0xC0652CC9uLL);
    v7->_readBuffer = v16;
    if (!v16)
    {
      __int16 v43 = NStatGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.4();
      }

      close(v7->_sockfd);
      goto LABEL_13;
    }
    objc_storeStrong((id *)&v7->_clientQueue, a3);
    snprintf(__str, 0x3BuLL, "com.apple.network.statistics.manager.%p", v7);
    int relative_priority_ptr = 0;
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v5, &relative_priority_ptr);
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(0, qos_class, relative_priority_ptr);
    dispatch_queue_t v19 = dispatch_queue_create(__str, v18);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v19;

    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    internalSources = v7->__internalSources;
    v7->__internalSources = v21;

    uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    currentQueries = v7->_currentQueries;
    v7->_currentQueries = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    queuedQueryAlls = v7->_queuedQueryAlls;
    v7->_queuedQueryAlls = v25;

    unint64_t v27 = v7->_internalQueue;
    if (v27 && v7->__internalSources && v7->_currentQueries && v7->_queuedQueryAlls)
    {
      dispatch_source_t v28 = dispatch_source_create(MEMORY[0x263EF83E8], v7->_sockfd, 0, v27);
      readSource = v7->_readSource;
      v7->_readSource = (OS_dispatch_source *)v28;

      if (v7->_readSource)
      {
        v7->_uint64_t id = atomic_fetch_add_explicit(&mgrSeqno, 1u, memory_order_relaxed) + 1;
        v7->_interfaceTraceFd = -1;
        if (traceFilePrefix)
        {
          id v30 = objc_alloc_init(MEMORY[0x263F08790]);
          unint64_t v31 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
          [v30 setLocale:v31];

          [v30 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
          uint64_t v32 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
          [v30 setTimeZone:v32];

          unint64_t v33 = NSString;
          uint64_t v34 = traceFilePrefix;
          uint64_t id = v7->_id;
          __int16 v36 = [MEMORY[0x263EFF910] date];
          unint64_t v37 = [v30 stringFromDate:v36];
          __int16 v38 = [v33 stringWithFormat:@"%@-%d.%@.trace", v34, id, v37];

          id v39 = v38;
          int v40 = open((const char *)[v39 UTF8String], 513, 438);
          if (v40 < 0)
          {
            uint64_t v44 = NStatGetLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              -[NWStatisticsManager initWithQueue:].cold.6();
            }
          }
          else
          {
            int v41 = v40;
            v7->_iftracebuf = (char *)malloc_type_malloc(0x1000uLL, 0x867A1716uLL);
            v7->_interfaceTraceFd = v41;
          }
        }
        v7->_unsigned int mgrflags = defaultMgrFlags;
        uint64_t v45 = NStatGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v46 = NStatGetLog();
          *(_DWORD *)v78 = 134218240;
          *(void *)&v78[4] = v7;
          *(_WORD *)&v78[12] = 2048;
          *(void *)&v78[14] = v46;
          _os_log_impl(&dword_21C4BC000, v45, OS_LOG_TYPE_DEBUG, "Manager %p: Log object is at %p", v78, 0x16u);
        }
        if (([(NWStatisticsManager *)v7 mgrflags] & 0x80) != 0)
        {
          __int16 v64 = NStatGetLog();
          NStatMgrTraceF(v7, "%s Manager %p: Log object is at %p", v47, v48, v49, v50, v51, v52, (char)"-[NWStatisticsManager initWithQueue:]");
        }
        int sockfd = v7->_sockfd;
        uint64_t v54 = v7->_readSource;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __37__NWStatisticsManager_initWithQueue___block_invoke;
        handler[3] = &__block_descriptor_36_e5_v8__0l;
        int v68 = sockfd;
        dispatch_source_set_cancel_handler(v54, handler);
        v55 = v7->_readSource;
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __37__NWStatisticsManager_initWithQueue___block_invoke_2;
        v65[3] = &unk_264404EE8;
        v56 = v7;
        __int16 v66 = v56;
        dispatch_source_set_event_handler(v55, v65);
        dispatch_resume((dispatch_object_t)v7->_readSource);
        int v57 = NStatGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v78 = 134218240;
          *(void *)&v78[4] = v56;
          *(_WORD *)&v78[12] = 2048;
          *(void *)&v78[14] = v56;
          _os_log_impl(&dword_21C4BC000, v57, OS_LOG_TYPE_INFO, "Manager %p: Created new NetworkStatistics manager at %p", v78, 0x16u);
        }

        if (([(NWStatisticsManager *)v56 mgrflags] & 0x80) != 0) {
          NStatMgrTraceF(v56, "%s Manager %p: Created new NetworkStatistics manager at %p", v58, v59, v60, v61, v62, v63, (char)"-[NWStatisticsManager initWithQueue:]");
        }
        id v8 = v56;

        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v42 = NStatGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.5();
      }
    }
    close(v7->_sockfd);
    id v8 = 0;
LABEL_34:
  }
LABEL_14:

  return v8;
}

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NWStatisticsManager)init
{
  id v3 = dispatch_get_global_queue(0, 0);
  uint64_t v4 = [(NWStatisticsManager *)self initWithQueue:v3];

  return v4;
}

- (NWStatisticsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NWStatisticsManagerDelegate *)WeakRetained;
}

- (int)interfaceTraceFd
{
  return self->_interfaceTraceFd;
}

- (int)interfaceSourceFd
{
  return self->_interfaceSourceFd;
}

- (void)setInterfaceSourceFd:(int)a3
{
  self->_interfaceSourceFd = a3;
}

- (void)setReadSource:(id)a3
{
}

- (void)setSockfd:(int)a3
{
  self->_int sockfd = a3;
}

- (BOOL)isReading
{
  return self->_reading;
}

- (void)setReading:(BOOL)a3
{
  self->_reading = a3;
}

- (void)set_internalSources:(id)a3
{
}

- (NSMutableDictionary)currentQueries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCurrentQueries:(id)a3
{
}

- (NSMutableDictionary)queuedQueryAlls
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setQueuedQueryAlls:(id)a3
{
}

- (unint64_t)querySequenceNumber
{
  return self->_querySequenceNumber;
}

- (void)setQuerySequenceNumber:(unint64_t)a3
{
  self->_querySequenceNumber = a3;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (id)strongDelegate
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setStrongDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_queuedQueryAlls, 0);
  objc_storeStrong((id *)&self->_currentQueries, 0);
  objc_storeStrong((id *)&self->__internalSources, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)traceMemoryBuf:(uint64_t)a1 length:(uint64_t)a2 tag:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21C4BC000, log, OS_LOG_TYPE_DEBUG, "save %s capacity limit for len %ld", (uint8_t *)&v3, 0x16u);
}

- (void)sendRequestMessage:sourceRef:.cold.1()
{
  __assert_rtn("-[NWStatisticsManager sendRequestMessage:sourceRef:]", "NWStatisticsManager.m", 388, "srcref != NSTAT_SRC_REF_ALL");
}

- (void)handleMessage:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 16);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_21C4BC000, a2, OS_LOG_TYPE_DEBUG, "error: %d, no quoted message in return", (uint8_t *)v3, 8u);
}

- (void)setQueuePriority:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Attempt to use obsolete setQueuePriority method", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to allocate a kernel control socket", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to set rcv buf size", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to set non-blocking", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to allocate a read buffer", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to initialize Sources / Queries / queuedQueryAlls", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to open trace file", v2, v3, v4, v5, v6);
}

- (void)initWithQueue:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21C4BC000, v0, v1, "Unable to connect to statistics control", v2, v3, v4, v5, v6);
}

@end