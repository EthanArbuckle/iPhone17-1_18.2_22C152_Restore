@interface PUVideoExportNode
- (CGSize)renderedVideoSize;
- (NSProgress)exportProgress;
- (NSString)livePhotoPairingIdentifier;
- (NSURL)videoURL;
- (PICompositionController)compositionController;
- (PUImageInfoNode)imageInfoNode;
- (PUVideoExportNode)initWithVideoURLNode:(id)a3 imageURLNode:(id)a4 quality:(unint64_t)a5 livePhotoPairingIdentifier:(id)a6 compositionController:(id)a7;
- (PUVideoURLNode)videoURLNode;
- (double)progress;
- (id)_editSource;
- (id)_exportPresetName;
- (id)_newOutputURL;
- (unint64_t)quality;
- (void)_handleExportCompletedWithSuccess:(BOOL)a3 editedSize:(CGSize)a4 error:(id)a5;
- (void)didCancel;
- (void)run;
- (void)setExportProgress:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PUVideoExportNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportProgress, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_imageInfoNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
}

- (void)setExportProgress:(id)a3
{
}

- (NSProgress)exportProgress
{
  return self->_exportProgress;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (PUImageInfoNode)imageInfoNode
{
  return self->_imageInfoNode;
}

- (PUVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (CGSize)renderedVideoSize
{
  double width = self->_renderedVideoSize.width;
  double height = self->_renderedVideoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_handleExportCompletedWithSuccess:(BOOL)a3 editedSize:(CGSize)a4 error:(id)a5
{
  self->_renderedVideoSize = a4;
  [(PXRunNode *)self completeWithError:a5];
}

- (void)didCancel
{
  id v2 = [(PUVideoExportNode *)self exportProgress];
  [v2 cancel];
}

- (double)progress
{
  id v2 = [(PUVideoExportNode *)self exportProgress];
  [v2 fractionCompleted];
  double v4 = v3;

  return v4;
}

- (void)run
{
  self->_renderedVideoSize = (CGSize)*MEMORY[0x1E4F1DB30];
  double v3 = [(PUVideoExportNode *)self _editSource];
  if (v3
    && ([(PUVideoExportNode *)self compositionController],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v3 renderPriority:2];
    v6 = [(PUVideoExportNode *)self compositionController];
    [v5 setCompositionController:v6];

    v7 = [(PUVideoExportNode *)self _newOutputURL];
    videoURL = self->_videoURL;
    self->_videoURL = v7;

    v9 = [(PUVideoExportNode *)self _exportPresetName];
    objc_initWeak(&location, self);
    v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = self->_videoURL;
    livePhotoPairingIdentifier = self->_livePhotoPairingIdentifier;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __24__PUVideoExportNode_run__block_invoke;
    v18 = &unk_1E5F2E010;
    id v13 = v10;
    id v19 = v13;
    v20 = self;
    objc_copyWeak(&v21, &location);
    v14 = [v5 exportVideoToURL:v11 preset:v9 livePhotoPairingIdentifier:livePhotoPairingIdentifier completion:&v15];
    -[PUVideoExportNode setExportProgress:](self, "setExportProgress:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXRunNode *)self cancel];
  }
}

void __24__PUVideoExportNode_run__block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:*(void *)(a1 + 32)];
  v12 = v11;

  id v13 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    v18 = v12;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "PUVideoExportNode render time: %f sec", (uint8_t *)&v17, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    v14 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [*(id *)(a1 + 40) compositionController];
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Error exporting the video for compositionController:%@\n%@", (uint8_t *)&v17, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleExportCompletedWithSuccess:editedSize:error:", a2, v9, a4, a5);
}

- (id)_editSource
{
  double v3 = [(PUVideoURLNode *)self->_videoURLNode videoURL];
  if (v3)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F8AC88]) initWithVideoURL:v3];
    v5 = [(PUImageInfoNode *)self->_imageInfoNode imageDataURL];
    if (v5 && self->_livePhotoPairingIdentifier)
    {
      v6 = [(PUImageInfoNode *)self->_imageInfoNode imageDataUTI];
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F8AA68]) initWithURL:v5 type:v6 image:0 useEmbeddedPreview:0];
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F8A918]) initWithPhotoSource:v7 videoComplement:v4];
    }
    else
    {
      id v8 = v4;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_newOutputURL
{
  id v2 = [MEMORY[0x1E4F29128] UUID];
  double v3 = [v2 UUIDString];
  double v4 = [v3 stringByAppendingPathExtension:@"mov"];

  v5 = NSTemporaryDirectory();
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];

  return v7;
}

- (id)_exportPresetName
{
  unint64_t v2 = [(PUVideoExportNode *)self quality];
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = **((id **)&unk_1E5F2E030 + v2);
  }
  return v3;
}

- (PUVideoExportNode)initWithVideoURLNode:(id)a3 imageURLNode:(id)a4 quality:(unint64_t)a5 livePhotoPairingIdentifier:(id)a6 compositionController:(id)a7
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v15)
    {
LABEL_3:
      v30[0] = v14;
      v30[1] = v15;
      v18 = (void *)MEMORY[0x1E4F1C978];
      __int16 v19 = (id *)v30;
      uint64_t v20 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUVideoRenderNodes.m", 38, @"Invalid parameter not satisfying: %@", @"videoNode != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  id v29 = v14;
  v18 = (void *)MEMORY[0x1E4F1C978];
  __int16 v19 = &v29;
  uint64_t v20 = 1;
LABEL_6:
  uint64_t v21 = [v18 arrayWithObjects:v19 count:v20];
  v28.receiver = self;
  v28.super_class = (Class)PUVideoExportNode;
  v22 = [(PXRunNode *)&v28 initWithDependencies:v21];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_videoURLNode, a3);
    objc_storeStrong((id *)&v23->_imageInfoNode, a4);
    v23->_quality = a5;
    objc_storeStrong((id *)&v23->_compositionController, a7);
    uint64_t v24 = [v16 copy];
    livePhotoPairingIdentifier = v23->_livePhotoPairingIdentifier;
    v23->_livePhotoPairingIdentifier = (NSString *)v24;
  }
  return v23;
}

@end