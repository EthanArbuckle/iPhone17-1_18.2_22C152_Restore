@interface AutocorrectionTestHarness
+ (id)overrideInputMode:(id)a3;
- (AutocorrectionTestHarness)initWithAttributes:(id)a3;
- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4;
- (BOOL)multilingualEnabled;
- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4;
- (BOOL)requiresMaintenance;
- (BOOL)saveDebugData;
- (NSArray)resultClassifiers;
- (NSString)typologyOutpath;
- (TIInputMode)secondaryInputMode;
- (TIKeyboardInputManagerConfig)config;
- (TIKeyboardTyper)testTyper;
- (TITestTyperDriver)dslTestDriver;
- (id)emptyResultForPlayback:(id)a3;
- (id)emptyResultForTest:(id)a3;
- (id)friendId;
- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6;
- (id)newKeyboardInputManager;
- (id)replayTest:(id)a3 withError:(id)a4;
- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- selfId;
- (id)testTerminator;
- (id)typeTest:(id)a3 withError:(id)a4;
- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4;
- (void)initializeConversationHistory;
- (void)nullifyConversationHistory;
- (void)reset;
- (void)setSaveDebugData:(BOOL)a3;
- (void)setTypologyOutpath:(id)a3;
- (void)tearDown;
- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10;
- (void)trainWithCorpus:(id)a3;
@end

@implementation AutocorrectionTestHarness

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typologyOutpath, 0);
  objc_storeStrong((id *)&self->_secondaryInputMode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_dslTestDriver, 0);
  objc_storeStrong((id *)&self->_testTyper, 0);
  objc_storeStrong((id *)&self->_insertedText, 0);
  objc_storeStrong((id *)&self->_resultClassifiers, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

- (void)setTypologyOutpath:(id)a3
{
}

- (NSString)typologyOutpath
{
  return self->_typologyOutpath;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (BOOL)multilingualEnabled
{
  return self->_multilingualEnabled;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (void)setSaveDebugData:(BOOL)a3
{
  self->_saveDebugData = a3;
}

- (BOOL)saveDebugData
{
  return self->_saveDebugData;
}

- (TITestTyperDriver)dslTestDriver
{
  return self->_dslTestDriver;
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (NSArray)resultClassifiers
{
  return &self->_resultClassifiers->super;
}

- (BOOL)requiresMaintenance
{
  v2 = [(AutocorrectionTestHarness *)self testTyper];
  char v3 = [v2 wordLearningEnabled];

  return v3;
}

- (void)tearDown
{
}

- (void)reset
{
}

- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4
{
  id v5 = a4;
  v6 = [v5 intended];
  v7 = [v5 corrected];
  LOBYTE(self) = ![(AutocorrectionTestHarness *)self compareExpectedValue:v6 withResult:v7];

  return (char)self;
}

- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4
{
  return [a3 isEqualToArray:a4];
}

- (void)trainWithCorpus:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = [(AutocorrectionTestHarness *)self testTyper];
        [v9 attemptToTypeText:v8];

        v10 = [(AutocorrectionTestHarness *)self testTyper];
        [v10 commitText];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v39 = a3;
  [(NSMutableArray *)self->_insertedText removeAllObjects];
  id v7 = v39;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [(AutocorrectionTestHarness *)self emptyResultForPlayback:v7];
  }
  else {
  v9 = [(AutocorrectionTestHarness *)self emptyResultForTest:v7];
  }
  v10 = [v7 sourceMetadata];
  [v9 setSourceMetadata:v10];

  unsigned int v40 = [(AutocorrectionTestHarness *)self seedForTest:v7 trialID:a4];
  long long v11 = [(AutocorrectionTestHarness *)self testTyper];
  long long v12 = [v11 userActionStream];
  [v12 setRandomNumberSeed:v40];

  if (isKindOfClass) {
    [(AutocorrectionTestHarness *)self replayTest:v7 withError:0];
  }
  else {
  long long v13 = [(AutocorrectionTestHarness *)self typeTest:v7 withError:0];
  }
  long long v14 = [(AutocorrectionTestHarness *)self typologyOutpath];

  if (v14)
  {
    v15 = [(TIKeyboardTyper *)self->_testTyper inputManager];
    uint64_t v16 = [v15 inputManagerLogger];
    v17 = [v16 writeToFile];

    v18 = [v17 objectAtIndexedSubscript:0];
    [v9 setTypologyLogURL:v18];

    v19 = [v17 objectAtIndexedSubscript:1];
    [v9 setTypologyTraceLogURL:v19];
  }
  v20 = [v13 correctedTransliterationSequence];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v23 = [(AutocorrectionTestHarness *)self testTyper];
    v24 = [(AutocorrectionTestHarness *)self testTyper];
    v25 = [v24 text];
    id v22 = [v23 tokensForString:v25];
  }
  v26 = [(AutocorrectionTestHarness *)self config];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_21;
  }
  v27 = [(AutocorrectionTestHarness *)self config];
  int v28 = [v27 usesContinuousPath];

  if (!v28) {
    goto LABEL_23;
  }
  v29 = [v9 intended];
  v26 = [v29 componentsJoinedByString:&stru_26F2B7E50];

  if ([v26 hasSuffix:@" "]) {
    goto LABEL_21;
  }
  if ([v13 adjustForContinuousPath]
    && ([v22 lastObject],
        v30 = objc_claimAutoreleasedReturnValue(),
        int v31 = [v30 isEqualToString:@" "],
        v30,
        v31))
  {
    uint64_t v32 = [v22 count] - 1;
    v33 = [MEMORY[0x263EFF980] arrayWithCapacity:(int)v32];
    if (v32)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        v35 = [v22 objectAtIndex:i];
        [v33 addObject:v35];
      }
    }
  }
  else
  {
LABEL_21:
    v33 = v22;
  }

  id v22 = v33;
