@interface PLMediaAnalysisServiceRequestAdapter
+ (id)currentCaptionGenerationVersion;
+ (id)currentFaceVersion;
+ (id)currentImageEmbeddingVersion;
+ (id)currentMediaAnalysisImageVersion;
+ (id)currentMediaAnalysisVersion;
+ (id)currentOCRAlgorithmVersion;
+ (id)currentSceneVersion;
+ (id)currentStickerConfidenceAlgorithmVersion;
+ (id)currentUnifiedEmbeddingVersion;
+ (id)currentVaAnalysisAlgorithmVersion;
+ (id)currentVaLocationAnalysisAlgorithmVersion;
+ (id)currentVideoEmbeddingVersion;
+ (id)currentVisualSearchAlgorithmVersion;
+ (id)fetchImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3;
+ (id)fetchVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3;
+ (id)mediaAnalysisEmbeddingChangedVersion;
+ (id)mediaAnalysisMiCaImageCaptionResultsKey;
+ (id)mediaAnalysisMiCaVideoCaptionResultsKey;
+ (id)mediaAnalysisMovieHighlightResultsKey;
+ (id)mediaAnalysisQualityKey;
+ (id)mediaAnalysisResultAttributesKey;
+ (id)mediaAnalysisResultDurationKey;
+ (id)mediaAnalysisResultImageCaptionTextAttributeKey;
+ (id)mediaAnalysisResultStartKey;
+ (id)mediaAnalysisResultVideoCaptionPreferenceAttributeKey;
+ (id)mediaAnalysisResultVideoCaptionTextAttributeKey;
+ (id)mediaAnalysisResultsKey;
+ (id)mediaAnalysisVideoCaptionPreferenceResultsKey;
+ (id)mediaAnalyzerOptionCaptionWithHighlight;
+ (id)mediaAnalyzerOptionHighlightContexts;
+ (id)mediaAnalyzerOptionSearchQueryString;
+ (id)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
+ (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4;
+ (int)invalidMADRequestID;
+ (int)queryImagePriority1MCEnableDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5;
+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5;
+ (int)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5;
+ (int)queryVUIndexLastFullModeClusterDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5;
+ (int)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 completionHandler:(id)a4;
+ (int64_t)invalidVCPRequestID;
+ (int64_t)requestAssetCaptionsOfTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
+ (int64_t)requestAssetHighlightCaptionsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
+ (int64_t)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestMovieCurationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestPetsAnalysisForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
+ (int64_t)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5;
+ (int64_t)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (int64_t)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
+ (int64_t)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
+ (int64_t)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
+ (int64_t)requestResetPersons:(id)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5;
+ (int64_t)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (int64_t)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8;
+ (int64_t)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7;
+ (int64_t)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andCompletionHandler:(id)a5;
+ (int64_t)requestVideoCaptionPreferenceForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (unint64_t)faceAnalysisTaskID;
+ (unint64_t)mediaAnalysisTypeCaptionImage;
+ (unint64_t)mediaAnalysisTypeCaptionVideo;
+ (unint64_t)petVIPModelType;
+ (void)cancelRequest:(int64_t)a3;
@end

@implementation PLMediaAnalysisServiceRequestAdapter

+ (id)currentUnifiedEmbeddingVersion
{
  v2 = NSNumber;
  uint64_t v3 = [getVCPMediaAnalyzerClass() getUnifiedEmbeddingVersion];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

+ (id)currentVaLocationAnalysisAlgorithmVersion
{
  v2 = NSNumber;
  getVCPPhotosPECProcessingVersion();
  return (id)[v2 numberWithInt:v3];
}

+ (id)currentVaAnalysisAlgorithmVersion
{
  v2 = NSNumber;
  getVCPPhotosPECProcessingVersion();
  return (id)[v2 numberWithInt:v3];
}

+ (id)currentStickerConfidenceAlgorithmVersion
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (unsigned int (*)(void))getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr;
  v11 = getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "VCPPhotosVisualSearchProcessingVersion");
    getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    v2 = (unsigned int (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = [NSNumber numberWithShort:(v2() >> 16)];
    return v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"int32_t getVCPPhotosVisualSearchProcessingVersion(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 53, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentOCRAlgorithmVersion
{
  v2 = NSNumber;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (unsigned int *)getVCPPhotosOCRProcessingVersionSymbolLoc_ptr;
  uint64_t v12 = getVCPPhotosOCRProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosOCRProcessingVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary_44831();
    v10[3] = (uint64_t)dlsym(v4, "VCPPhotosOCRProcessingVersion");
    getVCPPhotosOCRProcessingVersionSymbolLoc_ptr = v10[3];
    uint64_t v3 = (unsigned int *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v5 = [v2 numberWithInt:*v3];
    return v5;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"const int32_t getVCPPhotosOCRProcessingVersion(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PLMediaAnalysisServiceRequestAdapter.m", 49, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentVisualSearchAlgorithmVersion
{
  v2 = NSNumber;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (uint64_t (*)(void))getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr;
  uint64_t v12 = getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr;
  if (!getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary_44831();
    v10[3] = (uint64_t)dlsym(v4, "VCPPhotosVisualSearchAlgorithmVersion");
    getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v3 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v5 = [v2 numberWithInt:v3()];
    return v5;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"int32_t getVCPPhotosVisualSearchAlgorithmVersion(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PLMediaAnalysisServiceRequestAdapter.m", 52, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentCaptionGenerationVersion
{
  v2 = NSNumber;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (unsigned int *)getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr;
  uint64_t v12 = getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary_44831();
    v10[3] = (uint64_t)dlsym(v4, "VCPPhotosCaptionProcessingVersion");
    getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr = v10[3];
    uint64_t v3 = (unsigned int *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v5 = [v2 numberWithInt:*v3];
    return v5;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"const int32_t getVCPPhotosCaptionProcessingVersion(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PLMediaAnalysisServiceRequestAdapter.m", 51, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentMediaAnalysisImageVersion
{
  v2 = NSNumber;
  getMediaAnalysisVersion();
  return (id)[v2 numberWithInt:v3];
}

+ (id)mediaAnalysisEmbeddingChangedVersion
{
  v2 = NSNumber;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (unsigned int *)getMediaAnalysisEmbeddingChangedVersionSymbolLoc_ptr_44856;
  uint64_t v12 = getMediaAnalysisEmbeddingChangedVersionSymbolLoc_ptr_44856;
  if (!getMediaAnalysisEmbeddingChangedVersionSymbolLoc_ptr_44856)
  {
    v4 = MediaAnalysisLibrary_44831();
    v10[3] = (uint64_t)dlsym(v4, "MediaAnalysisEmbeddingChangedVersion");
    getMediaAnalysisEmbeddingChangedVersionSymbolLoc_ptr_44856 = v10[3];
    uint64_t v3 = (unsigned int *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v5 = [v2 numberWithInt:*v3];
    return v5;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"const int32_t getMediaAnalysisEmbeddingChangedVersion(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PLMediaAnalysisServiceRequestAdapter.m", 47, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentMediaAnalysisVersion
{
  v2 = NSNumber;
  getMediaAnalysisVersion();
  return (id)[v2 numberWithInt:v3];
}

+ (id)currentFaceVersion
{
  v2 = NSNumber;
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = 15;
  }
  else {
    uint64_t v3 = 11;
  }
  return (id)[v2 numberWithInt:v3];
}

+ (id)currentVideoEmbeddingVersion
{
  return &unk_1EEBEE5B0;
}

+ (id)currentImageEmbeddingVersion
{
  return &unk_1EEBEE5B0;
}

+ (id)currentSceneVersion
{
  return &unk_1EEBEE598;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    int v9 = [(id)objc_opt_class() queryProgressDetail:a3 forPhotoLibraryURL:v7 andTaskID:a5];
  }
  else {
    int v9 = -10000;
  }

  return v9;
}

+ (int64_t)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __122__PLMediaAnalysisServiceRequestAdapter_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke;
  v19[3] = &unk_1E586A350;
  id v10 = v9;
  id v20 = v10;
  uint64_t v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v19);
  uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v13 = [v12 BOOLForKey:@"DisableQuickFaceAnalysisRequests"];

  if (v13)
  {
    v14 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Not running Quick Face Analysis since default is set to disable", v18, 2u);
    }

    int64_t v15 = v11[2](v11);
  }
  else
  {
    v16 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
    if (objc_opt_respondsToSelector()) {
      int64_t v15 = (int)[v16 requestQuickFaceIdentificationForPhotoLibraryURL:v7 withOptions:v8 andCompletionHandler:v10];
    }
    else {
      int64_t v15 = v11[2](v11);
    }
  }
  return v15;
}

uint64_t __122__PLMediaAnalysisServiceRequestAdapter_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  }
  return -1;
}

+ (void)cancelRequest:(int64_t)a3
{
  id v4 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    [v4 cancelRequest:a3];
  }
}

+ (int)invalidMADRequestID
{
  return -1;
}

+ (int64_t)invalidVCPRequestID
{
  return 0;
}

+ (unint64_t)faceAnalysisTaskID
{
  return 3;
}

+ (unint64_t)petVIPModelType
{
  return 1;
}

+ (int)queryImagePriority1MCEnableDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3)
  {
    id v8 = [getMADServiceClass() service];
    if (objc_opt_respondsToSelector())
    {
      int v9 = [v8 queryImagePriority1MCEnableDate:a3 photoLibraryURL:v7 error:a5];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] distantPast];
      int v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (id)fetchImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 distantPast];
  id v17 = 0;
  id v18 = v5;
  int v6 = +[PLMediaAnalysisServiceRequestAdapter queryImagePriority1MCEnableDate:&v18 photoLibraryURL:v4 error:&v17];

  id v7 = v18;
  id v8 = v17;
  int v9 = v8;
  if (v6) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10)
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "+[PLMediaAnalysisServiceRequestAdapter(VisualUnderstandingRequests) fetchImagePriority1MCEnableDateWithPhotoLibraryURL:]";
      __int16 v21 = 1024;
      int v22 = v6;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%s: Error fetching date when MC processing was ready. Return code: %d Error: %@", buf, 0x1Cu);
    }

