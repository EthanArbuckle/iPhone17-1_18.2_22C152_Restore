@interface VKCRemoveBackgroundVideoRequestHandler
+ (double)maxAspectRatio;
+ (double)maxLength;
+ (double)maxResolution;
+ (double)minAspectRatio;
- (BOOL)isValidRequest:(id)a3 error:(id *)a4;
- (VKCRemoveBackgroundVideoRequestHandler)init;
- (void)_didEndForRequest:(uint64_t)a1;
- (void)_willBeginForRequest:(uint64_t)a1;
- (void)cancelAllRequests;
- (void)cancelRequest:(id)a3;
- (void)performRequest:(id)a3 previewResultAvailable:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation VKCRemoveBackgroundVideoRequestHandler

+ (double)maxResolution
{
  return 12582912.0;
}

+ (double)maxLength
{
  return 16000.0;
}

+ (double)minAspectRatio
{
  return 0.2;
}

+ (double)maxAspectRatio
{
  return 5.0;
}

- (VKCRemoveBackgroundVideoRequestHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKCRemoveBackgroundVideoRequestHandler;
  v2 = [(VKCRemoveBackgroundVideoRequestHandler *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74680] service];
    service = v2->_service;
    v2->_service = (MADService *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v7 = dispatch_queue_create("VKCRemoveBackgroundVideoRequestHandlerQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (BOOL)isValidRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)performRequest:(id)a3 previewResultAvailable:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (vk_deviceSupportsRemoveBackground())
  {
    id v39 = 0;
    BOOL v14 = [(VKCRemoveBackgroundVideoRequestHandler *)self isValidRequest:v10 error:&v39];
    id v15 = v39;
    if (v14)
    {
      -[VKCRemoveBackgroundVideoRequestHandler _willBeginForRequest:]((uint64_t)self);
      v16 = self->_service;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke;
      block[3] = &unk_1E6BF2870;
      id v33 = v10;
      v34 = self;
      id v36 = v13;
      id v37 = v12;
      id v38 = v11;
      v35 = v16;
      v18 = v16;
      dispatch_async(queue, block);

      goto LABEL_12;
    }
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:]((uint64_t)v15, v19, v26, v27, v28, v29, v30, v31);
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VisionKit.RemoveBackground" code:-8 userInfo:0];
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:]((uint64_t)v15, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  if (v13) {
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
  }
LABEL_12:
}

- (void)_willBeginForRequest:(uint64_t)a1
{
  if (a1)
  {
    v1 = _VKSignpostLog();
    if (os_signpost_enabled(v1))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB266000, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Movie Request", (const char *)&unk_1DB3491BE, buf, 2u);
    }

    v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit Remove Background Movie Request\"", v3, 2u);
    }
  }
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Beginning RemoveBGVideoRequest: %@", (uint8_t *)&buf, 0xCu);
  }

  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v27 = [*(id *)(a1 + 32) createMADRequest];
  [v4 addObject:v27];
  v5 = [*(id *)(a1 + 32) createMADPreviewRequest];
  objc_msgSend(v4, "vk_addNonNilObject:", v5);
  uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
  if ([v4 count])
  {
    v6 = [*(id *)(a1 + 32) photosRequest];
    dispatch_queue_t v7 = [MEMORY[0x1E4F1C9C8] date];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__8;
    v45 = __Block_byref_object_dispose__8;
    id v46 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_40;
    v34[3] = &unk_1E6BF27F8;
    id v25 = v7;
    id v35 = v25;
    id v36 = v27;
    p_long long buf = &buf;
    id v37 = *(id *)(a1 + 32);
    id v8 = v26;
    uint64_t v9 = *(void *)(a1 + 40);
    id v38 = v8;
    uint64_t v39 = v9;
    id v40 = *(id *)(a1 + 56);
    id v10 = (void *)MEMORY[0x1E018E600](v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_44;
    v32[3] = &unk_1E6BF2820;
    id v33 = *(id *)(a1 + 64);
    id v11 = (void *)MEMORY[0x1E018E600](v32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2;
    v28[3] = &unk_1E6BF2848;
    id v29 = v5;
    uint64_t v31 = &buf;
    id v30 = *(id *)(a1 + 72);
    id v12 = (void *)MEMORY[0x1E018E600](v28);
    id v13 = *(void **)(a1 + 48);
    BOOL v14 = [v6 localIdentifier];
    id v15 = [v6 URL];
    objc_msgSend(*(id *)(a1 + 32), "setMadRequestID:", objc_msgSend(v13, "performRequests:assetLocalIdentifier:photoLibraryURL:progressHandler:resultHandler:completionHandler:", v4, v14, v15, v11, v12, v10));

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VisionKit.RemoveBackground" code:-9 userInfo:0];
    v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_cold_1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);
    }

    -[VKCRemoveBackgroundVideoRequestHandler _didEndForRequest:](*(void *)(a1 + 40));
    uint64_t v23 = *(void *)(a1 + 72);
    if (v23) {
      (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
    }
    uint64_t v24 = *(void *)(a1 + 56);
    if (v24) {
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v6);
    }
  }
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v7 = v6;

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [*(id *)(a1 + 40) results];
  id v10 = [v9 firstObject];
  id v11 = VKCheckedDynamicCast(v8, (uint64_t)v10);

  if (!v4)
  {
    id v12 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v12) {
      id v4 = v12;
    }
    else {
      id v4 = 0;
    }
  }
  int v13 = [*(id *)(a1 + 48) madRequestID];
  [*(id *)(a1 + 48) setMadRequestID:0xFFFFFFFFLL];
  BOOL v14 = 0;
  if (v11 && !v4) {
    BOOL v14 = [[VKCRemoveBackgroundVideoResult alloc] initWithMADVideoResult:v11 request:*(void *)(a1 + 48)];
  }
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
  uint64_t v17 = v16;

  uint64_t v18 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 48);
    int v21 = 134218754;
    uint64_t v22 = v17;
    __int16 v23 = 2048;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v19;
    __int16 v27 = 1024;
    int v28 = v13;
    _os_log_impl(&dword_1DB266000, v18, OS_LOG_TYPE_DEFAULT, "RemoveBG video request completed with duration: %f\n madDuration: %f\n%@\n MadID: %d", (uint8_t *)&v21, 0x26u);
  }

  -[VKCRemoveBackgroundVideoRequestHandler _didEndForRequest:](*(void *)(a1 + 64));
  uint64_t v20 = *(void *)(a1 + 72);
  if (v20) {
    (*(void (**)(uint64_t, VKCRemoveBackgroundVideoResult *, id))(v20 + 16))(v20, v14, v4);
  }
}

