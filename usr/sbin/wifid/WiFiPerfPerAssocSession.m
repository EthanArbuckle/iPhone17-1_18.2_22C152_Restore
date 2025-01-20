@interface WiFiPerfPerAssocSession
- (BOOL)assocIsToApplePH;
- (BOOL)assocIsToNoMap;
- (BOOL)hasBeenFinalized;
- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5;
- (BOOL)isEdgeBSS;
- (BOOL)wasCaptive;
- (NSDictionary)historicalScorecardAtAssoc;
- (NSMutableArray)scanResults;
- (NSNumber)apMode;
- (NSNumber)avgDLSpeed;
- (NSString)bssidAtPollingStart;
- (NSString)bssidOfNetworkForLastReceivedAssocIndication;
- (NSString)connectedBSSID;
- (NSString)connectedSSID;
- (NSString)scorecardIdentifier;
- (WiFiPerfPerAssocSession)initWithNetworkRecord:(void *)a3 managerRef:(void *)a4 andManagerQueue:(id)a5;
- (__WiFiNetwork)networkRecord;
- (double)_roundTimeInterval:(double)a3 toNearestNumberOfHours:(int64_t)a4;
- (double)accuracyOfBestReading;
- (double)bestLatitudeReading;
- (double)bestLongitudeReading;
- (double)doNotFinalizePriorToEpoch;
- (double)epochAtAssoc;
- (double)rttAverageActiveSession;
- (double)rttAverageAsPolledViaInstantaneousScorecard;
- (double)rttAverageAtBeginActiveSession;
- (double)rttMinActiveSession;
- (double)rttMinAtBeginActiveSession;
- (double)rttVarianceActiveSession;
- (double)rttVarianceAsPolledViaInstantaneousScorecard;
- (double)rttVarianceAtBeginActiveSession;
- (id)_deltaStartScorecard:(id)a3 fromEndScorecard:(id)a4;
- (id)description;
- (id)finalizeWithEndScorecard:(id)a3;
- (int)_assocReasonToGeoAssocReason:(int)a3;
- (int)networkOriginator;
- (int)networkType;
- (int)ssidHarvestStatus;
- (int64_t)ccaAverage;
- (int64_t)channel;
- (int64_t)rssiAverage;
- (int64_t)snrAverage;
- (unint64_t)_getSingleSigFigForValue:(unint64_t)a3;
- (unint64_t)_roundByteCount:(unint64_t)a3;
- (unint64_t)_roundPacketCount:(unint64_t)a3;
- (unint64_t)assocReason;
- (unint64_t)associatedTime;
- (unint64_t)band;
- (unint64_t)bytesInAtBeginActiveUsageSession;
- (unint64_t)bytesInTotalActiveUsageSession;
- (unint64_t)bytesOutAtBeginActiveUsageSession;
- (unint64_t)bytesOutTotalActiveUsageSession;
- (unint64_t)captiveFlag;
- (unint64_t)channelWidth;
- (unint64_t)colocatedState;
- (unint64_t)disAssocReason;
- (unint64_t)isHS2;
- (unint64_t)lastBytesInSample;
- (unint64_t)lastBytesOutSample;
- (unint64_t)phyMode;
- (unint64_t)securityType;
- (unint64_t)timeOfDay;
- (void)_updateNetworkOnManagerQueue:(id)a3;
- (void)accumulateActiveUsageWithScorecard:(id)a3;
- (void)beginTrackingActiveUsageWithScorecard:(id)a3;
- (void)calculateTimes;
- (void)dealloc;
- (void)ingestCurrentNetwork:(void *)a3;
- (void)ingestInstantaneousScorecardFromPolling:(id)a3;
- (void)ingestLQMUpdate:(id)a3;
- (void)ingestScanResults:(id)a3 currentSSID:(id)a4;
- (void)resetActiveUsageStats;
- (void)setAccuracyOfBestReading:(double)a3;
- (void)setApMode:(id)a3;
- (void)setAssocIsToApplePH:(BOOL)a3;
- (void)setAssocIsToNoMap:(BOOL)a3;
- (void)setAssocReason:(unint64_t)a3;
- (void)setAssociatedTime:(unint64_t)a3;
- (void)setAvgDLSpeed:(id)a3;
- (void)setBand:(unint64_t)a3;
- (void)setBestLatitudeReading:(double)a3;
- (void)setBestLongitudeReading:(double)a3;
- (void)setBssidAtPollingStart:(id)a3;
- (void)setBssidOfNetworkForLastReceivedAssocIndication:(id)a3;
- (void)setBytesInAtBeginActiveUsageSession:(unint64_t)a3;
- (void)setBytesInTotalActiveUsageSession:(unint64_t)a3;
- (void)setBytesOutAtBeginActiveUsageSession:(unint64_t)a3;
- (void)setBytesOutTotalActiveUsageSession:(unint64_t)a3;
- (void)setCaptiveFlag:(unint64_t)a3;
- (void)setCcaAverage:(int64_t)a3;
- (void)setChannel:(int64_t)a3;
- (void)setChannelWidth:(unint64_t)a3;
- (void)setColocatedState:(unint64_t)a3;
- (void)setConnectedBSSID:(id)a3;
- (void)setConnectedSSID:(id)a3;
- (void)setDisAssocReason:(unint64_t)a3;
- (void)setDoNotFinalizePriorToEpoch:(double)a3;
- (void)setEpochAtAssoc:(double)a3;
- (void)setHasBeenFinalized:(BOOL)a3;
- (void)setHistoricalScorecardAtAssoc:(id)a3;
- (void)setIsEdgeBSS:(BOOL)a3;
- (void)setIsHS2:(unint64_t)a3;
- (void)setLastBytesInSample:(unint64_t)a3;
- (void)setLastBytesOutSample:(unint64_t)a3;
- (void)setNetworkOriginator:(int)a3;
- (void)setNetworkRecord:(__WiFiNetwork *)a3;
- (void)setNetworkType:(int)a3;
- (void)setPhyMode:(unint64_t)a3;
- (void)setRssiAverage:(int64_t)a3;
- (void)setRttAverageActiveSession:(double)a3;
- (void)setRttAverageAsPolledViaInstantaneousScorecard:(double)a3;
- (void)setRttAverageAtBeginActiveSession:(double)a3;
- (void)setRttMinActiveSession:(double)a3;
- (void)setRttMinAtBeginActiveSession:(double)a3;
- (void)setRttVarianceActiveSession:(double)a3;
- (void)setRttVarianceAsPolledViaInstantaneousScorecard:(double)a3;
- (void)setRttVarianceAtBeginActiveSession:(double)a3;
- (void)setScanResults:(id)a3;
- (void)setScorecardIdentifier:(id)a3;
- (void)setSecurityType:(unint64_t)a3;
- (void)setSnrAverage:(int64_t)a3;
- (void)setSsidHarvestStatus:(int)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setWasCaptive:(BOOL)a3;
@end

@implementation WiFiPerfPerAssocSession

- (WiFiPerfPerAssocSession)initWithNetworkRecord:(void *)a3 managerRef:(void *)a4 andManagerQueue:(id)a5
{
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WiFiPerfPerAssocSession;
  v10 = [(WiFiPerfPerAssocSession *)&v23 init];
  if (!a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s initWithNetworkRecord: without networkRecord", "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    }
    goto LABEL_14;
  }
  if (!a4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s initWithNetworkRecord: without managerRef" message:3 "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]"];
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s initWithNetworkRecord: without manager queue", "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]"];
    }
    goto LABEL_14;
  }
  qword_10027D778 = (uint64_t)a4;
  objc_storeStrong((id *)&qword_10027D770, a5);
  v11 = sub_10001A43C(a3);
  uint64_t v12 = +[NSString stringWithFormat:@"%@-%@", v11, sub_10001E404((uint64_t)a3, @"BSSID")];
  scorecardIdentifier = v10->_scorecardIdentifier;
  v10->_scorecardIdentifier = (NSString *)v12;

  uint64_t v14 = sub_10001E404((uint64_t)a3, @"BSSID");
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v14;

  uint64_t v16 = sub_10001A43C(a3);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v16;

  v10->_rttMinActiveSession = 3.40282347e38;
  v10->_rttVarianceActiveSession = -3.40282347e38;
  v10->_accuracyOfBestReading = 3.40282347e38;
  v10->_hasBeenFinalized = 0;
  v10->_ssidHarvestStatus = 1;
  v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  scanResults = v10->_scanResults;
  v10->_scanResults = v18;

  if (!v10->_scanResults)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"couldn't init an array for _scanResults" v22];
    }
