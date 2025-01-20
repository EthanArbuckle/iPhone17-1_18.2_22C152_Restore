@interface PXOneUpSharePlayAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)isAnimatedImage;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHidden;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isLivePhoto;
- (BOOL)isPartOfStack;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isSpatialMedia;
- (BOOL)isSpatialPresentation;
- (BOOL)isTemporaryPlaceholder;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSNumber)hdrGain;
- (NSString)debugDescription;
- (NSString)localizedGeoDescription;
- (NSString)uuid;
- (PXOneUpSharePlayAsset)initWithUUID:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 spatialMediaType:(signed __int16)a6 isSpatialPresentation:(BOOL)a7 playbackStyle:(int64_t)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 duration:(double)a11 hdrGain:(id)a12 photoIrisStillDisplayTime:(id *)a13 photoIrisVideoDuration:(id *)a14 localizedGeoDescription:(id)a15 creationDate:(id)a16;
- (double)aspectRatio;
- (double)duration;
- (float)audioScore;
- (id)modificationDate;
- (id)uniformTypeIdentifier;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)originalFilesize;
- (int64_t)playbackStyle;
- (signed)spatialMediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (void)setCreationDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHdrGain:(id)a3;
- (void)setIsSpatialPresentation:(BOOL)a3;
- (void)setLocalizedGeoDescription:(id)a3;
- (void)setMediaSubtypes:(unint64_t)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setPhotoIrisStillDisplayTime:(id *)a3;
- (void)setPhotoIrisVideoDuration:(id *)a3;
- (void)setPixelHeight:(unint64_t)a3;
- (void)setPixelWidth:(unint64_t)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setSpatialMediaType:(signed __int16)a3;
- (void)setUuid:(id)a3;
@end

@implementation PXOneUpSharePlayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localizedGeoDescription, 0);
  objc_storeStrong((id *)&self->_hdrGain, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setLocalizedGeoDescription:(id)a3
{
}

- (NSString)localizedGeoDescription
{
  return self->_localizedGeoDescription;
}

- (void)setPhotoIrisVideoDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_photoIrisVideoDuration.epoch = a3->var3;
  *(_OWORD *)&self->_photoIrisVideoDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setPhotoIrisStillDisplayTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_photoIrisStillDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_photoIrisStillDisplayTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setHdrGain:(id)a3
{
}

- (NSNumber)hdrGain
{
  return self->_hdrGain;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setPixelHeight:(unint64_t)a3
{
  self->_pixelHeight = a3;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelWidth:(unint64_t)a3
{
  self->_pixelWidth = a3;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setIsSpatialPresentation:(BOOL)a3
{
  self->_isSpatialPresentation = a3;
}

- (BOOL)isSpatialPresentation
{
  return self->_isSpatialPresentation;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setSpatialMediaType:(signed __int16)a3
{
  self->_spatialMediaType = a3;
}

- (signed)spatialMediaType
{
  return self->_spatialMediaType;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (int64_t)originalFilesize
{
  return 0;
}

- (id)modificationDate
{
  return 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return [(PXOneUpSharePlayAsset *)self playbackStyle] == 2;
}

- (BOOL)canPlayLoopingVideo
{
  return [(PXOneUpSharePlayAsset *)self playbackStyle] == 5;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  return [(PXOneUpSharePlayAsset *)self playbackStyle] == 3;
}

- (BOOL)isLivePhoto
{
  return ([(PXOneUpSharePlayAsset *)self mediaSubtypes] >> 3) & 1;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (double)aspectRatio
{
  unint64_t v3 = [(PXOneUpSharePlayAsset *)self pixelWidth];
  unint64_t v4 = [(PXOneUpSharePlayAsset *)self pixelHeight];
  double result = 1.0;
  if (v3 && v4)
  {
    double v6 = (double)v4;
    if (*MEMORY[0x1E4F8A250] != (double)v3 || *(double *)(MEMORY[0x1E4F8A250] + 8) != v6) {
      return (double)v3 / v6;
    }
  }
  return result;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F8A248];
  double v3 = *(double *)(MEMORY[0x1E4F8A248] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F8A248] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F8A248] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (CGRect)faceAreaRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)representsBurst
{
  return 0;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F8A248];
  double v3 = *(double *)(MEMORY[0x1E4F8A248] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F8A248] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F8A248] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)defaultImageProviderClass
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXOneUpSharePlayAsset.m" lineNumber:110 description:@"Not Supported"];

  return 0;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (NSDate)localCreationDate
{
  return 0;
}

- (BOOL)isSpatialMedia
{
  return [(PXOneUpSharePlayAsset *)self spatialMediaType] != 0;
}

- (NSString)debugDescription
{
  double v2 = [(PXOneUpSharePlayAsset *)self uuid];
  double v3 = [v2 debugDescription];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXOneUpSharePlayAsset *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(PXOneUpSharePlayAsset *)self uuid];
      double v6 = [(PXOneUpSharePlayAsset *)v4 uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (PXOneUpSharePlayAsset)initWithUUID:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 spatialMediaType:(signed __int16)a6 isSpatialPresentation:(BOOL)a7 playbackStyle:(int64_t)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 duration:(double)a11 hdrGain:(id)a12 photoIrisStillDisplayTime:(id *)a13 photoIrisVideoDuration:(id *)a14 localizedGeoDescription:(id)a15 creationDate:(id)a16
{
  BOOL v18 = a7;
  uint64_t v19 = a6;
  id v29 = a3;
  id v23 = a12;
  id v24 = a15;
  id v25 = a16;
  v32.receiver = self;
  v32.super_class = (Class)PXOneUpSharePlayAsset;
  v26 = [(PXOneUpSharePlayAsset *)&v32 init];
  v27 = v26;
  if (v26)
  {
    [(PXOneUpSharePlayAsset *)v26 setUuid:v29];
    [(PXOneUpSharePlayAsset *)v27 setMediaType:a4];
    [(PXOneUpSharePlayAsset *)v27 setMediaSubtypes:a5];
    [(PXOneUpSharePlayAsset *)v27 setSpatialMediaType:v19];
    [(PXOneUpSharePlayAsset *)v27 setIsSpatialPresentation:v18];
    [(PXOneUpSharePlayAsset *)v27 setPlaybackStyle:a8];
    [(PXOneUpSharePlayAsset *)v27 setPixelWidth:a9];
    [(PXOneUpSharePlayAsset *)v27 setPixelHeight:a10];
    [(PXOneUpSharePlayAsset *)v27 setDuration:a11];
    [(PXOneUpSharePlayAsset *)v27 setHdrGain:v23];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a13;
    [(PXOneUpSharePlayAsset *)v27 setPhotoIrisStillDisplayTime:&v31];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v30 = *a14;
    [(PXOneUpSharePlayAsset *)v27 setPhotoIrisVideoDuration:&v30];
    [(PXOneUpSharePlayAsset *)v27 setLocalizedGeoDescription:v24];
    [(PXOneUpSharePlayAsset *)v27 setCreationDate:v25];
  }

  return v27;
}

@end