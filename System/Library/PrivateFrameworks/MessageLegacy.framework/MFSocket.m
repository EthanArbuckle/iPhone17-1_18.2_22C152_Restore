@interface MFSocket
@end

@implementation MFSocket

intptr_t __37___MFSocket__evaluateTrust_errorPtr___block_invoke(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 2:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      [*(id *)(a1 + 32) _setCertificateIsTrusted:1 forAccount:*(void *)(a1 + 40)];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F58108], "defaultTrustManager"), "allowTrust:forHost:service:", *(void *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32));
      break;
    case 1:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      break;
    case 0:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      v3 = +[MFError errorWithDomain:*MEMORY[0x1E4F288C8] code:-9825 localizedDescription:0];
      if (!v3) {
        v3 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      **(void **)(a1 + 72) = v3;
      v4 = MFLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __37___MFSocket__evaluateTrust_errorPtr___block_invoke_cold_1(a1, v3);
      }
      break;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __17___MFSocket_init__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v0 objectForKey:@"SocketTimeout"])
  {
    int v1 = [v0 integerForKey:@"SocketTimeout"];
    _DefaultTimeout = v1 & ~(v1 >> 31);
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DisableThroughputMonitoring"))
  {
    _LowThroughputThreshold = 1;
    v2 = MFLogGeneral();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v8[0]) = 0;
    v3 = "#Streams throughput monitoring is OFF";
    v4 = v2;
    uint32_t v5 = 2;
  }
  else
  {
    v6 = MFLogGeneral();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    if (_LowThroughputThreshold) {
      int v7 = 0;
    }
    else {
      int v7 = 512;
    }
    v8[0] = 67109120;
    v8[1] = v7;
    v3 = "#Streams low throughput threshold is %d bytes/sec";
    v4 = v6;
    uint32_t v5 = 8;
  }
  _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, v3, (uint8_t *)v8, v5);
}

uint64_t __44___MFSocket_connectToHost_withPort_service___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [*(id *)(a1 + 32) stream];
  if (result == a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    if ([a3 isEqualToString:@"MFStreamEventCanAcceptBytes"])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 75) = 1;
    }
    else
    {
      int v7 = [a3 isEqualToString:@"MFStreamEventHasBytesAvailable"];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v7)
      {
        *(unsigned char *)(v8 + 74) = 1;
        objc_msgSend(*(id *)(a1 + 32), "mf_lock");
        id v9 = *(id *)(*(void *)(a1 + 32) + 48);
        objc_msgSend(*(id *)(a1 + 32), "mf_unlock");
        if (v9)
        {
          uint64_t v10 = 2;
          [v9 setArgument:&v10 atIndex:2];
          [v9 invoke];
        }
      }
      else
      {
        *(unsigned char *)(v8 + 75) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 74) = 0;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 8) broadcast];
    return [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  }
  return result;
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(id)MFUserAgent() isForeground]) {
    return;
  }
  Weak = (int *)objc_loadWeak((id *)(a1 + 40));
  uint32_t v5 = Weak;
  if (Weak) {
    ++Weak[16];
  }
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_2();
    if (v5)
    {
LABEL_6:
      if (v5[16] < 11) {
        return;
      }
    }
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  int v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = a2;
    __int16 v16 = 2112;
    uint64_t v17 = [v5 stream];
    _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, "#Streams (%p) tearing down connection %@ due to low throughput", buf, 0x16u);
  }
  v12[0] = @"stream";
  v12[1] = @"threshold";
  v13[0] = objc_msgSend(NSString, "stringWithFormat:", @"%p", objc_msgSend(v5, "stream"));
  if (_LowThroughputThreshold) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 512;
  }
  v13[1] = [NSNumber numberWithInt:v8];
  +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", @"LowThroughput", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2]);
  id v9 = +[MFError errorWithDomain:*MEMORY[0x1E4F28798] code:60 localizedDescription:0];
  if (!v9) {
    id v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
  }
  uint64_t v10 = v9;
  v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_1();
  }
  [*(id *)(a1 + 32) setError:v10];

  [v5 abort];
}

void __37___MFSocket__evaluateTrust_errorPtr___block_invoke_cold_1(uint64_t a1, void *a2)
{
  [a2 domain];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v2, v3, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1CFCFE000, v0, v1, "#Streams (%p) received low throughput notification", v2, v3, v4, v5, v6);
}

@end