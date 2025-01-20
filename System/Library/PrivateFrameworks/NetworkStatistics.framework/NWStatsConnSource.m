@interface NWStatsConnSource
- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4;
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NSUUID)euuid;
- (NWStatsConnSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (id)description;
- (int)epid;
- (void)deriveAttribution:(id)a3;
- (void)populateConnProperties:(id)a3 fromDomainInfo:(nstat_domain_info *)a4;
- (void)setEpid:(int)a3;
- (void)setEuuid:(id)a3;
- (void)significantMetadataChange:(nstat_connection_descriptor *)a3 monitor:(id)a4;
@end

@implementation NWStatsConnSource

- (NWStatsConnSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NWStatsConnSource;
  v9 = [(NWStatsConnSource *)&v13 init];
  v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatConnUpdate, a3, sizeof(v9->_nstatConnUpdate));
    [(NWStatsSource *)v10 setFlowFlags:[(NWStatsSource *)v10 flagsForProvider:v10->_nstatConnUpdate.provider]];
    [(NWStatsConnSource *)v10 deriveAttribution:v8];
    uint64_t v11 = [v8 currentForegroundStateForProcessWithPid:v10->_nstatConnUpdate.conn_desc.epid];
    [(NWStatsSource *)v10 setStartAppStateIsForeground:v11];
    [(NWStatsSource *)v10 setUpdateAppStateIsForeground:v11];
    if (a3->hdr.hdr.type == 10007) {
      [(NWStatsConnSource *)v10 processExtendedUpdate:&a3->var0.conn + 1 length:a4 - 352];
    }
  }

  return v10;
}

- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4
{
  v4 = self;
  uint64_t v26 = *MEMORY[0x263EF8340];
  LOBYTE(self) = 1;
  if ((unint64_t)a4 >= 8)
  {
    v5 = a3;
    if (a3)
    {
      while (1)
      {
        uint64_t var0 = v5->var0;
        int64_t v7 = a4 - 8;
        if (a4 - 8 >= (unint64_t)v5->var1) {
          unint64_t var1 = v5->var1;
        }
        else {
          unint64_t var1 = a4 - 8;
        }
        if (var0 == 4 || var0 == 1)
        {
          if (var1 <= 0x41F) {
            -[NWStatsConnSource processExtendedUpdate:length:]();
          }
          LODWORD(self) = [(NWStatsSource *)v4 handleDomainUpdate:&v5[1]];
          if (!self) {
            return (char)self;
          }
          v10 = objc_alloc_init(NWStatsConnProperties);
          [(NWStatsConnSource *)v4 populateConnProperties:v10 fromDomainInfo:&v5[1]];
          if (var0 == 1) {
            uint64_t v11 = &OBJC_IVAR___NWStatsConnSource__currentProperties;
          }
          else {
            uint64_t v11 = &OBJC_IVAR___NWStatsConnSource__ancestralProperties;
          }
          uint64_t v12 = *v11;
          objc_super v13 = *(Class *)((char *)&v4->super.super.isa + v12);
          *(Class *)((char *)&v4->super.super.isa + v12) = (Class)v10;
        }
        else
        {
          v14 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5[1] length:var1];
          v15 = NStatGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            int v21 = var0;
            __int16 v22 = 2048;
            unint64_t v23 = var1;
            __int16 v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_21C4BC000, v15, OS_LOG_TYPE_ERROR, "NWStatsConn Unexpected extended item type: %d, length: %zd contents %@", buf, 0x1Cu);
          }

          BOOL v17 = [(NWStatsSource *)v4 handleUnknownExtension:var0 data:v14];
          if (!v17)
          {
            LOBYTE(self) = 0;
            return (char)self;
          }
        }
        uint64_t v18 = (var1 + 7) & 0x1FFFFFFF8;
        a4 = v7 - v18;
        v5 = (nstat_msg_src_extended_item_hdr *)((char *)v5 + v18 + 8);
        if ((unint64_t)(v7 - v18) <= 7)
        {
          LOBYTE(self) = 1;
          return (char)self;
        }
      }
    }
  }
  return (char)self;
}

