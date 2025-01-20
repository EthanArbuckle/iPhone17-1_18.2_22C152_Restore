@interface NPEdgeLatency
+ (BOOL)supportsSecureCoding;
- (BOOL)fillTestLatency;
- (BOOL)isComplete:(BOOL)a3;
- (BOOL)isMatched:(id)a3;
- (BOOL)isMatched:(id)a3 parameters:(networkParameters *)a4;
- (BOOL)isObserving;
- (BOOL)isTFOEnabled;
- (BOOL)needReprobe;
- (BOOL)passedReprobeThreshold;
- (BOOL)probeNoTFOCookie;
- (BOOL)probeTFO;
- (NPAverage)roundTripAverage;
- (NPAverage)roundTripAverageObserved;
- (NPEdgeLatency)initWithCoder:(id)a3;
- (NPEdgeLatency)initWithProbeEndpoint:(id)a3 probeTFO:(BOOL)a4;
- (NSDate)creationDate;
- (NSNumber)addressFamily;
- (NSNumber)currentTimeout;
- (NSString)TFOStatusString;
- (NSString)addressFamilyString;
- (NSString)connectionParametersString;
- (NWEndpoint)probeEndpoint;
- (NWTCPConnection)probeConnection;
- (OS_dispatch_source)probeTimer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)probeCompletionHandler;
- (int64_t)TFOStatus;
- (int64_t)interfaceType;
- (int64_t)probeCount;
- (int64_t)reprobeCount;
- (unint64_t)edgeIndex;
- (unint64_t)getRoundTripSample:(unint64_t)a3;
- (unint64_t)roundTripTime;
- (void)addRoundTripSample:(unint64_t)a3;
- (void)addRoundTripSampleObserved:(unint64_t)a3;
- (void)addRoundTripSamples:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)measureLatencyWithTimeout:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pingPong;
- (void)setAddressFamily:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentTimeout:(id)a3;
- (void)setEdgeIndex:(unint64_t)a3;
- (void)setInterfaceType:(int64_t)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setNeedReprobe:(BOOL)a3;
- (void)setPassedReprobeThreshold:(BOOL)a3;
- (void)setProbeCompletionHandler:(id)a3;
- (void)setProbeConnection:(id)a3;
- (void)setProbeCount:(int64_t)a3;
- (void)setProbeEndpoint:(id)a3;
- (void)setProbeNoTFOCookie:(BOOL)a3;
- (void)setProbeTFO:(BOOL)a3;
- (void)setProbeTimer:(id)a3;
- (void)setReprobeCount:(int64_t)a3;
- (void)setRoundTripAverage:(id)a3;
- (void)setRoundTripAverageObserved:(id)a3;
- (void)setRoundTripTime:(unint64_t)a3;
- (void)setTFOStatus:(int64_t)a3;
@end

@implementation NPEdgeLatency

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPEdgeLatency)initWithProbeEndpoint:(id)a3 probeTFO:(BOOL)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPEdgeLatency;
  v8 = [(NPEdgeLatency *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_roundTripTime = 0xFFFFFFFFLL;
    v10 = [[NPAverage alloc] initWithSampleSize:5];
    roundTripAverage = v9->_roundTripAverage;
    v9->_roundTripAverage = v10;

    v12 = [[NPAverage alloc] initWithSampleSize:5];
    roundTripAverageObserved = v9->_roundTripAverageObserved;
    v9->_roundTripAverageObserved = v12;

    v14 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    creationDate = v9->_creationDate;
    v9->_creationDate = v14;

    v9->_probeCount = 0;
    objc_storeStrong((id *)&v9->_probeEndpoint, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[NPEdgeLatency initWithProbeEndpoint:probeTFO:]", "NPEdgeLatency.m", 195, "[probeEndpoint isKindOfClass:[NWAddressEndpoint class]]");
    }
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "addressFamily"));
    addressFamily = v9->_addressFamily;
    v9->_addressFamily = (NSNumber *)v16;

    v9->_probeTFO = a4;
  }

  return v9;
}

