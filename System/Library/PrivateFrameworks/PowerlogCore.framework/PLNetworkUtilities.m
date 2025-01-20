@interface PLNetworkUtilities
+ (BOOL)getCompanionLink:(npi_if_info *)a3;
+ (BOOL)isESPPacket:(__CFData *)a3 offset:(unsigned __int8)a4;
+ (id)decodeEtherType:(unsigned __int16)a3;
+ (id)decodeIPPacket:(id)a3 encryptedPath:(BOOL)a4;
+ (id)getIPAddress:(in_addr_4_6 *)a3 withAddressFamily:(int)a4;
+ (id)getIPSecWakeInfo;
+ (id)getNetworkWakeInfo:(kern_event_msg *)a3;
+ (id)getNormalizedIPV6Address:(id)a3;
+ (id)getSeqNoAndSPI:(__CFData *)a3 offset:(unsigned __int8)a4;
+ (id)getUnattributedWakeInfo:(kern_event_msg *)a3;
+ (id)handleIPSecEvent:(int)a3;
+ (id)handlePowerWakeEvent:(int)a3;
+ (id)interfaceNameForIndex:(id)a3;
+ (id)sockaddrToNSDictionary:(const char *)a3;
+ (id)stringFromTrafficClass:(unsigned int)a3;
+ (id)tcpParse:(__CFData *)a3 offset:(unsigned __int8)a4;
+ (id)udpParse:(__CFData *)a3 offset:(unsigned __int8)a4;
+ (int)getInterfaceType:(char *)a3 withPktIFName:(char *)a4 withPktIFInfo:(npi_if_info *)a5 withPktPhyIFInfo:(npi_if_info *)a6;
@end

@implementation PLNetworkUtilities

+ (id)sockaddrToNSDictionary:(const char *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  memset(v13, 0, sizeof(v13));
  *(_OWORD *)v11 = 0u;
  __int16 v10 = 0;
  *(_DWORD *)v9 = 0;
  v4 = objc_opt_new();
  if (getnameinfo((const sockaddr *)a3, *(unsigned __int8 *)a3, v11, 0x39u, v9, 6u, 10))
  {
    id v5 = 0;
  }
  else
  {
    v13[24] = 0;
    HIBYTE(v10) = 0;
    v6 = [NSString stringWithUTF8String:v11];
    [v4 setObject:v6 forKey:@"address"];

    v7 = [NSString stringWithUTF8String:v9];
    [v4 setObject:v7 forKey:@"port"];

    id v5 = v4;
  }

  return v5;
}

