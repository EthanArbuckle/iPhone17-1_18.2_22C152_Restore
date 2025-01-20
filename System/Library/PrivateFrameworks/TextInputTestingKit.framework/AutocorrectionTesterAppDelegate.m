@interface AutocorrectionTesterAppDelegate
+ (id)reporterWithOptions:(id)a3;
+ (void)setupSingletonMocksWithOptions:(id)a3;
+ (void)teardownSingletonMocks:(id)a3;
- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4;
- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3;
- (BOOL)runAndWriteReport;
- (BOOL)runAutocorrectionTester:(id)a3;
- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5;
- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7;
- (BOOL)runWithObserver:(id)a3;
- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6;
- (void)resetOptions:(id)a3;
@end

@implementation AutocorrectionTesterAppDelegate

- (void).cxx_destruct
{
}

- (BOOL)runAndWriteReport
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__AutocorrectionTesterAppDelegate_runAndWriteReport__block_invoke;
  v3[3] = &unk_265050130;
  v3[4] = self;
  return [(AutocorrectionTesterAppDelegate *)self runWithObserver:v3];
}

void __52__AutocorrectionTesterAppDelegate_runAndWriteReport__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v11 = +[TIReporter fileURLForTrial:a3 withOptions:v4];
  TITestTyperWritePropertyListToFile(v5, v11);
  v6 = [v5 objectForKeyedSubscript:@"KeystrokeSavingsRatio"];
  [v6 floatValue];

  v7 = [v5 objectForKeyedSubscript:@"WordAccuracy"];

  [v7 floatValue];
  float v9 = 1.0 - v8;

  v10 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "KSR:\t %.3f\n", v9);
  fprintf(*v10, "Error Rate: %.2f%%\n", (float)(v9 * 100.0));
}

- (BOOL)runWithObserver:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v57 = a3;
  uint64_t v4 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_INDEX"];

  if (v4)
  {
    v58 = +[TISweepSource sharedInstance];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v5 = self;
    obuint64_t j = self->_options;
    uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v67 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_options objectForKey:v10];
          v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"[],"];
          v13 = [v11 componentsSeparatedByCharactersInSet:v12];

          if ((unint64_t)[v13 count] >= 2)
          {
            v14 = [v13 objectAtIndex:1];
            [v14 floatValue];
            int v16 = v15;

            LODWORD(v17) = v16;
            [v58 addValue:v10 withValue:v17];
          }
        }
        uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v7);
    }

    v18 = [v58 debugValues];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = v57;
      char v21 = [(AutocorrectionTesterAppDelegate *)v5 runAutocorrectionTester:v57];

      goto LABEL_33;
    }

    self = v5;
  }
  v22 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_COUNT"];

  if (!v22)
  {
LABEL_30:
    v20 = v57;
    char v21 = [(AutocorrectionTesterAppDelegate *)self runAutocorrectionTester:v57];
    goto LABEL_33;
  }
  v23 = +[TISweepSource sharedInstance];
  v24 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_COUNT"];
  v59 = v23;
  objc_msgSend(v23, "setStepCount:", objc_msgSend(v24, "intValue"));

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v25 = self;
  obja = self->_options;
  uint64_t v26 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(obja);
        }
        uint64_t v30 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        v31 = [(NSMutableDictionary *)self->_options objectForKey:v30];
        v32 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"[],"];
        v33 = [v31 componentsSeparatedByCharactersInSet:v32];

        if ((unint64_t)[v33 count] >= 2)
        {
          v34 = [v33 objectAtIndex:1];
          [v34 floatValue];
          int v36 = v35;

          v37 = [v33 objectAtIndex:2];
          [v37 floatValue];
          int v39 = v38;

          LODWORD(v40) = v36;
          LODWORD(v41) = v39;
          [v59 addValue:v30 withMin:v40 withMax:v41];
        }
      }
      uint64_t v27 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v27);
  }

  v42 = [v59 debugValues];
  uint64_t v43 = [v42 count];

  if (!v43)
  {

    self = v25;
    goto LABEL_30;
  }
  v44 = [MEMORY[0x263F089D8] string];
  v45 = [v59 sweepStateHeader];
  [v44 appendFormat:@"%@results,\n", v45];

  v46 = [(NSMutableDictionary *)v25->_options valueForKey:@"OUTPATH"];
  v47 = [(NSMutableDictionary *)v25->_options objectForKey:@"SWEEP_EXTRACT"];
  v48 = [v46 stringByDeletingLastPathComponent];
  v49 = [v48 stringByAppendingPathComponent:v47];

  v50 = [v49 stringByAppendingFormat:@" %@ > /tmp/sweep_value.txt", v46];

  v51 = [NSString stringWithFormat:@"sh %@", v50];

  v20 = v57;
  if ([v59 finished])
  {
LABEL_28:
    v55 = [v46 stringByDeletingPathExtension];

    v46 = [v55 stringByAppendingString:@"_sweep.csv"];

    char v21 = 1;
    [v44 writeToFile:v46 atomically:1 encoding:4 error:0];
  }
  else
  {
    while ([(AutocorrectionTesterAppDelegate *)v25 runAutocorrectionTester:v57])
    {
      system((const char *)[v51 cStringUsingEncoding:4]);
      v52 = [NSString stringWithContentsOfFile:@"/tmp/sweep_value.txt" encoding:4 error:0];
      v53 = [v59 sweepStateValues];
      [v52 floatValue];
      [v44 appendFormat:@"%@%f,\n", v53, v54];

      [v59 advanceSweep];
      if ([v59 finished]) {
        goto LABEL_28;
      }
    }
    char v21 = 0;
  }

