@interface NWStatisticsInterfaceSource
- (NWStatisticsInterfaceSource)initWithManager:(id)a3 interface:(int64_t)a4 threshold:(int64_t)a5;
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
@end

@implementation NWStatisticsInterfaceSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0xF8) {
    return 1;
  }
  p_descriptor = &self->_descriptor;
  if (!memcmp(&self->_descriptor, a3, 0xF8uLL))
  {
    v21 = [(NWStatisticsSource *)self manager];
    char v22 = [v21 mgrflags];

    if ((v22 & 4) != 0) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    long long v9 = *(_OWORD *)a3;
    long long v10 = *((_OWORD *)a3 + 1);
    long long v11 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_min_latency = *((_OWORD *)a3 + 2);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_bytes_lost = v11;
    *(_OWORD *)&p_descriptor->threshold = v9;
    *(_OWORD *)&p_descriptor->link_status.u.cellular.valid_bitmask = v10;
    long long v12 = *((_OWORD *)a3 + 4);
    long long v13 = *((_OWORD *)a3 + 5);
    long long v14 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&p_descriptor->type = *((_OWORD *)a3 + 6);
    *(_OWORD *)&p_descriptor->description[12] = v14;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.dl_min_latency = v12;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.config_frequency = v13;
    long long v15 = *((_OWORD *)a3 + 8);
    long long v16 = *((_OWORD *)a3 + 9);
    long long v17 = *((_OWORD *)a3 + 11);
    *(_OWORD *)&p_descriptor->description[60] = *((_OWORD *)a3 + 10);
    *(_OWORD *)&p_descriptor->description[76] = v17;
    *(_OWORD *)&p_descriptor->description[28] = v15;
    *(_OWORD *)&p_descriptor->description[44] = v16;
    long long v18 = *((_OWORD *)a3 + 12);
    long long v19 = *((_OWORD *)a3 + 13);
    long long v20 = *((_OWORD *)a3 + 14);
    *(void *)&p_descriptor->name[12] = *((void *)a3 + 30);
    *(_OWORD *)&p_descriptor->description[108] = v19;
    *(_OWORD *)&p_descriptor->description[124] = v20;
    *(_OWORD *)&p_descriptor->description[92] = v18;
    return 3;
  }
}

- (id)_currentSnapshot
{
  v2 = [[NWSInterfaceSnapshot alloc] initWithCounts:[(NWStatisticsSource *)self _nstat_counts] interfaceDescriptor:&self->_descriptor sourceIdent:[(NWStatisticsSource *)self reference] seqno:[(NWStatisticsSource *)self snapshotRevision]];
  return v2;
}

- (id)description
{
  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWSInterfaceSource %I", self->_descriptor.ifindex);
  if (__ret)
  {
    v4 = [NSString stringWithCString:__ret encoding:4];
    free(__ret);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NWStatisticsInterfaceSource)initWithManager:(id)a3 interface:(int64_t)a4 threshold:(int64_t)a5
{
  unsigned int v6 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWStatisticsInterfaceSource;
  long long v9 = [(NWStatisticsSource *)&v22 initWithManager:v8 source:0 provider:6];
  if (v9)
  {
    long long v31 = 0u;
    uint64_t v32 = 6;
    int64_t v33 = a5;
    uint64_t v34 = v6;
    int v10 = [v8 addSource:v9 request:&v31 length:40];
    long long v11 = NStatGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        long long v12 = "Created";
      }
      else {
        long long v12 = "Failed to create";
      }
      *(_DWORD *)buf = 134218754;
      id v24 = v8;
      __int16 v25 = 2080;
      v26 = v12;
      __int16 v27 = 1024;
      unsigned int v28 = v6;
      __int16 v29 = 1024;
      int v30 = a5;
      _os_log_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_INFO, "Manager %p: %s source for interface index %d with threshold %d", buf, 0x22u);
    }

    if (([v8 mgrflags] & 0x80) != 0) {
      NStatMgrTraceF(v8, "%s Manager %p: %s source for interface %I index %d with threshold %d", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsInterfaceSource initWithManager:interface:threshold:]");
    }
    if (v10) {
      long long v19 = v9;
    }
    else {
      long long v19 = 0;
    }
    long long v20 = v19;
  }
  else
  {
    long long v20 = 0;
  }

  return v20;
}

@end