@interface NTKGreenfieldUtilities
+ (BOOL)shouldAutoDismissViewControllerForAddFaceFlow:(id)a3;
+ (BOOL)shouldPresentUnreleasedFeaturesInternalWarningForFace:(id)a3;
+ (BOOL)validateFaceType:(id)a3 faceBundleId:(id)a4;
+ (id)_addGenericDeviceBorderToWatchFaceImage:(id)a3 includesTransparentPadding:(BOOL)a4;
+ (id)_addGreyBorderToWatchFaceImage:(id)a3;
+ (id)_companionAppIdFromWatchAppBundleId:(id)a3;
+ (id)_decodeFaceFromDataPath:(id)a3;
+ (id)_greenfieldWatchFaceJsonForFace:(id)a3;
+ (id)_metadataDictForWatchFace:(id)a3 slotToSampleTemplateMapping:(id)a4 slotToItemIdMapping:(id)a5 slotToBundleIdMapping:(id)a6 watchFaceDataPath:(id)a7;
+ (id)_queue_encodeDraftRecipe:(id)a3;
+ (id)_queue_greenfieldPreviewFromUrl:(id)a3;
+ (id)_queue_snapshotFace:(id)a3 borderType:(unint64_t)a4;
+ (id)addBorder:(unint64_t)a3 toWatchFaceImage:(id)a4;
+ (id)createXPCServiceConnection;
+ (id)encodeQueue;
+ (id)temporaryGreenfieldDirectory;
+ (id)temporaryGreenfieldNoBordersSnapshotPath;
+ (id)unzipWatchFaceFileAtUrl:(id)a3;
+ (void)_updateSystemDeletableAppItemIdForSlotToItemIdMapping:(id)a3 face:(id)a4;
+ (void)decodeWatchFaceFromUrl:(id)a3 completionBlock:(id)a4;
+ (void)encodeRecipeFromDraftRecipe:(id)a3 completionBlock:(id)a4;
+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 borderType:(unint64_t)a4 completionBlock:(id)a5;
+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 completionBlock:(id)a4;
+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4;
+ (void)migrateComplicationsOnFace:(id)a3;
@end

@implementation NTKGreenfieldUtilities

+ (id)temporaryGreenfieldDirectory
{
  if (temporaryGreenfieldDirectory_onceToken != -1) {
    dispatch_once(&temporaryGreenfieldDirectory_onceToken, &__block_literal_global_94);
  }
  v2 = (void *)temporaryGreenfieldDirectory_tempDir;
  return v2;
}

void __54__NTKGreenfieldUtilities_temporaryGreenfieldDirectory__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v0 bundleIdentifier];

  int v1 = [v7 containsString:@"com.apple.NanoTimeKit.GreenfieldDecodingService"];
  v2 = NSTemporaryDirectory();
  v3 = v2;
  if (v1)
  {
    uint64_t v4 = temporaryGreenfieldDirectory_tempDir;
    temporaryGreenfieldDirectory_tempDir = (uint64_t)v2;
    v3 = (void *)v4;
  }
  else
  {
    uint64_t v5 = [v2 stringByAppendingPathComponent:@"com.apple.watchface"];
    v6 = (void *)temporaryGreenfieldDirectory_tempDir;
    temporaryGreenfieldDirectory_tempDir = v5;
  }
}

+ (id)temporaryGreenfieldNoBordersSnapshotPath
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = NSTemporaryDirectory();
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  v6 = [v3 stringByAppendingPathComponent:v5];

  [v2 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
  return v6;
}

+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 completionBlock:(id)a4
{
}

+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 borderType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(id)objc_opt_class() encodeQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke;
  v13[3] = &unk_1E62C5198;
  id v16 = a1;
  unint64_t v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  v3 = [*(id *)(a1 + 32) faceForSharing];
  uint64_t v4 = objc_msgSend(v2, "_queue_snapshotFace:borderType:", v3, *(void *)(a1 + 56));

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke_2;
  v7[3] = &unk_1E62C0AE8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)encodeRecipeFromDraftRecipe:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() encodeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke;
  block[3] = &unk_1E62C51C0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "_queue_encodeDraftRecipe:", *(void *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_2;
  block[3] = &unk_1E62C0AE8;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

+ (id)_queue_encodeDraftRecipe:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 faceForSharing];
  id v6 = [v4 tempPathOverride];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [a1 temporaryGreenfieldDirectory];
  }
  id v9 = v8;

  objc_msgSend(a1, "_queue_snapshotFace:borderType:", v5, 0);
  id v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (!v10
    || (([(UIImage *)v10 size],
         double v14 = *MEMORY[0x1E4F1DB30],
         double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8),
         v15 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v16 = v12 == v13)
      : (BOOL v16 = 0),
        v16))
  {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to generate snapshot without border for face: %@, faceWithoutBorderImage:%@", v5, v11 format];
    v26 = 0;
    goto LABEL_62;
  }
  unint64_t v17 = [a1 _addGreyBorderToWatchFaceImage:v11];
  v18 = v17;
  if (!v17 || (([(UIImage *)v17 size], v20 == v14) ? (BOOL v21 = v19 == v13) : (BOOL v21 = 0), v21))
  {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to generate snapshot image with grey border for face: %@, faceWithGreyBorderImage:%@", v5, v18 format];
    v26 = 0;
    goto LABEL_61;
  }
  v22 = [a1 _addGenericDeviceBorderToWatchFaceImage:v11 includesTransparentPadding:0];
  v23 = v22;
  if (!v22 || ([(UIImage *)v22 size], v25 == v14) && v24 == v13)
  {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to generate snapshot image with device border for face: %@, faceWithDeviceBorderImage:%@", v5, v23 format];
    v26 = 0;
    goto LABEL_60;
  }
  v84 = [a1 _greenfieldWatchFaceJsonForFace:v5];
  [MEMORY[0x1E4F28CB8] defaultManager];
  v27 = id v80 = a1;
  v28 = [MEMORY[0x1E4F29128] UUID];
  v29 = [v28 UUIDString];
  uint64_t v30 = [v9 stringByAppendingPathComponent:v29];

  [v27 removeItemAtPath:v30 error:0];
  id v95 = 0;
  v83 = v27;
  [v27 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v95];
  id v31 = v95;
  if (v31)
  {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to create the directory at path: %@ error: %@", v30, v31 format];
    v32 = (void *)v30;
    v81 = 0;
    v26 = 0;
    goto LABEL_59;
  }
  v76 = v11;
  image = v18;
  v79 = (void *)v30;
  v77 = v23;
  v74 = v9;
  v86 = objc_opt_new();
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v33 = [v4 slotToSampleTemplateMapping];
  v34 = [v33 allKeys];

  uint64_t v35 = [v34 countByEnumeratingWithState:&v91 objects:v98 count:16];
  id v85 = v4;
  if (!v35) {
    goto LABEL_35;
  }
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)v92;
  do
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v92 != v37) {
        objc_enumerationMutation(v34);
      }
      uint64_t v39 = *(void *)(*((void *)&v91 + 1) + 8 * i);
      v40 = [v5 complicationForSlot:v39];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = [v4 slotToSampleTemplateMapping];
        v41 = [v42 objectForKey:v39];

        id v4 = v85;
