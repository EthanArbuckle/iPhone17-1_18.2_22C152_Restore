@interface CRTextSequenceRecognizerModelEspresso
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- (BOOL)_configurePlanForInput:(id)a3 error:(id *)a4;
- (BOOL)_setupContextAndPlanForConfiguration:(id)a3 error:(id *)a4;
- (BOOL)_shouldReconfigurePlanForInput:(id)a3;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)shouldSaturateInputBatches;
- (CRNeuralRecognizerConfiguration)recognizerConfiguration;
- (CRTextSequenceRecognizerModelEspresso)initWithConfiguration:(id)a3 error:(id *)a4;
- (NSArray)outputNames;
- (NSString)currentConfigurationHash;
- (OS_dispatch_queue)predictionQueue;
- (id)_configurationHashForInput:(id)a3;
- (id)_configurationHashForInput:(id)a3 batchSize:(unint64_t)a4;
- (id)_modelConfigurationNameForInput:(id)a3;
- (id)configuration;
- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7;
- (id)modelFilePath;
- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3;
- (id)predictFromInputs:(id)a3 error:(id *)a4;
- (int)engine;
- (int)precision;
- (vImage_Buffer)_createBufferWithWidth:(SEL)a3 height:(unint64_t)a4 channels:(unint64_t)a5 batchSize:(unint64_t)a6 sequenceLength:(unint64_t)a7;
- (void)_createContextForEngine:(int)a3 configuration:(id)a4;
- (void)_resetEspressoState;
- (void)context;
- (void)dealloc;
- (void)plan;
- (void)releaseIntermediateBuffers;
- (void)setContext:(void *)a3;
- (void)setCurrentConfigurationHash:(id)a3;
- (void)setEngine:(int)a3;
- (void)setNetwork:(id)a3;
- (void)setPlan:(void *)a3;
- (void)setPrecision:(int)a3;
- (void)setPredictionQueue:(id)a3;
- (void)setRecognizerConfiguration:(id)a3;
@end

@implementation CRTextSequenceRecognizerModelEspresso

- (id)modelFilePath
{
  v3 = [(CRTextSequenceRecognizerModel *)self modelURL];

  if (v3)
  {
    v4 = [(CRTextSequenceRecognizerModel *)self modelURL];
    v5 = [v4 path];
    v6 = [v5 stringByAppendingPathComponent:@"model.espresso.net"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CRTextSequenceRecognizerModelEspresso)initWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRTextSequenceRecognizerModelEspresso;
  v8 = [(CRTextSequenceRecognizerModelEspresso *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v10 = CROSLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(id)objc_opt_class() defaultModelFileName];
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEFAULT, "Loading model: %@", buf, 0xCu);
    }
    id v22 = 0;
    BOOL v12 = [(CRTextSequenceRecognizerModelEspresso *)v9 _setupContextAndPlanForConfiguration:v7 error:&v22];
    id v13 = v22;
    v14 = v13;
    if (a4 && v13) {
      *a4 = v13;
    }
    if (!v12)
    {

      v20 = 0;
      goto LABEL_11;
    }
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v16 = qos_class_self();
    v17 = dispatch_queue_attr_make_with_qos_class(v15, v16, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.CoreRecognition.recognizerPredictionQueue", v17);
    predictionQueue = v9->_predictionQueue;
    v9->_predictionQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v9->_recognizerConfiguration, a3);
    v9->_submissionLock._os_unfair_lock_opaque = 0;
  }
  v20 = v9;
LABEL_11:

  return v20;
}

- (NSArray)outputNames
{
  return (NSArray *)&unk_1F3933388;
}

- (id)predictFromInputs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = [(CRTextSequenceRecognizerModelEspresso *)self predictionQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke;
  v14[3] = &unk_1E6CDAE60;
  v14[4] = self;
  id v15 = v6;
  v17 = a4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  dispatch_sync(v8, v14);

  v11 = v16;
  id v12 = v9;

  return v12;
}

