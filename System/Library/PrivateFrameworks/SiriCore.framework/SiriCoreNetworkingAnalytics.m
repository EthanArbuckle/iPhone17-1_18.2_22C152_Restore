@interface SiriCoreNetworkingAnalytics
+ (id)debugNetworkInterfacesFromSiriCoreConnectionMetrics:(id)a3;
+ (id)debugSessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3;
+ (id)endpointFromDictionary:(id)a3;
+ (id)endpointsFromArray:(id)a3;
+ (id)establishmentResolutionFromArray:(id)a3;
+ (id)handShakeProtocolFromArray:(id)a3;
+ (id)networkInterfacesFromDictionary:(id)a3;
+ (id)pathInterfacesFromArray:(id)a3;
+ (id)pingInfoFromSiriCoreConnectionMetrics:(id)a3;
+ (id)proxyConfigurationFromDictionary:(id)a3;
+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 analysisInfo:(id)a8;
+ (id)sessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3;
+ (id)sessionConnectionQualityFromSiriCoreConnectionMetrics:(id)a3;
+ (id)sharedSiriCoreNetworkingAnalytics;
+ (int)connectionMethodFromString:(id)a3;
+ (int)connectionModeFromString:(id)a3;
+ (int)connectionTypeFromString:(id)a3;
+ (int)endpointTypeFromNumber:(id)a3;
+ (int)handshakeProtocolFromString:(id)a3;
+ (int)pathStatusFromNumber:(id)a3;
+ (int)pathTypeFromNumber:(id)a3;
+ (int)phyModeFromString:(id)a3;
+ (int)providerFromString:(id)a3;
+ (int)qualityFromString:(id)a3;
+ (int)sessionStateFromString:(id)a3;
+ (int)sessionTypeFromString:(id)a3;
+ (int)snapshotStateFromStringEvent:(id)a3;
+ (int)tlsFromString:(id)a3;
- (BOOL)emitLogDebug;
- (BOOL)isNetIdAvailable;
- (SiriCoreNetworkingAnalytics)init;
- (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4;
- (id)_createSchemaClientEventFromNetId:(id)a3 networkConnectionId:(id)a4 connectionProvider:(int)a5;
- (id)_init;
- (id)orchestratorRequestId;
- (unsigned)getSequenceNumber;
- (void)_emitAllCachedMessagesFor:(id)a3;
- (void)increaseSequenceNumber;
- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3;
- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)logPeerConnectionFailed:(id)a3;
- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent;
- (void)logSessionConnectionFailed:(id)a3;
- (void)logSessionConnectionHttpHeaderCreated:(id)a3;
- (void)logSessionConnectionSnapshotCaptured:(id)a3;
- (void)reset;
- (void)resetNetId;
- (void)resetSequenceNumber;
- (void)setConnectionProvider:(id)a3;
- (void)setIsConnectionActive:(BOOL)a3;
- (void)setNetId:(id)a3;
- (void)setNetIdAvailable:(BOOL)a3;
- (void)setNetworkConnectionId:(id)a3;
- (void)setOrchestratorRequestId:(id)a3;
@end

@implementation SiriCoreNetworkingAnalytics

+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 analysisInfo:(id)a8
{
  BOOL v40 = a7;
  id v13 = a3;
  v14 = (objc_class *)MEMORY[0x263F6E4E0];
  id v15 = a8;
  id v39 = a6;
  id v38 = a5;
  id v16 = a4;
  id v17 = objc_alloc_init(v14);
  if (v13)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F6E498]);
    v19 = [v13 domain];
    [v18 setDomain:v19];

    v20 = [v13 description];
    [v18 setDescription:v20];

    objc_msgSend(v18, "setErrorCode:", objc_msgSend(v13, "code"));
  }
  else
  {
    id v18 = 0;
  }
  v21 = [v13 userInfo];
  uint64_t v22 = *MEMORY[0x263F08608];
  id v23 = [v21 objectForKey:*MEMORY[0x263F08608]];

  if (v23)
  {
    v24 = [v13 userInfo];
    v25 = [v24 objectForKey:v22];

    id v23 = objc_alloc_init(MEMORY[0x263F6E498]);
    v26 = [v25 domain];
    [v23 setDomain:v26];

    v27 = [v25 description];
    [v23 setDescription:v27];

    objc_msgSend(v23, "setErrorCode:", objc_msgSend(v25, "code"));
  }
  v28 = [v15 connectionType];
  v29 = SiriCoreConnectionTechnologyGetDescription([v28 technology]);

  v30 = [v15 sendBufferSize];
  [v30 doubleValue];
  unint64_t v32 = (unint64_t)v31;

  objc_msgSend(v17, "setConnectionType:", objc_msgSend(a1, "connectionTypeFromString:", v29));
  uint64_t v33 = [a1 connectionModeFromString:v16];

  [v17 setConnectionMode:v33];
  uint64_t v34 = [a1 sessionTypeFromString:v38];

  [v17 setSessionType:v34];
  uint64_t v35 = [a1 sessionStateFromString:v39];

  [v17 setNetworkSessionState:v35];
  objc_msgSend(v17, "setIsWwanPreferred:", objc_msgSend(v15, "wwanPreferred"));
  [v17 setIsDormant:v40];
  [v17 setSendBufferSize:v32];
  v36 = [v15 policyId];

  [v17 setPolicyId:v36];
  [v17 setError:v18];
  [v17 setUnderlyingError:v23];

  return v17;
}

+ (int)sessionStateFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"initial"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"waiting"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"retrywaiting"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"connectionstarted"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"connectionopened"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"openeddormant"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"authenticating"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"holding"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"createassistant"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"loadassistant"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"destroyassistant"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"active"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)sessionTypeFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"local"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"remote"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"remotelimited"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"remotefull"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)connectionModeFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"assistant"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"assistantanddictation"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)providerFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"adpeerconnectionprovider"])
  {
    int v4 = 1;
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v6 lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int v4 = 3;
    }
    else
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = [v10 lowercaseString];
      int v12 = [v3 isEqualToString:v11];

      if (v12) {
        int v4 = 2;
      }
      else {
        int v4 = 0;
      }
    }
  }

  return v4;
}

