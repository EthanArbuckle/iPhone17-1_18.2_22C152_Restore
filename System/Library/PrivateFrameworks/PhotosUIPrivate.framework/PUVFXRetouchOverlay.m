@interface PUVFXRetouchOverlay
+ (double)_dragCoefficient;
+ (id)_blurredEdgeImageWithImage:(id)a3 settings:(id)a4;
- (PUVFXCleanupOverlayDelegate)overlayDelegate;
- (PUVFXRetouchOverlay)initWithComposition:(id)a3 maskContext:(id)a4 constrainingView:(id)a5 isHDR:(BOOL)a6 overlayDelegate:(id)a7;
- (double)_maxEDRForDisplay;
- (id)_createOutlineImage:(id)a3 settings:(id)a4;
- (id)_createRadialGradientWithSize:(CGSize)a3;
- (id)_createSubjectExclusionMaskForComposition:(id)a3;
- (id)_scaleCIImage:(id)a3 toFitSize:(CGSize)a4;
- (id)_syncGetSourceImageOfSize:(CGSize)a3;
- (id)brushView;
- (void)_addNotifications;
- (void)_asyncCIRenderWithFlush:(id)a3;
- (void)_configureEmitter:(id)a3 withSettings:(id)a4;
- (void)_configureOverrides:(id)a3 withSettings:(id)a4;
- (void)_createAndAddLayers;
- (void)_createDeclutterMaskForComposition:(id)a3;
- (void)_delayedScreenParamsDidChange:(id)a3;
- (void)_didMoveToSuperview;
- (void)_didUndoRedo:(id)a3;
- (void)_layoutSubviews;
- (void)_powerStateDidChange:(id)a3;
- (void)_removeNotifications;
- (void)_screenParamsDidChange:(id)a3;
- (void)_snapshotAvailable:(id)a3;
- (void)_thermalStateDidChange:(id)a3;
- (void)didMoveToSuperview;
- (void)didRenderComposition:(id)a3;
- (void)didResetComposition:(id)a3;
- (void)didStartBrushing;
- (void)layoutSubviews;
- (void)prepareForRevertToOriginal;
- (void)removeFromSuperview;
- (void)selectPoint:(CGPoint)a3 withMask:(id)a4 composition:(id)a5;
- (void)setBrushPosition:(CGPoint)a3;
- (void)setOverlayDelegate:(id)a3;
- (void)showControlsInViewController:(id)a3;
- (void)undimMasks;
@end

@implementation PUVFXRetouchOverlay

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageGenerators, 0);
  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_constrainingView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_brushView, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_inpaintCtx, 0);
}

- (void)setOverlayDelegate:(id)a3
{
}

- (PUVFXCleanupOverlayDelegate)overlayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);
  return (PUVFXCleanupOverlayDelegate *)WeakRetained;
}

- (void)_asyncCIRenderWithFlush:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PUVFXRetouchOverlay__asyncCIRenderWithFlush___block_invoke;
  block[3] = &unk_1E5F2EBA0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __47__PUVFXRetouchOverlay__asyncCIRenderWithFlush___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [MEMORY[0x1E4F39CF8] commit];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 flush];
}

- (id)_scaleCIImage:(id)a3 toFitSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 extent];
  double v8 = v7;
  double v10 = v9;
  id v11 = v6;
  v12 = v11;
  BOOL v13 = v8 == width && v10 == height;
  v14 = v11;
  if (!v13)
  {
    double v15 = width / v8;
    if (width / v8 >= height / v10) {
      double v15 = height / v10;
    }
    CGAffineTransformMakeScale(&v17, v15, v15);
    v14 = [v12 imageByApplyingTransform:&v17];
  }
  return v14;
}

- (id)_createOutlineImage:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v5 objectForKeyedSubscript:@"dilation"];
  [v7 floatValue];
  int v9 = v8;

  double v10 = [MEMORY[0x1E4F1E040] morphologyMinimumFilter];
  LODWORD(v11) = v9;
  [v10 setRadius:v11];
  [v10 setInputImage:v6];
  v12 = [v10 outputImage];
  [v6 extent];
  BOOL v13 = objc_msgSend(v12, "imageByCroppingToRect:");

  v14 = [MEMORY[0x1E4F1E040] sourceOutCompositingFilter];
  [v14 setInputImage:v6];

  [v14 setBackgroundImage:v13];
  double v15 = [MEMORY[0x1E4F1E040] gaussianBlurFilter];
  v16 = [v14 outputImage];
  [v15 setInputImage:v16];

  CGAffineTransform v17 = [v5 objectForKeyedSubscript:@"blurSigma"];

  [v17 floatValue];
  objc_msgSend(v15, "setRadius:");

  v18 = [v15 outputImage];

  return v18;
}

