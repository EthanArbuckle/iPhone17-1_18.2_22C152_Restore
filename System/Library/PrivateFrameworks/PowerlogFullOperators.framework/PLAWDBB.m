@interface PLAWDBB
+ (id)entryAggregateDefinitionAwdBBQlm;
+ (id)entryAggregateDefinitionAwdBBQlmCounter;
+ (id)entryAggregateDefinitionAwdConnectedPower;
+ (id)entryAggregateDefinitionAwdVolte;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)submitConnectedPower:(id)a3 withAwdConn:(id)a4;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (LTEPoint)currThreshold;
- (LTEPoint)point;
- (NSDate)endLTECall;
- (NSDate)startLTECall;
- (NSDate)startTimeAppBB;
- (NSDate)startTimeBBLqm;
- (NSLock)lock;
- (NSMutableArray)lteCallArray;
- (NSMutableArray)unhandledRFLTEEntries;
- (PLEntryNotificationOperatorComposition)accountingGroupEventCallback;
- (PLEntryNotificationOperatorComposition)bbEventCallback;
- (PLEntryNotificationOperatorComposition)bbLqmCellularActiveCallback;
- (PLEntryNotificationOperatorComposition)bbLqmCumulativeNetworkCallback;
- (PLEntryNotificationOperatorComposition)bbProtocolRailCallback;
- (PLEntryNotificationOperatorComposition)bbRfLTECallback;
- (PLEntryNotificationOperatorComposition)bbTelephonyActivityCallback;
- (PLEntryNotificationOperatorComposition)connectedPowerRailCallback;
- (PLEntryNotificationOperatorComposition)iceStatsEventCallback;
- (double)getIntervalSinceLastUpdateWithEntryName:(id)a3;
- (int)convertQualityWithLinkQuality:(double)a3;
- (int)currQuality;
- (int)newQuality;
- (signed)telActivityState;
- (unsigned)downBytes;
- (unsigned)downBytesLTE;
- (unsigned)upBytes;
- (unsigned)upBytesLTE;
- (void)bbLTEWriteAggregatedTableWithRFLTEEntry:(id)a3 withPoint:(id)a4;
- (void)finalizePeriodWithUpBytes:(unsigned int)a3 withDownBytes:(unsigned int)a4;
- (void)finalizeTableWithEntry:(id)a3;
- (void)handleAcountGroupCallback:(id)a3;
- (void)handleBBLqmCellularActiveCallback:(id)a3;
- (void)handleBBLqmCumulativeNetworkCallback:(id)a3;
- (void)handleBBRailCallbackBBICE:(id)a3;
- (void)handleBBRailCallbackBBProtocol:(id)a3;
- (void)handleBBRailCallbackBBTx:(id)a3;
- (void)handleBBRailCallbackLTESleep:(id)a3;
- (void)handleBBRailCallbackOos:(id)a3;
- (void)handleBBRailCallbackTxCdma2K:(id)a3;
- (void)handleBBRailCallbackTxCdma:(id)a3;
- (void)handleBBRailCallbackTxEvdo:(id)a3;
- (void)handleBBRailCallbackTxGsm:(id)a3;
- (void)handleBBRailCallbackTxLte:(id)a3;
- (void)handleBBRailCallbackTxUtran:(id)a3;
- (void)handleIceStatsCallback:(id)a3;
- (void)handleRfLTE:(id)a3;
- (void)handleRfLTEOffline;
- (void)handleTelephonyActiveCallback:(id)a3;
- (void)resetAllBBLqmTables;
- (void)resetBBLqmCounterTable;
- (void)resetBBLqmTable;
- (void)resetBBVoLTETable;
- (void)resetConnectedPowerTable;
- (void)setAccountingGroupEventCallback:(id)a3;
- (void)setBbEventCallback:(id)a3;
- (void)setBbLqmCellularActiveCallback:(id)a3;
- (void)setBbLqmCumulativeNetworkCallback:(id)a3;
- (void)setBbProtocolRailCallback:(id)a3;
- (void)setBbRfLTECallback:(id)a3;
- (void)setBbTelephonyActivityCallback:(id)a3;
- (void)setConnectedPowerRailCallback:(id)a3;
- (void)setCurrQuality:(int)a3;
- (void)setCurrThreshold:(id)a3;
- (void)setDownBytes:(unsigned int)a3;
- (void)setDownBytesLTE:(unsigned int)a3;
- (void)setEndLTECall:(id)a3;
- (void)setIceStatsEventCallback:(id)a3;
- (void)setLock:(id)a3;
- (void)setLteCallArray:(id)a3;
- (void)setNewQuality:(int)a3;
- (void)setPoint:(id)a3;
- (void)setStartLTECall:(id)a3;
- (void)setStartTimeAppBB:(id)a3;
- (void)setStartTimeBBLqm:(id)a3;
- (void)setTelActivityState:(signed __int16)a3;
- (void)setUnhandledRFLTEEntries:(id)a3;
- (void)setUpBytes:(unsigned int)a3;
- (void)setUpBytesLTE:(unsigned int)a3;
- (void)startAppBB;
- (void)startAppRrc;
- (void)startBBLqm;
- (void)startBBPower;
- (void)startConnectedPower;
- (void)startMetricCollection:(id)a3;
- (void)stopAppRrc;
- (void)stopBBLqm;
- (void)stopBBPower;
- (void)stopConnectedPower;
- (void)stopMetricCollection:(id)a3;
- (void)submitAppBB:(id)a3 withAwdConn:(id)a4;
- (void)submitAppRrc:(id)a3 withAwdConn:(id)a4;
- (void)submitBBLqm:(id)a3 withAwdConn:(id)a4;
- (void)updateCurrLqmState;
- (void)updateLQMTableWithQuality:(int)a3 withTime:(double)a4 withRX:(double)a5 withTX:(double)a6;
@end

@implementation PLAWDBB

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdBb;
  if (!plAwdBb)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDBB alloc] initWithOperator:v4];

    v6 = (void *)plAwdBb;
    plAwdBb = (uint64_t)v5;

    v3 = (void *)plAwdBb;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"awdBBLqm";
  v3 = [a1 entryAggregateDefinitionAwdBBQlm];
  v10[0] = v3;
  v9[1] = @"awdBBLqmCounter";
  id v4 = [a1 entryAggregateDefinitionAwdBBQlmCounter];
  v10[1] = v4;
  v9[2] = @"BBConnectedPower";
  v5 = [a1 entryAggregateDefinitionAwdConnectedPower];
  v10[2] = v5;
  v9[3] = @"Volte";
  v6 = [a1 entryAggregateDefinitionAwdVolte];
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 addObject:v4];

  uint64_t v6 = [v4 longValue];
  switch(v6)
  {
    case 2031628:
      [(PLAWDBB *)self startAppRrc];
      break;
    case 2031629:
      [(PLAWDBB *)self startAppBB];
      break;
    case 2031630:
      [(PLAWDBB *)self startConnectedPower];
      break;
    case 2031631:
      [(PLAWDBB *)self startBBLqm];
      break;
    case 2031632:
      [(PLAWDBB *)self startBBPower];
      break;
    default:
      return;
  }
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  switch(v6)
  {
    case 2031628:
      [(PLAWDBB *)self stopAppRrc];
      break;
    case 2031629:
      [(PLAWDBB *)self stopAppBB];
      break;
    case 2031630:
      [(PLAWDBB *)self stopConnectedPower];
      break;
    case 2031631:
      [(PLAWDBB *)self stopBBLqm];
      break;
    default:
      break;
  }
  v7 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v9 = (void *)plAwdBb;
    plAwdBb = 0;
  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v6 longValue])
  {
    case 2031628:
      [(PLAWDBB *)self submitAppRrc:v6 withAwdConn:v7];
      goto LABEL_6;
    case 2031629:
      [(PLAWDBB *)self submitAppBB:v6 withAwdConn:v7];
      goto LABEL_6;
    case 2031630:
      BOOL v8 = [(PLAWDBB *)self submitConnectedPower:v6 withAwdConn:v7];
      break;
    case 2031631:
      [(PLAWDBB *)self submitBBLqm:v6 withAwdConn:v7];
      goto LABEL_6;
    case 2031632:
    case 2031633:
LABEL_6:
      BOOL v8 = 1;
      break;
    default:
      BOOL v8 = 0;
      break;
  }

  return v8;
}

