@interface SLBertClassifier
- (BOOL)_isCharPunctuation:(unsigned __int16)a3;
- (BOOL)shouldAppendLeadingText;
- (MLModel)bertModel;
- (NSArray)truncationTokenList;
- (NSArray)vocab;
- (NSString)assetVersion;
- (NSString)outputNodeName;
- (NSString)unkToken;
- (SLBertClassifier)initWithConfig:(id)a3 error:(id *)a4 locale:(id)a5;
- (id)_createInputIdsAndRunModel:(id)a3;
- (id)_normalizeText:(id)a3;
- (id)_splitOnPunctuation:(id)a3;
- (id)_wordPieceTokenizer:(id)a3;
- (id)processInputText:(id)a3;
- (id)processSpeechPackage:(id)a3;
- (unint64_t)maxInputCharsPerWord;
- (unint64_t)maxNumTokens;
- (unint64_t)numLeadingTokens;
- (void)_readVocabFromFile:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setBertModel:(id)a3;
- (void)setMaxInputCharsPerWord:(unint64_t)a3;
- (void)setMaxNumTokens:(unint64_t)a3;
- (void)setNumLeadingTokens:(unint64_t)a3;
- (void)setOutputNodeName:(id)a3;
- (void)setShouldAppendLeadingText:(BOOL)a3;
- (void)setTruncationTokenList:(id)a3;
- (void)setUnkToken:(id)a3;
- (void)setVocab:(id)a3;
@end

@implementation SLBertClassifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationTokenList, 0);
  objc_storeStrong((id *)&self->_outputNodeName, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_bertModel, 0);
  objc_storeStrong((id *)&self->_unkToken, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
}

- (void)setTruncationTokenList:(id)a3
{
}

- (NSArray)truncationTokenList
{
  return self->_truncationTokenList;
}

- (void)setOutputNodeName:(id)a3
{
}

- (NSString)outputNodeName
{
  return self->_outputNodeName;
}

- (void)setNumLeadingTokens:(unint64_t)a3
{
  self->_numLeadingTokens = a3;
}

- (unint64_t)numLeadingTokens
{
  return self->_numLeadingTokens;
}

- (void)setShouldAppendLeadingText:(BOOL)a3
{
  self->_shouldAppendLeadingText = a3;
}

- (BOOL)shouldAppendLeadingText
{
  return self->_shouldAppendLeadingText;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setBertModel:(id)a3
{
}

- (MLModel)bertModel
{
  return self->_bertModel;
}

- (void)setMaxNumTokens:(unint64_t)a3
{
  self->_maxNumTokens = a3;
}

- (unint64_t)maxNumTokens
{
  return self->_maxNumTokens;
}

- (void)setMaxInputCharsPerWord:(unint64_t)a3
{
  self->_maxInputCharsPerWord = a3;
}

- (unint64_t)maxInputCharsPerWord
{
  return self->_maxInputCharsPerWord;
}

- (void)setUnkToken:(id)a3
{
}

- (NSString)unkToken
{
  return self->_unkToken;
}

- (void)setVocab:(id)a3
{
}

- (NSArray)vocab
{
  return self->_vocab;
}

- (id)_wordPieceTokenizer:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  [v5 addObject:@"[CLS]"];
  if (self->_shouldAppendLeadingText)
  {
    [v5 addObject:@"empty"];
    [v5 addObject:@"[SEP]"];
  }
  v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v21 = v4;
  v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  v8 = [(SLBertClassifier *)self _splitOnPunctuation:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v22 = *(void *)v27;
    v23 = v5;
    do
    {
      uint64_t v12 = 0;
      uint64_t v24 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        if ([v13 length] <= self->_maxInputCharsPerWord)
        {
          v14 = [MEMORY[0x263EFF980] array];
          if ([v13 length])
          {
            unint64_t v15 = 0;
            while (1)
            {
              unint64_t v16 = [v13 length];
              if (v15 >= v16) {
                break;
              }
              unint64_t v17 = v16;
              while (1)
              {
                v18 = objc_msgSend(v13, "substringWithRange:", v15, v17 - v15);
                if (v15)
                {
                  uint64_t v19 = [@"##" stringByAppendingString:v18];

                  v18 = (void *)v19;
                }
                if ([(NSArray *)self->_vocab containsObject:v18]) {
                  break;
                }
                --v17;

                if (v15 >= v17) {
                  goto LABEL_22;
                }
              }
              if (!v18) {
                break;
              }
              [v14 addObject:v18];

              unint64_t v15 = v17;
              if (v17 >= [v13 length]) {
                goto LABEL_21;
              }
            }
LABEL_22:
            v5 = v23;
            [v23 addObject:self->_unkToken];
          }
          else
          {
LABEL_21:
            v5 = v23;
            [v23 addObjectsFromArray:v14];
          }

          uint64_t v11 = v22;
          uint64_t v10 = v24;
        }
        else
        {
          [v5 addObject:self->_unkToken];
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  [v5 addObject:@"[SEP]"];
  return v5;
}

- (id)_splitOnPunctuation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 length])
        {
          uint64_t v11 = 0;
          do
          {
            uint64_t v12 = 0;
            while (1)
            {
              uint64_t v13 = v11 + v12;
              if (-[SLBertClassifier _isCharPunctuation:](self, "_isCharPunctuation:", [v10 characterAtIndex:v11 + v12]))
              {
                break;
              }
              ++v12;
              if (v11 + v12 >= (unint64_t)[v10 length])
              {
                if (v12)
                {
                  unint64_t v16 = objc_msgSend(v10, "substringWithRange:", v11, v12);
                  [v5 addObject:v16];
                }
                goto LABEL_18;
              }
            }
            v14 = objc_msgSend(v10, "substringWithRange:", v11, v12);
            if (v14) {
              [v5 addObject:v14];
            }
            unint64_t v15 = objc_msgSend(v10, "substringWithRange:", v13, 1);
            [v5 addObject:v15];
            uint64_t v11 = v13 + 1;
          }
          while (v13 + 1 < (unint64_t)[v10 length]);
        }
LABEL_18:
        ;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v5;
}