- (void)showControlsInViewController:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28F98];
  settings = self->_settings;
  id v18 = 0;
  id v6 = a3;
  double v7 = [v4 dataWithPropertyList:settings format:100 options:0 error:&v18];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __52__PUVFXRetouchOverlay_showControlsInViewController___block_invoke;
  v16 = &unk_1E5F29FB0;
  CGAffineTransform v17 = self;
  id v8 = v18;
  int v9 = +[PUVFXControls createViewControllerWithSettingsData:v7 update:&v13];
  double v10 = objc_msgSend(v6, "sheetPresentationController", v13, v14, v15, v16, v17);
  double v11 = [MEMORY[0x1E4FB1C30] mediumDetent];
  v19[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v10 setDetents:v12];

  [v10 setPrefersGrabberVisible:1];
  [v6 setModalPresentationStyle:2];
  [v6 presentViewController:v9 animated:1 completion:&__block_literal_global_421];
}

void __52__PUVFXRetouchOverlay_showControlsInViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = 0;
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a2 options:0 format:0 error:&v5];
  id v4 = v5;
  if (!v4) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), v3);
  }
}

- (void)didStartBrushing
{
  self->_isBrushing = 1;
}

- (void)_configureEmitter:(id)a3 withSettings:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v6 objectForKeyedSubscript:@"cells"];
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = objc_opt_new();
        [v7 addObject:v13];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __54__PUVFXRetouchOverlay__configureEmitter_withSettings___block_invoke;
        v20[3] = &unk_1E5F29F88;
        id v21 = v13;
        v22 = self;
        id v14 = v13;
        [v12 enumerateKeysAndObjectsUsingBlock:v20];
        [v14 setEmissionRange:3.14159265];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  double v15 = [v6 objectForKeyedSubscript:@"emitterShape"];
  [v18 setEmitterShape:v15];

  v16 = [v6 objectForKeyedSubscript:@"renderMode"];
  [v18 setRenderMode:v16];

  CGAffineTransform v17 = [v6 objectForKeyedSubscript:@"emitterMode"];
  [v18 setEmitterMode:v17];

  [v18 setEmitterCells:v7];
}

void __54__PUVFXRetouchOverlay__configureEmitter_withSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if ([(__CFString *)v18 isEqualToString:@"color"])
  {
    id v6 = [MEMORY[0x1E4FB1618] colorFromDictionary:v5];
    uint64_t v7 = [v6 CGColor];

    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = @"color";
    id v10 = (id)v7;
  }
  else
  {
    if ([(__CFString *)v18 isEqualToString:@"particleSize"])
    {
      [v5 doubleValue];
      double v12 = v11;
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "_createRadialGradientWithSize:", v11, v11);
      id v14 = *(void **)(*(void *)(a1 + 40) + 456);
      uint64_t v15 = *MEMORY[0x1E4F1E300];
      v16 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
      CGAffineTransform v17 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:format:colorSpace:", v13, v15, objc_msgSend(v16, "CGColorSpace"), 0.0, 0.0, v12, v12);

      [*(id *)(a1 + 32) setContents:v17];
      CGImageRelease(v17);

      goto LABEL_7;
    }
    uint64_t v8 = *(void **)(a1 + 32);
    id v10 = v5;
    uint64_t v9 = v18;
  }
  [v8 setValue:v10 forKey:v9];
LABEL_7:
}

- (void)_configureOverrides:(id)a3 withSettings:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v32 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v6 valueForKeyPath:@"colorOverLife.colors"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = PFMap();

    id v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
    double v11 = [v6 objectForKeyedSubscript:@"colorChangeSpeed"];
    uint64_t v12 = [v11 integerValue];

    if (v12 >= 2)
    {
      uint64_t v13 = v12 - 1;
      do
      {
        [v10 addObjectsFromArray:v9];
        --v13;
      }
      while (v13);
    }
    id v14 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F18]];
    [v14 setValue:v10 forKey:@"colors"];
    [v32 addObject:v14];
  }
  v30 = v5;
  objc_msgSend(v6, "valueForKeyPath:", @"valueOverLife", v6);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    uint64_t v18 = *MEMORY[0x1E4F39F28];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v21 = [MEMORY[0x1E4F39BA0] behaviorWithType:v18];
        v22 = [v20 objectForKeyedSubscript:@"keyPath"];
        [v21 setValue:v22 forKey:@"keyPath"];

        long long v23 = [v20 objectForKeyedSubscript:@"values"];
        [v21 setValue:v23 forKey:@"values"];

        long long v24 = [v20 objectForKeyedSubscript:@"locations"];
        [v21 setValue:v24 forKey:@"locations"];

        [v32 addObject:v21];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }
  [v30 setEmitterBehaviors:v32];
  long long v25 = [v29 objectForKeyedSubscript:@"compositingFilter"];

  if (v25)
  {
    long long v26 = (void *)MEMORY[0x1E4F39BC0];
    v27 = [v29 objectForKeyedSubscript:@"compositingFilter"];
    uint64_t v28 = [v26 filterWithType:v27];
    [v30 setCompositingFilter:v28];
  }
}

