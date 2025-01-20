@interface PXImportItemViewModel
+ (BOOL)hasPanoramaImageDimensions:(CGSize)a3;
+ (NSString)alreadyImportedGroupIdentifier;
+ (id)dateFormatter;
+ (id)importAssetsFromModels:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)ipx_isFavorite;
- (BOOL)isAnimatedImage;
- (BOOL)isDeleted;
- (BOOL)isDuplicate;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImportItemViewModel:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHidden;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isLivePhoto;
- (BOOL)isMediaAsset;
- (BOOL)isNotYetImported;
- (BOOL)isPanoramicImage;
- (BOOL)isPartOfStack;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (BOOL)isTemporaryPlaceholder;
- (BOOL)px_canUseLocation;
- (BOOL)px_hasKeywords;
- (BOOL)px_isActionModeVideo;
- (BOOL)px_isAudio;
- (BOOL)px_isCinematicVideo;
- (BOOL)px_isDepthEffect;
- (BOOL)px_isExtendedPropertiesProcessed;
- (BOOL)px_isH264;
- (BOOL)px_isHEVC;
- (BOOL)px_isHidden;
- (BOOL)px_isImage;
- (BOOL)px_isInTrash;
- (BOOL)px_isLivePhoto;
- (BOOL)px_isPanorama;
- (BOOL)px_isProRes;
- (BOOL)px_isScreenRecording;
- (BOOL)px_isScreenshot;
- (BOOL)px_isSelfie;
- (BOOL)px_isSloMo;
- (BOOL)px_isSpatialMedia;
- (BOOL)px_isTimelapse;
- (BOOL)px_isVideo;
- (BOOL)px_representsBurst;
- (BOOL)px_reverseLocationDataIsValid;
- (BOOL)px_shotWithNightMode;
- (BOOL)px_supportsImageProperties;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (CGSize)largeThumbnailSize;
- (CGSize)thumbnailSize;
- (CLLocation)px_originalLocation;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSDate)fileCreationDate;
- (NSDate)importDate;
- (NSDate)localCreationDate;
- (NSDate)px_creationDate;
- (NSDictionary)imageRepresentations;
- (NSError)thumbnailError;
- (NSMutableDictionary)assetRequestsBySize;
- (NSMutableDictionary)imageRepresentationsBySize;
- (NSMutableDictionary)thumbnailRequestsBySize;
- (NSNumber)px_FPS;
- (NSNumber)px_ISORating;
- (NSNumber)px_aperture;
- (NSNumber)px_bitRate;
- (NSNumber)px_digitalZoomRatio;
- (NSNumber)px_duration;
- (NSNumber)px_exposureBias;
- (NSNumber)px_filesize;
- (NSNumber)px_flash;
- (NSNumber)px_focalLength;
- (NSNumber)px_focalLengthIn35mm;
- (NSNumber)px_meteringMode;
- (NSNumber)px_sampleRate;
- (NSNumber)px_semanticStylePreset;
- (NSNumber)px_shutterSpeed;
- (NSNumber)px_whiteBalance;
- (NSString)debugDisplayName;
- (NSString)deleteSession;
- (NSString)description;
- (NSString)fileName;
- (NSString)kind;
- (NSString)localizedGeoDescription;
- (NSString)px_assetDescription;
- (NSString)px_burstUUID;
- (NSString)px_codec;
- (NSString)px_formattedCameraModel;
- (NSString)px_lensModel;
- (NSString)px_make;
- (NSString)px_model;
- (NSString)px_title;
- (NSString)px_uniformTypeIdentifier;
- (NSString)uniformTypeIdentifier;
- (NSString)uuid;
- (NSTimeZone)px_timeZone;
- (PHImportAsset)importAsset;
- (PHImportAssetDataRequest)thumbnailRequest;
- (PXImportAssetCollection)assetCollection;
- (PXImportDisplayDelegate)displayDelegate;
- (PXImportItemViewModel)init;
- (PXImportItemViewModel)initWithImportAsset:(id)a3;
- (PXImportItemViewModel)initWithKind:(id)a3 selectable:(BOOL)a4;
- (PXIntSize_st)px_resolution;
- (double)aspectRatio;
- (double)duration;
- (double)imageProcessingEndTime;
- (double)imageProcessingStartTime;
- (float)audioScore;
- (id)accessibilityLabel;
- (id)assetDataRequestForRequestSize:(unint64_t)a3;
- (id)groupIdentifier;
- (id)modificationDate;
- (id)px_localizedGeoDescriptionForRTL:(BOOL)a3;
- (id)thumbnailRequestsForRequestSize:(unint64_t)a3;
- (int64_t)badgeType;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)originalFilesize;
- (int64_t)playbackStyle;
- (int64_t)state;
- (int64_t)thumbnailIndex;
- (unint64_t)hash;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)px_fileType;
- (unint64_t)px_originalFileType;
- (unint64_t)px_type;
- (unsigned)playbackVariation;
- (unsigned)px_audioTrackFormat;
- (unsigned)px_fetchCloudLocalState;
- (void)addImageRepresentation:(id)a3;
- (void)addThumbnailRequest:(id)a3;
- (void)performChanges:(id)a3;
- (void)removeAssetDataRequestForRequestSize:(unint64_t)a3;
- (void)removeThumbnailRequest:(id)a3;
- (void)setAssetCollection:(id)a3;
- (void)setAssetDataRequest:(id)a3 forRequestSize:(unint64_t)a4;
- (void)setAssetRequestsBySize:(id)a3;
- (void)setDeleteSession:(id)a3;
- (void)setDisplayDelegate:(id)a3;
- (void)setDuplicate:(BOOL)a3;
- (void)setImageProcessingEndTime:(double)a3;
- (void)setImageProcessingStartTime:(double)a3;
- (void)setImageRepresentationsBySize:(id)a3;
- (void)setImportDate:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setLargeThumbnailSize:(CGSize)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setThumbnailError:(id)a3;
- (void)setThumbnailRequest:(id)a3;
- (void)setThumbnailRequestsBySize:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
@end

