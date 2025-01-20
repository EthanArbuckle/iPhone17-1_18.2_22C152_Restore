@interface NWStatsUDPSource
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NWStatsUDPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (id)description;
- (void)deriveAttribution:(id)a3;
- (void)significantMetadataChange:(nstat_udp_descriptor *)a3 monitor:(id)a4;
@end

@implementation NWStatsUDPSource

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = [NWStatsUDPSnapshot alloc];
  [(NWStatsSource *)self creationTimestamp];
  v9 = [(NWStatsUDPSnapshot *)v7 initWithUpdate:&self->_nstatUDPUpdate startTime:[(NWStatsSource *)self flowFlags] flowFlags:[(NWStatsSource *)self prevItemsPtr] previously:&self->_nstatBluetoothCounts bluetoothCounts:0 peerEgressCellularCounts:v8];
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] & 0xFFC00FFFLL];
  [(NWStatsSource *)self saveOldValues:&self->_nstatUDPUpdate.counts];
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

- (void)deriveAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:self->_nstatUDPUpdate.udp_desc.start_timestamp];
  -[NWStatsSource setCreationTimestamp:](self, "setCreationTimestamp:");
  uint64_t v5 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatUDPUpdate.udp_desc.uuid];
  v6 = [(NWStatsSource *)self _createNSUUIDForBytes:self->_nstatUDPUpdate.udp_desc.euuid];
  v7 = [v4 bestIdentifierForUUID:v5 EUUID:v6 pid:self->_nstatUDPUpdate.udp_desc.pid epid:self->_nstatUDPUpdate.udp_desc.epid procname:self->_nstatUDPUpdate.udp_desc.pname derivation:(char *)&v14 + 4];
  [(NWStatsSource *)self setAttributedEntity:v7];
  [(NWStatsSource *)self setAttributionReason:HIDWORD(v14)];
  if (HIDWORD(v14) == 2)
  {
    double v8 = [v4 extensionNameForUUID:v6];
    [(NWStatsSource *)self setAttributedExtension:v8];
  }
  if (*(void *)self->_nstatUDPUpdate.udp_desc.uuid == *(void *)self->_nstatUDPUpdate.udp_desc.euuid
    && *(void *)&self->_nstatUDPUpdate.udp_desc.uuid[8] == *(void *)&self->_nstatUDPUpdate.udp_desc.euuid[8])
  {
    uint64_t v11 = 0;
  }
  else
  {
    v10 = [v4 bestIdentifierForUUID:v5 EUUID:0 pid:self->_nstatUDPUpdate.udp_desc.pid epid:0 procname:self->_nstatUDPUpdate.udp_desc.pname derivation:&v14];
    [(NWStatsSource *)self setDelegateName:v10];

    uint64_t v11 = v14;
  }
  [(NWStatsSource *)self setDelegateAttributionReason:v11];
  if ([v4 debugMode])
  {
    v12 = [v4 allIdentifiersForUUID:v5 EUUID:v6 pid:self->_nstatUDPUpdate.udp_desc.pid epid:self->_nstatUDPUpdate.udp_desc.epid procname:self->_nstatUDPUpdate.udp_desc.pname];
    lookupResults = self->_lookupResults;
    self->_lookupResults = v12;
  }
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  unsigned int type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatUDPUpdate, 0x118uLL))
  {
    BOOL v16 = 0;
  }
  else
  {
    if (a3->var0.tcp.local.v4.sin_addr.s_addr != self->_nstatUDPUpdate.udp_desc.pid
      || a3->var0.udp.epid != self->_nstatUDPUpdate.udp_desc.epid
      || uuid_compare(a3->var0.udp.uuid, self->_nstatUDPUpdate.udp_desc.uuid)
      || uuid_compare(a3->var0.udp.euuid, self->_nstatUDPUpdate.udp_desc.euuid)
      || (a3->var0.tcp.activity_bitmap.bitmap[0] == *(void *)&self->_nstatUDPUpdate.udp_desc.local.v4.sin_len
        ? (BOOL v10 = a3->var0.tcp.activity_bitmap.bitmap[1] == *(void *)self->_nstatUDPUpdate.udp_desc.local.v6.sin6_addr.__u6_addr8)
        : (BOOL v10 = 0),
          v10
        ? (BOOL v11 = *(void *)&a3->var0.conn.pname[28] == *(void *)&self->_nstatUDPUpdate.udp_desc.local.v6.sin6_addr.__u6_addr32[2])
        : (BOOL v11 = 0),
          v11
        ? (BOOL v12 = a3->var0.tcp.sndbufsize == (unint64_t)self->_nstatUDPUpdate.udp_desc.local.v6.sin6_scope_id)
        : (BOOL v12 = 0),
          !v12
       || (*(void *)&a3->var0.conn.pname[40] == *(void *)&self->_nstatUDPUpdate.udp_desc.remote.v4.sin_len
         ? (BOOL v13 = *(void *)&a3->var0.conn.pname[48] == *(void *)self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_addr.__u6_addr8)
         : (BOOL v13 = 0),
           v13
         ? (BOOL v14 = *(void *)&a3->var0.conn.pname[56] == *(void *)&self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_addr.__u6_addr32[2])
         : (BOOL v14 = 0),
           v14
         ? (BOOL v15 = a3->var0.tcp.traffic_class == (unint64_t)self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_scope_id)
         : (BOOL v15 = 0),
           !v15)))
    {
      [(NWStatsUDPSource *)self significantMetadataChange:&a3->var0 monitor:v8];
    }
    [(NWStatsSource *)self saveOldValues:&self->_nstatUDPUpdate.counts];
    memcpy(&self->_nstatUDPUpdate, a3, sizeof(self->_nstatUDPUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:](self, "setUpdateAppStateIsForeground:", [v8 currentForegroundStateForProcessWithPid:a3->var0.udp.epid]);
    if (type == 10007)
    {
      [(NWStatsSource *)self saveOldBTCounts:&self->_nstatBluetoothCounts];
      BOOL v16 = [(NWStatsSource *)self processExtendedUpdate:(char *)&a3->var0.conn + 280 length:a4 - 432 bluetoothCounts:&self->_nstatBluetoothCounts];
    }
    else
    {
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (NWStatsUDPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NWStatsUDPSource;
  v9 = [(NWStatsUDPSource *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatUDPUpdate, a3, sizeof(v9->_nstatUDPUpdate));
    [(NWStatsSource *)v10 setFlowFlags:[(NWStatsSource *)v10 flagsForProvider:v10->_nstatUDPUpdate.provider sockaddr:&v10->_nstatUDPUpdate.udp_desc.remote]];
    [(NWStatsUDPSource *)v10 deriveAttribution:v8];
    uint64_t v11 = [v8 currentForegroundStateForProcessWithPid:v10->_nstatUDPUpdate.udp_desc.epid];
    [(NWStatsSource *)v10 setStartAppStateIsForeground:v11];
    [(NWStatsSource *)v10 setUpdateAppStateIsForeground:v11];
    if (a3->hdr.hdr.type == 10007) {
      [(NWStatsSource *)v10 processExtendedUpdate:(char *)&a3->var0.conn + 280 length:a4 - 432 bluetoothCounts:&v10->_nstatBluetoothCounts];
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (id)description
{
  p_nstatUDPUpdate = &self->_nstatUDPUpdate;
  id v4 = [NSString alloc];
  pname = p_nstatUDPUpdate->udp_desc.pname;
  v6 = [(NWStatsSource *)self attributedEntity];
  uint64_t pid = p_nstatUDPUpdate->udp_desc.pid;
  euint64_t pid = p_nstatUDPUpdate->udp_desc.epid;
  v9 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatUDPUpdate->udp_desc.uuid];
  BOOL v10 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatUDPUpdate->udp_desc.euuid];
  uint64_t v11 = [(NWStatsSource *)self _createNSUUIDForBytes:p_nstatUDPUpdate->udp_desc.fuuid];
  [(NWStatsSource *)self creationTimestamp];
  objc_super v13 = dateStringMillisecondsFromReferenceInterval(v12);
  BOOL v14 = (void *)[v4 initWithFormat:@"NWStatsUDPSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@", pname, v6, pid, epid, v9, v10, v11, v13];

  return v14;
}

- (void)significantMetadataChange:(nstat_udp_descriptor *)a3 monitor:(id)a4
{
  id v26 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v25 = v6;
  if (a3->pid == self->_nstatUDPUpdate.udp_desc.pid)
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
  if (a3->epid == self->_nstatUDPUpdate.udp_desc.epid) {
    int v10 = v7;
  }
  else {
    int v10 = v7 | 0x10000;
  }
  if (uuid_compare(a3->uuid, self->_nstatUDPUpdate.udp_desc.uuid)) {
    v10 |= 0x1000u;
  }
  if (uuid_compare(a3->euuid, self->_nstatUDPUpdate.udp_desc.euuid))
  {
    if (uuid_compare(self->_nstatUDPUpdate.udp_desc.uuid, self->_nstatUDPUpdate.udp_desc.euuid)) {
      v10 |= 0x2000u;
    }
    else {
      v10 |= 0x4000u;
    }
  }
  if (!memcmp(a3->pname, self->_nstatUDPUpdate.udp_desc.pname, 0x40uLL)) {
    int v11 = v10;
  }
  else {
    int v11 = v10 | 0x200000;
  }
  if (*(void *)&a3->local.v4.sin_len != *(void *)&self->_nstatUDPUpdate.udp_desc.local.v4.sin_len
    || *(void *)a3->local.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatUDPUpdate.udp_desc.local.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->local.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatUDPUpdate.udp_desc.local.v6.sin6_addr.__u6_addr32[2]
    || a3->local.v6.sin6_scope_id != (unint64_t)self->_nstatUDPUpdate.udp_desc.local.v6.sin6_scope_id)
  {
    BOOL HavePortDiffOnly = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatUDPUpdate.udp_desc.local, (uint64_t)&a3->local);
    if (HavePortDiffOnly) {
      int v16 = 0x80000;
    }
    else {
      int v16 = 0x20000;
    }
    if (HavePortDiffOnly) {
      v17 = @"UDP local port";
    }
    else {
      v17 = @"UDP local address";
    }
    v11 |= v16;
    [(NWStatsSource *)self logAddressChangeOn:self->_nstatUDPUpdate.srcref procName:a3->pname variant:v17 oldAddress:&self->_nstatUDPUpdate.udp_desc.local newAddress:&a3->local];
  }
  if (*(void *)&a3->remote.v4.sin_len != *(void *)&self->_nstatUDPUpdate.udp_desc.remote.v4.sin_len
    || *(void *)a3->remote.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->remote.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_addr.__u6_addr32[2]
    || a3->remote.v6.sin6_scope_id != (unint64_t)self->_nstatUDPUpdate.udp_desc.remote.v6.sin6_scope_id)
  {
    BOOL v21 = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatUDPUpdate.udp_desc.remote, (uint64_t)&a3->remote);
    if (v21) {
      int v22 = 0x100000;
    }
    else {
      int v22 = 0x40000;
    }
    if (v21) {
      v23 = @"UDP remote port";
    }
    else {
      v23 = @"UDP remote address";
    }
    v11 |= v22;
    [(NWStatsSource *)self logAddressChangeOn:self->_nstatUDPUpdate.srcref procName:a3->pname variant:v23 oldAddress:&self->_nstatUDPUpdate.udp_desc.remote newAddress:&a3->remote];
  }
  if ((v11 & 0x21F000) != 0)
  {
    LODWORD(v24) = a3->epid;
    [(NWStatsSource *)self logAttributionChangeOn:self->_nstatUDPUpdate.srcref oldProcName:self->_nstatUDPUpdate.udp_desc.pname newProcName:a3->pname oldPid:self->_nstatUDPUpdate.udp_desc.pid newPid:a3->pid oldEPid:self->_nstatUDPUpdate.udp_desc.epid newEPid:v24 oldUUID:self->_nstatUDPUpdate.udp_desc.uuid newUUID:a3->uuid oldEUUID:self->_nstatUDPUpdate.udp_desc.euuid newEUUID:a3->euuid monitor:v26];
    [(NWStatsUDPSource *)self deriveAttribution:v26];
  }
  [(NWStatsSource *)self setFlowFlags:[(NWStatsSource *)self flowFlags] | v11];
}

@end