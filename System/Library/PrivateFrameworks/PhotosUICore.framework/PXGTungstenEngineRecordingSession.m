@interface PXGTungstenEngineRecordingSession
- (PXGTungstenEngineRecordingSession)initWithEngine:(id)a3 directoryURL:(id)a4;
- (void)stop;
@end

@implementation PXGTungstenEngineRecordingSession

- (void).cxx_destruct
{
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PXGTungstenEngineRecordingSession;
  [(PXGTungstenRecordingSession *)&v12 stop];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(PXGEngine *)self->_engine renderers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setRecordingSession:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [(PXGEngine *)self->_engine setRecordingSession:0];
}

- (PXGTungstenEngineRecordingSession)initWithEngine:(id)a3 directoryURL:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = objc_alloc_init(PXGTungstenRecordingJSONSerializer);
  [(PXGTungstenRecordingJSONSerializer *)v9 setPrettyPrint:1];
  v21.receiver = self;
  v21.super_class = (Class)PXGTungstenEngineRecordingSession;
  long long v10 = [(PXGTungstenRecordingSession *)&v21 initWithSerializer:v9 directoryURL:v8];
  if (v10)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v11 = objc_msgSend(v7, "renderers", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v15++) setRecordingSession:v10];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }

    objc_storeStrong((id *)&v10->_engine, a3);
  }

  return v10;
}

@end