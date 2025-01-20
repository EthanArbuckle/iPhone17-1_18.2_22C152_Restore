@interface DERLogContext
- (DERLogContext)init;
- (void)dealloc;
- (void)dumpLogs;
@end

@implementation DERLogContext

- (DERLogContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)DERLogContext;
  v2 = [(DERLogContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->circBuff = (_CircularBuffer *)CircularBufferInit(v2->circBuffStorage, 0x1800uLL);
    objc_initWeak(&location, v3);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __21__DERLogContext_init__block_invoke;
    v5[3] = &unk_1E65AE558;
    objc_copyWeak(&v6, &location);
    DERLogSetBlock(v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __21__DERLogContext_init__block_invoke(uint64_t a1, const char *a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (const void **)WeakRetained[1];
    id v6 = WeakRetained;
    __int16 v5 = strlen(a2);
    CircularBufferAdd(v4, (uint64_t)a2, (unsigned __int16)(v5 + 1));
    WeakRetained = v6;
  }
}

- (void)dealloc
{
  DERLogSetBlock(0);
  v3.receiver = self;
  v3.super_class = (Class)DERLogContext;
  [(DERLogContext *)&v3 dealloc];
}

- (void)dumpLogs
{
}

void __25__DERLogContext_dumpLogs__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = ATLLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    uint64_t v6 = a3;
    _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
  }
}

@end