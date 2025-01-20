@interface PUReviewInternalSaveNode
- (BOOL)useEmbeddedPreview;
- (CGSize)baseImageSize;
- (CGSize)renderedImageSize;
- (CGSize)renderedVideoSize;
- (NSData)imageData;
- (NSString)imageDataUTI;
- (NSURL)adjustmentURL;
- (NSURL)directory;
- (NSURL)imageDataURL;
- (NSURL)providedFullsizeImageURL;
- (NSURL)providedVideoURL;
- (NSURL)videoURL;
- (PUEditableMediaProviderImageDataNode)imageDataNode;
- (PUEditableMediaProviderVideoURLNode)videoURLNode;
- (PUImageDataRenderNode)imageRenderNode;
- (PUReviewInternalSaveNode)initWithDirectory:(id)a3 imageDataNode:(id)a4 imageRenderNode:(id)a5 videoURLNode:(id)a6 videoRenderNode:(id)a7;
- (PUVideoExportNode)videoRenderNode;
- (double)_baseDuration;
- (id)_exportProperties;
- (int64_t)_adjustmentBaseVersion;
- (int64_t)_baseExifOrientation;
- (int64_t)imageExifOrientation;
- (void)run;
@end

@implementation PUReviewInternalSaveNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_videoRenderNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_imageRenderNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
  objc_storeStrong((id *)&self->_imageDataUTI, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_providedVideoURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeImageURL, 0);

  objc_storeStrong((id *)&self->_imageDataURL, 0);
}

- (NSURL)directory
{
  return self->_directory;
}

- (PUVideoExportNode)videoRenderNode
{
  return self->_videoRenderNode;
}

- (PUEditableMediaProviderVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUImageDataRenderNode)imageRenderNode
{
  return self->_imageRenderNode;
}

- (PUEditableMediaProviderImageDataNode)imageDataNode
{
  return self->_imageDataNode;
}

- (BOOL)useEmbeddedPreview
{
  return self->_useEmbeddedPreview;
}

- (NSString)imageDataUTI
{
  return self->_imageDataUTI;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGSize)renderedImageSize
{
  double width = self->_renderedImageSize.width;
  double height = self->_renderedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)baseImageSize
{
  double width = self->_baseImageSize.width;
  double height = self->_baseImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)adjustmentURL
{
  return self->_adjustmentURL;
}

- (CGSize)renderedVideoSize
{
  double width = self->_renderedVideoSize.width;
  double height = self->_renderedVideoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSURL)providedVideoURL
{
  return self->_providedVideoURL;
}

- (NSURL)providedFullsizeImageURL
{
  return self->_providedFullsizeImageURL;
}

- (int64_t)imageExifOrientation
{
  return self->_imageExifOrientation;
}

- (NSURL)imageDataURL
{
  return self->_imageDataURL;
}

