@interface WiFiUsageConnectionQualityRecord
- (GEOWiFiConnectionQuality)geoMessage;
- (NSString)identifier;
- (WiFiUsageConnectionQualityRecord)initWithUsageSession:(id)a3 andNeighborBssList:(id)a4 andOtherBssList:(id)a5;
- (void)queryNetworkPerformanceFeedAndSubmitToGeoWiFi;
- (void)setGeoMessage:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation WiFiUsageConnectionQualityRecord

- (WiFiUsageConnectionQualityRecord)initWithUsageSession:(id)a3 andNeighborBssList:(id)a4 andOtherBssList:(id)a5
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!objc_opt_class())
  {
    v66 = 0;
    goto LABEL_72;
  }
  v137 = v10;
  v139 = v9;
  v153.receiver = self;
  v153.super_class = (Class)WiFiUsageConnectionQualityRecord;
  v11 = [(WiFiUsageConnectionQualityRecord *)&v153 init];
  v12 = NSString;
  v13 = [v8 networkDetails];
  v14 = [v13 networkName];
  v15 = [v8 networkDetails];
  v16 = [v15 connectedBss];
  v17 = [v16 bssid];
  uint64_t v18 = [v12 stringWithFormat:@"%@-%@", v14, v17];
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v18;

  v20 = (GEOWiFiConnectionQuality *)objc_alloc_init(MEMORY[0x1E4F64C18]);
  geoMessage = v11->_geoMessage;
  v11->_geoMessage = v20;

  -[GEOWiFiConnectionQuality setPacketsIn:](v11->_geoMessage, "setPacketsIn:", [v8 totalRxFrames]);
  -[GEOWiFiConnectionQuality setPacketsOut:](v11->_geoMessage, "setPacketsOut:", [v8 totalTxFrames]);
  v22 = v11->_geoMessage;
  v23 = +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", [v8 netInterfaceRxBytes]);
  -[GEOWiFiConnectionQuality setBytesInTotal:](v22, "setBytesInTotal:", [v23 unsignedLongLongValue]);

  v24 = v11->_geoMessage;
  v25 = +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", [v8 netInterfaceTxBytes]);
  -[GEOWiFiConnectionQuality setBytesOutTotal:](v24, "setBytesOutTotal:", [v25 unsignedLongLongValue]);

  -[GEOWiFiConnectionQuality setCca:](v11->_geoMessage, "setCca:", [v8 averageCca]);
  -[GEOWiFiConnectionQuality setRssi:](v11->_geoMessage, "setRssi:", [v8 lastRssi]);
  -[GEOWiFiConnectionQuality setSnr:](v11->_geoMessage, "setSnr:", [v8 averageSnr]);
  v26 = v11->_geoMessage;
  v27 = [v8 networkDetails];
  v28 = [v27 connectedBss];
  v29 = [v28 bssid];
  [(GEOWiFiConnectionQuality *)v26 setUniqueID:v29];

  v30 = v11->_geoMessage;
  v31 = [v8 networkDetails];
  -[GEOWiFiConnectionQuality setHotspot20:](v30, "setHotspot20:", [v31 isPasspoint]);

  v32 = v11->_geoMessage;
  v33 = [v8 networkDetails];
  v34 = [v33 connectedBss];
  -[GEOWiFiConnectionQuality setBand:](v32, "setBand:", [v34 band]);

  v35 = v11->_geoMessage;
  v36 = [v8 networkDetails];
  v37 = [v36 connectedBss];
  -[GEOWiFiConnectionQuality setChannel:](v35, "setChannel:", [v37 channel]);

  v38 = v11->_geoMessage;
  v39 = [v8 networkDetails];
  v40 = [v39 connectedBss];
  -[GEOWiFiConnectionQuality setChannelWidth:](v38, "setChannelWidth:", [v40 channelWidth]);

  v41 = v11->_geoMessage;
  v42 = [v8 networkDetails];
  v43 = [v42 connectedBss];
  -[GEOWiFiConnectionQuality setPhyMode:](v41, "setPhyMode:", [v43 phyMode]);

  v44 = v11->_geoMessage;
  v45 = [v8 networkDetails];
  v46 = [v45 connectedBss];
  -[GEOWiFiConnectionQuality setIsEdgeBSS:](v44, "setIsEdgeBSS:", [v46 isEdgeBss]);

  v47 = v11->_geoMessage;
  v48 = [v8 responsivenessScore];
  [v48 doubleValue];
  -[GEOWiFiConnectionQuality setResponsivenessScore:](v47, "setResponsivenessScore:");

  v49 = v11->_geoMessage;
  v50 = [v8 networkDetails];
  v51 = [v50 connectedBss];
  -[GEOWiFiConnectionQuality setNetworkType:](v49, "setNetworkType:", [v51 networkAccessCode] + 1);

  v52 = v11;
  v53 = [v8 networkDetails];
  LODWORD(v50) = [v53 isAdhoc];

  if (v50) {
    uint64_t v54 = 1;
  }
  else {
    uint64_t v54 = 2;
  }
  [(GEOWiFiConnectionQuality *)v11->_geoMessage setApMode:v54];
  v55 = v11->_geoMessage;
  v56 = [v8 sessionStartTime];
  [v56 timeIntervalSinceReferenceDate];
  [(GEOWiFiConnectionQuality *)v55 setTimeOfDay:(unint64_t)v57];

  v58 = [v8 networkDetails];
  unint64_t v59 = [v58 captiveStatus];

  if (v59 <= 2) {
    [(GEOWiFiConnectionQuality *)v11->_geoMessage setCaptiveDetermination:v59];
  }
  v60 = [v8 networkDetails];
  int v61 = [v60 isAutoJoined];

  if (v61) {
    uint64_t v62 = 1;
  }
  else {
    uint64_t v62 = 2;
  }
  [(GEOWiFiConnectionQuality *)v11->_geoMessage setAssociationReason:v62];
  -[GEOWiFiConnectionQuality setDisassociationReason:](v11->_geoMessage, "setDisassociationReason:", WiFiUsageConnectionQualityRecordConvertDisconnectReasonToGEOReason([v8 lastDisconnectReason]));
  [v8 sessionDuration];
  if (v63 >= 60.0)
  {
    [v8 sessionDuration];
    if (v67 >= 300.0)
    {
      [v8 sessionDuration];
      if (v68 >= 1200.0)
      {
        [v8 sessionDuration];
        if (v69 >= 3600.0)
        {
          [v8 sessionDuration];
          v64 = v11->_geoMessage;
          if (v70 >= 3600.0) {
            uint64_t v65 = 5;
          }
          else {
            uint64_t v65 = 0;
          }
        }
        else
        {
          v64 = v11->_geoMessage;
          uint64_t v65 = 4;
        }
      }
      else
      {
        v64 = v11->_geoMessage;
        uint64_t v65 = 3;
      }
    }
    else
    {
      v64 = v11->_geoMessage;
      uint64_t v65 = 2;
    }
  }
  else
  {
    v64 = v11->_geoMessage;
    uint64_t v65 = 1;
  }
  [(GEOWiFiConnectionQuality *)v64 setAssociationLength:v65];
  v71 = [v8 networkDetails];
  p_isa = (id *)&v11->super.isa;
  if (([v71 isPublic] & 1) == 0)
  {
    v73 = [v8 networkDetails];
    if (![v73 isCarrierBased])
    {
LABEL_28:

      goto LABEL_29;
    }
    BOOL v74 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:1];

    if (!v74) {
      goto LABEL_29;
    }