- (BOOL)_isCharPunctuation:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((a3 - 33) >= 0xF
    && ((a3 - 91) > 0x23 || ((1 << (a3 - 91)) & 0xF0000003FLL) == 0))
  {
    return (a3 - 58) < 7;
  }
  return result;
}

- (id)_createInputIdsAndRunModel:(id)a3
{
  v60[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v60[0] = &unk_26D0A24C8;
  v5 = [NSNumber numberWithUnsignedInteger:self->_maxNumTokens];
  v60[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];

  id v53 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:v6 dataType:65568 error:&v53];
  id v8 = v53;
  id v52 = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:v6 dataType:65568 error:&v52];
  id v10 = v52;

  id v51 = v10;
  v42 = (void *)v6;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:v6 dataType:65568 error:&v51];
  id v12 = v51;

  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __47__SLBertClassifier__createInputIdsAndRunModel___block_invoke;
  v46[3] = &unk_2644FFEC0;
  v46[4] = self;
  id v13 = v4;
  id v47 = v13;
  id v14 = v7;
  id v48 = v14;
  id v15 = v11;
  id v49 = v15;
  id v16 = v9;
  id v50 = v16;
  [v13 enumerateObjectsUsingBlock:v46];
  v43 = v13;
  unint64_t v17 = [v13 count];
  if (v17 < self->_maxNumTokens)
  {
    unint64_t v18 = v17;
    do
    {
      long long v19 = [NSNumber numberWithFloat:0.0];
      [v14 setObject:v19 atIndexedSubscript:v18];

      long long v20 = [NSNumber numberWithFloat:0.0];
      [v15 setObject:v20 atIndexedSubscript:v18];

      long long v21 = [NSNumber numberWithFloat:0.0];
      [v16 setObject:v21 atIndexedSubscript:v18];

      ++v18;
    }
    while (v18 < self->_maxNumTokens);
  }
  long long v22 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    __int16 v58 = 2112;
    id v59 = v43;
    _os_log_impl(&dword_21EFF4000, v22, OS_LOG_TYPE_DEFAULT, "%s Tokens: %@", buf, 0x16u);
    long long v22 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    __int16 v58 = 2112;
    id v59 = v14;
    _os_log_impl(&dword_21EFF4000, v22, OS_LOG_TYPE_DEFAULT, "%s inputIds: %@", buf, 0x16u);
    long long v22 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    __int16 v58 = 2112;
    id v59 = v16;
    _os_log_impl(&dword_21EFF4000, v22, OS_LOG_TYPE_DEFAULT, "%s attnMask: %@", buf, 0x16u);
  }
  v23 = [MEMORY[0x263EFF9A0] dictionary];
  [v23 setObject:v14 forKey:@"minibatch_input_ids"];
  [v23 setObject:v16 forKey:@"minibatch_attention_mask"];
  [v23 setObject:v15 forKey:@"minibatch_token_type_ids"];
  id v45 = v12;
  uint64_t v24 = [objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v23 error:&v45];
  id v25 = v45;

  bertModel = self->_bertModel;
  id v44 = v25;
  v40 = (void *)v24;
  long long v27 = [(MLModel *)bertModel predictionFromFeatures:v24 error:&v44];
  id v41 = v44;

  v39 = v27;
  v38 = [v27 featureValueForName:self->_outputNodeName];
  long long v28 = [v38 multiArrayValue];
  long long v29 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    __int16 v58 = 2112;
    id v59 = v28;
    _os_log_impl(&dword_21EFF4000, v29, OS_LOG_TYPE_DEFAULT, "%s output: %@", buf, 0x16u);
  }
  v30 = [v28 convert1dMLMultiArrayToNSArray];
  uint64_t v31 = [v16 convert1dMLMultiArrayToNSArray];
  v32 = [v14 convert1dMLMultiArrayToNSArray];
  [v15 convert1dMLMultiArrayToNSArray];
  v33 = v37 = v28;
  v54[0] = @"outputTokens";
  v54[1] = @"attnMask";
  v55[0] = v43;
  v55[1] = v31;
  v54[2] = @"inputIds";
  v54[3] = @"tokenTypeIds";
  v55[2] = v32;
  v55[3] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
  v35 = [[SLBertClassifierResult alloc] initWithScore:v30 assetVersion:self->_assetVersion extractedFeats:v34];

  return v35;
}