+ (id)entryAggregateDefinitionAwdBBQlm
{
  v28[4] = *MEMORY[0x263EF8340];
  v27[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v25[0] = *MEMORY[0x263F5F880];
  v25[1] = v2;
  v26[0] = &unk_26E5466A0;
  v26[1] = MEMORY[0x263EFFA80];
  v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v17;
  v27[1] = *MEMORY[0x263F5F870];
  v23[0] = @"BBLinkQuality";
  v16 = [MEMORY[0x263F5F650] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v24[0] = v15;
  v23[1] = @"BBLqmTx";
  v14 = [MEMORY[0x263F5F650] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v24[1] = v3;
  v23[2] = @"BBLqmRx";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v24[2] = v5;
  v23[3] = @"BBLqmTime";
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v24[3] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v28[1] = v8;
  v27[2] = *MEMORY[0x263F5F828];
  v21 = &unk_26E5466B0;
  uint64_t v19 = *MEMORY[0x263F5F820];
  v20 = &unk_26E5466B0;
  v9 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v28[2] = v10;
  v27[3] = *MEMORY[0x263F5F830];
  v18[0] = @"BBLqmTx";
  v18[1] = @"BBLqmRx";
  v18[2] = @"BBLqmTime";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v28[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionAwdBBQlmCounter
{
  void v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E5466C0;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"BBLqmSwitchBucket";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[1] = @"BBLqmSwitchCounter";
  v20[0] = v5;
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v20[1] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E5466B0;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E5466B0;
  v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  v14 = @"BBLqmSwitchCounter";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startBBLqm
{
  [(PLAWDBB *)self resetAllBBLqmTables];
  v3 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLAWDBB *)self setStartTimeBBLqm:v3];

  [(PLAWDBB *)self setUpBytes:0];
  [(PLAWDBB *)self setDownBytes:0];
  [(PLAWDBB *)self setUpBytesLTE:0];
  [(PLAWDBB *)self setDownBytesLTE:0];
  id v4 = [MEMORY[0x263F5F910] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5FA00]];
  id v5 = objc_alloc(MEMORY[0x263F5F658]);
  id v6 = [(PLAWDAuxMetrics *)self operator];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __21__PLAWDBB_startBBLqm__block_invoke;
  v15[3] = &unk_264B99DD0;
  v15[4] = self;
  id v7 = (void *)[v5 initWithOperator:v6 forEntryKey:v4 withBlock:v15];

  [(PLAWDBB *)self setBbLqmCellularActiveCallback:v7];
  BOOL v8 = [MEMORY[0x263F5F8F8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5FA18]];
  id v9 = objc_alloc(MEMORY[0x263F5F658]);
  v10 = [(PLAWDAuxMetrics *)self operator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __21__PLAWDBB_startBBLqm__block_invoke_2;
  v14[3] = &unk_264B99DD0;
  v14[4] = self;
  v11 = (void *)[v9 initWithOperator:v10 forEntryKey:v8 withBlock:v14];

  [(PLAWDBB *)self setBbLqmCumulativeNetworkCallback:v11];
  [(PLAWDBB *)self updateCurrLqmState];
  v12 = [(PLAWDBB *)self bbLqmCellularActiveCallback];
  [v12 requestEntry];

  v13 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
  [v13 requestEntry];
}

uint64_t __21__PLAWDBB_startBBLqm__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBBLqmCellularActiveCallback:a2];
  }
  return result;
}

uint64_t __21__PLAWDBB_startBBLqm__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBBLqmCumulativeNetworkCallback:a2];
  }
  return result;
}

- (void)updateLQMTableWithQuality:(int)a3 withTime:(double)a4 withRX:(double)a5 withTX:(double)a6
{
  uint64_t v9 = *(void *)&a3;
  id v17 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"awdBBLqm"];
  v11 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v17];
  if (v11)
  {
    v12 = [NSNumber numberWithInt:v9];
    [v11 setObject:v12 forKeyedSubscript:@"BBLinkQuality"];

    v13 = [NSNumber numberWithDouble:a4];
    [v11 setObject:v13 forKeyedSubscript:@"BBLqmTime"];

    v14 = [NSNumber numberWithDouble:a5];
    [v11 setObject:v14 forKeyedSubscript:@"BBLqmRx"];

    uint64_t v15 = [NSNumber numberWithDouble:a6];
    [v11 setObject:v15 forKeyedSubscript:@"BBLqmTx"];

    v16 = [(PLAWDAuxMetrics *)self operator];
    [v16 logEntry:v11];
  }
}

- (void)updateCurrLqmState
{
  id v7 = [MEMORY[0x263F5F910] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5FA00]];
  v3 = [(PLAWDAuxMetrics *)self operator];
  id v4 = [v3 storage];
  id v5 = [v4 lastEntryForKey:v7];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"LinkQuality"];
    [v6 doubleValue];
    -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));
  }
  else
  {
    [(PLAWDBB *)self setNewQuality:0];
  }
  [(PLAWDBB *)self setCurrQuality:[(PLAWDBB *)self newQuality]];
  [(PLAWDBB *)self updateLQMTableWithQuality:[(PLAWDBB *)self newQuality] withTime:0.0 withRX:0.0 withTX:0.0];
}

- (void)finalizeTableWithEntry:(id)a3
{
  id v5 = [MEMORY[0x263F5F910] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5FA00]];
  [(PLAWDBB *)self getIntervalSinceLastUpdateWithEntryName:v5];
  [(PLAWDBB *)self updateLQMTableWithQuality:[(PLAWDBB *)self newQuality] withTime:v4 withRX:0.0 withTX:0.0];
}

- (double)getIntervalSinceLastUpdateWithEntryName:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAWDAuxMetrics *)self operator];
  id v6 = [v5 storage];
  id v7 = [v6 lastEntryForKey:v4];

  BOOL v8 = [v7 entryDate];
  uint64_t v9 = [(PLAWDBB *)self startTimeBBLqm];
  v10 = [v8 laterDate:v9];
  [v10 timeIntervalSinceMonitonicNow];
  double v12 = -v11;

  return v12;
}

- (void)stopBBLqm
{
  [(PLAWDBB *)self setBbLqmCellularActiveCallback:0];

  [(PLAWDBB *)self setBbLqmCumulativeNetworkCallback:0];
}

