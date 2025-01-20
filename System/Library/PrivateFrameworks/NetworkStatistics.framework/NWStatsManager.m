@interface NWStatsManager
- (BOOL)configured;
- (BOOL)isInvalidated;
- (BOOL)setRcvBufsize:(int)a3;
- (NSMutableArray)queuedPolls;
- (NSMutableDictionary)internalSources;
- (NSMutableSet)interfaceSources;
- (NWStatsManager)initWithQueue:(id)a3;
- (NWStatsManagerDelegate)delegate;
- (NWStatsMonitor)statsMonitor;
- (NWStatsPollHandler)activePoll;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_source)readSource;
- (char)readBuffer;
- (id)getState;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (int)_refreshSyncUsingBlock:(id)a3;
- (int)_refreshUsingBlock:(id)a3 completionBlock:(id)a4;
- (int)_setThresholds:(id)a3;
- (int)configure:(id)a3;
- (int)initialConfigure:(id)a3;
- (int)reconfigure:(id)a3;
- (int)refresh:(id)a3;
- (int)refreshSync;
- (int)sockfd;
- (int)statsRefreshCurrentUsage;
- (unint64_t)currentQueryAllReference;
- (unint64_t)querySequenceNumber;
- (unint64_t)readBufferSize;
- (void)_adaptAfterDrop;
- (void)_addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5;
- (void)_drainReadBuffer;
- (void)_handleCompletion:(unint64_t)a3;
- (void)_handleCounts:(nstat_msg_src_counts *)a3;
- (void)_handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)_handleReads:(int64_t)a3;
- (void)_handleRemoveForSource:(id)a3;
- (void)_noteInterfaceSrcRef:(unint64_t)a3 forInterface:(unsigned int)a4 threshold:(unint64_t)a5;
- (void)_removeSourceInternal:(unint64_t)a3;
- (void)_restartPoll:(id)a3;
- (void)_sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)_sendPoll;
- (void)_sendRemoveSource:(unint64_t)a3;
- (void)_sendUpdateRequestMessage:(unint64_t)a3;
- (void)_setInterfaceTraceFd:(int)a3;
- (void)_setThreshold:(unint64_t)a3 onInterface:(unsigned int)a4;
- (void)_startPoll:(id)a3;
- (void)_startQueuedPoll;
- (void)_trace:(char *)a3;
- (void)_traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5;
- (void)dealloc;
- (void)dumpState;
- (void)ignoreSource:(unint64_t)a3;
- (void)invalidate;
- (void)setActivePoll:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setCurrentQueryAllReference:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceSources:(id)a3;
- (void)setInternalSources:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setQuerySequenceNumber:(unint64_t)a3;
- (void)setQueuedPolls:(id)a3;
- (void)setReadBuffer:(char *)a3;
- (void)setReadBufferSize:(unint64_t)a3;
- (void)setReadSource:(id)a3;
- (void)setSockfd:(int)a3;
- (void)setStatsMonitor:(id)a3;
@end

@implementation NWStatsManager

uint64_t __35__NWStatsManager_initialConfigure___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 1;
  uint64_t result = [*(id *)(a1 + 32) _handleReads:*(unsigned int *)(*(void *)(a1 + 32) + 28)];
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  return result;
}

- (void)_sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  v7 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(NWStatsManager *)self readSource];

  if (v8)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if (self->_interfaceTraceFd >= 1 && self->_iftracebuf) {
      [(NWStatsManager *)self _traceMemoryBuf:a3 length:a4 tag:"Output"];
    }
    if (send([(NWStatsManager *)self sockfd], a3, a4, 0) != a4 && a3->context)
    {
      -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
    }
  }
}

- (void)_handleReads:(int64_t)a3
{
  v5 = (void *)MEMORY[0x21D4A8280](self, a2);
  uint64_t v6 = 0;
  if (a3 <= 1) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = a3;
  }
  do
  {
    ssize_t v8 = recv([(NWStatsManager *)self sockfd], [(NWStatsManager *)self readBuffer], [(NWStatsManager *)self readBufferSize], 0);
    if (v8 < 1) {
      break;
    }
    unint64_t v9 = v8;
    v10 = [(NWStatsManager *)self readBuffer];
    if (v9 >= 0x10)
    {
      v11 = v10;
      do
      {
        unint64_t v12 = *((unsigned __int16 *)v11 + 6);
        if (v12 < 0x10 || (uint64_t)v9 < (uint64_t)v12) {
          break;
        }
        if (self->_interfaceTraceFd >= 1 && self->_iftracebuf) {
          [(NWStatsManager *)self _traceMemoryBuf:v11 length:*((unsigned __int16 *)v11 + 6) tag:"Input"];
        }
        v9 -= v12;
        [(NWStatsManager *)self _handleMessage:v11 length:v12];
        v11 += v12;
      }
      while (v9 > 0xF);
    }
    ++v6;
  }
  while (v6 != v7);
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (int)sockfd
{
  return self->_sockfd;
}

- (unint64_t)readBufferSize
{
  return self->_readBufferSize;
}

- (void)_handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  int64_t v7 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v7);

  unsigned int type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        unsigned int v14 = a3[1].type;
        if (v14 <= 0xA)
        {
          ++self->_providerCounts[v14].numSrcsAdded;
          if (v14 == 6 || self->_eagerInstantiate)
          {
            unint64_t context = a3[1].context;
            [(NWStatsManager *)self _sendUpdateRequestMessage:context];
          }
        }
      }
      return;
    case 0x2712u:
      if ((unint64_t)a4 < 0x18) {
        return;
      }
      unint64_t v16 = a3[1].context;
      int flags = a3->flags;
      v18 = [(NWStatsManager *)self internalSources];
      v19 = [NSNumber numberWithUnsignedLongLong:v16];
      v20 = [v18 objectForKey:v19];

      if (flags == 8)
      {
        v21 = NStatGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          int64_t v60 = v16;
          __int16 v61 = 2112;
          uint64_t v62 = (uint64_t)v20;
          _os_log_impl(&dword_21C4BC000, v21, OS_LOG_TYPE_ERROR, "NSTAT_MSG_TYPE_SRC_REMOVED received reports drop, source ref %lld source %@", buf, 0x16u);
        }

        [(NWStatsManager *)self _adaptAfterDrop];
      }
      if (v20)
      {
        [(NWStatsManager *)self _removeSourceInternal:v16];
        if (flags)
        {
          if (flags == 16)
          {
            uint64_t v22 = 560;
          }
          else
          {
            if (flags != 8) {
              goto LABEL_82;
            }
            uint64_t v22 = 552;
          }
        }
        else
        {
          uint64_t v22 = 544;
        }
      }
      else if (flags)
      {
        if (flags == 16)
        {
          uint64_t v22 = 536;
        }
        else
        {
          if (flags != 8) {
            goto LABEL_82;
          }
          uint64_t v22 = 528;
        }
      }
      else
      {
        uint64_t v22 = 520;
      }
      ++*(Class *)((char *)&self->super.isa + v22);
