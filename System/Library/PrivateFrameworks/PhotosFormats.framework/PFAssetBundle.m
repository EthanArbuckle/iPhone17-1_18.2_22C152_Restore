@interface PFAssetBundle
+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4;
+ (BOOL)isValidDCFFileName:(id)a3;
+ (NSString)currentFormatVersion;
+ (UTType)contentType;
+ (id)insertAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoImageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalImageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalVideoDuration;
- (BOOL)_pathExtension:(id)a3 matchesType:(id)a4 error:(id *)a5;
- (BOOL)_verifyFileSourceExistsAtURL:(id)a3 error:(id *)a4;
- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 updateManifest:(id)a6 bundlePathKey:(id)a7 verifyUTIType:(__CFString *)a8 error:(id *)a9;
- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 writtenFileURL:(id *)a6 error:(id *)a7;
- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 writtenFileURL:(id *)a5 error:(id *)a6;
- (BOOL)didReadOriginalPairedVideoMetadata;
- (BOOL)isMediaSubtype:(unint64_t)a3;
- (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4 forceCopy:(BOOL)a5 error:(id *)a6;
- (BOOL)spatialOvercaptureResourcesPurgeable;
- (BOOL)writeAllResourceURLsToDirectoryAtURL:(id)a3 updatingManifest:(id)a4 error:(id *)a5;
- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4;
- (NSDate)libraryCreationDate;
- (NSDictionary)propertyList;
- (NSMutableDictionary)auxiliaryResourceURLsByKey;
- (NSMutableDictionary)metadata;
- (NSSet)keywordTitles;
- (NSString)accessibilityDescription;
- (NSString)assetDescription;
- (NSString)assetTitle;
- (NSString)livePhotoOriginalPairingIdentifier;
- (NSString)livePhotoPairingIdentifier;
- (NSString)originalFilename;
- (NSTimeZone)libraryCreationDateTimeZone;
- (NSURL)adjustmentBasePairedVideoURL;
- (NSURL)adjustmentBasePhotoURL;
- (NSURL)adjustmentBaseVideoURL;
- (NSURL)adjustmentDataURL;
- (NSURL)adjustmentSecondaryDataURL;
- (NSURL)alternatePhotoURL;
- (NSURL)audioURL;
- (NSURL)fullSizePairedVideoURL;
- (NSURL)fullSizePhotoURL;
- (NSURL)fullSizeVideoURL;
- (NSURL)originalAdjustmentDataURL;
- (NSURL)pairedVideoURL;
- (NSURL)photoURL;
- (NSURL)spatialOvercapturePairedVideoURL;
- (NSURL)spatialOvercapturePhotoURL;
- (NSURL)spatialOvercaptureVideoURL;
- (NSURL)videoURL;
- (PFAssetBundle)init;
- (PFAssetBundle)initWithAssetBundleAtURL:(id)a3;
- (PFAssetBundle)initWithOriginalPhotoURL:(id)a3 alternatePhotoURL:(id)a4 fullSizePhotoURL:(id)a5 adjustmentBaseFullSizePhotoURL:(id)a6 spatialOvercapturePhotoURL:(id)a7 originalPairedVideoURL:(id)a8 fullSizePairedVideoURL:(id)a9 adjustmentBaseFullSizePairedVideoURL:(id)a10 spatialOvercapturePairedVideoURL:(id)a11 fullSizeVideoURL:(id)a12 adjustmentsURL:(id)a13 originalAdjustmentsURL:(id)a14 adjustmentsSecondaryDataURL:(id)a15 mediaSubtypes:(unint64_t)a16 playbackStyle:(int64_t)a17 playbackVariation:(unint64_t)a18 videoComplementVisibilityState:(unsigned __int16)a19;
- (PFAssetBundle)initWithOriginalVideoURL:(id)a3 fullSizeRenderedVideoURL:(id)a4 adjustmentBaseVideoURL:(id)a5 spatialOvercaptureVideoURL:(id)a6 adjustmentsURL:(id)a7 originalAdjustmentsURL:(id)a8 mediaSubtypes:(unint64_t)a9 playbackStyle:(int64_t)a10 playbackVariation:(unint64_t)a11;
- (PFAssetBundle)initWithPropertyList:(id)a3;
- (id)URLForAuxiliaryResourceWithKey:(id)a3;
- (id)createAssetBundleWritingErrorWithDescription:(id)a3;
- (id)dcfCompliantFilenameBaseForWritingResourceFiles;
- (id)generateCustomFilenamesByPathKey;
- (id)libraryLocation;
- (id)urlsByPathKey;
- (id)writeDowngradedRepresentationToDirectory:(id)a3 error:(id *)a4;
- (id)writeFolderRepresentationToDirectory:(id)a3 error:(id *)a4;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)mediaSubtypes;
- (unint64_t)playbackVariation;
- (unsigned)videoComplementVisibilityState;
- (void)_readLivePhotoVideoMetadataIfNeeded;
- (void)addAuxiliaryResourceAtURL:(id)a3 resourceKey:(id)a4;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAssetDescription:(id)a3;
- (void)setAssetTitle:(id)a3;
- (void)setKeywordTitles:(id)a3;
- (void)setLibraryCreationDate:(id)a3 inTimeZone:(id)a4;
- (void)setLibraryLocation:(id)a3;
- (void)setLivePhotoOriginalImageDisplayTime:(id *)a3;
- (void)setLivePhotoOriginalPairingIdentifier:(id)a3;
- (void)setLivePhotoOriginalVideoDuration:(id *)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setPropertyList:(id)a3;
- (void)setSpatialOvercaptureResourcesPurgeable:(BOOL)a3;
@end

@implementation PFAssetBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryResourceURLsByKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_livePhotoOriginalPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentDataURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBaseVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercapturePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBasePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_fullSizePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_pairedVideoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBasePhotoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentDataURL, 0);
  objc_storeStrong((id *)&self->_fullSizeVideoURL, 0);
  objc_storeStrong((id *)&self->_fullSizePhotoURL, 0);
  objc_storeStrong((id *)&self->_alternatePhotoURL, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);

  objc_storeStrong((id *)&self->_photoURL, 0);
}

- (NSMutableDictionary)auxiliaryResourceURLsByKey
{
  return self->_auxiliaryResourceURLsByKey;
}

- (BOOL)didReadOriginalPairedVideoMetadata
{
  return self->_didReadOriginalPairedVideoMetadata;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setPropertyList:(id)a3
{
}

- (NSDictionary)propertyList
{
  return self->_propertyList;
}

- (void)setLivePhotoOriginalVideoDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoOriginalVideoDuration.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoOriginalVideoDuration.value = v3;
}

- (void)setLivePhotoOriginalImageDisplayTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoOriginalImageDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoOriginalImageDisplayTime.value = v3;
}

- (void)setLivePhotoOriginalPairingIdentifier:(id)a3
{
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (NSURL)originalAdjustmentDataURL
{
  return self->_originalAdjustmentDataURL;
}

- (NSURL)adjustmentBaseVideoURL
{
  return self->_adjustmentBaseVideoURL;
}

- (NSURL)spatialOvercaptureVideoURL
{
  return self->_spatialOvercaptureVideoURL;
}

- (NSURL)spatialOvercapturePairedVideoURL
{
  return self->_spatialOvercapturePairedVideoURL;
}

- (NSURL)spatialOvercapturePhotoURL
{
  return self->_spatialOvercapturePhotoURL;
}

- (NSURL)adjustmentBasePairedVideoURL
{
  return self->_adjustmentBasePairedVideoURL;
}

- (NSURL)fullSizePairedVideoURL
{
  return self->_fullSizePairedVideoURL;
}

- (NSURL)pairedVideoURL
{
  return self->_pairedVideoURL;
}

- (NSURL)adjustmentBasePhotoURL
{
  return self->_adjustmentBasePhotoURL;
}

- (NSURL)adjustmentDataURL
{
  return self->_adjustmentDataURL;
}

- (NSURL)fullSizeVideoURL
{
  return self->_fullSizeVideoURL;
}

- (NSURL)fullSizePhotoURL
{
  return self->_fullSizePhotoURL;
}

- (NSURL)alternatePhotoURL
{
  return self->_alternatePhotoURL;
}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSURL)photoURL
{
  return self->_photoURL;
}

