@interface NUMaskTransformer
+ (BOOL)isMaskValid:(id)a3;
+ (CGImage)createImageIsolatedToMask:(id)a3 mediaView:(id)a4;
+ (CGImage)createImageIsolatedToMask:(id)a3 source:(id)a4 geometry:(id)a5 composition:(id)a6;
+ (id)applyRenderedOutputGeometryFromSpace:(id)a3 toInputImage:(id)a4 geometry:(id)a5 composition:(id)a6 error:(id *)a7;
+ (id)imageForComposition:(id)a3 size:(CGSize)a4;
+ (id)maskedImageBackgroundImage:(id)a3 source:(id)a4;
+ (id)transformedImage:(id)a3 forComposition:(id)a4 imageSize:(CGSize)a5 error:(id *)a6;
+ (void)imageForComposition:(id)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation NUMaskTransformer

+ (id)transformedImage:(id)a3 forComposition:(id)a4 imageSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id specific = a3;
  v12 = a4;
  if (!a6)
  {
    v37 = NUAssertLogger_153();
    v30 = &off_217C25000;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error");
      v38 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v38;
      _os_log_error_impl(&dword_217C0A000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    a6 = (id *)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    v13 = NUAssertLogger_153();
    BOOL v39 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        id specific = dispatch_get_specific(*a6);
        v40 = (void *)MEMORY[0x263F08B88];
        v30 = (uint64_t (*__ptr32 *)())specific;
        a6 = [v40 callStackSymbols];
        v6 = [a6 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = (id *)specific;
        __int16 v44 = 2114;
        v45 = v6;
        _os_log_error_impl(&dword_217C0A000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      id specific = [MEMORY[0x263F08B88] callStackSymbols];
      a6 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = a6;
      _os_log_error_impl(&dword_217C0A000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_44;
  }
  v13 = v12;
  if (!v12)
  {
    v23 = (void *)MEMORY[0x263F58600];
    v24 = @"Nil composition";
    id v25 = 0;
    goto LABEL_23;
  }
  [specific extent];
  if (v14 == 0.0
    || v15 == 0.0
    || ((double v16 = *MEMORY[0x263F5D550], v17 = *(double *)(MEMORY[0x263F5D550] + 8), v14 == *MEMORY[0x263F5D550])
      ? (BOOL v18 = v15 == v17)
      : (BOOL v18 = 0),
        v18))
  {
    v23 = (void *)MEMORY[0x263F58600];
    v24 = @"Mask image has empty size";
LABEL_21:
    id v25 = specific;
LABEL_23:
    [v23 invalidError:v24 object:v25];
    v26 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (v14 > width || v15 > height)
  {
    CGAffineTransformMakeScale(&v41, width / v14, height / v15);
    uint64_t v19 = [specific imageByApplyingTransform:&v41];

    id specific = (id)v19;
  }
  [specific extent];
  if (v20 == 0.0 || v21 == 0.0 || (v21 == v17 ? (BOOL v22 = v20 == v16) : (BOOL v22 = 0), v22)) {
    double v28 = 0.0;
  }
  else {
    double v28 = v20 * v21;
  }
  uint64_t v29 = (uint64_t)v28;
  if ((uint64_t)v28 <= 0)
  {
    v23 = (void *)MEMORY[0x263F58600];
    v24 = @"Scaled mask image has empty size";
    goto LABEL_21;
  }
  v30 = (uint64_t (*__ptr32 *)())[objc_alloc(MEMORY[0x263F58618]) initWithComposition:v13];
  v31 = (void *)[objc_alloc(MEMORY[0x263F58660]) initWithTargetPixelCount:v29];
  [v30 setScalePolicy:v31];

  v32 = [v30 submitSynchronous:a6];
  v6 = v32;
  if (!v32)
  {
    if (*MEMORY[0x263F586F0] == -1)
    {
LABEL_32:
      v35 = *MEMORY[0x263F586F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586F8], OS_LOG_TYPE_ERROR))
      {
        v36 = (id *)*a6;
        *(_DWORD *)buf = 138412290;
        v43 = v36;
        _os_log_error_impl(&dword_217C0A000, v35, OS_LOG_TYPE_ERROR, "Geometry request failed: %@", buf, 0xCu);
      }
      v26 = 0;
      goto LABEL_35;
    }
LABEL_44:
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_162);
    goto LABEL_32;
  }
  v33 = [v32 geometry];
  v34 = +[NUMaskTransformer applyRenderedOutputGeometryFromSpace:@"/masterSpace" toInputImage:specific geometry:v33 composition:v13 error:a6];

  id specific = v34;
  v26 = specific;
LABEL_35:

LABEL_24:

  return v26;
}

+ (void)imageForComposition:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v29[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  v10 = (void *)[objc_alloc(MEMORY[0x263F58630]) initWithComposition:v8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = (id)objc_opt_new();
  if ((uint64_t)(width * height) <= 0)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = @"Size is negative or zero";
    v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v13 = [v11 errorWithDomain:@"NUMaskTransformerErrorDomain" code:2 userInfo:v12];

    [(id)v23[5] setError:v13];
    v9[2](v9, v23[5]);
  }
  double v14 = (void *)[objc_alloc(MEMORY[0x263F58660]) initWithTargetPixelCount:(uint64_t)(width * height)];
  [v10 setScalePolicy:v14];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__NUMaskTransformer_imageForComposition_size_completion___block_invoke;
  v16[3] = &unk_2642C2EF0;
  BOOL v18 = v20;
  uint64_t v19 = &v22;
  double v15 = v9;
  id v17 = v15;
  [v10 submit:v16];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
}

void __57__NUMaskTransformer_imageForComposition_size_completion___block_invoke(void *a1, void *a2)
{
  id v11 = 0;
  v3 = [a2 result:&v11];
  id v4 = v11;
  v5 = (void *)MEMORY[0x263F00650];
  v6 = [v3 buffer];
  uint64_t v7 = objc_msgSend(v5, "imageWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  uint64_t v8 = *(void *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [v3 geometry];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setError:v4];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setImage:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setGeometry:v10];
  (*(void (**)(void))(a1[4] + 16))();
}

+ (id)imageForComposition:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F58630]) initWithComposition:v6];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = (id)objc_opt_new();
  if ((uint64_t)(width * height) > 0)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F58660]) initWithTargetPixelCount:(uint64_t)(width * height)];
    [v7 setScalePolicy:v8];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy_;
    v28[4] = __Block_byref_object_dispose_;
    id v29 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __46__NUMaskTransformer_imageForComposition_size___block_invoke;
    uint64_t v24 = &unk_2642C2EC8;
    v26 = v28;
    id v27 = &v30;
    v10 = v9;
    id v25 = v10;
    [v7 submit:&v21];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v10, v11);
    v12 = objc_msgSend((id)v31[5], "error", v21, v22, v23, v24);
    if (!v12)
    {
      v12 = [(id)v31[5] image];
      if (!v12)
      {
        id v17 = [(id)v31[5] geometry];
        BOOL v18 = v17 == 0;

        if (!v18) {
          goto LABEL_5;
        }
        uint64_t v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F08320];
        v37 = @"Timeout reached";
        double v20 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v12 = [v19 errorWithDomain:@"NUMaskTransformerErrorDomain" code:1 userInfo:v20];

        [(id)v31[5] setError:v12];
      }
    }

