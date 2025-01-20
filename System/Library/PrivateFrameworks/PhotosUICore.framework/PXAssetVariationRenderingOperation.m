@interface PXAssetVariationRenderingOperation
- (AVAsset)outputAVAsset;
- (AVVideoComposition)outputVideoComposition;
- (BOOL)renderAllResources;
- (BOOL)succeeded;
- (CGSize)targetSize;
- (NSDictionary)analysisResult;
- (NSError)error;
- (NSNumber)duration;
- (NSProgress)progress;
- (NSURL)outputImageURL;
- (NSURL)outputVideoURL;
- (PICompositionController)adjustedCompositionController;
- (PICompositionController)baseCompositionController;
- (PLLivePhotoEditSource)editSource;
- (PXAssetVariationRenderingOperation)init;
- (PXAssetVariationRenderingOperation)initWithEditSource:(id)a3 variationType:(int64_t)a4 analysisResult:(id)a5 baseCompositionController:(id)a6 outputImageURL:(id)a7 outputVideoURL:(id)a8 targetSize:(CGSize)a9 renderAllResources:(BOOL)a10;
- (UIImage)outputImage;
- (id)startHandler;
- (int64_t)variationType;
- (void)_incrementProgressWithStartDate:(id)a3;
- (void)_timeout;
- (void)cancel;
- (void)main;
- (void)setStartHandler:(id)a3;
@end