LABEL_8:
    id v12 = 0;
    goto LABEL_11;
  }
  id v13 = [MEMORY[0x1E4F1C9C8] distantPast];

  if (v7 == v13)
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];

    if (v7 == v15)
    {
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "+[PLMediaAnalysisServiceRequestAdapter(VisualUnderstandingRequests) fetchImagePriority1MCEnableDateWithPhotoLibraryURL:]";
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%s: Date when MC processing was ready not found.", buf, 0xCu);
      }
    }
    goto LABEL_8;
  }
  id v12 = v7;
LABEL_11:

  return v12;
}

+ (int)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__44969;
  __int16 v21 = __Block_byref_object_dispose__44970;
  id v22 = [getMADServiceClass() service];
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __142__PLMediaAnalysisServiceRequestAdapter_VisualUnderstandingRequests__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke;
    v14[3] = &unk_1E586A3A0;
    id v15 = v7;
    v16 = &v17;
    id v8 = (void *)MEMORY[0x19F38D650](v14);
    LODWORD(v9) = [(id)v18[5] queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:v6 completionHandler:v8];

    BOOL v10 = v15;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"The MAD (queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:completionHandler:) SPI is not supported in this build.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    BOOL v10 = [v11 errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:v12];

    uint64_t v9 = [a1 invalidMADRequestID];
    if (v7) {
      (*((void (**)(id, uint64_t, void, void *))v7 + 2))(v7, v9, 0, v10);
    }
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __142__PLMediaAnalysisServiceRequestAdapter_VisualUnderstandingRequests__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (int)queryVUIndexLastFullModeClusterDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3)
  {
    id v8 = [getMADServiceClass() service];
    if (objc_opt_respondsToSelector())
    {
      int v9 = [v8 queryVUIndexLastFullModeClusterDate:a3 photoLibraryURL:v7 error:a5];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] distantPast];
      int v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (id)fetchVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 distantPast];
  id v17 = 0;
  id v18 = v5;
  int v6 = +[PLMediaAnalysisServiceRequestAdapter queryVUIndexLastFullModeClusterDate:&v18 photoLibraryURL:v4 error:&v17];

  id v7 = v18;
  id v8 = v17;
  int v9 = v8;
  if (v6) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10)
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "+[PLMediaAnalysisServiceRequestAdapter(VisualUnderstandingRequests) fetchVUIndexLastFullModeClusterDateWithP"
            "hotoLibraryURL:]";
      __int16 v21 = 1024;
      int v22 = v6;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%s: Error fetching VU index last cluster date. Return code: %d Error: %@", buf, 0x1Cu);
    }

