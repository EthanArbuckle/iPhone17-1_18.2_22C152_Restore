@interface TICoreAnalyticsEventDispatcher
- (TIRevisionRateAnalyzer)revisionRateAnalyzer;
- (void)sessionDidEnd:(id)a3 aligned:(id)a4;
- (void)setRevisionRateAnalyzer:(id)a3;
@end

@implementation TICoreAnalyticsEventDispatcher

- (void).cxx_destruct
{
}

- (void)setRevisionRateAnalyzer:(id)a3
{
}

- (TIRevisionRateAnalyzer)revisionRateAnalyzer
{
  return self->_revisionRateAnalyzer;
}

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  v29[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22 = objc_opt_new();
  v8 = objc_opt_new();
  v23 = self;
  [(TICoreAnalyticsEventDispatcher *)self setRevisionRateAnalyzer:v8];

  v9 = objc_opt_new();
  v29[0] = v9;
  v10 = objc_opt_new();
  v29[1] = v10;
  v11 = objc_opt_new();
  v29[2] = v11;
  v12 = objc_opt_new();
  v29[3] = v12;
  v13 = objc_opt_new();
  v29[4] = v13;
  v14 = objc_opt_new();
  v29[5] = v14;
  v15 = objc_opt_new();
  v29[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:7];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "analyzeSession:alignedSession:withConfidence:", v6, v7, objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "evaluateConfidenceInSession:alignedSession:", v6, v7, v22));
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  objc_msgSend(v22, "analyzeSession:alignedSession:withConfidence:", v6, v7, objc_msgSend(v22, "evaluateConfidenceInSession:alignedSession:", v6, v7));
  -[TIRevisionRateAnalyzer setHasEmojiInput:](v23->_revisionRateAnalyzer, "setHasEmojiInput:", [v22 hasEmojiInput]);
  -[TIRevisionRateAnalyzer setHasCursorMovement:](v23->_revisionRateAnalyzer, "setHasCursorMovement:", [v22 hasCursorMovement]);
  [(TIRevisionRateAnalyzer *)v23->_revisionRateAnalyzer analyzeSession:v6 alignedSession:v7 withConfidence:[(TIRevisionRateAnalyzer *)v23->_revisionRateAnalyzer evaluateConfidenceInSession:v6 alignedSession:v7]];
}

@end