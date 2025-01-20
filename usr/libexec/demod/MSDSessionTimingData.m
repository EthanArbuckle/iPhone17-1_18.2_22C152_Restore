@interface MSDSessionTimingData
- (MSDSessionTimingData)initWithData:(id)a3;
- (MSDSessionTimingData)initWithData:(id)a3 forServerType:(id)a4;
- (NSMutableDictionary)rawTimingData;
- (NSString)serverType;
- (double)requestEnd;
- (double)requestStart;
- (double)responseEnd;
- (double)responseStart;
- (int64_t)avgRTT;
- (int64_t)downloadSpeed;
- (int64_t)getCountStat:(id)a3 inTimingData:(id)a4;
- (int64_t)packetLoss;
- (int64_t)retransmitBytes;
- (int64_t)retryCount;
- (int64_t)totalBytesReceived;
- (int64_t)totalBytesSent;
- (void)extractTimingData:(id)a3 forServerType:(id)a4;
- (void)setAvgRTT:(int64_t)a3;
- (void)setDownloadSpeed:(int64_t)a3;
- (void)setPacketLoss:(int64_t)a3;
- (void)setRawTimingData:(id)a3;
- (void)setRequestEnd:(double)a3;
- (void)setRequestStart:(double)a3;
- (void)setResponseEnd:(double)a3;
- (void)setResponseStart:(double)a3;
- (void)setRetransmitBytes:(int64_t)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setServerType:(id)a3;
- (void)setTotalBytesReceived:(int64_t)a3;
- (void)setTotalBytesSent:(int64_t)a3;
- (void)uploadTimingData;
@end

@implementation MSDSessionTimingData

- (MSDSessionTimingData)initWithData:(id)a3
{
  return [(MSDSessionTimingData *)self initWithData:a3 forServerType:0];
}

- (MSDSessionTimingData)initWithData:(id)a3 forServerType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDSessionTimingData;
  v8 = [(MSDSessionTimingData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(MSDSessionTimingData *)v8 setAvgRTT:-1];
    [(MSDSessionTimingData *)v9 setDownloadSpeed:-1];
    [(MSDSessionTimingData *)v9 setPacketLoss:-1];
    [(MSDSessionTimingData *)v9 setRetryCount:-1];
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDSessionTimingData *)v9 setRawTimingData:v10];

    [(MSDSessionTimingData *)v9 extractTimingData:v6 forServerType:v7];
  }

  return v9;
}

- (void)extractTimingData:(id)a3 forServerType:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  id v7 = [v40 objectForKey:@"_kCFNTimingDataConnectionStopTimeCounts"];
  [(MSDSessionTimingData *)self setServerType:v6];

  v8 = [v7 objectForKey:@"_kCFNTimingDataNStatAvgRTT"];

  if (v8)
  {
    v9 = [v7 objectForKey:@"_kCFNTimingDataNStatAvgRTT"];
    -[MSDSessionTimingData setAvgRTT:](self, "setAvgRTT:", [v9 integerValue]);

    id v10 = [(MSDSessionTimingData *)self rawTimingData];
    v11 = +[NSNumber numberWithInteger:[(MSDSessionTimingData *)self avgRTT]];
    [v10 setObject:v11 forKey:@"_kCFNTimingDataNStatAvgRTT"];
  }
  [(MSDSessionTimingData *)self setRetransmitBytes:[(MSDSessionTimingData *)self getCountStat:@"_kCFNTimingDataNStatTXRetransmit" inTimingData:v40]];
  [(MSDSessionTimingData *)self setTotalBytesSent:[(MSDSessionTimingData *)self getCountStat:@"_kCFNTimingDataNStatTXBytes" inTimingData:v40]];
  if (([(MSDSessionTimingData *)self retransmitBytes] & 0x8000000000000000) == 0
    && [(MSDSessionTimingData *)self totalBytesSent] >= 1)
  {
    [(MSDSessionTimingData *)self setPacketLoss:100* [(MSDSessionTimingData *)self retransmitBytes]/ [(MSDSessionTimingData *)self totalBytesSent]];
    objc_super v12 = [(MSDSessionTimingData *)self rawTimingData];
    v13 = +[NSNumber numberWithInteger:[(MSDSessionTimingData *)self retransmitBytes]];
    [v12 setObject:v13 forKey:@"_kCFNTimingDataNStatTXRetransmit"];

    v14 = [(MSDSessionTimingData *)self rawTimingData];
    v15 = +[NSNumber numberWithInteger:[(MSDSessionTimingData *)self totalBytesSent]];
    [v14 setObject:v15 forKey:@"_kCFNTimingDataNStatTXBytes"];
  }
  uint64_t v16 = [v40 objectForKey:@"_kCFNTimingDataResponseEnd"];
  double v17 = -1.0;
  if (v16)
  {
    v18 = (void *)v16;
    v19 = [v40 objectForKey:@"_kCFNTimingDataResponseStart"];

    if (v19)
    {
      v20 = [v40 objectForKey:@"_kCFNTimingDataResponseEnd"];
      [v20 doubleValue];
      -[MSDSessionTimingData setResponseEnd:](self, "setResponseEnd:");

      v21 = [v40 objectForKey:@"_kCFNTimingDataResponseStart"];
      [v21 doubleValue];
      -[MSDSessionTimingData setResponseStart:](self, "setResponseStart:");

      [(MSDSessionTimingData *)self responseEnd];
      double v23 = v22;
      [(MSDSessionTimingData *)self responseStart];
      double v17 = v23 - v24;
      v25 = [(MSDSessionTimingData *)self rawTimingData];
      [(MSDSessionTimingData *)self responseEnd];
      v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v25 setObject:v26 forKey:@"_kCFNTimingDataResponseEnd"];

      v27 = [(MSDSessionTimingData *)self rawTimingData];
      [(MSDSessionTimingData *)self responseStart];
      v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v27 setObject:v28 forKey:@"_kCFNTimingDataResponseStart"];
    }
  }
  uint64_t v29 = [v40 objectForKey:@"_kCFNTimingDataRequestEnd"];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [v40 objectForKey:@"_kCFNTimingDataRequestStart"];

    if (v31)
    {
      v32 = [v40 objectForKey:@"_kCFNTimingDataRequestEnd"];
      [v32 doubleValue];
      -[MSDSessionTimingData setRequestEnd:](self, "setRequestEnd:");

      v33 = [v40 objectForKey:@"_kCFNTimingDataRequestStart"];
      [v33 doubleValue];
      -[MSDSessionTimingData setRequestStart:](self, "setRequestStart:");

      v34 = [(MSDSessionTimingData *)self rawTimingData];
      [(MSDSessionTimingData *)self requestEnd];
      v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v34 setObject:v35 forKey:@"_kCFNTimingDataRequestEnd"];

      v36 = [(MSDSessionTimingData *)self rawTimingData];
      [(MSDSessionTimingData *)self requestStart];
      v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v36 setObject:v37 forKey:@"_kCFNTimingDataRequestStart"];
    }
  }
  [(MSDSessionTimingData *)self setTotalBytesReceived:[(MSDSessionTimingData *)self getCountStat:@"_kCFNTimingDataNStatRXBytes" inTimingData:v40]];
  if (([(MSDSessionTimingData *)self totalBytesReceived] & 0x8000000000000000) == 0)
  {
    v38 = [(MSDSessionTimingData *)self rawTimingData];
    v39 = +[NSNumber numberWithInteger:[(MSDSessionTimingData *)self totalBytesReceived]];
    [v38 setObject:v39 forKey:@"_kCFNTimingDataNStatRXBytes"];

    if (v17 > 10.0) {
      [(MSDSessionTimingData *)self setDownloadSpeed:(uint64_t)((double)(8 * [(MSDSessionTimingData *)self totalBytesReceived]) / v17)];
    }
  }
}