+ (id)sessionConnectionQualityFromSiriCoreConnectionMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  v5 = [v4 symptomsBasedNetworkQuality];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __112__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__sessionConnectionQualityFromSiriCoreConnectionMetrics___block_invoke;
  v8[3] = &unk_26443A6B0;
  v8[7] = &v9;
  v8[8] = a1;
  v8[4] = &v21;
  v8[5] = &v17;
  v8[6] = &v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = objc_alloc_init(MEMORY[0x263F6E480]);
  [v6 setSymptomsCellularHistorical:*((unsigned int *)v18 + 6)];
  [v6 setSymptomsCellularInstant:*((unsigned int *)v22 + 6)];
  [v6 setSymptomsWiFiHistorical:*((unsigned int *)v10 + 6)];
  [v6 setSymptomsWiFiInstant:*((unsigned int *)v14 + 6)];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __112__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__sessionConnectionQualityFromSiriCoreConnectionMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  v5 = [a2 lowercaseString];
  if ([v5 isEqualToString:@"cellularinstant"])
  {
    int v6 = [*(id *)(a1 + 64) qualityFromString:v8];
    uint64_t v7 = a1 + 32;
  }
  else if ([v5 isEqualToString:@"cellularhistorical"])
  {
    int v6 = [*(id *)(a1 + 64) qualityFromString:v8];
    uint64_t v7 = a1 + 40;
  }
  else if ([v5 isEqualToString:@"wifiinstant"])
  {
    int v6 = [*(id *)(a1 + 64) qualityFromString:v8];
    uint64_t v7 = a1 + 48;
  }
  else
  {
    if (![v5 isEqualToString:@"wifihistorical"]) {
      goto LABEL_10;
    }
    int v6 = [*(id *)(a1 + 64) qualityFromString:v8];
    uint64_t v7 = a1 + 56;
  }
  *(_DWORD *)(*(void *)(*(void *)v7 + 8) + 24) = v6;
LABEL_10:
}

+ (int)qualityFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"bad"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"good"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"unavailable"];
  }

  return v4;
}

+ (id)pingInfoFromSiriCoreConnectionMetrics:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F6E478];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  int v6 = [v4 pingCount];
  [v6 doubleValue];
  [v5 setPingCount:v7];

  id v8 = [v4 meanPing];
  [v8 doubleValue];
  [v5 setMeanPingInMs:v9 * 1000.0];

  v10 = [v4 unacknowledgedPingCount];

  [v10 doubleValue];
  [v5 setUnacknowledgedPingCount:v11];

  return v5;
}

+ (id)debugNetworkInterfacesFromSiriCoreConnectionMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v6 = [v4 tcpInfoMetricsByInterfaceName];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke;
  v12[3] = &unk_26443A688;
  id v13 = v4;
  id v15 = a1;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = (objc_class *)MEMORY[0x263F6E468];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  double v9 = [v7 rttCurrent];
  [v9 doubleValue];
  [v8 setRttCurrent:v10];

  double v11 = [v7 rttSmoothed];
  [v11 doubleValue];
  [v8 setRttSmoothed:v12];

  id v13 = [v7 rttVariance];
  [v13 doubleValue];
  [v8 setRttVariance:v14];

  id v15 = [v7 rttBest];
  [v15 doubleValue];
  [v8 setRttBest:v16];

  uint64_t v17 = [v7 packetsSent];
  [v17 doubleValue];
  [v8 setPacketsSent:(unint64_t)v18];

  uint64_t v19 = [v7 packetsReceived];
  [v19 doubleValue];
  [v8 setPacketsReceived:(unint64_t)v20];

  uint64_t v21 = [v7 bytesSent];
  [v21 doubleValue];
  [v8 setBytesSent:(unint64_t)v22];

  uint64_t v23 = [v7 bytesRetransmitted];
  [v23 doubleValue];
  [v8 setBytesRetransmitted:(unint64_t)v24];

  v25 = [v7 bytesUnacked];
  [v25 doubleValue];
  [v8 setBytesUnacked:(unint64_t)v26];

  v27 = [v7 bytesReceived];
  [v27 doubleValue];
  [v8 setBytesReceived:(unint64_t)v28];

  v29 = [v7 duplicateBytesReceived];
  [v29 doubleValue];
  [v8 setDuplicateBytesReceived:(unint64_t)v30];

  double v31 = [v7 outOfOrderBytesReceived];
  [v31 doubleValue];
  [v8 setOutOfOrderBytesReceived:(unint64_t)v32];

  uint64_t v33 = [v7 sendBufferBytes];
  [v33 doubleValue];
  [v8 setSendBufferBytes:(unint64_t)v34];

  uint64_t v35 = [v7 sendBandwidth];
  [v35 doubleValue];
  [v8 setSendBandwidth:(unint64_t)v36];

  v37 = [v7 synRetransmits];
  [v37 doubleValue];
  [v8 setSynRetransmits:v38];

  id v39 = [v7 tfoSynDataAcked];

  [v39 doubleValue];
  [v8 setTfoSynDataAcked:v40];

  v41 = [*(id *)(a1 + 32) subflowSwitchCounts];
  v42 = [v41 objectForKeyedSubscript:v5];
  [v42 doubleValue];
  [v8 setSubflowSwitchCount:v43];

  v44 = [*(id *)(a1 + 32) flowNetworkInterfaceType];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke_2;
  v48[3] = &unk_26443A660;
  uint64_t v45 = *(void *)(a1 + 48);
  id v50 = v8;
  uint64_t v51 = v45;
  id v49 = v5;
  id v46 = v8;
  id v47 = v5;
  [v44 enumerateKeysAndObjectsUsingBlock:v48];

  [*(id *)(a1 + 40) addObject:v46];
}

void __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  double v10 = a2;
  id v7 = a3;
  if (v7 && [(__CFString *)v10 isEqualToString:*(void *)(a1 + 32)])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F6E4C0]);
    if (v10) {
      double v9 = v10;
    }
    else {
      double v9 = &stru_26CD85388;
    }
    [v8 setName:v9];
    objc_msgSend(v8, "setConnectionType:", objc_msgSend(*(id *)(a1 + 48), "connectionTypeFromString:", v7));
    [*(id *)(a1 + 40) setNetworkInterface:v8];
    *a4 = 1;
  }
}

