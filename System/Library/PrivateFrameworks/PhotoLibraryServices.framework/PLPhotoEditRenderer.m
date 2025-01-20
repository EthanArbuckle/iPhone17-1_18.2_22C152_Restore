@interface PLPhotoEditRenderer
+ (BOOL)currentDeviceShouldAllowLocalLight;
+ (id)compositionWithController:(id)a3 source:(id)a4;
+ (id)newImageDataFromCGImage:(CGImage *)a3 withCompressionQuality:(double)a4 metadataSourceImageURL:(id)a5 preserveRegionsInMetadata:(BOOL)a6;
+ (id)rendererForVideoURL:(id)a3 livePhotoStillURL:(id)a4 adjustmentData:(id)a5 formatIdentifier:(id)a6 formatVersion:(id)a7;
+ (void)configureNeutrinoCacheDirectoryIfNeeded;
+ (void)updateCompositionController:(id)a3 fromPortraitMetadata:(id)a4;
- (NUComposition)composition;
- (PICompositionController)compositionController;
- (PLEditSource)editSource;
- (PLPhotoEditRenderer)initWithEditSource:(id)a3;
- (PLPhotoEditRenderer)initWithEditSource:(id)a3 renderPriority:(int64_t)a4;
- (double)_smartBWLevelWithAttributeKey:(id)a3 settingKey:(id)a4;
- (double)_smartColorLevelWithAttributeKey:(id)a3 settingKey:(id)a4;
- (double)_smartToneLevelWithAttributeKey:(id)a3 settingKey:(id)a4;
- (double)displayCurrentEDRHeadroom;
- (double)displayMaximumEDRHeadroom;
- (double)smartBWBaseGrain;
- (double)smartBWBaseHue;
- (double)smartBWBaseNeutralGamma;
- (double)smartBWBaseStrength;
- (double)smartBWBaseTone;
- (double)smartColorBaseCast;
- (double)smartColorBaseContrast;
- (double)smartColorBaseSaturation;
- (double)smartToneBaseBlackPoint;
- (double)smartToneBaseBrightness;
- (double)smartToneBaseContrast;
- (double)smartToneBaseExposure;
- (double)smartToneBaseHighlights;
- (double)smartToneBaseLocalLight;
- (double)smartToneBaseShadows;
- (id)_smartBWAdjustments;
- (id)_smartColorAdjustments;
- (id)_smartToneAdjustments;
- (id)exportVideoToURL:(id)a3 preset:(id)a4 livePhotoPairingIdentifier:(id)a5 completion:(id)a6;
- (id)getGeometryForComposition:(id)a3;
- (id)getGeometryForComposition:(id)a3 pipelineFilters:(id)a4;
- (id)newExporter;
- (id)newImageExporterOptions;
- (id)newVideoExporterOptions;
- (int64_t)smartFiltersCubeSize;
- (void)applySourceChangesToComposition:(id)a3 source:(id)a4 withBlock:(id)a5 executeSynchronously:(BOOL)a6 completionBlock:(id)a7;
- (void)applySourceChangesToCompositionAsynchronously:(id)a3 source:(id)a4 withBlock:(id)a5 completionBlock:(id)a6;
- (void)applySourceChangesToCompositionSynchronously:(id)a3 source:(id)a4 withBlock:(id)a5;
- (void)calculateLongExposureFusionParametersWithCompletionHandler:(id)a3;
- (void)cancelAllRenders;
- (void)generateJPEGImageDataWithCompressionQuality:(double)a3 livePhotoPairingIdentifier:(id)a4 completionHandler:(id)a5;
- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6;
- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 name:(id)a6 completion:(id)a7;
- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 renderTime:(id *)a6 name:(id)a7 completion:(id)a8;
- (void)renderVideoWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6;
- (void)renderVideoWithTargetSize:(CGSize)a3 name:(id)a4 completion:(id)a5;
- (void)setCompositionController:(id)a3;
- (void)setDisplayCurrentEDRHeadroom:(double)a3;
- (void)setDisplayMaximumEDRHeadroom:(double)a3;
- (void)setSmartFiltersCubeSize:(int64_t)a3;
@end

@implementation PLPhotoEditRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_smartToneAutoCalculatorContext, 0);
  objc_storeStrong((id *)&self->_geometryContext, 0);
  objc_storeStrong((id *)&self->_videoRenderContext, 0);
  objc_storeStrong((id *)&self->_imageRenderContext, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->__smartBWAdjustments, 0);
  objc_storeStrong((id *)&self->_smartColorStatisticsInCachedAdjustments, 0);
  objc_storeStrong((id *)&self->__smartColorAdjustments, 0);
  objc_storeStrong((id *)&self->_smartToneStatisticsInCachedAdjustments, 0);
  objc_storeStrong((id *)&self->__smartToneAdjustments, 0);
}

- (void)setDisplayCurrentEDRHeadroom:(double)a3
{
  self->_displayCurrentEDRHeadroom = a3;
}

- (double)displayCurrentEDRHeadroom
{
  return self->_displayCurrentEDRHeadroom;
}

- (void)setDisplayMaximumEDRHeadroom:(double)a3
{
  self->_displayMaximumEDRHeadroom = a3;
}

- (double)displayMaximumEDRHeadroom
{
  return self->_displayMaximumEDRHeadroom;
}

