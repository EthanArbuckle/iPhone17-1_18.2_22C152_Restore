@interface PLICEBBHardwareMessage
+ (id)entryEventBackwardDefinitionBBIceEventMetrics;
+ (id)entryEventBackwardDefinitionBBIcePeriodicMetrics;
- (NSData)data;
- (NSDate)bbMonotonic;
- (NSMutableArray)metricDataArr;
- (NSMutableArray)metricIdArr;
- (NSNumber)bbtimestamp;
- (NSNumber)metricId;
- (NSNumber)triggerCnt;
- (NSNumber)triggerId;
- (NSString)metricData;
- (PBCodable)pbc;
- (PLAgent)logAgent;
- (PLICEBBHardwareMessage)init;
- (id)decodeEventPayload:(id)a3 forMetricId:(id)a4;
- (id)decodePayload:(id)a3 forMetricId:(id)a4;
- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7;
- (void)addToListMetric:(id)a3 payload:(id)a4;
- (void)componentCarrierForClass:(id)a3 forEntry:(id)a4;
- (void)cpcStatsForClass:(id)a3 forEntry:(id)a4;
- (void)duplexModeForClass:(id)a3 forEntry:(id)a4;
- (void)logBBIceAperiodicMetrics;
- (void)logBBIcePeriodicMetrics;
- (void)pdcchStateStatsFor:(id)a3 forEntry:(id)a4;
- (void)protocolHist2ForClass:(id)a3 forEntry:(id)a4;
- (void)protocolHistForClass:(id)a3 forEntry:(id)a4;
- (void)protocolPerStateForClass:(id)a3 forEntry:(id)a4;
- (void)rrcModeHistForClass:(id)a3 forEntry:(id)a4;
- (void)setBbMonotonic:(id)a3;
- (void)setBbtimestamp:(id)a3;
- (void)setData:(id)a3;
- (void)setLogAgent:(id)a3;
- (void)setMetricData:(id)a3;
- (void)setMetricDataArr:(id)a3;
- (void)setMetricId:(id)a3;
- (void)setMetricIdArr:(id)a3;
- (void)setPbc:(id)a3;
- (void)setTriggerCnt:(id)a3;
- (void)setTriggerId:(id)a3;
@end

@implementation PLICEBBHardwareMessage

- (PLICEBBHardwareMessage)init
{
  if ([MEMORY[0x1E4F929C0] debugEnabled]) {
    __assert_rtn("-[PLICEBBHardwareMessage init]", "PLICEBBHardwareMessage.m", 88, "0");
  }

  return 0;
}

- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7
{
  id v13 = a3;
  id v28 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PLICEBBHardwareMessage;
  v17 = [(PLICEBBHardwareMessage *)&v29 init];
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)(objc_msgSend(v13, "integerValue") / 1000));
    uint64_t v19 = [v18 convertFromBasebandToMonotonic];
    bbMonotonic = v17->_bbMonotonic;
    v17->_bbMonotonic = (NSDate *)v19;

    objc_storeStrong((id *)&v17->_triggerId, a4);
    objc_storeStrong((id *)&v17->_bbtimestamp, a3);
    objc_storeStrong((id *)&v17->_triggerCnt, a5);
    uint64_t v21 = +[PLICEBBMetricUtility convertToStringData:v15];
    metricData = v17->_metricData;
    v17->_metricData = (NSString *)v21;

    uint64_t v23 = objc_opt_new();
    metricIdArr = v17->_metricIdArr;
    v17->_metricIdArr = (NSMutableArray *)v23;

    uint64_t v25 = objc_opt_new();
    metricDataArr = v17->_metricDataArr;
    v17->_metricDataArr = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v17->_logAgent, a7);
  }

  return v17;
}

+ (id)entryEventBackwardDefinitionBBIcePeriodicMetrics
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CC0];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F1140;
  v26[1] = MEMORY[0x1E4F1CC38];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"triggerId";
  id v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v24[0] = v15;
  v23[1] = @"triggerCnt";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v24[1] = v3;
  v23[2] = @"bbtimestamp";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v24[2] = v5;
  v23[3] = @"mid";
  uint64_t v7 = *MEMORY[0x1E4F92D00];
  v20[0] = *MEMORY[0x1E4F92D10];
  uint64_t v6 = v20[0];
  v20[1] = v7;
  v22[0] = &unk_1F29E77C8;
  v22[1] = &unk_1F29E77E0;
  uint64_t v21 = *MEMORY[0x1E4F92D08];
  uint64_t v8 = v21;
  v22[2] = &unk_1F29E77F8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v20 count:3];
  v24[3] = v9;
  v23[4] = @"data";
  v18[0] = v6;
  v18[1] = v7;
  v19[0] = &unk_1F29E77C8;
  v19[1] = &unk_1F29E77E0;
  v18[2] = v8;
  v19[2] = &unk_1F29E7810;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v24[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionBBIceEventMetrics
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CC0];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F1150;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"triggerCnt";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"bbtimestamp";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  v15[2] = @"metricId";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v15[3] = @"metricData";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

