@interface PLBBMavHwRfOOSLogMsg
+ (id)entryEventBackwardDefinitionOOSPerRat;
- (NSArray)oosGsmPssiStatTicks;
- (NSArray)oosGsmPssiTimes;
- (NSArray)oosLtePssiStatTicks;
- (NSArray)oosLtePssiTimes;
- (NSArray)oosTdsPssiStatTicks;
- (NSArray)oosTdsPssiTimes;
- (NSArray)oosWcdmaPssiStatTicks;
- (NSArray)oosWcdmaPssiTimes;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)logDuration;
- (NSNumber)oosTicks;
- (NSNumber)oosTimes;
- (NSNumber)pssiTicks;
- (NSString)error;
- (PLBBMavHwRfOOSLogMsg)init;
- (id)logEventBackwardBBMavHwRfOos;
- (unsigned)inited;
- (unsigned)oosInProgress;
- (void)populateEntry:(id)a3;
- (void)refreshBBMavHwRfOOS;
- (void)setCommonInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setOosGsmPssiStatTicks:(id)a3;
- (void)setOosGsmPssiTimes:(id)a3;
- (void)setOosInProgress:(unsigned __int8)a3;
- (void)setOosLtePssiStatTicks:(id)a3;
- (void)setOosLtePssiTimes:(id)a3;
- (void)setOosTdsPssiStatTicks:(id)a3;
- (void)setOosTdsPssiTimes:(id)a3;
- (void)setOosTicks:(id)a3;
- (void)setOosTimes:(id)a3;
- (void)setOosWcdmaPssiStatTicks:(id)a3;
- (void)setOosWcdmaPssiTimes:(id)a3;
- (void)setPssiTicks:(id)a3;
@end

@implementation PLBBMavHwRfOOSLogMsg

- (PLBBMavHwRfOOSLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfOOSLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD58298 != -1) {
      dispatch_once(&qword_1EBD58298, block);
    }
    if (_MergedGlobals_1_23)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfOOSLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfOOSLogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:25];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PLBBMavHwRfOOSLogMsg;
  v10 = [(PLBBMavHwRfOOSLogMsg *)&v16 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = v13;

    v10->_inited = 1;
  }
  return v10;
}

uint64_t __28__PLBBMavHwRfOOSLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_23 = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD582A0 != -1) {
      dispatch_once(&qword_1EBD582A0, block);
    }
    if (byte_1EBD58291)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:39];

      objc_super v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v8 && v9)
  {
    [(NSMutableDictionary *)self->_commonInfo setObject:v8 forKey:@"SeqNum"];
    [(NSMutableDictionary *)self->_commonInfo setObject:v9 forKey:@"BBDate"];
    commonInfo = self->_commonInfo;
    v18 = [NSNumber numberWithDouble:a5];
    [(NSMutableDictionary *)commonInfo setValue:v18 forKey:@"TimeCal"];
LABEL_18:

    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_18;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD582A8 != -1) {
      dispatch_once(&qword_1EBD582A8, v25);
    }
    if (byte_1EBD58292)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:41];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
LABEL_19:
}

uint64_t __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58291 = result;
  return result;
}

