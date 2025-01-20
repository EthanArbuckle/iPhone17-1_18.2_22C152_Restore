@interface PLImageWriter
+ (BOOL)_hasPrimaryAssetAndAdjustmentsFilesWithType:(signed __int16)a3 inIncomingFilenames:(id)a4 forAssetUUID:(id)a5;
+ (BOOL)_requiresAssetUUIDForJobType:(id)a3;
+ (BOOL)_requiresCrashRecoveryForJobType:(id)a3;
+ (BOOL)_requiresIndicatorFileForJobType:(id)a3;
+ (BOOL)isDeferredPhotoPreviewURL:(id)a3;
+ (BOOL)isSpatialOverCaptureURL:(id)a3;
+ (BOOL)semanticEnhanceSceneIsValid:(int64_t)a3;
+ (BOOL)setAdjustmentsForNewPhoto:(id)a3 mainFileMetadata:(id)a4 cameraAdjustmentData:(id)a5 adjustmentDataPath:(id)a6 filteredImagePath:(id)a7 cameraMetadata:(id)a8 finalAssetSize:(CGSize)a9 isSubstandardRender:(BOOL)a10;
+ (id)_assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8;
+ (id)_assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8;
+ (id)_assetUUIDFromIncomingFilename:(id)a3;
+ (id)_fetchPhotoAssetForUUID:(id)a3 moc:(id)a4;
+ (id)_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:(id)a3;
+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6;
+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7;
+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7 sourceURL:(id)a8;
+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 exportProperties:(id)a4;
+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5;
+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6;
+ (id)assetAdjustmentsFromCameraAdjustmentsFileAtPath:(id)a3 exportProperties:(id)a4 cameraMetadata:(id)a5;
+ (id)assetAdjustmentsFromCameraFilters:(id)a3 portraitMetadata:(id)a4 exportProperties:(id)a5 cameraMetadata:(id)a6;
+ (id)assetAdjustmentsFromCompositionController:(id)a3 exportProperties:(id)a4;
+ (id)cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4;
+ (id)finalizedAssetURLForDeferredPhotoPreviewURL:(id)a3 extension:(id)a4;
+ (id)pathComponentForIncomingHoldingDirectory;
+ (id)semanticEnhancePreviewDestinationURLForPrimaryAssetURL:(id)a3;
+ (void)_signalBackgroundProcessingNeededForAsset:(id)a3 reason:(id)a4;
+ (void)photoIrisPairingDidSucceed:(BOOL)a3 fileIndicatorPath:(id)a4 photoAsset:(id)a5 photoLibrary:(id)a6;
+ (void)setAdjustmentsForNewVideo:(id)a3 mainFileMetadata:(id)a4 withAdjustmentsDictionary:(id)a5 cameraAdjustments:(id)a6 renderedContentPath:(id)a7 renderedPosterFramePreviewPath:(id)a8 finalAssetSize:(CGSize)a9;
- (BOOL)_enterAtomicCrashRecoveryJobProcessing;
- (BOOL)_hasNonCrashRecoveryJobsEnqueued;
- (BOOL)_isHighPriorityJob:(id)a3;
- (BOOL)_retryPairedVideoJob:(id)a3 pairingType:(id)a4 pairingIdentifier:(id)a5 retryMax:(unint64_t)a6;
- (BOOL)_transferVideoFromIncomingPath:(id)a3 toDestinationPath:(id)a4 shouldRemoveIncoming:(BOOL *)a5 error:(id *)a6;
- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5;
- (BOOL)canEnqueueJob:(id)a3;
- (BOOL)enqueueJob:(id)a3;
- (BOOL)imageWriterJob:(id)a3 hasValidPathsWithConnection:(id)a4;
- (PLImageWriter)init;
- (PLImageWriter)initWithLibraryServicesManager:(id)a3;
- (id)_newShortLivedLibraryWithName:(const char *)a3;
- (id)_pathForNewAssetWithPath:(id)a3 withExtension:(id)a4;
- (id)_processLimitedLibraryAdditionIfNeededWithAssetUUID:(id)a3 clientBundleIdentifier:(id)a4 clientAuthorization:(id)a5 library:(id)a6;
- (id)cameraAssetPathForNewAssetWithExtension:(id)a3 assetUUID:(id)a4;
- (id)iTunesSyncedAssetsDCIMDirectory;
- (id)indicatorFileCoordinator;
- (id)pathForNewAssetPathAtAlbumDirectoryPath:(id)a3 assetType:(unsigned int)a4 extension:(id)a5;
- (id)pathForNewAssetWithDirectoryPath:(id)a3 fileName:(id)a4 extension:(id)a5;
- (id)writeFilteredPreviewWithImageData:(id)a3 orImage:(id)a4 toPathWithBaseName:(id)a5;
- (void)_copyJobContentsToHoldingDirectoryWithUUID:(id)a3 incomingPath:(id)a4 job:(id)a5;
- (void)_decrementJobCount:(id)a3;
- (void)_enablePhotoStreamJob:(id)a3 completion:(id)a4;
- (void)_exitAtomicCrashRecoveryJobProcessing;
- (void)_handleAvalancheCrashRecovery:(id)a3;
- (void)_handleCameraAdjustments:(id)a3 fullsizeRenders:(id)a4 largeThumbnails:(id)a5;
- (void)_handleCameraMetadataCrashRecovery:(id)a3;
- (void)_handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:(id)a3;
- (void)_handlePhotoIrisCrashRecoveryForVideos:(id)a3;
- (void)_incrementJobCount:(id)a3;
- (void)_linkDiagnosticFileWithSourcePath:(id)a3 forPhotoDestinationURL:(id)a4;
- (void)_processAutodeleteEmptyAlbumJob:(id)a3 completion:(id)a4;
- (void)_processAvalancheJob:(id)a3 completion:(id)a4;
- (void)_processAvalanchesValidationJob:(id)a3 completion:(id)a4;
- (void)_processBatchImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)_processCrashRecoveryJob:(id)a3 completion:(id)a4;
- (void)_processDaemonJob:(id)a3 completion:(id)a4;
- (void)_processDeletePhotoStreamDataJob:(id)a3 withReason:(id)a4 completion:(id)a5;
- (void)_processImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)_processJob:(id)a3;
- (void)_processSyncClientSaveJobsJob:(id)a3 completion:(id)a4;
- (void)_processSyncedVideoSaveJob:(id)a3 completion:(id)a4;
- (void)_processVideoJob:(id)a3 completion:(id)a4;
- (void)_processVideoSaveJob:(id)a3 completion:(id)a4;
- (void)_processXPCDaemonJob:(id)a3 completion:(id)a4;
- (void)_removeInProgressExtendedAttributesForFileAtURL:(id)a3;
- (void)_removeTransientKeys:(id)a3;
- (void)_resetSyncedAssetsDCIMDirectory;
- (void)cleanupFilesInLibrary:(id)a3 afteriTunesSyncBeforeDate:(id)a4;
- (void)delayJob:(id)a3 delay:(int64_t)a4;
- (void)enqueueAutoDeleteEmptyAlbumJobWithAlbumID:(id)a3;
- (void)processSyncSaveJob:(id)a3 library:(id)a4 albumMap:(id)a5;
- (void)saveAssetJob:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 completionHandler:(id)a6;
@end

@implementation PLImageWriter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_indicatorFileCoordinator, 0);
  objc_storeStrong((id *)&self->_iTunesSyncedAssetsDCIMDirectory, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_jobCompletionQueue, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
}

- (void)_copyJobContentsToHoldingDirectoryWithUUID:(id)a3 incomingPath:(id)a4 job:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v51 = v8;
  v11 = [v8 stringByDeletingLastPathComponent];
  id v58 = 0;
  v12 = [v10 contentsOfDirectoryAtPath:v11 error:&v58];
  id v13 = v58;

  v14 = NSTemporaryDirectory();
  v15 = [(id)objc_opt_class() pathComponentForIncomingHoldingDirectory];
  v16 = [v14 stringByAppendingPathComponent:v15];
  v17 = [v16 stringByAppendingPathComponent:v7];

  if (v12)
  {
    id v57 = 0;
    int v18 = [v10 createDirectoryIfNeededAtPath:v17 error:&v57];
    v19 = v57;
    v20 = v19;
    if (v18)
    {
      v45 = v19;
      v46 = v12;
      id v47 = v13;
      v48 = v10;
      id v49 = v9;
      id v50 = v7;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v21 = v12;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (!v22) {
        goto LABEL_21;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v54;
      while (1)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_msgSend(v26, "pathExtension", v45, v46, v47, v48, v49, v50);
          id v27 = (id)objc_claimAutoreleasedReturnValue();
          if ([v27 isEqualToString:@"irs"]) {
            goto LABEL_18;
          }
          v28 = [v26 pathExtension];
          char v29 = [v28 isEqualToString:@"avalanche"];

          if (v29) {
            continue;
          }
          v30 = [v26 lastPathComponent];
          v31 = [v17 stringByAppendingPathComponent:v30];

          v32 = [v51 stringByDeletingLastPathComponent];
          v33 = [v32 stringByAppendingPathComponent:v26];

          if (!v33)
          {
            id v27 = 0;
LABEL_14:
            v35 = PLAssetImportGetLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v61 = v33;
              __int16 v62 = 2112;
              v63 = v31;
              __int16 v64 = 2112;
              id v65 = v27;
              _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Error copying item from %@ to %@: %@", buf, 0x20u);
            }

            goto LABEL_17;
          }
          id v52 = 0;
          char v34 = [MEMORY[0x1E4F8B908] cloneFileAtPath:v33 toPath:v31 error:&v52];
          id v27 = v52;
          if ((v34 & 1) == 0) {
            goto LABEL_14;
          }
LABEL_17:

LABEL_18:
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (!v23)
        {
LABEL_21:

          id v9 = v49;
          id v7 = v50;
          id v13 = v47;
          v10 = v48;
          v20 = v45;
          v12 = v46;
          goto LABEL_27;
        }
      }
    }
    v36 = PLAssetImportGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v61 = v17;
      __int16 v62 = 2112;
      v63 = v20;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Error creating holding file path at %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v20 = PLAssetImportGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v13;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Error getting contents of incoming directory: %@", buf, 0xCu);
    }
  }
LABEL_27:

  if (v9)
  {
    v37 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    v38 = [v17 stringByAppendingPathComponent:v37];
    v39 = [v38 stringByAppendingPathExtension:@"plist"];

    v40 = (void *)[v9 mutableCopy];
    uint64_t v41 = *MEMORY[0x1E4F8CA98];
    v59[0] = @"completionBlock";
    v59[1] = v41;
    uint64_t v42 = *MEMORY[0x1E4F8CAD0];
    v59[2] = *MEMORY[0x1E4F8CA28];
    v59[3] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
    [v40 removeObjectsForKeys:v43];

    [v40 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kPLImageWriterReplayedCameraJob"];
    if (([v40 writeToFile:v39 atomically:1] & 1) == 0)
    {
      v44 = PLAssetImportGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v39;
        __int16 v62 = 2112;
        v63 = 0;
        _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Error writing job dict to %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v37 = PLAssetImportGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Unable to write out job dictionary as it is nil", buf, 2u);
    }
  }
}

- (void)enqueueAutoDeleteEmptyAlbumJobWithAlbumID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = *MEMORY[0x1E4F8C978];
  [v6 setObject:*MEMORY[0x1E4F8C978] forKey:*MEMORY[0x1E4F8C970]];
  [v6 setObject:v5 forKey:@"EmptyAlbumToDelete"];
  id v8 = PLAssetImportGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] enqueing job %@ with albumID %@", (uint8_t *)&v10, 0x20u);
  }
  [(PLImageWriter *)self enqueueJob:v6];
}

- (void)saveAssetJob:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 completionHandler:(id)a6
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x1E4F8CAA0];
  id v15 = [v10 objectForKey:*MEMORY[0x1E4F8CAA0]];

  if (v15
    && ([v10 objectForKey:v14],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 BOOLValue],
        v16,
        !v17)
    || [(PLImageWriter *)self canEnqueueJob:v10])
  {
    uint64_t v18 = *MEMORY[0x1E4F8C8F0];
    uint64_t v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
    if (!v19)
    {
      uint64_t v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8C918]];
    }
    v20 = [v10 objectForKey:*MEMORY[0x1E4F8C970]];
    if (!v19)
    {
      if ([(id)objc_opt_class() _requiresAssetUUIDForJobType:v20])
      {
        id v21 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v19 = [v21 UUIDString];

        [v10 setObject:v19 forKeyedSubscript:v18];
        uint64_t v22 = PLAssetImportGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v70 = v20;
          __int16 v71 = 2114;
          uint64_t v72 = v19;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Job %{public}@ missing required assetUUID, assigning %{public}@ ", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    char v29 = [v10 objectForKey:*MEMORY[0x1E4F8C930]];
    v60 = v29;
    long long v55 = (void *)v19;
    if ([v20 isEqualToString:*MEMORY[0x1E4F8C9B8]])
    {
      uint64_t v30 = *MEMORY[0x1E4F8CA28];
      v31 = [v10 objectForKey:*MEMORY[0x1E4F8CA28]];
      if (![v31 length])
      {
        if (![v29 length])
        {
          uint64_t v35 = [MEMORY[0x1E4F8B850] defaultFileExtensionForAssetType:0];
          v36 = v29;
          v37 = (void *)v35;

          v60 = v37;
        }
        v38 = [v10 objectForKey:*MEMORY[0x1E4F8C8E8]];

        if (!v38)
        {
          uint64_t v39 = [(PLImageWriter *)self cameraAssetPathForNewAssetWithExtension:v60 assetUUID:v19];

          v31 = (void *)v39;
        }
        if (v31) {
          [v10 setObject:v31 forKey:v30];
        }
        v32 = @"generated image";
        if (!v11) {
          goto LABEL_51;
        }
        goto LABEL_48;
      }
      goto LABEL_18;
    }
    uint64_t v33 = *MEMORY[0x1E4F8C9D8];
    if (([v20 isEqualToString:*MEMORY[0x1E4F8C9D8]] & 1) == 0
      && ([v20 isEqualToString:*MEMORY[0x1E4F8C9D0]] & 1) == 0
      && ![v20 isEqualToString:*MEMORY[0x1E4F8C9E8]])
    {
      if ([v20 isEqualToString:*MEMORY[0x1E4F8C9E0]])
      {
        v31 = [(PLImageWriter *)self cameraAssetPathForNewAssetWithExtension:@"MOV" assetUUID:v19];
        [v10 setObject:v31 forKey:*MEMORY[0x1E4F8CAD0]];
      }
      else
      {
        v31 = 0;
      }
LABEL_18:
      v32 = @"provided image";
      if (!v11)
      {
LABEL_51:
        if (v12)
        {
          if ([v20 isEqualToString:*MEMORY[0x1E4F8C9E0]])
          {
            uint64_t v44 = PLCreateCGImageFromIOSurface();
            if (v44)
            {
              v45 = (const void *)v44;
              [v10 setObject:v44 forKey:*MEMORY[0x1E4F8CAE0]];
              CFRelease(v45);
            }
          }
          uint64_t v46 = PLCreateImageFromPreviewImageSurface();
          if (v46)
          {
            id v47 = (const void *)v46;
            [v10 setObject:v46 forKey:*MEMORY[0x1E4F8CA98]];
            CFRelease(v47);
          }
        }
        id v58 = v11;
        id v59 = v12;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __81__PLImageWriter_saveAssetJob_imageSurface_previewImageSurface_completionHandler___block_invoke;
        v62[3] = &unk_1E58636B8;
        SEL v68 = a2;
        id v48 = v20;
        id v63 = v48;
        id v28 = v55;
        id v64 = v28;
        id v65 = v32;
        id v49 = v31;
        id v66 = v49;
        id v67 = v13;
        id v50 = (void *)MEMORY[0x19F38D650](v62);
        v51 = PLAssetImportGetLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          id v52 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138544386;
          v70 = v52;
          __int16 v71 = 2114;
          uint64_t v72 = (uint64_t)v48;
          __int16 v73 = 2114;
          id v74 = v28;
          __int16 v75 = 2114;
          v76 = v32;
          __int16 v77 = 2112;
          id v78 = v49;
          _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing job %{public}@ assetUUID %{public}@ with %{public}@ destination path %@", buf, 0x34u);
        }
        long long v53 = (void *)[v50 copy];
        long long v54 = (void *)MEMORY[0x19F38D650]();
        [v10 setObject:v54 forKey:@"completionBlock"];

        [(PLImageWriter *)self enqueueJob:v10];
        id v11 = v58;
        id v12 = v59;
        goto LABEL_60;
      }
LABEL_48:
      uint64_t v42 = [v10 objectForKey:*MEMORY[0x1E4F8C830]];
      if (v42)
      {
        v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8B928]), "initWithIOSurface:length:", v11, objc_msgSend(v42, "unsignedIntegerValue"));
        [v10 setObject:v43 forKey:*MEMORY[0x1E4F8C958]];
      }
      goto LABEL_51;
    }
    uint64_t v34 = *MEMORY[0x1E4F8CAD0];
    v31 = [v10 objectForKey:*MEMORY[0x1E4F8CAD0]];
    if ([v31 length])
    {
      v32 = @"provided video";
      if (!v11) {
        goto LABEL_51;
      }
      goto LABEL_48;
    }
    if (![v60 length])
    {
      uint64_t v56 = [MEMORY[0x1E4F8B850] defaultFileExtensionForAssetType:2];

      v60 = (void *)v56;
    }
    if (([v20 isEqualToString:v33] & 1) != 0
      || [v20 isEqualToString:*MEMORY[0x1E4F8C9D0]])
    {
      v40 = [v10 objectForKey:*MEMORY[0x1E4F8CAE8]];
      [v10 setObject:v40 forKey:*MEMORY[0x1E4F8CAD8]];

      uint64_t v41 = [v10 objectForKey:*MEMORY[0x1E4F8CA40]];
      if (v41)
      {
        [v10 removeObjectForKey:v34];
        uint64_t v57 = 0;
      }
      else
      {
        uint64_t v57 = [(PLImageWriter *)self cameraAssetPathForNewAssetWithExtension:@"MOV" assetUUID:v19];
      }
    }
    else
    {
      if (![v20 isEqualToString:*MEMORY[0x1E4F8C9E8]])
      {
LABEL_45:
        if (v31) {
          [v10 setObject:v31 forKey:v34];
        }
        v32 = @"generated video";
        if (!v11) {
          goto LABEL_51;
        }
        goto LABEL_48;
      }
      uint64_t v57 = [(PLImageWriter *)self cameraAssetPathForNewAssetWithExtension:v60 assetUUID:v19];

      uint64_t v41 = [MEMORY[0x1E4F8B850] uniqueIncomingPathForAssetWithUUID:v19 andExtension:v60 isPhotoStream:0];
      [v10 setObject:v41 forKey:*MEMORY[0x1E4F8CAD8]];
    }

    v31 = (void *)v57;
    goto LABEL_45;
  }
  uint64_t v23 = PLAssetImportGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v70 = v24;
    __int16 v71 = 2112;
    uint64_t v72 = (uint64_t)v10;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] job queue full, failed to enqueue job %@", buf, 0x16u);
  }
  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F8C500];
  uint64_t v79 = *MEMORY[0x1E4F28568];
  v80[0] = @"Failed to enqueue imagewriter job; job queue is full";
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
  id v28 = [v25 errorWithDomain:v26 code:41001 userInfo:v27];

  if (v13) {
    (*((void (**)(id, void, void, uint64_t, id))v13 + 2))(v13, 0, 0, 1, v28);
  }
LABEL_60:
}

void __81__PLImageWriter_saveAssetJob_imageSurface_previewImageSurface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 removeObjectForKey:@"completionBlock"];
  v4 = PLAssetImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    int v11 = 138544386;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] completed job %{public}@ assetUUID %{public}@ with %{public}@ destination path %@", (uint8_t *)&v11, 0x34u);
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id, void, void))(v10 + 16))(v10, 1, v3, 0, 0);
  }
}

- (BOOL)imageWriterJob:(id)a3 hasValidPathsWithConnection:(id)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  uint64_t v9 = [WeakRetained pathManager];
  char v10 = 1;
  v36 = [v9 photoDirectoryWithType:1];

  int v11 = NSHomeDirectory();
  uint64_t v34 = [v11 stringByAppendingPathComponent:@"Library/ReplayKit"];

  id v12 = NSHomeDirectory();
  uint64_t v35 = [v12 stringByAppendingPathComponent:@"Library/SMS/Attachments"];

  v45[0] = (id)*MEMORY[0x1E4F8CA28];
  uint64_t v13 = 0;
  v45[1] = (id)*MEMORY[0x1E4F8CAD0];
  while (1)
  {
    char v14 = v10;
    uint64_t v13 = [v6 objectForKey:v45[v13]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([MEMORY[0x1E4F8B908] filePath:v13 hasPrefix:v36] & 1) == 0)
    {
      break;
    }

    char v10 = 0;
    uint64_t v13 = 1;
    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
  }
  __int16 v15 = PLAssetImportGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v36;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "DestinationPath %@ is not under supported resourcesPath %@", buf, 0x16u);
  }

  LOBYTE(v13) = 0;
LABEL_9:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = PLImageWriterSourcePathKeys();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
  uint64_t v18 = v34;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v33 = v7;
    uint64_t v20 = *(void *)v38;
    uint64_t v21 = v36;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v37 + 1) + 8 * i), v32);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([MEMORY[0x1E4F8B908] filePath:v23 hasPrefix:v21] & 1) == 0
          && ([MEMORY[0x1E4F8B908] filePath:v23 hasPrefix:v18] & 1) == 0
          && ([MEMORY[0x1E4F8B908] filePath:v23 hasPrefix:v35] & 1) == 0)
        {
          id v24 = v33;
          uint64_t v25 = [MEMORY[0x1E4F8B908] realPathForPath:v23 error:0];
          if (!v25)
          {

            uint64_t v21 = v36;
LABEL_27:
            char v29 = PLAssetImportGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v34;
              __int16 v42 = 2112;
              v43 = v35;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Source file: %@ is not in %@ nor %@ nor %@ and the client does not have access", buf, 0x2Au);
            }

            LOBYTE(v13) = 0;
            goto LABEL_30;
          }
          uint64_t v26 = (void *)v25;
          if (v33) {
            [v24 auditToken];
          }
          else {
            memset(buf, 0, sizeof(buf));
          }
          id v27 = v26;
          uint64_t v32 = [v27 fileSystemRepresentation];
          int v28 = sandbox_check_by_audit_token();

          uint64_t v21 = v36;
          uint64_t v18 = v34;
          if (v28) {
            goto LABEL_27;
          }
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v19) {
        continue;
      }
      break;
    }
LABEL_30:
    id v7 = v33;
  }

  for (uint64_t j = 1; j != -1; --j)
  return v13;
}

- (void)_processJob:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F38D3B0]();
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F8C970]];
  uint64_t v8 = PLImageWriterGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __29__PLImageWriter__processJob___block_invoke;
  uint64_t v21 = &unk_1E5870A08;
  id v10 = v5;
  id v22 = v10;
  uint64_t v23 = self;
  int v11 = v8;
  id v24 = v11;
  os_signpost_id_t v26 = v9;
  id v12 = v7;
  id v25 = v12;
  uint64_t v13 = (void *)MEMORY[0x19F38D650](&v18);
  char v14 = v11;
  __int16 v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v12;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ProcessImageWriterJob", "jobType: %{public}@", buf, 0xCu);
  }

  uint64_t v16 = PLAssetImportGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v12;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Processing job with type %@", buf, 0xCu);
  }

  if ([v12 isEqualToString:*MEMORY[0x1E4F8C9B8]])
  {
    id v17 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processJob:]");
    [(PLImageWriter *)self _processImageJob:v10 inLibrary:v17 completion:v13];
  }
  else if ([v12 isEqualToString:*MEMORY[0x1E4F8C990]])
  {
    id v17 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processJob:] (BatchImage)");
    [(PLImageWriter *)self _processBatchImageJob:v10 inLibrary:v17 completion:v13];
  }
  else
  {
    if ([v12 isEqualToString:*MEMORY[0x1E4F8C980]])
    {
      [(PLImageWriter *)self _processAvalancheJob:v10 completion:v13];
      goto LABEL_11;
    }
    if ([v12 isEqualToString:*MEMORY[0x1E4F8C988]])
    {
      [(PLImageWriter *)self _processAvalanchesValidationJob:v10 completion:v13];
      goto LABEL_11;
    }
    if (([v12 isEqualToString:*MEMORY[0x1E4F8C9D8]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x1E4F8C9F0]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x1E4F8C9D0]] & 1) != 0
      || [v12 isEqualToString:*MEMORY[0x1E4F8C9E0]])
    {
      [(PLImageWriter *)self _processVideoJob:v10 completion:v13];
      goto LABEL_11;
    }
    if ([v12 isEqualToString:*MEMORY[0x1E4F8C9E8]])
    {
      [(PLImageWriter *)self _processVideoSaveJob:v10 completion:v13];
      goto LABEL_11;
    }
    if ([v12 isEqualToString:*MEMORY[0x1E4F8C9C8]])
    {
      [(PLImageWriter *)self _processSyncedVideoSaveJob:v10 completion:v13];
      goto LABEL_11;
    }
    if ([v12 isEqualToString:*MEMORY[0x1E4F8C9A8]])
    {
      id v17 = +[PLAssetTransactionReason transactionReason:@"[_processJob][_processDeletePhotoStreamDataJob]Deleting PhotoStream data."];
      [(PLImageWriter *)self _processDeletePhotoStreamDataJob:v10 withReason:v17 completion:v13];
    }
    else
    {
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C9B0]])
      {
        [(PLImageWriter *)self _enablePhotoStreamJob:v10 completion:v13];
        goto LABEL_11;
      }
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C9C0]])
      {
        [(PLImageWriter *)self _processSyncClientSaveJobsJob:v10 completion:v13];
        goto LABEL_11;
      }
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C978]])
      {
        [(PLImageWriter *)self _processAutodeleteEmptyAlbumJob:v10 completion:v13];
        goto LABEL_11;
      }
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C998]])
      {
        [(PLImageWriter *)self _processCrashRecoveryJob:v10 completion:v13];
        goto LABEL_11;
      }
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C9A0]])
      {
        [(PLImageWriter *)self _processDaemonJob:v10 completion:v13];
        goto LABEL_11;
      }
      if ([v12 isEqualToString:*MEMORY[0x1E4F8C9F8]])
      {
        [(PLImageWriter *)self _processXPCDaemonJob:v10 completion:v13];
        goto LABEL_11;
      }
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"PLImageWriter.m", 4011, @"JobType unknown %@", v12, v18, v19, v20, v21, v22, v23, v24 object file lineNumber description];
    }
  }

LABEL_11:
}

void __29__PLImageWriter__processJob___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F8B8D8] sharedInstance];
  [v2 updateAvailableDiskSpace];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"completionBlock"];
  if (v3)
  {
    [*(id *)(a1 + 40) _incrementJobCount:*(void *)(a1 + 32)];
    v4 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __29__PLImageWriter__processJob___block_invoke_2;
    v14[3] = &unk_1E58747F0;
    __int16 v15 = *(id *)(a1 + 32);
    id v19 = v3;
    id v5 = *(id *)(a1 + 48);
    id v7 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    id v16 = v5;
    uint64_t v20 = v6;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 40);
    id v17 = v8;
    uint64_t v18 = v9;
    dispatch_async(v4, v14);

    id v10 = v15;
  }
  else
  {
    int v11 = *(id *)(a1 + 48);
    id v10 = v11;
    os_signpost_id_t v12 = *(void *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v13;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "ProcessImageWriterJob", "jobType: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __29__PLImageWriter__processJob___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kPLImageWriterVideoJobWillRetryKey"];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  v4 = *(id *)(a1 + 40);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "ProcessImageWriterJob", "jobType: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return [*(id *)(a1 + 56) _decrementJobCount:*(void *)(a1 + 32)];
}

- (void)_processSyncedVideoSaveJob:(id)a3 completion:(id)a4
{
  p_libraryServicesManager = &self->_libraryServicesManager;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_libraryServicesManager);
  uint64_t v10 = [WeakRetained pathManager];
  id v12 = [v10 iTunesSyncedAssetsDirectory];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:0];

  [(PLImageWriter *)self _processVideoSaveJob:v8 completion:v7];
}

- (void)_processVideoSaveJob:(id)a3 completion:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 objectForKey:@"callStack"];
  if (v8)
  {
    int v9 = PLAssetImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v56 = v10;
      __int16 v57 = 2112;
      uint64_t v58 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    PLJobLogDictionary();
  }
  v45 = (void *)v8;
  uint64_t v42 = *MEMORY[0x1E4F8CAE8];
  id v12 = objc_msgSend(v6, "objectForKey:");
  uint64_t v13 = [v6 objectForKey:*MEMORY[0x1E4F8CAD8]];
  char v14 = [v6 objectForKey:*MEMORY[0x1E4F8CAC8]];
  int v15 = [v14 BOOLValue];

  id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
  uint64_t v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
  uint64_t v44 = (void *)v17;
  if (v15)
  {
    id v50 = 0;
    uint64_t v18 = [MEMORY[0x1E4F8B908] hasDiskSpaceToCopyFileAtURL:v16 toVolumeAtURL:v17 error:&v50];
    id v19 = v50;
    if (v18)
    {
      int v20 = [v18 BOOLValue];

      if (!v20)
      {
        uint64_t v21 = PLServicesLocalizedFrameworkString();
        SetErrorForJob(v6, 0xEu, v21);

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = PLAssetImportGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v16 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v56 = v23;
        __int16 v57 = 2112;
        uint64_t v58 = (uint64_t)v19;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to determine available space for copying video %@: %@", buf, 0x16u);
      }
    }
  }
  id v24 = [v16 path];
  BOOL v25 = +[PLPhotoLibrary canSaveVideoToLibrary:v24];

  if (v25)
  {
    os_signpost_id_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = v26;
    if (v15)
    {
      id v49 = 0;
      char v41 = [v26 copyItemAtPath:v12 toPath:v13 error:&v49];
      id v28 = v49;
      uint64_t v53 = *MEMORY[0x1E4F28370];
      uint64_t v54 = *MEMORY[0x1E4F28358];
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v48 = 0;
      char v30 = [v27 setAttributes:v29 ofItemAtPath:v13 error:&v48];
      id v31 = v48;

      if ((v30 & 1) == 0)
      {
        uint64_t v32 = PLAssetImportGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v13;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v31;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
        }
      }
      if ((v41 & 1) == 0)
      {
LABEL_19:
        uint64_t v33 = PLServicesLocalizedFrameworkString();
        SetErrorForJob(v6, 0xFu, v33);

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v51 = *MEMORY[0x1E4F28370];
      uint64_t v52 = *MEMORY[0x1E4F28358];
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v47 = 0;
      int v37 = [v27 setAttributes:v36 ofItemAtPath:v12 error:&v47];
      id v38 = v47;

      if ((v37 & 1) == 0)
      {
        long long v39 = PLAssetImportGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v12;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v38;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
        }
      }
      id v46 = 0;
      int v40 = [v27 moveItemAtPath:v12 toPath:v13 error:&v46];
      id v28 = v46;

      if (!v40) {
        goto LABEL_19;
      }
    }
    [v6 setObject:v13 forKey:v42];
    [(PLImageWriter *)self _processVideoJob:v6 completion:v7];

    uint64_t v35 = v45;
    goto LABEL_31;
  }
LABEL_20:
  uint64_t v34 = [v6 objectForKey:@"Error"];

  if (!v34)
  {
    id v27 = PLServicesLocalizedFrameworkString();
    SetErrorForJob(v6, 0xDu, v27);
    id v28 = 0;
    goto LABEL_23;
  }
  id v28 = 0;
