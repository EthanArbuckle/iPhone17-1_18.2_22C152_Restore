@interface PXSyntheticAsset
+ (BOOL)supportsSecureCoding;
+ (id)syntheticAssetWithSerializableDescription:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration;
- (BOOL)hasAdjustments;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)representsBurst;
- (CGAffineTransform)transform;
- (CGPoint)positionOffset;
- (CGRect)_cropAssetRectFromCropRect:(CGRect)a3;
- (CGRect)_cropRectFromCropAssetRect:(CGRect)a3;
- (CGRect)acceptableCropAssetRect;
- (CGRect)acceptableCropRect;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5;
- (CGRect)bestCropRectForAspectRatioV2:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5;
- (CGRect)bestPlaybackAssetRect;
- (CGRect)bestPlaybackRect;
- (CGRect)faceAreaAssetRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropAssetRect;
- (CGRect)preferredCropRect;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (CGSize)size;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSSet)sceneClassifications;
- (NSString)label;
- (NSString)localizedGeoDescription;
- (NSString)serializableDescription;
- (NSString)uuid;
- (PXSyntheticAsset)init;
- (PXSyntheticAsset)initWithCoder:(id)a3;
- (PXSyntheticAsset)initWithConfiguration:(id)a3;
- (UIColor)tintColor;
- (double)aspectRatio;
- (double)curationScore;
- (double)duration;
- (double)weight;
- (float)audioScore;
- (id)localIdentifier;
- (id)photoLibrary;
- (id)vcp_fingerprint:(id)a3;
- (int64_t)faceCount;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)hash;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptableCropAssetRect:(CGRect)a3;
- (void)setAcceptableCropRect:(CGRect)a3;
- (void)setAudioScore:(float)a3;
- (void)setBestPlaybackAssetRect:(CGRect)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setCurationScore:(double)a3;
- (void)setFaceAreaAssetRect:(CGRect)a3;
- (void)setFaceAreaRect:(CGRect)a3;
- (void)setFaceCount:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLocalCreationDate:(id)a3;
- (void)setLocalizedGeoDescription:(id)a3;
- (void)setMediaSubtypes:(unint64_t)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setPreferredCropAssetRect:(CGRect)a3;
- (void)setPreferredCropRect:(CGRect)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PXSyntheticAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_localizedGeoDescription, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CGRect)faceAreaRect
{
  double x = self->_faceAreaRect.origin.x;
  double y = self->_faceAreaRect.origin.y;
  double width = self->_faceAreaRect.size.width;
  double height = self->_faceAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bestPlaybackRect
{
  double x = self->_bestPlaybackRect.origin.x;
  double y = self->_bestPlaybackRect.origin.y;
  double width = self->_bestPlaybackRect.size.width;
  double height = self->_bestPlaybackRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->_hasPeopleSceneMidOrGreaterConfidence;
}

- (float)audioScore
{
  return self->_audioScore;
}

- (NSString)localizedGeoDescription
{
  return self->_localizedGeoDescription;
}

- (int64_t)faceCount
{
  return self->_faceCount;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)vcp_fingerprint:(id)a3
{
  return 0;
}

- (id)localIdentifier
{
  return self->_uuid;
}

- (BOOL)hasAdjustments
{
  return 0;
}

- (id)photoLibrary
{
  return 0;
}

- (CGRect)acceptableCropRect
{
  if (CGRectIsNull(self->_acceptableCropRect))
  {
    [(PXSyntheticAsset *)self preferredCropRect];
  }
  else
  {
    double x = self->_acceptableCropRect.origin.x;
    double y = self->_acceptableCropRect.origin.y;
    double width = self->_acceptableCropRect.size.width;
    double height = self->_acceptableCropRect.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)positionOffset
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3 = MEMORY[0x263F000D0];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)weight
{
  return 1.0;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double v5 = *MEMORY[0x263F001A0];
  double v6 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  double height = a3.height;
  double width = a3.width;
  [(PXSyntheticAsset *)self faceAreaRect];
  uint64_t v45 = v7;
  uint64_t v9 = v8;
  double v11 = v10;
  double v13 = 1.0 - (v12 + v10);
  id PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  PXSizeGetAspectRatio(width, height);
  double v16 = v15;
  unint64_t v17 = [(PXSyntheticAsset *)self pixelWidth];
  unint64_t v18 = [(PXSyntheticAsset *)self pixelHeight];
  [(PXSyntheticAsset *)self preferredCropRect];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  [(PXSyntheticAsset *)self acceptableCropRect];
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v17, v18, 0, v16, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v20, v22, v24, v26, v27, v28, v29, v30,
    v45,
    *(void *)&v13,
    v9,
    *(void *)&v11);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [(PXSyntheticAsset *)self size];
  double v40 = v36 * v39;
  double v42 = v38 * v41;
  double v43 = *MEMORY[0x263F00148] + v32 * v39;
  double v44 = *(double *)(MEMORY[0x263F00148] + 8) + v34 * v41;
  result.size.double height = v42;
  result.size.double width = v40;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

- (CGRect)bestCropRectForAspectRatioV2:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  [(PXSyntheticAsset *)self faceAreaRect];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v11 = v10;
  double v13 = 1.0 - (v12 + v10);
  id PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  unint64_t v15 = [(PXSyntheticAsset *)self pixelWidth];
  unint64_t v16 = [(PXSyntheticAsset *)self pixelHeight];
  [(PXSyntheticAsset *)self preferredCropRect];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  [(PXSyntheticAsset *)self acceptableCropRect];
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v15, v16, 0, a3, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24), v18, v20, v22, v24, v25, v26, v27, v28,
    v7,
    *(void *)&v13,
    v9,
    *(void *)&v11);
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  [(PXSyntheticAsset *)self faceAreaRect];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  double v13 = v12;
  double v15 = 1.0 - (v14 + v12);
  id PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  unint64_t v17 = [(PXSyntheticAsset *)self pixelWidth];
  unint64_t v18 = [(PXSyntheticAsset *)self pixelHeight];
  [(PXSyntheticAsset *)self preferredCropRect];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(PXSyntheticAsset *)self acceptableCropRect];
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a4, a5, v17, v18, a3, v20, v22, v24, v26, v27, v28, v29, v30, v9, *(void *)&v15, v11,
    *(void *)&v13);
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  [(PXSyntheticAsset *)self bestCropRectForAspectRatio:0 verticalContentMode:3 cropMode:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  return self;
}

