@interface PXPeopleFaceCropFetchOptions
+ (BOOL)shouldUseLemonadeRoundedCorners;
+ (id)_cornerStyleStringForCornerStyle:(int64_t)a3;
+ (id)_cropFactorStringForCropFactor:(int64_t)a3;
+ (id)_deliveryModeStringForDeliveryMode:(int64_t)a3;
+ (int64_t)recommendedCornerStyleForCurrentAppConfiguration;
- (BOOL)areFetchParametersEqualtoFetchParametersOfOptions:(id)a3;
- (BOOL)isSynchronous;
- (BOOL)shouldCacheResult;
- (BOOL)useLowMemoryMode;
- (BOOL)wantsFlippedContentsRect;
- (BOOL)wantsSmallFaceRect;
- (CGSize)clientTargetSize;
- (CGSize)targetPixelSize;
- (NSString)cacheKey;
- (PHAsset)asset;
- (PHFace)face;
- (PHPerson)person;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleFaceCropFetchOptions)initWithFace:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5;
- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6;
- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5;
- (double)displayScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cornerStyle;
- (int64_t)cropFactor;
- (int64_t)deliveryMode;
- (void)_commonInitWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6;
- (void)setAsset:(id)a3;
- (void)setCornerStyle:(int64_t)a3;
- (void)setCropFactor:(int64_t)a3;
- (void)setDeliveryMode:(int64_t)a3;
- (void)setIsSynchronous:(BOOL)a3;
- (void)setShouldCacheResult:(BOOL)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setWantsFlippedContentsRect:(BOOL)a3;
- (void)setWantsSmallFaceRect:(BOOL)a3;
@end

@implementation PXPeopleFaceCropFetchOptions

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (PHPhotoLibrary)photoLibrary
{
  v3 = [(PXPeopleFaceCropFetchOptions *)self person];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 photoLibrary];
  }
  else
  {
    v6 = [(PXPeopleFaceCropFetchOptions *)self face];
    v5 = [v6 photoLibrary];
  }
  return (PHPhotoLibrary *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = [(PXPeopleFaceCropFetchOptions *)self person];
  if (v6
    && (v7 = (void *)v6,
        [(PXPeopleFaceCropFetchOptions *)self face],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = +[PXPeopleFaceCropFetchOptions allocWithZone:a3];
    v10 = [(PXPeopleFaceCropFetchOptions *)self person];
    v11 = [(PXPeopleFaceCropFetchOptions *)self face];
    [(PXPeopleFaceCropFetchOptions *)self clientTargetSize];
    double v13 = v12;
    double v15 = v14;
    [(PXPeopleFaceCropFetchOptions *)self displayScale];
    v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v9, "initWithPerson:face:targetSize:displayScale:", v10, v11, v13, v15, v16);
  }
  else
  {
    v18 = [(PXPeopleFaceCropFetchOptions *)self person];

    if (v18)
    {
      v19 = +[PXPeopleFaceCropFetchOptions allocWithZone:a3];
      v10 = [(PXPeopleFaceCropFetchOptions *)self person];
      [(PXPeopleFaceCropFetchOptions *)self clientTargetSize];
      double v21 = v20;
      double v23 = v22;
      [(PXPeopleFaceCropFetchOptions *)self displayScale];
      uint64_t v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v19, "initWithPerson:targetSize:displayScale:", v10, v21, v23, v24);
    }
    else
    {
      v26 = [(PXPeopleFaceCropFetchOptions *)self face];

      if (!v26)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a2 object:self file:@"PXPeopleFaceCropFetchOptions.m" lineNumber:130 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v27 = +[PXPeopleFaceCropFetchOptions allocWithZone:a3];
      v10 = [(PXPeopleFaceCropFetchOptions *)self face];
      [(PXPeopleFaceCropFetchOptions *)self clientTargetSize];
      double v29 = v28;
      double v31 = v30;
      [(PXPeopleFaceCropFetchOptions *)self displayScale];
      uint64_t v25 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v27, "initWithFace:targetSize:displayScale:", v10, v29, v31, v32);
    }
    v17 = (PXPeopleFaceCropFetchOptions *)v25;
  }

  [(PXPeopleFaceCropFetchOptions *)v17 setCropFactor:[(PXPeopleFaceCropFetchOptions *)self cropFactor]];
  [(PXPeopleFaceCropFetchOptions *)v17 setCornerStyle:[(PXPeopleFaceCropFetchOptions *)self cornerStyle]];
  [(PXPeopleFaceCropFetchOptions *)v17 setWantsFlippedContentsRect:[(PXPeopleFaceCropFetchOptions *)self wantsFlippedContentsRect]];
  v33 = [(PXPeopleFaceCropFetchOptions *)self asset];
  [(PXPeopleFaceCropFetchOptions *)v17 setAsset:v33];

  [(PXPeopleFaceCropFetchOptions *)v17 setDeliveryMode:[(PXPeopleFaceCropFetchOptions *)self deliveryMode]];
  [(PXPeopleFaceCropFetchOptions *)v17 setIsSynchronous:[(PXPeopleFaceCropFetchOptions *)self isSynchronous]];
  [(PXPeopleFaceCropFetchOptions *)v17 setShouldCacheResult:[(PXPeopleFaceCropFetchOptions *)self shouldCacheResult]];
  [(PXPeopleFaceCropFetchOptions *)v17 setWantsSmallFaceRect:[(PXPeopleFaceCropFetchOptions *)self wantsSmallFaceRect]];
  [(PXPeopleFaceCropFetchOptions *)v17 setUseLowMemoryMode:[(PXPeopleFaceCropFetchOptions *)self useLowMemoryMode]];
  return v17;
}

