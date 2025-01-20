@interface PLBasebandEurekaMessage
- (BOOL)parseData:(id)a3;
- (NSData)payload;
- (PLBasebandEurekaMessage)initWithData:(id)a3;
- (_PLBasebandEventHeader)header;
- (_PLBasebandSystemSelectionEvent)ssevent;
- (char)ssaction;
- (char)ssstate;
- (id)actionSystemSelection;
- (id)callTypeString:(char *)a3;
- (id)cdmaExitString:(char *)a3;
- (id)cellUpdateCause:(char *)a3;
- (id)cellularSystemStringSystemSelection:(char *)a3;
- (id)convertCMCallConnectPayloadToDictionary:(_CMCallConnectPayload *)a3;
- (id)convertCMCallConnectV2PayloadToDictionary:(_NewCMCallConnectPayload *)a3;
- (id)convertCMCallOrigPayloadToDictionary:(_CMCallOrigPayload *)a3;
- (id)convertCMCallOrigV2PayloadToDictionary:(_NewCMCallOrigPayload *)a3;
- (id)estCauseLTE:(char *)a3;
- (id)establishmentCauseStringWCDMA:(char *)a3;
- (id)eventStringACC:(char *)a3;
- (id)eventStringOOS:(char *)a3;
- (id)eventSystemSelection;
- (id)iratHOStringLTE:(char *)a3;
- (id)iratStringLTE:(char *)a3;
- (id)pagingCauseWCDMA:(char *)a3;
- (id)pagingTypeWCDMA:(char *)a3;
- (id)payloadString;
- (id)procedureStringPSSI:(char *)a3;
- (id)ratStringPSSI:(char *)a3;
- (id)relCauseLTE:(char *)a3;
- (id)releaseCauseStringWCDMA:(char *)a3;
- (id)scanTypeStartWCDMA:(char *)a3;
- (id)scanTypeStopWCDMA:(char *)a3;
- (id)searchPhaseStringPSSI:(char *)a3;
- (id)smgmmEventType:(char *)a3;
- (id)soCallTypeString:(char *)a3;
- (id)stateStringACC:(char *)a3;
- (id)stateStringGSM:(char *)a3;
- (id)stateStringHSDPA:(char *)a3;
- (id)stateStringHSPAPLUS_DC:(char *)a3;
- (id)stateStringHSUPA:(char *)a3;
- (id)stateStringLTE:(char *)a3;
- (id)stateStringMotion:(char *)a3;
- (id)stateStringOOS:(char *)a3;
- (id)stateStringUTRANL1:(char *)a3;
- (id)stateStringWCDMA:(char *)a3;
- (id)stateSystemSelection;
- (id)stringForUnknownBytes:(unsigned int)a3;
- (id)termStringSystemSelection:(char *)a3;
- (id)tooShortErrorString;
- (unsigned)eventCode;
- (unsigned)skip;
- (void)logWithLogger:(id)a3;
- (void)setHeader:(_PLBasebandEventHeader *)a3;
- (void)setPayload:(id)a3;
- (void)setSkip:(unsigned __int8)a3;
- (void)setSsaction:(char *)a3;
- (void)setSsevent:(_PLBasebandSystemSelectionEvent *)a3;
- (void)setSsstate:(char *)a3;
@end

@implementation PLBasebandEurekaMessage

- (PLBasebandEurekaMessage)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBasebandEurekaMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD58218 != -1) {
      dispatch_once(&qword_1EBD58218, block);
    }
    if (_MergedGlobals_1_22)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaMessage initWithData:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage initWithData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:31];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PLBasebandEurekaMessage;
  v12 = [(PLBasebandMessage *)&v17 initWithData:v4];
  v13 = v12;
  if (!v12) {
    goto LABEL_10;
  }
  v12->_header = 0;
  payload = v12->_payload;
  v12->_payload = 0;

  v13->_ssevent = 0;
  v13->_ssaction = 0;
  v13->_ssstate = 0;
  v13->_skip = 0;
  v15 = 0;
  if ([(PLBasebandEurekaMessage *)v13 parseData:v4]) {
LABEL_10:
  }
    v15 = v13;

  return v15;
}

uint64_t __40__PLBasebandEurekaMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_22 = result;
  return result;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __37__PLBasebandEurekaMessage_parseData___block_invoke;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v30 = v5;
    if (qword_1EBD58220 != -1) {
      dispatch_once(&qword_1EBD58220, &block);
    }
    if (byte_1EBD58209)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaMessage parseData:]", block, v27, v28, v29, v30);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage parseData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:48];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = (unsigned __int8 *)[v12 bytes];
  v14 = &v13[2 * (*v13 == 129)];
  self->_header = (_PLBasebandEventHeader *)v14;
  v15 = (_PLBasebandSystemSelectionEvent *)(v14 + 14);
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v14 + 14, -[PLBasebandEurekaMessage header](self, "header")[13]);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  payload = self->_payload;
  self->_payload = v16;

  if (([(PLBasebandEurekaMessage *)self header][1] == 621
     || [(PLBasebandEurekaMessage *)self header][1] == 622)
    && [(PLBasebandEurekaMessage *)self header][13] >= 4u)
  {
    self->_ssevent = v15;
    self->_ssaction = (char *)(v14 + 16);
    self->_ssstate = (char *)(v14 + 17);
    v15 = (_PLBasebandSystemSelectionEvent *)(v14 + 18);
  }
  id v18 = v12;
  v19 = (char *)v15 - [v18 bytes];
  unint64_t v20 = [v18 length];
  if ((unint64_t)v19 > v20)
  {
    uint64_t v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = v18;
      v24 = (char *)v15 - [v23 bytes];
      uint64_t v25 = [v23 length];
      *(_DWORD *)buf = 134218498;
      v32 = v24;
      __int16 v33 = 2048;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      v36 = "-[PLBasebandEurekaMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v21, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
  }
  return (unint64_t)v19 <= v20;
}