LABEL_8:
    id v12 = 0;
    goto LABEL_11;
  }
  id v13 = [MEMORY[0x1E4F1C9C8] distantPast];

  if (v7 == v13)
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];

    if (v7 == v15)
    {
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "+[PLMediaAnalysisServiceRequestAdapter(VisualUnderstandingRequests) fetchVUIndexLastFullModeClusterDateWit"
              "hPhotoLibraryURL:]";
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%s: VU index last cluster date not found.", buf, 0xCu);
      }
    }
    goto LABEL_8;
  }
  id v12 = v7;
LABEL_11:

  return v12;
}

+ (int)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__44969;
  __int16 v23 = __Block_byref_object_dispose__44970;
  id v24 = [getMADServiceClass() service];
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __133__PLMediaAnalysisServiceRequestAdapter_VisualUnderstandingRequests__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke;
    v16[3] = &unk_1E586A378;
    id v17 = v9;
    id v18 = &v19;
    BOOL v10 = (void *)MEMORY[0x19F38D650](v16);
    LODWORD(v11) = [(id)v20[5] queryVUIndexAssetCountForType:a3 photoLibraryURL:v8 completionHandler:v10];

    id v12 = v17;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"The MAD (queryVUIndexAssetCountForType:photoLibraryURL:completionHandler:) SPI is not supported in this build.";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v12 = [v13 errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:v14];

    uint64_t v11 = [a1 invalidMADRequestID];
    if (v9) {
      (*((void (**)(id, uint64_t, uint64_t, void *))v9 + 2))(v9, v11, -1, v12);
    }
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __133__PLMediaAnalysisServiceRequestAdapter_VisualUnderstandingRequests__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (id)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [getMADServiceClass() service];
  if (objc_opt_respondsToSelector())
  {
    id v17 = 0;
    uint64_t v9 = [v8 queryVUIndexAssetCountForType:a3 photoLibraryURL:v7 error:&v17];
    id v10 = v17;
    uint64_t v11 = v10;
    if (!v10)
    {
      id v15 = [NSNumber numberWithInteger:v9];
      goto LABEL_11;
    }
    if (!a5)
    {
      id v15 = 0;
      goto LABEL_11;
    }
    id v12 = v10;
    uint64_t v11 = v12;
  }
  else
  {
    if (!a5)
    {
      id v15 = 0;
      goto LABEL_12;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"The MAD (queryVUIndexAssetCountForType:photoLibraryURL:error:) SPI is not supported in this build.";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v12 = [v13 errorWithDomain:v14 code:46309 userInfo:v11];
  }
  id v15 = 0;
  *a5 = v12;
LABEL_11:

LABEL_12:
  return v15;
}

