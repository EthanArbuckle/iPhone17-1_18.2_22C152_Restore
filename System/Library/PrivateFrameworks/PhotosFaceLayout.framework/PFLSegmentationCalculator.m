@interface PFLSegmentationCalculator
+ (id)sharedInstance;
- (PFLSegmentationCalculator)init;
- (id)queue_bestSegmentationForAsset:(id)a3 timePositions:(id)a4 error:(id *)a5;
- (void)_queue_segmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5;
- (void)bestSegmentationForAsset:(id)a3 completion:(id)a4;
- (void)bestSegmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5;
@end

@implementation PFLSegmentationCalculator

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PFLSegmentationCalculator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __43__PFLSegmentationCalculator_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PFLSegmentationCalculator)init
{
  v13.receiver = self;
  v13.super_class = (Class)PFLSegmentationCalculator;
  v2 = [(PFLSegmentationCalculator *)&v13 init];
  v3 = v2;
  if (v2)
  {
    segmentationData = v2->_segmentationData;
    v2->_segmentationData = 0;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.photosface.segmentationcalculator.work", v5);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photosface.segmentationcalculator.segmentation", v5);
    segmentationQueue = v3->_segmentationQueue;
    v3->_segmentationQueue = (OS_dispatch_queue *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    segmentationQueueSema = v3->_segmentationQueueSema;
    v3->_segmentationQueueSema = (OS_dispatch_semaphore *)v10;
  }
  return v3;
}

- (void)bestSegmentationForAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke;
  block[3] = &unk_26544BE18;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_2;
  v29[3] = &unk_26544BDF0;
  id v2 = *(id *)(a1 + 48);
  v29[4] = *(void *)(a1 + 32);
  id v30 = v2;
  v3 = (uint64_t (**)(void, void))MEMORY[0x25A2DC550](v29);
  [MEMORY[0x263F5D630] ensureResources];
  v4 = pfl_layout_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v5;
    _os_log_impl(&dword_259336000, v4, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DISPATCHED, seg data == %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v28 = 0;
  id v9 = objc_msgSend(v7, "queue_bestSegmentationForAsset:timePositions:error:", v8, &unk_27072F7E8, &v28);
  id v10 = v28;
  if ((((uint64_t (**)(void, id))v3)[2](v3, v10) & 1) == 0)
  {
    if (v9) {
      [v6 addObject:v9];
    }
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v27 = v10;
    id v13 = objc_msgSend(v11, "queue_bestSegmentationForAsset:timePositions:error:", v12, &unk_27072F800, &v27);
    id v14 = v27;

    if (((uint64_t (**)(void, id))v3)[2](v3, v14))
    {
      id v10 = v14;
      id v9 = v13;
      goto LABEL_26;
    }
    if (v13) {
      [v6 addObject:v13];
    }
    v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v26 = v14;
    v17 = objc_msgSend(v15, "queue_bestSegmentationForAsset:timePositions:error:", v16, &unk_27072F818, &v26);
    id v10 = v26;

    if (((uint64_t (**)(void, id))v3)[2](v3, v10))
    {
      id v9 = v17;
      goto LABEL_26;
    }
    if (v17) {
      [v6 addObject:v17];
    }
    v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    id v25 = v10;
    id v9 = objc_msgSend(v18, "queue_bestSegmentationForAsset:timePositions:error:", v19, &unk_27072F830, &v25);
    id v20 = v25;

    if (((uint64_t (**)(void, id))v3)[2](v3, v20))
    {
      id v10 = v20;
      goto LABEL_26;
    }
    if (v9) {
      [v6 addObject:v9];
    }
    if ([v6 count])
    {
      id v10 = v20;
LABEL_23:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      v22 = pfl_layout_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_259336000, v22, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE", buf, 2u);
      }

      uint64_t v23 = *(void *)(a1 + 32);
      v24 = *(void **)(v23 + 8);
      *(void *)(v23 + 8) = 0;

      [MEMORY[0x263F5D630] freeResources];
      goto LABEL_26;
    }
    v21 = pfl_layout_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_cold_1(v21);
    }

    id v10 = [MEMORY[0x263F087E8] errorWithDomain:0x27072E6A0 code:2 userInfo:0];

    if ((((uint64_t (**)(void, id))v3)[2](v3, v10) & 1) == 0) {
      goto LABEL_23;
    }
  }
LABEL_26:
}

