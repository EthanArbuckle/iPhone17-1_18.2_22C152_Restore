@interface PUVideoEditPluginDataSource
- (BOOL)allowsRevertInSession;
- (BOOL)editPluginSessionCanRevertToOriginal:(id)a3;
- (PHAsset)videoAsset;
- (PUVideoEditPluginDataSource)init;
- (PUVideoEditPluginDataSource)initWithVideoAsset:(id)a3;
- (void)_fetchCanRevertAsset:(id)a3 asynchronously:(BOOL)a4 handler:(id)a5;
- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4;
- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6;
- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5;
- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 revertToOriginalWithCompletionHandler:(id)a4;
- (void)setAllowsRevertInSession:(BOOL)a3;
- (void)setVideoAsset:(id)a3;
@end

@implementation PUVideoEditPluginDataSource

- (void).cxx_destruct
{
}

- (void)setAllowsRevertInSession:(BOOL)a3
{
  self->_allowsRevertInSession = a3;
}

- (BOOL)allowsRevertInSession
{
  return self->_allowsRevertInSession;
}

- (void)setVideoAsset:(id)a3
{
}

- (PHAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)_fetchCanRevertAsset:(id)a3 asynchronously:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUVideoEditPluginDataSource.m", 210, @"Invalid parameter not satisfying: %@", @"handler != NULL" object file lineNumber description];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  char v24 = [v9 hasAdjustments];
  v11 = dispatch_group_create();
  if (*((unsigned char *)v22 + 24) && [v9 isHighFrameRateVideo])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v12 setVersion:16];
    dispatch_group_enter(v11);
    v13 = [MEMORY[0x1E4F390D0] defaultManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke;
    v18[3] = &unk_1E5F2DB70;
    v20 = &v21;
    v19 = v11;
    objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v18, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke_2;
    block[3] = &unk_1E5F2DB98;
    id v16 = v10;
    v17 = &v21;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);
  }
  else
  {
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    (*((void (**)(id, void))v10 + 2))(v10, *((unsigned __int8 *)v22 + 24));
  }

  _Block_object_dispose(&v21, 8);
}

void __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39360]];
  id v4 = objc_alloc(MEMORY[0x1E4F8CE18]);
  v5 = [v9 formatIdentifier];
  BOOL v6 = [v9 formatVersion];
  v7 = [v9 data];
  v8 = (void *)[v4 initWithFormatIdentifier:v5 formatVersion:v6 data:v7 baseVersion:0 editorBundleID:0 renderTypes:0];

  if ([v8 isRecognizedFormat]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)editPluginSession:(id)a3 revertToOriginalWithCompletionHandler:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(PUVideoEditPluginDataSource *)self videoAsset];
  v7 = [v6 photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5F2DB20;
  id v11 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performChanges:v12 completionHandler:v10];
}

void __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v1 revertAssetContentToOriginal];
}

void __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5F2EA60;
    id v8 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)editPluginSessionCanRevertToOriginal:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if ([(PUVideoEditPluginDataSource *)self allowsRevertInSession])
  {
    id v5 = [(PUVideoEditPluginDataSource *)self videoAsset];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PUVideoEditPluginDataSource_editPluginSessionCanRevertToOriginal___block_invoke;
    v8[3] = &unk_1E5F2DB48;
    v8[4] = &v9;
    [(PUVideoEditPluginDataSource *)self _fetchCanRevertAsset:v5 asynchronously:0 handler:v8];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __68__PUVideoEditPluginDataSource_editPluginSessionCanRevertToOriginal___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [a3 adjustmentType];
  if (v10 <= 2) {
    [v8 setBaseVersion:qword_1AEFF85D8[v10]];
  }
  uint64_t v11 = [(PUVideoEditPluginDataSource *)self videoAsset];
  char v12 = [v11 photoLibrary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E5F2ECC8;
  id v19 = v11;
  id v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E5F2DB20;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  [v12 performChanges:v18 completionHandler:v16];
}

void __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v2 setContentEditingOutput:*(void *)(a1 + 40)];
}

void __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5F2EA60;
    id v8 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F15758];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E5F2DAF8;
  id v9 = v5;
  id v7 = v5;
  [a3 requestExportSessionWithExportPreset:v6 resultHandler:v8];
}

