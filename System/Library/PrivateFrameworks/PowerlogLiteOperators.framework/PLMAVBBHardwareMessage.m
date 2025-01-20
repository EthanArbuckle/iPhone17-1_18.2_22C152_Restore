@interface PLMAVBBHardwareMessage
+ (id)entryEventBackwardDefinitionBBMavEventMetrics;
+ (id)entryEventBackwardDefinitionBBMavPeriodicMetrics;
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
- (PLMAVBBHardwareMessage)init;
- (id)decodePayload:(id)a3 forMetricId:(id)a4;
- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7;
- (void)addToListMetric:(id)a3 payload:(id)a4;
- (void)logBBMavAperiodicMetrics;
- (void)logBBMavPeriodicMetrics;
- (void)lteComponentCarrierForClass:(id)a3 forEntry:(id)a4;
- (void)nrComponentCarrierForClass:(id)a3 forEntry:(id)a4;
- (void)protocolHistForClass:(id)a3 forEntry:(id)a4;
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

@implementation PLMAVBBHardwareMessage

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

- (void)addToListMetric:(id)a3 payload:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F929C0];
  id v8 = a4;
  if ([v7 debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __50__PLMAVBBHardwareMessage_addToListMetric_payload___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v9;
    if (qword_1EBD5B5A0 != -1) {
      dispatch_once(&qword_1EBD5B5A0, &block);
    }
    if (byte_1EBD5B58A)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMAVBBHardwareMessage addToListMetric:payload:]", block, v19, v20, v21, v22);
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMAVBBHardwareMessage addToListMetric:payload:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:168];

      v15 = PLLogCommon();
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
  v17 = +[PLMAVBBMetricUtility convertToStringData:v8];

  [(NSMutableArray *)metricDataArr addObject:v17];
}

- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7
{
  id v13 = a3;
  id v28 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PLMAVBBHardwareMessage;
  v17 = [(PLMAVBBHardwareMessage *)&v29 init];
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)(objc_msgSend(v13, "integerValue") / 1000));
    uint64_t v19 = [v18 convertFromBasebandToMonotonic];
    bbMonotonic = v17->_bbMonotonic;
    v17->_bbMonotonic = (NSDate *)v19;

    objc_storeStrong((id *)&v17->_triggerId, a4);
    objc_storeStrong((id *)&v17->_bbtimestamp, a3);
    objc_storeStrong((id *)&v17->_triggerCnt, a5);
    uint64_t v21 = +[PLMAVBBMetricUtility convertToStringData:v15];
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

- (void)logBBMavPeriodicMetrics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __49__PLMAVBBHardwareMessage_logBBMavPeriodicMetrics__block_invoke;
    id v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (qword_1EBD5B598 != -1) {
      dispatch_once(&qword_1EBD5B598, &block);
    }
    if (byte_1EBD5B589)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMAVBBHardwareMessage logBBMavPeriodicMetrics]", block, v14, v15, v16, v17);
      v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m"];
      v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLMAVBBHardwareMessage logBBMavPeriodicMetrics]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:147];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavPeriodicMetrics"];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  v12 = v11;
  if (v11)
  {
    [v11 setEntryDate:self->_bbMonotonic];
    [v12 setObject:self->_triggerId forKeyedSubscript:@"triggerId"];
    [v12 setObject:self->_bbtimestamp forKeyedSubscript:@"bbtimestamp"];
    [v12 setObject:self->_triggerCnt forKeyedSubscript:@"triggerCnt"];
    [v12 setObject:self->_metricIdArr forKeyedSubscript:@"mid"];
    [v12 setObject:self->_metricDataArr forKeyedSubscript:@"data"];
    [(PLAgent *)self->_logAgent logEntry:v12];
  }
}

- (void)protocolHistForClass:(id)a3 forEntry:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  if ([v13 hasTimestamp])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "timestamp"));
    [v5 setObject:v6 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v13 hasDurationMs])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "durationMs"));
    [v5 setObject:v7 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"duration"];
  }
  if ([v13 hasSubsId])
  {
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "subsId"));
    [v5 setObject:v8 forKeyedSubscript:@"subs_id"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"subs_id"];
  }
  if ([v13 binsCount])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"dur_bin_%d", v9);
      v11 = [v13 binAtIndex:v9];
      if ([v11 hasBinId] && objc_msgSend(v11, "hasDuration"))
      {
        v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "duration"));
        [v5 setObject:v12 forKeyedSubscript:v10];
      }
      else
      {
        [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:v10];
      }

      ++v9;
    }
    while ([v13 binsCount] > v9);
  }
}