- (int64_t)smartFiltersCubeSize
{
  return self->_smartFiltersCubeSize;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (void)cancelAllRenders
{
  [(NURenderContext *)self->_videoRenderContext cancelAllRequests];
  [(NURenderContext *)self->_geometryContext cancelAllRequests];
  [(NURenderContext *)self->_smartToneAutoCalculatorContext cancelAllRequests];
  imageRenderContext = self->_imageRenderContext;
  [(NURenderContext *)imageRenderContext cancelAllRequests];
}

- (void)applySourceChangesToComposition:(id)a3 source:(id)a4 withBlock:(id)a5 executeSynchronously:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v74 = a6;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v75 = a4;
  v77 = (void (**)(id, void *))a5;
  v79 = (void (**)(void))a7;
  v12 = (void *)[v11 copy];
  v82 = self;
  p_editSource = &self->_editSource;
  v14 = +[PLPhotoEditRenderer compositionWithController:v12 source:self->_editSource];
  v81 = [(PLPhotoEditRenderer *)v82 getGeometryForComposition:v14];
  v77[2](v77, v12);
  v80 = +[PLPhotoEditRenderer compositionWithController:v12 source:*p_editSource];

  v78 = [(PLPhotoEditRenderer *)v82 getGeometryForComposition:v80];
  v76 = +[PLCompositionHelper adjustmentConstants];
  int v15 = 0;
  if (v81 && v78)
  {
    *(_OWORD *)buf = 0u;
    long long v95 = 0u;
    [v81 extent];
    long long v92 = 0u;
    long long v93 = 0u;
    [v78 extent];
    double v16 = (double)0;
    double v17 = (double)0;
    double v18 = (double)0;
    double v19 = (double)0;
    v98.origin.CGFloat x = (double)0;
    v98.origin.CGFloat y = (double)0;
    v98.size.CGFloat width = (double)0;
    v98.size.CGFloat height = (double)0;
    v102.origin.CGFloat x = (double)0;
    v102.origin.CGFloat y = (double)0;
    v102.size.CGFloat width = (double)0;
    v102.size.CGFloat height = (double)0;
    if (CGRectEqualToRect(v98, v102))
    {
      int v15 = 0;
    }
    else
    {
      v20 = [v12 cropAdjustmentController];
      v21 = [v11 cropAdjustmentController];
      int v22 = [v20 isEqual:v21];
      [v20 cropRect];
      double v70 = v23;
      double v71 = v24;
      double v72 = v25;
      double v73 = v26;
      if (v22 && !CGRectIsEmpty(*(CGRect *)&v23) && [v20 enabled])
      {
        v99.origin.CGFloat x = (double)0 + (v70 - (double)0) / v16 * v18;
        v99.origin.CGFloat y = (double)0 + (v71 - (double)0) / v17 * v19;
        v99.size.CGFloat width = v72 / v16 * v18;
        v99.size.CGFloat height = v73 / v17 * v19;
        CGRect v100 = CGRectInset(v99, 1.0, 1.0);
        CGRect v101 = CGRectIntegral(v100);
        CGFloat x = v101.origin.x;
        CGFloat y = v101.origin.y;
        CGFloat width = v101.size.width;
        CGFloat height = v101.size.height;
        v31 = [v76 PICropAdjustmentKey];
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke;
        v91[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
        *(CGFloat *)&v91[4] = x;
        *(CGFloat *)&v91[5] = y;
        *(CGFloat *)&v91[6] = width;
        *(CGFloat *)&v91[7] = height;
        [v12 modifyAdjustmentWithKey:v31 modificationBlock:v91];
      }
      v32 = [v76 PIRedEyeAdjustmentKey];
      [v12 removeAdjustmentWithKey:v32];

      v33 = [v12 smartToneAdjustmentController];
      int v15 = [v33 enabled];
    }
  }
  v34 = [v11 portraitAdjustmentController];
  int v35 = [v34 enabled];
  v36 = [v12 portraitAdjustmentController];
  int v37 = [v36 enabled];

  v38 = [v11 portraitAdjustmentController];
  v39 = [v38 kind];
  v40 = [v12 portraitAdjustmentController];
  v41 = [v40 kind];
  char v42 = [v39 isEqualToString:v41];

  if ((v42 & 1) == 0)
  {
    if (v35 == v37)
    {
      v43 = [v12 portraitAdjustmentController];
      int v15 = [v43 enabled];
    }
    else
    {
      int v15 = 1;
    }
  }
  uint64_t v44 = [v11 autoLoopAdjustmentController];
  uint64_t v45 = [v12 autoLoopAdjustmentController];
  if (v44 | v45 && ([(id)v44 isEqual:v45] & 1) == 0)
  {
    id v54 = [(id)v45 flavor];
    *(void *)&long long v92 = 0;
    *((void *)&v92 + 1) = &v92;
    *(void *)&long long v93 = 0x2020000000;
    v55 = (uint64_t (*)(id))getPIAutoLoopFlavorFromStringSymbolLoc_ptr;
    *((void *)&v93 + 1) = getPIAutoLoopFlavorFromStringSymbolLoc_ptr;
    if (!getPIAutoLoopFlavorFromStringSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&long long v95 = __getPIAutoLoopFlavorFromStringSymbolLoc_block_invoke;
      *((void *)&v95 + 1) = &unk_1E5875840;
      v96 = &v92;
      v56 = PhotoImagingLibrary_30976();
      v57 = dlsym(v56, "PIAutoLoopFlavorFromString");
      *(void *)(*((void *)v96 + 1) + 24) = v57;
      getPIAutoLoopFlavorFromStringSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v96 + 1) + 24);
      v55 = *(uint64_t (**)(id))(*((void *)&v92 + 1) + 24);
    }
    _Block_object_dispose(&v92, 8);
    if (v55)
    {
      uint64_t v58 = v55(v54);

      *(void *)&long long v92 = 0;
      *((void *)&v92 + 1) = &v92;
      *(void *)&long long v93 = 0x2020000000;
      v59 = (uint64_t (*)(uint64_t))getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr;
      *((void *)&v93 + 1) = getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr;
      if (!getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&long long v95 = __getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_block_invoke;
        *((void *)&v95 + 1) = &unk_1E5875840;
        v96 = &v92;
        v60 = PhotoImagingLibrary_30976();
        v61 = dlsym(v60, "PIAutoLoopFlavorProducesOnlyVideo");
        *(void *)(*((void *)v96 + 1) + 24) = v61;
        getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v96 + 1) + 24);
        v59 = *(uint64_t (**)(uint64_t))(*((void *)&v92 + 1) + 24);
      }
      _Block_object_dispose(&v92, 8);
      if (v59)
      {
        if (v59(v58))
        {
          if ((v15 & 1) == 0) {
            goto LABEL_34;
          }
        }
        else
        {
          v62 = [v12 smartToneAdjustmentController];
          int v63 = [v62 enabled];

          if (((v63 | v15) & 1) == 0) {
            goto LABEL_34;
          }
        }
LABEL_17:
        [(NURenderContext *)v82->_smartToneAutoCalculatorContext cancelAllRequests];
        *(void *)&long long v92 = 0;
        *((void *)&v92 + 1) = &v92;
        *(void *)&long long v93 = 0x2050000000;
        v46 = (void *)getPISmartToneAutoCalculatorClass_softClass;
        *((void *)&v93 + 1) = getPISmartToneAutoCalculatorClass_softClass;
        if (!getPISmartToneAutoCalculatorClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&long long v95 = __getPISmartToneAutoCalculatorClass_block_invoke;
          *((void *)&v95 + 1) = &unk_1E5875840;
          v96 = &v92;
          __getPISmartToneAutoCalculatorClass_block_invoke((uint64_t)buf);
          v46 = *(void **)(*((void *)&v92 + 1) + 24);
        }
        v47 = v46;
        _Block_object_dispose(&v92, 8);
        v48 = (void *)[[v47 alloc] initWithComposition:v80];
        [v48 setName:@"PL-PISmartToneAutoCalculator"];
        [v48 setRenderContext:v82->_smartToneAutoCalculatorContext];
        if (!v74)
        {
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_105;
          v83[3] = &unk_1E58684D0;
          id v84 = v12;
          id v85 = v76;
          id v86 = v11;
          v87 = v79;
          [v48 submit:v83];

          v51 = v84;
LABEL_37:

          goto LABEL_38;
        }
        id v90 = 0;
        v49 = [v48 submitSynchronous:&v90];
        id v50 = v90;
        v51 = v50;
        if (v49)
        {
          v52 = [v76 PISmartToneAdjustmentKey];
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2;
          v88[3] = &unk_1E58684A8;
          v89 = v49;
          [v12 modifyAdjustmentWithKey:v52 modificationBlock:v88];

          [v11 applyChangesFromCompositionController:v12];
          v53 = v89;
        }
        else
        {
          v64 = [v50 domain];
          if ([v64 isEqualToString:@"NUError"])
          {
            BOOL v65 = [v51 code] == 10;

            if (v65) {
              goto LABEL_23;
            }
          }
          else
          {
          }
          v53 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v51;
            _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
          }
        }