LABEL_33:
  return v21;
}

- (BOOL)runAutocorrectionTester:(id)a3
{
  v140[3] = *MEMORY[0x263EF8340];
  id v118 = a3;
  uint64_t v4 = [(NSMutableDictionary *)self->_options objectForKey:@"WORDS"];
  v116 = [(NSMutableDictionary *)self->_options objectForKey:@"DICTS"];
  id v5 = [(NSMutableDictionary *)self->_options objectForKey:@"PLAYBACK"];
  v113 = [(NSMutableDictionary *)self->_options objectForKey:@"TEXT"];
  v114 = [(NSMutableDictionary *)self->_options objectForKey:@"TESTCASE"];
  uint64_t v115 = [(NSMutableDictionary *)self->_options objectForKey:@"TYPOLOGY"];
  v109 = [(NSMutableDictionary *)self->_options objectForKey:@"CANDIDATE_SENTENCES"];
  uint64_t v6 = [(NSMutableDictionary *)self->_options objectForKey:@"USER_DIRECTORY"];
  uint64_t v7 = [(NSMutableDictionary *)self->_options objectForKey:@"CUSTOM_DIALECT_LANGUAGE_MODEL_PATH"];
  uint64_t v8 = [(NSMutableDictionary *)self->_options valueForKey:@"RUN_DSL_TEST"];

  id v110 = [(NSMutableDictionary *)self->_options objectForKey:@"CONVERSATION_TESTS_FILE"];
  id v9 = [(NSMutableDictionary *)self->_options objectForKey:@"CONVERSATION_TESTS"];
  v112 = [(NSMutableDictionary *)self->_options objectForKey:@"SENTENCE"];
  uint64_t v10 = [(NSMutableDictionary *)self->_options objectForKey:@"PREFERS_TRANSLITERATION"];
  id v11 = v10;
  if (!v10) {
    uint64_t v10 = @"0";
  }
  int v12 = [(__CFString *)v10 BOOLValue];

  v111 = [(NSMutableDictionary *)self->_options objectForKey:@"INPUT_SAMPLES"];
  if (v6)
  {
    v13 = v7;
    v14 = [(NSMutableDictionary *)self->_options objectForKey:@"CLEAN_USER_DIRECTORY"];
    int v15 = [v14 intValue];

    if (v15) {
      __remakeDirectoryAtPath(v6);
    }
    else {
      __createDirectoryAtPath(v6);
    }
    TI_SET_KB_USER_DIRECTORY();
    uint64_t v7 = v13;
  }
  int v16 = [(NSMutableDictionary *)self->_options valueForKey:@"KEYBOARD_LANGUAGE"];
  if (v16 && (isInputModeAvailable() & 1) == 0)
  {
    NSLog(&cfstr_UnsupportedLan.isa, v16);
    char v24 = 0;
    v25 = (void *)v115;
LABEL_38:
    v47 = v110;
LABEL_39:
    v46 = v116;
    goto LABEL_40;
  }
  int context = v12;
  double v17 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];

  if (v17)
  {
    v18 = v4;
    id v19 = v9;
    v20 = v16;
    char v21 = v7;
    v22 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];
    unsigned int v23 = [v22 intValue];

    if (v23 > 2)
    {
      uint64_t v26 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];
      NSLog(&cfstr_UnsupportedVal.isa, v26);
    }
    else
    {
      TI_SET_USING_TOUCAN_LM();
    }
    uint64_t v7 = v21;
    int v16 = v20;
    id v9 = v19;
    uint64_t v4 = v18;
  }
  if (v7)
  {
    TI_SET_IS_USING_CUSTOM_DIALECT_LM();
    TI_SET_DIALECT_LM_PATH();
  }
  uint64_t v27 = objc_opt_class();
  v25 = (void *)v115;
  if (v115) {
    uint64_t v27 = objc_opt_class();
  }
  uint64_t v28 = v27;
  if (!v16)
  {
    if (!v116) {
      goto LABEL_37;
    }
    contexta = (void *)MEMORY[0x2455C2B00]();
    availableInputModes();
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      int v38 = v7;
      int v39 = self;
      id v99 = v9;
      v101 = v38;
      v103 = v4;
      v105 = v5;
      double v40 = 0;
      uint64_t v41 = *(void *)v120;
      double v42 = 0.0;
      do
      {
        uint64_t v43 = 0;
        v44 = v40;
        do
        {
          if (*(void *)v120 != v41) {
            objc_enumerationMutation(obj);
          }
          v45 = *(void **)(*((void *)&v119 + 1) + 8 * v43);
          [(NSMutableDictionary *)v39->_options setObject:v45 forKey:@"INPUT_MODE"];
          double v40 = read_unigrams_dictionary(v116, v45);

          double v42 = v42
              + (double)[(AutocorrectionTesterAppDelegate *)v39 runTests:v40 withHarnessClass:v28 forLanguage:v45 errorMessage:@"Unable to read the dictionary file.\n" reportObserver:v118];
          ++v43;
          v44 = v40;
        }
        while (v37 != v43);
        uint64_t v37 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
      }
      while (v37);

      uint64_t v4 = v103;
      v46 = v116;
      id v5 = v105;
      v25 = (void *)v115;
      int v16 = 0;
      uint64_t v7 = v101;
      id v9 = v99;
    }
    else
    {
      double v42 = 0.0;
      v46 = v116;
    }
    double v50 = v42 / 60.0;
    if (v42 > 0.0) {
      double v50 = v42;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "Total testing time: %.2f s\n", v50);

    char v24 = 1;