- (id)writeFolderRepresentationToDirectory:(id)a3 error:(id *)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PFAssetBundle *)self photoURL];
  v8 = v7;
  v66 = a4;
  v62 = self;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(PFAssetBundle *)self videoURL];
  }
  v10 = v9;

  v63 = v10;
  v65 = [v10 URLByDeletingLastPathComponent];
  v11 = [v65 URLByDeletingPathExtension];
  uint64_t v12 = [v11 lastPathComponent];

  v67 = v6;
  v64 = (void *)v12;
  id v13 = [v6 URLByAppendingPathComponent:v12];
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = v13;
  v16 = [v15 path];
  v69 = v14;
  LODWORD(v14) = [v14 fileExistsAtPath:v16];

  v68 = v15;
  if (v14)
  {
    v17 = v15;
    do
    {
      v18 = [v17 lastPathComponent];
      v19 = objc_opt_new();
      v70 = v18;
      v20 = (void *)[v18 copy];
      v21 = [v20 pathExtension];
      if (([v21 isEqualToString:&stru_1EF7AE1F8] & 1) == 0)
      {
        while (1)
        {
          v22 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v21];
          if (([v22 isDeclared] & 1) == 0) {
            break;
          }
          [v19 addObject:v21];
          v23 = [v20 stringByDeletingPathExtension];

          v21 = [v23 pathExtension];
          v20 = v23;
          if ([v21 isEqualToString:&stru_1EF7AE1F8]) {
            goto LABEL_12;
          }
        }
      }
      v23 = v20;
LABEL_12:

      v24 = (void *)[v23 mutableCopy];
      v25 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v26 = [v24 rangeOfCharacterFromSet:v25 options:4];
      uint64_t v28 = v27;

      if (v28)
      {
        uint64_t v29 = [v24 length];
        uint64_t v30 = v29 - v26;
        v31 = objc_msgSend(v24, "substringWithRange:", v26, v29 - v26);
        v32 = v31;
        if (v31
          && (int v33 = [v31 intValue], objc_msgSend(v32, "floatValue"), v33)
          && (v34 == (float)v33 ? (BOOL v35 = v33 == -2147483647) : (BOOL v35 = 1),
              !v35 ? (BOOL v36 = v33 == 0x7FFFFFFF) : (BOOL v36 = 1),
              !v36))
        {
          objc_msgSend(v24, "deleteCharactersInRange:", v26, v30);
          v46 = objc_msgSend(NSString, "stringWithFormat:", @" %ld", v33 + 1);
          [v24 appendString:v46];
        }
        else
        {
          [v24 appendString:@" 2"];
        }
      }
      else
      {
        [v24 appendString:@" 2"];
      }
      if ([v19 count])
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v37 = [v19 reverseObjectEnumerator];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v73 objects:buf count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v74 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v73 + 1) + 8 * i);
              [v24 appendString:@"."];
              [v24 appendString:v42];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v73 objects:buf count:16];
          }
          while (v39);
        }
      }
      v43 = [v17 URLByDeletingLastPathComponent];
      id v15 = [v43 URLByAppendingPathComponent:v24];

      v44 = [v15 path];
      char v45 = [v69 fileExistsAtPath:v44];

      v17 = v15;
    }
    while ((v45 & 1) != 0);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v47 = [v67 path];
    v48 = [v15 lastPathComponent];
    *(_DWORD *)buf = 138543618;
    id v78 = v47;
    __int16 v79 = 2114;
    id v80 = v48;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Generating folder representation at: \"%{public}@\" with folder name: %{public}@", buf, 0x16u);
  }
  v49 = [MEMORY[0x1E4F28CB8] defaultManager];
  v50 = [v15 path];
  int v51 = [v49 fileExistsAtPath:v50];

  if ((v51 & 1) == 0)
  {
    v52 = [v15 path];
    id v72 = 0;
    int v53 = [v49 createDirectoryAtPath:v52 withIntermediateDirectories:1 attributes:0 error:&v72];
    id v54 = v72;

    if (!v53)
    {
      v58 = v66;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v78 = v15;
        __int16 v79 = 2114;
        id v80 = v54;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create folder at: %{public}@. Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_48;
    }
  }
  id v71 = 0;
  BOOL v55 = [(PFAssetBundle *)v62 writeAllResourceURLsToDirectoryAtURL:v15 updatingManifest:0 error:&v71];
  id v54 = v71;
  if (((v55 | v51) & 1) == 0)
  {
    [v49 removeItemAtURL:v15 error:0];
    v58 = v66;
LABEL_48:
    v56 = v63;
    goto LABEL_50;
  }
  v56 = v63;
  if (v55)
  {
    int v57 = 1;
    v58 = v66;
    if (!v66) {
      goto LABEL_54;
    }
LABEL_53:
    id *v58 = v54;
    goto LABEL_54;
  }
  v58 = v66;
LABEL_50:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v78 = v15;
    __int16 v79 = 2112;
    id v80 = v54;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create folder representation: %@. Error: %@.", buf, 0x16u);
  }
  int v57 = 0;
  if (v58) {
    goto LABEL_53;
  }
LABEL_54:
  if (v57) {
    v59 = v15;
  }
  else {
    v59 = 0;
  }
  id v60 = v59;

  return v60;
}

- (id)writeDowngradedRepresentationToDirectory:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [v6 path];
    id v49 = 0;
    int v11 = [v7 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v49];
    id v12 = v49;

    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v51 = v6;
        __int16 v52 = 2114;
        id v53 = v12;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not create directory at: %{public}@. Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_32;
    }
  }
  if ([(PFAssetBundle *)self mediaType] == 1)
  {
    if ([(PFAssetBundle *)self playbackStyle] == 5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from an auto-loop", buf, 2u);
      }
      id v13 = [(PFAssetBundle *)self pairedVideoURL];
      v47 = 0;
      id v48 = 0;
      [(PFAssetBundle *)self _writeFileAtURL:v13 toDirectory:v6 writtenFileURL:&v48 error:&v47];
      id v14 = v48;
      id v15 = v47;
    }
    else
    {
      char v19 = [(PFAssetBundle *)self mediaSubtypes];
      BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
      if ((v19 & 8) != 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a Live Photo", buf, 2u);
        }
        v24 = [(PFAssetBundle *)self fullSizePhotoURL];
        v25 = v24;
        if (v24)
        {
          id v26 = v24;
        }
        else
        {
          id v26 = [(PFAssetBundle *)self photoURL];
        }
        id v13 = v26;

        uint64_t v29 = [(PFAssetBundle *)self fullSizePairedVideoURL];
        uint64_t v30 = v29;
        if (v29)
        {
          id v31 = v29;
        }
        else
        {
          id v31 = [(PFAssetBundle *)self pairedVideoURL];
        }
        v32 = v31;

        int v33 = [MEMORY[0x1E4F29128] UUID];
        float v34 = [v33 UUIDString];
        BOOL v35 = [v34 stringByAppendingPathExtension:@"pvt"];

        BOOL v36 = [PFVideoComplement alloc];
        v41 = v32;
        v37 = [v32 path];
        uint64_t v38 = [v13 path];
        uint64_t v39 = [(PFVideoComplement *)v36 initWithPathToVideo:v37 pathToImage:v38];

        uint64_t v40 = [v6 URLByAppendingPathComponent:v35];
        id v46 = 0;
        LODWORD(v32) = [(PFVideoComplement *)v39 writeToBundleAtURL:v40 error:&v46];
        id v12 = v46;
        id v14 = 0;
        if (v32) {
          id v14 = v40;
        }

LABEL_31:
        if (v14) {
          goto LABEL_35;
        }
        goto LABEL_32;
      }
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a photo", buf, 2u);
      }
      v21 = [(PFAssetBundle *)self fullSizePhotoURL];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [(PFAssetBundle *)self photoURL];
      }
      id v13 = v23;

      v44 = 0;
      id v45 = 0;
      [(PFAssetBundle *)self _writeFileAtURL:v13 toDirectory:v6 writtenFileURL:&v45 error:&v44];
      id v14 = v45;
      id v15 = v44;
    }
LABEL_30:
    id v12 = v15;
    goto LABEL_31;
  }
  if ([(PFAssetBundle *)self mediaType] == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a video", buf, 2u);
    }
    v16 = [(PFAssetBundle *)self fullSizeVideoURL];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [(PFAssetBundle *)self videoURL];
    }
    id v13 = v18;

    uint64_t v42 = 0;
    id v43 = 0;
    [(PFAssetBundle *)self _writeFileAtURL:v13 toDirectory:v6 writtenFileURL:&v43 error:&v42];
    id v14 = v43;
    id v15 = v42;
    goto LABEL_30;
  }
  id v12 = 0;