- (void)addRoundTripSample:(unint64_t)a3
{
  roundTripAverage = self->_roundTripAverage;
  if (roundTripAverage)
  {
    [(NPAverage *)roundTripAverage addSample:a3];
    a3 = [(NPAverage *)self->_roundTripAverage average];
  }
  self->_roundTripTime = a3;
}

- (void)addRoundTripSamples:(id)a3
{
  roundTripAverage = self->_roundTripAverage;
  if (roundTripAverage)
  {
    [(NPAverage *)roundTripAverage addSamples:a3];
    self->_roundTripTime = [(NPAverage *)self->_roundTripAverage average];
  }
}

- (unint64_t)getRoundTripSample:(unint64_t)a3
{
  roundTripAverage = self->_roundTripAverage;
  if (!roundTripAverage) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = [(NPAverage *)roundTripAverage samples];
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  id v7 = (void *)v6;
  v8 = [(NPAverage *)self->_roundTripAverage samples];
  unint64_t v9 = [v8 count];

  if (v9 <= a3) {
    return 0xFFFFFFFFLL;
  }
  v10 = [(NPAverage *)self->_roundTripAverage samples];
  v11 = [v10 objectAtIndexedSubscript:a3];
  unint64_t v12 = [v11 integerValue];

  return v12;
}

- (void)addRoundTripSampleObserved:(unint64_t)a3
{
  roundTripAverageObserved = self->_roundTripAverageObserved;
  if (roundTripAverageObserved) {
    [(NPAverage *)roundTripAverageObserved addSample:a3];
  }
}

- (NPEdgeLatency)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeEndpoint"];
  uint64_t v6 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:](self, "initWithProbeEndpoint:probeTFO:", v5, [v4 decodeBoolForKey:@"ProbeTFO"]);
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    v6->_probeCount = [v4 decodeIntegerForKey:@"ProbeCount"];
    v6->_interfaceType = [v4 decodeIntegerForKey:@"IFType"];
    v6->_edgeIndex = [v4 decodeIntegerForKey:@"EdgeIndex"];
    v6->_roundTripTime = [v4 decodeInt64ForKey:@"RTT"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTTAverage"];
    roundTripAverage = v6->_roundTripAverage;
    v6->_roundTripAverage = (NPAverage *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTTAverageObserved"];
    roundTripAverageObserved = v6->_roundTripAverageObserved;
    v6->_roundTripAverageObserved = (NPAverage *)v11;

    v6->_passedReprobeThreshold = [v4 decodeBoolForKey:@"PassedReprobeThreshold"];
    v6->_TFOStatus = [v4 decodeIntegerForKey:@"TFOStatus"];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "addressFamily"));
    addressFamily = v6->_addressFamily;
    v6->_addressFamily = (NSNumber *)v13;

    v6->_probeNoTFOCookie = [v4 decodeBoolForKey:@"ProbeTFONoCookie"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency edgeIndex](self, "edgeIndex"), @"EdgeIndex");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency roundTripTime](self, "roundTripTime"), @"RTT");
  id v4 = [(NPEdgeLatency *)self roundTripAverage];
  [v8 encodeObject:v4 forKey:@"RTTAverage"];

  v5 = [(NPEdgeLatency *)self roundTripAverageObserved];
  [v8 encodeObject:v5 forKey:@"RTTAverageObserved"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency passedReprobeThreshold](self, "passedReprobeThreshold"), @"PassedReprobeThreshold");
  uint64_t v6 = [(NPEdgeLatency *)self creationDate];
  [v8 encodeObject:v6 forKey:@"CreationDate"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency probeCount](self, "probeCount"), @"ProbeCount");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency interfaceType](self, "interfaceType"), @"IFType");
  uint64_t v7 = [(NPEdgeLatency *)self probeEndpoint];
  [v8 encodeObject:v7 forKey:@"ProbeEndpoint"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency TFOStatus](self, "TFOStatus"), @"TFOStatus");
  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency probeTFO](self, "probeTFO"), @"ProbeTFO");
  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie"), @"ProbeTFONoCookie");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[NPEdgeLatency allocWithZone:](NPEdgeLatency, "allocWithZone:") init];
  [(NPEdgeLatency *)v5 setRoundTripTime:[(NPEdgeLatency *)self roundTripTime]];
  [(NPEdgeLatency *)v5 setEdgeIndex:[(NPEdgeLatency *)self edgeIndex]];
  uint64_t v6 = [(NPEdgeLatency *)self roundTripAverage];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(NPEdgeLatency *)v5 setRoundTripAverage:v7];

  id v8 = [(NPEdgeLatency *)self roundTripAverageObserved];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [(NPEdgeLatency *)v5 setRoundTripAverageObserved:v9];

  [(NPEdgeLatency *)v5 setPassedReprobeThreshold:[(NPEdgeLatency *)self passedReprobeThreshold]];
  v10 = [(NPEdgeLatency *)self creationDate];
  [(NPEdgeLatency *)v5 setCreationDate:v10];

  [(NPEdgeLatency *)v5 setProbeCount:[(NPEdgeLatency *)self probeCount]];
  uint64_t v11 = [(NPEdgeLatency *)self addressFamily];
  [(NPEdgeLatency *)v5 setAddressFamily:v11];

  [(NPEdgeLatency *)v5 setInterfaceType:[(NPEdgeLatency *)self interfaceType]];
  [(NPEdgeLatency *)v5 setTFOStatus:[(NPEdgeLatency *)self TFOStatus]];
  [(NPEdgeLatency *)v5 setProbeTFO:[(NPEdgeLatency *)self probeTFO]];
  unint64_t v12 = [(NPEdgeLatency *)self probeEndpoint];
  [(NPEdgeLatency *)v5 setProbeEndpoint:v12];

  [(NPEdgeLatency *)v5 setProbeNoTFOCookie:[(NPEdgeLatency *)self probeNoTFOCookie]];
  return v5;
}

