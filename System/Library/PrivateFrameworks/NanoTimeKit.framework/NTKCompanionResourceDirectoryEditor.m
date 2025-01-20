@interface NTKCompanionResourceDirectoryEditor
+ (BOOL)_transcodeIrisVideoOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6 previewOnly:(BOOL)a7;
+ (BOOL)_transcodeStillImageOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6;
+ (CGSize)_watchPhotoImageSize;
+ (CGSize)_watchPhotoVideoSize;
+ (id)_createResourceDirectoryWithAsset:(id)a3 assetCollection:(id)a4 forDevice:(id)a5 previewOnly:(BOOL)a6;
+ (id)_cropAndScaleUIImage:(id)a3 cropRect:(CGRect)a4 outputSize:(CGSize)a5;
+ (id)_linkPhoto:(id)a3 to:(id)a4 previewOnly:(BOOL)a5;
+ (id)_scaleImage:(id)a3 toLongestEdgeInPixels:(double)a4;
+ (id)_subsampledImageWithData:(id)a3 orientation:(int64_t)a4 subsampleFactor:(unint64_t)a5;
+ (id)_transcodeAsset:(id)a3 withCrop:(CGRect)a4 into:(id)a5 previewOnly:(BOOL)a6;
+ (id)_videoAssetOf:(id)a3;
+ (id)_writeAsset:(id)a3 image:(id)a4 withImageCrop:(CGRect)a5 to:(id)a6;
+ (unint64_t)_subsampleFactorForScale:(double)a3;
+ (void)_imageDataForAsset:(id)a3 completion:(id)a4;
+ (void)_imageForAsset:(id)a3 forSize:(CGSize)a4 completion:(id)a5;
- (CLKDevice)device;
- (NSString)galleryPreviewResourceDirectory;
- (NSString)resourceDirectory;
- (NTKCompanionResourceDirectoryEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (int64_t)state;
- (void)_deleteResourceDirectoryHardLinkIfNecessary;
- (void)dealloc;
- (void)finalizeWithCompletion:(id)a3;
- (void)finalizeWithProgress:(id)a3 completion:(id)a4;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)setGalleryPreviewResourceDirectory:(id)a3;
- (void)setResourceDirectory:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation NTKCompanionResourceDirectoryEditor

- (NTKCompanionResourceDirectoryEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKCompanionResourceDirectoryEditor;
  v8 = [(NTKCompanionResourceDirectoryEditor *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a4);
    if (v6)
    {
      uint64_t v10 = NTKNewUniqueTeporaryResourceDirectory();
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v11 linkItemAtPath:v6 toPath:v10 error:0];

      resourceDirectory = v9->_resourceDirectory;
      v9->_resourceDirectory = (NSString *)v10;

      v9->_resourceDirectoryIsHardLink = 1;
    }
    galleryPreviewResourceDirectory = v9->_galleryPreviewResourceDirectory;
    v9->_galleryPreviewResourceDirectory = 0;

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(NTKCompanionResourceDirectoryEditor *)self _deleteResourceDirectoryHardLinkIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionResourceDirectoryEditor;
  [(NTKCompanionResourceDirectoryEditor *)&v3 dealloc];
}

- (void)setResourceDirectory:(id)a3
{
  id v5 = a3;
  if (self->_resourceDirectoryIsHardLink || (NTKEqualStrings(v5, self->_resourceDirectory) & 1) == 0)
  {
    [(NTKCompanionResourceDirectoryEditor *)self _deleteResourceDirectoryHardLinkIfNecessary];
    objc_storeStrong((id *)&self->_resourceDirectory, a3);
  }
}