LABEL_82:

      return;
    case 0x2713u:
    case 0x2715u:
      return;
    case 0x2714u:
      if ((unint64_t)a4 >= 0x90)
      {
        [(NWStatsManager *)self _handleCounts:a3];
      }
      return;
    case 0x2716u:
    case 0x2717u:
      if ((unint64_t)a4 < 0x98) {
        return;
      }
      int v9 = a3[9].context;
      if ((v9 & 0xFFFFFFFE) != 2)
      {
        switch(v9)
        {
          case 4:
          case 5:
          case 10:
            if ((unint64_t)a4 > 0x1AF) {
              goto LABEL_57;
            }
            v10 = NStatGetLog();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_87;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v60 = a4;
            __int16 v61 = 2048;
            uint64_t v62 = 432;
            v11 = "UDP update message with size %ld below minimum %ld\n";
            goto LABEL_85;
          case 6:
            if ((unint64_t)a4 >= 0x190)
            {
              unint64_t v23 = a3[1].context;
              uint64_t context_low = LODWORD(a3[10].context);
              uint64_t v25 = *(void *)&a3[9].type;
              [(NWStatsManager *)self _noteInterfaceSrcRef:v23 forInterface:context_low threshold:v25];
            }
            return;
          case 8:
            if ((unint64_t)a4 > 0x1EF) {
              goto LABEL_57;
            }
            v10 = NStatGetLog();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_87;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v60 = a4;
            __int16 v61 = 2048;
            uint64_t v62 = 496;
            v11 = "QUIC update message with size %ld below minimum %ld\n";
            goto LABEL_85;
          case 9:
            if ((unint64_t)a4 > 0x15F) {
              goto LABEL_57;
            }
            v10 = NStatGetLog();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_87;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v60 = a4;
            __int16 v61 = 2048;
            uint64_t v62 = 352;
            v11 = "Userland connection update message with size %ld below minimum %ld\n";
            goto LABEL_85;
          default:
            v10 = NStatGetLog();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_87;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v60) = v9;
            v11 = "update message for unknown provider %d\n";
            v26 = v10;
            uint32_t v27 = 8;
            goto LABEL_86;
        }
      }
      if ((unint64_t)a4 > 0x1EF)
      {
LABEL_57:
        v28 = [(NWStatsManager *)self delegate];
        v29 = [NSNumber numberWithUnsignedLongLong:a3[1].context];
        v30 = [(NWStatsManager *)self internalSources];
        id v58 = [v30 objectForKey:v29];

        providerCounts = self->_providerCounts;
        unsigned __int16 v32 = a3->flags;
        if ((v32 & 4) != 0)
        {
          BOOL v57 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnClose;
          uint64_t v35 = 2;
          int v33 = 1;
        }
        else if (a3->context == 1)
        {
          BOOL v57 = 0;
          int v33 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnOpen;
          uint64_t v35 = 1;
        }
        else
        {
          uint64_t p_numUpdatesOnEvent = (uint64_t)&providerCounts[v9].numUpdatesOnEvent;
          uint64_t v37 = *(void *)&a3[1].type;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnPoll;
          if (v37) {
            p_numUpdatesOnClose = (void *)p_numUpdatesOnEvent;
          }
          BOOL v57 = v37 == 0;
          int v33 = 1;
          if (v37) {
            uint64_t v35 = 4;
          }
          else {
            uint64_t v35 = 3;
          }
        }
        ++*p_numUpdatesOnClose;
        if (v58)
        {
          if ((v33 & ([v58 removing] ^ 1)) == 1)
          {
            v38 = [(NWStatsManager *)self statsMonitor];
            if ([v58 updateWithUpdate:a3 length:a4 monitor:v38])
            {

LABEL_76:
              v41 = [v58 createSnapshot:v35 firstOccurrence:0];
              if ((a3->flags & 4) == 0) {
                goto LABEL_95;
              }
              v42 = [(NWStatsManager *)self internalSources];
              [v42 removeObjectForKey:v29];
              goto LABEL_94;
            }
            unsigned __int16 v40 = a3->flags;

            if ((v40 & 4) != 0) {
              goto LABEL_76;
            }
          }
          v41 = 0;
        }
        else
        {
          if ((v9 & 0xFFFFFFFE) == 2)
          {
            v39 = NWStatsTCPSource;
          }
          else
          {
            switch(v9)
            {
              case 4:
              case 5:
              case 10:
                v39 = NWStatsUDPSource;
                break;
              case 8:
                v39 = NWStatsQUICSource;
                break;
              case 9:
                v39 = NWStatsConnSource;
                break;
              default:
                -[NWStatsManager _handleMessage:length:]();
            }
          }
          id v43 = [v39 alloc];
          v44 = [(NWStatsManager *)self statsMonitor];
          id v58 = (id)[v43 initWithUpdate:a3 length:a4 monitor:v44];

          if (v58)
          {
            v41 = [v58 createSnapshot:v35 firstOccurrence:1];
            if ((v32 & 4) != 0) {
              goto LABEL_95;
            }
            v42 = [(NWStatsManager *)self internalSources];
            [v42 setObject:v58 forKey:v29];
LABEL_94:

LABEL_95:
            if (v41)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v45 = v41;
                v46 = v45;
                if (self->_trafficDeltaAdjustmentFactor > 0.0) {
                  objc_msgSend(v45, "applyTrafficAdjustmentFactor:");
                }
                if (self->_checkNESessionManagerVPNs)
                {
                  uint64_t v47 = [v46 interfaceIndex];
                  v48 = +[NWStatsInterfaceRegistry sharedInstance];
                  [v48 addInterfaceIndexToRegistry:v47];
                  if ([v48 isTrackingInterfaceIndex:v47]) {
                    [v46 donateBytesToAccumulator];
                  }
                  v49 = [v46 euuid];
                  int v50 = [v48 machOUUIDBelongsToVPNProvider:v49];

                  if (v50) {
                    [v46 removeBytesFromAccumulator];
                  }
                }
              }
              if (!v57) {
                goto LABEL_110;
              }
              uint64_t v51 = [(NWStatsManager *)self activePoll];
              if (!v51) {
                goto LABEL_110;
              }
              v52 = (void *)v51;
              v53 = [(NWStatsManager *)self activePoll];
              v54 = [v53 deliveryBlock];

              if (v54)
              {
                v55 = [(NWStatsManager *)self activePoll];
                v56 = [v55 deliveryBlock];
                ((void (**)(void, void *))v56)[2](v56, v41);
              }
              else
              {
LABEL_110:
                if (objc_opt_respondsToSelector()) {
                  [v28 statsManager:self didReceiveNWSnapshot:v41];
                }
              }
            }
            goto LABEL_113;
          }
          v41 = 0;
          id v58 = 0;
        }
LABEL_113:

        goto LABEL_114;
      }
      v10 = NStatGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        int64_t v60 = a4;
        __int16 v61 = 2048;
        uint64_t v62 = 496;
        v11 = "TCP update message with size %ld below minimum %ld\n";
LABEL_85:
        v26 = v10;
        uint32_t v27 = 22;
LABEL_86:
        _os_log_impl(&dword_21C4BC000, v26, OS_LOG_TYPE_ERROR, v11, buf, v27);
      }
LABEL_87:

      return;
    default:
      if (!type)
      {
        unint64_t currentPollReference = self->_currentPollReference;
        if (currentPollReference)
        {
          if (currentPollReference == a3->context)
          {
            if ((a3->flags & 2) != 0 && self->_continuationCount <= 0x27)
            {
              v13 = [(NWStatsManager *)self activePoll];
              if (!v13) {
                -[NWStatsManager _handleMessage:length:]();
              }

              id v58 = [(NWStatsManager *)self activePoll];
              -[NWStatsManager _restartPoll:](self, "_restartPoll:");
LABEL_114:
            }
            else
            {
              -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
            }
          }
        }
      }
      return;
  }
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592, 1);
}

- (NSMutableDictionary)internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 600, 1);
}