- (NSString)addressFamilyString
{
  v2 = [(NPEdgeLatency *)self addressFamily];
  uint64_t v3 = [v2 integerValue];

  id v4 = @"unknown";
  if (v3 == 30) {
    id v4 = @"IPv6";
  }
  if (v3 == 2) {
    return (NSString *)@"IPv4";
  }
  else {
    return &v4->isa;
  }
}

- (NSString)TFOStatusString
{
  uint64_t v3 = [(NPEdgeLatency *)self TFOStatus];
  id v4 = NSString;
  if (v3 > 3) {
    v5 = "Unknown";
  }
  else {
    v5 = TFOStatusString_names[[(NPEdgeLatency *)self TFOStatus]];
  }
  uint64_t v6 = [v4 stringWithUTF8String:v5];
  return (NSString *)v6;
}

- (NSString)connectionParametersString
{
  if ([(NPEdgeLatency *)self probeTFO])
  {
    id v3 = [NSString alloc];
    BOOL v4 = [(NPEdgeLatency *)self probeNoTFOCookie];
    v5 = @"Cookie";
    if (v4) {
      v5 = @"NoCookie";
    }
    uint64_t v6 = (__CFString *)[v3 initWithFormat:@"TFO %@", v5];
  }
  else
  {
    uint64_t v6 = @"TCP";
  }
  return (NSString *)v6;
}

