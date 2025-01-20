@interface PUFilmstripMediaProviderResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime;
- (BOOL)isReadyForDelivery;
- (CGSize)targetSize;
- (NSDictionary)resultInfo;
- (PUFilmstripAsset)asset;
- (UIImage)image;
- (int64_t)compare:(id)a3;
- (int64_t)requestNumber;
- (void)setActualTime:(id *)a3;
- (void)setAsset:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsReadyForDelivery:(BOOL)a3;
- (void)setRequestNumber:(int64_t)a3;
- (void)setResultInfo:(id)a3;
- (void)setTargetSize:(CGSize)a3;
@end

@implementation PUFilmstripMediaProviderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_resultInfo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setIsReadyForDelivery:(BOOL)a3
{
  self->_isReadyForDelivery = a3;
}

- (BOOL)isReadyForDelivery
{
  return self->_isReadyForDelivery;
}

- (void)setAsset:(id)a3
{
}

- (PUFilmstripAsset)asset
{
  return self->_asset;
}

- (void)setActualTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_actualTime.epoch = a3->var3;
  *(_OWORD *)&self->_actualTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRequestNumber:(int64_t)a3
{
  self->_requestNumber = a3;
}

- (int64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setResultInfo:(id)a3
{
}

- (NSDictionary)resultInfo
{
  return self->_resultInfo;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUFilmstripMediaProvider.m", 37, @"Invalid parameter not satisfying: %@", @"[result isKindOfClass:[PUFilmstripMediaProviderResult class]]" object file lineNumber description];
  }
  asset = self->_asset;
  v7 = [v5 asset];
  int64_t v8 = [(PUFilmstripAsset *)asset compare:v7];

  return v8;
}

@end