BOOL __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v4 = pfl_layout_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_259336000, v4, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE with error %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;

    [MEMORY[0x263F5D630] freeResources];
  }

  return v3 != 0;
}

- (void)bestSegmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__PFLSegmentationCalculator_bestSegmentationForAsset_timePosition_completion___block_invoke;
  v13[3] = &unk_26544BE40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

void __78__PFLSegmentationCalculator_bestSegmentationForAsset_timePosition_completion___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F5D630] ensureResources];
  id v2 = pfl_layout_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1[4] + 8);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_259336000, v2, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DISPATCHED, seg data == %@", buf, 0xCu);
  }

  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [NSNumber numberWithUnsignedInteger:a1[7]];
  id v14 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v13 = 0;
  id v8 = objc_msgSend(v4, "queue_bestSegmentationForAsset:timePositions:error:", v5, v7, &v13);
  id v9 = v13;

  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v10 = pfl_layout_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259336000, v10, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE", buf, 2u);
  }

  uint64_t v11 = a1[4];
  id v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = 0;

  [MEMORY[0x263F5D630] freeResources];
}

- (id)queue_bestSegmentationForAsset:(id)a3 timePositions:(id)a4 error:(id *)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v46 = a3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = a4;
  uint64_t v47 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v47)
  {
    id v7 = 0;
    uint64_t v44 = *(void *)v59;
    uint64_t v42 = *MEMORY[0x263F5DFD0];
    double v8 = -1.0;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = v7;
      if (*(void *)v59 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v58 + 1) + 8 * v9);
      *(void *)v68 = 0;
      *(void *)&v68[8] = v68;
      *(void *)&v68[16] = 0x3032000000;
      v69 = __Block_byref_object_copy__0;
      v70 = __Block_byref_object_dispose__0;
      id v71 = 0;
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__0;
      v56 = __Block_byref_object_dispose__0;
      id v57 = 0;
      segmentationQueue = self->_segmentationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke;
      block[3] = &unk_26544BE90;
      block[4] = v11;
      void block[5] = self;
      id v13 = v46;
      id v49 = v13;
      v50 = v68;
      v51 = &v52;
      dispatch_async(segmentationQueue, block);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_segmentationQueueSema, 0xFFFFFFFFFFFFFFFFLL);
      id v14 = pfl_layout_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v63 = *(double *)&v11;
        _os_log_impl(&dword_259336000, v14, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset DONE SEGMENTING for %@", buf, 0xCu);
      }

      id v15 = (void *)v53[5];
      if (v15)
      {
        if (a5) {
          *a5 = v15;
        }
        uint64_t v16 = pfl_layout_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_259336000, v16, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset ALL DONE with an error; returning nil layout",
            buf,
            2u);
        }
      }
      else
      {
        uint64_t v17 = pfl_layout_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [(PISegmentationData *)self->_segmentationData scores];
          uint64_t v19 = [v18 objectForKeyedSubscript:v42];
          [v19 floatValue];
          float v21 = v20;
          [*(id *)(*(void *)&v68[8] + 40) visibleRect];
          id v26 = _rectAsString(v22, v23, v24, v25);
          *(_DWORD *)buf = 138412802;
          double v63 = *(double *)&v11;
          __int16 v64 = 2048;
          double v65 = v21;
          __int16 v66 = 2112;
          v67 = v26;
          _os_log_impl(&dword_259336000, v17, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset: score for %@ == %.2f, crop == %@", buf, 0x20u);
        }
        if (!self->_segmentationData) {
          goto LABEL_21;
        }
        id v27 = [PFLLayoutConfiguration alloc];
        int v28 = [v11 intValue];
        uint64_t v16 = [(PFLLayoutConfiguration *)v27 initWithAsset:v13 timePosition:v28 segmentationData:self->_segmentationData coreLayout:*(void *)(*(void *)&v68[8] + 40)];
        [v16 cropScore];
        if (v29 > v8)
        {
          uint64_t v16 = v16;

          [v16 cropScore];
          double v8 = v30;
          v31 = pfl_layout_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            double v63 = v8;
            __int16 v64 = 2112;
            double v65 = *(double *)&v11;
            _os_log_impl(&dword_259336000, v31, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset: top score is now %.2f (%@)", buf, 0x16u);
          }

          uint64_t v10 = v16;
        }
      }

