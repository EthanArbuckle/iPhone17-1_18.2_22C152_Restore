@interface PLTelephonyConnection
+ (id)sharedTelephonyConnection;
- (BOOL)requestBasebandCoreDump:(id)a3;
- (BOOL)requestBasebandStateDump:(id)a3;
- (PLAgent)observerAgent;
- (PLTelephonyConnection)init;
- (__CTServerConnection)connection;
- (id)activeBand;
- (id)currentCallStatus;
- (id)getProperty:(id)a3 forTrace:(id)a4;
- (id)humanReadableCallStatus:(int)a3;
- (id)humanReadableRATName:(__CFString *)a3;
- (void)deregisterForAllTelephonyNotifications;
- (void)enableDiagLogging;
- (void)getRAT:(id *)a3 preferredRAT:(id *)a4 campedRAT:(id *)a5;
- (void)getSignalStrength:(int64_t *)a3 asPercentage:(int64_t *)a4 withBars:(int64_t *)a5;
- (void)registerCallback:(void *)a3 forTelephonyNotification:(__CFString *)a4;
- (void)setObserverAgent:(id)a3;
- (void)teardownConnection;
@end

@implementation PLTelephonyConnection

+ (id)sharedTelephonyConnection
{
  if (qword_1EBD5C4C0 != -1) {
    dispatch_once(&qword_1EBD5C4C0, &__block_literal_global_39);
  }
  v2 = (void *)qword_1EBD5C4C8;
  return v2;
}

void __50__PLTelephonyConnection_sharedTelephonyConnection__block_invoke()
{
  if (!qword_1EBD5C4C8)
  {
    qword_1EBD5C4C8 = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (PLTelephonyConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLTelephonyConnection;
  v2 = [(PLTelephonyConnection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->connection = 0;
    v2->ctServerPort = 0;
    v2->ctServerSource = 0;
    CFRunLoopGetMain();
    CTTelephonyCenterSetDefaultRunloop();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
  }
  return v3;
}

- (void)getRAT:(id *)a3 preferredRAT:(id *)a4 campedRAT:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 && a5)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v31 = 0;
    [(PLTelephonyConnection *)self connection];
    unint64_t RATSelection = _CTServerConnectionGetRATSelection();
    unint64_t v10 = HIDWORD(RATSelection);
    if (HIDWORD(RATSelection))
    {
      unint64_t v11 = RATSelection;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v12;
        if (qword_1EBD5C4D0 != -1) {
          dispatch_once(&qword_1EBD5C4D0, block);
        }
        if (_MergedGlobals_107)
        {
          v13 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get the selected radio mode. (domain: %d error: %d)", v11, v10);
          v14 = (void *)MEMORY[0x1E4F929B8];
          v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
          v16 = [v15 lastPathComponent];
          v17 = [NSString stringWithUTF8String:"-[PLTelephonyConnection getRAT:preferredRAT:campedRAT:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:69];

          v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    *a3 = [(PLTelephonyConnection *)self humanReadableRATName:v33];
    *a4 = [(PLTelephonyConnection *)self humanReadableRATName:v32];
    [(PLTelephonyConnection *)self connection];
    unint64_t RadioAccessTechnology = _CTServerConnectionGetRadioAccessTechnology();
    unint64_t v20 = HIDWORD(RadioAccessTechnology);
    if (HIDWORD(RadioAccessTechnology))
    {
      unint64_t v21 = RadioAccessTechnology;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke_17;
        v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v29[4] = v22;
        if (qword_1EBD5C4D8 != -1) {
          dispatch_once(&qword_1EBD5C4D8, v29);
        }
        if (byte_1EBD5C4B1)
        {
          v23 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get the selected radio mode. (domain: %d error: %d)", v21, v20);
          v24 = (void *)MEMORY[0x1E4F929B8];
          v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
          v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"-[PLTelephonyConnection getRAT:preferredRAT:campedRAT:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:78];

          v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v23;
            _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    *a5 = [(PLTelephonyConnection *)self humanReadableRATName:v31];
  }
}

uint64_t __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_107 = result;
  return result;
}

uint64_t __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B1 = result;
  return result;
}

- (void)enableDiagLogging
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PLTelephonyConnection *)self connection];
  unint64_t v2 = _CTServerConnectionSetTraceProperty();
  unint64_t v3 = HIDWORD(v2);
  if (HIDWORD(v2))
  {
    unint64_t v4 = v2;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLTelephonyConnection_enableDiagLogging__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD5C4E0 != -1) {
        dispatch_once(&qword_1EBD5C4E0, block);
      }
      if (byte_1EBD5C4B2)
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"Could not enable diag logging. (domain: %d error: %d)", v4, v3);
        v7 = (void *)MEMORY[0x1E4F929B8];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
        v9 = [v8 lastPathComponent];
        unint64_t v10 = [NSString stringWithUTF8String:"-[PLTelephonyConnection enableDiagLogging]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:94];

        unint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __42__PLTelephonyConnection_enableDiagLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B2 = result;
  return result;
}