LABEL_24:
  uint64_t v35 = v45;
  v7[2](v7);
LABEL_31:
}

- (void)_processVideoJob:(id)a3 completion:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v44 = (void (**)(void))a4;
  uint64_t v8 = [v7 objectForKey:@"callStack"];
  if (v8)
  {
    int v9 = PLAssetImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    PLJobLogDictionary();
  }
  id v45 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processVideoJob:completion:]");
  id v47 = [v7 objectForKey:*MEMORY[0x1E4F8CAD8]];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v110 = __Block_byref_object_copy__5318;
  v111 = __Block_byref_object_dispose__5319;
  uint64_t v12 = *MEMORY[0x1E4F8CAD0];
  id v112 = [v7 objectForKey:*MEMORY[0x1E4F8CAD0]];
  v43 = [v7 objectForKey:*MEMORY[0x1E4F8CA38]];
  uint64_t v13 = [v7 objectForKeyedSubscript:@"_kPLImageWriterDidTransferVideoToDestinationPath"];
  char v14 = [v13 BOOLValue];

  id v46 = [v7 objectForKey:*MEMORY[0x1E4F8C8D8]];
  if (v46)
  {
    int v15 = [[PLIngestJobCameraMetadata alloc] initWithCameraMetadataPath:v46];
    [(PLIngestJobCameraMetadata *)v15 deserializeCameraMetadata];
  }
  else
  {
    int v15 = 0;
  }
  uint64_t v42 = v15;
  id v16 = [v7 objectForKey:*MEMORY[0x1E4F8C970]];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F8C9D0]];
  id v48 = v16;
  uint64_t v18 = (void *)MEMORY[0x1E4F8C8F0];
  if (v17)
  {
    id v19 = [v7 objectForKey:*MEMORY[0x1E4F8C8F0]];
    if ([v19 length])
    {
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x3032000000;
      v106 = __Block_byref_object_copy__5318;
      v107 = __Block_byref_object_dispose__5319;
      id v108 = 0;
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke;
      v99[3] = &unk_1E5875340;
      id v100 = v19;
      id v101 = v45;
      v102 = &v103;
      [v101 performBlockAndWait:v99];
      int v20 = (void *)v104[5];
      if (v20) {
        char v21 = v14;
      }
      else {
        char v21 = 1;
      }
      if ((v21 & 1) == 0)
      {
        objc_storeStrong((id *)(*(void *)&buf[8] + 40), v20);
        [v7 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v12];
      }

      _Block_object_dispose(&v103, 8);
    }
  }
  uint64_t v22 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  v98[0] = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  char v96 = v14;
  if ((v14 & 1) != 0
    || (uint64_t v23 = *(void *)(*(void *)&buf[8] + 40),
        id v92 = 0,
        v24 = [(PLImageWriter *)self _transferVideoFromIncomingPath:v47 toDestinationPath:v23 shouldRemoveIncoming:v98 error:&v92], v25 = v92, uint64_t v22 = v25, *((unsigned char *)v94 + 24) = v24, v24))
  {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_kPLImageWriterDidTransferVideoToDestinationPath"];
  }
  else if (v25)
  {
    [(PLImageWriter *)self _removeTransientKeys:v7];
    v44[2]();
    goto LABEL_29;
  }
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  char v91 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__5318;
  v107 = __Block_byref_object_dispose__5319;
  id v108 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__5318;
  v88[4] = __Block_byref_object_dispose__5319;
  id v89 = 0;
  long long v39 = [v7 objectForKey:*MEMORY[0x1E4F8C928]];
  os_signpost_id_t v26 = [v39 objectForKey:*MEMORY[0x1E4F8C8D0]];
  id v27 = [v7 objectForKey:*MEMORY[0x1E4F8C880]];
  int v40 = [v7 objectForKey:*MEMORY[0x1E4F8C878]];
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__5318;
  v86 = __Block_byref_object_dispose__5319;
  id v87 = [v7 objectForKey:*v18];
  char v28 = [v48 isEqualToString:*MEMORY[0x1E4F8C9E0]];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  if ([v29 BOOLForKey:@"PLImageWriterStashCameraJob"])
  {
    char v30 = [v7 objectForKeyedSubscript:@"kPLImageWriterReplayedCameraJob"];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      uint64_t v32 = *MEMORY[0x1E4F8CA40];
      uint64_t v33 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8CA40]];

      if (v33)
      {
        id v34 = [v7 objectForKeyedSubscript:v32];
      }
      else
      {
        id v34 = (id)v83[5];
      }
      uint64_t v35 = v34;
      [(PLImageWriter *)self _copyJobContentsToHoldingDirectoryWithUUID:v34 incomingPath:v47 job:v7];
    }
  }
  [(PLImageWriter *)self _incrementJobCount:v7];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke_2;
  v62[3] = &unk_1E5863668;
  id v63 = v7;
  char v81 = v28;
  id v37 = v27;
  id v64 = v37;
  id v74 = &v82;
  id v65 = v45;
  id v66 = v48;
  id v67 = self;
  __int16 v75 = buf;
  id v68 = v47;
  id v38 = v29;
  id v69 = v38;
  v76 = &v93;
  __int16 v77 = v97;
  id v78 = v90;
  id v70 = v43;
  id v41 = v40;
  id v71 = v41;
  id v36 = v26;
  id v72 = v36;
  __int16 v73 = v42;
  uint64_t v79 = v88;
  v80 = &v103;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke_418;
  v49[3] = &unk_1E5863690;
  __int16 v57 = v97;
  id v50 = v68;
  id v51 = v8;
  uint64_t v52 = self;
  uint64_t v58 = buf;
  uint64_t v59 = &v103;
  v60 = v88;
  id v53 = v46;
  id v61 = v90;
  id v54 = v63;
  id v55 = v70;
  uint64_t v56 = v44;
  [v65 performTransaction:v62 completionHandler:v49 withPriority:1];

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(v90, 8);
LABEL_29:
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(v97, 8);

  _Block_object_dispose(buf, 8);
}

void __45__PLImageWriter__processVideoJob_completion___block_invoke(void *a1)
{
  id v6 = +[PLManagedAsset assetWithUUID:a1[4] inLibrary:a1[5]];
  v2 = [v6 pathForVideoFile];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __45__PLImageWriter__processVideoJob_completion___block_invoke_2(uint64_t a1)
{
  v202[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C918]];
  uint64_t v3 = *MEMORY[0x1E4F8CA10];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA10]];
  id v5 = [*(id *)(a1 + 32) objectForKey:@"ImportedBy"];
  if (([v5 intValue] == 6 || objc_msgSend(v5, "intValue") == 9)
    && [*(id *)(a1 + 40) length])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v201 = *MEMORY[0x1E4F8BB20];
    v202[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v202 forKeys:&v201 count:1];
    PLSendCoreAnalyticEvent();
  }
  if (*(unsigned char *)(a1 + 176))
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) length])
    {
      uint64_t v8 = +[PLManagedAsset assetWithUUID:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) inLibrary:*(void *)(a1 + 48)];

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  if (![*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F8C9D0]])
  {
LABEL_16:
    uint64_t v14 = *MEMORY[0x1E4F8C9F0];
    if ([*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F8C9F0]])
    {
      int v15 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C870]];
      v182 = [*(id *)(a1 + 48) photoFromAssetURL:v15];
      uint64_t v16 = [v182 pathForVideoFile];
      uint64_t v17 = *(void *)(*(void *)(a1 + 128) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    else
    {
      v182 = 0;
    }
    id v19 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA60]];
    v187 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA40]];
    v183 = v4;
    v184 = v19;
    if (*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)
      || ![*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F8C9D8]])
    {
      BOOL v170 = 0;
      v181 = 0;
      int v172 = 0;
      int v20 = 0;
      goto LABEL_29;
    }
    if (v187)
    {
      int v20 = +[PLManagedAsset assetWithUUID:v187 inLibrary:*(void *)(a1 + 48)];
      char v21 = PLAssetImportGetLog();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          CMTimeValue v23 = *(void *)(a1 + 72);
          BOOL v24 = [v20 objectID];
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = v23;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v24;
          HIWORD(buf.epoch) = 2114;
          v198 = v187;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ found asset %{public}@ with uuid %{public}@", (uint8_t *)&buf, 0x20u);
        }
        uint64_t v25 = [v20 mediaGroupUUID];
        v181 = (void *)v25;
        if (v19 && v25)
        {
          BOOL v170 = 0;
          int v172 = [(__CFString *)v19 isEqualToString:v25] ^ 1;
        }
        else
        {
          int v172 = 0;
          BOOL v170 = v25 == 0;
        }
LABEL_190:
        int v148 = [*(id *)(a1 + 80) BOOLForKey:@"PLFrameDropRecoveryEnableOnOlderDevices"];
        if (v148)
        {
          v149 = PLAssetImportGetLog();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_19B3C7000, v149, OS_LOG_TYPE_DEFAULT, "[FDR] Sending live photo down frame drop recovery path because PLFrameDropRecoveryEnableOnOlderDevicesUserDefaultsKey default is set", (uint8_t *)&buf, 2u);
          }
        }
        if (([v20 hasAdjustments] & 1) != 0
          || (v148 | PLPlatformIsFrameDropRecoverySupported()) != 1)
        {
          uint64_t v155 = [v20 pathForVideoComplementFile];
          uint64_t v156 = *(void *)(*(void *)(a1 + 128) + 8);
          v153 = *(NSObject **)(v156 + 40);
          *(void *)(v156 + 40) = v155;
        }
        else
        {
          uint64_t v150 = [v20 pathForDeferredVideoComplementFile];
          uint64_t v151 = *(void *)(*(void *)(a1 + 128) + 8);
          v152 = *(void **)(v151 + 40);
          *(void *)(v151 + 40) = v150;

          [v20 setVideoDeferredProcessingNeeded:1];
          +[PLImageWriter _signalBackgroundProcessingNeededForAsset:v20 reason:@"frame drop recovery"];
          v153 = PLAssetImportGetLog();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          {
            CMTimeValue v154 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.value + 4) = v154;
            _os_log_impl(&dword_19B3C7000, v153, OS_LOG_TYPE_DEFAULT, "[FDR] Marking video complement for frame drop recovery, assigning path %@", (uint8_t *)&buf, 0xCu);
          }
        }

        if (*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40))
        {
          v157 = PLAssetImportGetLog();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
          {
            CMTimeValue v158 = *(void *)(a1 + 72);
            uint64_t v159 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138543618;
            *(CMTimeValue *)((char *)&buf.value + 4) = v158;
            LOWORD(buf.flags) = 2114;
            *(void *)((char *)&buf.flags + 2) = v159;
            _os_log_impl(&dword_19B3C7000, v157, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ -> destination %{public}@", (uint8_t *)&buf, 0x16u);
          }
        }
        else
        {
          uint64_t v160 = [*(id *)(a1 + 64) cameraAssetPathForNewAssetWithExtension:@"MOV" assetUUID:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
          uint64_t v161 = *(void *)(*(void *)(a1 + 128) + 8);
          v162 = *(void **)(v161 + 40);
          *(void *)(v161 + 40) = v160;

          v163 = PLAssetImportGetLog();
          if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
          {
            CMTimeValue v164 = *(void *)(a1 + 72);
            uint64_t v165 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138543618;
            *(CMTimeValue *)((char *)&buf.value + 4) = v164;
            LOWORD(buf.flags) = 2114;
            *(void *)((char *)&buf.flags + 2) = v165;
            _os_log_impl(&dword_19B3C7000, v163, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ aborting, will import video at %{public}@", (uint8_t *)&buf, 0x16u);
          }

          v157 = v20;
          int v20 = 0;
        }

        [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) forKeyedSubscript:*MEMORY[0x1E4F8CAD0]];
        [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:@"kPLImageWriterVideoJobWillRetryKey"];
LABEL_29:
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24))
        {
          id v37 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAD8]];
          id v38 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAD0]];
          long long v39 = *(void **)(a1 + 64);
          uint64_t v40 = *(void *)(*(void *)(a1 + 144) + 8) + 24;
          id v196 = 0;
          char v41 = [v39 _transferVideoFromIncomingPath:v37 toDestinationPath:v38 shouldRemoveIncoming:v40 error:&v196];
          id v42 = v196;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = v41;
          int v43 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);

          if (!v43)
          {
            if (v42)
            {
              id v9 = 0;
              id v19 = v184;
LABEL_181:
              v146 = v181;
LABEL_182:

              uint64_t v4 = v183;
              goto LABEL_183;
            }
          }
        }
        uint64_t v26 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C938]];
        id v27 = (void *)v26;
        if (v20 && v26)
        {
          char v28 = [v20 pathForFullsizeRenderVideoFile];
          uint64_t v29 = *(void **)(a1 + 64);
          uint64_t v30 = *(void *)(*(void *)(a1 + 152) + 8) + 24;
          id v195 = 0;
          int v31 = [v29 _transferVideoFromIncomingPath:v27 toDestinationPath:v28 shouldRemoveIncoming:v30 error:&v195];
          id v32 = v195;
          if (v31) {
            [v20 setVideoCpVisibilityState:[v20 videoCpVisibilityState] | 8];
          }
        }
        v180 = v5;
        v186 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) isDirectory:0];
        if (!*(unsigned char *)(a1 + 176)) {
          [MEMORY[0x1E4F16468] consolidateMovieFragmentsInFile:v186 error:0];
        }
        v177 = v27;
        uint64_t v33 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C8F8]];
        id v34 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA00]];
        if ([*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAE0]])
        {
          uint64_t v35 = DCIM_newPLImageWithCGImage();
          id v19 = v184;
          if (v35)
          {
            id v179 = (id)v35;
            id v36 = (id)PLCreateImageWithFormatFromImage();
LABEL_40:
            v178 = v36;
            goto LABEL_46;
          }
        }
        else
        {
          id v19 = v184;
          if (!v20)
          {
            if (*(void *)(a1 + 88))
            {
              DCIM_newPLImageWithContentsOfFile();
              id v179 = (id)objc_claimAutoreleasedReturnValue();
              DCIM_newPLImageWithContentsOfFile();
              id v36 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v116 = *(void **)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
              id v193 = 0;
              id v194 = 0;
              PLPreviewImageAndDurationForVideoAtPathWithPreferredTime(0, v116, &v194, &v193, 0);
              id v179 = v194;
              id v36 = v193;
            }
            goto LABEL_40;
          }
        }
        v178 = 0;
        id v179 = 0;
LABEL_46:
        v176 = v33;
        if (v33)
        {
          if (!v34) {
            id v34 = v33;
          }
          if (!*(unsigned char *)(a1 + 176))
          {
            uint64_t v44 = v3;
            uint64_t v45 = v14;
            id v46 = v2;
            id v47 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            id v48 = v34;
            id v49 = objc_msgSend(v47, "initWithObjectsAndKeys:", v33, *MEMORY[0x1E4F282C0], v34, *MEMORY[0x1E4F28310], 0);
            id v50 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
            id v192 = 0;
            char v52 = [v50 setAttributes:v49 ofItemAtPath:v51 error:&v192];
            id v53 = (__CFString *)v192;

            if ((v52 & 1) == 0)
            {
              id v54 = PLAssetImportGetLog();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
                LODWORD(buf.value) = 138543874;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v49;
                LOWORD(buf.flags) = 2112;
                *(void *)((char *)&buf.flags + 2) = v55;
                HIWORD(buf.epoch) = 2112;
                v198 = v53;
                _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_ERROR, "Failed to write file attributes %{public}@ on %@: %@", (uint8_t *)&buf, 0x20u);
              }
            }
            id v19 = v184;
            id v34 = v48;
            v2 = v46;
            uint64_t v14 = v45;
            uint64_t v3 = v44;
          }
        }
        v175 = v34;
        uint64_t v56 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAA8]];
        v174 = v56;
        if (v56)
        {
          __int16 v57 = [v56 integerValue];
          if (v20) {
            goto LABEL_57;
          }
        }
        else
        {
          __int16 v57 = [MEMORY[0x1E4F8BA10] defaultSavedAssetTypeForUnspecifiedImageWriterJobs];
          if (v20)
          {
LABEL_57:
            CFDictionaryRef v58 = (const __CFDictionary *)[*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA68]];
            CFDictionaryRef v59 = (const __CFDictionary *)[*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA70]];
            memset(&v191, 0, sizeof(v191));
            if (v58) {
              CMTimeMakeFromDictionary(&v191, v58);
            }
            else {
              CMTime v191 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
            }
            id v5 = v180;
            memset(&v190, 0, sizeof(v190));
            if (v59) {
              CMTimeMakeFromDictionary(&v190, v59);
            }
            else {
              CMTime v190 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
            }
            CMTime buf = v190;
            CMTime v189 = v191;
            uint64_t v63 = [v20 becomePhotoIrisWithMediaGroupUUID:v19 mainFileMetadata:0 videoURL:v186 videoDuration:&buf stillDisplayTime:&v189 options:0];
            if (v63)
            {
              id v64 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA48]];
              int v65 = [v64 BOOLValue];

              if (v65)
              {
                id v66 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA58]];
                [v20 updatePhotoIrisVisibilityStateWithVitalityScore:v66];
              }
              int v67 = v191.flags & 0x1D;
              int v68 = v190.flags & 0x1D;
              BOOL v69 = v67 == 1 && v68 == 1;
              int v70 = v172;
              if (!v69) {
                int v70 = 1;
              }
              if ((v70 | v170) == 1)
              {
                id v71 = PLAssetImportGetLog();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  v168 = v2;
                  if (v67 == 1) {
                    id v72 = @"N";
                  }
                  else {
                    id v72 = @"Y";
                  }
                  if (v68 == 1) {
                    __int16 v73 = @"N";
                  }
                  else {
                    __int16 v73 = @"Y";
                  }
                  if (v172)
                  {
                    id v74 = v73;
                    uint64_t v75 = [NSString stringWithFormat:@"Y (existing %@, incoming %@)", v181, v19];
                    __int16 v73 = v74;
                    v76 = (__CFString *)v75;
                  }
                  else
                  {
                    v76 = @"N";
                  }
                  if (v170) {
                    v117 = @"Y";
                  }
                  else {
                    v117 = @"N";
                  }
                  LODWORD(buf.value) = 138413058;
                  *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v72;
                  LOWORD(buf.flags) = 2112;
                  *(void *)((char *)&buf.flags + 2) = v73;
                  HIWORD(buf.epoch) = 2112;
                  v198 = v76;
                  __int16 v199 = 2112;
                  v200 = v117;
                  _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "Invalid live photo metadata, non-numeric still display time: %@, video duration: %@, pairing identifier mismatch: %@, pairing identifier potentially missing in image: %@", (uint8_t *)&buf, 0x2Au);
                  if (v172) {

                  }
                  v2 = v168;
                  id v5 = v180;
                }

                if (MEMORY[0x19F38BDA0]())
                {
                  v118 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Captured live photo with invalid video metadata:"];
                  v119 = v118;
                  if (v67 != 1) {
                    [v118 appendString:@"\n  Still display time is non-numeric"];
                  }
                  if (v68 != 1) {
                    [v119 appendString:@"\n  Video duration is non-numeric"];
                  }
                  if (v172) {
                    [v119 appendFormat:@"\n  Pairing identifier does not match, existing identifier %@ does not match incoming identifier %@", v181, v19];
                  }
                  if (v170) {
                    [v119 appendFormat:@"\n  No pairing identifier found for existing asset, image metadata is potentially missing pairing identifier (incoming pairing identifier: %@)", v19];
                  }
                  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Photos Live Photo Capture Issue Detected!" message:@"Please file a Radar for critical live photo capture issue." radarTitle:@"TTR Photos: captured live photo with invalid video metadata" radarDescription:v119];
                }
              }
              if ([v20 hasAdjustments])
              {
                if (![v20 deferredProcessingNeeded])
                {
                  [v20 setDeferredProcessingNeeded:2];
                  +[PLImageWriter _signalBackgroundProcessingNeededForAsset:v20 reason:@"pairing succeeded and asset has adjustments"];
                }
                if (([v20 videoCpVisibilityState] & 1) == 0) {
                  [v20 setVideoCpVisibilityState:[v20 videoCpVisibilityState] | 8];
                }
                v120 = [v20 pathForFullsizeRenderImageFile];
                id v121 = +[PLResourceInstaller onDemand_installAdjustedFullSizeRenderResourceAtFilePath:v120 forAsset:v20];

                id v122 = +[PLResourceInstaller onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:v20];
              }
            }
            if (!v187) {
              goto LABEL_162;
            }
            v123 = [*(id *)(a1 + 72) stringByDeletingLastPathComponent];
            v124 = _photoIrisIndicatorFilePathForPhoto(v123, (uint64_t)v187);
            v125 = PLAssetImportGetLog();
            BOOL v126 = os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT);
            if (v63)
            {
              if (v126)
              {
                v127 = [v186 path];
                v128 = [v20 mainFileURL];
                [v128 path];
                v130 = v129 = v2;
                LODWORD(buf.value) = 138543618;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v127;
                LOWORD(buf.flags) = 2114;
                *(void *)((char *)&buf.flags + 2) = v130;
                v131 = "photoIris video job successfully paired %{public}@ with %{public}@";
LABEL_160:
                _os_log_impl(&dword_19B3C7000, v125, OS_LOG_TYPE_DEFAULT, v131, (uint8_t *)&buf, 0x16u);

                v2 = v129;
                id v19 = v184;
              }
            }
            else if (v126)
            {
              v127 = [v186 path];
              v128 = [v20 mainFileURL];
              [v128 path];
              v130 = v129 = v2;
              LODWORD(buf.value) = 138543618;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v127;
              LOWORD(buf.flags) = 2114;
              *(void *)((char *)&buf.flags + 2) = v130;
              v131 = "photoIris video job failed to pair %{public}@ with %{public}@";
              goto LABEL_160;
            }

            +[PLImageWriter photoIrisPairingDidSucceed:v63 fileIndicatorPath:v124 photoAsset:v20 photoLibrary:*(void *)(a1 + 48)];
            id v5 = v180;
LABEL_162:
            id v9 = 0;
LABEL_163:
            if (([v9 isInserted] & 1) == 0 && objc_msgSend(v9, "isUpdated")) {
              [v9 setNeedsMomentUpdate:1];
            }
            v132 = [*(id *)(a1 + 48) assetURLForPhoto:v9];
            if (v132) {
              [*(id *)(a1 + 32) setObject:v132 forKey:*MEMORY[0x1E4F8C870]];
            }
            if (v9)
            {
              [*(id *)(a1 + 32) setObject:v9 forKey:@"PLImageWriterTransientAsset"];
              v133 = *(void **)(a1 + 112);
              if (v133) {
                [v133 applyCameraMetadataToAsset:v9];
              }
            }
            else
            {
              char v134 = v63 ^ 1;
              if (!v20) {
                char v134 = 1;
              }
              if ((v134 & 1) == 0) {
                [*(id *)(a1 + 32) setObject:v20 forKey:@"PLImageWriterTransientAsset"];
              }
            }
            v135 = [*(id *)(a1 + 32) objectForKey:@"job.private.ClientInLimitedLibraryMode"];
            int v136 = [v135 BOOLValue];

            uint64_t v137 = [*(id *)(a1 + 32) objectForKey:@"job.private.LimitedLibraryClientFetchFilterIdentifier"];
            uint64_t v138 = *(void *)(*(void *)(a1 + 160) + 8);
            v139 = *(void **)(v138 + 40);
            *(void *)(v138 + 40) = v137;

            if (v136
              && [*(id *)(*(void *)(*(void *)(a1 + 160) + 8) + 40) length]
              && ([v5 intValue] == 6 || objc_msgSend(v5, "intValue") == 9))
            {
              v140 = [*(id *)(a1 + 32) objectForKey:@"job.private.LimitedLibraryClientAuthorization"];
              v141 = *(void **)(a1 + 64);
              v142 = [v9 uuid];
              uint64_t v143 = [v141 _processLimitedLibraryAdditionIfNeededWithAssetUUID:v142 clientBundleIdentifier:*(void *)(a1 + 40) clientAuthorization:v140 library:*(void *)(a1 + 48)];
              uint64_t v144 = *(void *)(*(void *)(a1 + 168) + 8);
              v145 = *(void **)(v144 + 40);
              *(void *)(v144 + 40) = v143;
            }
            goto LABEL_181;
          }
        }
        if ([*(id *)(a1 + 56) isEqualToString:v14])
        {
          v60 = (void *)MEMORY[0x1E4F1CB10];
          id v61 = [v182 pathForVideoFile];
          __int16 v62 = [v60 fileURLWithPath:v61 isDirectory:0];

          [v182 setVideoInfoFromFileAtURL:v62 mainFileMetadata:0 fullSizeRenderURL:0 overwriteOriginalProperties:0];
          [v182 generateAndUpdateThumbnailsWithPreviewImage:v179 thumbnailImage:v178 fromImageSource:0 imageData:0 forceSRGBConversion:0];
          id v9 = v182;

          LOBYTE(v63) = 0;
        }
        else
        {
          id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v78 = v77;
          uint64_t v79 = *(void *)(a1 + 40);
          if (v79) {
            [v77 setObject:v79 forKey:*MEMORY[0x1E4F8C880]];
          }
          uint64_t v80 = *(void *)(a1 + 96);
          if (v80) {
            [v78 setObject:v80 forKey:*MEMORY[0x1E4F8C878]];
          }
          if (v183) {
            [v78 setObject:v183 forKey:v3];
          }
          uint64_t v81 = *(void *)(a1 + 104);
          if (v81) {
            [v78 setObject:v81 forKey:*MEMORY[0x1E4F8C8D0]];
          }
          uint64_t v82 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) isDirectory:0];
          id v83 = objc_alloc(MEMORY[0x1E4F8CC48]);
          uint64_t v84 = [*(id *)(a1 + 48) libraryBundle];
          v85 = [v84 timeZoneLookup];
          uint64_t v86 = [v83 initWithAVURL:v82 options:12 timeZoneLookup:v85];

          LOBYTE(v167) = 0;
          LOBYTE(v166) = *(unsigned char *)(a1 + 176);
          v171 = (void *)v82;
          v185 = (void *)v86;
          id v87 = [*(id *)(a1 + 48) addDCIMEntryAtFileURL:v82 mainFileMetadata:v86 previewImage:v179 thumbnailImage:v178 savedAssetType:v57 replacementUUID:v2 publicGlobalUUID:0 extendedInfo:v78 withUUID:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) isPlaceholder:v166 placeholderFileURL:0 forFinalCameraImage:v167];
          id v9 = v87;
          if (v176)
          {
            v88 = [v87 dateCreated];
            BOOL IsApproximatelyEqual = PLDateIsApproximatelyEqual(v176, v88, 0.001);

            if (!IsApproximatelyEqual)
            {
              [v9 didSetCustomDateCreated];
              [v9 setDateCreated:v176];
            }
          }
          if (*(unsigned char *)(a1 + 176))
          {
            v90 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8CA88]];
            uint64_t v91 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8CA80]];
            id v92 = (void *)v91;
            if (v90 && v91)
            {
              objc_msgSend(v9, "setWidth:", objc_msgSend(v90, "longLongValue"));
              objc_msgSend(v9, "setHeight:", objc_msgSend(v92, "longLongValue"));
            }
          }
          if (v19) {
            [v9 setMediaGroupUUID:v19];
          }
          v169 = v2;
          uint64_t v93 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C868]];
          uint64_t v63 = (uint64_t)v93;
          if (v93) {
            objc_msgSend(v9, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", (__int16)objc_msgSend(v93, "intValue"));
          }
          v173 = v78;
          v94 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C860]];
          uint64_t v95 = v94;
          if (v94) {
            objc_msgSend(v9, "setKindSubtype:", (__int16)objc_msgSend(v94, "intValue"));
          }
          char v96 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAC0]];
          v97 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C8B0]];
          double v98 = *MEMORY[0x1E4F1DB30];
          double v99 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          if (v97)
          {
            id v100 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
            uint64_t v101 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
            v102 = (void *)v101;
            if (v100 && v101)
            {
              [v100 floatValue];
              double v98 = v103;
              [v102 floatValue];
              double v99 = v104;
            }
          }
          objc_msgSend((id)objc_opt_class(), "setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:", v9, v185, v96, v97, v177, *(void *)(a1 + 88), v98, v99);
          if (v9)
          {
            id v188 = 0;
            BOOL v105 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v9 assumeNoExistingResources:0 referencedResourceURLs:0 error:&v188];
            id v106 = v188;
            if (!v105)
            {
              v107 = PLAssetImportGetLog();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.value) = 138412546;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
                LOWORD(buf.flags) = 2114;
                *(void *)((char *)&buf.flags + 2) = v106;
                _os_log_impl(&dword_19B3C7000, v107, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %{public}@", (uint8_t *)&buf, 0x16u);
              }
            }
          }

          LOBYTE(v63) = 0;
          v2 = v169;
        }
        id v5 = v180;
        goto LABEL_163;
      }
      if (v22)
      {
        CMTimeValue v108 = *(void *)(a1 + 72);
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = v108;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v187;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ did not find asset with uuid %{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    if (v19)
    {
      v109 = [*(id *)(a1 + 48) managedObjectContext];
      v110 = +[PLManagedAsset imageAssetsForMediaGroupUUID:v19 moc:v109];
      int v20 = [v110 firstObject];

      v111 = PLAssetImportGetLog();
      BOOL v112 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v112)
        {
          CMTimeValue v113 = *(void *)(a1 + 72);
          v114 = [v20 objectID];
          v115 = [v20 uuid];
          LODWORD(buf.value) = 138544130;
          *(CMTimeValue *)((char *)&buf.value + 4) = v113;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v114;
          HIWORD(buf.epoch) = 2114;
          v198 = v115;
          __int16 v199 = 2114;
          v200 = v184;
          _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ found asset %{public}@/%{public}@ with media group UUID %{public}@", (uint8_t *)&buf, 0x2Au);
        }
        BOOL v170 = 0;
        v181 = 0;
        int v172 = 0;
        goto LABEL_190;
      }
      if (v112)
      {
        CMTimeValue v147 = *(void *)(a1 + 72);
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = v147;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v19;
        _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ did not find asset with media group UUID %{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    int v20 = 0;
    if ([*(id *)(a1 + 64) _retryPairedVideoJob:*(void *)(a1 + 32) pairingType:@"live-photo" pairingIdentifier:v187 retryMax:22])
    {
      v146 = 0;
      id v9 = 0;
      goto LABEL_182;
    }
    BOOL v170 = 0;
    int v172 = 0;
    v181 = 0;
    goto LABEL_190;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) length])
  {
LABEL_15:
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:@"kPLImageWriterVideoJobWillRetryKey"];
    goto LABEL_16;
  }
  uint64_t v10 = +[PLManagedAsset assetWithUUID:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) inLibrary:*(void *)(a1 + 48)];
  if (v10)
  {
    id v11 = *(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);

    uint64_t v12 = *(void *)(*(void *)(a1 + 120) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    v2 = v11;
LABEL_14:

    goto LABEL_15;
  }
  if (([*(id *)(a1 + 64) _retryPairedVideoJob:*(void *)(a1 + 32) pairingType:@"timelapse" pairingIdentifier:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) retryMax:8] & 1) == 0)goto LABEL_14; {
LABEL_8:
  }
  id v9 = 0;
LABEL_183:
}