LABEL_14:

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  networkRecord = self->_networkRecord;
  if (networkRecord)
  {
    CFRelease(networkRecord);
    self->_networkRecord = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiPerfPerAssocSession;
  [(WiFiPerfPerAssocSession *)&v4 dealloc];
}

- (id)_deltaStartScorecard:(id)a3 fromEndScorecard:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 mutableCopy];
  v8 = [v5 objectForKeyedSubscript:@"adminDisables"];
  id v9 = [v8 unsignedIntegerValue];
  v10 = [v6 objectForKeyedSubscript:@"adminDisables"];
  v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9 - (unsigned char *)[v10 unsignedIntegerValue]);
  [v7 setObject:v11 forKeyedSubscript:@"adminDisables"];

  uint64_t v12 = [v5 objectForKeyedSubscript:@"bytesIn"];
  v13 = [v12 unsignedIntegerValue];
  uint64_t v14 = [v6 objectForKeyedSubscript:@"bytesIn"];
  v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13 - (unsigned char *)[v14 unsignedIntegerValue]);
  [v7 setObject:v15 forKeyedSubscript:@"bytesIn"];

  uint64_t v16 = [v5 objectForKeyedSubscript:@"bytesOut"];
  v17 = [v16 unsignedIntegerValue];
  v18 = [v6 objectForKeyedSubscript:@"bytesOut"];
  v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17 - (unsigned char *)[v18 unsignedIntegerValue]);
  [v7 setObject:v19 forKeyedSubscript:@"bytesOut"];

  v20 = [v5 objectForKeyedSubscript:@"connAttempts"];
  v21 = [v20 unsignedIntegerValue];
  uint64_t v22 = [v6 objectForKeyedSubscript:@"connAttempts"];
  objc_super v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21 - (unsigned char *)[v22 unsignedIntegerValue]);
  [v7 setObject:v23 forKeyedSubscript:@"connAttempts"];

  v24 = [v5 objectForKeyedSubscript:@"connSuccesses"];
  v25 = [v24 unsignedIntegerValue];
  v26 = [v6 objectForKeyedSubscript:@"connSuccesses"];
  v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25 - (unsigned char *)[v26 unsignedIntegerValue]);
  [v7 setObject:v27 forKeyedSubscript:@"connSuccesses"];

  v28 = [v5 objectForKeyedSubscript:@"certErrors"];
  v29 = [v28 unsignedIntegerValue];
  v30 = [v6 objectForKeyedSubscript:@"certErrors"];
  v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29 - (unsigned char *)[v30 unsignedIntegerValue]);
  [v7 setObject:v31 forKeyedSubscript:@"certErrors"];

  v32 = [v5 objectForKeyedSubscript:@"dataStalls"];
  v33 = [v32 unsignedIntegerValue];
  v34 = [v6 objectForKeyedSubscript:@"dataStalls"];
  v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33 - (unsigned char *)[v34 unsignedIntegerValue]);
  [v7 setObject:v35 forKeyedSubscript:@"dataStalls"];

  v36 = [v5 objectForKeyedSubscript:@"epochs"];
  v37 = [v36 unsignedIntegerValue];
  v38 = [v6 objectForKeyedSubscript:@"epochs"];
  v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37 - (unsigned char *)[v38 unsignedIntegerValue]);
  [v7 setObject:v39 forKeyedSubscript:@"epochs"];

  v40 = [v5 objectForKeyedSubscript:@"faultyStay"];
  v41 = [v40 unsignedIntegerValue];
  v42 = [v6 objectForKeyedSubscript:@"faultyStay"];
  v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41 - (unsigned char *)[v42 unsignedIntegerValue]);
  [v7 setObject:v43 forKeyedSubscript:@"faultyStay"];

  v44 = [v5 objectForKeyedSubscript:@"lowLqmStay"];
  v45 = [v44 unsignedIntegerValue];
  v46 = [v6 objectForKeyedSubscript:@"lowLqmStay"];
  v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v45 - (unsigned char *)[v46 unsignedIntegerValue]);
  [v7 setObject:v47 forKeyedSubscript:@"lowLqmStay"];

  v48 = [v5 objectForKeyedSubscript:@"lowqStay"];
  v49 = [v48 unsignedIntegerValue];
  v50 = [v6 objectForKeyedSubscript:@"lowqStay"];
  v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v49 - (unsigned char *)[v50 unsignedIntegerValue]);
  [v7 setObject:v51 forKeyedSubscript:@"lowqStay"];

  v52 = [v5 objectForKeyedSubscript:@"lqmTranCount"];
  v53 = [v52 unsignedIntegerValue];
  v54 = [v6 objectForKeyedSubscript:@"lqmTranCount"];
  v55 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v53 - (unsigned char *)[v54 unsignedIntegerValue]);
  [v7 setObject:v55 forKeyedSubscript:@"lqmTranCount"];

  v56 = [v5 objectForKeyedSubscript:@"lqmTransitionRate"];
  v57 = [v56 unsignedIntegerValue];
  v58 = [v6 objectForKeyedSubscript:@"lqmTransitionRate"];
  v59 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57 - (unsigned char *)[v58 unsignedIntegerValue]);
  [v7 setObject:v59 forKeyedSubscript:@"lqmTransitionRate"];

  v60 = [v5 objectForKeyedSubscript:@"overallStay"];
  v61 = [v60 unsignedIntegerValue];
  v62 = [v6 objectForKeyedSubscript:@"overallStay"];
  v63 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v61 - (unsigned char *)[v62 unsignedIntegerValue]);
  [v7 setObject:v63 forKeyedSubscript:@"overallStay"];

  v64 = [v5 objectForKeyedSubscript:@"packetsIn"];
  v65 = [v64 unsignedIntegerValue];
  v66 = [v6 objectForKeyedSubscript:@"packetsIn"];
  v67 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v65 - (unsigned char *)[v66 unsignedIntegerValue]);
  [v7 setObject:v67 forKeyedSubscript:@"packetsIn"];

  v68 = [v5 objectForKeyedSubscript:@"packetsOut"];
  v69 = [v68 unsignedIntegerValue];
  v70 = [v6 objectForKeyedSubscript:@"packetsOut"];
  v71 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v69 - (unsigned char *)[v70 unsignedIntegerValue]);
  [v7 setObject:v71 forKeyedSubscript:@"packetsOut"];

  v72 = [v5 objectForKeyedSubscript:@"reTxBytes"];
  v73 = [v72 unsignedIntegerValue];
  v74 = [v6 objectForKeyedSubscript:@"reTxBytes"];
  v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v73 - (unsigned char *)[v74 unsignedIntegerValue]);
  [v7 setObject:v75 forKeyedSubscript:@"reTxBytes"];

  v76 = [v5 objectForKeyedSubscript:@"receivedDupes"];
  v77 = [v76 unsignedIntegerValue];
  v78 = [v6 objectForKeyedSubscript:@"receivedDupes"];
  v79 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v77 - (unsigned char *)[v78 unsignedIntegerValue]);
  [v7 setObject:v79 forKeyedSubscript:@"receivedDupes"];

  v80 = [v5 objectForKeyedSubscript:@"rxOutOfOrderBytes"];
  v81 = [v80 unsignedIntegerValue];
  v82 = [v6 objectForKeyedSubscript:@"rxOutOfOrderBytes"];
  v83 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v81 - (unsigned char *)[v82 unsignedIntegerValue]);
  [v7 setObject:v83 forKeyedSubscript:@"rxOutOfOrderBytes"];

  v84 = [v5 objectForKeyedSubscript:@"topDownloadRate"];

  id v85 = [v84 unsignedIntegerValue];
  v86 = [v6 objectForKeyedSubscript:@"topDownloadRate"];

  id v87 = [v86 unsignedIntegerValue];
  if (v85 == v87) {
    [v7 setObject:&off_100264240 forKeyedSubscript:@"topDownloadRate"];
  }

  return v7;
}

