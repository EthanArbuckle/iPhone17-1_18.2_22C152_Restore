@interface NLPLearnerCharacterLanguageModelingData
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerCharacterLanguageModelingData)initWithLocale:(id)a3;
- (void)addResource:(id)a3;
@end

@implementation NLPLearnerCharacterLanguageModelingData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLogCharLM = (uint64_t)os_log_create("com.apple.NLP", "NLPLearnerCharacterLanguageModelingData");
    MEMORY[0x270F9A758]();
  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 200;
}

- (NLPLearnerCharacterLanguageModelingData)initWithLocale:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLPLearnerCharacterLanguageModelingData;
  v5 = [(NLPLearnerLanguageModelingData *)&v7 initWithLocale:v4];
  if (v5) {
    -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  }

  return v5;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  [(NLPLearnerLanguageModelingData *)self setTokenIDMapPath:v4];
  id v5 = objc_alloc(MEMORY[0x263F2FA78]);
  v6 = [NSURL URLWithString:v4];
  objc_super v7 = (CVNLPTokenIDConverter *)[v5 initWithResource:v6 andTokenType:1];
  tokenConverter = self->_tokenConverter;
  self->_tokenConverter = v7;

  if (!self->_tokenConverter)
  {
    v9 = sLogCharLM;
    if (os_log_type_enabled((os_log_t)sLogCharLM, OS_LOG_TYPE_ERROR)) {
      -[NLPLearnerCharacterLanguageModelingData addResource:]((uint64_t)v4, v9);
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  tokenConverter = self->_tokenConverter;
  id v26 = v6;
  if (tokenConverter)
  {
    objc_super v7 = (id)sLogCharLM;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:](buf, [v26 count], v7);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v26;
    uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v36;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x237DBF310]();
        if (a4 && [(NLPLearnerTextData *)self numSamples] >= a4)
        {
          int v23 = 2;
        }
        else
        {
          v13 = [(NLPLearnerTextData *)self locale];
          v14 = [v13 languageCode];
          v15 = +[NLPLearnerUtils messageContentForEvent:v11 andLanguage:v14];

          if (v15)
          {
            uint64_t v29 = 0;
            v30 = &v29;
            uint64_t v31 = 0x3032000000;
            v32 = __Block_byref_object_copy__51;
            v33 = __Block_byref_object_dispose__52;
            v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CVNLPTokenIDConverter bosTokenID](self->_tokenConverter, "bosTokenID"));
            v39 = v16;
            v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
            id v34 = (id)[v17 mutableCopy];

            v18 = self->_tokenConverter;
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __75__NLPLearnerCharacterLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke;
            v28[3] = &unk_264BEEB80;
            v28[4] = self;
            v28[5] = &v29;
            [(CVNLPTokenIDConverter *)v18 enumerateTokenIDsForText:v15 withBlock:v28];
            unint64_t v19 = [(id)v30[5] count];
            if (v19 < [(NLPLearnerTextData *)self maxSequenceLength])
            {
              v20 = (void *)v30[5];
              v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CVNLPTokenIDConverter eosTokenID](self->_tokenConverter, "eosTokenID"));
              [v20 addObject:v21];

              v22 = [(NLPLearnerTextData *)self sentences];
              [v22 addObject:v30[5]];
            }
            _Block_object_dispose(&v29, 8);

            int v23 = 0;
          }
          else
          {
            int v23 = 3;
          }
        }
        if (v23 != 3)
        {
          if (v23) {
            break;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  return tokenConverter != 0;
}

void __75__NLPLearnerCharacterLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (v6 >= [*(id *)(a1 + 32) maxSequenceLength])
  {
    id v9 = [*(id *)(a1 + 32) sentences];
    objc_super v7 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    [v9 addObject:v7];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeAllObjects];
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = [NSNumber numberWithUnsignedInt:a4];
  objc_msgSend(v8, "addObject:");
}

- (void).cxx_destruct
{
}

- (void)addResource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "Failed to load character tokenization resources from '%@'", (uint8_t *)&v2, 0xCu);
}

@end