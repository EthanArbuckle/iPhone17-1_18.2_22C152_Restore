@interface PUPhotoPickerScaledFileSizeEstimator
+ (BOOL)isAssetResizable:(id)a3;
- (BOOL)wouldResizeAssetUsingResizeDescriptor:(id)a3;
- (CGSize)_targetSizeForResizeDescriptor:(id)a3;
- (CMPhotoDecompressionContainer)_figContainer;
- (PHAsset)asset;
- (PUPhotoPickerScaledFileSizeEstimator)initWithAsset:(id)a3;
- (id)_assetURL;
- (id)_assetUTI;
- (unint64_t)_assetOriginalSize;
- (unint64_t)_estimatedSizeForResizeDescriptor:(id)a3;
- (unint64_t)estimatedSizeForResizeDescriptor:(id)a3;
- (void)dealloc;
@end

@implementation PUPhotoPickerScaledFileSizeEstimator

- (void).cxx_destruct
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)_estimatedSizeForResizeDescriptor:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v15 = 0;
  if ([(PUPhotoPickerScaledFileSizeEstimator *)self _figContainer])
  {
    [(PUPhotoPickerScaledFileSizeEstimator *)self _targetSizeForResizeDescriptor:v4];
    if (v5 <= v6) {
      double v5 = v6;
    }
    v18[0] = *MEMORY[0x1E4F562A8];
    v7 = [NSNumber numberWithDouble:v5];
    v19[0] = v7;
    v18[1] = *MEMORY[0x1E4F560B8];
    v8 = [NSNumber numberWithUnsignedInt:1785750887];
    uint64_t v9 = *MEMORY[0x1E4F56158];
    v19[1] = v8;
    v19[2] = &unk_1F078CB18;
    uint64_t v10 = *MEMORY[0x1E4F56150];
    v18[2] = v9;
    v18[3] = v10;
    uint64_t v16 = *MEMORY[0x1E4F56358];
    v17 = &unk_1F078CB30;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[3] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

    if (CMPhotoDecompressionContainerPredictTranscodedSize()) {
      unint64_t v15 = [(PUPhotoPickerScaledFileSizeEstimator *)self _assetOriginalSize];
    }

    unint64_t v13 = v15;
  }
  else
  {
    unint64_t v13 = [(PUPhotoPickerScaledFileSizeEstimator *)self _assetOriginalSize];
  }

  return v13;
}

- (CMPhotoDecompressionContainer)_figContainer
{
  result = self->_figContainer;
  if (!result)
  {
    if (!CMPhotoDecompressionSessionCreate())
    {
      [(PUPhotoPickerScaledFileSizeEstimator *)self _assetURL];
      int Container = CMPhotoDecompressionSessionCreateContainer();
      CFRelease(0);
      if (!Container) {
        self->_figint Container = 0;
      }
    }
    return self->_figContainer;
  }
  return result;
}

- (CGSize)_targetSizeForResizeDescriptor:(id)a3
{
  [a3 targetSize];
  double v6 = v5;
  if (v5 == *MEMORY[0x1E4F396D8] && v4 == *(double *)(MEMORY[0x1E4F396D8] + 8))
  {
    double v6 = (double)[(PHAsset *)self->_asset pixelWidth];
    double v4 = (double)[(PHAsset *)self->_asset pixelHeight];
  }
  double v8 = v6;
  result.height = v4;
  result.width = v8;
  return result;
}

- (id)_assetURL
{
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  asset = self->_asset;
  return (id)[(PHAsset *)asset mainFileURL];
}

- (unint64_t)_assetOriginalSize
{
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  v3 = [(PHAsset *)self->_asset originalMetadataProperties];
  unint64_t v4 = [v3 originalFilesize];

  return v4;
}

- (id)_assetUTI
{
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  asset = self->_asset;
  return (id)[(PHAsset *)asset uniformTypeIdentifier];
}

- (BOOL)wouldResizeAssetUsingResizeDescriptor:(id)a3
{
  [(PUPhotoPickerScaledFileSizeEstimator *)self _targetSizeForResizeDescriptor:a3];
  double v5 = v4;
  double v7 = v6;
  double v8 = (double)[(PHAsset *)self->_asset pixelWidth];
  return v7 < (double)[(PHAsset *)self->_asset pixelHeight] || v5 < v8;
}

- (unint64_t)estimatedSizeForResizeDescriptor:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F8CDF8];
  double v6 = [(PUPhotoPickerScaledFileSizeEstimator *)self _assetUTI];
  double v7 = [v5 typeWithIdentifier:v6];

  if (([(id)objc_opt_class() isAssetResizable:self->_asset] & 1) != 0
    && (([v7 conformsToType:*MEMORY[0x1E4F443E8]] & 1) != 0
     || [v7 conformsToType:*MEMORY[0x1E4F443E0]]
     || [(PUPhotoPickerScaledFileSizeEstimator *)self wouldResizeAssetUsingResizeDescriptor:v4]))
  {
    unint64_t v8 = [(PUPhotoPickerScaledFileSizeEstimator *)self _estimatedSizeForResizeDescriptor:v4];
  }
  else
  {
    unint64_t v8 = [(PUPhotoPickerScaledFileSizeEstimator *)self _assetOriginalSize];
  }
  unint64_t v9 = v8;

  return v9;
}

- (void)dealloc
{
  figint Container = self->_figContainer;
  if (figContainer) {
    CFRelease(figContainer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerScaledFileSizeEstimator;
  [(PUPhotoPickerScaledFileSizeEstimator *)&v4 dealloc];
}

- (PUPhotoPickerScaledFileSizeEstimator)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoPickerScaledFileSizeEstimator;
  double v6 = [(PUPhotoPickerScaledFileSizeEstimator *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_asset, a3);
  }

  return v7;
}

+ (BOOL)isAssetResizable:(id)a3
{
  return [a3 isVideo] ^ 1;
}

@end