+ (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [getMADServiceClass() service];
  id v7 = [v6 requestVUIndexURLForPhotoLibraryURL:v5 error:a4];

  return v7;
}

+ (int64_t)requestPetsAnalysisForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  if (a4)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v13 = (id)[a4 mutableCopy];
  }
  else
  {
    uint64_t v14 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v15 = a6;
    id v16 = a5;
    id v17 = a3;
    id v13 = objc_alloc_init(v14);
  }
  uint64_t v18 = v13;
  uint64_t v19 = getVCPMediaAnalysisService_AllowOnDemandOption();
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v19];

  id v20 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  int v21 = [v20 requestAnalysisTypes:0x20000 forAssets:a3 withOptions:v18 progressHandler:a5 andCompletionHandler:a6];

  return v21;
}

+ (int64_t)requestResetPersons:(id)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __128__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetPersons_photoLibraryURL_completionHandler___block_invoke;
  v15[3] = &unk_1E586A350;
  id v10 = v9;
  id v16 = v10;
  id v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v15);
  id v12 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v13 = (int)[v12 requestResetPersons:v7 forPhotoLibraryURL:v8 completionHandler:v10];
  }
  else {
    int64_t v13 = v11[2](v11);
  }

  return v13;
}

uint64_t __128__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetPersons_photoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __168__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_1E586A350;
  id v12 = v11;
  id v18 = v12;
  int64_t v13 = (uint64_t (**)(void))MEMORY[0x19F38D650](v17);
  uint64_t v14 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v15 = (int)[v14 requestPersonPromoterStatusWithAdvancedFlag:v8 photoLibraryURL:v9 progressHandler:v10 completionHandler:v12];
  }
  else {
    int64_t v15 = v13[2](v13);
  }

  return v15;
}

