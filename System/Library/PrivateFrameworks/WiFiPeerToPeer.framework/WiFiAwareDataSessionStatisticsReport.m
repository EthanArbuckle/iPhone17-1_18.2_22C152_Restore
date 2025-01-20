@interface WiFiAwareDataSessionStatisticsReport
+ (BOOL)supportsSecureCoding;
- (BOOL)infraRelayOperationStatus;
- (BOOL)isEqual:(id)a3;
- (NSArray)rxFWDelayHistogram;
- (NSArray)rxIPCDelayHistogram;
- (NSArray)rxRSSIHistogram;
- (NSArray)txCCAHistogram;
- (NSArray)txConsecutiveErrorsHistogram;
- (NSArray)txPacketExpiryHistogram;
- (NSNumber)channelSequenceMismatchOn2GCount;
- (NSNumber)channelSequenceMismatchOn5GCount;
- (NSNumber)csaCount;
- (NSNumber)dfsChannelsCount;
- (NSNumber)infraAssocCount;
- (NSNumber)infraDisassocCount;
- (NSNumber)infraRelayRequestersCount;
- (NSNumber)infraScanCount;
- (NSNumber)infrastructureChannel;
- (NSNumber)packetsHOFOn2GCount;
- (NSNumber)packetsNAVOn2GCount;
- (NSNumber)packetsOn2GCount;
- (NSNumber)packetsOn5GCount;
- (NSNumber)packetsOverridenOn5GCount;
- (NSNumber)preferred2GChannelsCount;
- (NSNumber)preferred5GChannelsCount;
- (NSNumber)quietIECount;
- (NSNumber)txChipModeErrorCount;
- (NSNumber)txDroppedCount;
- (NSNumber)txErrorCount;
- (NSNumber)txExpiredCount;
- (NSNumber)txFailedCount;
- (NSNumber)txFirmwareFreePacketCount;
- (NSNumber)txForceLifetimeExpiredCount;
- (NSNumber)txIOErrorCount;
- (NSNumber)txInternalErrorCount;
- (NSNumber)txMaxRetriesCount;
- (NSNumber)txMemoryErrorCount;
- (NSNumber)txNoACKCount;
- (NSNumber)txNoRemotePeerCount;
- (NSNumber)txNoResourcesCount;
- (NSString)countryCode;
- (WiFiAwareDataSessionStatisticsReport)initWithCoder:(id)a3;
- (WiFiAwareDataSessionStatisticsReport)initWithPeerAddress:(id)a3 infrastructureChannel:(id)a4 txCCAHistogram:(id)a5 rxRSSIHistogram:(id)a6 preferred2GChannelsCount:(id)a7 preferred5GChannelsCount:(id)a8 dfsChannelsCount:(id)a9 csaCount:(id)a10 quietIECount:(id)a11 txErrorCount:(id)a12 packetsOn2GCount:(id)a13 packetsNAVOn2GCount:(id)a14 packetsHOFOn2GCount:(id)a15 packetsOn5GCount:(id)a16 packetsOverridenOn5GCount:(id)a17 infraRelayOperationStatus:(BOOL)a18 infraRelayRequestersCount:(id)a19 txExpiredCount:(id)a20 txNoACKCount:(id)a21 txFailedCount:(id)a22 txNoResourcesCount:(id)a23 txIOErrorCount:(id)a24 txMemoryErrorCount:(id)a25 txChipModeErrorCount:(id)a26 txNoRemotePeerCount:(id)a27 txInternalErrorCount:(id)a28 txDroppedCount:(id)a29 txFirmwareFreePacketCount:(id)a30 txMaxRetriesCount:(id)a31 txForceLifetimeExpiredCount:(id)a32 channelSequenceMismatchOn5GCount:(id)a33 channelSequenceMismatchOn2GCount:(id)a34 infraScanCount:(id)a35 infraAssocCount:(id)a36 infraDisassocCount:(id)a37 countryCode:(id)a38 txConsecutiveErrorsHistogram:(id)a39 rxFWDelayHistogram:(id)a40 rxIPCDelayHistogram:(id)a41 txPacketExpiryHistogram:(id)a42;
- (WiFiMACAddress)peerAddress;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelSequenceMismatchOn2GCount:(id)a3;
- (void)setChannelSequenceMismatchOn5GCount:(id)a3;
- (void)setCsaCount:(id)a3;
- (void)setDfsChannelsCount:(id)a3;
- (void)setInfraAssocCount:(id)a3;
- (void)setInfraDisassocCount:(id)a3;
- (void)setInfraRelayOperationStatus:(BOOL)a3;
- (void)setInfraRelayRequestersCount:(id)a3;
- (void)setInfraScanCount:(id)a3;
- (void)setPacketsHOFOn2GCount:(id)a3;
- (void)setPacketsNAVOn2GCount:(id)a3;
- (void)setPacketsOn2GCount:(id)a3;
- (void)setPacketsOn5GCount:(id)a3;
- (void)setPacketsOverridenOn5GCount:(id)a3;
- (void)setPreferred2GChannelsCount:(id)a3;
- (void)setPreferred5GChannelsCount:(id)a3;
- (void)setQuietIECount:(id)a3;
- (void)setRxFWDelayHistogram:(id)a3;
- (void)setRxIPCDelayHistogram:(id)a3;
- (void)setRxRSSIHistogram:(id)a3;
- (void)setTxCCAHistogram:(id)a3;
- (void)setTxChipModeErrorCount:(id)a3;
- (void)setTxConsecutiveErrorsHistogram:(id)a3;
- (void)setTxDroppedCount:(id)a3;
- (void)setTxErrorCount:(id)a3;
- (void)setTxExpiredCount:(id)a3;
- (void)setTxFailedCount:(id)a3;
- (void)setTxFirmwareFreePacketCount:(id)a3;
- (void)setTxForceLifetimeExpiredCount:(id)a3;
- (void)setTxIOErrorCount:(id)a3;
- (void)setTxInternalErrorCount:(id)a3;
- (void)setTxMaxRetriesCount:(id)a3;
- (void)setTxMemoryErrorCount:(id)a3;
- (void)setTxNoACKCount:(id)a3;
- (void)setTxNoRemotePeerCount:(id)a3;
- (void)setTxNoResourcesCount:(id)a3;
- (void)setTxPacketExpiryHistogram:(id)a3;
@end

@implementation WiFiAwareDataSessionStatisticsReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDataSessionStatisticsReport)initWithPeerAddress:(id)a3 infrastructureChannel:(id)a4 txCCAHistogram:(id)a5 rxRSSIHistogram:(id)a6 preferred2GChannelsCount:(id)a7 preferred5GChannelsCount:(id)a8 dfsChannelsCount:(id)a9 csaCount:(id)a10 quietIECount:(id)a11 txErrorCount:(id)a12 packetsOn2GCount:(id)a13 packetsNAVOn2GCount:(id)a14 packetsHOFOn2GCount:(id)a15 packetsOn5GCount:(id)a16 packetsOverridenOn5GCount:(id)a17 infraRelayOperationStatus:(BOOL)a18 infraRelayRequestersCount:(id)a19 txExpiredCount:(id)a20 txNoACKCount:(id)a21 txFailedCount:(id)a22 txNoResourcesCount:(id)a23 txIOErrorCount:(id)a24 txMemoryErrorCount:(id)a25 txChipModeErrorCount:(id)a26 txNoRemotePeerCount:(id)a27 txInternalErrorCount:(id)a28 txDroppedCount:(id)a29 txFirmwareFreePacketCount:(id)a30 txMaxRetriesCount:(id)a31 txForceLifetimeExpiredCount:(id)a32 channelSequenceMismatchOn5GCount:(id)a33 channelSequenceMismatchOn2GCount:(id)a34 infraScanCount:(id)a35 infraAssocCount:(id)a36 infraDisassocCount:(id)a37 countryCode:(id)a38 txConsecutiveErrorsHistogram:(id)a39 rxFWDelayHistogram:(id)a40 rxIPCDelayHistogram:(id)a41 txPacketExpiryHistogram:(id)a42
{
  id v84 = a3;
  id v59 = a4;
  id v83 = a4;
  id v60 = a5;
  id v95 = a5;
  id v61 = a6;
  id v94 = a6;
  id v62 = a7;
  id v93 = a7;
  id v63 = a8;
  id v92 = a8;
  id v91 = a9;
  id v90 = a10;
  id v89 = a11;
  id v88 = a12;
  id v87 = a13;
  id v86 = a14;
  id v85 = a15;
  id v82 = a16;
  id v81 = a17;
  id v80 = a19;
  id v79 = a20;
  id v78 = a21;
  id v77 = a22;
  id v76 = a23;
  id v75 = a24;
  id v74 = a25;
  id v73 = a26;
  id v69 = a27;
  id v68 = a28;
  id v71 = a29;
  id v72 = a30;
  id v47 = a31;
  id v48 = a32;
  id v67 = a33;
  id v66 = a34;
  id v70 = a35;
  id v49 = a36;
  id v65 = a37;
  id v50 = a38;
  id v51 = a39;
  id v52 = a40;
  id v53 = a41;
  id v54 = a42;
  v96.receiver = self;
  v96.super_class = (Class)WiFiAwareDataSessionStatisticsReport;
  v55 = [(WiFiAwareDataSessionStatisticsReport *)&v96 init];
  v56 = v55;
  if (v55)
  {
    objc_storeStrong((id *)&v55->_peerAddress, a3);
    objc_storeStrong((id *)&v56->_infrastructureChannel, v59);
    objc_storeStrong((id *)&v56->_txCCAHistogram, v60);
    objc_storeStrong((id *)&v56->_rxRSSIHistogram, v61);
    objc_storeStrong((id *)&v56->_preferred2GChannelsCount, v62);
    objc_storeStrong((id *)&v56->_preferred5GChannelsCount, v63);
    objc_storeStrong((id *)&v56->_dfsChannelsCount, a9);
    objc_storeStrong((id *)&v56->_preferred2GChannelsCount, v62);
    objc_storeStrong((id *)&v56->_preferred5GChannelsCount, v63);
    objc_storeStrong((id *)&v56->_dfsChannelsCount, a9);
    objc_storeStrong((id *)&v56->_csaCount, a10);
    objc_storeStrong((id *)&v56->_quietIECount, a11);
    objc_storeStrong((id *)&v56->_txErrorCount, a12);
    objc_storeStrong((id *)&v56->_packetsOn2GCount, a13);
    objc_storeStrong((id *)&v56->_packetsNAVOn2GCount, a14);
    objc_storeStrong((id *)&v56->_packetsHOFOn2GCount, a15);
    objc_storeStrong((id *)&v56->_packetsOn5GCount, a16);
    objc_storeStrong((id *)&v56->_packetsOverridenOn5GCount, a17);
    v56->_infraRelayOperationStatus = a18;
    objc_storeStrong((id *)&v56->_infraRelayRequestersCount, a19);
    objc_storeStrong((id *)&v56->_txExpiredCount, a20);
    objc_storeStrong((id *)&v56->_txNoACKCount, a21);
    objc_storeStrong((id *)&v56->_txFailedCount, a22);
    objc_storeStrong((id *)&v56->_txNoResourcesCount, a23);
    objc_storeStrong((id *)&v56->_txIOErrorCount, a24);
    objc_storeStrong((id *)&v56->_txMemoryErrorCount, a25);
    objc_storeStrong((id *)&v56->_txChipModeErrorCount, a26);
    objc_storeStrong((id *)&v56->_txNoRemotePeerCount, a27);
    objc_storeStrong((id *)&v56->_txInternalErrorCount, a28);
    objc_storeStrong((id *)&v56->_txDroppedCount, a29);
    objc_storeStrong((id *)&v56->_txFirmwareFreePacketCount, a30);
    objc_storeStrong((id *)&v56->_txMaxRetriesCount, a31);
    objc_storeStrong((id *)&v56->_txForceLifetimeExpiredCount, a32);
    objc_storeStrong((id *)&v56->_channelSequenceMismatchOn5GCount, a33);
    objc_storeStrong((id *)&v56->_channelSequenceMismatchOn2GCount, a34);
    objc_storeStrong((id *)&v56->_infraScanCount, a35);
    objc_storeStrong((id *)&v56->_infraAssocCount, a36);
    objc_storeStrong((id *)&v56->_infraDisassocCount, a37);
    objc_storeStrong((id *)&v56->_countryCode, a38);
    objc_storeStrong((id *)&v56->_txConsecutiveErrorsHistogram, a39);
    objc_storeStrong((id *)&v56->_rxFWDelayHistogram, a40);
    objc_storeStrong((id *)&v56->_rxIPCDelayHistogram, a41);
    objc_storeStrong((id *)&v56->_txPacketExpiryHistogram, a42);
  }

  return v56;
}

