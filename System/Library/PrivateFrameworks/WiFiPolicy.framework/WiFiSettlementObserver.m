@interface WiFiSettlementObserver
- (NSDate)settledDate;
- (NSMutableArray)callbacks;
- (WiFiScanProvider)scanProvider;
- (WiFiSettlementConfiguration)configuration;
- (WiFiSettlementContext)currentContext;
- (WiFiSettlementObserver)initWithScanProvider:(id)a3 configuration:(id)a4;
- (int64_t)status;
- (unint64_t)confidence;
- (unint64_t)consecutiveScansWithoutMatch;
- (void)_callSettlementCallbackWithStatus:(int64_t)a3 userInfo:(id)a4;
- (void)_handleScanResults:(id)a3 error:(id)a4 userInfo:(id)a5;
- (void)_updateSettlementStatus:(int64_t)a3 confidence:(unint64_t)a4;
- (void)addSettlementCallback:(id)a3;
- (void)removeSettlementCallback:(id)a3;
- (void)resetSettlement;
- (void)setCallbacks:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setConsecutiveScansWithoutMatch:(unint64_t)a3;
- (void)setCurrentContext:(id)a3;
- (void)setScanProvider:(id)a3;
- (void)setSettledDate:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation WiFiSettlementObserver

BOOL __60__WiFiSettlementObserver__handleScanResults_error_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:a2];
}

void __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleScanResults:v9 error:v8 userInfo:v7];
}

- (void)_handleScanResults:(id)a3 error:(id)a4 userInfo:(id)a5
{
  id v37 = a3;
  id v7 = a5;
  id v8 = [v7 objectForKeyedSubscript:@"resultType"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v7 objectForKeyedSubscript:@"clientName"];
  v11 = [v7 objectForKeyedSubscript:@"directed"];

  NSLog(&cfstr_SScantypeLuCli.isa, "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]", v9, v10, v11 != 0, v37);
  if (v11)
  {
    NSLog(&cfstr_SSkippingDirec.isa, "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]");
    goto LABEL_20;
  }
  v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1];
  v13 = [v37 filteredSetUsingPredicate:v12];

  v14 = [(WiFiSettlementObserver *)self currentContext];
  if (v14)
  {
  }
  else if ([v13 count])
  {
    v31 = [WiFiSettlementContext alloc];
    v32 = [(WiFiSettlementObserver *)self configuration];
    v33 = -[WiFiSettlementContext initWithNetworks:maxCount:](v31, "initWithNetworks:maxCount:", v13, [v32 maxNetworksForSettlement]);
    [(WiFiSettlementObserver *)self setCurrentContext:v33];

    goto LABEL_19;
  }
  v15 = [(WiFiSettlementObserver *)self currentContext];

  if (v15)
  {
    v16 = [(WiFiSettlementObserver *)self currentContext];
    int v17 = [v16 compareWithScanResults:v13];

    if (!v17)
    {
      unint64_t v34 = [(WiFiSettlementObserver *)self consecutiveScansWithoutMatch];
      v35 = [(WiFiSettlementObserver *)self configuration];
      unint64_t v36 = [v35 maxScansWithoutMatchForUnsettlement];

      if (v34 >= v36) {
        [(WiFiSettlementObserver *)self resetSettlement];
      }
      else {
        [(WiFiSettlementObserver *)self setConsecutiveScansWithoutMatch:[(WiFiSettlementObserver *)self consecutiveScansWithoutMatch] + 1];
      }
      goto LABEL_19;
    }
    v18 = [(WiFiSettlementObserver *)self currentContext];
    v19 = [v18 creationDate];
    [v19 timeIntervalSinceNow];
    double v21 = -v20;

    NSLog(&cfstr_SSettledFor2fS.isa, "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]", *(void *)&v21);
    [(WiFiSettlementObserver *)self setConsecutiveScansWithoutMatch:0];
    v22 = [(WiFiSettlementObserver *)self currentContext];
    [v22 updateNetworks:v37];

    if ([(WiFiSettlementObserver *)self confidence]
      || ([(WiFiSettlementObserver *)self configuration],
          v23 = objc_claimAutoreleasedReturnValue(),
          [v23 lowConfidenceSettlementTime],
          double v25 = v24,
          v23,
          v25 > v21))
    {
      if ([(WiFiSettlementObserver *)self confidence] > 1) {
        goto LABEL_19;
      }
      v26 = [(WiFiSettlementObserver *)self configuration];
      [v26 highConfidenceSettlementTime];
      double v28 = v27;

      if (v28 > v21) {
        goto LABEL_19;
      }
      v29 = self;
      uint64_t v30 = 2;
    }
    else
    {
      v29 = self;
      uint64_t v30 = 1;
    }
    [(WiFiSettlementObserver *)v29 _updateSettlementStatus:1 confidence:v30];
  }
