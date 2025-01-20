@interface PLQLDuetInMemoryCache
- (BOOL)isStartPresent;
- (BOOL)isStopPresent;
- (NSDictionary)startArgs;
- (NSDictionary)stopArgs;
- (PLQLDuetInMemoryCache)init;
- (PLQLDuetInMemoryCache)initWithStartTime:(double)a3 withStartargs:(id)a4;
- (double)cellIn;
- (double)cellOut;
- (double)startTime;
- (double)stopTime;
- (double)wifiIn;
- (double)wifiOut;
- (int)refCount;
- (void)addDataWithCellIn:(double)a3 withCellOut:(double)a4 withWifiIn:(double)a5 withWifiOut:(double)a6;
- (void)addStartEvent:(double)a3 withArgs:(id)a4;
- (void)addStopEvent:(double)a3 withArgs:(id)a4;
- (void)clearStop;
- (void)setCellIn:(double)a3;
- (void)setCellOut:(double)a3;
- (void)setRefCount:(int)a3;
- (void)setStartArgs:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setStopArgs:(id)a3;
- (void)setStopTime:(double)a3;
- (void)setWifiIn:(double)a3;
- (void)setWifiOut:(double)a3;
- (void)updateDataStats:(id)a3;
@end

@implementation PLQLDuetInMemoryCache

- (PLQLDuetInMemoryCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLQLDuetInMemoryCache;
  v2 = [(PLQLDuetInMemoryCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    startArgs = v2->_startArgs;
    v2->_startArgs = 0;

    stopArgs = v3->_stopArgs;
    v3->_stopArgs = 0;

    v3->_refCount = 0;
    *(_OWORD *)&v3->_startTime = 0u;
    *(_OWORD *)&v3->_cellIn = 0u;
    *(_OWORD *)&v3->_wifiIn = 0u;
  }
  return v3;
}

- (PLQLDuetInMemoryCache)initWithStartTime:(double)a3 withStartargs:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLQLDuetInMemoryCache;
  v8 = [(PLQLDuetInMemoryCache *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startArgs, a4);
    stopArgs = v9->_stopArgs;
    v9->_stopArgs = 0;

    v9->_startTime = a3;
    v9->_refCount = 0;
    *(_OWORD *)&v9->_stopTime = 0u;
    *(_OWORD *)&v9->_cellOut = 0u;
    v9->_wifiOut = 0.0;
  }

  return v9;
}

- (void)clearStop
{
  [(PLQLDuetInMemoryCache *)self setStopTime:0.0];
  [(PLQLDuetInMemoryCache *)self setStopArgs:0];
}

- (BOOL)isStartPresent
{
  [(PLQLDuetInMemoryCache *)self startTime];
  return v2 != 0.0;
}

- (BOOL)isStopPresent
{
  [(PLQLDuetInMemoryCache *)self stopTime];
  return v2 != 0.0;
}

- (void)addDataWithCellIn:(double)a3 withCellOut:(double)a4 withWifiIn:(double)a5 withWifiOut:(double)a6
{
  [(PLQLDuetInMemoryCache *)self cellIn];
  [(PLQLDuetInMemoryCache *)self setCellIn:v11 + a3];
  [(PLQLDuetInMemoryCache *)self cellOut];
  [(PLQLDuetInMemoryCache *)self setCellOut:v12 + a4];
  [(PLQLDuetInMemoryCache *)self wifiIn];
  [(PLQLDuetInMemoryCache *)self setWifiIn:v13 + a5];
  [(PLQLDuetInMemoryCache *)self wifiOut];
  double v15 = v14 + a6;
  [(PLQLDuetInMemoryCache *)self setWifiOut:v15];
}

- (void)addStartEvent:(double)a3 withArgs:(id)a4
{
  id v6 = a4;
  [(PLQLDuetInMemoryCache *)self setStartTime:a3];
  [(PLQLDuetInMemoryCache *)self setStartArgs:v6];
  [(PLQLDuetInMemoryCache *)self updateDataStats:v6];
}

- (void)addStopEvent:(double)a3 withArgs:(id)a4
{
  id v6 = a4;
  [(PLQLDuetInMemoryCache *)self setStopTime:a3];
  [(PLQLDuetInMemoryCache *)self setStopArgs:v6];
  [(PLQLDuetInMemoryCache *)self updateDataStats:v6];
}

- (void)updateDataStats:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"cellin"];
  [v5 floatValue];
  float v7 = v6;
  [(PLQLDuetInMemoryCache *)self cellIn];
  [(PLQLDuetInMemoryCache *)self setCellIn:v8 + v7];

  v9 = [v4 objectForKeyedSubscript:@"cellout"];
  [v9 floatValue];
  float v11 = v10;
  [(PLQLDuetInMemoryCache *)self cellOut];
  [(PLQLDuetInMemoryCache *)self setCellOut:v12 + v11];

  double v13 = [v4 objectForKeyedSubscript:@"wifiin"];
  [v13 floatValue];
  float v15 = v14;
  [(PLQLDuetInMemoryCache *)self wifiIn];
  [(PLQLDuetInMemoryCache *)self setWifiIn:v16 + v15];

  id v20 = [v4 objectForKeyedSubscript:@"wifiout"];

  [v20 floatValue];
  float v18 = v17;
  [(PLQLDuetInMemoryCache *)self wifiOut];
  [(PLQLDuetInMemoryCache *)self setWifiOut:v19 + v18];
}

- (NSDictionary)startArgs
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartArgs:(id)a3
{
}

- (NSDictionary)stopArgs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStopArgs:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (double)cellIn
{
  return self->_cellIn;
}

- (void)setCellIn:(double)a3
{
  self->_cellIn = a3;
}

- (double)cellOut
{
  return self->_cellOut;
}

- (void)setCellOut:(double)a3
{
  self->_cellOut = a3;
}

- (double)wifiIn
{
  return self->_wifiIn;
}

- (void)setWifiIn:(double)a3
{
  self->_wifiIn = a3;
}

- (double)wifiOut
{
  return self->_wifiOut;
}

- (void)setWifiOut:(double)a3
{
  self->_wifiOut = a3;
}

- (int)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(int)a3
{
  self->_refCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopArgs, 0);
  objc_storeStrong((id *)&self->_startArgs, 0);
}

@end