@interface PXVideoStabilizeOperation
- (PXVideoStabilizeOperation)initWithSpec:(id)a3;
- (id)performProcessing;
- (void)cancel;
@end

@implementation PXVideoStabilizeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePropertiesRequest, 0);
  objc_storeStrong((id *)&self->_stabilizeRequest, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)PXVideoStabilizeOperation;
  [(PXVideoStabilizeOperation *)&v6 cancel];
  v3 = self;
  objc_sync_enter(v3);
  [(PLPhotoEditRenderer *)v3->_renderer cancelAllRenders];
  v4 = [(PIVideoStabilizeRequest *)v3->_stabilizeRequest renderContext];
  [v4 cancelAllRequests];

  v5 = [(NUImagePropertiesRequest *)v3->_imagePropertiesRequest renderContext];
  [v5 cancelAllRequests];

  objc_sync_exit(v3);
}

- (id)performProcessing
{
  v152[1] = *MEMORY[0x1E4F143B8];
  v96 = objc_alloc_init(_PXVideoStabilizeResult);
  v3 = [(PXVideoProcessingOperation *)self spec];
  v97 = [v3 inputVideoURL];

  v4 = [(PXVideoProcessingOperation *)self spec];
  int v91 = [v4 performStabilization];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8AC88]) initWithVideoURL:v97];
  uint64_t v6 = [(PXVideoProcessingOperation *)self progressHandler];
  v7 = (void (**)(void, void, float))v6;
  if (v6) {
    (*(void (**)(uint64_t, __CFString *, double))(v6 + 16))(v6, @"Preparing NUComposition", 0.0);
  }
  id PIPhotoEditHelperClass_250596 = getPIPhotoEditHelperClass_250596();
  v9 = (void *)[getPIPhotoEditHelperClass_250596() newComposition];
  v10 = (void *)[PIPhotoEditHelperClass_250596 newCompositionControllerWithComposition:v9];

  v11 = [v5 source];
  [v10 setSource:v11 mediaType:2];

  v94 = [v10 adjustmentConstants];
  v12 = (void *)[v10 copy];
  v13 = self;
  objc_sync_enter(v13);
  v93 = v12;
  if ([(PXVideoStabilizeOperation *)v13 isCancelled])
  {
    objc_sync_exit(v13);

    v95 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_78;
  }
  id v17 = getPIPhotoEditHelperClass_250596();
  v18 = [v12 composition];
  uint64_t v19 = [v17 imagePropertiesRequestWithComposition:v18];
  imagePropertiesRequest = v13->_imagePropertiesRequest;
  v13->_imagePropertiesRequest = (NUImagePropertiesRequest *)v19;

  [(NUImagePropertiesRequest *)v13->_imagePropertiesRequest setName:@"PXStabilizedPlayerItemWithVideoURL-imageProperties"];
  v21 = v13->_imagePropertiesRequest;
  id v141 = 0;
  v95 = [(NUImagePropertiesRequest *)v21 submitSynchronous:&v141];
  id v89 = v141;
  objc_sync_exit(v13);

  if (([(PXVideoStabilizeOperation *)v13 isCancelled] & 1) == 0)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F166C8]);
    uint64_t v151 = *MEMORY[0x1E4F16148];
    v152[0] = MEMORY[0x1E4F1CC38];
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:&v151 count:1];
    v88 = (void *)[v22 initWithURL:v97 options:v23];

    id v140 = 0;
    v85 = [getNUVideoUtilitiesClass() firstEnabledVideoTrackInAsset:v88 error:&v140];
    id v84 = v140;
    long long v138 = 0u;
    long long v139 = 0u;
    id NUVideoUtilitiesClass = getNUVideoUtilitiesClass();
    if (NUVideoUtilitiesClass)
    {
      [NUVideoUtilitiesClass cleanApertureOfTrack:v85 oriented:0];
      uint64_t v82 = *((void *)&v139 + 1);
      uint64_t v83 = v139;
    }
    else
    {
      uint64_t v82 = 0;
      uint64_t v83 = 0;
      long long v138 = 0u;
      long long v139 = 0u;
    }
    if (v95)
    {
      v25 = [v95 properties];
      uint64_t v26 = [v25 orientation];

      uint64_t v129 = 0;
      v130 = &v129;
      uint64_t v131 = 0x2020000000;
      v27 = (uint64_t (*)(uint64_t))getNUOrientationIsValidSymbolLoc_ptr_250600;
      v132 = (uint64_t (*)(uint64_t, uint64_t))getNUOrientationIsValidSymbolLoc_ptr_250600;
      if (!getNUOrientationIsValidSymbolLoc_ptr_250600)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v147 = (uint64_t)__getNUOrientationIsValidSymbolLoc_block_invoke_250601;
        v148 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5DD2B08;
        v149 = (void (*)(uint64_t))&v129;
        v28 = NeutrinoCoreLibrary();
        v29 = dlsym(v28, "NUOrientationIsValid");
        *(void *)(*((void *)v149 + 1) + 24) = v29;
        getNUOrientationIsValidSymbolLoc_ptr_250600 = *(_UNKNOWN **)(*((void *)v149 + 1) + 24);
        v27 = (uint64_t (*)(uint64_t))v130[3];
      }
      _Block_object_dispose(&v129, 8);
      if (!v27)
      {
        v78 = [MEMORY[0x1E4F28B00] currentHandler];
        v79 = [NSString stringWithUTF8String:"NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)"];
        objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, @"PXVideoStabilizeOperation.m", 38, @"%s", dlerror());

        goto LABEL_83;
      }
      if (v27(v26))
      {
        [MEMORY[0x1E4F8A748] compositionController:v10 setInputOrientation:v26];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v26;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "image orientation from the image properties is invalid: %d", (uint8_t *)&buf, 8u);
      }
      v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v89;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered determining image properties for stabilized video composition: %@", (uint8_t *)&buf, 0xCu);
      }
      v15 = (PXVideoStabilizeOperation *)v89;
    }
    v90 = 0;
    uint64_t v137 = 0;
    if (!v91) {
      goto LABEL_43;
    }
    v30 = [(PXVideoProcessingOperation *)v13 spec];
    v31 = [v30 recipeSource];
    id v136 = 0;
    dispatch_group_t group = [v31 loadStabilizationRecipe:&v136 analysisType:&v137];
    id v32 = v136;

    if (!group)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v32;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered loading stabilization recipe: %@", (uint8_t *)&buf, 0xCu);
      }
      v37 = (PXVideoStabilizeOperation *)v32;

      goto LABEL_40;
    }
    id v135 = v32;
    v33 = group;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v34 = (void (*)(NSObject *, uint64_t, uint64_t, id *))getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr;
    v132 = (uint64_t (*)(uint64_t, uint64_t))getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr;
    if (!getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v147 = (uint64_t)__getPIVideoStabilizeResultFromHomographiesSymbolLoc_block_invoke;
      v148 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5DD2B08;
      v149 = (void (*)(uint64_t))&v129;
      v35 = PhotoImagingLibrary_250611();
      v36 = dlsym(v35, "PIVideoStabilizeResultFromHomographies");
      *(void *)(*((void *)v149 + 1) + 24) = v36;
      getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v149 + 1) + 24);
      v34 = (void (*)(NSObject *, uint64_t, uint64_t, id *))v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (v34)
    {
      v90 = v34(v33, v83, v82, &v135);

      v37 = (PXVideoStabilizeOperation *)v135;
      if (v90)
      {
        [v90 stabCropRect];
        if (NUPixelRectIsEmpty() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v90;
          _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Stabilization recipe returned empty crop rect: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        v38 = [v90 keyframes];
        BOOL v39 = [v38 count] == 0;

        if (v39)
        {
          dispatch_group_t v40 = group;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v90;
            _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Stabilization recipe returned no keyframes: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          goto LABEL_42;
        }
LABEL_41:
        dispatch_group_t v40 = group;
LABEL_42:

LABEL_43:
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v147 = 0x3032000000;
        v148 = __Block_byref_object_copy__250617;
        v149 = __Block_byref_object_dispose__250618;
        id v150 = 0;
        uint64_t v129 = 0;
        v130 = &v129;
        uint64_t v131 = 0x3032000000;
        v132 = __Block_byref_object_copy__250617;
        v133 = __Block_byref_object_dispose__250618;
        id v134 = 0;
        uint64_t v123 = 0;
        v124 = &v123;
        uint64_t v125 = 0x3032000000;
        v126 = __Block_byref_object_copy__250617;
        v127 = __Block_byref_object_dispose__250618;
        id v128 = 0;
        uint64_t v117 = 0;
        v118 = &v117;
        uint64_t v119 = 0x3032000000;
        v120 = __Block_byref_object_copy__250617;
        v121 = __Block_byref_object_dispose__250618;
        id v122 = 0;
        groupa = dispatch_group_create();
        if ([(PXVideoStabilizeOperation *)v13 isCancelled])
        {
          v16 = 0;
LABEL_76:

          _Block_object_dispose(&v117, 8);
          _Block_object_dispose(&v123, 8);

          _Block_object_dispose(&v129, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_77;
        }
        if (v7) {
          ((void (**)(void, __CFString *, float))v7)[2](v7, @"Rendering", 0.9);
        }
        uint64_t v41 = [objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v5];
        renderer = v13->_renderer;
        v13->_renderer = (PLPhotoEditRenderer *)v41;

        [(PLPhotoEditRenderer *)v13->_renderer setCompositionController:v10];
        if (v90
          || ([(PXVideoProcessingOperation *)v13 spec],
              v43 = objc_claimAutoreleasedReturnValue(),
              char v44 = [v43 abortIfStabilizationFails],
              v43,
              (v44 & 1) == 0))
        {
          v45 = v13->_renderer;
          v109[0] = MEMORY[0x1E4F143A8];
          v109[1] = 3221225472;
          v109[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke;
          v109[3] = &unk_1E5DCB718;
          char v116 = v91;
          id v110 = v90;
          id v46 = v94;
          long long v114 = v138;
          long long v115 = v139;
          id v111 = v46;
          v112 = v13;
          id v113 = v88;
          [(PLPhotoEditRenderer *)v45 applySourceChangesToCompositionSynchronously:v10 source:v5 withBlock:v109];
        }
        v47 = [(PXVideoProcessingOperation *)v13 spec];
        v92 = [v47 outputURL];

        if (!v92)
        {
          dispatch_group_enter(groupa);
          v58 = v13->_renderer;
          v59 = [v95 properties];
          uint64_t v60 = [v59 size];
          v61 = [v95 properties];
          [v61 size];
          double v63 = (double)v62;
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2_29;
          v99[3] = &unk_1E5DCB768;
          p_long long buf = &buf;
          v102 = &v129;
          v103 = &v123;
          v104 = &v117;
          v100 = groupa;
          [(PLPhotoEditRenderer *)v58 renderVideoWithTargetSize:0, @"PXVideoStabilizeOperation-video", v99, (double)v60, v63 contentMode name completion];

          v48 = v100;
LABEL_60:

          dispatch_group_wait(groupa, 0xFFFFFFFFFFFFFFFFLL);
          if (v7) {
            ((void (**)(void, __CFString *, float))v7)[2](v7, @"Finished!", 1.0);
          }
          if (!*(void *)(*((void *)&buf + 1) + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v142 = 138412290;
              v143 = v15;
              _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered rendering stabilized video: %@", v142, 0xCu);
            }
            v64 = (PXVideoStabilizeOperation *)(id)v118[5];

            v15 = v64;
          }
          v65 = [(PXVideoProcessingOperation *)v13 spec];
          [(_PXVideoStabilizeResult *)v96 setSpec:v65];

          [(_PXVideoStabilizeResult *)v96 setOutputVideoAsset:*(void *)(*((void *)&buf + 1) + 40)];
          [(_PXVideoStabilizeResult *)v96 setOutputVideoComposition:v130[5]];
          [(_PXVideoStabilizeResult *)v96 setOutputAudioMix:v124[5]];
          if (v90) {
            uint64_t v66 = v137;
          }
          else {
            uint64_t v66 = 4;
          }
          [(_PXVideoStabilizeResult *)v96 setAnalysisType:v66];
          [(_PXVideoStabilizeResult *)v96 setError:v15];
          v67 = [v90 rawHomographies];
          [(_PXVideoStabilizeResult *)v96 setStabilizationRecipe:v67];

          v68 = [(PXVideoProcessingOperation *)v13 spec];
          v69 = [v68 recipeSource];
          v70 = [v69 debugInfo];
          [(_PXVideoStabilizeResult *)v96 setDebugInfo:v70];

          v71 = [(PXVideoProcessingOperation *)v13 spec];
          v72 = [v71 debugInfoOutputURL];

          if (v72)
          {
            v73 = [(_PXVideoStabilizeResult *)v96 dictionaryRepresentation];
            id v98 = 0;
            char v74 = [v73 writeToURL:v72 error:&v98];
            id v75 = v98;

            if ((v74 & 1) == 0)
            {
              v76 = PLUIGetLog();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v142 = 138412546;
                v143 = v13;
                __int16 v144 = 2112;
                id v145 = v75;
                _os_log_impl(&dword_1A9AE7000, v76, OS_LOG_TYPE_ERROR, "%@: Unable to write debug plist to disk. Error: %@", v142, 0x16u);
              }
            }
          }
          v16 = v96;

          goto LABEL_76;
        }
        v48 = [MEMORY[0x1E4F28CB8] defaultManager];
        v49 = [(PXVideoStabilizeOperation *)v92 path];
        int v50 = [v48 fileExistsAtPath:v49];

        if (v50)
        {
          v51 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v108 = 0;
          char v52 = [v51 removeItemAtURL:v92 error:&v108];
          id v53 = v108;

          if ((v52 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v142 = 138412546;
              v143 = v92;
              __int16 v144 = 2112;
              id v145 = v53;
              _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered deleting existing file before exporting to %@: %@", v142, 0x16u);
            }
            v57 = v118[5];
            v118[5] = (uint64_t)v53;
            goto LABEL_59;
          }
        }
        dispatch_group_enter(groupa);
        v54 = v13->_renderer;
        uint64_t v55 = *MEMORY[0x1E4F156E8];
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_24;
        v105[3] = &unk_1E5DCB740;
        v107 = &v117;
        v106 = groupa;
        id v56 = (id)[(PLPhotoEditRenderer *)v54 exportVideoToURL:v92 preset:v55 livePhotoPairingIdentifier:0 completion:v105];
        v57 = v106;
LABEL_59:

        goto LABEL_60;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v37;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered loading stabilization recipe: %@", (uint8_t *)&buf, 0xCu);
      }
      v37 = v37;

LABEL_40:
      v90 = 0;
      v15 = v37;
      goto LABEL_41;
    }
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    v81 = objc_msgSend(NSString, "stringWithUTF8String:", "id<PIVideoStabilizeResult>  _Nullable SOFT_LINKED_PIVideoStabilizeResultFromHomographies(NSDictionary *__strong, NUPixelSize, NSError *__autoreleasing *)");
    objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, @"PXVideoStabilizeOperation.m", 37, @"%s", dlerror());

LABEL_83:
    __break(1u);
  }
  v15 = 0;
  v16 = 0;