- (void)submitBBLqm:(id)a3 withAwdConn:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F5F888];
  uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"awdBBLqm"];
  [(PLAWDBB *)self finalizeTableWithEntry:v9];
  uint64_t v10 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  double v11 = (void *)v10;
  if (v10)
  {
    uint64_t v71 = v8;
    v74 = (void *)v10;
    id v76 = v6;
    double v12 = [(PLAWDBB *)self bbLqmCellularActiveCallback];
    [v12 requestEntry];

    v13 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
    [v13 requestEntry];

    sleep(5u);
    v77 = objc_opt_new();
    id v80 = objc_alloc_init(MEMORY[0x263EFF980]);
    v14 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    uint64_t v15 = [MEMORY[0x263EFF910] monotonicDate];
    [v14 timeIntervalSince1970];
    double v17 = v16;
    [v15 timeIntervalSince1970];
    double v19 = v18 - v17;

    v78 = self;
    v20 = [(PLAWDAuxMetrics *)self operator];
    v21 = [v20 storage];
    v75 = v9;
    uint64_t v22 = objc_msgSend(v21, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 86400.0, v17, v19);

    v73 = (void *)v22;
    [MEMORY[0x263F5F648] summarizeAggregateEntries:v22];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v86 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          v28 = objc_opt_new();
          [v28 setBundleName:@"no name"];
          v29 = [v27 objectForKeyedSubscript:@"BBLqmTime"];
          [v29 doubleValue];
          [v28 setStateDuration:(v30 * 1000.0)];

          v31 = [v27 objectForKeyedSubscript:@"BBLinkQuality"];
          [v31 doubleValue];
          [v28 setLQM:(int)v32];

          v33 = [v27 objectForKeyedSubscript:@"BBLqmRx"];
          [v33 doubleValue];
          [v28 setRxBytes:v34];

          v35 = [v27 objectForKeyedSubscript:@"BBLqmTx"];
          [v35 doubleValue];
          [v28 setTxBytes:v36];

          [v80 addObject:v28];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v24);
    }
    [v77 setLQMBytes:v80];
    uint64_t v37 = +[PLOperator entryKeyForType:v71 andName:@"awdBBLqmCounter"];
    v38 = [(PLAWDAuxMetrics *)v78 operator];
    v39 = [v38 storage];
    v72 = (void *)v37;
    uint64_t v40 = objc_msgSend(v39, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v37, 86400.0, v17, v19);

    v70 = (void *)v40;
    v41 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v40];
    memset(v90, 0, sizeof(v90));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v81 objects:v89 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = 0;
      uint64_t v45 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v82 != v45) {
            objc_enumerationMutation(v41);
          }
          v47 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          v48 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
          [v48 doubleValue];
          double v50 = v49;

          if (v50 == 6.0)
          {
            uint64_t v44 = 0;
          }
          else
          {
            v51 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
            [v51 doubleValue];
            double v53 = v52;

            if (v53 == 12.0)
            {
              uint64_t v44 = 1;
            }
            else
            {
              v54 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
              [v54 doubleValue];
              double v56 = v55;

              if (v56 == 20.0)
              {
                uint64_t v44 = 2;
              }
              else
              {
                v57 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
                [v57 doubleValue];
                double v59 = v58;

                if (v59 == 100.0)
                {
                  uint64_t v44 = 3;
                }
                else
                {
                  v60 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
                  [v60 doubleValue];
                  double v62 = v61;

                  if (v62 == 300.0)
                  {
                    uint64_t v44 = 4;
                  }
                  else
                  {
                    v63 = [v47 objectForKeyedSubscript:@"BBLqmSwitchBucket"];
                    [v63 doubleValue];
                    double v65 = v64;

                    if (v65 == 301.0) {
                      uint64_t v44 = 5;
                    }
                  }
                }
              }
            }
          }
          v66 = [v47 objectForKeyedSubscript:@"BBLqmSwitchCounter"];
          [v66 doubleValue];
          *((_DWORD *)v90 + v44) = v67;
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v81 objects:v89 count:16];
      }
      while (v43);
    }
    [v77 setLQMTransitionCntBuckets:v90 count:6];
    [v77 setLQMBytes:v80];
    double v11 = v74;
    [v74 setMetric:v77];
    [v7 submitMetric:v74];

    id v6 = v76;
    self = v78;
    uint64_t v9 = v75;
  }
  [(PLAWDBB *)self setUpBytes:0];
  [(PLAWDBB *)self setDownBytes:0];
  [(PLAWDBB *)self setUpBytesLTE:0];
  [(PLAWDBB *)self setDownBytesLTE:0];
  v68 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
  [v68 requestEntry];

  [(PLAWDBB *)self resetAllBBLqmTables];
  v69 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLAWDBB *)self setStartTimeBBLqm:v69];

  [(PLAWDBB *)self updateCurrLqmState];
}

- (void)handleBBLqmCumulativeNetworkCallback:(id)a3
{
  id v51 = a3;
  if (![(PLAWDBB *)self currQuality]) {
    [(PLAWDBB *)self updateCurrLqmState];
  }
  id v4 = [v51 objectForKey:@"entry"];
  id v5 = [NSString alloc];
  id v6 = [v4 objectForKeyedSubscript:@"Interface"];
  id v7 = (void *)[v5 initWithFormat:@"%@", v6];

  if ([v7 isEqualToString:@"pdp_ip0"])
  {
    if ([(PLAWDBB *)self telActivityState] == 1)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"UpBytes"];
      [v8 doubleValue];
      [(PLAWDBB *)self setUpBytesLTE:v9];

      uint64_t v10 = [v4 objectForKeyedSubscript:@"DownBytes"];
      [v10 doubleValue];
      [(PLAWDBB *)self setDownBytesLTE:v11];

      uint64_t v12 = 2;
    }
    else
    {
      if ([(PLAWDBB *)self telActivityState] != 3)
      {
LABEL_9:
        double v18 = [(PLAWDBB *)self unhandledRFLTEEntries];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          v20 = [MEMORY[0x263EFF910] monotonicDate];
          [(PLAWDBB *)self setEndLTECall:v20];

          v21 = [(PLAWDBB *)self endLTECall];
          uint64_t v22 = [(PLAWDBB *)self lteCallArray];
          uint64_t v23 = [(PLAWDBB *)self lteCallArray];
          uint64_t v24 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v23, "count") - 1);
          [v24 setEndDate:v21];

          uint64_t v25 = [v4 objectForKeyedSubscript:@"UpBytes"];
          [v25 doubleValue];
          uint64_t v27 = (v26 - (double)[(PLAWDBB *)self upBytesLTE]);
          v28 = [v4 objectForKeyedSubscript:@"DownBytes"];
          [v28 doubleValue];
          [(PLAWDBB *)self finalizePeriodWithUpBytes:v27 withDownBytes:(v29 - (double)[(PLAWDBB *)self downBytesLTE])];

          double v30 = [v4 objectForKeyedSubscript:@"UpBytes"];
          [v30 doubleValue];
          [(PLAWDBB *)self setUpBytesLTE:v31];

          double v32 = [v4 objectForKeyedSubscript:@"DownBytes"];
          [v32 doubleValue];
          [(PLAWDBB *)self setDownBytesLTE:v33];

          [(PLAWDBB *)self handleRfLTEOffline];
          double v34 = [MEMORY[0x263EFF910] monotonicDate];
          [(PLAWDBB *)self setStartLTECall:v34];

          v35 = objc_opt_new();
          [(PLAWDBB *)self setPoint:v35];

          double v36 = [(PLAWDBB *)self startLTECall];
          uint64_t v37 = [(PLAWDBB *)self point];
          [v37 setStartDate:v36];

          v38 = [(PLAWDBB *)self point];
          [v38 setEndDate:0];

          v39 = [(PLAWDBB *)self lteCallArray];
          uint64_t v40 = [(PLAWDBB *)self point];
          [v39 addObject:v40];
        }
        if ([(PLAWDBB *)self upBytes]
          && [(PLAWDBB *)self downBytes]
          && [(PLAWDBB *)self currQuality])
        {
          uint64_t v41 = [(PLAWDBB *)self currQuality];
          uint64_t v42 = [v4 objectForKeyedSubscript:@"UpBytes"];
          [v42 doubleValue];
          double v44 = v43 - (double)[(PLAWDBB *)self upBytes];
          uint64_t v45 = [v4 objectForKeyedSubscript:@"DownBytes"];
          [v45 doubleValue];
          [(PLAWDBB *)self updateLQMTableWithQuality:v41 withTime:0.0 withRX:v44 withTX:v46 - (double)[(PLAWDBB *)self downBytes]];
        }
        v47 = [v4 objectForKeyedSubscript:@"UpBytes"];
        [v47 doubleValue];
        [(PLAWDBB *)self setUpBytes:v48];

        double v49 = [v4 objectForKeyedSubscript:@"DownBytes"];
        [v49 doubleValue];
        [(PLAWDBB *)self setDownBytes:v50];

        goto LABEL_16;
      }
      v13 = [v4 objectForKeyedSubscript:@"UpBytes"];
      [v13 doubleValue];
      uint64_t v15 = (v14 - (double)[(PLAWDBB *)self upBytesLTE]);
      double v16 = [v4 objectForKeyedSubscript:@"DownBytes"];
      [v16 doubleValue];
      [(PLAWDBB *)self finalizePeriodWithUpBytes:v15 withDownBytes:(v17 - (double)[(PLAWDBB *)self downBytesLTE])];

      [(PLAWDBB *)self setUpBytesLTE:0];
      [(PLAWDBB *)self setDownBytesLTE:0];
      uint64_t v12 = 0;
    }
    [(PLAWDBB *)self setTelActivityState:v12];
    goto LABEL_9;
  }