uint64_t __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_18(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58292 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionOOSPerRat
{
  v31[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F92D00];
  v30[0] = *MEMORY[0x1E4F92D10];
  v30[1] = v2;
  v31[0] = &unk_1F29E5530;
  v31[1] = &unk_1F29E5548;
  v30[2] = *MEMORY[0x1E4F92D08];
  v31[2] = &unk_1F29E5560;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v4 = *MEMORY[0x1E4F92C70];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v4;
  v27[0] = &unk_1F29F06B0;
  v27[1] = MEMORY[0x1E4F1CC28];
  uint64_t v5 = *MEMORY[0x1E4F92CC0];
  v26[2] = *MEMORY[0x1E4F92CB0];
  v26[3] = v5;
  v27[2] = @"refreshRequestHandler";
  v27[3] = MEMORY[0x1E4F1CC38];
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"SeqNum";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v25[0] = v21;
  v24[1] = @"BBDate";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_DateFormat");
  v25[1] = v19;
  v24[2] = @"LogDuration";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
  v25[2] = v17;
  v24[3] = @"oosInProgress";
  objc_super v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v25[3] = v6;
  v24[4] = @"oosTimes";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v25[4] = v8;
  v24[5] = @"oosTicks";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v25[5] = v10;
  v24[6] = @"pssiTicks";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v25[6] = v12;
  v25[7] = v3;
  v24[7] = @"oosLtePssiTimes";
  v24[8] = @"oosLtePssiStatTicks";
  v25[8] = v3;
  v25[9] = v3;
  v24[9] = @"oosGsmPssiTimes";
  v24[10] = @"oosGsmPssiStatTicks";
  v25[10] = v3;
  v25[11] = v3;
  v24[11] = @"oosWcdmaPssiTimes";
  v24[12] = @"oosWcdmaPssiStatTicks";
  v25[12] = v3;
  v25[13] = v3;
  v24[13] = @"oosTdsPssiTimes";
  v24[14] = @"oosTdsPssiStatTicks";
  v25[14] = v3;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:15];
  v29[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v14;
}

- (void)refreshBBMavHwRfOOS
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRfOos
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfOos"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRfOOSLogMsg *)self populateEntry:v4];
  v7[0] = @"entry";
  v7[1] = @"entryKey";
  v8[0] = v4;
  v8[1] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)populateEntry:(id)a3
{
  commonInfo = self->_commonInfo;
  id v5 = a3;
  v6 = [(NSMutableDictionary *)commonInfo objectForKey:@"BBDate"];
  v7 = [v6 convertFromBasebandToMonotonic];
  [v5 setEntryDate:v7];

  id v8 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v5 setObject:v8 forKeyedSubscript:@"BBDate"];

  id v9 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v5 setObject:v9 forKeyedSubscript:@"SeqNum"];

  uint64_t v10 = [(PLBBMavHwRfOOSLogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMavHwRfOOSLogMsg oosInProgress](self, "oosInProgress"));
  [v5 setObject:v11 forKeyedSubscript:@"oosInProgress"];

  v12 = [(PLBBMavHwRfOOSLogMsg *)self oosTimes];
  [v5 setObject:v12 forKeyedSubscript:@"oosTimes"];

  v13 = [(PLBBMavHwRfOOSLogMsg *)self oosTicks];
  [v5 setObject:v13 forKeyedSubscript:@"oosTicks"];

  v14 = [(PLBBMavHwRfOOSLogMsg *)self pssiTicks];
  [v5 setObject:v14 forKeyedSubscript:@"pssiTicks"];

  v15 = [(PLBBMavHwRfOOSLogMsg *)self oosLtePssiTimes];
  [v5 setObject:v15 forKeyedSubscript:@"oosLtePssiTimes"];

  objc_super v16 = [(PLBBMavHwRfOOSLogMsg *)self oosLtePssiStatTicks];
  [v5 setObject:v16 forKeyedSubscript:@"oosLtePssiStatTicks"];

  v17 = [(PLBBMavHwRfOOSLogMsg *)self oosGsmPssiTimes];
  [v5 setObject:v17 forKeyedSubscript:@"oosGsmPssiTimes"];

  v18 = [(PLBBMavHwRfOOSLogMsg *)self oosGsmPssiStatTicks];
  [v5 setObject:v18 forKeyedSubscript:@"oosGsmPssiStatTicks"];

  uint64_t v19 = [(PLBBMavHwRfOOSLogMsg *)self oosWcdmaPssiTimes];
  [v5 setObject:v19 forKeyedSubscript:@"oosWcdmaPssiTimes"];

  uint64_t v20 = [(PLBBMavHwRfOOSLogMsg *)self oosWcdmaPssiStatTicks];
  [v5 setObject:v20 forKeyedSubscript:@"oosWcdmaPssiStatTicks"];

  v21 = [(PLBBMavHwRfOOSLogMsg *)self oosTdsPssiTimes];
  [v5 setObject:v21 forKeyedSubscript:@"oosTdsPssiTimes"];

  id v22 = [(PLBBMavHwRfOOSLogMsg *)self oosTdsPssiStatTicks];
  [v5 setObject:v22 forKeyedSubscript:@"oosTdsPssiStatTicks"];
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setError:(id)a3
{
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLogDuration:(id)a3
{
}

- (unsigned)oosInProgress
{
  return self->_oosInProgress;
}

- (void)setOosInProgress:(unsigned __int8)a3
{
  self->_oosInProgress = a3;
}

- (NSNumber)oosTimes
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOosTimes:(id)a3
{
}

- (NSNumber)oosTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setOosTicks:(id)a3
{
}

- (NSNumber)pssiTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPssiTicks:(id)a3
{
}

- (NSArray)oosLtePssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOosLtePssiTimes:(id)a3
{
}

- (NSArray)oosLtePssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOosLtePssiStatTicks:(id)a3
{
}

- (NSArray)oosGsmPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOosGsmPssiTimes:(id)a3
{
}

- (NSArray)oosGsmPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOosGsmPssiStatTicks:(id)a3
{
}

- (NSArray)oosWcdmaPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOosWcdmaPssiTimes:(id)a3
{
}

- (NSArray)oosWcdmaPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOosWcdmaPssiStatTicks:(id)a3
{
}

- (NSArray)oosTdsPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOosTdsPssiTimes:(id)a3
{
}

- (NSArray)oosTdsPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOosTdsPssiStatTicks:(id)a3
{
}

- (unsigned)inited
{
  return self->_inited;
}

- (void)setInited:(unsigned __int8)a3
{
  self->_inited = a3;
}

- (NSMutableDictionary)commonInfo
{
  return self->_commonInfo;
}

- (void)setCommonInfo:(id)a3
{
}

- (NSMutableDictionary)kvPairs
{
  return self->_kvPairs;
}

- (void)setKvPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_oosTdsPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosTdsPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosWcdmaPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosWcdmaPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosGsmPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosGsmPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosLtePssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosLtePssiTimes, 0);
  objc_storeStrong((id *)&self->_pssiTicks, 0);
  objc_storeStrong((id *)&self->_oosTicks, 0);
  objc_storeStrong((id *)&self->_oosTimes, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end