- (WiFiAwareDataSessionStatisticsReport)initWithCoder:(id)a3
{
  v88[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionStatisticsReport *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.peerAddress"];
    peerAddress = v5->_peerAddress;
    v5->_peerAddress = (WiFiMACAddress *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.infrastructureChannel"];
    infrastructureChannel = v5->_infrastructureChannel;
    v5->_infrastructureChannel = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v88[0] = objc_opt_class();
    v88[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.txCCAHistogram"];
    txCCAHistogram = v5->_txCCAHistogram;
    v5->_txCCAHistogram = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.rxRSSIHistogram"];
    rxRSSIHistogram = v5->_rxRSSIHistogram;
    v5->_rxRSSIHistogram = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.preferred2GChannelsCount"];
    preferred2GChannelsCount = v5->_preferred2GChannelsCount;
    v5->_preferred2GChannelsCount = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.preferred5GChannelsCount"];
    preferred5GChannelsCount = v5->_preferred5GChannelsCount;
    v5->_preferred5GChannelsCount = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.dfsChannelsCount"];
    dfsChannelsCount = v5->_dfsChannelsCount;
    v5->_dfsChannelsCount = (NSNumber *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.csaCount"];
    csaCount = v5->_csaCount;
    v5->_csaCount = (NSNumber *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.quietIECount"];
    quietIECount = v5->_quietIECount;
    v5->_quietIECount = (NSNumber *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txErrorCount"];
    txErrorCount = v5->_txErrorCount;
    v5->_txErrorCount = (NSNumber *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOn2GCount"];
    packetsOn2GCount = v5->_packetsOn2GCount;
    v5->_packetsOn2GCount = (NSNumber *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.packetsNAVOn2GCount"];
    packetsNAVOn2GCount = v5->_packetsNAVOn2GCount;
    v5->_packetsNAVOn2GCount = (NSNumber *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.packetsHOFOn2GCount"];
    packetsHOFOn2GCount = v5->_packetsHOFOn2GCount;
    v5->_packetsHOFOn2GCount = (NSNumber *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOn5GCount"];
    packetsOn5GCount = v5->_packetsOn5GCount;
    v5->_packetsOn5GCount = (NSNumber *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOverridenOn5GCount"];
    packetsOverridenOn5GCount = v5->_packetsOverridenOn5GCount;
    v5->_packetsOverridenOn5GCount = (NSNumber *)v37;

    v5->_infraRelayOperationStatus = [v4 decodeBoolForKey:@"WiFiAwareDataSessionStatisticsReport.infraRelayOperationStatus"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.infraRelayRequestersCount"];
    infraRelayRequestersCount = v5->_infraRelayRequestersCount;
    v5->_infraRelayRequestersCount = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txExpiredCount"];
    txExpiredCount = v5->_txExpiredCount;
    v5->_txExpiredCount = (NSNumber *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txNoACKCount"];
    txNoACKCount = v5->_txNoACKCount;
    v5->_txNoACKCount = (NSNumber *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txFailedCount"];
    txFailedCount = v5->_txFailedCount;
    v5->_txFailedCount = (NSNumber *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txNoResourcesCount"];
    txNoResourcesCount = v5->_txNoResourcesCount;
    v5->_txNoResourcesCount = (NSNumber *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txIOErrorCount"];
    txIOErrorCount = v5->_txIOErrorCount;
    v5->_txIOErrorCount = (NSNumber *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txMemoryErrorCount"];
    txMemoryErrorCount = v5->_txMemoryErrorCount;
    v5->_txMemoryErrorCount = (NSNumber *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txChipModeErrorCount"];
    txChipModeErrorCount = v5->_txChipModeErrorCount;
    v5->_txChipModeErrorCount = (NSNumber *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txNoRemotePeerCount"];
    txNoRemotePeerCount = v5->_txNoRemotePeerCount;
    v5->_txNoRemotePeerCount = (NSNumber *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txInternalErrorCount"];
    txInternalErrorCount = v5->_txInternalErrorCount;
    v5->_txInternalErrorCount = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txDroppedCount"];
    txDroppedCount = v5->_txDroppedCount;
    v5->_txDroppedCount = (NSNumber *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txFirmwareFreePacketCount"];
    txFirmwareFreePacketCount = v5->_txFirmwareFreePacketCount;
    v5->_txFirmwareFreePacketCount = (NSNumber *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txMaxRetriesCount"];
    txMaxRetriesCount = v5->_txMaxRetriesCount;
    v5->_txMaxRetriesCount = (NSNumber *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.txForceLifetimeExpiredCount"];
    txForceLifetimeExpiredCount = v5->_txForceLifetimeExpiredCount;
    v5->_txForceLifetimeExpiredCount = (NSNumber *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn5GCount"];
    channelSequenceMismatchOn5GCount = v5->_channelSequenceMismatchOn5GCount;
    v5->_channelSequenceMismatchOn5GCount = (NSNumber *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn2GCount"];
    channelSequenceMismatchOn2GCount = v5->_channelSequenceMismatchOn2GCount;
    v5->_channelSequenceMismatchOn2GCount = (NSNumber *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.infraScanCount"];
    infraScanCount = v5->_infraScanCount;
    v5->_infraScanCount = (NSNumber *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.infraAssocCount"];
    infraAssocCount = v5->_infraAssocCount;
    v5->_infraAssocCount = (NSNumber *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.infraDisassocCount"];
    infraDisassocCount = v5->_infraDisassocCount;
    v5->_infraDisassocCount = (NSNumber *)v75;

    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsReport.countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v77;

    uint64_t v79 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.txConsecutiveErrorsHistogram"];
    txConsecutiveErrorsHistogram = v5->_txConsecutiveErrorsHistogram;
    v5->_txConsecutiveErrorsHistogram = (NSArray *)v79;

    uint64_t v81 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.rxFWDelayHistogram"];
    rxFWDelayHistogram = v5->_rxFWDelayHistogram;
    v5->_rxFWDelayHistogram = (NSArray *)v81;

    uint64_t v83 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.rxIPCDelayHistogram"];
    rxIPCDelayHistogram = v5->_rxIPCDelayHistogram;
    v5->_rxIPCDelayHistogram = (NSArray *)v83;

    uint64_t v85 = [v4 decodeObjectOfClasses:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.txPacketExpiryHistogram"];
    txPacketExpiryHistogram = v5->_txPacketExpiryHistogram;
    v5->_txPacketExpiryHistogram = (NSArray *)v85;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionStatisticsReport *)self peerAddress];
  [v4 encodeObject:v5 forKey:@"WiFiAwareDataSessionStatisticsReport.peerAddress"];

  uint64_t v6 = [(WiFiAwareDataSessionStatisticsReport *)self infrastructureChannel];
  [v4 encodeObject:v6 forKey:@"WiFiAwareDataSessionStatisticsReport.infrastructureChannel"];

  v7 = [(WiFiAwareDataSessionStatisticsReport *)self txCCAHistogram];
  [v4 encodeObject:v7 forKey:@"WiFiAwareDataSessionStatisticsReport.txCCAHistogram"];

  uint64_t v8 = [(WiFiAwareDataSessionStatisticsReport *)self rxRSSIHistogram];
  [v4 encodeObject:v8 forKey:@"WiFiAwareDataSessionStatisticsReport.rxRSSIHistogram"];

  v9 = [(WiFiAwareDataSessionStatisticsReport *)self preferred2GChannelsCount];
  [v4 encodeObject:v9 forKey:@"WiFiAwareDataSessionStatisticsReport.preferred2GChannelsCount"];

  v10 = [(WiFiAwareDataSessionStatisticsReport *)self preferred5GChannelsCount];
  [v4 encodeObject:v10 forKey:@"WiFiAwareDataSessionStatisticsReport.preferred5GChannelsCount"];

  v11 = [(WiFiAwareDataSessionStatisticsReport *)self dfsChannelsCount];
  [v4 encodeObject:v11 forKey:@"WiFiAwareDataSessionStatisticsReport.dfsChannelsCount"];

  v12 = [(WiFiAwareDataSessionStatisticsReport *)self csaCount];
  [v4 encodeObject:v12 forKey:@"WiFiAwareDataSessionStatisticsReport.csaCount"];

  uint64_t v13 = [(WiFiAwareDataSessionStatisticsReport *)self quietIECount];
  [v4 encodeObject:v13 forKey:@"WiFiAwareDataSessionStatisticsReport.quietIECount"];

  v14 = [(WiFiAwareDataSessionStatisticsReport *)self txErrorCount];
  [v4 encodeObject:v14 forKey:@"WiFiAwareDataSessionStatisticsReport.txErrorCount"];

  uint64_t v15 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn2GCount];
  [v4 encodeObject:v15 forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOn2GCount"];

  v16 = [(WiFiAwareDataSessionStatisticsReport *)self packetsNAVOn2GCount];
  [v4 encodeObject:v16 forKey:@"WiFiAwareDataSessionStatisticsReport.packetsNAVOn2GCount"];

  uint64_t v17 = [(WiFiAwareDataSessionStatisticsReport *)self packetsHOFOn2GCount];
  [v4 encodeObject:v17 forKey:@"WiFiAwareDataSessionStatisticsReport.packetsHOFOn2GCount"];

  v18 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn5GCount];
  [v4 encodeObject:v18 forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOn5GCount"];

  uint64_t v19 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOverridenOn5GCount];
  [v4 encodeObject:v19 forKey:@"WiFiAwareDataSessionStatisticsReport.packetsOverridenOn5GCount"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwareDataSessionStatisticsReport infraRelayOperationStatus](self, "infraRelayOperationStatus"), @"WiFiAwareDataSessionStatisticsReport.infraRelayOperationStatus");
  v20 = [(WiFiAwareDataSessionStatisticsReport *)self infraRelayRequestersCount];
  [v4 encodeObject:v20 forKey:@"WiFiAwareDataSessionStatisticsReport.infraRelayRequestersCount"];

  uint64_t v21 = [(WiFiAwareDataSessionStatisticsReport *)self txExpiredCount];
  [v4 encodeObject:v21 forKey:@"WiFiAwareDataSessionStatisticsReport.txExpiredCount"];

  v22 = [(WiFiAwareDataSessionStatisticsReport *)self txNoACKCount];
  [v4 encodeObject:v22 forKey:@"WiFiAwareDataSessionStatisticsReport.txNoACKCount"];

  uint64_t v23 = [(WiFiAwareDataSessionStatisticsReport *)self txFailedCount];
  [v4 encodeObject:v23 forKey:@"WiFiAwareDataSessionStatisticsReport.txFailedCount"];

  v24 = [(WiFiAwareDataSessionStatisticsReport *)self txNoResourcesCount];
  [v4 encodeObject:v24 forKey:@"WiFiAwareDataSessionStatisticsReport.txNoResourcesCount"];

  uint64_t v25 = [(WiFiAwareDataSessionStatisticsReport *)self txIOErrorCount];
  [v4 encodeObject:v25 forKey:@"WiFiAwareDataSessionStatisticsReport.txIOErrorCount"];

  v26 = [(WiFiAwareDataSessionStatisticsReport *)self txMemoryErrorCount];
  [v4 encodeObject:v26 forKey:@"WiFiAwareDataSessionStatisticsReport.txMemoryErrorCount"];

  uint64_t v27 = [(WiFiAwareDataSessionStatisticsReport *)self txChipModeErrorCount];
  [v4 encodeObject:v27 forKey:@"WiFiAwareDataSessionStatisticsReport.txChipModeErrorCount"];

  v28 = [(WiFiAwareDataSessionStatisticsReport *)self txNoRemotePeerCount];
  [v4 encodeObject:v28 forKey:@"WiFiAwareDataSessionStatisticsReport.txNoRemotePeerCount"];

  uint64_t v29 = [(WiFiAwareDataSessionStatisticsReport *)self txInternalErrorCount];
  [v4 encodeObject:v29 forKey:@"WiFiAwareDataSessionStatisticsReport.txInternalErrorCount"];

  v30 = [(WiFiAwareDataSessionStatisticsReport *)self txDroppedCount];
  [v4 encodeObject:v30 forKey:@"WiFiAwareDataSessionStatisticsReport.txDroppedCount"];

  uint64_t v31 = [(WiFiAwareDataSessionStatisticsReport *)self txFirmwareFreePacketCount];
  [v4 encodeObject:v31 forKey:@"WiFiAwareDataSessionStatisticsReport.txFirmwareFreePacketCount"];

  v32 = [(WiFiAwareDataSessionStatisticsReport *)self txMaxRetriesCount];
  [v4 encodeObject:v32 forKey:@"WiFiAwareDataSessionStatisticsReport.txMaxRetriesCount"];

  uint64_t v33 = [(WiFiAwareDataSessionStatisticsReport *)self txForceLifetimeExpiredCount];
  [v4 encodeObject:v33 forKey:@"WiFiAwareDataSessionStatisticsReport.txForceLifetimeExpiredCount"];

  v34 = [(WiFiAwareDataSessionStatisticsReport *)self channelSequenceMismatchOn5GCount];
  [v4 encodeObject:v34 forKey:@"WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn5GCount"];

  uint64_t v35 = [(WiFiAwareDataSessionStatisticsReport *)self channelSequenceMismatchOn2GCount];
  [v4 encodeObject:v35 forKey:@"WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn2GCount"];

  v36 = [(WiFiAwareDataSessionStatisticsReport *)self infraScanCount];
  [v4 encodeObject:v36 forKey:@"WiFiAwareDataSessionStatisticsReport.infraScanCount"];

  uint64_t v37 = [(WiFiAwareDataSessionStatisticsReport *)self infraAssocCount];
  [v4 encodeObject:v37 forKey:@"WiFiAwareDataSessionStatisticsReport.infraAssocCount"];

  v38 = [(WiFiAwareDataSessionStatisticsReport *)self infraDisassocCount];
  [v4 encodeObject:v38 forKey:@"WiFiAwareDataSessionStatisticsReport.infraDisassocCount"];

  uint64_t v39 = [(WiFiAwareDataSessionStatisticsReport *)self countryCode];
  [v4 encodeObject:v39 forKey:@"WiFiAwareDataSessionStatisticsReport.countryCode"];

  v40 = [(WiFiAwareDataSessionStatisticsReport *)self txConsecutiveErrorsHistogram];
  [v4 encodeObject:v40 forKey:@"WiFiAwareDataSessionStatisticsReport.txConsecutiveErrorsHistogram"];

  uint64_t v41 = [(WiFiAwareDataSessionStatisticsReport *)self rxFWDelayHistogram];
  [v4 encodeObject:v41 forKey:@"WiFiAwareDataSessionStatisticsReport.rxFWDelayHistogram"];

  v42 = [(WiFiAwareDataSessionStatisticsReport *)self rxIPCDelayHistogram];
  [v4 encodeObject:v42 forKey:@"WiFiAwareDataSessionStatisticsReport.rxIPCDelayHistogram"];

  id v43 = [(WiFiAwareDataSessionStatisticsReport *)self txPacketExpiryHistogram];
  [v4 encodeObject:v43 forKey:@"WiFiAwareDataSessionStatisticsReport.txPacketExpiryHistogram"];
}

- (id)description
{
  uint64_t v19 = NSString;
  v18 = [(WiFiAwareDataSessionStatisticsReport *)self peerAddress];
  uint64_t v17 = [(WiFiAwareDataSessionStatisticsReport *)self infrastructureChannel];
  v22 = [(WiFiAwareDataSessionStatisticsReport *)self preferred2GChannelsCount];
  v16 = [(WiFiAwareDataSessionStatisticsReport *)self preferred5GChannelsCount];
  uint64_t v21 = [(WiFiAwareDataSessionStatisticsReport *)self dfsChannelsCount];
  uint64_t v15 = [(WiFiAwareDataSessionStatisticsReport *)self csaCount];
  uint64_t v13 = [(WiFiAwareDataSessionStatisticsReport *)self quietIECount];
  v12 = [(WiFiAwareDataSessionStatisticsReport *)self txErrorCount];
  v14 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn2GCount];
  v11 = [(WiFiAwareDataSessionStatisticsReport *)self packetsNAVOn2GCount];
  v10 = [(WiFiAwareDataSessionStatisticsReport *)self packetsHOFOn2GCount];
  v3 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn5GCount];
  id v4 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOverridenOn5GCount];
  BOOL v5 = [(WiFiAwareDataSessionStatisticsReport *)self infraRelayOperationStatus];
  uint64_t v6 = [(WiFiAwareDataSessionStatisticsReport *)self infraRelayRequestersCount];
  v7 = [(WiFiAwareDataSessionStatisticsReport *)self txCCAHistogram];
  uint64_t v8 = [(WiFiAwareDataSessionStatisticsReport *)self rxRSSIHistogram];
  objc_msgSend(v19, "stringWithFormat:", @"<WiFiAwareDataSessionStatisticsReport peerAddress=%@, infrastructureChannel=%@, preferred2GChannelsCount=%@, preferred5GChannelsCount=%@, dfsChannelsCount=%@, csaCount=%@, quietIECount=%@, txErrorCount=%@, packetsOn2GCount=%@, packetsNAVOn2GCount=%@, packetsHOFOn2GCount=%@, packetsOn5GCount=%@, packetsOverridenOn5GCount=%@>, infraRelayOperationStatus=%d, infraRelayRequestersCount=%@\ntxCCA=\n%@\nrxRSSI=%@\n", v18, v17, v22, v16, v21, v15, v13, v12, v14, v11, v10, v3, v4, v5, v6, v7,
  v20 = v8);

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareDataSessionStatisticsReport *)a3;
  if (self == v4)
  {
    BOOL v5 = 0;
LABEL_100:
    BOOL v32 = 1;
    goto LABEL_105;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = v4;
    uint64_t v6 = [(WiFiAwareDataSessionStatisticsReport *)self peerAddress];
    id v154 = [(WiFiAwareDataSessionStatisticsReport *)v5 peerAddress];
    id v155 = v6;
    int v153 = [v6 isEqual:v154];
    if (v153)
    {
      uint64_t v8 = [(WiFiAwareDataSessionStatisticsReport *)self infrastructureChannel];
      v141 = [(WiFiAwareDataSessionStatisticsReport *)v5 infrastructureChannel];
      v142 = v8;
      if ([v8 isEqual:v141])
      {
        v9 = [(WiFiAwareDataSessionStatisticsReport *)self preferred2GChannelsCount];
        v139 = [(WiFiAwareDataSessionStatisticsReport *)v5 preferred2GChannelsCount];
        v140 = v9;
        if ([v9 isEqual:v139])
        {
          v10 = [(WiFiAwareDataSessionStatisticsReport *)self preferred5GChannelsCount];
          [(WiFiAwareDataSessionStatisticsReport *)v5 preferred5GChannelsCount];
          v137 = v138 = v10;
          if (objc_msgSend(v10, "isEqual:"))
          {
            v11 = [(WiFiAwareDataSessionStatisticsReport *)self dfsChannelsCount];
            [(WiFiAwareDataSessionStatisticsReport *)v5 dfsChannelsCount];
            v135 = v136 = v11;
            if (objc_msgSend(v11, "isEqual:"))
            {
              v12 = [(WiFiAwareDataSessionStatisticsReport *)self csaCount];
              [(WiFiAwareDataSessionStatisticsReport *)v5 csaCount];
              v133 = v134 = v12;
              if (objc_msgSend(v12, "isEqual:"))
              {
                uint64_t v13 = [(WiFiAwareDataSessionStatisticsReport *)self quietIECount];
                [(WiFiAwareDataSessionStatisticsReport *)v5 quietIECount];
                v131 = v132 = v13;
                if (objc_msgSend(v13, "isEqual:"))
                {
                  v14 = [(WiFiAwareDataSessionStatisticsReport *)self txErrorCount];
                  v129 = [(WiFiAwareDataSessionStatisticsReport *)v5 txErrorCount];
                  v130 = v14;
                  if ([v14 isEqual:v129])
                  {
                    uint64_t v15 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn2GCount];
                    v127 = [(WiFiAwareDataSessionStatisticsReport *)v5 packetsOn2GCount];
                    v128 = v15;
                    if ([v15 isEqual:v127])
                    {
                      v16 = [(WiFiAwareDataSessionStatisticsReport *)self packetsNAVOn2GCount];
                      v125 = [(WiFiAwareDataSessionStatisticsReport *)v5 packetsNAVOn2GCount];
                      v126 = v16;
                      if ([v16 isEqual:v125])
                      {
                        uint64_t v17 = [(WiFiAwareDataSessionStatisticsReport *)self packetsHOFOn2GCount];
                        v123 = [(WiFiAwareDataSessionStatisticsReport *)v5 packetsHOFOn2GCount];
                        v124 = v17;
                        if ([v17 isEqual:v123])
                        {
                          v18 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOn5GCount];
                          v121 = [(WiFiAwareDataSessionStatisticsReport *)v5 packetsOn5GCount];
                          v122 = v18;
                          if ([v18 isEqual:v121])
                          {
                            uint64_t v19 = [(WiFiAwareDataSessionStatisticsReport *)self packetsOverridenOn5GCount];
                            v119 = [(WiFiAwareDataSessionStatisticsReport *)v5 packetsOverridenOn5GCount];
                            v120 = v19;
                            if ([v19 isEqual:v119])
                            {
                              v20 = [(WiFiAwareDataSessionStatisticsReport *)self txCCAHistogram];
                              v117 = [(WiFiAwareDataSessionStatisticsReport *)v5 txCCAHistogram];
                              v118 = v20;
                              if ([v20 isEqual:v117])
                              {
                                uint64_t v21 = [(WiFiAwareDataSessionStatisticsReport *)self rxRSSIHistogram];
                                v115 = [(WiFiAwareDataSessionStatisticsReport *)v5 rxRSSIHistogram];
                                v116 = v21;
                                if ([v21 isEqual:v115]
                                  && (BOOL v22 = [(WiFiAwareDataSessionStatisticsReport *)self infraRelayOperationStatus], v22 == [(WiFiAwareDataSessionStatisticsReport *)v5 infraRelayOperationStatus]))
                                {
                                  v42 = [(WiFiAwareDataSessionStatisticsReport *)self infraRelayRequestersCount];
                                  v113 = [(WiFiAwareDataSessionStatisticsReport *)v5 infraRelayRequestersCount];
                                  v114 = v42;
                                  if ([v42 isEqual:v113])
                                  {
                                    id v43 = [(WiFiAwareDataSessionStatisticsReport *)self txExpiredCount];
                                    v111 = [(WiFiAwareDataSessionStatisticsReport *)v5 txExpiredCount];
                                    v112 = v43;
                                    if ([v43 isEqual:v111])
                                    {
                                      v44 = [(WiFiAwareDataSessionStatisticsReport *)self txNoACKCount];
                                      v109 = [(WiFiAwareDataSessionStatisticsReport *)v5 txNoACKCount];
                                      v110 = v44;
                                      if ([v44 isEqual:v109])
                                      {
                                        uint64_t v45 = [(WiFiAwareDataSessionStatisticsReport *)self txFailedCount];
                                        v107 = [(WiFiAwareDataSessionStatisticsReport *)v5 txFailedCount];
                                        v108 = v45;
                                        if ([v45 isEqual:v107])
                                        {
                                          v46 = [(WiFiAwareDataSessionStatisticsReport *)self txNoResourcesCount];
                                          v105 = [(WiFiAwareDataSessionStatisticsReport *)v5 txNoResourcesCount];
                                          v106 = v46;
                                          if ([v46 isEqual:v105])
                                          {
                                            uint64_t v47 = [(WiFiAwareDataSessionStatisticsReport *)self txIOErrorCount];
                                            v103 = [(WiFiAwareDataSessionStatisticsReport *)v5 txIOErrorCount];
                                            v104 = v47;
                                            if ([v47 isEqual:v103])
                                            {
                                              id v48 = [(WiFiAwareDataSessionStatisticsReport *)self txMemoryErrorCount];
                                              v101 = [(WiFiAwareDataSessionStatisticsReport *)v5 txMemoryErrorCount];
                                              v102 = v48;
                                              if ([v48 isEqual:v101])
                                              {
                                                uint64_t v49 = [(WiFiAwareDataSessionStatisticsReport *)self txChipModeErrorCount];
                                                v99 = [(WiFiAwareDataSessionStatisticsReport *)v5 txChipModeErrorCount];
                                                v100 = v49;
                                                if ([v49 isEqual:v99])
                                                {
                                                  id v50 = [(WiFiAwareDataSessionStatisticsReport *)self txNoRemotePeerCount];
                                                  v97 = [(WiFiAwareDataSessionStatisticsReport *)v5 txNoRemotePeerCount];
                                                  v98 = v50;
                                                  if ([v50 isEqual:v97])
                                                  {
                                                    uint64_t v51 = [(WiFiAwareDataSessionStatisticsReport *)self txInternalErrorCount];
                                                    id v95 = [(WiFiAwareDataSessionStatisticsReport *)v5 txInternalErrorCount];
                                                    objc_super v96 = v51;
                                                    if ([v51 isEqual:v95])
                                                    {
                                                      id v52 = [(WiFiAwareDataSessionStatisticsReport *)self txDroppedCount];
                                                      id v93 = [(WiFiAwareDataSessionStatisticsReport *)v5 txDroppedCount];
                                                      id v94 = v52;
                                                      if ([v52 isEqual:v93])
                                                      {
                                                        uint64_t v53 = [(WiFiAwareDataSessionStatisticsReport *)self txFirmwareFreePacketCount];
                                                        id v91 = [(WiFiAwareDataSessionStatisticsReport *)v5 txFirmwareFreePacketCount];
                                                        id v92 = v53;
                                                        if ([v53 isEqual:v91])
                                                        {
                                                          id v54 = [(WiFiAwareDataSessionStatisticsReport *)self txMaxRetriesCount];
                                                          id v89 = [(WiFiAwareDataSessionStatisticsReport *)v5 txMaxRetriesCount];
                                                          id v90 = v54;
                                                          if ([v54 isEqual:v89])
                                                          {
                                                            uint64_t v55 = [(WiFiAwareDataSessionStatisticsReport *)self txForceLifetimeExpiredCount];
                                                            id v87 = [(WiFiAwareDataSessionStatisticsReport *)v5 txForceLifetimeExpiredCount];
                                                            id v88 = v55;
                                                            if ([v55 isEqual:v87])
                                                            {
                                                              v56 = [(WiFiAwareDataSessionStatisticsReport *)self channelSequenceMismatchOn5GCount];
                                                              uint64_t v85 = [(WiFiAwareDataSessionStatisticsReport *)v5 channelSequenceMismatchOn5GCount];
                                                              id v86 = v56;
                                                              if ([v56 isEqual:v85])
                                                              {
                                                                uint64_t v57 = [(WiFiAwareDataSessionStatisticsReport *)self channelSequenceMismatchOn2GCount];
                                                                uint64_t v83 = [(WiFiAwareDataSessionStatisticsReport *)v5 channelSequenceMismatchOn2GCount];
                                                                id v84 = v57;
                                                                if ([v57 isEqual:v83])
                                                                {
                                                                  v58 = [(WiFiAwareDataSessionStatisticsReport *)self infraScanCount];
                                                                  uint64_t v81 = [(WiFiAwareDataSessionStatisticsReport *)v5 infraScanCount];
                                                                  id v82 = v58;
                                                                  if ([v58 isEqual:v81])
                                                                  {
                                                                    uint64_t v59 = [(WiFiAwareDataSessionStatisticsReport *)self infraAssocCount];
                                                                    uint64_t v79 = [(WiFiAwareDataSessionStatisticsReport *)v5 infraAssocCount];
                                                                    id v80 = v59;
                                                                    if ([v59 isEqual:v79])
                                                                    {
                                                                      id v60 = [(WiFiAwareDataSessionStatisticsReport *)self infraDisassocCount];
                                                                      uint64_t v77 = [(WiFiAwareDataSessionStatisticsReport *)v5 infraDisassocCount];
                                                                      id v78 = v60;
                                                                      if ([v60 isEqual:v77])
                                                                      {
                                                                        uint64_t v61 = [(WiFiAwareDataSessionStatisticsReport *)self countryCode];
                                                                        uint64_t v75 = [(WiFiAwareDataSessionStatisticsReport *)v5 countryCode];
                                                                        id v76 = v61;
                                                                        if ([v61 isEqual:v75])
                                                                        {
                                                                          id v62 = [(WiFiAwareDataSessionStatisticsReport *)self txConsecutiveErrorsHistogram];
                                                                          uint64_t v73 = [(WiFiAwareDataSessionStatisticsReport *)v5 txConsecutiveErrorsHistogram];
                                                                          id v74 = v62;
                                                                          if ([v62 isEqual:v73])
                                                                          {
                                                                            uint64_t v63 = [(WiFiAwareDataSessionStatisticsReport *)self rxFWDelayHistogram];
                                                                            uint64_t v71 = [(WiFiAwareDataSessionStatisticsReport *)v5 rxFWDelayHistogram];
                                                                            id v72 = v63;
                                                                            if ([v63 isEqual:v71])
                                                                            {
                                                                              v64 = [(WiFiAwareDataSessionStatisticsReport *)self rxIPCDelayHistogram];
                                                                              uint64_t v69 = [(WiFiAwareDataSessionStatisticsReport *)v5 rxIPCDelayHistogram];
                                                                              id v70 = v64;
                                                                              if ([v64 isEqual:v69])
                                                                              {
                                                                                uint64_t v65 = [(WiFiAwareDataSessionStatisticsReport *)self txPacketExpiryHistogram];
                                                                                uint64_t v66 = [(WiFiAwareDataSessionStatisticsReport *)v5 txPacketExpiryHistogram];
                                                                                id v68 = v65;
                                                                                int v67 = [v65 isEqual:v66];
                                                                                v7 = (void *)v66;
                                                                                int v28 = 1;
                                                                                LODWORD(v152[3]) = 1;
                                                                                HIDWORD(v152[3]) = v67;
                                                                              }
                                                                              else
                                                                              {
                                                                                int v28 = 0;
                                                                                v152[3] = 1;
                                                                              }
                                                                              v152[2] = 0x100000001;
                                                                              v152[1] = 0x100000001;
                                                                              int v29 = 1;
                                                                              v152[0] = 0x100000001;
                                                                              int v30 = 1;
                                                                              int v31 = 1;
                                                                              uint64_t v150 = 0x100000001;
                                                                              *(_DWORD *)&v149[8] = 1;
                                                                              *(void *)&long long v147 = 0x100000001;
                                                                              uint64_t v148 = 0x100000001;
                                                                              *((void *)&v147 + 1) = 0x100000001;
                                                                              uint64_t v145 = 0x100000001;
                                                                              uint64_t v144 = 0x100000001;
                                                                              *((void *)&v143 + 1) = 0x100000001;
                                                                              *(void *)&long long v143 = 0x100000001;
                                                                              int v146 = 1;
                                                                              *(void *)v149 = 0x100000001;
                                                                              int v151 = 1;
                                                                              int v23 = 1;
                                                                              int v24 = 1;
                                                                              int v25 = 1;
                                                                              int v26 = 1;
                                                                              int v27 = 1;
                                                                            }
                                                                            else
                                                                            {
                                                                              int v27 = 0;
                                                                              int v28 = 0;
                                                                              v152[3] = 1;
                                                                              v152[2] = 0x100000001;
                                                                              v152[1] = 0x100000001;
                                                                              int v29 = 1;
                                                                              v152[0] = 0x100000001;
                                                                              int v30 = 1;
                                                                              int v31 = 1;
                                                                              uint64_t v150 = 0x100000001;
                                                                              *(_DWORD *)&v149[8] = 1;
                                                                              *(void *)&long long v147 = 0x100000001;
                                                                              uint64_t v148 = 0x100000001;
                                                                              *((void *)&v147 + 1) = 0x100000001;
                                                                              uint64_t v145 = 0x100000001;
                                                                              uint64_t v144 = 0x100000001;
                                                                              *((void *)&v143 + 1) = 0x100000001;
                                                                              *(void *)&long long v143 = 0x100000001;
                                                                              int v146 = 1;
                                                                              *(void *)v149 = 0x100000001;
                                                                              int v151 = 1;
                                                                              int v23 = 1;
                                                                              int v24 = 1;
                                                                              int v25 = 1;
                                                                              int v26 = 1;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            int v26 = 0;
                                                                            int v27 = 0;
                                                                            int v28 = 0;
                                                                            v152[3] = 1;
                                                                            v152[2] = 0x100000001;
                                                                            v152[1] = 0x100000001;
                                                                            int v29 = 1;
                                                                            v152[0] = 0x100000001;
                                                                            int v30 = 1;
                                                                            int v31 = 1;
                                                                            uint64_t v150 = 0x100000001;
                                                                            *(_DWORD *)&v149[8] = 1;
                                                                            *(void *)&long long v147 = 0x100000001;
                                                                            uint64_t v148 = 0x100000001;
                                                                            *((void *)&v147 + 1) = 0x100000001;
                                                                            uint64_t v145 = 0x100000001;
                                                                            uint64_t v144 = 0x100000001;
                                                                            *((void *)&v143 + 1) = 0x100000001;
                                                                            *(void *)&long long v143 = 0x100000001;
                                                                            int v146 = 1;
                                                                            *(void *)v149 = 0x100000001;
                                                                            int v151 = 1;
                                                                            int v23 = 1;
                                                                            int v24 = 1;
                                                                            int v25 = 1;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          int v25 = 0;
                                                                          int v26 = 0;
                                                                          int v27 = 0;
                                                                          int v28 = 0;
                                                                          v152[3] = 1;
                                                                          v152[2] = 0x100000001;
                                                                          v152[1] = 0x100000001;
                                                                          int v29 = 1;
                                                                          v152[0] = 0x100000001;
                                                                          int v30 = 1;
                                                                          int v31 = 1;
                                                                          uint64_t v150 = 0x100000001;
                                                                          *(_DWORD *)&v149[8] = 1;
                                                                          *(void *)&long long v147 = 0x100000001;
                                                                          uint64_t v148 = 0x100000001;
                                                                          *((void *)&v147 + 1) = 0x100000001;
                                                                          uint64_t v145 = 0x100000001;
                                                                          uint64_t v144 = 0x100000001;
                                                                          *((void *)&v143 + 1) = 0x100000001;
                                                                          *(void *)&long long v143 = 0x100000001;
                                                                          int v146 = 1;
                                                                          *(void *)v149 = 0x100000001;
                                                                          int v151 = 1;
                                                                          int v23 = 1;
                                                                          int v24 = 1;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v24 = 0;
                                                                        int v25 = 0;
                                                                        int v26 = 0;
                                                                        int v27 = 0;
                                                                        int v28 = 0;
                                                                        v152[3] = 1;
                                                                        v152[2] = 0x100000001;
                                                                        v152[1] = 0x100000001;
                                                                        int v29 = 1;
                                                                        v152[0] = 0x100000001;
                                                                        int v30 = 1;
                                                                        int v31 = 1;
                                                                        uint64_t v150 = 0x100000001;
                                                                        *(_DWORD *)&v149[8] = 1;
                                                                        *(void *)&long long v147 = 0x100000001;
                                                                        uint64_t v148 = 0x100000001;
                                                                        *((void *)&v147 + 1) = 0x100000001;
                                                                        uint64_t v145 = 0x100000001;
                                                                        uint64_t v144 = 0x100000001;
                                                                        *((void *)&v143 + 1) = 0x100000001;
                                                                        *(void *)&long long v143 = 0x100000001;
                                                                        int v146 = 1;
                                                                        *(void *)v149 = 0x100000001;
                                                                        int v151 = 1;
                                                                        int v23 = 1;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      int v23 = 0;
                                                                      int v24 = 0;
                                                                      int v25 = 0;
                                                                      int v26 = 0;
                                                                      int v27 = 0;
                                                                      int v28 = 0;
                                                                      HIDWORD(v152[3]) = 0;
                                                                      LODWORD(v152[2]) = 1;
                                                                      *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                                      v152[1] = 0x100000001;
                                                                      int v29 = 1;
                                                                      v152[0] = 0x100000001;
                                                                      int v30 = 1;
                                                                      int v31 = 1;
                                                                      uint64_t v150 = 0x100000001;
                                                                      *(_DWORD *)&v149[8] = 1;
                                                                      *(void *)&long long v147 = 0x100000001;
                                                                      uint64_t v148 = 0x100000001;
                                                                      *((void *)&v147 + 1) = 0x100000001;
                                                                      uint64_t v145 = 0x100000001;
                                                                      uint64_t v144 = 0x100000001;
                                                                      *((void *)&v143 + 1) = 0x100000001;
                                                                      *(void *)&long long v143 = 0x100000001;
                                                                      int v146 = 1;
                                                                      *(void *)v149 = 0x100000001;
                                                                      int v151 = 1;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v23 = 0;
                                                                    int v24 = 0;
                                                                    int v25 = 0;
                                                                    int v26 = 0;
                                                                    int v27 = 0;
                                                                    int v28 = 0;
                                                                    HIDWORD(v152[3]) = 0;
                                                                    LODWORD(v152[2]) = 1;
                                                                    *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                                    v152[1] = 0x100000001;
                                                                    int v29 = 1;
                                                                    int v30 = 1;
                                                                    int v31 = 1;
                                                                    int v151 = 0;
                                                                    v152[0] = 0x100000001;
                                                                    *(_DWORD *)&v149[8] = 1;
                                                                    *(void *)&long long v147 = 0x100000001;
                                                                    uint64_t v148 = 0x100000001;
                                                                    *((void *)&v147 + 1) = 0x100000001;
                                                                    uint64_t v145 = 0x100000001;
                                                                    uint64_t v144 = 0x100000001;
                                                                    *((void *)&v143 + 1) = 0x100000001;
                                                                    *(void *)&long long v143 = 0x100000001;
                                                                    int v146 = 1;
                                                                    *(void *)v149 = 0x100000001;
                                                                    uint64_t v150 = 0x100000001;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  int v23 = 0;
                                                                  int v24 = 0;
                                                                  int v25 = 0;
                                                                  int v26 = 0;
                                                                  int v27 = 0;
                                                                  int v28 = 0;
                                                                  HIDWORD(v152[3]) = 0;
                                                                  LODWORD(v152[2]) = 1;
                                                                  *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                                  v152[1] = 0x100000001;
                                                                  int v29 = 1;
                                                                  int v30 = 1;
                                                                  int v31 = 1;
                                                                  int v151 = 0;
                                                                  v152[0] = 0x100000001;
                                                                  uint64_t v150 = 0x100000000;
                                                                  *(_DWORD *)&v149[8] = 1;
                                                                  *(void *)&long long v147 = 0x100000001;
                                                                  uint64_t v148 = 0x100000001;
                                                                  *((void *)&v147 + 1) = 0x100000001;
                                                                  uint64_t v145 = 0x100000001;
                                                                  uint64_t v144 = 0x100000001;
                                                                  *((void *)&v143 + 1) = 0x100000001;
                                                                  *(void *)&long long v143 = 0x100000001;
                                                                  int v146 = 1;
                                                                  *(void *)v149 = 0x100000001;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v23 = 0;
                                                                int v24 = 0;
                                                                int v25 = 0;
                                                                int v26 = 0;
                                                                int v27 = 0;
                                                                int v28 = 0;
                                                                HIDWORD(v152[3]) = 0;
                                                                LODWORD(v152[2]) = 1;
                                                                *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                                v152[1] = 0x100000001;
                                                                int v29 = 1;
                                                                int v30 = 1;
                                                                int v31 = 1;
                                                                int v151 = 0;
                                                                v152[0] = 0x100000001;
                                                                uint64_t v150 = 0x100000000;
                                                                *(_DWORD *)&v149[8] = 1;
                                                                *(void *)&long long v147 = 0x100000001;
                                                                uint64_t v148 = 0x100000001;
                                                                *((void *)&v147 + 1) = 0x100000001;
                                                                uint64_t v145 = 0x100000001;
                                                                uint64_t v144 = 0x100000001;
                                                                *((void *)&v143 + 1) = 0x100000001;
                                                                *(void *)&long long v143 = 0x100000001;
                                                                int v146 = 1;
                                                                *(void *)v149 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              *(void *)v149 = 0;
                                                              int v23 = 0;
                                                              int v24 = 0;
                                                              int v25 = 0;
                                                              int v26 = 0;
                                                              int v27 = 0;
                                                              int v28 = 0;
                                                              HIDWORD(v152[3]) = 0;
                                                              LODWORD(v152[2]) = 1;
                                                              *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                              v152[1] = 0x100000001;
                                                              int v29 = 1;
                                                              int v30 = 1;
                                                              int v31 = 1;
                                                              int v151 = 0;
                                                              v152[0] = 0x100000001;
                                                              uint64_t v150 = 0x100000000;
                                                              *(_DWORD *)&v149[8] = 1;
                                                              *(void *)&long long v147 = 0x100000001;
                                                              *((void *)&v147 + 1) = 0x100000001;
                                                              uint64_t v145 = 0x100000001;
                                                              uint64_t v144 = 0x100000001;
                                                              *((void *)&v143 + 1) = 0x100000001;
                                                              *(void *)&long long v143 = 0x100000001;
                                                              int v146 = 1;
                                                              uint64_t v148 = 0x100000001;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            *(void *)v149 = 0;
                                                            int v23 = 0;
                                                            int v24 = 0;
                                                            int v25 = 0;
                                                            int v26 = 0;
                                                            int v27 = 0;
                                                            int v28 = 0;
                                                            HIDWORD(v152[3]) = 0;
                                                            LODWORD(v152[2]) = 1;
                                                            *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                            v152[1] = 0x100000001;
                                                            int v29 = 1;
                                                            int v30 = 1;
                                                            int v31 = 1;
                                                            int v151 = 0;
                                                            v152[0] = 0x100000001;
                                                            uint64_t v150 = 0x100000000;
                                                            *(_DWORD *)&v149[8] = 1;
                                                            LODWORD(v147) = 1;
                                                            *(void *)((char *)&v147 + 4) = 0x100000001;
                                                            uint64_t v148 = 0x100000000;
                                                            HIDWORD(v147) = 1;
                                                            uint64_t v145 = 0x100000001;
                                                            uint64_t v144 = 0x100000001;
                                                            *((void *)&v143 + 1) = 0x100000001;
                                                            *(void *)&long long v143 = 0x100000001;
                                                            int v146 = 1;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          *((void *)&v147 + 1) = 0x100000000;
                                                          *(void *)v149 = 0;
                                                          int v23 = 0;
                                                          int v24 = 0;
                                                          int v25 = 0;
                                                          int v26 = 0;
                                                          int v27 = 0;
                                                          int v28 = 0;
                                                          HIDWORD(v152[3]) = 0;
                                                          LODWORD(v152[2]) = 1;
                                                          *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                          v152[1] = 0x100000001;
                                                          int v29 = 1;
                                                          int v30 = 1;
                                                          int v31 = 1;
                                                          int v151 = 0;
                                                          v152[0] = 0x100000001;
                                                          uint64_t v150 = 0x100000000;
                                                          *(_DWORD *)&v149[8] = 1;
                                                          *(void *)&long long v147 = 0x100000001;
                                                          uint64_t v148 = 0x100000000;
                                                          uint64_t v145 = 0x100000001;
                                                          uint64_t v144 = 0x100000001;
                                                          *((void *)&v143 + 1) = 0x100000001;
                                                          *(void *)&long long v143 = 0x100000001;
                                                          int v146 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v146 = 0;
                                                        *((void *)&v147 + 1) = 0x100000000;
                                                        *(void *)v149 = 0;
                                                        int v23 = 0;
                                                        int v24 = 0;
                                                        int v25 = 0;
                                                        int v26 = 0;
                                                        int v27 = 0;
                                                        int v28 = 0;
                                                        HIDWORD(v152[3]) = 0;
                                                        LODWORD(v152[2]) = 1;
                                                        *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                        v152[1] = 0x100000001;
                                                        int v29 = 1;
                                                        int v30 = 1;
                                                        int v31 = 1;
                                                        int v151 = 0;
                                                        v152[0] = 0x100000001;
                                                        uint64_t v150 = 0x100000000;
                                                        *(_DWORD *)&v149[8] = 1;
                                                        *(void *)&long long v147 = 0x100000001;
                                                        uint64_t v148 = 0x100000000;
                                                        uint64_t v144 = 0x100000001;
                                                        *((void *)&v143 + 1) = 0x100000001;
                                                        *(void *)&long long v143 = 0x100000001;
                                                        uint64_t v145 = 0x100000001;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v145 = 0x100000000;
                                                      int v146 = 0;
                                                      *((void *)&v147 + 1) = 0x100000000;
                                                      *(void *)v149 = 0;
                                                      int v23 = 0;
                                                      int v24 = 0;
                                                      int v25 = 0;
                                                      int v26 = 0;
                                                      int v27 = 0;
                                                      int v28 = 0;
                                                      HIDWORD(v152[3]) = 0;
                                                      LODWORD(v152[2]) = 1;
                                                      *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                      v152[1] = 0x100000001;
                                                      int v29 = 1;
                                                      int v30 = 1;
                                                      int v31 = 1;
                                                      int v151 = 0;
                                                      v152[0] = 0x100000001;
                                                      uint64_t v150 = 0x100000000;
                                                      *(_DWORD *)&v149[8] = 1;
                                                      *(void *)&long long v147 = 0x100000001;
                                                      uint64_t v148 = 0x100000000;
                                                      *((void *)&v143 + 1) = 0x100000001;
                                                      *(void *)&long long v143 = 0x100000001;
                                                      uint64_t v144 = 0x100000001;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v144 = 0x100000000;
                                                    uint64_t v145 = 0x100000000;
                                                    int v146 = 0;
                                                    *((void *)&v147 + 1) = 0x100000000;
                                                    *(void *)v149 = 0;
                                                    int v23 = 0;
                                                    int v24 = 0;
                                                    int v25 = 0;
                                                    int v26 = 0;
                                                    int v27 = 0;
                                                    int v28 = 0;
                                                    HIDWORD(v152[3]) = 0;
                                                    LODWORD(v152[2]) = 1;
                                                    *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                    v152[1] = 0x100000001;
                                                    int v29 = 1;
                                                    int v30 = 1;
                                                    int v31 = 1;
                                                    int v151 = 0;
                                                    v152[0] = 0x100000001;
                                                    uint64_t v150 = 0x100000000;
                                                    *(_DWORD *)&v149[8] = 1;
                                                    *(void *)&long long v147 = 0x100000001;
                                                    uint64_t v148 = 0x100000000;
                                                    *((void *)&v143 + 1) = 0x100000001;
                                                    *(void *)&long long v143 = 0x100000001;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v144 = 0x100000000;
                                                  uint64_t v145 = 0x100000000;
                                                  int v146 = 0;
                                                  *((void *)&v147 + 1) = 0x100000000;
                                                  *(void *)v149 = 0;
                                                  int v23 = 0;
                                                  int v24 = 0;
                                                  int v25 = 0;
                                                  int v26 = 0;
                                                  int v27 = 0;
                                                  int v28 = 0;
                                                  HIDWORD(v152[3]) = 0;
                                                  LODWORD(v152[2]) = 1;
                                                  *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                  v152[1] = 0x100000001;
                                                  int v29 = 1;
                                                  int v30 = 1;
                                                  int v31 = 1;
                                                  int v151 = 0;
                                                  v152[0] = 0x100000001;
                                                  uint64_t v150 = 0x100000000;
                                                  *(_DWORD *)&v149[8] = 1;
                                                  *(void *)&long long v147 = 0x100000001;
                                                  uint64_t v148 = 0x100000000;
                                                  *((void *)&v143 + 1) = 0x100000001;
                                                  *(void *)&long long v143 = 1;
                                                }
                                              }
                                              else
                                              {
                                                *(void *)&long long v143 = 0;
                                                uint64_t v144 = 0x100000000;
                                                uint64_t v145 = 0x100000000;
                                                int v146 = 0;
                                                *((void *)&v147 + 1) = 0x100000000;
                                                *(void *)v149 = 0;
                                                int v23 = 0;
                                                int v24 = 0;
                                                int v25 = 0;
                                                int v26 = 0;
                                                int v27 = 0;
                                                int v28 = 0;
                                                HIDWORD(v152[3]) = 0;
                                                LODWORD(v152[2]) = 1;
                                                *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                                v152[1] = 0x100000001;
                                                int v29 = 1;
                                                int v30 = 1;
                                                int v31 = 1;
                                                int v151 = 0;
                                                v152[0] = 0x100000001;
                                                uint64_t v150 = 0x100000000;
                                                *(_DWORD *)&v149[8] = 1;
                                                *(void *)&long long v147 = 0x100000001;
                                                uint64_t v148 = 0x100000000;
                                                *((void *)&v143 + 1) = 0x100000001;
                                              }
                                            }
                                            else
                                            {
                                              *(void *)((char *)&v143 + 4) = 0;
                                              LODWORD(v143) = 0;
                                              uint64_t v144 = 0x100000000;
                                              uint64_t v145 = 0x100000000;
                                              int v146 = 0;
                                              *((void *)&v147 + 1) = 0x100000000;
                                              *(void *)v149 = 0;
                                              int v23 = 0;
                                              int v24 = 0;
                                              int v25 = 0;
                                              int v26 = 0;
                                              int v27 = 0;
                                              int v28 = 0;
                                              HIDWORD(v152[3]) = 0;
                                              LODWORD(v152[2]) = 1;
                                              *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                              v152[1] = 0x100000001;
                                              int v29 = 1;
                                              int v30 = 1;
                                              int v31 = 1;
                                              int v151 = 0;
                                              v152[0] = 0x100000001;
                                              uint64_t v150 = 0x100000000;
                                              *(_DWORD *)&v149[8] = 1;
                                              *(void *)&long long v147 = 0x100000001;
                                              uint64_t v148 = 0x100000000;
                                              HIDWORD(v143) = 1;
                                            }
                                          }
                                          else
                                          {
                                            long long v143 = 0uLL;
                                            uint64_t v144 = 0x100000000;
                                            uint64_t v145 = 0x100000000;
                                            int v146 = 0;
                                            *((void *)&v147 + 1) = 0x100000000;
                                            *(void *)v149 = 0;
                                            int v23 = 0;
                                            int v24 = 0;
                                            int v25 = 0;
                                            int v26 = 0;
                                            int v27 = 0;
                                            int v28 = 0;
                                            HIDWORD(v152[3]) = 0;
                                            LODWORD(v152[2]) = 1;
                                            *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                            v152[1] = 0x100000001;
                                            int v29 = 1;
                                            int v30 = 1;
                                            int v31 = 1;
                                            int v151 = 0;
                                            v152[0] = 0x100000001;
                                            uint64_t v150 = 0x100000000;
                                            *(_DWORD *)&v149[8] = 1;
                                            *(void *)&long long v147 = 0x100000001;
                                            uint64_t v148 = 0x100000000;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v144 = 0;
                                          long long v143 = 0uLL;
                                          uint64_t v145 = 0x100000000;
                                          int v146 = 0;
                                          *((void *)&v147 + 1) = 0x100000000;
                                          *(void *)v149 = 0;
                                          int v23 = 0;
                                          int v24 = 0;
                                          int v25 = 0;
                                          int v26 = 0;
                                          int v27 = 0;
                                          int v28 = 0;
                                          HIDWORD(v152[3]) = 0;
                                          LODWORD(v152[2]) = 1;
                                          *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                          v152[1] = 0x100000001;
                                          int v29 = 1;
                                          int v30 = 1;
                                          int v31 = 1;
                                          int v151 = 0;
                                          v152[0] = 0x100000001;
                                          uint64_t v150 = 0x100000000;
                                          *(_DWORD *)&v149[8] = 1;
                                          *(void *)&long long v147 = 0x100000001;
                                          uint64_t v148 = 0x100000000;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v144 = 0;
                                        uint64_t v145 = 0;
                                        long long v143 = 0uLL;
                                        int v146 = 0;
                                        *((void *)&v147 + 1) = 0x100000000;
                                        *(void *)v149 = 0;
                                        int v23 = 0;
                                        int v24 = 0;
                                        int v25 = 0;
                                        int v26 = 0;
                                        int v27 = 0;
                                        int v28 = 0;
                                        HIDWORD(v152[3]) = 0;
                                        LODWORD(v152[2]) = 1;
                                        *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                        v152[1] = 0x100000001;
                                        int v29 = 1;
                                        int v30 = 1;
                                        int v31 = 1;
                                        int v151 = 0;
                                        v152[0] = 0x100000001;
                                        uint64_t v150 = 0x100000000;
                                        *(_DWORD *)&v149[8] = 1;
                                        *(void *)&long long v147 = 0x100000001;
                                        uint64_t v148 = 0x100000000;
                                      }
                                    }
                                    else
                                    {
                                      *(void *)((char *)&v147 + 4) = 0;
                                      uint64_t v144 = 0;
                                      uint64_t v145 = 0;
                                      long long v143 = 0uLL;
                                      *(void *)v149 = 0;
                                      int v23 = 0;
                                      int v24 = 0;
                                      int v25 = 0;
                                      int v26 = 0;
                                      int v27 = 0;
                                      int v28 = 0;
                                      HIDWORD(v152[3]) = 0;
                                      LODWORD(v152[2]) = 1;
                                      *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                      v152[1] = 0x100000001;
                                      int v29 = 1;
                                      int v30 = 1;
                                      int v31 = 1;
                                      int v151 = 0;
                                      v152[0] = 0x100000001;
                                      uint64_t v150 = 0x100000000;
                                      *(_DWORD *)&v149[8] = 1;
                                      int v146 = 0;
                                      LODWORD(v147) = 1;
                                      uint64_t v148 = 0x100000000;
                                      HIDWORD(v147) = 1;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v144 = 0;
                                    uint64_t v145 = 0;
                                    long long v143 = 0uLL;
                                    uint64_t v148 = 0x100000000;
                                    *(void *)v149 = 0;
                                    int v23 = 0;
                                    int v24 = 0;
                                    int v25 = 0;
                                    int v26 = 0;
                                    int v27 = 0;
                                    int v28 = 0;
                                    HIDWORD(v152[3]) = 0;
                                    LODWORD(v152[2]) = 1;
                                    *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                    v152[1] = 0x100000001;
                                    int v29 = 1;
                                    int v30 = 1;
                                    int v31 = 1;
                                    int v151 = 0;
                                    v152[0] = 0x100000001;
                                    uint64_t v150 = 0x100000000;
                                    *(_DWORD *)&v149[8] = 1;
                                    int v146 = 0;
                                    long long v147 = 1uLL;
                                  }
                                }
                                else
                                {
                                  uint64_t v148 = 0;
                                  uint64_t v144 = 0;
                                  uint64_t v145 = 0;
                                  long long v143 = 0uLL;
                                  *(void *)v149 = 0;
                                  int v23 = 0;
                                  int v24 = 0;
                                  int v25 = 0;
                                  int v26 = 0;
                                  int v27 = 0;
                                  int v28 = 0;
                                  HIDWORD(v152[3]) = 0;
                                  LODWORD(v152[2]) = 1;
                                  *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                  v152[1] = 0x100000001;
                                  int v29 = 1;
                                  int v30 = 1;
                                  int v31 = 1;
                                  int v151 = 0;
                                  v152[0] = 0x100000001;
                                  uint64_t v150 = 0x100000000;
                                  *(_DWORD *)&v149[8] = 1;
                                  int v146 = 0;
                                  long long v147 = 1uLL;
                                }
                              }
                              else
                              {
                                long long v147 = 0uLL;
                                uint64_t v148 = 0;
                                uint64_t v144 = 0;
                                uint64_t v145 = 0;
                                long long v143 = 0uLL;
                                int v146 = 0;
                                *(void *)v149 = 0;
                                int v23 = 0;
                                int v24 = 0;
                                int v25 = 0;
                                int v26 = 0;
                                int v27 = 0;
                                int v28 = 0;
                                HIDWORD(v152[3]) = 0;
                                LODWORD(v152[2]) = 1;
                                *(void *)((char *)&v152[2] + 4) = 0x100000001;
                                v152[1] = 0x100000001;
                                int v29 = 1;
                                int v30 = 1;
                                int v31 = 1;
                                int v151 = 0;
                                v152[0] = 0x100000001;
                                uint64_t v150 = 0x100000000;
                                *(_DWORD *)&v149[8] = 1;
                              }
                            }
                            else
                            {
                              long long v147 = 0uLL;
                              uint64_t v148 = 0;
                              uint64_t v144 = 0;
                              uint64_t v145 = 0;
                              long long v143 = 0uLL;
                              int v146 = 0;
                              memset(v149, 0, sizeof(v149));
                              int v23 = 0;
                              int v24 = 0;
                              int v25 = 0;
                              int v26 = 0;
                              int v27 = 0;
                              int v28 = 0;
                              HIDWORD(v152[3]) = 0;
                              LODWORD(v152[2]) = 1;
                              *(void *)((char *)&v152[2] + 4) = 0x100000001;
                              v152[1] = 0x100000001;
                              int v29 = 1;
                              int v30 = 1;
                              int v31 = 1;
                              int v151 = 0;
                              v152[0] = 0x100000001;
                              uint64_t v150 = 0x100000000;
                            }
                          }
                          else
                          {
                            uint64_t v150 = 0;
                            long long v147 = 0uLL;
                            uint64_t v148 = 0;
                            uint64_t v144 = 0;
                            uint64_t v145 = 0;
                            long long v143 = 0uLL;
                            int v146 = 0;
                            memset(v149, 0, sizeof(v149));
                            int v23 = 0;
                            int v24 = 0;
                            int v25 = 0;
                            int v26 = 0;
                            int v27 = 0;
                            int v28 = 0;
                            HIDWORD(v152[3]) = 0;
                            LODWORD(v152[2]) = 1;
                            *(void *)((char *)&v152[2] + 4) = 0x100000001;
                            v152[1] = 0x100000001;
                            int v29 = 1;
                            int v30 = 1;
                            int v31 = 1;
                            int v151 = 0;
                            v152[0] = 0x100000001;
                          }
                        }
                        else
                        {
                          int v151 = 0;
                          v152[0] = 0x100000000;
                          uint64_t v150 = 0;
                          long long v147 = 0uLL;
                          uint64_t v148 = 0;
                          uint64_t v144 = 0;
                          uint64_t v145 = 0;
                          long long v143 = 0uLL;
                          int v146 = 0;
                          memset(v149, 0, sizeof(v149));
                          int v23 = 0;
                          int v24 = 0;
                          int v25 = 0;
                          int v26 = 0;
                          int v27 = 0;
                          int v28 = 0;
                          v152[3] = 1;
                          v152[2] = 0x100000001;
                          v152[1] = 0x100000001;
                          int v29 = 1;
                          int v30 = 1;
                          int v31 = 1;
                        }
                      }
                      else
                      {
                        int v31 = 0;
                        int v151 = 0;
                        v152[0] = 0x100000000;
                        uint64_t v150 = 0;
                        long long v147 = 0uLL;
                        uint64_t v148 = 0;
                        uint64_t v144 = 0;
                        uint64_t v145 = 0;
                        long long v143 = 0uLL;
                        int v146 = 0;
                        memset(v149, 0, sizeof(v149));
                        int v23 = 0;
                        int v24 = 0;
                        int v25 = 0;
                        int v26 = 0;
                        int v27 = 0;
                        int v28 = 0;
                        v152[3] = 1;
                        v152[2] = 0x100000001;
                        v152[1] = 0x100000001;
                        int v29 = 1;
                        int v30 = 1;
                      }
                    }
                    else
                    {
                      int v30 = 0;
                      int v31 = 0;
                      int v151 = 0;
                      v152[0] = 0x100000000;
                      uint64_t v150 = 0;
                      long long v147 = 0uLL;
                      uint64_t v148 = 0;
                      uint64_t v144 = 0;
                      uint64_t v145 = 0;
                      long long v143 = 0uLL;
                      int v146 = 0;
                      memset(v149, 0, sizeof(v149));
                      int v23 = 0;
                      int v24 = 0;
                      int v25 = 0;
                      int v26 = 0;
                      int v27 = 0;
                      int v28 = 0;
                      HIDWORD(v152[3]) = 0;
                      LODWORD(v152[2]) = 1;
                      *(void *)((char *)&v152[2] + 4) = 0x100000001;
                      v152[1] = 0x100000001;
                      int v29 = 1;
                    }
                  }
                  else
                  {
                    v152[0] = 0;
                    int v30 = 0;
                    int v31 = 0;
                    uint64_t v150 = 0;
                    long long v147 = 0uLL;
                    uint64_t v148 = 0;
                    uint64_t v144 = 0;
                    uint64_t v145 = 0;
                    long long v143 = 0uLL;
                    int v146 = 0;
                    memset(v149, 0, sizeof(v149));
                    int v151 = 0;
                    int v23 = 0;
                    int v24 = 0;
                    int v25 = 0;
                    int v26 = 0;
                    int v27 = 0;
                    int v28 = 0;
                    v152[3] = 1;
                    v152[2] = 0x100000001;
                    v152[1] = 0x100000001;
                    int v29 = 1;
                  }
                }
                else
                {
                  int v29 = 0;
                  v152[0] = 0;
                  int v30 = 0;
                  int v31 = 0;
                  uint64_t v150 = 0;
                  long long v147 = 0uLL;
                  uint64_t v148 = 0;
                  uint64_t v144 = 0;
                  uint64_t v145 = 0;
                  long long v143 = 0uLL;
                  int v146 = 0;
                  memset(v149, 0, sizeof(v149));
                  int v151 = 0;
                  int v23 = 0;
                  int v24 = 0;
                  int v25 = 0;
                  int v26 = 0;
                  int v27 = 0;
                  int v28 = 0;
                  HIDWORD(v152[3]) = 0;
                  LODWORD(v152[2]) = 1;
                  *(void *)((char *)&v152[2] + 4) = 0x100000001;
                  v152[1] = 0x100000001;
                }
              }
              else
              {
                *(void *)((char *)v152 + 4) = 0;
                int v29 = 0;
                int v30 = 0;
                int v31 = 0;
                int v151 = 0;
                LODWORD(v152[0]) = 0;
                uint64_t v150 = 0;
                long long v147 = 0uLL;
                uint64_t v148 = 0;
                uint64_t v144 = 0;
                uint64_t v145 = 0;
                long long v143 = 0uLL;
                int v146 = 0;
                memset(v149, 0, sizeof(v149));
                int v23 = 0;
                int v24 = 0;
                int v25 = 0;
                int v26 = 0;
                int v27 = 0;
                int v28 = 0;
                HIDWORD(v152[3]) = 0;
                LODWORD(v152[2]) = 1;
                *(void *)((char *)&v152[2] + 4) = 0x100000001;
                HIDWORD(v152[1]) = 1;
              }
            }
            else
            {
              v152[1] = 0;
              int v29 = 0;
              v152[0] = 0;
              int v30 = 0;
              int v31 = 0;
              uint64_t v150 = 0;
              long long v147 = 0uLL;
              uint64_t v148 = 0;
              uint64_t v144 = 0;
              uint64_t v145 = 0;
              long long v143 = 0uLL;
              int v146 = 0;
              memset(v149, 0, sizeof(v149));
              int v151 = 0;
              int v23 = 0;
              int v24 = 0;
              int v25 = 0;
              int v26 = 0;
              int v27 = 0;
              int v28 = 0;
              HIDWORD(v152[3]) = 0;
              *(void *)((char *)&v152[2] + 4) = 0x100000001;
              LODWORD(v152[2]) = 1;
            }
          }
          else
          {
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v151 = 0;
            memset(v152, 0, 20);
            uint64_t v150 = 0;
            long long v147 = 0uLL;
            uint64_t v148 = 0;
            uint64_t v144 = 0;
            uint64_t v145 = 0;
            long long v143 = 0uLL;
            int v146 = 0;
            memset(v149, 0, sizeof(v149));
            int v23 = 0;
            int v24 = 0;
            int v25 = 0;
            int v26 = 0;
            int v27 = 0;
            int v28 = 0;
            HIDWORD(v152[3]) = 0;
            *(void *)((char *)&v152[2] + 4) = 0x100000001;
          }
        }
        else
        {
          int v29 = 0;
          memset(v152, 0, 24);
          int v30 = 0;
          int v31 = 0;
          uint64_t v150 = 0;
          long long v147 = 0uLL;
          uint64_t v148 = 0;
          uint64_t v144 = 0;
          uint64_t v145 = 0;
          long long v143 = 0uLL;
          int v146 = 0;
          memset(v149, 0, sizeof(v149));
          int v151 = 0;
          int v23 = 0;
          int v24 = 0;
          int v25 = 0;
          int v26 = 0;
          int v27 = 0;
          int v28 = 0;
          v152[3] = 1;
        }
      }
      else
      {
        int v29 = 0;
        int v30 = 0;
        int v31 = 0;
        int v151 = 0;
        memset(v152, 0, sizeof(v152));
        uint64_t v150 = 0;
        long long v147 = 0uLL;
        uint64_t v148 = 0;
        uint64_t v144 = 0;
        uint64_t v145 = 0;
        long long v143 = 0uLL;
        int v146 = 0;
        memset(v149, 0, sizeof(v149));
        int v23 = 0;
        int v24 = 0;
        int v25 = 0;
        int v26 = 0;
        int v27 = 0;
        int v28 = 0;
      }
    }
    else
    {
      int v25 = 0;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v151 = 0;
      memset(v152, 0, sizeof(v152));
      uint64_t v150 = 0;
      long long v147 = 0uLL;
      uint64_t v148 = 0;
      uint64_t v144 = 0;
      uint64_t v145 = 0;
      long long v143 = 0uLL;
      int v146 = 0;
      memset(v149, 0, sizeof(v149));
      int v23 = 0;
      int v24 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
    }
    if (v28)
    {
      int v33 = v23;
      int v34 = v31;
      int v35 = v24;
      int v36 = v30;
      int v37 = v25;
      int v38 = v26;
      int v39 = v29;
      int v40 = v27;

      int v27 = v40;
      int v29 = v39;
      int v26 = v38;
      int v25 = v37;
      int v30 = v36;
      int v24 = v35;
      int v31 = v34;
      int v23 = v33;
    }
    if (v27)
    {
    }
    if (v26)
    {

      if (!v25) {
        goto LABEL_30;
      }
    }
    else if (!v25)
    {
LABEL_30:
      if (v24) {
        goto LABEL_31;
      }
      goto LABEL_35;
    }

    if (v24)
    {
LABEL_31:

      if (!v23)
      {
LABEL_37:
        if (v151)
        {
        }
        if (v150)
        {
        }
        if (*(_DWORD *)&v149[4])
        {
        }
        if (*(_DWORD *)v149)
        {
        }
        if (v148)
        {
        }
        if (DWORD2(v147))
        {
        }
        if (v146)
        {
        }
        if (v145)
        {
        }
        if (v144)
        {
        }
        if (DWORD1(v143))
        {
        }
        if (v143)
        {
        }
        if (DWORD2(v143))
        {
        }
        if (HIDWORD(v143))
        {
        }
        if (HIDWORD(v144))
        {
        }
        if (HIDWORD(v145))
        {
        }
        if (DWORD1(v147))
        {
        }
        if (HIDWORD(v147))
        {
        }
        if (HIDWORD(v148))
        {
        }
        if (v147)
        {
        }
        if (*(_DWORD *)&v149[8])
        {
        }
        if (HIDWORD(v150))
        {
        }
        if (LODWORD(v152[0]))
        {

          if (!v31) {
            goto LABEL_81;
          }
        }
        else if (!v31)
        {
LABEL_81:
          if (!v30) {
            goto LABEL_83;
          }
          goto LABEL_82;
        }

        if (!v30)
        {
LABEL_83:
          if (HIDWORD(v152[0]))
          {
          }
          if (v29)
          {
          }
          if (LODWORD(v152[1]))
          {
          }
          if (HIDWORD(v152[1]))
          {
          }
          if (LODWORD(v152[2]))
          {
          }
          if (HIDWORD(v152[2]))
          {
          }
          if (LODWORD(v152[3]))
          {
          }
          if (v153)
          {
          }
          if (!HIDWORD(v152[3]))
          {
            BOOL v32 = 0;
            goto LABEL_105;
          }
          goto LABEL_100;
        }
LABEL_82:

        goto LABEL_83;
      }
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    if (!v23) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  BOOL v32 = 0;
  BOOL v5 = 0;
LABEL_105:

  return v32;
}

- (WiFiMACAddress)peerAddress
{
  return self->_peerAddress;
}

- (NSNumber)infrastructureChannel
{
  return self->_infrastructureChannel;
}

- (NSArray)txCCAHistogram
{
  return self->_txCCAHistogram;
}

- (void)setTxCCAHistogram:(id)a3
{
}

- (NSArray)rxRSSIHistogram
{
  return self->_rxRSSIHistogram;
}

- (void)setRxRSSIHistogram:(id)a3
{
}

- (NSArray)rxFWDelayHistogram
{
  return self->_rxFWDelayHistogram;
}

- (void)setRxFWDelayHistogram:(id)a3
{
}

- (NSArray)rxIPCDelayHistogram
{
  return self->_rxIPCDelayHistogram;
}

- (void)setRxIPCDelayHistogram:(id)a3
{
}

- (NSArray)txConsecutiveErrorsHistogram
{
  return self->_txConsecutiveErrorsHistogram;
}

- (void)setTxConsecutiveErrorsHistogram:(id)a3
{
}

- (NSArray)txPacketExpiryHistogram
{
  return self->_txPacketExpiryHistogram;
}

- (void)setTxPacketExpiryHistogram:(id)a3
{
}

- (NSNumber)preferred2GChannelsCount
{
  return self->_preferred2GChannelsCount;
}

- (void)setPreferred2GChannelsCount:(id)a3
{
}

- (NSNumber)preferred5GChannelsCount
{
  return self->_preferred5GChannelsCount;
}

- (void)setPreferred5GChannelsCount:(id)a3
{
}

- (NSNumber)dfsChannelsCount
{
  return self->_dfsChannelsCount;
}

- (void)setDfsChannelsCount:(id)a3
{
}

- (NSNumber)csaCount
{
  return self->_csaCount;
}

- (void)setCsaCount:(id)a3
{
}

- (NSNumber)quietIECount
{
  return self->_quietIECount;
}

- (void)setQuietIECount:(id)a3
{
}

- (NSNumber)txErrorCount
{
  return self->_txErrorCount;
}

- (void)setTxErrorCount:(id)a3
{
}

- (NSNumber)packetsOn2GCount
{
  return self->_packetsOn2GCount;
}

- (void)setPacketsOn2GCount:(id)a3
{
}

- (NSNumber)packetsNAVOn2GCount
{
  return self->_packetsNAVOn2GCount;
}

- (void)setPacketsNAVOn2GCount:(id)a3
{
}

- (NSNumber)packetsHOFOn2GCount
{
  return self->_packetsHOFOn2GCount;
}

- (void)setPacketsHOFOn2GCount:(id)a3
{
}

- (NSNumber)packetsOverridenOn5GCount
{
  return self->_packetsOverridenOn5GCount;
}

- (void)setPacketsOverridenOn5GCount:(id)a3
{
}

- (NSNumber)packetsOn5GCount
{
  return self->_packetsOn5GCount;
}

- (void)setPacketsOn5GCount:(id)a3
{
}

- (BOOL)infraRelayOperationStatus
{
  return self->_infraRelayOperationStatus;
}

- (void)setInfraRelayOperationStatus:(BOOL)a3
{
  self->_infraRelayOperationStatus = a3;
}

- (NSNumber)infraRelayRequestersCount
{
  return self->_infraRelayRequestersCount;
}

- (void)setInfraRelayRequestersCount:(id)a3
{
}

- (NSNumber)txExpiredCount
{
  return self->_txExpiredCount;
}

- (void)setTxExpiredCount:(id)a3
{
}

- (NSNumber)txNoACKCount
{
  return self->_txNoACKCount;
}

- (void)setTxNoACKCount:(id)a3
{
}

- (NSNumber)txFailedCount
{
  return self->_txFailedCount;
}

- (void)setTxFailedCount:(id)a3
{
}

- (NSNumber)txNoResourcesCount
{
  return self->_txNoResourcesCount;
}

- (void)setTxNoResourcesCount:(id)a3
{
}

- (NSNumber)txIOErrorCount
{
  return self->_txIOErrorCount;
}

- (void)setTxIOErrorCount:(id)a3
{
}

- (NSNumber)txMemoryErrorCount
{
  return self->_txMemoryErrorCount;
}

- (void)setTxMemoryErrorCount:(id)a3
{
}

- (NSNumber)txChipModeErrorCount
{
  return self->_txChipModeErrorCount;
}

- (void)setTxChipModeErrorCount:(id)a3
{
}

- (NSNumber)txNoRemotePeerCount
{
  return self->_txNoRemotePeerCount;
}

- (void)setTxNoRemotePeerCount:(id)a3
{
}

- (NSNumber)txInternalErrorCount
{
  return self->_txInternalErrorCount;
}

- (void)setTxInternalErrorCount:(id)a3
{
}

- (NSNumber)txDroppedCount
{
  return self->_txDroppedCount;
}

- (void)setTxDroppedCount:(id)a3
{
}

- (NSNumber)txFirmwareFreePacketCount
{
  return self->_txFirmwareFreePacketCount;
}

- (void)setTxFirmwareFreePacketCount:(id)a3
{
}

- (NSNumber)txMaxRetriesCount
{
  return self->_txMaxRetriesCount;
}

- (void)setTxMaxRetriesCount:(id)a3
{
}

- (NSNumber)txForceLifetimeExpiredCount
{
  return self->_txForceLifetimeExpiredCount;
}

- (void)setTxForceLifetimeExpiredCount:(id)a3
{
}

- (NSNumber)channelSequenceMismatchOn5GCount
{
  return self->_channelSequenceMismatchOn5GCount;
}

- (void)setChannelSequenceMismatchOn5GCount:(id)a3
{
}

- (NSNumber)channelSequenceMismatchOn2GCount
{
  return self->_channelSequenceMismatchOn2GCount;
}

- (void)setChannelSequenceMismatchOn2GCount:(id)a3
{
}

- (NSNumber)infraScanCount
{
  return self->_infraScanCount;
}

- (void)setInfraScanCount:(id)a3
{
}

- (NSNumber)infraAssocCount
{
  return self->_infraAssocCount;
}

- (void)setInfraAssocCount:(id)a3
{
}

- (NSNumber)infraDisassocCount
{
  return self->_infraDisassocCount;
}

- (void)setInfraDisassocCount:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_infraDisassocCount, 0);
  objc_storeStrong((id *)&self->_infraAssocCount, 0);
  objc_storeStrong((id *)&self->_infraScanCount, 0);
  objc_storeStrong((id *)&self->_channelSequenceMismatchOn2GCount, 0);
  objc_storeStrong((id *)&self->_channelSequenceMismatchOn5GCount, 0);
  objc_storeStrong((id *)&self->_txForceLifetimeExpiredCount, 0);
  objc_storeStrong((id *)&self->_txMaxRetriesCount, 0);
  objc_storeStrong((id *)&self->_txFirmwareFreePacketCount, 0);
  objc_storeStrong((id *)&self->_txDroppedCount, 0);
  objc_storeStrong((id *)&self->_txInternalErrorCount, 0);
  objc_storeStrong((id *)&self->_txNoRemotePeerCount, 0);
  objc_storeStrong((id *)&self->_txChipModeErrorCount, 0);
  objc_storeStrong((id *)&self->_txMemoryErrorCount, 0);
  objc_storeStrong((id *)&self->_txIOErrorCount, 0);
  objc_storeStrong((id *)&self->_txNoResourcesCount, 0);
  objc_storeStrong((id *)&self->_txFailedCount, 0);
  objc_storeStrong((id *)&self->_txNoACKCount, 0);
  objc_storeStrong((id *)&self->_txExpiredCount, 0);
  objc_storeStrong((id *)&self->_infraRelayRequestersCount, 0);
  objc_storeStrong((id *)&self->_packetsOn5GCount, 0);
  objc_storeStrong((id *)&self->_packetsOverridenOn5GCount, 0);
  objc_storeStrong((id *)&self->_packetsHOFOn2GCount, 0);
  objc_storeStrong((id *)&self->_packetsNAVOn2GCount, 0);
  objc_storeStrong((id *)&self->_packetsOn2GCount, 0);
  objc_storeStrong((id *)&self->_txErrorCount, 0);
  objc_storeStrong((id *)&self->_quietIECount, 0);
  objc_storeStrong((id *)&self->_csaCount, 0);
  objc_storeStrong((id *)&self->_dfsChannelsCount, 0);
  objc_storeStrong((id *)&self->_preferred5GChannelsCount, 0);
  objc_storeStrong((id *)&self->_preferred2GChannelsCount, 0);
  objc_storeStrong((id *)&self->_txPacketExpiryHistogram, 0);
  objc_storeStrong((id *)&self->_txConsecutiveErrorsHistogram, 0);
  objc_storeStrong((id *)&self->_rxIPCDelayHistogram, 0);
  objc_storeStrong((id *)&self->_rxFWDelayHistogram, 0);
  objc_storeStrong((id *)&self->_rxRSSIHistogram, 0);
  objc_storeStrong((id *)&self->_txCCAHistogram, 0);
  objc_storeStrong((id *)&self->_infrastructureChannel, 0);

  objc_storeStrong((id *)&self->_peerAddress, 0);
}

@end