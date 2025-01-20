@interface VGHRTFSession
- (BOOL)_asyncProcessCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6;
- (BOOL)processCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6;
- (BOOL)waitWithError:(id *)a3;
- (VGHRTFSession)initWithConfig:(id)a3 error:(id *)a4;
- (id).cxx_construct;
@end

@implementation VGHRTFSession

- (VGHRTFSession)initWithConfig:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VGHRTFSession;
  v8 = [(VGHRTFSession *)&v38 init];
  if (v8)
  {
    [v7 overwriteWithDefaults];
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    v10 = __VGLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [*p_config writeDebugData];
      v12 = @"NO";
      if (v11) {
        v12 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_260C8D000, v10, OS_LOG_TYPE_DEBUG, " Write HRTF debug data: %@ ", buf, 0xCu);
    }

    if ([*p_config writeDebugData])
    {
      v13 = [*p_config debugDataRootPath];
      if (!v13)
      {
        v14 = objc_opt_new();
        [v14 setDateFormat:@"yyyyMMdd_HHmmss_SSS"];
        v15 = [MEMORY[0x263EFF910] date];
        v16 = [v14 stringFromDate:v15];

        v13 = [@"/private/var/mobile/Library/Caches/VisageTestApp/HRTF/" stringByAppendingPathComponent:v16];
      }
      v17 = [MEMORY[0x263F08850] defaultManager];
      int v18 = [v17 fileExistsAtPath:v13];

      if (v18)
      {
        NSLog(&cfstr_PathAlreadyExi.isa, v13);

LABEL_23:
        v19 = 0;
        goto LABEL_24;
      }
      v20 = [MEMORY[0x263F08850] defaultManager];
      id v37 = 0;
      [v20 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v37];
      id v21 = v37;

      if (v21)
      {
        v22 = [NSString stringWithFormat:@"Failed to create debug path %@.", v13];
        vg::hrtf::setError(a4, v22);

        goto LABEL_23;
      }
      [*p_config setDebugDataRootPath:v13];
      v23 = __VGLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = [*p_config debugDataRootPath];
        *(_DWORD *)buf = 138412290;
        v40 = v24;
        _os_log_impl(&dword_260C8D000, v23, OS_LOG_TYPE_DEBUG, " Using path for dumping HRTF debug data: %@ ", buf, 0xCu);
      }
    }
    v25 = [[VGHRTFCaptureProcessor alloc] initWithConfig:*p_config error:a4];
    captureProcessor = v8->_captureProcessor;
    v8->_captureProcessor = v25;

    if (v8->_captureProcessor)
    {
      v27 = [[VGHRTFPostProcessor alloc] initWithConfig:*p_config error:a4];
      postProcessor = v8->_postProcessor;
      v8->_postProcessor = v27;

      if (v8->_postProcessor)
      {
        dispatch_queue_t v29 = dispatch_queue_create("com.apple.visage.hrtf.processor", 0);
        processQueue = v8->_processQueue;
        v8->_processQueue = (OS_dispatch_queue *)v29;

        dispatch_group_t v31 = dispatch_group_create();
        processGroup = v8->_processGroup;
        v8->_processGroup = (OS_dispatch_group *)v31;

        dispatch_queue_t v33 = dispatch_queue_create("com.apple.visage.hrtf.timer", 0);
        timerQueue = v8->_timerQueue;
        v8->_timerQueue = (OS_dispatch_queue *)v33;

        atomic_store(0, (unsigned __int8 *)&v8->_processing);
        atomic_store(0, (unsigned __int8 *)&v8->_captureFinished);
        v19 = v8;
        goto LABEL_24;
      }
      v35 = @"Failed to initialize post processor.";
    }
    else
    {
      v35 = @"Failed to initialize capture processor.";
    }
    vg::hrtf::setError(a4, v35);
    goto LABEL_23;
  }
  vg::hrtf::setError(a4, @"Failed to initialize VGHRTFSession.");
  v19 = 0;
LABEL_24:

  return v19;
}

