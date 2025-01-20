@interface NWStatsTCPSource
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NWStatsTCPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (id)description;
- (void)deriveAttribution:(id)a3;
- (void)significantMetadataChange:(nstat_tcp_descriptor *)a3 monitor:(id)a4;
@end

@implementation NWStatsTCPSource

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = [NWStatsTCPSnapshot alloc];
  [(NWStatsSource *)self creationTimestamp];
  v9 = [(NWStatsTCPSnapshot *)v7 initWithUpdate:&self->_nstatTCPUpdate startTime:[(NWStatsSource *)self flowFlags] flowFlags:[(NWStatsSource *)self prevItemsPtr] previously:&self->_nstatBluetoothCounts bluetoothCounts:0 peerEgressCellularCounts:v8];
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] & 0xFFC00FFFLL];
  [(NWStatsSource *)self saveOldValues:&self->_nstatTCPUpdate.counts];
  [(NWStatsSource *)self saveOldBTCounts:&self->_nstatBluetoothCounts];
  [(NWStatsSnapshot *)v9 setSnapshotReason:v5];
  [(NWStatsSnapshot *)v9 setFirstOccurrence:v4];
  v10 = [(NWStatsSource *)self attributedEntity];
  uint64_t v11 = [(NWStatsSource *)self attributionReason];
  v12 = [(NWStatsSource *)self delegateName];
  uint64_t v13 = [(NWStatsSource *)self delegateAttributionReason];
  v14 = [(NWStatsSource *)self attributedExtension];
  [(NWStatsSnapshot *)v9 setAttribution:v10 derivation:v11 delegateName:v12 delegateDerivation:v13 extensionName:v14];

  v15 = [(NWStatsSource *)self domainName];
  v16 = [(NWStatsSource *)self domainOwner];
  v17 = [(NWStatsSource *)self domainTrackerContext];
  v18 = [(NWStatsSource *)self domainAttributedBundleId];
  BOOL v19 = [(NWStatsSource *)self isTracker];
  v20 = [(NWStatsSource *)self attributedEntity];
  BOOL v21 = [(NWStatsSource *)self bundleNameImpliesNonAppInitiated:v20]
     || [(NWStatsSource *)self isNonAppInitiated];
  LOBYTE(v28) = [(NWStatsSource *)self isSilent];
  [(NWStatsProtocolSnapshot *)v9 setDomainName:v15 owner:v16 context:v17 attributedBundleId:v18 isTracker:v19 isNonAppInitiated:v21 isSilent:v28];

  [(NWStatsProtocolSnapshot *)v9 setAppStateIsForeground:[(NWStatsSource *)self updateAppStateIsForeground] screenStateOn:[(NWStatsSource *)self updateScreenStateOn] startAppStateIsForeground:[(NWStatsSource *)self startAppStateIsForeground] startScreenStateOn:[(NWStatsSource *)self startScreenStateOn]];
  if (self->_lookupResults)
  {
    v22 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_lookupResults];
    [(NWStatsSnapshot *)v9 setLookupResults:v22];
  }
  v23 = [(NWStatsSource *)self extensions];

  if (v23)
  {
    id v24 = objc_alloc(NSDictionary);
    v25 = [(NWStatsSource *)self extensions];
    v26 = (void *)[v24 initWithDictionary:v25];
    [(NWStatsSnapshot *)v9 setExtensions:v26];
  }
  [(NWStatsProtocolSnapshot *)v9 runConsistencyChecks];
  return v9;
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  unsigned int type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatTCPUpdate, 0x158uLL))
  {
    BOOL v16 = 0;
  }
  else
  {
    if (a3->var0.tcp.pid != self->_nstatTCPUpdate.tcp_desc.pid
      || a3->var0.tcp.epid != self->_nstatTCPUpdate.tcp_desc.epid
      || uuid_compare(a3->var0.tcp.uuid, self->_nstatTCPUpdate.tcp_desc.uuid)
      || uuid_compare(a3->var0.tcp.euuid, self->_nstatTCPUpdate.tcp_desc.euuid)
      || (*(void *)a3->var0.conn.euuid == *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
        ? (BOOL v10 = *(void *)&a3->var0.conn.euuid[8] == *(void *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8)
        : (BOOL v10 = 0),
          v10
        ? (BOOL v11 = *(void *)a3->var0.conn.cuuid == *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2])
        : (BOOL v11 = 0),
          v11
        ? (BOOL v12 = a3->var0.tcp.local.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
        : (BOOL v12 = 0),
          !v12
       || (*(void *)&a3->var0.conn.cuuid[12] == *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
         ? (BOOL v13 = *(void *)&a3->var0.conn.puuid[4] == *(void *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8)
         : (BOOL v13 = 0),
           v13
         ? (BOOL v14 = *(void *)&a3->var0.conn.puuid[12] == *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2])
         : (BOOL v14 = 0),
           v14
         ? (BOOL v15 = a3->var0.tcp.remote.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
         : (BOOL v15 = 0),
           !v15)))
    {
      [(NWStatsTCPSource *)self significantMetadataChange:&a3->var0 monitor:v8];
    }
    [(NWStatsSource *)self saveOldValues:&self->_nstatTCPUpdate.counts];
    memcpy(&self->_nstatTCPUpdate, a3, sizeof(self->_nstatTCPUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:](self, "setUpdateAppStateIsForeground:", [v8 currentForegroundStateForProcessWithPid:a3->var0.tcp.epid]);
    if (type == 10007)
    {
      [(NWStatsSource *)self saveOldBTCounts:&self->_nstatBluetoothCounts];
      BOOL v16 = [(NWStatsSource *)self processExtendedUpdate:&a3[1] length:a4 - 496 bluetoothCounts:&self->_nstatBluetoothCounts];
    }
    else
    {
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (NWStatsTCPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NWStatsTCPSource;
  v9 = [(NWStatsTCPSource *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatTCPUpdate, a3, sizeof(v9->_nstatTCPUpdate));
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:v10->_nstatTCPUpdate.tcp_desc.start_timestamp];
    -[NWStatsSource setCreationTimestamp:](v10, "setCreationTimestamp:");
    [(NWStatsSource *)v10 setFlowFlags:[(NWStatsSource *)v10 flagsForProvider:v10->_nstatTCPUpdate.provider sockaddr:&v10->_nstatTCPUpdate.tcp_desc.remote]];
    [(NWStatsTCPSource *)v10 deriveAttribution:v8];
    uint64_t v11 = [v8 currentForegroundStateForProcessWithPid:v10->_nstatTCPUpdate.tcp_desc.epid];
    [(NWStatsSource *)v10 setStartAppStateIsForeground:v11];
    [(NWStatsSource *)v10 setUpdateAppStateIsForeground:v11];
    if (a3->hdr.hdr.type == 10007) {
      [(NWStatsSource *)v10 processExtendedUpdate:&a3[1] length:a4 - 496 bluetoothCounts:&v10->_nstatBluetoothCounts];
    }
  }

  return v10;
}

- (void)deriveAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v5 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatTCPUpdate.tcp_desc.uuid];
  v6 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatTCPUpdate.tcp_desc.euuid];
  v7 = [v4 bestIdentifierForUUID:v5 EUUID:v6 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:self->_nstatTCPUpdate.tcp_desc.epid procname:self->_nstatTCPUpdate.tcp_desc.pname derivation:(char *)&v14 + 4];
  [(NWStatsSource *)self setAttributedEntity:v7];
  [(NWStatsSource *)self setAttributionReason:HIDWORD(v14)];
  if (HIDWORD(v14) == 2)
  {
    id v8 = [v4 extensionNameForUUID:v6];
    [(NWStatsSource *)self setAttributedExtension:v8];
  }
  if (*(void *)self->_nstatTCPUpdate.tcp_desc.uuid == *(void *)self->_nstatTCPUpdate.tcp_desc.euuid
    && *(void *)&self->_nstatTCPUpdate.tcp_desc.uuid[8] == *(void *)&self->_nstatTCPUpdate.tcp_desc.euuid[8])
  {
    uint64_t v11 = 0;
  }
  else
  {
    BOOL v10 = [v4 bestIdentifierForUUID:v5 EUUID:0 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:0 procname:self->_nstatTCPUpdate.tcp_desc.pname derivation:&v14];
    [(NWStatsSource *)self setDelegateName:v10];

    uint64_t v11 = v14;
  }
  [(NWStatsSource *)self setDelegateAttributionReason:v11];
  if ([v4 debugMode])
  {
    BOOL v12 = [v4 allIdentifiersForUUID:v5 EUUID:v6 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:self->_nstatTCPUpdate.tcp_desc.epid procname:self->_nstatTCPUpdate.tcp_desc.pname];
    lookupResults = self->_lookupResults;
    self->_lookupResults = v12;
  }
}

- (void).cxx_destruct
{
}

- (id)description
{
  p_nstatTCPUpdate = &self->_nstatTCPUpdate;
  id v4 = [NSString alloc];
  pname = p_nstatTCPUpdate->tcp_desc.pname;
  v6 = [(NWStatsSource *)self attributedEntity];
  uint64_t pid = p_nstatTCPUpdate->tcp_desc.pid;
  euint64_t pid = p_nstatTCPUpdate->tcp_desc.epid;
  v9 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatTCPUpdate->tcp_desc.uuid];
  BOOL v10 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatTCPUpdate->tcp_desc.euuid];
  uint64_t v11 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatTCPUpdate->tcp_desc.fuuid];
  [(NWStatsSource *)self creationTimestamp];
  objc_super v13 = dateStringMillisecondsFromReferenceInterval(v12);
  uint64_t v14 = (void *)[v4 initWithFormat:@"NWStatsTCPSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@", pname, v6, pid, epid, v9, v10, v11, v13];

  return v14;
}