@implementation PXAssetVariationRenderingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputAVAsset, 0);
  objc_storeStrong((id *)&self->_adjustedCompositionController, 0);
  objc_storeStrong((id *)&self->_outputVideoURL, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_outputImageURL, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_baseCompositionController, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (AVAsset)outputAVAsset
{
  return self->_outputAVAsset;
}

- (PICompositionController)adjustedCompositionController
{
  return self->_adjustedCompositionController;
}

- (NSURL)outputVideoURL
{
  return self->_outputVideoURL;
}

- (UIImage)outputImage
{
  return self->_outputImage;
}

- (NSURL)outputImageURL
{
  return self->_outputImageURL;
}

- (void)setStartHandler:(id)a3
{
}

- (id)startHandler
{
  return self->_startHandler;
}

- (BOOL)renderAllResources
{
  return self->_renderAllResources;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PICompositionController)baseCompositionController
{
  return self->_baseCompositionController;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (PLLivePhotoEditSource)editSource
{
  return self->_editSource;
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (void)_incrementProgressWithStartDate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXAssetVariationRenderingOperation__incrementProgressWithStartDate___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__PXAssetVariationRenderingOperation__incrementProgressWithStartDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v3 = [WeakRetained progress];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v6 = v5;

    if (v6 + v6 <= 1.0) {
      double v7 = v6 + v6;
    }
    else {
      double v7 = 1.0;
    }
    objc_msgSend(v3, "setCompletedUnitCount:", (uint64_t)(v7 * (double)objc_msgSend(v3, "totalUnitCount")));
    [v8 _incrementProgressWithStartDate:*(void *)(a1 + 32)];

    id WeakRetained = v8;
  }
}

- (void)main
{
  v163[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 20000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v148, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  int64_t v4 = [(PXAssetVariationRenderingOperation *)self variationType];
  v79 = [(PXAssetVariationRenderingOperation *)self baseCompositionController];
  double v5 = [(PXAssetVariationRenderingOperation *)self editSource];
  v75 = [(PXAssetVariationRenderingOperation *)self outputImageURL];
  v77 = [(PXAssetVariationRenderingOperation *)self outputVideoURL];
  double v6 = [(PXAssetVariationRenderingOperation *)self analysisResult];
  [(PXAssetVariationRenderingOperation *)self targetSize];
  double v8 = v7;
  double v10 = v9;
  v80 = [MEMORY[0x1E4F1C9C8] date];
  v76 = [MEMORY[0x1E4F8A748] adjustmentConstants];
  v11 = [(PXAssetVariationRenderingOperation *)self startHandler];

  if (v11)
  {
    v12 = [(PXAssetVariationRenderingOperation *)self startHandler];
    v12[2]();
  }
  [(PXAssetVariationRenderingOperation *)self _incrementProgressWithStartDate:v80];
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x2020000000;
  char v146 = 1;
  uint64_t v137 = 0;
  v138 = &v137;
  uint64_t v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__73746;
  v141 = __Block_byref_object_dispose__73747;
  id v142 = 0;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v5 renderPriority:2];
  v14 = (void *)[v79 copy];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_28;
  v134[3] = &unk_1E5DB66B8;
  int64_t v136 = v4;
  id v74 = v6;
  id v135 = v74;
  [v13 applySourceChangesToCompositionSynchronously:v14 source:v5 withBlock:v134];
  objc_storeStrong((id *)&self->_adjustedCompositionController, v14);
  [v13 setCompositionController:self->_adjustedCompositionController];
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__73746;
  v132 = __Block_byref_object_dispose__73747;
  id v133 = 0;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__73746;
  v126 = __Block_byref_object_dispose__73747;
  id v127 = 0;
  v15 = [MEMORY[0x1E4F29128] UUID];
  v78 = [v15 UUIDString];

  v16 = dispatch_group_create();
  if ((unint64_t)(v4 - 1) >= 2
    && ![(PXAssetVariationRenderingOperation *)self renderAllResources])
  {
    goto LABEL_19;
  }
  v17 = +[PXAssetVariationsSettings sharedInstance];
  if ([v17 useLiveRenderedPreviews])
  {
    BOOL v18 = [(PXAssetVariationRenderingOperation *)self renderAllResources];

    if (!v18)
    {
      dispatch_group_enter(v16);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_2;
      v120[3] = &unk_1E5DCB768;
      v121[1] = &v143;
      v121[2] = &v128;
      v121[3] = &v122;
      v121[4] = &v137;
      v19 = v16;
      v121[0] = v19;
      objc_msgSend(v13, "renderVideoWithTargetSize:contentMode:name:completion:", 0, @"PXAssetVariationRenderingOperation-renderVideo", v120, v8, v10);
      dispatch_time_t v20 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v19, v20))
      {
        *((unsigned char *)v144 + 24) = 0;
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v162 = *MEMORY[0x1E4F28568];
        v163[0] = @"Video rendering timed out.";
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:&v162 count:1];
        uint64_t v23 = [v21 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v22];
        v24 = (void *)v138[5];
        v138[5] = v23;
      }
      objc_storeStrong((id *)&self->_outputAVAsset, (id)v129[5]);
      v25 = (id *)v121;
      v26 = (AVVideoComposition *)(id)v123[5];
      outputVideoComposition = self->_outputVideoComposition;
      self->_outputVideoComposition = v26;
      goto LABEL_13;
    }
  }
  else
  {
  }
  dispatch_group_enter(v16);
  uint64_t v28 = *MEMORY[0x1E4F156E8];
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_3;
  v118[3] = &unk_1E5DB66E0;
  v119[1] = &v143;
  v119[2] = &v137;
  v29 = v16;
  v119[0] = v29;
  id v30 = (id)[v13 exportVideoToURL:v77 preset:v28 livePhotoPairingIdentifier:v78 completion:v118];
  v25 = (id *)v119;
  dispatch_time_t v31 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v29, v31))
  {
    *((unsigned char *)v144 + 24) = 0;
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v160 = *MEMORY[0x1E4F28568];
    v161 = @"Video rendering timed out.";
    outputVideoComposition = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    uint64_t v33 = [v32 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:outputVideoComposition];
    v34 = (void *)v138[5];
    v138[5] = v33;

LABEL_13:
  }

  if (*((unsigned char *)v144 + 24) && ![(PXAssetVariationRenderingOperation *)self isCancelled])
  {
    if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL
      && ![(PXAssetVariationRenderingOperation *)self renderAllResources])
    {
LABEL_45:
      self->_succeeded = *((unsigned char *)v144 + 24);
      objc_storeStrong((id *)&self->_error, (id)v138[5]);
      v68 = [MEMORY[0x1E4F1C9C8] date];
      [v68 timeIntervalSinceDate:v80];
      double v70 = v69;

      v71 = [NSNumber numberWithDouble:v70];
      duration = self->_duration;
      self->_duration = v71;

      [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
      v73 = self;
      kdebug_trace();

      goto LABEL_46;
    }
LABEL_19:
    if (self->_variationType == 3
      && [(PXAssetVariationRenderingOperation *)self renderAllResources])
    {
      dispatch_group_enter(v16);
      uint64_t v112 = 0;
      v113 = &v112;
      uint64_t v114 = 0x3032000000;
      v115 = __Block_byref_object_copy__73746;
      v116 = __Block_byref_object_dispose__73747;
      id v117 = 0;
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__73746;
      v110 = __Block_byref_object_dispose__73747;
      id v111 = 0;
      uint64_t v102 = 0;
      v103 = &v102;
      uint64_t v104 = 0x2020000000;
      char v105 = 0;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_4;
      v97[3] = &unk_1E5DB6708;
      v99 = &v102;
      v100 = &v112;
      v101 = &v106;
      v35 = v16;
      v98 = v35;
      [v13 calculateLongExposureFusionParametersWithCompletionHandler:v97];
      dispatch_time_t v36 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v35, v36))
      {
        *((unsigned char *)v144 + 24) = 0;
        v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v158 = *MEMORY[0x1E4F28568];
        v159 = @"Long exposure fusion calculation timed out.";
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
        uint64_t v39 = [v37 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v38];
        v40 = (void *)v138[5];
        v138[5] = v39;
      }
      if (*((unsigned char *)v103 + 24))
      {
        if ([(id)v113[5] count])
        {
          v41 = [v76 PIHighResFusionAdjustmentKey];
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_5;
          v96[3] = &unk_1E5DB6730;
          v96[4] = &v112;
          [v79 modifyAdjustmentWithKey:v41 modificationBlock:v96];
        }
        dispatch_group_enter(v35);
        uint64_t v92 = 0;
        v93 = &v92;
        uint64_t v94 = 0x2020000000;
        char v95 = 0;
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_6;
        v88[3] = &unk_1E5DB6758;
        v91 = &v92;
        id v89 = v75;
        v42 = v35;
        v90 = v42;
        [v13 generateJPEGImageDataWithCompressionQuality:v78 livePhotoPairingIdentifier:v88 completionHandler:0.899999976];
        dispatch_time_t v43 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(v42, v43))
        {
          *((unsigned char *)v144 + 24) = 0;
          v44 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v156 = *MEMORY[0x1E4F28568];
          v157 = @"Long exposure fusion rendering timed out.";
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
          uint64_t v46 = [v44 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v45];
          v47 = (void *)v138[5];
          v138[5] = v46;
        }
        if (!*((unsigned char *)v93 + 24))
        {
          *((unsigned char *)v144 + 24) = 0;
          v48 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v154 = *MEMORY[0x1E4F28568];
          v155 = @"Long exposure fusion rendering failed.";
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
          uint64_t v50 = [v48 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v49];
          v51 = (void *)v138[5];
          v138[5] = v50;
        }
        _Block_object_dispose(&v92, 8);
      }
      else
      {
        id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v64 setObject:@"Long exposure fusion calculation failed." forKeyedSubscript:*MEMORY[0x1E4F28568]];
        uint64_t v65 = v107[5];
        if (v65) {
          [v64 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
        }
        uint64_t v66 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v64];
        v67 = (void *)v138[5];
        v138[5] = v66;
      }
      _Block_object_dispose(&v102, 8);
      _Block_object_dispose(&v106, 8);

      _Block_object_dispose(&v112, 8);
    }
    else
    {
      v52 = [v76 PIHighResFusionAdjustmentKey];
      [v79 removeAdjustmentWithKey:v52];

      if (!v4)
      {
        v53 = [v76 PIAutoLoopAdjustmentKey];
        [v79 removeAdjustmentWithKey:v53];
      }
      uint64_t v112 = 0;
      v113 = &v112;
      uint64_t v114 = 0x2020000000;
      LOBYTE(v115) = 0;
      BOOL v54 = [(PXAssetVariationRenderingOperation *)self renderAllResources];
      dispatch_group_enter(v16);
      if (v54)
      {
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_7;
        v84[3] = &unk_1E5DB6758;
        v87 = &v112;
        id v85 = v75;
        v86 = v16;
        [v13 generateJPEGImageDataWithCompressionQuality:v78 livePhotoPairingIdentifier:v84 completionHandler:0.899999976];
      }
      else
      {
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_8;
        v81[3] = &unk_1E5DB6780;
        v83 = &v112;
        v81[4] = self;
        v82 = v16;
        objc_msgSend(v13, "renderImageWithTargetSize:contentMode:name:completion:", 0, @"PXAssetVariationRenderingOperation-renderImage", v81, v8, v10);
      }
      dispatch_time_t v55 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v16, v55))
      {
        *((unsigned char *)v144 + 24) = 0;
        v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v152 = *MEMORY[0x1E4F28568];
        v153 = @"Image rendering timed out.";
        v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        uint64_t v58 = [v56 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v57];
        v59 = (void *)v138[5];
        v138[5] = v58;
      }
      if (!*((unsigned char *)v113 + 24))
      {
        v60 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v150 = *MEMORY[0x1E4F28568];
        v151 = @"Image rendering failed.";
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
        uint64_t v62 = [v60 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v61];
        v63 = (void *)v138[5];
        v138[5] = v62;
      }
      _Block_object_dispose(&v112, 8);
    }
    goto LABEL_45;
  }
  objc_storeStrong((id *)&self->_error, (id)v138[5]);