LABEL_23:
        if (v79) {
          v79[2]();
        }

        goto LABEL_37;
      }
      v68 = [MEMORY[0x1E4F28B00] currentHandler];
      v69 = [NSString stringWithUTF8String:"BOOL SOFT_LINKED_PIAutoLoopFlavorProducesOnlyVideo(PIAutoLoopFlavor)"];
      objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, @"PLPhotoEditRenderer.m", 86, @"%s", dlerror());
    }
    else
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      v67 = [NSString stringWithUTF8String:"PIAutoLoopFlavor SOFT_LINKED_PIAutoLoopFlavorFromString(NSString *__strong)"];
      objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, @"PLPhotoEditRenderer.m", 85, @"%s", dlerror());
    }
    __break(1u);
  }
  if (v15) {
    goto LABEL_17;
  }
LABEL_34:
  [v11 applyChangesFromCompositionController:v12];
  if (v79) {
    v79[2]();
  }
LABEL_38:
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStatistics:*(void *)(a1 + 32)];
}

void __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_105(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  v3 = [a2 result:&v18];
  id v4 = v18;
  v5 = v4;
  if (v3)
  {
    id v6 = a1[4];
    v7 = [a1[5] PISmartToneAdjustmentKey];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2_106;
    v16[3] = &unk_1E58684A8;
    id v17 = v3;
    [v6 modifyAdjustmentWithKey:v7 modificationBlock:v16];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_3;
    block[3] = &unk_1E5874868;
    id v13 = a1[6];
    id v14 = a1[4];
    id v15 = a1[7];
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_12;
  }
  v8 = [v4 domain];
  if (![v8 isEqualToString:@"NUError"])
  {

    goto LABEL_7;
  }
  uint64_t v9 = [v5 code];

  if (v9 != 10)
  {
LABEL_7:
    v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
    }
  }
  id v11 = (void (**)(void))a1[7];
  if (v11) {
    v11[2]();
  }
LABEL_12:
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2_106(uint64_t a1, void *a2)
{
  return [a2 setStatistics:*(void *)(a1 + 32)];
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) applyChangesFromCompositionController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)applySourceChangesToCompositionAsynchronously:(id)a3 source:(id)a4 withBlock:(id)a5 completionBlock:(id)a6
{
}

- (void)applySourceChangesToCompositionSynchronously:(id)a3 source:(id)a4 withBlock:(id)a5
{
}

- (id)getGeometryForComposition:(id)a3 pipelineFilters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [getPIPhotoEditHelperClass_31007() geometryRequestWithComposition:v7];

  [v8 setPipelineFilters:v6];
  [v8 setRenderContext:self->_geometryContext];
  [v8 setName:@"PLPhotoEditRenderer-geometry"];
  uint64_t v12 = 0;
  uint64_t v9 = [v8 submitSynchronous:&v12];
  v10 = [v9 geometry];

  return v10;
}

- (id)getGeometryForComposition:(id)a3
{
  id v4 = a3;
  v5 = [getPIPhotoEditHelperClass_31007() pipelineFiltersForOriginalGeometry];
  id v6 = [(PLPhotoEditRenderer *)self getGeometryForComposition:v4 pipelineFilters:v5];

  return v6;
}

- (void)calculateLongExposureFusionParametersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v5 = (void *)getPILongExposureFusionAutoCalculatorClass_softClass;
  uint64_t v17 = getPILongExposureFusionAutoCalculatorClass_softClass;
  if (!getPILongExposureFusionAutoCalculatorClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getPILongExposureFusionAutoCalculatorClass_block_invoke;
    v13[3] = &unk_1E5875840;
    v13[4] = &v14;
    __getPILongExposureFusionAutoCalculatorClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  id v7 = [v6 alloc];
  v8 = [(PLPhotoEditRenderer *)self composition];
  uint64_t v9 = (void *)[v7 initWithComposition:v8];

  [v9 setName:@"PL-PILongExposureFusionAutoCalculator"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PLPhotoEditRenderer_calculateLongExposureFusionParametersWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E58683E8;
  id v12 = v4;
  id v10 = v4;
  [v9 submit:v11];
}

void __82__PLPhotoEditRenderer_calculateLongExposureFusionParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = 0;
  v3 = [a2 result:&v5];
  id v4 = v5;
  (*(void (**)(void, BOOL, void *, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 != 0, v3, v4);
}

- (id)_smartBWAdjustments
{
  v3 = [(PLPhotoEditRenderer *)self compositionController];
  id v4 = [v3 smartBWAdjustmentController];

  [v4 hue];
  double v6 = v5;
  if (v5 != self->_smartBWLevelInCachedAdjustments)
  {
    smartBWAdjustments = self->__smartBWAdjustments;
    self->__smartBWAdjustments = 0;
  }
  v8 = self->__smartBWAdjustments;
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1E050] emptyImage];
    id v10 = [v9 smartBlackAndWhiteAdjustmentsForValue:0 andStatistics:v6];
    id v11 = self->__smartBWAdjustments;
    self->__smartBWAdjustments = v10;

    self->_smartBWLevelInCachedAdjustments = v6;
    v8 = self->__smartBWAdjustments;
  }
  id v12 = v8;

  return v12;
}

- (id)_smartColorAdjustments
{
  v3 = [(PLPhotoEditRenderer *)self compositionController];
  id v4 = [v3 smartColorAdjustmentController];

  [v4 inputColor];
  double v6 = v5;
  id v7 = [v4 statistics];
  v8 = v7;
  if (v6 != self->_smartColorLevelInCachedAdjustments || v7 != self->_smartColorStatisticsInCachedAdjustments)
  {
    smartColorAdjustments = self->__smartColorAdjustments;
    self->__smartColorAdjustments = 0;
  }
  id v10 = self->__smartColorAdjustments;
  if (!v10 && v8)
  {
    id v11 = [MEMORY[0x1E4F1E050] smartColorAdjustmentsForValue:v8 andStatistics:v6];
    id v12 = self->__smartColorAdjustments;
    self->__smartColorAdjustments = v11;

    self->_smartColorLevelInCachedAdjustments = v6;
    objc_storeStrong((id *)&self->_smartColorStatisticsInCachedAdjustments, v8);
    id v10 = self->__smartColorAdjustments;
  }
  id v13 = v10;

  return v13;
}

