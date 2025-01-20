@interface SLODLDClassifierV1
- (CSFModelComputeBackend)odldClassifier;
- (NSArray)outputNodes;
- (NSDictionary)inputSpecs;
- (SLODLDClassifierV1)initWithConfigFile:(id)a3;
- (SLODLDClassifierV1)initWithConfigFile:(id)a3 bnnsIrWeightPath:(id)a4;
- (float)processEncodedTokens:(id)a3;
- (id)_constructFeatureDictionary:(id)a3 withCtx:(id)a4;
- (id)_createDataBufferForTensor:(id)a3 withData:(id)a4 properties:(id)a5;
- (id)_extractModelSpecs;
- (void)processEncodedTokens:(id)a3 withContext:(id)a4 withCompletion:(id)a5;
- (void)setInputSpecs:(id)a3;
- (void)setOdldClassifier:(id)a3;
- (void)setOutputNodes:(id)a3;
@end

@implementation SLODLDClassifierV1

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSpecs, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
  objc_storeStrong((id *)&self->_odldClassifier, 0);
}

- (void)setInputSpecs:(id)a3
{
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setOutputNodes:(id)a3
{
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (void)setOdldClassifier:(id)a3
{
}

- (CSFModelComputeBackend)odldClassifier
{
  return self->_odldClassifier;
}

- (id)_constructFeatureDictionary:(id)a3 withCtx:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSDictionary *)self->_inputSpecs objectForKeyedSubscript:@"minibatch_input_ids"];
  v9 = [v8 shape];

  v10 = [[SLODLDInputTokenParams alloc] initWithShape:v9];
  v11 = v10;
  if (v10)
  {
    id v43 = 0;
    [(SLODLDInputTokenParams *)v10 populateWithTokens:v6 error:&v43];
    id v12 = v43;
    if (v12)
    {
      id v13 = v12;
      v14 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_error_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_ERROR, "%s Unable to populate current token parameters with error: %@", buf, 0x16u);
      }
      id v15 = 0;
      goto LABEL_22;
    }
    v17 = [[SLODLDInputTokenParams alloc] initWithShape:v9];
    v18 = [v7 prevTokens];
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      if (!v17)
      {
        v26 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
          _os_log_error_impl(&dword_21EFF4000, v26, OS_LOG_TYPE_ERROR, "%s Unable to create previous token params", buf, 0xCu);
        }
        id v13 = 0;
        goto LABEL_20;
      }
      v20 = [v7 prevTokens];
      id v42 = 0;
      [(SLODLDInputTokenParams *)v17 populateWithTokens:v20 error:&v42];
      id v13 = v42;

      v21 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        v28 = v21;
        v29 = [v7 prevTokens];
        v22 = [(SLODLDInputTokenParams *)v17 mlAttnMask];
        v23 = [(SLODLDInputTokenParams *)v17 mlInputIds];
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        v45 = v22;
        *(_WORD *)v46 = 2112;
        *(void *)&v46[2] = v23;
        *(_WORD *)&v46[10] = 2112;
        *(void *)&v46[12] = v13;
        _os_log_impl(&dword_21EFF4000, v28, OS_LOG_TYPE_INFO, "%s Setting prevtoks %@, paramAttnMask %@,  paraIpids %@ with error: %@", buf, 0x34u);
      }
      if (v13)
      {
        v24 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_error_impl(&dword_21EFF4000, v24, OS_LOG_TYPE_ERROR, "%s Unable to populate previous token parameters with error: %@", buf, 0x16u);
        }
LABEL_20:
        id v15 = 0;
        goto LABEL_21;
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    *(void *)v46 = __Block_byref_object_dispose_;
    *(void *)&v46[8] = [MEMORY[0x263EFF9A0] dictionary];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy_;
    v40[4] = __Block_byref_object_dispose_;
    id v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy_;
    v38[4] = __Block_byref_object_dispose_;
    id v39 = 0;
    inputSpecs = self->_inputSpecs;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __58__SLODLDClassifierV1__constructFeatureDictionary_withCtx___block_invoke;
    v30[3] = &unk_2644FFD88;
    v35 = v38;
    v31 = v11;
    v32 = v17;
    id v33 = v7;
    v34 = self;
    v36 = v40;
    v37 = buf;
    [(NSDictionary *)inputSpecs enumerateKeysAndObjectsUsingBlock:v30];
    id v15 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(buf, 8);
    id v13 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v16 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
    _os_log_error_impl(&dword_21EFF4000, v16, OS_LOG_TYPE_ERROR, "%s Unable to create current token params", buf, 0xCu);
  }
  id v15 = 0;
LABEL_23:

  return v15;
}