@implementation PXImportItemViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailRequestsBySize, 0);
  objc_storeStrong((id *)&self->_assetRequestsBySize, 0);
  objc_storeStrong((id *)&self->_imageRepresentationsBySize, 0);
  objc_storeStrong((id *)&self->_deleteSession, 0);
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_thumbnailError, 0);
  objc_destroyWeak((id *)&self->_thumbnailRequest);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_destroyWeak((id *)&self->_assetCollection);
  objc_storeStrong((id *)&self->_importAsset, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

- (void)setThumbnailRequestsBySize:(id)a3
{
}

- (NSMutableDictionary)thumbnailRequestsBySize
{
  return self->_thumbnailRequestsBySize;
}

- (void)setAssetRequestsBySize:(id)a3
{
}

- (NSMutableDictionary)assetRequestsBySize
{
  return self->_assetRequestsBySize;
}

- (void)setImageRepresentationsBySize:(id)a3
{
}

- (NSMutableDictionary)imageRepresentationsBySize
{
  return self->_imageRepresentationsBySize;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (NSString)deleteSession
{
  return self->_deleteSession;
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (int64_t)thumbnailIndex
{
  return self->_thumbnailIndex;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isDuplicate
{
  return self->_duplicate;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setImageProcessingEndTime:(double)a3
{
  self->_imageProcessingEndTime = a3;
}

- (double)imageProcessingEndTime
{
  return self->_imageProcessingEndTime;
}

- (void)setImageProcessingStartTime:(double)a3
{
  self->_imageProcessingStartTime = a3;
}

- (double)imageProcessingStartTime
{
  return self->_imageProcessingStartTime;
}

- (void)setThumbnailError:(id)a3
{
}

- (NSError)thumbnailError
{
  return self->_thumbnailError;
}

- (void)setThumbnailRequest:(id)a3
{
}

- (PHImportAssetDataRequest)thumbnailRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailRequest);
  return (PHImportAssetDataRequest *)WeakRetained;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLargeThumbnailSize:(CGSize)a3
{
  self->_largeThumbnailSize = a3;
}

- (CGSize)largeThumbnailSize
{
  double width = self->_largeThumbnailSize.width;
  double height = self->_largeThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setAssetCollection:(id)a3
{
}

- (PXImportAssetCollection)assetCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCollection);
  return (PXImportAssetCollection *)WeakRetained;
}

- (PHImportAsset)importAsset
{
  return self->_importAsset;
}

- (void)setDisplayDelegate:(id)a3
{
}

- (PXImportDisplayDelegate)displayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);
  return (PXImportDisplayDelegate *)WeakRetained;
}

- (id)accessibilityLabel
{
  v3 = objc_opt_new();
  v4 = PLLocalizedFrameworkString();
  v5 = [(PXImportItemViewModel *)self importAsset];
  v6 = [v5 fileCreationDate];

  v7 = [(PXImportItemViewModel *)self kind];
  char v8 = [v7 isEqualToString:@"PXImportItemViewModelKindExpansionPlaceholder"];

  if (v8) {
    goto LABEL_4;
  }
  v9 = [(PXImportItemViewModel *)self importAsset];
  char v10 = [v9 isImage];

  if ((v10 & 1) != 0
    || ([(PXImportItemViewModel *)self importAsset],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isMovie],
        v11,
        v12))
  {
LABEL_4:
    uint64_t v13 = PLLocalizedFrameworkString();

    v4 = (void *)v13;
  }
  [v3 appendString:v4];
  [v3 appendString:@"."];
  if (v6)
  {
    v14 = NSString;
    v15 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v6 dateStyle:2 timeStyle:1];
    v16 = [v14 stringWithFormat:@"%@.", v15];
    [v3 appendString:v16];
  }
  v17 = [(PXImportItemViewModel *)self importDate];

  if (v17)
  {
    v18 = PLLocalizedFrameworkString();
    [v3 appendString:v18];

    [v3 appendString:@"."];
  }
  if ([(PXImportItemViewModel *)self isSelected])
  {
    v19 = PLLocalizedFrameworkString();
    [v3 appendString:v19];

    [v3 appendString:@"."];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

- (id)groupIdentifier
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(PXImportItemViewModel *)self isDuplicate])
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_3:
    v5 = (void *)v4;
    goto LABEL_13;
  }
  v6 = +[PXImportSettings sharedInstance];
  int v7 = [v6 groupItemsByEXIFDate];

  if (v7)
  {
    char v8 = [(PXImportItemViewModel *)self importAsset];
    v5 = [v8 creationDate];

    if (!v5)
    {
      v9 = _importGridLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        __int16 v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%s: import asset does not have an EXIF date. Resorting to file creation date. %@", (uint8_t *)&v20, 0x16u);
      }

      uint64_t v4 = [(PXImportItemViewModel *)self fileCreationDate];
      goto LABEL_3;
    }
  }
  else
  {
    v5 = [(PXImportItemViewModel *)self fileCreationDate];
    if (!v5)
    {
      char v10 = _importGridLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        __int16 v22 = 2112;
        v23 = self;
        _os_log_error_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "%s: import asset does not have a file creation date (stable). Resorting to image date (possibly unstable). %@", (uint8_t *)&v20, 0x16u);
      }

      v11 = [(PXImportItemViewModel *)self importAsset];
      v5 = [v11 creationDate];
    }
  }
