@interface PUPickerOnDemandProcessor
- (PUPickerConfiguration)configuration;
- (PUPickerOnDemandProcessor)initWithConfiguration:(id)a3;
- (VCPMediaAnalysisService)service;
- (int)stickerScoringRequestID;
- (void)_performOnDemandStaticStickerScoringProcessingForRecentAssets:(id)a3;
- (void)dealloc;
- (void)performOnDemandProcessingWithCanDisplayUserInterfaceHandler:(id)a3;
- (void)setStickerScoringRequestID:(int)a3;
@end

@implementation PUPickerOnDemandProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setStickerScoringRequestID:(int)a3
{
  self->_stickerScoringRequestID = a3;
}

- (int)stickerScoringRequestID
{
  return self->_stickerScoringRequestID;
}

- (VCPMediaAnalysisService)service
{
  return self->_service;
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)_performOnDemandStaticStickerScoringProcessingForRecentAssets:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUPickerOnDemandProcessor *)self service];
  objc_msgSend(v5, "cancelRequest:", -[PUPickerOnDemandProcessor stickerScoringRequestID](self, "stickerScoringRequestID"));

  v6 = PXSharedUserDefaults();
  uint64_t v7 = [v6 integerForKey:@"PickerStickerScoreOnDemandTarget"];

  if (v7 >= 1) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 100;
  }
  v9 = [(PUPickerOnDemandProcessor *)self service];
  v10 = [(PUPickerOnDemandProcessor *)self configuration];
  v11 = [v10 photoLibrary];
  uint64_t v21 = *MEMORY[0x1E4F74548];
  v12 = [NSNumber numberWithInteger:v8];
  v22[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __91__PUPickerOnDemandProcessor__performOnDemandStaticStickerScoringProcessingForRecentAssets___block_invoke;
  v19 = &unk_1E5F24EF8;
  id v20 = v4;
  id v14 = v4;
  uint64_t v15 = [v9 requestStaticStickerScoringForLibrary:v11 options:v13 completionHandler:&v16];
  -[PUPickerOnDemandProcessor setStickerScoringRequestID:](self, "setStickerScoringRequestID:", v15, v16, v17, v18, v19);
}

void __91__PUPickerOnDemandProcessor__performOnDemandStaticStickerScoringProcessingForRecentAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = PLPickerGetLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      v6 = "Can't complete async on demand static sticker scoring processing with error: %@";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    v6 = "Finished async on demand static sticker scoring processing.";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

- (void)performOnDemandProcessingWithCanDisplayUserInterfaceHandler:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke;
  aBlock[3] = &unk_1E5F2DB98;
  v18 = v19;
  id v5 = v4;
  id v17 = v5;
  v6 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v7 = [(PUPickerOnDemandProcessor *)self configuration];
  os_log_type_t v8 = [v7 generatedFilter];
  int v9 = [v8 containsStickersFilter];

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_2;
    v14[3] = &unk_1E5F2EBA0;
    int v10 = v6;
    id v15 = v10;
    [(PUPickerOnDemandProcessor *)self _performOnDemandStaticStickerScoringProcessingForRecentAssets:v14];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_4;
    v12[3] = &unk_1E5F2EBA0;
    v13 = v10;
    dispatch_after(v11, MEMORY[0x1E4F14428], v12);
  }
  else
  {
    v6[2](v6);
  }

  _Block_object_dispose(v19, 8);
}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    uint64_t v1 = *(void *)(*(void *)(v2 + 40) + 8);
  }
  *(unsigned char *)(v1 + 24) = 0;
  return result;
}

void __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_3;
  block[3] = &unk_1E5F2EBA0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  id v3 = [(PUPickerOnDemandProcessor *)self service];
  objc_msgSend(v3, "cancelRequest:", -[PUPickerOnDemandProcessor stickerScoringRequestID](self, "stickerScoringRequestID"));

  v4.receiver = self;
  v4.super_class = (Class)PUPickerOnDemandProcessor;
  [(PUPickerOnDemandProcessor *)&v4 dealloc];
}

- (PUPickerOnDemandProcessor)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerOnDemandProcessor;
  v6 = [(PUPickerOnDemandProcessor *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F744E8] analysisService];
    service = v6->_service;
    v6->_service = (VCPMediaAnalysisService *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v6;
}

@end