@interface PUActivityItemSourceConfiguration
+ (BOOL)_dontAllowRAWForActivityType:(id)a3;
+ (BOOL)_shouldExportAsUnmodifiedOriginalForActivityType:(id)a3;
+ (BOOL)isAssetBundleSupportedByActivityType:(id)a3;
+ (BOOL)isIndividualItemPreparationSupportedByActivityType:(id)a3;
+ (BOOL)isLivePhotoBundleSupportedByActivityType:(id)a3;
+ (BOOL)isMomentShareLinkSupportedByActivityType:(id)a3;
+ (BOOL)shouldExcludeAlternateVariantForActivityType:(id)a3;
+ (BOOL)shouldProvideAlternateVariantForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6;
+ (BOOL)shouldProvideCompatibleFormatForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6;
+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3;
+ (id)_activitiesThatDontAllowRAW;
+ (id)_activitiesThatDontRequireAssetExport;
+ (id)_activitiesThatDontSupportMomentShareLinks;
+ (id)_activitiesThatOnlySupportMomentShareLinks;
+ (id)_activitiesThatSupportAssetBundles;
+ (id)_activitiesThatSupportHEIFHEVC;
+ (id)_activitiesThatSupportLivePhotoBundles;
+ (id)_activitiesThatSupportSpatial;
+ (id)_photosActionSheetActivities;
+ (id)_photosInternalActivities;
+ (id)_systemActivitiesThatDontSupportMomentShareLinks;
+ (id)descriptionForAssetExportKind:(int64_t)a3;
+ (id)descriptionForOutputType:(int64_t)a3;
+ (unint64_t)maxFileSizeLimitForActivityType:(id)a3 asset:(id)a4;
- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences;
- (BOOL)_requiresAssetExportForAsset:(id)a3 forActivityType:(id)a4;
- (BOOL)_requiresAssetsLibraryURLForAsset:(id)a3 forActivityType:(id)a4;
- (BOOL)_shouldFlattenSlomoVideoForActivityType:(id)a3;
- (BOOL)_wantsAssetBundleForActivityType:(id)a3;
- (BOOL)_wantsLivePhotoBundleForActivityType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)requiresAssetExport;
- (NSDictionary)sharingVariants;
- (NSString)activityType;
- (PHAsset)asset;
- (PHAssetExportRequestOptions)assetExportRequestOptions;
- (PUActivityItemSourceConfiguration)initWithAsset:(id)a3 availableSharingVariants:(id)a4 activityType:(id)a5 preferences:(id)a6;
- (id)_customAccessibilityLabel;
- (id)_videoExportFileTypeForActivityType:(id)a3;
- (id)_videoExportPresetForActivityType:(id)a3;
- (int64_t)assetExportKind;
- (int64_t)outputType;
- (unint64_t)maxFileSizeLimit;
- (void)_configure;
- (void)setActivityType:(id)a3;
- (void)setAsset:(id)a3;
- (void)setSharingPreferences:(id)a3;
- (void)setSharingVariants:(id)a3;
@end

@implementation PUActivityItemSourceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingVariants, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetExportRequestOptions, 0);
}

- (void)setSharingVariants:(id)a3
{
}

- (NSDictionary)sharingVariants
{
  return self->_sharingVariants;
}