+ (id)interfaceNameForIndex:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (interfaceNameForIndex__onceToken != -1) {
    dispatch_once(&interfaceNameForIndex__onceToken, &__block_literal_global_40);
  }
  id v4 = (id)interfaceNameForIndex___interfaceNames;
  objc_sync_enter(v4);
  id v5 = [(id)interfaceNameForIndex___interfaceNames objectForKeyedSubscript:v3];
  if (!v5)
  {
    v8[0] = 0;
    if (if_indextoname([v3 unsignedIntValue], v8) && v8[0])
    {
      uint64_t v6 = [NSString stringWithUTF8String:v8];
    }
    else
    {
      uint64_t v6 = [NSString stringWithFormat:@"unknown%@", v3];
    }
    id v5 = (void *)v6;
    [(id)interfaceNameForIndex___interfaceNames setObject:v6 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

uint64_t __44__PLNetworkUtilities_interfaceNameForIndex___block_invoke()
{
  interfaceNameForIndex___interfaceNames = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)stringFromTrafficClass:(unsigned int)a3
{
  if ((int)a3 > 499)
  {
    if ((int)a3 <= 699)
    {
      if (a3 == 500) {
        return @"AV:Multimedia_Audio/Video_Streaming";
      }
      if (a3 == 600) {
        return @"RV:Responsive_Multimedia_Audio/Video";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2BCu:
          return @"VI:Interactive_Video";
        case 0x320u:
          return @"VO:Interactive_Voice";
        case 0x384u:
          return @"CTL:Network_Control";
      }
    }
  }
  else if ((int)a3 <= 199)
  {
    if (!a3) {
      return @"BE:Best_Effort";
    }
    if (a3 == 100) {
      return @"BK_SYS:Background_System-Initiated";
    }
  }
  else
  {
    switch(a3)
    {
      case 0xC8u:
        return @"BK:Background";
      case 0x12Cu:
        return @"RD:Responsive_Data";
      case 0x190u:
        return @"OAM:Operations_Administration_and_Management";
    }
  }
  return @"unknown?";
}

+ (id)decodeEtherType:(unsigned __int16)a3
{
  if ((int)a3 <= 2113)
  {
    if (a3 == 2048)
    {
      id v4 = @"IPv4";
    }
    else
    {
      if (a3 != 2054)
      {
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"other(%d)", a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      id v4 = @"ARP";
    }
  }
  else
  {
    switch(a3)
    {
      case 0x842u:
        id v4 = @"Wake-on-LAN";
        break;
      case 0x86DDu:
        id v4 = @"IPv6";
        break;
      case 0x8808u:
        id v4 = @"MAC_Control";
        return v4;
      default:
        goto LABEL_22;
    }
  }
  return v4;
}

+ (id)getNetworkWakeInfo:(kern_event_msg *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a3->event_data, out);
  uint64_t v6 = [NSString stringWithUTF8String:out];
  if ((a3[1].event_data[0] & 2) != 0) {
    uint64_t v7 = 30;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [a1 getIPAddress:&a3[5].kev_class withAddressFamily:v7];
  uint64_t v9 = [a1 getIPAddress:&a3[4].event_code withAddressFamily:v7];
  int v10 = [a1 getInterfaceType:&a3[7].kev_class withPktIFName:a3[5].event_data withPktIFInfo:a3[6].event_data withPktPhyIFInfo:a3[7].event_data];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[PLNetworkUtilities getNetworkWakeInfo:](v10);
  }
  unsigned int v38 = v10;
  v39 = (void *)v6;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (getNetworkWakeInfo__defaultOnce != -1) {
      dispatch_once(&getNetworkWakeInfo__defaultOnce, block);
    }
    if (getNetworkWakeInfo__classDebugEnabled)
    {
      v36 = v9;
      v37 = v8;
      long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"Wake uuid %s ifname %s port %d flags 0x%x pid %d pname %s epid %d epname %s\n", out, a3[5].event_data, bswap32(HIWORD(a3[1].event_code)) >> 16, LOWORD(a3[1].event_data[0]), a3[2].total_size, &a3[2].kev_class, a3[2].vendor_code, (char *)a3[2].event_data + 1);
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getNetworkWakeInfo:]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:194];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v6 = (uint64_t)v39;
      uint64_t v9 = v36;
      v8 = v37;
    }
  }
  [v5 setObject:v6 forKeyedSubscript:@"wakeUUID"];
  v17 = [NSString stringWithUTF8String:a3[5].event_data];
  [v5 setObject:v17 forKeyedSubscript:@"Interface"];

  v18 = [NSNumber numberWithInt:a3[2].total_size];
  [v5 setObject:v18 forKeyedSubscript:@"PID"];

  v19 = [NSString stringWithUTF8String:&a3[2].kev_class];
  [v5 setObject:v19 forKeyedSubscript:@"ProcessName"];

  v20 = [NSNumber numberWithInt:a3[2].vendor_code];
  [v5 setObject:v20 forKeyedSubscript:@"EffectivePID"];

  v21 = [NSString stringWithUTF8String:(char *)a3[2].event_data + 1];
  [v5 setObject:v21 forKeyedSubscript:@"EffectiveProcessName"];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AttributedWake"];
  v22 = [NSNumber numberWithInt:v38];
  [v5 setObject:v22 forKeyedSubscript:@"InterfaceType"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "getCompanionLink:", a3[6].event_data));
  [v5 setObject:v23 forKeyedSubscript:@"CompanionLink"];

  v24 = [NSNumber numberWithUnsignedShort:bswap32(HIWORD(a3[4].id)) >> 16];
  [v5 setObject:v24 forKeyedSubscript:@"sourcePort"];

  [v5 setObject:v8 forKeyedSubscript:@"sourceAddress"];
  v25 = [NSNumber numberWithUnsignedShort:bswap32(HIWORD(a3[1].event_code)) >> 16];
  [v5 setObject:v25 forKeyedSubscript:@"destinationPort"];

  [v5 setObject:v9 forKeyedSubscript:@"destinationAddress"];
  if ((a3[1].event_data[0] & 4) != 0)
  {
    v26 = [NSNumber numberWithUnsignedShort:LOWORD(a3[6].event_code)];
    [v5 setObject:v26 forKeyedSubscript:@"controlFlagType"];
  }
  v27 = [NSNumber numberWithUnsignedInt:a3[6].id];
  [v5 setObject:v27 forKeyedSubscript:@"packetDataLength"];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke_123;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v28;
    if (getNetworkWakeInfo__defaultOnce_121 != -1) {
      dispatch_once(&getNetworkWakeInfo__defaultOnce_121, v40);
    }
    if (getNetworkWakeInfo__classDebugEnabled_122)
    {
      v29 = v9;
      v30 = [NSString stringWithFormat:@"Wake dictionary %@", v5];
      v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      v32 = [v31 lastPathComponent];
      v33 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getNetworkWakeInfo:]"];
      +[PLCoreStorage logMessage:v30 fromFile:v32 fromFunction:v33 fromLineNumber:216];

      v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v9 = v29;
    }
  }

  return v5;
}

BOOL __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getNetworkWakeInfo__classDebugEnabled = result;
  return result;
}

BOOL __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke_123(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getNetworkWakeInfo__classDebugEnabled_122 = result;
  return result;
}

+ (id)getIPAddress:(in_addr_4_6 *)a3 withAddressFamily:(int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, 46);
  if (a4 == 2) {
    int v4 = 2;
  }
  else {
    int v4 = 30;
  }
  inet_ntop(v4, a3, (char *)v7, 0x2Eu);
  id v5 = [NSString stringWithUTF8String:v7];
  return v5;
}

