@interface TITypingLog
+ (id)emptyTouchEventForLogging;
+ (id)typingLog;
+ (id)typingLogWithDebug:(BOOL)a3;
- (BOOL)adjustForContinuousPath;
- (BOOL)isDebugEnabled;
- (NSArray)keystrokesForTokens;
- (NSMutableArray)currentKeystrokeSequence;
- (TIKeystrokeRecord)currentKeystroke;
- (TITypingLog)init;
- (TITypingLog)initWithDebug:(BOOL)a3;
- (id)correctedTransliterationSequence;
- (id)getDebugData;
- (id)getDebugObject:(id)a3;
- (id)intendedTransliterationSequence;
- (void)addDebugObject:(id)a3 forKey:(id)a4;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6;
- (void)beginToken;
- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7;
- (void)logAcceptedCandidate:(id)a3;
- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4;
- (void)logAutocorrectionInserted;
- (void)logRejectedAutocorrection;
- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5;
- (void)revisitPreviousToken;
- (void)setCurrentKeystroke:(id)a3;
- (void)setCurrentKeystrokeSequence:(id)a3;
- (void)setTokenIndex:(unint64_t)a3;
@end

@implementation TITypingLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeystroke, 0);
  objc_storeStrong((id *)&self->_currentKeystrokeSequence, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_intendedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_correctedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_pathsForTokens, 0);
  objc_storeStrong((id *)&self->_keystrokesForTokens, 0);
}

- (void)setCurrentKeystroke:(id)a3
{
}

- (TIKeystrokeRecord)currentKeystroke
{
  return self->_currentKeystroke;
}

- (void)setCurrentKeystrokeSequence:(id)a3
{
}

- (NSMutableArray)currentKeystrokeSequence
{
  return self->_currentKeystrokeSequence;
}

- (NSArray)keystrokesForTokens
{
  return &self->_keystrokesForTokens->super;
}

- (id)intendedTransliterationSequence
{
  if (self->_isTransliterating) {
    v2 = self->_intendedTransliterationForTokens;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)correctedTransliterationSequence
{
  if (self->_isTransliterating) {
    v2 = self->_correctedTransliterationForTokens;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (BOOL)adjustForContinuousPath
{
  int v3 = [(NSMutableArray *)self->_currentKeystrokeSequence count];
  if (v3 < 2) {
    return 0;
  }
  v4 = [(NSMutableArray *)self->_currentKeystrokeSequence objectAtIndex:(v3 - 1)];
  v5 = [v4 touchedKey];

  v6 = [(NSMutableArray *)self->_currentKeystrokeSequence objectAtIndex:(v3 - 2)];
  v7 = [v6 touchedKey];

  if ([v5 length] == 1
    && [v7 length] == 1
    && ([v5 characterAtIndex:0], TICharIsSpace())
    && ([v7 characterAtIndex:0], TICharIsAlphaNumeric()))
  {
    [(NSMutableArray *)self->_currentKeystrokeSequence removeLastObject];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDebugEnabled
{
  return self->_debugData != 0;
}

- (id)getDebugObject:(id)a3
{
  debugData = self->_debugData;
  if (debugData)
  {
    debugData = [debugData objectForKey:a3];
  }
  return debugData;
}

- (void)addDebugObject:(id)a3 forKey:(id)a4
{
  debugData = self->_debugData;
  if (debugData) {
    [(NSMutableDictionary *)debugData setObject:a3 forKey:a4];
  }
}

- (id)getDebugData
{
  return self->_debugData;
}

- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(TITypingLog *)self keystrokesForTokens];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TITypingLog_enumerateKeystrokesAndPathsForTokensWithBlock___block_invoke;
  v7[3] = &unk_26504F950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __61__TITypingLog_enumerateKeystrokesAndPathsForTokensWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = a2;
  id v8 = [v5 numberWithUnsignedInteger:a3];
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)logAutocorrectionInserted
{
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:@"<Autocorrect>" touchEvent:0 touchError:0];
  [(TITypingLog *)self finishKeystrokeWithTouchedKey:@"<Autocorrect>" touchEvent:0 insertedKey:&stru_26F2B7E50];
}

- (void)logRejectedAutocorrection
{
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:@"<Reject>" touchEvent:0 touchError:0];
  [(TITypingLog *)self finishKeystrokeWithTouchedKey:@"<Reject>" touchEvent:0 insertedKey:&stru_26F2B7E50];
}

- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [NSString stringWithFormat:@"{%@}", v10];
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  [(TITypingLog *)self finishKeystrokeWithTouchedKey:v7 touchEvent:0 insertedKey:&stru_26F2B7E50];
  if (v6)
  {
    self->_isTransliterating = 1;
    id v8 = [(NSMutableArray *)self->_correctedTransliterationForTokens lastObject];
    [v8 appendString:v10];

    v9 = [(NSMutableArray *)self->_intendedTransliterationForTokens lastObject];
    [v9 appendString:v6];
  }
}