uint64_t __37__PLBasebandEurekaMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58209 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v285 = *MEMORY[0x1E4F143B8];
  v282.receiver = self;
  v282.super_class = (Class)PLBasebandEurekaMessage;
  [(PLBasebandMessage *)&v282 logWithLogger:a3];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD58228 != -1) {
      dispatch_once(&qword_1EBD58228, block);
    }
    if (byte_1EBD5820A)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaMessage logWithLogger:]");
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:92];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v284 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = [(PLBasebandEurekaMessage *)self payloadString];
  [(PLBasebandEurekaMessage *)self setSkip:0];
  id v12 = objc_alloc_init(PLBBEurekaEventMsg);
  v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBEurekaEventMsg *)v12 setEventCode:[(PLBasebandEurekaMessage *)self eventCode]];
  [(PLBBEurekaEventMsg *)v12 setError:&stru_1F294E108];
  v14 = [(PLBasebandMessage *)self seqNum];
  v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if (v11)
  {
    v16 = (void *)[[NSString alloc] initWithString:v11];
    [(PLBBEurekaEventMsg *)v12 setPayload:v16];
  }
  id v17 = [(PLBasebandEurekaMessage *)self payload];
  uint64_t v18 = [v17 bytes];

  if (!v18)
  {
    [(PLBBEurekaEventMsg *)v12 setError:@"payloadIsNil;"];
    goto LABEL_236;
  }
  int v19 = (int)[(PLBasebandEurekaMessage *)self header][1];
  if (v19 > 2010)
  {
    if (v19 > 2470)
    {
      if (v19 > 2493)
      {
        if ((v19 - 2549) <= 0xB && ((1 << (v19 + 11)) & 0xFC1) != 0) {
          goto LABEL_40;
        }
        if (v19 == 2494)
        {
          if ([(PLBasebandEurekaMessage *)self header][13] > 1u) {
            goto LABEL_236;
          }
          goto LABEL_198;
        }
        if (v19 == 2521)
        {
LABEL_40:
          uint64_t v37 = NSString;
          v38 = [(PLBasebandEurekaMessage *)self payload];
          v39 = [v37 stringWithFormat:@"%@", v38];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"payload" andWithVal:v39];
LABEL_41:

LABEL_151:
          goto LABEL_236;
        }
        goto LABEL_134;
      }
      switch(v19)
      {
        case 2471:
          id v63 = [(PLBasebandEurekaMessage *)self payload];
          uint64_t v64 = [v63 bytes];

          id v23 = [(PLBasebandEurekaMessage *)self convertCMCallOrigV2PayloadToDictionary:v64];
          id v65 = [NSString alloc];
          v66 = NSString;
          v67 = [(__CFString *)v23 objectForKeyedSubscript:@"callId"];
          v68 = [v66 stringWithFormat:@"%@", v67];
          v69 = (void *)[v65 initWithString:v68];

          id v70 = [NSString alloc];
          v71 = [(__CFString *)v23 objectForKeyedSubscript:@"callType"];
          v72 = (void *)[v70 initWithString:v71];

          id v73 = [NSString alloc];
          v74 = [(__CFString *)v23 objectForKeyedSubscript:@"serviceType"];
          v75 = (void *)[v73 initWithString:v74];

          id v76 = [NSString alloc];
          v77 = [(__CFString *)v23 objectForKeyedSubscript:@"clientId"];
          v78 = (void *)[v76 initWithString:v77];

          [(PLBBEurekaEventMsg *)v12 logEventCMCallEventOrigWithId:v69 andCallType:v72 andSrvType:v75 andClientId:v78];
          break;
        case 2472:
          id v79 = [(PLBasebandEurekaMessage *)self payload];
          uint64_t v80 = [v79 bytes];

          id v23 = [(PLBasebandEurekaMessage *)self convertCMCallConnectV2PayloadToDictionary:v80];
          id v81 = [NSString alloc];
          v82 = [(__CFString *)v23 objectForKeyedSubscript:@"callId"];
          v69 = (void *)[v81 initWithString:v82];

          id v83 = [NSString alloc];
          v84 = [(__CFString *)v23 objectForKeyedSubscript:@"callType"];
          v72 = (void *)[v83 initWithString:v84];

          id v85 = [NSString alloc];
          v86 = [(__CFString *)v23 objectForKeyedSubscript:@"systemMode"];
          v75 = (void *)[v85 initWithString:v86];

          id v87 = [NSString alloc];
          v88 = [(__CFString *)v23 objectForKeyedSubscript:@"clientId"];
          v78 = (void *)[v87 initWithString:v88];

          [(PLBBEurekaEventMsg *)v12 logEventCMCallEventConnWithId:v69 andCallType:v72 andSysMode:v75 andClientId:v78];
          break;
        case 2473:
          id v43 = [(PLBasebandEurekaMessage *)self payload];
          v44 = (unsigned __int8 *)[v43 bytes];

          id v23 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v44[1]);
          v45 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", *v44);
          v46 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v44[2]);
          [(PLBBEurekaEventMsg *)v12 logEventCMCallEventEndWithId:v23 andNumCalls:v45 andClientId:v46];
          [(PLBasebandEurekaMessage *)self setSkip:1];

          goto LABEL_235;
        default:
          goto LABEL_134;
      }
      [(PLBasebandEurekaMessage *)self setSkip:1];