LABEL_32:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v51 = v6;
    __int16 v52 = 2112;
    id v53 = v12;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create downgraded representation in directory: %@. Error: %@.", buf, 0x16u);
  }
  id v14 = 0;
LABEL_35:
  if (a4) {
    *a4 = v12;
  }
  id v27 = v14;

  return v27;
}

- (PFAssetBundle)initWithOriginalVideoURL:(id)a3 fullSizeRenderedVideoURL:(id)a4 adjustmentBaseVideoURL:(id)a5 spatialOvercaptureVideoURL:(id)a6 adjustmentsURL:(id)a7 originalAdjustmentsURL:(id)a8 mediaSubtypes:(unint64_t)a9 playbackStyle:(int64_t)a10 playbackVariation:(unint64_t)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v16)
  {
    id v23 = [v16 path];
    [v22 setObject:v23 forKeyedSubscript:@"PFAssetBundlePathVideoKey"];
  }
  if (v17)
  {
    v24 = [v17 path];
    [v22 setObject:v24 forKeyedSubscript:@"PFAssetBundlePathFullSizeVideoKey"];
  }
  if (v18)
  {
    v25 = [v18 path];
    [v22 setObject:v25 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBaseVideoKey"];
  }
  if (v19)
  {
    id v26 = [v19 path];
    [v22 setObject:v26 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercaptureVideoKey"];
  }
  if (v20)
  {
    id v27 = [v20 path];
    [v22 setObject:v27 forKeyedSubscript:@"PFAssetBundlePathAdjustmentDataKey"];
  }
  if (v21)
  {
    uint64_t v28 = [v21 path];
    [v22 setObject:v28 forKeyedSubscript:@"PFAssetBundlePathOriginalAdjustmentDataKey"];
  }
  uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  [v29 setObject:@"1" forKeyedSubscript:@"PFAssetBundleMetadataVersionKey"];
  [v29 setObject:&unk_1EF7CAAF0 forKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];
  uint64_t v30 = [NSNumber numberWithUnsignedInteger:a9];
  [v29 setObject:v30 forKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];

  id v31 = [NSNumber numberWithInteger:a10];
  [v29 setObject:v31 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];

  v32 = [NSNumber numberWithUnsignedInteger:a11];
  [v29 setObject:v32 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];

  [v29 setObject:&unk_1EF7CAB08 forKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];
  [v22 setObject:v29 forKeyedSubscript:@"PFAssetBundlePathMetadataKey"];
  int v33 = [(PFAssetBundle *)self initWithPropertyList:v22];

  return v33;
}

- (PFAssetBundle)initWithOriginalPhotoURL:(id)a3 alternatePhotoURL:(id)a4 fullSizePhotoURL:(id)a5 adjustmentBaseFullSizePhotoURL:(id)a6 spatialOvercapturePhotoURL:(id)a7 originalPairedVideoURL:(id)a8 fullSizePairedVideoURL:(id)a9 adjustmentBaseFullSizePairedVideoURL:(id)a10 spatialOvercapturePairedVideoURL:(id)a11 fullSizeVideoURL:(id)a12 adjustmentsURL:(id)a13 originalAdjustmentsURL:(id)a14 adjustmentsSecondaryDataURL:(id)a15 mediaSubtypes:(unint64_t)a16 playbackStyle:(int64_t)a17 playbackVariation:(unint64_t)a18 videoComplementVisibilityState:(unsigned __int16)a19
{
  id v24 = a3;
  id v63 = a4;
  id v62 = a5;
  id v61 = a6;
  id v60 = a7;
  id v59 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  v32 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v24)
  {
    int v33 = [v24 path];
    [v32 setObject:v33 forKeyedSubscript:@"PFAssetBundlePathPhotoKey"];
  }
  v58 = v30;
  if (v63)
  {
    float v34 = [v63 path];
    [v32 setObject:v34 forKeyedSubscript:@"PFAssetBundlePathAlternatePhotoKey"];
  }
  if (v62)
  {
    BOOL v35 = [v62 path];
    [v32 setObject:v35 forKeyedSubscript:@"PFAssetBundlePathFullSizePhotoKey"];
  }
  if (v61)
  {
    BOOL v36 = [v61 path];
    [v32 setObject:v36 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePhotoKey"];
  }
  if (v60)
  {
    v37 = [v60 path];
    [v32 setObject:v37 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePhotoKey"];
  }
  if (v59)
  {
    uint64_t v38 = [v59 path];
    [v32 setObject:v38 forKeyedSubscript:@"PFAssetBundlePathPairedVideoKey"];
  }
  if (v25)
  {
    uint64_t v39 = [v25 path];
    [v32 setObject:v39 forKeyedSubscript:@"PFAssetBundlePathFullSizePairedVideoKey"];
  }
  if (v26)
  {
    uint64_t v40 = [v26 path];
    [v32 setObject:v40 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePairedVideoKey"];
  }
  if (v27)
  {
    v41 = [v27 path];
    [v32 setObject:v41 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePairedVideoKey"];
  }
  if (v28)
  {
    uint64_t v42 = [v28 path];
    [v32 setObject:v42 forKeyedSubscript:@"PFAssetBundlePathFullSizeVideoKey"];
  }
  uint64_t v54 = v27;
  BOOL v55 = v25;
  int v57 = v24;
  if (v29)
  {
    id v43 = [v29 path];
    [v32 setObject:v43 forKeyedSubscript:@"PFAssetBundlePathAdjustmentDataKey"];
  }
  v44 = v29;
  if (v58)
  {
    id v45 = [v58 path];
    [v32 setObject:v45 forKeyedSubscript:@"PFAssetBundlePathOriginalAdjustmentDataKey"];
  }
  if (v31)
  {
    id v46 = [v31 path];
    [v32 setObject:v46 forKeyedSubscript:@"PFAssetBundlePathAdjustmentSecondaryDataKey"];
  }
  v47 = [MEMORY[0x1E4F1CA60] dictionary];
  [v47 setObject:@"1" forKeyedSubscript:@"PFAssetBundleMetadataVersionKey"];
  [v47 setObject:&unk_1EF7CAAD8 forKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];
  id v48 = [NSNumber numberWithUnsignedInteger:a16];
  [v47 setObject:v48 forKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];

  id v49 = [NSNumber numberWithInteger:a17];
  [v47 setObject:v49 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];

  v50 = [NSNumber numberWithUnsignedInteger:a18];
  [v47 setObject:v50 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];

  id v51 = [NSNumber numberWithUnsignedShort:a19];
  [v47 setObject:v51 forKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];

  [v32 setObject:v47 forKeyedSubscript:@"PFAssetBundlePathMetadataKey"];
  __int16 v52 = [(PFAssetBundle *)self initWithPropertyList:v32];

  return v52;
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 writtenFileURL:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v12 lastPathComponent];
  }
  id v17 = v16;
  id v18 = [v13 URLByAppendingPathComponent:v16];
  BOOL v19 = [(PFAssetBundle *)self linkOrCopyURL:v12 toURL:v18 forceCopy:0 error:a7];
  BOOL v20 = v19;
  if (a6 && v19) {
    *a6 = v18;
  }

  return v20;
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 writtenFileURL:(id *)a5 error:(id *)a6
{
  return [(PFAssetBundle *)self _writeFileAtURL:a3 toDirectory:a4 withUpdatedFilename:0 writtenFileURL:a5 error:a6];
}

- (id)createAssetBundleWritingErrorWithDescription:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  long long v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (__CFString *)[[v3 alloc] initWithFormat:v4 arguments:&v15];

  id v6 = @"Unknown reason";
  if (v5) {
    id v6 = v5;
  }
  v7 = v6;

  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = v7;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = [v8 errorWithDomain:@"com.apple.PhotosFormats" code:-1 userInfo:v9];

  return v10;
}

- (BOOL)_verifyFileSourceExistsAtURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v13 = 1;
  v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8 isDirectory:&v13];

  if (v9)
  {
    if (!v13)
    {
      LOBYTE(a4) = 1;
      goto LABEL_12;
    }
    if (a4)
    {
      *a4 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"Directory exists at '%@'", v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        v10 = MEMORY[0x1E4F14500];
        int v11 = "[PFAssetBundle] Source file is not a file, but a directory at URL: %@.";
LABEL_9:
        _os_log_impl(&dword_1A41FE000, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if (a4)
  {
    *a4 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"No file exists at '%@'", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      v10 = MEMORY[0x1E4F14500];
      int v11 = "[PFAssetBundle] Source file does not exist at URL: %@.";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(a4) = 0;
  }
LABEL_12:

  return (char)a4;
}

- (BOOL)_pathExtension:(id)a3 matchesType:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[PFUniformTypeUtilities typeWithFilenameExtension:v8];
  int v11 = [v8 uppercaseString];
  uint64_t v12 = [@"aae" uppercaseString];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = +[PFUniformTypeUtilities supplementalResourceAAEType];

    v10 = (void *)v14;
  }
  if (v10 && ([v10 conformsToType:v9] & 1) != 0)
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    *a5 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"UTType is not %@ for path extension '%@'", v9, v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Path extension: %@ does not conform to expected UTI: %@.", buf, 0x16u);
    }
    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 updateManifest:(id)a6 bundlePathKey:(id)a7 verifyUTIType:(__CFString *)a8 error:(id *)a9
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = [v15 lastPathComponent];
  if ([v17 isEqualToString:v20])
  {

    if (!a8)
    {
      id v17 = 0;
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v38 = v20;
    id v39 = v16;
    id v21 = v18;
    v22 = [v15 pathExtension];
    id v17 = 0;
    char v23 = 1;
    goto LABEL_8;
  }
  if (!a8)
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v15;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %@ to disk. Expected uti type was not supplied.", buf, 0xCu);
    }
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_7;
  }
  uint64_t v38 = v20;
  id v39 = v16;
  id v21 = v18;
  v22 = [v17 pathExtension];
  char v23 = 0;
