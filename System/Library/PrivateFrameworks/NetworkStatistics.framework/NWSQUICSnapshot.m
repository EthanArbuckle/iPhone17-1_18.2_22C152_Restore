@interface NWSQUICSnapshot
- (BOOL)countsIncludeHeaderOverhead;
- (BOOL)interfaceAWDL;
- (BOOL)interfaceCellular;
- (BOOL)interfaceCellularViaFallback;
- (BOOL)interfaceCellularViaPreferredFallback;
- (BOOL)interfaceCompanionLink;
- (BOOL)interfaceExpensive;
- (BOOL)interfaceLoopback;
- (BOOL)interfaceUnknown;
- (BOOL)interfaceWifi;
- (BOOL)interfaceWired;
- (NWSQUICSnapshot)initWithCounts:(const nstat_counts *)a3 QUICDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8;
- (double)flowDuration;
- (double)rttAverage;
- (double)rttMinimum;
- (double)rttVariation;
- (id)description;
- (id)euuid;
- (id)flowStartTimestamp;
- (id)fuuid;
- (id)localAddress;
- (id)processName;
- (id)provider;
- (id)remoteAddress;
- (id)traditionalDictionary;
- (id)uuid;
- (id)vuuid;
- (int)epid;
- (int)processID;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)uniqueProcessID;
- (unsigned)interfaceIndex;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)trafficClass;
@end

@implementation NWSQUICSnapshot

- (id)provider
{
  return @"QUIC";
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor.rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor.rcvbufused;
}

- (unsigned)trafficClass
{
  return self->_descriptor.traffic_class;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor.upid;
}

- (int)processID
{
  return self->_descriptor.pid;
}

- (unint64_t)eupid
{
  return self->_descriptor.eupid;
}

- (int)epid
{
  return self->_descriptor.epid;
}

- (id)processName
{
  processName = self->_processName;
  if (!processName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.64s", self->_descriptor.pname);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_processName;
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
    v4 = [(NWSProtocolSnapshot *)self _createNSUUIDForBytes:self->_descriptor.uuid];
    v5 = [v4 UUIDString];
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)euuid
{
  euuid = self->_euuid;
  if (!euuid)
  {
    v4 = [(NWSProtocolSnapshot *)self _createNSUUIDForBytes:self->_descriptor.euuid];
    v5 = [v4 UUIDString];
    v6 = self->_euuid;
    self->_euuid = v5;

    euuid = self->_euuid;
  }
  return euuid;
}

- (id)fuuid
{
  fuuid = self->_fuuid;
  if (!fuuid)
  {
    v4 = [(NWSProtocolSnapshot *)self _createNSUUIDForBytes:self->_descriptor.fuuid];
    v5 = [v4 UUIDString];
    v6 = self->_fuuid;
    self->_fuuid = v5;

    fuuid = self->_fuuid;
  }
  return fuuid;
}

- (id)vuuid
{
  vuuid = self->_vuuid;
  if (!vuuid)
  {
    v4 = [(NWSProtocolSnapshot *)self _createNSUUIDForBytes:self->_descriptor.vuuid];
    v5 = [v4 UUIDString];
    v6 = self->_vuuid;
    self->_vuuid = v5;

    vuuid = self->_vuuid;
  }
  return vuuid;
}

- (id)localAddress
{
  if (!self->_localAddress)
  {
    if (self->_descriptor.local.v4.sin_len) {
      v3 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_descriptor.local length:self->_descriptor.local.v4.sin_len];
    }
    else {
      v3 = 0;
    }
    localAddress = self->_localAddress;
    self->_localAddress = v3;
  }
  v5 = self->_localAddress;
  return v5;
}

- (id)remoteAddress
{
  if (!self->_remoteAddress)
  {
    if (self->_descriptor.remote.v4.sin_len) {
      v3 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_descriptor.remote length:self->_descriptor.remote.v4.sin_len];
    }
    else {
      v3 = 0;
    }
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;
  }
  v5 = self->_remoteAddress;
  return v5;
}

- (id)flowStartTimestamp
{
  return [(NWSProtocolSnapshot *)self _dateWithContinuousTime:self->_descriptor.start_timestamp];
}

- (unint64_t)flowStartContinuousTime
{
  return self->_descriptor.start_timestamp;
}