LABEL_32:
        [v86 setObject:v41 forKey:v39];
        goto LABEL_33;
      }
      v41 = +[NTKGreenfieldDraftRecipe templateForComplicationAtSlot:v39 face:v5];
      if (v41 && [v4 canShareTemplate:v41 slot:v39]) {
        goto LABEL_32;
      }
LABEL_33:
    }
    uint64_t v36 = [v34 countByEnumeratingWithState:&v91 objects:v98 count:16];
  }
  while (v36);
LABEL_35:

  v43 = [v4 slotToItemIdMapping];
  v44 = [v4 slotToBundleIdMapping];
  v45 = [v80 _metadataDictForWatchFace:v5 slotToSampleTemplateMapping:v86 slotToItemIdMapping:v43 slotToBundleIdMapping:v44 watchFaceDataPath:v30];

  if (!v45) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException" format:@"Failed to encode the metadata."];
  }
  id v90 = 0;
  v46 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v84 options:0 error:&v90];
  id v47 = v90;
  id v11 = v76;
  v23 = v77;
  v18 = image;
  if (v47) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to encode the face dict into json string: error: %@", v47 format];
  }
  UIImagePNGRepresentation(image);
  v26 = (NTKGreenfieldEncodedRecipe *)objc_claimAutoreleasedReturnValue();
  id v4 = v85;
  v75 = v26;
  if (v26)
  {
    v73 = UIImagePNGRepresentation(v77);
    if (v73)
    {
      v82 = UIImagePNGRepresentation(v76);
      if (v82)
      {
        v71 = v45;
        v72 = v46;
        id v89 = v47;
        v48 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v45 options:0 error:&v89];
        id v49 = v89;

        if (v49) {
          [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to encode the metadata json dict into NSData with error: %@", v49 format];
        }
        id v69 = v49;
        v50 = [v79 stringByAppendingPathComponent:@"snapshot.png"];
        [(NTKGreenfieldEncodedRecipe *)v26 writeToFile:v50 atomically:1];

        v51 = [v79 stringByAppendingPathComponent:@"no_borders_snapshot.png"];
        [v82 writeToFile:v51 atomically:1];

        v52 = [v79 stringByAppendingPathComponent:@"face.json"];
        [v72 writeToFile:v52 atomically:1];

        v53 = [v79 stringByAppendingPathComponent:@"metadata.json"];
        v70 = v48;
        [v48 writeToFile:v53 atomically:1];

        id v9 = v74;
        if ([v5 shouldIncludeResourceDirectoryForSharing])
        {
          v54 = [v79 stringByAppendingPathComponent:@"Resources"];
          v55 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v54;
            _os_log_impl(&dword_1BC5A9000, v55, OS_LOG_TYPE_DEFAULT, "Preparing resource directory for sharing: '%@'", buf, 0xCu);
          }

          id v88 = 0;
          char v56 = [v5 createResourceDirectorySuitableForSharingAtPath:v54 error:&v88];
          id v57 = v88;
          if ((v56 & 1) == 0) {
            [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to prepare resource directory for sharing at path: %@ error: %@", v54, v57 format];
          }
        }
        v68 = objc_opt_new();
        uint64_t v58 = [v68 zippedDataForPath:v79];
        [v83 removeItemAtPath:v79 error:0];
        v59 = NSString;
        v60 = [v5 faceSharingName];
        v61 = [v59 stringWithFormat:@"%@.watchface", v60];

        v62 = (void *)v58;
        v63 = [v74 stringByAppendingPathComponent:v61];
        v64 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v63];
        id v87 = 0;
        [v62 writeToURL:v64 options:0 error:&v87];
        id v65 = v87;
        if (v65) {
          [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to write .watchFace file to disk with error: %@", v65 format];
        }
        v66 = [v5 faceSharingName];
        v26 = [[NTKGreenfieldEncodedRecipe alloc] initWithWatchFaceDataUrl:v64 watchFaceImage:v76 watchFaceName:v66];

        id v47 = v69;
        id v4 = v85;
        v23 = v77;
        v18 = image;
        v45 = v71;
        v46 = v72;
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to convert into NSData, faceWithoutBorderImage:%@", v76 format];
        v26 = 0;
        id v9 = v74;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to convert into NSData faceWithDeviceBorderImage:%@", v77 format];
      v26 = 0;
      id v9 = v74;
    }
    v81 = v47;
  }
  else
  {
    v81 = v47;
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesEncodingException", @"Failed to convert into NSData faceWithGreyBorderImage:%@", image format];
    id v9 = v74;
  }

  v32 = v79;
  id v31 = 0;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
  return v26;
}