LABEL_13:
  int v12 = [(id)objc_opt_class() dateFormatter];
  uint64_t v13 = [v12 stringFromDate:v5];

  if (v13)
  {
    p_collectionIdentifier = &self->_collectionIdentifier;
    if (!self->_collectionIdentifier)
    {
LABEL_20:
      objc_storeStrong((id *)p_collectionIdentifier, v13);
      v16 = *p_collectionIdentifier;
      goto LABEL_21;
    }
    if ((objc_msgSend(v13, "isEqualToString:") & 1) == 0)
    {
      v15 = _importGridLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        __int16 v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "%s: *** warning*** model collection identifier has changed. %@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXImportItemViewModel.m" lineNumber:420 description:@"Unable to create a group identifier because a date for the asset could not be determined."];

    p_collectionIdentifier = &self->_collectionIdentifier;
  }
  v16 = *p_collectionIdentifier;
  if (!*p_collectionIdentifier) {
    goto LABEL_20;
  }
LABEL_21:
  v17 = v16;

  return v17;
}

- (NSDate)fileCreationDate
{
  return (NSDate *)[(PHImportAsset *)self->_importAsset fileCreationDate];
}

- (NSString)fileName
{
  v3 = [(PHImportAsset *)self->_importAsset createdFileName];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHImportAsset *)self->_importAsset fileName];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)removeThumbnailRequest:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 requestSize];
  id v5 = [(PXImportItemViewModel *)self thumbnailRequestsBySize];
  v6 = [NSNumber numberWithUnsignedInteger:v4];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if (v7) {
    [v7 removeObject:v8];
  }
}