- (void)logBBIceAperiodicMetrics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]";
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __50__PLICEBBHardwareMessage_logBBIceAperiodicMetrics__block_invoke;
    id v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v4;
    if (qword_1EBD5C530 != -1) {
      dispatch_once(&qword_1EBD5C530, &block);
    }
    if (_MergedGlobals_108)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]", block, v14, v15, v16, v17);
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:193];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBIceEventMetrics"];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  if (v12)
  {
    if (([MEMORY[0x1E4F92A38] isBasebandClass:1003009] & 1) == 0) {
      [v12 setEntryDate:self->_bbMonotonic];
    }
    [v12 setObject:self->_bbtimestamp forKeyedSubscript:@"bbtimestamp"];
    [v12 setObject:self->_triggerCnt forKeyedSubscript:@"triggerCnt"];
    [v12 setObject:self->_triggerId forKeyedSubscript:@"metricId"];
    [v12 setObject:self->_metricData forKeyedSubscript:@"metricData"];
    [(PLAgent *)self->_logAgent logEntry:v12];
  }
}

uint64_t __50__PLICEBBHardwareMessage_logBBIceAperiodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_108 = result;
  return result;
}

- (void)logBBIcePeriodicMetrics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __49__PLICEBBHardwareMessage_logBBIcePeriodicMetrics__block_invoke;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5C538 != -1) {
      dispatch_once(&qword_1EBD5C538, &block);
    }
    if (byte_1EBD5C521)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLICEBBHardwareMessage logBBIcePeriodicMetrics]", block, v13, v14, v15, v16);
      v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage logBBIcePeriodicMetrics]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:214];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBIcePeriodicMetrics"];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  if (v11)
  {
    if (([MEMORY[0x1E4F92A38] isBasebandClass:1003009] & 1) == 0) {
      [v11 setEntryDate:self->_bbMonotonic];
    }
    [v11 setObject:self->_triggerId forKeyedSubscript:@"triggerId"];
    [v11 setObject:self->_bbtimestamp forKeyedSubscript:@"bbtimestamp"];
    [v11 setObject:self->_triggerCnt forKeyedSubscript:@"triggerCnt"];
    [v11 setObject:self->_metricIdArr forKeyedSubscript:@"mid"];
    [v11 setObject:self->_metricDataArr forKeyedSubscript:@"data"];
    [(PLAgent *)self->_logAgent logEntry:v11];
  }
}

uint64_t __49__PLICEBBHardwareMessage_logBBIcePeriodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C521 = result;
  return result;
}

- (void)addToListMetric:(id)a3 payload:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F929C0];
  id v8 = a4;
  if ([v7 debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __50__PLICEBBHardwareMessage_addToListMetric_payload___block_invoke;
    uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v9;
    if (qword_1EBD5C540 != -1) {
      dispatch_once(&qword_1EBD5C540, &block);
    }
    if (byte_1EBD5C522)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLICEBBHardwareMessage addToListMetric:payload:]", block, v19, v20, v21, v22);
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage addToListMetric:payload:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:236];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableArray *)self->_metricIdArr addObject:v6];
  metricDataArr = self->_metricDataArr;
  uint64_t v17 = +[PLICEBBMetricUtility convertToStringData:v8];

  [(NSMutableArray *)metricDataArr addObject:v17];
}

uint64_t __50__PLICEBBHardwareMessage_addToListMetric_payload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C522 = result;
  return result;
}

- (id)decodeEventPayload:(id)a3 forMetricId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:@"metricId"];
  uint64_t v8 = [v6 integerValue];
  id v9 = 0;
  if (v8 <= 3985681)
  {
    if (v8 <= 3952151)
    {
      if (v8 == 3945603) {
        goto LABEL_19;
      }
      if (v8 != 3952132)
      {
        if (v8 != 3952138) {
          goto LABEL_39;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled]) {
          __assert_rtn("-[PLICEBBHardwareMessage decodeEventPayload:forMetricId:]", "PLICEBBHardwareMessage.m", 261, "0");
        }
        goto LABEL_38;
      }
      v10 = KCellularLteRrcState;
    }
    else
    {
      if (v8 <= 3973390)
      {
        if (v8 == 3952152)
        {
          v10 = KCellularLteCdrxConfig;
          goto LABEL_35;
        }
        if (v8 != 3952165) {
          goto LABEL_39;
        }
LABEL_19:
        v10 = KCellularLteRadioLinkFailure;
        goto LABEL_35;
      }
      if (v8 == 3973391)
      {
        v11 = [[KCellularServingCellLost alloc] initWithData:v5];
        if (![(KCellularServingCellLost *)v11 hasTimestamp]) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      if (v8 != 3985416) {
        goto LABEL_39;
      }
      v10 = KCellularGsmL1State;
    }
LABEL_35:
    v11 = (KCellularServingCellLost *)[[v10 alloc] initWithData:v5];
    if (![(KCellularServingCellLost *)v11 hasTimestamp])
    {
LABEL_37:
      [v7 setObject:@"event" forKeyedSubscript:@"type"];

LABEL_38:
      id v9 = v7;
      goto LABEL_39;
    }
LABEL_36:
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[KCellularServingCellLost timestamp](v11, "timestamp"));
    [v7 setObject:v12 forKeyedSubscript:@"bbtimestamp"];

    goto LABEL_37;
  }
  if (v8 > 3985947)
  {
    if (v8 > 3986693)
    {
      if (v8 == 3986694)
      {
        v10 = KCellularCellPlmnSearchCount;
      }
      else
      {
        if (v8 != 3986696) {
          goto LABEL_39;
        }
        v10 = KCellularProtocolStackPowerState;
      }
    }
    else if (v8 == 3985948)
    {
      v10 = KCellularTdsL1State;
    }
    else
    {
      if (v8 != 3986196) {
        goto LABEL_39;
      }
      v10 = KCellularLteDataInactivityBeforeIdle;
    }
    goto LABEL_35;
  }
  switch(v8)
  {
    case 3985682:
      v10 = KCellularWcdmaRrcConnectionState;
      goto LABEL_35;
    case 3985683:
      v10 = KCellularWcdmaRrcConfiguration;
      goto LABEL_35;
    case 3985684:
      v10 = KCellularWcdmaRabStatus;
      goto LABEL_35;
    case 3985685:
      v10 = KCellularWcdmaL1State;
      goto LABEL_35;
    case 3985686:
      goto LABEL_19;
    default:
      break;
  }