- (BOOL)isTFOEnabled
{
  return [(NPEdgeLatency *)self TFOStatus] == 2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = [(NPEdgeLatency *)self edgeIndex];
  v5 = [(NPEdgeLatency *)self probeEndpoint];
  uint64_t v6 = [v5 description];
  uint64_t v7 = +[NPUtilities stripWhitespace:v6];
  [v3 appendFormat:@"Edge %lu(%@) RTT %lu", v4, v7, -[NPEdgeLatency roundTripTime](self, "roundTripTime")];

  id v8 = [(NPEdgeLatency *)self roundTripAverage];
  uint64_t v9 = [v8 description];

  if (v9) {
    [v3 appendFormat:@" (%@)", v9];
  }
  v10 = [(NPEdgeLatency *)self roundTripAverageObserved];
  uint64_t v11 = [v10 description];

  if (v11) {
    [v3 appendFormat:@" (observed %@)", v11];
  }
  if ([(NPEdgeLatency *)self passedReprobeThreshold]) {
    [v3 appendFormat:@" (passed reprobe threshold)"];
  }
  unint64_t v12 = [(NPEdgeLatency *)self connectionParametersString];
  uint64_t v13 = [(NPEdgeLatency *)self TFOStatusString];
  [v3 appendFormat:@" (%@ %@)", v12, v13];

  if ([(NPEdgeLatency *)self interfaceType])
  {
    v14 = +[NPUtilities getInterfaceTypeString:[(NPEdgeLatency *)self interfaceType]];
    [v3 appendFormat:@" (%@)", v14];
  }
  return v3;
}

- (BOOL)fillTestLatency
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[NSPManager sharedManager];
  int v4 = [v3 useTestLatencyMap];

  if (v4)
  {
    v10[0] = [(NPEdgeLatency *)self probeTFO];
    v10[1] = [(NPEdgeLatency *)self probeNoTFOCookie];
    v5 = +[NSPManager sharedManager];
    uint64_t v6 = [(NPEdgeLatency *)self probeEndpoint];
    uint64_t v7 = [v5 getTestLatencyRTT:v6 parameters:v10];

    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v7;
      _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Got Test RTT %lu", buf, 0xCu);
    }

    if (v7)
    {
      [(NPEdgeLatency *)self addRoundTripSample:v7];
      if ([(NPEdgeLatency *)self probeTFO])
      {
        if (v7 != 0xFFFFFFFFLL) {
          [(NPEdgeLatency *)self setTFOStatus:2];
        }
      }
    }
  }
  return v4;
}

- (void)measureLatencyWithTimeout:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  [(NPEdgeLatency *)self probeConnection];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[NPEdgeLatency measureLatencyWithTimeout:completionHandler:]", "NPEdgeLatency.m", 380, "self.probeConnection == nil");
  }
  [(NPEdgeLatency *)self setCurrentTimeout:v6];
  [(NPEdgeLatency *)self setNeedReprobe:0];
  id v8 = [(NPEdgeLatency *)self probeEndpoint];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    uint64_t v10 = [v6 unsignedLongLongValue];
    uint64_t v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 hostname];
      uint64_t v13 = [(NPEdgeLatency *)self connectionParametersString];
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Probing %@ %@", buf, 0x16u);
    }
    if ([(NPEdgeLatency *)self probeTFO])
    {
      [v9 setEnableTFO:1];
      objc_msgSend(v9, "setEnableTFONoCookie:", -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie"));
      *(_DWORD *)buf = -1;
      v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:4];
      [v9 setInitialDataPayload:v14];
    }
    else
    {
      [(NPEdgeLatency *)self setTFOStatus:3];
    }
    v15 = NPGetInternalQueue();
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v15);
    [(NPEdgeLatency *)self setProbeTimer:v16];

    v17 = [(NPEdgeLatency *)self probeTimer];
    if (v10) {
      int64_t v18 = 1000000 * v10;
    }
    else {
      int64_t v18 = 3000000000;
    }
    dispatch_time_t v19 = dispatch_time(0, v18);
    dispatch_source_set_timer(v17, v19, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v20 = [(NPEdgeLatency *)self probeTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__NPEdgeLatency_measureLatencyWithTimeout_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B240;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);

    v21 = [(NPEdgeLatency *)self probeTimer];
    dispatch_resume(v21);

    [(NPEdgeLatency *)self setProbeCount:[(NPEdgeLatency *)self probeCount] + 1];
    if ([(NPEdgeLatency *)self fillTestLatency])
    {
      v22 = [(NPEdgeLatency *)self probeTimer];

      if (v22)
      {
        v23 = [(NPEdgeLatency *)self probeTimer];
        dispatch_source_cancel(v23);

        [(NPEdgeLatency *)self setProbeTimer:0];
      }
      v7[2](v7);
    }
    else
    {
      [(NPEdgeLatency *)self setProbeCompletionHandler:v7];
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F38C40]) initWithEndpoint:v8 parameters:v9];
      [(NPEdgeLatency *)self setProbeConnection:v24];

      v25 = [(NPEdgeLatency *)self probeConnection];
      [v25 addObserver:self forKeyPath:@"state" options:4 context:0];

      [(NPEdgeLatency *)self setIsObserving:1];
    }
  }
  else
  {
    [(NPEdgeLatency *)self addRoundTripSample:0xFFFFFFFFLL];
    v7[2](v7);
  }
}