LABEL_117:
      goto LABEL_171;
    }
    if (v19 <= 2278)
    {
      switch(v19)
      {
        case 2258:
        case 2265:
          goto LABEL_236;
        case 2259:
        case 2261:
        case 2262:
        case 2263:
        case 2264:
        case 2266:
        case 2267:
        case 2268:
        case 2269:
        case 2270:
        case 2271:
          goto LABEL_134;
        case 2260:
          goto LABEL_40;
        case 2272:
          if ([(PLBasebandEurekaMessage *)self header][13] > 0xBu)
          {
            id v186 = [(PLBasebandEurekaMessage *)self payload];
            uint64_t v187 = [v186 bytes];

            v188 = [(PLBasebandEurekaMessage *)self stateStringMotion:v187 + 8];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"RAW_MOTION_STATE" andWithVal:v188];

            v189 = [(PLBasebandEurekaMessage *)self stateStringMotion:v187 + 9];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"FILTERED_MOTION_STATE" andWithVal:v189];

            int v190 = *(unsigned __int16 *)(v187 + 10);
            switch(v190)
            {
              case 1:
                id v23 = @"CM";
                break;
              case 4:
                id v23 = @"GPS";
                break;
              case 2:
                id v23 = @"SD";
                break;
              default:
                id v23 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:*(_WORD *)(v187 + 10)];
                break;
            }
            v36 = @"ACTIVE_CLIENT_BIT_MASK";
            goto LABEL_234;
          }
          if (![MEMORY[0x1E4F929C0] debugEnabled]) {
            goto LABEL_198;
          }
          uint64_t v27 = objc_opt_class();
          v271[0] = MEMORY[0x1E4F143A8];
          v271[1] = 3221225472;
          v271[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_233;
          v271[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v271[4] = v27;
          if (qword_1EBD58278 != -1) {
            dispatch_once(&qword_1EBD58278, v271);
          }
          if (!byte_1EBD58214) {
            goto LABEL_198;
          }
          v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_MAV_MOTION_SRV"];
          v29 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
          v31 = [v30 lastPathComponent];
          v32 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
          [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:847];

          __int16 v33 = PLLogCommon();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_197;
          }
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
        case 2273:
          if ([(PLBasebandEurekaMessage *)self header][13] <= 0xBu)
          {
            if (![MEMORY[0x1E4F929C0] debugEnabled]) {
              goto LABEL_198;
            }
            uint64_t v138 = objc_opt_class();
            v270[0] = MEMORY[0x1E4F143A8];
            v270[1] = 3221225472;
            v270[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_257;
            v270[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v270[4] = v138;
            if (qword_1EBD58280 != -1) {
              dispatch_once(&qword_1EBD58280, v270);
            }
            if (!byte_1EBD58215) {
              goto LABEL_198;
            }
            v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_MAV_LMAPO_SD"];
            v139 = (void *)MEMORY[0x1E4F929B8];
            v140 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
            v141 = [v140 lastPathComponent];
            v142 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
            [v139 logMessage:v28 fromFile:v141 fromFunction:v142 fromLineNumber:879];

            __int16 v33 = PLLogCommon();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_197;
            }
            *(_DWORD *)buf = 138412290;
            v284 = v28;
            goto LABEL_196;
          }
          id v191 = [(PLBasebandEurekaMessage *)self payload];
          uint64_t v192 = [v191 bytes];

          if (*(unsigned char *)(v192 + 8) == 1)
          {
            id v23 = @"ACC_FSM";
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"STATE_MACHINE_ID" andWithVal:@"ACC_FSM"];
            uint64_t v218 = v192 + 10;
            uint64_t v219 = v192 + 11;
            v69 = [(PLBasebandEurekaMessage *)self stateStringACC:v192 + 9];
            v72 = [(PLBasebandEurekaMessage *)self stateStringACC:v218];
            uint64_t v195 = [(PLBasebandEurekaMessage *)self stateStringACC:v219];
          }
          else
          {
            if (*(unsigned char *)(v192 + 8))
            {
              -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
              id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v36 = @"STATE_MACHINE_ID";
              goto LABEL_234;
            }
            id v23 = @"OOS_FSM";
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"STATE_MACHINE_ID" andWithVal:@"OOS_FSM"];
            uint64_t v193 = v192 + 10;
            uint64_t v194 = v192 + 11;
            v69 = [(PLBasebandEurekaMessage *)self stateStringOOS:v192 + 9];
            v72 = [(PLBasebandEurekaMessage *)self eventStringOOS:v193];
            uint64_t v195 = [(PLBasebandEurekaMessage *)self stateStringOOS:v194];
          }
          v75 = (void *)v195;
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"CURRENT_STATE" andWithVal:v69];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"EVENT" andWithVal:v72];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"NEXT_STATE" andWithVal:v75];
          goto LABEL_117;
        case 2274:
          if ([(PLBasebandEurekaMessage *)self header][13] <= 3u) {
            goto LABEL_198;
          }
          id v143 = [(PLBasebandEurekaMessage *)self payload];
          v144 = (unsigned int *)[v143 bytes];

          id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedInt:*v144];
          v69 = [(__CFString *)v23 stringValue];
          v92 = @"InActivity_Time";
          goto LABEL_170;
        case 2275:
          if ([(PLBasebandEurekaMessage *)self header][13] <= 0xBu) {
            goto LABEL_198;
          }
          id v145 = [(PLBasebandEurekaMessage *)self payload];
          v146 = (unsigned __int16 *)[v145 bytes];

          v147 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:v146[1]];
          v148 = [v147 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"On_duration_timer" andWithVal:v148];

          v149 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:v146[2]];
          v150 = [v149 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"Inactivity_timer" andWithVal:v150];

          v151 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:v146[3]];
          v152 = [v151 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"Short_drx_cycle" andWithVal:v152];

          v153 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:v146[4]];
          v154 = [v153 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"Short_drx_cycle_timer" andWithVal:v154];

          id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedShort:v146[5]];
          v69 = [(__CFString *)v23 stringValue];
          v92 = @"Long_drx_cycle";
          goto LABEL_170;
        case 2276:
          if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13]) {
            goto LABEL_198;
          }
          id v155 = [(PLBasebandEurekaMessage *)self payload];
          v38 = -[PLBasebandEurekaMessage estCauseLTE:](self, "estCauseLTE:", [v155 bytes]);

          v48 = @"est_cause";
          goto LABEL_150;
        default:
          if (v19 == 2011)
          {
            if ([(PLBasebandEurekaMessage *)self header][13] < 3u) {
              goto LABEL_236;
            }
            id v169 = [(PLBasebandEurekaMessage *)self payload];
            uint64_t v170 = [v169 bytes];

            id v23 = [(PLBasebandEurekaMessage *)self stateStringWCDMA:v170];
            v24 = [(PLBasebandEurekaMessage *)self stateStringWCDMA:v170 + 1];
            v171 = [NSNumber numberWithUnsignedLong:*(unsigned __int8 *)(v170 + 2)];
            v26 = [v171 stringValue];

            [(PLBBEurekaEventMsg *)v12 logEventForwardUTRANRRCNextStateAs:v24 andCurrStateAs:v23 andRateAs:v26];
            goto LABEL_154;
          }
          if (v19 != 2131) {
            goto LABEL_134;
          }
          if ((_BYTE)[(PLBasebandEurekaMessage *)self header][13])
          {
            id v56 = [(PLBasebandEurekaMessage *)self payload];
            uint64_t v57 = [v56 bytes];

            id v23 = [(PLBasebandEurekaMessage *)self stateStringUTRANL1:v57];
            v36 = @"currState";
            goto LABEL_234;
          }
          if (![MEMORY[0x1E4F929C0] debugEnabled]) {
            goto LABEL_198;
          }
          uint64_t v213 = objc_opt_class();
          v273[0] = MEMORY[0x1E4F143A8];
          v273[1] = 3221225472;
          v273[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_203;
          v273[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v273[4] = v213;
          if (qword_1EBD58268 != -1) {
            dispatch_once(&qword_1EBD58268, v273);
          }
          if (!byte_1EBD58212) {
            goto LABEL_198;
          }
          v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_UTRAN_L1_STATE"];
          v214 = (void *)MEMORY[0x1E4F929B8];
          v215 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
          v216 = [v215 lastPathComponent];
          v217 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
          [v214 logMessage:v28 fromFile:v216 fromFunction:v217 fromLineNumber:802];

          __int16 v33 = PLLogCommon();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_197;
          }
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
      }
    }
    switch(v19)
    {
      case 2279:
        if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13]) {
          goto LABEL_198;
        }
        id v47 = [(PLBasebandEurekaMessage *)self payload];
        v38 = -[PLBasebandEurekaMessage relCauseLTE:](self, "relCauseLTE:", [v47 bytes]);

        v48 = @"rel_cause";
        goto LABEL_150;
      case 2284:
        if ([(PLBasebandEurekaMessage *)self header][13] > 7u)
        {
          id v172 = [(PLBasebandEurekaMessage *)self payload];
          v173 = (unsigned __int8 *)[v172 bytes];

          v174 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v173];
          v175 = [v174 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"CUR_STEP" andWithVal:v175];

          v176 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v173[1]];
          v177 = [v176 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"PSSI_SEARCH_PHASE" andWithVal:v177];

          v178 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v173[2]];
          v179 = [v178 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"MCC" andWithVal:v179];

          v180 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v173[4]];
          v181 = [v180 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"MNC" andWithVal:v181];

          v182 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v173[6]];
          v183 = [v182 stringValue];
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"RAT" andWithVal:v183];

          id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedChar:v173[7]];
          v69 = [(__CFString *)v23 stringValue];
          v92 = @"PROCEDURE";
          goto LABEL_170;
        }
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_198;
        }
        uint64_t v93 = objc_opt_class();
        v272[0] = MEMORY[0x1E4F143A8];
        v272[1] = 3221225472;
        v272[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_212;
        v272[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v272[4] = v93;
        if (qword_1EBD58270 != -1) {
          dispatch_once(&qword_1EBD58270, v272);
        }
        if (!byte_1EBD58213) {
          goto LABEL_198;
        }
        v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_MAV_PSSI_SCAN"];
        v94 = (void *)MEMORY[0x1E4F929B8];
        v95 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
        v96 = [v95 lastPathComponent];
        v97 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
        [v94 logMessage:v28 fromFile:v96 fromFunction:v97 fromLineNumber:816];

        __int16 v33 = PLLogCommon();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        break;
      case 2287:
        if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13]) {
          goto LABEL_198;
        }
        id v98 = [(PLBasebandEurekaMessage *)self payload];
        v99 = (unsigned char *)[v98 bytes];

        v100 = [MEMORY[0x1E4F28E78] string];
        id v23 = v100;
        if (*v99) {
          v101 = @"Start";
        }
        else {
          v101 = @"Stop";
        }
        [(__CFString *)v100 appendFormat:@"%@", v101];
        v36 = @"State";
        goto LABEL_234;
      case 2288:
        goto LABEL_236;
      default:
        goto LABEL_134;
    }
    goto LABEL_196;
  }
  if (v19 <= 1130)
  {
    if (v19 <= 620)
    {
      uint64_t v20 = (v19 - 530);
      if (v20 <= 0x29)
      {
        if (((1 << (v19 - 18)) & 0x80000000DLL) != 0) {
          goto LABEL_236;
        }
        if (v20 == 41)
        {
          if ([(PLBasebandEurekaMessage *)self header][13] > 2u)
          {
            id v21 = [(PLBasebandEurekaMessage *)self payload];
            uint64_t v22 = [v21 bytes];

            id v23 = [(PLBasebandEurekaMessage *)self stateStringWCDMA:v22];
            v24 = [(PLBasebandEurekaMessage *)self stateStringWCDMA:v22 + 1];
            uint64_t v25 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:*(unsigned __int8 *)(v22 + 2)];
            v26 = [v25 stringValue];

            [(PLBBEurekaEventMsg *)v12 logEventForwardWCDMARRCPrevStateAs:v23 andCurrState:v24 andRate:v26];
LABEL_154:
            [(PLBasebandEurekaMessage *)self setSkip:1];

            goto LABEL_235;
          }
LABEL_155:
          id v164 = [NSString alloc];
          goto LABEL_156;
        }
      }
      if (v19 == 389)
      {
        if ((_BYTE)[(PLBasebandEurekaMessage *)self header][13])
        {
          id v167 = [(PLBasebandEurekaMessage *)self payload];
          v38 = -[PLBasebandEurekaMessage stateStringGSM:](self, "stateStringGSM:", [v167 bytes]);

          [(PLBBEurekaEventMsg *)v12 logEventForwardGSML1StateWith:v38];
          [(PLBasebandEurekaMessage *)self setSkip:1];
          goto LABEL_151;
        }
        goto LABEL_155;
      }
      if (v19 == 424)
      {
        id v55 = [(PLBasebandEurekaMessage *)self payload];
        v38 = -[PLBasebandEurekaMessage cdmaExitString:](self, "cdmaExitString:", [v55 bytes]);

        v39 = (void *)[[NSString alloc] initWithString:v38];
        [(PLBBEurekaEventMsg *)v12 logEventPointCMExitCodeWithState:v39];
        [(PLBasebandEurekaMessage *)self setSkip:1];
        goto LABEL_41;
      }
      goto LABEL_134;
    }
    switch(v19)
    {
      case 621:
      case 622:
        if ([(PLBasebandEurekaMessage *)self header][13] > 3u)
        {
          v129 = [(PLBasebandEurekaMessage *)self eventSystemSelection];
          v130 = [(PLBasebandEurekaMessage *)self actionSystemSelection];
          v131 = [(PLBasebandEurekaMessage *)self stateSystemSelection];
          [(PLBBEurekaEventMsg *)v12 setSDEventActionCodeWith:v129 andSDAction:v130 andSDState:v131];

          id v132 = [(PLBasebandEurekaMessage *)self payload];
          uint64_t v133 = [v132 bytes];
          v134 = (unsigned __int8 *)(v133 + 4);

          switch(*[(PLBasebandEurekaMessage *)self ssaction])
          {
            case 0:
              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:*(unsigned __int16 *)(v133 + 4)];
              v136 = [v135 stringValue];
              v137 = @"timer";
              goto LABEL_205;
            case 1:
              v220 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 4)];
              v221 = [v220 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"band" andWithVal:v221];

              id v222 = [NSString alloc];
              v223 = [(PLBasebandEurekaMessage *)self cellularSystemStringSystemSelection:v133 + 5];
              v224 = (void *)[v222 initWithString:v223];

              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"block_cellular_system" andWithVal:v224];
              v134 = (unsigned __int8 *)(v133 + 8);
              v225 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:*(unsigned __int16 *)(v133 + 6)];
              v226 = [v225 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"CDMA_Channel" andWithVal:v226];

              break;
            case 2:
              v227 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 4)];
              v228 = [v227 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"band" andWithVal:v228];

              v229 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 5)];
              v230 = [v229 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"sys" andWithVal:v230];

              v231 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 6)];
              v232 = [v231 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"is_amps_2nd_cch" andWithVal:v232];

              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 7)];
              v136 = [v135 stringValue];
              v137 = @"max_redirect_delay";
              goto LABEL_205;
            case 3:
              v233 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 4)];
              v234 = [v233 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"band" andWithVal:v234];

              v235 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 5)];
              v236 = [v235 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"acq_mode" andWithVal:v236];

              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:*(unsigned __int16 *)(v133 + 6)];
              v136 = [v135 stringValue];
              v137 = @"channel";
