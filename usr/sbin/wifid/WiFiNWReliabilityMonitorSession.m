@interface WiFiNWReliabilityMonitorSession
- (BOOL)isSessionReliable:(int)a3;
- (NSString)connectedBSSID;
- (NSString)connectedSSID;
- (WiFiNWReliabilityMonitorSession)initWithNetworkRecord:(void *)a3 withMetrics:(unint64_t)a4 withMaxSamples:(unint64_t)a5 withMinSampleThresh:(int)a6;
- (id)description;
- (int)minSampleThresh;
- (unint64_t)getSampleCount:(unint64_t)a3;
- (unint64_t)maxSamples;
- (unint64_t)metrics;
- (void)dealloc;
- (void)ingestLQMUpdate:(id)a3;
- (void)setConnectedBSSID:(id)a3;
- (void)setConnectedSSID:(id)a3;
@end

@implementation WiFiNWReliabilityMonitorSession

- (WiFiNWReliabilityMonitorSession)initWithNetworkRecord:(void *)a3 withMetrics:(unint64_t)a4 withMaxSamples:(unint64_t)a5 withMinSampleThresh:(int)a6
{
  v20.receiver = self;
  v20.super_class = (Class)WiFiNWReliabilityMonitorSession;
  v10 = [(WiFiNWReliabilityMonitorSession *)&v20 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s without networkRecord" message:3 "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]"];
    }
    goto LABEL_14;
  }
  uint64_t v11 = sub_10001E404((uint64_t)a3, @"BSSID");
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v11;

  uint64_t v13 = sub_10001A43C(a3);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v13;

  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s session created for BSSID:%@ SSID:%@", "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]", v10->_connectedBSSID, v10->_connectedSSID message];
  }
  v10->_maxSamples = a5;
  if (!a5
    || (v10->_minSampleThresh = a6) == 0
    || (v10->_metrics = a4) == 0
    || (a4 & 1) != 0
    && (v16 = [[WiFiNWReliabilityMonitorDataStore alloc] initWithMetric:1 withMaxSamples:v10->_maxSamples], rssiStore = v10->_rssiStore, v10->_rssiStore = v16, rssiStore, !v10->_rssiStore))
  {
LABEL_14:

    return 0;
  }
  return v10;
}

- (void)dealloc
{
  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    self->_rssiStore = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiNWReliabilityMonitorSession;
  [(WiFiNWReliabilityMonitorSession *)&v4 dealloc];
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"RSSI"];
    id v6 = [v5 intValue];

    id v7 = -[WiFiNWReliabilitDataStoreSampleType init:withTimestamp:]([WiFiNWReliabilitDataStoreSampleType alloc], "init:withTimestamp:", v6, [v12 objectForKey:@"LQMTIMESTAMP"]);
    [(WiFiNWReliabilityMonitorDataStore *)self->_rssiStore addSample:v7];
    v9 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v10 = [(WiFiNWReliabilityMonitorSession *)self description];
      [v9 WFLog:3, "%s: Session:%@ received LQM update, RSSI:%d", "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]", v10, v6 message];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s without argument!", "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]");
    }
  }
}

- (BOOL)isSessionReliable:(int)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  BOOL v3 = 1;
  char v13 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000263E4;
    v6[3] = &unk_10023EA08;
    v6[4] = &v10;
    v6[5] = v8;
    int v7 = a3;
    [(WiFiNWReliabilityMonitorDataStore *)rssiStore getSamples:v6];
    BOOL v3 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (unint64_t)getSampleCount:(unint64_t)a3
{
  if (a3 == 1)
  {
    rssiStore = self->_rssiStore;
    return [(WiFiNWReliabilityMonitorDataStore *)rssiStore getCount];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s Unsupported metric: %lu", "-[WiFiNWReliabilityMonitorSession getSampleCount:]", a3);
    }
    return 0;
  }
}

- (id)description
{
  BOOL v3 = [(WiFiNWReliabilityMonitorSession *)self connectedBSSID];
  id v4 = [(WiFiNWReliabilityMonitorSession *)self connectedSSID];
  v5 = +[NSString stringWithFormat:@"[BSSID:%@ SSID:%@]", v3, v4];

  return v5;
}

- (unint64_t)metrics
{
  return self->_metrics;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (int)minSampleThresh
{
  return self->_minSampleThresh;
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedSSID, 0);
  objc_storeStrong((id *)&self->_connectedBSSID, 0);

  objc_storeStrong((id *)&self->_rssiStore, 0);
}

@end