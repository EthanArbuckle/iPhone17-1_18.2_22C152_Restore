@interface VMUBacktrace
+ (BOOL)supportsSecureCoding;
- (VMUBacktrace)initWithCoder:(id)a3;
- (VMUBacktrace)initWithSamplingContext:(sampling_context_t *)a3 thread:(unsigned int)a4 recordFramePointers:(BOOL)a5;
- (_CSTypeRef)_symbolicator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)threadState;
- (unint64_t)asyncBacktrace;
- (unint64_t)backtrace;
- (unint64_t)dispatchQueueSerialNumber;
- (unint64_t)stackFramePointers;
- (unint64_t)timestamp;
- (unsigned)asyncBacktraceLength;
- (unsigned)backtraceLength;
- (unsigned)thread;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fixupStackWithSamplingContext:(sampling_context_t *)a3 symbolicator:(_CSTypeRef)a4;
- (void)setThreadState:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation VMUBacktrace

- (void)dealloc
{
  frames = self->_callstack.frames;
  if (frames) {
    free(frames);
  }
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs) {
    free(framePtrs);
  }
  v5 = self->_asyncCallstack.frames;
  if (v5) {
    free(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)VMUBacktrace;
  [(VMUBacktrace *)&v6 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (VMUBacktrace)initWithSamplingContext:(sampling_context_t *)a3 thread:(unsigned int)a4 recordFramePointers:(BOOL)a5
{
  BOOL v5 = a5;
  v14[1536] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VMUBacktrace;
  v8 = [(VMUBacktrace *)&v12 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (a3)
  {
    if (!sample_remote_thread_with_dispatch_queue_regular_and_swift_async())
    {
      copySamplingResultToCallstack(&v9->_callstack.context.pid, a4, v14, v13, 0, v5);
LABEL_7:
      v9 = v9;
      v10 = v9;
      goto LABEL_8;
    }
  }
  else
  {

    v9 = 0;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (unsigned)backtraceLength
{
  return self->_callstack.length;
}

- (unsigned)thread
{
  return self->_callstack.context.thread;
}

- (unint64_t)dispatchQueueSerialNumber
{
  return self->_callstack.context.dispatch_queue_serial_num;
}

- (unint64_t)backtrace
{
  return self->_callstack.frames;
}

- (void)fixupStackWithSamplingContext:(sampling_context_t *)a3 symbolicator:(_CSTypeRef)a4
{
  int flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64 && flavor != 65) {
      goto LABEL_4;
    }
  }
  else if (flavor != 32 && flavor != 33)
  {
LABEL_4:
    NSLog(&cfstr_UnsupportedFla.isa, a2, a3, a4._opaque_1, a4._opaque_2, &self->_flavor, self->_flavor);
    return;
  }
  CSSymbolicatorFixupFrames();
  if (self->_asyncCallstack.length) {
    CSSymbolicatorFixupFrames();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUBacktrace)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)VMUBacktrace;
  BOOL v5 = [(VMUBacktrace *)&v58 init];
  if (!v5) {
    goto LABEL_15;
  }
  v5->_callstack.context.pid = [v4 decodeInt32ForKey:@"pid"];
  v5->_callstack.context.run_state = [v4 decodeIntForKey:@"run_state"];
  v5->_callstack.context.dispatch_queue_serial_num = [v4 decodeInt64ForKey:@"dispatch_queue_serial_num"];
  v5->_callstack.context.thread = [v4 decodeIntForKey:@"thread"];
  v5->_callstack.uint64_t length = [v4 decodeInt32ForKey:@"length"];
  v5->_asyncCallstack.uint64_t length = [v4 decodeInt32ForKey:@"asyncLength"];
  size_t __n = 0;
  id v6 = v4;
  uint64_t v7 = [v6 decodeBytesForKey:@"frames" returnedLength:&__n];
  uint64_t length = v5->_callstack.length;
  if (__n != 8 * length)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v22) {
      -[VMUBacktrace initWithCoder:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_9;
  }
  v9 = (const void *)v7;
  uint64_t v10 = 8 * length;
  v11 = (unint64_t *)malloc_type_malloc(8 * length, 0xD3F1B0CEuLL);
  v5->_callstack.frames = v11;
  memcpy(v11, v9, __n);
  size_t __n = 0;
  id v12 = v6;
  v13 = (const void *)[v12 decodeBytesForKey:@"framePtrs" returnedLength:&__n];
  if (__n == v10 || !__n)
  {
    if (__n)
    {
      v31 = (unint64_t *)malloc_type_malloc(__n, 0xA81435DEuLL);
      v5->_callstack.framePtrs = v31;
      memcpy(v31, v13, __n);
    }
    else
    {
      uint64_t v37 = [v12 decodeBytesForKey:@"framePtr" returnedLength:&__n];
      if ((__n & 0xFFFFFFFFFFFFFFF7) != 0)
      {
        BOOL v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v38) {
          -[VMUBacktrace initWithCoder:](v38, v39, v40, v41, v42, v43, v44, v45);
        }
        goto LABEL_9;
      }
      if (__n)
      {
        v54 = (unint64_t *)v37;
        v55 = (unint64_t *)malloc_type_calloc(v5->_callstack.length, 8uLL, 0x100004000313F17uLL);
        v5->_callstack.framePtrs = v55;
        unint64_t *v55 = *v54;
      }
    }
    if (v5->_asyncCallstack.length)
    {
      size_t v56 = 0;
      uint64_t v32 = [v12 decodeBytesForKey:@"asyncFrames" returnedLength:&v56];
      uint64_t v33 = v5->_asyncCallstack.length;
      if (v56 != 8 * v33)
      {
        BOOL v46 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v46) {
          -[VMUBacktrace initWithCoder:](v46, v47, v48, v49, v50, v51, v52, v53);
        }
        goto LABEL_9;
      }
      v34 = (const void *)v32;
      v35 = (unint64_t *)malloc_type_malloc(8 * v33, 0xFC6C52D1uLL);
      v5->_asyncCallstack.frames = v35;
      memcpy(v35, v34, v56);
    }
LABEL_15:
    v30 = v5;
    goto LABEL_16;
  }
  BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v14) {
    -[VMUBacktrace initWithCoder:](v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_9:
  v30 = 0;
LABEL_16:

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInt32:self->_callstack.context.pid forKey:@"pid"];
  [v7 encodeInt:self->_callstack.context.run_state forKey:@"run_state"];
  [v7 encodeInt64:self->_callstack.context.dispatch_queue_serial_num forKey:@"dispatch_queue_serial_num"];
  [v7 encodeInt:self->_callstack.context.thread forKey:@"thread"];
  [v7 encodeInt32:self->_callstack.length forKey:@"length"];
  [v7 encodeInt32:self->_asyncCallstack.length forKey:@"asyncLength"];
  uint64_t v4 = 8 * self->_callstack.length;
  [v7 encodeBytes:self->_callstack.frames length:v4 forKey:@"frames"];
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs)
  {
    [v7 encodeBytes:framePtrs length:v4 forKey:@"framePtrs"];
    [v7 encodeBytes:self->_callstack.framePtrs length:8 forKey:@"framePtr"];
  }
  uint64_t length = self->_asyncCallstack.length;
  if (length) {
    [v7 encodeBytes:self->_asyncCallstack.frames length:8 * length forKey:@"asyncFrames"];
  }
}

