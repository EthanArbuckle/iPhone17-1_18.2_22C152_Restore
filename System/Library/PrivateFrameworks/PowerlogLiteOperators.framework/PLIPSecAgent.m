@interface PLIPSecAgent
+ (id)entryEventPointDefinitionIPSecWake;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (int)ipsecSocket;
- (void)initIPSecKEvent;
- (void)logEventPointIPSecWake;
- (void)setIpsecSocket:(int)a3;
@end

@implementation PLIPSecAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLIPSecAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"IPSecWake";
  objc_super v2 = [a1 entryEventPointDefinitionIPSecWake];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionIPSecWake
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F03C0;
  v20[1] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"wakeUUID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v18[0] = v14;
  v17[1] = @"PID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v18[1] = v4;
  v17[2] = @"ProcessName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v18[2] = v6;
  v17[3] = @"seqNo";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v18[3] = v8;
  v17[4] = @"spi";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

- (void)initIPSecKEvent
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  self->_uintptr_t ipsecSocket = -1;
  int v3 = socket(32, 3, 1);
  self->_uintptr_t ipsecSocket = v3;
  if (v3 == -1)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v12;
      if (qword_1EBD5BC60 != -1) {
        dispatch_once(&qword_1EBD5BC60, v50);
      }
      if (_MergedGlobals_83)
      {
        v13 = [NSString stringWithFormat:@"socket(PF_SYSTEM, SOCK_RAW, SYSPROTO_EVENT) error"];
        v14 = (void *)MEMORY[0x1E4F929B8];
        v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:72];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          v42 = buf;
          goto LABEL_40;
        }
LABEL_14:
      }
    }
  }
  else
  {
    int v49 = 1;
    if (ioctl(v3, 0x8004667EuLL, &v49))
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_22;
      }
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_36;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD5BC68 != -1) {
        dispatch_once(&qword_1EBD5BC68, block);
      }
      if (!byte_1EBD5BC51) {
        goto LABEL_22;
      }
      v5 = [NSString stringWithFormat:@"ioctl(FIONBIO) error"];
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:79];

      v10 = PLLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        close(self->_ipsecSocket);
        return;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      v11 = buf;
LABEL_42:
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", v11, 0xCu);
      goto LABEL_21;
    }
    *(void *)buf = 0x100000001;
    *(_DWORD *)&buf[8] = 13;
    int v19 = ioctl(self->_ipsecSocket, 0x800C6502uLL, buf);
    int v20 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v19)
    {
      if (!v20) {
        goto LABEL_22;
      }
      uint64_t v21 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_42;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v21;
      if (qword_1EBD5BC70 != -1) {
        dispatch_once(&qword_1EBD5BC70, v47);
      }
      if (!byte_1EBD5BC52) {
        goto LABEL_22;
      }
      v5 = [NSString stringWithFormat:@"ioctl(SIOCSKEVFILT) error"];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]"];
      [v22 logMessage:v5 fromFile:v24 fromFunction:v25 fromLineNumber:89];

      v10 = PLLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)v51 = 138412290;
      v52 = v5;
      v11 = v51;
      goto LABEL_42;
    }
    if (v20)
    {
      uint64_t v26 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_48;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v26;
      if (qword_1EBD5BC78 != -1) {
        dispatch_once(&qword_1EBD5BC78, v46);
      }
      if (byte_1EBD5BC53)
      {
        v27 = objc_msgSend(NSString, "stringWithFormat:", @"ipsec socket number %d", self->_ipsecSocket);
        v28 = (void *)MEMORY[0x1E4F929B8];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
        v30 = [v29 lastPathComponent];
        v31 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:95];

        v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412290;
          v52 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", v51, 0xCu);
        }
      }
    }
    uintptr_t ipsecSocket = self->_ipsecSocket;
    v34 = [(PLOperator *)self workQueue];
    dispatch_source_t v35 = dispatch_source_create(MEMORY[0x1E4F14478], ipsecSocket, 0, v34);
    v36 = (void *)qword_1EBD5BC80;
    qword_1EBD5BC80 = (uint64_t)v35;

    if (qword_1EBD5BC80)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_52;
      handler[3] = &unk_1E692A250;
      handler[4] = self;
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_1EBD5BC80, handler);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_56;
      v44[3] = &unk_1E692A250;
      v44[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)qword_1EBD5BC80, v44);
      dispatch_resume((dispatch_object_t)qword_1EBD5BC80);
      return;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v37 = objc_opt_class();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_63;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v37;
      if (qword_1EBD5BC98 != -1) {
        dispatch_once(&qword_1EBD5BC98, v43);
      }
      if (byte_1EBD5BC56)
      {
        v13 = [NSString stringWithFormat:@"ipsecsrc is invalid"];
        v38 = (void *)MEMORY[0x1E4F929B8];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
        v40 = [v39 lastPathComponent];
        v41 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]"];
        [v38 logMessage:v13 fromFile:v40 fromFunction:v41 fromLineNumber:110];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412290;
          v52 = v13;
          v42 = v51;