+ (id)debugSessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F6E470];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 wifiPhyMode];
  objc_msgSend(v6, "setWiFiPhyMode:", objc_msgSend(a1, "phyModeFromString:", v7));

  id v8 = [v5 signalStrengthBars];
  [v8 doubleValue];
  objc_msgSend(v6, "setSignalStrengthBars:");

  double v9 = [v5 timeUntilOpen];
  [v9 doubleValue];
  [v6 setOpenTimeInMs:v10 * 1000.0];

  double v11 = [v5 connectedSubflowCount];

  [v11 doubleValue];
  [v6 setConnectedSubflowCount:v12];

  return v6;
}

+ (int)phyModeFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"802.11a"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"802.11b"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"802.11g"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"802.11n"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"802.11ac"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"802.11ax"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"802.11aj"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"802.11ah"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"802.11ad"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)sessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x263F6E4F0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [v5 carrierName];
  id v8 = (void *)v7;
  if (v7) {
    double v9 = (__CFString *)v7;
  }
  else {
    double v9 = &stru_26CD85388;
  }
  [v6 setCarrierName:v9];

  double v10 = [v5 connectionMethod];
  objc_msgSend(v6, "setConnectionMethod:", objc_msgSend(a1, "connectionMethodFromString:", v10));

  uint64_t v11 = [v5 primarySubflowInterfaceName];
  double v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_26CD85388;
  }
  [v6 setPrimarySubflowInterfaceName:v13];

  double v14 = [v5 isCaptive];
  objc_msgSend(v6, "setIsCaptive:", objc_msgSend(v14, "BOOLValue"));

  id v15 = [v5 rssi];
  [v15 doubleValue];
  objc_msgSend(v6, "setRssi:");

  double v16 = [v5 snr];
  [v16 doubleValue];
  objc_msgSend(v6, "setSnr:");

  uint64_t v17 = [v5 cca];
  [v17 doubleValue];
  objc_msgSend(v6, "setClearChannelAssessmentScore:");

  double v18 = [v5 attemptCount];
  [v18 doubleValue];
  [v6 setAttempCount:v19];

  double v20 = [v5 timeUntilFirstByteRead];
  [v20 doubleValue];
  [v6 setFirstByteTime:(unint64_t)(v21 * 1000.0)];

  double v22 = [v5 connectionStartTimeToDNSResolutionTimeMsec];
  [v22 doubleValue];
  [v6 setStartToDNSResolution:(unint64_t)v23];

  double v24 = [v5 dnsResolutionTime];
  [v24 doubleValue];
  [v6 setDnsResolutionTime:(unint64_t)v25];

  uint64_t v26 = [v5 tlsVersion];
  v27 = (void *)v26;
  if (v26) {
    double v28 = (__CFString *)v26;
  }
  else {
    double v28 = &stru_26CD85388;
  }
  objc_msgSend(v6, "setTlsVersion:", objc_msgSend(a1, "tlsFromString:", v28));

  v29 = [v5 tlsHandshakeTimeMsec];
  [v29 doubleValue];
  [v6 setTlsHandshakeTime:(unint64_t)v30];

  double v31 = [v5 connectionEstablishmentTimeMsec];
  [v31 doubleValue];
  [v6 setConnectionEstablishmentTime:(unint64_t)v32];

  uint64_t v33 = [v5 connectionStartTimeToConnectionEstablishmentTimeMsec];
  [v33 doubleValue];
  [v6 setConnectionStartToEstablishmentTime:(unint64_t)v34];

  uint64_t v35 = [v5 connectionStartTimeToTLSHandshakeTimeMsec];

  [v35 doubleValue];
  [v6 setConnectionStartToTLSHandshake:(unint64_t)v36];

  return v6;
}

+ (id)networkInterfacesFromDictionary:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__networkInterfacesFromDictionary___block_invoke;
  v9[3] = &unk_26443A638;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __90__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__networkInterfacesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = (objc_class *)MEMORY[0x263F6E4C0];
    id v6 = a3;
    id v7 = a2;
    id v8 = objc_alloc_init(v5);
    id v11 = v8;
    if (v7) {
      double v9 = v7;
    }
    else {
      double v9 = &stru_26CD85388;
    }
    [v8 setName:v9];

    uint64_t v10 = [*(id *)(a1 + 40) connectionTypeFromString:v6];
    [v11 setConnectionType:v10];
    [*(id *)(a1 + 32) addObject:v11];
  }
}

+ (int)connectionTypeFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 containsString:@"wi-fi"])
  {
    int v4 = 1;
  }
  else if ([v3 containsString:@"wwan"])
  {
    int v4 = 2;
  }
  else if ([v3 containsString:@"utran"])
  {
    int v4 = 3;
  }
  else if ([v3 containsString:@"2g cdma1x"])
  {
    int v4 = 4;
  }
  else if ([v3 containsString:@"lte"])
  {
    int v4 = 5;
  }
  else if ([v3 containsString:@"2g gprs"])
  {
    int v4 = 6;
  }
  else if ([v3 containsString:@"2g edge"])
  {
    int v4 = 7;
  }
  else if ([v3 containsString:@"3g wcdma"])
  {
    int v4 = 8;
  }
  else if ([v3 containsString:@"3g hsdpa"])
  {
    int v4 = 9;
  }
  else if ([v3 containsString:@"3g evdorev0"])
  {
    int v4 = 10;
  }
  else if ([v3 containsString:@"3g evdoreva"])
  {
    int v4 = 11;
  }
  else if ([v3 containsString:@"cdma evdorevb"])
  {
    int v4 = 12;
  }
  else if ([v3 containsString:@"hrpd"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"mptcp"])
  {
    int v4 = 14;
  }
  else if ([v3 containsString:@"lednelly"])
  {
    int v4 = 15;
  }
  else if ([v3 containsString:@"ids"])
  {
    int v4 = 16;
  }
  else if ([v3 containsString:@"pop"])
  {
    int v4 = 17;
  }
  else if ([v3 containsString:@"florence"])
  {
    int v4 = 18;
  }
  else if ([v3 containsString:@"local"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"nwmptcp"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"5g nrnsa"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"5g nr"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)connectionMethodFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 containsString:@"peer"])
  {
    int v4 = 1;
  }
  else if ([v3 containsString:@"tuscany"])
  {
    int v4 = 2;
  }
  else if ([v3 containsString:@"florence"])
  {
    int v4 = 3;
  }
  else if ([v3 containsString:@"mptcp_policybanned"])
  {
    int v4 = 4;
  }
  else if ([v3 containsString:@"tcp_policybanned"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"mptcp"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"tcp"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)tlsFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"tls14"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"tls13"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"tls12"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"tls11"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"tls10"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"ssl30"];
  }

  return v4;
}