LABEL_5:
    id v13 = (id)v31[5];

    _Block_object_dispose(v28, 8);
    goto LABEL_7;
  }
  double v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v38 = *MEMORY[0x263F08320];
  v39[0] = @"Size is negative or zero";
  double v15 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v8 = [v14 errorWithDomain:@"NUMaskTransformerErrorDomain" code:2 userInfo:v15];

  [(id)v31[5] setError:v8];
  id v13 = (id)v31[5];
LABEL_7:

  _Block_object_dispose(&v30, 8);

  return v13;
}

void __46__NUMaskTransformer_imageForComposition_size___block_invoke(uint64_t a1, void *a2)
{
  id v11 = 0;
  v3 = [a2 result:&v11];
  id v4 = v11;
  v5 = (void *)MEMORY[0x263F00650];
  id v6 = [v3 buffer];
  uint64_t v7 = objc_msgSend(v5, "imageWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [v3 geometry];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setError:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setImage:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setGeometry:v10];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isMaskValid:(id)a3
{
  [a3 extent];
  if (v3 < 0.0 && v4 < 0.0) {
    return 0;
  }
  if (v6 > 0.0) {
    return 1;
  }
  return v5 > 0.0;
}

+ (id)maskedImageBackgroundImage:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 extent];
  double v8 = v7;
  [v6 extent];
  CGFloat v10 = v8 / v9;
  [v5 extent];
  double v12 = v11;
  [v6 extent];
  CGAffineTransformMakeScale(&v18, v10, v12 / v13);
  double v14 = [v6 imageByApplyingTransform:&v18];

  double v15 = [MEMORY[0x263F00640] blendWithAlphaMaskFilter];
  [v15 setBackgroundImage:v14];
  [v15 setMaskImage:v14];
  [v15 setInputImage:v5];

  double v16 = [v15 outputImage];

  return v16;
}