- (void)_deleteResourceDirectoryHardLinkIfNecessary
{
  if (self->_resourceDirectoryIsHardLink)
  {
    objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtPath:self->_resourceDirectory error:0];

    resourceDirectory = self->_resourceDirectory;
    self->_resourceDirectory = 0;

    self->_resourceDirectoryIsHardLink = 0;
  }
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4 = a3;
  self->_state = 3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__NTKCompanionResourceDirectoryEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  v6[3] = &unk_1E62C2290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __93__NTKCompanionResourceDirectoryEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4 = a3;
  self->_state = 4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NTKCompanionResourceDirectoryEditor_finalizeWithCompletion___block_invoke;
  v6[3] = &unk_1E62C2290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __62__NTKCompanionResourceDirectoryEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)finalizeWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NTKCompanionResourceDirectoryEditor_finalizeWithProgress_completion___block_invoke;
  block[3] = &unk_1E62C66C8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__NTKCompanionResourceDirectoryEditor_finalizeWithProgress_completion___block_invoke(void *a1)
{
  *(void *)(a1[4] + 32) = 0;
  (*(void (**)(double))(a1[5] + 16))(0.0);
  uint64_t v2 = *(uint64_t (**)(void))(a1[6] + 16);

  return v2();
}

+ (id)_linkPhoto:(id)a3 to:(id)a4 previewOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 imageURL];
    id v11 = (void *)v10;
    id v12 = "NO";
    if (v5) {
      id v12 = "YES";
    }
    int v19 = 138412546;
    uint64_t v20 = v10;
    __int16 v21 = 2080;
    v22 = v12;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "_linkPhoto: linking existing photo %@ into the new resource directory; preview == %s",
      (uint8_t *)&v19,
      0x16u);
  }
  v13 = (void *)[v7 copy];
  v14 = [v7 imageURL];
  objc_super v15 = NTKPhotosLinkURL(v14, v8);

  if (!v15)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  [v13 setImageURL:v15];
  if (v5)
  {
    [v13 setIsIris:0];
    [v13 setIrisVideoURL:0];
    [v13 setIrisDuration:0.0];
    [v13 setIrisStillDisplayTime:0.0];
  }
  else if ([v7 isIris])
  {
    v17 = [v7 irisVideoURL];
    NTKPhotosLinkURL(v17, v8);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16) {
      goto LABEL_13;
    }
    [v13 setIrisVideoURL:v16];
  }
  id v16 = v13;
LABEL_13:

  return v16;
}

