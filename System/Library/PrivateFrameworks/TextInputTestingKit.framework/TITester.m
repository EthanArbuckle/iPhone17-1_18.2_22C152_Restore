@interface TITester
+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3;
+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6;
+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9;
- (AutofillTestHarness)autofillTestHarness;
- (NSArray)tests;
- (TIReporter)reporter;
- (TITestHarness)testHarness;
- (TITester)initWithTests:(id)a3;
- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6;
- (void)createAutofillTestHarnessInstance:(id)a3;
- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5;
- (void)setAutofillTestHarness:(id)a3;
- (void)setReporter:(id)a3;
- (void)setTestHarness:(id)a3;
@end

@implementation TITester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autofillTestHarness, 0);
  objc_storeStrong((id *)&self->testHarness, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_tests, 0);
}

- (void)setAutofillTestHarness:(id)a3
{
}

- (AutofillTestHarness)autofillTestHarness
{
  return (AutofillTestHarness *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTestHarness:(id)a3
{
}

- (TITestHarness)testHarness
{
  return self->testHarness;
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setReporter:(id)a3
{
}

- (TIReporter)reporter
{
  return self->_reporter;
}

- (void)createAutofillTestHarnessInstance:(id)a3
{
  id v4 = a3;
  if (!self->_autofillTestHarness)
  {
    id v10 = v4;
    v5 = self->testHarness;
    v6 = [(TITestHarness *)v5 testTyper];
    v7 = NSClassFromString(&cfstr_Autofilltestha.isa);
    if (!v7)
    {
      fwrite("Error: Unable to load 'AutofillTestHarness' class\n\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      exit(1);
    }
    v8 = (AutofillTestHarness *)[[v7 alloc] initWithOptionsAndTestTyper:v10 testTyper:v6];
    autofillTestHarness = self->_autofillTestHarness;
    self->_autofillTestHarness = v8;

    id v4 = v10;
  }
}

- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6
{
  id v9 = a4;
  if (self->_autofillTestHarness)
  {
    id v10 = (objc_class *)MEMORY[0x263EFF8C0];
    id v11 = a3;
    id v12 = objc_alloc_init(v10);
    v13 = [(AutofillTestHarness *)self->_autofillTestHarness configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:v9];

    v14 = [(TITester *)self testHarness];
    id v15 = [v14 runTest:v11 trialID:a5 withError:0];

    [(AutofillTestHarness *)self->_autofillTestHarness updateResultForAutoFill:v15 predictionCandidatesWithoutTyping:v13];
  }
  else
  {
    id v15 = a3;
    v13 = [(TITester *)self testHarness];
    [v13 runTest:v15 trialID:a5 withError:0];
  v16 = };

  return v16;
}

- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [(TITester *)self reporter];
  [v9 beginLogTrial];

  NSUInteger v39 = [(NSArray *)self->_tests count];
  id v10 = [v8 valueForKey:@"TEST_AUTO_FILL_FEATURE"];
  int v11 = [v10 BOOLValue];

  id v12 = @"NO";
  if (v11) {
    id v12 = @"YES";
  }
  NSLog(&cfstr_AreWeGoingToTe.isa, v12);
  if (v11)
  {
    [(TITester *)self createAutofillTestHarnessInstance:v8];
    if (!v39)
    {
      v13 = [(AutofillTestHarness *)self->_autofillTestHarness runAutofillTestWithoutTyping:v8 testHarness:self->testHarness trialID:a5];
      v14 = [(TITester *)self reporter];
      [v14 logResult:v13];
    }
  }
  NSUInteger v38 = location + length;
  BOOL v15 = location >= location + length;
  unint64_t v16 = a5;
  if (!v15)
  {
    id v36 = v8;
    do
    {
      v17 = (void *)MEMORY[0x2455C2B00]();
      NSUInteger v18 = location + 1;
      fprintf((FILE *)*MEMORY[0x263EF8348], "Testing line: %lu/%lu\n", location + 1, v39);
      v19 = [(NSArray *)self->_tests objectAtIndexedSubscript:location];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [(TITester *)self testHarness];
        v21 = [v20 runConversationTest:v19 trialID:v16 withError:0];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              v28 = [(TITester *)self reporter];
              [v28 logResult:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v24);
          v29 = v22;
          id v8 = v36;
          unint64_t v16 = a5;
        }
        else
        {
          v29 = v22;
        }
      }
      else
      {
        v29 = [(TITester *)self runTestBasedOnTestType:v19 options:v8 trialID:v16 withError:0];
        id v22 = [(TITester *)self reporter];
        [v22 logResult:v29];
      }

      v30 = [(TITester *)self testHarness];
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        v32 = [(TITester *)self testHarness];
        [v32 performSelector:sel_reset withObject:0];
      }
      v33 = [MEMORY[0x263EFF9F0] currentRunLoop];
      v34 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.05];
      [v33 runUntilDate:v34];

      NSUInteger location = v18;
    }
    while (v18 != v38);
  }
  fputc(10, (FILE *)*MEMORY[0x263EF8348]);
  v35 = [(TITester *)self reporter];
  [v35 endLogTrial];
}