- (NWStatsPollHandler)activePoll
{
  return (NWStatsPollHandler *)objc_getProperty(self, a2, 664, 1);
}

- (NWStatsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NWStatsManagerDelegate *)WeakRetained;
}

- (NWStatsMonitor)statsMonitor
{
  return (NWStatsMonitor *)objc_getProperty(self, a2, 616, 1);
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 584, 1);
}

- (void)_sendUpdateRequestMessage:(unint64_t)a3
{
  v5 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  if (![(NWStatsManager *)self isInvalidated])
  {
    long long v6 = xmmword_21C4F5A30;
    DWORD2(v6) = 1007;
    unint64_t v7 = a3;
    [(NWStatsManager *)self _sendMessage:&v6 length:24];
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)_handleCompletion:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 && self->_currentPollReference == a3)
  {
    self->_unint64_t currentPollReference = 0;
    self->_continuationCount = 0;
    id v11 = [(NWStatsManager *)self activePoll];
    [(NWStatsManager *)self setActivePoll:0];
    if (v11)
    {
      if (([v11 synchronous] & 1) == 0)
      {
        v5 = [v11 completionBlock];

        if (v5)
        {
          long long v6 = [v11 completionBlock];
          v6[2]();
        }
      }
    }
    unint64_t v7 = [(NWStatsManager *)self queuedPolls];
    uint64_t v8 = [v7 count];

    if (v8) {
      [(NWStatsManager *)self _startQueuedPoll];
    }
  }
  else
  {
    int v9 = NStatGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t currentPollReference = self->_currentPollReference;
      *(_DWORD *)buf = 134218240;
      unint64_t v13 = currentPollReference;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_ERROR, "mismatch, _currentPollReference %lld supplied reference %lld", buf, 0x16u);
    }
  }
}

- (void)_startPoll:(id)a3
{
  id v6 = a3;
  v4 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v4);

  [(NWStatsManager *)self activePoll];
  if (objc_claimAutoreleasedReturnValue()) {
    -[NWStatsManager _startPoll:]();
  }
  [(NWStatsManager *)self setActivePoll:v6];
  unint64_t nextPollReference = self->_nextPollReference;
  self->_unint64_t currentPollReference = nextPollReference;
  self->_unint64_t nextPollReference = nextPollReference + 1;
  objc_msgSend(v6, "setNtstatContext:");
  [(NWStatsManager *)self _sendPoll];
}

- (void)setActivePoll:(id)a3
{
}

- (void)_sendPoll
{
  unint64_t currentPollReference = self->_currentPollReference;
  long long v3 = xmmword_21C4F5A40;
  LODWORD(v3) = 1007;
  WORD3(v3) = 2;
  [(NWStatsManager *)self _sendMessage:&currentPollReference length:24];
}

- (int)_refreshUsingBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NWStatsManager *)self queuedPolls];
  unint64_t v9 = [v8 count];

  if (v9 < 4)
  {
    if ([(NWStatsManager *)self configured])
    {
      if ([(NWStatsManager *)self isInvalidated])
      {
        unint64_t v12 = NStatGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19[0]) = 0;
          _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as manager was invalidated", (uint8_t *)v19, 2u);
        }

        int v11 = 6;
      }
      else
      {
        __int16 v14 = objc_alloc_init(NWStatsPollHandler);
        unint64_t v15 = v14;
        if (v14)
        {
          [(NWStatsPollHandler *)v14 setDeliveryBlock:v6];
          [(NWStatsPollHandler *)v15 setCompletionBlock:v7];
          [(NWStatsPollHandler *)v15 setManager:self];
          [(NWStatsPollHandler *)v15 setSynchronous:0];
          uint64_t v16 = [(NWStatsManager *)self activePoll];

          if (v16)
          {
            v17 = [(NWStatsManager *)self queuedPolls];
            [v17 addObject:v15];
          }
          else
          {
            [(NWStatsManager *)self _startPoll:v15];
          }
          int v11 = 0;
        }
        else
        {
          int v11 = 12;
        }
      }
    }
    else
    {
      unint64_t v13 = NStatGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19[0]) = 0;
        _os_log_impl(&dword_21C4BC000, v13, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as manager not yet configured", (uint8_t *)v19, 2u);
      }

      int v11 = 19;
    }
  }
  else
  {
    v10 = NStatGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v9;
      _os_log_impl(&dword_21C4BC000, v10, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as current outstanding is %d", (uint8_t *)v19, 8u);
    }

    int v11 = 35;
  }

  return v11;
}

- (NSMutableArray)queuedPolls
{
  return (NSMutableArray *)objc_getProperty(self, a2, 656, 1);
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)_traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  if (self->_interfaceTraceFd >= 1 && self->_iftracebuf)
  {
    v11.tv_sec = 0;
    *(void *)&v11.tv_usec = 0;
    gettimeofday(&v11, 0);
    snprintf(self->_iftracebuf, 0x1100uLL, "%ld.%06d %s len %zu\n", v11.tv_sec, v11.tv_usec, a5, a4);
    size_t v9 = strlen(self->_iftracebuf) + 1;
    size_t v10 = v9 + a4;
    if ((v9 + a4) >> 8 <= 0x10)
    {
      memcpy(&self->_iftracebuf[v9], a3, a4);
      write(self->_interfaceTraceFd, self->_iftracebuf, v10);
    }
  }
}

- (void)_trace:(char *)a3
{
  if (a3 && self->_interfaceTraceFd >= 1)
  {
    size_t v5 = strlen(a3) + 1;
    [(NWStatsManager *)self _traceMemoryBuf:a3 length:v5 tag:"Trace"];
  }
}

- (void)_sendRemoveSource:(unint64_t)a3
{
  size_t v5 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  v6[0] = 0;
  v6[1] = 1003;
  v6[2] = a3;
  [(NWStatsManager *)self _sendMessage:v6 length:24];
}

- (void)_restartPoll:(id)a3
{
  id v5 = a3;
  v4 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v4);

  if ((id)objc_claimAutoreleasedReturnValue() ! = [(NWStatsManager *)self activePoll]; {
    -[NWStatsManager _restartPoll:]();
  }

  [(NWStatsManager *)self _sendPoll];
}

- (void)_handleRemoveForSource:(id)a3
{
  id v6 = a3;
  v4 = [(NWStatsManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 createSnapshot:2 firstOccurrence:0];
    [v4 statsManager:self didReceiveNWSnapshot:v5];
  }
}

- (void)_adaptAfterDrop
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (v3 - self->_currentRcvBufTimestamp > 5.0)
  {
    int currentRcvBufSize = self->_currentRcvBufSize;
    if (currentRcvBufSize < 0x80000)
    {
      if ([(NWStatsManager *)self setRcvBufsize:(currentRcvBufSize + 0x10000)])
      {
        ++self->_numAdaptiveRcvBufIncrements;
        id v6 = NStatGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = self->_currentRcvBufSize;
          int numAdaptiveRcvBufIncrements = self->_numAdaptiveRcvBufIncrements;
          int v15 = 67109376;
          int v16 = v11;
          __int16 v17 = 1024;
          int v18 = numAdaptiveRcvBufIncrements;
          uint64_t v8 = "_adaptAfterDrop: updated buffer size to %d, adaptation count %d";
          size_t v9 = v6;
          os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
          uint32_t v13 = 14;
LABEL_11:
          _os_log_impl(&dword_21C4BC000, v9, v10, v8, (uint8_t *)&v15, v13);
        }
      }
      else
      {
        id v6 = NStatGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v14 = self->_currentRcvBufSize;
          int v15 = 67109120;
          int v16 = v14;
          uint64_t v8 = "_adaptAfterDrop: unable to update buffer size from %d";
          size_t v9 = v6;
          os_log_type_t v10 = OS_LOG_TYPE_ERROR;
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v6 = NStatGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = self->_currentRcvBufSize;
        int v15 = 67109120;
        int v16 = v7;
        uint64_t v8 = "_adaptAfterDrop: skip buffer size update as already at maximum %d";
        size_t v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        uint32_t v13 = 8;
        goto LABEL_11;
      }
    }

    self->_currentRcvBufTimestamp = v4;
  }
}

