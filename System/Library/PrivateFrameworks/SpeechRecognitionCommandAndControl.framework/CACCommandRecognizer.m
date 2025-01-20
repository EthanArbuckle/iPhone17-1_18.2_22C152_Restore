@interface CACCommandRecognizer
+ (void)_accumulateCloseMatchUsingCommandIdentifier:(id)a3 substitutionTable:(id)a4;
+ (void)_showHintWithAccumulateCloseMatches;
+ (void)resetCloseMatchAccumulator;
+ (void)suspendCloseMatchAccumulatorForCommand;
- (BOOL)isAppropriateForContext;
- (BOOL)isListening;
- (CACCommandRecognizer)initWithCommands:(id)a3 contextEvaluators:(id)a4 builtInLMIdentifiers:(id)a5;
- (CACSpeechRecognizer)speechRecognizer;
- (NSArray)spokenCommands;
- (NSString)type;
- (id)_commandParametersFromCACLanguageModel:(id)a3;
- (id)commandParametersFromCACLanguageModel:(id)a3;
- (id)commandStrings;
- (id)commandTextSequenceFromCACLanguageModel:(id)a3;
- (id)objectForContextEvaluatorKey:(id)a3;
- (id)owner;
- (void)_buildLanguageModelUsingCommands;
- (void)_synchronizeSpeechRecognizerSettings;
- (void)handleSpokenCommand:(id)a3;
- (void)setOwner:(id)a3;
- (void)setType:(id)a3;
- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4;
- (void)startListening;
- (void)stopListening;
- (void)synchronizeWithReason:(id)a3;
@end

@implementation CACCommandRecognizer

- (CACCommandRecognizer)initWithCommands:(id)a3 contextEvaluators:(id)a4 builtInLMIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(CACCommandRecognizer *)self init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    speechRecognizer = v12->_speechRecognizer;
    v12->_speechRecognizer = (CACSpeechRecognizer *)v13;

    [(CACSpeechRecognizer *)v12->_speechRecognizer setDelegate:v12];
    objc_storeStrong((id *)&v12->_spokenCommandsCache, a3);
    objc_storeStrong((id *)&v12->_contextEvaluators, a4);
    objc_storeStrong((id *)&v12->_builtInLMIdentifiers, a5);
    [(CACCommandRecognizer *)v12 _synchronizeSpeechRecognizerSettings];
    [(CACCommandRecognizer *)v12 _buildLanguageModelUsingCommands];
  }

  return v12;
}

- (void)synchronizeWithReason:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if ([v5 isListening])
  {
    BOOL v6 = [(CACCommandRecognizer *)v4 isAppropriateForContext];

    if (v6)
    {
      [(CACCommandRecognizer *)v4 _synchronizeSpeechRecognizerSettings];
      [(CACCommandRecognizer *)v4 startListening];
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(CACCommandRecognizer *)v4 stopListening];
LABEL_6:
  objc_sync_exit(v4);
}

- (void)_synchronizeSpeechRecognizerSettings
{
  v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 dictationRecognizerMode];

  speechRecognizer = self->_speechRecognizer;
  BOOL v6 = +[CACPreferences sharedPreferences];
  if ([v6 userHintsFeatures])
  {
    id v7 = [(NSDictionary *)self->_contextEvaluators objectForKey:kCACCommandContextPreventCloseMatchResults];
    -[CACSpeechRecognizer setRequestCloseMatchResults:](speechRecognizer, "setRequestCloseMatchResults:", [v7 BOOLValue] ^ 1);
  }
  else
  {
    [(CACSpeechRecognizer *)speechRecognizer setRequestCloseMatchResults:0];
  }

  v8 = self->_speechRecognizer;
  [(CACSpeechRecognizer *)v8 setSpellingMode:v4 == 3];
}

