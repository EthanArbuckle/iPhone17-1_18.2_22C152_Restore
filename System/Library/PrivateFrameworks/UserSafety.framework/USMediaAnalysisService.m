@interface USMediaAnalysisService
- (MADService)service;
- (USMediaAnalysisService)init;
- (USMediaAnalysisService)initWithMADService:(id)a3;
- (id)_newImageClassificationRequest;
- (id)_newVideoClassificationRequest;
- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 request:(id)a6;
- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 videoRequest:(id)a6;
- (void)dealloc;
- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)isSensitiveImage:(id)a3 completionHandler:(id)a4;
- (void)isSensitiveImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5;
- (void)isSensitiveVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)isSensitiveVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)setService:(id)a3;
@end

@implementation USMediaAnalysisService

- (USMediaAnalysisService)init
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMADServiceClass_softClass;
  uint64_t v12 = getMADServiceClass_softClass;
  if (!getMADServiceClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMADServiceClass_block_invoke;
    v8[3] = &unk_26556E150;
    v8[4] = &v9;
    __getMADServiceClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  v5 = [v4 service];
  v6 = [(USMediaAnalysisService *)self initWithMADService:v5];

  return v6;
}

- (USMediaAnalysisService)initWithMADService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USMediaAnalysisService;
  v6 = [(USMediaAnalysisService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_service)
  {
    v3 = [(USMediaAnalysisService *)self service];
    [v3 cancelAllRequests];
  }
  v4.receiver = self;
  v4.super_class = (Class)USMediaAnalysisService;
  [(USMediaAnalysisService *)&v4 dealloc];
}

- (void)isSensitiveImage:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = [(USMediaAnalysisService *)self _newImageClassificationRequest];
  v8 = [(USMediaAnalysisService *)self service];
  v24[0] = v17[5];
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__USMediaAnalysisService_isSensitiveImage_completionHandler___block_invoke;
  v13[3] = &unk_26556E100;
  v13[4] = self;
  v15 = &v16;
  id v10 = v7;
  id v14 = v10;
  int v11 = [v8 performRequests:v9 onImageURL:v6 withIdentifier:&stru_270CE3E48 completionHandler:v13];

  uint64_t v12 = +[USLog client];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v23 = v11;
    _os_log_impl(&dword_260B30000, v12, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with imageURL started", buf, 8u);
  }

  _Block_object_dispose(&v16, 8);
}