LABEL_46:

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v143, 8);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&location);
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timeout];
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_28(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = (void *)MEMORY[0x1E4F8A748];
  uint64_t v4 = *(unsigned __int16 *)(a1 + 40);
  id v5 = a2;
  [v3 compositionController:v5 applyAssetVariation:v4 withRecipe:*(void *)(a1 + 32)];
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v9) {
    BOOL v13 = *(unsigned char *)(v12 + 24) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  char v14 = !v13;
  *(unsigned char *)(v12 + 24) = v14;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (v11)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28A50];
    v21[0] = v11;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v5)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v15[0] = v5;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_4(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  [v3 setAlignment:v2];
  [v3 setEnabled:1];
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 writeToURL:*(void *)(a1 + 32) atomically:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 writeToURL:*(void *)(a1 + 32) atomically:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_8(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a2];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 304);
    *(void *)(v4 + 304) = v3;
  }
  double v6 = a1[5];
  dispatch_group_leave(v6);
}

- (void)cancel
{
  if (([(PXAssetVariationRenderingOperation *)self isFinished] & 1) == 0) {
    kdebug_trace();
  }
  v3.receiver = self;
  v3.super_class = (Class)PXAssetVariationRenderingOperation;
  [(PXAssetVariationRenderingOperation *)&v3 cancel];
}

