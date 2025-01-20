@interface PIParallaxAsset
- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3;
- (BOOL)isInCloud;
- (BOOL)supportsSegmentationResourceCaching;
- (CGRect)acceptableCropRect;
- (CGRect)gazeAreaRect;
- (CGRect)preferredCropRect;
- (NSArray)faceRegions;
- (NSArray)petRegions;
- (NSString)description;
- (NSString)localIdentifier;
- (NSURL)cacheURL;
- (NSURL)fileURL;
- (PIParallaxAsset)initWithFileURL:(id)a3;
- (int)loadMotionScore:(id)a3;
- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5;
- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4;
- (void)cancelMotionScoreRequest:(int)a3;
- (void)cancelPetsRegionsRequest:(int)a3;
- (void)setCacheURL:(id)a3;
- (void)setIsInCloud:(BOOL)a3;
- (void)updateSegmentationResource:(id)a3;
@end

@implementation PIParallaxAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_petRegions, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)setIsInCloud:(BOOL)a3
{
  self->_isInCloud = a3;
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (void)setCacheURL:(id)a3
{
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSArray)petRegions
{
  return self->_petRegions;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (CGRect)gazeAreaRect
{
  double x = self->_gazeAreaRect.origin.x;
  double y = self->_gazeAreaRect.origin.y;
  double width = self->_gazeAreaRect.size.width;
  double height = self->_gazeAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableRect.origin.x;
  double y = self->_acceptableRect.origin.y;
  double width = self->_acceptableRect.size.width;
  double height = self->_acceptableRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredRect.origin.x;
  double y = self->_preferredRect.origin.y;
  double width = self->_preferredRect.size.width;
  double height = self->_preferredRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)cancelMotionScoreRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [getVCPMediaAnalysisServiceClass_18529() sharedAnalysisService];
  [v4 cancelRequest:v3];
}

- (int)loadMotionScore:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void, void, __n128))v4;
  v6.n128_u32[0] = LODWORD(self->_motionScore);
  if (v6.n128_f32[0] >= 0.0)
  {
    (*((void (**)(id, void, __n128))v4 + 2))(v4, 0, v6);
LABEL_6:
    int v15 = 0;
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [(NSURL *)self->_videoComplementURL path];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    v10.n128_u32[0] = -1.0;
    v5[2](v5, 0, v10);
    goto LABEL_6;
  }
  v11 = [getVCPMediaAnalysisServiceClass_18529() sharedAnalysisService];
  v12 = [(PIParallaxAsset *)self fileURL];
  videoComplementURL = self->_videoComplementURL;
  v19[0] = v12;
  v19[1] = videoComplementURL;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__PIParallaxAsset_loadMotionScore___block_invoke;
  v17[3] = &unk_1E5D808B0;
  v17[4] = self;
  v18 = v5;
  int v15 = [v11 requestAnalysisTypes:0x40000 forAssetWithResourceURLs:v14 withOptions:MEMORY[0x1E4F1CC08] progressHandler:0 andCompletionHandler:v17];

LABEL_7:
  return v15;
}