LABEL_27:
    v75 = v11->_geoMessage;
    v71 = [v8 networkDetails];
    v73 = [v71 networkName];
    [(GEOWiFiConnectionQuality *)v75 setIdentifier:v73];
    goto LABEL_28;
  }
  BOOL v72 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:1];

  if (v72) {
    goto LABEL_27;
  }
LABEL_29:
  id v76 = objc_alloc_init(MEMORY[0x1E4F64630]);
  v77 = [v8 networkDetails];
  v78 = [v77 connectedBss];
  [v78 locationLatitude];
  objc_msgSend(v76, "setLat:");

  v79 = [v8 networkDetails];
  v80 = [v79 connectedBss];
  [v80 locationLongitude];
  objc_msgSend(v76, "setLng:");

  id v81 = objc_alloc_init(MEMORY[0x1E4F64658]);
  v136 = v76;
  [v81 setLatLng:v76];
  v82 = (id *)&v52->super.isa;
  v135 = v81;
  [(GEOWiFiConnectionQuality *)v52->_geoMessage setLocation:v81];
  v83 = [v8 networkDetails];
  if ([v83 addedFromUI])
  {

LABEL_32:
    id v86 = p_isa[1];
    uint64_t v87 = 1;
    goto LABEL_33;
  }
  v84 = [v8 networkDetails];
  int v85 = [v84 addedViaATJ];

  if (v85) {
    goto LABEL_32;
  }
  v94 = [v8 networkDetails];
  int v95 = [v94 addedFromApp];

  if (v95)
  {
    id v86 = p_isa[1];
    uint64_t v87 = 2;
  }
  else
  {
    v98 = [v8 networkDetails];
    int v99 = [v98 isCarrierBased];

    id v86 = p_isa[1];
    if (v99) {
      uint64_t v87 = 3;
    }
    else {
      uint64_t v87 = 0;
    }
  }