LABEL_47:
    v47 = v110;
    goto LABEL_40;
  }
  if (!isInputModeAvailable())
  {
    NSLog(&cfstr_UnsupportedLan.isa, v16);
    goto LABEL_37;
  }
  [(NSMutableDictionary *)self->_options setObject:v16 forKey:@"INPUT_MODE"];
  if (v4)
  {
    read_wordlist((uint64_t)v4);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = @"Unable to read the word list file.\n";
    v31 = self;
    id v32 = v29;
    uint64_t v33 = v28;
    v34 = v16;
LABEL_24:
    char v35 = [(AutocorrectionTesterAppDelegate *)v31 runTests:v32 withHarnessClass:v33 forLanguage:v34 errorMessage:v30 reportObserver:v118];
    goto LABEL_25;
  }
  v106 = v5;
  if (v116)
  {
    v49 = read_unigrams_dictionary(v116, v16);
    char v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v49 withHarnessClass:v28 forLanguage:v16 errorMessage:@"Unable to read the dictionary file.\n" reportObserver:v118];

    v47 = v110;
    v46 = v116;
    goto LABEL_40;
  }
  if (v8)
  {
    [(NSMutableDictionary *)self->_options setObject:@"YES" forKey:@"RUN_DSL_TEST"];
    v51 = [(NSMutableDictionary *)self->_options valueForKey:@"DSL_TEST_FILE"];
    [(AutocorrectionTesterAppDelegate *)self runDslTest:v51 withHarnessClass:v28 forLanguage:v16 errorMessage:0];
    char v24 = v52 != 0.0;

    v47 = v110;
    v46 = 0;
    goto LABEL_40;
  }
  if (v114) {
    char v53 = context;
  }
  else {
    char v53 = 1;
  }
  if ((v53 & 1) == 0)
  {
    id v29 = +[TTKTestCaseReader loadFromPath:v114];
    if (!v29)
    {
      NSLog(&cfstr_CouldNotOpen.isa, v114);
      char v24 = 0;
      goto LABEL_26;
    }
    v61 = [(NSMutableDictionary *)self->_options objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

    if (!v61) {
      [(NSMutableDictionary *)self->_options setValue:@"alignment" forKey:@"KEYSTROKE_SEGMENTATION_MODE"];
    }
    char v35 = [(AutocorrectionTesterAppDelegate *)self runTestCasesForSource:v29 errorMessage:0 reportObserver:v118];
LABEL_25:
    char v24 = v35;
LABEL_26:

    goto LABEL_38;
  }
  uint64_t v98 = v28;
  if (context)
  {
    float v54 = v7;
    [(NSMutableDictionary *)self->_options setObject:@"YES" forKey:@"PREFERS_PREDICTION_SELECTION"];
    v55 = [(NSMutableDictionary *)self->_options objectForKey:@"TEST_SENTENCE_TRANSLITERATION"];
    v56 = v55;
    if (!v55) {
      v55 = @"0";
    }
    uint64_t v57 = [(__CFString *)v55 BOOLValue];

    v58 = [(NSMutableDictionary *)self->_options objectForKey:@"TRANSLITERATE_WITH_SPACES"];
    v59 = v58;
    if (!v58) {
      v58 = @"0";
    }
    uint64_t v60 = [(__CFString *)v58 BOOLValue];

    uint64_t v7 = v54;
    if (v112)
    {
      id v29 = +[PlaybackTest loadFromSentence:v112 withCatenation:v57];
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = 0;
      if (!v113) {
        goto LABEL_37;
      }
      id v29 = +[PlaybackTest loadFromTextInputFile:v113 withCatenation:v57 addWordSpacing:v60];
    }
    uint64_t v33 = v98;
    if (v29)
    {
      v31 = self;
      id v32 = v29;
      v34 = v16;
      uint64_t v30 = 0;
      goto LABEL_24;
    }
LABEL_37:
    char v24 = 0;
    goto LABEL_38;
  }
  if (v113)
  {
    uint64_t v134 = 0;
    long long v62 = read_textfile((uint64_t)v113, (uint64_t)&v134);
    if (v62)
    {
      char v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v62 withHarnessClass:v28 forLanguage:v16 errorMessage:0 reportObserver:v118];
    }
    else
    {
      NSLog(&cfstr_CouldNotOpen.isa, v113);
      char v24 = 0;
    }
    v46 = 0;

    goto LABEL_47;
  }
  if (v111)
  {
    long long v63 = [MEMORY[0x263EFF980] array];
    v132[0] = MEMORY[0x263EF8330];
    v132[1] = 3221225472;
    v132[2] = __59__AutocorrectionTesterAppDelegate_runAutocorrectionTester___block_invoke;
    v132[3] = &unk_2650500F8;
    id v133 = v63;
    id v29 = v63;
    [v111 enumerateObjectsUsingBlock:v132];
    char v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v29 withHarnessClass:v28 forLanguage:v16 errorMessage:0 reportObserver:v118];

    goto LABEL_26;
  }
  v104 = v6;
  v102 = v7;
  if (v110)
  {
    long long v64 = v9;
    long long v65 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:");
    id v131 = 0;
    long long v66 = [MEMORY[0x263F08900] JSONObjectWithData:v65 options:4 error:&v131];
    id v67 = v131;
    if (!v66)
    {
      v95 = (FILE *)*MEMORY[0x263EF8348];
      v96 = (const char *)[v110 cStringUsingEncoding:4];
      id v97 = [v67 localizedDescription];
      fprintf(v95, "Error: Unable to parse JSON config file '%s': %s\n\n", v96, (const char *)[v97 cStringUsingEncoding:4]);

      exit(1);
    }
    long long v68 = [v66 objectForKeyedSubscript:@"conversationTests"];
    uint64_t v69 = conversationTestsFromJsonArray(v68);

    id v9 = (id)v69;
    v25 = (void *)v115;
    uint64_t v6 = v104;
    uint64_t v7 = v102;
  }
  if (!v9)
  {
    if (v112)
    {
      v89 = v7;
      v90 = +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:");
      v136 = v90;
      v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];

      char v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v91 withHarnessClass:v98 forLanguage:v16 errorMessage:0 reportObserver:v118];
      id v9 = 0;
      v47 = v110;
      uint64_t v7 = v89;
      uint64_t v4 = 0;
      goto LABEL_39;
    }
    v92 = self;
    v46 = 0;
    if (v25)
    {
      v25 = (void *)v115;
      v93 = read_typologyInfo(v115);
      char v24 = [(AutocorrectionTesterAppDelegate *)v92 runTests:v93 withHarnessClass:v98 forLanguage:v16 errorMessage:0 reportObserver:v118];

      id v9 = 0;
      uint64_t v4 = 0;
    }
    else
    {
      if (v109)
      {
        v94 = read_candidates((uint64_t)v109);
        char v24 = [(AutocorrectionTesterAppDelegate *)v92 runTests:v94 withHarnessClass:v98 forLanguage:v16 errorMessage:@"Unable to read candidates\n" reportObserver:v118];

        id v9 = 0;
      }
      else
      {
        id v9 = 0;
        char v24 = 0;
      }
      uint64_t v4 = 0;
      v25 = (void *)v115;
    }
    uint64_t v7 = v102;
    goto LABEL_47;
  }
  v100 = v16;
  id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v139[0] = @"CONVERSATION_SENDERS_TO_TEST";
  v139[1] = @"CONVERSATION_ADAPT_TO_SENT_MESSAGES";
  v140[0] = @"sendersToTest";
  v140[1] = @"adaptToSentMessages";
  v139[2] = @"CONVERSATION_ADAPT_TO_RECEIVED_MESSAGES";
  v140[2] = @"adaptToReceivedMessages";
  [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:3];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v71 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v72 = [v71 countByEnumeratingWithState:&v127 objects:v138 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v73; ++i)
      {
        if (*(void *)v128 != v74) {
          objc_enumerationMutation(v71);
        }
        uint64_t v76 = *(void *)(*((void *)&v127 + 1) + 8 * i);
        v77 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v76];

        if (v77)
        {
          v78 = [v71 objectForKeyedSubscript:v76];
          v79 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v76];
          [v70 setObject:v79 forKeyedSubscript:v78];
        }
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v127 objects:v138 count:16];
    }
    while (v73);
  }
  v80 = v71;
  v81 = self;
  v82 = v80;

  id v83 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v9 = v9;
  uint64_t v84 = [v9 countByEnumeratingWithState:&v123 objects:v137 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v124;
    do
    {
      for (uint64_t j = 0; j != v85; ++j)
      {
        if (*(void *)v124 != v86) {
          objc_enumerationMutation(v9);
        }
        v88 = [*(id *)(*((void *)&v123 + 1) + 8 * j) overridingJsonKeys:v70];
        [v83 addObject:v88];
      }
      uint64_t v85 = [v9 countByEnumeratingWithState:&v123 objects:v137 count:16];
    }
    while (v85);
  }

  char v24 = [(AutocorrectionTesterAppDelegate *)v81 runTests:v83 withHarnessClass:v98 forLanguage:v100 errorMessage:0 reportObserver:v118];
  uint64_t v4 = 0;
  uint64_t v6 = v104;
  v25 = (void *)v115;
  v46 = 0;
  int v16 = v100;
  id v5 = v106;
  v47 = v110;
  uint64_t v7 = v102;