- (void)run
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  imageDataURL = self->_imageDataURL;
  self->_imageDataURL = 0;

  self->_imageExifOrientation = 0;
  videoURL = self->_videoURL;
  self->_videoURL = 0;

  adjustmentURL = self->_adjustmentURL;
  self->_adjustmentURL = 0;

  v6 = (CGFloat *)MEMORY[0x1E4F1DB30];
  CGSize v7 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_baseImageSize = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_renderedImageSize = v7;
  uint64_t v8 = [(PUReviewInternalSaveNode *)self directory];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v113 = 0;
  [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v113];
  id v10 = v113;

  v98 = v10;
  if (v10)
  {
    v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v115 = v8;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to create working directory for saving at URL %@", buf, 0xCu);
    }
  }
  v12 = [(PUReviewInternalSaveNode *)self imageDataNode];
  v104 = [(PUReviewInternalSaveNode *)self videoURLNode];
  v13 = [(PUReviewInternalSaveNode *)self imageRenderNode];
  v14 = [(PUReviewInternalSaveNode *)self videoRenderNode];
  v15 = [v12 imageDataURL];
  v16 = v15;
  v17 = off_1E5F1F000;
  if (v15)
  {
    v18 = [v15 pathExtension];
    uint64_t v19 = +[PUReviewAsset fileURLForFullsizeImageInDirectory:v8 extension:v18];

    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v112 = 0;
    uint64_t v93 = v19;
    char v21 = [v20 copyItemAtURL:v16 toURL:v19 error:&v112];
    id v22 = v112;

    if ((v21 & 1) == 0)
    {
      v23 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v115 = (uint64_t)v16;
        __int16 v116 = 2112;
        v117 = 0;
        _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_ERROR, "Failed to link image from %@ to %@", buf, 0x16u);
      }
    }
    v17 = off_1E5F1F000;
  }
  else
  {
    uint64_t v93 = 0;
  }
  CGFloat v24 = *v6;
  CGFloat v25 = v6[1];
  uint64_t v26 = objc_msgSend(v13, "imageData", v93);
  [v13 baseImageSize];
  double v28 = v27;
  double v30 = v29;
  [v13 renderedImageSize];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  v105 = v14;
  v99 = (void *)v26;
  v97 = v12;
  v96 = v13;
  v95 = v16;
  if (v26)
  {
    uint64_t v35 = v8;
    v36 = v12;
    v37 = [(PUReviewInternalSaveNode *)self _exportProperties];
    id v38 = objc_alloc_init(MEMORY[0x1E4F8AA58]);
    v39 = [v13 compositionController];
    id v110 = 0;
    id v111 = 0;
    uint64_t v40 = [v38 dataFromCompositionController:v39 outFormatIdentifier:&v111 outFormatVersion:&v110 exportProperties:v37];
    id v101 = v111;
    id v100 = v110;

    v103 = (void *)v40;
    if (!v40)
    {
      v55 = [v36 asset];
      v56 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = [v13 compositionController];
        *(_DWORD *)buf = 138412546;
        uint64_t v115 = (uint64_t)v55;
        __int16 v116 = 2112;
        v117 = v57;
        _os_log_impl(&dword_1AE9F8000, v56, OS_LOG_TYPE_ERROR, "Error generating the adjustments data for asset:%@ compositionController:%@", buf, 0x16u);
      }
      [(PXRunNode *)self cancel];

      v41 = 0;
      v103 = 0;
      v58 = 0;
      CGFloat v43 = v24;
      CGFloat v42 = v25;
      v17 = off_1E5F1F000;
      uint64_t v8 = v35;
      v14 = v105;
      goto LABEL_31;
    }
    v41 = [(__objc2_class *)v17[27] fileURLForFullsizeRenderImageInDirectory:v35 extension:@"jpg"];
    [v99 writeToURL:v41 atomically:1];
    CGFloat v42 = v34;
    CGFloat v43 = v32;
    CGFloat v24 = v28;
    CGFloat v25 = v30;
    v12 = v36;
LABEL_18:

    if (v12) {
      v54 = v12;
    }
    else {
      v54 = v104;
    }
    v37 = [v54 asset];
    uint64_t v8 = v35;
    unsigned int v59 = [v37 playbackVariation] - 1;
    v14 = v105;
    if (v59 > 2) {
      uint64_t v60 = 0;
    }
    else {
      uint64_t v60 = dword_1AEFF84C0[(unsigned __int16)v59];
    }
    int64_t v61 = [(PUReviewInternalSaveNode *)self _adjustmentBaseVersion];
    id v38 = (id)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v101 formatVersion:v100 data:v103 baseVersion:v61 editorBundleID:0 renderTypes:v60];
    v62 = [v38 propertyListDictionary];
    if (v62)
    {
      v58 = [(__objc2_class *)v17[27] fileURLForAdjustmentsInDirectory:v8];
      [v62 writeToURL:v58 atomically:1];
    }
    else
    {
      v58 = 0;
    }

    CGFloat v32 = v43;
    CGFloat v34 = v42;