- (void)accumulateActiveUsageWithScorecard:(id)a3
{
  id v56 = a3;
  if (v56)
  {
    uint64_t v4 = [(WiFiPerfPerAssocSession *)self connectedBSSID];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v56 objectForKeyedSubscript:@"instant"];
      id v7 = [v6 allValues];
      v8 = [v7 objectAtIndex:0];
      id v9 = [v8 objectForKeyedSubscript:@"identifier"];
      v10 = [(WiFiPerfPerAssocSession *)self connectedBSSID];
      unsigned int v11 = [v9 hasSuffix:v10];

      if (v11)
      {
        uint64_t v12 = [v56 objectForKeyedSubscript:@"instant"];
        v13 = [v12 allValues];
        uint64_t v14 = [v13 objectAtIndex:0];
        v15 = [v14 objectForKeyedSubscript:@"bytesIn"];
        -[WiFiPerfPerAssocSession setBytesInTotalActiveUsageSession:](self, "setBytesInTotalActiveUsageSession:", (char *)-[WiFiPerfPerAssocSession bytesInTotalActiveUsageSession](self, "bytesInTotalActiveUsageSession")+ (unsigned char *)[v15 unsignedIntegerValue]- (unsigned char *)-[WiFiPerfPerAssocSession lastBytesInSample](self, "lastBytesInSample"));

        uint64_t v16 = [v56 objectForKeyedSubscript:@"instant"];
        v17 = [v16 allValues];
        v18 = [v17 objectAtIndex:0];
        v19 = [v18 objectForKeyedSubscript:@"bytesOut"];
        -[WiFiPerfPerAssocSession setBytesOutTotalActiveUsageSession:](self, "setBytesOutTotalActiveUsageSession:", (char *)-[WiFiPerfPerAssocSession bytesOutTotalActiveUsageSession](self, "bytesOutTotalActiveUsageSession")+ (unsigned char *)[v19 unsignedIntegerValue]- (unsigned char *)-[WiFiPerfPerAssocSession lastBytesOutSample](self, "lastBytesOutSample"));

        v20 = [v56 objectForKeyedSubscript:@"instant"];
        v21 = [v20 allValues];
        uint64_t v22 = [v21 objectAtIndex:0];
        objc_super v23 = [v22 objectForKeyedSubscript:@"bytesIn"];
        -[WiFiPerfPerAssocSession setLastBytesInSample:](self, "setLastBytesInSample:", [v23 unsignedIntegerValue]);

        v24 = [v56 objectForKeyedSubscript:@"instant"];
        v25 = [v24 allValues];
        v26 = [v25 objectAtIndex:0];
        v27 = [v26 objectForKeyedSubscript:@"bytesOut"];
        -[WiFiPerfPerAssocSession setLastBytesOutSample:](self, "setLastBytesOutSample:", [v27 unsignedIntegerValue]);

        v28 = [v56 objectForKeyedSubscript:@"instant"];
        v29 = [v28 allValues];
        v30 = [v29 objectAtIndex:0];
        v31 = [v30 objectForKeyedSubscript:@"rttAvg"];
        [v31 doubleValue];
        double v33 = v32;

        if (v33 != 0.0)
        {
          [(WiFiPerfPerAssocSession *)self rttAverageAtBeginActiveSession];
          if (v34 != 0.0)
          {
            [(WiFiPerfPerAssocSession *)self rttAverageAtBeginActiveSession];
            double v33 = (v33 + v35) * 0.5;
          }
          [(WiFiPerfPerAssocSession *)self rttAverageActiveSession];
          if (v36 != 0.0)
          {
            [(WiFiPerfPerAssocSession *)self rttAverageActiveSession];
            double v33 = (v33 + v37) * 0.5;
          }
          [(WiFiPerfPerAssocSession *)self setRttAverageActiveSession:v33];
        }
        v38 = [v56 objectForKeyedSubscript:@"instant"];
        v39 = [v38 allValues];
        v40 = [v39 objectAtIndex:0];
        v41 = [v40 objectForKeyedSubscript:@"rttMin"];
        [v41 doubleValue];
        double v43 = v42;

        [(WiFiPerfPerAssocSession *)self rttMinAtBeginActiveSession];
        if (v44 != 0.0 && v43 != 0.0)
        {
          [(WiFiPerfPerAssocSession *)self rttMinAtBeginActiveSession];
          if (v43 < v45)
          {
            [(WiFiPerfPerAssocSession *)self rttMinActiveSession];
            if (v43 < v46) {
              [(WiFiPerfPerAssocSession *)self setRttMinActiveSession:v43];
            }
          }
        }
        v47 = [v56 objectForKeyedSubscript:@"instant"];
        v48 = [v47 allValues];
        v49 = [v48 objectAtIndex:0];
        v50 = [v49 objectForKeyedSubscript:@"rttVar"];
        [v50 doubleValue];
        double v52 = v51;

        [(WiFiPerfPerAssocSession *)self rttVarianceAtBeginActiveSession];
        if (v53 != 0.0 && v52 != 0.0)
        {
          [(WiFiPerfPerAssocSession *)self rttVarianceAtBeginActiveSession];
          if (v52 > v54)
          {
            [(WiFiPerfPerAssocSession *)self rttVarianceActiveSession];
            if (v52 > v55) {
              [(WiFiPerfPerAssocSession *)self setRttVarianceActiveSession:v52];
            }
          }
        }
      }
    }
  }
}