void __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) firstObject];
  LODWORD(v2) = [v2 _shouldReconfigurePlanForInput:v3];

  if (!v2) {
    goto LABEL_6;
  }
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) firstObject];
  id v79 = 0;
  int v6 = [v4 _configurePlanForInput:v5 error:&v79];
  id v7 = v79;

  if (v7 && *(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = v7;
  }

  if (v6)
  {
LABEL_6:
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v9 = qos_class_self();
    attr = dispatch_queue_attr_make_with_qos_class(v8, v9, 0);

    dispatch_queue_t v47 = dispatch_queue_create("com.apple.CoreRecognition.recognizerOutputQueue", attr);
    unint64_t v10 = [*(id *)(a1 + 40) count];
    unint64_t v11 = v10;
    v77 = 0;
    v76 = 0;
    v78 = 0;
    v66 = (void **)&v76;
    char v67 = 0;
    if (v10)
    {
      if (v10 >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v10;
      id v13 = (uint64_t *)operator new(8 * v10);
      v76 = v13;
      v78 = &v13[v11];
      bzero(v13, 8 * v11);
      v77 = &v13[v12];
    }
    for (unint64_t i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count", attr); ++i)
    {
      dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_4);
      id v16 = (void *)v76[i];
      v76[i] = (uint64_t)v15;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obunint64_t j = *(id *)(a1 + 40);
    uint64_t v17 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v17)
    {
      unint64_t v18 = 0;
      char v19 = 0;
      uint64_t v49 = *(void *)v73;
      do
      {
        uint64_t v20 = 0;
        uint64_t v50 = v17;
        do
        {
          if (*(void *)v73 != v49) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v72 + 1) + 8 * v20);
          uint64_t v68 = 0;
          v69 = &v68;
          uint64_t v70 = 0x2020000000;
          char v71 = 0;
          if (v19)
          {
            if (v18 >= v77 - v76) {
              std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
            }
            (*(void (**)(void))(v76[v18] + 16))();
            char v19 = 1;
            *((unsigned char *)v69 + 24) = 1;
          }
          else
          {
            [*(id *)(a1 + 32) network];
            [@"img_input" UTF8String];
            int v22 = espresso_network_bind_buffer();
            objc_super v23 = [*(id *)(a1 + 32) outputNames];
            unint64_t v24 = [v23 count];
            v63 = 0;
            v64 = 0;
            uint64_t v65 = 0;
            if (v24)
            {
              std::vector<espresso_buffer_t>::__vallocate[abi:ne180100](&v63, v24);
              v25 = (char *)v64;
              size_t v26 = 168 * ((168 * v24 - 168) / 0xA8) + 168;
              bzero(v64, v26);
              v64 = &v25[v26];
            }

            if (v22) {
              goto LABEL_64;
            }
            if (v21)
            {
              objc_msgSend(v21, "img_input");
              uint64_t v27 = *((void *)&v62 + 1);
              objc_msgSend(v21, "img_input");
              uint64_t v28 = v60;
              v29 = v66;
              objc_msgSend(v21, "img_input");
              size_t v30 = v28 * v27;
              v31 = (const void *)v61;
            }
            else
            {
              v31 = 0;
              size_t v30 = 0;
              v29 = v66;
              long long v61 = 0u;
              long long v62 = 0u;
            }
            memcpy(v29, v31, v30);
            uint64_t v32 = 0;
            int v33 = 0;
            for (unint64_t j = 0; ; ++j)
            {
              v35 = [*(id *)(a1 + 32) outputNames];
              BOOL v36 = j < [v35 count];

              if (!v36) {
                break;
              }
              [*(id *)(a1 + 32) network];
              v37 = [*(id *)(a1 + 32) outputNames];
              id v38 = [v37 objectAtIndexedSubscript:j];
              [v38 UTF8String];
              int v33 = espresso_network_bind_buffer();

              v32 += 168;
            }
            if (v33) {
              goto LABEL_64;
            }
            int v39 = [*(id *)(a1 + 32) engine];
            v40 = *(os_unfair_lock_s **)(a1 + 32);
            if (v39 == 10007)
            {
              os_unfair_lock_lock(v40 + 18);
              [*(id *)(a1 + 32) plan];
              v53 = 0;
              uint64_t v54 = 0;
              __p = 0;
              std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, v63, (uint64_t)v64, 0xCF3CF3CF3CF3CF3DLL * (((unsigned char *)v64 - (unsigned char *)v63) >> 3));
              id v51 = *(id *)(a1 + 48);
              memset(v55, 0, sizeof(v55));
              std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(void),void({block_pointer} {__strong}*)(void)>(v55, v76, v77, v77 - v76);
              unint64_t v56 = v18;
              int v41 = espresso_plan_submit();
              os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
              *(void *)&long long v61 = v55;
              std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);

              if (__p)
              {
                v53 = __p;
                operator delete(__p);
              }
            }
            else
            {
              [(os_unfair_lock_s *)v40 plan];
              int v41 = espresso_plan_execute_sync();
              v42 = *(void **)(a1 + 32);
              v58 = 0;
              uint64_t v59 = 0;
              v57 = 0;
              std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&v57, v63, (uint64_t)v64, 0xCF3CF3CF3CF3CF3DLL * (((unsigned char *)v64 - (unsigned char *)v63) >> 3));
              v43 = [v21 textFeatureInfo];
              v44 = [v42 outputFromOutputBuffers:&v57 featureInfo:v43];

              if (v57)
              {
                v58 = v57;
                operator delete(v57);
              }
              [*(id *)(a1 + 48) addObject:v44];
              if (!v41 && !*((unsigned char *)v69 + 24))
              {
                if (v18 >= v77 - v76) {
                  std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
                }
                (*(void (**)(void))(v76[v18] + 16))();
                *((unsigned char *)v69 + 24) = 1;
              }
            }
            if (v41)
            {
LABEL_64:
              if (*(void *)(a1 + 56))
              {
                **(void **)(a1 + 56) = +[CRImageReader errorWithErrorCode:-8];
              }
              if (*((unsigned char *)v69 + 24))
              {
                char v19 = 1;
              }
              else
              {
                if (v18 >= v77 - v76) {
                  std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
                }
                (*(void (**)(void))(v76[v18] + 16))();
                char v19 = 1;
                *((unsigned char *)v69 + 24) = 1;
              }
            }
            else
            {
              char v19 = 0;
            }
            if (v63)
            {
              v64 = v63;
              operator delete(v63);
            }
          }
          ++v18;
          _Block_object_dispose(&v68, 8);
          ++v20;
        }
        while (v20 != v50);
        uint64_t v17 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v17);
    }

    for (unint64_t k = 0; k < [*(id *)(a1 + 40) count]; ++k)
      dispatch_block_wait((dispatch_block_t)v76[k], 0xFFFFFFFFFFFFFFFFLL);
    v66 = (void **)&v76;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100](&v66);
  }
}