- (BOOL)requestBasebandStateDump:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLTelephonyConnection *)self connection];
  unint64_t v5 = _CTServerConnectionDumpBasebandState();

  unint64_t v6 = HIDWORD(v5);
  if (HIDWORD(v5))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PLTelephonyConnection_requestBasebandStateDump___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1EBD5C4E8 != -1) {
        dispatch_once(&qword_1EBD5C4E8, block);
      }
      if (byte_1EBD5C4B3)
      {
        v8 = [NSString stringWithFormat:@"Failed to dump baseband state (domain=%d, error=%d)", v5, HIDWORD(v5)];
        v9 = (void *)MEMORY[0x1E4F929B8];
        unint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
        unint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLTelephonyConnection requestBasebandStateDump:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:101];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLTelephonyConnection *)self teardownConnection];
  }
  return v6 == 0;
}

uint64_t __50__PLTelephonyConnection_requestBasebandStateDump___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B3 = result;
  return result;
}

- (BOOL)requestBasebandCoreDump:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLTelephonyConnection *)self connection];
  unint64_t v5 = _CTServerConnectionResetModemWithCrashLogs();

  unint64_t v6 = HIDWORD(v5);
  if (HIDWORD(v5))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PLTelephonyConnection_requestBasebandCoreDump___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1EBD5C4F0 != -1) {
        dispatch_once(&qword_1EBD5C4F0, block);
      }
      if (byte_1EBD5C4B4)
      {
        v8 = [NSString stringWithFormat:@"Failed to get baseband core dump (domain=%d, error=%d)", v5, HIDWORD(v5)];
        v9 = (void *)MEMORY[0x1E4F929B8];
        unint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
        unint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLTelephonyConnection requestBasebandCoreDump:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:111];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLTelephonyConnection *)self teardownConnection];
  }
  return v6 == 0;
}

uint64_t __49__PLTelephonyConnection_requestBasebandCoreDump___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B4 = result;
  return result;
}

- (id)getProperty:(id)a3 forTrace:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v33 = 0;
  uint64_t v32 = 0;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLTelephonyConnection_getProperty_forTrace___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5C4F8 != -1) {
      dispatch_once(&qword_1EBD5C4F8, block);
    }
    if (byte_1EBD5C4B5)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLTelephonyConnection getProperty:forTrace:]");
      unint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLTelephonyConnection getProperty:forTrace:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:122];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v15 = self;
  objc_sync_enter(v15);
  [(PLTelephonyConnection *)v15 connection];
  unint64_t v16 = _CTServerConnectionCopyTraceProperty();
  objc_sync_exit(v15);

  if (HIDWORD(v16))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __46__PLTelephonyConnection_getProperty_forTrace___block_invoke_42;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v30 = v17;
      if (qword_1EBD5C500 != -1) {
        dispatch_once(&qword_1EBD5C500, &v26);
      }
      if (byte_1EBD5C4B6)
      {
        uint64_t v18 = [NSString stringWithFormat:@"Unable to retrieve property %@ from telephony trace %@ (domain=%d, error=%d)", v6, v7, v16, HIDWORD(v16), v26, v27, v28, v29, v30];
        v19 = (void *)MEMORY[0x1E4F929B8];
        unint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
        unint64_t v21 = [v20 lastPathComponent];
        uint64_t v22 = [NSString stringWithUTF8String:"-[PLTelephonyConnection getProperty:forTrace:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:132];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v24 = 0;
  }
  else
  {
    v24 = v32;
  }

  return v24;
}

uint64_t __46__PLTelephonyConnection_getProperty_forTrace___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B5 = result;
  return result;
}

uint64_t __46__PLTelephonyConnection_getProperty_forTrace___block_invoke_42(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B6 = result;
  return result;
}

- (void)getSignalStrength:(int64_t *)a3 asPercentage:(int64_t *)a4 withBars:(int64_t *)a5
{
  *a3 = -1;
  *a4 = -1;
  *a5 = -1;
}