- (void)_timeout
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (([(PXAssetVariationRenderingOperation *)self isFinished] & 1) == 0)
  {
    self->_succeeded = 0;
    objc_super v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"Rendering timed out";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v3 errorWithDomain:@"PXAssetVariationRenderingOperationErrorDomain" code:0 userInfo:v4];
    error = self->_error;
    self->_error = v5;

    [(PXAssetVariationRenderingOperation *)self cancel];
  }
}

- (PXAssetVariationRenderingOperation)initWithEditSource:(id)a3 variationType:(int64_t)a4 analysisResult:(id)a5 baseCompositionController:(id)a6 outputImageURL:(id)a7 outputVideoURL:(id)a8 targetSize:(CGSize)a9 renderAllResources:(BOOL)a10
{
  double height = a9.height;
  double width = a9.width;
  id v34 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  if (width <= 0.0 || height <= 0.0)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PXAssetVariationRenderingOperation.m", 78, @"Invalid parameter not satisfying: %@", @"targetSize.width > 0 && targetSize.height > 0" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)PXAssetVariationRenderingOperation;
  v24 = [(PXAssetVariationRenderingOperation *)&v38 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_editSource, a3);
    v25->_variationType = a4;
    uint64_t v26 = [v20 copy];
    analysisResult = v25->_analysisResult;
    v25->_analysisResult = (NSDictionary *)v26;

    uint64_t v28 = [v21 copy];
    baseCompositionController = v25->_baseCompositionController;
    v25->_baseCompositionController = (PICompositionController *)v28;

    objc_storeStrong((id *)&v25->_outputImageURL, a7);
    v25->_targetSize.double width = width;
    v25->_targetSize.double height = height;
    objc_storeStrong((id *)&v25->_outputVideoURL, a8);
    v25->_renderAllResources = a10;
    uint64_t v30 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:50];
    progress = v25->_progress;
    v25->_progress = (NSProgress *)v30;

    objc_initWeak(&location, v25);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __172__PXAssetVariationRenderingOperation_initWithEditSource_variationType_analysisResult_baseCompositionController_outputImageURL_outputVideoURL_targetSize_renderAllResources___block_invoke;
    v35[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v36, &location);
    [(NSProgress *)v25->_progress setCancellationHandler:v35];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v25;
}

void __172__PXAssetVariationRenderingOperation_initWithEditSource_variationType_analysisResult_baseCompositionController_outputImageURL_outputVideoURL_targetSize_renderAllResources___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (PXAssetVariationRenderingOperation)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetVariationRenderingOperation.m", 66, @"%s is not available as initializer", "-[PXAssetVariationRenderingOperation init]");

  abort();
}

@end