- (void)_drainReadBuffer
{
  ssize_t v3 = recv([(NWStatsManager *)self sockfd], [(NWStatsManager *)self readBuffer], [(NWStatsManager *)self readBufferSize], 0);
  if (v3 >= 1)
  {
    for (ssize_t i = v3;
          i > 0;
          ssize_t i = recv([(NWStatsManager *)self sockfd], [(NWStatsManager *)self readBuffer], [(NWStatsManager *)self readBufferSize], 0))
    {
      id v5 = [(NWStatsManager *)self readBuffer];
      if ((unint64_t)i >= 0x10)
      {
        id v6 = v5;
        do
        {
          unint64_t v7 = *((unsigned __int16 *)v6 + 6);
          if (v7 < 0x10 || i < (uint64_t)v7) {
            break;
          }
          if (self->_interfaceTraceFd >= 1)
          {
            if (self->_iftracebuf) {
              [(NWStatsManager *)self _traceMemoryBuf:v6 length:*((unsigned __int16 *)v6 + 6) tag:"Input"];
            }
          }
          v6 += v7;
          i -= v7;
        }
        while ((unint64_t)i > 0xF);
      }
    }
  }
}

- (void)_startQueuedPoll
{
  __assert_rtn("-[NWStatsManager _startQueuedPoll]", "NWStatsManager.m", 1251, "self.activePoll == nil");
}

- (void)_removeSourceInternal:(unint64_t)a3
{
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  double v4 = [(NWStatsManager *)self internalSources];
  id v5 = [v4 objectForKey:v7];

  if (v5)
  {
    [v5 setRemoved:1];
    id v6 = [(NWStatsManager *)self internalSources];
    [v6 removeObjectForKey:v7];

    [(NWStatsManager *)self _handleRemoveForSource:v5];
  }
}

- (void)_addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3 > 0xA || ((1 << a3) & 0x73C) == 0) {
    -[NWStatsManager _addAllForProvider:filter:events:]();
  }
  long long v8 = 0u;
  long long v5 = 0u;
  uint64_t v9 = 0;
  DWORD2(v5) = 1002;
  LODWORD(v8) = a3;
  unint64_t v6 = a4;
  unint64_t v7 = a5;
  [(NWStatsManager *)self _sendMessage:&v5 length:56];
}

- (void)_handleCounts:(nstat_msg_src_counts *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v5 = [(NWStatsManager *)self interfaceSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 srcRef] == a3->var1)
        {
          uint32_t v13 = [(NWStatsManager *)self delegate];
          uint64_t v14 = [v10 ifIndex];
          if (objc_opt_respondsToSelector()) {
            [v13 statsManager:self thresholdReachedOn:v14];
          }

          return;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v11 = NStatGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t var1 = a3->var1;
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = var1;
    _os_log_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected counts message on source ref %lld", buf, 0xCu);
  }

  [(NWStatsManager *)self _sendUpdateRequestMessage:a3->var1];
}

- (void)_noteInterfaceSrcRef:(unint64_t)a3 forInterface:(unsigned int)a4 threshold:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(NWStatsManager *)self interfaceSources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint32_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 ifIndex] == a4)
        {
          if ([v13 srcRef])
          {
            if ([v13 srcRef] != a3)
            {
              long long v15 = NStatGetLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v16 = [v13 srcRef];
                *(_DWORD *)buf = 134218496;
                unint64_t v23 = v16;
                __int16 v24 = 2048;
                unint64_t v25 = a3;
                __int16 v26 = 1024;
                unsigned int v27 = a4;
                _os_log_impl(&dword_21C4BC000, v15, OS_LOG_TYPE_DEFAULT, "Replace source ref %lld with %lld for monitoring interface %u", buf, 0x1Cu);
              }

              -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", [v13 srcRef]);
              [v13 setSrcRef:a3];
            }
          }
          else
          {
            [v13 setSrcRef:a3];
            long long v17 = NStatGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v23 = a3;
              __int16 v24 = 1024;
              LODWORD(v25) = a4;
              _os_log_impl(&dword_21C4BC000, v17, OS_LOG_TYPE_DEFAULT, "Adopt source ref %lld to monitor interface %u", buf, 0x12u);
            }
          }
          return;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = NStatGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v23 = a3;
    __int16 v24 = 1024;
    LODWORD(v25) = a4;
    _os_log_impl(&dword_21C4BC000, v14, OS_LOG_TYPE_DEFAULT, "Discard source ref %lld for interface %u", buf, 0x12u);
  }

  [(NWStatsManager *)self _sendRemoveSource:a3];
}

- (void)_setThreshold:(unint64_t)a3 onInterface:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(NWStatsManager *)self clientQueue];
  dispatch_assert_queue_V2(v7);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(NWStatsManager *)self interfaceSources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v14 = v11;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v11 = (NWStatsInterfaceSource *)*(id *)(*((void *)&v17 + 1) + 8 * v13);

      if ([(NWStatsInterfaceSource *)v11 ifIndex] == v4) {
        break;
      }
      ++v13;
      uint64_t v14 = v11;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }

    if (a3) {
      goto LABEL_13;
    }
    if ([(NWStatsInterfaceSource *)v11 srcRef]) {
      [(NWStatsManager *)self _sendRemoveSource:[(NWStatsInterfaceSource *)v11 srcRef]];
    }
    uint64_t v16 = [(NWStatsManager *)self interfaceSources];
    [v16 removeObject:v11];
  }
  else
  {
LABEL_10:

    if (a3)
    {
      uint64_t v11 = objc_alloc_init(NWStatsInterfaceSource);
      [(NWStatsInterfaceSource *)v11 setIfIndex:v4];
      [(NWStatsInterfaceSource *)v11 setThreshold:0];
      [(NWStatsInterfaceSource *)v11 setSrcRef:0];
      long long v15 = [(NWStatsManager *)self interfaceSources];
      [v15 addObject:v11];

LABEL_13:
      if ([(NWStatsInterfaceSource *)v11 threshold] != a3)
      {
        if ([(NWStatsInterfaceSource *)v11 srcRef])
        {
          [(NWStatsManager *)self _sendRemoveSource:[(NWStatsInterfaceSource *)v11 srcRef]];
          [(NWStatsInterfaceSource *)v11 setSrcRef:0];
        }
        long long v22 = 0u;
        long long v27 = 0u;
        long long v26 = 0u;
        long long v25 = 0u;
        uint64_t v21 = 0;
        LODWORD(v22) = 1001;
        DWORD2(v22) = 6;
        uint64_t v24 = v4;
        unint64_t v23 = a3;
        [(NWStatsInterfaceSource *)v11 setThreshold:a3];
        [(NWStatsManager *)self _sendMessage:&v21 length:40];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
}

- (int)_setThresholds:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = v4;
  if (!v4)
  {
    int v17 = 0;
    goto LABEL_21;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v7)
  {
    int v17 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v26;
  uint64_t v24 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v12 = NStatGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v18 = (objc_class *)objc_opt_class();
          long long v19 = NSStringFromClass(v18);
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          __int16 v31 = 2112;
          unsigned __int16 v32 = v19;
          _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "Incorrect key format for configuring thresholds, %@ has class %@", buf, 0x16u);
        }
        goto LABEL_19;
      }
      uint64_t v12 = v11;
      uint64_t v13 = [v6 objectForKeyedSubscript:v12];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v20 = NStatGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = (objc_class *)objc_opt_class();
          long long v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138412802;
          v30 = v13;
          __int16 v31 = 2112;
          unsigned __int16 v32 = v22;
          __int16 v33 = 2112;
          v34 = v12;
          _os_log_impl(&dword_21C4BC000, v20, OS_LOG_TYPE_ERROR, "Incorrect threshold format %@ of class %@ for configuring interface %@", buf, 0x20u);
        }
