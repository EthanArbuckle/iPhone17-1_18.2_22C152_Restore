@interface WiFiUsageRangingSession
- (WiFiUsageRangingSession)init;
- (id)metricName;
- (id)sessionSummary:(BOOL)a3;
- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14;
- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5;
- (void)rangingLinkUp;
- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9;
- (void)rangingStartedWithNumMeasurements:(unint64_t)a3;
@end

@implementation WiFiUsageRangingSession

- (WiFiUsageRangingSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRangingSession;
  v2 = [(WiFiUsageRangingSession *)&v9 init];
  sessionStartTimestamp = v2->_sessionStartTimestamp;
  v2->_sessionStartTimestamp = 0;

  sessionLinkUpTimestamp = v2->_sessionLinkUpTimestamp;
  v2->_sessionLinkUpTimestamp = 0;

  peerDiscoveryTimestamp = v2->_peerDiscoveryTimestamp;
  v2->_peerDiscoveryTimestamp = 0;

  rangingStartedTimestamp = v2->_rangingStartedTimestamp;
  v2->_rangingStartedTimestamp = 0;

  rangingCompletionTimestamp = v2->_rangingCompletionTimestamp;
  v2->_rangingCompletionTimestamp = 0;

  return v2;
}

- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9
{
  v16 = (void *)MEMORY[0x1E4F1C9C8];
  id v17 = a9;
  v18 = [v16 date];
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = v18;

  self->_selfPreferredChannel = a3;
  self->_selfMainChannel = a4;
  self->_selfChannelFlags = a5;
  self->_peerPreferredChannel = a6;
  self->_peerMainChannel = a7;
  self->_peerChannelFlags = a8;
  v20 = (NSString *)[v17 copy];

  requester = self->_requester;
  self->_requester = v20;

  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = 0;

  peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
  self->_peerDiscoveryTimestamp = 0;

  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = 0;

  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = 0;

  *(_OWORD *)&self->_measurementStatus = 0u;
  *(_OWORD *)&self->_linkUpLatency = 0u;
  *(_OWORD *)&self->_numRequestedMeasurements = 0u;
  rttSamples = self->_rttSamples;

  [(NSMutableArray *)rttSamples removeAllObjects];
}

- (void)rangingLinkUp
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = v3;

  MEMORY[0x1F41817F8](v3, sessionLinkUpTimestamp, v4);
}

- (void)rangingStartedWithNumMeasurements:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] date];
  if (!self->_sessionLinkUpTimestamp) {
    objc_storeStrong((id *)&self->_sessionLinkUpTimestamp, v5);
  }
  if (!self->_peerDiscoveryTimestamp) {
    objc_storeStrong((id *)&self->_peerDiscoveryTimestamp, v5);
  }
  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = v5;
  v7 = v5;

  self->_numRequestedMeasurements = a3;
  [(NSMutableArray *)self->_rttSamples removeAllObjects];

  self->_numValidMeasurements = 0;
  self->_measurementStatus = 0;
  self->_measurementFlags = 0;
}

- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5
{
  objc_super v9 = [MEMORY[0x1E4F1C9C8] date];
  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = v9;

  self->_numValidMeasurements = a3;
  self->_measurementStatus = a4;
  self->_measurementFlags = a5;
  if (self->_sessionStartTimestamp)
  {
    peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
    if (peerDiscoveryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](peerDiscoveryTimestamp, "timeIntervalSinceDate:");
      self->_linkUpLatency = v12;
    }
  }
  if (self->_rangingStartedTimestamp)
  {
    v13 = self->_rangingCompletionTimestamp;
    if (v13)
    {
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:");
      self->_rangingLatency = v14;
    }
  }
}

- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14
{
  v24 = objc_alloc_init(WiFiUsageRangingRttSample);
  [(WiFiUsageRangingRttSample *)v24 setRssi:a3];
  [(WiFiUsageRangingRttSample *)v24 setRtt:a4];
  [(WiFiUsageRangingRttSample *)v24 setFlags:a6];
  [(WiFiUsageRangingRttSample *)v24 setChannel:a7];
  [(WiFiUsageRangingRttSample *)v24 setSelfSnr:a5];
  [(WiFiUsageRangingRttSample *)v24 setSelfCoreId:a8];
  [(WiFiUsageRangingRttSample *)v24 setSelfBitErrorRate:a9];
  [(WiFiUsageRangingRttSample *)v24 setSelfPhyError:a10];
  [(WiFiUsageRangingRttSample *)v24 setPeerSnr:a11];
  [(WiFiUsageRangingRttSample *)v24 setPeerCoreId:a12];
  [(WiFiUsageRangingRttSample *)v24 setPeerBitErrorRate:a13];
  [(WiFiUsageRangingRttSample *)v24 setPeerPhyError:a14];
  rttSamples = self->_rttSamples;
  if (!rttSamples)
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    v23 = self->_rttSamples;
    self->_rttSamples = v22;

    rttSamples = self->_rttSamples;
  }
  -[NSMutableArray addObject:](rttSamples, "addObject:", v24, a12);
}