+ (id)_transcodeAsset:(id)a3 withCrop:(CGRect)a4 into:(id)a5 previewOnly:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  objc_super v15 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v13 localIdentifier];
    v17 = (void *)v16;
    v18 = "NO";
    if (v6) {
      v18 = "YES";
    }
    int v28 = 138412546;
    uint64_t v29 = v16;
    __int16 v30 = 2080;
    v31 = v18;
    _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "_transcodeAsset: transcoding new asset %@ into the new resource directory; preview == %s",
      (uint8_t *)&v28,
      0x16u);
  }
  int v19 = objc_opt_new();
  uint64_t v20 = [v13 localIdentifier];
  [v19 setLocalIdentifier:v20];

  __int16 v21 = [v13 modificationDate];
  [v19 setModificationDate:v21];

  objc_msgSend(v19, "setOriginalCrop:", x, y, width, height);
  double v22 = x / (double)(unint64_t)[v13 pixelWidth];
  double v23 = y / (double)(unint64_t)[v13 pixelHeight];
  double v24 = width / (double)(unint64_t)[v13 pixelWidth];
  double v25 = height / (double)(unint64_t)[v13 pixelHeight];
  if (objc_msgSend(a1, "_transcodeStillImageOf:forPhoto:withCrop:into:", v13, v19, v14, v22, v23, v24, v25)&& objc_msgSend(a1, "_transcodeIrisVideoOf:forPhoto:withCrop:into:previewOnly:", v13, v19, v14, v6, v22, v23, v24,
                       v25))
  {
    id v26 = v19;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

+ (BOOL)_transcodeStillImageOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__36;
  v53 = __Block_byref_object_dispose__36;
  id v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke;
  v41[3] = &unk_1E62C66F0;
  v43 = &v49;
  v44 = &v45;
  v17 = v16;
  v42 = v17;
  [a1 _imageDataForAsset:v13 completion:v41];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (v50[5])
  {
    unint64_t v18 = [v13 pixelWidth];
    unint64_t v19 = [v13 pixelHeight];
    CGAffineTransformMakeScale(&v40, (double)(unint64_t)[v13 pixelWidth], (double)(unint64_t)objc_msgSend(v13, "pixelHeight"));
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRect v60 = CGRectApplyAffineTransform(v59, &v40);
    double v20 = v60.origin.x;
    double v21 = v60.origin.y;
    double v22 = v60.size.width;
    double v23 = v60.size.height;
    [a1 _watchPhotoImageSize];
    double v25 = v24;
    double v27 = v26;
    int v28 = [NTKCompanionImageDataScaler alloc];
    uint64_t v29 = -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:outputSize:](v28, "initWithSize:crop:data:orientation:outputSize:", v50[5], v46[3], (double)v18, (double)v19, v20, v21, v22, v23, v25, v27);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2;
    v33[3] = &unk_1E62C6740;
    __int16 v30 = v17;
    v34 = v30;
    id v35 = v14;
    double v38 = v25;
    double v39 = v27;
    id v36 = v15;
    v37 = &v55;
    [(NTKCompanionImageDataScaler *)v29 cropAndScaleWithCompletion:v33];
    dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
    int v31 = *((unsigned __int8 *)v56 + 24);
  }
  else
  {
    int v31 = *((unsigned __int8 *)v56 + 24);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v31 != 0;
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1C1875BE0]();
    BOOL v5 = [*(id *)(a1 + 40) irisVideoURL];

    id v6 = NSString;
    if (v5)
    {
      id v7 = [*(id *)(a1 + 40) irisVideoURL];
      id v8 = objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
      id v9 = [v8 lastPathComponent];

      id v6 = NSString;
      uint64_t v10 = [v9 stringByDeletingPathExtension];
      id v11 = (void *)v10;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v10 = [v11 UUIDString];
      id v9 = (void *)v10;
    }
    id v12 = [v6 stringWithFormat:@"%@.jpg", v10];

    id v13 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v12];
    id v30 = 0;
    [v3 writeToFile:v13 options:0 error:&v30];
    id v14 = v30;
    if (v14)
    {
      id v15 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2_cold_1((uint64_t)v12, (uint64_t)v14, v15);
      }
    }
    else
    {
      double v23 = v12;
      double v24 = v4;
      dispatch_semaphore_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
      [*(id *)(a1 + 40) setImageURL:v16];

      objc_msgSend(*(id *)(a1 + 40), "setCrop:", 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72));
      id v25 = v3;
      v17 = [MEMORY[0x1E4FB1818] imageWithData:v3 scale:1.0];
      uint64_t v18 = 0;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      char v20 = 1;
      do
      {
        char v21 = v20;
        double v22 = (void *)MEMORY[0x1E4F19A30];
        v26[0] = v19;
        v26[1] = 3221225472;
        v26[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_3;
        v26[3] = &unk_1E62C6718;
        id v27 = *(id *)(a1 + 40);
        uint64_t v29 = v18;
        id v15 = v17;
        int v28 = v15;
        [v22 enumerateSizeClasses:v26];

        char v20 = 0;
        uint64_t v18 = 1;
      }
      while ((v21 & 1) != 0);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v4 = v24;
      id v3 = v25;
      id v12 = v23;
      id v14 = 0;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) analysisForAlignment:*(void *)(a1 + 48) deviceSizeClass:a2];

  if (!v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = +[NTKPhotoAnalysis analysisWithImage:*(void *)(a1 + 40) alignment:*(void *)(a1 + 48) deviceSizeClass:a2];
    [v5 setAnalysis:v6 alignment:*(void *)(a1 + 48) deviceSizeClass:a2];
  }
}

+ (id)_createResourceDirectoryWithAsset:(id)a3 assetCollection:(id)a4 forDevice:(id)a5 previewOnly:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    id v13 = 0;
    goto LABEL_15;
  }
  id v14 = NTKPhotosCreateResourceDirectory();
  if (v14)
  {
    if (v10)
    {
      NTKPhotosDefaultCropForAsset((void *)v10, v12);
      objc_msgSend(a1, "_transcodeAsset:withCrop:into:previewOnly:", v10, v14, v6);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v15 removeItemAtPath:v14 error:0];
LABEL_13:

        goto LABEL_14;
      }
      id v15 = objc_opt_new();
      dispatch_semaphore_t v16 = [v13 encodeAsDictionary];
      [v15 addObject:v16];
    }
    else
    {
      id v15 = objc_opt_new();
    }
    if (NTKPhotosWriteImageListForAssetCollection(v15, (void *)v11, v14))
    {
      id v13 = v14;
    }
    else
    {
      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v17 removeItemAtPath:v14 error:0];

      id v13 = 0;
    }
    goto LABEL_13;
  }
  id v13 = 0;