- (double)flowDuration
{
  [(NWSProtocolSnapshot *)self _intervalWithContinuousTime:self->_descriptor.timestamp - self->_descriptor.start_timestamp];
  return result;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor.ifnet_properties & 1 | ((self->_descriptor.ifnet_properties & 0x21E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceCellularViaFallback
{
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && (self->_descriptor.fallback_mode & 0xFE) == 2;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && self->_descriptor.fallback_mode == 4;
}

- (BOOL)interfaceWifi
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 3) & 1;
}

- (BOOL)interfaceWired
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 5) & 1;
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceCompanionLink
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_provider == 8;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor.activity_bitmap.start;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor.activity_bitmap.bitmap[0];
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor.activity_bitmap.bitmap[1];
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (id)traditionalDictionary
{
  v52.receiver = self;
  v52.super_class = (Class)NWSQUICSnapshot;
  v3 = [(NWSSnapshot *)&v52 _createCountsForProvider:8];
  v4 = v3;
  if (!v3) {
    goto LABEL_34;
  }
  [v3 setObject:kNStatProviderUDP forKeyedSubscript:kNStatSrcKeyProvider];
  v5 = [(NWSQUICSnapshot *)self localAddress];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFF8F8];
    v7 = [(NWSQUICSnapshot *)self localAddress];
    v8 = [v6 dataWithData:v7];
    [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyLocal];
  }
  v9 = [(NWSQUICSnapshot *)self remoteAddress];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263EFF8F8];
    v11 = [(NWSQUICSnapshot *)self remoteAddress];
    v12 = [v10 dataWithData:v11];
    [v4 setObject:v12 forKeyedSubscript:kNStatSrcKeyRemote];
  }
  p_descriptor = &self->_descriptor;
  v14 = [NSNumber numberWithUnsignedInt:self->_descriptor.ifindex];
  [v4 setObject:v14 forKeyedSubscript:kNStatSrcKeyInterface];

  v15 = [NSNumber numberWithUnsignedInt:self->_descriptor.pid];
  [v4 setObject:v15 forKeyedSubscript:kNStatSrcKeyPID];

  v16 = [NSNumber numberWithUnsignedLongLong:self->_descriptor.upid];
  [v4 setObject:v16 forKeyedSubscript:kNStatSrcKeyUPID];

  v17 = [NSNumber numberWithUnsignedInt:self->_descriptor.epid];
  [v4 setObject:v17 forKeyedSubscript:kNStatSrcKeyEPID];

  v18 = [NSNumber numberWithUnsignedLongLong:self->_descriptor.eupid];
  [v4 setObject:v18 forKeyedSubscript:kNStatSrcKeyEUPID];

  v19 = [(NWSQUICSnapshot *)self uuid];

  if (v19)
  {
    v20 = NSString;
    v21 = [(NWSQUICSnapshot *)self uuid];
    v22 = [v20 stringWithString:v21];
    [v4 setObject:v22 forKeyedSubscript:kNStatSrcKeyUUID];
  }
  v23 = [(NWSQUICSnapshot *)self euuid];

  if (v23)
  {
    v24 = NSString;
    v25 = [(NWSQUICSnapshot *)self euuid];
    v26 = [v24 stringWithString:v25];
    [v4 setObject:v26 forKeyedSubscript:kNStatSrcKeyEUUID];
  }
  v27 = [(NWSQUICSnapshot *)self fuuid];

  if (v27)
  {
    v28 = NSString;
    v29 = [(NWSQUICSnapshot *)self fuuid];
    v30 = [v28 stringWithString:v29];
    [v4 setObject:v30 forKeyedSubscript:kNStatSrcKeyFUUID];
  }
  v31 = [(NWSQUICSnapshot *)self vuuid];

  if (v31)
  {
    v32 = NSString;
    v33 = [(NWSQUICSnapshot *)self vuuid];
    v34 = [v32 stringWithString:v33];
    [v4 setObject:v34 forKeyedSubscript:kNStatSrcKeyVUUID];
  }
  v35 = [(NWSQUICSnapshot *)self processName];

  if (v35)
  {
    v36 = NSString;
    v37 = [(NWSQUICSnapshot *)self processName];
    v38 = [v36 stringWithString:v37];
    [v4 setObject:v38 forKeyedSubscript:kNStatSrcKeyProcessName];
  }
  v39 = [NSNumber numberWithUnsignedInt:self->_descriptor.rcvbufsize];
  [v4 setObject:v39 forKeyedSubscript:kNStatSrcKeyRcvBufSize];

  v40 = [NSNumber numberWithUnsignedInt:self->_descriptor.rcvbufused];
  [v4 setObject:v40 forKeyedSubscript:kNStatSrcKeyRcvBufUsed];

  v41 = [NSNumber numberWithUnsignedInt:self->_descriptor.traffic_class];
  [v4 setObject:v41 forKeyedSubscript:kNStatSrcKeyTrafficClass];

  unsigned int ifnet_properties = self->_descriptor.ifnet_properties;
  if ((ifnet_properties & 8) != 0)
  {
    v44 = &kNStatSrcKeyInterfaceTypeWiFi;
LABEL_24:
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v44];
    goto LABEL_25;
  }
  if ((ifnet_properties & 4) == 0)
  {
    v43 = &kNStatSrcKeyInterfaceTypeLoopback;
    if ((ifnet_properties & 2) == 0) {
      v43 = &kNStatSrcKeyInterfaceTypeUnknown;
    }
    if ((ifnet_properties & 0x10) != 0) {
      v44 = &kNStatSrcKeyInterfaceTypeWired;
    }
    else {
      v44 = v43;
    }
    goto LABEL_24;
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCellular];
  if ((self->_descriptor.ifnet_properties & 0x100) != 0)
  {
    unsigned int v51 = self->_descriptor.fallback_mode - 2;
    if (v51 < 3)
    {
      v44 = off_2644055F0[(char)v51];
      goto LABEL_24;
    }
  }