- (_CSTypeRef)_symbolicator
{
  if (_symbolicator_previousPid) {
    BOOL v2 = _symbolicator_previousPid == self->_callstack.context.pid;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    _symbolicator_previousPid = self->_callstack.context.pid;
    CSRelease();
    if (self->_callstack.context.pid)
    {
      _symbolicator_symbolicator_0 = CSSymbolicatorCreateWithPid();
      _symbolicator_symbolicator_1 = v4;
    }
  }
  unint64_t v5 = _symbolicator_symbolicator_0;
  unint64_t v6 = _symbolicator_symbolicator_1;
  result._opaque_2 = v6;
  result._opaque_1 = v5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[VMUBacktrace allocWithZone:a3] init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_int flavor = self->_flavor;
    long long v6 = *(_OWORD *)&self->_callstack.context.pid;
    long long v7 = *(_OWORD *)&self->_callstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v4->_callstack.framePtrs = *(_OWORD *)&self->_callstack.framePtrs;
    *(_OWORD *)&v4->_callstack.context.dispatch_queue_serial_num = v7;
    *(_OWORD *)&v4->_callstack.context.pid = v6;
    v8 = (unint64_t *)malloc_type_malloc(8 * self->_callstack.length, 0x100004000313F17uLL);
    v5->_callstack.frames = v8;
    memcpy(v8, self->_callstack.frames, 8 * self->_callstack.length);
    if (self->_callstack.framePtrs)
    {
      v5->_callstack.framePtrs = (unint64_t *)malloc_type_malloc(8 * self->_callstack.length, 0x100004000313F17uLL);
      memcpy(v5->_callstack.frames, self->_callstack.frames, 8 * self->_callstack.length);
    }
    long long v9 = *(_OWORD *)&self->_asyncCallstack.context.pid;
    long long v10 = *(_OWORD *)&self->_asyncCallstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v5->_asyncCallstack.framePtrs = *(_OWORD *)&self->_asyncCallstack.framePtrs;
    *(_OWORD *)&v5->_asyncCallstack.context.dispatch_queue_serial_num = v10;
    *(_OWORD *)&v5->_asyncCallstack.context.pid = v9;
    uint64_t length = self->_asyncCallstack.length;
    if (length)
    {
      id v12 = (unint64_t *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
      v5->_asyncCallstack.frames = v12;
      memcpy(v12, self->_asyncCallstack.frames, 8 * self->_asyncCallstack.length);
    }
  }
  return v5;
}

