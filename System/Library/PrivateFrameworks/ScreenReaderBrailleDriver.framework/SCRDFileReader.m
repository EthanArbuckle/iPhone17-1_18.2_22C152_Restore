@interface SCRDFileReader
- (BOOL)hasStarted;
- (BOOL)isValid;
- (SCRDFileReader)initWithDelegate:(id)a3 fileHandle:(id)a4;
- (void)_readHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithWait:(BOOL)a3;
- (void)start;
@end

@implementation SCRDFileReader

- (SCRDFileReader)initWithDelegate:(id)a3 fileHandle:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCRDFileReader;
  v8 = [(SCRDFileReader *)&v14 init];
  if (v8)
  {
    if (v6 && v7 && ([v7 fileDescriptor] & 0x80000000) == 0)
    {
      objc_storeWeak((id *)&v8->_delegate, v6);
      objc_storeStrong((id *)&v8->_fileHandle, a4);
      v15[1] = @"fd";
      v16[0] = v6;
      v15[0] = @"delegate";
      v9 = objc_msgSend(NSNumber, "numberWithInt:", -[NSFileHandle fileDescriptor](v8->_fileHandle, "fileDescriptor"));
      v16[1] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

      uint64_t v11 = [objc_alloc(MEMORY[0x263F08B88]) initWithTarget:v8 selector:sel__readHandler_ object:v10];
      readerThread = v8->_readerThread;
      v8->_readerThread = (NSThread *)v11;
    }
    else
    {
      v10 = v8;
      v8 = 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  [(NSThread *)self->_readerThread cancel];
  v3.receiver = self;
  v3.super_class = (Class)SCRDFileReader;
  [(SCRDFileReader *)&v3 dealloc];
}

- (void)start
{
  int v2 = 0;
  atomic_compare_exchange_strong_explicit(&self->_threadStartCount, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v2) {
    [(NSThread *)self->_readerThread start];
  }
}

- (BOOL)hasStarted
{
  return self->_threadStartCount > 0;
}

- (void)invalidate
{
}

- (void)invalidateWithWait:(BOOL)a3
{
  readerThread = self->_readerThread;
  if (a3)
  {
    BOOL v5 = [(NSThread *)readerThread isExecuting];
    [(NSThread *)self->_readerThread cancel];
    if (v5 && ![(NSThread *)self->_readerThread isFinished])
    {
      do
        [MEMORY[0x263F08B88] sleepForTimeInterval:0.100000001];
      while (![(NSThread *)self->_readerThread isFinished]);
    }
  }
  else
  {
    [(NSThread *)readerThread cancel];
  }
}

- (BOOL)isValid
{
  if ([(NSThread *)self->_readerThread isCancelled]) {
    return ![(SCRDFileReader *)self hasStarted];
  }
  else {
    return 1;
  }
}

- (void)_readHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"delegate"];
  id v6 = [v4 objectForKey:@"fd"];
  unsigned int v7 = [v6 intValue];
  if (!v6) {
    goto LABEL_12;
  }
  unsigned int v8 = v7;
  if ((v7 & 0x80000000) != 0) {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x263F08B88], "currentThread", 0, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  v9 = 0);
  if ([v9 isCancelled]) {
    goto LABEL_11;
  }
  while (1)
  {
    memset(&v12, 0, sizeof(v12));
    if (__darwin_check_fd_set_overflow(v8, &v12, 0)) {
      v12.fds_bits[v8 >> 5] |= 1 << v8;
    }
    if (select(v8 + 1, &v12, 0, 0, &v11) != 1) {
      goto LABEL_10;
    }
    ssize_t v10 = read(v8, v13, 0x400uLL);
    if (v10 < 1) {
      break;
    }
    [v5 fileReader:self data:v13 length:v10];
LABEL_10:
    if ([v9 isCancelled]) {
      goto LABEL_11;
    }
  }
  if ((v10 & 0x8000000000000000) == 0) {
    goto LABEL_10;
  }
  NSLog(&cfstr_ErrorReadThrea.isa);
LABEL_11:

LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_readerThread, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end