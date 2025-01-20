@interface NWStatisticsRouteSource
- (NSData)destination;
- (NWStatisticsRouteSource)initWithManager:(id)a3 destination:(const sockaddr *)a4 mask:(const sockaddr *)a5 interface:(unsigned int)a6;
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
- (void)setDestination:(id)a3;
@end

@implementation NWStatisticsRouteSource

- (id)_currentSnapshot
{
  v2 = [[NWSRouteSnapshot alloc] initWithCounts:[(NWStatisticsSource *)self _nstat_counts] routeDescriptor:&self->_descriptor sourceIdent:[(NWStatisticsSource *)self reference] seqno:[(NWStatisticsSource *)self snapshotRevision]];
  return v2;
}

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0x78) {
    return 1;
  }
  p_descriptor = &self->_descriptor;
  if (!memcmp(&self->_descriptor, a3, 0x78uLL))
  {
    v15 = [(NWStatisticsSource *)self manager];
    char v16 = [v15 mgrflags];

    if ((v16 & 4) != 0) {
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
    sockaddr v11 = (sockaddr)*((_OWORD *)a3 + 3);
    *(_OWORD *)&p_descriptor->dst.sa.sa_data[6] = *((_OWORD *)a3 + 2);
    *(sockaddr *)((char *)&p_descriptor->dst.sa + 24) = v11;
    *(_OWORD *)&p_descriptor->id = v9;
    *(_OWORD *)&p_descriptor->gateway_id = v10;
    long long v12 = *((_OWORD *)a3 + 4);
    sockaddr_in v13 = (sockaddr_in)*((_OWORD *)a3 + 5);
    long long v14 = *((_OWORD *)a3 + 6);
    *(void *)&p_descriptor->flags = *((void *)a3 + 14);
    p_descriptor->gateway.v4 = v13;
    *((_OWORD *)&p_descriptor->gateway.sa + 1) = v14;
    *(_OWORD *)&p_descriptor->mask.sa.sa_data[10] = v12;
    return 3;
  }
}

- (id)description
{
  __ret = 0;
  p_descriptor = &self->_descriptor;
  if ((self->_descriptor.flags & 4) != 0)
  {
    v6 = (_printf_domain *)printf_domain();
    v7 = "Scoped ";
    if ((p_descriptor->flags & 0x1000000) == 0) {
      v7 = "";
    }
    asxprintf(&__ret, v6, 0, "NWSRouteSource %s%N->%I->%N", v7, &p_descriptor->dst, p_descriptor->ifindex, &p_descriptor->gateway);
  }
  else
  {
    uint64_t v3 = maskLeadingBitsCount(&self->_descriptor.mask.v4.sin_len);
    v4 = (_printf_domain *)printf_domain();
    if ((p_descriptor->flags & 0x1000000) != 0) {
      v5 = "Scoped ";
    }
    else {
      v5 = "";
    }
    if (v3) {
      asxprintf(&__ret, v4, 0, "NWSRouteSource %s%N/%d->%I->%N", v5, &p_descriptor->dst, v3, p_descriptor->ifindex, &p_descriptor->gateway);
    }
    else {
      asxprintf(&__ret, v4, 0, "NWSRouteSource %sDefault->%I->%N", v5, p_descriptor->ifindex, &p_descriptor->gateway);
    }
  }
  if (__ret)
  {
    v8 = [NSString stringWithCString:__ret encoding:4];
    free(__ret);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NWStatisticsRouteSource)initWithManager:(id)a3 destination:(const sockaddr *)a4 mask:(const sockaddr *)a5 interface:(unsigned int)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NWStatisticsRouteSource;
  sockaddr v11 = [(NWStatisticsSource *)&v29 initWithManager:v10 source:0 provider:1];
  if (!v11) {
    goto LABEL_5;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  LODWORD(v47) = 1;
  if (a4->sa_len > 0x1CuLL) {
    goto LABEL_5;
  }
  __memcpy_chk();
  if (a5)
  {
    if (a5->sa_len > 0x1CuLL)
    {
LABEL_5:
      long long v12 = 0;
      goto LABEL_26;
    }
    __memcpy_chk();
  }
  unsigned int v51 = a6;
  int v13 = [v10 addSource:v11 request:&v46 length:84];
  long long v14 = NStatGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v13) {
      v15 = "Created";
    }
    else {
      v15 = "Failed to create";
    }
    int sa_family = a4->sa_family;
    v17 = "Unknown-protocol";
    if (sa_family == 30) {
      v17 = "IPv6";
    }
    if (sa_family == 2) {
      v18 = "IPv4";
    }
    else {
      v18 = v17;
    }
    int sa_len = a4->sa_len;
    if (a5) {
      int v20 = a5->sa_len;
    }
    else {
      int v20 = 0;
    }
    *(_DWORD *)buf = 134219778;
    id v31 = v10;
    __int16 v32 = 2080;
    v33 = v15;
    __int16 v34 = 2080;
    v35 = v18;
    __int16 v36 = 1040;
    int v37 = sa_len;
    __int16 v38 = 2096;
    v39 = a4;
    __int16 v40 = 1024;
    unsigned int v41 = a6;
    __int16 v42 = 1040;
    int v43 = v20;
    __int16 v44 = 2096;
    v45 = a5;
    _os_log_impl(&dword_21C4BC000, v14, OS_LOG_TYPE_INFO, "Manager %p: %s %s route source to %{network:sockaddr}.*P  interface index %d, mask  %{network:sockaddr}.*P", buf, 0x46u);
  }

  if (([v10 mgrflags] & 0x80) != 0) {
    NStatMgrTraceF(v10, "%s Manager %p: %s %s route source to %N on interface %I index %d, mask %N", v21, v22, v23, v24, v25, v26, (char)"-[NWStatisticsRouteSource initWithManager:destination:mask:interface:]");
  }
  if (v13) {
    v27 = v11;
  }
  else {
    v27 = 0;
  }
  long long v12 = v27;
LABEL_26:

  return v12;
}

- (NSData)destination
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end