id __56__PUVFXRetouchOverlay__configureOverrides_withSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4FB1618] colorFromDictionary:a2];
  v3 = [v2 CGColor];

  return v3;
}

- (id)_createRadialGradientWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [MEMORY[0x1E4F1E040] radialGradientFilter];
  objc_msgSend(v5, "setCenter:", width * 0.5, height * 0.5);
  double v6 = width * 0.1;
  *(float *)&double v6 = width * 0.1;
  [v5 setRadius0:v6];
  double v7 = width * 0.25;
  *(float *)&double v7 = width * 0.25;
  [v5 setRadius1:v7];
  uint64_t v8 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [v5 setColor0:v8];

  uint64_t v9 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  [v5 setColor1:v9];

  id v10 = [v5 outputImage];

  return v10;
}

- (void)didRenderComposition:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_composition, a3);
  double v6 = [NSString stringWithUTF8String:"animation"];
  double v7 = +[PUTimingManager defaultManager];
  uint64_t v8 = [v7 stopwatchForKey:v6];

  uint64_t v9 = [v8 log];
  uint64_t v10 = [v8 sid];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      int v19 = 136315138;
      v20 = "-[PUVFXRetouchOverlay didRenderComposition:]";
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_EVENT, v11, "animation", "%s - setting render finished state", (uint8_t *)&v19, 0xCu);
    }
  }

  uint64_t v12 = [NSString stringWithUTF8String:"render"];
  uint64_t v13 = +[PUTimingManager defaultManager];
  id v14 = [v13 stopwatchForKey:v12];

  uint64_t v15 = [v14 log];
  uint64_t v16 = [v14 sid];
  if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v15))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v15, OS_SIGNPOST_INTERVAL_END, v17, "render", "", (uint8_t *)&v19, 2u);
    }
  }

  uint64_t v18 = +[PUTimingManager defaultManager];
  [v18 removeStopwatchForKey:v12];

  [(PUVFXRetouchOverlay *)self _createDeclutterMaskForComposition:self->_composition];
}

- (void)didResetComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
  id v5 = a3;
  [(PUVFXDimmingBackgroundLayer *)self->_rootLayer resetMask];
  [(PUVFXRetouchOverlay *)self _createDeclutterMaskForComposition:v5];
}

- (void)prepareForRevertToOriginal
{
}

- (id)_createSubjectExclusionMaskForComposition:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__64625;
  uint64_t v13 = __Block_byref_object_dispose__64626;
  id v14 = 0;
  if ([MEMORY[0x1E4F7A4A0] preserveSubjectsWhenInpainting])
  {
    inpaintCtx = self->_inpaintCtx;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PUVFXRetouchOverlay__createSubjectExclusionMaskForComposition___block_invoke;
    v8[3] = &unk_1E5F29F60;
    v8[4] = &v9;
    [MEMORY[0x1E4F8A2E8] createSubjectMaskForContext:inpaintCtx composition:v4 completion:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__PUVFXRetouchOverlay__createSubjectExclusionMaskForComposition___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_createDeclutterMaskForComposition:(id)a3
{
  id v4 = a3;
  if (self->_inpaintCtx)
  {
    id v5 = [NSString stringWithUTF8String:"declutter"];
    id v6 = +[PUTimingManager defaultManager];
    double v7 = [v6 stopwatchForKey:v5];

    uint64_t v8 = [v7 log];
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    [v7 setSid:v9];
    uint64_t v10 = [v7 log];
    uint64_t v11 = [v7 sid];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "declutter", "+[PIObjectRemoval createDeclutterMaskForContext]", buf, 2u);
      }
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F8A2E8];
    inpaintCtx = self->_inpaintCtx;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PUVFXRetouchOverlay__createDeclutterMaskForComposition___block_invoke;
    v15[3] = &unk_1E5F29F38;
    v15[4] = self;
    id v16 = v4;
    [v13 createDeclutterMaskForContext:inpaintCtx composition:v16 completion:v15];
  }
}