void __47__SLBertClassifier__createInputIdsAndRunModel___block_invoke(void *a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v7 = [*(id *)(a1[4] + 16) indexOfObject:a2];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      long long v26 = "-[SLBertClassifier _createInputIdsAndRunModel:]_block_invoke";
      _os_log_impl(&dword_21EFF4000, v9, OS_LOG_TYPE_DEFAULT, "%s Token not found, using unk token", (uint8_t *)&v25, 0xCu);
    }
    unint64_t v7 = [*(id *)(a1[4] + 16) indexOfObject:*(void *)(a1[4] + 24)];
  }
  uint64_t v10 = a1[4];
  if (*(unsigned char *)(v10 + 8))
  {
    if (*(void *)(v10 + 64) <= a3) {
      float v11 = 1.0;
    }
    else {
      float v11 = 0.0;
    }
  }
  else
  {
    float v11 = 1.0;
  }
  if (*(void *)(v10 + 40) <= a3)
  {
    *a4 = 1;
    long long v20 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = (void *)a1[5];
      long long v22 = v20;
      uint64_t v23 = [v21 count];
      uint64_t v24 = *(void *)(a1[4] + 40);
      int v25 = 136315650;
      long long v26 = "-[SLBertClassifier _createInputIdsAndRunModel:]_block_invoke";
      __int16 v27 = 2048;
      uint64_t v28 = v23;
      __int16 v29 = 2048;
      uint64_t v30 = v24;
      _os_log_impl(&dword_21EFF4000, v22, OS_LOG_TYPE_DEFAULT, "%s Num Tokens - %lu  exceeded model input length - %lu", (uint8_t *)&v25, 0x20u);
    }
  }
  else
  {
    id v12 = (void *)a1[6];
    *(float *)&double v8 = (float)v7;
    id v13 = [NSNumber numberWithFloat:v8];
    [v12 setObject:v13 atIndexedSubscript:a3];

    id v14 = (void *)a1[7];
    *(float *)&double v15 = v11;
    id v16 = [NSNumber numberWithFloat:v15];
    [v14 setObject:v16 atIndexedSubscript:a3];

    unint64_t v17 = (void *)a1[8];
    LODWORD(v18) = 1.0;
    long long v19 = [NSNumber numberWithFloat:v18];
    [v17 setObject:v19 atIndexedSubscript:a3];
  }
}

