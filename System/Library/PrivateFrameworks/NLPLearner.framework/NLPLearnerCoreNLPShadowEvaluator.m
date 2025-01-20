@interface NLPLearnerCoreNLPShadowEvaluator
+ (void)initialize;
- (BOOL)setMaxSequenceLengthForModelURL:(id)a3;
- (id)evaluateModel:(CoreLanguageModelWithState *)a3 onSingleExample:(id)a4 tokenizer:(void *)a5;
- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7;
- (id)modelCreationOptionsForModelURL:(id)a3 options:(id)a4;
- (unint64_t)maxSequenceLength;
- (void)setMaxSequenceLength:(unint64_t)a3;
@end

@implementation NLPLearnerCoreNLPShadowEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_3 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerCoreNLPShadowEvaluator");
    MEMORY[0x270F9A758]();
  }
}

- (id)modelCreationOptionsForModelURL:(id)a3 options:(id)a4
{
  v20[5] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F367F8];
  id v7 = a3;
  uint64_t v8 = [a4 objectForKeyedSubscript:v6];
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x263F36800];
  if (v8) {
    v10 = (void *)v8;
  }
  id v11 = v10;

  v20[0] = v7;
  uint64_t v12 = *MEMORY[0x263F36818];
  v19[0] = @"kCoreLMURLKey";
  v19[1] = v12;
  v13 = [(NLPLearnerShadowEvaluator *)self locale];
  v14 = [v13 languageCode];
  v20[1] = v14;
  v20[2] = v11;
  uint64_t v15 = *MEMORY[0x263F36848];
  v19[2] = v6;
  v19[3] = v15;
  v19[4] = *MEMORY[0x263F36810];
  uint64_t v16 = *MEMORY[0x263F36808];
  v20[3] = *MEMORY[0x263F36840];
  v20[4] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];

  return v17;
}

- (BOOL)setMaxSequenceLengthForModelURL:(id)a3
{
  v4 = NSURL;
  v5 = [a3 path];
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"modelInfo.plist"];
  id v7 = [v4 fileURLWithPath:v6 isDirectory:0];

  id v17 = 0;
  uint64_t v8 = [NSDictionary dictionaryWithContentsOfURL:v7 error:&v17];
  id v9 = v17;
  if (!v8)
  {
    v14 = sLog_3;
    if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR)) {
      [(NLPLearnerCoreNLPShadowEvaluator *)(uint64_t)v7 setMaxSequenceLengthForModelURL:v14];
    }
    goto LABEL_8;
  }
  v10 = [v8 objectForKeyedSubscript:@"MaximumSequenceLength"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v15 = sLog_3;
    if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR)) {
      -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLengthForModelURL:]((uint64_t)v8, v15);
    }
LABEL_8:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = [v8 objectForKeyedSubscript:@"MaximumSequenceLength"];
  -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLength:](self, "setMaxSequenceLength:", [v12 unsignedIntValue]);

  BOOL v13 = 1;