- (void)setSharingPreferences:(id)a3
{
  self->_sharingPreferences = ($3FD7B82E0D0D833B9D006DE3CA1215AC)a3;
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences
{
  int64_t preferredExportFormat = self->_sharingPreferences.preferredExportFormat;
  uint64_t v3 = *(void *)&self->_sharingPreferences.excludeLiveness;
  result.var6 = preferredExportFormat;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  return result;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PHAssetExportRequestOptions)assetExportRequestOptions
{
  return self->_assetExportRequestOptions;
}

- (int64_t)assetExportKind
{
  return self->_assetExportKind;
}

- (BOOL)requiresAssetExport
{
  return self->_requiresAssetExport;
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (unint64_t)maxFileSizeLimit
{
  return self->_maxFileSizeLimit;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(PUActivityItemSourceConfiguration *)self asset];
  v6 = [v4 asset];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [(PUActivityItemSourceConfiguration *)self activityType];
  v9 = [v4 activityType];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = [(PUActivityItemSourceConfiguration *)self sharingPreferences];
  uint64_t v13 = v12;
  uint64_t v15 = [v4 sharingPreferences] ^ v11;
  if ((v15 & 0x101010101) != 0) {
    goto LABEL_4;
  }
  char v16 = 0;
  if ((v15 & 0x10000000000) == 0 && v13 == v14)
  {
    unint64_t v18 = [(PUActivityItemSourceConfiguration *)self maxFileSizeLimit];
    if (v18 != [v4 maxFileSizeLimit]
      || (int64_t v19 = [(PUActivityItemSourceConfiguration *)self outputType],
          v19 != [v4 outputType])
      || (int v20 = [(PUActivityItemSourceConfiguration *)self requiresAssetExport],
          v20 != [v4 requiresAssetExport])
      || (int64_t v21 = [(PUActivityItemSourceConfiguration *)self assetExportKind],
          v21 != [v4 assetExportKind]))
    {
LABEL_4:
      char v16 = 0;
      goto LABEL_5;
    }
    v22 = [(PUActivityItemSourceConfiguration *)self assetExportRequestOptions];

    if (v22)
    {
      v23 = [(PUActivityItemSourceConfiguration *)self assetExportRequestOptions];
      v24 = [v4 assetExportRequestOptions];
      char v16 = [v23 isEqual:v24];
    }
    else
    {
      char v16 = 1;
    }
  }
LABEL_5:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUActivityItemSourceConfiguration *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(PUActivityItemSourceConfiguration *)self isEqualToConfiguration:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)_wantsAssetBundleForActivityType:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() isAssetBundleSupportedByActivityType:v4];

  if (v5) {
    return ((unint64_t)[(PUActivityItemSourceConfiguration *)self sharingPreferences] >> 32) & 1;
  }
  else {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_wantsLivePhotoBundleForActivityType:(id)a3
{
  id v4 = a3;
  char v5 = [(PUActivityItemSourceConfiguration *)self sharingPreferences];
  PHAssetPlaybackStyle v6 = [(PHAsset *)self->_asset playbackStyle];
  int v7 = [(PHAsset *)self->_asset isMediaSubtype:8];
  if (([(PUActivityItemSourceConfiguration *)self sharingPreferences] & 0x10000000000) != 0) {
    int v8 = 1;
  }
  else {
    int v8 = [(id)objc_opt_class() _shouldExportAsUnmodifiedOriginalForActivityType:v4];
  }
  BOOL v9 = v6 == 3;
  int v10 = v7 ^ 1;
  if (v6 == 3) {
    int v10 = 1;
  }
  if (!v10) {
    BOOL v9 = v8;
  }
  if (v9 && (v5 & 1) == 0) {
    char v12 = [(id)objc_opt_class() isLivePhotoBundleSupportedByActivityType:v4];
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (id)_customAccessibilityLabel
{
  v2 = [(PHAsset *)self->_asset descriptionProperties];
  uint64_t v3 = [v2 accessibilityDescription];

  return v3;
}

- (id)_videoExportFileTypeForActivityType:(id)a3
{
  id v4 = a3;
  if (-[PUActivityItemSourceConfiguration _shouldFlattenSlomoVideoForActivityType:](self, "_shouldFlattenSlomoVideoForActivityType:", v4)&& [v4 isEqualToString:*MEMORY[0x1E4F90950]])
  {
    id v5 = (id)*MEMORY[0x1E4F15AA8];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_videoExportPresetForActivityType:(id)a3
{
  id v4 = a3;
  if ([(PUActivityItemSourceConfiguration *)self _shouldFlattenSlomoVideoForActivityType:v4])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F90950]])
    {
      id v5 = (id *)MEMORY[0x1E4F15768];
LABEL_6:
      id v6 = *v5;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F9F380]])
    {
      id v5 = (id *)MEMORY[0x1E4F15748];
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_shouldFlattenSlomoVideoForActivityType:(id)a3
{
  asset = self->_asset;
  id v5 = a3;
  BOOL v6 = [(PUActivityItemSourceConfiguration *)self _requiresAssetsLibraryURLForAsset:asset forActivityType:v5];
  char v7 = [v5 isEqualToString:*MEMORY[0x1E4F9F360]];
  BOOL v8 = [(PUActivityItemSourceConfiguration *)self _wantsAssetBundleForActivityType:v5];

  BOOL v9 = 0;
  if ([(PHAsset *)self->_asset isHighFrameRateVideo]
    && (v7 & 1) == 0
    && !v6
    && !v8)
  {
    [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
    int v10 = [(PHAsset *)self->_asset adjustmentProperties];
    uint64_t v11 = (void *)MEMORY[0x1E4F8CE18];
    char v12 = [v10 formatIdentifier];
    uint64_t v13 = [v10 formatVersion];
    LOBYTE(v11) = [v11 isRecognizedSlowMotionFormatWithIdentifier:v12 version:v13];

    if (v11)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v14 = [(PUActivityItemSourceConfiguration *)self _customAccessibilityLabel];
      BOOL v9 = v14 != 0;
    }
  }
  return v9;
}

- (BOOL)_requiresAssetExportForAsset:(id)a3 forActivityType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(id)objc_opt_class() _activitiesThatDontRequireAssetExport];
  char v9 = [v8 containsObject:v6];

  LOBYTE(self) = [(PUActivityItemSourceConfiguration *)self _requiresAssetsLibraryURLForAsset:v7 forActivityType:v6];
  return self | v9 ^ 1;
}