void __45__PLImageWriter__processVideoJob_completion___block_invoke_418(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = v2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v48 = 0;
    char v5 = [v2 removeItemAtPath:v4 error:&v48];
    id v6 = v48;
    if (v5)
    {
      if (!*(void *)(a1 + 40))
      {
LABEL_10:
        uint64_t v14 = *(void **)(a1 + 48);
        int v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) isDirectory:0];
        [v14 _removeInProgressExtendedAttributesForFileAtURL:v15];

        goto LABEL_11;
      }
      id v7 = PLAssetImportGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void **)(a1 + 32);
        *(_DWORD *)CMTime buf = 138412290;
        char v52 = v8;
        id v9 = "#### deleted %@";
        uint64_t v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        uint32_t v12 = 12;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      id v7 = PLAssetImportGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void **)(a1 + 32);
        *(_DWORD *)CMTime buf = 138412546;
        char v52 = v13;
        __int16 v53 = 2112;
        id v54 = v6;
        id v9 = "Failed to delete incoming video %@ : %@";
        uint64_t v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
  {
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    id v49 = @"PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier";
    uint64_t v50 = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [v16 postNotificationName:@"PLLimitedLibraryFetchFiltersUpdatedNotification" object:v17 userInfo:v19];
  }
  uint64_t v20 = *(void *)(a1 + 56);
  if (v20)
  {
    id v47 = 0;
    char v21 = [v3 removeItemAtPath:v20 error:&v47];
    id v22 = v47;
    if ((v21 & 1) == 0)
    {
      CMTimeValue v23 = PLAssetImportGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = *(void **)(a1 + 56);
        *(_DWORD *)CMTime buf = 138412546;
        char v52 = v24;
        __int16 v53 = 2112;
        id v54 = v22;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to delete incoming camera metadata %@ : %@", buf, 0x16u);
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
  {
    uint64_t v25 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F8C938]];
    id v46 = 0;
    char v26 = [v3 removeItemAtPath:v25 error:&v46];
    id v27 = v46;
    char v28 = PLAssetImportGetLog();
    uint64_t v29 = v28;
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CMTime buf = 138412290;
        char v52 = v25;
        uint64_t v30 = "#### deleted %@";
        int v31 = v29;
        os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
        uint32_t v33 = 12;
LABEL_25:
        _os_log_impl(&dword_19B3C7000, v31, v32, v30, buf, v33);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138412546;
      char v52 = v25;
      __int16 v53 = 2112;
      id v54 = v27;
      uint64_t v30 = "Failed to delete incoming filtered video %@ : %@";
      int v31 = v29;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      uint32_t v33 = 22;
      goto LABEL_25;
    }
  }
  if (*(void *)(a1 + 72) && objc_msgSend(v3, "fileExistsAtPath:"))
  {
    uint64_t v34 = *(void *)(a1 + 72);
    id v45 = 0;
    char v35 = [v3 removeItemAtPath:v34 error:&v45];
    id v36 = v45;
    id v37 = PLAssetImportGetLog();
    id v38 = v37;
    if (v35)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        long long v39 = *(void **)(a1 + 72);
        *(_DWORD *)CMTime buf = 138412290;
        char v52 = v39;
        uint64_t v40 = "#### deleted %@";
        char v41 = v38;
        os_log_type_t v42 = OS_LOG_TYPE_DEBUG;
        uint32_t v43 = 12;
LABEL_34:
        _os_log_impl(&dword_19B3C7000, v41, v42, v40, buf, v43);
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void **)(a1 + 72);
      *(_DWORD *)CMTime buf = 138412546;
      char v52 = v44;
      __int16 v53 = 2112;
      id v54 = v36;
      uint64_t v40 = "Failed to delete incoming filtered video preview %@ : %@";
      char v41 = v38;
      os_log_type_t v42 = OS_LOG_TYPE_ERROR;
      uint32_t v43 = 22;
      goto LABEL_34;
    }
  }
  [*(id *)(a1 + 48) _removeTransientKeys:*(void *)(a1 + 64)];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  [*(id *)(a1 + 48) _decrementJobCount:*(void *)(a1 + 64)];
}

- (BOOL)_retryPairedVideoJob:(id)a3 pairingType:(id)a4 pairingIdentifier:(id)a5 retryMax:(unint64_t)a6
{
  *(void *)((char *)&v37[1] + 6) = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 objectForKey:*MEMORY[0x1E4F8CAD8]];
  uint64_t v14 = PLAssetImportGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    uint64_t v16 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:v13];
    *(_DWORD *)CMTime buf = 138544130;
    *(void *)uint64_t v34 = v11;
    *(_WORD *)&v34[8] = 2114;
    *(void *)char v35 = v15;
    *(_WORD *)&v35[8] = 2112;
    *(void *)id v36 = v16;
    *(_WORD *)&v36[8] = 2114;
    v37[0] = v12;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ paired video job %{public}@: %@ did not find asset with uuid %{public}@", buf, 0x2Au);
  }
  uint64_t v17 = [v10 objectForKeyedSubscript:@"kPLImageWriterPairedVideoJobRetryKey"];
  unint64_t v18 = [v17 integerValue];

  if (v18 >= a6)
  {
    BOOL v24 = PLAssetImportGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
      char v26 = v25 = v12;
      id v27 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:v13];
      *(_DWORD *)CMTime buf = 67110146;
      *(_DWORD *)uint64_t v34 = v18;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = a6;
      *(_WORD *)char v35 = 2114;
      *(void *)&v35[2] = v11;
      *(_WORD *)id v36 = 2114;
      *(void *)&v36[2] = v26;
      LOWORD(v37[0]) = 2112;
      *(void *)((char *)v37 + 2) = v27;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Too many retries (%d/%d) for %{public}@ paired video job %{public}@: %@ will save as standalone video asset", buf, 0x2Cu);

      id v12 = v25;
    }
  }
  else
  {
    uint64_t v29 = v12;
    double v19 = _kPLImageWriterPairedVideoJobRetryDelays[v18];
    uint64_t v20 = PLAssetImportGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
      id v22 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:v13];
      *(_DWORD *)CMTime buf = 138544386;
      *(void *)uint64_t v34 = v11;
      *(_WORD *)&v34[8] = 2114;
      *(void *)char v35 = v21;
      *(_WORD *)&v35[8] = 2112;
      *(void *)id v36 = v22;
      *(_WORD *)&v36[8] = 1024;
      LODWORD(v37[0]) = v18 + 1;
      WORD2(v37[0]) = 1024;
      *(_DWORD *)((char *)v37 + 6) = a6;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ paired video job %{public}@: %@ will retry (%d/%d)", buf, 0x2Cu);
    }
    CMTimeValue v23 = [NSNumber numberWithUnsignedInteger:v18 + 1];
    [v10 setObject:v23 forKeyedSubscript:@"kPLImageWriterPairedVideoJobRetryKey"];

    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kPLImageWriterVideoJobWillRetryKey"];
    [(PLImageWriter *)self _incrementJobCount:v10];
    dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
    uint64_t v30 = v11;
    id v31 = v10;
    id v32 = v29;
    id v12 = v29;
    pl_dispatch_after();

    BOOL v24 = v30;
  }

  return v18 < a6;
}

uint64_t __77__PLImageWriter__retryPairedVideoJob_pairingType_pairingIdentifier_retryMax___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138544130;
    id v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-enqueing %{public}@ recovery job %{public}@ with pairing identifier (uuid) %{public}@", (uint8_t *)&v8, 0x2Au);
  }
  [*(id *)(a1 + 56) enqueueJob:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 56) _decrementJobCount:*(void *)(a1 + 40)];
}

- (BOOL)_transferVideoFromIncomingPath:(id)a3 toDestinationPath:(id)a4 shouldRemoveIncoming:(BOOL *)a5 error:(id *)a6
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = a4;
  uint64_t v11 = v10;
  __int16 v12 = 0;
  BOOL v13 = 0;
  char v14 = 0;
  if (!v9 || !v10)
  {
LABEL_5:
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([v9 isEqualToString:v10])
  {
    BOOL v13 = 0;
    char v14 = 0;
    __int16 v12 = 0;
    goto LABEL_5;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F8B900];
  uint64_t v17 = *MEMORY[0x1E4F8C3B8];
  unint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
  [v16 persistString:v11 forKey:v17 fileURL:v18];

  double v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v20 = [v11 stringByDeletingLastPathComponent];
  id v40 = 0;
  LODWORD(v18) = [v19 createDirectoryIfNeededAtPath:v20 error:&v40];
  char v21 = v40;
  if (v18)
  {
    uint64_t v47 = *MEMORY[0x1E4F28370];
    v48[0] = *MEMORY[0x1E4F28358];
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v39 = 0;
    char v23 = [v19 setAttributes:v22 ofItemAtPath:v9 error:&v39];
    BOOL v24 = v39;

    if ((v23 & 1) == 0)
    {
      id v25 = PLAssetImportGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        os_log_type_t v42 = v9;
        __int16 v43 = 2112;
        uint64_t v44 = v24;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
      }
    }
    id v36 = v20;
    id v37 = v19;
    char v26 = PLAssetImportGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CMTime buf = 138412290;
      os_log_type_t v42 = v11;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "#### added destination EA %@", buf, 0xCu);
    }

    id v27 = (void *)MEMORY[0x1E4F8B908];
    char v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    uint64_t v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
    id v38 = v21;
    char v14 = [v27 copyItemAtURL:v28 toURL:v29 error:&v38];
    __int16 v12 = v38;

    uint64_t v30 = PLAssetImportGetLog();
    id v31 = v30;
    if (v14)
    {
      uint64_t v20 = v36;
      double v19 = v37;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CMTime buf = 138412290;
        os_log_type_t v42 = v11;
        id v32 = "#### linked videoIncomingPath to %@";
        uint32_t v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
        uint32_t v35 = 12;
LABEL_25:
        _os_log_impl(&dword_19B3C7000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      uint64_t v20 = v36;
      double v19 = v37;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412802;
        os_log_type_t v42 = v9;
        __int16 v43 = 2112;
        uint64_t v44 = v11;
        __int16 v45 = 2112;
        id v46 = v12;
        id v32 = "Failed to copy %@ to %@: %@";
        uint32_t v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 32;
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
  BOOL v24 = PLAssetImportGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CMTime buf = 138412546;
    os_log_type_t v42 = v20;
    __int16 v43 = 2112;
    uint64_t v44 = v21;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to create directory at %@: %@", buf, 0x16u);
  }
  char v14 = 0;
  __int16 v12 = v21;
LABEL_27:

  BOOL v13 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v13;
LABEL_7:
  if (a6) {
    *a6 = v12;
  }

  return v14;
}

- (void)_processXPCDaemonJob:(id)a3 completion:(id)a4
{
  char v5 = (void (**)(void))a4;
  id v6 = [a3 objectForKey:@"kPLImageWriterDaemonJobEventKey"];
  [v6 runDaemonSide];
  v5[2](v5);
}

- (void)_processDaemonJob:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  int v8 = [v6 objectForKey:@"kPLImageWriterDaemonJobEventKey"];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    +[PLDaemonJob runDaemonSideWithXPCEvent:v8 libraryServicesManager:WeakRetained];
  }
  else
  {
    __int16 v10 = [v6 objectForKey:@"kPLImageWriterDaemonJobRecoveredEventsKey"];
    uint64_t v11 = v10;
    if (v10)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      __int16 v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        char v21 = v11;
        id v22 = v7;
        id v23 = v6;
        uint64_t v15 = *(void *)v25;
        p_libraryServicesManager = &self->_libraryServicesManager;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            double v19 = (void *)MEMORY[0x19F38D3B0]();
            id v20 = objc_loadWeakRetained((id *)p_libraryServicesManager);
            +[PLDaemonJob runDaemonSideWithXPCEvent:v18 libraryServicesManager:v20];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v14);
        id v7 = v22;
        id v6 = v23;
        uint64_t v11 = v21;
      }
    }
    else
    {
      __int16 v12 = PLAssetImportGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 138412290;
        id v29 = v6;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "##### missing event(s) for PLDaemonJob %@", buf, 0xCu);
      }
    }
  }
  v7[2](v7);
}

- (void)_processCrashRecoveryJob:(id)a3 completion:(id)a4
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v130 = a3;
  v128 = (void (**)(void))a4;
  v140 = self;
  location = (id *)&self->_libraryServicesManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v127 = [WeakRetained crashRecoverySupport];

  BOOL v8 = +[PLPhotoLibrary areOpportunisticTasksDisabled];
  unsigned __int8 v9 = [v127 isSafeToRecoverAfterCrash];
  BOOL v10 = [(PLImageWriter *)self _hasNonCrashRecoveryJobsEnqueued];
  if (((v8 | v9 ^ 1 | v10) & 1) != 0
    || ![(PLImageWriter *)v140 _enterAtomicCrashRecoveryJobProcessing])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v16 = v15;
    if (v8)
    {
      [v15 addObject:@"opportunistic tasks are disabled"];
      if (v9)
      {
LABEL_11:
        if (!v10) {
          goto LABEL_12;
        }
        goto LABEL_19;
      }
    }
    else if (v9)
    {
      goto LABEL_11;
    }
    [v16 addObject:@"open camera transaction"];
    if (!v10)
    {
LABEL_12:
      if ((v8 | v9 ^ 1 | v10))
      {
LABEL_14:
        uint64_t v17 = PLAssetImportGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v130 objectForKeyedSubscript:*MEMORY[0x1E4F8C968]];
          double v19 = [v16 componentsJoinedByString:@","];
          *(_DWORD *)CMTime buf = 138543618;
          uint64_t v182 = (uint64_t)v18;
          __int16 v183 = 2114;
          id v184 = v19;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "##### RECOVER: delaying crash recovery job (%{public}@) because: %{public}@", buf, 0x16u);
        }
        id v20 = (void *)[v130 mutableCopy];
        dispatch_time(0, 3000000000);
        uint64_t v172 = MEMORY[0x1E4F143A8];
        uint64_t v173 = 3221225472;
        v174 = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke;
        v175 = &unk_1E5875E40;
        SEL v178 = a2;
        v176 = v20;
        v177 = v140;
        id v21 = v20;
        pl_dispatch_after();
        v128[2]();

        goto LABEL_136;
      }
LABEL_13:
      [v16 addObject:@"crash recovery job already in progress"];
      goto LABEL_14;
    }
LABEL_19:
    [v16 addObject:@"other jobs are still in progress"];
    if ((v8 | v9 ^ 1 | v10)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v11 = PLAssetImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "##### RECOVER: entered crash recovery job processing", buf, 2u);
  }

  uint64_t v144 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v12 = [v130 objectForKey:@"CrashRecoveryFilenamesKey"];
  if (v12)
  {
    uint64_t v13 = [v130 objectForKey:@"CrashRecoveryPhotoStreamFilenamesKey"];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      uint64_t v84 = [MEMORY[0x1E4F28B00] currentHandler];
      [v84 handleFailureInMethod:a2 object:v140 file:@"PLImageWriter.m" lineNumber:2865 description:@"Cannot recover both camera and photostreams in the same job"];
    }
    uint64_t v143 = [MEMORY[0x1E4F8B850] incomingDirectoryPath];
  }
  else
  {
    uint64_t v143 = 0;
  }
  id v22 = PLAssetImportGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v130 objectForKeyedSubscript:*MEMORY[0x1E4F8C968]];
    long long v24 = [v130 objectForKeyedSubscript:@"CrashRecoveryJobCreationDateKey"];
    *(_DWORD *)CMTime buf = 138544130;
    uint64_t v182 = (uint64_t)v23;
    __int16 v183 = 2114;
    id v184 = v24;
    __int16 v185 = 2114;
    id v186 = v143;
    __int16 v187 = 2114;
    id v188 = v12;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Initiating recovery job (#%{public}@) of incoming files (requested at %{public}@) from %{public}@: %{public}@", buf, 0x2Au);
  }
  id v25 = objc_loadWeakRetained(location);
  v117 = [v25 pathManager];

  id v121 = [MEMORY[0x1E4F1CA48] array];
  v119 = [MEMORY[0x1E4F1CA60] dictionary];
  v118 = [MEMORY[0x1E4F1CA60] dictionary];
  v109 = [MEMORY[0x1E4F1CA60] dictionary];
  v132 = [MEMORY[0x1E4F1CA48] array];
  v110 = [MEMORY[0x1E4F1CA48] array];
  v125 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v137 = [MEMORY[0x1E4F1CA48] array];
  int v136 = [MEMORY[0x1E4F1CA48] array];
  v129 = [MEMORY[0x1E4F1CA48] array];
  v135 = [MEMORY[0x1E4F1CA48] array];
  id v122 = [MEMORY[0x1E4F1CA48] array];
  char v134 = [MEMORY[0x1E4F1CA48] array];
  CMTimeValue v108 = [v117 privateDirectoryWithSubType:8 createIfNeeded:1 error:0];
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  obuint64_t j = v12;
  uint64_t v26 = [obj countByEnumeratingWithState:&v168 objects:v180 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v142 = *(void *)v169;
    uint64_t v138 = *MEMORY[0x1E4F8C630];
    uint64_t v133 = *MEMORY[0x1E4F8C640];
    uint64_t v131 = *MEMORY[0x1E4F8C628];
    uint64_t v126 = *MEMORY[0x1E4F8C618];
    uint64_t v124 = *MEMORY[0x1E4F8C610];
    uint64_t v120 = *MEMORY[0x1E4F8C620];
    uint64_t v100 = *MEMORY[0x1E4F8C3B8];
    uint64_t v101 = *MEMORY[0x1E4F8C470];
    uint64_t v99 = *MEMORY[0x1E4F8C3D0];
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v169 != v142) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(void **)(*((void *)&v168 + 1) + 8 * v28);
        uint64_t v30 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v31 = [v143 stringByAppendingPathComponent:v29];
        id v32 = [v29 pathExtension];
        char v167 = 0;
        char v33 = [v144 fileExistsAtPath:v31 isDirectory:&v167];
        if (v167) {
          char v34 = 0;
        }
        else {
          char v34 = v33;
        }
        if (v34)
        {
          if (+[PLPhotoLibrary isVideoFileExtension:v32])
          {
            uint32_t v35 = PFVideoComplementMetadataForVideoAtPath();
            id v36 = [v35 pairingIdentifier];
          }
          else
          {
            id v36 = 0;
          }
          id v37 = [v29 stringByDeletingPathExtension];
          id v38 = [v37 pathExtension];

          int v39 = [v38 isEqualToString:v138];
          if (v39)
          {
            id v40 = [(id)objc_opt_class() _assetUUIDFromIncomingFilename:v29];
            if ([(id)objc_opt_class() _hasPrimaryAssetAndAdjustmentsFilesWithType:0 inIncomingFilenames:obj forAssetUUID:v40])
            {
              [v135 addObject:v31];
              goto LABEL_41;
            }
          }
          char v41 = v137;
          if (v36) {
            goto LABEL_50;
          }
          char v42 = [v32 isEqualToString:@"irs"];
          char v41 = v136;
          if (v42) {
            goto LABEL_50;
          }
          char v43 = [v32 isEqualToString:v133];
          char v41 = v134;
          if (v43) {
            goto LABEL_50;
          }
          char v44 = [v32 isEqualToString:v131];
          char v41 = v132;
          if ((v44 & 1) != 0
            || (v45 = [v32 isEqualToString:v126], char v41 = v129, (v45 & 1) != 0)
            || (v46 = [v32 isEqualToString:v124], char v41 = v125, (v46 & 1) != 0)
            || (v47 = [v32 isEqualToString:v120], char v41 = v122, v47))
          {
LABEL_50:
            [v41 addObject:v31];
            goto LABEL_51;
          }
          if ([v32 isEqualToString:@"plist"]) {
            goto LABEL_51;
          }
          id v40 = [(id)objc_opt_class() _assetUUIDFromIncomingFilename:v29];
          if (v40)
          {
            v111 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v31 isDirectory:0];
            BOOL v112 = +[PLManagedAsset uniformTypeIdentifierFromPathExtension:v32 assetType:3];
            int v105 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:v112];

            if (v105 == 1) {
              [MEMORY[0x1E4F16468] consolidateMovieFragmentsInFile:v111 error:0];
            }
            v102 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v111];
            id v106 = [v102 UUIDStringForKey:v101];
            if (v106)
            {
              BOOL v103 = 0;
            }
            else
            {
              if (v39)
              {
                id v49 = [MEMORY[0x1E4F29128] UUID];
                uint64_t v107 = [v49 UUIDString];

                id v50 = (id)v107;
              }
              else
              {
                id v50 = v40;
              }
              id v106 = v50;
              BOOL v103 = v50 != 0;
            }
            uint64_t v51 = PLAssetImportGetLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138543618;
              uint64_t v182 = (uint64_t)v106;
              __int16 v183 = 2114;
              id v184 = v29;
              _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assetUUID %{public}@ (%{public}@)", buf, 0x16u);
            }

            CMTimeValue v113 = [v102 stringForKey:v100];
            char v52 = PLAssetImportGetLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138543362;
              uint64_t v182 = (uint64_t)v113;
              _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "##### RECOVER: destinationPath EA %{public}@", buf, 0xCu);
            }

            if (v113)
            {
              [v109 setObject:v113 forKeyedSubscript:v40];
              goto LABEL_88;
            }
            uint64_t v53 = [(PLImageWriter *)v140 cameraAssetPathForNewAssetWithExtension:v32 assetUUID:v106];
            [v109 setObject:v53 forKeyedSubscript:v40];
            if (+[PLPhotoLibrary isImageFileExtension:v32])
            {
              id v94 = (id)v53;
              id v96 = objc_alloc(MEMORY[0x1E4F8CC48]);
              id v114 = objc_loadWeakRetained(location);
              v90 = [v114 libraryBundle];
              id v54 = [v90 timeZoneLookup];
              v97 = (void *)[v96 initWithImageURL:v111 contentType:0 timeZoneLookup:v54];

              if ([v97 isDeferredPhotoProxy]
                && ([v97 deferredPhotoProcessingIdentifier],
                    (uint64_t v91 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v115 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v94 isDirectory:0];
                uint64_t v55 = +[PLPhotoLibrary deferredPhotoPreviewDestinationURLForPrimaryAssetURL:v115];
                uint64_t v86 = [v55 path];

                uint64_t v56 = PLAssetImportGetLog();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 138543362;
                  uint64_t v182 = v86;
                  _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assigning deferred path %{public}@", buf, 0xCu);
                }

                int v57 = 0;
                id v94 = (id)v86;
              }
              else
              {
                uint64_t v91 = 0;
                int v57 = 1;
              }
              int v166 = -1;
              [v102 getInt32:&v166 forKey:v99];
              if ((v57 & [(id)objc_opt_class() semanticEnhanceSceneIsValid:v166]) == 1)
              {
                id v87 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v94 isDirectory:0];
                CFDictionaryRef v59 = +[PLImageWriter semanticEnhancePreviewDestinationURLForPrimaryAssetURL:v87];
                uint64_t v116 = [v59 path];

                v60 = PLAssetImportGetLog();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 138543362;
                  uint64_t v182 = v116;
                  _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assigning SemDev deferred path %{public}@", buf, 0xCu);
                }
              }
              else
              {
                uint64_t v116 = (uint64_t)v94;
              }

              CFDictionaryRef v58 = (void *)v116;
            }
            else
            {
              CFDictionaryRef v58 = (void *)v53;
            }
            if (v58)
            {
              CMTimeValue v113 = v58;
              [MEMORY[0x1E4F8B900] persistString:v58 forKey:v100 fileURL:v111];
LABEL_88:
              if (v103) {
                [MEMORY[0x1E4F8B900] persistUUIDString:v106 forKey:v101 fileURL:v111];
              }
              float v104 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v113 isDirectory:0];
              id v61 = PLAssetImportGetLog();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMTime buf = 138543618;
                uint64_t v182 = (uint64_t)v31;
                __int16 v183 = 2114;
                id v184 = v113;
                _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "##### RECOVER: source %{public}@ -> destination %{public}@", buf, 0x16u);
              }

              if ([v144 fileExistsAtPath:v113])
              {
LABEL_97:
                int v65 = [v31 stringByDeletingPathExtension];
                id v63 = [v65 stringByAppendingPathExtension:v131];

                if ([v144 fileExistsAtPath:v63])
                {
                  double v98 = [v31 lastPathComponent];
                  id v66 = [v108 stringByAppendingPathComponent:v98];
                  if (v63 && v66)
                  {
                    id v95 = v66;
                    v88 = (void *)MEMORY[0x1E4F8B908];
                    id v92 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v63 isDirectory:0];
                    int v67 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v95 isDirectory:0];
                    id v164 = 0;
                    char v85 = [v88 copyItemAtURL:v92 toURL:v67 error:&v164];
                    id v89 = v164;

                    if ((v85 & 1) == 0 && ([v144 fileExistsAtPath:v95] & 1) == 0)
                    {
                      uint64_t v93 = PLAssetImportGetLog();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                      {
                        int v68 = [v89 localizedDescription];
                        *(_DWORD *)CMTime buf = 138543874;
                        uint64_t v182 = (uint64_t)v63;
                        __int16 v183 = 2114;
                        id v184 = v95;
                        __int16 v185 = 2114;
                        id v186 = v68;
                        _os_log_impl(&dword_19B3C7000, v93, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
                      }
                    }

                    id v66 = v95;
                  }
                }
                [v118 setObject:v111 forKey:v104];
                [v121 addObject:v104];
              }
              else
              {
                id v165 = 0;
                char v62 = [MEMORY[0x1E4F8B908] copyItemAtURL:v111 toURL:v104 error:&v165];
                id v63 = v165;
                if (v62)
                {
                  id v64 = PLAssetImportGetLog();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)CMTime buf = 138543618;
                    uint64_t v182 = (uint64_t)v31;
                    __int16 v183 = 2114;
                    id v184 = v113;
                    _os_log_impl(&dword_19B3C7000, v64, OS_LOG_TYPE_DEBUG, "##### RECOVER: copied %{public}@ to %{public}@", buf, 0x16u);
                  }

                  goto LABEL_97;
                }
                BOOL v69 = PLAssetImportGetLog();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)CMTime buf = 138543874;
                  uint64_t v182 = (uint64_t)v31;
                  __int16 v183 = 2114;
                  id v184 = v113;
                  __int16 v185 = 2114;
                  id v186 = v63;
                  _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
                }
              }
            }
            else
            {
              int v70 = PLAssetImportGetLog();
              CMTimeValue v113 = v70;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMTime buf = 138543362;
                uint64_t v182 = (uint64_t)v29;
                _os_log_impl(&dword_19B3C7000, v70, OS_LOG_TYPE_DEFAULT, "##### RECOVER: skipping %{public}@, missing destinationPath", buf, 0xCu);
              }
            }
          }
          else
          {
            id v48 = PLAssetImportGetLog();
            v111 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138543362;
              uint64_t v182 = (uint64_t)v31;
              _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Ignoring malformed incoming filename with path %{public}@", buf, 0xCu);
            }
          }

LABEL_41:
LABEL_51:

          goto LABEL_52;
        }
        id v36 = PLAssetImportGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 138543362;
          uint64_t v182 = (uint64_t)v31;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Skipping missing file %{public}@", buf, 0xCu);
        }
LABEL_52:

        ++v28;
      }
      while (v27 != v28);
      uint64_t v71 = [obj countByEnumeratingWithState:&v168 objects:v180 count:16];
      uint64_t v27 = v71;
    }
    while (v71);
  }

  if ([v121 count] || objc_msgSend(v119, "count"))
  {
    [(PLImageWriter *)v140 _incrementJobCount:v130];
    id v72 = objc_loadWeakRetained(location);
    __int16 v73 = [v72 modelMigrator];
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_363;
    v150[3] = &unk_1E5863640;
    id v151 = v118;
    id v152 = v144;
    v153 = v140;
    id v154 = v110;
    id v155 = v125;
    id v156 = v136;
    id v157 = v137;
    id v158 = v129;
    id v159 = v135;
    id v160 = v134;
    id v161 = v122;
    v163 = v128;
    id v162 = v130;
    [v73 importAfterCrash:v121 dictionariesByPhotoStreamID:v119 completionBlock:v150];

    int v139 = 0;
  }
  else
  {
    [(PLImageWriter *)v140 _handleAvalancheCrashRecovery:v125];
    [(PLImageWriter *)v140 _handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:v136];
    [(PLImageWriter *)v140 _handlePhotoIrisCrashRecoveryForVideos:v137];
    [(PLImageWriter *)v140 _handleCameraAdjustments:v129 fullsizeRenders:v135 largeThumbnails:v134];
    [(PLImageWriter *)v140 _handleCameraMetadataCrashRecovery:v122];
    int v139 = 1;
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v74 = v132;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v146 objects:v179 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v147 != v76) {
          objc_enumerationMutation(v74);
        }
        id v78 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        id v145 = 0;
        char v79 = [v144 removeItemAtPath:v78 error:&v145];
        id v80 = v145;
        if ((v79 & 1) == 0)
        {
          uint64_t v81 = PLAssetImportGetLog();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            uint64_t v82 = [v80 localizedDescription];
            *(_DWORD *)CMTime buf = 138543618;
            uint64_t v182 = (uint64_t)v78;
            __int16 v183 = 2114;
            id v184 = v82;
            _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_ERROR, "Failed to unlink file at path %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v75 = [v74 countByEnumeratingWithState:&v146 objects:v179 count:16];
    }
    while (v75);
  }

  if (v139) {
    v128[2]();
  }

  [(PLImageWriter *)v140 _exitAtomicCrashRecoveryJobProcessing];
  id v83 = PLAssetImportGetLog();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_19B3C7000, v83, OS_LOG_TYPE_DEFAULT, "##### RECOVER: exited crash recovery job processing", buf, 2u);
  }

LABEL_136:
}

uint64_t __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    char v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8C968]];
    int v7 = 138543874;
    BOOL v8 = v3;
    __int16 v9 = 2114;
    BOOL v10 = v4;
    __int16 v11 = 2114;
    __int16 v12 = v5;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-enqueing crash recovery job %{public}@ (#%{public}@)", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(a1 + 40) enqueueJob:*(void *)(a1 + 32)];
}

void __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_363(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLAssetImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = *(void **)(a1 + 32);
    *(_DWORD *)CMTime buf = 138543362;
    uint64_t v53 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Deleting %{public}@", buf, 0xCu);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  obuint64_t j = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v38 = *(void *)v48;
    *(void *)&long long v7 = 138543618;
    long long v36 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        __int16 v11 = objc_msgSend(v10, "mainFileURL", v36);
        __int16 v12 = [*(id *)(a1 + 32) objectForKey:v11];
        uint64_t v13 = *(void **)(a1 + 40);
        id v46 = 0;
        char v14 = [v13 removeItemAtURL:v12 error:&v46];
        id v15 = v46;
        if ((v14 & 1) == 0)
        {
          uint64_t v16 = PLAssetImportGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = [v12 path];
            *(_DWORD *)CMTime buf = v36;
            uint64_t v53 = v17;
            __int16 v54 = 2112;
            id v55 = v15;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "##### RECOVER: Failed to remove asset source URL:%{public}@ %@", buf, 0x16u);
          }
        }
        uint64_t v18 = *(void **)(a1 + 40);
        double v19 = [v12 URLByDeletingPathExtension];
        id v20 = [v19 URLByAppendingPathExtension:@"plist"];
        [v18 removeItemAtURL:v20 error:0];

        [*(id *)(a1 + 48) _removeInProgressExtendedAttributesForFileAtURL:v11];
        if ([v10 hasDeferredProcessingPreviewFile])
        {
          id v21 = (void *)MEMORY[0x1E4F1CB10];
          id v22 = [v10 pathForDeferredProcessingPreviewFile];
          id v23 = [v21 fileURLWithPath:v22];

          [*(id *)(a1 + 48) _removeInProgressExtendedAttributesForFileAtURL:v23];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v8);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_364;
  v44[3] = &unk_1E5863618;
  long long v24 = *(void **)(a1 + 32);
  id v45 = *(id *)(a1 + 40);
  [v24 enumerateKeysAndObjectsUsingBlock:v44];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = *(id *)(a1 + 56);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        if ([*(id *)(a1 + 40) fileExistsAtPath:v30])
        {
          uint64_t v31 = *(void **)(a1 + 40);
          id v39 = 0;
          char v32 = [v31 removeItemAtPath:v30 error:&v39];
          id v33 = v39;
          if ((v32 & 1) == 0)
          {
            char v34 = PLAssetImportGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint32_t v35 = [v33 localizedDescription];
              *(_DWORD *)CMTime buf = 138543618;
              uint64_t v53 = v30;
              __int16 v54 = 2114;
              id v55 = v35;
              _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to unlink file at path %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v27);
  }

  [*(id *)(a1 + 48) _handleAvalancheCrashRecovery:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) _handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:*(void *)(a1 + 72)];
  [*(id *)(a1 + 48) _handlePhotoIrisCrashRecoveryForVideos:*(void *)(a1 + 80)];
  [*(id *)(a1 + 48) _handleCameraAdjustments:*(void *)(a1 + 88) fullsizeRenders:*(void *)(a1 + 96) largeThumbnails:*(void *)(a1 + 104)];
  [*(id *)(a1 + 48) _handleCameraMetadataCrashRecovery:*(void *)(a1 + 112)];
  (*(void (**)(void))(*(void *)(a1 + 128) + 16))();
  [*(id *)(a1 + 48) _decrementJobCount:*(void *)(a1 + 120)];
}