+ (id)_queue_snapshotFace:(id)a3 borderType:(unint64_t)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 encodeQueue];
  dispatch_assert_queue_V2(v7);

  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  char v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke;
  aBlock[3] = &unk_1E62C51E8;
  id v49 = v52;
  id v50 = a1;
  id v8 = v6;
  id v48 = v8;
  uint64_t v51 = 20;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__28;
  v45 = __Block_byref_object_dispose__28;
  id v46 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = +[NTKFaceSnapshotter defaultModernSnapshotOptions];
  double v12 = (void *)[v11 mutableCopy];

  [v12 setObject:&unk_1F16E1B78 forKeyedSubscript:@"NTKSnapshotPriorityKey"];
  [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"NTKSnapshotPersistableKey"];
  double v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ willSnapshot.", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_120;
  v34[3] = &unk_1E62C5210;
  id v14 = v8;
  id v35 = v14;
  uint64_t v37 = v52;
  v38 = &v41;
  id v39 = a1;
  unint64_t v40 = a4;
  double v15 = v10;
  uint64_t v36 = v15;
  BOOL v16 = _Block_copy(v34);
  if ([v14 faceStyle] == 21 || objc_msgSend(v14, "faceStyle") == 221)
  {
    unint64_t v17 = +[NTKFaceSnapshotClient sharedInstance];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_123;
    v32[3] = &unk_1E62C2330;
    id v33 = v16;
    [v17 snapshotFace:v14 options:v12 completion:v32];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v55 = __Block_byref_object_copy__28;
    char v56 = __Block_byref_object_dispose__28;
    id v57 = objc_alloc_init(NTKFaceSnapshotter);
    v18 = *(void **)(*(void *)&buf[8] + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_2;
    v29[3] = &unk_1E62C5238;
    id v30 = v16;
    id v31 = buf;
    [v18 provideSnapshotOfFace:v14 options:v12 completion:v29];

    _Block_object_dispose(buf, 8);
  }
  dispatch_time_t v19 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v15, v19);
  v9[2](v9);
  id v20 = a1;
  objc_sync_enter(v20);
  id v21 = (id)v42[5];
  objc_sync_exit(v20);

  v22 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ result: %@", buf, 0x16u);
  }

  if (v21)
  {
    id v23 = objc_alloc(MEMORY[0x1E4FB17D8]);
    [v21 size];
    double v24 = objc_msgSend(v23, "initWithSize:");
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_126;
    v27[3] = &unk_1E62C42D8;
    id v25 = v21;
    id v28 = v25;
    id v21 = [v24 imageWithActions:v27];
  }
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(v52, 8);
  return v21;
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 48);
  objc_sync_enter(v2);
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  objc_sync_exit(v2);

  if (!v3)
  {
    id v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_cold_1(a1, v4);
    }
  }
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ didReceiveSnapshot: %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = *(id *)(a1 + 64);
  objc_sync_enter(v6);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v7 = [*(id *)(a1 + 64) addBorder:*(void *)(a1 + 72) toWatchFaceImage:v3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_sync_exit(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_126(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setFill];

  [*(id *)(a1 + 32) size];
  double v5 = v4;
  [*(id *)(a1 + 32) size];
  double v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F19A30] currentDevice];
  id v9 = v8;
  if (v8)
  {
    int v10 = (void *)MEMORY[0x1E4FB14C0];
    [v8 screenCornerRadius];
    __int16 v12 = objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v5, v7, v11);
    CurrentContext = UIGraphicsGetCurrentContext();
    id v14 = v12;
    CGContextAddPath(CurrentContext, (CGPathRef)[v14 CGPath]);
    double v15 = UIGraphicsGetCurrentContext();
    CGContextClip(v15);
  }
  BOOL v16 = (CGContext *)[v21 CGContext];
  [*(id *)(a1 + 32) size];
  CGFloat v18 = v17;
  [*(id *)(a1 + 32) size];
  v23.size.height = v19;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v18;
  CGContextFillRect(v16, v23);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v20 = UIGraphicsGetCurrentContext();
  CGContextResetClip(v20);
}

+ (id)_greenfieldWatchFaceJsonForFace:(id)a3
{
  id v3 = [a3 deepCopy];
  [v3 clearMetrics];
  [v3 prepareForSharing];
  double v4 = [v3 greenfieldJSONObjectRepresentation];

  return v4;
}

+ (id)_metadataDictForWatchFace:(id)a3 slotToSampleTemplateMapping:(id)a4 slotToItemIdMapping:(id)a5 slotToBundleIdMapping:(id)a6 watchFaceDataPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  double v17 = objc_opt_new();
  CGFloat v18 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke;
  v34[3] = &unk_1E62C1918;
  id v19 = v13;
  id v35 = v19;
  id v20 = v14;
  id v36 = v20;
  id v21 = v18;
  id v37 = v21;
  [v12 enumerateComplicationSlotsWithBlock:v34];
  v22 = (void *)[v16 mutableCopy];

  [a1 _updateSystemDeletableAppItemIdForSlotToItemIdMapping:v22 face:v12];
  [v17 setObject:v21 forKeyedSubscript:@"complication_sample_templates"];
  [v17 setObject:v22 forKeyedSubscript:@"complications_item_ids"];
  [v17 setObject:v15 forKeyedSubscript:@"complications_bundle_ids"];

  CGRect v23 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke_2;
  v31[3] = &unk_1E62C18C8;
  id v24 = v12;
  id v32 = v24;
  id v25 = v23;
  id v33 = v25;
  [v24 enumerateComplicationSlotsWithBlock:v31];
  [v17 setObject:v25 forKeyedSubscript:@"complications_names"];
  v26 = [v24 createSharingMetadata];
  if (v26) {
    [v17 setObject:v26 forKey:@"watchface_metadata"];
  }
  [v17 setObject:&unk_1F16E1B90 forKey:@"version"];
  v27 = [MEMORY[0x1E4F19A30] currentDevice];
  id v28 = v27;
  if (v27)
  {
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "sizeClass"));
    [v17 setObject:v29 forKey:@"device_size"];
  }
  return v17;
}

