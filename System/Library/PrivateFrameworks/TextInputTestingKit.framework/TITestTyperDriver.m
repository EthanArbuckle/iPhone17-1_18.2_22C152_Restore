@interface TITestTyperDriver
- (BOOL)consumeTestFile:(id)a3;
- (BOOL)consumeTextString:(id)a3;
- (BOOL)handleBoolConfig:(id)a3 withValue:(BOOL)a4 lineNumber:(int)a5;
- (BOOL)handleIntConfig:(id)a3 withValue:(int)a4 lineNumber:(int)a5;
- (BOOL)handleStringConfig:(id)a3 withValue:(id)a4 lineNumber:(int)a5;
- (BOOL)isDebug;
- (NSMutableArray)failedTests;
- (NSMutableArray)syntaxErrors;
- (TIKeyboardTyper)testTyper;
- (TITestTyperDriver)init;
- (TITestTyperDriver)initWithTestTyper:(id)a3;
- (void)handleCommand:(id)a3 withValue:(id)a4 lineNumber:(int)a5;
- (void)handleCorrectionMatch:(id)a3 lineNumber:(int)a4;
- (void)handleDocumentMatch:(id)a3 lineNumber:(int)a4;
- (void)handleNewLine;
- (void)handlePredictionMatch:(id)a3 lineNumber:(int)a4;
- (void)handleTyping:(id)a3;
- (void)printDebugInfo:(id)a3 lineNumber:(int)a4;
- (void)reportFailedTest:(id)a3 lineNumber:(int)a4;
- (void)reportSyntaxErrors:(id)a3 lineNumber:(int)a4;
- (void)selectFromPredictionBar:(id)a3 lineNumber:(int)a4;
- (void)setDebug:(BOOL)a3;
- (void)setTestTyper:(id)a3;
@end

@implementation TITestTyperDriver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntaxErrors, 0);
  objc_storeStrong((id *)&self->_failedTests, 0);

  objc_storeStrong((id *)&self->_testTyper, 0);
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (NSMutableArray)syntaxErrors
{
  return self->_syntaxErrors;
}

- (NSMutableArray)failedTests
{
  return self->_failedTests;
}

- (void)setTestTyper:(id)a3
{
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (void)selectFromPredictionBar:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(TIKeyboardTyper *)self->_testTyper predictions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 candidate];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          [(TIKeyboardTyper *)self->_testTyper acceptPredictiveCandidate:v12];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v7 = [NSString stringWithFormat:@"unable to select prediction '%@'", v6];
  [(TITestTyperDriver *)self reportFailedTest:v7 lineNumber:v4];
LABEL_11:
}

- (void)printDebugInfo:(id)a3 lineNumber:(int)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5 || ([v5 isEqualToString:@"all"] & 1) != 0)
  {
    id v7 = [(TIKeyboardTyper *)self->_testTyper text];
    printf("text: %s\n", (const char *)[v7 UTF8String]);

    uint64_t v8 = [(TIKeyboardTyper *)self->_testTyper autocorrection];
    id v9 = [v8 candidate];
    printf("autocorrection: %s\n", (const char *)[v9 UTF8String]);

LABEL_4:
    printf("predictions: ");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [(TIKeyboardTyper *)self->_testTyper predictions];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) candidate];
          printf("%s, ", (const char *)[v15 UTF8String]);

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    putchar(10);
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"text"])
  {
    id v16 = [(TIKeyboardTyper *)self->_testTyper text];
    printf("text: %s\n", (const char *)[v16 UTF8String]);
  }
  if ([v6 isEqualToString:@"correction"])
  {
    long long v17 = [(TIKeyboardTyper *)self->_testTyper autocorrection];
    id v18 = [v17 candidate];
    printf("autocorrection: %s\n", (const char *)[v18 UTF8String]);
  }
  if ([v6 isEqualToString:@"predictions"]) {
    goto LABEL_4;
  }
LABEL_12:
}