void __58__PUVFXRetouchOverlay__createDeclutterMaskForComposition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString stringWithUTF8String:"declutter"];
  id v5 = +[PUTimingManager defaultManager];
  id v6 = [v5 stopwatchForKey:v4];

  double v7 = [v6 log];
  uint64_t v8 = [v6 sid];
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_INTERVAL_END, v9, "declutter", "", buf, 2u);
    }
  }

  uint64_t v10 = +[PUTimingManager defaultManager];
  [v10 removeStopwatchForKey:v4];

  [*(id *)(*(void *)(a1 + 32) + 416) resetMask];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 488));
  [WeakRetained imageSize];
  double v13 = v12;
  double v15 = v14;

  if (v3)
  {
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 488));
    id v17 = v16;
    if (!v16 || v13 == 0.0 || v15 == 0.0)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v18 = MEMORY[0x1E4F8A250];
    double v19 = *MEMORY[0x1E4F8A250];

    if (v13 != v19 || v15 != *(double *)(v18 + 8))
    {
      v20 = (void *)MEMORY[0x1E4F1E050];
      uint64_t v21 = [v3 buffer];
      objc_msgSend(v20, "imageWithCVPixelBuffer:", objc_msgSend(v21, "CVPixelBuffer"));
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      if ([MEMORY[0x1E4F7A790] isMaskValid:v17])
      {
        v22 = [*(id *)(a1 + 32) _createSubjectExclusionMaskForComposition:*(void *)(a1 + 40)];
        long long v23 = v22;
        if (v22)
        {
          long long v24 = (void *)MEMORY[0x1E4F1E050];
          long long v25 = [v22 buffer];
          long long v26 = objc_msgSend(v24, "imageWithCVPixelBuffer:", objc_msgSend(v25, "CVPixelBuffer"));

          [v17 extent];
          double v28 = v27;
          [v26 extent];
          CGFloat v30 = v28 / v29;
          [v17 extent];
          double v32 = v31;
          [v26 extent];
          CGAffineTransformMakeScale(&v50, v30, v32 / v33);
          long long v34 = [v26 imageByApplyingTransform:&v50];

          long long v35 = [MEMORY[0x1E4F1E000] subtract];
          uint64_t v36 = [v35 applyWithForeground:v34 background:v17];

          id v17 = (id)v36;
        }
        v37 = [v17 imageByApplyingFilter:@"CIMaskToAlpha"];

        uint64_t v38 = *(void *)(a1 + 40);
        id v49 = 0;
        v39 = objc_msgSend(MEMORY[0x1E4F7A790], "transformedImage:forComposition:imageSize:error:", v37, v38, &v49, v13, v15);
        id v40 = v49;

        if (v39)
        {
          v41 = objc_opt_class();
          v42 = [*(id *)(*(void *)(a1 + 32) + 432) objectForKeyedSubscript:@"glow"];
          v43 = [v41 _blurredEdgeImageWithImage:v39 settings:v42];

          v44 = objc_msgSend(*(id *)(a1 + 32), "_scaleCIImage:toFitSize:", v43, 1024.0, 1024.0);

          v45 = *(void **)(a1 + 32);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __58__PUVFXRetouchOverlay__createDeclutterMaskForComposition___block_invoke_367;
          v47[3] = &unk_1E5F2ECC8;
          v47[4] = v45;
          id v17 = v44;
          id v48 = v17;
          [v45 _asyncCIRenderWithFlush:v47];
        }
        else
        {
          v46 = __log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v40;
            _os_log_debug_impl(&dword_1AE9F8000, v46, OS_LOG_TYPE_DEBUG, "Error transforming mask image: %@", buf, 0xCu);
          }

          id v17 = 0;
        }
      }
      goto LABEL_19;
    }
  }
LABEL_20:
}

uint64_t __58__PUVFXRetouchOverlay__createDeclutterMaskForComposition___block_invoke_367(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 416);
  uint64_t v5 = *(void *)(v2 + 456);
  uint64_t v6 = *MEMORY[0x1E4F1E300];
  double v7 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
  objc_msgSend(v4, "setBackgroundImage:ctx:format:colorSpace:", v3, v5, v6, objc_msgSend(v7, "CGColorSpace"));

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v8 setForegroundMask:0];
}

- (id)_syncGetSourceImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);
  uint64_t v6 = objc_msgSend(WeakRetained, "sourceImageOfSize:", width, height);

  return v6;
}

- (void)undimMasks
{
}