- (BOOL)_requiresAssetsLibraryURLForAsset:(id)a3 forActivityType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v8 = [v7 sendAssetURLsToMessages];

  if (v8
    && [v5 isVideo]
    && ([v5 canPlayAutoloop] & 1) == 0
    && ([v5 isStreamedVideo] & 1) == 0
    && [v5 isHighFrameRateVideo]
    && ([MEMORY[0x1E4F38EB8] isOriginalKnownUnsupportedFormatForAsset:v5 failureInfo:0] & 1) == 0)
  {
    char v9 = [v6 isEqualToString:*MEMORY[0x1E4F9F380]];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_configure
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUActivityItemSourceConfiguration *)self asset];
  id v4 = [(PUActivityItemSourceConfiguration *)self activityType];
  self->_BOOL requiresAssetExport = [(PUActivityItemSourceConfiguration *)self _requiresAssetExportForAsset:v3 forActivityType:v4];
  BOOL v5 = [(PUActivityItemSourceConfiguration *)self _requiresAssetsLibraryURLForAsset:v3 forActivityType:v4];
  int v6 = [v4 isEqualToString:*MEMORY[0x1E4F9F360]];
  BOOL requiresAssetExport = self->_requiresAssetExport;
  int64_t v8 = 3;
  if (self->_requiresAssetExport) {
    int64_t v8 = 0;
  }
  if (v5) {
    int64_t v8 = 2;
  }
  if (v6) {
    int64_t v8 = 1;
  }
  self->_outputType = v8;
  if (requiresAssetExport)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F38F40]);
    int v10 = objc_opt_class();
    [(PUActivityItemSourceConfiguration *)self sharingPreferences];
    uint64_t v12 = v11;
    uint64_t v13 = [(PUActivityItemSourceConfiguration *)self sharingVariants];
    int v14 = [v10 shouldProvideAlternateVariantForActivityType:v4 forAsset:v3 inPreferredExportFormat:v12 withAvailableSharingVariants:v13];

    uint64_t v15 = objc_opt_class();
    [(PUActivityItemSourceConfiguration *)self sharingPreferences];
    uint64_t v17 = v16;
    unint64_t v18 = [(PUActivityItemSourceConfiguration *)self sharingVariants];
    int v19 = [v15 shouldProvideCompatibleFormatForActivityType:v4 forAsset:v3 inPreferredExportFormat:v17 withAvailableSharingVariants:v18];

    if (([(PUActivityItemSourceConfiguration *)self sharingPreferences] & 0x10000000000) != 0) {
      goto LABEL_15;
    }
    uint64_t v20 = 1;
    if (v19) {
      uint64_t v20 = 2;
    }
    uint64_t v21 = v14 ? 3 : v20;
    if ([(id)objc_opt_class() _shouldExportAsUnmodifiedOriginalForActivityType:v4])
    {
LABEL_15:
      uint64_t v22 = 1;
      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v22 = 0;
    }
    [v9 setVariant:v21];
    BOOL v23 = [(PUActivityItemSourceConfiguration *)self _wantsLivePhotoBundleForActivityType:v4];
    BOOL v47 = [(PUActivityItemSourceConfiguration *)self _wantsAssetBundleForActivityType:v4];
    objc_msgSend(v9, "setIncludeAllAssetResources:");
    objc_msgSend(v9, "setFlattenSlomoVideos:", -[PUActivityItemSourceConfiguration _shouldFlattenSlomoVideoForActivityType:](self, "_shouldFlattenSlomoVideoForActivityType:", v4));
    v24 = [(PUActivityItemSourceConfiguration *)self _videoExportPresetForActivityType:v4];
    [v9 setVideoExportPreset:v24];
    v45 = [(PUActivityItemSourceConfiguration *)self _videoExportFileTypeForActivityType:v4];
    objc_msgSend(v9, "setVideoExportFileType:");
    self->_maxFileSizeLimit = [(id)objc_opt_class() maxFileSizeLimitForActivityType:v4 asset:v3];
    if ((v22 & 1) == 0) {
      objc_msgSend(v9, "setDontAllowRAW:", objc_msgSend((id)objc_opt_class(), "_dontAllowRAWForActivityType:", v4));
    }
    BOOL v46 = v23;
    [v9 setTreatLivePhotoAsStill:!v23];
    objc_msgSend(v9, "setShouldStripLocation:", (v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 8));
    objc_msgSend(v9, "setShouldStripCaption:", ((unsigned __int16)v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 16));
    objc_msgSend(v9, "setShouldStripAccessibilityDescription:", ((unsigned __int16)v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 24));
    [v9 setShouldExportUnmodifiedOriginalResources:v22];
    v25 = (void *)MEMORY[0x1E4F8CDF8];
    v26 = [(PHAsset *)self->_asset uniformTypeIdentifier];
    v27 = [v25 typeWithIdentifier:v26];

    if ([v27 conformsToType:*MEMORY[0x1E4F44460]]) {
      uint64_t v28 = [v4 isEqualToString:*MEMORY[0x1E4F90950]];
    }
    else {
      uint64_t v28 = 0;
    }
    [v9 setAllowMetadataConversionsForPNG:v28];
    v29 = [MEMORY[0x1E4F906A0] sharedInstance];
    uint64_t v30 = [v29 locationBakingComparisonStrategy];
    if (v30 == 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2 * (v30 == 2);
    }
    [v9 setLocationComparisonStrategy:v31];
    if ([v29 disableMetadataCorrections])
    {
      v32 = PLShareSheetGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        [v3 uuid];
        v44 = v24;
        v34 = int v33 = v14;
        *(_DWORD *)buf = 138543362;
        v49 = v34;
        _os_log_impl(&dword_1AE9F8000, v32, OS_LOG_TYPE_DEFAULT, "Based on internal debug settings, disabling metadata corrections asset: %{public}@.", buf, 0xCu);

        int v14 = v33;
        v24 = v44;
      }

      objc_msgSend(v9, "setDisableMetadataCorrections:", objc_msgSend(v29, "disableMetadataCorrections"));
    }
    objc_msgSend(v9, "setForceDateTimeMetadataBaking:", objc_msgSend(v29, "forceDateTimeMetadataBaking"));
    objc_msgSend(v9, "setForceLocationMetadataBaking:", objc_msgSend(v29, "forceLocationMetadataBaking"));
    objc_msgSend(v9, "setForceCaptionMetadataBaking:", objc_msgSend(v29, "forceCaptionMetadataBaking"));
    objc_msgSend(v9, "setForceAccessibilityDescriptionMetadataBaking:", objc_msgSend(v29, "forceAccessibilityDescriptionMetadataBaking"));
    if ([v9 shouldExportUnmodifiedOriginalResources]) {
      int v35 = [v29 shouldUpdateFileCreationDatesForUnmodifiedOriginalExports];
    }
    else {
      int v35 = [v29 shouldUpdateFileCreationDatesForRegularExports];
    }
    [v9 setDisableUpdatingFileCreationDatesOnExportedFileURLs:v35 ^ 1u];
    unsigned int v36 = [(PHAsset *)self->_asset canPlayLoopingVideo];
    unsigned int v37 = v36 & ~[(PHAsset *)self->_asset isMediaSubtype:8];
    if (v22) {
      unsigned int v38 = v37;
    }
    else {
      unsigned int v38 = v36;
    }
    if ([(PHAsset *)self->_asset playbackStyle] == 4) {
      int v39 = 1;
    }
    else {
      int v39 = v38;
    }
    uint64_t v40 = 3;
    if (!v46) {
      uint64_t v40 = 1;
    }
    BOOL v41 = v39 == 0;
    int64_t v42 = 2;
    if (v41) {
      int64_t v42 = v40;
    }
    if (v47) {
      int64_t v42 = 4;
    }
    assetExportRequestOptions = self->_assetExportRequestOptions;
    if (v14) {
      int64_t v42 = 5;
    }
    self->_assetExportKind = v42;
    self->_assetExportRequestOptions = (PHAssetExportRequestOptions *)v9;
  }
}