LABEL_39:

  return v9;
}

- (id)decodePayload:(id)a3 forMetricId:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v8 setObject:v7 forKeyedSubscript:@"metricId"];
  id v9 = [[PowerlogMetricLog alloc] initWithData:v6];
  if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v9, "kCellularPerClientProfileTriggerCountsCount") >= 2)[MEMORY[0x1E4F929C0] debugEnabled]; {
  uint64_t v10 = [v7 integerValue];
  }
  if (v10 <= 3986178)
  {
    if (v10 > 3985669)
    {
      switch(v10)
      {
        case 3985670:
          v12 = [(PowerlogMetricLog *)v9 kCellularWcdmaCpcStatAtIndex:0];
          [(PLICEBBHardwareMessage *)self cpcStatsForClass:v12 forEntry:v8];
          goto LABEL_139;
        case 3985671:
          uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularWcdmaRxDiversityHistAtIndex:0];
          goto LABEL_131;
        case 3985672:
          uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularWcdmaServingCellRx0RssiHistAtIndex:0];
          goto LABEL_131;
        case 3985673:
          uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularWcdmaServingCellRx1RssiHistAtIndex:0];
          goto LABEL_131;
        case 3985674:
          uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularWcdmaServingCellRx0EcNoHistAtIndex:0];
          goto LABEL_131;
        case 3985675:
          uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularWcdmaServingCellRx1EcNoHistAtIndex:0];
          goto LABEL_131;
        case 3985676:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaTxPowerHistAtIndex:0];
          goto LABEL_138;
        case 3985677:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaReceiverStatusOnC0HistAtIndex:0];
          goto LABEL_138;
        case 3985678:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaReceiverStatusOnC1HistAtIndex:0];
          goto LABEL_138;
        case 3985679:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaCarrierStatusHistAtIndex:0];
          goto LABEL_138;
        case 3985680:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaRabModeHistAtIndex:0];
          goto LABEL_138;
        case 3985681:
          uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularWcdmaRabTypeHistAtIndex:0];
          goto LABEL_138;
        default:
          switch(v10)
          {
            case 3985926:
              uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularTdsRxDiversityHistAtIndex:0];
              goto LABEL_131;
            case 3985927:
              uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularTdsServingCellRx0RssiHistAtIndex:0];
              goto LABEL_131;
            case 3985928:
              uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularTdsServingCellRx1RssiHistAtIndex:0];
              goto LABEL_131;
            case 3985929:
              uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularTdsServingCellRx0RscpHistAtIndex:0];
              goto LABEL_131;
            case 3985930:
              uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularTdsServingCellRx1RscpHistAtIndex:0];
              goto LABEL_131;
            case 3985931:
              uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularTdsTxPowerHistAtIndex:0];
              goto LABEL_138;
            case 3985941:
              uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularTdsRabModeHistAtIndex:0];
              goto LABEL_138;
            case 3985942:
              uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularTdsRabTypeHistAtIndex:0];
              goto LABEL_138;
            default:
              goto LABEL_75;
          }
      }
    }
    switch(v10)
    {
      case 3985412:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularGsmServingCellRssiHistAtIndex:0];
        goto LABEL_138;
      case 3985413:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularGsmServingCellSnrHistAtIndex:0];
        goto LABEL_138;
      case 3985414:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularGsmTxPowerHistAtIndex:0];
        goto LABEL_138;
      case 3985415:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularGsmConnectedModeHistAtIndex:0];
        goto LABEL_138;
      default:
        if (v10 == 3932163)
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled]) {
            __assert_rtn("-[PLICEBBHardwareMessage decodePayload:forMetricId:]", "PLICEBBHardwareMessage.m", 427, "0");
          }
          goto LABEL_140;
        }
        if (v10 != 3952496) {
          goto LABEL_75;
        }
        v12 = [(PowerlogMetricLog *)v9 kCellularLtePdcchStateStatsAtIndex:0];
        [(PLICEBBHardwareMessage *)self pdcchStateStatsFor:v12 forEntry:v8];
        break;
    }
    goto LABEL_139;
  }
  if (v10 <= 3986692)
  {
    switch(v10)
    {
      case 3986179:
        v12 = [(PowerlogMetricLog *)v9 kCellularLteFwDuplexModeAtIndex:0];
        [(PLICEBBHardwareMessage *)self duplexModeForClass:v12 forEntry:v8];
        goto LABEL_139;
      case 3986180:
        uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularLteServingCellRsrpHistAtIndex:0];
        goto LABEL_131;
      case 3986181:
        uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularLteServingCellSinrHistAtIndex:0];
        goto LABEL_131;
      case 3986182:
        uint64_t v34 = [(PowerlogMetricLog *)v9 kCellularLteSleepStateHistAtIndex:0];