LABEL_14:

LABEL_15:

  return v13;
}

+ (BOOL)_transcodeIrisVideoOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6 previewOnly:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (!NTKPhotosIsPHAssetIris(v15) || v7)
  {
    [v16 setIsIris:0];
    [v16 setIrisVideoURL:0];
    [v16 setIrisDuration:0.0];
    [v16 setIrisStillDisplayTime:0.0];
    BOOL v26 = 1;
  }
  else
  {
    context = (void *)MEMORY[0x1C1875BE0]();
    [v16 setIsIris:1];
    uint64_t v18 = [v16 imageURL];

    if (v18)
    {
      uint64_t v19 = NSString;
      id v20 = [v16 imageURL];
      char v21 = objc_msgSend(v19, "stringWithUTF8String:", objc_msgSend(v20, "fileSystemRepresentation"));
      double v22 = [v21 lastPathComponent];

      double v23 = NSString;
      double v24 = [v22 stringByDeletingPathExtension];
      id v25 = [v23 stringWithFormat:@"%@.mov", v24];
    }
    else
    {
      double v24 = [MEMORY[0x1E4F29128] UUID];
      id v25 = [v24 UUIDString];
    }

    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    char v58 = __Block_byref_object_copy__36;
    CGRect v59 = __Block_byref_object_dispose__36;
    id v60 = 0;
    int v28 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v29 = [v17 stringByAppendingPathComponent:v25];
    id v30 = [v28 fileURLWithPath:v29];

    int v31 = [NTKCompanionIrisVideoExportSession alloc];
    uint64_t v32 = [a1 _videoAssetOf:v15];
    [a1 _watchPhotoVideoSize];
    id v35 = -[NTKCompanionIrisVideoExportSession initWithVideo:crop:outputSize:bitrate:outputURL:](v31, "initWithVideo:crop:outputSize:bitrate:outputURL:", v32, 300000, v30, x, y, width, height, v33, v34);

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke;
    v49[3] = &unk_1E62C6768;
    id v36 = v30;
    id v50 = v36;
    v37 = v35;
    uint64_t v51 = v37;
    id v54 = &v55;
    id v38 = v15;
    id v52 = v38;
    double v39 = v27;
    v53 = v39;
    [(NTKCompanionIrisVideoExportSession *)v37 exportAsynchronouslyWithCompletion:v49];
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v40 = v56[5];
    BOOL v26 = v40 == 0;
    if (!v40)
    {
      [v16 setIrisVideoURL:v36];
      v41 = [v38 photoIrisProperties];
      v42 = v41;
      if (v41) {
        [v41 photoIrisVideoDuration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      [v16 setIrisDuration:CMTimeGetSeconds(&time)];

      v43 = [v38 photoIrisProperties];
      v44 = v43;
      if (v43) {
        [v43 photoIrisStillDisplayTime];
      }
      else {
        memset(&v47, 0, sizeof(v47));
      }
      [v16 setIrisStillDisplayTime:CMTimeGetSeconds(&v47)];
    }
    _Block_object_dispose(&v55, 8);
  }

  return v26;
}

intptr_t __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "transcoded video to %@", (uint8_t *)&v9, 0xCu);
  }

  if ([*(id *)(a1 + 40) status] == 4)
  {
    uint64_t v4 = [*(id *)(a1 + 40) error];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke_cold_1(a1, a1 + 64, v7);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

+ (id)_writeAsset:(id)a3 image:(id)a4 withImageCrop:(CGRect)a5 to:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a3;
  id v13 = (UIImage *)a4;
  id v14 = a6;
  id v15 = NSString;
  id v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [v16 UUIDString];
  uint64_t v18 = [v15 stringWithFormat:@"%@.jpg", v17];

  uint64_t v19 = UIImageJPEGRepresentation(v13, 0.85);
  if (v19)
  {
    id v20 = [v14 stringByAppendingPathComponent:v18];
    v52[0] = 0;
    [v19 writeToFile:v20 options:0 error:v52];
    char v21 = v52[0];
    if (v21)
    {
      double v22 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[NTKCompanionResourceDirectoryEditor _writeAsset:image:withImageCrop:to:]((uint64_t)v18, v22);
      }

      id v23 = 0;
    }
    else
    {
      CMTime v47 = v20;
      int v31 = objc_opt_new();
      uint64_t v45 = v19;
      v46 = v18;
      if (v12)
      {
        uint64_t v32 = [v12 localIdentifier];
        [v31 setLocalIdentifier:v32];

        [v12 modificationDate];
      }
      else
      {
        double v33 = NSString;
        double v34 = [MEMORY[0x1E4F29128] UUID];
        id v35 = [v34 UUIDString];
        id v36 = [v33 stringWithFormat:@"Temp-%@", v35];
        [v31 setLocalIdentifier:v36];

        [MEMORY[0x1E4F1C9C8] distantPast];
      v37 = };
      [v31 setModificationDate:v37];

      id v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v47];
      [v31 setImageURL:v38];

      objc_msgSend(v31, "setOriginalCrop:", x, y, width, height);
      objc_msgSend(v31, "setCrop:", x, y, width, height);
      uint64_t v39 = 0;
      uint64_t v40 = MEMORY[0x1E4F143A8];
      char v41 = 1;
      do
      {
        char v42 = v41;
        v43 = (void *)MEMORY[0x1E4F19A30];
        v48[0] = v40;
        v48[1] = 3221225472;
        v48[2] = __74__NTKCompanionResourceDirectoryEditor__writeAsset_image_withImageCrop_to___block_invoke;
        v48[3] = &unk_1E62C6718;
        id v23 = v31;
        id v49 = v23;
        id v50 = v13;
        uint64_t v51 = v39;
        [v43 enumerateSizeClasses:v48];

        char v41 = 0;
        uint64_t v39 = 1;
      }
      while ((v42 & 1) != 0);
      uint64_t v19 = v45;
      uint64_t v18 = v46;
      char v21 = 0;
      id v20 = v47;
    }
  }
  else
  {
    char v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[NTKCompanionResourceDirectoryEditor _writeAsset:image:withImageCrop:to:](v21, v24, v25, v26, v27, v28, v29, v30);
    }
    id v23 = 0;
  }

  return v23;
}