void __61__NPEdgeLatency_measureLatencyWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) probeEndpoint];
    int v4 = [v3 hostname];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEFAULT, "RTT probe timeout for %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [*(id *)(a1 + 32) probeConnection];

  if (v5) {
    [*(id *)(a1 + 32) addRoundTripSample:0xFFFFFFFFLL];
  }
  id v6 = [*(id *)(a1 + 32) probeConnection];
  [v6 cancel];
}

- (void)pingPong
{
  int v8 = -1;
  id v3 = [(NPEdgeLatency *)self probeConnection];
  int v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v8 length:4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__NPEdgeLatency_pingPong__block_invoke;
  v6[3] = &unk_1E5A3B1C8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v5 write:v4 completionHandler:v6];
}

void __25__NPEdgeLatency_pingPong__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = NPGetInternalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NPEdgeLatency_pingPong__block_invoke_2;
  block[3] = &unk_1E5A3B178;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __25__NPEdgeLatency_pingPong__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 40) probeEndpoint];
      id v7 = [v6 hostname];
      int v8 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [*(id *)(a1 + 40) interfaceType]);
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      __int16 v15 = 2112;
      dispatch_source_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_error_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to write byte for RTT probe (%@), %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) cancel];
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    unsigned char v10[2] = __25__NPEdgeLatency_pingPong__block_invoke_158;
    v10[3] = &unk_1E5A3BB90;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    id v11 = v4;
    uint64_t v12 = v5;
    [v4 readMinimumLength:1 maximumLength:0x7FFFFFFFLL completionHandler:v10];
  }
}

