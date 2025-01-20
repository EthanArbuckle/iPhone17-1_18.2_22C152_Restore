@interface PXGImageRequestSharedState
- (BOOL)applyCleanApertureCrop;
- (BOOL)useLowMemoryDecode;
- (CGSize)targetSize;
- (PXDisplayAssetFetchResult)displayAssetFetchResult;
- (PXGDisplayAssetAdjustment)adjustment;
- (PXGDisplayAssetRequestObserver)observer;
- (PXGImageRequestSharedState)initWithDisplayAssetFetchResult:(id)a3 observer:(id)a4 presentationStyles:(unint64_t)a5 targetSize:(CGSize)a6 screenScale:(double)a7 screenMaxHeadroom:(double)a8 adjustment:(id)a9 intent:(unint64_t)a10 useLowMemoryDecode:(BOOL)a11 applyCleanApertureCrop:(BOOL)a12 mediaProvider:(id)a13;
- (PXMediaProvider)mediaProvider;
- (double)screenMaxHeadroom;
- (double)screenScale;
- (unint64_t)intent;
- (unint64_t)presentationStyles;
@end

@implementation PXGImageRequestSharedState

- (PXDisplayAssetFetchResult)displayAssetFetchResult
{
  return self->_displayAssetFetchResult;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (double)screenMaxHeadroom
{
  return self->_screenMaxHeadroom;
}

- (unint64_t)presentationStyles
{
  return self->_presentationStyles;
}

- (PXGDisplayAssetRequestObserver)observer
{
  return self->_observer;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (PXGDisplayAssetAdjustment)adjustment
{
  return self->_adjustment;
}

- (BOOL)applyCleanApertureCrop
{
  return self->_applyCleanApertureCrop;
}

- (PXGImageRequestSharedState)initWithDisplayAssetFetchResult:(id)a3 observer:(id)a4 presentationStyles:(unint64_t)a5 targetSize:(CGSize)a6 screenScale:(double)a7 screenMaxHeadroom:(double)a8 adjustment:(id)a9 intent:(unint64_t)a10 useLowMemoryDecode:(BOOL)a11 applyCleanApertureCrop:(BOOL)a12 mediaProvider:(id)a13
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v23 = a3;
  id v24 = a4;
  id v30 = a9;
  id v25 = a13;
  v31.receiver = self;
  v31.super_class = (Class)PXGImageRequestSharedState;
  v26 = [(PXGImageRequestSharedState *)&v31 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_displayAssetFetchResult, a3);
    objc_storeStrong((id *)&v27->_observer, a4);
    v27->_presentationStyles = a5;
    v27->_targetSize.CGFloat width = width;
    v27->_targetSize.CGFloat height = height;
    v27->_screenScale = a7;
    v27->_screenMaxHeadroom = a8;
    objc_storeStrong((id *)&v27->_adjustment, a9);
    v27->_intent = a10;
    objc_storeStrong((id *)&v27->_mediaProvider, a13);
    v27->_useLowMemoryDecode = a11;
    v27->_applyCleanApertureCrop = a12;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_displayAssetFetchResult, 0);
}

@end