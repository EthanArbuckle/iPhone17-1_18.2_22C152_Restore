@interface RTAIDCallObserver
- (CXCallObserver)callObserver;
- (RTAIDCallObserver)initWithCallReporterBlock:(id)a3;
- (id)callReporterBlock;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)setCallObserver:(id)a3;
- (void)setCallReporterBlock:(id)a3;
@end

@implementation RTAIDCallObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callReporterBlock, 0);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

- (void)setCallReporterBlock:(id)a3
{
}

- (id)callReporterBlock
{
  return self->_callReporterBlock;
}

- (void)setCallObserver:(id)a3
{
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 calls];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [v5 calls];
    uint64_t v7 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v8);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 hasConnected] && (objc_msgSend(v11, "isOnHold") & 1) == 0)
          {
            uint64_t v7 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  v12 = [(RTAIDCallObserver *)self callReporterBlock];
  BOOL v13 = v12 == 0;

  if (!v13)
  {
    v14 = [(RTAIDCallObserver *)self callReporterBlock];
    v14[2](v14, v7);
  }
}

- (RTAIDCallObserver)initWithCallReporterBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTAIDCallObserver;
  id v5 = [(RTAIDCallObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(RTAIDCallObserver *)v5 setCallReporterBlock:v4];
    id v7 = objc_alloc_init(MEMORY[0x263EFC8E8]);
    [v7 setDelegate:v6 queue:0];
    [(RTAIDCallObserver *)v6 setCallObserver:v7];
    {
      rtaid::get_log(void)::rtaid_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "aid");
    }
    v8 = rtaid::get_log(void)::rtaid_os_log;
    if (os_log_type_enabled((os_log_t)rtaid::get_log(void)::rtaid_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "AudioIssueDetectorManagerCallState.mm";
      __int16 v13 = 1024;
      int v14 = 30;
      _os_log_impl(&dword_2227C1000, v8, OS_LOG_TYPE_DEFAULT, "%s:%-5d initWithCallReporterBlock setup", buf, 0x12u);
    }
  }
  return v6;
}

@end