- (id)finalizeWithEndScorecard:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = [(WiFiPerfPerAssocSession *)self historicalScorecardAtAssoc];
    if (v6)
    {
      id v7 = [(WiFiPerfPerAssocSession *)self historicalScorecardAtAssoc];
      id v8 = [(WiFiPerfPerAssocSession *)self _deltaStartScorecard:v7 fromEndScorecard:v4];
    }
    else
    {
      id v7 = [v4 mutableCopy];
      id v8 = v7;
    }

    [(WiFiPerfPerAssocSession *)self rttMinActiveSession];
    if (v9 != 3.40282347e38)
    {
      [(WiFiPerfPerAssocSession *)self rttMinActiveSession];
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setObject:v10 forKey:@"ppaActiveUseRttMin"];
    }
    [(WiFiPerfPerAssocSession *)self rttVarianceActiveSession];
    if (v11 > 0.0)
    {
      [(WiFiPerfPerAssocSession *)self rttVarianceActiveSession];
      uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setObject:v12 forKey:@"ppaAactiveUseRttVar"];
    }
    [(WiFiPerfPerAssocSession *)self rttAverageActiveSession];
    if (v13 != 0.0)
    {
      [(WiFiPerfPerAssocSession *)self rttAverageActiveSession];
      uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setObject:v14 forKey:@"ppaActiveUseRttAvg"];
    }
    if ([(WiFiPerfPerAssocSession *)self ccaAverage])
    {
      v15 = +[NSNumber numberWithInteger:[(WiFiPerfPerAssocSession *)self ccaAverage]];
      [v8 setObject:v15 forKey:@"ppaCCA"];
    }
    if ([(WiFiPerfPerAssocSession *)self rssiAverage])
    {
      uint64_t v16 = +[NSNumber numberWithInteger:[(WiFiPerfPerAssocSession *)self rssiAverage]];
      [v8 setObject:v16 forKey:@"ppaRSSI"];
    }
    if ([(WiFiPerfPerAssocSession *)self snrAverage])
    {
      v17 = +[NSNumber numberWithInteger:[(WiFiPerfPerAssocSession *)self snrAverage]];
      [v8 setObject:v17 forKey:@"ppaSNR"];
    }
    v118 = v5;
    id v119 = v4;
    v18 = [(WiFiPerfPerAssocSession *)self connectedBSSID];

    if (v18)
    {
      v19 = [(WiFiPerfPerAssocSession *)self connectedBSSID];
      [v8 setObject:v19 forKey:@"ppaBSSIDConnected"];
    }
    v117 = v8;
    v20 = +[NSMutableSet set];
    v21 = +[NSMutableSet set];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v22 = self;
    id obj = [(WiFiPerfPerAssocSession *)self scanResults];
    id v23 = [obj countByEnumeratingWithState:&v121 objects:v125 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v122;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          v27 = v21;
          v28 = v20;
          if (*(void *)v122 != v25) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          v30 = [v29 SSID];
          v31 = [(WiFiPerfPerAssocSession *)v22 connectedSSID];
          unsigned int v32 = [v30 isEqualToString:v31];

          v20 = v28;
          v21 = v27;
          if (v32) {
            double v33 = v20;
          }
          else {
            double v33 = v27;
          }
          [v33 addObject:v29];
        }
        id v24 = [obj countByEnumeratingWithState:&v121 objects:v125 count:16];
      }
      while (v24);
    }

    if ([v20 count])
    {
      double v34 = +[NSSet setWithSet:v20];
      [v117 setObject:v34 forKey:@"ppaBSSIDsMatchingSSID"];
    }
    if ([v21 count])
    {
      double v35 = +[NSSet setWithSet:v21];
      [v117 setObject:v35 forKey:@"ppaBSSIDsNotMatchSSID"];
    }
    [(WiFiPerfPerAssocSession *)v22 bestLatitudeReading];
    if (v36 != 0.0)
    {
      [(WiFiPerfPerAssocSession *)v22 bestLongitudeReading];
      if (v37 != 0.0)
      {
        id v38 = objc_alloc((Class)CLLocation);
        [(WiFiPerfPerAssocSession *)v22 bestLatitudeReading];
        double v40 = v39;
        [(WiFiPerfPerAssocSession *)v22 bestLongitudeReading];
        id v42 = [v38 initWithLatitude:v40 longitude:v41];
        [v42 roundCoordinateValuesToGeohashOfLength:7];
        double v44 = v43;
        double v46 = v45;
        [(WiFiPerfPerAssocSession *)v22 bestLatitudeReading];
        if (v47 != 0.0)
        {
          v48 = +[NSNumber numberWithDouble:v44];
          [v117 setObject:v48 forKey:@"ppaLat"];
        }
        [(WiFiPerfPerAssocSession *)v22 bestLongitudeReading];
        if (v49 != 0.0)
        {
          v50 = +[NSNumber numberWithDouble:v46];
          [v117 setObject:v50 forKey:@"ppaLon"];
        }
        [(WiFiPerfPerAssocSession *)v22 rttVarianceAsPolledViaInstantaneousScorecard];
        if (v51 != 0.0)
        {
          [(WiFiPerfPerAssocSession *)v22 rttVarianceAsPolledViaInstantaneousScorecard];
          double v52 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v117 setObject:v52 forKey:@"rttVar"];
        }
        [(WiFiPerfPerAssocSession *)v22 rttAverageAsPolledViaInstantaneousScorecard];
        if (v53 != 0.0)
        {
          [(WiFiPerfPerAssocSession *)v22 rttAverageAsPolledViaInstantaneousScorecard];
          double v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v117 setObject:v54 forKey:@"rttAvg"];
        }
      }
    }
    if ([(WiFiPerfPerAssocSession *)v22 securityType])
    {
      double v55 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 securityType]];
      [v117 setObject:v55 forKey:@"ppaSecType"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 captiveFlag])
    {
      id v56 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 captiveFlag]];
      [v117 setObject:v56 forKey:@"ppaCaptiveFlag"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 colocatedState])
    {
      v57 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 colocatedState]];
      [v117 setObject:v57 forKey:@"ppaColoState"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 isHS2])
    {
      v58 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 isHS2]];
      [v117 setObject:v58 forKey:@"ppaHS2"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 band])
    {
      v59 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 band]];
      [v117 setObject:v59 forKey:@"ppaBand"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 channel])
    {
      v60 = +[NSNumber numberWithInteger:[(WiFiPerfPerAssocSession *)v22 channel]];
      [v117 setObject:v60 forKey:@"ppaChannel"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 channelWidth])
    {
      v61 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 channelWidth]];
      [v117 setObject:v61 forKey:@"ppaChWidth"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 phyMode])
    {
      v62 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 phyMode]];
      [v117 setObject:v62 forKey:@"ppaPhyMode"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 timeOfDay])
    {
      v63 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 timeOfDay]];
      [v117 setObject:v63 forKey:@"ppaTimeOfDay"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 associatedTime])
    {
      v64 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 associatedTime]];
      [v117 setObject:v64 forKey:@"ppaAssociatedTime"];
    }
    v65 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 disAssocReason]];
    [v117 setObject:v65 forKey:@"ppaDisassocReason"];

    v66 = +[NSNumber numberWithInt:[(WiFiPerfPerAssocSession *)v22 _assocReasonToGeoAssocReason:[(WiFiPerfPerAssocSession *)v22 assocReason]]];
    [v117 setObject:v66 forKey:@"ppaAssocReason"];

    v67 = +[NSNumber numberWithBool:[(WiFiPerfPerAssocSession *)v22 wasCaptive]];
    [v117 setObject:v67 forKey:@"ppaWasCaptive"];

    v68 = +[NSNumber numberWithBool:[(WiFiPerfPerAssocSession *)v22 assocIsToNoMap]];
    [v117 setObject:v68 forKey:@"ppaIsNoMap"];

    v69 = +[NSNumber numberWithBool:[(WiFiPerfPerAssocSession *)v22 assocIsToApplePH]];
    [v117 setObject:v69 forKey:@"ppaIsApplePH"];

    v70 = +[NSNumber numberWithUnsignedInt:[(WiFiPerfPerAssocSession *)v22 networkType]];
    [v117 setObject:v70 forKey:@"ppaAdvertisedNetworkType"];

    v71 = +[NSNumber numberWithUnsignedInt:[(WiFiPerfPerAssocSession *)v22 networkOriginator]];
    [v117 setObject:v71 forKey:@"ppaNetworkOriginator"];

    v72 = +[NSNumber numberWithBool:[(WiFiPerfPerAssocSession *)v22 isEdgeBSS]];
    [v117 setObject:v72 forKey:@"ppaIsEdgeBSS"];

    v73 = [v117 objectForKeyedSubscript:@"bytesIn"];
    id v74 = [v73 integerValue];

    if (v74)
    {
      v75 = [v117 objectForKeyedSubscript:@"bytesIn"];
      v76 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", [v75 integerValue]));
      [v117 setObject:v76 forKey:@"bytesIn"];
    }
    v77 = [v117 objectForKeyedSubscript:@"bytesOut"];
    id v78 = [v77 integerValue];

    if (v78)
    {
      v79 = [v117 objectForKeyedSubscript:@"bytesOut"];
      v80 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", [v79 integerValue]));
      [v117 setObject:v80 forKey:@"bytesOut"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 bytesInTotalActiveUsageSession])
    {
      v81 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 _roundByteCount:[(WiFiPerfPerAssocSession *)v22 bytesInTotalActiveUsageSession]]];
      [v117 setObject:v81 forKey:@"ppaActiveUseBytesIn"];
    }
    if ([(WiFiPerfPerAssocSession *)v22 bytesOutTotalActiveUsageSession])
    {
      v82 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocSession *)v22 _roundByteCount:[(WiFiPerfPerAssocSession *)v22 bytesOutTotalActiveUsageSession]]];
      [v117 setObject:v82 forKey:@"ppaActiveUseBytesOut"];
    }
    v83 = [v117 objectForKeyedSubscript:@"packetsIn"];
    id v84 = [v83 integerValue];

    if (v84)
    {
      id v85 = [v117 objectForKeyedSubscript:@"packetsIn"];
      v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundPacketCount:](v22, "_roundPacketCount:", [v85 integerValue]));
      [v117 setObject:v86 forKey:@"packetsIn"];
    }
    id v87 = [v117 objectForKeyedSubscript:@"packetsOut"];
    id v88 = [v87 integerValue];

    if (v88)
    {
      v89 = [v117 objectForKeyedSubscript:@"packetsOut"];
      v90 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundPacketCount:](v22, "_roundPacketCount:", [v89 integerValue]));
      [v117 setObject:v90 forKey:@"packetsOut"];
    }
    v91 = [v117 objectForKeyedSubscript:@"receivedDupes"];
    id v92 = [v91 integerValue];

    if (v92)
    {
      v93 = [v117 objectForKeyedSubscript:@"receivedDupes"];
      [v93 doubleValue];
      v95 = +[NSNumber numberWithDouble:round(v94 / 100.0) * 100.0];
      [v117 setObject:v95 forKey:@"receivedDupes"];
    }
    v96 = [v117 objectForKeyedSubscript:@"rxOutOfOrderBytes"];
    id v97 = [v96 integerValue];

    if (v97)
    {
      v98 = [v117 objectForKeyedSubscript:@"rxOutOfOrderBytes"];
      [v98 doubleValue];
      v100 = +[NSNumber numberWithDouble:round(v99 / 100.0) * 100.0];
      [v117 setObject:v100 forKey:@"rxOutOfOrderBytes"];
    }
    v101 = [v117 objectForKeyedSubscript:@"reTxBytes"];
    id v102 = [v101 integerValue];

    if (v102)
    {
      v103 = [v117 objectForKeyedSubscript:@"reTxBytes"];
      [v103 doubleValue];
      v105 = +[NSNumber numberWithDouble:round(v104 / 100.0) * 100.0];
      [v117 setObject:v105 forKey:@"reTxBytes"];
    }
    v106 = [(WiFiPerfPerAssocSession *)v22 avgDLSpeed];

    if (v106)
    {
      v107 = [(WiFiPerfPerAssocSession *)v22 avgDLSpeed];
      [v117 setObject:v107 forKey:@"ppaDLSpeed"];
    }
    v108 = [(WiFiPerfPerAssocSession *)v22 apMode];

    if (v108)
    {
      v109 = [(WiFiPerfPerAssocSession *)v22 apMode];
      [v117 setObject:v109 forKey:@"ppaAPMode"];
    }
    int v110 = MGGetBoolAnswer();
    if ([(WiFiPerfPerAssocSession *)v22 ssidHarvestStatus] == 2) {
      goto LABEL_87;
    }
    int v112 = [(WiFiPerfPerAssocSession *)v22 ssidHarvestStatus] == 3 ? v110 : 0;
    if (v112 == 1)
    {
      uint64_t v113 = arc4random_uniform(0x63u);
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: ssid sampling (%u > %d)", "-[WiFiPerfPerAssocSession finalizeWithEndScorecard:]", v113, 1];
      }
      if (v113 <= 1)
      {
LABEL_87:
        v111 = [(WiFiPerfPerAssocSession *)v22 connectedSSID];
        [v117 setObject:v111 forKey:@"ppaSSID"];
      }
    }
    id v115 = v117;

    id v4 = v119;
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s without scorecard argument. Perhaps one wasn't received from Symptoms.", @"-[WiFiPerfPerAssocSession finalizeWithEndScorecard:]"];
    }
    id v115 = 0;
  }

  return v115;
}

