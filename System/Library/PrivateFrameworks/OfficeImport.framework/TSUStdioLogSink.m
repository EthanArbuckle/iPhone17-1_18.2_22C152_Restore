@interface TSUStdioLogSink
+ (id)sharedInstance;
- (TSUStdioLogSink)init;
- (id)logSinkBlockWithFilePointer:(__sFILE *)a3;
@end

@implementation TSUStdioLogSink

- (TSUStdioLogSink)init
{
  v8.receiver = self;
  v8.super_class = (Class)TSUStdioLogSink;
  v2 = [(TSUStdioLogSink *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("TSUStdioLogSinkQueue", 0);
    logQueue = v2->_logQueue;
    v2->_logQueue = (OS_dispatch_queue *)v3;

    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v5;

    [(NSDateFormatter *)v2->_dateFormatter setFormatterBehavior:1040];
    [(NSDateFormatter *)v2->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance_sInstance;
  return v2;
}

void __33__TSUStdioLogSink_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TSUStdioLogSink);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;
}

- (id)logSinkBlockWithFilePointer:(__sFILE *)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke;
  v6[3] = &unk_264D620C8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_queue_t v3 = _Block_copy(v6);
  v4 = (void *)[v3 copy];

  return v4;
}

void __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v11 = a3;
  id v12 = a6;
  if (*(void *)(a1 + 40))
  {
    v13 = [MEMORY[0x263EFF910] date];
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke_2;
    block[3] = &unk_264D620A0;
    block[4] = v14;
    id v20 = v13;
    id v21 = v11;
    uint64_t v23 = a4;
    int v25 = a2;
    int v26 = a5;
    id v16 = v12;
    uint64_t v17 = *(void *)(a1 + 40);
    id v22 = v16;
    uint64_t v24 = v17;
    id v18 = v13;
    dispatch_async(v15, block);
  }
}

void __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke_2(uint64_t a1)
{
  id v12 = [*(id *)(*(void *)(a1 + 32) + 16) stringFromDate:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x263F08AB0] processInfo];
  dispatch_queue_t v3 = [v2 processName];

  v4 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v5 = [v4 processIdentifier];

  if (*(void *)(a1 + 48))
  {
    v6 = [NSString stringWithFormat:@"#%@", *(void *)(a1 + 48)];
  }
  else
  {
    v6 = &stru_26EBF24D8;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 80) - 1;
  if (v7 > 4) {
    objc_super v8 = &stru_26EBF24D8;
  }
  else {
    objc_super v8 = off_264D620E8[v7];
  }
  v9 = [NSString stringWithFormat:@"%@ %@[%d] %@ %@ %s:%d %@", v12, v3, v5, v8, v6, *(void *)(a1 + 64), *(unsigned int *)(a1 + 84), *(void *)(a1 + 56)];
  v10 = *(FILE **)(a1 + 72);
  id v11 = v9;
  fprintf(v10, "%s\n", (const char *)[v11 UTF8String]);
  if (*(int *)(a1 + 80) <= 2) {
    fflush(*(FILE **)(a1 + 72));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
}

@end