LABEL_19:
        long long v5 = v24;

        int v17 = 22;
        goto LABEL_20;
      }
      id v14 = v13;
      uint64_t v15 = [v14 unsignedLongLongValue];
      uint64_t v16 = [v12 unsignedIntegerValue];

      [(NWStatsManager *)self _setThreshold:v15 onInterface:v16];
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
    int v17 = 0;
    long long v5 = v24;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_20:

LABEL_21:
  return v17;
}

- (void)_setInterfaceTraceFd:(int)a3
{
  if (!self->_iftracebuf)
  {
    long long v5 = (char *)malloc_type_malloc(0x1100uLL, 0xA172743EuLL);
    if (!v5)
    {
      __break(1u);
      return;
    }
    self->_iftracebuf = v5;
  }
  int interfaceTraceFd = self->_interfaceTraceFd;
  if (interfaceTraceFd >= 1) {
    close(interfaceTraceFd);
  }
  self->_int interfaceTraceFd = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)invalidate
{
  ssize_t v3 = [(NWStatsManager *)self readSource];

  if (v3)
  {
    id v4 = [(NWStatsManager *)self readSource];
    dispatch_source_cancel(v4);

    [(NWStatsManager *)self setReadSource:0];
  }
  long long v5 = [(NWStatsManager *)self activePoll];

  if (v5) {
    [(NWStatsManager *)self setActivePoll:0];
  }
  [(NWStatsManager *)self setQueuedPolls:0];
  while (1)
  {
    id v6 = [(NWStatsManager *)self internalSources];
    uint64_t v7 = [v6 count];

    if (!v7) {
      break;
    }
    uint64_t v8 = [(NWStatsManager *)self internalSources];
    uint64_t v9 = [v8 allKeys];

    uint64_t v10 = [v9 objectAtIndexedSubscript:0];
    -[NWStatsManager _removeSourceInternal:](self, "_removeSourceInternal:", [v10 unsignedLongLongValue]);
  }
  [(NWStatsManager *)self setInternalSources:0];
  if (self->_interfaceTraceFd >= 1)
  {
    self->_int interfaceTraceFd = 0;
    iftracebuf = self->_iftracebuf;
    if (iftracebuf)
    {
      free(iftracebuf);
      self->_iftracebuf = 0;
    }
  }
  [(NWStatsManager *)self setInvalidated:1];
}

- (void)dealloc
{
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    id v4 = self->_readSource;
    self->_readSource = 0;
  }
  readBuffer = self->_readBuffer;
  if (readBuffer)
  {
    free(readBuffer);
    self->_readBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWStatsManager;
  [(NWStatsManager *)&v6 dealloc];
}

- (BOOL)setRcvBufsize:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v8 = a3;
  if (self->_currentRcvBufSize == a3) {
    return 1;
  }
  if (setsockopt(self->_sockfd, 0xFFFF, 4098, &v8, 4u) != -1)
  {
    self->_int currentRcvBufSize = v8;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_currentRcvBufTimestamp = v4;
    return 1;
  }
  objc_super v6 = NStatGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int currentRcvBufSize = self->_currentRcvBufSize;
    *(_DWORD *)buf = 67109376;
    int v10 = currentRcvBufSize;
    __int16 v11 = 1024;
    int v12 = v8;
    _os_log_impl(&dword_21C4BC000, v6, OS_LOG_TYPE_ERROR, "Unable to increment rcv buf size from %d to %d", buf, 0xEu);
  }

  return 0;
}

- (NWStatsManager)initWithQueue:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NWStatsManager;
  objc_super v6 = [(NWStatsManager *)&v23 init];
  if (!v6) {
    goto LABEL_15;
  }
  int v7 = socket(32, 2, 2);
  if (v7 == -1)
  {
LABEL_6:
    v6->_sockfd = -1;
    uint64_t v9 = NStatGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_ERROR, "Unable to allocate a kernel control socket", (uint8_t *)&buf, 2u);
    }

    goto LABEL_9;
  }
  int v8 = v7;
  int buf = 0;
  int v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)&buf_4[28] = 0u;
  long long v30 = 0u;
  strcpy(buf_4, "com.apple.network.statistics");
  if (ioctl(v7, 0xC0644E03uLL, &buf) == -1
    || (uint64_t v26 = 0,
        *(void *)&v25[12] = 0,
        int v27 = 0,
        *(_DWORD *)long long v25 = 139296,
        *(_DWORD *)&v25[4] = buf,
        *(_DWORD *)&v25[8] = 0,
        connect(v8, (const sockaddr *)v25, 0x20u)))
  {
LABEL_5:
    close(v8);
    goto LABEL_6;
  }
  int v11 = fcntl(v8, 3, 0);
  if (fcntl(v8, 4, v11 | 4u) == -1)
  {
    uint64_t v21 = NStatGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_21C4BC000, v21, OS_LOG_TYPE_ERROR, "Unable to set non-blocking", v24, 2u);
    }

    goto LABEL_5;
  }
  v6->_sockfd = v8;
  if ([(NWStatsManager *)v6 setRcvBufsize:0x20000])
  {
    objc_storeStrong((id *)&v6->_clientQueue, a3);
    int v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    internalSources = v6->_internalSources;
    v6->_internalSources = v12;

    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queuedPolls = v6->_queuedPolls;
    v6->_queuedPolls = v14;

    uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    interfaceSources = v6->_interfaceSources;
    v6->_interfaceSources = v16;

    long long v18 = [[NWStatsMonitor alloc] initWithQueue:v5];
    statsMonitor = v6->_statsMonitor;
    v6->_statsMonitor = v18;

    v6->_unint64_t nextPollReference = 2;
    if (v6->_clientQueue && v6->_internalSources && v6->_statsMonitor)
    {
LABEL_15:
      int v10 = v6;
      goto LABEL_16;
    }
    long long v22 = NStatGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21C4BC000, v22, OS_LOG_TYPE_ERROR, "Unable to initialize Sources / queue / monitor", (uint8_t *)&buf, 2u);
    }
  }
  close(v6->_sockfd);
LABEL_9:
  int v10 = 0;
LABEL_16:

  return v10;
}

- (int)initialConfigure:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int currentRcvBufSize = self->_currentRcvBufSize;
  self->_consecutiveReadLimit = 20;
  self->_checkNESessionManagerVPNs = 1;
  [(NWStatsManager *)self setReadBufferSize:4096];
  objc_super v6 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];

  HIDWORD(v77) = currentRcvBufSize;
  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];
  }
  else
  {
    uint64_t v9 = [[NWStatsTargetSelector alloc] initWithSelection:v4];
  }
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(NWStatsTargetSelector *)v9 filter];
    uint64_t v12 = [(NWStatsTargetSelector *)v10 connFilter];
    uint64_t v13 = [(NWStatsTargetSelector *)v10 events];
    int v14 = 0;
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v15 = NStatGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_21C4BC000, v15, OS_LOG_TYPE_ERROR, "initialConfigure: unexpected class for kNWStatsParameterTargetSelector", buf, 2u);
  }

  int v10 = 0;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  int v14 = 1;