- (void)populateConnProperties:(id)a3 fromDomainInfo:(nstat_domain_info *)a4
{
  id v10 = a3;
  [v10 setIsSilent:a4->var7];
  [v10 setIsTracker:a4->var5];
  [v10 setIsNonAppInitiated:a4->var6];
  if (([v10 isSilent] & 1) == 0)
  {
    if (a4->var0[0])
    {
      v5 = (void *)[[NSString alloc] initWithUTF8String:a4];
      [v10 setDomainName:v5];
    }
    else
    {
      [v10 setDomainName:0];
    }
    if (a4->var1[0])
    {
      v6 = (void *)[[NSString alloc] initWithUTF8String:a4->var1];
      [v10 setDomainOwner:v6];
    }
    else
    {
      [v10 setDomainOwner:0];
    }
    if (a4->var2[0])
    {
      int64_t v7 = (void *)[[NSString alloc] initWithUTF8String:a4->var2];
      [v10 setDomainTrackerContext:v7];
    }
    else
    {
      [v10 setDomainTrackerContext:0];
    }
    if (a4->var3[0])
    {
      id v8 = (void *)[[NSString alloc] initWithUTF8String:a4->var3];
      [v10 setDomainAttributedBundleId:v8];
    }
    else
    {
      [v10 setDomainAttributedBundleId:0];
    }
    if (a4->var4.var0.sin_len)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&a4->var4 length:a4->var4.var0.sin_len];
      [v10 setRemoteAddress:v9];
    }
    else
    {
      [v10 setRemoteAddress:0];
    }
  }
}