LABEL_205:
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:v137 andWithVal:v136];

              break;
            case 0xB:
              if ([MEMORY[0x1E4F929C0] fullMode])
              {
                v237 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v134];
                v238 = [v237 stringValue];
                [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"plmn1" andWithVal:v238];
              }
              if ([MEMORY[0x1E4F929C0] fullMode])
              {
                v239 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 5)];
                v240 = [v239 stringValue];
                [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"plmn2" andWithVal:v240];
              }
              if ([MEMORY[0x1E4F929C0] fullMode])
              {
                v241 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 6)];
                v242 = [v241 stringValue];
                [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"plmn3" andWithVal:v242];
              }
              v243 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 7)];
              v244 = [v243 stringValue];
              v245 = @"net_sel_mode";
              goto LABEL_214;
            case 0xC:
              v246 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 4)];
              v247 = [v246 stringValue];
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"mode_pref" andWithVal:v247];

              v243 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v133 + 5)];
              v244 = [v243 stringValue];
              v245 = @"srv_domain_pref";
LABEL_214:
              [(PLBBEurekaEventMsg *)v12 addPairWithKey:v245 andWithVal:v244];

              v134 = (unsigned __int8 *)(v133 + 8);
              break;
            default:
              break;
          }
          int v248 = *(unsigned __int16 *)[(PLBasebandEurekaMessage *)self ssevent];
          if (v248 == 906 || v248 == 413)
          {
            v260 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v134];
            v261 = [v260 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"reason" andWithVal:v261];

            v41 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v134];
            v42 = [v41 stringValue];
            v259 = @"term";
          }
          else
          {
            if (v248 != 5) {
              goto LABEL_222;
            }
            v249 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v134];
            v250 = [v249 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"reason" andWithVal:v250];

            v251 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v134[1]];
            v252 = [v251 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"orig_mode" andWithVal:v252];

            v253 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:*((unsigned __int16 *)v134 + 1)];
            v254 = [v253 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"mode_pref" andWithVal:v254];

            v255 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v134 + 1)];
            v256 = [v255 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"band_pref" andWithVal:v256];

            v257 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v134[8]];
            v258 = [v257 stringValue];
            [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"roam_pref" andWithVal:v258];

            v41 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v134[9]];
            v42 = [v41 stringValue];
            v259 = @"hybr_pref";
          }
          [(PLBBEurekaEventMsg *)v12 addPairWithKey:v259 andWithVal:v42];
        }
        else
        {
          id v40 = [NSString alloc];
          v41 = [(PLBasebandEurekaMessage *)self tooShortErrorString];
          v42 = (void *)[v40 initWithString:v41];
          [(PLBBEurekaEventMsg *)v12 setError:v42];
        }

