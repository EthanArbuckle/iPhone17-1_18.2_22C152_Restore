@interface NWStatsConnSnapshot
- (BOOL)hasNetAccess;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (NSData)ancestralParametersTLV;
- (NSData)parametersTLV;
- (NSData)remoteAddress;
- (NSDate)connSnapshotTimestamp;
- (NSDate)connStartTimestamp;
- (NSUUID)cuuid;
- (NSUUID)flowuuid;
- (NSUUID)puuid;
- (NWStatsConnProperties)ancestralProperties;
- (NWStatsConnProperties)currentProperties;
- (NWStatsConnSnapshot)initWithConnUpdate:(const nstat_msg_src_update_conn *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5;
- (double)connDuration;
- (double)connSnapshotTimeIntervalSince1970;
- (double)connSnapshotTimeIntervalSinceReferenceDate;
- (double)connStartTimeIntervalSince1970;
- (double)connStartTimeIntervalSinceReferenceDate;
- (id)_connDescriptorDictionaryForm:(nstat_connection_descriptor *)a3;
- (id)description;
- (id)dictionaryForm;
- (id)domainAttributedBundleId;
- (id)domainName;
- (id)domainOwner;
- (id)domainTrackerContext;
- (id)euuid;
- (id)processName;
- (id)provider;
- (id)snapshotType;
- (id)snapshotTypeLowerCase;
- (id)uuid;
- (int)epid;
- (int)processID;
- (unint64_t)connStartContinuousTime;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)sourceIdentifier;
- (unint64_t)uniqueProcessID;
- (unsigned)personaID;
- (unsigned)remotePort;
- (unsigned)uid;
- (void)setAncestralProperties:(id)a3;
- (void)setCurrentProperties:(id)a3;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
@end

@implementation NWStatsConnSnapshot

- (BOOL)isSilent
{
  v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3)
  {
    v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    char v5 = [v4 isSilent];
  }
  else
  {
    v4 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self currentProperties];
      char v5 = [v6 isSilent];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NWStatsConnProperties)ancestralProperties
{
  return self->_ancestralProperties;
}

- (void)setCurrentProperties:(id)a3
{
}

- (void)setAncestralProperties:(id)a3
{
}