LABEL_33:
  [v86 setNetworkOrigin:v87];
  v88 = [v8 networkDetails];
  int v89 = [v88 isOpen];

  if (v89)
  {
    id v90 = p_isa[1];
    uint64_t v91 = 1;
  }
  else
  {
    v92 = [v8 networkDetails];
    int v93 = [v92 hasEnterpriseSecurity];

    if (v93)
    {
      id v90 = p_isa[1];
      uint64_t v91 = 4;
    }
    else
    {
      v96 = [v8 networkDetails];
      int v97 = [v96 hasWep];

      id v90 = p_isa[1];
      if (v97) {
        uint64_t v91 = 2;
      }
      else {
        uint64_t v91 = 3;
      }
    }
  }
  [v90 addAuthTraits:v91];
  v100 = [v8 networkDetails];
  int v101 = [v100 isMoving];

  if (v101) {
    [p_isa[1] addTraits:1];
  }
  v102 = [v8 networkDetails];
  int v103 = [v102 isWidelyDeployed];

  if (v103) {
    [p_isa[1] addTraits:2];
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  v104 = [v8 networkDetails];
  v105 = [v104 downloadSpeedResults];

  uint64_t v106 = [v105 countByEnumeratingWithState:&v149 objects:v156 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v150;
    do
    {
      for (uint64_t i = 0; i != v107; ++i)
      {
        if (*(void *)v150 != v108) {
          objc_enumerationMutation(v105);
        }
        v110 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        id v111 = objc_alloc_init(MEMORY[0x1E4F64C28]);
        [v110 floatValue];
        objc_msgSend(v111, "setAvgDL:");
        [p_isa[1] addSpeedTest:v111];
      }
      uint64_t v107 = [v105 countByEnumeratingWithState:&v149 objects:v156 count:16];
    }
    while (v107);
  }
  id v138 = v8;

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v112 = v139;
  uint64_t v113 = [v112 countByEnumeratingWithState:&v145 objects:v155 count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    char v115 = 0;
    uint64_t v116 = *(void *)v146;
    do
    {
      for (uint64_t j = 0; j != v114; ++j)
      {
        if (*(void *)v146 != v116) {
          objc_enumerationMutation(v112);
        }
        v118 = *(void **)(*((void *)&v145 + 1) + 8 * j);
        id v119 = objc_alloc_init(MEMORY[0x1E4F64C08]);
        objc_msgSend(v119, "setRssi:", objc_msgSend(v118, "rssi"));
        objc_msgSend(v119, "setChannel:", objc_msgSend(v118, "channel"));
        v120 = [v118 bssid];
        [v119 setUniqueID:v120];

        [v82[1] addEssMembers:v119];
        if ((v115 & 1) == 0)
        {
          uint64_t v121 = [v118 networkAccessCode];
          uint64_t v122 = [v118 venueGroup];
          uint64_t v123 = [v118 venueCode];
          id v124 = objc_alloc_init(MEMORY[0x1E4F64C38]);
          [v124 setVenueName:&stru_1F2B5AC50];
          [v124 setNetworkType:v121];
          [v124 setVenueType:v123];
          uint64_t v125 = v122;
          v82 = p_isa;
          [v124 setVenueGroup:v125];
          [p_isa[1] setPasspointInfo:v124];
        }
        char v115 = 1;
      }
      uint64_t v114 = [v112 countByEnumeratingWithState:&v145 objects:v155 count:16];
    }
    while (v114);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v10 = v137;
  id v126 = v137;
  uint64_t v127 = [v126 countByEnumeratingWithState:&v141 objects:v154 count:16];
  id v8 = v138;
  if (v127)
  {
    uint64_t v128 = v127;
    uint64_t v129 = *(void *)v142;
    do
    {
      for (uint64_t k = 0; k != v128; ++k)
      {
        if (*(void *)v142 != v129) {
          objc_enumerationMutation(v126);
        }
        v131 = *(void **)(*((void *)&v141 + 1) + 8 * k);
        id v132 = objc_alloc_init(MEMORY[0x1E4F64C08]);
        objc_msgSend(v132, "setRssi:", objc_msgSend(v131, "rssi"));
        objc_msgSend(v132, "setChannel:", objc_msgSend(v131, "channel"));
        v133 = [v131 bssid];
        [v132 setUniqueID:v133];

        [p_isa[1] addNearbyBSS:v132];
      }
      uint64_t v128 = [v126 countByEnumeratingWithState:&v141 objects:v154 count:16];
    }
    while (v128);
  }

  self = p_isa;
  v66 = self;
  id v9 = v139;
LABEL_72:

  return v66;
}

- (void)queryNetworkPerformanceFeedAndSubmitToGeoWiFi
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__3;
  v5[4] = __Block_byref_object_dispose__3;
  id v6 = 0;
  if (self->_identifier)
  {
    v3 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke;
    block[3] = &unk_1E69BD5B0;
    block[4] = self;
    block[5] = v5;
    dispatch_async(v3, block);
  }
  else
  {
    NSLog(&cfstr_SNullIdentifie.isa, a2, "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]");
  }
  _Block_object_dispose(v5, 8);
}