- (id)_smartToneAdjustments
{
  v3 = [(PLPhotoEditRenderer *)self compositionController];
  id v4 = [v3 smartToneAdjustmentController];

  [v4 inputLight];
  double v6 = v5;
  id v7 = [v4 statistics];
  v8 = v7;
  if (v6 != self->_smartToneLevelInCachedAdjustments || v7 != self->_smartToneStatisticsInCachedAdjustments)
  {
    smartToneAdjustments = self->__smartToneAdjustments;
    self->__smartToneAdjustments = 0;
  }
  id v10 = self->__smartToneAdjustments;
  if (!v10 && v8)
  {
    id v11 = [(NSDictionary *)v8 objectForKeyedSubscript:@"localAutoValue"];
    [v11 doubleValue];
    id v13 = [MEMORY[0x1E4F1E050] smartToneAdjustmentsForValue:v8 localLightAutoValue:v6 andStatistics:v12];
    uint64_t v14 = self->__smartToneAdjustments;
    self->__smartToneAdjustments = v13;
    id v15 = v13;

    self->_smartToneLevelInCachedAdjustments = v6;
    objc_storeStrong((id *)&self->_smartToneStatisticsInCachedAdjustments, v8);

    id v10 = self->__smartToneAdjustments;
  }
  uint64_t v16 = v10;

  return v16;
}

- (double)smartBWBaseGrain
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartBWAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  double v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeGrainKey];
  v8 = [v6 grainKey];
  [(PLPhotoEditRenderer *)self _smartBWLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartBWBaseHue
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartBWAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  double v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeHueKey];
  v8 = [v6 hueKey];
  [(PLPhotoEditRenderer *)self _smartBWLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartBWBaseTone
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartBWAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  double v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeToneKey];
  v8 = [v6 toneKey];
  [(PLPhotoEditRenderer *)self _smartBWLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartBWBaseNeutralGamma
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartBWAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  double v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeNeutralGammaKey];
  v8 = [v6 neutralKey];
  [(PLPhotoEditRenderer *)self _smartBWLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartBWBaseStrength
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartBWAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  double v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeStrengthKey];
  v8 = [v6 strengthKey];
  [(PLPhotoEditRenderer *)self _smartBWLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)_smartBWLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoEditRenderer *)self _smartBWAdjustments];
  double v9 = +[PLCompositionHelper adjustmentConstants];
  double v10 = [v9 PISmartBWAdjustmentKey];

  if (v8) {
    [v8 objectForKey:v6];
  }
  else {
  id v11 = +[PLCompositionHelper defaultValueForAdjustmentKey:v10 settingKey:v7];
  }
  [v11 doubleValue];
  double v13 = v12;

  return v13;
}

- (double)smartColorBaseCast
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartColorAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeCastKey];
  v8 = [v6 offsetCastKey];
  [(PLPhotoEditRenderer *)self _smartColorLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartColorBaseSaturation
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartColorAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeVibrancyKey];
  v8 = [v6 offsetSaturationKey];
  [(PLPhotoEditRenderer *)self _smartColorLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartColorBaseContrast
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartColorAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeContrastKey];
  v8 = [v6 offsetContrastKey];
  [(PLPhotoEditRenderer *)self _smartColorLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)_smartColorLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoEditRenderer *)self _smartColorAdjustments];
  double v9 = +[PLCompositionHelper adjustmentConstants];
  double v10 = [v9 PISmartColorAdjustmentKey];

  if (v8) {
    [v8 objectForKey:v6];
  }
  else {
  id v11 = +[PLCompositionHelper defaultValueForAdjustmentKey:v10 settingKey:v7];
  }
  [v11 doubleValue];
  double v13 = v12;

  return v13;
}

- (double)smartToneBaseLocalLight
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeLocalLightKey];
  v8 = [v6 offsetLocalLightKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseBlackPoint
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeBlackPointKey];
  v8 = [v6 offsetBlackKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseShadows
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeShadowsKey];
  v8 = [v6 offsetShadowsKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseHighlights
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeHighlightsKey];
  v8 = [v6 offsetHighlightsKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseExposure
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeExposureKey];
  v8 = [v6 offsetExposureKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseContrast
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeBrightnessKey];
  v8 = [v6 offsetBrightnessKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)smartToneBaseBrightness
{
  v3 = +[PLCompositionHelper adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];

  double v5 = [(PLPhotoEditRenderer *)self compositionController];
  id v6 = (void *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];

  id v7 = [v6 attributeBrightnessKey];
  v8 = [v6 offsetBrightnessKey];
  [(PLPhotoEditRenderer *)self _smartToneLevelWithAttributeKey:v7 settingKey:v8];
  double v10 = v9;

  return v10;
}

- (double)_smartToneLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoEditRenderer *)self _smartToneAdjustments];
  double v9 = +[PLCompositionHelper adjustmentConstants];
  double v10 = [v9 PISmartToneAdjustmentKey];

  if (v8) {
    [v8 objectForKey:v6];
  }
  else {
  id v11 = +[PLCompositionHelper defaultValueForAdjustmentKey:v10 settingKey:v7];
  }
  [v11 doubleValue];
  double v13 = v12;

  return v13;
}

- (void)setSmartFiltersCubeSize:(int64_t)a3
{
  if (self->_smartFiltersCubeSize != a3) {
    self->_smartFiltersCubeSize = a3;
  }
}

- (void)setCompositionController:(id)a3
{
  double v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    smartToneAdjustments = self->__smartToneAdjustments;
    self->__smartToneAdjustments = 0;

    smartColorAdjustments = self->__smartColorAdjustments;
    self->__smartColorAdjustments = 0;

    smartBWAdjustments = self->__smartBWAdjustments;
    self->__smartBWAdjustments = 0;

    double v5 = v9;
  }
}

- (void)generateJPEGImageDataWithCompressionQuality:(double)a3 livePhotoPairingIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(PLPhotoEditRenderer *)self newExporter];
  id v11 = [(PLPhotoEditRenderer *)self newImageExporterOptions];
  [v11 setPairingIdentifier:v9];

  [v11 setJPEGCompressionQuality:a3];
  double v12 = [(PLPhotoEditRenderer *)self composition];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__PLPhotoEditRenderer_generateJPEGImageDataWithCompressionQuality_livePhotoPairingIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E58683E8;
  id v15 = v8;
  id v13 = v8;
  [v10 exportImageToDataWithComposition:v12 options:v11 completion:v14];
}

