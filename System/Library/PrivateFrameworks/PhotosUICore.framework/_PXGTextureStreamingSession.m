@interface _PXGTextureStreamingSession
- (NSDate)firstPixelBufferDisplayDate;
- (NSIndexSet)textureRequestIDs;
- (PXDisplayAsset)displayAsset;
- (PXGDisplayAssetAdjustment)displayAdjustment;
- (PXGDisplayAssetPixelBufferSource)pixelBufferSource;
- (PXGDisplayAssetPixelBufferSourcesProvider)pixelBufferSourcesProvider;
- (PXGDisplayAssetVideoPresentationController)presentationController;
- (_PXGTextureStreamingSession)initWithDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7;
- (__CVPixelBufferPool)pixelBufferPool;
- (void)addTextureRequestID:(int)a3;
- (void)dealloc;
- (void)removeTextureRequestID:(int)a3;
- (void)removeTextureRequestIDs:(id)a3;
- (void)setFirstPixelBufferDisplayDate:(id)a3;
- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3;
- (void)setPixelBufferSourcesProvider:(id)a3;
@end

@implementation _PXGTextureStreamingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferSourcesProvider, 0);
  objc_storeStrong((id *)&self->_firstPixelBufferDisplayDate, 0);
  objc_storeStrong((id *)&self->_displayAdjustment, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_pixelBufferSource, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_textureRequestIDs, 0);
}

- (void)setPixelBufferSourcesProvider:(id)a3
{
}

- (PXGDisplayAssetPixelBufferSourcesProvider)pixelBufferSourcesProvider
{
  return self->_pixelBufferSourcesProvider;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)setFirstPixelBufferDisplayDate:(id)a3
{
}

- (NSDate)firstPixelBufferDisplayDate
{
  return self->_firstPixelBufferDisplayDate;
}

- (PXGDisplayAssetAdjustment)displayAdjustment
{
  return self->_displayAdjustment;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (PXGDisplayAssetPixelBufferSource)pixelBufferSource
{
  return self->_pixelBufferSource;
}

- (PXGDisplayAssetVideoPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)dealloc
{
  [(_PXGTextureStreamingSession *)self setPixelBufferPool:0];
  v3.receiver = self;
  v3.super_class = (Class)_PXGTextureStreamingSession;
  [(_PXGTextureStreamingSession *)&v3 dealloc];
}

- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool != a3)
  {
    CVPixelBufferPoolRelease(pixelBufferPool);
    self->_pixelBufferPool = a3;
  }
}

- (void)removeTextureRequestIDs:(id)a3
{
}

- (void)removeTextureRequestID:(int)a3
{
}

- (void)addTextureRequestID:(int)a3
{
}

- (NSIndexSet)textureRequestIDs
{
  v2 = (void *)[(NSMutableIndexSet *)self->_textureRequestIDs copy];
  return (NSIndexSet *)v2;
}

- (_PXGTextureStreamingSession)initWithDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_PXGTextureStreamingSession;
  v17 = [(_PXGTextureStreamingSession *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAsset, a3);
    objc_storeStrong((id *)&v18->_presentationController, a4);
    objc_storeStrong((id *)&v18->_pixelBufferSource, a5);
    objc_storeStrong((id *)&v18->_pixelBufferSourcesProvider, a6);
    v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    textureRequestIDs = v18->_textureRequestIDs;
    v18->_textureRequestIDs = v19;

    objc_storeStrong((id *)&v18->_displayAdjustment, a7);
  }

  return v18;
}

@end