- (id)metricName
{
  return @"com.apple.wifi.rangingsession";
}

- (id)sessionSummary:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  [v4 setObject:@"Ranging" forKeyedSubscript:@"SessionName"];
  v5 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_linkUpLatency * 1000.0)];
  [v4 setObject:v5 forKeyedSubscript:@"LinkLatency"];

  v6 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_rangingLatency * 1000.0)];
  [v4 setObject:v6 forKeyedSubscript:@"RangingLatency"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_numRequestedMeasurements];
  [v4 setObject:v7 forKeyedSubscript:@"RequestedMeasurements"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_numValidMeasurements];
  [v4 setObject:v8 forKeyedSubscript:@"ValidMeasurements"];

  objc_super v9 = [NSNumber numberWithInteger:self->_measurementStatus];
  [v4 setObject:v9 forKeyedSubscript:@"MeasurementStatus"];

  v10 = [NSNumber numberWithUnsignedInteger:self->_measurementFlags];
  [v4 setObject:v10 forKeyedSubscript:@"MeasurementFlags"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_selfMainChannel];
  [v4 setObject:v11 forKeyedSubscript:@"SelfMainChannel"];

  double v12 = [NSNumber numberWithUnsignedInteger:self->_selfPreferredChannel];
  [v4 setObject:v12 forKeyedSubscript:@"SelfPreferredChannel"];

  v13 = [NSNumber numberWithUnsignedInteger:self->_selfChannelFlags];
  [v4 setObject:v13 forKeyedSubscript:@"SelfChannelFlags"];

  double v14 = [NSNumber numberWithUnsignedInteger:self->_peerMainChannel];
  [v4 setObject:v14 forKeyedSubscript:@"PeerMainChannel"];

  v15 = [NSNumber numberWithUnsignedInteger:self->_peerPreferredChannel];
  [v4 setObject:v15 forKeyedSubscript:@"PeerPreferredChannel"];

  v16 = [NSNumber numberWithUnsignedInteger:self->_peerChannelFlags];
  [v4 setObject:v16 forKeyedSubscript:@"PeerChannelFlags"];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obj = self->_rttSamples;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 1;
    uint64_t v48 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v50 != v48) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v22 = objc_msgSend(NSString, "stringWithFormat:", @"SampleRSSI%d", v19 + i);
        v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "rssi"));
        [v4 setObject:v23 forKeyedSubscript:v22];

        v24 = objc_msgSend(NSString, "stringWithFormat:", @"SampleRTT%d", v19 + i);

        v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "rtt"));
        [v4 setObject:v25 forKeyedSubscript:v24];

        v26 = objc_msgSend(NSString, "stringWithFormat:", @"SampleFlags%d", v19 + i);

        v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "flags"));
        [v4 setObject:v27 forKeyedSubscript:v26];

        v28 = objc_msgSend(NSString, "stringWithFormat:", @"SampleChannel%d", v19 + i);

        v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "channel"));
        [v4 setObject:v29 forKeyedSubscript:v28];

        v30 = objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfSNR%d", v19 + i);

        v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "selfSnr"));
        [v4 setObject:v31 forKeyedSubscript:v30];

        v32 = objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfCoreID%d", v19 + i);

        v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "selfCoreId"));
        [v4 setObject:v33 forKeyedSubscript:v32];

        v34 = objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfBER%d", v19 + i);

        v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "selfBitErrorRate"));
        [v4 setObject:v35 forKeyedSubscript:v34];

        v36 = objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfPHYError%d", v19 + i);

        v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "selfPhyError"));
        [v4 setObject:v37 forKeyedSubscript:v36];

        v38 = objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerSNR%d", v19 + i);

        v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "peerSnr"));
        [v4 setObject:v39 forKeyedSubscript:v38];

        v40 = objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerCoreID%d", v19 + i);

        v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "peerCoreId"));
        [v4 setObject:v41 forKeyedSubscript:v40];

        v42 = objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerBER%d", v19 + i);

        v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "peerBitErrorRate"));
        [v4 setObject:v43 forKeyedSubscript:v42];

        v44 = objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerPHYError%d", v19 + i);

        v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "peerPhyError"));
        [v4 setObject:v45 forKeyedSubscript:v44];
      }
      uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      uint64_t v19 = (v19 + i);
    }
    while (v18);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_rttSamples, 0);
  objc_storeStrong((id *)&self->_rangingCompletionTimestamp, 0);
  objc_storeStrong((id *)&self->_rangingStartedTimestamp, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionLinkUpTimestamp, 0);

  objc_storeStrong((id *)&self->_sessionStartTimestamp, 0);
}

@end