void __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_364(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(void **)(a1 + 32);
  id v16 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v16];
  id v9 = v16;
  if ((v8 & 1) == 0)
  {
    BOOL v10 = PLAssetImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = [v6 path];
      __int16 v12 = [v5 path];
      *(_DWORD *)CMTime buf = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "##### RECOVER: Failed to remove URL %{public}@, registered to unlink by recovery URL:%{public}@ %@", buf, 0x20u);
    }
  }
  uint64_t v13 = *(void **)(a1 + 32);
  char v14 = [v6 URLByDeletingPathExtension];
  id v15 = [v14 URLByAppendingPathExtension:@"plist"];
  [v13 removeItemAtURL:v15 error:0];
}

- (void)_exitAtomicCrashRecoveryJobProcessing
{
}

- (BOOL)_enterAtomicCrashRecoveryJobProcessing
{
  return (atomic_exchange(&self->_isCrashRecoveryJobInProgress._Value, 1u) & 1) == 0;
}

- (void)_handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:]");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PLImageWriter__handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles___block_invoke;
    v7[3] = &unk_1E5875E18;
    id v8 = v4;
    id v9 = v5;
    id v6 = v5;
    [v6 performTransactionAndWait:v7];
  }
}

void __69__PLImageWriter__handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        +[PLImageWriter photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:](PLImageWriter, "photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:", 0, *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  long long v8 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v9 = [a3 cameraMetadata];
  id v15 = 0;
  long long v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v15];
  id v11 = v15;

  id v14 = v11;
  LOBYTE(v9) = [v10 writeToURL:v7 options:1 error:&v14];
  id v12 = v14;

  if ((v9 & 1) == 0)
  {

    id v7 = 0;
  }
  if (a5 && v12) {
    *a5 = v12;
  }

  return v12 == 0;
}

- (void)_handleCameraAdjustments:(id)a3 fullsizeRenders:(id)a4 largeThumbnails:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:v8];
  id v45 = v9;
  id v12 = [(id)objc_opt_class() _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:v9];
  uint64_t v13 = [(id)objc_opt_class() _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:v10];
  id v46 = v8;
  id v14 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  char v44 = v10;
  id v15 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
  id v16 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]");
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __74__PLImageWriter__handleCameraAdjustments_fullsizeRenders_largeThumbnails___block_invoke;
  v58[3] = &unk_1E586E860;
  id v43 = v11;
  id v59 = v43;
  id v42 = v12;
  id v60 = v42;
  id v41 = v13;
  id v61 = v41;
  id v39 = v15;
  id v62 = v39;
  id v17 = v14;
  id v63 = v17;
  id v64 = v16;
  int v65 = self;
  id v40 = v64;
  [v64 performTransactionAndWait:v58];
  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v55;
    do
    {
      uint64_t v23 = 0;
      long long v24 = v21;
      do
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v54 + 1) + 8 * v23);
        uint64_t v26 = PLAssetImportGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 136446466;
          int v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
          __int16 v69 = 2114;
          uint64_t v70 = v25;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s Removing orphaned adjustment file %{public}@", buf, 0x16u);
        }

        id v53 = v24;
        char v27 = objc_msgSend(v18, "removeItemAtPath:error:", v25, &v53, v39);
        id v21 = v53;

        if ((v27 & 1) == 0)
        {
          uint64_t v28 = PLAssetImportGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 136446722;
            int v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
            __int16 v69 = 2114;
            uint64_t v70 = v25;
            __int16 v71 = 2114;
            id v72 = v21;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%{public}s Error removing orphaned adjustment file %{public}@: %{public}@", buf, 0x20u);
          }
        }
        ++v23;
        long long v24 = v21;
      }
      while (v20 != v23);
      uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v20);
  }
  else
  {
    id v21 = 0;
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v29 = v39;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v66 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v50;
    do
    {
      uint64_t v33 = 0;
      char v34 = v21;
      do
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void *)(*((void *)&v49 + 1) + 8 * v33);
        long long v36 = PLAssetImportGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 136446466;
          int v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
          __int16 v69 = 2114;
          uint64_t v70 = v35;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s Removing orphaned large thumbnail file %{public}@", buf, 0x16u);
        }

        id v48 = v34;
        char v37 = [v18 removeItemAtPath:v35 error:&v48];
        id v21 = v48;

        if ((v37 & 1) == 0)
        {
          uint64_t v38 = PLAssetImportGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 136446722;
            int v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
            __int16 v69 = 2114;
            uint64_t v70 = v35;
            __int16 v71 = 2114;
            id v72 = v21;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "%{public}s Error removing orphaned large thumbnail file file %{public}@: %{public}@", buf, 0x20u);
          }
        }
        ++v33;
        char v34 = v21;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v66 count:16];
    }
    while (v31);
  }
}

void __74__PLImageWriter__handleCameraAdjustments_fullsizeRenders_largeThumbnails___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v19 = *(void *)v22;
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
        if (v9
          || ([*(id *)(a1 + 48) objectForKeyedSubscript:v7],
              (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          [*(id *)(a1 + 56) removeObject:v9];
        }
        [*(id *)(a1 + 64) removeObject:v8];
        id v10 = +[PLManagedAsset assetWithUUID:v7 inLibrary:*(void *)(a1 + 72)];
        id v11 = PLAssetImportGetLog();
        id v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 136446978;
            uint64_t v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
            __int16 v27 = 2114;
            uint64_t v28 = v7;
            __int16 v29 = 2114;
            uint64_t v30 = v9;
            __int16 v31 = 2114;
            uint64_t v32 = v8;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s Applying render & adjustment to asset %{public}@ (%{public}@, %{public}@)", buf, 0x2Au);
          }

          LOBYTE(v17) = 1;
          if ((objc_msgSend((id)objc_opt_class(), "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v10, 0, 0, v8, v9, 0, v4, v5, v17) & 1) == 0)
          {
            uint64_t v13 = PLAssetImportGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 136446466;
              uint64_t v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
              __int16 v27 = 2114;
              uint64_t v28 = v7;
              _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "%{public}s Failed to apply adjustment to asset %{public}@", buf, 0x16u);
            }
          }
          id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v20 = 0;
          char v15 = [v14 removeItemAtPath:v8 error:&v20];
          id v12 = v20;

          if ((v15 & 1) == 0)
          {
            id v16 = PLAssetImportGetLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 136446722;
              uint64_t v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
              __int16 v27 = 2114;
              uint64_t v28 = v8;
              __int16 v29 = 2114;
              uint64_t v30 = v7;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%{public}s Failed to remove adjustment path %{public}@ for asset %{public}@", buf, 0x20u);
            }
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 136446722;
          uint64_t v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
          __int16 v27 = 2114;
          uint64_t v28 = v7;
          __int16 v29 = 2114;
          uint64_t v30 = v9;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "%{public}s Failed to find required, preflighted asset with UUID %{public}@, deferring orphaned render ingestion for %{public}@", buf, 0x20u);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v3);
  }
}

- (void)_handlePhotoIrisCrashRecoveryForVideos:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handlePhotoIrisCrashRecoveryForVideos:]");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke;
    v14[3] = &unk_1E5870A08;
    id v15 = v5;
    id v8 = v7;
    id v16 = v8;
    uint64_t v17 = self;
    SEL v19 = a2;
    id v9 = v6;
    id v18 = v9;
    [v8 performBlockAndWait:v14];
    if ([v9 count])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke_320;
      v10[3] = &unk_1E5875E40;
      id v12 = self;
      SEL v13 = a2;
      id v11 = v9;
      [v8 performBlockAndWait:v10];
    }
  }
}

void __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v45;
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v35 = (void *)*MEMORY[0x1E4F8C9D8];
    uint64_t v32 = *MEMORY[0x1E4F8C970];
    uint64_t v31 = *MEMORY[0x1E4F8CAD8];
    uint64_t v30 = *MEMORY[0x1E4F8CA40];
    uint64_t v29 = *MEMORY[0x1E4F8CA60];
    uint64_t v28 = *MEMORY[0x1E4F8CA70];
    uint64_t v27 = *MEMORY[0x1E4F8CA68];
    CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v34 = v1;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(obj);
        }
        double v4 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v5 = PFVideoComplementMetadataForVideoAtPath();
        uint64_t v6 = [v5 pairingIdentifier];
        id v41 = v5;
        if (v5)
        {
          [v5 videoDuration];
          CFDictionaryRef v7 = CMTimeCopyAsDictionary(&time, v2);
          [v5 imageDisplayTime];
        }
        else
        {
          memset(&time, 0, sizeof(time));
          CFDictionaryRef v7 = CMTimeCopyAsDictionary(&time, v2);
          memset(&v42, 0, sizeof(v42));
        }
        CFDictionaryRef v8 = CMTimeCopyAsDictionary(&v42, v2);
        id v9 = [*(id *)(v1 + 40) managedObjectContext];
        id v10 = +[PLManagedAsset imageAssetsForMediaGroupUUID:v6 moc:v9];
        [v10 firstObject];
        id v12 = v11 = v2;

        SEL v13 = v12;
        if (v12)
        {
          uint64_t v38 = v12;
          [v12 uuid];
          v15 = CFDictionaryRef v14 = v7;
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v16 setObject:v35 forKeyedSubscript:v32];
          [v16 setObject:v4 forKeyedSubscript:v31];
          [v16 setObject:v15 forKeyedSubscript:v30];
          [v16 setObject:v6 forKeyedSubscript:v29];
          CFDictionaryRef v40 = v14;
          [v16 setObject:v14 forKeyedSubscript:v28];
          CFDictionaryRef v39 = v8;
          [v16 setObject:v8 forKeyedSubscript:v27];
          uint64_t v17 = objc_opt_class();
          id v18 = [v4 lastPathComponent];
          SEL v19 = [v17 _assetUUIDFromIncomingFilename:v18];

          id v20 = v41;
          if (!v19)
          {
            long long v21 = PLAssetImportGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138543362;
              long long v49 = v4;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Encountered malformed incoming photo iris filename with path %{public}@, ignoring", buf, 0xCu);
            }
          }
          long long v22 = PLAssetImportGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 138543874;
            long long v49 = v4;
            __int16 v50 = 2114;
            long long v51 = v6;
            __int16 v52 = 2114;
            id v53 = v15;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "##### RECOVER: enqueue job for photoIris video %{public}@, mediaGroupUUID %{public}@, assetUUID %{public}@", buf, 0x20u);
          }

          long long v23 = PLAssetImportGetLog();
          uint64_t v1 = v34;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            long long v24 = NSStringFromSelector(*(SEL *)(v34 + 64));
            *(_DWORD *)CMTime buf = 138543874;
            long long v49 = v24;
            __int16 v50 = 2114;
            long long v51 = v35;
            __int16 v52 = 2114;
            id v53 = v15;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job %{public}@ with assetUUID %{public}@", buf, 0x20u);
          }
          [*(id *)(v34 + 48) enqueueJob:v16];

          CFAllocatorRef v2 = v33;
          CFDictionaryRef v8 = v39;
          CFDictionaryRef v7 = v40;
          SEL v13 = v38;
        }
        else
        {
          uint64_t v25 = PLAssetImportGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 138543362;
            long long v49 = v4;
            _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Found orphaned incoming photo iris video: %{public}@", buf, 0xCu);
          }

          [*(id *)(v1 + 56) addObject:v4];
          CFAllocatorRef v2 = v11;
          id v20 = v41;
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v37);
  }
}

void __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke_320(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    uint64_t v19 = *MEMORY[0x1E4F8C9D8];
    uint64_t v5 = *MEMORY[0x1E4F8C970];
    uint64_t v6 = *MEMORY[0x1E4F8CAD8];
    unint64_t v7 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v10 = objc_alloc_init(*(Class *)(v7 + 2656));
        [v10 setObject:v19 forKeyedSubscript:v5];
        [v10 setObject:v9 forKeyedSubscript:v6];
        CFAllocatorRef v11 = PLAssetImportGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(*(SEL *)(v1 + 48));
          uint64_t v12 = v1;
          uint64_t v13 = v3;
          uint64_t v14 = v6;
          uint64_t v15 = v5;
          v17 = uint64_t v16 = v4;
          *(_DWORD *)CMTime buf = 138543874;
          uint64_t v25 = v17;
          __int16 v26 = 2114;
          uint64_t v27 = v19;
          __int16 v28 = 2114;
          uint64_t v29 = v9;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job %{public}@ with orphaned iris video %{public}@", buf, 0x20u);

          uint64_t v4 = v16;
          uint64_t v5 = v15;
          uint64_t v6 = v14;
          uint64_t v3 = v13;
          uint64_t v1 = v12;
          unint64_t v7 = 0x1E4F1C000;
        }

        [*(id *)(v1 + 40) enqueueJob:v10];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v3);
  }
}

- (void)_handleCameraMetadataCrashRecovery:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleCameraMetadataCrashRecovery:]");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PLImageWriter__handleCameraMetadataCrashRecovery___block_invoke;
    v7[3] = &unk_1E5873A50;
    id v8 = v4;
    uint64_t v9 = self;
    id v10 = v5;
    id v6 = v5;
    [v6 performTransactionAndWait:v7];
  }
}

void __52__PLImageWriter__handleCameraMetadataCrashRecovery___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v4 = (void *)MEMORY[0x19F38D3B0]();
        id v5 = [v3 lastPathComponent];
        id v6 = [(id)objc_opt_class() _assetUUIDFromIncomingFilename:v5];
        if ([v6 length])
        {
          unint64_t v7 = +[PLManagedAsset assetWithUUID:v6 inLibrary:*(void *)(a1 + 48)];
          if (v7
            && ([MEMORY[0x1E4F28CB8] defaultManager],
                id v8 = objc_claimAutoreleasedReturnValue(),
                int v9 = [v8 fileExistsAtPath:v3],
                v8,
                v9))
          {
            id v10 = PLAssetImportGetLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138412546;
              id v37 = v3;
              __int16 v38 = 2112;
              CFDictionaryRef v39 = v6;
              _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Handling camera metadata %@ -> %@", buf, 0x16u);
            }

            CFAllocatorRef v11 = [[PLIngestJobCameraMetadata alloc] initWithCameraMetadataPath:v3];
            [(PLIngestJobCameraMetadata *)v11 applyCameraMetadataToAsset:v7];
            uint64_t v12 = [v7 additionalAttributes];
            char v13 = [v12 deferredProcessingCandidateOptions];

            if ((v13 & 8) != 0)
            {
              uint64_t v14 = (void *)MEMORY[0x1E4F8CD68];
              uint64_t v15 = [(PLIngestJobCameraMetadata *)v11 cameraMetadata];
              uint64_t v16 = [v14 semanticEnhanceSceneForCameraMetadata:v15];
              double v18 = v17;

              uint64_t v19 = [(PLIngestJobCameraMetadata *)v11 cameraMetadata];
              [v19 setSemanticEnhanceScene:v16];

              long long v20 = [(PLIngestJobCameraMetadata *)v11 cameraMetadata];
              [v20 setSemanticEnhanceSceneConfidence:v18];

              long long v21 = (void *)MEMORY[0x1E4F1CB10];
              uint64_t v22 = [v7 pathForCameraMetadataFile];
              uint64_t v23 = [v21 fileURLWithPath:v22];

              long long v24 = *(void **)(a1 + 40);
              id v31 = 0;
              uint64_t v27 = (void *)v23;
              LOBYTE(v22) = [v24 _writeOutCameraMetadata:v11 destinationURL:v23 error:&v31];
              id v25 = v31;
              if ((v22 & 1) == 0)
              {
                __int16 v26 = PLAssetImportGetLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 138412290;
                  id v37 = v25;
                  _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Error writing out camera metadata: %@", buf, 0xCu);
                }
              }
            }
          }
          else
          {
            PLAssetImportGetLog();
            CFAllocatorRef v11 = (PLIngestJobCameraMetadata *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 138412290;
              id v37 = v3;
              _os_log_impl(&dword_19B3C7000, &v11->super, OS_LOG_TYPE_DEFAULT, "##### RECOVER: MDATA file no longer found: %@", buf, 0xCu);
            }
          }
        }
        unlink((const char *)[v3 fileSystemRepresentation]);
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v30);
  }
}

- (void)_handleAvalancheCrashRecovery:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleAvalancheCrashRecovery:]");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PLImageWriter__handleAvalancheCrashRecovery___block_invoke;
    v7[3] = &unk_1E5875E18;
    id v8 = v4;
    id v9 = v5;
    id v6 = v5;
    [v6 performTransactionAndWait:v7];
  }
}

void __47__PLImageWriter__handleAvalancheCrashRecovery___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    id v5 = off_1E585E000;
    do
    {
      uint64_t v6 = 0;
      uint64_t v18 = v3;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x19F38D3B0]();
        id v9 = [v7 lastPathComponent];
        id v10 = [v9 stringByDeletingPathExtension];

        if ([v10 length])
        {
          CFAllocatorRef v11 = (void *)[objc_alloc(v5[49]) initWithUUID:v10 photoLibrary:*(void *)(v1 + 40)];
          uint64_t v12 = PLAssetImportGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            [v11 assets];
            uint64_t v13 = v4;
            uint64_t v14 = v1;
            v16 = uint64_t v15 = v5;
            uint64_t v17 = [v16 count];
            *(_DWORD *)CMTime buf = 138412546;
            id v25 = v10;
            __int16 v26 = 2048;
            uint64_t v27 = v17;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Handling avalanche %@ -> %lu", buf, 0x16u);

            id v5 = v15;
            uint64_t v1 = v14;
            uint64_t v4 = v13;
            uint64_t v3 = v18;
          }

          [v11 applyChangesAndDeleteNonPicks:0 currentContainer:0 completionHandler:0];
        }
        unlink((const char *)[v7 fileSystemRepresentation]);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v3);
  }
}

- (void)_processSyncClientSaveJobsJob:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  uint64_t v10 = [WeakRetained pathManager];
  CFAllocatorRef v11 = [(id)v10 iTunesSyncedAssetsDirectory];
  uint64_t v12 = [v8 fileURLWithPath:v11 isDirectory:1];

  id v34 = 0;
  LOBYTE(v10) = [v12 getResourceValue:&v34 forKey:*MEMORY[0x1E4F1C5C0] error:0];
  id v13 = v34;
  if ((v10 & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v33 = 0;
    char v15 = [v14 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v16 = v33;

    if ((v15 & 1) == 0)
    {
      uint64_t v17 = PLSyncGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138543362;
        id v36 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to create dir: %{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v18 = [v6 objectForKey:@"SyncClientJobsData"];
  uint64_t v19 = PLSyncGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [v18 count];
    *(_DWORD *)CMTime buf = 67109120;
    LODWORD(v36) = v20;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Processing %d sync save jobs", buf, 8u);
  }

  id v21 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processSyncClientSaveJobsJob:completion:]");
  [(PLImageWriter *)self _incrementJobCount:v6];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke;
  v29[3] = &unk_1E5873A50;
  id v30 = v18;
  id v31 = self;
  id v32 = v21;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke_2;
  v26[3] = &unk_1E5874868;
  id v27 = v6;
  id v28 = v7;
  v26[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v24 = v21;
  id v25 = v18;
  [v24 performTransaction:v29 completionHandler:v26];
}

void __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [[PLSyncSaveJob alloc] initFromSerializedData:*(void *)(*((void *)&v20 + 1) + 8 * v7)];
        [a1[5] processSyncSaveJob:v8 library:a1[6] albumMap:v2];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(v2, "allValues", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        char v15 = [a1[6] pathManager];
        [v14 persistMetadataToFileSystemWithPathManager:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

uint64_t __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _decrementJobCount:v3];
}

- (void)cleanupFilesInLibrary:(id)a3 afteriTunesSyncBeforeDate:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v76 = a4;
  __int16 v71 = v5;
  uint64_t v6 = [v5 globalValues];
  LODWORD(v5) = [v6 didImportFileSystemAssets];

  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
    id v8 = +[PLManagedAsset entityName];
    id v9 = [v7 fetchRequestWithEntityName:v8];

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 1);
    [v9 setPredicate:v10];

    [v9 setFetchLimit:1];
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2020000000;
    uint64_t v104 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = [v71 managedObjectContext];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __65__PLImageWriter_cleanupFilesInLibrary_afteriTunesSyncBeforeDate___block_invoke;
    void v97[3] = &unk_1E5875340;
    uint64_t v100 = &v101;
    id v98 = v11;
    id v68 = v9;
    id v69 = v98;
    id v99 = v68;
    [v98 performBlockAndWait:v97];
    uint64_t v12 = PLSyncGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138543362;
      v109 = v76;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up iTunes sync thumb files (before date %{public}@)", buf, 0xCu);
    }

    id v77 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    uint64_t v14 = [WeakRetained pathManager];
    char v15 = [v14 iTunesPhotosDirectory];
    uint64_t v75 = [v15 stringByAppendingPathComponent:@"Thumbs"];

    [v77 contentsOfDirectoryAtPath:v75 error:0];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v93 objects:v114 count:16];
    if (v16)
    {
      id v73 = *(id *)v94;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(id *)v94 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          long long v19 = (void *)MEMORY[0x19F38D3B0]();
          long long v20 = [v75 stringByAppendingPathComponent:v18];
          long long v21 = v20;
          if (!v76)
          {
            id v24 = 0;
            goto LABEL_25;
          }
          long long v22 = [v20 stringByAppendingString:@".test"];
          id v92 = 0;
          int v23 = [v77 moveItemAtPath:v21 toPath:v22 error:&v92];
          id v24 = v92;
          if (!v23)
          {
            id v32 = PLSyncGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 138412802;
              v109 = v21;
              __int16 v110 = 2112;
              v111 = v22;
              __int16 v112 = 2112;
              CMTimeValue v113 = v24;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Error moving file at path: %@ to %@, %@", buf, 0x20u);
            }

            goto LABEL_32;
          }
          id v25 = [v77 attributesOfItemAtPath:v22 error:0];
          uint64_t v26 = v25;
          if (v25)
          {
            id v27 = [v25 fileModificationDate];
            id v28 = [v27 earlierDate:v76];
            BOOL v29 = v28 == v27;

            if (v29)
            {
              id v33 = PLSyncGetLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)CMTime buf = 138412802;
                v109 = v21;
                __int16 v110 = 2112;
                v111 = v27;
                __int16 v112 = 2112;
                CMTimeValue v113 = v76;
                _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "File: %@ date: %@ was earlier than date: %@", buf, 0x20u);
              }
            }
            else
            {
              uint64_t v91 = v24;
              char v30 = [v77 moveItemAtPath:v22 toPath:v21 error:&v91];
              id v31 = v91;

              if (v30)
              {

LABEL_31:
                id v24 = v31;
                goto LABEL_32;
              }
              id v33 = PLSyncGetLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)CMTime buf = 138412802;
                v109 = v22;
                __int16 v110 = 2112;
                v111 = v21;
                __int16 v112 = 2112;
                CMTimeValue v113 = v31;
                _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Error moving back test file at path: %@ to %@, %@", buf, 0x20u);
              }
              id v24 = v31;
            }

            long long v21 = v22;
LABEL_25:
            id v34 = PLSyncGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)CMTime buf = 138412290;
              v109 = v21;
              _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEBUG, "Removing sync file at path: %@", buf, 0xCu);
            }

            v90 = v24;
            char v35 = [v77 removeItemAtPath:v21 error:&v90];
            id v31 = v90;

            if (v35)
            {
              id v24 = v31;
              goto LABEL_33;
            }
            long long v22 = PLSyncGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 138412546;
              v109 = v21;
              __int16 v110 = 2112;
              v111 = v31;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Error removing file at path: %@, %@", buf, 0x16u);
            }
            goto LABEL_31;
          }
LABEL_32:

LABEL_33:
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v93 objects:v114 count:16];
      }
      while (v16);
    }

    if (!v76 && !v102[3])
    {
      id v36 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      uint64_t v37 = [v36 pathManager];

      __int16 v38 = PLSyncGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "There are no sync'd assets left; cleaning up filesystem",
          buf,
          2u);
      }

      CFDictionaryRef v39 = [v37 iTunesSyncedAssetsDirectory];
      CFDictionaryRef v40 = [v77 contentsOfDirectoryAtPath:v39 error:0];

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v74 = v40;
      uint64_t v41 = [v74 countByEnumeratingWithState:&v86 objects:v107 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v87 != v42) {
              objc_enumerationMutation(v74);
            }
            uint64_t v44 = *(void *)(*((void *)&v86 + 1) + 8 * j);
            long long v45 = [v37 iTunesSyncedAssetsDirectory];
            long long v46 = [v45 stringByAppendingPathComponent:v44];
            [v77 removeItemAtPath:v46 error:0];
          }
          uint64_t v41 = [v74 countByEnumeratingWithState:&v86 objects:v107 count:16];
        }
        while (v41);
      }

      long long v47 = [v37 iTunesSyncedAssetMetadataThumbnailsDirectory];
      id v48 = [v77 contentsOfDirectoryAtPath:v47 error:0];

      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v49 = v48;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v82 objects:v106 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v83 != v51) {
              objc_enumerationMutation(v49);
            }
            uint64_t v53 = *(void *)(*((void *)&v82 + 1) + 8 * k);
            long long v54 = [v37 iTunesSyncedAssetMetadataThumbnailsDirectory];
            uint64_t v55 = [v54 stringByAppendingPathComponent:v53];
            [v77 removeItemAtPath:v55 error:0];
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v82 objects:v106 count:16];
        }
        while (v50);
      }

      long long v56 = [v37 iTunesSyncedAssetSmallThumbnailsDirectory];
      long long v57 = [v77 contentsOfDirectoryAtPath:v56 error:0];

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v58 = v57;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v78 objects:v105 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v79;
        do
        {
          for (uint64_t m = 0; m != v59; ++m)
          {
            if (*(void *)v79 != v60) {
              objc_enumerationMutation(v58);
            }
            uint64_t v62 = *(void *)(*((void *)&v78 + 1) + 8 * m);
            id v63 = [v37 iTunesSyncedAssetSmallThumbnailsDirectory];
            id v64 = [v63 stringByAppendingPathComponent:v62];
            NSLog(&stru_1EEB35AE0.isa, v64);

            int v65 = [v37 iTunesSyncedAssetSmallThumbnailsDirectory];
            id v66 = [v65 stringByAppendingPathComponent:v62];
            [v77 removeItemAtPath:v66 error:0];
          }
          uint64_t v59 = [v58 countByEnumeratingWithState:&v78 objects:v105 count:16];
        }
        while (v59);
      }

      [(PLImageWriter *)self _resetSyncedAssetsDCIMDirectory];
    }
    int v67 = PLSyncGetLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "Cleaning up thumb files - finished", buf, 2u);
    }

    _Block_object_dispose(&v101, 8);
  }
}

