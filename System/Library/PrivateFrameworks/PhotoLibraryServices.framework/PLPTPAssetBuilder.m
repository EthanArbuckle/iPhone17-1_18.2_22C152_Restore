@interface PLPTPAssetBuilder
+ (BOOL)_shouldIncludeDiagnosticFile;
+ (id)pictureTransferProtocolAssetsForAsset:(id)a3 withConversionSupport:(id)a4;
- (BOOL)_buildDirectoryPathAndFilename;
- (BOOL)_buildOriginalAsset;
- (BOOL)_hasIrisSidecarFile;
- (BOOL)_suppressPtpInfo;
- (BOOL)hasSpatialOverCaptureContent;
- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4;
- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4 fileManager:(id)a5;
- (id)_assetForSidecar:(id)a3 sidecarPath:(id)a4 irisSidecarPath:(id)a5;
- (id)pictureTransferProtocolAssets;
- (id)spatialOverCaptureInformation;
- (void)_buildAdjustmentAsset;
- (void)_buildBurst;
- (void)_buildCommonAsset;
- (void)_buildDeletedFlag;
- (void)_buildDiagnosticAsset;
- (void)_buildExifAvailable;
- (void)_buildFileSize;
- (void)_buildFingerprint;
- (void)_buildFullSizeRenderImageAsset;
- (void)_buildFullSizeRenderVideoAsset;
- (void)_buildGPSInformation;
- (void)_buildGroupUUID;
- (void)_buildImageDimensions;
- (void)_buildIsHDR;
- (void)_buildModificationAndCreationDate;
- (void)_buildOrientation;
- (void)_buildOriginatingAssetID;
- (void)_buildPhotoKey;
- (void)_buildRelatedUUID;
- (void)_buildSecondaryAdjustmentDataAsset;
- (void)_buildSidecarAssets;
- (void)_buildSlowMo;
- (void)_buildSpatialOverCaptureGroupIdentifier;
- (void)_buildSpatialOverCaptureLivePhotoPairingIdentifier;
- (void)_buildThumbnailDimensions;
- (void)_buildThumbnailOffsetAndLength;
- (void)_buildTimelapse;
- (void)_buildVideoCodec;
- (void)_durationOfTheAsset;
- (void)_updateAsset:(id)a3 withConversionResult:(id)a4;
- (void)_updateAssetForTranscodeChoice:(id)a3 withConversionResult:(id)a4;
- (void)_updateOriginalAssetFormatConversionFromVideoComplement;
- (void)buildOriginalAdjustmentPtpAsset;
- (void)buildPenultimateImagePtpAsset;
- (void)buildPenultimateVideoPtpAsset;
- (void)buildSpatialOverCaptureContentPtpAsset;
- (void)buildSpatialOverCaptureVideoComplementPtpAsset;
- (void)updateAssetForFormatConversion:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6;
- (void)updateSiblingAssetTypesOnMutablePTPAssets:(id)a3;
@end

@implementation PLPTPAssetBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedAssets, 0);
  objc_storeStrong((id *)&self->_penultimateVideoPtpAsset, 0);
  objc_storeStrong((id *)&self->_penultimateImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_cachedSpatialOverCaptureInformation, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentPtpAsset, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureVideoComplementPtpAsset, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_fullSizeRenderVideoPtpAsset, 0);
  objc_storeStrong((id *)&self->_fullSizeRenderImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_secondaryAdjustmentDataPtpAsset, 0);
  objc_storeStrong((id *)&self->_adjustmentPtpAsset, 0);
  objc_storeStrong((id *)&self->_diagnosticPtpAsset, 0);
  objc_storeStrong((id *)&self->_sidecarPtpAssets, 0);
  objc_storeStrong((id *)&self->_originalPtpAsset, 0);
  objc_storeStrong((id *)&self->_commonPtpAsset, 0);
  objc_storeStrong((id *)&self->_currentPtpAsset, 0);
  objc_storeStrong((id *)&self->_filenameForPTP, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_conversionSupport, 0);
}

- (void)buildPenultimateVideoPtpAsset
{
  id v29 = [(PLPTPTransferableAsset *)self->_asset pathForPenultimateFullsizeRenderVideoFile];
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
  {
    v3 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    v4 = [v29 lastPathComponent];
    v5 = [v29 stringByDeletingLastPathComponent];
    v6 = [PLPTPAssetHandle alloc];
    v7 = [(PLPTPTransferableAsset *)self->_asset objectID];
    v8 = [(PLPTPAssetHandle *)v6 initWithType:11 assetID:v7 sidecarID:0 requiresConversion:0];
    [(PLMutablePTPAsset *)v3 setAssetHandle:v8];

    v9 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(PLPTPTransferableAsset *)self->_asset filename];
    }
    v12 = v11;

    v13 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
    uint64_t v14 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
    v15 = [(PLPTPAsset *)v3 assetHandle];
    v16 = [v15 auxiliaryResourceFilenameMarker];
    v17 = +[PLDCFUtilities dcfCompliantNameForFileName:v12 createDate:v13 fileSize:v14 filenameMarker:v16];

    v18 = [v29 pathExtension];
    v19 = [v18 uppercaseString];
    v20 = objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);

    [(PLMutablePTPAsset *)v3 setFilename:v20];
    [(PLMutablePTPAsset *)v3 setOriginalFilename:v4];
    [(PLMutablePTPAsset *)v3 setFullDirectoryPath:v5];
    v21 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v29 error:0];
    v22 = [v21 objectForKey:*MEMORY[0x1E4F28390]];
    [(PLMutablePTPAsset *)v3 setObjectCompressedSize:v22];
    -[PLMutablePTPAsset setImagePixSize:](v3, "setImagePixSize:", (double)[(PLPTPTransferableAsset *)self->_asset width], (double)[(PLPTPTransferableAsset *)self->_asset height]);
    [(PLMutablePTPAsset *)v3 setThumbOffset:&unk_1EEBEFF30];
    v23 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)v3 setThumbCompressedSize:v23];

    v24 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [(PLMutablePTPAsset *)v3 setRelatedUUID:v24];

    v25 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
    [(PLMutablePTPAsset *)v3 setLocationString:v25];

    v26 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    -[PLMutablePTPAsset setDeleted:](v3, "setDeleted:", ((unint64_t)[v26 ptpTrashedState] >> 8) & 1);

    if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
    {
      v27 = [(PLPTPAsset *)self->_penultimateImagePtpAsset groupUUID];
      [(PLMutablePTPAsset *)v3 setGroupUUID:v27];
    }
    penultimateVideoPtpAsset = self->_penultimateVideoPtpAsset;
    self->_penultimateVideoPtpAsset = v3;
  }
}

- (void)buildPenultimateImagePtpAsset
{
  id v30 = [(PLPTPTransferableAsset *)self->_asset pathForPenultimateFullsizeRenderImageFile];
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
  {
    v3 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    v4 = [v30 lastPathComponent];
    v5 = [v30 stringByDeletingLastPathComponent];
    v6 = [PLPTPAssetHandle alloc];
    v7 = [(PLPTPTransferableAsset *)self->_asset objectID];
    v8 = [(PLPTPAssetHandle *)v6 initWithType:10 assetID:v7 sidecarID:0 requiresConversion:0];
    [(PLMutablePTPAsset *)v3 setAssetHandle:v8];

    v9 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(PLPTPTransferableAsset *)self->_asset filename];
    }
    v12 = v11;

    v13 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
    uint64_t v14 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
    v15 = [(PLPTPAsset *)v3 assetHandle];
    v16 = [v15 auxiliaryResourceFilenameMarker];
    v17 = +[PLDCFUtilities dcfCompliantNameForFileName:v12 createDate:v13 fileSize:v14 filenameMarker:v16];

    v18 = [v30 pathExtension];
    v19 = [v18 uppercaseString];
    v20 = objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);

    [(PLMutablePTPAsset *)v3 setFilename:v20];
    [(PLMutablePTPAsset *)v3 setOriginalFilename:v4];
    [(PLMutablePTPAsset *)v3 setFullDirectoryPath:v5];
    v21 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v30 error:0];
    v22 = [v21 objectForKey:*MEMORY[0x1E4F28390]];
    [(PLMutablePTPAsset *)v3 setObjectCompressedSize:v22];
    -[PLMutablePTPAsset setImagePixSize:](v3, "setImagePixSize:", (double)[(PLPTPTransferableAsset *)self->_asset width], (double)[(PLPTPTransferableAsset *)self->_asset height]);
    [(PLMutablePTPAsset *)v3 setThumbOffset:&unk_1EEBEFF30];
    v23 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)v3 setThumbCompressedSize:v23];

    v24 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [(PLMutablePTPAsset *)v3 setRelatedUUID:v24];

    v25 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
    [(PLMutablePTPAsset *)v3 setLocationString:v25];

    v26 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    -[PLMutablePTPAsset setDeleted:](v3, "setDeleted:", ((unint64_t)[v26 ptpTrashedState] >> 7) & 1);

    if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
    {
      v27 = [MEMORY[0x1E4F29128] UUID];
      v28 = [v27 UUIDString];
      [(PLMutablePTPAsset *)v3 setGroupUUID:v28];
    }
    penultimateImagePtpAsset = self->_penultimateImagePtpAsset;
    self->_penultimateImagePtpAsset = v3;
  }
}