LABEL_131:
        v12 = (void *)v34;
        [(PLICEBBHardwareMessage *)self rrcModeHistForClass:v34 forEntry:v8];
        goto LABEL_139;
      case 3986183:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteTxPowerHistAtIndex:0];
        goto LABEL_138;
      case 3986184:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteDlSccStateHistAtIndex:0];
        goto LABEL_138;
      case 3986185:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteUlSccStateHistAtIndex:0];
        goto LABEL_138;
      case 3986186:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteAdvancedRxStateHistAtIndex:0];
        goto LABEL_138;
      case 3986187:
        v12 = [(PowerlogMetricLog *)v9 kCellularLteComponentCarrierInfoAtIndex:0];
        [(PLICEBBHardwareMessage *)self componentCarrierForClass:v12 forEntry:v8];
        goto LABEL_139;
      case 3986188:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteRxTxStateHistAtIndex:0];
        goto LABEL_138;
      case 3986189:
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularLteTotalDlTbsHistAtIndex:0];
        goto LABEL_138;
      case 3986200:
        uint64_t v62 = [(PowerlogMetricLog *)v9 kCellularLteDlSccStateHistV3AtIndex:0];
        goto LABEL_95;
      case 3986201:
        uint64_t v62 = [(PowerlogMetricLog *)v9 kCellularLteRxDiversityHistAtIndex:0];
LABEL_95:
        v12 = (void *)v62;
        [(PLICEBBHardwareMessage *)self protocolPerStateForClass:v62 forEntry:v8];
        break;
      default:
        goto LABEL_75;
    }
    goto LABEL_139;
  }
  if (v10 > 3987205)
  {
    if (v10 > 3987332)
    {
      if (v10 == 3987333)
      {
        uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularCdmaEvdoTxPowerHistAtIndex:0];
        goto LABEL_138;
      }
      if (v10 != 3987334) {
        goto LABEL_75;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v35 = objc_opt_class();
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_103;
        v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v92[4] = v35;
        if (qword_1EBD5C560 != -1) {
          dispatch_once(&qword_1EBD5C560, v92);
        }
        if (byte_1EBD5C526)
        {
          v36 = [NSString stringWithFormat:@"ICE_HW_RF_EVDO_HIST - plMetricLog %@", v9];
          v37 = (void *)MEMORY[0x1E4F929B8];
          v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
          v39 = [v38 lastPathComponent];
          v40 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
          [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:700];

          v41 = PLLogCommon();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v36;
            _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v12 = [(PowerlogMetricLog *)v9 kCellularCdmaEvdoProtocolStackStateHistAtIndex:0];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v42 = objc_opt_class();
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_109;
        v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v91[4] = v42;
        if (qword_1EBD5C568 != -1) {
          dispatch_once(&qword_1EBD5C568, v91);
        }
        if (byte_1EBD5C527)
        {
          v84 = v12;
          v43 = [NSString stringWithFormat:@"ICE_HW_RF_EVDO_HIST - myClass %@", v12];
          v44 = (void *)MEMORY[0x1E4F929B8];
          v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
          v46 = [v45 lastPathComponent];
          v47 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
          [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:702];

          v48 = PLLogCommon();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v43;
            _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v12 = v84;
        }
      }
      [(PLICEBBHardwareMessage *)self protocolHist2ForClass:v12 forEntry:v8];
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_139;
      }
      uint64_t v49 = objc_opt_class();
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_115;
      v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v90[4] = v49;
      if (qword_1EBD5C570 != -1) {
        dispatch_once(&qword_1EBD5C570, v90);
      }
      if (!byte_1EBD5C528) {
        goto LABEL_139;
      }
      id v28 = [NSString stringWithFormat:@"ICE_HW_RF_EVDO_HIST - entry %@", v8];
      v50 = (void *)MEMORY[0x1E4F929B8];
      v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
      v52 = [v51 lastPathComponent];
      v53 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
      [v50 logMessage:v28 fromFile:v52 fromFunction:v53 fromLineNumber:704];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v28;
        goto LABEL_145;
      }
    }
    else
    {
      if (v10 == 3987206)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v63 = objc_opt_class();
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke;
          v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v95[4] = v63;
          if (qword_1EBD5C548 != -1) {
            dispatch_once(&qword_1EBD5C548, v95);
          }
          if (byte_1EBD5C523)
          {
            v64 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_HIST - plMetricLog %@", v9];
            v65 = (void *)MEMORY[0x1E4F929B8];
            v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
            v67 = [v66 lastPathComponent];
            v68 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
            [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:685];

            v69 = PLLogCommon();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v64;
              _os_log_debug_impl(&dword_1D2690000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v12 = [(PowerlogMetricLog *)v9 kCellularCdma1XProtocolStackStateHistAtIndex:0];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v70 = objc_opt_class();
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_91;
          v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v94[4] = v70;
          if (qword_1EBD5C550 != -1) {
            dispatch_once(&qword_1EBD5C550, v94);
          }
          if (byte_1EBD5C524)
          {
            v85 = v12;
            v71 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_HIST - myClass %@", v12];
            v72 = (void *)MEMORY[0x1E4F929B8];
            v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
            v74 = [v73 lastPathComponent];
            v75 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
            [v72 logMessage:v71 fromFile:v74 fromFunction:v75 fromLineNumber:687];

            v76 = PLLogCommon();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v71;
              _os_log_debug_impl(&dword_1D2690000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v85;
          }
        }
        [(PLICEBBHardwareMessage *)self protocolHist2ForClass:v12 forEntry:v8];
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_139;
        }
        uint64_t v77 = objc_opt_class();
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_97;
        v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v93[4] = v77;
        if (qword_1EBD5C558 != -1) {
          dispatch_once(&qword_1EBD5C558, v93);
        }
        if (!byte_1EBD5C525) {
          goto LABEL_139;
        }
        id v28 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_HIST - entry %@", v8];
        v78 = (void *)MEMORY[0x1E4F929B8];
        v79 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
        v80 = [v79 lastPathComponent];
        v81 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
        [v78 logMessage:v28 fromFile:v80 fromFunction:v81 fromLineNumber:689];

        v33 = PLLogCommon();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_116;
        }
        *(_DWORD *)buf = 138412290;
        v97 = v28;
        goto LABEL_145;
      }
      if (v10 != 3987207) {
        goto LABEL_75;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v13 = objc_opt_class();
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_121;
        v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v89[4] = v13;
        if (qword_1EBD5C578 != -1) {
          dispatch_once(&qword_1EBD5C578, v89);
        }
        if (byte_1EBD5C529)
        {
          uint64_t v14 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_CONN_HIST - plMetricLog %@", v9];
          id v15 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
          uint64_t v17 = [v16 lastPathComponent];
          v18 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
          [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:709];

          uint64_t v19 = PLLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v14;
            _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v12 = [(PowerlogMetricLog *)v9 kCellularCdma1XConnectionHistAtIndex:0];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_127;
        v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v88[4] = v20;
        if (qword_1EBD5C580 != -1) {
          dispatch_once(&qword_1EBD5C580, v88);
        }
        if (byte_1EBD5C52A)
        {
          v83 = v12;
          uint64_t v21 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_CONN_HIST - myClass %@", v12];
          uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
          v24 = [v23 lastPathComponent];
          uint64_t v25 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:711];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v12 = v83;
        }
      }
      [(PLICEBBHardwareMessage *)self protocolHistForClass:v12 forEntry:v8];
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_139;
      }
      uint64_t v27 = objc_opt_class();
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_133;
      v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v87[4] = v27;
      if (qword_1EBD5C588 != -1) {
        dispatch_once(&qword_1EBD5C588, v87);
      }
      if (!byte_1EBD5C52B) {
        goto LABEL_139;
      }
      id v28 = [NSString stringWithFormat:@"ICE_HW_RF_CDMA1X_CONN_HIST - entry %@", v8];
      objc_super v29 = (void *)MEMORY[0x1E4F929B8];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
      v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:713];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v28;