LABEL_16:
}

- (int)convertQualityWithLinkQuality:(double)a3
{
  if (a3 >= 10.0) {
    int v3 = 3;
  }
  else {
    int v3 = 0;
  }
  if (a3 < 50.0) {
    int v4 = v3;
  }
  else {
    int v4 = 2;
  }
  if (a3 < 100.0) {
    return v4;
  }
  else {
    return 1;
  }
}

- (void)handleBBLqmCellularActiveCallback:(id)a3
{
  int v4 = [a3 objectForKey:@"entry"];
  id v5 = [(PLAWDAuxMetrics *)self operator];
  id v6 = [v5 storage];
  id v7 = [v4 entryKey];
  uint64_t v8 = objc_msgSend(v6, "entryForKey:withID:", v7, objc_msgSend(v4, "entryID") - 1);

  if (v4)
  {
    if (v8)
    {
      double v9 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"awdBBLqmCounter"];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v9];
      double v11 = [v4 entryDate];
      [v11 timeIntervalSince1970];
      double v13 = v12;
      double v14 = [v8 entryDate];
      uint64_t v15 = [(PLAWDBB *)self startTimeBBLqm];
      double v16 = [v14 laterDate:v15];
      [v16 timeIntervalSince1970];
      double v18 = v17;

      [(PLAWDBB *)self setCurrQuality:[(PLAWDBB *)self newQuality]];
      uint64_t v19 = [v4 objectForKeyedSubscript:@"LinkQuality"];
      [v19 doubleValue];
      -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__PLAWDBB_handleBBLqmCellularActiveCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v20;
        if (handleBBLqmCellularActiveCallback__defaultOnce != -1) {
          dispatch_once(&handleBBLqmCellularActiveCallback__defaultOnce, block);
        }
        if (handleBBLqmCellularActiveCallback__classDebugEnabled)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"type - %d; curr - %d",
            [(PLAWDBB *)self newQuality],
          v21 = [(PLAWDBB *)self currQuality]);
          uint64_t v22 = (void *)MEMORY[0x263F5F638];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
          uint64_t v24 = [v23 lastPathComponent];
          uint64_t v25 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBLqmCellularActiveCallback:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:548];

          double v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
        }
      }
      double v27 = v13 - v18;
      int v28 = [(PLAWDBB *)self newQuality];
      if (v28 != [(PLAWDBB *)self currQuality]
        && [(PLAWDBB *)self newQuality]
        && [(PLAWDBB *)self currQuality])
      {
        if (v27 >= 6.0)
        {
          if (v27 >= 12.0)
          {
            if (v27 >= 20.0)
            {
              if (v27 >= 100.0)
              {
                if (v27 >= 300.0) {
                  double v29 = &unk_26E5469B0;
                }
                else {
                  double v29 = &unk_26E546998;
                }
              }
              else
              {
                double v29 = &unk_26E546980;
              }
            }
            else
            {
              double v29 = &unk_26E546968;
            }
          }
          else
          {
            double v29 = &unk_26E546950;
          }
        }
        else
        {
          double v29 = &unk_26E546938;
        }
        [v10 setObject:v29 forKeyedSubscript:@"BBLqmSwitchBucket"];
        [v10 setObject:&unk_26E5469C8 forKeyedSubscript:@"BBLqmSwitchCounter"];
        double v30 = [(PLAWDAuxMetrics *)self operator];
        [v30 logEntry:v10];
      }
      [(PLAWDBB *)self updateLQMTableWithQuality:[(PLAWDBB *)self currQuality] withTime:v27 withRX:0.0 withTX:0.0];
      if (v27 < 10.0)
      {
        [(PLAWDBB *)self setUpBytes:0];
        [(PLAWDBB *)self setDownBytes:0];
      }
      double v31 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
      [v31 requestEntry];
    }
    else
    {
      double v9 = [v4 objectForKeyedSubscript:@"LinkQuality"];
      [v9 doubleValue];
      -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));
    }
  }
}

uint64_t __45__PLAWDBB_handleBBLqmCellularActiveCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBLqmCellularActiveCallback__classDebugEnabled = result;
  return result;
}

- (void)resetAllBBLqmTables
{
  [(PLAWDBB *)self resetBBLqmTable];

  [(PLAWDBB *)self resetBBLqmCounterTable];
}

- (void)resetBBLqmTable
{
  int v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"awdBBLqm"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)resetBBLqmCounterTable
{
  int v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"awdBBLqmCounter"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

+ (id)entryAggregateDefinitionAwdVolte
{
  v26[4] = *MEMORY[0x263EF8340];
  v25[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v23[0] = *MEMORY[0x263F5F880];
  v23[1] = v2;
  v24[0] = &unk_26E5466A0;
  v24[1] = MEMORY[0x263EFFA80];
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v15;
  v25[1] = *MEMORY[0x263F5F870];
  v21[0] = @"BBLteThreshold";
  double v14 = [MEMORY[0x263F5F650] sharedInstance];
  int v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v22[0] = v3;
  v21[1] = @"BBLteType";
  objc_super v4 = [MEMORY[0x263F5F650] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v22[1] = v5;
  void v21[2] = @"BBLteValue";
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  void v22[2] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v26[1] = v8;
  void v25[2] = *MEMORY[0x263F5F828];
  uint64_t v19 = &unk_26E5466B0;
  uint64_t v17 = *MEMORY[0x263F5F820];
  double v18 = &unk_26E5466B0;
  double v9 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  uint64_t v20 = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  void v26[2] = v10;
  v25[3] = *MEMORY[0x263F5F830];
  double v16 = @"BBLteValue";
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v26[3] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v12;
}

- (void)startAppRrc
{
  [(PLAWDBB *)self setTelActivityState:0];
  int v3 = objc_opt_new();
  [(PLAWDBB *)self setLteCallArray:v3];

  objc_super v4 = objc_opt_new();
  [(PLAWDBB *)self setUnhandledRFLTEEntries:v4];

  id v5 = objc_opt_new();
  [(PLAWDBB *)self setLock:v5];

  [(PLAWDBB *)self resetBBVoLTETable];
  id v6 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F948]];
  id v7 = objc_alloc(MEMORY[0x263F5F658]);
  uint64_t v8 = [(PLAWDAuxMetrics *)self operator];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __22__PLAWDBB_startAppRrc__block_invoke;
  v15[3] = &unk_264B99DD0;
  v15[4] = self;
  double v9 = (void *)[v7 initWithOperator:v8 forEntryKey:v6 withBlock:v15];

  [(PLAWDBB *)self setBbTelephonyActivityCallback:v9];
  uint64_t v10 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F988]];
  id v11 = objc_alloc(MEMORY[0x263F5F658]);
  double v12 = [(PLAWDAuxMetrics *)self operator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __22__PLAWDBB_startAppRrc__block_invoke_2;
  v14[3] = &unk_264B99DD0;
  v14[4] = self;
  double v13 = (void *)[v11 initWithOperator:v12 forEntryKey:v10 withBlock:v14];

  [(PLAWDBB *)self setBbRfLTECallback:v13];
}