uint64_t __168__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, MEMORY[0x1E4F1CC08], 0);
  }
  return -1;
}

+ (int64_t)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __162__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E586A350;
  id v10 = v9;
  id v16 = v10;
  id v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v15);
  id v12 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v13 = (int)[v12 requestResetFaceClassificationModelForPhotoLibraryURL:v7 progressHandler:v8 completionHandler:v10];
  }
  else {
    int64_t v13 = v11[2](v11);
  }

  return v13;
}

uint64_t __162__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  int64_t v15 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  LODWORD(a3) = [v15 requestProcessingTypes:a3 forAssetsWithLocalIdentifiers:v14 fromPhotoLibraryWithURL:v13 progressHandler:v12 completionHandler:v11];

  return (int)a3;
}

+ (int64_t)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  int v14 = [v13 requestSceneProcessingForAssets:v12 withOptions:v11 progressHandler:v10 andCompletionHandler:v9];

  return v14;
}

+ (int64_t)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  LODWORD(a4) = [v9 requestVIPModelFilepathForPhotoLibraryURL:v8 forModelType:a4 completionHandler:v7];

  return (int)a4;
}

+ (int64_t)requestMovieCurationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  if (a4)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v13 = (id)[a4 mutableCopy];
  }
  else
  {
    int v14 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v15 = a6;
    id v16 = a5;
    id v17 = a3;
    id v13 = objc_alloc_init(v14);
  }
  id v18 = v13;
  uint64_t v19 = getVCPMediaAnalysisService_AllowOnDemandOption();
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v19];

  id v20 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  int v21 = [v20 requestAnalysisTypes:0x40000 forAssets:a3 withOptions:v18 progressHandler:a5 andCompletionHandler:a6];

  return v21;
}

+ (int64_t)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __154__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E586A350;
  id v13 = v12;
  id v19 = v13;
  int v14 = (uint64_t (**)(void))MEMORY[0x19F38D650](v18);
  id v15 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v16 = (int)[v15 requestRebuildPersonsWithLocalIdentifiers:v9 photoLibraryURL:v10 progressHandler:v11 completionHandler:v13];
  }
  else {
    int64_t v16 = v14[2](v14);
  }

  return v16;
}

uint64_t __154__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __137__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E586A350;
  id v10 = v9;
  id v16 = v10;
  id v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v15);
  id v12 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v13 = (int)[v12 requestReclusterFacesWithPhotoLibraryURL:v7 progressHandler:v8 completionHandler:v10];
  }
  else {
    int64_t v13 = v11[2](v11);
  }

  return v13;
}

uint64_t __137__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __147__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E586A350;
  id v10 = v9;
  id v16 = v10;
  id v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v15);
  id v12 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v13 = (int)[v12 requestResetFaceClusteringStateWithPhotoLibraryURL:v7 progressHandler:v8 completionHandler:v10];
  }
  else {
    int64_t v13 = v11[2](v11);
  }

  return v13;
}