- (void)logAcceptedCandidate:(id)a3
{
}

- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v15 length])
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      v12 = objc_msgSend(v15, "substringWithRange:", v10, 1);
      [(TITypingLog *)self beginKeystrokeWithIntendedKey:0 touchEvent:0 touchError:0];
      [(TITypingLog *)self finishKeystrokeWithTouchedKey:v12 touchEvent:0 insertedKey:v12 predictionBarState:v9 inlineCompletionBarState:0];

      uint64_t v10 = v11;
    }
    while ([v15 length] != v11++);
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_keystrokesForTokens, "count") - 1);
  [(NSMutableDictionary *)self->_pathsForTokens setObject:v8 forKeyedSubscript:v14];
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5
{
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7
{
  if (a3) {
    v12 = (__CFString *)a3;
  }
  else {
    v12 = @"<NoKey>";
  }
  id v13 = a7;
  id v14 = a6;
  id v15 = (__CFString *)a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setTouchedKey:v12];

  if (v15) {
    v19 = v15;
  }
  else {
    v19 = &stru_26F2B7E50;
  }
  v20 = [(TITypingLog *)self currentKeystroke];
  [v20 setInsertedKey:v19];

  v21 = v16;
  if (!v16)
  {
    v21 = +[TITypingLog emptyTouchEventForLogging];
  }
  v22 = [(TITypingLog *)self currentKeystroke];
  [v22 setTouch:v21];

  if (!v16) {
  v23 = v14;
  }
  if (!v14)
  {
    v23 = [MEMORY[0x263EFF8C0] array];
  }
  v24 = [(TITypingLog *)self currentKeystroke];
  [v24 setPredictionBarState:v23];

  if (!v14) {
  id v26 = v13;
  }
  if (!v13)
  {
    id v26 = [MEMORY[0x263EFF8C0] array];
  }
  v25 = [(TITypingLog *)self currentKeystroke];
  [v25 setInlineCompletionBarState:v26];

  if (!v13)
  {
  }
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[TIKeystrokeRecord keystrokeRecord];
  [(TITypingLog *)self setCurrentKeystroke:v14];

  id v15 = [(TITypingLog *)self currentKeystrokeSequence];
  id v16 = [(TITypingLog *)self currentKeystroke];
  [v15 addObject:v16];

  if (v10) {
    id v17 = v10;
  }
  else {
    id v17 = &stru_26F2B7E50;
  }
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setIntendedKey:v17];

  v19 = v11;
  if (!v11)
  {
    v19 = +[TITypingLog emptyTouchEventForLogging];
  }
  v20 = [(TITypingLog *)self currentKeystroke];
  [v20 setTouch:v19];

  if (!v11) {
  v21 = v12;
  }
  if (!v12)
  {
    v21 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
  }
  v22 = [(TITypingLog *)self currentKeystroke];
  [v22 setTouchError:v21];

  if (!v12) {
  uint64_t v33 = 0;
  }
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v23 = v13;
  id v38 = v23;
  if ((unint64_t)[v23 length] >= 0x21)
  {
    uint64_t v24 = [v23 length];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __82__TITypingLog_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore___block_invoke;
    v30 = &unk_26504F928;
    id v31 = v23;
    v32 = &v33;
    objc_msgSend(v31, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 259, &v27);
  }
  uint64_t v25 = v34[5];
  id v26 = [(TITypingLog *)self currentKeystroke];
  [v26 setDocumentState:v25];

  _Block_object_dispose(&v33, 8);
}