uint64_t __22__PLAWDBB_startAppRrc__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleTelephonyActiveCallback:a2];
  }
  return result;
}

uint64_t __22__PLAWDBB_startAppRrc__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleRfLTE:a2];
  }
  return result;
}

- (void)stopAppRrc
{
  [(PLAWDBB *)self setBbTelephonyActivityCallback:0];

  [(PLAWDBB *)self setBbRfLTECallback:0];
}

- (void)submitAppRrc:(id)a3 withAwdConn:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    double v56 = (void *)v7;
    double v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-604800.0];
    uint64_t v10 = [MEMORY[0x263EFF910] monotonicDate];
    [v9 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    double v14 = v13 - v12;

    uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"Volte"];
    double v55 = self;
    double v16 = [(PLAWDAuxMetrics *)self operator];
    uint64_t v17 = [v16 storage];
    v54 = (void *)v15;
    uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);

    double v53 = (void *)v18;
    uint64_t v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
    v57 = v6;
    double v52 = objc_opt_new();
    objc_msgSend(v52, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
    id v51 = objc_opt_new();
    uint64_t v20 = objc_opt_new();
    v21 = objc_opt_new();
    uint64_t v22 = objc_opt_new();
    uint64_t v23 = objc_opt_new();
    double v50 = v20;
    [v20 setThreshold:200];
    double v49 = v21;
    [v21 setThreshold:1000];
    double v48 = v22;
    [v22 setThreshold:10000];
    [v23 setThreshold:11000];
    v77[0] = 0;
    v77[1] = 0;
    int v78 = 0;
    v75[0] = 0;
    v75[1] = 0;
    int v76 = 0;
    v72[0] = 0;
    v72[1] = 0;
    int v73 = 0;
    v69[0] = 0;
    v69[1] = 0;
    int v70 = 0;
    v67[0] = 0;
    v67[1] = 0;
    uint64_t v68 = 0;
    v65[0] = 0;
    v65[1] = 0;
    uint64_t v66 = 0;
    memset(v64, 0, sizeof(v64));
    memset(v63, 0, sizeof(v63));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v24 = v19;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (!v25) {
      goto LABEL_23;
    }
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v59;
    while (1)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v59 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        double v30 = [v29 objectForKeyedSubscript:@"BBLteThreshold"];
        int v31 = [v30 intValue];

        if (v31 > 9999)
        {
          if (v31 == 10000)
          {
            double v46 = [v29 objectForKeyedSubscript:@"BBLteType"];
            int v33 = [v46 intValue];

            double v34 = [v29 objectForKeyedSubscript:@"BBLteValue"];
            int v35 = [v34 intValue];
            double v36 = [v29 objectForKeyedSubscript:@"BBLteType"];
            int v37 = [v36 intValue];
            v38 = (char *)&v68 + 4 * v37 + 4;
            v39 = v64;
          }
          else
          {
            if (v31 != 11000) {
              continue;
            }
            uint64_t v40 = [v29 objectForKeyedSubscript:@"BBLteType"];
            int v33 = [v40 intValue];

            double v34 = [v29 objectForKeyedSubscript:@"BBLteValue"];
            int v35 = [v34 intValue];
            double v36 = [v29 objectForKeyedSubscript:@"BBLteType"];
            int v37 = [v36 intValue];
            v38 = (char *)&v66 + 4 * v37 + 4;
            v39 = v63;
          }
          goto LABEL_16;
        }
        if (v31 != 200)
        {
          if (v31 != 1000) {
            continue;
          }
          double v32 = [v29 objectForKeyedSubscript:@"BBLteType"];
          int v33 = [v32 intValue];

          double v34 = [v29 objectForKeyedSubscript:@"BBLteValue"];
          int v35 = [v34 intValue];
          double v36 = [v29 objectForKeyedSubscript:@"BBLteType"];
          int v37 = [v36 intValue];
          v38 = &v71[4 * v37];
          v39 = v65;
LABEL_16:
          double v44 = (char *)v39 + 4 * v37;
          BOOL v45 = v33 <= 6;
          goto LABEL_17;
        }
        uint64_t v41 = [v29 objectForKeyedSubscript:@"BBLteType"];
        int v42 = [v41 intValue];

        double v34 = [v29 objectForKeyedSubscript:@"BBLteValue"];
        int v35 = [v34 intValue];
        double v36 = [v29 objectForKeyedSubscript:@"BBLteType"];
        int v43 = [v36 intValue];
        v38 = &v74[4 * v43];
        double v44 = (char *)v67 + 4 * v43;
        BOOL v45 = v42 <= 6;
LABEL_17:
        if (v45) {
          v38 = v44;
        }
        *(_DWORD *)v38 += v35;
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (!v26)
      {
LABEL_23:
        v47 = v24;

        [v50 setRxTxDurations:v77 count:5];
        [v49 setRxTxDurations:v75 count:5];
        [v48 setRxTxDurations:v72 count:5];
        [v23 setRxTxDurations:v69 count:5];
        [v50 setSleepStateDurations:v67 count:6];
        [v49 setSleepStateDurations:v65 count:6];
        [v48 setSleepStateDurations:v64 count:6];
        [v23 setSleepStateDurations:v63 count:6];
        [v51 addObject:v50];
        [v51 addObject:v49];
        [v51 addObject:v48];
        [v51 addObject:v23];
        [v52 addMetrics:v50];
        [v52 addMetrics:v49];
        [v52 addMetrics:v48];
        [v52 addMetrics:v23];
        uint64_t v8 = v56;
        [v56 setMetric:v52];
        id v6 = v57;
        [v57 submitMetric:v56];
        [(PLAWDBB *)v55 resetBBVoLTETable];

        break;
      }
    }
  }
}

- (void)resetBBVoLTETable
{
  int v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"Volte"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)handleTelephonyActiveCallback:(id)a3
{
  id v21 = [a3 objectForKey:@"entry"];
  id v4 = [NSString alloc];
  id v5 = [v21 objectForKeyedSubscript:@"callStatus"];
  id v6 = (void *)[v4 initWithFormat:@"%@", v5];

  id v7 = [NSString alloc];
  uint64_t v8 = [v21 objectForKeyedSubscript:@"campedRat"];
  double v9 = (void *)[v7 initWithFormat:@"%@", v8];

  if (![v9 isEqualToString:@"LTE"])
  {
    [(PLAWDBB *)self setTelActivityState:0];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"Active"])
  {
    if ([(PLAWDBB *)self telActivityState] == 1) {
      goto LABEL_11;
    }
    [(PLAWDBB *)self setTelActivityState:1];
    uint64_t v10 = [MEMORY[0x263EFF910] monotonicDate];
    [(PLAWDBB *)self setStartLTECall:v10];

    double v11 = objc_opt_new();
    [(PLAWDBB *)self setPoint:v11];

    double v12 = [(PLAWDBB *)self startLTECall];
    double v13 = [(PLAWDBB *)self point];
    [v13 setStartDate:v12];

    double v14 = [(PLAWDBB *)self point];
    [v14 setEndDate:0];

    uint64_t v15 = [(PLAWDBB *)self lteCallArray];
    double v16 = [(PLAWDBB *)self point];
    [v15 addObject:v16];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"Inactive"]
    && ([(PLAWDBB *)self telActivityState] == 1
     || [(PLAWDBB *)self telActivityState] == 2))
  {
    [(PLAWDBB *)self setTelActivityState:3];
    uint64_t v17 = [MEMORY[0x263EFF910] monotonicDate];
    [(PLAWDBB *)self setEndLTECall:v17];

    uint64_t v15 = [(PLAWDBB *)self endLTECall];
    double v16 = [(PLAWDBB *)self lteCallArray];
    uint64_t v18 = [(PLAWDBB *)self lteCallArray];
    uint64_t v19 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
    [v19 setEndDate:v15];

LABEL_10:
    uint64_t v20 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
    [v20 requestEntry];
  }
