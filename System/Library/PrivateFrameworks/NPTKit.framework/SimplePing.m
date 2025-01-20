@interface SimplePing
+ (unint64_t)icmpHeaderOffsetInIPv4Packet:(id)a3;
- (BOOL)nextSequenceNumberHasWrapped;
- (BOOL)validatePing4ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4;
- (BOOL)validatePing6ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4;
- (BOOL)validatePingResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4;
- (BOOL)validateSequenceNumber:(unsigned __int16)a3;
- (NSData)hostAddress;
- (NSString)hostName;
- (SimplePing)initWithHostName:(id)a3;
- (SimplePingDelegate)delegate;
- (__CFHost)host;
- (__CFSocket)socket;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pingPacketWithType:(unsigned __int8)a3 payload:(id)a4 requiresChecksum:(BOOL)a5;
- (int64_t)addressStyle;
- (unsigned)hostAddressFamily;
- (unsigned)identifier;
- (unsigned)nextSequenceNumber;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didFailWithHostStreamError:(id)a3;
- (void)hostResolutionDone;
- (void)readData;
- (void)sendPingWithData:(id)a3;
- (void)setAddressStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHost:(__CFHost *)a3;
- (void)setHostAddress:(id)a3;
- (void)setNextSequenceNumber:(unsigned __int16)a3;
- (void)setNextSequenceNumberHasWrapped:(BOOL)a3;
- (void)setSocket:(__CFSocket *)a3;
- (void)setupTimer:(id)a3 currentSequenceNumber:(unsigned __int16)a4;
- (void)start;
- (void)startWithHostAddress;
- (void)stop;
- (void)stopHostResolution;
- (void)stopSocket;
- (void)timeOutHandler:(id)a3 sequenceNumber:(unsigned __int16)a4;
@end

@implementation SimplePing

- (SimplePing)initWithHostName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SimplePing;
  v5 = [(SimplePing *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hostName = v5->_hostName;
    v5->_hostName = (NSString *)v6;

    v5->_identifier = arc4random();
  }

  return v5;
}

- (void)dealloc
{
  __assert_rtn("-[SimplePing dealloc]", "SimplePing.m", 144, "self->_host == NULL");
}

- (unsigned)hostAddressFamily
{
  uint64_t v3 = [(SimplePing *)self hostAddress];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  v5 = [(SimplePing *)self hostAddress];
  unint64_t v6 = [v5 length];

  if (v6 < 0x10) {
    return 0;
  }
  id v7 = [(SimplePing *)self hostAddress];
  unsigned __int8 v8 = *(unsigned char *)([v7 bytes] + 1);

  return v8;
}

- (void)didFailWithError:(id)a3
{
  id v6 = a3;
  if (!v6) {
    -[SimplePing didFailWithError:]();
  }
  id v4 = self;
  CFAutorelease(v4);
  [(SimplePing *)v4 stop];
  v5 = [(SimplePing *)v4 delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 simplePing:v4 didFailWithError:v6];
  }
}

- (void)didFailWithHostStreamError:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3.var0 == *MEMORY[0x263EFC730])
  {
    uint64_t v7 = *MEMORY[0x263EFC6F8];
    id v4 = [NSNumber numberWithInt:*(void *)&a3.var1];
    v8[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFC6F0] code:2 userInfo:v5];
  [(SimplePing *)self didFailWithError:v6];
}