void __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:*(void *)(a1 + 40)];
    double v5 = [v4 URLByAppendingPathComponent:@"complicationData"];

    double v6 = [v5 URLByAppendingPathComponent:v11];

    double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v6 path];
    [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    id v9 = [v6 path];
    int v10 = [v3 JSONObjectRepresentationWritingResourcesToBundlePath:v9 purpose:1];

    if (v10 || [0 count]) {
      [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v11];
    }
  }
}

void __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 complicationForSlot:v4];
  double v5 = [v6 localizedSectionHeaderName];
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v4];
}

+ (id)createXPCServiceConnection
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.NanoTimeKit.GreenfieldDecodingService"];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1FCDE6770];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_unzipWatchfaceFromURL_withSandboxExtension_writeSandboxExtension_completionBlock_ argumentIndex:0 ofReply:1];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

+ (BOOL)validateFaceType:(id)a3 faceBundleId:(id)a4
{
  id v5 = a4;
  uint64_t v12 = -1;
  NTKFaceBundleGetFaceStyleFromString(a3, &v12);
  if (v12 == -1) {
    goto LABEL_5;
  }
  if (v12 != 44)
  {
    uint64_t v8 = [NTKFaceDescriptor alloc];
    id v6 = [(NTKFaceDescriptor *)v8 initWithFaceStyle:v12];
    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  id v6 = [[NTKFaceDescriptor alloc] initWithBundleIdentifier:v5];
LABEL_7:
  id v9 = v6;
  int v10 = [MEMORY[0x1E4F19A30] currentDevice];
  if ([(NTKFaceDescriptor *)v9 isAvailableForDevice:v10]) {
    BOOL v7 = [(NTKFaceDescriptor *)v9 isAvailableForDevice:v10];
  }
  else {
    BOOL v7 = 0;
  }

LABEL_11:
  return v7;
}

+ (void)migrateComplicationsOnFace:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[NTKBundleComplicationFaceMigrator sharedInstance];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "migrateComplicationsOnFace about to migrate face %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NTKGreenfieldUtilities_migrateComplicationsOnFace___block_invoke;
  v8[3] = &unk_1E62C0E48;
  dispatch_semaphore_t v9 = v5;
  BOOL v7 = v5;
  [v4 migrateFace:v3 completion:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __53__NTKGreenfieldUtilities_migrateComplicationsOnFace___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)decodeWatchFaceFromUrl:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() encodeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke;
  block[3] = &unk_1E62C51C0;
  id v12 = v6;
  id v13 = v7;
  id v14 = a1;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke(id *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = [v2 startAccessingSecurityScopedResource];
    [a1[4] fileSystemRepresentation];
    uint64_t v4 = sandbox_extension_issue_file();
    id v5 = [a1[6] temporaryGreenfieldDirectory];
    [v5 UTF8String];
    uint64_t v6 = sandbox_extension_issue_file();

    id v7 = [a1[6] createXPCServiceConnection];
    [v7 resume];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x3032000000;
    char v53 = __Block_byref_object_copy__28;
    v54 = __Block_byref_object_dispose__28;
    id v55 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    id v47 = __Block_byref_object_copy__28;
    id v48 = __Block_byref_object_dispose__28;
    id v49 = 0;
    id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = a1[4];
      id v11 = [NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138412802;
      id v60 = v10;
      __int16 v61 = 2112;
      v62 = v11;
      __int16 v63 = 2080;
      uint64_t v64 = v4;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "[myConnection remoteObjectProxy] start decoding watch face from url: %@, scopedResource:%@, sandboxExtension: %s", buf, 0x20u);
    }
    id v12 = [v7 remoteObjectProxy];
    id v13 = a1[4];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_150;
    v39[3] = &unk_1E62C5260;
    uint64_t v41 = &v44;
    v42 = &v50;
    uint64_t v43 = v4;
    id v14 = v8;
    unint64_t v40 = v14;
    [v12 unzipWatchfaceFromURL:v13 withSandboxExtension:v4 writeSandboxExtension:v6 completionBlock:v39];

    dispatch_time_t v15 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v14, v15);
    if (v45[5])
    {
      id v16 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = [(id)v45[5] localizedDescription];
        __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_3(v17, buf, v16);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_152;
      block[3] = &unk_1E62C3280;
      id v37 = a1[5];
      v38 = &v44;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else if (v51[5])
    {
      id v19 = [(id)objc_opt_class() _decodeFaceFromDataPath:v51[5]];
      if (v19)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_153;
        v33[3] = &unk_1E62C0AE8;
        id v35 = a1[5];
        id v34 = v19;
        dispatch_async(MEMORY[0x1E4F14428], v33);

        id v20 = v35;
      }
      else
      {
        id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 0, @"Recipe must not be nil");
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_3;
        v30[3] = &unk_1E62C0AE8;
        id v26 = a1[5];
        id v31 = v25;
        id v32 = v26;
        id v20 = v25;
        dispatch_async(MEMORY[0x1E4F14428], v30);
      }
    }
    else
    {
      id v21 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_1(v21);
      }

      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 6, @"Decoding service timed out.");
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_162;
      v27[3] = &unk_1E62C0AE8;
      id v23 = a1[5];
      id v28 = v22;
      id v29 = v23;
      id v24 = v22;
      dispatch_async(MEMORY[0x1E4F14428], v27);
    }
    if (v3) {
      [a1[4] stopAccessingSecurityScopedResource];
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);
  }
  else
  {
    CGFloat v18 = [NSString stringWithFormat:@"Could not load url %@", 0];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2;
    v56[3] = &unk_1E62C2290;
    id v57 = v18;
    id v58 = a1[5];
    id v7 = v18;
    dispatch_async(MEMORY[0x1E4F14428], v56);

    id v14 = v57;
  }
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 5, *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    int v15 = 138412802;
    id v16 = v5;
    __int16 v17 = 2080;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "[myConnection remoteObjectProxy] completion block called with url: %@, sandboxExtension: %s, extractionError: %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
  id v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_152(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_158(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_162(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

+ (id)unzipWatchFaceFileAtUrl:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [a1 temporaryGreenfieldDirectory];
  id v10 = [v9 stringByAppendingPathComponent:v8];

  id v18 = 0;
  [v6 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v11 = v18;
  if (v11) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to create path at %@ with error %@", v10, v11 format];
  }
  id v17 = 0;
  [v6 removeItemAtPath:v10 error:&v17];
  id v12 = v17;
  id v13 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  BOOL v14 = +[NTKUnzipUtilities unzipFile:v5 toPath:v13];

  id v15 = 0;
  if (v14) {
    id v15 = v10;
  }

  return v15;
}

+ (id)_decodeFaceFromDataPath:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v90 = [MEMORY[0x1E4F28CB8] defaultManager];
  v82 = [v93 stringByAppendingPathComponent:@"metadata.json"];
  if (([v90 fileExistsAtPath:v82] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to locate the metadata.json in path: %@", v82 format];
  }
  v81 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v82];
  id v89 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v81 options:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, metadataDict is not dict %@, metadataPath: %@, url %@", v89, v82, v93 format];
  }
  id v80 = [v89 objectForKey:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to load the version number: %@", v80 format];
  }
  if ((unint64_t)[v80 integerValue] >= 3) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Version number is not supported. File: %@ Current: %lu", v80, 2 format];
  }
  id v88 = [v93 stringByAppendingPathComponent:@"face.json"];
  if (([v90 fileExistsAtPath:v88] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to locate the face.json in path: %@", v88 format];
  }
  v79 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v88];
  if (!v79) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to create jsonWatchFaceData from file at path: %@", v88 format];
  }
  id v125 = 0;
  id v85 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v79 options:0 error:&v125];
  id v75 = v125;
  if (v75
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v85 allValues],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = [v3 count] == 0,
        v3,
        v4))
  {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to load face.json into dict: %@", v88 format];
  }
  v78 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__28;
  v123 = __Block_byref_object_dispose__28;
  id v124 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke;
  v116[3] = &unk_1E62C5288;
  v118 = &v119;
  id v6 = v5;
  v117 = v6;
  +[NTKFace greenfieldFaceWithJSONObjectRepresentation:v85 forDevice:v78 withCompletion:v116];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  if (!v120[5]) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesIncompatibleDeviceException", @"Face is nil.face path %@", v88 format];
  }
  [v93 stringByAppendingPathComponent:@"Resources"];
  v9 = uint64_t v8 = v89;
  if ([v90 fileExistsAtPath:v9])
  {
    if (([v90 isReadableFileAtPath:v9] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Could not read file at: %@", v9 format];
    }
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    uint64_t v11 = NTKNewUniqueTeporaryResourceDirectory();
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    id v13 = v6;
    id v115 = 0;
    char v14 = [v90 copyItemAtURL:v10 toURL:v12 error:&v115];
    id v15 = v115;
    if (v15) {
      char v16 = 0;
    }
    else {
      char v16 = v14;
    }
    if ((v16 & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Could not copy file %@ to %@. Error: %@", v9, v11, v15 format];
    }

    uint64_t v8 = v89;
    id v6 = v13;
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(id)v120[5] setResourceDirectory:v11];
  uint64_t v17 = [v8 objectForKey:@"watchface_metadata"];
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, watchFaceMetadataDictionary is not dict %@, face.json: %@", v17, v85 format];
    }
  }
  [(id)v120[5] handleSharingMetadata:v17];
  long long v91 = objc_opt_new();
  id v18 = [v8 objectForKeyedSubscript:@"complication_sample_templates"];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, complicationSlotToTemplateStringMapping is not dict %@, face.json: %@", v18, v85 format];
    }
  }
  v73 = (void *)v11;
  v74 = (void *)v17;
  v71 = v6;
  v72 = (void *)v9;
  __int16 v19 = [v8 objectForKeyedSubscript:@"complications_item_ids"];
  id v20 = (void *)[v19 mutableCopy];

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, complicationSlotToItemIdMapping is not dict %@, face.json: %@", v20, v85 format];
    }
  }
  uint64_t v21 = [v89 objectForKeyedSubscript:@"complications_bundle_ids"];
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, complicationSlotToBundleIdMapping is not dict %@, face.json: %@", v20, v85 format];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
  }
  [(id)objc_opt_class() migrateComplicationsOnFace:v120[5]];
  v22 = [MEMORY[0x1E4F1CA48] array];
  id v23 = (void *)v120[5];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2;
  v109[3] = &unk_1E62C52B0;
  v114 = &v119;
  id v92 = v18;
  id v110 = v92;
  id v24 = v22;
  id v111 = v24;
  id v87 = v21;
  id v112 = v87;
  id v86 = v20;
  id v113 = v86;
  [v23 enumerateComplicationSlotsWithBlock:v109];
  uint64_t v76 = [v24 count];
  id v25 = v24;
  v96 = v24;
  if ([v24 count])
  {
    id v26 = (void *)[v87 mutableCopy];
    [v26 removeObjectsForKeys:v25];
    uint64_t v94 = [v26 copy];

    v27 = (void *)[v86 mutableCopy];
    [v27 removeObjectsForKeys:v96];
    uint64_t v83 = [v27 copy];

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v28 = v96;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v105 objects:v131 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v106 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v105 + 1) + 8 * i);
          id v33 = (void *)v120[5];
          id v34 = +[NTKComplication nullComplication];
          [v33 setComplication:v34 forSlot:v32];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v105 objects:v131 count:16];
      }
      while (v29);
    }

    id v86 = (id)v83;
    id v87 = (id)v94;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v35 = [v92 allKeys];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v101 objects:v130 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v102 != v37) {
          objc_enumerationMutation(v35);
        }
        id v39 = *(void **)(*((void *)&v101 + 1) + 8 * j);
        if ([v96 containsObject:v39])
        {
          unint64_t v40 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v127 = (uint64_t)v39;
          uint64_t v41 = v40;
          v42 = "Dropping template for slot '%@' as it doesn't have a complication anymore";
LABEL_62:
          _os_log_impl(&dword_1BC5A9000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
          goto LABEL_70;
        }
        uint64_t v43 = [(id)v120[5] complicationForSlot:v39];
        BOOL v44 = [v43 complicationType] == 56;

        if (v44)
        {
          unint64_t v40 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v127 = (uint64_t)v39;
          uint64_t v41 = v40;
          v42 = "Dropping template for slot '%@' as it contains an Apricot complication and we don't need a template";
          goto LABEL_62;
        }
        unint64_t v40 = [v92 objectForKeyedSubscript:v39];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Cannot decode watch face, templateJSON is not a dictionary" format];
        }
        v45 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v93];
        uint64_t v46 = [v45 URLByAppendingPathComponent:@"complicationData"];

        id v47 = [v46 URLByAppendingPathComponent:v39];

        id v48 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v47];
        id v49 = [MEMORY[0x1E4F196D8] complicationTemplateWithJSONObjectRepresentation:v40 bundle:v48 purpose:1];
        if (!v49)
        {
          uint64_t v50 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v127 = (uint64_t)v39;
            __int16 v128 = 2112;
            v129 = v40;
            _os_log_error_impl(&dword_1BC5A9000, v50, OS_LOG_TYPE_ERROR, "Cannot decode template for slot:%@, dictionary:\n%@", buf, 0x16u);
          }
        }
        [v91 setObject:v49 forKeyedSubscript:v39];