void __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  __p = 0;
  std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, *(const void **)(a1 + 64), *(void *)(a1 + 72), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 3));
  v5 = [*(id *)(a1 + 40) textFeatureInfo];
  int v6 = [v4 outputFromOutputBuffers:&__p featureInfo:v5];

  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }
  [*(id *)(a1 + 48) addObject:v6];
  if (a2 && *(_DWORD *)(a2 + 4))
  {
    id v7 = CROSLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a2 + 8);
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_ERROR, "Encountered error during plan submission: %s", buf, 0xCu);
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unint64_t v9 = *(void *)(a1 + 112);
    uint64_t v10 = *(void *)(a1 + 88);
    if (v9 >= (*(void *)(a1 + 96) - v10) >> 3) {
      std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
    }
    (*(void (**)(void))(*(void *)(v10 + 8 * v9) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 count];
  if ([(CRTextSequenceRecognizerModelEspresso *)self shouldSaturateInputBatches]) {
    uint64_t v16 = [v14 batchSize];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  [v14 inputHeight];
  [(CRTextSequenceRecognizerModelEspresso *)self _createBufferWithWidth:(unint64_t)a5 height:(unint64_t)v17 channels:1 batchSize:v16 sequenceLength:1];
  unint64_t v18 = [(CRTextSequenceRecognizerModel *)self populateInputBatchData:0 lineRegions:v12 image:v13 batchSize:v16 width:v14 configuration:v15 rectifier:a5];
  CRLogger = CRLogger::getCRLogger(v18);
  if (*CRLogger && (CRLogger[8] & 8) != 0)
  {
    uint64_t v20 = [[CRImage alloc] initWithFloatBuffer:0 width:(void)v27 height:*((void *)&v26 + 1)];
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"/tmp/batch_%d.png", rand());
    [(CRImage *)v20 writeToFile:v21];
  }
  int v22 = [CRTextRecognizerModelEspressoInput alloc];
  v25[0] = v26;
  v25[1] = v27;
  objc_super v23 = [(CRTextRecognizerModelEspressoInput *)v22 initWithImg_input:v25 batchSize:v16 featureInfo:v18];

  return v23;
}

- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  id v6 = a4;
  var0 = a3->var0;
  long long v8 = *(_OWORD *)((char *)a3->var0 + 120);
  long long v35 = *(_OWORD *)((char *)a3->var0 + 104);
  long long v36 = v8;
  long long v9 = *(_OWORD *)((char *)var0 + 152);
  long long v37 = *(_OWORD *)((char *)var0 + 136);
  long long v38 = v9;
  long long v10 = *(_OWORD *)((char *)var0 + 56);
  long long v31 = *(_OWORD *)((char *)var0 + 40);
  long long v32 = v10;
  long long v11 = *(_OWORD *)((char *)var0 + 88);
  long long v33 = *(_OWORD *)((char *)var0 + 72);
  long long v34 = v11;
  long long v12 = *(_OWORD *)((char *)var0 + 24);
  long long v29 = *(_OWORD *)((char *)var0 + 8);
  long long v30 = v12;
  id v13 = malloc_type_malloc(*((void *)var0 + 9), 0xF6299434uLL);
  memcpy(v13, *(const void **)a3->var0, *((void *)a3->var0 + 9));
  uint64_t v14 = [v6 count];
  if ([(CRTextSequenceRecognizerModelEspresso *)self shouldSaturateInputBatches])
  {
    id v15 = [(CRTextSequenceRecognizerModelEspresso *)self configuration];
    uint64_t v14 = [v15 batchSize];
  }
  long long v25 = v35;
  long long v26 = v36;
  long long v27 = v37;
  long long v28 = v38;
  long long v21 = v31;
  long long v22 = v32;
  long long v23 = v33;
  long long v24 = v34;
  long long v19 = v29;
  long long v20 = v30;
  unint64_t v18 = v13;
  uint64_t v16 = [[CRTextRecognizerModelEspressoOutput alloc] initWithOutputLabelProbs:&v18 featureInfo:v6 batchSize:v14];

  return v16;
}

- (BOOL)shouldSaturateInputBatches
{
  v3 = [(CRTextSequenceRecognizerModel *)self outputFormatVersion];
  int v4 = [v3 intValue];

  if (v4 == 1) {
    return self->_engine == 10007;
  }
  id v6 = [(CRTextSequenceRecognizerModel *)self outputFormatVersion];
  [v6 intValue];

  return 1;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = CROSLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(id)objc_opt_class() defaultModelFileName];
    *(_DWORD *)buf = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DD733000, v3, OS_LOG_TYPE_DEFAULT, "Unloading model: %@", buf, 0xCu);
  }
  [(CRTextSequenceRecognizerModelEspresso *)self _resetEspressoState];
  v5.receiver = self;
  v5.super_class = (Class)CRTextSequenceRecognizerModelEspresso;
  [(CRTextSequenceRecognizerModel *)&v5 dealloc];
}

- (id)_modelConfigurationNameForInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRTextSequenceRecognizerModelEspresso *)self recognizerConfiguration];
  id v6 = -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:batchSize:](self, "_configurationHashForInput:batchSize:", v4, [v5 batchSize]);

  return v6;
}

- (id)_configurationHashForInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:batchSize:](self, "_configurationHashForInput:batchSize:", v4, [v4 batchSize]);

  return v5;
}