- (id)pingPacketWithType:(unsigned __int8)a3 payload:(id)a4 requiresChecksum:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  objc_super v9 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v8, "length") + 8);
  if (!v9) {
    -[SimplePing pingPacketWithType:payload:requiresChecksum:]();
  }
  id v10 = v9;
  uint64_t v11 = [v10 mutableBytes];
  *(unsigned char *)uint64_t v11 = a3;
  *(unsigned char *)(v11 + 1) = 0;
  *(_WORD *)(v11 + 2) = 0;
  *(_WORD *)(v11 + 4) = __rev16([(SimplePing *)self identifier]);
  *(_WORD *)(v11 + 6) = __rev16([(SimplePing *)self nextSequenceNumber]);
  id v12 = v8;
  memcpy((void *)(v11 + 8), (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  if (v5)
  {
    id v13 = v10;
    v14 = (unsigned __int16 *)[v13 bytes];
    unint64_t v15 = [v13 length];
    if (v15 < 2)
    {
      int v16 = 0;
      if (!v15) {
        goto LABEL_8;
      }
    }
    else
    {
      int v16 = 0;
      do
      {
        int v17 = *v14++;
        v16 += v17;
        v15 -= 2;
      }
      while (v15 > 1);
      if (!v15) {
        goto LABEL_8;
      }
    }
    v16 += *(unsigned __int8 *)v14;
LABEL_8:
    *(_WORD *)(v11 + 2) = ~(HIWORD(v16) + v16 + (((v16 >> 16) + (unsigned __int16)v16) >> 16));
  }

  return v10;
}

- (void)setupTimer:(id)a3 currentSequenceNumber:(unsigned __int16)a4
{
  id v6 = a3;
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
  timeoutTimer = self->timeoutTimer;
  self->timeoutTimer = v8;

  id v10 = self->timeoutTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__SimplePing_setupTimer_currentSequenceNumber___block_invoke;
  handler[3] = &unk_2643A1E18;
  handler[4] = self;
  id v11 = v6;
  id v17 = v11;
  unsigned __int16 v18 = a4;
  dispatch_source_set_event_handler(v10, handler);
  id v12 = [(SimplePing *)self hostAddress];

  id v13 = self->timeoutTimer;
  if (v12) {
    int64_t v14 = 1000000000;
  }
  else {
    int64_t v14 = 5000000000;
  }
  dispatch_time_t v15 = dispatch_time(0, v14);
  dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_cancel_handler((dispatch_source_t)self->timeoutTimer, &__block_literal_global_2);
}

uint64_t __47__SimplePing_setupTimer_currentSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  if (v3 && !dispatch_source_testcancel(*(dispatch_source_t *)(v2 + 8)))
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 8);
  }
  *(void *)(v2 + 8) = 0;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 48);

  return [v4 timeOutHandler:v5 sequenceNumber:v6];
}

- (void)sendPingWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v6 = NSString;
    unsigned __int16 v7 = [(SimplePing *)self nextSequenceNumber];
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"%28zd bottles of beer on the wall", (unsigned __int16)(100 * (v7 / 0x64u) - v7 + 99));
    uint64_t v5 = [v8 dataUsingEncoding:1];

    if (!v5) {
      -[SimplePing sendPingWithData:]();
    }
    if ([v5 length] != 56) {
      -[SimplePing sendPingWithData:].cold.4();
    }
  }
  int v9 = [(SimplePing *)self hostAddressFamily];
  if (v9 == 30)
  {
    id v10 = self;
    uint64_t v11 = 128;
    id v12 = v5;
    uint64_t v13 = 0;
  }
  else
  {
    if (v9 != 2) {
      -[SimplePing sendPingWithData:]();
    }
    id v10 = self;
    uint64_t v11 = 8;
    id v12 = v5;
    uint64_t v13 = 1;
  }
  int64_t v14 = [(SimplePing *)v10 pingPacketWithType:v11 payload:v12 requiresChecksum:v13];
  if (!v14) {
    -[SimplePing sendPingWithData:]();
  }
  if ([(SimplePing *)self socket])
  {
    CFSocketNativeHandle Native = CFSocketGetNative(self->_socket);
    v27[0] = 0;
    v27[1] = 1000000;
    setsockopt(Native, 0xFFFF, 4101, v27, 0x10u);
    id v16 = v14;
    id v17 = (const void *)[v16 bytes];
    size_t v18 = [v16 length];
    id v19 = [(SimplePing *)self hostAddress];
    v20 = (const sockaddr *)[v19 bytes];
    v21 = [(SimplePing *)self hostAddress];
    ssize_t v22 = sendto(Native, v17, v18, 0, v20, [v21 length]);

    int v23 = 0;
    if (v22 < 0) {
      int v23 = *__error();
    }
  }
  else
  {
    int v23 = 9;
    ssize_t v22 = -1;
  }
  v24 = [(SimplePing *)self delegate];
  if (v22 >= 1 && v22 == [v14 length])
  {
    [(SimplePing *)self setupTimer:v4 currentSequenceNumber:self->_nextSequenceNumber];
    dispatch_activate((dispatch_object_t)self->timeoutTimer);
    if (v24 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v24, "simplePing:didSendPacket:sequenceNumber:", self, v14, -[SimplePing nextSequenceNumber](self, "nextSequenceNumber"));
    }
  }
  else
  {
    if (v23) {
      int v25 = v23;
    }
    else {
      int v25 = 55;
    }
    v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v25 userInfo:0];
    if (v24 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v24, "simplePing:didFailToSendPacket:sequenceNumber:error:", self, v14, -[SimplePing nextSequenceNumber](self, "nextSequenceNumber"), v26);
    }
  }
  [(SimplePing *)self setNextSequenceNumber:(unsigned __int16)([(SimplePing *)self nextSequenceNumber] + 1)];
  if (![(SimplePing *)self nextSequenceNumber]) {
    [(SimplePing *)self setNextSequenceNumberHasWrapped:1];
  }
}