void __58__SLODLDClassifierV1__constructFeatureDictionary_withCtx___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v7 isEqualToString:@"minibatch_attention_mask"])
  {
    v9 = [*(id *)(a1 + 32) mlAttnMask];
    v36[0] = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = (void **)v36;
  }
  else if ([v7 isEqualToString:@"minibatch_input_ids"])
  {
    v9 = [*(id *)(a1 + 32) mlInputIds];
    v35 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v35;
  }
  else if ([v7 isEqualToString:@"minibatch_token_type_ids"])
  {
    v9 = [*(id *)(a1 + 32) mlTypeIds];
    v34 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v34;
  }
  else if ([v7 isEqualToString:@"minibatch_padding_mask"])
  {
    v9 = [*(id *)(a1 + 32) mlPadMask];
    id v33 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v33;
  }
  else if ([v7 isEqualToString:@"minibatch_prev_attention_mask"])
  {
    v9 = [*(id *)(a1 + 40) mlAttnMask];
    v32 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v32;
  }
  else if ([v7 isEqualToString:@"minibatch_prev_input_ids"])
  {
    v9 = [*(id *)(a1 + 40) mlInputIds];
    v31 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v31;
  }
  else if ([v7 isEqualToString:@"minibatch_prev_token_type_ids"])
  {
    v9 = [*(id *)(a1 + 40) mlTypeIds];
    v30 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v30;
  }
  else if ([v7 isEqualToString:@"minibatch_prev_padding_mask"])
  {
    v9 = [*(id *)(a1 + 40) mlPadMask];
    v29 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v29;
  }
  else if ([v7 isEqualToString:@"minibatch_input_origin"])
  {
    v9 = [*(id *)(a1 + 48) inputOrigin];
    v28 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v28;
  }
  else
  {
    if (![v7 isEqualToString:@"minibatch_anchor_social_score"]) {
      goto LABEL_22;
    }
    v9 = [*(id *)(a1 + 48) inputAnchor];
    v27 = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = &v27;
  }
  uint64_t v12 = [v10 arrayWithObjects:v11 count:1];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

LABEL_22:
  uint64_t v15 = [*(id *)(a1 + 56) _createDataBufferForTensor:v7 withData:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) properties:v8];
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v18)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v18 forKey:v7];
  }
  else
  {
    BOOL v19 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v21 = 136315650;
      v22 = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      _os_log_error_impl(&dword_21EFF4000, v19, OS_LOG_TYPE_ERROR, "%s Unbale to create input buffer for tensor: %@ with value: %@", (uint8_t *)&v21, 0x20u);
    }
    *a4 = 1;
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeAllObjects];
  }
}

- (id)_createDataBufferForTensor:(id)a3 withData:(id)a4 properties:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263F38058] getRankOfTensor:v8];
  if (v10 < 0
    || (uint64_t v11 = v10,
        [v9 shape],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        v11 != v13))
  {
    v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SLODLDClassifierV1 _createDataBufferForTensor:withData:properties:]";
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_ERROR, "%s Invalid or mismatched shape for tensor: %@", buf, 0x16u);
    }
    id v16 = 0;
  }
  else
  {
    id v20 = 0;
    v14 = (void *)[objc_alloc(MEMORY[0x263F38040]) initWithInputArray:v8 name:v7 properties:v9 errOut:&v20];
    id v15 = v20;
    if (v15 || !v14)
    {
      uint64_t v18 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[SLODLDClassifierV1 _createDataBufferForTensor:withData:properties:]";
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_error_impl(&dword_21EFF4000, v18, OS_LOG_TYPE_ERROR, "%s Unable to create data buffer for tensor: %@", buf, 0x16u);
      }
      id v16 = 0;
    }
    else
    {
      id v16 = v14;
    }
  }
  return v16;
}

- (id)_extractModelSpecs
{
  v19[1] = *MEMORY[0x263EF8340];
  v3 = [(CSFModelComputeBackend *)self->_odldClassifier getExpectedInputTensors];
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v3;

  v5 = self->_inputSpecs;
  if (v5 && [(NSDictionary *)v5 count])
  {
    id v6 = [(CSFModelComputeBackend *)self->_odldClassifier getExpectedOutputTensors];
    id v7 = [v6 allKeys];
    outputNodes = self->_outputNodes;
    self->_outputNodes = v7;

    id v9 = self->_outputNodes;
    if (v9 && [(NSArray *)v9 count])
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    id v14 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v16 = *MEMORY[0x263F08320];
    v17 = @"cannot get outputNodes";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v10 = (void *)[v14 initWithDomain:@"com.apple.sl" code:117 userInfo:v12];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v18 = *MEMORY[0x263F08320];
    uint64_t v12 = [NSString stringWithFormat:@"cannot get shape for input"];
    v19[0] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v10 = (void *)[v11 initWithDomain:@"com.apple.sl" code:117 userInfo:v13];
  }
LABEL_9:
  return v10;
}