LABEL_222:
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v262 = objc_opt_class();
          v280[0] = MEMORY[0x1E4F143A8];
          v280[1] = 3221225472;
          v280[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_88;
          v280[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v280[4] = v262;
          if (qword_1EBD58230 != -1) {
            dispatch_once(&qword_1EBD58230, v280);
          }
          if (byte_1EBD5820B)
          {
            v263 = [NSString stringWithFormat:@"Decoded SDEventAction/Hybrid"];
            v264 = (void *)MEMORY[0x1E4F929B8];
            v265 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
            v266 = [v265 lastPathComponent];
            v267 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
            [v264 logMessage:v263 fromFile:v266 fromFunction:v267 fromLineNumber:350];

            v268 = PLLogCommon();
            if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v284 = v263;
              _os_log_debug_impl(&dword_1D2690000, v268, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        [(PLBBEurekaEventMsg *)v12 logEventForwardSDEventActionCode];
        goto LABEL_236;
      case 623:
      case 624:
      case 626:
      case 627:
      case 628:
        goto LABEL_134;
      case 625:
        if ([(PLBasebandEurekaMessage *)self header][13] > 2u)
        {
          id v184 = [(PLBasebandEurekaMessage *)self payload];
          uint64_t v185 = [v184 bytes];

          id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedChar:*(unsigned __int8 *)(v185 + 2)];
          uint64_t v54 = [(__CFString *)v23 stringValue];
          goto LABEL_161;
        }
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_198;
        }
        uint64_t v102 = objc_opt_class();
        v279[0] = MEMORY[0x1E4F143A8];
        v279[1] = 3221225472;
        v279[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_115;
        v279[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v279[4] = v102;
        if (qword_1EBD58238 != -1) {
          dispatch_once(&qword_1EBD58238, v279);
        }
        if (!byte_1EBD5820C) {
          goto LABEL_198;
        }
        v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_WCDMA_DRX_CYCLE"];
        v103 = (void *)MEMORY[0x1E4F929B8];
        v104 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
        v105 = [v104 lastPathComponent];
        v106 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
        [v103 logMessage:v28 fromFile:v105 fromFunction:v106 fromLineNumber:540];

        __int16 v33 = PLLogCommon();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        break;
      case 629:
        id v107 = [(PLBasebandEurekaMessage *)self payload];
        uint64_t v108 = [v107 bytes];

        id v23 = [(PLBasebandEurekaMessage *)self convertCMCallOrigPayloadToDictionary:v108];
        id v109 = [NSString alloc];
        v110 = NSString;
        v111 = [(__CFString *)v23 objectForKeyedSubscript:@"callId"];
        v112 = [v110 stringWithFormat:@"%@", v111];
        v69 = (void *)[v109 initWithString:v112];

        id v113 = [NSString alloc];
        v114 = [(__CFString *)v23 objectForKeyedSubscript:@"callType"];
        v72 = (void *)[v113 initWithString:v114];

        id v115 = [NSString alloc];
        v116 = [(__CFString *)v23 objectForKeyedSubscript:@"serviceType"];
        v75 = (void *)[v115 initWithString:v116];

        [(PLBBEurekaEventMsg *)v12 logEventCMCallEventOrigWithId:v69 andCallType:v72 andSrvType:v75];
        goto LABEL_116;
      case 630:
        id v117 = [(PLBasebandEurekaMessage *)self payload];
        uint64_t v118 = [v117 bytes];

        id v23 = [(PLBasebandEurekaMessage *)self convertCMCallConnectPayloadToDictionary:v118];
        id v119 = [NSString alloc];
        v120 = [(__CFString *)v23 objectForKeyedSubscript:@"callId"];
        v69 = (void *)[v119 initWithString:v120];

        id v121 = [NSString alloc];
        v122 = [(__CFString *)v23 objectForKeyedSubscript:@"callType"];
        v72 = (void *)[v121 initWithString:v122];

        id v123 = [NSString alloc];
        v124 = [(__CFString *)v23 objectForKeyedSubscript:@"systemMode"];
        v75 = (void *)[v123 initWithString:v124];

        [(PLBBEurekaEventMsg *)v12 logEventCMCallEventConnWithId:v69 andCallType:v72 andSysMode:v75];
LABEL_116:
        [(PLBasebandEurekaMessage *)self setSkip:1];
        goto LABEL_117;
      case 631:
        id v125 = [(PLBasebandEurekaMessage *)self payload];
        v126 = (unsigned __int8 *)[v125 bytes];

        v127 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v126[1]);
        v128 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", *v126);
        [(PLBBEurekaEventMsg *)v12 logEventCMCallEventEndWithId:v127 andNumCalls:v128];
        [(PLBasebandEurekaMessage *)self setSkip:1];

        goto LABEL_236;
      default:
        if (v19 != 1130) {
          goto LABEL_134;
        }
        if ([(PLBasebandEurekaMessage *)self header][13] <= 2u) {
          goto LABEL_198;
        }
        id v89 = [(PLBasebandEurekaMessage *)self payload];
        v90 = (unsigned __int8 *)[v89 bytes];

        v91 = [(PLBasebandEurekaMessage *)self stateStringHSDPA:v90];
        [(PLBBEurekaEventMsg *)v12 addPairWithKey:@"HS_Operation" andWithVal:v91];

        id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedShort:*v90];
        v69 = [(__CFString *)v23 stringValue];
        v92 = @"PSC_HS_Cell";
        goto LABEL_170;
    }
    goto LABEL_196;
  }
  if (v19 <= 1549)
  {
    if (v19 <= 1495)
    {
      if ((v19 - 1131) < 2 || v19 == 1210) {
        goto LABEL_236;
      }
      goto LABEL_134;
    }
    if ((v19 - 1496) < 2) {
      goto LABEL_236;
    }
    if (v19 != 1549) {
      goto LABEL_134;
    }
    if ((_BYTE)[(PLBasebandEurekaMessage *)self header][13])
    {
      id v23 = [(PLBasebandEurekaMessage *)self payload];
      uint64_t v54 = [(PLBasebandEurekaMessage *)self scanTypeStartWCDMA:[(__CFString *)v23 bytes]];
      goto LABEL_161;
    }
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_198;
    }
    uint64_t v198 = objc_opt_class();
    v278[0] = MEMORY[0x1E4F143A8];
    v278[1] = 3221225472;
    v278[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_124;
    v278[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v278[4] = v198;
    if (qword_1EBD58240 != -1) {
      dispatch_once(&qword_1EBD58240, v278);
    }
    if (!byte_1EBD5820D) {
      goto LABEL_198;
    }
    v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_WCDMA_BPLMN_SCAN_START"];
    v199 = (void *)MEMORY[0x1E4F929B8];
    v200 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
    v201 = [v200 lastPathComponent];
    v202 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
    [v199 logMessage:v28 fromFile:v201 fromFunction:v202 fromLineNumber:555];

    __int16 v33 = PLLogCommon();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_197;
    }
    *(_DWORD *)buf = 138412290;
    v284 = v28;
LABEL_196:
    _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_197:

    goto LABEL_198;
  }
  if (v19 <= 1614)
  {
    if (v19 != 1550)
    {
      if (v19 != 1606)
      {
        if (v19 != 1614) {
          goto LABEL_134;
        }
        if ([(PLBasebandEurekaMessage *)self header][13] <= 1u)
        {
          if (![MEMORY[0x1E4F929C0] debugEnabled]) {
            goto LABEL_198;
          }
          uint64_t v49 = objc_opt_class();
          v276[0] = MEMORY[0x1E4F143A8];
          v276[1] = 3221225472;
          v276[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_155;
          v276[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v276[4] = v49;
          if (qword_1EBD58250 != -1) {
            dispatch_once(&qword_1EBD58250, v276);
          }
          if (!byte_1EBD5820F) {
            goto LABEL_198;
          }
          v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_LTE_RRC_PAGING_DRX_CYCLE"];
          v50 = (void *)MEMORY[0x1E4F929B8];
          v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
          v52 = [v51 lastPathComponent];
          v53 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
          [v50 logMessage:v28 fromFile:v52 fromFunction:v53 fromLineNumber:648];

          __int16 v33 = PLLogCommon();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_197;
          }
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
        }
        id v196 = [(PLBasebandEurekaMessage *)self payload];
        v197 = (unsigned __int16 *)[v196 bytes];

        id v23 = (__CFString *)[objc_alloc(NSNumber) initWithUnsignedShort:*v197];
        v69 = [(__CFString *)v23 stringValue];
        v92 = @"drx_cycle";
        goto LABEL_170;
      }
      int v163 = [(PLBasebandEurekaMessage *)self header][13];
      id v164 = [NSString alloc];
      if (!v163)
      {
LABEL_156:
        v38 = [(PLBasebandEurekaMessage *)self tooShortErrorString];
        v39 = (void *)[v164 initWithString:v38];
        [(PLBBEurekaEventMsg *)v12 setError:v39];
        goto LABEL_41;
      }
      id v165 = [(PLBasebandEurekaMessage *)self payload];
      v166 = -[PLBasebandEurekaMessage stateStringLTE:](self, "stateStringLTE:", [v165 bytes]);
      id v23 = (__CFString *)[v164 initWithString:v166];

      [(PLBBEurekaEventMsg *)v12 logEventForwardLTERRCStateAs:v23];
      [(PLBasebandEurekaMessage *)self setSkip:1];
LABEL_235:

      goto LABEL_236;
    }
    if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13])
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_198;
      }
      uint64_t v203 = objc_opt_class();
      v277[0] = MEMORY[0x1E4F143A8];
      v277[1] = 3221225472;
      v277[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_130;
      v277[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v277[4] = v203;
      if (qword_1EBD58248 != -1) {
        dispatch_once(&qword_1EBD58248, v277);
      }
      if (!byte_1EBD5820E) {
        goto LABEL_198;
      }
      v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_WCDMA_BPLMN_SCAN_ENDED"];
      v204 = (void *)MEMORY[0x1E4F929B8];
      v205 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
      v206 = [v205 lastPathComponent];
      v207 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
      [v204 logMessage:v28 fromFile:v206 fromFunction:v207 fromLineNumber:569];

      __int16 v33 = PLLogCommon();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_197;
      }
      *(_DWORD *)buf = 138412290;
      v284 = v28;
      goto LABEL_196;
    }
    id v23 = [(PLBasebandEurekaMessage *)self payload];
    uint64_t v54 = [(PLBasebandEurekaMessage *)self scanTypeStopWCDMA:[(__CFString *)v23 bytes]];
LABEL_161:
    v69 = (void *)v54;
    v92 = @"scan_type";
LABEL_170:
    [(PLBBEurekaEventMsg *)v12 addPairWithKey:v92 andWithVal:v69];