void __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9440170]();
  id v3 = objc_alloc(MEMORY[0x1E4FA8E18]);
  v4 = (void *)[v3 initWorkspaceWithService:*MEMORY[0x1E4FA9060]];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FA91D0]) initWithWorkspace:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(*(void *)(a1 + 32) + 16), *MEMORY[0x1E4FA9150], 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke_2;
    v7[3] = &unk_1E69BD588;
    long long v8 = *(_OWORD *)(a1 + 32);
    [v5 fullScorecardFor:1 options:v6 reply:v7];
  }
}

void __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"historical"];
  id v33 = [v3 allValues];

  uint64_t v4 = [v33 firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  NSLog(&cfstr_S.isa, "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]_block_invoke_2", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"overallStay"];
  objc_msgSend(v7, "setOverAllStay:", objc_msgSend(v8, "unsignedLongLongValue"));

  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"lowLqmStay"];
  objc_msgSend(v9, "setLowLQMStay:", objc_msgSend(v10, "unsignedLongLongValue"));

  v11 = *(void **)(*(void *)(a1 + 32) + 8);
  v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"faultyStay"];
  objc_msgSend(v11, "setFaultyStay:", objc_msgSend(v12, "unsignedLongLongValue"));

  v13 = *(void **)(*(void *)(a1 + 32) + 8);
  v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"dataStalls"];
  objc_msgSend(v13, "setDataStalls:", objc_msgSend(v14, "unsignedLongLongValue"));

  v15 = *(void **)(*(void *)(a1 + 32) + 8);
  v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"rttMin"];
  [v16 floatValue];
  objc_msgSend(v15, "setRoundTripTimeMin:");

  v17 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"rttAvg"];
  [v18 floatValue];
  objc_msgSend(v17, "setRoundTripTimeAvg:");

  v19 = *(void **)(*(void *)(a1 + 32) + 8);
  v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"rttVar"];
  [v20 floatValue];
  objc_msgSend(v19, "setRoundTripTimeVar:");

  v21 = *(void **)(*(void *)(a1 + 32) + 8);
  v22 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"connSuccesses"];
  objc_msgSend(v21, "setSuccessfulConnections:", objc_msgSend(v22, "unsignedLongLongValue"));

  v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"connAttempts"];
  uint64_t v24 = [v23 unsignedLongLongValue];
  v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"connSuccesses"];
  uint64_t v26 = v24 - [v25 unsignedLongLongValue];

  [*(id *)(*(void *)(a1 + 32) + 8) setFailedConnections:v26];
  v27 = *(void **)(*(void *)(a1 + 32) + 8);
  v28 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"connAttempts"];
  objc_msgSend(v27, "setSslConnectionCount:", objc_msgSend(v28, "unsignedIntValue"));

  v29 = *(void **)(*(void *)(a1 + 32) + 8);
  v30 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"certErrors"];
  objc_msgSend(v29, "setSslErrorCount:", objc_msgSend(v30, "unsignedIntValue"));

  v31 = *(void **)(*(void *)(a1 + 32) + 8);
  v32 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"isKnownGood"];
  objc_msgSend(v31, "setIsKnownGood:", objc_msgSend(v32, "BOOLValue"));

  [MEMORY[0x1E4F64C20] reportWiFiConnectionQuality:*(void *)(*(void *)(a1 + 32) + 8)];
  NSLog(&cfstr_SSubmittedGeos.isa, "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]_block_invoke_2");
}

- (GEOWiFiConnectionQuality)geoMessage
{
  return self->_geoMessage;
}

- (void)setGeoMessage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_geoMessage, 0);
}

@end