- (id)_configurationHashForInput:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "img_input");
    uint64_t v8 = NSString;
    long long v9 = [(CRTextSequenceRecognizerModelEspresso *)self recognizerConfiguration];
    [v9 inputHeight];
    long long v11 = [v8 stringWithFormat:@"%@_%ld_%ld_%ld_%ld_%ld_", @"img_input", 1, a4, 1, (unint64_t)v10, 0];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (BOOL)_setupContextAndPlanForConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CRTextSequenceRecognizerModelEspresso *)self _resetEspressoState];
  id v7 = [(CRTextSequenceRecognizerModelEspresso *)self modelFilePath];
  if (!v7)
  {
LABEL_13:
    if (a4)
    {
      long long v11 = +[CRImageReader errorWithErrorCode:-8];
LABEL_27:
      BOOL v16 = 0;
      *a4 = v11;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v16 = 0;
    goto LABEL_29;
  }
  self->_uint64_t engine = 5;
  self->_precision = 65552;
  if ([v6 computeDeviceType] == 1)
  {
    uint64_t engine = 0;
    self->_uint64_t engine = 0;
    self->_precision = 65568;
  }
  else if ([v6 usesAppleNeuralEngine])
  {
    uint64_t engine = 10007;
    self->_uint64_t engine = 10007;
    self->_precision = 65552;
  }
  else
  {
    uint64_t engine = self->_engine;
  }
  long long v9 = [(CRTextSequenceRecognizerModelEspresso *)self _createContextForEngine:engine configuration:v6];
  self->_context = v9;
  if (!v9)
  {
    if ([v6 computeDeviceType] || self->_engine == 5)
    {
      if (self->_context) {
        goto LABEL_16;
      }
    }
    else
    {
      self->_uint64_t engine = 5;
      long long v12 = [(CRTextSequenceRecognizerModelEspresso *)self _createContextForEngine:5 configuration:v6];
      self->_context = v12;
      if (v12) {
        goto LABEL_16;
      }
    }
    if (!self->_engine) {
      goto LABEL_13;
    }
    self->_uint64_t engine = 0;
    self->_precision = 65568;
    double v10 = [(CRTextSequenceRecognizerModelEspresso *)self _createContextForEngine:0 configuration:v6];
    self->_context = v10;
    if (!v10) {
      goto LABEL_13;
    }
  }
LABEL_16:
  espresso_context_set_low_precision_accumulation();
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    double v17 = CROSLogForCategory(3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_ERROR, "Failed to initialize plan", (uint8_t *)v20, 2u);
    }

    [(CRTextSequenceRecognizerModelEspresso *)self _resetEspressoState];
    if (!a4) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  [v7 UTF8String];
  int v14 = espresso_plan_add_network();
  int v15 = espresso_plan_build();
  if (v14 | v15)
  {
    unint64_t v18 = CROSLogForCategory(3);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 67109376;
      v20[1] = v14;
      __int16 v21 = 1024;
      int v22 = v15;
      _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_ERROR, "Error loading network %d, %d", (uint8_t *)v20, 0xEu);
    }

    [(CRTextSequenceRecognizerModelEspresso *)self _resetEspressoState];
    if (!a4) {
      goto LABEL_28;
    }
LABEL_26:
    long long v11 = +[CRImageReader errorWithErrorCode:-8];
    goto LABEL_27;
  }
  BOOL v16 = 1;
LABEL_29:

  return v16;
}

- (void)_createContextForEngine:(int)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 5)
  {
    id v7 = [v5 metalDevice];

    if (v7)
    {
      uint64_t v8 = [v6 metalDevice];
      espresso_device_id_for_metal_device();
    }
  }
  context = (void *)espresso_create_context();

  return context;
}

- (vImage_Buffer)_createBufferWithWidth:(SEL)a3 height:(unint64_t)a4 channels:(unint64_t)a5 batchSize:(unint64_t)a6 sequenceLength:(unint64_t)a7
{
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  vImagePixelCount v10 = a7 * a5;
  result = (vImage_Buffer *)malloc_type_calloc(a7 * a5 * a4, 4uLL, 0x100004052888210uLL);
  retstr->data = result;
  retstr->height = v10;
  retstr->width = a4;
  retstr->rowBytes = 4 * a4;
  return result;
}