- (void)_buildLanguageModelUsingCommands
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_spokenCommandsCache;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setCommandRecognizer:", self, (void)v11);
        id v10 = [v9 languageModel];
        if (v10) {
          [v3 addChildLanguageModel:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(CACSpeechRecognizer *)self->_speechRecognizer setLanguageModel:v3];
}

- (BOOL)isAppropriateForContext
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v4 = [v3 forceAllCommandsToBeActive];

  if (v4) {
    return 1;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(NSDictionary *)self->_contextEvaluators allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [(NSDictionary *)self->_contextEvaluators objectForKey:v11];
        LODWORD(v11) = +[CACSpokenCommandManager doesEvaluatorKey:v11 matchValue:v12];

        if (!v11)
        {
          BOOL v5 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v13 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if ([v13 currentInteractionLevel])
  {
    long long v14 = [(NSDictionary *)self->_contextEvaluators objectForKey:kCACCommandContextRequiresInteractionLevel];
    if (!v14)
    {
      v17 = [(NSDictionary *)self->_contextEvaluators objectForKey:kCACCommandContextSupportsInteractionLevel];

      if (!v17) {
        return 0;
      }
      goto LABEL_15;
    }
  }
LABEL_15:
  uint64_t v6 = +[CACDisplayManager sharedManager];
  if ([v6 carPlayConnected])
  {
    v15 = [(NSDictionary *)self->_contextEvaluators objectForKey:kCACCommandContextSupportsCarPlay];
    BOOL v5 = v15 != 0;
  }
  else
  {
    BOOL v5 = 1;
  }
LABEL_19:

  return v5;
}

- (void)startListening
{
  id v2 = [(CACCommandRecognizer *)self speechRecognizer];
  [v2 startListening];
}

- (void)stopListening
{
  id v2 = [(CACCommandRecognizer *)self speechRecognizer];
  [v2 stopListening];
}

- (BOOL)isListening
{
  return [(CACSpeechRecognizer *)self->_speechRecognizer isListening];
}

- (void)handleSpokenCommand:(id)a3
{
  id v3 = a3;
  char v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CACCommandRecognizer handleSpokenCommand:](v3, v4);
  }
}

- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 && RXLanguageObjectGetCount() == 1)
  {
    uint64_t ObjectAtIndex = RXLanguageObjectGetObjectAtIndex();
    uint64_t v8 = +[CACSpeechSystem speechSystem];
    uint64_t v9 = [v8 resultLanguageModelFromRXLanguageObject:ObjectAtIndex];

    int Type = RXLanguageObjectGetType();
    if (Type != 6)
    {
      if (Type == 5)
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v11 = self->_spokenCommandsCache;
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v87 objects:v92 count:16];
        if (!v12) {
          goto LABEL_52;
        }
        uint64_t v13 = v12;
        id v72 = v6;
        uint64_t v14 = *(void *)v88;
LABEL_7:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v88 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v87 + 1) + 8 * v15);
          v17 = [v16 identifier];
          long long v18 = [v9 identifier];
          int v19 = [v17 isEqualToString:v18];

          if (v19) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v87 objects:v92 count:16];
            if (v13) {
              goto LABEL_7;
            }
            id v6 = v72;
            goto LABEL_52;
          }
        }
        v47 = v11;
        v48 = v9;
        v49 = [(CACCommandRecognizer *)self commandParametersFromCACLanguageModel:v9];
        [v16 setRecognizedParameters:v49];

        v50 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v50 stopAnyRepeatingSpokenCommand];

        v51 = +[CACRecordedUserActionManager sharedManager];
        [v51 cancelExecution];

        v52 = +[CACPreferences sharedPreferences];
        v53 = [v16 identifier];
        if ([v52 isConfirmationRequiredForCommandIdentifier:v53])
        {
          v54 = +[CACDisplayManager sharedManager];
          if (([v54 isDisplayingConfirmationModalAlert] & 1) == 0)
          {
            v55 = +[CACRecordedUserActionManager sharedManager];
            if (([v55 isRecording] & 1) == 0)
            {
              v56 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
              v57 = [v56 commandRecognitionLogPath];
              if (!v57)
              {
                v80 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                char v82 = [v80 usingAutomationMode];

                if ((v82 & 1) == 0)
                {
                  v58 = [v16 recognizedParameters];
                  v59 = +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:v58 variantOverrides:0];
                  v45 = [v59 string];

                  v60 = NSString;
                  v61 = +[CACLocaleUtilities localizedUIStringForKey:@"ConfirmationAlertDescription.CommandStringFormat"];
                  v62 = [v60 stringWithValidatedFormat:v61, @"%@", 0, v45 validFormatSpecifiers error];

                  v63 = +[CACDisplayManager sharedManager];
                  v64 = +[CACLocaleUtilities localizedUIStringForKey:@"ConfirmationAlertTitle.ExecuteThisCommand"];
                  v65 = +[CACLocaleUtilities localizedUIStringForKey:@"ConfirmationAlertButton.Execute"];
                  v66 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
                  v67 = (void *)[v16 copy];
                  [v63 presentModalAlertWithTitle:v64 description:v62 okButtonText:v65 cancelButtonText:v66 object:v67 okButtonHandler:&__block_literal_global_19];

                  goto LABEL_50;
                }
LABEL_49:
                v45 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                [v45 handleRecognizedCommand:v16];
LABEL_50:
                id v6 = v72;
                uint64_t v9 = v48;
                uint64_t v11 = v47;
                goto LABEL_51;
              }
            }
          }
        }
        goto LABEL_49;
      }
      goto LABEL_53;
    }
    uint64_t v11 = +[CACPreferences sharedPreferences];
    if ([(CACCommandRecognizer *)self isListening]
      && ([(NSArray *)v11 userHintsFeatures] & 1) != 0)
    {
      id v73 = v6;
      v68 = [(NSArray *)v11 bestLocaleIdentifier];
      long long v20 = -[NSArray builtInCommandsStringsTableForLocaleIdentifier:](v11, "builtInCommandsStringsTableForLocaleIdentifier:");
      v74 = objc_opt_new();
      v76 = (void *)RXObjectCopyProperty();
      uint64_t v75 = [v76 count];
      unint64_t v21 = 0x264D10000uLL;
      if (v75 >= 1)
      {
        uint64_t v22 = 0;
        uint64_t v23 = (void *)MEMORY[0x263F78C38];
        v70 = v11;
        v71 = v9;
        v69 = self;
        while (1)
        {
          uint64_t v77 = v22;
          objc_msgSend(v76, "objectAtIndex:");
          uint64_t v24 = RXLanguageObjectGetObjectAtIndex();
          v25 = [*(id *)(v21 + 3368) speechSystem];
          v26 = [v25 resultLanguageModelFromRXLanguageObject:v24];

          v81 = objc_opt_new();
          v27 = [(CACCommandRecognizer *)self commandParametersFromCACLanguageModel:v26];
          id v28 = objc_alloc(MEMORY[0x263F089D8]);
          v78 = v26;
          v29 = [v26 identifier];
          v30 = (void *)[v28 initWithString:v29];

          if (![v30 length] || (objc_msgSend(&unk_26EB4D088, "containsObject:", v30) & 1) != 0) {
            goto LABEL_38;
          }
          v79 = v30;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          v31 = [v27 allKeys];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v83 objects:v91 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v84 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                if (([v36 isEqualToString:*v23] & 1) != 0
                  || [v36 isEqualToString:*MEMORY[0x263F78C58]])
                {
                  v37 = [v27 objectForKey:v36];
                  v38 = [v37 objectForKey:kCACCommandParameterText];

                  v39 = [v20 objectForKey:v36];
                  if ([v38 length] && objc_msgSend(v39, "length"))
                  {
                    v40 = [NSString stringWithFormat:@"<%@>", v39];
                    [v81 setObject:v38 forKey:v40];

                    [v79 appendFormat:@"_%@", v38];
                  }
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v83 objects:v91 count:16];
            }
            while (v33);
          }

          v41 = [v78 identifier];
          if ([v74 containsObject:v41]) {
            break;
          }
          v42 = +[CACUserHintsManager sharedManager];
          v30 = v79;
          int v43 = [v42 shouldDisplayUserHintAfterRegisteringIdentifier:v79];

          uint64_t v11 = v70;
          uint64_t v9 = v71;
          self = v69;
          unint64_t v21 = 0x264D10000;
          if (v43)
          {
            v44 = [v78 identifier];
            +[CACCommandRecognizer _accumulateCloseMatchUsingCommandIdentifier:v44 substitutionTable:v81];

            v30 = v79;
            v41 = [v78 identifier];
            [v74 addObject:v41];
            goto LABEL_37;
          }
LABEL_38:

          uint64_t v22 = v77 + 1;
          if (v77 + 1 == v75) {
            goto LABEL_39;
          }
        }
        uint64_t v11 = v70;
        uint64_t v9 = v71;
        self = v69;
        v30 = v79;