- (void)timeOutHandler:(id)a3 sequenceNumber:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v12 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"Ping timed out"];
  unsigned __int16 v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [(SimplePing *)self hostAddress];

  if (!v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Ping host resolution timed out"];

    uint64_t v6 = (void *)v9;
  }
  [v7 setValue:v6 forKey:*MEMORY[0x263F08320]];
  id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPTKit" code:1 userInfo:v7];
  uint64_t v11 = [(SimplePing *)self delegate];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 simplePing:self didTimeOut:v12 sequenceNumber:v4 error:v10];
  }
}

+ (unint64_t)icmpHeaderOffsetInIPv4Packet:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0x1C
    && (id v4 = v3, v5 = (unsigned char *)[v4 bytes], (*v5 & 0xF0) == 0x40))
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5[9] == 1)
    {
      uint64_t v7 = 4 * (*v5 & 0xF);
      if ([v4 length] >= (unint64_t)(v7 + 8)) {
        unint64_t v6 = v7;
      }
    }
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)validateSequenceNumber:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  BOOL v5 = [(SimplePing *)self nextSequenceNumberHasWrapped];
  unsigned int v6 = [(SimplePing *)self nextSequenceNumber];
  if (v5) {
    return (unsigned __int16)(v6 - v3) < 0x78u;
  }
  else {
    return v6 > v3;
  }
}

- (BOOL)validatePing4ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() icmpHeaderOffsetInIPv4Packet:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  id v9 = v6;
  id v10 = (unsigned __int16 *)([v9 mutableBytes] + v8);
  int v11 = v10[1];
  v10[1] = 0;
  unint64_t v12 = [v9 length] - v8;
  if (v12 < 2)
  {
    int v13 = 0;
    int64_t v14 = v10;
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v13 = 0;
  int64_t v14 = v10;
  do
  {
    int v15 = *v14++;
    v13 += v15;
    v12 -= 2;
  }
  while (v12 > 1);
  if (v12) {
LABEL_6:
  }
    v13 += *(unsigned __int8 *)v14;
LABEL_7:
  v10[1] = v11;
  if (v11 != (unsigned __int16)~(HIWORD(v13) + v13 + (((v13 >> 16) + (unsigned __int16)v13) >> 16))
    || *(unsigned char *)v10
    || *((unsigned char *)v10 + 1)
    || (unsigned int v16 = bswap32(v10[2]), [(SimplePing *)self identifier] != HIWORD(v16))
    || (unsigned int v17 = bswap32(v10[3]) >> 16, ![(SimplePing *)self validateSequenceNumber:v17]))
  {
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v9, "replaceBytesInRange:withBytes:length:", 0, v8, 0, 0);
  *a4 = v17;
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (BOOL)validatePing6ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 8
    && (uint64_t v7 = (unsigned __int8 *)[v6 bytes], *v7 == 129)
    && (uint64_t v8 = v7, !v7[1])
    && (unsigned int v9 = bswap32(*((unsigned __int16 *)v7 + 2)), [(SimplePing *)self identifier] == HIWORD(v9))
    && (unsigned int v10 = bswap32(*((unsigned __int16 *)v8 + 3)) >> 16,
        [(SimplePing *)self validateSequenceNumber:v10]))
  {
    *a4 = v10;
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)validatePingResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6 = a3;
  int v7 = [(SimplePing *)self hostAddressFamily];
  if (v7 == 30)
  {
    BOOL v8 = [(SimplePing *)self validatePing6ResponsePacket:v6 sequenceNumber:a4];
  }
  else
  {
    if (v7 != 2) {
      -[SimplePing validatePingResponsePacket:sequenceNumber:]();
    }
    BOOL v8 = [(SimplePing *)self validatePing4ResponsePacket:v6 sequenceNumber:a4];
  }
  BOOL v9 = v8;

  return v9;
}