- (void)buildOriginalAdjustmentPtpAsset
{
  v3 = [(PLPTPTransferableAsset *)self->_asset pathForOriginalAdjustmentFile];
  if (v3)
  {
    v28 = v3;
    int v4 = [(PLFileManager *)self->_fileManager fileExistsAtPath:v3 isDirectory:0];
    v3 = v28;
    if (v4)
    {
      v5 = [v28 lastPathComponent];
      v6 = [v28 stringByDeletingLastPathComponent];
      v7 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
      v8 = [PLPTPAssetHandle alloc];
      v9 = [(PLPTPTransferableAsset *)self->_asset objectID];
      v10 = [(PLPTPAssetHandle *)v8 initWithType:9 assetID:v9 sidecarID:0 requiresConversion:0];
      [(PLMutablePTPAsset *)v7 setAssetHandle:v10];

      id v11 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [(PLPTPTransferableAsset *)self->_asset filename];
      }
      uint64_t v14 = v13;

      v15 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
      uint64_t v16 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
      v17 = [(PLPTPAsset *)v7 assetHandle];
      v18 = [v17 auxiliaryResourceFilenameMarker];
      v19 = +[PLDCFUtilities dcfCompliantNameForFileName:v14 createDate:v15 fileSize:v16 filenameMarker:v18];

      v20 = [v28 pathExtension];
      v21 = [v20 uppercaseString];
      v22 = objc_msgSend(v19, "_pl_stringByReplacingPathExtension:", v21);

      [(PLMutablePTPAsset *)v7 setFilename:v22];
      [(PLMutablePTPAsset *)v7 setOriginalFilename:v5];
      [(PLMutablePTPAsset *)v7 setFullDirectoryPath:v6];
      v23 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v28 error:0];
      v24 = [v23 objectForKey:*MEMORY[0x1E4F28390]];
      [(PLMutablePTPAsset *)v7 setObjectCompressedSize:v24];
      v25 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
      [(PLMutablePTPAsset *)v7 setRelatedUUID:v25];

      v26 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
      -[PLMutablePTPAsset setDeleted:](v7, "setDeleted:", ((unint64_t)[v26 ptpTrashedState] >> 6) & 1);

      originalAdjustmentPtpAsset = self->_originalAdjustmentPtpAsset;
      self->_originalAdjustmentPtpAsset = v7;

      v3 = v28;
    }
  }
}

- (void)buildSpatialOverCaptureVideoComplementPtpAsset
{
  id v32 = [(PLPTPTransferableAsset *)self->_asset pathForVideoComplementSpatialOverCaptureContentFile];
  if ([(PLPTPTransferableAsset *)self->_asset isPhotoIris]
    && [(PLFileManager *)self->_fileManager fileExistsAtPath:v32 isDirectory:0]&& ![(PLPTPTransferableAsset *)self->_asset cameraProcessingAdjustmentTrashedState])
  {
    int v4 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    if (self->_currentPtpAsset)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:1008 description:@"Unexpected non-nil current PTP asset"];
    }
    objc_storeStrong((id *)&self->_currentPtpAsset, v4);
    [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureGroupIdentifier];
    [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureLivePhotoPairingIdentifier];
    currentPtpAsset = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;

    v6 = [v32 lastPathComponent];
    v7 = [v32 stringByDeletingLastPathComponent];
    v8 = [PLPTPAssetHandle alloc];
    v9 = [(PLPTPTransferableAsset *)self->_asset objectID];
    v10 = [(PLPTPAssetHandle *)v8 initWithType:8 assetID:v9 sidecarID:0 requiresConversion:0];
    [(PLMutablePTPAsset *)v4 setAssetHandle:v10];

    id v11 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(PLPTPTransferableAsset *)self->_asset filename];
    }
    uint64_t v14 = v13;

    v15 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
    uint64_t v16 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
    v17 = [(PLPTPAsset *)v4 assetHandle];
    v18 = [v17 auxiliaryResourceFilenameMarker];
    v19 = +[PLDCFUtilities dcfCompliantNameForFileName:v14 createDate:v15 fileSize:v16 filenameMarker:v18];

    v20 = [v32 pathExtension];
    v21 = [v20 uppercaseString];
    v22 = objc_msgSend(v19, "_pl_stringByReplacingPathExtension:", v21);

    [(PLMutablePTPAsset *)v4 setFilename:v22];
    [(PLMutablePTPAsset *)v4 setOriginalFilename:v6];
    [(PLMutablePTPAsset *)v4 setFullDirectoryPath:v7];
    v23 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v32 error:0];
    v24 = [v23 objectForKey:*MEMORY[0x1E4F28390]];
    [(PLMutablePTPAsset *)v4 setObjectCompressedSize:v24];
    [(PLPTPTransferableAsset *)self->_asset videoComplementSpatialOverCaptureSize];
    -[PLMutablePTPAsset setImagePixSize:](v4, "setImagePixSize:");
    [(PLMutablePTPAsset *)v4 setThumbOffset:&unk_1EEBEFF30];
    v25 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)v4 setThumbCompressedSize:v25];

    v26 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [(PLMutablePTPAsset *)v4 setRelatedUUID:v26];

    v27 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
    [(PLMutablePTPAsset *)v4 setLocationString:v27];

    v28 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    -[PLMutablePTPAsset setDeleted:](v4, "setDeleted:", ((unint64_t)[v28 ptpTrashedState] >> 5) & 1);

    id v29 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:1 isRender:0];
    [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:v4 sourceHints:v29 forceLegacyConversion:0 assetTypeLabel:@"spatial over capture video complement"];
    spatialOverCaptureVideoComplementPtpAsset = self->_spatialOverCaptureVideoComplementPtpAsset;
    self->_spatialOverCaptureVideoComplementPtpAsset = v4;
  }
}