LABEL_37:

        unint64_t v21 = 0x264D10000;
        goto LABEL_38;
      }
LABEL_39:

      id v6 = v73;
    }
    v45 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    v46 = [(CACCommandRecognizer *)self speechRecognizer];
    [v45 registerSignPostEndProcessingForSpeechRecognizer:v46 message:@"Close Result."];

LABEL_51:
LABEL_52:

LABEL_53:
  }
}

void __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke_2;
  block[3] = &unk_264D115D0;
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke_2(uint64_t a1)
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 handleRecognizedCommand:*(void *)(a1 + 32)];
}

- (id)commandParametersFromCACLanguageModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CACCommandRecognizer *)self _commandParametersFromCACLanguageModel:v4];
  id v6 = [(CACCommandRecognizer *)self commandTextSequenceFromCACLanguageModel:v4];

  [v5 setObject:v6 forKey:kCACCommandParameterTextSequence];
  uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v8 = [v7 dictationRecognizerMode];

  if (v8 == 3) {
    [v5 setObject:&unk_26EB4CF18 forKey:@"SRCSClientDictationRecognizerModeIsSpelling"];
  }

  return v5;
}

- (id)_commandParametersFromCACLanguageModel:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v6 = [v4 text];
  if ([v6 length]) {
    [v5 setObject:v6 forKey:kCACCommandParameterText];
  }
  id v28 = v6;
  uint64_t v7 = [v4 attributes];
  int v8 = [v7 objectForKey:kCACLanguageModelAttributeTextVariants];

  if (v8)
  {
    uint64_t v9 = [v4 attributes];
    id v10 = [v9 objectForKey:kCACLanguageModelAttributeTextVariants];
    [v5 setObject:v10 forKey:kCACCommandParameterTextVariants];
  }
  uint64_t v11 = [v4 attributes];
  uint64_t v12 = [v11 objectForKey:kCACLanguageModelAttributeCommandParameters];

  if ([v12 count]) {
    [v5 addEntriesFromDictionary:v12];
  }
  v27 = v12;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v29 = v4;
  uint64_t v13 = [v4 children];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v19 = [(CACCommandRecognizer *)self _commandParametersFromCACLanguageModel:v18];
        long long v20 = [v18 identifier];
        if ([v19 count])
        {
          if ([v20 length])
          {
            [v5 setObject:v19 forKey:v20];
          }
          else
          {
            unint64_t v21 = [v5 objectForKey:kCACCommandParameterText];

            if (v21) {
              [v19 removeObjectForKey:kCACCommandParameterText];
            }
            [v5 addEntriesFromDictionary:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  uint64_t v22 = [v29 attributes];
  uint64_t v23 = [v22 objectForKey:kCACLanguageModelAttributeProxyIdentifier];

  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x263F78C28];
    v25 = [v5 objectForKey:*MEMORY[0x263F78C28]];
    if (v25)
    {
      [v5 setObject:v25 forKey:*MEMORY[0x263F78C30]];
      [v5 removeObjectForKey:*v24];
    }
  }
  return v5;
}

