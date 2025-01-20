@interface PLBasebandLogChannel
- (BOOL)cachingEnabled;
- (BOOL)isValid;
- (BOOL)openWithConnection:(id)a3;
- (PLBasebandLogChannel)init;
- (PLBasebandLogChannelDelegate)delegate;
- (void)close;
- (void)commitHardwareLogs;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)enableLogCodes:(id)a3 andEvents:(id)a4 andExtraCode:(id)a5;
- (void)flush;
- (void)invalidate;
- (void)sendObjectOverRemotePort:(id)a3;
- (void)setCachingEnabled:(BOOL)a3;
- (void)setChannelTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHardwareLoggingLevel:(unint64_t)a3 withWindowSize:(unint64_t)a4;
@end

@implementation PLBasebandLogChannel

- (PLBasebandLogChannel)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLBasebandLogChannel;
  v2 = [(PLBasebandLogChannel *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->remotePort = 0;
    v2->localPort = 0;
    [(PLBasebandLogChannel *)v2 setCachingEnabled:0];
    [(PLBasebandLogChannel *)v3 setDelegate:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PLBasebandLogChannel *)self close];
  v4.receiver = self;
  v4.super_class = (Class)PLBasebandLogChannel;
  [(PLBasebandLogChannel *)&v4 dealloc];
}

- (BOOL)isValid
{
  if (self->localPort)
  {
    remotePort = self->remotePort;
    if (remotePort) {
      LOBYTE(remotePort) = CFMessagePortIsValid(remotePort) != 0;
    }
  }
  else
  {
    LOBYTE(remotePort) = 0;
  }
  return (char)remotePort;
}

- (BOOL)openWithConnection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[PLBasebandLogChannel openWithConnection:]";
    _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_INFO, "%s: Entered BB logging channel", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __43__PLBasebandLogChannel_openWithConnection___block_invoke;
    v19 = &unk_1E692A830;
    v20 = @"Critical";
    uint64_t v21 = v7;
    if (qword_1EBD5BD90 != -1) {
      dispatch_once(&qword_1EBD5BD90, &v16);
    }
    BOOL v8 = _MergedGlobals_85 == 0;

    if (!v8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Opening BB logging channel", v16, v17, v18, v19);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBasebandLogChannel openWithConnection:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:53];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  objc_sync_exit(v5);

  return 0;
}

uint64_t __43__PLBasebandLogChannel_openWithConnection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  _MergedGlobals_85 = result;
  return result;
}

- (void)close
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __29__PLBasebandLogChannel_close__block_invoke;
    uint64_t v16 = &unk_1E692A830;
    uint64_t v17 = @"Critical";
    uint64_t v18 = v3;
    if (qword_1EBD5BD98 != -1) {
      dispatch_once(&qword_1EBD5BD98, &v13);
    }
    BOOL v4 = byte_1EBD5BD89 == 0;

    if (!v4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Closing BB logging channel", v13, v14, v15, v16);
      objc_super v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m"];
      BOOL v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandLogChannel close]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:60];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v2->localPort)
  {
    v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[PLBasebandLogChannel close]";
      _os_log_impl(&dword_1D2690000, v11, OS_LOG_TYPE_INFO, "%s: Entered Port close, local port ", buf, 0xCu);
    }

    CFMessagePortSetInvalidationCallBack(v2->localPort, 0);
    CFMessagePortInvalidate(v2->localPort);
    CFRelease(v2->localPort);
    v2->localPort = 0;
  }
  if (v2->remotePort)
  {
    v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[PLBasebandLogChannel close]";
      _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_INFO, "%s: Entered Port remote port", buf, 0xCu);
    }

    CFMessagePortSetInvalidationCallBack(v2->remotePort, 0);
    CFMessagePortInvalidate(v2->remotePort);
    CFRelease(v2->remotePort);
    v2->remotePort = 0;
  }
  objc_sync_exit(v2);
}

