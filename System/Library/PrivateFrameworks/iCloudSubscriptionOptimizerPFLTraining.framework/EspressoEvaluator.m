@interface EspressoEvaluator
+ (void)initialize;
- (NSURL)modelURL;
- (float)averageLossEvaluation:(id)a3 dataWrapper:(id)a4 batchSize:(int)a5;
- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (id)evaluationMetrics:(id)a3 dataWrapper:(id)a4 outputName:(id)a5;
- (void)setModelURL:(id)a3;
@end

@implementation EspressoEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "EspressoEvaluator");
    MEMORY[0x270F9A758]();
  }
}

- (id)evaluationMetrics:(id)a3 dataWrapper:(id)a4 outputName:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF980] array];
  v11 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C9A9000, v11, OS_LOG_TYPE_INFO, "Started model evaluation", buf, 2u);
  }
  v24[0] = @"cross_entropy";
  v24[1] = v9;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__EspressoEvaluator_evaluationMetrics_dataWrapper_outputName___block_invoke;
  v19[3] = &unk_264E79CC0;
  id v13 = v9;
  id v20 = v13;
  id v14 = v8;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  [v7 runInference:v14 outputNames:v12 batchCallback:v19];

  v16 = v22;
  id v17 = v15;

  return v17;
}

uint64_t __62__EspressoEvaluator_evaluationMetrics_dataWrapper_outputName___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (id)sLog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109376;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = [v5 numberOfDataPoints];
    _os_log_impl(&dword_23C9A9000, v6, OS_LOG_TYPE_INFO, "fit: iter=%d outputs.numberOfDataPoints=%d", (uint8_t *)v19, 0xEu);
  }

  for (uint64_t i = 0; (int)i < (int)[v5 numberOfDataPoints]; uint64_t i = (i + 1))
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    id v9 = [v5 dataPointAtIndex:i];
    v10 = (float *)[v9 bufferWithKey:*(void *)(a1 + 32)];

    float v11 = expf(v10[1]);
    *(float *)&double v12 = v11 / (float)(v11 + expf(*v10));
    id v13 = [NSNumber numberWithFloat:v12];
    [v8 setValue:v13 forKey:@"probability"];

    id v14 = [*(id *)(a1 + 40) dataPointAtIndex:i];
    id v15 = (_DWORD *)[v14 bufferWithKey:@"label"];

    LODWORD(v16) = *v15;
    id v17 = objc_msgSend(NSNumber, "numberWithBool:", *(float *)v15 > 0.0, v16);
    [v8 setValue:v17 forKey:@"label"];

    [*(id *)(a1 + 48) addObject:v8];
  }

  return 0;
}