+ (id)applyRenderedOutputGeometryFromSpace:(id)a3 toInputImage:(id)a4 geometry:(id)a5 composition:(id)a6 error:(id *)a7
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!a7)
  {
    v82 = NUAssertLogger_153();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v83 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error");
      *(_DWORD *)buf = 138543362;
      v107 = v83;
      _os_log_error_impl(&dword_217C0A000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v84 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    v86 = NUAssertLogger_153();
    BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v87)
      {
        v90 = dispatch_get_specific(*v84);
        v91 = (void *)MEMORY[0x263F08B88];
        id v92 = v90;
        v93 = [v91 callStackSymbols];
        v94 = [v93 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v107 = v90;
        __int16 v108 = 2114;
        v109 = v94;
        _os_log_error_impl(&dword_217C0A000, v86, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v87)
    {
      v88 = [MEMORY[0x263F08B88] callStackSymbols];
      v89 = [v88 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v107 = v89;
      _os_log_error_impl(&dword_217C0A000, v86, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v15 = v14;
  if (v13)
  {
    double v16 = [v13 transformWithSourceSpace:v11 destinationSpace:@"/Image" error:a7];
    if (v16)
    {
      id v17 = (void *)[objc_alloc(MEMORY[0x263F58618]) initWithComposition:v15];
      CGAffineTransform v18 = [MEMORY[0x263F58680] stopAtTagFilter:v11];
      v105 = v18;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v105 count:1];
      [v17 setPipelineFilters:v19];

      id v20 = objc_alloc(MEMORY[0x263F58660]);
      [v12 extent];
      double v22 = v21;
      [v12 extent];
      uint64_t v24 = (void *)[v20 initWithTargetPixelCount:(uint64_t)(v22 * v23)];
      [v17 setScalePolicy:v24];

      id v25 = [v17 submitSynchronous:a7];
      if (v25)
      {
        v100 = v25;
        v97 = [v25 geometry];
        [v97 renderScale];
        NUScaleToDouble();
        double v27 = v26;
        [v12 extent];
        double v95 = 1.0 / v27;
        NUScaleRect();
        double v29 = v28;
        double v31 = v30;
        objc_msgSend(v16, "transformPoint:", 0.0, v30);
        double v33 = v32;
        double v35 = v34;
        objc_msgSend(v16, "transformPoint:", v29, v31);
        double v37 = v36;
        double v39 = v38;
        objc_msgSend(v16, "transformPoint:", 0.0, 0.0);
        double v41 = v40;
        double v43 = v42;
        objc_msgSend(v16, "transformPoint:", v29, 0.0);
        double v44 = v27 * v33;
        double v45 = v27 * v35;
        double v46 = v27 * v37;
        double v47 = v27 * v39;
        double v48 = v27 * v41;
        double v49 = v27 * v43;
        v50 = (void *)MEMORY[0x263F00640];
        double v52 = v27 * v51;
        v103[0] = @"inputTopLeft";
        v99 = v15;
        double v54 = v27 * v53;
        v55 = [MEMORY[0x263F00680] vectorWithX:v44 Y:v45];
        v104[0] = v55;
        v103[1] = @"inputTopRight";
        v56 = [MEMORY[0x263F00680] vectorWithX:v46 Y:v47];
        v104[1] = v56;
        v103[2] = @"inputBottomRight";
        [MEMORY[0x263F00680] vectorWithX:v52 Y:v54];
        v57 = v98 = v17;
        v104[2] = v57;
        v103[3] = @"inputBottomLeft";
        v58 = [MEMORY[0x263F00680] vectorWithX:v48 Y:v49];
        v103[4] = *MEMORY[0x263F00968];
        v104[3] = v58;
        v104[4] = v12;
        v59 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:5];
        v96 = [v50 filterWithName:@"CIPerspectiveTransform" withInputParameters:v59];

        v60 = [v96 outputImage];
        [v13 renderScale];
        NUScaleToDouble();
        double v62 = v95 * v61;
        [v97 scaledExtent];
        double v64 = v63;
        [v97 scaledExtent];
        double v66 = v64 / v65;
        [v12 extent];
        double v69 = v67 / v68 / v66;
        uint64_t v70 = [v97 scaledSize];
        [v97 scaledSize];
        LODWORD(v57) = v70 <= v71;
        uint64_t v72 = [v13 scaledSize];
        [v13 scaledSize];
        if (v57 == v72 > v73) {
          double v69 = 1.0 / v69;
        }
        v101[0] = @"inputScale";
        v74 = [NSNumber numberWithDouble:v62];
        v101[1] = @"inputAspectRatio";
        v102[0] = v74;
        v75 = [NSNumber numberWithDouble:v69];
        v102[1] = v75;
        v76 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
        v77 = [v60 imageByApplyingFilter:@"CILanczosScaleTransform" withInputParameters:v76];

        [v13 scaledExtent];
        v78 = objc_msgSend(v77, "imageByCroppingToRect:");

        v79 = [MEMORY[0x263F00640] colorClampFilter];
        [v79 setInputImage:v78];
        v80 = [v79 outputImage];

        double v15 = v99;
        id v17 = v98;

        id v25 = v100;
      }
      else
      {
        v80 = 0;
      }
    }
    else
    {
      v80 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F58600] invalidError:@"Nil geometry passed to NUMaskTransformer" object:0];
    v80 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v80;
}

+ (CGImage)createImageIsolatedToMask:(id)a3 mediaView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v6 _geometry];
  double v9 = [v6 snapshotImage];
  CGFloat v10 = [v6 composition];

  id v11 = (CGImage *)[a1 createImageIsolatedToMask:v7 source:v9 geometry:v8 composition:v10];
  return v11;
}

+ (CGImage)createImageIsolatedToMask:(id)a3 source:(id)a4 geometry:(id)a5 composition:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = [a3 imageByApplyingFilter:@"CIColorInvert"];
  id v14 = [v13 imageByApplyingFilter:@"CIMaskToAlpha"];
  id v22 = 0;
  double v15 = [a1 applyRenderedOutputGeometryFromSpace:@"/masterSpace" toInputImage:v14 geometry:v12 composition:v11 error:&v22];

  id v16 = v22;
  if (v15)
  {
    id v17 = [a1 maskedImageBackgroundImage:v15 source:v10];
    CGAffineTransform v18 = [MEMORY[0x263F00628] context];
    [v17 extent];
    uint64_t v19 = (CGImage *)objc_msgSend(v18, "createCGImage:fromRect:", v17);
  }
  else
  {
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_162);
    }
    id v20 = *MEMORY[0x263F586F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586F8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_error_impl(&dword_217C0A000, v20, OS_LOG_TYPE_ERROR, "Error applying rendered geometry: %@", buf, 0xCu);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

@end