LABEL_31:

    goto LABEL_32;
  }
  if (v14)
  {
    v44 = (void *)MEMORY[0x1E4F8A748];
    v45 = [v14 compositionController];
    [v44 synchronousInputSizeForCompositionController:v45];
    double v47 = v46;
    double v49 = v48;

    [v14 renderedVideoSize];
    CGFloat v32 = v50;
    CGFloat v34 = v51;
    v37 = [(PUReviewInternalSaveNode *)self _exportProperties];
    id v38 = objc_alloc_init(MEMORY[0x1E4F8AA58]);
    v52 = [v14 compositionController];
    id v108 = 0;
    id v109 = 0;
    uint64_t v53 = [v38 dataFromCompositionController:v52 outFormatIdentifier:&v109 outFormatVersion:&v108 exportProperties:v37];
    id v101 = v109;
    id v100 = v108;

    v103 = (void *)v53;
    if (!v53)
    {
      v90 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        v91 = [v14 videoURL];
        v92 = [v14 compositionController];
        *(_DWORD *)buf = 138412546;
        uint64_t v115 = (uint64_t)v91;
        __int16 v116 = 2112;
        v117 = v92;
        _os_log_impl(&dword_1AE9F8000, v90, OS_LOG_TYPE_ERROR, "Error generating the adjustments data for video:%@ compositionController:%@", buf, 0x16u);

        v14 = v105;
      }

      [(PXRunNode *)self cancel];
      v41 = 0;
      v103 = 0;
      v58 = 0;
      CGFloat v43 = v24;
      CGFloat v42 = v25;
      v17 = off_1E5F1F000;
      goto LABEL_31;
    }
    uint64_t v35 = v8;
    v41 = 0;
    CGFloat v42 = v34;
    CGFloat v43 = v32;
    CGFloat v24 = v47;
    CGFloat v25 = v49;
    v17 = off_1E5F1F000;
    goto LABEL_18;
  }
  v41 = 0;
  id v100 = 0;
  id v101 = 0;
  v103 = 0;
  v58 = 0;
  CGFloat v43 = v24;
  CGFloat v42 = v25;