void __35__PIParallaxAsset_loadMotionScore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    (*(void (**)(float))(*(void *)(a1 + 40) + 16))(-1.0);
    goto LABEL_11;
  }
  v7 = getMediaAnalysisResultsKey_18554();
  v8 = [v5 objectForKeyedSubscript:v7];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v9 = (void *)getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr;
  uint64_t v34 = getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_block_invoke;
    v36 = &unk_1E5D81578;
    v37 = &v31;
    __n128 v10 = MediaAnalysisLibrary_18532();
    v11 = dlsym(v10, "MediaAnalysisSettlingEffectsGatingResultsKey");
    *(void *)(v37[1] + 24) = v11;
    getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr = *(void *)(v37[1] + 24);
    char v9 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisSettlingEffectsGatingResultsKey(void)"];
    [v19 handleFailureInFunction:v20, @"PIParallaxAsset.m", 32, @"%s", dlerror() file lineNumber description];

    while (1)
    {
LABEL_19:
      __break(1u);
LABEL_20:
      if (v21)
      {
        specific = dispatch_get_specific(*v8);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = specific;
        v8 = [v28 callStackSymbols];
        v30 = [v8 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
LABEL_22:

      int v21 = _NUAssertFailHandler();
    }
  }
  v12 = [v8 objectForKeyedSubscript:*v9];
  if (![v12 count])
  {
    v22 = NUAssertLogger_18556();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = [NSString stringWithFormat:@"Invalid gating results"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v8 = (const void **)MEMORY[0x1E4F7A308];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_18556();
    int v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v24) {
      goto LABEL_20;
    }
    if (v21)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v8 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v8;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    goto LABEL_22;
  }
  v13 = [v12 firstObject];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v14 = (void *)getMediaAnalysisResultQualityKeySymbolLoc_ptr;
  uint64_t v34 = getMediaAnalysisResultQualityKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultQualityKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMediaAnalysisResultQualityKeySymbolLoc_block_invoke;
    v36 = &unk_1E5D81578;
    v37 = &v31;
    int v15 = MediaAnalysisLibrary_18532();
    v16 = dlsym(v15, "MediaAnalysisResultQualityKey");
    *(void *)(v37[1] + 24) = v16;
    getMediaAnalysisResultQualityKeySymbolLoc_ptr = *(void *)(v37[1] + 24);
    v14 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultQualityKey(void)"];
    [v19 handleFailureInFunction:v26, @"PIParallaxAsset.m", 33, @"%s", dlerror() file lineNumber description];

    goto LABEL_19;
  }
  v17 = [v13 objectForKeyedSubscript:*v14];
  [v17 floatValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 104) = v18;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_11:
}

- (void)cancelPetsRegionsRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [getVCPMediaAnalysisServiceClass_18529() sharedAnalysisService];
  [v4 cancelRequest:v3];
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [getVCPMediaAnalysisServiceClass_18529() sharedAnalysisService];
  v7 = [(PIParallaxAsset *)self fileURL];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3;
  v11[3] = &unk_1E5D80888;
  id v12 = &__block_literal_global_18577;
  id v13 = v5;
  id v9 = v5;
  LODWORD(v5) = [v6 requestAnalysisTypes:0x20000 forAssetWithResourceURLs:v8 withOptions:MEMORY[0x1E4F1CC08] progressHandler:0 andCompletionHandler:v11];

  return (int)v5;
}

void __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v7 = getMediaAnalysisResultsKey_18554();
  v8 = [v5 objectForKeyedSubscript:v7];

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  __n128 v10 = (id *)getMediaAnalysisPetsResultsKeySymbolLoc_ptr;
  uint64_t v30 = getMediaAnalysisPetsResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisPetsResultsKeySymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMediaAnalysisPetsResultsKeySymbolLoc_block_invoke;
    v26 = &unk_1E5D81578;
    v11 = MediaAnalysisLibrary_18532();
    v28[3] = (uint64_t)dlsym(v11, "MediaAnalysisPetsResultsKey");
    getMediaAnalysisPetsResultsKeySymbolLoc_ptr = v28[3];
    __n128 v10 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v10)
  {
    id v12 = *v10;
    id v13 = [v8 objectForKeyedSubscript:v12];
    v14 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v13);

    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v16 = (id *)getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr;
    uint64_t v30 = getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr;
    if (!getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getMediaAnalysisPetsFaceResultsKeySymbolLoc_block_invoke;
      v26 = &unk_1E5D81578;
      v17 = MediaAnalysisLibrary_18532();
      v28[3] = (uint64_t)dlsym(v17, "MediaAnalysisPetsFaceResultsKey");
      getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr = v28[3];
      v16 = (id *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (v16)
    {
      id v18 = *v16;
      v19 = [v8 objectForKeyedSubscript:v18];
      v20 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v19);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_10:

      return;
    }
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisPetsFaceResultsKey(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PIParallaxAsset.m", 29, @"%s", dlerror(), v23, v24, v25, v26);
  }
  else
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisPetsResultsKey(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PIParallaxAsset.m", 28, @"%s", dlerror(), v23, v24, v25, v26);
  }

  __break(1u);
}

uint64_t __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke()
{
  return PFMap();
}