void __112__PLPhotoEditRenderer_generateJPEGImageDataWithCompressionQuality_livePhotoPairingIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = 0;
  v3 = [a2 result:&v14];
  id v4 = v14;
  if (v3)
  {
    double v5 = [v3 geometry];
    uint64_t v6 = [v5 size];
    uint64_t v8 = v7;

    uint64_t v9 = [v3 inputSize];
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v3 data];
    (*(void (**)(uint64_t, void *, double, double, double, double))(v12 + 16))(v12, v13, (double)v9, (double)v11, (double)v6, (double)v8);
  }
  else
  {
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

- (void)renderVideoWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (__CFString *)a5;
  id v13 = a6;
  if (!self->_editSource)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PLPhotoEditRenderer.m" lineNumber:474 description:@"editSource cannot be nil while rendering"];
  }
  id v14 = [(PLPhotoEditRenderer *)self compositionController];

  if (!v14)
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PLPhotoEditRenderer.m" lineNumber:475 description:@"compositionController cannot be nil while rendering"];
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Target size not specified";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v16 = [v18 errorWithDomain:v19 code:41003 userInfo:v20];

    (*((void (**)(id, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, v16);
    goto LABEL_19;
  }
  uint64_t v16 = [(PLPhotoEditRenderer *)self composition];
  if (a4 == 1)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PLPhotoEditRenderer.m" lineNumber:494 description:@"PLPhotoEditContentModeAspectFill is not supported for this path"];

    goto LABEL_14;
  }
  if (a4)
  {
LABEL_14:
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = objc_msgSend(getPIPhotoEditHelperClass_31007(), "videoRenderRequestWithComposition:fitInSize:", v16, width, height);
LABEL_15:
  [v17 setRenderContext:self->_videoRenderContext];
  [v17 setPriority:self->_priority];
  if ([(__CFString *)v12 length]) {
    int v22 = v12;
  }
  else {
    int v22 = @"PLPhotoEditRenderer-renderVideoWithTargetSize";
  }
  [v17 setName:v22];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__PLPhotoEditRenderer_renderVideoWithTargetSize_contentMode_name_completion___block_invoke;
  v25[3] = &unk_1E58683E8;
  id v26 = v13;
  [v17 submit:v25];

LABEL_19:
}

void __77__PLPhotoEditRenderer_renderVideoWithTargetSize_contentMode_name_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  v3 = [a2 result:&v12];
  id v4 = v12;
  if (v3)
  {
    double v5 = [v3 video];
    uint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = [v3 videoComposition];
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = [v3 audioMix];
    uint64_t v10 = (void *)[v9 copy];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Rendering error in -[PLPhotoEditRenderer renderVideoWithTargetSize:]: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)renderVideoWithTargetSize:(CGSize)a3 name:(id)a4 completion:(id)a5
{
}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 renderTime:(id *)a6 name:(id)a7 completion:(id)a8
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v16 = (__CFString *)a7;
  id v17 = a8;
  if (!self->_editSource)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PLPhotoEditRenderer.m" lineNumber:405 description:@"editSource cannot be nil while rendering"];
  }
  id v18 = [(PLPhotoEditRenderer *)self compositionController];

  if (!v18)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PLPhotoEditRenderer.m" lineNumber:406 description:@"compositionController cannot be nil while rendering"];
  }
  uint64_t v19 = [(PLPhotoEditRenderer *)self composition];
  if (a4 == 1)
  {
    v20 = objc_msgSend(getPIPhotoEditHelperClass_31007(), "imageRenderRequestWithComposition:fillInSize:wideGamut:", v19, 1, width, height);
    uint64_t v21 = @"PLPhotoEditRenderer-fill";
    goto LABEL_9;
  }
  if (!a4)
  {
    v20 = objc_msgSend(getPIPhotoEditHelperClass_31007(), "imageRenderRequestWithComposition:fitInSize:wideGamut:", v19, 1, width, height);
    uint64_t v21 = @"PLPhotoEditRenderer-fit";
LABEL_9:
    if ([(__CFString *)v16 length]) {
      int v22 = v16;
    }
    else {
      int v22 = v21;
    }
    [v20 setName:v22];
    goto LABEL_14;
  }
  v20 = 0;
LABEL_14:
  if (a5 == 1)
  {
    double v23 = [getPIPhotoEditHelperClass_31007() pipelineFiltersForCropping];
    [v20 setPipelineFilters:v23];
  }
  [v20 setRenderContext:self->_imageRenderContext];
  long long v29 = *(_OWORD *)&a6->var0;
  int64_t var3 = a6->var3;
  [v20 setTime:&v29];
  [v20 setPriority:self->_priority];
  [(PLPhotoEditRenderer *)self displayMaximumEDRHeadroom];
  objc_msgSend(v20, "setMaxEDRHeadroom:");
  [(PLPhotoEditRenderer *)self displayCurrentEDRHeadroom];
  objc_msgSend(v20, "setCurrentEDRHeadroom:");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_renderMode_renderTime_name_completion___block_invoke;
  v27[3] = &unk_1E58683E8;
  id v28 = v17;
  id v24 = v17;
  [v20 submit:v27];
}

void __99__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_renderMode_renderTime_name_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v3 = [a2 result:&v13];
  id v4 = v13;
  if (v3)
  {
    id PIPhotoEditHelperClass_31007 = getPIPhotoEditHelperClass_31007();
    uint64_t v6 = [v3 buffer];
    uint64_t v7 = (CGImage *)[PIPhotoEditHelperClass_31007 newCGImageFromImageBuffer:v6];

    *(_OWORD *)buf = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v3 geometry];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 extent];
    }
    else
    {
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, CGImage *, void, double, double, double, double))(v12 + 16))(v12, v7, 0, (double)*(uint64_t *)buf, (double)*(uint64_t *)&buf[8], (double)(uint64_t)v15, (double)*((uint64_t *)&v15 + 1));
    }
    CGImageRelease(v7);
  }
  else
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Rendering error in -[PLPhotoEditRenderer renderImageWithTargetSize:]: %@", buf, 0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void, id, double, double, double, double))(v11 + 16))(v11, 0, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 name:(id)a6 completion:(id)a7
{
  long long v7 = *MEMORY[0x1E4F1F9F8];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  -[PLPhotoEditRenderer renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:](self, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", a4, a5, &v7, a6, a7, a3.width, a3.height);
}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_name_completion___block_invoke;
  v13[3] = &unk_1E5868410;
  id v14 = v11;
  id v12 = v11;
  -[PLPhotoEditRenderer renderImageWithTargetSize:contentMode:renderMode:name:completion:](self, "renderImageWithTargetSize:contentMode:renderMode:name:completion:", a4, 0, a5, v13, width, height);
}

uint64_t __77__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_name_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NUComposition)composition
{
  v3 = [(PLPhotoEditRenderer *)self compositionController];
  id v4 = +[PLPhotoEditRenderer compositionWithController:v3 source:self->_editSource];

  return (NUComposition *)v4;
}