LABEL_70:
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v101 objects:v130 count:16];
    }
    while (v36);
  }

  uint64_t v51 = [v89 objectForKeyedSubscript:@"complications_names"];
  [v51 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_225];
  uint64_t v52 = [v93 stringByAppendingPathComponent:@"no_borders_snapshot.png"];
  if ([v90 fileExistsAtPath:v52])
  {
    char v53 = [a1 temporaryGreenfieldNoBordersSnapshotPath];
    if ([v90 fileExistsAtPath:v53]) {
      [v90 removeItemAtPath:v53 error:0];
    }
    [v90 copyItemAtPath:v52 toPath:v53 error:0];
  }
  else
  {
    char v53 = 0;
  }
  uint64_t v54 = [v89 objectForKey:@"device_size"];
  id v55 = [NTKGreenfieldDecodedRecipe alloc];
  char v56 = [(NTKGreenfieldDecodedRecipe *)v55 initWithWatchFace:v120[5] complicationSlotToTemplateMapping:v91 complicationSlotToItemIdMapping:v86 complicationSlotToNameMapping:v51 complicationSlotToBundleIdMapping:v87 isUsingModifiedComplicationsSet:v76 != 0 noBorderFacePreviewImagePath:v53 senderBoxedDeviceSize:v54];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2_230;
  block[3] = &unk_1E62BFF20;
  id v57 = v56;
  v100 = v57;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v58 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  id v95 = (void *)v54;
  v84 = (void *)v52;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v127 = (uint64_t)v93;
    _os_log_impl(&dword_1BC5A9000, v58, OS_LOG_TYPE_DEFAULT, "Decode service did start cleaning up files at path: %@.", buf, 0xCu);
  }

  id v59 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v93];
  [v59 fileSystemRepresentation];
  uint64_t v60 = sandbox_extension_issue_file();
  __int16 v61 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v127 = v60;
    _os_log_impl(&dword_1BC5A9000, v61, OS_LOG_TYPE_DEFAULT, "Decode service sandboxExtension is:%s.", buf, 0xCu);
  }

  v62 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.NanoTimeKit.GreenfieldDecodingService"];
  __int16 v63 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1FCDE6770];
  uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v63 setClasses:v64 forSelector:sel_removeFileAtPath_withSandboxExtension_completionBlock_ argumentIndex:0 ofReply:1];
  [v62 setRemoteObjectInterface:v63];
  [v62 resume];
  uint64_t v65 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v127 = (uint64_t)v62;
    _os_log_impl(&dword_1BC5A9000, v65, OS_LOG_TYPE_DEFAULT, "Decode service myConnection is:%@.", buf, 0xCu);
  }

  v66 = [v62 remoteObjectProxy];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_232;
  v97[3] = &unk_1E62C0D88;
  id v67 = v93;
  id v98 = v67;
  [v66 removeFileAtPath:v67 withSandboxExtension:v60 completionBlock:v97];

  v68 = v98;
  id v69 = v57;

  _Block_object_dispose(&v119, 8);
  return v69;
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) complicationForSlot:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) complicationForSlot:v3];
    uint64_t v6 = [v5 complication];

    id v4 = (void *)v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([v4 complicationType])
      {
        if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) slot:v3 supportsFamiliesOfComplications:v4])
        {
          dispatch_time_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
          uint64_t v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
          BOOL v9 = +[NTKGreenfieldSystemAppDeprecatedMappings isSystemAppDeprecatedBundleId:v7 itemId:v8];

          if (!v9) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v11 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 138412546;
            id v13 = v4;
            __int16 v14 = 2112;
            id v15 = v3;
            _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Dropping unsupported complication '%@' in slot '%@'", (uint8_t *)&v12, 0x16u);
          }
        }
      }
      else
      {
        id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

        if (!v10) {
          goto LABEL_15;
        }
      }
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
LABEL_15:
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKGreenfieldUtilitiesDecodingException", @"Failed to load the complication names. The key and value must be string type. %@ %@", v5, v4 format];
  }
}