- (void)selectPoint:(CGPoint)a3 withMask:(id)a4 composition:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  if ([MEMORY[0x1E4F7A790] isMaskValid:v8])
  {
    os_signpost_id_t v9 = [NSString stringWithUTF8String:"render"];
    uint64_t v10 = +[PUTimingManager defaultManager];
    uint64_t v11 = [v10 stopwatchForKey:v9];

    double v12 = [v11 log];
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    [v11 setSid:v13];
    double v14 = [v11 log];
    uint64_t v15 = [v11 sid];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "render", "user selected point", buf, 2u);
      }
    }

    id v17 = [NSString stringWithUTF8String:"animation"];
    uint64_t v18 = +[PUTimingManager defaultManager];
    double v19 = [v18 stopwatchForKey:v17];

    v20 = [v19 log];
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    [v19 setSid:v21];
    v22 = [v19 log];
    uint64_t v23 = [v19 sid];
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "animation", "start animations", buf, 2u);
      }
    }

    uint64_t v25 = -[PUVFXRetouchOverlay _scaleCIImage:toFitSize:](self, "_scaleCIImage:toFitSize:", v8, 1024.0, 1024.0);

    long long v26 = objc_opt_class();
    double v27 = [(NSDictionary *)self->_settings objectForKeyedSubscript:@"glow"];
    double v28 = [v26 _blurredEdgeImageWithImage:v25 settings:v27];
    double v29 = [v28 imageByApplyingFilter:@"CIMaskToAlpha"];

    CGFloat v30 = [(PUVFXRetouchOverlay *)self superview];
    double v31 = [v30 layer];
    objc_msgSend(v31, "convertPoint:toLayer:", self->_rootLayer, x, y);
    uint64_t v33 = v32;
    uint64_t v35 = v34;

    if (self->_isBrushing)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      v43 = __56__PUVFXRetouchOverlay_selectPoint_withMask_composition___block_invoke_2;
      v44 = &unk_1E5F2ECC8;
      uint64_t v36 = &v46;
      v45 = self;
      v46 = v29;
      id v37 = v29;
      [(PUVFXRetouchOverlay *)self _asyncCIRenderWithFlush:&v41];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);
      objc_msgSend(WeakRetained, "fadeOutBrushStrokeWithDuration:", 0.2, v41, v42, v43, v44, v45);

      self->_isBrushing = 0;
    }
    else
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __56__PUVFXRetouchOverlay_selectPoint_withMask_composition___block_invoke;
      v47[3] = &unk_1E5F2E580;
      uint64_t v36 = (id *)v48;
      v47[4] = self;
      v48[0] = v29;
      v48[1] = v33;
      v48[2] = v35;
      id v40 = v29;
      [(PUVFXRetouchOverlay *)self _asyncCIRenderWithFlush:v47];
    }

    id v8 = (id)v25;
  }
  else
  {
    v39 = [(PUVFXRetouchOverlay *)self overlayDelegate];
    [v39 fadeOutBrushStrokeWithDuration:0.2];
  }
}

uint64_t __56__PUVFXRetouchOverlay_selectPoint_withMask_composition___block_invoke(double *a1)
{
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  id v4 = *(void **)(v2 + 416);
  uint64_t v5 = *(void *)(v2 + 456);
  uint64_t v6 = *MEMORY[0x1E4F1E300];
  double v7 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
  objc_msgSend(v4, "setForegroundImage:ctx:format:colorSpace:", v3, v5, v6, objc_msgSend(v7, "CGColorSpace"));

  id v8 = *(void **)(*((void *)a1 + 4) + 416);
  double v9 = a1[6];
  double v10 = a1[7];
  return objc_msgSend(v8, "scanFrom:", v9, v10);
}

void __56__PUVFXRetouchOverlay_selectPoint_withMask_composition___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 416);
  uint64_t v4 = *(void *)(v1 + 456);
  uint64_t v5 = *MEMORY[0x1E4F1E300];
  id v6 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
  objc_msgSend(v3, "setForegroundImage:ctx:format:colorSpace:", v2, v4, v5, objc_msgSend(v6, "CGColorSpace"));
}

- (void)setBrushPosition:(CGPoint)a3
{
}

- (double)_maxEDRForDisplay
{
  uint64_t v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 potentialEDRHeadroom];

  PXClamp();
  return result;
}

- (void)_layoutSubviews
{
  [(PUVFXRetouchOverlay *)self bounds];
  rootLayer = self->_rootLayer;
  -[PUVFXDimmingBackgroundLayer setFrame:](rootLayer, "setFrame:");
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUVFXRetouchOverlay;
  [(PUVFXRetouchOverlay *)&v3 layoutSubviews];
  [(PUVFXRetouchOverlay *)self _layoutSubviews];
}