+ (int)snapshotStateFromStringEvent:(id)a3
{
  return [a3 isEqualToString:@"requestEnd"];
}

+ (id)handShakeProtocolFromArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = objc_alloc_init(MEMORY[0x263F6E4A8]);
          double v12 = [v10 objectForKey:@"protocol"];
          if (v12)
          {
            v3 = [v10 objectForKey:@"protocol"];
            id v13 = v3;
          }
          else
          {
            id v13 = &stru_26CD85388;
          }
          objc_msgSend(v11, "setProtocol:", objc_msgSend(a1, "handshakeProtocolFromString:", v13));
          if (v12) {

          }
          double v14 = [v10 objectForKey:@"handShakeRTT"];
          if (v14)
          {
            id v15 = [v10 objectForKey:@"handShakeRTT"];
            [v15 doubleValue];
            [v11 setHandShakeRTT:v16];
          }
          else
          {
            [v11 setHandShakeRTT:0];
          }

          uint64_t v17 = [v10 objectForKey:@"handShakeDuration"];
          if (v17)
          {
            double v18 = [v10 objectForKey:@"handShakeDuration"];
            [v18 doubleValue];
            [v11 setHandShakeDuration:(unint64_t)v19];
          }
          else
          {
            [v11 setHandShakeDuration:0];
          }

          [v22 addObject:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  return v22;
}

+ (int)handshakeProtocolFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 containsString:@"tcp"])
  {
    int v4 = 1;
  }
  else if ([v3 containsString:@"tls"])
  {
    int v4 = 2;
  }
  else if ([v3 containsString:@"http"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)proxyConfigurationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F6E4D8]);
  uint64_t v5 = [v3 objectForKey:@"proxyConfigured"];
  if (v5)
  {
    uint64_t v6 = [v3 objectForKey:@"proxyConfigured"];
    objc_msgSend(v4, "setIsProxyConfigured:", objc_msgSend(v6, "BOOLValue"));
  }
  else
  {
    [v4 setIsProxyConfigured:0];
  }

  uint64_t v7 = [v3 objectForKey:@"usingConfiguredProxy"];
  if (v7)
  {
    id v8 = [v3 objectForKey:@"usingConfiguredProxy"];
    objc_msgSend(v4, "setUsingConfiguredProxy:", objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    [v4 setUsingConfiguredProxy:0];
  }

  return v4;
}

+ (id)establishmentResolutionFromArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = objc_alloc_init(MEMORY[0x263F6E4A0]);
          id v13 = [v11 objectForKey:@"duration"];
          if (v13)
          {
            double v14 = [v11 objectForKey:@"duration"];
            [v14 doubleValue];
            [v12 setDuration:(unint64_t)v15];
          }
          else
          {
            [v12 setDuration:0];
          }

          double v16 = [v11 objectForKey:@"resolutionSource"];
          if (v16)
          {
            uint64_t v17 = [v11 objectForKey:@"resolutionSource"];
            [v17 doubleValue];
            [v12 setResolutionSource:v18];
          }
          else
          {
            [v12 setResolutionSource:0];
          }

          double v19 = [v11 objectForKey:@"successfulEndpoint"];
          if (v19)
          {
            id v4 = [v11 objectForKey:@"successfulEndpoint"];
            double v20 = v4;
          }
          else
          {
            double v20 = &unk_26CD90AB0;
          }
          double v21 = [a1 endpointFromDictionary:v20];
          [v12 setSuccessfulEndpoint:v21];

          if (v19) {
          id v22 = [v11 objectForKey:@"preferredEndpoint"];
          }
          if (v22)
          {
            id v3 = [v11 objectForKey:@"preferredEndpoint"];
            double v23 = v3;
          }
          else
          {
            double v23 = &unk_26CD90AB0;
          }
          long long v24 = [a1 endpointFromDictionary:v23];
          [v12 setPreferredEndpoint:v24];

          if (v22) {
          long long v25 = [v11 objectForKey:@"endpointCount"];
          }
          if (v25)
          {
            long long v26 = [v11 objectForKey:@"endpointCount"];
            [v26 doubleValue];
            [v12 setEndpointCount:v27];
          }
          else
          {
            [v12 setEndpointCount:0];
          }

          [v29 addObject:v12];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  return v29;
}

+ (int)pathStatusFromNumber:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&unk_26CD90AB0])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AC8])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AE0])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AF8])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)pathInterfacesFromArray:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = objc_alloc_init(MEMORY[0x263F6E4C8]);
          id v12 = [v10 objectForKey:@"type"];
          if (v12)
          {
            id v3 = [v10 objectForKey:@"type"];
            id v13 = v3;
          }
          else
          {
            id v13 = &unk_26CD90AB0;
          }
          objc_msgSend(v11, "setType:", objc_msgSend(a1, "pathTypeFromNumber:", v13));
          if (v12) {

          }
          double v14 = [v10 objectForKey:@"name"];
          if (v14)
          {
            double v15 = [v10 objectForKey:@"name"];
            [v11 setName:v15];
          }
          else
          {
            [v11 setName:&stru_26CD85388];
          }

          double v16 = [v10 objectForKey:@"index"];
          if (v16)
          {
            uint64_t v17 = [v10 objectForKey:@"index"];
            [v17 doubleValue];
            [v11 setIndex:v18];
          }
          else
          {
            [v11 setIndex:0];
          }

          [v21 addObject:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v21;
}

+ (int)pathTypeFromNumber:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&unk_26CD90AB0])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AC8])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AE0])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AF8])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90B10])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)endpointsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = objc_msgSend(a1, "endpointFromDictionary:", v11, (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)endpointFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F6E490]);
  id v6 = [v4 objectForKey:@"type"];
  if (v6)
  {
    uint64_t v7 = [v4 objectForKey:@"type"];
  }
  else
  {
    uint64_t v7 = &unk_26CD90AB0;
  }
  objc_msgSend(v5, "setType:", objc_msgSend(a1, "endpointTypeFromNumber:", v7));
  if (v6) {

  }
  uint64_t v8 = [v4 objectForKey:@"port"];
  if (v8)
  {
    uint64_t v9 = [v4 objectForKey:@"port"];
    [v9 doubleValue];
    [v5 setPort:v10];
  }
  else
  {
    [v5 setPort:0];
  }

  return v5;
}