- (NSString)cacheKey
{
  uint64_t v4 = [(PXPeopleFaceCropFetchOptions *)self person];
  uint64_t v5 = [(PXPeopleFaceCropFetchOptions *)self face];
  if (!(v4 | v5))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPeopleFaceCropFetchOptions.m", 112, @"Invalid parameter not satisfying: %@", @"person || face" object file lineNumber description];
  }
  uint64_t v6 = [(id)v4 localIdentifier];
  if (![v6 length])
  {
    uint64_t v7 = [(id)v5 localIdentifier];

    uint64_t v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFace)face
{
  return self->_face;
}

- (BOOL)wantsSmallFaceRect
{
  return self->_wantsSmallFaceRect;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (BOOL)wantsFlippedContentsRect
{
  return self->_wantsFlippedContentsRect;
}

- (int64_t)cropFactor
{
  return self->_cropFactor;
}

- (BOOL)shouldCacheResult
{
  return self->_shouldCacheResult;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (void)setCropFactor:(int64_t)a3
{
  self->_cropFactor = a3;
}

- (void)setCornerStyle:(int64_t)a3
{
  self->_cornerStyle = a3;
}

- (void)setAsset:(id)a3
{
}

- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if (!v10)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPeopleFaceCropFetchOptions.m", 37, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v11 = [(PXPeopleFaceCropFetchOptions *)&v15 init];
  double v12 = v11;
  if (v11) {
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v11, "_commonInitWithPerson:face:targetSize:displayScale:", v10, 0, width, height, a5);
  }

  return v12;
}

- (void)_commonInitWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  v11 = (PHPerson *)a3;
  double v12 = (PHFace *)a4;
  if (height <= 0.0) {
    PXAssertGetLog();
  }
  if (width <= 0.0) {
    PXAssertGetLog();
  }
  if (a6 < 1.0) {
    PXAssertGetLog();
  }
  self->_clientTargetSize.double width = width;
  self->_clientTargetSize.double height = height;
  self->_displayScale = a6;
  self->_targetPixelSize.double width = width * a6;
  self->_targetPixelSize.double height = height * a6;
  self->_cropFactor = 0;
  self->_cornerStyle = +[PXPeopleFaceCropFetchOptions recommendedCornerStyleForCurrentAppConfiguration];
  self->_wantsFlippedContentsRect = 0;
  person = self->_person;
  self->_person = v11;
  double v14 = v11;

  face = self->_face;
  self->_face = v12;

  self->_deliveryMode = 0;
  self->_shouldCacheResult = 1;
}