- (id)brushView
{
  return self->_brushView;
}

- (void)removeFromSuperview
{
  constrainingView = self->_constrainingView;
  self->_constrainingView = 0;

  v4.receiver = self;
  v4.super_class = (Class)PUVFXRetouchOverlay;
  [(PUVFXRetouchOverlay *)&v4 removeFromSuperview];
}

- (void)_didUndoRedo:(id)a3
{
}

- (void)_snapshotAvailable:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PUVFXRetouchOverlay__snapshotAvailable___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUVFXRetouchOverlay *)self _asyncCIRenderWithFlush:v3];
}

void __42__PUVFXRetouchOverlay__snapshotAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_syncGetSourceImageOfSize:", 1024.0, 768.0);
  objc_super v3 = (void *)MEMORY[0x1E4F7A718];
  id v20 = v2;
  [v2 extent];
  uint64_t v4 = NUPixelSizeFromCGSize();
  id v6 = objc_msgSend(v3, "newPixelBufferOfSize:format:", v4, v5, 1380411457);
  double v7 = v6;
  if (v6)
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 456);
    uint64_t v9 = [v6 CVPixelBuffer];
    [v20 extent];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
    objc_msgSend(v8, "render:toCVPixelBuffer:bounds:colorSpace:", v20, v9, objc_msgSend(v18, "CGColorSpace"), v11, v13, v15, v17);

    if (CVPixelBufferGetIOSurface((CVPixelBufferRef)[v7 CVPixelBuffer]))
    {
      double v19 = (CGImage *)CGImageCreateFromIOSurface();
      if (v19) {
        [*(id *)(*(void *)(a1 + 32) + 416) setSourceImage:v19];
      }
      CGImageRelease(v19);
    }
  }
}

- (void)_delayedScreenParamsDidChange:(id)a3
{
  [(PUVFXRetouchOverlay *)self _maxEDRForDisplay];
  double v5 = v4;
  id v6 = [(PUVFXBrushView *)self->_brushView brushOverlay];
  [v6 setMaxEDR:v5];

  rootLayer = self->_rootLayer;
  [(PUVFXDimmingBackgroundLayer *)rootLayer setWantsExtendedDynamicRangeContent:v5 > 1.0];
}

- (void)_powerStateDidChange:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", a3);
  uint64_t v5 = [v4 isLowPowerModeEnabled];

  rootLayer = self->_rootLayer;
  [(PUVFXDimmingBackgroundLayer *)rootLayer setIsThrottled:v5];
}

- (void)_thermalStateDidChange:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", a3);
  uint64_t v5 = [v4 thermalState];

  rootLayer = self->_rootLayer;
  [(PUVFXDimmingBackgroundLayer *)rootLayer setIsThrottled:(v5 & 0xFFFFFFFFFFFFFFFELL) == 2];
}

- (void)_screenParamsDidChange:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedScreenParamsDidChange_ object:0];
  [(PUVFXRetouchOverlay *)self performSelector:sel__delayedScreenParamsDidChange_ withObject:0 afterDelay:2.0];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)PUVFXRetouchOverlay;
  [(PUVFXRetouchOverlay *)&v3 didMoveToSuperview];
  [(PUVFXRetouchOverlay *)self _didMoveToSuperview];
}

- (void)_removeNotifications
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2ED8] object:0];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F28A80] object:0];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F28A78] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F287F0] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F287E8] object:0];
}

- (void)_addNotifications
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__screenParamsDidChange_ name:*MEMORY[0x1E4FB2ED8] object:0];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__snapshotAvailable_ name:*MEMORY[0x1E4F7A788] object:0];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__didUndoRedo_ name:*MEMORY[0x1E4F28A80] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__didUndoRedo_ name:*MEMORY[0x1E4F28A78] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__thermalStateDidChange_ name:*MEMORY[0x1E4F287F0] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__powerStateDidChange_ name:*MEMORY[0x1E4F287E8] object:0];
}