+ (int)endpointTypeFromNumber:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&unk_26CD90AB0])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AC8])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AE0])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90AF8])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToNumber:&unk_26CD90B10])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netIdForRequestLink, 0);
  objc_storeStrong((id *)&self->_peerConnectionFailedEvent, 0);
  objc_storeStrong((id *)&self->_sessionConnectionFailedEvent, 0);
  objc_storeStrong((id *)&self->_debugSessionConnectionSnapthotEvent, 0);
  objc_storeStrong((id *)&self->_sessionConnectionSnapthotEvent, 0);
  objc_storeStrong((id *)&self->_debugReadySnapshotEvent, 0);
  objc_storeStrong((id *)&self->_readySnapshotEvent, 0);
  objc_storeStrong((id *)&self->_debugPreparationSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_preparationSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_httpHeaderEvent, 0);
  objc_storeStrong((id *)&self->_orchestratorRequestId, 0);
  objc_storeStrong((id *)&self->_networkConnectionId, 0);
  objc_storeStrong((id *)&self->_netId, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)logPeerConnectionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SiriCoreNetworkingAnalytics_logPeerConnectionFailed___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __55__SiriCoreNetworkingAnalytics_logPeerConnectionFailed___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
    id v7 = "%s No netId generated";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 120) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Peer connection failed already sent for netId %@";
    uint64_t v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 120);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setPeerConnectionFailed:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _peerConnectionFailedEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 120) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logSessionConnectionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SiriCoreNetworkingAnalytics_logSessionConnectionFailed___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __58__SiriCoreNetworkingAnalytics_logSessionConnectionFailed___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
    id v7 = "%s No netId generated";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 112) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Session connection failed already sent for netId %@";
    uint64_t v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 112);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setSessionConnectionFailed:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _sessionConnectionFailedEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 112) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = a3;
  if ([(SiriCoreNetworkingAnalytics *)self emitLogDebug])
  {
    uint64_t v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SiriCoreNetworkingAnalytics_logDebugSessionConnectionSnapshotCaptured___block_invoke;
    block[3] = &unk_26443AAA8;
    block[4] = self;
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(queue, block);
  }
}

void __73__SiriCoreNetworkingAnalytics_logDebugSessionConnectionSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v25 = 136315138;
    uint64_t v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 104) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v25 = 136315394;
    uint64_t v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v6;
    id v7 = "%s Debug session connection snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v25, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 104);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setDebugSessionConnectionSnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = (void *)*MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      double v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(v19 + 16);
      int v22 = v18;
      int v25 = 136315650;
      uint64_t v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      __int16 v29 = 1024;
      int v30 = [v20 sequenceNumber];
      _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_INFO, "%s _debugSessionConnectionSnapthotEvent emitted: %@, sequenceNumber: %u", (uint8_t *)&v25, 0x1Cu);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 104) setTimestamp:*(void *)(a1 + 48)];
    long long v23 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
      int v25 = 136315394;
      uint64_t v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_INFO, "%s No _netIdForRequestLink for netId: %@", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SiriCoreNetworkingAnalytics_logSessionConnectionSnapshotCaptured___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __68__SiriCoreNetworkingAnalytics_logSessionConnectionSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v25 = 136315138;
    uint64_t v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 96) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v25 = 136315394;
    uint64_t v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v6;
    id v7 = "%s Session connection snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v25, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 96);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setSessionConnectionSnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = (void *)*MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      double v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(v19 + 16);
      int v22 = v18;
      int v25 = 136315650;
      uint64_t v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      __int16 v29 = 1024;
      int v30 = [v20 sequenceNumber];
      _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_INFO, "%s _sessionConnectionSnapthotEvent emitted: %@, sequenceNumber: %u", (uint8_t *)&v25, 0x1Cu);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 96) setTimestamp:*(void *)(a1 + 48)];
    long long v23 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
      int v25 = 136315394;
      uint64_t v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_INFO, "%s No _netIdForRequestLink for netId: %@", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = a3;
  if ([(SiriCoreNetworkingAnalytics *)self emitLogDebug])
  {
    uint64_t v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStateReadySnapshotCaptured___block_invoke;
    block[3] = &unk_26443AAA8;
    block[4] = self;
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(queue, block);
  }
}

void __83__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStateReadySnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 88) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Debug ready snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 88);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setDebugNetworkConnectionStateReadySnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _debugReadySnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 88) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SiriCoreNetworkingAnalytics_logNetworkConnectionStateReadySnapshotCaptured___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __78__SiriCoreNetworkingAnalytics_logNetworkConnectionStateReadySnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 80) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Ready snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 80);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setNetworkConnectionStateReadySnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _readySnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 80) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = a3;
  if ([(SiriCoreNetworkingAnalytics *)self emitLogDebug])
  {
    uint64_t v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStatePreparationSnapshotCaptured___block_invoke;
    block[3] = &unk_26443AAA8;
    block[4] = self;
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(queue, block);
  }
}

void __89__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStatePreparationSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 72) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Debug preparation snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 72);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setDebugNetworkConnectionStatePreparationSnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _debugPreparationSnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 72) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SiriCoreNetworkingAnalytics_logNetworkConnectionStatePreparationSnapshotCaptured___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __84__SiriCoreNetworkingAnalytics_logNetworkConnectionStatePreparationSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 64) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Preparation snapshot already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 64);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setNetworkConnectionStatePreparationSnapshotCaptured:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _preparationSnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 64) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SiriCoreNetworkingAnalytics_logSessionConnectionHttpHeaderCreated___block_invoke;
  block[3] = &unk_26443AAA8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(queue, block);
}