void __74__NTKCompanionResourceDirectoryEditor__writeAsset_image_withImageCrop_to___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[4];
  id v5 = +[NTKPhotoAnalysis analysisWithImage:a1[5] alignment:a1[6] deviceSizeClass:a2];
  [v4 setAnalysis:v5 alignment:a1[6] deviceSizeClass:a2];
}

+ (id)_scaleImage:(id)a3 toLongestEdgeInPixels:(double)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    [v5 size];
    double v8 = v7;
    double v10 = v9;
    [v6 scale];
    CGFloat v12 = v11;
    [v6 scale];
    CGAffineTransformMakeScale(&v24, v12, v13);
    double v14 = v10 * v24.c + v24.a * v8;
    double v15 = v10 * v24.d + v24.b * v8;
    double v16 = a4 / v14;
    if (a4 / v14 >= a4 / v15) {
      double v16 = a4 / v15;
    }
    if (v16 >= 1.0)
    {
      id v21 = v6;
    }
    else
    {
      CGAffineTransformMakeScale(&v23, v16, v16);
      CGFloat v17 = v15 * v23.c + v23.a * v14;
      CGFloat v18 = v15 * v23.d + v23.b * v14;
      double v19 = *MEMORY[0x1E4F1DAD8];
      double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v26.double width = v17;
      v26.double height = v18;
      UIGraphicsBeginImageContextWithOptions(v26, 0, 1.0);
      objc_msgSend(v6, "drawInRect:", v19, v20, v17, v18);
      UIGraphicsGetImageFromCurrentImageContext();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (id)_videoAssetOf:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v4 setVersion:0];
  [v4 setDeliveryMode:1];
  [v4 setNetworkAccessAllowed:1];
  [v4 setVideoComplementAllowed:1];
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__36;
  CGAffineTransform v23 = __Block_byref_object_dispose__36;
  id v24 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  BOOL v6 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __53__NTKCompanionResourceDirectoryEditor__videoAssetOf___block_invoke;
  double v16 = &unk_1E62C6790;
  CGFloat v18 = &v19;
  double v7 = v5;
  CGFloat v17 = v7;
  [v6 requestURLForVideo:v3 options:v4 resultHandler:&v13];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  double v8 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = objc_msgSend(v3, "localIdentifier", v13, v14, v15, v16);
    double v10 = [(id)v20[5] URL];
    *(_DWORD *)buf = 138412546;
    CGSize v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "_videoAssetOf: %@ ==> %@", buf, 0x16u);
  }
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v11;
}

