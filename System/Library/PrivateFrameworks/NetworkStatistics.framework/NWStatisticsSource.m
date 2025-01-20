@interface NWStatisticsSource
+ (id)createSourceForProvider:(unsigned int)a3 srcRef:(unint64_t)a4 manager:(id)a5;
- (BOOL)_handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
- (BOOL)handleCounts:(const nstat_counts *)a3;
- (BOOL)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (BOOL)removing;
- (NWStatisticsManager)manager;
- (NWStatisticsSource)init;
- (NWStatisticsSource)initWithManager:(id)a3 source:(unint64_t)a4 provider:(unsigned int)a5;
- (NWStatisticsSourceDelegate)delegate;
- (const)_nstat_counts;
- (id)_currentSnapshot;
- (id)currentSnapshot;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
- (unint64_t)countsSeqno;
- (unint64_t)descriptorSeqno;
- (unint64_t)reference;
- (unint64_t)snapshotRevision;
- (unint64_t)sourceIdentifier;
- (unsigned)provider;
- (void)queryCounts;
- (void)queryDescription;
- (void)queryUpdate;
- (void)setCountsSeqno:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptorSeqno:(unint64_t)a3;
- (void)setReference:(unint64_t)a3;
- (void)setRemoving:(BOOL)a3;
@end

@implementation NWStatisticsSource

- (id)currentSnapshot
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWStatisticsSource *)v2 _currentSnapshot];
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)snapshotRevision
{
  return self->_descriptorSeqno + self->_countsSeqno;
}

- (unint64_t)reference
{
  return self->_reference;
}

- (const)_nstat_counts
{
  return &self->_last_counts;
}

- (BOOL)handleCounts:(const nstat_counts *)a3
{
  v5 = [(NWStatisticsSource *)self manager];
  v6 = [v5 internalQueue];
  dispatch_assert_queue_V2(v6);

  if ([(NWStatisticsSource *)self countsSeqno])
  {
    if (!memcmp(a3, &self->_last_counts, 0x70uLL))
    {
      v18 = [(NWStatisticsSource *)self manager];
      char v19 = [v18 mgrflags];

      return (v19 & 2) == 0;
    }
    else
    {
      long long v7 = *(_OWORD *)&a3->nstat_rxpackets;
      long long v8 = *(_OWORD *)&a3->nstat_cell_rxbytes;
      *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
      *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v8;
      *(_OWORD *)&self->_last_counts.nstat_rxpackets = v7;
      long long v9 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
      long long v10 = *(_OWORD *)&a3->nstat_wired_rxbytes;
      long long v11 = *(_OWORD *)&a3->nstat_connectsuccesses;
      *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
      *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v11;
      *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v9;
      *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v10;
      [(NWStatisticsSource *)self setCountsSeqno:[(NWStatisticsSource *)self countsSeqno] + 1];
      return 1;
    }
  }
  else
  {
    BOOL v12 = 1;
    [(NWStatisticsSource *)self setCountsSeqno:1];
    long long v13 = *(_OWORD *)&a3->nstat_rxpackets;
    long long v14 = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v14;
    *(_OWORD *)&self->_last_counts.nstat_rxpackets = v13;
    long long v15 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    long long v16 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    long long v17 = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v17;
    *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v15;
    *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v16;
  }
  return v12;
}

- (unint64_t)countsSeqno
{
  return self->_countsSeqno;
}

- (BOOL)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v7 = [(NWStatisticsSource *)self manager];
  char v8 = [v7 mgrflags];

  if ((v8 & 0x10) != 0)
  {
    long long v9 = NStatGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      long long v10 = [(NWStatisticsSource *)self manager];
      unint64_t v11 = [(NWStatisticsSource *)self reference];
      unsigned int type = a3->type;
      *(_DWORD *)buf = 134218752;
      v32 = v10;
      __int16 v33 = 2048;
      v34 = self;
      __int16 v35 = 2048;
      unint64_t v36 = v11;
      __int16 v37 = 1024;
      unsigned int v38 = type;
      _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu  message type %d", buf, 0x26u);
    }
  }
  long long v13 = [(NWStatisticsSource *)self manager];
  char v14 = [v13 mgrflags];

  if (v14 < 0)
  {
    long long v15 = [(NWStatisticsSource *)self manager];
    long long v16 = [(NWStatisticsSource *)self manager];
    [(NWStatisticsSource *)self reference];
    NStatMgrTraceF(v15, "%s Manager %p: Entry for source %p, ref %llu  message type %d", v17, v18, v19, v20, v21, v22, (char)"-[NWStatisticsSource handleMessage:length:]");
  }
  unsigned int v23 = a3->type;
  if (v23 != 10006)
  {
    if (v23 == 10004)
    {
      if ((unint64_t)a4 >= 0x90)
      {
        v29 = self;
        objc_sync_enter(v29);
        BOOL v25 = [(NWStatisticsSource *)v29 handleCounts:&a3[2]];
        goto LABEL_16;
      }
    }
    else if (v23 == 10003 && (unint64_t)a4 >= 0x29)
    {
      v24 = self;
      objc_sync_enter(v24);
      BOOL v25 = [(NWStatisticsSource *)v24 _handleDescriptor:&a3[2].type length:a4 - 40 events:0];
LABEL_16:
      LOBYTE(v28) = v25;
      goto LABEL_17;
    }
LABEL_18:
    LOBYTE(v28) = 0;
    return v28;
  }
  if ((unint64_t)a4 < 0x99) {
    goto LABEL_18;
  }
  v26 = self;
  objc_sync_enter(v26);
  BOOL v27 = [(NWStatisticsSource *)v26 _handleDescriptor:&a3[9].type length:a4 - 152 events:*(void *)&a3[1].type];
  int v28 = [(NWStatisticsSource *)v26 handleCounts:&a3[2]] || v27;