void __69__SiriCoreNetworkingAnalytics_logSessionConnectionHttpHeaderCreated___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v10 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 136315138;
    long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
    id v7 = "%s No netId generated";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  id v3 = [*(id *)(v1 + 56) netId];
  int v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 136315394;
    long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    id v7 = "%s Http header already sent for netId %@";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 56);
  id v13 = (void *)[*(id *)(v11 + 16) copy];
  [v12 setNetId:v13];

  long long v14 = [*(id *)(a1 + 32) _createSchemaClientEventFromNetId:*(void *)(*(void *)(a1 + 32) + 16) networkConnectionId:*(void *)(*(void *)(a1 + 32) + 24) connectionProvider:*(unsigned int *)(*(void *)(a1 + 32) + 32)];
  [v14 setSessionConnectionHttpHeaderCreated:*(void *)(a1 + 40)];
  char v15 = [*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v15)
  {
    [v16 setClientEvent:0];
    long long v17 = [MEMORY[0x263F6C818] sharedStream];
    [v17 emitMessage:v14 timestamp:*(void *)(a1 + 48)];

    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      double v20 = "%s _httpHeaderEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    [v16 setClientEvent:v14];
    [*(id *)(*(void *)(a1 + 32) + 56) setTimestamp:*(void *)(a1 + 48)];
    double v18 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 136315394;
      long long v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      double v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__SiriCoreNetworkingAnalytics_logRequestLinkBetweenOrchestratorAndNetworkComponent__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

void __83__SiriCoreNetworkingAnalytics_logRequestLinkBetweenOrchestratorAndNetworkComponent__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    id v8 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    uint64_t v5 = "%s No netId generated";
LABEL_16:
    uint64_t v6 = v8;
    uint32_t v7 = 12;
LABEL_17:
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v24, v7);
    return;
  }
  if (objc_msgSend(*(id *)(v1 + 128), "isEqual:"))
  {
    id v3 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    int v24 = 136315394;
    uint64_t v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    uint64_t v5 = "%s Request Link already sent for netId %@";
    uint64_t v6 = v3;
    uint32_t v7 = 22;
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 40))
  {
    id v8 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    uint64_t v5 = "%s No orchestrator requestId";
    goto LABEL_16;
  }
  if (!*(unsigned char *)(v9 + 48))
  {
    id v8 = *MEMORY[0x263F28338];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    uint64_t v5 = "%s No active connection";
    goto LABEL_16;
  }
  uint64_t v10 = [(id)v9 _createRequestLinkInfoFromUUID:*(void *)(v9 + 16) component:18];
  uint64_t v11 = [*(id *)(a1 + 32) _createRequestLinkInfoFromUUID:*(void *)(*(void *)(a1 + 32) + 40) component:1];
  uint64_t v12 = mach_absolute_time();
  id v13 = objc_alloc_init(MEMORY[0x263F6EDB8]);
  [v13 setSource:v10];
  [v13 setTarget:v11];
  long long v14 = [MEMORY[0x263F6C818] sharedStream];
  [v14 emitMessage:v13 timestamp:v12];

  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v16 = *(void *)(a1 + 32);
  long long v17 = *(void **)(v16 + 128);
  *(void *)(v16 + 128) = v15;

  double v18 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v19 + 16);
    uint64_t v21 = *(void *)(v19 + 40);
    int v24 = 136315650;
    uint64_t v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    __int16 v26 = 2112;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, "%s netId: %@, orchestratorRequestId: %@", (uint8_t *)&v24, 0x20u);
  }
  int v22 = *(id **)(a1 + 32);
  long long v23 = (void *)[v22[2] copy];
  [v22 _emitAllCachedMessagesFor:v23];
}