LABEL_8:
  id v24 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a8];
  BOOL v25 = [(PFAssetBundle *)self _pathExtension:v22 matchesType:v24 error:a9];

  if (*a9)
  {
    id v26 = MEMORY[0x1E4F14500];
    id v27 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      if (v23)
      {
        id v28 = &stru_1EF7AE1F8;
      }
      else
      {
        id v28 = [NSString stringWithFormat:@"(updated filename: %@)", v17];
      }
      id v29 = *a9;
      *(_DWORD *)buf = 138543874;
      id v42 = v15;
      __int16 v43 = 2114;
      v44 = v28;
      __int16 v45 = 2114;
      id v46 = v29;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %{public}@ %{public}@ to disk. Error: %{public}@", buf, 0x20u);
      if ((v23 & 1) == 0) {
    }
      }
  }

  if (!v25)
  {
    LOBYTE(v30) = 0;
    id v18 = v21;
    uint64_t v20 = v38;
    id v16 = v39;
    goto LABEL_30;
  }
  id v18 = v21;
  uint64_t v20 = v38;
  id v16 = v39;
LABEL_20:
  if ([(PFAssetBundle *)self _verifyFileSourceExistsAtURL:v15 error:a9])
  {
    id v40 = 0;
    BOOL v30 = [(PFAssetBundle *)self _writeFileAtURL:v15 toDirectory:v16 withUpdatedFilename:v17 writtenFileURL:&v40 error:a9];
    id v31 = v40;
    v32 = v31;
    if (v30 && v31)
    {
      [v31 lastPathComponent];
      v34 = int v33 = v20;
      [v18 setObject:v34 forKeyedSubscript:v19];

      uint64_t v20 = v33;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        BOOL v35 = [v32 path];
        *(_DWORD *)buf = 138412290;
        id v42 = v35;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PFAssetBundle] wrote file at path: %@", buf, 0xCu);

        uint64_t v20 = v33;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      BOOL v36 = (__CFString *)*a9;
      *(_DWORD *)buf = 138412546;
      id v42 = v15;
      __int16 v43 = 2114;
      v44 = v36;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %@ to disk. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    LOBYTE(v30) = 0;
  }
LABEL_30:

  return v30;
}

- (id)urlsByPathKey
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  photoURL = self->_photoURL;
  if (photoURL) {
    [v3 setObject:photoURL forKeyedSubscript:@"PFAssetBundlePathPhotoKey"];
  }
  videoURL = self->_videoURL;
  if (videoURL) {
    [v4 setObject:videoURL forKeyedSubscript:@"PFAssetBundlePathVideoKey"];
  }
  audioURL = self->_audioURL;
  if (audioURL) {
    [v4 setObject:audioURL forKeyedSubscript:@"PFAssetBundlePathAudioKey"];
  }
  alternatePhotoURL = self->_alternatePhotoURL;
  if (alternatePhotoURL) {
    [v4 setObject:alternatePhotoURL forKeyedSubscript:@"PFAssetBundlePathAlternatePhotoKey"];
  }
  fullSizePhotoURL = self->_fullSizePhotoURL;
  if (fullSizePhotoURL) {
    [v4 setObject:fullSizePhotoURL forKeyedSubscript:@"PFAssetBundlePathFullSizePhotoKey"];
  }
  fullSizeVideoURL = self->_fullSizeVideoURL;
  if (fullSizeVideoURL) {
    [v4 setObject:fullSizeVideoURL forKeyedSubscript:@"PFAssetBundlePathFullSizeVideoKey"];
  }
  adjustmentDataURL = self->_adjustmentDataURL;
  if (adjustmentDataURL) {
    [v4 setObject:adjustmentDataURL forKeyedSubscript:@"PFAssetBundlePathAdjustmentDataKey"];
  }
  adjustmentBasePhotoURL = self->_adjustmentBasePhotoURL;
  if (adjustmentBasePhotoURL) {
    [v4 setObject:adjustmentBasePhotoURL forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePhotoKey"];
  }
  pairedVideoURL = self->_pairedVideoURL;
  if (pairedVideoURL) {
    [v4 setObject:pairedVideoURL forKeyedSubscript:@"PFAssetBundlePathPairedVideoKey"];
  }
  fullSizePairedVideoURL = self->_fullSizePairedVideoURL;
  if (fullSizePairedVideoURL) {
    [v4 setObject:fullSizePairedVideoURL forKeyedSubscript:@"PFAssetBundlePathFullSizePairedVideoKey"];
  }
  adjustmentBasePairedVideoURL = self->_adjustmentBasePairedVideoURL;
  if (adjustmentBasePairedVideoURL) {
    [v4 setObject:adjustmentBasePairedVideoURL forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePairedVideoKey"];
  }
  spatialOvercapturePhotoURL = self->_spatialOvercapturePhotoURL;
  if (spatialOvercapturePhotoURL) {
    [v4 setObject:spatialOvercapturePhotoURL forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePhotoKey"];
  }
  spatialOvercapturePairedVideoURL = self->_spatialOvercapturePairedVideoURL;
  if (spatialOvercapturePairedVideoURL) {
    [v4 setObject:spatialOvercapturePairedVideoURL forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePairedVideoKey"];
  }
  spatialOvercaptureVideoURL = self->_spatialOvercaptureVideoURL;
  if (spatialOvercaptureVideoURL) {
    [v4 setObject:spatialOvercaptureVideoURL forKeyedSubscript:@"PFAssetBundlePathSpatialOvercaptureVideoKey"];
  }
  adjustmentBaseVideoURL = self->_adjustmentBaseVideoURL;
  if (adjustmentBaseVideoURL) {
    [v4 setObject:adjustmentBaseVideoURL forKeyedSubscript:@"PFAssetBundlePathAdjustmentBaseVideoKey"];
  }
  originalAdjustmentDataURL = self->_originalAdjustmentDataURL;
  if (originalAdjustmentDataURL) {
    [v4 setObject:originalAdjustmentDataURL forKeyedSubscript:@"PFAssetBundlePathOriginalAdjustmentDataKey"];
  }
  adjustmentSecondaryDataURL = self->_adjustmentSecondaryDataURL;
  if (adjustmentSecondaryDataURL) {
    [v4 setObject:adjustmentSecondaryDataURL forKeyedSubscript:@"PFAssetBundlePathAdjustmentSecondaryDataKey"];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v22 = PFAssetBundleAllAuxiliaryResourceKeys();
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v28 = -[NSMutableDictionary objectForKeyedSubscript:](self->_auxiliaryResourceURLsByKey, "objectForKeyedSubscript:", v27, (void)v31);
        if (v28) {
          [v4 setObject:v28 forKeyedSubscript:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v24);
  }

  id v29 = (void *)[v4 copy];

  return v29;
}

- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v6 isFileURL] & 1) == 0)
  {
    id v12 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"Destination URL for asset bundle is not a file URL: '%@'", v6];
    int v13 = 1;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = "[PFAssetBundle] Destination URL for asset bundle is not a file URL: %@";
    goto LABEL_8;
  }
  id v8 = [v6 pathExtension];
  char v9 = [v8 isEqualToString:@"photosasset"];

  if (v9)
  {
    v10 = [v6 path];
    int v11 = [v7 fileExistsAtPath:v10];

    if (v11)
    {
      id v12 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"Destination for asset bundle already exists: '%@'", v6];
      int v13 = 1;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v15 = "[PFAssetBundle] Destination for asset bundle already exists: '%@'";
LABEL_8:
      _os_log_impl(&dword_1A41FE000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      goto LABEL_12;
    }
    id v31 = 0;
    int v18 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v12 = v31;
    int v13 = v18 ^ 1;
  }
  else
  {
    id v16 = [v6 pathExtension];
    id v12 = [(PFAssetBundle *)self createAssetBundleWritingErrorWithDescription:@"Destination has extension '%@' but requires '%@'", v16, @"photosasset"];

    int v13 = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v17 = [v6 pathExtension];
      *(_DWORD *)buf = 138412546;
      id v33 = v17;
      __int16 v34 = 2112;
      BOOL v35 = @"photosasset";
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] Destination has extension '%@' but requires '%@'", buf, 0x16u);
    }
  }