intptr_t __53__NTKCompanionResourceDirectoryEditor__videoAssetOf___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F166C8] assetWithURL:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  BOOL v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

+ (id)_cropAndScaleUIImage:(id)a3 cropRect:(CGRect)a4 outputSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v50.double width = width;
  v50.double height = height;
  UIGraphicsBeginImageContextWithOptions(v50, 0, 1.0);
  if (width / v8 >= height / v7) {
    double v12 = width / v8;
  }
  else {
    double v12 = height / v7;
  }
  CGAffineTransformMakeScale(&v33, 1.0 / v12, 1.0 / v12);
  v51.origin.double x = 0.0;
  v51.origin.double y = 0.0;
  v51.size.double width = width;
  v51.size.double height = height;
  CGRect v52 = CGRectApplyAffineTransform(v51, &v33);
  double v29 = v8;
  double v30 = v7;
  double v27 = x;
  double v28 = y;
  double v13 = x + fmax((v8 - v52.size.width) * 0.5, 0.0);
  double v14 = y + fmax((v7 - v52.size.height) * 0.5, 0.0);
  [v11 size];
  double v16 = v15;
  double v18 = v17;
  [v11 scale];
  CGFloat v20 = v19;
  [v11 scale];
  CGAffineTransformMakeScale(&v32, v20, v21);
  CGFloat v22 = v18 * v32.c + v32.a * v16;
  CGFloat v23 = v18 * v32.d + v32.b * v16;
  CGAffineTransformMakeScale(&v31, v12, v12);
  v53.origin.double x = -v13;
  v53.origin.double y = -v14;
  v53.size.double width = v22;
  v53.size.double height = v23;
  CGRect v54 = CGRectApplyAffineTransform(v53, &v31);
  objc_msgSend(v11, "drawInRect:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  id v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (!v24)
  {
    uint64_t v25 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413826;
      id v35 = v11;
      __int16 v36 = 2048;
      double v37 = v27;
      __int16 v38 = 2048;
      double v39 = v28;
      __int16 v40 = 2048;
      double v41 = v29;
      __int16 v42 = 2048;
      double v43 = v30;
      __int16 v44 = 2048;
      double v45 = width;
      __int16 v46 = 2048;
      double v47 = height;
      _os_log_error_impl(&dword_1BC5A9000, v25, OS_LOG_TYPE_ERROR, "Cannot crop and scale image %@, crop { %.2f, %.2f, %.2f, %2.f } to size { %.2f, %.2f }", buf, 0x48u);
    }
  }

  return v24;
}