void __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v3 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr_18583;
  uint64_t v23 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr_18583;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr_18583)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getMediaAnalysisResultAttributesKeySymbolLoc_block_invoke_18584;
    id v18 = &unk_1E5D81578;
    v19 = &v20;
    id v4 = MediaAnalysisLibrary_18532();
    v21[3] = (uint64_t)dlsym(v4, "MediaAnalysisResultAttributesKey");
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr_18583 = *(void *)(v19[1] + 24);
    uint64_t v3 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultAttributesKey(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PIParallaxAsset.m", 30, @"%s", dlerror());
LABEL_12:

    __break(1u);
    return;
  }
  id v5 = *v3;
  id v6 = [v2 objectForKeyedSubscript:v5];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v7 = (void *)getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr;
  uint64_t v23 = getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_block_invoke;
    id v18 = &unk_1E5D81578;
    v19 = &v20;
    v8 = MediaAnalysisLibrary_18532();
    v21[3] = (uint64_t)dlsym(v8, "MediaAnalysisResultPetsBoundsAttributeKey");
    getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr = *(void *)(v19[1] + 24);
    v7 = (void *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultPetsBoundsAttributeKey(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PIParallaxAsset.m", 31, @"%s", dlerror());
    goto LABEL_12;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:*v7];

  NSRect v14 = NSRectFromString(v9);
  __n128 v10 = [MEMORY[0x1E4F29238] valueWithBytes:&v14 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  id v11 = v10;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  id v5 = [(PIParallaxAsset *)self cacheURL];

  if (!v5) {
    return 1;
  }
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [(PIParallaxAsset *)self cacheURL];
  char v8 = [v6 removeItemAtURL:v7 error:a3];

  return v8;
}

- (void)updateSegmentationResource:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  id v4 = [(PIParallaxAsset *)self cacheURL];

  if (v4)
  {
    id v5 = [(PIParallaxAsset *)self cacheURL];
    v6[2](v6, v5);
  }
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 1;
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  v66[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  if (-[PIParallaxAsset isInCloud](self, "isInCloud") && ([v8 networkAccessAllowed] & 1) == 0)
  {
    uint64_t v24 = [MEMORY[0x1E4F7A438] failureError:@"Asset is not local" object:0];
    v9[2](v9, 0, v24);

    int v25 = 0;
LABEL_33:

    return v25;
  }
  __n128 v10 = CGImageSourceCreateWithURL((CFURLRef)self->_fileURL, 0);
  if (!v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F7A438] failureError:@"Failed to read image file" object:self->_fileURL];
    v9[2](v9, 0, v23);

LABEL_32:
    int v25 = 1;
    goto LABEL_33;
  }
  id v11 = v10;
  if ((unint64_t)a3 > 6)
  {
LABEL_31:
    CFRelease(v11);
    goto LABEL_32;
  }
  if (((1 << a3) & 0x55) != 0)
  {
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
    if (v12)
    {
      id v13 = v12;
      id v14 = objc_alloc_init(MEMORY[0x1E4F8CC68]);
      uint64_t v15 = v14;
      if (a3 == 6) {
        uint64_t v16 = 6;
      }
      else {
        uint64_t v16 = 2;
      }
      [v14 setType:v16];
      [v15 setProxyImage:0];
      [v15 setImageFileURL:self->_fileURL];
      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = [(NSURL *)self->_videoComplementURL path];
      int v19 = [v17 fileExistsAtPath:v18];

      if (v19) {
        [v15 setVideoFileURL:self->_videoComplementURL];
      }
      [v15 setOrientation:1];
      uint64_t v20 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FD70]];
      if (v20
        || ([v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]],
            (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v15, "setOrientation:", objc_msgSend(v20, "integerValue"));
      }
      fileURL = self->_fileURL;
      id v60 = 0;
      if ([(NSURL *)fileURL getResourceValue:&v60 forKey:*MEMORY[0x1E4F1C538] error:0])
      {
        uint64_t v22 = [v60 identifier];
        [v15 setFileType:v22];
      }
      ((void (**)(id, void *, void *))v9)[2](v9, v15, 0);
    }
    else
    {
      v43 = [MEMORY[0x1E4F7A438] failureError:@"Failed to load image properties" object:self->_fileURL];
      v9[2](v9, 0, v43);

      id v13 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (((1 << a3) & 0xA) != 0)
  {
    uint64_t v26 = *MEMORY[0x1E4F2FF68];
    v65[0] = *MEMORY[0x1E4F2FE28];
    v65[1] = v26;
    v66[0] = MEMORY[0x1E4F1CC38];
    v66[1] = &unk_1F0009C80;
    v65[2] = *MEMORY[0x1E4F2FE48];
    v66[2] = MEMORY[0x1E4F1CC38];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
    ThumbnailAtIndedouble x = CGImageSourceCreateThumbnailAtIndex(v11, 0, (CFDictionaryRef)v13);
    if (ThumbnailAtIndex)
    {
      ImageAtIndedouble x = ThumbnailAtIndex;
      uint64_t v29 = +[PIGlobalSettings globalSettings];
      int v30 = [v29 segmentationDebugRoundTripProxyImage];

      if (v30)
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F1CB10];
        v32 = NSTemporaryDirectory();
        uint64_t v33 = [v31 fileURLWithPath:v32];
        uint64_t v34 = [v33 URLByAppendingPathComponent:@"proxy.jpg"];

        v35 = [MEMORY[0x1E4F28CB8] defaultManager];
        v36 = [v34 absoluteString];
        int v37 = [v35 fileExistsAtPath:v36];

        if (v37)
        {
          uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v38 removeItemAtURL:v34 error:0];
        }
        v39 = [(id)*MEMORY[0x1E4F44410] identifier];
        v40 = CGImageDestinationCreateWithURL((CFURLRef)v34, v39, 1uLL, 0);

        CGImageDestinationAddImage(v40, ImageAtIndex, 0);
        CGImageDestinationFinalize(v40);
        CFRelease(v40);
        v41 = CGImageSourceCreateWithURL((CFURLRef)v34, 0);
        CGImageRelease(ImageAtIndex);
        ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v41, 0, 0);
        CFRelease(v41);
      }
      id v42 = objc_alloc_init(MEMORY[0x1E4F8CC68]);
      [v42 setType:3];
      [v42 setProxyImage:ImageAtIndex];
      ((void (**)(id, id, void *))v9)[2](v9, v42, 0);
      CFRelease(ImageAtIndex);
    }
    else
    {
      id v42 = [MEMORY[0x1E4F7A438] failureError:@"Failed to load thumbnail image" object:self->_fileURL];
      v9[2](v9, 0, v42);
    }

    goto LABEL_30;
  }
  v45 = NUAssertLogger_18556();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v46 = [NSString stringWithFormat:@"Unsupported"];
    *(_DWORD *)buf = 138543362;
    v62 = v46;
    _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v47 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v49 = NUAssertLogger_18556();
  BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v50)
    {
      v53 = dispatch_get_specific(*v47);
      v54 = (void *)MEMORY[0x1E4F29060];
      id v55 = v53;
      v56 = [v54 callStackSymbols];
      v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v62 = v53;
      __int16 v63 = 2114;
      v64 = v57;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v50)
  {
    v51 = [MEMORY[0x1E4F29060] callStackSymbols];
    v52 = [v51 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v62 = v52;
    _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  v58 = (PIParallaxAsset *)_NUAssertFailHandler();
  return [(PIParallaxAsset *)v58 localIdentifier];
}

- (NSString)localIdentifier
{
  return [(NSURL *)self->_fileURL path];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; fileURL = %@>",
                       objc_opt_class(),
                       self,
                       self->_fileURL);
}