LABEL_10:
  uint64_t v16 = v11 | 0x8000000000;
  int v17 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];

  if (v17)
  {
    long long v18 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
    uint64_t v19 = [v18 intValue];

    if (v19) {
      [(NWStatsManager *)self _setInterfaceTraceFd:v19];
    }
  }
  long long v20 = [v4 objectForKeyedSubscript:@"kNWStatsParameterDomainInfo"];

  if (v20)
  {
    uint64_t v21 = [v4 objectForKeyedSubscript:@"kNWStatsParameterDomainInfo"];
    if ([v21 BOOLValue])
    {
      uint64_t v16 = v11 | 0x28000000000;
      v12 |= 0x20000000000uLL;
      long long v22 = NStatGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 134217984;
        uint64_t v85 = v16;
        _os_log_impl(&dword_21C4BC000, v22, OS_LOG_TYPE_DEFAULT, "initialConfigure set NSTAT_EXTENSION_FILTER_DOMAIN_INFO, filter now 0x%llx", buf, 0xCu);
      }

      HIDWORD(v77) += 0x10000;
    }
  }
  objc_super v23 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownInbound"];

  if (v23)
  {
    uint64_t v24 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownInbound"];
    if ([v24 BOOLValue]) {
      v16 |= 0x4000000uLL;
    }
  }
  long long v25 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownOutbound"];

  if (v25)
  {
    uint64_t v26 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownOutbound"];
    if ([v26 BOOLValue]) {
      v16 |= 0x8000000uLL;
    }
  }
  int v27 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownListener"];

  if (v27)
  {
    long long v28 = [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownListener"];
    if ([v28 BOOLValue]) {
      v16 |= 0x2000000uLL;
    }
  }
  uint64_t v29 = [v4 objectForKeyedSubscript:@"kNWStatsParameterNECPClientTLV"];

  if (v29)
  {
    v16 |= 0x40000000000uLL;
    v12 |= 0x40000000000uLL;
    long long v30 = NStatGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 134217984;
      uint64_t v85 = v16;
      _os_log_impl(&dword_21C4BC000, v30, OS_LOG_TYPE_DEFAULT, "initialConfigure set NSTAT_EXTENSION_FILTER_NECP_TLV, filter now 0x%llx", buf, 0xCu);
    }
  }
  long long v31 = [v4 objectForKeyedSubscript:@"kNWStatsParameterNECPAncestralClientTLV"];

  if (v31) {
    uint64_t v32 = v12 | 0x80000000000;
  }
  else {
    uint64_t v32 = v12;
  }
  int v33 = [v4 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];

  if (v33)
  {
    uint64_t v34 = [v4 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
    if ([v34 BOOLValue]) {
      v32 |= 0x1000000uLL;
    }
  }
  uint64_t v35 = [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];

  LODWORD(v77) = v14;
  if (v35)
  {
    uint64_t v36 = [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
    if ([v36 BOOLValue]) {
      v32 |= 0x20000000uLL;
    }
  }
  uint64_t v37 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kNWStatsTuneMaxConsecutiveReads", v77);

  if (v37)
  {
    v38 = [v4 objectForKeyedSubscript:@"kNWStatsTuneMaxConsecutiveReads"];
    objc_opt_class();
    char v39 = objc_opt_isKindOfClass();

    if (v39)
    {
      unsigned __int16 v40 = [v4 objectForKeyedSubscript:@"kNWStatsTuneMaxConsecutiveReads"];
      self->_consecutiveReadLimit = [v40 intValue];
    }
  }
  v41 = [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnClose"];

  if (v41)
  {
    v42 = [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnClose"];
    if ([v42 BOOLValue]) {
      v32 |= 0x10000000uLL;
    }
  }
  id v43 = [v4 objectForKeyedSubscript:@"kNWStatsOptimizeFrequentRefresh"];

  if (v43)
  {
    v44 = [v4 objectForKeyedSubscript:@"kNWStatsOptimizeFrequentRefresh"];
    if ([v44 BOOLValue])
    {
      [(NWStatsManager *)self setReadBufferSize:0x4000];
      v16 |= 0x2000000000uLL;
    }
  }
  uint64_t v45 = [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
  if (v45)
  {
    v46 = (void *)v45;
    uint64_t v47 = [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    if (v48)
    {
      v49 = [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
      if ([v49 BOOLValue]) {
        v16 |= 0x800000uLL;
      }
    }
  }
  int v50 = [v4 objectForKeyedSubscript:@"kNWStatsParameterReportOpen"];

  if (v50)
  {
    uint64_t v51 = [v4 objectForKeyedSubscript:@"kNWStatsParameterReportOpen"];
    int v52 = [v51 BOOLValue];
    self->_BOOL eagerInstantiate = v52;
    if (v52)
    {
      v53 = [v4 objectForKeyedSubscript:@"kNWStatsParameterExperiment"];

      if (v53)
      {
        v54 = [v4 objectForKeyedSubscript:@"kNWStatsParameterExperiment"];
        if ([v54 BOOLValue])
        {
          v32 |= 0x200000uLL;
          v16 |= 0x200000uLL;
        }
      }
    }

    BOOL eagerInstantiate = self->_eagerInstantiate;
  }
  else
  {
    BOOL eagerInstantiate = 0;
    self->_BOOL eagerInstantiate = 0;
  }
  if (eagerInstantiate)
  {
    uint64_t v56 = v16;
  }
  else
  {
    v32 |= 0x100000uLL;
    uint64_t v56 = v16 | 0x100000;
  }
  BOOL v57 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];

  if (v57)
  {
    id v58 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];
    objc_opt_class();
    char v59 = objc_opt_isKindOfClass();

    if (v59)
    {
      int64_t v60 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];
      [v60 doubleValue];
      self->_trafficDeltaAdjustmentFactor = v61;
    }
  }
  uint64_t v62 = [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];

  if (v62)
  {
    uint64_t v63 = [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];
    objc_opt_class();
    char v64 = objc_opt_isKindOfClass();

    if (v64)
    {
      v65 = [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];
      self->_checkNESessionManagerVPNs = [v65 BOOLValue];
    }
  }
  size_t v66 = [(NWStatsManager *)self readBufferSize];
  if (!v66 || (v67 = (char *)malloc_type_malloc(v66, 0xA172743EuLL)) == 0) {
    __break(1u);
  }
  self->_readBuffer = v67;
  v68 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], self->_sockfd, 0, (dispatch_queue_t)self->_clientQueue);
  readSource = self->_readSource;
  self->_readSource = v68;

  v70 = self->_readSource;
  if (!v70)
  {
    close(self->_sockfd);
    int v73 = 55;
    goto LABEL_104;
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __35__NWStatsManager_initialConfigure___block_invoke;
  handler[3] = &unk_264404EE8;
  handler[4] = self;
  dispatch_source_set_event_handler(v70, handler);
  int sockfd = self->_sockfd;
  v72 = self->_readSource;
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __35__NWStatsManager_initialConfigure___block_invoke_2;
  v81[3] = &__block_descriptor_36_e5_v8__0l;
  int v82 = sockfd;
  dispatch_source_set_cancel_handler(v72, v81);
  dispatch_resume((dispatch_object_t)self->_readSource);
  [(NWStatsManager *)self _sendUpdateRequestMessage:-1];
  if (v78)
  {
    [(NWStatsManager *)self _addAllForProvider:2 filter:v56 events:v13];
    [(NWStatsManager *)self _drainReadBuffer];
  }
  else
  {
    if ([(NWStatsTargetSelector *)v10 shouldAddProvider:2])
    {
      [(NWStatsManager *)self _addAllForProvider:2 filter:v56 events:v13];
      [(NWStatsManager *)self _drainReadBuffer];
    }
    if (![(NWStatsTargetSelector *)v10 shouldAddProvider:4])
    {
LABEL_90:
      if ([(NWStatsTargetSelector *)v10 shouldAddProvider:3])
      {
        [(NWStatsManager *)self _addAllForProvider:3 filter:v56 events:v13];
        [(NWStatsManager *)self _drainReadBuffer];
      }
      if (![(NWStatsTargetSelector *)v10 shouldAddProvider:5]) {
        goto LABEL_94;
      }
      goto LABEL_93;
    }
  }
  [(NWStatsManager *)self _addAllForProvider:4 filter:v56 events:v13];
  [(NWStatsManager *)self _drainReadBuffer];
  if ((v78 & 1) == 0) {
    goto LABEL_90;
  }
  [(NWStatsManager *)self _addAllForProvider:3 filter:v56 events:v13];
  [(NWStatsManager *)self _drainReadBuffer];
LABEL_93:
  [(NWStatsManager *)self _addAllForProvider:5 filter:v56 events:v13];
  [(NWStatsManager *)self _drainReadBuffer];
  if (v78)
  {
LABEL_95:
    [(NWStatsManager *)self _addAllForProvider:8 filter:v56 events:v13];
    [(NWStatsManager *)self _drainReadBuffer];
    goto LABEL_96;
  }
LABEL_94:
  if ([(NWStatsTargetSelector *)v10 shouldAddProvider:8]) {
    goto LABEL_95;
  }
LABEL_96:
  if ([(NWStatsTargetSelector *)v10 shouldAddProvider:10])
  {
    [(NWStatsManager *)self _addAllForProvider:10 filter:v56 events:v13];
    [(NWStatsManager *)self _drainReadBuffer];
    uint64_t v74 = v79 + 0x8000;
  }
  else
  {
    uint64_t v74 = v79;
  }
  if ([(NWStatsTargetSelector *)v10 shouldAddProvider:9])
  {
    [(NWStatsManager *)self _addAllForProvider:9 filter:v32 | 0x120000000000 events:v13];
    [(NWStatsManager *)self _drainReadBuffer];
    uint64_t v74 = (v74 + 0x8000);
  }
  [(NWStatsManager *)self setRcvBufsize:v74];
  [(NWStatsManager *)self setConfigured:1];
  v75 = [v4 objectForKeyedSubscript:@"kNWStatsParameterThresholds"];
  int v73 = [(NWStatsManager *)self _setThresholds:v75];

  if (self->_eagerInstantiate || self->_trafficDeltaAdjustmentFactor > 0.0)
  {
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __35__NWStatsManager_initialConfigure___block_invoke_3;
    v80[3] = &unk_264404EE8;
    v80[4] = self;
    [(NWStatsManager *)self _refreshUsingBlock:0 completionBlock:v80];
  }
LABEL_104:

  return v73;
}

uint64_t __35__NWStatsManager_initialConfigure___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __35__NWStatsManager_initialConfigure___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  v1 = NStatGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21C4BC000, v1, OS_LOG_TYPE_DEFAULT, "Initial update for opens completed", v2, 2u);
  }
}

