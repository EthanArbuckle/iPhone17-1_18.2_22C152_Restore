@interface TIDPEventDispatcher
- (TIDPEventDispatcher)initWithReportingDelegate:(id)a3;
- (void)sessionDidEnd:(id)a3 aligned:(id)a4;
@end

@implementation TIDPEventDispatcher

- (void).cxx_destruct
{
}

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_doesSessionContainValidStrings(v7))
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    v9 = [(TIDPRecorder *)[TIDPUnknownTokenRecorder alloc] initWithTypingSession:v6 aligned:v7];
    v10 = [(TIDPRecorder *)[TIDPNamedEntityTokenRecorder alloc] initWithTypingSession:v6 aligned:v7];
    v22 = v9;
    [v8 addObject:v9];
    v21 = v10;
    [v8 addObject:v10];
    if (_isSessionAlignedConfidently(v7))
    {
      v11 = [[TIDPNgramRecorderRandom alloc] initWithTypingSession:v6 aligned:v7 n:5];
      [v8 addObject:v11];
    }
    v20 = [(TIDPRecorder *)[TIDPBiomeUnigramTokenRecorder alloc] initWithTypingSession:v6 aligned:v7];
    objc_msgSend(v8, "addObject:");
    v12 = [(TIDPRecorder *)[TIDPBiomeEmojiTokenRecorder alloc] initWithTypingSession:v6 aligned:v7];
    [v8 addObject:v12];
    v13 = [(TIDPRecorder *)[TIDPBiomeNamedEntityTokenRecorder alloc] initWithTypingSession:v6 aligned:v7];
    [v8 addObject:v13];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * v18);
          if (self->_reportingDelegate) {
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "setDelegate:");
          }
          [v19 report];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (TIDPEventDispatcher)initWithReportingDelegate:(id)a3
{
  id v5 = a3;
  id v6 = [(TIDPEventDispatcher *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reportingDelegate, a3);
  }

  return v7;
}

@end