uint64_t __65__PLImageWriter_cleanupFilesInLibrary_afteriTunesSyncBeforeDate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) countForFetchRequest:*(void *)(a1 + 40) error:0];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)processSyncSaveJob:(id)a3 library:(id)a4 albumMap:(id)a5
{
  v287[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v11 = PLSyncGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 138543362;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Process sync save job %{public}@", buf, 0xCu);
  }

  +[PLDelayedFiledSystemDeletions waitForAllDelayedDeletionsToFinish];
  if ([v8 cleanupSyncState])
  {
    uint64_t v12 = PLSyncGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Process sync cleanup", buf, 2u);
    }

    uint64_t v13 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v14 = [v8 cleanupBeforeDate];
    [(PLImageWriter *)self cleanupFilesInLibrary:v9 afteriTunesSyncBeforeDate:v14];

    goto LABEL_28;
  }
  if ([v8 isSyncComplete])
  {
    char v15 = PLSyncGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Process sync completion", buf, 2u);
    }

    uint64_t v16 = [v8 originalAssetURL];
    long long v17 = [v16 path];

    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v19 = [v18 fileExistsAtPath:v17];

    if (v17 && v19)
    {
      id v20 = v10;
      long long v21 = [v17 stringByAppendingPathExtension:@"lastsynced"];
      long long v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v286 = *MEMORY[0x1E4F28370];
      v287[0] = *MEMORY[0x1E4F28358];
      int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v287 forKeys:&v286 count:1];
      id v274 = 0;
      char v24 = [v22 setAttributes:v23 ofItemAtPath:v17 error:&v274];
      id v25 = v274;

      if ((v24 & 1) == 0)
      {
        uint64_t v26 = PLSyncGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 138412546;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Unable to assign data protection to sync metadata \"%@\": %@", buf, 0x16u);
        }
      }
      [v22 removeItemAtPath:v21 error:0];
      id v273 = v25;
      char v27 = [v22 moveItemAtPath:v17 toPath:v21 error:&v273];
      id v28 = v273;

      if ((v27 & 1) == 0)
      {
        BOOL v29 = PLSyncGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 138412546;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v28;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to move the sync metadata to %@! Error: %@", buf, 0x16u);
        }
      }
      id v10 = v20;
    }
    +[PLManagedAlbum clearAssetOrderByAbumUUIDs];
    char v30 = [v9 managedObjectContext];
    _PLPhotoLibraryAggregateSyncedContent(v30, 0, @"com.apple.mobileslideshow.syncedPhotoCount");
    _PLPhotoLibraryAggregateSyncedContent(v30, 1u, @"com.apple.mobileslideshow.syncedVideoCount");

    goto LABEL_28;
  }
  id v31 = off_1E585E000;
  id v32 = [v8 uuid];
  id v33 = +[PLManagedAsset assetWithUUID:v32 inLibrary:v9];

  v243 = v33;
  if (v33)
  {
    id v34 = PLSyncGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      char v35 = [v33 uuid];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_FAULT, "Attempting to sync an asset that is already in the library (UUID: %{public}@)", buf, 0xCu);
    }
    id v36 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v242 = v9;
  if ([v8 isVideo])
  {
    uint64_t v37 = [v8 originalAssetURL];
    uint64_t v38 = [v37 pathExtension];

    CFDictionaryRef v39 = [(PLImageWriter *)self iTunesSyncedAssetsDCIMDirectory];
    v234 = (void *)v38;
    CFDictionaryRef v40 = [v39 nextAvailableFileURLWithExtension:v38];

    uint64_t v41 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v284 = *MEMORY[0x1E4F28370];
    uint64_t v285 = *MEMORY[0x1E4F28358];
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v285 forKeys:&v284 count:1];
    id v43 = [v8 originalAssetURL];
    uint64_t v44 = [v43 path];
    id v272 = 0;
    v240 = (void *)v41;
    LOBYTE(v41) = [(id)v41 setAttributes:v42 ofItemAtPath:v44 error:&v272];
    id v45 = v272;

    if ((v41 & 1) == 0)
    {
      long long v46 = PLSyncGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        long long v47 = [v8 originalAssetURL];
        id v48 = [v47 path];
        *(_DWORD *)CMTime buf = 138412546;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Unable to assign data protection to video \"%@\": %@", buf, 0x16u);
      }
    }
    id v49 = [v8 originalAssetURL];
    uint64_t v50 = [v49 path];

    uint64_t v51 = PLSyncGetLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v52 = [v8 uuid];
      uint64_t v53 = [v40 path];
      *(_DWORD *)CMTime buf = 138543874;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 2112;
      v283 = v53;
      _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "Importing iTunes sync video asset %{public}@ %@ -> %@", buf, 0x20u);
    }
    v238 = (void *)v50;

    long long v54 = [v8 originalAssetURL];
    id v271 = v45;
    uint64_t v55 = v240;
    char v56 = [v240 moveItemAtURL:v54 toURL:v40 error:&v271];
    long long v57 = (id *)v271;

    if (v56)
    {
      location = v57;
      uint64_t v58 = [MEMORY[0x1E4F8BA10] savedAssetTypeForFinderSyncedAsset];
      uint64_t v59 = [v8 uuid];
      id v36 = +[PLManagedAsset insertAssetIntoPhotoLibrary:v242 mainFileURL:v40 savedAssetType:v58 bundleScope:0 uuid:v59 replacementUUID:0 imageSource:0 imageData:0];

      if (v36)
      {
        uint64_t v60 = [v40 path];
        id v269 = 0;
        id v270 = 0;
        PLPreviewImageAndDurationForVideoAtPathWithPreferredTime(0, v60, &v270, &v269, 0);
        id v61 = v270;
        id v62 = v269;

        [v36 generateAndUpdateThumbnailsWithPreviewImage:v61 thumbnailImage:v62 fromImageSource:0 imageData:0 forceSRGBConversion:0];
        id v268 = 0;
        BOOL v63 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v36 assumeNoExistingResources:0 referencedResourceURLs:0 error:&v268];
        id v64 = v268;
        if (!v63)
        {
          int v65 = PLSyncGetLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 138412546;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v64;
            _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        id v61 = PLSyncGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          id v151 = [v8 uuid];
          id v152 = [v40 path];
          *(_DWORD *)CMTime buf = 138543618;
          *(void *)&uint8_t buf[4] = v151;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v152;
          _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync video %{public}@, unable to insert asset %{public}@", buf, 0x16u);
        }
        id v36 = 0;
      }
      long long v57 = location;
      uint64_t v138 = v234;
      uint64_t v55 = v240;
    }
    else
    {
      char v134 = PLSyncGetLog();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      {
        [v40 path];
        int v136 = v135 = v57;
        *(_DWORD *)CMTime buf = 138412802;
        *(void *)&uint8_t buf[4] = v238;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v136;
        *(_WORD *)&buf[22] = 2112;
        v283 = v135;
        _os_log_impl(&dword_19B3C7000, v134, OS_LOG_TYPE_ERROR, "Unable to move sync video %@ to %@: %@", buf, 0x20u);

        long long v57 = v135;
      }

      id v61 = PLSyncGetLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v137 = [v8 uuid];
        *(_DWORD *)CMTime buf = 138543362;
        *(void *)&uint8_t buf[4] = v137;
        _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "Sync save job failed for video %{public}@", buf, 0xCu);
      }
      id v36 = 0;
      uint64_t v138 = v234;
    }

    id v9 = v242;
    if (v56) {
      goto LABEL_153;
    }
    goto LABEL_27;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  int v67 = [WeakRetained pathManager];
  id v68 = [v67 iTunesSyncedAssetsDirectory];

  v241 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v241 createDirectoryAtPath:v68 withIntermediateDirectories:1 attributes:0 error:0];
  id v69 = [v8 originalAssetURL];
  uint64_t v70 = [v69 path];

  __int16 v71 = PLSyncGetLog();
  v239 = v70;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    id v72 = [v8 uuid];
    *(_DWORD *)CMTime buf = 138543618;
    *(void *)&uint8_t buf[4] = v72;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v239;
    _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_DEFAULT, "Processing iTunes sync asset %{public}@ %@", buf, 0x16u);

    uint64_t v70 = v239;
  }

  v229 = v68;
  if (v70)
  {
    id v73 = (void *)MEMORY[0x1E4F442D8];
    id v74 = [v70 pathExtension];
    uint64_t v75 = [v73 typeWithFilenameExtension:v74];
    int v76 = [v75 conformsToType:*MEMORY[0x1E4F44568]];

    uint64_t v70 = v239;
    v267 = 0;
    if (v76)
    {
      id v77 = v239;
      char locationa = 1;
      goto LABEL_76;
    }
  }
  id v78 = v70;
  long long v79 = SyncedAssetCreateWithFileAtPath((unsigned int *)[v78 fileSystemRepresentation]);
  v267 = v79;
  if (!v79)
  {
    v141 = PLSyncGetLog();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138412290;
      *(void *)&uint8_t buf[4] = v78;
      _os_log_impl(&dword_19B3C7000, v141, OS_LOG_TYPE_ERROR, "Failed to create SyncedAsset from path: %@", buf, 0xCu);
    }

    uint64_t v142 = PLSyncGetLog();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      uint64_t v143 = [v8 uuid];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v143;
      _os_log_impl(&dword_19B3C7000, v142, OS_LOG_TYPE_ERROR, "Sync save job failed for asset %{public}@", buf, 0xCu);
    }
    id v77 = 0;
    goto LABEL_111;
  }
  long long v80 = v79;
  id v81 = v68;
  long long v82 = (unsigned char *)[v81 cStringUsingEncoding:1];
  if (*v82) {
    *((void *)v80 + 7) = v82;
  }
  v235 = v8;
  uint64_t v83 = (uint64_t)v267;
  if (v267)
  {
    *((unsigned char *)v267 + 52) = v267[13] & 0xFC | 1;
    *(_DWORD *)(v83 + 48) = *(_DWORD *)(v83 + 40) - 1;
  }
  uint64_t NextPart = SyncedAssetExtractNextPart(v83);
  if (!NextPart)
  {
LABEL_98:
    int v139 = PLSyncGetLog();
    id v8 = v235;
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      v140 = [v235 uuid];
      *(_DWORD *)CMTime buf = 138543618;
      *(void *)&uint8_t buf[4] = v140;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v235;
      _os_log_impl(&dword_19B3C7000, v139, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync photo asset %{public}@, unable to resolve path from job %@", buf, 0x16u);
    }
    id v36 = 0;
    id v77 = 0;
    id v121 = v239;
LABEL_147:
    if (v267 && (v267[13] & 1) != 0) {
      *((unsigned char *)v267 + 52) = v267[13] & 0xFC | 2;
    }
    SyncedAssetDestroy((uint64_t *)&v267);
LABEL_151:
    char v150 = 1;
    goto LABEL_152;
  }
  uint64_t v85 = NextPart;
  id v77 = 0;
  do
  {
    int v86 = *(_DWORD *)(v85 + 4);
    if (v86 == 2)
    {
      id v90 = v10;
      int v91 = *(_DWORD *)v85;
      ThumbnailData = SyncedPartGetThumbnailData(v85, (uint64_t)v267);
      int v93 = *(_DWORD *)(v85 + 24);
      id v94 = *(id *)(v85 + 32);
      long long v88 = v94;
      if (v91 != 901 || ThumbnailData == 0 || v93 == 0 || v94 == 0)
      {
        id v10 = v90;
      }
      else
      {
        id v98 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
        id v99 = [v98 pathManager];
        long long v89 = [v99 iTunesSyncedFaceAlbumThumbnailsDirectory];

        [v241 createDirectoryAtPath:v89 withIntermediateDirectories:1 attributes:0 error:0];
        uint64_t v100 = [v89 stringByAppendingPathComponent:v88];
        uint64_t v101 = [v100 stringByAppendingPathExtension:@"JPG"];

        PLWriteThumbnailDataToPath(ThumbnailData, v93, 901, v101);
        id v9 = v242;
        id v10 = v90;
LABEL_71:
      }
      goto LABEL_73;
    }
    if (!v86)
    {
      FilePath = SyncedPartGetFilePath(v85, (uint64_t)v267);
      if (FilePath)
      {
        long long v88 = [NSString stringWithUTF8String:FilePath];
        [v81 stringByAppendingPathComponent:v88];
        long long v89 = v77;
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_71;
      }
    }
LABEL_73:
    uint64_t v85 = SyncedAssetExtractNextPart((uint64_t)v267);
  }
  while (v85);
  if (!v77) {
    goto LABEL_98;
  }
  char locationa = 0;
  id v8 = v235;
  id v31 = off_1E585E000;
LABEL_76:
  uint64_t v102 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v77 isDirectory:0];
  uint64_t v103 = [(PLImageWriter *)self iTunesSyncedAssetsDCIMDirectory];
  uint64_t v104 = [v77 pathExtension];
  int v105 = [v103 nextAvailableFileURLWithExtension:v104];

  uint64_t v225 = *MEMORY[0x1E4F28370];
  uint64_t v280 = *MEMORY[0x1E4F28370];
  uint64_t v223 = *MEMORY[0x1E4F28358];
  uint64_t v281 = *MEMORY[0x1E4F28358];
  id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
  id v266 = 0;
  LOBYTE(v104) = [v241 setAttributes:v106 ofItemAtPath:v77 error:&v266];
  id v107 = v266;

  if ((v104 & 1) == 0)
  {
    CMTimeValue v108 = PLSyncGetLog();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138412546;
      *(void *)&uint8_t buf[4] = v77;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v107;
      _os_log_impl(&dword_19B3C7000, v108, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
    }
  }
  v109 = PLSyncGetLog();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v110 = [v8 uuid];
    [v105 path];
    v111 = v105;
    uint64_t v112 = v102;
    id v113 = v10;
    id v114 = (id *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)CMTime buf = 138543874;
    *(void *)&uint8_t buf[4] = v110;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v77;
    *(_WORD *)&buf[22] = 2112;
    v283 = v114;
    _os_log_impl(&dword_19B3C7000, v109, OS_LOG_TYPE_DEFAULT, "Importing iTunes sync photo asset %{public}@ %@ -> %@", buf, 0x20u);

    id v10 = v113;
    uint64_t v102 = v112;
    int v105 = v111;
    id v31 = off_1E585E000;
  }
  id v265 = v107;
  char v115 = [v241 moveItemAtURL:v102 toURL:v105 error:&v265];
  id v236 = v265;

  if (v115)
  {
    id v221 = v77;
    id v116 = v10;
    uint64_t v264 = 0;
    v117 = v31[401];
    uint64_t v118 = [MEMORY[0x1E4F8BA10] savedAssetTypeForFinderSyncedAsset];
    v119 = [v8 uuid];
    id v263 = 0;
    id v36 = [(__objc2_class *)v117 insertAssetIntoPhotoLibrary:v242 mainFileURL:v105 savedAssetType:v118 bundleScope:0 uuid:v119 replacementUUID:0 imageSource:&v264 imageData:&v263];
    id v120 = v263;

    v222 = (void *)v102;
    v227 = v120;
    if (v36)
    {
      id v121 = v239;
      if ([v8 hasVideoComplement])
      {
        id v122 = [v8 videoComplementURL];
        uint64_t v123 = [v122 path];

        uint64_t v124 = (void *)v123;
        id v10 = v116;
        v220 = v105;
        if (v124 && [v241 fileExistsAtPath:v124])
        {
          uint64_t v278 = v225;
          uint64_t v279 = v223;
          uint64_t v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
          uint64_t v126 = v124;
          v127 = (void *)v125;
          id v262 = v236;
          v226 = v126;
          char v128 = objc_msgSend(v241, "setAttributes:ofItemAtPath:error:", v125);
          id v224 = v236;

          id v9 = v242;
          if ((v128 & 1) == 0)
          {
            v129 = PLSyncGetLog();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 138412546;
              *(void *)&uint8_t buf[4] = v226;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v224;
              _os_log_impl(&dword_19B3C7000, v129, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
            }
          }
          id v130 = objc_alloc(MEMORY[0x1E4F8CE20]);
          uint64_t v131 = [v105 path];
          v132 = [v130 initWithPathToVideo:v226 pathToImage:v131];

          uint64_t v133 = [v132 pairingIdentifier];
          memset(buf, 0, sizeof(buf));
          if (v132)
          {
            [v132 imageDisplayTime];
            long long v260 = 0uLL;
            uint64_t v261 = 0;
            [v132 originalVideoDuration];
          }
          else
          {
            long long v260 = 0uLL;
            uint64_t v261 = 0;
          }
          if (v133 && (BYTE12(v260) & 1) != 0)
          {
            id v159 = [v8 videoComplementURL];
            *(_OWORD *)v277 = v260;
            *(void *)&v277[16] = v261;
            long long v258 = *(_OWORD *)buf;
            uint64_t v259 = *(void *)&buf[16];
            [v36 becomePhotoIrisWithMediaGroupUUID:v133 mainFileMetadata:0 videoURL:v159 videoDuration:v277 stillDisplayTime:&v258 options:0];
          }
          else
          {
            id v159 = PLSyncGetLog();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v277 = 138412290;
              *(void *)&v277[4] = v226;
              _os_log_impl(&dword_19B3C7000, v159, OS_LOG_TYPE_ERROR, "Failed to extract Iris properties from %@", v277, 0xCu);
            }
          }

          id v160 = [v36 pathForVideoComplementFile];
          char v161 = [v226 isEqualToString:v160];

          if ((v161 & 1) == 0)
          {
            id v162 = PLSyncGetLog();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v277 = 138412290;
              *(void *)&v277[4] = v226;
              _os_log_impl(&dword_19B3C7000, v162, OS_LOG_TYPE_DEBUG, "Removing sync file at path: %@", v277, 0xCu);
            }

            id v257 = 0;
            char v163 = [v241 removeItemAtPath:v226 error:&v257];
            id v164 = v257;
            if ((v163 & 1) == 0)
            {
              id v165 = PLSyncGetLog();
              if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v277 = 138412546;
                *(void *)&v277[4] = v226;
                *(_WORD *)&v277[12] = 2112;
                *(void *)&v277[14] = v164;
                _os_log_impl(&dword_19B3C7000, v165, OS_LOG_TYPE_DEFAULT, "Error removing file at path: %@, %@", v277, 0x16u);
              }
            }
          }
          id v157 = v132;

          id v121 = v239;
          id v77 = v221;
          id v158 = v224;
          uint64_t v124 = v226;
        }
        else
        {
          id v156 = PLSyncGetLog();
          id v77 = v221;
          if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 138412290;
            *(void *)&uint8_t buf[4] = v124;
            id v157 = v156;
            _os_log_impl(&dword_19B3C7000, v156, OS_LOG_TYPE_ERROR, "Missing video complement file at %@", buf, 0xCu);
          }
          else
          {
            id v157 = v156;
          }
          id v158 = v236;
          id v9 = v242;
        }

        id v236 = v158;
        id v120 = v227;
        int v105 = v220;
      }
      else
      {
        id v9 = v242;
        id v10 = v116;
        id v77 = v221;
      }
      [v36 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:v264 imageData:v120 forceSRGBConversion:0];
      id v256 = 0;
      BOOL v166 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v36 assumeNoExistingResources:0 referencedResourceURLs:0 error:&v256];
      v153 = v256;
      if (!v166)
      {
        char v167 = PLSyncGetLog();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 138412546;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v153;
          _os_log_impl(&dword_19B3C7000, v167, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v153 = PLSyncGetLog();
      id v10 = v116;
      if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      {
        id v154 = [v8 uuid];
        id v155 = [v105 path];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = v154;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v155;
        _os_log_impl(&dword_19B3C7000, v153, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync photo %{public}@, unable to insert asset %{public}@", buf, 0x16u);
      }
      id v9 = v242;
      id v121 = v239;
      id v77 = v221;
    }

    if ((locationa & 1) == 0) {
      goto LABEL_147;
    }
    goto LABEL_151;
  }
  uint64_t v144 = v105;
  id v145 = (void *)v102;
  long long v146 = PLSyncGetLog();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
  {
    long long v147 = [v144 path];
    *(_DWORD *)CMTime buf = 138412802;
    *(void *)&uint8_t buf[4] = v77;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v147;
    *(_WORD *)&buf[22] = 2112;
    v283 = (id *)v236;
    _os_log_impl(&dword_19B3C7000, v146, OS_LOG_TYPE_ERROR, "Unable to move sync photo %@ to %@: %@", buf, 0x20u);
  }
  long long v148 = PLSyncGetLog();
  id v9 = v242;
  if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
  {
    long long v149 = [v8 uuid];
    *(_DWORD *)CMTime buf = 138543362;
    *(void *)&uint8_t buf[4] = v149;
    _os_log_impl(&dword_19B3C7000, v148, OS_LOG_TYPE_ERROR, "Sync save job failed for photo %{public}@", buf, 0xCu);
  }
LABEL_111:
  id v36 = 0;
  char v150 = 0;
  id v121 = v239;
LABEL_152:

  if ((v150 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_153:
  if (v36)
  {
    long long v168 = [v8 uuid];

    if (v168)
    {
      long long v169 = [v8 uuid];
      [v36 setUuid:v169];
    }
    long long v170 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    long long v171 = [v8 creationDate];

    if (v171)
    {
      uint64_t v172 = [v8 creationDate];
      [v36 setDateCreated:v172];

      uint64_t v173 = [v8 creationDate];
      [v170 setObject:v173 forKey:*MEMORY[0x1E4F1C540]];
    }
    v174 = [v8 modificationDate];

    if (v174)
    {
      v175 = [v8 modificationDate];
      [v36 setModificationDate:v175];

      v176 = [v8 modificationDate];
      [v170 setObject:v176 forKey:*MEMORY[0x1E4F1C530]];
    }
    if ([v170 count])
    {
      v177 = [v36 mainFileURL];
      [v177 setResourceValues:v170 error:0];
    }
    SEL v178 = [v8 location];
    [v178 coordinate];
    double v180 = v179;
    [v36 longitude];
    if (v180 != v181 || ([v178 coordinate], double v183 = v182, objc_msgSend(v36, "latitude"), v183 != v184)) {
      [v36 setLocation:v178];
    }
    v230 = v178;
    __int16 v185 = [v8 sortToken];
    v228 = v185;
    if (v185)
    {
      [v185 doubleValue];
      objc_msgSend(v36, "setSortToken:");
    }
    else
    {
      id v186 = [v36 dateCreated];
      [v186 timeIntervalSinceReferenceDate];
      objc_msgSend(v36, "setSortToken:");
    }
    locationb = (id *)v170;
    v244 = v10;
    __int16 v187 = [v8 originalFileName];

    if (v187)
    {
      id v188 = [v8 originalFileName];
      [v36 setOriginalFilename:v188];
    }
    v237 = v8;
    long long v254 = 0u;
    long long v255 = 0u;
    long long v253 = 0u;
    long long v252 = 0u;
    uint64_t v189 = [v36 legacyFaces];
    uint64_t v190 = [v189 countByEnumeratingWithState:&v252 objects:v276 count:16];
    if (v190)
    {
      uint64_t v191 = v190;
      uint64_t v192 = *(void *)v253;
      do
      {
        for (uint64_t i = 0; i != v191; ++i)
        {
          if (*(void *)v253 != v192) {
            objc_enumerationMutation(v189);
          }
          [*(id *)(*((void *)&v252 + 1) + 8 * i) delete];
        }
        uint64_t v191 = [v189 countByEnumeratingWithState:&v252 objects:v276 count:16];
      }
      while (v191);
    }

    v250[0] = MEMORY[0x1E4F143A8];
    v250[1] = 3221225472;
    v250[2] = __53__PLImageWriter_processSyncSaveJob_library_albumMap___block_invoke;
    v250[3] = &unk_1E58635F0;
    id v194 = v36;
    id v251 = v194;
    [v237 processFacesWithBlock:v250];
    id v195 = [v237 facesInfo];
    uint64_t v196 = [v195 count];

    if (v196)
    {
      id v197 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      v198 = [v197 pathManager];
      __int16 v199 = [v198 iTunesSyncedFaceDataDirectory];

      v200 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v200 createDirectoryAtPath:v199 withIntermediateDirectories:1 attributes:0 error:0];

      uint64_t v201 = [v194 uuid];
      v202 = [v199 stringByAppendingPathComponent:v201];
      v203 = [v202 stringByAppendingPathExtension:@"plist"];

      v204 = (void *)MEMORY[0x1E4F28F98];
      v205 = [v237 facesInfo];
      v206 = [v204 dataWithPropertyList:v205 format:100 options:0 error:0];

      [v206 writeToFile:v203 options:1073741825 error:0];
    }
    long long v248 = 0u;
    long long v249 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    v207 = [v237 albumURIs];
    uint64_t v208 = [v207 countByEnumeratingWithState:&v246 objects:v275 count:16];
    id v10 = v244;
    if (!v208)
    {
LABEL_197:

      id v9 = v242;
      v219 = [v242 syncProgressAlbum];
      [v219 reducePendingItemsCountBy:1];

      [v194 persistMetadataToFilesystem];
      id v8 = v237;
      goto LABEL_28;
    }
    uint64_t v209 = v208;
    uint64_t v210 = *(void *)v247;
    while (2)
    {
      uint64_t v211 = 0;
LABEL_182:
      if (*(void *)v247 != v210) {
        objc_enumerationMutation(v207);
      }
      uint64_t v212 = *(void *)(*((void *)&v246 + 1) + 8 * v211);
      v213 = [v10 objectForKey:v212];
      if (!v213)
      {
        v214 = [v242 managedObjectContext];
        v215 = [v214 persistentStoreCoordinator];
        v216 = [v215 managedObjectIDForURIRepresentation:v212];

        if (v216)
        {
          id v245 = 0;
          v213 = [v214 existingObjectWithID:v216 error:&v245];
          v217 = v245;
          if (v213)
          {
            [v244 setObject:v213 forKey:v212];
            goto LABEL_194;
          }
          v218 = PLSyncGetLog();
          if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 138412546;
            *(void *)&uint8_t buf[4] = v212;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v217;
            _os_log_impl(&dword_19B3C7000, v218, OS_LOG_TYPE_ERROR, "Unable to fetch album %@: %@", buf, 0x16u);
          }
        }
        else
        {
          v217 = PLSyncGetLog();
          if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 138412290;
            *(void *)&uint8_t buf[4] = v212;
            _os_log_impl(&dword_19B3C7000, v217, OS_LOG_TYPE_ERROR, "Unable to create NSManagedObjectID from %@", buf, 0xCu);
          }
        }
        v213 = 0;
LABEL_194:

        id v10 = v244;
      }
      [v213 addAssetUsingiTunesAlbumOrder:v194];
      [v213 reducePendingItemsCountBy:1];

      if (v209 == ++v211)
      {
        uint64_t v209 = [v207 countByEnumeratingWithState:&v246 objects:v275 count:16];
        if (!v209) {
          goto LABEL_197;
        }
        continue;
      }
      goto LABEL_182;
    }
  }
LABEL_28:
}

void __53__PLImageWriter_processSyncSaveJob_library_albumMap___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = PLSyncGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = [*(id *)(a1 + 32) uuid];
    uint64_t v16 = *(void *)(a1 + 32);
    int v23 = 138412546;
    char v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[face processing] asset %@ before: %@", (uint8_t *)&v23, 0x16u);
  }
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "addLegacyFaceWithRelativeRect:identifier:albumUUID:", a2, v13, a4, a5, a6, a7);
  uint64_t v18 = PLSyncGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 32) uuid];
    uint64_t v20 = *(void *)(a1 + 32);
    int v23 = 138412546;
    char v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "[face processing] asset %@ after: %@", (uint8_t *)&v23, 0x16u);
  }
  long long v21 = PLSyncGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    long long v22 = [*(id *)(a1 + 32) legacyFaces];
    int v23 = 138412290;
    char v24 = v22;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[face processing] legacyFaces: %@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)_resetSyncedAssetsDCIMDirectory
{
  id v2 = [(PLImageWriter *)self iTunesSyncedAssetsDCIMDirectory];
  [v2 reset];
}

- (id)iTunesSyncedAssetsDCIMDirectory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_iTunesSyncedAssetsDCIMDirectory)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_libraryServicesManager);
    uint64_t v4 = [WeakRetained pathManager];
    id v5 = [(id)v4 iTunesSyncedAssetsDirectory];

    id v13 = 0;
    LOBYTE(v4) = [MEMORY[0x1E4F8B908] createDirectoryAtPath:v5 error:&v13];
    id v6 = v13;
    if ((v4 & 1) == 0)
    {
      uint64_t v7 = PLSyncGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        char v15 = v5;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to create directory \"%@\": %@", buf, 0x16u);
      }
    }
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F8B9E0]) initWithDirectoryURL:v8 subDirectorySuffix:@"SYNCD" perDirectoryLimit:2000 userInfoPath:0];
    iTunesSyncedAssetsDCIMDirectory = v2->_iTunesSyncedAssetsDCIMDirectory;
    v2->_iTunesSyncedAssetsDCIMDirectory = (PLSimpleDCIMDirectory *)v9;
  }
  objc_sync_exit(v2);

  uint64_t v11 = v2->_iTunesSyncedAssetsDCIMDirectory;
  return v11;
}

- (void)_enablePhotoStreamJob:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLMyPhotoStreamGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "_enablePhotoStreamJob %@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [v9 setObject:*MEMORY[0x1E4F8C9A8] forKey:*MEMORY[0x1E4F8C970]];
  id v10 = +[PLAssetTransactionReason transactionReason:@"[_enablePhotoStreamJob]Enabling PhotoStream so we make sure that previous assets are deleted."];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PLImageWriter__enablePhotoStreamJob_completion___block_invoke;
  v12[3] = &unk_1E5875198;
  id v13 = v7;
  id v11 = v7;
  [(PLImageWriter *)self _processDeletePhotoStreamDataJob:v9 withReason:v10 completion:v12];
}

uint64_t __50__PLImageWriter__enablePhotoStreamJob_completion___block_invoke(uint64_t a1)
{
  id v2 = PLMyPhotoStreamGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "ignoring request to enable Photo Stream since no stream ID was found", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processDeletePhotoStreamDataJob:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(PLImageWriter *)self _incrementJobCount:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PLImageWriter__processDeletePhotoStreamDataJob_withReason_completion___block_invoke;
  v14[3] = &unk_1E5874868;
  id v15 = v8;
  id v16 = v9;
  void v14[4] = self;
  id v12 = v8;
  id v13 = v9;
  +[PLPhotoStreamsHelper deletePhotoStreamAssetsWithLibraryServiceManager:WeakRetained withReason:v10 completion:v14];
}

uint64_t __72__PLImageWriter__processDeletePhotoStreamDataJob_withReason_completion___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _decrementJobCount:v3];
}

- (void)_processAutodeleteEmptyAlbumJob:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [v6 objectForKey:@"EmptyAlbumToDelete"];
  if (v9)
  {
    id v10 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAutodeleteEmptyAlbumJob:completion:]");
    [(PLImageWriter *)self _incrementJobCount:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke;
    v15[3] = &unk_1E5875E18;
    id v16 = v10;
    id v17 = v9;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke_2;
    v12[3] = &unk_1E5874868;
    uint64_t v14 = v7;
    void v12[4] = self;
    id v13 = v6;
    id v11 = v10;
    [v11 performTransaction:v15 completionHandler:v12];
  }
  else
  {
    v7[2](v7);
  }
}

void __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v8 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v8;
  if (isKindOfClass)
  {
    id v5 = v8;
    if (([v5 isDeleted] & 1) == 0)
    {
      id v6 = [v5 assets];
      uint64_t v7 = [v6 count];

      if (!v7)
      {
        [*(id *)(a1 + 32) resetCachedImportAlbumsIfNeededForAlbum:v5];
        [v5 delete];
      }
    }

    uint64_t v4 = v8;
  }
}

uint64_t __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _decrementJobCount:v3];
}

- (void)_processAvalanchesValidationJob:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [v6 objectForKey:*MEMORY[0x1E4F8C8A0]];
  id v10 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAvalanchesValidationJob:completion:]");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PLImageWriter__processAvalanchesValidationJob_completion___block_invoke;
  v14[3] = &unk_1E5873A50;
  id v15 = v9;
  id v11 = v6;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  [v12 performBlockAndWait:v14];
  v7[2](v7);
}

void __60__PLImageWriter__processAvalanchesValidationJob_completion___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1[4], "count"));
  [a1[5] setObject:v2 forKeyedSubscript:@"avalancheStackAssetMap"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = objc_msgSend(a1[6], "managedObjectContext", (void)v12);
        id v10 = +[PLAvalanche assetsWithAvalancheUUID:v8 inManagedObjectContext:v9];

        if ((unint64_t)[v10 count] >= 2
          && !+[PLAvalanche isValidBurstWithAssets:v10])
        {
          id v11 = +[PLAvalanche revalidateAvalancheAssets:v10 inLibrary:a1[6] deleteNonPicks:0 allowDissolve:1];
          [v2 setObject:v11 forKeyedSubscript:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_processAvalancheJob:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [v6 objectForKey:*MEMORY[0x1E4F8C918]];
  if ([v9 length])
  {
    id v10 = [v6 objectForKey:*MEMORY[0x1E4F8C888]];
    id v11 = [v6 objectForKey:*MEMORY[0x1E4F8C890]];
    long long v12 = [v6 objectForKey:*MEMORY[0x1E4F8C898]];
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
    if ([v13 BOOLForKey:@"PLImageWriterStashCameraJob"])
    {
      long long v14 = [v6 objectForKeyedSubscript:@"kPLImageWriterReplayedCameraJob"];

      if (!v14) {
        [(PLImageWriter *)self _copyJobContentsToHoldingDirectoryWithUUID:v9 incomingPath:0 job:v6];
      }
    }
    if ([v10 count] && objc_msgSend(v11, "count") && v12)
    {
      [(PLImageWriter *)self _incrementJobCount:v6];
      id v15 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAvalancheJob:completion:]");
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__PLImageWriter__processAvalancheJob_completion___block_invoke;
      v17[3] = &unk_1E5870618;
      id v18 = v10;
      id v19 = v9;
      id v20 = v15;
      id v21 = v11;
      id v22 = v12;
      id v16 = v15;
      [v16 performTransactionAndWait:v17];
      v7[2](v7);
      [(PLImageWriter *)self _decrementJobCount:v6];
    }
  }
}

void __49__PLImageWriter__processAvalancheJob_completion___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) managedObjectContext];
    id v16 = +[PLAvalanche assetsWithAvalancheUUID:v2 inManagedObjectContext:v3];

    uint64_t v4 = +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 56) options:3 inLibrary:*(void *)(a1 + 48)];
    uint64_t v5 = +[PLManagedAsset assetWithUUID:*(void *)(a1 + 64) inLibrary:*(void *)(a1 + 48)];
    id v6 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v16];
    uint64_t v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];
    LOBYTE(v15) = 1;
    id v8 = +[PLAvalanche updatePropertiesForAssets:v6 autoPicks:v7 stackAsset:v5 userFavorites:0 deleteNonPicks:0 setFirstPick:1 allowDissolve:v15];

    id v9 = [[PLAvalanche alloc] initWithUUID:*(void *)(a1 + 40) photoLibrary:*(void *)(a1 + 48)];
    id v10 = [(PLAvalanche *)v9 stackAsset];
    [v10 generateLargeThumbnailFileIfNecessary];

    id v11 = [(PLAvalanche *)v9 assets];
    long long v12 = [(PLAvalanche *)v9 autoPicks];
    long long v13 = [(PLAvalanche *)v9 stackAsset];
    long long v14 = [(PLAvalanche *)v9 userFavorites];
    +[PLAvalanche updateMembershipForAssets:v11 autoPicks:v12 stackAsset:v13 userFavorites:v14 deleteNonPicks:0 allowDissolve:1 inLibrary:*(void *)(a1 + 48)];
  }
}