- (int)reconfigure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];

  if (v5)
  {
    int interfaceTraceFd = self->_interfaceTraceFd;
    int v7 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
    int v8 = [v7 intValue];

    if (interfaceTraceFd != v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
      -[NWStatsManager _setInterfaceTraceFd:](self, "_setInterfaceTraceFd:", [v9 intValue]);
    }
  }
  int v10 = [v4 objectForKeyedSubscript:@"kNWStatsParameterThresholds"];
  int v11 = [(NWStatsManager *)self _setThresholds:v10];

  return v11;
}

- (int)configure:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NWStatsManager *)self isInvalidated])
  {
    id v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_ERROR, "configure skipped as manager was invalidated", (uint8_t *)v18, 2u);
    }

    int v6 = 6;
  }
  else
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    int v8 = SecTaskCreateFromSelf(Default);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = (void *)SecTaskCopyValueForEntitlement(v8, @"com.apple.private.network.statistics", 0);
      int v11 = [v10 BOOLValue];
      uint64_t v12 = (void *)SecTaskCopyValueForEntitlement(v9, @"com.apple.private.coreservices.canmapbundleidtouuid", 0);

      int v13 = [v12 BOOLValue];
      CFRelease(v9);

      if (v11 && v13)
      {
        int v14 = [(NWStatsManager *)self statsMonitor];
        [v14 configure:v4];

        if ([(NWStatsManager *)self configured])
        {
          int v6 = [(NWStatsManager *)self reconfigure:v4];
        }
        else
        {
          int v6 = [(NWStatsManager *)self initialConfigure:v4];
          [(NWStatsManager *)self setConfigured:1];
        }
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v15 = NStatGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_21C4BC000, v15, OS_LOG_TYPE_ERROR, "NWStatsManager configure: unable to get task ref for entitlement check", (uint8_t *)v18, 2u);
      }

      int v11 = 0;
      int v13 = 0;
    }
    uint64_t v16 = NStatGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18[0] = 67109376;
      v18[1] = v11;
      __int16 v19 = 1024;
      int v20 = v13;
      _os_log_impl(&dword_21C4BC000, v16, OS_LOG_TYPE_FAULT, "NWStatsManager configure: entitlements not held, netstats %d, mapping %d", (uint8_t *)v18, 0xEu);
    }

    [(NWStatsManager *)self invalidate];
    int v6 = 1;
  }
LABEL_16:

  return v6;
}

- (int)statsRefreshCurrentUsage
{
  ssize_t v3 = [(NWStatsManager *)self queuedPolls];
  unint64_t v4 = [v3 count];

  if (v4 == 1) {
    return 1;
  }
  if (v4)
  {
    if (v4 < 4) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else
  {
    id v5 = [(NWStatsManager *)self activePoll];
    BOOL v6 = v5 != 0;
  }
  return v6;
}

- (int)refresh:(id)a3
{
  return [(NWStatsManager *)self _refreshUsingBlock:0 completionBlock:a3];
}

- (int)_refreshSyncUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(NWStatsManager *)self configured])
  {
    if ([(NWStatsManager *)self isInvalidated])
    {
      id v5 = NStatGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock skipped as manager was invalidated", buf, 2u);
      }

      int v6 = 6;
    }
    else if (self->_handlingSocketReads)
    {
      int v8 = NStatGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_21C4BC000, v8, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock abort to prevent deadlock", v15, 2u);
      }

      int v6 = 11;
    }
    else
    {
      uint64_t v9 = objc_alloc_init(NWStatsPollHandler);
      int v10 = v9;
      if (v9)
      {
        [(NWStatsPollHandler *)v9 setDeliveryBlock:v4];
        [(NWStatsPollHandler *)v10 setCompletionBlock:0];
        [(NWStatsPollHandler *)v10 setManager:self];
        [(NWStatsPollHandler *)v10 setSynchronous:1];
        int v11 = [(NWStatsManager *)self activePoll];

        if (v11)
        {
          uint64_t v12 = [(NWStatsManager *)self queuedPolls];
          [v12 addObject:v10];
        }
        else
        {
          [(NWStatsManager *)self _startPoll:v10];
        }
        self->_handlingSocketReads = 1;
        while (1)
        {
          int v13 = [(NWStatsManager *)self activePoll];

          if (!v13) {
            break;
          }
          [(NWStatsManager *)self _handleReads:1];
        }
        int v6 = 0;
        self->_handlingSocketReads = 0;
      }
      else
      {
        int v6 = 12;
      }
    }
  }
  else
  {
    int v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock skipped as manager not yet configured", v17, 2u);
    }

    int v6 = 19;
  }

  return v6;
}