LABEL_12:
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  id v30 = v12;
  BOOL v20 = [(PFAssetBundle *)self writeAllResourceURLsToDirectoryAtURL:v6 updatingManifest:v19 error:&v30];
  id v21 = v30;

  v22 = [v6 URLByAppendingPathComponent:@"manifest.plist"];
  if (v20)
  {
    int v23 = [v19 writeToURL:v22 atomically:1];
    uint64_t v24 = [v6 URLByAppendingPathComponent:@"metadata.plist"];
    if (v23)
    {
      int v25 = [(NSMutableDictionary *)self->_metadata writeToURL:v24 atomically:1];
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v24 = [v6 URLByAppendingPathComponent:@"metadata.plist"];
  }
  int v25 = 0;
LABEL_17:
  if ((v25 | v13))
  {
    if (!v25) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v26 = *MEMORY[0x1E4F1C658];
    id v29 = v21;
    [v6 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v26 error:&v29];
    id v27 = v29;

    id v21 = v27;
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  [v7 removeItemAtURL:v6 error:0];
  if (v25) {
    goto LABEL_22;
  }
LABEL_19:
  if (!a4) {
    goto LABEL_25;
  }
LABEL_23:
  if (v21) {
    *a4 = v21;
  }
LABEL_25:

  return v25;
}

- (BOOL)writeAllResourceURLsToDirectoryAtURL:(id)a3 updatingManifest:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v21 = a4;
  v7 = [(PFAssetBundle *)self generateCustomFilenamesByPathKey];
  id v19 = self;
  id v8 = [(PFAssetBundle *)self urlsByPathKey];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    char v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v15 = [v8 objectForKeyedSubscript:v14];
        id v16 = UTTypeForBundlePathKey(v14);
        id v17 = [v7 objectForKeyedSubscript:v14];
        if (v12) {
          char v12 = [(PFAssetBundle *)v19 _writeFileAtURL:v15 toDirectory:v22 withUpdatedFilename:v17 updateManifest:v21 bundlePathKey:v14 verifyUTIType:v16 error:a5];
        }
        else {
          char v12 = 0;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (id)generateCustomFilenamesByPathKey
{
  long long v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = [(PFAssetBundle *)self dcfCompliantFilenameBaseForWritingResourceFiles];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__PFAssetBundle_generateCustomFilenamesByPathKey__block_invoke;
  v27[3] = &unk_1E5B2F3D8;
  v27[4] = self;
  v5 = (void (**)(void, void, void, void))MEMORY[0x1A6259AE0](v27);
  id v6 = ((void (**)(void, NSURL *, void *, void))v5)[2](v5, self->_photoURL, v4, 0);
  [v3 setObject:v6 forKeyedSubscript:@"PFAssetBundlePathPhotoKey"];

  v7 = ((void (**)(void, NSURL *, void *, void))v5)[2](v5, self->_videoURL, v4, 0);
  [v3 setObject:v7 forKeyedSubscript:@"PFAssetBundlePathVideoKey"];

  id v8 = ((void (**)(void, NSURL *, void *, void))v5)[2](v5, self->_audioURL, v4, 0);
  [v3 setObject:v8 forKeyedSubscript:@"PFAssetBundlePathAudioKey"];

  uint64_t v9 = ((void (**)(void, NSURL *, void *, void))v5)[2](v5, self->_alternatePhotoURL, v4, 0);
  [v3 setObject:v9 forKeyedSubscript:@"PFAssetBundlePathAlternatePhotoKey"];

  uint64_t v10 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_fullSizePhotoURL, v4, @"E");
  [v3 setObject:v10 forKeyedSubscript:@"PFAssetBundlePathFullSizePhotoKey"];

  uint64_t v11 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_fullSizeVideoURL, v4, @"E");
  [v3 setObject:v11 forKeyedSubscript:@"PFAssetBundlePathFullSizeVideoKey"];

  char v12 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_adjustmentBasePhotoURL, v4, @"B");
  [v3 setObject:v12 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePhotoKey"];

  int v13 = ((void (**)(void, NSURL *, void *, void))v5)[2](v5, self->_pairedVideoURL, v4, 0);
  [v3 setObject:v13 forKeyedSubscript:@"PFAssetBundlePathPairedVideoKey"];

  uint64_t v14 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_fullSizePairedVideoURL, v4, @"E");
  [v3 setObject:v14 forKeyedSubscript:@"PFAssetBundlePathFullSizePairedVideoKey"];

  id v15 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_adjustmentBasePairedVideoURL, v4, @"B");
  [v3 setObject:v15 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBasePairedVideoKey"];

  id v16 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_spatialOvercapturePhotoURL, v4, @"S");
  [v3 setObject:v16 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePhotoKey"];

  id v17 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_spatialOvercapturePairedVideoURL, v4, @"S");
  [v3 setObject:v17 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercapturePairedVideoKey"];

  int v18 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_spatialOvercaptureVideoURL, v4, @"S");
  [v3 setObject:v18 forKeyedSubscript:@"PFAssetBundlePathSpatialOvercaptureVideoKey"];

  id v19 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_adjustmentBaseVideoURL, v4, @"B");
  [v3 setObject:v19 forKeyedSubscript:@"PFAssetBundlePathAdjustmentBaseVideoKey"];

  BOOL v20 = [@"aae" uppercaseString];
  id v21 = [v4 stringByAppendingPathExtension:v20];

  [v3 setObject:v21 forKeyedSubscript:@"PFAssetBundlePathAdjustmentDataKey"];
  id v22 = [(id)objc_opt_class() insertAuxiliaryResourceTypeMarker:@"O" intoFileName:v21];
  [v3 setObject:v22 forKeyedSubscript:@"PFAssetBundlePathOriginalAdjustmentDataKey"];
  long long v23 = ((void (**)(void, NSURL *, void *, __CFString *))v5)[2](v5, self->_adjustmentSecondaryDataURL, v4, @"A");
  long long v24 = [v23 stringByDeletingPathExtension];
  long long v25 = [v24 stringByAppendingPathExtension:@"DAT"];
  [v3 setObject:v25 forKeyedSubscript:@"PFAssetBundlePathAdjustmentSecondaryDataKey"];

  return v3;
}

id __49__PFAssetBundle_generateCustomFilenamesByPathKey__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v6)
  {
    uint64_t v9 = [v6 pathExtension];
    uint64_t v10 = [v7 stringByAppendingPathExtension:v9];

    if (v8)
    {
      uint64_t v11 = [(id)objc_opt_class() insertAuxiliaryResourceTypeMarker:v8 intoFileName:v10];

      uint64_t v10 = (void *)v11;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)dcfCompliantFilenameBaseForWritingResourceFiles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v3 = [(PFAssetBundle *)self originalFilename];
  if ([(id)objc_opt_class() isValidDCFFileName:v3])
  {
    id v4 = [v3 stringByDeletingPathExtension];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using original filename from metadata as base: %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = 0;
  }
  v5 = [(PFAssetBundle *)self photoURL];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PFAssetBundle *)self videoURL];
  }
  id v8 = v7;

  if (![v4 length])
  {
    uint64_t v9 = [v8 URLByDeletingLastPathComponent];
    uint64_t v10 = [v9 pathExtension];
    int v11 = [v10 isEqualToString:@"photosasset"];

    if (v11)
    {
      char v12 = [v9 URLByDeletingPathExtension];
      int v13 = [v12 lastPathComponent];

      if ([(id)objc_opt_class() isValidDCFFileName:v13])
      {
        uint64_t v14 = [v13 stringByDeletingPathExtension];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v14;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using bundle URL filename as base: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v14 = (uint64_t)v4;
      }

      id v4 = (void *)v14;
    }
  }
  id v15 = [v8 lastPathComponent];
  if ([v4 length] || !objc_msgSend((id)objc_opt_class(), "isValidDCFFileName:", v15))
  {
    id v16 = v4;
  }
  else
  {
    id v16 = [v15 stringByDeletingPathExtension];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v16;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using primary resource filename as base: %@", buf, 0xCu);
    }
  }
  if ([v16 length])
  {
    id v17 = v16;
  }
  else
  {
    unint64_t v18 = [v15 hash];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"IMG_%04u", v18 % 0x2710);

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v17;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Generated name from hash. Result: %@", buf, 0xCu);
    }
  }

  return v17;
}