- (void)readData
{
  __assert_rtn("-[SimplePing readData]", "SimplePing.m", 576, "packet != nil");
}

- (void)startWithHostAddress
{
  __assert_rtn("-[SimplePing startWithHostAddress]", "SimplePing.m", 689, "rls != NULL");
}

- (void)hostResolutionDone
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  Boolean hasBeenResolved = 0;
  unsigned int v3 = CFHostGetAddressing([(SimplePing *)self host], &hasBeenResolved);
  id v4 = v3;
  if (hasBeenResolved) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    Boolean hasBeenResolved = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "bytes", (void)v15);
          if ((unint64_t)[v11 length] >= 0x10)
          {
            int v13 = *(unsigned __int8 *)(v12 + 1);
            if (v13 == 30)
            {
              if ([(SimplePing *)self addressStyle] != 1) {
                goto LABEL_20;
              }
            }
            else if (v13 == 2 && [(SimplePing *)self addressStyle] != 2)
            {
LABEL_20:
              [(SimplePing *)self setHostAddress:v11];
              Boolean hasBeenResolved = 1;
              goto LABEL_21;
            }
          }
          if (hasBeenResolved) {
            goto LABEL_21;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  [(SimplePing *)self stopHostResolution];
  if (hasBeenResolved)
  {
    [(SimplePing *)self startWithHostAddress];
  }
  else
  {
    int64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFC6F0] code:1 userInfo:0];
    [(SimplePing *)self didFailWithError:v14];
  }
}

- (void)start
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__SimplePing_start__block_invoke;
  block[3] = &unk_2643A17E8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __19__SimplePing_start__block_invoke(uint64_t a1)
{
  memset(&clientContext, 0, sizeof(clientContext));
  clientContext.info = *(void **)(a1 + 32);
  uint64_t v2 = [clientContext.info hostAddress];
  if (v2)
  {
  }
  else if (![*(id *)(a1 + 32) host])
  {
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) stop];
LABEL_5:
  if ([*(id *)(a1 + 32) host]) {
    __19__SimplePing_start__block_invoke_cold_3();
  }
  [*(id *)(a1 + 32) hostAddress];
  if (objc_claimAutoreleasedReturnValue()) {
    __19__SimplePing_start__block_invoke_cold_2();
  }
  unsigned int v3 = [*(id *)(a1 + 32) hostName];
  CFHostRef v4 = CFHostCreateWithName(0, v3);
  [*(id *)(a1 + 32) setHost:CFAutorelease(v4)];

  if (![*(id *)(a1 + 32) host]) {
    __19__SimplePing_start__block_invoke_cold_1();
  }
  v7.domain = 0;
  *(void *)&v7.error = 0;
  CFHostSetClient((CFHostRef)[*(id *)(a1 + 32) host], (CFHostClientCallBack)HostResolveCallback, &clientContext);
  BOOL v5 = (__CFHost *)[*(id *)(a1 + 32) host];
  Current = CFRunLoopGetCurrent();
  CFHostScheduleWithRunLoop(v5, Current, (CFStringRef)*MEMORY[0x263EFFE88]);
  if (!CFHostStartInfoResolution((CFHostRef)[*(id *)(a1 + 32) host], kCFHostAddresses, &v7)) {
    objc_msgSend(*(id *)(a1 + 32), "didFailWithHostStreamError:", v7.domain, *(void *)&v7.error);
  }
  [*(id *)(a1 + 32) setupTimer:0 currentSequenceNumber:0];
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