- (id)description
{
  [(VMUBacktrace *)self _symbolicator];
  int flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64)
    {
      if (flavor == 65)
      {
        uint64_t v4 = @"ARM LR";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v4 = @"ARM Simple";
  }
  else
  {
    if (flavor != 32)
    {
      if (flavor == 33)
      {
        uint64_t v4 = @"I386 ESP";
        goto LABEL_11;
      }
LABEL_8:
      uint64_t v4 = @"unknown";
      goto LABEL_11;
    }
    uint64_t v4 = @"I386 Simple";
  }
LABEL_11:
  unint64_t v5 = [NSString stringWithFormat:@"VMUBacktrace (Flavor: %@ Time: %llu Process: %d Thread: %X  Dispatch queue serial num: %lld)\n", v4, self->_timestamp, self->_callstack.context.pid, self->_callstack.context.thread, self->_callstack.context.dispatch_queue_serial_num];
  long long v6 = descriptionForCallstackFrames((uint64_t)&self->_callstack, @"Frames");
  long long v7 = [v5 stringByAppendingString:v6];

  if (self->_asyncCallstack.length)
  {
    v8 = descriptionForCallstackFrames((uint64_t)&self->_asyncCallstack, @"Async Frames");
    uint64_t v9 = [v7 stringByAppendingString:v8];

    long long v7 = (void *)v9;
  }

  return v7;
}

- (unint64_t)stackFramePointers
{
  return self->_callstack.framePtrs;
}

- (void)setThreadState:(int)a3
{
  self->_callstack.context.run_state = a3;
}

- (int)threadState
{
  return self->_callstack.context.run_state;
}

- (unint64_t)asyncBacktrace
{
  return self->_asyncCallstack.frames;
}

- (unsigned)asyncBacktraceLength
{
  return self->_asyncCallstack.length;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end