- (NWStatsConnSnapshot)initWithConnUpdate:(const nstat_msg_src_update_conn *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NWStatsConnSnapshot;
  v8 = [(NWStatsConnSnapshot *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_flags = a5;
    memcpy(&v8->_nstat_update, a3, sizeof(v8->_nstat_update));
    v9->_descriptor = &v9->_nstat_update.conn_desc;
    v9->_startTimeInterval = a4;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ancestralProperties, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_flowuuid, 0);
  objc_storeStrong((id *)&self->_puuid, 0);
  objc_storeStrong((id *)&self->_cuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_snapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)description
{
  if ([(NWStatsSnapshot *)self snapshotReason] == 4)
  {
    if (([(NWStatsConnSnapshot *)self eventFlags] & 0x4000) != 0)
    {
      v4 = @"(flowUUID-assigned)";
    }
    else
    {
      __int16 v3 = [(NWStatsConnSnapshot *)self eventFlags];
      v4 = @"(flowUUID-changed)";
      if ((v3 & 0x8000) == 0) {
        v4 = @"?";
      }
    }
  }
  else
  {
    v4 = &stru_26CCA59A8;
  }
  char v5 = (objc_class *)NSString;
  v21 = v4;
  id v22 = [v5 alloc];
  v20 = [(NWStatsConnSnapshot *)self processName];
  unint64_t v19 = [(NWStatsConnSnapshot *)self sourceIdentifier];
  v18 = [(NWStatsSnapshot *)self snapshotReasonString];
  BOOL v17 = [(NWStatsConnSnapshot *)self hasNetAccess];
  v26 = [(NWStatsConnSnapshot *)self uuid];
  v16 = [(NWStatsConnSnapshot *)self euuid];
  v25 = [(NWStatsConnSnapshot *)self cuuid];
  v24 = [(NWStatsConnSnapshot *)self puuid];
  v15 = [(NWStatsConnSnapshot *)self flowuuid];
  v6 = [(NWStatsConnSnapshot *)self domainName];
  v7 = [(NWStatsConnSnapshot *)self domainOwner];
  v14 = [(NWStatsConnSnapshot *)self domainTrackerContext];
  v8 = [(NWStatsConnSnapshot *)self domainAttributedBundleId];
  BOOL v9 = [(NWStatsConnSnapshot *)self isSilent];
  v10 = [(NWStatsConnSnapshot *)self currentProperties];
  objc_super v11 = [(NWStatsConnSnapshot *)self ancestralProperties];
  v12 = [(NWStatsSnapshot *)self extensions];
  v23 = objc_msgSend(v22, "initWithFormat:", @"%@ conn id %lld (%@) %@ net-access %d uuid %@ euuid %@ cuuid %@ puuid %@ fuuid %@ domain name %@ owner %@ context %@ attributed %@ silent %d current %@ ancestral %@ extensions %@", v20, v19, v18, v21, v17, v26, v16, v25, v24, v15, v6, v7, v14, v8, v9, v10,
                  v11,
                  v12);

  return v23;
}

- (NWStatsConnProperties)currentProperties
{
  return self->_currentProperties;
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.srcref;
}

- (id)snapshotType
{
  return @"Conn";
}

- (id)snapshotTypeLowerCase
{
  return @"conn";
}

- (id)provider
{
  return @"Conn";
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.event_flags;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor->upid;
}

- (int)processID
{
  return self->_descriptor->pid;
}

- (unsigned)personaID
{
  return self->_descriptor->persona_id;
}

- (unsigned)uid
{
  return self->_descriptor->uid;
}

- (unint64_t)eupid
{
  return self->_descriptor->eupid;
}

- (int)epid
{
  return self->_descriptor->epid;
}

- (id)processName
{
  processName = self->_processName;
  if (!processName)
  {
    v4 = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%.64s", self->_descriptor->pname);
    char v5 = self->_processName;
    self->_processName = v4;

    processName = self->_processName;
  }
  return processName;
}

- (id)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = [(NWStatsSnapshot *)self _createNSUUIDForBytes:self->_descriptor->uuid];
    char v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)euuid
{
  euuid = self->_euuid;
  if (!euuid)
  {
    v4 = [(NWStatsSnapshot *)self _createNSUUIDForBytes:self->_descriptor->euuid];
    char v5 = self->_euuid;
    self->_euuid = v4;

    euuid = self->_euuid;
  }
  return euuid;
}

- (NSUUID)puuid
{
  puuid = self->_puuid;
  if (!puuid)
  {
    v4 = [(NWStatsSnapshot *)self _createNSUUIDForBytes:self->_descriptor->puuid];
    char v5 = self->_puuid;
    self->_puuid = v4;

    puuid = self->_puuid;
  }
  return puuid;
}

- (NSUUID)cuuid
{
  cuuid = self->_cuuid;
  if (!cuuid)
  {
    v4 = [(NWStatsSnapshot *)self _createNSUUIDForBytes:self->_descriptor->cuuid];
    char v5 = self->_cuuid;
    self->_cuuid = v4;

    cuuid = self->_cuuid;
  }
  return cuuid;
}

- (NSUUID)flowuuid
{
  flowuuid = self->_flowuuid;
  if (!flowuuid)
  {
    v4 = [(NWStatsSnapshot *)self _createNSUUIDForBytes:self->_descriptor->fuuid];
    char v5 = self->_flowuuid;
    self->_flowuuid = v4;

    flowuuid = self->_flowuuid;
  }
  return flowuuid;
}

- (id)domainName
{
  __int16 v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3)
  {
    v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    char v5 = [v4 domainName];
  }
  else
  {
    v4 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self currentProperties];
      char v5 = [v6 domainName];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)domainOwner
{
  __int16 v3 = [(NWStatsConnSnapshot *)self currentProperties];
  if (v3)
  {
    v4 = [(NWStatsConnSnapshot *)self currentProperties];
    char v5 = [v4 domainOwner];
  }
  else
  {
    v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self ancestralProperties];
      char v5 = [v6 domainOwner];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)domainTrackerContext
{
  __int16 v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3)
  {
    v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    char v5 = [v4 domainTrackerContext];
  }
  else
  {
    v4 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self currentProperties];
      char v5 = [v6 domainTrackerContext];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)domainAttributedBundleId
{
  __int16 v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3)
  {
    v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    char v5 = [v4 domainAttributedBundleId];
  }
  else
  {
    v4 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self currentProperties];
      char v5 = [v6 domainAttributedBundleId];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isTracker
{
  __int16 v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3
    && ([(NWStatsConnSnapshot *)self currentProperties],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v5 = (void *)v4;
    v6 = [(NWStatsConnSnapshot *)self ancestralProperties];
    if ([v6 isTracker])
    {
      char v7 = 1;
    }
    else
    {
      objc_super v11 = [(NWStatsConnSnapshot *)self currentProperties];
      char v7 = [v11 isTracker];
    }
  }
  else
  {
    uint64_t v8 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v8)
    {
      char v5 = (void *)v8;
      BOOL v9 = [(NWStatsConnSnapshot *)self currentProperties];
    }
    else
    {
      uint64_t v10 = [(NWStatsConnSnapshot *)self ancestralProperties];
      if (!v10)
      {
        char v7 = 0;
        goto LABEL_12;
      }
      char v5 = (void *)v10;
      BOOL v9 = [(NWStatsConnSnapshot *)self ancestralProperties];
    }
    v6 = v9;
    char v7 = [v9 isTracker];
  }