LABEL_9:

  return v13;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  v68[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v40 = a6;
  if (v12)
  {
    uint64_t v15 = [(NLPLearnerShadowEvaluator *)self prepareDataFromRecords:v13];
    if ([v15 numSamples])
    {
      id v62 = 0;
      [(NLPLearnerCoreNLPShadowEvaluator *)self modelCreationOptionsForModelURL:v12 options:v14];
      uint64_t v16 = (const void *)CoreLMCreate();
      if (v16
        && [(NLPLearnerCoreNLPShadowEvaluator *)self setMaxSequenceLengthForModelURL:v12])
      {
        id v17 = [(NLPLearnerShadowEvaluator *)self locale];
        uint64_t v18 = LMStreamTokenizerCreate();

        uint64_t v58 = 0;
        v59 = (float *)&v58;
        uint64_t v60 = 0x2020000000;
        int v61 = 0;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        uint64_t v57 = 0;
        uint64_t v50 = 0;
        v51 = (float *)&v50;
        uint64_t v52 = 0x2020000000;
        int v53 = 0;
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x2020000000;
        uint64_t v49 = 0;
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        uint64_t v45 = 0;
        v19 = [v15 getSamples];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __85__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke;
        v41[3] = &unk_264BEEA70;
        v41[10] = v16;
        v41[11] = v18;
        v41[4] = self;
        v41[5] = &v58;
        v41[6] = &v54;
        v41[7] = &v50;
        v41[8] = &v46;
        v41[9] = &v42;
        [v19 enumerateObjectsUsingBlock:v41];

        CFRelease(v16);
        if (v18) {
          LMStreamTokenizerRelease();
        }
        unint64_t v20 = v55[3];
        float v21 = 0.0;
        long double v22 = 0.0;
        if (v20)
        {
          long double v22 = exp((float)((float)-v59[6] / (float)v20));
          *(float *)&long double v22 = v22;
        }
        unint64_t v23 = v47[3];
        if (v23) {
          float v21 = (float)(v51[6] * 100.0) / (float)v23;
        }
        v63[0] = @"MLPModelTrainerPerplexityKey";
        v24 = [NSNumber numberWithFloat:(double)v22];
        v64[0] = v24;
        v63[1] = @"MLPModelTrainerOverallAccuracyKey";
        *(float *)&double v25 = v21;
        v26 = [NSNumber numberWithFloat:v25];
        v64[1] = v26;
        v63[2] = @"Tokens";
        v27 = [NSNumber numberWithUnsignedInteger:v55[3]];
        v64[2] = v27;
        v63[3] = @"Samples";
        v28 = [NSNumber numberWithUnsignedInteger:v43[3]];
        v64[3] = v28;
        a7 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:4];

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v58, 8);
        goto LABEL_23;
      }
      id v30 = v62;
      v31 = sLog_3;
      if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR)) {
        -[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onRecords:options:completion:error:]((uint64_t)v12, v31);
      }
      if (a7)
      {
        v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v65 = *MEMORY[0x263F08320];
        v33 = NSString;
        v34 = [v62 description];
        v35 = [v33 stringWithFormat:@"error loading core lm model: %@", v34];
        v66 = v35;
        v36 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        *a7 = [v32 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:6 userInfo:v36];
      }
    }
    else
    {
      if (!a7)
      {
LABEL_23:

        goto LABEL_24;
      }
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v67 = *MEMORY[0x263F08320];
      v68[0] = @"missing evaluation data for PFL";
      v38 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
      *a7 = [v37 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:9 userInfo:v38];
    }
    a7 = 0;
    goto LABEL_23;
  }
  v29 = sLog_3;
  if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR)) {
    -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:](v29);
  }
  a7 = 0;
LABEL_24:

  return a7;
}

void __85__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) evaluateModel:*(void *)(a1 + 80) onSingleExample:a2 tokenizer:*(void *)(a1 + 88)];
  [v5 logfProbability];
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3
                                                             + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v5 tokenCount];
  [v5 predictedWords];
  *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4
                                                             + *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v5 wordCount];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v5 sentenceCount];
}

