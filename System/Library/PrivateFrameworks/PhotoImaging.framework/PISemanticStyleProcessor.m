@interface PISemanticStyleProcessor
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation PISemanticStyleProcessor

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(void *)&a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:");
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (a3)
  {
    uint64_t v6 = a3;
    id v7 = a4;
    v8 = [v7 objectForKeyedSubscript:@"extents"];
    v9 = [v7 objectForKeyedSubscript:@"useLightMap"];

    [v9 BOOLValue];
    v10 = [v8 objectAtIndexedSubscript:v6];
    [v10 CGRectValue];
    CGFloat x = v11;
    CGFloat y = v13;
    CGFloat width = v15;
    CGFloat height = v17;

    if ((a3 - 6) >= 3)
    {
      v19 = [v8 objectAtIndexedSubscript:0];
      [v19 CGRectValue];

      NUCGRectConvertFromRectToRect();
      CGFloat x = v20;
      CGFloat y = v21;
      CGFloat width = v22;
      CGFloat height = v23;
    }
  }
  else
  {
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E300];
}

+ (int)formatForInputAtIndex:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 < 9) {
    return **((_DWORD **)&unk_1E5D80AE8 + a3);
  }
  uint64_t v23 = *(void *)&a3;
  v4 = NUAssertLogger_20707();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid index %d", v23);
    *(_DWORD *)buf = 138543362;
    double v25 = v5;
    _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v8 = NUAssertLogger_20707();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v9)
    {
      v12 = dispatch_get_specific(*v6);
      double v13 = (void *)MEMORY[0x1E4F29060];
      id v14 = v12;
      double v15 = [v13 callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v25 = v12;
      __int16 v26 = 2114;
      double v27 = v16;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v9)
  {
    v10 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v11 = [v10 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    double v25 = v11;
    _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  double v17 = (void *)_NUAssertFailHandler();
  return +[PISemanticStyleProcessor processWithInputs:v19 arguments:v20 output:v21 error:v22];
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 objectForKeyedSubscript:@"useStyleEngine"];
  unsigned int v60 = [v11 BOOLValue];

  v12 = [v9 objectForKeyedSubscript:@"useLightMap"];
  int v13 = [v12 BOOLValue];

  v59 = [v8 objectAtIndexedSubscript:0];
  v56 = [v8 objectAtIndexedSubscript:4];
  v55 = [v8 objectAtIndexedSubscript:5];
  v51 = [v8 objectAtIndexedSubscript:1];
  v50 = [v8 objectAtIndexedSubscript:2];
  v48 = [v8 objectAtIndexedSubscript:3];
  v45 = [v8 objectAtIndexedSubscript:6];
  id v14 = 0;
  double v15 = 0;
  char v53 = v13;
  if (v13)
  {
    double v15 = [v8 objectAtIndexedSubscript:7];
    id v14 = [v8 objectAtIndexedSubscript:8];
  }
  v16 = [v9 objectForKeyedSubscript:@"extents"];
  double v17 = [v16 objectAtIndexedSubscript:0];
  [v17 CGRectValue];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  [v10 region];
  v92.origin.CGFloat x = v19;
  v92.origin.CGFloat y = v21;
  v92.size.CGFloat width = v23;
  v92.size.CGFloat height = v25;
  CGRect v91 = CGRectIntersection(v90, v92);
  CGFloat x = v91.origin.x;
  CGFloat y = v91.origin.y;
  CGFloat width = v91.size.width;
  CGFloat height = v91.size.height;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke;
  v83[3] = &unk_1E5D80A78;
  id v84 = v8;
  id v85 = v16;
  CGFloat v86 = v19;
  CGFloat v87 = v21;
  CGFloat v88 = v23;
  CGFloat v89 = v25;
  id v58 = v16;
  id v57 = v8;
  v29 = (void *)MEMORY[0x1AD0F8FE0](v83);
  v30 = [v9 objectForKeyedSubscript:@"stats"];

  if (v30) {
    int v31 = 2;
  }
  else {
    int v31 = 3;
  }
  unsigned int v42 = v31;
  v47 = [v10 metalCommandBuffer];
  v41 = [v47 commandQueue];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v61[3] = &unk_1E5D80AA0;
  CGFloat v74 = v19;
  CGFloat v75 = v21;
  CGFloat v76 = v23;
  CGFloat v77 = v25;
  CGFloat v78 = x;
  CGFloat v79 = y;
  CGFloat v80 = width;
  CGFloat v81 = height;
  id v62 = v10;
  id v63 = v59;
  id v64 = v56;
  id v65 = v55;
  id v66 = v51;
  id v67 = v50;
  id v68 = v48;
  id v69 = v9;
  id v70 = v15;
  char v82 = v53;
  id v73 = v29;
  id v71 = v14;
  id v72 = v45;
  id v46 = v45;
  id v44 = v14;
  id v54 = v15;
  id v32 = v9;
  id v49 = v48;
  id v33 = v50;
  id v52 = v51;
  id v34 = v55;
  id v35 = v56;
  id v36 = v29;
  id v37 = v59;
  id v38 = v10;
  BOOL v39 = +[PISemanticStyleRenderer usingSharedSemanticStyleRendererWithMetalCommandQueue:v41 processingType:v42 useStyleEngine:v60 perform:v61];

  return v39;
}

uint64_t __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v4 region];

  v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v5 CGRectValue];

  NUPixelRectFromCGRect();
  NUPixelRectScale();
  NUPixelRectToCGRect();
  return NURectFlipYOrigin();
}