- (void)buildSpatialOverCaptureContentPtpAsset
{
  if ([(PLPTPAssetBuilder *)self hasSpatialOverCaptureContent])
  {
    id v33 = [(PLPTPTransferableAsset *)self->_asset pathForSpatialOverCaptureContentFile];
    int v4 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    if (self->_currentPtpAsset)
    {
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:961 description:@"Unexpected non-nil current PTP asset"];
    }
    objc_storeStrong((id *)&self->_currentPtpAsset, v4);
    [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureGroupIdentifier];
    [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureLivePhotoPairingIdentifier];
    currentPtpAsset = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;

    v6 = [v33 lastPathComponent];
    v7 = [v33 stringByDeletingLastPathComponent];
    if ([(PLPTPTransferableAsset *)self->_asset isVideo]) {
      uint64_t v8 = 7;
    }
    else {
      uint64_t v8 = 6;
    }
    v9 = [PLPTPAssetHandle alloc];
    v10 = [(PLPTPTransferableAsset *)self->_asset objectID];
    id v11 = [(PLPTPAssetHandle *)v9 initWithType:v8 assetID:v10 sidecarID:0 requiresConversion:0];
    [(PLMutablePTPAsset *)v4 setAssetHandle:v11];

    v12 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(PLPTPTransferableAsset *)self->_asset filename];
    }
    v15 = v14;

    uint64_t v16 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
    uint64_t v17 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
    v18 = [(PLPTPAsset *)v4 assetHandle];
    v19 = [v18 auxiliaryResourceFilenameMarker];
    v20 = +[PLDCFUtilities dcfCompliantNameForFileName:v15 createDate:v16 fileSize:v17 filenameMarker:v19];

    v21 = [v33 pathExtension];
    v22 = [v21 uppercaseString];
    v23 = objc_msgSend(v20, "_pl_stringByReplacingPathExtension:", v22);

    [(PLMutablePTPAsset *)v4 setFilename:v23];
    [(PLMutablePTPAsset *)v4 setOriginalFilename:v6];
    [(PLMutablePTPAsset *)v4 setFullDirectoryPath:v7];
    v24 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v33 error:0];
    v25 = [v24 objectForKey:*MEMORY[0x1E4F28390]];
    [(PLMutablePTPAsset *)v4 setObjectCompressedSize:v25];
    [(PLPTPTransferableAsset *)self->_asset spatialOverCaptureSize];
    -[PLMutablePTPAsset setImagePixSize:](v4, "setImagePixSize:");
    [(PLMutablePTPAsset *)v4 setThumbOffset:&unk_1EEBEFF30];
    v26 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)v4 setThumbCompressedSize:v26];

    v27 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [(PLMutablePTPAsset *)v4 setRelatedUUID:v27];

    v28 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
    [(PLMutablePTPAsset *)v4 setLocationString:v28];

    id v29 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    -[PLMutablePTPAsset setDeleted:](v4, "setDeleted:", ((unint64_t)[v29 ptpTrashedState] >> 4) & 1);

    id v30 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:[(PLPTPTransferableAsset *)self->_asset isVideo] isRender:0];
    [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:v4 sourceHints:v30 forceLegacyConversion:0 assetTypeLabel:@"spatial over capture"];
    spatialOverCaptureImagePtpAsset = self->_spatialOverCaptureImagePtpAsset;
    self->_spatialOverCaptureImagePtpAsset = v4;
  }
}

- (BOOL)hasSpatialOverCaptureContent
{
  v3 = [(PLPTPTransferableAsset *)self->_asset pathForSpatialOverCaptureContentFile];
  BOOL v4 = [(PLFileManager *)self->_fileManager fileExistsAtPath:v3 isDirectory:0]&& ![(PLPTPTransferableAsset *)self->_asset cameraProcessingAdjustmentTrashedState];

  return v4;
}

- (void)_buildFullSizeRenderVideoAsset
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(PLPTPTransferableAsset *)self->_asset pathForFullsizeRenderVideoFile];
  if ([(PLFileManager *)self->_fileManager fileExistsAtPath:v3 isDirectory:0])
  {
    if (self->_fullSizeRenderImagePtpAsset
      || ![(PLPTPTransferableAsset *)self->_asset isPhotoIris])
    {
      id v33 = [v3 lastPathComponent];
      v7 = [v3 stringByDeletingLastPathComponent];
      uint64_t v8 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
      v9 = [PLPTPAssetHandle alloc];
      v10 = [(PLPTPTransferableAsset *)self->_asset objectID];
      id v11 = [(PLPTPAssetHandle *)v9 initWithType:5 assetID:v10 sidecarID:0 requiresConversion:0];
      [(PLMutablePTPAsset *)v8 setAssetHandle:v11];

      v12 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [(PLPTPTransferableAsset *)self->_asset filename];
      }
      v15 = v14;

      uint64_t v16 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
      uint64_t v17 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
      v18 = [(PLPTPAsset *)v8 assetHandle];
      v19 = [v18 auxiliaryResourceFilenameMarker];
      v20 = +[PLDCFUtilities dcfCompliantNameForFileName:v15 createDate:v16 fileSize:v17 filenameMarker:v19];

      v21 = [v3 pathExtension];
      v22 = [v21 uppercaseString];
      v23 = objc_msgSend(v20, "_pl_stringByReplacingPathExtension:", v22);

      [(PLMutablePTPAsset *)v8 setFilename:v23];
      [(PLMutablePTPAsset *)v8 setOriginalFilename:v33];
      [(PLMutablePTPAsset *)v8 setFullDirectoryPath:v7];
      v24 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v3 error:0];
      v25 = [v24 objectForKey:*MEMORY[0x1E4F28390]];
      [(PLMutablePTPAsset *)v8 setObjectCompressedSize:v25];
      -[PLMutablePTPAsset setImagePixSize:](v8, "setImagePixSize:", (double)[(PLPTPTransferableAsset *)self->_asset width], (double)[(PLPTPTransferableAsset *)self->_asset height]);
      [(PLMutablePTPAsset *)v8 setThumbOffset:&unk_1EEBEFF30];
      v26 = [NSNumber numberWithInt:0x10000];
      [(PLMutablePTPAsset *)v8 setThumbCompressedSize:v26];

      v27 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
      [(PLMutablePTPAsset *)v8 setRelatedUUID:v27];

      v28 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:1 isRender:1];
      [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:v8 sourceHints:v28 forceLegacyConversion:0 assetTypeLabel:@"full size render video"];
      id v29 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
      [(PLMutablePTPAsset *)v8 setLocationString:v29];

      if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
      {
        id v30 = [(PLPTPTransferableAsset *)self->_asset mediaGroupUUID];
        [(PLMutablePTPAsset *)v8 setGroupUUID:v30];
      }
      v31 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
      -[PLMutablePTPAsset setDeleted:](v8, "setDeleted:", ((unint64_t)[v31 ptpTrashedState] >> 3) & 1);

      fullSizeRenderVideoPtpAsset = self->_fullSizeRenderVideoPtpAsset;
      self->_fullSizeRenderVideoPtpAsset = v8;
    }
    else
    {
      BOOL v4 = PLPTPGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = [(PLPTPTransferableAsset *)self->_asset objectID];
        v6 = [(PLPTPTransferableAsset *)self->_asset uuid];
        *(_DWORD *)buf = 138412546;
        v35 = v5;
        __int16 v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Skipping full size render video due to missing full size render image: %@ (UUID: %@)", buf, 0x16u);
      }
    }
  }
}

- (void)_buildFullSizeRenderImageAsset
{
  id v30 = [(PLPTPTransferableAsset *)self->_asset pathForFullsizeRenderImageFile];
  if (([(PLPTPTransferableAsset *)self->_asset isVideo] & 1) == 0
    && [(PLFileManager *)self->_fileManager fileExistsAtPath:v30 isDirectory:0]&& ([(PLPTPTransferableAsset *)self->_asset isAvalanchePhoto] & 1) == 0)
  {
    v3 = [v30 lastPathComponent];
    BOOL v4 = [v30 stringByDeletingLastPathComponent];
    v5 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    v6 = [PLPTPAssetHandle alloc];
    v7 = [(PLPTPTransferableAsset *)self->_asset objectID];
    uint64_t v8 = [(PLPTPAssetHandle *)v6 initWithType:4 assetID:v7 sidecarID:0 requiresConversion:0];
    [(PLMutablePTPAsset *)v5 setAssetHandle:v8];

    v9 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(PLPTPTransferableAsset *)self->_asset filename];
    }
    v12 = v11;

    id v13 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
    uint64_t v14 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
    v15 = [(PLPTPAsset *)v5 assetHandle];
    uint64_t v16 = [v15 auxiliaryResourceFilenameMarker];
    uint64_t v17 = +[PLDCFUtilities dcfCompliantNameForFileName:v12 createDate:v13 fileSize:v14 filenameMarker:v16];

    v18 = [v30 pathExtension];
    v19 = [v18 uppercaseString];
    v20 = objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);

    [(PLMutablePTPAsset *)v5 setFilename:v20];
    [(PLMutablePTPAsset *)v5 setOriginalFilename:v3];
    [(PLMutablePTPAsset *)v5 setFullDirectoryPath:v4];
    v21 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v30 error:0];
    v22 = [v21 objectForKey:*MEMORY[0x1E4F28390]];
    [(PLMutablePTPAsset *)v5 setObjectCompressedSize:v22];
    -[PLMutablePTPAsset setImagePixSize:](v5, "setImagePixSize:", (double)[(PLPTPTransferableAsset *)self->_asset width], (double)[(PLPTPTransferableAsset *)self->_asset height]);
    [(PLMutablePTPAsset *)v5 setThumbOffset:&unk_1EEBEFF30];
    v23 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)v5 setThumbCompressedSize:v23];

    v24 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [(PLMutablePTPAsset *)v5 setRelatedUUID:v24];

    v25 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:0 isRender:1];
    [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:v5 sourceHints:v25 forceLegacyConversion:0 assetTypeLabel:@"full size render image"];
    v26 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
    [(PLMutablePTPAsset *)v5 setLocationString:v26];

    if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
    {
      v27 = [(PLPTPTransferableAsset *)self->_asset mediaGroupUUID];
      [(PLMutablePTPAsset *)v5 setGroupUUID:v27];
    }
    v28 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    -[PLMutablePTPAsset setDeleted:](v5, "setDeleted:", ((unint64_t)[v28 ptpTrashedState] >> 2) & 1);

    fullSizeRenderImagePtpAsset = self->_fullSizeRenderImagePtpAsset;
    self->_fullSizeRenderImagePtpAsset = v5;
  }
}