- (id)evaluateModel:(CoreLanguageModelWithState *)a3 onSingleExample:(id)a4 tokenizer:(void *)a5
{
  id v8 = a4;
  id v9 = 0;
  if (a3 && a5)
  {
    if ([(NLPLearnerCoreNLPShadowEvaluator *)self maxSequenceLength])
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      int v33 = 0;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      int v29 = 0;
      uint64_t v22 = 0;
      unint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 0;
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v13[3] = 0;
      strlen((const char *)[v8 UTF8String]);
      LMStreamTokenizerPushBytes();
      id v9 = objc_alloc_init(NLPLearnerEvaluationResultCoreLM);
      LODWORD(v10) = *((_DWORD *)v31 + 6);
      [(NLPLearnerEvaluationResultCoreLM *)v9 setLogfProbability:v10];
      [(NLPLearnerEvaluationResultCoreLM *)v9 setTokenCount:v19[3]];
      LODWORD(v11) = *((_DWORD *)v27 + 6);
      [(NLPLearnerEvaluationResultCoreLM *)v9 setPredictedWords:v11];
      [(NLPLearnerEvaluationResultCoreLM *)v9 setWordCount:v23[3]];
      [(NLPLearnerEvaluationResultCoreLM *)v9 setSentenceCount:v15[3]];
      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v30, 8);
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v30[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    uint64_t v6 = CoreLMCopyTokenIdsForText();
    uint64_t v7 = [v6 count];
    unint64_t v8 = v7 + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1;
    if (v8 >= [*(id *)(a1 + 32) maxSequenceLength])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) maxSequenceLength];
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
      uint64_t v9 = *MEMORY[0x263F36828];
      uint64_t v10 = *MEMORY[0x263F36820];
      v28[0] = *MEMORY[0x263F36830];
      v28[1] = v10;
      v29[0] = v9;
      v29[1] = &unk_26E74D6F0;
      v28[2] = *MEMORY[0x263F36838];
      double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "topK"));
      v29[2] = v11;
      id v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];

      id v13 = (void *)CoreLMCopyPredictions();
      uint64_t v14 = [v13 keysSortedByValueUsingComparator:&__block_literal_global_0];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_2;
      v25[3] = &unk_264BEEAB8;
      id v15 = v5;
      uint64_t v16 = *(void *)(a1 + 72);
      id v26 = v15;
      uint64_t v27 = v16;
      [v14 enumerateObjectsUsingBlock:v25];

      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3;
      v24[3] = &unk_264BEEAE0;
      uint64_t v17 = *(void *)(a1 + 88);
      v24[4] = *(void *)(a1 + 48);
      v24[5] = v17;
      [v6 enumerateObjectsUsingBlock:v24];
    }
  }
  else if (a4 == 2)
  {
    unint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v18 < [*(id *)(a1 + 32) maxSequenceLength])
    {
      v19 = [NSNumber numberWithLong:CoreLMGetSpecialTokenId()];
      v30[0] = v19;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
      uint64_t v20 = CoreLMCopyConditionalProbabilities();

      if ([v20 count] != 1) {
        __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_2();
      }
      uint64_t v21 = [v20 firstObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_1();
      }

      uint64_t v22 = [v20 firstObject];
      [v22 floatValue];
      *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = logf(v23)
                                                                 + *(float *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                             + 24);
    CoreLMReset();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (void *)MEMORY[0x263F08708];
  id v7 = a2;
  unint64_t v8 = [v6 whitespaceAndNewlineCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  if ([v9 isEqualToString:*(void *)(a1 + 32)])
  {
    *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 1.0;
    *a4 = 1;
  }
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  id v7 = CoreLMCopyConditionalProbabilities();
  if ([v7 count] != 1) {
    __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_2();
  }
  unint64_t v8 = [v7 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_1();
  }

  id v9 = [v7 firstObject];
  [v9 floatValue];
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = logf(v10)
                                                             + *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *a4 = CoreLMUpdateWithContext() ^ 1;
}

- (unint64_t)maxSequenceLength
{
  return self->_maxSequenceLength;
}

- (void)setMaxSequenceLength:(unint64_t)a3
{
  self->_maxSequenceLength = a3;
}

- (void)setMaxSequenceLengthForModelURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "Failed to load '%@', error: '%@'", (uint8_t *)&v3, 0x16u);
}

- (void)setMaxSequenceLengthForModelURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "modelInfo '%@' missing 'MaximumSequenceLength' parameter", (uint8_t *)&v2, 0xCu);
}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "error loading coreLM %@", (uint8_t *)&v2, 0xCu);
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_1()
{
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_2()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke", "NLPLearnerCoreNLPShadowEvaluator.m", 154, "probs.count == 1");
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_1()
{
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_2()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke_3", "NLPLearnerCoreNLPShadowEvaluator.m", 203, "probs.count == 1");
}

@end