@interface PXFileBackedAsset
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isAnimatedImage;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileBackedAsset:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isPartOfStack;
- (BOOL)representsBurst;
- (CGAffineTransform)transform;
- (CGPoint)positionOffset;
- (CGRect)acceptableCropRect;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (CGSize)size;
- (CLLocation)location;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSString)description;
- (NSString)uniformTypeIdentifier;
- (NSString)uuid;
- (NSURL)url;
- (PXFileBackedAsset)init;
- (PXFileBackedAsset)initWithDescription:(id)a3;
- (PXFileBackedAsset)initWithURL:(id)a3;
- (PXFileBackedAsset)initWithURL:(id)a3 previewImage:(id)a4;
- (UIImage)previewImage;
- (double)aspectRatio;
- (double)weight;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (unsigned)playbackVariation;
- (void)_loadFileMetadataIfNeeded;
@end

@implementation PXFileBackedAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fileBackedUUID, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isAnimatedImage
{
  return [(PXFileBackedAsset *)self playbackStyle] == 2;
}

- (BOOL)canPlayPhotoIris
{
  return [(PXFileBackedAsset *)self playbackStyle] == 3;
}

- (BOOL)canPlayLoopingVideo
{
  return [(PXFileBackedAsset *)self playbackStyle] == 5;
}

- (void)_loadFileMetadataIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_metadata)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageURL:obj->_url contentType:0 options:13 timeZoneLookup:0 cacheImageSource:0 cacheImageData:0];
    metadata = obj->_metadata;
    obj->_metadata = (PFMetadata *)v3;

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (CLLocation)location
{
  [(PXFileBackedAsset *)self _loadFileMetadataIfNeeded];
  metadata = self->_metadata;
  return (CLLocation *)[(PFMetadata *)metadata gpsLocation];
}

- (NSDate)creationDate
{
  [(PXFileBackedAsset *)self _loadFileMetadataIfNeeded];
  metadata = self->_metadata;
  return (NSDate *)[(PFMetadata *)metadata creationDate];
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
}

- (double)aspectRatio
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PXFileBackedAsset *)self size];
  if (v3 <= 0.0)
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(PXFileBackedAsset *)self size];
      v5 = NSStringFromCGSize(v12);
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "PXFileBackedAsset %@: Invalid size encountered: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [(PXFileBackedAsset *)self size];
  PXSizeGetAspectRatio();
}

- (CGPoint)positionOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
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

- (CGRect)acceptableCropRect
{
  double v2 = *(double *)off_1E5DAB010;
  double v3 = *((double *)off_1E5DAB010 + 1);
  double v4 = *((double *)off_1E5DAB010 + 2);
  double v5 = *((double *)off_1E5DAB010 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2 = *(double *)off_1E5DAB010;
  double v3 = *((double *)off_1E5DAB010 + 1);
  double v4 = *((double *)off_1E5DAB010 + 2);
  double v5 = *((double *)off_1E5DAB010 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)size
{
  [(PXFileBackedAsset *)self _loadFileMetadataIfNeeded];
  metadata = self->_metadata;
  [(PFMetadata *)metadata orientedPixelSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)weight
{
  return 1.0;
}

- (NSString)uuid
{
  fileBackedUUID = self->_fileBackedUUID;
  if (!fileBackedUUID)
  {
    double v4 = [MEMORY[0x1E4F29128] UUID];
    double v5 = [v4 UUIDString];
    v6 = self->_fileBackedUUID;
    self->_fileBackedUUID = v5;

    fileBackedUUID = self->_fileBackedUUID;
  }
  return fileBackedUUID;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXFileBackedAsset *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXFileBackedAsset *)self isEqualToFileBackedAsset:v4];
  }

  return v5;
}

- (BOOL)isEqualToFileBackedAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXFileBackedAsset *)self url];
  v6 = [v4 url];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 1;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pixelHeight
{
  [(PXFileBackedAsset *)self size];
  return (unint64_t)v2;
}

- (unint64_t)pixelWidth
{
  [(PXFileBackedAsset *)self size];
  return (unint64_t)v2;
}

- (float)audioScore
{
  return 0.0;
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
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"isInCloud"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)representsBurst
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"representsBurst"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isFavorite
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"favorite"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unsigned)playbackVariation
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"playbackVariation"];
  char v3 = v2;
  if (v2) {
    unsigned __int16 v4 = [v2 shortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (int64_t)playbackStyle
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"playbackStyle"];
  char v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 shortValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (unint64_t)mediaSubtypes
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"mediaSubtypes"];
  char v3 = v2;
  if (v2) {
    unint64_t v4 = (int)[v2 shortValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)mediaType
{
  double v2 = [(PXFileBackedAssetDescription *)self->_description objectForKeyedSubscript:@"mediaType"];
  char v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 shortValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)PXFileBackedAsset;
  char v3 = [(PXFileBackedAsset *)&v8 description];
  int64_t v4 = [(PXFileBackedAsset *)self url];
  BOOL v5 = [(PXFileBackedAsset *)self previewImage];
  v6 = [v3 stringByAppendingFormat:@" - URL: %@, PreviewImage: %@", v4, v5];

  return (NSString *)v6;
}

- (PXFileBackedAsset)initWithURL:(id)a3 previewImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    CGSize v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXFileBackedAsset.m", 99, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  __int16 v9 = +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:v7 previewImage:v8];
  v10 = [(PXFileBackedAsset *)self initWithDescription:v9];

  return v10;
}

- (PXFileBackedAsset)initWithURL:(id)a3
{
  return [(PXFileBackedAsset *)self initWithURL:a3 previewImage:0];
}

- (PXFileBackedAsset)initWithDescription:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXFileBackedAsset;
  v6 = [(PXFileBackedAsset *)&v18 init];
  if (v6)
  {
    id v7 = [v5 url];
    uint64_t v8 = [v7 copy];
    url = v6->_url;
    v6->_url = (NSURL *)v8;

    uint64_t v10 = [v5 previewImage];
    previewImage = v6->_previewImage;
    v6->_previewImage = (UIImage *)v10;

    CGSize v12 = (void *)MEMORY[0x1E4F442D8];
    v13 = [(NSURL *)v6->_url pathExtension];
    v14 = [v12 typeWithFilenameExtension:v13];
    uint64_t v15 = [v14 identifier];
    uniformTypeIdentifier = v6->_uniformTypeIdentifier;
    v6->_uniformTypeIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v6->_description, a3);
  }

  return v6;
}

- (PXFileBackedAsset)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFileBackedAsset.m", 79, @"%s is not available as initializer", "-[PXFileBackedAsset init]");

  abort();
}

@end