- (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4 forceCopy:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = v11;
  if (a5)
  {
    id v13 = 0;
  }
  else
  {
    id v19 = 0;
    char v14 = [v11 linkItemAtURL:v9 toURL:v10 error:&v19];
    id v13 = v19;
    if (v14)
    {
      char v15 = 1;
      goto LABEL_8;
    }
  }
  id v16 = v13;
  id v18 = v13;
  char v15 = [v12 copyItemAtURL:v9 toURL:v10 error:&v18];
  id v13 = v18;

  if (a6 && (v15 & 1) == 0)
  {
    id v13 = v13;
    char v15 = 0;
    *a6 = v13;
  }
LABEL_8:

  return v15;
}

- (id)URLForAuxiliaryResourceWithKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_auxiliaryResourceURLsByKey objectForKeyedSubscript:a3];
}

- (void)addAuxiliaryResourceAtURL:(id)a3 resourceKey:(id)a4
{
}

- (void)setSpatialOvercaptureResourcesPurgeable:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v3 = 0;
  }
  [(NSMutableDictionary *)self->_metadata setObject:v3 forKeyedSubscript:@"PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"];
}

- (void)setLibraryLocation:(id)a3
{
  id v23 = a3;
  if (v23)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_metadata setObject:&stru_1EF7AE1F8 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationKey"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = (void *)MEMORY[0x1E4F1CA60];
        id v5 = v23;
        id v6 = [v4 dictionaryWithCapacity:8];
        id v7 = NSNumber;
        [v5 coordinate];
        id v8 = objc_msgSend(v7, "numberWithDouble:");
        [v6 setObject:v8 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLatitudeKey"];

        id v9 = NSNumber;
        [v5 coordinate];
        int v11 = [v9 numberWithDouble:v10];
        [v6 setObject:v11 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLongitudeKey"];

        char v12 = NSNumber;
        [v5 altitude];
        id v13 = objc_msgSend(v12, "numberWithDouble:");
        [v6 setObject:v13 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationAltitudeKey"];

        char v14 = NSNumber;
        [v5 horizontalAccuracy];
        char v15 = objc_msgSend(v14, "numberWithDouble:");
        [v6 setObject:v15 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"];

        id v16 = NSNumber;
        [v5 verticalAccuracy];
        id v17 = objc_msgSend(v16, "numberWithDouble:");
        [v6 setObject:v17 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"];

        id v18 = NSNumber;
        [v5 course];
        id v19 = objc_msgSend(v18, "numberWithDouble:");
        [v6 setObject:v19 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationCourseKey"];

        BOOL v20 = NSNumber;
        [v5 speed];
        uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
        [v6 setObject:v21 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationSpeedKey"];

        uint64_t v22 = [v5 timestamp];

        [v6 setObject:v22 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationTimestampKey"];
        [(NSMutableDictionary *)self->_metadata setObject:v6 forKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationKey"];
      }
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_metadata removeObjectForKey:@"PFAssetBundleMetadataLibraryLocationKey"];
  }
}

- (void)setLibraryCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_metadata setObject:v10 forKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateKey"];
  if (v10 && v6)
  {
    id v7 = [v6 name];
    uint64_t v8 = [v6 secondsFromGMTForDate:v10];
    [(NSMutableDictionary *)self->_metadata setObject:v7 forKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"];
    id v9 = [NSNumber numberWithInteger:v8];
    [(NSMutableDictionary *)self->_metadata setObject:v9 forKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"];
  }
  else
  {
    [(NSMutableDictionary *)self->_metadata setObject:0 forKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"];
    [(NSMutableDictionary *)self->_metadata setObject:0 forKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"];
  }
}

- (void)setOriginalFilename:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PFAssetBundleMetadataOriginalFilenameKey"];
}

- (void)setAssetTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PFAssetBundleMetadataAssetTitleKey"];
}

- (void)setAccessibilityDescription:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PFAssetBundleMetadataAccessibilityDescriptionKey"];
}

- (void)setAssetDescription:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PFAssetBundleMetadataAssetDescriptionKey"];
}

- (void)setKeywordTitles:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PFAssetBundleMetadataKeywordTitlesKey"];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalImageDisplayTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PFAssetBundle *)self _readLivePhotoVideoMetadataIfNeeded];
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_livePhotoOriginalImageDisplayTime;
  return result;
}

- (NSString)livePhotoOriginalPairingIdentifier
{
  [(PFAssetBundle *)self _readLivePhotoVideoMetadataIfNeeded];
  livePhotoOriginalPairingIdentifier = self->_livePhotoOriginalPairingIdentifier;

  return livePhotoOriginalPairingIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalVideoDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PFAssetBundle *)self _readLivePhotoVideoMetadataIfNeeded];
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_livePhotoOriginalVideoDuration;
  return result;
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  return (a3 & ~[(PFAssetBundle *)self mediaSubtypes]) == 0;
}

- (void)_readLivePhotoVideoMetadataIfNeeded
{
  if (!self->_didReadOriginalPairedVideoMetadata && [(PFAssetBundle *)self isMediaSubtype:8])
  {
    self->_didReadOriginalPairedVideoMetadata = 1;
    uint64_t v3 = [(NSURL *)self->_pairedVideoURL path];
    uint64_t v4 = PFVideoComplementMetadataForVideoAtPath((uint64_t)v3, 0);
    id v5 = [v4 pairingIdentifier];
    livePhotoOriginalPairingIdentifier = self->_livePhotoOriginalPairingIdentifier;
    self->_livePhotoOriginalPairingIdentifier = v5;

    p_livePhotoOriginalVideoDuration = &self->_livePhotoOriginalVideoDuration;
    if (v4)
    {
      [v4 videoDuration];
      *(_OWORD *)&p_livePhotoOriginalVideoDuration->value = v8;
      self->_livePhotoOriginalVideoDuration.epoch = v9;
      [v4 imageDisplayTime];
    }
    else
    {
      p_livePhotoOriginalVideoDuration->value = 0;
      *(void *)&self->_livePhotoOriginalVideoDuration.timescale = 0;
      self->_livePhotoOriginalVideoDuration.epoch = 0;
      long long v8 = 0uLL;
      int64_t v9 = 0;
    }
    *(_OWORD *)&self->_livePhotoOriginalImageDisplayTime.value = v8;
    self->_livePhotoOriginalImageDisplayTime.epoch = v9;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoImageDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PFAssetBundle *)self isMediaSubtype:8];
  if (result)
  {
    id v6 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataTimingInfoKey"];

    if (v6) {
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v7, (CFDictionaryRef)v6);
    }
    else {
      result = [(PFAssetBundle *)self livePhotoOriginalImageDisplayTime];
    }
    *(CMTime *)retstr = v7;
  }
  return result;
}