LABEL_145:
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
LABEL_116:

    goto LABEL_139;
  }
  if (v10 > 3986705)
  {
    if (v10 == 3986706)
    {
      v12 = [(PowerlogMetricLog *)v9 kCellularProtocolStackStateHist2AtIndex:0];
      [(PLICEBBHardwareMessage *)self protocolHist2ForClass:v12 forEntry:v8];
      goto LABEL_139;
    }
    if (v10 == 3987205)
    {
      uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularCdma1XTxPowerHistAtIndex:0];
      goto LABEL_138;
    }
LABEL_75:
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v54 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_139;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v54;
      if (qword_1EBD5C590 != -1) {
        dispatch_once(&qword_1EBD5C590, block);
      }
      if (byte_1EBD5C52C)
      {
        v55 = [NSString stringWithFormat:@"Error: unexpected metric Id"];
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLICEBBHardwareMessage decodePayload:forMetricId:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:730];

        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v55;
          _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v61 = 0;
    goto LABEL_141;
  }
  if (v10 == 3986693)
  {
    uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularProtocolStackStateHistAtIndex:0];
    goto LABEL_138;
  }
  if (v10 != 3986695) {
    goto LABEL_75;
  }
  uint64_t v11 = [(PowerlogMetricLog *)v9 kCellularCellPlmnSearchHistAtIndex:0];
LABEL_138:
  v12 = (void *)v11;
  [(PLICEBBHardwareMessage *)self protocolHistForClass:v11 forEntry:v8];
LABEL_139:

LABEL_140:
  id v61 = v8;
