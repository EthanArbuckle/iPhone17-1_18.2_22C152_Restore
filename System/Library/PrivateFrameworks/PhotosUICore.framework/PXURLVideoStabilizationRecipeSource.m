@interface PXURLVideoStabilizationRecipeSource
- (PXURLVideoStabilizationRecipeSource)initWithVideoURL:(id)a3;
- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4;
- (id)analyticsPayload;
@end

@implementation PXURLVideoStabilizationRecipeSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizeRequest, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v51 = self->_inputVideoURL;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8AC88]) initWithVideoURL:v51];
  id PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  v7 = (void *)[getPIPhotoEditHelperClass() newComposition];
  v8 = (void *)[PIPhotoEditHelperClass newCompositionControllerWithComposition:v7];

  v47 = v5;
  v9 = [v5 source];
  [v8 setSource:v9 mediaType:2];

  v10 = (void *)[v8 copy];
  id v11 = getPIPhotoEditHelperClass();
  v48 = v10;
  v12 = [v10 composition];
  v13 = [v11 imagePropertiesRequestWithComposition:v12];

  [v13 setName:@"PXStabilizedPlayerItemWithVideoURL-imageProperties"];
  id v62 = 0;
  v14 = [v13 submitSynchronous:&v62];
  id v15 = v62;
  v46 = v15;
  if (v14)
  {
    v16 = [v14 properties];
    uint64_t v17 = [v16 orientation];

    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    v18 = (uint64_t (*)(uint64_t))getNUOrientationIsValidSymbolLoc_ptr;
    v59 = (uint64_t (*)(uint64_t, uint64_t))getNUOrientationIsValidSymbolLoc_ptr;
    if (!getNUOrientationIsValidSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v68 = (uint64_t)__getNUOrientationIsValidSymbolLoc_block_invoke;
      v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5DD2B08;
      v70 = (void (*)(uint64_t))&v56;
      __getNUOrientationIsValidSymbolLoc_block_invoke(&buf);
      v18 = (uint64_t (*)(uint64_t))v57[3];
    }
    _Block_object_dispose(&v56, 8);
    if (!v18)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)"];
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PXVideoStabilizationRecipeSource.m", 40, @"%s", dlerror());

      __break(1u);
    }
    if (v18(v17))
    {
      [MEMORY[0x1E4F8A748] compositionController:v8 setInputOrientation:v17];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v17;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "image orientation from the image properties is invalid: %d", (uint8_t *)&buf, 8u);
    }
    id v20 = 0;
  }
  else
  {
    v19 = v15;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered determining image properties for stabilized video composition: %@", (uint8_t *)&buf, 0xCu);
    }
    id v20 = v19;
  }
  id PIVideoStabilizeRequestClass = getPIVideoStabilizeRequestClass();
  v22 = [MEMORY[0x1E4F16330] assetWithURL:v51];
  uint64_t v23 = [PIVideoStabilizeRequestClass canPerformGyroBasedStabilizationForAsset:v22];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__199619;
  v70 = __Block_byref_object_dispose__199620;
  id v71 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__199619;
  v60 = __Block_byref_object_dispose__199620;
  id v61 = 0;
  v24 = dispatch_group_create();
  if ([(PXVideoStabilizationRecipeSource *)self allowedAnalysisTypes]) {
    uint64_t v25 = [(PXVideoStabilizationRecipeSource *)self allowsOnDemandPixelAnalysis];
  }
  else {
    uint64_t v25 = 0;
  }
  char v26 = [(PXVideoStabilizationRecipeSource *)self allowedAnalysisTypes];
  uint64_t v27 = v25 | 2;
  if (!v23) {
    uint64_t v27 = v25;
  }
  if ((v26 & 2) != 0) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = v25;
  }
  id v29 = objc_alloc((Class)getPIVideoStabilizeRequestClass());
  v30 = [v8 composition];
  v31 = (PIVideoStabilizeRequest *)[v29 initWithComposition:v30];
  stabilizeRequest = self->_stabilizeRequest;
  self->_stabilizeRequest = v31;

  v33 = +[PXInlineVideoStabilizationSettings sharedInstance];
  [v33 allowedCropFraction];
  -[PIVideoStabilizeRequest setAllowedCropFraction:](self->_stabilizeRequest, "setAllowedCropFraction:");

  [(PIVideoStabilizeRequest *)self->_stabilizeRequest setAllowedAnalysisTypes:v28];
  [(PIVideoStabilizeRequest *)self->_stabilizeRequest setName:@"PXStabilizedPlayerItemWithVideoURL-stabilize"];
  dispatch_group_enter(v24);
  v34 = self->_stabilizeRequest;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __77__PXURLVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke;
  v52[3] = &unk_1E5DC40A8;
  p_long long buf = &buf;
  v55 = &v56;
  v35 = v24;
  v53 = v35;
  [(PIVideoStabilizeRequest *)v34 submit:v52];
  dispatch_group_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
  v36 = *(void **)(*((void *)&buf + 1) + 40);
  if (v36)
  {
    v37 = [v36 rawHomographies];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = v57[5];
      *(_DWORD *)v65 = 138412290;
      uint64_t v66 = v43;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered generating stabilization data: %@", v65, 0xCu);
    }
    id v38 = (id)v57[5];

    v37 = 0;
    id v20 = v38;
  }
  if (a3) {
    *a3 = v20;
  }
  if (a4)
  {
    unint64_t v39 = [*(id *)(*((void *)&buf + 1) + 40) analysisType];
    if (v39 <= 2) {
      *a4 = v39;
    }
  }
  v63 = @"InputVideoHasGyro";
  v40 = [NSNumber numberWithBool:v23];
  v64 = v40;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  [(PXVideoStabilizationRecipeSource *)self setDebugInfo:v41];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&buf, 8);

  return v37;
}

void __77__PXURLVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)analyticsPayload
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PXURLVideoStabilizationRecipeSource)initWithVideoURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXURLVideoStabilizationRecipeSource;
  uint64_t v5 = [(PXVideoStabilizationRecipeSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    inputVideoURL = v5->_inputVideoURL;
    v5->_inputVideoURL = (NSURL *)v6;
  }
  return v5;
}

@end