- (void)_didEndForRequest:(uint64_t)a1
{
  if (a1)
  {
    v1 = _VKSignpostLog();
    if (os_signpost_enabled(v1))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB266000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Movie Request", (const char *)&unk_1DB3491BE, buf, 2u);
    }

    v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_INFO, "Signpost End: \"VisionKit Remove Background Movie Request\"", v3, 2u);
    }
  }
}

uint64_t __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_44(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a2);
  }
  return result;
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if ((id)a1[4] == v4)
  {
    uint64_t v6 = [v4 error];
    uint64_t v7 = [v5 error];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
      uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2_cold_1((uint64_t)(a1 + 6), v8, v9, v10, v11, v12, v13, v14);
      }
    }
    id v15 = [VKCRemoveBackgroundVideoPreviewResult alloc];
    uint64_t v16 = [v5 result];
    uint64_t v17 = [(VKCRemoveBackgroundVideoPreviewResult *)v15 initWithMADVideoPreviewResult:v16 error:v6];

    uint64_t v18 = a1[5];
    if (v18) {
      (*(void (**)(uint64_t, VKCRemoveBackgroundVideoPreviewResult *))(v18 + 16))(v18, v17);
    }
  }
}

- (void)cancelRequest:(id)a3
{
  service = self->_service;
  uint64_t v4 = [a3 madRequestID];
  [(MADService *)service cancelRequestID:v4];
}

- (void)cancelAllRequests
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)performRequest:(uint64_t)a3 previewResultAvailable:(uint64_t)a4 progress:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performRequest:(uint64_t)a3 previewResultAvailable:(uint64_t)a4 progress:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end