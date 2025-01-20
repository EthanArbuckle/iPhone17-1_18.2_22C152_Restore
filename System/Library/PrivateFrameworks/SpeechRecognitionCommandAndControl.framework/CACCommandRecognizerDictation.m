@interface CACCommandRecognizerDictation
- (__RXLanguageObject)_adLibLanguageObjectFromLanguageModel:(__RXLanguageObject *)a3;
- (id)_attributedStringFromResult:(__RXLanguageObject *)a3;
- (void)handleDictation:(id)a3;
- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4;
@end

@implementation CACCommandRecognizerDictation

- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4
{
  v44[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    int Type = RXLanguageObjectGetType();
    if (Type == 6)
    {
      v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      v10 = [(CACCommandRecognizer *)self speechRecognizer];
      [v9 registerSignPostEndProcessingForSpeechRecognizer:v10 message:@"Close Result."];
      goto LABEL_23;
    }
    if (Type == 5 && RXLanguageObjectGetCount() == 1)
    {
      uint64_t ObjectAtIndex = RXLanguageObjectGetObjectAtIndex();
      v9 = (void *)RXObjectCopyProperty();
      if (([v9 isEqualToString:@"Dictation.Streaming"] & 1) == 0
        && ([v9 isEqualToString:@"Dictation.Literal"] & 1) == 0
        && ![v9 isEqualToString:@"Dictation.SpellAs"])
      {
        [v9 isEqualToString:@"System.IgnoreSiriKeywordAndOptionalPhrase"];
        goto LABEL_24;
      }
      v10 = [(CACCommandRecognizerDictation *)self _attributedStringFromResult:a4];
      v11 = [v10 string];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        v33 = v9;
        CFStringRef v13 = CFCopyDescription(a4);
        v14 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
        v43[0] = @"Text";
        v34 = v10;
        v15 = [v10 string];
        v43[1] = @"RXResultDescription";
        v44[0] = v15;
        v32 = (__CFString *)v13;
        v44[1] = v13;
        v16 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
        [v14 setDictationProperties:v16];

        v17 = +[CACSpeechSystem speechSystem];
        v18 = [v17 resultLanguageModelFromRXLanguageObject:ObjectAtIndex];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        obj = self->super._spokenCommandsCache;
        uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              v24 = [v23 identifier];
              v25 = [v18 identifier];
              int v26 = [v24 isEqualToString:v25];

              if (v26)
              {
                v27 = [(CACCommandRecognizer *)self commandParametersFromCACLanguageModel:v18];
                v40 = kCACCommandParameterAttributedText;
                v41 = v34;
                v28 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
                [v27 setObject:v28 forKey:*MEMORY[0x263F78BF8]];

                [v23 setRecognizedParameters:v27];
                v29 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                [v29 handleRecognizedCommand:v23];

                v30 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                int v31 = [v30 dictationRecognizerMode];

                if (v31 == 3) {
                  +[CACCommandRecognizer suspendCloseMatchAccumulatorForCommand];
                }

                goto LABEL_22;
              }
            }
            uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_22:

        v9 = v33;
        v10 = v34;
      }
LABEL_23:

LABEL_24:
    }
  }
}

- (void)handleDictation:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CACSystemStatusManager sharedManager];
  int v5 = [v4 isSystemDictationRunning];

  if (v5)
  {
    id v6 = CACLogDictationCommands();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CACCommandRecognizerDictation handleDictation:](v6);
    }
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F089B8]);
    v8 = [v3 recognizedParameters];
    v9 = (void *)MEMORY[0x263F78BF8];
    v10 = [v8 objectForKey:*MEMORY[0x263F78BF8]];
    v11 = [v10 objectForKey:kCACCommandParameterAttributedText];
    id v6 = [v7 initWithAttributedString:v11];

    uint64_t v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    CFStringRef v13 = [v12 stagedTextInsertionSpecifier];
    [v13 setInsertedCategoryID:*v9];

    v14 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    LODWORD(v13) = [v14 dictationRecognizerMode];

    if ((v13 - 4) <= 0xFFFFFFFD)
    {
      v15 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v16 = [v15 doesCurrentLanguageSupportInterWordSpaces];

      if (v16)
      {
        v17 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        v33 = [v17 leadingTextForCurrentSelection];

        v18 = +[CACPreferences sharedPreferences];
        uint64_t v19 = +[CACPreferences sharedPreferences];
        uint64_t v20 = [v19 bestLocaleIdentifier];
        uint64_t v21 = [v18 vocabularyEntriesForLocaleIdentifier:v20];

        v22 = objc_opt_new();
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v23 = v21;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectForKey:@"Text"];
              [v22 addObject:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v25);
        }

        v29 = +[CACSpeechSystem speechSystem];
        v30 = [v29 recognitionLocaleIdentifier];
        int v31 = (void *)[v22 copy];
        [v6 adjustCapsAndSpacingUsingLeadingText:v33 localeIdentifier:v30 vocabularyEntries:v31 spellingGuessesBlock:&__block_literal_global_29];
      }
    }
    v32 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v32 insertDictatedAttributedString:v6];
  }
}

id __49__CACCommandRecognizerDictation_handleDictation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = IMKIronwoodTextAlternativeCorrectedKey_block_invoke_textCheckerInialize;
  id v9 = a5;
  id v10 = a4;
  if (v8 != -1) {
    dispatch_once(&IMKIronwoodTextAlternativeCorrectedKey_block_invoke_textCheckerInialize, &__block_literal_global_48);
  }
  v11 = objc_msgSend((id)IMKIronwoodTextAlternativeCorrectedKey_block_invoke_sChecker, "guessesForWordRange:inString:language:", a2, a3, v10, v9);

  return v11;
}

uint64_t __49__CACCommandRecognizerDictation_handleDictation___block_invoke_2()
{
  IMKIronwoodTextAlternativeCorrectedKey_block_invoke_sChecker = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)_attributedStringFromResult:(__RXLanguageObject *)a3
{
  int v5 = objc_opt_new();
  if ([(CACCommandRecognizerDictation *)self _adLibLanguageObjectFromLanguageModel:a3])
  {
    id v6 = +[CACSpeechSystem speechSystem];
    CFLocaleRef v7 = CFLocaleCreate(0, (CFLocaleIdentifier)[v6 recognitionLocaleIdentifier]);

    uint64_t v8 = (void *)RXObjectCopyPropertyWithLocale();
    if (v8)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
      [v5 appendAttributedString:v9];
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  return v5;
}

- (__RXLanguageObject)_adLibLanguageObjectFromLanguageModel:(__RXLanguageObject *)a3
{
  id v3 = a3;
  if (a3 && RXLanguageObjectGetType() != 4)
  {
    uint64_t Count = RXLanguageObjectGetCount();
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v6 = Count;
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = [(CACCommandRecognizerDictation *)self _adLibLanguageObjectFromLanguageModel:RXLanguageObjectGetObjectAtIndex()];
        if (v8) {
          break;
        }
        if (v6 == ++v7) {
          return 0;
        }
      }
      return v8;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)handleDictation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "Ignoring text, regular dictation is in use.", v1, 2u);
}

@end