LABEL_171:

    goto LABEL_235;
  }
  if (v19 > 1969)
  {
    if (v19 == 1970)
    {
      if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13])
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_198;
        }
        uint64_t v208 = objc_opt_class();
        v275[0] = MEMORY[0x1E4F143A8];
        v275[1] = 3221225472;
        v275[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_185;
        v275[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v275[4] = v208;
        if (qword_1EBD58258 != -1) {
          dispatch_once(&qword_1EBD58258, v275);
        }
        if (!byte_1EBD58210) {
          goto LABEL_198;
        }
        v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_LTE_RRC_PLMN_SEARCH_START"];
        v209 = (void *)MEMORY[0x1E4F929B8];
        v210 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
        v211 = [v210 lastPathComponent];
        v212 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
        [v209 logMessage:v28 fromFile:v211 fromFunction:v212 fromLineNumber:735];

        __int16 v33 = PLLogCommon();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        goto LABEL_196;
      }
    }
    else
    {
      if (v19 != 1971) {
        goto LABEL_134;
      }
      if (!(_BYTE)[(PLBasebandEurekaMessage *)self header][13])
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_198;
        }
        uint64_t v58 = objc_opt_class();
        v274[0] = MEMORY[0x1E4F143A8];
        v274[1] = 3221225472;
        v274[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_194;
        v274[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v274[4] = v58;
        if (qword_1EBD58260 != -1) {
          dispatch_once(&qword_1EBD58260, v274);
        }
        if (!byte_1EBD58211) {
          goto LABEL_198;
        }
        v28 = [NSString stringWithFormat:@"Error: bad length PL_EVENT_LTE_RRC_PLMN_SEARCH_ENDED"];
        v59 = (void *)MEMORY[0x1E4F929B8];
        v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
        v61 = [v60 lastPathComponent];
        v62 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
        [v59 logMessage:v28 fromFile:v61 fromFunction:v62 fromLineNumber:750];

        __int16 v33 = PLLogCommon();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        goto LABEL_196;
      }
    }
    id v168 = [(PLBasebandEurekaMessage *)self payload];
    v38 = -[PLBasebandEurekaMessage iratStringLTE:](self, "iratStringLTE:", [v168 bytes]);

    v48 = @"RAT";
LABEL_150:
    [(PLBBEurekaEventMsg *)v12 addPairWithKey:v48 andWithVal:v38];
    goto LABEL_151;
  }
  if (v19 == 1615) {
    goto LABEL_236;
  }
  if (v19 == 1924)
  {
    if ([(PLBasebandEurekaMessage *)self header][13] <= 0xFu)
    {
LABEL_198:
      id v23 = [(PLBasebandEurekaMessage *)self tooShortErrorString];
      [(PLBBEurekaEventMsg *)v12 setError:v23];
      goto LABEL_235;
    }
    id v34 = [(PLBasebandEurekaMessage *)self payload];
    uint64_t v35 = [v34 bytes];

    id v23 = [(PLBasebandEurekaMessage *)self stateStringHSPAPLUS_DC:v35 + 8];
    v36 = @"Action";
LABEL_234:
    [(PLBBEurekaEventMsg *)v12 addPairWithKey:v36 andWithVal:v23];
    goto LABEL_235;
  }
LABEL_134:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v156 = objc_opt_class();
    v269[0] = MEMORY[0x1E4F143A8];
    v269[1] = 3221225472;
    v269[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_284;
    v269[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v269[4] = v156;
    if (qword_1EBD58288 != -1) {
      dispatch_once(&qword_1EBD58288, v269);
    }
    if (byte_1EBD58216)
    {
      v157 = [NSString stringWithFormat:@"Eureka Msg not processed"];
      v158 = (void *)MEMORY[0x1E4F929B8];
      v159 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m"];
      v160 = [v159 lastPathComponent];
      v161 = [NSString stringWithUTF8String:"-[PLBasebandEurekaMessage logWithLogger:]"];
      [v158 logMessage:v157 fromFile:v160 fromFunction:v161 fromLineNumber:955];

      v162 = PLLogCommon();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v284 = v157;
        _os_log_debug_impl(&dword_1D2690000, v162, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBEurekaEventMsg *)v12 logEventNoneEventNotProcessed];
LABEL_236:
  if (![(PLBasebandEurekaMessage *)self skip]) {
    [(PLBBEurekaEventMsg *)v12 logEventForwardBBEurekaEventMsgLite];
  }
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820A = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_88(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820B = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_115(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820C = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_124(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820D = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_130(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820E = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_155(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5820F = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_185(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58210 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_194(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58211 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_203(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58212 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_212(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58213 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_233(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58214 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_257(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58215 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_284(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58216 = result;
  return result;
}

- (unsigned)eventCode
{
  return [(PLBasebandEurekaMessage *)self header][1];
}

- (id)eventSystemSelection
{
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int16 *)[(PLBasebandEurekaMessage *)self ssevent];
  return (id)[v2 numberWithUnsignedShort:v3];
}

- (id)eventStringACC:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 3)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_1E692BDC8[(char)v3];
  }
  return v4;
}

- (id)eventStringOOS:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 4)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_1E692BDE0[(char)v3];
  }
  return v4;
}

- (id)actionSystemSelection
{
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)[(PLBasebandEurekaMessage *)self ssaction];
  return (id)[v2 numberWithUnsignedChar:v3];
}

- (id)stateSystemSelection
{
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)[(PLBasebandEurekaMessage *)self ssstate];
  return (id)[v2 numberWithUnsignedChar:v3];
}

- (id)stateStringGSM:(char *)a3
{
  int v4 = *a3;
  if (v4 > 39)
  {
    if (v4 <= 49)
    {
      if (v4 == 40)
      {
        uint64_t v5 = @"L1_RANDOM_ACCESS_MODE";
        goto LABEL_23;
      }
      if (v4 == 41)
      {
        uint64_t v5 = @"L1_PACKET_ACCESS_MODE";
        goto LABEL_23;
      }
    }
    else
    {
      switch(v4)
      {
        case '2':
          uint64_t v5 = @"L1_DEDICATED_MODE";
          goto LABEL_23;
        case '3':
          uint64_t v5 = @"L1_TRANSFER_MODE";
          goto LABEL_23;
        case '4':
          uint64_t v5 = @"L1_DTM_MODE";
          goto LABEL_23;
      }
    }
LABEL_22:
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = @"L1_INACTIVE_MODE";
    switch(v4)
    {
      case 10:
        break;
      case 11:
        uint64_t v5 = @"L1_NULL_MODE";
        break;
      case 12:
        uint64_t v5 = @"L1_SUSPEND_MODE";
        break;
      case 13:
        uint64_t v5 = @"L1_RESET_MODE";
        break;
      case 14:
        uint64_t v5 = @"L1_WTOG_BPLMN_MODE";
        break;
      case 20:
        uint64_t v5 = @"L1_FIND_BCCH";
        break;
      case 21:
        uint64_t v5 = @"L1_FIND_SCH";
        break;
      case 30:
        uint64_t v5 = @"L1_IDLE_MODE";
        break;
      case 31:
        uint64_t v5 = @"L1_GPRS_IDLE_MODE";
        break;
      default:
        goto LABEL_22;
    }
  }
LABEL_23:
  return v5;
}

- (id)stateStringLTE:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 8)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BE00[(char)v3];
  }
  return v4;
}

- (id)stateStringWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 6)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BE40[(char)v3];
  }
  return v4;
}

- (id)stateStringUTRANL1:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xE)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BE70[(char)v3];
  }
  return v4;
}

- (id)stateStringHSDPA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 4)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BEE0[(char)v3];
  }
  return v4;
}

- (id)stateStringHSUPA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 4)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BF00[(char)v3];
  }
  return v4;
}

- (id)stateStringHSPAPLUS_DC:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 5)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BF20[(char)v3];
  }
  return v4;
}