- (void)_emitAllCachedMessagesFor:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SiriCoreNetworkingAnalytics__emitAllCachedMessagesFor___block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__SiriCoreNetworkingAnalytics__emitAllCachedMessagesFor___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  uint64_t v4 = [*(id *)(v2 + 56) netId];
  if ([v3 isEqual:v4])
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) clientEvent];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F6C818] sharedStream];
      uint32_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) clientEvent];
      objc_msgSend(v6, "emitMessage:timestamp:", v7, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "timestamp"));

      id v8 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v9;
        _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s _httpHeaderEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 16);
  uint64_t v12 = [*(id *)(v10 + 64) netId];
  if ([v11 isEqual:v12])
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 64) clientEvent];

    if (v13)
    {
      long long v14 = [MEMORY[0x263F6C818] sharedStream];
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 64) clientEvent];
      objc_msgSend(v14, "emitMessage:timestamp:", v15, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "timestamp"));

      uint64_t v16 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v17;
        _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_INFO, "%s _preparationSnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 16);
  uint64_t v20 = [*(id *)(v18 + 72) netId];
  if ([v19 isEqual:v20])
  {
    uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 72) clientEvent];

    if (v21)
    {
      int v22 = [MEMORY[0x263F6C818] sharedStream];
      long long v23 = [*(id *)(*(void *)(a1 + 32) + 72) clientEvent];
      objc_msgSend(v22, "emitMessage:timestamp:", v23, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "timestamp"));

      int v24 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v25;
        _os_log_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_INFO, "%s _debugPreparationSnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void **)(v26 + 16);
  __int16 v28 = [*(id *)(v26 + 80) netId];
  if ([v27 isEqual:v28])
  {
    uint64_t v29 = [*(id *)(*(void *)(a1 + 32) + 80) clientEvent];

    if (v29)
    {
      uint64_t v30 = [MEMORY[0x263F6C818] sharedStream];
      uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 80) clientEvent];
      objc_msgSend(v30, "emitMessage:timestamp:", v31, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "timestamp"));

      long long v32 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v33;
        _os_log_impl(&dword_21CBF7000, v32, OS_LOG_TYPE_INFO, "%s _readySnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v34 = *(void *)(a1 + 32);
  long long v35 = *(void **)(v34 + 16);
  double v36 = [*(id *)(v34 + 88) netId];
  if ([v35 isEqual:v36])
  {
    uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 88) clientEvent];

    if (v37)
    {
      double v38 = [MEMORY[0x263F6C818] sharedStream];
      id v39 = [*(id *)(*(void *)(a1 + 32) + 88) clientEvent];
      objc_msgSend(v38, "emitMessage:timestamp:", v39, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "timestamp"));

      double v40 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v41;
        _os_log_impl(&dword_21CBF7000, v40, OS_LOG_TYPE_INFO, "%s _debugReadySnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v42 = *(void *)(a1 + 32);
  double v43 = *(void **)(v42 + 16);
  v44 = [*(id *)(v42 + 96) netId];
  if ([v43 isEqual:v44])
  {
    uint64_t v45 = [*(id *)(*(void *)(a1 + 32) + 96) clientEvent];

    if (v45)
    {
      id v46 = [MEMORY[0x263F6C818] sharedStream];
      id v47 = [*(id *)(*(void *)(a1 + 32) + 96) clientEvent];
      objc_msgSend(v46, "emitMessage:timestamp:", v47, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "timestamp"));

      v48 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v49;
        _os_log_impl(&dword_21CBF7000, v48, OS_LOG_TYPE_INFO, "%s _sessionConnectionSnapthotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v50 = *(void *)(a1 + 32);
  uint64_t v51 = *(void **)(v50 + 16);
  v52 = [*(id *)(v50 + 104) netId];
  if ([v51 isEqual:v52])
  {
    v53 = [*(id *)(*(void *)(a1 + 32) + 104) clientEvent];

    if (v53)
    {
      v54 = [MEMORY[0x263F6C818] sharedStream];
      v55 = [*(id *)(*(void *)(a1 + 32) + 104) clientEvent];
      objc_msgSend(v54, "emitMessage:timestamp:", v55, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "timestamp"));

      v56 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v57;
        _os_log_impl(&dword_21CBF7000, v56, OS_LOG_TYPE_INFO, "%s _debugSessionConnectionSnapthotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v58 = *(void *)(a1 + 32);
  v59 = *(void **)(v58 + 16);
  v60 = [*(id *)(v58 + 112) netId];
  if ([v59 isEqual:v60])
  {
    v61 = [*(id *)(*(void *)(a1 + 32) + 112) clientEvent];

    if (v61)
    {
      v62 = [MEMORY[0x263F6C818] sharedStream];
      v63 = [*(id *)(*(void *)(a1 + 32) + 112) clientEvent];
      objc_msgSend(v62, "emitMessage:timestamp:", v63, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "timestamp"));

      v64 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v65 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v65;
        _os_log_impl(&dword_21CBF7000, v64, OS_LOG_TYPE_INFO, "%s _sessionConnectionFailedEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  uint64_t v66 = *(void *)(a1 + 32);
  v67 = *(void **)(v66 + 16);
  v68 = [*(id *)(v66 + 120) netId];
  if ([v67 isEqual:v68])
  {
    v69 = [*(id *)(*(void *)(a1 + 32) + 120) clientEvent];

    if (v69)
    {
      v70 = [MEMORY[0x263F6C818] sharedStream];
      v71 = [*(id *)(*(void *)(a1 + 32) + 120) clientEvent];
      objc_msgSend(v70, "emitMessage:timestamp:", v71, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "timestamp"));

      v72 = *MEMORY[0x263F28338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
      {
        uint64_t v73 = *(void *)(*(void *)(a1 + 32) + 16);
        int v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        __int16 v77 = 2112;
        uint64_t v78 = v73;
        _os_log_impl(&dword_21CBF7000, v72, OS_LOG_TYPE_INFO, "%s _peerConnectionFailedEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {
  }
  [*(id *)(*(void *)(a1 + 32) + 56) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 64) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 72) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 80) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 88) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 96) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 104) setClientEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 112) setClientEvent:0];
  return [*(id *)(*(void *)(a1 + 32) + 120) setClientEvent:0];
}

- (id)_createSchemaClientEventFromNetId:(id)a3 networkConnectionId:(id)a4 connectionProvider:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint32_t v7 = (objc_class *)MEMORY[0x263F6E448];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_alloc_init(MEMORY[0x263F6E450]);
  [v10 setEventMetadata:v11];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v9];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v8];

  long long v14 = [v10 eventMetadata];
  [v14 setNetId:v12];

  uint64_t v15 = [v10 eventMetadata];
  [v15 setNetworkConnectionId:v13];

  uint64_t v16 = [v10 eventMetadata];
  [v16 setProvider:v5];

  return v10;
}

- (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = (objc_class *)MEMORY[0x263F6EEE0];
  id v6 = a3;
  uint32_t v7 = (void *)[[v5 alloc] initWithNSUUID:v6];

  id v8 = objc_alloc_init(MEMORY[0x263F6EDC0]);
  [v8 setUuid:v7];
  [v8 setComponent:v4];

  return v8;
}

- (BOOL)emitLogDebug
{
  if (!arc4random_uniform(0xAu)) {
    return 1;
  }

  return AFIsInternalInstall();
}

- (id)orchestratorRequestId
{
  uint64_t v6 = 0;
  uint32_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2390;
  id v10 = __Block_byref_object_dispose__2391;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SiriCoreNetworkingAnalytics_orchestratorRequestId__block_invoke;
  v5[3] = &unk_26443AB20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__SiriCoreNetworkingAnalytics_orchestratorRequestId__block_invoke(uint64_t a1)
{
}

- (void)setOrchestratorRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SiriCoreNetworkingAnalytics_setOrchestratorRequestId___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__SiriCoreNetworkingAnalytics_setOrchestratorRequestId___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
    int v7 = 136315394;
    id v8 = "-[SiriCoreNetworkingAnalytics setOrchestratorRequestId:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s OrchestratorRequestId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)resetSequenceNumber
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SiriCoreNetworkingAnalytics_resetSequenceNumber__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__SiriCoreNetworkingAnalytics_resetSequenceNumber__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 52) = 1;
  return result;
}

- (void)increaseSequenceNumber
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SiriCoreNetworkingAnalytics_increaseSequenceNumber__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__SiriCoreNetworkingAnalytics_increaseSequenceNumber__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  unsigned int v2 = *(_DWORD *)(v1 + 52);
  if (v2 <= 0x3E8) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = 1;
  }
  *(_DWORD *)(v1 + 52) = v3;
  return result;
}