- (PUActivityItemSourceConfiguration)initWithAsset:(id)a3 availableSharingVariants:(id)a4 activityType:(id)a5 preferences:(id)a6
{
  int64_t var6 = a6.var6;
  uint64_t v7 = *(void *)&a6.var0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PUActivityItemSourceConfiguration;
  uint64_t v15 = [(PUActivityItemSourceConfiguration *)&v22 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_asset, a3);
    uint64_t v17 = [v13 copy];
    sharingVariants = v16->_sharingVariants;
    v16->_sharingVariants = (NSDictionary *)v17;

    uint64_t v19 = [v14 copy];
    activityType = v16->_activityType;
    v16->_activityType = (NSString *)v19;

    *(void *)&v16->_sharingPreferences.excludeLiveness = v7;
    v16->_sharingPreferences.int64_t preferredExportFormat = var6;
    [(PUActivityItemSourceConfiguration *)v16 _configure];
  }

  return v16;
}

+ (id)descriptionForAssetExportKind:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"unknown";
  }
  else {
    return off_1E5F254A0[a3];
  }
}

+ (id)descriptionForOutputType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5F25480[a3];
  }
}

+ (BOOL)isIndividualItemPreparationSupportedByActivityType:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _activitiesThatOnlySupportMomentShareLinks];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