+ (void)_imageDataForAsset:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke;
  v10[3] = &unk_1E62C2290;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localIdentifier];
  id v3 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v3 setVersion:0];
  [v3 setDeliveryMode:1];
  [v3 setNetworkAccessAllowed:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_2;
  v11[3] = &unk_1E62C67B8;
  id v4 = v2;
  id v12 = v4;
  [v3 setProgressHandler:v11];
  id v5 = [MEMORY[0x1E4F390D0] defaultManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_60;
  v8[3] = &unk_1E62C67E0;
  id v9 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v4;
  [v5 requestImageDataAndOrientationForAsset:v6 options:v3 resultHandler:v8];
}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      double v13 = a3 * 100.0;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_ERROR, "Failed to download asset %@, progress: %.0f%%, error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2048;
    double v13 = a3 * 100.0;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Downloading asset %@, progress: %.0f%%", (uint8_t *)&v10, 0x16u);
  }
}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_60(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8 = a2;
  uint64_t v9 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  if (v9)
  {
    int v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_60_cold_1(a1, (uint64_t)v9, v10);
    }

    id v11 = 0;
  }
  else
  {
    NTKCGImagePropertyOrientationToUIImageOrientation(a4);
    id v11 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_imageForAsset:(id)a3 forSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  id v9 = a5;
  int v10 = dispatch_get_global_queue(25, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke;
  v13[3] = &unk_1E62C5198;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localIdentifier];
  id v3 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v3 setVersion:0];
  [v3 setDeliveryMode:1];
  [v3 setNetworkAccessAllowed:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_2;
  v9[3] = &unk_1E62C67B8;
  id v10 = v2;
  id v4 = v2;
  [v3 setProgressHandler:v9];
  id v5 = [MEMORY[0x1E4F390D0] defaultManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_62;
  v7[3] = &unk_1E62C6808;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v6, 1, v3, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      double v13 = a3 * 100.0;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_ERROR, "Failed to download asset %@, progress: %.0f%%, error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2048;
    double v13 = a3 * 100.0;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Downloading asset %@, progress: %.0f%%", (uint8_t *)&v10, 0x16u);
  }
}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (CGSize)_watchPhotoImageSize
{
  double v2 = 384.0;
  double v3 = 480.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (CGSize)_watchPhotoVideoSize
{
  double v2 = 320.0;
  double v3 = 400.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (unint64_t)_subsampleFactorForScale:(double)a3
{
  uint64_t v3 = 2;
  if (a3 > 0.5) {
    uint64_t v3 = 1;
  }
  return v3 << (a3 <= 0.25) << (a3 <= 0.125);
}

+ (id)_subsampledImageWithData:(id)a3 orientation:(int64_t)a4 subsampleFactor:(unint64_t)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v7 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v30 = *MEMORY[0x1E4F2FF58];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a5];
    v31[0] = v9;
    CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];

    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v8, 0, v10);
    if (ImageAtIndex)
    {
      CGImageRef v12 = ImageAtIndex;
      double v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:ImageAtIndex scale:a4 orientation:1.0];
      CFRelease(v12);
    }
    else
    {
      CGFloat v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[NTKCompanionResourceDirectoryEditor _subsampledImageWithData:orientation:subsampleFactor:](v21, v22, v23, v24, v25, v26, v27, v28);
      }

      double v13 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      +[NTKCompanionResourceDirectoryEditor _subsampledImageWithData:orientation:subsampleFactor:](v10, v14, v15, v16, v17, v18, v19, v20);
    }
    double v13 = 0;
  }

  return v13;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)galleryPreviewResourceDirectory
{
  return self->_galleryPreviewResourceDirectory;
}

- (void)setGalleryPreviewResourceDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryPreviewResourceDirectory, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "cannot save transcoded jpeg to %@, error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 48) localIdentifier];
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "failed to transcode iris video for %@, error = %@", (uint8_t *)&v7, 0x16u);
}

+ (void)_writeAsset:(uint64_t)a3 image:(uint64_t)a4 withImageCrop:(uint64_t)a5 to:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_writeAsset:(uint64_t)a1 image:(NSObject *)a2 withImageCrop:to:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "_writeAsset: cannot save transcoded jpeg to %@", (uint8_t *)&v2, 0xCu);
}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_60_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "cannot retrieve data for asset %@, error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)_subsampledImageWithData:(uint64_t)a3 orientation:(uint64_t)a4 subsampleFactor:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_subsampledImageWithData:(uint64_t)a3 orientation:(uint64_t)a4 subsampleFactor:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end