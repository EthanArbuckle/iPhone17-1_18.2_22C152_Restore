@interface VKCRemoveBackgroundRequestHandler
+ (double)maxAspectRatio;
+ (double)maxLength;
+ (double)maxResolution;
+ (double)minAspectRatio;
- (BOOL)isValidRequest:(id)a3 error:(id *)a4;
- (VKCRemoveBackgroundRequestHandler)init;
- (void)_didEndForRequest:(uint64_t)a1;
- (void)_willBeginForRequest:(uint64_t)a1;
- (void)cancelAllRequests;
- (void)cancelRequest:(id)a3;
- (void)performRequest:(id)a3 completion:(id)a4;
@end

@implementation VKCRemoveBackgroundRequestHandler

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

- (VKCRemoveBackgroundRequestHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKCRemoveBackgroundRequestHandler;
  v2 = [(VKCRemoveBackgroundRequestHandler *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74680] service];
    service = v2->_service;
    v2->_service = (MADService *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v7 = dispatch_queue_create("VKCRemoveBackgroundRequestHandlerQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (BOOL)isValidRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 photosRequest];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    [v5 size];
    BOOL v7 = vk_cgImageRemoveBackgroundIsValidSize(a4, v8, v9);
  }

  return v7;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, id))a4;
  if ((vk_deviceSupportsRemoveBackground() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VisionKit.RemoveBackground" code:-8 userInfo:0];
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VKCRemoveBackgroundRequestHandler performRequest:completion:]((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_8;
  }
  id v31 = 0;
  BOOL v8 = [(VKCRemoveBackgroundRequestHandler *)self isValidRequest:v6 error:&v31];
  id v9 = v31;
  if (!v8)
  {
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VKCRemoveBackgroundRequestHandler performRequest:completion:]((uint64_t)v9, v13, v20, v21, v22, v23, v24, v25);
    }
LABEL_8:

    v7[2](v7, 0, v9);
    goto LABEL_9;
  }
  -[VKCRemoveBackgroundRequestHandler _willBeginForRequest:]((uint64_t)self, v6);
  objc_super v10 = self->_service;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke;
  block[3] = &unk_1E6BF35C0;
  id v27 = v6;
  v28 = self;
  v29 = v10;
  v30 = v7;
  v12 = v10;
  dispatch_async(queue, block);

LABEL_9:
}

- (void)_willBeginForRequest:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    int v5 = [v3 maskOnly];
    id v6 = _VKSignpostLog();
    BOOL v7 = os_signpost_enabled(v6);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB266000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Mask Request", (const char *)&unk_1DB3491BE, buf, 2u);
      }

      BOOL v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v13 = 0;
      id v9 = "Signpost Begin: \"VisionKit Remove Background Mask Request\"";
      objc_super v10 = (uint8_t *)&v13;
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB266000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Request", (const char *)&unk_1DB3491BE, v12, 2u);
      }

      BOOL v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v11 = 0;
      id v9 = "Signpost Begin: \"VisionKit Remove Background Request\"";
      objc_super v10 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_12:
  }
}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Beginning RemoveBGRequest: %@", buf, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) createMADRequest];
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) pixelBuffer];
    BOOL v7 = [*(id *)(a1 + 32) photosRequest];
    BOOL v8 = [*(id *)(a1 + 32) identifier];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_5;
    v27[3] = &unk_1E6BF3598;
    id v10 = v9;
    id v28 = v10;
    id v11 = v4;
    id v29 = v11;
    id v30 = *(id *)(a1 + 32);
    v26 = v5;
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 40);
    id v31 = v12;
    uint64_t v32 = v13;
    id v33 = *(id *)(a1 + 56);
    uint64_t v14 = (void *)MEMORY[0x1E018E600](v27);
    uint64_t v15 = *(void **)(a1 + 48);
    if (v6)
    {
      id v35 = v11;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      objc_msgSend(*(id *)(a1 + 32), "setMADRequestID:", objc_msgSend(v15, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v16, v6, 0, v8, v14));
    }
    else
    {
      id v34 = v11;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      uint64_t v24 = [v7 localIdentifier];
      uint64_t v25 = [v7 URL];
      objc_msgSend(*(id *)(a1 + 32), "setMADRequestID:", objc_msgSend(v15, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v16, v24, v25, v14));
    }
    int v5 = v26;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VisionKit.RemoveBackground" code:-9 userInfo:0];
    uint64_t v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_cold_1((uint64_t)v7, v17, v18, v19, v20, v21, v22, v23);
    }

    -[VKCRemoveBackgroundRequestHandler _didEndForRequest:](*(void *)(a1 + 40), *(void **)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v7 = v6;

  uint64_t v8 = objc_opt_class();
  id v9 = [*(id *)(a1 + 40) results];
  id v10 = [v9 firstObject];
  id v11 = VKDynamicCast(v8, (uint64_t)v10);

  if (!v4)
  {
    id v4 = [*(id *)(a1 + 40) error];

    if (v4)
    {
      id v4 = [*(id *)(a1 + 40) error];
    }
  }
  int v12 = [*(id *)(a1 + 48) MADRequestID];
  [*(id *)(a1 + 48) setMADRequestID:0xFFFFFFFFLL];
  uint64_t v13 = 0;
  if (v11 && !v4) {
    uint64_t v13 = [[VKCRemoveBackgroundResult alloc] initWithMADResult:v11 request:*(void *)(a1 + 48)];
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
  uint64_t v16 = v15;

  uint64_t v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = 134218754;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    int v26 = v12;
    _os_log_impl(&dword_1DB266000, v17, OS_LOG_TYPE_DEFAULT, "RemoveBG request completed with duration: %f\n madDuration: %f\n%@\n MadID: %d", (uint8_t *)&v19, 0x26u);
  }

  -[VKCRemoveBackgroundRequestHandler _didEndForRequest:](*(void *)(a1 + 64), *(void **)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_didEndForRequest:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    int v5 = [v3 maskOnly];
    uint64_t v6 = _VKSignpostLog();
    BOOL v7 = os_signpost_enabled(v6);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB266000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Mask Request", (const char *)&unk_1DB3491BE, buf, 2u);
      }

      uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v13 = 0;
      id v9 = "Signpost End: \"VisionKit Remove Background Mask Request\"";
      id v10 = (uint8_t *)&v13;
    }
    else
    {
      if (v7)
      {
        *(_WORD *)int v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB266000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Request", (const char *)&unk_1DB3491BE, v12, 2u);
      }

      uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v11 = 0;
      id v9 = "Signpost End: \"VisionKit Remove Background Request\"";
      id v10 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_12:
  }
}

- (void)cancelRequest:(id)a3
{
  service = self->_service;
  uint64_t v4 = [a3 MADRequestID];
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

- (void)performRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end