+ (BOOL)isMomentShareLinkSupportedByActivityType:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _activitiesThatDontSupportMomentShareLinks];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

+ (unint64_t)maxFileSizeLimitForActivityType:(id)a3 asset:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:*MEMORY[0x1E4F90950]]
    && [v5 playbackStyle] == 2)
  {
    unint64_t v6 = [MEMORY[0x1E4F8AAB0] maxGIFSizeForPublishing];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldExcludeAlternateVariantForActivityType:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (shouldExcludeAlternateVariantForActivityType__onceToken != -1) {
      dispatch_once(&shouldExcludeAlternateVariantForActivityType__onceToken, &__block_literal_global_62_26206);
    }
    if ([(id)shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities containsObject:v3])
    {
      char v4 = 1;
    }
    else
    {
      id v5 = [(id)objc_opt_class() _photosInternalActivities];
      char v4 = [v5 containsObject:v3];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

void __82__PUActivityItemSourceConfiguration_shouldExcludeAlternateVariantForActivityType___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F9F3D0];
  v3[0] = *MEMORY[0x1E4F9F348];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities;
  shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities = v1;
}

+ (BOOL)shouldProvideAlternateVariantForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  LOBYTE(v12) = 0;
  if (v9 && v10)
  {
    if (shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants__onceToken != -1) {
      dispatch_once(&shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants__onceToken, &__block_literal_global_58);
    }
    if ([v10 canPlayLoopingVideo])
    {
      int v13 = [(id)shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities containsObject:v9];
      if (a5) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v13;
      }
      if (v11 && v12)
      {
        id v14 = [v11 objectForKeyedSubscript:&unk_1F078BD20];
        LOBYTE(v12) = v14 != 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

void __144__PUActivityItemSourceConfiguration_shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F90A30];
  v3[0] = *MEMORY[0x1E4F9F370];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities;
  shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities = v1;
}

+ (BOOL)shouldProvideCompatibleFormatForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = v11;
  if (v11
    && ([v11 objectForKeyedSubscript:&unk_1F078BD08],
        int v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    if (a5)
    {
      BOOL v14 = a5 == 2;
    }
    else
    {
      uint64_t v16 = [(id)objc_opt_class() _activitiesThatSupportHEIFHEVC];
      if (([v16 containsObject:v9] & 1) != 0
        || ([(id)objc_opt_class() _photosInternalActivities],
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v17 containsObject:v9],
            v17,
            v18))
      {
        int v19 = 0;
        int v20 = 1;
      }
      else
      {
        int v20 = 0;
        int v19 = 1;
      }
      uint64_t v21 = [(id)objc_opt_class() _activitiesThatSupportSpatial];
      int v22 = [v21 containsObject:v9];
      int v23 = v20 | [v10 isSpatialMedia] ^ 1;
      if (v22) {
        int v24 = 0;
      }
      else {
        int v24 = v19;
      }
      if (v23) {
        int v25 = v19;
      }
      else {
        int v25 = v24;
      }

      BOOL v14 = v25 != 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)_activitiesThatSupportSpatial
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PUActivityItemSourceConfiguration__activitiesThatSupportSpatial__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatSupportSpatial_onceToken != -1) {
    dispatch_once(&_activitiesThatSupportSpatial_onceToken, block);
  }
  v2 = (void *)_activitiesThatSupportSpatial__activitiesSupportingSpatial;
  return v2;
}