- (id)exportVideoToURL:(id)a3 preset:(id)a4 livePhotoPairingIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(PLPhotoEditRenderer *)self newExporter];
  id v13 = [(PLPhotoEditRenderer *)self newVideoExporterOptions];
  [v13 setPairingIdentifier:v10];

  id v14 = [(PLPhotoEditRenderer *)self composition];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PLPhotoEditRenderer_exportVideoToURL_preset_livePhotoPairingIdentifier_completion___block_invoke;
  v18[3] = &unk_1E58683E8;
  id v19 = v9;
  id v15 = v9;
  uint64_t v16 = [v12 exportVideoToURL:v11 composition:v14 options:v13 completion:v18];

  return v16;
}

void __85__PLPhotoEditRenderer_exportVideoToURL_preset_livePhotoPairingIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v11 = 0;
  v3 = [a2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    long long v7 = [v3 geometry];
    uint64_t v8 = [v7 size];
    uint64_t v10 = v9;

    v5.n128_f64[0] = (double)v8;
    v6.n128_f64[0] = (double)v10;
  }
  else
  {
    v5.n128_u64[0] = *MEMORY[0x1E4F1DB30];
    v6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  (*(void (**)(__n128, __n128))(*(void *)(a1 + 32) + 16))(v5, v6);
}

- (id)newVideoExporterOptions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getPICompositionExporterVideoOptionsClass_softClass;
  uint64_t v11 = getPICompositionExporterVideoOptionsClass_softClass;
  if (!getPICompositionExporterVideoOptionsClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPICompositionExporterVideoOptionsClass_block_invoke;
    v7[3] = &unk_1E5875840;
    v7[4] = &v8;
    __getPICompositionExporterVideoOptionsClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = objc_alloc_init(v4);
  [v5 setPriority:self->_priority];
  return v5;
}

- (id)newImageExporterOptions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getPICompositionExporterImageOptionsClass_softClass;
  uint64_t v11 = getPICompositionExporterImageOptionsClass_softClass;
  if (!getPICompositionExporterImageOptionsClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPICompositionExporterImageOptionsClass_block_invoke;
    v7[3] = &unk_1E5875840;
    v7[4] = &v8;
    __getPICompositionExporterImageOptionsClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = objc_alloc_init(v4);
  [v5 setPriority:self->_priority];
  return v5;
}

- (id)newExporter
{
  PICompositionExporterClass = (objc_class *)getPICompositionExporterClass();
  return objc_alloc_init(PICompositionExporterClass);
}

- (PLPhotoEditRenderer)initWithEditSource:(id)a3 renderPriority:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLPhotoEditRenderer.m", 207, @"Invalid parameter not satisfying: %@", @"editSource" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)PLPhotoEditRenderer;
  uint64_t v9 = [(PLPhotoEditRenderer *)&v25 init];
  [(id)objc_opt_class() configureNeutrinoCacheDirectoryIfNeeded];
  objc_storeStrong((id *)&v9->_editSource, a3);
  uint64_t v10 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  imageRenderContext = v9->_imageRenderContext;
  v9->_imageRenderContext = v10;

  id v12 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  videoRenderContext = v9->_videoRenderContext;
  v9->_videoRenderContext = v12;

  id v14 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  geometryContext = v9->_geometryContext;
  v9->_geometryContext = v14;

  uint64_t v16 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  smartToneAutoCalculatorContext = v9->_smartToneAutoCalculatorContext;
  v9->_smartToneAutoCalculatorContext = v16;

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v18 = (void *)getNUPriorityClass_softClass;
  uint64_t v30 = getNUPriorityClass_softClass;
  if (!getNUPriorityClass_softClass)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __getNUPriorityClass_block_invoke;
    v26[3] = &unk_1E5875840;
    v26[4] = &v27;
    __getNUPriorityClass_block_invoke((uint64_t)v26);
    id v18 = (void *)v28[3];
  }
  if ((unint64_t)a4 <= 3) {
    int64_t v19 = 3 - a4;
  }
  else {
    int64_t v19 = 0;
  }
  v20 = v18;
  _Block_object_dispose(&v27, 8);
  uint64_t v21 = [[v20 alloc] initWithLevel:v19];
  prioritCGFloat y = v9->_priority;
  v9->_prioritCGFloat y = (NUPriority *)v21;

  return v9;
}

- (PLPhotoEditRenderer)initWithEditSource:(id)a3
{
  return [(PLPhotoEditRenderer *)self initWithEditSource:a3 renderPriority:1];
}

+ (void)updateCompositionController:(id)a3 fromPortraitMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2050000000;
  long long v7 = (void *)getPIPortraitAutoCalculatorClass_softClass;
  uint64_t v24 = getPIPortraitAutoCalculatorClass_softClass;
  if (!getPIPortraitAutoCalculatorClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getPIPortraitAutoCalculatorClass_block_invoke;
    v20[3] = &unk_1E5875840;
    v20[4] = &v21;
    __getPIPortraitAutoCalculatorClass_block_invoke((uint64_t)v20);
    long long v7 = (void *)v22[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v21, 8);
  uint64_t v9 = [v8 portraitInfoDictionaryFromCameraMetadata:v6];
  uint64_t v10 = +[PLCompositionHelper adjustmentConstants];
  uint64_t v11 = [v10 PIDepthAdjustmentKey];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke;
  v18[3] = &unk_1E5868438;
  id v12 = v9;
  id v19 = v12;
  [v5 modifyAdjustmentWithKey:v11 modificationBlock:v18];

  id v13 = +[PLCompositionHelper adjustmentConstants];
  id v14 = [v13 PIPortraitAdjustmentKey];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke_2;
  v16[3] = &unk_1E5868460;
  id v17 = v12;
  id v15 = v12;
  [v5 modifyAdjustmentWithKey:v14 modificationBlock:v16];
}