- (void)deriveAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:self->_nstatConnUpdate.conn_desc.start_timestamp];
  -[NWStatsSource setCreationTimestamp:](self, "setCreationTimestamp:");
  v5 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatConnUpdate.conn_desc.uuid];
  v6 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatConnUpdate.conn_desc.euuid];
  int64_t v7 = [v4 bestIdentifierForUUID:v5 EUUID:v6 pid:self->_nstatConnUpdate.conn_desc.pid epid:self->_nstatConnUpdate.conn_desc.epid procname:self->_nstatConnUpdate.conn_desc.pname derivation:(char *)&v13 + 4];
  [(NWStatsSource *)self setAttributedEntity:v7];
  [(NWStatsSource *)self setAttributionReason:HIDWORD(v13)];
  if (HIDWORD(v13) == 2)
  {
    id v8 = [v4 extensionNameForUUID:v6];
    [(NWStatsSource *)self setAttributedExtension:v8];
  }
  if (*(void *)self->_nstatConnUpdate.conn_desc.uuid != *(void *)self->_nstatConnUpdate.conn_desc.euuid
    || *(void *)&self->_nstatConnUpdate.conn_desc.uuid[8] != *(void *)&self->_nstatConnUpdate.conn_desc.euuid[8])
  {
    id v10 = [v4 bestIdentifierForUUID:v5 EUUID:0 pid:self->_nstatConnUpdate.conn_desc.pid epid:0 procname:self->_nstatConnUpdate.conn_desc.pname derivation:&v13];
    [(NWStatsSource *)self setDelegateName:v10];
  }
  [(NWStatsSource *)self setDelegateAttributionReason:HIDWORD(v13)];
  if ([v4 debugMode])
  {
    uint64_t v11 = [v4 allIdentifiersForUUID:v5 EUUID:v6 pid:self->_nstatConnUpdate.conn_desc.pid epid:self->_nstatConnUpdate.conn_desc.epid procname:self->_nstatConnUpdate.conn_desc.pname];
    lookupResults = self->_lookupResults;
    self->_lookupResults = v11;
  }
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int64_t v7 = [NWStatsConnSnapshot alloc];
  [(NWStatsSource *)self creationTimestamp];
  v9 = [(NWStatsConnSnapshot *)v7 initWithConnUpdate:&self->_nstatConnUpdate startTime:[(NWStatsSource *)self flowFlags] flowFlags:v8];
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] & 0xFFC00FFFLL];
  [(NWStatsSource *)self saveOldValues:&self->_nstatConnUpdate.counts];
  [(NWStatsSnapshot *)v9 setSnapshotReason:v5];
  [(NWStatsSnapshot *)v9 setFirstOccurrence:v4];
  id v10 = [(NWStatsSource *)self attributedEntity];
  uint64_t v11 = [(NWStatsSource *)self attributionReason];
  uint64_t v12 = [(NWStatsSource *)self delegateName];
  uint64_t v13 = [(NWStatsSource *)self delegateAttributionReason];
  v14 = [(NWStatsSource *)self attributedExtension];
  [(NWStatsSnapshot *)v9 setAttribution:v10 derivation:v11 delegateName:v12 delegateDerivation:v13 extensionName:v14];

  v15 = [(NWStatsSource *)self domainName];
  v16 = [(NWStatsSource *)self domainOwner];
  BOOL v17 = [(NWStatsSource *)self domainTrackerContext];
  uint64_t v18 = [(NWStatsSource *)self domainAttributedBundleId];
  BOOL v19 = [(NWStatsSource *)self isTracker];
  v20 = [(NWStatsSource *)self attributedEntity];
  BOOL v21 = [(NWStatsSource *)self bundleNameImpliesNonAppInitiated:v20]
     || [(NWStatsSource *)self isNonAppInitiated];
  LOBYTE(v30) = [(NWStatsSource *)self isSilent];
  [(NWStatsSnapshot *)v9 setDomainName:v15 owner:v16 context:v17 attributedBundleId:v18 isTracker:v19 isNonAppInitiated:v21 isSilent:v30];

  [(NWStatsSnapshot *)v9 setAppStateIsForeground:[(NWStatsSource *)self updateAppStateIsForeground] screenStateOn:[(NWStatsSource *)self updateScreenStateOn] startAppStateIsForeground:[(NWStatsSource *)self startAppStateIsForeground] startScreenStateOn:[(NWStatsSource *)self startScreenStateOn]];
  if (self->_lookupResults)
  {
    __int16 v22 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_lookupResults];
    [(NWStatsSnapshot *)v9 setLookupResults:v22];
  }
  unint64_t v23 = [(NWStatsSource *)self extensions];

  if (v23)
  {
    id v24 = objc_alloc(NSDictionary);
    v25 = [(NWStatsSource *)self extensions];
    uint64_t v26 = (void *)[v24 initWithDictionary:v25];
    [(NWStatsSnapshot *)v9 setExtensions:v26];
  }
  [(NWStatsConnSnapshot *)v9 setCurrentProperties:self->_currentProperties];
  [(NWStatsConnSnapshot *)v9 setAncestralProperties:self->_ancestralProperties];
  currentProperties = self->_currentProperties;
  self->_currentProperties = 0;

  ancestralProperties = self->_ancestralProperties;
  self->_ancestralProperties = 0;

  return v9;
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  unsigned int type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatConnUpdate, 0xC8uLL))
  {
    BOOL v10 = 0;
  }
  else
  {
    if (a3->var0.route.dst.v6.sin6_addr.__u6_addr32[0] != self->_nstatConnUpdate.conn_desc.pid
      || a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1] != self->_nstatConnUpdate.conn_desc.epid
      || uuid_compare(a3->var0.conn.uuid, self->_nstatConnUpdate.conn_desc.uuid)
      || uuid_compare(&a3->var0.tcp.local.v4.sin_len, self->_nstatConnUpdate.conn_desc.euuid))
    {
      [(NWStatsConnSource *)self significantMetadataChange:&a3->var0 monitor:v8];
    }
    [(NWStatsSource *)self saveOldValues:&self->_nstatConnUpdate.counts];
    memcpy(&self->_nstatConnUpdate, a3, sizeof(self->_nstatConnUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:](self, "setUpdateAppStateIsForeground:", [v8 currentForegroundStateForProcessWithPid:a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1]]);
    BOOL v10 = type != 10007
       || [(NWStatsConnSource *)self processExtendedUpdate:&a3->var0.conn + 1 length:a4 - 352];
  }

  return v10;
}