void __66__PUActivityItemSourceConfiguration__activitiesThatSupportSpatial__block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) _activitiesThatSupportHEIFHEVC];
  uint64_t v2 = *MEMORY[0x1E4F9F360];
  v6[0] = *MEMORY[0x1E4F9F370];
  v6[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v1 arrayByAddingObjectsFromArray:v3];
  id v5 = (void *)_activitiesThatSupportSpatial__activitiesSupportingSpatial;
  _activitiesThatSupportSpatial__activitiesSupportingSpatial = v4;
}

+ (id)_activitiesThatSupportHEIFHEVC
{
  if (_activitiesThatSupportHEIFHEVC_onceToken != -1) {
    dispatch_once(&_activitiesThatSupportHEIFHEVC_onceToken, &__block_literal_global_52_26212);
  }
  uint64_t v2 = (void *)_activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC;
  return v2;
}

void __67__PUActivityItemSourceConfiguration__activitiesThatSupportHEIFHEVC__block_invoke()
{
  v6[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F9F348];
  v6[0] = *MEMORY[0x1E4F9F380];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F9F3D0];
  v6[2] = *MEMORY[0x1E4F9F3C0];
  void v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F9F3D8];
  v6[4] = *MEMORY[0x1E4F909F8];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E4F9F368];
  v6[7] = @"com.apple.journal.JournalShareExtension";
  uint64_t v3 = *MEMORY[0x1E4F90B20];
  v6[8] = *MEMORY[0x1E4F90B28];
  v6[9] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:10];
  id v5 = (void *)_activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC;
  _activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC = v4;
}

+ (id)_activitiesThatOnlySupportMomentShareLinks
{
  if (_activitiesThatOnlySupportMomentShareLinks_onceToken != -1) {
    dispatch_once(&_activitiesThatOnlySupportMomentShareLinks_onceToken, &__block_literal_global_50);
  }
  uint64_t v2 = (void *)_activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities;
  return v2;
}

void __79__PUActivityItemSourceConfiguration__activitiesThatOnlySupportMomentShareLinks__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F90988];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)_activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities;
  _activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities = v0;
}

+ (id)_activitiesThatDontSupportMomentShareLinks
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PUActivityItemSourceConfiguration__activitiesThatDontSupportMomentShareLinks__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatDontSupportMomentShareLinks_onceToken != -1) {
    dispatch_once(&_activitiesThatDontSupportMomentShareLinks_onceToken, block);
  }
  uint64_t v2 = (void *)_activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities;
  return v2;
}

void __79__PUActivityItemSourceConfiguration__activitiesThatDontSupportMomentShareLinks__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = [(id)objc_opt_class() _photosInternalActivities];
  id v11 = [v0 setWithArray:v1];

  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(id)objc_opt_class() _activitiesThatDontRequireAssetExport];
  uint64_t v4 = [v2 setWithArray:v3];

  id v5 = [(id)objc_opt_class() _photosActionSheetActivities];
  unint64_t v6 = [(id)objc_opt_class() _systemActivitiesThatDontSupportMomentShareLinks];
  uint64_t v7 = [v11 setByAddingObjectsFromSet:v4];
  int64_t v8 = (void *)[v7 mutableCopy];

  [v8 addObjectsFromArray:v5];
  [v8 addObjectsFromArray:v6];
  [v8 addObject:*MEMORY[0x1E4F9F348]];
  [v8 addObject:*MEMORY[0x1E4F9F360]];
  uint64_t v9 = [v8 allObjects];
  id v10 = (void *)_activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities;
  _activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities = v9;
}

+ (id)_systemActivitiesThatDontSupportMomentShareLinks
{
  if (_systemActivitiesThatDontSupportMomentShareLinks_onceToken != -1) {
    dispatch_once(&_systemActivitiesThatDontSupportMomentShareLinks_onceToken, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)_systemActivitiesThatDontSupportMomentShareLinks__internalActivities;
  return v2;
}

void __85__PUActivityItemSourceConfiguration__systemActivitiesThatDontSupportMomentShareLinks__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F9F388];
  v6[0] = *MEMORY[0x1E4F9F3C0];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F909F8];
  v6[2] = *MEMORY[0x1E4F9F3D0];
  void v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F90A60];
  v6[4] = *MEMORY[0x1E4F909A0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F90AB0];
  v6[6] = *MEMORY[0x1E4F9F350];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  id v5 = (void *)_systemActivitiesThatDontSupportMomentShareLinks__internalActivities;
  _systemActivitiesThatDontSupportMomentShareLinks__internalActivities = v4;
}