LABEL_11:
}

- (void)handleRfLTEOffline
{
  obuint64_t j = [(PLAWDBB *)self lock];
  objc_sync_enter(obj);
  uint64_t v3 = *MEMORY[0x263F5F898];
  uint64_t v4 = *MEMORY[0x263F5F988];
  while (1)
  {
    id v5 = [(PLAWDBB *)self unhandledRFLTEEntries];
    uint64_t v6 = [v5 count];

    if (!v6) {
      break;
    }
    id v7 = [MEMORY[0x263F5F8C8] entryKeyForType:v3 andName:v4];
    uint64_t v8 = [(PLAWDAuxMetrics *)self operator];
    double v9 = [v8 storage];
    uint64_t v10 = [(PLAWDBB *)self unhandledRFLTEEntries];
    double v11 = [v10 objectAtIndexedSubscript:0];
    double v12 = objc_msgSend(v9, "entryForKey:withID:", v7, (int)objc_msgSend(v11, "intValue"));

    double v13 = [(PLAWDBB *)self lteCallArray];
    double v14 = [(PLAWDBB *)self lteCallArray];
    uint64_t v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
    [(PLAWDBB *)self bbLTEWriteAggregatedTableWithRFLTEEntry:v12 withPoint:v15];

    double v16 = [(PLAWDBB *)self unhandledRFLTEEntries];
    [v16 removeObjectAtIndex:0];
  }
  objc_sync_exit(obj);
}

- (void)handleRfLTE:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [v30 objectForKey:@"entry"];
  while (1)
  {
    id v5 = [(PLAWDBB *)self lteCallArray];
    uint64_t v6 = [v5 count];

    if (!v6) {
      break;
    }
    id v7 = [(PLAWDBB *)self lteCallArray];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];

    double v9 = [v4 entryDate];
    uint64_t v10 = [v8 startDate];
    double v11 = [v10 dateByAddingTimeInterval:10.0];
    uint64_t v12 = [v9 compare:v11];

    if (v12 == -1) {
      goto LABEL_14;
    }
    double v13 = [v8 endDate];

    if (!v13)
    {
      uint64_t v19 = [(PLAWDBB *)self currThreshold];
      uint64_t v20 = [v19 startDate];
      id v21 = [v20 dateByAddingTimeInterval:30.0];
      uint64_t v22 = [v4 entryDate];
      uint64_t v23 = [v21 compare:v22];

      if (v23 == -1)
      {
        id v24 = [(PLAWDBB *)self currThreshold];
        [(PLAWDBB *)self bbLTEWriteAggregatedTableWithRFLTEEntry:v4 withPoint:v24];
      }
      else
      {
        id v24 = [(PLAWDBB *)self lock];
        objc_sync_enter(v24);
        uint64_t v25 = [(PLAWDBB *)self unhandledRFLTEEntries];
        uint64_t v26 = [v25 count];

        if (!v26)
        {
          uint64_t v27 = [(PLAWDBB *)self bbLqmCumulativeNetworkCallback];
          [v27 requestEntry];
        }
        int v28 = [(PLAWDBB *)self unhandledRFLTEEntries];
        double v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "entryID"));
        [v28 addObject:v29];

        objc_sync_exit(v24);
      }

      goto LABEL_14;
    }
    double v14 = [v4 entryDate];
    uint64_t v15 = [v8 endDate];
    double v16 = [v15 dateByAddingTimeInterval:10.0];
    uint64_t v17 = [v14 compare:v16];

    if (v17 != 1)
    {
      [(PLAWDBB *)self bbLTEWriteAggregatedTableWithRFLTEEntry:v4 withPoint:v8];
LABEL_14:

      break;
    }
    uint64_t v18 = [(PLAWDBB *)self lteCallArray];
    [v18 removeObjectAtIndex:0];
  }
}

- (void)bbLTEWriteAggregatedTableWithRFLTEEntry:(id)a3 withPoint:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"Volte"];
  uint64_t v8 = 0;
  do
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v7];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "threshold"));
    [v9 setObject:v10 forKeyedSubscript:@"BBLteThreshold"];

    double v11 = [NSNumber numberWithInt:v8];
    [v9 setObject:v11 forKeyedSubscript:@"BBLteType"];

    switch((int)v8)
    {
      case 0:
        uint64_t v12 = v27;
        double v13 = @"SleepStateArr";
        goto LABEL_10;
      case 1:
        double v14 = v27;
        uint64_t v15 = @"SleepStateArr";
        goto LABEL_12;
      case 2:
        double v16 = v27;
        uint64_t v17 = @"SleepStateArr";
        goto LABEL_14;
      case 3:
        uint64_t v18 = v27;
        uint64_t v19 = @"SleepStateArr";
        goto LABEL_16;
      case 4:
        uint64_t v20 = v27;
        id v21 = @"SleepStateArr";
        goto LABEL_18;
      case 5:
        uint64_t v22 = [v27 objectForKeyedSubscript:@"SleepStateArr"];
        uint64_t v23 = v22;
        uint64_t v24 = 5;
        goto LABEL_19;
      case 7:
        uint64_t v12 = v27;
        double v13 = @"kRfActRxTxArr";
LABEL_10:
        uint64_t v22 = [v12 objectForKeyedSubscript:v13];
        uint64_t v23 = v22;
        uint64_t v24 = 0;
        goto LABEL_19;
      case 8:
        double v14 = v27;
        uint64_t v15 = @"kRfActRxTxArr";
LABEL_12:
        uint64_t v22 = [v14 objectForKeyedSubscript:v15];
        uint64_t v23 = v22;
        uint64_t v24 = 1;
        goto LABEL_19;
      case 9:
        double v16 = v27;
        uint64_t v17 = @"kRfActRxTxArr";
LABEL_14:
        uint64_t v22 = [v16 objectForKeyedSubscript:v17];
        uint64_t v23 = v22;
        uint64_t v24 = 2;
        goto LABEL_19;
      case 10:
        uint64_t v18 = v27;
        uint64_t v19 = @"kRfActRxTxArr";
LABEL_16:
        uint64_t v22 = [v18 objectForKeyedSubscript:v19];
        uint64_t v23 = v22;
        uint64_t v24 = 3;
        goto LABEL_19;
      case 11:
        uint64_t v20 = v27;
        id v21 = @"kRfActRxTxArr";
LABEL_18:
        uint64_t v22 = [v20 objectForKeyedSubscript:v21];
        uint64_t v23 = v22;
        uint64_t v24 = 4;
LABEL_19:
        uint64_t v25 = [v22 objectAtIndexedSubscript:v24];
        [v9 setObject:v25 forKeyedSubscript:@"BBLteValue"];

        break;
      default:
        break;
    }
    uint64_t v26 = [(PLAWDAuxMetrics *)self operator];
    [v26 logEntry:v9];

    uint64_t v8 = (v8 + 1);
  }
  while (v8 != 12);
}

- (void)finalizePeriodWithUpBytes:(unsigned int)a3 withDownBytes:(unsigned int)a4
{
  id v7 = [(PLAWDBB *)self endLTECall];
  uint64_t v8 = [(PLAWDBB *)self startLTECall];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  unsigned int v11 = vcvtd_n_s64_f64((double)a3 / v10, 3uLL) + vcvtd_n_s64_f64((double)a4 / v10, 3uLL);
  if ((int)v11 > 199)
  {
    if (v11 > 0x3E7)
    {
      id v16 = [(PLAWDBB *)self lteCallArray];
      uint64_t v12 = [(PLAWDBB *)self lteCallArray];
      double v13 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      double v14 = v13;
      if (v11 >> 4 > 0x270) {
        uint64_t v15 = 11000;
      }
      else {
        uint64_t v15 = 10000;
      }
    }
    else
    {
      id v16 = [(PLAWDBB *)self lteCallArray];
      uint64_t v12 = [(PLAWDBB *)self lteCallArray];
      double v13 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      double v14 = v13;
      uint64_t v15 = 1000;
    }
  }
  else
  {
    id v16 = [(PLAWDBB *)self lteCallArray];
    uint64_t v12 = [(PLAWDBB *)self lteCallArray];
    double v13 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
    double v14 = v13;
    uint64_t v15 = 200;
  }
  [v13 setThreshold:v15];
}