+ (BOOL)getCompanionLink:(npi_if_info *)a3
{
  if (a3->var0 == 18 && a3->var2 == 7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      +[PLNetworkUtilities getCompanionLink:]();
    }
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      +[PLNetworkUtilities getCompanionLink:]();
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (int)getInterfaceType:(char *)a3 withPktIFName:(char *)a4 withPktIFInfo:(npi_if_info *)a5 withPktPhyIFInfo:(npi_if_info *)a6
{
  unsigned int var0 = a5->var0;
  if ((int)a5->var0 > 16)
  {
    if (var0 == 17)
    {
      if (a6->var1 == 3) {
        return 2;
      }
      BOOL v12 = a6->var0 == 15;
      int v13 = 3;
    }
    else
    {
      if (var0 != 18) {
        return 0;
      }
      unsigned int var2 = a5->var2;
      if (!var2)
      {
        if (a6->var1 != 3)
        {
          unsigned int var0 = a6->var0;
LABEL_3:
          if (var0 == 15) {
            return 3;
          }
          return 0;
        }
        return 2;
      }
      if (var2 != 7) {
        return 0;
      }
      unsigned int var1 = a5->var1;
      if (var1 == 2) {
        return 1;
      }
      if (var1 != 7)
      {
        if (var1 != 3)
        {
          unsigned int v10 = a6->var1;
          if (v10 != 3)
          {
            BOOL v11 = v10 == 2;
            if (a6->var0 == 15) {
              return 3;
            }
            else {
              return v11;
            }
          }
        }
        return 2;
      }
      if (a6->var1 == 3) {
        return 4;
      }
      BOOL v12 = a6->var0 == 15;
      int v13 = 5;
    }
    if (v12) {
      return v13;
    }
    else {
      return 0;
    }
  }
  if (var0 != 2) {
    goto LABEL_3;
  }
  if (a5->var1 == 3) {
    return 2;
  }
  else {
    return 6;
  }
}

+ (id)getUnattributedWakeInfo:(kern_event_msg *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a3->event_data, out);
  uint64_t v6 = [NSString stringWithUTF8String:out];
  if ((a3[1].event_code & 0x20000) != 0) {
    uint64_t v7 = 30;
  }
  else {
    uint64_t v7 = 2;
  }
  uint64_t v8 = [a1 getIPAddress:&a3[6].kev_subclass withAddressFamily:v7];
  uint64_t v9 = [a1 getIPAddress:a3[5].event_data withAddressFamily:v7];
  int v10 = [a1 getInterfaceType:&a3[8].kev_subclass withPktIFName:&a3[7] withPktIFInfo:&a3[8] withPktPhyIFInfo:&a3[9]];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[PLNetworkUtilities getUnattributedWakeInfo:](v10);
  }
  unsigned int v35 = v10;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (getUnattributedWakeInfo__defaultOnce != -1) {
      dispatch_once(&getUnattributedWakeInfo__defaultOnce, block);
    }
    if (getUnattributedWakeInfo__classDebugEnabled)
    {
      v32 = v9;
      v33 = v8;
      v34 = v6;
      BOOL v12 = objc_msgSend(NSString, "stringWithFormat:", @"Wake uuid %s ifname %s src port %d dst port %d \n", out, &a3[7], bswap32(LOWORD(a3[5].event_code)) >> 16, bswap32(HIWORD(a3[5].id)) >> 16);
      int v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getUnattributedWakeInfo:]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:319];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v8 = v33;
      uint64_t v6 = v34;
      uint64_t v9 = v32;
    }
  }
  [v5 setObject:v6 forKeyedSubscript:@"wakeUUID"];
  v17 = [NSString stringWithUTF8String:&a3[7]];
  [v5 setObject:v17 forKeyedSubscript:@"Interface"];

  v18 = [NSNumber numberWithUnsignedShort:bswap32(LOWORD(a3[5].event_code)) >> 16];
  [v5 setObject:v18 forKeyedSubscript:@"sourcePort"];

  [v5 setObject:v8 forKeyedSubscript:@"sourceAddress"];
  v19 = [NSNumber numberWithUnsignedShort:bswap32(HIWORD(a3[5].id)) >> 16];
  [v5 setObject:v19 forKeyedSubscript:@"destinationPort"];

  [v5 setObject:v9 forKeyedSubscript:@"destinationAddress"];
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"AttributedWake"];
  v20 = [NSNumber numberWithInt:v35];
  [v5 setObject:v20 forKeyedSubscript:@"InterfaceType"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "getCompanionLink:", &a3[8]));
  [v5 setObject:v21 forKeyedSubscript:@"CompanionLink"];

  if ((a3[1].event_code & 0x40000) != 0)
  {
    v22 = [NSNumber numberWithUnsignedShort:LOWORD(a3[7].event_data[0])];
    [v5 setObject:v22 forKeyedSubscript:@"controlFlagType"];
  }
  v23 = [NSNumber numberWithUnsignedInt:a3[7].event_code];
  [v5 setObject:v23 forKeyedSubscript:@"packetDataLength"];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke_132;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v24;
    if (getUnattributedWakeInfo__defaultOnce_130 != -1) {
      dispatch_once(&getUnattributedWakeInfo__defaultOnce_130, v36);
    }
    if (getUnattributedWakeInfo__classDebugEnabled_131)
    {
      v25 = v9;
      v26 = [NSString stringWithFormat:@"Unattributed wake dictionary %@", v5];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getUnattributedWakeInfo:]"];
      +[PLCoreStorage logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:337];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v9 = v25;
    }
  }

  return v5;
}

BOOL __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getUnattributedWakeInfo__classDebugEnabled = result;
  return result;
}

BOOL __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke_132(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getUnattributedWakeInfo__classDebugEnabled_131 = result;
  return result;
}

