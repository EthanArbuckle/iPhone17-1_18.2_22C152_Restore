@interface PUImageDataRenderNode
- (BOOL)_isInputValid;
- (CGSize)baseImageSize;
- (CGSize)renderedImageSize;
- (NSData)imageData;
- (NSString)livePhotoPairingIdentifier;
- (PICompositionController)compositionController;
- (PUImageDataRenderNode)initWithImageInfoNode:(id)a3 videoURLNode:(id)a4 compositionController:(id)a5 livePhotoPairingIdentifier:(id)a6 jpegCompression:(double)a7;
- (PUImageInfoNode)imageDataNode;
- (PUVideoURLNode)videoURLNode;
- (double)jpegCompression;
- (id)_editSource;
- (void)_handleRenderCompletedWithJpegData:(id)a3 baseSize:(CGSize)a4 editedSize:(CGSize)a5;
- (void)run;
@end

@implementation PUImageDataRenderNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (double)jpegCompression
{
  return self->_jpegCompression;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PUVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUImageInfoNode)imageDataNode
{
  return self->_imageDataNode;
}

- (CGSize)renderedImageSize
{
  double width = self->_renderedImageSize.width;
  double height = self->_renderedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)baseImageSize
{
  double width = self->_baseImageSize.width;
  double height = self->_baseImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)_handleRenderCompletedWithJpegData:(id)a3 baseSize:(CGSize)a4 editedSize:(CGSize)a5
{
  self->_renderedImageSize = a5;
  self->_baseImageSize = a4;
  objc_storeStrong((id *)&self->_imageData, a3);
  [(PXRunNode *)self complete];
}

- (void)run
{
  v3 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "PUImageDataRenderNode render start...", (uint8_t *)buf, 2u);
  }

  imageData = self->_imageData;
  self->_imageData = 0;

  CGSize v5 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_renderedImageSize = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_baseImageSize = v5;
  v6 = [(PUImageDataRenderNode *)self _editSource];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v6];
    v8 = [(PUImageDataRenderNode *)self compositionController];
    [v7 setCompositionController:v8];

    [(PUImageDataRenderNode *)self jpegCompression];
    double v10 = v9;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v12 = v11;
    objc_initWeak(buf, self);
    livePhotoPairingIdentifier = self->_livePhotoPairingIdentifier;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__PUImageDataRenderNode_run__block_invoke;
    v14[3] = &unk_1E5F258C0;
    v15[1] = v12;
    objc_copyWeak(v15, buf);
    [v7 generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier livePhotoPairingIdentifier:v14 completionHandler:v10];
    objc_destroyWeak(v15);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PXRunNode *)self cancelWithError:0];
  }
}

void __28__PUImageDataRenderNode_run__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  id v12 = a2;
  [v11 timeIntervalSinceReferenceDate];
  double v14 = v13;
  double v15 = *(double *)(a1 + 40);
  v16 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    double v19 = v14 - v15;
    _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "PUImageDataRenderNode render time: %f sec", (uint8_t *)&v18, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRenderCompletedWithJpegData:baseSize:editedSize:", v12, a3, a4, a5, a6);
}

- (id)_editSource
{
  if ([(PUImageDataRenderNode *)self _isInputValid])
  {
    v3 = [(PUImageDataRenderNode *)self imageDataNode];
    v4 = [v3 imageDataURL];

    CGSize v5 = [(PUImageDataRenderNode *)self imageDataNode];
    v6 = [v5 imageDataUTI];

    v7 = [(PUImageDataRenderNode *)self imageDataNode];
    uint64_t v8 = [v7 useEmbeddedPreview];

    double v9 = [(PUVideoURLNode *)self->_videoURLNode videoURL];

    if (v9)
    {
      if (self->_livePhotoPairingIdentifier)
      {
        double v10 = (void *)[objc_alloc(MEMORY[0x1E4F8AA68]) initWithURL:v4 type:v6 image:0 useEmbeddedPreview:v8];
        id v11 = objc_alloc(MEMORY[0x1E4F8AC88]);
        id v12 = [(PUVideoURLNode *)self->_videoURLNode videoURL];
        double v13 = (void *)[v11 initWithVideoURL:v12];

        double v14 = (void *)[objc_alloc(MEMORY[0x1E4F8A918]) initWithPhotoSource:v10 videoComplement:v13];
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x1E4F8AC88]);
        v16 = [(PUVideoURLNode *)self->_videoURLNode videoURL];
        double v14 = (void *)[v15 initWithVideoURL:v16];
      }
    }
    else
    {
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4F8AA68]) initWithURL:v4 type:v6 image:0 useEmbeddedPreview:v8];
    }
  }
  else
  {
    double v14 = 0;
  }
  return v14;
}

- (BOOL)_isInputValid
{
  v3 = [(PUImageDataRenderNode *)self imageDataNode];
  v4 = [v3 imageDataURL];

  CGSize v5 = [(PUImageDataRenderNode *)self imageDataNode];
  [v5 imageExifOrientation];

  if (v4) {
    char IsValid = PLOrientationIsValid();
  }
  else {
    char IsValid = 0;
  }
  v7 = [(PUImageDataRenderNode *)self videoURLNode];
  uint64_t v8 = [v7 videoURL];
  if (v8)
  {
    double v9 = [(PUImageDataRenderNode *)self livePhotoPairingIdentifier];
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10 | IsValid;
}

- (PUImageDataRenderNode)initWithImageInfoNode:(id)a3 videoURLNode:(id)a4 compositionController:(id)a5 livePhotoPairingIdentifier:(id)a6 jpegCompression:(double)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (!v16)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PUImageDataRenderNode.m", 34, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_11:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUImageDataRenderNode.m", 35, @"Invalid parameter not satisfying: %@", @"imageInfoNode" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_11;
  }
LABEL_3:
  if (a7 > 1.0 || a7 < 0.0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PUImageDataRenderNode.m", 36, @"Invalid parameter not satisfying: %@", @"jpegCompression <= 1 && jpegCompression >= 0" object file lineNumber description];
  }
  int v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
  double v19 = v18;
  if (v15) {
    [v18 addObject:v15];
  }
  v29.receiver = self;
  v29.super_class = (Class)PUImageDataRenderNode;
  uint64_t v20 = [(PXRunNode *)&v29 initWithDependencies:v19];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    compositionController = v20->_compositionController;
    v20->_compositionController = (PICompositionController *)v21;

    objc_storeStrong((id *)&v20->_imageDataNode, a3);
    v20->_jpegCompression = a7;
    uint64_t v23 = [v17 copy];
    livePhotoPairingIdentifier = v20->_livePhotoPairingIdentifier;
    v20->_livePhotoPairingIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_videoURLNode, a4);
  }

  return v20;
}

@end