LABEL_12:
  return v7;
}

- (BOOL)isNonAppInitiated
{
  __int16 v3 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v3)
  {
    uint64_t v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
    char v5 = [v4 isNonAppInitiated];
  }
  else
  {
    uint64_t v4 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v4)
    {
      v6 = [(NWStatsConnSnapshot *)self currentProperties];
      char v5 = [v6 isNonAppInitiated];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSData)remoteAddress
{
  uint64_t v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v4
    && ([(NWStatsConnSnapshot *)self ancestralProperties],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 remoteAddress],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    char v7 = [(NWStatsConnSnapshot *)self ancestralProperties];
    uint64_t v8 = [v7 remoteAddress];
  }
  else
  {
    BOOL v9 = [(NWStatsConnSnapshot *)self currentProperties];
    if (v9)
    {
      uint64_t v10 = [(NWStatsConnSnapshot *)self currentProperties];
      uint64_t v8 = [v10 remoteAddress];
    }
    else
    {
      uint64_t v8 = 0;
    }

    if (!v4) {
      goto LABEL_9;
    }
  }

LABEL_9:
  return (NSData *)v8;
}

- (unsigned)remotePort
{
  uint64_t v4 = [(NWStatsConnSnapshot *)self ancestralProperties];
  if (v4)
  {
    v2 = [(NWStatsConnSnapshot *)self ancestralProperties];
    uint64_t v5 = [v2 remoteAddress];
    if (v5)
    {
      v6 = (void *)v5;
      char v7 = [(NWStatsConnSnapshot *)self ancestralProperties];
      unsigned __int16 v8 = [v7 remotePort];

LABEL_8:
      goto LABEL_9;
    }
  }
  BOOL v9 = [(NWStatsConnSnapshot *)self currentProperties];
  if (v9)
  {
    uint64_t v10 = [(NWStatsConnSnapshot *)self currentProperties];
    unsigned __int16 v8 = [v10 remotePort];
  }
  else
  {
    unsigned __int16 v8 = 0;
  }

  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (BOOL)hasNetAccess
{
  return HIBYTE(self->_descriptor->ifnet_properties) & 1;
}

- (unint64_t)connStartContinuousTime
{
  return self->_descriptor->start_timestamp;
}

- (double)connDuration
{
  +[NWStatsProtocolSnapshot _intervalWithContinuousTime:self->_descriptor->timestamp - self->_descriptor->start_timestamp];
  return result;
}

- (NSDate)connStartTimestamp
{
  startTimestamp = self->_startTimestamp;
  if (!startTimestamp)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFF910];
    [(NWStatsConnSnapshot *)self connStartTimeIntervalSinceReferenceDate];
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_startTimestamp;
    self->_startTimestamp = v5;

    startTimestamp = self->_startTimestamp;
  }
  return startTimestamp;
}