- (TITester)initWithTests:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITester;
  v6 = [(TITester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tests, a3);
  }

  return v7;
}

+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v84 = (void (**)(id, void *, void))a6;
  id v12 = [v10 valueForKey:@"START_INDEX"];
  int v13 = [v12 intValue];

  if (v13) {
    int v14 = v13 - 1;
  }
  else {
    int v14 = 0;
  }
  BOOL v15 = [v10 valueForKey:@"END_INDEX"];
  unsigned int v16 = [v15 intValue];

  v91 = v11;
  [v11 beginLogTrial];
  v17 = [v9 getNextTestCase];
  if (v17)
  {
    unint64_t v95 = v16;
    unint64_t v18 = v14;
    uint64_t v19 = 0;
    id v85 = v10;
    id v86 = v9;
    unint64_t v93 = v18;
    do
    {
      unint64_t v20 = v19++;
      if (v20 >= v18)
      {
        v21 = [v17 records];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          uint64_t v23 = (void *)MEMORY[0x2455C2B00]();
          fprintf((FILE *)*MEMORY[0x263EF8348], "Test case: %lu\n", v19);
          uint64_t v24 = (void *)[v10 mutableCopy];
          [v24 setObject:@"ACTRecordedActionStream" forKey:@"UserActionStream"];
          [v24 setObject:v17 forKey:@"TTKTestCase"];
          uint64_t v25 = [v24 objectForKey:@"USE_RETROCORRECTION"];

          if (!v25) {
            [v24 setObject:MEMORY[0x263EFFA88] forKey:@"USE_RETROCORRECTION"];
          }
          v26 = [v24 objectForKey:@"USE_PREDICTION"];

          if (!v26) {
            [v24 setObject:MEMORY[0x263EFFA88] forKey:@"USE_PREDICTION"];
          }
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          uint64_t v27 = [v17 records];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v103 objects:v110 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v97 = v20;
            v98 = v24;
            v96 = v23;
            uint64_t v94 = v19;
            uint64_t v30 = *(void *)v104;
LABEL_14:
            uint64_t v31 = 0;
            while (1)
            {
              if (*(void *)v104 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v103 + 1) + 8 * v31);
              v33 = [v32 layoutName];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                break;
              }
              if (v29 == ++v31)
              {
                uint64_t v29 = [v27 countByEnumeratingWithState:&v103 objects:v110 count:16];
                if (v29) {
                  goto LABEL_14;
                }
                int v35 = 2;
                unint64_t v18 = v93;
                uint64_t v19 = v94;
                uint64_t v23 = v96;
                unint64_t v20 = v97;
                uint64_t v24 = v98;
                goto LABEL_53;
              }
            }
            uint64_t v36 = [v32 layoutName];

            uint64_t v24 = v98;
            if (!v36)
            {
              int v35 = 2;
              unint64_t v18 = v93;
              uint64_t v19 = v94;
              uint64_t v23 = v96;
              unint64_t v20 = v97;
              goto LABEL_54;
            }
            v37 = (void *)v36;
            NSUInteger v38 = [v9 layouts];
            v89 = v37;
            uint64_t v39 = [v38 objectForKey:v37];

            v92 = (void *)v39;
            [v98 setObject:v39 forKey:@"TTKKeyboardPlane"];
            long long v40 = [v17 metadata];
            uint64_t v41 = [v40 objectForKey:@"displayWidth"];
            unint64_t v18 = v93;
            uint64_t v23 = v96;
            unint64_t v20 = v97;
            if (v41)
            {
              long long v42 = (void *)v41;
              long long v43 = [v17 metadata];
              v44 = [v43 objectForKey:@"displayHeight"];

              if (v44)
              {
                uint64_t v45 = [v17 metadata];
                v46 = [v45 objectForKey:@"displayWidth"];

                v47 = [v17 metadata];
                v48 = [v47 objectForKey:@"displayHeight"];

                uint64_t v49 = [v46 compare:v48];
                v50 = @"Portrait";
                if (v49 == 1) {
                  v50 = @"Landscape";
                }
                v51 = v50;

LABEL_32:
                [v98 setObject:v46 forKey:@"KEYBOARD_WIDTH"];
                [v98 setObject:v51 forKey:@"KEYBOARD_ORIENTATION"];
                v53 = (FILE *)*MEMORY[0x263EF8348];
                v88 = v46;
                int v54 = [v46 intValue];
                v87 = v51;
                fprintf(v53, "width = %d orientation = %s\n", v54, (const char *)[(__CFString *)v87 UTF8String]);
                v55 = objc_opt_new();
                v56 = objc_opt_new();
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                long long v102 = 0u;
                v90 = v17;
                v57 = [v17 records];
                uint64_t v58 = [v57 countByEnumeratingWithState:&v99 objects:v109 count:16];
                if (v58)
                {
                  uint64_t v59 = v58;
                  uint64_t v60 = *(void *)v100;
                  do
                  {
                    for (uint64_t i = 0; i != v59; ++i)
                    {
                      if (*(void *)v100 != v60) {
                        objc_enumerationMutation(v57);
                      }
                      v62 = *(void **)(*((void *)&v99 + 1) + 8 * i);
                      v63 = objc_opt_class();
                      v64 = [v62 primaryIntendedText];
                      v65 = [v63 stringByReplacingCurlyQuotesWithStraightQuotes:v64];

                      [v55 addObject:v65];
                      v66 = [v62 layoutName];
                      char v67 = [v56 containsObject:v66];

                      if ((v67 & 1) == 0)
                      {
                        v68 = [v62 layoutName];
                        v69 = [v68 description];
                        [v56 addObject:v69];
                      }
                    }
                    uint64_t v59 = [v57 countByEnumeratingWithState:&v99 objects:v109 count:16];
                  }
                  while (v59);
                }

                v70 = [[AutocorrectionTestHarness alloc] initWithAttributes:v98];
                v71 = [v90 metadata];
                v72 = (void *)[v71 mutableCopy];

                [v72 setValue:v56 forKey:@"layouts"];
                v73 = TTKLogFacility();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                {
                  id v74 = [v72 objectForKeyedSubscript:@"recordIdentifier"];
                  uint64_t v75 = [v74 cStringUsingEncoding:4];
                  *(_DWORD *)buf = 136315138;
                  uint64_t v108 = v75;
                  _os_log_impl(&dword_23EFD2000, v73, OS_LOG_TYPE_INFO, "Running test case with recordIdentifier: %s", buf, 0xCu);
                }
                v76 = (FILE *)*MEMORY[0x263EF8358];
                id v77 = [v72 objectForKeyedSubscript:@"recordIdentifier"];
                fprintf(v76, "Running test case with recordIdentifier: %s\n", (const char *)[v77 cStringUsingEncoding:4]);

                v78 = +[AutocorrectionTest testWithInput:&stru_26F2B7E50 expectedOutput:v55 sourceMetadata:v72 withTouches:0 andCorpusId:0];
                unint64_t v20 = v97;
                v79 = [(AutocorrectionTestHarness *)v70 runTest:v78 trialID:v97 withError:0];
                [v91 logResult:v79];
                unint64_t v18 = v93;
                if (objc_opt_respondsToSelector()) {
                  [(AutocorrectionTestHarness *)v70 performSelector:sel_reset withObject:0];
                }
                v80 = [MEMORY[0x263EFF9F0] currentRunLoop];
                v81 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.05];
                [v80 runUntilDate:v81];

                if ([(AutocorrectionTestHarness *)v70 requiresMaintenance])
                {
                  [MEMORY[0x263F7EAE0] flushDynamicLearningCaches];
                  unint64_t v20 = v97;
                  [MEMORY[0x263F7EAE0] performMaintenance];
                }

                int v35 = 0;
                id v10 = v85;
                id v9 = v86;
                uint64_t v27 = v89;
                v17 = v90;
                uint64_t v19 = v94;
                uint64_t v23 = v96;
                uint64_t v24 = v98;
                goto LABEL_52;
              }
            }
            else
            {
            }
            if (v92)
            {
              v52 = NSNumber;
              [v92 keyboardWidth];
              v46 = objc_msgSend(v52, "numberWithFloat:");
              v51 = [v92 keyboardOrientation];
              goto LABEL_32;
            }
            objc_opt_class();
            uint64_t v27 = v89;
            uint64_t v19 = v94;
            uint64_t v24 = v98;
            if (objc_opt_isKindOfClass()) {
              fwrite("Unable to find keyboard layout-- layoutName is null\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
            }
            else {
              fprintf((FILE *)*MEMORY[0x263EF8348], "Unable to find keyboard layout for name='%s'\n", (const char *)[v89 UTF8String]);
            }
            int v35 = 2;
LABEL_52:

            goto LABEL_53;
          }
          int v35 = 2;