void __61__USMediaAnalysisService_isSensitiveImage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 0;
  id v5 = [*(id *)(a1 + 32) _processMADResults:&v8 requestID:a2 error:a3 request:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v6 = +[USLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_260B30000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  id v7 = [MEMORY[0x263F17658] sharedInstance];
  [v7 collectMediaAnalysisServiceEvent:1 :v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = [(USMediaAnalysisService *)self _newImageClassificationRequest];
  objc_super v9 = [(USMediaAnalysisService *)self service];
  v25[0] = v18[5];
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__USMediaAnalysisService_isSensitiveCGImage_withOrientation_completionHandler___block_invoke;
  v14[3] = &unk_26556E100;
  v14[4] = self;
  uint64_t v16 = &v17;
  id v11 = v8;
  id v15 = v11;
  int v12 = [v9 performRequests:v10 onCGImage:a3 withOrientation:v5 andIdentifier:&stru_270CE3E48 completionHandler:v14];

  __int16 v13 = +[USLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v24 = v12;
    _os_log_impl(&dword_260B30000, v13, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with cgImage has started", buf, 8u);
  }

  _Block_object_dispose(&v17, 8);
}

void __79__USMediaAnalysisService_isSensitiveCGImage_withOrientation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) _processMADResults:&v8 requestID:a2 error:a3 request:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v6 = +[USLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_260B30000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  id v7 = [MEMORY[0x263F17658] sharedInstance];
  [v7 collectMediaAnalysisServiceEvent:1 :v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isSensitiveVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  v34[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = [(USMediaAnalysisService *)self _newVideoClassificationRequest];
  [(id)v27[5] setRequiresBlastdoor:v8];
  __int16 v13 = [(USMediaAnalysisService *)self service];
  v34[0] = v27[5];
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __94__USMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v23[3] = &unk_26556E128;
  id v15 = v11;
  id v25 = v15;
  id v16 = v10;
  id v24 = v16;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __94__USMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
  v20[3] = &unk_26556E100;
  v20[4] = self;
  id v22 = &v26;
  id v17 = v12;
  id v21 = v17;
  int v18 = [v13 performRequests:v14 videoURL:v16 identifier:&stru_270CE3E48 progressHandler:v23 completionHandler:v20];

  uint64_t v19 = +[USLog client];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v33 = v18;
    _os_log_impl(&dword_260B30000, v19, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with videoURL started", buf, 8u);
  }

  _Block_object_dispose(&v26, 8);
}

uint64_t __94__USMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __94__USMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) _processMADResults:&v8 requestID:a2 error:a3 videoRequest:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v6 = +[USLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_260B30000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  id v7 = [MEMORY[0x263F17658] sharedInstance];
  [v7 collectMediaAnalysisServiceEvent:2 :v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isSensitiveImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  int v23 = __Block_byref_object_dispose_;
  id v24 = [(USMediaAnalysisService *)self _newImageClassificationRequest];
  __int16 v11 = [(USMediaAnalysisService *)self service];
  v27[0] = v20[5];
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__USMediaAnalysisService_isSensitiveImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v16[3] = &unk_26556E100;
  v16[4] = self;
  int v18 = &v19;
  id v13 = v10;
  id v17 = v13;
  int v14 = [v11 performRequests:v12 onAssetWithLocalIdentifier:v8 fromPhotoLibraryWithURL:v9 completionHandler:v16];

  uint64_t v15 = +[USLog client];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v14;
    _os_log_impl(&dword_260B30000, v15, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with Image's LocalIdentifier started", buf, 8u);
  }

  _Block_object_dispose(&v19, 8);
}

void __104__USMediaAnalysisService_isSensitiveImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) _processMADResults:&v8 requestID:a2 error:a3 request:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v6 = +[USLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    int v14 = v5;
    _os_log_impl(&dword_260B30000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  id v7 = [MEMORY[0x263F17658] sharedInstance];
  [v7 collectMediaAnalysisServiceEvent:1 :v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isSensitiveVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  id v31 = __Block_byref_object_dispose_;
  id v32 = [(USMediaAnalysisService *)self _newVideoClassificationRequest];
  int v14 = [(USMediaAnalysisService *)self service];
  v35[0] = v28[5];
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  void v24[2] = __120__USMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v24[3] = &unk_26556E128;
  id v16 = v12;
  id v26 = v16;
  id v17 = v10;
  id v25 = v17;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __120__USMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
  v21[3] = &unk_26556E100;
  v21[4] = self;
  int v23 = &v27;
  id v18 = v13;
  id v22 = v18;
  int v19 = [v14 performRequests:v15 assetLocalIdentifier:v17 photoLibraryURL:v11 progressHandler:v24 completionHandler:v21];

  v20 = +[USLog client];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v34 = v19;
    _os_log_impl(&dword_260B30000, v20, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with video's LocalIdentifier started", buf, 8u);
  }

  _Block_object_dispose(&v27, 8);
}

uint64_t __120__USMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __120__USMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) _processMADResults:&v8 requestID:a2 error:a3 videoRequest:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v6 = +[USLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    int v14 = v5;
    _os_log_impl(&dword_260B30000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  id v7 = [MEMORY[0x263F17658] sharedInstance];
  [v7 collectMediaAnalysisServiceEvent:2 :v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 request:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  __int16 v11 = v10;
  if (v9)
  {
    int v12 = +[USLog client];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[USMediaAnalysisService _processMADResults:requestID:error:request:]((uint64_t)v9, a4);
    }

    uint64_t v13 = USErrorCausedBy(100, @"MADService request has failed with request error", v9);
LABEL_5:
    int v14 = (void *)v13;
    goto LABEL_12;
  }
  uint64_t v15 = [v10 error];

  if (v15)
  {
    id v16 = +[USLog client];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[USMediaAnalysisService _processMADResults:requestID:error:request:]();
    }

    id v17 = [v11 error];
    int v14 = USErrorCausedBy(100, @"MADService request has failed with request error", v17);
  }
  else
  {
    id v18 = [v11 results];
    uint64_t v19 = [v18 count];

    if (v19 != 1)
    {
      int v23 = +[USLog client];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[USMediaAnalysisService _processMADResults:requestID:error:request:]();
      }

      uint64_t v13 = USError(101, @"Unexpected results from MADService");
      goto LABEL_5;
    }
    v20 = [v11 results];
    uint64_t v21 = [v20 firstObject];
    *a3 = [v21 isSensitive];

    int v14 = 0;
  }
LABEL_12:

  return v14;
}

- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 videoRequest:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  __int16 v11 = v10;
  if (v9)
  {
    int v12 = +[USLog client];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[USMediaAnalysisService _processMADResults:requestID:error:videoRequest:]((uint64_t)v9, a4);
    }

    uint64_t v13 = USErrorCausedBy(100, @"MADService video request has failed with request error", v9);
LABEL_5:
    int v14 = (void *)v13;
    goto LABEL_12;
  }
  uint64_t v15 = [v10 error];

  if (v15)
  {
    id v16 = +[USLog client];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[USMediaAnalysisService _processMADResults:requestID:error:videoRequest:]();
    }

    id v17 = [v11 error];
    int v14 = USErrorCausedBy(100, @"MADService video request has failed with request error", v17);
  }
  else
  {
    id v18 = [v11 results];
    uint64_t v19 = [v18 count];

    if (v19 != 1)
    {
      int v23 = +[USLog client];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[USMediaAnalysisService _processMADResults:requestID:error:videoRequest:]();
      }

      uint64_t v13 = USError(101, @"Unexpected video results from MADService");
      goto LABEL_5;
    }
    v20 = [v11 results];
    uint64_t v21 = [v20 firstObject];
    *a3 = [v21 isSensitive];

    int v14 = 0;
  }