uint64_t __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2_230(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectOverrideTemplates];
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_232(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_232_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Decode service remove files at path:%@ succeed.", (uint8_t *)&v7, 0xCu);
  }
}

+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() encodeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NTKGreenfieldUtilities_generateFacePreviewImageFromUrl_completionBlock___block_invoke;
  block[3] = &unk_1E62C51C0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__NTKGreenfieldUtilities_generateFacePreviewImageFromUrl_completionBlock___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend((id)objc_opt_class(), "_queue_greenfieldPreviewFromUrl:", *(void *)(a1 + 32));
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = @"Failed to generate the image.";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v3 errorWithDomain:@"com.apple.nanotimekit" code:-1 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)_queue_greenfieldPreviewFromUrl:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() unzipWatchFaceFileAtUrl:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"snapshot.png"];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v8 = [v7 fileExistsAtPath:v6];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v10 = [v9 contentsAtPath:v6];
      uint64_t v11 = [MEMORY[0x1E4FB1818] imageWithData:v10];
      id v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v14 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:]();
        }
      }
    }
    else
    {
      id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:]();
      }
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:]();
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)addBorder:(unint64_t)a3 toWatchFaceImage:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
    id v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[NTKGreenfieldUtilities addBorder:toWatchFaceImage:](v13);
    }
    goto LABEL_10;
  }
  [v6 size];
  double v10 = v9;
  double v11 = v8;
  if (v9 == 0.0 || v8 == 0.0)
  {
    id v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[NTKGreenfieldUtilities addBorder:toWatchFaceImage:](v13, v10, v11);
    }
