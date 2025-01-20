@interface PLImageLoadingUtilities
+ (BOOL)canAccessImageForAsset:(id)a3;
+ (id)newSynchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 outImageProperties:(const __CFDictionary *)a6 outDeliveredPlaceholder:(BOOL *)a7;
+ (id)synchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 outImageProperties:(const __CFDictionary *)a10 outImageDataInfo:(id *)a11 outCPLDownloadContext:(id *)a12;
+ (void)_assetsdImageForAsset:(id)a3 withFormat:(id)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 sync:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11;
+ (void)_imageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11 sync:(BOOL)a12;
@end

@implementation PLImageLoadingUtilities

+ (BOOL)canAccessImageForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_msgSend(v3, "pl_photoLibrary");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__PLImageLoadingUtilities_canAccessImageForAsset___block_invoke;
    v7[3] = &unk_1E5875E68;
    v9 = &v10;
    id v8 = v3;
    [v4 performBlockAndWait:v7];

    char v5 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    char v5 = [v3 complete];
    *((unsigned char *)v11 + 24) = v5;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

+ (id)newSynchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 outImageProperties:(const __CFDictionary *)a6 outDeliveredPlaceholder:(BOOL *)a7
{
  id v12 = 0;
  id v8 = objc_msgSend(a1, "synchronousImageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:networkAccessForced:trackCPLDownload:outImageProperties:outImageDataInfo:outCPLDownloadContext:", a3, a4, a5, 0, 0, 0, 0.0, 0.0, a6, &v12, 0);
  id v9 = v12;
  uint64_t v10 = v9;
  if (a7) {
    *a7 = [v9 deliveredPlaceholder];
  }

  return v8;
}

+ (id)synchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 outImageProperties:(const __CFDictionary *)a10 outImageDataInfo:(id *)a11 outCPLDownloadContext:(id *)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v17 = a5;
  uint64_t v18 = a4;
  id v20 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__25784;
  v45 = __Block_byref_object_dispose__25785;
  id v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__25784;
  v35 = __Block_byref_object_dispose__25785;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__25784;
  v29 = __Block_byref_object_dispose__25785;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __219__PLImageLoadingUtilities_synchronousImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_networkAccessForced_trackCPLDownload_outImageProperties_outImageDataInfo_outCPLDownloadContext___block_invoke;
  v24[3] = &unk_1E5867950;
  v24[4] = &v41;
  v24[5] = &v37;
  v24[6] = &v31;
  v24[7] = &v25;
  LOBYTE(v23) = 1;
  objc_msgSend(a1, "_imageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:networkAccessForced:trackCPLDownload:isCanceledHandler:completion:sync:", v20, v18, v17, v14, v13, v12, width, height, 0, v24, v23);
  if (a10) {
    *a10 = (const __CFDictionary *)v38[3];
  }
  if (a11) {
    *a11 = (id) v32[5];
  }
  if (a12) {
    *a12 = (id) v26[5];
  }
  id v21 = (id)v42[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v21;
}

