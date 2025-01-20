@interface SRCSCommandRecognitionSystem
- (NSArray)recognizers;
- (NSArray)targetTypes;
- (NSString)localeIdentifier;
- (SRCSCommandRecognitionSystem)initWithLocaleIdentifier:(id)a3;
- (id)languageModelTreeForBuiltInLMIdentifier:(id)a3;
- (id)spokenCommandFromRecognizedAFSpeechPhrases:(id)a3;
- (id)spokenCommandFromRecognizedEARTokenSausage:(__CFArray *)a3;
- (void)_initalizeLanguageModelTree;
- (void)_testWithPhrases:(id)a3;
- (void)addRecognizer:(id)a3;
@end

@implementation SRCSCommandRecognitionSystem

- (SRCSCommandRecognitionSystem)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SRCSCommandRecognitionSystem;
  v6 = [(SRCSCommandRecognitionSystem *)&v14 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    recognizers = v6->_recognizers;
    v6->_recognizers = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
    uint64_t v9 = +[SRCSCommandStringsTable activeTargetTypes];
    targetTypes = v6->_targetTypes;
    v6->_targetTypes = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    resolvedBuiltInIdentifiers = v6->_resolvedBuiltInIdentifiers;
    v6->_resolvedBuiltInIdentifiers = (NSMutableDictionary *)v11;

    [(SRCSCommandRecognitionSystem *)v6 _initalizeLanguageModelTree];
    if (initWithLocaleIdentifier__staticInitialization != -1) {
      dispatch_once(&initWithLocaleIdentifier__staticInitialization, &__block_literal_global_3);
    }
  }

  return v6;
}

- (void)addRecognizer:(id)a3
{
}

- (id)spokenCommandFromRecognizedEARTokenSausage:(__CFArray *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v19 = self;
  id v5 = self->_recognizers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v11 = [v10 spokenCommands];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v23 + 1) + 8 * v15) fstGrammar];
              if (v16) {
                [v4 addObject:v16];
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  v17 = [[CMDPResult alloc] initWithTokenSausage:a3 forLocaleIdentifier:v19->_localeIdentifier];
  int v21 = -1082130432;
  int v22 = -1;
  [(CMDPResult *)v17 matchWithGrammars:v4 winningIndex:&v22 winningDistance:&v21];

  return 0;
}

- (id)spokenCommandFromRecognizedAFSpeechPhrases:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v46 = a3;
  v4 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v53 = self;
  id v5 = self->_recognizers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v74 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        uint64_t v11 = [v10 spokenCommands];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v70 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v69 + 1) + 8 * j) fstGrammar];
              if (v16) {
                [v4 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v7);
  }

  v17 = [[CMDPResult alloc] initWithAFSpeechPhraseArray:v46 forLocaleIdentifier:v53->_localeIdentifier];
  int v68 = -1;
  int v67 = -1082130432;
  v45 = v17;
  v18 = [(CMDPResult *)v17 matchWithGrammars:v4 winningIndex:&v68 winningDistance:&v67];
  v19 = v18;
  if (v18)
  {
    v20 = [v18 objectForKey:kCMDPMatchedCommandIdentifier[0]];
    if (v20)
    {
      v49 = v19;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      obuint64_t j = v53->_recognizers;
      uint64_t v51 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v81 count:16];
      int v21 = 0;
      if (v51)
      {
        uint64_t v50 = *(void *)v64;
        v48 = v20;
        do
        {
          for (uint64_t k = 0; k != v51; ++k)
          {
            if (*(void *)v64 != v50) {
              objc_enumerationMutation(obj);
            }
            long long v23 = *(void **)(*((void *)&v63 + 1) + 8 * k);
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v54 = [v23 spokenCommands];
            uint64_t v24 = [v54 countByEnumeratingWithState:&v59 objects:v80 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v60;
              while (2)
              {
                for (uint64_t m = 0; m != v25; ++m)
                {
                  if (*(void *)v60 != v26) {
                    objc_enumerationMutation(v54);
                  }
                  long long v28 = *(void **)(*((void *)&v59 + 1) + 8 * m);
                  long long v29 = [v28 identifier];
                  int v30 = [v29 isEqualToString:v20];

                  if (v30)
                  {
                    uint64_t v52 = k;
                    id v31 = v28;

                    v32 = objc_opt_new();
                    long long v55 = 0u;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v58 = 0u;
                    uint64_t v33 = [v49 objectForKey:kCMDPMatchedElements[0]];
                    uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v79 count:16];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v56;
                      do
                      {
                        for (uint64_t n = 0; n != v35; ++n)
                        {
                          if (*(void *)v56 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          v38 = *(void **)(*((void *)&v55 + 1) + 8 * n);
                          v39 = [v38 objectForKey:kCMDPMatchedElementCategoryIdentifier];
                          if (v39)
                          {
                            uint64_t v40 = [v38 objectForKey:kCMDPMatchedElementText[0]];
                            v41 = (void *)v40;
                            if (v40)
                            {
                              v77 = kSRCSCommandParameterText;
                              uint64_t v78 = v40;
                              v42 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
                              [v32 setObject:v42 forKey:v39];
                            }
                            [v31 setRecognizedParameters:v32];
                          }
                        }
                        uint64_t v35 = [v33 countByEnumeratingWithState:&v55 objects:v79 count:16];
                      }
                      while (v35);
                    }

                    int v21 = v31;
                    v20 = v48;
                    uint64_t k = v52;
                    goto LABEL_45;
                  }
                }
                uint64_t v25 = [v54 countByEnumeratingWithState:&v59 objects:v80 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }
LABEL_45:
          }
          uint64_t v51 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v81 count:16];
        }
        while (v51);
      }

      v19 = v49;
    }
    else
    {
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 0;
  }
  id v43 = v21;

  return v43;
}

- (id)languageModelTreeForBuiltInLMIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_resolvedBuiltInIdentifiers objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_initalizeLanguageModelTree
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setObject:kSRCSCommandParameterTextSegmentCardinalNumber[0] forKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
  id v4 = [NSNumber numberWithInt:1];
  [v3 setObject:v4 forKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];

  id v5 = objc_opt_new();
  [v3 setObject:v5 forKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  for (uint64_t i = 2; i != 201; ++i)
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", i);
    id v8 = objc_alloc(NSDictionary);
    uint64_t v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v7, kSRCSCommandParseDictionaryKeyText[0], 0);
    [v5 addObject:v9];
  }
  v10 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v10);
  [(NSMutableDictionary *)self->_resolvedBuiltInIdentifiers setObject:v3 forKey:kSRCSCommandParameterTextSegmentCardinalNumber[0]];
  objc_sync_exit(v10);

  uint64_t v11 = objc_opt_new();
  [v11 setObject:kSRCSCommandParameterDeviceName[0] forKeyedSubscript:kSRCSCommandParseDictionaryKeyIdentifier[0]];
  [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
  uint64_t v12 = objc_opt_new();
  [v11 setObject:v12 forKeyedSubscript:kSRCSCommandParseDictionaryKeyChildren[0]];
  uint64_t v13 = +[SRCSCommandStringsTable deviceName];
  v32 = kSRCSCommandParseDictionaryKeyText[0];
  v33[0] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  [v12 addObject:v14];

  uint64_t v15 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v15);
  [(NSMutableDictionary *)self->_resolvedBuiltInIdentifiers setObject:v11 forKey:kSRCSCommandParameterDeviceName[0]];
  objc_sync_exit(v15);

  v16 = objc_opt_new();
  [v16 setObject:kSRCSCommandParameterNumberTwoThroughNinetyNine[0] forKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
  v17 = [NSNumber numberWithInt:1];
  [v16 setObject:v17 forKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];

  v18 = objc_opt_new();
  [v16 setObject:v18 forKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  for (uint64_t j = 2; j != 100; ++j)
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", j);
    id v21 = objc_alloc(NSDictionary);
    int v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v20, kSRCSCommandParseDictionaryKeyText[0], 0);
    [v18 addObject:v22];
  }
  long long v23 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v23);
  [(NSMutableDictionary *)self->_resolvedBuiltInIdentifiers setObject:v16 forKey:kSRCSCommandParameterNumberTwoThroughNinetyNine[0]];
  objc_sync_exit(v23);

  uint64_t v24 = objc_opt_new();
  [v24 setObject:kSRCSCommandParameterNumberTwoThroughNinetyNine2[0] forKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
  uint64_t v25 = [NSNumber numberWithInt:1];
  [v24 setObject:v25 forKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];

  uint64_t v26 = objc_opt_new();
  [v24 setObject:v26 forKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  for (uint64_t k = 2; k != 100; ++k)
  {
    long long v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", k);
    id v29 = objc_alloc(NSDictionary);
    int v30 = objc_msgSend(v29, "initWithObjectsAndKeys:", v28, kSRCSCommandParseDictionaryKeyText[0], 0);
    [v26 addObject:v30];
  }
  id v31 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v31);
  [(NSMutableDictionary *)self->_resolvedBuiltInIdentifiers setObject:v24 forKey:kSRCSCommandParameterNumberTwoThroughNinetyNine2[0]];
  objc_sync_exit(v31);
}

- (void)_testWithPhrases:(id)a3
{
  id v3 = a3;
  uint64_t v14 = [[SRCSCommandRecognitionSystem alloc] initWithLocaleIdentifier:@"en-US"];
  id v4 = [[SRCSCommandRecognizer alloc] initWithCommandRecognitionSystem:v14 commandIdentifiers:&unk_26EE31B68];
  [(SRCSCommandRecognizer *)v4 setActive:1];
  id v5 = [(SRCSCommandRecognitionSystem *)v14 spokenCommandFromRecognizedAFSpeechPhrases:v3];

  if (v5)
  {
    uint64_t v6 = [v5 identifier];
    int v7 = [v6 isEqualToString:@"Text.ChangePhrase"];

    if (v7)
    {
      id v8 = [v5 recognizedParameters];
      uint64_t v9 = [v8 objectForKey:kSRCSCommandParameterDictation[0]];
      v10 = [v9 objectForKey:kSRCSCommandParameterText];

      uint64_t v11 = [v5 recognizedParameters];
      uint64_t v12 = [v11 objectForKey:kSRCSCommandParameterDictation2[0]];
      uint64_t v13 = [v12 objectForKey:kSRCSCommandParameterText];

      NSLog(&stru_26EE30418.isa, v10, v13);
    }
    else
    {
      v10 = [v5 identifier];
      [v10 isEqualToString:@"Text.SelectNextWord"];
    }
  }
}

- (NSArray)targetTypes
{
  return self->_targetTypes;
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)recognizers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedBuiltInIdentifiers, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_targetTypes, 0);
}

@end