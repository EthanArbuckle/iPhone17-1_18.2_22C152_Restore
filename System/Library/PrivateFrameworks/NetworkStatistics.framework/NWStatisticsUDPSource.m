@interface NWStatisticsUDPSource
- (NWStatisticsUDPSource)initWithManager:(id)a3 local:(const sockaddr *)a4 remote:(const sockaddr *)a5;
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
@end

@implementation NWStatisticsUDPSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0x118) {
    return 1;
  }
  if (self->_eventFlags != a5)
  {
    self->_eventFlags = a5;
    p_descriptor = &self->_descriptor;
    goto LABEL_7;
  }
  if (memcmp(&self->_descriptor, a3, 0x118uLL))
  {
    p_descriptor = &self->_descriptor;
LABEL_7:
    memcpy(p_descriptor, a3, sizeof(nstat_udp_descriptor));
    return 3;
  }
  v9 = [(NWStatisticsSource *)self manager];
  char v10 = [v9 mgrflags];

  if ((v10 & 4) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)_currentSnapshot
{
  v2 = [[NWSUDPSnapshot alloc] initWithCounts:[(NWStatisticsSource *)self _nstat_counts] UDPDescriptor:&self->_descriptor sourceIdent:[(NWStatisticsSource *)self reference] events:self->_eventFlags seqno:[(NWStatisticsSource *)self snapshotRevision] provider:[(NWStatisticsSource *)self provider]];
  return v2;
}

- (id)description
{
  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWSUDPSource %N<->%N@%I", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex);
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

- (NWStatisticsUDPSource)initWithManager:(id)a3 local:(const sockaddr *)a4 remote:(const sockaddr *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWStatisticsUDPSource;
  v9 = [(NWStatisticsSource *)&v24 initWithManager:v8 source:0 provider:4];
  if (!v9) {
    goto LABEL_5;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  LODWORD(v38) = 4;
  if (a4->sa_len > 0x1CuLL) {
    goto LABEL_5;
  }
  __memcpy_chk();
  if (a5)
  {
    if (a5->sa_len > 0x1CuLL)
    {
LABEL_5:
      char v10 = 0;
      goto LABEL_22;
    }
    __memcpy_chk();
  }
  else
  {
    BYTE5(v40) = a4->sa_family;
    BYTE4(v40) = BYTE5(v40);
  }
  int v11 = [v8 addSource:v9 request:&v37 length:80];
  v12 = NStatGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v11) {
      v13 = "Created";
    }
    else {
      v13 = "Failed to create";
    }
    int sa_len = a4->sa_len;
    if (a5) {
      int v15 = a5->sa_len;
    }
    else {
      int v15 = 0;
    }
    *(_DWORD *)buf = 134219266;
    id v26 = v8;
    __int16 v27 = 2080;
    v28 = v13;
    __int16 v29 = 1040;
    int v30 = sa_len;
    __int16 v31 = 2096;
    v32 = a4;
    __int16 v33 = 1040;
    int v34 = v15;
    __int16 v35 = 2096;
    v36 = a5;
    _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_INFO, "Manager %p: %s UDP source for local address %{network:sockaddr}.*P, remote address %{network:sockaddr}.*P", buf, 0x36u);
  }

  if (([v8 mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(v8, "%s Manager %p: %s UDP source for local address %N, remote address %N", v16, v17, v18, v19, v20, v21, (char)"-[NWStatisticsUDPSource initWithManager:local:remote:]");
  }
  if (v11) {
    v22 = v9;
  }
  else {
    v22 = 0;
  }
  char v10 = v22;
LABEL_22:

  return v10;
}

@end