- (BOOL)isNetIdAvailable
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SiriCoreNetworkingAnalytics_isNetIdAvailable__block_invoke;
  v5[3] = &unk_26443AB20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__SiriCoreNetworkingAnalytics_isNetIdAvailable__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 49);
  unsigned int v2 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 49)) {
      char v3 = @"YES";
    }
    else {
      char v3 = @"NO";
    }
    int v4 = 136315394;
    uint64_t v5 = "-[SiriCoreNetworkingAnalytics isNetIdAvailable]_block_invoke";
    __int16 v6 = 2112;
    int v7 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s NetId available: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setNetIdAvailable:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SiriCoreNetworkingAnalytics_setNetIdAvailable___block_invoke;
  v4[3] = &unk_26443AA80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __49__SiriCoreNetworkingAnalytics_setNetIdAvailable___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = *(unsigned char *)(a1 + 40);
  unsigned int v2 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 49)) {
      char v3 = @"YES";
    }
    else {
      char v3 = @"NO";
    }
    int v4 = 136315394;
    BOOL v5 = "-[SiriCoreNetworkingAnalytics setNetIdAvailable:]_block_invoke";
    __int16 v6 = 2112;
    int v7 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s NetId available: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setIsConnectionActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SiriCoreNetworkingAnalytics_setIsConnectionActive___block_invoke;
  v4[3] = &unk_26443AA80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __53__SiriCoreNetworkingAnalytics_setIsConnectionActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = *(unsigned char *)(result + 40);
  return result;
}

- (unsigned)getSequenceNumber
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SiriCoreNetworkingAnalytics_getSequenceNumber__block_invoke;
  v5[3] = &unk_26443AB20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SiriCoreNetworkingAnalytics_getSequenceNumber__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 52);
  return result;
}

- (void)setConnectionProvider:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SiriCoreNetworkingAnalytics_setConnectionProvider___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__SiriCoreNetworkingAnalytics_setConnectionProvider___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(_DWORD *)(*(void *)(a1 + 32) + 32) = +[SiriCoreNetworkingAnalytics providerFromString:*(void *)(a1 + 40)];
  unsigned int v2 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315394;
    BOOL v5 = "-[SiriCoreNetworkingAnalytics setConnectionProvider:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s ConnectionProvider Updated: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setNetworkConnectionId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SiriCoreNetworkingAnalytics_setNetworkConnectionId___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__SiriCoreNetworkingAnalytics_setNetworkConnectionId___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  unsigned int v2 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v4 = 136315394;
    BOOL v5 = "-[SiriCoreNetworkingAnalytics setNetworkConnectionId:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s NetworkConnectionId Updated: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setNetId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SiriCoreNetworkingAnalytics_setNetId___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __40__SiriCoreNetworkingAnalytics_setNetId___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  BOOL v5 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136315394;
    id v8 = "-[SiriCoreNetworkingAnalytics setNetId:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s NetId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)resetNetId
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SiriCoreNetworkingAnalytics_resetNetId__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__SiriCoreNetworkingAnalytics_resetNetId__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  BOOL v5 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136315394;
    id v8 = "-[SiriCoreNetworkingAnalytics resetNetId]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s NetId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)reset
{
  [(SiriCoreNetworkingAnalytics *)self resetNetId];

  [(SiriCoreNetworkingAnalytics *)self resetSequenceNumber];
}

- (id)_init
{
  v26.receiver = self;
  v26.super_class = (Class)SiriCoreNetworkingAnalytics;
  uint64_t v2 = [(SiriCoreNetworkingAnalytics *)&v26 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistantd.siricore.networking.analytics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_sequenceNumber = 0;
    *(_WORD *)&v2->_isConnectionActive = 0;
    uint64_t v7 = objc_opt_new();
    httpHeaderEvent = v2->_httpHeaderEvent;
    v2->_httpHeaderEvent = (SiriCoreNetEventMessage *)v7;

    uint64_t v9 = objc_opt_new();
    preparationSnapshotEvent = v2->_preparationSnapshotEvent;
    v2->_preparationSnapshotEvent = (SiriCoreNetEventMessage *)v9;

    uint64_t v11 = objc_opt_new();
    debugPreparationSnapshotEvent = v2->_debugPreparationSnapshotEvent;
    v2->_debugPreparationSnapshotEvent = (SiriCoreNetEventMessage *)v11;

    uint64_t v13 = objc_opt_new();
    readySnapshotEvent = v2->_readySnapshotEvent;
    v2->_readySnapshotEvent = (SiriCoreNetEventMessage *)v13;

    uint64_t v15 = objc_opt_new();
    debugReadySnapshotEvent = v2->_debugReadySnapshotEvent;
    v2->_debugReadySnapshotEvent = (SiriCoreNetEventMessage *)v15;

    uint64_t v17 = objc_opt_new();
    sessionConnectionSnapthotEvent = v2->_sessionConnectionSnapthotEvent;
    v2->_sessionConnectionSnapthotEvent = (SiriCoreNetEventMessage *)v17;

    uint64_t v19 = objc_opt_new();
    debugSessionConnectionSnapthotEvent = v2->_debugSessionConnectionSnapthotEvent;
    v2->_debugSessionConnectionSnapthotEvent = (SiriCoreNetEventMessage *)v19;

    uint64_t v21 = objc_opt_new();
    sessionConnectionFailedEvent = v2->_sessionConnectionFailedEvent;
    v2->_sessionConnectionFailedEvent = (SiriCoreNetEventMessage *)v21;

    uint64_t v23 = objc_opt_new();
    peerConnectionFailedEvent = v2->_peerConnectionFailedEvent;
    v2->_peerConnectionFailedEvent = (SiriCoreNetEventMessage *)v23;
  }
  return v2;
}

- (SiriCoreNetworkingAnalytics)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SiriCoreNetworkingAnalytics.m", 55, @"%s is marked as NS_UNAVAILABLE. Use the designated initializer instead.", "-[SiriCoreNetworkingAnalytics init]");

  return 0;
}

+ (id)sharedSiriCoreNetworkingAnalytics
{
  if (sharedSiriCoreNetworkingAnalytics_onceToken != -1) {
    dispatch_once(&sharedSiriCoreNetworkingAnalytics_onceToken, &__block_literal_global_2417);
  }
  uint64_t v2 = (void *)sharedSiriCoreNetworkingAnalytics_shared;

  return v2;
}

uint64_t __64__SiriCoreNetworkingAnalytics_sharedSiriCoreNetworkingAnalytics__block_invoke()
{
  sharedSiriCoreNetworkingAnalytics_shared = [[SiriCoreNetworkingAnalytics alloc] _init];

  return MEMORY[0x270F9A758]();
}

@end