uint64_t __147__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __145__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E586A350;
  id v10 = v9;
  id v16 = v10;
  id v11 = (uint64_t (**)(void))MEMORY[0x19F38D650](v15);
  id v12 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v13 = (int)[v12 requestClusterCacheValidationWithPhotoLibraryURL:v7 progressHandler:v8 completionHandler:v10];
  }
  else {
    int64_t v13 = v11[2](v11);
  }

  return v13;
}

uint64_t __145__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, MEMORY[0x1E4F1CC08], 0);
  }
  return -1;
}

+ (int64_t)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __175__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E586A350;
  id v13 = v12;
  id v19 = v13;
  int v14 = (uint64_t (**)(void))MEMORY[0x19F38D650](v18);
  id v15 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v16 = (int)[v15 requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:v9 photoLibraryURL:v10 progessHandler:v11 completionHandler:v13];
  }
  else {
    int64_t v16 = v14[2](v14);
  }

  return v16;
}

uint64_t __175__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], 0);
  }
  return -1;
}

+ (int64_t)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __176__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E586A350;
  id v15 = v14;
  id v21 = v15;
  int64_t v16 = (uint64_t (**)(void))MEMORY[0x19F38D650](v20);
  id v17 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v18 = (int)[v17 requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:v11 forceUpdate:v10 photoLibraryURL:v12 progessHandler:v13 completionHandler:v15];
  }
  else {
    int64_t v18 = v16[2](v16);
  }

  return v18;
}

uint64_t __176__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  }
  return -1;
}

+ (int64_t)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __226__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E586A350;
  id v19 = v18;
  id v25 = v19;
  id v20 = (uint64_t (**)(void))MEMORY[0x19F38D650](v24);
  id v21 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v22 = (int)[v21 requestSuggestedPersonsForPersonWithLocalIdentifier:v13 toBeConfirmedPersonSuggestions:v14 toBeRejectedPersonSuggestions:v15 photoLibraryURL:v16 progessHandler:v17 completionHandler:v19];
  }
  else {
    int64_t v22 = v20[2](v20);
  }

  return v22;
}

uint64_t __226__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], 0);
  }
  return -1;
}

