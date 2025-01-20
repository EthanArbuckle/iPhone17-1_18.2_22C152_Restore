@interface PIAutoLoopFrameNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)videoScale;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)_processImage:(id)a3 cleanRect:(CGRect)a4 cropRect:(CGRect)a5 transform:(id)a6 geometry:(id)a7;
@end

@implementation PIAutoLoopFrameNode

- (id)_processImage:(id)a3 cleanRect:(CGRect)a4 cropRect:(CGRect)a5 transform:(id)a6 geometry:(id)a7
{
  v89[4] = *MEMORY[0x1E4F143B8];
  id v77 = a7;
  id v10 = a6;
  id v11 = a3;
  [(PIAutoLoopFrameNode *)self videoScale];
  [v77 renderScale];
  NUScaleDivide();
  NUScaleToDouble();
  double v78 = v12;
  NUScaleRect();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = objc_msgSend(v11, "imageByCroppingToRect:");

  CGAffineTransformMakeTranslation(&v87, -v14, -v16);
  v76 = [v21 imageByApplyingTransform:&v87];

  v22 = [v10 objectForKeyedSubscript:@"frameTransform_homography"];

  v23 = [v22 objectAtIndexedSubscript:0];
  [v23 floatValue];
  v83.i64[0] = v24;
  v25 = [v22 objectAtIndexedSubscript:1];
  [v25 floatValue];
  v81.i64[0] = v26;
  v27 = [v22 objectAtIndexedSubscript:2];
  [v27 floatValue];
  v79.i64[0] = v28;
  v29 = [v22 objectAtIndexedSubscript:3];
  [v29 floatValue];
  __int32 v74 = v30;
  v31 = [v22 objectAtIndexedSubscript:4];
  [v31 floatValue];
  __int32 v72 = v32;
  v33 = [v22 objectAtIndexedSubscript:5];
  [v33 floatValue];
  __int32 v71 = v34;
  v35 = [v22 objectAtIndexedSubscript:6];
  [v35 floatValue];
  __int32 v70 = v36;
  v37 = [v22 objectAtIndexedSubscript:7];
  [v37 floatValue];
  __int32 v69 = v38;
  v39 = [v22 objectAtIndexedSubscript:8];
  [v39 floatValue];
  float32x4_t v40 = v83;
  v40.i32[1] = v74;
  v40.i32[2] = v70;
  float32x4_t v84 = v40;
  float32x4_t v41 = v81;
  v41.i32[1] = v72;
  v41.i32[2] = v69;
  float32x4_t v82 = v41;
  float32x4_t v42 = v79;
  v42.i32[1] = v71;
  v42.i32[2] = v43;
  float32x4_t v80 = v42;

  float v44 = 0.0 / v78;
  float v45 = v20 / v78;
  float32x4_t v46 = vmulq_n_f32(v84, v44);
  int32x4_t v47 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v46, v82, v45), v80);
  float v48 = v18 / v78;
  float32x4_t v49 = vmulq_n_f32(v84, v48);
  int32x4_t v50 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v49, v82, v45), v80);
  int32x4_t v51 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v46, v82, v44), v80);
  float64x2_t v73 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v50.i8, (float32x2_t)vdup_laneq_s32(v50, 2))), v78);
  float64x2_t v75 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_laneq_s32(v51, 2))), v78);
  int32x4_t v52 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v49, v82, v44), v80);
  float64x2_t v85 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v52.i8, (float32x2_t)vdup_laneq_s32(v52, 2))), v78);
  v88[0] = @"inputTopLeft";
  v53 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2))), v78));
  v89[0] = v53;
  v88[1] = @"inputTopRight";
  v54 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v73];
  v89[1] = v54;
  v88[2] = @"inputBottomLeft";
  v55 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v75];
  v89[2] = v55;
  v88[3] = @"inputBottomRight";
  v56 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v85];
  v89[3] = v56;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:4];
  v58 = [v76 imageByApplyingFilter:@"CIPerspectiveTransform" withInputParameters:v57];

  NUScaleRect();
  double v60 = v59;
  double v62 = v61;
  uint64_t v63 = [v77 scaledSize];
  uint64_t v65 = v64;

  v66 = objc_msgSend(v58, "imageByCroppingToRect:", v60, v62, (double)v63, (double)v65);
  CGAffineTransformMakeTranslation(&v86, -v60, -v62);
  v67 = [v66 imageByApplyingTransform:&v86];

  return v67;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    __int32 v72 = NUAssertLogger_11398();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v73 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v93 = v73;
      _os_log_error_impl(&dword_1A9680000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int32 v74 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v76 = NUAssertLogger_11398();
    BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v77)
      {
        float32x4_t v80 = dispatch_get_specific(*v74);
        float32x4_t v81 = (void *)MEMORY[0x1E4F29060];
        id v82 = v80;
        float32x4_t v83 = [v81 callStackSymbols];
        float32x4_t v84 = [v83 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v93 = v80;
        __int16 v94 = 2114;
        v95 = v84;
        _os_log_error_impl(&dword_1A9680000, v76, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v77)
    {
      double v78 = [MEMORY[0x1E4F29060] callStackSymbols];
      float32x4_t v79 = [v78 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v93 = v79;
      _os_log_error_impl(&dword_1A9680000, v76, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self settings];
  v6 = [v5 objectForKeyedSubscript:@"cleanAperture"];
  v7 = [v6 objectForKeyedSubscript:@"x"];
  [v7 floatValue];
  float v9 = v8;

  id v10 = [v6 objectForKeyedSubscript:@"y"];
  [v10 floatValue];
  float v12 = v11;

  double v13 = [v6 objectForKeyedSubscript:@"w"];
  [v13 floatValue];
  float v15 = v14;

  double v16 = [v6 objectForKeyedSubscript:@"h"];
  [v16 floatValue];
  float v18 = v17;

  double v19 = [v5 objectForKeyedSubscript:@"loopRecipe_stabCropRect"];
  double v20 = [v19 objectForKeyedSubscript:@"origin_x"];
  [v20 floatValue];
  float v22 = v21;

  v23 = [v19 objectForKeyedSubscript:@"origin_y"];
  [v23 floatValue];
  float v25 = v24;

  uint64_t v26 = [v19 objectForKeyedSubscript:@"width"];
  [v26 floatValue];
  float v28 = v27;

  v29 = [v19 objectForKeyedSubscript:@"height"];
  [v29 floatValue];
  float v31 = v30;

  __int32 v32 = [(NURenderNode *)self outputImageGeometry:a3];
  if (!v32)
  {
    float32x4_t v46 = 0;
    goto LABEL_28;
  }
  double v33 = v9;
  double v34 = v12;
  double v35 = v15;
  double v36 = v18;
  double v37 = v22;
  double v38 = v25;
  double v39 = v28;
  double v40 = v31;
  float32x4_t v41 = [v5 objectForKeyedSubscript:@"loopFrameData_frameTransforms"];
  if ([v41 count] == 1)
  {
    float32x4_t v42 = [(NURenderNode *)self inputs];
    __int32 v43 = [v42 objectForKeyedSubscript:@"primary"];

    float v44 = [v43 outputImage:a3];
    if (v44)
    {
      float v45 = [v41 objectAtIndexedSubscript:0];
      float32x4_t v46 = -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v44, v45, v32, v33, v34, v35, v36, v37, v38, v39, v40);

      if (!v46)
      {
        *a3 = [MEMORY[0x1E4F7A438] errorWithCode:7 reason:@"Could not produce the output image from input" object:v44];
      }
    }
    else
    {
      float32x4_t v46 = 0;
    }

LABEL_26:
    goto LABEL_27;
  }
  if ([v41 count] == 2)
  {
    int32x4_t v47 = [(NURenderNode *)self inputs];
    __int32 v43 = [v47 objectForKeyedSubscript:@"primary"];

    if (v43)
    {
      v90 = [v43 outputImage:a3];
      if (v90)
      {
        float v48 = [(NURenderNode *)self inputs];
        float32x4_t v49 = [v48 objectForKeyedSubscript:@"secondary"];

        int32x4_t v50 = v49;
        if (v49)
        {
          int32x4_t v51 = [v49 outputImage:a3];
          if (v51)
          {
            CGAffineTransform v87 = v50;
            int32x4_t v52 = [v41 objectAtIndexedSubscript:0];
            v89 = -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v90, v52, v32, v33, v34, v35, v36, v37, v38, v39, v40);

            v53 = [v41 objectAtIndexedSubscript:1];
            CGAffineTransform v86 = v51;
            uint64_t v54 = -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v51, v53, v32, v33, v34, v35, v36, v37, v38, v39, v40);

            v88 = +[PIAutoLoopKernels alphaCompositingKernel];
            v55 = [v41 objectAtIndexedSubscript:0];
            v56 = [v55 objectForKeyedSubscript:@"frameTransform_blend_alpha"];
            [v56 floatValue];
            int v58 = v57;

            [v89 extent];
            double v60 = v59;
            double v62 = v61;
            double v64 = v63;
            double v66 = v65;
            v91[0] = v89;
            v91[1] = v54;
            float64x2_t v85 = (void *)v54;
            LODWORD(v59) = v58;
            v67 = [NSNumber numberWithFloat:v59];
            v91[2] = v67;
            v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];
            float32x4_t v46 = objc_msgSend(v88, "applyWithExtent:arguments:", v68, v60, v62, v64, v66);

            if (!v46)
            {
              *a3 = [MEMORY[0x1E4F7A438] errorWithCode:7 reason:@"Could not produce the output image from input" object:v90];
            }

            int32x4_t v51 = v86;
            int32x4_t v50 = v87;
          }
          else
          {
            float32x4_t v46 = 0;
          }
        }
        else
        {
          [MEMORY[0x1E4F7A438] errorWithCode:3 reason:@"missing secondary input" object:v5];
          float32x4_t v46 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        float32x4_t v46 = 0;
      }
    }
    else
    {
      __int32 v69 = (void *)MEMORY[0x1E4F7A438];
      __int32 v70 = [(NURenderNode *)self description];
      *a3 = [v69 errorWithCode:3 reason:@"missing primary input" object:v70];

      float32x4_t v46 = 0;
    }
    goto LABEL_26;
  }
  [MEMORY[0x1E4F7A438] invalidError:@"Invalid frame instruction" object:v5];
  float32x4_t v46 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
  return v46;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    float v18 = NUAssertLogger_11398();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      double v34 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v22 = NUAssertLogger_11398();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific(*v20);
        float v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        float v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v34 = v26;
        __int16 v35 = 2114;
        double v36 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      float v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v34 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  v6 = [v5 objectForKeyedSubscript:@"primary"];

  id v32 = 0;
  v7 = [v6 outputImageGeometry:&v32];
  id v8 = v32;
  if (v7)
  {
    uint64_t v9 = [v7 orientation];
    uint64_t v10 = [v7 renderScale];
    uint64_t v12 = v11;
    [(PIAutoLoopFrameNode *)self videoScale];
    double v13 = [(NURenderNode *)self settings];
    float v14 = PIAutoLoopRecipeComputeOutputGeometry(v13);

    id v15 = objc_alloc(MEMORY[0x1E4F7A508]);
    if (v14) {
      [v14 extent];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    double v16 = objc_msgSend(v15, "initWithExtent:renderScale:orientation:", v31, v10, v12, v9);
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get input geometry" object:self underlyingError:v8];
    double v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_evaluateImageProperties:(id *)a3
{
  v4 = [(NURenderNode *)self inputs];
  v5 = [v4 objectForKeyedSubscript:@"primary"];

  v6 = [v5 imageProperties:a3];

  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)videoScale
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"videoScale"];
  uint64_t v4 = NUScaleFromValue();
  int64_t v6 = v5;

  int64_t v7 = v4;
  int64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

@end