- (void)ingestCurrentNetwork:(void *)a3
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100022D08;
  v10[4] = sub_100022C0C;
  double v11 = (WiFiPerfPerAssocSession *)0xAAAAAAAAAAAAAAAALL;
  id v4 = self;
  double v11 = v4;
  if (qword_10027D778) {
    BOOL v5 = qword_10027D770 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s Don't have WiFiManagerRef or the master queue, exit early", @"-[WiFiPerfPerAssocSession ingestCurrentNetwork:]"];
    }
  }
  else
  {
    id v6 = v4;
    if ([(WiFiPerfPerAssocSession *)v4 networkRecord])
    {
      CFRelease([(WiFiPerfPerAssocSession *)v6 networkRecord]);
      [(WiFiPerfPerAssocSession *)v6 setNetworkRecord:0];
    }
    CFAllocatorRef Default = CFAllocatorGetDefault();
    [(WiFiPerfPerAssocSession *)v6 setNetworkRecord:sub_10001961C((uint64_t)Default, (uint64_t)a3)];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D5FEC;
    block[3] = &unk_100240920;
    block[4] = v10;
    dispatch_sync((dispatch_queue_t)qword_10027DD88, block);
  }
  _Block_object_dispose(v10, 8);
}

- (void)_updateNetworkOnManagerQueue:(id)a3
{
  id v33 = a3;
  if ([v33 networkRecord])
  {
    CFArrayRef v4 = (const __CFArray *)sub_1000830B8(qword_10027D778);
    if (v4)
    {
      CFArrayRef v5 = v4;
      CFIndex Count = CFArrayGetCount(v4);
      if (Count)
      {
        CFIndex v7 = Count;
        id v8 = [v33 networkRecord];
        v35.location = 0;
        v35.length = v7;
        CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v35, v8);
        if ((FirstIndexOfValue & 0x8000000000000000) == 0)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, FirstIndexOfValue);
          [v33 setSecurityType:sub_1000C8A5C((uint64_t)ValueAtIndex)];
          [v33 setCaptiveFlag:sub_1000C7590((uint64_t)ValueAtIndex)];
          [v33 setIsHS2:sub_10001BB2C((BOOL)ValueAtIndex)];
          [v33 setBand:sub_100023F30((uint64_t)ValueAtIndex)];
          [v33 setChannel:[sub_100024070((uint64_t)ValueAtIndex) integerValue]];
          [v33 setChannelWidth:sub_1000059B0((uint64_t)ValueAtIndex)];
          [v33 setPhyMode:sub_1000C9AF8((uint64_t)ValueAtIndex)];
          [v33 setWasCaptive:sub_1000C7514((uint64_t)ValueAtIndex)];
          [v33 setNetworkType:sub_1000CEC18((uint64_t)ValueAtIndex)];
          [v33 setNetworkOriginator:sub_1000CE55C((uint64_t)ValueAtIndex)];
          double v11 = sub_10001E404((uint64_t)ValueAtIndex, @"BSSID");
          [v33 setIsEdgeBSS:sub_1000CB75C(ValueAtIndex, v11) != 0];
          [v33 setSsidHarvestStatus:sub_1000CFBD8((uint64_t)ValueAtIndex)];
          uint64_t v12 = sub_10001A43C(ValueAtIndex);
          [v33 setAssocIsToNoMap:0];
          double v13 = [v12 lowercaseString];
          unsigned int v14 = [v13 hasSuffix:@"_nomap"];

          if (v14) {
            [v33 setAssocIsToNoMap:1];
          }
          [v33 setAssocIsToApplePH:sub_10001E71C((uint64_t)ValueAtIndex) != 0];
          CFArrayRef v15 = (const __CFArray *)sub_10001E404((uint64_t)ValueAtIndex, @"lastTputMeasurementResults");
          if (v15)
          {
            CFArrayRef v16 = v15;
            if (CFArrayGetCount(v15) >= 1) {
              [v33 setAvgDLSpeed:CFArrayGetValueAtIndex(v16, 0)];
            }
          }
          v17 = sub_10001E404((uint64_t)ValueAtIndex, @"AP_MODE");
          if (v17) {
            [v33 setApMode:v17];
          }
          v19 = (void *)qword_10027DD68;
          if (qword_10027DD68)
          {
            id v31 = [v33 securityType];
            id v30 = [v33 captiveFlag];
            unsigned int v32 = v12;
            id v20 = [v33 channel];
            id v21 = [v33 phyMode];
            id v22 = [v33 networkType];
            id v23 = [v33 networkOriginator];
            id v24 = [v33 ssidHarvestStatus];
            uint64_t v25 = [v33 avgDLSpeed];
            id v29 = v20;
            uint64_t v12 = v32;
            [v19 WFLog:3, "%s: %@: securityType: %lu captiveFlag: %lu channel: %ld phyMode: %lu networkType: %d originator: %d ssid-harvest: %d avgDLSpeed: %@", "-[WiFiPerfPerAssocSession _updateNetworkOnManagerQueue:]", v32, v31, v30, v29, v21, v22, v23, v24, v25 message];
          }
          v26 = +[WiFiAnalyticsManager sharedWiFiAnalyticsManager];
          id v27 = [v26 copyPreferenceScoreDictionaryForNetwork:ValueAtIndex];

          if (v27)
          {
            v28 = +[WiFiAnalyticsManager sharedWiFiAnalyticsManager];
            -[WiFiPerfPerAssocSession setColocatedState:](self, "setColocatedState:", [v28 getColocatedStateFromPreferenceScoreDictionary:v27]);
          }
          else
          {
            [(WiFiPerfPerAssocSession *)self setColocatedState:0];
          }
        }
      }
    }
  }
}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  [(WiFiPerfPerAssocSession *)self bestLatitudeReading];
  if (v9 == 0.0 || ([(WiFiPerfPerAssocSession *)self bestLongitudeReading], v10 == 0.0))
  {
    if (a3 == 0.0 || a4 == 0.0 || a5 == 0.0)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: invalid location (lat: %f, lng: %f) or accuracy (%f)", "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]", *(void *)&a3, *(void *)&a4, *(void *)&a5)];
      }
    }
    else
    {
      if (a5 < 100.1)
      {
        [(WiFiPerfPerAssocSession *)self setAccuracyOfBestReading:a5];
        [(WiFiPerfPerAssocSession *)self setBestLatitudeReading:a3];
        [(WiFiPerfPerAssocSession *)self setBestLongitudeReading:a4];
        return 1;
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: invalid location accuracy %f", "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]", *(void *)&a5, v13, v14);
      }
    }
  }
  return 0;
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"CCA"];
    uint64_t v7 = (uint64_t)[v6 integerValue];

    id v8 = [v5 objectForKeyedSubscript:@"RSSI"];
    uint64_t v9 = (uint64_t)[v8 integerValue];

    double v10 = [v5 objectForKeyedSubscript:@"SNR"];
    uint64_t v11 = (uint64_t)[v10 integerValue];

    uint64_t v12 = [v5 objectForKeyedSubscript:@"ROAM_STATE"];
    uint64_t v13 = v12;
    if (v12)
    {
      id obj = [v12 objectForKeyedSubscript:@"ROAM_CACHE"];
      if (obj)
      {
        uint64_t v37 = v7;
        uint64_t v38 = v9;
        double v39 = v13;
        double v40 = v5;
        double v41 = self;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v14 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v45;
          do
          {
            v17 = 0;
            id v42 = v15;
            do
            {
              if (*(void *)v45 != v16) {
                objc_enumerationMutation(obj);
              }
              v18 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v17);
              v19 = [v18 objectForKeyedSubscript:@"BSSID"];
              id v20 = [v18 objectForKeyedSubscript:@"RSSI"];
              id v21 = [v18 objectForKeyedSubscript:@"CHANNEL"];
              id v22 = [v18 objectForKeyedSubscript:@"CHANNEL_FLAGS"];
              if (v19) {
                BOOL v23 = v20 == 0;
              }
              else {
                BOOL v23 = 1;
              }
              if (!v23 && v21 != 0)
              {
                uint64_t v25 = [WiFiPerfPerAssocNearbyNetwork alloc];
                v26 = [(WiFiPerfPerAssocSession *)v41 connectedSSID];
                id v27 = [(WiFiPerfPerAssocNearbyNetwork *)v25 initWithSSID:v26 rssi:v20 bssid:v19 channel:v21 channelFlags:v22 andOrigin:1];

                v28 = [(WiFiPerfPerAssocSession *)v41 scanResults];
                [v28 addObject:v27];

                id v15 = v42;
              }

              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            id v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v15);
        }

        CFArrayRef v5 = v40;
        self = v41;
        uint64_t v13 = v39;
        uint64_t v7 = v37;
        uint64_t v9 = v38;
      }
    }
    id v29 = [v5 objectForKey:@"CCA"];

    if (v29)
    {
      if ([(WiFiPerfPerAssocSession *)self ccaAverage])
      {
        int64_t v30 = [(WiFiPerfPerAssocSession *)self ccaAverage];
        uint64_t v31 = v30 + v7;
        if (v30 + v7 < 0 != __OFADD__(v30, v7)) {
          ++v31;
        }
        uint64_t v7 = v31 >> 1;
      }
      [(WiFiPerfPerAssocSession *)self setCcaAverage:v7];
    }
    if (v9)
    {
      if ([(WiFiPerfPerAssocSession *)self rssiAverage])
      {
        int64_t v32 = [(WiFiPerfPerAssocSession *)self rssiAverage];
        uint64_t v33 = v32 + v9;
        if (v32 + v9 < 0 != __OFADD__(v32, v9)) {
          ++v33;
        }
        uint64_t v9 = v33 >> 1;
      }
      [(WiFiPerfPerAssocSession *)self setRssiAverage:v9];
    }
    if (v11)
    {
      if ([(WiFiPerfPerAssocSession *)self snrAverage])
      {
        int64_t v34 = [(WiFiPerfPerAssocSession *)self snrAverage];
        uint64_t v35 = v34 + v11;
        if (v34 + v11 < 0 != __OFADD__(v34, v11)) {
          ++v35;
        }
        uint64_t v11 = v35 >> 1;
      }
      [(WiFiPerfPerAssocSession *)self setSnrAverage:v11];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s without argument!", "-[WiFiPerfPerAssocSession ingestLQMUpdate:]");
    }
  }
}