- (void)processEncodedTokens:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void, float, float, float))a5;
  id v11 = [(SLODLDClassifierV1 *)self _constructFeatureDictionary:v8 withCtx:v9];
  if (v11)
  {
    odldClassifier = self->_odldClassifier;
    id v35 = 0;
    uint64_t v13 = [(CSFModelComputeBackend *)odldClassifier predictOutputWithInputs:v11 errOut:&v35];
    id v14 = v35;
    if (v14)
    {
      id v15 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_21EFF4000, v15, OS_LOG_TYPE_DEFAULT, "%s error when executing :%@", buf, 0x16u);
      }
      if (v10) {
        v10[2](v10, -1.0, -1.0, -1.0);
      }
    }
    uint64_t v16 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_21EFF4000, v16, OS_LOG_TYPE_DEFAULT, "%s outputs from Odld classifier: %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LODWORD(v37) = -1082130432;
    uint64_t v31 = 0;
    v32 = (float *)&v31;
    uint64_t v33 = 0x2020000000;
    int v34 = -1082130432;
    uint64_t v27 = 0;
    v28 = (float *)&v27;
    uint64_t v29 = 0x2020000000;
    int v30 = -1082130432;
    outputNodes = self->_outputNodes;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __70__SLODLDClassifierV1_processEncodedTokens_withContext_withCompletion___block_invoke;
    v22[3] = &unk_2644FFD60;
    id v18 = v13;
    id v23 = v18;
    id v24 = buf;
    uint64_t v25 = &v31;
    uint64_t v26 = &v27;
    [(NSArray *)outputNodes enumerateObjectsUsingBlock:v22];
    if (v10) {
      v10[2](v10, *(float *)(*(void *)&buf[8] + 24), v32[6], v28[6]);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v19 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v20 = v19;
      int v21 = [0 localizedDescription];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v37 = 0;
      _os_log_error_impl(&dword_21EFF4000, v20, OS_LOG_TYPE_ERROR, "%s Unable to create feature dict with error %@ from %@", buf, 0x20u);
    }
    if (v10) {
      v10[2](v10, -1.0, -1.0, -1.0);
    }
  }
}

void __70__SLODLDClassifierV1_processEncodedTokens_withContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  v4 = [v3 convertDataToArray];
  if (([v8 isEqualToString:@"output_prob"] & 1) != 0
    || [v8 isEqualToString:@"minibatch_score_odld"])
  {
    v5 = [v4 firstObject];
    [v5 floatValue];
    uint64_t v7 = a1 + 40;
LABEL_4:
    *(_DWORD *)(*(void *)(*(void *)v7 + 8) + 24) = v6;

    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"minibatch_score_social"])
  {
    v5 = [v4 firstObject];
    [v5 floatValue];
    uint64_t v7 = a1 + 48;
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"minibatch_score_conversational"])
  {
    v5 = [v4 firstObject];
    [v5 floatValue];
    uint64_t v7 = a1 + 56;
    goto LABEL_4;
  }
LABEL_5:
}

- (float)processEncodedTokens:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    int v6 = "-[SLODLDClassifierV1 processEncodedTokens:]";
    _os_log_error_impl(&dword_21EFF4000, v3, OS_LOG_TYPE_ERROR, "%s Unable to process tokens without context", (uint8_t *)&v5, 0xCu);
  }
  return -1.0;
}

- (SLODLDClassifierV1)initWithConfigFile:(id)a3
{
  return [(SLODLDClassifierV1 *)self initWithConfigFile:a3 bnnsIrWeightPath:0];
}

- (SLODLDClassifierV1)initWithConfigFile:(id)a3 bnnsIrWeightPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SLODLDClassifierV1;
  id v8 = [(SLODLDClassifierV1 *)&v19 init];
  if (!v8) {
    goto LABEL_13;
  }
  id v18 = 0;
  uint64_t v9 = [MEMORY[0x263F38050] provideComputeBackendWithModelFile:v6 separateWeight:v7 error:&v18];
  id v10 = v18;
  odldClassifier = v8->_odldClassifier;
  v8->_odldClassifier = (CSFModelComputeBackend *)v9;

  if (v8->_odldClassifier) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    uint64_t v13 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:]";
      __int16 v22 = 2112;
      id v23 = v10;
      id v14 = "%s model init error: %@";
LABEL_11:
      _os_log_impl(&dword_21EFF4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v15 = [(SLODLDClassifierV1 *)v8 _extractModelSpecs];
  if (!v15)
  {
LABEL_13:
    uint64_t v16 = v8;
    goto LABEL_14;
  }
  id v10 = (id)v15;
  uint64_t v13 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v21 = "-[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:]";
    __int16 v22 = 2112;
    id v23 = v10;
    id v14 = "%s model init error with model specs extraction: %@";
    goto LABEL_11;
  }
LABEL_12:

  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

@end