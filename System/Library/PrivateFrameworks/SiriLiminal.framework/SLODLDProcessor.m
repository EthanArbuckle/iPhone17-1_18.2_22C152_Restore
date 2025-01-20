@interface SLODLDProcessor
- (SLODLDClassifierV1)model;
- (SLODLDConfigDecoder)config;
- (SLODLDPreProcessingComponent)preprocessor;
- (SLODLDProcessor)initWithConfigFile:(id)a3 error:(id *)a4;
- (SLODLDTokenizerComponent)tokenizer;
- (id)_getPreprocessorForType:(unint64_t)a3 withConfig:(id)a4;
- (id)_getTokenizerForType:(unint64_t)a3 withConfig:(id)a4;
- (id)_setupPipelineComponentsUsingConfig:(id)a3;
- (id)getEncodedTokensForUtt:(id)a3;
- (id)processInputContext:(id)a3;
- (id)processInputUtterance:(id)a3;
- (void)setConfig:(id)a3;
- (void)setModel:(id)a3;
- (void)setPreprocessor:(id)a3;
- (void)setTokenizer:(id)a3;
@end

@implementation SLODLDProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setModel:(id)a3
{
}

- (SLODLDClassifierV1)model
{
  return self->_model;
}

- (void)setTokenizer:(id)a3
{
}

- (SLODLDTokenizerComponent)tokenizer
{
  return self->_tokenizer;
}

- (void)setPreprocessor:(id)a3
{
}

- (SLODLDPreProcessingComponent)preprocessor
{
  return self->_preprocessor;
}

- (void)setConfig:(id)a3
{
}

- (SLODLDConfigDecoder)config
{
  return self->_config;
}