- (void)ingestInstantaneousScorecardFromPolling:(id)a3
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"instant"];
  CFArrayRef v5 = [v4 allValues];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"rttVar"];
  [v7 doubleValue];
  -[WiFiPerfPerAssocSession setRttVarianceAsPolledViaInstantaneousScorecard:](self, "setRttVarianceAsPolledViaInstantaneousScorecard:");

  id v8 = [v12 objectForKeyedSubscript:@"instant"];
  uint64_t v9 = [v8 allValues];
  double v10 = [v9 firstObject];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"rttAvg"];
  [v11 doubleValue];
  -[WiFiPerfPerAssocSession setRttAverageAsPolledViaInstantaneousScorecard:](self, "setRttAverageAsPolledViaInstantaneousScorecard:");

  [(WiFiPerfPerAssocSession *)self accumulateActiveUsageWithScorecard:v12];
}

- (void)ingestScanResults:(id)a3 currentSSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v30 = self;
  id v8 = [(WiFiPerfPerAssocSession *)self connectedSSID];
  LOBYTE(self) = [v7 isEqualToString:v8];

  if (self)
  {
    id v27 = v7;
    id v28 = v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v14 = [v13 objectForKeyedSubscript:@"SSID_STR"];
          id v15 = [v13 objectForKeyedSubscript:@"BSSID"];
          uint64_t v16 = [v13 objectForKeyedSubscript:@"RSSI"];
          v17 = [v13 objectForKeyedSubscript:@"CHANNEL"];
          v18 = [v13 objectForKeyedSubscript:@"CHANNEL_FLAGS"];
          if (v14)
          {
            if ([v14 length]) {
              BOOL v19 = v15 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19 && v16 != 0 && v17 != 0)
            {
              id v22 = [[WiFiPerfPerAssocNearbyNetwork alloc] initWithSSID:v14 rssi:v16 bssid:v15 channel:v17 channelFlags:v18 andOrigin:2];
              BOOL v23 = [(WiFiPerfPerAssocSession *)v30 scanResults];
              [v23 addObject:v22];
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }

    id v7 = v27;
    id v6 = v28;
  }
  else
  {
    uint64_t v25 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v26 = [(WiFiPerfPerAssocSession *)v30 connectedSSID];
      [v25 WFLog:3, "%s told to ingest scan results but the current SSID (%@) indicated with the scan results differs from that which WiFiPerfPerAssoc session was initialized with (%@)", "-[WiFiPerfPerAssocSession ingestScanResults:currentSSID:]", v7, v26 message];
    }
  }
}