LABEL_53:

LABEL_54:
          if (!v35 && (int)v95 >= 1 && v20 >= v95) {
            break;
          }
        }
      }
      uint64_t v82 = [v9 getNextTestCase];

      v17 = (void *)v82;
    }
    while (v82);
  }
  [v91 endLogTrial];
  v83 = [v91 reportForTrial:0];
  if (v84) {
    v84[2](v84, v83, 0);
  }
}

+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"‘" withString:@"'"];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"“" withString:@"\""];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"”" withString:@"\""];

  return v6;
}

+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v26 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(id, void *, void))a9;
  context = (void *)MEMORY[0x2455C2B00]();
  unint64_t v18 = (void *)[objc_alloc((Class)a1) initWithTests:v26];
  uint64_t v25 = v16;
  [v18 setReporter:v16];
  [v18 setTestHarness:v14];
  if (a8)
  {
    for (uint64_t i = 0; i != a8; ++i)
    {
      uint64_t v20 = fprintf((FILE *)*MEMORY[0x263EF8348], "Beginning trial %lu\n", i);
      v21 = (void *)MEMORY[0x2455C2B00](v20);
      objc_msgSend(v18, "runTestsInRange:options:trialID:", location, length, v15, i);
      if ([v14 requiresMaintenance])
      {
        [MEMORY[0x263F7EAE0] flushDynamicLearningCaches];
        [MEMORY[0x263F7EAE0] performMaintenance];
      }
      uint64_t v22 = [v18 reporter];
      uint64_t v23 = [v22 reportForTrial:i];

      if (v17) {
        v17[2](v17, v23, i);
      }
    }
  }
}

@end