- (double)duration
{
  return 0.0;
}

- (int64_t)isContentEqualTo:(id)a3
{
  if ([(PXSyntheticAsset *)self isEqual:a3]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (NSDate)localCreationDate
{
  localCreationDate = self->_localCreationDate;
  if (localCreationDate)
  {
    double v3 = localCreationDate;
  }
  else
  {
    double v3 = [(PXSyntheticAsset *)self creationDate];
  }

  return v3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (double)aspectRatio
{
  [(PXSyntheticAsset *)self size];
  if (v2 == 0.0 || v3 == 0.0) {
    return 1.0;
  }
  if (v2 == *MEMORY[0x263F5D550] && v3 == *(double *)(MEMORY[0x263F5D550] + 8)) {
    return 1.0;
  }
  else {
    return fabs(v2 / v3);
  }
}

- (unint64_t)pixelHeight
{
  [(PXSyntheticAsset *)self size];
  return (unint64_t)v2;
}

- (unint64_t)pixelWidth
{
  [(PXSyntheticAsset *)self size];
  return (unint64_t)v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXSyntheticAsset *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(PXSyntheticAsset *)self uuid];
      uint64_t v7 = [(PXSyntheticAsset *)v5 uuid];
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqualToString:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (PXSyntheticAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PXSyntheticAsset;
  double v5 = [(PXSyntheticAsset *)&v45 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_uuid);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    uint64_t v10 = NSStringFromSelector(sel_size);
    [v4 decodeCGSizeForKey:v10];
    v5->_size.double width = v11;
    v5->_size.double height = v12;

    double v13 = NSStringFromSelector(sel_preferredCropRect);
    [v4 decodeCGRectForKey:v13];
    v5->_preferredCropRect.origin.double x = v14;
    v5->_preferredCropRect.origin.double y = v15;
    v5->_preferredCropRect.size.double width = v16;
    v5->_preferredCropRect.size.double height = v17;

    unint64_t v18 = NSStringFromSelector(sel_acceptableCropRect);
    [v4 decodeCGRectForKey:v18];
    v5->_acceptableCropRect.origin.double x = v19;
    v5->_acceptableCropRect.origin.double y = v20;
    v5->_acceptableCropRect.size.double width = v21;
    v5->_acceptableCropRect.size.double height = v22;

    double v23 = NSStringFromSelector(sel_bestPlaybackRect);
    [v4 decodeCGRectForKey:v23];
    v5->_bestPlaybackRect.origin.double x = v24;
    v5->_bestPlaybackRect.origin.double y = v25;
    v5->_bestPlaybackRect.size.double width = v26;
    v5->_bestPlaybackRect.size.double height = v27;

    uint64_t v28 = NSStringFromSelector(sel_faceAreaRect);
    [v4 decodeCGRectForKey:v28];
    v5->_faceAreaRect.origin.double x = v29;
    v5->_faceAreaRect.origin.double y = v30;
    v5->_faceAreaRect.size.double width = v31;
    v5->_faceAreaRect.size.double height = v32;

    double v33 = NSStringFromSelector(sel_playbackStyle);
    v5->_playbackStyle = [v4 decodeIntegerForKey:v33];

    uint64_t v34 = objc_opt_class();
    double v35 = NSStringFromSelector(sel_label);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    label = v5->_label;
    v5->_label = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    double v39 = NSStringFromSelector(sel_tintColor);
    uint64_t v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v40;

    double v42 = NSStringFromSelector(sel_audioScore);
    [v4 decodeFloatForKey:v42];
    v5->_audioScore = v43;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_uuid);
  [v5 encodeObject:uuid forKey:v6];

  uint64_t v7 = NSStringFromSelector(sel_size);
  objc_msgSend(v5, "encodeCGSize:forKey:", v7, self->_size.width, self->_size.height);

  uint64_t v8 = NSStringFromSelector(sel_preferredCropRect);
  objc_msgSend(v5, "encodeCGRect:forKey:", v8, self->_preferredCropRect.origin.x, self->_preferredCropRect.origin.y, self->_preferredCropRect.size.width, self->_preferredCropRect.size.height);

  uint64_t v9 = NSStringFromSelector(sel_acceptableCropRect);
  objc_msgSend(v5, "encodeCGRect:forKey:", v9, self->_acceptableCropRect.origin.x, self->_acceptableCropRect.origin.y, self->_acceptableCropRect.size.width, self->_acceptableCropRect.size.height);

  uint64_t v10 = NSStringFromSelector(sel_bestPlaybackRect);
  objc_msgSend(v5, "encodeCGRect:forKey:", v10, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height);

  CGFloat v11 = NSStringFromSelector(sel_faceAreaRect);
  objc_msgSend(v5, "encodeCGRect:forKey:", v11, self->_faceAreaRect.origin.x, self->_faceAreaRect.origin.y, self->_faceAreaRect.size.width, self->_faceAreaRect.size.height);

  int64_t playbackStyle = self->_playbackStyle;
  double v13 = NSStringFromSelector(sel_playbackStyle);
  [v5 encodeInteger:playbackStyle forKey:v13];

  label = self->_label;
  CGFloat v15 = NSStringFromSelector(sel_label);
  [v5 encodeObject:label forKey:v15];

  tintColor = self->_tintColor;
  CGFloat v17 = NSStringFromSelector(sel_tintColor);
  [v5 encodeObject:tintColor forKey:v17];

  float audioScore = self->_audioScore;
  NSStringFromSelector(sel_audioScore);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v19 = audioScore;
  [v5 encodeFloat:v20 forKey:v19];
}

- (void)setLocalCreationDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  localCreationDate = self->_localCreationDate;
  self->_localCreationDate = v4;

  MEMORY[0x270F9A758](v4, localCreationDate);
}

- (void)setLocalizedGeoDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  localizedGeoDescription = self->_localizedGeoDescription;
  self->_localizedGeoDescription = v4;

  MEMORY[0x270F9A758](v4, localizedGeoDescription);
}