LABEL_10:

    a1 = 0;
    goto LABEL_16;
  }
  switch(a3)
  {
    case 0uLL:
      id v12 = v7;
      goto LABEL_15;
    case 1uLL:
      id v12 = [a1 _addGreyBorderToWatchFaceImage:v7];
      goto LABEL_15;
    case 2uLL:
      id v14 = a1;
      id v15 = v7;
      uint64_t v16 = 0;
      goto LABEL_14;
    case 3uLL:
      id v14 = a1;
      id v15 = v7;
      uint64_t v16 = 1;
LABEL_14:
      id v12 = [v14 _addGenericDeviceBorderToWatchFaceImage:v15 includesTransparentPadding:v16];
LABEL_15:
      a1 = v12;
      break;
    default:
      break;
  }
LABEL_16:

  return a1;
}

+ (id)_addGreyBorderToWatchFaceImage:(id)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  objc_msgSend(v3, "size", _LayoutConstants_23(&v21));
  CGFloat v5 = v4 * *(double *)&v21;
  [v3 size];
  double v7 = v6;
  [v3 size];
  CGFloat v9 = v7 + v5 - v8;
  v29.size.width = v5 * *((double *)&v22 + 1);
  v29.size.height = v9 + v5 * *((double *)&v22 + 1) - v5;
  v29.origin.x = (v5 - v5 * *((double *)&v22 + 1)) * 0.5;
  v29.origin.y = (v9 - v29.size.height) * 0.5;
  CGRect v30 = CGRectInset(v29, *(double *)&v23 * 0.5, *(double *)&v23 * 0.5);
  double v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height, *((double *)&v21 + 1) * *((double *)&v23 + 1) * CGRectGetHeight(v30));
  v28.width = v5;
  v28.height = v9;
  UIGraphicsBeginImageContextWithOptions(v28, 0, 0.0);
  [v10 setLineWidth:*(double *)&v22];
  [v10 fill];
  CurrentContext = UIGraphicsGetCurrentContext();
  id v12 = v10;
  CGContextAddPath(CurrentContext, (CGPathRef)[v12 CGPath]);
  id v13 = UIGraphicsGetCurrentContext();
  CGContextClip(v13);
  [v3 size];
  CGFloat v15 = (v5 - v14) * 0.5;
  [v3 size];
  objc_msgSend(v3, "drawAtPoint:", v15, (v9 - v16) * 0.5);

  uint64_t v17 = UIGraphicsGetCurrentContext();
  CGContextResetClip(v17);
  id v18 = NTKCOutlineColor(0);
  [v18 setStroke];
  [v12 stroke];
  __int16 v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

+ (id)_addGenericDeviceBorderToWatchFaceImage:(id)a3 includesTransparentPadding:(BOOL)a4
{
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  objc_msgSend(MEMORY[0x1E4F19A30], "currentDevice", _LayoutConstants_23(v8));
  unint64_t v5 = [(id)objc_claimAutoreleasedReturnValue() deviceCategory] - 1;
  if (v5 > 4) {
    double v6 = @"email_sharing_luxo";
  }
  else {
    double v6 = off_1E62C53E0[v5];
  }
  NTKImageNamed(v6);
}

uint64_t __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 112);
  double v4 = *(double *)(a1 + 120);
  double v5 = *(double *)(a1 + 96);
  double v6 = *(double *)(a1 + 104);
  return objc_msgSend(v2, "drawInRect:blendMode:alpha:", 5, v3, v4, v5, v6, 1.0);
}

uint64_t __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  double v5 = [v3 clearColor];
  [v5 setFill];

  double v6 = (CGContext *)[v4 CGContext];
  v12.size.width = *(CGFloat *)(a1 + 40);
  v12.size.height = *(CGFloat *)(a1 + 48);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextFillRect(v6, v12);
  double v7 = *(void **)(a1 + 32);
  double v8 = *(double *)(a1 + 136);
  double v9 = *(double *)(a1 + 144);
  return objc_msgSend(v7, "drawAtPoint:", v8, v9);
}

+ (id)encodeQueue
{
  if (encodeQueue_onceToken != -1) {
    dispatch_once(&encodeQueue_onceToken, &__block_literal_global_257);
  }
  id v2 = (void *)encodeQueue_encodeQueue;
  return v2;
}