- (void)addThumbnailRequest:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(PXImportItemViewModel *)self thumbnailRequestsBySize];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    [(PXImportItemViewModel *)self setThumbnailRequestsBySize:v5];
  }
  uint64_t v6 = [v12 requestSize];
  int v7 = [(PXImportItemViewModel *)self thumbnailRequestsBySize];
  id v8 = [NSNumber numberWithUnsignedInteger:v6];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    v9 = [MEMORY[0x1E4F1CA80] set];
    char v10 = [(PXImportItemViewModel *)self thumbnailRequestsBySize];
    v11 = [NSNumber numberWithUnsignedInteger:v6];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  [v9 addObject:v12];
}

- (id)thumbnailRequestsForRequestSize:(unint64_t)a3
{
  uint64_t v4 = [(PXImportItemViewModel *)self thumbnailRequestsBySize];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  int v7 = (void *)[v6 copy];
  return v7;
}

- (void)removeAssetDataRequestForRequestSize:(unint64_t)a3
{
  id v5 = [(PXImportItemViewModel *)self assetRequestsBySize];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:0 forKeyedSubscript:v4];
}

- (void)setAssetDataRequest:(id)a3 forRequestSize:(unint64_t)a4
{
  id v7 = a3;
  id v8 = [(PXImportItemViewModel *)self assetRequestsBySize];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    [(PXImportItemViewModel *)self setAssetRequestsBySize:v9];
  }
  char v10 = [(PXImportItemViewModel *)self assetRequestsBySize];
  v11 = [NSNumber numberWithUnsignedInteger:a4];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXImportItemViewModel.m" lineNumber:296 description:@"Overwriting an existing asset data request with new one"];
  }
  id v15 = [(PXImportItemViewModel *)self assetRequestsBySize];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
  [v15 setObject:v7 forKeyedSubscript:v13];
}

- (id)assetDataRequestForRequestSize:(unint64_t)a3
{
  uint64_t v4 = [(PXImportItemViewModel *)self assetRequestsBySize];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSDictionary)imageRepresentations
{
  v3 = [(PXImportItemViewModel *)self imageRepresentationsBySize];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = [(PXImportItemViewModel *)self imageRepresentationsBySize];
    uint64_t v6 = [v4 dictionaryWithDictionary:v5];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v6;
}

- (void)setIsDeleted:(BOOL)a3
{
  if (self->_isDeleted != a3)
  {
    self->_isDeleted = a3;
    [(PXImportItemViewModel *)self signalChange:128];
  }
}

- (void)setDeleteSession:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_deleteSession, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_deleteSession, a3);
    [(PXImportItemViewModel *)self signalChange:64];
  }
}

- (void)setImportDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_importDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_importDate, a3);
    [(PXImportItemViewModel *)self signalChange:32];
  }
}

- (void)addImageRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PXImportItemViewModel *)self imageRepresentationsBySize];

    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      [(PXImportItemViewModel *)self setImageRepresentationsBySize:v6];
    }
    id v7 = [(PXImportItemViewModel *)self imageRepresentationsBySize];
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    [v7 setObject:v4 forKeyedSubscript:v8];
  }
  [(PXImportItemViewModel *)self signalChange:256];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXImportItemViewModel *)self signalChange:16];
  }
}

- (void)setDuplicate:(BOOL)a3
{
  if (self->_duplicate != a3) {
    self->_duplicate = a3;
  }
}

- (void)setSelectable:(BOOL)a3
{
  if (self->_selectable != a3)
  {
    if (!a3
      && [(PXImportItemViewModel *)self isSelected]
      && [(PXImportItemViewModel *)self isSelected])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PXImportItemViewModel.m" lineNumber:220 description:@"Attemping to mark import view model as unselectable while it is selected."];
    }
    self->_selectable = a3;
    [(PXImportItemViewModel *)self signalChange:4];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (a3) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [(PXImportItemViewModel *)self signalChange:v3];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXImportItemViewModel;
  [(PXImportItemViewModel *)&v3 performChanges:a3];
}

- (BOOL)isPanoramicImage
{
  objc_super v3 = [(PXImportItemViewModel *)self importAsset];
  [v3 exifPixelSize];
  double v5 = v4;
  double v7 = v6;

  int v8 = objc_msgSend((id)objc_opt_class(), "hasPanoramaImageDimensions:", v5, v7);
  if (v8)
  {
    v9 = [(PXImportItemViewModel *)self importAsset];
    char v10 = [v9 isImage];

    LOBYTE(v8) = v10;
  }
  return v8;
}