uint64_t __29__PLBasebandLogChannel_close__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD5BD89 = result;
  return result;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(PLBasebandLogChannel *)self close];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __34__PLBasebandLogChannel_invalidate__block_invoke;
    v15 = &unk_1E692A830;
    uint64_t v16 = @"Critical";
    uint64_t v17 = v3;
    if (qword_1EBD5BDA0 != -1) {
      dispatch_once(&qword_1EBD5BDA0, &v12);
    }
    int v4 = byte_1EBD5BD8A;

    if (v4)
    {
      objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"BB logging channel became Invalid", v12, v13, v14, v15);
      v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m"];
      BOOL v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandLogChannel invalidate]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:81];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = [(PLBasebandLogChannel *)self delegate];
  [v11 channelDidBecomeInvalid:self];
}

uint64_t __34__PLBasebandLogChannel_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD5BD8A = result;
  return result;
}

- (void)flush
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F23E00];
  v5[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(PLBasebandLogChannel *)self sendObjectOverRemotePort:v3];
}

- (void)commitHardwareLogs
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F23DE8];
  v5[0] = &unk_1F29E4F90;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(PLBasebandLogChannel *)self sendObjectOverRemotePort:v3];
}

- (void)enableLogCodes:(id)a3 andEvents:(id)a4 andExtraCode:(id)a5
{
  BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v14 = [v8 dictionary];
  BOOL v12 = [(PLBasebandLogChannel *)self cachingEnabled];
  uint64_t v13 = (void *)MEMORY[0x1E4F23E50];
  if (!v12) {
    uint64_t v13 = (void *)MEMORY[0x1E4F23E58];
  }
  [v14 setObject:*v13 forKeyedSubscript:*MEMORY[0x1E4F23E40]];
  [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F23E28]];

  [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F23E10]];
  [v14 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F23E08]];

  [(PLBasebandLogChannel *)self sendObjectOverRemotePort:v14];
}

- (void)sendObjectOverRemotePort:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if ([(PLBasebandLogChannel *)v5 isValid])
  {
    CFDataRef Data = CFPropertyListCreateData(0, v4, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      uint64_t v7 = CFMessagePortSendRequest(v5->remotePort, 0, Data, 1.0, 0.0, 0, 0);
      CFRelease(Data);
      if (v7)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v8 = objc_opt_class();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v16 = 3221225472;
          uint64_t v17 = __49__PLBasebandLogChannel_sendObjectOverRemotePort___block_invoke;
          uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
          uint64_t v19 = v8;
          if (qword_1EBD5BDA8 != -1) {
            dispatch_once(&qword_1EBD5BDA8, &block);
          }
          if (byte_1EBD5BD8B)
          {
            id v9 = objc_msgSend(NSString, "stringWithFormat:", @"unable to send object over port (%d)", v7, block, v16, v17, v18, v19);
            id v10 = (void *)MEMORY[0x1E4F929B8];
            id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m"];
            BOOL v12 = [v11 lastPathComponent];
            uint64_t v13 = [NSString stringWithUTF8String:"-[PLBasebandLogChannel sendObjectOverRemotePort:]"];
            [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:121];

            id v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v9;
              _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        [(PLBasebandLogChannel *)v5 invalidate];
      }
    }
  }
  objc_sync_exit(v5);
}

uint64_t __49__PLBasebandLogChannel_sendObjectOverRemotePort___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BD8B = result;
  return result;
}

- (void)setHardwareLoggingLevel:(unint64_t)a3 withWindowSize:(unint64_t)a4
{
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F23E20]];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F23E18]];

  if (a3)
  {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F23DF0]];
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F23DF8]];
  }
  [(PLBasebandLogChannel *)self sendObjectOverRemotePort:v10];
}

- (void)setChannelTimeout:(double)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F23E48];
  uint64_t v4 = *MEMORY[0x1E4F23E30];
  v7[0] = *MEMORY[0x1E4F23E38];
  v7[1] = v4;
  objc_super v5 = [NSNumber numberWithDouble:a3];
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(PLBasebandLogChannel *)self sendObjectOverRemotePort:v6];
}

- (void)connectionInvalidated:(id)a3
{
  if (self->remotePort || self->localPort) {
    [(PLBasebandLogChannel *)self invalidate];
  }
}

- (PLBasebandLogChannelDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PLBasebandLogChannelDelegate *)a3;
}

- (BOOL)cachingEnabled
{
  return self->cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->cachingEnabled = a3;
}

@end