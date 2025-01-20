@interface GTSharedMemoryTransport_tools_diagnostics
- (BOOL)_clientConnect:(id *)a3;
- (BOOL)_createAndRunSources:(id *)a3;
- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_serverConnect:(id *)a3;
- (BOOL)connected;
- (BOOL)deferred;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8;
- (GTSharedMemoryTransport_tools_diagnostics)init;
- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3;
- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4;
- (id)_getSharedMemoryNameWithSuffix:(id)a3;
- (id)connect;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3;
- (unint64_t)_computeBytesAvailableToRead;
- (unint64_t)_computeBytesAvailableToWrite;
- (unsigned)_nextMessageSerial;
- (void)_accumulateMessageBytes;
- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4;
- (void)_copyToSM:(const void *)a3 size:(int64_t)a4;
- (void)_dequeueIncomingMessages;
- (void)_dequeuePacket;
- (void)_invalidate;
- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5;
- (void)_relayPacket;
- (void)_setupIOBuffers;
- (void)_tearDownSharedMemory;
- (void)_updateReaderOffset:(unint64_t)a3;
- (void)_waitEAGAIN;
- (void)dealloc;
- (void)setRelayTransport:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GTSharedMemoryTransport_tools_diagnostics

- (BOOL)deferred
{
  return self->_deferred;
}

- (void)_dequeueIncomingMessages
{
  unsigned int v3 = 0;
  uint64_t v4 = 3;
  int v5 = 3;
  while (1)
  {
    while (1)
    {
      unsigned int v6 = atomic_load((unsigned int *)self->_incomingShmem + 2);
      unsigned int v7 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v6 == v7) {
        break;
      }
      if (atomic_load((unsigned int *)&self->super.super._invalid)) {
        BOOL v9 = v3 > 9;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        goto LABEL_21;
      }
      [(GTSharedMemoryTransport_tools_diagnostics *)self _dequeuePacket];
      if (!self->_currentPacketBytesLeft) {
        return;
      }
      if (self->_consumeBytesSEL) {
        SEL consumeBytesSEL = self->_consumeBytesSEL;
      }
      else {
        SEL consumeBytesSEL = 0;
      }
      ((void (*)(GTSharedMemoryTransport_tools_diagnostics *, SEL))self->_consumeBytesIMP)(self, consumeBytesSEL);
      if (self->_currentPacketBytesLeft) {
        goto LABEL_24;
      }
      atomic_fetch_add((atomic_uint *volatile)self->_incomingShmem + 2, 1u);
      ++v3;
    }
    unsigned int v11 = atomic_load((unsigned int *)self->_incomingShmem);
    BOOL v12 = v5-- != 0;
    BOOL v13 = v12;
    if (!v11 || !v13) {
      break;
    }
    usleep(0xAu);
  }
LABEL_21:
  unsigned int v15 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  if (v15 != -1) {
    return;
  }
  uint64_t v4 = 31;
LABEL_24:
  [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:v4 userInfo:0]];
}

- (void)_dequeuePacket
{
  unint64_t v3 = [(GTSharedMemoryTransport_tools_diagnostics *)self _computeBytesAvailableToRead];
  if (v3 <= 3)
  {
    [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:259 userInfo:0]];
  }
  else
  {
    unint64_t v4 = v3;
    unsigned int v7 = 0;
    [(GTSharedMemoryTransport_tools_diagnostics *)self _copyFromSM:&v7 size:4];
    if (v4 < v7)
    {
      [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:259 userInfo:0]];
    }
    else
    {
      self->_currentPacketBytesLeft = v7 - 4;
    }
  }
}

- (void)_relayPacket
{
  incomingBuffer = (char *)self->_incomingBuffer;
  uint64_t v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  [(GTBaseStreamTransport_tools_diagnostics *)self->_relayTransport _relayBuffer:&incomingBuffer[v4] size:self->_currentPacketBytesLeft];
  unsigned int v5 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  [(GTSharedMemoryTransport_tools_diagnostics *)self _updateReaderOffset:self->_currentPacketBytesLeft + v5];
  self->_currentPacketBytesLeft = 0;
}

- (void)_accumulateMessageBytes
{
  while (self->_currentPacketBytesLeft
       && [(GTBaseStreamTransport_tools_diagnostics *)self _readAndAccumulate] > 0)
    ;
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  unint64_t currentPacketBytesLeft = self->_currentPacketBytesLeft;
  if (currentPacketBytesLeft)
  {
    if (currentPacketBytesLeft >= a4) {
      int64_t v6 = a4;
    }
    else {
      int64_t v6 = self->_currentPacketBytesLeft;
    }
    [(GTSharedMemoryTransport_tools_diagnostics *)self _copyFromSM:a3 size:v6];
    self->_currentPacketBytesLeft -= v6;
  }
  else
  {
    *__error() = 35;
    return -1;
  }
  return v6;
}

- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  memcpy(a3, (char *)self->_incomingBuffer + v6, a4);

  [(GTSharedMemoryTransport_tools_diagnostics *)self _updateReaderOffset:v6 + a4];
}

- (void)_updateReaderOffset:(unint64_t)a3
{
  incomingShmem = (unsigned int *)self->_incomingShmem;
  unint64_t v4 = incomingShmem[7];
  if (v4 > a3) {
    LODWORD(v4) = 0;
  }
  atomic_store(a3 - v4, incomingShmem + 5);
}

- (unsigned)_nextMessageSerial
{
  return atomic_fetch_add((atomic_uint *volatile)self->_masterSMRegion + 3, 1u) + 1;
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4)
  {
    unsigned int v7 = atomic_load((unsigned int *)&self->super.super._invalid);
    atomic_store(v7, (unsigned int *)self->_outgoingShmem);
    unint64_t v8 = [(GTSharedMemoryTransport_tools_diagnostics *)self _computeBytesAvailableToWrite];
    if (v8 > 4)
    {
      if (v8 - 4 < v4) {
        unint64_t v4 = v8 - 4;
      }
      int v10 = v4 + 4;
      [(GTSharedMemoryTransport_tools_diagnostics *)self _copyToSM:&v10 size:4];
      [(GTSharedMemoryTransport_tools_diagnostics *)self _copyToSM:a3 size:v4];
      atomic_fetch_add((atomic_uint *volatile)self->_outgoingShmem + 1, 1u);
    }
    else
    {
      *__error() = 35;
      return -1;
    }
  }
  return v4;
}

- (void)_waitEAGAIN
{
  unsigned int v3 = 0;
  do
  {
    usleep(0xC8u);
    if ([(GTSharedMemoryTransport_tools_diagnostics *)self _computeBytesAvailableToRead] > 4) {
      break;
    }
  }
  while (v3++ < 4);
}

- (void)_copyToSM:(const void *)a3 size:(int64_t)a4
{
  uint64_t v6 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  memcpy((char *)self->_outgoingBuffer + v6, a3, a4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  unint64_t v8 = outgoingShmem[7];
  if (v6 + a4 < v8) {
    LODWORD(v8) = 0;
  }
  atomic_store(v6 + a4 - v8, outgoingShmem + 4);
}

- (unint64_t)_computeBytesAvailableToRead
{
  unsigned int v2 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  unsigned int v3 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  unsigned int v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  if (v3 >= v2)
  {
    incomingShmem = (unsigned int *)self->_incomingShmem;
    if (v2 == v4)
    {
      unsigned int v7 = atomic_load(incomingShmem + 2);
      unsigned int v8 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v7 == v8) {
        return 0;
      }
      else {
        return *((_DWORD *)self->_incomingShmem + 7);
      }
    }
    else
    {
      unsigned int v9 = incomingShmem[7];
      unsigned int v10 = atomic_load(incomingShmem + 5);
      return v9 + v2 - v10;
    }
  }
  else
  {
    return v2 - v4;
  }
}

- (unint64_t)_computeBytesAvailableToWrite
{
  unsigned int v2 = atomic_load((unsigned int *)self->_outgoingShmem + 5);
  unsigned int v3 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (v2 >= v3)
  {
    unsigned int v8 = atomic_load(outgoingShmem + 4);
    unsigned int v9 = (unsigned int *)self->_outgoingShmem;
    if (v2 == v8)
    {
      unsigned int v10 = atomic_load(v9 + 2);
      unsigned int v11 = atomic_load((unsigned int *)self->_outgoingShmem + 1);
      if (v10 == v11) {
        return *((_DWORD *)self->_outgoingShmem + 7);
      }
      else {
        return 0;
      }
    }
    else
    {
      unsigned int v12 = atomic_load(v9 + 4);
      return v2 - v12;
    }
  }
  else
  {
    unsigned int v5 = outgoingShmem[7];
    unsigned int v6 = atomic_load(outgoingShmem + 4);
    return v5 + v2 - v6;
  }
}

- (void)_invalidate
{
  atomic_store(0xFFFFFFFF, (unsigned int *)self->_outgoingShmem + 4);
  [(GTSharedMemoryTransport_tools_diagnostics *)self _tearDownSharedMemory];
  v3.receiver = self;
  v3.super_class = (Class)GTSharedMemoryTransport_tools_diagnostics;
  [(GTBaseStreamTransport_tools_diagnostics *)&v3 _invalidate];
}