- (int64_t)badgeType
{
  if ([(PXImportItemViewModel *)self state] == 1) {
    return 2;
  }
  if ([(PXImportItemViewModel *)self isSelected]) {
    return 1;
  }
  if ([(PXImportItemViewModel *)self state] == 3) {
    return 4;
  }
  double v4 = [(PXImportItemViewModel *)self importDate];

  if (v4) {
    return 3;
  }
  else {
    return 0;
  }
}

- (NSString)uniformTypeIdentifier
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  objc_super v3 = [v2 contentType];
  double v4 = [v3 identifier];

  return (NSString *)v4;
}

- (NSString)debugDisplayName
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  objc_super v3 = [v2 fileName];
  double v4 = [v2 rawAsset];

  if (v4)
  {
    double v5 = @"(+R)";
  }
  else
  {
    double v6 = [v2 videoComplement];

    if (v6)
    {
      double v5 = @"(+M)";
    }
    else
    {
      double v7 = [v2 audioAsset];

      double v5 = @"(+A)";
      if (!v7) {
        double v5 = &stru_1F00B0030;
      }
    }
  }
  int v8 = [NSString stringWithFormat:@"%@%@", v3, v5];

  return (NSString *)v8;
}

- (BOOL)isNotYetImported
{
  if ([(PXImportItemViewModel *)self isDuplicate]) {
    return 0;
  }
  double v4 = [(PXImportItemViewModel *)self importDate];
  if (v4) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [(PXImportItemViewModel *)self isMediaAsset];
  }

  return v3;
}

- (BOOL)isMediaAsset
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)uuid
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  BOOL v3 = [v2 uuid];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = [(PXImportItemViewModel *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXImportItemViewModel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXImportItemViewModel *)self isEqualToImportItemViewModel:v4];
  }

  return v5;
}

- (BOOL)isEqualToImportItemViewModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXImportItemViewModel *)self uuid];
  double v6 = [v4 uuid];
  if (v5 == v6)
  {
    int v8 = [(PXImportItemViewModel *)self kind];
    v9 = [v4 kind];
    char v7 = [v8 isEqualToString:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PXImportItemViewModel *)self fileName];
  double v6 = [v3 stringWithFormat:@"<%@:%p file: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (PXImportItemViewModel)initWithKind:(id)a3 selectable:(BOOL)a4
{
  id v7 = a3;
  int v8 = [(PXImportItemViewModel *)self initWithImportAsset:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_kind, a3);
    v9->_selectable = a4;
  }

  return v9;
}

- (PXImportItemViewModel)initWithImportAsset:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXImportItemViewModel;
  double v6 = [(PXImportItemViewModel *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_importAsset, a3);
    v7->_duplicate = [v5 isDuplicate];
    v7->_selectable = 1;
    kind = v7->_kind;
    v7->_kind = (NSString *)@"PXImportItemViewModelKindAsset";
  }
  return v7;
}

- (PXImportItemViewModel)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportItemViewModel.m", 43, @"%s is not available as initializer", "-[PXImportItemViewModel init]");

  abort();
}

+ (NSString)alreadyImportedGroupIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PXImportItemViewModel_alreadyImportedGroupIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (alreadyImportedGroupIdentifier_onceToken != -1) {
    dispatch_once(&alreadyImportedGroupIdentifier_onceToken, block);
  }
  v2 = (void *)alreadyImportedGroupIdentifier_alreadyImportedIdentifier;
  return (NSString *)v2;
}

void __55__PXImportItemViewModel_alreadyImportedGroupIdentifier__block_invoke()
{
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  v0 = [(id)objc_opt_class() dateFormatter];
  uint64_t v1 = [v0 stringFromDate:v3];
  v2 = (void *)alreadyImportedGroupIdentifier_alreadyImportedIdentifier;
  alreadyImportedGroupIdentifier_alreadyImportedIdentifier = v1;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_84058);
  }
  v2 = (void *)dateFormatter_formatter;
  return v2;
}

uint64_t __38__PXImportItemViewModel_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)dateFormatter_formatter;
  dateFormatter_formatter = (uint64_t)v0;

  [(id)dateFormatter_formatter setDateStyle:2];
  [(id)dateFormatter_formatter setTimeStyle:0];
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)dateFormatter_formatter setLocale:v2];

  id v3 = (void *)dateFormatter_formatter;
  return [v3 setDateFormat:@"yyyy-MM-dd"];
}

+ (BOOL)hasPanoramaImageDimensions:(CGSize)a3
{
  if (a3.height == 0.0) {
    return 0;
  }
  double v4 = a3.width / a3.height;
  return v4 < 0.5 || v4 > 2.0;
}