- (id)_normalizeText:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__529;
  id v13 = __Block_byref_object_dispose__530;
  id v14 = [v4 lowercaseString];
  truncationTokenList = self->_truncationTokenList;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SLBertClassifier__normalizeText___block_invoke;
  v8[3] = &unk_2644FFE98;
  v8[4] = self;
  v8[5] = &v9;
  [(NSArray *)truncationTokenList enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __35__SLBertClassifier__normalizeText___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  unint64_t v6 = [v12 length];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length] > v6)
  {
    unint64_t v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringWithRange:", 0, v6);
    double v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    if (((objc_msgSend(v8, "characterIsMember:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "characterAtIndex:", v6)) & 1) != 0|| objc_msgSend(*(id *)(a1 + 32), "_isCharPunctuation:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "characterAtIndex:", v6)))&& objc_msgSend(v7, "isEqualToString:", v12))
    {
      uint64_t v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringWithRange:", v6, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "length") - v6);
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *a4 = 1;
    }
  }
}

- (void)_readVocabFromFile:(id)a3
{
  id v11 = 0;
  id v4 = [NSString stringWithContentsOfFile:a3 encoding:4 error:&v11];
  id v5 = v11;
  unint64_t v6 = [MEMORY[0x263F08708] newlineCharacterSet];
  unint64_t v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  double v8 = [MEMORY[0x263EFF8C0] array];
  vocab = self->_vocab;
  self->_vocab = v8;

  uint64_t v10 = self->_vocab;
  self->_vocab = v7;
}

- (id)processInputText:(id)a3
{
  id v4 = [(SLBertClassifier *)self _normalizeText:a3];
  id v5 = [(SLBertClassifier *)self _wordPieceTokenizer:v4];
  unint64_t v6 = [(SLBertClassifier *)self _createInputIdsAndRunModel:v5];

  return v6;
}

- (id)processSpeechPackage:(id)a3
{
  id v4 = +[SLASRFeatureExtractor getBestSpeechRecognitionTextFromPackage:a3];
  id v5 = [(SLBertClassifier *)self processInputText:v4];

  return v5;
}

