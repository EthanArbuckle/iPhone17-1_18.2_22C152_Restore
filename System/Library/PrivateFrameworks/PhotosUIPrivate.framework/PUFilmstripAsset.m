@interface PUFilmstripAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- (AVAsset)_asset;
- (BOOL)_isSourceTimeAccurate;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)isAnimatedImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHidden;
- (BOOL)isLivePhoto;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isTemporaryPlaceholder;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)localizedGeoDescription;
- (NSString)uniformTypeIdentifier;
- (NSString)uuid;
- (PUFilmstripAsset)init;
- (PUFilmstripAsset)initWithNormalizedTime:(double)a3 asset:(id)a4;
- (double)_normalizedTime;
- (double)aspectRatio;
- (double)duration;
- (double)sourceTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (int64_t)playbackStyle;
- (unint64_t)hash;
- (unint64_t)isContentEqualTo:(id)a3;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)originalFilesize;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unsigned)playbackVariation;
- (void)_setAsset:(id)a3;
- (void)_setNormalizedTime:(double)a3;
- (void)_setSourceTimeAccurate:(BOOL)a3;
- (void)loadSourceTimeWithCompletionHandler:(id)a3;
- (void)setSourceTime:(double)a3;
@end

@implementation PUFilmstripAsset

- (void)_setSourceTimeAccurate:(BOOL)a3
{
  self->__isSourceTimeAccurate = a3;
}

- (BOOL)_isSourceTimeAccurate
{
  return self->__isSourceTimeAccurate;
}

- (void)_setNormalizedTime:(double)a3
{
  self->__normalizedTime = a3;
}

- (double)_normalizedTime
{
  return self->__normalizedTime;
}

- (void)_setAsset:(id)a3
{
  self->__asset = (AVAsset *)a3;
}

- (AVAsset)_asset
{
  return self->__asset;
}

- (void)setSourceTime:(double)a3
{
  self->_sourceTime = a3;
}

- (unint64_t)hash
{
  return self->_pixelWidth ^ self->_pixelHeight ^ (unint64_t)self->__normalizedTime;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 _normalizedTime];
    BOOL v9 = v6 == self->__normalizedTime
      && ([v5 _asset],
          v7 = (AVAsset *)objc_claimAutoreleasedReturnValue(),
          asset = self->__asset,
          v7,
          v7 == asset)
      && [v5 pixelHeight] == self->_pixelHeight
      && [v5 pixelWidth] == self->_pixelWidth;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  [a3 sourceTime];
  double sourceTime = self->_sourceTime;
  if (v4 <= sourceTime) {
    return v4 < sourceTime;
  }
  else {
    return -1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(PUFilmstripAsset *)self _normalizedTime];
  double v6 = v5;
  v7 = [(PUFilmstripAsset *)self _asset];
  v8 = (void *)[v4 initWithNormalizedTime:v7 asset:v6];

  return v8;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  return 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (double)aspectRatio
{
  double v3 = (double)[(PUFilmstripAsset *)self pixelWidth];
  return v3 / (double)[(PUFilmstripAsset *)self pixelHeight];
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return 1;
}

- (NSString)uuid
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (BOOL)canPlayLoopingVideo
{
  return 0;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  return 0;
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (unsigned)playbackVariation
{
  return 0;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (unint64_t)mediaType
{
  return 1;
}

- (CLLocation)location
{
  return 0;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelHeight;
}

- (void)loadSourceTimeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void, double))a3;
  if ([(PUFilmstripAsset *)self _isSourceTimeAccurate])
  {
    if (v4) {
      v4[2](v4, 1, 0, self->_sourceTime);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    asset = self->__asset;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PUFilmstripAsset_loadSourceTimeWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5F254D8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    [(AVAsset *)asset pu_loadDurationWithCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __56__PUFilmstripAsset_loadSourceTimeWithCompletionHandler___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = WeakRetained;
  if (a3)
  {
    if (!WeakRetained) {
      goto LABEL_11;
    }
    if (([WeakRetained _isSourceTimeAccurate] & 1) == 0)
    {
      [v9 _normalizedTime];
      CMTime v13 = *a2;
      [v9 setSourceTime:v10 * CMTimeGetSeconds(&v13)];
      [v9 _setSourceTimeAccurate:1];
    }
  }
  else
  {
    v11 = PLOneUpGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v13.value) = 138412290;
      *(CMTimeValue *)((char *)&v13.value + 4) = (CMTimeValue)v7;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to load video duration. Error: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12 && v9)
  {
    [v9 sourceTime];
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a3, v7);
  }
LABEL_11:
}

- (double)sourceTime
{
  if (![(PUFilmstripAsset *)self _isSourceTimeAccurate])
  {
    double v3 = [(PUFilmstripAsset *)self _asset];
    id v4 = v3;
    if (v3) {
      objc_msgSend(v3, "pu_duration");
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    [(PUFilmstripAsset *)self _normalizedTime];
    self->_double sourceTime = Seconds * v6;
    [(PUFilmstripAsset *)self _setSourceTimeAccurate:1];
  }
  return self->_sourceTime;
}

- (PUFilmstripAsset)initWithNormalizedTime:(double)a3 asset:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripAsset;
  result = [(PUFilmstripAsset *)&v7 init];
  if (result)
  {
    *(int64x2_t *)&result->_pixelWidth = vdupq_n_s64(1uLL);
    result->__normalizedTime = a3;
    result->__isSourceTimeAccurate = 0;
    result->__asset = (AVAsset *)a4;
  }
  return result;
}

- (PUFilmstripAsset)init
{
  return [(PUFilmstripAsset *)self initWithNormalizedTime:0 asset:0.0];
}

@end