LABEL_141:

  return v61;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C523 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_91(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C524 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_97(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C525 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_103(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C526 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_109(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C527 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_115(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C528 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_121(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C529 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_127(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C52A = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_133(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C52B = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_139(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C52C = result;
  return result;
}

- (void)rrcModeHistForClass:(id)a3 forEntry:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  if ([v32 hasTimestamp])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v32, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v32 hasDurationMs])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "durationMs"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"duration"];
  }
  if ([v32 hasIdleDurBin0])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin0"));
    [v5 setObject:v8 forKeyedSubscript:@"idle_dur_bin_0"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_0"];
  }
  if ([v32 hasIdleDurBin1])
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin1"));
    [v5 setObject:v9 forKeyedSubscript:@"idle_dur_bin_1"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_1"];
  }
  if ([v32 hasIdleDurBin2])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin2"));
    [v5 setObject:v10 forKeyedSubscript:@"idle_dur_bin_2"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_2"];
  }
  if ([v32 hasIdleDurBin3])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin3"));
    [v5 setObject:v11 forKeyedSubscript:@"idle_dur_bin_3"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_3"];
  }
  if ([v32 hasIdleDurBin4])
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin4"));
    [v5 setObject:v12 forKeyedSubscript:@"idle_dur_bin_4"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_4"];
  }
  if ([v32 hasIdleDurBin5])
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin5"));
    [v5 setObject:v13 forKeyedSubscript:@"idle_dur_bin_5"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_5"];
  }
  if ([v32 hasIdleDurBin6])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin6"));
    [v5 setObject:v14 forKeyedSubscript:@"idle_dur_bin_6"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_6"];
  }
  if ([v32 hasIdleDurBin7])
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin7"));
    [v5 setObject:v15 forKeyedSubscript:@"idle_dur_bin_7"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_7"];
  }
  if ([v32 hasIdleDurBin8])
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin8"));
    [v5 setObject:v16 forKeyedSubscript:@"idle_dur_bin_8"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_8"];
  }
  if ([v32 hasIdleDurBin9])
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin9"));
    [v5 setObject:v17 forKeyedSubscript:@"idle_dur_bin_9"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_9"];
  }
  if ([v32 hasIdleDurBin10])
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin10"));
    [v5 setObject:v18 forKeyedSubscript:@"idle_dur_bin_10"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_10"];
  }
  if ([v32 hasIdleDurBin11])
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin11"));
    [v5 setObject:v19 forKeyedSubscript:@"idle_dur_bin_11"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"idle_dur_bin_11"];
  }
  if ([v32 hasConnDurBin0])
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin0"));
    [v5 setObject:v20 forKeyedSubscript:@"conn_dur_bin_0"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_0"];
  }
  if ([v32 hasConnDurBin1])
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin1"));
    [v5 setObject:v21 forKeyedSubscript:@"conn_dur_bin_1"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_1"];
  }
  if ([v32 hasConnDurBin2])
  {
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin2"));
    [v5 setObject:v22 forKeyedSubscript:@"conn_dur_bin_2"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_2"];
  }
  if ([v32 hasConnDurBin3])
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin3"));
    [v5 setObject:v23 forKeyedSubscript:@"conn_dur_bin_3"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_3"];
  }
  if ([v32 hasConnDurBin4])
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin4"));
    [v5 setObject:v24 forKeyedSubscript:@"conn_dur_bin_4"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_4"];
  }
  if ([v32 hasConnDurBin5])
  {
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin5"));
    [v5 setObject:v25 forKeyedSubscript:@"conn_dur_bin_5"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_5"];
  }
  if ([v32 hasConnDurBin6])
  {
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin6"));
    [v5 setObject:v26 forKeyedSubscript:@"conn_dur_bin_6"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_6"];
  }
  if ([v32 hasConnDurBin7])
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin7"));
    [v5 setObject:v27 forKeyedSubscript:@"conn_dur_bin_7"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_7"];
  }
  if ([v32 hasConnDurBin8])
  {
    id v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin8"));
    [v5 setObject:v28 forKeyedSubscript:@"conn_dur_bin_8"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_8"];
  }
  if ([v32 hasConnDurBin9])
  {
    objc_super v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin9"));
    [v5 setObject:v29 forKeyedSubscript:@"conn_dur_bin_9"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_9"];
  }
  if ([v32 hasConnDurBin10])
  {
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin10"));
    [v5 setObject:v30 forKeyedSubscript:@"conn_dur_bin_10"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_10"];
  }
  if ([v32 hasConnDurBin11])
  {
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin11"));
    [v5 setObject:v31 forKeyedSubscript:@"conn_dur_bin_11"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"conn_dur_bin_11"];
  }
}

- (void)protocolHistForClass:(id)a3 forEntry:(id)a4
{
  id v41 = a3;
  id v5 = a4;
  if ([v41 hasTimestamp])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v41, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v41 hasDurationMs])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durationMs"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"duration"];
  }
  if ([v41 hasSubsId])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "subsId"));
    [v5 setObject:v8 forKeyedSubscript:@"subs_id"];
  }
  if ([v41 hasDurBin0])
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin0"));
    [v5 setObject:v9 forKeyedSubscript:@"dur_bin_0"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_0"];
  }
  if ([v41 hasDurBin1])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin1"));
    [v5 setObject:v10 forKeyedSubscript:@"dur_bin_1"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_1"];
  }
  if ([v41 hasDurBin2])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin2"));
    [v5 setObject:v11 forKeyedSubscript:@"dur_bin_2"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_2"];
  }
  if ([v41 hasDurBin3])
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin3"));
    [v5 setObject:v12 forKeyedSubscript:@"dur_bin_3"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_3"];
  }
  if ([v41 hasDurBin4])
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin4"));
    [v5 setObject:v13 forKeyedSubscript:@"dur_bin_4"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_4"];
  }
  if ([v41 hasDurBin5])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin5"));
    [v5 setObject:v14 forKeyedSubscript:@"dur_bin_5"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_5"];
  }
  if ([v41 hasDurBin6])
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin6"));
    [v5 setObject:v15 forKeyedSubscript:@"dur_bin_6"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_6"];
  }
  if ([v41 hasDurBin7])
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin7"));
    [v5 setObject:v16 forKeyedSubscript:@"dur_bin_7"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_7"];
  }
  if ([v41 hasDurBin8])
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin8"));
    [v5 setObject:v17 forKeyedSubscript:@"dur_bin_8"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_8"];
  }
  if ([v41 hasDurBin9])
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin9"));
    [v5 setObject:v18 forKeyedSubscript:@"dur_bin_9"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_9"];
  }
  if ([v41 hasDurBin10])
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin10"));
    [v5 setObject:v19 forKeyedSubscript:@"dur_bin_10"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_10"];
  }
  if ([v41 hasDurBin11])
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin11"));
    [v5 setObject:v20 forKeyedSubscript:@"dur_bin_11"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_11"];
  }
  if ([v41 hasDurBin12])
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin12"));
    [v5 setObject:v21 forKeyedSubscript:@"dur_bin_12"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_12"];
  }
  if ([v41 hasDurBin13])
  {
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin13"));
    [v5 setObject:v22 forKeyedSubscript:@"dur_bin_13"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_13"];
  }
  if ([v41 hasDurBin14])
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin14"));
    [v5 setObject:v23 forKeyedSubscript:@"dur_bin_14"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_14"];
  }
  if ([v41 hasDurBin15])
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin15"));
    [v5 setObject:v24 forKeyedSubscript:@"dur_bin_15"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_15"];
  }
  if ([v41 hasDurBin16])
  {
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin16"));
    [v5 setObject:v25 forKeyedSubscript:@"dur_bin_16"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_16"];
  }
  if ([v41 hasDurBin17])
  {
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin17"));
    [v5 setObject:v26 forKeyedSubscript:@"dur_bin_17"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_17"];
  }
  if ([v41 hasDurBin18])
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin18"));
    [v5 setObject:v27 forKeyedSubscript:@"dur_bin_18"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_18"];
  }
  if ([v41 hasDurBin19])
  {
    id v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin19"));
    [v5 setObject:v28 forKeyedSubscript:@"dur_bin_19"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_19"];
  }
  if ([v41 hasDurBin20])
  {
    objc_super v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin20"));
    [v5 setObject:v29 forKeyedSubscript:@"dur_bin_20"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_20"];
  }
  if ([v41 hasDurBin21])
  {
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin21"));
    [v5 setObject:v30 forKeyedSubscript:@"dur_bin_21"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_21"];
  }
  if ([v41 hasDurBin22])
  {
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin22"));
    [v5 setObject:v31 forKeyedSubscript:@"dur_bin_22"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_22"];
  }
  if ([v41 hasDurBin23])
  {
    id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin23"));
    [v5 setObject:v32 forKeyedSubscript:@"dur_bin_23"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_23"];
  }
  if ([v41 hasDurBin24])
  {
    v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin24"));
    [v5 setObject:v33 forKeyedSubscript:@"dur_bin_24"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_24"];
  }
  if ([v41 hasDurBin25])
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin25"));
    [v5 setObject:v34 forKeyedSubscript:@"dur_bin_25"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_25"];
  }
  if ([v41 hasDurBin26])
  {
    uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin26"));
    [v5 setObject:v35 forKeyedSubscript:@"dur_bin_26"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_26"];
  }
  if ([v41 hasDurBin27])
  {
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin27"));
    [v5 setObject:v36 forKeyedSubscript:@"dur_bin_27"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_27"];
  }
  if ([v41 hasDurBin28])
  {
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin28"));
    [v5 setObject:v37 forKeyedSubscript:@"dur_bin_28"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_28"];
  }
  if ([v41 hasDurBin29])
  {
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin29"));
    [v5 setObject:v38 forKeyedSubscript:@"dur_bin_29"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_29"];
  }
  if ([v41 hasDurBin30])
  {
    v39 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin30"));
    [v5 setObject:v39 forKeyedSubscript:@"dur_bin_30"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_30"];
  }
  if ([v41 hasDurBin31])
  {
    v40 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "durBin31"));
    [v5 setObject:v40 forKeyedSubscript:@"dur_bin_31"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"dur_bin_31"];
  }
}

- (void)protocolHist2ForClass:(id)a3 forEntry:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  if ([v16 hasTimestamp])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v16 hasDuration])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "duration"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"duration"];
  }
  if ([v16 hasSubsId])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "subsId"));
    [v5 setObject:v8 forKeyedSubscript:@"subs_id"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"subs_id"];
  }
  id v9 = objc_opt_new();
  [v5 setObject:v9 forKeyedSubscript:@"bin"];

  int v10 = 35;
  do
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"bin"];
    [v11 addObject:&unk_1F29E7828];

    --v10;
  }
  while (v10);
  if ([v16 binsCount])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v16 binAtIndex:v12];
      if ([v13 hasIds] && objc_msgSend(v13, "hasValue"))
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "value"));
        id v15 = [v5 objectForKeyedSubscript:@"bin"];
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, objc_msgSend(v13, "ids"));
      }
      ++v12;
    }
    while ([v16 binsCount] > v12);
  }
}

