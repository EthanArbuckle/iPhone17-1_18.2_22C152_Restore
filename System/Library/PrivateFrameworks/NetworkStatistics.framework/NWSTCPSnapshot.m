@interface NWSTCPSnapshot
- (BOOL)connProbeFailed;
- (BOOL)countsIncludeHeaderOverhead;
- (BOOL)flowIsLocal;
- (BOOL)flowIsNonLocal;
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
- (BOOL)probeActivated;
- (BOOL)readProbeFailed;
- (BOOL)writeProbeFailed;
- (NSString)TCPState;
- (NSString)congestionAlgorithm;
- (NWSTCPSnapshot)initWithCounts:(const nstat_counts *)a3 TCPDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8;
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
- (unsigned)connectAttempts;
- (unsigned)connectSuccesses;
- (unsigned)connstatusConnProbeFailed;
- (unsigned)connstatusProbeActivated;
- (unsigned)connstatusReadProbeFailed;
- (unsigned)connstatusWriteProbeFailed;
- (unsigned)interfaceIndex;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)rxDuplicateBytes;
- (unsigned)rxOutOfOrderBytes;
- (unsigned)sendBufferSize;
- (unsigned)sendBufferUsed;
- (unsigned)trafficClass;
- (unsigned)trafficManagementFlags;
- (unsigned)txCongestionWindow;
- (unsigned)txRetransmittedBytes;
- (unsigned)txUnacked;
- (unsigned)txWindow;
@end

@implementation NWSTCPSnapshot

- (unsigned)rxDuplicateBytes
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return [(NWSSnapshot *)&v3 _rxDuplicateBytes];
}

- (unsigned)rxOutOfOrderBytes
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return [(NWSSnapshot *)&v3 _rxOutOfOrderBytes];
}

- (unsigned)txRetransmittedBytes
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return [(NWSSnapshot *)&v3 _txRetransmittedBytes];
}

- (unsigned)connectAttempts
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return [(NWSSnapshot *)&v3 _connectAttempts];
}

- (unsigned)connectSuccesses
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return [(NWSSnapshot *)&v3 _connectSuccesses];
}

- (double)rttMinimum
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  [(NWSSnapshot *)&v3 _rttMinimum];
  return result;
}

- (double)rttAverage
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  [(NWSSnapshot *)&v3 _rttAverage];
  return result;
}

- (double)rttVariation
{
  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  [(NWSSnapshot *)&v3 _rttVariation];
  return result;
}

- (id)provider
{
  return @"TCP";
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)sendBufferSize
{
  return self->_descriptor.sndbufsize;
}

- (unsigned)sendBufferUsed
{
  return self->_descriptor.sndbufused;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor.rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor.rcvbufused;
}

- (unsigned)txUnacked
{
  return self->_descriptor.txunacked;
}

- (unsigned)txWindow
{
  return self->_descriptor.txwindow;
}

- (unsigned)txCongestionWindow
{
  return self->_descriptor.txcwindow;
}

- (unsigned)trafficClass
{
  return self->_descriptor.traffic_class;
}

- (unsigned)trafficManagementFlags
{
  return self->_descriptor.traffic_mgt_flags;
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

- (unsigned)connstatusProbeActivated
{
  return self->_descriptor.var0.__pad_connstatus[0] & 1;
}

- (unsigned)connstatusConnProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1;
}

- (unsigned)connstatusReadProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1;
}

- (unsigned)connstatusWriteProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1;
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
  if ((~self->_descriptor.ifnet_properties & 0x104) != 0) {
    return 0;
  }
  if ((self->_descriptor.fallback_mode & 0xFE) == 2) {
    return 1;
  }
  return self->_provider == 2;
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

- (BOOL)flowIsLocal
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 3) & 1;
}

- (BOOL)flowIsNonLocal
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 4) & 1;
}

- (NSString)TCPState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t state = self->_descriptor.state;
  v6[2] = xmmword_264405588;
  v6[3] = *(_OWORD *)&off_264405598;
  v6[4] = xmmword_2644055A8;
  v7 = @"TimeWait";
  v6[0] = xmmword_264405568;
  v6[1] = *(_OWORD *)&off_264405578;
  if (state > 0xA) {
    id v3 = 0;
  }
  else {
    id v3 = *((id *)v6 + state);
  }
  for (uint64_t i = 80; i != -8; i -= 8)

  return (NSString *)v3;
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
      id v3 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_descriptor.local length:self->_descriptor.local.v4.sin_len];
    }
    else {
      id v3 = 0;
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
      id v3 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_descriptor.remote length:self->_descriptor.remote.v4.sin_len];
    }
    else {
      id v3 = 0;
    }
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;
  }
  v5 = self->_remoteAddress;
  return v5;
}

- (NSString)congestionAlgorithm
{
  congestionAlgorithm = self->_congestionAlgorithm;
  if (!congestionAlgorithm)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.16s", self->_descriptor.cc_algo);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_congestionAlgorithm;
    self->_congestionAlgorithm = v4;

    congestionAlgorithm = self->_congestionAlgorithm;
  }
  return congestionAlgorithm;
}

