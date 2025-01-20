@interface _PXGMediaRequest
- (BOOL)gotAnyResult;
- (CGSize)bestReceivedSize;
- (PXDisplayAsset)asset;
- (PXGDisplayAssetAdjustment)adjustment;
- (PXGDisplayAssetRequestObserver)observer;
- (_PXGMediaRequest)initWithAsset:(id)a3 observer:(id)a4 postProcessOptions:(unint64_t)a5;
- (unint64_t)postProcessOptions;
- (void)setAdjustment:(id)a3;
- (void)setBestReceivedSize:(CGSize)a3;
- (void)setGotAnyResult:(BOOL)a3;
@end

@implementation _PXGMediaRequest

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXGDisplayAssetAdjustment)adjustment
{
  return self->_adjustment;
}

- (void)setBestReceivedSize:(CGSize)a3
{
  self->_bestReceivedSize = a3;
}

- (void)setAdjustment:(id)a3
{
}

- (_PXGMediaRequest)initWithAsset:(id)a3 observer:(id)a4 postProcessOptions:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXGMediaRequest;
  v11 = [(_PXGMediaRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_observer, a4);
    v12->_postProcessOptions = a5;
    v12->_bestReceivedSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }

  return v12;
}

- (BOOL)gotAnyResult
{
  return self->_gotAnyResult;
}

- (void)setGotAnyResult:(BOOL)a3
{
  self->_gotAnyResult = a3;
}

- (unint64_t)postProcessOptions
{
  return self->_postProcessOptions;
}

- (PXGDisplayAssetRequestObserver)observer
{
  return self->_observer;
}

- (CGSize)bestReceivedSize
{
  double width = self->_bestReceivedSize.width;
  double height = self->_bestReceivedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end