- (void)_processBatchImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  uint64_t v11 = *MEMORY[0x1E4F8C8A8];
  long long v12 = [v8 objectForKey:*MEMORY[0x1E4F8C8A8]];
  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  if ([v13 BOOLForKey:@"PLImageWriterStashCameraJob"])
  {
    long long v14 = [v8 objectForKeyedSubscript:@"kPLImageWriterReplayedCameraJob"];

    if (!v14)
    {
      uint64_t v42 = v11;
      id v44 = v9;
      id v45 = self;
      long long v46 = v10;
      long long v47 = v8;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = [v12 count];
      if (v16)
      {
        uint64_t v17 = v16;
        for (uint64_t i = 0; i != v17; ++i)
        {
          id v19 = objc_msgSend(v12, "objectAtIndex:", i, v42);
          id v20 = (void *)[v19 mutableCopy];
          [v15 setObject:v20 atIndexedSubscript:i];
        }
      }
      id v43 = v12;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v57 = 0u;
      long long v56 = 0u;
      id v21 = v15;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v57;
        uint64_t v25 = *MEMORY[0x1E4F8CA98];
        uint64_t v26 = *MEMORY[0x1E4F8CA28];
        uint64_t v27 = *MEMORY[0x1E4F8CAD0];
        do
        {
          id v28 = v21;
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v57 != v24) {
              objc_enumerationMutation(v28);
            }
            char v30 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            v60[0] = @"completionBlock";
            v60[1] = v25;
            v60[2] = v26;
            v60[3] = v27;
            id v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v60, 4, v42);
            [v30 removeObjectsForKeys:v31];
          }
          id v21 = v28;
          uint64_t v23 = [v28 countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v23);
      }

      id v32 = [v21 firstObject];

      if (v32)
      {
        id v33 = [v21 firstObject];
        id v34 = [v33 objectForKey:*MEMORY[0x1E4F8C8C0]];

        char v35 = [v21 firstObject];
        id v36 = [v35 objectForKey:*MEMORY[0x1E4F8CA78]];

        id v8 = v47;
        uint64_t v37 = (void *)[v47 mutableCopy];
        [v37 setObject:v21 forKeyedSubscript:v42];
        self = v45;
        [(PLImageWriter *)v45 _copyJobContentsToHoldingDirectoryWithUUID:v34 incomingPath:v36 job:v37];

        id v10 = v46;
      }
      else
      {
        id v34 = PLAssetImportGetLog();
        id v10 = v46;
        id v8 = v47;
        self = v45;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CMTime buf = 0;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "No job dictionaries found in batch image job, skipping stashing of camera job", buf, 2u);
        }
      }
      long long v12 = v43;
      id v9 = v44;
    }
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke;
  v51[3] = &unk_1E5873A50;
  id v38 = v12;
  id v52 = v38;
  uint64_t v53 = self;
  id v39 = v9;
  id v54 = v39;
  [v39 performTransactionAndWait:v51];
  [(PLImageWriter *)self _incrementJobCount:v8];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  void v48[2] = __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke_3;
  v48[3] = &unk_1E5875E18;
  id v49 = v39;
  id v50 = v38;
  id v40 = v38;
  id v41 = v39;
  [v41 performTransactionAndWait:v48];
  v10[2](v10);
  [(PLImageWriter *)self _decrementJobCount:v8];
}

void __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x19F38D3B0](v3);
        objc_msgSend(v8, "setObject:forKey:", v6, @"imagejob_transient_save_transaction", (void)v10);
        [*(id *)(a1 + 40) _processImageJob:v8 inLibrary:*(void *)(a1 + 48) completion:&__block_literal_global_277];
        [v8 removeObjectForKey:@"imagejob_transient_save_transaction"];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

void __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 userInfo];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"imagejob_transient_batch_transaction_key"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        long long v10 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v11 = [v9 objectForKey:@"imagejob_transient_transaction_block"];
        long long v12 = (void *)v11;
        if (v11) {
          (*(void (**)(uint64_t))(v11 + 16))(v11);
        }
        [v9 removeObjectForKey:@"imagejob_transient_transaction_block"];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  [v3 removeObjectForKey:@"imagejob_transient_batch_transaction_key"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x19F38D3B0](v14);
        uint64_t v20 = objc_msgSend(v18, "objectForKey:", @"imagejob_transient_transaction_completion_block", (void)v22);
        id v21 = (void *)v20;
        if (v20) {
          (*(void (**)(uint64_t))(v20 + 16))(v20);
        }
        [v18 removeObjectForKey:@"imagejob_transient_transaction_completion_block"];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      uint64_t v15 = v14;
    }
    while (v14);
  }
}

- (id)_processLimitedLibraryAdditionIfNeededWithAssetUUID:(id)a3 clientBundleIdentifier:(id)a4 clientAuthorization:(id)a5 library:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    if (v11)
    {
      [v11 clientAuditToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    uint64_t v15 = objc_msgSend(v12, "managedObjectContext", v19, v20);
    id v13 = +[PLLimitedLibraryFetchFilter fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:v10 auditToken:&v19 inManagedObjectContext:v15];

    uint64_t v16 = PLAssetImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Adding image writer asset %{public}@ to limited library fetch filter for %@", buf, 0x16u);
    }

    id v21 = v9;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v13 addAssetsWithUUIDs:v17];

    uint64_t v14 = [v13 objectID];
  }
  else
  {
    id v13 = PLAssetImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error adding asset to limited library due to nil uuid %{public}@ or clientBundleIdentifier %@", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_removeInProgressExtendedAttributesForFileAtURL:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F8B900] filesystemPersistenceBatchItemForFileAtURL:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 setData:0 forKey:*MEMORY[0x1E4F8C3C8]];
    [v4 setData:0 forKey:*MEMORY[0x1E4F8C3B8]];
    [v4 setData:0 forKey:*MEMORY[0x1E4F8C3B0]];
    [v4 setData:0 forKey:*MEMORY[0x1E4F8C3C0]];
    [v4 persist];
    uint64_t v3 = v4;
  }
}

- (void)_processImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v143 = a4;
  id v138 = a5;
  long long v149 = [v9 objectForKey:@"callStack"];
  if (v149)
  {
    id v10 = PLAssetImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v149;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    PLJobLogDictionary();
  }
  uint64_t v13 = *MEMORY[0x1E4F8CA78];
  uint64_t v14 = [v9 objectForKey:*MEMORY[0x1E4F8CA78]];
  long long v148 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v14 && ([v148 fileExistsAtPath:v14] & 1) != 0)
  {
    uint64_t v15 = v14;
LABEL_10:
    id v145 = v15;
    id v152 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
    goto LABEL_13;
  }
  uint64_t v16 = [MEMORY[0x1E4F8B850] sharedDCIMWriter];
  [v16 saveImageJobToDisk:v9];

  uint64_t v17 = [v9 objectForKey:v13];

  if ([v148 fileExistsAtPath:v17])
  {
    uint64_t v15 = v17;
    if (v17) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v145 = 0;
  id v152 = 0;
LABEL_13:
  uint64_t v142 = [v9 objectForKey:*MEMORY[0x1E4F8C918]];
  v140 = [v145 pathExtension];
  id v18 = [v9 objectForKey:*MEMORY[0x1E4F8C8E8]];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    long long v20 = [(PLImageWriter *)self cameraAssetPathForNewAssetWithExtension:v140 assetUUID:v142];
    if (v20)
    {
      id v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  long long v20 = [v9 objectForKey:*MEMORY[0x1E4F8CA28]];
  if (!v20)
  {
LABEL_20:
    id v21 = 0;
    goto LABEL_21;
  }
  long long v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
  id v21 = v22;
  if (v140)
  {
    id v23 = [v22 pathExtension];
    char v24 = [v23 isEqualToString:v140];

    if ((v24 & 1) == 0)
    {
      id v25 = [v21 URLByDeletingPathExtension];
      uint64_t v26 = [v25 URLByAppendingPathExtension:v140];

      id v21 = (void *)v26;
    }
  }
LABEL_21:

  uint64_t v144 = [v9 objectForKey:*MEMORY[0x1E4F8C910]];
  long long v146 = [v9 objectForKey:*MEMORY[0x1E4F8C8D8]];
  if (v146)
  {
    id v151 = [[PLIngestJobCameraMetadata alloc] initWithCameraMetadataPath:v146];
    [(PLIngestJobCameraMetadata *)v151 deserializeCameraMetadata];
  }
  else
  {
    id v151 = 0;
  }
  *(void *)CMTime buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v234 = __Block_byref_object_copy__5318;
  v235 = __Block_byref_object_dispose__5319;
  id v236 = [v9 objectForKey:*MEMORY[0x1E4F8C8B0]];
  uint64_t v27 = [v9 objectForKey:*MEMORY[0x1E4F8CA30]];
  [(PLImageWriter *)self _linkDiagnosticFileWithSourcePath:v27 forPhotoDestinationURL:v21];
  uint64_t v137 = (void *)v27;
  char v150 = v21;
  long long v28 = (void *)MEMORY[0x1E4F8CD68];
  long long v29 = [(PLIngestJobCameraMetadata *)v151 cameraMetadata];
  uint64_t v30 = [v28 semanticEnhanceSceneForCameraMetadata:v29];
  double v32 = v31;

  id v33 = [v150 pathExtension];
  int v139 = +[PLManagedAsset uniformTypeIdentifierFromPathExtension:v33 assetType:0];

  id v34 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v139];
  int v35 = [v34 conformsToType:*MEMORY[0x1E4F44498]];

  if (v35) {
    uint64_t v36 = -1;
  }
  else {
    uint64_t v36 = v30;
  }
  uint64_t v147 = v36;
  uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
  if (v37)
  {
    id v224 = 0;
    id v38 = [MEMORY[0x1E4F8CBC8] deserializedAdjustmentsFromData:v37 error:&v224];
    id v39 = v224;
    if (v38)
    {
      id v40 = [v38 portraitMetadata];

      uint64_t v41 = v147;
      if (v40) {
        uint64_t v41 = -1;
      }
      uint64_t v147 = v41;
    }
    else
    {
      uint64_t v42 = PLBackendGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v227 = 138412290;
        *(void *)&v227[4] = v39;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera adjustment data: %@", v227, 0xCu);
      }
    }
  }
  if ([(id)objc_opt_class() semanticEnhanceSceneIsValid:v147])
  {
    id v43 = PLAssetImportGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v147 + 1) > 4) {
        id v44 = @"unknown";
      }
      else {
        id v44 = off_1E58636D8[v147 + 1];
      }
      *(_DWORD *)v227 = 138412290;
      *(void *)&v227[4] = v44;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEFAULT, "[SemDev] Classifying image as semantic enhance scene: %@", v227, 0xCu);
    }

    long long v47 = [(PLIngestJobCameraMetadata *)v151 cameraMetadata];
    [v47 setSemanticEnhanceScene:v147];

    id v48 = [(PLIngestJobCameraMetadata *)v151 cameraMetadata];
    [v48 setSemanticEnhanceSceneConfidence:v32];

    id v49 = +[PLImageWriter cameraMetadataURLForPrimaryAssetURL:v150 photoLibrary:v143];
    id v223 = 0;
    BOOL v50 = [(PLImageWriter *)self _writeOutCameraMetadata:v151 destinationURL:v49 error:&v223];
    id v51 = v223;
    if (v50)
    {
      if (v144)
      {
        char v45 = 0;
        uint64_t v52 = (uint64_t)v150;
LABEL_51:

        long long v46 = v52;
        goto LABEL_52;
      }
      +[PLImageWriter semanticEnhancePreviewDestinationURLForPrimaryAssetURL:v150];
      uint64_t v52 = v45 = v50;
      uint64_t v53 = v150;
    }
    else
    {
      uint64_t v53 = PLBackendGetLog();
      char v45 = v50;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v227 = 138412290;
        *(void *)&v227[4] = v51;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "[SemDev] Error writing out MDATA file, skipping SemDev: %@", v227, 0xCu);
      }
      uint64_t v147 = -1;
      uint64_t v52 = (uint64_t)v150;
    }

    goto LABEL_51;
  }
  char v45 = 0;
  long long v46 = v150;
LABEL_52:
  v141 = 0;
  if (v144 && v46)
  {
    uint64_t v54 = +[PLPhotoLibrary deferredPhotoPreviewDestinationURLForPrimaryAssetURL:v46];

    int v136 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
    v141 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
    char v45 = 1;
    long long v46 = v54;
  }
  else
  {
    int v136 = 0;
  }
  if (v152 && v46)
  {
    uint64_t v55 = (void *)MEMORY[0x1E4F8B900];
    long long v56 = [v46 path];
    [v55 persistString:v56 forKey:*MEMORY[0x1E4F8C3B8] fileURL:v152];
    long long v57 = v46;

    if (v149)
    {
      long long v58 = PLAssetImportGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v227 = 138412290;
        *(void *)&v227[4] = v46;
        _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEBUG, "#### added destination EA %@", v227, 0xCu);
      }
    }
    uint64_t v231 = *MEMORY[0x1E4F28370];
    uint64_t v232 = *MEMORY[0x1E4F28358];
    long long v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
    uint64_t v60 = [v152 path];
    id v222 = 0;
    char v61 = [v148 setAttributes:v59 ofItemAtPath:v60 error:&v222];
    id v62 = v222;

    if ((v61 & 1) == 0)
    {
      BOOL v63 = PLAssetImportGetLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        id v64 = [v152 path];
        *(_DWORD *)v227 = 138412546;
        *(void *)&v227[4] = v64;
        *(_WORD *)&v227[12] = 2112;
        *(void *)&v227[14] = v62;
        _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", v227, 0x16u);
      }
    }
    id v221 = 0;
    char v65 = [MEMORY[0x1E4F8B908] copyItemAtURL:v152 toURL:v57 error:&v221];
    id v66 = v221;
    if (v65)
    {
      if (!v149)
      {
LABEL_74:

        long long v46 = v57;
        goto LABEL_75;
      }
      int v67 = PLAssetImportGetLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v227 = 138412290;
        *(void *)&v227[4] = v57;
        _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEBUG, "#### linked photoSourcePath to %@", v227, 0xCu);
      }
    }
    else
    {
      id v68 = PLAssetImportGetLog();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v227 = 138412802;
        *(void *)&v227[4] = v152;
        *(_WORD *)&v227[12] = 2112;
        *(void *)&v227[14] = v57;
        *(_WORD *)&v227[22] = 2112;
        v228 = (uint64_t (*)(uint64_t, uint64_t))v66;
        _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@: %@", v227, 0x20u);
      }

      int v67 = v57;
      long long v57 = 0;
    }

    goto LABEL_74;
  }
LABEL_75:
  v135 = v46;
  if (!v152 || !v46)
  {
    v218[0] = MEMORY[0x1E4F143A8];
    v218[1] = 3221225472;
    v218[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke;
    v218[3] = &unk_1E5875E18;
    id v219 = v143;
    id v220 = v142;
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_2;
    v215[3] = &unk_1E5874868;
    v215[4] = self;
    id v216 = v9;
    id v217 = v138;
    [v219 performTransaction:v218 completionHandler:v215];

    id v82 = v219;
    goto LABEL_111;
  }
  v127 = [v9 objectForKey:*MEMORY[0x1E4F8C8F0]];
  uint64_t v123 = [v9 objectForKey:*MEMORY[0x1E4F8C8C0]];
  char v122 = v45;
  v111 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  if ([v111 BOOLForKey:@"PLImageWriterStashCameraJob"])
  {
    uint64_t v69 = [v9 objectForKeyedSubscript:@"kPLImageWriterReplayedCameraJob"];
    BOOL v70 = (v69 | v123) == 0;

    if (v70) {
      [(PLImageWriter *)self _copyJobContentsToHoldingDirectoryWithUUID:v127 incomingPath:v145 job:v9];
    }
  }
  __int16 v71 = [v9 objectForKey:*MEMORY[0x1E4F8CA50]];
  int v131 = [v71 BOOLValue];

  if (v131)
  {
    id v72 = [v145 stringByDeletingLastPathComponent];
    id v73 = _photoIrisIndicatorFilePathForPhoto(v72, (uint64_t)v127);
    if (v73)
    {
      PLMakeIndicatorFileExistAtPath();
      id v74 = [MEMORY[0x1E4F8BA48] transaction:"-[PLImageWriter _processImageJob:inLibrary:completion:]"];
      dispatch_time_t v75 = dispatch_time(0, 8000000000);
      jobQueue = self->_jobQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_3;
      block[3] = &unk_1E5873A50;
      id v212 = v143;
      id v213 = v73;
      id v77 = v74;
      id v214 = v77;
      dispatch_after(v75, jobQueue, block);
    }
  }
  id v130 = [v9 objectForKey:*MEMORY[0x1E4F8C810]];
  uint64_t v133 = [v9 objectForKey:*MEMORY[0x1E4F8C880]];
  id v120 = [v9 objectForKey:*MEMORY[0x1E4F8C878]];
  uint64_t v118 = [v9 objectForKey:*MEMORY[0x1E4F8CA10]];
  id v78 = [v9 objectForKey:*MEMORY[0x1E4F8C8E0]];
  if (v78)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v78 = 0;
    }
  }
  v117 = [v9 objectForKey:*MEMORY[0x1E4F8C8F8]];
  char v115 = [v9 objectForKey:*MEMORY[0x1E4F8C8D0]];
  long long v79 = [v9 objectForKey:@"ImportedBy"];
  uint64_t v125 = [v9 objectForKey:*MEMORY[0x1E4F8C928]];
  v129 = [v9 objectForKey:*MEMORY[0x1E4F8C960]];
  if (!v129)
  {
    long long v80 = [v125 objectForKey:*MEMORY[0x1E4F2FCA0]];
    BOOL v81 = v80 == 0;

    if (v81)
    {
      v129 = 0;
    }
    else
    {
      v129 = [NSNumber numberWithInteger:PLImageOrientationFromImageProperties()];
    }
  }
  uint64_t v83 = [v9 objectForKey:*MEMORY[0x1E4F8CA90]];
  if ([v83 length])
  {
    uint64_t v84 = DCIM_newPLImageWithStoredJPEGData();
  }
  else
  {
    uint64_t v85 = 0;
    if (![v9 objectForKey:*MEMORY[0x1E4F8CA98]] || !v129) {
      goto LABEL_98;
    }
    [v129 intValue];
    uint64_t v84 = DCIM_newPLImageWithCGImage();
  }
  uint64_t v85 = (void *)v84;
LABEL_98:
  *(void *)v227 = 0;
  *(void *)&v227[8] = v227;
  *(void *)&v227[16] = 0x3032000000;
  v228 = __Block_byref_object_copy__5318;
  v229 = __Block_byref_object_dispose__5319;
  id v230 = [v9 objectForKey:*MEMORY[0x1E4F8CA38]];
  uint64_t v112 = [v9 objectForKey:*MEMORY[0x1E4F8CA20]];
  id v113 = [v9 objectForKey:*MEMORY[0x1E4F8CA18]];
  v209[0] = 0;
  v209[1] = v209;
  v209[2] = 0x2020000000;
  char v210 = 0;
  __int16 v86 = [MEMORY[0x1E4F8BA10] defaultSavedAssetTypeForUnspecifiedImageWriterJobs];
  uint64_t v87 = *MEMORY[0x1E4F8CAA8];
  long long v88 = [v9 objectForKey:*MEMORY[0x1E4F8CAA8]];

  if (v88)
  {
    long long v89 = [v9 objectForKey:v87];
    __int16 v86 = [v89 integerValue];
  }
  if (([v79 intValue] == 6 || objc_msgSend(v79, "intValue") == 9)
    && [v133 length])
  {
    uint64_t v90 = *MEMORY[0x1E4F8BB20];
    v226[0] = v133;
    uint64_t v91 = *MEMORY[0x1E4F8BB28];
    v225[0] = v90;
    v225[1] = v91;
    id v92 = v130;
    if (!v130)
    {
      id v92 = [MEMORY[0x1E4F1CA98] null];
    }
    v226[1] = v92;
    int v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v226 forKeys:v225 count:2];
    PLSendCoreAnalyticEvent();

    if (!v130) {
  }
    }
  v207[0] = 0;
  v207[1] = v207;
  v207[2] = 0x3032000000;
  v207[3] = __Block_byref_object_copy__5318;
  v207[4] = __Block_byref_object_dispose__5319;
  id v208 = 0;
  v205[0] = 0;
  v205[1] = v205;
  v205[2] = 0x3032000000;
  v205[3] = __Block_byref_object_copy__5318;
  v205[4] = __Block_byref_object_dispose__5319;
  id v206 = 0;
  [(PLImageWriter *)self _incrementJobCount:v9];
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_5;
  v169[3] = &unk_1E58634E0;
  id v107 = v133;
  id v170 = v107;
  id v108 = v120;
  id v171 = v108;
  id v109 = v118;
  id v172 = v109;
  id v116 = v115;
  id v173 = v116;
  id v119 = v79;
  id v174 = v119;
  id v121 = v125;
  id v175 = v121;
  id v110 = v78;
  id v176 = v110;
  id v106 = v143;
  id v177 = v106;
  id v94 = v135;
  SEL v178 = v94;
  double v179 = v150;
  id v126 = v85;
  id v180 = v126;
  __int16 v202 = v86;
  id v181 = v142;
  id v114 = v127;
  id v182 = v114;
  char v203 = v122;
  id v128 = v117;
  id v183 = v128;
  char v204 = v131;
  id v184 = v136;
  id v185 = v141;
  id v195 = buf;
  uint64_t v196 = v227;
  id v95 = v148;
  id v186 = v95;
  id v134 = v112;
  id v187 = v134;
  id v188 = self;
  id v132 = v83;
  id v189 = v132;
  id v197 = v209;
  id v96 = v113;
  id v190 = v96;
  id v97 = v9;
  id v191 = v97;
  uint64_t v192 = v151;
  id v124 = (id)v123;
  id v193 = v124;
  double v201 = v32;
  id v194 = v144;
  v198 = v205;
  uint64_t v200 = v147;
  __int16 v199 = v207;
  id v98 = (void *)MEMORY[0x19F38D650](v169);
  v153[0] = MEMORY[0x1E4F143A8];
  v153[1] = 3221225472;
  v153[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_222;
  v153[3] = &unk_1E5863508;
  id v99 = v97;
  id v154 = v99;
  id v155 = v152;
  id v156 = v94;
  id v157 = v95;
  id v158 = v145;
  id v159 = v149;
  id v160 = self;
  id v161 = v137;
  id v100 = v96;
  id v162 = v100;
  id v163 = v146;
  id v165 = v209;
  BOOL v166 = v227;
  char v167 = v207;
  long long v168 = v205;
  uint64_t v101 = (void (**)(void))v138;
  id v164 = v101;
  uint64_t v102 = (void *)MEMORY[0x19F38D650](v153);
  uint64_t v103 = [v99 objectForKey:@"imagejob_transient_save_transaction"];
  LODWORD(v96) = [v103 BOOLValue];

  if (v96)
  {
    uint64_t v104 = (void *)[v98 copy];
    [v99 setObject:v104 forKey:@"imagejob_transient_transaction_block"];

    int v105 = (void *)[v102 copy];
    [v99 setObject:v105 forKey:@"imagejob_transient_transaction_completion_block"];

    v101[2](v101);
  }
  else
  {
    [v106 performTransaction:v98 completionHandler:v102 withPriority:1];
  }

  _Block_object_dispose(v205, 8);
  _Block_object_dispose(v207, 8);

  _Block_object_dispose(v209, 8);
  _Block_object_dispose(v227, 8);

  id v82 = v114;
LABEL_111:

  _Block_object_dispose(buf, 8);
}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetWithUUID:*(void *)(a1 + 40)];
  uint64_t v1 = +[PLAssetTransactionReason transactionReason:@"[ProcessImageJob]We failed to create the finalized image data, so now we remove the in-flight asset."];
  [v2 deleteWithReason:v1];
}

uint64_t __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeTransientKeys:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_3(id *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_4;
  v3[3] = &unk_1E5873A50;
  id v2 = a1[4];
  id v4 = a1[5];
  id v5 = a1[4];
  id v6 = a1[6];
  [v2 performTransaction:v3];
}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x1E4F8C880]];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v3 setObject:v5 forKey:*MEMORY[0x1E4F8C878]];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    [v3 setObject:v6 forKey:*MEMORY[0x1E4F8CA10]];
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F8C8D0]];
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    [v3 setObject:v8 forKey:@"ImportedBy"];
  }
  id v9 = [*(id *)(a1 + 72) objectForKey:*MEMORY[0x1E4F2F800]];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F2F7E0]];
  id v11 = (void *)v10;
  id v12 = &unk_1EEBED2A8;
  if (v10) {
    id v12 = (void *)v10;
  }
  id v13 = v12;

  [v3 setObject:v13 forKey:*MEMORY[0x1E4F8C900]];
  if (*(void *)(a1 + 80))
  {
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 88), "assetWithUUID:");
    uint64_t v15 = v14;
    if (v14
      && [v14 isPhotoStreamPhoto]
      && [v15 visibilityState] != 2)
    {
      [v15 setVisibilityState:2];
      uint64_t v102 = [v15 publicGlobalUUID];
    }
    else
    {
      uint64_t v102 = 0;
    }
  }
  else
  {
    uint64_t v102 = 0;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F8CC48]);
  uint64_t v17 = *(void *)(a1 + 96);
  id v18 = [*(id *)(a1 + 88) libraryBundle];
  BOOL v19 = [v18 timeZoneLookup];
  long long v20 = (void *)[v16 initWithImageURL:v17 contentType:0 options:12 timeZoneLookup:v19 cacheImageSource:1 cacheImageData:1];

  if (*(unsigned char *)(a1 + 290)) {
    uint64_t v21 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v21 = 0;
  }
  LOBYTE(v100) = 0;
  LOBYTE(v99) = *(unsigned char *)(a1 + 290) != 0;
  long long v22 = [*(id *)(a1 + 88) addDCIMEntryAtFileURL:*(void *)(a1 + 104) mainFileMetadata:v20 previewImage:*(void *)(a1 + 112) thumbnailImage:0 savedAssetType:*(__int16 *)(a1 + 288) replacementUUID:*(void *)(a1 + 120) publicGlobalUUID:v102 extendedInfo:v3 withUUID:*(void *)(a1 + 128) isPlaceholder:v99 placeholderFileURL:v21 forFinalCameraImage:v100];
  id v23 = v22;
  char v24 = *(void **)(a1 + 136);
  if (v24)
  {
    id v25 = [v22 dateCreated];
    BOOL IsApproximatelyEqual = PLDateIsApproximatelyEqual(v24, v25, 0.001);

    if (!IsApproximatelyEqual)
    {
      [v23 didSetCustomDateCreated];
      [v23 setDateCreated:*(void *)(a1 + 136)];
    }
    [*(id *)(a1 + 136) timeIntervalSinceReferenceDate];
    objc_msgSend(v23, "setSortToken:");
  }
  if (*(unsigned char *)(a1 + 291)) {
    [v23 setKindSubtype:2];
  }
  uint64_t v27 = *(void **)(a1 + 144);
  if (v27 && *(void *)(a1 + 152))
  {
    objc_msgSend(v23, "setWidth:", objc_msgSend(v27, "longLongValue"));
    objc_msgSend(v23, "setHeight:", objc_msgSend(*(id *)(a1 + 152), "longLongValue"));
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40))
  {
    int v28 = *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 40)
        ? objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:")
        : 0;
    int v29 = *(void *)(a1 + 168) ? objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:") : 0;
    if (((v28 | v29) & 1) == 0)
    {
      uint64_t v30 = *(void **)(a1 + 176);
      uint64_t v31 = *(void *)(a1 + 184);
      uint64_t v32 = *(void *)(a1 + 112);
      id v33 = [*(id *)(a1 + 96) path];
      id v34 = [v33 lastPathComponent];
      int v35 = [v30 writeFilteredPreviewWithImageData:v31 orImage:v32 toPathWithBaseName:v34];

      if (v35)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 240) + 8) + 40), v35);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) = 1;
      }
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40)
    || (uint64_t v54 = *(void *)(a1 + 192)) != 0
    && [*(id *)(a1 + 160) fileExistsAtPath:v54 isDirectory:0])
  {
    uint64_t v37 = (id *)(a1 + 168);
    uint64_t v36 = *(void *)(a1 + 168);
    if (v36 && ([*(id *)(a1 + 160) fileExistsAtPath:v36 isDirectory:0] & 1) != 0)
    {
      char v38 = 0;
    }
    else
    {
      uint64_t v37 = (id *)(*(void *)(*(void *)(a1 + 240) + 8) + 40);
      char v38 = 1;
    }
    id v39 = *v37;
    double v40 = *MEMORY[0x1E4F1DB30];
    double v41 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40))
    {
      uint64_t v42 = [*(id *)(a1 + 200) objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
      uint64_t v43 = [*(id *)(a1 + 200) objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
      id v44 = (void *)v43;
      if (v42 && v43)
      {
        [v42 floatValue];
        double v40 = v45;
        [v44 floatValue];
        double v41 = v46;
      }
    }
    long long v47 = objc_opt_class();
    uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40);
    uint64_t v49 = *(void *)(a1 + 192);
    BOOL v50 = [*(id *)(a1 + 208) cameraMetadata];
    LOBYTE(v98) = v38;
    objc_msgSend(v47, "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v23, v20, v48, v49, v39, v50, v40, v41, v98);
  }
  if (*(void *)(a1 + 216))
  {
    objc_msgSend(v23, "setAvalancheUUID:");
    id v51 = [*(id *)(a1 + 200) objectForKey:*MEMORY[0x1E4F8C8B8]];
    uint64_t v52 = v51;
    if (v51) {
      uint64_t v53 = [v51 intValue];
    }
    else {
      uint64_t v53 = 2;
    }
    [v23 setAvalanchePickType:v53];
    if (+[PLAvalanche shouldOnlyShowAvalanchePicks])
    {
      uint64_t v55 = [*(id *)(a1 + 200) objectForKey:*MEMORY[0x1E4F8C8C8]];
      long long v56 = v55;
      if (v55) {
        __int16 v57 = [v55 intValue];
      }
      else {
        __int16 v57 = 2;
      }
      [v23 setVisibilityState:v57];
    }
  }
  long long v58 = [v23 avalancheUUID];

  if (v58)
  {
    long long v59 = [v23 avalancheUUID];
    uint64_t v60 = [*(id *)(a1 + 88) managedObjectContext];
    char v61 = +[PLAvalanche assetsWithAvalancheUUID:v59 inManagedObjectContext:v60];

    id v62 = +[PLAvalanche revalidateAvalancheAssets:v61 inLibrary:*(void *)(a1 + 88) deleteNonPicks:0 allowDissolve:1];
  }
  BOOL v63 = [*(id *)(a1 + 200) objectForKey:*MEMORY[0x1E4F8C868]];
  id v64 = v63;
  if (v63) {
    objc_msgSend(v23, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", (__int16)objc_msgSend(v63, "intValue"));
  }
  char v65 = [*(id *)(a1 + 200) objectForKey:*MEMORY[0x1E4F8C860]];
  id v66 = v65;
  if (v65) {
    objc_msgSend(v23, "setKindSubtype:", (__int16)objc_msgSend(v65, "intValue"));
  }
  int v67 = *(void **)(a1 + 208);
  if (v67) {
    [v67 applyCameraMetadataToAsset:v23];
  }
  uint64_t v68 = *(void *)(a1 + 224);
  if (v68)
  {
    uint64_t v69 = [v23 additionalAttributes];
    [v69 setDeferredPhotoIdentifier:*(void *)(a1 + 224)];

    if ([v20 isDeferredPhotoProxyExpectingDepth])
    {
      [v23 setDepthType:1];
      [v23 setEditableDepthBadgeAttribute:1];
    }
    BOOL v70 = [*(id *)(a1 + 88) constraintsDirector];
    [v70 informPhotoCapturedThatNeedsDeferredProcessing];
  }
  else
  {
    BOOL v70 = [*(id *)(a1 + 88) constraintsDirector];
    [v70 informPhotoCapturedThatNeedsQuickFace];
  }

  if ([(id)objc_opt_class() semanticEnhanceSceneIsValid:*(void *)(a1 + 272)])
  {
    if (!*(void *)(a1 + 224)) {
      [v23 setDeferredProcessingNeeded:10];
    }
    __int16 v71 = [v23 additionalAttributes];
    objc_msgSend(v71, "setDeferredProcessingCandidateOptions:", objc_msgSend(v71, "deferredProcessingCandidateOptions") | 8);
  }
  else if (!v68)
  {
    goto LABEL_98;
  }
  if (*(void *)(a1 + 224)) {
    [v23 setDeferredProcessingNeeded:1];
  }
  uint64_t v72 = *(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40);
  if (v72)
  {
    id v104 = 0;
    id v73 = [MEMORY[0x1E4F8CBC8] deserializedAdjustmentsFromData:v72 error:&v104];
    id v74 = v104;
    if (v73)
    {
      if (!objc_msgSend(v73, "canBeRenderedByCapturePipelineWithVideoComplement:deferredIdentifier:", objc_msgSend(v23, "kindSubtype") == 2, *(void *)(a1 + 224)))
      {
LABEL_96:

        goto LABEL_97;
      }
      uint64_t v101 = v3;
      dispatch_time_t v75 = v20;
      int v76 = PLAssetImportGetLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        id v77 = [v23 uuid];
        *(_DWORD *)CMTime buf = 138543362;
        id v106 = v77;
        _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_DEFAULT, "Deferred capture will have render delivered by deferredmediad for asset: %{public}@", buf, 0xCu);
      }
      id v78 = [v23 additionalAttributes];
      [v78 setDeferredProcessingCandidateOptions:16];
    }
    else
    {
      uint64_t v101 = v3;
      dispatch_time_t v75 = v20;
      id v78 = PLAssetImportGetLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        long long v79 = [v23 uuid];
        *(_DWORD *)CMTime buf = 138543618;
        id v106 = v79;
        __int16 v107 = 2112;
        id v108 = v74;
        _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data for asset: %{public}@ error: %@", buf, 0x16u);
      }
    }

    long long v20 = v75;
    uint64_t v3 = v101;
    goto LABEL_96;
  }
