@interface PLDataArrayInputStream
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (PLDataArrayInputStream)initWithDataArray:(id)a3;
- (PLDataArrayInputStreamProgressDelegate)progressDelegate;
- (id)delegate;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)bytesRead;
- (unint64_t)streamStatus;
- (unint64_t)totalBytes;
- (void)_scheduleCallback;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_scheduleProgressUpdate;
- (void)_streamEventTrigger;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_updateProgress;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setProgressDelegate:(id)a3;
@end

@implementation PLDataArrayInputStream

- (void)setProgressDelegate:(id)a3
{
  self->_progressDelegate = (PLDataArrayInputStreamProgressDelegate *)a3;
}

- (PLDataArrayInputStreamProgressDelegate)progressDelegate
{
  return self->_progressDelegate;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->_dataOffset < self->_dataLength;
}

- (unint64_t)bytesRead
{
  return self->_dataOffset;
}

- (unint64_t)totalBytes
{
  return self->_dataLength;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  bzero(a3, a4);
  unint64_t v6 = 0;
  if (self->_dataOffset < self->_dataLength && a4 != 0)
  {
    do
    {
      if (self->_currentIndex >= self->_dataCount || self->_currentOffset >= self->_currentLength) {
        break;
      }
      id v8 = -[NSArray objectAtIndex:](self->_dataArray, "objectAtIndex:");
      if (a4 - v6 >= self->_currentLength - self->_currentOffset) {
        size_t v9 = self->_currentLength - self->_currentOffset;
      }
      else {
        size_t v9 = a4 - v6;
      }
      memcpy(&a3[v6], (const void *)([v8 bytes] + self->_currentOffset), v9);
      self->_currentOffset += v9;
      unint64_t dataOffset = self->_dataOffset + v9;
      self->_unint64_t dataOffset = dataOffset;
      if (self->_currentOffset == self->_currentLength)
      {
        unint64_t v11 = 0;
        ++self->_currentIndex;
        self->_currentOffset = 0;
        if (self->_currentIndex < self->_dataCount) {
          unint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](self->_dataArray, "objectAtIndex:"), "length");
        }
        self->_currentLength = v11;
        unint64_t dataOffset = self->_dataOffset;
      }
      v6 += v9;
    }
    while (dataOffset < self->_dataLength && v6 < a4);
  }
  [(PLDataArrayInputStream *)self _scheduleProgressUpdate];
  [(PLDataArrayInputStream *)self _scheduleCallback];
  return v6;
}

- (void)_scheduleProgressUpdate
{
  if (self->_progressDelegate)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
    [(PLDataArrayInputStream *)self performSelector:sel__updateProgress withObject:0 afterDelay:v3 inModes:0.5];
  }
}

- (void)_updateProgress
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateProgress object:0];
  progressDelegate = self->_progressDelegate;
  if (progressDelegate)
  {
    [(PLDataArrayInputStreamProgressDelegate *)progressDelegate dataArrayInputStreamBytesWereRead:self];
  }
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

- (id)streamError
{
  return 0;
}

- (void)close
{
  rls = self->_rls;
  if (rls) {
    CFRunLoopSourceInvalidate(rls);
  }
  self->_streamStatus = 6;
}