- (void)_didMoveToSuperview
{
  v40[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PUVFXRetouchOverlay *)self superview];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4F1E018];
    uint64_t v5 = *MEMORY[0x1E4F1E208];
    v39[0] = *MEMORY[0x1E4F1E1E0];
    v39[1] = v5;
    v40[0] = MEMORY[0x1E4F1CC28];
    v40[1] = @"PUVFXRetouchOverlay";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    id v7 = [v4 contextWithOptions:v6];
    ciContext = self->_ciContext;
    self->_ciContext = v7;

    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v10 = [v9 pathForResource:@"CleanupEffectSettings" ofType:@"plist"];

    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v10];
    settings = self->_settings;
    self->_settings = v11;

    [(PUVFXRetouchOverlay *)self _createAndAddLayers];
    [(PUVFXBrushView *)self->_brushView setDelegate:self];
    [(PUVFXBrushView *)self->_brushView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUVFXRetouchOverlay *)self addSubview:self->_brushView];
    double v13 = [(PUVFXBrushView *)self->_brushView brushOverlay];
    brushView = self->_brushView;
    if (brushView && self->_constrainingView)
    {
      if (v13)
      {
        double v15 = [(PUVFXBrushView *)brushView topAnchor];
        double v16 = [(PUVFXRetouchOverlay *)self topAnchor];
        double v17 = [v15 constraintEqualToAnchor:v16];
        [v17 setActive:1];

        uint64_t v18 = [(PUVFXBrushView *)self->_brushView bottomAnchor];
        double v19 = [(PUVFXRetouchOverlay *)self bottomAnchor];
        id v20 = [v18 constraintEqualToAnchor:v19];
        [v20 setActive:1];

        os_signpost_id_t v21 = [(PUVFXBrushView *)self->_brushView leftAnchor];
        v22 = [(PUVFXRetouchOverlay *)self leftAnchor];
        uint64_t v23 = [v21 constraintEqualToAnchor:v22];
        [v23 setActive:1];

        os_signpost_id_t v24 = [(PUVFXBrushView *)self->_brushView rightAnchor];
        uint64_t v25 = [(PUVFXRetouchOverlay *)self rightAnchor];
        long long v26 = [v24 constraintEqualToAnchor:v25];
        [v26 setActive:1];

        double v27 = [v13 topAnchor];
        double v28 = [(UIView *)self->_constrainingView topAnchor];
        double v29 = [v27 constraintEqualToAnchor:v28];
        [v29 setActive:1];

        CGFloat v30 = [v13 bottomAnchor];
        double v31 = [(UIView *)self->_constrainingView bottomAnchor];
        uint64_t v32 = [v30 constraintEqualToAnchor:v31];
        [v32 setActive:1];

        uint64_t v33 = [v13 leftAnchor];
        uint64_t v34 = [(UIView *)self->_constrainingView leftAnchor];
        uint64_t v35 = [v33 constraintEqualToAnchor:v34];
        [v35 setActive:1];

        uint64_t v36 = [v13 rightAnchor];
        id v37 = [(UIView *)self->_constrainingView rightAnchor];
        uint64_t v38 = [v36 constraintEqualToAnchor:v37];
        [v38 setActive:1];

        [(PUVFXRetouchOverlay *)self _delayedScreenParamsDidChange:0];
        [(PUVFXRetouchOverlay *)self _thermalStateDidChange:0];
        [(PUVFXRetouchOverlay *)self _powerStateDidChange:0];
        [(PUVFXRetouchOverlay *)self _snapshotAvailable:0];
        [(PUVFXRetouchOverlay *)self _createDeclutterMaskForComposition:self->_composition];
        [(PUVFXRetouchOverlay *)self _addNotifications];
      }
    }
  }
  else
  {
    [(PUVFXRetouchOverlay *)self _removeNotifications];
  }
}