+ (id)importAssetsFromModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "importAsset", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (int64_t)originalFilesize
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  int64_t v3 = [v2 fileSize];

  return v3;
}

- (BOOL)isGuestAsset
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

- (id)modificationDate
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return 0;
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
  return (~[(PXImportItemViewModel *)self playbackStyle] & 5) == 0;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  return ([(PXImportItemViewModel *)self mediaSubtypes] >> 3) & 1;
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  int64_t v3 = [(PXImportItemViewModel *)self importAsset];
  [v3 orientedPixelSize];

  PXRectWithAspectRatioFittingRect();
}

- (double)aspectRatio
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  [v2 orientedPixelSize];
  double v4 = v3;
  double v6 = v5;

  double result = v4 / v6;
  if (v4 / v6 == 0.0) {
    return 1.0;
  }
  return result;
}

- (unsigned)playbackVariation
{
  v2 = [(PXImportItemViewModel *)self importAsset];
  double v3 = [v2 metadata];

  if ([v3 isAutoloop])
  {
    unsigned __int16 v4 = 1;
  }
  else if ([v3 isMirror])
  {
    unsigned __int16 v4 = 2;
  }
  else if ([v3 isLongExposure])
  {
    unsigned __int16 v4 = 3;
  }
  else
  {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (int64_t)playbackStyle
{
  double v3 = [(PXImportItemViewModel *)self importAsset];
  char v4 = [v3 isMovie];

  if (v4) {
    return 4;
  }
  double v6 = [(PXImportItemViewModel *)self importAsset];
  int v7 = [v6 isLivePhoto];

  if (v7) {
    return 3;
  }
  else {
    return 1;
  }
}

- (double)duration
{
  double v3 = [(PXImportItemViewModel *)self importAsset];
  if ([v3 isImage])
  {
    char v4 = 0;
  }
  else
  {
    double v5 = [(PXImportItemViewModel *)self importAsset];
    char v4 = [v5 durationTimeInterval];
  }
  [v4 doubleValue];
  double v7 = v6;

  return v7;
}

- (int64_t)isContentEqualTo:(id)a3
{
  char v4 = (PXImportItemViewModel *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self != v4)
    {
      double v5 = [(PXImportItemViewModel *)v4 uuid];
      double v6 = NSString;
      double v7 = [(PXImportItemViewModel *)self uuid];
      uint64_t v8 = [v6 stringWithFormat:@"%@", v7];

      v9 = [NSString stringWithFormat:@"%@", v5];
      if (![v8 isEqualToString:v9])
      {
        int64_t v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v10 = [(PXImportItemViewModel *)v4 creationDate];
      v11 = [(PXImportItemViewModel *)self creationDate];
      long long v12 = v11;
      if (v11 && v10)
      {
        long long v13 = [(PXImportItemViewModel *)self creationDate];
        uint64_t v14 = [v13 compare:v10];

        if (!v14)
        {
          int64_t v15 = 2;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
      uint64_t v16 = [(PXImportItemViewModel *)self creationDate];
      uint64_t v17 = v16 | v10;

      if (v17) {
        int64_t v15 = 1;
      }
      else {
        int64_t v15 = 2;
      }
      goto LABEL_16;
    }
    int64_t v15 = 1;
  }
  else
  {
    int64_t v15 = 0;
  }
LABEL_18:

  return v15;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (CGRect)faceAreaRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)pixelHeight
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  [v2 exifPixelSize];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (unint64_t)pixelWidth
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  [v2 exifPixelSize];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isPartOfStack
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
  double v3 = [(PXImportItemViewModel *)self importAsset];
  unint64_t v4 = [v3 creationDate];

  double v5 = [(PXImportItemViewModel *)self importAsset];
  double v6 = [v5 timeZone];

  double v7 = 0;
  if (v4 && v6)
  {
    double v7 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v6, "secondsFromGMTForDate:", v4));
  }

  return (NSDate *)v7;
}

- (NSDate)creationDate
{
  double v3 = [(PXImportItemViewModel *)self importAsset];
  unint64_t v4 = [v3 creationDate];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [(PXImportItemViewModel *)self importAsset];
    id v6 = [v7 fileCreationDate];
  }
  return (NSDate *)v6;
}