- (int)refreshSync
{
  return [(NWStatsManager *)self _refreshSyncUsingBlock:0];
}

- (void)ignoreSource:(unint64_t)a3
{
  id v5 = [(NWStatsManager *)self internalSources];
  int v6 = [NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [v5 objectForKey:v6];

  int v7 = v8;
  if (v8)
  {
    [v8 setRemoving:1];
    [(NWStatsManager *)self _sendRemoveSource:a3];
    int v7 = v8;
  }
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  int v7 = [(NWStatsManager *)self statsMonitor];

  if (v7)
  {
    id v8 = [(NWStatsManager *)self statsMonitor];
    uint64_t v9 = [v8 identifierForUUID:v6 derivation:a4];
  }
  else
  {
    uint64_t v9 = @"unavailable";
  }

  return v9;
}

- (id)stateDictionary
{
  v2 = [(NWStatsManager *)self statsMonitor];
  ssize_t v3 = [v2 stateDictionary];

  return v3;
}

- (id)getState
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [NSString alloc];
  id v5 = [(NWStatsManager *)self internalSources];
  id v6 = objc_msgSend(v4, "initWithFormat:", @"NWStatsManager %p: Current num sources %d current buf size %d after %d adaptations", self, objc_msgSend(v5, "count"), self->_currentRcvBufSize, self->_numAdaptiveRcvBufIncrements);
  [v3 addObject:v6];

  int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"NWStatsManager %p: Source removes %lld after filter %lld after drop %lld", self, self->_combinedCounts.numRemoveSources, self->_combinedCounts.numRemoveSourcesAfterFilter, self->_combinedCounts.numRemoveSourcesAfterDrop);
  [v3 addObject:v7];

  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"NWStatsManager %p: No-source removes %lld after filter %lld after drop %lld", self, self->_combinedCounts.numRemoves, self->_combinedCounts.numRemovesAfterFilter, self->_combinedCounts.numRemovesAfterDrop);
  [v3 addObject:v8];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v9 = [(NWStatsManager *)self queuedPolls];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
  v44 = self;
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v54;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12;
      do
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(id *)(*((void *)&v53 + 1) + 8 * v14);

        uint64_t v16 = [v12 description];
        [v3 addObject:v16];

        ++v14;
        uint64_t v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v11);

    self = v44;
  }

  uint64_t v17 = 0;
  p_numUpdatesOnClose = &self->_providerCounts[1].numUpdatesOnClose;
  do
  {
    if (*(p_numUpdatesOnClose - 4)
      || *(p_numUpdatesOnClose - 3)
      || *(p_numUpdatesOnClose - 2)
      || *(p_numUpdatesOnClose - 1)
      || *p_numUpdatesOnClose)
    {
      if (v17 >= 0xA)
      {
        self = v44;
        __int16 v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown-%d", v17 + 1);
      }
      else
      {
        __int16 v19 = *(&off_264405388 + v17);
      }
      int v20 = (void *)[[NSString alloc] initWithFormat:@"NWStatsManager %p: %@ src-add %lld updates open %lld poll %lld event %lld close %lld", self, v19, *(p_numUpdatesOnClose - 4), *(p_numUpdatesOnClose - 3), *(p_numUpdatesOnClose - 2), *(p_numUpdatesOnClose - 1), *p_numUpdatesOnClose];
      [v3 addObject:v20];
    }
    ++v17;
    p_numUpdatesOnClose += 5;
  }
  while (v17 != 10);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v21 = [(NWStatsManager *)self interfaceSources];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"NWStatsManager %p: monitoring interface %d with srcref %lld threshold %lld", v44, objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "ifIndex"), objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "srcRef"), objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "threshold"));
        [v3 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v23);
  }

  int v27 = [(NWStatsManager *)v44 internalSources];
  long long v28 = [v27 allKeys];

  v42 = v28;
  [v28 sortedArrayUsingSelector:sel_compare_];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(obj);
        }
        int v33 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        id v34 = [NSString alloc];
        uint64_t v35 = [v33 longLongValue];
        uint64_t v36 = [(NWStatsManager *)v44 internalSources];
        uint64_t v37 = [v36 objectForKeyedSubscript:v33];
        v38 = (void *)[v34 initWithFormat:@" ref %6lld --> %@", v35, v37];
        [v3 addObject:v38];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v30);
  }
  if (v44->_checkNESessionManagerVPNs)
  {
    char v39 = +[NWStatsInterfaceRegistry sharedInstance];
    unsigned __int16 v40 = [v39 getState];
    [v3 addObject:v40];
  }
  return v3;
}

- (void)dumpState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(NWStatsManager *)self getState];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = NStatGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138543362;
          uint64_t v14 = v7;
          _os_log_impl(&dword_21C4BC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)setReadSource:(id)a3
{
}

- (void)setClientQueue:(id)a3
{
}

- (void)setSockfd:(int)a3
{
  self->_int sockfd = a3;
}

- (void)setInternalSources:(id)a3
{
}

- (NSMutableSet)interfaceSources
{
  return (NSMutableSet *)objc_getProperty(self, a2, 608, 1);
}

- (void)setInterfaceSources:(id)a3
{
}

- (void)setStatsMonitor:(id)a3
{
}

- (unint64_t)currentQueryAllReference
{
  return self->_currentQueryAllReference;
}

- (void)setCurrentQueryAllReference:(unint64_t)a3
{
  self->_currentQueryAllReference = a3;
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

- (void)setReadBufferSize:(unint64_t)a3
{
  self->_readBufferSize = a3;
}

- (void)setQueuedPolls:(id)a3
{
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePoll, 0);
  objc_storeStrong((id *)&self->_queuedPolls, 0);
  objc_storeStrong((id *)&self->_statsMonitor, 0);
  objc_storeStrong((id *)&self->_interfaceSources, 0);
  objc_storeStrong((id *)&self->_internalSources, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_startPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _startPoll:]", "NWStatsManager.m", 849, "self.activePoll == nil");
}

- (void)_restartPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _restartPoll:]", "NWStatsManager.m", 862, "self.activePoll == currentPoll");
}

- (void)_handleMessage:length:.cold.1()
{
}

- (void)_handleMessage:length:.cold.2()
{
  __assert_rtn("-[NWStatsManager _handleMessage:length:]", "NWStatsManager.m", 1117, "provider == NSTAT_PROVIDER_CONN_USERLAND");
}

- (void)_addAllForProvider:filter:events:.cold.1()
{
  __assert_rtn("-[NWStatsManager _addAllForProvider:filter:events:]", "NWStatsManager.m", 1306, "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDER_UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND) || (provider == NSTAT_PROVIDER_CONN_USERLAND) || (provider == NSTAT_PROVIDER_UDP_SUBFLOW)");
}

@end