- (void)startAppBB
{
  id v3 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLAWDBB *)self setStartTimeAppBB:v3];
}

- (void)submitAppBB:(id)a3 withAwdConn:(id)a4
{
  id v21 = a4;
  id v6 = objc_msgSend(v21, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v10 = [(PLAWDAuxMetrics *)self operator];
    int v11 = [v10 defaultBoolForKey:@"simulatedMode"];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263EFF910] distantPast];
      [(PLAWDBB *)self setStartTimeAppBB:v12];
    }
    double v13 = [v9 allKeys];
    double v14 = [v13 sortedArrayUsingSelector:sel_compare_];
    uint64_t v15 = [v14 reverseObjectEnumerator];
    id v16 = [v15 allObjects];

    for (unint64_t i = 0; i != 10; ++i)
    {
      if ([v16 count] <= i) {
        break;
      }
      uint64_t v18 = [v16 objectAtIndexedSubscript:i];
      uint64_t v19 = [v9 objectForKey:v18];
      [v8 addObject:v19];
    }
    [v7 setAppPowers:v8];
    [v6 setMetric:v7];
    [v21 submitMetric:v6];
    uint64_t v20 = [MEMORY[0x263EFF910] monotonicDate];
    [(PLAWDBB *)self setStartTimeAppBB:v20];
  }
}

+ (id)entryAggregateDefinitionAwdConnectedPower
{
  void v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E5466A0;
  v22[1] = MEMORY[0x263EFFA80];
  id v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"RailIndex";
  uint64_t v4 = [MEMORY[0x263F5F650] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"RailValue";
  v20[0] = v5;
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  void v23[2] = *MEMORY[0x263F5F828];
  uint64_t v17 = &unk_26E5466B0;
  uint64_t v15 = *MEMORY[0x263F5F820];
  id v16 = &unk_26E5466B0;
  id v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v9;
  double v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  double v14 = @"RailValue";
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startConnectedPower
{
  [(PLAWDBB *)self resetConnectedPowerTable];
  id v3 = objc_alloc(MEMORY[0x263F5F658]);
  uint64_t v4 = [(PLAWDAuxMetrics *)self operator];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__PLAWDBB_startConnectedPower__block_invoke;
  v6[3] = &unk_264B99DD0;
  v6[4] = self;
  id v5 = (void *)[v3 initWithOperator:v4 forEntryKey:@"PLRail_EventNone_Rail" withBlock:v6];

  [(PLAWDBB *)self setConnectedPowerRailCallback:v5];
}

uint64_t __30__PLAWDBB_startConnectedPower__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBBConnectedPowerRail:a2];
  }
  return result;
}

- (void)stopConnectedPower
{
}

- (BOOL)submitConnectedPower:(id)a3 withAwdConn:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    id v9 = [MEMORY[0x263EFF910] monotonicDate];
    [v8 timeIntervalSince1970];
    double v11 = v10;
    [v9 timeIntervalSince1970];
    double v13 = v12 - v11;

    double v14 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"BBConnectedPower"];
    uint64_t v15 = [(PLAWDAuxMetrics *)self operator];
    id v16 = [v15 storage];
    uint64_t v17 = objc_msgSend(v16, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v14, 86400.0, v11, v13);

    uint64_t v18 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v17];
    double v52 = objc_opt_new();
    if ([MEMORY[0x263F5F668] isBasebandClass:1003003])
    {
      v47 = v17;
      double v48 = v14;
      double v49 = self;
      double v50 = v7;
      id v51 = v6;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      double v46 = v18;
      obuint64_t j = v18;
      uint64_t v19 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v60;
        double v22 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v60 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            id v25 = [NSString alloc];
            uint64_t v26 = [v24 objectForKeyedSubscript:@"RailIndex"];
            id v27 = (void *)[v25 initWithFormat:@"%@", v26];
            int v28 = [v27 intValue];

            if ((v28 & 0xFFFD) == 1 || v28 << 16 == 0x40000 || v28 << 16 == 0x20000)
            {
              double v29 = [v24 objectForKeyedSubscript:@"RailValue"];
              [v29 doubleValue];
              double v22 = v22 + v30;
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
        }
        while (v20);
        goto LABEL_29;
      }
    }
    else
    {
      if (([MEMORY[0x263F5F668] isBasebandClass:1003002] & 1) == 0)
      {
        double v22 = 0.0;
        if (![MEMORY[0x263F5F668] isBasebandClass:1003001]) {
          goto LABEL_30;
        }
      }
      v47 = v17;
      double v48 = v14;
      double v49 = self;
      double v50 = v7;
      id v51 = v6;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      double v46 = v18;
      id obja = v18;
      uint64_t v32 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v56;
        double v22 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v56 != v34) {
              objc_enumerationMutation(obja);
            }
            double v36 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            id v37 = [NSString alloc];
            v38 = [v36 objectForKeyedSubscript:@"RailIndex"];
            v39 = (void *)[v37 initWithFormat:@"%@", v38];
            __int16 v40 = [v39 intValue];

            if ((v40 & 0xFFFC) == 4)
            {
              uint64_t v41 = [v36 objectForKeyedSubscript:@"RailValue"];
              [v41 doubleValue];
              double v22 = v22 + v42;
            }
          }
          uint64_t v33 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v33);
        goto LABEL_29;
      }
    }
    double v22 = 0.0;
LABEL_29:
    uint64_t v18 = v46;

    id v7 = v50;
    id v6 = v51;
    double v14 = v48;
    self = v49;
    uint64_t v17 = v47;
LABEL_30:
    int v43 = objc_opt_new();
    [v43 setRAT:0];
    [v43 setPowerConnSetupMicroWatt:0];
    [v43 setPowerConnectedMicroWatt:v22];
    double v44 = objc_opt_new();
    [v44 addObject:v43];
    objc_msgSend(v52, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
    [v52 setRATPowers:v44];
    [v7 setMetric:v52];
    [(PLAWDBB *)self resetConnectedPowerTable];
    char v31 = [v6 submitMetric:v7];

    goto LABEL_31;
  }
  [(PLAWDBB *)self resetConnectedPowerTable];
  char v31 = 0;
LABEL_31:

  return v31;
}

- (void)resetConnectedPowerTable
{
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"BBConnectedPower"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)startBBPower
{
  id v3 = objc_alloc(MEMORY[0x263F5F658]);
  objc_super v4 = [(PLAWDAuxMetrics *)self operator];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __23__PLAWDBB_startBBPower__block_invoke;
  v6[3] = &unk_264B99DD0;
  v6[4] = self;
  id v5 = (void *)[v3 initWithOperator:v4 forEntryKey:@"PLRail_EventNone_Rail" withBlock:v6];

  [(PLAWDBB *)self setBbProtocolRailCallback:v5];
}

uint64_t __23__PLAWDBB_startBBPower__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBBRailCallbackWrapper:a2];
  }
  return result;
}

- (void)stopBBPower
{
  [(PLAWDBB *)self setBbProtocolRailCallback:0];
  [(PLAWDBB *)self setAccountingGroupEventCallback:0];

  [(PLAWDBB *)self setIceStatsEventCallback:0];
}