LABEL_12:

  return v14;
}

- (id)_newImageClassificationRequest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getMADImageSafetyClassificationRequestClass_softClass;
  uint64_t v9 = getMADImageSafetyClassificationRequestClass_softClass;
  if (!getMADImageSafetyClassificationRequestClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getMADImageSafetyClassificationRequestClass_block_invoke;
    v5[3] = &unk_26556E150;
    v5[4] = &v6;
    __getMADImageSafetyClassificationRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  int v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (id)_newVideoClassificationRequest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getMADVideoSafetyClassificationRequestClass_softClass;
  uint64_t v9 = getMADVideoSafetyClassificationRequestClass_softClass;
  if (!getMADVideoSafetyClassificationRequestClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getMADVideoSafetyClassificationRequestClass_block_invoke;
    v5[3] = &unk_26556E150;
    v5[4] = &v6;
    __getMADVideoSafetyClassificationRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  int v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (MADService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_processMADResults:requestID:error:request:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v1 = [v0 results];
  [v1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_260B30000, v2, v3, "MAD request(%d) returns unexpected number of results %lu", v4, v5, v6, v7, v8);
}

- (void)_processMADResults:requestID:error:request:.cold.2()
{
  OUTLINED_FUNCTION_3();
  v1 = [v0 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260B30000, v2, v3, "MAD request(%d) returns error: %@", v4, v5, v6, v7, 2u);
}

- (void)_processMADResults:(uint64_t)a1 requestID:(int)a2 error:request:.cold.3(uint64_t a1, int a2)
{
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a2;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_260B30000, v2, v3, "MAD request(%d) failed with error: %@", v4);
}

- (void)_processMADResults:requestID:error:videoRequest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v1 = [v0 results];
  [v1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_260B30000, v2, v3, "MAD video request(%d) returns unexpected number of results %lu", v4, v5, v6, v7, v8);
}

- (void)_processMADResults:requestID:error:videoRequest:.cold.2()
{
  OUTLINED_FUNCTION_3();
  v1 = [v0 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260B30000, v2, v3, "MAD video request(%d) returns error: %@", v4, v5, v6, v7, 2u);
}

- (void)_processMADResults:(uint64_t)a1 requestID:(int)a2 error:videoRequest:.cold.3(uint64_t a1, int a2)
{
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a2;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_260B30000, v2, v3, "MAD video request(%d) failed with error: %@", v4);
}

@end