+ (id)handlePowerWakeEvent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ssize_t v5 = recv(a3, &handlePowerWakeEvent__buf, 0x41CuLL, 0);
  BOOL v6 = +[PLDefaults debugEnabled];
  if (v5 == -1)
  {
    if (!v6) {
      goto LABEL_28;
    }
    uint64_t v20 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_144;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v20;
    if (handlePowerWakeEvent__defaultOnce_142 != -1) {
      dispatch_once(&handlePowerWakeEvent__defaultOnce_142, v25);
    }
    if (!handlePowerWakeEvent__classDebugEnabled_143) {
      goto LABEL_28;
    }
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"Did not receive data on power wake event %d", v3);
    v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
    v22 = [v21 lastPathComponent];
    v23 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handlePowerWakeEvent:]"];
    +[PLCoreStorage logMessage:v15 fromFile:v22 fromFunction:v23 fromLineNumber:366];

    v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
    goto LABEL_27;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (handlePowerWakeEvent__defaultOnce != -1) {
      dispatch_once(&handlePowerWakeEvent__defaultOnce, block);
    }
    if (handlePowerWakeEvent__classDebugEnabled)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Got kev message as vendor code %d class %d sub class %d event code %d !", dword_1E9F8DCD5, dword_1E9F8DCD9, dword_1E9F8DCDD, dword_1E9F8DCE5);
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      int v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handlePowerWakeEvent:]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:350];

      BOOL v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (dword_1E9F8DCD5 != 1 || dword_1E9F8DCD9 != 1 || dword_1E9F8DCDD != 14)
  {
LABEL_15:
    if (!+[PLDefaults debugEnabled]) {
      goto LABEL_28;
    }
    uint64_t v14 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_141;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v14;
    if (handlePowerWakeEvent__defaultOnce_139 != -1) {
      dispatch_once(&handlePowerWakeEvent__defaultOnce_139, v26);
    }
    if (!handlePowerWakeEvent__classDebugEnabled_140) {
      goto LABEL_28;
    }
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"Got kev message as vendor code %d class %d sub class %d event code %d !", dword_1E9F8DCD5, dword_1E9F8DCD9, dword_1E9F8DCDD, dword_1E9F8DCE5);
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
    v17 = [v16 lastPathComponent];
    v18 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handlePowerWakeEvent:]"];
    +[PLCoreStorage logMessage:v15 fromFile:v17 fromFunction:v18 fromLineNumber:363];

    v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
LABEL_27:

LABEL_28:
    int v13 = 0;
    goto LABEL_29;
  }
  if (dword_1E9F8DCE5 != 2)
  {
    if (dword_1E9F8DCE5 == 1)
    {
      int v13 = [a1 getNetworkWakeInfo:&handlePowerWakeEvent__buf];
      goto LABEL_29;
    }
    goto LABEL_15;
  }
  int v13 = [a1 getUnattributedWakeInfo:&handlePowerWakeEvent__buf];
LABEL_29:
  return v13;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePowerWakeEvent__classDebugEnabled = result;
  return result;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_141(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePowerWakeEvent__classDebugEnabled_140 = result;
  return result;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_144(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePowerWakeEvent__classDebugEnabled_143 = result;
  return result;
}

+ (id)handleIPSecEvent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (recv(a3, &handleIPSecEvent__buf, 0x9CuLL, 0) == -1)
  {
    if (!+[PLDefaults debugEnabled]) {
      goto LABEL_27;
    }
    uint64_t v18 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_156;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v18;
    if (handleIPSecEvent__defaultOnce_154 != -1) {
      dispatch_once(&handleIPSecEvent__defaultOnce_154, v23);
    }
    if (!handleIPSecEvent__classDebugEnabled_155) {
      goto LABEL_27;
    }
    int v13 = objc_msgSend(NSString, "stringWithFormat:", @"Did not receive data on ipsec event %d", v3);
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
    uint64_t v20 = [v19 lastPathComponent];
    v21 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handleIPSecEvent:]"];
    +[PLCoreStorage logMessage:v13 fromFile:v20 fromFunction:v21 fromLineNumber:390];

    v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
    goto LABEL_26;
  }
  if (dword_1E9F8E11D != 1 || dword_1E9F8E121 != 1 || dword_1E9F8E125 != 13 || dword_1E9F8E12D != 1)
  {
    if (!+[PLDefaults debugEnabled]) {
      goto LABEL_27;
    }
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_150;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (handleIPSecEvent__defaultOnce_148 != -1) {
      dispatch_once(&handleIPSecEvent__defaultOnce_148, block);
    }
    if (!handleIPSecEvent__classDebugEnabled_149) {
      goto LABEL_27;
    }
    int v13 = objc_msgSend(NSString, "stringWithFormat:", @"Got kev message as vendor code %d class %d sub class %d event code %d on socket %d", dword_1E9F8E11D, dword_1E9F8E121, dword_1E9F8E125, dword_1E9F8E12D, v3);
    uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
    v15 = [v14 lastPathComponent];
    v16 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handleIPSecEvent:]"];
    +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:387];

    v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
LABEL_26:

LABEL_27:
    uint64_t v11 = 0;
    goto LABEL_28;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v5;
    if (handleIPSecEvent__defaultOnce != -1) {
      dispatch_once(&handleIPSecEvent__defaultOnce, v25);
    }
    if (handleIPSecEvent__classDebugEnabled)
    {
      BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"Got kev message as vendor code %d class %d sub class %d event code %d !", dword_1E9F8E11D, dword_1E9F8E121, dword_1E9F8E125, dword_1E9F8E12D);
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"+[PLNetworkUtilities handleIPSecEvent:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:384];

      int v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v11 = [a1 getIPSecWakeInfo];
LABEL_28:
  return v11;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIPSecEvent__classDebugEnabled = result;
  return result;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_150(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIPSecEvent__classDebugEnabled_149 = result;
  return result;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_156(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIPSecEvent__classDebugEnabled_155 = result;
  return result;
}

+ (id)getIPSecWakeInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  size_t v15 = 152;
  memset(v16, 0, sizeof(v16));
  long long v17 = 0u;
  uint64_t v18 = 0;
  if ((sysctlbyname("net.link.generic.system.ipsec_wake_pkt", v16, &v15, 0, 0) & 0x80000000) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:100];
    [v2 setObject:v3 forKeyedSubscript:@"headerInfo"];
    int v4 = [NSString stringWithUTF8String:(char *)&v16[6] + 4];
    [v2 setObject:v4 forKeyedSubscript:@"wakeUUID"];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:v18];
    [v2 setObject:v5 forKeyedSubscript:@"seqNo"];

    BOOL v6 = [NSNumber numberWithUnsignedInt:HIDWORD(v17)];
    [v2 setObject:v6 forKeyedSubscript:@"spi"];