void __219__PLImageLoadingUtilities_synchronousImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_networkAccessForced_trackCPLDownload_outImageProperties_outImageDataInfo_outCPLDownloadContext___block_invoke(void *a1, void *a2, const void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  if (a3)
  {
    CFTypeRef v12 = CFRetain(a3);
    CFTypeRef v13 = CFAutorelease(v12);
  }
  else
  {
    CFTypeRef v13 = 0;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v13;
  if (v10) {
    BOOL v14 = (void *)CFAutorelease(v10);
  }
  else {
    BOOL v14 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v14);
  if (v11) {
    v15 = (void *)CFAutorelease(v11);
  }
  else {
    v15 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v15);
}

+ (void)_imageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11 sync:(BOOL)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v17 = a5;
  uint64_t v18 = a4;
  id v20 = a3;
  id v21 = a10;
  v22 = (void (**)(id, void *, CFTypeRef, id, void))a11;
  if ([a1 canAccessImageForAsset:v20])
  {
    id v50 = v21;
    v51 = [MEMORY[0x1E4F8B938] formatWithID:v18];
    int v23 = [v51 isThumbnail];
    int v24 = PLIsAssetsd();
    if ((v24 & 1) == 0 && (v14 && v13 || v23 != 1))
    {
      id v21 = v50;
      objc_msgSend(a1, "_assetsdImageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:trackCPLDownload:sync:isCanceledHandler:completion:", v20, v51, v17, v14, v12, a12, width, height, v50, v22);
LABEL_54:

      goto LABEL_55;
    }
    CFTypeRef cf = 0;
    uint64_t v25 = (void *)MEMORY[0x19F38D3B0]();
    if (v18 == 3039)
    {
      int IsIPad = PLPhysicalDeviceIsIPad();
      char v27 = [v20 isVideo];
      uint64_t v28 = v23 ^ 1u;
      if (((v23 ^ 1) & 1) == 0 && (v27 & 1) == 0)
      {
        if (((IsIPad | v24 ^ 1) & 1) == 0
          && [v20 isJPEG]
          && ([v20 isVideo] & 1) == 0)
        {
          uint64_t v29 = [v20 pathForOriginalFile];
LABEL_19:
          uint64_t v33 = (void *)v29;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    else
    {
      if (v23) {
        goto LABEL_26;
      }
      if (v18 == 9997)
      {
        uint64_t v29 = [v20 pathForPenultimateFullsizeRenderImageFile];
        goto LABEL_19;
      }
      uint64_t v28 = 1;
    }
    id v52 = 0;
    uint64_t v53 = 0;
    id v34 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:v20 format:v51 allowMetadataSnapshot:0 forceLarge:v28 outFilePath:&v52 outImageType:&v53];
    id v35 = v52;
    uint64_t v33 = v35;
    if ((v23 & 1) != 0 || v53 != 9 && v53 != 7)
    {
LABEL_27:
      if ([v33 length])
      {
        id v36 = (void *)PLCreateImageFromFileWithFormat(v33, 0, 0, v18, 0, &cf, 0);
        if (v36) {
          char v37 = v23;
        }
        else {
          char v37 = 1;
        }
        if ((v37 & 1) == 0)
        {
          v38 = [v20 pathForOriginalFile];
          id v21 = v50;
          if ([v33 isEqualToString:v38])
          {
            char v39 = [v20 isPrimaryImageFormat];

            if (v39) {
              goto LABEL_41;
            }
            [v20 orientation];
            uint64_t v40 = PLImageOrientationFromExifOrientation();
            if (v40 == MEMORY[0x19F38B490](v36)) {
              goto LABEL_41;
            }
            uint64_t v41 = (const void *)DCIM_CGImageRefFromPLImage();
            if (v41 || (uint64_t v41 = (const void *)MEMORY[0x19F38B400](v36)) != 0)
            {
              CFTypeID v42 = CFGetTypeID(v41);
              if (v42 == CGImageGetTypeID())
              {
                uint64_t v43 = DCIM_newPLImageWithCGImage();
                id v21 = v50;
LABEL_59:

                id v36 = (void *)v43;
                goto LABEL_41;
              }
              id v21 = v50;
            }
            uint64_t v43 = DCIM_newPLImageWithIOSurface();
            goto LABEL_59;
          }

LABEL_41:
          if (cf) {
            CFRetain(cf);
          }

          id v47 = 0;
          if (v17 && !v36)
          {
            if ([v20 hasAllThumbs])
            {
              id v36 = 0;
              id v47 = 0;
            }
            else
            {
              id v47 = objc_alloc_init(MEMORY[0x1E4F8B930]);
              [v47 setDeliveredPlaceholder:1];
              v48 = +[PLPlaceholderThumbnailManager sharedManager];
              [v20 imageSize];
              id v36 = objc_msgSend(v48, "newPlaceholderImageForFormat:photoImageSize:", v18);
            }
          }
          if (v36) {
            CFTypeRef v49 = cf;
          }
          else {
            CFTypeRef v49 = 0;
          }
          v22[2](v22, v36, v49, v47, 0);
          if (cf) {
            CFRelease(cf);
          }

          goto LABEL_54;
        }
      }
      else
      {
        v44 = objc_msgSend(v20, "pl_photoLibrary");
        v45 = [v44 thumbnailManager];
        id v46 = (CGImage *)[v45 newImageForAsset:v20 format:v51];

        id v36 = (void *)DCIM_newPLImageWithCGImage();
        CGImageRelease(v46);
      }
      id v21 = v50;
      goto LABEL_41;
    }

LABEL_26:
    uint64_t v33 = 0;
    goto LABEL_27;
  }
  if (v17)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F8B930]);
    [v30 setDeliveredPlaceholder:1];
    uint64_t v31 = +[PLPlaceholderThumbnailManager sharedManager];
    [v20 imageSize];
    v32 = objc_msgSend(v31, "newPlaceholderImageForFormat:photoImageSize:", v18);
  }
  else
  {
    id v30 = 0;
    v32 = 0;
  }
  v22[2](v22, v32, 0, v30, 0);

LABEL_55:
}