void __25__NPEdgeLatency_pingPong__block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NPGetInternalQueue();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __25__NPEdgeLatency_pingPong__block_invoke_2_159;
  v12[3] = &unk_1E5A3BB68;
  id v13 = v5;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __25__NPEdgeLatency_pingPong__block_invoke_2_159(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2 || ![v2 length])
  {
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [*(id *)(a1 + 48) probeEndpoint];
      uint64_t v18 = [v17 hostname];
      uint64_t v19 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [*(id *)(a1 + 48) interfaceType]);
      v20 = *(void **)(a1 + 56);
      int v21 = 138412802;
      v22 = v18;
      __int16 v23 = 2112;
      unint64_t v24 = (unint64_t)v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to read frame for RTT probe (%@), %@", (uint8_t *)&v21, 0x20u);
    }
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = 0xFFFFFFFFLL;
    goto LABEL_15;
  }
  unint64_t RTTFromFrame = getRTTFromFrame(*(void **)(a1 + 32));
  if (!+[NPUtilities hasPacketDrop:*(void *)(a1 + 40)]
    && RTTFromFrame != 0xFFFFFFFF
    || [*(id *)(a1 + 48) reprobeCount] > 2)
  {
    uint64_t v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 48) probeEndpoint];
      id v14 = [v13 hostname];
      uint64_t v15 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [*(id *)(a1 + 48) interfaceType]);
      int v21 = 138412802;
      v22 = v14;
      __int16 v23 = 2048;
      unint64_t v24 = RTTFromFrame;
      __int16 v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Got RTT of %lu (%@)", (uint8_t *)&v21, 0x20u);
    }
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = RTTFromFrame;
LABEL_15:
    [v10 addRoundTripSample:v11];
    return [*(id *)(a1 + 40) cancel];
  }
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 48) probeEndpoint];
    id v6 = [v5 hostname];
    uint64_t v7 = [*(id *)(a1 + 48) roundTripTime];
    id v8 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [*(id *)(a1 + 48) interfaceType]);
    int v21 = 138412802;
    v22 = v6;
    __int16 v23 = 2048;
    unint64_t v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Discard RTT of %lu (%@), reprobe due to lost packets", (uint8_t *)&v21, 0x20u);
  }
  [*(id *)(a1 + 48) setNeedReprobe:1];
  objc_msgSend(*(id *)(a1 + 48), "setReprobeCount:", objc_msgSend(*(id *)(a1 + 48), "reprobeCount") + 1);
  return [*(id *)(a1 + 40) cancel];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"state"])
  {
    id v13 = NPGetInternalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5A3BBB8;
    id v16 = v11;
    __int16 v17 = self;
    uint64_t v18 = a6;
    dispatch_async(v13, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NPEdgeLatency;
    [(NPEdgeLatency *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] probeConnection];

  if (v2 == v3)
  {
    switch([v2 state])
    {
      case 0:
      case 2:
      case 4:
        id v4 = a1[6];
        [v4 addRoundTripSample:0xFFFFFFFFLL];
        [v2 cancel];

        break;
      case 3:
        id v5 = [v2 connectedPath];
        id v6 = [v5 interface];
        objc_msgSend(a1[5], "setInterfaceType:", objc_msgSend(v6, "type"));

        uint64_t v7 = nplog_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = [a1[5] probeEndpoint];
          id v16 = [v15 hostname];
          __int16 v17 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [a1[5] interfaceType]);
          *(_DWORD *)buf = 138412546;
          int v21 = v16;
          __int16 v22 = 2112;
          __int16 v23 = v17;
          _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "%@: Probe connection connected over %@", buf, 0x16u);
        }
        id v8 = [v2 parameters];
        int v9 = [v8 enableTFO];

        if (v9)
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_162;
          v18[3] = &unk_1E5A3BB90;
          v18[4] = a1[5];
          id v19 = v2;
          [v19 readMinimumLength:1 maximumLength:0x7FFFFFFFLL completionHandler:v18];
        }
        else
        {
          [a1[5] pingPong];
        }
        break;
      case 5:
        id v10 = [a1[5] probeTimer];

        if (v10)
        {
          id v11 = [a1[5] probeTimer];
          dispatch_source_cancel(v11);

          [a1[5] setProbeTimer:0];
        }
        if ([a1[5] isObserving])
        {
          [v2 removeObserver:a1[5] forKeyPath:@"state" context:a1[6]];
          [a1[5] setIsObserving:0];
        }
        id v12 = [a1[5] probeCompletionHandler];
        [a1[5] setProbeConnection:0];
        [a1[5] setProbeCompletionHandler:0];
        if ([a1[5] needReprobe])
        {
          id v13 = a1[5];
          objc_super v14 = [v13 currentTimeout];
          [v13 measureLatencyWithTimeout:v14 completionHandler:v12];
        }
        else
        {
          if (!v12) {
            break;
          }
          v12[2](v12);
        }

        break;
      default:
        break;
    }
  }
}

void __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NPGetInternalQueue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v11[3] = &unk_1E5A3BB68;
  id v12 = v6;
  id v13 = v5;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

uint64_t __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (id v4 = *(void **)(a1 + 40)) != 0 && ![v4 length])
  {
    id v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 48) probeEndpoint];
      uint64_t v7 = [v6 hostname];
      id v8 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [*(id *)(a1 + 48) interfaceType]);
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412802;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to read byte for RTT probe (%@), %@", (uint8_t *)&v10, 0x20u);
    }
    return [*(id *)(a1 + 56) cancel];
  }
  else
  {
    if (![*(id *)(a1 + 48) TFOStatus]
      && [*(id *)(a1 + 56) state] != 5
      && [*(id *)(a1 + 56) TFOSucceeded])
    {
      [*(id *)(a1 + 48) setTFOStatus:2];
    }
    id v5 = *(void **)(a1 + 48);
    return [v5 pingPong];
  }
}