LABEL_19:

LABEL_20:
}

- (WiFiSettlementContext)currentContext
{
  return self->_currentContext;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (WiFiSettlementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConsecutiveScansWithoutMatch:(unint64_t)a3
{
  self->_consecutiveScansWithoutMatch = a3;
}

- (void)_updateSettlementStatus:(int64_t)a3 confidence:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_status != a3)
  {
    NSLog(&cfstr_SSettlementSta.isa, a2, "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]", self->_status, a3);
    self->_status = a3;
    if (a3 == 1)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      [(WiFiSettlementObserver *)self setSettledDate:v9];
    }
    else
    {
      [(WiFiSettlementObserver *)self setSettledDate:0];
    }
    p_unint64_t confidence = &self->_confidence;
    unint64_t confidence = self->_confidence;
    if (confidence == a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  p_unint64_t confidence = &self->_confidence;
  unint64_t confidence = self->_confidence;
  if (confidence != a4)
  {
LABEL_8:
    NSLog(&cfstr_SSettlementCon.isa, a2, "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]", confidence, a4);
    *p_unint64_t confidence = a4;
LABEL_9:
    v12 = @"confidence";
    v10 = [NSNumber numberWithUnsignedInteger:self->_confidence];
    v13[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    [(WiFiSettlementObserver *)self _callSettlementCallbackWithStatus:self->_status userInfo:v11];
  }
}

- (void)setSettledDate:(id)a3
{
  self->_settledDate = (NSDate *)a3;
}

- (void)_callSettlementCallbackWithStatus:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(WiFiSettlementObserver *)self callbacks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (WiFiSettlementObserver)initWithScanProvider:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WiFiSettlementObserver;
  uint64_t v9 = [(WiFiSettlementObserver *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scanProvider, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    long long v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    callbacks = v10->_callbacks;
    v10->_callbacks = v11;

    NSLog(&cfstr_SConfiguration.isa, "-[WiFiSettlementObserver initWithScanProvider:configuration:]", v8);
    objc_initWeak(&location, v10);
    scanProvider = v10->_scanProvider;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke;
    v15[3] = &unk_1E69BCC20;
    objc_copyWeak(&v16, &location);
    [(WiFiScanProvider *)scanProvider addScanResultsCallback:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)addSettlementCallback:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(WiFiSettlementObserver *)self callbacks];
    id v5 = (void *)MEMORY[0x1D94403E0](v4);

    [v6 addObject:v5];
  }
}

- (void)removeSettlementCallback:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(WiFiSettlementObserver *)self callbacks];
    id v5 = (void *)MEMORY[0x1D94403E0](v4);

    [v6 removeObject:v5];
  }
}

- (void)resetSettlement
{
  NSLog(&cfstr_SResettingSett.isa, a2, "-[WiFiSettlementObserver resetSettlement]");
  [(WiFiSettlementObserver *)self setCurrentContext:0];
  [(WiFiSettlementObserver *)self setConsecutiveScansWithoutMatch:0];

  [(WiFiSettlementObserver *)self _updateSettlementStatus:0 confidence:0];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_unint64_t confidence = a3;
}

- (NSDate)settledDate
{
  return self->_settledDate;
}

- (WiFiScanProvider)scanProvider
{
  return self->_scanProvider;
}

- (void)setScanProvider:(id)a3
{
}

- (void)setCurrentContext:(id)a3
{
}

- (unint64_t)consecutiveScansWithoutMatch
{
  return self->_consecutiveScansWithoutMatch;
}

- (void)setCallbacks:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);

  objc_storeStrong((id *)&self->_scanProvider, 0);
}

@end