LABEL_23:
  [v9 extractDataFromTypingLog:v13];
  [v9 setCorrected:v22];
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v40);
  [v9 setSeed:v36];

  v37 = [(AutocorrectionTestHarness *)self resultClassifiers];
  [v9 setTagsFromClassifiers:v37];

  return v9;
}

- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a5;
  v9 = [v8 conversation];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [v8 warmupMessages];

  id v25 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10 - v11];
  if (v10 != v11)
  {
    uint64_t v12 = v11 - v10;
    do
    {
      long long v13 = [MEMORY[0x263EFF9D0] null];
      [v25 addObject:v13];
    }
    while (!__CFADD__(v12++, 1));
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v15 = [v8 sendersToTest];
  id obj = v15;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v20 = [v8 conversation];
        -[AutocorrectionTestHarness testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:](self, "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:", v20, v19, [v8 warmupMessages], objc_msgSend(v8, "adaptToSentMessages"), objc_msgSend(v8, "adaptToReceivedMessages"), a4, v24, v25);
      }
      v15 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }

  v21 = [MEMORY[0x263EFF9D0] null];
  [v25 removeObjectIdenticalTo:v21];

  return v25;
}

- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10
{
  BOOL v34 = a6;
  BOOL v35 = a7;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v39 = a4;
  id v31 = a9;
  id v32 = a10;
  [(AutocorrectionTestHarness *)self initializeConversationHistory];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v13)
  {
    int v14 = 0;
    uint64_t v15 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      uint64_t v38 = v14;
      unint64_t v33 = v14 - a5;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
        v18 = [v17 senderId];
        int v19 = [v18 isEqualToString:v39];

        if (!v19)
        {
          if (!v35) {
            goto LABEL_14;
          }
          id v24 = [(AutocorrectionTestHarness *)self testTyper];
          id v25 = [v24 keyboardController];
          long long v26 = [v25 inputContextHistory];
          long long v27 = [v17 text];
          long long v28 = [MEMORY[0x263EFF910] date];
          long long v29 = [(AutocorrectionTestHarness *)self friendId];
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
          goto LABEL_13;
        }
        if (v38 + v16 >= a5)
        {
          v20 = [(AutocorrectionTestHarness *)self testTyper];
          [v20 syncToEmptyDocument];

          TIDispatchWaitForAllBlocks();
          v21 = [v17 text];
          id v22 = +[AutocorrectionTest testWithInput:v21];

          v23 = [(AutocorrectionTestHarness *)self runTest:v22 trialID:a8 withError:v31];
          [v32 setObject:v23 atIndexedSubscript:v33 + v16];
        }
        if (v34)
        {
          id v24 = [(AutocorrectionTestHarness *)self testTyper];
          id v25 = [v24 keyboardController];
          long long v26 = [v25 inputContextHistory];
          long long v27 = [v17 text];
          long long v28 = [MEMORY[0x263EFF910] date];
          long long v29 = [(AutocorrectionTestHarness *)self selfId];
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
LABEL_13:
        }
LABEL_14:
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      int v14 = v38 + v16;
    }
    while (v13);
  }

  [(AutocorrectionTestHarness *)self nullifyConversationHistory];
}

- (void)nullifyConversationHistory
{
  id v3 = objc_alloc(MEMORY[0x263F7E560]);
  id v7 = [MEMORY[0x263EFFA08] setWithObject:@"mailto:null@apple.com"];
  id v4 = objc_msgSend(v3, "initWithRecipientIdentifiers:");
  uint64_t v5 = [(AutocorrectionTestHarness *)self testTyper];
  uint64_t v6 = [v5 keyboardController];
  [v6 setInputContextHistory:v4];

  id v8 = [(AutocorrectionTestHarness *)self testTyper];
  [v8 syncToEmptyDocument];
}

- (void)initializeConversationHistory
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(AutocorrectionTestHarness *)self friendId];
  id v11 = [v3 setWithObject:v4];

  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [(AutocorrectionTestHarness *)self selfId];
  id v7 = [v5 setWithObject:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F7E560]) initWithRecipientIdentifiers:v11 senderIdentifiers:v7];
  v9 = [(AutocorrectionTestHarness *)self testTyper];
  uint64_t v10 = [v9 keyboardController];
  [v10 setInputContextHistory:v8];
}

- selfId
{
  return @"mailto:self@apple.com";
}

- (id)friendId
{
  return @"mailto:friend@apple.com";
}

- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v5 = [a3 input];
  uint64_t v6 = [v5 length];
  if (v6)
  {
    uint64_t v7 = 0;
    int v8 = 5381;
    do
      int v8 = 33 * v8 + [v5 characterAtIndex:v7++];
    while (v6 != v7);
    int v9 = 33 * v8;
  }
  else
  {
    int v9 = 177573;
  }
  unsigned int v10 = v9 + v4;

  return v10;
}