- (void)_buildSecondaryAdjustmentDataAsset
{
  if (!self->_secondaryAdjustmentDataPtpAsset)
  {
    id v21 = [(PLPTPTransferableAsset *)self->_asset pathForAdjustmentSecondaryDataFile];
    if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
    {
      v3 = [v21 lastPathComponent];
      BOOL v4 = [v21 stringByDeletingLastPathComponent];
      v5 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
      v6 = [PLPTPAssetHandle alloc];
      v7 = [(PLPTPTransferableAsset *)self->_asset objectID];
      uint64_t v8 = [(PLPTPAssetHandle *)v6 initWithType:2 assetID:v7 sidecarID:0 requiresConversion:0];
      [(PLMutablePTPAsset *)v5 setAssetHandle:v8];

      filenameForPTP = self->_filenameForPTP;
      v10 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
      uint64_t v11 = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
      v12 = [(PLPTPAsset *)v5 assetHandle];
      id v13 = [v12 auxiliaryResourceFilenameMarker];
      uint64_t v14 = +[PLDCFUtilities dcfCompliantNameForFileName:filenameForPTP createDate:v10 fileSize:v11 filenameMarker:v13];

      v15 = objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", @"DAT");
      [(PLMutablePTPAsset *)v5 setFilename:v15];

      [(PLMutablePTPAsset *)v5 setOriginalFilename:v3];
      [(PLMutablePTPAsset *)v5 setFullDirectoryPath:v4];
      uint64_t v16 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v21 error:0];
      uint64_t v17 = [v16 objectForKey:*MEMORY[0x1E4F28390]];
      [(PLMutablePTPAsset *)v5 setObjectCompressedSize:v17];

      v18 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
      [(PLMutablePTPAsset *)v5 setRelatedUUID:v18];

      v19 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
      -[PLMutablePTPAsset setDeleted:](v5, "setDeleted:", ((unint64_t)[v19 ptpTrashedState] >> 1) & 1);

      secondaryAdjustmentDataPtpAsset = self->_secondaryAdjustmentDataPtpAsset;
      self->_secondaryAdjustmentDataPtpAsset = v5;
    }
  }
}

- (void)_buildAdjustmentAsset
{
  if (!self->_adjustmentPtpAsset)
  {
    v3 = [(PLPTPTransferableAsset *)self->_asset pathForAdjustmentFile];
    if ([(PLFileManager *)self->_fileManager fileExistsAtPath:v3 isDirectory:0])
    {
      BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
      uint64_t v21 = 0;
      char v5 = [MEMORY[0x1E4F8CBB8] adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:v4 predictedSize:&v21];
      v6 = [v3 lastPathComponent];
      v7 = [v3 stringByDeletingLastPathComponent];
      uint64_t v8 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
      v9 = [PLPTPAssetHandle alloc];
      v10 = [(PLPTPTransferableAsset *)self->_asset objectID];
      uint64_t v11 = [(PLPTPAssetHandle *)v9 initWithType:1 assetID:v10 sidecarID:0 requiresConversion:0];
      [(PLMutablePTPAsset *)v8 setAssetHandle:v11];

      v12 = [(NSString *)self->_filenameForPTP _pl_stringByReplacingPathExtension:@"AAE"];
      [(PLMutablePTPAsset *)v8 setFilename:v12];

      [(PLMutablePTPAsset *)v8 setOriginalFilename:v6];
      id v13 = [(PLPTPTransferableAsset *)self->_asset originalFilename];

      if (v13)
      {
        uint64_t v14 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
        v15 = objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", @"AAE");
        [(PLMutablePTPAsset *)v8 setCreatedFilename:v15];
      }
      [(PLMutablePTPAsset *)v8 setFullDirectoryPath:v7];
      if (v5)
      {
        uint64_t v16 = [NSNumber numberWithInteger:v21];
      }
      else
      {
        uint64_t v17 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v3 error:0];
        uint64_t v16 = [v17 objectForKey:*MEMORY[0x1E4F28390]];
      }
      [(PLMutablePTPAsset *)v8 setObjectCompressedSize:v16];
      v18 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
      [(PLMutablePTPAsset *)v8 setRelatedUUID:v18];

      v19 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
      -[PLMutablePTPAsset setDeleted:](v8, "setDeleted:", ((unint64_t)[v19 ptpTrashedState] >> 1) & 1);

      adjustmentPtpAsset = self->_adjustmentPtpAsset;
      self->_adjustmentPtpAsset = v8;
    }
  }
}

- (void)_buildDiagnosticAsset
{
  if ([(id)objc_opt_class() _shouldIncludeDiagnosticFile] && !self->_diagnosticPtpAsset)
  {
    uint64_t v16 = [(PLPTPTransferableAsset *)self->_asset pathForDiagnosticFile];
    int v3 = [(PLFileManager *)self->_fileManager fileExistsAtPath:v16 isDirectory:0];
    BOOL v4 = v16;
    if (v3)
    {
      char v5 = [v16 lastPathComponent];
      v6 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
      v7 = [v16 stringByDeletingLastPathComponent];
      uint64_t v8 = [(NSString *)self->_filenameForPTP _pl_stringByReplacingPathExtension:@"DBG"];
      [(PLMutablePTPAsset *)v6 setFilename:v8];

      [(PLMutablePTPAsset *)v6 setOriginalFilename:v5];
      v9 = [(PLPTPTransferableAsset *)self->_asset originalFilename];

      if (v9)
      {
        v10 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
        uint64_t v11 = objc_msgSend(v10, "_pl_stringByReplacingPathExtension:", @"DBG");
        [(PLMutablePTPAsset *)v6 setCreatedFilename:v11];
      }
      [(PLMutablePTPAsset *)v6 setFullDirectoryPath:v7];
      v12 = [(PLFileManager *)self->_fileManager attributesOfItemAtPath:v16 error:0];
      id v13 = [v12 objectForKey:*MEMORY[0x1E4F28390]];
      if (v13) {
        [(PLMutablePTPAsset *)v6 setObjectCompressedSize:v13];
      }
      uint64_t v14 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
      [(PLMutablePTPAsset *)v6 setRelatedUUID:v14];

      diagnosticPtpAsset = self->_diagnosticPtpAsset;
      self->_diagnosticPtpAsset = v6;

      BOOL v4 = v16;
    }
  }
}

