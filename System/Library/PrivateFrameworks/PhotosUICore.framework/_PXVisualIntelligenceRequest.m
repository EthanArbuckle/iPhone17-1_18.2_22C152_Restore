@interface _PXVisualIntelligenceRequest
- (CGImage)cgImage;
- (PXDisplayAsset)asset;
- (UIImage)image;
- (VKCImageAnalyzerRequest)vkImageRequest;
- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7;
- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 image:(id)a4 requestID:(int)a5 resultHandler:(id)a6;
- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7;
- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 requestID:(int)a4 resultHandler:(id)a5;
- (__CVBuffer)pixelBuffer;
- (id)resultHandler;
- (int)requestID;
- (int)vkRequestID;
- (int64_t)cgImageOrPixelBufferOrientation;
- (void)dealloc;
- (void)setVkRequestID:(int)a3;
@end

@implementation _PXVisualIntelligenceRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setVkRequestID:(int)a3
{
  self->_vkRequestID = a3;
}

- (int)vkRequestID
{
  return self->_vkRequestID;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (int64_t)cgImageOrPixelBufferOrientation
{
  return self->_cgImageOrPixelBufferOrientation;
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (UIImage)image
{
  return self->_image;
}

- (int)requestID
{
  return self->_requestID;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (VKCImageAnalyzerRequest)vkImageRequest
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(_PXVisualIntelligenceRequest *)self asset];
  v4 = [(_PXVisualIntelligenceRequest *)self asset];
  BOOL v5 = +[PXVisualIntelligenceManager canRequestVKImageAnalysisForAsset:v4];

  if (v5)
  {
    double v6 = (double)(unint64_t)[v3 pixelWidth];
    double v7 = (double)(unint64_t)[v3 pixelHeight];
    if ((PLIsSpotlight() & 1) != 0 || PLIsPeopleViewService()) {
      uint64_t v8 = -17;
    }
    else {
      uint64_t v8 = -1;
    }
    v16 = [v3 localIdentifier];
    v17 = [v3 photoLibrary];
    v18 = [v17 photoLibraryURL];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3FE8]), "initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:", v16, v18, v8, v6, v7);
    [v15 setImageSource:0];

    goto LABEL_20;
  }
  if ([v3 mediaType] == 2)
  {
    v9 = [(_PXVisualIntelligenceRequest *)self pixelBuffer];
    if (v9)
    {
      v10 = v9;
      int64_t v11 = [(_PXVisualIntelligenceRequest *)self cgImageOrPixelBufferOrientation];
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB3FE8]) initWithCVPixelBuffer:v10 orientation:v11 requestType:-1];
    }
    else
    {
      v19 = [(_PXVisualIntelligenceRequest *)self cgImage];
      int64_t v20 = [(_PXVisualIntelligenceRequest *)self cgImageOrPixelBufferOrientation];
      if (v19)
      {
        int64_t v21 = v20;
      }
      else
      {
        id v22 = [(_PXVisualIntelligenceRequest *)self image];
        v19 = (CGImage *)[v22 CGImage];

        if (!v19)
        {
          v24 = PLVisualIntelligenceGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = [(_PXVisualIntelligenceRequest *)self asset];
            int v26 = 138412290;
            v27 = v25;
            _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_ERROR, "No video frame to make visual image analyze request, asset: %@", (uint8_t *)&v26, 0xCu);
          }
          v15 = 0;
          goto LABEL_19;
        }
        int64_t v21 = 0;
      }
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB3FE8]) initWithCGImage:v19 orientation:v21 requestType:-1];
    }
    v15 = (void *)v12;
LABEL_19:
    [v15 setImageSource:2];
    goto LABEL_20;
  }
  v13 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = [(_PXVisualIntelligenceRequest *)self asset];
    int v26 = 138412290;
    v27 = v14;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Must be PHAsset of image (excludes GIF) or LivePhoto to make visual image analyze request, asset: %@", (uint8_t *)&v26, 0xCu);
  }
  v15 = 0;
LABEL_20:

  return (VKCImageAnalyzerRequest *)v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F45968] globalSession];
  [v3 releaseCachedResources];

  CVPixelBufferRelease([(_PXVisualIntelligenceRequest *)self pixelBuffer]);
  CGImageRelease(self->_cgImage);
  v4.receiver = self;
  v4.super_class = (Class)_PXVisualIntelligenceRequest;
  [(_PXVisualIntelligenceRequest *)&v4 dealloc];
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7
{
  v9 = [(_PXVisualIntelligenceRequest *)self initWithAsset:a3 requestID:*(void *)&a6 resultHandler:a7];
  if (v9)
  {
    v9->_cgImage = CGImageRetain(a4);
    v9->_cgImageOrPixelBufferOrientation = a5;
  }
  return v9;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7
{
  v9 = [(_PXVisualIntelligenceRequest *)self initWithAsset:a3 requestID:*(void *)&a6 resultHandler:a7];
  if (v9)
  {
    v9->_pixelBuffer = CVPixelBufferRetain(a4);
    v9->_cgImageOrPixelBufferOrientation = a5;
  }
  return v9;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 image:(id)a4 requestID:(int)a5 resultHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a4;
  uint64_t v12 = [(_PXVisualIntelligenceRequest *)self initWithAsset:a3 requestID:v7 resultHandler:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_image, a4);
  }

  return v13;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 requestID:(int)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_PXVisualIntelligenceRequest;
  id v11 = [(_PXVisualIntelligenceRequest *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    v12->_requestID = a4;
    uint64_t v13 = [v10 copy];
    id resultHandler = v12->_resultHandler;
    v12->_id resultHandler = (id)v13;
  }
  return v12;
}

@end