LABEL_40:

  return v24;
}

void __59__AutocorrectionTesterAppDelegate_runAutocorrectionTester___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[AutocorrectionTest testWithInput:v8];
    [v6 addObject:v7];
  }
  else
  {
    NSLog(&cfstr_ErrorUnableToP_1.isa);
    *a4 = 1;
  }
}

- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v8)
  {
    double v12 = Current;
    v13 = (void *)MEMORY[0x2455C2B00]();
    [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
    v14 = [(id)objc_opt_class() reporterWithOptions:self->_options];
    int v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
    int v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2.0];
    [v15 runUntilDate:v16];

    +[TITester runTestCasesForSource:v8 options:self->_options reporter:v14 reportObserver:v10];
    [(id)objc_opt_class() teardownSingletonMocks:self->_options];
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent() - v12;
    fprintf((FILE *)*MEMORY[0x263EF8348], "Testing time: %.2f s\n", v17);
    BOOL v18 = v17 != 0.0;
  }
  else
  {
    if (v9) {
      NSLog(&stru_26F2B8550.isa, Current, v9);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double Current = CFAbsoluteTimeGetCurrent();
  NSLog(&cfstr_CurrentLanguag.isa, v13);
  if (v12)
  {
    id v33 = v14;
    int context = (void *)MEMORY[0x2455C2B00]();
    [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
    CFAbsoluteTime v17 = [(id)objc_opt_class() reporterWithOptions:self->_options];
    BOOL v18 = (void *)[[a4 alloc] initWithAttributes:self->_options];
    id v19 = [MEMORY[0x263EFF9F0] currentRunLoop];
    v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2.0];
    [v19 runUntilDate:v20];

    char v21 = [(NSMutableDictionary *)self->_options valueForKey:@"NUM_TRIALS"];
    int v22 = [v21 intValue];

    if (v22 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v22;
    }
    char v24 = [(NSMutableDictionary *)self->_options valueForKey:@"START_INDEX"];
    int v25 = [v24 intValue];

    if (v25) {
      int v26 = v25 - 1;
    }
    else {
      int v26 = 0;
    }
    uint64_t v27 = [(NSMutableDictionary *)self->_options valueForKey:@"END_INDEX"];
    int v28 = [v27 intValue];

    if (!v28) {
      int v28 = [v12 count];
    }
    +[TITester runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:](TITester, "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:", v12, v26, v28 - v26, v18, self->_options, v17, v23, v15);

    [(id)objc_opt_class() teardownSingletonMocks:self->_options];
    CFAbsoluteTime v29 = CFAbsoluteTimeGetCurrent() - Current;
    fprintf((FILE *)*MEMORY[0x263EF8348], "Testing time: %.2f s\n", v29);
    BOOL v30 = v29 != 0.0;
    id v14 = v33;
  }
  else
  {
    if (v14) {
      NSLog(&stru_26F2B8550.isa, v14);
    }
    BOOL v30 = 0;
  }

  return v30;
}

- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v36 = a6;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v37 = v11;
  NSLog(&cfstr_CurrentLanguag.isa, v11);
  NSLog(&cfstr_CurrentDslFile.isa, v10);
  int context = (void *)MEMORY[0x2455C2B00]();
  [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
  id v13 = (void *)[[a4 alloc] initWithAttributes:self->_options];
  id v14 = [MEMORY[0x263EFF9F0] currentRunLoop];
  id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2.0];
  [v14 runUntilDate:v15];

  int v16 = [v13 dslTestDriver];
  [v16 consumeTestFile:v10];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CFAbsoluteTime v17 = [v13 dslTestDriver];
  BOOL v18 = [v17 syntaxErrors];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(id *)(*((void *)&v42 + 1) + 8 * i);

        id v21 = v24;
        printf("Syntax Error: %s\n", (const char *)[v21 UTF8String]);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v20);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v25 = [v13 dslTestDriver];
  int v26 = [v25 failedTests];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    id v29 = 0;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v26);
        }
        id v32 = *(id *)(*((void *)&v38 + 1) + 8 * j);

        id v29 = v32;
        printf("Failed Test: %s\n", (const char *)[v29 UTF8String]);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v28);
  }
  [(id)objc_opt_class() teardownSingletonMocks:self->_options];
  double v33 = CFAbsoluteTimeGetCurrent() - Current;
  fprintf((FILE *)*MEMORY[0x263EF8348], "Testing time: %.2f s\n", v33);

  return v33;
}