- (id)description
{
  p_nstatConnUpdate = &self->_nstatConnUpdate;
  id v4 = [NSString alloc];
  pname = p_nstatConnUpdate->conn_desc.pname;
  v6 = [(NWStatsSource *)self attributedEntity];
  uint64_t pid = p_nstatConnUpdate->conn_desc.pid;
  euint64_t pid = p_nstatConnUpdate->conn_desc.epid;
  v9 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatConnUpdate->conn_desc.uuid];
  BOOL v10 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatConnUpdate->conn_desc.euuid];
  uint64_t v11 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatConnUpdate->conn_desc.fuuid];
  [(NWStatsSource *)self creationTimestamp];
  uint64_t v13 = dateStringMillisecondsFromReferenceInterval(v12);
  v14 = (void *)[v4 initWithFormat:@"NWStatsConnSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@", pname, v6, pid, epid, v9, v10, v11, v13];

  return v14;
}

- (void)significantMetadataChange:(nstat_connection_descriptor *)a3 monitor:(id)a4
{
  id v13 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v12 = v6;
  if (a3->pid == self->_nstatConnUpdate.conn_desc.pid)
  {
    int v7 = 0;
  }
  else
  {
    id v8 = v6;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v8 setObject:v9 forKeyedSubscript:@"newPid"];

    int v7 = 0x8000;
  }
  if (a3->epid == self->_nstatConnUpdate.conn_desc.epid) {
    int v10 = v7;
  }
  else {
    int v10 = v7 | 0x10000;
  }
  if (uuid_compare(a3->uuid, self->_nstatConnUpdate.conn_desc.uuid)) {
    v10 |= 0x1000u;
  }
  if (uuid_compare(a3->euuid, self->_nstatConnUpdate.conn_desc.euuid))
  {
    if (uuid_compare(self->_nstatConnUpdate.conn_desc.uuid, self->_nstatConnUpdate.conn_desc.euuid)) {
      v10 |= 0x2000u;
    }
    else {
      v10 |= 0x4000u;
    }
  }
  if (memcmp(a3->pname, self->_nstatConnUpdate.conn_desc.pname, 0x40uLL)) {
    v10 |= 0x200000u;
  }
  if ((v10 & 0xFFFFF000) != 0)
  {
    LODWORD(v11) = a3->epid;
    -[NWStatsSource logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:](self, "logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:", self->_nstatConnUpdate.srcref, self->_nstatConnUpdate.conn_desc.pname, a3->pname, self->_nstatConnUpdate.conn_desc.pid, a3->pid, self->_nstatConnUpdate.conn_desc.epid, v11, self->_nstatConnUpdate.conn_desc.uuid, a3->uuid, self->_nstatConnUpdate.conn_desc.euuid, a3->euuid, v13, v12);
    [(NWStatsConnSource *)self deriveAttribution:v13];
  }
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] | v10];
}

- (int)epid
{
  return self->_epid;
}

- (void)setEpid:(int)a3
{
  self->_euint64_t pid = a3;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setEuuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_ancestralProperties, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_lookupResults, 0);
}

- (void)processExtendedUpdate:length:.cold.1()
{
  __assert_rtn("-[NWStatsConnSource processExtendedUpdate:length:]", "NWStatsSource.m", 1286, "itemLength >= sizeof(nstat_domain_info)");
}

@end