void __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];

    uint64_t v6 = [NSString stringWithFormat:@"RenderedContent-%@.MOV", v5];
    id v7 = NSTemporaryDirectory();
    id v8 = [v7 stringByAppendingPathComponent:v6];

    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    [v3 setOutputFileType:*MEMORY[0x1E4F15AB0]];
    [v3 setOutputURL:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E5F2EBC8;
    id v13 = v3;
    id v10 = *(id *)(a1 + 32);
    id v14 = v9;
    id v15 = v10;
    id v11 = v9;
    [v13 exportAsynchronouslyWithCompletionHandler:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) status] == 4)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Rendering video failed";
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = (__CFString **)v12;
    uint64_t v6 = &v11;
  }
  else
  {
    if ([*(id *)(a1 + 32) status] != 5) {
      goto LABEL_7;
    }
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F281F8];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    id v10 = @"Rendering video cancelled";
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = &v10;
    uint64_t v6 = &v9;
  }
  id v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:1];
  id v8 = [v2 errorWithDomain:v3 code:2047 userInfo:v7];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id, void))a6;
  char v12 = (objc_class *)MEMORY[0x1E4F8CE18];
  id v13 = a4;
  id v14 = [v12 alloc];
  id v15 = [v13 formatIdentifier];
  id v16 = [v13 formatVersion];
  id v17 = [v13 data];

  v18 = (void *)[v14 initWithFormatIdentifier:v15 formatVersion:v16 data:v17 baseVersion:0 editorBundleID:0 renderTypes:0];
  if (a5 || ([v18 isRecognizedFormat] & 1) == 0)
  {
    v11[2](v11, v10, 0);
  }
  else
  {
    id v19 = [MEMORY[0x1E4F166C8] assetWithURL:v10];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v19 videoAdjustments:v18];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __117__PUVideoEditPluginDataSource__requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v21[3] = &unk_1E5F2DAA8;
    v22 = v11;
    [(PUVideoEditPluginDataSource *)self _renderTemporaryVideoForObjectBuilder:v20 resultHandler:v21];
  }
}

uint64_t __117__PUVideoEditPluginDataSource__requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUVideoEditPluginDataSource.m", 64, @"Invalid parameter not satisfying: %@", @"loadHandler" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F39348]);
  uint64_t v10 = [v7 adjustmentType];
  if (v10 != 2)
  {
    uint64_t v11 = v10;
    if (v10 == 1)
    {
      char v12 = 1;
      goto LABEL_8;
    }
    if (v10)
    {
      char v12 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v11 = 0;
  char v12 = 0;
LABEL_8:
  [v9 setVersion:v11];
LABEL_10:
  id v13 = [MEMORY[0x1E4F390D0] defaultManager];
  id v14 = [(PUVideoEditPluginDataSource *)self videoAsset];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke;
  v17[3] = &unk_1E5F2DAD0;
  id v18 = v8;
  SEL v19 = a2;
  char v20 = v12;
  v17[4] = self;
  id v15 = v8;
  [v13 requestURLForVideo:v14 options:v9 resultHandler:v17];
}

void __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"PUVideoEditPluginDataSource.m" lineNumber:82 description:@"missing URL"];
  }
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39360]];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke_2;
  v11[3] = &unk_1E5F2DAA8;
  id v9 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  [v9 _requestRenderedVideoForVideoURL:v5 adjustmentData:v7 canHandleAdjustmentData:v8 resultHandler:v11];
}

void __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    NSLog(&cfstr_Error_2.isa, a3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v9 = fmax(v7, v8);
  [v6 scale];
  double v11 = v10 * v9;
  id v12 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v12 setResizeMode:1];
  [v12 setDeliveryMode:1];
  id v13 = [MEMORY[0x1E4F390D0] defaultManager];
  id v14 = [(PUVideoEditPluginDataSource *)self videoAsset];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PUVideoEditPluginDataSource_editPluginSession_loadPlaceholderImageWithHandler___block_invoke;
  v16[3] = &unk_1E5F2DA80;
  id v17 = v5;
  id v15 = v5;
  objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, 0, v12, v16, v11, v11);
}

uint64_t __81__PUVideoEditPluginDataSource_editPluginSession_loadPlaceholderImageWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(PUVideoEditPluginDataSource *)self videoAsset];
  id v7 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v7 setVersion:16];
  double v8 = [MEMORY[0x1E4F390D0] defaultManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __79__PUVideoEditPluginDataSource_editPluginSession_loadAdjustmentDataWithHandler___block_invoke;
  v12[3] = &unk_1E5F2DA80;
  id v13 = v5;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v11 = v5;
  objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v6, 0, v7, v12, v9, v10);
}

void __79__PUVideoEditPluginDataSource_editPluginSession_loadAdjustmentDataWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39360]];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PUVideoEditPluginDataSource)initWithVideoAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUVideoEditPluginDataSource;
  id v6 = [(PUVideoEditPluginDataSource *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoAsset, a3);
    [(PUVideoEditPluginDataSource *)v7 setAllowsRevertInSession:0];
  }

  return v7;
}

- (PUVideoEditPluginDataSource)init
{
  return [(PUVideoEditPluginDataSource *)self initWithVideoAsset:0];
}

@end