+ (id)_photosActionSheetActivities
{
  if (_photosActionSheetActivities_onceToken != -1) {
    dispatch_once(&_photosActionSheetActivities_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)_photosActionSheetActivities__internalActivities;
  return v2;
}

void __65__PUActivityItemSourceConfiguration__photosActionSheetActivities__block_invoke()
{
  v20[36] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F90A88];
  v20[0] = *MEMORY[0x1E4F90920];
  v20[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F90938];
  v20[2] = *MEMORY[0x1E4F90930];
  v20[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F90980];
  v20[4] = *MEMORY[0x1E4F90958];
  v20[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F909B8];
  v20[6] = *MEMORY[0x1E4F90990];
  v20[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F909C0];
  v20[8] = *MEMORY[0x1E4F909C8];
  v20[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F909A8];
  v20[10] = *MEMORY[0x1E4F90A00];
  v20[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F90A08];
  v20[12] = *MEMORY[0x1E4F909B0];
  v20[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F90B18];
  v20[14] = *MEMORY[0x1E4F90AD8];
  v20[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F90A18];
  v20[16] = *MEMORY[0x1E4F90978];
  v20[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F90A80];
  v20[18] = *MEMORY[0x1E4F90960];
  v20[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F90B00];
  v20[20] = *MEMORY[0x1E4F90AF0];
  v20[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F90B68];
  v20[22] = *MEMORY[0x1E4F90B30];
  v20[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F90B80];
  v20[24] = *MEMORY[0x1E4F90B78];
  v20[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F90AC0];
  v20[26] = *MEMORY[0x1E4F90AA8];
  v20[27] = v13;
  uint64_t v14 = *MEMORY[0x1E4F90B70];
  v20[28] = *MEMORY[0x1E4F90AC8];
  v20[29] = v14;
  uint64_t v15 = *MEMORY[0x1E4F90B38];
  v20[30] = *MEMORY[0x1E4F90B48];
  v20[31] = v15;
  uint64_t v16 = *MEMORY[0x1E4F90B60];
  v20[32] = *MEMORY[0x1E4F90B50];
  v20[33] = v16;
  uint64_t v17 = *MEMORY[0x1E4F90AE8];
  v20[34] = *MEMORY[0x1E4F90AE0];
  v20[35] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:36];
  int v19 = (void *)_photosActionSheetActivities__internalActivities;
  _photosActionSheetActivities__internalActivities = v18;
}

+ (id)_photosInternalActivities
{
  if (_photosInternalActivities_onceToken != -1) {
    dispatch_once(&_photosInternalActivities_onceToken, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)_photosInternalActivities__internalActivities;
  return v2;
}

void __62__PUActivityItemSourceConfiguration__photosInternalActivities__block_invoke()
{
  v12[21] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F90A10];
  v12[0] = *MEMORY[0x1E4F9F3C8];
  v12[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F90AD0];
  v12[2] = *MEMORY[0x1E4F90AB8];
  v12[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F90A20];
  v12[4] = *MEMORY[0x1E4F90A78];
  v12[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F90AF8];
  v12[6] = *MEMORY[0x1E4F909D0];
  v12[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F90940];
  v12[8] = *MEMORY[0x1E4F90928];
  v12[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F90950];
  v12[10] = *MEMORY[0x1E4F90A60];
  v12[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F90B20];
  v12[12] = *MEMORY[0x1E4F90B10];
  v12[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F90AC0];
  v12[14] = *MEMORY[0x1E4F90AA8];
  v12[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F90A70];
  v12[16] = *MEMORY[0x1E4F90AC8];
  v12[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F909D8];
  v12[18] = *MEMORY[0x1E4F90A68];
  v12[19] = v9;
  v12[20] = *MEMORY[0x1E4F909E0];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:21];
  uint64_t v11 = (void *)_photosInternalActivities__internalActivities;
  _photosInternalActivities__internalActivities = v10;
}

+ (id)_activitiesThatDontRequireAssetExport
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PUActivityItemSourceConfiguration__activitiesThatDontRequireAssetExport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatDontRequireAssetExport_onceToken != -1) {
    dispatch_once(&_activitiesThatDontRequireAssetExport_onceToken, block);
  }
  uint64_t v2 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  return v2;
}