+ (int64_t)recommendedCornerStyleForCurrentAppConfiguration
{
  if (+[PXPeopleFaceCropFetchOptions shouldUseLemonadeRoundedCorners])
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

+ (BOOL)shouldUseLemonadeRoundedCorners
{
  return 1;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (CGSize)clientTargetSize
{
  double width = self->_clientTargetSize.width;
  double height = self->_clientTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setWantsSmallFaceRect:(BOOL)a3
{
  self->_wantsSmallFaceRect = a3;
}

- (void)setWantsFlippedContentsRect:(BOOL)a3
{
  self->_wantsFlippedContentsRect = a3;
}

- (void)setShouldCacheResult:(BOOL)a3
{
  self->_shouldCacheResult = a3;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (CGSize)targetPixelSize
{
  double width = self->_targetPixelSize.width;
  double height = self->_targetPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)areFetchParametersEqualtoFetchParametersOfOptions:(id)a3
{
  id v4 = a3;
  [(PXPeopleFaceCropFetchOptions *)self clientTargetSize];
  double v6 = v5;
  double v8 = v7;
  [v4 clientTargetSize];
  if (v6 != v10 || v8 != v9) {
    goto LABEL_19;
  }
  [(PXPeopleFaceCropFetchOptions *)self displayScale];
  double v13 = v12;
  [v4 displayScale];
  if (v13 != v14) {
    goto LABEL_19;
  }
  int64_t v15 = [(PXPeopleFaceCropFetchOptions *)self cropFactor];
  if (v15 != [v4 cropFactor]) {
    goto LABEL_19;
  }
  int64_t v16 = [(PXPeopleFaceCropFetchOptions *)self cornerStyle];
  if (v16 != [v4 cornerStyle]) {
    goto LABEL_19;
  }
  id v17 = [(PXPeopleFaceCropFetchOptions *)self person];
  id v18 = [v4 person];
  if (v17 == v18)
  {
  }
  else
  {
    v19 = v18;
    char v20 = [v17 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_19;
    }
  }
  id v21 = [(PXPeopleFaceCropFetchOptions *)self face];
  id v22 = [v4 face];
  if (v21 == v22)
  {
  }
  else
  {
    double v23 = v22;
    char v24 = [v21 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  id v25 = [(PXPeopleFaceCropFetchOptions *)self asset];
  id v26 = [v4 asset];
  if (v25 == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  char v28 = [v25 isEqual:v26];

  if (v28)
  {
LABEL_22:
    BOOL v31 = [(PXPeopleFaceCropFetchOptions *)self wantsFlippedContentsRect];
    int v29 = v31 ^ [v4 wantsFlippedContentsRect] ^ 1;
    goto LABEL_20;
  }
LABEL_19:
  LOBYTE(v29) = 0;
LABEL_20:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (id)description
{
  v27.receiver = self;
  v27.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v3 = [(PXPeopleFaceCropFetchOptions *)&v27 description];
  id v4 = (void *)[v3 mutableCopy];

  double v5 = [(PXPeopleFaceCropFetchOptions *)self person];
  double v6 = [v5 localIdentifier];
  [v4 appendFormat:@":\nperson: %@,\n", v6];

  double v7 = [(PXPeopleFaceCropFetchOptions *)self face];
  double v8 = [v7 localIdentifier];
  [v4 appendFormat:@"face: %@,\n", v8];

  [(PXPeopleFaceCropFetchOptions *)self clientTargetSize];
  double v9 = NSStringFromCGSize(v29);
  [v4 appendFormat:@"targetSize: %@,\n", v9];
  [(PXPeopleFaceCropFetchOptions *)self displayScale];
  objc_msgSend(v4, "appendFormat:", @"displayScale: %f,\n", v10);
  if ([(PXPeopleFaceCropFetchOptions *)self wantsFlippedContentsRect]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  double v12 = v11;
  [v4 appendFormat:@"wantsFlippedContentsRect: %@\n", v12];

  double v13 = [(PXPeopleFaceCropFetchOptions *)self asset];
  double v14 = [v13 localIdentifier];
  [v4 appendFormat:@"asset: %@,\n", v14];

  int64_t v15 = +[PXPeopleFaceCropFetchOptions _cropFactorStringForCropFactor:[(PXPeopleFaceCropFetchOptions *)self cropFactor]];
  [v4 appendFormat:@"cropFactor: %@,\n", v15];

  int64_t v16 = +[PXPeopleFaceCropFetchOptions _cornerStyleStringForCornerStyle:[(PXPeopleFaceCropFetchOptions *)self cornerStyle]];
  [v4 appendFormat:@"cornerStyle: %@,\n", v16];

  id v17 = +[PXPeopleFaceCropFetchOptions _deliveryModeStringForDeliveryMode:[(PXPeopleFaceCropFetchOptions *)self deliveryMode]];
  [v4 appendFormat:@"deliveryMode: %@,\n", v17];

  if ([(PXPeopleFaceCropFetchOptions *)self isSynchronous]) {
    id v18 = @"YES";
  }
  else {
    id v18 = @"NO";
  }
  v19 = v18;
  [v4 appendFormat:@"isSynchronous: %@,\n", v19];

  if ([(PXPeopleFaceCropFetchOptions *)self shouldCacheResult]) {
    char v20 = @"YES";
  }
  else {
    char v20 = @"NO";
  }
  id v21 = v20;
  [v4 appendFormat:@"cacheResult: %@\n", v21];

  if ([(PXPeopleFaceCropFetchOptions *)self wantsSmallFaceRect]) {
    id v22 = @"YES";
  }
  else {
    id v22 = @"NO";
  }
  double v23 = v22;
  [v4 appendFormat:@"wantsSmallFaceRect: %@\n", v23];

  if ([(PXPeopleFaceCropFetchOptions *)self useLowMemoryMode]) {
    char v24 = @"YES";
  }
  else {
    char v24 = @"NO";
  }
  id v25 = v24;
  [v4 appendFormat:@"useLowMemoryMode: %@\n", v25];

  return v4;
}

- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v12 = a3;
  id v13 = a4;
  double v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXPeopleFaceCropFetchOptions.m", 55, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  double v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXPeopleFaceCropFetchOptions.m", 56, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];

LABEL_3:
  id v15 = [v12 photoLibrary];
  id v16 = [v14 photoLibrary];
  if (v15 == v16)
  {
  }
  else
  {
    id v17 = v16;
    char v18 = [v15 isEqual:v16];

    if ((v18 & 1) == 0) {
      PXAssertGetLog();
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v19 = [(PXPeopleFaceCropFetchOptions *)&v24 init];
  char v20 = v19;
  if (v19) {
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v19, "_commonInitWithPerson:face:targetSize:displayScale:", v12, v14, width, height, a6);
  }

  return v20;
}

- (PXPeopleFaceCropFetchOptions)initWithFace:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if (!v10)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPeopleFaceCropFetchOptions.m", 46, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v11 = [(PXPeopleFaceCropFetchOptions *)&v15 init];
  id v12 = v11;
  if (v11) {
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v11, "_commonInitWithPerson:face:targetSize:displayScale:", 0, v10, width, height, a5);
  }

  return v12;
}

+ (id)_deliveryModeStringForDeliveryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5DB9618[a3];
  }
}

+ (id)_cornerStyleStringForCornerStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5DB9600[a3];
  }
}

+ (id)_cropFactorStringForCropFactor:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E5DB95E0[a3];
  }
}

@end