- (id)commandTextSequenceFromCACLanguageModel:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [v4 text];
  if ([v7 length]) {
    [v6 setObject:v7 forKey:kCACCommandParameterText];
  }
  int v8 = [v4 attributes];
  uint64_t v9 = [v8 objectForKey:kCACLanguageModelAttributeTextVariants];

  if (v9)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    if ([v7 length])
    {
      long long v32 = v6;
      [v10 addObject:v7];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v11 = [v4 attributes];
      uint64_t v12 = [v11 objectForKey:kCACLanguageModelAttributeTextVariants];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (([v17 isEqualToString:v7] & 1) == 0) {
              [v10 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v14);
      }

      id v6 = v32;
      [v32 setObject:v10 forKey:kCACCommandParameterTextVariants];
    }
    else
    {
      long long v18 = [v4 attributes];
      int v19 = [v18 objectForKey:kCACLanguageModelAttributeTextVariants];
      [v6 setObject:v19 forKey:kCACCommandParameterTextVariants];
    }
  }
  long long v20 = [v4 identifier];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    uint64_t v22 = [v4 identifier];
    [v6 setObject:v22 forKey:kCACCommandParameterBuiltInIdentifier];
  }
  uint64_t v23 = [v4 children];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = [v4 children];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [(CACCommandRecognizer *)self commandTextSequenceFromCACLanguageModel:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          [v5 addObjectsFromArray:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v27);
    }
  }
  else
  {
    [v5 addObject:v6];
  }

  return v5;
}

- (id)commandStrings
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_spokenCommandsCache;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "strings", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)objectForContextEvaluatorKey:(id)a3
{
  return [(NSDictionary *)self->_contextEvaluators objectForKey:a3];
}

+ (void)_accumulateCloseMatchUsingCommandIdentifier:(id)a3 substitutionTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_opt_class();
  objc_sync_enter(v8);
  if (gAccumulatedCloseMatchesForDisplay)
  {
    [(id)gAccumulatedCloseMatchesForDisplay setObject:v7 forKey:v6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__CACCommandRecognizer__accumulateCloseMatchUsingCommandIdentifier_substitutionTable___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_sync_exit(v8);
}

uint64_t __86__CACCommandRecognizer__accumulateCloseMatchUsingCommandIdentifier_substitutionTable___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__showHintWithAccumulateCloseMatches object:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel__showHintWithAccumulateCloseMatches withObject:0 afterDelay:0.25];
}

+ (void)resetCloseMatchAccumulator
{
  objc_opt_class();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v2 = objc_opt_new();
  dispatch_time_t v3 = (void *)gAccumulatedCloseMatchesForDisplay;
  gAccumulatedCloseMatchesForDisplay = v2;

  objc_sync_exit(obj);
}

+ (void)suspendCloseMatchAccumulatorForCommand
{
  objc_opt_class();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__showHintWithAccumulateCloseMatches object:0];
  dispatch_time_t v3 = (void *)gAccumulatedCloseMatchesForDisplay;
  gAccumulatedCloseMatchesForDisplay = 0;

  objc_sync_exit(obj);
}