- (BOOL)_shouldReconfigurePlanForInput:(id)a3
{
  id v4 = a3;
  id v5 = [(CRTextSequenceRecognizerModelEspresso *)self currentConfigurationHash];
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(CRTextSequenceRecognizerModelEspresso *)self _configurationHashForInput:v4];
    id v7 = [(CRTextSequenceRecognizerModelEspresso *)self currentConfigurationHash];
    int v8 = [v6 isEqualToString:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)preheatWithError:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(CRNeuralRecognizerConfiguration *)self->_configuration batchSize];
  id v6 = [(CRNeuralRecognizerConfiguration *)self->_configuration inputWidths];
  id v7 = [v6 firstObject];
  [v7 doubleValue];
  unint64_t v9 = (unint64_t)v8;

  [(CRNeuralRecognizerConfiguration *)self->_configuration inputHeight];
  long long v22 = 0u;
  long long v23 = 0u;
  [(CRTextSequenceRecognizerModelEspresso *)self _createBufferWithWidth:v9 height:(unint64_t)v10 channels:1 batchSize:v5 sequenceLength:1];
  long long v11 = [CRTextRecognizerModelEspressoInput alloc];
  v21[0] = v22;
  v21[1] = v23;
  long long v12 = [(CRTextRecognizerModelEspressoInput *)v11 initWithImg_input:v21 batchSize:v5 featureInfo:MEMORY[0x1E4F1CBF0]];
  v24[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v20 = 0;
  int v14 = [(CRTextSequenceRecognizerModelEspresso *)self predictFromInputs:v13 error:&v20];
  id v15 = v20;

  if (v15) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  BOOL v17 = !v16 || a3 == 0;
  char v18 = !v17;
  if (!v17) {
    *a3 = v15;
  }

  return v18 ^ 1;
}

- (BOOL)_configurePlanForInput:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(CRTextSequenceRecognizerModelEspresso *)self currentConfigurationHash];
  objc_sync_enter(v6);
  if (v5)
  {
    [v5 batchSize];
    id v7 = [(CRTextSequenceRecognizerModelEspresso *)self recognizerConfiguration];
    [v7 inputHeight];

    objc_msgSend(v5, "img_input");
    id v14 = [(CRTextSequenceRecognizerModelEspresso *)self _modelConfigurationNameForInput:v5];
    id v15 = [(CRTextSequenceRecognizerModelEspresso *)self _configurationHashForInput:v5];
    if (espresso_plan_get_phase() == 1) {
      espresso_plan_build_clean();
    }
    id v16 = v14;
    [v16 UTF8String];
    if (espresso_network_select_configuration()) {
      goto LABEL_14;
    }
    [@"img_input" UTF8String];
    if (espresso_network_change_blob_shape()) {
      goto LABEL_14;
    }
    [@"img_input" UTF8String];
    espresso_network_declare_input();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v8 = [(CRTextSequenceRecognizerModelEspresso *)self outputNames];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) UTF8String];
          espresso_network_declare_output();
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    if (espresso_plan_build())
    {
LABEL_14:
      if (a4)
      {
        *a4 = +[CRImageReader errorWithErrorCode:-8];
      }
      int v12 = 1;
    }
    else
    {
      [(CRTextSequenceRecognizerModelEspresso *)self setCurrentConfigurationHash:v15];
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 1;
  }
  objc_sync_exit(v6);

  return v12 == 0;
}

- (void)_resetEspressoState
{
  if (self->_plan)
  {
    espresso_plan_destroy();
    self->_plan = 0;
  }
  if (self->_context)
  {
    espresso_context_destroy();
    self->_context = 0;
  }
}

- (void)releaseIntermediateBuffers
{
  [(CRTextSequenceRecognizerModelEspresso *)self setCurrentConfigurationHash:&stru_1F38EED68];
  [(CRTextSequenceRecognizerModelEspresso *)self plan];
  espresso_plan_build_clean();
}

- (id)configuration
{
  return objc_getProperty(self, a2, 88, 1);
}

- (CRNeuralRecognizerConfiguration)recognizerConfiguration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecognizerConfiguration:(id)a3
{
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)plan
{
  return self->_plan;
}

- (void)setPlan:(void *)a3
{
  self->_plan = a3;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  uint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setNetwork:(id)a3
{
  $C4732ECC957FA13B9B3DF4A51A95735B v3 = a3;
  objc_copyStruct(&self->_network, &v3, 16, 1, 0);
}

- (int)engine
{
  return self->_engine;
}

- (void)setEngine:(int)a3
{
  self->_uint64_t engine = a3;
}

- (int)precision
{
  return self->_precision;
}

- (void)setPrecision:(int)a3
{
  self->_precision = a3;
}

- (NSString)currentConfigurationHash
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentConfigurationHash:(id)a3
{
}

- (OS_dispatch_queue)predictionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPredictionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_currentConfigurationHash, 0);
  objc_storeStrong((id *)&self->_recognizerConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end