- (void)beginTrackingActiveUsageWithScorecard:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = [v4 objectForKeyedSubscript:@"instant"];
  id v6 = [v5 allValues];
  id v7 = [v6 objectAtIndex:0];
  id v8 = [v7 objectForKeyedSubscript:@"bytesIn"];
  -[WiFiPerfPerAssocSession setBytesInAtBeginActiveUsageSession:](self, "setBytesInAtBeginActiveUsageSession:", [v8 unsignedIntegerValue]);

  id v9 = [v4 objectForKeyedSubscript:@"instant"];
  id v10 = [v9 allValues];
  uint64_t v11 = [v10 objectAtIndex:0];
  id v12 = [v11 objectForKeyedSubscript:@"bytesOut"];
  -[WiFiPerfPerAssocSession setBytesOutAtBeginActiveUsageSession:](self, "setBytesOutAtBeginActiveUsageSession:", [v12 unsignedIntegerValue]);

  uint64_t v13 = [v4 objectForKeyedSubscript:@"instant"];
  id v14 = [v13 allValues];
  id v15 = [v14 objectAtIndex:0];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"rttAvg"];
  [v16 doubleValue];
  -[WiFiPerfPerAssocSession setRttAverageAtBeginActiveSession:](self, "setRttAverageAtBeginActiveSession:");

  v17 = [v4 objectForKeyedSubscript:@"instant"];
  v18 = [v17 allValues];
  BOOL v19 = [v18 objectAtIndex:0];
  id v20 = [v19 objectForKeyedSubscript:@"rttMin"];
  [v20 doubleValue];
  -[WiFiPerfPerAssocSession setRttMinAtBeginActiveSession:](self, "setRttMinAtBeginActiveSession:");

  id v21 = [v4 objectForKeyedSubscript:@"instant"];
  id v22 = [v21 allValues];
  BOOL v23 = [v22 objectAtIndex:0];
  id v24 = [v23 objectForKeyedSubscript:@"rttVar"];
  [v24 doubleValue];
  -[WiFiPerfPerAssocSession setRttVarianceAtBeginActiveSession:](self, "setRttVarianceAtBeginActiveSession:");

  uint64_t v25 = [v4 objectForKeyedSubscript:@"instant"];
  v26 = [v25 allValues];
  id v27 = [v26 objectAtIndex:0];
  id v28 = [v27 objectForKeyedSubscript:@"bytesIn"];
  -[WiFiPerfPerAssocSession setLastBytesInSample:](self, "setLastBytesInSample:", [v28 unsignedIntegerValue]);

  id v32 = [v4 objectForKeyedSubscript:@"instant"];

  id v29 = [v32 allValues];
  int64_t v30 = [v29 objectAtIndex:0];
  long long v31 = [v30 objectForKeyedSubscript:@"bytesOut"];
  -[WiFiPerfPerAssocSession setLastBytesOutSample:](self, "setLastBytesOutSample:", [v31 unsignedIntegerValue]);
}

- (void)resetActiveUsageStats
{
  [(WiFiPerfPerAssocSession *)self setRttMinAtBeginActiveSession:0.0];
  [(WiFiPerfPerAssocSession *)self setRttAverageAtBeginActiveSession:0.0];
  [(WiFiPerfPerAssocSession *)self setRttVarianceAtBeginActiveSession:0.0];
  [(WiFiPerfPerAssocSession *)self setBytesInAtBeginActiveUsageSession:0];
  [(WiFiPerfPerAssocSession *)self setBytesOutAtBeginActiveUsageSession:0];
  [(WiFiPerfPerAssocSession *)self setLastBytesInSample:0];

  [(WiFiPerfPerAssocSession *)self setLastBytesOutSample:0];
}

- (void)calculateTimes
{
  [(WiFiPerfPerAssocSession *)self epochAtAssoc];
  double v4 = v3;
  CFArrayRef v5 = +[NSDate date];
  [v5 timeIntervalSince1970];
  double v7 = v6 - v4;

  [(WiFiPerfPerAssocSession *)self epochAtAssoc];
  if (v4 == 0.0)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: epochAtAssoc is invalid, using current date for midpoint", @"-[WiFiPerfPerAssocSession calculateTimes]"];
    }
    id v10 = +[NSDate date];
    [v10 timeIntervalSince1970];
    double v12 = v11;
  }
  else
  {
    double v12 = v8 + v7 * 0.5;
  }
  [(WiFiPerfPerAssocSession *)self _roundTimeInterval:3 toNearestNumberOfHours:v12];
  [(WiFiPerfPerAssocSession *)self setTimeOfDay:(unint64_t)v13];
  if (v7 >= 60.0)
  {
    if (v7 >= 300.0)
    {
      if (v7 >= 1200.0)
      {
        if (v7 >= 3600.0 || v7 < 1200.0) {
          uint64_t v14 = 5;
        }
        else {
          uint64_t v14 = 4;
        }
      }
      else
      {
        uint64_t v14 = 3;
      }
    }
    else
    {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }

  [(WiFiPerfPerAssocSession *)self setAssociatedTime:v14];
}

- (double)_roundTimeInterval:(double)a3 toNearestNumberOfHours:(int64_t)a4
{
  CFArrayRef v5 = +[NSDate dateWithTimeIntervalSince1970:a3];
  double v6 = +[NSCalendar currentCalendar];
  double v7 = [v6 components:124 fromDate:v5];

  uint64_t v8 = (uint64_t)[v7 hour];
  int64_t v9 = v8 % a4;
  if (a4 >= 0) {
    int64_t v10 = a4;
  }
  else {
    int64_t v10 = a4 + 1;
  }
  if (v9 >= v10 >> 1 && (v9 != v10 >> 1 || (uint64_t)[v7 minute] >= 30)) {
    v8 += a4;
  }
  [v7 setHour:v8 - v9];
  [v7 setMinute:0];
  [v7 setSecond:0];
  double v11 = +[NSCalendar currentCalendar];
  double v12 = [v11 dateFromComponents:v7];
  [v12 timeIntervalSince1970];
  double v14 = v13;

  return v14;
}

- (unint64_t)_roundPacketCount:(unint64_t)a3
{
  unint64_t v3 = 100000000;
  if (a3 > 0x5F5E100) {
    return v3;
  }
  if (a3 < 0x64) {
    return 0;
  }
  return -[WiFiPerfPerAssocSession _getSingleSigFigForValue:](self, "_getSingleSigFigForValue:");
}

- (unint64_t)_roundByteCount:(unint64_t)a3
{
  if (a3 > 0x2541B263FLL) {
    return 10000;
  }
  if (a3 >= 0xF4240) {
    return [(WiFiPerfPerAssocSession *)self _getSingleSigFigForValue:a3 / 0xF4240];
  }
  return 0;
}

- (unint64_t)_getSingleSigFigForValue:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  double v4 = log10((double)a3);
  double v5 = __exp10(floor(v4));
  return a3 / (unint64_t)v5 * (unint64_t)v5;
}