- (SLBertClassifier)initWithConfig:(id)a3 error:(id *)a4 locale:(id)a5
{
  v71[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)SLBertClassifier;
  uint64_t v10 = [(SLBertClassifier *)&v59 init];
  if (!v10) {
    goto LABEL_44;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  id v11 = [MEMORY[0x263F38060] decodeJsonFromFile:v8];
  if (!v11)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Missing config for Bert Classifier %@", 0];
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    v70 = @"reason";
    v71[0] = v23;
    int v25 = [NSDictionary dictionaryWithObjects:v71 forKeys:&v70 count:1];
    id v14 = [v24 errorWithDomain:@"com.apple.sl" code:108 userInfo:v25];

    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }

      goto LABEL_15;
    }
  }
  if ([v9 containsString:@"en"]) {
    goto LABEL_9;
  }
  id v12 = (void *)MEMORY[0x263F087E8];
  v68 = @"reason";
  v69 = @"Non en locales supported yet";
  id v13 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  id v14 = [v12 errorWithDomain:@"com.apple.sl" code:110 userInfo:v13];

  if (!v14)
  {
LABEL_9:
    double v15 = [v8 stringByDeletingLastPathComponent];
    id v16 = [v11 objectForKeyedSubscript:@"vocabFile"];
    uint64_t v17 = [v15 stringByAppendingPathComponent:v16];

    v55 = (void *)v17;
    [(SLBertClassifier *)v10 _readVocabFromFile:v17];
    uint64_t v18 = [v11 objectForKeyedSubscript:@"unkToken"];
    unkToken = v10->_unkToken;
    v10->_unkToken = (NSString *)v18;

    long long v20 = [v11 objectForKeyedSubscript:@"version"];
    if (v20)
    {
      uint64_t v21 = [v11 objectForKeyedSubscript:@"version"];
      assetVersion = v10->_assetVersion;
      v10->_assetVersion = (NSString *)v21;
    }
    else
    {
      assetVersion = v10->_assetVersion;
      v10->_assetVersion = (NSString *)@"default";
    }
    id v56 = v9;

    v10->_numLeadingTokens = 1;
    long long v26 = [v11 objectForKeyedSubscript:@"leadingText"];
    if (v26)
    {
      __int16 v27 = [v11 objectForKeyedSubscript:@"leadingText"];
      v10->_shouldAppendLeadingText = [v27 BOOLValue];
      p_shouldAppendLeadingText = &v10->_shouldAppendLeadingText;
    }
    else
    {
      v10->_shouldAppendLeadingText = 1;
      p_shouldAppendLeadingText = &v10->_shouldAppendLeadingText;
    }

    if (*p_shouldAppendLeadingText) {
      v10->_numLeadingTokens = 3;
    }
    __int16 v29 = [v11 objectForKeyedSubscript:@"outputNodeName"];
    if (v29)
    {
      uint64_t v30 = [v11 objectForKeyedSubscript:@"outputNodeName"];
      p_outputNodeName = &v10->_outputNodeName;
      outputNodeName = v10->_outputNodeName;
      v10->_outputNodeName = (NSString *)v30;
    }
    else
    {
      p_outputNodeName = &v10->_outputNodeName;
      outputNodeName = v10->_outputNodeName;
      v10->_outputNodeName = 0;
    }

    v57 = v15;
    if (!*p_outputNodeName)
    {
      v37 = [NSString stringWithFormat:@"Missing output name for Bert Classifier %@", v11];
      v38 = (void *)MEMORY[0x263F087E8];
      v66 = @"reason";
      v67 = v37;
      v39 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      id v40 = [v38 errorWithDomain:@"com.apple.sl" code:108 userInfo:v39];

      if (v40)
      {
        if (a4)
        {
          id v40 = v40;
          *a4 = v40;
        }
        int v41 = 1;
LABEL_42:
        id v9 = v56;

        if (v41) {
          goto LABEL_43;
        }
LABEL_44:
        id v53 = v10;
        goto LABEL_45;
      }

      double v15 = v57;
    }
    *(_OWORD *)&v10->_maxInputCharsPerWord = xmmword_21F0582A0;
    v33 = [v11 objectForKeyedSubscript:@"truncationList"];
    if (v33)
    {
      uint64_t v34 = [v11 objectForKeyedSubscript:@"truncationList"];
      p_truncationTokenList = &v10->_truncationTokenList;
      truncationTokenList = v10->_truncationTokenList;
      v10->_truncationTokenList = (NSArray *)v34;
    }
    else
    {
      p_truncationTokenList = &v10->_truncationTokenList;
      truncationTokenList = v10->_truncationTokenList;
      v10->_truncationTokenList = (NSArray *)&unk_26D0A2510;
    }

    v42 = [v11 objectForKeyedSubscript:@"modelFile"];
    v37 = [v15 stringByAppendingPathComponent:v42];

    v43 = [NSURL fileURLWithPath:v37];
    id v44 = objc_alloc_init(MEMORY[0x263F00D98]);
    [v44 setComputeUnits:0];
    id v58 = 0;
    uint64_t v45 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v43 configuration:v44 error:&v58];
    id v40 = v58;
    bertModel = v10->_bertModel;
    v10->_bertModel = (MLModel *)v45;

    if (v40)
    {
      if (a4) {
        *a4 = v40;
      }
      int v41 = 1;
    }
    else
    {
      id v47 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        vocab = v10->_vocab;
        id v49 = v47;
        uint64_t v50 = [(NSArray *)vocab count];
        id v51 = v10->_unkToken;
        *(_DWORD *)buf = 136315650;
        v61 = "-[SLBertClassifier initWithConfig:error:locale:]";
        __int16 v62 = 2048;
        uint64_t v63 = v50;
        __int16 v64 = 2112;
        v65 = v51;
        _os_log_impl(&dword_21EFF4000, v49, OS_LOG_TYPE_DEFAULT, "%s VocabList size: %lu UnkToken %@", buf, 0x20u);

        id v47 = SLLogContextFacilityCoreSpeech;
      }
      int v41 = 0;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = (uint64_t)*p_truncationTokenList;
        *(_DWORD *)buf = 136315394;
        v61 = "-[SLBertClassifier initWithConfig:error:locale:]";
        __int16 v62 = 2112;
        uint64_t v63 = v52;
        _os_log_impl(&dword_21EFF4000, v47, OS_LOG_TYPE_DEFAULT, "%s Truncation list: %@", buf, 0x16u);
        int v41 = 0;
      }
    }

    goto LABEL_42;
  }
  if (a4)
  {
    id v14 = v14;
    *a4 = v14;
  }
LABEL_15:

LABEL_43:
  id v53 = 0;
LABEL_45:

  return v53;
}

@end