LABEL_3:
    goto LABEL_10;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLNetworkUtilities_getIPSecWakeInfo__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (getIPSecWakeInfo_defaultOnce != -1) {
      dispatch_once(&getIPSecWakeInfo_defaultOnce, block);
    }
    if (getIPSecWakeInfo_classDebugEnabled)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = __error();
      uint64_t v3 = objc_msgSend(v8, "stringWithFormat:", @"net.link.generic.system.ipsec_wake_pkt sysctl failed %s", strerror(*v9));
      int v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getIPSecWakeInfo]"];
      +[PLCoreStorage logMessage:v3 fromFile:v11 fromFunction:v12 fromLineNumber:406];

      int v4 = PLLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
      goto LABEL_3;
    }
  }
LABEL_10:
  return v2;
}

BOOL __38__PLNetworkUtilities_getIPSecWakeInfo__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getIPSecWakeInfo_classDebugEnabled = result;
  return result;
}

+ (id)getNormalizedIPV6Address:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21[0] = 0;
  v21[1] = 0;
  if (!inet_pton(30, (const char *)[a3 UTF8String], v21))
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      long long v17 = __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke_179;
      uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v19 = v10;
      if (getNormalizedIPV6Address__defaultOnce_177 != -1) {
        dispatch_once(&getNormalizedIPV6Address__defaultOnce_177, &v15);
      }
      if (getNormalizedIPV6Address__classDebugEnabled_178)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed in inet_pton %d", 0, v15, v16, v17, v18, v19);
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        uint64_t v12 = [v11 lastPathComponent];
        int v13 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getNormalizedIPV6Address:]"];
        +[PLCoreStorage logMessage:v5 fromFile:v12 fromFunction:v13 fromLineNumber:435];

        uint64_t v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        uint64_t v3 = 0;
        goto LABEL_16;
      }
    }
    goto LABEL_17;
  }
  if (!inet_ntop(30, v21, v22, 0x2Eu))
  {
LABEL_17:
    uint64_t v3 = 0;
    goto LABEL_18;
  }
  uint64_t v3 = [NSString stringWithUTF8String:v22];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (getNormalizedIPV6Address__defaultOnce != -1) {
      dispatch_once(&getNormalizedIPV6Address__defaultOnce, block);
    }
    if (getNormalizedIPV6Address__classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"Normalized Address is %@", v3];
      BOOL v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getNormalizedIPV6Address:]"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:432];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
LABEL_16:
    }
  }
LABEL_18:
  return v3;
}

BOOL __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getNormalizedIPV6Address__classDebugEnabled = result;
  return result;
}

BOOL __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke_179(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getNormalizedIPV6Address__classDebugEnabled_178 = result;
  return result;
}

+ (id)decodeIPPacket:(id)a3 encryptedPath:(BOOL)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = v6;
  buffer[0] = 0;
  if (!v6) {
    goto LABEL_32;
  }
  if (!CFDataGetLength(v6))
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v15;
      if (decodeIPPacket_encryptedPath__defaultOnce != -1) {
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce, block);
      }
      if (decodeIPPacket_encryptedPath__classDebugEnabled)
      {
        id v10 = [NSString stringWithFormat:@"[PacketDecoder] Packet too short or no data available"];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        long long v17 = [v16 lastPathComponent];
        uint64_t v18 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v17 fromFunction:v18 fromLineNumber:464];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_31;
      }
    }
    goto LABEL_32;
  }
  v108.location = 0;
  v108.length = 1;
  CFDataGetBytes(v7, v108, buffer);
  int v8 = buffer[0] >> 4;
  buffer[0] >>= 4;
  if (v8 == 6)
  {
    if ((unint64_t)CFDataGetLength(v7) > 0x27)
    {
      uint64_t v102 = 0;
      *(_OWORD *)v100 = 0u;
      long long v101 = 0u;
      v110.location = 0;
      v110.length = 40;
      CFDataGetBytes(v7, v110, v100);
      v29 = [MEMORY[0x1E4F1CA60] dictionary];
      unsigned int v34 = bswap32(*(unsigned int *)&v100[8]);
      unsigned int v35 = bswap32(*(unsigned int *)&v100[12]);
      unsigned int v36 = bswap32(v101);
      unsigned int v37 = bswap32(DWORD1(v101));
      unsigned int v38 = objc_msgSend(NSString, "stringWithFormat:", @"%x:%x:%x:%x:%x:%x:%x:%x", HIWORD(v34), (unsigned __int16)v34, HIWORD(v35), (unsigned __int16)v35, HIWORD(v36), (unsigned __int16)v36, HIWORD(v37), (unsigned __int16)v37);
      unsigned int v39 = bswap32(DWORD2(v101));
      unsigned int v40 = bswap32(HIDWORD(v101));
      unsigned int v41 = bswap32(v102);
      unsigned int v42 = bswap32(HIDWORD(v102));
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"%x:%x:%x:%x:%x:%x:%x:%x", HIWORD(v39), (unsigned __int16)v39, HIWORD(v40), (unsigned __int16)v40, HIWORD(v41), (unsigned __int16)v41, HIWORD(v42), (unsigned __int16)v42);
      v32 = [a1 getNormalizedIPV6Address:v38];
      v93 = [a1 getNormalizedIPV6Address:v43];
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v44 = objc_opt_class();
        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_206;
        v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v99[4] = v44;
        if (decodeIPPacket_encryptedPath__defaultOnce_204 != -1) {
          dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_204, v99);
        }
        if (decodeIPPacket_encryptedPath__classDebugEnabled_205)
        {
          v91 = v32;
          uint64_t v45 = [NSString stringWithFormat:@"Normalized address is source %@ dest %@ orig s %@ orig d %@", v32, v93, v38, v43];
          v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
          v47 = [v46 lastPathComponent];
          v48 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
          +[PLCoreStorage logMessage:v45 fromFile:v47 fromFunction:v48 fromLineNumber:519];

          v49 = (void *)v45;
          v50 = PLLogCommon();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }

          v32 = v91;
        }
      }
      unsigned int v33 = v100[6];

      int v28 = 10;