- (void)handleBBRailCallbackBBProtocol:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PLAWDBB_handleBBRailCallbackBBProtocol___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBProtocol__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackBBProtocol__defaultOnce, block);
    }
    if (handleBBRailCallbackBBProtocol__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackBBProtocol:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackBBProtocol:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1281];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __42__PLAWDBB_handleBBRailCallbackBBProtocol___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackBBProtocol__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackLTESleep:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__PLAWDBB_handleBBRailCallbackLTESleep___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackLTESleep__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackLTESleep__defaultOnce, block);
    }
    if (handleBBRailCallbackLTESleep__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackLTESleep:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackLTESleep:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1287];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __40__PLAWDBB_handleBBRailCallbackLTESleep___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackLTESleep__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxLte:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackTxLte___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxLte__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxLte__defaultOnce, block);
    }
    if (handleBBRailCallbackTxLte__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxLte:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxLte:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1293];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __37__PLAWDBB_handleBBRailCallbackTxLte___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxLte__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxCdma:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBB_handleBBRailCallbackTxCdma___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxCdma__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxCdma__defaultOnce, block);
    }
    if (handleBBRailCallbackTxCdma__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxCdma:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxCdma:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1299];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __38__PLAWDBB_handleBBRailCallbackTxCdma___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxCdma__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxEvdo:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBB_handleBBRailCallbackTxEvdo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxEvdo__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxEvdo__defaultOnce, block);
    }
    if (handleBBRailCallbackTxEvdo__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxEvdo:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxEvdo:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1305];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __38__PLAWDBB_handleBBRailCallbackTxEvdo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxEvdo__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxCdma2K:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__PLAWDBB_handleBBRailCallbackTxCdma2K___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxCdma2K__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxCdma2K__defaultOnce, block);
    }
    if (handleBBRailCallbackTxCdma2K__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxCdma2K:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxCdma2K:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1311];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __40__PLAWDBB_handleBBRailCallbackTxCdma2K___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxCdma2K__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxGsm:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackTxGsm___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxGsm__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxGsm__defaultOnce, block);
    }
    if (handleBBRailCallbackTxGsm__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxGsm:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxGsm:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1317];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __37__PLAWDBB_handleBBRailCallbackTxGsm___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxGsm__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxUtran:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PLAWDBB_handleBBRailCallbackTxUtran___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxUtran__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackTxUtran__defaultOnce, block);
    }
    if (handleBBRailCallbackTxUtran__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackTxUtran:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackTxUtran:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1323];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __39__PLAWDBB_handleBBRailCallbackTxUtran___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackTxUtran__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackBBICE:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackBBICE___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBICE__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackBBICE__defaultOnce, block);
    }
    if (handleBBRailCallbackBBICE__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackBBICE:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackBBICE:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1329];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __37__PLAWDBB_handleBBRailCallbackBBICE___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackBBICE__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackBBTx:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__PLAWDBB_handleBBRailCallbackBBTx___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBTx__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackBBTx__defaultOnce, block);
    }
    if (handleBBRailCallbackBBTx__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackBBTx:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackBBTx:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1335];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __36__PLAWDBB_handleBBRailCallbackBBTx___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackBBTx__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackOos:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PLAWDBB_handleBBRailCallbackOos___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackOos__defaultOnce != -1) {
      dispatch_once(&handleBBRailCallbackOos__defaultOnce, block);
    }
    if (handleBBRailCallbackOos__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleBBRailCallbackOos:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleBBRailCallbackOos:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1341];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __35__PLAWDBB_handleBBRailCallbackOos___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBBRailCallbackOos__classDebugEnabled = result;
  return result;
}

- (void)handleAcountGroupCallback:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleAcountGroupCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleAcountGroupCallback__defaultOnce != -1) {
      dispatch_once(&handleAcountGroupCallback__defaultOnce, block);
    }
    if (handleAcountGroupCallback__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleAcountGroupCallback:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleAcountGroupCallback:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1347];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __37__PLAWDBB_handleAcountGroupCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAcountGroupCallback__classDebugEnabled = result;
  return result;
}

- (void)handleIceStatsCallback:(id)a3
{
  id v3 = [a3 objectForKey:@"entry"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__PLAWDBB_handleIceStatsCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleIceStatsCallback__defaultOnce != -1) {
      dispatch_once(&handleIceStatsCallback__defaultOnce, block);
    }
    if (handleIceStatsCallback__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDBB handleIceStatsCallback:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAWDBB handleIceStatsCallback:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1353];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __34__PLAWDBB_handleIceStatsCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIceStatsCallback__classDebugEnabled = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)bbProtocolRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBbProtocolRailCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBbEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)accountingGroupEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountingGroupEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)iceStatsEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIceStatsEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)connectedPowerRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnectedPowerRailCallback:(id)a3
{
}

- (NSDate)startTimeAppBB
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStartTimeAppBB:(id)a3
{
}

- (NSDate)startTimeBBLqm
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartTimeBBLqm:(id)a3
{
}

- (unsigned)upBytes
{
  return self->_upBytes;
}

- (void)setUpBytes:(unsigned int)a3
{
  self->_upBytes = a3;
}

- (unsigned)downBytes
{
  return self->_downBytes;
}

- (void)setDownBytes:(unsigned int)a3
{
  self->_downBytes = a3;
}

- (unsigned)upBytesLTE
{
  return self->_upBytesLTE;
}

- (void)setUpBytesLTE:(unsigned int)a3
{
  self->_upBytesLTE = a3;
}

- (unsigned)downBytesLTE
{
  return self->_downBytesLTE;
}

- (void)setDownBytesLTE:(unsigned int)a3
{
  self->_downBytesLTE = a3;
}

- (NSDate)startLTECall
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStartLTECall:(id)a3
{
}

- (NSDate)endLTECall
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEndLTECall:(id)a3
{
}

- (NSMutableArray)lteCallArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLteCallArray:(id)a3
{
}

- (NSMutableArray)unhandledRFLTEEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUnhandledRFLTEEntries:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbLqmCellularActiveCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBbLqmCellularActiveCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbLqmCumulativeNetworkCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBbLqmCumulativeNetworkCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbTelephonyActivityCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBbTelephonyActivityCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbRfLTECallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBbRfLTECallback:(id)a3
{
}

- (int)currQuality
{
  return self->_currQuality;
}

- (void)setCurrQuality:(int)a3
{
  self->_currQuality = a3;
}

- (int)newQuality
{
  return self->_newQuality;
}

- (void)setNewQuality:(int)a3
{
  self->_newQuality = a3;
}

- (signed)telActivityState
{
  return self->_telActivityState;
}

- (void)setTelActivityState:(signed __int16)a3
{
  self->_telActivityState = a3;
}

- (LTEPoint)point
{
  return (LTEPoint *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPoint:(id)a3
{
}

- (LTEPoint)currThreshold
{
  return (LTEPoint *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrThreshold:(id)a3
{
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_currThreshold, 0);
  objc_storeStrong((id *)&self->_point, 0);
  objc_storeStrong((id *)&self->_bbRfLTECallback, 0);
  objc_storeStrong((id *)&self->_bbTelephonyActivityCallback, 0);
  objc_storeStrong((id *)&self->_bbLqmCumulativeNetworkCallback, 0);
  objc_storeStrong((id *)&self->_bbLqmCellularActiveCallback, 0);
  objc_storeStrong((id *)&self->_unhandledRFLTEEntries, 0);
  objc_storeStrong((id *)&self->_lteCallArray, 0);
  objc_storeStrong((id *)&self->_endLTECall, 0);
  objc_storeStrong((id *)&self->_startLTECall, 0);
  objc_storeStrong((id *)&self->_startTimeBBLqm, 0);
  objc_storeStrong((id *)&self->_startTimeAppBB, 0);
  objc_storeStrong((id *)&self->_connectedPowerRailCallback, 0);
  objc_storeStrong((id *)&self->_iceStatsEventCallback, 0);
  objc_storeStrong((id *)&self->_accountingGroupEventCallback, 0);
  objc_storeStrong((id *)&self->_bbEventCallback, 0);

  objc_storeStrong((id *)&self->_bbProtocolRailCallback, 0);
}

@end