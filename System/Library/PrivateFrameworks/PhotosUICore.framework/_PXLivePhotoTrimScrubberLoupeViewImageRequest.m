@interface _PXLivePhotoTrimScrubberLoupeViewImageRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceTime;
- (AVAsset)asset;
- (AVVideoComposition)videoComposition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGSize)imageSize;
- (double)scale;
- (void)setAsset:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setSourceTime:(id *)a3;
- (void)setVideoComposition:(id)a3;
@end

@implementation _PXLivePhotoTrimScrubberLoupeViewImageRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_sourceTime.epoch = a3->var3;
  *(_OWORD *)&self->_sourceTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setVideoComposition:(id)a3
{
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setAsset:(id)a3
{
}

- (AVAsset)asset
{
  return self->_asset;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self asset];
    v7 = [v5 asset];
    if ([v6 isEqual:v7])
    {
      v8 = [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self videoComposition];
      v9 = [v5 videoComposition];
      if ([v8 isEqual:v9]
        && ([(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self sourceTime],
            [v5 sourceTime],
            !CMTimeCompare(&time1, &v18)))
      {
        [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self imageSize];
        double v13 = v12;
        double v15 = v14;
        [v5 imageSize];
        BOOL v10 = v15 == v17 && v13 == v16;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isValid
{
  long long v3 = [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self asset];
  if (v3 && ([(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self sourceTime], (v8 & 1) != 0))
  {
    [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)self imageSize];
    BOOL v4 = v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v5 != *MEMORY[0x1E4F1DB30];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end