void __82__TITypingLog_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v10 = [*(id *)(a1 + 32) length];
  if (a3)
  {
    if ((unint64_t)(v10 - a3) >= 0x21)
    {
      id v11 = NSString;
      id v12 = [*(id *)(a1 + 32) substringFromIndex:a3];
      uint64_t v13 = [v11 stringWithFormat:@"...%@", v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a7 = 1;
    }
  }
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a3;
  id v11 = +[TIKeystrokeRecord keystrokeRecord];
  [(TITypingLog *)self setCurrentKeystroke:v11];

  id v12 = [(TITypingLog *)self currentKeystrokeSequence];
  uint64_t v13 = [(TITypingLog *)self currentKeystroke];
  [v12 addObject:v13];

  if (v10) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = &stru_26F2B7E50;
  }
  id v15 = [(TITypingLog *)self currentKeystroke];
  [v15 setIntendedKey:v14];

  id v16 = v9;
  if (!v9)
  {
    id v16 = +[TITypingLog emptyTouchEventForLogging];
  }
  id v17 = [(TITypingLog *)self currentKeystroke];
  [v17 setTouch:v16];

  if (!v9) {
  id v19 = v8;
  }
  if (!v8)
  {
    +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setTouchError:v19];

  if (!v8)
  {
  }
}

- (void)revisitPreviousToken
{
  id v4 = [(NSMutableArray *)self->_keystrokesForTokens lastObject];
  [(NSMutableArray *)self->_keystrokesForTokens removeLastObject];
  int v3 = [(NSMutableArray *)self->_keystrokesForTokens lastObject];
  [v3 addObjectsFromArray:v4];
  [(TITypingLog *)self setCurrentKeystrokeSequence:v3];
}

- (void)setTokenIndex:(unint64_t)a3
{
  for (i = self->_keystrokesForTokens; [(NSMutableArray *)i count] <= a3; i = self->_keystrokesForTokens)
    [(TITypingLog *)self beginToken];
  unint64_t v6 = a3 + 1;
  while (v6 < [(NSMutableArray *)self->_keystrokesForTokens count])
    [(TITypingLog *)self revisitPreviousToken];
}

- (void)beginToken
{
  int v3 = [MEMORY[0x263EFF980] array];
  [(TITypingLog *)self setCurrentKeystrokeSequence:v3];

  keystrokesForTokens = self->_keystrokesForTokens;
  v5 = [(TITypingLog *)self currentKeystrokeSequence];
  [(NSMutableArray *)keystrokesForTokens addObject:v5];

  correctedTransliterationForTokens = self->_correctedTransliterationForTokens;
  v7 = [MEMORY[0x263F089D8] stringWithString:&stru_26F2B7E50];
  [(NSMutableArray *)correctedTransliterationForTokens addObject:v7];

  intendedTransliterationForTokens = self->_intendedTransliterationForTokens;
  id v9 = [MEMORY[0x263F089D8] stringWithString:&stru_26F2B7E50];
  [(NSMutableArray *)intendedTransliterationForTokens addObject:v9];
}

- (TITypingLog)init
{
  return [(TITypingLog *)self initWithDebug:0];
}

- (TITypingLog)initWithDebug:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TITypingLog;
  id v4 = [(TITypingLog *)&v16 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    keystrokesForTokens = v4->_keystrokesForTokens;
    v4->_keystrokesForTokens = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    correctedTransliterationForTokens = v4->_correctedTransliterationForTokens;
    v4->_correctedTransliterationForTokens = v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intendedTransliterationForTokens = v4->_intendedTransliterationForTokens;
    v4->_intendedTransliterationForTokens = v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    pathsForTokens = v4->_pathsForTokens;
    v4->_pathsForTokens = (NSMutableDictionary *)v11;

    v4->_isTransliterating = 0;
    if (v3)
    {
      uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
      debugData = v4->_debugData;
      v4->_debugData = (NSMutableDictionary *)v13;
    }
  }
  return v4;
}

+ (id)emptyTouchEventForLogging
{
  return (id)objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 7, 0, -1, -1.0, -1.0, 0.0, 0.0);
}

+ (id)typingLogWithDebug:(BOOL)a3
{
  BOOL v3 = [[TITypingLog alloc] initWithDebug:a3];
  return v3;
}

+ (id)typingLog
{
  return +[TITypingLog typingLogWithDebug:0];
}

@end