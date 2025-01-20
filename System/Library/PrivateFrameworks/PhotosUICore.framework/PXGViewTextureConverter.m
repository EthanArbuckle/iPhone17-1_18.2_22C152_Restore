@interface PXGViewTextureConverter
- (BOOL)lowMemoryMode;
- (BOOL)supportsMipmaps;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)requestQueue;
- (PXGImageTexture)transparentTexture;
- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5;
- (id)createAtlasForTextureAtlasManager:(id)a3;
- (id)createPayloadTextureFromPayload:(id)a3;
- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4;
- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:;
- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:;
- (unint64_t)supportedContentTypes;
- (unsigned)presentationType;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation PXGViewTextureConverter

- (PXGImageTexture)transparentTexture
{
  return 0;
}

- (unint64_t)supportedContentTypes
{
  return 5;
}

- (void)setRequestQueue:(id)a3
{
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (unsigned)presentationType
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (id)createAtlasForTextureAtlasManager:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXGViewTextureConverter.m" lineNumber:62 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PXGViewTextureConverter.m" lineNumber:58 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (BOOL)supportsMipmaps
{
  return 0;
}

- (id)createPayloadTextureFromPayload:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = objc_msgSend(objc_alloc((Class)off_1E5DA6A80), "initWithPayload:presentationType:", v4, -[PXGViewTextureConverter presentationType](self, "presentationType"));
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"PXGViewTextureConverter.m" lineNumber:33 description:@"PXGViewTextureConverter doesn't support adjustments."];

  abort();
}

- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a6);
  [v8 handleFailureInMethod:a2 object:self file:@"PXGViewTextureConverter.m" lineNumber:28 description:@"PXGViewTextureConverter doesn't support CVPixelBufferRef."];

  abort();
}

- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  v6 = [PXGViewImageTexture alloc];
  PXGSpriteTextureInfoOrientationToCGOrientation();
}

@end