- (id)_assetForSidecar:(id)a3 sidecarPath:(id)a4 irisSidecarPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = 0;
  if ([(PLFileManager *)self->_fileManager fileExistsAtPath:v10 isDirectory:0])
  {
    SEL v41 = a2;
    v12 = (void *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
    id v13 = [v9 filename];
    uint64_t v14 = [v13 lastPathComponent];

    uint64_t v15 = [v14 pathExtension];
    uint64_t v16 = [PLPTPAssetHandle alloc];
    uint64_t v17 = [(PLPTPTransferableAsset *)self->_asset objectID];
    v18 = [v9 objectID];
    v19 = [(PLPTPAssetHandle *)v16 initWithType:3 assetID:v17 sidecarID:v18 requiresConversion:0];
    [v12 setAssetHandle:v19];

    if (v14)
    {
      v20 = [(NSString *)self->_filenameForPTP _pl_stringByReplacingPathExtension:v15];
      [v12 setFilename:v20];

      [v12 setOriginalFilename:v14];
      uint64_t v21 = [(PLPTPTransferableAsset *)self->_asset originalFilename];

      if (v21)
      {
        v22 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
        v23 = objc_msgSend(v22, "_pl_stringByReplacingPathExtension:", v15);
        [v12 setCreatedFilename:v23];
      }
      v24 = [v10 stringByDeletingLastPathComponent];
      [v12 setFullDirectoryPath:v24];
    }
    v42 = (void *)v15;
    v43 = v14;
    v25 = [v9 captureDate];
    v26 = EXIFStringFromDate(v25);

    [v12 setCaptureDateString:v26];
    v27 = [v9 modificationDate];
    v28 = EXIFStringFromDate(v27);

    [v12 setModificationDateString:v28];
    id v29 = [v9 compressedSize];
    [v12 setObjectCompressedSize:v29];
    id v30 = [(PLPTPAsset *)self->_originalPtpAsset relatedUUID];
    [v12 setRelatedUUID:v30];

    if (v11)
    {
      v31 = [v9 fileURL];
      id v32 = [v31 path];
      int v33 = [v11 isEqualToString:v32];

      if (v33)
      {
        v34 = [(PLPTPTransferableAsset *)self->_asset mediaGroupUUID];
        [v12 setGroupUUID:v34];

        v35 = [(PLPTPAsset *)self->_originalPtpAsset locationString];
        [v12 setLocationString:v35];

        __int16 v36 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:1 isRender:0];
        [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:v12 sourceHints:v36 forceLegacyConversion:0 assetTypeLabel:@"video complement sidecar"];
        v37 = [v12 assetHandle];
        self->_irisSidecarRequiresFormatConversion = [v37 requiresConversion];

        if (self->_currentPtpAsset)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:v41 object:self file:@"PLPTPAssetBuilder.m" lineNumber:702 description:@"Unexpected non-nil current PTP asset"];
        }
        objc_storeStrong((id *)&self->_currentPtpAsset, v12);
        [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureGroupIdentifier];
        currentPtpAsset = self->_currentPtpAsset;
        self->_currentPtpAsset = 0;
      }
    }
    objc_msgSend(v12, "setDeleted:", objc_msgSend(v9, "ptpTrashedState") != 0);
  }
  return v12;
}

- (void)_buildVideoCodec
{
  if ([(PLPTPTransferableAsset *)self->_asset isVideo])
  {
    if (!self->_currentPtpAsset)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:652 description:@"Unexpected nil current PTP asset"];
    }
    BOOL v4 = [(PLPTPTransferableAsset *)self->_asset ptpExtendedAttributes];
    id v7 = [v4 codec];

    char v5 = v7;
    if (v7)
    {
      -[PLMutablePTPAsset setVideoCodec:](self->_currentPtpAsset, "setVideoCodec:", [MEMORY[0x1E4F8CC38] fourCharCodeFromString:v7]);
      char v5 = v7;
    }
  }
}

- (void)_buildSidecarAssets
{
  if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
  {
    int v3 = [(PLPTPTransferableAsset *)self->_asset ptpPhotoIrisSidecar];
    BOOL v4 = [v3 fileURL];
    char v5 = [v4 path];
  }
  else
  {
    char v5 = 0;
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
  asset = self->_asset;
  fileManager = self->_fileManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PLPTPAssetBuilder__buildSidecarAssets__block_invoke;
  v13[3] = &unk_1E5872230;
  v13[4] = self;
  id v14 = v5;
  id v9 = v6;
  uint64_t v15 = v9;
  id v10 = v5;
  +[PLPTPUtilities enumerateAvailableSidecarFilesOnAsset:asset withFileManager:fileManager usingBlock:v13];
  sidecarPtpAssets = self->_sidecarPtpAssets;
  self->_sidecarPtpAssets = v9;
  v12 = v9;
}

void __40__PLPTPAssetBuilder__buildSidecarAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 resourceType] == 5
    && [*(id *)(*(void *)(a1 + 32) + 8) peerSupportsAdjustmentBaseResources])
  {
    [*(id *)(a1 + 32) buildOriginalAdjustmentPtpAsset];
  }
  else
  {
    v6 = [*(id *)(a1 + 32) _assetForSidecar:v7 sidecarPath:v5 irisSidecarPath:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 48), "_pl_addNonNilObject:", v6);
  }
}

- (void)_buildDeletedFlag
{
  if (!self->_currentPtpAsset)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:620 description:@"Unexpected nil current PTP asset"];
  }
  id v5 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  -[PLMutablePTPAsset setDeleted:](self->_currentPtpAsset, "setDeleted:", [v5 ptpTrashedState] & 1);
}

- (void)_buildSpatialOverCaptureLivePhotoPairingIdentifier
{
  if (!self->_currentPtpAsset)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:613 description:@"Unexpected nil current PTP asset"];
  }
  id v6 = [(PLPTPAssetBuilder *)self spatialOverCaptureInformation];
  int v3 = [v6 spatialOverCaptureLivePhotoPairingIdentifier];
  [(PLMutablePTPAsset *)self->_currentPtpAsset setGroupUUID:v3];
}

- (void)_buildSpatialOverCaptureGroupIdentifier
{
  if (!self->_currentPtpAsset)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:605 description:@"Unexpected nil current PTP asset"];
  }
  if ([(PLPTPAssetBuilder *)self hasSpatialOverCaptureContent])
  {
    id v6 = [(PLPTPAssetBuilder *)self spatialOverCaptureInformation];
    int v3 = [v6 spatialOverCaptureGroupIdentifier];
    [(PLMutablePTPAsset *)self->_currentPtpAsset setSpatialOverCaptureGroupIdentifier:v3];
  }
}

- (id)spatialOverCaptureInformation
{
  cachedSpatialOverCaptureInformation = self->_cachedSpatialOverCaptureInformation;
  if (!cachedSpatialOverCaptureInformation)
  {
    BOOL v4 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
    id v5 = [v4 spatialOverCaptureInformation];
    id v6 = self->_cachedSpatialOverCaptureInformation;
    self->_cachedSpatialOverCaptureInformation = v5;

    cachedSpatialOverCaptureInformation = self->_cachedSpatialOverCaptureInformation;
  }
  return cachedSpatialOverCaptureInformation;
}

- (void)_buildRelatedUUID
{
  if (!self->_currentPtpAsset)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:585 description:@"Unexpected nil current PTP asset"];
  }
  id v8 = [(PLPTPTransferableAsset *)self->_asset uuid];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = v8;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];

    id v3 = (id)v5;
  }
  id v9 = v3;
  [(PLMutablePTPAsset *)self->_currentPtpAsset setRelatedUUID:v3];
}

- (void)_buildTimelapse
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:577 description:@"Unexpected nil current PTP asset"];
  }
  if ([(PLPTPTransferableAsset *)self->_asset isVideo]
    && [(PLPTPTransferableAsset *)self->_asset kindSubtype] == 102)
  {
    currentPtpAsset = self->_currentPtpAsset;
    [(PLMutablePTPAsset *)currentPtpAsset setTimeLapseVideo:1];
  }
}

- (void)_buildSlowMo
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:568 description:@"Unexpected nil current PTP asset"];
  }
  if ([(PLPTPTransferableAsset *)self->_asset isVideo]
    && [(PLPTPTransferableAsset *)self->_asset kindSubtype] == 101)
  {
    currentPtpAsset = self->_currentPtpAsset;
    [(PLMutablePTPAsset *)currentPtpAsset setHighFrameRateVideo:1];
  }
}

- (void)_buildBurst
{
  if (!self->_currentPtpAsset)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:545 description:@"Unexpected nil current PTP asset"];
  }
  if ([(PLPTPTransferableAsset *)self->_asset isAvalanchePhoto])
  {
    id v3 = [(PLPTPTransferableAsset *)self->_asset avalancheUUID];
    if (v3)
    {
      id v7 = v3;
      [(PLMutablePTPAsset *)self->_currentPtpAsset setBurstUUID:v3];
      char v4 = [(PLPTPTransferableAsset *)self->_asset avalanchePickType];
      if ((v4 & 4) != 0) {
        [(PLMutablePTPAsset *)self->_currentPtpAsset setBurstPicked:1];
      }
      if ((v4 & 8) != 0) {
        [(PLMutablePTPAsset *)self->_currentPtpAsset setBurstFavorite:1];
      }
      id v3 = v7;
      if ((v4 & 0x20) != 0)
      {
        [(PLMutablePTPAsset *)self->_currentPtpAsset setBurstFirstPicked:1];
        id v3 = v7;
      }
    }
  }
}

