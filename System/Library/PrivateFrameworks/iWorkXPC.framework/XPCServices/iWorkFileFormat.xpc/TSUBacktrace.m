@interface TSUBacktrace
+ (id)backtrace;
+ (id)callee;
+ (id)caller;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (TSUBacktrace)init;
- (TSUBacktrace)initWithAdjustment:(int)a3;
- (id)backtraceString;
- (id)callee;
- (id)caller;
- (id)callerAtIndex:(int64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSUBacktrace

- (TSUBacktrace)initWithAdjustment:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSUBacktrace;
  v4 = [(TSUBacktrace *)&v8 init];
  if (v4)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    *(_OWORD *)__src = 0u;
    long long v10 = 0u;
    int v5 = backtrace(__src, 256);
    v4->_frames = v5;
    v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    v4->_callstack = v6;
    memcpy(v6, __src, 8 * v4->_frames);
    v4->_initAdjustment = a3;
  }
  return v4;
}

- (TSUBacktrace)init
{
  return [(TSUBacktrace *)self initWithAdjustment:2];
}

- (void)dealloc
{
  free(self->_callstack);
  v3.receiver = self;
  v3.super_class = (Class)TSUBacktrace;
  [(TSUBacktrace *)&v3 dealloc];
}

+ (id)backtrace
{
  id v2 = [objc_alloc((Class)a1) initWithAdjustment:2];
  return v2;
}

+ (id)new
{
  id v2 = objc_alloc((Class)a1);
  return [v2 initWithAdjustment:2];
}

+ (id)caller
{
  id v2 = [a1 backtrace];
  return _[v2 callerAtIndex:2];
}

+ (id)callee
{
  id v2 = [a1 backtrace];
  return _[v2 callerAtIndex:1];
}

- (id)backtraceString
{
  uint64_t initAdjustment = self->_initAdjustment;
  uint64_t v3 = (self->_frames - initAdjustment);
  v4 = backtrace_symbols(&self->_callstack[initAdjustment], v3);
  int v5 = +[NSMutableString stringWithString:@"Backtrace:\n"];
  if ((int)v3 >= 1)
  {
    v6 = v4;
    do
    {
      uint64_t v7 = (uint64_t)*v6++;
      [(NSMutableString *)v5 appendFormat:@"\t%s\n", v7];
      --v3;
    }
    while (v3);
  }
  free(v4);
  return v5;
}

- (id)callerAtIndex:(int64_t)a3
{
  memset(&v6, 0, sizeof(v6));
  if (dladdr(*((const void **)&self->_callstack[self->_initAdjustment] + a3), &v6)) {
    return +[NSString stringWithUTF8String:v6.dli_sname];
  }
  else {
    return +[NSString stringWithFormat:@"(%s @ %p)", v6.dli_fname, *((void *)&self->_callstack[self->_initAdjustment] + a3)];
  }
}

- (id)caller
{
  return [(TSUBacktrace *)self callerAtIndex:1];
}

- (id)callee
{
  return [(TSUBacktrace *)self callerAtIndex:0];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TSUDynamicCast(v5, (uint64_t)a3);
  int frames = self->_frames;
  LODWORD(v7) = self->_initAdjustment;
  int v9 = *(_DWORD *)(v6 + 16) - *(_DWORD *)(v6 + 20);
  BOOL v10 = frames - v7 == v9;
  if (frames - v7 == v9 && frames > (int)v7)
  {
    uint64_t v7 = (int)v7;
    do
    {
      BOOL v12 = self->_callstack[v7] == *(void **)(*(void *)(v6 + 8) + 8 * v7);
      BOOL v10 = v12;
      ++v7;
    }
    while (v12 && v7 < frames);
  }
  return v10;
}

- (unint64_t)hash
{
  return 2048;
}

@end