- (NSDate)connSnapshotTimestamp
{
  snapshotTimestamp = self->_snapshotTimestamp;
  if (!snapshotTimestamp)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFF910];
    [(NWStatsConnSnapshot *)self connSnapshotTimeIntervalSinceReferenceDate];
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }
  return snapshotTimestamp;
}

- (double)connStartTimeIntervalSinceReferenceDate
{
  double result = self->_startTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:self->_descriptor->start_timestamp];
    self->_startTimeInterval = result;
  }
  return result;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)connSnapshotTimeIntervalSinceReferenceDate
{
  double result = self->_snapshotTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:self->_descriptor->timestamp];
    self->_snapshotTimeInterval = result;
  }
  return result;
}

- (double)connStartTimeIntervalSince1970
{
  [(NWStatsConnSnapshot *)self connStartTimeIntervalSinceReferenceDate];
  return v2 + 978307200.0;
}

- (double)connSnapshotTimeIntervalSince1970
{
  [(NWStatsConnSnapshot *)self connSnapshotTimeIntervalSinceReferenceDate];
  return v2 + 978307200.0;
}

- (NSData)parametersTLV
{
  double v2 = [(NWStatsSnapshot *)self extensions];
  __int16 v3 = [NSNumber numberWithInt:2];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return (NSData *)v4;
}

- (NSData)ancestralParametersTLV
{
  double v2 = [(NWStatsSnapshot *)self extensions];
  __int16 v3 = [NSNumber numberWithInt:3];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return (NSData *)v4;
}

- (id)_connDescriptorDictionaryForm:(nstat_connection_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3->upid];
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  v6 = [NSNumber numberWithUnsignedLongLong:a3->start_timestamp];
  [v4 setObject:v6 forKeyedSubscript:@"start_timestamp"];

  char v7 = [NSNumber numberWithUnsignedLongLong:a3->timestamp];
  [v4 setObject:v7 forKeyedSubscript:@"timestamp"];

  unsigned __int16 v8 = [NSNumber numberWithUnsignedInt:a3->pid];
  [v4 setObject:v8 forKeyedSubscript:@"pid"];

  BOOL v9 = [NSNumber numberWithUnsignedLongLong:a3->eupid];
  [v4 setObject:v9 forKeyedSubscript:@"eupid"];

  uint64_t v10 = [NSNumber numberWithUnsignedInt:a3->epid];
  [v4 setObject:v10 forKeyedSubscript:@"epid"];

  objc_super v11 = [NSString stringWithUTF8String:a3->pname];
  [v4 setObject:v11 forKeyedSubscript:@"pname"];

  v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->cuuid];
  v13 = [v12 UUIDString];
  [v4 setObject:v13 forKeyedSubscript:@"cuuid"];

  v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->fuuid];
  v15 = [v14 UUIDString];
  [v4 setObject:v15 forKeyedSubscript:@"fuuid"];

  v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->uuid];
  BOOL v17 = [v16 UUIDString];
  [v4 setObject:v17 forKeyedSubscript:@"uuid"];

  v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->euuid];
  unint64_t v19 = [v18 UUIDString];
  [v4 setObject:v19 forKeyedSubscript:@"euuid"];

  v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->puuid];
  v21 = [v20 UUIDString];
  [v4 setObject:v21 forKeyedSubscript:@"puuid"];

  return v4;
}

