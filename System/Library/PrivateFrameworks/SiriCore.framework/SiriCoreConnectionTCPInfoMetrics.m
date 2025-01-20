@interface SiriCoreConnectionTCPInfoMetrics
- (NSNumber)bytesReceived;
- (NSNumber)bytesRetransmitted;
- (NSNumber)bytesSent;
- (NSNumber)bytesUnacked;
- (NSNumber)duplicateBytesReceived;
- (NSNumber)outOfOrderBytesReceived;
- (NSNumber)packetsReceived;
- (NSNumber)packetsSent;
- (NSNumber)rttBest;
- (NSNumber)rttCurrent;
- (NSNumber)rttSmoothed;
- (NSNumber)rttVariance;
- (NSNumber)sendBandwidth;
- (NSNumber)sendBufferBytes;
- (NSNumber)synRetransmits;
- (NSNumber)tfoSynDataAcked;
- (NSString)interfaceName;
- (SiriCoreConnectionTCPInfoMetrics)init;
- (SiriCoreConnectionTCPInfoMetrics)initWithInterfaceName:(id)a3 rttCurrent:(id)a4 rttSmoothed:(id)a5 rttVariance:(id)a6 rttBest:(id)a7 packetsSent:(id)a8 bytesSent:(id)a9 bytesRetransmitted:(id)a10 bytesUnacked:(id)a11 packetsReceived:(id)a12 bytesReceived:(id)a13 duplicateBytesReceived:(id)a14 outOfOrderBytesReceived:(id)a15 sendBufferBytes:(id)a16 sendBandwidth:(id)a17 synRetransmits:(id)a18 tfoSynDataAcked:(id)a19;
- (id)description;
@end

@implementation SiriCoreConnectionTCPInfoMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tfoSynDataAcked, 0);
  objc_storeStrong((id *)&self->_synRetransmits, 0);
  objc_storeStrong((id *)&self->_sendBandwidth, 0);
  objc_storeStrong((id *)&self->_sendBufferBytes, 0);
  objc_storeStrong((id *)&self->_outOfOrderBytesReceived, 0);
  objc_storeStrong((id *)&self->_duplicateBytesReceived, 0);
  objc_storeStrong((id *)&self->_bytesReceived, 0);
  objc_storeStrong((id *)&self->_packetsReceived, 0);
  objc_storeStrong((id *)&self->_bytesUnacked, 0);
  objc_storeStrong((id *)&self->_bytesRetransmitted, 0);
  objc_storeStrong((id *)&self->_bytesSent, 0);
  objc_storeStrong((id *)&self->_packetsSent, 0);
  objc_storeStrong((id *)&self->_rttBest, 0);
  objc_storeStrong((id *)&self->_rttVariance, 0);
  objc_storeStrong((id *)&self->_rttSmoothed, 0);
  objc_storeStrong((id *)&self->_rttCurrent, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

- (NSNumber)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (NSNumber)synRetransmits
{
  return self->_synRetransmits;
}

- (NSNumber)sendBandwidth
{
  return self->_sendBandwidth;
}

- (NSNumber)sendBufferBytes
{
  return self->_sendBufferBytes;
}

- (NSNumber)outOfOrderBytesReceived
{
  return self->_outOfOrderBytesReceived;
}

- (NSNumber)duplicateBytesReceived
{
  return self->_duplicateBytesReceived;
}

- (NSNumber)bytesReceived
{
  return self->_bytesReceived;
}

- (NSNumber)packetsReceived
{
  return self->_packetsReceived;
}

- (NSNumber)bytesUnacked
{
  return self->_bytesUnacked;
}

- (NSNumber)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (NSNumber)bytesSent
{
  return self->_bytesSent;
}

- (NSNumber)packetsSent
{
  return self->_packetsSent;
}

- (NSNumber)rttBest
{
  return self->_rttBest;
}

- (NSNumber)rttVariance
{
  return self->_rttVariance;
}

- (NSNumber)rttSmoothed
{
  return self->_rttSmoothed;
}

- (NSNumber)rttCurrent
{
  return self->_rttCurrent;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreConnectionTCPInfoMetrics;
  v4 = [(SiriCoreConnectionTCPInfoMetrics *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@ {interfaceName = %@, rttCurrent = %@, rttSmoothed = %@, rttVariance = %@, rttBest = %@, packetsSent = %@, bytesSent = %@, bytesRetransmitted = %@, bytesUnacked = %@, packetsReceived = %@, bytesReceived = %@, duplicateBytesReceived = %@, outOfOrderBytesReceived = %@, sendBufferBytes = %@, sendBandwidth = %@, synRetransmits = %@ tfoSynDataAcked = %@}", v4, self->_interfaceName, self->_rttCurrent, self->_rttSmoothed, self->_rttVariance, self->_rttBest, self->_packetsSent, self->_bytesSent, self->_bytesRetransmitted, self->_bytesUnacked, self->_packetsReceived, self->_bytesReceived, self->_duplicateBytesReceived, self->_outOfOrderBytesReceived, self->_sendBufferBytes, self->_sendBandwidth,
    self->_synRetransmits,
  v5 = self->_tfoSynDataAcked);

  return v5;
}

- (SiriCoreConnectionTCPInfoMetrics)init
{
  return 0;
}

- (SiriCoreConnectionTCPInfoMetrics)initWithInterfaceName:(id)a3 rttCurrent:(id)a4 rttSmoothed:(id)a5 rttVariance:(id)a6 rttBest:(id)a7 packetsSent:(id)a8 bytesSent:(id)a9 bytesRetransmitted:(id)a10 bytesUnacked:(id)a11 packetsReceived:(id)a12 bytesReceived:(id)a13 duplicateBytesReceived:(id)a14 outOfOrderBytesReceived:(id)a15 sendBufferBytes:(id)a16 sendBandwidth:(id)a17 synRetransmits:(id)a18 tfoSynDataAcked:(id)a19
{
  id v24 = a3;
  id v25 = a4;
  id v78 = a5;
  id v77 = a6;
  id v76 = a7;
  id v75 = a8;
  id v74 = a9;
  id v73 = a10;
  v26 = v25;
  id v72 = a11;
  id v71 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  id v32 = a18;
  id v33 = a19;
  v79.receiver = self;
  v79.super_class = (Class)SiriCoreConnectionTCPInfoMetrics;
  v34 = [(SiriCoreConnectionTCPInfoMetrics *)&v79 init];
  if (v34)
  {
    uint64_t v35 = [v24 copy];
    interfaceName = v34->_interfaceName;
    v34->_interfaceName = (NSString *)v35;

    uint64_t v37 = [v26 copy];
    rttCurrent = v34->_rttCurrent;
    v34->_rttCurrent = (NSNumber *)v37;

    uint64_t v39 = [v78 copy];
    rttSmoothed = v34->_rttSmoothed;
    v34->_rttSmoothed = (NSNumber *)v39;

    uint64_t v41 = [v77 copy];
    rttVariance = v34->_rttVariance;
    v34->_rttVariance = (NSNumber *)v41;

    uint64_t v43 = [v76 copy];
    rttBest = v34->_rttBest;
    v34->_rttBest = (NSNumber *)v43;

    uint64_t v45 = [v75 copy];
    packetsSent = v34->_packetsSent;
    v34->_packetsSent = (NSNumber *)v45;

    uint64_t v47 = [v74 copy];
    bytesSent = v34->_bytesSent;
    v34->_bytesSent = (NSNumber *)v47;

    uint64_t v49 = [v73 copy];
    bytesRetransmitted = v34->_bytesRetransmitted;
    v34->_bytesRetransmitted = (NSNumber *)v49;

    uint64_t v51 = [v72 copy];
    bytesUnacked = v34->_bytesUnacked;
    v34->_bytesUnacked = (NSNumber *)v51;

    uint64_t v53 = [v71 copy];
    packetsReceived = v34->_packetsReceived;
    v34->_packetsReceived = (NSNumber *)v53;

    uint64_t v55 = [v27 copy];
    bytesReceived = v34->_bytesReceived;
    v34->_bytesReceived = (NSNumber *)v55;

    uint64_t v57 = [v28 copy];
    duplicateBytesReceived = v34->_duplicateBytesReceived;
    v34->_duplicateBytesReceived = (NSNumber *)v57;

    uint64_t v59 = [v29 copy];
    outOfOrderBytesReceived = v34->_outOfOrderBytesReceived;
    v34->_outOfOrderBytesReceived = (NSNumber *)v59;

    uint64_t v61 = [v30 copy];
    sendBufferBytes = v34->_sendBufferBytes;
    v34->_sendBufferBytes = (NSNumber *)v61;

    uint64_t v63 = [v31 copy];
    sendBandwidth = v34->_sendBandwidth;
    v34->_sendBandwidth = (NSNumber *)v63;

    uint64_t v65 = [v32 copy];
    synRetransmits = v34->_synRetransmits;
    v34->_synRetransmits = (NSNumber *)v65;

    uint64_t v67 = [v33 copy];
    tfoSynDataAcked = v34->_tfoSynDataAcked;
    v34->_tfoSynDataAcked = (NSNumber *)v67;
  }
  return v34;
}

@end