LABEL_42:
      if (v33 == 50)
      {
        if (a4)
        {
          v51 = 0;
        }
        else
        {
          v51 = [a1 getSeqNoAndSPI:v7 offset:(4 * v28)];
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v55 = objc_opt_class();
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_251;
            v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v94[4] = v55;
            if (decodeIPPacket_encryptedPath__defaultOnce_249 != -1) {
              dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_249, v94);
            }
            if (decodeIPPacket_encryptedPath__classDebugEnabled_250)
            {
              v56 = [NSString stringWithFormat:@"Invoked from non encrypted path (esp) - wifi or bb agent %@", v51];
              v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
              v58 = [v57 lastPathComponent];
              v59 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
              +[PLCoreStorage logMessage:v56 fromFile:v58 fromFunction:v59 fromLineNumber:560];

              v60 = PLLogCommon();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
                -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
              }
            }
          }
        }
        uint64_t v14 = 0;
        v52 = @"ESP";
        goto LABEL_86;
      }
      if (v33 != 17)
      {
        if (v33 == 6)
        {
          uint64_t v14 = [a1 tcpParse:v7 offset:(4 * v28)];
          v51 = 0;
          v52 = @"TCP";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", v33);
          v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          uint64_t v14 = 0;
        }
        goto LABEL_86;
      }
      v92 = v32;
      uint64_t v53 = (4 * v28);
      uint64_t v14 = [a1 udpParse:v7 offset:v53];
      v54 = [v14 objectForKeyedSubscript:@"dest_port"];
      if ([v54 intValue] == 4500)
      {
      }
      else
      {
        v61 = [v14 objectForKeyedSubscript:@"source_port"];
        int v62 = [v61 intValue];

        if (v62 != 4500)
        {
          v51 = 0;
          v52 = @"UDP";
          goto LABEL_86;
        }
      }
      int v63 = [a1 isESPPacket:v7 offset:v53];
      BOOL v64 = +[PLDefaults debugEnabled];
      if (v63)
      {
        if (v64)
        {
          uint64_t v65 = objc_opt_class();
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_230;
          v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v97[4] = v65;
          if (decodeIPPacket_encryptedPath__defaultOnce_228 != -1) {
            dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_228, v97);
          }
          if (decodeIPPacket_encryptedPath__classDebugEnabled_229)
          {
            v90 = [NSString stringWithFormat:@"Found an ESP packet in UDP"];
            v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
            v67 = [v66 lastPathComponent];
            v68 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
            +[PLCoreStorage logMessage:v90 fromFile:v67 fromFunction:v68 fromLineNumber:542];

            v69 = PLLogCommon();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }

            v32 = v92;
          }
        }
        if (!a4)
        {
          v51 = [a1 getSeqNoAndSPI:v7 offset:(v53 + 8)];
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v70 = objc_opt_class();
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_236;
            v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v96[4] = v70;
            if (decodeIPPacket_encryptedPath__defaultOnce_234 != -1) {
              dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_234, v96);
            }
            if (decodeIPPacket_encryptedPath__classDebugEnabled_235)
            {
              v71 = [NSString stringWithFormat:@"Invoked from non encrypted path - wifi or bb agent %@", v51];
              v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
              v73 = [v72 lastPathComponent];
              v74 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
              +[PLCoreStorage logMessage:v71 fromFile:v73 fromFunction:v74 fromLineNumber:547];

              v75 = PLLogCommon();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
                -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
              }
            }
          }
          goto LABEL_84;
        }
      }
      else if (v64)
      {
        uint64_t v76 = objc_opt_class();
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_242;
        v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v95[4] = v76;
        if (decodeIPPacket_encryptedPath__defaultOnce_240 != -1) {
          dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_240, v95);
        }
        if (decodeIPPacket_encryptedPath__classDebugEnabled_241)
        {
          v77 = [NSString stringWithFormat:@"Found an IKE packet in UDP"];
          v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
          v79 = [v78 lastPathComponent];
          v80 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
          +[PLCoreStorage logMessage:v77 fromFile:v79 fromFunction:v80 fromLineNumber:550];

          v81 = PLLogCommon();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      v51 = 0;
LABEL_84:
      v52 = @"UDP";
LABEL_86:
      [v29 setObject:v52 forKeyedSubscript:@"protocol"];
      v82 = [NSNumber numberWithUnsignedInt:buffer[0]];
      [v29 setObject:v82 forKeyedSubscript:@"version"];

      [v29 setObject:v32 forKeyedSubscript:@"source"];
      [v29 setObject:v93 forKeyedSubscript:@"destination"];
      if (v51)
      {
        v83 = NSNumber;
        v84 = [v51 objectForKeyedSubscript:@"seqNo"];
        v85 = objc_msgSend(v83, "numberWithUnsignedInt:", objc_msgSend(v84, "unsignedIntValue"));
        [v29 setObject:v85 forKeyedSubscript:@"seqNo"];

        v86 = NSNumber;
        v87 = [v51 objectForKeyedSubscript:@"spi"];
        v88 = objc_msgSend(v86, "numberWithUnsignedInt:", objc_msgSend(v87, "unsignedIntValue"));
        [v29 setObject:v88 forKeyedSubscript:@"spi"];
      }
      if (v14) {
        [v29 setObject:v14 forKey:@"protocol_info"];
      }
      id v10 = v29;

      v27 = v10;
      goto LABEL_91;
    }
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_197;
      v103[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v103[4] = v19;
      if (decodeIPPacket_encryptedPath__defaultOnce_195 != -1) {
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_195, v103);
      }
      if (decodeIPPacket_encryptedPath__classDebugEnabled_196)
      {
        id v10 = [NSString stringWithFormat:@"[PacketDecoder] IPv6 Packet too short"];
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v21 fromFunction:v22 fromLineNumber:497];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_31;
      }
    }