- (id)stateStringMotion:(char *)a3
{
  int v3 = *a3;
  if (v3 > 15)
  {
    if (v3 != 16)
    {
      if (v3 == 17)
      {
        int v4 = @"Driving";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    int v4 = @"Pedestrian";
  }
  else
  {
    if (v3)
    {
      if (v3 == 1)
      {
        int v4 = @"Moving";
        goto LABEL_11;
      }
LABEL_8:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    int v4 = @"Stationary";
  }
LABEL_11:
  return v4;
}

- (id)stateStringACC:(char *)a3
{
  int v3 = *a3;
  if (v3)
  {
    if (v3 == 1)
    {
      int v4 = @"AVOID";
    }
    else
    {
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"ACCESS";
  }
  return v4;
}

- (id)stateStringOOS:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 6)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692BF48[(char)v3];
  }
  return v4;
}

- (id)payloadString
{
  unsigned int v3 = 0;
  int v4 = (int)[(PLBasebandEurekaMessage *)self header][1];
  if (v4 <= 1603)
  {
    if (v4 <= 1009)
    {
      if (v4 > 530)
      {
        BOOL v16 = (v4 - 531) > 0x25 || ((1 << (v4 - 19)) & 0x2200000081) == 0;
        if (v16 && v4 != 635 && v4 != 897) {
          goto LABEL_69;
        }
      }
      else
      {
        BOOL v7 = (v4 - 415) > 0x1F || ((1 << (v4 + 97)) & 0xC00C0007) == 0;
        if (v7 && v4 != 275 && v4 != 311) {
          goto LABEL_69;
        }
      }
      goto LABEL_68;
    }
    if (v4 <= 1209)
    {
      if ((v4 - 1010) > 0x3E || ((1 << (v4 + 14)) & 0x4000000004000009) == 0)
      {
        unsigned int v10 = v4 - 1076;
        if (v10 > 0x2D || ((1 << v10) & 0x380000000001) == 0) {
          goto LABEL_69;
        }
      }
      goto LABEL_68;
    }
    if ((v4 - 1210) <= 0x11 && ((1 << (v4 + 70)) & 0x36001) != 0) {
      goto LABEL_68;
    }
    unsigned int v6 = v4 - 1465;
  }
  else
  {
    if (v4 <= 2175)
    {
      if (v4 > 1988)
      {
        unsigned int v12 = v4 - 1989;
        BOOL v13 = v12 > 0x28;
        uint64_t v14 = (1 << v12) & 0x18000060003;
        if (v13 || v14 == 0) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
      BOOL v5 = (v4 - 1889) > 0x2A || ((1 << (v4 - 97)) & 0x60800000003) == 0;
      if (v5 && ((v4 - 1604) > 9 || ((1 << (v4 - 68)) & 0x219) == 0))
      {
        unsigned int v6 = v4 - 1807;
        goto LABEL_44;
      }
LABEL_68:
      int v19 = NSString;
      uint64_t v20 = [(PLBasebandEurekaMessage *)self payload];
      unsigned int v3 = [v19 stringWithFormat:@"%@", v20];

      goto LABEL_69;
    }
    if (v4 > 2475)
    {
      if (((v4 - 2476) > 0xA || ((1 << (v4 + 84)) & 0x607) == 0) && v4 != 5184) {
        goto LABEL_69;
      }
      goto LABEL_68;
    }
    if ((v4 - 2244) <= 0x2E && ((1 << (v4 + 60)) & 0x41000C030003) != 0) {
      goto LABEL_68;
    }
    unsigned int v6 = v4 - 2176;
  }
LABEL_44:
  if (v6 < 2) {
    goto LABEL_68;
  }
LABEL_69:
  return v3;
}

- (id)convertCMCallConnectPayloadToDictionary:(_CMCallConnectPayload *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSString alloc];
  BOOL v7 = [NSNumber numberWithUnsignedChar:a3->var0];
  v8 = (void *)[v6 initWithFormat:@"%@", v7];
  [v5 setObject:v8 forKeyedSubscript:@"callId"];

  v9 = [(PLBasebandEurekaMessage *)self callTypeString:&a3->var1];
  [v5 setObject:v9 forKeyedSubscript:@"callType"];

  switch(a3->var2)
  {
    case 0u:
      unsigned int v10 = @"NO_SRV";
      goto LABEL_15;
    case 1u:
      unsigned int v10 = @"AMPS";
      goto LABEL_15;
    case 2u:
      unsigned int v10 = @"CDMA";
      goto LABEL_15;
    case 3u:
      v11 = kPLGSM;
      goto LABEL_12;
    case 4u:
      unsigned int v10 = @"HDR";
      goto LABEL_15;
    case 5u:
      v11 = kPLWCDMA;
      goto LABEL_12;
    case 6u:
      unsigned int v10 = @"GPS";
      goto LABEL_15;
    case 7u:
      unsigned int v10 = @"GW";
      goto LABEL_15;
    case 8u:
      unsigned int v10 = @"WLAN";
      goto LABEL_15;
    case 9u:
      v11 = kPLLTE;
LABEL_12:
      unsigned int v10 = *v11;
      goto LABEL_15;
    case 0xAu:
      unsigned int v10 = @"GWL";
      goto LABEL_15;
    case 0xBu:
      unsigned int v10 = @"TDS";
LABEL_15:
      [v5 setObject:v10 forKeyedSubscript:@"systemMode"];
      break;
    default:
      BOOL v13 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:a3->var2];
      [v5 setObject:v13 forKeyedSubscript:@"systemMode"];

      break;
  }
  return v5;
}

- (id)convertCMCallConnectV2PayloadToDictionary:(_NewCMCallConnectPayload *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSString alloc];
  BOOL v7 = [NSNumber numberWithUnsignedChar:a3->var0];
  v8 = (void *)[v6 initWithFormat:@"%@", v7];
  [v5 setObject:v8 forKeyedSubscript:@"callId"];

  v9 = [(PLBasebandEurekaMessage *)self callTypeString:&a3->var1];
  [v5 setObject:v9 forKeyedSubscript:@"callType"];

  switch(a3->var2)
  {
    case 0u:
      unsigned int v10 = @"NO_SRV";
      goto LABEL_14;
    case 1u:
      unsigned int v10 = @"AMPS";
      goto LABEL_14;
    case 2u:
      unsigned int v10 = @"CDMA";
      goto LABEL_14;
    case 3u:
      unsigned int v10 = @"GSM";
      goto LABEL_14;
    case 4u:
      unsigned int v10 = @"HDR";
      goto LABEL_14;
    case 5u:
      unsigned int v10 = @"WCDMA";
      goto LABEL_14;
    case 6u:
      unsigned int v10 = @"GPS";
      goto LABEL_14;
    case 7u:
      unsigned int v10 = @"GW";
      goto LABEL_14;
    case 8u:
      unsigned int v10 = @"WLAN";
      goto LABEL_14;
    case 9u:
      unsigned int v10 = @"LTE";
      goto LABEL_14;
    case 0xAu:
      unsigned int v10 = @"GWL";
      goto LABEL_14;
    case 0xBu:
      unsigned int v10 = @"TDS";
LABEL_14:
      [v5 setObject:v10 forKeyedSubscript:@"systemMode"];
      break;
    default:
      v15 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:a3->var2];
      [v5 setObject:v15 forKeyedSubscript:@"systemMode"];

      break;
  }
  id v11 = [NSString alloc];
  unsigned int v12 = [NSNumber numberWithUnsignedChar:a3->var3];
  BOOL v13 = (void *)[v11 initWithFormat:@"%@", v12];
  [v5 setObject:v13 forKeyedSubscript:@"clientId"];

  return v5;
}

- (id)convertCMCallOrigPayloadToDictionary:(_CMCallOrigPayload *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithUnsignedChar:a3->var0];
  [v5 setObject:v6 forKeyedSubscript:@"callId"];

  BOOL v7 = [(PLBasebandEurekaMessage *)self callTypeString:&a3->var1];
  [v5 setObject:v7 forKeyedSubscript:@"callType"];

  switch(a3->var2)
  {
    case 0u:
      v8 = @"AMPS";
      goto LABEL_26;
    case 1u:
      v8 = @"HDR";
      goto LABEL_26;
    case 2u:
      v8 = @"CDMA_SPECIFIC";
      goto LABEL_26;
    case 3u:
      v8 = @"CDMA_AUTOMATIC";
      goto LABEL_26;
    case 4u:
      v8 = @"AUTOMATIC";
      goto LABEL_26;
    case 5u:
      v8 = @"CDMA_HDR";
      goto LABEL_26;
    case 6u:
      v8 = @"GSM_WCDMA";
      goto LABEL_26;
    case 7u:
      unsigned int v10 = kPLWCDMA;
      goto LABEL_15;
    case 8u:
      unsigned int v10 = kPLGSM;
      goto LABEL_15;
    case 9u:
      v8 = @"WLAN";
      goto LABEL_26;
    case 0xAu:
      v8 = @"NON_AUTOMATIC";
      goto LABEL_26;
    case 0xBu:
      unsigned int v10 = kPLLTE;
LABEL_15:
      v8 = *v10;
      goto LABEL_26;
    case 0xCu:
      v8 = @"GSM_WCDMA_LTE";
      goto LABEL_26;
    case 0xDu:
      v8 = @"HDR_MORE_PREF";
      goto LABEL_26;
    case 0xEu:
      v8 = @"TDS";
      goto LABEL_26;
    case 0xFu:
      v8 = @"TDS_GSM";
      goto LABEL_26;
    case 0x10u:
      v8 = @"TDS_GSM_LTE";
      goto LABEL_26;
    case 0x11u:
      v8 = @"TDS_GSM_WCDMA_LTE";
      goto LABEL_26;
    case 0x12u:
      v8 = @"TDS_GSM_WCDMA";
      goto LABEL_26;
    case 0x13u:
      v8 = @"TDS_LTE";
      goto LABEL_26;
    case 0x14u:
      v8 = @"CS_ONLY";
      goto LABEL_26;
    case 0x15u:
      v8 = @"PS_ONLY";
LABEL_26:
      [v5 setObject:v8 forKeyedSubscript:@"serviceType"];
      break;
    default:
      v9 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:a3->var2];
      [v5 setObject:v9 forKeyedSubscript:@"serviceType"];

      break;
  }
  return v5;
}