- (id)_getTokenizerForType:(unint64_t)a3 withConfig:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    id v4 = a4;
    uint64_t v5 = [v4 isSPMModelMmapable];
    v6 = [SLSentencePieceModule alloc];
    v7 = [v4 getSPMModelFile];
    v8 = [(SLSentencePieceModule *)v6 initWithConfigFile:v7 isModelMmap:v5];

    v9 = [v4 getSPMEncoderOptions];

    if (v9)
    {
      uint64_t v10 = [(SLSentencePieceModule *)v8 setSPMEncoderOptions:v9];
      v11 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        v14 = "-[SLODLDProcessor _getTokenizerForType:withConfig:]";
        __int16 v15 = 2112;
        v16 = v9;
        __int16 v17 = 2048;
        uint64_t v18 = v10;
        _os_log_impl(&dword_21EFF4000, v11, OS_LOG_TYPE_DEFAULT, "%s Setting SPM encoder options %@ with status %ld", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_getPreprocessorForType:(unint64_t)a3 withConfig:(id)a4
{
  if (a3 == 1)
  {
    id v4 = a4;
    uint64_t v5 = [SLRegexMatcher alloc];
    v6 = [v4 getRegexMapConfig];

    v7 = [(SLRegexMatcher *)v5 initWithConfigFile:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)processInputContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 inputUtt];
  v6 = [(SLODLDProcessor *)self getEncodedTokensForUtt:v5];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__642;
  v24 = __Block_byref_object_dispose__643;
  id v25 = 0;
  model = self->_model;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__SLODLDProcessor_processInputContext___block_invoke;
  v17[3] = &unk_2644FFEE8;
  uint64_t v19 = &v20;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  [(SLODLDClassifierV1 *)model processEncodedTokens:v8 withContext:v4 withCompletion:v17];
  v9 = (id)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [(id)v21[5] odldScore];
    float v11 = v10;
    [(id)v21[5] outputAnchor];
    float v13 = v12;
    [(id)v21[5] conversationalScore];
    *(_DWORD *)buf = 136315906;
    v27 = "-[SLODLDProcessor processInputContext:]";
    __int16 v28 = 2048;
    double v29 = v11;
    __int16 v30 = 2048;
    double v31 = v13;
    __int16 v32 = 2048;
    double v33 = v14;
    _os_log_impl(&dword_21EFF4000, v9, OS_LOG_TYPE_DEFAULT, "%s output %f, social score %f conversationalScore %f", buf, 0x2Au);
  }

  id v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __39__SLODLDProcessor_processInputContext___block_invoke(void *a1, float a2, float a3, float a4)
{
  id v8 = [SLODLDProcessorResult alloc];
  id v15 = [*(id *)(a1[4] + 8) getConfigVersion];
  *(float *)&double v9 = a2;
  *(float *)&double v10 = a3;
  *(float *)&double v11 = a4;
  uint64_t v12 = [(SLODLDProcessorResult *)v8 initWithScore:v15 withVersion:a1[5] tokens:0 features:0 outputEmb:v9 outputAnchor:v10 conversationalScore:v11];
  uint64_t v13 = *(void *)(a1[6] + 8);
  float v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)getEncodedTokensForUtt:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || ![0 length])
  {
    id v5 = v4;
    preprocessor = self->_preprocessor;
    if (preprocessor)
    {
      uint64_t v7 = [(SLODLDPreProcessingComponent *)preprocessor applyPreprocessingOnUtt:v5];

      id v5 = (id)v7;
    }
    id v8 = [(SLODLDTokenizerComponent *)self->_tokenizer encodeUtterance:v5];
  }
  else
  {
    double v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[SLODLDProcessor getEncodedTokensForUtt:]";
      _os_log_error_impl(&dword_21EFF4000, v9, OS_LOG_TYPE_ERROR, "%s Empty input", (uint8_t *)&v11, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)processInputUtterance:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "-[SLODLDProcessor processInputUtterance:]";
    _os_log_error_impl(&dword_21EFF4000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)_setupPipelineComponentsUsingConfig:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 getPreProcessorType];
  v6 = [(SLODLDProcessor *)self _getPreprocessorForType:v5 withConfig:v4];
  preprocessor = self->_preprocessor;
  self->_preprocessor = v6;

  id v8 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = self->_preprocessor;
    int v25 = 136315650;
    v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
    __int16 v27 = 2048;
    uint64_t v28 = v5;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    _os_log_impl(&dword_21EFF4000, v8, OS_LOG_TYPE_DEFAULT, "%s PreProcessorType: %lu PreProcessor %@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v10 = [v4 getTokenizerType];
  int v11 = [(SLODLDProcessor *)self _getTokenizerForType:v10 withConfig:v4];
  tokenizer = self->_tokenizer;
  self->_tokenizer = v11;

  uint64_t v13 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    float v14 = self->_tokenizer;
    int v25 = 136315650;
    v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    __int16 v30 = v14;
    _os_log_impl(&dword_21EFF4000, v13, OS_LOG_TYPE_DEFAULT, "%s TokenizerType: %lu Tokenizer %@", (uint8_t *)&v25, 0x20u);
  }
  if (self->_tokenizer)
  {
    id v15 = [v4 getBertModelFile];
    v16 = [v4 getOdldModelBnnsIrWeightFile];
    __int16 v17 = [SLODLDClassifierV1 alloc];
    if (v16) {
      id v18 = [(SLODLDClassifierV1 *)v17 initWithConfigFile:v15 bnnsIrWeightPath:v16];
    }
    else {
      id v18 = [(SLODLDClassifierV1 *)v17 initWithConfigFile:v15];
    }
    uint64_t v20 = v18;
    if (v18) {
      objc_storeStrong((id *)&self->_model, v18);
    }
    v21 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      model = self->_model;
      int v25 = 136315394;
      v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)model;
      _os_log_impl(&dword_21EFF4000, v21, OS_LOG_TYPE_DEFAULT, "%s Classifier %@", (uint8_t *)&v25, 0x16u);
    }
    if (self->_model)
    {
      uint64_t v19 = 0;
    }
    else
    {
      v23 = [NSString stringWithFormat:@"Unable to create ODLD model"];
      uint64_t v19 = +[SLUtils createErrorWithMsg:v23 code:113];
    }
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"Unable to create tokenizer"];
    uint64_t v19 = +[SLUtils createErrorWithMsg:v15 code:112];
  }

  return v19;
}

- (SLODLDProcessor)initWithConfigFile:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SLODLDProcessor;
  uint64_t v7 = [(SLODLDProcessor *)&v20 init];
  if (!v7)
  {
LABEL_17:
    __int16 v17 = v7;
    goto LABEL_18;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  id v8 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[SLODLDProcessor initWithConfigFile:error:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_21EFF4000, v8, OS_LOG_TYPE_INFO, "%s Reading from configFile %@", buf, 0x16u);
  }
  double v9 = [[SLODLDConfigDecoder alloc] initWithConfigFile:v6];
  config = v7->_config;
  v7->_config = v9;

  if (!v7->_config)
  {
    float v14 = [NSString stringWithFormat:@"Unable to decode config file %@", v6];
    id v15 = +[SLUtils createErrorWithMsg:v14 code:111];
    v16 = v15;
    if (a4) {
      *a4 = v15;
    }

    goto LABEL_13;
  }
  int v11 = -[SLODLDProcessor _setupPipelineComponentsUsingConfig:](v7, "_setupPipelineComponentsUsingConfig:");
  uint64_t v12 = v11;
  if (!a4 || !v11)
  {
    id v18 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[SLODLDProcessor initWithConfigFile:error:]";
      _os_log_impl(&dword_21EFF4000, v18, OS_LOG_TYPE_DEFAULT, "%s Created ODLD Processor Pipelines", buf, 0xCu);
    }

    goto LABEL_17;
  }
  id v13 = v11;
  *a4 = v13;

LABEL_13:
  __int16 v17 = 0;
LABEL_18:

  return v17;
}

@end