+ (void)_assetsdImageForAsset:(id)a3 withFormat:(id)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 sync:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11
{
  BOOL v11 = a9;
  BOOL v40 = a7;
  BOOL v41 = a8;
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  BOOL v14 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  id v19 = a11;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3010000000;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  v78 = &unk_19BBAE189;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__25784;
  v73 = __Block_byref_object_dispose__25785;
  id v74 = 0;
  id v20 = objc_msgSend(v16, "pl_photoLibrary");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke;
    v65[3] = &unk_1E5875A90;
    v67 = &v69;
    id v66 = v16;
    v68 = &v75;
    [v20 performBlockAndWait:v65 completionHandler:0];
  }
  else
  {
    uint64_t v21 = [v16 objectID];
    v22 = (void *)v70[5];
    v70[5] = v21;

    [v16 imageSize];
    int v23 = v76;
    v76[4] = v24;
    v23[5] = v25;
  }
  uint64_t v26 = [v17 formatID];
  id v42 = (id)v70[5];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_2;
  v54[3] = &unk_1E5867928;
  id v27 = v18;
  id v58 = v27;
  id v28 = v19;
  id v59 = v28;
  id v29 = v20;
  id v55 = v29;
  id v30 = v16;
  id v56 = v30;
  __int16 v63 = v26;
  CGFloat v61 = width;
  CGFloat v62 = height;
  BOOL v64 = v14;
  id v31 = v17;
  id v57 = v31;
  v60 = &v75;
  v32 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v54);
  if (v11)
  {
    uint64_t v33 = +[PLAssetsSaver sharedAssetsSaver];
    id v52 = 0;
    id v53 = 0;
    id v34 = [v33 requestSynchronousImageForAssetOID:v42 withFormat:v26 allowPlaceholder:v14 wantURLOnly:0 networkAccessAllowed:v40 trackCPLDownload:v41 outImageDataInfo:&v53 outCPLDownloadContext:&v52];
    id v35 = v53;
    id v36 = v52;

    ((void (**)(void, void *, id, id))v32)[2](v32, v34, v35, v36);
  }
  else
  {
    uint64_t v46 = 0;
    id v47 = &v46;
    uint64_t v48 = 0x3032000000;
    CFTypeRef v49 = __Block_byref_object_copy__25784;
    id v50 = __Block_byref_object_dispose__25785;
    id v51 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v37 = objc_msgSend(v30, "pl_photoLibrary");
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_31;
      v43[3] = &unk_1E5875E68;
      v45 = &v46;
      id v44 = v30;
      [v37 performBlockAndWait:v43 completionHandler:0];
    }
    else
    {
      uint64_t v38 = [v30 objectID];
      char v37 = (void *)v47[5];
      v47[5] = v38;
    }

    char v39 = +[PLAssetsSaver sharedAssetsSaver];
    [v39 requestAsynchronousImageForAssetOID:v47[5] withFormat:v26 allowPlaceholder:v14 wantURLOnly:0 networkAccessAllowed:v40 trackCPLDownload:v41 completionBlock:v32];

    _Block_object_dispose(&v46, 8);
  }

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
}

uint64_t __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) imageSize];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  return result;
}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  unint64_t v9 = a4;
  uint64_t v10 = *(void *)(a1 + 56);
  if (!v10 || !(*(unsigned int (**)(void))(v10 + 16))())
  {
    BOOL v11 = [v8 UTI];
    if (!v11)
    {
      BOOL v12 = [v8 URL];

      if (v12)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_3;
        v26[3] = &unk_1E586EBF8;
        BOOL v13 = *(void **)(a1 + 32);
        id v27 = *(id *)(a1 + 40);
        __int16 v28 = *(_WORD *)(a1 + 96);
        [v13 performBlock:v26];
      }
    }
    if (v7)
    {
      if (*(double *)(a1 + 80) == 0.0 && *(double *)(a1 + 88) == 0.0)
      {
        BOOL v14 = 0;
      }
      else
      {
        BOOL v14 = [MEMORY[0x1E4F1CA60] dictionary];
        v15 = DCIM_NSValueFromCGSize();
        [v14 setObject:v15 forKey:@"kPLOptimalSourcePixelSizeKey"];
      }
      uint64_t v16 = PLCreateImageFromDataWithFormat(v7, 0, (void *)*(unsigned __int16 *)(a1 + 96), v11, 1, 0, v14);
      if (v9 | v16)
      {
        id v17 = (void *)v16;

        if (v17)
        {
LABEL_22:
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        v22 = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_27;
        int v23 = &unk_1E586EBF8;
        id v18 = *(void **)(a1 + 32);
        id v24 = *(id *)(a1 + 40);
        __int16 v25 = *(_WORD *)(a1 + 96);
        [v18 performBlock:&v20];
      }
    }
    if (*(unsigned char *)(a1 + 98) && [*(id *)(a1 + 48) isThumbnail])
    {
      if (v8) {
        [v8 setDeliveredPlaceholder:1];
      }
      id v19 = +[PLPlaceholderThumbnailManager sharedManager];
      id v17 = objc_msgSend(v19, "newPlaceholderImageForFormat:photoImageSize:", *(unsigned __int16 *)(a1 + 96), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    }
    else
    {
      id v17 = 0;
    }
    goto LABEL_22;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_23:
}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int16 *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "assetsd returned an image URL but no UTI for asset: %@ with format %u", (uint8_t *)&v5, 0x12u);
  }
}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_27(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int16 *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Unable to create image from data for asset %@ with format %u", (uint8_t *)&v5, 0x12u);
  }
}

uint64_t __50__PLImageLoadingUtilities_canAccessImageForAsset___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) complete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end