LABEL_32:
    v27 = 0;
    goto LABEL_92;
  }
  if (v8 != 4)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v23 = objc_opt_class();
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_212;
      v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v98[4] = v23;
      if (decodeIPPacket_encryptedPath__defaultOnce_210 != -1) {
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_210, v98);
      }
      if (decodeIPPacket_encryptedPath__classDebugEnabled_211)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"[PacketDecoder] unknown type: %d", buffer[0]);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v25 fromFunction:v26 fromLineNumber:525];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_31;
      }
    }
    goto LABEL_32;
  }
  if ((unint64_t)CFDataGetLength(v7) > 0x13)
  {
    memset(v100, 0, sizeof(v100));
    LODWORD(v101) = 0;
    v109.location = 0;
    v109.length = 20;
    CFDataGetBytes(v7, v109, v100);
    int v28 = v100[0] & 0xF;
    v29 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned int v30 = bswap32(*(unsigned int *)&v100[12]);
    unsigned int v31 = bswap32(v101);
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu.%lu.%lu", HIBYTE(v30), BYTE2(v30), BYTE1(v30), v30);
    v93 = objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu.%lu.%lu", HIBYTE(v31), BYTE2(v31), BYTE1(v31), v31);
    unsigned int v33 = v100[9];
    goto LABEL_42;
  }
  if (!+[PLDefaults debugEnabled]) {
    goto LABEL_32;
  }
  uint64_t v9 = objc_opt_class();
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_188;
  v104[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v104[4] = v9;
  if (decodeIPPacket_encryptedPath__defaultOnce_186 != -1) {
    dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_186, v104);
  }
  if (!decodeIPPacket_encryptedPath__classDebugEnabled_187) {
    goto LABEL_32;
  }
  id v10 = [NSString stringWithFormat:@"[PacketDecoder] IPv4 Packet too short"];
  uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
  uint64_t v12 = [v11 lastPathComponent];
  int v13 = [NSString stringWithUTF8String:"+[PLNetworkUtilities decodeIPPacket:encryptedPath:]"];
  +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:475];

  uint64_t v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }
LABEL_31:
  v27 = 0;
LABEL_91:

LABEL_92:
  return v27;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_188(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_187 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_197(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_196 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_206(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_205 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_212(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_211 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_230(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_229 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_236(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_235 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_242(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_241 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_251(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decodeIPPacket_encryptedPath__classDebugEnabled_250 = result;
  return result;
}

+ (id)tcpParse:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  *(void *)buffer = 0;
  uint64_t v27 = 0;
  int v28 = 0;
  if (CFDataGetLength(a3) >= (unint64_t)a4 + 20)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v30.location = v4;
    v30.length = 20;
    CFDataGetBytes(a3, v30, buffer);
    uint64_t v15 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned __int16 *)buffer) >> 16];
    [v14 setObject:v15 forKey:@"source_port"];

    uint64_t v16 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned __int16 *)&buffer[2]) >> 16];
    [v14 setObject:v16 forKey:@"dest_port"];

    long long v17 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned int *)&buffer[4])];
    [v14 setObject:v17 forKey:@"seq"];

    uint64_t v18 = [NSNumber numberWithUnsignedInt:bswap32(v27)];
    [v14 setObject:v18 forKey:@"ack"];

    uint64_t v19 = [NSNumber numberWithUnsignedInt:BYTE5(v27)];
    [v14 setObject:v19 forKey:@"control"];

    uint64_t v9 = [NSNumber numberWithUnsignedInt:bswap32(HIWORD(v27)) >> 16];
    [v14 setObject:v9 forKey:@"window"];
LABEL_10:

    goto LABEL_12;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __38__PLNetworkUtilities_tcpParse_offset___block_invoke;
    uint64_t v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v6;
    if (tcpParse_offset__defaultOnce != -1) {
      dispatch_once(&tcpParse_offset__defaultOnce, &block);
    }
    if (tcpParse_offset__classDebugEnabled)
    {
      CFDataRef v7 = NSString;
      CFIndex Length = CFDataGetLength(a3);
      uint64_t v9 = [v7 stringWithFormat:@"[PacketDecoder] TCP Packet too short: %@ Length: %ld", a3, Length, block, v22, v23, v24, v25];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"+[PLNetworkUtilities tcpParse:offset:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:588];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v14 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v14 = 0;
LABEL_12:
  return v14;
}

BOOL __38__PLNetworkUtilities_tcpParse_offset___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  tcpParse_offset__classDebugEnabled = result;
  return result;
}

+ (id)udpParse:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  *(void *)buffer = 0;
  if (CFDataGetLength(a3) >= (unint64_t)a4 + 8)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v22.location = v4;
    v22.length = 8;
    CFDataGetBytes(a3, v22, buffer);
    int v13 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned __int16 *)buffer) >> 16];
    [v12 setObject:v13 forKey:@"source_port"];

    CFDataRef v7 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned __int16 *)&buffer[2]) >> 16];
    [v12 setObject:v7 forKey:@"dest_port"];