- (void)stopHostResolution
{
  if ([(SimplePing *)self host])
  {
    CFHostSetClient([(SimplePing *)self host], 0, 0);
    unsigned int v3 = [(SimplePing *)self host];
    Current = CFRunLoopGetCurrent();
    CFHostUnscheduleFromRunLoop(v3, Current, (CFStringRef)*MEMORY[0x263EFFE88]);
    [(SimplePing *)self setHost:0];
  }
}

- (void)stopSocket
{
  if ([(SimplePing *)self socket])
  {
    CFSocketInvalidate([(SimplePing *)self socket]);
    [(SimplePing *)self setSocket:0];
  }
}

- (void)stop
{
  timeoutTimer = self->timeoutTimer;
  if (timeoutTimer && !dispatch_source_testcancel((dispatch_source_t)self->timeoutTimer)) {
    dispatch_source_cancel(timeoutTimer);
  }
  [(SimplePing *)self stopHostResolution];
  [(SimplePing *)self stopSocket];

  [(SimplePing *)self setHostAddress:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFHostRef v4 = +[SimplePing allocWithZone:a3];
  BOOL v5 = [(SimplePing *)self hostName];
  id v6 = [(SimplePing *)v4 initWithHostName:v5];

  [(SimplePing *)v6 setAddressStyle:[(SimplePing *)self addressStyle]];
  return v6;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (SimplePingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SimplePingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)addressStyle
{
  return self->_addressStyle;
}

- (void)setAddressStyle:(int64_t)a3
{
  self->_addressStyle = a3;
}

- (NSData)hostAddress
{
  return self->_hostAddress;
}

- (void)setHostAddress:(id)a3
{
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unsigned)nextSequenceNumber
{
  return self->_nextSequenceNumber;
}

- (void)setNextSequenceNumber:(unsigned __int16)a3
{
  self->_nextSequenceNumber = a3;
}

- (BOOL)nextSequenceNumberHasWrapped
{
  return self->_nextSequenceNumberHasWrapped;
}

- (void)setNextSequenceNumberHasWrapped:(BOOL)a3
{
  self->_nextSequenceNumberHasWrapped = a3;
}

- (__CFHost)host
{
  return self->_host;
}

- (void)setHost:(__CFHost *)a3
{
}

- (__CFSocket)socket
{
  return self->_socket;
}

- (void)setSocket:(__CFSocket *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostName, 0);

  objc_storeStrong((id *)&self->timeoutTimer, 0);
}

- (void)didFailWithError:.cold.1()
{
  __assert_rtn("-[SimplePing didFailWithError:]", "SimplePing.m", 165, "error != nil");
}

- (void)pingPacketWithType:payload:requiresChecksum:.cold.1()
{
  __assert_rtn("-[SimplePing pingPacketWithType:payload:requiresChecksum:]", "SimplePing.m", 214, "packet != nil");
}

- (void)sendPingWithData:.cold.1()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 270, "payload != nil");
}

- (void)sendPingWithData:.cold.2()
{
}

- (void)sendPingWithData:.cold.3()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 289, "packet != nil");
}

- (void)sendPingWithData:.cold.4()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 275, "[payload length] == 56");
}

- (void)validatePingResponsePacket:sequenceNumber:.cold.1()
{
}

void __19__SimplePing_start__block_invoke_cold_1()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 805, "self.host != NULL");
}

void __19__SimplePing_start__block_invoke_cold_2()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 802, "self.hostAddress == nil");
}

void __19__SimplePing_start__block_invoke_cold_3()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 801, "self.host == NULL");
}

@end