- (PIParallaxAsset)initWithFileURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v21 = NUAssertLogger_18556();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v25 = NUAssertLogger_18556();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        uint64_t v29 = dispatch_get_specific(*v23);
        int v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        __int16 v37 = 2114;
        uint64_t v38 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  v34.receiver = self;
  v34.super_class = (Class)PIParallaxAsset;
  id v6 = [(PIParallaxAsset *)&v34 init];
  uint64_t v7 = [v5 copy];
  id v8 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v7;

  long long v9 = *MEMORY[0x1E4F1DB20];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v6 + 24) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v6 + 40) = v10;
  *(_OWORD *)(v6 + 56) = v9;
  *(_OWORD *)(v6 + 72) = v10;
  *(_OWORD *)(v6 + 120) = v9;
  *(_OWORD *)(v6 + 136) = v10;
  id v11 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = 0;

  CFDictionaryRef v12 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = 0;

  *((_DWORD *)v6 + 26) = -1082130432;
  id v13 = [v5 lastPathComponent];
  id v14 = [v13 stringByDeletingPathExtension];
  uint64_t v15 = [v14 stringByAppendingPathExtension:@"MOV"];

  uint64_t v16 = [v6 fileURL];
  v17 = [v16 URLByDeletingLastPathComponent];
  uint64_t v18 = [v17 URLByAppendingPathComponent:v15];

  int v19 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v18;

  return (PIParallaxAsset *)v6;
}

@end