- (void)resetOptions:(id)a3
{
  self->_options = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  MEMORY[0x270F9A758]();
}

- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4
{
  v16[6] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AutocorrectionTesterAppDelegate;
  id v8 = [(AutocorrectionTesterAppDelegate *)&v14 init];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x263EFF9A0];
    v15[0] = @"KEYBOARD_LANGUAGE";
    v15[1] = @"SENTENCE";
    v16[0] = v6;
    v16[1] = v7;
    v15[2] = @"USE_PREDICTION";
    v15[3] = @"MAX_PREDICTIONS_REPORTED";
    v16[2] = MEMORY[0x263EFFA88];
    v16[3] = &unk_26F2C9CA8;
    v15[4] = @"USE_RETROCORRECTION";
    v15[5] = @"BASE_KEY_FOR_VARIANTS";
    v16[4] = MEMORY[0x263EFFA88];
    v16[5] = MEMORY[0x263EFFA80];
    id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
    uint64_t v11 = [v9 dictionaryWithDictionary:v10];
    options = v8->_options;
    v8->_options = (NSMutableDictionary *)v11;
  }
  return v8;
}

- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocorrectionTesterAppDelegate;
  id v5 = [(AutocorrectionTesterAppDelegate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;
  }
  return v5;
}

+ (id)reporterWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MGCopyAnswer();
  id v5 = [[TIReporter alloc] initWithBuildVersion:v4];
  [(TIReporter *)v5 setOptions:v3];

  return v5;
}