void __74__PUActivityItemSourceConfiguration__activitiesThatDontRequireAssetExport__block_invoke(uint64_t a1)
{
  v17[19] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F90A10];
  v17[0] = *MEMORY[0x1E4F90948];
  v17[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F90AF8];
  v17[2] = *MEMORY[0x1E4F909D0];
  v17[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F90AB8];
  v17[4] = *MEMORY[0x1E4F9F3F0];
  v17[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F90A78];
  v17[6] = *MEMORY[0x1E4F90AD0];
  v17[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F90940];
  v17[8] = *MEMORY[0x1E4F90928];
  v17[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F90B10];
  v17[10] = *MEMORY[0x1E4F90A50];
  v17[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F90AC0];
  v17[12] = *MEMORY[0x1E4F90AA8];
  v17[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F90A70];
  v17[14] = *MEMORY[0x1E4F90AC8];
  v17[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4F909D8];
  v17[16] = *MEMORY[0x1E4F90A68];
  v17[17] = v10;
  v17[18] = *MEMORY[0x1E4F909E0];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:19];
  uint64_t v12 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  _activitiesThatDontRequireAssetExport__activitiesNotRequiringExport = v11;

  uint64_t v13 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  uint64_t v14 = [*(id *)(a1 + 32) _photosActionSheetActivities];
  uint64_t v15 = [v13 arrayByAddingObjectsFromArray:v14];
  uint64_t v16 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  _activitiesThatDontRequireAssetExport__activitiesNotRequiringExport = v15;
}

+ (id)_activitiesThatSupportAssetBundles
{
  if (_activitiesThatSupportAssetBundles_onceToken != -1) {
    dispatch_once(&_activitiesThatSupportAssetBundles_onceToken, &__block_literal_global_42);
  }
  uint64_t v2 = (void *)_activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles;
  return v2;
}

void __71__PUActivityItemSourceConfiguration__activitiesThatSupportAssetBundles__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F90A48];
  v3[0] = *MEMORY[0x1E4F9F348];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)_activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles;
  _activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles = v1;
}

+ (id)_activitiesThatSupportLivePhotoBundles
{
  if (_activitiesThatSupportLivePhotoBundles_onceToken != -1) {
    dispatch_once(&_activitiesThatSupportLivePhotoBundles_onceToken, &__block_literal_global_40);
  }
  uint64_t v2 = (void *)_activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles;
  return v2;
}

void __75__PUActivityItemSourceConfiguration__activitiesThatSupportLivePhotoBundles__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F9F380];
  v5[0] = *MEMORY[0x1E4F9F348];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F90B08];
  v5[2] = *MEMORY[0x1E4F9F3C8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F90B20];
  v5[4] = *MEMORY[0x1E4F90950];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F90A60];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  uint64_t v4 = (void *)_activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles;
  _activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles = v3;
}

+ (BOOL)_shouldExportAsUnmodifiedOriginalForActivityType:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F909F8]];
}

+ (id)_activitiesThatDontAllowRAW
{
  if (_activitiesThatDontAllowRAW_onceToken != -1) {
    dispatch_once(&_activitiesThatDontAllowRAW_onceToken, &__block_literal_global_26218);
  }
  uint64_t v2 = (void *)_activitiesThatDontAllowRAW__activitiesThatDontAllowRAW;
  return v2;
}

void __64__PUActivityItemSourceConfiguration__activitiesThatDontAllowRAW__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F90950], *MEMORY[0x1E4F9F370], 0);
  uint64_t v2 = (void *)_activitiesThatDontAllowRAW__activitiesThatDontAllowRAW;
  _activitiesThatDontAllowRAW__activitiesThatDontAllowRAW = v1;
}

+ (BOOL)_dontAllowRAWForActivityType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _activitiesThatDontAllowRAW];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F90AB0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F909A0]];
  }

  return v4;
}

+ (BOOL)isAssetBundleSupportedByActivityType:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [(id)objc_opt_class() _activitiesThatSupportAssetBundles];
  char v5 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v6 = [v5 savePhotosBundlesToFilesWithoutExtractingMedia];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F909F8];
    v12[0] = *MEMORY[0x1E4F9F3D0];
    v12[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v9 = [v4 arrayByAddingObjectsFromArray:v8];

    char v4 = (void *)v9;
  }
  char v10 = [v4 containsObject:v3];

  return v10;
}

+ (BOOL)isLivePhotoBundleSupportedByActivityType:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [(id)objc_opt_class() _activitiesThatSupportLivePhotoBundles];
  char v5 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v6 = [v5 savePhotosBundlesToFilesWithoutExtractingMedia];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F909F8];
    v12[0] = *MEMORY[0x1E4F9F3D0];
    v12[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v9 = [v4 arrayByAddingObjectsFromArray:v8];

    char v4 = (void *)v9;
  }
  char v10 = [v4 containsObject:v3];

  return v10;
}

@end