- (int)_assocReasonToGeoAssocReason:(int)a3
{
  if (a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (id)description
{
  v2 = [(WiFiPerfPerAssocSession *)self scorecardIdentifier];
  unint64_t v3 = +[NSString stringWithFormat:@"WiFiPerfPerAssocSession with identifier: %@", v2];

  return v3;
}

- (double)doNotFinalizePriorToEpoch
{
  return self->_doNotFinalizePriorToEpoch;
}

- (void)setDoNotFinalizePriorToEpoch:(double)a3
{
  self->_doNotFinalizePriorToEpoch = a3;
}

- (NSString)scorecardIdentifier
{
  return self->_scorecardIdentifier;
}

- (void)setScorecardIdentifier:(id)a3
{
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
}

- (NSDictionary)historicalScorecardAtAssoc
{
  return self->_historicalScorecardAtAssoc;
}

- (void)setHistoricalScorecardAtAssoc:(id)a3
{
}

- (double)epochAtAssoc
{
  return self->_epochAtAssoc;
}

- (void)setEpochAtAssoc:(double)a3
{
  self->_epochAtAssoc = a3;
}

- (unint64_t)assocReason
{
  return self->_assocReason;
}

- (void)setAssocReason:(unint64_t)a3
{
  self->_assocReason = a3;
}

- (unint64_t)disAssocReason
{
  return self->_disAssocReason;
}

- (void)setDisAssocReason:(unint64_t)a3
{
  self->_disAssocReason = a3;
}

- (BOOL)hasBeenFinalized
{
  return self->_hasBeenFinalized;
}

- (void)setHasBeenFinalized:(BOOL)a3
{
  self->_hasBeenFinalized = a3;
}

- (unint64_t)bytesInAtBeginActiveUsageSession
{
  return self->_bytesInAtBeginActiveUsageSession;
}

- (void)setBytesInAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesInAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesOutAtBeginActiveUsageSession
{
  return self->_bytesOutAtBeginActiveUsageSession;
}

- (void)setBytesOutAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesInTotalActiveUsageSession
{
  return self->_bytesInTotalActiveUsageSession;
}

- (void)setBytesInTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesInTotalActiveUsageSession = a3;
}

- (unint64_t)bytesOutTotalActiveUsageSession
{
  return self->_bytesOutTotalActiveUsageSession;
}

- (void)setBytesOutTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutTotalActiveUsageSession = a3;
}

- (unint64_t)lastBytesInSample
{
  return self->_lastBytesInSample;
}

- (void)setLastBytesInSample:(unint64_t)a3
{
  self->_lastBytesInSample = a3;
}

- (unint64_t)lastBytesOutSample
{
  return self->_lastBytesOutSample;
}

- (void)setLastBytesOutSample:(unint64_t)a3
{
  self->_lastBytesOutSample = a3;
}

- (double)rttMinActiveSession
{
  return self->_rttMinActiveSession;
}

- (void)setRttMinActiveSession:(double)a3
{
  self->_rttMinActiveSession = a3;
}

- (double)rttMinAtBeginActiveSession
{
  return self->_rttMinAtBeginActiveSession;
}

- (void)setRttMinAtBeginActiveSession:(double)a3
{
  self->_rttMinAtBeginActiveSession = a3;
}

- (double)rttAverageActiveSession
{
  return self->_rttAverageActiveSession;
}

- (void)setRttAverageActiveSession:(double)a3
{
  self->_rttAverageActiveSession = a3;
}

- (double)rttAverageAtBeginActiveSession
{
  return self->_rttAverageAtBeginActiveSession;
}

- (void)setRttAverageAtBeginActiveSession:(double)a3
{
  self->_rttAverageAtBeginActiveSession = a3;
}

- (double)rttVarianceActiveSession
{
  return self->_rttVarianceActiveSession;
}

- (void)setRttVarianceActiveSession:(double)a3
{
  self->_rttVarianceActiveSession = a3;
}

- (double)rttVarianceAtBeginActiveSession
{
  return self->_rttVarianceAtBeginActiveSession;
}

- (void)setRttVarianceAtBeginActiveSession:(double)a3
{
  self->_rttVarianceAtBeginActiveSession = a3;
}

- (int64_t)ccaAverage
{
  return self->_ccaAverage;
}

- (void)setCcaAverage:(int64_t)a3
{
  self->_ccaAverage = a3;
}

- (int64_t)rssiAverage
{
  return self->_rssiAverage;
}

- (void)setRssiAverage:(int64_t)a3
{
  self->_rssiAverage = a3;
}

- (int64_t)snrAverage
{
  return self->_snrAverage;
}

- (void)setSnrAverage:(int64_t)a3
{
  self->_snrAverage = a3;
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
}

- (NSMutableArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (unint64_t)captiveFlag
{
  return self->_captiveFlag;
}

- (void)setCaptiveFlag:(unint64_t)a3
{
  self->_captiveFlag = a3;
}

- (unint64_t)colocatedState
{
  return self->_colocatedState;
}

- (void)setColocatedState:(unint64_t)a3
{
  self->_colocatedState = a3;
}

- (unint64_t)isHS2
{
  return self->_isHS2;
}

- (void)setIsHS2:(unint64_t)a3
{
  self->_isHS2 = a3;
}

- (unint64_t)band
{
  return self->_band;
}

- (void)setBand:(unint64_t)a3
{
  self->_band = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(unint64_t)a3
{
  self->_phyMode = a3;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)associatedTime
{
  return self->_associatedTime;
}

- (void)setAssociatedTime:(unint64_t)a3
{
  self->_associatedTime = a3;
}

- (BOOL)wasCaptive
{
  return self->_wasCaptive;
}

- (void)setWasCaptive:(BOOL)a3
{
  self->_wasCaptive = a3;
}

- (BOOL)assocIsToApplePH
{
  return self->_assocIsToApplePH;
}

- (void)setAssocIsToApplePH:(BOOL)a3
{
  self->_assocIsToApplePH = a3;
}

- (BOOL)assocIsToNoMap
{
  return self->_assocIsToNoMap;
}

- (void)setAssocIsToNoMap:(BOOL)a3
{
  self->_assocIsToNoMap = a3;
}

- (int)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (NSString)bssidOfNetworkForLastReceivedAssocIndication
{
  return self->_bssidOfNetworkForLastReceivedAssocIndication;
}

- (void)setBssidOfNetworkForLastReceivedAssocIndication:(id)a3
{
}

- (double)rttVarianceAsPolledViaInstantaneousScorecard
{
  return self->_rttVarianceAsPolledViaInstantaneousScorecard;
}

- (void)setRttVarianceAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttVarianceAsPolledViaInstantaneousScorecard = a3;
}

- (double)rttAverageAsPolledViaInstantaneousScorecard
{
  return self->_rttAverageAsPolledViaInstantaneousScorecard;
}

- (void)setRttAverageAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttAverageAsPolledViaInstantaneousScorecard = a3;
}

- (NSString)bssidAtPollingStart
{
  return self->_bssidAtPollingStart;
}

- (void)setBssidAtPollingStart:(id)a3
{
  self->_bssidAtPollingStart = (NSString *)a3;
}

- (int)networkOriginator
{
  return self->_networkOriginator;
}

- (void)setNetworkOriginator:(int)a3
{
  self->_networkOriginator = a3;
}

- (BOOL)isEdgeBSS
{
  return self->_isEdgeBSS;
}

- (void)setIsEdgeBSS:(BOOL)a3
{
  self->_isEdgeBSS = a3;
}

- (__WiFiNetwork)networkRecord
{
  return self->_networkRecord;
}

- (void)setNetworkRecord:(__WiFiNetwork *)a3
{
  self->_networkRecord = a3;
}

- (NSNumber)avgDLSpeed
{
  return self->_avgDLSpeed;
}

- (void)setAvgDLSpeed:(id)a3
{
}

- (NSNumber)apMode
{
  return self->_apMode;
}

- (void)setApMode:(id)a3
{
}

- (int)ssidHarvestStatus
{
  return self->_ssidHarvestStatus;
}

- (void)setSsidHarvestStatus:(int)a3
{
  self->_ssidHarvestStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apMode, 0);
  objc_storeStrong((id *)&self->_avgDLSpeed, 0);
  objc_storeStrong((id *)&self->_bssidOfNetworkForLastReceivedAssocIndication, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);
  objc_storeStrong((id *)&self->_connectedSSID, 0);
  objc_storeStrong((id *)&self->_historicalScorecardAtAssoc, 0);
  objc_storeStrong((id *)&self->_connectedBSSID, 0);

  objc_storeStrong((id *)&self->_scorecardIdentifier, 0);
}

@end