LABEL_32:
  v63 = [v104 videoURL];
  v64 = [v104 asset];
  char v65 = [v64 isLivePhoto];

  v102 = (void *)v8;
  if (v63)
  {
    v66 = v17[27];
    if (v65)
    {
      v67 = [(__objc2_class *)v17[27] fileURLForFullsizeVideoComplementInDirectory:v8];
    }
    else
    {
      v68 = [v63 pathExtension];
      v67 = [(__objc2_class *)v66 fileURLForFullsizeVideoInDirectory:v8 extension:v68];
    }
    v69 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v107 = 0;
    char v70 = [v69 copyItemAtURL:v63 toURL:v67 error:&v107];
    id v71 = v107;

    v14 = v105;
    if ((v70 & 1) == 0)
    {
      v72 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v115 = (uint64_t)v63;
        __int16 v116 = 2112;
        v117 = v67;
        _os_log_impl(&dword_1AE9F8000, v72, OS_LOG_TYPE_ERROR, "Failed to link video from %@ to %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v67 = 0;
  }
  v73 = [v14 videoURL];
  if (v73)
  {
    v74 = v17[27];
    if (v65) {
      [(__objc2_class *)v74 fileURLForFullsizeRenderVideoComplementInDirectory:v102];
    }
    else {
    v75 = [(__objc2_class *)v74 fileURLForFullsizeRenderVideoInDirectory:v102];
    }
    v76 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v106 = 0;
    char v77 = [v76 copyItemAtURL:v73 toURL:v75 error:&v106];
    id v78 = v106;

    if ((v77 & 1) == 0)
    {
      v79 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v115 = (uint64_t)v73;
        __int16 v116 = 2112;
        v117 = v75;
        _os_log_impl(&dword_1AE9F8000, v79, OS_LOG_TYPE_ERROR, "Failed to link video from %@ to %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v75 = 0;
  }
  v80 = self->_imageDataURL;
  self->_imageDataURL = v41;
  v81 = v41;

  self->_imageExifOrientation = 1;
  providedFullsizeImageURL = self->_providedFullsizeImageURL;
  self->_providedFullsizeImageURL = v94;
  v83 = v94;

  providedVideoURL = self->_providedVideoURL;
  self->_providedVideoURL = v67;
  v85 = v67;

  v86 = self->_videoURL;
  self->_videoURL = v75;
  v87 = v75;

  v88 = self->_adjustmentURL;
  self->_adjustmentURL = v58;
  v89 = v58;

  self->_baseImageSize.double width = v24;
  self->_baseImageSize.double height = v25;
  self->_renderedImageSize.double width = v43;
  self->_renderedImageSize.double height = v42;
  self->_renderedVideoSize.double width = v32;
  self->_renderedVideoSize.double height = v34;
  [(PXRunNode *)self completeWithError:0];
}

- (id)_exportProperties
{
  v3 = [(PUReviewInternalSaveNode *)self imageRenderNode];
  [v3 baseImageSize];
  unint64_t v5 = llround(v4);
  unint64_t v7 = llround(v6);
  int64_t v8 = [(PUReviewInternalSaveNode *)self _baseExifOrientation];
  [(PUReviewInternalSaveNode *)self _baseDuration];
  v9 = objc_msgSend(MEMORY[0x1E4F8AA48], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", v7, v5, v8);

  return v9;
}

- (int64_t)_adjustmentBaseVersion
{
  v3 = [(PUReviewInternalSaveNode *)self imageDataNode];
  uint64_t v4 = [v3 version];

  if (v4 == 8) {
    return 1;
  }
  double v6 = [(PUReviewInternalSaveNode *)self imageDataNode];
  BOOL v7 = [v6 version] == 0;

  return 2 * v7;
}

- (double)_baseDuration
{
  v2 = [(PUReviewInternalSaveNode *)self imageDataNode];
  v3 = [v2 asset];

  if ([v3 isLivePhoto])
  {
    if (v3) {
      [v3 photoIrisVideoDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    goto LABEL_8;
  }
  double v4 = 0.0;
  if ([v3 mediaType] == 2)
  {
    [v3 duration];
LABEL_8:
    double v4 = Seconds;
  }

  return v4;
}

- (int64_t)_baseExifOrientation
{
  v2 = [(PUReviewInternalSaveNode *)self imageDataNode];
  int64_t v3 = [v2 imageExifOrientation];
  if ([v2 version] == 1)
  {
    double v4 = [v2 asset];
    int64_t v3 = (int)[v4 originalEXIFOrientation];
  }
  return v3;
}

- (PUReviewInternalSaveNode)initWithDirectory:(id)a3 imageDataNode:(id)a4 imageRenderNode:(id)a5 videoURLNode:(id)a6 videoRenderNode:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id obj = a7;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = v17;
  if (v13) {
    objc_msgSend(v17, "addObject:", v13, obj, v24);
  }
  if (v14) {
    [v18 addObject:v14];
  }
  if (v15) {
    [v18 addObject:v15];
  }
  if (v16) {
    [v18 addObject:v16];
  }
  v25.receiver = self;
  v25.super_class = (Class)PUReviewInternalSaveNode;
  uint64_t v19 = -[PXRunNode initWithDependencies:](&v25, sel_initWithDependencies_, v18, obj);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_directory, a3);
    objc_storeStrong((id *)&v20->_imageDataNode, a4);
    objc_storeStrong((id *)&v20->_imageRenderNode, a5);
    objc_storeStrong((id *)&v20->_videoURLNode, a6);
    objc_storeStrong((id *)&v20->_videoRenderNode, obja);
  }

  return v20;
}

@end