- (void)significantMetadataChange:(nstat_tcp_descriptor *)a3 monitor:(id)a4
{
  id v26 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v25 = v6;
  if (a3->pid == self->_nstatTCPUpdate.tcp_desc.pid)
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
  if (a3->epid == self->_nstatTCPUpdate.tcp_desc.epid) {
    int v10 = v7;
  }
  else {
    int v10 = v7 | 0x10000;
  }
  if (uuid_compare(a3->uuid, self->_nstatTCPUpdate.tcp_desc.uuid)) {
    v10 |= 0x1000u;
  }
  if (uuid_compare(a3->euuid, self->_nstatTCPUpdate.tcp_desc.euuid))
  {
    if (uuid_compare(self->_nstatTCPUpdate.tcp_desc.uuid, self->_nstatTCPUpdate.tcp_desc.euuid)) {
      v10 |= 0x2000u;
    }
    else {
      v10 |= 0x4000u;
    }
  }
  if (!memcmp(a3->pname, self->_nstatTCPUpdate.tcp_desc.pname, 0x40uLL)) {
    int v11 = v10;
  }
  else {
    int v11 = v10 | 0x200000;
  }
  if (*(void *)&a3->local.v4.sin_len != *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
    || *(void *)a3->local.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->local.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2]
    || a3->local.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
  {
    BOOL HavePortDiffOnly = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.local, (uint64_t)&a3->local);
    if (HavePortDiffOnly) {
      int v16 = 0x80000;
    }
    else {
      int v16 = 0x20000;
    }
    if (HavePortDiffOnly) {
      v17 = @"TCP local port";
    }
    else {
      v17 = @"TCP local address";
    }
    v11 |= v16;
    [(NWStatsSource *)self logAddressChangeOn:self->_nstatTCPUpdate.srcref procName:a3->pname variant:v17 oldAddress:&self->_nstatTCPUpdate.tcp_desc.local newAddress:&a3->local];
  }
  if (*(void *)&a3->remote.v4.sin_len != *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
    || *(void *)a3->remote.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->remote.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2]
    || a3->remote.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
  {
    BOOL v21 = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.remote, (uint64_t)&a3->remote);
    if (v21) {
      int v22 = 0x100000;
    }
    else {
      int v22 = 0x40000;
    }
    if (v21) {
      v23 = @"TCP remote port";
    }
    else {
      v23 = @"TCP remote address";
    }
    v11 |= v22;
    [(NWStatsSource *)self logAddressChangeOn:self->_nstatTCPUpdate.srcref procName:a3->pname variant:v23 oldAddress:&self->_nstatTCPUpdate.tcp_desc.remote newAddress:&a3->remote];
  }
  if ((v11 & 0x21F000) != 0)
  {
    LODWORD(v24) = a3->epid;
    [(NWStatsSource *)self logAttributionChangeOn:self->_nstatTCPUpdate.srcref oldProcName:self->_nstatTCPUpdate.tcp_desc.pname newProcName:a3->pname oldPid:self->_nstatTCPUpdate.tcp_desc.pid newPid:a3->pid oldEPid:self->_nstatTCPUpdate.tcp_desc.epid newEPid:v24 oldUUID:self->_nstatTCPUpdate.tcp_desc.uuid newUUID:a3->uuid oldEUUID:self->_nstatTCPUpdate.tcp_desc.euuid newEUUID:a3->euuid monitor:v26];
    [(NWStatsTCPSource *)self deriveAttribution:v26];
  }
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] | v11];
}

@end