- (BOOL)_hasIrisSidecarFile
{
  if (![(PLPTPTransferableAsset *)self->_asset isPhotoIris]) {
    return 0;
  }
  id v3 = [(PLPTPTransferableAsset *)self->_asset mediaGroupUUID];

  if (!v3) {
    return 0;
  }
  char v4 = [(PLPTPTransferableAsset *)self->_asset ptpPhotoIrisSidecar];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_buildGroupUUID
{
  if (!self->_currentPtpAsset)
  {
    char v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:525 description:@"Unexpected nil current PTP asset"];
  }
  if ([(PLPTPAssetBuilder *)self _hasIrisSidecarFile])
  {
    id v5 = [(PLPTPTransferableAsset *)self->_asset mediaGroupUUID];
    [(PLMutablePTPAsset *)self->_currentPtpAsset setGroupUUID:v5];
  }
}

- (void)_buildGPSInformation
{
  if (!self->_currentPtpAsset)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:514 description:@"Unexpected nil current PTP asset"];
  }
  id v3 = [(PLPTPTransferableAsset *)self->_asset location];
  if (v3)
  {
    id v13 = v3;
    [v3 coordinate];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    id v8 = NSString;
    [v13 altitude];
    id v10 = objc_msgSend(v8, "stringWithFormat:", @"%+f,%+f,%+f", v5, v7, v9);
    [(PLMutablePTPAsset *)self->_currentPtpAsset setLocationString:v10];

    id v3 = v13;
  }
}

- (void)_durationOfTheAsset
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:501 description:@"Unexpected nil current PTP asset"];
  }
  if (([(PLPTPTransferableAsset *)self->_asset isVideo] & 1) != 0
    || [(PLPTPTransferableAsset *)self->_asset isAudio])
  {
    id v3 = NSNumber;
    [(PLPTPTransferableAsset *)self->_asset duration];
    uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
    if (v4)
    {
      id v8 = v4;
      uint64_t v5 = [v4 stringValue];
      [(PLMutablePTPAsset *)self->_currentPtpAsset setDurationString:v5];

      uint64_t v4 = v8;
    }
  }
}

- (void)_buildIsHDR
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:482 description:@"Unexpected nil current PTP asset"];
  }
  unsigned int v3 = [(PLPTPTransferableAsset *)self->_asset hdrType];
  if (v3 <= 0xB && ((0xC3Du >> v3) & 1) != 0)
  {
    uint64_t v4 = (0xC2Cu >> v3) & 1;
    currentPtpAsset = self->_currentPtpAsset;
    [(PLMutablePTPAsset *)currentPtpAsset setIsHDR:v4];
  }
}

- (void)_buildModificationAndCreationDate
{
  if (!self->_currentPtpAsset)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:457 description:@"Unexpected nil current PTP asset"];
  }
  unsigned int v3 = [(PLPTPTransferableAsset *)self->_asset modificationDate];
  uint64_t v4 = EXIFStringFromDate(v3);

  if (v4) {
    [(PLMutablePTPAsset *)self->_currentPtpAsset setModificationDateString:v4];
  }

  uint64_t v5 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  id v11 = [v5 exifTimestampString];

  if ([v11 length])
  {
    uint64_t v6 = ExifDateStringToDate(v11);
    uint64_t v7 = EXIFStringFromDate(v6);

    if (v7) {
      goto LABEL_8;
    }
  }
  id v8 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
  uint64_t v7 = EXIFStringFromDate(v8);

  if (v7)
  {
LABEL_8:
    [(PLMutablePTPAsset *)self->_currentPtpAsset setCaptureDateString:v7];
  }
}

- (void)_buildPhotoKey
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:450 description:@"Unexpected nil current PTP asset"];
  }
  unsigned int v3 = [PLPTPAssetHandle alloc];
  id v7 = [(PLPTPTransferableAsset *)self->_asset objectID];
  uint64_t v4 = [(PLPTPAssetHandle *)v3 initWithType:0 assetID:v7 sidecarID:0 requiresConversion:0];
  [(PLMutablePTPAsset *)self->_currentPtpAsset setAssetHandle:v4];
}

- (void)_buildOrientation
{
  if (!self->_currentPtpAsset)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:444 description:@"Unexpected nil current PTP asset"];
  }
  uint64_t v3 = (int)[(PLPTPTransferableAsset *)self->_asset originalOrientation];
  currentPtpAsset = self->_currentPtpAsset;
  [(PLMutablePTPAsset *)currentPtpAsset setDesiredOrientation:v3];
}

- (void)_buildThumbnailDimensions
{
  if (!self->_currentPtpAsset)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:432 description:@"Unexpected nil current PTP asset"];
  }
  uint64_t v3 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  id v12 = [v3 embeddedThumbnailWidth];

  uint64_t v4 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  uint64_t v5 = [v4 embeddedThumbnailHeight];

  if (v12) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [v12 doubleValue];
    double v8 = v7;
    [v5 doubleValue];
    -[PLMutablePTPAsset setThumbPixSize:](self->_currentPtpAsset, "setThumbPixSize:", v8, v9);
  }
}

- (void)_buildImageDimensions
{
  if (!self->_currentPtpAsset)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:417 description:@"Unexpected nil current PTP asset"];
  }
  double v3 = (double)[(PLPTPTransferableAsset *)self->_asset originalWidth];
  double v4 = (double)[(PLPTPTransferableAsset *)self->_asset originalHeight];
  int v5 = [(PLPTPTransferableAsset *)self->_asset originalOrientation] - 5;
  if ((v5 & 0xFFFC) != 0) {
    double v6 = v4;
  }
  else {
    double v6 = v3;
  }
  if ((v5 & 0xFFFC) != 0) {
    double v7 = v3;
  }
  else {
    double v7 = v4;
  }
  currentPtpAsset = self->_currentPtpAsset;
  -[PLMutablePTPAsset setImagePixSize:](currentPtpAsset, "setImagePixSize:", v7, v6);
}

- (void)_buildThumbnailOffsetAndLength
{
  if (!self->_currentPtpAsset)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:395 description:@"Unexpected nil current PTP asset"];
  }
  double v3 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  id v10 = [v3 embeddedThumbnailOffset];

  if (v10)
  {
    double v4 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPTPTransferableAsset embeddedThumbnailOffset](self->_asset, "embeddedThumbnailOffset"));
    [(PLMutablePTPAsset *)self->_currentPtpAsset setThumbOffset:v4];
  }
  int v5 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  double v6 = [v5 embeddedThumbnailLength];

  if ([v6 longValue] < 1)
  {
    if (![v10 integerValue]) {
      [(PLMutablePTPAsset *)self->_currentPtpAsset setThumbOffset:&unk_1EEBEFF30];
    }
    double v7 = [NSNumber numberWithInt:0x10000];
    [(PLMutablePTPAsset *)self->_currentPtpAsset setThumbCompressedSize:v7];
  }
  else
  {
    [(PLMutablePTPAsset *)self->_currentPtpAsset setThumbCompressedSize:v6];
  }
}

- (void)_buildOriginatingAssetID
{
  if (!self->_currentPtpAsset)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:385 description:@"Unexpected nil current PTP asset"];
  }
  double v3 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  id v7 = [v3 originatingAssetIdentifier];

  double v4 = v7;
  if (v7)
  {
    [(PLMutablePTPAsset *)self->_currentPtpAsset setOriginatingAssetID:v7];
    double v4 = v7;
  }
}

- (void)_buildFingerprint
{
  if (!self->_currentPtpAsset)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:375 description:@"Unexpected nil current PTP asset"];
  }
  double v3 = [(PLPTPTransferableAsset *)self->_asset ptpAdditionalAttributes];
  id v7 = [v3 originalStableHash];

  double v4 = v7;
  if (v7)
  {
    [(PLMutablePTPAsset *)self->_currentPtpAsset setFingerprint:v7];
    double v4 = v7;
  }
}