- (unint64_t)mediaSubtypes
{
  if ([(PXImportItemViewModel *)self mediaType] == 1)
  {
    double v3 = [(PXImportItemViewModel *)self importAsset];
    int v4 = [v3 isHDR];

    if (v4) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = [(PXImportItemViewModel *)self importAsset];
    int v7 = [v6 isLivePhoto];

    unint64_t v8 = v5 | 8;
  }
  else
  {
    if ([(PXImportItemViewModel *)self mediaType] != 2) {
      return 0;
    }
    v9 = [(PXImportItemViewModel *)self importAsset];
    int v10 = [v9 isSloMo];

    if (v10) {
      unint64_t v5 = 0x20000;
    }
    else {
      unint64_t v5 = 0;
    }
    v11 = [(PXImportItemViewModel *)self importAsset];
    int v7 = [v11 isTimelapse];

    unint64_t v8 = v5 | 0x40000;
  }
  if (v7) {
    return v8;
  }
  else {
    return v5;
  }
}

- (int64_t)mediaType
{
  double v3 = [(PXImportItemViewModel *)self importAsset];
  char v4 = [v3 isAudio];

  if (v4) {
    return 3;
  }
  id v6 = [(PXImportItemViewModel *)self importAsset];
  int v7 = [v6 isMovie];

  if (v7) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSNumber)px_semanticStylePreset
{
  return 0;
}

- (BOOL)px_isHEVC
{
  return 0;
}

- (BOOL)px_isH264
{
  return 0;
}

- (BOOL)px_isProRes
{
  return 0;
}

- (BOOL)px_isCinematicVideo
{
  return 0;
}

- (BOOL)px_shotWithNightMode
{
  return 0;
}

- (BOOL)px_isScreenRecording
{
  return 0;
}

- (BOOL)px_isScreenshot
{
  return 0;
}

- (BOOL)px_isSelfie
{
  return 0;
}

- (BOOL)px_isPanorama
{
  return 0;
}

- (BOOL)px_isSpatialMedia
{
  return 0;
}

- (BOOL)px_isActionModeVideo
{
  return 0;
}

- (BOOL)px_isDepthEffect
{
  return 0;
}

- (BOOL)px_representsBurst
{
  double v3 = [(PXImportItemViewModel *)self importAsset];
  char v4 = [v3 burstPick];
  unint64_t v5 = [v4 uuid];
  id v6 = [(PXImportItemViewModel *)self importAsset];
  int v7 = [v6 uuid];
  char v8 = [v5 isEqual:v7];

  return v8;
}

- (BOOL)px_isSloMo
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isSloMo];

  return v3;
}

- (BOOL)px_isTimelapse
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isTimelapse];

  return v3;
}

- (BOOL)px_isLivePhoto
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isLivePhoto];

  return v3;
}

- (BOOL)px_reverseLocationDataIsValid
{
  return 0;
}

- (BOOL)px_canUseLocation
{
  return 0;
}

- (id)px_localizedGeoDescriptionForRTL:(BOOL)a3
{
  return 0;
}

- (unsigned)px_audioTrackFormat
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 trackFormat];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (NSNumber)px_whiteBalance
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 whiteBalance];

  return (NSNumber *)v3;
}

- (NSNumber)px_shutterSpeed
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 exposureTime];

  return (NSNumber *)v3;
}

- (NSNumber)px_meteringMode
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 meteringMode];

  return (NSNumber *)v3;
}

- (NSString)px_formattedCameraModel
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 formattedCameraModel];

  return (NSString *)v3;
}

- (NSString)px_model
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 cameraModel];

  return (NSString *)v3;
}

- (NSString)px_make
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 cameraMake];

  return (NSString *)v3;
}

- (NSString)px_lensModel
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 lensModel];

  return (NSString *)v3;
}

- (NSNumber)px_ISORating
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 focalLength];

  return (NSNumber *)v3;
}

- (NSNumber)px_digitalZoomRatio
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 digitalZoomRatio];

  return (NSNumber *)v3;
}

- (NSNumber)px_focalLengthIn35mm
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 focalLengthIn35mm];

  return (NSNumber *)v3;
}

- (NSNumber)px_focalLength
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 focalLength];

  return (NSNumber *)v3;
}

- (NSNumber)px_flash
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 flashFired];

  return (NSNumber *)v3;
}

- (NSNumber)px_exposureBias
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 exposureBias];

  return (NSNumber *)v3;
}

- (NSNumber)px_aperture
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 fNumber];

  return (NSNumber *)v3;
}

- (NSString)px_codec
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 codec];

  return (NSString *)v3;
}