- (id)decodePayload:(id)a3 forMetricId:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setObject:v7 forKeyedSubscript:@"metricId"];
  unint64_t v9 = [[AWDMETRICSCellularPowerLog alloc] initWithData:v6];
  uint64_t v10 = [v7 integerValue];
  switch(v10)
  {
    case 816650:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogL1SleepStatesAtIndex:0];
      goto LABEL_63;
    case 816651:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTEConfiguredCASCCStatesAtIndex:0];
      goto LABEL_63;
    case 816652:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTEActivatedCASCCStatesAtIndex:0];
      goto LABEL_63;
    case 816653:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTERxTxActivityStatesAtIndex:0];
      goto LABEL_63;
    case 816654:
      uint64_t v20 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTECarrierComponentInfoAtIndex:0];
      [(PLMAVBBHardwareMessage *)self lteComponentCarrierForClass:v20 forEntry:v8];
      goto LABEL_64;
    case 816655:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTEAggregatedDLTBSAtIndex:0];
      goto LABEL_63;
    case 816656:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTERSRPAtIndex:0];
      goto LABEL_63;
    case 816657:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTESINRAtIndex:0];
      goto LABEL_63;
    case 816658:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTETxPowerAtIndex:0];
      goto LABEL_63;
    case 816659:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogLTERxDiversityAtIndex:0];
      goto LABEL_63;
    case 816660:
    case 816662:
    case 816663:
    case 816672:
    case 816684:
    case 816685:
    case 816686:
    case 816687:
    case 816688:
    case 816689:
    case 816690:
    case 816691:
    case 816692:
    case 816693:
    case 816694:
    case 816695:
    case 816696:
    case 816697:
    case 816698:
    case 816699:
    case 816701:
    case 816708:
    case 816711:
    case 816714:
    case 816716:
    case 816723:
      goto LABEL_6;
    case 816661:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogPowerEstimatorAtIndex:0];
      goto LABEL_63;
    case 816664:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogProtocolStateAtIndex:0];
      goto LABEL_63;
    case 816665:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogPLMNSearchAtIndex:0];
      goto LABEL_63;
    case 816666:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogGSMTxPowerAtIndex:0];
      goto LABEL_63;
    case 816667:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogGSMRxRSSIAtIndex:0];
      goto LABEL_63;
    case 816668:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogGSMRABModeAtIndex:0];
      goto LABEL_63;
    case 816669:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogGSMRxDiversityAtIndex:0];
      goto LABEL_63;
    case 816670:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogWCDMATxPowerAtIndex:0];
      goto LABEL_63;
    case 816671:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogWCDMARxRSSIAtIndex:0];
      goto LABEL_63;
    case 816673:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogWCDMARxDiversityAtIndex:0];
      goto LABEL_63;
    case 816674:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogWCDMARABModeAtIndex:0];
      goto LABEL_63;
    case 816675:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogWCDMARABTypeAtIndex:0];
      goto LABEL_63;
    case 816676:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogEVDOTxPowerAtIndex:0];
      goto LABEL_63;
    case 816677:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogEVDORxRSSIAtIndex:0];
      goto LABEL_63;
    case 816678:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogHybridRABModeAtIndex:0];
      goto LABEL_63;
    case 816679:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogEVDORxDiversityAtIndex:0];
      goto LABEL_63;
    case 816680:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogCDMA1XTxPowerAtIndex:0];
      goto LABEL_63;
    case 816681:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogCDMA1XRxRSSIAtIndex:0];
      goto LABEL_63;
    case 816682:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogCDMA1XRABModeAtIndex:0];
      goto LABEL_63;
    case 816683:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogCDMA1XRxDiversityAtIndex:0];
      goto LABEL_63;
    case 816700:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6BWPAtIndex:0];
      goto LABEL_63;
    case 816702:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6CASCCConfiguredAtIndex:0];
      goto LABEL_63;
    case 816703:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6CASCCActivatedAtIndex:0];
      goto LABEL_63;
    case 816704:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6RxTxAtIndex:0];
      goto LABEL_63;
    case 816705:
      uint64_t v21 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6CarrierComponentInfoAtIndex:0];
      goto LABEL_59;
    case 816706:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6DLTBSAtIndex:0];
      goto LABEL_63;
    case 816707:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6RSRPAtIndex:0];
      goto LABEL_63;
    case 816709:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6TxPowerAtIndex:0];
      goto LABEL_63;
    case 816710:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRsub6RxDiversityAtIndex:0];
      goto LABEL_63;
    case 816712:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveBWPAtIndex:0];
      goto LABEL_63;
    case 816713:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveAntennaPanelAtIndex:0];
      goto LABEL_63;
    case 816715:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveBeamIDAtIndex:0];
      goto LABEL_63;
    case 816717:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:0];
      goto LABEL_63;
    case 816718:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveCASCCActivatedAtIndex:0];
      goto LABEL_63;
    case 816719:
    case 816724:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRMmWaveTxPowerAtIndex:0];
      goto LABEL_63;
    case 816720:
      uint64_t v21 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:0];