- (void)_buildFileSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_currentPtpAsset)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:351 description:@"Unexpected nil current PTP asset"];
  }
  off_t st_size = [(PLPTPTransferableAsset *)self->_asset originalFilesize];
  if (!st_size)
  {
    if ([(PLPTPTransferableAsset *)self->_asset isPhoto]
      && [(PLPTPTransferableAsset *)self->_asset cloudPhotoLibraryEnabled])
    {
      off_t st_size = [(PLPTPTransferableAsset *)self->_asset ptpCloudMasterOriginalFileSize];
    }
    else
    {
      off_t st_size = 0;
    }
  }
  if (([(PLPTPTransferableAsset *)self->_asset isVideo] & 1) == 0 && st_size) {
    goto LABEL_14;
  }
  memset(&v13.st_size, 0, 48);
  double v4 = [(PLPTPTransferableAsset *)self->_asset mainFileURL];
  id v5 = [v4 path];
  int v6 = stat((const char *)[v5 fileSystemRepresentation], &v13);

  if (!v6)
  {
    off_t st_size = v13.st_size;
    if (!v13.st_size) {
      return;
    }
    goto LABEL_14;
  }
  id v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    double v8 = [(PLPTPTransferableAsset *)self->_asset mainFileURL];
    double v9 = [v8 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to stat asset at path %@", buf, 0xCu);
  }
  if (st_size)
  {
LABEL_14:
    id v10 = [NSNumber numberWithUnsignedLongLong:st_size];
    [(PLMutablePTPAsset *)self->_currentPtpAsset setObjectCompressedSize:v10];
  }
}

- (void)_buildExifAvailable
{
  if (!self->_currentPtpAsset)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:339 description:@"Unexpected nil current PTP asset"];
  }
  uint64_t v3 = [(PLPTPTransferableAsset *)self->_asset isPhoto];
  currentPtpAsset = self->_currentPtpAsset;
  [(PLMutablePTPAsset *)currentPtpAsset setExifAvailable:v3];
}

- (BOOL)_buildDirectoryPathAndFilename
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_currentPtpAsset)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:308 description:@"Unexpected nil current PTP asset"];
  }
  uint64_t v3 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PLPTPTransferableAsset *)self->_asset filename];
  }
  int v6 = v5;

  id v7 = [(PLPTPTransferableAsset *)self->_asset dateCreated];
  double v8 = +[PLDCFUtilities dcfCompliantNameForFileName:v6 createDate:v7 fileSize:[(PLPTPTransferableAsset *)self->_asset originalFilesize] filenameMarker:0];
  filenameForPTP = self->_filenameForPTP;
  self->_filenameForPTP = v8;

  id v10 = [(PLPTPTransferableAsset *)self->_asset pathForOriginalFile];
  id v11 = [v10 stringByDeletingLastPathComponent];
  if (v11) {
    [(PLMutablePTPAsset *)self->_currentPtpAsset setFullDirectoryPath:v11];
  }
  id v12 = [v10 lastPathComponent];
  if (!v12)
  {
    id v14 = PLPTPGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [(PLPTPTransferableAsset *)self->_asset objectID];
      int v16 = [(PLPTPTransferableAsset *)self->_asset isInFlight];
      uint64_t v17 = @"NO";
      int v21 = 138412802;
      v22 = v10;
      __int16 v23 = 2112;
      if (v16) {
        uint64_t v17 = @"YES";
      }
      v24 = v15;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "The original name for the photo at path %@ with object ID %@ is nil. Was the photo inflight ? %@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_15;
  }
  [(PLMutablePTPAsset *)self->_currentPtpAsset setOriginalFilename:v12];
  [(PLMutablePTPAsset *)self->_currentPtpAsset setFilename:self->_filenameForPTP];
  stat v13 = [(PLPTPTransferableAsset *)self->_asset originalFilename];

  if (v13)
  {
    id v14 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
    [(PLMutablePTPAsset *)self->_currentPtpAsset setCreatedFilename:v14];
LABEL_15:
  }
  return v12 != 0;
}

- (BOOL)_suppressPtpInfo
{
  [MEMORY[0x1E4F8BA10] maskForSuppressPtpInfo];
  [(PLPTPTransferableAsset *)self->_asset savedAssetType];
  if (PLValidatedSavedAssetTypeApplies()) {
    return 1;
  }
  double v4 = [(PLPTPTransferableAsset *)self->_asset originalFilename];
  if (v4)
  {
    BOOL v3 = 0;
  }
  else
  {
    id v5 = [(PLPTPTransferableAsset *)self->_asset filename];
    BOOL v3 = v5 == 0;
  }
  return v3;
}

- (void)_updateOriginalAssetFormatConversionFromVideoComplement
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_irisSidecarRequiresFormatConversion)
  {
    BOOL v3 = [(PLPTPAsset *)self->_originalPtpAsset assetHandle];
    char v4 = [v3 requiresConversion];

    if ((v4 & 1) == 0)
    {
      id v5 = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:[(PLPTPTransferableAsset *)self->_asset isVideo] isRender:0];
      int v6 = [(PLPTPConversionSupport *)self->_conversionSupport conversionResultForAsset:self->_originalPtpAsset sourceHints:v5 forceLegacyConversion:1 assetTypeLabel:@"originalAssetFromVideoComplement"];
      if (v6)
      {
        id v7 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_originalPtpAsset mutableCopy];
        [(PLPTPAssetBuilder *)self _updateAsset:v7 withConversionResult:v6];
        originalPtpAsset = self->_originalPtpAsset;
        self->_originalPtpAsset = v7;
      }
      else
      {
        double v9 = PLPTPGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = self->_originalPtpAsset;
          int v11 = 138412290;
          id v12 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unexpected nil PLPTPConversionResult for forced conversion for original asset %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }
}

- (void)_updateAsset:(id)a3 withConversionResult:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  if ([v5 outputVideoCodec]) {
    objc_msgSend(v19, "setVideoCodec:", objc_msgSend(v5, "outputVideoCodec"));
  }
  int v6 = [v5 outputContentType];
  [v19 setContentType:v6];

  if ([v5 requiresConversion])
  {
    id v7 = [v19 assetHandle];
    double v8 = [v7 assetHandleBySettingRequiresConversion];
    [v19 setAssetHandle:v8];

    double v9 = [v19 filename];
    id v10 = [v5 pathExtension];
    int v11 = objc_msgSend(v9, "_pl_stringByReplacingPathExtension:", v10);
    [v19 setFilename:v11];

    id v12 = [v19 originalFilename];
    uint64_t v13 = [v5 pathExtension];
    id v14 = objc_msgSend(v12, "_pl_stringByReplacingPathExtension:", v13);
    [v19 setOriginalFilename:v14];

    uint64_t v15 = [v19 createdFilename];
    int v16 = [v5 pathExtension];
    uint64_t v17 = objc_msgSend(v15, "_pl_stringByReplacingPathExtension:", v16);
    [v19 setCreatedFilename:v17];

    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "estimatedFileLength"));
    [v19 setObjectCompressedSize:v18];
  }
}

- (void)_updateAssetForTranscodeChoice:(id)a3 withConversionResult:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  objc_msgSend(v22, "setVideoCodec:", objc_msgSend(v6, "inputVideoCodec"));
  id v7 = [v6 inputContentType];
  [v22 setContentType:v7];

  if ([v6 requiresConversion])
  {
    [v22 setConversionGroup:1];
    double v8 = (void *)[v22 mutableCopy];
    [v8 setConversionGroup:2];
    double v9 = [v22 assetHandle];
    id v10 = [v9 assetHandleBySettingRequiresConversion];
    [v8 setAssetHandle:v10];

    int v11 = [v22 filename];
    id v12 = [v6 pathExtension];
    uint64_t v13 = objc_msgSend(v11, "_pl_stringByReplacingPathExtension:", v12);
    [v8 setFilename:v13];

    id v14 = [v22 originalFilename];
    uint64_t v15 = [v6 pathExtension];
    int v16 = objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", v15);
    [v8 setOriginalFilename:v16];

    uint64_t v17 = [v22 createdFilename];
    v18 = [v6 pathExtension];
    id v19 = objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v18);
    [v8 setCreatedFilename:v19];

    v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "estimatedFileLength"));
    [v8 setObjectCompressedSize:v20];

    objc_msgSend(v8, "setVideoCodec:", objc_msgSend(v6, "outputVideoCodec"));
    int v21 = [v6 outputContentType];
    [v8 setContentType:v21];

    [(NSMutableArray *)self->_convertedAssets addObject:v8];
  }
}