- (id)dictionaryForm
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = NSNumber;
  [(NWStatsConnSnapshot *)self connStartTimeIntervalSinceReferenceDate];
  *(float *)&double v5 = v5;
  v6 = [v4 numberWithFloat:v5];
  [v3 setObject:v6 forKeyedSubscript:@"_startStamp"];

  char v7 = NSNumber;
  [(NWStatsConnSnapshot *)self connStartTimeIntervalSinceReferenceDate];
  BOOL v9 = [v7 numberWithUnsignedLongLong:(unint64_t)(v8 * 1000000.0)];
  [v3 setObject:v9 forKeyedSubscript:@"_startStampUsecs"];

  uint64_t v10 = NSNumber;
  [(NWStatsConnSnapshot *)self connSnapshotTimeIntervalSinceReferenceDate];
  v12 = [v10 numberWithUnsignedLongLong:(unint64_t)(v11 * 1000000.0)];
  [v3 setObject:v12 forKeyedSubscript:@"_snapStampUsecs"];

  v13 = [NSNumber numberWithUnsignedInt:self->_flags];
  [v3 setObject:v13 forKeyedSubscript:@"_flags"];

  v14 = [(NWStatsSnapshot *)self attributedEntity];
  if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:@"attributedEntity"];
  }
  else
  {
    v15 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v15 forKeyedSubscript:@"attributedEntity"];
  }
  v16 = [(NWStatsSnapshot *)self delegateName];
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"delegateName"];
  }
  else
  {
    BOOL v17 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v17 forKeyedSubscript:@"delegateName"];
  }
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  [v3 setObject:v18 forKeyedSubscript:@"attributionReason"];

  unint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  [v3 setObject:v19 forKeyedSubscript:@"snapshotReason"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  [v3 setObject:v20 forKeyedSubscript:@"startAppStateIsForeground"];

  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  [v3 setObject:v21 forKeyedSubscript:@"snapshotAppStateIsForeground"];

  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  [v3 setObject:v22 forKeyedSubscript:@"startScreenStateOn"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  [v3 setObject:v23 forKeyedSubscript:@"snapshotScreenStateOn"];

  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  [v3 setObject:v24 forKeyedSubscript:@"delegateAttributionReason"];

  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v26 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.srcref];
  [v25 setObject:v26 forKeyedSubscript:@"srcref"];

  v27 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.event_flags];
  [v25 setObject:v27 forKeyedSubscript:@"event_flags"];

  v28 = [NSNumber numberWithUnsignedInt:self->_nstat_update.provider];
  [v25 setObject:v28 forKeyedSubscript:@"provider"];

  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v30 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.hdr.context];
  [v29 setObject:v30 forKeyedSubscript:@"context"];

  v31 = [NSNumber numberWithUnsignedInt:self->_nstat_update.hdr.type];
  [v29 setObject:v31 forKeyedSubscript:@"type"];

  v32 = [NSNumber numberWithUnsignedShort:self->_nstat_update.hdr.length];
  [v29 setObject:v32 forKeyedSubscript:@"length"];

  v33 = [NSNumber numberWithUnsignedShort:self->_nstat_update.hdr.flags];
  [v29 setObject:v33 forKeyedSubscript:@"flags"];

  [v25 setObject:v29 forKeyedSubscript:@"hdr"];
  v34 = [(NWStatsConnSnapshot *)self _connDescriptorDictionaryForm:self->_descriptor];
  [v25 setObject:v34 forKeyedSubscript:@"conn_descriptor"];

  [v3 setObject:v25 forKeyedSubscript:@"update"];
  return v3;
}

@end