LABEL_59:
      uint64_t v20 = (void *)v21;
      [(PLMAVBBHardwareMessage *)self nrComponentCarrierForClass:v21 forEntry:v8];
      goto LABEL_64;
    case 816721:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRmmWaveDLTBSAtIndex:0];
      goto LABEL_63;
    case 816722:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRMmWaveRSRPAtIndex:0];
      goto LABEL_63;
    case 816725:
      uint64_t v11 = [(AWDMETRICSCellularPowerLog *)v9 cellularPowerLogNRMmWaveULCAStateAtIndex:0];
LABEL_63:
      uint64_t v20 = (void *)v11;
      [(PLMAVBBHardwareMessage *)self protocolHistForClass:v11 forEntry:v8];
LABEL_64:

      goto LABEL_65;
    default:
      if (v10 == 786435)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled]) {
          __assert_rtn("-[PLMAVBBHardwareMessage decodePayload:forMetricId:]", "PLMAVBBHardwareMessage.m", 190, "0");
        }
LABEL_65:
        id v19 = v8;
      }
      else
      {
LABEL_6:
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v12 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __52__PLMAVBBHardwareMessage_decodePayload_forMetricId___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v12;
          if (qword_1EBD5B5A8 != -1) {
            dispatch_once(&qword_1EBD5B5A8, block);
          }
          if (byte_1EBD5B58B)
          {
            id v13 = [NSString stringWithFormat:@"Error: unexpected metric Id"];
            uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
            id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m"];
            id v16 = [v15 lastPathComponent];
            uint64_t v17 = [NSString stringWithUTF8String:"-[PLMAVBBHardwareMessage decodePayload:forMetricId:]"];
            [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:503];

            v18 = PLLogCommon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v25 = v13;
              _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        id v19 = 0;
      }

      return v19;
  }
}

- (void)logBBMavAperiodicMetrics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __50__PLMAVBBHardwareMessage_logBBMavAperiodicMetrics__block_invoke;
    id v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (qword_1EBD5B590 != -1) {
      dispatch_once(&qword_1EBD5B590, &block);
    }
    if (_MergedGlobals_76)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMAVBBHardwareMessage logBBMavAperiodicMetrics]", block, v14, v15, v16, v17);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBHardwareMessage.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLMAVBBHardwareMessage logBBMavAperiodicMetrics]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:128];

      unint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavEventMetrics"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 setEntryDate:self->_bbMonotonic];
    [v12 setObject:self->_bbtimestamp forKeyedSubscript:@"bbtimestamp"];
    [v12 setObject:self->_triggerCnt forKeyedSubscript:@"triggerCnt"];
    [v12 setObject:self->_triggerId forKeyedSubscript:@"metricId"];
    [v12 setObject:self->_metricData forKeyedSubscript:@"metricData"];
    [(PLAgent *)self->_logAgent logEntry:v12];
  }
}

- (PLMAVBBHardwareMessage)init
{
  if ([MEMORY[0x1E4F929C0] debugEnabled]) {
    __assert_rtn("-[PLMAVBBHardwareMessage init]", "PLMAVBBHardwareMessage.m", 56, "0");
  }

  return 0;
}