- (BOOL)probeActivated
{
  return self->_descriptor.var0.__pad_connstatus[0] & 1;
}

- (BOOL)connProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1;
}

- (BOOL)readProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1;
}

- (BOOL)writeProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1;
}

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_provider == 3;
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
  v68.receiver = self;
  v68.super_class = (Class)NWSTCPSnapshot;
  id v3 = [(NWSSnapshot *)&v68 _createCountsForProvider:2];
  v4 = v3;
  if (!v3) {
    goto LABEL_38;
  }
  [v3 setObject:kNStatProviderTCP forKeyedSubscript:kNStatSrcKeyProvider];
  v5 = [(NWSTCPSnapshot *)self localAddress];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFF8F8];
    v7 = [(NWSTCPSnapshot *)self localAddress];
    uint64_t v8 = [v6 dataWithData:v7];
    [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyLocal];
  }
  v9 = [(NWSTCPSnapshot *)self remoteAddress];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263EFF8F8];
    v11 = [(NWSTCPSnapshot *)self remoteAddress];
    v12 = [v10 dataWithData:v11];
    [v4 setObject:v12 forKeyedSubscript:kNStatSrcKeyRemote];
  }
  p_descriptor = &self->_descriptor;
  v14 = [NSNumber numberWithUnsignedInt:self->_descriptor.ifindex];
  [v4 setObject:v14 forKeyedSubscript:kNStatSrcKeyInterface];

  v15 = [(NWSTCPSnapshot *)self TCPState];

  if (v15)
  {
    v16 = [(NWSTCPSnapshot *)self TCPState];
    [v4 setObject:v16 forKeyedSubscript:kNStatSrcKeyTCPState];
  }
  v17 = [NSNumber numberWithUnsignedInt:self->_descriptor.sndbufsize];
  [v4 setObject:v17 forKeyedSubscript:kNStatSrcKeySndBufSize];

  v18 = [NSNumber numberWithUnsignedInt:self->_descriptor.sndbufused];
  [v4 setObject:v18 forKeyedSubscript:kNStatSrcKeySndBufUsed];

  v19 = [NSNumber numberWithUnsignedInt:self->_descriptor.rcvbufsize];
  [v4 setObject:v19 forKeyedSubscript:kNStatSrcKeyRcvBufSize];

  v20 = [NSNumber numberWithUnsignedInt:self->_descriptor.rcvbufused];
  [v4 setObject:v20 forKeyedSubscript:kNStatSrcKeyRcvBufUsed];

  v21 = [NSNumber numberWithUnsignedInt:self->_descriptor.txunacked];
  [v4 setObject:v21 forKeyedSubscript:kNStatSrcKeyTCPTxUnacked];

  v22 = [NSNumber numberWithUnsignedInt:self->_descriptor.txwindow];
  [v4 setObject:v22 forKeyedSubscript:kNStatSrcKeyTCPTxWindow];

  v23 = [NSNumber numberWithUnsignedInt:self->_descriptor.txcwindow];
  [v4 setObject:v23 forKeyedSubscript:kNStatSrcKeyTCPTxCongWindow];

  v24 = [NSNumber numberWithUnsignedInt:self->_descriptor.traffic_class];
  [v4 setObject:v24 forKeyedSubscript:kNStatSrcKeyTrafficClass];

  v25 = [NSNumber numberWithUnsignedInt:self->_descriptor.traffic_mgt_flags];
  [v4 setObject:v25 forKeyedSubscript:kNStatSrcKeyTrafficMgtFlags];

  v26 = [(NWSTCPSnapshot *)self congestionAlgorithm];

  if (v26)
  {
    v27 = NSString;
    v28 = [(NWSTCPSnapshot *)self congestionAlgorithm];
    v29 = [v27 stringWithString:v28];
    [v4 setObject:v29 forKeyedSubscript:kNStatSrcKeyTCPCCAlgorithm];
  }
  v30 = [NSNumber numberWithUnsignedLongLong:p_descriptor->upid];
  [v4 setObject:v30 forKeyedSubscript:kNStatSrcKeyUPID];

  v31 = [NSNumber numberWithUnsignedInt:self->_descriptor.pid];
  [v4 setObject:v31 forKeyedSubscript:kNStatSrcKeyPID];

  v32 = [(NWSTCPSnapshot *)self processName];

  if (v32)
  {
    v33 = NSString;
    v34 = [(NWSTCPSnapshot *)self processName];
    v35 = [v33 stringWithString:v34];
    [v4 setObject:v35 forKeyedSubscript:kNStatSrcKeyProcessName];
  }
  v36 = [NSNumber numberWithUnsignedLongLong:self->_descriptor.eupid];
  [v4 setObject:v36 forKeyedSubscript:kNStatSrcKeyEUPID];

  v37 = [NSNumber numberWithUnsignedInt:self->_descriptor.epid];
  [v4 setObject:v37 forKeyedSubscript:kNStatSrcKeyEPID];

  v38 = [(NWSTCPSnapshot *)self uuid];

  if (v38)
  {
    v39 = NSString;
    v40 = [(NWSTCPSnapshot *)self uuid];
    v41 = [v39 stringWithString:v40];
    [v4 setObject:v41 forKeyedSubscript:kNStatSrcKeyUUID];
  }
  v42 = [(NWSTCPSnapshot *)self euuid];

  if (v42)
  {
    v43 = NSString;
    v44 = [(NWSTCPSnapshot *)self euuid];
    v45 = [v43 stringWithString:v44];
    [v4 setObject:v45 forKeyedSubscript:kNStatSrcKeyEUUID];
  }
  v46 = [(NWSTCPSnapshot *)self fuuid];

  if (v46)
  {
    v47 = NSString;
    v48 = [(NWSTCPSnapshot *)self fuuid];
    v49 = [v47 stringWithString:v48];
    [v4 setObject:v49 forKeyedSubscript:kNStatSrcKeyFUUID];
  }
  v50 = [(NWSTCPSnapshot *)self vuuid];

  if (v50)
  {
    v51 = NSString;
    v52 = [(NWSTCPSnapshot *)self vuuid];
    v53 = [v51 stringWithString:v52];
    [v4 setObject:v53 forKeyedSubscript:kNStatSrcKeyVUUID];
  }
  unsigned int ifnet_properties = self->_descriptor.ifnet_properties;
  if ((ifnet_properties & 8) != 0)
  {
    v56 = &kNStatSrcKeyInterfaceTypeWiFi;
LABEL_28:
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v56];
    goto LABEL_29;
  }
  if ((ifnet_properties & 4) == 0)
  {
    v55 = &kNStatSrcKeyInterfaceTypeLoopback;
    if ((ifnet_properties & 2) == 0) {
      v55 = &kNStatSrcKeyInterfaceTypeUnknown;
    }
    if ((ifnet_properties & 0x10) != 0) {
      v56 = &kNStatSrcKeyInterfaceTypeWired;
    }
    else {
      v56 = v55;
    }
    goto LABEL_28;
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCellular];
  if ((self->_descriptor.ifnet_properties & 0x100) != 0)
  {
    unsigned int v67 = self->_descriptor.fallback_mode - 2;
    if (v67 < 3)
    {
      v56 = off_2644055C0[(char)v67];
      goto LABEL_28;
    }
    if (self->_provider == 2)
    {
      v56 = &kNStatSrcKeyInterfaceIsCellFallback;
      goto LABEL_28;
    }
  }