LABEL_40:
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", v42, 0xCu);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_83 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_36(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC51 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_42(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC52 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_48(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC53 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_52(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD5BC88 != -1) {
      dispatch_once(&qword_1EBD5BC88, block);
    }
    if (byte_1EBD5BC54)
    {
      int v3 = [NSString stringWithFormat:@"ipsec cancel event!!!!"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:101];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return close([*(id *)(a1 + 32) ipsecSocket]);
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC54 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_56(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2_57;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD5BC90 != -1) {
      dispatch_once(&qword_1EBD5BC90, block);
    }
    if (byte_1EBD5BC55)
    {
      int v3 = [NSString stringWithFormat:@"got ipsec event!!!!"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLIPSecAgent initIPSecKEvent]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:105];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return [*(id *)(a1 + 32) logEventPointIPSecWake];
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2_57(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC55 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_63(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC56 = result;
  return result;
}

- (void)logEventPointIPSecWake
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F92A30] handleIPSecEvent:self->_ipsecSocket];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5BCA0 != -1) {
      dispatch_once(&qword_1EBD5BCA0, block);
    }
    if (byte_1EBD5BC57)
    {
      uint64_t v4 = [NSString stringWithFormat:@"packet dictionary %@", v2];
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLIPSecAgent logEventPointIPSecWake]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:124];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v2)
  {
    v10 = [v2 objectForKey:@"headerInfo"];

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F92A30];
      uint64_t v12 = [v2 objectForKeyedSubscript:@"headerInfo"];
      uint64_t v13 = [v11 decodeIPPacket:v12 encryptedPath:1];

      if (v13)
      {
        uint64_t v74 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"IPSecWake"];
        v14 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v74];
        v15 = [v2 objectForKeyedSubscript:@"wakeUUID"];
        [v14 setObject:v15 forKeyedSubscript:@"wakeUUID"];

        unint64_t v16 = 0x1E4F28000uLL;
        v17 = NSNumber;
        v18 = [v2 objectForKeyedSubscript:@"seqNo"];
        int v19 = objc_msgSend(v17, "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue"));
        [v14 setObject:v19 forKeyedSubscript:@"seqNo"];

        int v20 = NSNumber;
        uint64_t v21 = [v2 objectForKeyedSubscript:@"spi"];
        v22 = objc_msgSend(v20, "numberWithUnsignedInt:", objc_msgSend(v21, "unsignedIntValue"));
        [v14 setObject:v22 forKeyedSubscript:@"spi"];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v23 = objc_opt_class();
          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          v77[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_91;
          v77[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v77[4] = v23;
          if (qword_1EBD5BCB8 != -1) {
            dispatch_once(&qword_1EBD5BCB8, v77);
          }
          if (byte_1EBD5BC5A)
          {
            v24 = [NSString stringWithFormat:@"Dictionary for IPSec : %@", v13];
            v25 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
            v27 = [v26 lastPathComponent];
            v28 = [NSString stringWithUTF8String:"-[PLIPSecAgent logEventPointIPSecWake]"];
            [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:148];

            v29 = PLLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v82 = v24;
              _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v16 = 0x1E4F28000;
          }
        }
        v30 = [v13 objectForKeyedSubscript:@"destination"];
        [v14 setObject:v30 forKeyedSubscript:@"ip_destination"];

        v31 = [v13 objectForKeyedSubscript:@"source"];
        [v14 setObject:v31 forKeyedSubscript:@"ip_source"];

        v32 = [v13 objectForKeyedSubscript:@"protocol"];
        [v14 setObject:v32 forKeyedSubscript:@"ip_protocol"];

        v33 = [v13 objectForKey:@"protocol"];

        if (v33)
        {
          v34 = NSString;
          dispatch_source_t v35 = [v13 objectForKeyedSubscript:@"protocol_info"];
          v36 = [v35 objectForKeyedSubscript:@"dest_port"];
          uint64_t v37 = [v34 stringWithFormat:@"%@", v36];
          [v14 setObject:v37 forKeyedSubscript:@"dest_port"];

          v38 = NSString;
          v39 = [v13 objectForKeyedSubscript:@"protocol_info"];
          v40 = [v39 objectForKeyedSubscript:@"source_port"];
          v41 = [v38 stringWithFormat:@"%@", v40];
          [v14 setObject:v41 forKeyedSubscript:@"source_port"];

          unint64_t v16 = 0x1E4F28000uLL;
        }
        v42 = *(void **)(v16 + 3792);
        v43 = [v14 objectForKeyedSubscript:@"dest_port"];
        uint64_t v44 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "integerValue"));

        v45 = *(void **)(v16 + 3792);
        v46 = [v14 objectForKeyedSubscript:@"source_port"];
        v47 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "integerValue"));

        v48 = +[PLProcessPortMap sharedInstance];
        int v49 = [v14 objectForKeyedSubscript:@"ip_destination"];
        v50 = [v14 objectForKeyedSubscript:@"ip_source"];
        v51 = [v14 objectForKeyedSubscript:@"ip_protocol"];
        v73 = (void *)v44;
        v52 = [v48 pidAndProcessNameForDestAddress:v49 withDestPort:v44 withSourceAddress:v50 withSourcePort:v47 withProtocol:v51];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v53 = objc_opt_class();
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_128;
          v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v76[4] = v53;
          if (qword_1EBD5BCC0 != -1) {
            dispatch_once(&qword_1EBD5BCC0, v76);
          }
          if (byte_1EBD5BC5B)
          {
            uint64_t v54 = [NSString stringWithFormat:@" pidAndProcessName=%@", v52];
            v55 = (void *)MEMORY[0x1E4F929B8];
            v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
            v57 = [v56 lastPathComponent];
            v58 = [NSString stringWithUTF8String:"-[PLIPSecAgent logEventPointIPSecWake]"];
            [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:163];

            v59 = PLLogCommon();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v82 = v54;
              _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        if (v52)
        {
          v60 = [v52 pid];
          [v14 setObject:v60 forKeyedSubscript:@"PID"];

          v61 = [v52 processName];
          [v14 setObject:v61 forKeyedSubscript:@"ProcessName"];
        }
        [(PLOperator *)self logEntry:v14];

        v62 = v74;
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_44;
        }
        uint64_t v68 = objc_opt_class();
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_82;
        v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v78[4] = v68;
        if (qword_1EBD5BCB0 != -1) {
          dispatch_once(&qword_1EBD5BCB0, v78);
        }
        if (!byte_1EBD5BC59)
        {
LABEL_44:
          uint64_t v13 = 0;
          goto LABEL_45;
        }
        v62 = [NSString stringWithFormat:@"decodedPacket is empty"];
        v69 = (void *)MEMORY[0x1E4F929B8];
        v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
        v71 = [v70 lastPathComponent];
        v72 = [NSString stringWithUTF8String:"-[PLIPSecAgent logEventPointIPSecWake]"];
        [v69 logMessage:v62 fromFile:v71 fromFunction:v72 fromLineNumber:137];

        v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v62;
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }

LABEL_31:
LABEL_45:

      goto LABEL_46;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v63 = objc_opt_class();
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_76;
      v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v79[4] = v63;
      if (qword_1EBD5BCA8 != -1) {
        dispatch_once(&qword_1EBD5BCA8, v79);
      }
      if (byte_1EBD5BC58)
      {
        uint64_t v13 = [NSString stringWithFormat:@"headerInfo not present"];
        v64 = (void *)MEMORY[0x1E4F929B8];
        v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m"];
        v66 = [v65 lastPathComponent];
        v67 = [NSString stringWithUTF8String:"-[PLIPSecAgent logEventPointIPSecWake]"];
        [v64 logMessage:v13 fromFile:v66 fromFunction:v67 fromLineNumber:130];

        v62 = PLLogCommon();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v13;
          _os_log_debug_impl(&dword_1D2690000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
  }
LABEL_46:
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC57 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_76(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC58 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_82(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC59 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_91(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC5A = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_128(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC5B = result;
  return result;
}

- (int)ipsecSocket
{
  return self->_ipsecSocket;
}

- (void)setIpsecSocket:(int)a3
{
  self->_uintptr_t ipsecSocket = a3;
}

@end