- (id)convertCMCallOrigV2PayloadToDictionary:(_NewCMCallOrigPayload *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithUnsignedChar:a3->var0];
  [v5 setObject:v6 forKeyedSubscript:@"callId"];

  BOOL v7 = [(PLBasebandEurekaMessage *)self callTypeString:&a3->var1];
  [v5 setObject:v7 forKeyedSubscript:@"callType"];

  switch(a3->var2)
  {
    case 0u:
      v8 = @"AMPS";
      goto LABEL_25;
    case 1u:
      v8 = @"HDR";
      goto LABEL_25;
    case 2u:
      v8 = @"CDMA_SPECIFIC";
      goto LABEL_25;
    case 3u:
      v8 = @"CDMA_AUTOMATIC";
      goto LABEL_25;
    case 4u:
      v8 = @"AUTOMATIC";
      goto LABEL_25;
    case 5u:
      v8 = @"CDMA_HDR";
      goto LABEL_25;
    case 6u:
      v8 = @"GSM_WCDMA";
      goto LABEL_25;
    case 7u:
      v8 = @"WCDMA";
      goto LABEL_25;
    case 8u:
      v8 = @"GSM";
      goto LABEL_25;
    case 9u:
      v8 = @"WLAN";
      goto LABEL_25;
    case 0xAu:
      v8 = @"NON_AUTOMATIC";
      goto LABEL_25;
    case 0xBu:
      v8 = @"LTE";
      goto LABEL_25;
    case 0xCu:
      v8 = @"GSM_WCDMA_LTE";
      goto LABEL_25;
    case 0xDu:
      v8 = @"HDR_MORE_PREF";
      goto LABEL_25;
    case 0xEu:
      v8 = @"TDS";
      goto LABEL_25;
    case 0xFu:
      v8 = @"TDS_GSM";
      goto LABEL_25;
    case 0x10u:
      v8 = @"TDS_GSM_LTE";
      goto LABEL_25;
    case 0x11u:
      v8 = @"TDS_GSM_WCDMA_LTE";
      goto LABEL_25;
    case 0x12u:
      v8 = @"TDS_GSM_WCDMA";
      goto LABEL_25;
    case 0x13u:
      v8 = @"TDS_LTE";
      goto LABEL_25;
    case 0x14u:
      v8 = @"CS_ONLY";
      goto LABEL_25;
    case 0x15u:
      v8 = @"PS_ONLY";
LABEL_25:
      [v5 setObject:v8 forKeyedSubscript:@"serviceType"];
      break;
    default:
      v9 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:a3->var2];
      [v5 setObject:v9 forKeyedSubscript:@"serviceType"];

      break;
  }
  id v10 = [NSString alloc];
  id v11 = [NSNumber numberWithUnsignedChar:a3->var3];
  unsigned int v12 = (void *)[v10 initWithFormat:@"%@", v11];
  [v5 setObject:v12 forKeyedSubscript:@"clientId"];

  return v5;
}

- (id)cdmaExitString:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 < 0x2F && ((0x7FEE4FFFCFF3uLL >> v3) & 1) != 0)
  {
    int v4 = off_1E692BF78[(char)v3];
  }
  else
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)soCallTypeString:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 4)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C0F0[(char)v3];
  }
  return v4;
}

- (id)callTypeString:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xF)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C110[(char)v3];
  }
  return v4;
}

- (id)termStringSystemSelection:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xC)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C188[(char)v3];
  }
  return v4;
}

- (id)cellularSystemStringSystemSelection:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 8)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C1E8[(char)v3];
  }
  return v4;
}

- (id)establishmentCauseStringWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0x14)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C228[(char)v3];
  }
  return v4;
}

- (id)releaseCauseStringWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0x18)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C2C8[(char)v3];
  }
  return v4;
}

- (id)pagingTypeWCDMA:(char *)a3
{
  int v3 = *a3;
  if (v3)
  {
    if (v3 == 1)
    {
      int v4 = @"RRCLOG_PAGING_TYPE_2";
    }
    else
    {
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"RRCLOG_PAGING_TYPE_1";
  }
  return v4;
}

- (id)pagingCauseWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 8)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C388[(char)v3];
  }
  return v4;
}

- (id)scanTypeStartWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 3)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C3C8[(char)v3];
  }
  return v4;
}

- (id)scanTypeStopWCDMA:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 3)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C3E0[(char)v3];
  }
  return v4;
}

- (id)searchPhaseStringPSSI:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 6)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C3F8[(char)v3];
  }
  return v4;
}

- (id)ratStringPSSI:(char *)a3
{
  switch(*a3)
  {
    case 0:
      unsigned int v3 = kPLGSM;
      goto LABEL_7;
    case 1:
      unsigned int v3 = kPLUMTS;
      goto LABEL_7;
    case 2:
      unsigned int v3 = kPLLTE;
      goto LABEL_7;
    case 3:
      unsigned int v3 = kPLUTRAN;
LABEL_7:
      int v4 = *v3;
      break;
    default:
      int v4 = [(PLBasebandEurekaMessage *)self stringForUnknownBytes:*a3];
      break;
  }
  return v4;
}

- (id)procedureStringPSSI:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xB)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C428[(char)v3];
  }
  return v4;
}

- (id)estCauseLTE:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 5)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C480[(char)v3];
  }
  return v4;
}

- (id)relCauseLTE:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xB)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C4A8[(char)v3];
  }
  return v4;
}

- (id)iratHOStringLTE:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 5)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C500[(char)v3];
  }
  return v4;
}

- (id)iratStringLTE:(char *)a3
{
  unsigned int v3 = @"CDMA_HRPD";
  switch(*a3)
  {
    case 0:
      break;
    case 1:
      unsigned int v3 = @"CDMA_1X";
      break;
    case 2:
      int v4 = kPLGSM;
      goto LABEL_7;
    case 3:
      int v4 = kPLWCDMA;
      goto LABEL_7;
    case 4:
      int v4 = kPLLTE;
LABEL_7:
      unsigned int v3 = *v4;
      break;
    case 5:
      unsigned int v3 = @"TDS";
      break;
    default:
      unsigned int v3 = [@"CDMA_HRPD" stringForUnknownBytes:*a3];
      break;
  }
  return v3;
}

- (id)smgmmEventType:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0xB)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C528[(char)v3];
  }
  return v4;
}

- (id)cellUpdateCause:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 8)
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = off_1E692C580[(char)v3];
  }
  return v4;
}

- (id)stringForUnknownBytes:(unsigned int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"?-(0x%x/%u)", *(void *)&a3, *(void *)&a3);
}

- (id)tooShortErrorString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"short_length!(%d)", -[PLBasebandEurekaMessage header](self, "header")[13]);
}

- (_PLBasebandEventHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandEventHeader *)a3
{
  self->_header = a3;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPayload:(id)a3
{
}

- (_PLBasebandSystemSelectionEvent)ssevent
{
  return self->_ssevent;
}

- (void)setSsevent:(_PLBasebandSystemSelectionEvent *)a3
{
  self->_ssevent = a3;
}

- (char)ssaction
{
  return self->_ssaction;
}

- (void)setSsaction:(char *)a3
{
  self->_ssaction = a3;
}

- (char)ssstate
{
  return self->_ssstate;
}

- (void)setSsstate:(char *)a3
{
  self->_ssstate = a3;
}

- (unsigned)skip
{
  return self->_skip;
}

- (void)setSkip:(unsigned __int8)a3
{
  self->_skip = a3;
}

- (void).cxx_destruct
{
}

@end