- (id)emptyResultForPlayback:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(AutocorrectionResult);
  uint64_t v5 = [v3 intended];
  [(AutocorrectionResult *)v4 setInput:v5];

  uint64_t v6 = [v3 intended];
  [(AutocorrectionResult *)v4 setIntended:v6];

  uint64_t v7 = [v3 corpusId];
  [(AutocorrectionResult *)v4 setCorpusId:v7];

  return v4;
}

- (id)emptyResultForTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(AutocorrectionResult);
  uint64_t v6 = [(AutocorrectionTestHarness *)self testTyper];
  uint64_t v7 = [v4 input];
  int v8 = [v6 tokensForString:v7];
  [(AutocorrectionResult *)v5 setInput:v8];

  int v9 = [(AutocorrectionTestHarness *)self testTyper];
  unsigned int v10 = [v9 userModel];
  if ([v10 prefersContinuousPath])
  {
    id v11 = [(AutocorrectionTestHarness *)self config];
    int v12 = [v11 usesContinuousPath];

    if (v12)
    {
      uint64_t v13 = [(AutocorrectionTestHarness *)self testTyper];
      int v14 = [v4 input];
      uint64_t v15 = [v13 tokensForString:v14];

      uint64_t v16 = [v15 count];
      uint64_t v17 = v15;
      if (!v16)
      {
        uint64_t v17 = [MEMORY[0x263EFF980] arrayWithObject:&stru_26F2B7E50];
      }
      [(AutocorrectionResult *)v5 setIntended:v17];
      if (!v16) {
        goto LABEL_12;
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  v18 = [v4 expectedOutput];
  unint64_t v19 = [v18 count];

  if (v19 >= 2)
  {
    uint64_t v15 = [v4 expectedOutput];
    [(AutocorrectionResult *)v5 setIntended:v15];
    goto LABEL_14;
  }
  v20 = [v4 expectedOutput];
  uint64_t v21 = [v20 count];

  if (v21 == 1)
  {
    uint64_t v15 = [(AutocorrectionTestHarness *)self testTyper];
    uint64_t v17 = [v4 expectedOutput];
    id v22 = [v17 firstObject];
    v23 = [v15 tokensForString:v22];
    [(AutocorrectionResult *)v5 setIntended:v23];

LABEL_12:
    goto LABEL_14;
  }
  uint64_t v15 = [MEMORY[0x263EFF980] arrayWithObject:&stru_26F2B7E50];
  [(AutocorrectionResult *)v5 setIntended:v15];
LABEL_14:

  id v24 = [v4 corpusId];
  [(AutocorrectionResult *)v5 setCorpusId:v24];

  return v5;
}

- (id)typeTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[TITypingLog typingLogWithDebug:self->_saveDebugData];
  uint64_t v7 = [(AutocorrectionTestHarness *)self testTyper];
  int v8 = [v5 input];
  [v7 attemptToTypeText:v8 typingLog:v6];

  int v9 = [(AutocorrectionTestHarness *)self testTyper];
  [v9 commitText];

  return v6;
}

- (id)replayTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[TITypingLog typingLogWithDebug:self->_saveDebugData];
  uint64_t v7 = [(AutocorrectionTestHarness *)self testTyper];
  int v8 = [v5 intended];
  int v9 = [v5 expected];
  [v7 attemptToTypeIntended:v8 expected:v9 typingLog:v6];

  unsigned int v10 = [(AutocorrectionTestHarness *)self testTyper];
  [v10 commitText];

  return v6;
}

- (id)testTerminator
{
  return @" ";
}

- (id)newKeyboardInputManager
{
  v41[1] = *MEMORY[0x263EF8340];
  if ([(AutocorrectionTestHarness *)self multilingualEnabled]
    && ([(AutocorrectionTestHarness *)self config],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 inputMode],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isSiriMode],
        v4,
        v3,
        !v5))
  {
    id v39 = objc_alloc_init(TIDynamicLanguageLikelihoodModel);
    int v12 = [TIMultilingualPreferenceOverrides alloc];
    uint64_t v13 = [(AutocorrectionTestHarness *)self secondaryInputMode];
    int v14 = [(AutocorrectionTestHarness *)self config];
    uint64_t v15 = [v14 inputMode];
    v41[0] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    uint64_t v17 = [(AutocorrectionTestHarness *)self config];
    v18 = [v17 inputMode];
    unint64_t v19 = [v18 languageWithRegion];
    long long v40 = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    uint64_t v21 = [(TIMultilingualPreferenceOverrides *)v12 initWithPreferredSecondaryInputMode:v13 userEnabledInputModes:v16 userPreferredLanguages:v20];

    id v22 = (void *)[objc_alloc(MEMORY[0x263F7EAE8]) initWithLanguageLikelihoodModel:v39 preferenceProvider:v21];
    v23 = [(AutocorrectionTestHarness *)self config];
    id v24 = [v23 inputMode];
    id v25 = (objc_class *)[v24 multilingualInputManagerClass];

    id v26 = [v25 alloc];
    long long v27 = [(AutocorrectionTestHarness *)self config];
    id v11 = (void *)[v26 initWithConfig:v27 keyboardState:0 languageSelectionController:v22];

    long long v28 = [MEMORY[0x263EFF9A0] dictionary];
    [v11 setTestingStateObject:v28];
  }
  else
  {
    uint64_t v6 = [(AutocorrectionTestHarness *)self config];
    uint64_t v7 = [v6 inputMode];
    int v8 = (objc_class *)[v7 inputManagerClass];

    id v9 = [v8 alloc];
    unsigned int v10 = [(AutocorrectionTestHarness *)self config];
    id v11 = (void *)[v9 initWithConfig:v10 keyboardState:0];
  }
  long long v29 = [(AutocorrectionTestHarness *)self typologyOutpath];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    id v31 = objc_alloc(MEMORY[0x263F7EB50]);
    id v32 = [(AutocorrectionTestHarness *)self typologyOutpath];
    unint64_t v33 = (void *)[v31 initWithOutputPath:v32];
    [v11 setTypologyPreferences:v33];

    id v34 = objc_alloc(MEMORY[0x263F7EAC0]);
    BOOL v35 = [v11 typologyPreferences];
    v36 = (void *)[v34 initWithTypologyPreferences:v35];

    [v11 setInputManagerLogger:v36];
    v37 = [v11 configurationPropertyList];
    [v36 setConfig:v37];
  }
  return v11;
}