LABEL_21:
      _Block_object_dispose(&v52, 8);

      _Block_object_dispose(v68, 8);
      if (v15)
      {

        uint64_t v32 = 0;
        goto LABEL_30;
      }
      ++v9;
      id v7 = v10;
      if (v47 == v9)
      {
        uint64_t v47 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
        id v7 = v10;
        if (v47) {
          goto LABEL_3;
        }
        goto LABEL_27;
      }
    }
  }
  id v7 = 0;
LABEL_27:
  uint64_t v33 = v7;

  v34 = pfl_layout_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [v33 timePosition];
    [v33 visibleRect];
    v40 = _rectAsString(v36, v37, v38, v39);
    *(_DWORD *)v68 = 134218242;
    *(void *)&v68[4] = v35;
    *(_WORD *)&v68[12] = 2112;
    *(void *)&v68[14] = v40;
    _os_log_impl(&dword_259336000, v34, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset ALL DONE; winner == %ld (%@)",
      v68,
      0x16u);
  }
  uint64_t v10 = v33;
  uint64_t v32 = v10;
LABEL_30:

  return v32;
}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = pfl_layout_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_259336000, v2, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset START SEGMENTING for %@, seg data == %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v7 = (int)[*(id *)(a1 + 32) intValue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_320;
  v11[3] = &unk_26544BE68;
  double v8 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  objc_msgSend(v6, "_queue_segmentationForAsset:timePosition:completion:", v5, v7, v11);
}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_320(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(a1[4] + 8), a2);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a4);
  if (*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    uint64_t v11 = pfl_layout_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_320_cold_1((uint64_t)a1, (uint64_t)(a1 + 8), v11);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 32));
}

- (void)_queue_segmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5
{
  v42[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x263F14F70];
  id v10 = a3;
  uint64_t v11 = (void *)[[v9 alloc] initWithPhotoAsset:v10];

  PFCRectForTimePosition();
  double v16 = flipYNormalizedRect(v12, v13, v14, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = objc_alloc(MEMORY[0x263F5DF38]);
  double v24 = objc_msgSend(v23, "initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:", *MEMORY[0x263F5DEA0], *(double *)(MEMORY[0x263F5DEA0] + 8), v16, v18, v20, v22, *(void *)&v16, *(void *)&v18, *(void *)&v20, *(void *)&v22, *MEMORY[0x263F001B0], *(void *)(MEMORY[0x263F001B0] + 8));
  double v25 = (void *)[objc_alloc(MEMORY[0x263F5DFB8]) initWithPortraitConfiguration:v24 landscapeConfiguration:0];
  id v26 = [[PFLLayoutProvider alloc] initWithTimePosition:a4];
  id v27 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v28 = *MEMORY[0x263F5D7A0];
  v41[0] = *MEMORY[0x263F5D7A8];
  v41[1] = v28;
  v42[0] = v26;
  v42[1] = v25;
  double v29 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  double v30 = [v27 dictionaryWithDictionary:v29];

  segmentationData = self->_segmentationData;
  if (segmentationData) {
    [v30 setObject:segmentationData forKeyedSubscript:*MEMORY[0x263F5D7B0]];
  }
  uint64_t v32 = [[PFLJetsamInfoInterval alloc] initWithLabel:@"loadSegmentationForAsset"];
  uint64_t v33 = (void *)MEMORY[0x263F5D630];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __81__PFLSegmentationCalculator__queue_segmentationForAsset_timePosition_completion___block_invoke;
  v37[3] = &unk_26544BEB8;
  double v38 = v32;
  double v39 = v26;
  id v40 = v8;
  id v34 = v8;
  uint64_t v35 = v26;
  double v36 = v32;
  [v33 loadSegmentationDataForAsset:v11 options:v30 completion:v37];
}

void __81__PFLSegmentationCalculator__queue_segmentationForAsset_timePosition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) logCurrentInterval];
  int v6 = [*(id *)(a1 + 40) resultsAreValid];
  uint64_t v7 = 0;
  if (v8 && v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) watchLayout];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationQueueSema, 0);
  objc_storeStrong((id *)&self->_segmentationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_segmentationData, 0);
}

void __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_259336000, log, OS_LOG_TYPE_ERROR, "PFL: no segmentation errors, but no layouts were generated either!", v1, 2u);
}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_320_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_259336000, log, OS_LOG_TYPE_ERROR, "segmentation error for asset %@, time position %@, error %@", (uint8_t *)&v6, 0x20u);
}

@end