- (NSString)livePhotoPairingIdentifier
{
  if ([(PFAssetBundle *)self isMediaSubtype:8])
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataPairingIdentifierKey"];
    if (!v3)
    {
      uint64_t v3 = [(PFAssetBundle *)self livePhotoOriginalPairingIdentifier];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)spatialOvercaptureResourcesPurgeable
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)libraryLocation
{
  v2 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v2 length])
  {
    char v5 = [MEMORY[0x1E4F1CA98] null];
  }
  else
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLatitudeKey"];
    if (!v3) {
      goto LABEL_8;
    }
    uint64_t v4 = (void *)v3;
    char v5 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLongitudeKey"];

    if (!v5) {
      goto LABEL_23;
    }
    id v6 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLatitudeKey"];
    [v6 doubleValue];
    CLLocationDegrees v8 = v7;

    int64_t v9 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationLongitudeKey"];
    [v9 doubleValue];
    CLLocationDegrees v11 = v10;

    CLLocationCoordinate2D v39 = CLLocationCoordinate2DMake(v8, v11);
    double latitude = v39.latitude;
    double longitude = v39.longitude;
    if (CLLocationCoordinate2DIsValid(v39))
    {
      char v14 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationAltitudeKey"];

      if (v14)
      {
        char v15 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationAltitudeKey"];
        [v15 doubleValue];
        double v17 = v16;
      }
      else
      {
        double v17 = 0.0;
      }
      id v18 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"];

      double v19 = -1.0;
      double v20 = -1.0;
      if (v18)
      {
        uint64_t v21 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"];
        [v21 doubleValue];
        double v20 = v22;
      }
      id v23 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"];

      if (v23)
      {
        long long v24 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"];
        [v24 doubleValue];
        double v19 = v25;
      }
      long long v26 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationCourseKey"];

      double v27 = -1.0;
      double v28 = -1.0;
      if (v26)
      {
        id v29 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationCourseKey"];
        [v29 doubleValue];
        double v28 = v30;
      }
      id v31 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationSpeedKey"];

      if (v31)
      {
        long long v32 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationSpeedKey"];
        [v32 doubleValue];
        double v27 = v33;
      }
      __int16 v34 = [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationTimestampKey"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v2 objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryLocationTimestampKey"];
      }
      else {
      uint64_t v36 = [MEMORY[0x1E4F1C9C8] date];
      }
      char v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5F0]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v36, latitude, longitude, v17, v20, v19, v28, v27);
    }
    else
    {
LABEL_8:
      char v5 = 0;
    }
  }
LABEL_23:

  return v5;
}

- (NSTimeZone)libraryCreationDateTimeZone
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"];
  if (!v3
    || ([MEMORY[0x1E4F1CAF0] timeZoneWithName:v3],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v5 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 integerValue];
      uint64_t v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v7];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return (NSTimeZone *)v4;
}

- (NSDate)libraryCreationDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataLibraryCreationDateKey"];
}

- (NSString)originalFilename
{
  return (NSString *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataOriginalFilenameKey"];
}

- (NSString)assetTitle
{
  return (NSString *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataAssetTitleKey"];
}

- (NSString)accessibilityDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataAccessibilityDescriptionKey"];
}

- (NSString)assetDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataAssetDescriptionKey"];
}

- (NSSet)keywordTitles
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataKeywordTitlesKey"];

  if (v3)
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataKeywordTitlesKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return (NSSet *)v3;
}

- (unsigned)videoComplementVisibilityState
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];
  unsigned __int16 v5 = [v4 integerValue];

  return v5;
}

- (unint64_t)playbackVariation
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];
  unint64_t v5 = [v4 integerValue];

  return v5;
}

- (unint64_t)mediaSubtypes
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];
  unint64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)mediaType
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)playbackStyle
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (PFAssetBundle)initWithAssetBundleAtURL:(id)a3
{
  v53[18] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 pathExtension];
  int v6 = [v5 isEqualToString:@"photosasset"];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 path];
    uint64_t v38 = v43 = 1;
    CLLocationDegrees v8 = [v38 stringByAppendingPathComponent:@"manifest.plist"];
    v37 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v9 = 0;
    if ([v37 fileExistsAtPath:v8 isDirectory:&v43] && !v43)
    {
      double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];
      BOOL v9 = v10 != 0;
      if (v10)
      {
        __int16 v34 = v8;
        id v35 = v4;
        CLLocationDegrees v11 = v7;
        uint64_t v36 = self;
        v53[0] = @"PFAssetBundlePathPhotoKey";
        v53[1] = @"PFAssetBundlePathVideoKey";
        v53[2] = @"PFAssetBundlePathAudioKey";
        v53[3] = @"PFAssetBundlePathAlternatePhotoKey";
        v53[4] = @"PFAssetBundlePathFullSizePhotoKey";
        v53[5] = @"PFAssetBundlePathFullSizeVideoKey";
        v53[6] = @"PFAssetBundlePathAdjustmentDataKey";
        v53[7] = @"PFAssetBundlePathAdjustmentBasePhotoKey";
        v53[8] = @"PFAssetBundlePathPairedVideoKey";
        v53[9] = @"PFAssetBundlePathFullSizePairedVideoKey";
        v53[10] = @"PFAssetBundlePathAdjustmentBasePairedVideoKey";
        v53[11] = @"PFAssetBundlePathSpatialOvercapturePhotoKey";
        v53[12] = @"PFAssetBundlePathSpatialOvercapturePairedVideoKey";
        v53[13] = @"PFAssetBundlePathSpatialOvercaptureVideoKey";
        v53[14] = @"PFAssetBundlePathAdjustmentBaseVideoKey";
        v53[15] = @"PFAssetBundlePathOriginalAdjustmentDataKey";
        v53[16] = @"PFAssetBundlePathAdjustmentSecondaryDataKey";
        v53[17] = @"PFAssetBundlePathSegmentationDataKey";
        [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:18];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v52 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v40;
          double v16 = MEMORY[0x1E4F14500];
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v40 != v15) {
                objc_enumerationMutation(v12);
              }
              id v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              double v19 = [v10 objectForKeyedSubscript:v18];
              if (v19)
              {
                double v20 = [v38 stringByAppendingPathComponent:v19];
                if (([v37 fileExistsAtPath:v20] & 1) == 0
                  && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543618;
                  id v45 = v18;
                  __int16 v46 = 2114;
                  uint64_t v47 = v20;
                  _os_log_impl(&dword_1A41FE000, v16, OS_LOG_TYPE_INFO, "[PFAssetBundle] File resource is missing for key %{public}@ even though it's in the manifest: %{public}@ ", buf, 0x16u);
                }
                [v11 setObject:v20 forKeyedSubscript:v18];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v52 count:16];
          }
          while (v14);
        }

        id v4 = v35;
        self = v36;
        id v7 = v11;
        CLLocationDegrees v8 = v34;
        BOOL v9 = 1;
      }
    }
    uint64_t v21 = [v38 stringByAppendingPathComponent:@"metadata.plist"];
    double v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v23 = [v22 fileExistsAtPath:v21 isDirectory:&v43];

    int v24 = 0;
    if (!v23)
    {
      int v25 = 0;
      goto LABEL_30;
    }
    int v25 = 0;
    if (!v43)
    {
      long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v21];
      double v27 = v26;
      if (v26)
      {
        double v28 = [v26 objectForKeyedSubscript:@"PFAssetBundleMetadataVersionKey"];
        if ([v28 isEqualToString:@"1"])
        {
          [v7 setObject:v27 forKeyedSubscript:@"PFAssetBundlePathMetadataKey"];

          if (v9)
          {
            self = [(PFAssetBundle *)self initWithPropertyList:v7];
            id v29 = self;
LABEL_32:

            goto LABEL_33;
          }
          int v24 = 1;
          int v25 = 1;
          goto LABEL_30;
        }

        int v25 = 1;
      }
      else
      {
        int v25 = 0;
      }

      int v24 = 0;
    }
LABEL_30:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v31 = @"N";
      if (v9) {
        long long v32 = @"Y";
      }
      else {
        long long v32 = @"N";
      }
      *(_DWORD *)buf = 138413058;
      id v45 = v4;
      if (v25) {
        double v33 = @"Y";
      }
      else {
        double v33 = @"N";
      }
      uint64_t v47 = v32;
      __int16 v46 = 2112;
      __int16 v48 = 2112;
      if (v24) {
        id v31 = @"Y";
      }
      id v49 = v33;
      __int16 v50 = 2112;
      id v51 = v31;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error trying to read asset bundle at %@ (manifestFound: %@, metadataFound: %@, validMetadataVersion: %@", buf, 0x2Au);
    }
    id v29 = 0;
    goto LABEL_32;
  }
  id v29 = 0;
LABEL_33:

  return v29;
}