LABEL_17:
  objc_sync_exit(self);

  return v28;
}

- (NWStatisticsManager)manager
{
  return (NWStatisticsManager *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCountsSeqno:(unint64_t)a3
{
  self->_countsSeqno = a3;
}

- (BOOL)removing
{
  return self->_removing;
}

- (NWStatisticsSourceDelegate)delegate
{
  return (NWStatisticsSourceDelegate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)_handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  long long v9 = [(NWStatisticsSource *)self manager];
  long long v10 = [v9 internalQueue];
  dispatch_assert_queue_V2(v10);

  int v11 = [(NWStatisticsSource *)self handleDescriptor:a3 length:a4 events:a5];
  if (v11 == 3) {
    [(NWStatisticsSource *)self setDescriptorSeqno:[(NWStatisticsSource *)self descriptorSeqno] + 1];
  }
  return v11 != 1;
}

- (NWStatisticsSource)init
{
  return 0;
}

+ (id)createSourceForProvider:(unsigned int)a3 srcRef:(unint64_t)a4 manager:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  if ((v6 - 1) > 7) {
    char v8 = off_264404D68;
  }
  else {
    char v8 = off_264405130[(int)v6 - 1];
  }
  long long v9 = (void *)[objc_alloc(*v8) initWithManager:v7 source:a4 provider:v6];

  return v9;
}

- (unint64_t)sourceIdentifier
{
  return self->_reference;
}

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  return 1;
}

- (NWStatisticsSource)initWithManager:(id)a3 source:(unint64_t)a4 provider:(unsigned int)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NWStatisticsSource;
  long long v10 = [(NWStatisticsSource *)&v14 init];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_manager, a3);
    v11->_reference = a4;
    v11->_provider = a5;
    BOOL v12 = v11;
  }

  return v11;
}

- (void)queryCounts
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(NWStatisticsSource *)self manager];
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(NWStatisticsSource *)self manager];
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = [(NWStatisticsSource *)self reference];
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }
  id v7 = [(NWStatisticsSource *)self manager];
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    id v9 = [(NWStatisticsSource *)self manager];
    long long v10 = [(NWStatisticsSource *)self manager];
    [(NWStatisticsSource *)self reference];
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryCounts]");
  }
  uint64_t v17 = [(NWStatisticsSource *)self manager];
  uint64_t v18 = [v17 internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsSource_queryCounts__block_invoke;
  block[3] = &unk_264404EE8;
  block[4] = self;
  dispatch_async(v18, block);
}

void __33__NWStatisticsSource_queryCounts__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1004, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (void)queryDescription
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(NWStatisticsSource *)self manager];
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(NWStatisticsSource *)self manager];
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = [(NWStatisticsSource *)self reference];
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }
  id v7 = [(NWStatisticsSource *)self manager];
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    id v9 = [(NWStatisticsSource *)self manager];
    long long v10 = [(NWStatisticsSource *)self manager];
    [(NWStatisticsSource *)self reference];
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryDescription]");
  }
  uint64_t v17 = [(NWStatisticsSource *)self manager];
  uint64_t v18 = [v17 internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NWStatisticsSource_queryDescription__block_invoke;
  block[3] = &unk_264404EE8;
  block[4] = self;
  dispatch_async(v18, block);
}

void __38__NWStatisticsSource_queryDescription__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1005, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (void)queryUpdate
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(NWStatisticsSource *)self manager];
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    v5 = NStatGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(NWStatisticsSource *)self manager];
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = [(NWStatisticsSource *)self reference];
      _os_log_impl(&dword_21C4BC000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }
  id v7 = [(NWStatisticsSource *)self manager];
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    id v9 = [(NWStatisticsSource *)self manager];
    long long v10 = [(NWStatisticsSource *)self manager];
    [(NWStatisticsSource *)self reference];
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryUpdate]");
  }
  uint64_t v17 = [(NWStatisticsSource *)self manager];
  uint64_t v18 = [v17 internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsSource_queryUpdate__block_invoke;
  block[3] = &unk_264404EE8;
  block[4] = self;
  dispatch_async(v18, block);
}

void __33__NWStatisticsSource_queryUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1007, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (id)_currentSnapshot
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = NStatGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    char v4 = [(NWStatisticsSource *)self manager];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v4;
    _os_log_impl(&dword_21C4BC000, v3, OS_LOG_TYPE_ERROR, "Manager %p: Subclasses must provide an implementation for _currentSnapshot", buf, 0xCu);
  }
  v5 = [(NWStatisticsSource *)self manager];
  char v6 = [v5 mgrflags];

  if (v6 < 0)
  {
    id v7 = [(NWStatisticsSource *)self manager];
    uint64_t v15 = [(NWStatisticsSource *)self manager];
    NStatMgrTraceF(v7, "%s Manager %p: Subclasses must provide an implementation for _currentSnapshot", v8, v9, v10, v11, v12, v13, (char)"-[NWStatisticsSource _currentSnapshot]");
  }
  __assert_rtn("-[NWStatisticsSource _currentSnapshot]", "NWStatisticsSource.m", 241, "0");
}

- (void)setDelegate:(id)a3
{
}

- (void)setReference:(unint64_t)a3
{
  self->_reference = a3;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (unint64_t)descriptorSeqno
{
  return self->_descriptorSeqno;
}

- (void)setDescriptorSeqno:(unint64_t)a3
{
  self->_descriptorSeqno = a3;
}

- (unsigned)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end