BOOL __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(v3, "setLogicalImageSize:", *(double *)(a1 + 144), *(double *)(a1 + 152));
  NURectFlipYOrigin();
  objc_msgSend(v3, "setRenderRegionRect:");
  v4 = [*(id *)(a1 + 32) metalTexture];
  [v3 setOutputImageTexture:v4];

  [*(id *)(a1 + 32) region];
  NURectFlipYOrigin();
  objc_msgSend(v3, "setOutputImageTextureMappedRegion:");
  v5 = [*(id *)(a1 + 40) metalTexture];
  [v3 setInputImageTexture:v5];

  (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputImageTextureMappedRegion:");
  uint64_t v6 = [*(id *)(a1 + 48) metalTexture];
  [v3 setInputLinearImageTexture:v6];

  objc_msgSend(v3, "setLogicalImageToInputLinearImageScale:", 1.0 / *(double *)(a1 + 144), 1.0 / *(double *)(a1 + 152));
  id v7 = [*(id *)(a1 + 56) metalTexture];
  [v3 setInputGainMapTexture:v7];

  id v8 = [*(id *)(a1 + 64) metalTexture];
  [v3 setInputPersonMaskTexture:v8];

  (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputPersonMaskTextureMappedRegion:");
  id v9 = [*(id *)(a1 + 72) metalTexture];
  [v3 setInputSkinMaskTexture:v9];

  (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputSkinMaskTextureMappedRegion:");
  id v10 = [*(id *)(a1 + 80) metalTexture];
  [v3 setInputSkyMaskTexture:v10];

  (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputSkyMaskTextureMappedRegion:");
  double v11 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"sceneType"];
  objc_msgSend(v3, "setSemanticStyleSceneType:", objc_msgSend(v11, "intValue"));

  v12 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"srlCurveParameter"];
  [v12 floatValue];
  objc_msgSend(v3, "setInputSRLCurveParameter:");

  int v13 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"brightnessValue"];
  [v3 setBrightnessValue:v13];

  id v14 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"tuningType"];
  [v3 setTuningParameterVariant:v14];

  double v15 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"baseGain"];
  [v15 floatValue];
  objc_msgSend(v3, "setInputLinearBaseGain:");

  v16 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"faceBasedGlobalExposureBoostRatio"];
  [v16 floatValue];
  objc_msgSend(v3, "setFaceBasedGlobalExposureBoostRatio:");

  double v17 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"cast"];
  double v18 = PISemanticStyleCastToMakerNoteString(v17);

  CGFloat v19 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"intensity"];
  [v19 floatValue];
  int v21 = v20;

  double v22 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"tone"];
  [v22 floatValue];
  int v24 = v23;

  CGFloat v25 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"color"];
  [v25 floatValue];
  int v27 = v26;

  id v28 = objc_alloc(MEMORY[0x1E4F55F10]);
  LODWORD(v29) = v21;
  LODWORD(v30) = v24;
  LODWORD(v31) = v27;
  id v32 = (void *)[v28 initWithCastType:v18 castIntensity:v29 toneBias:v30 colorBias:v31];
  [v3 setInputStyle:v32];
  if (*(unsigned char *)(a1 + 192))
  {
    id v33 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"stats"];
    [v3 setInputStatisticsByStatsType:v33];

    id v34 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"xstats"];
    [v3 setInputStatisticsByStatsKey:v34];

    id v35 = [*(id *)(a1 + 96) metalTexture];
    [v3 setInputSmallLightMapTexture:v35];

    id v36 = [*(id *)(a1 + 104) metalTexture];
    [v3 setInputSmallLinearLightMapTexture:v36];
  }
  id v37 = [*(id *)(a1 + 88) objectForKeyedSubscript:@"baselineExposure"];
  [v37 floatValue];
  objc_msgSend(v3, "setBaselineExposure:");

  id v38 = [*(id *)(a1 + 112) metalTexture];
  [v3 setInputGlobalToneCurveTexture:v38];

  int v39 = [v3 process];
  if (v39)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
    }
    v40 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v42[0] = 67109120;
      v42[1] = v39;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "PISemanticStyleProcessor: process failed with error %d", (uint8_t *)v42, 8u);
    }
  }

  return v39 == 0;
}

@end