- (void)protocolPerStateForClass:(id)a3 forEntry:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  if ([v23 hasTimestamp])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v23 hasDuration])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v23, "duration"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"duration"];
  }
  if ([v23 hasSubsId])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v23, "subsId"));
    [v5 setObject:v8 forKeyedSubscript:@"subs_id"];
  }
  else
  {
    [v5 setObject:&unk_1F29E7828 forKeyedSubscript:@"subs_id"];
  }
  id v9 = objc_opt_new();
  [v5 setObject:v9 forKeyedSubscript:@"hist"];

  if ([v23 histsCount])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = objc_opt_new();
      unint64_t v12 = [v5 objectForKeyedSubscript:@"hist"];
      [v12 addObject:v11];

      int v13 = 8;
      do
      {
        uint64_t v14 = [v5 objectForKeyedSubscript:@"hist"];
        id v15 = [v14 objectAtIndexedSubscript:v10];
        [v15 addObject:&unk_1F29E7828];

        --v13;
      }
      while (v13);

      ++v10;
    }
    while ([v23 histsCount] > v10);
  }
  if ([v23 histsCount])
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v23 histAtIndex:v16];
      if ([v17 binsCount])
      {
        unint64_t v18 = 0;
        do
        {
          uint64_t v19 = [v17 binAtIndex:v18];
          if ([v19 hasIds] && objc_msgSend(v19, "hasValue"))
          {
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "value"));
            uint64_t v21 = [v5 objectForKeyedSubscript:@"hist"];
            uint64_t v22 = [v21 objectAtIndexedSubscript:v16];
            objc_msgSend(v22, "setObject:atIndexedSubscript:", v20, objc_msgSend(v19, "ids"));
          }
          ++v18;
        }
        while ([v17 binsCount] > v18);
      }

      ++v16;
    }
    while ([v23 histsCount] > v16);
  }
}