LABEL_10:

    goto LABEL_12;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    long long v17 = __38__PLNetworkUtilities_udpParse_offset___block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v6;
    if (udpParse_offset__defaultOnce != -1) {
      dispatch_once(&udpParse_offset__defaultOnce, &v15);
    }
    if (udpParse_offset__classDebugEnabled)
    {
      CFDataRef v7 = objc_msgSend(NSString, "stringWithFormat:", @"[PacketDecoder] UDP Packet too short", v15, v16, v17, v18, v19);
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"+[PLNetworkUtilities udpParse:offset:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:611];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v12 = 0;
LABEL_12:
  return v12;
}

BOOL __38__PLNetworkUtilities_udpParse_offset___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  udpParse_offset__classDebugEnabled = result;
  return result;
}

+ (BOOL)isESPPacket:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  if (CFDataGetLength(a3) <= (unint64_t)a4 + 12) {
    return 0;
  }
  CFIndex v6 = v4 + 8;
  *(_DWORD *)buffer = 0;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (isESPPacket_offset__defaultOnce != -1) {
      dispatch_once(&isESPPacket_offset__defaultOnce, block);
    }
    if (isESPPacket_offset__classDebugEnabled)
    {
      int v8 = [NSString stringWithFormat:@"[PacketDecoder] Read marker value."];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      id v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"+[PLNetworkUtilities isESPPacket:offset:]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:631];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v35.location = v6;
  v35.length = 4;
  CFDataGetBytes(a3, v35, buffer);
  int v13 = *(_DWORD *)buffer;
  BOOL v14 = *(_DWORD *)buffer != 0;
  BOOL v15 = +[PLDefaults debugEnabled];
  if (!v13)
  {
    if (v15)
    {
      uint64_t v22 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_296;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v22;
      if (isESPPacket_offset__defaultOnce_294 != -1) {
        dispatch_once(&isESPPacket_offset__defaultOnce_294, v32);
      }
      if (isESPPacket_offset__classDebugEnabled_295)
      {
        long long v17 = [NSString stringWithFormat:@"[PacketDecoder] Found an IKE packet"];
        uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        uint64_t v24 = [v23 lastPathComponent];
        uint64_t v25 = [NSString stringWithUTF8String:"+[PLNetworkUtilities isESPPacket:offset:]"];
        +[PLCoreStorage logMessage:v17 fromFile:v24 fromFunction:v25 fromLineNumber:636];

        v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_23;
      }
    }
    return 0;
  }
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_302;
    CFRange v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v16;
    if (isESPPacket_offset__defaultOnce_300 != -1) {
      dispatch_once(&isESPPacket_offset__defaultOnce_300, &v27);
    }
    if (isESPPacket_offset__classDebugEnabled_301)
    {
      long long v17 = objc_msgSend(NSString, "stringWithFormat:", @"[PacketDecoder] Found an ESP packet", v27, v28, v29, v30, v31);
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"+[PLNetworkUtilities isESPPacket:offset:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:639];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
LABEL_23:

      return v14;
    }
  }
  return 1;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  isESPPacket_offset__classDebugEnabled = result;
  return result;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_296(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  isESPPacket_offset__classDebugEnabled_295 = result;
  return result;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_302(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  isESPPacket_offset__classDebugEnabled_301 = result;
  return result;
}

+ (id)getSeqNoAndSPI:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  CFIndex v6 = [MEMORY[0x1E4F1CA60] dictionary];
  *(void *)buffer = 0;
  unint64_t Length = CFDataGetLength(a3);
  v8.location = v4;
  if (Length >= (unint64_t)v4 + 8)
  {
    v8.length = 8;
    CFDataGetBytes(a3, v8, buffer);
    uint64_t v16 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned int *)&buffer[4])];
    [v6 setObject:v16 forKeyedSubscript:@"seqNo"];

    long long v17 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned int *)buffer)];
    [v6 setObject:v17 forKeyedSubscript:@"spi"];

    id v15 = v6;
  }
  else
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __44__PLNetworkUtilities_getSeqNoAndSPI_offset___block_invoke;
      uint64_t v22 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v23 = v9;
      if (getSeqNoAndSPI_offset__defaultOnce != -1) {
        dispatch_once(&getSeqNoAndSPI_offset__defaultOnce, &v19);
      }
      if (getSeqNoAndSPI_offset__classDebugEnabled)
      {
        id v10 = objc_msgSend(NSString, "stringWithFormat:", @"[PacketDecoder] Cannot get spi and seq no", v19, v20, v21, v22, v23);
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m"];
        uint64_t v12 = [v11 lastPathComponent];
        int v13 = [NSString stringWithUTF8String:"+[PLNetworkUtilities getSeqNoAndSPI:offset:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:652];

        BOOL v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    id v15 = 0;
  }

  return v15;
}

BOOL __44__PLNetworkUtilities_getSeqNoAndSPI_offset___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getSeqNoAndSPI_offset__classDebugEnabled = result;
  return result;
}

+ (void)getNetworkWakeInfo:(int)a1 .cold.3(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PLNetworkUtilities::getNetworkWakeInfo interfaceType: %d", (uint8_t *)v1, 8u);
}

+ (void)getCompanionLink:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PLNetworkUtilities::getCompanionLink found companion", v0, 2u);
}

+ (void)getCompanionLink:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PLNetworkUtilities::getCompanionLink no companion found", v0, 2u);
}

+ (void)getUnattributedWakeInfo:(int)a1 .cold.3(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PLNetworkUtilities::getUnattributedWakeInfo interfaceType: %d", (uint8_t *)v1, 8u);
}

@end