+ (id)mediaAnalyzerOptionCaptionWithHighlight
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr;
  uint64_t v11 = getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "VCPMediaAnalyzerOption_CaptionWithHighlight");
    getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalyzerOption_CaptionWithHighlight(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 43, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalyzerOptionHighlightContexts
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr;
  uint64_t v11 = getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "VCPMediaAnalyzerOption_HighlightContexts");
    getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalyzerOption_HighlightContexts(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 42, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalyzerOptionSearchQueryString
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr;
  uint64_t v11 = getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "VCPMediaAnalyzerOption_SearchQueryString");
    getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalyzerOption_SearchQueryString(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 41, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultsKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultsKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultsKey");
    getMediaAnalysisResultsKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultsKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 64, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisQualityKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisQualityKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisQualityKeySymbolLoc_ptr;
  if (!getMediaAnalysisQualityKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisQualityKey");
    getMediaAnalysisQualityKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisQualityKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 63, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultDurationKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultDurationKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultDurationKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultDurationKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultDurationKey");
    getMediaAnalysisResultDurationKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultDurationKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 62, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultStartKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultStartKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultStartKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultStartKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultStartKey");
    getMediaAnalysisResultStartKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultStartKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 61, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisMovieHighlightResultsKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisMovieHighlightResultsKey");
    getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisMovieHighlightResultsKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 60, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (int64_t)requestAssetHighlightCaptionsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [getVCPMediaAnalyzerClass() sharedMediaAnalyzer];
  int v14 = [v13 requestAnalysis:0x40000 forAssets:v12 withOptions:v11 andProgressHandler:v10 andCompletionHandler:v9];

  return v14;
}

+ (id)mediaAnalysisResultVideoCaptionTextAttributeKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultVideoCaptionTextAttributeKey");
    getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultVideoCaptionTextAttributeKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 68, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisMiCaVideoCaptionResultsKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisMiCaVideoCaptionResultsKey");
    getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisMiCaVideoCaptionResultsKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 56, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultImageCaptionTextAttributeKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultImageCaptionTextAttributeKey");
    getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultImageCaptionTextAttributeKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 67, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultAttributesKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultAttributesKey");
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultAttributesKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 59, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisMiCaImageCaptionResultsKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisMiCaImageCaptionResultsKey");
    getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisMiCaImageCaptionResultsKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 55, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisResultVideoCaptionPreferenceAttributeKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisResultVideoCaptionPreferenceAttributeKey");
    getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultVideoCaptionPreferenceAttributeKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 58, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisVideoCaptionPreferenceResultsKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (void **)getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr;
  uint64_t v11 = getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr)
  {
    uint64_t v3 = MediaAnalysisLibrary_44831();
    v9[3] = (uint64_t)dlsym(v3, "MediaAnalysisVideoCaptionPreferenceResultsKey");
    getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr = v9[3];
    uint64_t v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = *v2;
    return v4;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisVideoCaptionPreferenceResultsKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PLMediaAnalysisServiceRequestAdapter.m", 57, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (int64_t)requestVideoCaptionPreferenceForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11) {
    id v14 = (id)[v11 mutableCopy];
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v15 = v14;
  id v16 = getVCPMediaAnalysisService_AllowOnDemandOption();
  uint64_t v17 = MEMORY[0x1E4F1CC28];
  [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v16];

  id v18 = getVCPMediaAnalysisService_AllowStreamingOption();
  [v15 setObject:v17 forKeyedSubscript:v18];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v19 = (void *)getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  uint64_t v29 = getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr)
  {
    id v20 = MediaAnalysisLibrary_44831();
    v27[3] = (uint64_t)dlsym(v20, "VCPMediaAnalysisService_InProcessOption");
    getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr = v27[3];
    id v19 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v19)
  {
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v19];
    int64_t v21 = [a1 mediaAnalysisTypeCaptionVideo];
    if (v21)
    {
      int64_t v22 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
      int64_t v21 = (int)[v22 requestAnalysisTypes:v21 forAssets:v10 withOptions:v15 progressHandler:v12 andCompletionHandler:v13];
    }
    else
    {
      (*((void (**)(id, void, void))v13 + 2))(v13, MEMORY[0x1E4F1CC08], 0);
    }

    return v21;
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalysisService_InProcessOption(void)"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"PLMediaAnalysisServiceRequestAdapter.m", 40, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (int64_t)requestAssetCaptionsOfTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  char v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13) {
    id v16 = (id)[v13 mutableCopy];
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v17 = v16;
  id v18 = getVCPMediaAnalysisService_AllowOnDemandOption();
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v18];

  id v20 = getVCPMediaAnalysisService_AllowStreamingOption();
  [v17 setObject:v19 forKeyedSubscript:v20];

  if (v10)
  {
    uint64_t v21 = [a1 mediaAnalysisTypeCaptionImage];
    if ((v10 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v21 = 0;
  if ((v10 & 2) != 0) {
LABEL_8:
  }
    v21 |= [a1 mediaAnalysisTypeCaptionVideo];
LABEL_9:
  if (v21)
  {
    int64_t v22 = [getVCPMediaAnalysisServiceClass_44865() sharedAnalysisService];
    int64_t v23 = (int)[v22 requestAnalysisTypes:v21 forAssets:v12 withOptions:v17 progressHandler:v14 andCompletionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, MEMORY[0x1E4F1CC08], 0);
    int64_t v23 = 0;
  }

  return v23;
}

+ (unint64_t)mediaAnalysisTypeCaptionImage
{
  return 0x2000000000000;
}

+ (unint64_t)mediaAnalysisTypeCaptionVideo
{
  return 0x200000000000;
}

@end