- (BOOL)handleStringConfig:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  id v6 = [NSString stringWithFormat:@"line:%d, %@ is not recognized string configuration", a4, *(void *)&a5, a3];
  [(NSMutableArray *)self->_syntaxErrors addObject:v6];

  return 0;
}

- (BOOL)handleIntConfig:(id)a3 withValue:(int)a4 lineNumber:(int)a5
{
  id v6 = [NSString stringWithFormat:@"line:%d, %@ is not recognized integer configuration", *(void *)&a4, *(void *)&a5, a3];
  [(NSMutableArray *)self->_syntaxErrors addObject:v6];

  return 0;
}

- (BOOL)handleBoolConfig:(id)a3 withValue:(BOOL)a4 lineNumber:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 isEqualToString:@"wordLearningEnabled"])
  {
    [(TIKeyboardTyper *)self->_testTyper setWordLearningEnabled:v6];
LABEL_6:
    [(TIKeyboardTyper *)self->_testTyper reset];
    goto LABEL_7;
  }
  if (([v8 isEqualToString:@"usesPrediction"] & 1) != 0
    || [v8 isEqualToString:@"generateMultipleCandidates"])
  {
    [(TIKeyboardTyper *)self->_testTyper setUsesPrediction:v6];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"usesAutocapitalization"])
  {
    [(TIKeyboardTyper *)self->_testTyper setUsesAutocapitalization:v6];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"hardwareKeyboardMode"])
  {
    [(TIKeyboardTyper *)self->_testTyper setHardwareKeyboardMode:v6];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"usesAutocorrection"])
  {
    [(TIKeyboardTyper *)self->_testTyper setUsesAutocorrection:v6];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"shouldSkipCandidateSelection"])
  {
    [(TIKeyboardTyper *)self->_testTyper setShouldSkipCandidateSelection:v6];
  }
  else
  {
    if (![v8 isEqualToString:@"bisonDebug"])
    {
      uint64_t v11 = [NSString stringWithFormat:@"line:%d, %@ is not recognized BOOLean configuration", v5, v8];
      [(NSMutableArray *)self->_syntaxErrors addObject:v11];

      BOOL v9 = 0;
      goto LABEL_8;
    }
    actDsldebug = v6;
  }
LABEL_7:
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void)handleCommand:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id v8 = a4;
  if ([v10 isEqualToString:@"shift"])
  {
    [(TIKeyboardTyper *)self->_testTyper attemptToShift];
  }
  else if ([v10 isEqualToString:@"delete"])
  {
    [(TIKeyboardTyper *)self->_testTyper attemptToDelete];
  }
  else if ([v10 isEqualToString:@"reset"])
  {
    [(TIKeyboardTyper *)self->_testTyper reset];
  }
  else if ([v10 isEqualToString:@"reject"])
  {
    [(TIKeyboardTyper *)self->_testTyper rejectAutocorrection];
  }
  else if ([v10 isEqualToString:@"accept"])
  {
    [(TIKeyboardTyper *)self->_testTyper acceptAutocorrection];
  }
  else if ([v10 isEqualToString:@"sync"])
  {
    [(TIKeyboardTyper *)self->_testTyper syncToEmptyDocument];
  }
  else if ([v10 isEqualToString:@"print"])
  {
    [(TITestTyperDriver *)self printDebugInfo:v8 lineNumber:v5];
  }
  else if ([v10 isEqualToString:@"select"])
  {
    [(TITestTyperDriver *)self selectFromPredictionBar:v8 lineNumber:v5];
  }
  else
  {
    BOOL v9 = [NSString stringWithFormat:@"Unknown command %@", v10];
    [(TITestTyperDriver *)self reportSyntaxErrors:v9 lineNumber:v5];
  }
}

- (void)handleCorrectionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  BOOL v6 = [(TIKeyboardTyper *)self->_testTyper autocorrection];
  id v7 = [v6 candidate];
  char v8 = [v7 isEqualToString:v13];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = NSString;
    id v10 = [(TIKeyboardTyper *)self->_testTyper autocorrection];
    uint64_t v11 = [v10 candidate];
    uint64_t v12 = [v9 stringWithFormat:@"expected autocorrection '%@' got '%@'", v13, v11];
    [(TITestTyperDriver *)self reportFailedTest:v12 lineNumber:v4];
  }
}