- (BOOL)isMatched:(id)a3 parameters:(networkParameters *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NPEdgeLatency *)self probeEndpoint];
  int v8 = [v7 isEqual:v6];

  return v8
      && (!a4
       || a4->var0 == [(NPEdgeLatency *)self probeTFO]
       && (![(NPEdgeLatency *)self probeTFO]
        || a4->var1 == [(NPEdgeLatency *)self probeNoTFOCookie]));
}

- (BOOL)isMatched:(id)a3
{
  id v4 = a3;
  v9[0] = [v4 probeTFO];
  v9[1] = [v4 probeNoTFOCookie];
  unint64_t v5 = [(NPEdgeLatency *)self edgeIndex];
  if (v5 == [v4 edgeIndex])
  {
    id v6 = [v4 probeEndpoint];
    BOOL v7 = [(NPEdgeLatency *)self isMatched:v6 parameters:v9];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isComplete:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NPEdgeLatency *)self roundTripAverage];
  id v6 = [v5 samples];
  unint64_t v7 = [v6 count];
  int v8 = [(NPEdgeLatency *)self roundTripAverage];
  char v9 = v7 >= [v8 size];
  if (v9 && v3)
  {
    int v10 = [(NPEdgeLatency *)self roundTripAverage];
    char v9 = [v10 isAnyValid];
  }
  return v9;
}

- (unint64_t)edgeIndex
{
  return self->_edgeIndex;
}

- (void)setEdgeIndex:(unint64_t)a3
{
  self->_edgeIndex = a3;
}

- (NWEndpoint)probeEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProbeEndpoint:(id)a3
{
}

- (unint64_t)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(unint64_t)a3
{
  self->_roundTripTime = a3;
}

- (NPAverage)roundTripAverage
{
  return (NPAverage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRoundTripAverage:(id)a3
{
}

- (NPAverage)roundTripAverageObserved
{
  return (NPAverage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRoundTripAverageObserved:(id)a3
{
}

- (NSNumber)addressFamily
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAddressFamily:(id)a3
{
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (BOOL)probeTFO
{
  return self->_probeTFO;
}

- (void)setProbeTFO:(BOOL)a3
{
  self->_probeTFO = a3;
}

- (BOOL)probeNoTFOCookie
{
  return self->_probeNoTFOCookie;
}

- (void)setProbeNoTFOCookie:(BOOL)a3
{
  self->_probeNoTFOCookie = a3;
}

- (int64_t)TFOStatus
{
  return self->_TFOStatus;
}

- (void)setTFOStatus:(int64_t)a3
{
  self->_TFOStatus = a3;
}

- (int64_t)probeCount
{
  return self->_probeCount;
}

- (void)setProbeCount:(int64_t)a3
{
  self->_probeCount = a3;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)passedReprobeThreshold
{
  return self->_passedReprobeThreshold;
}

- (void)setPassedReprobeThreshold:(BOOL)a3
{
  self->_passedReprobeThreshold = a3;
}

- (int64_t)reprobeCount
{
  return self->_reprobeCount;
}

- (void)setReprobeCount:(int64_t)a3
{
  self->_reprobeCount = a3;
}

- (OS_dispatch_source)probeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeTimer:(id)a3
{
}

- (NWTCPConnection)probeConnection
{
  return (NWTCPConnection *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProbeConnection:(id)a3
{
}

- (id)probeCompletionHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setProbeCompletionHandler:(id)a3
{
}

- (NSNumber)currentTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentTimeout:(id)a3
{
}

- (BOOL)needReprobe
{
  return self->_needReprobe;
}

- (void)setNeedReprobe:(BOOL)a3
{
  self->_needReprobe = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeout, 0);
  objc_storeStrong(&self->_probeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_probeConnection, 0);
  objc_storeStrong((id *)&self->_probeTimer, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_addressFamily, 0);
  objc_storeStrong((id *)&self->_roundTripAverageObserved, 0);
  objc_storeStrong((id *)&self->_roundTripAverage, 0);
  objc_storeStrong((id *)&self->_probeEndpoint, 0);
}

@end