- (void)updateAssetForFormatConversion:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  id v8 = a3;
  id v7 = -[PLPTPConversionSupport conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:](self->_conversionSupport, "conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:");
  if (v7)
  {
    if ([(PLPTPConversionSupport *)self->_conversionSupport peerSupportsTranscodeChoice])[(PLPTPAssetBuilder *)self _updateAssetForTranscodeChoice:v8 withConversionResult:v7]; {
    else
    }
      [(PLPTPAssetBuilder *)self _updateAsset:v8 withConversionResult:v7];
  }
}

- (BOOL)_buildOriginalAsset
{
  if (self->_currentPtpAsset)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLPTPAssetBuilder.m" lineNumber:172 description:@"Unexpected non-nil current PTP asset"];
  }
  BOOL v3 = (PLMutablePTPAsset *)[(PLMutablePTPAsset *)self->_commonPtpAsset mutableCopy];
  currentPtpAsset = self->_currentPtpAsset;
  self->_currentPtpAsset = v3;

  BOOL v5 = [(PLPTPAssetBuilder *)self _buildDirectoryPathAndFilename];
  if (v5)
  {
    [(PLPTPAssetBuilder *)self _buildPhotoKey];
    [(PLPTPAssetBuilder *)self _buildExifAvailable];
    [(PLPTPAssetBuilder *)self _buildFileSize];
    [(PLPTPAssetBuilder *)self _buildFingerprint];
    [(PLPTPAssetBuilder *)self _buildOriginatingAssetID];
    [(PLPTPAssetBuilder *)self _buildThumbnailOffsetAndLength];
    [(PLPTPAssetBuilder *)self _buildImageDimensions];
    [(PLPTPAssetBuilder *)self _buildThumbnailDimensions];
    [(PLPTPAssetBuilder *)self _buildOrientation];
    [(PLPTPAssetBuilder *)self _durationOfTheAsset];
    [(PLPTPAssetBuilder *)self _buildGPSInformation];
    [(PLPTPAssetBuilder *)self _buildGroupUUID];
    [(PLPTPAssetBuilder *)self _buildBurst];
    [(PLPTPAssetBuilder *)self _buildSlowMo];
    [(PLPTPAssetBuilder *)self _buildTimelapse];
    [(PLPTPAssetBuilder *)self _buildRelatedUUID];
    [(PLPTPAssetBuilder *)self _buildDeletedFlag];
    [(PLPTPAssetBuilder *)self _buildSpatialOverCaptureGroupIdentifier];
    [(PLPTPAssetBuilder *)self _buildVideoCodec];
    originalPtpAsset = +[PLPTPConversionSourceHints hintsForAsset:self->_asset isVideo:[(PLPTPTransferableAsset *)self->_asset isVideo] isRender:0];
    [(PLPTPAssetBuilder *)self updateAssetForFormatConversion:self->_currentPtpAsset sourceHints:originalPtpAsset forceLegacyConversion:0 assetTypeLabel:@"original"];
    objc_storeStrong((id *)&self->_originalPtpAsset, self->_currentPtpAsset);
    id v7 = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;
  }
  else
  {
    originalPtpAsset = self->_originalPtpAsset;
    self->_originalPtpAsset = 0;
  }

  return v5;
}

- (void)_buildCommonAsset
{
  BOOL v3 = objc_alloc_init(PLMutablePTPAsset);
  currentPtpAsset = self->_currentPtpAsset;
  self->_currentPtpAsset = v3;

  [(PLPTPAssetBuilder *)self _buildModificationAndCreationDate];
  [(PLPTPAssetBuilder *)self _buildIsHDR];
  objc_storeStrong((id *)&self->_commonPtpAsset, self->_currentPtpAsset);
  BOOL v5 = self->_currentPtpAsset;
  self->_currentPtpAsset = 0;
}

- (void)updateSiblingAssetTypesOnMutablePTPAssets:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = NSNumber;
        int v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) assetHandle];
        id v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "type"));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        id v19 = objc_msgSend(v18, "assetHandle", (void)v21);
        v20 = [v19 assetHandleBySettingSiblingAssetHandleTypes:v4];
        [v18 setAssetHandle:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
}

- (id)pictureTransferProtocolAssets
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(PLPTPAssetBuilder *)self _suppressPtpInfo]
    || ([(PLPTPAssetBuilder *)self _buildCommonAsset],
        ![(PLPTPAssetBuilder *)self _buildOriginalAsset]))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [(PLPTPAssetBuilder *)self _buildSidecarAssets];
    [(PLPTPAssetBuilder *)self _updateOriginalAssetFormatConversionFromVideoComplement];
    [(PLPTPAssetBuilder *)self _buildDiagnosticAsset];
    [(PLPTPAssetBuilder *)self _buildAdjustmentAsset];
    [(PLPTPAssetBuilder *)self _buildSecondaryAdjustmentDataAsset];
    [(PLPTPAssetBuilder *)self _buildFullSizeRenderImageAsset];
    [(PLPTPAssetBuilder *)self _buildFullSizeRenderVideoAsset];
    [(PLPTPAssetBuilder *)self buildSpatialOverCaptureContentPtpAsset];
    [(PLPTPAssetBuilder *)self buildSpatialOverCaptureVideoComplementPtpAsset];
    if ([(PLPTPConversionSupport *)self->_conversionSupport peerSupportsAdjustmentBaseResources]&& [(PLPTPConversionSupport *)self->_conversionSupport penultimateIsPublic])
    {
      [(PLPTPAssetBuilder *)self buildPenultimateImagePtpAsset];
      [(PLPTPAssetBuilder *)self buildPenultimateVideoPtpAsset];
    }
    id v3 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_originalPtpAsset);
    [v3 addObjectsFromArray:self->_sidecarPtpAssets];
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_diagnosticPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_adjustmentPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_secondaryAdjustmentDataPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_fullSizeRenderImagePtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_fullSizeRenderVideoPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_spatialOverCaptureImagePtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_spatialOverCaptureVideoComplementPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_originalAdjustmentPtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_penultimateImagePtpAsset);
    objc_msgSend(v3, "_pl_addNonNilObject:", self->_penultimateVideoPtpAsset);
    [(PLPTPAssetBuilder *)self updateSiblingAssetTypesOnMutablePTPAssets:v3];
    [v3 addObjectsFromArray:self->_convertedAssets];
    char v4 = PLPTPGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = objc_msgSend(v3, "_pl_prettyDescription");
      int v8 = 138412290;
      double v9 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Built assets: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v3 copyItems:1];
  }
  return v6;
}

- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4 fileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLPTPAssetBuilder;
  id v12 = [(PLPTPAssetBuilder *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_asset, a3);
    objc_storeStrong((id *)&v13->_conversionSupport, a4);
    objc_storeStrong((id *)&v13->_fileManager, a5);
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    convertedAssets = v13->_convertedAssets;
    v13->_convertedAssets = v14;

    uint64_t v16 = v13;
  }

  return v13;
}

- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultManager];
  id v10 = [(PLPTPAssetBuilder *)self initWithAsset:v8 conversionSupport:v7 fileManager:v9];

  return v10;
}

+ (BOOL)_shouldIncludeDiagnosticFile
{
  return _shouldIncludeDiagnosticFile_provideDiagnosticFile;
}

uint64_t __49__PLPTPAssetBuilder__shouldIncludeDiagnosticFile__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PLCameraProvideDiagnosticFile", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (result) {
    BOOL v1 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  _shouldIncludeDiagnosticFile_provideDiagnosticFile = v2;
  return result;
}

+ (id)pictureTransferProtocolAssetsForAsset:(id)a3 withConversionSupport:(id)a4
{
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  id v7 = pl_result_with_autoreleasepool();

  return v7;
}

id __81__PLPTPAssetBuilder_pictureTransferProtocolAssetsForAsset_withConversionSupport___block_invoke(uint64_t a1)
{
  BOOL v1 = [[PLPTPAssetBuilder alloc] initWithAsset:*(void *)(a1 + 32) conversionSupport:*(void *)(a1 + 40)];
  char v2 = [(PLPTPAssetBuilder *)v1 pictureTransferProtocolAssets];

  return v2;
}

@end