- (void)handlePredictionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (!-[TIKeyboardTyper hasPrediction:](self->_testTyper, "hasPrediction:"))
  {
    BOOL v6 = [NSString stringWithFormat:@"expected prediction '%@'", v7];
    [(TITestTyperDriver *)self reportFailedTest:v6 lineNumber:v4];
  }
}

- (void)handleDocumentMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  BOOL v6 = [(TIKeyboardTyper *)self->_testTyper text];
  if (([v6 hasSuffix:v8] & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"expected text '%@' got '%@'", v8, v6];
    [(TITestTyperDriver *)self reportFailedTest:v7 lineNumber:v4];
  }
}

- (void)handleNewLine
{
  v3 = [(TIKeyboardTyper *)self->_testTyper text];
  id v7 = v3;
  if (self->_debug)
  {
    if ([v3 length])
    {
      id v4 = v7;
      printf("text: %s\n", (const char *)[v4 UTF8String]);
      if (([v4 hasSuffix:@" "] & 1) == 0)
      {
        uint64_t v5 = [(TIKeyboardTyper *)self->_testTyper autocorrection];
        id v6 = [v5 candidate];
        printf("corr: %s\n", (const char *)[v6 UTF8String]);
      }
    }
    [(TIKeyboardTyper *)self->_testTyper reset];
    printf("==> ");
  }
  else
  {
    [(TITestTyperDriver *)self handleTyping:@"\n"];
  }
}

- (void)handleTyping:(id)a3
{
}

- (void)reportSyntaxErrors:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = [NSString stringWithFormat:@"line:%d, %@", v4, v7];
  if (self->_debug) {
    NSLog(&cfstr_Error.isa, v7);
  }
  else {
    [(NSMutableArray *)self->_syntaxErrors addObject:v6];
  }
}

- (void)reportFailedTest:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = [NSString stringWithFormat:@"line:%d, %@", v4, v7];
  if (self->_debug) {
    NSLog(&cfstr_FailedTest.isa, v7);
  }
  else {
    [(NSMutableArray *)self->_failedTests addObject:v6];
  }
}

- (BOOL)consumeTextString:(id)a3
{
  testTyper = self->_testTyper;
  id v5 = a3;
  [(TIKeyboardTyper *)testTyper reset];
  yy_start = 1;
  stringLen = 0;
  id v6 = v5;
  id v7 = (char *)[v6 UTF8String];

  int v8 = strlen(v7);
  BOOL v9 = actDsl_scan_bytes(v7, v8);
  actDslparse(self);
  actDsl_delete_buffer((void **)v9);
  uint64_t v10 = [(NSMutableArray *)self->_failedTests count];
  BOOL result = 0;
  if (!v10) {
    return [(NSMutableArray *)self->_syntaxErrors count] == 0;
  }
  return result;
}

- (BOOL)consumeTestFile:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    actDslin = (uint64_t)fopen((const char *)[v4 UTF8String], "r");
    yy_start = 1;
    stringLen = 0;
    actDslparse(self);
    fclose((FILE *)actDslin);
  }
  else
  {
    actDslin = *MEMORY[0x263EF8350];
    self->_debug = 1;
    printf("\n\n****** UNIT TEST CONSOLE *****\n\n==>");
    fflush((FILE *)*MEMORY[0x263EF8358]);
    yy_start = 1;
    stringLen = 0;
    actDslparse(self);
  }
  actDslin = 0;

  return 1;
}

- (TITestTyperDriver)initWithTestTyper:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITestTyperDriver;
  id v6 = [(TITestTyperDriver *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testTyper, a3);
    int v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    failedTests = v7->_failedTests;
    v7->_failedTests = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    syntaxErrors = v7->_syntaxErrors;
    v7->_syntaxErrors = v10;
  }
  return v7;
}

- (TITestTyperDriver)init
{
  return [(TITestTyperDriver *)self initWithTestTyper:0];
}

@end