- (void)_createAndAddLayers
{
  objc_super v3 = +[PUVFXDimmingBackgroundLayer layer];
  rootLayer = self->_rootLayer;
  self->_rootLayer = v3;

  [(PUVFXDimmingBackgroundLayer *)self->_rootLayer setName:@"rootLayer"];
  uint64_t v5 = self->_rootLayer;
  uint64_t v6 = *MEMORY[0x1E4F3A2E8];
  id v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
  [(PUVFXDimmingBackgroundLayer *)v5 setCompositingFilter:v7];

  id v8 = [(PUVFXRetouchOverlay *)self layer];
  [v8 setMasksToBounds:1];

  uint64_t v9 = [(PUVFXRetouchOverlay *)self layer];
  [v9 setWantsExtendedDynamicRangeContent:1];

  double v10 = [(PUVFXRetouchOverlay *)self layer];
  [v10 addSublayer:self->_rootLayer];

  double v11 = self->_rootLayer;
  double v12 = [MEMORY[0x1E4F39BC0] filterWithType:v6];
  [(PUVFXDimmingBackgroundLayer *)v11 setCompositingFilter:v12];

  double v13 = [(NSDictionary *)self->_settings valueForKeyPath:@"sparkles.colorOverLife.colors"];
  double v29 = PFMap();

  double v28 = self;
  double v14 = [(NSDictionary *)self->_settings objectForKeyedSubscript:@"glow"];
  double v15 = [v14 objectForKeyedSubscript:@"particleCount"];
  uint64_t v16 = [v15 integerValue];

  double v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  int v19 = 4;
  do
  {
    id v20 = [MEMORY[0x1E4F1E040] filterWithName:@"PUVFXImageGenerator"];
    objc_msgSend(v20, "setExtent:", 0.0, 0.0, 1024.0, 1024.0);
    os_signpost_id_t v21 = [v14 objectForKeyedSubscript:@"particleSize"];
    [v20 setParticleSize:v21];

    v22 = [v14 objectForKeyedSubscript:@"innerParticleSize"];
    [v20 setInnerParticleSize:v22];

    [v20 generateFieldWithColors:v29 count:v16];
    [(NSArray *)v17 addObject:v20];
    uint64_t v23 = [v20 generatedFieldImage];
    [v18 addObject:v23];

    --v19;
  }
  while (v19);
  imageGenerators = v28->_imageGenerators;
  v28->_imageGenerators = v17;
  uint64_t v25 = v17;

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __42__PUVFXRetouchOverlay__createAndAddLayers__block_invoke_2;
  v31[3] = &unk_1E5F2ECC8;
  v31[4] = v28;
  id v32 = v18;
  id v26 = v18;
  [(PUVFXRetouchOverlay *)v28 _asyncCIRenderWithFlush:v31];
  double v27 = [(PUVFXRetouchOverlay *)v28 layer];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__PUVFXRetouchOverlay__createAndAddLayers__block_invoke_3;
  v30[3] = &unk_1E5F29F10;
  v30[4] = v28;
  PURecurseLayerTreeWithBlock(v27, v30);
}

void __42__PUVFXRetouchOverlay__createAndAddLayers__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  objc_super v3 = *(void **)(v1 + 416);
  uint64_t v4 = *(void *)(v1 + 456);
  uint64_t v5 = *MEMORY[0x1E4F1E300];
  id v6 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
  objc_msgSend(v3, "setBlendImages:ctx:format:colorSpace:", v2, v4, v5, objc_msgSend(v6, "CGColorSpace"));
}

void __42__PUVFXRetouchOverlay__createAndAddLayers__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setWantsExtendedDynamicRangeContent:1];
  objc_super v3 = [*(id *)(a1 + 32) layer];
  [v3 contentsScale];
  objc_msgSend(v4, "setContentsScale:");

  [v4 setAllowsGroupOpacity:0];
}

uint64_t __42__PUVFXRetouchOverlay__createAndAddLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1618] colorFromDictionary:a2];
}

- (PUVFXRetouchOverlay)initWithComposition:(id)a3 maskContext:(id)a4 constrainingView:(id)a5 isHDR:(BOOL)a6 overlayDelegate:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v14)
  {
    queue = PXAssertGetLog();
    if (os_log_type_enabled(queue, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = @"constrainingView";
      _os_log_fault_impl(&dword_1AE9F8000, queue, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", buf, 0xCu);
    }
    double v17 = 0;
    goto LABEL_7;
  }
  v23.receiver = self;
  v23.super_class = (Class)PUVFXRetouchOverlay;
  uint64_t v16 = [(PUVFXRetouchOverlay *)&v23 init];
  double v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_overlayDelegate, v15);
    [(PUVFXRetouchOverlay *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v17->_inpaintCtx, a4);
    objc_storeStrong((id *)&v17->_constrainingView, a5);
    objc_storeStrong((id *)&v17->_composition, a3);
    uint64_t v18 = objc_opt_new();
    brushView = v17->_brushView;
    v17->_brushView = (PUVFXBrushView *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self = (PUVFXRetouchOverlay *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.editvfx.retouchoverlay", &self->super.super.super);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v20;
LABEL_7:
  }
  return v17;
}

+ (id)_blurredEdgeImageWithImage:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"maskBlurSigma"];
  [v7 floatValue];
  double v9 = v8;

  double v10 = [v5 objectForKeyedSubscript:@"maskDilation"];

  [v10 floatValue];
  double v12 = v11;

  id v13 = [MEMORY[0x1E4F8A380] dilateMask:v6 withRadius:v12];
  id v14 = [v13 imageByApplyingGaussianBlurWithSigma:v9];
  [v6 extent];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_super v23 = objc_msgSend(v14, "imageByCroppingToRect:", v16, v18, v20, v22);

  return v23;
}

+ (double)_dragCoefficient
{
  return 1.0;
}

@end