- (PFAssetBundle)initWithPropertyList:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)PFAssetBundle;
  int64_t v5 = [(PFAssetBundle *)&v88 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    propertyList = v5->_propertyList;
    v5->_propertyList = (NSDictionary *)v6;

    CLLocationDegrees v8 = [v4 objectForKeyedSubscript:@"PFAssetBundlePathMetadataKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v9 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataVersionKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        BOOL v9 = 0;
      }
      double v10 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];
      uint64_t v11 = [v10 integerValue];

      id v12 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];
      uint64_t v15 = [v14 integerValue];

      double v16 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];
      uint64_t v17 = [v16 integerValue];

      id v18 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];
      unsigned __int16 v79 = [v18 integerValue];

      double v19 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"];
      unsigned int v80 = [v19 BOOLValue];

      double v20 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataPairingIdentifierKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        double v20 = 0;
      }
      uint64_t v21 = [v8 objectForKeyedSubscript:@"PFAssetBundleMetadataTimingInfoKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v82 = v21;
      }
      else
      {

        v82 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
      unsigned __int16 v79 = 0;
      unsigned int v80 = 0;
      double v20 = 0;
      v82 = 0;
      uint64_t v13 = 0;
      uint64_t v11 = 0;
      BOOL v9 = 0;
    }
    double v22 = @"1";
    if (v9) {
      double v22 = v9;
    }
    int v23 = v22;

    objc_opt_class();
    v83 = v20;
    if (objc_opt_isKindOfClass()) {
      id v24 = (id)[v8 mutableCopy];
    }
    else {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    int v25 = v24;
    uint64_t v81 = v23;
    long long v26 = (void *)[(__CFString *)v23 copy];
    [v25 setObject:v26 forKeyedSubscript:@"PFAssetBundleMetadataVersionKey"];

    double v27 = [NSNumber numberWithInteger:v11];
    [v25 setObject:v27 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackStyleKey"];

    double v28 = [NSNumber numberWithInteger:v13];
    [v25 setObject:v28 forKeyedSubscript:@"PFAssetBundleMetadataMediaTypeKey"];

    id v29 = [NSNumber numberWithUnsignedInteger:v15];
    [v25 setObject:v29 forKeyedSubscript:@"PFAssetBundleMetadataMediaSubtypesKey"];

    double v30 = [NSNumber numberWithUnsignedInteger:v17];
    [v25 setObject:v30 forKeyedSubscript:@"PFAssetBundleMetadataPlaybackVariationKey"];

    id v31 = [NSNumber numberWithUnsignedShort:v79];
    [v25 setObject:v31 forKeyedSubscript:@"PFAssetBundleMetadataVideoComplementVisibilityStateKey"];

    long long v32 = [NSNumber numberWithBool:v80];
    [v25 setObject:v32 forKeyedSubscript:@"PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"];

    [v25 setObject:v83 forKeyedSubscript:@"PFAssetBundleMetadataPairingIdentifierKey"];
    [v25 setObject:v82 forKeyedSubscript:@"PFAssetBundleMetadataTimingInfoKey"];
    uint64_t v33 = [v25 mutableCopy];
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v33;

    uint64_t v35 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathPhotoKey", v4);
    photoURL = v5->_photoURL;
    v5->_photoURL = (NSURL *)v35;

    uint64_t v37 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathVideoKey", v4);
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v37;

    uint64_t v39 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAudioKey", v4);
    audioURL = v5->_audioURL;
    v5->_audioURL = (NSURL *)v39;

    uint64_t v41 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAlternatePhotoKey", v4);
    alternatePhotoURL = v5->_alternatePhotoURL;
    v5->_alternatePhotoURL = (NSURL *)v41;

    uint64_t v43 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathFullSizePhotoKey", v4);
    fullSizePhotoURL = v5->_fullSizePhotoURL;
    v5->_fullSizePhotoURL = (NSURL *)v43;

    uint64_t v45 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathFullSizeVideoKey", v4);
    fullSizeVideoURL = v5->_fullSizeVideoURL;
    v5->_fullSizeVideoURL = (NSURL *)v45;

    uint64_t v47 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAdjustmentDataKey", v4);
    adjustmentDataURL = v5->_adjustmentDataURL;
    v5->_adjustmentDataURL = (NSURL *)v47;

    uint64_t v49 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAdjustmentBasePhotoKey", v4);
    adjustmentBasePhotoURL = v5->_adjustmentBasePhotoURL;
    v5->_adjustmentBasePhotoURL = (NSURL *)v49;

    uint64_t v51 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathPairedVideoKey", v4);
    pairedVideoURL = v5->_pairedVideoURL;
    v5->_pairedVideoURL = (NSURL *)v51;

    uint64_t v53 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathFullSizePairedVideoKey", v4);
    fullSizePairedVideoURL = v5->_fullSizePairedVideoURL;
    v5->_fullSizePairedVideoURL = (NSURL *)v53;

    uint64_t v55 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAdjustmentBasePairedVideoKey", v4);
    adjustmentBasePairedVideoURL = v5->_adjustmentBasePairedVideoURL;
    v5->_adjustmentBasePairedVideoURL = (NSURL *)v55;

    uint64_t v57 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathSpatialOvercapturePhotoKey", v4);
    spatialOvercapturePhotoURL = v5->_spatialOvercapturePhotoURL;
    v5->_spatialOvercapturePhotoURL = (NSURL *)v57;

    uint64_t v59 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathSpatialOvercapturePairedVideoKey", v4);
    spatialOvercapturePairedVideoURL = v5->_spatialOvercapturePairedVideoURL;
    v5->_spatialOvercapturePairedVideoURL = (NSURL *)v59;

    uint64_t v61 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathSpatialOvercaptureVideoKey", v4);
    spatialOvercaptureVideoURL = v5->_spatialOvercaptureVideoURL;
    v5->_spatialOvercaptureVideoURL = (NSURL *)v61;

    uint64_t v63 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAdjustmentBaseVideoKey", v4);
    adjustmentBaseVideoURL = v5->_adjustmentBaseVideoURL;
    v5->_adjustmentBaseVideoURL = (NSURL *)v63;

    uint64_t v65 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathOriginalAdjustmentDataKey", v4);
    originalAdjustmentDataURL = v5->_originalAdjustmentDataURL;
    v5->_originalAdjustmentDataURL = (NSURL *)v65;

    uint64_t v67 = createURLForAbsolutePathKeyInDictionary(@"PFAssetBundlePathAdjustmentSecondaryDataKey", v4);
    adjustmentSecondaryDataURL = v5->_adjustmentSecondaryDataURL;
    v5->_adjustmentSecondaryDataURL = (NSURL *)v67;

    v69 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    auxiliaryResourceURLsByKey = v5->_auxiliaryResourceURLsByKey;
    v5->_auxiliaryResourceURLsByKey = v69;

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v71 = PFAssetBundleAllAuxiliaryResourceKeys();
    uint64_t v72 = [v71 countByEnumeratingWithState:&v84 objects:v89 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v85 != v74) {
            objc_enumerationMutation(v71);
          }
          long long v76 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          v77 = createURLForAbsolutePathKeyInDictionary(v76, v4);
          if (v77) {
            [(NSMutableDictionary *)v5->_auxiliaryResourceURLsByKey setObject:v77 forKeyedSubscript:v76];
          }
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v84 objects:v89 count:16];
      }
      while (v73);
    }
  }
  return v5;
}

- (PFAssetBundle)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  int64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ not supported for %@: use initWithPropertyList: or initWithAssetBundleAtURL:", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)isValidDCFFileName:(id)a3
{
  uint64_t v4 = isValidDCFFileName__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&isValidDCFFileName__onceToken, &__block_literal_global_196);
  }
  char v6 = [a1 fileName:v5 matchesRegex:isValidDCFFileName__dcfRegex];

  return v6;
}

uint64_t __36__PFAssetBundle_isValidDCFFileName___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^ [[A-Z][_][0-9]]{4}   (?# alphanumeric + '_' x4)[0-9]{4}               (?# digit x4)\\.[[A-Z][0-9]]{3,4} $ (?# alphanumeric x3 or x4)" options:3 error:0];
  uint64_t v1 = isValidDCFFileName__dcfRegex;
  isValidDCFFileName__dcfRegex = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 1;
}

+ (id)insertAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 substringToIndex:4];
  CLLocationDegrees v8 = [v5 substringFromIndex:4];

  BOOL v9 = [NSString stringWithFormat:@"%@%@%@", v7, v6, v8];

  return v9;
}

+ (UTType)contentType
{
  if (contentType_onceToken != -1) {
    dispatch_once(&contentType_onceToken, &__block_literal_global_160);
  }
  v2 = (void *)contentType_type;

  return (UTType *)v2;
}

uint64_t __28__PFAssetBundle_contentType__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.photos.asset-bundle"];
  uint64_t v1 = contentType_type;
  contentType_type = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSString)currentFormatVersion
{
  return (NSString *)@"1";
}

@end