- (void)uploadTimingData
{
  if ([(MSDSessionTimingData *)self avgRTT] != -1)
  {
    v3 = +[MSDAnalyticsEventHandler sharedInstance];
    int64_t v4 = [(MSDSessionTimingData *)self avgRTT];
    v5 = [(MSDSessionTimingData *)self serverType];
    [v3 sendNetworkAverageRTTEvent:v4 forServerType:v5];
  }
  if ([(MSDSessionTimingData *)self packetLoss] != -1)
  {
    id v6 = +[MSDAnalyticsEventHandler sharedInstance];
    int64_t v7 = [(MSDSessionTimingData *)self packetLoss];
    v8 = [(MSDSessionTimingData *)self serverType];
    [v6 sendNetworkPacketLossEvent:v7 forServerType:v8];
  }
  if ([(MSDSessionTimingData *)self downloadSpeed] != -1)
  {
    v9 = +[MSDAnalyticsEventHandler sharedInstance];
    int64_t v10 = [(MSDSessionTimingData *)self downloadSpeed];
    v11 = [(MSDSessionTimingData *)self serverType];
    [v9 sendNetworkAverageBandwidthEvent:v10 forServerType:v11];
  }
  objc_super v12 = [(MSDSessionTimingData *)self rawTimingData];
  id v13 = [v12 count];

  if (v13)
  {
    id v16 = +[MSDAnalyticsEventHandler sharedInstance];
    v14 = [(MSDSessionTimingData *)self rawTimingData];
    v15 = [(MSDSessionTimingData *)self serverType];
    [v16 sendNetworkRawDataEvent:v14 forServerType:v15];
  }
}

- (int64_t)getCountStat:(id)a3 inTimingData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v6 objectForKey:@"_kCFNTimingDataConnectionStopTimeCounts"];
  v8 = [v6 objectForKey:@"_kCFNTimingDataConnectionStartTimeCounts"];

  uint64_t v9 = [v7 objectForKey:v5];
  if (v9
    && (int64_t v10 = (void *)v9,
        [v8 objectForKey:v5],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_super v12 = [v8 objectForKey:v5];
    id v13 = [v12 integerValue];

    v14 = [v7 objectForKey:v5];
    v15 = [v14 integerValue];

    int64_t v16 = v15 - v13;
  }
  else
  {
    int64_t v16 = -1;
  }

  return v16;
}

- (int64_t)avgRTT
{
  return self->_avgRTT;
}

- (void)setAvgRTT:(int64_t)a3
{
  self->_avgRTT = a3;
}

- (int64_t)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int64_t)a3
{
  self->_downloadSpeed = a3;
}

- (int64_t)packetLoss
{
  return self->_packetLoss;
}

- (void)setPacketLoss:(int64_t)a3
{
  self->_packetLoss = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(int64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)retransmitBytes
{
  return self->_retransmitBytes;
}

- (void)setRetransmitBytes:(int64_t)a3
{
  self->_retransmitBytes = a3;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setResponseStart:(double)a3
{
  self->_responseStart = a3;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseEnd:(double)a3
{
  self->_responseEnd = a3;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  self->_requestStart = a3;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  self->_requestEnd = a3;
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setServerType:(id)a3
{
}

- (NSMutableDictionary)rawTimingData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRawTimingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTimingData, 0);

  objc_storeStrong((id *)&self->_serverType, 0);
}

@end