void __37__NTKGreenfieldUtilities_encodeQueue__block_invoke()
{
  id v2 = dispatch_get_global_queue(25, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.NanoTimeKit.Greenfield.queue", 0, v2);
  int v1 = (void *)encodeQueue_encodeQueue;
  encodeQueue_encodeQueue = (uint64_t)v0;
}

+ (BOOL)shouldAutoDismissViewControllerForAddFaceFlow:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)_companionAppIdFromWatchAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  double v5 = [MEMORY[0x1E4F19A30] currentDevice];
  double v6 = [v5 nrDevice];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__28;
  id v20 = __Block_byref_object_dispose__28;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke;
  v12[3] = &unk_1E62C5348;
  id v8 = v3;
  id v13 = v8;
  CGFloat v15 = &v16;
  double v9 = v7;
  double v14 = v9;
  [v4 fetchApplicationOnPairedDevice:v6 withBundleID:v8 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    double v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [a2 companionAppBundleID];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    double v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)_updateSystemDeletableAppItemIdForSlotToItemIdMapping:(id)a3 face:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke;
  v54[3] = &unk_1E62C5370;
  id v8 = v6;
  id v55 = v8;
  id v9 = v7;
  id v56 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v54];
  id v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v59 = v9;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Pending processing sadSlotToAppIdMapping: %@", buf, 0xCu);
  }

  double v11 = (void *)MEMORY[0x1E4F1CA80];
  id v41 = v9;
  CGRect v12 = [v9 allValues];
  id v13 = [v11 setWithArray:v12];

  double v14 = [MEMORY[0x1E4F1CA60] dictionary];
  CGFloat v15 = (void *)MEMORY[0x1E4F4BBE0];
  uint64_t v16 = [v13 allObjects];
  uint64_t v17 = [v15 queryForBundleIDs:v16];

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_270;
  v50[3] = &unk_1E62C5398;
  id v42 = v14;
  id v51 = v42;
  id v19 = v13;
  id v52 = v19;
  id v20 = v18;
  char v53 = v20;
  id v39 = v17;
  [v17 executeQueryWithResultHandler:v50];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  v38 = v19;
  if ([v19 count])
  {
    id v21 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v19;
      _os_log_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldUtilities) Started SAD ItemID lookup %@:", buf, 0xCu);
    }

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    long long v23 = (void *)MEMORY[0x1E4F4BBD8];
    long long v24 = [v19 allObjects];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_273;
    v47[3] = &unk_1E62C53C0;
    id v48 = v42;
    long long v25 = v22;
    id v49 = v25;
    [v23 lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:v24 withResultHandler:v47];

    uint64_t v36 = v25;
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v36 = v20;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v40 = v8;
  long long v26 = objc_msgSend(v8, "orderedComplicationSlots", v36);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v57 count:16];
  CGSize v28 = v41;
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v33 = [v5 objectForKeyedSubscript:v32];
        if ([v33 isEqualToNumber:&unk_1F16E1BA8])
        {
          id v34 = [v28 objectForKeyedSubscript:v32];
          if (v34)
          {
            id v35 = [v42 objectForKeyedSubscript:v34];
            if (v33) {
              [v5 setObject:v35 forKeyedSubscript:v32];
            }

            CGSize v28 = v41;
          }
        }
      }
      uint64_t v29 = [v26 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v29);
  }
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 isEqualToNumber:&unk_1F16E1BA8])
  {
    id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Found itemID == 0 for slot: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 32) complicationForSlot:v5];
    id v8 = [v7 appIdentifier];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "executeQueryWithResultHandler: %@ %@", buf, 0x16u);
  }
  id v20 = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "storeItemID"));
        CGFloat v15 = v14;
        if (v14 && (int)[v14 intValue] >= 1)
        {
          uint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = [v13 bundleID];
          [v16 setObject:v15 forKeyedSubscript:v17];

          dispatch_semaphore_t v18 = *(void **)(a1 + 40);
          id v19 = [v13 bundleID];
          [v18 removeObject:v19];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_273(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_273_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldUtilities) Completed SAD ItemID lookup finished with result %@:", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          double v14 = [v5 objectForKeyedSubscript:v13];
          if (v14) {
            [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)shouldPresentUnreleasedFeaturesInternalWarningForFace:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (!NTKInternalBuild(v3, v4)) {
    goto LABEL_5;
  }
  if (([v3 shouldPresentAlertForSharingUnreleasedFace] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __80__NTKGreenfieldUtilities_shouldPresentUnreleasedFeaturesInternalWarningForFace___block_invoke;
    v7[3] = &unk_1E62C1F28;
    id v8 = v3;
    uint64_t v9 = &v10;
    [v8 enumerateComplicationSlotsWithBlock:v7];

LABEL_5:
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;
    goto LABEL_6;
  }
  BOOL v5 = 1;
LABEL_6:
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __80__NTKGreenfieldUtilities_shouldPresentUnreleasedFeaturesInternalWarningForFace___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL v5 = +[NTKGreenfieldDraftRecipe templateForComplicationAtSlot:a2 face:*(void *)(a1 + 32)];
  if (v5)
  {
    id v8 = v5;
    id v6 = [MEMORY[0x1E4F19A98] sharedMonitor];
    int v7 = objc_msgSend(v6, "considersUISensitivitySensitive:", objc_msgSend(v8, "uiSensitivity"));

    BOOL v5 = v8;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

void __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Encode failed reason: %@", v2, v3, v4, v5, v6);
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 56);
  uint8_t v6 = *(void **)(a1 + 32);
  id v7 = v4;
  id v8 = [v6 JSONObjectRepresentation];
  int v9 = 138412802;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  double v14 = v8;
  _os_log_fault_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_FAULT, "GreenfieldFaceSnapshotTimout: Failed to generate snapshot for a %@ face within %lu sec. Face: %@", (uint8_t *)&v9, 0x20u);
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Decoding service timed out", v1, 2u);
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Decode failed reason: %@", v2, v3, v4, v5, v6);
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "unzipWatchfaceFromURL path is nil, error: %@", buf, 0xCu);
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_232_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Decode service remove files at path:%@ failed with error: %@.");
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v2 = 2112;
  uint64_t v3 = 0;
  _os_log_error_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_ERROR, "Failed to unzip file url %@ at path: %@", v1, 0x16u);
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to load snapshot.png file at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to locate snapshot.png file at path: %@", v2, v3, v4, v5, v6);
}

+ (void)addBorder:(os_log_t)log toWatchFaceImage:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "cannot add border to nil watch face image", v1, 2u);
}

+ (void)addBorder:(double)a3 toWatchFaceImage:.cold.2(NSObject *a1, double a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromCGSize(*(CGSize *)&a2);
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BC5A9000, a1, OS_LOG_TYPE_ERROR, "cannot add border to watch face image with invalid size %@", v5, 0xCu);
}

void __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Failed to fetch watch app with %@ error %@");
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_273_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "(NTKGreenfieldUtilities) Completed SAD ItemID lookup finished with error %@:", v2, v3, v4, v5, v6);
}

@end