- (void)open
{
  self->_streamStatus = 2;
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6 = [a3 getCFRunLoop];
  [(PLDataArrayInputStream *)self _unscheduleFromCFRunLoop:v6 forMode:a4];
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6 = [a3 getCFRunLoop];
  [(PLDataArrayInputStream *)self _scheduleInCFRunLoop:v6 forMode:a4];
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  p_clientContext = &self->_clientContext;
  if (a5)
  {
    long long v8 = *(_OWORD *)&a5->var0;
    long long v9 = *(_OWORD *)&a5->var2;
    self->_clientContext.copyDescription = a5->var4;
    *(_OWORD *)&p_clientContext->version = v8;
    *(_OWORD *)&self->_clientContext.retain = v9;
    retain = (void (*)(void *, SEL, unint64_t))self->_clientContext.retain;
    if (retain) {
      retain(self->_clientContext.info, a2, a3);
    }
  }
  else
  {
    release = (void (*)(void *, SEL, unint64_t))self->_clientContext.release;
    if (release) {
      release(self->_clientContext.info, a2, a3);
    }
    p_clientContext->copyDescription = 0;
    *(_OWORD *)&p_clientContext->version = 0u;
    *(_OWORD *)&p_clientContext->retain = 0u;
  }
  self->_clientCallback = a4;
  return 1;
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  rls = self->_rls;
  if (!rls)
  {
    v9.version = 0;
    memset(&v9.retain, 0, 56);
    v9.info = self;
    v9.perform = (void (__cdecl *)(void *))_streamEventTrigger;
    rls = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v9);
    self->_rls = rls;
    if (!rls)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLDataArrayInputStream.m", 122, @"should be able to make run loop source");
      rls = self->_rls;
    }
  }
  CFRunLoopAddSource(a3, rls, a4);
}

- (void)_scheduleCallback
{
}

- (void)_streamEventTrigger
{
  v4 = self;
  BOOL openEventSent = self->_openEventSent;
  if (self->_openEventSent)
  {
    unint64_t dataOffset = self->_dataOffset;
    unint64_t dataLength = self->_dataLength;
    if (dataOffset >= dataLength || self->_streamStatus == 6)
    {
      if (dataOffset != dataLength) {
        goto LABEL_17;
      }
      self->_streamStatus = 5;
      clientCallback = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v10 = self;
        uint64_t v11 = 16;
LABEL_11:
        clientCallback(v10, v11, info);
        goto LABEL_17;
      }
      id v13 = [(PLDataArrayInputStream *)self delegate];
      v14 = self;
      uint64_t v15 = 16;
    }
    else
    {
      clientCallback = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v10 = self;
        uint64_t v11 = 2;
        goto LABEL_11;
      }
      id v13 = [(PLDataArrayInputStream *)self delegate];
      v14 = self;
      uint64_t v15 = 2;
    }
    [v13 stream:v14 handleEvent:v15];
  }
  else
  {
    v12 = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
    if (v12) {
      v12(self, 1, self->_clientContext.info);
    }
    else {
      objc_msgSend(-[PLDataArrayInputStream delegate](self, "delegate"), "stream:handleEvent:", self, 1);
    }
    self->_BOOL openEventSent = 1;
  }
LABEL_17:
  if (self->_dataOffset <= self->_dataLength)
  {
    if (openEventSent) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLDataArrayInputStream.m", 90, @"sanity check for stream data");
  if (!openEventSent) {
LABEL_19:
  }
    [(PLDataArrayInputStream *)self _scheduleCallback];
LABEL_20:
  v16 = self;
}

- (void)dealloc
{
  rls = self->_rls;
  if (rls)
  {
    CFRunLoopSourceInvalidate(rls);
    CFRelease(self->_rls);
  }
  release = (void (*)(void *, SEL))self->_clientContext.release;
  if (release) {
    release(self->_clientContext.info, a2);
  }

  v5.receiver = self;
  v5.super_class = (Class)PLDataArrayInputStream;
  [(PLDataArrayInputStream *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (PLDataArrayInputStream)initWithDataArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PLDataArrayInputStream;
  v4 = [(PLDataArrayInputStream *)&v16 init];
  if (v4)
  {
    v4->_dataArray = (NSArray *)a3;
    v4->_unint64_t dataLength = 0;
    v4->_dataCount = [(NSArray *)v4->_dataArray count];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    dataArray = v4->_dataArray;
    uint64_t v6 = [(NSArray *)dataArray countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(dataArray);
          }
          v4->_dataLength += [*(id *)(*((void *)&v12 + 1) + 8 * i) length];
        }
        uint64_t v7 = [(NSArray *)dataArray countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
    if (v4->_dataCount) {
      uint64_t v10 = objc_msgSend(-[NSArray objectAtIndex:](v4->_dataArray, "objectAtIndex:", 0), "length");
    }
    else {
      uint64_t v10 = 0;
    }
    v4->_currentLength = v10;
  }
  return v4;
}

@end