LABEL_77:
  v14 = v89;
LABEL_78:

  return v16;
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 96)) {
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = [v4 keyframes];
    if ([v5 count])
    {
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 stabCropRect];
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      char IsEmpty = NUPixelRectIsEmpty();

      if ((IsEmpty & 1) == 0)
      {
        v8 = [*(id *)(a1 + 40) PIVideoStabilizeAdjustmentKey];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2;
        v50[3] = &unk_1E5DCB670;
        id v51 = *(id *)(a1 + 32);
        char v52 = 1;
        [v3 modifyAdjustmentWithKey:v8 modificationBlock:v50];
      }
    }
    else
    {
    }
  }
  if (!*(unsigned char *)(a1 + 96) || !*(void *)(a1 + 32))
  {
LABEL_12:
    long long v9 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&time1.start.value = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&time1.start.CMTimeEpoch epoch = v9;
    if ((NUPixelRectIsEmpty() & 1) == 0)
    {
      v10 = [*(id *)(a1 + 40) PICropAdjustmentKey];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_3;
      v47[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
      long long v11 = *(_OWORD *)(a1 + 80);
      long long v48 = *(_OWORD *)(a1 + 64);
      long long v49 = v11;
      [v3 modifyAdjustmentWithKey:v10 modificationBlock:v47];
    }
  }
  v12 = [*(id *)(a1 + 48) spec];
  char v13 = [v12 wantsAudio];

  if ((v13 & 1) == 0)
  {
    v14 = [*(id *)(a1 + 40) PIMuteAdjustmentKey];
    [v3 modifyAdjustmentWithKey:v14 modificationBlock:&__block_literal_global_250633];
  }
  long long v45 = 0uLL;
  CMTimeEpoch v46 = 0;
  v15 = [*(id *)(a1 + 48) spec];
  v16 = v15;
  if (v15)
  {
    [v15 crossfadeDuration];
  }
  else
  {
    long long v45 = 0uLL;
    CMTimeEpoch v46 = 0;
  }

  memset(&v44, 0, sizeof(v44));
  id v17 = [*(id *)(a1 + 48) spec];
  v18 = v17;
  if (v17) {
    [v17 startTime];
  }
  else {
    memset(&v44, 0, sizeof(v44));
  }

  if ((BYTE12(v45) & 0x1D) == 1
    && (*(_OWORD *)&time1.start.value = v45,
        time1.start.CMTimeEpoch epoch = v46,
        uint64_t v19 = MEMORY[0x1E4F1FA48],
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48],
        time2.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
        CMTimeCompare(&time1.start, &time2.start) >= 1))
  {
    memset(&time1, 0, sizeof(time1));
    v20 = [*(id *)(a1 + 48) spec];
    v21 = v20;
    if (v20) {
      [v20 timeRange];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }

    if ((time1.start.flags & 1) == 0
      || (time1.duration.flags & 1) == 0
      || time1.duration.epoch
      || time1.duration.value < 0)
    {
      v24 = *(void **)(a1 + 56);
      if (v24) {
        [v24 duration];
      }
      else {
        memset(&time2, 0, 24);
      }
      CMTime v43 = time2.start;
      *(_OWORD *)&start.start.value = *(_OWORD *)v19;
      start.start.CMTimeEpoch epoch = *(void *)(v19 + 16);
      CMTime duration = time2.start;
      CMTimeRangeMake(&time2, &start.start, &duration);
      CMTimeRange time1 = time2;
    }
    else
    {
      CMTime v43 = time1.duration;
    }
    time2.CMTimeRange start = v43;
    CMTimeMultiplyByRatio(&v39, &time2.start, 1, 2);
    *(_OWORD *)&start.start.value = v45;
    start.start.CMTimeEpoch epoch = v46;
    CMTimeMinimum(&time2.start, &start.start, &v39);
    long long v25 = *(_OWORD *)&time2.start.value;
    long long v45 = *(_OWORD *)&time2.start.value;
    CMTimeEpoch epoch = time2.start.epoch;
    CMTimeEpoch v46 = time2.start.epoch;
    memset(&time2, 0, sizeof(time2));
    *(_OWORD *)&start.start.value = *(_OWORD *)&time1.start.value;
    start.start.CMTimeEpoch epoch = time1.start.epoch;
    *(_OWORD *)&duration.value = v25;
    duration.CMTimeEpoch epoch = epoch;
    CMTimeAdd(&v38, &start.start, &duration);
    CMTimeRange start = time1;
    CMTimeRangeGetEnd(&end, &start);
    CMTimeRangeFromTimeToTime(&time2, &v38, &end);
    CMTime time = v44;
    CMTimeRange start = time2;
    CMTimeClampToRange(&duration, &time, &start);
    CMTime v44 = duration;
    id v22 = [*(id *)(a1 + 40) PIVideoCrossfadeLoopAdjustmentKey];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_5;
    v30 = &__block_descriptor_128_e50_v16__0__PIVideoCrossfadeLoopAdjustmentController_8l;
    long long v31 = v45;
    CMTimeEpoch v32 = v46;
    CMTime v33 = v44;
    CMTimeRange v34 = time1;
    v23 = &v27;
  }
  else
  {
    id v22 = [*(id *)(a1 + 40) PIVideoCrossfadeLoopAdjustmentKey];
    v23 = (uint64_t *)&__block_literal_global_21_250634;
  }
  objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v22, v23, v27, v28, v29, v30, v31, v32, *(_OWORD *)&v33.value, v33.epoch, *(_OWORD *)&v34.start.value, *(_OWORD *)&v34.start.epoch, *(_OWORD *)&v34.duration.timescale);
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_24(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2_29(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v24 = v9;

  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
  id v23 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) keyframes];
  [v3 setKeyframes:v4];

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 stabCropRect];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  [v3 setStabCropRect:v6];
  [v3 setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_3(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v2 = a2;
  NUPixelRectToCGRect();
  objc_msgSend(v2, "setCropRect:", v3, v4);
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_5(uint64_t a1, void *a2)
{
  long long v8 = *(_OWORD *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v3 = a2;
  [v3 setCrossfadeDuration:&v8];
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  [v3 setStartTime:&v6];
  long long v4 = *(_OWORD *)(a1 + 96);
  v5[0] = *(_OWORD *)(a1 + 80);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 112);
  [v3 setLoopTimeRange:v5];
  [v3 setEnabled:1];
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (long long *)MEMORY[0x1E4F1FA48];
  long long v8 = *MEMORY[0x1E4F1FA48];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  id v3 = a2;
  [v3 setCrossfadeDuration:&v8];
  long long v6 = *v2;
  uint64_t v7 = *((void *)v2 + 2);
  [v3 setStartTime:&v6];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  v5[0] = *MEMORY[0x1E4F1FA30];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  [v3 setLoopTimeRange:v5];
  [v3 setEnabled:0];
}

uint64_t __46__PXVideoStabilizeOperation_performProcessing__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setEnabled:1];
}

- (PXVideoStabilizeOperation)initWithSpec:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXVideoStabilizeOperation;
  return [(PXVideoProcessingOperation *)&v4 initWithSpec:a3];
}

@end