- (float)averageLossEvaluation:(id)a3 dataWrapper:(id)a4 batchSize:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = 0;
  id v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v9 = [v8 numberOfDataPoints];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__EspressoEvaluator_averageLossEvaluation_dataWrapper_batchSize___block_invoke;
  v12[3] = &unk_264E79CE8;
  v12[4] = &v13;
  v12[5] = v9 / a5;
  [v7 runInference:v8 outputNames:&unk_26F09F8F0 batchCallback:v12];
  float v10 = v14[6];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __65__EspressoEvaluator_averageLossEvaluation_dataWrapper_batchSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 dataPointAtIndex:0];
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (float)(*(float *)[v5 bufferWithKey:@"cross_entropy"]/ (float)*(unint64_t *)(a1 + 40))+ *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return 0;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v91 = a3;
  id v95 = a4;
  id v7 = (id)sLog;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    [v95 learningRate];
    float v9 = v8;
    float v10 = [v95 freezeComponents];
    float v11 = [v95 gradNormType];
    [v95 gradNormFactor];
    float v13 = v12;
    int v14 = [v95 batchSize];
    uint64_t v15 = [v95 objectiveFunction];
    int v16 = [v95 modelOutputName];
    *(_DWORD *)buf = 134219522;
    *(double *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v127 = v11;
    LOWORD(v128) = 2048;
    *(double *)((char *)&v128 + 2) = v13;
    WORD5(v128) = 1024;
    HIDWORD(v128) = v14;
    __int16 v129 = 2112;
    v130 = v15;
    __int16 v131 = 2112;
    v132 = v16;
    _os_log_impl(&dword_23C9A9000, v7, OS_LOG_TYPE_INFO, "Evaluation using Espresso with learning rate %f, freezing components %@ , gradient normtype %@ , gradient norm factor %f , batch size %d , objective function %@, model output name %@", buf, 0x44u);
  }
  id v116 = 0;
  id v17 = [MEMORY[0x263F00D80] compileModelAtURL:v91 error:&v116];
  v88 = v17;
  id v89 = v116;
  if (v17)
  {
    v87 = [v17 URLByAppendingPathComponent:@"model.espresso.net"];
    v18 = (id)sLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C9A9000, v18, OS_LOG_TYPE_INFO, "Setup espresso network", buf, 2u);
    }

    id v19 = objc_alloc(MEMORY[0x263F3B770]);
    __int16 v20 = [v87 path];
    v100 = (void *)[v19 initWithNetwork:v20];

    int v21 = [v95 layersToTrain];
    LOBYTE(v19) = [v21 count] == 0;

    if ((v19 & 1) == 0)
    {
      uint64_t v22 = [v95 layersToTrain];
      [v100 configureLayersToTrain:v22 reinitializeVariables:0];
    }
    v23 = (id)sLog;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C9A9000, v23, OS_LOG_TYPE_INFO, "Create optimizer", buf, 2u);
    }

    id v94 = objc_alloc_init(MEMORY[0x263F3B780]);
    objc_msgSend(v94, "setBatch_size:", objc_msgSend(v95, "batchSize"));
    [v95 learningRate];
    objc_msgSend(v94, "setLr:");
    [v95 learningRateDecay];
    objc_msgSend(v94, "setLr_decay_epoch:");
    v24 = (id)sLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C9A9000, v24, OS_LOG_TYPE_INFO, "Create classifier task", buf, 2u);
    }

    v93 = (void *)[objc_alloc(MEMORY[0x263F3B788]) initWithModelDef:v100 optimizerDef:v94 extractor:0 needWeightsInitialization:0];
    v115[0] = 0;
    v115[1] = 0;
    v113[1] = 0;
    v114 = (uint64_t *)v115;
    v112 = (uint64_t *)v113;
    v113[0] = 0;
    v25 = (id)sLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [v95 layersToTrain];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v26;
      _os_log_impl(&dword_23C9A9000, v25, OS_LOG_TYPE_INFO, "Layers to train: %@", buf, 0xCu);
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v27 = [v95 layersToTrain];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v108 objects:v125 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v109 != v29) {
            objc_enumerationMutation(v27);
          }
          v31 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          objc_msgSend(v100, "weightsForLayer:", v31, v87, v88, v89);
          int v32 = *(_DWORD *)(__p + 12);
          *(_DWORD *)buf = *(_DWORD *)(__p + 8);
          LODWORD(p_p) = v32;
          int v118 = 1;
          int v117 = 1;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,int &,int &,void>((int *)buf, (int *)&p_p, &v118, &v117, &v106);
          memcpy(*(void **)(v106 + 16), *(const void **)(__p + 16), 4 * *(int *)(v106 + 8) * (uint64_t)*(int *)(v106 + 12));
          id v33 = v31;
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v33 UTF8String]);
          p_p = (long long *)buf;
          v34 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v114, (const void **)buf, (uint64_t)&std::piecewise_construct, &p_p);
          uint64_t v36 = v106;
          v35 = v107;
          if (v107) {
            atomic_fetch_add_explicit(&v107->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v37 = (std::__shared_weak_count *)*((void *)v34 + 8);
          *((void *)v34 + 7) = v36;
          *((void *)v34 + 8) = v35;
          if (v37) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v37);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if (v107) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v107);
          }
          if (*((void *)&__p + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
          }
          [v100 biasesForLayer:v33];
          *(_DWORD *)buf = *(_DWORD *)(__p + 8);
          LODWORD(p_p) = 1;
          int v118 = 1;
          int v117 = 1;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>((int *)buf, (int *)&p_p, &v118, &v117, &v106);
          memcpy(*(void **)(v106 + 16), *(const void **)(__p + 16), 4 * *(int *)(v106 + 8));
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v33 UTF8String]);
          p_p = (long long *)buf;
          v38 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v112, (const void **)buf, (uint64_t)&std::piecewise_construct, &p_p);
          uint64_t v40 = v106;
          v39 = v107;
          if (v107) {
            atomic_fetch_add_explicit(&v107->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v41 = (std::__shared_weak_count *)*((void *)v38 + 8);
          *((void *)v38 + 7) = v40;
          *((void *)v38 + 8) = v39;
          if (v41) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v41);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if (v107) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v107);
          }
          if (*((void *)&__p + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v108 objects:v125 count:16];
      }
      while (v28);
    }

    v92 = [[EvaluationDataSourceEspressoWrapper alloc] initWithEvaluatorDataSource:v95];
    -[EspressoEvaluator averageLossEvaluation:dataWrapper:batchSize:](self, "averageLossEvaluation:dataWrapper:batchSize:", v93, v92, [v95 batchSize]);
    float v43 = v42;
    v44 = (id)sLog;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v43;
      _os_log_impl(&dword_23C9A9000, v44, OS_LOG_TYPE_INFO, "loss before training: %f", buf, 0xCu);
    }

    v45 = (id)sLog;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C9A9000, v45, OS_LOG_TYPE_INFO, "Start training espresso network", buf, 2u);
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v127 = __Block_byref_object_copy_;
    *(void *)&long long v128 = __Block_byref_object_dispose_;
    *((void *)&v128 + 1) = MEMORY[0x263EFFA78];
    uint64_t v46 = [v95 numLocalIterations];
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __59__EspressoEvaluator_evaluateWithModelURL_dataSource_error___block_invoke;
    v105[3] = &unk_264E79D10;
    v105[4] = buf;
    [v93 fit:v92 numberOfEpochs:v46 withProgress:v105];
    int v48 = v47;
    v98 = [MEMORY[0x263EFF980] array];
    v99 = [MEMORY[0x263EFF980] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v49 = [v95 layersToTrain];
    obuint64_t j = v49;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v101 objects:v124 count:16];
    if (v50)
    {
      uint64_t v97 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v102 != v97) {
            objc_enumerationMutation(obj);
          }
          v52 = *(void **)(*((void *)&v101 + 1) + 8 * j);
          v53 = objc_msgSend(MEMORY[0x263EFF980], "array", v87);
          if (v100)
          {
            [v100 weightsForLayer:v52];
          }
          else
          {
            uint64_t v106 = 0;
            v107 = 0;
          }
          id v54 = v52;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v54 UTF8String]);
          p_p = &__p;
          v55 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v114, (const void **)&__p, (uint64_t)&std::piecewise_construct, &p_p);
          uint64_t v57 = *((void *)v55 + 7);
          v58 = (std::__shared_weak_count *)*((void *)v55 + 8);
          if (v58) {
            atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v123 < 0) {
            operator delete((void *)__p);
          }
          uint64_t v59 = v106;
          if (*(int *)(v106 + 12) * (uint64_t)*(int *)(v106 + 8))
          {
            unint64_t v60 = 0;
            do
            {
              *(float *)&double v56 = *(float *)(*(void *)(v59 + 16) + 4 * v60) - *(float *)(*(void *)(v57 + 16) + 4 * v60);
              v61 = [NSNumber numberWithFloat:v56];
              [v53 addObject:v61];

              ++v60;
              uint64_t v59 = v106;
            }
            while (v60 < *(int *)(v106 + 12) * (uint64_t)*(int *)(v106 + 8));
          }
          if (v58) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v58);
          }
          if (v107) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v107);
          }
          if (v100)
          {
            [v100 biasesForLayer:v54];
          }
          else
          {
            uint64_t v106 = 0;
            v107 = 0;
          }
          id v62 = v54;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v62 UTF8String]);
          p_p = &__p;
          v63 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v112, (const void **)&__p, (uint64_t)&std::piecewise_construct, &p_p);
          uint64_t v65 = *((void *)v63 + 7);
          v66 = (std::__shared_weak_count *)*((void *)v63 + 8);
          if (v66) {
            atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v123 < 0) {
            operator delete((void *)__p);
          }
          uint64_t v67 = v106;
          if (*(_DWORD *)(v106 + 8))
          {
            unint64_t v68 = 0;
            do
            {
              *(float *)&double v64 = *(float *)(*(void *)(v67 + 16) + 4 * v68) - *(float *)(*(void *)(v65 + 16) + 4 * v68);
              v69 = [NSNumber numberWithFloat:v64];
              [v53 addObject:v69];

              ++v68;
              uint64_t v67 = v106;
            }
            while (v68 < *(int *)(v106 + 8));
          }
          if (v66) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v66);
          }
          if (v107) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v107);
          }
          [v98 addObject:v53];
          [v99 addObject:v62];
        }
        v49 = obj;
        uint64_t v50 = [obj countByEnumeratingWithState:&v101 objects:v124 count:16];
      }
      while (v50);
    }

    v70 = (id)sLog;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_23C9A9000, v70, OS_LOG_TYPE_INFO, "Finished training espresso network", (uint8_t *)&__p, 2u);
    }

    v71 = [v95 modelOutputName];
    v72 = [(EspressoEvaluator *)self evaluationMetrics:v93 dataWrapper:v92 outputName:v71];
    v73 = (id)sLog;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p) = 138412290;
      *(void *)((char *)&__p + 4) = v72;
      _os_log_impl(&dword_23C9A9000, v73, OS_LOG_TYPE_INFO, "Print out probs: %@", (uint8_t *)&__p, 0xCu);
    }

    -[EspressoEvaluator averageLossEvaluation:dataWrapper:batchSize:](self, "averageLossEvaluation:dataWrapper:batchSize:", v93, v92, [v95 batchSize]);
    float v75 = v74;
    v76 = (id)sLog;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p) = 134217984;
      *(double *)((char *)&__p + 4) = v75;
      _os_log_impl(&dword_23C9A9000, v76, OS_LOG_TYPE_INFO, "loss after training: %f", (uint8_t *)&__p, 0xCu);
    }

    v120[0] = @"LossBeforeTraining";
    *(float *)&double v77 = v43;
    v78 = [NSNumber numberWithFloat:v77];
    v121[0] = v78;
    v120[1] = @"LossAfterTraining";
    *(float *)&double v79 = v75;
    v80 = [NSNumber numberWithFloat:v79];
    v121[1] = v80;
    v120[2] = @"TrainingLoss";
    LODWORD(v81) = v48;
    v82 = [NSNumber numberWithFloat:v81];
    v120[3] = @"UpdatedModelIndices";
    v120[4] = @"ModelDeltas";
    v121[2] = v82;
    v121[3] = v99;
    v120[5] = @"TrainingLosses";
    uint64_t v83 = *(void *)(*(void *)&buf[8] + 40);
    v121[4] = v98;
    v121[5] = v83;
    v120[6] = @"OtherEvaluationMetric";
    v121[6] = v72;
    v84 = [NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:7];

    _Block_object_dispose(buf, 8);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&v112, v113[0]);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&v114, v115[0]);
  }
  else
  {
    v85 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EspressoEvaluator evaluateWithModelURL:dataSource:error:](v85);
    }
    v84 = 0;
    if (a5) {
      *a5 = v89;
    }
  }

  return v84;
}

void __59__EspressoEvaluator_evaluateWithModelURL_dataSource_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_23C9A9000, v7, OS_LOG_TYPE_INFO, "fit: iter=%d metrics=%@", (uint8_t *)v8, 0x12u);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)evaluateWithModelURL:(os_log_t)log dataSource:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C9A9000, log, OS_LOG_TYPE_ERROR, "Failed to compile espresso model", v1, 2u);
}

@end