- (NSNumber)px_sampleRate
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 sampleRate];

  return (NSNumber *)v3;
}

- (NSNumber)px_bitRate
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 bitrate];

  return (NSNumber *)v3;
}

- (NSNumber)px_FPS
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 fps];

  return (NSNumber *)v3;
}

- (NSNumber)px_duration
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 durationTimeInterval];

  return (NSNumber *)v3;
}

- (unsigned)px_fetchCloudLocalState
{
  return 0;
}

- (BOOL)px_hasKeywords
{
  return 0;
}

- (BOOL)px_isHidden
{
  return 0;
}

- (BOOL)px_isInTrash
{
  return 0;
}

- (BOOL)ipx_isFavorite
{
  return 0;
}

- (BOOL)px_supportsImageProperties
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isImage];

  return v3;
}

- (NSString)px_burstUUID
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 burstUUID];

  return (NSString *)v3;
}

- (CLLocation)px_originalLocation
{
  return 0;
}

- (NSString)px_uniformTypeIdentifier
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 contentType];
  unsigned int v4 = [v3 identifier];

  return (NSString *)v4;
}

- (PXIntSize_st)px_resolution
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  [v2 exifPixelSize];
  double v4 = v3;
  double v6 = v5;

  unint64_t v7 = llround(v4);
  unint64_t v8 = llround(v6);
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (NSTimeZone)px_timeZone
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  double v3 = [v2 timeZone];

  return (NSTimeZone *)v3;
}

- (NSDate)px_creationDate
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  double v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (NSNumber)px_filesize
{
  double v2 = NSNumber;
  double v3 = [(PXImportItemViewModel *)self importAsset];
  double v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "fileSize"));

  return (NSNumber *)v4;
}

- (BOOL)px_isExtendedPropertiesProcessed
{
  return 1;
}

- (NSString)px_assetDescription
{
  return 0;
}

- (NSString)px_title
{
  return 0;
}

- (unint64_t)px_originalFileType
{
  unint64_t v3 = [(PXImportItemViewModel *)self px_originalType];
  return +[PXMetadataUtilities fileTypeForItem:self type:v3];
}

- (unint64_t)px_fileType
{
  unint64_t v3 = [(PXImportItemViewModel *)self px_type];
  return +[PXMetadataUtilities fileTypeForItem:self type:v3];
}

- (unint64_t)px_type
{
  unint64_t v3 = [(PXImportItemViewModel *)self importAsset];
  char v4 = [v3 isJPEG];

  if (v4) {
    return 0;
  }
  double v6 = [(PXImportItemViewModel *)self importAsset];
  char v7 = [v6 isHEIF];

  if (v7) {
    return 1;
  }
  unint64_t v8 = [(PXImportItemViewModel *)self importAsset];
  char v9 = [v8 isRAW];

  if (v9) {
    return 2;
  }
  int v10 = [(PXImportItemViewModel *)self importAsset];
  char v11 = [v10 isGIF];

  if (v11) {
    return 3;
  }
  long long v12 = [(PXImportItemViewModel *)self importAsset];
  char v13 = [v12 isPNG];

  if (v13) {
    return 4;
  }
  uint64_t v14 = [(PXImportItemViewModel *)self importAsset];
  char v15 = [v14 isTIFF];

  if (v15) {
    return 5;
  }
  uint64_t v16 = [(PXImportItemViewModel *)self importAsset];
  char v17 = [v16 isPDF];

  if (v17) {
    return 6;
  }
  v18 = [(PXImportItemViewModel *)self importAsset];
  char v19 = [v18 isPSD];

  if (v19) {
    return 7;
  }
  int v20 = [(PXImportItemViewModel *)self importAsset];
  char v21 = [v20 isJPEG2000];

  if (v21) {
    return 8;
  }
  __int16 v22 = [(PXImportItemViewModel *)self importAsset];
  char v23 = [v22 isAudio];

  if (v23) {
    return 9;
  }
  uint64_t v24 = [(PXImportItemViewModel *)self importAsset];
  int v25 = [v24 isMovie];

  if (v25) {
    return 10;
  }
  else {
    return 12;
  }
}

- (BOOL)px_isVideo
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isMovie];

  return v3;
}

- (BOOL)px_isAudio
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isAudio];

  return v3;
}

- (BOOL)px_isImage
{
  double v2 = [(PXImportItemViewModel *)self importAsset];
  char v3 = [v2 isImage];

  return v3;
}

@end