- (id)currentCallStatus
{
  unint64_t v3 = (void *)CTCopyCurrentCalls();
  id v4 = v3;
  if (v3 && [v3 count])
  {
    if ((unint64_t)[v4 count] <= 1)
    {
      [v4 objectAtIndex:0];
      unint64_t v5 = [(PLTelephonyConnection *)self humanReadableCallStatus:CTCallGetStatus()];
    }
    else
    {
      unint64_t v5 = @"Multiple";
    }
  }
  else
  {
    unint64_t v5 = @"Inactive";
  }

  return v5;
}

- (id)humanReadableCallStatus:(int)a3
{
  id v4 = @"Idle";
  switch(a3)
  {
    case 0:
      goto LABEL_26;
    case 1:
      id v4 = @"Active";
      break;
    case 2:
      id v4 = @"Held";
      break;
    case 3:
      id v4 = @"Sending";
      break;
    case 4:
      id v4 = @"Ringing";
      break;
    case 5:
      id v4 = @"Disconnected";
      break;
    default:
      if (a3 == 196608)
      {
        id v4 = @"Alerting";
      }
      else if (a3 == 0x40000)
      {
        id v4 = @"Waiting";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"<unknown status: %d>", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      }
      break;
  }
  return v4;
}

- (id)humanReadableRATName:(__CFString *)a3
{
  if (a3)
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240A8])
      || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24130])
      || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24138]))
    {
      unint64_t v5 = @"GSM";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240B0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24158]))
    {
      unint64_t v5 = @"UMTS";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240C8]))
    {
      unint64_t v5 = @"Dual";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24108]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24168]))
    {
      unint64_t v5 = @"Unknown";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240D0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24118]))
    {
      unint64_t v5 = @"1x";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240D8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24120]))
    {
      unint64_t v5 = @"EVDO";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240E0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24128]))
    {
      unint64_t v5 = @"CDMAHybrid";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240E8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24140]))
    {
      unint64_t v5 = @"LTE";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240F8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24160]))
    {
      unint64_t v5 = @"UTRAN";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240F0]))
    {
      unint64_t v5 = @"Automatic";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240C0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24148]))
    {
      unint64_t v5 = @"NR";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F24100]))
    {
      unint64_t v5 = @"NR_SA";
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F240B8]))
    {
      unint64_t v5 = @"NR_NSA";
    }
    else
    {
      unint64_t v5 = (__CFString *)[(__CFString *)a3 copy];
    }
  }
  else
  {
    unint64_t v5 = @"None";
  }
  return v5;
}

- (id)activeBand
{
  return @"<unknown>";
}

- (void)teardownConnection
{
  if (self->ctServerSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->ctServerSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFRelease(self->ctServerSource);
    self->ctServerSource = 0;
  }
  ctServerPort = self->ctServerPort;
  if (ctServerPort)
  {
    CFMachPortInvalidate(ctServerPort);
    CFRelease(self->ctServerPort);
    self->ctServerPort = 0;
  }
  connection = self->connection;
  if (connection)
  {
    CFRelease(connection);
    self->connection = 0;
  }
}

- (__CTServerConnection)connection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  void block[5] = 0;
  long long v13 = 0u;
  uint64_t v14 = 0;
  block[6] = self;
  uint64_t result = self->connection;
  if (!result)
  {
    [(PLTelephonyConnection *)self teardownConnection];
    id v4 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->connection = v4;
    if (v4)
    {
      CFRunLoopGetMain();
      _CTServerConnectionAddToRunLoop();
      return self->connection;
    }
    else
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __35__PLTelephonyConnection_connection__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1EBD5C508 != -1) {
          dispatch_once(&qword_1EBD5C508, block);
        }
        if (byte_1EBD5C4B7)
        {
          id v6 = [NSString stringWithFormat:@"Failed to allocate a CTServer connection"];
          id v7 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m"];
          v9 = [v8 lastPathComponent];
          unint64_t v10 = [NSString stringWithUTF8String:"-[PLTelephonyConnection connection]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:299];

          unint64_t v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v16 = v6;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t __35__PLTelephonyConnection_connection__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C4B7 = result;
  return result;
}

- (void)registerCallback:(void *)a3 forTelephonyNotification:(__CFString *)a4
{
  CTTelephonyCenterGetDefault();
  id v5 = [(PLTelephonyConnection *)self observerAgent];
  CTTelephonyCenterAddObserver();
}

- (void)deregisterForAllTelephonyNotifications
{
  uint64_t Default = CTTelephonyCenterGetDefault();
  MEMORY[0x1F40DEFD0](Default, self);
}

- (PLAgent)observerAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end