- (void)setFaceCount:(int64_t)a3
{
  self->_faceCount = a3;
}

- (void)setCurationScore:(double)a3
{
  self->_curationScore = a3;
}

- (void)setSceneClassifications:(id)a3
{
  id v4 = a3;
  id v5 = (NSSet *)[v4 copy];
  sceneClassifications = self->_sceneClassifications;
  self->_sceneClassifications = v5;

  id v7 = [v4 objectsPassingTest:&__block_literal_global_16];

  self->_hasPeopleSceneMidOrGreaterConfidence = [v7 count] != 0;
}

BOOL __44__PXSyntheticAsset_setSceneClassifications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 sceneIdentifier] == 881)
  {
    [v2 confidence];
    BOOL v4 = v3 >= 0.5;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)serializableDescription
{
  id v9 = 0;
  BOOL v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSyntheticAsset.m", 179, @"failed to archive data: %@", v5 object file lineNumber description];
  }
  uint64_t v6 = [v4 base64EncodedStringWithOptions:0];

  return (NSString *)v6;
}

- (void)setAudioScore:(float)a3
{
  self->_float audioScore = a3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setLabel:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  label = self->_label;
  self->_label = v4;

  MEMORY[0x270F9A758](v4, label);
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_int64_t playbackStyle = a3;
}

