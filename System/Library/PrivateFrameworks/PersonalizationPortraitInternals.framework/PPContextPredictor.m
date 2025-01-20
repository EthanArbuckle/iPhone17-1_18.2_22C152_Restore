@interface PPContextPredictor
- (PPContextPredictor)initWithLanguage:(id)a3;
- (PPContextPredictor)initWithMLModel:(id)a3 language:(id)a4;
- (id)contextForSentence:(id)a3;
@end

@implementation PPContextPredictor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coremlQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

- (id)contextForSentence:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!self->_mlModel)
  {
    v11 = 0;
    goto LABEL_36;
  }
  id v4 = a3;
  v5 = (void *)MEMORY[0x1CB79D060]();
  v6 = +[PPConfiguration sharedInstance];
  uint64_t v7 = [v6 sentenceEmbeddingVersion];

  v8 = (void *)MEMORY[0x1CB79D060]();
  v9 = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:self->_language revision:v7];
  if (v9 && (unint64_t)[v9 dimension] < 0x12D)
  {
    bzero(buf, 0x5DC0uLL);
    if ((unint64_t)[v4 count] <= 0x14)
    {
      uint64_t v12 = [v4 count];
      if (!v12)
      {
LABEL_13:
        id v43 = 0;
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithDataPointer:buf shape:&unk_1F256A490 dataType:65568 strides:&unk_1F256A4A8 deallocator:&__block_literal_global_11654 error:&v43];
        v10 = v43;
        if (v34)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F1E930]);
          v17 = (void *)MEMORY[0x1CB79D060]();
          v50 = @"embedded_content";
          v51 = v34;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          v42 = v10;
          v19 = (void *)[v16 initWithDictionary:v18 error:&v42];
          v32 = v42;

          if (v19)
          {
            uint64_t v36 = 0;
            v37 = &v36;
            uint64_t v38 = 0x3032000000;
            v39 = __Block_byref_object_copy__11660;
            v40 = __Block_byref_object_dispose__11661;
            id v41 = 0;
            coremlQueue = self->_coremlQueue;
            *(void *)&long long block = MEMORY[0x1E4F143A8];
            *((void *)&block + 1) = 3221225472;
            v45 = __52__PPContextPredictor_contextUsingCoreMLForSentence___block_invoke_48;
            v46 = &unk_1E65D9110;
            v49 = &v36;
            v47 = self;
            os_log_t oslog = v19;
            os_log_t v48 = oslog;
            dispatch_sync(coremlQueue, &block);
            v21 = (void *)v37[5];
            if (v21)
            {
              v22 = [v21 featureValueForName:@"probabilities"];
              v23 = [v22 multiArrayValue];

              if (v23)
              {
                v24 = objc_opt_new();
                for (unint64_t i = 0; i < [v23 count]; ++i)
                {
                  v26 = (void *)MEMORY[0x1CB79D060]();
                  v27 = [v23 objectAtIndexedSubscript:i];
                  v28 = [NSNumber numberWithUnsignedInteger:i];
                  [v24 setObject:v27 forKeyedSubscript:v28];
                }
                v11 = [[PPExtractionContext alloc] initWithProbabilities:v24];
              }
              else
              {
                v24 = pp_default_log_handle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v35 = 0;
                  _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to fetch array.", v35, 2u);
                }
                v11 = 0;
              }
            }
            else
            {
              v11 = 0;
            }

            _Block_object_dispose(&v36, 8);
          }
          else
          {
            v29 = pp_default_log_handle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(void *)((char *)&block + 4) = v32;
              _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to construct feature provider: %@", (uint8_t *)&block, 0xCu);
            }

            os_log_t oslog = 0;
            v11 = 0;
          }
          v10 = v32;
        }
        else
        {
          pp_default_log_handle();
          os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v10;
            _os_log_error_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to allocate multiarray: %@", (uint8_t *)&block, 0xCu);
          }
          v11 = 0;
        }

        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v12 = 20;
    }
    uint64_t v13 = 0;
    v14 = buf;
    do
    {
      v15 = [v4 objectAtIndexedSubscript:v13];
      [v9 getVector:v14 forString:v15];

      ++v13;
      v14 += 1200;
    }
    while (v12 != v13);
    goto LABEL_13;
  }
  v10 = pp_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    language = self->_language;
    *(_DWORD *)buf = 138412290;
    v53 = language;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPContextPredictor: unsupported language %@", buf, 0xCu);
  }
  v11 = 0;
LABEL_35:

LABEL_36:
  return v11;
}

void __52__PPContextPredictor_contextUsingCoreMLForSentence___block_invoke_48(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  id v9 = 0;
  uint64_t v4 = [v3 predictionFromFeatures:v2 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to invoke model: %@", buf, 0xCu);
    }
  }
}

- (PPContextPredictor)initWithMLModel:(id)a3 language:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPContextPredictor;
  id v9 = [(PPContextPredictor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mlModel, a3);
    objc_storeStrong((id *)&v10->_language, a4);
    uint64_t v11 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPContextPredictor-modelQueue"];
    coremlQueue = v10->_coremlQueue;
    v10->_coremlQueue = (OS_dispatch_queue *)v11;
  }
  return v10;
}

- (PPContextPredictor)initWithLanguage:(id)a3
{
  id v4 = a3;
  id v5 = +[PPTrialWrapper sharedInstance];
  uint64_t v6 = [v5 mlModelForModelName:@"context_predictor.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL" error:0];
  id v7 = [(PPContextPredictor *)self initWithMLModel:v6 language:v4];

  return v7;
}

@end