LABEL_29:
  unsigned int v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x200) == 0)
  {
    if ((v57 & 0x40) == 0) {
      goto LABEL_31;
    }
LABEL_42:
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceIsExpensive];
    if ((self->_descriptor.ifnet_properties & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCompanionLink];
  unsigned int v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x40) != 0) {
    goto LABEL_42;
  }
LABEL_31:
  if ((v57 & 0x20) != 0) {
LABEL_32:
  }
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyInterfaceIsAWDL];
LABEL_33:
  v58 = [NSNumber numberWithUnsignedInt:self->_descriptor.var0.__pad_connstatus[0] & 1];
  [v4 setObject:v58 forKeyedSubscript:kNStatSrcKeyProbeActivated];

  v59 = [NSNumber numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1];
  [v4 setObject:v59 forKeyedSubscript:kNStatSrcKeyConnProbeFailed];

  v60 = [NSNumber numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1];
  [v4 setObject:v60 forKeyedSubscript:kNStatSrcKeyReadProbeFailed];

  v61 = [NSNumber numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1];
  [v4 setObject:v61 forKeyedSubscript:kNStatSrcKeyWriteProbeFailed];

  if ([(NWSTCPSnapshot *)self countsIncludeHeaderOverhead]) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kNStatSrcKeyChannelArchitecture];
  }
  if (self->_eventFlags)
  {
    v62 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v4 setObject:v62 forKeyedSubscript:kNStatSrcKeyEventFlags];
  }
  v63 = [NSNumber numberWithUnsignedLongLong:p_descriptor->start_timestamp];
  [v4 setObject:v63 forKeyedSubscript:kNStatSrcKeyStartAbsoluteTime];

  v64 = [NSNumber numberWithUnsignedLongLong:p_descriptor->timestamp - p_descriptor->start_timestamp];
  [v4 setObject:v64 forKeyedSubscript:kNStatSrcKeyDurationAbsoluteTime];

  id v65 = v4;
LABEL_38:

  return v4;
}

- (id)description
{
  __ret = 0;
  v7.receiver = self;
  v7.super_class = (Class)NWSTCPSnapshot;
  id v3 = [(NWSSnapshot *)&v7 description];
  v4 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v4, 0, "NWTCPSnapshot %N<->%N@%I %@", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex, v3);
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

- (NWSTCPSnapshot)initWithCounts:(const nstat_counts *)a3 TCPDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8
{
  v14.receiver = self;
  v14.super_class = (Class)NWSTCPSnapshot;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_fuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_congestionAlgorithm, 0);
}

@end