LABEL_97:
  +[PLImageWriter _signalBackgroundProcessingNeededForAsset:v23 reason:@"needs capture scheduling"];
LABEL_98:
  if (*(unsigned char *)(a1 + 290))
  {
    long long v80 = [*(id *)(a1 + 200) objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
    uint64_t v81 = [*(id *)(a1 + 200) objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
    id v82 = (void *)v81;
    if (v80 && v81)
    {
      objc_msgSend(v23, "setWidth:", objc_msgSend(v80, "longLongValue"));
      objc_msgSend(v23, "setHeight:", objc_msgSend(v82, "longLongValue"));
    }
  }
  if (([v23 isInserted] & 1) == 0
    && [v23 isUpdated]
    && [v23 avalanchePickType] != 1)
  {
    [v23 setNeedsMomentUpdate:1];
  }
  if (v23)
  {
    id v103 = 0;
    BOOL v83 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v23 assumeNoExistingResources:0 referencedResourceURLs:0 error:&v103];
    id v84 = v103;
    if (v83)
    {
      uint64_t v85 = [v23 expectedDeferredProcessingNeededOnAssetCreation];
      if (v85)
      {
        [v23 setDeferredProcessingNeeded:v85];
        +[PLImageWriter _signalBackgroundProcessingNeededForAsset:v23 reason:@"expected deferred processing on asset creation"];
      }
    }
    else
    {
      __int16 v86 = PLMyPhotoStreamGetLog();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        id v106 = v23;
        __int16 v107 = 2112;
        id v108 = v84;
        _os_log_impl(&dword_19B3C7000, v86, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
      }
    }
    uint64_t v87 = [*(id *)(a1 + 200) objectForKey:@"job.private.ClientInLimitedLibraryMode"];
    int v88 = [v87 BOOLValue];

    uint64_t v89 = [*(id *)(a1 + 200) objectForKey:@"job.private.LimitedLibraryClientFetchFilterIdentifier"];
    uint64_t v90 = *(void *)(*(void *)(a1 + 256) + 8);
    uint64_t v91 = *(void **)(v90 + 40);
    *(void *)(v90 + 40) = v89;

    if (v88
      && [*(id *)(*(void *)(*(void *)(a1 + 256) + 8) + 40) length]
      && ([*(id *)(a1 + 64) intValue] == 6
       || [*(id *)(a1 + 64) intValue] == 9))
    {
      id v92 = [*(id *)(a1 + 200) objectForKey:@"job.private.LimitedLibraryClientAuthorization"];
      int v93 = *(void **)(a1 + 176);
      id v94 = [v23 uuid];
      uint64_t v95 = [v93 _processLimitedLibraryAdditionIfNeededWithAssetUUID:v94 clientBundleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 256) + 8) + 40) clientAuthorization:v92 library:*(void *)(a1 + 88)];
      uint64_t v96 = *(void *)(*(void *)(a1 + 264) + 8);
      id v97 = *(void **)(v96 + 40);
      *(void *)(v96 + 40) = v95;
    }
    [*(id *)(a1 + 200) setObject:v23 forKey:@"PLImageWriterTransientAsset"];
  }
}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_222(uint64_t a1)
{
  v89[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKey:@"PLImageWriterTransientAsset"];
  uint64_t v3 = *(void **)(a1 + 32);
  v89[0] = @"PLImageWriterTransientAsset";
  v89[1] = @"imagejob_transient_publicGlobalUUID";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
  [v3 removeObjectsForKeys:v4];

  uint64_t v5 = [v2 assetURL];
  if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48))
  {
    int v16 = 0;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)) {
      goto LABEL_62;
    }
    goto LABEL_50;
  }
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v80 = 0;
  char v8 = [v6 removeItemAtPath:v7 error:&v80];
  id v9 = v80;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = PLAssetImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void **)(a1 + 64);
      *(_DWORD *)CMTime buf = 138412546;
      id v84 = v17;
      __int16 v85 = 2112;
      id v86 = v9;
      id v12 = "Failed to delete incoming photo %@ : %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v10 = PLAssetImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = *(void **)(a1 + 64);
      *(_DWORD *)CMTime buf = 138412290;
      id v84 = v11;
      id v12 = "#### deleted %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 12;
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  id v18 = [*(id *)(a1 + 64) stringByDeletingPathExtension];
  BOOL v19 = [v18 stringByAppendingPathExtension:@"plist"];

  long long v20 = *(void **)(a1 + 56);
  id v79 = v9;
  LODWORD(v18) = [v20 removeItemAtPath:v19 error:&v79];
  id v21 = v79;

  if (v18 && *(void *)(a1 + 72))
  {
    long long v22 = PLAssetImportGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v84 = v19;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "#### deleted %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 80) _removeInProgressExtendedAttributesForFileAtURL:*(void *)(a1 + 48)];
  uint64_t v23 = *(void *)(a1 + 88);
  if (v23)
  {
    char v24 = *(void **)(a1 + 56);
    id v78 = v21;
    char v25 = [v24 removeItemAtPath:v23 error:&v78];
    id v26 = v78;

    if ((v25 & 1) == 0)
    {
      uint64_t v27 = PLAssetImportGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v33 = *(void **)(a1 + 88);
        *(_DWORD *)CMTime buf = 138412546;
        id v84 = v33;
        __int16 v85 = 2112;
        id v86 = v26;
        int v29 = "Failed to delete incoming diagnostic %@ : %@";
        uint64_t v30 = v27;
        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
        uint32_t v32 = 22;
        goto LABEL_26;
      }
LABEL_27:

      goto LABEL_28;
    }
    if (*(void *)(a1 + 72))
    {
      uint64_t v27 = PLAssetImportGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v28 = *(void **)(a1 + 88);
        *(_DWORD *)CMTime buf = 138412290;
        id v84 = v28;
        int v29 = "#### deleted %@";
        uint64_t v30 = v27;
        os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
        uint32_t v32 = 12;
LABEL_26:
        _os_log_impl(&dword_19B3C7000, v30, v31, v29, buf, v32);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
  }
  else
  {
    id v26 = v21;
  }
LABEL_28:
  uint64_t v34 = *(void *)(a1 + 96);
  if (v34)
  {
    int v35 = *(void **)(a1 + 56);
    id v77 = v26;
    char v36 = [v35 removeItemAtPath:v34 error:&v77];
    id v37 = v77;

    if ((v36 & 1) == 0)
    {
      char v38 = PLAssetImportGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v39 = *(void **)(a1 + 96);
        *(_DWORD *)CMTime buf = 138412546;
        id v84 = v39;
        __int16 v85 = 2112;
        id v86 = v37;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to delete incoming adjustment data %@ : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v37 = v26;
  }
  if (MEMORY[0x19F38BDA0]())
  {
    double v40 = PLAssetImportGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Stashing incoming mdata files if present because internal install", buf, 2u);
    }

    if (*(void *)(a1 + 104))
    {
      double v41 = [v2 photoLibrary];
      uint64_t v42 = [v2 filename];
      uint64_t v43 = +[PLManagedAsset diagnosticFilePathForLibrary:v41 mainFilename:v42 createIfNeeded:1];

      id v44 = [v43 stringByDeletingPathExtension];
      float v45 = [v44 stringByAppendingPathExtension:*MEMORY[0x1E4F8C620]];

      float v46 = *(void **)(a1 + 56);
      uint64_t v47 = *(void *)(a1 + 104);
      id v76 = 0;
      LOBYTE(v42) = [v46 copyItemAtPath:v47 toPath:v45 error:&v76];
      id v48 = v76;
      if ((v42 & 1) == 0)
      {
        uint64_t v49 = PLAssetImportGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          BOOL v50 = *(void **)(a1 + 104);
          *(_DWORD *)CMTime buf = 138412802;
          id v84 = v50;
          __int16 v85 = 2112;
          id v86 = v45;
          __int16 v87 = 2112;
          id v88 = v48;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Failed to copy incoming camera metadata %@ to %@ : %@", buf, 0x20u);
        }
      }
    }
  }
  uint64_t v51 = *(void *)(a1 + 104);
  if (v51)
  {
    uint64_t v52 = *(void **)(a1 + 56);
    id v75 = v37;
    char v53 = [v52 removeItemAtPath:v51 error:&v75];
    id v54 = v75;

    if ((v53 & 1) == 0)
    {
      uint64_t v55 = PLAssetImportGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        long long v56 = *(void **)(a1 + 104);
        *(_DWORD *)CMTime buf = 138412546;
        id v84 = v56;
        __int16 v85 = 2112;
        id v86 = v54;
        _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "Failed to delete incoming camera metadata %@ : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v54 = v37;
  }

  int v16 = 1;
LABEL_50:
  uint64_t v57 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
  if (v57 && [*(id *)(a1 + 56) fileExistsAtPath:v57 isDirectory:0])
  {
    long long v58 = *(void **)(a1 + 56);
    uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
    id v74 = 0;
    char v60 = [v58 removeItemAtPath:v59 error:&v74];
    id v61 = v74;
    if (v60)
    {
      if (!*(void *)(a1 + 72) || *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)) {
        goto LABEL_61;
      }
      id v62 = PLAssetImportGetLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        BOOL v63 = *(void **)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
        *(_DWORD *)CMTime buf = 138412290;
        id v84 = v63;
        id v64 = "#### deleted %@";
        char v65 = v62;
        os_log_type_t v66 = OS_LOG_TYPE_DEBUG;
        uint32_t v67 = 12;
LABEL_59:
        _os_log_impl(&dword_19B3C7000, v65, v66, v64, buf, v67);
      }
    }
    else
    {
      id v62 = PLAssetImportGetLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = *(void **)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
        *(_DWORD *)CMTime buf = 138412546;
        id v84 = v68;
        __int16 v85 = 2112;
        id v86 = v61;
        id v64 = "Failed to delete incoming filtered preview %@ : %@";
        char v65 = v62;
        os_log_type_t v66 = OS_LOG_TYPE_ERROR;
        uint32_t v67 = 22;
        goto LABEL_59;
      }
    }

LABEL_61:
  }
LABEL_62:
  if (*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40))
  {
    uint64_t v69 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v70 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    uint64_t v71 = *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40);
    uint64_t v81 = @"PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier";
    uint64_t v82 = v71;
    uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    [v69 postNotificationName:@"PLLimitedLibraryFetchFiltersUpdatedNotification" object:v70 userInfo:v72];
  }
  [*(id *)(a1 + 80) _removeTransientKeys:*(void *)(a1 + 32)];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:*MEMORY[0x1E4F8C870]];
  }
  if (v16)
  {
    id v73 = [*(id *)(a1 + 48) path];
    [*(id *)(a1 + 32) setObject:v73 forKeyedSubscript:*MEMORY[0x1E4F8C948]];
  }
  (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
  [*(id *)(a1 + 80) _decrementJobCount:*(void *)(a1 + 32)];
}

uint64_t __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_4(void *a1)
{
  +[PLImageWriter photoIrisPairingDidSucceed:0 fileIndicatorPath:a1[4] photoAsset:0 photoLibrary:a1[5]];
  id v2 = (void *)a1[6];
  return [v2 stillAlive];
}

- (void)_linkDiagnosticFileWithSourcePath:(id)a3 forPhotoDestinationURL:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = v8;
  if (v6 && [v8 fileExistsAtPath:v6 isDirectory:0])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    id v11 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _linkDiagnosticFileWithSourcePath:forPhotoDestinationURL:]");
    id v12 = [v7 lastPathComponent];
    id v13 = +[PLManagedAsset diagnosticFilePathForLibrary:v11 mainFilename:v12 createIfNeeded:1];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
      uint32_t v15 = (void *)v14;
      if (!v10 || !v14) {
        goto LABEL_17;
      }
      id v20 = 0;
      char v16 = [MEMORY[0x1E4F8B908] copyItemAtURL:v10 toURL:v14 error:&v20];
      uint64_t v17 = v20;
      if ((v16 & 1) == 0)
      {
        id v18 = PLAssetImportGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 138412802;
          id v22 = v10;
          __int16 v23 = 2112;
          char v24 = v15;
          __int16 v25 = 2112;
          id v26 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@: %@", buf, 0x20u);
        }

        uint64_t v10 = 0;
      }
      BOOL v19 = PLAssetImportGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CMTime buf = 138412290;
        id v22 = v15;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Linked diagnosticPath to %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = PLAssetImportGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 134218240;
        id v22 = v11;
        __int16 v23 = 2048;
        char v24 = v12;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to get a diagnostic file URL (library: %p, mainFilename: %p)", buf, 0x16u);
      }
      uint32_t v15 = 0;
    }

LABEL_17:
  }
}

- (id)writeFilteredPreviewWithImageData:(id)a3 orImage:(id)a4 toPathWithBaseName:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = v7;
LABEL_3:
    id v11 = [v9 stringByAppendingPathExtension:@"tempFilteredPreview.JPG"];
    id v12 = NSTemporaryDirectory();
    id v13 = [v12 stringByAppendingPathComponent:v11];

    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v15 = [v14 fileExistsAtPath:v13 isDirectory:0];

    if (v15)
    {
      char v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v25 = 0;
      char v17 = [v16 removeItemAtPath:v13 error:&v25];
      id v18 = v25;

      if ((v17 & 1) == 0)
      {
        BOOL v19 = PLAssetImportGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 138412546;
          uint64_t v27 = v13;
          __int16 v28 = 2112;
          id v29 = v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to remove existing temporary filtered preview file before writing %@, %@", buf, 0x16u);
        }
      }
    }
    id v24 = 0;
    char v20 = [v10 writeToFile:v13 options:1073741825 error:&v24];
    id v21 = v24;
    if ((v20 & 1) == 0)
    {
      id v22 = PLAssetImportGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        uint64_t v27 = v13;
        __int16 v28 = 2112;
        id v29 = v21;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to write filtered preview thumbnail to temporary file: %@, %@", buf, 0x16u);
      }

      id v13 = 0;
    }

    goto LABEL_19;
  }
  if (v8)
  {
    id v10 = (id)DCIM_newJPEGRepresentationWithPLImage();
    if (v10) {
      goto LABEL_3;
    }
  }
  id v11 = PLAssetImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to get jpeg data for filtered preview thumbnail", buf, 2u);
  }
  id v10 = 0;
  id v13 = 0;
LABEL_19:

  return v13;
}

- (void)_removeTransientKeys:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F8C958];
  id v4 = a3;
  [v4 removeObjectForKey:v3];
  [v4 removeObjectForKey:*MEMORY[0x1E4F8CA98]];
  [v4 removeObjectForKey:*MEMORY[0x1E4F8CA90]];
  [v4 removeObjectForKey:*MEMORY[0x1E4F8CAE0]];
  [v4 removeObjectForKey:@"PLImageWriterTransientAsset"];
}

- (id)pathForNewAssetPathAtAlbumDirectoryPath:(id)a3 assetType:(unsigned int)a4 extension:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    os_log_type_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v32 = NSStringFromSelector(a2);
    [v31 handleFailureInMethod:a2, self, @"PLImageWriter.m", 587, @"%@ can only be called from assetsd", v32 object file lineNumber description];
  }
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v11 fileExistsAtPath:v9])
  {
    id v12 = 0;
  }
  else
  {
    id v34 = 0;
    char v13 = [v11 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v34];
    id v14 = v34;
    if ((v13 & 1) == 0)
    {
      int v15 = PLAssetImportGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        char v36 = v9;
        __int16 v37 = 2112;
        id v38 = v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error creating album subdirectory %@ : %@", buf, 0x16u);
      }
      id v22 = 0;
      id v12 = v14;
      goto LABEL_29;
    }
    int v15 = [v9 stringByAppendingPathComponent:@".MISC"];
    id v33 = v14;
    char v16 = [v11 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v12 = v33;

    if ((v16 & 1) == 0)
    {
      uint64_t v27 = PLAssetImportGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412546;
        char v36 = v15;
        __int16 v37 = 2112;
        id v38 = v12;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Error creating album misc subdirectory %@ : %@", buf, 0x16u);
      }

      id v22 = 0;
      goto LABEL_29;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v18 = [WeakRetained pathManager];
  int v19 = [v18 isUBF];

  if (!v19)
  {
    char v20 = [(id)__albumDCIMDirectoriesByPath objectForKey:v9];
    if (!v20)
    {
      if (!__albumDCIMDirectoriesByPath)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v24 = (void *)__albumDCIMDirectoriesByPath;
        __albumDCIMDirectoriesByPath = (uint64_t)v23;
      }
      char v20 = (void *)[objc_alloc(MEMORY[0x1E4F8B970]) initWithDCIMPath:v9];
      [(id)__albumDCIMDirectoriesByPath setObject:v20 forKey:v9];
    }
    [v20 lockDirectory];
    id v21 = [v20 nextAvailableDirectory];
    id v25 = [v21 nextAvailableFileGroup];
    [v21 ensureDirectoryExists];
    [v20 unlockDirectory];
    if (a4 == 1)
    {
      uint64_t v26 = [v25 pathForVideoFile];
    }
    else
    {
      if (a4)
      {
        id v22 = 0;
        goto LABEL_26;
      }
      uint64_t v26 = [v25 pathForFullSizeImage];
    }
    id v22 = (void *)v26;
LABEL_26:

    goto LABEL_27;
  }
  char v20 = [MEMORY[0x1E4F29128] UUID];
  id v21 = [v20 UUIDString];
  id v22 = [v9 stringByAppendingPathComponent:v21];
LABEL_27:

  if (![v10 length]) {
    goto LABEL_30;
  }
  int v15 = [v22 stringByDeletingPathExtension];
  __int16 v28 = [v10 uppercaseString];
  uint64_t v29 = [v15 stringByAppendingPathExtension:v28];

  id v22 = (void *)v29;
LABEL_29:

LABEL_30:
  return v22;
}

- (id)_pathForNewAssetWithPath:(id)a3 withExtension:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    id v23 = NSStringFromSelector(a2);
    [v22 handleFailureInMethod:a2, self, @"PLImageWriter.m", 560, @"%@ can only be called from assetsd", v23 object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x19F38D3B0]();
  id v10 = v7;
  id v11 = v10;
  if ([v8 length])
  {
    id v12 = [v10 pathExtension];
    char v13 = [v12 isEqualToString:v8];

    id v11 = v10;
    if ((v13 & 1) == 0)
    {
      id v14 = [v10 stringByDeletingPathExtension];
      int v15 = [v8 uppercaseString];
      id v11 = [v14 stringByAppendingPathExtension:v15];
    }
  }
  char v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v17 = [v11 stringByDeletingLastPathComponent];
  id v24 = 0;
  char v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v19 = v24;

  if ((v18 & 1) == 0)
  {
    char v20 = PLAssetImportGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138412802;
      uint64_t v26 = v11;
      __int16 v27 = 2114;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@, extension: %{public}@ (Error: %@)", buf, 0x20u);
    }
  }

  return v11;
}

- (id)pathForNewAssetWithDirectoryPath:(id)a3 fileName:(id)a4 extension:(id)a5
{
  id v8 = a5;
  id v9 = [a3 stringByAppendingPathComponent:a4];
  id v10 = [(PLImageWriter *)self _pathForNewAssetWithPath:v9 withExtension:v8];

  return v10;
}

- (id)cameraAssetPathForNewAssetWithExtension:(id)a3 assetUUID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint32_t v32 = __Block_byref_object_copy__5318;
  id v33 = __Block_byref_object_dispose__5319;
  id v34 = 0;
  p_libraryServicesManager = &self->_libraryServicesManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v11 = [WeakRetained pathManager];
  int v12 = [v11 isUBF];

  if (v12)
  {
    if (!v8)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PLImageWriter.m", 531, @"Invalid parameter not satisfying: %@", @"assetUUID" object file lineNumber description];
      goto LABEL_16;
    }
    if (v7)
    {
      char v13 = [MEMORY[0x1E4F8CDF8] typeForFilenameExtensionOrLastPathComponent:v7];
      id v14 = [v13 identifier];
    }
    else
    {
      id v14 = 0;
    }
    char v18 = (void *)[objc_alloc(MEMORY[0x1E4F8B978]) initWithAssetUuid:v8 bundleScope:0 uti:v14 resourceVersion:0 resourceType:31];
    id v19 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    id v21 = [v19 pathManager];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__PLImageWriter_cameraAssetPathForNewAssetWithExtension_assetUUID___block_invoke;
    v28[3] = &unk_1E58634B8;
    v28[4] = &v29;
    [v21 obtainAccessAndWaitWithFileWithIdentifier:v18 mode:2 toURLWithHandler:v28];
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    char v16 = [v15 pathManager];
    id v14 = [v16 simpleDCIMDirectory];

    if (v14)
    {
      char v17 = [v14 nextAvailableFileURLWithExtension:v7];
      char v18 = v17;
      if (!v17)
      {
        __int16 v27 = PLAssetImportGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)CMTime buf = 138412290;
          id v36 = v7;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_FAULT, "Failed to get next available URL under DCIM folder for extension: %@", buf, 0xCu);
        }

        id v19 = [NSString stringWithFormat:@"Unexpected nil value for DCIM directory for extension: %@", v7];
        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", @"Unexpected Photo Library state", @"Please file a Radar against Photos", @"TTR: -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] Unexpected nil value for DCIM directory", v19);
        char v18 = 0;
        goto LABEL_15;
      }
      id v19 = [v17 path];
      uint64_t v20 = [(PLImageWriter *)self _pathForNewAssetWithPath:v19 withExtension:v7];
      id v21 = (void *)v30[5];
      v30[5] = v20;
    }
    else
    {
      id v22 = PLAssetImportGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)CMTime buf = 138412290;
        id v36 = v7;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_FAULT, "Failed to get the DCIM directory for extension: %@", buf, 0xCu);
      }

      id v23 = NSString;
      id v19 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      id v21 = [v19 pathManager];
      id v24 = [v23 stringWithFormat:@"Unexpected nil value for DCIM directory for\nextension: %@\nLSM: %@\nlibrary: %@", v7, v19, v21];
      +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", @"Unexpected Photo Library state", @"Please file a Radar against Photos", @"TTR: -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] Unexpected nil value for DCIM directory", v24);

      id v14 = 0;
      char v18 = v19;
    }
  }

LABEL_15:
LABEL_16:

  id v25 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v25;
}

void __67__PLImageWriter_cameraAssetPathForNewAssetWithExtension_assetUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 path];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)delayJob:(id)a3 delay:(int64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLImageWriter delayJob:delay:]"];
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * a4);
  jobQueue = self->_jobQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PLImageWriter_delayJob_delay___block_invoke;
  block[3] = &unk_1E5873A50;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v8, jobQueue, block);
}

uint64_t __32__PLImageWriter_delayJob_delay___block_invoke(uint64_t a1)
{
  id v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Delay elapsed, processing job", v4, 2u);
  }

  [*(id *)(a1 + 32) _processJob:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _decrementJobCount:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 48) stillAlive];
}

- (BOOL)enqueueJob:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F8C968];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C968]];

  if (!v6)
  {
    ++enqueueJob__s_jobIndex;
    id v7 = objc_msgSend(NSNumber, "numberWithInt:");
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
  [(PLImageWriter *)self _incrementJobCount:v4];
  uint64_t v8 = *MEMORY[0x1E4F8C970];
  id v9 = [v4 objectForKey:*MEMORY[0x1E4F8C970]];
  id v10 = PLAssetImportGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 138543362;
    uint64_t v23 = (uint64_t)v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Started queueing jobType: %{public}@", buf, 0xCu);
  }

  if (enqueueJob__onceToken != -1) {
    dispatch_once(&enqueueJob__onceToken, &__block_literal_global_5609);
  }
  if (enqueueJob__debugVideoJobDelay
    && ([v4 objectForKeyedSubscript:v8],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:*MEMORY[0x1E4F8C9D8]],
        v11,
        v12))
  {
    id v13 = PLAssetImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 134217984;
      uint64_t v23 = enqueueJob__debugVideoJobDelay;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Delaying video job for %ld seconds", buf, 0xCu);
    }

    uint64_t v14 = enqueueJob__debugVideoJobDelay;
  }
  else
  {
    if (!enqueueJob__debugImageJobDelay
      || ([v4 objectForKeyedSubscript:v8],
          id v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 isEqualToString:*MEMORY[0x1E4F8C9B8]],
          v15,
          !v16))
    {
      jobQueue = self->_jobQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __28__PLImageWriter_enqueueJob___block_invoke_132;
      v20[3] = &unk_1E5875E18;
      v20[4] = self;
      id v21 = v4;
      dispatch_async(jobQueue, v20);

      goto LABEL_19;
    }
    char v17 = PLAssetImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 134217984;
      uint64_t v23 = enqueueJob__debugImageJobDelay;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Delaying image job for %ld seconds", buf, 0xCu);
    }

    uint64_t v14 = enqueueJob__debugImageJobDelay;
  }
  [(PLImageWriter *)self delayJob:v4 delay:v14];
LABEL_19:

  return 1;
}

uint64_t __28__PLImageWriter_enqueueJob___block_invoke_132(uint64_t a1)
{
  [*(id *)(a1 + 32) _processJob:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _decrementJobCount:v3];
}

void __28__PLImageWriter_enqueueJob___block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 integerForKey:@"PLImageWriterVideoJobDebugDelayOverride"];
  if (v1 >= 0) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = -v1;
  }
  enqueueJob__debugVideoJobDelay = v2;

  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v5 integerForKey:@"PLImageWriterImageJobDebugDelayOverride"];
  if (v3 >= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = -v3;
  }
  enqueueJob__debugImageJobDelay = v4;
}

- (BOOL)_hasNonCrashRecoveryJobsEnqueued
{
  uint64_t v2 = self;
  p_transactionLocuint64_t k = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  LOBYTE(v2) = v2->_transactionCounter > v2->_crashRecoveryCounter;
  os_unfair_lock_unlock(p_transactionLock);
  return (char)v2;
}

- (void)_decrementJobCount:(id)a3
{
  id v18 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4F8C970];
  id v7 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
  LODWORD(v5) = [v5 _requiresIndicatorFileForJobType:v7];

  if (v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    int v8 = self->_unfinishedJobsRequiringIndicatorCount - 1;
    self->_unfinishedJobsRequiringIndicatorCount = v8;
    if (!v8)
    {
      id v9 = [(PLImageWriter *)self indicatorFileCoordinator];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      id v11 = [WeakRetained crashRecoverySupport];
      [v9 setImageWriter:self isBusy:0 crashRecoverySupport:v11];
    }
    os_unfair_recursive_lock_unlock();
  }
  os_unfair_lock_lock(&self->_transactionLock);
  if (!self->_transactionCounter)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLImageWriter.m", 449, @"Invalid parameter not satisfying: %@", @"_transactionCounter > 0" object file lineNumber description];
  }
  if (!self->_transaction)
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLImageWriter.m", 450, @"Invalid parameter not satisfying: %@", @"_transaction" object file lineNumber description];
  }
  unint64_t v12 = self->_transactionCounter - 1;
  self->_transactionCounter = v12;
  if (!v12)
  {
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  uint64_t v14 = objc_opt_class();
  id v15 = [v18 objectForKeyedSubscript:v6];
  LODWORD(v14) = [v14 _requiresCrashRecoveryForJobType:v15];

  if (v14) {
    --self->_crashRecoveryCounter;
  }
  os_unfair_lock_unlock(&self->_transactionLock);
}

- (void)_incrementJobCount:(id)a3
{
  id v20 = a3;
  os_unfair_lock_lock(&self->_transactionLock);
  unint64_t transactionCounter = self->_transactionCounter;
  self->_unint64_t transactionCounter = transactionCounter + 1;
  transaction = self->_transaction;
  if (transactionCounter)
  {
    if (!transaction)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PLImageWriter.m", 420, @"Invalid parameter not satisfying: %@", @"_transaction" object file lineNumber description];
    }
    os_transaction_needs_more_time();
  }
  else
  {
    if (transaction)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"PLImageWriter.m", 417, @"Invalid parameter not satisfying: %@", @"!_transaction" object file lineNumber description];
    }
    id v7 = (OS_os_transaction *)os_transaction_create();
    int v8 = self->_transaction;
    self->_transaction = v7;
  }
  id v9 = objc_opt_class();
  uint64_t v10 = *MEMORY[0x1E4F8C970];
  id v11 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
  LODWORD(v9) = [v9 _requiresCrashRecoveryForJobType:v11];

  if (v9) {
    ++self->_crashRecoveryCounter;
  }
  os_unfair_lock_unlock(&self->_transactionLock);
  unint64_t v12 = objc_opt_class();
  id v13 = [v20 objectForKeyedSubscript:v10];
  LODWORD(v12) = [v12 _requiresIndicatorFileForJobType:v13];

  if (v12)
  {
    os_unfair_recursive_lock_lock_with_options();
    int unfinishedJobsRequiringIndicatorCount = self->_unfinishedJobsRequiringIndicatorCount;
    self->_int unfinishedJobsRequiringIndicatorCount = unfinishedJobsRequiringIndicatorCount + 1;
    if (!unfinishedJobsRequiringIndicatorCount)
    {
      id v15 = [(PLImageWriter *)self indicatorFileCoordinator];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      char v17 = [WeakRetained crashRecoverySupport];
      [v15 setImageWriter:self isBusy:1 crashRecoverySupport:v17];
    }
    os_unfair_recursive_lock_unlock();
  }
}