+ (id)entryEventBackwardDefinitionBBMavPeriodicMetrics
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CC0];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F01D0;
  v26[1] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"triggerId";
  id v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v24[0] = v15;
  v23[1] = @"triggerCnt";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v24[1] = v3;
  v23[2] = @"bbtimestamp";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v24[2] = v5;
  v23[3] = @"mid";
  uint64_t v7 = *MEMORY[0x1E4F92D00];
  v20[0] = *MEMORY[0x1E4F92D10];
  uint64_t v6 = v20[0];
  v20[1] = v7;
  v22[0] = &unk_1F29E1798;
  v22[1] = &unk_1F29E17B0;
  uint64_t v21 = *MEMORY[0x1E4F92D08];
  uint64_t v8 = v21;
  v22[2] = &unk_1F29E17C8;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v20 count:3];
  v24[3] = v9;
  v23[4] = @"data";
  v18[0] = v6;
  v18[1] = v7;
  v19[0] = &unk_1F29E1798;
  v19[1] = &unk_1F29E17B0;
  v18[2] = v8;
  v19[2] = &unk_1F29E17E0;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v24[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  v28[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionBBMavEventMetrics
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CC0];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F01D0;
  v18[1] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"triggerCnt";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"bbtimestamp";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  v15[2] = @"metricId";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v15[3] = @"metricData";
  unint64_t v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v16[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

uint64_t __50__PLMAVBBHardwareMessage_logBBMavAperiodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_76 = result;
  return result;
}

uint64_t __49__PLMAVBBHardwareMessage_logBBMavPeriodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B589 = result;
  return result;
}

uint64_t __50__PLMAVBBHardwareMessage_addToListMetric_payload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B58A = result;
  return result;
}

uint64_t __52__PLMAVBBHardwareMessage_decodePayload_forMetricId___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B58B = result;
  return result;
}

- (void)lteComponentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  if ([v20 carrierInfosCount])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v20 carrierInfoAtIndex:v6];
      if ([v7 hasBand])
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"dl_rf_band_%d", v6);
        unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "band"));
        [v5 setObject:v9 forKeyedSubscript:v8];
      }
      if ([v7 hasBandwidth])
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"dl_bandwidth_%d", v6);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "bandwidth"));
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      if ([v7 hasEarfcn])
      {
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"dl_earfcn_%d", v6);
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "earfcn"));
        [v5 setObject:v13 forKeyedSubscript:v12];
      }
      if ([v7 hasType])
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"dl_type_%d", v6);
        id v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "type"));
        [v5 setObject:v15 forKeyedSubscript:v14];
      }
      if ([v7 hasDuplex])
      {
        id v16 = objc_msgSend(NSString, "stringWithFormat:", @"dl_duplex_%d", v6);
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "duplex"));
        [v5 setObject:v17 forKeyedSubscript:v16];
      }
      ++v6;
    }
    while ([v20 carrierInfosCount] > v6);
  }
  if ([v20 hasTimestamp])
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
    [v5 setObject:v18 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v20 hasSubsId])
  {
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "subsId"));
    [v5 setObject:v19 forKeyedSubscript:@"subs_id"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"subs_id"];
  }
}

- (void)nrComponentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  if ([v20 carrierInfosCount])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v20 carrierInfoAtIndex:v6];
      if ([v7 hasBand])
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"dl_rf_band_%d", v6);
        unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "band"));
        [v5 setObject:v9 forKeyedSubscript:v8];
      }
      if ([v7 hasBandwidth])
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"dl_bandwidth_%d", v6);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "bandwidth"));
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      if ([v7 hasEarfcn])
      {
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"dl_earfcn_%d", v6);
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "earfcn"));
        [v5 setObject:v13 forKeyedSubscript:v12];
      }
      if ([v7 hasType])
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"dl_type_%d", v6);
        id v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "type"));
        [v5 setObject:v15 forKeyedSubscript:v14];
      }
      if ([v7 hasDuplex])
      {
        id v16 = objc_msgSend(NSString, "stringWithFormat:", @"dl_duplex_%d", v6);
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "duplex"));
        [v5 setObject:v17 forKeyedSubscript:v16];
      }
      ++v6;
    }
    while ([v20 carrierInfosCount] > v6);
  }
  if ([v20 hasTimestamp])
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
    [v5 setObject:v18 forKeyedSubscript:@"bbtimestamp"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"bbtimestamp"];
  }
  if ([v20 hasSubsId])
  {
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "subsId"));
    [v5 setObject:v19 forKeyedSubscript:@"subs_id"];
  }
  else
  {
    [v5 setObject:&unk_1F29E17F8 forKeyedSubscript:@"subs_id"];
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

@end