- (BOOL)connected
{
  return self->_masterSMRegion != 0;
}

- (id)connect
{
  id v3 = +[GTFuture_tools_diagnostics future];
  queue = self->super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __34__GTSharedMemoryTransport_connect__block_invoke;
  v6[3] = &unk_249E8;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

- (BOOL)_clientConnect:(id *)a3
{
  [self->_getSharedMemoryNameWithSuffix:@"c" getCString:self->_sendName maxLength:64 encoding:1];
  [self->_getSharedMemoryNameWithSuffix:@"s" getCString:self->_receiveName maxLength:64 encoding:1];
  if (![(GTSharedMemoryTransport_tools_diagnostics *)self _openSMRegion:&self->_incomingShmem size:self->_sm_region_size_small name:self->_receiveName error:a3]|| ![(GTSharedMemoryTransport_tools_diagnostics *)self _openSMRegion:&self->_outgoingShmem size:self->_sm_region_size_large name:self->_sendName error:a3])
  {
    return 0;
  }
  [(GTSharedMemoryTransport_tools_diagnostics *)self _setupIOBuffers];
  BOOL result = [(GTSharedMemoryTransport_tools_diagnostics *)self _createAndRunSources:a3];
  self->_masterSMRegion = self->_outgoingShmem;
  return result;
}

- (BOOL)_serverConnect:(id *)a3
{
  [self->_getSharedMemoryNameWithSuffix:@"s" getCString:self->_sendName maxLength:64 encoding:1];
  [self->_getSharedMemoryNameWithSuffix:@"c" getCString:self->_receiveName maxLength:64 encoding:1];
  if (![(GTSharedMemoryTransport_tools_diagnostics *)self _initializeSMRegion:&self->_outgoingShmem size:self->_sm_region_size_small name:self->_sendName error:a3]|| ![(GTSharedMemoryTransport_tools_diagnostics *)self _initializeSMRegion:&self->_incomingShmem size:self->_sm_region_size_large name:self->_receiveName error:a3])
  {
    return 0;
  }
  [(GTSharedMemoryTransport_tools_diagnostics *)self _setupIOBuffers];
  BOOL result = [(GTSharedMemoryTransport_tools_diagnostics *)self _createAndRunSources:a3];
  self->_masterSMRegion = self->_incomingShmem;
  return result;
}

- (BOOL)_createAndRunSources:(id *)a3
{
  pthread_attr_init(&v16);
  pthread_attr_setdetachstate(&v16, 2);
  uint64_t v10 = 0;
  unsigned int v11 = &v10;
  uint64_t v12 = 0x3052000000;
  BOOL v13 = __Block_byref_object_copy__80;
  v14 = __Block_byref_object_dispose__81;
  uint64_t v15 = 0;
  unsigned int v4 = [GTContinuation_tools_diagnostics alloc];
  queue = self->super.super._queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __48__GTSharedMemoryTransport__createAndRunSources___block_invoke;
  v9[3] = &unk_24C40;
  v9[4] = self;
  v9[5] = &v10;
  unsigned int v6 = [(GTContinuation_tools_diagnostics *)v4 initWithQueue:queue block:v9];
  v11[5] = (uint64_t)v6;
  pthread_t v8 = 0;
  pthread_create(&v8, &v16, (void *(__cdecl *)(void *))smt_poll_thread_entry, v6);
  pthread_attr_destroy(&v16);
  _Block_object_dispose(&v10, 8);
  return 1;
}

- (void)_setupIOBuffers
{
  self->_outgoingBuffer = (char *)self->_outgoingShmem + 0x4000;
  self->_incomingBuffer = (char *)self->_incomingShmem + 0x4000;
}

- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v12 = shm_open(a5, 2, 6);
    if (v12 != -1) {
      break;
    }
    if (*__error() == 4)
    {
      if (i >= 3) {
        goto LABEL_17;
      }
    }
    else if (*__error() != 2 || i >= 3)
    {
      goto LABEL_17;
    }
    sleep(1u);
  }
  int v14 = v12;
  if (((a4 + vm_page_size - 1) & -(uint64_t)vm_page_size) <= 0x8000) {
    unint64_t v15 = 0x8000;
  }
  else {
    unint64_t v15 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  pthread_attr_t v16 = [(GTSharedMemoryTransport_tools_diagnostics *)self _mapSharedMemoryFile:v12 size:v15 error:a6];
  if (v16)
  {
    v17 = v16;
    close(v14);
    if (shm_unlink(a5) != -1)
    {
      *a3 = v17;
      LOBYTE(v16) = 1;
      return (char)v16;
    }
LABEL_17:
    if (a6)
    {
      v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      LOBYTE(v16) = 0;
      *a6 = v18;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return (char)v16;
}

- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  if (((a4 + vm_page_size - 1) & -(uint64_t)vm_page_size) <= 0x8000) {
    unint64_t v9 = 0x8000;
  }
  else {
    unint64_t v9 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  uint64_t v10 = shm_open(a5, 2562, 390);
  if (v10 == -1 || (uint64_t v11 = v10, ftruncate(v10, v9) == -1))
  {
    if (a6)
    {
      unint64_t v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      LOBYTE(v12) = 0;
      *a6 = v15;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    uint64_t v12 = [(GTSharedMemoryTransport_tools_diagnostics *)self _mapSharedMemoryFile:v11 size:v9 error:a6];
    if (v12)
    {
      BOOL v13 = v12;
      close(v11);
      memset_pattern16(v13, &-[GTSharedMemoryTransport _initializeSMRegion:size:name:error:]::pattern, v9);
      atomic_store(0, (unsigned int *)v13);
      atomic_store(0, (unsigned int *)v13 + 1);
      atomic_store(0, (unsigned int *)v13 + 2);
      unsigned int v14 = atomic_load(&self->super.super._messageCounter.__a_.__a_value);
      atomic_store(v14, (unsigned int *)v13 + 3);
      atomic_store(0, (unsigned int *)v13 + 4);
      atomic_store(0, (unsigned int *)v13 + 5);
      *((_DWORD *)v13 + 6) = v9;
      *((_DWORD *)v13 + 7) = v9 - 0x4000;
      *a3 = (sm_region_header *)v13;
      LOBYTE(v12) = 1;
    }
  }
  return (char)v12;
}

- (void)_tearDownSharedMemory
{
  incomingShmem = (unsigned int *)self->_incomingShmem;
  if (incomingShmem)
  {
    munmap(incomingShmem, [(GTSharedMemoryTransport_tools_diagnostics *)self _calculateVMRegionMapSize:incomingShmem[6]]);
    self->_incomingShmem = 0;
    self->_incomingBuffer = 0;
  }
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (outgoingShmem)
  {
    munmap(outgoingShmem, [(GTSharedMemoryTransport_tools_diagnostics *)self _calculateVMRegionMapSize:outgoingShmem[6]]);
    self->_outgoingShmem = 0;
    self->_outgoingBuffer = 0;
  }
  self->_masterSMRegion = 0;
  if (self->_sendName[0]) {
    shm_unlink(self->_sendName);
  }
  if (self->_receiveName[0])
  {
    shm_unlink(self->_receiveName);
  }
}

- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  size_t v8 = [(GTSharedMemoryTransport_tools_diagnostics *)self _calculateVMRegionMapSize:a4];
  unint64_t v9 = (char *)mmap(0, v8, 0, 4098, -1, 0);
  if (v9 == (char *)-1)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v10 = 0;
    *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
  }
  else
  {
    uint64_t v10 = v9;
    if (mmap(v9, a4, 3, 17, a3, 0) != v9 || mmap(&v10[a4], a4 - 0x4000, 3, 17, a3, 0x4000) != &v10[a4])
    {
      if (a5) {
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      }
      munmap(v10, v8);
      return 0;
    }
  }
  return v10;
}

- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3
{
  return 2 * a3;
}

- (id)_getSharedMemoryNameWithSuffix:(id)a3
{
  return +[NSString stringWithFormat:@"gdt-%@-%@", [(NSString *)[(NSURL *)self->super.super._url path] substringFromIndex:1], a3];
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  if (self->_deferred)
  {
    BOOL v13 = objc_alloc_init(GTBufferedSendOperation_tools_diagnostics);
    [(GTBufferedSendOperation_tools_diagnostics *)v13 setMessage:a3];
    [(GTBufferedSendOperation_tools_diagnostics *)v13 setReplyTo:a4];
    [(GTBufferedSendOperation_tools_diagnostics *)v13 setQueue:a6];
    [(GTBufferedSendOperation_tools_diagnostics *)v13 setReplyBlock:a8];
    [(NSMutableArray *)self->_bufferedMessages addObject:v13];
    return 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GTSharedMemoryTransport_tools_diagnostics;
    return [(GTTransport_tools_diagnostics *)&v15 send:a3 inReplyTo:a4 error:a5 replyQueue:a6 timeout:a7 handler:a8];
  }
}

- (void)setRelayTransport:(id)a3
{
  queue = self->super.super._queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__GTSharedMemoryTransport_setRelayTransport___block_invoke;
  v4[3] = &unk_249E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)setUrl:(id)a3
{
  if (!a3) {
    __assert_rtn("-[GTSharedMemoryTransport setUrl:]", ", 0, "newUrl != nil"");
  }
  if ([(GTSharedMemoryTransport_tools_diagnostics *)self connected])
  {
    if (s_logUsingOsLog)
    {
      unsigned int v6 = gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        unsigned int v7 = "fail: tried to set URL on connected transport";
        size_t v8 = v6;
        uint32_t v9 = 2;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v11 = __stderrp;
      [+[NSString stringWithFormat:@"fail: tried to set URL on connected transport"] UTF8String];
      fprintf(v11, "%s\n");
    }
    goto LABEL_23;
  }
  if ((objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmt") & 1) == 0
    && (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmtdeferred") & 1) == 0)
  {
    if (s_logUsingOsLog)
    {
      uint64_t v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = [[objc_msgSend(a3, "absoluteString") UTF8String];
        unsigned int v7 = "fail: url scheme has to be dysmt: %s";
        goto LABEL_17;
      }
LABEL_23:
      abort();
    }
    uint64_t v12 = __stderrp;
    BOOL v13 = +[NSString stringWithFormat:](NSString, @"fail: url scheme has to be dysmt: %s", [objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String") UTF8String]);
LABEL_22:
    [(NSString *)v13 UTF8String];
    fprintf(v12, "%s\n");
    goto LABEL_23;
  }
  if (!objc_msgSend(objc_msgSend(a3, "path"), "length"))
  {
    if (s_logUsingOsLog)
    {
      uint64_t v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = [[objc_msgSend(a3, "absoluteString") UTF8String];
        unsigned int v7 = "fail: url path cannot be nil or empty: %s";
LABEL_17:
        size_t v8 = v10;
        uint32_t v9 = 12;
LABEL_18:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }
      goto LABEL_23;
    }
    uint64_t v12 = __stderrp;
    BOOL v13 = +[NSString stringWithFormat:](NSString, @"fail: url path cannot be nil or empty: %s", [objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String") UTF8String]);
    goto LABEL_22;
  }
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__GTSharedMemoryTransport_setUrl___block_invoke;
  block[3] = &unk_249E8;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GTSharedMemoryTransport_tools_diagnostics;
  [(GTBaseStreamTransport_tools_diagnostics *)&v3 dealloc];
}

- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)GTSharedMemoryTransport_tools_diagnostics;
  unsigned int v6 = [(GTBaseStreamTransport_tools_diagnostics *)&v16 init];
  unsigned int v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_mode = a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    objc_super v15 = "_mode == kDYSharedMemoryTransportModeClient || _mode == kDYSharedMemoryTransportModeServer";
    goto LABEL_12;
  }
  atomic_store(a4, &v6->super.super._messageCounter.__a_.__a_value);
  CFUUIDRef v8 = CFUUIDCreate(kCFAllocatorDefault);
  id v9 = objc_alloc((Class)NSURL);
  CFHashCode v10 = CFHash(v8);
  v7->super.super._url = (NSURL *)[v9 initWithString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dysmt://localhost/%lx%d", v10, getpid())];
  CFRelease(v8);
  p_SEL consumeBytesSEL = &v7->_consumeBytesSEL;
  if ("_accumulateMessageBytes")
  {
    *p_SEL consumeBytesSEL = "_accumulateMessageBytes";
    uint64_t v12 = "_accumulateMessageBytes";
  }
  else
  {
    uint64_t v12 = 0;
    *p_SEL consumeBytesSEL = 0;
  }
  id v13 = [(GTSharedMemoryTransport_tools_diagnostics *)v7 methodForSelector:v12];
  v7->_consumeBytesIMP = v13;
  if (!v13)
  {
    objc_super v15 = "_consumeBytesIMP";
LABEL_12:
    __assert_rtn("-[GTSharedMemoryTransport initWithMode:initialMessageSerial:]", "", 0, v15);
  }
  v7->_bufferedMessages = (NSMutableArray *)objc_opt_new();
  v7->_sm_region_size_large = 104857600;
  v7->_sm_region_size_small = 0x1000000;
  if (![+[NSProcessInfo processInfo] isiOSAppOnMac])
  {
    v7->_sm_region_size_large = 0x40000;
    v7->_sm_region_size_small = 0x4000;
  }
  return v7;
}

- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3
{
  return [(GTSharedMemoryTransport_tools_diagnostics *)self initWithMode:*(void *)&a3 initialMessageSerial:0];
}

- (GTSharedMemoryTransport_tools_diagnostics)init
{
  return 0;
}

@end