- (BOOL)_asyncProcessCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_captureFinished);
  if (v11)
  {
    BOOL v15 = 1;
  }
  else
  {
    id v12 = [[VGHRTFUpdateData alloc] initEmpty];
    [v12 setStep:0];
    v13 = [(VGHRTFCaptureProcessor *)self->_captureProcessor processCaptureData:v9 faceData:v10 error:a6];
    unint64_t v14 = [v13 state];
    if (v14 >= 2)
    {
      if (v14 == 2)
      {
        [v12 setStep:_os_feature_enabled_impl() ^ 1];
        atomic_store(1u, (unsigned __int8 *)&self->_captureFinished);
      }
    }
    else
    {
      [v12 setStep:v14];
    }
    [v12 setCaptureUpdateData:v13];
    v16 = [(VGHRTFSessionConfig *)self->_config delegate];
    [v16 updateWithData:v12 error:a6];

    unsigned __int8 v17 = atomic_load((unsigned __int8 *)&self->_captureFinished);
    if ((v17 & 1) == 0) {
      goto LABEL_19;
    }
    int v18 = __VGLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_DEBUG, " Capture finished, starting post-processing... ", buf, 2u);
    }

    captureProcessor = self->_captureProcessor;
    self->_captureProcessor = 0;

    v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, (dispatch_queue_t)self->_timerQueue);
    *(void *)buf = 0;
    v35 = buf;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy_;
    objc_super v38 = __Block_byref_object_dispose_;
    id v39 = 0;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __66__VGHRTFSession__asyncProcessCaptureData_faceData_userData_error___block_invoke;
    handler[3] = &unk_2655701A8;
    id v21 = v13;
    id v31 = v21;
    v32 = self;
    dispatch_queue_t v33 = buf;
    dispatch_source_set_event_handler(v20, handler);
    if (a6) {
      *a6 = *((id *)v35 + 5);
    }
    dispatch_source_set_timer(v20, 0, 0x3B9ACA00uLL, 0);
    dispatch_resume(v20);
    v22 = [(VGHRTFPostProcessor *)self->_postProcessor processCaptureUpdateData:v21 error:a6];
    dispatch_suspend(v20);
    dispatch_source_cancel(v20);
    dispatch_resume(v20);
    if (v22)
    {
      id v23 = [[VGHRTFUpdateData alloc] initEmpty];
      [v23 setCaptureUpdateData:v21];
      [v23 setStep:3];
      [v23 setPostProcessUpdateData:v22];
      v24 = [(VGHRTFSessionConfig *)self->_config delegate];
      [v24 updateWithData:v23 error:a6];

      v25 = __VGLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)dispatch_queue_t v29 = 0;
        _os_log_impl(&dword_260C8D000, v25, OS_LOG_TYPE_DEBUG, " Successfully completed post-processing ", v29, 2u);
      }
    }
    else
    {
      v26 = __VGLogSharedInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_queue_t v29 = 0;
        _os_log_impl(&dword_260C8D000, v26, OS_LOG_TYPE_ERROR, " Post-processing failed! ", v29, 2u);
      }

      vg::hrtf::setError(a6, @"Failed to run post-processing.");
      id v23 = [[VGHRTFUpdateData alloc] initEmpty];
      [v23 setCaptureUpdateData:v21];
      [v23 setStep:3];
      v25 = [[VGHRTFPostProcessUpdateData alloc] initEmpty];
      [v25 setState:1];
      [v25 setResult:0];
      [v23 setPostProcessUpdateData:v25];
      v27 = [(VGHRTFSessionConfig *)self->_config delegate];
      [v27 updateWithData:v23 error:a6];
    }
    _Block_object_dispose(buf, 8);

    if (!v22) {
      BOOL v15 = 0;
    }
    else {
LABEL_19:
    }
      BOOL v15 = 1;
  }
  return v15;
}

void __66__VGHRTFSession__asyncProcessCaptureData_faceData_userData_error___block_invoke(void *a1)
{
  id v2 = [[VGHRTFUpdateData alloc] initEmpty];
  [v2 setCaptureUpdateData:a1[4]];
  [v2 setStep:2];
  id v3 = [[VGHRTFPostProcessUpdateData alloc] initEmpty];
  [v3 setState:0];
  [v3 setResult:0];
  [v2 setPostProcessUpdateData:v3];
  v4 = [*(id *)(a1[5] + 8) delegate];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  [v4 updateWithData:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
}

- (BOOL)processCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = atomic_exchange((atomic_uchar *volatile)&self->_processing.__a_.__a_value, 1u);
  if (v13)
  {
    vg::hrtf::setError(a6, @"Dropped this frame while still processing a previous frame.");
  }
  else
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    processQueue = self->_processQueue;
    processGroup = self->_processGroup;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__VGHRTFSession_processCaptureData_faceData_userData_error___block_invoke;
    block[3] = &unk_2655701D0;
    block[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v21 = &v22;
    dispatch_group_async(processGroup, processQueue, block);
    if (a6) {
      *a6 = (id) v23[5];
    }

    _Block_object_dispose(&v22, 8);
  }

  return (v13 & 1) == 0;
}

void __60__VGHRTFSession_processCaptureData_faceData_userData_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  [v2 _asyncProcessCaptureData:v3 faceData:v4 userData:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  atomic_store(0, (unsigned __int8 *)(a1[4] + 56));
}

- (BOOL)waitWithError:(id *)a3
{
  intptr_t v4 = dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    vg::hrtf::setError(a3, @"HRTF session sync failed.");
  }
  return v4 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_processGroup, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_captureProcessor, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 28) = 0;
  return self;
}

@end