- (CGRect)_cropRectFromCropAssetRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double v8 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    [(PXSyntheticAsset *)self size];
    double v14 = v13;
    double v8 = x - *MEMORY[0x263F00148];
    double v11 = 0.0;
    double v10 = 0.0;
    if (v14 != 0.0)
    {
      double v8 = v8 / v14;
      double v10 = width / v14;
    }
    double v15 = y - *(double *)(MEMORY[0x263F00148] + 8);
    if (v12 != 0.0)
    {
      double v15 = v15 / v12;
      double v11 = height / v12;
    }
    double v9 = 1.0 - (v15 + v11);
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)_cropAssetRectFromCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double v8 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    [(PXSyntheticAsset *)self size];
    double v13 = v12;
    double v15 = v14;
    double v8 = *MEMORY[0x263F00148] + x * v12;
    double v9 = *(double *)(MEMORY[0x263F00148] + 8) + (1.0 - (y + height)) * v14;
    double v10 = width * v13;
    double v11 = height * v15;
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)setFaceAreaAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[PXSyntheticAsset setFaceAreaRect:](self, "setFaceAreaRect:");
}

- (void)setBestPlaybackAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[PXSyntheticAsset setBestPlaybackRect:](self, "setBestPlaybackRect:");
}

- (void)setAcceptableCropAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[PXSyntheticAsset setAcceptableCropRect:](self, "setAcceptableCropRect:");
}

- (void)setPreferredCropAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[PXSyntheticAsset setPreferredCropRect:](self, "setPreferredCropRect:");
}

- (CGRect)faceAreaAssetRect
{
  [(PXSyntheticAsset *)self faceAreaRect];

  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)bestPlaybackAssetRect
{
  [(PXSyntheticAsset *)self bestPlaybackRect];

  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)acceptableCropAssetRect
{
  [(PXSyntheticAsset *)self acceptableCropRect];

  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)preferredCropAssetRect
{
  [(PXSyntheticAsset *)self preferredCropRect];

  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setFaceAreaRect:(CGRect)a3
{
  self->_faceAreaRect = a3;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setUuid:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  uuid = self->_uuid;
  self->_uuid = v4;

  MEMORY[0x270F9A758](v4, uuid);
}

- (PXSyntheticAsset)initWithConfiguration:(id)a3
{
  double v4 = (void (**)(id, id))a3;
  v18.receiver = self;
  v18.super_class = (Class)PXSyntheticAsset;
  double v5 = [(PXSyntheticAsset *)&v18 init];
  if (v5)
  {
    double v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    double v8 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v7;

    double v9 = (long long *)MEMORY[0x263F001A0];
    *(int64x2_t *)(v5 + 120) = vdupq_n_s64(0x407F400000000000uLL);
    long long v10 = *v9;
    long long v11 = v9[1];
    *(_OWORD *)(v5 + 136) = *v9;
    *(_OWORD *)(v5 + 152) = v11;
    *(_OWORD *)(v5 + 168) = v10;
    *(_OWORD *)(v5 + 184) = v11;
    *(_OWORD *)(v5 + 200) = v10;
    *(_OWORD *)(v5 + 216) = v11;
    *(_OWORD *)(v5 + 232) = v10;
    *(_OWORD *)(v5 + 248) = v11;
    *((void *)v5 + 3) = 1;
    *((_OWORD *)v5 + 3) = xmmword_259D732A0;
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    double v13 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v12;

    *((_DWORD *)v5 + 3) = 1056964608;
    uint64_t v14 = [MEMORY[0x263F825C8] grayColor];
    double v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    v4[2](v4, v5);
    CGFloat v16 = [v5 uuid];
    *((void *)v5 + 14) = [v16 hash];
  }
  return (PXSyntheticAsset *)v5;
}

- (PXSyntheticAsset)init
{
  return [(PXSyntheticAsset *)self initWithConfiguration:&__block_literal_global_5912];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)syntheticAssetWithSerializableDescription:(id)a3
{
  double v5 = (objc_class *)MEMORY[0x263EFF8F8];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithBase64EncodedString:v6 options:0];

  id v12 = 0;
  double v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    long long v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXSyntheticAsset.m", 172, @"failed to unarchive data: %@", v9 object file lineNumber description];
  }

  return v8;
}

@end