+ (void)teardownSingletonMocks:(id)a3
{
  id v3 = [a3 valueForKey:@"TEST_AUTO_FILL_FEATURE"];
  char v4 = [v3 BOOLValue];

  _TIEndMockingSingletonsWithData(v4);
}

+ (void)setupSingletonMocksWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v14 = [v3 objectForKey:@"NAMEDENTITIES"];
  uint64_t v4 = [v3 objectForKey:@"PORTRAIT_NAMEDENTITIES"];
  id v5 = [v3 objectForKey:@"ADDRESSBOOK"];
  uint64_t v6 = [v3 valueForKey:@"TEST_AUTO_FILL_FEATURE"];

  char v7 = [v6 BOOLValue];
  Class v8 = NSClassFromString(&cfstr_Titransientlex_0.isa);
  if (v5)
  {
    if (!v8)
    {
      objc_super v9 = read_contactsfile((uint64_t)v5);
      _TIBeginMockingSingletonsWithResources(v9, MEMORY[0x263EFFA68], 0, 1, v7);

      goto LABEL_16;
    }
LABEL_6:
    if (v14)
    {
      id v10 = read_nefile(v14);
      if (v4)
      {
LABEL_8:
        uint64_t v11 = read_portrait_nefile((void *)v4);
LABEL_11:
        id v12 = [v10 arrayByAddingObjectsFromArray:v11];

        if (v5)
        {
          id v13 = read_mock_contactsfile((uint64_t)v5);
        }
        else
        {
          id v13 = (void *)MEMORY[0x263EFFA68];
        }
        _TIBeginMockingSingletonsWithMockData(v13, v12, MEMORY[0x263EFFA68], 0, 0, v7);

        goto LABEL_16;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263EFFA68];
      if (v4) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_11;
  }
  if (v14 | v4 && v8) {
    goto LABEL_6;
  }
  _TIBeginMockingSingletonsWithData(0, 0, 0, 0, 0, v7);
LABEL_16:
}

@end