+ (void)_showHintWithAccumulateCloseMatches
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  objc_opt_class();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if ([(id)gAccumulatedCloseMatchesForDisplay count])
  {
    long long v34 = objc_opt_new();
    uint64_t v2 = +[CACPreferences sharedPreferences];
    dispatch_time_t v3 = [v2 builtInCommandsTable];
    id v4 = [v3 objectForKey:@"HistoricalCommandFrequencies"];

    uint64_t v5 = [(id)gAccumulatedCloseMatchesForDisplay allKeys];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke;
    v46[3] = &unk_264D11A90;
    id v31 = v4;
    id v47 = v31;
    id v6 = [v5 sortedArrayUsingComparator:v46];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v6;
    uint64_t v7 = [v33 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v7)
    {
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v9 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          id v10 = [(id)gAccumulatedCloseMatchesForDisplay objectForKey:v9];
          id v11 = objc_alloc(MEMORY[0x263F089D8]);
          long long v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          long long v13 = [v12 primaryStringForCommandIdentifier:v9];
          long long v14 = (void *)[v11 initWithString:v13];

          if ([v14 length])
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v15 = [v10 allKeys];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v39;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v39 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * j);
                  long long v20 = [v10 objectForKey:v19];
                  objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", v19, v20, 0, 0, objc_msgSend(v14, "length"));
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
              }
              while (v16);
            }

            [v34 addObject:v14];
          }
        }
        uint64_t v7 = [v33 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v7);
    }

    uint64_t v21 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v21 lastDictationInsertionTimeStamp];
    double v23 = v22;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    BOOL v25 = v23 + 1.0 > v24;

    if (v25) {
      int64_t v26 = 1000000000;
    }
    else {
      int64_t v26 = 10000;
    }
    dispatch_time_t v27 = dispatch_time(0, v26);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_2;
    block[3] = &unk_264D115D0;
    id v28 = v34;
    id v37 = v28;
    dispatch_after(v27, MEMORY[0x263EF83A0], block);
    v29 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    long long v30 = [(id)gAccumulatedCloseMatchesForDisplay allKeys];
    [v29 didFindCloseSpokenCommandIdentifiers:v30];
  }
  objc_sync_exit(obj);
}

uint64_t __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  [v7 floatValue];
  float v9 = v8;

  id v10 = [*(id *)(a1 + 32) objectForKey:v6];

  [v10 floatValue];
  float v12 = v11;

  if (v9 >= v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = -1;
  }
  if (v9 > v12) {
    return 1;
  }
  else {
    return v13;
  }
}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((unint64_t)[*(id *)(a1 + 32) count] < 2)
  {
    id obja = +[CACDisplayManager sharedManager];
    uint64_t v15 = NSString;
    uint64_t v16 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ClosestMatchingCommand"];
    uint64_t v17 = [*(id *)(a1 + 32) firstObject];
    long long v18 = [v15 stringWithValidatedFormat:v16, @"%@", 0, v17 validFormatSpecifiers error];
    [obja displayMessageString:v18 type:4 announcementCompletion:&__block_literal_global_340];
  }
  else
  {
    uint64_t v2 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          float v8 = NSString;
          float v9 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ClosestMatchingMultipleCommandEntry"];
          id v10 = [v8 stringWithValidatedFormat:v9, @"%@", 0, v7 validFormatSpecifiers error];
          [v2 appendString:v10];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v4);
    }

    float v11 = NSString;
    float v12 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ClosestMatchingMultipleCommands"];
    uint64_t v13 = [v11 stringWithValidatedFormat:v12, @"%@", 0, v2 validFormatSpecifiers error];

    long long v14 = +[CACDisplayManager sharedManager];
    [v14 displayMessageString:v13 type:4 announcementCompletion:&__block_literal_global_335_0];
  }
}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_3()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_4()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setType:(id)a3
{
}

- (id)owner
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOwner:(id)a3
{
}

- (CACSpeechRecognizer)speechRecognizer
{
  return (CACSpeechRecognizer *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)spokenCommands
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtInLMIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextEvaluators, 0);
  objc_storeStrong((id *)&self->_spokenCommandsCache, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)handleSpokenCommand:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unsupported command action handler: %@", (uint8_t *)&v4, 0xCu);
}

@end