- (void)componentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  if ([v21 carrierInfosCount])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v21 carrierInfoAtIndex:v6];
      if ([v7 hasDlEarfcn])
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"dl_earfcn_%d", v6);
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "dlEarfcn"));
        [v5 setObject:v9 forKeyedSubscript:v8];
      }
      if ([v7 hasDlBandwidth])
      {
        unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"dl_bandwidth_%d", v6);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "dlBandwidth"));
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      if ([v7 hasDlRfBand])
      {
        unint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"dl_rf_band_%d", v6);
        int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "dlRfBand"));
        [v5 setObject:v13 forKeyedSubscript:v12];
      }
      ++v6;
    }
    while ([v21 carrierInfosCount] > v6);
  }
  if ([v21 hasTimestamp])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "timestamp"));
    [v5 setObject:v14 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v21 hasPccEarfcn])
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "pccEarfcn"));
    [v5 setObject:v15 forKeyedSubscript:@"pcc_earfcn"];
  }
  if ([v21 hasScc0Earfcn])
  {
    unint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "scc0Earfcn"));
    [v5 setObject:v16 forKeyedSubscript:@"scc0_earfcn"];
  }
  if ([v21 hasScc1Earfcn])
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "scc1Earfcn"));
    [v5 setObject:v17 forKeyedSubscript:@"scc1_earfcn"];
  }
  if ([v21 hasPccBandwidth])
  {
    unint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "pccBandwidth"));
    [v5 setObject:v18 forKeyedSubscript:@"pcc_bandwidth"];
  }
  if ([v21 hasScc0Bandwidth])
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "scc0Bandwidth"));
    [v5 setObject:v19 forKeyedSubscript:@"scc0_bandwidth"];
  }
  if ([v21 hasScc1Bandwidth])
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "scc1Bandwidth"));
    [v5 setObject:v20 forKeyedSubscript:@"scc1_bandwidth"];
  }
}

- (void)duplexModeForClass:(id)a3 forEntry:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 hasTimestamp])
  {
    unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isInTddMode"));
  [v5 setObject:v7 forKeyedSubscript:@"is_in_tdd_mode"];
}

- (void)pdcchStateStatsFor:(id)a3 forEntry:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if ([v17 hasTimestamp])
  {
    unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v17 hasDurationMs])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "durationMs"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  if ([v17 pccPdcchStatesCount])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"pcc_%d", v8);
      unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "pccPdcchStateAtIndex:", v8));
      [v5 setObject:v10 forKeyedSubscript:v9];

      ++v8;
    }
    while ([v17 pccPdcchStatesCount] > v8);
  }
  if ([v17 scc0PdcchStatesCount])
  {
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"scc0_%d", v11);
      int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "scc0PdcchStateAtIndex:", v11));
      [v5 setObject:v13 forKeyedSubscript:v12];

      ++v11;
    }
    while ([v17 scc0PdcchStatesCount] > v11);
  }
  if ([v17 scc1PdcchStatesCount])
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"scc1_%d", v14);
      unint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "scc1PdcchStateAtIndex:", v14));
      [v5 setObject:v16 forKeyedSubscript:v15];

      ++v14;
    }
    while ([v17 scc1PdcchStatesCount] > v14);
  }
}

- (void)cpcStatsForClass:(id)a3 forEntry:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if ([v11 hasTimestamp])
  {
    unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v11 hasTotalDurationMs])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "totalDurationMs"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  if ([v11 hasRxTxOffDurationMs])
  {
    unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    [v5 setObject:v8 forKeyedSubscript:@"rx_tx_off_duration_ms"];
  }
  if ([v11 hasRxOnDurationMs])
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    [v5 setObject:v9 forKeyedSubscript:@"rx_on_duration_ms"];
  }
  if ([v11 hasEnergy])
  {
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    [v5 setObject:v10 forKeyedSubscript:@"energy"];
  }
}

- (NSNumber)metricId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetricId:(id)a3
{
}

- (NSString)metricData
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricData:(id)a3
{
}

- (NSNumber)triggerId
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTriggerId:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
}

- (PBCodable)pbc
{
  return (PBCodable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPbc:(id)a3
{
}

- (NSMutableArray)metricIdArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetricIdArr:(id)a3
{
}

- (NSMutableArray)metricDataArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricDataArr:(id)a3
{
}

- (NSNumber)triggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTriggerCnt:(id)a3
{
}

- (NSNumber)bbtimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBbtimestamp:(id)a3
{
}

- (NSDate)bbMonotonic
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbMonotonic:(id)a3
{
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLogAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAgent, 0);
  objc_storeStrong((id *)&self->_bbMonotonic, 0);
  objc_storeStrong((id *)&self->_bbtimestamp, 0);
  objc_storeStrong((id *)&self->_triggerCnt, 0);
  objc_storeStrong((id *)&self->_metricDataArr, 0);
  objc_storeStrong((id *)&self->_metricIdArr, 0);
  objc_storeStrong((id *)&self->_pbc, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_triggerId, 0);
  objc_storeStrong((id *)&self->_metricData, 0);
  objc_storeStrong((id *)&self->_metricId, 0);
}

@end