- (AutocorrectionTestHarness)initWithAttributes:(id)a3
{
  id v6 = a3;
  v166.receiver = self;
  v166.super_class = (Class)AutocorrectionTestHarness;
  uint64_t v7 = [(AutocorrectionTestHarness *)&v166 init];

  v165 = v7;
  if (v7)
  {
    uint64_t v8 = [v6 valueForKey:@"TYPOLOGY_OUTPATH"];
    typologyOutpath = v7->_typologyOutpath;
    v7->_typologyOutpath = (NSString *)v8;

    if (v7->_typologyOutpath)
    {
      unsigned int v10 = [MEMORY[0x263F08850] defaultManager];
      char v11 = [v10 createDirectoryAtPath:v7->_typologyOutpath withIntermediateDirectories:1 attributes:0 error:0];

      if ((v11 & 1) == 0)
      {
        NSLog(&cfstr_FailureCreatin.isa, v7->_typologyOutpath);
        int v12 = v7->_typologyOutpath;
        v7->_typologyOutpath = 0;
      }
    }
    id v13 = objc_alloc_init(MEMORY[0x263F7EAB0]);
    v157 = v13;
    [v13 setDisableAnalytics:1];
    int v14 = [v6 valueForKey:@"INPUT_MODE"];
    v158 = v14;
    if ([v14 containsString:@"sw="])
    {
      id v163 = v14;
    }
    else
    {
      uint64_t v15 = UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
      uint64_t v16 = [v15 objectAtIndex:0];

      UIKeyboardInputModeWithNewSWLayout();
      id v163 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v17 = [v6 objectForKey:@"SIRI_MODE"];
    v18 = v17;
    unint64_t v19 = @"NO";
    if (!v17) {
      uint64_t v17 = @"NO";
    }
    uint64_t v20 = [(__CFString *)v17 BOOLValue];

    uint64_t v21 = (void *)0x263F7E000;
    v162 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v163 isSiriMode:v20];
    id v22 = [v162 normalizedIdentifier];
    v164 = TIGetInputModeProperties();

    v23 = [v6 objectForKey:@"USE_LANGUAGE_MODEL"];
    id v24 = v23;
    if (!v23)
    {
      id v24 = [v164 objectForKey:*MEMORY[0x263F7E790]];
    }
    objc_msgSend(v13, "setUsesWordNgramModel:", objc_msgSend(v24, "BOOLValue"));
    if (!v23) {

    }
    if ([v13 usesWordNgramModel]
      && (objc_opt_respondsToSelector() & 1) != 0
      && ![v162 keyboardFeatureSpecializationClassFromInputModeProperties])
    {
      [v162 setQuickTypeKeyboardFeatureSpecializationClass];
    }
    id v25 = +[AutocorrectionTestHarness overrideInputMode:v162];
    [v13 setInputMode:v25];

    id v26 = [v13 inputMode];
    objc_msgSend(v13, "setAllowsSpaceCorrections:", objc_msgSend(v26, "spaceAutocorrectionEnabled"));

    long long v27 = [v13 inputMode];
    objc_msgSend(v13, "setUsesETSRescoring:", objc_msgSend(v27, "typedStringLMRankingEnabled"));

    long long v28 = [v164 objectForKey:*MEMORY[0x263F7E760]];
    objc_msgSend(v13, "setUsesTextChecker:", objc_msgSend(v28, "BOOLValue"));

    long long v29 = [v6 objectForKey:@"USE_RETROCORRECTION"];
    BOOL v30 = v29;
    if (!v29) {
      long long v29 = @"NO";
    }
    objc_msgSend(v13, "setUsesRetrocorrection:", -[__CFString BOOLValue](v29, "BOOLValue"));

    id v31 = [v6 objectForKey:@"WORD_LEARNING_ENABLED"];
    if ([v31 BOOLValue])
    {
      uint64_t v32 = 1;
    }
    else
    {
      unint64_t v33 = [v6 objectForKey:@"USES_ADAPTATION"];
      id v3 = v33;
      if (!v33)
      {
        unint64_t v33 = [v6 objectForKey:@"USE_WORD_NGRAM_MODEL_ADAPTATION"];
        id v4 = v33;
        if (!v33) {
          unint64_t v33 = @"NO";
        }
      }
      uint64_t v32 = [(__CFString *)v33 BOOLValue];
      if (!v3) {
    }
      }
    if (objc_opt_respondsToSelector())
    {
      [v13 setUsesAdaptation:v32];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v13 setUsesWordNgramModelAdaptation:v32];
    }
    id v34 = [v6 objectForKey:@"NEGATIVE_LEARNING_ENABLED"];
    objc_msgSend(v13, "setNegativeLearningDisabled:", objc_msgSend(v34, "BOOLValue") ^ 1);

    BOOL v35 = [v6 objectForKey:@"MAX_WORDS_PER_PREDICTION"];
    v36 = v35;
    if (!v35) {
      BOOL v35 = &unk_26F2C9CF0;
    }
    objc_msgSend(v13, "setMaxWordsPerPrediction:", objc_msgSend(v35, "integerValue"));

    if (objc_opt_respondsToSelector())
    {
      v37 = [v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];
      [v13 setUsesCustomStaticDictionary:v37 != 0];
    }
    uint64_t v38 = [v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];
    [v13 setStaticDictionaryPath:v38];

    if (objc_opt_respondsToSelector())
    {
      id v39 = [v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];
      [v13 setUsesCustomNgramModel:v39 != 0];
    }
    long long v40 = [v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];
    long long v41 = v40;
    if (!v40)
    {
      id v3 = [v13 inputMode];
      unint64_t v19 = [v3 languageWithRegion];
      long long v41 = TINgramModelPathForInputMode();
    }
    [v13 setNgramModelPath:v41];
    if (!v40)
    {
    }
    long long v42 = [v6 objectForKey:@"CUSTOM_DYNAMIC_RESOURCE_PATH"];
    long long v43 = v42;
    if (!v42)
    {
      long long v43 = UIKeyboardUserDirectory();
    }
    [v13 setDynamicResourcePath:v43];
    if (!v42) {

    }
    v44 = [v6 objectForKey:@"CUSTOM_SHAPE_STORE_DIR"];
    uint64_t v45 = v44;
    if (!v44)
    {
      uint64_t v45 = [v13 dynamicResourcePath];
    }
    [v13 setShapeStoreResourceDir:v45];
    if (!v44) {

    }
    if (objc_opt_respondsToSelector())
    {
      v46 = [v164 objectForKey:*MEMORY[0x263F7E7B0]];
      objc_msgSend(v13, "setUsesStemSuffixCorrectionFactor:", objc_msgSend(v46, "BOOLValue"));
    }
    uint64_t v47 = [v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v160 = (void *)v47;
      id v48 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v48 setNumberStyle:1];
      uint64_t v45 = [v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"];
      uint64_t v47 = [v48 numberFromString:v45];
    }
    if (v47)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
        [v13 setFavoniusLanguageModelWeight:v47];
      }
    }
    v161 = (void *)v47;
    uint64_t v49 = [v6 objectForKey:@"MLTT_BUNDLE_URL"];
    v156 = (void *)v49;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 setMlttBundleURL:v49];
    }
    [v13 setTesting:1];
    [v13 setUsesUserModelLogging:0];
    [v13 setStickerSuggestionsEnabled:0];
    objc_storeStrong((id *)&v7->_config, v13);
    v50 = [v6 objectForKey:@"MAX_PREDICTIONS"];
    v51 = v50;
    if (!v50)
    {
      v50 = [v6 objectForKey:@"SIZE_OF_AUTOCORRECTION_LIST"];
      uint64_t v45 = v50;
      if (!v50) {
        v50 = @"3";
      }
    }
    int v52 = [(__CFString *)v50 intValue];
    if (!v51) {

    }
    v53 = [v164 objectForKey:*MEMORY[0x263F7E7A8]];
    int v54 = [v53 BOOLValue];

    v55 = (void *)MEMORY[0x263EFFA80];
    if (v54)
    {
      v56 = [v6 objectForKey:@"MULTILINGUAL_ENABLED"];
      v57 = v56;
      if (!v56) {
        v56 = v55;
      }
      v165->_multilingualEnabled = [v56 BOOLValue];
    }
    else
    {
      v165->_multilingualEnabled = 0;
    }
    v159 = [v6 objectForKey:@"KEYBOARD_SECOND_LANGUAGE"];
    if ([v159 length])
    {
      uint64_t v58 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v159];
      secondaryInputMode = v165->_secondaryInputMode;
      v165->_secondaryInputMode = (TIInputMode *)v58;
    }
    v60 = [[TIKeyboardTyper alloc] initWithInputMode:v162];
    v61 = [v6 objectForKey:@"BAD_SENTENCES_FILE_PATH"];
    v62 = [v61 stringValue];
    [(TIKeyboardTyper *)v60 setBadSentenceLogFilePath:v62];

    [(TIKeyboardTyper *)v60 setInputModeIdentifier:v163];
    v63 = [v6 objectForKey:@"PRINT_TYPING_TRANSCRIPT"];
    -[TIKeyboardTyper setPrintTypingTranscript:](v60, "setPrintTypingTranscript:", [v63 BOOLValue]);

    v64 = [v6 objectForKey:@"SHOW_CANDIDATE_BAR"];
    -[TIKeyboardTyper setShowsCandidateBar:](v60, "setShowsCandidateBar:", [v64 BOOLValue]);

    v65 = [v6 objectForKey:@"TRANSLITERATION_SUMMARIES"];
    -[TIKeyboardTyper setPrintTranslitSummaries:](v60, "setPrintTranslitSummaries:", [v65 BOOLValue]);

    v66 = [v6 objectForKey:@"TEST_AUTO_FILL_FEATURE"];
    LODWORD(v62) = [v66 BOOLValue];

    v67 = [(TIKeyboardTyper *)v60 keyboardController];
    if (v62) {
      [v67 setIsScreenLocked:0];
    }
    else {
      [v67 setIsScreenLocked:v32 ^ 1];
    }

    uint64_t v68 = [v6 objectForKey:@"USE_LANGUAGE_MODEL"];
    v69 = (void *)v68;
    if (v68)
    {
      int v70 = 0;
      int v71 = 0;
      v72 = (void *)v68;
    }
    else
    {
      uint64_t v73 = [v6 objectForKey:@"USE_PREDICTION"];
      v67 = (void *)v73;
      if (v73)
      {
        int v70 = 0;
        int v71 = 0;
        v72 = (void *)v73;
      }
      else
      {
        uint64_t v74 = [v6 objectForKey:@"AUTOCORRECTION_LISTS"];
        uint64_t v21 = (void *)v74;
        if (v74)
        {
          v67 = 0;
          int v71 = 0;
          int v70 = 1;
          v72 = (void *)v74;
        }
        else
        {
          v72 = [v164 objectForKey:*MEMORY[0x263F7E788]];
          v67 = 0;
          uint64_t v21 = 0;
          int v70 = 1;
          int v71 = 1;
        }
      }
    }
    int v75 = [v72 BOOLValue];
    if (v71) {

    }
    if (v70) {
    v76 = (void *)MEMORY[0x263EFFA80];
    }
    if (!v69) {

    }
    if (v75) {
      [(TIKeyboardTyper *)v60 setUsesPrediction:1];
    }
    [(TIKeyboardTyper *)v60 setMaxPredictions:v52];
    [(TIKeyboardTyper *)v60 setKeyboardInputManagerFactory:v165];
    v77 = [v6 objectForKey:@"USE_AUTOCORRECTION"];
    v78 = v77;
    v79 = (void *)MEMORY[0x263EFFA88];
    if (!v77) {
      v77 = (void *)MEMORY[0x263EFFA88];
    }
    -[TIKeyboardTyper setUsesAutocorrection:](v60, "setUsesAutocorrection:", [v77 BOOLValue]);

    v80 = [v6 objectForKey:@"USE_AUTOCAPITALIZATION"];
    v81 = v80;
    if (!v80) {
      v80 = v79;
    }
    -[TIKeyboardTyper setUsesAutocapitalization:](v60, "setUsesAutocapitalization:", [v80 BOOLValue]);

    v82 = [v6 objectForKey:@"WORD_LEARNING_ENABLED"];
    -[TIKeyboardTyper setWordLearningEnabled:](v60, "setWordLearningEnabled:", [v82 BOOLValue]);

    v83 = [v6 objectForKey:@"WARN_IF_SELECTING_POPUP_VARIANT"];
    v84 = v83;
    if (!v83) {
      v83 = v76;
    }
    -[TIKeyboardTyper setWarnIfSelectingPopupVariant:](v60, "setWarnIfSelectingPopupVariant:", [v83 BOOLValue]);

    v85 = [v6 objectForKey:@"MAX_PREDICTIONS_REPORTED"];
    v86 = v85;
    if (!v85) {
      v85 = @"0";
    }
    [(TIKeyboardTyper *)v60 setMaxPredictionsReported:[(__CFString *)v85 intValue]];

    v87 = [v6 objectForKey:@"LOG_DOCUMENT_CONTEXT"];
    v88 = v87;
    if (!v87) {
      v87 = v76;
    }
    -[TIKeyboardTyper setLogDocumentContext:](v60, "setLogDocumentContext:", [v87 BOOLValue]);

    v89 = [v6 objectForKey:@"CONTINUOUS_PATH_ENABLED"];
    v90 = v89;
    if (!v89) {
      v89 = v79;
    }
    uint64_t v91 = [v89 BOOLValue];

    v92 = [(AutocorrectionTestHarness *)v165 config];
    char v93 = objc_opt_respondsToSelector();

    if (v93)
    {
      v94 = [v6 objectForKey:@"CONTINUOUS_PATH_APPEND_SPACE"];
      v95 = v94;
      if (!v94) {
        v94 = v76;
      }
      -[TIKeyboardTyper setInsertsSpaceAfterPredictiveInput:](v60, "setInsertsSpaceAfterPredictiveInput:", [v94 BOOLValue]);

      v96 = [(AutocorrectionTestHarness *)v165 config];
      [v96 setUsesContinuousPath:v91];

      uint64_t v97 = [(AutocorrectionTestHarness *)v165 config];
      [(id)v97 setUsesCJContinuousPath:v91];

      v98 = [(AutocorrectionTestHarness *)v165 config];
      LOBYTE(v97) = objc_opt_respondsToSelector();

      if (v97)
      {
        v99 = [v6 objectForKey:@"CONTINUOUS_PATH_ALGORITHMS"];
        v100 = v99;
        if (!v99) {
          v99 = &unk_26F2C9D08;
        }
        uint64_t v101 = [v99 intValue];
        v102 = [(AutocorrectionTestHarness *)v165 config];
        [v102 setContinuousPathEnabledAlgorithms:v101];
      }
      v103 = [(AutocorrectionTestHarness *)v165 config];
      char v104 = objc_opt_respondsToSelector();

      if (v104)
      {
        v105 = [v6 objectForKey:@"ENABLE_CONTINUOUS_PATH_RETROCORRECTION"];
        v106 = v105;
        if (!v105) {
          v105 = v79;
        }
        uint64_t v107 = [v105 BOOLValue];
        v108 = [(AutocorrectionTestHarness *)v165 config];
        [v108 setUsesContinuousPathRetrocorrection:v107];
      }
      v109 = [(AutocorrectionTestHarness *)v165 config];
      char v110 = objc_opt_respondsToSelector();

      if (v110)
      {
        v111 = [v6 objectForKey:@"CONTINUOUS_PATH_NUM_CANDIDATE_RESCORED_BY_LM"];
        v112 = v111;
        if (!v111) {
          v111 = &unk_26F2C9D20;
        }
        uint64_t v113 = [v111 integerValue];
        v114 = [(AutocorrectionTestHarness *)v165 config];
        [v114 setCpCandidatesCount:v113];
      }
      v115 = [v164 objectForKey:*MEMORY[0x263F7E780]];
      v116 = [(AutocorrectionTestHarness *)v165 config];
      [v116 setContinuousPathParams:v115];

      v117 = [v164 objectForKey:*MEMORY[0x263F7E778]];
      v118 = [(AutocorrectionTestHarness *)v165 config];
      [v118 setContinuousPathEnsembleSourceWeights:v117];

      v119 = [v164 objectForKey:*MEMORY[0x263F7E770]];
      v120 = [(AutocorrectionTestHarness *)v165 config];
      [v120 setContinuousPathEnsembleSourceScales:v119];
    }
    v121 = +[ACTUserActionStreamFactory userActionStreamWithParameters:v6 delegate:v60];
    [(TIKeyboardTyper *)v60 linkWithUserActionStream:v121];

    v122 = [(TIKeyboardTyper *)v60 userModel];
    -[TIKeyboardTyper setUsesTransliteration:](v60, "setUsesTransliteration:", [v122 prefersTransliteration]);

    v123 = MEMORY[0x2455C1F90](v163);
    v124 = [v6 objectForKey:@"TTKKeyboardPlane"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v125 = [(TIKeyboardTyper *)v60 keyboardController];
      [(TTKSimpleKeyboardPlane *)v125 setTtkLayout:v124];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v125 = [[TTKSimpleKeyboardPlane alloc] initWithJsonDictionary:v124];
        v126 = [(TIKeyboardTyper *)v60 keyboardController];
        [v126 setTtkLayout:v125];
      }
      else
      {
        v125 = [v124 description];
        NSLog(&cfstr_Ttkkeyboardpla_0.isa, v125);
      }
    }

    v127 = [v6 objectForKey:@"USE_DYNAMIC_LAYOUT"];
    v128 = v127;
    if (!v127) {
      v127 = (void *)MEMORY[0x263EFFA80];
    }
    uint64_t v129 = [v127 BOOLValue];

    v130 = [v6 objectForKey:@"KEYBOARD_WIDTH"];
    uint64_t v131 = [v6 objectForKey:@"KEYBOARD_ORIENTATION"];
    v132 = (void *)v131;
    if (v130) {
      v133 = v130;
    }
    else {
      v133 = &unk_26F2C9D38;
    }
    if (v131) {
      v134 = (__CFString *)v131;
    }
    else {
      v134 = @"Portrait";
    }
    v135 = [(AutocorrectionTestHarness *)v165 keyboardFromWidth:v133 useDynamicLayout:v129 orientation:v134 keyboardLayout:v123];
    [(TIKeyboardTyper *)v60 setKeyboard:v135];

    v136 = [v6 objectForKey:@"PERSONA"];

    if (v136)
    {
      v137 = [TITestUserPersona alloc];
      v138 = [v6 objectForKey:@"PERSONA"];
      v139 = [(TITestUserPersona *)v137 initWithPersonaName:v138];
      [(TIKeyboardTyper *)v60 setUserPersona:v139];

      v140 = [(TIKeyboardTyper *)v60 userPersona];
      v141 = [(TIKeyboardTyper *)v60 keyplane];
      [v140 updateFromKeyplane:v141];
    }
    else
    {
      [(TIKeyboardTyper *)v60 setUserPersona:0];
    }
    v142 = [(TIKeyboardTyper *)v60 userPersona];

    if (!v142)
    {
      v143 = +[TIErrorGenerator errorGeneratorWithAttributes:v6];
      if (!v143)
      {
        NSLog(&cfstr_UnableToConstr.isa);
        exit(1);
      }
      [(TIKeyboardTyper *)v60 setErrorGenerator:v143];
    }
    [(TIKeyboardTyper *)v60 reset];
    dslTestDriver = v165->_dslTestDriver;
    v165->_dslTestDriver = 0;

    objc_storeStrong((id *)&v165->_testTyper, v60);
    v145 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    insertedText = v165->_insertedText;
    v165->_insertedText = v145;

    v147 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resultClassifiers = v165->_resultClassifiers;
    v165->_resultClassifiers = v147;

    [(AutocorrectionTestHarness *)v165 setResultClassifiers];
    v149 = [v6 objectForKey:@"SAVE_DEBUG_DATA"];
    v150 = v149;
    if (!v149) {
      v149 = (void *)MEMORY[0x263EFFA80];
    }
    v165->_saveDebugData = [v149 BOOLValue];

    v151 = [v6 objectForKey:@"RUN_DSL_TEST"];

    if (v151)
    {
      v152 = [[TITestTyperDriver alloc] initWithTestTyper:v60];
      v153 = v165->_dslTestDriver;
      v165->_dslTestDriver = v152;
    }
  }
  v154 = v165;

  return v154;
}

- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  [a3 floatValue];
  if (v7)
  {
    int v12 = [v9 isEqualToString:@"Portrait"];
    id v13 = (void *)MEMORY[0x263F1C6F8];
    int v14 = [MEMORY[0x263F1C920] mainScreen];
    if (v12) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 4;
    }
    uint64_t v16 = [v13 traitsWithScreen:v14 orientation:v15];

    [(__CFString *)v16 keyboardScreenReferenceSize];
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = [MEMORY[0x263F7EC50] sharedKeyboardFactory];
    objc_msgSend(v21, "keyboardSuffixForScreenDimensions:", v18, v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    v23 = [NSString stringWithFormat:@"%@-%@", v10, v22];
    id v24 = [NSString stringWithFormat:@"%@-%@", @"Dynamic", v23];
    [MEMORY[0x263F7EC58] keyplaneSizeForLayout:v24 screenTraits:v16 keyboardType:0];
    double v26 = v25;
    double v28 = v27;
    long long v29 = (FILE *)*MEMORY[0x263EF8348];
    id v30 = v24;
    fprintf(v29, "Attempting to load dynamic keyboard layout named: %s\n", (const char *)[v30 UTF8String]);
    id v31 = objc_msgSend(MEMORY[0x263F7EC58], "dynamicKeyboardForName:size:isLandscape:", v23, objc_msgSend(v9, "isEqualToString:", @"Landscape"), v26, v28);

    goto LABEL_29;
  }
  float v32 = v11;
  if (v11 >= 320.0)
  {
    unint64_t v33 = [MEMORY[0x263F7EC50] sharedKeyboardFactory];
    char v34 = objc_opt_respondsToSelector();

    if (v34)
    {
      uint64_t v35 = [v9 isEqualToString:@"Portrait"];
      v36 = [MEMORY[0x263F7EC50] sharedKeyboardFactory];
      uint64_t v16 = [v36 keyboardPrefixForWidth:v35 andEdge:v32];

      if (v16) {
        goto LABEL_28;
      }
    }
    if ([v9 isEqualToString:@"Portrait"])
    {
      v37 = @"Wildcat-Portrait";
      uint64_t v38 = @"iPhone-Portrait";
      if (v32 < 320.0) {
        uint64_t v38 = 0;
      }
      if (v32 < 768.0) {
        v37 = v38;
      }
      if (v32 < 1024.0) {
        uint64_t v16 = v37;
      }
      else {
        uint64_t v16 = @"Wildcat-PortraitFudge";
      }
      goto LABEL_28;
    }
    if ([v9 isEqualToString:@"Landscape"])
    {
      if (v32 >= 1366.0)
      {
        uint64_t v16 = @"Wildcat-LandscapeFudge";
        goto LABEL_28;
      }
      if (v32 >= 1024.0)
      {
        uint64_t v16 = @"Wildcat-Landscape";
        goto LABEL_28;
      }
      if (v32 >= 568.0)
      {
        uint64_t v16 = @"iPhone-Caymen";
        goto LABEL_28;
      }
      if (v32 >= 480.0)
      {
        uint64_t v16 = @"iPhone-Landscape";
        goto LABEL_28;
      }
    }
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = @"iPhone-Portrait";
  }
LABEL_28:
  id v39 = [NSString stringWithFormat:@"%@-%@", v16, v10];
  long long v40 = (FILE *)*MEMORY[0x263EF8348];
  id v22 = v39;
  fprintf(v40, "Attempting to load keyboard named: %s\n", (const char *)[v22 UTF8String]);
  v23 = [MEMORY[0x263F7EC50] sharedKeyboardFactory];
  id v31 = [v23 keyboardWithName:v22 inCache:0];
LABEL_29:

  return v31;
}

+ (id)overrideInputMode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 languageWithRegion];
  int v5 = [v4 hasPrefix:@"ars"];

  if (v5)
  {
    id v6 = [v3 languageWithRegion];
    NSLog(&cfstr_OverrideInputM.isa, v6);

    id v7 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:@"ar"];
  }
  else
  {
    id v7 = v3;
  }
  uint64_t v8 = v7;

  return v8;
}

@end