- (id)indicatorFileCoordinator
{
  indicatorFileCoordinator = self->_indicatorFileCoordinator;
  if (!indicatorFileCoordinator)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    id v5 = [WeakRetained libraryBundle];
    uint64_t v6 = [v5 indicatorFileCoordinator];
    id v7 = self->_indicatorFileCoordinator;
    self->_indicatorFileCoordinator = v6;

    indicatorFileCoordinator = self->_indicatorFileCoordinator;
  }
  return indicatorFileCoordinator;
}

- (BOOL)canEnqueueJob:(id)a3
{
  return 1;
}

- (BOOL)_isHighPriorityJob:(id)a3
{
  uint64_t v3 = [a3 objectForKey:*MEMORY[0x1E4F8C970]];
  BOOL v4 = ([v3 isEqualToString:*MEMORY[0x1E4F8C9B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C990]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C980]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C988]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C9D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C9F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C9E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8C9E0]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x1E4F8C9D0]];

  return v4;
}

- (id)_newShortLivedLibraryWithName:(const char *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v5 = [WeakRetained databaseContext];
  uint64_t v6 = (void *)[v5 newShortLivedLibraryWithName:a3 libraryRole:2];

  return v6;
}

- (PLImageWriter)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLImageWriter;
  id v5 = [(PLImageWriter *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.backend.imageWriterQueue", v7);
    jobQueue = v6->_jobQueue;
    v6->_jobQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.backend.imageWriterCompletionQueue", v10);
    jobCompletionQueue = v6->_jobCompletionQueue;
    v6->_jobCompletionQueue = (OS_dispatch_queue *)v11;

    v6->_jobCountLocuint64_t k = 0;
    *(unint64_t *)((char *)&v6->_transactionCounter + 4) = 0;
    *(void *)&v6->_transactionLock._os_unfair_lock_opaque = 0;
    HIDWORD(v6->_crashRecoveryCounter) = 0;
  }

  return v6;
}

- (PLImageWriter)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"You just got singlestacked" reason:@"Must use an initializer that takes a library services manager" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)pathComponentForIncomingHoldingDirectory
{
  return @"PhotosIncomingHoldingDirectory";
}

+ (void)setAdjustmentsForNewVideo:(id)a3 mainFileMetadata:(id)a4 withAdjustmentsDictionary:(id)a5 cameraAdjustments:(id)a6 renderedContentPath:(id)a7 renderedPosterFramePreviewPath:(id)a8 finalAssetSize:(CGSize)a9
{
  double height = a9.height;
  double width = a9.width;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (!v18)
  {
    if (!v19) {
      goto LABEL_31;
    }
    double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*MEMORY[0x1E4F1DB30] == width && v25 == height)
    {
      double height = 0.0;
      double width = 0.0;
      if (objc_msgSend(v16, "originalWidth", *MEMORY[0x1E4F1DB30], v25) >= 1) {
        double width = (double)(unint64_t)[v16 originalWidth];
      }
      if ([v16 originalHeight] >= 1) {
        double height = (double)(unint64_t)[v16 originalHeight];
      }
    }
    uint64_t v23 = +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:](PLPhotoEditExportProperties, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)width, (unint64_t)height, 0, 0.0, v25);
    uint64_t v27 = +[PLImageWriter _assetAdjustmentsFromCameraAdjustmentData:v19 cameraMetadata:0 exportProperties:v23 assetType:1 applySemanticEnhance:0 sourceURL:0];
    if (!v27)
    {

      goto LABEL_31;
    }
    uint64_t v24 = (void *)v27;
    id v28 = [v16 dateCreated];
    [v24 setAdjustmentTimestamp:v28];

    if (v20)
    {
      uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v30 = [v29 fileExistsAtPath:v20];

      if ((v30 & 1) == 0)
      {
        uint64_t v31 = PLAssetImportGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 138412290;
          id v39 = v20;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "setting adjustments but rendered image does not exist at %@", (uint8_t *)&v38, 0xCu);
        }
      }
      uint32_t v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
      if (!v21) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v37 = PLAssetImportGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "setting adjustments with no filteredImagePath provided", (uint8_t *)&v38, 2u);
      }

      uint32_t v32 = 0;
      if (!v21) {
        goto LABEL_23;
      }
    }
    uint64_t v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21 isDirectory:0];

    uint32_t v32 = (void *)v33;
LABEL_23:
    id v34 = +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v32, 1, v17, width, height);
    [v16 setAdjustments:v24 options:v34];

    if (([v16 setCurrentAdjustmentAsOriginalAdjustment] & 1) == 0)
    {
      int v35 = PLAssetImportGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "setting original adjustment for asset failed", (uint8_t *)&v38, 2u);
      }
    }
    goto LABEL_29;
  }
  uint64_t v22 = [objc_alloc(MEMORY[0x1E4F8CBB8]) initWithPropertyListDictionary:v18];
  if (!v22)
  {
LABEL_31:
    [v16 setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:v17];
    goto LABEL_32;
  }
  uint64_t v23 = (void *)v22;
  if (v20)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v36 = +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v24, 0, v17, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [v16 setAdjustments:v23 options:v36];

  uint32_t v32 = [v16 dateCreated];
  [v16 setModificationDate:v32];
LABEL_29:

LABEL_32:
}

+ (BOOL)_hasPrimaryAssetAndAdjustmentsFilesWithType:(signed __int16)a3 inIncomingFilenames:(id)a4 forAssetUUID:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!v8)
  {
    BOOL v23 = 0;
    goto LABEL_29;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v9)
  {
    BOOL v23 = 0;
    goto LABEL_28;
  }
  uint64_t v10 = v9;
  id v25 = v7;
  char v11 = 0;
  BOOL v12 = 0;
  uint64_t v13 = *(void *)v29;
  uint64_t v26 = *MEMORY[0x1E4F8C618];
LABEL_4:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v29 != v13) {
      objc_enumerationMutation(obj);
    }
    id v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
    id v16 = [a1 _assetUUIDFromIncomingFilename:v15];
    int v17 = [v16 isEqualToString:v8];

    if (v17) {
      break;
    }
LABEL_13:
    if (v12) {
      goto LABEL_14;
    }
LABEL_15:
    if (v10 == ++v14)
    {
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v10 = v22;
      if (!v22)
      {
        BOOL v23 = 0;
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }
  if (v11)
  {
    int v18 = 0;
  }
  else
  {
    id v19 = [v15 pathExtension];
    int v18 = [v19 isEqualToString:v26];
  }
  if ((v12 | v18))
  {
    v11 |= v18;
    goto LABEL_13;
  }
  id v20 = [v15 pathExtension];
  id v21 = [v15 stringByDeletingPathExtension];
  if ([v21 hasSuffix:v8]) {
    BOOL v12 = +[PLPhotoLibrary isImageFileExtension:v20];
  }
  else {
    BOOL v12 = 0;
  }

  if (!v12) {
    goto LABEL_15;
  }
LABEL_14:
  if ((v11 & 1) == 0) {
    goto LABEL_15;
  }
  BOOL v23 = 1;
LABEL_25:
  id v7 = v25;
LABEL_28:

LABEL_29:
  return v23;
}

+ (id)_assetUUIDFromIncomingFilename:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:*MEMORY[0x1E4F8C638]];
  if ([v3 count] == 2)
  {
    id v4 = [v3 objectAtIndex:1];
    id v5 = [v4 componentsSeparatedByString:@"."];
    uint64_t v6 = [v5 firstObject];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)photoIrisPairingDidSucceed:(BOOL)a3 fileIndicatorPath:(id)a4 photoAsset:(id)a5 photoLibrary:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"PLImageWriter.m" lineNumber:2687 description:@"expect photo indicator file"];
  }
  if (PLDoesIndicatorFileExistAtPath())
  {
    if (v11 && !v12)
    {
      uint64_t v14 = _uuidFromPhotoIrisIndicatorFilePath(v11);
      if (v14)
      {
        id v15 = [v13 managedObjectContext];
        id v12 = +[PLImageWriter _fetchPhotoAssetForUUID:v14 moc:v15];
      }
      else
      {
        id v12 = 0;
      }
    }
    if (v12)
    {
      if (!a3 && [v12 kindSubtype] == 2)
      {
        int v17 = PLAssetImportGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = [v12 uuid];
          int v21 = 138412290;
          id v22 = v18;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "photo asset %@ got no video, demoting subtype", (uint8_t *)&v21, 0xCu);
        }
        [v12 setKindSubtype:0];
        if ([v12 hasAdjustments]
          && ![v12 deferredProcessingNeeded])
        {
          [v12 setDeferredProcessingNeeded:2];
          +[PLImageWriter _signalBackgroundProcessingNeededForAsset:v12 reason:@"live photo demote"];
        }
      }
    }
    else
    {
      id v19 = PLAssetImportGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v11;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "unable to locate photo asset from indicator file %@", (uint8_t *)&v21, 0xCu);
      }
    }
    PLMakeIndicatorFileExistAtPath();
  }
  else
  {
    id v16 = PLAssetImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      id v22 = v11;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "ignoring pairing operation for indicator file %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

+ (id)_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(NSObject **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        id v11 = [v9 lastPathComponent];
        id v12 = [v10 _assetUUIDFromIncomingFilename:v11];

        id v13 = PLAssetImportGetLog();
        uint64_t v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 136446466;
            long long v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
            __int16 v30 = 2114;
            long long v31 = v9;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s Malformed path, ignoring %{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)CMTime buf = 136446466;
          long long v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
          __int16 v30 = 2114;
          long long v31 = v12;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: assetUUID %{public}@", buf, 0x16u);
        }

        id v15 = [v4 objectForKeyedSubscript:v12];

        if (v15)
        {
          id v16 = PLAssetImportGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = [v4 objectForKeyedSubscript:v12];
            *(_DWORD *)CMTime buf = 136446978;
            long long v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
            __int16 v30 = 2114;
            long long v31 = v12;
            __int16 v32 = 2114;
            uint64_t v33 = v17;
            __int16 v34 = 2114;
            int v35 = v9;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Redundant render/adjustment file associated with asset %{public}@: previously found %{public}@, removing %{public}@", buf, 0x2Au);
          }
          int v18 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v23 = 0;
          char v19 = [v18 removeItemAtPath:v9 error:&v23];
          uint64_t v14 = v23;

          if ((v19 & 1) == 0)
          {
            id v20 = PLAssetImportGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 138543618;
              long long v29 = v12;
              __int16 v30 = 2112;
              long long v31 = v14;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to remove asset crash recovery resource path for asset:%{public}@ %@", buf, 0x16u);
            }
          }
LABEL_18:

          goto LABEL_20;
        }
        [v4 setObject:v9 forKeyedSubscript:v12];
LABEL_20:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)_fetchPhotoAssetForUUID:(id)a3 moc:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = +[PLManagedAsset entityName];
  uint64_t v9 = [v6 fetchRequestWithEntityName:v8];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@ AND noindex:(kind) = %d", v5, 0];
  [v9 setPredicate:v10];

  [v9 setFetchLimit:1];
  id v16 = 0;
  id v11 = [v7 executeFetchRequest:v9 error:&v16];

  id v12 = v16;
  if (!v11)
  {
    id v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138543618;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetchPhotoAssetForUUID:%{public}@ %@", buf, 0x16u);
    }
  }
  uint64_t v14 = [v11 firstObject];

  return v14;
}

+ (BOOL)setAdjustmentsForNewPhoto:(id)a3 mainFileMetadata:(id)a4 cameraAdjustmentData:(id)a5 adjustmentDataPath:(id)a6 filteredImagePath:(id)a7 cameraMetadata:(id)a8 finalAssetSize:(CGSize)a9 isSubstandardRender:(BOOL)a10
{
  double height = a9.height;
  double width = a9.width;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  unint64_t v20 = (unint64_t)a5;
  unint64_t v21 = (unint64_t)a6;
  id v22 = a7;
  id v23 = a8;
  if (!(v20 | v21))
  {
    BOOL v29 = 0;
    goto LABEL_38;
  }
  long long v24 = (void *)MEMORY[0x19F38D3B0]();
  double v25 = *MEMORY[0x1E4F1DB30];
  double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == width && v26 == height)
  {
    double height = 0.0;
    double width = 0.0;
    if (objc_msgSend(v18, "originalWidth", v25, v26) >= 1) {
      double width = (double)(unint64_t)[v18 originalWidth];
    }
    if ([v18 originalHeight] >= 1) {
      double height = (double)(unint64_t)[v18 originalHeight];
    }
  }
  int v28 = objc_msgSend(v18, "orientation", v25, v26);
  if (v18) {
    [v18 photoIrisVideoDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  __int16 v30 = +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:(unint64_t)width imageHeight:(unint64_t)height exifOrientation:v28 duration:CMTimeGetSeconds(&time)];
  if (v20)
  {
    long long v31 = [a1 _assetAdjustmentsFromCameraAdjustmentData:v20 cameraMetadata:v23 exportProperties:v30 assetType:0 applySemanticEnhance:0 sourceURL:0];
    if (!v21) {
      goto LABEL_21;
    }
LABEL_19:
    if (!v31)
    {
      long long v31 = [a1 assetAdjustmentsFromCameraAdjustmentsFileAtPath:v21 exportProperties:v30 cameraMetadata:v23];
    }
    goto LABEL_21;
  }
  long long v31 = 0;
  if (v21) {
    goto LABEL_19;
  }
LABEL_21:
  BOOL v29 = v31 != 0;
  if (v31)
  {
    id v44 = v30;
    float v45 = v24;
    __int16 v32 = [v18 dateCreated];
    [v31 setAdjustmentTimestamp:v32];

    id v46 = v23;
    if (v22)
    {
      id v33 = v19;
      __int16 v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v35 = [v34 fileExistsAtPath:v22];

      if ((v35 & 1) == 0)
      {
        id v36 = PLAssetImportGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 138412290;
          id v49 = v22;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "setting adjustments but rendered image does not exist at %@", buf, 0xCu);
        }
      }
      uint64_t v37 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22 isDirectory:0];
      id v19 = v33;
    }
    else
    {
      int v38 = PLAssetImportGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "setting adjustments with no filteredImagePath provided", buf, 2u);
      }

      uint64_t v37 = 0;
    }
    id v39 = v19;
    uint64_t v40 = +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v37, a10, v19, width, height);
    [v18 setAdjustments:v31 options:v40];

    if (a10 && ([v18 setCurrentAdjustmentAsOriginalAdjustment] & 1) == 0)
    {
      double v41 = PLAssetImportGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "setting original adjustment for asset failed", buf, 2u);
      }
    }
    uint64_t v42 = [v18 dateCreated];
    [v18 setModificationDate:v42];

    id v19 = v39;
    long long v24 = v45;
    id v23 = v46;
    __int16 v30 = v44;
  }

LABEL_38:

  return v29;
}

+ (id)_assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v14)
  {
    id v30 = 0;
    id v18 = [MEMORY[0x1E4F8CBC8] deserializedAdjustmentsFromData:v14 error:&v30];
    id v19 = v30;
    unint64_t v20 = v19;
    if (v18) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v19 == 0;
    }
    int v22 = v21;
    if (!v21)
    {
      unsigned int v29 = v10;
      id v23 = PLAssetImportGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v14 length];
        *(_DWORD *)CMTime buf = 134218242;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        __int16 v34 = v20;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Error deserializing camera adjustments data (length=%lu): %@", buf, 0x16u);
      }

      uint64_t v10 = v29;
    }

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    id v18 = 0;
    int v22 = 1;
    if (v9)
    {
LABEL_13:
      BOOL v25 = +[PLCompositionHelper wantsSemanticEnhanceForCameraMetadata:v15];
      goto LABEL_16;
    }
  }
  BOOL v25 = 0;
LABEL_16:
  if (v18) {
    int v26 = 1;
  }
  else {
    int v26 = v25;
  }
  if ((v22 & v26) == 1)
  {
    long long v27 = [a1 _assetAdjustmentsFromCameraAdjustments:v18 cameraMetadata:v15 exportProperties:v16 assetType:v10 applySemanticEnhance:v9 sourceURL:v17];
  }
  else
  {
    long long v27 = 0;
  }

  return v27;
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 exportProperties:(id)a4
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustmentData:a3 cameraMetadata:0 exportProperties:a4 assetType:0 applySemanticEnhance:0 sourceURL:0];
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustmentData:a3 cameraMetadata:a4 exportProperties:a5 assetType:0 applySemanticEnhance:a6 sourceURL:0];
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7 sourceURL:(id)a8
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustmentData:a3 cameraMetadata:a4 exportProperties:a5 assetType:a7 applySemanticEnhance:a6 sourceURL:a8];
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustmentData:a3 cameraMetadata:a4 exportProperties:a5 assetType:a7 applySemanticEnhance:a6 sourceURL:0];
}

+ (id)_assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8
{
  BOOL v9 = a7;
  int v10 = a6;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v9) {
    BOOL v9 = +[PLCompositionHelper wantsSemanticEnhanceForCameraMetadata:v15];
  }
  if (!v14 && !v9)
  {
    id v18 = 0;
    goto LABEL_45;
  }
  id v53 = a1;
  uint64_t v52 = [v14 effectFilterName];
  uint64_t v19 = [v14 portraitEffectFilterName];
  uint64_t v20 = [v14 portraitMetadata];
  int v21 = [v14 isDepthEnabled];
  id v22 = +[PLCompositionHelper newIdentityCompositionController];
  id v23 = v22;
  if (v10 == 1) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 1;
  }
  [v22 setMediaType:v24];
  BOOL v25 = [v23 adjustmentConstants];
  int v26 = (void *)v20;
  long long v27 = v25;
  id v54 = (void *)v19;
  if (v19) {
    int v28 = 1;
  }
  else {
    int v28 = v21;
  }
  uint64_t v51 = v26;
  if (v28 == 1 && v26)
  {
    +[PLPhotoEditRenderer updateCompositionController:fromPortraitMetadata:](PLPhotoEditRenderer, "updateCompositionController:fromPortraitMetadata:", v23);
    if (v21)
    {
      unsigned int v29 = [v23 depthAdjustmentController];
      id v30 = [v29 depthInfo];
      uint64_t v31 = [v30 count];

      if (v31)
      {
        uint64_t v32 = [v27 PIDepthAdjustmentKey];
        [v23 modifyAdjustmentWithKey:v32 modificationBlock:&__block_literal_global_259];
      }
    }
    if (!v54) {
      goto LABEL_31;
    }
    __int16 v33 = [v23 portraitAdjustmentController];
    __int16 v34 = [v33 portraitInfo];
    uint64_t v35 = [v34 count];

    if (!v35) {
      goto LABEL_31;
    }
    id v36 = +[PLPhotoEffect effectWithCIFilterName:v54];
    if (v36)
    {
      uint64_t v37 = [v27 PIPortraitAdjustmentKey];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2;
      v62[3] = &unk_1E5868460;
      BOOL v63 = v36;
      [v23 modifyAdjustmentWithKey:v37 modificationBlock:v62];

      int v38 = v63;
    }
    else
    {
      int v38 = PLAssetImportGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412290;
        char v65 = v54;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to create photo effect for %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v39 = v21 ^ 1;
    if (v10 != 1) {
      char v39 = 1;
    }
    if (v39) {
      goto LABEL_31;
    }
    uint64_t v40 = [v25 PIPortraitVideoAdjustmentKey];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_262;
    v60[3] = &unk_1E5863558;
    id v41 = v14;
    id v61 = v41;
    [v23 modifyAdjustmentWithKey:v40 modificationBlock:v60];

    if ([v41 isEligibleForCinematicAudioEffectProcessing])
    {
      uint64_t v42 = [v27 PICinematicAudioAdjustmentKey];
      [v23 modifyAdjustmentWithKey:v42 modificationBlock:&__block_literal_global_267];
    }
    id v36 = v61;
  }

LABEL_31:
  if (v52)
  {
    uint64_t v43 = +[PLPhotoEffect effectWithCIFilterName:v52];
    id v44 = v43;
    if (v43)
    {
      +[PLCompositionHelper compositionController:setEffectFilterName:version:](PLCompositionHelper, "compositionController:setEffectFilterName:version:", v23, v52, [v43 latestVersion]);
    }
    else
    {
      float v45 = PLAssetImportGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 138412290;
        char v65 = v52;
        _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "Failed to create photo effect for %@", buf, 0xCu);
      }
    }
  }
  if ([v14 hasCrop])
  {
    id v46 = [v27 PICropAdjustmentKey];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_268;
    v57[3] = &unk_1E58635A0;
    id v58 = v14;
    id v59 = v16;
    [v23 modifyAdjustmentWithKey:v46 modificationBlock:v57];
  }
  if (v9) {
    +[PLCompositionHelper compositionController:v23 updateSemanticEnhanceFromCameraMetadata:v15 exportProperties:v16];
  }
  if ([v14 isSloMoEnabled])
  {
    uint64_t v47 = [MEMORY[0x1E4F16330] assetWithURL:v17];
    id v48 = [v27 PISlomoAdjustmentKey];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_270;
    v55[3] = &unk_1E58635C8;
    id v56 = v47;
    id v49 = v47;
    [v23 modifyAdjustmentWithKey:v48 modificationBlock:v55];
  }
  id v18 = [v53 assetAdjustmentsFromCompositionController:v23 exportProperties:v16];

LABEL_45:
  return v18;
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setEnabled:1];
  id v3 = [*(id *)(a1 + 32) filterIdentifier];
  [v4 setKind:v3];

  objc_msgSend(v4, "setVersion:", objc_msgSend(*(id *)(a1 + 32), "latestVersion"));
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_262(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:1];
  objc_msgSend(v3, "setRenderingVersionAtCapture:", objc_msgSend(*(id *)(a1 + 32), "cinematicVideoRenderingVersion"));
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_268(uint64_t a1, void *a2)
{
  id v9 = a2;
  [*(id *)(a1 + 32) cropRect];
  objc_msgSend(v9, "setCropRect:");
  [v9 setEnabled:1];
  unint64_t v3 = [*(id *)(a1 + 40) imageHeight];
  unint64_t v4 = [*(id *)(a1 + 40) imageWidth];
  uint64_t v5 = 9;
  if (v4 <= v3) {
    uint64_t v6 = 9;
  }
  else {
    uint64_t v6 = 16;
  }
  if (v4 <= v3) {
    uint64_t v5 = 16;
  }
  if (v3 == v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v3 == v4) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v5;
  }
  [v9 setConstraintWidth:v7];
  [v9 setConstraintHeight:v8];
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_270(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F8CE18];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v2 defaultSlowMotionAdjustmentsForAsset:v3];
  uint64_t v6 = v5;
  memset(&v13, 0, sizeof(v13));
  if (v5) {
    [v5 slowMotionTimeRange];
  }
  long long v11 = *(_OWORD *)&v13.start.value;
  CMTimeEpoch epoch = v13.start.epoch;
  [v4 setStartTime:&v11];
  CMTimeRange range = v13;
  CMTimeRangeGetEnd(&v10, &range);
  CMTime v8 = v10;
  [v4 setEndTime:&v8];
  [v6 slowMotionRate];
  [v4 setRate:v7];
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_264(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRenderingStyleToDefaultForPortraitVideo];
  [v2 setEnabled:1];
}

uint64_t __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:1];
}

+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustments:a3 cameraMetadata:a4 exportProperties:a5 assetType:0 applySemanticEnhance:0 sourceURL:0];
}

+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6
{
  return (id)[a1 _assetAdjustmentsFromCameraAdjustments:a3 cameraMetadata:a4 exportProperties:a5 assetType:0 applySemanticEnhance:a6 sourceURL:0];
}

+ (id)assetAdjustmentsFromCameraAdjustmentsFileAtPath:(id)a3 exportProperties:(id)a4 cameraMetadata:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8];
  id v27 = 0;
  id v12 = [MEMORY[0x1E4F8CBC8] deserializedAdjustmentsFromData:v11 error:&v27];
  id v13 = v27;
  if (v13)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v8];
    if (v14)
    {
      id v22 = v9;
      id v23 = v10;
      id v25 = 0;
      id v26 = 0;
      id v24 = 0;
      int v15 = [MEMORY[0x1E4F8CBC8] deserializeDictionary:v14 toFilters:&v26 portraitMetadata:&v25 error:&v24];
      id v16 = v26;
      id v17 = v25;
      id v18 = v24;
      if (v15)
      {
        id v9 = v22;
        uint64_t v19 = [a1 assetAdjustmentsFromCameraFilters:v16 portraitMetadata:v17 exportProperties:v22 cameraMetadata:v23];
      }
      else
      {
        uint64_t v20 = PLAssetImportGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 138412546;
          id v29 = v8;
          __int16 v30 = 2112;
          id v31 = v18;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Error deserializing camera adjustments dictionary at path %@: %@", buf, 0x16u);
        }

        uint64_t v19 = 0;
        id v9 = v22;
      }

      id v10 = v23;
    }
    else
    {
      id v16 = PLAssetImportGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 138412290;
        id v29 = v8;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Could not read camera adjustments dictionary from path %@", buf, 0xCu);
      }
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = [a1 assetAdjustmentsFromCameraAdjustments:v12 cameraMetadata:v10 exportProperties:v9];
  }

  return v19;
}

+ (id)assetAdjustmentsFromCameraFilters:(id)a3 portraitMetadata:(id)a4 exportProperties:(id)a5 cameraMetadata:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F8CC58];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  [v15 setPortraitMetadata:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PLImageWriter_assetAdjustmentsFromCameraFilters_portraitMetadata_exportProperties_cameraMetadata___block_invoke;
  v19[3] = &unk_1E5863530;
  id v20 = v15;
  id v16 = v15;
  [v14 enumerateObjectsUsingBlock:v19];

  id v17 = [a1 assetAdjustmentsFromCameraAdjustments:v16 cameraMetadata:v11 exportProperties:v12];

  return v17;
}

void __100__PLImageWriter_assetAdjustmentsFromCameraFilters_portraitMetadata_exportProperties_cameraMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  if ([v3 isEqualToString:@"CIDepthEffect"])
  {
    [*(id *)(a1 + 32) setDepthEnabled:1];
  }
  else if ([v3 hasPrefix:@"CIPhotoEffect"])
  {
    [*(id *)(a1 + 32) setEffectFilterName:v3];
  }
  else if ([v3 hasPrefix:@"CIPortraitEffect"])
  {
    [*(id *)(a1 + 32) setPortraitEffectFilterName:v3];
  }
}

+ (id)assetAdjustmentsFromCompositionController:(id)a3 exportProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  float v7 = objc_alloc_init(PLPhotoEditPersistenceManager);
  id v17 = 0;
  id v18 = 0;
  id v8 = [(PLPhotoEditPersistenceManager *)v7 dataFromCompositionController:v6 outFormatIdentifier:&v18 outFormatVersion:&v17 exportProperties:v5];

  id v9 = v18;
  id v10 = v17;
  id v11 = [v6 adjustmentConstants];
  id v12 = [v11 PISemanticEnhanceAdjustmentKey];
  id v13 = [v6 adjustmentControllerForKey:v12];

  if (v13) {
    uint64_t v14 = 24640;
  }
  else {
    uint64_t v14 = 24576;
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v9 formatVersion:v10 data:v8 baseVersion:0 editorBundleID:@"com.apple.camera" renderTypes:v14];

  return v15;
}

+ (BOOL)semanticEnhanceSceneIsValid:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xFFFFFFFFFFFFFFFELL;
}

+ (id)cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 pathManager];
  float v7 = [v6 privateDirectoryWithSubType:9 createIfNeeded:1 error:0];

  id v8 = [v5 path];

  id v9 = [v8 lastPathComponent];
  id v10 = [v9 stringByDeletingPathExtension];
  id v11 = [v10 stringByAppendingPathExtension:*MEMORY[0x1E4F8C620]];

  id v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [v7 stringByAppendingPathComponent:v11];
  uint64_t v14 = [v12 fileURLWithPath:v13];

  return v14;
}

+ (id)semanticEnhancePreviewDestinationURLForPrimaryAssetURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  id v5 = [v3 path];

  id v6 = [v5 stringByDeletingPathExtension];
  float v7 = [v6 stringByAppendingString:*MEMORY[0x1E4F8C540]];
  id v8 = [v7 stringByAppendingPathExtension:v4];

  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];

  return v9;
}

+ (id)finalizedAssetURLForDeferredPhotoPreviewURL:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDeferredPhotoPreviewURL:v6])
  {
    id v8 = [v6 lastPathComponent];
    id v9 = [v8 stringByDeletingPathExtension];
    uint64_t v10 = [v9 length];
    id v11 = objc_msgSend(v9, "substringToIndex:", v10 - objc_msgSend((id)*MEMORY[0x1E4F8C300], "length"));
    id v12 = v11;
    if (v7)
    {
      id v13 = [v11 stringByAppendingPathExtension:v7];
    }
    else
    {
      id v15 = [v8 pathExtension];
      id v13 = [v12 stringByAppendingPathExtension:v15];
    }
    id v16 = [v6 URLByDeletingLastPathComponent];
    uint64_t v14 = [v16 URLByAppendingPathComponent:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)isDeferredPhotoPreviewURL:(id)a3
{
  id v3 = [a3 lastPathComponent];
  id v4 = [v3 stringByDeletingPathExtension];
  if ([v4 hasPrefix:@"IMG_"])
  {
    if ([v4 hasSuffix:*MEMORY[0x1E4F8C300]]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 hasSuffix:*MEMORY[0x1E4F8C540]];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isSpatialOverCaptureURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  char v5 = [v4 stringByDeletingPathExtension];
  if ([v5 hasPrefix:@"IMG_"])
  {
    char v6 = [v5 hasSuffix:*MEMORY[0x1E4F8C548]];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F8B978] uuidFromURL:v3];
    if (v7) {
      char v6 = [v5 hasSuffix:*MEMORY[0x1E4F8C548]];
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

+ (void)_signalBackgroundProcessingNeededForAsset:(id)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = (__CFString *)a4;
  id v7 = [v5 photoLibrary];
  id v8 = [(__CFString *)v7 libraryServicesManager];
  id v9 = [v8 backgroundJobService];
  uint64_t v10 = PLAssetImportGetLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [v5 deferredProcessingNeeded];
      if (v12 > 0xB) {
        id v13 = 0;
      }
      else {
        id v13 = off_1E5865890[v12];
      }
      id v15 = v13;
      id v16 = [v5 uuidDescription];
      int v17 = 138543874;
      id v18 = v15;
      __int16 v19 = 2114;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "ImageWriter signaling %{public}@ background processing needed for %{public}@, due to %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [v9 startWatchdogTimerIfNeededWithSourceDescription:@"ImageWriter"];
    id v11 = [v5 photoLibrary];
    [v9 signalBackgroundProcessingNeededOnLibrary:v11];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = [v5 uuidDescription];
    int v17 = 138544386;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v14;
    __int16 v21 = 2048;
    id v22 = v7;
    __int16 v23 = 2048;
    id v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_FAULT, "ImageWriter is unable to signal background processing for %{public}@: asset: %{public}@, photoLibrary: %p, libraryServicesManager: %p, backgroundJobService: %p", (uint8_t *)&v17, 0x34u);
  }
}

+ (BOOL)_requiresCrashRecoveryForJobType:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8C998]];
}

+ (BOOL)_requiresAssetUUIDForJobType:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8C9C0]] ^ 1;
}

+ (BOOL)_requiresIndicatorFileForJobType:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:*MEMORY[0x1E4F8C9A0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F8C9F8]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F8C9B0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F8C978]] & 1) == 0
    && ![v3 isEqualToString:*MEMORY[0x1E4F8C9A8]];

  return v4;
}

@end