void __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v5 = (void *)getPIDepthInfoKeySymbolLoc_ptr;
  uint64_t v30 = getPIDepthInfoKeySymbolLoc_ptr;
  if (!getPIDepthInfoKeySymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    objc_super v25 = __getPIDepthInfoKeySymbolLoc_block_invoke;
    id v26 = &unk_1E5875840;
    id v6 = PhotoImagingLibrary_30976();
    v28[3] = (uint64_t)dlsym(v6, "PIDepthInfoKey");
    getPIDepthInfoKeySymbolLoc_ptr = v28[3];
    id v5 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v5)
  {
    long long v7 = [v4 objectForKeyedSubscript:*v5];
    [v3 setDepthInfo:v7];

    id v8 = *(void **)(a1 + 32);
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v9 = (void *)getPIDepthApertureKeySymbolLoc_ptr;
    uint64_t v30 = getPIDepthApertureKeySymbolLoc_ptr;
    if (!getPIDepthApertureKeySymbolLoc_ptr)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      objc_super v25 = __getPIDepthApertureKeySymbolLoc_block_invoke;
      id v26 = &unk_1E5875840;
      uint64_t v10 = PhotoImagingLibrary_30976();
      v28[3] = (uint64_t)dlsym(v10, "PIDepthApertureKey");
      getPIDepthApertureKeySymbolLoc_ptr = v28[3];
      uint64_t v9 = (void *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (v9)
    {
      uint64_t v11 = [v8 objectForKeyedSubscript:*v9];
      [v11 floatValue];
      [v3 setAperture:v12];

      id v13 = *(void **)(a1 + 32);
      uint64_t v27 = 0;
      id v28 = &v27;
      uint64_t v29 = 0x2020000000;
      id v14 = (void *)getPIDepthFocusRectKeySymbolLoc_ptr;
      uint64_t v30 = getPIDepthFocusRectKeySymbolLoc_ptr;
      if (!getPIDepthFocusRectKeySymbolLoc_ptr)
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        objc_super v25 = __getPIDepthFocusRectKeySymbolLoc_block_invoke;
        id v26 = &unk_1E5875840;
        id v15 = PhotoImagingLibrary_30976();
        v28[3] = (uint64_t)dlsym(v15, "PIDepthFocusRectKey");
        getPIDepthFocusRectKeySymbolLoc_ptr = v28[3];
        id v14 = (void *)v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (v14)
      {
        uint64_t v16 = [v13 objectForKeyedSubscript:*v14];
        [v3 setFocusRect:v16];

        id v17 = *(void **)(a1 + 32);
        uint64_t v27 = 0;
        id v28 = &v27;
        uint64_t v29 = 0x2020000000;
        id v18 = (void *)getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr;
        uint64_t v30 = getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr;
        if (!getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr)
        {
          uint64_t v23 = MEMORY[0x1E4F143A8];
          uint64_t v24 = 3221225472;
          objc_super v25 = __getPIDepthGlassesMatteAllowedKeySymbolLoc_block_invoke;
          id v26 = &unk_1E5875840;
          id v19 = PhotoImagingLibrary_30976();
          v28[3] = (uint64_t)dlsym(v19, "PIDepthGlassesMatteAllowedKey");
          getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr = v28[3];
          id v18 = (void *)v28[3];
        }
        _Block_object_dispose(&v27, 8);
        if (v18)
        {
          v20 = [v17 objectForKeyedSubscript:*v18];
          [v3 setGlassesMatteAllowed:v20];

          return;
        }
        uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
        int v22 = [NSString stringWithUTF8String:"NSString *getPIDepthGlassesMatteAllowedKey(void)"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PLPhotoEditRenderer.m", 101, @"%s", dlerror(), v23, v24, v25, v26);
      }
      else
      {
        uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
        int v22 = [NSString stringWithUTF8String:"NSString *getPIDepthFocusRectKey(void)"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PLPhotoEditRenderer.m", 94, @"%s", dlerror(), v23, v24, v25, v26);
      }
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      int v22 = [NSString stringWithUTF8String:"NSString *getPIDepthApertureKey(void)"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PLPhotoEditRenderer.m", 92, @"%s", dlerror(), v23, v24, v25, v26);
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int v22 = [NSString stringWithUTF8String:"NSString *getPIDepthInfoKey(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PLPhotoEditRenderer.m", 90, @"%s", dlerror(), v23, v24, v25, v26);
  }

  __break(1u);
}

void __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  id v5 = (void *)getPIPortraitInfoKeySymbolLoc_ptr;
  uint64_t v26 = getPIPortraitInfoKeySymbolLoc_ptr;
  if (!getPIPortraitInfoKeySymbolLoc_ptr)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __getPIPortraitInfoKeySymbolLoc_block_invoke;
    int v22 = &unk_1E5875840;
    id v6 = PhotoImagingLibrary_30976();
    v24[3] = (uint64_t)dlsym(v6, "PIPortraitInfoKey");
    getPIPortraitInfoKeySymbolLoc_ptr = v24[3];
    id v5 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (v5)
  {
    long long v7 = [v4 objectForKeyedSubscript:*v5];
    [v3 setPortraitInfo:v7];

    id v8 = *(void **)(a1 + 32);
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v9 = (void *)getPIPortraitStrengthKeySymbolLoc_ptr;
    uint64_t v26 = getPIPortraitStrengthKeySymbolLoc_ptr;
    if (!getPIPortraitStrengthKeySymbolLoc_ptr)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __getPIPortraitStrengthKeySymbolLoc_block_invoke;
      int v22 = &unk_1E5875840;
      uint64_t v10 = PhotoImagingLibrary_30976();
      v24[3] = (uint64_t)dlsym(v10, "PIPortraitStrengthKey");
      getPIPortraitStrengthKeySymbolLoc_ptr = v24[3];
      uint64_t v9 = (void *)v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (v9)
    {
      uint64_t v11 = [v8 objectForKeyedSubscript:*v9];
      [v11 floatValue];
      [v3 setStrength:v12];

      id v13 = *(void **)(a1 + 32);
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2020000000;
      id v14 = (void *)getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr;
      uint64_t v26 = getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr;
      if (!getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr)
      {
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        uint64_t v21 = __getPIPortraitSpillMatteAllowedKeySymbolLoc_block_invoke;
        int v22 = &unk_1E5875840;
        id v15 = PhotoImagingLibrary_30976();
        v24[3] = (uint64_t)dlsym(v15, "PIPortraitSpillMatteAllowedKey");
        getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr = v24[3];
        id v14 = (void *)v24[3];
      }
      _Block_object_dispose(&v23, 8);
      if (v14)
      {
        uint64_t v16 = [v13 objectForKeyedSubscript:*v14];
        [v3 setSpillMatteAllowed:v16];

        return;
      }
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      id v18 = [NSString stringWithUTF8String:"NSString *getPIPortraitSpillMatteAllowedKey(void)"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PLPhotoEditRenderer.m", 103, @"%s", dlerror(), v19, v20, v21, v22);
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      id v18 = [NSString stringWithUTF8String:"NSString *getPIPortraitStrengthKey(void)"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PLPhotoEditRenderer.m", 98, @"%s", dlerror(), v19, v20, v21, v22);
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = [NSString stringWithUTF8String:"NSString *getPIPortraitInfoKey(void)"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PLPhotoEditRenderer.m", 96, @"%s", dlerror(), v19, v20, v21, v22);
  }

  __break(1u);
}

+ (BOOL)currentDeviceShouldAllowLocalLight
{
  if (currentDeviceShouldAllowLocalLight_onceToken != -1) {
    dispatch_once(&currentDeviceShouldAllowLocalLight_onceToken, &__block_literal_global_88);
  }
  return currentDeviceShouldAllowLocalLight_supportsLocalLight;
}

void __57__PLPhotoEditRenderer_currentDeviceShouldAllowLocalLight__block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  id v8 = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke;
    v4[3] = &unk_1E5875840;
    v4[4] = &v5;
    __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke(v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v1 = v0();
    currentDeviceShouldAllowLocalLight_supportsLocalLight = [v1 supportsFeatureSet:1];
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"id SOFT_LINKED_MTLCreateSystemDefaultDevice(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLPhotoEditRenderer.m", 32, @"%s", dlerror());

    __break(1u);
  }
}

+ (id)newImageDataFromCGImage:(CGImage *)a3 withCompressionQuality:(double)a4 metadataSourceImageURL:(id)a5 preserveRegionsInMetadata:(BOOL)a6
{
  BOOL v6 = a6;
  v23[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v9 = (const __CFURL *)a5;
  uint64_t v10 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v11 = [(id)*MEMORY[0x1E4F44410] identifier];
  float v12 = CGImageDestinationCreateWithData(v10, v11, 1uLL, 0);

  if (v12)
  {
    if (v9 && (id v13 = CGImageSourceCreateWithURL(v9, 0)) != 0)
    {
      id v14 = v13;
      CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      CFRelease(v14);
    }
    else
    {
      CFDictionaryRef v15 = 0;
    }
    uint64_t v22 = *MEMORY[0x1E4F2F430];
    uint64_t v16 = [NSNumber numberWithDouble:a4];
    v23[0] = v16;
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    CGImageDestinationSetProperties(v12, v17);

    if (!v15) {
      CFDictionaryRef v15 = (CFDictionaryRef)MEMORY[0x1E4F1CC08];
    }
    CFDictionaryRef v18 = [getPICompositionExporterClass() resetImageProperties:v15 preserveRegions:v6];
    CGImageDestinationAddImage(v12, a3, v18);
    if (!CGImageDestinationFinalize(v12))
    {
      uint64_t v19 = PLBackendGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Couldn't create image data", v21, 2u);
      }

      uint64_t v10 = 0;
    }
    CFRelease(v12);
  }
  return v10;
}

+ (id)compositionWithController:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 source];
  objc_msgSend(v6, "setSource:mediaType:", v7, objc_msgSend(v5, "mediaType"));

  uint64_t v8 = [v5 mediaType];
  CFURLRef v9 = +[PLCompositionHelper validatedCompositionCopyFor:v6 mediaType:v8];

  return v9;
}

+ (id)rendererForVideoURL:(id)a3 livePhotoStillURL:(id)a4 adjustmentData:(id)a5 formatIdentifier:(id)a6 formatVersion:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v44 = a5;
  id v45 = a6;
  id v46 = a7;
  char v42 = v13;
  if (v14)
  {
    v43 = +[PLLivePhotoEditSource livePhotoSourceWithPhotoURL:v14 videoComplementURL:v13];
    uint64_t v15 = 3;
  }
  else
  {
    v43 = [[PLVideoEditSource alloc] initWithVideoURL:v13];
    uint64_t v15 = 2;
  }
  uint64_t v16 = objc_alloc_init(PLPhotoEditPersistenceManager);
  id v48 = 0;
  CFDictionaryRef v17 = [(PLPhotoEditPersistenceManager *)v16 loadCompositionFrom:v44 formatIdentifier:v45 formatVersion:v46 sidecarData:0 error:&v48];
  id v18 = v48;
  uint64_t v19 = v18;
  if (!v17 || v18)
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "could not load composition from adjustment data: %@", (uint8_t *)&buf, 0xCu);
    }
    v33 = 0;
  }
  else
  {
    uint64_t v20 = [getPIPhotoEditHelperClass_31007() newCompositionControllerWithComposition:v17];
    uint64_t v21 = [(PLEditSource *)v43 source];
    [v20 setSource:v21 mediaType:v15];

    id v41 = [v20 copy];
    uint64_t v22 = [v41 composition];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      int v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:a1 file:@"PLPhotoEditRenderer.m" lineNumber:257 description:@"Composition controller has no NUComposition!"];
    }
    id PIPhotoEditHelperClass_31007 = getPIPhotoEditHelperClass_31007();
    uint64_t v25 = [v41 composition];
    uint64_t v26 = [PIPhotoEditHelperClass_31007 videoPropertiesRequestWithComposition:v25];

    [v26 setName:@"PLPhotoEditRenderer-getInputOrientation"];
    id v47 = 0;
    uint64_t v27 = [v26 submitSynchronous:&v47];
    id v40 = v47;
    if (v27)
    {
      id v28 = [v27 properties];
      uint64_t v29 = [v28 orientation];

      uint64_t v49 = 0;
      id v50 = &v49;
      uint64_t v51 = 0x2020000000;
      uint64_t v30 = (uint64_t (*)(uint64_t))getNUOrientationIsValidSymbolLoc_ptr;
      v52 = getNUOrientationIsValidSymbolLoc_ptr;
      if (!getNUOrientationIsValidSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v54 = __getNUOrientationIsValidSymbolLoc_block_invoke;
        v55 = &unk_1E5875840;
        v56 = &v49;
        v31 = NeutrinoCoreLibrary_31056();
        v32 = dlsym(v31, "NUOrientationIsValid");
        *(void *)(v56[1] + 24) = v32;
        getNUOrientationIsValidSymbolLoc_ptr = *(_UNKNOWN **)(v56[1] + 24);
        uint64_t v30 = (uint64_t (*)(uint64_t))v50[3];
      }
      _Block_object_dispose(&v49, 8);
      if (!v30)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        v39 = [NSString stringWithUTF8String:"NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)"];
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"PLPhotoEditRenderer.m", 83, @"%s", dlerror());

        __break(1u);
      }
      if (v30(v29))
      {
        +[PLCompositionHelper compositionController:v20 setInputOrientation:v29];
      }
      else
      {
        int v35 = PLBackendGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v29;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "video orientation from the video properties is invalid: %d", (uint8_t *)&buf, 8u);
        }
      }
      v33 = [[PLPhotoEditRenderer alloc] initWithEditSource:v43 renderPriority:3];
      [(PLPhotoEditRenderer *)v33 setCompositionController:v20];
    }
    else
    {
      v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v40;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Error encountered determining video properties for video composition: %@", (uint8_t *)&buf, 0xCu);
      }

      v33 = 0;
    }
  }
  return v33;
}

+ (void)configureNeutrinoCacheDirectoryIfNeeded
{
  if (configureNeutrinoCacheDirectoryIfNeeded_onceToken != -1) {
    dispatch_once(&configureNeutrinoCacheDirectoryIfNeeded_onceToken, &__block_literal_global_31106);
  }
}

void __62__PLPhotoEditRenderer_configureNeutrinoCacheDirectoryIfNeeded__block_invoke()
{
  v0 = NSTemporaryDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"com.apple.Photos"];

  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1 isDirectory:1];
  id v3 = [v2 URLByAppendingPathComponent:@"Neutrino"];

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v4 = (void *)getNUGlobalSettingsClass_softClass;
  uint64_t v10 = getNUGlobalSettingsClass_softClass;
  if (!getNUGlobalSettingsClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getNUGlobalSettingsClass_block_invoke;
    v6[3] = &unk_1E5875840;
    v6[4] = &v7;
    __getNUGlobalSettingsClass_block_invoke((uint64_t)v6);
    id v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  [v5 setCacheNodeDirectoryURL:v3];
}

@end