LABEL_25:
  unsigned int v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x200) == 0)
  {
    if ((v45 & 0x40) == 0) {
      goto LABEL_27;
    }
LABEL_38:
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceIsExpensive];
    if ((self->_descriptor.ifnet_properties & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCompanionLink];
  unsigned int v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x40) != 0) {
    goto LABEL_38;
  }
LABEL_27:
  if ((v45 & 0x20) != 0) {
LABEL_28:
  }
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceIsAWDL];
LABEL_29:
  if ([(NWSQUICSnapshot *)self countsIncludeHeaderOverhead]) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyChannelArchitecture];
  }
  if (self->_eventFlags)
  {
    v46 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v4 setObject:v46 forKeyedSubscript:kNStatSrcKeyEventFlags];
  }
  v47 = [NSNumber numberWithUnsignedLongLong:p_descriptor->start_timestamp];
  [v4 setObject:v47 forKeyedSubscript:kNStatSrcKeyStartAbsoluteTime];

  v48 = [NSNumber numberWithUnsignedLongLong:p_descriptor->timestamp - p_descriptor->start_timestamp];
  [v4 setObject:v48 forKeyedSubscript:kNStatSrcKeyDurationAbsoluteTime];

  id v49 = v4;
LABEL_34:

  return v4;
}

- (id)description
{
  __ret = 0;
  v7.receiver = self;
  v7.super_class = (Class)NWSQUICSnapshot;
  v3 = [(NWSSnapshot *)&v7 description];
  v4 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v4, 0, "NWQUICSnapshot %N<->%N@%I %@", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex, v3);
  if (__ret)
  {
    v5 = [NSString stringWithCString:__ret encoding:4];
    free(__ret);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NWSQUICSnapshot)initWithCounts:(const nstat_counts *)a3 QUICDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8
{
  v14.receiver = self;
  v14.super_class = (Class)NWSQUICSnapshot;
  v11 = [(NWSSnapshot *)&v14 _initWithCounts:a3 sourceIdent:a5 seqno:a7];
  v12 = v11;
  if (v11)
  {
    memcpy(&v11->_descriptor, a4, sizeof(v11->_descriptor));
    v12->_provider = a8;
    v12->_eventFlags = a6;
  }
  return v12;
}

- (double)rttMinimum
{
  return self->_rttMinimum;
}

- (double)rttAverage
{
  return self->_rttAverage;
}

- (double)rttVariation
{
  return self->_rttVariation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_fuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end